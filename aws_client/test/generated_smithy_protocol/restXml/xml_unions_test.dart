// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2019_12_16.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('XmlUnionsWithStructMember', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlUnionsRequest>
    <unionValue>
       <structValue>
          <stringValue>string</stringValue>
          <booleanValue>true</booleanValue>
          <byteValue>1</byteValue>
          <shortValue>2</shortValue>
          <integerValue>3</integerValue>
          <longValue>4</longValue>
          <floatValue>5.5</floatValue>
          <doubleValue>6.5</doubleValue>
       </structValue>
    </unionValue>
</XmlUnionsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlUnions(
      unionValue: XmlUnionShape(
        structValue: XmlNestedUnionStruct(
          booleanValue: true,
          byteValue: 1,
          doubleValue: 6.5,
          floatValue: 5.5,
          integerValue: 3,
          longValue: 4,
          shortValue: 2,
          stringValue: "string",
        ),
      ),
    );
  });

  test('XmlUnionsWithStringMember', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlUnionsRequest>
   <unionValue>
      <stringValue>some string</stringValue>
   </unionValue>
</XmlUnionsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlUnions(
      unionValue: XmlUnionShape(
        stringValue: "some string",
      ),
    );
  });

  test('XmlUnionsWithBooleanMember', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlUnionsRequest>
   <unionValue>
      <booleanValue>true</booleanValue>
   </unionValue>
</XmlUnionsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlUnions(
      unionValue: XmlUnionShape(
        booleanValue: true,
      ),
    );
  });

  test('XmlUnionsWithUnionMember', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlUnionsRequest>
   <unionValue>
      <unionValue>
         <booleanValue>true</booleanValue>
      </unionValue>
   </unionValue>
</XmlUnionsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlUnions(
      unionValue: XmlUnionShape(
        unionValue: XmlUnionShape(
          booleanValue: true,
        ),
      ),
    );
  });

  test('XmlUnionsWithStructMember', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlUnionsResponse>
    <unionValue>
       <structValue>
          <stringValue>string</stringValue>
          <booleanValue>true</booleanValue>
          <byteValue>1</byteValue>
          <shortValue>2</shortValue>
          <integerValue>3</integerValue>
          <longValue>4</longValue>
          <floatValue>5.5</floatValue>
          <doubleValue>6.5</doubleValue>
       </structValue>
    </unionValue>
</XmlUnionsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlUnions();
    expect(output.unionValue?.booleanValue, isNull);
    expect(output.unionValue?.byteValue, isNull);
    expect(output.unionValue?.doubleValue, isNull);
    expect(output.unionValue?.floatValue, isNull);
    expect(output.unionValue?.integerValue, isNull);
    expect(output.unionValue?.longValue, isNull);
    expect(output.unionValue?.shortValue, isNull);
    expect(output.unionValue?.stringValue, isNull);
    expect(output.unionValue?.structValue?.booleanValue, true);
    expect(output.unionValue?.structValue?.byteValue, 1);
    expect(output.unionValue?.structValue?.doubleValue, 6.5);
    expect(output.unionValue?.structValue?.floatValue, 5.5);
    expect(output.unionValue?.structValue?.integerValue, 3);
    expect(output.unionValue?.structValue?.longValue, 4);
    expect(output.unionValue?.structValue?.shortValue, 2);
    expect(output.unionValue?.structValue?.stringValue, "string");
    expect(output.unionValue?.unionValue, isNull);
  });

  test('XmlUnionsWithStringMember', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlUnionsResponse>
   <unionValue>
      <stringValue>some string</stringValue>
   </unionValue>
</XmlUnionsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlUnions();
    expect(output.unionValue?.booleanValue, isNull);
    expect(output.unionValue?.byteValue, isNull);
    expect(output.unionValue?.doubleValue, isNull);
    expect(output.unionValue?.floatValue, isNull);
    expect(output.unionValue?.integerValue, isNull);
    expect(output.unionValue?.longValue, isNull);
    expect(output.unionValue?.shortValue, isNull);
    expect(output.unionValue?.stringValue, "some string");
    expect(output.unionValue?.structValue, isNull);
    expect(output.unionValue?.unionValue, isNull);
  });

  test('XmlUnionsWithBooleanMember', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlUnionsResponse>
   <unionValue>
      <booleanValue>true</booleanValue>
   </unionValue>
</XmlUnionsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlUnions();
    expect(output.unionValue?.booleanValue, true);
    expect(output.unionValue?.byteValue, isNull);
    expect(output.unionValue?.doubleValue, isNull);
    expect(output.unionValue?.floatValue, isNull);
    expect(output.unionValue?.integerValue, isNull);
    expect(output.unionValue?.longValue, isNull);
    expect(output.unionValue?.shortValue, isNull);
    expect(output.unionValue?.stringValue, isNull);
    expect(output.unionValue?.structValue, isNull);
    expect(output.unionValue?.unionValue, isNull);
  });

  test('XmlUnionsWithUnionMember', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlUnionsResponse>
   <unionValue>
      <unionValue>
         <booleanValue>true</booleanValue>
      </unionValue>
   </unionValue>
</XmlUnionsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlUnions();
    expect(output.unionValue?.booleanValue, isNull);
    expect(output.unionValue?.byteValue, isNull);
    expect(output.unionValue?.doubleValue, isNull);
    expect(output.unionValue?.floatValue, isNull);
    expect(output.unionValue?.integerValue, isNull);
    expect(output.unionValue?.longValue, isNull);
    expect(output.unionValue?.shortValue, isNull);
    expect(output.unionValue?.stringValue, isNull);
    expect(output.unionValue?.structValue, isNull);
    expect(output.unionValue?.unionValue?.booleanValue, true);
    expect(output.unionValue?.unionValue?.byteValue, isNull);
    expect(output.unionValue?.unionValue?.doubleValue, isNull);
    expect(output.unionValue?.unionValue?.floatValue, isNull);
    expect(output.unionValue?.unionValue?.integerValue, isNull);
    expect(output.unionValue?.unionValue?.longValue, isNull);
    expect(output.unionValue?.unionValue?.shortValue, isNull);
    expect(output.unionValue?.unionValue?.stringValue, isNull);
    expect(output.unionValue?.unionValue?.structValue, isNull);
    expect(output.unionValue?.unionValue?.unionValue, isNull);
  });
}
