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
  test('RestJsonJsonTimestamps', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "normal": 1398796238
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      normal: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestampsWithDateTimeFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "dateTime": "2014-04-29T18:30:38Z"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      dateTime: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestampsWithDateTimeOnTargetFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "dateTimeOnTarget": "2014-04-29T18:30:38Z"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      dateTimeOnTarget: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestampsWithEpochSecondsFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "epochSeconds": 1398796238
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      epochSeconds: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestampsWithEpochSecondsOnTargetFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "epochSecondsOnTarget": 1398796238
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      epochSecondsOnTarget:
          DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestampsWithHttpDateFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "httpDate": "Tue, 29 Apr 2014 18:30:38 GMT"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      httpDate: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestampsWithHttpDateOnTargetFormat', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "httpDateOnTarget": "Tue, 29 Apr 2014 18:30:38 GMT"
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonTimestamps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonTimestamps(
      httpDateOnTarget: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
    );
  });

  test('RestJsonJsonTimestamps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "normal": 1398796238
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal!.millisecondsSinceEpoch / 1000, 1398796238);
  });

  test('RestJsonJsonTimestampsWithDateTimeFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "dateTime": "2014-04-29T18:30:38Z"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('RestJsonJsonTimestampsWithDateTimeOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "dateTimeOnTarget": "2014-04-29T18:30:38Z"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('RestJsonJsonTimestampsWithEpochSecondsFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "epochSeconds": 1398796238
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('RestJsonJsonTimestampsWithEpochSecondsOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "epochSecondsOnTarget": 1398796238
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(
        output.epochSecondsOnTarget!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('RestJsonJsonTimestampsWithHttpDateFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "httpDate": "Tue, 29 Apr 2014 18:30:38 GMT"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.httpDateOnTarget, isNull);
    expect(output.normal, isNull);
  });

  test('RestJsonJsonTimestampsWithHttpDateOnTargetFormat', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "httpDateOnTarget": "Tue, 29 Apr 2014 18:30:38 GMT"
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonTimestamps();
    expect(output.dateTime, isNull);
    expect(output.dateTimeOnTarget, isNull);
    expect(output.epochSeconds, isNull);
    expect(output.epochSecondsOnTarget, isNull);
    expect(output.httpDate, isNull);
    expect(output.httpDateOnTarget!.millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.normal, isNull);
  });
}
