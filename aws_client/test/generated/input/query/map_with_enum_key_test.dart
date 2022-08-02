// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../../utils.dart';
import 'map_with_enum_key.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Map with enum key 0', () async {
    final client = MockClient((request) async {
      expect(
          request.body,
          equalsQuery(
              r'''Action=CreateQueue&Attributes.1.Name=All&Attributes.1.Value=SomeValue&QueueName=TheQueueName&Version=2014-01-01'''));
      expect(request.url, equalsPathAndQuery('/'));
      return Response('<Response></Response>', 200, headers: {});
    });

    final service = MapWithEnumKey(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.createQueue0(
      queueName: "TheQueueName",
      attributes: {
        QueueAttributeName.all: "SomeValue",
      },
    );
/*
{
  "QueueName": "TheQueueName",
  "Attributes": {
    "All": "SomeValue"
  }
}
*/
  });
}
