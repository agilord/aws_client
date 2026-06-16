// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_01_08.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('QueryXmlTimestamps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <normal>2014-04-29T18:30:38Z</normal>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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

  test('QueryXmlTimestampsWithDateTimeFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <dateTime>2014-04-29T18:30:38Z</dateTime>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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

  test('QueryXmlTimestampsWithDateTimeOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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

  test('QueryXmlTimestampsWithEpochSecondsFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <epochSeconds>1398796238</epochSeconds>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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

  test('QueryXmlTimestampsWithEpochSecondsOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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

  test('QueryXmlTimestampsWithHttpDateFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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

  test('QueryXmlTimestampsWithHttpDateOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlTimestampsResponse xmlns="https://example.com/">
    <XmlTimestampsResult>
        <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>
    </XmlTimestampsResult>
</XmlTimestampsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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
