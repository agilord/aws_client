// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_credential_providers/aws_credential_providers.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider = defaultProvider,
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
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

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
    required String instanceId,
    required String origin,
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
    required String instanceId,
    required InstanceStorageResourceType resourceType,
    required InstanceStorageConfig storageConfig,
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
  /// The identifier of the Amazon Connect instance.
  Future<void> associateLambdaFunction({
    required String functionArn,
    required String instanceId,
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
    required String instanceId,
    required LexBot lexBot,
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
    required String instanceId,
    required List<RoutingProfileQueueConfig> queueConfigs,
    required String routingProfileId,
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
    required String instanceId,
    required String key,
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
    required String content,
    required String instanceId,
    required String name,
    required ContactFlowType type,
    String? description,
    Map<String, String>? tags,
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
    _s.validateStringLength(
      'instanceAlias',
      instanceAlias,
      1,
      62,
    );
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
    required String instanceId,
    required String integrationArn,
    required IntegrationType integrationType,
    required String sourceApplicationName,
    required String sourceApplicationUrl,
    required SourceType sourceType,
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
      'IntegrationType': integrationType.toValue(),
      'SourceApplicationName': sourceApplicationName,
      'SourceApplicationUrl': sourceApplicationUrl,
      'SourceType': sourceType.toValue(),
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
    required String instanceId,
    required String name,
    required QuickConnectConfig quickConnectConfig,
    String? description,
    Map<String, String>? tags,
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
    required String instanceId,
    required String integrationAssociationId,
    required UseCaseType useCaseType,
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
      'UseCaseType': useCaseType.toValue(),
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
    required String instanceId,
    required String name,
    String? parentGroupId,
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
    required String instanceId,
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
    required String instanceId,
    required String integrationAssociationId,
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
    required String instanceId,
    required String quickConnectId,
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
    required String instanceId,
    required String integrationAssociationId,
    required String useCaseId,
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
    required String instanceId,
    required String userId,
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
    required String hierarchyGroupId,
    required String instanceId,
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
    required String contactFlowId,
    required String instanceId,
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
    required String instanceId,
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
    required InstanceAttributeType attributeType,
    required String instanceId,
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
    required String associationId,
    required String instanceId,
    required InstanceStorageResourceType resourceType,
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
    required String instanceId,
    required String quickConnectId,
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
    required String instanceId,
    required String routingProfileId,
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
    required String instanceId,
    required String userId,
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
    required String hierarchyGroupId,
    required String instanceId,
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
    required String instanceId,
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
    required String instanceId,
    required String origin,
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
    required String associationId,
    required String instanceId,
    required InstanceStorageResourceType resourceType,
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
    required String functionArn,
    required String instanceId,
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
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [lexRegion] :
  /// The Region in which the Amazon Lex bot has been created.
  Future<void> disassociateLexBot({
    required String botName,
    required String instanceId,
    required String lexRegion,
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
    required String instanceId,
    required List<RoutingProfileQueueReference> queueReferences,
    required String routingProfileId,
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
    required String associationId,
    required String instanceId,
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
    required String initialContactId,
    required String instanceId,
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
    required String instanceId,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    List<ContactFlowType>? contactFlowTypes,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    required InstanceStorageResourceType resourceType,
    int? maxResults,
    String? nextToken,
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
  /// The maximimum number of results to return per page.
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
    List<PhoneNumberCountryCode>? phoneNumberCountryCodes,
    List<PhoneNumberType>? phoneNumberTypes,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
    List<QueueType>? queueTypes,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
    List<QuickConnectType>? quickConnectTypes,
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
    required String instanceId,
    required String routingProfileId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    required String integrationAssociationId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String instanceId,
    int? maxResults,
    String? nextToken,
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
    required String contactId,
    required String initialContactId,
    required String instanceId,
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
    required String contactFlowId,
    required String instanceId,
    required ParticipantDetails participantDetails,
    Map<String, String>? attributes,
    String? clientToken,
    ChatMessage? initialMessage,
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
    required String contactId,
    required String initialContactId,
    required String instanceId,
    required VoiceRecordingConfiguration voiceRecordingConfiguration,
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
    required String contactFlowId,
    required String destinationPhoneNumber,
    required String instanceId,
    Map<String, String>? attributes,
    String? clientToken,
    String? queueId,
    String? sourcePhoneNumber,
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
    required String contactFlowId,
    required String instanceId,
    required String name,
    Map<String, String>? attributes,
    String? clientToken,
    String? description,
    String? previousContactId,
    Map<String, Reference>? references,
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
    required String contactId,
    required String instanceId,
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
    required String contactId,
    required String initialContactId,
    required String instanceId,
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
    required String contactId,
    required String initialContactId,
    required String instanceId,
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
    required Map<String, String> attributes,
    required String initialContactId,
    required String instanceId,
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
    required String contactFlowId,
    required String instanceId,
    String? description,
    String? name,
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
    required InstanceAttributeType attributeType,
    required String instanceId,
    required String value,
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
    required String associationId,
    required String instanceId,
    required InstanceStorageResourceType resourceType,
    required InstanceStorageConfig storageConfig,
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
    required String instanceId,
    required QuickConnectConfig quickConnectConfig,
    required String quickConnectId,
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
    required String instanceId,
    required String quickConnectId,
    String? description,
    String? name,
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
    required String instanceId,
    required List<MediaConcurrency> mediaConcurrencies,
    required String routingProfileId,
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
    required String defaultOutboundQueueId,
    required String instanceId,
    required String routingProfileId,
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
    required String instanceId,
    required String routingProfileId,
    String? description,
    String? name,
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
    required String instanceId,
    required List<RoutingProfileQueueConfig> queueConfigs,
    required String routingProfileId,
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
    required String instanceId,
    required String userId,
    String? hierarchyGroupId,
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
    required String hierarchyGroupId,
    required String instanceId,
    required String name,
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
    required HierarchyStructureUpdate hierarchyStructure,
    required String instanceId,
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
    required UserIdentityInfo identityInfo,
    required String instanceId,
    required String userId,
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
    required String instanceId,
    required UserPhoneConfig phoneConfig,
    required String userId,
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
    required String instanceId,
    required String routingProfileId,
    required String userId,
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
    required String instanceId,
    required List<String> securityProfileIds,
    required String userId,
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

  /// The type of the content. Supported types are text/plain.
  final String contentType;

  ChatMessage({
    required this.content,
    required this.contentType,
  });
  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    return {
      'Content': content,
      'ContentType': contentType,
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
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toContactFlowType(),
    );
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
  final ContactFlowType? contactFlowType;

  /// The identifier of the contact flow.
  final String? id;

  /// The name of the contact flow.
  final String? name;

  ContactFlowSummary({
    this.arn,
    this.contactFlowType,
    this.id,
    this.name,
  });
  factory ContactFlowSummary.fromJson(Map<String, dynamic> json) {
    return ContactFlowSummary(
      arn: json['Arn'] as String?,
      contactFlowType:
          (json['ContactFlowType'] as String?)?.toContactFlowType(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
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
}

class CreateIntegrationAssociationResponse {
  /// The Amazon Resource Name (ARN) for the association.
  final String? integrationAssociationArn;

  /// The identifier for the association.
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

/// The encryption configuration.
class EncryptionConfig {
  /// The type of encryption.
  final EncryptionType encryptionType;

  /// The identifier of the encryption key.
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

  /// The queues to use to filter the metrics. You can specify up to 100 queues
  /// per request.
  final List<String>? queues;

  Filters({
    this.channels,
    this.queues,
  });
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

  HierarchyGroup({
    this.arn,
    this.hierarchyPath,
    this.id,
    this.levelId,
    this.name,
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
    );
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
}

/// Contains information about the hierarchy level to update.
class HierarchyLevelUpdate {
  /// The name of the user hierarchy level. Must not be more than 50 characters.
  final String name;

  HierarchyLevelUpdate({
    required this.name,
  });
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
}

/// The Amazon Connect instance.
class Instance {
  /// The Amazon Resource Name (ARN) of the instance.
  final String? arn;

  /// When the instance was created.
  final DateTime? createdTime;

  /// The identifier of the Amazon Connect instance.
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
}

enum InstanceAttributeType {
  inboundCalls,
  outboundCalls,
  contactflowLogs,
  contactLens,
  autoResolveBestVoices,
  useCustomTtsVoices,
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

  /// The S3 configuration.
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
}

/// Contains summary information about the associated AppIntegrations.
class IntegrationAssociationSummary {
  /// The identifier of the Amazon Connect instance.
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
}

enum IntegrationType {
  event,
}

extension on IntegrationType {
  String toValue() {
    switch (this) {
      case IntegrationType.event:
        return 'EVENT';
    }
  }
}

extension on String {
  IntegrationType toIntegrationType() {
    switch (this) {
      case 'EVENT':
        return IntegrationType.event;
    }
    throw Exception('$this is not known in enum IntegrationType');
  }
}

/// Configuration information of a Kinesis Firehose delivery stream.
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
  /// The Region the Amazon Lex bot was created in.
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
}

class ListIntegrationAssociationsResponse {
  /// The AppIntegration associations.
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
}

class ListLexBotsResponse {
  /// The the names and regions of the Amazon Lex bots associated with the
  /// specified instance.
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
}

/// Contains information about which channels are supported, and how many
/// contacts an agent can have on a channel simultaneously.
class MediaConcurrency {
  /// The channels that agents can handle in the Contact Control Panel (CCP).
  final Channel channel;

  /// The number of contacts an agent can have on a channel simultaneously.
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

/// The customer's details.
class ParticipantDetails {
  /// Display name of the participant.
  final String displayName;

  ParticipantDetails({
    required this.displayName,
  });
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
}

/// Contains information about a queue for a quick connect. The contact flow
/// must be of type Transfer to Queue.
class QueueQuickConnectConfig {
  /// The identifier of the contact flow.
  final String contactFlowId;

  /// The identifier of the queue.
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

  /// One or more tags.
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
  /// The Amazon Resource Name (ARN).
  final String? arn;

  /// The identifier for the quick connect.
  final String? id;

  /// The name.
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

/// A link that an agent selects to complete a given task. You can have up to
/// 4,096 UTF-8 bytes across all references for a contact.
class Reference {
  /// A valid URL.
  final ReferenceType type;

  /// A formatted URL that will be shown to an agent in the Contact Control Panel
  /// (CCP)
  final String value;

  Reference({
    required this.type,
    required this.value,
  });
  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum ReferenceType {
  url,
}

extension on ReferenceType {
  String toValue() {
    switch (this) {
      case ReferenceType.url:
        return 'URL';
    }
  }
}

extension on String {
  ReferenceType toReferenceType() {
    switch (this) {
      case 'URL':
        return ReferenceType.url;
    }
    throw Exception('$this is not known in enum ReferenceType');
  }
}

class ResumeContactRecordingResponse {
  ResumeContactRecordingResponse();
  factory ResumeContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return ResumeContactRecordingResponse();
  }
}

/// Contains information about a routing profile.
class RoutingProfile {
  /// The identifier of the default outbound queue for this routing profile.
  final String? defaultOutboundQueueId;

  /// The description of the routing profile.
  final String? description;

  /// The identifier of the Amazon Connect instance.
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

  /// The identifier of the queue.
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
}

/// Contains the channel and queue identifier for a routing profile.
class RoutingProfileQueueReference {
  /// The channels agents can handle in the Contact Control Panel (CCP) for this
  /// routing profile.
  final Channel channel;

  /// The identifier of the queue.
  final String queueId;

  RoutingProfileQueueReference({
    required this.channel,
    required this.queueId,
  });
  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final queueId = this.queueId;
    return {
      'Channel': channel.toValue(),
      'QueueId': queueId,
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
}

/// Information about the S3 storage type.
class S3Config {
  /// The S3 bucket name.
  final String bucketName;

  /// The S3 bucket prefix.
  final String bucketPrefix;

  /// The S3 encryption configuration.
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
}

class StartContactRecordingResponse {
  StartContactRecordingResponse();
  factory StartContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return StartContactRecordingResponse();
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
}

class StopContactResponse {
  StopContactResponse();
  factory StopContactResponse.fromJson(Map<String, dynamic> _) {
    return StopContactResponse();
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

class SuspendContactRecordingResponse {
  SuspendContactRecordingResponse();
  factory SuspendContactRecordingResponse.fromJson(Map<String, dynamic> _) {
    return SuspendContactRecordingResponse();
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
}

/// Contains the use case.
class UseCase {
  /// The Amazon Resource Name (ARN) for the use case.
  final String? useCaseArn;

  /// The identifier for the use case.
  final String? useCaseId;

  /// The type of use case to associate to the AppIntegration association. Each
  /// AppIntegration association can have only one of each use case type.
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
}

enum UseCaseType {
  rulesEvaluation,
}

extension on UseCaseType {
  String toValue() {
    switch (this) {
      case UseCaseType.rulesEvaluation:
        return 'RULES_EVALUATION';
    }
  }
}

extension on String {
  UseCaseType toUseCaseType() {
    switch (this) {
      case 'RULES_EVALUATION':
        return UseCaseType.rulesEvaluation;
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
}

/// Contains information about the recording configuration settings.
class VoiceRecordingConfiguration {
  /// Identifies which track is being recorded.
  final VoiceRecordingTrack? voiceRecordingTrack;

  VoiceRecordingConfiguration({
    this.voiceRecordingTrack,
  });
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

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidContactFlowException extends _s.GenericAwsException {
  InvalidContactFlowException({String? type, String? message})
      : super(
            type: type, code: 'InvalidContactFlowException', message: message);
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
