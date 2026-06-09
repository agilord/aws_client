import 'package:aws_client/src/shared/src/credentials.dart';
import 'package:aws_client/src/shared/src/protocol/endpoint.dart';
import 'package:aws_client/src/shared/src/protocol/rest_json.dart';
import 'package:aws_client/src/shared/src/protocol/shared.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('RestJsonProtocol.sendRaw', () {
    test('throws an exception with a status code upon request failure status',
        () async {
      final client = MockClient((request) async {
        return Response('', 500);
      });
      final protocol = RestJsonProtocol(
        client: client,
        endpointUrl: 'endpointUrl',
        service: ServiceMetadata(endpointPrefix: 'endpointPrefix'),
        region: 'us-west-2',
        credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
      );
      GenericAwsException? theError;
      try {
        await protocol.sendRaw(
            method: 'POST', requestUri: 'requestUri', exceptionFnMap: {});
      } catch (error) {
        expect(error.toString(), '500 UnknownError: 500');
        theError = error as GenericAwsException;
      }
      expect(theError!.code, '500');
      expect(theError.type, 'UnknownError');
      expect(theError.message, '500');
    });

    RestJsonProtocol protocolFor(MockClient client) => RestJsonProtocol(
          client: client,
          endpointUrl: 'https://endpoint',
          service: ServiceMetadata(endpointPrefix: 'endpointPrefix'),
          region: 'us-west-2',
          credentials: AwsClientCredentials(accessKey: 'ak', secretKey: 'sk'),
        );

    test('sets Content-Type application/json for a JSON (Map) payload',
        () async {
      String? contentType;
      final client = MockClient((request) async {
        contentType = request.headers['Content-Type'];
        return Response('{}', 200);
      });
      await protocolFor(client).sendRaw(
        method: 'POST',
        requestUri: '/op',
        exceptionFnMap: {},
        payload: <String, dynamic>{'Name': 'myname'},
      );
      expect(contentType, startsWith('application/json'));
    });

    test('sets Content-Type application/octet-stream for a blob payload',
        () async {
      String? contentType;
      final client = MockClient((request) async {
        contentType = request.headers['Content-Type'];
        return Response('{}', 200);
      });
      await protocolFor(client).sendRaw(
        method: 'POST',
        requestUri: '/op',
        exceptionFnMap: {},
        payload: 'blobby blob blob'.codeUnits,
      );
      expect(contentType, startsWith('application/octet-stream'));
    });

    test('sets Content-Type text/plain for a raw String payload', () async {
      String? contentType;
      final client = MockClient((request) async {
        contentType = request.headers['Content-Type'];
        return Response('{}', 200);
      });
      await protocolFor(client).sendRaw(
        method: 'POST',
        requestUri: '/op',
        exceptionFnMap: {},
        payload: 'rawstring',
      );
      expect(contentType, startsWith('text/plain'));
    });

    test('does not set Content-Type when there is no payload', () async {
      var hasContentType = true;
      final client = MockClient((request) async {
        hasContentType = request.headers.containsKey('Content-Type');
        return Response('{}', 200);
      });
      await protocolFor(client).sendRaw(
        method: 'POST',
        requestUri: '/op',
        exceptionFnMap: {},
      );
      expect(hasContentType, isFalse);
    });

    test('an explicit Content-Type header overrides the payload default',
        () async {
      String? contentType;
      final client = MockClient((request) async {
        contentType = request.headers['Content-Type'];
        return Response('{}', 200);
      });
      await protocolFor(client).sendRaw(
        method: 'POST',
        requestUri: '/op',
        exceptionFnMap: {},
        payload: 'This is definitely a jpeg'.codeUnits,
        headers: {'Content-Type': 'image/jpeg'},
      );
      expect(contentType, startsWith('image/jpeg'));
    });
  });
}
