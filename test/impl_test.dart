library aws_client.test.impl_test;

import 'dart:io';
import "package:test/test.dart";
import 'package:aws_client/aws_client.dart';
import 'package:aws_client/sqs.dart';
import 'package:http_client/console.dart';

void main() {

  Map<String, String> env = Platform.environment;

  group('SQS-queue', (){

    test('create-queue', () async {
      final httpClient = new ConsoleClient();
      final credentials = new Credentials(accessKey: env['AWS_ACCESS_KEY_ID'], secretKey: env['AWS_SECRET_ACCESS_KEY']);
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final queue = await aws.sqs.create(env['AWS_DEFAULT_REGION'], '[set your queue name]');
      await queue.sendMessage('test message');
      expect(true, equals(true));
    });

    test('Queue-send', () async {
      final httpClient = new ConsoleClient();
      final credentials = new Credentials(accessKey: env['AWS_ACCESS_KEY_ID'], secretKey: env['AWS_SECRET_ACCESS_KEY']);
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final queue = aws.sqs.queue('[set your own]');
      await queue.sendMessage('test test test');
    });

  });

}