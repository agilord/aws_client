import 'dart:async';

import 'package:http_client/http_client.dart' as http;
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

import 'src/credentials.dart';
import 'src/request.dart';

typedef RequestExecutor = Future<String> Function(
    Map<String, String> parameter);

/// AWS SQS (Simple Queue Service).
class Sns {
  /// AWS SQS
  Sns({Credentials credentials, http.Client httpClient, String region})
      : _credentials = credentials,
        _httpClient = httpClient,
        _region = region {
    assert(_credentials != null);
    assert(_httpClient != null);
    assert(_region != null);
  }

  final Credentials _credentials;
  final http.Client _httpClient;
  final String _region;

  /// execute real request
  Future<String> _sendRequest(Map<String, String> parameters) async {
    final endpoint = 'https://sns.$_region.amazonaws.com/';
    final response = await AwsRequestBuilder(
      method: 'POST',
      baseUrl: endpoint,
      formParameters: parameters,
      credentials: _credentials,
      httpClient: _httpClient,
    ).sendRequest();
    final respString = await response.readAsString();
    response.validateStatus();
    return respString;
  }

  /// return an Endpoint of arn
  SnsEndpoint endpoint(String arn) => SnsEndpoint(_sendRequest, arn);

  /// create an Endpoint with push token
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_CreatePlatformEndpoint.html
  Future<SnsEndpoint> createEndpoint(
      {@required String applicationArn,
      @required String pushToken,
      String userData = ''}) async {
    assert(applicationArn != '');
    assert(pushToken != '');
    final parameters = <String, String>{
      'Action': 'CreatePlatformEndpoint',
      'PlatformApplicationArn': applicationArn,
      'Token': pushToken,
      'CustomUserData': userData,
      'Version': '2010-03-31'
    };
    final xml = parse(await _sendRequest(parameters));
    final endpointArn = xml.findAllElements('EndpointArn').first.text;
    return endpoint(endpointArn);
  }

  SnsTopic topic(String arn) => SnsTopic(_sendRequest, arn);

  /// Create a Topic
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html
  Future<SnsTopic> createTopic(String name) async {
    final parameters = <String, String>{
      'Action': 'CreateTopic',
      'Name': name,
      'Version': '2010-03-31'
    };
    final xml = parse(await _sendRequest(parameters));
    final topicArn = xml.findAllElements('TopicArn').first.text;
    return topic(topicArn);
  }

  /// Get subscription with arn
  SnsSubscription subscription(String arn) =>
      SnsSubscription(_sendRequest, arn);
}

/// The device endpoint
class SnsEndpoint {
  /// A new endpoint of device
  SnsEndpoint(RequestExecutor sendRequest, String arn)
      : _sendRequest = sendRequest,
        _arn = arn {
    assert(sendRequest != null);
    assert(arn != null);
  }

  final RequestExecutor _sendRequest;
  final String _arn;

  /// The endpoint arg
  String get arn => _arn;

  /// push message to this endpoint
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_Publish.html
  /// return MessageId type:String
  Future<String> pushNotification(String body) async {
    final parameters = <String, String>{
      'Action': 'Publish',
      'TargetArn': _arn,
      'Message': body,
      'Version': '2010-03-31'
    };
    final xml = parse(await _sendRequest(parameters));
    final messageId = xml.findAllElements('MessageId').first.text;
    return messageId;
  }
}

/// SNS's Topic
class SnsTopic {
  /// The SNS Topic
  SnsTopic(RequestExecutor sendRequest, String arn)
      : _sendRequest = sendRequest,
        _arn = arn {
    assert(sendRequest != null);
    assert(arn != null);
  }

  final RequestExecutor _sendRequest;
  final String _arn;

  /// push message to this Topic
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_Publish.html
  /// return MessageId type:String
  Future<String> pushNotification(String body) async {
    final parameters = <String, String>{
      'Action': 'Publish',
      'TargetArn': _arn,
      'Message': body,
      'Version': '2010-03-31'
    };
    final xml = parse(await _sendRequest(parameters));
    final messageId = xml.findAllElements('MessageId').first.text;
    return messageId;
  }

  /// Subscribe this topic with given endpoint Arn
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html
  /// return SubscriptionArn type:String
  Future<SnsSubscription> subscribe(String endpointArn) async {
    final parameters = <String, String>{
      'Action': 'Subscribe',
      'TopicArn': _arn,
      'Endpoint': endpointArn,
      'Protocol': 'application',
      'Version': '2010-03-31'
    };
    final xml = parse(await _sendRequest(parameters));
    final subscriptionArn = xml.findAllElements('SubscriptionArn').first.text;
    return SnsSubscription(_sendRequest, subscriptionArn);
  }
}

/// The SNS subscription
class SnsSubscription {
  /// init subscription
  SnsSubscription(RequestExecutor sendRequest, String arn)
      : _sendRequest = sendRequest,
        _arn = arn {
    assert(sendRequest != null);
    assert(arn != null);
  }

  final RequestExecutor _sendRequest;
  final String _arn;

  /// unsubcribe this subscription
  Future unsubscribe() async {
    final parameters = <String, String>{
      'Action': 'Unsubscribe',
      'SubscriptionArn': _arn,
      'Version': '2010-03-31'
    };
    await _sendRequest(parameters);
  }
}
