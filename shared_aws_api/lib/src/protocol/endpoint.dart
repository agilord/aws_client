import 'package:meta/meta.dart';
import 'endpoint_config_data.dart' as config;
import 'shared.dart';

class Endpoint {
  final String service;
  final String url;
  final String signingRegion;
  final String signatureVersion;

  Endpoint(
      {@required this.service,
      @required this.url,
      @required this.signingRegion,
      String signatureVersion})
      : assert(service != null),
        assert(url != null),
        assert(signingRegion != null),
        signatureVersion = signatureVersion ?? 'v4';

  static Endpoint fromConfig(String service, {String region}) {
    assert(service != null);

    final regionConfig = _findRegionConfig(service, region);
    final urlPattern =
        regionConfig?.endpoint ?? '{service}.{region}.amazonaws.com';

    if (urlPattern.contains('{region}') && region == null) {
      throw ArgumentError(
          'Region must not be null when the service is not a global service.');
    }

    String signingRegion;
    if (regionConfig != null && regionConfig.globalEndpoint) {
      signingRegion = regionConfig.signingRegion ?? 'us-east-1';
    }

    var url = urlPattern.replaceAll('{service}', service);
    if (region != null) {
      url = url.replaceAll('{region}', region);
    }
    assert(!url.contains('{'), 'Url pattern is not correctly transformed');

    if (!url.contains('://')) {
      url = 'https://$url';
    }

    return Endpoint(
      service: service,
      url: url,
      signingRegion: signingRegion ?? region,
      signatureVersion: regionConfig?.signatureVersion ?? 'v4',
    );
  }

  static Endpoint forProtocol(
      {String service, String region, String endpointUrl}) {
    if (service == null) {
      ArgumentError.checkNotNull(endpointUrl, 'endpointUrl');
    }

    if (endpointUrl != null) {
      final endpointUri = Uri.parse(endpointUrl);
      service ??= extractService(endpointUri);
      region ??= extractRegion(endpointUri);
      return Endpoint(
          service: service, url: endpointUrl, signingRegion: region);
    } else {
      return Endpoint.fromConfig(service, region: region);
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

class RegionConfig {
  final String endpoint;
  final bool globalEndpoint;
  final String signatureVersion;
  final String signingRegion;

  RegionConfig(
      {@required this.endpoint,
      bool globalEndpoint,
      this.signatureVersion,
      this.signingRegion})
      : globalEndpoint = globalEndpoint ?? false;
}

RegionConfig _findRegionConfig(String service, String region) {
  final keys = _derivedKeys(service, region);
  for (var key in keys) {
    final regionConfig = config.rules[key];
    if (regionConfig != null) {
      return regionConfig;
    }
  }
  return null;
}

List<String> _derivedKeys(String endpointPrefix, String region) {
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

String _generateRegionPrefix(String region) {
  if (region == null) return null;

  final parts = region.split('-');
  if (parts.length < 3) return null;
  return '${parts.getRange(0, parts.length - 2).join('-')}-*';
}
