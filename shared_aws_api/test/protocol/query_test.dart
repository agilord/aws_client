import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:shared_aws_api/src/protocol/endpoint.dart';
import 'package:shared_aws_api/src/protocol/query.dart';
import 'package:shared_aws_api/src/protocol/shared.dart';
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
        theError = error;
      }
      expect(theError, isA<XmlParserException>());
    });
  });
}
