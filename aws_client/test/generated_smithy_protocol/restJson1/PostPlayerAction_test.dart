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
  test('RestJsonInputUnionWithUnitMember', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "action": {
        "quit": {}
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/PostPlayerAction'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.postPlayerAction(
      action: PlayerAction(
        quit: Unit(),
      ),
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('RestJsonOutputUnionWithUnitMember', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "action": {
        "quit": {}
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.postPlayerAction();
  });
}
