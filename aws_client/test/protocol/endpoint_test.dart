import 'package:aws_client/src/shared/protocol/endpoint.dart';
import 'package:test/test.dart';

void main() {
  group('Endpoint.fromConfig', () {
    test('Create url for service', () {
      expect(
        Endpoint.fromConfig(ServiceMetadata(endpointPrefix: 's3'),
            region: 'eu-west-1'),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 's3'),
          url: 'https://s3.eu-west-1.amazonaws.com',
          signingRegion: 'eu-west-1',
          signatureVersion: 's3',
        ),
      );
      expect(
        Endpoint.fromConfig(ServiceMetadata(endpointPrefix: 'a4b'),
            region: 'af-south-1'),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 'a4b'),
          url: 'https://a4b.af-south-1.amazonaws.com',
          signingRegion: 'af-south-1',
          signatureVersion: 'v4',
        ),
      );
      expect(
        Endpoint.fromConfig(ServiceMetadata(endpointPrefix: 'lambda'),
            region: 'us-west-2'),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 'lambda'),
          url: 'https://lambda.us-west-2.amazonaws.com',
          signingRegion: 'us-west-2',
          signatureVersion: 'v4',
        ),
      );
    });

    test('Throw if region is not provided when required', () {
      expect(
        () => Endpoint.fromConfig(ServiceMetadata(endpointPrefix: 's3')),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Infer signing region for global services', () {
      expect(
        Endpoint.fromConfig(ServiceMetadata(endpointPrefix: 'iam')),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 'iam'),
          url: 'https://iam.amazonaws.com',
          signingRegion: 'us-east-1',
          signatureVersion: 'v4',
        ),
      );
    });

    test('Use correct signing region for global services', () {
      expect(
        Endpoint.fromConfig(ServiceMetadata(endpointPrefix: 'iam'),
            region: 'eu-west-1'),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 'iam'),
          url: 'https://iam.amazonaws.com',
          signingRegion: 'us-east-1',
          signatureVersion: 'v4',
        ),
      );
    });
  });
  group('Endpoint.forProtocol', () {
    test('Infer endpoint', () {
      expect(
        Endpoint.forProtocol(service: ServiceMetadata(endpointPrefix: 'iam')),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 'iam'),
          url: 'https://iam.amazonaws.com',
          signingRegion: 'us-east-1',
          signatureVersion: 'v4',
        ),
      );
    });
    test('Custom endpointUrl', () {
      expect(
        Endpoint.forProtocol(
            service: ServiceMetadata(endpointPrefix: 'iam'),
            endpointUrl: 'https://test.com',
            region: 'us-gov-1'),
        Endpoint(
          service: ServiceMetadata(endpointPrefix: 'iam'),
          url: 'https://test.com',
          signingRegion: 'us-gov-1',
          signatureVersion: 'v4',
        ),
      );
    });
  });
}
