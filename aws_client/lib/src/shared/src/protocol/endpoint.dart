import 'endpoints/endpoint_resolver.dart';
import 'shared.dart';

export 'endpoints/endpoint_resolver.dart';

class ServiceMetadata {
  final String endpointPrefix;
  final String? signingName;

  const ServiceMetadata({
    required this.endpointPrefix,
    this.signingName,
  });

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

  Endpoint({
    required this.service,
    required this.url,
    required this.signingRegion,
  });

  static Endpoint fromResolved(
    ResolvedEndpoint resolved, {
    required ServiceMetadata service,
    String? region,
  }) {
    final authScheme = resolved.authScheme;
    if (authScheme?.name == 'sigv4a') {
      throw UnsupportedError(
          'The resolved endpoint for "${service.endpointPrefix}" requires '
          'SigV4A signing, which is not yet supported by this client.');
    }
    final signingRegionSet = authScheme?.signingRegionSet;
    final signingRegion = authScheme?.signingRegion ??
        (signingRegionSet != null && signingRegionSet.isNotEmpty
            ? signingRegionSet.first
            : null) ??
        region;
    if (signingRegion == null) {
      throw ArgumentError(
          'Region must not be null when the service is not a global service.');
    }

    final resolvedSigningName = authScheme?.signingName;
    final effectiveService = (resolvedSigningName != null &&
            resolvedSigningName != service.signingName)
        ? ServiceMetadata(
            endpointPrefix: service.endpointPrefix,
            signingName: resolvedSigningName)
        : service;

    return Endpoint(
      service: effectiveService,
      url: resolved.url,
      signingRegion: signingRegion,
    );
  }

  static Endpoint forProtocol(
      {ServiceMetadata? service, String? region, String? endpointUrl}) {
    if (endpointUrl != null) {
      final uri = Uri.parse(endpointUrl);
      final signingRegion = region ?? tryExtractRegion(uri);
      if (signingRegion == null) {
        throw ArgumentError(
            'Could not infer a signing region from endpointUrl "$endpointUrl". '
            'Pass an explicit region when using a custom endpoint.');
      }
      return Endpoint(
        service:
            service ?? ServiceMetadata(endpointPrefix: extractService(uri)),
        url: endpointUrl,
        signingRegion: signingRegion,
      );
    }
    ArgumentError.checkNotNull(service, 'service');
    if (region == null) {
      throw ArgumentError(
          'Region must not be null when the service is not a global service.');
    }
    return Endpoint(
      service: service!,
      url: 'https://${service.endpointPrefix}.$region.amazonaws.com',
      signingRegion: region,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Endpoint &&
        other.service == service &&
        other.url == url &&
        other.signingRegion == signingRegion;
  }

  @override
  int get hashCode => service.hashCode ^ url.hashCode ^ signingRegion.hashCode;

  @override
  String toString() => 'Endpoint(service: $service, url: $url, '
      'signingRegion: $signingRegion)';
}
