// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'xml_attribute.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('XML Attribute 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsXml(
              r'''<Grant><Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="CanonicalUser"><EmailAddress>foo@example.com</EmailAddress></Grantee></Grant>'''));
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = XmlAttribute(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.operationName0(
      grant: Grant(
        grantee: Grantee(
          emailAddress: "foo@example.com",
          type: "CanonicalUser",
        ),
      ),
    );
/*
{
  "Grant": {
    "Grantee": {
      "EmailAddress": "foo@example.com",
      "Type": "CanonicalUser"
    }
  }
}
*/
  });
}
