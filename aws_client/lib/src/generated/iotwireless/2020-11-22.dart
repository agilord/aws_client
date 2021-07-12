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

/// AWS IoT Wireless API documentation
class IoTWireless {
  final _s.RestJsonProtocol _protocol;
  IoTWireless({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.iotwireless',
            signingName: 'iotwireless',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a partner account with your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [sidewalk] :
  /// The Sidewalk account credentials.
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the specified resource. Tags are metadata that you
  /// can use to manage a resource.
  Future<AssociateAwsAccountWithPartnerAccountResponse>
      associateAwsAccountWithPartnerAccount({
    required SidewalkAccountInfo sidewalk,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(sidewalk, 'sidewalk');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'Sidewalk': sidewalk,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/partner-accounts',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAwsAccountWithPartnerAccountResponse.fromJson(response);
  }

  /// Associates a wireless device with a thing.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to associate with the wireless device.
  Future<void> associateWirelessDeviceWithThing({
    required String id,
    required String thingArn,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingArn, 'thingArn');
    final $payload = <String, dynamic>{
      'ThingArn': thingArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}/thing',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a wireless gateway with a certificate.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  ///
  /// Parameter [iotCertificateId] :
  /// The ID of the certificate to associate with the wireless gateway.
  Future<AssociateWirelessGatewayWithCertificateResponse>
      associateWirelessGatewayWithCertificate({
    required String id,
    required String iotCertificateId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(iotCertificateId, 'iotCertificateId');
    _s.validateStringLength(
      'iotCertificateId',
      iotCertificateId,
      1,
      4096,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'IotCertificateId': iotCertificateId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/certificate',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateWirelessGatewayWithCertificateResponse.fromJson(response);
  }

  /// Associates a wireless gateway with a thing.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to associate with the wireless gateway.
  Future<void> associateWirelessGatewayWithThing({
    required String id,
    required String thingArn,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingArn, 'thingArn');
    final $payload = <String, dynamic>{
      'ThingArn': thingArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/thing',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new destination that maps a device message to an AWS IoT rule.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [expression] :
  /// The rule name or topic rule to send messages to.
  ///
  /// Parameter [expressionType] :
  /// The type of value in <code>Expression</code>.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM Role that authorizes the destination.
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [description] :
  /// The description of the new resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new destination. Tags are metadata that you can
  /// use to manage a resource.
  Future<CreateDestinationResponse> createDestination({
    required String expression,
    required ExpressionType expressionType,
    required String name,
    required String roleArn,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'expression',
      expression,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(expressionType, 'expressionType');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    final $payload = <String, dynamic>{
      'Expression': expression,
      'ExpressionType': expressionType.toValue(),
      'Name': name,
      'RoleArn': roleArn,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/destinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDestinationResponse.fromJson(response);
  }

  /// Creates a new device profile.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [loRaWAN] :
  /// The device profile information to use to create the device profile.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new device profile. Tags are metadata that you
  /// can use to manage a resource.
  Future<CreateDeviceProfileResponse> createDeviceProfile({
    String? clientRequestToken,
    LoRaWANDeviceProfile? loRaWAN,
    String? name,
    List<Tag>? tags,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/device-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeviceProfileResponse.fromJson(response);
  }

  /// Creates a new service profile.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [loRaWAN] :
  /// The service profile information to use to create the service profile.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new service profile. Tags are metadata that you
  /// can use to manage a resource.
  Future<CreateServiceProfileResponse> createServiceProfile({
    String? clientRequestToken,
    LoRaWANServiceProfile? loRaWAN,
    String? name,
    List<Tag>? tags,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/service-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceProfileResponse.fromJson(response);
  }

  /// Provisions a wireless device.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [destinationName] :
  /// The name of the destination to assign to the new wireless device.
  ///
  /// Parameter [type] :
  /// The wireless device type.
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [description] :
  /// The description of the new resource.
  ///
  /// Parameter [loRaWAN] :
  /// The device configuration information to use to create the wireless device.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new wireless device. Tags are metadata that you
  /// can use to manage a resource.
  Future<CreateWirelessDeviceResponse> createWirelessDevice({
    required String destinationName,
    required WirelessDeviceType type,
    String? clientRequestToken,
    String? description,
    LoRaWANDevice? loRaWAN,
    String? name,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'DestinationName': destinationName,
      'Type': type.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless-devices',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWirelessDeviceResponse.fromJson(response);
  }

  /// Provisions a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [loRaWAN] :
  /// The gateway configuration information to use to create the wireless
  /// gateway.
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [description] :
  /// The description of the new resource.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new wireless gateway. Tags are metadata that you
  /// can use to manage a resource.
  Future<CreateWirelessGatewayResponse> createWirelessGateway({
    required LoRaWANGateway loRaWAN,
    String? clientRequestToken,
    String? description,
    String? name,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(loRaWAN, 'loRaWAN');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'LoRaWAN': loRaWAN,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless-gateways',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWirelessGatewayResponse.fromJson(response);
  }

  /// Creates a task for a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  ///
  /// Parameter [wirelessGatewayTaskDefinitionId] :
  /// The ID of the WirelessGatewayTaskDefinition.
  Future<CreateWirelessGatewayTaskResponse> createWirelessGatewayTask({
    required String id,
    required String wirelessGatewayTaskDefinitionId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        wirelessGatewayTaskDefinitionId, 'wirelessGatewayTaskDefinitionId');
    _s.validateStringLength(
      'wirelessGatewayTaskDefinitionId',
      wirelessGatewayTaskDefinitionId,
      0,
      36,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'WirelessGatewayTaskDefinitionId': wirelessGatewayTaskDefinitionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/tasks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWirelessGatewayTaskResponse.fromJson(response);
  }

  /// Creates a gateway task definition.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [autoCreateTasks] :
  /// Whether to automatically create tasks using this task definition for all
  /// gateways with the specified current version. If <code>false</code>, the
  /// task must me created by calling <code>CreateWirelessGatewayTask</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. If you try to
  /// create a new resource with the same token as a resource that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the specified resource. Tags are metadata that you
  /// can use to manage a resource.
  ///
  /// Parameter [update] :
  /// Information about the gateways to update.
  Future<CreateWirelessGatewayTaskDefinitionResponse>
      createWirelessGatewayTaskDefinition({
    required bool autoCreateTasks,
    String? clientRequestToken,
    String? name,
    List<Tag>? tags,
    UpdateWirelessGatewayTaskCreate? update,
  }) async {
    ArgumentError.checkNotNull(autoCreateTasks, 'autoCreateTasks');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'AutoCreateTasks': autoCreateTasks,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
      if (update != null) 'Update': update,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless-gateway-task-definitions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWirelessGatewayTaskDefinitionResponse.fromJson(response);
  }

  /// Deletes a destination.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the resource to delete.
  Future<void> deleteDestination({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a device profile.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to delete.
  Future<void> deleteDeviceProfile({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/device-profiles/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a service profile.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to delete.
  Future<void> deleteServiceProfile({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/service-profiles/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a wireless device.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to delete.
  Future<void> deleteWirelessDevice({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to delete.
  Future<void> deleteWirelessGateway({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a wireless gateway task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to delete.
  Future<void> deleteWirelessGatewayTask({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/tasks',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a wireless gateway task definition. Deleting this task definition
  /// does not affect tasks that are currently in progress.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to delete.
  Future<void> deleteWirelessGatewayTaskDefinition({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/wireless-gateway-task-definitions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates your AWS account from a partner account. If
  /// <code>PartnerAccountId</code> and <code>PartnerType</code> are
  /// <code>null</code>, disassociates your AWS account from all partner
  /// accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [partnerAccountId] :
  /// The partner account ID to disassociate from the AWS account.
  ///
  /// Parameter [partnerType] :
  /// The partner type.
  Future<void> disassociateAwsAccountFromPartnerAccount({
    required String partnerAccountId,
    required PartnerType partnerType,
  }) async {
    ArgumentError.checkNotNull(partnerAccountId, 'partnerAccountId');
    _s.validateStringLength(
      'partnerAccountId',
      partnerAccountId,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partnerType, 'partnerType');
    final $query = <String, List<String>>{
      'partnerType': [partnerType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/partner-accounts/${Uri.encodeComponent(partnerAccountId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a wireless device from its currently associated thing.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  Future<void> disassociateWirelessDeviceFromThing({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}/thing',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a wireless gateway from its currently associated
  /// certificate.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  Future<void> disassociateWirelessGatewayFromCertificate({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/certificate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a wireless gateway from its currently associated thing.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  Future<void> disassociateWirelessGatewayFromThing({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/thing',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about a destination.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The name of the resource to get.
  Future<GetDestinationResponse> getDestination({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDestinationResponse.fromJson(response);
  }

  /// Gets information about a device profile.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to get.
  Future<GetDeviceProfileResponse> getDeviceProfile({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device-profiles/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceProfileResponse.fromJson(response);
  }

  /// Returns current default log-levels, or log levels by resource types, could
  /// be for wireless device log options or wireless gateway log options.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetLogLevelsByResourceTypesResponse>
      getLogLevelsByResourceTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/log-levels',
      exceptionFnMap: _exceptionFns,
    );
    return GetLogLevelsByResourceTypesResponse.fromJson(response);
  }

  /// Gets information about a partner account. If <code>PartnerAccountId</code>
  /// and <code>PartnerType</code> are <code>null</code>, returns all partner
  /// accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [partnerAccountId] :
  /// The partner account ID to disassociate from the AWS account.
  ///
  /// Parameter [partnerType] :
  /// The partner type.
  Future<GetPartnerAccountResponse> getPartnerAccount({
    required String partnerAccountId,
    required PartnerType partnerType,
  }) async {
    ArgumentError.checkNotNull(partnerAccountId, 'partnerAccountId');
    _s.validateStringLength(
      'partnerAccountId',
      partnerAccountId,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partnerType, 'partnerType');
    final $query = <String, List<String>>{
      'partnerType': [partnerType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/partner-accounts/${Uri.encodeComponent(partnerAccountId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPartnerAccountResponse.fromJson(response);
  }

  /// Fetches the log-level override if any for a given resource-ID and
  /// resource-type, coulde be a wireless device or a wireless gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The type of the resource, currently support WirelessDevice and
  /// WirelessGateway.
  Future<GetResourceLogLevelResponse> getResourceLogLevel({
    required String resourceIdentifier,
    required String resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    _s.validateStringLength(
      'resourceIdentifier',
      resourceIdentifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/log-levels/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceLogLevelResponse.fromJson(response);
  }

  /// Gets the account-specific endpoint for Configuration and Update Server
  /// (CUPS) protocol or LoRaWAN Network Server (LNS) connections.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [serviceType] :
  /// The service type for which to get endpoint information about. Can be
  /// <code>CUPS</code> for the Configuration and Update Server endpoint, or
  /// <code>LNS</code> for the LoRaWAN Network Server endpoint.
  Future<GetServiceEndpointResponse> getServiceEndpoint({
    WirelessGatewayServiceType? serviceType,
  }) async {
    final $query = <String, List<String>>{
      if (serviceType != null) 'serviceType': [serviceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/service-endpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceEndpointResponse.fromJson(response);
  }

  /// Gets information about a service profile.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to get.
  Future<GetServiceProfileResponse> getServiceProfile({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/service-profiles/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceProfileResponse.fromJson(response);
  }

  /// Gets information about a wireless device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the wireless device to get.
  ///
  /// Parameter [identifierType] :
  /// The type of identifier used in <code>identifier</code>.
  Future<GetWirelessDeviceResponse> getWirelessDevice({
    required String identifier,
    required WirelessDeviceIdType identifierType,
  }) async {
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identifierType, 'identifierType');
    final $query = <String, List<String>>{
      'identifierType': [identifierType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-devices/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessDeviceResponse.fromJson(response);
  }

  /// Gets operating information about a wireless device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [wirelessDeviceId] :
  /// The ID of the wireless device for which to get the data.
  Future<GetWirelessDeviceStatisticsResponse> getWirelessDeviceStatistics({
    required String wirelessDeviceId,
  }) async {
    ArgumentError.checkNotNull(wirelessDeviceId, 'wirelessDeviceId');
    _s.validateStringLength(
      'wirelessDeviceId',
      wirelessDeviceId,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/wireless-devices/${Uri.encodeComponent(wirelessDeviceId)}/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessDeviceStatisticsResponse.fromJson(response);
  }

  /// Gets information about a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the wireless gateway to get.
  ///
  /// Parameter [identifierType] :
  /// The type of identifier used in <code>identifier</code>.
  Future<GetWirelessGatewayResponse> getWirelessGateway({
    required String identifier,
    required WirelessGatewayIdType identifierType,
  }) async {
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identifierType, 'identifierType');
    final $query = <String, List<String>>{
      'identifierType': [identifierType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessGatewayResponse.fromJson(response);
  }

  /// Gets the ID of the certificate that is currently associated with a
  /// wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to get.
  Future<GetWirelessGatewayCertificateResponse> getWirelessGatewayCertificate({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/certificate',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessGatewayCertificateResponse.fromJson(response);
  }

  /// Gets the firmware version and other information about a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to get.
  Future<GetWirelessGatewayFirmwareInformationResponse>
      getWirelessGatewayFirmwareInformation({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/wireless-gateways/${Uri.encodeComponent(id)}/firmware-information',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessGatewayFirmwareInformationResponse.fromJson(response);
  }

  /// Gets operating information about a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [wirelessGatewayId] :
  /// The ID of the wireless gateway for which to get the data.
  Future<GetWirelessGatewayStatisticsResponse> getWirelessGatewayStatistics({
    required String wirelessGatewayId,
  }) async {
    ArgumentError.checkNotNull(wirelessGatewayId, 'wirelessGatewayId');
    _s.validateStringLength(
      'wirelessGatewayId',
      wirelessGatewayId,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/wireless-gateways/${Uri.encodeComponent(wirelessGatewayId)}/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessGatewayStatisticsResponse.fromJson(response);
  }

  /// Gets information about a wireless gateway task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to get.
  Future<GetWirelessGatewayTaskResponse> getWirelessGatewayTask({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}/tasks',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessGatewayTaskResponse.fromJson(response);
  }

  /// Gets information about a wireless gateway task definition.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to get.
  Future<GetWirelessGatewayTaskDefinitionResponse>
      getWirelessGatewayTaskDefinition({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/wireless-gateway-task-definitions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessGatewayTaskDefinitionResponse.fromJson(response);
  }

  /// Lists the destinations registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListDestinationsResponse> listDestinations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/destinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDestinationsResponse.fromJson(response);
  }

  /// Lists the device profiles registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListDeviceProfilesResponse> listDeviceProfiles({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceProfilesResponse.fromJson(response);
  }

  /// Lists the partner accounts associated with your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListPartnerAccountsResponse> listPartnerAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/partner-accounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPartnerAccountsResponse.fromJson(response);
  }

  /// Lists the service profiles registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListServiceProfilesResponse> listServiceProfiles({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/service-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceProfilesResponse.fromJson(response);
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which you want to list tags.
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
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the wireless devices registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [destinationName] :
  /// A filter to list only the wireless devices that use this destination.
  ///
  /// Parameter [deviceProfileId] :
  /// A filter to list only the wireless devices that use this device profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [serviceProfileId] :
  /// A filter to list only the wireless devices that use this service profile.
  ///
  /// Parameter [wirelessDeviceType] :
  /// A filter to list only the wireless devices that use this wireless device
  /// type.
  Future<ListWirelessDevicesResponse> listWirelessDevices({
    String? destinationName,
    String? deviceProfileId,
    int? maxResults,
    String? nextToken,
    String? serviceProfileId,
    WirelessDeviceType? wirelessDeviceType,
  }) async {
    _s.validateStringLength(
      'destinationName',
      destinationName,
      0,
      128,
    );
    _s.validateStringLength(
      'deviceProfileId',
      deviceProfileId,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    _s.validateStringLength(
      'serviceProfileId',
      serviceProfileId,
      0,
      256,
    );
    final $query = <String, List<String>>{
      if (destinationName != null) 'destinationName': [destinationName],
      if (deviceProfileId != null) 'deviceProfileId': [deviceProfileId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (serviceProfileId != null) 'serviceProfileId': [serviceProfileId],
      if (wirelessDeviceType != null)
        'wirelessDeviceType': [wirelessDeviceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWirelessDevicesResponse.fromJson(response);
  }

  /// List the wireless gateway tasks definitions registered to your AWS
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [taskDefinitionType] :
  /// A filter to list only the wireless gateway task definitions that use this
  /// task definition type.
  Future<ListWirelessGatewayTaskDefinitionsResponse>
      listWirelessGatewayTaskDefinitions({
    int? maxResults,
    String? nextToken,
    WirelessGatewayTaskDefinitionType? taskDefinitionType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (taskDefinitionType != null)
        'taskDefinitionType': [taskDefinitionType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-gateway-task-definitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWirelessGatewayTaskDefinitionsResponse.fromJson(response);
  }

  /// Lists the wireless gateways registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListWirelessGatewaysResponse> listWirelessGateways({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-gateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWirelessGatewaysResponse.fromJson(response);
  }

  /// Sets the log-level override for a resource-ID and resource-type, could be
  /// a wireless gateway or a wireless device.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The type of the resource, currently support WirelessDevice and
  /// WirelessGateway.
  Future<void> putResourceLogLevel({
    required LogLevel logLevel,
    required String resourceIdentifier,
    required String resourceType,
  }) async {
    ArgumentError.checkNotNull(logLevel, 'logLevel');
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    _s.validateStringLength(
      'resourceIdentifier',
      resourceIdentifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      'resourceType': [resourceType],
    };
    final $payload = <String, dynamic>{
      'LogLevel': logLevel.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/log-levels/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove log-level overrides if any for all resources (both wireless devices
  /// and wireless gateways).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> resetAllResourceLogLevels() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/log-levels',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove log-level override if any for a specific resource-ID and
  /// resource-type, could be a wireless device or a wireless gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The type of the resource, currently support WirelessDevice and
  /// WirelessGateway.
  Future<void> resetResourceLogLevel({
    required String resourceIdentifier,
    required String resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    _s.validateStringLength(
      'resourceIdentifier',
      resourceIdentifier,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final $query = <String, List<String>>{
      'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/log-levels/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends a decrypted application data frame to a device.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the wireless device to receive the data.
  ///
  /// Parameter [payloadData] :
  /// The message payload to send.
  ///
  /// Parameter [transmitMode] :
  /// The transmit mode to use to send data to the wireless device. Can be:
  /// <code>0</code> for UM (unacknowledge mode) or <code>1</code> for AM
  /// (acknowledge mode).
  ///
  /// Parameter [wirelessMetadata] :
  /// Metadata about the message request.
  Future<SendDataToWirelessDeviceResponse> sendDataToWirelessDevice({
    required String id,
    required String payloadData,
    required int transmitMode,
    WirelessMetadata? wirelessMetadata,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(payloadData, 'payloadData');
    _s.validateStringLength(
      'payloadData',
      payloadData,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(transmitMode, 'transmitMode');
    _s.validateNumRange(
      'transmitMode',
      transmitMode,
      0,
      1,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'PayloadData': payloadData,
      'TransmitMode': transmitMode,
      if (wirelessMetadata != null) 'WirelessMetadata': wirelessMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}/data',
      exceptionFnMap: _exceptionFns,
    );
    return SendDataToWirelessDeviceResponse.fromJson(response);
  }

  /// Adds a tag to a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// you can use to manage a resource.
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
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Simulates a provisioned device by sending an uplink data payload of
  /// <code>Hello</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the wireless device to test.
  Future<TestWirelessDeviceResponse> testWirelessDevice({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}/test',
      exceptionFnMap: _exceptionFns,
    );
    return TestWirelessDeviceResponse.fromJson(response);
  }

  /// Removes one or more tags from a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags to remove from the resource.
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
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties of a destination.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The new name of the resource.
  ///
  /// Parameter [description] :
  /// A new description of the resource.
  ///
  /// Parameter [expression] :
  /// The new rule name or topic rule to send messages to.
  ///
  /// Parameter [expressionType] :
  /// The type of value in <code>Expression</code>.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM Role that authorizes the destination.
  Future<void> updateDestination({
    required String name,
    String? description,
    String? expression,
    ExpressionType? expressionType,
    String? roleArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'expression',
      expression,
      0,
      2048,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (expression != null) 'Expression': expression,
      if (expressionType != null) 'ExpressionType': expressionType.toValue(),
      if (roleArn != null) 'RoleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Set default log level, or log levels by resource types, could be for
  /// wireless device log options or wireless gateways log options. This is to
  /// control the log messages that will be displayed in CloudWatch.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> updateLogLevelsByResourceTypes({
    LogLevel? defaultLogLevel,
    List<WirelessDeviceLogOption>? wirelessDeviceLogOptions,
    List<WirelessGatewayLogOption>? wirelessGatewayLogOptions,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultLogLevel != null) 'DefaultLogLevel': defaultLogLevel.toValue(),
      if (wirelessDeviceLogOptions != null)
        'WirelessDeviceLogOptions': wirelessDeviceLogOptions,
      if (wirelessGatewayLogOptions != null)
        'WirelessGatewayLogOptions': wirelessGatewayLogOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/log-levels',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties of a partner account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [partnerAccountId] :
  /// The ID of the partner account to update.
  ///
  /// Parameter [partnerType] :
  /// The partner type.
  ///
  /// Parameter [sidewalk] :
  /// The Sidewalk account credentials.
  Future<void> updatePartnerAccount({
    required String partnerAccountId,
    required PartnerType partnerType,
    required SidewalkUpdateAccount sidewalk,
  }) async {
    ArgumentError.checkNotNull(partnerAccountId, 'partnerAccountId');
    _s.validateStringLength(
      'partnerAccountId',
      partnerAccountId,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partnerType, 'partnerType');
    ArgumentError.checkNotNull(sidewalk, 'sidewalk');
    final $query = <String, List<String>>{
      'partnerType': [partnerType.toValue()],
    };
    final $payload = <String, dynamic>{
      'Sidewalk': sidewalk,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/partner-accounts/${Uri.encodeComponent(partnerAccountId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties of a wireless device.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  ///
  /// Parameter [description] :
  /// A new description of the resource.
  ///
  /// Parameter [destinationName] :
  /// The name of the new destination for the device.
  ///
  /// Parameter [loRaWAN] :
  /// The updated wireless device's configuration.
  ///
  /// Parameter [name] :
  /// The new name of the resource.
  Future<void> updateWirelessDevice({
    required String id,
    String? description,
    String? destinationName,
    LoRaWANUpdateDevice? loRaWAN,
    String? name,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'destinationName',
      destinationName,
      0,
      128,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (destinationName != null) 'DestinationName': destinationName,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties of a wireless gateway.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the resource to update.
  ///
  /// Parameter [description] :
  /// A new description of the resource.
  ///
  /// Parameter [name] :
  /// The new name of the resource.
  Future<void> updateWirelessGateway({
    required String id,
    String? description,
    List<List<String>>? joinEuiFilters,
    String? name,
    List<String>? netIdFilters,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (joinEuiFilters != null) 'JoinEuiFilters': joinEuiFilters,
      if (name != null) 'Name': name,
      if (netIdFilters != null) 'NetIdFilters': netIdFilters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// ABP device object for LoRaWAN specification v1.0.x
class AbpV1_0_x {
  /// The DevAddr value.
  final String? devAddr;

  /// Session keys for ABP v1.0.x
  final SessionKeysAbpV1_0_x? sessionKeys;

  AbpV1_0_x({
    this.devAddr,
    this.sessionKeys,
  });

  factory AbpV1_0_x.fromJson(Map<String, dynamic> json) {
    return AbpV1_0_x(
      devAddr: json['DevAddr'] as String?,
      sessionKeys: json['SessionKeys'] != null
          ? SessionKeysAbpV1_0_x.fromJson(
              json['SessionKeys'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devAddr = this.devAddr;
    final sessionKeys = this.sessionKeys;
    return {
      if (devAddr != null) 'DevAddr': devAddr,
      if (sessionKeys != null) 'SessionKeys': sessionKeys,
    };
  }
}

/// ABP device object for LoRaWAN specification v1.1
class AbpV1_1 {
  /// The DevAddr value.
  final String? devAddr;

  /// Session keys for ABP v1.1
  final SessionKeysAbpV1_1? sessionKeys;

  AbpV1_1({
    this.devAddr,
    this.sessionKeys,
  });

  factory AbpV1_1.fromJson(Map<String, dynamic> json) {
    return AbpV1_1(
      devAddr: json['DevAddr'] as String?,
      sessionKeys: json['SessionKeys'] != null
          ? SessionKeysAbpV1_1.fromJson(
              json['SessionKeys'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devAddr = this.devAddr;
    final sessionKeys = this.sessionKeys;
    return {
      if (devAddr != null) 'DevAddr': devAddr,
      if (sessionKeys != null) 'SessionKeys': sessionKeys,
    };
  }
}

class AssociateAwsAccountWithPartnerAccountResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The Sidewalk account credentials.
  final SidewalkAccountInfo? sidewalk;

  AssociateAwsAccountWithPartnerAccountResponse({
    this.arn,
    this.sidewalk,
  });

  factory AssociateAwsAccountWithPartnerAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateAwsAccountWithPartnerAccountResponse(
      arn: json['Arn'] as String?,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkAccountInfo.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final sidewalk = this.sidewalk;
    return {
      if (arn != null) 'Arn': arn,
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

class AssociateWirelessDeviceWithThingResponse {
  AssociateWirelessDeviceWithThingResponse();

  factory AssociateWirelessDeviceWithThingResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateWirelessDeviceWithThingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateWirelessGatewayWithCertificateResponse {
  /// The ID of the certificate associated with the wireless gateway.
  final String? iotCertificateId;

  AssociateWirelessGatewayWithCertificateResponse({
    this.iotCertificateId,
  });

  factory AssociateWirelessGatewayWithCertificateResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateWirelessGatewayWithCertificateResponse(
      iotCertificateId: json['IotCertificateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iotCertificateId = this.iotCertificateId;
    return {
      if (iotCertificateId != null) 'IotCertificateId': iotCertificateId,
    };
  }
}

class AssociateWirelessGatewayWithThingResponse {
  AssociateWirelessGatewayWithThingResponse();

  factory AssociateWirelessGatewayWithThingResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateWirelessGatewayWithThingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Sidewalk device battery level.
enum BatteryLevel {
  normal,
  low,
  critical,
}

extension on BatteryLevel {
  String toValue() {
    switch (this) {
      case BatteryLevel.normal:
        return 'normal';
      case BatteryLevel.low:
        return 'low';
      case BatteryLevel.critical:
        return 'critical';
    }
  }
}

extension on String {
  BatteryLevel toBatteryLevel() {
    switch (this) {
      case 'normal':
        return BatteryLevel.normal;
      case 'low':
        return BatteryLevel.low;
      case 'critical':
        return BatteryLevel.critical;
    }
    throw Exception('$this is not known in enum BatteryLevel');
  }
}

/// List of sidewalk certificates.
class CertificateList {
  /// The certificate chain algorithm provided by sidewalk.
  final SigningAlg signingAlg;

  /// The value of the chosen sidewalk certificate.
  final String value;

  CertificateList({
    required this.signingAlg,
    required this.value,
  });

  factory CertificateList.fromJson(Map<String, dynamic> json) {
    return CertificateList(
      signingAlg: (json['SigningAlg'] as String).toSigningAlg(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final signingAlg = this.signingAlg;
    final value = this.value;
    return {
      'SigningAlg': signingAlg.toValue(),
      'Value': value,
    };
  }
}

enum ConnectionStatus {
  connected,
  disconnected,
}

extension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.connected:
        return 'Connected';
      case ConnectionStatus.disconnected:
        return 'Disconnected';
    }
  }
}

extension on String {
  ConnectionStatus toConnectionStatus() {
    switch (this) {
      case 'Connected':
        return ConnectionStatus.connected;
      case 'Disconnected':
        return ConnectionStatus.disconnected;
    }
    throw Exception('$this is not known in enum ConnectionStatus');
  }
}

class CreateDestinationResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;

  /// The name of the new resource.
  final String? name;

  CreateDestinationResponse({
    this.arn,
    this.name,
  });

  factory CreateDestinationResponse.fromJson(Map<String, dynamic> json) {
    return CreateDestinationResponse(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

class CreateDeviceProfileResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;

  /// The ID of the new device profile.
  final String? id;

  CreateDeviceProfileResponse({
    this.arn,
    this.id,
  });

  factory CreateDeviceProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeviceProfileResponse(
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

class CreateServiceProfileResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;

  /// The ID of the new service profile.
  final String? id;

  CreateServiceProfileResponse({
    this.arn,
    this.id,
  });

  factory CreateServiceProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceProfileResponse(
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

class CreateWirelessDeviceResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;

  /// The ID of the new wireless device.
  final String? id;

  CreateWirelessDeviceResponse({
    this.arn,
    this.id,
  });

  factory CreateWirelessDeviceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWirelessDeviceResponse(
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

class CreateWirelessGatewayResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;

  /// The ID of the new wireless gateway.
  final String? id;

  CreateWirelessGatewayResponse({
    this.arn,
    this.id,
  });

  factory CreateWirelessGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateWirelessGatewayResponse(
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

class CreateWirelessGatewayTaskDefinitionResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The ID of the new wireless gateway task definition.
  final String? id;

  CreateWirelessGatewayTaskDefinitionResponse({
    this.arn,
    this.id,
  });

  factory CreateWirelessGatewayTaskDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWirelessGatewayTaskDefinitionResponse(
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

class CreateWirelessGatewayTaskResponse {
  /// The status of the request.
  final WirelessGatewayTaskStatus? status;

  /// The ID of the WirelessGatewayTaskDefinition.
  final String? wirelessGatewayTaskDefinitionId;

  CreateWirelessGatewayTaskResponse({
    this.status,
    this.wirelessGatewayTaskDefinitionId,
  });

  factory CreateWirelessGatewayTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWirelessGatewayTaskResponse(
      status: (json['Status'] as String?)?.toWirelessGatewayTaskStatus(),
      wirelessGatewayTaskDefinitionId:
          json['WirelessGatewayTaskDefinitionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final wirelessGatewayTaskDefinitionId =
        this.wirelessGatewayTaskDefinitionId;
    return {
      if (status != null) 'Status': status.toValue(),
      if (wirelessGatewayTaskDefinitionId != null)
        'WirelessGatewayTaskDefinitionId': wirelessGatewayTaskDefinitionId,
    };
  }
}

class DeleteDestinationResponse {
  DeleteDestinationResponse();

  factory DeleteDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDeviceProfileResponse {
  DeleteDeviceProfileResponse();

  factory DeleteDeviceProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDeviceProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteServiceProfileResponse {
  DeleteServiceProfileResponse();

  factory DeleteServiceProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteServiceProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWirelessDeviceResponse {
  DeleteWirelessDeviceResponse();

  factory DeleteWirelessDeviceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWirelessDeviceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWirelessGatewayResponse {
  DeleteWirelessGatewayResponse();

  factory DeleteWirelessGatewayResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWirelessGatewayResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWirelessGatewayTaskDefinitionResponse {
  DeleteWirelessGatewayTaskDefinitionResponse();

  factory DeleteWirelessGatewayTaskDefinitionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteWirelessGatewayTaskDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWirelessGatewayTaskResponse {
  DeleteWirelessGatewayTaskResponse();

  factory DeleteWirelessGatewayTaskResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWirelessGatewayTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes a destination.
class Destinations {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The description of the resource.
  final String? description;

  /// The rule name or topic rule to send messages to.
  final String? expression;

  /// The type of value in <code>Expression</code>.
  final ExpressionType? expressionType;

  /// The name of the resource.
  final String? name;

  /// The ARN of the IAM Role that authorizes the destination.
  final String? roleArn;

  Destinations({
    this.arn,
    this.description,
    this.expression,
    this.expressionType,
    this.name,
    this.roleArn,
  });

  factory Destinations.fromJson(Map<String, dynamic> json) {
    return Destinations(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      expression: json['Expression'] as String?,
      expressionType: (json['ExpressionType'] as String?)?.toExpressionType(),
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final expression = this.expression;
    final expressionType = this.expressionType;
    final name = this.name;
    final roleArn = this.roleArn;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (expression != null) 'Expression': expression,
      if (expressionType != null) 'ExpressionType': expressionType.toValue(),
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Describes a device profile.
class DeviceProfile {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The ID of the device profile.
  final String? id;

  /// The name of the resource.
  final String? name;

  DeviceProfile({
    this.arn,
    this.id,
    this.name,
  });

  factory DeviceProfile.fromJson(Map<String, dynamic> json) {
    return DeviceProfile(
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

/// Device state defines the device status of sidewalk device.
enum DeviceState {
  provisioned,
  registeredNotSeen,
  registeredReachable,
  registeredUnreachable,
}

extension on DeviceState {
  String toValue() {
    switch (this) {
      case DeviceState.provisioned:
        return 'Provisioned';
      case DeviceState.registeredNotSeen:
        return 'RegisteredNotSeen';
      case DeviceState.registeredReachable:
        return 'RegisteredReachable';
      case DeviceState.registeredUnreachable:
        return 'RegisteredUnreachable';
    }
  }
}

extension on String {
  DeviceState toDeviceState() {
    switch (this) {
      case 'Provisioned':
        return DeviceState.provisioned;
      case 'RegisteredNotSeen':
        return DeviceState.registeredNotSeen;
      case 'RegisteredReachable':
        return DeviceState.registeredReachable;
      case 'RegisteredUnreachable':
        return DeviceState.registeredUnreachable;
    }
    throw Exception('$this is not known in enum DeviceState');
  }
}

class DisassociateAwsAccountFromPartnerAccountResponse {
  DisassociateAwsAccountFromPartnerAccountResponse();

  factory DisassociateAwsAccountFromPartnerAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateAwsAccountFromPartnerAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateWirelessDeviceFromThingResponse {
  DisassociateWirelessDeviceFromThingResponse();

  factory DisassociateWirelessDeviceFromThingResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWirelessDeviceFromThingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateWirelessGatewayFromCertificateResponse {
  DisassociateWirelessGatewayFromCertificateResponse();

  factory DisassociateWirelessGatewayFromCertificateResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWirelessGatewayFromCertificateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateWirelessGatewayFromThingResponse {
  DisassociateWirelessGatewayFromThingResponse();

  factory DisassociateWirelessGatewayFromThingResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWirelessGatewayFromThingResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Sidewalk device status notification.
enum Event {
  discovered,
  lost,
  ack,
  nack,
  passthrough,
}

extension on Event {
  String toValue() {
    switch (this) {
      case Event.discovered:
        return 'discovered';
      case Event.lost:
        return 'lost';
      case Event.ack:
        return 'ack';
      case Event.nack:
        return 'nack';
      case Event.passthrough:
        return 'passthrough';
    }
  }
}

extension on String {
  Event toEvent() {
    switch (this) {
      case 'discovered':
        return Event.discovered;
      case 'lost':
        return Event.lost;
      case 'ack':
        return Event.ack;
      case 'nack':
        return Event.nack;
      case 'passthrough':
        return Event.passthrough;
    }
    throw Exception('$this is not known in enum Event');
  }
}

enum ExpressionType {
  ruleName,
  mqttTopic,
}

extension on ExpressionType {
  String toValue() {
    switch (this) {
      case ExpressionType.ruleName:
        return 'RuleName';
      case ExpressionType.mqttTopic:
        return 'MqttTopic';
    }
  }
}

extension on String {
  ExpressionType toExpressionType() {
    switch (this) {
      case 'RuleName':
        return ExpressionType.ruleName;
      case 'MqttTopic':
        return ExpressionType.mqttTopic;
    }
    throw Exception('$this is not known in enum ExpressionType');
  }
}

class GetDestinationResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The description of the resource.
  final String? description;

  /// The rule name or topic rule to send messages to.
  final String? expression;

  /// The type of value in <code>Expression</code>.
  final ExpressionType? expressionType;

  /// The name of the resource.
  final String? name;

  /// The ARN of the IAM Role that authorizes the destination.
  final String? roleArn;

  GetDestinationResponse({
    this.arn,
    this.description,
    this.expression,
    this.expressionType,
    this.name,
    this.roleArn,
  });

  factory GetDestinationResponse.fromJson(Map<String, dynamic> json) {
    return GetDestinationResponse(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      expression: json['Expression'] as String?,
      expressionType: (json['ExpressionType'] as String?)?.toExpressionType(),
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final expression = this.expression;
    final expressionType = this.expressionType;
    final name = this.name;
    final roleArn = this.roleArn;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (expression != null) 'Expression': expression,
      if (expressionType != null) 'ExpressionType': expressionType.toValue(),
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

class GetDeviceProfileResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The ID of the device profile.
  final String? id;

  /// Information about the device profile.
  final LoRaWANDeviceProfile? loRaWAN;

  /// The name of the resource.
  final String? name;

  GetDeviceProfileResponse({
    this.arn,
    this.id,
    this.loRaWAN,
    this.name,
  });

  factory GetDeviceProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceProfileResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANDeviceProfile.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
    };
  }
}

class GetLogLevelsByResourceTypesResponse {
  final LogLevel? defaultLogLevel;
  final List<WirelessDeviceLogOption>? wirelessDeviceLogOptions;
  final List<WirelessGatewayLogOption>? wirelessGatewayLogOptions;

  GetLogLevelsByResourceTypesResponse({
    this.defaultLogLevel,
    this.wirelessDeviceLogOptions,
    this.wirelessGatewayLogOptions,
  });

  factory GetLogLevelsByResourceTypesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLogLevelsByResourceTypesResponse(
      defaultLogLevel: (json['DefaultLogLevel'] as String?)?.toLogLevel(),
      wirelessDeviceLogOptions: (json['WirelessDeviceLogOptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WirelessDeviceLogOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      wirelessGatewayLogOptions: (json['WirelessGatewayLogOptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WirelessGatewayLogOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultLogLevel = this.defaultLogLevel;
    final wirelessDeviceLogOptions = this.wirelessDeviceLogOptions;
    final wirelessGatewayLogOptions = this.wirelessGatewayLogOptions;
    return {
      if (defaultLogLevel != null) 'DefaultLogLevel': defaultLogLevel.toValue(),
      if (wirelessDeviceLogOptions != null)
        'WirelessDeviceLogOptions': wirelessDeviceLogOptions,
      if (wirelessGatewayLogOptions != null)
        'WirelessGatewayLogOptions': wirelessGatewayLogOptions,
    };
  }
}

class GetPartnerAccountResponse {
  /// Whether the partner account is linked to the AWS account.
  final bool? accountLinked;

  /// The Sidewalk account credentials.
  final SidewalkAccountInfoWithFingerprint? sidewalk;

  GetPartnerAccountResponse({
    this.accountLinked,
    this.sidewalk,
  });

  factory GetPartnerAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetPartnerAccountResponse(
      accountLinked: json['AccountLinked'] as bool?,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkAccountInfoWithFingerprint.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLinked = this.accountLinked;
    final sidewalk = this.sidewalk;
    return {
      if (accountLinked != null) 'AccountLinked': accountLinked,
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

class GetResourceLogLevelResponse {
  final LogLevel? logLevel;

  GetResourceLogLevelResponse({
    this.logLevel,
  });

  factory GetResourceLogLevelResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceLogLevelResponse(
      logLevel: (json['LogLevel'] as String?)?.toLogLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    return {
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
    };
  }
}

class GetServiceEndpointResponse {
  /// The Root CA of the server trust certificate.
  final String? serverTrust;

  /// The service endpoint value.
  final String? serviceEndpoint;

  /// The endpoint's service type.
  final WirelessGatewayServiceType? serviceType;

  GetServiceEndpointResponse({
    this.serverTrust,
    this.serviceEndpoint,
    this.serviceType,
  });

  factory GetServiceEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceEndpointResponse(
      serverTrust: json['ServerTrust'] as String?,
      serviceEndpoint: json['ServiceEndpoint'] as String?,
      serviceType:
          (json['ServiceType'] as String?)?.toWirelessGatewayServiceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverTrust = this.serverTrust;
    final serviceEndpoint = this.serviceEndpoint;
    final serviceType = this.serviceType;
    return {
      if (serverTrust != null) 'ServerTrust': serverTrust,
      if (serviceEndpoint != null) 'ServiceEndpoint': serviceEndpoint,
      if (serviceType != null) 'ServiceType': serviceType.toValue(),
    };
  }
}

class GetServiceProfileResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The ID of the service profile.
  final String? id;

  /// Information about the service profile.
  final LoRaWANGetServiceProfileInfo? loRaWAN;

  /// The name of the resource.
  final String? name;

  GetServiceProfileResponse({
    this.arn,
    this.id,
    this.loRaWAN,
    this.name,
  });

  factory GetServiceProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceProfileResponse(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANGetServiceProfileInfo.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
    };
  }
}

class GetWirelessDeviceResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The description of the resource.
  final String? description;

  /// The name of the destination to which the device is assigned.
  final String? destinationName;

  /// The ID of the wireless device.
  final String? id;

  /// Information about the wireless device.
  final LoRaWANDevice? loRaWAN;

  /// The name of the resource.
  final String? name;

  /// Sidewalk device object.
  final SidewalkDevice? sidewalk;

  /// The ARN of the thing associated with the wireless device.
  final String? thingArn;

  /// The name of the thing associated with the wireless device. The value is
  /// empty if a thing isn't associated with the device.
  final String? thingName;

  /// The wireless device type.
  final WirelessDeviceType? type;

  GetWirelessDeviceResponse({
    this.arn,
    this.description,
    this.destinationName,
    this.id,
    this.loRaWAN,
    this.name,
    this.sidewalk,
    this.thingArn,
    this.thingName,
    this.type,
  });

  factory GetWirelessDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetWirelessDeviceResponse(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      destinationName: json['DestinationName'] as String?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANDevice.fromJson(json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkDevice.fromJson(json['Sidewalk'] as Map<String, dynamic>)
          : null,
      thingArn: json['ThingArn'] as String?,
      thingName: json['ThingName'] as String?,
      type: (json['Type'] as String?)?.toWirelessDeviceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final destinationName = this.destinationName;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    final sidewalk = this.sidewalk;
    final thingArn = this.thingArn;
    final thingName = this.thingName;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (destinationName != null) 'DestinationName': destinationName,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (thingArn != null) 'ThingArn': thingArn,
      if (thingName != null) 'ThingName': thingName,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class GetWirelessDeviceStatisticsResponse {
  /// The date and time when the most recent uplink was received.
  final String? lastUplinkReceivedAt;

  /// Information about the wireless device's operations.
  final LoRaWANDeviceMetadata? loRaWAN;

  /// MetaData for Sidewalk device.
  final SidewalkDeviceMetadata? sidewalk;

  /// The ID of the wireless device.
  final String? wirelessDeviceId;

  GetWirelessDeviceStatisticsResponse({
    this.lastUplinkReceivedAt,
    this.loRaWAN,
    this.sidewalk,
    this.wirelessDeviceId,
  });

  factory GetWirelessDeviceStatisticsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWirelessDeviceStatisticsResponse(
      lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANDeviceMetadata.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkDeviceMetadata.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      wirelessDeviceId: json['WirelessDeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUplinkReceivedAt = this.lastUplinkReceivedAt;
    final loRaWAN = this.loRaWAN;
    final sidewalk = this.sidewalk;
    final wirelessDeviceId = this.wirelessDeviceId;
    return {
      if (lastUplinkReceivedAt != null)
        'LastUplinkReceivedAt': lastUplinkReceivedAt,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (wirelessDeviceId != null) 'WirelessDeviceId': wirelessDeviceId,
    };
  }
}

class GetWirelessGatewayCertificateResponse {
  /// The ID of the certificate associated with the wireless gateway.
  final String? iotCertificateId;

  /// The ID of the certificate that is associated with the wireless gateway and
  /// used for the LoRaWANNetworkServer endpoint.
  final String? loRaWANNetworkServerCertificateId;

  GetWirelessGatewayCertificateResponse({
    this.iotCertificateId,
    this.loRaWANNetworkServerCertificateId,
  });

  factory GetWirelessGatewayCertificateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWirelessGatewayCertificateResponse(
      iotCertificateId: json['IotCertificateId'] as String?,
      loRaWANNetworkServerCertificateId:
          json['LoRaWANNetworkServerCertificateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iotCertificateId = this.iotCertificateId;
    final loRaWANNetworkServerCertificateId =
        this.loRaWANNetworkServerCertificateId;
    return {
      if (iotCertificateId != null) 'IotCertificateId': iotCertificateId,
      if (loRaWANNetworkServerCertificateId != null)
        'LoRaWANNetworkServerCertificateId': loRaWANNetworkServerCertificateId,
    };
  }
}

class GetWirelessGatewayFirmwareInformationResponse {
  /// Information about the wireless gateway's firmware.
  final LoRaWANGatewayCurrentVersion? loRaWAN;

  GetWirelessGatewayFirmwareInformationResponse({
    this.loRaWAN,
  });

  factory GetWirelessGatewayFirmwareInformationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWirelessGatewayFirmwareInformationResponse(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANGatewayCurrentVersion.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
    };
  }
}

class GetWirelessGatewayResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The description of the resource.
  final String? description;

  /// The ID of the wireless gateway.
  final String? id;

  /// Information about the wireless gateway.
  final LoRaWANGateway? loRaWAN;

  /// The name of the resource.
  final String? name;

  /// The ARN of the thing associated with the wireless gateway.
  final String? thingArn;

  /// The name of the thing associated with the wireless gateway. The value is
  /// empty if a thing isn't associated with the gateway.
  final String? thingName;

  GetWirelessGatewayResponse({
    this.arn,
    this.description,
    this.id,
    this.loRaWAN,
    this.name,
    this.thingArn,
    this.thingName,
  });

  factory GetWirelessGatewayResponse.fromJson(Map<String, dynamic> json) {
    return GetWirelessGatewayResponse(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANGateway.fromJson(json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      thingArn: json['ThingArn'] as String?,
      thingName: json['ThingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    final thingArn = this.thingArn;
    final thingName = this.thingName;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (thingArn != null) 'ThingArn': thingArn,
      if (thingName != null) 'ThingName': thingName,
    };
  }
}

class GetWirelessGatewayStatisticsResponse {
  /// The connection status of the wireless gateway.
  final ConnectionStatus? connectionStatus;

  /// The date and time when the most recent uplink was received.
  final String? lastUplinkReceivedAt;

  /// The ID of the wireless gateway.
  final String? wirelessGatewayId;

  GetWirelessGatewayStatisticsResponse({
    this.connectionStatus,
    this.lastUplinkReceivedAt,
    this.wirelessGatewayId,
  });

  factory GetWirelessGatewayStatisticsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWirelessGatewayStatisticsResponse(
      connectionStatus:
          (json['ConnectionStatus'] as String?)?.toConnectionStatus(),
      lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String?,
      wirelessGatewayId: json['WirelessGatewayId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final lastUplinkReceivedAt = this.lastUplinkReceivedAt;
    final wirelessGatewayId = this.wirelessGatewayId;
    return {
      if (connectionStatus != null)
        'ConnectionStatus': connectionStatus.toValue(),
      if (lastUplinkReceivedAt != null)
        'LastUplinkReceivedAt': lastUplinkReceivedAt,
      if (wirelessGatewayId != null) 'WirelessGatewayId': wirelessGatewayId,
    };
  }
}

class GetWirelessGatewayTaskDefinitionResponse {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// Whether to automatically create tasks using this task definition for all
  /// gateways with the specified current version. If <code>false</code>, the task
  /// must me created by calling <code>CreateWirelessGatewayTask</code>.
  final bool? autoCreateTasks;

  /// The name of the resource.
  final String? name;

  /// Information about the gateways to update.
  final UpdateWirelessGatewayTaskCreate? update;

  GetWirelessGatewayTaskDefinitionResponse({
    this.arn,
    this.autoCreateTasks,
    this.name,
    this.update,
  });

  factory GetWirelessGatewayTaskDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWirelessGatewayTaskDefinitionResponse(
      arn: json['Arn'] as String?,
      autoCreateTasks: json['AutoCreateTasks'] as bool?,
      name: json['Name'] as String?,
      update: json['Update'] != null
          ? UpdateWirelessGatewayTaskCreate.fromJson(
              json['Update'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final autoCreateTasks = this.autoCreateTasks;
    final name = this.name;
    final update = this.update;
    return {
      if (arn != null) 'Arn': arn,
      if (autoCreateTasks != null) 'AutoCreateTasks': autoCreateTasks,
      if (name != null) 'Name': name,
      if (update != null) 'Update': update,
    };
  }
}

class GetWirelessGatewayTaskResponse {
  /// The date and time when the most recent uplink was received.
  final String? lastUplinkReceivedAt;

  /// The status of the request.
  final WirelessGatewayTaskStatus? status;

  /// The date and time when the task was created.
  final String? taskCreatedAt;

  /// The ID of the wireless gateway.
  final String? wirelessGatewayId;

  /// The ID of the WirelessGatewayTask.
  final String? wirelessGatewayTaskDefinitionId;

  GetWirelessGatewayTaskResponse({
    this.lastUplinkReceivedAt,
    this.status,
    this.taskCreatedAt,
    this.wirelessGatewayId,
    this.wirelessGatewayTaskDefinitionId,
  });

  factory GetWirelessGatewayTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetWirelessGatewayTaskResponse(
      lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String?,
      status: (json['Status'] as String?)?.toWirelessGatewayTaskStatus(),
      taskCreatedAt: json['TaskCreatedAt'] as String?,
      wirelessGatewayId: json['WirelessGatewayId'] as String?,
      wirelessGatewayTaskDefinitionId:
          json['WirelessGatewayTaskDefinitionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUplinkReceivedAt = this.lastUplinkReceivedAt;
    final status = this.status;
    final taskCreatedAt = this.taskCreatedAt;
    final wirelessGatewayId = this.wirelessGatewayId;
    final wirelessGatewayTaskDefinitionId =
        this.wirelessGatewayTaskDefinitionId;
    return {
      if (lastUplinkReceivedAt != null)
        'LastUplinkReceivedAt': lastUplinkReceivedAt,
      if (status != null) 'Status': status.toValue(),
      if (taskCreatedAt != null) 'TaskCreatedAt': taskCreatedAt,
      if (wirelessGatewayId != null) 'WirelessGatewayId': wirelessGatewayId,
      if (wirelessGatewayTaskDefinitionId != null)
        'WirelessGatewayTaskDefinitionId': wirelessGatewayTaskDefinitionId,
    };
  }
}

class ListDestinationsResponse {
  /// The list of destinations.
  final List<Destinations>? destinationList;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  ListDestinationsResponse({
    this.destinationList,
    this.nextToken,
  });

  factory ListDestinationsResponse.fromJson(Map<String, dynamic> json) {
    return ListDestinationsResponse(
      destinationList: (json['DestinationList'] as List?)
          ?.whereNotNull()
          .map((e) => Destinations.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationList = this.destinationList;
    final nextToken = this.nextToken;
    return {
      if (destinationList != null) 'DestinationList': destinationList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDeviceProfilesResponse {
  /// The list of device profiles.
  final List<DeviceProfile>? deviceProfileList;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  ListDeviceProfilesResponse({
    this.deviceProfileList,
    this.nextToken,
  });

  factory ListDeviceProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListDeviceProfilesResponse(
      deviceProfileList: (json['DeviceProfileList'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceProfileList = this.deviceProfileList;
    final nextToken = this.nextToken;
    return {
      if (deviceProfileList != null) 'DeviceProfileList': deviceProfileList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPartnerAccountsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The Sidewalk account credentials.
  final List<SidewalkAccountInfoWithFingerprint>? sidewalk;

  ListPartnerAccountsResponse({
    this.nextToken,
    this.sidewalk,
  });

  factory ListPartnerAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListPartnerAccountsResponse(
      nextToken: json['NextToken'] as String?,
      sidewalk: (json['Sidewalk'] as List?)
          ?.whereNotNull()
          .map((e) => SidewalkAccountInfoWithFingerprint.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sidewalk = this.sidewalk;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

class ListServiceProfilesResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The list of service profiles.
  final List<ServiceProfile>? serviceProfileList;

  ListServiceProfilesResponse({
    this.nextToken,
    this.serviceProfileList,
  });

  factory ListServiceProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListServiceProfilesResponse(
      nextToken: json['NextToken'] as String?,
      serviceProfileList: (json['ServiceProfileList'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceProfileList = this.serviceProfileList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serviceProfileList != null) 'ServiceProfileList': serviceProfileList,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags to attach to the specified resource. Tags are metadata that you can
  /// use to manage a resource.
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

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListWirelessDevicesResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The ID of the wireless device.
  final List<WirelessDeviceStatistics>? wirelessDeviceList;

  ListWirelessDevicesResponse({
    this.nextToken,
    this.wirelessDeviceList,
  });

  factory ListWirelessDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListWirelessDevicesResponse(
      nextToken: json['NextToken'] as String?,
      wirelessDeviceList: (json['WirelessDeviceList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WirelessDeviceStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final wirelessDeviceList = this.wirelessDeviceList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (wirelessDeviceList != null) 'WirelessDeviceList': wirelessDeviceList,
    };
  }
}

class ListWirelessGatewayTaskDefinitionsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The list of task definitions.
  final List<UpdateWirelessGatewayTaskEntry>? taskDefinitions;

  ListWirelessGatewayTaskDefinitionsResponse({
    this.nextToken,
    this.taskDefinitions,
  });

  factory ListWirelessGatewayTaskDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWirelessGatewayTaskDefinitionsResponse(
      nextToken: json['NextToken'] as String?,
      taskDefinitions: (json['TaskDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => UpdateWirelessGatewayTaskEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskDefinitions = this.taskDefinitions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (taskDefinitions != null) 'TaskDefinitions': taskDefinitions,
    };
  }
}

class ListWirelessGatewaysResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// The ID of the wireless gateway.
  final List<WirelessGatewayStatistics>? wirelessGatewayList;

  ListWirelessGatewaysResponse({
    this.nextToken,
    this.wirelessGatewayList,
  });

  factory ListWirelessGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListWirelessGatewaysResponse(
      nextToken: json['NextToken'] as String?,
      wirelessGatewayList: (json['WirelessGatewayList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WirelessGatewayStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final wirelessGatewayList = this.wirelessGatewayList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (wirelessGatewayList != null)
        'WirelessGatewayList': wirelessGatewayList,
    };
  }
}

/// LoRaWAN object for create functions.
class LoRaWANDevice {
  /// LoRaWAN object for create APIs
  final AbpV1_0_x? abpV1_0X;

  /// ABP device object for create APIs for v1.1
  final AbpV1_1? abpV1_1;

  /// The DevEUI value.
  final String? devEui;

  /// The ID of the device profile for the new wireless device.
  final String? deviceProfileId;

  /// OTAA device object for create APIs for v1.0.x
  final OtaaV1_0_x? otaaV1_0X;

  /// OTAA device object for v1.1 for create APIs
  final OtaaV1_1? otaaV1_1;

  /// The ID of the service profile.
  final String? serviceProfileId;

  LoRaWANDevice({
    this.abpV1_0X,
    this.abpV1_1,
    this.devEui,
    this.deviceProfileId,
    this.otaaV1_0X,
    this.otaaV1_1,
    this.serviceProfileId,
  });

  factory LoRaWANDevice.fromJson(Map<String, dynamic> json) {
    return LoRaWANDevice(
      abpV1_0X: json['AbpV1_0_x'] != null
          ? AbpV1_0_x.fromJson(json['AbpV1_0_x'] as Map<String, dynamic>)
          : null,
      abpV1_1: json['AbpV1_1'] != null
          ? AbpV1_1.fromJson(json['AbpV1_1'] as Map<String, dynamic>)
          : null,
      devEui: json['DevEui'] as String?,
      deviceProfileId: json['DeviceProfileId'] as String?,
      otaaV1_0X: json['OtaaV1_0_x'] != null
          ? OtaaV1_0_x.fromJson(json['OtaaV1_0_x'] as Map<String, dynamic>)
          : null,
      otaaV1_1: json['OtaaV1_1'] != null
          ? OtaaV1_1.fromJson(json['OtaaV1_1'] as Map<String, dynamic>)
          : null,
      serviceProfileId: json['ServiceProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final abpV1_0X = this.abpV1_0X;
    final abpV1_1 = this.abpV1_1;
    final devEui = this.devEui;
    final deviceProfileId = this.deviceProfileId;
    final otaaV1_0X = this.otaaV1_0X;
    final otaaV1_1 = this.otaaV1_1;
    final serviceProfileId = this.serviceProfileId;
    return {
      if (abpV1_0X != null) 'AbpV1_0_x': abpV1_0X,
      if (abpV1_1 != null) 'AbpV1_1': abpV1_1,
      if (devEui != null) 'DevEui': devEui,
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
      if (otaaV1_0X != null) 'OtaaV1_0_x': otaaV1_0X,
      if (otaaV1_1 != null) 'OtaaV1_1': otaaV1_1,
      if (serviceProfileId != null) 'ServiceProfileId': serviceProfileId,
    };
  }
}

/// LoRaWAN device metatdata.
class LoRaWANDeviceMetadata {
  /// The DataRate value.
  final int? dataRate;

  /// The DevEUI value.
  final String? devEui;

  /// The FPort value.
  final int? fPort;

  /// The device's channel frequency in Hz.
  final int? frequency;

  /// Information about the gateways accessed by the device.
  final List<LoRaWANGatewayMetadata>? gateways;

  /// The date and time of the metadata.
  final String? timestamp;

  LoRaWANDeviceMetadata({
    this.dataRate,
    this.devEui,
    this.fPort,
    this.frequency,
    this.gateways,
    this.timestamp,
  });

  factory LoRaWANDeviceMetadata.fromJson(Map<String, dynamic> json) {
    return LoRaWANDeviceMetadata(
      dataRate: json['DataRate'] as int?,
      devEui: json['DevEui'] as String?,
      fPort: json['FPort'] as int?,
      frequency: json['Frequency'] as int?,
      gateways: (json['Gateways'] as List?)
          ?.whereNotNull()
          .map(
              (e) => LoRaWANGatewayMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['Timestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataRate = this.dataRate;
    final devEui = this.devEui;
    final fPort = this.fPort;
    final frequency = this.frequency;
    final gateways = this.gateways;
    final timestamp = this.timestamp;
    return {
      if (dataRate != null) 'DataRate': dataRate,
      if (devEui != null) 'DevEui': devEui,
      if (fPort != null) 'FPort': fPort,
      if (frequency != null) 'Frequency': frequency,
      if (gateways != null) 'Gateways': gateways,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// LoRaWANDeviceProfile object.
class LoRaWANDeviceProfile {
  /// The ClassBTimeout value.
  final int? classBTimeout;

  /// The ClassCTimeout value.
  final int? classCTimeout;

  /// The list of values that make up the FactoryPresetFreqs value.
  final List<int>? factoryPresetFreqsList;

  /// The MAC version (such as OTAA 1.1 or OTAA 1.0.3) to use with this device
  /// profile.
  final String? macVersion;

  /// The MaxDutyCycle value.
  final int? maxDutyCycle;

  /// The MaxEIRP value.
  final int? maxEirp;

  /// The PingSlotDR value.
  final int? pingSlotDr;

  /// The PingSlotFreq value.
  final int? pingSlotFreq;

  /// The PingSlotPeriod value.
  final int? pingSlotPeriod;

  /// The version of regional parameters.
  final String? regParamsRevision;

  /// The frequency band (RFRegion) value.
  final String? rfRegion;

  /// The RXDataRate2 value.
  final int? rxDataRate2;

  /// The RXDelay1 value.
  final int? rxDelay1;

  /// The RXDROffset1 value.
  final int? rxDrOffset1;

  /// The RXFreq2 value.
  final int? rxFreq2;

  /// The Supports32BitFCnt value.
  final bool? supports32BitFCnt;

  /// The SupportsClassB value.
  final bool? supportsClassB;

  /// The SupportsClassC value.
  final bool? supportsClassC;

  /// The SupportsJoin value.
  final bool? supportsJoin;

  LoRaWANDeviceProfile({
    this.classBTimeout,
    this.classCTimeout,
    this.factoryPresetFreqsList,
    this.macVersion,
    this.maxDutyCycle,
    this.maxEirp,
    this.pingSlotDr,
    this.pingSlotFreq,
    this.pingSlotPeriod,
    this.regParamsRevision,
    this.rfRegion,
    this.rxDataRate2,
    this.rxDelay1,
    this.rxDrOffset1,
    this.rxFreq2,
    this.supports32BitFCnt,
    this.supportsClassB,
    this.supportsClassC,
    this.supportsJoin,
  });

  factory LoRaWANDeviceProfile.fromJson(Map<String, dynamic> json) {
    return LoRaWANDeviceProfile(
      classBTimeout: json['ClassBTimeout'] as int?,
      classCTimeout: json['ClassCTimeout'] as int?,
      factoryPresetFreqsList: (json['FactoryPresetFreqsList'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      macVersion: json['MacVersion'] as String?,
      maxDutyCycle: json['MaxDutyCycle'] as int?,
      maxEirp: json['MaxEirp'] as int?,
      pingSlotDr: json['PingSlotDr'] as int?,
      pingSlotFreq: json['PingSlotFreq'] as int?,
      pingSlotPeriod: json['PingSlotPeriod'] as int?,
      regParamsRevision: json['RegParamsRevision'] as String?,
      rfRegion: json['RfRegion'] as String?,
      rxDataRate2: json['RxDataRate2'] as int?,
      rxDelay1: json['RxDelay1'] as int?,
      rxDrOffset1: json['RxDrOffset1'] as int?,
      rxFreq2: json['RxFreq2'] as int?,
      supports32BitFCnt: json['Supports32BitFCnt'] as bool?,
      supportsClassB: json['SupportsClassB'] as bool?,
      supportsClassC: json['SupportsClassC'] as bool?,
      supportsJoin: json['SupportsJoin'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final classBTimeout = this.classBTimeout;
    final classCTimeout = this.classCTimeout;
    final factoryPresetFreqsList = this.factoryPresetFreqsList;
    final macVersion = this.macVersion;
    final maxDutyCycle = this.maxDutyCycle;
    final maxEirp = this.maxEirp;
    final pingSlotDr = this.pingSlotDr;
    final pingSlotFreq = this.pingSlotFreq;
    final pingSlotPeriod = this.pingSlotPeriod;
    final regParamsRevision = this.regParamsRevision;
    final rfRegion = this.rfRegion;
    final rxDataRate2 = this.rxDataRate2;
    final rxDelay1 = this.rxDelay1;
    final rxDrOffset1 = this.rxDrOffset1;
    final rxFreq2 = this.rxFreq2;
    final supports32BitFCnt = this.supports32BitFCnt;
    final supportsClassB = this.supportsClassB;
    final supportsClassC = this.supportsClassC;
    final supportsJoin = this.supportsJoin;
    return {
      if (classBTimeout != null) 'ClassBTimeout': classBTimeout,
      if (classCTimeout != null) 'ClassCTimeout': classCTimeout,
      if (factoryPresetFreqsList != null)
        'FactoryPresetFreqsList': factoryPresetFreqsList,
      if (macVersion != null) 'MacVersion': macVersion,
      if (maxDutyCycle != null) 'MaxDutyCycle': maxDutyCycle,
      if (maxEirp != null) 'MaxEirp': maxEirp,
      if (pingSlotDr != null) 'PingSlotDr': pingSlotDr,
      if (pingSlotFreq != null) 'PingSlotFreq': pingSlotFreq,
      if (pingSlotPeriod != null) 'PingSlotPeriod': pingSlotPeriod,
      if (regParamsRevision != null) 'RegParamsRevision': regParamsRevision,
      if (rfRegion != null) 'RfRegion': rfRegion,
      if (rxDataRate2 != null) 'RxDataRate2': rxDataRate2,
      if (rxDelay1 != null) 'RxDelay1': rxDelay1,
      if (rxDrOffset1 != null) 'RxDrOffset1': rxDrOffset1,
      if (rxFreq2 != null) 'RxFreq2': rxFreq2,
      if (supports32BitFCnt != null) 'Supports32BitFCnt': supports32BitFCnt,
      if (supportsClassB != null) 'SupportsClassB': supportsClassB,
      if (supportsClassC != null) 'SupportsClassC': supportsClassC,
      if (supportsJoin != null) 'SupportsJoin': supportsJoin,
    };
  }
}

/// LoRaWANGateway object.
class LoRaWANGateway {
  /// The gateway's EUI value.
  final String? gatewayEui;
  final List<List<String>>? joinEuiFilters;
  final List<String>? netIdFilters;

  /// The frequency band (RFRegion) value.
  final String? rfRegion;
  final List<int>? subBands;

  LoRaWANGateway({
    this.gatewayEui,
    this.joinEuiFilters,
    this.netIdFilters,
    this.rfRegion,
    this.subBands,
  });

  factory LoRaWANGateway.fromJson(Map<String, dynamic> json) {
    return LoRaWANGateway(
      gatewayEui: json['GatewayEui'] as String?,
      joinEuiFilters: (json['JoinEuiFilters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
      netIdFilters: (json['NetIdFilters'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      rfRegion: json['RfRegion'] as String?,
      subBands: (json['SubBands'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayEui = this.gatewayEui;
    final joinEuiFilters = this.joinEuiFilters;
    final netIdFilters = this.netIdFilters;
    final rfRegion = this.rfRegion;
    final subBands = this.subBands;
    return {
      if (gatewayEui != null) 'GatewayEui': gatewayEui,
      if (joinEuiFilters != null) 'JoinEuiFilters': joinEuiFilters,
      if (netIdFilters != null) 'NetIdFilters': netIdFilters,
      if (rfRegion != null) 'RfRegion': rfRegion,
      if (subBands != null) 'SubBands': subBands,
    };
  }
}

/// LoRaWANGatewayCurrentVersion object.
class LoRaWANGatewayCurrentVersion {
  /// The version of the gateways that should receive the update.
  final LoRaWANGatewayVersion? currentVersion;

  LoRaWANGatewayCurrentVersion({
    this.currentVersion,
  });

  factory LoRaWANGatewayCurrentVersion.fromJson(Map<String, dynamic> json) {
    return LoRaWANGatewayCurrentVersion(
      currentVersion: json['CurrentVersion'] != null
          ? LoRaWANGatewayVersion.fromJson(
              json['CurrentVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currentVersion = this.currentVersion;
    return {
      if (currentVersion != null) 'CurrentVersion': currentVersion,
    };
  }
}

/// LoRaWAN gateway metatdata.
class LoRaWANGatewayMetadata {
  /// The gateway's EUI value.
  final String? gatewayEui;

  /// The RSSI value.
  final double? rssi;

  /// The SNR value.
  final double? snr;

  LoRaWANGatewayMetadata({
    this.gatewayEui,
    this.rssi,
    this.snr,
  });

  factory LoRaWANGatewayMetadata.fromJson(Map<String, dynamic> json) {
    return LoRaWANGatewayMetadata(
      gatewayEui: json['GatewayEui'] as String?,
      rssi: json['Rssi'] as double?,
      snr: json['Snr'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayEui = this.gatewayEui;
    final rssi = this.rssi;
    final snr = this.snr;
    return {
      if (gatewayEui != null) 'GatewayEui': gatewayEui,
      if (rssi != null) 'Rssi': rssi,
      if (snr != null) 'Snr': snr,
    };
  }
}

/// LoRaWANGatewayVersion object.
class LoRaWANGatewayVersion {
  /// The model number of the wireless gateway.
  final String? model;

  /// The version of the wireless gateway firmware.
  final String? packageVersion;

  /// The basic station version of the wireless gateway.
  final String? station;

  LoRaWANGatewayVersion({
    this.model,
    this.packageVersion,
    this.station,
  });

  factory LoRaWANGatewayVersion.fromJson(Map<String, dynamic> json) {
    return LoRaWANGatewayVersion(
      model: json['Model'] as String?,
      packageVersion: json['PackageVersion'] as String?,
      station: json['Station'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final model = this.model;
    final packageVersion = this.packageVersion;
    final station = this.station;
    return {
      if (model != null) 'Model': model,
      if (packageVersion != null) 'PackageVersion': packageVersion,
      if (station != null) 'Station': station,
    };
  }
}

/// LoRaWANGetServiceProfileInfo object.
class LoRaWANGetServiceProfileInfo {
  /// The AddGWMetaData value.
  final bool? addGwMetadata;

  /// The ChannelMask value.
  final String? channelMask;

  /// The DevStatusReqFreq value.
  final int? devStatusReqFreq;

  /// The DLBucketSize value.
  final int? dlBucketSize;

  /// The DLRate value.
  final int? dlRate;

  /// The DLRatePolicy value.
  final String? dlRatePolicy;

  /// The DRMax value.
  final int? drMax;

  /// The DRMin value.
  final int? drMin;

  /// The HRAllowed value that describes whether handover roaming is allowed.
  final bool? hrAllowed;

  /// The MinGwDiversity value.
  final int? minGwDiversity;

  /// The NwkGeoLoc value.
  final bool? nwkGeoLoc;

  /// The PRAllowed value that describes whether passive roaming is allowed.
  final bool? prAllowed;

  /// The RAAllowed value that describes whether roaming activation is allowed.
  final bool? raAllowed;

  /// The ReportDevStatusBattery value.
  final bool? reportDevStatusBattery;

  /// The ReportDevStatusMargin value.
  final bool? reportDevStatusMargin;

  /// The TargetPER value.
  final int? targetPer;

  /// The ULBucketSize value.
  final int? ulBucketSize;

  /// The ULRate value.
  final int? ulRate;

  /// The ULRatePolicy value.
  final String? ulRatePolicy;

  LoRaWANGetServiceProfileInfo({
    this.addGwMetadata,
    this.channelMask,
    this.devStatusReqFreq,
    this.dlBucketSize,
    this.dlRate,
    this.dlRatePolicy,
    this.drMax,
    this.drMin,
    this.hrAllowed,
    this.minGwDiversity,
    this.nwkGeoLoc,
    this.prAllowed,
    this.raAllowed,
    this.reportDevStatusBattery,
    this.reportDevStatusMargin,
    this.targetPer,
    this.ulBucketSize,
    this.ulRate,
    this.ulRatePolicy,
  });

  factory LoRaWANGetServiceProfileInfo.fromJson(Map<String, dynamic> json) {
    return LoRaWANGetServiceProfileInfo(
      addGwMetadata: json['AddGwMetadata'] as bool?,
      channelMask: json['ChannelMask'] as String?,
      devStatusReqFreq: json['DevStatusReqFreq'] as int?,
      dlBucketSize: json['DlBucketSize'] as int?,
      dlRate: json['DlRate'] as int?,
      dlRatePolicy: json['DlRatePolicy'] as String?,
      drMax: json['DrMax'] as int?,
      drMin: json['DrMin'] as int?,
      hrAllowed: json['HrAllowed'] as bool?,
      minGwDiversity: json['MinGwDiversity'] as int?,
      nwkGeoLoc: json['NwkGeoLoc'] as bool?,
      prAllowed: json['PrAllowed'] as bool?,
      raAllowed: json['RaAllowed'] as bool?,
      reportDevStatusBattery: json['ReportDevStatusBattery'] as bool?,
      reportDevStatusMargin: json['ReportDevStatusMargin'] as bool?,
      targetPer: json['TargetPer'] as int?,
      ulBucketSize: json['UlBucketSize'] as int?,
      ulRate: json['UlRate'] as int?,
      ulRatePolicy: json['UlRatePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addGwMetadata = this.addGwMetadata;
    final channelMask = this.channelMask;
    final devStatusReqFreq = this.devStatusReqFreq;
    final dlBucketSize = this.dlBucketSize;
    final dlRate = this.dlRate;
    final dlRatePolicy = this.dlRatePolicy;
    final drMax = this.drMax;
    final drMin = this.drMin;
    final hrAllowed = this.hrAllowed;
    final minGwDiversity = this.minGwDiversity;
    final nwkGeoLoc = this.nwkGeoLoc;
    final prAllowed = this.prAllowed;
    final raAllowed = this.raAllowed;
    final reportDevStatusBattery = this.reportDevStatusBattery;
    final reportDevStatusMargin = this.reportDevStatusMargin;
    final targetPer = this.targetPer;
    final ulBucketSize = this.ulBucketSize;
    final ulRate = this.ulRate;
    final ulRatePolicy = this.ulRatePolicy;
    return {
      if (addGwMetadata != null) 'AddGwMetadata': addGwMetadata,
      if (channelMask != null) 'ChannelMask': channelMask,
      if (devStatusReqFreq != null) 'DevStatusReqFreq': devStatusReqFreq,
      if (dlBucketSize != null) 'DlBucketSize': dlBucketSize,
      if (dlRate != null) 'DlRate': dlRate,
      if (dlRatePolicy != null) 'DlRatePolicy': dlRatePolicy,
      if (drMax != null) 'DrMax': drMax,
      if (drMin != null) 'DrMin': drMin,
      if (hrAllowed != null) 'HrAllowed': hrAllowed,
      if (minGwDiversity != null) 'MinGwDiversity': minGwDiversity,
      if (nwkGeoLoc != null) 'NwkGeoLoc': nwkGeoLoc,
      if (prAllowed != null) 'PrAllowed': prAllowed,
      if (raAllowed != null) 'RaAllowed': raAllowed,
      if (reportDevStatusBattery != null)
        'ReportDevStatusBattery': reportDevStatusBattery,
      if (reportDevStatusMargin != null)
        'ReportDevStatusMargin': reportDevStatusMargin,
      if (targetPer != null) 'TargetPer': targetPer,
      if (ulBucketSize != null) 'UlBucketSize': ulBucketSize,
      if (ulRate != null) 'UlRate': ulRate,
      if (ulRatePolicy != null) 'UlRatePolicy': ulRatePolicy,
    };
  }
}

/// LoRaWAN object for list functions.
class LoRaWANListDevice {
  /// The DevEUI value.
  final String? devEui;

  LoRaWANListDevice({
    this.devEui,
  });

  factory LoRaWANListDevice.fromJson(Map<String, dynamic> json) {
    return LoRaWANListDevice(
      devEui: json['DevEui'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devEui = this.devEui;
    return {
      if (devEui != null) 'DevEui': devEui,
    };
  }
}

/// LoRaWAN router info.
class LoRaWANSendDataToDevice {
  /// The Fport value.
  final int? fPort;

  LoRaWANSendDataToDevice({
    this.fPort,
  });

  factory LoRaWANSendDataToDevice.fromJson(Map<String, dynamic> json) {
    return LoRaWANSendDataToDevice(
      fPort: json['FPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fPort = this.fPort;
    return {
      if (fPort != null) 'FPort': fPort,
    };
  }
}

/// LoRaWANServiceProfile object.
class LoRaWANServiceProfile {
  /// The AddGWMetaData value.
  final bool? addGwMetadata;

  LoRaWANServiceProfile({
    this.addGwMetadata,
  });

  factory LoRaWANServiceProfile.fromJson(Map<String, dynamic> json) {
    return LoRaWANServiceProfile(
      addGwMetadata: json['AddGwMetadata'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final addGwMetadata = this.addGwMetadata;
    return {
      if (addGwMetadata != null) 'AddGwMetadata': addGwMetadata,
    };
  }
}

/// LoRaWAN object for update functions.
class LoRaWANUpdateDevice {
  /// The ID of the device profile for the wireless device.
  final String? deviceProfileId;

  /// The ID of the service profile.
  final String? serviceProfileId;

  LoRaWANUpdateDevice({
    this.deviceProfileId,
    this.serviceProfileId,
  });

  factory LoRaWANUpdateDevice.fromJson(Map<String, dynamic> json) {
    return LoRaWANUpdateDevice(
      deviceProfileId: json['DeviceProfileId'] as String?,
      serviceProfileId: json['ServiceProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceProfileId = this.deviceProfileId;
    final serviceProfileId = this.serviceProfileId;
    return {
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
      if (serviceProfileId != null) 'ServiceProfileId': serviceProfileId,
    };
  }
}

/// LoRaWANUpdateGatewayTaskCreate object.
class LoRaWANUpdateGatewayTaskCreate {
  /// The version of the gateways that should receive the update.
  final LoRaWANGatewayVersion? currentVersion;

  /// The CRC of the signature private key to check.
  final int? sigKeyCrc;

  /// The signature used to verify the update firmware.
  final String? updateSignature;

  /// The firmware version to update the gateway to.
  final LoRaWANGatewayVersion? updateVersion;

  LoRaWANUpdateGatewayTaskCreate({
    this.currentVersion,
    this.sigKeyCrc,
    this.updateSignature,
    this.updateVersion,
  });

  factory LoRaWANUpdateGatewayTaskCreate.fromJson(Map<String, dynamic> json) {
    return LoRaWANUpdateGatewayTaskCreate(
      currentVersion: json['CurrentVersion'] != null
          ? LoRaWANGatewayVersion.fromJson(
              json['CurrentVersion'] as Map<String, dynamic>)
          : null,
      sigKeyCrc: json['SigKeyCrc'] as int?,
      updateSignature: json['UpdateSignature'] as String?,
      updateVersion: json['UpdateVersion'] != null
          ? LoRaWANGatewayVersion.fromJson(
              json['UpdateVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currentVersion = this.currentVersion;
    final sigKeyCrc = this.sigKeyCrc;
    final updateSignature = this.updateSignature;
    final updateVersion = this.updateVersion;
    return {
      if (currentVersion != null) 'CurrentVersion': currentVersion,
      if (sigKeyCrc != null) 'SigKeyCrc': sigKeyCrc,
      if (updateSignature != null) 'UpdateSignature': updateSignature,
      if (updateVersion != null) 'UpdateVersion': updateVersion,
    };
  }
}

/// LoRaWANUpdateGatewayTaskEntry object.
class LoRaWANUpdateGatewayTaskEntry {
  /// The version of the gateways that should receive the update.
  final LoRaWANGatewayVersion? currentVersion;

  /// The firmware version to update the gateway to.
  final LoRaWANGatewayVersion? updateVersion;

  LoRaWANUpdateGatewayTaskEntry({
    this.currentVersion,
    this.updateVersion,
  });

  factory LoRaWANUpdateGatewayTaskEntry.fromJson(Map<String, dynamic> json) {
    return LoRaWANUpdateGatewayTaskEntry(
      currentVersion: json['CurrentVersion'] != null
          ? LoRaWANGatewayVersion.fromJson(
              json['CurrentVersion'] as Map<String, dynamic>)
          : null,
      updateVersion: json['UpdateVersion'] != null
          ? LoRaWANGatewayVersion.fromJson(
              json['UpdateVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final currentVersion = this.currentVersion;
    final updateVersion = this.updateVersion;
    return {
      if (currentVersion != null) 'CurrentVersion': currentVersion,
      if (updateVersion != null) 'UpdateVersion': updateVersion,
    };
  }
}

/// The log level for a log message.
enum LogLevel {
  info,
  error,
  disabled,
}

extension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.info:
        return 'INFO';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'INFO':
        return LogLevel.info;
      case 'ERROR':
        return LogLevel.error;
      case 'DISABLED':
        return LogLevel.disabled;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

/// Sidewalk device message type.
enum MessageType {
  customCommandIdNotify,
  customCommandIdGet,
  customCommandIdSet,
  customCommandIdResp,
}

extension on MessageType {
  String toValue() {
    switch (this) {
      case MessageType.customCommandIdNotify:
        return 'CUSTOM_COMMAND_ID_NOTIFY';
      case MessageType.customCommandIdGet:
        return 'CUSTOM_COMMAND_ID_GET';
      case MessageType.customCommandIdSet:
        return 'CUSTOM_COMMAND_ID_SET';
      case MessageType.customCommandIdResp:
        return 'CUSTOM_COMMAND_ID_RESP';
    }
  }
}

extension on String {
  MessageType toMessageType() {
    switch (this) {
      case 'CUSTOM_COMMAND_ID_NOTIFY':
        return MessageType.customCommandIdNotify;
      case 'CUSTOM_COMMAND_ID_GET':
        return MessageType.customCommandIdGet;
      case 'CUSTOM_COMMAND_ID_SET':
        return MessageType.customCommandIdSet;
      case 'CUSTOM_COMMAND_ID_RESP':
        return MessageType.customCommandIdResp;
    }
    throw Exception('$this is not known in enum MessageType');
  }
}

/// OTAA device object for v1.0.x
class OtaaV1_0_x {
  /// The AppEUI value.
  final String? appEui;

  /// The AppKey value.
  final String? appKey;

  OtaaV1_0_x({
    this.appEui,
    this.appKey,
  });

  factory OtaaV1_0_x.fromJson(Map<String, dynamic> json) {
    return OtaaV1_0_x(
      appEui: json['AppEui'] as String?,
      appKey: json['AppKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appEui = this.appEui;
    final appKey = this.appKey;
    return {
      if (appEui != null) 'AppEui': appEui,
      if (appKey != null) 'AppKey': appKey,
    };
  }
}

/// OTAA device object for v1.1
class OtaaV1_1 {
  /// The AppKey value.
  final String? appKey;

  /// The JoinEUI value.
  final String? joinEui;

  /// The NwkKey value.
  final String? nwkKey;

  OtaaV1_1({
    this.appKey,
    this.joinEui,
    this.nwkKey,
  });

  factory OtaaV1_1.fromJson(Map<String, dynamic> json) {
    return OtaaV1_1(
      appKey: json['AppKey'] as String?,
      joinEui: json['JoinEui'] as String?,
      nwkKey: json['NwkKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appKey = this.appKey;
    final joinEui = this.joinEui;
    final nwkKey = this.nwkKey;
    return {
      if (appKey != null) 'AppKey': appKey,
      if (joinEui != null) 'JoinEui': joinEui,
      if (nwkKey != null) 'NwkKey': nwkKey,
    };
  }
}

enum PartnerType {
  sidewalk,
}

extension on PartnerType {
  String toValue() {
    switch (this) {
      case PartnerType.sidewalk:
        return 'Sidewalk';
    }
  }
}

extension on String {
  PartnerType toPartnerType() {
    switch (this) {
      case 'Sidewalk':
        return PartnerType.sidewalk;
    }
    throw Exception('$this is not known in enum PartnerType');
  }
}

class PutResourceLogLevelResponse {
  PutResourceLogLevelResponse();

  factory PutResourceLogLevelResponse.fromJson(Map<String, dynamic> _) {
    return PutResourceLogLevelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ResetAllResourceLogLevelsResponse {
  ResetAllResourceLogLevelsResponse();

  factory ResetAllResourceLogLevelsResponse.fromJson(Map<String, dynamic> _) {
    return ResetAllResourceLogLevelsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ResetResourceLogLevelResponse {
  ResetResourceLogLevelResponse();

  factory ResetResourceLogLevelResponse.fromJson(Map<String, dynamic> _) {
    return ResetResourceLogLevelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SendDataToWirelessDeviceResponse {
  /// The ID of the message sent to the wireless device.
  final String? messageId;

  SendDataToWirelessDeviceResponse({
    this.messageId,
  });

  factory SendDataToWirelessDeviceResponse.fromJson(Map<String, dynamic> json) {
    return SendDataToWirelessDeviceResponse(
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// Information about a service profile.
class ServiceProfile {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The ID of the service profile.
  final String? id;

  /// The name of the resource.
  final String? name;

  ServiceProfile({
    this.arn,
    this.id,
    this.name,
  });

  factory ServiceProfile.fromJson(Map<String, dynamic> json) {
    return ServiceProfile(
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

/// Session keys for ABP v1.1
class SessionKeysAbpV1_0_x {
  /// The AppSKey value.
  final String? appSKey;

  /// The NwkSKey value.
  final String? nwkSKey;

  SessionKeysAbpV1_0_x({
    this.appSKey,
    this.nwkSKey,
  });

  factory SessionKeysAbpV1_0_x.fromJson(Map<String, dynamic> json) {
    return SessionKeysAbpV1_0_x(
      appSKey: json['AppSKey'] as String?,
      nwkSKey: json['NwkSKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appSKey = this.appSKey;
    final nwkSKey = this.nwkSKey;
    return {
      if (appSKey != null) 'AppSKey': appSKey,
      if (nwkSKey != null) 'NwkSKey': nwkSKey,
    };
  }
}

/// Session keys for ABP v1.1
class SessionKeysAbpV1_1 {
  /// The AppSKey value.
  final String? appSKey;

  /// The FNwkSIntKey value.
  final String? fNwkSIntKey;

  /// The NwkSEncKey value.
  final String? nwkSEncKey;

  /// The SNwkSIntKey value.
  final String? sNwkSIntKey;

  SessionKeysAbpV1_1({
    this.appSKey,
    this.fNwkSIntKey,
    this.nwkSEncKey,
    this.sNwkSIntKey,
  });

  factory SessionKeysAbpV1_1.fromJson(Map<String, dynamic> json) {
    return SessionKeysAbpV1_1(
      appSKey: json['AppSKey'] as String?,
      fNwkSIntKey: json['FNwkSIntKey'] as String?,
      nwkSEncKey: json['NwkSEncKey'] as String?,
      sNwkSIntKey: json['SNwkSIntKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appSKey = this.appSKey;
    final fNwkSIntKey = this.fNwkSIntKey;
    final nwkSEncKey = this.nwkSEncKey;
    final sNwkSIntKey = this.sNwkSIntKey;
    return {
      if (appSKey != null) 'AppSKey': appSKey,
      if (fNwkSIntKey != null) 'FNwkSIntKey': fNwkSIntKey,
      if (nwkSEncKey != null) 'NwkSEncKey': nwkSEncKey,
      if (sNwkSIntKey != null) 'SNwkSIntKey': sNwkSIntKey,
    };
  }
}

/// Information about a Sidewalk account.
class SidewalkAccountInfo {
  /// The Sidewalk Amazon ID.
  final String? amazonId;

  /// The Sidewalk application server private key.
  final String? appServerPrivateKey;

  SidewalkAccountInfo({
    this.amazonId,
    this.appServerPrivateKey,
  });

  factory SidewalkAccountInfo.fromJson(Map<String, dynamic> json) {
    return SidewalkAccountInfo(
      amazonId: json['AmazonId'] as String?,
      appServerPrivateKey: json['AppServerPrivateKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonId = this.amazonId;
    final appServerPrivateKey = this.appServerPrivateKey;
    return {
      if (amazonId != null) 'AmazonId': amazonId,
      if (appServerPrivateKey != null)
        'AppServerPrivateKey': appServerPrivateKey,
    };
  }
}

/// Information about a Sidewalk account.
class SidewalkAccountInfoWithFingerprint {
  /// The Sidewalk Amazon ID.
  final String? amazonId;

  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The fingerprint of the Sidewalk application server private key.
  final String? fingerprint;

  SidewalkAccountInfoWithFingerprint({
    this.amazonId,
    this.arn,
    this.fingerprint,
  });

  factory SidewalkAccountInfoWithFingerprint.fromJson(
      Map<String, dynamic> json) {
    return SidewalkAccountInfoWithFingerprint(
      amazonId: json['AmazonId'] as String?,
      arn: json['Arn'] as String?,
      fingerprint: json['Fingerprint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonId = this.amazonId;
    final arn = this.arn;
    final fingerprint = this.fingerprint;
    return {
      if (amazonId != null) 'AmazonId': amazonId,
      if (arn != null) 'Arn': arn,
      if (fingerprint != null) 'Fingerprint': fingerprint,
    };
  }
}

/// Sidewalk device object.
class SidewalkDevice {
  /// The sidewalk device certificates for Ed25519 and P256r1.
  final List<CertificateList>? deviceCertificates;

  /// The sidewalk device identification.
  final String? sidewalkId;

  /// The Sidewalk manufacturing series number.
  final String? sidewalkManufacturingSn;

  SidewalkDevice({
    this.deviceCertificates,
    this.sidewalkId,
    this.sidewalkManufacturingSn,
  });

  factory SidewalkDevice.fromJson(Map<String, dynamic> json) {
    return SidewalkDevice(
      deviceCertificates: (json['DeviceCertificates'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateList.fromJson(e as Map<String, dynamic>))
          .toList(),
      sidewalkId: json['SidewalkId'] as String?,
      sidewalkManufacturingSn: json['SidewalkManufacturingSn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceCertificates = this.deviceCertificates;
    final sidewalkId = this.sidewalkId;
    final sidewalkManufacturingSn = this.sidewalkManufacturingSn;
    return {
      if (deviceCertificates != null) 'DeviceCertificates': deviceCertificates,
      if (sidewalkId != null) 'SidewalkId': sidewalkId,
      if (sidewalkManufacturingSn != null)
        'SidewalkManufacturingSn': sidewalkManufacturingSn,
    };
  }
}

/// MetaData for Sidewalk device.
class SidewalkDeviceMetadata {
  /// Sidewalk device battery level.
  final BatteryLevel? batteryLevel;

  /// Device state defines the device status of sidewalk device.
  final DeviceState? deviceState;

  /// Sidewalk device status notification.
  final Event? event;

  /// The RSSI value.
  final int? rssi;

  SidewalkDeviceMetadata({
    this.batteryLevel,
    this.deviceState,
    this.event,
    this.rssi,
  });

  factory SidewalkDeviceMetadata.fromJson(Map<String, dynamic> json) {
    return SidewalkDeviceMetadata(
      batteryLevel: (json['BatteryLevel'] as String?)?.toBatteryLevel(),
      deviceState: (json['DeviceState'] as String?)?.toDeviceState(),
      event: (json['Event'] as String?)?.toEvent(),
      rssi: json['Rssi'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final batteryLevel = this.batteryLevel;
    final deviceState = this.deviceState;
    final event = this.event;
    final rssi = this.rssi;
    return {
      if (batteryLevel != null) 'BatteryLevel': batteryLevel.toValue(),
      if (deviceState != null) 'DeviceState': deviceState.toValue(),
      if (event != null) 'Event': event.toValue(),
      if (rssi != null) 'Rssi': rssi,
    };
  }
}

/// Sidewalk object used by list functions.
class SidewalkListDevice {
  /// The Sidewalk Amazon ID.
  final String? amazonId;

  /// The sidewalk device certificates for Ed25519 and P256r1.
  final List<CertificateList>? deviceCertificates;

  /// The sidewalk device identification.
  final String? sidewalkId;

  /// The Sidewalk manufacturing series number.
  final String? sidewalkManufacturingSn;

  SidewalkListDevice({
    this.amazonId,
    this.deviceCertificates,
    this.sidewalkId,
    this.sidewalkManufacturingSn,
  });

  factory SidewalkListDevice.fromJson(Map<String, dynamic> json) {
    return SidewalkListDevice(
      amazonId: json['AmazonId'] as String?,
      deviceCertificates: (json['DeviceCertificates'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateList.fromJson(e as Map<String, dynamic>))
          .toList(),
      sidewalkId: json['SidewalkId'] as String?,
      sidewalkManufacturingSn: json['SidewalkManufacturingSn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonId = this.amazonId;
    final deviceCertificates = this.deviceCertificates;
    final sidewalkId = this.sidewalkId;
    final sidewalkManufacturingSn = this.sidewalkManufacturingSn;
    return {
      if (amazonId != null) 'AmazonId': amazonId,
      if (deviceCertificates != null) 'DeviceCertificates': deviceCertificates,
      if (sidewalkId != null) 'SidewalkId': sidewalkId,
      if (sidewalkManufacturingSn != null)
        'SidewalkManufacturingSn': sidewalkManufacturingSn,
    };
  }
}

/// Information about a Sidewalk router.
class SidewalkSendDataToDevice {
  final MessageType? messageType;

  /// The sequence number.
  final int? seq;

  SidewalkSendDataToDevice({
    this.messageType,
    this.seq,
  });

  factory SidewalkSendDataToDevice.fromJson(Map<String, dynamic> json) {
    return SidewalkSendDataToDevice(
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      seq: json['Seq'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageType = this.messageType;
    final seq = this.seq;
    return {
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (seq != null) 'Seq': seq,
    };
  }
}

/// Sidewalk update.
class SidewalkUpdateAccount {
  /// The new Sidewalk application server private key.
  final String? appServerPrivateKey;

  SidewalkUpdateAccount({
    this.appServerPrivateKey,
  });

  factory SidewalkUpdateAccount.fromJson(Map<String, dynamic> json) {
    return SidewalkUpdateAccount(
      appServerPrivateKey: json['AppServerPrivateKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appServerPrivateKey = this.appServerPrivateKey;
    return {
      if (appServerPrivateKey != null)
        'AppServerPrivateKey': appServerPrivateKey,
    };
  }
}

/// The certificate chain algorithm provided by sidewalk.
enum SigningAlg {
  ed25519,
  p256r1,
}

extension on SigningAlg {
  String toValue() {
    switch (this) {
      case SigningAlg.ed25519:
        return 'Ed25519';
      case SigningAlg.p256r1:
        return 'P256r1';
    }
  }
}

extension on String {
  SigningAlg toSigningAlg() {
    switch (this) {
      case 'Ed25519':
        return SigningAlg.ed25519;
      case 'P256r1':
        return SigningAlg.p256r1;
    }
    throw Exception('$this is not known in enum SigningAlg');
  }
}

/// A simple label consisting of a customer-defined key-value pair
class Tag {
  /// The tag's key value.
  final String key;

  /// The tag's value.
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

  Map<String, dynamic> toJson() {
    return {};
  }
}

class TestWirelessDeviceResponse {
  /// The result returned by the test.
  final String? result;

  TestWirelessDeviceResponse({
    this.result,
  });

  factory TestWirelessDeviceResponse.fromJson(Map<String, dynamic> json) {
    return TestWirelessDeviceResponse(
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'Result': result,
    };
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

class UpdateDestinationResponse {
  UpdateDestinationResponse();

  factory UpdateDestinationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLogLevelsByResourceTypesResponse {
  UpdateLogLevelsByResourceTypesResponse();

  factory UpdateLogLevelsByResourceTypesResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateLogLevelsByResourceTypesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePartnerAccountResponse {
  UpdatePartnerAccountResponse();

  factory UpdatePartnerAccountResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePartnerAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWirelessDeviceResponse {
  UpdateWirelessDeviceResponse();

  factory UpdateWirelessDeviceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateWirelessDeviceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWirelessGatewayResponse {
  UpdateWirelessGatewayResponse();

  factory UpdateWirelessGatewayResponse.fromJson(Map<String, dynamic> _) {
    return UpdateWirelessGatewayResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// UpdateWirelessGatewayTaskCreate object.
class UpdateWirelessGatewayTaskCreate {
  /// The properties that relate to the LoRaWAN wireless gateway.
  final LoRaWANUpdateGatewayTaskCreate? loRaWAN;

  /// The IAM role used to read data from the S3 bucket.
  final String? updateDataRole;

  /// The link to the S3 bucket.
  final String? updateDataSource;

  UpdateWirelessGatewayTaskCreate({
    this.loRaWAN,
    this.updateDataRole,
    this.updateDataSource,
  });

  factory UpdateWirelessGatewayTaskCreate.fromJson(Map<String, dynamic> json) {
    return UpdateWirelessGatewayTaskCreate(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANUpdateGatewayTaskCreate.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      updateDataRole: json['UpdateDataRole'] as String?,
      updateDataSource: json['UpdateDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    final updateDataRole = this.updateDataRole;
    final updateDataSource = this.updateDataSource;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (updateDataRole != null) 'UpdateDataRole': updateDataRole,
      if (updateDataSource != null) 'UpdateDataSource': updateDataSource,
    };
  }
}

/// UpdateWirelessGatewayTaskEntry object.
class UpdateWirelessGatewayTaskEntry {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The ID of the new wireless gateway task entry.
  final String? id;

  /// The properties that relate to the LoRaWAN wireless gateway.
  final LoRaWANUpdateGatewayTaskEntry? loRaWAN;

  UpdateWirelessGatewayTaskEntry({
    this.arn,
    this.id,
    this.loRaWAN,
  });

  factory UpdateWirelessGatewayTaskEntry.fromJson(Map<String, dynamic> json) {
    return UpdateWirelessGatewayTaskEntry(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANUpdateGatewayTaskEntry.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
    };
  }
}

/// The event for a log message, if the log message is tied to a wireless
/// device.
enum WirelessDeviceEvent {
  join,
  rejoin,
  uplinkData,
  downlinkData,
  registration,
}

extension on WirelessDeviceEvent {
  String toValue() {
    switch (this) {
      case WirelessDeviceEvent.join:
        return 'Join';
      case WirelessDeviceEvent.rejoin:
        return 'Rejoin';
      case WirelessDeviceEvent.uplinkData:
        return 'Uplink_Data';
      case WirelessDeviceEvent.downlinkData:
        return 'Downlink_Data';
      case WirelessDeviceEvent.registration:
        return 'Registration';
    }
  }
}

extension on String {
  WirelessDeviceEvent toWirelessDeviceEvent() {
    switch (this) {
      case 'Join':
        return WirelessDeviceEvent.join;
      case 'Rejoin':
        return WirelessDeviceEvent.rejoin;
      case 'Uplink_Data':
        return WirelessDeviceEvent.uplinkData;
      case 'Downlink_Data':
        return WirelessDeviceEvent.downlinkData;
      case 'Registration':
        return WirelessDeviceEvent.registration;
    }
    throw Exception('$this is not known in enum WirelessDeviceEvent');
  }
}

/// The log option for a wireless device event. Can be used to set log level for
/// a specific wireless device event. For a LoRaWAN device, the possible events
/// for a log messsage are: Join, Rejoin, Downlink_Data, Uplink_Data. For a
/// Sidewalk device, the possible events for a log message are: Registration,
/// Downlink_Data, Uplink_Data.
class WirelessDeviceEventLogOption {
  final WirelessDeviceEvent event;
  final LogLevel logLevel;

  WirelessDeviceEventLogOption({
    required this.event,
    required this.logLevel,
  });

  factory WirelessDeviceEventLogOption.fromJson(Map<String, dynamic> json) {
    return WirelessDeviceEventLogOption(
      event: (json['Event'] as String).toWirelessDeviceEvent(),
      logLevel: (json['LogLevel'] as String).toLogLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final logLevel = this.logLevel;
    return {
      'Event': event.toValue(),
      'LogLevel': logLevel.toValue(),
    };
  }
}

enum WirelessDeviceIdType {
  wirelessDeviceId,
  devEui,
  thingName,
}

extension on WirelessDeviceIdType {
  String toValue() {
    switch (this) {
      case WirelessDeviceIdType.wirelessDeviceId:
        return 'WirelessDeviceId';
      case WirelessDeviceIdType.devEui:
        return 'DevEui';
      case WirelessDeviceIdType.thingName:
        return 'ThingName';
    }
  }
}

extension on String {
  WirelessDeviceIdType toWirelessDeviceIdType() {
    switch (this) {
      case 'WirelessDeviceId':
        return WirelessDeviceIdType.wirelessDeviceId;
      case 'DevEui':
        return WirelessDeviceIdType.devEui;
      case 'ThingName':
        return WirelessDeviceIdType.thingName;
    }
    throw Exception('$this is not known in enum WirelessDeviceIdType');
  }
}

/// The log option for wireless devices. Can be used to set log level for a
/// specific type of wireless device.
class WirelessDeviceLogOption {
  final LogLevel logLevel;

  /// The wireless device type.
  final WirelessDeviceType type;
  final List<WirelessDeviceEventLogOption>? events;

  WirelessDeviceLogOption({
    required this.logLevel,
    required this.type,
    this.events,
  });

  factory WirelessDeviceLogOption.fromJson(Map<String, dynamic> json) {
    return WirelessDeviceLogOption(
      logLevel: (json['LogLevel'] as String).toLogLevel(),
      type: (json['Type'] as String).toWirelessDeviceType(),
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WirelessDeviceEventLogOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    final type = this.type;
    final events = this.events;
    return {
      'LogLevel': logLevel.toValue(),
      'Type': type.toValue(),
      if (events != null) 'Events': events,
    };
  }
}

/// Information about a wireless device's operation.
class WirelessDeviceStatistics {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The name of the destination to which the device is assigned.
  final String? destinationName;

  /// The ID of the wireless device reporting the data.
  final String? id;

  /// The date and time when the most recent uplink was received.
  final String? lastUplinkReceivedAt;

  /// LoRaWAN device info.
  final LoRaWANListDevice? loRaWAN;

  /// The name of the resource.
  final String? name;

  /// The Sidewalk account credentials.
  final SidewalkListDevice? sidewalk;

  /// The wireless device type.
  final WirelessDeviceType? type;

  WirelessDeviceStatistics({
    this.arn,
    this.destinationName,
    this.id,
    this.lastUplinkReceivedAt,
    this.loRaWAN,
    this.name,
    this.sidewalk,
    this.type,
  });

  factory WirelessDeviceStatistics.fromJson(Map<String, dynamic> json) {
    return WirelessDeviceStatistics(
      arn: json['Arn'] as String?,
      destinationName: json['DestinationName'] as String?,
      id: json['Id'] as String?,
      lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANListDevice.fromJson(json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkListDevice.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toWirelessDeviceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinationName = this.destinationName;
    final id = this.id;
    final lastUplinkReceivedAt = this.lastUplinkReceivedAt;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    final sidewalk = this.sidewalk;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (destinationName != null) 'DestinationName': destinationName,
      if (id != null) 'Id': id,
      if (lastUplinkReceivedAt != null)
        'LastUplinkReceivedAt': lastUplinkReceivedAt,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum WirelessDeviceType {
  sidewalk,
  loRaWAN,
}

extension on WirelessDeviceType {
  String toValue() {
    switch (this) {
      case WirelessDeviceType.sidewalk:
        return 'Sidewalk';
      case WirelessDeviceType.loRaWAN:
        return 'LoRaWAN';
    }
  }
}

extension on String {
  WirelessDeviceType toWirelessDeviceType() {
    switch (this) {
      case 'Sidewalk':
        return WirelessDeviceType.sidewalk;
      case 'LoRaWAN':
        return WirelessDeviceType.loRaWAN;
    }
    throw Exception('$this is not known in enum WirelessDeviceType');
  }
}

/// The event for a log message, if the log message is tied to a wireless
/// gateway.
enum WirelessGatewayEvent {
  cupsRequest,
  certificate,
}

extension on WirelessGatewayEvent {
  String toValue() {
    switch (this) {
      case WirelessGatewayEvent.cupsRequest:
        return 'CUPS_Request';
      case WirelessGatewayEvent.certificate:
        return 'Certificate';
    }
  }
}

extension on String {
  WirelessGatewayEvent toWirelessGatewayEvent() {
    switch (this) {
      case 'CUPS_Request':
        return WirelessGatewayEvent.cupsRequest;
      case 'Certificate':
        return WirelessGatewayEvent.certificate;
    }
    throw Exception('$this is not known in enum WirelessGatewayEvent');
  }
}

/// The log option for a wireless gateway event. Can be used to set log level
/// for a specific wireless gateway event. For a LoRaWAN gateway, the possible
/// events for a log message are: CUPS_Request, Certificate.
class WirelessGatewayEventLogOption {
  final WirelessGatewayEvent event;
  final LogLevel logLevel;

  WirelessGatewayEventLogOption({
    required this.event,
    required this.logLevel,
  });

  factory WirelessGatewayEventLogOption.fromJson(Map<String, dynamic> json) {
    return WirelessGatewayEventLogOption(
      event: (json['Event'] as String).toWirelessGatewayEvent(),
      logLevel: (json['LogLevel'] as String).toLogLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final logLevel = this.logLevel;
    return {
      'Event': event.toValue(),
      'LogLevel': logLevel.toValue(),
    };
  }
}

enum WirelessGatewayIdType {
  gatewayEui,
  wirelessGatewayId,
  thingName,
}

extension on WirelessGatewayIdType {
  String toValue() {
    switch (this) {
      case WirelessGatewayIdType.gatewayEui:
        return 'GatewayEui';
      case WirelessGatewayIdType.wirelessGatewayId:
        return 'WirelessGatewayId';
      case WirelessGatewayIdType.thingName:
        return 'ThingName';
    }
  }
}

extension on String {
  WirelessGatewayIdType toWirelessGatewayIdType() {
    switch (this) {
      case 'GatewayEui':
        return WirelessGatewayIdType.gatewayEui;
      case 'WirelessGatewayId':
        return WirelessGatewayIdType.wirelessGatewayId;
      case 'ThingName':
        return WirelessGatewayIdType.thingName;
    }
    throw Exception('$this is not known in enum WirelessGatewayIdType');
  }
}

/// The log option for wireless gateways. Can be used to set log level for a
/// specific type of wireless gateway.
class WirelessGatewayLogOption {
  final LogLevel logLevel;
  final WirelessGatewayType type;
  final List<WirelessGatewayEventLogOption>? events;

  WirelessGatewayLogOption({
    required this.logLevel,
    required this.type,
    this.events,
  });

  factory WirelessGatewayLogOption.fromJson(Map<String, dynamic> json) {
    return WirelessGatewayLogOption(
      logLevel: (json['LogLevel'] as String).toLogLevel(),
      type: (json['Type'] as String).toWirelessGatewayType(),
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WirelessGatewayEventLogOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    final type = this.type;
    final events = this.events;
    return {
      'LogLevel': logLevel.toValue(),
      'Type': type.toValue(),
      if (events != null) 'Events': events,
    };
  }
}

enum WirelessGatewayServiceType {
  cups,
  lns,
}

extension on WirelessGatewayServiceType {
  String toValue() {
    switch (this) {
      case WirelessGatewayServiceType.cups:
        return 'CUPS';
      case WirelessGatewayServiceType.lns:
        return 'LNS';
    }
  }
}

extension on String {
  WirelessGatewayServiceType toWirelessGatewayServiceType() {
    switch (this) {
      case 'CUPS':
        return WirelessGatewayServiceType.cups;
      case 'LNS':
        return WirelessGatewayServiceType.lns;
    }
    throw Exception('$this is not known in enum WirelessGatewayServiceType');
  }
}

/// Information about a wireless gateway's operation.
class WirelessGatewayStatistics {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The description of the resource.
  final String? description;

  /// The ID of the wireless gateway reporting the data.
  final String? id;

  /// The date and time when the most recent uplink was received.
  final String? lastUplinkReceivedAt;

  /// LoRaWAN gateway info.
  final LoRaWANGateway? loRaWAN;

  /// The name of the resource.
  final String? name;

  WirelessGatewayStatistics({
    this.arn,
    this.description,
    this.id,
    this.lastUplinkReceivedAt,
    this.loRaWAN,
    this.name,
  });

  factory WirelessGatewayStatistics.fromJson(Map<String, dynamic> json) {
    return WirelessGatewayStatistics(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANGateway.fromJson(json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final lastUplinkReceivedAt = this.lastUplinkReceivedAt;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastUplinkReceivedAt != null)
        'LastUplinkReceivedAt': lastUplinkReceivedAt,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
    };
  }
}

enum WirelessGatewayTaskDefinitionType {
  update,
}

extension on WirelessGatewayTaskDefinitionType {
  String toValue() {
    switch (this) {
      case WirelessGatewayTaskDefinitionType.update:
        return 'UPDATE';
    }
  }
}

extension on String {
  WirelessGatewayTaskDefinitionType toWirelessGatewayTaskDefinitionType() {
    switch (this) {
      case 'UPDATE':
        return WirelessGatewayTaskDefinitionType.update;
    }
    throw Exception(
        '$this is not known in enum WirelessGatewayTaskDefinitionType');
  }
}

enum WirelessGatewayTaskStatus {
  pending,
  inProgress,
  firstRetry,
  secondRetry,
  completed,
  failed,
}

extension on WirelessGatewayTaskStatus {
  String toValue() {
    switch (this) {
      case WirelessGatewayTaskStatus.pending:
        return 'PENDING';
      case WirelessGatewayTaskStatus.inProgress:
        return 'IN_PROGRESS';
      case WirelessGatewayTaskStatus.firstRetry:
        return 'FIRST_RETRY';
      case WirelessGatewayTaskStatus.secondRetry:
        return 'SECOND_RETRY';
      case WirelessGatewayTaskStatus.completed:
        return 'COMPLETED';
      case WirelessGatewayTaskStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  WirelessGatewayTaskStatus toWirelessGatewayTaskStatus() {
    switch (this) {
      case 'PENDING':
        return WirelessGatewayTaskStatus.pending;
      case 'IN_PROGRESS':
        return WirelessGatewayTaskStatus.inProgress;
      case 'FIRST_RETRY':
        return WirelessGatewayTaskStatus.firstRetry;
      case 'SECOND_RETRY':
        return WirelessGatewayTaskStatus.secondRetry;
      case 'COMPLETED':
        return WirelessGatewayTaskStatus.completed;
      case 'FAILED':
        return WirelessGatewayTaskStatus.failed;
    }
    throw Exception('$this is not known in enum WirelessGatewayTaskStatus');
  }
}

/// The wireless gateway type.
enum WirelessGatewayType {
  loRaWAN,
}

extension on WirelessGatewayType {
  String toValue() {
    switch (this) {
      case WirelessGatewayType.loRaWAN:
        return 'LoRaWAN';
    }
  }
}

extension on String {
  WirelessGatewayType toWirelessGatewayType() {
    switch (this) {
      case 'LoRaWAN':
        return WirelessGatewayType.loRaWAN;
    }
    throw Exception('$this is not known in enum WirelessGatewayType');
  }
}

/// WirelessMetadata object.
class WirelessMetadata {
  /// LoRaWAN device info.
  final LoRaWANSendDataToDevice? loRaWAN;

  /// The Sidewalk account credentials.
  final SidewalkSendDataToDevice? sidewalk;

  WirelessMetadata({
    this.loRaWAN,
    this.sidewalk,
  });

  factory WirelessMetadata.fromJson(Map<String, dynamic> json) {
    return WirelessMetadata(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANSendDataToDevice.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkSendDataToDevice.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    final sidewalk = this.sidewalk;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
