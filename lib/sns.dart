import 'dart:async';
import 'package:meta/meta.dart';
import 'src/request.dart';
import 'src/credentials.dart';
import 'package:http_client/http_client.dart' as http;
import 'package:xml/xml.dart';

typedef Future<String> RequestExecutor(Map<String, String> parameter);

/// AWS SQS (Simple Queue Service).
class Sns {
  /// AWS SQS
  Sns({Credentials credentials, http.Client httpClient, String region})
      : _credentials = credentials,
        _httpClient = httpClient,
        _region=region{
    assert(this._credentials != null);
    assert(this._httpClient != null);
    assert(this._region != null);
  }
  final Credentials _credentials;
  final http.Client _httpClient;
  final String _region;

  /// execute real request
  Future<String> _sendRequest(Map<String, String> parameters) async {
    final endpoint = 'https://sns.${this._region}.amazonaws.com/';
    AwsResponse response = await new AwsRequestBuilder(
      method: 'POST',
      baseUrl: endpoint,
      formParameters: parameters,
      credentials: this._credentials,
      httpClient: this._httpClient,
    ).sendRequest();
    final respString = await response.readAsString();
    print('resp:${respString}');
    response.validateStatus();
    return respString;
  }

  /// return an Endpoint of arn
  SnsEndpoint endpoint(String arn) => new SnsEndpoint(this._sendRequest, arn);

  /// create an Endpoint with push token
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_CreatePlatformEndpoint.html
  Future<SnsEndpoint> createEndpoint({
    @required String applicationArn,
    @required String pushToken,
    String userData:''}) async {
    assert(applicationArn!='');
    assert(pushToken!='');
    Map<String, String> parameters = {
      'Action': 'CreatePlatformEndpoint',
      'PlatformApplicationArn': applicationArn,
      'Token': pushToken,
      'CustomUserData': userData,
      'Version': '2010-03-31'
    };
    XmlDocument xml = parse(await this._sendRequest(parameters));
    final endpointArn = xml.findAllElements('EndpointArn').first.text;
    return this.endpoint(endpointArn);
  }

  SnsTopic topic(String arn) => new SnsTopic(this._sendRequest, arn);

  /// Create a Topic
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html
  Future<SnsTopic> createTopic(String name) async {
    Map<String, String> parameters = {
      'Action': 'CreateTopic',
      'Name': name,
      'Version': '2010-03-31'
    };
    XmlDocument xml = parse(await this._sendRequest(parameters));
    final topicArn = xml.findAllElements('TopicArn').first.text;
    return this.topic(topicArn);
  }

  /// Get subscription with arn
  SnsSubscription subscription(String arn) => new SnsSubscription(this._sendRequest, arn);

}

/// The device endpoint
class SnsEndpoint {
  /// A new endpoint of device
  SnsEndpoint(
      RequestExecutor sendRequest,
      String arn) : _sendRequest = sendRequest,
                    _arn = arn{
    assert(sendRequest!=null);
    assert(arn!=null);
  }
  final RequestExecutor _sendRequest;
  final String _arn;

  /// The endpoint arg
  String get arn => this._arn;

  /// push message to this endpoint
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_Publish.html
  /// return MessageId type:String
  Future<String> pushNotification(String body) async {
    Map<String, String> parameters = {
      'Action': 'Publish',
      'TargetArn': this._arn,
      'Message': body,
      'Version': '2010-03-31'
    };
    XmlDocument xml = parse(await this._sendRequest(parameters));
    final messageId = xml.findAllElements('MessageId').first.text;
    return messageId;
  }

}

/// SNS's Topic
class SnsTopic {
  /// The SNS Topic
  SnsTopic(
      RequestExecutor sendRequest,
      String arn) : _sendRequest = sendRequest,
        _arn = arn{
    assert(sendRequest!=null);
    assert(arn!=null);
  }
  final RequestExecutor _sendRequest;
  final String _arn;


  /// push message to this Topic
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_Publish.html
  /// return MessageId type:String
  Future<String> pushNotification(String body) async {
    Map<String, String> parameters = {
      'Action': 'Publish',
      'TargetArn': this._arn,
      'Message': body,
      'Version': '2010-03-31'
    };
    XmlDocument xml = parse(await this._sendRequest(parameters));
    final messageId = xml.findAllElements('MessageId').first.text;
    return messageId;
  }

  /// Subscribe this topic with given endpoint Arn
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html
  /// return SubscriptionArn type:String
  Future<SnsSubscription> subscribe(String endpointArn) async {
    Map<String, String> parameters = {
      'Action': 'Subscribe',
      'TopicArn': this._arn,
      'Endpoint': endpointArn,
      'Protocol': 'application',
      'Version': '2010-03-31'
    };
    XmlDocument xml = parse(await this._sendRequest(parameters));
    final subscriptionArn = xml.findAllElements('SubscriptionArn').first.text;
    return new SnsSubscription(
        this._sendRequest,
        subscriptionArn
    );
  }

}

/// The SNS subscription
class SnsSubscription {
  /// init subscription
  SnsSubscription(
      RequestExecutor sendRequest,
      String arn
      ): _sendRequest = sendRequest,
        _arn = arn{
    assert(sendRequest!=null);
    assert(arn!=null);
  }

  final RequestExecutor _sendRequest;
  final String _arn;

  /// unsubcribe this subscription
  Future unsubscribe() async {
    Map<String, String> parameters = {
      'Action': 'Unsubscribe',
      'SubscriptionArn': this._arn,
      'Version': '2010-03-31'
    };
    await this._sendRequest(parameters);
  }

}