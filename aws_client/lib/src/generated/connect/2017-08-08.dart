// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-08-08.g.dart';

/// Amazon Connect is a cloud-based contact center solution that makes it easy
/// to set up and manage a customer contact center and provide reliable customer
/// engagement at any scale.
///
/// Amazon Connect provides rich metrics and real-time reporting that allow you
/// to optimize contact routing. You can also resolve customer issues more
/// efficiently by putting customers in touch with the right agents.
///
/// There are limits to the number of Amazon Connect resources that you can
/// create and limits to the number of requests that you can make per second.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">Amazon
/// Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.
///
/// To connect programmatically to an AWS service, you use an endpoint. For a
/// list of Amazon Connect endpoints, see <a
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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [origin] :
  /// The domain to add to your allow list.
  Future<void> associateApprovedOrigin({
    @_s.required String instanceId,
    @_s.required String origin,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(origin, 'origin');
    _s.validateStringLength(
      'origin',
      origin,
      0,
      267,
      isRequired: true,
    );
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
  /// Associates a storage resource type for the first time. You can only
  /// associate one type of storage configuration in a single call. This means,
  /// for example, that you can't define an instance with multiple S3 buckets
  /// for storing chat transcripts.
  ///
  /// This API does not create a resource that doesn't exist. It only associates
  /// it to the instance. Ensure that the resource being specified in the
  /// storage configuration, like an Amazon S3 bucket, exists when being used
  /// for association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  ///
  /// Parameter [storageConfig] :
  /// A valid storage type.
  Future<AssociateInstanceStorageConfigResponse>
      associateInstanceStorageConfig({
    @_s.required String instanceId,
    @_s.required InstanceStorageResourceType resourceType,
    @_s.required InstanceStorageConfig storageConfig,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(storageConfig, 'storageConfig');
    final $payload = <String, dynamic>{
      'ResourceType': resourceType?.toValue() ?? '',
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
  /// The identifier of the Amazon Connect instance.
  Future<void> associateLambdaFunction({
    @_s.required String functionArn,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(functionArn, 'functionArn');
    _s.validateStringLength(
      'functionArn',
      functionArn,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [lexBot] :
  /// The Amazon Lex box to associate with the instance.
  Future<void> associateLexBot({
    @_s.required String instanceId,
    @_s.required LexBot lexBot,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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

  /// Associates a set of queues with a routing profile.
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
  /// Parameter [queueConfigs] :
  /// The queues to associate with this routing profile.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> associateRoutingProfileQueues({
    @_s.required String instanceId,
    @_s.required List<RoutingProfileQueueConfig> queueConfigs,
    @_s.required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [key] :
  /// A valid security key in PEM format.
  Future<AssociateSecurityKeyResponse> associateSecurityKey({
    @_s.required String instanceId,
    @_s.required String key,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(key, 'key');
    _s.validateStringLength(
      'key',
      key,
      1,
      1024,
      isRequired: true,
    );
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
    @_s.required String content,
    @_s.required String instanceId,
    @_s.required String name,
    @_s.required ContactFlowType type,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'Content': content,
      'Name': name,
      'Type': type?.toValue() ?? '',
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Initiates an Amazon Connect instance with all the supported channels
  /// enabled. It does not attach any storage (such as Amazon S3, or Kinesis) or
  /// allow for any configurations on features such as Contact Lens for Amazon
  /// Connect.
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
  /// Whether your contact center handles incoming contacts.
  ///
  /// Parameter [outboundCallsEnabled] :
  /// Whether your contact center allows outbound calls.
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
    @_s.required DirectoryType identityManagementType,
    @_s.required bool inboundCallsEnabled,
    @_s.required bool outboundCallsEnabled,
    String clientToken,
    String directoryId,
    String instanceAlias,
  }) async {
    ArgumentError.checkNotNull(
        identityManagementType, 'identityManagementType');
    ArgumentError.checkNotNull(inboundCallsEnabled, 'inboundCallsEnabled');
    ArgumentError.checkNotNull(outboundCallsEnabled, 'outboundCallsEnabled');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    _s.validateStringLength(
      'directoryId',
      directoryId,
      12,
      12,
    );
    _s.validateStringPattern(
      'directoryId',
      directoryId,
      r'''^d-[0-9a-f]{10}$''',
    );
    _s.validateStringLength(
      'instanceAlias',
      instanceAlias,
      1,
      62,
    );
    _s.validateStringPattern(
      'instanceAlias',
      instanceAlias,
      r'''^(?!d-)([\da-zA-Z]+)([-]*[\da-zA-Z])*$''',
    );
    final $payload = <String, dynamic>{
      'IdentityManagementType': identityManagementType?.toValue() ?? '',
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Create an AppIntegration association with an Amazon Connect instance.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the integration.
  ///
  /// Parameter [integrationType] :
  /// The type of information to be ingested.
  ///
  /// Parameter [sourceApplicationName] :
  /// The name of the external application.
  ///
  /// Parameter [sourceApplicationUrl] :
  /// The URL for the external application.
  ///
  /// Parameter [sourceType] :
  /// The type of the data source.
  Future<CreateIntegrationAssociationResponse> createIntegrationAssociation({
    @_s.required String instanceId,
    @_s.required String integrationArn,
    @_s.required IntegrationType integrationType,
    @_s.required String sourceApplicationName,
    @_s.required String sourceApplicationUrl,
    @_s.required SourceType sourceType,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(integrationArn, 'integrationArn');
    ArgumentError.checkNotNull(integrationType, 'integrationType');
    ArgumentError.checkNotNull(sourceApplicationName, 'sourceApplicationName');
    _s.validateStringLength(
      'sourceApplicationName',
      sourceApplicationName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sourceApplicationName',
      sourceApplicationName,
      r'''^[a-zA-Z0-9_ -]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceApplicationUrl, 'sourceApplicationUrl');
    _s.validateStringLength(
      'sourceApplicationUrl',
      sourceApplicationUrl,
      1,
      2000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceType, 'sourceType');
    final $payload = <String, dynamic>{
      'IntegrationArn': integrationArn,
      'IntegrationType': integrationType?.toValue() ?? '',
      'SourceApplicationName': sourceApplicationName,
      'SourceApplicationUrl': sourceApplicationUrl,
      'SourceType': sourceType?.toValue() ?? '',
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
  /// The identifier of the Amazon Connect instance.
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
  /// One or more tags.
  Future<CreateQuickConnectResponse> createQuickConnect({
    @_s.required String instanceId,
    @_s.required String name,
    @_s.required QuickConnectConfig quickConnectConfig,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      127,
      isRequired: true,
    );
    ArgumentError.checkNotNull(quickConnectConfig, 'quickConnectConfig');
    _s.validateStringLength(
      'description',
      description,
      0,
      250,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [mediaConcurrencies] :
  /// The channels agents can handle in the Contact Control Panel (CCP) for this
  /// routing profile.
  ///
  /// Parameter [name] :
  /// The name of the routing profile. Must not be more than 127 characters.
  ///
  /// Parameter [queueConfigs] :
  /// The inbound queues associated with the routing profile. If no queue is
  /// added, the agent can only make outbound calls.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateRoutingProfileResponse> createRoutingProfile({
    @_s.required String defaultOutboundQueueId,
    @_s.required String description,
    @_s.required String instanceId,
    @_s.required List<MediaConcurrency> mediaConcurrencies,
    @_s.required String name,
    List<RoutingProfileQueueConfig> queueConfigs,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(
        defaultOutboundQueueId, 'defaultOutboundQueueId');
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      250,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(mediaConcurrencies, 'mediaConcurrencies');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      127,
      isRequired: true,
    );
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
  /// Creates a use case for an AppIntegration association.
  ///
  /// May throw [DuplicateResourceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the AppIntegration association.
  ///
  /// Parameter [useCaseType] :
  /// The type of use case to associate to the AppIntegration association. Each
  /// AppIntegration association can have only one of each use case type.
  Future<CreateUseCaseResponse> createUseCase({
    @_s.required String instanceId,
    @_s.required String integrationAssociationId,
    @_s.required UseCaseType useCaseType,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    _s.validateStringLength(
      'integrationAssociationId',
      integrationAssociationId,
      1,
      200,
      isRequired: true,
    );
    ArgumentError.checkNotNull(useCaseType, 'useCaseType');
    final $payload = <String, dynamic>{
      'UseCaseType': useCaseType?.toValue() ?? '',
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
  /// The identifier of the Amazon Connect instance.
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
    @_s.required String instanceId,
    @_s.required UserPhoneConfig phoneConfig,
    @_s.required String routingProfileId,
    @_s.required List<String> securityProfileIds,
    @_s.required String username,
    String directoryUserId,
    String hierarchyGroupId,
    UserIdentityInfo identityInfo,
    String password,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(phoneConfig, 'phoneConfig');
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    ArgumentError.checkNotNull(securityProfileIds, 'securityProfileIds');
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\S]{8,64}$/''',
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [name] :
  /// The name of the user hierarchy group. Must not be more than 100
  /// characters.
  ///
  /// Parameter [parentGroupId] :
  /// The identifier for the parent hierarchy group. The user hierarchy is
  /// created at level one if the parent group ID is null.
  Future<CreateUserHierarchyGroupResponse> createUserHierarchyGroup({
    @_s.required String instanceId,
    @_s.required String name,
    String parentGroupId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Name': name,
      if (parentGroupId != null) 'ParentGroupId': parentGroupId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/user-hierarchy-groups/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserHierarchyGroupResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes the Amazon Connect instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<void> deleteInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes an AppIntegration association from an Amazon Connect instance. The
  /// association must not have any use cases associated with it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the AppIntegration association.
  Future<void> deleteIntegrationAssociation({
    @_s.required String instanceId,
    @_s.required String integrationAssociationId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    _s.validateStringLength(
      'integrationAssociationId',
      integrationAssociationId,
      1,
      200,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations/${Uri.encodeComponent(integrationAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Deletes a quick connect.
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
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  Future<void> deleteQuickConnect({
    @_s.required String instanceId,
    @_s.required String quickConnectId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// Deletes a use case from an AppIntegration association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the AppIntegration association.
  ///
  /// Parameter [useCaseId] :
  /// The identifier for the use case.
  Future<void> deleteUseCase({
    @_s.required String instanceId,
    @_s.required String integrationAssociationId,
    @_s.required String useCaseId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    _s.validateStringLength(
      'integrationAssociationId',
      integrationAssociationId,
      1,
      200,
      isRequired: true,
    );
    ArgumentError.checkNotNull(useCaseId, 'useCaseId');
    _s.validateStringLength(
      'useCaseId',
      useCaseId,
      1,
      200,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user.
  Future<void> deleteUser({
    @_s.required String instanceId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<void> deleteUserHierarchyGroup({
    @_s.required String hierarchyGroupId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/user-hierarchy-groups/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(hierarchyGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
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
    @_s.required String contactFlowId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/contact-flows/${Uri.encodeComponent(instanceId)}/${Uri.encodeComponent(contactFlowId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeContactFlowResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns the current state of the specified instance identifier. It tracks
  /// the instance while it is being created and returns an error status if
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
  /// The identifier of the Amazon Connect instance.
  Future<DescribeInstanceResponse> describeInstance({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<DescribeInstanceAttributeResponse> describeInstanceAttribute({
    @_s.required InstanceAttributeType attributeType,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(attributeType, 'attributeType');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  Future<DescribeInstanceStorageConfigResponse> describeInstanceStorageConfig({
    @_s.required String associationId,
    @_s.required String instanceId,
    @_s.required InstanceStorageResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringLength(
      'associationId',
      associationId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Describes the quick connect.
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
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  Future<DescribeQuickConnectResponse> describeQuickConnect({
    @_s.required String instanceId,
    @_s.required String quickConnectId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<DescribeRoutingProfileResponse> describeRoutingProfile({
    @_s.required String instanceId,
    @_s.required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<DescribeUserResponse> describeUser({
    @_s.required String instanceId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<DescribeUserHierarchyGroupResponse> describeUserHierarchyGroup({
    @_s.required String hierarchyGroupId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<DescribeUserHierarchyStructureResponse>
      describeUserHierarchyStructure({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/user-hierarchy-structure/${Uri.encodeComponent(instanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserHierarchyStructureResponse.fromJson(response);
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [origin] :
  /// The domain URL of the integrated application.
  Future<void> disassociateApprovedOrigin({
    @_s.required String instanceId,
    @_s.required String origin,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(origin, 'origin');
    _s.validateStringLength(
      'origin',
      origin,
      0,
      267,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (origin != null) 'origin': [origin],
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  Future<void> disassociateInstanceStorageConfig({
    @_s.required String associationId,
    @_s.required String instanceId,
    @_s.required InstanceStorageResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringLength(
      'associationId',
      associationId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
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
  /// Remove the Lambda function from the drop-down options available in the
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
  /// The identifier of the Amazon Connect instance..
  Future<void> disassociateLambdaFunction({
    @_s.required String functionArn,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(functionArn, 'functionArn');
    _s.validateStringLength(
      'functionArn',
      functionArn,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (functionArn != null) 'functionArn': [functionArn],
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [lexRegion] :
  /// The Region in which the Amazon Lex bot has been created.
  Future<void> disassociateLexBot({
    @_s.required String botName,
    @_s.required String instanceId,
    @_s.required String lexRegion,
  }) async {
    ArgumentError.checkNotNull(botName, 'botName');
    _s.validateStringLength(
      'botName',
      botName,
      0,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lexRegion, 'lexRegion');
    _s.validateStringLength(
      'lexRegion',
      lexRegion,
      0,
      60,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (botName != null) 'botName': [botName],
      if (lexRegion != null) 'lexRegion': [lexRegion],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/instance/${Uri.encodeComponent(instanceId)}/lex-bot',
      queryParams: $query,
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [queueReferences] :
  /// The queues to disassociate from this routing profile.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> disassociateRoutingProfileQueues({
    @_s.required String instanceId,
    @_s.required List<RoutingProfileQueueReference> queueReferences,
    @_s.required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<void> disassociateSecurityKey({
    @_s.required String associationId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringLength(
      'associationId',
      associationId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// When you use groupings, Unit says SECONDS but the Value is returned in
  /// MILLISECONDS. For example, if you get a response like this:
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
  /// The identifier of the Amazon Connect instance.
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
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  Future<GetCurrentMetricDataResponse> getCurrentMetricData({
    @_s.required List<CurrentMetric> currentMetrics,
    @_s.required Filters filters,
    @_s.required String instanceId,
    List<Grouping> groupings,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(currentMetrics, 'currentMetrics');
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
        'Groupings': groupings.map((e) => e?.toValue() ?? '').toList(),
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

  /// Retrieves a token for federation.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [DuplicateResourceException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  Future<GetFederationTokenResponse> getFederationToken({
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  ///
  /// Parameter [historicalMetrics] :
  /// The metrics to retrieve. Specify the name, unit, and statistic for each
  /// metric. The following historical metrics are available. For a description
  /// of each metric, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical
  /// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
  /// <dl> <dt>ABANDON_TIME</dt> <dd>
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
  /// Unit: PERCENT
  ///
  /// Statistic: AVG
  ///
  /// Threshold: Only "Less than" comparisons are supported, with the following
  /// service level thresholds: 15, 20, 25, 30, 45, 60, 90, 120, 180, 240, 300,
  /// 600
  /// </dd> </dl>
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
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
  /// The only supported grouping is <code>QUEUE</code>.
  ///
  /// If no grouping is specified, a summary of metrics for all queues is
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetMetricDataResponse> getMetricData({
    @_s.required DateTime endTime,
    @_s.required Filters filters,
    @_s.required List<HistoricalMetric> historicalMetrics,
    @_s.required String instanceId,
    @_s.required DateTime startTime,
    List<Grouping> groupings,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(filters, 'filters');
    ArgumentError.checkNotNull(historicalMetrics, 'historicalMetrics');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
        'Groupings': groupings.map((e) => e?.toValue() ?? '').toList(),
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListApprovedOriginsResponse> listApprovedOrigins({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [contactFlowTypes] :
  /// The type of contact flow.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListContactFlowsResponse> listContactFlows({
    @_s.required String instanceId,
    List<ContactFlowType> contactFlowTypes,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (contactFlowTypes != null)
        'contactFlowTypes':
            contactFlowTypes.map((e) => e?.toValue() ?? '').toList(),
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListHoursOfOperationsResponse> listHoursOfOperations({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListInstanceAttributesResponse> listInstanceAttributes({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListInstanceStorageConfigsResponse> listInstanceStorageConfigs({
    @_s.required String instanceId,
    @_s.required InstanceStorageResourceType resourceType,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
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
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListInstancesResponse> listInstances({
    int maxResults,
    String nextToken,
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Provides summary information about the AppIntegration associations for the
  /// specified Amazon Connect instance.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListIntegrationAssociationsResponse> listIntegrationAssociations({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
          '/instance/${Uri.encodeComponent(instanceId)}/integration-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIntegrationAssociationsResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Returns a paginated list of all the Lambda functions that show up in the
  /// drop-down options in the relevant contact flow blocks.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListLambdaFunctionsResponse> listLambdaFunctions({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListLexBotsResponse> listLexBots({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
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
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
    List<PhoneNumberCountryCode> phoneNumberCountryCodes,
    List<PhoneNumberType> phoneNumberTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
            phoneNumberCountryCodes.map((e) => e?.toValue() ?? '').toList(),
      if (phoneNumberTypes != null)
        'phoneNumberTypes':
            phoneNumberTypes.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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

  /// Provides information about the queues for the specified Amazon Connect
  /// instance.
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [queueTypes] :
  /// The type of queue.
  Future<ListQueuesResponse> listQueues({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
    List<QueueType> queueTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
        'queueTypes': queueTypes.map((e) => e?.toValue() ?? '').toList(),
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
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
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
    List<QuickConnectType> quickConnectTypes,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
        'QuickConnectTypes':
            quickConnectTypes.map((e) => e?.toValue() ?? '').toList(),
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

  /// List the queues associated with a routing profile.
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
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListRoutingProfileQueuesResponse> listRoutingProfileQueues({
    @_s.required String instanceId,
    @_s.required String routingProfileId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListRoutingProfilesResponse> listRoutingProfiles({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSecurityKeysResponse> listSecurityKeys({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListSecurityProfilesResponse> listSecurityProfiles({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String resourceArn,
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// List the use cases.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [integrationAssociationId] :
  /// The identifier for the integration association.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUseCasesResponse> listUseCases({
    @_s.required String instanceId,
    @_s.required String integrationAssociationId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        integrationAssociationId, 'integrationAssociationId');
    _s.validateStringLength(
      'integrationAssociationId',
      integrationAssociationId,
      1,
      200,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUserHierarchyGroupsResponse> listUserHierarchyGroups({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListUsersResponse> listUsers({
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<void> resumeContactRecording({
    @_s.required String contactId,
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    return ResumeContactRecordingResponse.fromJson(response);
  }

  /// Initiates a contact flow to start a new chat for the customer. Response of
  /// this API provides a token required to obtain credentials from the <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// API in the Amazon Connect Participant Service.
  ///
  /// When a new chat contact is successfully created, clients need to subscribe
  /// to the participant’s connection for the created chat within 5 minutes.
  /// This is achieved by invoking <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>
  /// with WEBSOCKET and CONNECTION_CREDENTIALS.
  ///
  /// A 429 error occurs in two situations:
  ///
  /// <ul>
  /// <li>
  /// API rate limit is exceeded. API TPS throttling returns a
  /// <code>TooManyRequests</code> exception from the API Gateway.
  /// </li>
  /// <li>
  /// The <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html">quota
  /// for concurrent active chats</a> is exceeded. Active chat throttling
  /// returns a <code>LimitExceededException</code>.
  /// </li>
  /// </ul>
  /// For more information about how chat works, see <a
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [participantDetails] :
  /// Information identifying the participant.
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
  /// Parameter [initialMessage] :
  /// The initial message to be sent to the newly created chat.
  Future<StartChatContactResponse> startChatContact({
    @_s.required String contactFlowId,
    @_s.required String instanceId,
    @_s.required ParticipantDetails participantDetails,
    Map<String, String> attributes,
    String clientToken,
    ChatMessage initialMessage,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(participantDetails, 'participantDetails');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'InstanceId': instanceId,
      'ParticipantDetails': participantDetails,
      if (attributes != null) 'Attributes': attributes,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (initialMessage != null) 'InitialMessage': initialMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/chat',
      exceptionFnMap: _exceptionFns,
    );
    return StartChatContactResponse.fromJson(response);
  }

  /// This API starts recording the contact when the agent joins the call.
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [voiceRecordingConfiguration] :
  /// Who is being recorded.
  Future<void> startContactRecording({
    @_s.required String contactId,
    @_s.required String initialContactId,
    @_s.required String instanceId,
    @_s.required VoiceRecordingConfiguration voiceRecordingConfiguration,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    return StartContactRecordingResponse.fromJson(response);
  }

  /// This API places an outbound call to a contact, and then initiates the
  /// contact flow. It performs the actions in the contact flow that's specified
  /// (in <code>ContactFlowId</code>).
  ///
  /// Agents are not involved in initiating the outbound API (that is, dialing
  /// the contact). If the contact flow places an outbound call to a contact,
  /// and then puts the contact in queue, that's when the call is routed to the
  /// agent, like any other inbound case.
  ///
  /// There is a 60 second dialing timeout for this operation. If the call is
  /// not connected after 60 seconds, it fails.
  /// <note>
  /// UK numbers with a 447 prefix are not allowed by default. Before you can
  /// dial these UK mobile numbers, you must submit a service quota increase
  /// request. For more information, see <a
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
  /// The identifier of the Amazon Connect instance.
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
  /// idempotency of the request. The token is valid for 7 days after creation.
  /// If a contact is already started, the contact ID is returned. If the
  /// contact is disconnected, a new contact is started.
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
  Future<StartOutboundVoiceContactResponse> startOutboundVoiceContact({
    @_s.required String contactFlowId,
    @_s.required String destinationPhoneNumber,
    @_s.required String instanceId,
    Map<String, String> attributes,
    String clientToken,
    String queueId,
    String sourcePhoneNumber,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        destinationPhoneNumber, 'destinationPhoneNumber');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'DestinationPhoneNumber': destinationPhoneNumber,
      'InstanceId': instanceId,
      if (attributes != null) 'Attributes': attributes,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (queueId != null) 'QueueId': queueId,
      if (sourcePhoneNumber != null) 'SourcePhoneNumber': sourcePhoneNumber,
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
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
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
  /// Parameter [description] :
  /// A description of the task that is shown to an agent in the Contact Control
  /// Panel (CCP).
  ///
  /// Parameter [previousContactId] :
  /// The identifier of the previous chat, voice, or task contact.
  ///
  /// Parameter [references] :
  /// A formatted URL that is shown to an agent in the Contact Control Panel
  /// (CCP).
  Future<StartTaskContactResponse> startTaskContact({
    @_s.required String contactFlowId,
    @_s.required String instanceId,
    @_s.required String name,
    Map<String, String> attributes,
    String clientToken,
    String description,
    String previousContactId,
    Map<String, Reference> references,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      500,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      4096,
    );
    _s.validateStringLength(
      'previousContactId',
      previousContactId,
      1,
      256,
    );
    final $payload = <String, dynamic>{
      'ContactFlowId': contactFlowId,
      'InstanceId': instanceId,
      'Name': name,
      if (attributes != null) 'Attributes': attributes,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (previousContactId != null) 'PreviousContactId': previousContactId,
      if (references != null) 'References': references,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/contact/task',
      exceptionFnMap: _exceptionFns,
    );
    return StartTaskContactResponse.fromJson(response);
  }

  /// Ends the specified contact.
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
  /// The identifier of the Amazon Connect instance.
  Future<void> stopContact({
    @_s.required String contactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    return StopContactResponse.fromJson(response);
  }

  /// When a contact is being recorded, this API stops recording the call.
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
  /// The identifier of the Amazon Connect instance.
  Future<void> stopContactRecording({
    @_s.required String contactId,
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    return StopContactRecordingResponse.fromJson(response);
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
  /// The identifier of the Amazon Connect instance.
  Future<void> suspendContactRecording({
    @_s.required String contactId,
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    return SuspendContactRecordingResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// The supported resource types are users, routing profiles, quick connects,
  /// and contact flows.
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates the contact attributes associated with the specified
  /// contact.
  ///
  /// You can add or update attributes for both ongoing and completed contacts.
  /// For example, you can update the customer's name or the reason the customer
  /// called while the call is active, or add notes about steps that the agent
  /// took during the call that are displayed to the next agent that takes the
  /// call. You can also update attributes for a contact using data from your
  /// CRM application and save the data with the contact in Amazon Connect. You
  /// could also flag calls for additional analysis, such as legal review or
  /// identifying abusive callers.
  ///
  /// Contact attributes are available in Amazon Connect for 24 months, and are
  /// then deleted.
  ///
  /// <b>Important:</b> You cannot use the operation to update attributes for
  /// contacts that occurred prior to the release of the API, September 12,
  /// 2018. You can update attributes only for contacts that started after the
  /// release of the API. If you attempt to update attributes for a contact that
  /// occurred prior to the release of the API, a 400 error is returned. This
  /// applies also to queued callbacks that were initiated prior to the release
  /// of the API but are still active in your instance.
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
  /// The identifier of the Amazon Connect instance.
  Future<void> updateContactAttributes({
    @_s.required Map<String, String> attributes,
    @_s.required String initialContactId,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(attributes, 'attributes');
    ArgumentError.checkNotNull(initialContactId, 'initialContactId');
    _s.validateStringLength(
      'initialContactId',
      initialContactId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    return UpdateContactAttributesResponse.fromJson(response);
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
    @_s.required String contactFlowId,
    @_s.required String content,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
    @_s.required String contactFlowId,
    @_s.required String instanceId,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(contactFlowId, 'contactFlowId');
    _s.validateStringLength(
      'contactFlowId',
      contactFlowId,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1152921504606846976,
    );
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
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [value] :
  /// The value for the attribute. Maximum character limit is 100.
  Future<void> updateInstanceAttribute({
    @_s.required InstanceAttributeType attributeType,
    @_s.required String instanceId,
    @_s.required String value,
  }) async {
    ArgumentError.checkNotNull(attributeType, 'attributeType');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(value, 'value');
    _s.validateStringLength(
      'value',
      value,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [resourceType] :
  /// A valid resource type.
  Future<void> updateInstanceStorageConfig({
    @_s.required String associationId,
    @_s.required String instanceId,
    @_s.required InstanceStorageResourceType resourceType,
    @_s.required InstanceStorageConfig storageConfig,
  }) async {
    ArgumentError.checkNotNull(associationId, 'associationId');
    _s.validateStringLength(
      'associationId',
      associationId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(storageConfig, 'storageConfig');
    final $query = <String, List<String>>{
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the configuration settings for the specified quick connect.
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
  /// Parameter [quickConnectConfig] :
  /// Information about the configuration settings for the quick connect.
  ///
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  Future<void> updateQuickConnectConfig({
    @_s.required String instanceId,
    @_s.required QuickConnectConfig quickConnectConfig,
    @_s.required String quickConnectId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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

  /// This API is in preview release for Amazon Connect and is subject to
  /// change.
  ///
  /// Updates the name and description of a quick connect. The request accepts
  /// the following data in JSON format. At least Name or Description must be
  /// provided.
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
  /// Parameter [quickConnectId] :
  /// The identifier for the quick connect.
  ///
  /// Parameter [description] :
  /// The description of the quick connect.
  ///
  /// Parameter [name] :
  /// The name of the quick connect.
  Future<void> updateQuickConnectName({
    @_s.required String instanceId,
    @_s.required String quickConnectId,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(quickConnectId, 'quickConnectId');
    _s.validateStringLength(
      'description',
      description,
      0,
      250,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      127,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [mediaConcurrencies] :
  /// The channels agents can handle in the Contact Control Panel (CCP).
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> updateRoutingProfileConcurrency({
    @_s.required String instanceId,
    @_s.required List<MediaConcurrency> mediaConcurrencies,
    @_s.required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> updateRoutingProfileDefaultOutboundQueue({
    @_s.required String defaultOutboundQueueId,
    @_s.required String instanceId,
    @_s.required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(
        defaultOutboundQueueId, 'defaultOutboundQueueId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
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
    @_s.required String instanceId,
    @_s.required String routingProfileId,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(routingProfileId, 'routingProfileId');
    _s.validateStringLength(
      'description',
      description,
      1,
      250,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      127,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [queueConfigs] :
  /// The queues to be updated for this routing profile. Queues must first be
  /// associated to the routing profile. You can do this using
  /// AssociateRoutingProfileQueues.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile.
  Future<void> updateRoutingProfileQueues({
    @_s.required String instanceId,
    @_s.required List<RoutingProfileQueueConfig> queueConfigs,
    @_s.required String routingProfileId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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

  /// Assigns the specified hierarchy group to the specified user.
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
  /// Parameter [userId] :
  /// The identifier of the user account.
  ///
  /// Parameter [hierarchyGroupId] :
  /// The identifier of the hierarchy group.
  Future<void> updateUserHierarchy({
    @_s.required String instanceId,
    @_s.required String userId,
    String hierarchyGroupId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [name] :
  /// The name of the hierarchy group. Must not be more than 100 characters.
  Future<void> updateUserHierarchyGroupName({
    @_s.required String hierarchyGroupId,
    @_s.required String instanceId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(hierarchyGroupId, 'hierarchyGroupId');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  Future<void> updateUserHierarchyStructure({
    @_s.required HierarchyStructureUpdate hierarchyStructure,
    @_s.required String instanceId,
  }) async {
    ArgumentError.checkNotNull(hierarchyStructure, 'hierarchyStructure');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// Someone with the ability to invoke <code>UpdateUserIndentityInfo</code>
  /// can change the login credentials of other users by changing their email
  /// address. This poses a security risk to your organization. They can change
  /// the email address of a user to the attacker's email address, and then
  /// reset the password through email. We strongly recommend limiting who has
  /// the ability to invoke <code>UpdateUserIndentityInfo</code>. For more
  /// information, see <a
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserIdentityInfo({
    @_s.required UserIdentityInfo identityInfo,
    @_s.required String instanceId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(identityInfo, 'identityInfo');
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [phoneConfig] :
  /// Information about phone configuration settings for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserPhoneConfig({
    @_s.required String instanceId,
    @_s.required UserPhoneConfig phoneConfig,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [routingProfileId] :
  /// The identifier of the routing profile for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserRoutingProfile({
    @_s.required String instanceId,
    @_s.required String routingProfileId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [securityProfileIds] :
  /// The identifiers of the security profiles for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user account.
  Future<void> updateUserSecurityProfiles({
    @_s.required String instanceId,
    @_s.required List<String> securityProfileIds,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      100,
      isRequired: true,
    );
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateInstanceStorageConfigResponse {
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  AssociateInstanceStorageConfigResponse({
    this.associationId,
  });
  factory AssociateInstanceStorageConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateInstanceStorageConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSecurityKeyResponse {
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  AssociateSecurityKeyResponse({
    this.associationId,
  });
  factory AssociateSecurityKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateSecurityKeyResponseFromJson(json);
}

/// A toggle for an individual feature at the instance level.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Attribute {
  /// The type of attribute.
  @_s.JsonKey(name: 'AttributeType')
  final InstanceAttributeType attributeType;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  Attribute({
    this.attributeType,
    this.value,
  });
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
}

enum Channel {
  @_s.JsonValue('VOICE')
  voice,
  @_s.JsonValue('CHAT')
  chat,
  @_s.JsonValue('TASK')
  task,
}

/// A chat message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ChatMessage {
  /// The content of the chat message.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The type of the content. Supported types are text/plain.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  ChatMessage({
    @_s.required this.content,
    @_s.required this.contentType,
  });
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}

enum Comparison {
  @_s.JsonValue('LT')
  lt,
}

/// Contains information about a contact flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactFlow {
  /// The Amazon Resource Name (ARN) of the contact flow.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The content of the contact flow.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The description of the contact flow.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the contact flow.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the contact flow.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// One or more tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The type of the contact flow. For descriptions of the available types, see
  /// <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types">Choose
  /// a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.
  @_s.JsonKey(name: 'Type')
  final ContactFlowType type;

  ContactFlow({
    this.arn,
    this.content,
    this.description,
    this.id,
    this.name,
    this.tags,
    this.type,
  });
  factory ContactFlow.fromJson(Map<String, dynamic> json) =>
      _$ContactFlowFromJson(json);
}

/// Contains summary information about a contact flow.
///
/// You can also create and update contact flows using the <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html">Amazon
/// Connect Flow language</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactFlowSummary {
  /// The Amazon Resource Name (ARN) of the contact flow.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The type of contact flow.
  @_s.JsonKey(name: 'ContactFlowType')
  final ContactFlowType contactFlowType;

  /// The identifier of the contact flow.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the contact flow.
  @_s.JsonKey(name: 'Name')
  final String name;

  ContactFlowSummary({
    this.arn,
    this.contactFlowType,
    this.id,
    this.name,
  });
  factory ContactFlowSummary.fromJson(Map<String, dynamic> json) =>
      _$ContactFlowSummaryFromJson(json);
}

enum ContactFlowType {
  @_s.JsonValue('CONTACT_FLOW')
  contactFlow,
  @_s.JsonValue('CUSTOMER_QUEUE')
  customerQueue,
  @_s.JsonValue('CUSTOMER_HOLD')
  customerHold,
  @_s.JsonValue('CUSTOMER_WHISPER')
  customerWhisper,
  @_s.JsonValue('AGENT_HOLD')
  agentHold,
  @_s.JsonValue('AGENT_WHISPER')
  agentWhisper,
  @_s.JsonValue('OUTBOUND_WHISPER')
  outboundWhisper,
  @_s.JsonValue('AGENT_TRANSFER')
  agentTransfer,
  @_s.JsonValue('QUEUE_TRANSFER')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContactFlowResponse {
  /// The Amazon Resource Name (ARN) of the contact flow.
  @_s.JsonKey(name: 'ContactFlowArn')
  final String contactFlowArn;

  /// The identifier of the contact flow.
  @_s.JsonKey(name: 'ContactFlowId')
  final String contactFlowId;

  CreateContactFlowResponse({
    this.contactFlowArn,
    this.contactFlowId,
  });
  factory CreateContactFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateContactFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstanceResponse {
  /// The Amazon Resource Name (ARN) of the instance.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier for the instance.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateInstanceResponse({
    this.arn,
    this.id,
  });
  factory CreateInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIntegrationAssociationResponse {
  /// The Amazon Resource Name (ARN) for the association.
  @_s.JsonKey(name: 'IntegrationAssociationArn')
  final String integrationAssociationArn;

  /// The identifier for the association.
  @_s.JsonKey(name: 'IntegrationAssociationId')
  final String integrationAssociationId;

  CreateIntegrationAssociationResponse({
    this.integrationAssociationArn,
    this.integrationAssociationId,
  });
  factory CreateIntegrationAssociationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateIntegrationAssociationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateQuickConnectResponse {
  /// The Amazon Resource Name (ARN) for the quick connect.
  @_s.JsonKey(name: 'QuickConnectARN')
  final String quickConnectARN;

  /// The identifier for the quick connect.
  @_s.JsonKey(name: 'QuickConnectId')
  final String quickConnectId;

  CreateQuickConnectResponse({
    this.quickConnectARN,
    this.quickConnectId,
  });
  factory CreateQuickConnectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateQuickConnectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRoutingProfileResponse {
  /// The Amazon Resource Name (ARN) of the routing profile.
  @_s.JsonKey(name: 'RoutingProfileArn')
  final String routingProfileArn;

  /// The identifier of the routing profile.
  @_s.JsonKey(name: 'RoutingProfileId')
  final String routingProfileId;

  CreateRoutingProfileResponse({
    this.routingProfileArn,
    this.routingProfileId,
  });
  factory CreateRoutingProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoutingProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUseCaseResponse {
  /// The Amazon Resource Name (ARN) for the use case.
  @_s.JsonKey(name: 'UseCaseArn')
  final String useCaseArn;

  /// The identifier of the use case.
  @_s.JsonKey(name: 'UseCaseId')
  final String useCaseId;

  CreateUseCaseResponse({
    this.useCaseArn,
    this.useCaseId,
  });
  factory CreateUseCaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUseCaseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserHierarchyGroupResponse {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  @_s.JsonKey(name: 'HierarchyGroupArn')
  final String hierarchyGroupArn;

  /// The identifier of the hierarchy group.
  @_s.JsonKey(name: 'HierarchyGroupId')
  final String hierarchyGroupId;

  CreateUserHierarchyGroupResponse({
    this.hierarchyGroupArn,
    this.hierarchyGroupId,
  });
  factory CreateUserHierarchyGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUserHierarchyGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  /// The Amazon Resource Name (ARN) of the user account.
  @_s.JsonKey(name: 'UserArn')
  final String userArn;

  /// The identifier of the user account.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  CreateUserResponse({
    this.userArn,
    this.userId,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

/// Contains credentials to use for federation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Credentials {
  /// An access token generated for a federated user to access Amazon Connect.
  @_s.JsonKey(name: 'AccessToken')
  final String accessToken;

  /// A token generated with an expiration time for the session a user is logged
  /// in to Amazon Connect.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'AccessTokenExpiration')
  final DateTime accessTokenExpiration;

  /// Renews a token generated for a user to access the Amazon Connect instance.
  @_s.JsonKey(name: 'RefreshToken')
  final String refreshToken;

  /// Renews the expiration timer for a generated token.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RefreshTokenExpiration')
  final DateTime refreshTokenExpiration;

  Credentials({
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
  });
  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}

/// Contains information about a real-time metric. For a description of each
/// metric, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html">Real-time
/// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CurrentMetric {
  /// The name of the metric.
  @_s.JsonKey(name: 'Name')
  final CurrentMetricName name;

  /// The unit for the metric.
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  CurrentMetric({
    this.name,
    this.unit,
  });
  factory CurrentMetric.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentMetricToJson(this);
}

/// Contains the data for a real-time metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CurrentMetricData {
  /// Information about the metric.
  @_s.JsonKey(name: 'Metric')
  final CurrentMetric metric;

  /// The value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  CurrentMetricData({
    this.metric,
    this.value,
  });
  factory CurrentMetricData.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricDataFromJson(json);
}

/// The current metric names.
enum CurrentMetricName {
  @_s.JsonValue('AGENTS_ONLINE')
  agentsOnline,
  @_s.JsonValue('AGENTS_AVAILABLE')
  agentsAvailable,
  @_s.JsonValue('AGENTS_ON_CALL')
  agentsOnCall,
  @_s.JsonValue('AGENTS_NON_PRODUCTIVE')
  agentsNonProductive,
  @_s.JsonValue('AGENTS_AFTER_CONTACT_WORK')
  agentsAfterContactWork,
  @_s.JsonValue('AGENTS_ERROR')
  agentsError,
  @_s.JsonValue('AGENTS_STAFFED')
  agentsStaffed,
  @_s.JsonValue('CONTACTS_IN_QUEUE')
  contactsInQueue,
  @_s.JsonValue('OLDEST_CONTACT_AGE')
  oldestContactAge,
  @_s.JsonValue('CONTACTS_SCHEDULED')
  contactsScheduled,
  @_s.JsonValue('AGENTS_ON_CONTACT')
  agentsOnContact,
  @_s.JsonValue('SLOTS_ACTIVE')
  slotsActive,
  @_s.JsonValue('SLOTS_AVAILABLE')
  slotsAvailable,
}

/// Contains information about a set of real-time metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CurrentMetricResult {
  /// The set of metrics.
  @_s.JsonKey(name: 'Collections')
  final List<CurrentMetricData> collections;

  /// The dimensions for the metrics.
  @_s.JsonKey(name: 'Dimensions')
  final Dimensions dimensions;

  CurrentMetricResult({
    this.collections,
    this.dimensions,
  });
  factory CurrentMetricResult.fromJson(Map<String, dynamic> json) =>
      _$CurrentMetricResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeContactFlowResponse {
  /// Information about the contact flow.
  @_s.JsonKey(name: 'ContactFlow')
  final ContactFlow contactFlow;

  DescribeContactFlowResponse({
    this.contactFlow,
  });
  factory DescribeContactFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeContactFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstanceAttributeResponse {
  /// The type of attribute.
  @_s.JsonKey(name: 'Attribute')
  final Attribute attribute;

  DescribeInstanceAttributeResponse({
    this.attribute,
  });
  factory DescribeInstanceAttributeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstanceAttributeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstanceResponse {
  /// The name of the instance.
  @_s.JsonKey(name: 'Instance')
  final Instance instance;

  DescribeInstanceResponse({
    this.instance,
  });
  factory DescribeInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInstanceStorageConfigResponse {
  /// A valid storage type.
  @_s.JsonKey(name: 'StorageConfig')
  final InstanceStorageConfig storageConfig;

  DescribeInstanceStorageConfigResponse({
    this.storageConfig,
  });
  factory DescribeInstanceStorageConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInstanceStorageConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeQuickConnectResponse {
  /// Information about the quick connect.
  @_s.JsonKey(name: 'QuickConnect')
  final QuickConnect quickConnect;

  DescribeQuickConnectResponse({
    this.quickConnect,
  });
  factory DescribeQuickConnectResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeQuickConnectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRoutingProfileResponse {
  /// The routing profile.
  @_s.JsonKey(name: 'RoutingProfile')
  final RoutingProfile routingProfile;

  DescribeRoutingProfileResponse({
    this.routingProfile,
  });
  factory DescribeRoutingProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRoutingProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserHierarchyGroupResponse {
  /// Information about the hierarchy group.
  @_s.JsonKey(name: 'HierarchyGroup')
  final HierarchyGroup hierarchyGroup;

  DescribeUserHierarchyGroupResponse({
    this.hierarchyGroup,
  });
  factory DescribeUserHierarchyGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeUserHierarchyGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserHierarchyStructureResponse {
  /// Information about the hierarchy structure.
  @_s.JsonKey(name: 'HierarchyStructure')
  final HierarchyStructure hierarchyStructure;

  DescribeUserHierarchyStructureResponse({
    this.hierarchyStructure,
  });
  factory DescribeUserHierarchyStructureResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeUserHierarchyStructureResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// Information about the user account and configuration settings.
  @_s.JsonKey(name: 'User')
  final User user;

  DescribeUserResponse({
    this.user,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

/// Contains information about the dimensions for a set of metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dimensions {
  /// The channel used for grouping and filters.
  @_s.JsonKey(name: 'Channel')
  final Channel channel;

  /// Information about the queue for which metrics are returned.
  @_s.JsonKey(name: 'Queue')
  final QueueReference queue;

  Dimensions({
    this.channel,
    this.queue,
  });
  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}

enum DirectoryType {
  @_s.JsonValue('SAML')
  saml,
  @_s.JsonValue('CONNECT_MANAGED')
  connectManaged,
  @_s.JsonValue('EXISTING_DIRECTORY')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfig {
  /// The type of encryption.
  @_s.JsonKey(name: 'EncryptionType')
  final EncryptionType encryptionType;

  /// The identifier of the encryption key.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  EncryptionConfig({
    @_s.required this.encryptionType,
    @_s.required this.keyId,
  });
  factory EncryptionConfig.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigToJson(this);
}

enum EncryptionType {
  @_s.JsonValue('KMS')
  kms,
}

/// Contains the filter to apply when retrieving metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filters {
  /// The channel to use to filter the metrics.
  @_s.JsonKey(name: 'Channels')
  final List<Channel> channels;

  /// The queues to use to filter the metrics. You can specify up to 100 queues
  /// per request.
  @_s.JsonKey(name: 'Queues')
  final List<String> queues;

  Filters({
    this.channels,
    this.queues,
  });
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactAttributesResponse {
  /// Information about the attributes.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  GetContactAttributesResponse({
    this.attributes,
  });
  factory GetContactAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContactAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCurrentMetricDataResponse {
  /// The time at which the metrics were retrieved and cached for pagination.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DataSnapshotTime')
  final DateTime dataSnapshotTime;

  /// Information about the real-time metrics.
  @_s.JsonKey(name: 'MetricResults')
  final List<CurrentMetricResult> metricResults;

  /// If there are additional results, this is the token for the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCurrentMetricDataResponse({
    this.dataSnapshotTime,
    this.metricResults,
    this.nextToken,
  });
  factory GetCurrentMetricDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentMetricDataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFederationTokenResponse {
  /// The credentials to use for federation.
  @_s.JsonKey(name: 'Credentials')
  final Credentials credentials;

  GetFederationTokenResponse({
    this.credentials,
  });
  factory GetFederationTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFederationTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMetricDataResponse {
  /// Information about the historical metrics.
  ///
  /// If no grouping is specified, a summary of metric data is returned.
  @_s.JsonKey(name: 'MetricResults')
  final List<HistoricalMetricResult> metricResults;

  /// If there are additional results, this is the token for the next set of
  /// results.
  ///
  /// The token expires after 5 minutes from the time it is created. Subsequent
  /// requests that use the token must use the same request parameters as the
  /// request that generated the token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetMetricDataResponse({
    this.metricResults,
    this.nextToken,
  });
  factory GetMetricDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMetricDataResponseFromJson(json);
}

enum Grouping {
  @_s.JsonValue('QUEUE')
  queue,
  @_s.JsonValue('CHANNEL')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a hierarchy group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyGroup {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Information about the levels in the hierarchy group.
  @_s.JsonKey(name: 'HierarchyPath')
  final HierarchyPath hierarchyPath;

  /// The identifier of the hierarchy group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identifier of the level in the hierarchy group.
  @_s.JsonKey(name: 'LevelId')
  final String levelId;

  /// The name of the hierarchy group.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyGroup({
    this.arn,
    this.hierarchyPath,
    this.id,
    this.levelId,
    this.name,
  });
  factory HierarchyGroup.fromJson(Map<String, dynamic> json) =>
      _$HierarchyGroupFromJson(json);
}

/// Contains summary information about a hierarchy group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyGroupSummary {
  /// The Amazon Resource Name (ARN) of the hierarchy group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the hierarchy group.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the hierarchy group.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyGroupSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory HierarchyGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$HierarchyGroupSummaryFromJson(json);
}

/// Contains information about a hierarchy level.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyLevel {
  /// The Amazon Resource Name (ARN) of the hierarchy level.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the hierarchy level.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the hierarchy level.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyLevel({
    this.arn,
    this.id,
    this.name,
  });
  factory HierarchyLevel.fromJson(Map<String, dynamic> json) =>
      _$HierarchyLevelFromJson(json);
}

/// Contains information about the hierarchy level to update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HierarchyLevelUpdate {
  /// The name of the user hierarchy level. Must not be more than 50 characters.
  @_s.JsonKey(name: 'Name')
  final String name;

  HierarchyLevelUpdate({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$HierarchyLevelUpdateToJson(this);
}

/// Contains information about the levels of a hierarchy group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyPath {
  /// Information about level five.
  @_s.JsonKey(name: 'LevelFive')
  final HierarchyGroupSummary levelFive;

  /// Information about level four.
  @_s.JsonKey(name: 'LevelFour')
  final HierarchyGroupSummary levelFour;

  /// Information about level one.
  @_s.JsonKey(name: 'LevelOne')
  final HierarchyGroupSummary levelOne;

  /// Information about level three.
  @_s.JsonKey(name: 'LevelThree')
  final HierarchyGroupSummary levelThree;

  /// Information about level two.
  @_s.JsonKey(name: 'LevelTwo')
  final HierarchyGroupSummary levelTwo;

  HierarchyPath({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });
  factory HierarchyPath.fromJson(Map<String, dynamic> json) =>
      _$HierarchyPathFromJson(json);
}

/// Contains information about a hierarchy structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HierarchyStructure {
  /// Information about level five.
  @_s.JsonKey(name: 'LevelFive')
  final HierarchyLevel levelFive;

  /// Information about level four.
  @_s.JsonKey(name: 'LevelFour')
  final HierarchyLevel levelFour;

  /// Information about level one.
  @_s.JsonKey(name: 'LevelOne')
  final HierarchyLevel levelOne;

  /// Information about level three.
  @_s.JsonKey(name: 'LevelThree')
  final HierarchyLevel levelThree;

  /// Information about level two.
  @_s.JsonKey(name: 'LevelTwo')
  final HierarchyLevel levelTwo;

  HierarchyStructure({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });
  factory HierarchyStructure.fromJson(Map<String, dynamic> json) =>
      _$HierarchyStructureFromJson(json);
}

/// Contains information about the level hierarchy to update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HierarchyStructureUpdate {
  /// The update for level five.
  @_s.JsonKey(name: 'LevelFive')
  final HierarchyLevelUpdate levelFive;

  /// The update for level four.
  @_s.JsonKey(name: 'LevelFour')
  final HierarchyLevelUpdate levelFour;

  /// The update for level one.
  @_s.JsonKey(name: 'LevelOne')
  final HierarchyLevelUpdate levelOne;

  /// The update for level three.
  @_s.JsonKey(name: 'LevelThree')
  final HierarchyLevelUpdate levelThree;

  /// The update for level two.
  @_s.JsonKey(name: 'LevelTwo')
  final HierarchyLevelUpdate levelTwo;

  HierarchyStructureUpdate({
    this.levelFive,
    this.levelFour,
    this.levelOne,
    this.levelThree,
    this.levelTwo,
  });
  Map<String, dynamic> toJson() => _$HierarchyStructureUpdateToJson(this);
}

/// Contains information about a historical metric. For a description of each
/// metric, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html">Historical
/// Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HistoricalMetric {
  /// The name of the metric.
  @_s.JsonKey(name: 'Name')
  final HistoricalMetricName name;

  /// The statistic for the metric.
  @_s.JsonKey(name: 'Statistic')
  final Statistic statistic;

  /// The threshold for the metric, used with service level metrics.
  @_s.JsonKey(name: 'Threshold')
  final Threshold threshold;

  /// The unit for the metric.
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  HistoricalMetric({
    this.name,
    this.statistic,
    this.threshold,
    this.unit,
  });
  factory HistoricalMetric.fromJson(Map<String, dynamic> json) =>
      _$HistoricalMetricFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricalMetricToJson(this);
}

/// Contains the data for a historical metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HistoricalMetricData {
  /// Information about the metric.
  @_s.JsonKey(name: 'Metric')
  final HistoricalMetric metric;

  /// The value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  HistoricalMetricData({
    this.metric,
    this.value,
  });
  factory HistoricalMetricData.fromJson(Map<String, dynamic> json) =>
      _$HistoricalMetricDataFromJson(json);
}

/// The historical metric names.
enum HistoricalMetricName {
  @_s.JsonValue('CONTACTS_QUEUED')
  contactsQueued,
  @_s.JsonValue('CONTACTS_HANDLED')
  contactsHandled,
  @_s.JsonValue('CONTACTS_ABANDONED')
  contactsAbandoned,
  @_s.JsonValue('CONTACTS_CONSULTED')
  contactsConsulted,
  @_s.JsonValue('CONTACTS_AGENT_HUNG_UP_FIRST')
  contactsAgentHungUpFirst,
  @_s.JsonValue('CONTACTS_HANDLED_INCOMING')
  contactsHandledIncoming,
  @_s.JsonValue('CONTACTS_HANDLED_OUTBOUND')
  contactsHandledOutbound,
  @_s.JsonValue('CONTACTS_HOLD_ABANDONS')
  contactsHoldAbandons,
  @_s.JsonValue('CONTACTS_TRANSFERRED_IN')
  contactsTransferredIn,
  @_s.JsonValue('CONTACTS_TRANSFERRED_OUT')
  contactsTransferredOut,
  @_s.JsonValue('CONTACTS_TRANSFERRED_IN_FROM_QUEUE')
  contactsTransferredInFromQueue,
  @_s.JsonValue('CONTACTS_TRANSFERRED_OUT_FROM_QUEUE')
  contactsTransferredOutFromQueue,
  @_s.JsonValue('CONTACTS_MISSED')
  contactsMissed,
  @_s.JsonValue('CALLBACK_CONTACTS_HANDLED')
  callbackContactsHandled,
  @_s.JsonValue('API_CONTACTS_HANDLED')
  apiContactsHandled,
  @_s.JsonValue('OCCUPANCY')
  occupancy,
  @_s.JsonValue('HANDLE_TIME')
  handleTime,
  @_s.JsonValue('AFTER_CONTACT_WORK_TIME')
  afterContactWorkTime,
  @_s.JsonValue('QUEUED_TIME')
  queuedTime,
  @_s.JsonValue('ABANDON_TIME')
  abandonTime,
  @_s.JsonValue('QUEUE_ANSWER_TIME')
  queueAnswerTime,
  @_s.JsonValue('HOLD_TIME')
  holdTime,
  @_s.JsonValue('INTERACTION_TIME')
  interactionTime,
  @_s.JsonValue('INTERACTION_AND_HOLD_TIME')
  interactionAndHoldTime,
  @_s.JsonValue('SERVICE_LEVEL')
  serviceLevel,
}

/// Contains information about the historical metrics retrieved.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HistoricalMetricResult {
  /// The set of metrics.
  @_s.JsonKey(name: 'Collections')
  final List<HistoricalMetricData> collections;

  /// The dimension for the metrics.
  @_s.JsonKey(name: 'Dimensions')
  final Dimensions dimensions;

  HistoricalMetricResult({
    this.collections,
    this.dimensions,
  });
  factory HistoricalMetricResult.fromJson(Map<String, dynamic> json) =>
      _$HistoricalMetricResultFromJson(json);
}

/// Contains summary information about hours of operation for a contact center.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HoursOfOperationSummary {
  /// The Amazon Resource Name (ARN) of the hours of operation.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the hours of operation.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the hours of operation.
  @_s.JsonKey(name: 'Name')
  final String name;

  HoursOfOperationSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory HoursOfOperationSummary.fromJson(Map<String, dynamic> json) =>
      _$HoursOfOperationSummaryFromJson(json);
}

/// The Amazon Connect instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// The Amazon Resource Name (ARN) of the instance.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// When the instance was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The identifier of the Amazon Connect instance.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identity management type.
  @_s.JsonKey(name: 'IdentityManagementType')
  final DirectoryType identityManagementType;

  /// Whether inbound calls are enabled.
  @_s.JsonKey(name: 'InboundCallsEnabled')
  final bool inboundCallsEnabled;

  /// The alias of instance.
  @_s.JsonKey(name: 'InstanceAlias')
  final String instanceAlias;

  /// The state of the instance.
  @_s.JsonKey(name: 'InstanceStatus')
  final InstanceStatus instanceStatus;

  /// Whether outbound calls are enabled.
  @_s.JsonKey(name: 'OutboundCallsEnabled')
  final bool outboundCallsEnabled;

  /// The service role of the instance.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// Relevant details why the instance was not successfully created.
  @_s.JsonKey(name: 'StatusReason')
  final InstanceStatusReason statusReason;

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
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

enum InstanceAttributeType {
  @_s.JsonValue('INBOUND_CALLS')
  inboundCalls,
  @_s.JsonValue('OUTBOUND_CALLS')
  outboundCalls,
  @_s.JsonValue('CONTACTFLOW_LOGS')
  contactflowLogs,
  @_s.JsonValue('CONTACT_LENS')
  contactLens,
  @_s.JsonValue('AUTO_RESOLVE_BEST_VOICES')
  autoResolveBestVoices,
  @_s.JsonValue('USE_CUSTOM_TTS_VOICES')
  useCustomTtsVoices,
  @_s.JsonValue('EARLY_MEDIA')
  earlyMedia,
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum InstanceStatus {
  @_s.JsonValue('CREATION_IN_PROGRESS')
  creationInProgress,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('CREATION_FAILED')
  creationFailed,
}

/// Relevant details why the instance was not successfully created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceStatusReason {
  /// The message.
  @_s.JsonKey(name: 'Message')
  final String message;

  InstanceStatusReason({
    this.message,
  });
  factory InstanceStatusReason.fromJson(Map<String, dynamic> json) =>
      _$InstanceStatusReasonFromJson(json);
}

/// The storage configuration for the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceStorageConfig {
  /// A valid storage type.
  @_s.JsonKey(name: 'StorageType')
  final StorageType storageType;

  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// The configuration of the Kinesis Firehose delivery stream.
  @_s.JsonKey(name: 'KinesisFirehoseConfig')
  final KinesisFirehoseConfig kinesisFirehoseConfig;

  /// The configuration of the Kinesis data stream.
  @_s.JsonKey(name: 'KinesisStreamConfig')
  final KinesisStreamConfig kinesisStreamConfig;

  /// The configuration of the Kinesis video stream.
  @_s.JsonKey(name: 'KinesisVideoStreamConfig')
  final KinesisVideoStreamConfig kinesisVideoStreamConfig;

  /// The S3 configuration.
  @_s.JsonKey(name: 'S3Config')
  final S3Config s3Config;

  InstanceStorageConfig({
    @_s.required this.storageType,
    this.associationId,
    this.kinesisFirehoseConfig,
    this.kinesisStreamConfig,
    this.kinesisVideoStreamConfig,
    this.s3Config,
  });
  factory InstanceStorageConfig.fromJson(Map<String, dynamic> json) =>
      _$InstanceStorageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceStorageConfigToJson(this);
}

enum InstanceStorageResourceType {
  @_s.JsonValue('CHAT_TRANSCRIPTS')
  chatTranscripts,
  @_s.JsonValue('CALL_RECORDINGS')
  callRecordings,
  @_s.JsonValue('SCHEDULED_REPORTS')
  scheduledReports,
  @_s.JsonValue('MEDIA_STREAMS')
  mediaStreams,
  @_s.JsonValue('CONTACT_TRACE_RECORDS')
  contactTraceRecords,
  @_s.JsonValue('AGENT_EVENTS')
  agentEvents,
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceSummary {
  /// The Amazon Resource Name (ARN) of the instance.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// When the instance was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The identifier of the instance.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identity management type of the instance.
  @_s.JsonKey(name: 'IdentityManagementType')
  final DirectoryType identityManagementType;

  /// Whether inbound calls are enabled.
  @_s.JsonKey(name: 'InboundCallsEnabled')
  final bool inboundCallsEnabled;

  /// The alias of the instance.
  @_s.JsonKey(name: 'InstanceAlias')
  final String instanceAlias;

  /// The state of the instance.
  @_s.JsonKey(name: 'InstanceStatus')
  final InstanceStatus instanceStatus;

  /// Whether outbound calls are enabled.
  @_s.JsonKey(name: 'OutboundCallsEnabled')
  final bool outboundCallsEnabled;

  /// The service role of the instance.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

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
  factory InstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$InstanceSummaryFromJson(json);
}

/// Contains summary information about the associated AppIntegrations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IntegrationAssociationSummary {
  /// The identifier of the Amazon Connect instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The Amazon Resource Name (ARN) for the AppIntegration.
  @_s.JsonKey(name: 'IntegrationArn')
  final String integrationArn;

  /// The Amazon Resource Name (ARN) for the AppIntegration association.
  @_s.JsonKey(name: 'IntegrationAssociationArn')
  final String integrationAssociationArn;

  /// The identifier for the AppIntegration association.
  @_s.JsonKey(name: 'IntegrationAssociationId')
  final String integrationAssociationId;

  /// The integration type.
  @_s.JsonKey(name: 'IntegrationType')
  final IntegrationType integrationType;

  /// The user-provided, friendly name for the external application.
  @_s.JsonKey(name: 'SourceApplicationName')
  final String sourceApplicationName;

  /// The URL for the external application.
  @_s.JsonKey(name: 'SourceApplicationUrl')
  final String sourceApplicationUrl;

  /// The name of the source.
  @_s.JsonKey(name: 'SourceType')
  final SourceType sourceType;

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
  factory IntegrationAssociationSummary.fromJson(Map<String, dynamic> json) =>
      _$IntegrationAssociationSummaryFromJson(json);
}

enum IntegrationType {
  @_s.JsonValue('EVENT')
  event,
}

extension on IntegrationType {
  String toValue() {
    switch (this) {
      case IntegrationType.event:
        return 'EVENT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Configuration information of a Kinesis Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisFirehoseConfig {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  @_s.JsonKey(name: 'FirehoseArn')
  final String firehoseArn;

  KinesisFirehoseConfig({
    @_s.required this.firehoseArn,
  });
  factory KinesisFirehoseConfig.fromJson(Map<String, dynamic> json) =>
      _$KinesisFirehoseConfigFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisFirehoseConfigToJson(this);
}

/// Configuration information of a Kinesis data stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisStreamConfig {
  /// The Amazon Resource Name (ARN) of the data stream.
  @_s.JsonKey(name: 'StreamArn')
  final String streamArn;

  KinesisStreamConfig({
    @_s.required this.streamArn,
  });
  factory KinesisStreamConfig.fromJson(Map<String, dynamic> json) =>
      _$KinesisStreamConfigFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisStreamConfigToJson(this);
}

/// Configuration information of a Kinesis video stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisVideoStreamConfig {
  /// The encryption configuration.
  @_s.JsonKey(name: 'EncryptionConfig')
  final EncryptionConfig encryptionConfig;

  /// The prefix of the video stream.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  /// The number of hours data is retained in the stream. Kinesis Video Streams
  /// retains the data in a data store that is associated with the stream.
  ///
  /// The default value is 0, indicating that the stream does not persist data.
  @_s.JsonKey(name: 'RetentionPeriodHours')
  final int retentionPeriodHours;

  KinesisVideoStreamConfig({
    @_s.required this.encryptionConfig,
    @_s.required this.prefix,
    @_s.required this.retentionPeriodHours,
  });
  factory KinesisVideoStreamConfig.fromJson(Map<String, dynamic> json) =>
      _$KinesisVideoStreamConfigFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisVideoStreamConfigToJson(this);
}

/// Configuration information of an Amazon Lex bot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LexBot {
  /// The Region the Amazon Lex bot was created in.
  @_s.JsonKey(name: 'LexRegion')
  final String lexRegion;

  /// The name of the Amazon Lex bot.
  @_s.JsonKey(name: 'Name')
  final String name;

  LexBot({
    this.lexRegion,
    this.name,
  });
  factory LexBot.fromJson(Map<String, dynamic> json) => _$LexBotFromJson(json);

  Map<String, dynamic> toJson() => _$LexBotToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApprovedOriginsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The approved origins.
  @_s.JsonKey(name: 'Origins')
  final List<String> origins;

  ListApprovedOriginsResponse({
    this.nextToken,
    this.origins,
  });
  factory ListApprovedOriginsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListApprovedOriginsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContactFlowsResponse {
  /// Information about the contact flows.
  @_s.JsonKey(name: 'ContactFlowSummaryList')
  final List<ContactFlowSummary> contactFlowSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListContactFlowsResponse({
    this.contactFlowSummaryList,
    this.nextToken,
  });
  factory ListContactFlowsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListContactFlowsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHoursOfOperationsResponse {
  /// Information about the hours of operation.
  @_s.JsonKey(name: 'HoursOfOperationSummaryList')
  final List<HoursOfOperationSummary> hoursOfOperationSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHoursOfOperationsResponse({
    this.hoursOfOperationSummaryList,
    this.nextToken,
  });
  factory ListHoursOfOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHoursOfOperationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstanceAttributesResponse {
  /// The attribute types.
  @_s.JsonKey(name: 'Attributes')
  final List<Attribute> attributes;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListInstanceAttributesResponse({
    this.attributes,
    this.nextToken,
  });
  factory ListInstanceAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInstanceAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstanceStorageConfigsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A valid storage type.
  @_s.JsonKey(name: 'StorageConfigs')
  final List<InstanceStorageConfig> storageConfigs;

  ListInstanceStorageConfigsResponse({
    this.nextToken,
    this.storageConfigs,
  });
  factory ListInstanceStorageConfigsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListInstanceStorageConfigsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInstancesResponse {
  /// Information about the instances.
  @_s.JsonKey(name: 'InstanceSummaryList')
  final List<InstanceSummary> instanceSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListInstancesResponse({
    this.instanceSummaryList,
    this.nextToken,
  });
  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInstancesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIntegrationAssociationsResponse {
  /// The AppIntegration associations.
  @_s.JsonKey(name: 'IntegrationAssociationSummaryList')
  final List<IntegrationAssociationSummary> integrationAssociationSummaryList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIntegrationAssociationsResponse({
    this.integrationAssociationSummaryList,
    this.nextToken,
  });
  factory ListIntegrationAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListIntegrationAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLambdaFunctionsResponse {
  /// The Lambdafunction ARNs associated with the specified instance.
  @_s.JsonKey(name: 'LambdaFunctions')
  final List<String> lambdaFunctions;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLambdaFunctionsResponse({
    this.lambdaFunctions,
    this.nextToken,
  });
  factory ListLambdaFunctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLambdaFunctionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLexBotsResponse {
  /// The the names and regions of the Amazon Lex bots associated with the
  /// specified instance.
  @_s.JsonKey(name: 'LexBots')
  final List<LexBot> lexBots;

  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLexBotsResponse({
    this.lexBots,
    this.nextToken,
  });
  factory ListLexBotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLexBotsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPhoneNumbersResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the phone numbers.
  @_s.JsonKey(name: 'PhoneNumberSummaryList')
  final List<PhoneNumberSummary> phoneNumberSummaryList;

  ListPhoneNumbersResponse({
    this.nextToken,
    this.phoneNumberSummaryList,
  });
  factory ListPhoneNumbersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPhoneNumbersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPromptsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the prompts.
  @_s.JsonKey(name: 'PromptSummaryList')
  final List<PromptSummary> promptSummaryList;

  ListPromptsResponse({
    this.nextToken,
    this.promptSummaryList,
  });
  factory ListPromptsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPromptsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListQueuesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the queues.
  @_s.JsonKey(name: 'QueueSummaryList')
  final List<QueueSummary> queueSummaryList;

  ListQueuesResponse({
    this.nextToken,
    this.queueSummaryList,
  });
  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListQueuesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListQuickConnectsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the quick connects.
  @_s.JsonKey(name: 'QuickConnectSummaryList')
  final List<QuickConnectSummary> quickConnectSummaryList;

  ListQuickConnectsResponse({
    this.nextToken,
    this.quickConnectSummaryList,
  });
  factory ListQuickConnectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListQuickConnectsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoutingProfileQueuesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the routing profiles.
  @_s.JsonKey(name: 'RoutingProfileQueueConfigSummaryList')
  final List<RoutingProfileQueueConfigSummary>
      routingProfileQueueConfigSummaryList;

  ListRoutingProfileQueuesResponse({
    this.nextToken,
    this.routingProfileQueueConfigSummaryList,
  });
  factory ListRoutingProfileQueuesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRoutingProfileQueuesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoutingProfilesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the routing profiles.
  @_s.JsonKey(name: 'RoutingProfileSummaryList')
  final List<RoutingProfileSummary> routingProfileSummaryList;

  ListRoutingProfilesResponse({
    this.nextToken,
    this.routingProfileSummaryList,
  });
  factory ListRoutingProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRoutingProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityKeysResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The security keys.
  @_s.JsonKey(name: 'SecurityKeys')
  final List<SecurityKey> securityKeys;

  ListSecurityKeysResponse({
    this.nextToken,
    this.securityKeys,
  });
  factory ListSecurityKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecurityKeysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityProfilesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the security profiles.
  @_s.JsonKey(name: 'SecurityProfileSummaryList')
  final List<SecurityProfileSummary> securityProfileSummaryList;

  ListSecurityProfilesResponse({
    this.nextToken,
    this.securityProfileSummaryList,
  });
  factory ListSecurityProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecurityProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUseCasesResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The use cases.
  @_s.JsonKey(name: 'UseCaseSummaryList')
  final List<UseCase> useCaseSummaryList;

  ListUseCasesResponse({
    this.nextToken,
    this.useCaseSummaryList,
  });
  factory ListUseCasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUseCasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserHierarchyGroupsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the hierarchy groups.
  @_s.JsonKey(name: 'UserHierarchyGroupSummaryList')
  final List<HierarchyGroupSummary> userHierarchyGroupSummaryList;

  ListUserHierarchyGroupsResponse({
    this.nextToken,
    this.userHierarchyGroupSummaryList,
  });
  factory ListUserHierarchyGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserHierarchyGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the users.
  @_s.JsonKey(name: 'UserSummaryList')
  final List<UserSummary> userSummaryList;

  ListUsersResponse({
    this.nextToken,
    this.userSummaryList,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// Contains information about which channels are supported, and how many
/// contacts an agent can have on a channel simultaneously.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MediaConcurrency {
  /// The channels that agents can handle in the Contact Control Panel (CCP).
  @_s.JsonKey(name: 'Channel')
  final Channel channel;

  /// The number of contacts an agent can have on a channel simultaneously.
  @_s.JsonKey(name: 'Concurrency')
  final int concurrency;

  MediaConcurrency({
    @_s.required this.channel,
    @_s.required this.concurrency,
  });
  factory MediaConcurrency.fromJson(Map<String, dynamic> json) =>
      _$MediaConcurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$MediaConcurrencyToJson(this);
}

/// The customer's details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParticipantDetails {
  /// Display name of the participant.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  ParticipantDetails({
    @_s.required this.displayName,
  });
  Map<String, dynamic> toJson() => _$ParticipantDetailsToJson(this);
}

enum PhoneNumberCountryCode {
  @_s.JsonValue('AF')
  af,
  @_s.JsonValue('AL')
  al,
  @_s.JsonValue('DZ')
  dz,
  @_s.JsonValue('AS')
  as,
  @_s.JsonValue('AD')
  ad,
  @_s.JsonValue('AO')
  ao,
  @_s.JsonValue('AI')
  ai,
  @_s.JsonValue('AQ')
  aq,
  @_s.JsonValue('AG')
  ag,
  @_s.JsonValue('AR')
  ar,
  @_s.JsonValue('AM')
  am,
  @_s.JsonValue('AW')
  aw,
  @_s.JsonValue('AU')
  au,
  @_s.JsonValue('AT')
  at,
  @_s.JsonValue('AZ')
  az,
  @_s.JsonValue('BS')
  bs,
  @_s.JsonValue('BH')
  bh,
  @_s.JsonValue('BD')
  bd,
  @_s.JsonValue('BB')
  bb,
  @_s.JsonValue('BY')
  by,
  @_s.JsonValue('BE')
  be,
  @_s.JsonValue('BZ')
  bz,
  @_s.JsonValue('BJ')
  bj,
  @_s.JsonValue('BM')
  bm,
  @_s.JsonValue('BT')
  bt,
  @_s.JsonValue('BO')
  bo,
  @_s.JsonValue('BA')
  ba,
  @_s.JsonValue('BW')
  bw,
  @_s.JsonValue('BR')
  br,
  @_s.JsonValue('IO')
  io,
  @_s.JsonValue('VG')
  vg,
  @_s.JsonValue('BN')
  bn,
  @_s.JsonValue('BG')
  bg,
  @_s.JsonValue('BF')
  bf,
  @_s.JsonValue('BI')
  bi,
  @_s.JsonValue('KH')
  kh,
  @_s.JsonValue('CM')
  cm,
  @_s.JsonValue('CA')
  ca,
  @_s.JsonValue('CV')
  cv,
  @_s.JsonValue('KY')
  ky,
  @_s.JsonValue('CF')
  cf,
  @_s.JsonValue('TD')
  td,
  @_s.JsonValue('CL')
  cl,
  @_s.JsonValue('CN')
  cn,
  @_s.JsonValue('CX')
  cx,
  @_s.JsonValue('CC')
  cc,
  @_s.JsonValue('CO')
  co,
  @_s.JsonValue('KM')
  km,
  @_s.JsonValue('CK')
  ck,
  @_s.JsonValue('CR')
  cr,
  @_s.JsonValue('HR')
  hr,
  @_s.JsonValue('CU')
  cu,
  @_s.JsonValue('CW')
  cw,
  @_s.JsonValue('CY')
  cy,
  @_s.JsonValue('CZ')
  cz,
  @_s.JsonValue('CD')
  cd,
  @_s.JsonValue('DK')
  dk,
  @_s.JsonValue('DJ')
  dj,
  @_s.JsonValue('DM')
  dm,
  @_s.JsonValue('DO')
  $do,
  @_s.JsonValue('TL')
  tl,
  @_s.JsonValue('EC')
  ec,
  @_s.JsonValue('EG')
  eg,
  @_s.JsonValue('SV')
  sv,
  @_s.JsonValue('GQ')
  gq,
  @_s.JsonValue('ER')
  er,
  @_s.JsonValue('EE')
  ee,
  @_s.JsonValue('ET')
  et,
  @_s.JsonValue('FK')
  fk,
  @_s.JsonValue('FO')
  fo,
  @_s.JsonValue('FJ')
  fj,
  @_s.JsonValue('FI')
  fi,
  @_s.JsonValue('FR')
  fr,
  @_s.JsonValue('PF')
  pf,
  @_s.JsonValue('GA')
  ga,
  @_s.JsonValue('GM')
  gm,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('DE')
  de,
  @_s.JsonValue('GH')
  gh,
  @_s.JsonValue('GI')
  gi,
  @_s.JsonValue('GR')
  gr,
  @_s.JsonValue('GL')
  gl,
  @_s.JsonValue('GD')
  gd,
  @_s.JsonValue('GU')
  gu,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GG')
  gg,
  @_s.JsonValue('GN')
  gn,
  @_s.JsonValue('GW')
  gw,
  @_s.JsonValue('GY')
  gy,
  @_s.JsonValue('HT')
  ht,
  @_s.JsonValue('HN')
  hn,
  @_s.JsonValue('HK')
  hk,
  @_s.JsonValue('HU')
  hu,
  @_s.JsonValue('IS')
  $is,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('ID')
  id,
  @_s.JsonValue('IR')
  ir,
  @_s.JsonValue('IQ')
  iq,
  @_s.JsonValue('IE')
  ie,
  @_s.JsonValue('IM')
  im,
  @_s.JsonValue('IL')
  il,
  @_s.JsonValue('IT')
  it,
  @_s.JsonValue('CI')
  ci,
  @_s.JsonValue('JM')
  jm,
  @_s.JsonValue('JP')
  jp,
  @_s.JsonValue('JE')
  je,
  @_s.JsonValue('JO')
  jo,
  @_s.JsonValue('KZ')
  kz,
  @_s.JsonValue('KE')
  ke,
  @_s.JsonValue('KI')
  ki,
  @_s.JsonValue('KW')
  kw,
  @_s.JsonValue('KG')
  kg,
  @_s.JsonValue('LA')
  la,
  @_s.JsonValue('LV')
  lv,
  @_s.JsonValue('LB')
  lb,
  @_s.JsonValue('LS')
  ls,
  @_s.JsonValue('LR')
  lr,
  @_s.JsonValue('LY')
  ly,
  @_s.JsonValue('LI')
  li,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LU')
  lu,
  @_s.JsonValue('MO')
  mo,
  @_s.JsonValue('MK')
  mk,
  @_s.JsonValue('MG')
  mg,
  @_s.JsonValue('MW')
  mw,
  @_s.JsonValue('MY')
  my,
  @_s.JsonValue('MV')
  mv,
  @_s.JsonValue('ML')
  ml,
  @_s.JsonValue('MT')
  mt,
  @_s.JsonValue('MH')
  mh,
  @_s.JsonValue('MR')
  mr,
  @_s.JsonValue('MU')
  mu,
  @_s.JsonValue('YT')
  yt,
  @_s.JsonValue('MX')
  mx,
  @_s.JsonValue('FM')
  fm,
  @_s.JsonValue('MD')
  md,
  @_s.JsonValue('MC')
  mc,
  @_s.JsonValue('MN')
  mn,
  @_s.JsonValue('ME')
  me,
  @_s.JsonValue('MS')
  ms,
  @_s.JsonValue('MA')
  ma,
  @_s.JsonValue('MZ')
  mz,
  @_s.JsonValue('MM')
  mm,
  @_s.JsonValue('NA')
  na,
  @_s.JsonValue('NR')
  nr,
  @_s.JsonValue('NP')
  np,
  @_s.JsonValue('NL')
  nl,
  @_s.JsonValue('AN')
  an,
  @_s.JsonValue('NC')
  nc,
  @_s.JsonValue('NZ')
  nz,
  @_s.JsonValue('NI')
  ni,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('NG')
  ng,
  @_s.JsonValue('NU')
  nu,
  @_s.JsonValue('KP')
  kp,
  @_s.JsonValue('MP')
  mp,
  @_s.JsonValue('NO')
  no,
  @_s.JsonValue('OM')
  om,
  @_s.JsonValue('PK')
  pk,
  @_s.JsonValue('PW')
  pw,
  @_s.JsonValue('PA')
  pa,
  @_s.JsonValue('PG')
  pg,
  @_s.JsonValue('PY')
  py,
  @_s.JsonValue('PE')
  pe,
  @_s.JsonValue('PH')
  ph,
  @_s.JsonValue('PN')
  pn,
  @_s.JsonValue('PL')
  pl,
  @_s.JsonValue('PT')
  pt,
  @_s.JsonValue('PR')
  pr,
  @_s.JsonValue('QA')
  qa,
  @_s.JsonValue('CG')
  cg,
  @_s.JsonValue('RE')
  re,
  @_s.JsonValue('RO')
  ro,
  @_s.JsonValue('RU')
  ru,
  @_s.JsonValue('RW')
  rw,
  @_s.JsonValue('BL')
  bl,
  @_s.JsonValue('SH')
  sh,
  @_s.JsonValue('KN')
  kn,
  @_s.JsonValue('LC')
  lc,
  @_s.JsonValue('MF')
  mf,
  @_s.JsonValue('PM')
  pm,
  @_s.JsonValue('VC')
  vc,
  @_s.JsonValue('WS')
  ws,
  @_s.JsonValue('SM')
  sm,
  @_s.JsonValue('ST')
  st,
  @_s.JsonValue('SA')
  sa,
  @_s.JsonValue('SN')
  sn,
  @_s.JsonValue('RS')
  rs,
  @_s.JsonValue('SC')
  sc,
  @_s.JsonValue('SL')
  sl,
  @_s.JsonValue('SG')
  sg,
  @_s.JsonValue('SX')
  sx,
  @_s.JsonValue('SK')
  sk,
  @_s.JsonValue('SI')
  si,
  @_s.JsonValue('SB')
  sb,
  @_s.JsonValue('SO')
  so,
  @_s.JsonValue('ZA')
  za,
  @_s.JsonValue('KR')
  kr,
  @_s.JsonValue('ES')
  es,
  @_s.JsonValue('LK')
  lk,
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('SR')
  sr,
  @_s.JsonValue('SJ')
  sj,
  @_s.JsonValue('SZ')
  sz,
  @_s.JsonValue('SE')
  se,
  @_s.JsonValue('CH')
  ch,
  @_s.JsonValue('SY')
  sy,
  @_s.JsonValue('TW')
  tw,
  @_s.JsonValue('TJ')
  tj,
  @_s.JsonValue('TZ')
  tz,
  @_s.JsonValue('TH')
  th,
  @_s.JsonValue('TG')
  tg,
  @_s.JsonValue('TK')
  tk,
  @_s.JsonValue('TO')
  to,
  @_s.JsonValue('TT')
  tt,
  @_s.JsonValue('TN')
  tn,
  @_s.JsonValue('TR')
  tr,
  @_s.JsonValue('TM')
  tm,
  @_s.JsonValue('TC')
  tc,
  @_s.JsonValue('TV')
  tv,
  @_s.JsonValue('VI')
  vi,
  @_s.JsonValue('UG')
  ug,
  @_s.JsonValue('UA')
  ua,
  @_s.JsonValue('AE')
  ae,
  @_s.JsonValue('GB')
  gb,
  @_s.JsonValue('US')
  us,
  @_s.JsonValue('UY')
  uy,
  @_s.JsonValue('UZ')
  uz,
  @_s.JsonValue('VU')
  vu,
  @_s.JsonValue('VA')
  va,
  @_s.JsonValue('VE')
  ve,
  @_s.JsonValue('VN')
  vn,
  @_s.JsonValue('WF')
  wf,
  @_s.JsonValue('EH')
  eh,
  @_s.JsonValue('YE')
  ye,
  @_s.JsonValue('ZM')
  zm,
  @_s.JsonValue('ZW')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a phone number for a quick connect.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PhoneNumberQuickConnectConfig {
  /// The phone number in E.164 format.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  PhoneNumberQuickConnectConfig({
    @_s.required this.phoneNumber,
  });
  factory PhoneNumberQuickConnectConfig.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberQuickConnectConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberQuickConnectConfigToJson(this);
}

/// Contains summary information about a phone number for a contact center.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberSummary {
  /// The Amazon Resource Name (ARN) of the phone number.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the phone number.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The phone number.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The ISO country code.
  @_s.JsonKey(name: 'PhoneNumberCountryCode')
  final PhoneNumberCountryCode phoneNumberCountryCode;

  /// The type of phone number.
  @_s.JsonKey(name: 'PhoneNumberType')
  final PhoneNumberType phoneNumberType;

  PhoneNumberSummary({
    this.arn,
    this.id,
    this.phoneNumber,
    this.phoneNumberCountryCode,
    this.phoneNumberType,
  });
  factory PhoneNumberSummary.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberSummaryFromJson(json);
}

enum PhoneNumberType {
  @_s.JsonValue('TOLL_FREE')
  tollFree,
  @_s.JsonValue('DID')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum PhoneType {
  @_s.JsonValue('SOFT_PHONE')
  softPhone,
  @_s.JsonValue('DESK_PHONE')
  deskPhone,
}

/// Contains information about the prompt.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PromptSummary {
  /// The Amazon Resource Name (ARN) of the prompt.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the prompt.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the prompt.
  @_s.JsonKey(name: 'Name')
  final String name;

  PromptSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory PromptSummary.fromJson(Map<String, dynamic> json) =>
      _$PromptSummaryFromJson(json);
}

/// Contains information about a queue for a quick connect. The contact flow
/// must be of type Transfer to Queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QueueQuickConnectConfig {
  /// The identifier of the contact flow.
  @_s.JsonKey(name: 'ContactFlowId')
  final String contactFlowId;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'QueueId')
  final String queueId;

  QueueQuickConnectConfig({
    @_s.required this.contactFlowId,
    @_s.required this.queueId,
  });
  factory QueueQuickConnectConfig.fromJson(Map<String, dynamic> json) =>
      _$QueueQuickConnectConfigFromJson(json);

  Map<String, dynamic> toJson() => _$QueueQuickConnectConfigToJson(this);
}

/// Contains information about a queue resource for which metrics are returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueueReference {
  /// The Amazon Resource Name (ARN) of the queue.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'Id')
  final String id;

  QueueReference({
    this.arn,
    this.id,
  });
  factory QueueReference.fromJson(Map<String, dynamic> json) =>
      _$QueueReferenceFromJson(json);
}

/// Contains summary information about a queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueueSummary {
  /// The Amazon Resource Name (ARN) of the queue.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the queue.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of queue.
  @_s.JsonKey(name: 'QueueType')
  final QueueType queueType;

  QueueSummary({
    this.arn,
    this.id,
    this.name,
    this.queueType,
  });
  factory QueueSummary.fromJson(Map<String, dynamic> json) =>
      _$QueueSummaryFromJson(json);
}

enum QueueType {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('AGENT')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a quick connect.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QuickConnect {
  /// The description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the quick connect.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the quick connect.
  @_s.JsonKey(name: 'QuickConnectARN')
  final String quickConnectARN;

  /// Contains information about the quick connect.
  @_s.JsonKey(name: 'QuickConnectConfig')
  final QuickConnectConfig quickConnectConfig;

  /// The identifier for the quick connect.
  @_s.JsonKey(name: 'QuickConnectId')
  final String quickConnectId;

  /// One or more tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  QuickConnect({
    this.description,
    this.name,
    this.quickConnectARN,
    this.quickConnectConfig,
    this.quickConnectId,
    this.tags,
  });
  factory QuickConnect.fromJson(Map<String, dynamic> json) =>
      _$QuickConnectFromJson(json);
}

/// Contains configuration settings for a quick connect.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QuickConnectConfig {
  /// The type of quick connect. In the Amazon Connect console, when you create a
  /// quick connect, you are prompted to assign one of the following types: Agent
  /// (USER), External (PHONE_NUMBER), or Queue (QUEUE).
  @_s.JsonKey(name: 'QuickConnectType')
  final QuickConnectType quickConnectType;

  /// The phone configuration. This is required only if QuickConnectType is
  /// PHONE_NUMBER.
  @_s.JsonKey(name: 'PhoneConfig')
  final PhoneNumberQuickConnectConfig phoneConfig;

  /// The queue configuration. This is required only if QuickConnectType is QUEUE.
  @_s.JsonKey(name: 'QueueConfig')
  final QueueQuickConnectConfig queueConfig;

  /// The user configuration. This is required only if QuickConnectType is USER.
  @_s.JsonKey(name: 'UserConfig')
  final UserQuickConnectConfig userConfig;

  QuickConnectConfig({
    @_s.required this.quickConnectType,
    this.phoneConfig,
    this.queueConfig,
    this.userConfig,
  });
  factory QuickConnectConfig.fromJson(Map<String, dynamic> json) =>
      _$QuickConnectConfigFromJson(json);

  Map<String, dynamic> toJson() => _$QuickConnectConfigToJson(this);
}

/// Contains summary information about a quick connect.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QuickConnectSummary {
  /// The Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier for the quick connect.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of quick connect. In the Amazon Connect console, when you create a
  /// quick connect, you are prompted to assign one of the following types: Agent
  /// (USER), External (PHONE_NUMBER), or Queue (QUEUE).
  @_s.JsonKey(name: 'QuickConnectType')
  final QuickConnectType quickConnectType;

  QuickConnectSummary({
    this.arn,
    this.id,
    this.name,
    this.quickConnectType,
  });
  factory QuickConnectSummary.fromJson(Map<String, dynamic> json) =>
      _$QuickConnectSummaryFromJson(json);
}

enum QuickConnectType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('QUEUE')
  queue,
  @_s.JsonValue('PHONE_NUMBER')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A link that an agent selects to complete a given task. You can have up to
/// 4,096 UTF-8 bytes across all references for a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Reference {
  /// A valid URL.
  @_s.JsonKey(name: 'Type')
  final ReferenceType type;

  /// A formatted URL that will be shown to an agent in the Contact Control Panel
  /// (CCP)
  @_s.JsonKey(name: 'Value')
  final String value;

  Reference({
    @_s.required this.type,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ReferenceToJson(this);
}

enum ReferenceType {
  @_s.JsonValue('URL')
  url,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResumeContactRecordingResponse {
  ResumeContactRecordingResponse();
  factory ResumeContactRecordingResponse.fromJson(Map<String, dynamic> json) =>
      _$ResumeContactRecordingResponseFromJson(json);
}

/// Contains information about a routing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoutingProfile {
  /// The identifier of the default outbound queue for this routing profile.
  @_s.JsonKey(name: 'DefaultOutboundQueueId')
  final String defaultOutboundQueueId;

  /// The description of the routing profile.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the Amazon Connect instance.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  /// The channels agents can handle in the Contact Control Panel (CCP) for this
  /// routing profile.
  @_s.JsonKey(name: 'MediaConcurrencies')
  final List<MediaConcurrency> mediaConcurrencies;

  /// The name of the routing profile.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the routing profile.
  @_s.JsonKey(name: 'RoutingProfileArn')
  final String routingProfileArn;

  /// The identifier of the routing profile.
  @_s.JsonKey(name: 'RoutingProfileId')
  final String routingProfileId;

  /// One or more tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

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
  factory RoutingProfile.fromJson(Map<String, dynamic> json) =>
      _$RoutingProfileFromJson(json);
}

/// Contains information about the queue and channel for which priority and
/// delay can be set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RoutingProfileQueueConfig {
  /// The delay, in seconds, a contact should be in the queue before they are
  /// routed to an available agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.
  @_s.JsonKey(name: 'Delay')
  final int delay;

  /// The order in which contacts are to be handled for the queue. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a>.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// Contains information about a queue resource.
  @_s.JsonKey(name: 'QueueReference')
  final RoutingProfileQueueReference queueReference;

  RoutingProfileQueueConfig({
    @_s.required this.delay,
    @_s.required this.priority,
    @_s.required this.queueReference,
  });
  Map<String, dynamic> toJson() => _$RoutingProfileQueueConfigToJson(this);
}

/// Contains summary information about a routing profile queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoutingProfileQueueConfigSummary {
  /// The channels this queue supports.
  @_s.JsonKey(name: 'Channel')
  final Channel channel;

  /// The delay, in seconds, that a contact should be in the queue before they are
  /// routed to an available agent. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.
  @_s.JsonKey(name: 'Delay')
  final int delay;

  /// The order in which contacts are to be handled for the queue. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html">Queues:
  /// priority and delay</a>.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The Amazon Resource Name (ARN) of the queue.
  @_s.JsonKey(name: 'QueueArn')
  final String queueArn;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'QueueId')
  final String queueId;

  /// The name of the queue.
  @_s.JsonKey(name: 'QueueName')
  final String queueName;

  RoutingProfileQueueConfigSummary({
    @_s.required this.channel,
    @_s.required this.delay,
    @_s.required this.priority,
    @_s.required this.queueArn,
    @_s.required this.queueId,
    @_s.required this.queueName,
  });
  factory RoutingProfileQueueConfigSummary.fromJson(
          Map<String, dynamic> json) =>
      _$RoutingProfileQueueConfigSummaryFromJson(json);
}

/// Contains the channel and queue identifier for a routing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RoutingProfileQueueReference {
  /// The channels agents can handle in the Contact Control Panel (CCP) for this
  /// routing profile.
  @_s.JsonKey(name: 'Channel')
  final Channel channel;

  /// The identifier of the queue.
  @_s.JsonKey(name: 'QueueId')
  final String queueId;

  RoutingProfileQueueReference({
    @_s.required this.channel,
    @_s.required this.queueId,
  });
  Map<String, dynamic> toJson() => _$RoutingProfileQueueReferenceToJson(this);
}

/// Contains summary information about a routing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoutingProfileSummary {
  /// The Amazon Resource Name (ARN) of the routing profile.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the routing profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the routing profile.
  @_s.JsonKey(name: 'Name')
  final String name;

  RoutingProfileSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory RoutingProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$RoutingProfileSummaryFromJson(json);
}

/// Information about the S3 storage type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Config {
  /// The S3 bucket name.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// The S3 bucket prefix.
  @_s.JsonKey(name: 'BucketPrefix')
  final String bucketPrefix;

  /// The S3 encryption configuration.
  @_s.JsonKey(name: 'EncryptionConfig')
  final EncryptionConfig encryptionConfig;

  S3Config({
    @_s.required this.bucketName,
    @_s.required this.bucketPrefix,
    this.encryptionConfig,
  });
  factory S3Config.fromJson(Map<String, dynamic> json) =>
      _$S3ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3ConfigToJson(this);
}

/// Configuration information of the security key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityKey {
  /// The existing association identifier that uniquely identifies the resource
  /// type and storage config for the given instance ID.
  @_s.JsonKey(name: 'AssociationId')
  final String associationId;

  /// When the security key was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The key of the security key.
  @_s.JsonKey(name: 'Key')
  final String key;

  SecurityKey({
    this.associationId,
    this.creationTime,
    this.key,
  });
  factory SecurityKey.fromJson(Map<String, dynamic> json) =>
      _$SecurityKeyFromJson(json);
}

/// Contains information about a security profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityProfileSummary {
  /// The Amazon Resource Name (ARN) of the security profile.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the security profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the security profile.
  @_s.JsonKey(name: 'Name')
  final String name;

  SecurityProfileSummary({
    this.arn,
    this.id,
    this.name,
  });
  factory SecurityProfileSummary.fromJson(Map<String, dynamic> json) =>
      _$SecurityProfileSummaryFromJson(json);
}

enum SourceType {
  @_s.JsonValue('SALESFORCE')
  salesforce,
  @_s.JsonValue('ZENDESK')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChatContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  @_s.JsonKey(name: 'ContactId')
  final String contactId;

  /// The identifier for a chat participant. The participantId for a chat
  /// participant is the same throughout the chat lifecycle.
  @_s.JsonKey(name: 'ParticipantId')
  final String participantId;

  /// The token used by the chat participant to call <a
  /// href="https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html">CreateParticipantConnection</a>.
  /// The participant token is valid for the lifetime of a chat participant.
  @_s.JsonKey(name: 'ParticipantToken')
  final String participantToken;

  StartChatContactResponse({
    this.contactId,
    this.participantId,
    this.participantToken,
  });
  factory StartChatContactResponse.fromJson(Map<String, dynamic> json) =>
      _$StartChatContactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartContactRecordingResponse {
  StartContactRecordingResponse();
  factory StartContactRecordingResponse.fromJson(Map<String, dynamic> json) =>
      _$StartContactRecordingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartOutboundVoiceContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  @_s.JsonKey(name: 'ContactId')
  final String contactId;

  StartOutboundVoiceContactResponse({
    this.contactId,
  });
  factory StartOutboundVoiceContactResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartOutboundVoiceContactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTaskContactResponse {
  /// The identifier of this contact within the Amazon Connect instance.
  @_s.JsonKey(name: 'ContactId')
  final String contactId;

  StartTaskContactResponse({
    this.contactId,
  });
  factory StartTaskContactResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTaskContactResponseFromJson(json);
}

enum Statistic {
  @_s.JsonValue('SUM')
  sum,
  @_s.JsonValue('MAX')
  max,
  @_s.JsonValue('AVG')
  avg,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopContactRecordingResponse {
  StopContactRecordingResponse();
  factory StopContactRecordingResponse.fromJson(Map<String, dynamic> json) =>
      _$StopContactRecordingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopContactResponse {
  StopContactResponse();
  factory StopContactResponse.fromJson(Map<String, dynamic> json) =>
      _$StopContactResponseFromJson(json);
}

enum StorageType {
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('KINESIS_VIDEO_STREAM')
  kinesisVideoStream,
  @_s.JsonValue('KINESIS_STREAM')
  kinesisStream,
  @_s.JsonValue('KINESIS_FIREHOSE')
  kinesisFirehose,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SuspendContactRecordingResponse {
  SuspendContactRecordingResponse();
  factory SuspendContactRecordingResponse.fromJson(Map<String, dynamic> json) =>
      _$SuspendContactRecordingResponseFromJson(json);
}

/// Contains information about the threshold for service level metrics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Threshold {
  /// The type of comparison. Only "less than" (LT) comparisons are supported.
  @_s.JsonKey(name: 'Comparison')
  final Comparison comparison;

  /// The threshold value to compare.
  @_s.JsonKey(name: 'ThresholdValue')
  final double thresholdValue;

  Threshold({
    this.comparison,
    this.thresholdValue,
  });
  factory Threshold.fromJson(Map<String, dynamic> json) =>
      _$ThresholdFromJson(json);

  Map<String, dynamic> toJson() => _$ThresholdToJson(this);
}

enum Unit {
  @_s.JsonValue('SECONDS')
  seconds,
  @_s.JsonValue('COUNT')
  count,
  @_s.JsonValue('PERCENT')
  percent,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContactAttributesResponse {
  UpdateContactAttributesResponse();
  factory UpdateContactAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactAttributesResponseFromJson(json);
}

/// Contains the use case.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UseCase {
  /// The Amazon Resource Name (ARN) for the use case.
  @_s.JsonKey(name: 'UseCaseArn')
  final String useCaseArn;

  /// The identifier for the use case.
  @_s.JsonKey(name: 'UseCaseId')
  final String useCaseId;

  /// The type of use case to associate to the AppIntegration association. Each
  /// AppIntegration association can have only one of each use case type.
  @_s.JsonKey(name: 'UseCaseType')
  final UseCaseType useCaseType;

  UseCase({
    this.useCaseArn,
    this.useCaseId,
    this.useCaseType,
  });
  factory UseCase.fromJson(Map<String, dynamic> json) =>
      _$UseCaseFromJson(json);
}

enum UseCaseType {
  @_s.JsonValue('RULES_EVALUATION')
  rulesEvaluation,
}

extension on UseCaseType {
  String toValue() {
    switch (this) {
      case UseCaseType.rulesEvaluation:
        return 'RULES_EVALUATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a user account for a Amazon Connect instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The Amazon Resource Name (ARN) of the user account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the user account in the directory used for identity
  /// management.
  @_s.JsonKey(name: 'DirectoryUserId')
  final String directoryUserId;

  /// The identifier of the hierarchy group for the user.
  @_s.JsonKey(name: 'HierarchyGroupId')
  final String hierarchyGroupId;

  /// The identifier of the user account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the user identity.
  @_s.JsonKey(name: 'IdentityInfo')
  final UserIdentityInfo identityInfo;

  /// Information about the phone configuration for the user.
  @_s.JsonKey(name: 'PhoneConfig')
  final UserPhoneConfig phoneConfig;

  /// The identifier of the routing profile for the user.
  @_s.JsonKey(name: 'RoutingProfileId')
  final String routingProfileId;

  /// The identifiers of the security profiles for the user.
  @_s.JsonKey(name: 'SecurityProfileIds')
  final List<String> securityProfileIds;

  /// The tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The user name assigned to the user account.
  @_s.JsonKey(name: 'Username')
  final String username;

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
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// Contains information about the identity of a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserIdentityInfo {
  /// The email address. If you are using SAML for identity management and include
  /// this parameter, an error is returned.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The first name. This is required if you are using Amazon Connect or SAML for
  /// identity management.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The last name. This is required if you are using Amazon Connect or SAML for
  /// identity management.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  UserIdentityInfo({
    this.email,
    this.firstName,
    this.lastName,
  });
  factory UserIdentityInfo.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityInfoToJson(this);
}

/// Contains information about the phone configuration settings for a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserPhoneConfig {
  /// The phone type.
  @_s.JsonKey(name: 'PhoneType')
  final PhoneType phoneType;

  /// The After Call Work (ACW) timeout setting, in seconds.
  @_s.JsonKey(name: 'AfterContactWorkTimeLimit')
  final int afterContactWorkTimeLimit;

  /// The Auto accept setting.
  @_s.JsonKey(name: 'AutoAccept')
  final bool autoAccept;

  /// The phone number for the user's desk phone.
  @_s.JsonKey(name: 'DeskPhoneNumber')
  final String deskPhoneNumber;

  UserPhoneConfig({
    @_s.required this.phoneType,
    this.afterContactWorkTimeLimit,
    this.autoAccept,
    this.deskPhoneNumber,
  });
  factory UserPhoneConfig.fromJson(Map<String, dynamic> json) =>
      _$UserPhoneConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserPhoneConfigToJson(this);
}

/// Contains information about the quick connect configuration settings for a
/// user. The contact flow must be of type Transfer to Agent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserQuickConnectConfig {
  /// The identifier of the contact flow.
  @_s.JsonKey(name: 'ContactFlowId')
  final String contactFlowId;

  /// The identifier of the user.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  UserQuickConnectConfig({
    @_s.required this.contactFlowId,
    @_s.required this.userId,
  });
  factory UserQuickConnectConfig.fromJson(Map<String, dynamic> json) =>
      _$UserQuickConnectConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserQuickConnectConfigToJson(this);
}

/// Contains summary information about a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserSummary {
  /// The Amazon Resource Name (ARN) of the user account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The identifier of the user account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The Amazon Connect user name of the user account.
  @_s.JsonKey(name: 'Username')
  final String username;

  UserSummary({
    this.arn,
    this.id,
    this.username,
  });
  factory UserSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryFromJson(json);
}

/// Contains information about the recording configuration settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VoiceRecordingConfiguration {
  /// Identifies which track is being recorded.
  @_s.JsonKey(name: 'VoiceRecordingTrack')
  final VoiceRecordingTrack voiceRecordingTrack;

  VoiceRecordingConfiguration({
    this.voiceRecordingTrack,
  });
  Map<String, dynamic> toJson() => _$VoiceRecordingConfigurationToJson(this);
}

enum VoiceRecordingTrack {
  @_s.JsonValue('FROM_AGENT')
  fromAgent,
  @_s.JsonValue('TO_AGENT')
  toAgent,
  @_s.JsonValue('ALL')
  all,
}

class ContactFlowNotPublishedException extends _s.GenericAwsException {
  ContactFlowNotPublishedException({String type, String message})
      : super(
            type: type,
            code: 'ContactFlowNotPublishedException',
            message: message);
}

class ContactNotFoundException extends _s.GenericAwsException {
  ContactNotFoundException({String type, String message})
      : super(type: type, code: 'ContactNotFoundException', message: message);
}

class DestinationNotAllowedException extends _s.GenericAwsException {
  DestinationNotAllowedException({String type, String message})
      : super(
            type: type,
            code: 'DestinationNotAllowedException',
            message: message);
}

class DuplicateResourceException extends _s.GenericAwsException {
  DuplicateResourceException({String type, String message})
      : super(type: type, code: 'DuplicateResourceException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidContactFlowException extends _s.GenericAwsException {
  InvalidContactFlowException({String type, String message})
      : super(
            type: type, code: 'InvalidContactFlowException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class OutboundContactNotPermittedException extends _s.GenericAwsException {
  OutboundContactNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OutboundContactNotPermittedException',
            message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String type, String message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UserNotFoundException extends _s.GenericAwsException {
  UserNotFoundException({String type, String message})
      : super(type: type, code: 'UserNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ContactFlowNotPublishedException': (type, message) =>
      ContactFlowNotPublishedException(type: type, message: message),
  'ContactNotFoundException': (type, message) =>
      ContactNotFoundException(type: type, message: message),
  'DestinationNotAllowedException': (type, message) =>
      DestinationNotAllowedException(type: type, message: message),
  'DuplicateResourceException': (type, message) =>
      DuplicateResourceException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidContactFlowException': (type, message) =>
      InvalidContactFlowException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'OutboundContactNotPermittedException': (type, message) =>
      OutboundContactNotPermittedException(type: type, message: message),
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
