// ignore_for_file: deprecated_member_use_from_same_package
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// Welcome to the Amazon Nimble Studio API reference. This API reference
/// provides methods, schema, resources, parameters, and more to help you get
/// the most out of Nimble Studio.
///
/// Nimble Studio is a virtual studio that empowers visual effects, animation,
/// and interactive content teams to create content securely within a scalable,
/// private cloud service.
class NimbleStudio {
  final _s.RestJsonProtocol _protocol;
  NimbleStudio({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'nimble',
            signingName: 'nimble',
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

  /// Accept EULAs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [eulaIds] :
  /// The EULA ID.
  Future<AcceptEulasResponse> acceptEulas({
    required String studioId,
    String? clientToken,
    List<String>? eulaIds,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (eulaIds != null) 'eulaIds': eulaIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/eula-acceptances',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AcceptEulasResponse.fromJson(response);
  }

  /// Create a launch profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [ec2SubnetIds] :
  /// Specifies the IDs of the EC2 subnets where streaming sessions will be
  /// accessible from. These subnets must support the specified instance types.
  ///
  /// Parameter [launchProfileProtocolVersions] :
  /// The version number of the protocol that is used by the launch profile. The
  /// only valid version is "2021-03-31".
  ///
  /// Parameter [name] :
  /// The name for the launch profile.
  ///
  /// Parameter [streamConfiguration] :
  /// A configuration for a streaming session.
  ///
  /// Parameter [studioComponentIds] :
  /// Unique identifiers for a collection of studio components that can be used
  /// with this launch profile.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  Future<CreateLaunchProfileResponse> createLaunchProfile({
    required List<String> ec2SubnetIds,
    required List<String> launchProfileProtocolVersions,
    required String name,
    required StreamConfigurationCreate streamConfiguration,
    required List<String> studioComponentIds,
    required String studioId,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ec2SubnetIds': ec2SubnetIds,
      'launchProfileProtocolVersions': launchProfileProtocolVersions,
      'name': name,
      'streamConfiguration': streamConfiguration,
      'studioComponentIds': studioComponentIds,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLaunchProfileResponse.fromJson(response);
  }

  /// Creates a streaming image resource in a studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [ec2ImageId] :
  /// The ID of an EC2 machine image with which to create this streaming image.
  ///
  /// Parameter [name] :
  /// A friendly name for a streaming image resource.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [description] :
  /// A human-readable description of the streaming image.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  Future<CreateStreamingImageResponse> createStreamingImage({
    required String ec2ImageId,
    required String name,
    required String studioId,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ec2ImageId': ec2ImageId,
      'name': name,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-images',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamingImageResponse.fromJson(response);
  }

  /// Creates a streaming session in a studio.
  ///
  /// After invoking this operation, you must poll GetStreamingSession until the
  /// streaming session is in the <code>READY</code> state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [ec2InstanceType] :
  /// The EC2 Instance type used for the streaming session.
  ///
  /// Parameter [ownedBy] :
  /// The user ID of the user that owns the streaming session. The user that
  /// owns the session will be logging into the session and interacting with the
  /// virtual workstation.
  ///
  /// Parameter [streamingImageId] :
  /// The ID of the streaming image.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  Future<CreateStreamingSessionResponse> createStreamingSession({
    required String launchProfileId,
    required String studioId,
    String? clientToken,
    StreamingInstanceType? ec2InstanceType,
    String? ownedBy,
    String? streamingImageId,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'launchProfileId': launchProfileId,
      if (ec2InstanceType != null) 'ec2InstanceType': ec2InstanceType.toValue(),
      if (ownedBy != null) 'ownedBy': ownedBy,
      if (streamingImageId != null) 'streamingImageId': streamingImageId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamingSessionResponse.fromJson(response);
  }

  /// Creates a streaming session stream for a streaming session.
  ///
  /// After invoking this API, invoke GetStreamingSessionStream with the
  /// returned streamId to poll the resource until it is in the
  /// <code>READY</code> state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [sessionId] :
  /// The streaming session ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [expirationInSeconds] :
  /// The expiration time in seconds.
  Future<CreateStreamingSessionStreamResponse> createStreamingSessionStream({
    required String sessionId,
    required String studioId,
    String? clientToken,
    int? expirationInSeconds,
  }) async {
    _s.validateNumRange(
      'expirationInSeconds',
      expirationInSeconds,
      60,
      3600,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (expirationInSeconds != null)
        'expirationInSeconds': expirationInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions/${Uri.encodeComponent(sessionId)}/streams',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamingSessionStreamResponse.fromJson(response);
  }

  /// Create a new studio.
  ///
  /// When creating a studio, two IAM roles must be provided: the admin role and
  /// the user role. These roles are assumed by your users when they log in to
  /// the Nimble Studio portal.
  ///
  /// The user role must have the <code>AmazonNimbleStudio-StudioUser</code>
  /// managed policy attached for the portal to function properly.
  ///
  /// The admin role must have the <code>AmazonNimbleStudio-StudioAdmin</code>
  /// managed policy attached for the portal to function properly.
  ///
  /// You may optionally specify a KMS key in the
  /// <code>StudioEncryptionConfiguration</code>.
  ///
  /// In Nimble Studio, resource names, descriptions, initialization scripts,
  /// and other data you provide are always encrypted at rest using an KMS key.
  /// By default, this key is owned by Amazon Web Services and managed on your
  /// behalf. You may provide your own KMS key when calling
  /// <code>CreateStudio</code> to encrypt this data using a key you own and
  /// manage.
  ///
  /// When providing an KMS key during studio creation, Nimble Studio creates
  /// KMS grants in your account to provide your studio user and admin roles
  /// access to these KMS keys.
  ///
  /// If you delete this grant, the studio will no longer be accessible to your
  /// portal users.
  ///
  /// If you delete the studio KMS key, your studio will no longer be
  /// accessible.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [adminRoleArn] :
  /// The IAM role that studio admins will assume when logging in to the Nimble
  /// Studio portal.
  ///
  /// Parameter [displayName] :
  /// A friendly name for the studio.
  ///
  /// Parameter [studioName] :
  /// The studio name that is used in the URL of the Nimble Studio portal when
  /// accessed by Nimble Studio users.
  ///
  /// Parameter [userRoleArn] :
  /// The IAM role that studio users will assume when logging in to the Nimble
  /// Studio portal.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [studioEncryptionConfiguration] :
  /// The studio encryption configuration.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  Future<CreateStudioResponse> createStudio({
    required String adminRoleArn,
    required String displayName,
    required String studioName,
    required String userRoleArn,
    String? clientToken,
    StudioEncryptionConfiguration? studioEncryptionConfiguration,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'adminRoleArn': adminRoleArn,
      'displayName': displayName,
      'studioName': studioName,
      'userRoleArn': userRoleArn,
      if (studioEncryptionConfiguration != null)
        'studioEncryptionConfiguration': studioEncryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2020-08-01/studios',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStudioResponse.fromJson(response);
  }

  /// Creates a studio component resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name for the studio component.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [type] :
  /// The type of the studio component.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [configuration] :
  /// The configuration of the studio component, based on component type.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [ec2SecurityGroupIds] :
  /// The EC2 security groups that control access to the studio component.
  ///
  /// Parameter [initializationScripts] :
  /// Initialization scripts for studio components.
  ///
  /// Parameter [runtimeRoleArn] :
  /// An IAM role attached to a Studio Component that gives the studio component
  /// access to Amazon Web Services resources at anytime while the instance is
  /// running.
  ///
  /// Parameter [scriptParameters] :
  /// Parameters for the studio component scripts.
  ///
  /// Parameter [secureInitializationRoleArn] :
  /// An IAM role attached to Studio Component when the system initialization
  /// script runs which give the studio component access to Amazon Web Services
  /// resources when the system initialization script runs.
  ///
  /// Parameter [subtype] :
  /// The specific subtype of a studio component.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  Future<CreateStudioComponentResponse> createStudioComponent({
    required String name,
    required String studioId,
    required StudioComponentType type,
    String? clientToken,
    StudioComponentConfiguration? configuration,
    String? description,
    List<String>? ec2SecurityGroupIds,
    List<StudioComponentInitializationScript>? initializationScripts,
    String? runtimeRoleArn,
    List<ScriptParameterKeyValue>? scriptParameters,
    String? secureInitializationRoleArn,
    StudioComponentSubtype? subtype,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.toValue(),
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (ec2SecurityGroupIds != null)
        'ec2SecurityGroupIds': ec2SecurityGroupIds,
      if (initializationScripts != null)
        'initializationScripts': initializationScripts,
      if (runtimeRoleArn != null) 'runtimeRoleArn': runtimeRoleArn,
      if (scriptParameters != null) 'scriptParameters': scriptParameters,
      if (secureInitializationRoleArn != null)
        'secureInitializationRoleArn': secureInitializationRoleArn,
      if (subtype != null) 'subtype': subtype.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/studio-components',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStudioComponentResponse.fromJson(response);
  }

  /// Permanently delete a launch profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<DeleteLaunchProfileResponse> deleteLaunchProfile({
    required String launchProfileId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLaunchProfileResponse.fromJson(response);
  }

  /// Delete a user from launch profile membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [principalId] :
  /// The principal ID. This currently supports a IAM Identity Center UserId.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<void> deleteLaunchProfileMember({
    required String launchProfileId,
    required String principalId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/membership/${Uri.encodeComponent(principalId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete streaming image.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [streamingImageId] :
  /// The streaming image ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<DeleteStreamingImageResponse> deleteStreamingImage({
    required String streamingImageId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-images/${Uri.encodeComponent(streamingImageId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStreamingImageResponse.fromJson(response);
  }

  /// Deletes streaming session resource.
  ///
  /// After invoking this operation, use GetStreamingSession to poll the
  /// resource until it transitions to a <code>DELETED</code> state.
  ///
  /// A streaming session will count against your streaming session quota until
  /// it is marked <code>DELETED</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [sessionId] :
  /// The streaming session ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<DeleteStreamingSessionResponse> deleteStreamingSession({
    required String sessionId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions/${Uri.encodeComponent(sessionId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStreamingSessionResponse.fromJson(response);
  }

  /// Delete a studio resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<DeleteStudioResponse> deleteStudio({
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2020-08-01/studios/${Uri.encodeComponent(studioId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStudioResponse.fromJson(response);
  }

  /// Deletes a studio component resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioComponentId] :
  /// The studio component ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<DeleteStudioComponentResponse> deleteStudioComponent({
    required String studioComponentId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/studio-components/${Uri.encodeComponent(studioComponentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStudioComponentResponse.fromJson(response);
  }

  /// Delete a user from studio membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [principalId] :
  /// The principal ID. This currently supports a IAM Identity Center UserId.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<void> deleteStudioMember({
    required String principalId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/membership/${Uri.encodeComponent(principalId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get EULA.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [eulaId] :
  /// The EULA ID.
  Future<GetEulaResponse> getEula({
    required String eulaId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-08-01/eulas/${Uri.encodeComponent(eulaId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEulaResponse.fromJson(response);
  }

  /// Get a launch profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetLaunchProfileResponse> getLaunchProfile({
    required String launchProfileId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLaunchProfileResponse.fromJson(response);
  }

  /// Launch profile details include the launch profile resource and summary
  /// information of resources that are used by, or available to, the launch
  /// profile. This includes the name and description of all studio components
  /// used by the launch profiles, and the name and description of streaming
  /// images that can be used with this launch profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetLaunchProfileDetailsResponse> getLaunchProfileDetails({
    required String launchProfileId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/details',
      exceptionFnMap: _exceptionFns,
    );
    return GetLaunchProfileDetailsResponse.fromJson(response);
  }

  /// Get a launch profile initialization.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [launchProfileProtocolVersions] :
  /// The launch profile protocol versions supported by the client.
  ///
  /// Parameter [launchPurpose] :
  /// The launch purpose.
  ///
  /// Parameter [platform] :
  /// The platform where this Launch Profile will be used, either Windows or
  /// Linux.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetLaunchProfileInitializationResponse>
      getLaunchProfileInitialization({
    required String launchProfileId,
    required List<String> launchProfileProtocolVersions,
    required String launchPurpose,
    required String platform,
    required String studioId,
  }) async {
    final $query = <String, List<String>>{
      'launchProfileProtocolVersions': launchProfileProtocolVersions,
      'launchPurpose': [launchPurpose],
      'platform': [platform],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/init',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLaunchProfileInitializationResponse.fromJson(response);
  }

  /// Get a user persona in launch profile membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [principalId] :
  /// The principal ID. This currently supports a IAM Identity Center UserId.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetLaunchProfileMemberResponse> getLaunchProfileMember({
    required String launchProfileId,
    required String principalId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/membership/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLaunchProfileMemberResponse.fromJson(response);
  }

  /// Get streaming image.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [streamingImageId] :
  /// The streaming image ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStreamingImageResponse> getStreamingImage({
    required String streamingImageId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-images/${Uri.encodeComponent(streamingImageId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamingImageResponse.fromJson(response);
  }

  /// Gets StreamingSession resource.
  ///
  /// Invoke this operation to poll for a streaming session state while creating
  /// or deleting a session.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [sessionId] :
  /// The streaming session ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStreamingSessionResponse> getStreamingSession({
    required String sessionId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamingSessionResponse.fromJson(response);
  }

  /// Gets <code>StreamingSessionBackup</code> resource.
  ///
  /// Invoke this operation to poll for a streaming session backup while
  /// stopping a streaming session.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStreamingSessionBackupResponse> getStreamingSessionBackup({
    required String backupId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-session-backups/${Uri.encodeComponent(backupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamingSessionBackupResponse.fromJson(response);
  }

  /// Gets a StreamingSessionStream for a streaming session.
  ///
  /// Invoke this operation to poll the resource after invoking
  /// <code>CreateStreamingSessionStream</code>.
  ///
  /// After the <code>StreamingSessionStream</code> changes to the
  /// <code>READY</code> state, the url property will contain a stream to be
  /// used with the DCV streaming client.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [sessionId] :
  /// The streaming session ID.
  ///
  /// Parameter [streamId] :
  /// The streaming session stream ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStreamingSessionStreamResponse> getStreamingSessionStream({
    required String sessionId,
    required String streamId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions/${Uri.encodeComponent(sessionId)}/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamingSessionStreamResponse.fromJson(response);
  }

  /// Get a studio resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStudioResponse> getStudio({
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-08-01/studios/${Uri.encodeComponent(studioId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStudioResponse.fromJson(response);
  }

  /// Gets a studio component resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioComponentId] :
  /// The studio component ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStudioComponentResponse> getStudioComponent({
    required String studioComponentId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/studio-components/${Uri.encodeComponent(studioComponentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStudioComponentResponse.fromJson(response);
  }

  /// Get a user's membership in a studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [principalId] :
  /// The principal ID. This currently supports a IAM Identity Center UserId.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  Future<GetStudioMemberResponse> getStudioMember({
    required String principalId,
    required String studioId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/membership/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStudioMemberResponse.fromJson(response);
  }

  /// List EULA acceptances.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [eulaIds] :
  /// The list of EULA IDs that have been previously accepted.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListEulaAcceptancesResponse> listEulaAcceptances({
    required String studioId,
    List<String>? eulaIds,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (eulaIds != null) 'eulaIds': eulaIds,
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/eula-acceptances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEulaAcceptancesResponse.fromJson(response);
  }

  /// List EULAs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [eulaIds] :
  /// The list of EULA IDs that should be returned
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListEulasResponse> listEulas({
    List<String>? eulaIds,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (eulaIds != null) 'eulaIds': eulaIds,
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-08-01/eulas',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEulasResponse.fromJson(response);
  }

  /// Get all users in a given launch profile membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [maxResults] :
  /// The max number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListLaunchProfileMembersResponse> listLaunchProfileMembers({
    required String launchProfileId,
    required String studioId,
    int? maxResults,
    String? nextToken,
  }) async {
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
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/membership',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLaunchProfileMembersResponse.fromJson(response);
  }

  /// List all the launch profiles a studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [maxResults] :
  /// The max number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  ///
  /// Parameter [principalId] :
  /// The principal ID. This currently supports a IAM Identity Center UserId.
  ///
  /// Parameter [states] :
  /// Filter this request to launch profiles in any of the given states.
  Future<ListLaunchProfilesResponse> listLaunchProfiles({
    required String studioId,
    int? maxResults,
    String? nextToken,
    String? principalId,
    List<LaunchProfileState>? states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalId != null) 'principalId': [principalId],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLaunchProfilesResponse.fromJson(response);
  }

  /// List the streaming image resources available to this studio.
  ///
  /// This list will contain both images provided by Amazon Web Services, as
  /// well as streaming images that you have created in your studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  ///
  /// Parameter [owner] :
  /// Filter this request to streaming images with the given owner
  Future<ListStreamingImagesResponse> listStreamingImages({
    required String studioId,
    String? nextToken,
    String? owner,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (owner != null) 'owner': [owner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-images',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamingImagesResponse.fromJson(response);
  }

  /// Lists the backups of a streaming session in a studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  ///
  /// Parameter [ownedBy] :
  /// The user ID of the user that owns the streaming session.
  Future<ListStreamingSessionBackupsResponse> listStreamingSessionBackups({
    required String studioId,
    String? nextToken,
    String? ownedBy,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
      if (ownedBy != null) 'ownedBy': [ownedBy],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-session-backups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamingSessionBackupsResponse.fromJson(response);
  }

  /// Lists the streaming sessions in a studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [createdBy] :
  /// Filters the request to streaming sessions created by the given user.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  ///
  /// Parameter [ownedBy] :
  /// Filters the request to streaming session owned by the given user
  ///
  /// Parameter [sessionIds] :
  /// Filters the request to only the provided session IDs.
  Future<ListStreamingSessionsResponse> listStreamingSessions({
    required String studioId,
    String? createdBy,
    String? nextToken,
    String? ownedBy,
    String? sessionIds,
  }) async {
    final $query = <String, List<String>>{
      if (createdBy != null) 'createdBy': [createdBy],
      if (nextToken != null) 'nextToken': [nextToken],
      if (ownedBy != null) 'ownedBy': [ownedBy],
      if (sessionIds != null) 'sessionIds': [sessionIds],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamingSessionsResponse.fromJson(response);
  }

  /// Lists the <code>StudioComponents</code> in a studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [maxResults] :
  /// The max number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  ///
  /// Parameter [states] :
  /// Filters the request to studio components that are in one of the given
  /// states.
  ///
  /// Parameter [types] :
  /// Filters the request to studio components that are of one of the given
  /// types.
  Future<ListStudioComponentsResponse> listStudioComponents({
    required String studioId,
    int? maxResults,
    String? nextToken,
    List<StudioComponentState>? states,
    List<StudioComponentType>? types,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
      if (types != null) 'types': types.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/studio-components',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStudioComponentsResponse.fromJson(response);
  }

  /// Get all users in a given studio membership.
  /// <note>
  /// <code>ListStudioMembers</code> only returns admin members.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [maxResults] :
  /// The max number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListStudioMembersResponse> listStudioMembers({
    required String studioId,
    int? maxResults,
    String? nextToken,
  }) async {
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
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/membership',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStudioMembersResponse.fromJson(response);
  }

  /// List studios in your Amazon Web Services accounts in the requested Amazon
  /// Web Services Region.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListStudiosResponse> listStudios({
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-08-01/studios',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStudiosResponse.fromJson(response);
  }

  /// Gets the tags for a resource, given its Amazon Resource Names (ARN).
  ///
  /// This operation supports ARNs for all resource types in Nimble Studio that
  /// support tags, including studio, studio component, launch profile,
  /// streaming image, and streaming session. All resources that can be tagged
  /// will contain an ARN property, so you do not have to create this ARN
  /// yourself.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to list
  /// tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-08-01/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Add/update users with given persona to launch profile membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [identityStoreId] :
  /// The ID of the identity store.
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [members] :
  /// A list of members.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<void> putLaunchProfileMembers({
    required String identityStoreId,
    required String launchProfileId,
    required List<NewLaunchProfileMember> members,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'members': members,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/membership',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Add/update users with given persona to studio membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [identityStoreId] :
  /// The ID of the identity store.
  ///
  /// Parameter [members] :
  /// A list of members.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<void> putStudioMembers({
    required String identityStoreId,
    required List<NewStudioMember> members,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'members': members,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/membership',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Transitions sessions from the <code>STOPPED</code> state into the
  /// <code>READY</code> state. The <code>START_IN_PROGRESS</code> state is the
  /// intermediate state between the <code>STOPPED</code> and <code>READY</code>
  /// states.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [sessionId] :
  /// The streaming session ID for the
  /// <code>StartStreamingSessionRequest</code>.
  ///
  /// Parameter [studioId] :
  /// The studio ID for the StartStreamingSessionRequest.
  ///
  /// Parameter [backupId] :
  /// The ID of the backup.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<StartStreamingSessionResponse> startStreamingSession({
    required String sessionId,
    required String studioId,
    String? backupId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (backupId != null) 'backupId': backupId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions/${Uri.encodeComponent(sessionId)}/start',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartStreamingSessionResponse.fromJson(response);
  }

  /// Repairs the IAM Identity Center configuration for a given studio.
  ///
  /// If the studio has a valid IAM Identity Center configuration currently
  /// associated with it, this operation will fail with a validation error.
  ///
  /// If the studio does not have a valid IAM Identity Center configuration
  /// currently associated with it, then a new IAM Identity Center application
  /// is created for the studio and the studio is changed to the
  /// <code>READY</code> state.
  ///
  /// After the IAM Identity Center application is repaired, you must use the
  /// Amazon Nimble Studio console to add administrators and users to your
  /// studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<StartStudioSSOConfigurationRepairResponse>
      startStudioSSOConfigurationRepair({
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/sso-configuration',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartStudioSSOConfigurationRepairResponse.fromJson(response);
  }

  /// Transitions sessions from the <code>READY</code> state into the
  /// <code>STOPPED</code> state. The <code>STOP_IN_PROGRESS</code> state is the
  /// intermediate state between the <code>READY</code> and <code>STOPPED</code>
  /// states.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [sessionId] :
  /// The streaming session ID for the <code>StopStreamingSessionRequest</code>.
  ///
  /// Parameter [studioId] :
  /// The studioId for the StopStreamingSessionRequest.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [volumeRetentionMode] :
  /// Adds additional instructions to a streaming session stop action to either
  /// retain the EBS volumes or delete the EBS volumes.
  Future<StopStreamingSessionResponse> stopStreamingSession({
    required String sessionId,
    required String studioId,
    String? clientToken,
    VolumeRetentionMode? volumeRetentionMode,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (volumeRetentionMode != null)
        'volumeRetentionMode': volumeRetentionMode.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-sessions/${Uri.encodeComponent(sessionId)}/stop',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StopStreamingSessionResponse.fromJson(response);
  }

  /// Creates tags for a resource, given its ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you want to add tags to.
  ///
  /// Parameter [tags] :
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  Future<void> tagResource({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2020-08-01/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// Identifies the Amazon Resource Name(ARN) key from which you are removing
  /// tags.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys. Specify only the tag keys, not the tag values.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2020-08-01/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update a launch profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [launchProfileProtocolVersions] :
  /// The version number of the protocol that is used by the launch profile. The
  /// only valid version is "2021-03-31".
  ///
  /// Parameter [name] :
  /// The name for the launch profile.
  ///
  /// Parameter [streamConfiguration] :
  /// A configuration for a streaming session.
  ///
  /// Parameter [studioComponentIds] :
  /// Unique identifiers for a collection of studio components that can be used
  /// with this launch profile.
  Future<UpdateLaunchProfileResponse> updateLaunchProfile({
    required String launchProfileId,
    required String studioId,
    String? clientToken,
    String? description,
    List<String>? launchProfileProtocolVersions,
    String? name,
    StreamConfigurationCreate? streamConfiguration,
    List<String>? studioComponentIds,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (launchProfileProtocolVersions != null)
        'launchProfileProtocolVersions': launchProfileProtocolVersions,
      if (name != null) 'name': name,
      if (streamConfiguration != null)
        'streamConfiguration': streamConfiguration,
      if (studioComponentIds != null) 'studioComponentIds': studioComponentIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLaunchProfileResponse.fromJson(response);
  }

  /// Update a user persona in launch profile membership.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [launchProfileId] :
  /// The ID of the launch profile used to control access from the streaming
  /// session.
  ///
  /// Parameter [persona] :
  /// The persona.
  ///
  /// Parameter [principalId] :
  /// The principal ID. This currently supports a IAM Identity Center UserId.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  Future<UpdateLaunchProfileMemberResponse> updateLaunchProfileMember({
    required String launchProfileId,
    required LaunchProfilePersona persona,
    required String principalId,
    required String studioId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'persona': persona.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/launch-profiles/${Uri.encodeComponent(launchProfileId)}/membership/${Uri.encodeComponent(principalId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLaunchProfileMemberResponse.fromJson(response);
  }

  /// Update streaming image.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [streamingImageId] :
  /// The streaming image ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [name] :
  /// The name for the streaming image.
  Future<UpdateStreamingImageResponse> updateStreamingImage({
    required String streamingImageId,
    required String studioId,
    String? clientToken,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/streaming-images/${Uri.encodeComponent(streamingImageId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStreamingImageResponse.fromJson(response);
  }

  /// Update a Studio resource.
  ///
  /// Currently, this operation only supports updating the displayName of your
  /// studio.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [adminRoleArn] :
  /// The IAM role that Studio Admins will assume when logging in to the Nimble
  /// Studio portal.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [displayName] :
  /// A friendly name for the studio.
  ///
  /// Parameter [userRoleArn] :
  /// The IAM role that Studio Users will assume when logging in to the Nimble
  /// Studio portal.
  Future<UpdateStudioResponse> updateStudio({
    required String studioId,
    String? adminRoleArn,
    String? clientToken,
    String? displayName,
    String? userRoleArn,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (adminRoleArn != null) 'adminRoleArn': adminRoleArn,
      if (displayName != null) 'displayName': displayName,
      if (userRoleArn != null) 'userRoleArn': userRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2020-08-01/studios/${Uri.encodeComponent(studioId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStudioResponse.fromJson(response);
  }

  /// Updates a studio component resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [studioComponentId] :
  /// The studio component ID.
  ///
  /// Parameter [studioId] :
  /// The studio ID.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don’t specify a client token, the
  /// Amazon Web Services SDK automatically generates a client token and uses it
  /// for the request to ensure idempotency.
  ///
  /// Parameter [configuration] :
  /// The configuration of the studio component, based on component type.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [ec2SecurityGroupIds] :
  /// The EC2 security groups that control access to the studio component.
  ///
  /// Parameter [initializationScripts] :
  /// Initialization scripts for studio components.
  ///
  /// Parameter [name] :
  /// The name for the studio component.
  ///
  /// Parameter [runtimeRoleArn] :
  /// An IAM role attached to a Studio Component that gives the studio component
  /// access to Amazon Web Services resources at anytime while the instance is
  /// running.
  ///
  /// Parameter [scriptParameters] :
  /// Parameters for the studio component scripts.
  ///
  /// Parameter [secureInitializationRoleArn] :
  /// An IAM role attached to Studio Component when the system initialization
  /// script runs which give the studio component access to Amazon Web Services
  /// resources when the system initialization script runs.
  ///
  /// Parameter [subtype] :
  /// The specific subtype of a studio component.
  ///
  /// Parameter [type] :
  /// The type of the studio component.
  Future<UpdateStudioComponentResponse> updateStudioComponent({
    required String studioComponentId,
    required String studioId,
    String? clientToken,
    StudioComponentConfiguration? configuration,
    String? description,
    List<String>? ec2SecurityGroupIds,
    List<StudioComponentInitializationScript>? initializationScripts,
    String? name,
    String? runtimeRoleArn,
    List<ScriptParameterKeyValue>? scriptParameters,
    String? secureInitializationRoleArn,
    StudioComponentSubtype? subtype,
    StudioComponentType? type,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (ec2SecurityGroupIds != null)
        'ec2SecurityGroupIds': ec2SecurityGroupIds,
      if (initializationScripts != null)
        'initializationScripts': initializationScripts,
      if (name != null) 'name': name,
      if (runtimeRoleArn != null) 'runtimeRoleArn': runtimeRoleArn,
      if (scriptParameters != null) 'scriptParameters': scriptParameters,
      if (secureInitializationRoleArn != null)
        'secureInitializationRoleArn': secureInitializationRoleArn,
      if (subtype != null) 'subtype': subtype.toValue(),
      if (type != null) 'type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2020-08-01/studios/${Uri.encodeComponent(studioId)}/studio-components/${Uri.encodeComponent(studioComponentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStudioComponentResponse.fromJson(response);
  }
}

class AcceptEulasResponse {
  /// A collection of EULA acceptances.
  final List<EulaAcceptance>? eulaAcceptances;

  AcceptEulasResponse({
    this.eulaAcceptances,
  });

  factory AcceptEulasResponse.fromJson(Map<String, dynamic> json) {
    return AcceptEulasResponse(
      eulaAcceptances: (json['eulaAcceptances'] as List?)
          ?.whereNotNull()
          .map((e) => EulaAcceptance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eulaAcceptances = this.eulaAcceptances;
    return {
      if (eulaAcceptances != null) 'eulaAcceptances': eulaAcceptances,
    };
  }
}

/// An LDAP attribute of an Active Directory computer account, in the form of a
/// name:value pair.
class ActiveDirectoryComputerAttribute {
  /// The name for the LDAP attribute.
  final String? name;

  /// The value for the LDAP attribute.
  final String? value;

  ActiveDirectoryComputerAttribute({
    this.name,
    this.value,
  });

  factory ActiveDirectoryComputerAttribute.fromJson(Map<String, dynamic> json) {
    return ActiveDirectoryComputerAttribute(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// The configuration for a Directory Service for Microsoft Active Directory
/// studio resource.
class ActiveDirectoryConfiguration {
  /// A collection of custom attributes for an Active Directory computer.
  final List<ActiveDirectoryComputerAttribute>? computerAttributes;

  /// The directory ID of the Directory Service for Microsoft Active Directory to
  /// access using this studio component.
  final String? directoryId;

  /// The distinguished name (DN) and organizational unit (OU) of an Active
  /// Directory computer.
  final String? organizationalUnitDistinguishedName;

  ActiveDirectoryConfiguration({
    this.computerAttributes,
    this.directoryId,
    this.organizationalUnitDistinguishedName,
  });

  factory ActiveDirectoryConfiguration.fromJson(Map<String, dynamic> json) {
    return ActiveDirectoryConfiguration(
      computerAttributes: (json['computerAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => ActiveDirectoryComputerAttribute.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      directoryId: json['directoryId'] as String?,
      organizationalUnitDistinguishedName:
          json['organizationalUnitDistinguishedName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computerAttributes = this.computerAttributes;
    final directoryId = this.directoryId;
    final organizationalUnitDistinguishedName =
        this.organizationalUnitDistinguishedName;
    return {
      if (computerAttributes != null) 'computerAttributes': computerAttributes,
      if (directoryId != null) 'directoryId': directoryId,
      if (organizationalUnitDistinguishedName != null)
        'organizationalUnitDistinguishedName':
            organizationalUnitDistinguishedName,
    };
  }
}

enum AutomaticTerminationMode {
  deactivated,
  activated,
}

extension AutomaticTerminationModeValueExtension on AutomaticTerminationMode {
  String toValue() {
    switch (this) {
      case AutomaticTerminationMode.deactivated:
        return 'DEACTIVATED';
      case AutomaticTerminationMode.activated:
        return 'ACTIVATED';
    }
  }
}

extension AutomaticTerminationModeFromString on String {
  AutomaticTerminationMode toAutomaticTerminationMode() {
    switch (this) {
      case 'DEACTIVATED':
        return AutomaticTerminationMode.deactivated;
      case 'ACTIVATED':
        return AutomaticTerminationMode.activated;
    }
    throw Exception('$this is not known in enum AutomaticTerminationMode');
  }
}

/// The configuration for a render farm that is associated with a studio
/// resource.
class ComputeFarmConfiguration {
  /// The name of an Active Directory user that is used on ComputeFarm worker
  /// instances.
  final String? activeDirectoryUser;

  /// The endpoint of the ComputeFarm that is accessed by the studio component
  /// resource.
  final String? endpoint;

  ComputeFarmConfiguration({
    this.activeDirectoryUser,
    this.endpoint,
  });

  factory ComputeFarmConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeFarmConfiguration(
      activeDirectoryUser: json['activeDirectoryUser'] as String?,
      endpoint: json['endpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryUser = this.activeDirectoryUser;
    final endpoint = this.endpoint;
    return {
      if (activeDirectoryUser != null)
        'activeDirectoryUser': activeDirectoryUser,
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class CreateLaunchProfileResponse {
  /// The launch profile.
  final LaunchProfile? launchProfile;

  CreateLaunchProfileResponse({
    this.launchProfile,
  });

  factory CreateLaunchProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateLaunchProfileResponse(
      launchProfile: json['launchProfile'] != null
          ? LaunchProfile.fromJson(
              json['launchProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfile = this.launchProfile;
    return {
      if (launchProfile != null) 'launchProfile': launchProfile,
    };
  }
}

class CreateStreamingImageResponse {
  /// The streaming image.
  final StreamingImage? streamingImage;

  CreateStreamingImageResponse({
    this.streamingImage,
  });

  factory CreateStreamingImageResponse.fromJson(Map<String, dynamic> json) {
    return CreateStreamingImageResponse(
      streamingImage: json['streamingImage'] != null
          ? StreamingImage.fromJson(
              json['streamingImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingImage = this.streamingImage;
    return {
      if (streamingImage != null) 'streamingImage': streamingImage,
    };
  }
}

class CreateStreamingSessionResponse {
  /// The session.
  final StreamingSession? session;

  CreateStreamingSessionResponse({
    this.session,
  });

  factory CreateStreamingSessionResponse.fromJson(Map<String, dynamic> json) {
    return CreateStreamingSessionResponse(
      session: json['session'] != null
          ? StreamingSession.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

class CreateStreamingSessionStreamResponse {
  /// The stream.
  final StreamingSessionStream? stream;

  CreateStreamingSessionStreamResponse({
    this.stream,
  });

  factory CreateStreamingSessionStreamResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateStreamingSessionStreamResponse(
      stream: json['stream'] != null
          ? StreamingSessionStream.fromJson(
              json['stream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

class CreateStudioComponentResponse {
  /// Information about the studio component.
  final StudioComponent? studioComponent;

  CreateStudioComponentResponse({
    this.studioComponent,
  });

  factory CreateStudioComponentResponse.fromJson(Map<String, dynamic> json) {
    return CreateStudioComponentResponse(
      studioComponent: json['studioComponent'] != null
          ? StudioComponent.fromJson(
              json['studioComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final studioComponent = this.studioComponent;
    return {
      if (studioComponent != null) 'studioComponent': studioComponent,
    };
  }
}

class CreateStudioResponse {
  /// Information about a studio.
  final Studio? studio;

  CreateStudioResponse({
    this.studio,
  });

  factory CreateStudioResponse.fromJson(Map<String, dynamic> json) {
    return CreateStudioResponse(
      studio: json['studio'] != null
          ? Studio.fromJson(json['studio'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final studio = this.studio;
    return {
      if (studio != null) 'studio': studio,
    };
  }
}

class DeleteLaunchProfileMemberResponse {
  DeleteLaunchProfileMemberResponse();

  factory DeleteLaunchProfileMemberResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLaunchProfileMemberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLaunchProfileResponse {
  /// The launch profile.
  final LaunchProfile? launchProfile;

  DeleteLaunchProfileResponse({
    this.launchProfile,
  });

  factory DeleteLaunchProfileResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLaunchProfileResponse(
      launchProfile: json['launchProfile'] != null
          ? LaunchProfile.fromJson(
              json['launchProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfile = this.launchProfile;
    return {
      if (launchProfile != null) 'launchProfile': launchProfile,
    };
  }
}

class DeleteStreamingImageResponse {
  /// The streaming image.
  final StreamingImage? streamingImage;

  DeleteStreamingImageResponse({
    this.streamingImage,
  });

  factory DeleteStreamingImageResponse.fromJson(Map<String, dynamic> json) {
    return DeleteStreamingImageResponse(
      streamingImage: json['streamingImage'] != null
          ? StreamingImage.fromJson(
              json['streamingImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingImage = this.streamingImage;
    return {
      if (streamingImage != null) 'streamingImage': streamingImage,
    };
  }
}

class DeleteStreamingSessionResponse {
  /// The session.
  final StreamingSession? session;

  DeleteStreamingSessionResponse({
    this.session,
  });

  factory DeleteStreamingSessionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteStreamingSessionResponse(
      session: json['session'] != null
          ? StreamingSession.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

class DeleteStudioComponentResponse {
  /// Information about the studio component.
  final StudioComponent? studioComponent;

  DeleteStudioComponentResponse({
    this.studioComponent,
  });

  factory DeleteStudioComponentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteStudioComponentResponse(
      studioComponent: json['studioComponent'] != null
          ? StudioComponent.fromJson(
              json['studioComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final studioComponent = this.studioComponent;
    return {
      if (studioComponent != null) 'studioComponent': studioComponent,
    };
  }
}

class DeleteStudioMemberResponse {
  DeleteStudioMemberResponse();

  factory DeleteStudioMemberResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStudioMemberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStudioResponse {
  /// Information about a studio.
  final Studio studio;

  DeleteStudioResponse({
    required this.studio,
  });

  factory DeleteStudioResponse.fromJson(Map<String, dynamic> json) {
    return DeleteStudioResponse(
      studio: Studio.fromJson(json['studio'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final studio = this.studio;
    return {
      'studio': studio,
    };
  }
}

/// Represents a EULA resource.
class Eula {
  /// The EULA content.
  final String? content;

  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The EULA ID.
  final String? eulaId;

  /// The name for the EULA.
  final String? name;

  /// The ISO timestamp in seconds for when the resource was updated.
  final DateTime? updatedAt;

  Eula({
    this.content,
    this.createdAt,
    this.eulaId,
    this.name,
    this.updatedAt,
  });

  factory Eula.fromJson(Map<String, dynamic> json) {
    return Eula(
      content: json['content'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      eulaId: json['eulaId'] as String?,
      name: json['name'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final createdAt = this.createdAt;
    final eulaId = this.eulaId;
    final name = this.name;
    final updatedAt = this.updatedAt;
    return {
      if (content != null) 'content': content,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (eulaId != null) 'eulaId': eulaId,
      if (name != null) 'name': name,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The acceptance of a EULA, required to use Amazon-provided streaming images.
class EulaAcceptance {
  /// The ISO timestamp in seconds for when the EULA was accepted.
  final DateTime? acceptedAt;

  /// The ID of the person who accepted the EULA.
  final String? acceptedBy;

  /// The ID of the acceptee.
  final String? accepteeId;

  /// The EULA acceptance ID.
  final String? eulaAcceptanceId;

  /// The EULA ID.
  final String? eulaId;

  EulaAcceptance({
    this.acceptedAt,
    this.acceptedBy,
    this.accepteeId,
    this.eulaAcceptanceId,
    this.eulaId,
  });

  factory EulaAcceptance.fromJson(Map<String, dynamic> json) {
    return EulaAcceptance(
      acceptedAt: timeStampFromJson(json['acceptedAt']),
      acceptedBy: json['acceptedBy'] as String?,
      accepteeId: json['accepteeId'] as String?,
      eulaAcceptanceId: json['eulaAcceptanceId'] as String?,
      eulaId: json['eulaId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptedAt = this.acceptedAt;
    final acceptedBy = this.acceptedBy;
    final accepteeId = this.accepteeId;
    final eulaAcceptanceId = this.eulaAcceptanceId;
    final eulaId = this.eulaId;
    return {
      if (acceptedAt != null) 'acceptedAt': iso8601ToJson(acceptedAt),
      if (acceptedBy != null) 'acceptedBy': acceptedBy,
      if (accepteeId != null) 'accepteeId': accepteeId,
      if (eulaAcceptanceId != null) 'eulaAcceptanceId': eulaAcceptanceId,
      if (eulaId != null) 'eulaId': eulaId,
    };
  }
}

class GetEulaResponse {
  /// The EULA.
  final Eula? eula;

  GetEulaResponse({
    this.eula,
  });

  factory GetEulaResponse.fromJson(Map<String, dynamic> json) {
    return GetEulaResponse(
      eula: json['eula'] != null
          ? Eula.fromJson(json['eula'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eula = this.eula;
    return {
      if (eula != null) 'eula': eula,
    };
  }
}

class GetLaunchProfileDetailsResponse {
  /// The launch profile.
  final LaunchProfile? launchProfile;

  /// A collection of streaming images.
  final List<StreamingImage>? streamingImages;

  /// A collection of studio component summaries.
  final List<StudioComponentSummary>? studioComponentSummaries;

  GetLaunchProfileDetailsResponse({
    this.launchProfile,
    this.streamingImages,
    this.studioComponentSummaries,
  });

  factory GetLaunchProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetLaunchProfileDetailsResponse(
      launchProfile: json['launchProfile'] != null
          ? LaunchProfile.fromJson(
              json['launchProfile'] as Map<String, dynamic>)
          : null,
      streamingImages: (json['streamingImages'] as List?)
          ?.whereNotNull()
          .map((e) => StreamingImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      studioComponentSummaries: (json['studioComponentSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => StudioComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfile = this.launchProfile;
    final streamingImages = this.streamingImages;
    final studioComponentSummaries = this.studioComponentSummaries;
    return {
      if (launchProfile != null) 'launchProfile': launchProfile,
      if (streamingImages != null) 'streamingImages': streamingImages,
      if (studioComponentSummaries != null)
        'studioComponentSummaries': studioComponentSummaries,
    };
  }
}

class GetLaunchProfileInitializationResponse {
  /// The launch profile initialization.
  final LaunchProfileInitialization? launchProfileInitialization;

  GetLaunchProfileInitializationResponse({
    this.launchProfileInitialization,
  });

  factory GetLaunchProfileInitializationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLaunchProfileInitializationResponse(
      launchProfileInitialization: json['launchProfileInitialization'] != null
          ? LaunchProfileInitialization.fromJson(
              json['launchProfileInitialization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfileInitialization = this.launchProfileInitialization;
    return {
      if (launchProfileInitialization != null)
        'launchProfileInitialization': launchProfileInitialization,
    };
  }
}

class GetLaunchProfileMemberResponse {
  /// The member.
  final LaunchProfileMembership? member;

  GetLaunchProfileMemberResponse({
    this.member,
  });

  factory GetLaunchProfileMemberResponse.fromJson(Map<String, dynamic> json) {
    return GetLaunchProfileMemberResponse(
      member: json['member'] != null
          ? LaunchProfileMembership.fromJson(
              json['member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'member': member,
    };
  }
}

class GetLaunchProfileResponse {
  /// The launch profile.
  final LaunchProfile? launchProfile;

  GetLaunchProfileResponse({
    this.launchProfile,
  });

  factory GetLaunchProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetLaunchProfileResponse(
      launchProfile: json['launchProfile'] != null
          ? LaunchProfile.fromJson(
              json['launchProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfile = this.launchProfile;
    return {
      if (launchProfile != null) 'launchProfile': launchProfile,
    };
  }
}

class GetStreamingImageResponse {
  /// The streaming image.
  final StreamingImage? streamingImage;

  GetStreamingImageResponse({
    this.streamingImage,
  });

  factory GetStreamingImageResponse.fromJson(Map<String, dynamic> json) {
    return GetStreamingImageResponse(
      streamingImage: json['streamingImage'] != null
          ? StreamingImage.fromJson(
              json['streamingImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingImage = this.streamingImage;
    return {
      if (streamingImage != null) 'streamingImage': streamingImage,
    };
  }
}

class GetStreamingSessionBackupResponse {
  /// Information about the streaming session backup.
  final StreamingSessionBackup? streamingSessionBackup;

  GetStreamingSessionBackupResponse({
    this.streamingSessionBackup,
  });

  factory GetStreamingSessionBackupResponse.fromJson(
      Map<String, dynamic> json) {
    return GetStreamingSessionBackupResponse(
      streamingSessionBackup: json['streamingSessionBackup'] != null
          ? StreamingSessionBackup.fromJson(
              json['streamingSessionBackup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingSessionBackup = this.streamingSessionBackup;
    return {
      if (streamingSessionBackup != null)
        'streamingSessionBackup': streamingSessionBackup,
    };
  }
}

class GetStreamingSessionResponse {
  /// The session.
  final StreamingSession? session;

  GetStreamingSessionResponse({
    this.session,
  });

  factory GetStreamingSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetStreamingSessionResponse(
      session: json['session'] != null
          ? StreamingSession.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

class GetStreamingSessionStreamResponse {
  /// The stream.
  final StreamingSessionStream? stream;

  GetStreamingSessionStreamResponse({
    this.stream,
  });

  factory GetStreamingSessionStreamResponse.fromJson(
      Map<String, dynamic> json) {
    return GetStreamingSessionStreamResponse(
      stream: json['stream'] != null
          ? StreamingSessionStream.fromJson(
              json['stream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

class GetStudioComponentResponse {
  /// Information about the studio component.
  final StudioComponent? studioComponent;

  GetStudioComponentResponse({
    this.studioComponent,
  });

  factory GetStudioComponentResponse.fromJson(Map<String, dynamic> json) {
    return GetStudioComponentResponse(
      studioComponent: json['studioComponent'] != null
          ? StudioComponent.fromJson(
              json['studioComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final studioComponent = this.studioComponent;
    return {
      if (studioComponent != null) 'studioComponent': studioComponent,
    };
  }
}

class GetStudioMemberResponse {
  /// The member.
  final StudioMembership? member;

  GetStudioMemberResponse({
    this.member,
  });

  factory GetStudioMemberResponse.fromJson(Map<String, dynamic> json) {
    return GetStudioMemberResponse(
      member: json['member'] != null
          ? StudioMembership.fromJson(json['member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'member': member,
    };
  }
}

class GetStudioResponse {
  /// Information about a studio.
  final Studio studio;

  GetStudioResponse({
    required this.studio,
  });

  factory GetStudioResponse.fromJson(Map<String, dynamic> json) {
    return GetStudioResponse(
      studio: Studio.fromJson(json['studio'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final studio = this.studio;
    return {
      'studio': studio,
    };
  }
}

/// A launch profile controls your artist workforce’s access to studio
/// components, like compute farms, shared file systems, managed file systems,
/// and license server configurations, as well as instance types and Amazon
/// Machine Images (AMIs).
///
/// Studio administrators create launch profiles in the Nimble Studio console.
/// Artists can use their launch profiles to launch an instance from the Nimble
/// Studio portal. Each user’s launch profile defines how they can launch a
/// streaming session. By default, studio admins can use all launch profiles.
class LaunchProfile {
  /// The Amazon Resource Name (ARN) that is assigned to a studio resource and
  /// uniquely identifies it. ARNs are unique across all Regions.
  final String? arn;

  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The user ID of the user that created the launch profile.
  final String? createdBy;

  /// A human-readable description of the launch profile.
  final String? description;

  /// Unique identifiers for a collection of EC2 subnets.
  final List<String>? ec2SubnetIds;

  /// The ID of the launch profile used to control access from the streaming
  /// session.
  final String? launchProfileId;

  /// The version number of the protocol that is used by the launch profile. The
  /// only valid version is "2021-03-31".
  final List<String>? launchProfileProtocolVersions;

  /// A friendly name for the launch profile.
  final String? name;

  /// The current state.
  final LaunchProfileState? state;

  /// The status code.
  final LaunchProfileStatusCode? statusCode;

  /// The status message for the launch profile.
  final String? statusMessage;

  /// A configuration for a streaming session.
  final StreamConfiguration? streamConfiguration;

  /// Unique identifiers for a collection of studio components that can be used
  /// with this launch profile.
  final List<String>? studioComponentIds;

  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  final Map<String, String>? tags;

  /// The ISO timestamp in seconds for when the resource was updated.
  final DateTime? updatedAt;

  /// The user ID of the user that most recently updated the resource.
  final String? updatedBy;

  /// The list of the latest validation results.
  final List<ValidationResult>? validationResults;

  LaunchProfile({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.description,
    this.ec2SubnetIds,
    this.launchProfileId,
    this.launchProfileProtocolVersions,
    this.name,
    this.state,
    this.statusCode,
    this.statusMessage,
    this.streamConfiguration,
    this.studioComponentIds,
    this.tags,
    this.updatedAt,
    this.updatedBy,
    this.validationResults,
  });

  factory LaunchProfile.fromJson(Map<String, dynamic> json) {
    return LaunchProfile(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      ec2SubnetIds: (json['ec2SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      launchProfileId: json['launchProfileId'] as String?,
      launchProfileProtocolVersions:
          (json['launchProfileProtocolVersions'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toLaunchProfileState(),
      statusCode: (json['statusCode'] as String?)?.toLaunchProfileStatusCode(),
      statusMessage: json['statusMessage'] as String?,
      streamConfiguration: json['streamConfiguration'] != null
          ? StreamConfiguration.fromJson(
              json['streamConfiguration'] as Map<String, dynamic>)
          : null,
      studioComponentIds: (json['studioComponentIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      validationResults: (json['validationResults'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final ec2SubnetIds = this.ec2SubnetIds;
    final launchProfileId = this.launchProfileId;
    final launchProfileProtocolVersions = this.launchProfileProtocolVersions;
    final name = this.name;
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final streamConfiguration = this.streamConfiguration;
    final studioComponentIds = this.studioComponentIds;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final validationResults = this.validationResults;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (ec2SubnetIds != null) 'ec2SubnetIds': ec2SubnetIds,
      if (launchProfileId != null) 'launchProfileId': launchProfileId,
      if (launchProfileProtocolVersions != null)
        'launchProfileProtocolVersions': launchProfileProtocolVersions,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (streamConfiguration != null)
        'streamConfiguration': streamConfiguration,
      if (studioComponentIds != null) 'studioComponentIds': studioComponentIds,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (validationResults != null) 'validationResults': validationResults,
    };
  }
}

/// A launch profile initialization contains information required for a
/// workstation or server to connect to a launch profile.
///
/// This includes scripts, endpoints, security groups, subnets, and other
/// configuration.
class LaunchProfileInitialization {
  /// A <code>LaunchProfileInitializationActiveDirectory</code> resource.
  final LaunchProfileInitializationActiveDirectory? activeDirectory;

  /// The EC2 security groups that control access to the studio component.
  final List<String>? ec2SecurityGroupIds;

  /// The ID of the launch profile used to control access from the streaming
  /// session.
  final String? launchProfileId;

  /// The version number of the protocol that is used by the launch profile. The
  /// only valid version is "2021-03-31".
  final String? launchProfileProtocolVersion;

  /// The launch purpose.
  final String? launchPurpose;

  /// The name for the launch profile.
  final String? name;

  /// The platform of the launch platform, either Windows or Linux.
  final LaunchProfilePlatform? platform;

  /// The system initializtion scripts.
  final List<LaunchProfileInitializationScript>? systemInitializationScripts;

  /// The user initializtion scripts.
  final List<LaunchProfileInitializationScript>? userInitializationScripts;

  LaunchProfileInitialization({
    this.activeDirectory,
    this.ec2SecurityGroupIds,
    this.launchProfileId,
    this.launchProfileProtocolVersion,
    this.launchPurpose,
    this.name,
    this.platform,
    this.systemInitializationScripts,
    this.userInitializationScripts,
  });

  factory LaunchProfileInitialization.fromJson(Map<String, dynamic> json) {
    return LaunchProfileInitialization(
      activeDirectory: json['activeDirectory'] != null
          ? LaunchProfileInitializationActiveDirectory.fromJson(
              json['activeDirectory'] as Map<String, dynamic>)
          : null,
      ec2SecurityGroupIds: (json['ec2SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      launchProfileId: json['launchProfileId'] as String?,
      launchProfileProtocolVersion:
          json['launchProfileProtocolVersion'] as String?,
      launchPurpose: json['launchPurpose'] as String?,
      name: json['name'] as String?,
      platform: (json['platform'] as String?)?.toLaunchProfilePlatform(),
      systemInitializationScripts:
          (json['systemInitializationScripts'] as List?)
              ?.whereNotNull()
              .map((e) => LaunchProfileInitializationScript.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      userInitializationScripts: (json['userInitializationScripts'] as List?)
          ?.whereNotNull()
          .map((e) => LaunchProfileInitializationScript.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectory = this.activeDirectory;
    final ec2SecurityGroupIds = this.ec2SecurityGroupIds;
    final launchProfileId = this.launchProfileId;
    final launchProfileProtocolVersion = this.launchProfileProtocolVersion;
    final launchPurpose = this.launchPurpose;
    final name = this.name;
    final platform = this.platform;
    final systemInitializationScripts = this.systemInitializationScripts;
    final userInitializationScripts = this.userInitializationScripts;
    return {
      if (activeDirectory != null) 'activeDirectory': activeDirectory,
      if (ec2SecurityGroupIds != null)
        'ec2SecurityGroupIds': ec2SecurityGroupIds,
      if (launchProfileId != null) 'launchProfileId': launchProfileId,
      if (launchProfileProtocolVersion != null)
        'launchProfileProtocolVersion': launchProfileProtocolVersion,
      if (launchPurpose != null) 'launchPurpose': launchPurpose,
      if (name != null) 'name': name,
      if (platform != null) 'platform': platform.toValue(),
      if (systemInitializationScripts != null)
        'systemInitializationScripts': systemInitializationScripts,
      if (userInitializationScripts != null)
        'userInitializationScripts': userInitializationScripts,
    };
  }
}

/// The launch profile initialization Active Directory contains information
/// required for the launch profile to connect to the Active Directory.
class LaunchProfileInitializationActiveDirectory {
  /// A collection of custom attributes for an Active Directory computer.
  final List<ActiveDirectoryComputerAttribute>? computerAttributes;

  /// The directory ID of the Directory Service for Microsoft Active Directory to
  /// access using this launch profile.
  final String? directoryId;

  /// The directory name.
  final String? directoryName;

  /// The DNS IP address.
  final List<String>? dnsIpAddresses;

  /// The name for the organizational unit distinguished name.
  final String? organizationalUnitDistinguishedName;

  /// The unique identifier for a studio component resource.
  final String? studioComponentId;

  /// The name for the studio component.
  final String? studioComponentName;

  LaunchProfileInitializationActiveDirectory({
    this.computerAttributes,
    this.directoryId,
    this.directoryName,
    this.dnsIpAddresses,
    this.organizationalUnitDistinguishedName,
    this.studioComponentId,
    this.studioComponentName,
  });

  factory LaunchProfileInitializationActiveDirectory.fromJson(
      Map<String, dynamic> json) {
    return LaunchProfileInitializationActiveDirectory(
      computerAttributes: (json['computerAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => ActiveDirectoryComputerAttribute.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      directoryId: json['directoryId'] as String?,
      directoryName: json['directoryName'] as String?,
      dnsIpAddresses: (json['dnsIpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      organizationalUnitDistinguishedName:
          json['organizationalUnitDistinguishedName'] as String?,
      studioComponentId: json['studioComponentId'] as String?,
      studioComponentName: json['studioComponentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final computerAttributes = this.computerAttributes;
    final directoryId = this.directoryId;
    final directoryName = this.directoryName;
    final dnsIpAddresses = this.dnsIpAddresses;
    final organizationalUnitDistinguishedName =
        this.organizationalUnitDistinguishedName;
    final studioComponentId = this.studioComponentId;
    final studioComponentName = this.studioComponentName;
    return {
      if (computerAttributes != null) 'computerAttributes': computerAttributes,
      if (directoryId != null) 'directoryId': directoryId,
      if (directoryName != null) 'directoryName': directoryName,
      if (dnsIpAddresses != null) 'dnsIpAddresses': dnsIpAddresses,
      if (organizationalUnitDistinguishedName != null)
        'organizationalUnitDistinguishedName':
            organizationalUnitDistinguishedName,
      if (studioComponentId != null) 'studioComponentId': studioComponentId,
      if (studioComponentName != null)
        'studioComponentName': studioComponentName,
    };
  }
}

/// The launch profile initialization script is used when start streaming
/// session runs.
class LaunchProfileInitializationScript {
  /// An IAM role attached to a Studio Component that gives the studio component
  /// access to Amazon Web Services resources at anytime while the instance is
  /// running.
  final String? runtimeRoleArn;

  /// The initialization script.
  final String? script;

  /// An IAM role attached to Studio Component when the system initialization
  /// script runs which give the studio component access to Amazon Web Services
  /// resources when the system initialization script runs.
  final String? secureInitializationRoleArn;

  /// The unique identifier for a studio component resource.
  final String? studioComponentId;

  /// The name for the studio component.
  final String? studioComponentName;

  LaunchProfileInitializationScript({
    this.runtimeRoleArn,
    this.script,
    this.secureInitializationRoleArn,
    this.studioComponentId,
    this.studioComponentName,
  });

  factory LaunchProfileInitializationScript.fromJson(
      Map<String, dynamic> json) {
    return LaunchProfileInitializationScript(
      runtimeRoleArn: json['runtimeRoleArn'] as String?,
      script: json['script'] as String?,
      secureInitializationRoleArn:
          json['secureInitializationRoleArn'] as String?,
      studioComponentId: json['studioComponentId'] as String?,
      studioComponentName: json['studioComponentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final runtimeRoleArn = this.runtimeRoleArn;
    final script = this.script;
    final secureInitializationRoleArn = this.secureInitializationRoleArn;
    final studioComponentId = this.studioComponentId;
    final studioComponentName = this.studioComponentName;
    return {
      if (runtimeRoleArn != null) 'runtimeRoleArn': runtimeRoleArn,
      if (script != null) 'script': script,
      if (secureInitializationRoleArn != null)
        'secureInitializationRoleArn': secureInitializationRoleArn,
      if (studioComponentId != null) 'studioComponentId': studioComponentId,
      if (studioComponentName != null)
        'studioComponentName': studioComponentName,
    };
  }
}

/// Studio admins can use launch profile membership to delegate launch profile
/// access to studio users in the Nimble Studio portal without writing or
/// maintaining complex IAM policies. A launch profile member is a user
/// association from your studio identity source who is granted permissions to a
/// launch profile.
///
/// A launch profile member (type USER) provides the following permissions to
/// that launch profile:
///
/// <ul>
/// <li>
/// GetLaunchProfile
/// </li>
/// <li>
/// GetLaunchProfileInitialization
/// </li>
/// <li>
/// GetLaunchProfileMembers
/// </li>
/// <li>
/// GetLaunchProfileMember
/// </li>
/// <li>
/// CreateStreamingSession
/// </li>
/// <li>
/// GetLaunchProfileDetails
/// </li>
/// </ul>
class LaunchProfileMembership {
  /// The ID of the identity store.
  final String? identityStoreId;

  /// The persona.
  final LaunchProfilePersona? persona;

  /// The principal ID.
  final String? principalId;

  /// The Active Directory Security Identifier for this user, if available.
  final String? sid;

  LaunchProfileMembership({
    this.identityStoreId,
    this.persona,
    this.principalId,
    this.sid,
  });

  factory LaunchProfileMembership.fromJson(Map<String, dynamic> json) {
    return LaunchProfileMembership(
      identityStoreId: json['identityStoreId'] as String?,
      persona: (json['persona'] as String?)?.toLaunchProfilePersona(),
      principalId: json['principalId'] as String?,
      sid: json['sid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final persona = this.persona;
    final principalId = this.principalId;
    final sid = this.sid;
    return {
      if (identityStoreId != null) 'identityStoreId': identityStoreId,
      if (persona != null) 'persona': persona.toValue(),
      if (principalId != null) 'principalId': principalId,
      if (sid != null) 'sid': sid,
    };
  }
}

enum LaunchProfilePersona {
  user,
}

extension LaunchProfilePersonaValueExtension on LaunchProfilePersona {
  String toValue() {
    switch (this) {
      case LaunchProfilePersona.user:
        return 'USER';
    }
  }
}

extension LaunchProfilePersonaFromString on String {
  LaunchProfilePersona toLaunchProfilePersona() {
    switch (this) {
      case 'USER':
        return LaunchProfilePersona.user;
    }
    throw Exception('$this is not known in enum LaunchProfilePersona');
  }
}

enum LaunchProfilePlatform {
  linux,
  windows,
}

extension LaunchProfilePlatformValueExtension on LaunchProfilePlatform {
  String toValue() {
    switch (this) {
      case LaunchProfilePlatform.linux:
        return 'LINUX';
      case LaunchProfilePlatform.windows:
        return 'WINDOWS';
    }
  }
}

extension LaunchProfilePlatformFromString on String {
  LaunchProfilePlatform toLaunchProfilePlatform() {
    switch (this) {
      case 'LINUX':
        return LaunchProfilePlatform.linux;
      case 'WINDOWS':
        return LaunchProfilePlatform.windows;
    }
    throw Exception('$this is not known in enum LaunchProfilePlatform');
  }
}

enum LaunchProfileState {
  createInProgress,
  ready,
  updateInProgress,
  deleteInProgress,
  deleted,
  deleteFailed,
  createFailed,
  updateFailed,
}

extension LaunchProfileStateValueExtension on LaunchProfileState {
  String toValue() {
    switch (this) {
      case LaunchProfileState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case LaunchProfileState.ready:
        return 'READY';
      case LaunchProfileState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case LaunchProfileState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case LaunchProfileState.deleted:
        return 'DELETED';
      case LaunchProfileState.deleteFailed:
        return 'DELETE_FAILED';
      case LaunchProfileState.createFailed:
        return 'CREATE_FAILED';
      case LaunchProfileState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension LaunchProfileStateFromString on String {
  LaunchProfileState toLaunchProfileState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return LaunchProfileState.createInProgress;
      case 'READY':
        return LaunchProfileState.ready;
      case 'UPDATE_IN_PROGRESS':
        return LaunchProfileState.updateInProgress;
      case 'DELETE_IN_PROGRESS':
        return LaunchProfileState.deleteInProgress;
      case 'DELETED':
        return LaunchProfileState.deleted;
      case 'DELETE_FAILED':
        return LaunchProfileState.deleteFailed;
      case 'CREATE_FAILED':
        return LaunchProfileState.createFailed;
      case 'UPDATE_FAILED':
        return LaunchProfileState.updateFailed;
    }
    throw Exception('$this is not known in enum LaunchProfileState');
  }
}

enum LaunchProfileStatusCode {
  launchProfileCreated,
  launchProfileUpdated,
  launchProfileDeleted,
  launchProfileCreateInProgress,
  launchProfileUpdateInProgress,
  launchProfileDeleteInProgress,
  internalError,
  streamingImageNotFound,
  streamingImageNotReady,
  launchProfileWithStreamSessionsNotDeleted,
  encryptionKeyAccessDenied,
  encryptionKeyNotFound,
  invalidSubnetsProvided,
  invalidInstanceTypesProvided,
  invalidSubnetsCombination,
}

extension LaunchProfileStatusCodeValueExtension on LaunchProfileStatusCode {
  String toValue() {
    switch (this) {
      case LaunchProfileStatusCode.launchProfileCreated:
        return 'LAUNCH_PROFILE_CREATED';
      case LaunchProfileStatusCode.launchProfileUpdated:
        return 'LAUNCH_PROFILE_UPDATED';
      case LaunchProfileStatusCode.launchProfileDeleted:
        return 'LAUNCH_PROFILE_DELETED';
      case LaunchProfileStatusCode.launchProfileCreateInProgress:
        return 'LAUNCH_PROFILE_CREATE_IN_PROGRESS';
      case LaunchProfileStatusCode.launchProfileUpdateInProgress:
        return 'LAUNCH_PROFILE_UPDATE_IN_PROGRESS';
      case LaunchProfileStatusCode.launchProfileDeleteInProgress:
        return 'LAUNCH_PROFILE_DELETE_IN_PROGRESS';
      case LaunchProfileStatusCode.internalError:
        return 'INTERNAL_ERROR';
      case LaunchProfileStatusCode.streamingImageNotFound:
        return 'STREAMING_IMAGE_NOT_FOUND';
      case LaunchProfileStatusCode.streamingImageNotReady:
        return 'STREAMING_IMAGE_NOT_READY';
      case LaunchProfileStatusCode.launchProfileWithStreamSessionsNotDeleted:
        return 'LAUNCH_PROFILE_WITH_STREAM_SESSIONS_NOT_DELETED';
      case LaunchProfileStatusCode.encryptionKeyAccessDenied:
        return 'ENCRYPTION_KEY_ACCESS_DENIED';
      case LaunchProfileStatusCode.encryptionKeyNotFound:
        return 'ENCRYPTION_KEY_NOT_FOUND';
      case LaunchProfileStatusCode.invalidSubnetsProvided:
        return 'INVALID_SUBNETS_PROVIDED';
      case LaunchProfileStatusCode.invalidInstanceTypesProvided:
        return 'INVALID_INSTANCE_TYPES_PROVIDED';
      case LaunchProfileStatusCode.invalidSubnetsCombination:
        return 'INVALID_SUBNETS_COMBINATION';
    }
  }
}

extension LaunchProfileStatusCodeFromString on String {
  LaunchProfileStatusCode toLaunchProfileStatusCode() {
    switch (this) {
      case 'LAUNCH_PROFILE_CREATED':
        return LaunchProfileStatusCode.launchProfileCreated;
      case 'LAUNCH_PROFILE_UPDATED':
        return LaunchProfileStatusCode.launchProfileUpdated;
      case 'LAUNCH_PROFILE_DELETED':
        return LaunchProfileStatusCode.launchProfileDeleted;
      case 'LAUNCH_PROFILE_CREATE_IN_PROGRESS':
        return LaunchProfileStatusCode.launchProfileCreateInProgress;
      case 'LAUNCH_PROFILE_UPDATE_IN_PROGRESS':
        return LaunchProfileStatusCode.launchProfileUpdateInProgress;
      case 'LAUNCH_PROFILE_DELETE_IN_PROGRESS':
        return LaunchProfileStatusCode.launchProfileDeleteInProgress;
      case 'INTERNAL_ERROR':
        return LaunchProfileStatusCode.internalError;
      case 'STREAMING_IMAGE_NOT_FOUND':
        return LaunchProfileStatusCode.streamingImageNotFound;
      case 'STREAMING_IMAGE_NOT_READY':
        return LaunchProfileStatusCode.streamingImageNotReady;
      case 'LAUNCH_PROFILE_WITH_STREAM_SESSIONS_NOT_DELETED':
        return LaunchProfileStatusCode
            .launchProfileWithStreamSessionsNotDeleted;
      case 'ENCRYPTION_KEY_ACCESS_DENIED':
        return LaunchProfileStatusCode.encryptionKeyAccessDenied;
      case 'ENCRYPTION_KEY_NOT_FOUND':
        return LaunchProfileStatusCode.encryptionKeyNotFound;
      case 'INVALID_SUBNETS_PROVIDED':
        return LaunchProfileStatusCode.invalidSubnetsProvided;
      case 'INVALID_INSTANCE_TYPES_PROVIDED':
        return LaunchProfileStatusCode.invalidInstanceTypesProvided;
      case 'INVALID_SUBNETS_COMBINATION':
        return LaunchProfileStatusCode.invalidSubnetsCombination;
    }
    throw Exception('$this is not known in enum LaunchProfileStatusCode');
  }
}

enum LaunchProfileValidationState {
  validationNotStarted,
  validationInProgress,
  validationSuccess,
  validationFailed,
  validationFailedInternalServerError,
}

extension LaunchProfileValidationStateValueExtension
    on LaunchProfileValidationState {
  String toValue() {
    switch (this) {
      case LaunchProfileValidationState.validationNotStarted:
        return 'VALIDATION_NOT_STARTED';
      case LaunchProfileValidationState.validationInProgress:
        return 'VALIDATION_IN_PROGRESS';
      case LaunchProfileValidationState.validationSuccess:
        return 'VALIDATION_SUCCESS';
      case LaunchProfileValidationState.validationFailed:
        return 'VALIDATION_FAILED';
      case LaunchProfileValidationState.validationFailedInternalServerError:
        return 'VALIDATION_FAILED_INTERNAL_SERVER_ERROR';
    }
  }
}

extension LaunchProfileValidationStateFromString on String {
  LaunchProfileValidationState toLaunchProfileValidationState() {
    switch (this) {
      case 'VALIDATION_NOT_STARTED':
        return LaunchProfileValidationState.validationNotStarted;
      case 'VALIDATION_IN_PROGRESS':
        return LaunchProfileValidationState.validationInProgress;
      case 'VALIDATION_SUCCESS':
        return LaunchProfileValidationState.validationSuccess;
      case 'VALIDATION_FAILED':
        return LaunchProfileValidationState.validationFailed;
      case 'VALIDATION_FAILED_INTERNAL_SERVER_ERROR':
        return LaunchProfileValidationState.validationFailedInternalServerError;
    }
    throw Exception('$this is not known in enum LaunchProfileValidationState');
  }
}

enum LaunchProfileValidationStatusCode {
  validationNotStarted,
  validationInProgress,
  validationSuccess,
  validationFailedInvalidSubnetRouteTableAssociation,
  validationFailedSubnetNotFound,
  validationFailedInvalidSecurityGroupAssociation,
  validationFailedInvalidActiveDirectory,
  validationFailedUnauthorized,
  validationFailedInternalServerError,
}

extension LaunchProfileValidationStatusCodeValueExtension
    on LaunchProfileValidationStatusCode {
  String toValue() {
    switch (this) {
      case LaunchProfileValidationStatusCode.validationNotStarted:
        return 'VALIDATION_NOT_STARTED';
      case LaunchProfileValidationStatusCode.validationInProgress:
        return 'VALIDATION_IN_PROGRESS';
      case LaunchProfileValidationStatusCode.validationSuccess:
        return 'VALIDATION_SUCCESS';
      case LaunchProfileValidationStatusCode
            .validationFailedInvalidSubnetRouteTableAssociation:
        return 'VALIDATION_FAILED_INVALID_SUBNET_ROUTE_TABLE_ASSOCIATION';
      case LaunchProfileValidationStatusCode.validationFailedSubnetNotFound:
        return 'VALIDATION_FAILED_SUBNET_NOT_FOUND';
      case LaunchProfileValidationStatusCode
            .validationFailedInvalidSecurityGroupAssociation:
        return 'VALIDATION_FAILED_INVALID_SECURITY_GROUP_ASSOCIATION';
      case LaunchProfileValidationStatusCode
            .validationFailedInvalidActiveDirectory:
        return 'VALIDATION_FAILED_INVALID_ACTIVE_DIRECTORY';
      case LaunchProfileValidationStatusCode.validationFailedUnauthorized:
        return 'VALIDATION_FAILED_UNAUTHORIZED';
      case LaunchProfileValidationStatusCode
            .validationFailedInternalServerError:
        return 'VALIDATION_FAILED_INTERNAL_SERVER_ERROR';
    }
  }
}

extension LaunchProfileValidationStatusCodeFromString on String {
  LaunchProfileValidationStatusCode toLaunchProfileValidationStatusCode() {
    switch (this) {
      case 'VALIDATION_NOT_STARTED':
        return LaunchProfileValidationStatusCode.validationNotStarted;
      case 'VALIDATION_IN_PROGRESS':
        return LaunchProfileValidationStatusCode.validationInProgress;
      case 'VALIDATION_SUCCESS':
        return LaunchProfileValidationStatusCode.validationSuccess;
      case 'VALIDATION_FAILED_INVALID_SUBNET_ROUTE_TABLE_ASSOCIATION':
        return LaunchProfileValidationStatusCode
            .validationFailedInvalidSubnetRouteTableAssociation;
      case 'VALIDATION_FAILED_SUBNET_NOT_FOUND':
        return LaunchProfileValidationStatusCode.validationFailedSubnetNotFound;
      case 'VALIDATION_FAILED_INVALID_SECURITY_GROUP_ASSOCIATION':
        return LaunchProfileValidationStatusCode
            .validationFailedInvalidSecurityGroupAssociation;
      case 'VALIDATION_FAILED_INVALID_ACTIVE_DIRECTORY':
        return LaunchProfileValidationStatusCode
            .validationFailedInvalidActiveDirectory;
      case 'VALIDATION_FAILED_UNAUTHORIZED':
        return LaunchProfileValidationStatusCode.validationFailedUnauthorized;
      case 'VALIDATION_FAILED_INTERNAL_SERVER_ERROR':
        return LaunchProfileValidationStatusCode
            .validationFailedInternalServerError;
    }
    throw Exception(
        '$this is not known in enum LaunchProfileValidationStatusCode');
  }
}

enum LaunchProfileValidationType {
  validateActiveDirectoryStudioComponent,
  validateSubnetAssociation,
  validateNetworkAclAssociation,
  validateSecurityGroupAssociation,
}

extension LaunchProfileValidationTypeValueExtension
    on LaunchProfileValidationType {
  String toValue() {
    switch (this) {
      case LaunchProfileValidationType.validateActiveDirectoryStudioComponent:
        return 'VALIDATE_ACTIVE_DIRECTORY_STUDIO_COMPONENT';
      case LaunchProfileValidationType.validateSubnetAssociation:
        return 'VALIDATE_SUBNET_ASSOCIATION';
      case LaunchProfileValidationType.validateNetworkAclAssociation:
        return 'VALIDATE_NETWORK_ACL_ASSOCIATION';
      case LaunchProfileValidationType.validateSecurityGroupAssociation:
        return 'VALIDATE_SECURITY_GROUP_ASSOCIATION';
    }
  }
}

extension LaunchProfileValidationTypeFromString on String {
  LaunchProfileValidationType toLaunchProfileValidationType() {
    switch (this) {
      case 'VALIDATE_ACTIVE_DIRECTORY_STUDIO_COMPONENT':
        return LaunchProfileValidationType
            .validateActiveDirectoryStudioComponent;
      case 'VALIDATE_SUBNET_ASSOCIATION':
        return LaunchProfileValidationType.validateSubnetAssociation;
      case 'VALIDATE_NETWORK_ACL_ASSOCIATION':
        return LaunchProfileValidationType.validateNetworkAclAssociation;
      case 'VALIDATE_SECURITY_GROUP_ASSOCIATION':
        return LaunchProfileValidationType.validateSecurityGroupAssociation;
    }
    throw Exception('$this is not known in enum LaunchProfileValidationType');
  }
}

/// The configuration for a license service that is associated with a studio
/// resource.
class LicenseServiceConfiguration {
  /// The endpoint of the license service that is accessed by the studio component
  /// resource.
  final String? endpoint;

  LicenseServiceConfiguration({
    this.endpoint,
  });

  factory LicenseServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return LicenseServiceConfiguration(
      endpoint: json['endpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class ListEulaAcceptancesResponse {
  /// A collection of EULA acceptances.
  final List<EulaAcceptance>? eulaAcceptances;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListEulaAcceptancesResponse({
    this.eulaAcceptances,
    this.nextToken,
  });

  factory ListEulaAcceptancesResponse.fromJson(Map<String, dynamic> json) {
    return ListEulaAcceptancesResponse(
      eulaAcceptances: (json['eulaAcceptances'] as List?)
          ?.whereNotNull()
          .map((e) => EulaAcceptance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eulaAcceptances = this.eulaAcceptances;
    final nextToken = this.nextToken;
    return {
      if (eulaAcceptances != null) 'eulaAcceptances': eulaAcceptances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEulasResponse {
  /// A collection of EULA resources.
  final List<Eula>? eulas;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListEulasResponse({
    this.eulas,
    this.nextToken,
  });

  factory ListEulasResponse.fromJson(Map<String, dynamic> json) {
    return ListEulasResponse(
      eulas: (json['eulas'] as List?)
          ?.whereNotNull()
          .map((e) => Eula.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eulas = this.eulas;
    final nextToken = this.nextToken;
    return {
      if (eulas != null) 'eulas': eulas,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLaunchProfileMembersResponse {
  /// A list of members.
  final List<LaunchProfileMembership>? members;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListLaunchProfileMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListLaunchProfileMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListLaunchProfileMembersResponse(
      members: (json['members'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LaunchProfileMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLaunchProfilesResponse {
  /// A collection of launch profiles.
  final List<LaunchProfile>? launchProfiles;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListLaunchProfilesResponse({
    this.launchProfiles,
    this.nextToken,
  });

  factory ListLaunchProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListLaunchProfilesResponse(
      launchProfiles: (json['launchProfiles'] as List?)
          ?.whereNotNull()
          .map((e) => LaunchProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfiles = this.launchProfiles;
    final nextToken = this.nextToken;
    return {
      if (launchProfiles != null) 'launchProfiles': launchProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStreamingImagesResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// A collection of streaming images.
  final List<StreamingImage>? streamingImages;

  ListStreamingImagesResponse({
    this.nextToken,
    this.streamingImages,
  });

  factory ListStreamingImagesResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamingImagesResponse(
      nextToken: json['nextToken'] as String?,
      streamingImages: (json['streamingImages'] as List?)
          ?.whereNotNull()
          .map((e) => StreamingImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final streamingImages = this.streamingImages;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (streamingImages != null) 'streamingImages': streamingImages,
    };
  }
}

class ListStreamingSessionBackupsResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// Information about the streaming session backups.
  final List<StreamingSessionBackup>? streamingSessionBackups;

  ListStreamingSessionBackupsResponse({
    this.nextToken,
    this.streamingSessionBackups,
  });

  factory ListStreamingSessionBackupsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListStreamingSessionBackupsResponse(
      nextToken: json['nextToken'] as String?,
      streamingSessionBackups: (json['streamingSessionBackups'] as List?)
          ?.whereNotNull()
          .map(
              (e) => StreamingSessionBackup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final streamingSessionBackups = this.streamingSessionBackups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (streamingSessionBackups != null)
        'streamingSessionBackups': streamingSessionBackups,
    };
  }
}

class ListStreamingSessionsResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// A collection of streaming sessions.
  final List<StreamingSession>? sessions;

  ListStreamingSessionsResponse({
    this.nextToken,
    this.sessions,
  });

  factory ListStreamingSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamingSessionsResponse(
      nextToken: json['nextToken'] as String?,
      sessions: (json['sessions'] as List?)
          ?.whereNotNull()
          .map((e) => StreamingSession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sessions = this.sessions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sessions != null) 'sessions': sessions,
    };
  }
}

class ListStudioComponentsResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// A collection of studio components.
  final List<StudioComponent>? studioComponents;

  ListStudioComponentsResponse({
    this.nextToken,
    this.studioComponents,
  });

  factory ListStudioComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListStudioComponentsResponse(
      nextToken: json['nextToken'] as String?,
      studioComponents: (json['studioComponents'] as List?)
          ?.whereNotNull()
          .map((e) => StudioComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final studioComponents = this.studioComponents;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (studioComponents != null) 'studioComponents': studioComponents,
    };
  }
}

class ListStudioMembersResponse {
  /// A list of admin members.
  final List<StudioMembership>? members;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListStudioMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListStudioMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListStudioMembersResponse(
      members: (json['members'] as List?)
          ?.whereNotNull()
          .map((e) => StudioMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStudiosResponse {
  /// A collection of studios.
  final List<Studio> studios;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListStudiosResponse({
    required this.studios,
    this.nextToken,
  });

  factory ListStudiosResponse.fromJson(Map<String, dynamic> json) {
    return ListStudiosResponse(
      studios: (json['studios'] as List)
          .whereNotNull()
          .map((e) => Studio.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final studios = this.studios;
    final nextToken = this.nextToken;
    return {
      'studios': studios,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
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

/// A new member that is added to a launch profile.
class NewLaunchProfileMember {
  /// The persona.
  final LaunchProfilePersona persona;

  /// The principal ID.
  final String principalId;

  NewLaunchProfileMember({
    required this.persona,
    required this.principalId,
  });

  Map<String, dynamic> toJson() {
    final persona = this.persona;
    final principalId = this.principalId;
    return {
      'persona': persona.toValue(),
      'principalId': principalId,
    };
  }
}

/// A new studio user's membership.
class NewStudioMember {
  /// The persona.
  final StudioPersona persona;

  /// The principal ID.
  final String principalId;

  NewStudioMember({
    required this.persona,
    required this.principalId,
  });

  Map<String, dynamic> toJson() {
    final persona = this.persona;
    final principalId = this.principalId;
    return {
      'persona': persona.toValue(),
      'principalId': principalId,
    };
  }
}

class PutLaunchProfileMembersResponse {
  PutLaunchProfileMembersResponse();

  factory PutLaunchProfileMembersResponse.fromJson(Map<String, dynamic> _) {
    return PutLaunchProfileMembersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutStudioMembersResponse {
  PutStudioMembersResponse();

  factory PutStudioMembersResponse.fromJson(Map<String, dynamic> _) {
    return PutStudioMembersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A parameter for a studio component script, in the form of a key-value pair.
class ScriptParameterKeyValue {
  /// A script parameter key.
  final String? key;

  /// A script parameter value.
  final String? value;

  ScriptParameterKeyValue({
    this.key,
    this.value,
  });

  factory ScriptParameterKeyValue.fromJson(Map<String, dynamic> json) {
    return ScriptParameterKeyValue(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

enum SessionBackupMode {
  automatic,
  deactivated,
}

extension SessionBackupModeValueExtension on SessionBackupMode {
  String toValue() {
    switch (this) {
      case SessionBackupMode.automatic:
        return 'AUTOMATIC';
      case SessionBackupMode.deactivated:
        return 'DEACTIVATED';
    }
  }
}

extension SessionBackupModeFromString on String {
  SessionBackupMode toSessionBackupMode() {
    switch (this) {
      case 'AUTOMATIC':
        return SessionBackupMode.automatic;
      case 'DEACTIVATED':
        return SessionBackupMode.deactivated;
    }
    throw Exception('$this is not known in enum SessionBackupMode');
  }
}

enum SessionPersistenceMode {
  deactivated,
  activated,
}

extension SessionPersistenceModeValueExtension on SessionPersistenceMode {
  String toValue() {
    switch (this) {
      case SessionPersistenceMode.deactivated:
        return 'DEACTIVATED';
      case SessionPersistenceMode.activated:
        return 'ACTIVATED';
    }
  }
}

extension SessionPersistenceModeFromString on String {
  SessionPersistenceMode toSessionPersistenceMode() {
    switch (this) {
      case 'DEACTIVATED':
        return SessionPersistenceMode.deactivated;
      case 'ACTIVATED':
        return SessionPersistenceMode.activated;
    }
    throw Exception('$this is not known in enum SessionPersistenceMode');
  }
}

/// The configuration for a shared file storage system that is associated with a
/// studio resource.
class SharedFileSystemConfiguration {
  /// The endpoint of the shared file system that is accessed by the studio
  /// component resource.
  final String? endpoint;

  /// The unique identifier for a file system.
  final String? fileSystemId;

  /// The mount location for a shared file system on a Linux virtual workstation.
  final String? linuxMountPoint;

  /// The name of the file share.
  final String? shareName;

  /// The mount location for a shared file system on a Windows virtual
  /// workstation.
  final String? windowsMountDrive;

  SharedFileSystemConfiguration({
    this.endpoint,
    this.fileSystemId,
    this.linuxMountPoint,
    this.shareName,
    this.windowsMountDrive,
  });

  factory SharedFileSystemConfiguration.fromJson(Map<String, dynamic> json) {
    return SharedFileSystemConfiguration(
      endpoint: json['endpoint'] as String?,
      fileSystemId: json['fileSystemId'] as String?,
      linuxMountPoint: json['linuxMountPoint'] as String?,
      shareName: json['shareName'] as String?,
      windowsMountDrive: json['windowsMountDrive'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final fileSystemId = this.fileSystemId;
    final linuxMountPoint = this.linuxMountPoint;
    final shareName = this.shareName;
    final windowsMountDrive = this.windowsMountDrive;
    return {
      if (endpoint != null) 'endpoint': endpoint,
      if (fileSystemId != null) 'fileSystemId': fileSystemId,
      if (linuxMountPoint != null) 'linuxMountPoint': linuxMountPoint,
      if (shareName != null) 'shareName': shareName,
      if (windowsMountDrive != null) 'windowsMountDrive': windowsMountDrive,
    };
  }
}

class StartStreamingSessionResponse {
  final StreamingSession? session;

  StartStreamingSessionResponse({
    this.session,
  });

  factory StartStreamingSessionResponse.fromJson(Map<String, dynamic> json) {
    return StartStreamingSessionResponse(
      session: json['session'] != null
          ? StreamingSession.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

class StartStudioSSOConfigurationRepairResponse {
  /// Information about a studio.
  final Studio studio;

  StartStudioSSOConfigurationRepairResponse({
    required this.studio,
  });

  factory StartStudioSSOConfigurationRepairResponse.fromJson(
      Map<String, dynamic> json) {
    return StartStudioSSOConfigurationRepairResponse(
      studio: Studio.fromJson(json['studio'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final studio = this.studio;
    return {
      'studio': studio,
    };
  }
}

class StopStreamingSessionResponse {
  final StreamingSession? session;

  StopStreamingSessionResponse({
    this.session,
  });

  factory StopStreamingSessionResponse.fromJson(Map<String, dynamic> json) {
    return StopStreamingSessionResponse(
      session: json['session'] != null
          ? StreamingSession.fromJson(json['session'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final session = this.session;
    return {
      if (session != null) 'session': session,
    };
  }
}

/// A configuration for a streaming session.
class StreamConfiguration {
  /// Allows or deactivates the use of the system clipboard to copy and paste
  /// between the streaming session and streaming client.
  final StreamingClipboardMode clipboardMode;

  /// The EC2 instance types that users can select from when launching a streaming
  /// session with this launch profile.
  final List<StreamingInstanceType> ec2InstanceTypes;

  /// The streaming images that users can select from when launching a streaming
  /// session with this launch profile.
  final List<String> streamingImageIds;

  /// Indicates if a streaming session created from this launch profile should be
  /// terminated automatically or retained without termination after being in a
  /// <code>STOPPED</code> state.
  ///
  /// <ul>
  /// <li>
  /// When <code>ACTIVATED</code>, the streaming session is scheduled for
  /// termination after being in the <code>STOPPED</code> state for the time
  /// specified in <code>maxStoppedSessionLengthInMinutes</code>.
  /// </li>
  /// <li>
  /// When <code>DEACTIVATED</code>, the streaming session can remain in the
  /// <code>STOPPED</code> state indefinitely.
  /// </li>
  /// </ul>
  /// This parameter is only allowed when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code>. When allowed, the default value for this parameter
  /// is <code>DEACTIVATED</code>.
  final AutomaticTerminationMode? automaticTerminationMode;

  /// The length of time, in minutes, that a streaming session can be active
  /// before it is stopped or terminated. After this point, Nimble Studio
  /// automatically terminates or stops the session. The default length of time is
  /// 690 minutes, and the maximum length of time is 30 days.
  final int? maxSessionLengthInMinutes;

  /// Integer that determines if you can start and stop your sessions and how long
  /// a session can stay in the <code>STOPPED</code> state. The default value is
  /// 0. The maximum value is 5760.
  ///
  /// This field is allowed only when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code> and <code>automaticTerminationMode</code> is
  /// <code>ACTIVATED</code>.
  ///
  /// If the value is set to 0, your sessions can’t be <code>STOPPED</code>. If
  /// you then call <code>StopStreamingSession</code>, the session fails. If the
  /// time that a session stays in the <code>READY</code> state exceeds the
  /// <code>maxSessionLengthInMinutes</code> value, the session will automatically
  /// be terminated (instead of <code>STOPPED</code>).
  ///
  /// If the value is set to a positive number, the session can be stopped. You
  /// can call <code>StopStreamingSession</code> to stop sessions in the
  /// <code>READY</code> state. If the time that a session stays in the
  /// <code>READY</code> state exceeds the <code>maxSessionLengthInMinutes</code>
  /// value, the session will automatically be stopped (instead of terminated).
  final int? maxStoppedSessionLengthInMinutes;

  /// Information about the streaming session backup.
  final StreamConfigurationSessionBackup? sessionBackup;

  /// Determine if a streaming session created from this launch profile can
  /// configure persistent storage. This means that
  /// <code>volumeConfiguration</code> and <code>automaticTerminationMode</code>
  /// are configured.
  final SessionPersistenceMode? sessionPersistenceMode;

  /// The upload storage for a streaming session.
  final StreamConfigurationSessionStorage? sessionStorage;

  /// Custom volume configuration for the root volumes that are attached to
  /// streaming sessions.
  ///
  /// This parameter is only allowed when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code>.
  final VolumeConfiguration? volumeConfiguration;

  StreamConfiguration({
    required this.clipboardMode,
    required this.ec2InstanceTypes,
    required this.streamingImageIds,
    this.automaticTerminationMode,
    this.maxSessionLengthInMinutes,
    this.maxStoppedSessionLengthInMinutes,
    this.sessionBackup,
    this.sessionPersistenceMode,
    this.sessionStorage,
    this.volumeConfiguration,
  });

  factory StreamConfiguration.fromJson(Map<String, dynamic> json) {
    return StreamConfiguration(
      clipboardMode:
          (json['clipboardMode'] as String).toStreamingClipboardMode(),
      ec2InstanceTypes: (json['ec2InstanceTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toStreamingInstanceType())
          .toList(),
      streamingImageIds: (json['streamingImageIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      automaticTerminationMode: (json['automaticTerminationMode'] as String?)
          ?.toAutomaticTerminationMode(),
      maxSessionLengthInMinutes: json['maxSessionLengthInMinutes'] as int?,
      maxStoppedSessionLengthInMinutes:
          json['maxStoppedSessionLengthInMinutes'] as int?,
      sessionBackup: json['sessionBackup'] != null
          ? StreamConfigurationSessionBackup.fromJson(
              json['sessionBackup'] as Map<String, dynamic>)
          : null,
      sessionPersistenceMode: (json['sessionPersistenceMode'] as String?)
          ?.toSessionPersistenceMode(),
      sessionStorage: json['sessionStorage'] != null
          ? StreamConfigurationSessionStorage.fromJson(
              json['sessionStorage'] as Map<String, dynamic>)
          : null,
      volumeConfiguration: json['volumeConfiguration'] != null
          ? VolumeConfiguration.fromJson(
              json['volumeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clipboardMode = this.clipboardMode;
    final ec2InstanceTypes = this.ec2InstanceTypes;
    final streamingImageIds = this.streamingImageIds;
    final automaticTerminationMode = this.automaticTerminationMode;
    final maxSessionLengthInMinutes = this.maxSessionLengthInMinutes;
    final maxStoppedSessionLengthInMinutes =
        this.maxStoppedSessionLengthInMinutes;
    final sessionBackup = this.sessionBackup;
    final sessionPersistenceMode = this.sessionPersistenceMode;
    final sessionStorage = this.sessionStorage;
    final volumeConfiguration = this.volumeConfiguration;
    return {
      'clipboardMode': clipboardMode.toValue(),
      'ec2InstanceTypes': ec2InstanceTypes.map((e) => e.toValue()).toList(),
      'streamingImageIds': streamingImageIds,
      if (automaticTerminationMode != null)
        'automaticTerminationMode': automaticTerminationMode.toValue(),
      if (maxSessionLengthInMinutes != null)
        'maxSessionLengthInMinutes': maxSessionLengthInMinutes,
      if (maxStoppedSessionLengthInMinutes != null)
        'maxStoppedSessionLengthInMinutes': maxStoppedSessionLengthInMinutes,
      if (sessionBackup != null) 'sessionBackup': sessionBackup,
      if (sessionPersistenceMode != null)
        'sessionPersistenceMode': sessionPersistenceMode.toValue(),
      if (sessionStorage != null) 'sessionStorage': sessionStorage,
      if (volumeConfiguration != null)
        'volumeConfiguration': volumeConfiguration,
    };
  }
}

/// Configuration for streaming workstations created using this launch profile.
class StreamConfigurationCreate {
  /// Allows or deactivates the use of the system clipboard to copy and paste
  /// between the streaming session and streaming client.
  final StreamingClipboardMode clipboardMode;

  /// The EC2 instance types that users can select from when launching a streaming
  /// session with this launch profile.
  final List<StreamingInstanceType> ec2InstanceTypes;

  /// The streaming images that users can select from when launching a streaming
  /// session with this launch profile.
  final List<String> streamingImageIds;

  /// Indicates if a streaming session created from this launch profile should be
  /// terminated automatically or retained without termination after being in a
  /// <code>STOPPED</code> state.
  ///
  /// <ul>
  /// <li>
  /// When <code>ACTIVATED</code>, the streaming session is scheduled for
  /// termination after being in the <code>STOPPED</code> state for the time
  /// specified in <code>maxStoppedSessionLengthInMinutes</code>.
  /// </li>
  /// <li>
  /// When <code>DEACTIVATED</code>, the streaming session can remain in the
  /// <code>STOPPED</code> state indefinitely.
  /// </li>
  /// </ul>
  /// This parameter is only allowed when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code>. When allowed, the default value for this parameter
  /// is <code>DEACTIVATED</code>.
  final AutomaticTerminationMode? automaticTerminationMode;

  /// The length of time, in minutes, that a streaming session can be active
  /// before it is stopped or terminated. After this point, Nimble Studio
  /// automatically terminates or stops the session. The default length of time is
  /// 690 minutes, and the maximum length of time is 30 days.
  final int? maxSessionLengthInMinutes;

  /// Integer that determines if you can start and stop your sessions and how long
  /// a session can stay in the <code>STOPPED</code> state. The default value is
  /// 0. The maximum value is 5760.
  ///
  /// This field is allowed only when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code> and <code>automaticTerminationMode</code> is
  /// <code>ACTIVATED</code>.
  ///
  /// If the value is set to 0, your sessions can’t be <code>STOPPED</code>. If
  /// you then call <code>StopStreamingSession</code>, the session fails. If the
  /// time that a session stays in the <code>READY</code> state exceeds the
  /// <code>maxSessionLengthInMinutes</code> value, the session will automatically
  /// be terminated (instead of <code>STOPPED</code>).
  ///
  /// If the value is set to a positive number, the session can be stopped. You
  /// can call <code>StopStreamingSession</code> to stop sessions in the
  /// <code>READY</code> state. If the time that a session stays in the
  /// <code>READY</code> state exceeds the <code>maxSessionLengthInMinutes</code>
  /// value, the session will automatically be stopped (instead of terminated).
  final int? maxStoppedSessionLengthInMinutes;

  /// Configures how streaming sessions are backed up when launched from this
  /// launch profile.
  final StreamConfigurationSessionBackup? sessionBackup;

  /// Determine if a streaming session created from this launch profile can
  /// configure persistent storage. This means that
  /// <code>volumeConfiguration</code> and <code>automaticTerminationMode</code>
  /// are configured.
  final SessionPersistenceMode? sessionPersistenceMode;

  /// The upload storage for a streaming workstation that is created using this
  /// launch profile.
  final StreamConfigurationSessionStorage? sessionStorage;

  /// Custom volume configuration for the root volumes that are attached to
  /// streaming sessions.
  ///
  /// This parameter is only allowed when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code>.
  final VolumeConfiguration? volumeConfiguration;

  StreamConfigurationCreate({
    required this.clipboardMode,
    required this.ec2InstanceTypes,
    required this.streamingImageIds,
    this.automaticTerminationMode,
    this.maxSessionLengthInMinutes,
    this.maxStoppedSessionLengthInMinutes,
    this.sessionBackup,
    this.sessionPersistenceMode,
    this.sessionStorage,
    this.volumeConfiguration,
  });

  Map<String, dynamic> toJson() {
    final clipboardMode = this.clipboardMode;
    final ec2InstanceTypes = this.ec2InstanceTypes;
    final streamingImageIds = this.streamingImageIds;
    final automaticTerminationMode = this.automaticTerminationMode;
    final maxSessionLengthInMinutes = this.maxSessionLengthInMinutes;
    final maxStoppedSessionLengthInMinutes =
        this.maxStoppedSessionLengthInMinutes;
    final sessionBackup = this.sessionBackup;
    final sessionPersistenceMode = this.sessionPersistenceMode;
    final sessionStorage = this.sessionStorage;
    final volumeConfiguration = this.volumeConfiguration;
    return {
      'clipboardMode': clipboardMode.toValue(),
      'ec2InstanceTypes': ec2InstanceTypes.map((e) => e.toValue()).toList(),
      'streamingImageIds': streamingImageIds,
      if (automaticTerminationMode != null)
        'automaticTerminationMode': automaticTerminationMode.toValue(),
      if (maxSessionLengthInMinutes != null)
        'maxSessionLengthInMinutes': maxSessionLengthInMinutes,
      if (maxStoppedSessionLengthInMinutes != null)
        'maxStoppedSessionLengthInMinutes': maxStoppedSessionLengthInMinutes,
      if (sessionBackup != null) 'sessionBackup': sessionBackup,
      if (sessionPersistenceMode != null)
        'sessionPersistenceMode': sessionPersistenceMode.toValue(),
      if (sessionStorage != null) 'sessionStorage': sessionStorage,
      if (volumeConfiguration != null)
        'volumeConfiguration': volumeConfiguration,
    };
  }
}

/// Configures how streaming sessions are backed up when launched from this
/// launch profile.
class StreamConfigurationSessionBackup {
  /// The maximum number of backups that each streaming session created from this
  /// launch profile can have.
  final int? maxBackupsToRetain;

  /// Specifies how artists sessions are backed up.
  ///
  /// Configures backups for streaming sessions launched with this launch profile.
  /// The default value is <code>DEACTIVATED</code>, which means that backups are
  /// deactivated. To allow backups, set this value to <code>AUTOMATIC</code>.
  final SessionBackupMode? mode;

  StreamConfigurationSessionBackup({
    this.maxBackupsToRetain,
    this.mode,
  });

  factory StreamConfigurationSessionBackup.fromJson(Map<String, dynamic> json) {
    return StreamConfigurationSessionBackup(
      maxBackupsToRetain: json['maxBackupsToRetain'] as int?,
      mode: (json['mode'] as String?)?.toSessionBackupMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxBackupsToRetain = this.maxBackupsToRetain;
    final mode = this.mode;
    return {
      if (maxBackupsToRetain != null) 'maxBackupsToRetain': maxBackupsToRetain,
      if (mode != null) 'mode': mode.toValue(),
    };
  }
}

/// The configuration for a streaming session’s upload storage.
class StreamConfigurationSessionStorage {
  /// Allows artists to upload files to their workstations. The only valid option
  /// is <code>UPLOAD</code>.
  final List<StreamingSessionStorageMode> mode;

  /// The configuration for the upload storage root of the streaming session.
  final StreamingSessionStorageRoot? root;

  StreamConfigurationSessionStorage({
    required this.mode,
    this.root,
  });

  factory StreamConfigurationSessionStorage.fromJson(
      Map<String, dynamic> json) {
    return StreamConfigurationSessionStorage(
      mode: (json['mode'] as List)
          .whereNotNull()
          .map((e) => (e as String).toStreamingSessionStorageMode())
          .toList(),
      root: json['root'] != null
          ? StreamingSessionStorageRoot.fromJson(
              json['root'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final root = this.root;
    return {
      'mode': mode.map((e) => e.toValue()).toList(),
      if (root != null) 'root': root,
    };
  }
}

enum StreamingClipboardMode {
  enabled,
  disabled,
}

extension StreamingClipboardModeValueExtension on StreamingClipboardMode {
  String toValue() {
    switch (this) {
      case StreamingClipboardMode.enabled:
        return 'ENABLED';
      case StreamingClipboardMode.disabled:
        return 'DISABLED';
    }
  }
}

extension StreamingClipboardModeFromString on String {
  StreamingClipboardMode toStreamingClipboardMode() {
    switch (this) {
      case 'ENABLED':
        return StreamingClipboardMode.enabled;
      case 'DISABLED':
        return StreamingClipboardMode.disabled;
    }
    throw Exception('$this is not known in enum StreamingClipboardMode');
  }
}

/// Represents a streaming image resource.
///
/// Streaming images are used by studio users to select which operating system
/// and software they want to use in a Nimble Studio streaming session.
///
/// Amazon provides a number of streaming images that include popular 3rd-party
/// software.
///
/// You can create your own streaming images using an Amazon EC2 machine image
/// that you create for this purpose. You can also include software that your
/// users require.
class StreamingImage {
  /// The Amazon Resource Name (ARN) that is assigned to a studio resource and
  /// uniquely identifies it. ARNs are unique across all Regions.
  final String? arn;

  /// A human-readable description of the streaming image.
  final String? description;

  /// The ID of an EC2 machine image with which to create the streaming image.
  final String? ec2ImageId;

  /// The encryption configuration.
  final StreamingImageEncryptionConfiguration? encryptionConfiguration;

  /// The list of EULAs that must be accepted before a Streaming Session can be
  /// started using this streaming image.
  final List<String>? eulaIds;

  /// A friendly name for a streaming image resource.
  final String? name;

  /// The owner of the streaming image, either the <code>studioId</code> that
  /// contains the streaming image, or <code>amazon</code> for images that are
  /// provided by Amazon Nimble Studio.
  final String? owner;

  /// The platform of the streaming image, either Windows or Linux.
  final String? platform;

  /// The current state.
  final StreamingImageState? state;

  /// The status code.
  final StreamingImageStatusCode? statusCode;

  /// The status message for the streaming image.
  final String? statusMessage;

  /// The ID of the streaming image.
  final String? streamingImageId;

  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  final Map<String, String>? tags;

  StreamingImage({
    this.arn,
    this.description,
    this.ec2ImageId,
    this.encryptionConfiguration,
    this.eulaIds,
    this.name,
    this.owner,
    this.platform,
    this.state,
    this.statusCode,
    this.statusMessage,
    this.streamingImageId,
    this.tags,
  });

  factory StreamingImage.fromJson(Map<String, dynamic> json) {
    return StreamingImage(
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      ec2ImageId: json['ec2ImageId'] as String?,
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? StreamingImageEncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      eulaIds: (json['eulaIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      platform: json['platform'] as String?,
      state: (json['state'] as String?)?.toStreamingImageState(),
      statusCode: (json['statusCode'] as String?)?.toStreamingImageStatusCode(),
      statusMessage: json['statusMessage'] as String?,
      streamingImageId: json['streamingImageId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final ec2ImageId = this.ec2ImageId;
    final encryptionConfiguration = this.encryptionConfiguration;
    final eulaIds = this.eulaIds;
    final name = this.name;
    final owner = this.owner;
    final platform = this.platform;
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final streamingImageId = this.streamingImageId;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (ec2ImageId != null) 'ec2ImageId': ec2ImageId,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (eulaIds != null) 'eulaIds': eulaIds,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (platform != null) 'platform': platform,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (streamingImageId != null) 'streamingImageId': streamingImageId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies how a streaming image is encrypted.
class StreamingImageEncryptionConfiguration {
  /// The type of KMS key that is used to encrypt studio data.
  final StreamingImageEncryptionConfigurationKeyType keyType;

  /// The ARN for a KMS key that is used to encrypt studio data.
  final String? keyArn;

  StreamingImageEncryptionConfiguration({
    required this.keyType,
    this.keyArn,
  });

  factory StreamingImageEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StreamingImageEncryptionConfiguration(
      keyType: (json['keyType'] as String)
          .toStreamingImageEncryptionConfigurationKeyType(),
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyType = this.keyType;
    final keyArn = this.keyArn;
    return {
      'keyType': keyType.toValue(),
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

enum StreamingImageEncryptionConfigurationKeyType {
  customerManagedKey,
}

extension StreamingImageEncryptionConfigurationKeyTypeValueExtension
    on StreamingImageEncryptionConfigurationKeyType {
  String toValue() {
    switch (this) {
      case StreamingImageEncryptionConfigurationKeyType.customerManagedKey:
        return 'CUSTOMER_MANAGED_KEY';
    }
  }
}

extension StreamingImageEncryptionConfigurationKeyTypeFromString on String {
  StreamingImageEncryptionConfigurationKeyType
      toStreamingImageEncryptionConfigurationKeyType() {
    switch (this) {
      case 'CUSTOMER_MANAGED_KEY':
        return StreamingImageEncryptionConfigurationKeyType.customerManagedKey;
    }
    throw Exception(
        '$this is not known in enum StreamingImageEncryptionConfigurationKeyType');
  }
}

enum StreamingImageState {
  createInProgress,
  ready,
  deleteInProgress,
  deleted,
  updateInProgress,
  updateFailed,
  createFailed,
  deleteFailed,
}

extension StreamingImageStateValueExtension on StreamingImageState {
  String toValue() {
    switch (this) {
      case StreamingImageState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case StreamingImageState.ready:
        return 'READY';
      case StreamingImageState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case StreamingImageState.deleted:
        return 'DELETED';
      case StreamingImageState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case StreamingImageState.updateFailed:
        return 'UPDATE_FAILED';
      case StreamingImageState.createFailed:
        return 'CREATE_FAILED';
      case StreamingImageState.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension StreamingImageStateFromString on String {
  StreamingImageState toStreamingImageState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return StreamingImageState.createInProgress;
      case 'READY':
        return StreamingImageState.ready;
      case 'DELETE_IN_PROGRESS':
        return StreamingImageState.deleteInProgress;
      case 'DELETED':
        return StreamingImageState.deleted;
      case 'UPDATE_IN_PROGRESS':
        return StreamingImageState.updateInProgress;
      case 'UPDATE_FAILED':
        return StreamingImageState.updateFailed;
      case 'CREATE_FAILED':
        return StreamingImageState.createFailed;
      case 'DELETE_FAILED':
        return StreamingImageState.deleteFailed;
    }
    throw Exception('$this is not known in enum StreamingImageState');
  }
}

/// The status code.
enum StreamingImageStatusCode {
  streamingImageCreateInProgress,
  streamingImageReady,
  streamingImageDeleteInProgress,
  streamingImageDeleted,
  streamingImageUpdateInProgress,
  internalError,
  accessDenied,
}

extension StreamingImageStatusCodeValueExtension on StreamingImageStatusCode {
  String toValue() {
    switch (this) {
      case StreamingImageStatusCode.streamingImageCreateInProgress:
        return 'STREAMING_IMAGE_CREATE_IN_PROGRESS';
      case StreamingImageStatusCode.streamingImageReady:
        return 'STREAMING_IMAGE_READY';
      case StreamingImageStatusCode.streamingImageDeleteInProgress:
        return 'STREAMING_IMAGE_DELETE_IN_PROGRESS';
      case StreamingImageStatusCode.streamingImageDeleted:
        return 'STREAMING_IMAGE_DELETED';
      case StreamingImageStatusCode.streamingImageUpdateInProgress:
        return 'STREAMING_IMAGE_UPDATE_IN_PROGRESS';
      case StreamingImageStatusCode.internalError:
        return 'INTERNAL_ERROR';
      case StreamingImageStatusCode.accessDenied:
        return 'ACCESS_DENIED';
    }
  }
}

extension StreamingImageStatusCodeFromString on String {
  StreamingImageStatusCode toStreamingImageStatusCode() {
    switch (this) {
      case 'STREAMING_IMAGE_CREATE_IN_PROGRESS':
        return StreamingImageStatusCode.streamingImageCreateInProgress;
      case 'STREAMING_IMAGE_READY':
        return StreamingImageStatusCode.streamingImageReady;
      case 'STREAMING_IMAGE_DELETE_IN_PROGRESS':
        return StreamingImageStatusCode.streamingImageDeleteInProgress;
      case 'STREAMING_IMAGE_DELETED':
        return StreamingImageStatusCode.streamingImageDeleted;
      case 'STREAMING_IMAGE_UPDATE_IN_PROGRESS':
        return StreamingImageStatusCode.streamingImageUpdateInProgress;
      case 'INTERNAL_ERROR':
        return StreamingImageStatusCode.internalError;
      case 'ACCESS_DENIED':
        return StreamingImageStatusCode.accessDenied;
    }
    throw Exception('$this is not known in enum StreamingImageStatusCode');
  }
}

enum StreamingInstanceType {
  g4dnXlarge,
  g4dn_2xlarge,
  g4dn_4xlarge,
  g4dn_8xlarge,
  g4dn_12xlarge,
  g4dn_16xlarge,
  g3_4xlarge,
  g3sXlarge,
  g5Xlarge,
  g5_2xlarge,
  g5_4xlarge,
  g5_8xlarge,
  g5_16xlarge,
}

extension StreamingInstanceTypeValueExtension on StreamingInstanceType {
  String toValue() {
    switch (this) {
      case StreamingInstanceType.g4dnXlarge:
        return 'g4dn.xlarge';
      case StreamingInstanceType.g4dn_2xlarge:
        return 'g4dn.2xlarge';
      case StreamingInstanceType.g4dn_4xlarge:
        return 'g4dn.4xlarge';
      case StreamingInstanceType.g4dn_8xlarge:
        return 'g4dn.8xlarge';
      case StreamingInstanceType.g4dn_12xlarge:
        return 'g4dn.12xlarge';
      case StreamingInstanceType.g4dn_16xlarge:
        return 'g4dn.16xlarge';
      case StreamingInstanceType.g3_4xlarge:
        return 'g3.4xlarge';
      case StreamingInstanceType.g3sXlarge:
        return 'g3s.xlarge';
      case StreamingInstanceType.g5Xlarge:
        return 'g5.xlarge';
      case StreamingInstanceType.g5_2xlarge:
        return 'g5.2xlarge';
      case StreamingInstanceType.g5_4xlarge:
        return 'g5.4xlarge';
      case StreamingInstanceType.g5_8xlarge:
        return 'g5.8xlarge';
      case StreamingInstanceType.g5_16xlarge:
        return 'g5.16xlarge';
    }
  }
}

extension StreamingInstanceTypeFromString on String {
  StreamingInstanceType toStreamingInstanceType() {
    switch (this) {
      case 'g4dn.xlarge':
        return StreamingInstanceType.g4dnXlarge;
      case 'g4dn.2xlarge':
        return StreamingInstanceType.g4dn_2xlarge;
      case 'g4dn.4xlarge':
        return StreamingInstanceType.g4dn_4xlarge;
      case 'g4dn.8xlarge':
        return StreamingInstanceType.g4dn_8xlarge;
      case 'g4dn.12xlarge':
        return StreamingInstanceType.g4dn_12xlarge;
      case 'g4dn.16xlarge':
        return StreamingInstanceType.g4dn_16xlarge;
      case 'g3.4xlarge':
        return StreamingInstanceType.g3_4xlarge;
      case 'g3s.xlarge':
        return StreamingInstanceType.g3sXlarge;
      case 'g5.xlarge':
        return StreamingInstanceType.g5Xlarge;
      case 'g5.2xlarge':
        return StreamingInstanceType.g5_2xlarge;
      case 'g5.4xlarge':
        return StreamingInstanceType.g5_4xlarge;
      case 'g5.8xlarge':
        return StreamingInstanceType.g5_8xlarge;
      case 'g5.16xlarge':
        return StreamingInstanceType.g5_16xlarge;
    }
    throw Exception('$this is not known in enum StreamingInstanceType');
  }
}

/// A streaming session is a virtual workstation created using a particular
/// launch profile.
class StreamingSession {
  /// The Amazon Resource Name (ARN) that is assigned to a studio resource and
  /// uniquely identifies it. ARNs are unique across all Regions.
  final String? arn;

  /// Indicates if a streaming session created from this launch profile should be
  /// terminated automatically or retained without termination after being in a
  /// <code>STOPPED</code> state.
  ///
  /// <ul>
  /// <li>
  /// When <code>ACTIVATED</code>, the streaming session is scheduled for
  /// termination after being in the <code>STOPPED</code> state for the time
  /// specified in <code>maxStoppedSessionLengthInMinutes</code>.
  /// </li>
  /// <li>
  /// When <code>DEACTIVATED</code>, the streaming session can remain in the
  /// <code>STOPPED</code> state indefinitely.
  /// </li>
  /// </ul>
  /// This parameter is only allowed when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code>. When allowed, the default value for this parameter
  /// is <code>DEACTIVATED</code>.
  final AutomaticTerminationMode? automaticTerminationMode;

  /// Shows the current backup setting of the session.
  final SessionBackupMode? backupMode;

  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The user ID of the user that created the streaming session.
  final String? createdBy;

  /// The EC2 Instance type used for the streaming session.
  final String? ec2InstanceType;

  /// The ID of the launch profile used to control access from the streaming
  /// session.
  final String? launchProfileId;

  /// The maximum number of backups of a streaming session that you can have. When
  /// the maximum number of backups is reached, the oldest backup is deleted.
  final int? maxBackupsToRetain;

  /// The user ID of the user that owns the streaming session. The user that owns
  /// the session will be logging into the session and interacting with the
  /// virtual workstation.
  final String? ownedBy;

  /// The session ID.
  final String? sessionId;

  /// Determine if a streaming session created from this launch profile can
  /// configure persistent storage. This means that
  /// <code>volumeConfiguration</code> and <code>automaticTerminationMode</code>
  /// are configured.
  final SessionPersistenceMode? sessionPersistenceMode;

  /// The time the session entered <code>START_IN_PROGRESS</code> state.
  final DateTime? startedAt;

  /// The user ID of the user that started the streaming session.
  final String? startedBy;

  /// The backup ID used to restore a streaming session.
  final String? startedFromBackupId;

  /// The current state.
  final StreamingSessionState? state;

  /// The status code.
  final StreamingSessionStatusCode? statusCode;

  /// The status message for the streaming session.
  final String? statusMessage;

  /// The time the streaming session will automatically be stopped if the user
  /// doesn’t stop the session themselves.
  final DateTime? stopAt;

  /// The time the session entered <code>STOP_IN_PROGRESS</code> state.
  final DateTime? stoppedAt;

  /// The user ID of the user that stopped the streaming session.
  final String? stoppedBy;

  /// The ID of the streaming image.
  final String? streamingImageId;

  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  final Map<String, String>? tags;

  /// The time the streaming session will automatically terminate if not
  /// terminated by the user.
  final DateTime? terminateAt;

  /// The ISO timestamp in seconds for when the resource was updated.
  final DateTime? updatedAt;

  /// The user ID of the user that most recently updated the resource.
  final String? updatedBy;

  /// Custom volume configuration for the root volumes that are attached to
  /// streaming sessions.
  ///
  /// This parameter is only allowed when <code>sessionPersistenceMode</code> is
  /// <code>ACTIVATED</code>.
  final VolumeConfiguration? volumeConfiguration;

  /// Determine if an EBS volume created from this streaming session will be
  /// backed up.
  final VolumeRetentionMode? volumeRetentionMode;

  StreamingSession({
    this.arn,
    this.automaticTerminationMode,
    this.backupMode,
    this.createdAt,
    this.createdBy,
    this.ec2InstanceType,
    this.launchProfileId,
    this.maxBackupsToRetain,
    this.ownedBy,
    this.sessionId,
    this.sessionPersistenceMode,
    this.startedAt,
    this.startedBy,
    this.startedFromBackupId,
    this.state,
    this.statusCode,
    this.statusMessage,
    this.stopAt,
    this.stoppedAt,
    this.stoppedBy,
    this.streamingImageId,
    this.tags,
    this.terminateAt,
    this.updatedAt,
    this.updatedBy,
    this.volumeConfiguration,
    this.volumeRetentionMode,
  });

  factory StreamingSession.fromJson(Map<String, dynamic> json) {
    return StreamingSession(
      arn: json['arn'] as String?,
      automaticTerminationMode: (json['automaticTerminationMode'] as String?)
          ?.toAutomaticTerminationMode(),
      backupMode: (json['backupMode'] as String?)?.toSessionBackupMode(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      ec2InstanceType: json['ec2InstanceType'] as String?,
      launchProfileId: json['launchProfileId'] as String?,
      maxBackupsToRetain: json['maxBackupsToRetain'] as int?,
      ownedBy: json['ownedBy'] as String?,
      sessionId: json['sessionId'] as String?,
      sessionPersistenceMode: (json['sessionPersistenceMode'] as String?)
          ?.toSessionPersistenceMode(),
      startedAt: timeStampFromJson(json['startedAt']),
      startedBy: json['startedBy'] as String?,
      startedFromBackupId: json['startedFromBackupId'] as String?,
      state: (json['state'] as String?)?.toStreamingSessionState(),
      statusCode:
          (json['statusCode'] as String?)?.toStreamingSessionStatusCode(),
      statusMessage: json['statusMessage'] as String?,
      stopAt: timeStampFromJson(json['stopAt']),
      stoppedAt: timeStampFromJson(json['stoppedAt']),
      stoppedBy: json['stoppedBy'] as String?,
      streamingImageId: json['streamingImageId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      terminateAt: timeStampFromJson(json['terminateAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      volumeConfiguration: json['volumeConfiguration'] != null
          ? VolumeConfiguration.fromJson(
              json['volumeConfiguration'] as Map<String, dynamic>)
          : null,
      volumeRetentionMode:
          (json['volumeRetentionMode'] as String?)?.toVolumeRetentionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final automaticTerminationMode = this.automaticTerminationMode;
    final backupMode = this.backupMode;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final ec2InstanceType = this.ec2InstanceType;
    final launchProfileId = this.launchProfileId;
    final maxBackupsToRetain = this.maxBackupsToRetain;
    final ownedBy = this.ownedBy;
    final sessionId = this.sessionId;
    final sessionPersistenceMode = this.sessionPersistenceMode;
    final startedAt = this.startedAt;
    final startedBy = this.startedBy;
    final startedFromBackupId = this.startedFromBackupId;
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final stopAt = this.stopAt;
    final stoppedAt = this.stoppedAt;
    final stoppedBy = this.stoppedBy;
    final streamingImageId = this.streamingImageId;
    final tags = this.tags;
    final terminateAt = this.terminateAt;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final volumeConfiguration = this.volumeConfiguration;
    final volumeRetentionMode = this.volumeRetentionMode;
    return {
      if (arn != null) 'arn': arn,
      if (automaticTerminationMode != null)
        'automaticTerminationMode': automaticTerminationMode.toValue(),
      if (backupMode != null) 'backupMode': backupMode.toValue(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (ec2InstanceType != null) 'ec2InstanceType': ec2InstanceType,
      if (launchProfileId != null) 'launchProfileId': launchProfileId,
      if (maxBackupsToRetain != null) 'maxBackupsToRetain': maxBackupsToRetain,
      if (ownedBy != null) 'ownedBy': ownedBy,
      if (sessionId != null) 'sessionId': sessionId,
      if (sessionPersistenceMode != null)
        'sessionPersistenceMode': sessionPersistenceMode.toValue(),
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (startedBy != null) 'startedBy': startedBy,
      if (startedFromBackupId != null)
        'startedFromBackupId': startedFromBackupId,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (stopAt != null) 'stopAt': iso8601ToJson(stopAt),
      if (stoppedAt != null) 'stoppedAt': iso8601ToJson(stoppedAt),
      if (stoppedBy != null) 'stoppedBy': stoppedBy,
      if (streamingImageId != null) 'streamingImageId': streamingImageId,
      if (tags != null) 'tags': tags,
      if (terminateAt != null) 'terminateAt': iso8601ToJson(terminateAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (volumeConfiguration != null)
        'volumeConfiguration': volumeConfiguration,
      if (volumeRetentionMode != null)
        'volumeRetentionMode': volumeRetentionMode.toValue(),
    };
  }
}

/// Information about the streaming session backup.
class StreamingSessionBackup {
  /// The Amazon Resource Name (ARN) that is assigned to a studio resource and
  /// uniquely identifies it. ARNs are unique across all Regions.
  final String? arn;

  /// The ID of the backup.
  final String? backupId;

  /// The ISO timestamp in for when the resource was created.
  final DateTime? createdAt;

  /// The ID of the launch profile which allowed the backups for the streaming
  /// session.
  final String? launchProfileId;

  /// The user ID of the user that owns the streaming session.
  final String? ownedBy;

  /// The streaming session ID for the <code>StreamingSessionBackup</code>.
  final String? sessionId;
  final StreamingSessionState? state;

  /// The status code.
  final StreamingSessionStatusCode? statusCode;

  /// The status message for the streaming session backup.
  final String? statusMessage;

  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  final Map<String, String>? tags;

  StreamingSessionBackup({
    this.arn,
    this.backupId,
    this.createdAt,
    this.launchProfileId,
    this.ownedBy,
    this.sessionId,
    this.state,
    this.statusCode,
    this.statusMessage,
    this.tags,
  });

  factory StreamingSessionBackup.fromJson(Map<String, dynamic> json) {
    return StreamingSessionBackup(
      arn: json['arn'] as String?,
      backupId: json['backupId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      launchProfileId: json['launchProfileId'] as String?,
      ownedBy: json['ownedBy'] as String?,
      sessionId: json['sessionId'] as String?,
      state: (json['state'] as String?)?.toStreamingSessionState(),
      statusCode:
          (json['statusCode'] as String?)?.toStreamingSessionStatusCode(),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final backupId = this.backupId;
    final createdAt = this.createdAt;
    final launchProfileId = this.launchProfileId;
    final ownedBy = this.ownedBy;
    final sessionId = this.sessionId;
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (backupId != null) 'backupId': backupId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (launchProfileId != null) 'launchProfileId': launchProfileId,
      if (ownedBy != null) 'ownedBy': ownedBy,
      if (sessionId != null) 'sessionId': sessionId,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The streaming session state.
enum StreamingSessionState {
  createInProgress,
  deleteInProgress,
  ready,
  deleted,
  createFailed,
  deleteFailed,
  stopInProgress,
  startInProgress,
  stopped,
  stopFailed,
  startFailed,
}

extension StreamingSessionStateValueExtension on StreamingSessionState {
  String toValue() {
    switch (this) {
      case StreamingSessionState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case StreamingSessionState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case StreamingSessionState.ready:
        return 'READY';
      case StreamingSessionState.deleted:
        return 'DELETED';
      case StreamingSessionState.createFailed:
        return 'CREATE_FAILED';
      case StreamingSessionState.deleteFailed:
        return 'DELETE_FAILED';
      case StreamingSessionState.stopInProgress:
        return 'STOP_IN_PROGRESS';
      case StreamingSessionState.startInProgress:
        return 'START_IN_PROGRESS';
      case StreamingSessionState.stopped:
        return 'STOPPED';
      case StreamingSessionState.stopFailed:
        return 'STOP_FAILED';
      case StreamingSessionState.startFailed:
        return 'START_FAILED';
    }
  }
}

extension StreamingSessionStateFromString on String {
  StreamingSessionState toStreamingSessionState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return StreamingSessionState.createInProgress;
      case 'DELETE_IN_PROGRESS':
        return StreamingSessionState.deleteInProgress;
      case 'READY':
        return StreamingSessionState.ready;
      case 'DELETED':
        return StreamingSessionState.deleted;
      case 'CREATE_FAILED':
        return StreamingSessionState.createFailed;
      case 'DELETE_FAILED':
        return StreamingSessionState.deleteFailed;
      case 'STOP_IN_PROGRESS':
        return StreamingSessionState.stopInProgress;
      case 'START_IN_PROGRESS':
        return StreamingSessionState.startInProgress;
      case 'STOPPED':
        return StreamingSessionState.stopped;
      case 'STOP_FAILED':
        return StreamingSessionState.stopFailed;
      case 'START_FAILED':
        return StreamingSessionState.startFailed;
    }
    throw Exception('$this is not known in enum StreamingSessionState');
  }
}

enum StreamingSessionStatusCode {
  streamingSessionReady,
  streamingSessionDeleted,
  streamingSessionCreateInProgress,
  streamingSessionDeleteInProgress,
  internalError,
  insufficientCapacity,
  activeDirectoryDomainJoinError,
  networkConnectionError,
  initializationScriptError,
  decryptStreamingImageError,
  networkInterfaceError,
  streamingSessionStopped,
  streamingSessionStarted,
  streamingSessionStopInProgress,
  streamingSessionStartInProgress,
  amiValidationError,
}

extension StreamingSessionStatusCodeValueExtension
    on StreamingSessionStatusCode {
  String toValue() {
    switch (this) {
      case StreamingSessionStatusCode.streamingSessionReady:
        return 'STREAMING_SESSION_READY';
      case StreamingSessionStatusCode.streamingSessionDeleted:
        return 'STREAMING_SESSION_DELETED';
      case StreamingSessionStatusCode.streamingSessionCreateInProgress:
        return 'STREAMING_SESSION_CREATE_IN_PROGRESS';
      case StreamingSessionStatusCode.streamingSessionDeleteInProgress:
        return 'STREAMING_SESSION_DELETE_IN_PROGRESS';
      case StreamingSessionStatusCode.internalError:
        return 'INTERNAL_ERROR';
      case StreamingSessionStatusCode.insufficientCapacity:
        return 'INSUFFICIENT_CAPACITY';
      case StreamingSessionStatusCode.activeDirectoryDomainJoinError:
        return 'ACTIVE_DIRECTORY_DOMAIN_JOIN_ERROR';
      case StreamingSessionStatusCode.networkConnectionError:
        return 'NETWORK_CONNECTION_ERROR';
      case StreamingSessionStatusCode.initializationScriptError:
        return 'INITIALIZATION_SCRIPT_ERROR';
      case StreamingSessionStatusCode.decryptStreamingImageError:
        return 'DECRYPT_STREAMING_IMAGE_ERROR';
      case StreamingSessionStatusCode.networkInterfaceError:
        return 'NETWORK_INTERFACE_ERROR';
      case StreamingSessionStatusCode.streamingSessionStopped:
        return 'STREAMING_SESSION_STOPPED';
      case StreamingSessionStatusCode.streamingSessionStarted:
        return 'STREAMING_SESSION_STARTED';
      case StreamingSessionStatusCode.streamingSessionStopInProgress:
        return 'STREAMING_SESSION_STOP_IN_PROGRESS';
      case StreamingSessionStatusCode.streamingSessionStartInProgress:
        return 'STREAMING_SESSION_START_IN_PROGRESS';
      case StreamingSessionStatusCode.amiValidationError:
        return 'AMI_VALIDATION_ERROR';
    }
  }
}

extension StreamingSessionStatusCodeFromString on String {
  StreamingSessionStatusCode toStreamingSessionStatusCode() {
    switch (this) {
      case 'STREAMING_SESSION_READY':
        return StreamingSessionStatusCode.streamingSessionReady;
      case 'STREAMING_SESSION_DELETED':
        return StreamingSessionStatusCode.streamingSessionDeleted;
      case 'STREAMING_SESSION_CREATE_IN_PROGRESS':
        return StreamingSessionStatusCode.streamingSessionCreateInProgress;
      case 'STREAMING_SESSION_DELETE_IN_PROGRESS':
        return StreamingSessionStatusCode.streamingSessionDeleteInProgress;
      case 'INTERNAL_ERROR':
        return StreamingSessionStatusCode.internalError;
      case 'INSUFFICIENT_CAPACITY':
        return StreamingSessionStatusCode.insufficientCapacity;
      case 'ACTIVE_DIRECTORY_DOMAIN_JOIN_ERROR':
        return StreamingSessionStatusCode.activeDirectoryDomainJoinError;
      case 'NETWORK_CONNECTION_ERROR':
        return StreamingSessionStatusCode.networkConnectionError;
      case 'INITIALIZATION_SCRIPT_ERROR':
        return StreamingSessionStatusCode.initializationScriptError;
      case 'DECRYPT_STREAMING_IMAGE_ERROR':
        return StreamingSessionStatusCode.decryptStreamingImageError;
      case 'NETWORK_INTERFACE_ERROR':
        return StreamingSessionStatusCode.networkInterfaceError;
      case 'STREAMING_SESSION_STOPPED':
        return StreamingSessionStatusCode.streamingSessionStopped;
      case 'STREAMING_SESSION_STARTED':
        return StreamingSessionStatusCode.streamingSessionStarted;
      case 'STREAMING_SESSION_STOP_IN_PROGRESS':
        return StreamingSessionStatusCode.streamingSessionStopInProgress;
      case 'STREAMING_SESSION_START_IN_PROGRESS':
        return StreamingSessionStatusCode.streamingSessionStartInProgress;
      case 'AMI_VALIDATION_ERROR':
        return StreamingSessionStatusCode.amiValidationError;
    }
    throw Exception('$this is not known in enum StreamingSessionStatusCode');
  }
}

enum StreamingSessionStorageMode {
  upload,
}

extension StreamingSessionStorageModeValueExtension
    on StreamingSessionStorageMode {
  String toValue() {
    switch (this) {
      case StreamingSessionStorageMode.upload:
        return 'UPLOAD';
    }
  }
}

extension StreamingSessionStorageModeFromString on String {
  StreamingSessionStorageMode toStreamingSessionStorageMode() {
    switch (this) {
      case 'UPLOAD':
        return StreamingSessionStorageMode.upload;
    }
    throw Exception('$this is not known in enum StreamingSessionStorageMode');
  }
}

/// The upload storage root location (folder) on streaming workstations where
/// files are uploaded.
class StreamingSessionStorageRoot {
  /// The folder path in Linux workstations where files are uploaded.
  final String? linux;

  /// The folder path in Windows workstations where files are uploaded.
  final String? windows;

  StreamingSessionStorageRoot({
    this.linux,
    this.windows,
  });

  factory StreamingSessionStorageRoot.fromJson(Map<String, dynamic> json) {
    return StreamingSessionStorageRoot(
      linux: json['linux'] as String?,
      windows: json['windows'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linux = this.linux;
    final windows = this.windows;
    return {
      if (linux != null) 'linux': linux,
      if (windows != null) 'windows': windows,
    };
  }
}

/// A stream is an active connection to a streaming session, enabling a studio
/// user to control the streaming session using a compatible client. Streaming
/// session streams are compatible with the NICE DCV web client, included in the
/// Nimble Studio portal, or the NICE DCV desktop client.
class StreamingSessionStream {
  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The user ID of the user that created the streaming session stream.
  final String? createdBy;

  /// The ISO timestamp in seconds for when the resource expires.
  final DateTime? expiresAt;

  /// The user ID of the user that owns the streaming session. The user that owns
  /// the session will be logging into the session and interacting with the
  /// virtual workstation.
  final String? ownedBy;

  /// The current state.
  final StreamingSessionStreamState? state;

  /// The streaming session stream status code.
  final StreamingSessionStreamStatusCode? statusCode;

  /// The stream ID.
  final String? streamId;

  /// The URL to connect to this stream using the DCV client.
  final String? url;

  StreamingSessionStream({
    this.createdAt,
    this.createdBy,
    this.expiresAt,
    this.ownedBy,
    this.state,
    this.statusCode,
    this.streamId,
    this.url,
  });

  factory StreamingSessionStream.fromJson(Map<String, dynamic> json) {
    return StreamingSessionStream(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      expiresAt: timeStampFromJson(json['expiresAt']),
      ownedBy: json['ownedBy'] as String?,
      state: (json['state'] as String?)?.toStreamingSessionStreamState(),
      statusCode:
          (json['statusCode'] as String?)?.toStreamingSessionStreamStatusCode(),
      streamId: json['streamId'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final expiresAt = this.expiresAt;
    final ownedBy = this.ownedBy;
    final state = this.state;
    final statusCode = this.statusCode;
    final streamId = this.streamId;
    final url = this.url;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (expiresAt != null) 'expiresAt': iso8601ToJson(expiresAt),
      if (ownedBy != null) 'ownedBy': ownedBy,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (streamId != null) 'streamId': streamId,
      if (url != null) 'url': url,
    };
  }
}

enum StreamingSessionStreamState {
  ready,
  createInProgress,
  deleteInProgress,
  deleted,
  createFailed,
  deleteFailed,
}

extension StreamingSessionStreamStateValueExtension
    on StreamingSessionStreamState {
  String toValue() {
    switch (this) {
      case StreamingSessionStreamState.ready:
        return 'READY';
      case StreamingSessionStreamState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case StreamingSessionStreamState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case StreamingSessionStreamState.deleted:
        return 'DELETED';
      case StreamingSessionStreamState.createFailed:
        return 'CREATE_FAILED';
      case StreamingSessionStreamState.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension StreamingSessionStreamStateFromString on String {
  StreamingSessionStreamState toStreamingSessionStreamState() {
    switch (this) {
      case 'READY':
        return StreamingSessionStreamState.ready;
      case 'CREATE_IN_PROGRESS':
        return StreamingSessionStreamState.createInProgress;
      case 'DELETE_IN_PROGRESS':
        return StreamingSessionStreamState.deleteInProgress;
      case 'DELETED':
        return StreamingSessionStreamState.deleted;
      case 'CREATE_FAILED':
        return StreamingSessionStreamState.createFailed;
      case 'DELETE_FAILED':
        return StreamingSessionStreamState.deleteFailed;
    }
    throw Exception('$this is not known in enum StreamingSessionStreamState');
  }
}

enum StreamingSessionStreamStatusCode {
  streamCreateInProgress,
  streamReady,
  streamDeleteInProgress,
  streamDeleted,
  internalError,
  networkConnectionError,
}

extension StreamingSessionStreamStatusCodeValueExtension
    on StreamingSessionStreamStatusCode {
  String toValue() {
    switch (this) {
      case StreamingSessionStreamStatusCode.streamCreateInProgress:
        return 'STREAM_CREATE_IN_PROGRESS';
      case StreamingSessionStreamStatusCode.streamReady:
        return 'STREAM_READY';
      case StreamingSessionStreamStatusCode.streamDeleteInProgress:
        return 'STREAM_DELETE_IN_PROGRESS';
      case StreamingSessionStreamStatusCode.streamDeleted:
        return 'STREAM_DELETED';
      case StreamingSessionStreamStatusCode.internalError:
        return 'INTERNAL_ERROR';
      case StreamingSessionStreamStatusCode.networkConnectionError:
        return 'NETWORK_CONNECTION_ERROR';
    }
  }
}

extension StreamingSessionStreamStatusCodeFromString on String {
  StreamingSessionStreamStatusCode toStreamingSessionStreamStatusCode() {
    switch (this) {
      case 'STREAM_CREATE_IN_PROGRESS':
        return StreamingSessionStreamStatusCode.streamCreateInProgress;
      case 'STREAM_READY':
        return StreamingSessionStreamStatusCode.streamReady;
      case 'STREAM_DELETE_IN_PROGRESS':
        return StreamingSessionStreamStatusCode.streamDeleteInProgress;
      case 'STREAM_DELETED':
        return StreamingSessionStreamStatusCode.streamDeleted;
      case 'INTERNAL_ERROR':
        return StreamingSessionStreamStatusCode.internalError;
      case 'NETWORK_CONNECTION_ERROR':
        return StreamingSessionStreamStatusCode.networkConnectionError;
    }
    throw Exception(
        '$this is not known in enum StreamingSessionStreamStatusCode');
  }
}

/// Represents a studio resource.
///
/// A studio is the core resource used with Nimble Studio. You must create a
/// studio first, before any other resource type can be created. All other
/// resources you create and manage in Nimble Studio are contained within a
/// studio.
///
/// When creating a studio, you must provides two IAM roles for use with the
/// Nimble Studio portal. These roles are assumed by your users when they log in
/// to the Nimble Studio portal via IAM Identity Center and your identity
/// source.
///
/// The user role must have the <code>AmazonNimbleStudio-StudioUser</code>
/// managed policy attached for the portal to function properly.
///
/// The admin role must have the <code>AmazonNimbleStudio-StudioAdmin</code>
/// managed policy attached for the portal to function properly.
///
/// Your studio roles must trust the <code>identity.nimble.amazonaws.com</code>
/// service principal to function properly.
class Studio {
  /// The IAM role that studio admins assume when logging in to the Nimble Studio
  /// portal.
  final String? adminRoleArn;

  /// The Amazon Resource Name (ARN) that is assigned to a studio resource and
  /// uniquely identifies it. ARNs are unique across all Regions.
  final String? arn;

  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// A friendly name for the studio.
  final String? displayName;

  /// The Amazon Web Services Region where the studio resource is located.
  final String? homeRegion;

  /// The IAM Identity Center application client ID used to integrate with IAM
  /// Identity Center. This ID allows IAM Identity Center users to log in to
  /// Nimble Studio portal.
  final String? ssoClientId;

  /// The current state of the studio resource.
  final StudioState? state;

  /// Status codes that provide additional detail on the studio state.
  final StudioStatusCode? statusCode;

  /// Additional detail on the studio state.
  final String? statusMessage;

  /// Configuration of the encryption method that is used for the studio.
  final StudioEncryptionConfiguration? studioEncryptionConfiguration;

  /// The unique identifier for a studio resource. In Nimble Studio, all other
  /// resources are contained in a studio resource.
  final String? studioId;

  /// The name of the studio, as included in the URL when accessing it in the
  /// Nimble Studio portal.
  final String? studioName;

  /// The address of the web page for the studio.
  final String? studioUrl;

  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  final Map<String, String>? tags;

  /// The ISO timestamp in seconds for when the resource was updated.
  final DateTime? updatedAt;

  /// The IAM role that studio users assume when logging in to the Nimble Studio
  /// portal.
  final String? userRoleArn;

  Studio({
    this.adminRoleArn,
    this.arn,
    this.createdAt,
    this.displayName,
    this.homeRegion,
    this.ssoClientId,
    this.state,
    this.statusCode,
    this.statusMessage,
    this.studioEncryptionConfiguration,
    this.studioId,
    this.studioName,
    this.studioUrl,
    this.tags,
    this.updatedAt,
    this.userRoleArn,
  });

  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      adminRoleArn: json['adminRoleArn'] as String?,
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      displayName: json['displayName'] as String?,
      homeRegion: json['homeRegion'] as String?,
      ssoClientId: json['ssoClientId'] as String?,
      state: (json['state'] as String?)?.toStudioState(),
      statusCode: (json['statusCode'] as String?)?.toStudioStatusCode(),
      statusMessage: json['statusMessage'] as String?,
      studioEncryptionConfiguration:
          json['studioEncryptionConfiguration'] != null
              ? StudioEncryptionConfiguration.fromJson(
                  json['studioEncryptionConfiguration'] as Map<String, dynamic>)
              : null,
      studioId: json['studioId'] as String?,
      studioName: json['studioName'] as String?,
      studioUrl: json['studioUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      userRoleArn: json['userRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminRoleArn = this.adminRoleArn;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final displayName = this.displayName;
    final homeRegion = this.homeRegion;
    final ssoClientId = this.ssoClientId;
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final studioEncryptionConfiguration = this.studioEncryptionConfiguration;
    final studioId = this.studioId;
    final studioName = this.studioName;
    final studioUrl = this.studioUrl;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    final userRoleArn = this.userRoleArn;
    return {
      if (adminRoleArn != null) 'adminRoleArn': adminRoleArn,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (displayName != null) 'displayName': displayName,
      if (homeRegion != null) 'homeRegion': homeRegion,
      if (ssoClientId != null) 'ssoClientId': ssoClientId,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (studioEncryptionConfiguration != null)
        'studioEncryptionConfiguration': studioEncryptionConfiguration,
      if (studioId != null) 'studioId': studioId,
      if (studioName != null) 'studioName': studioName,
      if (studioUrl != null) 'studioUrl': studioUrl,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (userRoleArn != null) 'userRoleArn': userRoleArn,
    };
  }
}

/// A studio component represents a network resource to be used by a studio's
/// users and workflows. A typical studio contains studio components for each of
/// the following: render farm, Active Directory, licensing, and file system.
///
/// Access to a studio component is managed by specifying security groups for
/// the resource, as well as its endpoint.
///
/// A studio component also has a set of initialization scripts that are
/// returned by <code>GetLaunchProfileInitialization</code>. These
/// initialization scripts run on streaming sessions when they start. They
/// provide users with flexibility in controlling how the studio resources are
/// configured on a streaming session.
class StudioComponent {
  /// The Amazon Resource Name (ARN) that is assigned to a studio resource and
  /// uniquely identifies it. ARNs are unique across all Regions.
  final String? arn;

  /// The configuration of the studio component, based on component type.
  final StudioComponentConfiguration? configuration;

  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The user ID of the user that created the studio component.
  final String? createdBy;

  /// A human-readable description for the studio component resource.
  final String? description;

  /// The EC2 security groups that control access to the studio component.
  final List<String>? ec2SecurityGroupIds;

  /// Initialization scripts for studio components.
  final List<StudioComponentInitializationScript>? initializationScripts;

  /// A friendly name for the studio component resource.
  final String? name;

  /// An IAM role attached to a Studio Component that gives the studio component
  /// access to Amazon Web Services resources at anytime while the instance is
  /// running.
  final String? runtimeRoleArn;

  /// Parameters for the studio component scripts.
  final List<ScriptParameterKeyValue>? scriptParameters;

  /// An IAM role attached to Studio Component when the system initialization
  /// script runs which give the studio component access to Amazon Web Services
  /// resources when the system initialization script runs.
  final String? secureInitializationRoleArn;

  /// The current state.
  final StudioComponentState? state;

  /// The status code.
  final StudioComponentStatusCode? statusCode;

  /// The status message for the studio component.
  final String? statusMessage;

  /// The unique identifier for a studio component resource.
  final String? studioComponentId;

  /// The specific subtype of a studio component.
  final StudioComponentSubtype? subtype;

  /// A collection of labels, in the form of key-value pairs, that apply to this
  /// resource.
  final Map<String, String>? tags;

  /// The type of the studio component.
  final StudioComponentType? type;

  /// The ISO timestamp in seconds for when the resource was updated.
  final DateTime? updatedAt;

  /// The user ID of the user that most recently updated the resource.
  final String? updatedBy;

  StudioComponent({
    this.arn,
    this.configuration,
    this.createdAt,
    this.createdBy,
    this.description,
    this.ec2SecurityGroupIds,
    this.initializationScripts,
    this.name,
    this.runtimeRoleArn,
    this.scriptParameters,
    this.secureInitializationRoleArn,
    this.state,
    this.statusCode,
    this.statusMessage,
    this.studioComponentId,
    this.subtype,
    this.tags,
    this.type,
    this.updatedAt,
    this.updatedBy,
  });

  factory StudioComponent.fromJson(Map<String, dynamic> json) {
    return StudioComponent(
      arn: json['arn'] as String?,
      configuration: json['configuration'] != null
          ? StudioComponentConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      ec2SecurityGroupIds: (json['ec2SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      initializationScripts: (json['initializationScripts'] as List?)
          ?.whereNotNull()
          .map((e) => StudioComponentInitializationScript.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      runtimeRoleArn: json['runtimeRoleArn'] as String?,
      scriptParameters: (json['scriptParameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ScriptParameterKeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      secureInitializationRoleArn:
          json['secureInitializationRoleArn'] as String?,
      state: (json['state'] as String?)?.toStudioComponentState(),
      statusCode:
          (json['statusCode'] as String?)?.toStudioComponentStatusCode(),
      statusMessage: json['statusMessage'] as String?,
      studioComponentId: json['studioComponentId'] as String?,
      subtype: (json['subtype'] as String?)?.toStudioComponentSubtype(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toStudioComponentType(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final ec2SecurityGroupIds = this.ec2SecurityGroupIds;
    final initializationScripts = this.initializationScripts;
    final name = this.name;
    final runtimeRoleArn = this.runtimeRoleArn;
    final scriptParameters = this.scriptParameters;
    final secureInitializationRoleArn = this.secureInitializationRoleArn;
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final studioComponentId = this.studioComponentId;
    final subtype = this.subtype;
    final tags = this.tags;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (arn != null) 'arn': arn,
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (ec2SecurityGroupIds != null)
        'ec2SecurityGroupIds': ec2SecurityGroupIds,
      if (initializationScripts != null)
        'initializationScripts': initializationScripts,
      if (name != null) 'name': name,
      if (runtimeRoleArn != null) 'runtimeRoleArn': runtimeRoleArn,
      if (scriptParameters != null) 'scriptParameters': scriptParameters,
      if (secureInitializationRoleArn != null)
        'secureInitializationRoleArn': secureInitializationRoleArn,
      if (state != null) 'state': state.toValue(),
      if (statusCode != null) 'statusCode': statusCode.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (studioComponentId != null) 'studioComponentId': studioComponentId,
      if (subtype != null) 'subtype': subtype.toValue(),
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The configuration of the studio component, based on component type.
class StudioComponentConfiguration {
  /// The configuration for a Directory Service for Microsoft Active Directory
  /// studio resource.
  final ActiveDirectoryConfiguration? activeDirectoryConfiguration;

  /// The configuration for a render farm that is associated with a studio
  /// resource.
  final ComputeFarmConfiguration? computeFarmConfiguration;

  /// The configuration for a license service that is associated with a studio
  /// resource.
  final LicenseServiceConfiguration? licenseServiceConfiguration;

  /// The configuration for a shared file storage system that is associated with a
  /// studio resource.
  final SharedFileSystemConfiguration? sharedFileSystemConfiguration;

  StudioComponentConfiguration({
    this.activeDirectoryConfiguration,
    this.computeFarmConfiguration,
    this.licenseServiceConfiguration,
    this.sharedFileSystemConfiguration,
  });

  factory StudioComponentConfiguration.fromJson(Map<String, dynamic> json) {
    return StudioComponentConfiguration(
      activeDirectoryConfiguration: json['activeDirectoryConfiguration'] != null
          ? ActiveDirectoryConfiguration.fromJson(
              json['activeDirectoryConfiguration'] as Map<String, dynamic>)
          : null,
      computeFarmConfiguration: json['computeFarmConfiguration'] != null
          ? ComputeFarmConfiguration.fromJson(
              json['computeFarmConfiguration'] as Map<String, dynamic>)
          : null,
      licenseServiceConfiguration: json['licenseServiceConfiguration'] != null
          ? LicenseServiceConfiguration.fromJson(
              json['licenseServiceConfiguration'] as Map<String, dynamic>)
          : null,
      sharedFileSystemConfiguration:
          json['sharedFileSystemConfiguration'] != null
              ? SharedFileSystemConfiguration.fromJson(
                  json['sharedFileSystemConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryConfiguration = this.activeDirectoryConfiguration;
    final computeFarmConfiguration = this.computeFarmConfiguration;
    final licenseServiceConfiguration = this.licenseServiceConfiguration;
    final sharedFileSystemConfiguration = this.sharedFileSystemConfiguration;
    return {
      if (activeDirectoryConfiguration != null)
        'activeDirectoryConfiguration': activeDirectoryConfiguration,
      if (computeFarmConfiguration != null)
        'computeFarmConfiguration': computeFarmConfiguration,
      if (licenseServiceConfiguration != null)
        'licenseServiceConfiguration': licenseServiceConfiguration,
      if (sharedFileSystemConfiguration != null)
        'sharedFileSystemConfiguration': sharedFileSystemConfiguration,
    };
  }
}

/// Initialization scripts for studio components.
class StudioComponentInitializationScript {
  /// The version number of the protocol that is used by the launch profile. The
  /// only valid version is "2021-03-31".
  final String? launchProfileProtocolVersion;

  /// The platform of the initialization script, either Windows or Linux.
  final LaunchProfilePlatform? platform;

  /// The method to use when running the initialization script.
  final StudioComponentInitializationScriptRunContext? runContext;

  /// The initialization script.
  final String? script;

  StudioComponentInitializationScript({
    this.launchProfileProtocolVersion,
    this.platform,
    this.runContext,
    this.script,
  });

  factory StudioComponentInitializationScript.fromJson(
      Map<String, dynamic> json) {
    return StudioComponentInitializationScript(
      launchProfileProtocolVersion:
          json['launchProfileProtocolVersion'] as String?,
      platform: (json['platform'] as String?)?.toLaunchProfilePlatform(),
      runContext: (json['runContext'] as String?)
          ?.toStudioComponentInitializationScriptRunContext(),
      script: json['script'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfileProtocolVersion = this.launchProfileProtocolVersion;
    final platform = this.platform;
    final runContext = this.runContext;
    final script = this.script;
    return {
      if (launchProfileProtocolVersion != null)
        'launchProfileProtocolVersion': launchProfileProtocolVersion,
      if (platform != null) 'platform': platform.toValue(),
      if (runContext != null) 'runContext': runContext.toValue(),
      if (script != null) 'script': script,
    };
  }
}

enum StudioComponentInitializationScriptRunContext {
  systemInitialization,
  userInitialization,
}

extension StudioComponentInitializationScriptRunContextValueExtension
    on StudioComponentInitializationScriptRunContext {
  String toValue() {
    switch (this) {
      case StudioComponentInitializationScriptRunContext.systemInitialization:
        return 'SYSTEM_INITIALIZATION';
      case StudioComponentInitializationScriptRunContext.userInitialization:
        return 'USER_INITIALIZATION';
    }
  }
}

extension StudioComponentInitializationScriptRunContextFromString on String {
  StudioComponentInitializationScriptRunContext
      toStudioComponentInitializationScriptRunContext() {
    switch (this) {
      case 'SYSTEM_INITIALIZATION':
        return StudioComponentInitializationScriptRunContext
            .systemInitialization;
      case 'USER_INITIALIZATION':
        return StudioComponentInitializationScriptRunContext.userInitialization;
    }
    throw Exception(
        '$this is not known in enum StudioComponentInitializationScriptRunContext');
  }
}

/// The current state of the studio component resource.
///
/// While a studio component is being created, modified, or deleted, its state
/// will be <code>CREATE_IN_PROGRESS</code>, <code>UPDATE_IN_PROGRESS</code>, or
/// <code>DELETE_IN_PROGRESS</code>.
///
/// These are called <i>transition states</i>.
///
/// No modifications may be made to the studio component while it is in a
/// transition state.
///
/// If creation of the resource fails, the state will change to
/// <code>CREATE_FAILED</code>. The resource <code>StatusCode</code> and
/// <code>StatusMessage</code> will provide more information of why creation
/// failed. The resource in this state will automatically be deleted from your
/// account after a period of time.
///
/// If updating the resource fails, the state will change to
/// <code>UPDATE_FAILED</code>. The resource <code>StatusCode</code> and
/// <code>StatusMessage</code> will provide more information of why the update
/// failed. The resource will be returned to the state it was in when the update
/// request was invoked.
///
/// If deleting the resource fails, the state will change to
/// <code>DELETE_FAILED</code>. The resource <code>StatusCode</code> and
/// <code>StatusMessage</code> will provide more information of why the update
/// failed. The resource will be returned to the state it was in when the update
/// request was invoked. After the resource is deleted successfully, it will
/// change to the <code>DELETED</code> state. The resource will no longer count
/// against service quotas and cannot be used or acted upon any futher. It will
/// be removed from your account after a period of time.
enum StudioComponentState {
  createInProgress,
  ready,
  updateInProgress,
  deleteInProgress,
  deleted,
  deleteFailed,
  createFailed,
  updateFailed,
}

extension StudioComponentStateValueExtension on StudioComponentState {
  String toValue() {
    switch (this) {
      case StudioComponentState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case StudioComponentState.ready:
        return 'READY';
      case StudioComponentState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case StudioComponentState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case StudioComponentState.deleted:
        return 'DELETED';
      case StudioComponentState.deleteFailed:
        return 'DELETE_FAILED';
      case StudioComponentState.createFailed:
        return 'CREATE_FAILED';
      case StudioComponentState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension StudioComponentStateFromString on String {
  StudioComponentState toStudioComponentState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return StudioComponentState.createInProgress;
      case 'READY':
        return StudioComponentState.ready;
      case 'UPDATE_IN_PROGRESS':
        return StudioComponentState.updateInProgress;
      case 'DELETE_IN_PROGRESS':
        return StudioComponentState.deleteInProgress;
      case 'DELETED':
        return StudioComponentState.deleted;
      case 'DELETE_FAILED':
        return StudioComponentState.deleteFailed;
      case 'CREATE_FAILED':
        return StudioComponentState.createFailed;
      case 'UPDATE_FAILED':
        return StudioComponentState.updateFailed;
    }
    throw Exception('$this is not known in enum StudioComponentState');
  }
}

/// The current status of the studio component resource.
///
/// When the resource is in the <code>READY</code> state, the status code
/// signals what the last mutation made to the resource was.
///
/// When the resource is in a <code>CREATE_FAILED</code>,
/// <code>UPDATE_FAILED</code>, or <code>DELETE_FAILED</code> state, the status
/// code signals what went wrong and why the mutation failed.
enum StudioComponentStatusCode {
  activeDirectoryAlreadyExists,
  studioComponentCreated,
  studioComponentUpdated,
  studioComponentDeleted,
  encryptionKeyAccessDenied,
  encryptionKeyNotFound,
  studioComponentCreateInProgress,
  studioComponentUpdateInProgress,
  studioComponentDeleteInProgress,
  internalError,
}

extension StudioComponentStatusCodeValueExtension on StudioComponentStatusCode {
  String toValue() {
    switch (this) {
      case StudioComponentStatusCode.activeDirectoryAlreadyExists:
        return 'ACTIVE_DIRECTORY_ALREADY_EXISTS';
      case StudioComponentStatusCode.studioComponentCreated:
        return 'STUDIO_COMPONENT_CREATED';
      case StudioComponentStatusCode.studioComponentUpdated:
        return 'STUDIO_COMPONENT_UPDATED';
      case StudioComponentStatusCode.studioComponentDeleted:
        return 'STUDIO_COMPONENT_DELETED';
      case StudioComponentStatusCode.encryptionKeyAccessDenied:
        return 'ENCRYPTION_KEY_ACCESS_DENIED';
      case StudioComponentStatusCode.encryptionKeyNotFound:
        return 'ENCRYPTION_KEY_NOT_FOUND';
      case StudioComponentStatusCode.studioComponentCreateInProgress:
        return 'STUDIO_COMPONENT_CREATE_IN_PROGRESS';
      case StudioComponentStatusCode.studioComponentUpdateInProgress:
        return 'STUDIO_COMPONENT_UPDATE_IN_PROGRESS';
      case StudioComponentStatusCode.studioComponentDeleteInProgress:
        return 'STUDIO_COMPONENT_DELETE_IN_PROGRESS';
      case StudioComponentStatusCode.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension StudioComponentStatusCodeFromString on String {
  StudioComponentStatusCode toStudioComponentStatusCode() {
    switch (this) {
      case 'ACTIVE_DIRECTORY_ALREADY_EXISTS':
        return StudioComponentStatusCode.activeDirectoryAlreadyExists;
      case 'STUDIO_COMPONENT_CREATED':
        return StudioComponentStatusCode.studioComponentCreated;
      case 'STUDIO_COMPONENT_UPDATED':
        return StudioComponentStatusCode.studioComponentUpdated;
      case 'STUDIO_COMPONENT_DELETED':
        return StudioComponentStatusCode.studioComponentDeleted;
      case 'ENCRYPTION_KEY_ACCESS_DENIED':
        return StudioComponentStatusCode.encryptionKeyAccessDenied;
      case 'ENCRYPTION_KEY_NOT_FOUND':
        return StudioComponentStatusCode.encryptionKeyNotFound;
      case 'STUDIO_COMPONENT_CREATE_IN_PROGRESS':
        return StudioComponentStatusCode.studioComponentCreateInProgress;
      case 'STUDIO_COMPONENT_UPDATE_IN_PROGRESS':
        return StudioComponentStatusCode.studioComponentUpdateInProgress;
      case 'STUDIO_COMPONENT_DELETE_IN_PROGRESS':
        return StudioComponentStatusCode.studioComponentDeleteInProgress;
      case 'INTERNAL_ERROR':
        return StudioComponentStatusCode.internalError;
    }
    throw Exception('$this is not known in enum StudioComponentStatusCode');
  }
}

enum StudioComponentSubtype {
  awsManagedMicrosoftAd,
  amazonFsxForWindows,
  amazonFsxForLustre,
  custom,
}

extension StudioComponentSubtypeValueExtension on StudioComponentSubtype {
  String toValue() {
    switch (this) {
      case StudioComponentSubtype.awsManagedMicrosoftAd:
        return 'AWS_MANAGED_MICROSOFT_AD';
      case StudioComponentSubtype.amazonFsxForWindows:
        return 'AMAZON_FSX_FOR_WINDOWS';
      case StudioComponentSubtype.amazonFsxForLustre:
        return 'AMAZON_FSX_FOR_LUSTRE';
      case StudioComponentSubtype.custom:
        return 'CUSTOM';
    }
  }
}

extension StudioComponentSubtypeFromString on String {
  StudioComponentSubtype toStudioComponentSubtype() {
    switch (this) {
      case 'AWS_MANAGED_MICROSOFT_AD':
        return StudioComponentSubtype.awsManagedMicrosoftAd;
      case 'AMAZON_FSX_FOR_WINDOWS':
        return StudioComponentSubtype.amazonFsxForWindows;
      case 'AMAZON_FSX_FOR_LUSTRE':
        return StudioComponentSubtype.amazonFsxForLustre;
      case 'CUSTOM':
        return StudioComponentSubtype.custom;
    }
    throw Exception('$this is not known in enum StudioComponentSubtype');
  }
}

/// The studio component's summary.
class StudioComponentSummary {
  /// The ISO timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The user ID of the user that created the studio component.
  final String? createdBy;

  /// The description.
  final String? description;

  /// The name for the studio component.
  final String? name;

  /// The unique identifier for a studio component resource.
  final String? studioComponentId;

  /// The specific subtype of a studio component.
  final StudioComponentSubtype? subtype;

  /// The type of the studio component.
  final StudioComponentType? type;

  /// The ISO timestamp in seconds for when the resource was updated.
  final DateTime? updatedAt;

  /// The user ID of the user that most recently updated the resource.
  final String? updatedBy;

  StudioComponentSummary({
    this.createdAt,
    this.createdBy,
    this.description,
    this.name,
    this.studioComponentId,
    this.subtype,
    this.type,
    this.updatedAt,
    this.updatedBy,
  });

  factory StudioComponentSummary.fromJson(Map<String, dynamic> json) {
    return StudioComponentSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      studioComponentId: json['studioComponentId'] as String?,
      subtype: (json['subtype'] as String?)?.toStudioComponentSubtype(),
      type: (json['type'] as String?)?.toStudioComponentType(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final name = this.name;
    final studioComponentId = this.studioComponentId;
    final subtype = this.subtype;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (studioComponentId != null) 'studioComponentId': studioComponentId,
      if (subtype != null) 'subtype': subtype.toValue(),
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum StudioComponentType {
  activeDirectory,
  sharedFileSystem,
  computeFarm,
  licenseService,
  custom,
}

extension StudioComponentTypeValueExtension on StudioComponentType {
  String toValue() {
    switch (this) {
      case StudioComponentType.activeDirectory:
        return 'ACTIVE_DIRECTORY';
      case StudioComponentType.sharedFileSystem:
        return 'SHARED_FILE_SYSTEM';
      case StudioComponentType.computeFarm:
        return 'COMPUTE_FARM';
      case StudioComponentType.licenseService:
        return 'LICENSE_SERVICE';
      case StudioComponentType.custom:
        return 'CUSTOM';
    }
  }
}

extension StudioComponentTypeFromString on String {
  StudioComponentType toStudioComponentType() {
    switch (this) {
      case 'ACTIVE_DIRECTORY':
        return StudioComponentType.activeDirectory;
      case 'SHARED_FILE_SYSTEM':
        return StudioComponentType.sharedFileSystem;
      case 'COMPUTE_FARM':
        return StudioComponentType.computeFarm;
      case 'LICENSE_SERVICE':
        return StudioComponentType.licenseService;
      case 'CUSTOM':
        return StudioComponentType.custom;
    }
    throw Exception('$this is not known in enum StudioComponentType');
  }
}

/// Configuration of the encryption method that is used for the studio.
class StudioEncryptionConfiguration {
  /// The type of KMS key that is used to encrypt studio data.
  final StudioEncryptionConfigurationKeyType keyType;

  /// The ARN for a KMS key that is used to encrypt studio data.
  final String? keyArn;

  StudioEncryptionConfiguration({
    required this.keyType,
    this.keyArn,
  });

  factory StudioEncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return StudioEncryptionConfiguration(
      keyType:
          (json['keyType'] as String).toStudioEncryptionConfigurationKeyType(),
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyType = this.keyType;
    final keyArn = this.keyArn;
    return {
      'keyType': keyType.toValue(),
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

/// The type of KMS key that is used to encrypt studio data.
enum StudioEncryptionConfigurationKeyType {
  awsOwnedKey,
  customerManagedKey,
}

extension StudioEncryptionConfigurationKeyTypeValueExtension
    on StudioEncryptionConfigurationKeyType {
  String toValue() {
    switch (this) {
      case StudioEncryptionConfigurationKeyType.awsOwnedKey:
        return 'AWS_OWNED_KEY';
      case StudioEncryptionConfigurationKeyType.customerManagedKey:
        return 'CUSTOMER_MANAGED_KEY';
    }
  }
}

extension StudioEncryptionConfigurationKeyTypeFromString on String {
  StudioEncryptionConfigurationKeyType
      toStudioEncryptionConfigurationKeyType() {
    switch (this) {
      case 'AWS_OWNED_KEY':
        return StudioEncryptionConfigurationKeyType.awsOwnedKey;
      case 'CUSTOMER_MANAGED_KEY':
        return StudioEncryptionConfigurationKeyType.customerManagedKey;
    }
    throw Exception(
        '$this is not known in enum StudioEncryptionConfigurationKeyType');
  }
}

/// A studio member is an association of a user from your studio identity source
/// to elevated permissions that they are granted in the studio.
///
/// When you add a user to your studio using the Nimble Studio console, they are
/// given access to the studio's IAM Identity Center application and are given
/// access to log in to the Nimble Studio portal. These users have the
/// permissions provided by the studio's user IAM role and do not appear in the
/// studio membership collection. Only studio admins appear in studio
/// membership.
///
/// When you add a user to studio membership with the ADMIN persona, upon
/// logging in to the Nimble Studio portal, they are granted permissions
/// specified by the Studio's Admin IAM role.
class StudioMembership {
  /// The ID of the identity store.
  final String? identityStoreId;

  /// The persona.
  final StudioPersona? persona;

  /// The principal ID.
  final String? principalId;

  /// The Active Directory Security Identifier for this user, if available.
  final String? sid;

  StudioMembership({
    this.identityStoreId,
    this.persona,
    this.principalId,
    this.sid,
  });

  factory StudioMembership.fromJson(Map<String, dynamic> json) {
    return StudioMembership(
      identityStoreId: json['identityStoreId'] as String?,
      persona: (json['persona'] as String?)?.toStudioPersona(),
      principalId: json['principalId'] as String?,
      sid: json['sid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final persona = this.persona;
    final principalId = this.principalId;
    final sid = this.sid;
    return {
      if (identityStoreId != null) 'identityStoreId': identityStoreId,
      if (persona != null) 'persona': persona.toValue(),
      if (principalId != null) 'principalId': principalId,
      if (sid != null) 'sid': sid,
    };
  }
}

enum StudioPersona {
  administrator,
}

extension StudioPersonaValueExtension on StudioPersona {
  String toValue() {
    switch (this) {
      case StudioPersona.administrator:
        return 'ADMINISTRATOR';
    }
  }
}

extension StudioPersonaFromString on String {
  StudioPersona toStudioPersona() {
    switch (this) {
      case 'ADMINISTRATOR':
        return StudioPersona.administrator;
    }
    throw Exception('$this is not known in enum StudioPersona');
  }
}

enum StudioState {
  createInProgress,
  ready,
  updateInProgress,
  deleteInProgress,
  deleted,
  deleteFailed,
  createFailed,
  updateFailed,
}

extension StudioStateValueExtension on StudioState {
  String toValue() {
    switch (this) {
      case StudioState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case StudioState.ready:
        return 'READY';
      case StudioState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case StudioState.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case StudioState.deleted:
        return 'DELETED';
      case StudioState.deleteFailed:
        return 'DELETE_FAILED';
      case StudioState.createFailed:
        return 'CREATE_FAILED';
      case StudioState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension StudioStateFromString on String {
  StudioState toStudioState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return StudioState.createInProgress;
      case 'READY':
        return StudioState.ready;
      case 'UPDATE_IN_PROGRESS':
        return StudioState.updateInProgress;
      case 'DELETE_IN_PROGRESS':
        return StudioState.deleteInProgress;
      case 'DELETED':
        return StudioState.deleted;
      case 'DELETE_FAILED':
        return StudioState.deleteFailed;
      case 'CREATE_FAILED':
        return StudioState.createFailed;
      case 'UPDATE_FAILED':
        return StudioState.updateFailed;
    }
    throw Exception('$this is not known in enum StudioState');
  }
}

/// The status code.
enum StudioStatusCode {
  studioCreated,
  studioDeleted,
  studioUpdated,
  studioCreateInProgress,
  studioUpdateInProgress,
  studioDeleteInProgress,
  studioWithLaunchProfilesNotDeleted,
  studioWithStudioComponentsNotDeleted,
  studioWithStreamingImagesNotDeleted,
  awsSsoNotEnabled,
  awsSsoAccessDenied,
  roleNotOwnedByStudioOwner,
  roleCouldNotBeAssumed,
  internalError,
  encryptionKeyNotFound,
  encryptionKeyAccessDenied,
  awsSsoConfigurationRepaired,
  awsSsoConfigurationRepairInProgress,
  awsStsRegionDisabled,
}

extension StudioStatusCodeValueExtension on StudioStatusCode {
  String toValue() {
    switch (this) {
      case StudioStatusCode.studioCreated:
        return 'STUDIO_CREATED';
      case StudioStatusCode.studioDeleted:
        return 'STUDIO_DELETED';
      case StudioStatusCode.studioUpdated:
        return 'STUDIO_UPDATED';
      case StudioStatusCode.studioCreateInProgress:
        return 'STUDIO_CREATE_IN_PROGRESS';
      case StudioStatusCode.studioUpdateInProgress:
        return 'STUDIO_UPDATE_IN_PROGRESS';
      case StudioStatusCode.studioDeleteInProgress:
        return 'STUDIO_DELETE_IN_PROGRESS';
      case StudioStatusCode.studioWithLaunchProfilesNotDeleted:
        return 'STUDIO_WITH_LAUNCH_PROFILES_NOT_DELETED';
      case StudioStatusCode.studioWithStudioComponentsNotDeleted:
        return 'STUDIO_WITH_STUDIO_COMPONENTS_NOT_DELETED';
      case StudioStatusCode.studioWithStreamingImagesNotDeleted:
        return 'STUDIO_WITH_STREAMING_IMAGES_NOT_DELETED';
      case StudioStatusCode.awsSsoNotEnabled:
        return 'AWS_SSO_NOT_ENABLED';
      case StudioStatusCode.awsSsoAccessDenied:
        return 'AWS_SSO_ACCESS_DENIED';
      case StudioStatusCode.roleNotOwnedByStudioOwner:
        return 'ROLE_NOT_OWNED_BY_STUDIO_OWNER';
      case StudioStatusCode.roleCouldNotBeAssumed:
        return 'ROLE_COULD_NOT_BE_ASSUMED';
      case StudioStatusCode.internalError:
        return 'INTERNAL_ERROR';
      case StudioStatusCode.encryptionKeyNotFound:
        return 'ENCRYPTION_KEY_NOT_FOUND';
      case StudioStatusCode.encryptionKeyAccessDenied:
        return 'ENCRYPTION_KEY_ACCESS_DENIED';
      case StudioStatusCode.awsSsoConfigurationRepaired:
        return 'AWS_SSO_CONFIGURATION_REPAIRED';
      case StudioStatusCode.awsSsoConfigurationRepairInProgress:
        return 'AWS_SSO_CONFIGURATION_REPAIR_IN_PROGRESS';
      case StudioStatusCode.awsStsRegionDisabled:
        return 'AWS_STS_REGION_DISABLED';
    }
  }
}

extension StudioStatusCodeFromString on String {
  StudioStatusCode toStudioStatusCode() {
    switch (this) {
      case 'STUDIO_CREATED':
        return StudioStatusCode.studioCreated;
      case 'STUDIO_DELETED':
        return StudioStatusCode.studioDeleted;
      case 'STUDIO_UPDATED':
        return StudioStatusCode.studioUpdated;
      case 'STUDIO_CREATE_IN_PROGRESS':
        return StudioStatusCode.studioCreateInProgress;
      case 'STUDIO_UPDATE_IN_PROGRESS':
        return StudioStatusCode.studioUpdateInProgress;
      case 'STUDIO_DELETE_IN_PROGRESS':
        return StudioStatusCode.studioDeleteInProgress;
      case 'STUDIO_WITH_LAUNCH_PROFILES_NOT_DELETED':
        return StudioStatusCode.studioWithLaunchProfilesNotDeleted;
      case 'STUDIO_WITH_STUDIO_COMPONENTS_NOT_DELETED':
        return StudioStatusCode.studioWithStudioComponentsNotDeleted;
      case 'STUDIO_WITH_STREAMING_IMAGES_NOT_DELETED':
        return StudioStatusCode.studioWithStreamingImagesNotDeleted;
      case 'AWS_SSO_NOT_ENABLED':
        return StudioStatusCode.awsSsoNotEnabled;
      case 'AWS_SSO_ACCESS_DENIED':
        return StudioStatusCode.awsSsoAccessDenied;
      case 'ROLE_NOT_OWNED_BY_STUDIO_OWNER':
        return StudioStatusCode.roleNotOwnedByStudioOwner;
      case 'ROLE_COULD_NOT_BE_ASSUMED':
        return StudioStatusCode.roleCouldNotBeAssumed;
      case 'INTERNAL_ERROR':
        return StudioStatusCode.internalError;
      case 'ENCRYPTION_KEY_NOT_FOUND':
        return StudioStatusCode.encryptionKeyNotFound;
      case 'ENCRYPTION_KEY_ACCESS_DENIED':
        return StudioStatusCode.encryptionKeyAccessDenied;
      case 'AWS_SSO_CONFIGURATION_REPAIRED':
        return StudioStatusCode.awsSsoConfigurationRepaired;
      case 'AWS_SSO_CONFIGURATION_REPAIR_IN_PROGRESS':
        return StudioStatusCode.awsSsoConfigurationRepairInProgress;
      case 'AWS_STS_REGION_DISABLED':
        return StudioStatusCode.awsStsRegionDisabled;
    }
    throw Exception('$this is not known in enum StudioStatusCode');
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLaunchProfileMemberResponse {
  /// The updated member.
  final LaunchProfileMembership? member;

  UpdateLaunchProfileMemberResponse({
    this.member,
  });

  factory UpdateLaunchProfileMemberResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLaunchProfileMemberResponse(
      member: json['member'] != null
          ? LaunchProfileMembership.fromJson(
              json['member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'member': member,
    };
  }
}

class UpdateLaunchProfileResponse {
  /// The launch profile.
  final LaunchProfile? launchProfile;

  UpdateLaunchProfileResponse({
    this.launchProfile,
  });

  factory UpdateLaunchProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLaunchProfileResponse(
      launchProfile: json['launchProfile'] != null
          ? LaunchProfile.fromJson(
              json['launchProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchProfile = this.launchProfile;
    return {
      if (launchProfile != null) 'launchProfile': launchProfile,
    };
  }
}

class UpdateStreamingImageResponse {
  final StreamingImage? streamingImage;

  UpdateStreamingImageResponse({
    this.streamingImage,
  });

  factory UpdateStreamingImageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStreamingImageResponse(
      streamingImage: json['streamingImage'] != null
          ? StreamingImage.fromJson(
              json['streamingImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingImage = this.streamingImage;
    return {
      if (streamingImage != null) 'streamingImage': streamingImage,
    };
  }
}

class UpdateStudioComponentResponse {
  /// Information about the studio component.
  final StudioComponent? studioComponent;

  UpdateStudioComponentResponse({
    this.studioComponent,
  });

  factory UpdateStudioComponentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStudioComponentResponse(
      studioComponent: json['studioComponent'] != null
          ? StudioComponent.fromJson(
              json['studioComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final studioComponent = this.studioComponent;
    return {
      if (studioComponent != null) 'studioComponent': studioComponent,
    };
  }
}

class UpdateStudioResponse {
  /// Information about a studio.
  final Studio studio;

  UpdateStudioResponse({
    required this.studio,
  });

  factory UpdateStudioResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStudioResponse(
      studio: Studio.fromJson(json['studio'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final studio = this.studio;
    return {
      'studio': studio,
    };
  }
}

/// The launch profile validation result.
class ValidationResult {
  /// The current state.
  final LaunchProfileValidationState state;

  /// The status code. This will contain the failure reason if the state is
  /// <code>VALIDATION_FAILED</code>.
  final LaunchProfileValidationStatusCode statusCode;

  /// The status message for the validation result.
  final String statusMessage;

  /// The type of the validation result.
  final LaunchProfileValidationType type;

  ValidationResult({
    required this.state,
    required this.statusCode,
    required this.statusMessage,
    required this.type,
  });

  factory ValidationResult.fromJson(Map<String, dynamic> json) {
    return ValidationResult(
      state: (json['state'] as String).toLaunchProfileValidationState(),
      statusCode:
          (json['statusCode'] as String).toLaunchProfileValidationStatusCode(),
      statusMessage: json['statusMessage'] as String,
      type: (json['type'] as String).toLaunchProfileValidationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      'state': state.toValue(),
      'statusCode': statusCode.toValue(),
      'statusMessage': statusMessage,
      'type': type.toValue(),
    };
  }
}

/// Custom volume configuration for the root volumes that are attached to
/// streaming sessions.
///
/// This parameter is only allowed when <code>sessionPersistenceMode</code> is
/// <code>ACTIVATED</code>.
class VolumeConfiguration {
  /// The number of I/O operations per second for the root volume that is attached
  /// to streaming session.
  final int? iops;

  /// The size of the root volume that is attached to the streaming session. The
  /// root volume size is measured in GiBs.
  final int? size;

  /// The throughput to provision for the root volume that is attached to the
  /// streaming session. The throughput is measured in MiB/s.
  final int? throughput;

  VolumeConfiguration({
    this.iops,
    this.size,
    this.throughput,
  });

  factory VolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return VolumeConfiguration(
      iops: json['iops'] as int?,
      size: json['size'] as int?,
      throughput: json['throughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final size = this.size;
    final throughput = this.throughput;
    return {
      if (iops != null) 'iops': iops,
      if (size != null) 'size': size,
      if (throughput != null) 'throughput': throughput,
    };
  }
}

enum VolumeRetentionMode {
  retain,
  delete,
}

extension VolumeRetentionModeValueExtension on VolumeRetentionMode {
  String toValue() {
    switch (this) {
      case VolumeRetentionMode.retain:
        return 'RETAIN';
      case VolumeRetentionMode.delete:
        return 'DELETE';
    }
  }
}

extension VolumeRetentionModeFromString on String {
  VolumeRetentionMode toVolumeRetentionMode() {
    switch (this) {
      case 'RETAIN':
        return VolumeRetentionMode.retain;
      case 'DELETE':
        return VolumeRetentionMode.delete;
    }
    throw Exception('$this is not known in enum VolumeRetentionMode');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
