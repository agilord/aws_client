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
  Future<String> executor(Map<String, String> parameters) async {
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
  SnsEndpoint endpoint(String arn) => new SnsEndpoint(this.executor, this._region, this._credentials, this._httpClient, arn);

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
    XmlDocument xml = parse(await this.executor(parameters));
    final endpointArn = xml.findAllElements('EndpointArn').first.text;
    return this.endpoint(endpointArn);
  }

  SnsTopic topic(String arn) => new SnsTopic(this.executor, this._region, this._credentials, this._httpClient, arn);

  /// Create a Topic
  /// implements of https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html
  Future<SnsTopic> createTopic(String name) async {
    Map<String, String> parameters = {
      'Action': 'CreateTopic',
      'Name': name,
      'Version': '2010-03-31'
    };
    XmlDocument xml = parse(await this.executor(parameters));
    final topicArn = xml.findAllElements('TopicArn').first.text;
    return this.topic(topicArn);
  }

  /// Get subscription with arn
  SnsSubscription subscription(String arn) => new SnsSubscription(this.executor, this._region, this._credentials, this._httpClient, arn);

}

/// The device endpoint
class SnsEndpoint {
  /// A new endpoint of device
  SnsEndpoint(
      RequestExecutor executor,
      String region,
      Credentials credentials,
      http.Client httpClient,
      String arn) : _executor = executor,
                    _region = region,
                    _credentials = credentials,
                    _httpClient = httpClient,
                    _arn = arn{
    assert(executor!=null);
    assert(region!=null);
    assert(credentials!=null);
    assert(httpClient!=null);
    assert(arn!=null);
  }
  final RequestExecutor _executor;
  final Credentials _credentials;
  final http.Client _httpClient;
  final String _arn;
  final String _region;

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
    XmlDocument xml = parse(await this._executor(parameters));
    final messageId = xml.findAllElements('MessageId').first.text;
    return messageId;
  }

}

/// SNS's Topic
class SnsTopic {
  /// The SNS Topic
  SnsTopic(
      RequestExecutor executor,
      String region,
      Credentials credentials,
      http.Client httpClient,
      String arn) : _executor = executor,
        _region = region,
        _credentials = credentials,
        _httpClient = httpClient,
        _arn = arn{
    assert(region!=null);
    assert(credentials!=null);
    assert(httpClient!=null);
    assert(arn!=null);
  }
  final RequestExecutor _executor;
  final Credentials _credentials;
  final http.Client _httpClient;
  final String _arn;
  final String _region;

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
    XmlDocument xml = parse(await this._executor(parameters));
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
    XmlDocument xml = parse(await this._executor(parameters));
    final subscriptionArn = xml.findAllElements('SubscriptionArn').first.text;
    return new SnsSubscription(
        this._executor,
        this._region,
        this._credentials,
        this._httpClient,
        subscriptionArn
    );
  }

}

/// The SNS subscription
class SnsSubscription {
  /// init subscription
  SnsSubscription(
      RequestExecutor executor,
      String region,
      Credentials credentials,
      http.Client httpClient,
      String arn
      ): _executor = executor,
        _region = region,
        _credentials = credentials,
        _httpClient = httpClient,
        _arn = arn{
    assert(region!=null);
    assert(credentials!=null);
    assert(httpClient!=null);
    assert(arn!=null);
  }

  final RequestExecutor _executor;
  final Credentials _credentials;
  final http.Client _httpClient;
  final String _arn;
  final String _region;

  /// unsubcribe this subscription
  Future unsubscribe() async {
    Map<String, String> parameters = {
      'Action': 'Unsubscribe',
      'SubscriptionArn': this._arn,
      'Version': '2010-03-31'
    };
    await this._executor(parameters);
  }

}