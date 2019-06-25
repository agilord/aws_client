library aws_client.test.impl_test;

import "package:test/test.dart";
import 'package:aws_client/aws_client.dart';
import 'package:aws_client/sqs.dart';
import 'package:http_client/console.dart';

void main() {

  group('SQS-queue', (){

    test('create-queue', () async {
      final httpClient = new ConsoleClient();
      final credentials = new Credentials(accessKey: '', secretKey: '');
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final queue = await aws.sqs.createNew(endpoint:'', queueName: '');
      await queue.sendMessage('test message');
      expect(true, equals(true));
    });

    test('Queue-send', () async {
      final httpClient = new ConsoleClient();
      final credentials = new Credentials(accessKey: '', secretKey: '');
      final aws = new Aws(credentials: credentials, httpClient: httpClient);
      final queue = aws.sqs.queue('');
      await queue.sendMessage('test test test');
    });

  });

}