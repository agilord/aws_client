import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/src/credentials.dart';
import 'package:shared_aws_api/src/protocol/endpoint.dart';
import 'package:shared_aws_api/src/protocol/query.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('QueryProtocol.sendRaw', () {
    test('throws an exception with a status code upon request failure status',
        () async {
      final client = MockClient((request) async {
        return Response('', 500);
      });
      final protocol = QueryProtocol(
        client: client,
        endpointUrl: 'endpointUrl',
        service: ServiceMetadata(endpointPrefix: 'endpointPrefix'),
        region: 'us-west-2',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
      );
      Object? theError;
      try {
        await protocol.send({},
            action: 'action',
            version: 'version',
            shapes: {},
            method: 'POST',
            requestUri: 'requestUri',
            exceptionFnMap: {});
      } catch (error) {
        expect(error.toString(),
            'XmlParserException: Expected a single root element at 1:1');
        theError = error;
      }
      expect(theError, isA<XmlParserException>());
    });
  });

  group('QueryProtocol.flatQueryParams', () {
    test('handles a value of type double', () {
      expect(() => flatQueryParams(0.0, null, {}, 'version', 'action'),
          returnsNormally);
    });

    test('correct output for a value of type double', () {
      final result = flatQueryParams(123.4, null, {}, 'version', 'action');
      expect(result[''], '123.4');
    });
  });
}
