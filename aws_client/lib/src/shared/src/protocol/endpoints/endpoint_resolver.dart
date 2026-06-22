class EndpointResolutionException implements Exception {
  final String message;

  EndpointResolutionException(this.message);

  @override
  String toString() => 'EndpointResolutionException: $message';
}

class EndpointAuthScheme {
  final String name;
  final String? signingName;
  final String? signingRegion;
  final List<String>? signingRegionSet;
  final bool? disableDoubleEncoding;

  const EndpointAuthScheme({
    required this.name,
    this.signingName,
    this.signingRegion,
    this.signingRegionSet,
    this.disableDoubleEncoding,
  });
}

class ResolvedEndpoint {
  final String url;
  final List<EndpointAuthScheme> authSchemes;
  final Map<String, List<String>> headers;

  const ResolvedEndpoint({
    required this.url,
    this.authSchemes = const [],
    this.headers = const {},
  });

  // Preferred scheme first.
  EndpointAuthScheme? get authScheme =>
      authSchemes.isEmpty ? null : authSchemes.first;
}
