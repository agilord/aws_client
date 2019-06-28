library aws_client.test.impl_test;

import 'dart:io';

import 'package:http_client/console.dart';
import 'package:test/test.dart';

import 'package:aws_client/aws_client.dart';
import 'package:aws_client/src/credentials.dart';

void main() {
  final env = Platform.environment;

  final accessKey = env['AWS_ACCESS_KEY_ID'];
  final accessSecret = env['AWS_SECRET_ACCESS_KEY'];
  final region = env['AWS_DEFAULT_REGION'];
  final appArn = env['AWS_TEST_APP_ARN'];

  group('SQS-queue', () {
    test('create-queue', () async {
      final httpClient = new ConsoleClient();
      final credentials =
          new Credentials(accessKey: accessKey, secretKey: accessSecret);
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final queue = await aws.sqs
          .create(region: region, queueName: '[set your queue name]');
      await queue.sendMessage('test message');
      expect(true, equals(true));
    });

    test('Queue-send', () async {
      final httpClient = new ConsoleClient();
      final credentials =
          new Credentials(accessKey: accessKey, secretKey: accessSecret);
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final queue = aws.sqs.queue('[set your own]');
      await queue.sendMessage('test test test');
      expect(true, equals(true));
    });

    test('SNS-createEndpoint', () async {
      final httpClient = new ConsoleClient();
      final credentials =
          new Credentials(accessKey: accessKey, secretKey: accessSecret);
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final sns = aws.sns(region);
      final endpoint = await sns.createEndpoint(
          applicationArn: appArn, pushToken: 'your device push token');
      print('endpoint: ${endpoint.arn}');
      expect(true, equals(true));
    });
  });
}
