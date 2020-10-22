import 'package:shared_aws_api/src/protocol/endpoint.dart';
import 'package:test/test.dart';

void main() {
  group('Endpoint.fromConfig', () {
    test('Create url for service', () {
      expect(
        Endpoint.fromConfig('s3', region: 'eu-west-1'),
        Endpoint(
          service: 's3',
          url: 'https://s3.eu-west-1.amazonaws.com',
          signingRegion: 'eu-west-1',
          signatureVersion: 's3',
        ),
      );
      expect(
        Endpoint.fromConfig('a4b', region: 'af-south-1'),
        Endpoint(
          service: 'a4b',
          url: 'https://a4b.af-south-1.amazonaws.com',
          signingRegion: 'af-south-1',
          signatureVersion: 'v4',
        ),
      );
      expect(
        Endpoint.fromConfig('lambda', region: 'us-west-2'),
        Endpoint(
          service: 'lambda',
          url: 'https://lambda.us-west-2.amazonaws.com',
          signingRegion: 'us-west-2',
          signatureVersion: 'v4',
        ),
      );
    });

    test('Throw if region is not provided when required', () {
      expect(
        () => Endpoint.fromConfig('s3'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Infer signing region for global services', () {
      expect(
        Endpoint.fromConfig('iam'),
        Endpoint(
          service: 'iam',
          url: 'https://iam.amazonaws.com',
          signingRegion: 'us-east-1',
          signatureVersion: 'v4',
        ),
      );
    });

    test('Use correct signing region for global services', () {
      expect(
        Endpoint.fromConfig('iam', region: 'eu-west-1'),
        Endpoint(
          service: 'iam',
          url: 'https://iam.amazonaws.com',
          signingRegion: 'us-east-1',
          signatureVersion: 'v4',
        ),
      );
    });
  });
}
