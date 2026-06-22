import 'package:aws_client/src/shared/src/protocol/endpoint.dart';
import 'package:test/test.dart';

void main() {
  test('fromResolved extracts the signing region and name', () {
    final ep = Endpoint.fromResolved(
      const ResolvedEndpoint(
        url: 'https://example.eu-west-1.amazonaws.com',
        authSchemes: [
          EndpointAuthScheme(
              name: 'sigv4',
              signingName: 'example',
              signingRegion: 'eu-west-1'),
        ],
      ),
      service: ServiceMetadata(endpointPrefix: 'example'),
      region: 'eu-west-1',
    );
    expect(ep.url, 'https://example.eu-west-1.amazonaws.com');
    expect(ep.signingRegion, 'eu-west-1');
    expect(ep.service.signingName, 'example');
  });

  test('fromResolved falls back to the passed region without an auth scheme',
      () {
    final ep = Endpoint.fromResolved(
      const ResolvedEndpoint(url: 'https://example.amazonaws.com'),
      service: ServiceMetadata(endpointPrefix: 'example'),
      region: 'us-east-1',
    );
    expect(ep.signingRegion, 'us-east-1');
  });

  test('fromResolved uses the first signingRegionSet entry', () {
    final ep = Endpoint.fromResolved(
      const ResolvedEndpoint(
        url: 'https://example.amazonaws.com',
        authSchemes: [
          EndpointAuthScheme(name: 'sigv4', signingRegionSet: ['us-east-1']),
        ],
      ),
      service: ServiceMetadata(endpointPrefix: 'example'),
    );
    expect(ep.signingRegion, 'us-east-1');
  });

  test('fromResolved throws on unsupported SigV4A signing', () {
    expect(
      () => Endpoint.fromResolved(
        const ResolvedEndpoint(
          url: 'https://example.amazonaws.com',
          authSchemes: [
            EndpointAuthScheme(name: 'sigv4a', signingRegionSet: ['*']),
          ],
        ),
        service: ServiceMetadata(endpointPrefix: 'example'),
        region: 'us-east-1',
      ),
      throwsA(isA<UnsupportedError>()),
    );
  });

  test('forProtocol uses a custom endpointUrl', () {
    final ep = Endpoint.forProtocol(
      service: ServiceMetadata(endpointPrefix: 'example'),
      region: 'eu-west-1',
      endpointUrl: 'https://localhost:4566',
    );
    expect(ep.url, 'https://localhost:4566');
    expect(ep.signingRegion, 'eu-west-1');
  });

  test('forProtocol builds the default regional pattern', () {
    final ep = Endpoint.forProtocol(
      service: ServiceMetadata(endpointPrefix: 'example'),
      region: 'us-east-1',
    );
    expect(ep.url, 'https://example.us-east-1.amazonaws.com');
    expect(ep.signingRegion, 'us-east-1');
  });

  test('forProtocol infers the service from a custom endpointUrl', () {
    final ep = Endpoint.forProtocol(
      endpointUrl: 'https://s3.eu-central-1.amazonaws.com',
    );
    expect(ep.service.endpointPrefix, 's3');
    expect(ep.signingRegion, 'eu-central-1');
  });
}
