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

export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Connect is a cloud-based contact center solution that you use to set
/// up and manage a customer contact center and provide reliable customer
/// engagement at any scale.
///
/// Amazon Connect provides metrics and real-time reporting that enable you to
/// optimize contact routing. You can also resolve customer issues more
/// efficiently by getting customers in touch with the appropriate agents.
///
/// There are limits to the number of Amazon Connect resources that you can
/// create. There are also limits to the number of requests that you can make
/// per second. For more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon
/// Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.
///
/// You can connect programmatically to an Amazon Web Services service by using
/// an endpoint. For a list of Amazon Connect endpoints, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/connect_region.html">Amazon
/// Connect Endpoints</a>.
/// <note>
/// Working with contact flows? Check out the <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
/// Connect Flow language</a>.
/// </note>
class Connect {
  final _s.RestJsonProtocol _protocol;
  Connect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'connect',
            signingName: 'connect',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Associates an approved origin to an Amazon Connect instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [origin] :
  /// The domain to add to your allow list.
  Future<void> associateApprovedOrigin({
    required String instanceId,
    required String origin,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(origin, 'origin');
    final $payload = <String, dynamic>{
      'Origin': origin,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/approved-origin',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Allows the specified Amazon Connect instance to access the specified
  /// Amazon Lex or Amazon Lex V2 bot.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [lexV2Bot] :
  /// The Amazon Lex V2 bot to associate with the instance.
  Future<void> associateBot({
    required String instanceId,
    LexBot? lexBot,
    LexV2Bot? lexV2Bot,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (lexBot != null) 'LexBot': lexBot,
      if (lexV2Bot != null) 'LexV2Bot': lexV2Bot,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/bot',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates an existing vocabulary as the default. Contact Lens for Amazon
  /// Connect uses the vocabulary in post-call and real-time analysis sessions
  /// for the given language.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  ///
  /// Parameter [vocabularyId] :
  /// The identifier of the custom vocabulary. If this is empty, the default is
  /// set to none.
  Future<void> associateDefaultVocabulary({
    required String instanceId,
    required VocabularyLanguageCode languageCode,
    String? vocabularyId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    final $payload = <String, dynamic>{
      if (vocabularyId != null) 'VocabularyId': vocabularyId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/default-vocabulary/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(languageCode.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Associates a storage resource type for the first time. You can only
  /// associate one type of storage configuration in a single call. This means,
  /// for example, that you can't define an instance with multiple S3 buckets
  /// for storing chat transcripts.
  ///
  /// This API does not create a resource that doesn't exist. It only associates
  /// it to the instance. Ensure that the resource being specified in the
  /// storage configuration, like an S3 bucket, exists when being used for
  /// association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  ///
  /// Parameter [storageConfig] :
  /// A valid storage type.
  Future<AssociateInstanceStorageConfigResponse>
      associateInstanceStorageConfig({
    required String instanceId,
    required InstanceStorageResourceType resourceType,
    required InstanceStorageConfig storageConfig,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(storageConfig, 'storageConfig');
    final $payload = <String, dynamic>{
      'ResourceType': resourceType.toValue(),
      'StorageConfig': storageConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/storage-config',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateInstanceStorageConfigResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Allows the specified Amazon Connect instance to access the specified
  /// Lambda function.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [functionArn] :
  /// The Amazon Resource Name (ARN) for the Lambda function being associated.
  /// Maximum number of characters allowed is 140.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> associateLambdaFunction({
    required String functionArn,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(functionArn, 'functionArn');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'FunctionArn': functionArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/lambda-function',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Allows the specified Amazon Connect instance to access the specified
  /// Amazon Lex bot.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [lexBot] :
  /// The Amazon Lex bot to associate with the instance.
  Future<void> associateLexBot({
    required String instanceId,
    required LexBot lexBot,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(lexBot, 'lexBot');
    final $payload = <String, dynamic>{
      'LexBot': lexBot,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/lex-bot',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a contact flow with a phone number claimed to your Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [phoneNumberId] :
  /// A unique identifier for the phone number.
  Future<void> associatePhoneNumberContactFlow({
    required String contactFlowId,
    required String instanceId,
    required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'InstanceId': instanceId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/phone-number/${Uri.encodeComponent(phoneNumberId)}/contact-flow',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Associates a set of quick connects with a queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [quickConnectIds] :
  /// The quick connects to associate with this queue.
  Future<void> associateQueueQuickConnects({
    required String instanceId,
    required String queueId,
    required List<String> quickConnectIds,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    ArgumentError.checkNotNull(quickConnectIds, 'quickConnectIds');
    final $payload = <String, dynamic>{
      'QuickConnectIds': quickConnectIds,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/associate-quick-connects',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a set of queues with a routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueConfigs] :
  /// The queues to associate with this routing profile.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> associateRoutingProfileQueues({
    required String instanceId,
    required List<RoutingProfileQueueConfig> queueConfigs,
    required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueConfigs, 'queueConfigs');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final $payload = <String, dynamic>{
      'QueueConfigs': queueConfigs,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/associate-queues',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Associates a security key to the instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [key] :
  /// A valid security key in PEM format.
  Future<AssociateSecurityKeyResponse> associateSecurityKey({
    required String instanceId,
    required String key,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(key, 'key');
    final $payload = <String, dynamic>{
      'Key': key,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/security-key',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateSecurityKeyResponse.fromJson(response);
  }

  /// Claims an available phone number to your Amazon Connect instance.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [IdempotencyException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [phoneNumber] :
  /// The phone number you want to claim. Phone numbers are formatted <code>[+]
  /// [country code] [subscriber number including area code]</code>.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) for Amazon Connect instances that phone
  /// numbers are claimed to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [phoneNumberDescription] :
  /// The description of the phone number.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<ClaimPhoneNumberResponse> claimPhoneNumber({
    required String phoneNumber,
    required String targetArn,
    String? clientToken,
    String? phoneNumberDescription,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    ArgumentError.checkNotNull(targetArn, 'targetArn');
    final $payload = <String, dynamic>{
      'PhoneNumber': phoneNumber,
      'TargetArn': targetArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (phoneNumberDescription != null)
        'PhoneNumberDescription': phoneNumberDescription,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-number/claim',
      exceptionFnMap: _exceptionFns,
    );
    return ClaimPhoneNumberResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Creates an agent status for the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the status.
  ///
  /// Parameter [state] :
  /// The state of the status.
  ///
  /// Parameter [description] :
  /// The description of the status.
  ///
  /// Parameter [displayOrder] :
  /// The display order of the status.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateAgentStatusResponse> createAgentStatus({
    required String instanceId,
    required String name,
    required AgentStatusState state,
    String? description,
    int? displayOrder,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(state, 'state');
    _s.validateNumRange(
      'displayOrder',
      displayOrder,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'State': state.toValue(),
      if (description != null) 'Description': description,
      if (displayOrder != null) 'DisplayOrder': displayOrder,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/agent-status/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAgentStatusResponse.fromJson(response);
  }

  /// Creates a contact flow for the specified Amazon Connect instance.
  ///
  /// You can also create and update contact flows using the <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
  /// Connect Flow language</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidContactFlowException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [content] :
  /// The content of the contact flow.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [name] :
  /// The name of the contact flow.
  ///
  /// Parameter [type] :
  /// The type of the contact flow. For descriptions of the available types, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose
  /// a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// Parameter [description] :
  /// The description of the contact flow.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateContactFlowResponse> createContactFlow({
    required String content,
    required String instanceId,
    required String name,
    required ContactFlowType type,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'Content': content,
      'Name': name,
      'Type': type.toValue(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact-flows/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateContactFlowResponse.fromJson(response);
  }

  /// Creates a contact flow module for the specified Amazon Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidContactFlowModuleException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [IdempotencyException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [content] :
  /// The content of the contact flow module.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the contact flow module.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of the contact flow module.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateContactFlowModuleResponse> createContactFlowModule({
    required String content,
    required String instanceId,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Content': content,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact-flow-modules/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateContactFlowModuleResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Creates hours of operation.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [config] :
  /// Configuration information for the hours of operation: day, start time, and
  /// end time.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the hours of operation.
  ///
  /// Parameter [timeZone] :
  /// The time zone of the hours of operation.
  ///
  /// Parameter [description] :
  /// The description of the hours of operation.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateHoursOfOperationResponse> createHoursOfOperation({
    required List<HoursOfOperationConfig> config,
    required String instanceId,
    required String name,
    required String timeZone,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(config, 'config');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(timeZone, 'timeZone');
    final $payload = <String, dynamic>{
      'Config': config,
      'Name': name,
      'TimeZone': timeZone,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/hours-of-operations/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateHoursOfOperationResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Initiates an Amazon Connect instance with all the supported channels
  /// enabled. It does not attach any storage, such as Amazon Simple Storage
  /// Service (Amazon S3) or Amazon Kinesis. It also does not allow for any
  /// configurations on features, such as Contact Lens for Amazon Connect.
  ///
  /// Amazon Connect enforces a limit on the total number of instances that you
  /// can create or delete in 30 days. If you exceed this limit, you will get an
  /// error message indicating there has been an excessive number of attempts at
  /// creating or deleting instances. You must wait 30 days before you can
  /// restart creating and deleting instances in your account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [identityManagementType] :
  /// The type of identity management for your Amazon Connect users.
  ///
  /// Parameter [inboundCallsEnabled] :
  /// Your contact center handles incoming contacts.
  ///
  /// Parameter [outboundCallsEnabled] :
  /// Your contact center allows outbound calls.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token.
  ///
  /// Parameter [directoryId] :
  /// The identifier for the directory.
  ///
  /// Parameter [instanceAlias] :
  /// The name for your instance.
  Future<CreateInstanceResponse> createInstance({
    required DirectoryType identityManagementType,
    required bool inboundCallsEnabled,
    required bool outboundCallsEnabled,
    String? clientToken,
    String? directoryId,
    String? instanceAlias,
  }) async {
    ArgumentError.checkNotNull(
        identityManagementType, 'identityManagementType');
    ArgumentError.checkNotNull(inboundCallsEnabled, 'inboundCallsEnabled');
    ArgumentError.checkNotNull(outboundCallsEnabled, 'outboundCallsEnabled');
    final $payload = <String, dynamic>{
      'IdentityManagementType': identityManagementType.toValue(),
      'InboundCallsEnabled': inboundCallsEnabled,
      'OutboundCallsEnabled': outboundCallsEnabled,
      if (clientToken != null) 'ClientToken': clientToken,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (instanceAlias != null) 'InstanceAlias': instanceAlias,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/instance',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInstanceResponse.fromJson(response);
  }

  /// Creates an Amazon Web Services resource association with an Amazon Connect
  /// instance.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the integration.
  ///
  /// Parameter [integrationType] :
  /// The type of information to be ingested.
  ///
  /// Parameter [sourceApplicationName] :
  /// The name of the external application. This field is only required for the
  /// EVENT integration type.
  ///
  /// Parameter [sourceApplicationUrl] :
  /// The URL for the external application. This field is only required for the
  /// EVENT integration type.
  ///
  /// Parameter [sourceType] :
  /// The type of the data source. This field is only required for the EVENT
  /// integration type.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateIntegrationAssociationResponse> createIntegrationAssociation({
    required String instanceId,
    required String integrationArn,
    required IntegrationType integrationType,
    String? sourceApplicationName,
    String? sourceApplicationUrl,
    SourceType? sourceType,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(integrationArn, 'integrationArn');
    ArgumentError.checkNotNull(integrationType, 'integrationType');
    final $payload = <String, dynamic>{
      'IntegrationArn': integrationArn,
      'IntegrationType': integrationType.toValue(),
      if (sourceApplicationName != null)
        'SourceApplicationName': sourceApplicationName,
      if (sourceApplicationUrl != null)
        'SourceApplicationUrl': sourceApplicationUrl,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntegrationAssociationResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Creates a new queue for the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hoursOfOperationId] :
  /// The identifier for the hours of operation.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the queue.
  ///
  /// Parameter [description] :
  /// The description of the queue.
  ///
  /// Parameter [maxContacts] :
  /// The maximum number of contacts that can be in the queue before it is
  /// considered full.
  ///
  /// Parameter [outboundCallerConfig] :
  /// The outbound caller ID name, number, and outbound whisper flow.
  ///
  /// Parameter [quickConnectIds] :
  /// The quick connects available to agents who are working the queue.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateQueueResponse> createQueue({
    required String hoursOfOperationId,
    required String instanceId,
    required String name,
    String? description,
    int? maxContacts,
    OutboundCallerConfig? outboundCallerConfig,
    List<String>? quickConnectIds,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(hoursOfOperationId, 'hoursOfOperationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateNumRange(
      'maxContacts',
      maxContacts,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'HoursOfOperationId': hoursOfOperationId,
      'Name': name,
      if (description != null) 'Description': description,
      if (maxContacts != null) 'MaxContacts': maxContacts,
      if (outboundCallerConfig != null)
        'OutboundCallerConfig': outboundCallerConfig,
      if (quickConnectIds != null) 'QuickConnectIds': quickConnectIds,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/queues/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueueResponse.fromJson(response);
  }

  /// Creates a quick connect for the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the quick connect.
  ///
  /// Parameter [quickConnectConfig] :
  /// Configuration settings for the quick connect.
  ///
  /// Parameter [description] :
  /// The description of the quick connect.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateQuickConnectResponse> createQuickConnect({
    required String instanceId,
    required String name,
    required QuickConnectConfig quickConnectConfig,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(quickConnectConfig, 'quickConnectConfig');
    final $payload = <String, dynamic>{
      'Name': name,
      'QuickConnectConfig': quickConnectConfig,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/quick-connects/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateQuickConnectResponse.fromJson(response);
  }

  /// Creates a new routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [defaultOutboundQueueId] :
  /// The default outbound queue for the routing profile.
  ///
  /// Parameter [description] :
  /// Description of the routing profile. Must not be more than 250 characters.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [mediaConcurrencies] :
  /// The channels that agents can handle in the Contact Control Panel (CCP) for
  /// this routing profile.
  ///
  /// Parameter [name] :
  /// The name of the routing profile. Must not be more than 127 characters.
  ///
  /// Parameter [queueConfigs] :
  /// The inbound queues associated with the routing profile. If no queue is
  /// added, the agent can make only outbound calls.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateRoutingProfileResponse> createRoutingProfile({
    required String defaultOutboundQueueId,
    required String description,
    required String instanceId,
    required List<MediaConcurrency> mediaConcurrencies,
    required String name,
    List<RoutingProfileQueueConfig>? queueConfigs,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(
        defaultOutboundQueueId, 'defaultOutboundQueueId');
    ArgumentError.checkNotNull(description, 'description');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(mediaConcurrencies, 'mediaConcurrencies');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'DefaultOutboundQueueId': defaultOutboundQueueId,
      'Description': description,
      'MediaConcurrencies': mediaConcurrencies,
      'Name': name,
      if (queueConfigs != null) 'QueueConfigs': queueConfigs,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/routing-profiles/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoutingProfileResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Creates a security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile.
  ///
  /// Parameter [description] :
  /// The description of the security profile.
  ///
  /// Parameter [permissions] :
  /// Permissions assigned to the security profile.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateSecurityProfileResponse> createSecurityProfile({
    required String instanceId,
    required String securityProfileName,
    String? description,
    List<String>? permissions,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    final $payload = <String, dynamic>{
      'SecurityProfileName': securityProfileName,
      if (description != null) 'Description': description,
      if (permissions != null) 'Permissions': permissions,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/security-profiles/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSecurityProfileResponse.fromJson(response);
  }

  /// Creates a new task template in the specified Amazon Connect instance.
  ///
  /// May throw [PropertyValidationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [fields] :
  /// Fields that are part of the template.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the task template.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [constraints] :
  /// Constraints that are applicable to the fields listed.
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the flow that runs by default when a task is created by
  /// referencing this template.
  ///
  /// Parameter [defaults] :
  /// The default values for fields when a task is created by referencing this
  /// template.
  ///
  /// Parameter [description] :
  /// The description of the task template.
  ///
  /// Parameter [status] :
  /// Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a
  /// task to refer to it. Tasks can only be created from <code>ACTIVE</code>
  /// templates. If a template is marked as <code>INACTIVE</code>, then a task
  /// that refers to this template cannot be created.
  Future<CreateTaskTemplateResponse> createTaskTemplate({
    required List<TaskTemplateField> fields,
    required String instanceId,
    required String name,
    String? clientToken,
    TaskTemplateConstraints? constraints,
    String? contactFlowId,
    TaskTemplateDefaults? defaults,
    String? description,
    TaskTemplateStatus? status,
  }) async {
    ArgumentError.checkNotNull(fields, 'fields');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Fields': fields,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (constraints != null) 'Constraints': constraints,
      if (contactFlowId != null) 'ContactFlowId': contactFlowId,
      if (defaults != null) 'Defaults': defaults,
      if (description != null) 'Description': description,
      if (status != null) 'Status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/task/template',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTaskTemplateResponse.fromJson(response);
  }

  /// Creates a use case for an integration association.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the integration association.
  ///
  /// Parameter [useCaseType] :
  /// The type of use case to associate to the integration association. Each
  /// integration association can have only one of each use case type.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateUseCaseResponse> createUseCase({
    required String instanceId,
    required String integrationAssociationId,
    required UseCaseType useCaseType,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    ArgumentError.checkNotNull(useCaseType, 'useCaseType');
    final $payload = <String, dynamic>{
      'UseCaseType': useCaseType.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations/${Uri.encodeComponent(integrationAssociationId)}/use-cases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUseCaseResponse.fromJson(response);
  }

  /// Creates a user account for the specified Amazon Connect instance.
  ///
  /// For information about how to create user accounts using the Amazon Connect
  /// console, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html">Add
  /// Users</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [phoneConfig] :
  /// The phone settings for the user.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile for the user.
  ///
  /// Parameter [securityProfileIds] :
  /// The identifier of the security profile for the user.
  ///
  /// Parameter [username] :
  /// The user name for the account. For instances not using SAML for identity
  /// management, the user name can include up to 20 characters. If you are
  /// using SAML for identity management, the user name can include up to 64
  /// characters from [a-zA-Z0-9_-.\@]+.
  ///
  /// Parameter [directoryUserId] :
  /// The identifier of the user account in the directory used for identity
  /// management. If Amazon Connect cannot access the directory, you can specify
  /// this identifier to authenticate users. If you include the identifier, we
  /// assume that Amazon Connect cannot access the directory. Otherwise, the
  /// identity information is used to authenticate users from your directory.
  ///
  /// This parameter is required if you are using an existing directory for
  /// identity management in Amazon Connect when Amazon Connect cannot access
  /// your directory to authenticate users. If you are using SAML for identity
  /// management and include this parameter, an error is returned.
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group for the user.
  ///
  /// Parameter [identityInfo] :
  /// The information about the identity of the user.
  ///
  /// Parameter [password] :
  /// The password for the user account. A password is required if you are using
  /// Amazon Connect for identity management. Otherwise, it is an error to
  /// include a password.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateUserResponse> createUser({
    required String instanceId,
    required UserPhoneConfig phoneConfig,
    required String routingProfileId,
    required List<String> securityProfileIds,
    required String username,
    String? directoryUserId,
    String? hierarchyGroupId,
    UserIdentityInfo? identityInfo,
    String? password,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(phoneConfig, 'phoneConfig');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    ArgumentError.checkNotNull(securityProfileIds, 'securityProfileIds');
    ArgumentError.checkNotNull(username, 'username');
    final $payload = <String, dynamic>{
      'PhoneConfig': phoneConfig,
      'RoutingProfileId': routingProfileId,
      'SecurityProfileIds': securityProfileIds,
      'Username': username,
      if (directoryUserId != null) 'DirectoryUserId': directoryUserId,
      if (hierarchyGroupId != null) 'HierarchyGroupId': hierarchyGroupId,
      if (identityInfo != null) 'IdentityInfo': identityInfo,
      if (password != null) 'Password': password,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/users/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResponse.fromJson(response);
  }

  /// Creates a new user hierarchy group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the user hierarchy group. Must not be more than 100
  /// characters.
  ///
  /// Parameter [parentGroupId] :
  /// The identifier for the parent hierarchy group. The user hierarchy is
  /// created at level one if the parent group ID is null.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateUserHierarchyGroupResponse> createUserHierarchyGroup({
    required String instanceId,
    required String name,
    String? parentGroupId,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Name': name,
      if (parentGroupId != null) 'ParentGroupId': parentGroupId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/user-hierarchy-groups/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserHierarchyGroupResponse.fromJson(response);
  }

  /// Creates a custom vocabulary associated with your Amazon Connect instance.
  /// You can set a custom vocabulary to be your default vocabulary for a given
  /// language. Contact Lens for Amazon Connect uses the default vocabulary in
  /// post-call and real-time contact analysis sessions for that language.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [content] :
  /// The content of the custom vocabulary in plain-text format with a table of
  /// values. Each row in the table represents a word or a phrase, described
  /// with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and
  /// <code>DisplayAs</code> fields. Separate the fields with TAB characters.
  /// The size limit is 50KB. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table">Create
  /// a custom vocabulary using a table</a>.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  ///
  /// Parameter [vocabularyName] :
  /// A unique name of the custom vocabulary.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If a create request is received more than once
  /// with same client token, subsequent requests return the previous response
  /// without creating a vocabulary again.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateVocabularyResponse> createVocabulary({
    required String content,
    required String instanceId,
    required VocabularyLanguageCode languageCode,
    required String vocabularyName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final $payload = <String, dynamic>{
      'Content': content,
      'LanguageCode': languageCode.toValue(),
      'VocabularyName': vocabularyName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vocabulary/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVocabularyResponse.fromJson(response);
  }

  /// Deletes a contact flow for the specified Amazon Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> deleteContactFlow({
    required String contactFlowId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/contact-flows/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified contact flow module.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowModuleId] :
  /// The identifier of the contact flow module.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> deleteContactFlowModule({
    required String contactFlowModuleId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowModuleId, 'contactFlowModuleId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/contact-flow-modules/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowModuleId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes an hours of operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hoursOfOperationId] :
  /// The identifier for the hours of operation.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> deleteHoursOfOperation({
    required String hoursOfOperationId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hoursOfOperationId, 'hoursOfOperationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/hours-of-operations/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hoursOfOperationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes the Amazon Connect instance.
  ///
  /// Amazon Connect enforces a limit on the total number of instances that you
  /// can create or delete in 30 days. If you exceed this limit, you will get an
  /// error message indicating there has been an excessive number of attempts at
  /// creating or deleting instances. You must wait 30 days before you can
  /// restart creating and deleting instances in your account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> deleteInstance({
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Web Services resource association from an Amazon Connect
  /// instance. The association must not have any use cases associated with it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the integration association.
  Future<void> deleteIntegrationAssociation({
    required String instanceId,
    required String integrationAssociationId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations/${Uri.encodeComponent(integrationAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a quick connect.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  Future<void> deleteQuickConnect({
    required String instanceId,
    required String quickConnectId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(quickConnectId, 'quickConnectId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/quick-connects/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(quickConnectId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes a security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [securityProfileId] :
  /// The identifier for the security profle.
  Future<void> deleteSecurityProfile({
    required String instanceId,
    required String securityProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(securityProfileId, 'securityProfileId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(securityProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the task template.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [taskTemplateId] :
  /// A unique identifier for the task template.
  Future<void> deleteTaskTemplate({
    required String instanceId,
    required String taskTemplateId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(taskTemplateId, 'taskTemplateId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/task/template/${Uri.encodeComponent(taskTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a use case from an integration association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the integration association.
  ///
  /// Parameter [useCaseId] :
  /// The identifier for the use case.
  Future<void> deleteUseCase({
    required String instanceId,
    required String integrationAssociationId,
    required String useCaseId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    ArgumentError.checkNotNull(useCaseId, 'useCaseId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations/${Uri.encodeComponent(integrationAssociationId)}/use-cases/${Uri.encodeComponent(useCaseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a user account from the specified Amazon Connect instance.
  ///
  /// For information about what happens to a user's data when their account is
  /// deleted, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html">Delete
  /// Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user.
  Future<void> deleteUser({
    required String instanceId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(userId, 'userId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing user hierarchy group. It must not be associated with
  /// any agents or have any active child groups.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> deleteUserHierarchyGroup({
    required String hierarchyGroupId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/user-hierarchy-groups/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hierarchyGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the vocabulary that has the given identifier.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [vocabularyId] :
  /// The identifier of the custom vocabulary.
  Future<DeleteVocabularyResponse> deleteVocabulary({
    required String instanceId,
    required String vocabularyId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(vocabularyId, 'vocabularyId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/vocabulary-remove/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(vocabularyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVocabularyResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Describes an agent status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [agentStatusId] :
  /// The identifier for the agent status.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeAgentStatusResponse> describeAgentStatus({
    required String agentStatusId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(agentStatusId, 'agentStatusId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/agent-status/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(agentStatusId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAgentStatusResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Describes the specified contact.
  /// <important>
  /// Contact information remains available in Amazon Connect for 24 months, and
  /// then it is deleted.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeContactResponse> describeContact({
    required String contactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contacts/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeContactResponse.fromJson(response);
  }

  /// Describes the specified contact flow.
  ///
  /// You can also create and update contact flows using the <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
  /// Connect Flow language</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ContactFlowNotPublishedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<DescribeContactFlowResponse> describeContactFlow({
    required String contactFlowId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact-flows/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeContactFlowResponse.fromJson(response);
  }

  /// Describes the specified contact flow module.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowModuleId] :
  /// The identifier of the contact flow module.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeContactFlowModuleResponse> describeContactFlowModule({
    required String contactFlowModuleId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowModuleId, 'contactFlowModuleId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact-flow-modules/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowModuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeContactFlowModuleResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Describes the hours of operation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hoursOfOperationId] :
  /// The identifier for the hours of operation.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeHoursOfOperationResponse> describeHoursOfOperation({
    required String hoursOfOperationId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hoursOfOperationId, 'hoursOfOperationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/hours-of-operations/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hoursOfOperationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeHoursOfOperationResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns the current state of the specified instance identifier. It tracks
  /// the instance while it is being created and returns an error status, if
  /// applicable.
  ///
  /// If an instance is not created successfully, the instance status reason
  /// field returns details relevant to the reason. The instance in a failed
  /// state is returned only for 24 hours after the CreateInstance API was
  /// invoked.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeInstanceResponse> describeInstance({
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInstanceResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Describes the specified instance attribute.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attributeType] :
  /// The type of attribute.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeInstanceAttributeResponse> describeInstanceAttribute({
    required InstanceAttributeType attributeType,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(attributeType, 'attributeType');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/attribute/${Uri.encodeComponent(attributeType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInstanceAttributeResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Retrieves the current storage configurations for the specified resource
  /// type, association ID, and instance ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationId] :
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  Future<DescribeInstanceStorageConfigResponse> describeInstanceStorageConfig({
    required String associationId,
    required String instanceId,
    required InstanceStorageResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/storage-config/${Uri.encodeComponent(associationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInstanceStorageConfigResponse.fromJson(response);
  }

  /// Gets details and status of a phone number that’s claimed to your Amazon
  /// Connect instance
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [phoneNumberId] :
  /// A unique identifier for the phone number.
  Future<DescribePhoneNumberResponse> describePhoneNumber({
    required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-number/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePhoneNumberResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Describes the specified queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  Future<DescribeQueueResponse> describeQueue({
    required String instanceId,
    required String queueId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeQueueResponse.fromJson(response);
  }

  /// Describes the quick connect.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  Future<DescribeQuickConnectResponse> describeQuickConnect({
    required String instanceId,
    required String quickConnectId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(quickConnectId, 'quickConnectId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/quick-connects/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(quickConnectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeQuickConnectResponse.fromJson(response);
  }

  /// Describes the specified routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<DescribeRoutingProfileResponse> describeRoutingProfile({
    required String instanceId,
    required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRoutingProfileResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Gets basic information about the security profle.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [securityProfileId] :
  /// The identifier for the security profle.
  Future<DescribeSecurityProfileResponse> describeSecurityProfile({
    required String instanceId,
    required String securityProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(securityProfileId, 'securityProfileId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(securityProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSecurityProfileResponse.fromJson(response);
  }

  /// Describes the specified user account. You can find the instance ID in the
  /// console (it’s the final part of the ARN). The console does not display the
  /// user IDs. Instead, list the users and note the IDs provided in the output.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<DescribeUserResponse> describeUser({
    required String instanceId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(userId, 'userId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserResponse.fromJson(response);
  }

  /// Describes the specified hierarchy group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeUserHierarchyGroupResponse> describeUserHierarchyGroup({
    required String hierarchyGroupId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-groups/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hierarchyGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserHierarchyGroupResponse.fromJson(response);
  }

  /// Describes the hierarchy structure of the specified Amazon Connect
  /// instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<DescribeUserHierarchyStructureResponse>
      describeUserHierarchyStructure({
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-structure/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserHierarchyStructureResponse.fromJson(response);
  }

  /// Describes the specified vocabulary.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [vocabularyId] :
  /// The identifier of the custom vocabulary.
  Future<DescribeVocabularyResponse> describeVocabulary({
    required String instanceId,
    required String vocabularyId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(vocabularyId, 'vocabularyId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/vocabulary/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(vocabularyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVocabularyResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Revokes access to integrated applications from Amazon Connect.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [origin] :
  /// The domain URL of the integrated application.
  Future<void> disassociateApprovedOrigin({
    required String instanceId,
    required String origin,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(origin, 'origin');
    final $query = <String, List<String>>{
      'origin': [origin],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/approved-origin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Revokes authorization from the specified instance to access the specified
  /// Amazon Lex or Amazon Lex V2 bot.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [lexV2Bot] :
  /// The Amazon Lex V2 bot to disassociate from the instance.
  Future<void> disassociateBot({
    required String instanceId,
    LexBot? lexBot,
    LexV2Bot? lexV2Bot,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (lexBot != null) 'LexBot': lexBot,
      if (lexV2Bot != null) 'LexV2Bot': lexV2Bot,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/bot',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Removes the storage type configurations for the specified resource type
  /// and association ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationId] :
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  Future<void> disassociateInstanceStorageConfig({
    required String associationId,
    required String instanceId,
    required InstanceStorageResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/storage-config/${Uri.encodeComponent(associationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Remove the Lambda function from the dropdown options available in the
  /// relevant contact flow blocks.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [functionArn] :
  /// The Amazon Resource Name (ARN) of the Lambda function being disassociated.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance..
  Future<void> disassociateLambdaFunction({
    required String functionArn,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(functionArn, 'functionArn');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $query = <String, List<String>>{
      'functionArn': [functionArn],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/lambda-function',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Revokes authorization from the specified instance to access the specified
  /// Amazon Lex bot.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [botName] :
  /// The name of the Amazon Lex bot. Maximum character limit of 50.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [lexRegion] :
  /// The Region in which the Amazon Lex bot has been created.
  Future<void> disassociateLexBot({
    required String botName,
    required String instanceId,
    required String lexRegion,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(lexRegion, 'lexRegion');
    final $query = <String, List<String>>{
      'botName': [botName],
      'lexRegion': [lexRegion],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/lex-bot',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the contact flow association from a phone number claimed to your
  /// Amazon Connect instance, if a contact flow association exists.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [phoneNumberId] :
  /// A unique identifier for the phone number.
  Future<void> disassociatePhoneNumberContactFlow({
    required String instanceId,
    required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final $query = <String, List<String>>{
      'instanceId': [instanceId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/phone-number/${Uri.encodeComponent(phoneNumberId)}/contact-flow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Disassociates a set of quick connects from a queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [quickConnectIds] :
  /// The quick connects to disassociate from the queue.
  Future<void> disassociateQueueQuickConnects({
    required String instanceId,
    required String queueId,
    required List<String> quickConnectIds,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    ArgumentError.checkNotNull(quickConnectIds, 'quickConnectIds');
    final $payload = <String, dynamic>{
      'QuickConnectIds': quickConnectIds,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/disassociate-quick-connects',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a set of queues from a routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueReferences] :
  /// The queues to disassociate from this routing profile.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> disassociateRoutingProfileQueues({
    required String instanceId,
    required List<RoutingProfileQueueReference> queueReferences,
    required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueReferences, 'queueReferences');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final $payload = <String, dynamic>{
      'QueueReferences': queueReferences,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/disassociate-queues',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes the specified security key.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationId] :
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> disassociateSecurityKey({
    required String associationId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/security-key/${Uri.encodeComponent(associationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the contact attributes for the specified contact.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the initial contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<GetContactAttributesResponse> getContactAttributes({
    required String initialContactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact/attributes/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(initialContactId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetContactAttributesResponse.fromJson(response);
  }

  /// Gets the real-time metric data from the specified Amazon Connect instance.
  ///
  /// For a description of each metric, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time
  /// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [currentMetrics] :
  /// The metrics to retrieve. Specify the name and unit for each metric. The
  /// following metrics are available. For a description of all the metrics, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time
  /// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
  /// <dl> <dt>AGENTS_AFTER_CONTACT_WORK</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#aftercallwork-real-time">ACW</a>
  /// </dd> <dt>AGENTS_AVAILABLE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#available-real-time">Available</a>
  /// </dd> <dt>AGENTS_ERROR</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#error-real-time">Error</a>
  /// </dd> <dt>AGENTS_NON_PRODUCTIVE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#non-productive-time-real-time">NPT
  /// (Non-Productive Time)</a>
  /// </dd> <dt>AGENTS_ON_CALL</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time">On
  /// contact</a>
  /// </dd> <dt>AGENTS_ON_CONTACT</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time">On
  /// contact</a>
  /// </dd> <dt>AGENTS_ONLINE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#online-real-time">Online</a>
  /// </dd> <dt>AGENTS_STAFFED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#staffed-real-time">Staffed</a>
  /// </dd> <dt>CONTACTS_IN_QUEUE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#in-queue-real-time">In
  /// queue</a>
  /// </dd> <dt>CONTACTS_SCHEDULED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#scheduled-real-time">Scheduled</a>
  /// </dd> <dt>OLDEST_CONTACT_AGE</dt> <dd>
  /// Unit: SECONDS
  ///
  /// When you use groupings, Unit says SECONDS and the Value is returned in
  /// SECONDS.
  ///
  /// When you do not use groupings, Unit says SECONDS but the Value is returned
  /// in MILLISECONDS. For example, if you get a response like this:
  ///
  /// <code>{ "Metric": { "Name": "OLDEST_CONTACT_AGE", "Unit": "SECONDS" },
  /// "Value": 24113.0 </code>}
  ///
  /// The actual OLDEST_CONTACT_AGE is 24 seconds.
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#oldest-real-time">Oldest</a>
  /// </dd> <dt>SLOTS_ACTIVE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#active-real-time">Active</a>
  /// </dd> <dt>SLOTS_AVAILABLE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Name in real-time metrics report: <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#availability-real-time">Availability</a>
  /// </dd> </dl>
  ///
  /// Parameter [filters] :
  /// The queues, up to 100, or channels, to use to filter the metrics returned.
  /// Metric data is retrieved only for the resources associated with the queues
  /// or channels included in the filter. You can include both queue IDs and
  /// queue ARNs in the same request. VOICE, CHAT, and TASK channels are
  /// supported.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [groupings] :
  /// The grouping applied to the metrics returned. For example, when grouped by
  /// <code>QUEUE</code>, the metrics returned apply to each queue rather than
  /// aggregated for all queues. If you group by <code>CHANNEL</code>, you
  /// should include a Channels filter. VOICE, CHAT, and TASK channels are
  /// supported.
  ///
  /// If no <code>Grouping</code> is included in the request, a summary of
  /// metrics is returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  Future<GetCurrentMetricDataResponse> getCurrentMetricData({
    required List<CurrentMetric> currentMetrics,
    required Filters filters,
    required String instanceId,
    List<Grouping>? groupings,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(currentMetrics, 'currentMetrics');
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'CurrentMetrics': currentMetrics,
      'Filters': filters,
      if (groupings != null)
        'Groupings': groupings.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metrics/current/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCurrentMetricDataResponse.fromJson(response);
  }

  /// Gets the real-time active user data from the specified Amazon Connect
  /// instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [filters] :
  /// Filters up to 100 <code>Queues</code>, or up to 9
  /// <code>ContactStates</code>. The user data is retrieved only for those
  /// users who are associated with the queues and have contacts that are in the
  /// specified <code>ContactState</code>.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetCurrentUserDataResponse> getCurrentUserData({
    required UserDataFilters filters,
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metrics/userdata/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCurrentUserDataResponse.fromJson(response);
  }

  /// Retrieves a token for federation.
  /// <note>
  /// This API doesn't support root users. If you try to invoke
  /// GetFederationToken with root credentials, an error message similar to the
  /// following one appears:
  ///
  /// <code>Provided identity: Principal: .... User: .... cannot be used for
  /// federation with Amazon Connect</code>
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [DuplicateResourceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<GetFederationTokenResponse> getFederationToken({
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/user/federate/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFederationTokenResponse.fromJson(response);
  }

  /// Gets historical metric data from the specified Amazon Connect instance.
  ///
  /// For a description of each historical metric, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical
  /// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The timestamp, in UNIX Epoch time format, at which to end the reporting
  /// interval for the retrieval of historical metrics data. The time must be
  /// specified using an interval of 5 minutes, such as 11:00, 11:05, 11:10, and
  /// must be later than the start time timestamp.
  ///
  /// The time range between the start and end time must be less than 24 hours.
  ///
  /// Parameter [filters] :
  /// The queues, up to 100, or channels, to use to filter the metrics returned.
  /// Metric data is retrieved only for the resources associated with the queues
  /// or channels included in the filter. You can include both queue IDs and
  /// queue ARNs in the same request. VOICE, CHAT, and TASK channels are
  /// supported.
  /// <note>
  /// To filter by <code>Queues</code>, enter the queue ID/ARN, not the name of
  /// the queue.
  /// </note>
  ///
  /// Parameter [historicalMetrics] :
  /// The metrics to retrieve. Specify the name, unit, and statistic for each
  /// metric. The following historical metrics are available. For a description
  /// of each metric, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical
  /// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
  /// <note>
  /// This API does not support a contacts incoming metric (there's no
  /// CONTACTS_INCOMING metric missing from the documented list).
  /// </note> <dl> <dt>ABANDON_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>AFTER_CONTACT_WORK_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>API_CONTACTS_HANDLED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CALLBACK_CONTACTS_HANDLED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_ABANDONED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_AGENT_HUNG_UP_FIRST</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_CONSULTED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HANDLED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HANDLED_INCOMING</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HANDLED_OUTBOUND</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_HOLD_ABANDONS</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_MISSED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_QUEUED</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_IN</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_IN_FROM_QUEUE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_OUT</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt> <dd>
  /// Unit: COUNT
  ///
  /// Statistic: SUM
  /// </dd> <dt>HANDLE_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>HOLD_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>INTERACTION_AND_HOLD_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>INTERACTION_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>OCCUPANCY</dt> <dd>
  /// Unit: PERCENT
  ///
  /// Statistic: AVG
  /// </dd> <dt>QUEUE_ANSWER_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: AVG
  /// </dd> <dt>QUEUED_TIME</dt> <dd>
  /// Unit: SECONDS
  ///
  /// Statistic: MAX
  /// </dd> <dt>SERVICE_LEVEL</dt> <dd>
  /// You can include up to 20 SERVICE_LEVEL metrics in a request.
  ///
  /// Unit: PERCENT
  ///
  /// Statistic: AVG
  ///
  /// Threshold: For <code>ThresholdValue</code>, enter any whole number from 1
  /// to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must
  /// enter <code>LT</code> (for "Less than").
  /// </dd> </dl>
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [startTime] :
  /// The timestamp, in UNIX Epoch time format, at which to start the reporting
  /// interval for the retrieval of historical metrics data. The time must be
  /// specified using a multiple of 5 minutes, such as 10:05, 10:10, 10:15.
  ///
  /// The start time cannot be earlier than 24 hours before the time of the
  /// request. Historical metrics are available only for 24 hours.
  ///
  /// Parameter [groupings] :
  /// The grouping applied to the metrics returned. For example, when results
  /// are grouped by queue, the metrics returned are grouped by queue. The
  /// values returned apply to the metrics for each queue rather than aggregated
  /// for all queues.
  ///
  /// If no grouping is specified, a summary of metrics for all queues is
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetMetricDataResponse> getMetricData({
    required DateTime endTime,
    required Filters filters,
    required List<HistoricalMetric> historicalMetrics,
    required String instanceId,
    required DateTime startTime,
    List<Grouping>? groupings,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(historicalMetrics, 'historicalMetrics');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'Filters': filters,
      'HistoricalMetrics': historicalMetrics,
      'StartTime': unixTimestampToJson(startTime),
      if (groupings != null)
        'Groupings': groupings.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metrics/historical/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetricDataResponse.fromJson(response);
  }

  /// Gets details about a specific task template in the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [taskTemplateId] :
  /// A unique identifier for the task template.
  ///
  /// Parameter [snapshotVersion] :
  /// The system generated version of a task template that is associated with a
  /// task, when the task is created.
  Future<GetTaskTemplateResponse> getTaskTemplate({
    required String instanceId,
    required String taskTemplateId,
    String? snapshotVersion,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(taskTemplateId, 'taskTemplateId');
    final $query = <String, List<String>>{
      if (snapshotVersion != null) 'snapshotVersion': [snapshotVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/task/template/${Uri.encodeComponent(taskTemplateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTaskTemplateResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Lists agent statuses.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [agentStatusTypes] :
  /// Available agent status types.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListAgentStatusResponse> listAgentStatuses({
    required String instanceId,
    List<AgentStatusType>? agentStatusTypes,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (agentStatusTypes != null)
        'AgentStatusTypes': agentStatusTypes.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/agent-status/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentStatusResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of all approved origins associated with the
  /// instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListApprovedOriginsResponse> listApprovedOrigins({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/approved-origins',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApprovedOriginsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// For the specified version of Amazon Lex, returns a paginated list of all
  /// the Amazon Lex bots currently associated with the instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [lexVersion] :
  /// The version of Amazon Lex or Amazon Lex V2.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListBotsResponse> listBots({
    required String instanceId,
    required LexVersion lexVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(lexVersion, 'lexVersion');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      'lexVersion': [lexVersion.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/bots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBotsResponse.fromJson(response);
  }

  /// Provides information about the contact flow modules for the specified
  /// Amazon Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [contactFlowModuleState] :
  /// The state of the contact flow module.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListContactFlowModulesResponse> listContactFlowModules({
    required String instanceId,
    ContactFlowModuleState? contactFlowModuleState,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (contactFlowModuleState != null)
        'state': [contactFlowModuleState.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact-flow-modules-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContactFlowModulesResponse.fromJson(response);
  }

  /// Provides information about the contact flows for the specified Amazon
  /// Connect instance.
  ///
  /// You can also create and update contact flows using the <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
  /// Connect Flow language</a>.
  ///
  /// For more information about contact flows, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html">Contact
  /// Flows</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [contactFlowTypes] :
  /// The type of contact flow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListContactFlowsResponse> listContactFlows({
    required String instanceId,
    List<ContactFlowType>? contactFlowTypes,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (contactFlowTypes != null)
        'contactFlowTypes': contactFlowTypes.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/contact-flows-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContactFlowsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// For the specified <code>referenceTypes</code>, returns a list of
  /// references associated with the contact.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the initial contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [referenceTypes] :
  /// The type of reference.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  /// <important>
  /// This is not expected to be set, because the value returned in the previous
  /// response is always null.
  /// </important>
  Future<ListContactReferencesResponse> listContactReferences({
    required String contactId,
    required String instanceId,
    required List<ReferenceType> referenceTypes,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(referenceTypes, 'referenceTypes');
    final $query = <String, List<String>>{
      'referenceTypes': referenceTypes.map((e) => e.toValue()).toList(),
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact/references/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListContactReferencesResponse.fromJson(response);
  }

  /// Lists the default vocabularies for the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListDefaultVocabulariesResponse> listDefaultVocabularies({
    required String instanceId,
    VocabularyLanguageCode? languageCode,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/default-vocabulary-summary/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListDefaultVocabulariesResponse.fromJson(response);
  }

  /// Provides information about the hours of operation for the specified Amazon
  /// Connect instance.
  ///
  /// For more information about hours of operation, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/set-hours-operation.html">Set
  /// the Hours of Operation for a Queue</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListHoursOfOperationsResponse> listHoursOfOperations({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/hours-of-operations-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHoursOfOperationsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of all attribute types for the given instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListInstanceAttributesResponse> listInstanceAttributes({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      7,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/attributes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstanceAttributesResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of storage configs for the identified instance
  /// and resource type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListInstanceStorageConfigsResponse> listInstanceStorageConfigs({
    required String instanceId,
    required InstanceStorageResourceType resourceType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/storage-configs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstanceStorageConfigsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Return a list of instances which are in active state, creation-in-progress
  /// state, and failed state. Instances that aren't successfully created (they
  /// are in a failed state) are returned only for 24 hours after the
  /// CreateInstance API was invoked.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListInstancesResponse> listInstances({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInstancesResponse.fromJson(response);
  }

  /// Provides summary information about the Amazon Web Services resource
  /// associations for the specified Amazon Connect instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [integrationType] :
  /// The integration type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListIntegrationAssociationsResponse> listIntegrationAssociations({
    required String instanceId,
    IntegrationType? integrationType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (integrationType != null)
        'integrationType': [integrationType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIntegrationAssociationsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of all Lambda functions that display in the
  /// dropdown options in the relevant contact flow blocks.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListLambdaFunctionsResponse> listLambdaFunctions({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/lambda-functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLambdaFunctionsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of all the Amazon Lex bots currently associated
  /// with the instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page. If no value is
  /// specified, the default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListLexBotsResponse> listLexBots({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/lex-bots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLexBotsResponse.fromJson(response);
  }

  /// Provides information about the phone numbers for the specified Amazon
  /// Connect instance.
  ///
  /// For more information about phone numbers, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set
  /// Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [phoneNumberCountryCodes] :
  /// The ISO country code.
  ///
  /// Parameter [phoneNumberTypes] :
  /// The type of phone number.
  Future<ListPhoneNumbersResponse> listPhoneNumbers({
    required String instanceId,
    int? maxResults,
    String? nextToken,
    List<PhoneNumberCountryCode>? phoneNumberCountryCodes,
    List<PhoneNumberType>? phoneNumberTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (phoneNumberCountryCodes != null)
        'phoneNumberCountryCodes':
            phoneNumberCountryCodes.map((e) => e.toValue()).toList(),
      if (phoneNumberTypes != null)
        'phoneNumberTypes': phoneNumberTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumbersResponse.fromJson(response);
  }

  /// Lists phone numbers claimed to your Amazon Connect instance.
  ///
  /// For more information about phone numbers, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html">Set
  /// Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [phoneNumberCountryCodes] :
  /// The ISO country code.
  ///
  /// Parameter [phoneNumberPrefix] :
  /// The prefix of the phone number. If provided, it must contain
  /// <code>+</code> as part of the country code.
  ///
  /// Parameter [phoneNumberTypes] :
  /// The type of phone number.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) for Amazon Connect instances that phone
  /// numbers are claimed to. If <code>TargetArn</code> input is not provided,
  /// this API lists numbers claimed to all the Amazon Connect instances
  /// belonging to your account.
  Future<ListPhoneNumbersV2Response> listPhoneNumbersV2({
    int? maxResults,
    String? nextToken,
    List<PhoneNumberCountryCode>? phoneNumberCountryCodes,
    String? phoneNumberPrefix,
    List<PhoneNumberType>? phoneNumberTypes,
    String? targetArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumberCountryCodes != null)
        'PhoneNumberCountryCodes':
            phoneNumberCountryCodes.map((e) => e.toValue()).toList(),
      if (phoneNumberPrefix != null) 'PhoneNumberPrefix': phoneNumberPrefix,
      if (phoneNumberTypes != null)
        'PhoneNumberTypes': phoneNumberTypes.map((e) => e.toValue()).toList(),
      if (targetArn != null) 'TargetArn': targetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-number/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumbersV2Response.fromJson(response);
  }

  /// Provides information about the prompts for the specified Amazon Connect
  /// instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListPromptsResponse> listPrompts({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prompts-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPromptsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Lists the quick connects associated with a queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListQueueQuickConnectsResponse> listQueueQuickConnects({
    required String instanceId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/quick-connects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueQuickConnectsResponse.fromJson(response);
  }

  /// Provides information about the queues for the specified Amazon Connect
  /// instance.
  ///
  /// If you do not specify a <code>QueueTypes</code> parameter, both standard
  /// and agent queues are returned. This might cause an unexpected truncation
  /// of results if you have more than 1000 agents and you limit the number of
  /// results of the API call in code.
  ///
  /// For more information about queues, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html">Queues:
  /// Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [queueTypes] :
  /// The type of queue.
  Future<ListQueuesResponse> listQueues({
    required String instanceId,
    int? maxResults,
    String? nextToken,
    List<QueueType>? queueTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (queueTypes != null)
        'queueTypes': queueTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/queues-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueuesResponse.fromJson(response);
  }

  /// Provides information about the quick connects for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [quickConnectTypes] :
  /// The type of quick connect. In the Amazon Connect console, when you create
  /// a quick connect, you are prompted to assign one of the following types:
  /// Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).
  Future<ListQuickConnectsResponse> listQuickConnects({
    required String instanceId,
    int? maxResults,
    String? nextToken,
    List<QuickConnectType>? quickConnectTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (quickConnectTypes != null)
        'QuickConnectTypes': quickConnectTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/quick-connects/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQuickConnectsResponse.fromJson(response);
  }

  /// Lists the queues associated with a routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListRoutingProfileQueuesResponse> listRoutingProfileQueues({
    required String instanceId,
    required String routingProfileId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/queues',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutingProfileQueuesResponse.fromJson(response);
  }

  /// Provides summary information about the routing profiles for the specified
  /// Amazon Connect instance.
  ///
  /// For more information about routing profiles, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing.html">Routing
  /// Profiles</a> and <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/routing-profiles.html">Create
  /// a Routing Profile</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListRoutingProfilesResponse> listRoutingProfiles({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routing-profiles-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutingProfilesResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of all security keys associated with the
  /// instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSecurityKeysResponse> listSecurityKeys({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/security-keys',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityKeysResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Lists the permissions granted to a security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [securityProfileId] :
  /// The identifier for the security profle.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSecurityProfilePermissionsResponse>
      listSecurityProfilePermissions({
    required String instanceId,
    required String securityProfileId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(securityProfileId, 'securityProfileId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles-permissions/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(securityProfileId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilePermissionsResponse.fromJson(response);
  }

  /// Provides summary information about the security profiles for the specified
  /// Amazon Connect instance.
  ///
  /// For more information about security profiles, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/connect-security-profiles.html">Security
  /// Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSecurityProfilesResponse> listSecurityProfiles({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilesResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// For sample policies that use tags, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon
  /// Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists task templates for the specified Amazon Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  /// <important>
  /// It is not expected that you set this.
  /// </important>
  ///
  /// Parameter [name] :
  /// The name of the task template.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  /// <important>
  /// It is not expected that you set this because the value returned in the
  /// previous response is always null.
  /// </important>
  ///
  /// Parameter [status] :
  /// Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a
  /// task to refer to it. Tasks can only be created from <code>ACTIVE</code>
  /// templates. If a template is marked as <code>INACTIVE</code>, then a task
  /// that refers to this template cannot be created.
  Future<ListTaskTemplatesResponse> listTaskTemplates({
    required String instanceId,
    int? maxResults,
    String? name,
    String? nextToken,
    TaskTemplateStatus? status,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/task/template',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTaskTemplatesResponse.fromJson(response);
  }

  /// Lists the use cases for the integration association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the integration association.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUseCasesResponse> listUseCases({
    required String instanceId,
    required String integrationAssociationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations/${Uri.encodeComponent(integrationAssociationId)}/use-cases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUseCasesResponse.fromJson(response);
  }

  /// Provides summary information about the hierarchy groups for the specified
  /// Amazon Connect instance.
  ///
  /// For more information about agent hierarchies, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/agent-hierarchy.html">Set
  /// Up Agent Hierarchies</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUserHierarchyGroupsResponse> listUserHierarchyGroups({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-groups-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUserHierarchyGroupsResponse.fromJson(response);
  }

  /// Provides summary information about the users for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUsersResponse> listUsers({
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/users-summary/${Uri.encodeComponent(instanceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Changes the current status of a user or agent in Amazon Connect. If the
  /// agent is currently handling a contact, this sets the agent's next status.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/metrics-agent-status.html">Agent
  /// status</a> and <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/set-next-status.html">Set
  /// your next status</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [agentStatusId] :
  /// The identifier of the agent status.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user.
  Future<void> putUserStatus({
    required String agentStatusId,
    required String instanceId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(agentStatusId, 'agentStatusId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'AgentStatusId': agentStatusId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}/status',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Releases a phone number previously claimed to an Amazon Connect instance.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceInUseException].
  /// May throw [IdempotencyException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [phoneNumberId] :
  /// A unique identifier for the phone number.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<void> releasePhoneNumber({
    required String phoneNumberId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/phone-number/${Uri.encodeComponent(phoneNumberId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// When a contact is being recorded, and the recording has been suspended
  /// using SuspendContactRecording, this API resumes recording the call.
  ///
  /// Only voice recordings are supported at this time.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> resumeContactRecording({
    required String contactId,
    required String initialContactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InitialContactId': initialContactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/resume-recording',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches for available phone numbers that you can claim to your Amazon
  /// Connect instance.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [phoneNumberCountryCode] :
  /// The ISO country code.
  ///
  /// Parameter [phoneNumberType] :
  /// The type of phone number.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) for Amazon Connect instances that phone
  /// numbers are claimed to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [phoneNumberPrefix] :
  /// The prefix of the phone number. If provided, it must contain
  /// <code>+</code> as part of the country code.
  Future<SearchAvailablePhoneNumbersResponse> searchAvailablePhoneNumbers({
    required PhoneNumberCountryCode phoneNumberCountryCode,
    required PhoneNumberType phoneNumberType,
    required String targetArn,
    int? maxResults,
    String? nextToken,
    String? phoneNumberPrefix,
  }) async {
    ArgumentError.checkNotNull(
        phoneNumberCountryCode, 'phoneNumberCountryCode');
    ArgumentError.checkNotNull(phoneNumberType, 'phoneNumberType');
    ArgumentError.checkNotNull(targetArn, 'targetArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $payload = <String, dynamic>{
      'PhoneNumberCountryCode': phoneNumberCountryCode.toValue(),
      'PhoneNumberType': phoneNumberType.toValue(),
      'TargetArn': targetArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumberPrefix != null) 'PhoneNumberPrefix': phoneNumberPrefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-number/search-available',
      exceptionFnMap: _exceptionFns,
    );
    return SearchAvailablePhoneNumbersResponse.fromJson(response);
  }

  /// Searches users in an Amazon Connect instance, with optional filtering.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [searchFilter] :
  /// Filters to be applied to search results.
  Future<SearchUsersResponse> searchUsers({
    String? instanceId,
    int? maxResults,
    String? nextToken,
    UserSearchCriteria? searchCriteria,
    UserSearchFilter? searchFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (instanceId != null) 'InstanceId': instanceId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (searchCriteria != null) 'SearchCriteria': searchCriteria,
      if (searchFilter != null) 'SearchFilter': searchFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/search-users',
      exceptionFnMap: _exceptionFns,
    );
    return SearchUsersResponse.fromJson(response);
  }

  /// Searches for vocabularies within a specific Amazon Connect instance using
  /// <code>State</code>, <code>NameStartsWith</code>, and
  /// <code>LanguageCode</code>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nameStartsWith] :
  /// The starting pattern of the name of the vocabulary.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [state] :
  /// The current state of the custom vocabulary.
  Future<SearchVocabulariesResponse> searchVocabularies({
    required String instanceId,
    VocabularyLanguageCode? languageCode,
    int? maxResults,
    String? nameStartsWith,
    String? nextToken,
    VocabularyState? state,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nameStartsWith != null) 'NameStartsWith': nameStartsWith,
      if (nextToken != null) 'NextToken': nextToken,
      if (state != null) 'State': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vocabulary-summary/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return SearchVocabulariesResponse.fromJson(response);
  }

  /// Initiates a contact flow to start a new chat for the customer. Response of
  /// this API provides a token required to obtain credentials from the <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// API in the Amazon Connect Participant Service.
  ///
  /// When a new chat contact is successfully created, clients must subscribe to
  /// the participant’s connection for the created chat within 5 minutes. This
  /// is achieved by invoking <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// with WEBSOCKET and CONNECTION_CREDENTIALS.
  ///
  /// A 429 error occurs in the following situations:
  ///
  /// <ul>
  /// <li>
  /// API rate limit is exceeded. API TPS throttling returns a
  /// <code>TooManyRequests</code> exception.
  /// </li>
  /// <li>
  /// The <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota
  /// for concurrent active chats</a> is exceeded. Active chat throttling
  /// returns a <code>LimitExceededException</code>.
  /// </li>
  /// </ul>
  /// If you use the <code>ChatDurationInMinutes</code> parameter and receive a
  /// 400 error, your account may not support the ability to configure custom
  /// chat durations. For more information, contact Amazon Web Services Support.
  ///
  /// For more information about chat, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/chat.html">Chat</a>
  /// in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow for initiating the chat. To see the
  /// ContactFlowId in the Amazon Connect console user interface, on the
  /// navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the
  /// contact flow. On the contact flow page, under the name of the contact
  /// flow, choose <b>Show additional flow information</b>. The ContactFlowId is
  /// the last part of the ARN, shown here in bold:
  ///
  /// arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b>
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [participantDetails] :
  /// Information identifying the participant.
  ///
  /// Parameter [attributes] :
  /// A custom key-value pair using an attribute map. The attributes are
  /// standard Amazon Connect attributes. They can be accessed in contact flows
  /// just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  ///
  /// Parameter [chatDurationInMinutes] :
  /// The total duration of the newly started chat session. If not specified,
  /// the chat session duration defaults to 25 hour. The minumum configurable
  /// time is 60 minutes. The maximum configurable time is 10,080 minutes (7
  /// days).
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [initialMessage] :
  /// The initial message to be sent to the newly created chat.
  ///
  /// Parameter [supportedMessagingContentTypes] :
  /// The supported chat message content types. Content types can be text/plain
  /// or both text/plain and text/markdown.
  Future<StartChatContactResponse> startChatContact({
    required String contactFlowId,
    required String instanceId,
    required ParticipantDetails participantDetails,
    Map<String, String>? attributes,
    int? chatDurationInMinutes,
    String? clientToken,
    ChatMessage? initialMessage,
    List<String>? supportedMessagingContentTypes,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(participantDetails, 'participantDetails');
    _s.validateNumRange(
      'chatDurationInMinutes',
      chatDurationInMinutes,
      60,
      10080,
    );
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'InstanceId': instanceId,
      'ParticipantDetails': participantDetails,
      if (attributes != null) 'Attributes': attributes,
      if (chatDurationInMinutes != null)
        'ChatDurationInMinutes': chatDurationInMinutes,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (initialMessage != null) 'InitialMessage': initialMessage,
      if (supportedMessagingContentTypes != null)
        'SupportedMessagingContentTypes': supportedMessagingContentTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/chat',
      exceptionFnMap: _exceptionFns,
    );
    return StartChatContactResponse.fromJson(response);
  }

  /// Starts recording the contact:
  ///
  /// <ul>
  /// <li>
  /// If the API is called <i>before</i> the agent joins the call, recording
  /// starts when the agent joins the call.
  /// </li>
  /// <li>
  /// If the API is called <i>after</i> the agent joins the call, recording
  /// starts at the time of the API call.
  /// </li>
  /// </ul>
  /// StartContactRecording is a one-time action. For example, if you use
  /// StopContactRecording to stop recording an ongoing call, you can't use
  /// StartContactRecording to restart it. For scenarios where the recording has
  /// started and you want to suspend and resume it, such as when collecting
  /// sensitive information (for example, a credit card number), use
  /// SuspendContactRecording and ResumeContactRecording.
  ///
  /// You can use this API to override the recording behavior configured in the
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html">Set
  /// recording behavior</a> block.
  ///
  /// Only voice recordings are supported at this time.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [voiceRecordingConfiguration] :
  /// The person being recorded.
  Future<void> startContactRecording({
    required String contactId,
    required String initialContactId,
    required String instanceId,
    required VoiceRecordingConfiguration voiceRecordingConfiguration,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(
        voiceRecordingConfiguration, 'voiceRecordingConfiguration');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InitialContactId': initialContactId,
      'InstanceId': instanceId,
      'VoiceRecordingConfiguration': voiceRecordingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/start-recording',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Initiates real-time message streaming for a new chat contact.
  ///
  /// For more information about message streaming, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html">Enable
  /// real-time chat message streaming</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [chatStreamingConfiguration] :
  /// The streaming configuration, such as the Amazon SNS streaming endpoint.
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<StartContactStreamingResponse> startContactStreaming({
    required ChatStreamingConfiguration chatStreamingConfiguration,
    required String contactId,
    required String instanceId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(
        chatStreamingConfiguration, 'chatStreamingConfiguration');
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ChatStreamingConfiguration': chatStreamingConfiguration,
      'ContactId': contactId,
      'InstanceId': instanceId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/start-streaming',
      exceptionFnMap: _exceptionFns,
    );
    return StartContactStreamingResponse.fromJson(response);
  }

  /// Places an outbound call to a contact, and then initiates the contact flow.
  /// It performs the actions in the contact flow that's specified (in
  /// <code>ContactFlowId</code>).
  ///
  /// Agents do not initiate the outbound API, which means that they do not dial
  /// the contact. If the contact flow places an outbound call to a contact, and
  /// then puts the contact in queue, the call is then routed to the agent, like
  /// any other inbound case.
  ///
  /// There is a 60-second dialing timeout for this operation. If the call is
  /// not connected after 60 seconds, it fails.
  /// <note>
  /// UK numbers with a 447 prefix are not allowed by default. Before you can
  /// dial these UK mobile numbers, you must submit a service quota increase
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon
  /// Connect Service Quotas</a> in the <i>Amazon Connect Administrator
  /// Guide</i>.
  /// </note> <note>
  /// Campaign calls are not allowed by default. Before you can make a call with
  /// <code>TrafficType</code> = <code>CAMPAIGN</code>, you must submit a
  /// service quota increase request. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon
  /// Connect Service Quotas</a> in the <i>Amazon Connect Administrator
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [LimitExceededException].
  /// May throw [DestinationNotAllowedException].
  /// May throw [OutboundContactNotPermittedException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow for the outbound call. To see the
  /// ContactFlowId in the Amazon Connect console user interface, on the
  /// navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the
  /// contact flow. On the contact flow page, under the name of the contact
  /// flow, choose <b>Show additional flow information</b>. The ContactFlowId is
  /// the last part of the ARN, shown here in bold:
  ///
  /// arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b>
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The phone number of the customer, in E.164 format.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [answerMachineDetectionConfig] :
  /// Configuration of the answering machine detection for this outbound call.
  ///
  /// Parameter [attributes] :
  /// A custom key-value pair using an attribute map. The attributes are
  /// standard Amazon Connect attributes, and can be accessed in contact flows
  /// just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  ///
  /// Parameter [campaignId] :
  /// The campaign identifier of the outbound communication.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. The token is valid for 7 days after creation.
  /// If a contact is already started, the contact ID is returned.
  ///
  /// Parameter [queueId] :
  /// The queue for the call. If you specify a queue, the phone displayed for
  /// caller ID is the phone number specified in the queue. If you do not
  /// specify a queue, the queue defined in the contact flow is used. If you do
  /// not specify a queue, you must specify a source phone number.
  ///
  /// Parameter [sourcePhoneNumber] :
  /// The phone number associated with the Amazon Connect instance, in E.164
  /// format. If you do not specify a source phone number, you must specify a
  /// queue.
  ///
  /// Parameter [trafficType] :
  /// Denotes the class of traffic. Calls with different traffic types are
  /// handled differently by Amazon Connect. The default value is
  /// <code>GENERAL</code>. Use <code>CAMPAIGN</code> if
  /// <code>EnableAnswerMachineDetection</code> is set to <code>true</code>. For
  /// all other cases, use <code>GENERAL</code>.
  Future<StartOutboundVoiceContactResponse> startOutboundVoiceContact({
    required String contactFlowId,
    required String destinationPhoneNumber,
    required String instanceId,
    AnswerMachineDetectionConfig? answerMachineDetectionConfig,
    Map<String, String>? attributes,
    String? campaignId,
    String? clientToken,
    String? queueId,
    String? sourcePhoneNumber,
    TrafficType? trafficType,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(
        destinationPhoneNumber, 'destinationPhoneNumber');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'DestinationPhoneNumber': destinationPhoneNumber,
      'InstanceId': instanceId,
      if (answerMachineDetectionConfig != null)
        'AnswerMachineDetectionConfig': answerMachineDetectionConfig,
      if (attributes != null) 'Attributes': attributes,
      if (campaignId != null) 'CampaignId': campaignId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (queueId != null) 'QueueId': queueId,
      if (sourcePhoneNumber != null) 'SourcePhoneNumber': sourcePhoneNumber,
      if (trafficType != null) 'TrafficType': trafficType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/outbound-voice',
      exceptionFnMap: _exceptionFns,
    );
    return StartOutboundVoiceContactResponse.fromJson(response);
  }

  /// Initiates a contact flow to start a new task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of a task that is shown to an agent in the Contact Control Panel
  /// (CCP).
  ///
  /// Parameter [attributes] :
  /// A custom key-value pair using an attribute map. The attributes are
  /// standard Amazon Connect attributes, and can be accessed in contact flows
  /// just like any other contact attributes.
  ///
  /// There can be up to 32,768 UTF-8 bytes across all key-value pairs per
  /// contact. Attribute keys can include only alphanumeric, dash, and
  /// underscore characters.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow for initiating the tasks. To see the
  /// ContactFlowId in the Amazon Connect console user interface, on the
  /// navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the
  /// contact flow. On the contact flow page, under the name of the contact
  /// flow, choose <b>Show additional flow information</b>. The ContactFlowId is
  /// the last part of the ARN, shown here in bold:
  ///
  /// arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b>
  ///
  /// Parameter [description] :
  /// A description of the task that is shown to an agent in the Contact Control
  /// Panel (CCP).
  ///
  /// Parameter [previousContactId] :
  /// The identifier of the previous chat, voice, or task contact.
  ///
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  ///
  /// Parameter [references] :
  /// A formatted URL that is shown to an agent in the Contact Control Panel
  /// (CCP).
  ///
  /// Parameter [scheduledTime] :
  /// The timestamp, in Unix Epoch seconds format, at which to start running the
  /// inbound contact flow. The scheduled time cannot be in the past. It must be
  /// within up to 6 days in future.
  ///
  /// Parameter [taskTemplateId] :
  /// A unique identifier for the task template.
  Future<StartTaskContactResponse> startTaskContact({
    required String instanceId,
    required String name,
    Map<String, String>? attributes,
    String? clientToken,
    String? contactFlowId,
    String? description,
    String? previousContactId,
    String? quickConnectId,
    Map<String, Reference>? references,
    DateTime? scheduledTime,
    String? taskTemplateId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'InstanceId': instanceId,
      'Name': name,
      if (attributes != null) 'Attributes': attributes,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (contactFlowId != null) 'ContactFlowId': contactFlowId,
      if (description != null) 'Description': description,
      if (previousContactId != null) 'PreviousContactId': previousContactId,
      if (quickConnectId != null) 'QuickConnectId': quickConnectId,
      if (references != null) 'References': references,
      if (scheduledTime != null)
        'ScheduledTime': unixTimestampToJson(scheduledTime),
      if (taskTemplateId != null) 'TaskTemplateId': taskTemplateId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/task',
      exceptionFnMap: _exceptionFns,
    );
    return StartTaskContactResponse.fromJson(response);
  }

  /// Ends the specified contact. This call does not work for the following
  /// initiation methods:
  ///
  /// <ul>
  /// <li>
  /// DISCONNECT
  /// </li>
  /// <li>
  /// TRANSFER
  /// </li>
  /// <li>
  /// QUEUE_TRANSFER
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ContactNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The ID of the contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> stopContact({
    required String contactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops recording a call when a contact is being recorded.
  /// StopContactRecording is a one-time action. If you use StopContactRecording
  /// to stop recording an ongoing call, you can't use StartContactRecording to
  /// restart it. For scenarios where the recording has started and you want to
  /// suspend it for sensitive information (for example, to collect a credit
  /// card number), and then restart it, use SuspendContactRecording and
  /// ResumeContactRecording.
  ///
  /// Only voice recordings are supported at this time.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> stopContactRecording({
    required String contactId,
    required String initialContactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InitialContactId': initialContactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/stop-recording',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Ends message streaming on a specified contact. To restart message
  /// streaming on that contact, call the <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html">StartContactStreaming</a>
  /// API.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact. This is the identifier of the contact that
  /// is associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [streamingId] :
  /// The identifier of the streaming configuration enabled.
  Future<void> stopContactStreaming({
    required String contactId,
    required String instanceId,
    required String streamingId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(streamingId, 'streamingId');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InstanceId': instanceId,
      'StreamingId': streamingId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/stop-streaming',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// When a contact is being recorded, this API suspends recording the call.
  /// For example, you might suspend the call recording while collecting
  /// sensitive information, such as a credit card number. Then use
  /// ResumeContactRecording to restart recording.
  ///
  /// The period of time that the recording is suspended is filled with silence
  /// in the final recording.
  ///
  /// Only voice recordings are supported at this time.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> suspendContactRecording({
    required String contactId,
    required String initialContactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InitialContactId': initialContactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/suspend-recording',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// The supported resource types are users, routing profiles, queues, quick
  /// connects, contact flows, agent status, hours of operation, phone number,
  /// security profiles, and task templates.
  ///
  /// For sample policies that use tags, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html">Amazon
  /// Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags. For example, { "tags": {"key1":"value1",
  /// "key2":"value2"} }.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Transfers contacts from one agent or queue to another agent or queue at
  /// any point after a contact is created. You can transfer a contact to
  /// another queue by providing the contact flow which orchestrates the contact
  /// to the destination queue. This gives you more control over contact
  /// handling and helps you adhere to the service level agreement (SLA)
  /// guaranteed to your customers.
  ///
  /// Note the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Transfer is supported for only <code>TASK</code> contacts.
  /// </li>
  /// <li>
  /// Do not use both <code>QueueId</code> and <code>UserId</code> in the same
  /// call.
  /// </li>
  /// <li>
  /// The following contact flow types are supported: Inbound contact flow,
  /// Transfer to agent flow, and Transfer to queue flow.
  /// </li>
  /// <li>
  /// The <code>TransferContact</code> API can be called only on active
  /// contacts.
  /// </li>
  /// <li>
  /// A contact cannot be transferred more than 11 times.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [IdempotencyException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact in this instance of Amazon Connect.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [userId] :
  /// The identifier for the user.
  Future<TransferContactResponse> transferContact({
    required String contactFlowId,
    required String contactId,
    required String instanceId,
    String? clientToken,
    String? queueId,
    String? userId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'ContactId': contactId,
      'InstanceId': instanceId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (queueId != null) 'QueueId': queueId,
      if (userId != null) 'UserId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/transfer',
      exceptionFnMap: _exceptionFns,
    );
    return TransferContactResponse.fromJson(response);
  }

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates agent status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [agentStatusId] :
  /// The identifier of the agent status.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [description] :
  /// The description of the agent status.
  ///
  /// Parameter [displayOrder] :
  /// The display order of the agent status.
  ///
  /// Parameter [name] :
  /// The name of the agent status.
  ///
  /// Parameter [resetOrderNumber] :
  /// A number indicating the reset order of the agent status.
  ///
  /// Parameter [state] :
  /// The state of the agent status.
  Future<void> updateAgentStatus({
    required String agentStatusId,
    required String instanceId,
    String? description,
    int? displayOrder,
    String? name,
    bool? resetOrderNumber,
    AgentStatusState? state,
  }) async {
    ArgumentError.checkNotNull(agentStatusId, 'agentStatusId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateNumRange(
      'displayOrder',
      displayOrder,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (displayOrder != null) 'DisplayOrder': displayOrder,
      if (name != null) 'Name': name,
      if (resetOrderNumber != null) 'ResetOrderNumber': resetOrderNumber,
      if (state != null) 'State': state.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/agent-status/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(agentStatusId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Adds or updates user-defined contact information associated with the
  /// specified contact. At least one field to be updated must be present in the
  /// request.
  /// <important>
  /// You can add or update user-defined contact information for both ongoing
  /// and completed contacts.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with your contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [description] :
  /// The description of the contact.
  ///
  /// Parameter [name] :
  /// The name of the contact.
  ///
  /// Parameter [references] :
  /// Well-formed data on contact, shown to agents on Contact Control Panel
  /// (CCP).
  Future<void> updateContact({
    required String contactId,
    required String instanceId,
    String? description,
    String? name,
    Map<String, Reference>? references,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (references != null) 'References': references,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/contacts/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates user-defined contact attributes associated with the
  /// specified contact.
  ///
  /// You can create or update user-defined attributes for both ongoing and
  /// completed contacts. For example, while the call is active, you can update
  /// the customer's name or the reason the customer called. You can add notes
  /// about steps that the agent took during the call that display to the next
  /// agent that takes the call. You can also update attributes for a contact
  /// using data from your CRM application and save the data with the contact in
  /// Amazon Connect. You could also flag calls for additional analysis, such as
  /// legal review or to identify abusive callers.
  ///
  /// Contact attributes are available in Amazon Connect for 24 months, and are
  /// then deleted. For information about CTR retention and the maximum size of
  /// the CTR attributes section, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits">Feature
  /// specifications</a> in the <i>Amazon Connect Administrator Guide</i>.
  ///
  /// <b>Important:</b> You cannot use the operation to update attributes for
  /// contacts that occurred prior to the release of the API, which was
  /// September 12, 2018. You can update attributes only for contacts that
  /// started after the release of the API. If you attempt to update attributes
  /// for a contact that occurred prior to the release of the API, a 400 error
  /// is returned. This applies also to queued callbacks that were initiated
  /// prior to the release of the API but are still active in your instance.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [attributes] :
  /// The Amazon Connect attributes. These attributes can be accessed in contact
  /// flows just like any other contact attributes.
  ///
  /// You can have up to 32,768 UTF-8 bytes across all attributes for a contact.
  /// Attribute keys can include only alphanumeric, dash, and underscore
  /// characters.
  ///
  /// Parameter [initialContactId] :
  /// The identifier of the contact. This is the identifier of the contact
  /// associated with the first interaction with the contact center.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> updateContactAttributes({
    required Map<String, String> attributes,
    required String initialContactId,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'Attributes': attributes,
      'InitialContactId': initialContactId,
      'InstanceId': instanceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/attributes',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified contact flow.
  ///
  /// You can also create and update contact flows using the <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
  /// Connect Flow language</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidContactFlowException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [content] :
  /// The JSON string that represents contact flow’s content. For an example,
  /// see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language-example.html">Example
  /// contact flow in Amazon Connect Flow language</a> in the <i>Amazon Connect
  /// Administrator Guide</i>.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<void> updateContactFlowContent({
    required String contactFlowId,
    required String content,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'Content': content,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/contact-flows/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowId)}/content',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates metadata about specified contact flow.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [contactFlowState] :
  /// The state of contact flow.
  ///
  /// Parameter [description] :
  /// The description of the contact flow.
  ///
  /// Parameter [name] :
  /// TThe name of the contact flow.
  Future<void> updateContactFlowMetadata({
    required String contactFlowId,
    required String instanceId,
    ContactFlowState? contactFlowState,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (contactFlowState != null)
        'ContactFlowState': contactFlowState.toValue(),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/contact-flows/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowId)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates specified contact flow module for the specified Amazon Connect
  /// instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidContactFlowModuleException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowModuleId] :
  /// The identifier of the contact flow module.
  ///
  /// Parameter [content] :
  /// The content of the contact flow module.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> updateContactFlowModuleContent({
    required String contactFlowModuleId,
    required String content,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowModuleId, 'contactFlowModuleId');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'Content': content,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/contact-flow-modules/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowModuleId)}/content',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates metadata about specified contact flow module.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowModuleId] :
  /// The identifier of the contact flow module.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [description] :
  /// The description of the contact flow module.
  ///
  /// Parameter [name] :
  /// The name of the contact flow module.
  ///
  /// Parameter [state] :
  /// The state of contact flow module.
  Future<void> updateContactFlowModuleMetadata({
    required String contactFlowModuleId,
    required String instanceId,
    String? description,
    String? name,
    ContactFlowModuleState? state,
  }) async {
    ArgumentError.checkNotNull(contactFlowModuleId, 'contactFlowModuleId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/contact-flow-modules/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowModuleId)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The name of the contact flow.
  ///
  /// You can also create and update contact flows using the <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
  /// Connect Flow language</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the contact flow.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [description] :
  /// The description of the contact flow.
  ///
  /// Parameter [name] :
  /// The name of the contact flow.
  Future<void> updateContactFlowName({
    required String contactFlowId,
    required String instanceId,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/contact-flows/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowId)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the scheduled time of a task contact that is already scheduled.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [scheduledTime] :
  /// The timestamp, in Unix Epoch seconds format, at which to start running the
  /// inbound contact flow. The scheduled time cannot be in the past. It must be
  /// within up to 6 days in future.
  Future<void> updateContactSchedule({
    required String contactId,
    required String instanceId,
    required DateTime scheduledTime,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(scheduledTime, 'scheduledTime');
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InstanceId': instanceId,
      'ScheduledTime': unixTimestampToJson(scheduledTime),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/contact/schedule',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the hours of operation.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hoursOfOperationId] :
  /// The identifier of the hours of operation.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [config] :
  /// Configuration information of the hours of operation.
  ///
  /// Parameter [description] :
  /// The description of the hours of operation.
  ///
  /// Parameter [name] :
  /// The name of the hours of operation.
  ///
  /// Parameter [timeZone] :
  /// The time zone of the hours of operation.
  Future<void> updateHoursOfOperation({
    required String hoursOfOperationId,
    required String instanceId,
    List<HoursOfOperationConfig>? config,
    String? description,
    String? name,
    String? timeZone,
  }) async {
    ArgumentError.checkNotNull(hoursOfOperationId, 'hoursOfOperationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      if (config != null) 'Config': config,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (timeZone != null) 'TimeZone': timeZone,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/hours-of-operations/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hoursOfOperationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the value for the specified attribute type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attributeType] :
  /// The type of attribute.
  /// <note>
  /// Only allowlisted customers can consume USE_CUSTOM_TTS_VOICES. To access
  /// this feature, contact Amazon Web Services Support for allowlisting.
  /// </note>
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [value] :
  /// The value for the attribute. Maximum character limit is 100.
  Future<void> updateInstanceAttribute({
    required InstanceAttributeType attributeType,
    required String instanceId,
    required String value,
  }) async {
    ArgumentError.checkNotNull(attributeType, 'attributeType');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(value, 'value');
    final $payload = <String, dynamic>{
      'Value': value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/attribute/${Uri.encodeComponent(attributeType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates an existing configuration for a resource type. This API is
  /// idempotent.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [associationId] :
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  Future<void> updateInstanceStorageConfig({
    required String associationId,
    required String instanceId,
    required InstanceStorageResourceType resourceType,
    required InstanceStorageConfig storageConfig,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(storageConfig, 'storageConfig');
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final $payload = <String, dynamic>{
      'StorageConfig': storageConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/storage-config/${Uri.encodeComponent(associationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates your claimed phone number from its current Amazon Connect instance
  /// to another Amazon Connect instance in the same Region.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  /// May throw [ResourceInUseException].
  /// May throw [IdempotencyException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [phoneNumberId] :
  /// A unique identifier for the phone number.
  ///
  /// Parameter [targetArn] :
  /// The Amazon Resource Name (ARN) for Amazon Connect instances that phone
  /// numbers are claimed to.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<UpdatePhoneNumberResponse> updatePhoneNumber({
    required String phoneNumberId,
    required String targetArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    ArgumentError.checkNotNull(targetArn, 'targetArn');
    final $payload = <String, dynamic>{
      'TargetArn': targetArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/phone-number/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePhoneNumberResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the hours of operation for the specified queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hoursOfOperationId] :
  /// The identifier for the hours of operation.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  Future<void> updateQueueHoursOfOperation({
    required String hoursOfOperationId,
    required String instanceId,
    required String queueId,
  }) async {
    ArgumentError.checkNotNull(hoursOfOperationId, 'hoursOfOperationId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    final $payload = <String, dynamic>{
      'HoursOfOperationId': hoursOfOperationId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/hours-of-operation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the maximum number of contacts allowed in a queue before it is
  /// considered full.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [maxContacts] :
  /// The maximum number of contacts that can be in the queue before it is
  /// considered full.
  Future<void> updateQueueMaxContacts({
    required String instanceId,
    required String queueId,
    int? maxContacts,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    _s.validateNumRange(
      'maxContacts',
      maxContacts,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxContacts != null) 'MaxContacts': maxContacts,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/max-contacts',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the name and description of a queue. At least <code>Name</code> or
  /// <code>Description</code> must be provided.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [description] :
  /// The description of the queue.
  ///
  /// Parameter [name] :
  /// The name of the queue.
  Future<void> updateQueueName({
    required String instanceId,
    required String queueId,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the outbound caller ID name, number, and outbound whisper flow for
  /// a specified queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [outboundCallerConfig] :
  /// The outbound caller ID name, number, and outbound whisper flow.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  Future<void> updateQueueOutboundCallerConfig({
    required String instanceId,
    required OutboundCallerConfig outboundCallerConfig,
    required String queueId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(outboundCallerConfig, 'outboundCallerConfig');
    ArgumentError.checkNotNull(queueId, 'queueId');
    final $payload = <String, dynamic>{
      'OutboundCallerConfig': outboundCallerConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/outbound-caller-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the status of the queue.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueId] :
  /// The identifier for the queue.
  ///
  /// Parameter [status] :
  /// The status of the queue.
  Future<void> updateQueueStatus({
    required String instanceId,
    required String queueId,
    required QueueStatus status,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueId, 'queueId');
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'Status': status.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/queues/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(queueId)}/status',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration settings for the specified quick connect.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [quickConnectConfig] :
  /// Information about the configuration settings for the quick connect.
  ///
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  Future<void> updateQuickConnectConfig({
    required String instanceId,
    required QuickConnectConfig quickConnectConfig,
    required String quickConnectId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(quickConnectConfig, 'quickConnectConfig');
    ArgumentError.checkNotNull(quickConnectId, 'quickConnectId');
    final $payload = <String, dynamic>{
      'QuickConnectConfig': quickConnectConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/quick-connects/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(quickConnectId)}/config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the name and description of a quick connect. The request accepts
  /// the following data in JSON format. At least <code>Name</code> or
  /// <code>Description</code> must be provided.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  ///
  /// Parameter [description] :
  /// The description of the quick connect.
  ///
  /// Parameter [name] :
  /// The name of the quick connect.
  Future<void> updateQuickConnectName({
    required String instanceId,
    required String quickConnectId,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(quickConnectId, 'quickConnectId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/quick-connects/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(quickConnectId)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the channels that agents can handle in the Contact Control Panel
  /// (CCP) for a routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [mediaConcurrencies] :
  /// The channels that agents can handle in the Contact Control Panel (CCP).
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> updateRoutingProfileConcurrency({
    required String instanceId,
    required List<MediaConcurrency> mediaConcurrencies,
    required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(mediaConcurrencies, 'mediaConcurrencies');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final $payload = <String, dynamic>{
      'MediaConcurrencies': mediaConcurrencies,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the default outbound queue of a routing profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [defaultOutboundQueueId] :
  /// The identifier for the default outbound queue.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> updateRoutingProfileDefaultOutboundQueue({
    required String defaultOutboundQueueId,
    required String instanceId,
    required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(
        defaultOutboundQueueId, 'defaultOutboundQueueId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final $payload = <String, dynamic>{
      'DefaultOutboundQueueId': defaultOutboundQueueId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/default-outbound-queue',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the name and description of a routing profile. The request accepts
  /// the following data in JSON format. At least <code>Name</code> or
  /// <code>Description</code> must be provided.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  ///
  /// Parameter [description] :
  /// The description of the routing profile. Must not be more than 250
  /// characters.
  ///
  /// Parameter [name] :
  /// The name of the routing profile. Must not be more than 127 characters.
  Future<void> updateRoutingProfileName({
    required String instanceId,
    required String routingProfileId,
    String? description,
    String? name,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the properties associated with a set of queues for a routing
  /// profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [queueConfigs] :
  /// The queues to be updated for this routing profile. Queues must first be
  /// associated to the routing profile. You can do this using
  /// AssociateRoutingProfileQueues.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> updateRoutingProfileQueues({
    required String instanceId,
    required List<RoutingProfileQueueConfig> queueConfigs,
    required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(queueConfigs, 'queueConfigs');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    final $payload = <String, dynamic>{
      'QueueConfigs': queueConfigs,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routing-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(routingProfileId)}/queues',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates a security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [securityProfileId] :
  /// The identifier for the security profle.
  ///
  /// Parameter [description] :
  /// The description of the security profile.
  ///
  /// Parameter [permissions] :
  /// The permissions granted to a security profile.
  Future<void> updateSecurityProfile({
    required String instanceId,
    required String securityProfileId,
    String? description,
    List<String>? permissions,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(securityProfileId, 'securityProfileId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (permissions != null) 'Permissions': permissions,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(securityProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates details about a specific task template in the specified Amazon
  /// Connect instance. This operation does not support partial updates. Instead
  /// it does a full update of template content.
  ///
  /// May throw [PropertyValidationException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [taskTemplateId] :
  /// A unique identifier for the task template.
  ///
  /// Parameter [constraints] :
  /// Constraints that are applicable to the fields listed.
  ///
  /// Parameter [contactFlowId] :
  /// The identifier of the flow that runs by default when a task is created by
  /// referencing this template.
  ///
  /// Parameter [defaults] :
  /// The default values for fields when a task is created by referencing this
  /// template.
  ///
  /// Parameter [description] :
  /// The description of the task template.
  ///
  /// Parameter [fields] :
  /// Fields that are part of the template.
  ///
  /// Parameter [name] :
  /// The name of the task template.
  ///
  /// Parameter [status] :
  /// Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a
  /// task to refer to it. Tasks can only be created from <code>ACTIVE</code>
  /// templates. If a template is marked as <code>INACTIVE</code>, then a task
  /// that refers to this template cannot be created.
  Future<UpdateTaskTemplateResponse> updateTaskTemplate({
    required String instanceId,
    required String taskTemplateId,
    TaskTemplateConstraints? constraints,
    String? contactFlowId,
    TaskTemplateDefaults? defaults,
    String? description,
    List<TaskTemplateField>? fields,
    String? name,
    TaskTemplateStatus? status,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(taskTemplateId, 'taskTemplateId');
    final $payload = <String, dynamic>{
      if (constraints != null) 'Constraints': constraints,
      if (contactFlowId != null) 'ContactFlowId': contactFlowId,
      if (defaults != null) 'Defaults': defaults,
      if (description != null) 'Description': description,
      if (fields != null) 'Fields': fields,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/task/template/${Uri.encodeComponent(taskTemplateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTaskTemplateResponse.fromJson(response);
  }

  /// Assigns the specified hierarchy group to the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  Future<void> updateUserHierarchy({
    required String instanceId,
    required String userId,
    String? hierarchyGroupId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      if (hierarchyGroupId != null) 'HierarchyGroupId': hierarchyGroupId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}/hierarchy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the name of the user hierarchy group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [name] :
  /// The name of the hierarchy group. Must not be more than 100 characters.
  Future<void> updateUserHierarchyGroupName({
    required String hierarchyGroupId,
    required String instanceId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/user-hierarchy-groups/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hierarchyGroupId)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the user hierarchy structure: add, remove, and rename user
  /// hierarchy levels.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [hierarchyStructure] :
  /// The hierarchy levels to update.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  Future<void> updateUserHierarchyStructure({
    required HierarchyStructureUpdate hierarchyStructure,
    required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyStructure, 'hierarchyStructure');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    final $payload = <String, dynamic>{
      'HierarchyStructure': hierarchyStructure,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/user-hierarchy-structure/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the identity information for the specified user.
  /// <important>
  /// We strongly recommend limiting who has the ability to invoke
  /// <code>UpdateUserIdentityInfo</code>. Someone with that ability can change
  /// the login credentials of other users by changing their email address. This
  /// poses a security risk to your organization. They can change the email
  /// address of a user to the attacker's email address, and then reset the
  /// password through email. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html">Best
  /// Practices for Security Profiles</a> in the <i>Amazon Connect Administrator
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [identityInfo] :
  /// The identity information for the user.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserIdentityInfo({
    required UserIdentityInfo identityInfo,
    required String instanceId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(identityInfo, 'identityInfo');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'IdentityInfo': identityInfo,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}/identity-info',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the phone configuration settings for the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [phoneConfig] :
  /// Information about phone configuration settings for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserPhoneConfig({
    required String instanceId,
    required UserPhoneConfig phoneConfig,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(phoneConfig, 'phoneConfig');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'PhoneConfig': phoneConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}/phone-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns the specified routing profile to the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserRoutingProfile({
    required String instanceId,
    required String routingProfileId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'RoutingProfileId': routingProfileId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}/routing-profile',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns the specified security profiles to the specified user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  ///
  /// Parameter [securityProfileIds] :
  /// The identifiers of the security profiles for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserSecurityProfiles({
    required String instanceId,
    required List<String> securityProfileIds,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    ArgumentError.checkNotNull(securityProfileIds, 'securityProfileIds');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'SecurityProfileIds': securityProfileIds,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/users/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(userId)}/security-profiles',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Information about the <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Contact.html">contact</a>
/// associated to the user.
class AgentContactReference {
  /// The <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">state
  /// of the contact</a>.
  final ContactState? agentContactState;

  /// The channel of the contact.
  final Channel? channel;

  /// The time at which the contact was connected to an agent.
  final DateTime? connectedToAgentTimestamp;

  /// The identifier of the contact in this instance of Amazon Connect.
  final String? contactId;

  /// How the contact was initiated.
  final ContactInitiationMethod? initiationMethod;
  final QueueReference? queue;

  /// The epoch timestamp when the contact state started.
  final DateTime? stateStartTimestamp;

  AgentContactReference({
    this.agentContactState,
    this.channel,
    this.connectedToAgentTimestamp,
    this.contactId,
    this.initiationMethod,
    this.queue,
    this.stateStartTimestamp,
  });

  factory AgentContactReference.fromJson(Map<String, dynamic> json) {
    return AgentContactReference(
      agentContactState:
          (json['AgentContactState'] as String?)?.toContactState(),
      channel: (json['Channel'] as String?)?.toChannel(),
      connectedToAgentTimestamp:
          timeStampFromJson(json['ConnectedToAgentTimestamp']),
      contactId: json['ContactId'] as String?,
      initiationMethod:
          (json['InitiationMethod'] as String?)?.toContactInitiationMethod(),
      queue: json['Queue'] != null
          ? QueueReference.fromJson(json['Queue'] as Map<String, dynamic>)
          : null,
      stateStartTimestamp: timeStampFromJson(json['StateStartTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentContactState = this.agentContactState;
    final channel = this.channel;
    final connectedToAgentTimestamp = this.connectedToAgentTimestamp;
    final contactId = this.contactId;
    final initiationMethod = this.initiationMethod;
    final queue = this.queue;
    final stateStartTimestamp = this.stateStartTimestamp;
    return {
      if (agentContactState != null)
        'AgentContactState': agentContactState.toValue(),
      if (channel != null) 'Channel': channel.toValue(),
      if (connectedToAgentTimestamp != null)
        'ConnectedToAgentTimestamp':
            unixTimestampToJson(connectedToAgentTimestamp),
      if (contactId != null) 'ContactId': contactId,
      if (initiationMethod != null)
        'InitiationMethod': initiationMethod.toValue(),
      if (queue != null) 'Queue': queue,
      if (stateStartTimestamp != null)
        'StateStartTimestamp': unixTimestampToJson(stateStartTimestamp),
    };
  }
}

/// Information about the agent who accepted the contact.
class AgentInfo {
  /// The timestamp when the contact was connected to the agent.
  final DateTime? connectedToAgentTimestamp;

  /// The identifier of the agent who accepted the contact.
  final String? id;

  AgentInfo({
    this.connectedToAgentTimestamp,
    this.id,
  });

  factory AgentInfo.fromJson(Map<String, dynamic> json) {
    return AgentInfo(
      connectedToAgentTimestamp:
          timeStampFromJson(json['ConnectedToAgentTimestamp']),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectedToAgentTimestamp = this.connectedToAgentTimestamp;
    final id = this.id;
    return {
      if (connectedToAgentTimestamp != null)
        'ConnectedToAgentTimestamp':
            unixTimestampToJson(connectedToAgentTimestamp),
      if (id != null) 'Id': id,
    };
  }
}

/// Contains information about an agent status.
class AgentStatus {
  /// The Amazon Resource Name (ARN) of the agent status.
  final String? agentStatusARN;

  /// The identifier of the agent status.
  final String? agentStatusId;

  /// The description of the agent status.
  final String? description;

  /// The display order of the agent status.
  final int? displayOrder;

  /// The name of the agent status.
  final String? name;

  /// The state of the agent status.
  final AgentStatusState? state;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The type of agent status.
  final AgentStatusType? type;

  AgentStatus({
    this.agentStatusARN,
    this.agentStatusId,
    this.description,
    this.displayOrder,
    this.name,
    this.state,
    this.tags,
    this.type,
  });

  factory AgentStatus.fromJson(Map<String, dynamic> json) {
    return AgentStatus(
      agentStatusARN: json['AgentStatusARN'] as String?,
      agentStatusId: json['AgentStatusId'] as String?,
      description: json['Description'] as String?,
      displayOrder: json['DisplayOrder'] as int?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toAgentStatusState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toAgentStatusType(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentStatusARN = this.agentStatusARN;
    final agentStatusId = this.agentStatusId;
    final description = this.description;
    final displayOrder = this.displayOrder;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    return {
      if (agentStatusARN != null) 'AgentStatusARN': agentStatusARN,
      if (agentStatusId != null) 'AgentStatusId': agentStatusId,
      if (description != null) 'Description': description,
      if (displayOrder != null) 'DisplayOrder': displayOrder,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Information about the agent's status.
class AgentStatusReference {
  /// The Amazon Resource Name (ARN) of the agent's status.
  final String? statusArn;

  /// The start timestamp of the agent's status.
  final DateTime? statusStartTimestamp;

  AgentStatusReference({
    this.statusArn,
    this.statusStartTimestamp,
  });

  factory AgentStatusReference.fromJson(Map<String, dynamic> json) {
    return AgentStatusReference(
      statusArn: json['StatusArn'] as String?,
      statusStartTimestamp: timeStampFromJson(json['StatusStartTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final statusArn = this.statusArn;
    final statusStartTimestamp = this.statusStartTimestamp;
    return {
      if (statusArn != null) 'StatusArn': statusArn,
      if (statusStartTimestamp != null)
        'StatusStartTimestamp': unixTimestampToJson(statusStartTimestamp),
    };
  }
}

enum AgentStatusState {
  enabled,
  disabled,
}

extension on AgentStatusState {
  String toValue() {
    switch (this) {
      case AgentStatusState.enabled:
        return 'ENABLED';
      case AgentStatusState.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  AgentStatusState toAgentStatusState() {
    switch (this) {
      case 'ENABLED':
        return AgentStatusState.enabled;
      case 'DISABLED':
        return AgentStatusState.disabled;
    }
    throw Exception('$this is not known in enum AgentStatusState');
  }
}

/// Summary information for an agent status.
class AgentStatusSummary {
  /// The Amazon Resource Name (ARN) for the agent status.
  final String? arn;

  /// The identifier for an agent status.
  final String? id;

  /// The name of the agent status.
  final String? name;

  /// The type of the agent status.
  final AgentStatusType? type;

  AgentStatusSummary({
    this.arn,
    this.id,
    this.name,
    this.type,
  });

  factory AgentStatusSummary.fromJson(Map<String, dynamic> json) {
    return AgentStatusSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toAgentStatusType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AgentStatusType {
  routable,
  custom,
  offline,
}

extension on AgentStatusType {
  String toValue() {
    switch (this) {
      case AgentStatusType.routable:
        return 'ROUTABLE';
      case AgentStatusType.custom:
        return 'CUSTOM';
      case AgentStatusType.offline:
        return 'OFFLINE';
    }
  }
}

extension on String {
  AgentStatusType toAgentStatusType() {
    switch (this) {
      case 'ROUTABLE':
        return AgentStatusType.routable;
      case 'CUSTOM':
        return AgentStatusType.custom;
      case 'OFFLINE':
        return AgentStatusType.offline;
    }
    throw Exception('$this is not known in enum AgentStatusType');
  }
}

/// Configuration of the answering machine detection.
class AnswerMachineDetectionConfig {
  /// Wait for the answering machine prompt.
  final bool? awaitAnswerMachinePrompt;

  /// The flag to indicate if answer machine detection analysis needs to be
  /// performed for a voice call. If set to <code>true</code>,
  /// <code>TrafficType</code> must be set as <code>CAMPAIGN</code>.
  final bool? enableAnswerMachineDetection;

  AnswerMachineDetectionConfig({
    this.awaitAnswerMachinePrompt,
    this.enableAnswerMachineDetection,
  });

  factory AnswerMachineDetectionConfig.fromJson(Map<String, dynamic> json) {
    return AnswerMachineDetectionConfig(
      awaitAnswerMachinePrompt: json['AwaitAnswerMachinePrompt'] as bool?,
      enableAnswerMachineDetection:
          json['EnableAnswerMachineDetection'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final awaitAnswerMachinePrompt = this.awaitAnswerMachinePrompt;
    final enableAnswerMachineDetection = this.enableAnswerMachineDetection;
    return {
      if (awaitAnswerMachinePrompt != null)
        'AwaitAnswerMachinePrompt': awaitAnswerMachinePrompt,
      if (enableAnswerMachineDetection != null)
        'EnableAnswerMachineDetection': enableAnswerMachineDetection,
    };
  }
}

class AssociateDefaultVocabularyResponse {
  AssociateDefaultVocabularyResponse();

  factory AssociateDefaultVocabularyResponse.fromJson(Map<String, dynamic> _) {
    return AssociateDefaultVocabularyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateInstanceStorageConfigResponse {
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  final String? associationId;

  AssociateInstanceStorageConfigResponse({
    this.associationId,
  });

  factory AssociateInstanceStorageConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateInstanceStorageConfigResponse(
      associationId: json['AssociationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    return {
      if (associationId != null) 'AssociationId': associationId,
    };
  }
}

class AssociateSecurityKeyResponse {
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  final String? associationId;

  AssociateSecurityKeyResponse({
    this.associationId,
  });

  factory AssociateSecurityKeyResponse.fromJson(Map<String, dynamic> json) {
    return AssociateSecurityKeyResponse(
      associationId: json['AssociationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    return {
      if (associationId != null) 'AssociationId': associationId,
    };
  }
}

/// Information about a reference when the <code>referenceType</code> is
/// <code>ATTACHMENT</code>. Otherwise, null.
class AttachmentReference {
  /// Identifier of the attachment reference.
  final String? name;

  /// Status of the attachment reference type.
  final ReferenceStatus? status;

  /// The location path of the attachment reference.
  final String? value;

  AttachmentReference({
    this.name,
    this.status,
    this.value,
  });

  factory AttachmentReference.fromJson(Map<String, dynamic> json) {
    return AttachmentReference(
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toReferenceStatus(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// A toggle for an individual feature at the instance level.
class Attribute {
  /// The type of attribute.
  final InstanceAttributeType? attributeType;

  /// The value of the attribute.
  final String? value;

  Attribute({
    this.attributeType,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      attributeType:
          (json['AttributeType'] as String?)?.toInstanceAttributeType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeType = this.attributeType;
    final value = this.value;
    return {
      if (attributeType != null) 'AttributeType': attributeType.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// Information about available phone numbers.
class AvailableNumberSummary {
  /// The phone number. Phone numbers are formatted <code>[+] [country code]
  /// [subscriber number including area code]</code>.
  final String? phoneNumber;

  /// The ISO country code.
  final PhoneNumberCountryCode? phoneNumberCountryCode;

  /// The type of phone number.
  final PhoneNumberType? phoneNumberType;

  AvailableNumberSummary({
    this.phoneNumber,
    this.phoneNumberCountryCode,
    this.phoneNumberType,
  });

  factory AvailableNumberSummary.fromJson(Map<String, dynamic> json) {
    return AvailableNumberSummary(
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberCountryCode: (json['PhoneNumberCountryCode'] as String?)
          ?.toPhoneNumberCountryCode(),
      phoneNumberType:
          (json['PhoneNumberType'] as String?)?.toPhoneNumberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    final phoneNumberCountryCode = this.phoneNumberCountryCode;
    final phoneNumberType = this.phoneNumberType;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberCountryCode != null)
        'PhoneNumberCountryCode': phoneNumberCountryCode.toValue(),
      if (phoneNumberType != null) 'PhoneNumberType': phoneNumberType.toValue(),
    };
  }
}

enum Channel {
  voice,
  chat,
  task,
}

extension on Channel {
  String toValue() {
    switch (this) {
      case Channel.voice:
        return 'VOICE';
      case Channel.chat:
        return 'CHAT';
      case Channel.task:
        return 'TASK';
    }
  }
}

extension on String {
  Channel toChannel() {
    switch (this) {
      case 'VOICE':
        return Channel.voice;
      case 'CHAT':
        return Channel.chat;
      case 'TASK':
        return Channel.task;
    }
    throw Exception('$this is not known in enum Channel');
  }
}

/// A chat message.
class ChatMessage {
  /// The content of the chat message.
  final String content;

  /// The type of the content. Supported types are <code>text/plain</code>.
  final String contentType;

  ChatMessage({
    required this.content,
    required this.contentType,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      content: json['Content'] as String,
      contentType: json['ContentType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    return {
      'Content': content,
      'ContentType': contentType,
    };
  }
}

/// The streaming configuration, such as the Amazon SNS streaming endpoint.
class ChatStreamingConfiguration {
  /// The Amazon Resource Name (ARN) of the standard Amazon SNS topic. The Amazon
  /// Resource Name (ARN) of the streaming endpoint that is used to publish
  /// real-time message streaming for chat conversations.
  final String streamingEndpointArn;

  ChatStreamingConfiguration({
    required this.streamingEndpointArn,
  });

  factory ChatStreamingConfiguration.fromJson(Map<String, dynamic> json) {
    return ChatStreamingConfiguration(
      streamingEndpointArn: json['StreamingEndpointArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingEndpointArn = this.streamingEndpointArn;
    return {
      'StreamingEndpointArn': streamingEndpointArn,
    };
  }
}

class ClaimPhoneNumberResponse {
  /// The Amazon Resource Name (ARN) of the phone number.
  final String? phoneNumberArn;

  /// A unique identifier for the phone number.
  final String? phoneNumberId;

  ClaimPhoneNumberResponse({
    this.phoneNumberArn,
    this.phoneNumberId,
  });

  factory ClaimPhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return ClaimPhoneNumberResponse(
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberId = this.phoneNumberId;
    return {
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
    };
  }
}

/// Information about a phone number that has been claimed to your Amazon
/// Connect instance.
class ClaimedPhoneNumberSummary {
  /// The phone number. Phone numbers are formatted <code>[+] [country code]
  /// [subscriber number including area code]</code>.
  final String? phoneNumber;

  /// The Amazon Resource Name (ARN) of the phone number.
  final String? phoneNumberArn;

  /// The ISO country code.
  final PhoneNumberCountryCode? phoneNumberCountryCode;

  /// The description of the phone number.
  final String? phoneNumberDescription;

  /// A unique identifier for the phone number.
  final String? phoneNumberId;

  /// The status of the phone number.
  final PhoneNumberStatus? phoneNumberStatus;

  /// The type of phone number.
  final PhoneNumberType? phoneNumberType;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (ARN) for Amazon Connect instances that phone
  /// numbers are claimed to.
  final String? targetArn;

  ClaimedPhoneNumberSummary({
    this.phoneNumber,
    this.phoneNumberArn,
    this.phoneNumberCountryCode,
    this.phoneNumberDescription,
    this.phoneNumberId,
    this.phoneNumberStatus,
    this.phoneNumberType,
    this.tags,
    this.targetArn,
  });

  factory ClaimedPhoneNumberSummary.fromJson(Map<String, dynamic> json) {
    return ClaimedPhoneNumberSummary(
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberCountryCode: (json['PhoneNumberCountryCode'] as String?)
          ?.toPhoneNumberCountryCode(),
      phoneNumberDescription: json['PhoneNumberDescription'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      phoneNumberStatus: json['PhoneNumberStatus'] != null
          ? PhoneNumberStatus.fromJson(
              json['PhoneNumberStatus'] as Map<String, dynamic>)
          : null,
      phoneNumberType:
          (json['PhoneNumberType'] as String?)?.toPhoneNumberType(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetArn: json['TargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberCountryCode = this.phoneNumberCountryCode;
    final phoneNumberDescription = this.phoneNumberDescription;
    final phoneNumberId = this.phoneNumberId;
    final phoneNumberStatus = this.phoneNumberStatus;
    final phoneNumberType = this.phoneNumberType;
    final tags = this.tags;
    final targetArn = this.targetArn;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberCountryCode != null)
        'PhoneNumberCountryCode': phoneNumberCountryCode.toValue(),
      if (phoneNumberDescription != null)
        'PhoneNumberDescription': phoneNumberDescription,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (phoneNumberStatus != null) 'PhoneNumberStatus': phoneNumberStatus,
      if (phoneNumberType != null) 'PhoneNumberType': phoneNumberType.toValue(),
      if (tags != null) 'Tags': tags,
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

enum Comparison {
  lt,
}

extension on Comparison {
  String toValue() {
    switch (this) {
      case Comparison.lt:
        return 'LT';
    }
  }
}

extension on String {
  Comparison toComparison() {
    switch (this) {
      case 'LT':
        return Comparison.lt;
    }
    throw Exception('$this is not known in enum Comparison');
  }
}

/// Contains information about a contact.
class Contact {
  /// Information about the agent who accepted the contact.
  final AgentInfo? agentInfo;

  /// The Amazon Resource Name (ARN) for the contact.
  final String? arn;

  /// How the contact reached your contact center.
  final Channel? channel;

  /// The description of the contact.
  final String? description;

  /// The timestamp when the customer endpoint disconnected from Amazon Connect.
  final DateTime? disconnectTimestamp;

  /// The identifier for the contact.
  final String? id;

  /// If this contact is related to other contacts, this is the ID of the initial
  /// contact.
  final String? initialContactId;

  /// Indicates how the contact was initiated.
  final ContactInitiationMethod? initiationMethod;

  /// The date and time this contact was initiated, in UTC time. For
  /// <code>INBOUND</code>, this is when the contact arrived. For
  /// <code>OUTBOUND</code>, this is when the agent began dialing. For
  /// <code>CALLBACK</code>, this is when the callback contact was created. For
  /// <code>TRANSFER</code> and <code>QUEUE_TRANSFER</code>, this is when the
  /// transfer was initiated. For <code>API</code>, this is when the request
  /// arrived.
  final DateTime? initiationTimestamp;

  /// The timestamp when contact was last updated.
  final DateTime? lastUpdateTimestamp;

  /// The name of the contact.
  final String? name;

  /// If this contact is not the first contact, this is the ID of the previous
  /// contact.
  final String? previousContactId;

  /// If this contact was queued, this contains information about the queue.
  final QueueInfo? queueInfo;

  /// The timestamp, in Unix epoch time format, at which to start running the
  /// inbound flow.
  final DateTime? scheduledTimestamp;

  Contact({
    this.agentInfo,
    this.arn,
    this.channel,
    this.description,
    this.disconnectTimestamp,
    this.id,
    this.initialContactId,
    this.initiationMethod,
    this.initiationTimestamp,
    this.lastUpdateTimestamp,
    this.name,
    this.previousContactId,
    this.queueInfo,
    this.scheduledTimestamp,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      agentInfo: json['AgentInfo'] != null
          ? AgentInfo.fromJson(json['AgentInfo'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      channel: (json['Channel'] as String?)?.toChannel(),
      description: json['Description'] as String?,
      disconnectTimestamp: timeStampFromJson(json['DisconnectTimestamp']),
      id: json['Id'] as String?,
      initialContactId: json['InitialContactId'] as String?,
      initiationMethod:
          (json['InitiationMethod'] as String?)?.toContactInitiationMethod(),
      initiationTimestamp: timeStampFromJson(json['InitiationTimestamp']),
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
      name: json['Name'] as String?,
      previousContactId: json['PreviousContactId'] as String?,
      queueInfo: json['QueueInfo'] != null
          ? QueueInfo.fromJson(json['QueueInfo'] as Map<String, dynamic>)
          : null,
      scheduledTimestamp: timeStampFromJson(json['ScheduledTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentInfo = this.agentInfo;
    final arn = this.arn;
    final channel = this.channel;
    final description = this.description;
    final disconnectTimestamp = this.disconnectTimestamp;
    final id = this.id;
    final initialContactId = this.initialContactId;
    final initiationMethod = this.initiationMethod;
    final initiationTimestamp = this.initiationTimestamp;
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final name = this.name;
    final previousContactId = this.previousContactId;
    final queueInfo = this.queueInfo;
    final scheduledTimestamp = this.scheduledTimestamp;
    return {
      if (agentInfo != null) 'AgentInfo': agentInfo,
      if (arn != null) 'Arn': arn,
      if (channel != null) 'Channel': channel.toValue(),
      if (description != null) 'Description': description,
      if (disconnectTimestamp != null)
        'DisconnectTimestamp': unixTimestampToJson(disconnectTimestamp),
      if (id != null) 'Id': id,
      if (initialContactId != null) 'InitialContactId': initialContactId,
      if (initiationMethod != null)
        'InitiationMethod': initiationMethod.toValue(),
      if (initiationTimestamp != null)
        'InitiationTimestamp': unixTimestampToJson(initiationTimestamp),
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (name != null) 'Name': name,
      if (previousContactId != null) 'PreviousContactId': previousContactId,
      if (queueInfo != null) 'QueueInfo': queueInfo,
      if (scheduledTimestamp != null)
        'ScheduledTimestamp': unixTimestampToJson(scheduledTimestamp),
    };
  }
}

/// Filters user data based on the contact information that is associated to the
/// users. It contains a list of <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">contact
/// states</a>.
class ContactFilter {
  /// A list of up to 9 <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/about-contact-states.html">contact
  /// states</a>.
  final List<ContactState>? contactStates;

  ContactFilter({
    this.contactStates,
  });

  factory ContactFilter.fromJson(Map<String, dynamic> json) {
    return ContactFilter(
      contactStates: (json['ContactStates'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toContactState())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contactStates = this.contactStates;
    return {
      if (contactStates != null)
        'ContactStates': contactStates.map((e) => e.toValue()).toList(),
    };
  }
}

/// Contains information about a contact flow.
class ContactFlow {
  /// The Amazon Resource Name (ARN) of the contact flow.
  final String? arn;

  /// The content of the contact flow.
  final String? content;

  /// The description of the contact flow.
  final String? description;

  /// The identifier of the contact flow.
  final String? id;

  /// The name of the contact flow.
  final String? name;

  /// The type of contact flow.
  final ContactFlowState? state;

  /// One or more tags.
  final Map<String, String>? tags;

  /// The type of the contact flow. For descriptions of the available types, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose
  /// a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.
  final ContactFlowType? type;

  ContactFlow({
    this.arn,
    this.content,
    this.description,
    this.id,
    this.name,
    this.state,
    this.tags,
    this.type,
  });

  factory ContactFlow.fromJson(Map<String, dynamic> json) {
    return ContactFlow(
      arn: json['Arn'] as String?,
      content: json['Content'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toContactFlowState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toContactFlowType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final content = this.content;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (content != null) 'Content': content,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Contains information about a contact flow module.
class ContactFlowModule {
  /// The Amazon Resource Name (ARN).
  final String? arn;

  /// The content of the contact flow module.
  final String? content;

  /// The description of the contact flow module.
  final String? description;

  /// The identifier of the contact flow module.
  final String? id;

  /// The name of the contact flow module.
  final String? name;

  /// The type of contact flow module.
  final ContactFlowModuleState? state;

  /// The status of the contact flow module.
  final ContactFlowModuleStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ContactFlowModule({
    this.arn,
    this.content,
    this.description,
    this.id,
    this.name,
    this.state,
    this.status,
    this.tags,
  });

  factory ContactFlowModule.fromJson(Map<String, dynamic> json) {
    return ContactFlowModule(
      arn: json['Arn'] as String?,
      content: json['Content'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toContactFlowModuleState(),
      status: (json['Status'] as String?)?.toContactFlowModuleStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final content = this.content;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (content != null) 'Content': content,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ContactFlowModuleState {
  active,
  archived,
}

extension on ContactFlowModuleState {
  String toValue() {
    switch (this) {
      case ContactFlowModuleState.active:
        return 'ACTIVE';
      case ContactFlowModuleState.archived:
        return 'ARCHIVED';
    }
  }
}

extension on String {
  ContactFlowModuleState toContactFlowModuleState() {
    switch (this) {
      case 'ACTIVE':
        return ContactFlowModuleState.active;
      case 'ARCHIVED':
        return ContactFlowModuleState.archived;
    }
    throw Exception('$this is not known in enum ContactFlowModuleState');
  }
}

enum ContactFlowModuleStatus {
  published,
  saved,
}

extension on ContactFlowModuleStatus {
  String toValue() {
    switch (this) {
      case ContactFlowModuleStatus.published:
        return 'PUBLISHED';
      case ContactFlowModuleStatus.saved:
        return 'SAVED';
    }
  }
}

extension on String {
  ContactFlowModuleStatus toContactFlowModuleStatus() {
    switch (this) {
      case 'PUBLISHED':
        return ContactFlowModuleStatus.published;
      case 'SAVED':
        return ContactFlowModuleStatus.saved;
    }
    throw Exception('$this is not known in enum ContactFlowModuleStatus');
  }
}

/// Contains summary information about a contact flow.
class ContactFlowModuleSummary {
  /// The Amazon Resource Name (ARN) of the contact flow module.
  final String? arn;

  /// The identifier of the contact flow module.
  final String? id;

  /// The name of the contact flow module.
  final String? name;

  /// The type of contact flow module.
  final ContactFlowModuleState? state;

  ContactFlowModuleSummary({
    this.arn,
    this.id,
    this.name,
    this.state,
  });

  factory ContactFlowModuleSummary.fromJson(Map<String, dynamic> json) {
    return ContactFlowModuleSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toContactFlowModuleState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum ContactFlowState {
  active,
  archived,
}

extension on ContactFlowState {
  String toValue() {
    switch (this) {
      case ContactFlowState.active:
        return 'ACTIVE';
      case ContactFlowState.archived:
        return 'ARCHIVED';
    }
  }
}

extension on String {
  ContactFlowState toContactFlowState() {
    switch (this) {
      case 'ACTIVE':
        return ContactFlowState.active;
      case 'ARCHIVED':
        return ContactFlowState.archived;
    }
    throw Exception('$this is not known in enum ContactFlowState');
  }
}

/// Contains summary information about a contact flow.
///
/// You can also create and update contact flows using the <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
/// Connect Flow language</a>.
class ContactFlowSummary {
  /// The Amazon Resource Name (ARN) of the contact flow.
  final String? arn;

  /// The type of contact flow.
  final ContactFlowState? contactFlowState;

  /// The type of contact flow.
  final ContactFlowType? contactFlowType;

  /// The identifier of the contact flow.
  final String? id;

  /// The name of the contact flow.
  final String? name;

  ContactFlowSummary({
    this.arn,
    this.contactFlowState,
    this.contactFlowType,
    this.id,
    this.name,
  });

  factory ContactFlowSummary.fromJson(Map<String, dynamic> json) {
    return ContactFlowSummary(
      arn: json['Arn'] as String?,
      contactFlowState:
          (json['ContactFlowState'] as String?)?.toContactFlowState(),
      contactFlowType:
          (json['ContactFlowType'] as String?)?.toContactFlowType(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contactFlowState = this.contactFlowState;
    final contactFlowType = this.contactFlowType;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (contactFlowState != null)
        'ContactFlowState': contactFlowState.toValue(),
      if (contactFlowType != null) 'ContactFlowType': contactFlowType.toValue(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

enum ContactFlowType {
  contactFlow,
  customerQueue,
  customerHold,
  customerWhisper,
  agentHold,
  agentWhisper,
  outboundWhisper,
  agentTransfer,
  queueTransfer,
}

extension on ContactFlowType {
  String toValue() {
    switch (this) {
      case ContactFlowType.contactFlow:
        return 'CONTACT_FLOW';
      case ContactFlowType.customerQueue:
        return 'CUSTOMER_QUEUE';
      case ContactFlowType.customerHold:
        return 'CUSTOMER_HOLD';
      case ContactFlowType.customerWhisper:
        return 'CUSTOMER_WHISPER';
      case ContactFlowType.agentHold:
        return 'AGENT_HOLD';
      case ContactFlowType.agentWhisper:
        return 'AGENT_WHISPER';
      case ContactFlowType.outboundWhisper:
        return 'OUTBOUND_WHISPER';
      case ContactFlowType.agentTransfer:
        return 'AGENT_TRANSFER';
      case ContactFlowType.queueTransfer:
        return 'QUEUE_TRANSFER';
    }
  }
}

extension on String {
  ContactFlowType toContactFlowType() {
    switch (this) {
      case 'CONTACT_FLOW':
        return ContactFlowType.contactFlow;
      case 'CUSTOMER_QUEUE':
        return ContactFlowType.customerQueue;
      case 'CUSTOMER_HOLD':
        return ContactFlowType.customerHold;
      case 'CUSTOMER_WHISPER':
        return ContactFlowType.customerWhisper;
      case 'AGENT_HOLD':
        return ContactFlowType.agentHold;
      case 'AGENT_WHISPER':
        return ContactFlowType.agentWhisper;
      case 'OUTBOUND_WHISPER':
        return ContactFlowType.outboundWhisper;
      case 'AGENT_TRANSFER':
        return ContactFlowType.agentTransfer;
      case 'QUEUE_TRANSFER':
        return ContactFlowType.queueTransfer;
    }
    throw Exception('$this is not known in enum ContactFlowType');
  }
}

enum ContactInitiationMethod {
  inbound,
  outbound,
  transfer,
  queueTransfer,
  callback,
  api,
}

extension on ContactInitiationMethod {
  String toValue() {
    switch (this) {
      case ContactInitiationMethod.inbound:
        return 'INBOUND';
      case ContactInitiationMethod.outbound:
        return 'OUTBOUND';
      case ContactInitiationMethod.transfer:
        return 'TRANSFER';
      case ContactInitiationMethod.queueTransfer:
        return 'QUEUE_TRANSFER';
      case ContactInitiationMethod.callback:
        return 'CALLBACK';
      case ContactInitiationMethod.api:
        return 'API';
    }
  }
}

extension on String {
  ContactInitiationMethod toContactInitiationMethod() {
    switch (this) {
      case 'INBOUND':
        return ContactInitiationMethod.inbound;
      case 'OUTBOUND':
        return ContactInitiationMethod.outbound;
      case 'TRANSFER':
        return ContactInitiationMethod.transfer;
      case 'QUEUE_TRANSFER':
        return ContactInitiationMethod.queueTransfer;
      case 'CALLBACK':
        return ContactInitiationMethod.callback;
      case 'API':
        return ContactInitiationMethod.api;
    }
    throw Exception('$this is not known in enum ContactInitiationMethod');
  }
}

enum ContactState {
  incoming,
  pending,
  connecting,
  connected,
  connectedOnhold,
  missed,
  error,
  ended,
  rejected,
}

extension on ContactState {
  String toValue() {
    switch (this) {
      case ContactState.incoming:
        return 'INCOMING';
      case ContactState.pending:
        return 'PENDING';
      case ContactState.connecting:
        return 'CONNECTING';
      case ContactState.connected:
        return 'CONNECTED';
      case ContactState.connectedOnhold:
        return 'CONNECTED_ONHOLD';
      case ContactState.missed:
        return 'MISSED';
      case ContactState.error:
        return 'ERROR';
      case ContactState.ended:
        return 'ENDED';
      case ContactState.rejected:
        return 'REJECTED';
    }
  }
}

extension on String {
  ContactState toContactState() {
    switch (this) {
      case 'INCOMING':
        return ContactState.incoming;
      case 'PENDING':
        return ContactState.pending;
      case 'CONNECTING':
        return ContactState.connecting;
      case 'CONNECTED':
        return ContactState.connected;
      case 'CONNECTED_ONHOLD':
        return ContactState.connectedOnhold;
      case 'MISSED':
        return ContactState.missed;
      case 'ERROR':
        return ContactState.error;
      case 'ENDED':
        return ContactState.ended;
      case 'REJECTED':
        return ContactState.rejected;
    }
    throw Exception('$this is not known in enum ContactState');
  }
}

/// An object that can be used to specify Tag conditions inside the
/// <code>SearchFilter</code>. This accepts an <code>OR</code> of
/// <code>AND</code> (List of List) input where:
///
/// <ul>
/// <li>
/// Top level list specifies conditions that need to be applied with
/// <code>OR</code> operator
/// </li>
/// <li>
/// Inner list specifies conditions that need to be applied with
/// <code>AND</code> operator.
/// </li>
/// </ul>
class ControlPlaneTagFilter {
  /// A list of conditions which would be applied together with an
  /// <code>AND</code> condition.
  final List<TagCondition>? andConditions;

  /// A list of conditions which would be applied together with an <code>OR</code>
  /// condition.
  final List<List<TagCondition>>? orConditions;

  /// A leaf node condition which can be used to specify a tag condition.
  final TagCondition? tagCondition;

  ControlPlaneTagFilter({
    this.andConditions,
    this.orConditions,
    this.tagCondition,
  });

  factory ControlPlaneTagFilter.fromJson(Map<String, dynamic> json) {
    return ControlPlaneTagFilter(
      andConditions: (json['AndConditions'] as List?)
          ?.whereNotNull()
          .map((e) => TagCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      orConditions: (json['OrConditions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as List)
              .whereNotNull()
              .map((e) => TagCondition.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      tagCondition: json['TagCondition'] != null
          ? TagCondition.fromJson(json['TagCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andConditions = this.andConditions;
    final orConditions = this.orConditions;
    final tagCondition = this.tagCondition;
    return {
      if (andConditions != null) 'AndConditions': andConditions,
      if (orConditions != null) 'OrConditions': orConditions,
      if (tagCondition != null) 'TagCondition': tagCondition,
    };
  }
}

class CreateAgentStatusResponse {
  /// The Amazon Resource Name (ARN) of the agent status.
  final String? agentStatusARN;

  /// The identifier of the agent status.
  final String? agentStatusId;

  CreateAgentStatusResponse({
    this.agentStatusARN,
    this.agentStatusId,
  });

  factory CreateAgentStatusResponse.fromJson(Map<String, dynamic> json) {
    return CreateAgentStatusResponse(
      agentStatusARN: json['AgentStatusARN'] as String?,
      agentStatusId: json['AgentStatusId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentStatusARN = this.agentStatusARN;
    final agentStatusId = this.agentStatusId;
    return {
      if (agentStatusARN != null) 'AgentStatusARN': agentStatusARN,
      if (agentStatusId != null) 'AgentStatusId': agentStatusId,
    };
  }
}

class CreateContactFlowModuleResponse {
  /// The Amazon Resource Name (ARN) of the contact flow module.
  final String? arn;

  /// The identifier of the contact flow module.
  final String? id;

  CreateContactFlowModuleResponse({
    this.arn,
    this.id,
  });

  factory CreateContactFlowModuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateContactFlowModuleResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

class CreateContactFlowResponse {
  /// The Amazon Resource Name (ARN) of the contact flow.
  final String? contactFlowArn;

  /// The identifier of the contact flow.
  final String? contactFlowId;

  CreateContactFlowResponse({
    this.contactFlowArn,
    this.contactFlowId,
  });

  factory CreateContactFlowResponse.fromJson(Map<String, dynamic> json) {
    return CreateContactFlowResponse(
      contactFlowArn: json['ContactFlowArn'] as String?,
      contactFlowId: json['ContactFlowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlowArn = this.contactFlowArn;
    final contactFlowId = this.contactFlowId;
    return {
      if (contactFlowArn != null) 'ContactFlowArn': contactFlowArn,
      if (contactFlowId != null) 'ContactFlowId': contactFlowId,
    };
  }
}

class CreateHoursOfOperationResponse {
  /// The Amazon Resource Name (ARN) for the hours of operation.
  final String? hoursOfOperationArn;

  /// The identifier for the hours of operation.
  final String? hoursOfOperationId;

  CreateHoursOfOperationResponse({
    this.hoursOfOperationArn,
    this.hoursOfOperationId,
  });

  factory CreateHoursOfOperationResponse.fromJson(Map<String, dynamic> json) {
    return CreateHoursOfOperationResponse(
      hoursOfOperationArn: json['HoursOfOperationArn'] as String?,
      hoursOfOperationId: json['HoursOfOperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hoursOfOperationArn = this.hoursOfOperationArn;
    final hoursOfOperationId = this.hoursOfOperationId;
    return {
      if (hoursOfOperationArn != null)
        'HoursOfOperationArn': hoursOfOperationArn,
      if (hoursOfOperationId != null) 'HoursOfOperationId': hoursOfOperationId,
    };
  }
}

class CreateInstanceResponse {
  /// The Amazon Resource Name (ARN) of the instance.
  final String? arn;

  /// The identifier for the instance.
  final String? id;

  CreateInstanceResponse({
    this.arn,
    this.id,
  });

  factory CreateInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateInstanceResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

class CreateIntegrationAssociationResponse {
  /// The Amazon Resource Name (ARN) for the association.
  final String? integrationAssociationArn;

  /// The identifier for the integration association.
  final String? integrationAssociationId;

  CreateIntegrationAssociationResponse({
    this.integrationAssociationArn,
    this.integrationAssociationId,
  });

  factory CreateIntegrationAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateIntegrationAssociationResponse(
      integrationAssociationArn: json['IntegrationAssociationArn'] as String?,
      integrationAssociationId: json['IntegrationAssociationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationAssociationArn = this.integrationAssociationArn;
    final integrationAssociationId = this.integrationAssociationId;
    return {
      if (integrationAssociationArn != null)
        'IntegrationAssociationArn': integrationAssociationArn,
      if (integrationAssociationId != null)
        'IntegrationAssociationId': integrationAssociationId,
    };
  }
}

class CreateQueueResponse {
  /// The Amazon Resource Name (ARN) of the queue.
  final String? queueArn;

  /// The identifier for the queue.
  final String? queueId;

  CreateQueueResponse({
    this.queueArn,
    this.queueId,
  });

  factory CreateQueueResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueResponse(
      queueArn: json['QueueArn'] as String?,
      queueId: json['QueueId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueArn = this.queueArn;
    final queueId = this.queueId;
    return {
      if (queueArn != null) 'QueueArn': queueArn,
      if (queueId != null) 'QueueId': queueId,
    };
  }
}

class CreateQuickConnectResponse {
  /// The Amazon Resource Name (ARN) for the quick connect.
  final String? quickConnectARN;

  /// The identifier for the quick connect.
  final String? quickConnectId;

  CreateQuickConnectResponse({
    this.quickConnectARN,
    this.quickConnectId,
  });

  factory CreateQuickConnectResponse.fromJson(Map<String, dynamic> json) {
    return CreateQuickConnectResponse(
      quickConnectARN: json['QuickConnectARN'] as String?,
      quickConnectId: json['QuickConnectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final quickConnectARN = this.quickConnectARN;
    final quickConnectId = this.quickConnectId;
    return {
      if (quickConnectARN != null) 'QuickConnectARN': quickConnectARN,
      if (quickConnectId != null) 'QuickConnectId': quickConnectId,
    };
  }
}

class CreateRoutingProfileResponse {
  /// The Amazon Resource Name (ARN) of the routing profile.
  final String? routingProfileArn;

  /// The identifier of the routing profile.
  final String? routingProfileId;

  CreateRoutingProfileResponse({
    this.routingProfileArn,
    this.routingProfileId,
  });

  factory CreateRoutingProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoutingProfileResponse(
      routingProfileArn: json['RoutingProfileArn'] as String?,
      routingProfileId: json['RoutingProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routingProfileArn = this.routingProfileArn;
    final routingProfileId = this.routingProfileId;
    return {
      if (routingProfileArn != null) 'RoutingProfileArn': routingProfileArn,
      if (routingProfileId != null) 'RoutingProfileId': routingProfileId,
    };
  }
}

class CreateSecurityProfileResponse {
  /// The Amazon Resource Name (ARN) for the security profile.
  final String? securityProfileArn;

  /// The identifier for the security profle.
  final String? securityProfileId;

  CreateSecurityProfileResponse({
    this.securityProfileArn,
    this.securityProfileId,
  });

  factory CreateSecurityProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateSecurityProfileResponse(
      securityProfileArn: json['SecurityProfileArn'] as String?,
      securityProfileId: json['SecurityProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityProfileArn = this.securityProfileArn;
    final securityProfileId = this.securityProfileId;
    return {
      if (securityProfileArn != null) 'SecurityProfileArn': securityProfileArn,
      if (securityProfileId != null) 'SecurityProfileId': securityProfileId,
    };
  }
}

class CreateTaskTemplateResponse {
  /// The Amazon Resource Name (ARN) for the task template resource.
  final String arn;

  /// The identifier of the task template resource.
  final String id;

  CreateTaskTemplateResponse({
    required this.arn,
    required this.id,
  });

  factory CreateTaskTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateTaskTemplateResponse(
      arn: json['Arn'] as String,
      id: json['Id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      'Arn': arn,
      'Id': id,
    };
  }
}

class CreateUseCaseResponse {
  /// The Amazon Resource Name (ARN) for the use case.
  final String? useCaseArn;

  /// The identifier of the use case.
  final String? useCaseId;

  CreateUseCaseResponse({
    this.useCaseArn,
    this.useCaseId,
  });

  factory CreateUseCaseResponse.fromJson(Map<String, dynamic> json) {
    return CreateUseCaseResponse(
      useCaseArn: json['UseCaseArn'] as String?,
      useCaseId: json['UseCaseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final useCaseArn = this.useCaseArn;
    final useCaseId = this.useCaseId;
    return {
      if (useCaseArn != null) 'UseCaseArn': useCaseArn,
      if (useCaseId != null) 'UseCaseId': useCaseId,
    };
  }
}

class CreateUserHierarchyGroupResponse {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  final String? hierarchyGroupArn;

  /// The identifier of the hierarchy group.
  final String? hierarchyGroupId;

  CreateUserHierarchyGroupResponse({
    this.hierarchyGroupArn,
    this.hierarchyGroupId,
  });

  factory CreateUserHierarchyGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserHierarchyGroupResponse(
      hierarchyGroupArn: json['HierarchyGroupArn'] as String?,
      hierarchyGroupId: json['HierarchyGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hierarchyGroupArn = this.hierarchyGroupArn;
    final hierarchyGroupId = this.hierarchyGroupId;
    return {
      if (hierarchyGroupArn != null) 'HierarchyGroupArn': hierarchyGroupArn,
      if (hierarchyGroupId != null) 'HierarchyGroupId': hierarchyGroupId,
    };
  }
}

class CreateUserResponse {
  /// The Amazon Resource Name (ARN) of the user account.
  final String? userArn;

  /// The identifier of the user account.
  final String? userId;

  CreateUserResponse({
    this.userArn,
    this.userId,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      userArn: json['UserArn'] as String?,
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userArn = this.userArn;
    final userId = this.userId;
    return {
      if (userArn != null) 'UserArn': userArn,
      if (userId != null) 'UserId': userId,
    };
  }
}

class CreateVocabularyResponse {
  /// The current state of the custom vocabulary.
  final VocabularyState state;

  /// The Amazon Resource Name (ARN) of the custom vocabulary.
  final String vocabularyArn;

  /// The identifier of the custom vocabulary.
  final String vocabularyId;

  CreateVocabularyResponse({
    required this.state,
    required this.vocabularyArn,
    required this.vocabularyId,
  });

  factory CreateVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return CreateVocabularyResponse(
      state: (json['State'] as String).toVocabularyState(),
      vocabularyArn: json['VocabularyArn'] as String,
      vocabularyId: json['VocabularyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final vocabularyArn = this.vocabularyArn;
    final vocabularyId = this.vocabularyId;
    return {
      'State': state.toValue(),
      'VocabularyArn': vocabularyArn,
      'VocabularyId': vocabularyId,
    };
  }
}

/// Contains credentials to use for federation.
class Credentials {
  /// An access token generated for a federated user to access Amazon Connect.
  final String? accessToken;

  /// A token generated with an expiration time for the session a user is logged
  /// in to Amazon Connect.
  final DateTime? accessTokenExpiration;

  /// Renews a token generated for a user to access the Amazon Connect instance.
  final String? refreshToken;

  /// Renews the expiration timer for a generated token.
  final DateTime? refreshTokenExpiration;

  Credentials({
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      accessToken: json['AccessToken'] as String?,
      accessTokenExpiration: timeStampFromJson(json['AccessTokenExpiration']),
      refreshToken: json['RefreshToken'] as String?,
      refreshTokenExpiration: timeStampFromJson(json['RefreshTokenExpiration']),
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final accessTokenExpiration = this.accessTokenExpiration;
    final refreshToken = this.refreshToken;
    final refreshTokenExpiration = this.refreshTokenExpiration;
    return {
      if (accessToken != null) 'AccessToken': accessToken,
      if (accessTokenExpiration != null)
        'AccessTokenExpiration': unixTimestampToJson(accessTokenExpiration),
      if (refreshToken != null) 'RefreshToken': refreshToken,
      if (refreshTokenExpiration != null)
        'RefreshTokenExpiration': unixTimestampToJson(refreshTokenExpiration),
    };
  }
}

/// Contains information about a real-time metric. For a description of each
/// metric, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time
/// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
class CurrentMetric {
  /// The name of the metric.
  final CurrentMetricName? name;

  /// The unit for the metric.
  final Unit? unit;

  CurrentMetric({
    this.name,
    this.unit,
  });

  factory CurrentMetric.fromJson(Map<String, dynamic> json) {
    return CurrentMetric(
      name: (json['Name'] as String?)?.toCurrentMetricName(),
      unit: (json['Unit'] as String?)?.toUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final unit = this.unit;
    return {
      if (name != null) 'Name': name.toValue(),
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

/// Contains the data for a real-time metric.
class CurrentMetricData {
  /// Information about the metric.
  final CurrentMetric? metric;

  /// The value of the metric.
  final double? value;

  CurrentMetricData({
    this.metric,
    this.value,
  });

  factory CurrentMetricData.fromJson(Map<String, dynamic> json) {
    return CurrentMetricData(
      metric: json['Metric'] != null
          ? CurrentMetric.fromJson(json['Metric'] as Map<String, dynamic>)
          : null,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final value = this.value;
    return {
      if (metric != null) 'Metric': metric,
      if (value != null) 'Value': value,
    };
  }
}

/// The current metric names.
enum CurrentMetricName {
  agentsOnline,
  agentsAvailable,
  agentsOnCall,
  agentsNonProductive,
  agentsAfterContactWork,
  agentsError,
  agentsStaffed,
  contactsInQueue,
  oldestContactAge,
  contactsScheduled,
  agentsOnContact,
  slotsActive,
  slotsAvailable,
}

extension on CurrentMetricName {
  String toValue() {
    switch (this) {
      case CurrentMetricName.agentsOnline:
        return 'AGENTS_ONLINE';
      case CurrentMetricName.agentsAvailable:
        return 'AGENTS_AVAILABLE';
      case CurrentMetricName.agentsOnCall:
        return 'AGENTS_ON_CALL';
      case CurrentMetricName.agentsNonProductive:
        return 'AGENTS_NON_PRODUCTIVE';
      case CurrentMetricName.agentsAfterContactWork:
        return 'AGENTS_AFTER_CONTACT_WORK';
      case CurrentMetricName.agentsError:
        return 'AGENTS_ERROR';
      case CurrentMetricName.agentsStaffed:
        return 'AGENTS_STAFFED';
      case CurrentMetricName.contactsInQueue:
        return 'CONTACTS_IN_QUEUE';
      case CurrentMetricName.oldestContactAge:
        return 'OLDEST_CONTACT_AGE';
      case CurrentMetricName.contactsScheduled:
        return 'CONTACTS_SCHEDULED';
      case CurrentMetricName.agentsOnContact:
        return 'AGENTS_ON_CONTACT';
      case CurrentMetricName.slotsActive:
        return 'SLOTS_ACTIVE';
      case CurrentMetricName.slotsAvailable:
        return 'SLOTS_AVAILABLE';
    }
  }
}

extension on String {
  CurrentMetricName toCurrentMetricName() {
    switch (this) {
      case 'AGENTS_ONLINE':
        return CurrentMetricName.agentsOnline;
      case 'AGENTS_AVAILABLE':
        return CurrentMetricName.agentsAvailable;
      case 'AGENTS_ON_CALL':
        return CurrentMetricName.agentsOnCall;
      case 'AGENTS_NON_PRODUCTIVE':
        return CurrentMetricName.agentsNonProductive;
      case 'AGENTS_AFTER_CONTACT_WORK':
        return CurrentMetricName.agentsAfterContactWork;
      case 'AGENTS_ERROR':
        return CurrentMetricName.agentsError;
      case 'AGENTS_STAFFED':
        return CurrentMetricName.agentsStaffed;
      case 'CONTACTS_IN_QUEUE':
        return CurrentMetricName.contactsInQueue;
      case 'OLDEST_CONTACT_AGE':
        return CurrentMetricName.oldestContactAge;
      case 'CONTACTS_SCHEDULED':
        return CurrentMetricName.contactsScheduled;
      case 'AGENTS_ON_CONTACT':
        return CurrentMetricName.agentsOnContact;
      case 'SLOTS_ACTIVE':
        return CurrentMetricName.slotsActive;
      case 'SLOTS_AVAILABLE':
        return CurrentMetricName.slotsAvailable;
    }
    throw Exception('$this is not known in enum CurrentMetricName');
  }
}

/// Contains information about a set of real-time metrics.
class CurrentMetricResult {
  /// The set of metrics.
  final List<CurrentMetricData>? collections;

  /// The dimensions for the metrics.
  final Dimensions? dimensions;

  CurrentMetricResult({
    this.collections,
    this.dimensions,
  });

  factory CurrentMetricResult.fromJson(Map<String, dynamic> json) {
    return CurrentMetricResult(
      collections: (json['Collections'] as List?)
          ?.whereNotNull()
          .map((e) => CurrentMetricData.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensions: json['Dimensions'] != null
          ? Dimensions.fromJson(json['Dimensions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collections = this.collections;
    final dimensions = this.dimensions;
    return {
      if (collections != null) 'Collections': collections,
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

/// Information about a reference when the <code>referenceType</code> is
/// <code>DATE</code>. Otherwise, null.
class DateReference {
  /// Identifier of the date reference.
  final String? name;

  /// A valid date.
  final String? value;

  DateReference({
    this.name,
    this.value,
  });

  factory DateReference.fromJson(Map<String, dynamic> json) {
    return DateReference(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// Contains information about a default vocabulary.
class DefaultVocabulary {
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String instanceId;

  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  final VocabularyLanguageCode languageCode;

  /// The identifier of the custom vocabulary.
  final String vocabularyId;

  /// A unique name of the custom vocabulary.
  final String vocabularyName;

  DefaultVocabulary({
    required this.instanceId,
    required this.languageCode,
    required this.vocabularyId,
    required this.vocabularyName,
  });

  factory DefaultVocabulary.fromJson(Map<String, dynamic> json) {
    return DefaultVocabulary(
      instanceId: json['InstanceId'] as String,
      languageCode: (json['LanguageCode'] as String).toVocabularyLanguageCode(),
      vocabularyId: json['VocabularyId'] as String,
      vocabularyName: json['VocabularyName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final languageCode = this.languageCode;
    final vocabularyId = this.vocabularyId;
    final vocabularyName = this.vocabularyName;
    return {
      'InstanceId': instanceId,
      'LanguageCode': languageCode.toValue(),
      'VocabularyId': vocabularyId,
      'VocabularyName': vocabularyName,
    };
  }
}

class DeleteContactFlowModuleResponse {
  DeleteContactFlowModuleResponse();

  factory DeleteContactFlowModuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContactFlowModuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTaskTemplateResponse {
  DeleteTaskTemplateResponse();

  factory DeleteTaskTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTaskTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteVocabularyResponse {
  /// The current state of the custom vocabulary.
  final VocabularyState state;

  /// The Amazon Resource Name (ARN) of the custom vocabulary.
  final String vocabularyArn;

  /// The identifier of the custom vocabulary.
  final String vocabularyId;

  DeleteVocabularyResponse({
    required this.state,
    required this.vocabularyArn,
    required this.vocabularyId,
  });

  factory DeleteVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVocabularyResponse(
      state: (json['State'] as String).toVocabularyState(),
      vocabularyArn: json['VocabularyArn'] as String,
      vocabularyId: json['VocabularyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final vocabularyArn = this.vocabularyArn;
    final vocabularyId = this.vocabularyId;
    return {
      'State': state.toValue(),
      'VocabularyArn': vocabularyArn,
      'VocabularyId': vocabularyId,
    };
  }
}

class DescribeAgentStatusResponse {
  /// The agent status.
  final AgentStatus? agentStatus;

  DescribeAgentStatusResponse({
    this.agentStatus,
  });

  factory DescribeAgentStatusResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAgentStatusResponse(
      agentStatus: json['AgentStatus'] != null
          ? AgentStatus.fromJson(json['AgentStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentStatus = this.agentStatus;
    return {
      if (agentStatus != null) 'AgentStatus': agentStatus,
    };
  }
}

class DescribeContactFlowModuleResponse {
  /// Information about the contact flow module.
  final ContactFlowModule? contactFlowModule;

  DescribeContactFlowModuleResponse({
    this.contactFlowModule,
  });

  factory DescribeContactFlowModuleResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeContactFlowModuleResponse(
      contactFlowModule: json['ContactFlowModule'] != null
          ? ContactFlowModule.fromJson(
              json['ContactFlowModule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlowModule = this.contactFlowModule;
    return {
      if (contactFlowModule != null) 'ContactFlowModule': contactFlowModule,
    };
  }
}

class DescribeContactFlowResponse {
  /// Information about the contact flow.
  final ContactFlow? contactFlow;

  DescribeContactFlowResponse({
    this.contactFlow,
  });

  factory DescribeContactFlowResponse.fromJson(Map<String, dynamic> json) {
    return DescribeContactFlowResponse(
      contactFlow: json['ContactFlow'] != null
          ? ContactFlow.fromJson(json['ContactFlow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlow = this.contactFlow;
    return {
      if (contactFlow != null) 'ContactFlow': contactFlow,
    };
  }
}

class DescribeContactResponse {
  /// Information about the contact.
  final Contact? contact;

  DescribeContactResponse({
    this.contact,
  });

  factory DescribeContactResponse.fromJson(Map<String, dynamic> json) {
    return DescribeContactResponse(
      contact: json['Contact'] != null
          ? Contact.fromJson(json['Contact'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contact = this.contact;
    return {
      if (contact != null) 'Contact': contact,
    };
  }
}

class DescribeHoursOfOperationResponse {
  /// The hours of operation.
  final HoursOfOperation? hoursOfOperation;

  DescribeHoursOfOperationResponse({
    this.hoursOfOperation,
  });

  factory DescribeHoursOfOperationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHoursOfOperationResponse(
      hoursOfOperation: json['HoursOfOperation'] != null
          ? HoursOfOperation.fromJson(
              json['HoursOfOperation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hoursOfOperation = this.hoursOfOperation;
    return {
      if (hoursOfOperation != null) 'HoursOfOperation': hoursOfOperation,
    };
  }
}

class DescribeInstanceAttributeResponse {
  /// The type of attribute.
  final Attribute? attribute;

  DescribeInstanceAttributeResponse({
    this.attribute,
  });

  factory DescribeInstanceAttributeResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInstanceAttributeResponse(
      attribute: json['Attribute'] != null
          ? Attribute.fromJson(json['Attribute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute,
    };
  }
}

class DescribeInstanceResponse {
  /// The name of the instance.
  final Instance? instance;

  DescribeInstanceResponse({
    this.instance,
  });

  factory DescribeInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInstanceResponse(
      instance: json['Instance'] != null
          ? Instance.fromJson(json['Instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'Instance': instance,
    };
  }
}

class DescribeInstanceStorageConfigResponse {
  /// A valid storage type.
  final InstanceStorageConfig? storageConfig;

  DescribeInstanceStorageConfigResponse({
    this.storageConfig,
  });

  factory DescribeInstanceStorageConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInstanceStorageConfigResponse(
      storageConfig: json['StorageConfig'] != null
          ? InstanceStorageConfig.fromJson(
              json['StorageConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageConfig = this.storageConfig;
    return {
      if (storageConfig != null) 'StorageConfig': storageConfig,
    };
  }
}

class DescribePhoneNumberResponse {
  /// Information about a phone number that's been claimed to your Amazon Connect
  /// instance.
  final ClaimedPhoneNumberSummary? claimedPhoneNumberSummary;

  DescribePhoneNumberResponse({
    this.claimedPhoneNumberSummary,
  });

  factory DescribePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return DescribePhoneNumberResponse(
      claimedPhoneNumberSummary: json['ClaimedPhoneNumberSummary'] != null
          ? ClaimedPhoneNumberSummary.fromJson(
              json['ClaimedPhoneNumberSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final claimedPhoneNumberSummary = this.claimedPhoneNumberSummary;
    return {
      if (claimedPhoneNumberSummary != null)
        'ClaimedPhoneNumberSummary': claimedPhoneNumberSummary,
    };
  }
}

class DescribeQueueResponse {
  /// The name of the queue.
  final Queue? queue;

  DescribeQueueResponse({
    this.queue,
  });

  factory DescribeQueueResponse.fromJson(Map<String, dynamic> json) {
    return DescribeQueueResponse(
      queue: json['Queue'] != null
          ? Queue.fromJson(json['Queue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final queue = this.queue;
    return {
      if (queue != null) 'Queue': queue,
    };
  }
}

class DescribeQuickConnectResponse {
  /// Information about the quick connect.
  final QuickConnect? quickConnect;

  DescribeQuickConnectResponse({
    this.quickConnect,
  });

  factory DescribeQuickConnectResponse.fromJson(Map<String, dynamic> json) {
    return DescribeQuickConnectResponse(
      quickConnect: json['QuickConnect'] != null
          ? QuickConnect.fromJson(json['QuickConnect'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quickConnect = this.quickConnect;
    return {
      if (quickConnect != null) 'QuickConnect': quickConnect,
    };
  }
}

class DescribeRoutingProfileResponse {
  /// The routing profile.
  final RoutingProfile? routingProfile;

  DescribeRoutingProfileResponse({
    this.routingProfile,
  });

  factory DescribeRoutingProfileResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRoutingProfileResponse(
      routingProfile: json['RoutingProfile'] != null
          ? RoutingProfile.fromJson(
              json['RoutingProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routingProfile = this.routingProfile;
    return {
      if (routingProfile != null) 'RoutingProfile': routingProfile,
    };
  }
}

class DescribeSecurityProfileResponse {
  /// The security profile.
  final SecurityProfile? securityProfile;

  DescribeSecurityProfileResponse({
    this.securityProfile,
  });

  factory DescribeSecurityProfileResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSecurityProfileResponse(
      securityProfile: json['SecurityProfile'] != null
          ? SecurityProfile.fromJson(
              json['SecurityProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityProfile = this.securityProfile;
    return {
      if (securityProfile != null) 'SecurityProfile': securityProfile,
    };
  }
}

class DescribeUserHierarchyGroupResponse {
  /// Information about the hierarchy group.
  final HierarchyGroup? hierarchyGroup;

  DescribeUserHierarchyGroupResponse({
    this.hierarchyGroup,
  });

  factory DescribeUserHierarchyGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeUserHierarchyGroupResponse(
      hierarchyGroup: json['HierarchyGroup'] != null
          ? HierarchyGroup.fromJson(
              json['HierarchyGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hierarchyGroup = this.hierarchyGroup;
    return {
      if (hierarchyGroup != null) 'HierarchyGroup': hierarchyGroup,
    };
  }
}

class DescribeUserHierarchyStructureResponse {
  /// Information about the hierarchy structure.
  final HierarchyStructure? hierarchyStructure;

  DescribeUserHierarchyStructureResponse({
    this.hierarchyStructure,
  });

  factory DescribeUserHierarchyStructureResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeUserHierarchyStructureResponse(
      hierarchyStructure: json['HierarchyStructure'] != null
          ? HierarchyStructure.fromJson(
              json['HierarchyStructure'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hierarchyStructure = this.hierarchyStructure;
    return {
      if (hierarchyStructure != null) 'HierarchyStructure': hierarchyStructure,
    };
  }
}

class DescribeUserResponse {
  /// Information about the user account and configuration settings.
  final User? user;

  DescribeUserResponse({
    this.user,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

class DescribeVocabularyResponse {
  /// A list of specific words that you want Contact Lens for Amazon Connect to
  /// recognize in your audio input. They are generally domain-specific words and
  /// phrases, words that Contact Lens is not recognizing, or proper nouns.
  final Vocabulary vocabulary;

  DescribeVocabularyResponse({
    required this.vocabulary,
  });

  factory DescribeVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVocabularyResponse(
      vocabulary:
          Vocabulary.fromJson(json['Vocabulary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final vocabulary = this.vocabulary;
    return {
      'Vocabulary': vocabulary,
    };
  }
}

/// Contains information about the dimensions for a set of metrics.
class Dimensions {
  /// The channel used for grouping and filters.
  final Channel? channel;

  /// Information about the queue for which metrics are returned.
  final QueueReference? queue;

  Dimensions({
    this.channel,
    this.queue,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      channel: (json['Channel'] as String?)?.toChannel(),
      queue: json['Queue'] != null
          ? QueueReference.fromJson(json['Queue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final queue = this.queue;
    return {
      if (channel != null) 'Channel': channel.toValue(),
      if (queue != null) 'Queue': queue,
    };
  }
}

enum DirectoryType {
  saml,
  connectManaged,
  existingDirectory,
}

extension on DirectoryType {
  String toValue() {
    switch (this) {
      case DirectoryType.saml:
        return 'SAML';
      case DirectoryType.connectManaged:
        return 'CONNECT_MANAGED';
      case DirectoryType.existingDirectory:
        return 'EXISTING_DIRECTORY';
    }
  }
}

extension on String {
  DirectoryType toDirectoryType() {
    switch (this) {
      case 'SAML':
        return DirectoryType.saml;
      case 'CONNECT_MANAGED':
        return DirectoryType.connectManaged;
      case 'EXISTING_DIRECTORY':
        return DirectoryType.existingDirectory;
    }
    throw Exception('$this is not known in enum DirectoryType');
  }
}

/// Information about a reference when the <code>referenceType</code> is
/// <code>EMAIL</code>. Otherwise, null.
class EmailReference {
  /// Identifier of the email reference.
  final String? name;

  /// A valid email address.
  final String? value;

  EmailReference({
    this.name,
    this.value,
  });

  factory EmailReference.fromJson(Map<String, dynamic> json) {
    return EmailReference(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// The encryption configuration.
class EncryptionConfig {
  /// The type of encryption.
  final EncryptionType encryptionType;

  /// The full ARN of the encryption key.
  /// <note>
  /// Be sure to provide the full ARN of the encryption key, not just the ID.
  /// </note>
  final String keyId;

  EncryptionConfig({
    required this.encryptionType,
    required this.keyId,
  });

  factory EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return EncryptionConfig(
      encryptionType: (json['EncryptionType'] as String).toEncryptionType(),
      keyId: json['KeyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final keyId = this.keyId;
    return {
      'EncryptionType': encryptionType.toValue(),
      'KeyId': keyId,
    };
  }
}

enum EncryptionType {
  kms,
}

extension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.kms:
        return 'KMS';
    }
  }
}

extension on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'KMS':
        return EncryptionType.kms;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// Contains the filter to apply when retrieving metrics.
class Filters {
  /// The channel to use to filter the metrics.
  final List<Channel>? channels;

  /// The queues to use to filter the metrics. You should specify at least one
  /// queue, and can specify up to 100 queues per request. The
  /// <code>GetCurrentMetricsData</code> API in particular requires a queue when
  /// you include a <code>Filter</code> in your request.
  final List<String>? queues;

  Filters({
    this.channels,
    this.queues,
  });

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toChannel())
          .toList(),
      queues: (json['Queues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final queues = this.queues;
    return {
      if (channels != null)
        'Channels': channels.map((e) => e.toValue()).toList(),
      if (queues != null) 'Queues': queues,
    };
  }
}

class GetContactAttributesResponse {
  /// Information about the attributes.
  final Map<String, String>? attributes;

  GetContactAttributesResponse({
    this.attributes,
  });

  factory GetContactAttributesResponse.fromJson(Map<String, dynamic> json) {
    return GetContactAttributesResponse(
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

class GetCurrentMetricDataResponse {
  /// The time at which the metrics were retrieved and cached for pagination.
  final DateTime? dataSnapshotTime;

  /// Information about the real-time metrics.
  final List<CurrentMetricResult>? metricResults;

  /// If there are additional results, this is the token for the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  final String? nextToken;

  GetCurrentMetricDataResponse({
    this.dataSnapshotTime,
    this.metricResults,
    this.nextToken,
  });

  factory GetCurrentMetricDataResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentMetricDataResponse(
      dataSnapshotTime: timeStampFromJson(json['DataSnapshotTime']),
      metricResults: (json['MetricResults'] as List?)
          ?.whereNotNull()
          .map((e) => CurrentMetricResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSnapshotTime = this.dataSnapshotTime;
    final metricResults = this.metricResults;
    final nextToken = this.nextToken;
    return {
      if (dataSnapshotTime != null)
        'DataSnapshotTime': unixTimestampToJson(dataSnapshotTime),
      if (metricResults != null) 'MetricResults': metricResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetCurrentUserDataResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// A list of the user data that is returned.
  final List<UserData>? userDataList;

  GetCurrentUserDataResponse({
    this.nextToken,
    this.userDataList,
  });

  factory GetCurrentUserDataResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentUserDataResponse(
      nextToken: json['NextToken'] as String?,
      userDataList: (json['UserDataList'] as List?)
          ?.whereNotNull()
          .map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userDataList = this.userDataList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (userDataList != null) 'UserDataList': userDataList,
    };
  }
}

class GetFederationTokenResponse {
  /// The credentials to use for federation.
  final Credentials? credentials;

  GetFederationTokenResponse({
    this.credentials,
  });

  factory GetFederationTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetFederationTokenResponse(
      credentials: json['Credentials'] != null
          ? Credentials.fromJson(json['Credentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      if (credentials != null) 'Credentials': credentials,
    };
  }
}

class GetMetricDataResponse {
  /// Information about the historical metrics.
  ///
  /// If no grouping is specified, a summary of metric data is returned.
  final List<HistoricalMetricResult>? metricResults;

  /// If there are additional results, this is the token for the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  final String? nextToken;

  GetMetricDataResponse({
    this.metricResults,
    this.nextToken,
  });

  factory GetMetricDataResponse.fromJson(Map<String, dynamic> json) {
    return GetMetricDataResponse(
      metricResults: (json['MetricResults'] as List?)
          ?.whereNotNull()
          .map(
              (e) => HistoricalMetricResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricResults = this.metricResults;
    final nextToken = this.nextToken;
    return {
      if (metricResults != null) 'MetricResults': metricResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetTaskTemplateResponse {
  /// The Amazon Resource Name (ARN).
  final String arn;

  /// A unique identifier for the task template.
  final String id;

  /// The name of the task template.
  final String name;

  /// Constraints that are applicable to the fields listed.
  final TaskTemplateConstraints? constraints;

  /// The identifier of the flow that runs by default when a task is created by
  /// referencing this template.
  final String? contactFlowId;

  /// The timestamp when the task template was created.
  final DateTime? createdTime;

  /// The default values for fields when a task is created by referencing this
  /// template.
  final TaskTemplateDefaults? defaults;

  /// The description of the task template.
  final String? description;

  /// Fields that are part of the template.
  final List<TaskTemplateField>? fields;

  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String? instanceId;

  /// The timestamp when the task template was last modified.
  final DateTime? lastModifiedTime;

  /// Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task
  /// to refer to it. Tasks can only be created from <code>ACTIVE</code>
  /// templates. If a template is marked as <code>INACTIVE</code>, then a task
  /// that refers to this template cannot be created.
  final TaskTemplateStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetTaskTemplateResponse({
    required this.arn,
    required this.id,
    required this.name,
    this.constraints,
    this.contactFlowId,
    this.createdTime,
    this.defaults,
    this.description,
    this.fields,
    this.instanceId,
    this.lastModifiedTime,
    this.status,
    this.tags,
  });

  factory GetTaskTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetTaskTemplateResponse(
      arn: json['Arn'] as String,
      id: json['Id'] as String,
      name: json['Name'] as String,
      constraints: json['Constraints'] != null
          ? TaskTemplateConstraints.fromJson(
              json['Constraints'] as Map<String, dynamic>)
          : null,
      contactFlowId: json['ContactFlowId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      defaults: json['Defaults'] != null
          ? TaskTemplateDefaults.fromJson(
              json['Defaults'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      fields: (json['Fields'] as List?)
          ?.whereNotNull()
          .map((e) => TaskTemplateField.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceId: json['InstanceId'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      status: (json['Status'] as String?)?.toTaskTemplateStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final constraints = this.constraints;
    final contactFlowId = this.contactFlowId;
    final createdTime = this.createdTime;
    final defaults = this.defaults;
    final description = this.description;
    final fields = this.fields;
    final instanceId = this.instanceId;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    final tags = this.tags;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      if (constraints != null) 'Constraints': constraints,
      if (contactFlowId != null) 'ContactFlowId': contactFlowId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (defaults != null) 'Defaults': defaults,
      if (description != null) 'Description': description,
      if (fields != null) 'Fields': fields,
      if (instanceId != null) 'InstanceId': instanceId,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum Grouping {
  queue,
  channel,
}

extension on Grouping {
  String toValue() {
    switch (this) {
      case Grouping.queue:
        return 'QUEUE';
      case Grouping.channel:
        return 'CHANNEL';
    }
  }
}

extension on String {
  Grouping toGrouping() {
    switch (this) {
      case 'QUEUE':
        return Grouping.queue;
      case 'CHANNEL':
        return Grouping.channel;
    }
    throw Exception('$this is not known in enum Grouping');
  }
}

/// Contains information about a hierarchy group.
class HierarchyGroup {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  final String? arn;

  /// Information about the levels in the hierarchy group.
  final HierarchyPath? hierarchyPath;

  /// The identifier of the hierarchy group.
  final String? id;

  /// The identifier of the level in the hierarchy group.
  final String? levelId;

  /// The name of the hierarchy group.
  final String? name;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  HierarchyGroup({
    this.arn,
    this.hierarchyPath,
    this.id,
    this.levelId,
    this.name,
    this.tags,
  });

  factory HierarchyGroup.fromJson(Map<String, dynamic> json) {
    return HierarchyGroup(
      arn: json['Arn'] as String?,
      hierarchyPath: json['HierarchyPath'] != null
          ? HierarchyPath.fromJson(
              json['HierarchyPath'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      levelId: json['LevelId'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final hierarchyPath = this.hierarchyPath;
    final id = this.id;
    final levelId = this.levelId;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (hierarchyPath != null) 'HierarchyPath': hierarchyPath,
      if (id != null) 'Id': id,
      if (levelId != null) 'LevelId': levelId,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A leaf node condition which can be used to specify a hierarchy group
/// condition.
class HierarchyGroupCondition {
  /// The type of hierarchy group match.
  final HierarchyGroupMatchType? hierarchyGroupMatchType;

  /// The value in the hierarchy group condition.
  final String? value;

  HierarchyGroupCondition({
    this.hierarchyGroupMatchType,
    this.value,
  });

  factory HierarchyGroupCondition.fromJson(Map<String, dynamic> json) {
    return HierarchyGroupCondition(
      hierarchyGroupMatchType: (json['HierarchyGroupMatchType'] as String?)
          ?.toHierarchyGroupMatchType(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hierarchyGroupMatchType = this.hierarchyGroupMatchType;
    final value = this.value;
    return {
      if (hierarchyGroupMatchType != null)
        'HierarchyGroupMatchType': hierarchyGroupMatchType.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum HierarchyGroupMatchType {
  exact,
  withChildGroups,
}

extension on HierarchyGroupMatchType {
  String toValue() {
    switch (this) {
      case HierarchyGroupMatchType.exact:
        return 'EXACT';
      case HierarchyGroupMatchType.withChildGroups:
        return 'WITH_CHILD_GROUPS';
    }
  }
}

extension on String {
  HierarchyGroupMatchType toHierarchyGroupMatchType() {
    switch (this) {
      case 'EXACT':
        return HierarchyGroupMatchType.exact;
      case 'WITH_CHILD_GROUPS':
        return HierarchyGroupMatchType.withChildGroups;
    }
    throw Exception('$this is not known in enum HierarchyGroupMatchType');
  }
}

/// Contains summary information about a hierarchy group.
class HierarchyGroupSummary {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  final String? arn;

  /// The identifier of the hierarchy group.
  final String? id;

  /// The name of the hierarchy group.
  final String? name;

  HierarchyGroupSummary({
    this.arn,
    this.id,
    this.name,
  });

  factory HierarchyGroupSummary.fromJson(Map<String, dynamic> json) {
    return HierarchyGroupSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about the hierarchy group.
class HierarchyGroupSummaryReference {
  /// The Amazon Resource Name (ARN) for the hierarchy group.
  final String? arn;

  /// The unique identifier for the hierarchy group.
  final String? id;

  HierarchyGroupSummaryReference({
    this.arn,
    this.id,
  });

  factory HierarchyGroupSummaryReference.fromJson(Map<String, dynamic> json) {
    return HierarchyGroupSummaryReference(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

/// Contains information about a hierarchy level.
class HierarchyLevel {
  /// The Amazon Resource Name (ARN) of the hierarchy level.
  final String? arn;

  /// The identifier of the hierarchy level.
  final String? id;

  /// The name of the hierarchy level.
  final String? name;

  HierarchyLevel({
    this.arn,
    this.id,
    this.name,
  });

  factory HierarchyLevel.fromJson(Map<String, dynamic> json) {
    return HierarchyLevel(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Contains information about the hierarchy level to update.
class HierarchyLevelUpdate {
  /// The name of the user hierarchy level. Must not be more than 50 characters.
  final String name;

  HierarchyLevelUpdate({
    required this.name,
  });

  factory HierarchyLevelUpdate.fromJson(Map<String, dynamic> json) {
    return HierarchyLevelUpdate(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// Contains information about the levels of a hierarchy group.
class HierarchyPath {
  /// Information about level five.
  final HierarchyGroupSummary? levelFive;

  /// Information about level four.
  final HierarchyGroupSummary? levelFour;

  /// Information about level one.
  final HierarchyGroupSummary? levelOne;

  /// Information about level three.
  final HierarchyGroupSummary? levelThree;

  /// Information about level two.
  final HierarchyGroupSummary? levelTwo;

  HierarchyPath({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });

  factory HierarchyPath.fromJson(Map<String, dynamic> json) {
    return HierarchyPath(
      levelFive: json['LevelFive'] != null
          ? HierarchyGroupSummary.fromJson(
              json['LevelFive'] as Map<String, dynamic>)
          : null,
      levelFour: json['LevelFour'] != null
          ? HierarchyGroupSummary.fromJson(
              json['LevelFour'] as Map<String, dynamic>)
          : null,
      levelOne: json['LevelOne'] != null
          ? HierarchyGroupSummary.fromJson(
              json['LevelOne'] as Map<String, dynamic>)
          : null,
      levelThree: json['LevelThree'] != null
          ? HierarchyGroupSummary.fromJson(
              json['LevelThree'] as Map<String, dynamic>)
          : null,
      levelTwo: json['LevelTwo'] != null
          ? HierarchyGroupSummary.fromJson(
              json['LevelTwo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final levelFive = this.levelFive;
    final levelFour = this.levelFour;
    final levelOne = this.levelOne;
    final levelThree = this.levelThree;
    final levelTwo = this.levelTwo;
    return {
      if (levelFive != null) 'LevelFive': levelFive,
      if (levelFour != null) 'LevelFour': levelFour,
      if (levelOne != null) 'LevelOne': levelOne,
      if (levelThree != null) 'LevelThree': levelThree,
      if (levelTwo != null) 'LevelTwo': levelTwo,
    };
  }
}

/// Information about the levels in the hierarchy group.
class HierarchyPathReference {
  /// Information about level five.
  final HierarchyGroupSummaryReference? levelFive;

  /// Information about level four.
  final HierarchyGroupSummaryReference? levelFour;

  /// Information about level one.
  final HierarchyGroupSummaryReference? levelOne;

  /// Information about level three.
  final HierarchyGroupSummaryReference? levelThree;

  /// Information about level two.
  final HierarchyGroupSummaryReference? levelTwo;

  HierarchyPathReference({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });

  factory HierarchyPathReference.fromJson(Map<String, dynamic> json) {
    return HierarchyPathReference(
      levelFive: json['LevelFive'] != null
          ? HierarchyGroupSummaryReference.fromJson(
              json['LevelFive'] as Map<String, dynamic>)
          : null,
      levelFour: json['LevelFour'] != null
          ? HierarchyGroupSummaryReference.fromJson(
              json['LevelFour'] as Map<String, dynamic>)
          : null,
      levelOne: json['LevelOne'] != null
          ? HierarchyGroupSummaryReference.fromJson(
              json['LevelOne'] as Map<String, dynamic>)
          : null,
      levelThree: json['LevelThree'] != null
          ? HierarchyGroupSummaryReference.fromJson(
              json['LevelThree'] as Map<String, dynamic>)
          : null,
      levelTwo: json['LevelTwo'] != null
          ? HierarchyGroupSummaryReference.fromJson(
              json['LevelTwo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final levelFive = this.levelFive;
    final levelFour = this.levelFour;
    final levelOne = this.levelOne;
    final levelThree = this.levelThree;
    final levelTwo = this.levelTwo;
    return {
      if (levelFive != null) 'LevelFive': levelFive,
      if (levelFour != null) 'LevelFour': levelFour,
      if (levelOne != null) 'LevelOne': levelOne,
      if (levelThree != null) 'LevelThree': levelThree,
      if (levelTwo != null) 'LevelTwo': levelTwo,
    };
  }
}

/// Contains information about a hierarchy structure.
class HierarchyStructure {
  /// Information about level five.
  final HierarchyLevel? levelFive;

  /// Information about level four.
  final HierarchyLevel? levelFour;

  /// Information about level one.
  final HierarchyLevel? levelOne;

  /// Information about level three.
  final HierarchyLevel? levelThree;

  /// Information about level two.
  final HierarchyLevel? levelTwo;

  HierarchyStructure({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });

  factory HierarchyStructure.fromJson(Map<String, dynamic> json) {
    return HierarchyStructure(
      levelFive: json['LevelFive'] != null
          ? HierarchyLevel.fromJson(json['LevelFive'] as Map<String, dynamic>)
          : null,
      levelFour: json['LevelFour'] != null
          ? HierarchyLevel.fromJson(json['LevelFour'] as Map<String, dynamic>)
          : null,
      levelOne: json['LevelOne'] != null
          ? HierarchyLevel.fromJson(json['LevelOne'] as Map<String, dynamic>)
          : null,
      levelThree: json['LevelThree'] != null
          ? HierarchyLevel.fromJson(json['LevelThree'] as Map<String, dynamic>)
          : null,
      levelTwo: json['LevelTwo'] != null
          ? HierarchyLevel.fromJson(json['LevelTwo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final levelFive = this.levelFive;
    final levelFour = this.levelFour;
    final levelOne = this.levelOne;
    final levelThree = this.levelThree;
    final levelTwo = this.levelTwo;
    return {
      if (levelFive != null) 'LevelFive': levelFive,
      if (levelFour != null) 'LevelFour': levelFour,
      if (levelOne != null) 'LevelOne': levelOne,
      if (levelThree != null) 'LevelThree': levelThree,
      if (levelTwo != null) 'LevelTwo': levelTwo,
    };
  }
}

/// Contains information about the level hierarchy to update.
class HierarchyStructureUpdate {
  /// The update for level five.
  final HierarchyLevelUpdate? levelFive;

  /// The update for level four.
  final HierarchyLevelUpdate? levelFour;

  /// The update for level one.
  final HierarchyLevelUpdate? levelOne;

  /// The update for level three.
  final HierarchyLevelUpdate? levelThree;

  /// The update for level two.
  final HierarchyLevelUpdate? levelTwo;

  HierarchyStructureUpdate({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });

  factory HierarchyStructureUpdate.fromJson(Map<String, dynamic> json) {
    return HierarchyStructureUpdate(
      levelFive: json['LevelFive'] != null
          ? HierarchyLevelUpdate.fromJson(
              json['LevelFive'] as Map<String, dynamic>)
          : null,
      levelFour: json['LevelFour'] != null
          ? HierarchyLevelUpdate.fromJson(
              json['LevelFour'] as Map<String, dynamic>)
          : null,
      levelOne: json['LevelOne'] != null
          ? HierarchyLevelUpdate.fromJson(
              json['LevelOne'] as Map<String, dynamic>)
          : null,
      levelThree: json['LevelThree'] != null
          ? HierarchyLevelUpdate.fromJson(
              json['LevelThree'] as Map<String, dynamic>)
          : null,
      levelTwo: json['LevelTwo'] != null
          ? HierarchyLevelUpdate.fromJson(
              json['LevelTwo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final levelFive = this.levelFive;
    final levelFour = this.levelFour;
    final levelOne = this.levelOne;
    final levelThree = this.levelThree;
    final levelTwo = this.levelTwo;
    return {
      if (levelFive != null) 'LevelFive': levelFive,
      if (levelFour != null) 'LevelFour': levelFour,
      if (levelOne != null) 'LevelOne': levelOne,
      if (levelThree != null) 'LevelThree': levelThree,
      if (levelTwo != null) 'LevelTwo': levelTwo,
    };
  }
}

/// Contains information about a historical metric. For a description of each
/// metric, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical
/// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
class HistoricalMetric {
  /// The name of the metric.
  final HistoricalMetricName? name;

  /// The statistic for the metric.
  final Statistic? statistic;

  /// The threshold for the metric, used with service level metrics.
  final Threshold? threshold;

  /// The unit for the metric.
  final Unit? unit;

  HistoricalMetric({
    this.name,
    this.statistic,
    this.threshold,
    this.unit,
  });

  factory HistoricalMetric.fromJson(Map<String, dynamic> json) {
    return HistoricalMetric(
      name: (json['Name'] as String?)?.toHistoricalMetricName(),
      statistic: (json['Statistic'] as String?)?.toStatistic(),
      threshold: json['Threshold'] != null
          ? Threshold.fromJson(json['Threshold'] as Map<String, dynamic>)
          : null,
      unit: (json['Unit'] as String?)?.toUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final statistic = this.statistic;
    final threshold = this.threshold;
    final unit = this.unit;
    return {
      if (name != null) 'Name': name.toValue(),
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (threshold != null) 'Threshold': threshold,
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

/// Contains the data for a historical metric.
class HistoricalMetricData {
  /// Information about the metric.
  final HistoricalMetric? metric;

  /// The value of the metric.
  final double? value;

  HistoricalMetricData({
    this.metric,
    this.value,
  });

  factory HistoricalMetricData.fromJson(Map<String, dynamic> json) {
    return HistoricalMetricData(
      metric: json['Metric'] != null
          ? HistoricalMetric.fromJson(json['Metric'] as Map<String, dynamic>)
          : null,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final value = this.value;
    return {
      if (metric != null) 'Metric': metric,
      if (value != null) 'Value': value,
    };
  }
}

/// The historical metric names.
enum HistoricalMetricName {
  contactsQueued,
  contactsHandled,
  contactsAbandoned,
  contactsConsulted,
  contactsAgentHungUpFirst,
  contactsHandledIncoming,
  contactsHandledOutbound,
  contactsHoldAbandons,
  contactsTransferredIn,
  contactsTransferredOut,
  contactsTransferredInFromQueue,
  contactsTransferredOutFromQueue,
  contactsMissed,
  callbackContactsHandled,
  apiContactsHandled,
  occupancy,
  handleTime,
  afterContactWorkTime,
  queuedTime,
  abandonTime,
  queueAnswerTime,
  holdTime,
  interactionTime,
  interactionAndHoldTime,
  serviceLevel,
}

extension on HistoricalMetricName {
  String toValue() {
    switch (this) {
      case HistoricalMetricName.contactsQueued:
        return 'CONTACTS_QUEUED';
      case HistoricalMetricName.contactsHandled:
        return 'CONTACTS_HANDLED';
      case HistoricalMetricName.contactsAbandoned:
        return 'CONTACTS_ABANDONED';
      case HistoricalMetricName.contactsConsulted:
        return 'CONTACTS_CONSULTED';
      case HistoricalMetricName.contactsAgentHungUpFirst:
        return 'CONTACTS_AGENT_HUNG_UP_FIRST';
      case HistoricalMetricName.contactsHandledIncoming:
        return 'CONTACTS_HANDLED_INCOMING';
      case HistoricalMetricName.contactsHandledOutbound:
        return 'CONTACTS_HANDLED_OUTBOUND';
      case HistoricalMetricName.contactsHoldAbandons:
        return 'CONTACTS_HOLD_ABANDONS';
      case HistoricalMetricName.contactsTransferredIn:
        return 'CONTACTS_TRANSFERRED_IN';
      case HistoricalMetricName.contactsTransferredOut:
        return 'CONTACTS_TRANSFERRED_OUT';
      case HistoricalMetricName.contactsTransferredInFromQueue:
        return 'CONTACTS_TRANSFERRED_IN_FROM_QUEUE';
      case HistoricalMetricName.contactsTransferredOutFromQueue:
        return 'CONTACTS_TRANSFERRED_OUT_FROM_QUEUE';
      case HistoricalMetricName.contactsMissed:
        return 'CONTACTS_MISSED';
      case HistoricalMetricName.callbackContactsHandled:
        return 'CALLBACK_CONTACTS_HANDLED';
      case HistoricalMetricName.apiContactsHandled:
        return 'API_CONTACTS_HANDLED';
      case HistoricalMetricName.occupancy:
        return 'OCCUPANCY';
      case HistoricalMetricName.handleTime:
        return 'HANDLE_TIME';
      case HistoricalMetricName.afterContactWorkTime:
        return 'AFTER_CONTACT_WORK_TIME';
      case HistoricalMetricName.queuedTime:
        return 'QUEUED_TIME';
      case HistoricalMetricName.abandonTime:
        return 'ABANDON_TIME';
      case HistoricalMetricName.queueAnswerTime:
        return 'QUEUE_ANSWER_TIME';
      case HistoricalMetricName.holdTime:
        return 'HOLD_TIME';
      case HistoricalMetricName.interactionTime:
        return 'INTERACTION_TIME';
      case HistoricalMetricName.interactionAndHoldTime:
        return 'INTERACTION_AND_HOLD_TIME';
      case HistoricalMetricName.serviceLevel:
        return 'SERVICE_LEVEL';
    }
  }
}

extension on String {
  HistoricalMetricName toHistoricalMetricName() {
    switch (this) {
      case 'CONTACTS_QUEUED':
        return HistoricalMetricName.contactsQueued;
      case 'CONTACTS_HANDLED':
        return HistoricalMetricName.contactsHandled;
      case 'CONTACTS_ABANDONED':
        return HistoricalMetricName.contactsAbandoned;
      case 'CONTACTS_CONSULTED':
        return HistoricalMetricName.contactsConsulted;
      case 'CONTACTS_AGENT_HUNG_UP_FIRST':
        return HistoricalMetricName.contactsAgentHungUpFirst;
      case 'CONTACTS_HANDLED_INCOMING':
        return HistoricalMetricName.contactsHandledIncoming;
      case 'CONTACTS_HANDLED_OUTBOUND':
        return HistoricalMetricName.contactsHandledOutbound;
      case 'CONTACTS_HOLD_ABANDONS':
        return HistoricalMetricName.contactsHoldAbandons;
      case 'CONTACTS_TRANSFERRED_IN':
        return HistoricalMetricName.contactsTransferredIn;
      case 'CONTACTS_TRANSFERRED_OUT':
        return HistoricalMetricName.contactsTransferredOut;
      case 'CONTACTS_TRANSFERRED_IN_FROM_QUEUE':
        return HistoricalMetricName.contactsTransferredInFromQueue;
      case 'CONTACTS_TRANSFERRED_OUT_FROM_QUEUE':
        return HistoricalMetricName.contactsTransferredOutFromQueue;
      case 'CONTACTS_MISSED':
        return HistoricalMetricName.contactsMissed;
      case 'CALLBACK_CONTACTS_HANDLED':
        return HistoricalMetricName.callbackContactsHandled;
      case 'API_CONTACTS_HANDLED':
        return HistoricalMetricName.apiContactsHandled;
      case 'OCCUPANCY':
        return HistoricalMetricName.occupancy;
      case 'HANDLE_TIME':
        return HistoricalMetricName.handleTime;
      case 'AFTER_CONTACT_WORK_TIME':
        return HistoricalMetricName.afterContactWorkTime;
      case 'QUEUED_TIME':
        return HistoricalMetricName.queuedTime;
      case 'ABANDON_TIME':
        return HistoricalMetricName.abandonTime;
      case 'QUEUE_ANSWER_TIME':
        return HistoricalMetricName.queueAnswerTime;
      case 'HOLD_TIME':
        return HistoricalMetricName.holdTime;
      case 'INTERACTION_TIME':
        return HistoricalMetricName.interactionTime;
      case 'INTERACTION_AND_HOLD_TIME':
        return HistoricalMetricName.interactionAndHoldTime;
      case 'SERVICE_LEVEL':
        return HistoricalMetricName.serviceLevel;
    }
    throw Exception('$this is not known in enum HistoricalMetricName');
  }
}

/// Contains information about the historical metrics retrieved.
class HistoricalMetricResult {
  /// The set of metrics.
  final List<HistoricalMetricData>? collections;

  /// The dimension for the metrics.
  final Dimensions? dimensions;

  HistoricalMetricResult({
    this.collections,
    this.dimensions,
  });

  factory HistoricalMetricResult.fromJson(Map<String, dynamic> json) {
    return HistoricalMetricResult(
      collections: (json['Collections'] as List?)
          ?.whereNotNull()
          .map((e) => HistoricalMetricData.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensions: json['Dimensions'] != null
          ? Dimensions.fromJson(json['Dimensions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final collections = this.collections;
    final dimensions = this.dimensions;
    return {
      if (collections != null) 'Collections': collections,
      if (dimensions != null) 'Dimensions': dimensions,
    };
  }
}

/// Information about of the hours of operation.
class HoursOfOperation {
  /// Configuration information for the hours of operation.
  final List<HoursOfOperationConfig>? config;

  /// The description for the hours of operation.
  final String? description;

  /// The Amazon Resource Name (ARN) for the hours of operation.
  final String? hoursOfOperationArn;

  /// The identifier for the hours of operation.
  final String? hoursOfOperationId;

  /// The name for the hours of operation.
  final String? name;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The time zone for the hours of operation.
  final String? timeZone;

  HoursOfOperation({
    this.config,
    this.description,
    this.hoursOfOperationArn,
    this.hoursOfOperationId,
    this.name,
    this.tags,
    this.timeZone,
  });

  factory HoursOfOperation.fromJson(Map<String, dynamic> json) {
    return HoursOfOperation(
      config: (json['Config'] as List?)
          ?.whereNotNull()
          .map(
              (e) => HoursOfOperationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      hoursOfOperationArn: json['HoursOfOperationArn'] as String?,
      hoursOfOperationId: json['HoursOfOperationId'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeZone: json['TimeZone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final config = this.config;
    final description = this.description;
    final hoursOfOperationArn = this.hoursOfOperationArn;
    final hoursOfOperationId = this.hoursOfOperationId;
    final name = this.name;
    final tags = this.tags;
    final timeZone = this.timeZone;
    return {
      if (config != null) 'Config': config,
      if (description != null) 'Description': description,
      if (hoursOfOperationArn != null)
        'HoursOfOperationArn': hoursOfOperationArn,
      if (hoursOfOperationId != null) 'HoursOfOperationId': hoursOfOperationId,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
      if (timeZone != null) 'TimeZone': timeZone,
    };
  }
}

/// Contains information about the hours of operation.
class HoursOfOperationConfig {
  /// The day that the hours of operation applies to.
  final HoursOfOperationDays day;

  /// The end time that your contact center closes.
  final HoursOfOperationTimeSlice endTime;

  /// The start time that your contact center opens.
  final HoursOfOperationTimeSlice startTime;

  HoursOfOperationConfig({
    required this.day,
    required this.endTime,
    required this.startTime,
  });

  factory HoursOfOperationConfig.fromJson(Map<String, dynamic> json) {
    return HoursOfOperationConfig(
      day: (json['Day'] as String).toHoursOfOperationDays(),
      endTime: HoursOfOperationTimeSlice.fromJson(
          json['EndTime'] as Map<String, dynamic>),
      startTime: HoursOfOperationTimeSlice.fromJson(
          json['StartTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final day = this.day;
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'Day': day.toValue(),
      'EndTime': endTime,
      'StartTime': startTime,
    };
  }
}

enum HoursOfOperationDays {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

extension on HoursOfOperationDays {
  String toValue() {
    switch (this) {
      case HoursOfOperationDays.sunday:
        return 'SUNDAY';
      case HoursOfOperationDays.monday:
        return 'MONDAY';
      case HoursOfOperationDays.tuesday:
        return 'TUESDAY';
      case HoursOfOperationDays.wednesday:
        return 'WEDNESDAY';
      case HoursOfOperationDays.thursday:
        return 'THURSDAY';
      case HoursOfOperationDays.friday:
        return 'FRIDAY';
      case HoursOfOperationDays.saturday:
        return 'SATURDAY';
    }
  }
}

extension on String {
  HoursOfOperationDays toHoursOfOperationDays() {
    switch (this) {
      case 'SUNDAY':
        return HoursOfOperationDays.sunday;
      case 'MONDAY':
        return HoursOfOperationDays.monday;
      case 'TUESDAY':
        return HoursOfOperationDays.tuesday;
      case 'WEDNESDAY':
        return HoursOfOperationDays.wednesday;
      case 'THURSDAY':
        return HoursOfOperationDays.thursday;
      case 'FRIDAY':
        return HoursOfOperationDays.friday;
      case 'SATURDAY':
        return HoursOfOperationDays.saturday;
    }
    throw Exception('$this is not known in enum HoursOfOperationDays');
  }
}

/// Contains summary information about hours of operation for a contact center.
class HoursOfOperationSummary {
  /// The Amazon Resource Name (ARN) of the hours of operation.
  final String? arn;

  /// The identifier of the hours of operation.
  final String? id;

  /// The name of the hours of operation.
  final String? name;

  HoursOfOperationSummary({
    this.arn,
    this.id,
    this.name,
  });

  factory HoursOfOperationSummary.fromJson(Map<String, dynamic> json) {
    return HoursOfOperationSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// The start time or end time for an hours of operation.
class HoursOfOperationTimeSlice {
  /// The hours.
  final int hours;

  /// The minutes.
  final int minutes;

  HoursOfOperationTimeSlice({
    required this.hours,
    required this.minutes,
  });

  factory HoursOfOperationTimeSlice.fromJson(Map<String, dynamic> json) {
    return HoursOfOperationTimeSlice(
      hours: json['Hours'] as int,
      minutes: json['Minutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final hours = this.hours;
    final minutes = this.minutes;
    return {
      'Hours': hours,
      'Minutes': minutes,
    };
  }
}

/// The Amazon Connect instance.
class Instance {
  /// The Amazon Resource Name (ARN) of the instance.
  final String? arn;

  /// When the instance was created.
  final DateTime? createdTime;

  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String? id;

  /// The identity management type.
  final DirectoryType? identityManagementType;

  /// Whether inbound calls are enabled.
  final bool? inboundCallsEnabled;

  /// The alias of instance.
  final String? instanceAlias;

  /// The state of the instance.
  final InstanceStatus? instanceStatus;

  /// Whether outbound calls are enabled.
  final bool? outboundCallsEnabled;

  /// The service role of the instance.
  final String? serviceRole;

  /// Relevant details why the instance was not successfully created.
  final InstanceStatusReason? statusReason;

  Instance({
    this.arn,
    this.createdTime,
    this.id,
    this.identityManagementType,
    this.inboundCallsEnabled,
    this.instanceAlias,
    this.instanceStatus,
    this.outboundCallsEnabled,
    this.serviceRole,
    this.statusReason,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      id: json['Id'] as String?,
      identityManagementType:
          (json['IdentityManagementType'] as String?)?.toDirectoryType(),
      inboundCallsEnabled: json['InboundCallsEnabled'] as bool?,
      instanceAlias: json['InstanceAlias'] as String?,
      instanceStatus: (json['InstanceStatus'] as String?)?.toInstanceStatus(),
      outboundCallsEnabled: json['OutboundCallsEnabled'] as bool?,
      serviceRole: json['ServiceRole'] as String?,
      statusReason: json['StatusReason'] != null
          ? InstanceStatusReason.fromJson(
              json['StatusReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final id = this.id;
    final identityManagementType = this.identityManagementType;
    final inboundCallsEnabled = this.inboundCallsEnabled;
    final instanceAlias = this.instanceAlias;
    final instanceStatus = this.instanceStatus;
    final outboundCallsEnabled = this.outboundCallsEnabled;
    final serviceRole = this.serviceRole;
    final statusReason = this.statusReason;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (id != null) 'Id': id,
      if (identityManagementType != null)
        'IdentityManagementType': identityManagementType.toValue(),
      if (inboundCallsEnabled != null)
        'InboundCallsEnabled': inboundCallsEnabled,
      if (instanceAlias != null) 'InstanceAlias': instanceAlias,
      if (instanceStatus != null) 'InstanceStatus': instanceStatus.toValue(),
      if (outboundCallsEnabled != null)
        'OutboundCallsEnabled': outboundCallsEnabled,
      if (serviceRole != null) 'ServiceRole': serviceRole,
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum InstanceAttributeType {
  inboundCalls,
  outboundCalls,
  contactflowLogs,
  contactLens,
  autoResolveBestVoices,
  useCustomTtsVoices,
  earlyMedia,
  multiPartyConference,
  highVolumeOutbound,
}

extension on InstanceAttributeType {
  String toValue() {
    switch (this) {
      case InstanceAttributeType.inboundCalls:
        return 'INBOUND_CALLS';
      case InstanceAttributeType.outboundCalls:
        return 'OUTBOUND_CALLS';
      case InstanceAttributeType.contactflowLogs:
        return 'CONTACTFLOW_LOGS';
      case InstanceAttributeType.contactLens:
        return 'CONTACT_LENS';
      case InstanceAttributeType.autoResolveBestVoices:
        return 'AUTO_RESOLVE_BEST_VOICES';
      case InstanceAttributeType.useCustomTtsVoices:
        return 'USE_CUSTOM_TTS_VOICES';
      case InstanceAttributeType.earlyMedia:
        return 'EARLY_MEDIA';
      case InstanceAttributeType.multiPartyConference:
        return 'MULTI_PARTY_CONFERENCE';
      case InstanceAttributeType.highVolumeOutbound:
        return 'HIGH_VOLUME_OUTBOUND';
    }
  }
}

extension on String {
  InstanceAttributeType toInstanceAttributeType() {
    switch (this) {
      case 'INBOUND_CALLS':
        return InstanceAttributeType.inboundCalls;
      case 'OUTBOUND_CALLS':
        return InstanceAttributeType.outboundCalls;
      case 'CONTACTFLOW_LOGS':
        return InstanceAttributeType.contactflowLogs;
      case 'CONTACT_LENS':
        return InstanceAttributeType.contactLens;
      case 'AUTO_RESOLVE_BEST_VOICES':
        return InstanceAttributeType.autoResolveBestVoices;
      case 'USE_CUSTOM_TTS_VOICES':
        return InstanceAttributeType.useCustomTtsVoices;
      case 'EARLY_MEDIA':
        return InstanceAttributeType.earlyMedia;
      case 'MULTI_PARTY_CONFERENCE':
        return InstanceAttributeType.multiPartyConference;
      case 'HIGH_VOLUME_OUTBOUND':
        return InstanceAttributeType.highVolumeOutbound;
    }
    throw Exception('$this is not known in enum InstanceAttributeType');
  }
}

enum InstanceStatus {
  creationInProgress,
  active,
  creationFailed,
}

extension on InstanceStatus {
  String toValue() {
    switch (this) {
      case InstanceStatus.creationInProgress:
        return 'CREATION_IN_PROGRESS';
      case InstanceStatus.active:
        return 'ACTIVE';
      case InstanceStatus.creationFailed:
        return 'CREATION_FAILED';
    }
  }
}

extension on String {
  InstanceStatus toInstanceStatus() {
    switch (this) {
      case 'CREATION_IN_PROGRESS':
        return InstanceStatus.creationInProgress;
      case 'ACTIVE':
        return InstanceStatus.active;
      case 'CREATION_FAILED':
        return InstanceStatus.creationFailed;
    }
    throw Exception('$this is not known in enum InstanceStatus');
  }
}

/// Relevant details why the instance was not successfully created.
class InstanceStatusReason {
  /// The message.
  final String? message;

  InstanceStatusReason({
    this.message,
  });

  factory InstanceStatusReason.fromJson(Map<String, dynamic> json) {
    return InstanceStatusReason(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The storage configuration for the instance.
class InstanceStorageConfig {
  /// A valid storage type.
  final StorageType storageType;

  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  final String? associationId;

  /// The configuration of the Kinesis Firehose delivery stream.
  final KinesisFirehoseConfig? kinesisFirehoseConfig;

  /// The configuration of the Kinesis data stream.
  final KinesisStreamConfig? kinesisStreamConfig;

  /// The configuration of the Kinesis video stream.
  final KinesisVideoStreamConfig? kinesisVideoStreamConfig;

  /// The S3 bucket configuration.
  final S3Config? s3Config;

  InstanceStorageConfig({
    required this.storageType,
    this.associationId,
    this.kinesisFirehoseConfig,
    this.kinesisStreamConfig,
    this.kinesisVideoStreamConfig,
    this.s3Config,
  });

  factory InstanceStorageConfig.fromJson(Map<String, dynamic> json) {
    return InstanceStorageConfig(
      storageType: (json['StorageType'] as String).toStorageType(),
      associationId: json['AssociationId'] as String?,
      kinesisFirehoseConfig: json['KinesisFirehoseConfig'] != null
          ? KinesisFirehoseConfig.fromJson(
              json['KinesisFirehoseConfig'] as Map<String, dynamic>)
          : null,
      kinesisStreamConfig: json['KinesisStreamConfig'] != null
          ? KinesisStreamConfig.fromJson(
              json['KinesisStreamConfig'] as Map<String, dynamic>)
          : null,
      kinesisVideoStreamConfig: json['KinesisVideoStreamConfig'] != null
          ? KinesisVideoStreamConfig.fromJson(
              json['KinesisVideoStreamConfig'] as Map<String, dynamic>)
          : null,
      s3Config: json['S3Config'] != null
          ? S3Config.fromJson(json['S3Config'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageType = this.storageType;
    final associationId = this.associationId;
    final kinesisFirehoseConfig = this.kinesisFirehoseConfig;
    final kinesisStreamConfig = this.kinesisStreamConfig;
    final kinesisVideoStreamConfig = this.kinesisVideoStreamConfig;
    final s3Config = this.s3Config;
    return {
      'StorageType': storageType.toValue(),
      if (associationId != null) 'AssociationId': associationId,
      if (kinesisFirehoseConfig != null)
        'KinesisFirehoseConfig': kinesisFirehoseConfig,
      if (kinesisStreamConfig != null)
        'KinesisStreamConfig': kinesisStreamConfig,
      if (kinesisVideoStreamConfig != null)
        'KinesisVideoStreamConfig': kinesisVideoStreamConfig,
      if (s3Config != null) 'S3Config': s3Config,
    };
  }
}

enum InstanceStorageResourceType {
  chatTranscripts,
  callRecordings,
  scheduledReports,
  mediaStreams,
  contactTraceRecords,
  agentEvents,
  realTimeContactAnalysisSegments,
}

extension on InstanceStorageResourceType {
  String toValue() {
    switch (this) {
      case InstanceStorageResourceType.chatTranscripts:
        return 'CHAT_TRANSCRIPTS';
      case InstanceStorageResourceType.callRecordings:
        return 'CALL_RECORDINGS';
      case InstanceStorageResourceType.scheduledReports:
        return 'SCHEDULED_REPORTS';
      case InstanceStorageResourceType.mediaStreams:
        return 'MEDIA_STREAMS';
      case InstanceStorageResourceType.contactTraceRecords:
        return 'CONTACT_TRACE_RECORDS';
      case InstanceStorageResourceType.agentEvents:
        return 'AGENT_EVENTS';
      case InstanceStorageResourceType.realTimeContactAnalysisSegments:
        return 'REAL_TIME_CONTACT_ANALYSIS_SEGMENTS';
    }
  }
}

extension on String {
  InstanceStorageResourceType toInstanceStorageResourceType() {
    switch (this) {
      case 'CHAT_TRANSCRIPTS':
        return InstanceStorageResourceType.chatTranscripts;
      case 'CALL_RECORDINGS':
        return InstanceStorageResourceType.callRecordings;
      case 'SCHEDULED_REPORTS':
        return InstanceStorageResourceType.scheduledReports;
      case 'MEDIA_STREAMS':
        return InstanceStorageResourceType.mediaStreams;
      case 'CONTACT_TRACE_RECORDS':
        return InstanceStorageResourceType.contactTraceRecords;
      case 'AGENT_EVENTS':
        return InstanceStorageResourceType.agentEvents;
      case 'REAL_TIME_CONTACT_ANALYSIS_SEGMENTS':
        return InstanceStorageResourceType.realTimeContactAnalysisSegments;
    }
    throw Exception('$this is not known in enum InstanceStorageResourceType');
  }
}

/// Information about the instance.
class InstanceSummary {
  /// The Amazon Resource Name (ARN) of the instance.
  final String? arn;

  /// When the instance was created.
  final DateTime? createdTime;

  /// The identifier of the instance.
  final String? id;

  /// The identity management type of the instance.
  final DirectoryType? identityManagementType;

  /// Whether inbound calls are enabled.
  final bool? inboundCallsEnabled;

  /// The alias of the instance.
  final String? instanceAlias;

  /// The state of the instance.
  final InstanceStatus? instanceStatus;

  /// Whether outbound calls are enabled.
  final bool? outboundCallsEnabled;

  /// The service role of the instance.
  final String? serviceRole;

  InstanceSummary({
    this.arn,
    this.createdTime,
    this.id,
    this.identityManagementType,
    this.inboundCallsEnabled,
    this.instanceAlias,
    this.instanceStatus,
    this.outboundCallsEnabled,
    this.serviceRole,
  });

  factory InstanceSummary.fromJson(Map<String, dynamic> json) {
    return InstanceSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      id: json['Id'] as String?,
      identityManagementType:
          (json['IdentityManagementType'] as String?)?.toDirectoryType(),
      inboundCallsEnabled: json['InboundCallsEnabled'] as bool?,
      instanceAlias: json['InstanceAlias'] as String?,
      instanceStatus: (json['InstanceStatus'] as String?)?.toInstanceStatus(),
      outboundCallsEnabled: json['OutboundCallsEnabled'] as bool?,
      serviceRole: json['ServiceRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final id = this.id;
    final identityManagementType = this.identityManagementType;
    final inboundCallsEnabled = this.inboundCallsEnabled;
    final instanceAlias = this.instanceAlias;
    final instanceStatus = this.instanceStatus;
    final outboundCallsEnabled = this.outboundCallsEnabled;
    final serviceRole = this.serviceRole;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (id != null) 'Id': id,
      if (identityManagementType != null)
        'IdentityManagementType': identityManagementType.toValue(),
      if (inboundCallsEnabled != null)
        'InboundCallsEnabled': inboundCallsEnabled,
      if (instanceAlias != null) 'InstanceAlias': instanceAlias,
      if (instanceStatus != null) 'InstanceStatus': instanceStatus.toValue(),
      if (outboundCallsEnabled != null)
        'OutboundCallsEnabled': outboundCallsEnabled,
      if (serviceRole != null) 'ServiceRole': serviceRole,
    };
  }
}

/// Contains summary information about the associated AppIntegrations.
class IntegrationAssociationSummary {
  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String? instanceId;

  /// The Amazon Resource Name (ARN) for the AppIntegration.
  final String? integrationArn;

  /// The Amazon Resource Name (ARN) for the AppIntegration association.
  final String? integrationAssociationArn;

  /// The identifier for the AppIntegration association.
  final String? integrationAssociationId;

  /// The integration type.
  final IntegrationType? integrationType;

  /// The user-provided, friendly name for the external application.
  final String? sourceApplicationName;

  /// The URL for the external application.
  final String? sourceApplicationUrl;

  /// The name of the source.
  final SourceType? sourceType;

  IntegrationAssociationSummary({
    this.instanceId,
    this.integrationArn,
    this.integrationAssociationArn,
    this.integrationAssociationId,
    this.integrationType,
    this.sourceApplicationName,
    this.sourceApplicationUrl,
    this.sourceType,
  });

  factory IntegrationAssociationSummary.fromJson(Map<String, dynamic> json) {
    return IntegrationAssociationSummary(
      instanceId: json['InstanceId'] as String?,
      integrationArn: json['IntegrationArn'] as String?,
      integrationAssociationArn: json['IntegrationAssociationArn'] as String?,
      integrationAssociationId: json['IntegrationAssociationId'] as String?,
      integrationType:
          (json['IntegrationType'] as String?)?.toIntegrationType(),
      sourceApplicationName: json['SourceApplicationName'] as String?,
      sourceApplicationUrl: json['SourceApplicationUrl'] as String?,
      sourceType: (json['SourceType'] as String?)?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final integrationArn = this.integrationArn;
    final integrationAssociationArn = this.integrationAssociationArn;
    final integrationAssociationId = this.integrationAssociationId;
    final integrationType = this.integrationType;
    final sourceApplicationName = this.sourceApplicationName;
    final sourceApplicationUrl = this.sourceApplicationUrl;
    final sourceType = this.sourceType;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
      if (integrationArn != null) 'IntegrationArn': integrationArn,
      if (integrationAssociationArn != null)
        'IntegrationAssociationArn': integrationAssociationArn,
      if (integrationAssociationId != null)
        'IntegrationAssociationId': integrationAssociationId,
      if (integrationType != null) 'IntegrationType': integrationType.toValue(),
      if (sourceApplicationName != null)
        'SourceApplicationName': sourceApplicationName,
      if (sourceApplicationUrl != null)
        'SourceApplicationUrl': sourceApplicationUrl,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

enum IntegrationType {
  event,
  voiceId,
  pinpointApp,
  wisdomAssistant,
  wisdomKnowledgeBase,
}

extension on IntegrationType {
  String toValue() {
    switch (this) {
      case IntegrationType.event:
        return 'EVENT';
      case IntegrationType.voiceId:
        return 'VOICE_ID';
      case IntegrationType.pinpointApp:
        return 'PINPOINT_APP';
      case IntegrationType.wisdomAssistant:
        return 'WISDOM_ASSISTANT';
      case IntegrationType.wisdomKnowledgeBase:
        return 'WISDOM_KNOWLEDGE_BASE';
    }
  }
}

extension on String {
  IntegrationType toIntegrationType() {
    switch (this) {
      case 'EVENT':
        return IntegrationType.event;
      case 'VOICE_ID':
        return IntegrationType.voiceId;
      case 'PINPOINT_APP':
        return IntegrationType.pinpointApp;
      case 'WISDOM_ASSISTANT':
        return IntegrationType.wisdomAssistant;
      case 'WISDOM_KNOWLEDGE_BASE':
        return IntegrationType.wisdomKnowledgeBase;
    }
    throw Exception('$this is not known in enum IntegrationType');
  }
}

/// A field that is invisible to an agent.
class InvisibleFieldInfo {
  /// Identifier of the invisible field.
  final TaskTemplateFieldIdentifier? id;

  InvisibleFieldInfo({
    this.id,
  });

  factory InvisibleFieldInfo.fromJson(Map<String, dynamic> json) {
    return InvisibleFieldInfo(
      id: json['Id'] != null
          ? TaskTemplateFieldIdentifier.fromJson(
              json['Id'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// Configuration information of a Kinesis Data Firehose delivery stream.
class KinesisFirehoseConfig {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String firehoseArn;

  KinesisFirehoseConfig({
    required this.firehoseArn,
  });

  factory KinesisFirehoseConfig.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseConfig(
      firehoseArn: json['FirehoseArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final firehoseArn = this.firehoseArn;
    return {
      'FirehoseArn': firehoseArn,
    };
  }
}

/// Configuration information of a Kinesis data stream.
class KinesisStreamConfig {
  /// The Amazon Resource Name (ARN) of the data stream.
  final String streamArn;

  KinesisStreamConfig({
    required this.streamArn,
  });

  factory KinesisStreamConfig.fromJson(Map<String, dynamic> json) {
    return KinesisStreamConfig(
      streamArn: json['StreamArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final streamArn = this.streamArn;
    return {
      'StreamArn': streamArn,
    };
  }
}

/// Configuration information of a Kinesis video stream.
class KinesisVideoStreamConfig {
  /// The encryption configuration.
  final EncryptionConfig encryptionConfig;

  /// The prefix of the video stream.
  final String prefix;

  /// The number of hours data is retained in the stream. Kinesis Video Streams
  /// retains the data in a data store that is associated with the stream.
  ///
  /// The default value is 0, indicating that the stream does not persist data.
  final int retentionPeriodHours;

  KinesisVideoStreamConfig({
    required this.encryptionConfig,
    required this.prefix,
    required this.retentionPeriodHours,
  });

  factory KinesisVideoStreamConfig.fromJson(Map<String, dynamic> json) {
    return KinesisVideoStreamConfig(
      encryptionConfig: EncryptionConfig.fromJson(
          json['EncryptionConfig'] as Map<String, dynamic>),
      prefix: json['Prefix'] as String,
      retentionPeriodHours: json['RetentionPeriodHours'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfig = this.encryptionConfig;
    final prefix = this.prefix;
    final retentionPeriodHours = this.retentionPeriodHours;
    return {
      'EncryptionConfig': encryptionConfig,
      'Prefix': prefix,
      'RetentionPeriodHours': retentionPeriodHours,
    };
  }
}

/// Configuration information of an Amazon Lex bot.
class LexBot {
  /// The Region that the Amazon Lex bot was created in.
  final String? lexRegion;

  /// The name of the Amazon Lex bot.
  final String? name;

  LexBot({
    this.lexRegion,
    this.name,
  });

  factory LexBot.fromJson(Map<String, dynamic> json) {
    return LexBot(
      lexRegion: json['LexRegion'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lexRegion = this.lexRegion;
    final name = this.name;
    return {
      if (lexRegion != null) 'LexRegion': lexRegion,
      if (name != null) 'Name': name,
    };
  }
}

/// Configuration information of an Amazon Lex or Amazon Lex V2 bot.
class LexBotConfig {
  final LexBot? lexBot;

  /// Configuration information of an Amazon Lex V2 bot.
  final LexV2Bot? lexV2Bot;

  LexBotConfig({
    this.lexBot,
    this.lexV2Bot,
  });

  factory LexBotConfig.fromJson(Map<String, dynamic> json) {
    return LexBotConfig(
      lexBot: json['LexBot'] != null
          ? LexBot.fromJson(json['LexBot'] as Map<String, dynamic>)
          : null,
      lexV2Bot: json['LexV2Bot'] != null
          ? LexV2Bot.fromJson(json['LexV2Bot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lexBot = this.lexBot;
    final lexV2Bot = this.lexV2Bot;
    return {
      if (lexBot != null) 'LexBot': lexBot,
      if (lexV2Bot != null) 'LexV2Bot': lexV2Bot,
    };
  }
}

/// Configuration information of an Amazon Lex V2 bot.
class LexV2Bot {
  /// The Amazon Resource Name (ARN) of the Amazon Lex V2 bot.
  final String? aliasArn;

  LexV2Bot({
    this.aliasArn,
  });

  factory LexV2Bot.fromJson(Map<String, dynamic> json) {
    return LexV2Bot(
      aliasArn: json['AliasArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasArn = this.aliasArn;
    return {
      if (aliasArn != null) 'AliasArn': aliasArn,
    };
  }
}

enum LexVersion {
  v1,
  v2,
}

extension on LexVersion {
  String toValue() {
    switch (this) {
      case LexVersion.v1:
        return 'V1';
      case LexVersion.v2:
        return 'V2';
    }
  }
}

extension on String {
  LexVersion toLexVersion() {
    switch (this) {
      case 'V1':
        return LexVersion.v1;
      case 'V2':
        return LexVersion.v2;
    }
    throw Exception('$this is not known in enum LexVersion');
  }
}

class ListAgentStatusResponse {
  /// A summary of agent statuses.
  final List<AgentStatusSummary>? agentStatusSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListAgentStatusResponse({
    this.agentStatusSummaryList,
    this.nextToken,
  });

  factory ListAgentStatusResponse.fromJson(Map<String, dynamic> json) {
    return ListAgentStatusResponse(
      agentStatusSummaryList: (json['AgentStatusSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => AgentStatusSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentStatusSummaryList = this.agentStatusSummaryList;
    final nextToken = this.nextToken;
    return {
      if (agentStatusSummaryList != null)
        'AgentStatusSummaryList': agentStatusSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApprovedOriginsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The approved origins.
  final List<String>? origins;

  ListApprovedOriginsResponse({
    this.nextToken,
    this.origins,
  });

  factory ListApprovedOriginsResponse.fromJson(Map<String, dynamic> json) {
    return ListApprovedOriginsResponse(
      nextToken: json['NextToken'] as String?,
      origins: (json['Origins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final origins = this.origins;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (origins != null) 'Origins': origins,
    };
  }
}

class ListBotsResponse {
  /// The names and Regions of the Amazon Lex or Amazon Lex V2 bots associated
  /// with the specified instance.
  final List<LexBotConfig>? lexBots;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListBotsResponse({
    this.lexBots,
    this.nextToken,
  });

  factory ListBotsResponse.fromJson(Map<String, dynamic> json) {
    return ListBotsResponse(
      lexBots: (json['LexBots'] as List?)
          ?.whereNotNull()
          .map((e) => LexBotConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lexBots = this.lexBots;
    final nextToken = this.nextToken;
    return {
      if (lexBots != null) 'LexBots': lexBots,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListContactFlowModulesResponse {
  /// Information about the contact flow module.
  final List<ContactFlowModuleSummary>? contactFlowModulesSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListContactFlowModulesResponse({
    this.contactFlowModulesSummaryList,
    this.nextToken,
  });

  factory ListContactFlowModulesResponse.fromJson(Map<String, dynamic> json) {
    return ListContactFlowModulesResponse(
      contactFlowModulesSummaryList:
          (json['ContactFlowModulesSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ContactFlowModuleSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlowModulesSummaryList = this.contactFlowModulesSummaryList;
    final nextToken = this.nextToken;
    return {
      if (contactFlowModulesSummaryList != null)
        'ContactFlowModulesSummaryList': contactFlowModulesSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListContactFlowsResponse {
  /// Information about the contact flows.
  final List<ContactFlowSummary>? contactFlowSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListContactFlowsResponse({
    this.contactFlowSummaryList,
    this.nextToken,
  });

  factory ListContactFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListContactFlowsResponse(
      contactFlowSummaryList: (json['ContactFlowSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ContactFlowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlowSummaryList = this.contactFlowSummaryList;
    final nextToken = this.nextToken;
    return {
      if (contactFlowSummaryList != null)
        'ContactFlowSummaryList': contactFlowSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListContactReferencesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  /// <important>
  /// This is always returned as null in the response.
  /// </important>
  final String? nextToken;

  /// Information about the contact flows.
  final List<ReferenceSummary>? referenceSummaryList;

  ListContactReferencesResponse({
    this.nextToken,
    this.referenceSummaryList,
  });

  factory ListContactReferencesResponse.fromJson(Map<String, dynamic> json) {
    return ListContactReferencesResponse(
      nextToken: json['NextToken'] as String?,
      referenceSummaryList: (json['ReferenceSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ReferenceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final referenceSummaryList = this.referenceSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (referenceSummaryList != null)
        'ReferenceSummaryList': referenceSummaryList,
    };
  }
}

class ListDefaultVocabulariesResponse {
  /// A list of default vocabularies.
  final List<DefaultVocabulary> defaultVocabularyList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListDefaultVocabulariesResponse({
    required this.defaultVocabularyList,
    this.nextToken,
  });

  factory ListDefaultVocabulariesResponse.fromJson(Map<String, dynamic> json) {
    return ListDefaultVocabulariesResponse(
      defaultVocabularyList: (json['DefaultVocabularyList'] as List)
          .whereNotNull()
          .map((e) => DefaultVocabulary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultVocabularyList = this.defaultVocabularyList;
    final nextToken = this.nextToken;
    return {
      'DefaultVocabularyList': defaultVocabularyList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListHoursOfOperationsResponse {
  /// Information about the hours of operation.
  final List<HoursOfOperationSummary>? hoursOfOperationSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListHoursOfOperationsResponse({
    this.hoursOfOperationSummaryList,
    this.nextToken,
  });

  factory ListHoursOfOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListHoursOfOperationsResponse(
      hoursOfOperationSummaryList:
          (json['HoursOfOperationSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  HoursOfOperationSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hoursOfOperationSummaryList = this.hoursOfOperationSummaryList;
    final nextToken = this.nextToken;
    return {
      if (hoursOfOperationSummaryList != null)
        'HoursOfOperationSummaryList': hoursOfOperationSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInstanceAttributesResponse {
  /// The attribute types.
  final List<Attribute>? attributes;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListInstanceAttributesResponse({
    this.attributes,
    this.nextToken,
  });

  factory ListInstanceAttributesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstanceAttributesResponse(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final nextToken = this.nextToken;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInstanceStorageConfigsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// A valid storage type.
  final List<InstanceStorageConfig>? storageConfigs;

  ListInstanceStorageConfigsResponse({
    this.nextToken,
    this.storageConfigs,
  });

  factory ListInstanceStorageConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListInstanceStorageConfigsResponse(
      nextToken: json['NextToken'] as String?,
      storageConfigs: (json['StorageConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceStorageConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storageConfigs = this.storageConfigs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storageConfigs != null) 'StorageConfigs': storageConfigs,
    };
  }
}

class ListInstancesResponse {
  /// Information about the instances.
  final List<InstanceSummary>? instanceSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListInstancesResponse({
    this.instanceSummaryList,
    this.nextToken,
  });

  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstancesResponse(
      instanceSummaryList: (json['InstanceSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceSummaryList = this.instanceSummaryList;
    final nextToken = this.nextToken;
    return {
      if (instanceSummaryList != null)
        'InstanceSummaryList': instanceSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIntegrationAssociationsResponse {
  /// The associations.
  final List<IntegrationAssociationSummary>? integrationAssociationSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListIntegrationAssociationsResponse({
    this.integrationAssociationSummaryList,
    this.nextToken,
  });

  factory ListIntegrationAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListIntegrationAssociationsResponse(
      integrationAssociationSummaryList:
          (json['IntegrationAssociationSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) => IntegrationAssociationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationAssociationSummaryList =
        this.integrationAssociationSummaryList;
    final nextToken = this.nextToken;
    return {
      if (integrationAssociationSummaryList != null)
        'IntegrationAssociationSummaryList': integrationAssociationSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLambdaFunctionsResponse {
  /// The Lambdafunction ARNs associated with the specified instance.
  final List<String>? lambdaFunctions;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListLambdaFunctionsResponse({
    this.lambdaFunctions,
    this.nextToken,
  });

  factory ListLambdaFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLambdaFunctionsResponse(
      lambdaFunctions: (json['LambdaFunctions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaFunctions = this.lambdaFunctions;
    final nextToken = this.nextToken;
    return {
      if (lambdaFunctions != null) 'LambdaFunctions': lambdaFunctions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLexBotsResponse {
  /// The names and Regions of the Amazon Lex bots associated with the specified
  /// instance.
  final List<LexBot>? lexBots;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListLexBotsResponse({
    this.lexBots,
    this.nextToken,
  });

  factory ListLexBotsResponse.fromJson(Map<String, dynamic> json) {
    return ListLexBotsResponse(
      lexBots: (json['LexBots'] as List?)
          ?.whereNotNull()
          .map((e) => LexBot.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lexBots = this.lexBots;
    final nextToken = this.nextToken;
    return {
      if (lexBots != null) 'LexBots': lexBots,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPhoneNumbersResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the phone numbers.
  final List<PhoneNumberSummary>? phoneNumberSummaryList;

  ListPhoneNumbersResponse({
    this.nextToken,
    this.phoneNumberSummaryList,
  });

  factory ListPhoneNumbersResponse.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumbersResponse(
      nextToken: json['NextToken'] as String?,
      phoneNumberSummaryList: (json['PhoneNumberSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumberSummaryList = this.phoneNumberSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumberSummaryList != null)
        'PhoneNumberSummaryList': phoneNumberSummaryList,
    };
  }
}

/// Information about phone numbers that have been claimed to your Amazon
/// Connect instance.
class ListPhoneNumbersSummary {
  /// The phone number. Phone numbers are formatted <code>[+] [country code]
  /// [subscriber number including area code]</code>.
  final String? phoneNumber;

  /// The Amazon Resource Name (ARN) of the phone number.
  final String? phoneNumberArn;

  /// The ISO country code.
  final PhoneNumberCountryCode? phoneNumberCountryCode;

  /// A unique identifier for the phone number.
  final String? phoneNumberId;

  /// The type of phone number.
  final PhoneNumberType? phoneNumberType;

  /// The Amazon Resource Name (ARN) for Amazon Connect instances that phone
  /// numbers are claimed to.
  final String? targetArn;

  ListPhoneNumbersSummary({
    this.phoneNumber,
    this.phoneNumberArn,
    this.phoneNumberCountryCode,
    this.phoneNumberId,
    this.phoneNumberType,
    this.targetArn,
  });

  factory ListPhoneNumbersSummary.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumbersSummary(
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberCountryCode: (json['PhoneNumberCountryCode'] as String?)
          ?.toPhoneNumberCountryCode(),
      phoneNumberId: json['PhoneNumberId'] as String?,
      phoneNumberType:
          (json['PhoneNumberType'] as String?)?.toPhoneNumberType(),
      targetArn: json['TargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberCountryCode = this.phoneNumberCountryCode;
    final phoneNumberId = this.phoneNumberId;
    final phoneNumberType = this.phoneNumberType;
    final targetArn = this.targetArn;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberCountryCode != null)
        'PhoneNumberCountryCode': phoneNumberCountryCode.toValue(),
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (phoneNumberType != null) 'PhoneNumberType': phoneNumberType.toValue(),
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

class ListPhoneNumbersV2Response {
  /// Information about phone numbers that have been claimed to your Amazon
  /// Connect instances.
  final List<ListPhoneNumbersSummary>? listPhoneNumbersSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListPhoneNumbersV2Response({
    this.listPhoneNumbersSummaryList,
    this.nextToken,
  });

  factory ListPhoneNumbersV2Response.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumbersV2Response(
      listPhoneNumbersSummaryList:
          (json['ListPhoneNumbersSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ListPhoneNumbersSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final listPhoneNumbersSummaryList = this.listPhoneNumbersSummaryList;
    final nextToken = this.nextToken;
    return {
      if (listPhoneNumbersSummaryList != null)
        'ListPhoneNumbersSummaryList': listPhoneNumbersSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPromptsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the prompts.
  final List<PromptSummary>? promptSummaryList;

  ListPromptsResponse({
    this.nextToken,
    this.promptSummaryList,
  });

  factory ListPromptsResponse.fromJson(Map<String, dynamic> json) {
    return ListPromptsResponse(
      nextToken: json['NextToken'] as String?,
      promptSummaryList: (json['PromptSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => PromptSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final promptSummaryList = this.promptSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (promptSummaryList != null) 'PromptSummaryList': promptSummaryList,
    };
  }
}

class ListQueueQuickConnectsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the quick connects.
  final List<QuickConnectSummary>? quickConnectSummaryList;

  ListQueueQuickConnectsResponse({
    this.nextToken,
    this.quickConnectSummaryList,
  });

  factory ListQueueQuickConnectsResponse.fromJson(Map<String, dynamic> json) {
    return ListQueueQuickConnectsResponse(
      nextToken: json['NextToken'] as String?,
      quickConnectSummaryList: (json['QuickConnectSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => QuickConnectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final quickConnectSummaryList = this.quickConnectSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (quickConnectSummaryList != null)
        'QuickConnectSummaryList': quickConnectSummaryList,
    };
  }
}

class ListQueuesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the queues.
  final List<QueueSummary>? queueSummaryList;

  ListQueuesResponse({
    this.nextToken,
    this.queueSummaryList,
  });

  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueuesResponse(
      nextToken: json['NextToken'] as String?,
      queueSummaryList: (json['QueueSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => QueueSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final queueSummaryList = this.queueSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (queueSummaryList != null) 'QueueSummaryList': queueSummaryList,
    };
  }
}

class ListQuickConnectsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the quick connects.
  final List<QuickConnectSummary>? quickConnectSummaryList;

  ListQuickConnectsResponse({
    this.nextToken,
    this.quickConnectSummaryList,
  });

  factory ListQuickConnectsResponse.fromJson(Map<String, dynamic> json) {
    return ListQuickConnectsResponse(
      nextToken: json['NextToken'] as String?,
      quickConnectSummaryList: (json['QuickConnectSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => QuickConnectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final quickConnectSummaryList = this.quickConnectSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (quickConnectSummaryList != null)
        'QuickConnectSummaryList': quickConnectSummaryList,
    };
  }
}

class ListRoutingProfileQueuesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the routing profiles.
  final List<RoutingProfileQueueConfigSummary>?
      routingProfileQueueConfigSummaryList;

  ListRoutingProfileQueuesResponse({
    this.nextToken,
    this.routingProfileQueueConfigSummaryList,
  });

  factory ListRoutingProfileQueuesResponse.fromJson(Map<String, dynamic> json) {
    return ListRoutingProfileQueuesResponse(
      nextToken: json['NextToken'] as String?,
      routingProfileQueueConfigSummaryList:
          (json['RoutingProfileQueueConfigSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) => RoutingProfileQueueConfigSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final routingProfileQueueConfigSummaryList =
        this.routingProfileQueueConfigSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (routingProfileQueueConfigSummaryList != null)
        'RoutingProfileQueueConfigSummaryList':
            routingProfileQueueConfigSummaryList,
    };
  }
}

class ListRoutingProfilesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the routing profiles.
  final List<RoutingProfileSummary>? routingProfileSummaryList;

  ListRoutingProfilesResponse({
    this.nextToken,
    this.routingProfileSummaryList,
  });

  factory ListRoutingProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListRoutingProfilesResponse(
      nextToken: json['NextToken'] as String?,
      routingProfileSummaryList: (json['RoutingProfileSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => RoutingProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final routingProfileSummaryList = this.routingProfileSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (routingProfileSummaryList != null)
        'RoutingProfileSummaryList': routingProfileSummaryList,
    };
  }
}

class ListSecurityKeysResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The security keys.
  final List<SecurityKey>? securityKeys;

  ListSecurityKeysResponse({
    this.nextToken,
    this.securityKeys,
  });

  factory ListSecurityKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityKeysResponse(
      nextToken: json['NextToken'] as String?,
      securityKeys: (json['SecurityKeys'] as List?)
          ?.whereNotNull()
          .map((e) => SecurityKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityKeys = this.securityKeys;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (securityKeys != null) 'SecurityKeys': securityKeys,
    };
  }
}

class ListSecurityProfilePermissionsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The permissions granted to the security profile.
  final List<String>? permissions;

  ListSecurityProfilePermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListSecurityProfilePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSecurityProfilePermissionsResponse(
      nextToken: json['NextToken'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (permissions != null) 'Permissions': permissions,
    };
  }
}

class ListSecurityProfilesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the security profiles.
  final List<SecurityProfileSummary>? securityProfileSummaryList;

  ListSecurityProfilesResponse({
    this.nextToken,
    this.securityProfileSummaryList,
  });

  factory ListSecurityProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityProfilesResponse(
      nextToken: json['NextToken'] as String?,
      securityProfileSummaryList: (json['SecurityProfileSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SecurityProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityProfileSummaryList = this.securityProfileSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (securityProfileSummaryList != null)
        'SecurityProfileSummaryList': securityProfileSummaryList,
    };
  }
}

class ListTagsForResourceResponse {
  /// Information about the tags.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTaskTemplatesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  /// <important>
  /// This is always returned as a null in the response.
  /// </important>
  final String? nextToken;

  /// Provides details about a list of task templates belonging to an instance.
  final List<TaskTemplateMetadata>? taskTemplates;

  ListTaskTemplatesResponse({
    this.nextToken,
    this.taskTemplates,
  });

  factory ListTaskTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListTaskTemplatesResponse(
      nextToken: json['NextToken'] as String?,
      taskTemplates: (json['TaskTemplates'] as List?)
          ?.whereNotNull()
          .map((e) => TaskTemplateMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskTemplates = this.taskTemplates;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskTemplates != null) 'TaskTemplates': taskTemplates,
    };
  }
}

class ListUseCasesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The use cases.
  final List<UseCase>? useCaseSummaryList;

  ListUseCasesResponse({
    this.nextToken,
    this.useCaseSummaryList,
  });

  factory ListUseCasesResponse.fromJson(Map<String, dynamic> json) {
    return ListUseCasesResponse(
      nextToken: json['NextToken'] as String?,
      useCaseSummaryList: (json['UseCaseSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => UseCase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final useCaseSummaryList = this.useCaseSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (useCaseSummaryList != null) 'UseCaseSummaryList': useCaseSummaryList,
    };
  }
}

class ListUserHierarchyGroupsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the hierarchy groups.
  final List<HierarchyGroupSummary>? userHierarchyGroupSummaryList;

  ListUserHierarchyGroupsResponse({
    this.nextToken,
    this.userHierarchyGroupSummaryList,
  });

  factory ListUserHierarchyGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListUserHierarchyGroupsResponse(
      nextToken: json['NextToken'] as String?,
      userHierarchyGroupSummaryList: (json['UserHierarchyGroupSummaryList']
              as List?)
          ?.whereNotNull()
          .map((e) => HierarchyGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userHierarchyGroupSummaryList = this.userHierarchyGroupSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (userHierarchyGroupSummaryList != null)
        'UserHierarchyGroupSummaryList': userHierarchyGroupSummaryList,
    };
  }
}

class ListUsersResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the users.
  final List<UserSummary>? userSummaryList;

  ListUsersResponse({
    this.nextToken,
    this.userSummaryList,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['NextToken'] as String?,
      userSummaryList: (json['UserSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => UserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final userSummaryList = this.userSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (userSummaryList != null) 'UserSummaryList': userSummaryList,
    };
  }
}

/// Contains information about which channels are supported, and how many
/// contacts an agent can have on a channel simultaneously.
class MediaConcurrency {
  /// The channels that agents can handle in the Contact Control Panel (CCP).
  final Channel channel;

  /// The number of contacts an agent can have on a channel simultaneously.
  ///
  /// Valid Range for <code>VOICE</code>: Minimum value of 1. Maximum value of 1.
  ///
  /// Valid Range for <code>CHAT</code>: Minimum value of 1. Maximum value of 10.
  ///
  /// Valid Range for <code>TASK</code>: Minimum value of 1. Maximum value of 10.
  final int concurrency;

  MediaConcurrency({
    required this.channel,
    required this.concurrency,
  });

  factory MediaConcurrency.fromJson(Map<String, dynamic> json) {
    return MediaConcurrency(
      channel: (json['Channel'] as String).toChannel(),
      concurrency: json['Concurrency'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final concurrency = this.concurrency;
    return {
      'Channel': channel.toValue(),
      'Concurrency': concurrency,
    };
  }
}

/// Information about a reference when the <code>referenceType</code> is
/// <code>NUMBER</code>. Otherwise, null.
class NumberReference {
  /// Identifier of the number reference.
  final String? name;

  /// A valid number.
  final String? value;

  NumberReference({
    this.name,
    this.value,
  });

  factory NumberReference.fromJson(Map<String, dynamic> json) {
    return NumberReference(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// The outbound caller ID name, number, and outbound whisper flow.
class OutboundCallerConfig {
  /// The caller ID name.
  final String? outboundCallerIdName;

  /// The caller ID number.
  final String? outboundCallerIdNumberId;

  /// The outbound whisper flow to be used during an outbound call.
  final String? outboundFlowId;

  OutboundCallerConfig({
    this.outboundCallerIdName,
    this.outboundCallerIdNumberId,
    this.outboundFlowId,
  });

  factory OutboundCallerConfig.fromJson(Map<String, dynamic> json) {
    return OutboundCallerConfig(
      outboundCallerIdName: json['OutboundCallerIdName'] as String?,
      outboundCallerIdNumberId: json['OutboundCallerIdNumberId'] as String?,
      outboundFlowId: json['OutboundFlowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outboundCallerIdName = this.outboundCallerIdName;
    final outboundCallerIdNumberId = this.outboundCallerIdNumberId;
    final outboundFlowId = this.outboundFlowId;
    return {
      if (outboundCallerIdName != null)
        'OutboundCallerIdName': outboundCallerIdName,
      if (outboundCallerIdNumberId != null)
        'OutboundCallerIdNumberId': outboundCallerIdNumberId,
      if (outboundFlowId != null) 'OutboundFlowId': outboundFlowId,
    };
  }
}

/// The customer's details.
class ParticipantDetails {
  /// Display name of the participant.
  final String displayName;

  ParticipantDetails({
    required this.displayName,
  });

  factory ParticipantDetails.fromJson(Map<String, dynamic> json) {
    return ParticipantDetails(
      displayName: json['DisplayName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    return {
      'DisplayName': displayName,
    };
  }
}

enum PhoneNumberCountryCode {
  af,
  al,
  dz,
  as,
  ad,
  ao,
  ai,
  aq,
  ag,
  ar,
  am,
  aw,
  au,
  at,
  az,
  bs,
  bh,
  bd,
  bb,
  by,
  be,
  bz,
  bj,
  bm,
  bt,
  bo,
  ba,
  bw,
  br,
  io,
  vg,
  bn,
  bg,
  bf,
  bi,
  kh,
  cm,
  ca,
  cv,
  ky,
  cf,
  td,
  cl,
  cn,
  cx,
  cc,
  co,
  km,
  ck,
  cr,
  hr,
  cu,
  cw,
  cy,
  cz,
  cd,
  dk,
  dj,
  dm,
  $do,
  tl,
  ec,
  eg,
  sv,
  gq,
  er,
  ee,
  et,
  fk,
  fo,
  fj,
  fi,
  fr,
  pf,
  ga,
  gm,
  ge,
  de,
  gh,
  gi,
  gr,
  gl,
  gd,
  gu,
  gt,
  gg,
  gn,
  gw,
  gy,
  ht,
  hn,
  hk,
  hu,
  $is,
  $in,
  id,
  ir,
  iq,
  ie,
  im,
  il,
  it,
  ci,
  jm,
  jp,
  je,
  jo,
  kz,
  ke,
  ki,
  kw,
  kg,
  la,
  lv,
  lb,
  ls,
  lr,
  ly,
  li,
  lt,
  lu,
  mo,
  mk,
  mg,
  mw,
  my,
  mv,
  ml,
  mt,
  mh,
  mr,
  mu,
  yt,
  mx,
  fm,
  md,
  mc,
  mn,
  me,
  ms,
  ma,
  mz,
  mm,
  na,
  nr,
  np,
  nl,
  an,
  nc,
  nz,
  ni,
  ne,
  ng,
  nu,
  kp,
  mp,
  no,
  om,
  pk,
  pw,
  pa,
  pg,
  py,
  pe,
  ph,
  pn,
  pl,
  pt,
  pr,
  qa,
  cg,
  re,
  ro,
  ru,
  rw,
  bl,
  sh,
  kn,
  lc,
  mf,
  pm,
  vc,
  ws,
  sm,
  st,
  sa,
  sn,
  rs,
  sc,
  sl,
  sg,
  sx,
  sk,
  si,
  sb,
  so,
  za,
  kr,
  es,
  lk,
  sd,
  sr,
  sj,
  sz,
  se,
  ch,
  sy,
  tw,
  tj,
  tz,
  th,
  tg,
  tk,
  to,
  tt,
  tn,
  tr,
  tm,
  tc,
  tv,
  vi,
  ug,
  ua,
  ae,
  gb,
  us,
  uy,
  uz,
  vu,
  va,
  ve,
  vn,
  wf,
  eh,
  ye,
  zm,
  zw,
}

extension on PhoneNumberCountryCode {
  String toValue() {
    switch (this) {
      case PhoneNumberCountryCode.af:
        return 'AF';
      case PhoneNumberCountryCode.al:
        return 'AL';
      case PhoneNumberCountryCode.dz:
        return 'DZ';
      case PhoneNumberCountryCode.as:
        return 'AS';
      case PhoneNumberCountryCode.ad:
        return 'AD';
      case PhoneNumberCountryCode.ao:
        return 'AO';
      case PhoneNumberCountryCode.ai:
        return 'AI';
      case PhoneNumberCountryCode.aq:
        return 'AQ';
      case PhoneNumberCountryCode.ag:
        return 'AG';
      case PhoneNumberCountryCode.ar:
        return 'AR';
      case PhoneNumberCountryCode.am:
        return 'AM';
      case PhoneNumberCountryCode.aw:
        return 'AW';
      case PhoneNumberCountryCode.au:
        return 'AU';
      case PhoneNumberCountryCode.at:
        return 'AT';
      case PhoneNumberCountryCode.az:
        return 'AZ';
      case PhoneNumberCountryCode.bs:
        return 'BS';
      case PhoneNumberCountryCode.bh:
        return 'BH';
      case PhoneNumberCountryCode.bd:
        return 'BD';
      case PhoneNumberCountryCode.bb:
        return 'BB';
      case PhoneNumberCountryCode.by:
        return 'BY';
      case PhoneNumberCountryCode.be:
        return 'BE';
      case PhoneNumberCountryCode.bz:
        return 'BZ';
      case PhoneNumberCountryCode.bj:
        return 'BJ';
      case PhoneNumberCountryCode.bm:
        return 'BM';
      case PhoneNumberCountryCode.bt:
        return 'BT';
      case PhoneNumberCountryCode.bo:
        return 'BO';
      case PhoneNumberCountryCode.ba:
        return 'BA';
      case PhoneNumberCountryCode.bw:
        return 'BW';
      case PhoneNumberCountryCode.br:
        return 'BR';
      case PhoneNumberCountryCode.io:
        return 'IO';
      case PhoneNumberCountryCode.vg:
        return 'VG';
      case PhoneNumberCountryCode.bn:
        return 'BN';
      case PhoneNumberCountryCode.bg:
        return 'BG';
      case PhoneNumberCountryCode.bf:
        return 'BF';
      case PhoneNumberCountryCode.bi:
        return 'BI';
      case PhoneNumberCountryCode.kh:
        return 'KH';
      case PhoneNumberCountryCode.cm:
        return 'CM';
      case PhoneNumberCountryCode.ca:
        return 'CA';
      case PhoneNumberCountryCode.cv:
        return 'CV';
      case PhoneNumberCountryCode.ky:
        return 'KY';
      case PhoneNumberCountryCode.cf:
        return 'CF';
      case PhoneNumberCountryCode.td:
        return 'TD';
      case PhoneNumberCountryCode.cl:
        return 'CL';
      case PhoneNumberCountryCode.cn:
        return 'CN';
      case PhoneNumberCountryCode.cx:
        return 'CX';
      case PhoneNumberCountryCode.cc:
        return 'CC';
      case PhoneNumberCountryCode.co:
        return 'CO';
      case PhoneNumberCountryCode.km:
        return 'KM';
      case PhoneNumberCountryCode.ck:
        return 'CK';
      case PhoneNumberCountryCode.cr:
        return 'CR';
      case PhoneNumberCountryCode.hr:
        return 'HR';
      case PhoneNumberCountryCode.cu:
        return 'CU';
      case PhoneNumberCountryCode.cw:
        return 'CW';
      case PhoneNumberCountryCode.cy:
        return 'CY';
      case PhoneNumberCountryCode.cz:
        return 'CZ';
      case PhoneNumberCountryCode.cd:
        return 'CD';
      case PhoneNumberCountryCode.dk:
        return 'DK';
      case PhoneNumberCountryCode.dj:
        return 'DJ';
      case PhoneNumberCountryCode.dm:
        return 'DM';
      case PhoneNumberCountryCode.$do:
        return 'DO';
      case PhoneNumberCountryCode.tl:
        return 'TL';
      case PhoneNumberCountryCode.ec:
        return 'EC';
      case PhoneNumberCountryCode.eg:
        return 'EG';
      case PhoneNumberCountryCode.sv:
        return 'SV';
      case PhoneNumberCountryCode.gq:
        return 'GQ';
      case PhoneNumberCountryCode.er:
        return 'ER';
      case PhoneNumberCountryCode.ee:
        return 'EE';
      case PhoneNumberCountryCode.et:
        return 'ET';
      case PhoneNumberCountryCode.fk:
        return 'FK';
      case PhoneNumberCountryCode.fo:
        return 'FO';
      case PhoneNumberCountryCode.fj:
        return 'FJ';
      case PhoneNumberCountryCode.fi:
        return 'FI';
      case PhoneNumberCountryCode.fr:
        return 'FR';
      case PhoneNumberCountryCode.pf:
        return 'PF';
      case PhoneNumberCountryCode.ga:
        return 'GA';
      case PhoneNumberCountryCode.gm:
        return 'GM';
      case PhoneNumberCountryCode.ge:
        return 'GE';
      case PhoneNumberCountryCode.de:
        return 'DE';
      case PhoneNumberCountryCode.gh:
        return 'GH';
      case PhoneNumberCountryCode.gi:
        return 'GI';
      case PhoneNumberCountryCode.gr:
        return 'GR';
      case PhoneNumberCountryCode.gl:
        return 'GL';
      case PhoneNumberCountryCode.gd:
        return 'GD';
      case PhoneNumberCountryCode.gu:
        return 'GU';
      case PhoneNumberCountryCode.gt:
        return 'GT';
      case PhoneNumberCountryCode.gg:
        return 'GG';
      case PhoneNumberCountryCode.gn:
        return 'GN';
      case PhoneNumberCountryCode.gw:
        return 'GW';
      case PhoneNumberCountryCode.gy:
        return 'GY';
      case PhoneNumberCountryCode.ht:
        return 'HT';
      case PhoneNumberCountryCode.hn:
        return 'HN';
      case PhoneNumberCountryCode.hk:
        return 'HK';
      case PhoneNumberCountryCode.hu:
        return 'HU';
      case PhoneNumberCountryCode.$is:
        return 'IS';
      case PhoneNumberCountryCode.$in:
        return 'IN';
      case PhoneNumberCountryCode.id:
        return 'ID';
      case PhoneNumberCountryCode.ir:
        return 'IR';
      case PhoneNumberCountryCode.iq:
        return 'IQ';
      case PhoneNumberCountryCode.ie:
        return 'IE';
      case PhoneNumberCountryCode.im:
        return 'IM';
      case PhoneNumberCountryCode.il:
        return 'IL';
      case PhoneNumberCountryCode.it:
        return 'IT';
      case PhoneNumberCountryCode.ci:
        return 'CI';
      case PhoneNumberCountryCode.jm:
        return 'JM';
      case PhoneNumberCountryCode.jp:
        return 'JP';
      case PhoneNumberCountryCode.je:
        return 'JE';
      case PhoneNumberCountryCode.jo:
        return 'JO';
      case PhoneNumberCountryCode.kz:
        return 'KZ';
      case PhoneNumberCountryCode.ke:
        return 'KE';
      case PhoneNumberCountryCode.ki:
        return 'KI';
      case PhoneNumberCountryCode.kw:
        return 'KW';
      case PhoneNumberCountryCode.kg:
        return 'KG';
      case PhoneNumberCountryCode.la:
        return 'LA';
      case PhoneNumberCountryCode.lv:
        return 'LV';
      case PhoneNumberCountryCode.lb:
        return 'LB';
      case PhoneNumberCountryCode.ls:
        return 'LS';
      case PhoneNumberCountryCode.lr:
        return 'LR';
      case PhoneNumberCountryCode.ly:
        return 'LY';
      case PhoneNumberCountryCode.li:
        return 'LI';
      case PhoneNumberCountryCode.lt:
        return 'LT';
      case PhoneNumberCountryCode.lu:
        return 'LU';
      case PhoneNumberCountryCode.mo:
        return 'MO';
      case PhoneNumberCountryCode.mk:
        return 'MK';
      case PhoneNumberCountryCode.mg:
        return 'MG';
      case PhoneNumberCountryCode.mw:
        return 'MW';
      case PhoneNumberCountryCode.my:
        return 'MY';
      case PhoneNumberCountryCode.mv:
        return 'MV';
      case PhoneNumberCountryCode.ml:
        return 'ML';
      case PhoneNumberCountryCode.mt:
        return 'MT';
      case PhoneNumberCountryCode.mh:
        return 'MH';
      case PhoneNumberCountryCode.mr:
        return 'MR';
      case PhoneNumberCountryCode.mu:
        return 'MU';
      case PhoneNumberCountryCode.yt:
        return 'YT';
      case PhoneNumberCountryCode.mx:
        return 'MX';
      case PhoneNumberCountryCode.fm:
        return 'FM';
      case PhoneNumberCountryCode.md:
        return 'MD';
      case PhoneNumberCountryCode.mc:
        return 'MC';
      case PhoneNumberCountryCode.mn:
        return 'MN';
      case PhoneNumberCountryCode.me:
        return 'ME';
      case PhoneNumberCountryCode.ms:
        return 'MS';
      case PhoneNumberCountryCode.ma:
        return 'MA';
      case PhoneNumberCountryCode.mz:
        return 'MZ';
      case PhoneNumberCountryCode.mm:
        return 'MM';
      case PhoneNumberCountryCode.na:
        return 'NA';
      case PhoneNumberCountryCode.nr:
        return 'NR';
      case PhoneNumberCountryCode.np:
        return 'NP';
      case PhoneNumberCountryCode.nl:
        return 'NL';
      case PhoneNumberCountryCode.an:
        return 'AN';
      case PhoneNumberCountryCode.nc:
        return 'NC';
      case PhoneNumberCountryCode.nz:
        return 'NZ';
      case PhoneNumberCountryCode.ni:
        return 'NI';
      case PhoneNumberCountryCode.ne:
        return 'NE';
      case PhoneNumberCountryCode.ng:
        return 'NG';
      case PhoneNumberCountryCode.nu:
        return 'NU';
      case PhoneNumberCountryCode.kp:
        return 'KP';
      case PhoneNumberCountryCode.mp:
        return 'MP';
      case PhoneNumberCountryCode.no:
        return 'NO';
      case PhoneNumberCountryCode.om:
        return 'OM';
      case PhoneNumberCountryCode.pk:
        return 'PK';
      case PhoneNumberCountryCode.pw:
        return 'PW';
      case PhoneNumberCountryCode.pa:
        return 'PA';
      case PhoneNumberCountryCode.pg:
        return 'PG';
      case PhoneNumberCountryCode.py:
        return 'PY';
      case PhoneNumberCountryCode.pe:
        return 'PE';
      case PhoneNumberCountryCode.ph:
        return 'PH';
      case PhoneNumberCountryCode.pn:
        return 'PN';
      case PhoneNumberCountryCode.pl:
        return 'PL';
      case PhoneNumberCountryCode.pt:
        return 'PT';
      case PhoneNumberCountryCode.pr:
        return 'PR';
      case PhoneNumberCountryCode.qa:
        return 'QA';
      case PhoneNumberCountryCode.cg:
        return 'CG';
      case PhoneNumberCountryCode.re:
        return 'RE';
      case PhoneNumberCountryCode.ro:
        return 'RO';
      case PhoneNumberCountryCode.ru:
        return 'RU';
      case PhoneNumberCountryCode.rw:
        return 'RW';
      case PhoneNumberCountryCode.bl:
        return 'BL';
      case PhoneNumberCountryCode.sh:
        return 'SH';
      case PhoneNumberCountryCode.kn:
        return 'KN';
      case PhoneNumberCountryCode.lc:
        return 'LC';
      case PhoneNumberCountryCode.mf:
        return 'MF';
      case PhoneNumberCountryCode.pm:
        return 'PM';
      case PhoneNumberCountryCode.vc:
        return 'VC';
      case PhoneNumberCountryCode.ws:
        return 'WS';
      case PhoneNumberCountryCode.sm:
        return 'SM';
      case PhoneNumberCountryCode.st:
        return 'ST';
      case PhoneNumberCountryCode.sa:
        return 'SA';
      case PhoneNumberCountryCode.sn:
        return 'SN';
      case PhoneNumberCountryCode.rs:
        return 'RS';
      case PhoneNumberCountryCode.sc:
        return 'SC';
      case PhoneNumberCountryCode.sl:
        return 'SL';
      case PhoneNumberCountryCode.sg:
        return 'SG';
      case PhoneNumberCountryCode.sx:
        return 'SX';
      case PhoneNumberCountryCode.sk:
        return 'SK';
      case PhoneNumberCountryCode.si:
        return 'SI';
      case PhoneNumberCountryCode.sb:
        return 'SB';
      case PhoneNumberCountryCode.so:
        return 'SO';
      case PhoneNumberCountryCode.za:
        return 'ZA';
      case PhoneNumberCountryCode.kr:
        return 'KR';
      case PhoneNumberCountryCode.es:
        return 'ES';
      case PhoneNumberCountryCode.lk:
        return 'LK';
      case PhoneNumberCountryCode.sd:
        return 'SD';
      case PhoneNumberCountryCode.sr:
        return 'SR';
      case PhoneNumberCountryCode.sj:
        return 'SJ';
      case PhoneNumberCountryCode.sz:
        return 'SZ';
      case PhoneNumberCountryCode.se:
        return 'SE';
      case PhoneNumberCountryCode.ch:
        return 'CH';
      case PhoneNumberCountryCode.sy:
        return 'SY';
      case PhoneNumberCountryCode.tw:
        return 'TW';
      case PhoneNumberCountryCode.tj:
        return 'TJ';
      case PhoneNumberCountryCode.tz:
        return 'TZ';
      case PhoneNumberCountryCode.th:
        return 'TH';
      case PhoneNumberCountryCode.tg:
        return 'TG';
      case PhoneNumberCountryCode.tk:
        return 'TK';
      case PhoneNumberCountryCode.to:
        return 'TO';
      case PhoneNumberCountryCode.tt:
        return 'TT';
      case PhoneNumberCountryCode.tn:
        return 'TN';
      case PhoneNumberCountryCode.tr:
        return 'TR';
      case PhoneNumberCountryCode.tm:
        return 'TM';
      case PhoneNumberCountryCode.tc:
        return 'TC';
      case PhoneNumberCountryCode.tv:
        return 'TV';
      case PhoneNumberCountryCode.vi:
        return 'VI';
      case PhoneNumberCountryCode.ug:
        return 'UG';
      case PhoneNumberCountryCode.ua:
        return 'UA';
      case PhoneNumberCountryCode.ae:
        return 'AE';
      case PhoneNumberCountryCode.gb:
        return 'GB';
      case PhoneNumberCountryCode.us:
        return 'US';
      case PhoneNumberCountryCode.uy:
        return 'UY';
      case PhoneNumberCountryCode.uz:
        return 'UZ';
      case PhoneNumberCountryCode.vu:
        return 'VU';
      case PhoneNumberCountryCode.va:
        return 'VA';
      case PhoneNumberCountryCode.ve:
        return 'VE';
      case PhoneNumberCountryCode.vn:
        return 'VN';
      case PhoneNumberCountryCode.wf:
        return 'WF';
      case PhoneNumberCountryCode.eh:
        return 'EH';
      case PhoneNumberCountryCode.ye:
        return 'YE';
      case PhoneNumberCountryCode.zm:
        return 'ZM';
      case PhoneNumberCountryCode.zw:
        return 'ZW';
    }
  }
}

extension on String {
  PhoneNumberCountryCode toPhoneNumberCountryCode() {
    switch (this) {
      case 'AF':
        return PhoneNumberCountryCode.af;
      case 'AL':
        return PhoneNumberCountryCode.al;
      case 'DZ':
        return PhoneNumberCountryCode.dz;
      case 'AS':
        return PhoneNumberCountryCode.as;
      case 'AD':
        return PhoneNumberCountryCode.ad;
      case 'AO':
        return PhoneNumberCountryCode.ao;
      case 'AI':
        return PhoneNumberCountryCode.ai;
      case 'AQ':
        return PhoneNumberCountryCode.aq;
      case 'AG':
        return PhoneNumberCountryCode.ag;
      case 'AR':
        return PhoneNumberCountryCode.ar;
      case 'AM':
        return PhoneNumberCountryCode.am;
      case 'AW':
        return PhoneNumberCountryCode.aw;
      case 'AU':
        return PhoneNumberCountryCode.au;
      case 'AT':
        return PhoneNumberCountryCode.at;
      case 'AZ':
        return PhoneNumberCountryCode.az;
      case 'BS':
        return PhoneNumberCountryCode.bs;
      case 'BH':
        return PhoneNumberCountryCode.bh;
      case 'BD':
        return PhoneNumberCountryCode.bd;
      case 'BB':
        return PhoneNumberCountryCode.bb;
      case 'BY':
        return PhoneNumberCountryCode.by;
      case 'BE':
        return PhoneNumberCountryCode.be;
      case 'BZ':
        return PhoneNumberCountryCode.bz;
      case 'BJ':
        return PhoneNumberCountryCode.bj;
      case 'BM':
        return PhoneNumberCountryCode.bm;
      case 'BT':
        return PhoneNumberCountryCode.bt;
      case 'BO':
        return PhoneNumberCountryCode.bo;
      case 'BA':
        return PhoneNumberCountryCode.ba;
      case 'BW':
        return PhoneNumberCountryCode.bw;
      case 'BR':
        return PhoneNumberCountryCode.br;
      case 'IO':
        return PhoneNumberCountryCode.io;
      case 'VG':
        return PhoneNumberCountryCode.vg;
      case 'BN':
        return PhoneNumberCountryCode.bn;
      case 'BG':
        return PhoneNumberCountryCode.bg;
      case 'BF':
        return PhoneNumberCountryCode.bf;
      case 'BI':
        return PhoneNumberCountryCode.bi;
      case 'KH':
        return PhoneNumberCountryCode.kh;
      case 'CM':
        return PhoneNumberCountryCode.cm;
      case 'CA':
        return PhoneNumberCountryCode.ca;
      case 'CV':
        return PhoneNumberCountryCode.cv;
      case 'KY':
        return PhoneNumberCountryCode.ky;
      case 'CF':
        return PhoneNumberCountryCode.cf;
      case 'TD':
        return PhoneNumberCountryCode.td;
      case 'CL':
        return PhoneNumberCountryCode.cl;
      case 'CN':
        return PhoneNumberCountryCode.cn;
      case 'CX':
        return PhoneNumberCountryCode.cx;
      case 'CC':
        return PhoneNumberCountryCode.cc;
      case 'CO':
        return PhoneNumberCountryCode.co;
      case 'KM':
        return PhoneNumberCountryCode.km;
      case 'CK':
        return PhoneNumberCountryCode.ck;
      case 'CR':
        return PhoneNumberCountryCode.cr;
      case 'HR':
        return PhoneNumberCountryCode.hr;
      case 'CU':
        return PhoneNumberCountryCode.cu;
      case 'CW':
        return PhoneNumberCountryCode.cw;
      case 'CY':
        return PhoneNumberCountryCode.cy;
      case 'CZ':
        return PhoneNumberCountryCode.cz;
      case 'CD':
        return PhoneNumberCountryCode.cd;
      case 'DK':
        return PhoneNumberCountryCode.dk;
      case 'DJ':
        return PhoneNumberCountryCode.dj;
      case 'DM':
        return PhoneNumberCountryCode.dm;
      case 'DO':
        return PhoneNumberCountryCode.$do;
      case 'TL':
        return PhoneNumberCountryCode.tl;
      case 'EC':
        return PhoneNumberCountryCode.ec;
      case 'EG':
        return PhoneNumberCountryCode.eg;
      case 'SV':
        return PhoneNumberCountryCode.sv;
      case 'GQ':
        return PhoneNumberCountryCode.gq;
      case 'ER':
        return PhoneNumberCountryCode.er;
      case 'EE':
        return PhoneNumberCountryCode.ee;
      case 'ET':
        return PhoneNumberCountryCode.et;
      case 'FK':
        return PhoneNumberCountryCode.fk;
      case 'FO':
        return PhoneNumberCountryCode.fo;
      case 'FJ':
        return PhoneNumberCountryCode.fj;
      case 'FI':
        return PhoneNumberCountryCode.fi;
      case 'FR':
        return PhoneNumberCountryCode.fr;
      case 'PF':
        return PhoneNumberCountryCode.pf;
      case 'GA':
        return PhoneNumberCountryCode.ga;
      case 'GM':
        return PhoneNumberCountryCode.gm;
      case 'GE':
        return PhoneNumberCountryCode.ge;
      case 'DE':
        return PhoneNumberCountryCode.de;
      case 'GH':
        return PhoneNumberCountryCode.gh;
      case 'GI':
        return PhoneNumberCountryCode.gi;
      case 'GR':
        return PhoneNumberCountryCode.gr;
      case 'GL':
        return PhoneNumberCountryCode.gl;
      case 'GD':
        return PhoneNumberCountryCode.gd;
      case 'GU':
        return PhoneNumberCountryCode.gu;
      case 'GT':
        return PhoneNumberCountryCode.gt;
      case 'GG':
        return PhoneNumberCountryCode.gg;
      case 'GN':
        return PhoneNumberCountryCode.gn;
      case 'GW':
        return PhoneNumberCountryCode.gw;
      case 'GY':
        return PhoneNumberCountryCode.gy;
      case 'HT':
        return PhoneNumberCountryCode.ht;
      case 'HN':
        return PhoneNumberCountryCode.hn;
      case 'HK':
        return PhoneNumberCountryCode.hk;
      case 'HU':
        return PhoneNumberCountryCode.hu;
      case 'IS':
        return PhoneNumberCountryCode.$is;
      case 'IN':
        return PhoneNumberCountryCode.$in;
      case 'ID':
        return PhoneNumberCountryCode.id;
      case 'IR':
        return PhoneNumberCountryCode.ir;
      case 'IQ':
        return PhoneNumberCountryCode.iq;
      case 'IE':
        return PhoneNumberCountryCode.ie;
      case 'IM':
        return PhoneNumberCountryCode.im;
      case 'IL':
        return PhoneNumberCountryCode.il;
      case 'IT':
        return PhoneNumberCountryCode.it;
      case 'CI':
        return PhoneNumberCountryCode.ci;
      case 'JM':
        return PhoneNumberCountryCode.jm;
      case 'JP':
        return PhoneNumberCountryCode.jp;
      case 'JE':
        return PhoneNumberCountryCode.je;
      case 'JO':
        return PhoneNumberCountryCode.jo;
      case 'KZ':
        return PhoneNumberCountryCode.kz;
      case 'KE':
        return PhoneNumberCountryCode.ke;
      case 'KI':
        return PhoneNumberCountryCode.ki;
      case 'KW':
        return PhoneNumberCountryCode.kw;
      case 'KG':
        return PhoneNumberCountryCode.kg;
      case 'LA':
        return PhoneNumberCountryCode.la;
      case 'LV':
        return PhoneNumberCountryCode.lv;
      case 'LB':
        return PhoneNumberCountryCode.lb;
      case 'LS':
        return PhoneNumberCountryCode.ls;
      case 'LR':
        return PhoneNumberCountryCode.lr;
      case 'LY':
        return PhoneNumberCountryCode.ly;
      case 'LI':
        return PhoneNumberCountryCode.li;
      case 'LT':
        return PhoneNumberCountryCode.lt;
      case 'LU':
        return PhoneNumberCountryCode.lu;
      case 'MO':
        return PhoneNumberCountryCode.mo;
      case 'MK':
        return PhoneNumberCountryCode.mk;
      case 'MG':
        return PhoneNumberCountryCode.mg;
      case 'MW':
        return PhoneNumberCountryCode.mw;
      case 'MY':
        return PhoneNumberCountryCode.my;
      case 'MV':
        return PhoneNumberCountryCode.mv;
      case 'ML':
        return PhoneNumberCountryCode.ml;
      case 'MT':
        return PhoneNumberCountryCode.mt;
      case 'MH':
        return PhoneNumberCountryCode.mh;
      case 'MR':
        return PhoneNumberCountryCode.mr;
      case 'MU':
        return PhoneNumberCountryCode.mu;
      case 'YT':
        return PhoneNumberCountryCode.yt;
      case 'MX':
        return PhoneNumberCountryCode.mx;
      case 'FM':
        return PhoneNumberCountryCode.fm;
      case 'MD':
        return PhoneNumberCountryCode.md;
      case 'MC':
        return PhoneNumberCountryCode.mc;
      case 'MN':
        return PhoneNumberCountryCode.mn;
      case 'ME':
        return PhoneNumberCountryCode.me;
      case 'MS':
        return PhoneNumberCountryCode.ms;
      case 'MA':
        return PhoneNumberCountryCode.ma;
      case 'MZ':
        return PhoneNumberCountryCode.mz;
      case 'MM':
        return PhoneNumberCountryCode.mm;
      case 'NA':
        return PhoneNumberCountryCode.na;
      case 'NR':
        return PhoneNumberCountryCode.nr;
      case 'NP':
        return PhoneNumberCountryCode.np;
      case 'NL':
        return PhoneNumberCountryCode.nl;
      case 'AN':
        return PhoneNumberCountryCode.an;
      case 'NC':
        return PhoneNumberCountryCode.nc;
      case 'NZ':
        return PhoneNumberCountryCode.nz;
      case 'NI':
        return PhoneNumberCountryCode.ni;
      case 'NE':
        return PhoneNumberCountryCode.ne;
      case 'NG':
        return PhoneNumberCountryCode.ng;
      case 'NU':
        return PhoneNumberCountryCode.nu;
      case 'KP':
        return PhoneNumberCountryCode.kp;
      case 'MP':
        return PhoneNumberCountryCode.mp;
      case 'NO':
        return PhoneNumberCountryCode.no;
      case 'OM':
        return PhoneNumberCountryCode.om;
      case 'PK':
        return PhoneNumberCountryCode.pk;
      case 'PW':
        return PhoneNumberCountryCode.pw;
      case 'PA':
        return PhoneNumberCountryCode.pa;
      case 'PG':
        return PhoneNumberCountryCode.pg;
      case 'PY':
        return PhoneNumberCountryCode.py;
      case 'PE':
        return PhoneNumberCountryCode.pe;
      case 'PH':
        return PhoneNumberCountryCode.ph;
      case 'PN':
        return PhoneNumberCountryCode.pn;
      case 'PL':
        return PhoneNumberCountryCode.pl;
      case 'PT':
        return PhoneNumberCountryCode.pt;
      case 'PR':
        return PhoneNumberCountryCode.pr;
      case 'QA':
        return PhoneNumberCountryCode.qa;
      case 'CG':
        return PhoneNumberCountryCode.cg;
      case 'RE':
        return PhoneNumberCountryCode.re;
      case 'RO':
        return PhoneNumberCountryCode.ro;
      case 'RU':
        return PhoneNumberCountryCode.ru;
      case 'RW':
        return PhoneNumberCountryCode.rw;
      case 'BL':
        return PhoneNumberCountryCode.bl;
      case 'SH':
        return PhoneNumberCountryCode.sh;
      case 'KN':
        return PhoneNumberCountryCode.kn;
      case 'LC':
        return PhoneNumberCountryCode.lc;
      case 'MF':
        return PhoneNumberCountryCode.mf;
      case 'PM':
        return PhoneNumberCountryCode.pm;
      case 'VC':
        return PhoneNumberCountryCode.vc;
      case 'WS':
        return PhoneNumberCountryCode.ws;
      case 'SM':
        return PhoneNumberCountryCode.sm;
      case 'ST':
        return PhoneNumberCountryCode.st;
      case 'SA':
        return PhoneNumberCountryCode.sa;
      case 'SN':
        return PhoneNumberCountryCode.sn;
      case 'RS':
        return PhoneNumberCountryCode.rs;
      case 'SC':
        return PhoneNumberCountryCode.sc;
      case 'SL':
        return PhoneNumberCountryCode.sl;
      case 'SG':
        return PhoneNumberCountryCode.sg;
      case 'SX':
        return PhoneNumberCountryCode.sx;
      case 'SK':
        return PhoneNumberCountryCode.sk;
      case 'SI':
        return PhoneNumberCountryCode.si;
      case 'SB':
        return PhoneNumberCountryCode.sb;
      case 'SO':
        return PhoneNumberCountryCode.so;
      case 'ZA':
        return PhoneNumberCountryCode.za;
      case 'KR':
        return PhoneNumberCountryCode.kr;
      case 'ES':
        return PhoneNumberCountryCode.es;
      case 'LK':
        return PhoneNumberCountryCode.lk;
      case 'SD':
        return PhoneNumberCountryCode.sd;
      case 'SR':
        return PhoneNumberCountryCode.sr;
      case 'SJ':
        return PhoneNumberCountryCode.sj;
      case 'SZ':
        return PhoneNumberCountryCode.sz;
      case 'SE':
        return PhoneNumberCountryCode.se;
      case 'CH':
        return PhoneNumberCountryCode.ch;
      case 'SY':
        return PhoneNumberCountryCode.sy;
      case 'TW':
        return PhoneNumberCountryCode.tw;
      case 'TJ':
        return PhoneNumberCountryCode.tj;
      case 'TZ':
        return PhoneNumberCountryCode.tz;
      case 'TH':
        return PhoneNumberCountryCode.th;
      case 'TG':
        return PhoneNumberCountryCode.tg;
      case 'TK':
        return PhoneNumberCountryCode.tk;
      case 'TO':
        return PhoneNumberCountryCode.to;
      case 'TT':
        return PhoneNumberCountryCode.tt;
      case 'TN':
        return PhoneNumberCountryCode.tn;
      case 'TR':
        return PhoneNumberCountryCode.tr;
      case 'TM':
        return PhoneNumberCountryCode.tm;
      case 'TC':
        return PhoneNumberCountryCode.tc;
      case 'TV':
        return PhoneNumberCountryCode.tv;
      case 'VI':
        return PhoneNumberCountryCode.vi;
      case 'UG':
        return PhoneNumberCountryCode.ug;
      case 'UA':
        return PhoneNumberCountryCode.ua;
      case 'AE':
        return PhoneNumberCountryCode.ae;
      case 'GB':
        return PhoneNumberCountryCode.gb;
      case 'US':
        return PhoneNumberCountryCode.us;
      case 'UY':
        return PhoneNumberCountryCode.uy;
      case 'UZ':
        return PhoneNumberCountryCode.uz;
      case 'VU':
        return PhoneNumberCountryCode.vu;
      case 'VA':
        return PhoneNumberCountryCode.va;
      case 'VE':
        return PhoneNumberCountryCode.ve;
      case 'VN':
        return PhoneNumberCountryCode.vn;
      case 'WF':
        return PhoneNumberCountryCode.wf;
      case 'EH':
        return PhoneNumberCountryCode.eh;
      case 'YE':
        return PhoneNumberCountryCode.ye;
      case 'ZM':
        return PhoneNumberCountryCode.zm;
      case 'ZW':
        return PhoneNumberCountryCode.zw;
    }
    throw Exception('$this is not known in enum PhoneNumberCountryCode');
  }
}

/// Contains information about a phone number for a quick connect.
class PhoneNumberQuickConnectConfig {
  /// The phone number in E.164 format.
  final String phoneNumber;

  PhoneNumberQuickConnectConfig({
    required this.phoneNumber,
  });

  factory PhoneNumberQuickConnectConfig.fromJson(Map<String, dynamic> json) {
    return PhoneNumberQuickConnectConfig(
      phoneNumber: json['PhoneNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      'PhoneNumber': phoneNumber,
    };
  }
}

/// The status of the phone number.
class PhoneNumberStatus {
  /// The status message.
  final String? message;

  /// The status.
  final PhoneNumberWorkflowStatus? status;

  PhoneNumberStatus({
    this.message,
    this.status,
  });

  factory PhoneNumberStatus.fromJson(Map<String, dynamic> json) {
    return PhoneNumberStatus(
      message: json['Message'] as String?,
      status: (json['Status'] as String?)?.toPhoneNumberWorkflowStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final status = this.status;
    return {
      if (message != null) 'Message': message,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Contains summary information about a phone number for a contact center.
class PhoneNumberSummary {
  /// The Amazon Resource Name (ARN) of the phone number.
  final String? arn;

  /// The identifier of the phone number.
  final String? id;

  /// The phone number.
  final String? phoneNumber;

  /// The ISO country code.
  final PhoneNumberCountryCode? phoneNumberCountryCode;

  /// The type of phone number.
  final PhoneNumberType? phoneNumberType;

  PhoneNumberSummary({
    this.arn,
    this.id,
    this.phoneNumber,
    this.phoneNumberCountryCode,
    this.phoneNumberType,
  });

  factory PhoneNumberSummary.fromJson(Map<String, dynamic> json) {
    return PhoneNumberSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberCountryCode: (json['PhoneNumberCountryCode'] as String?)
          ?.toPhoneNumberCountryCode(),
      phoneNumberType:
          (json['PhoneNumberType'] as String?)?.toPhoneNumberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final phoneNumber = this.phoneNumber;
    final phoneNumberCountryCode = this.phoneNumberCountryCode;
    final phoneNumberType = this.phoneNumberType;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberCountryCode != null)
        'PhoneNumberCountryCode': phoneNumberCountryCode.toValue(),
      if (phoneNumberType != null) 'PhoneNumberType': phoneNumberType.toValue(),
    };
  }
}

enum PhoneNumberType {
  tollFree,
  did,
}

extension on PhoneNumberType {
  String toValue() {
    switch (this) {
      case PhoneNumberType.tollFree:
        return 'TOLL_FREE';
      case PhoneNumberType.did:
        return 'DID';
    }
  }
}

extension on String {
  PhoneNumberType toPhoneNumberType() {
    switch (this) {
      case 'TOLL_FREE':
        return PhoneNumberType.tollFree;
      case 'DID':
        return PhoneNumberType.did;
    }
    throw Exception('$this is not known in enum PhoneNumberType');
  }
}

enum PhoneNumberWorkflowStatus {
  claimed,
  inProgress,
  failed,
}

extension on PhoneNumberWorkflowStatus {
  String toValue() {
    switch (this) {
      case PhoneNumberWorkflowStatus.claimed:
        return 'CLAIMED';
      case PhoneNumberWorkflowStatus.inProgress:
        return 'IN_PROGRESS';
      case PhoneNumberWorkflowStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  PhoneNumberWorkflowStatus toPhoneNumberWorkflowStatus() {
    switch (this) {
      case 'CLAIMED':
        return PhoneNumberWorkflowStatus.claimed;
      case 'IN_PROGRESS':
        return PhoneNumberWorkflowStatus.inProgress;
      case 'FAILED':
        return PhoneNumberWorkflowStatus.failed;
    }
    throw Exception('$this is not known in enum PhoneNumberWorkflowStatus');
  }
}

enum PhoneType {
  softPhone,
  deskPhone,
}

extension on PhoneType {
  String toValue() {
    switch (this) {
      case PhoneType.softPhone:
        return 'SOFT_PHONE';
      case PhoneType.deskPhone:
        return 'DESK_PHONE';
    }
  }
}

extension on String {
  PhoneType toPhoneType() {
    switch (this) {
      case 'SOFT_PHONE':
        return PhoneType.softPhone;
      case 'DESK_PHONE':
        return PhoneType.deskPhone;
    }
    throw Exception('$this is not known in enum PhoneType');
  }
}

/// Contains information about the prompt.
class PromptSummary {
  /// The Amazon Resource Name (ARN) of the prompt.
  final String? arn;

  /// The identifier of the prompt.
  final String? id;

  /// The name of the prompt.
  final String? name;

  PromptSummary({
    this.arn,
    this.id,
    this.name,
  });

  factory PromptSummary.fromJson(Map<String, dynamic> json) {
    return PromptSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

class PutUserStatusResponse {
  PutUserStatusResponse();

  factory PutUserStatusResponse.fromJson(Map<String, dynamic> _) {
    return PutUserStatusResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about a queue.
class Queue {
  /// The description of the queue.
  final String? description;

  /// The identifier for the hours of operation.
  final String? hoursOfOperationId;

  /// The maximum number of contacts that can be in the queue before it is
  /// considered full.
  final int? maxContacts;

  /// The name of the queue.
  final String? name;

  /// The outbound caller ID name, number, and outbound whisper flow.
  final OutboundCallerConfig? outboundCallerConfig;

  /// The Amazon Resource Name (ARN) for the queue.
  final String? queueArn;

  /// The identifier for the queue.
  final String? queueId;

  /// The status of the queue.
  final QueueStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  Queue({
    this.description,
    this.hoursOfOperationId,
    this.maxContacts,
    this.name,
    this.outboundCallerConfig,
    this.queueArn,
    this.queueId,
    this.status,
    this.tags,
  });

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      description: json['Description'] as String?,
      hoursOfOperationId: json['HoursOfOperationId'] as String?,
      maxContacts: json['MaxContacts'] as int?,
      name: json['Name'] as String?,
      outboundCallerConfig: json['OutboundCallerConfig'] != null
          ? OutboundCallerConfig.fromJson(
              json['OutboundCallerConfig'] as Map<String, dynamic>)
          : null,
      queueArn: json['QueueArn'] as String?,
      queueId: json['QueueId'] as String?,
      status: (json['Status'] as String?)?.toQueueStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final hoursOfOperationId = this.hoursOfOperationId;
    final maxContacts = this.maxContacts;
    final name = this.name;
    final outboundCallerConfig = this.outboundCallerConfig;
    final queueArn = this.queueArn;
    final queueId = this.queueId;
    final status = this.status;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (hoursOfOperationId != null) 'HoursOfOperationId': hoursOfOperationId,
      if (maxContacts != null) 'MaxContacts': maxContacts,
      if (name != null) 'Name': name,
      if (outboundCallerConfig != null)
        'OutboundCallerConfig': outboundCallerConfig,
      if (queueArn != null) 'QueueArn': queueArn,
      if (queueId != null) 'QueueId': queueId,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// If this contact was queued, this contains information about the queue.
class QueueInfo {
  /// The timestamp when the contact was added to the queue.
  final DateTime? enqueueTimestamp;

  /// The identifier of the agent who accepted the contact.
  final String? id;

  QueueInfo({
    this.enqueueTimestamp,
    this.id,
  });

  factory QueueInfo.fromJson(Map<String, dynamic> json) {
    return QueueInfo(
      enqueueTimestamp: timeStampFromJson(json['EnqueueTimestamp']),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enqueueTimestamp = this.enqueueTimestamp;
    final id = this.id;
    return {
      if (enqueueTimestamp != null)
        'EnqueueTimestamp': unixTimestampToJson(enqueueTimestamp),
      if (id != null) 'Id': id,
    };
  }
}

/// Contains information about a queue for a quick connect. The contact flow
/// must be of type Transfer to Queue.
class QueueQuickConnectConfig {
  /// The identifier of the contact flow.
  final String contactFlowId;

  /// The identifier for the queue.
  final String queueId;

  QueueQuickConnectConfig({
    required this.contactFlowId,
    required this.queueId,
  });

  factory QueueQuickConnectConfig.fromJson(Map<String, dynamic> json) {
    return QueueQuickConnectConfig(
      contactFlowId: json['ContactFlowId'] as String,
      queueId: json['QueueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlowId = this.contactFlowId;
    final queueId = this.queueId;
    return {
      'ContactFlowId': contactFlowId,
      'QueueId': queueId,
    };
  }
}

/// Contains information about a queue resource for which metrics are returned.
class QueueReference {
  /// The Amazon Resource Name (ARN) of the queue.
  final String? arn;

  /// The identifier of the queue.
  final String? id;

  QueueReference({
    this.arn,
    this.id,
  });

  factory QueueReference.fromJson(Map<String, dynamic> json) {
    return QueueReference(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

enum QueueStatus {
  enabled,
  disabled,
}

extension on QueueStatus {
  String toValue() {
    switch (this) {
      case QueueStatus.enabled:
        return 'ENABLED';
      case QueueStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  QueueStatus toQueueStatus() {
    switch (this) {
      case 'ENABLED':
        return QueueStatus.enabled;
      case 'DISABLED':
        return QueueStatus.disabled;
    }
    throw Exception('$this is not known in enum QueueStatus');
  }
}

/// Contains summary information about a queue.
class QueueSummary {
  /// The Amazon Resource Name (ARN) of the queue.
  final String? arn;

  /// The identifier of the queue.
  final String? id;

  /// The name of the queue.
  final String? name;

  /// The type of queue.
  final QueueType? queueType;

  QueueSummary({
    this.arn,
    this.id,
    this.name,
    this.queueType,
  });

  factory QueueSummary.fromJson(Map<String, dynamic> json) {
    return QueueSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      queueType: (json['QueueType'] as String?)?.toQueueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final queueType = this.queueType;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (queueType != null) 'QueueType': queueType.toValue(),
    };
  }
}

enum QueueType {
  standard,
  agent,
}

extension on QueueType {
  String toValue() {
    switch (this) {
      case QueueType.standard:
        return 'STANDARD';
      case QueueType.agent:
        return 'AGENT';
    }
  }
}

extension on String {
  QueueType toQueueType() {
    switch (this) {
      case 'STANDARD':
        return QueueType.standard;
      case 'AGENT':
        return QueueType.agent;
    }
    throw Exception('$this is not known in enum QueueType');
  }
}

/// Contains information about a quick connect.
class QuickConnect {
  /// The description.
  final String? description;

  /// The name of the quick connect.
  final String? name;

  /// The Amazon Resource Name (ARN) of the quick connect.
  final String? quickConnectARN;

  /// Contains information about the quick connect.
  final QuickConnectConfig? quickConnectConfig;

  /// The identifier for the quick connect.
  final String? quickConnectId;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  QuickConnect({
    this.description,
    this.name,
    this.quickConnectARN,
    this.quickConnectConfig,
    this.quickConnectId,
    this.tags,
  });

  factory QuickConnect.fromJson(Map<String, dynamic> json) {
    return QuickConnect(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      quickConnectARN: json['QuickConnectARN'] as String?,
      quickConnectConfig: json['QuickConnectConfig'] != null
          ? QuickConnectConfig.fromJson(
              json['QuickConnectConfig'] as Map<String, dynamic>)
          : null,
      quickConnectId: json['QuickConnectId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final quickConnectARN = this.quickConnectARN;
    final quickConnectConfig = this.quickConnectConfig;
    final quickConnectId = this.quickConnectId;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (quickConnectARN != null) 'QuickConnectARN': quickConnectARN,
      if (quickConnectConfig != null) 'QuickConnectConfig': quickConnectConfig,
      if (quickConnectId != null) 'QuickConnectId': quickConnectId,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains configuration settings for a quick connect.
class QuickConnectConfig {
  /// The type of quick connect. In the Amazon Connect console, when you create a
  /// quick connect, you are prompted to assign one of the following types: Agent
  /// (USER), External (PHONE_NUMBER), or Queue (QUEUE).
  final QuickConnectType quickConnectType;

  /// The phone configuration. This is required only if QuickConnectType is
  /// PHONE_NUMBER.
  final PhoneNumberQuickConnectConfig? phoneConfig;

  /// The queue configuration. This is required only if QuickConnectType is QUEUE.
  final QueueQuickConnectConfig? queueConfig;

  /// The user configuration. This is required only if QuickConnectType is USER.
  final UserQuickConnectConfig? userConfig;

  QuickConnectConfig({
    required this.quickConnectType,
    this.phoneConfig,
    this.queueConfig,
    this.userConfig,
  });

  factory QuickConnectConfig.fromJson(Map<String, dynamic> json) {
    return QuickConnectConfig(
      quickConnectType:
          (json['QuickConnectType'] as String).toQuickConnectType(),
      phoneConfig: json['PhoneConfig'] != null
          ? PhoneNumberQuickConnectConfig.fromJson(
              json['PhoneConfig'] as Map<String, dynamic>)
          : null,
      queueConfig: json['QueueConfig'] != null
          ? QueueQuickConnectConfig.fromJson(
              json['QueueConfig'] as Map<String, dynamic>)
          : null,
      userConfig: json['UserConfig'] != null
          ? UserQuickConnectConfig.fromJson(
              json['UserConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quickConnectType = this.quickConnectType;
    final phoneConfig = this.phoneConfig;
    final queueConfig = this.queueConfig;
    final userConfig = this.userConfig;
    return {
      'QuickConnectType': quickConnectType.toValue(),
      if (phoneConfig != null) 'PhoneConfig': phoneConfig,
      if (queueConfig != null) 'QueueConfig': queueConfig,
      if (userConfig != null) 'UserConfig': userConfig,
    };
  }
}

/// Contains summary information about a quick connect.
class QuickConnectSummary {
  /// The Amazon Resource Name (ARN) of the quick connect.
  final String? arn;

  /// The identifier for the quick connect.
  final String? id;

  /// The name of the quick connect.
  final String? name;

  /// The type of quick connect. In the Amazon Connect console, when you create a
  /// quick connect, you are prompted to assign one of the following types: Agent
  /// (USER), External (PHONE_NUMBER), or Queue (QUEUE).
  final QuickConnectType? quickConnectType;

  QuickConnectSummary({
    this.arn,
    this.id,
    this.name,
    this.quickConnectType,
  });

  factory QuickConnectSummary.fromJson(Map<String, dynamic> json) {
    return QuickConnectSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      quickConnectType:
          (json['QuickConnectType'] as String?)?.toQuickConnectType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final quickConnectType = this.quickConnectType;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (quickConnectType != null)
        'QuickConnectType': quickConnectType.toValue(),
    };
  }
}

enum QuickConnectType {
  user,
  queue,
  phoneNumber,
}

extension on QuickConnectType {
  String toValue() {
    switch (this) {
      case QuickConnectType.user:
        return 'USER';
      case QuickConnectType.queue:
        return 'QUEUE';
      case QuickConnectType.phoneNumber:
        return 'PHONE_NUMBER';
    }
  }
}

extension on String {
  QuickConnectType toQuickConnectType() {
    switch (this) {
      case 'USER':
        return QuickConnectType.user;
      case 'QUEUE':
        return QuickConnectType.queue;
      case 'PHONE_NUMBER':
        return QuickConnectType.phoneNumber;
    }
    throw Exception('$this is not known in enum QuickConnectType');
  }
}

/// Indicates a field that is read-only to an agent.
class ReadOnlyFieldInfo {
  /// Identifier of the read-only field.
  final TaskTemplateFieldIdentifier? id;

  ReadOnlyFieldInfo({
    this.id,
  });

  factory ReadOnlyFieldInfo.fromJson(Map<String, dynamic> json) {
    return ReadOnlyFieldInfo(
      id: json['Id'] != null
          ? TaskTemplateFieldIdentifier.fromJson(
              json['Id'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// Well-formed data on a contact, used by agents to complete a contact request.
/// You can have up to 4,096 UTF-8 bytes across all references for a contact.
class Reference {
  /// The type of the reference.
  final ReferenceType type;

  /// A valid value for the reference. For example, for a URL reference, a
  /// formatted URL that is displayed to an agent in the Contact Control Panel
  /// (CCP).
  final String value;

  Reference({
    required this.type,
    required this.value,
  });

  factory Reference.fromJson(Map<String, dynamic> json) {
    return Reference(
      type: (json['Type'] as String).toReferenceType(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum ReferenceStatus {
  approved,
  rejected,
}

extension on ReferenceStatus {
  String toValue() {
    switch (this) {
      case ReferenceStatus.approved:
        return 'APPROVED';
      case ReferenceStatus.rejected:
        return 'REJECTED';
    }
  }
}

extension on String {
  ReferenceStatus toReferenceStatus() {
    switch (this) {
      case 'APPROVED':
        return ReferenceStatus.approved;
      case 'REJECTED':
        return ReferenceStatus.rejected;
    }
    throw Exception('$this is not known in enum ReferenceStatus');
  }
}

/// Contains summary information about a reference.
/// <code>ReferenceSummary</code> contains only one non null field between the
/// URL and attachment based on the reference type.
class ReferenceSummary {
  /// Information about the reference when the <code>referenceType</code> is
  /// <code>ATTACHMENT</code>. Otherwise, null.
  final AttachmentReference? attachment;

  /// Information about a reference when the <code>referenceType</code> is
  /// <code>DATE</code>. Otherwise, null.
  final DateReference? date;

  /// Information about a reference when the <code>referenceType</code> is
  /// <code>EMAIL</code>. Otherwise, null.
  final EmailReference? email;

  /// Information about a reference when the <code>referenceType</code> is
  /// <code>NUMBER</code>. Otherwise, null.
  final NumberReference? number;

  /// Information about a reference when the <code>referenceType</code> is
  /// <code>STRING</code>. Otherwise, null.
  final StringReference? string;

  /// Information about the reference when the <code>referenceType</code> is
  /// <code>URL</code>. Otherwise, null.
  final UrlReference? url;

  ReferenceSummary({
    this.attachment,
    this.date,
    this.email,
    this.number,
    this.string,
    this.url,
  });

  factory ReferenceSummary.fromJson(Map<String, dynamic> json) {
    return ReferenceSummary(
      attachment: json['Attachment'] != null
          ? AttachmentReference.fromJson(
              json['Attachment'] as Map<String, dynamic>)
          : null,
      date: json['Date'] != null
          ? DateReference.fromJson(json['Date'] as Map<String, dynamic>)
          : null,
      email: json['Email'] != null
          ? EmailReference.fromJson(json['Email'] as Map<String, dynamic>)
          : null,
      number: json['Number'] != null
          ? NumberReference.fromJson(json['Number'] as Map<String, dynamic>)
          : null,
      string: json['String'] != null
          ? StringReference.fromJson(json['String'] as Map<String, dynamic>)
          : null,
      url: json['Url'] != null
          ? UrlReference.fromJson(json['Url'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final date = this.date;
    final email = this.email;
    final number = this.number;
    final string = this.string;
    final url = this.url;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (date != null) 'Date': date,
      if (email != null) 'Email': email,
      if (number != null) 'Number': number,
      if (string != null) 'String': string,
      if (url != null) 'Url': url,
    };
  }
}

enum ReferenceType {
  url,
  attachment,
  number,
  string,
  date,
  email,
}

extension on ReferenceType {
  String toValue() {
    switch (this) {
      case ReferenceType.url:
        return 'URL';
      case ReferenceType.attachment:
        return 'ATTACHMENT';
      case ReferenceType.number:
        return 'NUMBER';
      case ReferenceType.string:
        return 'STRING';
      case ReferenceType.date:
        return 'DATE';
      case ReferenceType.email:
        return 'EMAIL';
    }
  }
}

extension on String {
  ReferenceType toReferenceType() {
    switch (this) {
      case 'URL':
        return ReferenceType.url;
      case 'ATTACHMENT':
        return ReferenceType.attachment;
      case 'NUMBER':
        return ReferenceType.number;
      case 'STRING':
        return ReferenceType.string;
      case 'DATE':
        return ReferenceType.date;
      case 'EMAIL':
        return ReferenceType.email;
    }
    throw Exception('$this is not known in enum ReferenceType');
  }
}

/// Information about a required field.
class RequiredFieldInfo {
  /// The unique identifier for the field.
  final TaskTemplateFieldIdentifier? id;

  RequiredFieldInfo({
    this.id,
  });

  factory RequiredFieldInfo.fromJson(Map<String, dynamic> json) {
    return RequiredFieldInfo(
      id: json['Id'] != null
          ? TaskTemplateFieldIdentifier.fromJson(
              json['Id'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class ResumeContactRecordingResponse {
  ResumeContactRecordingResponse();

  factory ResumeContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return ResumeContactRecordingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about a routing profile.
class RoutingProfile {
  /// The identifier of the default outbound queue for this routing profile.
  final String? defaultOutboundQueueId;

  /// The description of the routing profile.
  final String? description;

  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String? instanceId;

  /// The channels agents can handle in the Contact Control Panel (CCP) for this
  /// routing profile.
  final List<MediaConcurrency>? mediaConcurrencies;

  /// The name of the routing profile.
  final String? name;

  /// The Amazon Resource Name (ARN) of the routing profile.
  final String? routingProfileArn;

  /// The identifier of the routing profile.
  final String? routingProfileId;

  /// One or more tags.
  final Map<String, String>? tags;

  RoutingProfile({
    this.defaultOutboundQueueId,
    this.description,
    this.instanceId,
    this.mediaConcurrencies,
    this.name,
    this.routingProfileArn,
    this.routingProfileId,
    this.tags,
  });

  factory RoutingProfile.fromJson(Map<String, dynamic> json) {
    return RoutingProfile(
      defaultOutboundQueueId: json['DefaultOutboundQueueId'] as String?,
      description: json['Description'] as String?,
      instanceId: json['InstanceId'] as String?,
      mediaConcurrencies: (json['MediaConcurrencies'] as List?)
          ?.whereNotNull()
          .map((e) => MediaConcurrency.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      routingProfileArn: json['RoutingProfileArn'] as String?,
      routingProfileId: json['RoutingProfileId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultOutboundQueueId = this.defaultOutboundQueueId;
    final description = this.description;
    final instanceId = this.instanceId;
    final mediaConcurrencies = this.mediaConcurrencies;
    final name = this.name;
    final routingProfileArn = this.routingProfileArn;
    final routingProfileId = this.routingProfileId;
    final tags = this.tags;
    return {
      if (defaultOutboundQueueId != null)
        'DefaultOutboundQueueId': defaultOutboundQueueId,
      if (description != null) 'Description': description,
      if (instanceId != null) 'InstanceId': instanceId,
      if (mediaConcurrencies != null) 'MediaConcurrencies': mediaConcurrencies,
      if (name != null) 'Name': name,
      if (routingProfileArn != null) 'RoutingProfileArn': routingProfileArn,
      if (routingProfileId != null) 'RoutingProfileId': routingProfileId,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about the queue and channel for which priority and
/// delay can be set.
class RoutingProfileQueueConfig {
  /// The delay, in seconds, a contact should be in the queue before they are
  /// routed to an available agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.
  final int delay;

  /// The order in which contacts are to be handled for the queue. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a>.
  final int priority;

  /// Contains information about a queue resource.
  final RoutingProfileQueueReference queueReference;

  RoutingProfileQueueConfig({
    required this.delay,
    required this.priority,
    required this.queueReference,
  });

  factory RoutingProfileQueueConfig.fromJson(Map<String, dynamic> json) {
    return RoutingProfileQueueConfig(
      delay: json['Delay'] as int,
      priority: json['Priority'] as int,
      queueReference: RoutingProfileQueueReference.fromJson(
          json['QueueReference'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final delay = this.delay;
    final priority = this.priority;
    final queueReference = this.queueReference;
    return {
      'Delay': delay,
      'Priority': priority,
      'QueueReference': queueReference,
    };
  }
}

/// Contains summary information about a routing profile queue.
class RoutingProfileQueueConfigSummary {
  /// The channels this queue supports.
  final Channel channel;

  /// The delay, in seconds, that a contact should be in the queue before they are
  /// routed to an available agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.
  final int delay;

  /// The order in which contacts are to be handled for the queue. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a>.
  final int priority;

  /// The Amazon Resource Name (ARN) of the queue.
  final String queueArn;

  /// The identifier for the queue.
  final String queueId;

  /// The name of the queue.
  final String queueName;

  RoutingProfileQueueConfigSummary({
    required this.channel,
    required this.delay,
    required this.priority,
    required this.queueArn,
    required this.queueId,
    required this.queueName,
  });

  factory RoutingProfileQueueConfigSummary.fromJson(Map<String, dynamic> json) {
    return RoutingProfileQueueConfigSummary(
      channel: (json['Channel'] as String).toChannel(),
      delay: json['Delay'] as int,
      priority: json['Priority'] as int,
      queueArn: json['QueueArn'] as String,
      queueId: json['QueueId'] as String,
      queueName: json['QueueName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final delay = this.delay;
    final priority = this.priority;
    final queueArn = this.queueArn;
    final queueId = this.queueId;
    final queueName = this.queueName;
    return {
      'Channel': channel.toValue(),
      'Delay': delay,
      'Priority': priority,
      'QueueArn': queueArn,
      'QueueId': queueId,
      'QueueName': queueName,
    };
  }
}

/// Contains the channel and queue identifier for a routing profile.
class RoutingProfileQueueReference {
  /// The channels agents can handle in the Contact Control Panel (CCP) for this
  /// routing profile.
  final Channel channel;

  /// The identifier for the queue.
  final String queueId;

  RoutingProfileQueueReference({
    required this.channel,
    required this.queueId,
  });

  factory RoutingProfileQueueReference.fromJson(Map<String, dynamic> json) {
    return RoutingProfileQueueReference(
      channel: (json['Channel'] as String).toChannel(),
      queueId: json['QueueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final queueId = this.queueId;
    return {
      'Channel': channel.toValue(),
      'QueueId': queueId,
    };
  }
}

/// Information about the routing profile assigned to the user.
class RoutingProfileReference {
  /// The Amazon Resource Name (ARN) of the routing profile.
  final String? arn;

  /// The identifier of the routing profile.
  final String? id;

  RoutingProfileReference({
    this.arn,
    this.id,
  });

  factory RoutingProfileReference.fromJson(Map<String, dynamic> json) {
    return RoutingProfileReference(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

/// Contains summary information about a routing profile.
class RoutingProfileSummary {
  /// The Amazon Resource Name (ARN) of the routing profile.
  final String? arn;

  /// The identifier of the routing profile.
  final String? id;

  /// The name of the routing profile.
  final String? name;

  RoutingProfileSummary({
    this.arn,
    this.id,
    this.name,
  });

  factory RoutingProfileSummary.fromJson(Map<String, dynamic> json) {
    return RoutingProfileSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

/// Information about the Amazon Simple Storage Service (Amazon S3) storage
/// type.
class S3Config {
  /// The S3 bucket name.
  final String bucketName;

  /// The S3 bucket prefix.
  final String bucketPrefix;

  /// The Amazon S3 encryption configuration.
  final EncryptionConfig? encryptionConfig;

  S3Config({
    required this.bucketName,
    required this.bucketPrefix,
    this.encryptionConfig,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      bucketName: json['BucketName'] as String,
      bucketPrefix: json['BucketPrefix'] as String,
      encryptionConfig: json['EncryptionConfig'] != null
          ? EncryptionConfig.fromJson(
              json['EncryptionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    final encryptionConfig = this.encryptionConfig;
    return {
      'BucketName': bucketName,
      'BucketPrefix': bucketPrefix,
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
    };
  }
}

class SearchAvailablePhoneNumbersResponse {
  /// A list of available phone numbers that you can claim for your Amazon Connect
  /// instance.
  final List<AvailableNumberSummary>? availableNumbersList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  SearchAvailablePhoneNumbersResponse({
    this.availableNumbersList,
    this.nextToken,
  });

  factory SearchAvailablePhoneNumbersResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchAvailablePhoneNumbersResponse(
      availableNumbersList: (json['AvailableNumbersList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AvailableNumberSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availableNumbersList = this.availableNumbersList;
    final nextToken = this.nextToken;
    return {
      if (availableNumbersList != null)
        'AvailableNumbersList': availableNumbersList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class SearchUsersResponse {
  /// The total number of users who matched your search query.
  final int? approximateTotalCount;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Information about the users.
  final List<UserSearchSummary>? users;

  SearchUsersResponse({
    this.approximateTotalCount,
    this.nextToken,
    this.users,
  });

  factory SearchUsersResponse.fromJson(Map<String, dynamic> json) {
    return SearchUsersResponse(
      approximateTotalCount: json['ApproximateTotalCount'] as int?,
      nextToken: json['NextToken'] as String?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => UserSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateTotalCount = this.approximateTotalCount;
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (approximateTotalCount != null)
        'ApproximateTotalCount': approximateTotalCount,
      if (nextToken != null) 'NextToken': nextToken,
      if (users != null) 'Users': users,
    };
  }
}

class SearchVocabulariesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The list of the available custom vocabularies.
  final List<VocabularySummary>? vocabularySummaryList;

  SearchVocabulariesResponse({
    this.nextToken,
    this.vocabularySummaryList,
  });

  factory SearchVocabulariesResponse.fromJson(Map<String, dynamic> json) {
    return SearchVocabulariesResponse(
      nextToken: json['NextToken'] as String?,
      vocabularySummaryList: (json['VocabularySummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => VocabularySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vocabularySummaryList = this.vocabularySummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (vocabularySummaryList != null)
        'VocabularySummaryList': vocabularySummaryList,
    };
  }
}

/// Configuration information of the security key.
class SecurityKey {
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  final String? associationId;

  /// When the security key was created.
  final DateTime? creationTime;

  /// The key of the security key.
  final String? key;

  SecurityKey({
    this.associationId,
    this.creationTime,
    this.key,
  });

  factory SecurityKey.fromJson(Map<String, dynamic> json) {
    return SecurityKey(
      associationId: json['AssociationId'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      key: json['Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final creationTime = this.creationTime;
    final key = this.key;
    return {
      if (associationId != null) 'AssociationId': associationId,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (key != null) 'Key': key,
    };
  }
}

/// Contains information about a security profile.
class SecurityProfile {
  /// The Amazon Resource Name (ARN) for the secruity profile.
  final String? arn;

  /// The description of the security profile.
  final String? description;

  /// The identifier for the security profile.
  final String? id;

  /// The organization resource identifier for the security profile.
  final String? organizationResourceId;

  /// The name for the security profile.
  final String? securityProfileName;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  SecurityProfile({
    this.arn,
    this.description,
    this.id,
    this.organizationResourceId,
    this.securityProfileName,
    this.tags,
  });

  factory SecurityProfile.fromJson(Map<String, dynamic> json) {
    return SecurityProfile(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      organizationResourceId: json['OrganizationResourceId'] as String?,
      securityProfileName: json['SecurityProfileName'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final organizationResourceId = this.organizationResourceId;
    final securityProfileName = this.securityProfileName;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (organizationResourceId != null)
        'OrganizationResourceId': organizationResourceId,
      if (securityProfileName != null)
        'SecurityProfileName': securityProfileName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about a security profile.
class SecurityProfileSummary {
  /// The Amazon Resource Name (ARN) of the security profile.
  final String? arn;

  /// The identifier of the security profile.
  final String? id;

  /// The name of the security profile.
  final String? name;

  SecurityProfileSummary({
    this.arn,
    this.id,
    this.name,
  });

  factory SecurityProfileSummary.fromJson(Map<String, dynamic> json) {
    return SecurityProfileSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

enum SourceType {
  salesforce,
  zendesk,
}

extension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.salesforce:
        return 'SALESFORCE';
      case SourceType.zendesk:
        return 'ZENDESK';
    }
  }
}

extension on String {
  SourceType toSourceType() {
    switch (this) {
      case 'SALESFORCE':
        return SourceType.salesforce;
      case 'ZENDESK':
        return SourceType.zendesk;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartChatContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  final String? contactId;

  /// The identifier for a chat participant. The participantId for a chat
  /// participant is the same throughout the chat lifecycle.
  final String? participantId;

  /// The token used by the chat participant to call <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>.
  /// The participant token is valid for the lifetime of a chat participant.
  final String? participantToken;

  StartChatContactResponse({
    this.contactId,
    this.participantId,
    this.participantToken,
  });

  factory StartChatContactResponse.fromJson(Map<String, dynamic> json) {
    return StartChatContactResponse(
      contactId: json['ContactId'] as String?,
      participantId: json['ParticipantId'] as String?,
      participantToken: json['ParticipantToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactId = this.contactId;
    final participantId = this.participantId;
    final participantToken = this.participantToken;
    return {
      if (contactId != null) 'ContactId': contactId,
      if (participantId != null) 'ParticipantId': participantId,
      if (participantToken != null) 'ParticipantToken': participantToken,
    };
  }
}

class StartContactRecordingResponse {
  StartContactRecordingResponse();

  factory StartContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return StartContactRecordingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartContactStreamingResponse {
  /// The identifier of the streaming configuration enabled.
  final String streamingId;

  StartContactStreamingResponse({
    required this.streamingId,
  });

  factory StartContactStreamingResponse.fromJson(Map<String, dynamic> json) {
    return StartContactStreamingResponse(
      streamingId: json['StreamingId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingId = this.streamingId;
    return {
      'StreamingId': streamingId,
    };
  }
}

class StartOutboundVoiceContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  final String? contactId;

  StartOutboundVoiceContactResponse({
    this.contactId,
  });

  factory StartOutboundVoiceContactResponse.fromJson(
      Map<String, dynamic> json) {
    return StartOutboundVoiceContactResponse(
      contactId: json['ContactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactId = this.contactId;
    return {
      if (contactId != null) 'ContactId': contactId,
    };
  }
}

class StartTaskContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  final String? contactId;

  StartTaskContactResponse({
    this.contactId,
  });

  factory StartTaskContactResponse.fromJson(Map<String, dynamic> json) {
    return StartTaskContactResponse(
      contactId: json['ContactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactId = this.contactId;
    return {
      if (contactId != null) 'ContactId': contactId,
    };
  }
}

enum Statistic {
  sum,
  max,
  avg,
}

extension on Statistic {
  String toValue() {
    switch (this) {
      case Statistic.sum:
        return 'SUM';
      case Statistic.max:
        return 'MAX';
      case Statistic.avg:
        return 'AVG';
    }
  }
}

extension on String {
  Statistic toStatistic() {
    switch (this) {
      case 'SUM':
        return Statistic.sum;
      case 'MAX':
        return Statistic.max;
      case 'AVG':
        return Statistic.avg;
    }
    throw Exception('$this is not known in enum Statistic');
  }
}

class StopContactRecordingResponse {
  StopContactRecordingResponse();

  factory StopContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return StopContactRecordingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopContactResponse {
  StopContactResponse();

  factory StopContactResponse.fromJson(Map<String, dynamic> _) {
    return StopContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopContactStreamingResponse {
  StopContactStreamingResponse();

  factory StopContactStreamingResponse.fromJson(Map<String, dynamic> _) {
    return StopContactStreamingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum StorageType {
  s3,
  kinesisVideoStream,
  kinesisStream,
  kinesisFirehose,
}

extension on StorageType {
  String toValue() {
    switch (this) {
      case StorageType.s3:
        return 'S3';
      case StorageType.kinesisVideoStream:
        return 'KINESIS_VIDEO_STREAM';
      case StorageType.kinesisStream:
        return 'KINESIS_STREAM';
      case StorageType.kinesisFirehose:
        return 'KINESIS_FIREHOSE';
    }
  }
}

extension on String {
  StorageType toStorageType() {
    switch (this) {
      case 'S3':
        return StorageType.s3;
      case 'KINESIS_VIDEO_STREAM':
        return StorageType.kinesisVideoStream;
      case 'KINESIS_STREAM':
        return StorageType.kinesisStream;
      case 'KINESIS_FIREHOSE':
        return StorageType.kinesisFirehose;
    }
    throw Exception('$this is not known in enum StorageType');
  }
}

enum StringComparisonType {
  startsWith,
  contains,
  exact,
}

extension on StringComparisonType {
  String toValue() {
    switch (this) {
      case StringComparisonType.startsWith:
        return 'STARTS_WITH';
      case StringComparisonType.contains:
        return 'CONTAINS';
      case StringComparisonType.exact:
        return 'EXACT';
    }
  }
}

extension on String {
  StringComparisonType toStringComparisonType() {
    switch (this) {
      case 'STARTS_WITH':
        return StringComparisonType.startsWith;
      case 'CONTAINS':
        return StringComparisonType.contains;
      case 'EXACT':
        return StringComparisonType.exact;
    }
    throw Exception('$this is not known in enum StringComparisonType');
  }
}

/// A leaf node condition which can be used to specify a string condition, for
/// example, <code>username = 'abc'</code>.
class StringCondition {
  /// The type of comparison to be made when evaluating the string condition.
  final StringComparisonType? comparisonType;

  /// The name of the field in the string condition.
  final String? fieldName;

  /// The value of the string.
  final String? value;

  StringCondition({
    this.comparisonType,
    this.fieldName,
    this.value,
  });

  factory StringCondition.fromJson(Map<String, dynamic> json) {
    return StringCondition(
      comparisonType:
          (json['ComparisonType'] as String?)?.toStringComparisonType(),
      fieldName: json['FieldName'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonType = this.comparisonType;
    final fieldName = this.fieldName;
    final value = this.value;
    return {
      if (comparisonType != null) 'ComparisonType': comparisonType.toValue(),
      if (fieldName != null) 'FieldName': fieldName,
      if (value != null) 'Value': value,
    };
  }
}

/// Information about a reference when the <code>referenceType</code> is
/// <code>STRING</code>. Otherwise, null.
class StringReference {
  /// Identifier of the string reference.
  final String? name;

  /// A valid string.
  final String? value;

  StringReference({
    this.name,
    this.value,
  });

  factory StringReference.fromJson(Map<String, dynamic> json) {
    return StringReference(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class SuspendContactRecordingResponse {
  SuspendContactRecordingResponse();

  factory SuspendContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return SuspendContactRecordingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A leaf node condition which can be used to specify a tag condition, for
/// example, <code>HAVE BPO = 123</code>.
class TagCondition {
  /// The tag key in the tag condition.
  final String? tagKey;

  /// The tag value in the tag condition.
  final String? tagValue;

  TagCondition({
    this.tagKey,
    this.tagValue,
  });

  factory TagCondition.fromJson(Map<String, dynamic> json) {
    return TagCondition(
      tagKey: json['TagKey'] as String?,
      tagValue: json['TagValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValue = this.tagValue;
    return {
      if (tagKey != null) 'TagKey': tagKey,
      if (tagValue != null) 'TagValue': tagValue,
    };
  }
}

/// Describes constraints that apply to the template fields.
class TaskTemplateConstraints {
  /// Lists the fields that are invisible to agents.
  final List<InvisibleFieldInfo>? invisibleFields;

  /// Lists the fields that are read-only to agents, and cannot be edited.
  final List<ReadOnlyFieldInfo>? readOnlyFields;

  /// Lists the fields that are required to be filled by agents.
  final List<RequiredFieldInfo>? requiredFields;

  TaskTemplateConstraints({
    this.invisibleFields,
    this.readOnlyFields,
    this.requiredFields,
  });

  factory TaskTemplateConstraints.fromJson(Map<String, dynamic> json) {
    return TaskTemplateConstraints(
      invisibleFields: (json['InvisibleFields'] as List?)
          ?.whereNotNull()
          .map((e) => InvisibleFieldInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      readOnlyFields: (json['ReadOnlyFields'] as List?)
          ?.whereNotNull()
          .map((e) => ReadOnlyFieldInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredFields: (json['RequiredFields'] as List?)
          ?.whereNotNull()
          .map((e) => RequiredFieldInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invisibleFields = this.invisibleFields;
    final readOnlyFields = this.readOnlyFields;
    final requiredFields = this.requiredFields;
    return {
      if (invisibleFields != null) 'InvisibleFields': invisibleFields,
      if (readOnlyFields != null) 'ReadOnlyFields': readOnlyFields,
      if (requiredFields != null) 'RequiredFields': requiredFields,
    };
  }
}

/// Describes a default field and its corresponding value.
class TaskTemplateDefaultFieldValue {
  /// Default value for the field.
  final String? defaultValue;

  /// Identifier of a field.
  final TaskTemplateFieldIdentifier? id;

  TaskTemplateDefaultFieldValue({
    this.defaultValue,
    this.id,
  });

  factory TaskTemplateDefaultFieldValue.fromJson(Map<String, dynamic> json) {
    return TaskTemplateDefaultFieldValue(
      defaultValue: json['DefaultValue'] as String?,
      id: json['Id'] != null
          ? TaskTemplateFieldIdentifier.fromJson(
              json['Id'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final id = this.id;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (id != null) 'Id': id,
    };
  }
}

/// Describes default values for fields on a template.
class TaskTemplateDefaults {
  /// Default value for the field.
  final List<TaskTemplateDefaultFieldValue>? defaultFieldValues;

  TaskTemplateDefaults({
    this.defaultFieldValues,
  });

  factory TaskTemplateDefaults.fromJson(Map<String, dynamic> json) {
    return TaskTemplateDefaults(
      defaultFieldValues: (json['DefaultFieldValues'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TaskTemplateDefaultFieldValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultFieldValues = this.defaultFieldValues;
    return {
      if (defaultFieldValues != null) 'DefaultFieldValues': defaultFieldValues,
    };
  }
}

/// Describes a single task template field.
class TaskTemplateField {
  /// The unique identifier for the field.
  final TaskTemplateFieldIdentifier id;

  /// The description of the field.
  final String? description;

  /// A list of options for a single select field.
  final List<String>? singleSelectOptions;

  /// Indicates the type of field.
  final TaskTemplateFieldType? type;

  TaskTemplateField({
    required this.id,
    this.description,
    this.singleSelectOptions,
    this.type,
  });

  factory TaskTemplateField.fromJson(Map<String, dynamic> json) {
    return TaskTemplateField(
      id: TaskTemplateFieldIdentifier.fromJson(
          json['Id'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      singleSelectOptions: (json['SingleSelectOptions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['Type'] as String?)?.toTaskTemplateFieldType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final description = this.description;
    final singleSelectOptions = this.singleSelectOptions;
    final type = this.type;
    return {
      'Id': id,
      if (description != null) 'Description': description,
      if (singleSelectOptions != null)
        'SingleSelectOptions': singleSelectOptions,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The identifier of the task template field.
class TaskTemplateFieldIdentifier {
  /// The name of the task template field.
  final String? name;

  TaskTemplateFieldIdentifier({
    this.name,
  });

  factory TaskTemplateFieldIdentifier.fromJson(Map<String, dynamic> json) {
    return TaskTemplateFieldIdentifier(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

enum TaskTemplateFieldType {
  name,
  description,
  scheduledTime,
  quickConnect,
  url,
  number,
  text,
  textArea,
  dateTime,
  boolean,
  singleSelect,
  email,
}

extension on TaskTemplateFieldType {
  String toValue() {
    switch (this) {
      case TaskTemplateFieldType.name:
        return 'NAME';
      case TaskTemplateFieldType.description:
        return 'DESCRIPTION';
      case TaskTemplateFieldType.scheduledTime:
        return 'SCHEDULED_TIME';
      case TaskTemplateFieldType.quickConnect:
        return 'QUICK_CONNECT';
      case TaskTemplateFieldType.url:
        return 'URL';
      case TaskTemplateFieldType.number:
        return 'NUMBER';
      case TaskTemplateFieldType.text:
        return 'TEXT';
      case TaskTemplateFieldType.textArea:
        return 'TEXT_AREA';
      case TaskTemplateFieldType.dateTime:
        return 'DATE_TIME';
      case TaskTemplateFieldType.boolean:
        return 'BOOLEAN';
      case TaskTemplateFieldType.singleSelect:
        return 'SINGLE_SELECT';
      case TaskTemplateFieldType.email:
        return 'EMAIL';
    }
  }
}

extension on String {
  TaskTemplateFieldType toTaskTemplateFieldType() {
    switch (this) {
      case 'NAME':
        return TaskTemplateFieldType.name;
      case 'DESCRIPTION':
        return TaskTemplateFieldType.description;
      case 'SCHEDULED_TIME':
        return TaskTemplateFieldType.scheduledTime;
      case 'QUICK_CONNECT':
        return TaskTemplateFieldType.quickConnect;
      case 'URL':
        return TaskTemplateFieldType.url;
      case 'NUMBER':
        return TaskTemplateFieldType.number;
      case 'TEXT':
        return TaskTemplateFieldType.text;
      case 'TEXT_AREA':
        return TaskTemplateFieldType.textArea;
      case 'DATE_TIME':
        return TaskTemplateFieldType.dateTime;
      case 'BOOLEAN':
        return TaskTemplateFieldType.boolean;
      case 'SINGLE_SELECT':
        return TaskTemplateFieldType.singleSelect;
      case 'EMAIL':
        return TaskTemplateFieldType.email;
    }
    throw Exception('$this is not known in enum TaskTemplateFieldType');
  }
}

/// Contains summary information about the task template.
class TaskTemplateMetadata {
  /// The Amazon Resource Name (ARN) of the task template.
  final String? arn;

  /// The timestamp when the task template was created.
  final DateTime? createdTime;

  /// The description of the task template.
  final String? description;

  /// A unique identifier for the task template.
  final String? id;

  /// The timestamp when the task template was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the task template.
  final String? name;

  /// Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task
  /// to refer to it. Tasks can only be created from <code>ACTIVE</code>
  /// templates. If a template is marked as <code>INACTIVE</code>, then a task
  /// that refers to this template cannot be created.
  final TaskTemplateStatus? status;

  TaskTemplateMetadata({
    this.arn,
    this.createdTime,
    this.description,
    this.id,
    this.lastModifiedTime,
    this.name,
    this.status,
  });

  factory TaskTemplateMetadata.fromJson(Map<String, dynamic> json) {
    return TaskTemplateMetadata(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toTaskTemplateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum TaskTemplateStatus {
  active,
  inactive,
}

extension on TaskTemplateStatus {
  String toValue() {
    switch (this) {
      case TaskTemplateStatus.active:
        return 'ACTIVE';
      case TaskTemplateStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
  TaskTemplateStatus toTaskTemplateStatus() {
    switch (this) {
      case 'ACTIVE':
        return TaskTemplateStatus.active;
      case 'INACTIVE':
        return TaskTemplateStatus.inactive;
    }
    throw Exception('$this is not known in enum TaskTemplateStatus');
  }
}

/// Contains information about the threshold for service level metrics.
class Threshold {
  /// The type of comparison. Only "less than" (LT) comparisons are supported.
  final Comparison? comparison;

  /// The threshold value to compare.
  final double? thresholdValue;

  Threshold({
    this.comparison,
    this.thresholdValue,
  });

  factory Threshold.fromJson(Map<String, dynamic> json) {
    return Threshold(
      comparison: (json['Comparison'] as String?)?.toComparison(),
      thresholdValue: json['ThresholdValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final thresholdValue = this.thresholdValue;
    return {
      if (comparison != null) 'Comparison': comparison.toValue(),
      if (thresholdValue != null) 'ThresholdValue': thresholdValue,
    };
  }
}

enum TrafficType {
  general,
  campaign,
}

extension on TrafficType {
  String toValue() {
    switch (this) {
      case TrafficType.general:
        return 'GENERAL';
      case TrafficType.campaign:
        return 'CAMPAIGN';
    }
  }
}

extension on String {
  TrafficType toTrafficType() {
    switch (this) {
      case 'GENERAL':
        return TrafficType.general;
      case 'CAMPAIGN':
        return TrafficType.campaign;
    }
    throw Exception('$this is not known in enum TrafficType');
  }
}

class TransferContactResponse {
  /// The Amazon Resource Name (ARN) of the contact.
  final String? contactArn;

  /// The identifier of the contact in this instance of Amazon Connect.
  final String? contactId;

  TransferContactResponse({
    this.contactArn,
    this.contactId,
  });

  factory TransferContactResponse.fromJson(Map<String, dynamic> json) {
    return TransferContactResponse(
      contactArn: json['ContactArn'] as String?,
      contactId: json['ContactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final contactId = this.contactId;
    return {
      if (contactArn != null) 'ContactArn': contactArn,
      if (contactId != null) 'ContactId': contactId,
    };
  }
}

enum Unit {
  seconds,
  count,
  percent,
}

extension on Unit {
  String toValue() {
    switch (this) {
      case Unit.seconds:
        return 'SECONDS';
      case Unit.count:
        return 'COUNT';
      case Unit.percent:
        return 'PERCENT';
    }
  }
}

extension on String {
  Unit toUnit() {
    switch (this) {
      case 'SECONDS':
        return Unit.seconds;
      case 'COUNT':
        return Unit.count;
      case 'PERCENT':
        return Unit.percent;
    }
    throw Exception('$this is not known in enum Unit');
  }
}

class UpdateContactAttributesResponse {
  UpdateContactAttributesResponse();

  factory UpdateContactAttributesResponse.fromJson(Map<String, dynamic> _) {
    return UpdateContactAttributesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactFlowModuleContentResponse {
  UpdateContactFlowModuleContentResponse();

  factory UpdateContactFlowModuleContentResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateContactFlowModuleContentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactFlowModuleMetadataResponse {
  UpdateContactFlowModuleMetadataResponse();

  factory UpdateContactFlowModuleMetadataResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateContactFlowModuleMetadataResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactResponse {
  UpdateContactResponse();

  factory UpdateContactResponse.fromJson(Map<String, dynamic> _) {
    return UpdateContactResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactScheduleResponse {
  UpdateContactScheduleResponse();

  factory UpdateContactScheduleResponse.fromJson(Map<String, dynamic> _) {
    return UpdateContactScheduleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePhoneNumberResponse {
  /// The Amazon Resource Name (ARN) of the phone number.
  final String? phoneNumberArn;

  /// A unique identifier for the phone number.
  final String? phoneNumberId;

  UpdatePhoneNumberResponse({
    this.phoneNumberArn,
    this.phoneNumberId,
  });

  factory UpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePhoneNumberResponse(
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberId = this.phoneNumberId;
    return {
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
    };
  }
}

class UpdateTaskTemplateResponse {
  /// The Amazon Resource Name (ARN) for the task template resource.
  final String? arn;

  /// Constraints that are applicable to the fields listed.
  final TaskTemplateConstraints? constraints;

  /// The identifier of the flow that runs by default when a task is created by
  /// referencing this template.
  final String? contactFlowId;

  /// The timestamp when the task template was created.
  final DateTime? createdTime;

  /// The default values for fields when a task is created by referencing this
  /// template.
  final TaskTemplateDefaults? defaults;

  /// The description of the task template.
  final String? description;

  /// Fields that are part of the template.
  final List<TaskTemplateField>? fields;

  /// The identifier of the task template resource.
  final String? id;

  /// The identifier of the Amazon Connect instance. You can find the instanceId
  /// in the ARN of the instance.
  final String? instanceId;

  /// The timestamp when the task template was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the task template.
  final String? name;

  /// Marks a template as <code>ACTIVE</code> or <code>INACTIVE</code> for a task
  /// to refer to it. Tasks can only be created from <code>ACTIVE</code>
  /// templates. If a template is marked as <code>INACTIVE</code>, then a task
  /// that refers to this template cannot be created.
  final TaskTemplateStatus? status;

  UpdateTaskTemplateResponse({
    this.arn,
    this.constraints,
    this.contactFlowId,
    this.createdTime,
    this.defaults,
    this.description,
    this.fields,
    this.id,
    this.instanceId,
    this.lastModifiedTime,
    this.name,
    this.status,
  });

  factory UpdateTaskTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTaskTemplateResponse(
      arn: json['Arn'] as String?,
      constraints: json['Constraints'] != null
          ? TaskTemplateConstraints.fromJson(
              json['Constraints'] as Map<String, dynamic>)
          : null,
      contactFlowId: json['ContactFlowId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      defaults: json['Defaults'] != null
          ? TaskTemplateDefaults.fromJson(
              json['Defaults'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      fields: (json['Fields'] as List?)
          ?.whereNotNull()
          .map((e) => TaskTemplateField.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      instanceId: json['InstanceId'] as String?,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toTaskTemplateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final constraints = this.constraints;
    final contactFlowId = this.contactFlowId;
    final createdTime = this.createdTime;
    final defaults = this.defaults;
    final description = this.description;
    final fields = this.fields;
    final id = this.id;
    final instanceId = this.instanceId;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (constraints != null) 'Constraints': constraints,
      if (contactFlowId != null) 'ContactFlowId': contactFlowId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (defaults != null) 'Defaults': defaults,
      if (description != null) 'Description': description,
      if (fields != null) 'Fields': fields,
      if (id != null) 'Id': id,
      if (instanceId != null) 'InstanceId': instanceId,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The URL reference.
class UrlReference {
  /// Identifier of the URL reference.
  final String? name;

  /// A valid URL.
  final String? value;

  UrlReference({
    this.name,
    this.value,
  });

  factory UrlReference.fromJson(Map<String, dynamic> json) {
    return UrlReference(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// Contains the use case.
class UseCase {
  /// The Amazon Resource Name (ARN) for the use case.
  final String? useCaseArn;

  /// The identifier for the use case.
  final String? useCaseId;

  /// The type of use case to associate to the integration association. Each
  /// integration association can have only one of each use case type.
  final UseCaseType? useCaseType;

  UseCase({
    this.useCaseArn,
    this.useCaseId,
    this.useCaseType,
  });

  factory UseCase.fromJson(Map<String, dynamic> json) {
    return UseCase(
      useCaseArn: json['UseCaseArn'] as String?,
      useCaseId: json['UseCaseId'] as String?,
      useCaseType: (json['UseCaseType'] as String?)?.toUseCaseType(),
    );
  }

  Map<String, dynamic> toJson() {
    final useCaseArn = this.useCaseArn;
    final useCaseId = this.useCaseId;
    final useCaseType = this.useCaseType;
    return {
      if (useCaseArn != null) 'UseCaseArn': useCaseArn,
      if (useCaseId != null) 'UseCaseId': useCaseId,
      if (useCaseType != null) 'UseCaseType': useCaseType.toValue(),
    };
  }
}

enum UseCaseType {
  rulesEvaluation,
  connectCampaigns,
}

extension on UseCaseType {
  String toValue() {
    switch (this) {
      case UseCaseType.rulesEvaluation:
        return 'RULES_EVALUATION';
      case UseCaseType.connectCampaigns:
        return 'CONNECT_CAMPAIGNS';
    }
  }
}

extension on String {
  UseCaseType toUseCaseType() {
    switch (this) {
      case 'RULES_EVALUATION':
        return UseCaseType.rulesEvaluation;
      case 'CONNECT_CAMPAIGNS':
        return UseCaseType.connectCampaigns;
    }
    throw Exception('$this is not known in enum UseCaseType');
  }
}

/// Contains information about a user account for a Amazon Connect instance.
class User {
  /// The Amazon Resource Name (ARN) of the user account.
  final String? arn;

  /// The identifier of the user account in the directory used for identity
  /// management.
  final String? directoryUserId;

  /// The identifier of the hierarchy group for the user.
  final String? hierarchyGroupId;

  /// The identifier of the user account.
  final String? id;

  /// Information about the user identity.
  final UserIdentityInfo? identityInfo;

  /// Information about the phone configuration for the user.
  final UserPhoneConfig? phoneConfig;

  /// The identifier of the routing profile for the user.
  final String? routingProfileId;

  /// The identifiers of the security profiles for the user.
  final List<String>? securityProfileIds;

  /// The tags.
  final Map<String, String>? tags;

  /// The user name assigned to the user account.
  final String? username;

  User({
    this.arn,
    this.directoryUserId,
    this.hierarchyGroupId,
    this.id,
    this.identityInfo,
    this.phoneConfig,
    this.routingProfileId,
    this.securityProfileIds,
    this.tags,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      arn: json['Arn'] as String?,
      directoryUserId: json['DirectoryUserId'] as String?,
      hierarchyGroupId: json['HierarchyGroupId'] as String?,
      id: json['Id'] as String?,
      identityInfo: json['IdentityInfo'] != null
          ? UserIdentityInfo.fromJson(
              json['IdentityInfo'] as Map<String, dynamic>)
          : null,
      phoneConfig: json['PhoneConfig'] != null
          ? UserPhoneConfig.fromJson(
              json['PhoneConfig'] as Map<String, dynamic>)
          : null,
      routingProfileId: json['RoutingProfileId'] as String?,
      securityProfileIds: (json['SecurityProfileIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final directoryUserId = this.directoryUserId;
    final hierarchyGroupId = this.hierarchyGroupId;
    final id = this.id;
    final identityInfo = this.identityInfo;
    final phoneConfig = this.phoneConfig;
    final routingProfileId = this.routingProfileId;
    final securityProfileIds = this.securityProfileIds;
    final tags = this.tags;
    final username = this.username;
    return {
      if (arn != null) 'Arn': arn,
      if (directoryUserId != null) 'DirectoryUserId': directoryUserId,
      if (hierarchyGroupId != null) 'HierarchyGroupId': hierarchyGroupId,
      if (id != null) 'Id': id,
      if (identityInfo != null) 'IdentityInfo': identityInfo,
      if (phoneConfig != null) 'PhoneConfig': phoneConfig,
      if (routingProfileId != null) 'RoutingProfileId': routingProfileId,
      if (securityProfileIds != null) 'SecurityProfileIds': securityProfileIds,
      if (tags != null) 'Tags': tags,
      if (username != null) 'Username': username,
    };
  }
}

/// Data for a user.
class UserData {
  /// A map of active slots by channel. The key is a channel name. The value is an
  /// integer: the number of active slots.
  final Map<Channel, int>? activeSlotsByChannel;

  /// A map of available slots by channel. The key is a channel name. The value is
  /// an integer: the available number of slots.
  final Map<Channel, int>? availableSlotsByChannel;

  /// A list of contact reference information.
  final List<AgentContactReference>? contacts;

  /// Contains information about the levels of a hierarchy group assigned to a
  /// user.
  final HierarchyPathReference? hierarchyPath;

  /// A map of maximum slots by channel. The key is a channel name. The value is
  /// an integer: the maximum number of slots. This is calculated from <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_MediaConcurrency.html">MediaConcurrency</a>
  /// of the RoutingProfile assigned to the agent.
  final Map<Channel, int>? maxSlotsByChannel;

  /// Information about the routing profile that is assigned to the user.
  final RoutingProfileReference? routingProfile;

  /// The status of the agent that they manually set in their Contact Control
  /// Panel (CCP), or that the supervisor manually changes in the real-time
  /// metrics report.
  final AgentStatusReference? status;

  /// Information about the user for the data that is returned. It contains
  /// resourceId and ARN of the user.
  final UserReference? user;

  UserData({
    this.activeSlotsByChannel,
    this.availableSlotsByChannel,
    this.contacts,
    this.hierarchyPath,
    this.maxSlotsByChannel,
    this.routingProfile,
    this.status,
    this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      activeSlotsByChannel:
          (json['ActiveSlotsByChannel'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toChannel(), e as int)),
      availableSlotsByChannel:
          (json['AvailableSlotsByChannel'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toChannel(), e as int)),
      contacts: (json['Contacts'] as List?)
          ?.whereNotNull()
          .map((e) => AgentContactReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      hierarchyPath: json['HierarchyPath'] != null
          ? HierarchyPathReference.fromJson(
              json['HierarchyPath'] as Map<String, dynamic>)
          : null,
      maxSlotsByChannel: (json['MaxSlotsByChannel'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toChannel(), e as int)),
      routingProfile: json['RoutingProfile'] != null
          ? RoutingProfileReference.fromJson(
              json['RoutingProfile'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? AgentStatusReference.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      user: json['User'] != null
          ? UserReference.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activeSlotsByChannel = this.activeSlotsByChannel;
    final availableSlotsByChannel = this.availableSlotsByChannel;
    final contacts = this.contacts;
    final hierarchyPath = this.hierarchyPath;
    final maxSlotsByChannel = this.maxSlotsByChannel;
    final routingProfile = this.routingProfile;
    final status = this.status;
    final user = this.user;
    return {
      if (activeSlotsByChannel != null)
        'ActiveSlotsByChannel':
            activeSlotsByChannel.map((k, e) => MapEntry(k.toValue(), e)),
      if (availableSlotsByChannel != null)
        'AvailableSlotsByChannel':
            availableSlotsByChannel.map((k, e) => MapEntry(k.toValue(), e)),
      if (contacts != null) 'Contacts': contacts,
      if (hierarchyPath != null) 'HierarchyPath': hierarchyPath,
      if (maxSlotsByChannel != null)
        'MaxSlotsByChannel':
            maxSlotsByChannel.map((k, e) => MapEntry(k.toValue(), e)),
      if (routingProfile != null) 'RoutingProfile': routingProfile,
      if (status != null) 'Status': status,
      if (user != null) 'User': user,
    };
  }
}

/// A filter for the user data.
class UserDataFilters {
  /// A filter for the user data based on the contact information that is
  /// associated to the user. It contains a list of contact states.
  final ContactFilter? contactFilter;

  /// Contains information about a queue resource for which metrics are returned.
  final List<String>? queues;

  UserDataFilters({
    this.contactFilter,
    this.queues,
  });

  factory UserDataFilters.fromJson(Map<String, dynamic> json) {
    return UserDataFilters(
      contactFilter: json['ContactFilter'] != null
          ? ContactFilter.fromJson(
              json['ContactFilter'] as Map<String, dynamic>)
          : null,
      queues: (json['Queues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contactFilter = this.contactFilter;
    final queues = this.queues;
    return {
      if (contactFilter != null) 'ContactFilter': contactFilter,
      if (queues != null) 'Queues': queues,
    };
  }
}

/// Contains information about the identity of a user.
class UserIdentityInfo {
  /// The email address. If you are using SAML for identity management and include
  /// this parameter, an error is returned.
  final String? email;

  /// The first name. This is required if you are using Amazon Connect or SAML for
  /// identity management.
  final String? firstName;

  /// The last name. This is required if you are using Amazon Connect or SAML for
  /// identity management.
  final String? lastName;

  UserIdentityInfo({
    this.email,
    this.firstName,
    this.lastName,
  });

  factory UserIdentityInfo.fromJson(Map<String, dynamic> json) {
    return UserIdentityInfo(
      email: json['Email'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      if (email != null) 'Email': email,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
    };
  }
}

/// The user's first name and last name.
class UserIdentityInfoLite {
  /// The user's first name.
  final String? firstName;

  /// The user's last name.
  final String? lastName;

  UserIdentityInfoLite({
    this.firstName,
    this.lastName,
  });

  factory UserIdentityInfoLite.fromJson(Map<String, dynamic> json) {
    return UserIdentityInfoLite(
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
    };
  }
}

/// Contains information about the phone configuration settings for a user.
class UserPhoneConfig {
  /// The phone type.
  final PhoneType phoneType;

  /// The After Call Work (ACW) timeout setting, in seconds.
  final int? afterContactWorkTimeLimit;

  /// The Auto accept setting.
  final bool? autoAccept;

  /// The phone number for the user's desk phone.
  final String? deskPhoneNumber;

  UserPhoneConfig({
    required this.phoneType,
    this.afterContactWorkTimeLimit,
    this.autoAccept,
    this.deskPhoneNumber,
  });

  factory UserPhoneConfig.fromJson(Map<String, dynamic> json) {
    return UserPhoneConfig(
      phoneType: (json['PhoneType'] as String).toPhoneType(),
      afterContactWorkTimeLimit: json['AfterContactWorkTimeLimit'] as int?,
      autoAccept: json['AutoAccept'] as bool?,
      deskPhoneNumber: json['DeskPhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneType = this.phoneType;
    final afterContactWorkTimeLimit = this.afterContactWorkTimeLimit;
    final autoAccept = this.autoAccept;
    final deskPhoneNumber = this.deskPhoneNumber;
    return {
      'PhoneType': phoneType.toValue(),
      if (afterContactWorkTimeLimit != null)
        'AfterContactWorkTimeLimit': afterContactWorkTimeLimit,
      if (autoAccept != null) 'AutoAccept': autoAccept,
      if (deskPhoneNumber != null) 'DeskPhoneNumber': deskPhoneNumber,
    };
  }
}

/// Contains information about the quick connect configuration settings for a
/// user. The contact flow must be of type Transfer to Agent.
class UserQuickConnectConfig {
  /// The identifier of the contact flow.
  final String contactFlowId;

  /// The identifier of the user.
  final String userId;

  UserQuickConnectConfig({
    required this.contactFlowId,
    required this.userId,
  });

  factory UserQuickConnectConfig.fromJson(Map<String, dynamic> json) {
    return UserQuickConnectConfig(
      contactFlowId: json['ContactFlowId'] as String,
      userId: json['UserId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final contactFlowId = this.contactFlowId;
    final userId = this.userId;
    return {
      'ContactFlowId': contactFlowId,
      'UserId': userId,
    };
  }
}

/// Information about the user.
class UserReference {
  /// The Amazon Resource Name (ARN) for the user.
  final String? arn;

  /// The unique identifier for the user.
  final String? id;

  UserReference({
    this.arn,
    this.id,
  });

  factory UserReference.fromJson(Map<String, dynamic> json) {
    return UserReference(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

/// The search criteria to be used to return users.
class UserSearchCriteria {
  /// A list of conditions which would be applied together with an
  /// <code>AND</code> condition.
  final List<UserSearchCriteria>? andConditions;

  /// A leaf node condition which can be used to specify a hierarchy group
  /// condition.
  final HierarchyGroupCondition? hierarchyGroupCondition;

  /// A list of conditions which would be applied together with an <code>OR</code>
  /// condition.
  final List<UserSearchCriteria>? orConditions;

  /// A leaf node condition which can be used to specify a string condition.
  final StringCondition? stringCondition;

  UserSearchCriteria({
    this.andConditions,
    this.hierarchyGroupCondition,
    this.orConditions,
    this.stringCondition,
  });

  factory UserSearchCriteria.fromJson(Map<String, dynamic> json) {
    return UserSearchCriteria(
      andConditions: (json['AndConditions'] as List?)
          ?.whereNotNull()
          .map((e) => UserSearchCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
      hierarchyGroupCondition: json['HierarchyGroupCondition'] != null
          ? HierarchyGroupCondition.fromJson(
              json['HierarchyGroupCondition'] as Map<String, dynamic>)
          : null,
      orConditions: (json['OrConditions'] as List?)
          ?.whereNotNull()
          .map((e) => UserSearchCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringCondition: json['StringCondition'] != null
          ? StringCondition.fromJson(
              json['StringCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andConditions = this.andConditions;
    final hierarchyGroupCondition = this.hierarchyGroupCondition;
    final orConditions = this.orConditions;
    final stringCondition = this.stringCondition;
    return {
      if (andConditions != null) 'AndConditions': andConditions,
      if (hierarchyGroupCondition != null)
        'HierarchyGroupCondition': hierarchyGroupCondition,
      if (orConditions != null) 'OrConditions': orConditions,
      if (stringCondition != null) 'StringCondition': stringCondition,
    };
  }
}

/// Filters to be applied to search results.
class UserSearchFilter {
  final ControlPlaneTagFilter? tagFilter;

  UserSearchFilter({
    this.tagFilter,
  });

  factory UserSearchFilter.fromJson(Map<String, dynamic> json) {
    return UserSearchFilter(
      tagFilter: json['TagFilter'] != null
          ? ControlPlaneTagFilter.fromJson(
              json['TagFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tagFilter = this.tagFilter;
    return {
      if (tagFilter != null) 'TagFilter': tagFilter,
    };
  }
}

/// Information about the returned users.
class UserSearchSummary {
  /// The Amazon Resource Name (ARN) of the user.
  final String? arn;

  /// The directory identifier of the user.
  final String? directoryUserId;

  /// The identifier of the user's hierarchy group.
  final String? hierarchyGroupId;

  /// The identifier of the user's summary.
  final String? id;

  /// The user's first name and last name.
  final UserIdentityInfoLite? identityInfo;
  final UserPhoneConfig? phoneConfig;

  /// The identifier of the user's routing profile.
  final String? routingProfileId;

  /// The identifiers of the user's security profiles.
  final List<String>? securityProfileIds;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The name of the user.
  final String? username;

  UserSearchSummary({
    this.arn,
    this.directoryUserId,
    this.hierarchyGroupId,
    this.id,
    this.identityInfo,
    this.phoneConfig,
    this.routingProfileId,
    this.securityProfileIds,
    this.tags,
    this.username,
  });

  factory UserSearchSummary.fromJson(Map<String, dynamic> json) {
    return UserSearchSummary(
      arn: json['Arn'] as String?,
      directoryUserId: json['DirectoryUserId'] as String?,
      hierarchyGroupId: json['HierarchyGroupId'] as String?,
      id: json['Id'] as String?,
      identityInfo: json['IdentityInfo'] != null
          ? UserIdentityInfoLite.fromJson(
              json['IdentityInfo'] as Map<String, dynamic>)
          : null,
      phoneConfig: json['PhoneConfig'] != null
          ? UserPhoneConfig.fromJson(
              json['PhoneConfig'] as Map<String, dynamic>)
          : null,
      routingProfileId: json['RoutingProfileId'] as String?,
      securityProfileIds: (json['SecurityProfileIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final directoryUserId = this.directoryUserId;
    final hierarchyGroupId = this.hierarchyGroupId;
    final id = this.id;
    final identityInfo = this.identityInfo;
    final phoneConfig = this.phoneConfig;
    final routingProfileId = this.routingProfileId;
    final securityProfileIds = this.securityProfileIds;
    final tags = this.tags;
    final username = this.username;
    return {
      if (arn != null) 'Arn': arn,
      if (directoryUserId != null) 'DirectoryUserId': directoryUserId,
      if (hierarchyGroupId != null) 'HierarchyGroupId': hierarchyGroupId,
      if (id != null) 'Id': id,
      if (identityInfo != null) 'IdentityInfo': identityInfo,
      if (phoneConfig != null) 'PhoneConfig': phoneConfig,
      if (routingProfileId != null) 'RoutingProfileId': routingProfileId,
      if (securityProfileIds != null) 'SecurityProfileIds': securityProfileIds,
      if (tags != null) 'Tags': tags,
      if (username != null) 'Username': username,
    };
  }
}

/// Contains summary information about a user.
class UserSummary {
  /// The Amazon Resource Name (ARN) of the user account.
  final String? arn;

  /// The identifier of the user account.
  final String? id;

  /// The Amazon Connect user name of the user account.
  final String? username;

  UserSummary({
    this.arn,
    this.id,
    this.username,
  });

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    return UserSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      username: json['Username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final username = this.username;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (username != null) 'Username': username,
    };
  }
}

/// Contains information about a custom vocabulary.
class Vocabulary {
  /// The Amazon Resource Name (ARN) of the custom vocabulary.
  final String arn;

  /// The identifier of the custom vocabulary.
  final String id;

  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  final VocabularyLanguageCode languageCode;

  /// The timestamp when the custom vocabulary was last modified.
  final DateTime lastModifiedTime;

  /// A unique name of the custom vocabulary.
  final String name;

  /// The current state of the custom vocabulary.
  final VocabularyState state;

  /// The content of the custom vocabulary in plain-text format with a table of
  /// values. Each row in the table represents a word or a phrase, described with
  /// <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and
  /// <code>DisplayAs</code> fields. Separate the fields with TAB characters. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table">Create
  /// a custom vocabulary using a table</a>.
  final String? content;

  /// The reason why the custom vocabulary was not created.
  final String? failureReason;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  Vocabulary({
    required this.arn,
    required this.id,
    required this.languageCode,
    required this.lastModifiedTime,
    required this.name,
    required this.state,
    this.content,
    this.failureReason,
    this.tags,
  });

  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    return Vocabulary(
      arn: json['Arn'] as String,
      id: json['Id'] as String,
      languageCode: (json['LanguageCode'] as String).toVocabularyLanguageCode(),
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['LastModifiedTime'] as Object),
      name: json['Name'] as String,
      state: (json['State'] as String).toVocabularyState(),
      content: json['Content'] as String?,
      failureReason: json['FailureReason'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final state = this.state;
    final content = this.content;
    final failureReason = this.failureReason;
    final tags = this.tags;
    return {
      'Arn': arn,
      'Id': id,
      'LanguageCode': languageCode.toValue(),
      'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'Name': name,
      'State': state.toValue(),
      if (content != null) 'Content': content,
      if (failureReason != null) 'FailureReason': failureReason,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum VocabularyLanguageCode {
  arAe,
  deCh,
  deDe,
  enAb,
  enAu,
  enGb,
  enIe,
  enIn,
  enUs,
  enWl,
  esEs,
  esUs,
  frCa,
  frFr,
  hiIn,
  itIt,
  jaJp,
  koKr,
  ptBr,
  ptPt,
  zhCn,
}

extension on VocabularyLanguageCode {
  String toValue() {
    switch (this) {
      case VocabularyLanguageCode.arAe:
        return 'ar-AE';
      case VocabularyLanguageCode.deCh:
        return 'de-CH';
      case VocabularyLanguageCode.deDe:
        return 'de-DE';
      case VocabularyLanguageCode.enAb:
        return 'en-AB';
      case VocabularyLanguageCode.enAu:
        return 'en-AU';
      case VocabularyLanguageCode.enGb:
        return 'en-GB';
      case VocabularyLanguageCode.enIe:
        return 'en-IE';
      case VocabularyLanguageCode.enIn:
        return 'en-IN';
      case VocabularyLanguageCode.enUs:
        return 'en-US';
      case VocabularyLanguageCode.enWl:
        return 'en-WL';
      case VocabularyLanguageCode.esEs:
        return 'es-ES';
      case VocabularyLanguageCode.esUs:
        return 'es-US';
      case VocabularyLanguageCode.frCa:
        return 'fr-CA';
      case VocabularyLanguageCode.frFr:
        return 'fr-FR';
      case VocabularyLanguageCode.hiIn:
        return 'hi-IN';
      case VocabularyLanguageCode.itIt:
        return 'it-IT';
      case VocabularyLanguageCode.jaJp:
        return 'ja-JP';
      case VocabularyLanguageCode.koKr:
        return 'ko-KR';
      case VocabularyLanguageCode.ptBr:
        return 'pt-BR';
      case VocabularyLanguageCode.ptPt:
        return 'pt-PT';
      case VocabularyLanguageCode.zhCn:
        return 'zh-CN';
    }
  }
}

extension on String {
  VocabularyLanguageCode toVocabularyLanguageCode() {
    switch (this) {
      case 'ar-AE':
        return VocabularyLanguageCode.arAe;
      case 'de-CH':
        return VocabularyLanguageCode.deCh;
      case 'de-DE':
        return VocabularyLanguageCode.deDe;
      case 'en-AB':
        return VocabularyLanguageCode.enAb;
      case 'en-AU':
        return VocabularyLanguageCode.enAu;
      case 'en-GB':
        return VocabularyLanguageCode.enGb;
      case 'en-IE':
        return VocabularyLanguageCode.enIe;
      case 'en-IN':
        return VocabularyLanguageCode.enIn;
      case 'en-US':
        return VocabularyLanguageCode.enUs;
      case 'en-WL':
        return VocabularyLanguageCode.enWl;
      case 'es-ES':
        return VocabularyLanguageCode.esEs;
      case 'es-US':
        return VocabularyLanguageCode.esUs;
      case 'fr-CA':
        return VocabularyLanguageCode.frCa;
      case 'fr-FR':
        return VocabularyLanguageCode.frFr;
      case 'hi-IN':
        return VocabularyLanguageCode.hiIn;
      case 'it-IT':
        return VocabularyLanguageCode.itIt;
      case 'ja-JP':
        return VocabularyLanguageCode.jaJp;
      case 'ko-KR':
        return VocabularyLanguageCode.koKr;
      case 'pt-BR':
        return VocabularyLanguageCode.ptBr;
      case 'pt-PT':
        return VocabularyLanguageCode.ptPt;
      case 'zh-CN':
        return VocabularyLanguageCode.zhCn;
    }
    throw Exception('$this is not known in enum VocabularyLanguageCode');
  }
}

enum VocabularyState {
  creationInProgress,
  active,
  creationFailed,
  deleteInProgress,
}

extension on VocabularyState {
  String toValue() {
    switch (this) {
      case VocabularyState.creationInProgress:
        return 'CREATION_IN_PROGRESS';
      case VocabularyState.active:
        return 'ACTIVE';
      case VocabularyState.creationFailed:
        return 'CREATION_FAILED';
      case VocabularyState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
    }
  }
}

extension on String {
  VocabularyState toVocabularyState() {
    switch (this) {
      case 'CREATION_IN_PROGRESS':
        return VocabularyState.creationInProgress;
      case 'ACTIVE':
        return VocabularyState.active;
      case 'CREATION_FAILED':
        return VocabularyState.creationFailed;
      case 'DELETE_IN_PROGRESS':
        return VocabularyState.deleteInProgress;
    }
    throw Exception('$this is not known in enum VocabularyState');
  }
}

/// Contains summary information about the custom vocabulary.
class VocabularySummary {
  /// The Amazon Resource Name (ARN) of the custom vocabulary.
  final String arn;

  /// The identifier of the custom vocabulary.
  final String id;

  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html">What
  /// is Amazon Transcribe?</a>
  final VocabularyLanguageCode languageCode;

  /// The timestamp when the custom vocabulary was last modified.
  final DateTime lastModifiedTime;

  /// A unique name of the custom vocabulary.
  final String name;

  /// The current state of the custom vocabulary.
  final VocabularyState state;

  /// The reason why the custom vocabulary was not created.
  final String? failureReason;

  VocabularySummary({
    required this.arn,
    required this.id,
    required this.languageCode,
    required this.lastModifiedTime,
    required this.name,
    required this.state,
    this.failureReason,
  });

  factory VocabularySummary.fromJson(Map<String, dynamic> json) {
    return VocabularySummary(
      arn: json['Arn'] as String,
      id: json['Id'] as String,
      languageCode: (json['LanguageCode'] as String).toVocabularyLanguageCode(),
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['LastModifiedTime'] as Object),
      name: json['Name'] as String,
      state: (json['State'] as String).toVocabularyState(),
      failureReason: json['FailureReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final state = this.state;
    final failureReason = this.failureReason;
    return {
      'Arn': arn,
      'Id': id,
      'LanguageCode': languageCode.toValue(),
      'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'Name': name,
      'State': state.toValue(),
      if (failureReason != null) 'FailureReason': failureReason,
    };
  }
}

/// Contains information about the recording configuration settings.
class VoiceRecordingConfiguration {
  /// Identifies which track is being recorded.
  final VoiceRecordingTrack? voiceRecordingTrack;

  VoiceRecordingConfiguration({
    this.voiceRecordingTrack,
  });

  factory VoiceRecordingConfiguration.fromJson(Map<String, dynamic> json) {
    return VoiceRecordingConfiguration(
      voiceRecordingTrack:
          (json['VoiceRecordingTrack'] as String?)?.toVoiceRecordingTrack(),
    );
  }

  Map<String, dynamic> toJson() {
    final voiceRecordingTrack = this.voiceRecordingTrack;
    return {
      if (voiceRecordingTrack != null)
        'VoiceRecordingTrack': voiceRecordingTrack.toValue(),
    };
  }
}

enum VoiceRecordingTrack {
  fromAgent,
  toAgent,
  all,
}

extension on VoiceRecordingTrack {
  String toValue() {
    switch (this) {
      case VoiceRecordingTrack.fromAgent:
        return 'FROM_AGENT';
      case VoiceRecordingTrack.toAgent:
        return 'TO_AGENT';
      case VoiceRecordingTrack.all:
        return 'ALL';
    }
  }
}

extension on String {
  VoiceRecordingTrack toVoiceRecordingTrack() {
    switch (this) {
      case 'FROM_AGENT':
        return VoiceRecordingTrack.fromAgent;
      case 'TO_AGENT':
        return VoiceRecordingTrack.toAgent;
      case 'ALL':
        return VoiceRecordingTrack.all;
    }
    throw Exception('$this is not known in enum VoiceRecordingTrack');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ContactFlowNotPublishedException extends _s.GenericAwsException {
  ContactFlowNotPublishedException({String? type, String? message})
      : super(
            type: type,
            code: 'ContactFlowNotPublishedException',
            message: message);
}

class ContactNotFoundException extends _s.GenericAwsException {
  ContactNotFoundException({String? type, String? message})
      : super(type: type, code: 'ContactNotFoundException', message: message);
}

class DestinationNotAllowedException extends _s.GenericAwsException {
  DestinationNotAllowedException({String? type, String? message})
      : super(
            type: type,
            code: 'DestinationNotAllowedException',
            message: message);
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String? type, String? message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class IdempotencyException extends _s.GenericAwsException {
  IdempotencyException({String? type, String? message})
      : super(type: type, code: 'IdempotencyException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidContactFlowException extends _s.GenericAwsException {
  InvalidContactFlowException({String? type, String? message})
      : super(
            type: type, code: 'InvalidContactFlowException', message: message);
}

class InvalidContactFlowModuleException extends _s.GenericAwsException {
  InvalidContactFlowModuleException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidContactFlowModuleException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OutboundContactNotPermittedException extends _s.GenericAwsException {
  OutboundContactNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OutboundContactNotPermittedException',
            message: message);
}

class PropertyValidationException extends _s.GenericAwsException {
  PropertyValidationException({String? type, String? message})
      : super(
            type: type, code: 'PropertyValidationException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UserNotFoundException extends _s.GenericAwsException {
  UserNotFoundException({String? type, String? message})
      : super(type: type, code: 'UserNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ContactFlowNotPublishedException': (type, message) =>
      ContactFlowNotPublishedException(type: type, message: message),
  'ContactNotFoundException': (type, message) =>
      ContactNotFoundException(type: type, message: message),
  'DestinationNotAllowedException': (type, message) =>
      DestinationNotAllowedException(type: type, message: message),
  'DuplicateResourceException': (type, message) =>
      DuplicateResourceException(type: type, message: message),
  'IdempotencyException': (type, message) =>
      IdempotencyException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidContactFlowException': (type, message) =>
      InvalidContactFlowException(type: type, message: message),
  'InvalidContactFlowModuleException': (type, message) =>
      InvalidContactFlowModuleException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OutboundContactNotPermittedException': (type, message) =>
      OutboundContactNotPermittedException(type: type, message: message),
  'PropertyValidationException': (type, message) =>
      PropertyValidationException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UserNotFoundException': (type, message) =>
      UserNotFoundException(type: type, message: message),
};
