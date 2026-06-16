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
  test('XmlTimestamps', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <normal>2014-04-29T18:30:38Z</normal>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      normal: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestampsWithDateTimeFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <dateTime>2014-04-29T18:30:38Z</dateTime>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      dateTime: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestampsWithDateTimeOnTargetFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      dateTimeOnTarget: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestampsWithEpochSecondsFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <epochSeconds>1398796238</epochSeconds>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      epochSeconds: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestampsWithEpochSecondsOnTargetFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      epochSecondsOnTarget:
          DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestampsWithHttpDateFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      httpDate: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestampsWithHttpDateOnTargetFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlTimestampsRequest>
    <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>
</XmlTimestampsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlTimestamps(
      httpDateOnTarget: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('XmlTimestamps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <normal>2014-04-29T18:30:38Z</normal>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal!.millisecondsSinceEpoch / 1000, 1398796238);
  });

  test('XmlTimestampsWithDateTimeFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <dateTime>2014-04-29T18:30:38Z</dateTime>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('XmlTimestampsWithDateTimeOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('XmlTimestampsWithEpochSecondsFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <epochSeconds>1398796238</epochSeconds>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('XmlTimestampsWithEpochSecondsOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(
        output.epochSecondsOnTarget!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('XmlTimestampsWithHttpDateFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('XmlTimestampsWithHttpDateOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse>
    <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.normal, isNull);
  });
}
