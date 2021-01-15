// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'endpoint_host_trait_static_prefix.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Endpoint host trait static prefix 0', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Name": "myname"}'''));
      expect(request.headers['X-Amz-Target'], 'com.amazonaws.foo.StaticOp');
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.url, equalsPathAndQuery('/'));
      //expect(request.url.host, 'data-service.region.amazonaws.com');
      return Response('{}', 200, headers: {});
    });

    final service = EndpointHostTraitStaticPrefix(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.staticOp0(
      name: "myname",
    );
/*
{
  "Name": "myname"
}
*/
  });

  test('Endpoint host trait static prefix 1', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{"Name": "myname"}'''));
      expect(request.headers['X-Amz-Target'], 'com.amazonaws.foo.MemberRefOp');
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.url, equalsPathAndQuery('/'));
      //expect(request.url.host, 'foo-myname.service.region.amazonaws.com');
      return Response('{}', 200, headers: {});
    });

    final service = EndpointHostTraitStaticPrefix(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    await service.memberRefOp1(
      name: "myname",
    );
/*
{
  "Name": "myname"
}
*/
  });
}
