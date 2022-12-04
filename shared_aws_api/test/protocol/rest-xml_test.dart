import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/src/credentials.dart';
import 'package:shared_aws_api/src/protocol/endpoint.dart';
import 'package:shared_aws_api/src/protocol/rest-xml.dart';
import 'package:shared_aws_api/src/protocol/shared.dart';
import 'package:test/test.dart';

void main() {
  group('RestXmlProtocol.sendRaw', () {
    test('throws an exception with a status code upon request failure status',
        () async {
      final client = MockClient((request) async {
        return Response('', 500);
      });
      final protocol = RestXmlProtocol(
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
  });
}
