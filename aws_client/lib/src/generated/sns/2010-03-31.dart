// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

import '2010-03-31.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Simple Notification Service (Amazon SNS) is a web service that
/// enables you to build distributed web-enabled applications. Applications can
/// use Amazon SNS to easily push real-time notification messages to interested
/// subscribers over multiple delivery protocols. For more information about
/// this product see the <a href="http://aws.amazon.com/sns/">Amazon SNS product
/// page</a>. For detailed information about Amazon SNS features and their
/// associated API calls, see the <a
/// href="https://docs.aws.amazon.com/sns/latest/dg/">Amazon SNS Developer
/// Guide</a>.
class Sns {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Sns({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sns',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Adds a statement to a topic's access control policy, granting access for
  /// the specified accounts to the specified actions.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [awsAccountId] :
  /// The account IDs of the users (principals) who will be given access to the
  /// specified actions. The users must have account, but do not need to be
  /// signed up for this service.
  ///
  /// Parameter [actionName] :
  /// The action you want to allow for the specified principal(s).
  ///
  /// Valid values: Any Amazon SNS action name, for example
  /// <code>Publish</code>.
  ///
  /// Parameter [label] :
  /// A unique identifier for the new policy statement.
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic whose access control policy you wish to modify.
  Future<void> addPermission({
    required List<String> awsAccountId,
    required List<String> actionName,
    required String label,
    required String topicArn,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    ArgumentError.checkNotNull(actionName, 'actionName');
    ArgumentError.checkNotNull(label, 'label');
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['AWSAccountId'] = awsAccountId;
    $request['ActionName'] = actionName;
    $request['Label'] = label;
    $request['TopicArn'] = topicArn;
    await _protocol.send(
      $request,
      action: 'AddPermission',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddPermissionInput'],
      shapes: shapes,
    );
  }

  /// Accepts a phone number and indicates whether the phone holder has opted
  /// out of receiving SMS messages from your account. You cannot send SMS
  /// messages to a number that is opted out.
  ///
  /// To resume sending messages, you can opt in the number by using the
  /// <code>OptInPhoneNumber</code> action.
  ///
  /// May throw [ThrottledException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [phoneNumber] :
  /// The phone number for which you want to check the opt out status.
  Future<CheckIfPhoneNumberIsOptedOutResponse> checkIfPhoneNumberIsOptedOut({
    required String phoneNumber,
  }) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    final $request = <String, dynamic>{};
    $request['phoneNumber'] = phoneNumber;
    final $result = await _protocol.send(
      $request,
      action: 'CheckIfPhoneNumberIsOptedOut',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CheckIfPhoneNumberIsOptedOutInput'],
      shapes: shapes,
      resultWrapper: 'CheckIfPhoneNumberIsOptedOutResult',
    );
    return CheckIfPhoneNumberIsOptedOutResponse.fromXml($result);
  }

  /// Verifies an endpoint owner's intent to receive messages by validating the
  /// token sent to the endpoint by an earlier <code>Subscribe</code> action. If
  /// the token is valid, the action creates a new subscription and returns its
  /// Amazon Resource Name (ARN). This call requires an AWS signature only when
  /// the <code>AuthenticateOnUnsubscribe</code> flag is set to "true".
  ///
  /// May throw [SubscriptionLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [FilterPolicyLimitExceededException].
  ///
  /// Parameter [token] :
  /// Short-lived token sent to an endpoint during the <code>Subscribe</code>
  /// action.
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic for which you wish to confirm a subscription.
  ///
  /// Parameter [authenticateOnUnsubscribe] :
  /// Disallows unauthenticated unsubscribes of the subscription. If the value
  /// of this parameter is <code>true</code> and the request has an Amazon Web
  /// Services signature, then only the topic owner and the subscription owner
  /// can unsubscribe the endpoint. The unsubscribe action requires Amazon Web
  /// Services authentication.
  Future<ConfirmSubscriptionResponse> confirmSubscription({
    required String token,
    required String topicArn,
    String? authenticateOnUnsubscribe,
  }) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['Token'] = token;
    $request['TopicArn'] = topicArn;
    authenticateOnUnsubscribe
        ?.also((arg) => $request['AuthenticateOnUnsubscribe'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ConfirmSubscription',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ConfirmSubscriptionInput'],
      shapes: shapes,
      resultWrapper: 'ConfirmSubscriptionResult',
    );
    return ConfirmSubscriptionResponse.fromXml($result);
  }

  /// Creates a platform application object for one of the supported push
  /// notification services, such as APNS and GCM (Firebase Cloud Messaging), to
  /// which devices and mobile apps may register. You must specify
  /// <code>PlatformPrincipal</code> and <code>PlatformCredential</code>
  /// attributes when using the <code>CreatePlatformApplication</code> action.
  ///
  /// <code>PlatformPrincipal</code> and <code>PlatformCredential</code> are
  /// received from the notification service.
  ///
  /// <ul>
  /// <li>
  /// For <code>ADM</code>, <code>PlatformPrincipal</code> is <code>client
  /// id</code> and <code>PlatformCredential</code> is <code>client
  /// secret</code>.
  /// </li>
  /// <li>
  /// For <code>Baidu</code>, <code>PlatformPrincipal</code> is <code>API
  /// key</code> and <code>PlatformCredential</code> is <code>secret key</code>.
  /// </li>
  /// <li>
  /// For <code>APNS</code> and <code>APNS_SANDBOX</code>,
  /// <code>PlatformPrincipal</code> is <code>SSL certificate</code> and
  /// <code>PlatformCredential</code> is <code>private key</code>.
  /// </li>
  /// <li>
  /// For <code>GCM</code> (Firebase Cloud Messaging), there is no
  /// <code>PlatformPrincipal</code> and the <code>PlatformCredential</code> is
  /// <code>API key</code>.
  /// </li>
  /// <li>
  /// For <code>MPNS</code>, <code>PlatformPrincipal</code> is <code>TLS
  /// certificate</code> and <code>PlatformCredential</code> is <code>private
  /// key</code>.
  /// </li>
  /// <li>
  /// For <code>WNS</code>, <code>PlatformPrincipal</code> is <code>Package
  /// Security Identifier</code> and <code>PlatformCredential</code> is
  /// <code>secret key</code>.
  /// </li>
  /// </ul>
  /// You can use the returned <code>PlatformApplicationArn</code> as an
  /// attribute for the <code>CreatePlatformEndpoint</code> action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [attributes] :
  /// For a list of attributes, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html">SetPlatformApplicationAttributes</a>.
  ///
  /// Parameter [name] :
  /// Application names must be made up of only uppercase and lowercase ASCII
  /// letters, numbers, underscores, hyphens, and periods, and must be between 1
  /// and 256 characters long.
  ///
  /// Parameter [platform] :
  /// The following platforms are supported: ADM (Amazon Device Messaging), APNS
  /// (Apple Push Notification Service), APNS_SANDBOX, and GCM (Firebase Cloud
  /// Messaging).
  Future<CreatePlatformApplicationResponse> createPlatformApplication({
    required Map<String, String> attributes,
    required String name,
    required String platform,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(platform, 'platform');
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['Name'] = name;
    $request['Platform'] = platform;
    final $result = await _protocol.send(
      $request,
      action: 'CreatePlatformApplication',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreatePlatformApplicationInput'],
      shapes: shapes,
      resultWrapper: 'CreatePlatformApplicationResult',
    );
    return CreatePlatformApplicationResponse.fromXml($result);
  }

  /// Creates an endpoint for a device and mobile app on one of the supported
  /// push notification services, such as GCM (Firebase Cloud Messaging) and
  /// APNS. <code>CreatePlatformEndpoint</code> requires the
  /// <code>PlatformApplicationArn</code> that is returned from
  /// <code>CreatePlatformApplication</code>. You can use the returned
  /// <code>EndpointArn</code> to send a message to a mobile app or by the
  /// <code>Subscribe</code> action for subscription to a topic. The
  /// <code>CreatePlatformEndpoint</code> action is idempotent, so if the
  /// requester already owns an endpoint with the same device token and
  /// attributes, that endpoint's ARN is returned without creating a new
  /// endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// When using <code>CreatePlatformEndpoint</code> with Baidu, two attributes
  /// must be provided: ChannelId and UserId. The token field must also contain
  /// the ChannelId. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html">Creating
  /// an Amazon SNS Endpoint for Baidu</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [platformApplicationArn] :
  /// PlatformApplicationArn returned from CreatePlatformApplication is used to
  /// create a an endpoint.
  ///
  /// Parameter [token] :
  /// Unique identifier created by the notification service for an app on a
  /// device. The specific name for Token will vary, depending on which
  /// notification service is being used. For example, when using APNS as the
  /// notification service, you need the device token. Alternatively, when using
  /// GCM (Firebase Cloud Messaging) or ADM, the device token equivalent is
  /// called the registration ID.
  ///
  /// Parameter [attributes] :
  /// For a list of attributes, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html">SetEndpointAttributes</a>.
  ///
  /// Parameter [customUserData] :
  /// Arbitrary user data to associate with the endpoint. Amazon SNS does not
  /// use this data. The data must be in UTF-8 format and less than 2KB.
  Future<CreateEndpointResponse> createPlatformEndpoint({
    required String platformApplicationArn,
    required String token,
    Map<String, String>? attributes,
    String? customUserData,
  }) async {
    ArgumentError.checkNotNull(
        platformApplicationArn, 'platformApplicationArn');
    ArgumentError.checkNotNull(token, 'token');
    final $request = <String, dynamic>{};
    $request['PlatformApplicationArn'] = platformApplicationArn;
    $request['Token'] = token;
    attributes?.also((arg) => $request['Attributes'] = arg);
    customUserData?.also((arg) => $request['CustomUserData'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreatePlatformEndpoint',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreatePlatformEndpointInput'],
      shapes: shapes,
      resultWrapper: 'CreatePlatformEndpointResult',
    );
    return CreateEndpointResponse.fromXml($result);
  }

  /// Adds a destination phone number to an account in the SMS sandbox and sends
  /// a one-time password (OTP) to that phone number.
  ///
  /// When you start using Amazon SNS to send SMS messages, your account is in
  /// the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for
  /// you to try Amazon SNS features without risking your reputation as an SMS
  /// sender. While your account is in the SMS sandbox, you can use all of the
  /// features of Amazon SNS. However, you can send SMS messages only to
  /// verified destination phone numbers. For more information, including how to
  /// move out of the sandbox to send messages without restrictions, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS
  /// sandbox</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [OptedOutException].
  /// May throw [UserErrorException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [phoneNumber] :
  /// The destination phone number to verify. On verification, Amazon SNS adds
  /// this phone number to the list of verified phone numbers that you can send
  /// SMS messages to.
  ///
  /// Parameter [languageCode] :
  /// The language to use for sending the OTP. The default value is
  /// <code>en-US</code>.
  Future<void> createSMSSandboxPhoneNumber({
    required String phoneNumber,
    LanguageCodeString? languageCode,
  }) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      0,
      20,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PhoneNumber'] = phoneNumber;
    languageCode?.also((arg) => $request['LanguageCode'] = arg.toValue());
    await _protocol.send(
      $request,
      action: 'CreateSMSSandboxPhoneNumber',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateSMSSandboxPhoneNumberInput'],
      shapes: shapes,
      resultWrapper: 'CreateSMSSandboxPhoneNumberResult',
    );
  }

  /// Creates a topic to which notifications can be published. Users can create
  /// at most 100,000 standard topics (at most 1,000 FIFO topics). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html">Creating
  /// an Amazon SNS topic</a> in the <i>Amazon SNS Developer Guide</i>. This
  /// action is idempotent, so if the requester already owns a topic with the
  /// specified name, that topic's ARN is returned without creating a new topic.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [TopicLimitExceededException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidSecurityException].
  /// May throw [TagLimitExceededException].
  /// May throw [StaleTagException].
  /// May throw [TagPolicyException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [name] :
  /// The name of the topic you want to create.
  ///
  /// Constraints: Topic names must be made up of only uppercase and lowercase
  /// ASCII letters, numbers, underscores, and hyphens, and must be between 1
  /// and 256 characters long.
  ///
  /// For a FIFO (first-in-first-out) topic, the name must end with the
  /// <code>.fifo</code> suffix.
  ///
  /// Parameter [attributes] :
  /// A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the <code>CreateTopic</code> action uses:
  ///
  /// <ul>
  /// <li>
  /// <code>DeliveryPolicy</code> – The policy that defines how Amazon SNS
  /// retries failed deliveries to HTTP/S endpoints.
  /// </li>
  /// <li>
  /// <code>DisplayName</code> – The display name to use for a topic with SMS
  /// subscriptions.
  /// </li>
  /// <li>
  /// <code>FifoTopic</code> – Set to true to create a FIFO topic.
  /// </li>
  /// <li>
  /// <code>Policy</code> – The policy that defines who can access your topic.
  /// By default, only the topic owner can publish or subscribe to the topic.
  /// </li>
  /// </ul>
  /// The following attribute applies only to <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html">server-side
  /// encryption</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsMasterKeyId</code> – The ID of an Amazon Web Services managed
  /// customer master key (CMK) for Amazon SNS or a custom CMK. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms">Key
  /// Terms</a>. For more examples, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">KeyId</a>
  /// in the <i>Key Management Service API Reference</i>.
  /// </li>
  /// </ul>
  /// The following attributes apply only to <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html">FIFO
  /// topics</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>FifoTopic</code> – When this is set to <code>true</code>, a FIFO
  /// topic is created.
  /// </li>
  /// <li>
  /// <code>ContentBasedDeduplication</code> – Enables content-based
  /// deduplication for FIFO topics.
  ///
  /// <ul>
  /// <li>
  /// By default, <code>ContentBasedDeduplication</code> is set to
  /// <code>false</code>. If you create a FIFO topic and this attribute is
  /// <code>false</code>, you must specify a value for the
  /// <code>MessageDeduplicationId</code> parameter for the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_Publish.html">Publish</a>
  /// action.
  /// </li>
  /// <li>
  /// When you set <code>ContentBasedDeduplication</code> to <code>true</code>,
  /// Amazon SNS uses a SHA-256 hash to generate the
  /// <code>MessageDeduplicationId</code> using the body of the message (but not
  /// the attributes of the message).
  ///
  /// (Optional) To override the generated value, you can specify a value for
  /// the <code>MessageDeduplicationId</code> parameter for the
  /// <code>Publish</code> action.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The list of tags to add to a new topic.
  /// <note>
  /// To be able to tag a topic on creation, you must have the
  /// <code>sns:CreateTopic</code> and <code>sns:TagResource</code> permissions.
  /// </note>
  Future<CreateTopicResponse> createTopic({
    required String name,
    Map<String, String>? attributes,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    attributes?.also((arg) => $request['Attributes'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateTopic',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateTopicInput'],
      shapes: shapes,
      resultWrapper: 'CreateTopicResult',
    );
    return CreateTopicResponse.fromXml($result);
  }

  /// Deletes the endpoint for a device and mobile app from Amazon SNS. This
  /// action is idempotent. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// When you delete an endpoint that is also subscribed to a topic, then you
  /// must also unsubscribe the endpoint from the topic.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [endpointArn] :
  /// EndpointArn of endpoint to delete.
  Future<void> deleteEndpoint({
    required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final $request = <String, dynamic>{};
    $request['EndpointArn'] = endpointArn;
    await _protocol.send(
      $request,
      action: 'DeleteEndpoint',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEndpointInput'],
      shapes: shapes,
    );
  }

  /// Deletes a platform application object for one of the supported push
  /// notification services, such as APNS and GCM (Firebase Cloud Messaging).
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [platformApplicationArn] :
  /// PlatformApplicationArn of platform application object to delete.
  Future<void> deletePlatformApplication({
    required String platformApplicationArn,
  }) async {
    ArgumentError.checkNotNull(
        platformApplicationArn, 'platformApplicationArn');
    final $request = <String, dynamic>{};
    $request['PlatformApplicationArn'] = platformApplicationArn;
    await _protocol.send(
      $request,
      action: 'DeletePlatformApplication',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeletePlatformApplicationInput'],
      shapes: shapes,
    );
  }

  /// Deletes an account's verified or pending phone number from the SMS
  /// sandbox.
  ///
  /// When you start using Amazon SNS to send SMS messages, your account is in
  /// the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for
  /// you to try Amazon SNS features without risking your reputation as an SMS
  /// sender. While your account is in the SMS sandbox, you can use all of the
  /// features of Amazon SNS. However, you can send SMS messages only to
  /// verified destination phone numbers. For more information, including how to
  /// move out of the sandbox to send messages without restrictions, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS
  /// sandbox</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UserErrorException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [phoneNumber] :
  /// The destination phone number to delete.
  Future<void> deleteSMSSandboxPhoneNumber({
    required String phoneNumber,
  }) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      0,
      20,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PhoneNumber'] = phoneNumber;
    await _protocol.send(
      $request,
      action: 'DeleteSMSSandboxPhoneNumber',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSMSSandboxPhoneNumberInput'],
      shapes: shapes,
      resultWrapper: 'DeleteSMSSandboxPhoneNumberResult',
    );
  }

  /// Deletes a topic and all its subscriptions. Deleting a topic might prevent
  /// some messages previously sent to the topic from being delivered to
  /// subscribers. This action is idempotent, so deleting a topic that does not
  /// exist does not result in an error.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  /// May throw [StaleTagException].
  /// May throw [TagPolicyException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic you want to delete.
  Future<void> deleteTopic({
    required String topicArn,
  }) async {
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['TopicArn'] = topicArn;
    await _protocol.send(
      $request,
      action: 'DeleteTopic',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteTopicInput'],
      shapes: shapes,
    );
  }

  /// Retrieves the endpoint attributes for a device on one of the supported
  /// push notification services, such as GCM (Firebase Cloud Messaging) and
  /// APNS. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [endpointArn] :
  /// EndpointArn for GetEndpointAttributes input.
  Future<GetEndpointAttributesResponse> getEndpointAttributes({
    required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final $request = <String, dynamic>{};
    $request['EndpointArn'] = endpointArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetEndpointAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetEndpointAttributesInput'],
      shapes: shapes,
      resultWrapper: 'GetEndpointAttributesResult',
    );
    return GetEndpointAttributesResponse.fromXml($result);
  }

  /// Retrieves the attributes of the platform application object for the
  /// supported push notification services, such as APNS and GCM (Firebase Cloud
  /// Messaging). For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [platformApplicationArn] :
  /// PlatformApplicationArn for GetPlatformApplicationAttributesInput.
  Future<GetPlatformApplicationAttributesResponse>
      getPlatformApplicationAttributes({
    required String platformApplicationArn,
  }) async {
    ArgumentError.checkNotNull(
        platformApplicationArn, 'platformApplicationArn');
    final $request = <String, dynamic>{};
    $request['PlatformApplicationArn'] = platformApplicationArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetPlatformApplicationAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetPlatformApplicationAttributesInput'],
      shapes: shapes,
      resultWrapper: 'GetPlatformApplicationAttributesResult',
    );
    return GetPlatformApplicationAttributesResponse.fromXml($result);
  }

  /// Returns the settings for sending SMS messages from your account.
  ///
  /// These settings are set with the <code>SetSMSAttributes</code> action.
  ///
  /// May throw [ThrottledException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [attributes] :
  /// A list of the individual attribute names, such as
  /// <code>MonthlySpendLimit</code>, for which you want values.
  ///
  /// For all attribute names, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html">SetSMSAttributes</a>.
  ///
  /// If you don't use this parameter, Amazon SNS returns all SMS attributes.
  Future<GetSMSAttributesResponse> getSMSAttributes({
    List<String>? attributes,
  }) async {
    final $request = <String, dynamic>{};
    attributes?.also((arg) => $request['attributes'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetSMSAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetSMSAttributesInput'],
      shapes: shapes,
      resultWrapper: 'GetSMSAttributesResult',
    );
    return GetSMSAttributesResponse.fromXml($result);
  }

  /// Retrieves the SMS sandbox status for the calling account in the target
  /// Region.
  ///
  /// When you start using Amazon SNS to send SMS messages, your account is in
  /// the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for
  /// you to try Amazon SNS features without risking your reputation as an SMS
  /// sender. While your account is in the SMS sandbox, you can use all of the
  /// features of Amazon SNS. However, you can send SMS messages only to
  /// verified destination phone numbers. For more information, including how to
  /// move out of the sandbox to send messages without restrictions, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS
  /// sandbox</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InternalErrorException].
  /// May throw [ThrottledException].
  Future<GetSMSSandboxAccountStatusResult> getSMSSandboxAccountStatus() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetSMSSandboxAccountStatus',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetSMSSandboxAccountStatusInput'],
      shapes: shapes,
      resultWrapper: 'GetSMSSandboxAccountStatusResult',
    );
    return GetSMSSandboxAccountStatusResult.fromXml($result);
  }

  /// Returns all of the properties of a subscription.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [subscriptionArn] :
  /// The ARN of the subscription whose properties you want to get.
  Future<GetSubscriptionAttributesResponse> getSubscriptionAttributes({
    required String subscriptionArn,
  }) async {
    ArgumentError.checkNotNull(subscriptionArn, 'subscriptionArn');
    final $request = <String, dynamic>{};
    $request['SubscriptionArn'] = subscriptionArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetSubscriptionAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetSubscriptionAttributesInput'],
      shapes: shapes,
      resultWrapper: 'GetSubscriptionAttributesResult',
    );
    return GetSubscriptionAttributesResponse.fromXml($result);
  }

  /// Returns all of the properties of a topic. Topic properties returned might
  /// differ based on the authorization of the user.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidSecurityException].
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic whose properties you want to get.
  Future<GetTopicAttributesResponse> getTopicAttributes({
    required String topicArn,
  }) async {
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['TopicArn'] = topicArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetTopicAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetTopicAttributesInput'],
      shapes: shapes,
      resultWrapper: 'GetTopicAttributesResult',
    );
    return GetTopicAttributesResponse.fromXml($result);
  }

  /// Lists the endpoints and endpoint attributes for devices in a supported
  /// push notification service, such as GCM (Firebase Cloud Messaging) and
  /// APNS. The results for <code>ListEndpointsByPlatformApplication</code> are
  /// paginated and return a limited list of endpoints, up to 100. If additional
  /// records are available after the first page results, then a NextToken
  /// string will be returned. To receive the next page, you call
  /// <code>ListEndpointsByPlatformApplication</code> again using the NextToken
  /// string received from the previous call. When there are no more records to
  /// return, NextToken will be null. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [platformApplicationArn] :
  /// PlatformApplicationArn for ListEndpointsByPlatformApplicationInput action.
  ///
  /// Parameter [nextToken] :
  /// NextToken string is used when calling ListEndpointsByPlatformApplication
  /// action to retrieve additional records that are available after the first
  /// page results.
  Future<ListEndpointsByPlatformApplicationResponse>
      listEndpointsByPlatformApplication({
    required String platformApplicationArn,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(
        platformApplicationArn, 'platformApplicationArn');
    final $request = <String, dynamic>{};
    $request['PlatformApplicationArn'] = platformApplicationArn;
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListEndpointsByPlatformApplication',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListEndpointsByPlatformApplicationInput'],
      shapes: shapes,
      resultWrapper: 'ListEndpointsByPlatformApplicationResult',
    );
    return ListEndpointsByPlatformApplicationResponse.fromXml($result);
  }

  /// Lists the calling account's dedicated origination numbers and their
  /// metadata. For more information about origination numbers, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/channels-sms-originating-identities-origination-numbers.html">Origination
  /// numbers</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [ThrottledException].
  /// May throw [InvalidParameterException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of origination numbers to return.
  ///
  /// Parameter [nextToken] :
  /// Token that the previous <code>ListOriginationNumbers</code> request
  /// returns.
  Future<ListOriginationNumbersResult> listOriginationNumbers({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      30,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListOriginationNumbers',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListOriginationNumbersRequest'],
      shapes: shapes,
      resultWrapper: 'ListOriginationNumbersResult',
    );
    return ListOriginationNumbersResult.fromXml($result);
  }

  /// Returns a list of phone numbers that are opted out, meaning you cannot
  /// send SMS messages to them.
  ///
  /// The results for <code>ListPhoneNumbersOptedOut</code> are paginated, and
  /// each page returns up to 100 phone numbers. If additional phone numbers are
  /// available after the first page of results, then a <code>NextToken</code>
  /// string will be returned. To receive the next page, you call
  /// <code>ListPhoneNumbersOptedOut</code> again using the
  /// <code>NextToken</code> string received from the previous call. When there
  /// are no more records to return, <code>NextToken</code> will be null.
  ///
  /// May throw [ThrottledException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [nextToken] :
  /// A <code>NextToken</code> string is used when you call the
  /// <code>ListPhoneNumbersOptedOut</code> action to retrieve additional
  /// records that are available after the first page of results.
  Future<ListPhoneNumbersOptedOutResponse> listPhoneNumbersOptedOut({
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['nextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListPhoneNumbersOptedOut',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPhoneNumbersOptedOutInput'],
      shapes: shapes,
      resultWrapper: 'ListPhoneNumbersOptedOutResult',
    );
    return ListPhoneNumbersOptedOutResponse.fromXml($result);
  }

  /// Lists the platform application objects for the supported push notification
  /// services, such as APNS and GCM (Firebase Cloud Messaging). The results for
  /// <code>ListPlatformApplications</code> are paginated and return a limited
  /// list of applications, up to 100. If additional records are available after
  /// the first page results, then a NextToken string will be returned. To
  /// receive the next page, you call <code>ListPlatformApplications</code>
  /// using the NextToken string received from the previous call. When there are
  /// no more records to return, <code>NextToken</code> will be null. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// This action is throttled at 15 transactions per second (TPS).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [nextToken] :
  /// NextToken string is used when calling ListPlatformApplications action to
  /// retrieve additional records that are available after the first page
  /// results.
  Future<ListPlatformApplicationsResponse> listPlatformApplications({
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListPlatformApplications',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPlatformApplicationsInput'],
      shapes: shapes,
      resultWrapper: 'ListPlatformApplicationsResult',
    );
    return ListPlatformApplicationsResponse.fromXml($result);
  }

  /// Lists the calling account's current verified and pending destination phone
  /// numbers in the SMS sandbox.
  ///
  /// When you start using Amazon SNS to send SMS messages, your account is in
  /// the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for
  /// you to try Amazon SNS features without risking your reputation as an SMS
  /// sender. While your account is in the SMS sandbox, you can use all of the
  /// features of Amazon SNS. However, you can send SMS messages only to
  /// verified destination phone numbers. For more information, including how to
  /// move out of the sandbox to send messages without restrictions, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS
  /// sandbox</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of phone numbers to return.
  ///
  /// Parameter [nextToken] :
  /// Token that the previous <code>ListSMSSandboxPhoneNumbersInput</code>
  /// request returns.
  Future<ListSMSSandboxPhoneNumbersResult> listSMSSandboxPhoneNumbers({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListSMSSandboxPhoneNumbers',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSMSSandboxPhoneNumbersInput'],
      shapes: shapes,
      resultWrapper: 'ListSMSSandboxPhoneNumbersResult',
    );
    return ListSMSSandboxPhoneNumbersResult.fromXml($result);
  }

  /// Returns a list of the requester's subscriptions. Each call returns a
  /// limited list of subscriptions, up to 100. If there are more subscriptions,
  /// a <code>NextToken</code> is also returned. Use the <code>NextToken</code>
  /// parameter in a new <code>ListSubscriptions</code> call to get further
  /// results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [nextToken] :
  /// Token returned by the previous <code>ListSubscriptions</code> request.
  Future<ListSubscriptionsResponse> listSubscriptions({
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListSubscriptions',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSubscriptionsInput'],
      shapes: shapes,
      resultWrapper: 'ListSubscriptionsResult',
    );
    return ListSubscriptionsResponse.fromXml($result);
  }

  /// Returns a list of the subscriptions to a specific topic. Each call returns
  /// a limited list of subscriptions, up to 100. If there are more
  /// subscriptions, a <code>NextToken</code> is also returned. Use the
  /// <code>NextToken</code> parameter in a new
  /// <code>ListSubscriptionsByTopic</code> call to get further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic for which you wish to find subscriptions.
  ///
  /// Parameter [nextToken] :
  /// Token returned by the previous <code>ListSubscriptionsByTopic</code>
  /// request.
  Future<ListSubscriptionsByTopicResponse> listSubscriptionsByTopic({
    required String topicArn,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['TopicArn'] = topicArn;
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListSubscriptionsByTopic',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSubscriptionsByTopicInput'],
      shapes: shapes,
      resultWrapper: 'ListSubscriptionsByTopicResult',
    );
    return ListSubscriptionsByTopicResponse.fromXml($result);
  }

  /// List all tags added to the specified Amazon SNS topic. For an overview,
  /// see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS
  /// Tags</a> in the <i>Amazon Simple Notification Service Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [AuthorizationErrorException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the topic for which to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceRequest'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return ListTagsForResourceResponse.fromXml($result);
  }

  /// Returns a list of the requester's topics. Each call returns a limited list
  /// of topics, up to 100. If there are more topics, a <code>NextToken</code>
  /// is also returned. Use the <code>NextToken</code> parameter in a new
  /// <code>ListTopics</code> call to get further results.
  ///
  /// This action is throttled at 30 transactions per second (TPS).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [nextToken] :
  /// Token returned by the previous <code>ListTopics</code> request.
  Future<ListTopicsResponse> listTopics({
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListTopics',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTopicsInput'],
      shapes: shapes,
      resultWrapper: 'ListTopicsResult',
    );
    return ListTopicsResponse.fromXml($result);
  }

  /// Use this request to opt in a phone number that is opted out, which enables
  /// you to resume sending SMS messages to the number.
  ///
  /// You can opt in a phone number only once every 30 days.
  ///
  /// May throw [ThrottledException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [phoneNumber] :
  /// The phone number to opt in. Use E.164 format.
  Future<void> optInPhoneNumber({
    required String phoneNumber,
  }) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    final $request = <String, dynamic>{};
    $request['phoneNumber'] = phoneNumber;
    await _protocol.send(
      $request,
      action: 'OptInPhoneNumber',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['OptInPhoneNumberInput'],
      shapes: shapes,
      resultWrapper: 'OptInPhoneNumberResult',
    );
  }

  /// Sends a message to an Amazon SNS topic, a text message (SMS message)
  /// directly to a phone number, or a message to a mobile platform endpoint
  /// (when you specify the <code>TargetArn</code>).
  ///
  /// If you send a message to a topic, Amazon SNS delivers the message to each
  /// endpoint that is subscribed to the topic. The format of the message
  /// depends on the notification protocol for each subscribed endpoint.
  ///
  /// When a <code>messageId</code> is returned, the message has been saved and
  /// Amazon SNS will attempt to deliver it shortly.
  ///
  /// To use the <code>Publish</code> action for sending a message to a mobile
  /// endpoint, such as an app on a Kindle device or mobile phone, you must
  /// specify the EndpointArn for the TargetArn parameter. The EndpointArn is
  /// returned when making a call with the <code>CreatePlatformEndpoint</code>
  /// action.
  ///
  /// For more information about formatting messages, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html">Send
  /// Custom Platform-Specific Payloads in Messages to Mobile Devices</a>.
  /// <important>
  /// You can publish messages only to topics and endpoints in the same Region.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [EndpointDisabledException].
  /// May throw [PlatformApplicationDisabledException].
  /// May throw [AuthorizationErrorException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSNotFoundException].
  /// May throw [KMSOptInRequired].
  /// May throw [KMSThrottlingException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [InvalidSecurityException].
  ///
  /// Parameter [message] :
  /// The message you want to send.
  ///
  /// If you are publishing to a topic and you want to send the same message to
  /// all transport protocols, include the text of the message as a String
  /// value. If you want to send different messages for each transport protocol,
  /// set the value of the <code>MessageStructure</code> parameter to
  /// <code>json</code> and use a JSON object for the <code>Message</code>
  /// parameter.
  /// <p/>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// With the exception of SMS, messages must be UTF-8 encoded strings and at
  /// most 256 KB in size (262,144 bytes, not 262,144 characters).
  /// </li>
  /// <li>
  /// For SMS, each message can contain up to 140 characters. This character
  /// limit depends on the encoding schema. For example, an SMS message can
  /// contain 160 GSM characters, 140 ASCII characters, or 70 UCS-2 characters.
  ///
  /// If you publish a message that exceeds this size limit, Amazon SNS sends
  /// the message as multiple messages, each fitting within the size limit.
  /// Messages aren't truncated mid-word but are cut off at whole-word
  /// boundaries.
  ///
  /// The total size limit for a single SMS <code>Publish</code> action is 1,600
  /// characters.
  /// </li>
  /// </ul>
  /// JSON-specific constraints:
  ///
  /// <ul>
  /// <li>
  /// Keys in the JSON object that correspond to supported transport protocols
  /// must have simple JSON string values.
  /// </li>
  /// <li>
  /// The values will be parsed (unescaped) before they are used in outgoing
  /// messages.
  /// </li>
  /// <li>
  /// Outbound notifications are JSON encoded (meaning that the characters will
  /// be reescaped for sending).
  /// </li>
  /// <li>
  /// Values have a minimum length of 0 (the empty string, "", is allowed).
  /// </li>
  /// <li>
  /// Values have a maximum length bounded by the overall message size (so,
  /// including multiple protocols may limit message sizes).
  /// </li>
  /// <li>
  /// Non-string values will cause the key to be ignored.
  /// </li>
  /// <li>
  /// Keys that do not correspond to supported transport protocols are ignored.
  /// </li>
  /// <li>
  /// Duplicate keys are not allowed.
  /// </li>
  /// <li>
  /// Failure to parse or validate any key or value in the message will cause
  /// the <code>Publish</code> call to return an error (no partial delivery).
  /// </li>
  /// </ul>
  ///
  /// Parameter [messageAttributes] :
  /// Message attributes for Publish action.
  ///
  /// Parameter [messageDeduplicationId] :
  /// This parameter applies only to FIFO (first-in-first-out) topics. The
  /// <code>MessageDeduplicationId</code> can contain up to 128 alphanumeric
  /// characters (a-z, A-Z, 0-9) and punctuation
  /// <code>(!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~)</code>.
  ///
  /// Every message must have a unique <code>MessageDeduplicationId</code>,
  /// which is a token used for deduplication of sent messages. If a message
  /// with a particular <code>MessageDeduplicationId</code> is sent
  /// successfully, any message sent with the same
  /// <code>MessageDeduplicationId</code> during the 5-minute deduplication
  /// interval is treated as a duplicate.
  ///
  /// If the topic has <code>ContentBasedDeduplication</code> set, the system
  /// generates a <code>MessageDeduplicationId</code> based on the contents of
  /// the message. Your <code>MessageDeduplicationId</code> overrides the
  /// generated one.
  ///
  /// Parameter [messageGroupId] :
  /// This parameter applies only to FIFO (first-in-first-out) topics. The
  /// <code>MessageGroupId</code> can contain up to 128 alphanumeric characters
  /// (a-z, A-Z, 0-9) and punctuation
  /// <code>(!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~)</code>.
  ///
  /// The <code>MessageGroupId</code> is a tag that specifies that a message
  /// belongs to a specific message group. Messages that belong to the same
  /// message group are processed in a FIFO manner (however, messages in
  /// different message groups might be processed out of order). Every message
  /// must include a <code>MessageGroupId</code>.
  ///
  /// Parameter [messageStructure] :
  /// Set <code>MessageStructure</code> to <code>json</code> if you want to send
  /// a different message for each protocol. For example, using one publish
  /// action, you can send a short message to your SMS subscribers and a longer
  /// message to your email subscribers. If you set
  /// <code>MessageStructure</code> to <code>json</code>, the value of the
  /// <code>Message</code> parameter must:
  ///
  /// <ul>
  /// <li>
  /// be a syntactically valid JSON object; and
  /// </li>
  /// <li>
  /// contain at least a top-level JSON key of "default" with a value that is a
  /// string.
  /// </li>
  /// </ul>
  /// You can define other top-level keys that define the message you want to
  /// send to a specific transport protocol (e.g., "http").
  ///
  /// Valid value: <code>json</code>
  ///
  /// Parameter [phoneNumber] :
  /// The phone number to which you want to deliver an SMS message. Use E.164
  /// format.
  ///
  /// If you don't specify a value for the <code>PhoneNumber</code> parameter,
  /// you must specify a value for the <code>TargetArn</code> or
  /// <code>TopicArn</code> parameters.
  ///
  /// Parameter [subject] :
  /// Optional parameter to be used as the "Subject" line when the message is
  /// delivered to email endpoints. This field will also be included, if
  /// present, in the standard JSON messages delivered to other endpoints.
  ///
  /// Constraints: Subjects must be ASCII text that begins with a letter,
  /// number, or punctuation mark; must not include line breaks or control
  /// characters; and must be less than 100 characters long.
  ///
  /// Parameter [targetArn] :
  /// If you don't specify a value for the <code>TargetArn</code> parameter, you
  /// must specify a value for the <code>PhoneNumber</code> or
  /// <code>TopicArn</code> parameters.
  ///
  /// Parameter [topicArn] :
  /// The topic you want to publish to.
  ///
  /// If you don't specify a value for the <code>TopicArn</code> parameter, you
  /// must specify a value for the <code>PhoneNumber</code> or
  /// <code>TargetArn</code> parameters.
  Future<PublishResponse> publish({
    required String message,
    Map<String, MessageAttributeValue>? messageAttributes,
    String? messageDeduplicationId,
    String? messageGroupId,
    String? messageStructure,
    String? phoneNumber,
    String? subject,
    String? targetArn,
    String? topicArn,
  }) async {
    ArgumentError.checkNotNull(message, 'message');
    final $request = <String, dynamic>{};
    $request['Message'] = message;
    messageAttributes?.also((arg) => $request['MessageAttributes'] = arg);
    messageDeduplicationId
        ?.also((arg) => $request['MessageDeduplicationId'] = arg);
    messageGroupId?.also((arg) => $request['MessageGroupId'] = arg);
    messageStructure?.also((arg) => $request['MessageStructure'] = arg);
    phoneNumber?.also((arg) => $request['PhoneNumber'] = arg);
    subject?.also((arg) => $request['Subject'] = arg);
    targetArn?.also((arg) => $request['TargetArn'] = arg);
    topicArn?.also((arg) => $request['TopicArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'Publish',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PublishInput'],
      shapes: shapes,
      resultWrapper: 'PublishResult',
    );
    return PublishResponse.fromXml($result);
  }

  /// Removes a statement from a topic's access control policy.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [label] :
  /// The unique label of the statement you want to remove.
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic whose access control policy you wish to modify.
  Future<void> removePermission({
    required String label,
    required String topicArn,
  }) async {
    ArgumentError.checkNotNull(label, 'label');
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['Label'] = label;
    $request['TopicArn'] = topicArn;
    await _protocol.send(
      $request,
      action: 'RemovePermission',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemovePermissionInput'],
      shapes: shapes,
    );
  }

  /// Sets the attributes for an endpoint for a device on one of the supported
  /// push notification services, such as GCM (Firebase Cloud Messaging) and
  /// APNS. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [attributes] :
  /// A map of the endpoint attributes. Attributes in this map include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>CustomUserData</code> – arbitrary user data to associate with the
  /// endpoint. Amazon SNS does not use this data. The data must be in UTF-8
  /// format and less than 2KB.
  /// </li>
  /// <li>
  /// <code>Enabled</code> – flag that enables/disables delivery to the
  /// endpoint. Amazon SNS will set this to false when a notification service
  /// indicates to Amazon SNS that the endpoint is invalid. Users can set it
  /// back to true, typically after updating Token.
  /// </li>
  /// <li>
  /// <code>Token</code> – device token, also referred to as a registration id,
  /// for an app and mobile device. This is returned from the notification
  /// service when an app and mobile device are registered with the notification
  /// service.
  /// </li>
  /// </ul>
  ///
  /// Parameter [endpointArn] :
  /// EndpointArn used for SetEndpointAttributes action.
  Future<void> setEndpointAttributes({
    required Map<String, String> attributes,
    required String endpointArn,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(endpointArn, 'endpointArn');
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['EndpointArn'] = endpointArn;
    await _protocol.send(
      $request,
      action: 'SetEndpointAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetEndpointAttributesInput'],
      shapes: shapes,
    );
  }

  /// Sets the attributes of the platform application object for the supported
  /// push notification services, such as APNS and GCM (Firebase Cloud
  /// Messaging). For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html">Using
  /// Amazon SNS Mobile Push Notifications</a>. For information on configuring
  /// attributes for message delivery status, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html">Using
  /// Amazon SNS Application Attributes for Message Delivery Status</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [attributes] :
  /// A map of the platform application attributes. Attributes in this map
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>PlatformCredential</code> – The credential received from the
  /// notification service. For <code>APNS</code> and <code>APNS_SANDBOX</code>,
  /// <code>PlatformCredential</code> is <code>private key</code>. For
  /// <code>GCM</code> (Firebase Cloud Messaging),
  /// <code>PlatformCredential</code> is <code>API key</code>. For
  /// <code>ADM</code>, <code>PlatformCredential</code> is <code>client
  /// secret</code>.
  /// </li>
  /// <li>
  /// <code>PlatformPrincipal</code> – The principal received from the
  /// notification service. For <code>APNS</code> and <code>APNS_SANDBOX</code>,
  /// <code>PlatformPrincipal</code> is <code>SSL certificate</code>. For
  /// <code>GCM</code> (Firebase Cloud Messaging), there is no
  /// <code>PlatformPrincipal</code>. For <code>ADM</code>,
  /// <code>PlatformPrincipal</code> is <code>client id</code>.
  /// </li>
  /// <li>
  /// <code>EventEndpointCreated</code> – Topic ARN to which
  /// <code>EndpointCreated</code> event notifications are sent.
  /// </li>
  /// <li>
  /// <code>EventEndpointDeleted</code> – Topic ARN to which
  /// <code>EndpointDeleted</code> event notifications are sent.
  /// </li>
  /// <li>
  /// <code>EventEndpointUpdated</code> – Topic ARN to which
  /// <code>EndpointUpdate</code> event notifications are sent.
  /// </li>
  /// <li>
  /// <code>EventDeliveryFailure</code> – Topic ARN to which
  /// <code>DeliveryFailure</code> event notifications are sent upon Direct
  /// Publish delivery failure (permanent) to one of the application's
  /// endpoints.
  /// </li>
  /// <li>
  /// <code>SuccessFeedbackRoleArn</code> – IAM role ARN used to give Amazon SNS
  /// write access to use CloudWatch Logs on your behalf.
  /// </li>
  /// <li>
  /// <code>FailureFeedbackRoleArn</code> – IAM role ARN used to give Amazon SNS
  /// write access to use CloudWatch Logs on your behalf.
  /// </li>
  /// <li>
  /// <code>SuccessFeedbackSampleRate</code> – Sample rate percentage (0-100) of
  /// successfully delivered messages.
  /// </li>
  /// </ul>
  ///
  /// Parameter [platformApplicationArn] :
  /// PlatformApplicationArn for SetPlatformApplicationAttributes action.
  Future<void> setPlatformApplicationAttributes({
    required Map<String, String> attributes,
    required String platformApplicationArn,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(
        platformApplicationArn, 'platformApplicationArn');
    final $request = <String, dynamic>{};
    $request['Attributes'] = attributes;
    $request['PlatformApplicationArn'] = platformApplicationArn;
    await _protocol.send(
      $request,
      action: 'SetPlatformApplicationAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetPlatformApplicationAttributesInput'],
      shapes: shapes,
    );
  }

  /// Use this request to set the default settings for sending SMS messages and
  /// receiving daily SMS usage reports.
  ///
  /// You can override some of these settings for a single message when you use
  /// the <code>Publish</code> action with the
  /// <code>MessageAttributes.entry.N</code> parameter. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Publishing
  /// to a mobile phone</a> in the <i>Amazon SNS Developer Guide</i>.
  /// <note>
  /// To use this operation, you must grant the Amazon SNS service principal
  /// (<code>sns.amazonaws.com</code>) permission to perform the
  /// <code>s3:ListBucket</code> action.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottledException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [attributes] :
  /// The default settings for sending SMS messages from your account. You can
  /// set values for the following attribute names:
  ///
  /// <code>MonthlySpendLimit</code> – The maximum amount in USD that you are
  /// willing to spend each month to send SMS messages. When Amazon SNS
  /// determines that sending an SMS message would incur a cost that exceeds
  /// this limit, it stops sending SMS messages within minutes.
  /// <important>
  /// Amazon SNS stops sending SMS messages within minutes of the limit being
  /// crossed. During that interval, if you continue to send SMS messages, you
  /// will incur costs that exceed your limit.
  /// </important>
  /// By default, the spend limit is set to the maximum allowed by Amazon SNS.
  /// If you want to raise the limit, submit an <a
  /// href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase&amp;limitType=service-code-sns">SNS
  /// Limit Increase case</a>. For <b>New limit value</b>, enter your desired
  /// monthly spend limit. In the <b>Use Case Description</b> field, explain
  /// that you are requesting an SMS monthly spend limit increase.
  ///
  /// <code>DeliveryStatusIAMRole</code> – The ARN of the IAM role that allows
  /// Amazon SNS to write logs about SMS deliveries in CloudWatch Logs. For each
  /// SMS message that you send, Amazon SNS writes a log that includes the
  /// message price, the success or failure status, the reason for failure (if
  /// the message failed), the message dwell time, and other information.
  ///
  /// <code>DeliveryStatusSuccessSamplingRate</code> – The percentage of
  /// successful SMS deliveries for which Amazon SNS will write logs in
  /// CloudWatch Logs. The value can be an integer from 0 - 100. For example, to
  /// write logs only for failed deliveries, set this value to <code>0</code>.
  /// To write logs for 10% of your successful deliveries, set it to
  /// <code>10</code>.
  ///
  /// <code>DefaultSenderID</code> – A string, such as your business brand, that
  /// is displayed as the sender on the receiving device. Support for sender IDs
  /// varies by country. The sender ID can be 1 - 11 alphanumeric characters,
  /// and it must contain at least one letter.
  ///
  /// <code>DefaultSMSType</code> – The type of SMS message that you will send
  /// by default. You can assign the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Promotional</code> – (Default) Noncritical messages, such as
  /// marketing messages. Amazon SNS optimizes the message delivery to incur the
  /// lowest cost.
  /// </li>
  /// <li>
  /// <code>Transactional</code> – Critical messages that support customer
  /// transactions, such as one-time passcodes for multi-factor authentication.
  /// Amazon SNS optimizes the message delivery to achieve the highest
  /// reliability.
  /// </li>
  /// </ul>
  /// <code>UsageReportS3Bucket</code> – The name of the Amazon S3 bucket to
  /// receive daily SMS usage reports from Amazon SNS. Each day, Amazon SNS will
  /// deliver a usage report as a CSV file to the bucket. The report includes
  /// the following information for each SMS message that was successfully
  /// delivered by your account:
  ///
  /// <ul>
  /// <li>
  /// Time that the message was published (in UTC)
  /// </li>
  /// <li>
  /// Message ID
  /// </li>
  /// <li>
  /// Destination phone number
  /// </li>
  /// <li>
  /// Message type
  /// </li>
  /// <li>
  /// Delivery status
  /// </li>
  /// <li>
  /// Message price (in USD)
  /// </li>
  /// <li>
  /// Part number (a message is split into multiple parts if it is too long for
  /// a single message)
  /// </li>
  /// <li>
  /// Total number of parts
  /// </li>
  /// </ul>
  /// To receive the report, the bucket must have a policy that allows the
  /// Amazon SNS service principal to perform the <code>s3:PutObject</code> and
  /// <code>s3:GetBucketLocation</code> actions.
  ///
  /// For an example bucket policy and usage report, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sms_stats.html">Monitoring
  /// SMS Activity</a> in the <i>Amazon SNS Developer Guide</i>.
  Future<void> setSMSAttributes({
    required Map<String, String> attributes,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    final $request = <String, dynamic>{};
    $request['attributes'] = attributes;
    await _protocol.send(
      $request,
      action: 'SetSMSAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSMSAttributesInput'],
      shapes: shapes,
      resultWrapper: 'SetSMSAttributesResult',
    );
  }

  /// Allows a subscription owner to set an attribute of the subscription to a
  /// new value.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [FilterPolicyLimitExceededException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AuthorizationErrorException].
  ///
  /// Parameter [attributeName] :
  /// A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that this action uses:
  ///
  /// <ul>
  /// <li>
  /// <code>DeliveryPolicy</code> – The policy that defines how Amazon SNS
  /// retries failed deliveries to HTTP/S endpoints.
  /// </li>
  /// <li>
  /// <code>FilterPolicy</code> – The simple JSON object that lets your
  /// subscriber receive only a subset of messages, rather than receiving every
  /// message published to the topic.
  /// </li>
  /// <li>
  /// <code>RawMessageDelivery</code> – When set to <code>true</code>, enables
  /// raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates
  /// the need for the endpoints to process JSON formatting, which is otherwise
  /// created for Amazon SNS metadata.
  /// </li>
  /// <li>
  /// <code>RedrivePolicy</code> – When specified, sends undeliverable messages
  /// to the specified Amazon SQS dead-letter queue. Messages that can't be
  /// delivered due to client errors (for example, when the subscribed endpoint
  /// is unreachable) or server errors (for example, when the service that
  /// powers the subscribed endpoint becomes unavailable) are held in the
  /// dead-letter queue for further analysis or reprocessing.
  /// </li>
  /// </ul>
  /// The following attribute applies only to Amazon Kinesis Data Firehose
  /// delivery stream subscriptions:
  ///
  /// <ul>
  /// <li>
  /// <code>SubscriptionRoleArn</code> – The ARN of the IAM role that has the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Permission to write to the Kinesis Data Firehose delivery stream
  /// </li>
  /// <li>
  /// Amazon SNS listed as a trusted entity
  /// </li>
  /// </ul>
  /// Specifying a valid ARN for this attribute is required for Kinesis Data
  /// Firehose delivery stream subscriptions. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html">Fanout
  /// to Kinesis Data Firehose delivery streams</a> in the <i>Amazon SNS
  /// Developer Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [subscriptionArn] :
  /// The ARN of the subscription to modify.
  ///
  /// Parameter [attributeValue] :
  /// The new value for the attribute in JSON format.
  Future<void> setSubscriptionAttributes({
    required String attributeName,
    required String subscriptionArn,
    String? attributeValue,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(subscriptionArn, 'subscriptionArn');
    final $request = <String, dynamic>{};
    $request['AttributeName'] = attributeName;
    $request['SubscriptionArn'] = subscriptionArn;
    attributeValue?.also((arg) => $request['AttributeValue'] = arg);
    await _protocol.send(
      $request,
      action: 'SetSubscriptionAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSubscriptionAttributesInput'],
      shapes: shapes,
    );
  }

  /// Allows a topic owner to set an attribute of the topic to a new value.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidSecurityException].
  ///
  /// Parameter [attributeName] :
  /// A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the <code>SetTopicAttributes</code> action uses:
  ///
  /// <ul>
  /// <li>
  /// <code>DeliveryPolicy</code> – The policy that defines how Amazon SNS
  /// retries failed deliveries to HTTP/S endpoints.
  /// </li>
  /// <li>
  /// <code>DisplayName</code> – The display name to use for a topic with SMS
  /// subscriptions.
  /// </li>
  /// <li>
  /// <code>Policy</code> – The policy that defines who can access your topic.
  /// By default, only the topic owner can publish or subscribe to the topic.
  /// </li>
  /// </ul>
  /// The following attribute applies only to <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html">server-side-encryption</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsMasterKeyId</code> – The ID of an Amazon Web Services managed
  /// customer master key (CMK) for Amazon SNS or a custom CMK. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms">Key
  /// Terms</a>. For more examples, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">KeyId</a>
  /// in the <i>Key Management Service API Reference</i>.
  /// </li>
  /// </ul>
  /// The following attribute applies only to <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html">FIFO
  /// topics</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>ContentBasedDeduplication</code> – Enables content-based
  /// deduplication for FIFO topics.
  ///
  /// <ul>
  /// <li>
  /// By default, <code>ContentBasedDeduplication</code> is set to
  /// <code>false</code>. If you create a FIFO topic and this attribute is
  /// <code>false</code>, you must specify a value for the
  /// <code>MessageDeduplicationId</code> parameter for the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_Publish.html">Publish</a>
  /// action.
  /// </li>
  /// <li>
  /// When you set <code>ContentBasedDeduplication</code> to <code>true</code>,
  /// Amazon SNS uses a SHA-256 hash to generate the
  /// <code>MessageDeduplicationId</code> using the body of the message (but not
  /// the attributes of the message).
  ///
  /// (Optional) To override the generated value, you can specify a value for
  /// the <code>MessageDeduplicationId</code> parameter for the
  /// <code>Publish</code> action.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic to modify.
  ///
  /// Parameter [attributeValue] :
  /// The new value for the attribute.
  Future<void> setTopicAttributes({
    required String attributeName,
    required String topicArn,
    String? attributeValue,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['AttributeName'] = attributeName;
    $request['TopicArn'] = topicArn;
    attributeValue?.also((arg) => $request['AttributeValue'] = arg);
    await _protocol.send(
      $request,
      action: 'SetTopicAttributes',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetTopicAttributesInput'],
      shapes: shapes,
    );
  }

  /// Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is
  /// HTTP/S or email, or if the endpoint and the topic are not in the same
  /// account, the endpoint owner must run the <code>ConfirmSubscription</code>
  /// action to confirm the subscription.
  ///
  /// You call the <code>ConfirmSubscription</code> action with the token from
  /// the subscription response. Confirmation tokens are valid for three days.
  ///
  /// This action is throttled at 100 transactions per second (TPS).
  ///
  /// May throw [SubscriptionLimitExceededException].
  /// May throw [FilterPolicyLimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [NotFoundException].
  /// May throw [AuthorizationErrorException].
  /// May throw [InvalidSecurityException].
  ///
  /// Parameter [protocol] :
  /// The protocol that you want to use. Supported protocols include:
  ///
  /// <ul>
  /// <li>
  /// <code>http</code> – delivery of JSON-encoded message via HTTP POST
  /// </li>
  /// <li>
  /// <code>https</code> – delivery of JSON-encoded message via HTTPS POST
  /// </li>
  /// <li>
  /// <code>email</code> – delivery of message via SMTP
  /// </li>
  /// <li>
  /// <code>email-json</code> – delivery of JSON-encoded message via SMTP
  /// </li>
  /// <li>
  /// <code>sms</code> – delivery of message via SMS
  /// </li>
  /// <li>
  /// <code>sqs</code> – delivery of JSON-encoded message to an Amazon SQS queue
  /// </li>
  /// <li>
  /// <code>application</code> – delivery of JSON-encoded message to an
  /// EndpointArn for a mobile app and device
  /// </li>
  /// <li>
  /// <code>lambda</code> – delivery of JSON-encoded message to an Lambda
  /// function
  /// </li>
  /// <li>
  /// <code>firehose</code> – delivery of JSON-encoded message to an Amazon
  /// Kinesis Data Firehose delivery stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [topicArn] :
  /// The ARN of the topic you want to subscribe to.
  ///
  /// Parameter [attributes] :
  /// A map of attributes with their corresponding values.
  ///
  /// The following lists the names, descriptions, and values of the special
  /// request parameters that the <code>Subscribe</code> action uses:
  ///
  /// <ul>
  /// <li>
  /// <code>DeliveryPolicy</code> – The policy that defines how Amazon SNS
  /// retries failed deliveries to HTTP/S endpoints.
  /// </li>
  /// <li>
  /// <code>FilterPolicy</code> – The simple JSON object that lets your
  /// subscriber receive only a subset of messages, rather than receiving every
  /// message published to the topic.
  /// </li>
  /// <li>
  /// <code>RawMessageDelivery</code> – When set to <code>true</code>, enables
  /// raw message delivery to Amazon SQS or HTTP/S endpoints. This eliminates
  /// the need for the endpoints to process JSON formatting, which is otherwise
  /// created for Amazon SNS metadata.
  /// </li>
  /// <li>
  /// <code>RedrivePolicy</code> – When specified, sends undeliverable messages
  /// to the specified Amazon SQS dead-letter queue. Messages that can't be
  /// delivered due to client errors (for example, when the subscribed endpoint
  /// is unreachable) or server errors (for example, when the service that
  /// powers the subscribed endpoint becomes unavailable) are held in the
  /// dead-letter queue for further analysis or reprocessing.
  /// </li>
  /// </ul>
  /// The following attribute applies only to Amazon Kinesis Data Firehose
  /// delivery stream subscriptions:
  ///
  /// <ul>
  /// <li>
  /// <code>SubscriptionRoleArn</code> – The ARN of the IAM role that has the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Permission to write to the Kinesis Data Firehose delivery stream
  /// </li>
  /// <li>
  /// Amazon SNS listed as a trusted entity
  /// </li>
  /// </ul>
  /// Specifying a valid ARN for this attribute is required for Kinesis Data
  /// Firehose delivery stream subscriptions. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html">Fanout
  /// to Kinesis Data Firehose delivery streams</a> in the <i>Amazon SNS
  /// Developer Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [endpoint] :
  /// The endpoint that you want to receive notifications. Endpoints vary by
  /// protocol:
  ///
  /// <ul>
  /// <li>
  /// For the <code>http</code> protocol, the (public) endpoint is a URL
  /// beginning with <code>http://</code>.
  /// </li>
  /// <li>
  /// For the <code>https</code> protocol, the (public) endpoint is a URL
  /// beginning with <code>https://</code>.
  /// </li>
  /// <li>
  /// For the <code>email</code> protocol, the endpoint is an email address.
  /// </li>
  /// <li>
  /// For the <code>email-json</code> protocol, the endpoint is an email
  /// address.
  /// </li>
  /// <li>
  /// For the <code>sms</code> protocol, the endpoint is a phone number of an
  /// SMS-enabled device.
  /// </li>
  /// <li>
  /// For the <code>sqs</code> protocol, the endpoint is the ARN of an Amazon
  /// SQS queue.
  /// </li>
  /// <li>
  /// For the <code>application</code> protocol, the endpoint is the EndpointArn
  /// of a mobile app and device.
  /// </li>
  /// <li>
  /// For the <code>lambda</code> protocol, the endpoint is the ARN of an Lambda
  /// function.
  /// </li>
  /// <li>
  /// For the <code>firehose</code> protocol, the endpoint is the ARN of an
  /// Amazon Kinesis Data Firehose delivery stream.
  /// </li>
  /// </ul>
  ///
  /// Parameter [returnSubscriptionArn] :
  /// Sets whether the response from the <code>Subscribe</code> request includes
  /// the subscription ARN, even if the subscription is not yet confirmed.
  ///
  /// If you set this parameter to <code>true</code>, the response includes the
  /// ARN in all cases, even if the subscription is not yet confirmed. In
  /// addition to the ARN for confirmed subscriptions, the response also
  /// includes the <code>pending subscription</code> ARN value for subscriptions
  /// that aren't yet confirmed. A subscription becomes confirmed when the
  /// subscriber calls the <code>ConfirmSubscription</code> action with a
  /// confirmation token.
  /// <p/>
  /// The default value is <code>false</code>.
  Future<SubscribeResponse> subscribe({
    required String protocol,
    required String topicArn,
    Map<String, String>? attributes,
    String? endpoint,
    bool? returnSubscriptionArn,
  }) async {
    ArgumentError.checkNotNull(protocol, 'protocol');
    ArgumentError.checkNotNull(topicArn, 'topicArn');
    final $request = <String, dynamic>{};
    $request['Protocol'] = protocol;
    $request['TopicArn'] = topicArn;
    attributes?.also((arg) => $request['Attributes'] = arg);
    endpoint?.also((arg) => $request['Endpoint'] = arg);
    returnSubscriptionArn
        ?.also((arg) => $request['ReturnSubscriptionArn'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'Subscribe',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SubscribeInput'],
      shapes: shapes,
      resultWrapper: 'SubscribeResult',
    );
    return SubscribeResponse.fromXml($result);
  }

  /// Add tags to the specified Amazon SNS topic. For an overview, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS
  /// Tags</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// When you use topic tags, keep the following guidelines in mind:
  ///
  /// <ul>
  /// <li>
  /// Adding more than 50 tags to a topic isn't recommended.
  /// </li>
  /// <li>
  /// Tags don't have any semantic meaning. Amazon SNS interprets tags as
  /// character strings.
  /// </li>
  /// <li>
  /// Tags are case-sensitive.
  /// </li>
  /// <li>
  /// A new tag with a key identical to that of an existing tag overwrites the
  /// existing tag.
  /// </li>
  /// <li>
  /// Tagging actions are limited to 10 TPS per account, per Region. If your
  /// application requires a higher throughput, file a <a
  /// href="https://console.aws.amazon.com/support/home#/case/create?issueType=technical">technical
  /// support request</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TagLimitExceededException].
  /// May throw [StaleTagException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [AuthorizationErrorException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the topic to which to add tags.
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified topic. A tag consists of a required
  /// key and an optional value.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagResource',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagResourceRequest'],
      shapes: shapes,
      resultWrapper: 'TagResourceResult',
    );
  }

  /// Deletes a subscription. If the subscription requires authentication for
  /// deletion, only the owner of the subscription or the topic's owner can
  /// unsubscribe, and an Amazon Web Services signature is required. If the
  /// <code>Unsubscribe</code> call does not require authentication and the
  /// requester is not the subscription owner, a final cancellation message is
  /// delivered to the endpoint, so that the endpoint owner can easily
  /// resubscribe to the topic if the <code>Unsubscribe</code> request was
  /// unintended.
  ///
  /// This action is throttled at 100 transactions per second (TPS).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [AuthorizationErrorException].
  /// May throw [NotFoundException].
  /// May throw [InvalidSecurityException].
  ///
  /// Parameter [subscriptionArn] :
  /// The ARN of the subscription to be deleted.
  Future<void> unsubscribe({
    required String subscriptionArn,
  }) async {
    ArgumentError.checkNotNull(subscriptionArn, 'subscriptionArn');
    final $request = <String, dynamic>{};
    $request['SubscriptionArn'] = subscriptionArn;
    await _protocol.send(
      $request,
      action: 'Unsubscribe',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UnsubscribeInput'],
      shapes: shapes,
    );
  }

  /// Remove tags from the specified Amazon SNS topic. For an overview, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html">Amazon SNS
  /// Tags</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TagLimitExceededException].
  /// May throw [StaleTagException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [AuthorizationErrorException].
  /// May throw [ConcurrentAccessException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the topic from which to remove tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the specified topic.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $request = <String, dynamic>{};
    $request['ResourceArn'] = resourceArn;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagResource',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagResourceRequest'],
      shapes: shapes,
      resultWrapper: 'UntagResourceResult',
    );
  }

  /// Verifies a destination phone number with a one-time password (OTP) for the
  /// calling account.
  ///
  /// When you start using Amazon SNS to send SMS messages, your account is in
  /// the <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for
  /// you to try Amazon SNS features without risking your reputation as an SMS
  /// sender. While your account is in the SMS sandbox, you can use all of the
  /// features of Amazon SNS. However, you can send SMS messages only to
  /// verified destination phone numbers. For more information, including how to
  /// move out of the sandbox to send messages without restrictions, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS
  /// sandbox</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// May throw [AuthorizationErrorException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [VerificationException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [oneTimePassword] :
  /// The OTP sent to the destination number from the
  /// <code>CreateSMSSandBoxPhoneNumber</code> call.
  ///
  /// Parameter [phoneNumber] :
  /// The destination phone number to verify.
  Future<void> verifySMSSandboxPhoneNumber({
    required String oneTimePassword,
    required String phoneNumber,
  }) async {
    ArgumentError.checkNotNull(oneTimePassword, 'oneTimePassword');
    _s.validateStringLength(
      'oneTimePassword',
      oneTimePassword,
      5,
      8,
      isRequired: true,
    );
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      0,
      20,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['OneTimePassword'] = oneTimePassword;
    $request['PhoneNumber'] = phoneNumber;
    await _protocol.send(
      $request,
      action: 'VerifySMSSandboxPhoneNumber',
      version: '2010-03-31',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['VerifySMSSandboxPhoneNumberInput'],
      shapes: shapes,
      resultWrapper: 'VerifySMSSandboxPhoneNumberResult',
    );
  }
}

/// The response from the <code>CheckIfPhoneNumberIsOptedOut</code> action.
class CheckIfPhoneNumberIsOptedOutResponse {
  /// Indicates whether the phone number is opted out:
  ///
  /// <ul>
  /// <li>
  /// <code>true</code> – The phone number is opted out, meaning you cannot
  /// publish SMS messages to it.
  /// </li>
  /// <li>
  /// <code>false</code> – The phone number is opted in, meaning you can publish
  /// SMS messages to it.
  /// </li>
  /// </ul>
  final bool? isOptedOut;

  CheckIfPhoneNumberIsOptedOutResponse({
    this.isOptedOut,
  });

  factory CheckIfPhoneNumberIsOptedOutResponse.fromJson(
      Map<String, dynamic> json) {
    return CheckIfPhoneNumberIsOptedOutResponse(
      isOptedOut: json['isOptedOut'] as bool?,
    );
  }

  factory CheckIfPhoneNumberIsOptedOutResponse.fromXml(_s.XmlElement elem) {
    return CheckIfPhoneNumberIsOptedOutResponse(
      isOptedOut: _s.extractXmlBoolValue(elem, 'isOptedOut'),
    );
  }

  Map<String, dynamic> toJson() {
    final isOptedOut = this.isOptedOut;
    return {
      if (isOptedOut != null) 'isOptedOut': isOptedOut,
    };
  }
}

/// Response for ConfirmSubscriptions action.
class ConfirmSubscriptionResponse {
  /// The ARN of the created subscription.
  final String? subscriptionArn;

  ConfirmSubscriptionResponse({
    this.subscriptionArn,
  });

  factory ConfirmSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmSubscriptionResponse(
      subscriptionArn: json['SubscriptionArn'] as String?,
    );
  }

  factory ConfirmSubscriptionResponse.fromXml(_s.XmlElement elem) {
    return ConfirmSubscriptionResponse(
      subscriptionArn: _s.extractXmlStringValue(elem, 'SubscriptionArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionArn = this.subscriptionArn;
    return {
      if (subscriptionArn != null) 'SubscriptionArn': subscriptionArn,
    };
  }
}

/// Response from CreateEndpoint action.
class CreateEndpointResponse {
  /// EndpointArn returned from CreateEndpoint action.
  final String? endpointArn;

  CreateEndpointResponse({
    this.endpointArn,
  });

  factory CreateEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateEndpointResponse(
      endpointArn: json['EndpointArn'] as String?,
    );
  }

  factory CreateEndpointResponse.fromXml(_s.XmlElement elem) {
    return CreateEndpointResponse(
      endpointArn: _s.extractXmlStringValue(elem, 'EndpointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointArn = this.endpointArn;
    return {
      if (endpointArn != null) 'EndpointArn': endpointArn,
    };
  }
}

/// Response from CreatePlatformApplication action.
class CreatePlatformApplicationResponse {
  /// PlatformApplicationArn is returned.
  final String? platformApplicationArn;

  CreatePlatformApplicationResponse({
    this.platformApplicationArn,
  });

  factory CreatePlatformApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePlatformApplicationResponse(
      platformApplicationArn: json['PlatformApplicationArn'] as String?,
    );
  }

  factory CreatePlatformApplicationResponse.fromXml(_s.XmlElement elem) {
    return CreatePlatformApplicationResponse(
      platformApplicationArn:
          _s.extractXmlStringValue(elem, 'PlatformApplicationArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final platformApplicationArn = this.platformApplicationArn;
    return {
      if (platformApplicationArn != null)
        'PlatformApplicationArn': platformApplicationArn,
    };
  }
}

class CreateSMSSandboxPhoneNumberResult {
  CreateSMSSandboxPhoneNumberResult();

  factory CreateSMSSandboxPhoneNumberResult.fromJson(Map<String, dynamic> _) {
    return CreateSMSSandboxPhoneNumberResult();
  }

  factory CreateSMSSandboxPhoneNumberResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return CreateSMSSandboxPhoneNumberResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response from CreateTopic action.
class CreateTopicResponse {
  /// The Amazon Resource Name (ARN) assigned to the created topic.
  final String? topicArn;

  CreateTopicResponse({
    this.topicArn,
  });

  factory CreateTopicResponse.fromJson(Map<String, dynamic> json) {
    return CreateTopicResponse(
      topicArn: json['TopicArn'] as String?,
    );
  }

  factory CreateTopicResponse.fromXml(_s.XmlElement elem) {
    return CreateTopicResponse(
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

class DeleteSMSSandboxPhoneNumberResult {
  DeleteSMSSandboxPhoneNumberResult();

  factory DeleteSMSSandboxPhoneNumberResult.fromJson(Map<String, dynamic> _) {
    return DeleteSMSSandboxPhoneNumberResult();
  }

  factory DeleteSMSSandboxPhoneNumberResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteSMSSandboxPhoneNumberResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Endpoint for mobile app and device.
class Endpoint {
  /// Attributes for endpoint.
  final Map<String, String>? attributes;

  /// EndpointArn for mobile app and device.
  final String? endpointArn;

  Endpoint({
    this.attributes,
    this.endpointArn,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      endpointArn: json['EndpointArn'] as String?,
    );
  }

  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      attributes: Map.fromEntries(
        elem.getElement('Attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      endpointArn: _s.extractXmlStringValue(elem, 'EndpointArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final endpointArn = this.endpointArn;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (endpointArn != null) 'EndpointArn': endpointArn,
    };
  }
}

/// Response from GetEndpointAttributes of the EndpointArn.
class GetEndpointAttributesResponse {
  /// Attributes include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CustomUserData</code> – arbitrary user data to associate with the
  /// endpoint. Amazon SNS does not use this data. The data must be in UTF-8
  /// format and less than 2KB.
  /// </li>
  /// <li>
  /// <code>Enabled</code> – flag that enables/disables delivery to the endpoint.
  /// Amazon SNS will set this to false when a notification service indicates to
  /// Amazon SNS that the endpoint is invalid. Users can set it back to true,
  /// typically after updating Token.
  /// </li>
  /// <li>
  /// <code>Token</code> – device token, also referred to as a registration id,
  /// for an app and mobile device. This is returned from the notification service
  /// when an app and mobile device are registered with the notification service.
  /// <note>
  /// The device token for the iOS platform is returned in lowercase.
  /// </note> </li>
  /// </ul>
  final Map<String, String>? attributes;

  GetEndpointAttributesResponse({
    this.attributes,
  });

  factory GetEndpointAttributesResponse.fromJson(Map<String, dynamic> json) {
    return GetEndpointAttributesResponse(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  factory GetEndpointAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetEndpointAttributesResponse(
      attributes: Map.fromEntries(
        elem.getElement('Attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Response for GetPlatformApplicationAttributes action.
class GetPlatformApplicationAttributesResponse {
  /// Attributes include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>EventEndpointCreated</code> – Topic ARN to which EndpointCreated event
  /// notifications should be sent.
  /// </li>
  /// <li>
  /// <code>EventEndpointDeleted</code> – Topic ARN to which EndpointDeleted event
  /// notifications should be sent.
  /// </li>
  /// <li>
  /// <code>EventEndpointUpdated</code> – Topic ARN to which EndpointUpdate event
  /// notifications should be sent.
  /// </li>
  /// <li>
  /// <code>EventDeliveryFailure</code> – Topic ARN to which DeliveryFailure event
  /// notifications should be sent upon Direct Publish delivery failure
  /// (permanent) to one of the application's endpoints.
  /// </li>
  /// </ul>
  final Map<String, String>? attributes;

  GetPlatformApplicationAttributesResponse({
    this.attributes,
  });

  factory GetPlatformApplicationAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPlatformApplicationAttributesResponse(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  factory GetPlatformApplicationAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetPlatformApplicationAttributesResponse(
      attributes: Map.fromEntries(
        elem.getElement('Attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// The response from the <code>GetSMSAttributes</code> request.
class GetSMSAttributesResponse {
  /// The SMS attribute names and their values.
  final Map<String, String>? attributes;

  GetSMSAttributesResponse({
    this.attributes,
  });

  factory GetSMSAttributesResponse.fromJson(Map<String, dynamic> json) {
    return GetSMSAttributesResponse(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  factory GetSMSAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetSMSAttributesResponse(
      attributes: Map.fromEntries(
        elem.getElement('attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'attributes': attributes,
    };
  }
}

class GetSMSSandboxAccountStatusResult {
  /// Indicates whether the calling account is in the SMS sandbox.
  final bool isInSandbox;

  GetSMSSandboxAccountStatusResult({
    required this.isInSandbox,
  });

  factory GetSMSSandboxAccountStatusResult.fromJson(Map<String, dynamic> json) {
    return GetSMSSandboxAccountStatusResult(
      isInSandbox: json['IsInSandbox'] as bool,
    );
  }

  factory GetSMSSandboxAccountStatusResult.fromXml(_s.XmlElement elem) {
    return GetSMSSandboxAccountStatusResult(
      isInSandbox: _s.extractXmlBoolValue(elem, 'IsInSandbox')!,
    );
  }

  Map<String, dynamic> toJson() {
    final isInSandbox = this.isInSandbox;
    return {
      'IsInSandbox': isInSandbox,
    };
  }
}

/// Response for GetSubscriptionAttributes action.
class GetSubscriptionAttributesResponse {
  /// A map of the subscription's attributes. Attributes in this map include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>ConfirmationWasAuthenticated</code> – <code>true</code> if the
  /// subscription confirmation request was authenticated.
  /// </li>
  /// <li>
  /// <code>DeliveryPolicy</code> – The JSON serialization of the subscription's
  /// delivery policy.
  /// </li>
  /// <li>
  /// <code>EffectiveDeliveryPolicy</code> – The JSON serialization of the
  /// effective delivery policy that takes into account the topic delivery policy
  /// and account system defaults.
  /// </li>
  /// <li>
  /// <code>FilterPolicy</code> – The filter policy JSON that is assigned to the
  /// subscription. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html">Amazon
  /// SNS Message Filtering</a> in the <i>Amazon SNS Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>Owner</code> – The account ID of the subscription's owner.
  /// </li>
  /// <li>
  /// <code>PendingConfirmation</code> – <code>true</code> if the subscription
  /// hasn't been confirmed. To confirm a pending subscription, call the
  /// <code>ConfirmSubscription</code> action with a confirmation token.
  /// </li>
  /// <li>
  /// <code>RawMessageDelivery</code> – <code>true</code> if raw message delivery
  /// is enabled for the subscription. Raw messages are free of JSON formatting
  /// and can be sent to HTTP/S and Amazon SQS endpoints.
  /// </li>
  /// <li>
  /// <code>RedrivePolicy</code> – When specified, sends undeliverable messages to
  /// the specified Amazon SQS dead-letter queue. Messages that can't be delivered
  /// due to client errors (for example, when the subscribed endpoint is
  /// unreachable) or server errors (for example, when the service that powers the
  /// subscribed endpoint becomes unavailable) are held in the dead-letter queue
  /// for further analysis or reprocessing.
  /// </li>
  /// <li>
  /// <code>SubscriptionArn</code> – The subscription's ARN.
  /// </li>
  /// <li>
  /// <code>TopicArn</code> – The topic ARN that the subscription is associated
  /// with.
  /// </li>
  /// </ul>
  /// The following attribute applies only to Amazon Kinesis Data Firehose
  /// delivery stream subscriptions:
  ///
  /// <ul>
  /// <li>
  /// <code>SubscriptionRoleArn</code> – The ARN of the IAM role that has the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Permission to write to the Kinesis Data Firehose delivery stream
  /// </li>
  /// <li>
  /// Amazon SNS listed as a trusted entity
  /// </li>
  /// </ul>
  /// Specifying a valid ARN for this attribute is required for Kinesis Data
  /// Firehose delivery stream subscriptions. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html">Fanout
  /// to Kinesis Data Firehose delivery streams</a> in the <i>Amazon SNS Developer
  /// Guide</i>.
  /// </li>
  /// </ul>
  final Map<String, String>? attributes;

  GetSubscriptionAttributesResponse({
    this.attributes,
  });

  factory GetSubscriptionAttributesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSubscriptionAttributesResponse(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  factory GetSubscriptionAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetSubscriptionAttributesResponse(
      attributes: Map.fromEntries(
        elem.getElement('Attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Response for GetTopicAttributes action.
class GetTopicAttributesResponse {
  /// A map of the topic's attributes. Attributes in this map include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>DeliveryPolicy</code> – The JSON serialization of the topic's delivery
  /// policy.
  /// </li>
  /// <li>
  /// <code>DisplayName</code> – The human-readable name used in the
  /// <code>From</code> field for notifications to <code>email</code> and
  /// <code>email-json</code> endpoints.
  /// </li>
  /// <li>
  /// <code>Owner</code> – The account ID of the topic's owner.
  /// </li>
  /// <li>
  /// <code>Policy</code> – The JSON serialization of the topic's access control
  /// policy.
  /// </li>
  /// <li>
  /// <code>SubscriptionsConfirmed</code> – The number of confirmed subscriptions
  /// for the topic.
  /// </li>
  /// <li>
  /// <code>SubscriptionsDeleted</code> – The number of deleted subscriptions for
  /// the topic.
  /// </li>
  /// <li>
  /// <code>SubscriptionsPending</code> – The number of subscriptions pending
  /// confirmation for the topic.
  /// </li>
  /// <li>
  /// <code>TopicArn</code> – The topic's ARN.
  /// </li>
  /// <li>
  /// <code>EffectiveDeliveryPolicy</code> – The JSON serialization of the
  /// effective delivery policy, taking system defaults into account.
  /// </li>
  /// </ul>
  /// The following attribute applies only to <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html">server-side-encryption</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>KmsMasterKeyId</code> - The ID of an Amazon Web Services managed
  /// customer master key (CMK) for Amazon SNS or a custom CMK. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html#sse-key-terms">Key
  /// Terms</a>. For more examples, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">KeyId</a>
  /// in the <i>Key Management Service API Reference</i>.
  /// </li>
  /// </ul>
  /// The following attributes apply only to <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-fifo-topics.html">FIFO
  /// topics</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>FifoTopic</code> – When this is set to <code>true</code>, a FIFO topic
  /// is created.
  /// </li>
  /// <li>
  /// <code>ContentBasedDeduplication</code> – Enables content-based deduplication
  /// for FIFO topics.
  ///
  /// <ul>
  /// <li>
  /// By default, <code>ContentBasedDeduplication</code> is set to
  /// <code>false</code>. If you create a FIFO topic and this attribute is
  /// <code>false</code>, you must specify a value for the
  /// <code>MessageDeduplicationId</code> parameter for the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_Publish.html">Publish</a>
  /// action.
  /// </li>
  /// <li>
  /// When you set <code>ContentBasedDeduplication</code> to <code>true</code>,
  /// Amazon SNS uses a SHA-256 hash to generate the
  /// <code>MessageDeduplicationId</code> using the body of the message (but not
  /// the attributes of the message).
  ///
  /// (Optional) To override the generated value, you can specify a value for the
  /// <code>MessageDeduplicationId</code> parameter for the <code>Publish</code>
  /// action.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final Map<String, String>? attributes;

  GetTopicAttributesResponse({
    this.attributes,
  });

  factory GetTopicAttributesResponse.fromJson(Map<String, dynamic> json) {
    return GetTopicAttributesResponse(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  factory GetTopicAttributesResponse.fromXml(_s.XmlElement elem) {
    return GetTopicAttributesResponse(
      attributes: Map.fromEntries(
        elem.getElement('Attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Supported language code for sending OTP message
enum LanguageCodeString {
  enUs,
  enGb,
  es_419,
  esEs,
  deDe,
  frCa,
  frFr,
  itIt,
  jaJp,
  ptBr,
  krKr,
  zhCn,
  zhTw,
}

extension on LanguageCodeString {
  String toValue() {
    switch (this) {
      case LanguageCodeString.enUs:
        return 'en-US';
      case LanguageCodeString.enGb:
        return 'en-GB';
      case LanguageCodeString.es_419:
        return 'es-419';
      case LanguageCodeString.esEs:
        return 'es-ES';
      case LanguageCodeString.deDe:
        return 'de-DE';
      case LanguageCodeString.frCa:
        return 'fr-CA';
      case LanguageCodeString.frFr:
        return 'fr-FR';
      case LanguageCodeString.itIt:
        return 'it-IT';
      case LanguageCodeString.jaJp:
        return 'ja-JP';
      case LanguageCodeString.ptBr:
        return 'pt-BR';
      case LanguageCodeString.krKr:
        return 'kr-KR';
      case LanguageCodeString.zhCn:
        return 'zh-CN';
      case LanguageCodeString.zhTw:
        return 'zh-TW';
    }
  }
}

extension on String {
  LanguageCodeString toLanguageCodeString() {
    switch (this) {
      case 'en-US':
        return LanguageCodeString.enUs;
      case 'en-GB':
        return LanguageCodeString.enGb;
      case 'es-419':
        return LanguageCodeString.es_419;
      case 'es-ES':
        return LanguageCodeString.esEs;
      case 'de-DE':
        return LanguageCodeString.deDe;
      case 'fr-CA':
        return LanguageCodeString.frCa;
      case 'fr-FR':
        return LanguageCodeString.frFr;
      case 'it-IT':
        return LanguageCodeString.itIt;
      case 'ja-JP':
        return LanguageCodeString.jaJp;
      case 'pt-BR':
        return LanguageCodeString.ptBr;
      case 'kr-KR':
        return LanguageCodeString.krKr;
      case 'zh-CN':
        return LanguageCodeString.zhCn;
      case 'zh-TW':
        return LanguageCodeString.zhTw;
    }
    throw Exception('$this is not known in enum LanguageCodeString');
  }
}

/// Response for ListEndpointsByPlatformApplication action.
class ListEndpointsByPlatformApplicationResponse {
  /// Endpoints returned for ListEndpointsByPlatformApplication action.
  final List<Endpoint>? endpoints;

  /// NextToken string is returned when calling ListEndpointsByPlatformApplication
  /// action if additional records are available after the first page results.
  final String? nextToken;

  ListEndpointsByPlatformApplicationResponse({
    this.endpoints,
    this.nextToken,
  });

  factory ListEndpointsByPlatformApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEndpointsByPlatformApplicationResponse(
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  factory ListEndpointsByPlatformApplicationResponse.fromXml(
      _s.XmlElement elem) {
    return ListEndpointsByPlatformApplicationResponse(
      endpoints: _s.extractXmlChild(elem, 'Endpoints')?.let((elem) =>
          elem.findElements('member').map((c) => Endpoint.fromXml(c)).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nextToken = this.nextToken;
    return {
      if (endpoints != null) 'Endpoints': endpoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOriginationNumbersResult {
  /// A <code>NextToken</code> string is returned when you call the
  /// <code>ListOriginationNumbers</code> operation if additional pages of records
  /// are available.
  final String? nextToken;

  /// A list of the calling account's verified and pending origination numbers.
  final List<PhoneNumberInformation>? phoneNumbers;

  ListOriginationNumbersResult({
    this.nextToken,
    this.phoneNumbers,
  });

  factory ListOriginationNumbersResult.fromJson(Map<String, dynamic> json) {
    return ListOriginationNumbersResult(
      nextToken: json['NextToken'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PhoneNumberInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ListOriginationNumbersResult.fromXml(_s.XmlElement elem) {
    return ListOriginationNumbersResult(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      phoneNumbers: _s.extractXmlChild(elem, 'PhoneNumbers')?.let((elem) => elem
          .findElements('member')
          .map((c) => PhoneNumberInformation.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumbers = this.phoneNumbers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
    };
  }
}

/// The response from the <code>ListPhoneNumbersOptedOut</code> action.
class ListPhoneNumbersOptedOutResponse {
  /// A <code>NextToken</code> string is returned when you call the
  /// <code>ListPhoneNumbersOptedOut</code> action if additional records are
  /// available after the first page of results.
  final String? nextToken;

  /// A list of phone numbers that are opted out of receiving SMS messages. The
  /// list is paginated, and each page can contain up to 100 phone numbers.
  final List<String>? phoneNumbers;

  ListPhoneNumbersOptedOutResponse({
    this.nextToken,
    this.phoneNumbers,
  });

  factory ListPhoneNumbersOptedOutResponse.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumbersOptedOutResponse(
      nextToken: json['nextToken'] as String?,
      phoneNumbers: (json['phoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory ListPhoneNumbersOptedOutResponse.fromXml(_s.XmlElement elem) {
    return ListPhoneNumbersOptedOutResponse(
      nextToken: _s.extractXmlStringValue(elem, 'nextToken'),
      phoneNumbers: _s
          .extractXmlChild(elem, 'phoneNumbers')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumbers = this.phoneNumbers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (phoneNumbers != null) 'phoneNumbers': phoneNumbers,
    };
  }
}

/// Response for ListPlatformApplications action.
class ListPlatformApplicationsResponse {
  /// NextToken string is returned when calling ListPlatformApplications action if
  /// additional records are available after the first page results.
  final String? nextToken;

  /// Platform applications returned when calling ListPlatformApplications action.
  final List<PlatformApplication>? platformApplications;

  ListPlatformApplicationsResponse({
    this.nextToken,
    this.platformApplications,
  });

  factory ListPlatformApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListPlatformApplicationsResponse(
      nextToken: json['NextToken'] as String?,
      platformApplications: (json['PlatformApplications'] as List?)
          ?.whereNotNull()
          .map((e) => PlatformApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ListPlatformApplicationsResponse.fromXml(_s.XmlElement elem) {
    return ListPlatformApplicationsResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      platformApplications: _s
          .extractXmlChild(elem, 'PlatformApplications')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => PlatformApplication.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final platformApplications = this.platformApplications;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (platformApplications != null)
        'PlatformApplications': platformApplications,
    };
  }
}

class ListSMSSandboxPhoneNumbersResult {
  /// A list of the calling account's pending and verified phone numbers.
  final List<SMSSandboxPhoneNumber> phoneNumbers;

  /// A <code>NextToken</code> string is returned when you call the
  /// <code>ListSMSSandboxPhoneNumbersInput</code> operation if additional pages
  /// of records are available.
  final String? nextToken;

  ListSMSSandboxPhoneNumbersResult({
    required this.phoneNumbers,
    this.nextToken,
  });

  factory ListSMSSandboxPhoneNumbersResult.fromJson(Map<String, dynamic> json) {
    return ListSMSSandboxPhoneNumbersResult(
      phoneNumbers: (json['PhoneNumbers'] as List)
          .whereNotNull()
          .map((e) => SMSSandboxPhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  factory ListSMSSandboxPhoneNumbersResult.fromXml(_s.XmlElement elem) {
    return ListSMSSandboxPhoneNumbersResult(
      phoneNumbers: _s
          .extractXmlChild(elem, 'PhoneNumbers')!
          .findElements('member')
          .map((c) => SMSSandboxPhoneNumber.fromXml(c))
          .toList(),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumbers = this.phoneNumbers;
    final nextToken = this.nextToken;
    return {
      'PhoneNumbers': phoneNumbers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Response for ListSubscriptionsByTopic action.
class ListSubscriptionsByTopicResponse {
  /// Token to pass along to the next <code>ListSubscriptionsByTopic</code>
  /// request. This element is returned if there are more subscriptions to
  /// retrieve.
  final String? nextToken;

  /// A list of subscriptions.
  final List<Subscription>? subscriptions;

  ListSubscriptionsByTopicResponse({
    this.nextToken,
    this.subscriptions,
  });

  factory ListSubscriptionsByTopicResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsByTopicResponse(
      nextToken: json['NextToken'] as String?,
      subscriptions: (json['Subscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ListSubscriptionsByTopicResponse.fromXml(_s.XmlElement elem) {
    return ListSubscriptionsByTopicResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      subscriptions: _s.extractXmlChild(elem, 'Subscriptions')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => Subscription.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptions = this.subscriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
  }
}

/// Response for ListSubscriptions action
class ListSubscriptionsResponse {
  /// Token to pass along to the next <code>ListSubscriptions</code> request. This
  /// element is returned if there are more subscriptions to retrieve.
  final String? nextToken;

  /// A list of subscriptions.
  final List<Subscription>? subscriptions;

  ListSubscriptionsResponse({
    this.nextToken,
    this.subscriptions,
  });

  factory ListSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsResponse(
      nextToken: json['NextToken'] as String?,
      subscriptions: (json['Subscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ListSubscriptionsResponse.fromXml(_s.XmlElement elem) {
    return ListSubscriptionsResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      subscriptions: _s.extractXmlChild(elem, 'Subscriptions')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => Subscription.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptions = this.subscriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the specified topic.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ListTagsForResourceResponse.fromXml(_s.XmlElement elem) {
    return ListTagsForResourceResponse(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Response for ListTopics action.
class ListTopicsResponse {
  /// Token to pass along to the next <code>ListTopics</code> request. This
  /// element is returned if there are additional topics to retrieve.
  final String? nextToken;

  /// A list of topic ARNs.
  final List<Topic>? topics;

  ListTopicsResponse({
    this.nextToken,
    this.topics,
  });

  factory ListTopicsResponse.fromJson(Map<String, dynamic> json) {
    return ListTopicsResponse(
      nextToken: json['NextToken'] as String?,
      topics: (json['Topics'] as List?)
          ?.whereNotNull()
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ListTopicsResponse.fromXml(_s.XmlElement elem) {
    return ListTopicsResponse(
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      topics: _s.extractXmlChild(elem, 'Topics')?.let((elem) =>
          elem.findElements('member').map((c) => Topic.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final topics = this.topics;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (topics != null) 'Topics': topics,
    };
  }
}

/// The user-specified message attribute value. For string data types, the value
/// attribute has the same restrictions on the content as the message body. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/sns/latest/api/API_Publish.html">Publish</a>.
///
/// Name, type, and value must not be empty or null. In addition, the message
/// body should not be empty or null. All parts of the message attribute,
/// including name, type, and value, are included in the message size
/// restriction, which is currently 256 KB (262,144 bytes). For more
/// information, see <a
/// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html">Amazon
/// SNS message attributes</a> and <a
/// href="https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html">Publishing
/// to a mobile phone</a> in the <i>Amazon SNS Developer Guide.</i>
class MessageAttributeValue {
  /// Amazon SNS supports the following logical data types: String, String.Array,
  /// Number, and Binary. For more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/SNSMessageAttributes.html#SNSMessageAttributes.DataTypes">Message
  /// Attribute Data Types</a>.
  final String dataType;

  /// Binary type attributes can store any binary data, for example, compressed
  /// data, encrypted data, or images.
  final Uint8List? binaryValue;

  /// Strings are Unicode with UTF8 binary encoding. For a list of code values,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">ASCII
  /// Printable Characters</a>.
  final String? stringValue;

  MessageAttributeValue({
    required this.dataType,
    this.binaryValue,
    this.stringValue,
  });

  factory MessageAttributeValue.fromJson(Map<String, dynamic> json) {
    return MessageAttributeValue(
      dataType: json['DataType'] as String,
      binaryValue: _s.decodeNullableUint8List(json['BinaryValue'] as String?),
      stringValue: json['StringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final binaryValue = this.binaryValue;
    final stringValue = this.stringValue;
    return {
      'DataType': dataType,
      if (binaryValue != null) 'BinaryValue': base64Encode(binaryValue),
      if (stringValue != null) 'StringValue': stringValue,
    };
  }
}

/// Enum listing out all supported number capabilities.
enum NumberCapability {
  sms,
  mms,
  voice,
}

extension on NumberCapability {
  String toValue() {
    switch (this) {
      case NumberCapability.sms:
        return 'SMS';
      case NumberCapability.mms:
        return 'MMS';
      case NumberCapability.voice:
        return 'VOICE';
    }
  }
}

extension on String {
  NumberCapability toNumberCapability() {
    switch (this) {
      case 'SMS':
        return NumberCapability.sms;
      case 'MMS':
        return NumberCapability.mms;
      case 'VOICE':
        return NumberCapability.voice;
    }
    throw Exception('$this is not known in enum NumberCapability');
  }
}

/// The response for the OptInPhoneNumber action.
class OptInPhoneNumberResponse {
  OptInPhoneNumberResponse();

  factory OptInPhoneNumberResponse.fromJson(Map<String, dynamic> _) {
    return OptInPhoneNumberResponse();
  }

  factory OptInPhoneNumberResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return OptInPhoneNumberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A list of phone numbers and their metadata.
class PhoneNumberInformation {
  /// The date and time when the phone number was created.
  final DateTime? createdAt;

  /// The two-character code for the country or region, in ISO 3166-1 alpha-2
  /// format.
  final String? iso2CountryCode;

  /// The capabilities of each phone number.
  final List<NumberCapability>? numberCapabilities;

  /// The phone number.
  final String? phoneNumber;

  /// The list of supported routes.
  final RouteType? routeType;

  /// The status of the phone number.
  final String? status;

  PhoneNumberInformation({
    this.createdAt,
    this.iso2CountryCode,
    this.numberCapabilities,
    this.phoneNumber,
    this.routeType,
    this.status,
  });

  factory PhoneNumberInformation.fromJson(Map<String, dynamic> json) {
    return PhoneNumberInformation(
      createdAt: timeStampFromJson(json['CreatedAt']),
      iso2CountryCode: json['Iso2CountryCode'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNumberCapability())
          .toList(),
      phoneNumber: json['PhoneNumber'] as String?,
      routeType: (json['RouteType'] as String?)?.toRouteType(),
      status: json['Status'] as String?,
    );
  }

  factory PhoneNumberInformation.fromXml(_s.XmlElement elem) {
    return PhoneNumberInformation(
      createdAt: _s.extractXmlDateTimeValue(elem, 'CreatedAt'),
      iso2CountryCode: _s.extractXmlStringValue(elem, 'Iso2CountryCode'),
      numberCapabilities: _s.extractXmlChild(elem, 'NumberCapabilities')?.let(
          (elem) => _s
              .extractXmlStringListValues(elem, 'member')
              .map((s) => s.toNumberCapability())
              .toList()),
      phoneNumber: _s.extractXmlStringValue(elem, 'PhoneNumber'),
      routeType: _s.extractXmlStringValue(elem, 'RouteType')?.toRouteType(),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final iso2CountryCode = this.iso2CountryCode;
    final numberCapabilities = this.numberCapabilities;
    final phoneNumber = this.phoneNumber;
    final routeType = this.routeType;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (iso2CountryCode != null) 'Iso2CountryCode': iso2CountryCode,
      if (numberCapabilities != null)
        'NumberCapabilities':
            numberCapabilities.map((e) => e.toValue()).toList(),
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (routeType != null) 'RouteType': routeType.toValue(),
      if (status != null) 'Status': status,
    };
  }
}

/// Platform application object.
class PlatformApplication {
  /// Attributes for platform application object.
  final Map<String, String>? attributes;

  /// PlatformApplicationArn for platform application object.
  final String? platformApplicationArn;

  PlatformApplication({
    this.attributes,
    this.platformApplicationArn,
  });

  factory PlatformApplication.fromJson(Map<String, dynamic> json) {
    return PlatformApplication(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      platformApplicationArn: json['PlatformApplicationArn'] as String?,
    );
  }

  factory PlatformApplication.fromXml(_s.XmlElement elem) {
    return PlatformApplication(
      attributes: Map.fromEntries(
        elem.getElement('Attributes')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      platformApplicationArn:
          _s.extractXmlStringValue(elem, 'PlatformApplicationArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final platformApplicationArn = this.platformApplicationArn;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (platformApplicationArn != null)
        'PlatformApplicationArn': platformApplicationArn,
    };
  }
}

/// Response for Publish action.
class PublishResponse {
  /// Unique identifier assigned to the published message.
  ///
  /// Length Constraint: Maximum 100 characters
  final String? messageId;

  /// This response element applies only to FIFO (first-in-first-out) topics.
  ///
  /// The sequence number is a large, non-consecutive number that Amazon SNS
  /// assigns to each message. The length of <code>SequenceNumber</code> is 128
  /// bits. <code>SequenceNumber</code> continues to increase for each
  /// <code>MessageGroupId</code>.
  final String? sequenceNumber;

  PublishResponse({
    this.messageId,
    this.sequenceNumber,
  });

  factory PublishResponse.fromJson(Map<String, dynamic> json) {
    return PublishResponse(
      messageId: json['MessageId'] as String?,
      sequenceNumber: json['SequenceNumber'] as String?,
    );
  }

  factory PublishResponse.fromXml(_s.XmlElement elem) {
    return PublishResponse(
      messageId: _s.extractXmlStringValue(elem, 'MessageId'),
      sequenceNumber: _s.extractXmlStringValue(elem, 'SequenceNumber'),
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (messageId != null) 'MessageId': messageId,
      if (sequenceNumber != null) 'SequenceNumber': sequenceNumber,
    };
  }
}

/// Enum listing out all supported route types. The following enum values are
/// supported. 1. Transactional : Non-marketing traffic 2. Promotional :
/// Marketing 3. Premium : Premium routes for OTP delivery to the carriers
enum RouteType {
  transactional,
  promotional,
  premium,
}

extension on RouteType {
  String toValue() {
    switch (this) {
      case RouteType.transactional:
        return 'Transactional';
      case RouteType.promotional:
        return 'Promotional';
      case RouteType.premium:
        return 'Premium';
    }
  }
}

extension on String {
  RouteType toRouteType() {
    switch (this) {
      case 'Transactional':
        return RouteType.transactional;
      case 'Promotional':
        return RouteType.promotional;
      case 'Premium':
        return RouteType.premium;
    }
    throw Exception('$this is not known in enum RouteType');
  }
}

/// A verified or pending destination phone number in the SMS sandbox.
///
/// When you start using Amazon SNS to send SMS messages, your account is in the
/// <i>SMS sandbox</i>. The SMS sandbox provides a safe environment for you to
/// try Amazon SNS features without risking your reputation as an SMS sender.
/// While your account is in the SMS sandbox, you can use all of the features of
/// Amazon SNS. However, you can send SMS messages only to verified destination
/// phone numbers. For more information, including how to move out of the
/// sandbox to send messages without restrictions, see <a
/// href="https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html">SMS
/// sandbox</a> in the <i>Amazon SNS Developer Guide</i>.
class SMSSandboxPhoneNumber {
  /// The destination phone number.
  final String? phoneNumber;

  /// The destination phone number's verification status.
  final SMSSandboxPhoneNumberVerificationStatus? status;

  SMSSandboxPhoneNumber({
    this.phoneNumber,
    this.status,
  });

  factory SMSSandboxPhoneNumber.fromJson(Map<String, dynamic> json) {
    return SMSSandboxPhoneNumber(
      phoneNumber: json['PhoneNumber'] as String?,
      status: (json['Status'] as String?)
          ?.toSMSSandboxPhoneNumberVerificationStatus(),
    );
  }

  factory SMSSandboxPhoneNumber.fromXml(_s.XmlElement elem) {
    return SMSSandboxPhoneNumber(
      phoneNumber: _s.extractXmlStringValue(elem, 'PhoneNumber'),
      status: _s
          .extractXmlStringValue(elem, 'Status')
          ?.toSMSSandboxPhoneNumberVerificationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    final status = this.status;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Enum listing out all supported destination phone number verification
/// statuses. The following enum values are supported. 1. PENDING : The
/// destination phone number is pending verification. 2. VERIFIED : The
/// destination phone number is verified.
enum SMSSandboxPhoneNumberVerificationStatus {
  pending,
  verified,
}

extension on SMSSandboxPhoneNumberVerificationStatus {
  String toValue() {
    switch (this) {
      case SMSSandboxPhoneNumberVerificationStatus.pending:
        return 'Pending';
      case SMSSandboxPhoneNumberVerificationStatus.verified:
        return 'Verified';
    }
  }
}

extension on String {
  SMSSandboxPhoneNumberVerificationStatus
      toSMSSandboxPhoneNumberVerificationStatus() {
    switch (this) {
      case 'Pending':
        return SMSSandboxPhoneNumberVerificationStatus.pending;
      case 'Verified':
        return SMSSandboxPhoneNumberVerificationStatus.verified;
    }
    throw Exception(
        '$this is not known in enum SMSSandboxPhoneNumberVerificationStatus');
  }
}

/// The response for the SetSMSAttributes action.
class SetSMSAttributesResponse {
  SetSMSAttributesResponse();

  factory SetSMSAttributesResponse.fromJson(Map<String, dynamic> _) {
    return SetSMSAttributesResponse();
  }

  factory SetSMSAttributesResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return SetSMSAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response for Subscribe action.
class SubscribeResponse {
  /// The ARN of the subscription if it is confirmed, or the string "pending
  /// confirmation" if the subscription requires confirmation. However, if the API
  /// request parameter <code>ReturnSubscriptionArn</code> is true, then the value
  /// is always the subscription ARN, even if the subscription requires
  /// confirmation.
  final String? subscriptionArn;

  SubscribeResponse({
    this.subscriptionArn,
  });

  factory SubscribeResponse.fromJson(Map<String, dynamic> json) {
    return SubscribeResponse(
      subscriptionArn: json['SubscriptionArn'] as String?,
    );
  }

  factory SubscribeResponse.fromXml(_s.XmlElement elem) {
    return SubscribeResponse(
      subscriptionArn: _s.extractXmlStringValue(elem, 'SubscriptionArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionArn = this.subscriptionArn;
    return {
      if (subscriptionArn != null) 'SubscriptionArn': subscriptionArn,
    };
  }
}

/// A wrapper type for the attributes of an Amazon SNS subscription.
class Subscription {
  /// The subscription's endpoint (format depends on the protocol).
  final String? endpoint;

  /// The subscription's owner.
  final String? owner;

  /// The subscription's protocol.
  final String? protocol;

  /// The subscription's ARN.
  final String? subscriptionArn;

  /// The ARN of the subscription's topic.
  final String? topicArn;

  Subscription({
    this.endpoint,
    this.owner,
    this.protocol,
    this.subscriptionArn,
    this.topicArn,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      endpoint: json['Endpoint'] as String?,
      owner: json['Owner'] as String?,
      protocol: json['Protocol'] as String?,
      subscriptionArn: json['SubscriptionArn'] as String?,
      topicArn: json['TopicArn'] as String?,
    );
  }

  factory Subscription.fromXml(_s.XmlElement elem) {
    return Subscription(
      endpoint: _s.extractXmlStringValue(elem, 'Endpoint'),
      owner: _s.extractXmlStringValue(elem, 'Owner'),
      protocol: _s.extractXmlStringValue(elem, 'Protocol'),
      subscriptionArn: _s.extractXmlStringValue(elem, 'SubscriptionArn'),
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final owner = this.owner;
    final protocol = this.protocol;
    final subscriptionArn = this.subscriptionArn;
    final topicArn = this.topicArn;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
      if (owner != null) 'Owner': owner,
      if (protocol != null) 'Protocol': protocol,
      if (subscriptionArn != null) 'SubscriptionArn': subscriptionArn,
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

/// The list of tags to be added to the specified topic.
class Tag {
  /// The required key portion of the tag.
  final String key;

  /// The optional value portion of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  factory TagResourceResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A wrapper type for the topic's Amazon Resource Name (ARN). To retrieve a
/// topic's attributes, use <code>GetTopicAttributes</code>.
class Topic {
  /// The topic's ARN.
  final String? topicArn;

  Topic({
    this.topicArn,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      topicArn: json['TopicArn'] as String?,
    );
  }

  factory Topic.fromXml(_s.XmlElement elem) {
    return Topic(
      topicArn: _s.extractXmlStringValue(elem, 'TopicArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  factory UntagResourceResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The destination phone number's verification status.
class VerifySMSSandboxPhoneNumberResult {
  VerifySMSSandboxPhoneNumberResult();

  factory VerifySMSSandboxPhoneNumberResult.fromJson(Map<String, dynamic> _) {
    return VerifySMSSandboxPhoneNumberResult();
  }

  factory VerifySMSSandboxPhoneNumberResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return VerifySMSSandboxPhoneNumberResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AuthorizationErrorException extends _s.GenericAwsException {
  AuthorizationErrorException({String? type, String? message})
      : super(
            type: type, code: 'AuthorizationErrorException', message: message);
}

class ConcurrentAccessException extends _s.GenericAwsException {
  ConcurrentAccessException({String? type, String? message})
      : super(type: type, code: 'ConcurrentAccessException', message: message);
}

class EndpointDisabledException extends _s.GenericAwsException {
  EndpointDisabledException({String? type, String? message})
      : super(type: type, code: 'EndpointDisabledException', message: message);
}

class FilterPolicyLimitExceededException extends _s.GenericAwsException {
  FilterPolicyLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'FilterPolicyLimitExceededException',
            message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidSecurityException extends _s.GenericAwsException {
  InvalidSecurityException({String? type, String? message})
      : super(type: type, code: 'InvalidSecurityException', message: message);
}

class KMSAccessDeniedException extends _s.GenericAwsException {
  KMSAccessDeniedException({String? type, String? message})
      : super(type: type, code: 'KMSAccessDeniedException', message: message);
}

class KMSDisabledException extends _s.GenericAwsException {
  KMSDisabledException({String? type, String? message})
      : super(type: type, code: 'KMSDisabledException', message: message);
}

class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String? type, String? message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

class KMSNotFoundException extends _s.GenericAwsException {
  KMSNotFoundException({String? type, String? message})
      : super(type: type, code: 'KMSNotFoundException', message: message);
}

class KMSOptInRequired extends _s.GenericAwsException {
  KMSOptInRequired({String? type, String? message})
      : super(type: type, code: 'KMSOptInRequired', message: message);
}

class KMSThrottlingException extends _s.GenericAwsException {
  KMSThrottlingException({String? type, String? message})
      : super(type: type, code: 'KMSThrottlingException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class OptedOutException extends _s.GenericAwsException {
  OptedOutException({String? type, String? message})
      : super(type: type, code: 'OptedOutException', message: message);
}

class PlatformApplicationDisabledException extends _s.GenericAwsException {
  PlatformApplicationDisabledException({String? type, String? message})
      : super(
            type: type,
            code: 'PlatformApplicationDisabledException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class StaleTagException extends _s.GenericAwsException {
  StaleTagException({String? type, String? message})
      : super(type: type, code: 'StaleTagException', message: message);
}

class SubscriptionLimitExceededException extends _s.GenericAwsException {
  SubscriptionLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionLimitExceededException',
            message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String? type, String? message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class ThrottledException extends _s.GenericAwsException {
  ThrottledException({String? type, String? message})
      : super(type: type, code: 'ThrottledException', message: message);
}

class TopicLimitExceededException extends _s.GenericAwsException {
  TopicLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'TopicLimitExceededException', message: message);
}

class UserErrorException extends _s.GenericAwsException {
  UserErrorException({String? type, String? message})
      : super(type: type, code: 'UserErrorException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

class VerificationException extends _s.GenericAwsException {
  VerificationException({String? type, String? message})
      : super(type: type, code: 'VerificationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthorizationErrorException': (type, message) =>
      AuthorizationErrorException(type: type, message: message),
  'ConcurrentAccessException': (type, message) =>
      ConcurrentAccessException(type: type, message: message),
  'EndpointDisabledException': (type, message) =>
      EndpointDisabledException(type: type, message: message),
  'FilterPolicyLimitExceededException': (type, message) =>
      FilterPolicyLimitExceededException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidSecurityException': (type, message) =>
      InvalidSecurityException(type: type, message: message),
  'KMSAccessDeniedException': (type, message) =>
      KMSAccessDeniedException(type: type, message: message),
  'KMSDisabledException': (type, message) =>
      KMSDisabledException(type: type, message: message),
  'KMSInvalidStateException': (type, message) =>
      KMSInvalidStateException(type: type, message: message),
  'KMSNotFoundException': (type, message) =>
      KMSNotFoundException(type: type, message: message),
  'KMSOptInRequired': (type, message) =>
      KMSOptInRequired(type: type, message: message),
  'KMSThrottlingException': (type, message) =>
      KMSThrottlingException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'OptedOutException': (type, message) =>
      OptedOutException(type: type, message: message),
  'PlatformApplicationDisabledException': (type, message) =>
      PlatformApplicationDisabledException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'StaleTagException': (type, message) =>
      StaleTagException(type: type, message: message),
  'SubscriptionLimitExceededException': (type, message) =>
      SubscriptionLimitExceededException(type: type, message: message),
  'TagLimitExceededException': (type, message) =>
      TagLimitExceededException(type: type, message: message),
  'TagPolicyException': (type, message) =>
      TagPolicyException(type: type, message: message),
  'ThrottledException': (type, message) =>
      ThrottledException(type: type, message: message),
  'TopicLimitExceededException': (type, message) =>
      TopicLimitExceededException(type: type, message: message),
  'UserErrorException': (type, message) =>
      UserErrorException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
  'VerificationException': (type, message) =>
      VerificationException(type: type, message: message),
};
