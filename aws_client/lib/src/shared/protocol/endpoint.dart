import 'endpoint_config_data.dart' as config;
import 'shared.dart';

class ServiceMetadata {
  final String endpointPrefix;
  final String? signingName;

  const ServiceMetadata({required this.endpointPrefix, this.signingName});

  @override
  bool operator ==(Object other) {
    return other is ServiceMetadata &&
        other.endpointPrefix == endpointPrefix &&
        other.signingName == signingName;
  }

  @override
  int get hashCode => endpointPrefix.hashCode ^ signingName.hashCode;

  @override
  String toString() =>
      'ServiceMetadata(endpointPrefix: $endpointPrefix, signingName: $signingName)';
}

/// A data class that holds the URL and signing information to communicate
/// with an AWS service.
/// This is an internal class used by the different protocols.
class Endpoint {
  final ServiceMetadata service;

  /// The URL to use to communicate with AWS.
  final String url;

  /// The region to use in the request signature.
  final String signingRegion;

  /// The version of the algorithm to sign the request.
  final String signatureVersion;

  Endpoint(
      {required this.service,
      required this.url,
      required this.signingRegion,
      String? signatureVersion})
      : signatureVersion = signatureVersion ?? 'v4';

  /// Creates a `Endpoint` using only the service prefix and an optional region
  /// The other information will be inferred from the global configuration rules.
  static Endpoint fromConfig(ServiceMetadata service, {String? region}) {
    final regionConfig = _findRegionConfig(service, region);
    final urlPattern =
        regionConfig?.endpoint ?? '{service}.{region}.amazonaws.com';

    if (urlPattern.contains('{region}') && region == null) {
      throw ArgumentError(
          'Region must not be null when the service is not a global service.');
    }

    String? signingRegion;
    if (regionConfig != null && regionConfig.globalEndpoint) {
      signingRegion = regionConfig.signingRegion ?? 'us-east-1';
    }

    var url = urlPattern.replaceAll('{service}', service.endpointPrefix);
    if (region != null) {
      url = url.replaceAll('{region}', region);
    }
    assert(
        !url.contains('{'), 'Url pattern is not correctly transformed ($url)');

    if (!url.contains('://')) {
      url = 'https://$url';
    }

    return Endpoint(
      service: service,
      url: url,
      signingRegion: signingRegion ?? region!,
      signatureVersion: regionConfig?.signatureVersion ?? 'v4',
    );
  }

  /// Creates a `Endpoint` from either a user-provided custom endpointUrl or
  /// by inferring the configuration from the service prefix.
  static Endpoint forProtocol(
      {ServiceMetadata? service, String? region, String? endpointUrl}) {
    if (service == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }

    if (endpointUrl != null) {
      final endpointUri = Uri.parse(endpointUrl);
      service ??= ServiceMetadata(endpointPrefix: extractService(endpointUri));
      region ??= extractRegion(endpointUri);
      return Endpoint(
          service: service, url: endpointUrl, signingRegion: region);
    } else {
      return Endpoint.fromConfig(service!, region: region);
    }
  }

  @override
  bool operator ==(Object other) {
    return other is Endpoint &&
        other.service == service &&
        other.url == url &&
        other.signingRegion == signingRegion &&
        other.signatureVersion == signatureVersion;
  }

  @override
  int get hashCode =>
      service.hashCode ^
      url.hashCode ^
      signingRegion.hashCode ^
      signatureVersion.hashCode;

  @override
  String toString() => 'Endpoint(service: $service, url: $url, '
      'signingRegion: $signingRegion, signatureVersion: $signatureVersion)';
}

/// The internal data-class used in the generated configuration file.
/// It holds the url pattern to use for each services.
class RegionConfig {
  /// The URL pattern for the service.
  /// The pattern can contains a "{service}" and "{region}" placeholder (ie. {service}.{region}.amazonaws.com)
  final String endpoint;
  final bool globalEndpoint;
  final String? signatureVersion;
  final String? signingRegion;

  RegionConfig(
      {required this.endpoint,
      bool? globalEndpoint,
      this.signatureVersion,
      this.signingRegion})
      : globalEndpoint = globalEndpoint ?? false;
}

RegionConfig? _findRegionConfig(ServiceMetadata service, String? region) {
  final keys = _derivedKeys(service.endpointPrefix, region);
  for (var key in keys) {
    final regionConfig = config.rules[key];
    if (regionConfig != null) {
      return regionConfig;
    }
  }
  return null;
}

List<String> _derivedKeys(String endpointPrefix, String? region) {
  final regionPrefix = _generateRegionPrefix(region);

  return [
    [region, endpointPrefix],
    [regionPrefix, endpointPrefix],
    [region, '*'],
    [regionPrefix, '*'],
    ['*', endpointPrefix],
    ['*', '*']
  ].where((l) => l.every((e) => e != null)).map((l) => l.join('/')).toList();
}

String? _generateRegionPrefix(String? region) {
  if (region == null) return null;

  final parts = region.split('-');
  if (parts.length < 3) return null;
  return '${parts.getRange(0, parts.length - 2).join('-')}-*';
}
