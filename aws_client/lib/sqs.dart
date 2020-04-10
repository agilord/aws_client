// Copyright (c) 2016, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:http_client/http_client.dart' as http;
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import 'src/credentials.dart';
import 'src/request.dart';

/// AWS SQS (Simple Queue Service).
class Sqs {
  final Credentials _credentials;
  final http.Client _httpClient;

  /// AWS SQS
  Sqs({Credentials credentials, http.Client httpClient})
      : _credentials = credentials,
        _httpClient = httpClient {
    assert(_credentials != null);
    assert(_httpClient != null);
  }

  /// Returns a new SQS queue, inheriting the properties of this instance.
  SqsQueue queue(String queueUrl) =>
      SqsQueue(queueUrl, credentials: _credentials, httpClient: _httpClient);

  /// Create a new SQS queue
  Future<SqsQueue> create(
      {@required String region,
      @required String queueName,
      String maxSize = '1024',
      String retentionPeriod = '345600'}) async {
    assert(region != '');
    assert(queueName != '');
    final endpoint = 'https://sqs.$region.amazonaws.com/';
    final parameters = <String, String>{
      'Action': 'CreateQueue',
      'QueueName': queueName,
      'Attribute.1.Name': 'MaximumMessageSize',
      'Attribute.1.Value': maxSize,
      'Attribute.2.Name': 'MessageRetentionPeriod',
      'Attribute.2.Value': retentionPeriod
    };
    final response = await AwsRequestBuilder(
      method: 'GET',
      baseUrl: endpoint,
      queryParameters: parameters,
      credentials: _credentials,
      httpClient: _httpClient,
    ).sendRequest();
    response.validateStatus();
    final xml = parse(await response.readAsString());
    final queueUrl = xml.findAllElements('QueueUrl').first.text;
    return queue(queueUrl);
  }
}

/// AWS SQS message.
class SqsMessage {
  /// The message ID
  final String messageId;

  /// The receipt handle that can be used to delete the message from the queue.
  final String receiptHandle;

  /// The message body.
  final String body;

  /// AWS SQS message.
  SqsMessage(this.messageId, this.receiptHandle, this.body);

  @override
  String toString() => '[$messageId, $receiptHandle, $body]';
}

/// AWS SQS Queue
class SqsQueue {
  final String _queueUrl;
  final Credentials _credentials;
  final http.Client _httpClient;

  ///
  SqsQueue(
    String queueUrl, {
    Credentials credentials,
    http.Client httpClient,
  })  : _credentials = credentials,
        _httpClient = httpClient,
        _queueUrl = queueUrl {
    assert(_credentials != null);
    assert(_httpClient != null);
    assert(_queueUrl != null);
  }

  /// Receives a single message from the queue.
  Future<SqsMessage> receiveOne({int waitSeconds}) async {
    final messages = await receiveMessage(1, waitSeconds: waitSeconds);
    if (messages.isEmpty) return null;
    return messages.first;
  }

  /// Receives up to 10 (or up to [number], whichever is lower) messages from
  /// the queue.
  ///
  /// The call will block up to [waitSeconds] if there are not enough messages
  /// available immediately.
  ///
  /// http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_ReceiveMessage.html
  Future<List<SqsMessage>> receiveMessage(int number, {int waitSeconds}) async {
    assert(number > 0);
    final parameters = <String, String>{
      'Action': 'ReceiveMessage',
      'MaxNumberOfMessages': number.toString(),
      'Version': '2012-11-05',
    };
    if (waitSeconds != null) {
      parameters['WaitTimeSeconds'] = waitSeconds.toString();
    }
    final response = await AwsRequestBuilder(
      method: 'POST',
      baseUrl: _queueUrl,
      formParameters: parameters,
      credentials: _credentials,
      httpClient: _httpClient,
    ).sendRequest();
    response.validateStatus();
    final xml = parse(await response.readAsString());
    return xml
        .findAllElements('Message')
        // LOW PRIORITY: check MD5 signature
        .map((XmlElement elem) => SqsMessage(
              elem.findElements('MessageId').first.text,
              elem.findElements('ReceiptHandle').first.text,
              elem.findElements('Body').first.text,
            ))
        .toList();
  }

  /// Delete a message from the queue by its [receiptHandle].
  ///
  /// http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_DeleteMessage.html
  Future deleteMessage(String receiptHandle) async {
    final parameters = <String, String>{
      'Action': 'DeleteMessage',
      'ReceiptHandle': receiptHandle,
      'Version': '2012-11-05',
    };
    final response = await AwsRequestBuilder(
      method: 'POST',
      baseUrl: _queueUrl,
      formParameters: parameters,
      credentials: _credentials,
      httpClient: _httpClient,
    ).sendRequest();
    response.validateStatus();
  }

  /// Sends a new message into the queue.
  ///
  /// http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessage.html
  Future sendMessage(String body,
      {String messageGroupId, String messageDeduplicationId}) async {
    final parameters = <String, String>{
      'Action': 'SendMessage',
      'MessageBody': body,
      'Version': '2012-11-05'
    };
    if (messageGroupId != null) {
      parameters['MessageGroupId'] = messageGroupId;
    }
    if (messageDeduplicationId != null) {
      parameters['MessageDeduplicationId'] = messageDeduplicationId;
    }
    final response = await AwsRequestBuilder(
      method: 'POST',
      baseUrl: _queueUrl,
      formParameters: parameters,
      credentials: _credentials,
      httpClient: _httpClient,
    ).sendRequest();
    response.validateStatus();
  }
}
