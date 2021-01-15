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

part '2020-11-22.g.dart';

/// AWS IoT Wireless API documentation
class IoTWireless {
  final _s.RestJsonProtocol _protocol;
  IoTWireless({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  Future<AssociateAwsAccountWithPartnerAccountResponse>
      associateAwsAccountWithPartnerAccount({
    @_s.required SidewalkAccountInfo sidewalk,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(sidewalk, 'sidewalk');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    final $payload = <String, dynamic>{
      'Sidewalk': sidewalk,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
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
    @_s.required String id,
    @_s.required String thingArn,
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
    return AssociateWirelessDeviceWithThingResponse.fromJson(response);
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
    @_s.required String id,
    @_s.required String iotCertificateId,
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
    @_s.required String id,
    @_s.required String thingArn,
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
    return AssociateWirelessGatewayWithThingResponse.fromJson(response);
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
  /// The tags to attach to the new destination. Tags are metadata that can be
  /// used to manage a resource.
  Future<CreateDestinationResponse> createDestination({
    @_s.required String expression,
    @_s.required ExpressionType expressionType,
    @_s.required String name,
    @_s.required String roleArn,
    String clientRequestToken,
    String description,
    List<Tag> tags,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-_]+''',
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
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    final $payload = <String, dynamic>{
      'Expression': expression,
      'ExpressionType': expressionType?.toValue() ?? '',
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
  /// The tags to attach to the new device profile Tags are metadata that can be
  /// used to manage a resource.
  Future<CreateDeviceProfileResponse> createDeviceProfile({
    String clientRequestToken,
    LoRaWANDeviceProfile loRaWAN,
    String name,
    List<Tag> tags,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
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
  /// The tags to attach to the new service profile. Tags are metadata that can
  /// be used to manage a resource.
  Future<CreateServiceProfileResponse> createServiceProfile({
    String clientRequestToken,
    LoRaWANServiceProfile loRaWAN,
    String name,
    List<Tag> tags,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
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
  Future<CreateWirelessDeviceResponse> createWirelessDevice({
    @_s.required String destinationName,
    @_s.required WirelessDeviceType type,
    String clientRequestToken,
    String description,
    LoRaWANDevice loRaWAN,
    String name,
  }) async {
    ArgumentError.checkNotNull(destinationName, 'destinationName');
    _s.validateStringLength(
      'destinationName',
      destinationName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'destinationName',
      destinationName,
      r'''[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
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
      'Type': type?.toValue() ?? '',
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
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
  /// The tags to attach to the new wireless gateway. Tags are metadata that can
  /// be used to manage a resource.
  Future<CreateWirelessGatewayResponse> createWirelessGateway({
    @_s.required LoRaWANGateway loRaWAN,
    String clientRequestToken,
    String description,
    String name,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(loRaWAN, 'loRaWAN');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
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
    @_s.required String id,
    @_s.required String wirelessGatewayTaskDefinitionId,
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
    _s.validateStringPattern(
      'wirelessGatewayTaskDefinitionId',
      wirelessGatewayTaskDefinitionId,
      r'''[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}''',
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
  /// Parameter [update] :
  /// Information about the gateways to update.
  Future<CreateWirelessGatewayTaskDefinitionResponse>
      createWirelessGatewayTaskDefinition({
    @_s.required bool autoCreateTasks,
    String clientRequestToken,
    String name,
    UpdateWirelessGatewayTaskCreate update,
  }) async {
    ArgumentError.checkNotNull(autoCreateTasks, 'autoCreateTasks');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/destinations/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDestinationResponse.fromJson(response);
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
    @_s.required String id,
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
    return DeleteDeviceProfileResponse.fromJson(response);
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
    @_s.required String id,
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
    return DeleteServiceProfileResponse.fromJson(response);
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
    @_s.required String id,
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
    return DeleteWirelessDeviceResponse.fromJson(response);
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
    @_s.required String id,
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
    return DeleteWirelessGatewayResponse.fromJson(response);
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
    @_s.required String id,
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
    return DeleteWirelessGatewayTaskResponse.fromJson(response);
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/wireless-gateway-task-definitions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWirelessGatewayTaskDefinitionResponse.fromJson(response);
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
    @_s.required String partnerAccountId,
    @_s.required PartnerType partnerType,
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
      if (partnerType != null) 'partnerType': [partnerType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/partner-accounts/${Uri.encodeComponent(partnerAccountId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateAwsAccountFromPartnerAccountResponse.fromJson(response);
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
    @_s.required String id,
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
    return DisassociateWirelessDeviceFromThingResponse.fromJson(response);
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
    @_s.required String id,
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
    return DisassociateWirelessGatewayFromCertificateResponse.fromJson(
        response);
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
    @_s.required String id,
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
    return DisassociateWirelessGatewayFromThingResponse.fromJson(response);
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-_]+''',
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
    @_s.required String id,
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
    @_s.required String partnerAccountId,
    @_s.required PartnerType partnerType,
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
      if (partnerType != null) 'partnerType': [partnerType.toValue()],
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
    WirelessGatewayServiceType serviceType,
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
    @_s.required String id,
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
    @_s.required String identifier,
    @_s.required WirelessDeviceIdType identifierType,
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
      if (identifierType != null) 'identifierType': [identifierType.toValue()],
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
    @_s.required String wirelessDeviceId,
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
    @_s.required String identifier,
    @_s.required WirelessGatewayIdType identifierType,
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
      if (identifierType != null) 'identifierType': [identifierType.toValue()],
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
    @_s.required String id,
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
    @_s.required String id,
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
    @_s.required String wirelessGatewayId,
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
    @_s.required String id,
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      0,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}''',
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
  /// The ARN of the resource for which to list tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
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
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    String destinationName,
    String deviceProfileId,
    int maxResults,
    String nextToken,
    String serviceProfileId,
    WirelessDeviceType wirelessDeviceType,
  }) async {
    _s.validateStringLength(
      'destinationName',
      destinationName,
      0,
      128,
    );
    _s.validateStringPattern(
      'destinationName',
      destinationName,
      r'''[a-zA-Z0-9-_]+''',
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
    int maxResults,
    String nextToken,
    WirelessGatewayTaskDefinitionType taskDefinitionType,
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
    int maxResults,
    String nextToken,
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
  /// <code>0</code> for UM (unacknowledge mode), <code>1</code> for AM
  /// (acknowledge mode), or <code>2</code> for (TM) transparent mode.
  ///
  /// Parameter [wirelessMetadata] :
  /// Metadata about the message request.
  Future<SendDataToWirelessDeviceResponse> sendDataToWirelessDevice({
    @_s.required String id,
    @_s.required String payloadData,
    @_s.required int transmitMode,
    WirelessMetadata wirelessMetadata,
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
    _s.validateStringPattern(
      'payloadData',
      payloadData,
      r'''^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$''',
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
  /// can be used to manage a resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
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
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String id,
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
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
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String name,
    String description,
    String expression,
    ExpressionType expressionType,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9-_]+''',
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
    return UpdateDestinationResponse.fromJson(response);
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
    @_s.required String partnerAccountId,
    @_s.required PartnerType partnerType,
    @_s.required SidewalkUpdateAccount sidewalk,
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
      if (partnerType != null) 'partnerType': [partnerType.toValue()],
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
    return UpdatePartnerAccountResponse.fromJson(response);
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
    @_s.required String id,
    String description,
    String destinationName,
    LoRaWANUpdateDevice loRaWAN,
    String name,
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
    _s.validateStringPattern(
      'destinationName',
      destinationName,
      r'''[a-zA-Z0-9-_]+''',
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
    return UpdateWirelessDeviceResponse.fromJson(response);
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
    @_s.required String id,
    String description,
    String name,
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
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/wireless-gateways/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWirelessGatewayResponse.fromJson(response);
  }
}

/// ABP device object for LoRaWAN specification v1.0.x
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AbpV10x {
  /// The DevAddr value.
  @_s.JsonKey(name: 'DevAddr')
  final String devAddr;

  /// Session keys for ABP v1.0.x
  @_s.JsonKey(name: 'SessionKeys')
  final SessionKeysAbpV10x sessionKeys;

  AbpV10x({
    this.devAddr,
    this.sessionKeys,
  });
  factory AbpV10x.fromJson(Map<String, dynamic> json) =>
      _$AbpV10xFromJson(json);

  Map<String, dynamic> toJson() => _$AbpV10xToJson(this);
}

/// ABP device object for LoRaWAN specification v1.1
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AbpV11 {
  /// The DevAddr value.
  @_s.JsonKey(name: 'DevAddr')
  final String devAddr;

  /// Session keys for ABP v1.1
  @_s.JsonKey(name: 'SessionKeys')
  final SessionKeysAbpV11 sessionKeys;

  AbpV11({
    this.devAddr,
    this.sessionKeys,
  });
  factory AbpV11.fromJson(Map<String, dynamic> json) => _$AbpV11FromJson(json);

  Map<String, dynamic> toJson() => _$AbpV11ToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateAwsAccountWithPartnerAccountResponse {
  /// The Sidewalk account credentials.
  @_s.JsonKey(name: 'Sidewalk')
  final SidewalkAccountInfo sidewalk;

  AssociateAwsAccountWithPartnerAccountResponse({
    this.sidewalk,
  });
  factory AssociateAwsAccountWithPartnerAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateAwsAccountWithPartnerAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateWirelessDeviceWithThingResponse {
  AssociateWirelessDeviceWithThingResponse();
  factory AssociateWirelessDeviceWithThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateWirelessDeviceWithThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateWirelessGatewayWithCertificateResponse {
  /// The ID of the certificate associated with the wireless gateway.
  @_s.JsonKey(name: 'IotCertificateId')
  final String iotCertificateId;

  AssociateWirelessGatewayWithCertificateResponse({
    this.iotCertificateId,
  });
  factory AssociateWirelessGatewayWithCertificateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateWirelessGatewayWithCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateWirelessGatewayWithThingResponse {
  AssociateWirelessGatewayWithThingResponse();
  factory AssociateWirelessGatewayWithThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateWirelessGatewayWithThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDestinationResponse {
  /// The Amazon Resource Name of the new resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the new resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  CreateDestinationResponse({
    this.arn,
    this.name,
  });
  factory CreateDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeviceProfileResponse {
  /// The Amazon Resource Name of the new resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the new device profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateDeviceProfileResponse({
    this.arn,
    this.id,
  });
  factory CreateDeviceProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeviceProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateServiceProfileResponse {
  /// The Amazon Resource Name of the new resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the new service profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateServiceProfileResponse({
    this.arn,
    this.id,
  });
  factory CreateServiceProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateServiceProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWirelessDeviceResponse {
  /// The Amazon Resource Name of the new resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the new wireless device.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateWirelessDeviceResponse({
    this.arn,
    this.id,
  });
  factory CreateWirelessDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWirelessDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWirelessGatewayResponse {
  /// The Amazon Resource Name of the new resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the new wireless gateway.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateWirelessGatewayResponse({
    this.arn,
    this.id,
  });
  factory CreateWirelessGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWirelessGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWirelessGatewayTaskDefinitionResponse {
  /// The ID of the new wireless gateway task definition.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateWirelessGatewayTaskDefinitionResponse({
    this.id,
  });
  factory CreateWirelessGatewayTaskDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateWirelessGatewayTaskDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWirelessGatewayTaskResponse {
  /// The status of the request.
  @_s.JsonKey(name: 'Status')
  final WirelessGatewayTaskStatus status;

  /// The ID of the WirelessGatewayTaskDefinition.
  @_s.JsonKey(name: 'WirelessGatewayTaskDefinitionId')
  final String wirelessGatewayTaskDefinitionId;

  CreateWirelessGatewayTaskResponse({
    this.status,
    this.wirelessGatewayTaskDefinitionId,
  });
  factory CreateWirelessGatewayTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateWirelessGatewayTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDestinationResponse {
  DeleteDestinationResponse();
  factory DeleteDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeviceProfileResponse {
  DeleteDeviceProfileResponse();
  factory DeleteDeviceProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteServiceProfileResponse {
  DeleteServiceProfileResponse();
  factory DeleteServiceProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteServiceProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWirelessDeviceResponse {
  DeleteWirelessDeviceResponse();
  factory DeleteWirelessDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteWirelessDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWirelessGatewayResponse {
  DeleteWirelessGatewayResponse();
  factory DeleteWirelessGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteWirelessGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWirelessGatewayTaskDefinitionResponse {
  DeleteWirelessGatewayTaskDefinitionResponse();
  factory DeleteWirelessGatewayTaskDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteWirelessGatewayTaskDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWirelessGatewayTaskResponse {
  DeleteWirelessGatewayTaskResponse();
  factory DeleteWirelessGatewayTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteWirelessGatewayTaskResponseFromJson(json);
}

/// Describes a destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Destinations {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The rule name or topic rule to send messages to.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// The type of value in <code>Expression</code>.
  @_s.JsonKey(name: 'ExpressionType')
  final ExpressionType expressionType;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of the IAM Role that authorizes the destination.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  Destinations({
    this.arn,
    this.description,
    this.expression,
    this.expressionType,
    this.name,
    this.roleArn,
  });
  factory Destinations.fromJson(Map<String, dynamic> json) =>
      _$DestinationsFromJson(json);
}

/// Describes a device profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceProfile {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the device profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeviceProfile({
    this.arn,
    this.id,
    this.name,
  });
  factory DeviceProfile.fromJson(Map<String, dynamic> json) =>
      _$DeviceProfileFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateAwsAccountFromPartnerAccountResponse {
  DisassociateAwsAccountFromPartnerAccountResponse();
  factory DisassociateAwsAccountFromPartnerAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateAwsAccountFromPartnerAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateWirelessDeviceFromThingResponse {
  DisassociateWirelessDeviceFromThingResponse();
  factory DisassociateWirelessDeviceFromThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateWirelessDeviceFromThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateWirelessGatewayFromCertificateResponse {
  DisassociateWirelessGatewayFromCertificateResponse();
  factory DisassociateWirelessGatewayFromCertificateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateWirelessGatewayFromCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateWirelessGatewayFromThingResponse {
  DisassociateWirelessGatewayFromThingResponse();
  factory DisassociateWirelessGatewayFromThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateWirelessGatewayFromThingResponseFromJson(json);
}

enum ExpressionType {
  @_s.JsonValue('RuleName')
  ruleName,
}

extension on ExpressionType {
  String toValue() {
    switch (this) {
      case ExpressionType.ruleName:
        return 'RuleName';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDestinationResponse {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The rule name or topic rule to send messages to.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// The type of value in <code>Expression</code>.
  @_s.JsonKey(name: 'ExpressionType')
  final ExpressionType expressionType;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of the IAM Role that authorizes the destination.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  GetDestinationResponse({
    this.arn,
    this.description,
    this.expression,
    this.expressionType,
    this.name,
    this.roleArn,
  });
  factory GetDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceProfileResponse {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the device profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the device profile.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANDeviceProfile loRaWAN;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetDeviceProfileResponse({
    this.arn,
    this.id,
    this.loRaWAN,
    this.name,
  });
  factory GetDeviceProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPartnerAccountResponse {
  /// Whether the partner account is linked to the AWS account.
  @_s.JsonKey(name: 'AccountLinked')
  final bool accountLinked;

  /// The Sidewalk account credentials.
  @_s.JsonKey(name: 'Sidewalk')
  final SidewalkAccountInfoWithFingerprint sidewalk;

  GetPartnerAccountResponse({
    this.accountLinked,
    this.sidewalk,
  });
  factory GetPartnerAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPartnerAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceEndpointResponse {
  /// The Root CA of the server trust certificate.
  @_s.JsonKey(name: 'ServerTrust')
  final String serverTrust;

  /// The service endpoint value.
  @_s.JsonKey(name: 'ServiceEndpoint')
  final String serviceEndpoint;

  /// The endpoint's service type.
  @_s.JsonKey(name: 'ServiceType')
  final WirelessGatewayServiceType serviceType;

  GetServiceEndpointResponse({
    this.serverTrust,
    this.serviceEndpoint,
    this.serviceType,
  });
  factory GetServiceEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceProfileResponse {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the service profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the service profile.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANGetServiceProfileInfo loRaWAN;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  GetServiceProfileResponse({
    this.arn,
    this.id,
    this.loRaWAN,
    this.name,
  });
  factory GetServiceProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessDeviceResponse {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the destination to which the device is assigned.
  @_s.JsonKey(name: 'DestinationName')
  final String destinationName;

  /// The ID of the wireless device.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the wireless device.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANDevice loRaWAN;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of the thing associated with the wireless device.
  @_s.JsonKey(name: 'ThingArn')
  final String thingArn;

  /// The name of the thing associated with the wireless device. The value is
  /// empty if a thing isn't associated with the device.
  @_s.JsonKey(name: 'ThingName')
  final String thingName;

  /// The wireless device type.
  @_s.JsonKey(name: 'Type')
  final WirelessDeviceType type;

  GetWirelessDeviceResponse({
    this.arn,
    this.description,
    this.destinationName,
    this.id,
    this.loRaWAN,
    this.name,
    this.thingArn,
    this.thingName,
    this.type,
  });
  factory GetWirelessDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWirelessDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessDeviceStatisticsResponse {
  /// The date and time when the most recent uplink was received.
  @_s.JsonKey(name: 'LastUplinkReceivedAt')
  final String lastUplinkReceivedAt;

  /// Information about the wireless device's operations.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANDeviceMetadata loRaWAN;

  /// The ID of the wireless device.
  @_s.JsonKey(name: 'WirelessDeviceId')
  final String wirelessDeviceId;

  GetWirelessDeviceStatisticsResponse({
    this.lastUplinkReceivedAt,
    this.loRaWAN,
    this.wirelessDeviceId,
  });
  factory GetWirelessDeviceStatisticsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetWirelessDeviceStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessGatewayCertificateResponse {
  /// The ID of the certificate associated with the wireless gateway.
  @_s.JsonKey(name: 'IotCertificateId')
  final String iotCertificateId;

  GetWirelessGatewayCertificateResponse({
    this.iotCertificateId,
  });
  factory GetWirelessGatewayCertificateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetWirelessGatewayCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessGatewayFirmwareInformationResponse {
  /// Information about the wireless gateway's firmware.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANGatewayCurrentVersion loRaWAN;

  GetWirelessGatewayFirmwareInformationResponse({
    this.loRaWAN,
  });
  factory GetWirelessGatewayFirmwareInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetWirelessGatewayFirmwareInformationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessGatewayResponse {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the wireless gateway.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the wireless gateway.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANGateway loRaWAN;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ARN of the thing associated with the wireless gateway.
  @_s.JsonKey(name: 'ThingArn')
  final String thingArn;

  /// The name of the thing associated with the wireless gateway. The value is
  /// empty if a thing isn't associated with the gateway.
  @_s.JsonKey(name: 'ThingName')
  final String thingName;

  GetWirelessGatewayResponse({
    this.arn,
    this.description,
    this.id,
    this.loRaWAN,
    this.name,
    this.thingArn,
    this.thingName,
  });
  factory GetWirelessGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWirelessGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessGatewayStatisticsResponse {
  /// The date and time when the most recent uplink was received.
  @_s.JsonKey(name: 'LastUplinkReceivedAt')
  final String lastUplinkReceivedAt;

  /// The ID of the wireless gateway.
  @_s.JsonKey(name: 'WirelessGatewayId')
  final String wirelessGatewayId;

  GetWirelessGatewayStatisticsResponse({
    this.lastUplinkReceivedAt,
    this.wirelessGatewayId,
  });
  factory GetWirelessGatewayStatisticsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetWirelessGatewayStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessGatewayTaskDefinitionResponse {
  /// Whether to automatically create tasks using this task definition for all
  /// gateways with the specified current version. If <code>false</code>, the task
  /// must me created by calling <code>CreateWirelessGatewayTask</code>.
  @_s.JsonKey(name: 'AutoCreateTasks')
  final bool autoCreateTasks;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Information about the gateways to update.
  @_s.JsonKey(name: 'Update')
  final UpdateWirelessGatewayTaskCreate update;

  GetWirelessGatewayTaskDefinitionResponse({
    this.autoCreateTasks,
    this.name,
    this.update,
  });
  factory GetWirelessGatewayTaskDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetWirelessGatewayTaskDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWirelessGatewayTaskResponse {
  /// The date and time when the most recent uplink was received.
  @_s.JsonKey(name: 'LastUplinkReceivedAt')
  final String lastUplinkReceivedAt;

  /// The status of the request.
  @_s.JsonKey(name: 'Status')
  final WirelessGatewayTaskStatus status;

  /// The date and time when the task was created.
  @_s.JsonKey(name: 'TaskCreatedAt')
  final String taskCreatedAt;

  /// The ID of the wireless gateway.
  @_s.JsonKey(name: 'WirelessGatewayId')
  final String wirelessGatewayId;

  /// The ID of the WirelessGatewayTask.
  @_s.JsonKey(name: 'WirelessGatewayTaskDefinitionId')
  final String wirelessGatewayTaskDefinitionId;

  GetWirelessGatewayTaskResponse({
    this.lastUplinkReceivedAt,
    this.status,
    this.taskCreatedAt,
    this.wirelessGatewayId,
    this.wirelessGatewayTaskDefinitionId,
  });
  factory GetWirelessGatewayTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWirelessGatewayTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDestinationsResponse {
  /// The list of destinations.
  @_s.JsonKey(name: 'DestinationList')
  final List<Destinations> destinationList;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDestinationsResponse({
    this.destinationList,
    this.nextToken,
  });
  factory ListDestinationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDestinationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeviceProfilesResponse {
  /// The list of device profiles.
  @_s.JsonKey(name: 'DeviceProfileList')
  final List<DeviceProfile> deviceProfileList;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDeviceProfilesResponse({
    this.deviceProfileList,
    this.nextToken,
  });
  factory ListDeviceProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeviceProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPartnerAccountsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The Sidewalk account credentials.
  @_s.JsonKey(name: 'Sidewalk')
  final List<SidewalkAccountInfoWithFingerprint> sidewalk;

  ListPartnerAccountsResponse({
    this.nextToken,
    this.sidewalk,
  });
  factory ListPartnerAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPartnerAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServiceProfilesResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of service profiles.
  @_s.JsonKey(name: 'ServiceProfileList')
  final List<ServiceProfile> serviceProfileList;

  ListServiceProfilesResponse({
    this.nextToken,
    this.serviceProfileList,
  });
  factory ListServiceProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServiceProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags attached to the specified resource. Tags are metadata that can be
  /// used to manage a resource
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

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
class ListWirelessDevicesResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The ID of the wireless device.
  @_s.JsonKey(name: 'WirelessDeviceList')
  final List<WirelessDeviceStatistics> wirelessDeviceList;

  ListWirelessDevicesResponse({
    this.nextToken,
    this.wirelessDeviceList,
  });
  factory ListWirelessDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWirelessDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWirelessGatewayTaskDefinitionsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of task definitions.
  @_s.JsonKey(name: 'TaskDefinitions')
  final List<UpdateWirelessGatewayTaskEntry> taskDefinitions;

  ListWirelessGatewayTaskDefinitionsResponse({
    this.nextToken,
    this.taskDefinitions,
  });
  factory ListWirelessGatewayTaskDefinitionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListWirelessGatewayTaskDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWirelessGatewaysResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The ID of the wireless gateway.
  @_s.JsonKey(name: 'WirelessGatewayList')
  final List<WirelessGatewayStatistics> wirelessGatewayList;

  ListWirelessGatewaysResponse({
    this.nextToken,
    this.wirelessGatewayList,
  });
  factory ListWirelessGatewaysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWirelessGatewaysResponseFromJson(json);
}

/// LoRaWAN object for create functions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoRaWANDevice {
  /// LoRaWAN object for create APIs
  @_s.JsonKey(name: 'AbpV1_0_x')
  final AbpV10x abpV1_0X;

  /// ABP device object for create APIs for v1.1
  @_s.JsonKey(name: 'AbpV1_1')
  final AbpV11 abpV1_1;

  /// The DevEUI value.
  @_s.JsonKey(name: 'DevEui')
  final String devEui;

  /// The ID of the device profile for the new wireless device.
  @_s.JsonKey(name: 'DeviceProfileId')
  final String deviceProfileId;

  /// OTAA device object for create APIs for v1.0.x
  @_s.JsonKey(name: 'OtaaV1_0_x')
  final OtaaV10x otaaV1_0X;

  /// OTAA device object for v1.1 for create APIs
  @_s.JsonKey(name: 'OtaaV1_1')
  final OtaaV11 otaaV1_1;

  /// The ID of the service profile.
  @_s.JsonKey(name: 'ServiceProfileId')
  final String serviceProfileId;

  LoRaWANDevice({
    this.abpV1_0X,
    this.abpV1_1,
    this.devEui,
    this.deviceProfileId,
    this.otaaV1_0X,
    this.otaaV1_1,
    this.serviceProfileId,
  });
  factory LoRaWANDevice.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$LoRaWANDeviceToJson(this);
}

/// LoRaWAN device metatdata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoRaWANDeviceMetadata {
  /// The DataRate value.
  @_s.JsonKey(name: 'DataRate')
  final int dataRate;

  /// The DevEUI value.
  @_s.JsonKey(name: 'DevEui')
  final String devEui;

  /// The FPort value.
  @_s.JsonKey(name: 'FPort')
  final int fPort;

  /// The device's channel frequency in Hz.
  @_s.JsonKey(name: 'Frequency')
  final int frequency;

  /// Information about the gateways accessed by the device.
  @_s.JsonKey(name: 'Gateways')
  final List<LoRaWANGatewayMetadata> gateways;

  /// The date and time of the metadata.
  @_s.JsonKey(name: 'Timestamp')
  final String timestamp;

  LoRaWANDeviceMetadata({
    this.dataRate,
    this.devEui,
    this.fPort,
    this.frequency,
    this.gateways,
    this.timestamp,
  });
  factory LoRaWANDeviceMetadata.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANDeviceMetadataFromJson(json);
}

/// LoRaWANDeviceProfile object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoRaWANDeviceProfile {
  /// The ClassBTimeout value.
  @_s.JsonKey(name: 'ClassBTimeout')
  final int classBTimeout;

  /// The ClassCTimeout value.
  @_s.JsonKey(name: 'ClassCTimeout')
  final int classCTimeout;

  /// The list of values that make up the FactoryPresetFreqs value.
  @_s.JsonKey(name: 'FactoryPresetFreqsList')
  final List<int> factoryPresetFreqsList;

  /// The MAC version (such as OTAA 1.1 or OTAA 1.0.3) to use with this device
  /// profile.
  @_s.JsonKey(name: 'MacVersion')
  final String macVersion;

  /// The MaxDutyCycle value.
  @_s.JsonKey(name: 'MaxDutyCycle')
  final int maxDutyCycle;

  /// The MaxEIRP value.
  @_s.JsonKey(name: 'MaxEirp')
  final int maxEirp;

  /// The PingSlotDR value.
  @_s.JsonKey(name: 'PingSlotDr')
  final int pingSlotDr;

  /// The PingSlotFreq value.
  @_s.JsonKey(name: 'PingSlotFreq')
  final int pingSlotFreq;

  /// The PingSlotPeriod value.
  @_s.JsonKey(name: 'PingSlotPeriod')
  final int pingSlotPeriod;

  /// The version of regional parameters.
  @_s.JsonKey(name: 'RegParamsRevision')
  final String regParamsRevision;

  /// The frequency band (RFRegion) value.
  @_s.JsonKey(name: 'RfRegion')
  final String rfRegion;

  /// The RXDataRate2 value.
  @_s.JsonKey(name: 'RxDataRate2')
  final int rxDataRate2;

  /// The RXDelay1 value.
  @_s.JsonKey(name: 'RxDelay1')
  final int rxDelay1;

  /// The RXDROffset1 value.
  @_s.JsonKey(name: 'RxDrOffset1')
  final int rxDrOffset1;

  /// The RXFreq2 value.
  @_s.JsonKey(name: 'RxFreq2')
  final int rxFreq2;

  /// The Supports32BitFCnt value.
  @_s.JsonKey(name: 'Supports32BitFCnt')
  final bool supports32BitFCnt;

  /// The SupportsClassB value.
  @_s.JsonKey(name: 'SupportsClassB')
  final bool supportsClassB;

  /// The SupportsClassC value.
  @_s.JsonKey(name: 'SupportsClassC')
  final bool supportsClassC;

  /// The SupportsJoin value.
  @_s.JsonKey(name: 'SupportsJoin')
  final bool supportsJoin;

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
  factory LoRaWANDeviceProfile.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANDeviceProfileFromJson(json);

  Map<String, dynamic> toJson() => _$LoRaWANDeviceProfileToJson(this);
}

/// LoRaWANGateway object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoRaWANGateway {
  /// The gateway's EUI value.
  @_s.JsonKey(name: 'GatewayEui')
  final String gatewayEui;

  /// The frequency band (RFRegion) value.
  @_s.JsonKey(name: 'RfRegion')
  final String rfRegion;

  LoRaWANGateway({
    this.gatewayEui,
    this.rfRegion,
  });
  factory LoRaWANGateway.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANGatewayFromJson(json);

  Map<String, dynamic> toJson() => _$LoRaWANGatewayToJson(this);
}

/// LoRaWANGatewayCurrentVersion object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoRaWANGatewayCurrentVersion {
  /// The version of the gateways that should receive the update.
  @_s.JsonKey(name: 'CurrentVersion')
  final LoRaWANGatewayVersion currentVersion;

  LoRaWANGatewayCurrentVersion({
    this.currentVersion,
  });
  factory LoRaWANGatewayCurrentVersion.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANGatewayCurrentVersionFromJson(json);
}

/// LoRaWAN gateway metatdata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoRaWANGatewayMetadata {
  /// The gateway's EUI value.
  @_s.JsonKey(name: 'GatewayEui')
  final String gatewayEui;

  /// The RSSI value.
  @_s.JsonKey(name: 'Rssi')
  final double rssi;

  /// The SNR value.
  @_s.JsonKey(name: 'Snr')
  final double snr;

  LoRaWANGatewayMetadata({
    this.gatewayEui,
    this.rssi,
    this.snr,
  });
  factory LoRaWANGatewayMetadata.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANGatewayMetadataFromJson(json);
}

/// LoRaWANGatewayVersion object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoRaWANGatewayVersion {
  /// The model number of the wireless gateway.
  @_s.JsonKey(name: 'Model')
  final String model;

  /// The version of the wireless gateway firmware.
  @_s.JsonKey(name: 'PackageVersion')
  final String packageVersion;

  /// The basic station version of the wireless gateway.
  @_s.JsonKey(name: 'Station')
  final String station;

  LoRaWANGatewayVersion({
    this.model,
    this.packageVersion,
    this.station,
  });
  factory LoRaWANGatewayVersion.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANGatewayVersionFromJson(json);

  Map<String, dynamic> toJson() => _$LoRaWANGatewayVersionToJson(this);
}

/// LoRaWANGetServiceProfileInfo object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoRaWANGetServiceProfileInfo {
  /// The AddGWMetaData value.
  @_s.JsonKey(name: 'AddGwMetadata')
  final bool addGwMetadata;

  /// The ChannelMask value.
  @_s.JsonKey(name: 'ChannelMask')
  final String channelMask;

  /// The DevStatusReqFreq value.
  @_s.JsonKey(name: 'DevStatusReqFreq')
  final int devStatusReqFreq;

  /// The DLBucketSize value.
  @_s.JsonKey(name: 'DlBucketSize')
  final int dlBucketSize;

  /// The DLRate value.
  @_s.JsonKey(name: 'DlRate')
  final int dlRate;

  /// The DLRatePolicy value.
  @_s.JsonKey(name: 'DlRatePolicy')
  final String dlRatePolicy;

  /// The DRMax value.
  @_s.JsonKey(name: 'DrMax')
  final int drMax;

  /// The DRMin value.
  @_s.JsonKey(name: 'DrMin')
  final int drMin;

  /// The HRAllowed value that describes whether handover roaming is allowed.
  @_s.JsonKey(name: 'HrAllowed')
  final bool hrAllowed;

  /// The MinGwDiversity value.
  @_s.JsonKey(name: 'MinGwDiversity')
  final int minGwDiversity;

  /// The NwkGeoLoc value.
  @_s.JsonKey(name: 'NwkGeoLoc')
  final bool nwkGeoLoc;

  /// The PRAllowed value that describes whether passive roaming is allowed.
  @_s.JsonKey(name: 'PrAllowed')
  final bool prAllowed;

  /// The RAAllowed value that describes whether roaming activation is allowed.
  @_s.JsonKey(name: 'RaAllowed')
  final bool raAllowed;

  /// The ReportDevStatusBattery value.
  @_s.JsonKey(name: 'ReportDevStatusBattery')
  final bool reportDevStatusBattery;

  /// The ReportDevStatusMargin value.
  @_s.JsonKey(name: 'ReportDevStatusMargin')
  final bool reportDevStatusMargin;

  /// The TargetPER value.
  @_s.JsonKey(name: 'TargetPer')
  final int targetPer;

  /// The ULBucketSize value.
  @_s.JsonKey(name: 'UlBucketSize')
  final int ulBucketSize;

  /// The ULRate value.
  @_s.JsonKey(name: 'UlRate')
  final int ulRate;

  /// The ULRatePolicy value.
  @_s.JsonKey(name: 'UlRatePolicy')
  final String ulRatePolicy;

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
  factory LoRaWANGetServiceProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANGetServiceProfileInfoFromJson(json);
}

/// LoRaWAN object for list functions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoRaWANListDevice {
  /// The DevEUI value.
  @_s.JsonKey(name: 'DevEui')
  final String devEui;

  LoRaWANListDevice({
    this.devEui,
  });
  factory LoRaWANListDevice.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANListDeviceFromJson(json);
}

/// LoRaWAN router info.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoRaWANSendDataToDevice {
  /// The Fport value.
  @_s.JsonKey(name: 'FPort')
  final int fPort;

  LoRaWANSendDataToDevice({
    this.fPort,
  });
  Map<String, dynamic> toJson() => _$LoRaWANSendDataToDeviceToJson(this);
}

/// LoRaWANServiceProfile object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoRaWANServiceProfile {
  /// The AddGWMetaData value.
  @_s.JsonKey(name: 'AddGwMetadata')
  final bool addGwMetadata;

  LoRaWANServiceProfile({
    this.addGwMetadata,
  });
  Map<String, dynamic> toJson() => _$LoRaWANServiceProfileToJson(this);
}

/// LoRaWAN object for update functions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoRaWANUpdateDevice {
  /// The ID of the device profile for the wireless device.
  @_s.JsonKey(name: 'DeviceProfileId')
  final String deviceProfileId;

  /// The ID of the service profile.
  @_s.JsonKey(name: 'ServiceProfileId')
  final String serviceProfileId;

  LoRaWANUpdateDevice({
    this.deviceProfileId,
    this.serviceProfileId,
  });
  Map<String, dynamic> toJson() => _$LoRaWANUpdateDeviceToJson(this);
}

/// LoRaWANUpdateGatewayTaskCreate object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoRaWANUpdateGatewayTaskCreate {
  /// The version of the gateways that should receive the update.
  @_s.JsonKey(name: 'CurrentVersion')
  final LoRaWANGatewayVersion currentVersion;

  /// The CRC of the signature private key to check.
  @_s.JsonKey(name: 'SigKeyCrc')
  final int sigKeyCrc;

  /// The signature used to verify the update firmware.
  @_s.JsonKey(name: 'UpdateSignature')
  final String updateSignature;

  /// The firmware version to update the gateway to.
  @_s.JsonKey(name: 'UpdateVersion')
  final LoRaWANGatewayVersion updateVersion;

  LoRaWANUpdateGatewayTaskCreate({
    this.currentVersion,
    this.sigKeyCrc,
    this.updateSignature,
    this.updateVersion,
  });
  factory LoRaWANUpdateGatewayTaskCreate.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANUpdateGatewayTaskCreateFromJson(json);

  Map<String, dynamic> toJson() => _$LoRaWANUpdateGatewayTaskCreateToJson(this);
}

/// LoRaWANUpdateGatewayTaskEntry object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoRaWANUpdateGatewayTaskEntry {
  /// The version of the gateways that should receive the update.
  @_s.JsonKey(name: 'CurrentVersion')
  final LoRaWANGatewayVersion currentVersion;

  /// The firmware version to update the gateway to.
  @_s.JsonKey(name: 'UpdateVersion')
  final LoRaWANGatewayVersion updateVersion;

  LoRaWANUpdateGatewayTaskEntry({
    this.currentVersion,
    this.updateVersion,
  });
  factory LoRaWANUpdateGatewayTaskEntry.fromJson(Map<String, dynamic> json) =>
      _$LoRaWANUpdateGatewayTaskEntryFromJson(json);
}

/// OTAA device object for v1.0.x
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OtaaV10x {
  /// The AppEUI value.
  @_s.JsonKey(name: 'AppEui')
  final String appEui;

  /// The AppKey value.
  @_s.JsonKey(name: 'AppKey')
  final String appKey;

  OtaaV10x({
    this.appEui,
    this.appKey,
  });
  factory OtaaV10x.fromJson(Map<String, dynamic> json) =>
      _$OtaaV10xFromJson(json);

  Map<String, dynamic> toJson() => _$OtaaV10xToJson(this);
}

/// OTAA device object for v1.1
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OtaaV11 {
  /// The AppKey value.
  @_s.JsonKey(name: 'AppKey')
  final String appKey;

  /// The JoinEUI value.
  @_s.JsonKey(name: 'JoinEui')
  final String joinEui;

  /// The NwkKey value.
  @_s.JsonKey(name: 'NwkKey')
  final String nwkKey;

  OtaaV11({
    this.appKey,
    this.joinEui,
    this.nwkKey,
  });
  factory OtaaV11.fromJson(Map<String, dynamic> json) =>
      _$OtaaV11FromJson(json);

  Map<String, dynamic> toJson() => _$OtaaV11ToJson(this);
}

enum PartnerType {
  @_s.JsonValue('Sidewalk')
  sidewalk,
}

extension on PartnerType {
  String toValue() {
    switch (this) {
      case PartnerType.sidewalk:
        return 'Sidewalk';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendDataToWirelessDeviceResponse {
  /// The ID of the message sent to the wireless device.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  SendDataToWirelessDeviceResponse({
    this.messageId,
  });
  factory SendDataToWirelessDeviceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SendDataToWirelessDeviceResponseFromJson(json);
}

/// Information about a service profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceProfile {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the service profile.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  ServiceProfile({
    this.arn,
    this.id,
    this.name,
  });
  factory ServiceProfile.fromJson(Map<String, dynamic> json) =>
      _$ServiceProfileFromJson(json);
}

/// Session keys for ABP v1.1
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SessionKeysAbpV10x {
  /// The AppSKey value.
  @_s.JsonKey(name: 'AppSKey')
  final String appSKey;

  /// The NwkSKey value.
  @_s.JsonKey(name: 'NwkSKey')
  final String nwkSKey;

  SessionKeysAbpV10x({
    this.appSKey,
    this.nwkSKey,
  });
  factory SessionKeysAbpV10x.fromJson(Map<String, dynamic> json) =>
      _$SessionKeysAbpV10xFromJson(json);

  Map<String, dynamic> toJson() => _$SessionKeysAbpV10xToJson(this);
}

/// Session keys for ABP v1.1
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SessionKeysAbpV11 {
  /// The AppSKey value.
  @_s.JsonKey(name: 'AppSKey')
  final String appSKey;

  /// The FNwkSIntKey value.
  @_s.JsonKey(name: 'FNwkSIntKey')
  final String fNwkSIntKey;

  /// The NwkSEncKey value.
  @_s.JsonKey(name: 'NwkSEncKey')
  final String nwkSEncKey;

  /// The SNwkSIntKey value.
  @_s.JsonKey(name: 'SNwkSIntKey')
  final String sNwkSIntKey;

  SessionKeysAbpV11({
    this.appSKey,
    this.fNwkSIntKey,
    this.nwkSEncKey,
    this.sNwkSIntKey,
  });
  factory SessionKeysAbpV11.fromJson(Map<String, dynamic> json) =>
      _$SessionKeysAbpV11FromJson(json);

  Map<String, dynamic> toJson() => _$SessionKeysAbpV11ToJson(this);
}

/// Information about a Sidewalk account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SidewalkAccountInfo {
  /// The Sidewalk Amazon ID.
  @_s.JsonKey(name: 'AmazonId')
  final String amazonId;

  /// The Sidewalk application server private key.
  @_s.JsonKey(name: 'AppServerPrivateKey')
  final String appServerPrivateKey;

  SidewalkAccountInfo({
    this.amazonId,
    this.appServerPrivateKey,
  });
  factory SidewalkAccountInfo.fromJson(Map<String, dynamic> json) =>
      _$SidewalkAccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SidewalkAccountInfoToJson(this);
}

/// Information about a Sidewalk account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SidewalkAccountInfoWithFingerprint {
  /// The Sidewalk Amazon ID.
  @_s.JsonKey(name: 'AmazonId')
  final String amazonId;

  /// Fingerprint for Sidewalk application server private key.
  @_s.JsonKey(name: 'Fingerprint')
  final String fingerprint;

  SidewalkAccountInfoWithFingerprint({
    this.amazonId,
    this.fingerprint,
  });
  factory SidewalkAccountInfoWithFingerprint.fromJson(
          Map<String, dynamic> json) =>
      _$SidewalkAccountInfoWithFingerprintFromJson(json);
}

/// Sidewalk object used by list functions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SidewalkListDevice {
  /// The Sidewalk Amazon ID.
  @_s.JsonKey(name: 'AmazonId')
  final String amazonId;

  SidewalkListDevice({
    this.amazonId,
  });
  factory SidewalkListDevice.fromJson(Map<String, dynamic> json) =>
      _$SidewalkListDeviceFromJson(json);
}

/// Information about a Sidewalk router.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SidewalkSendDataToDevice {
  /// The sequence number.
  @_s.JsonKey(name: 'Seq')
  final int seq;

  SidewalkSendDataToDevice({
    this.seq,
  });
  Map<String, dynamic> toJson() => _$SidewalkSendDataToDeviceToJson(this);
}

/// Sidewalk update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SidewalkUpdateAccount {
  /// The new Sidewalk application server private key.
  @_s.JsonKey(name: 'AppServerPrivateKey')
  final String appServerPrivateKey;

  SidewalkUpdateAccount({
    this.appServerPrivateKey,
  });
  Map<String, dynamic> toJson() => _$SidewalkUpdateAccountToJson(this);
}

/// A simple label consisting of a customer-defined key-value pair
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag's key value.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag's value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestWirelessDeviceResponse {
  /// The result returned by the test.
  @_s.JsonKey(name: 'Result')
  final String result;

  TestWirelessDeviceResponse({
    this.result,
  });
  factory TestWirelessDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$TestWirelessDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDestinationResponse {
  UpdateDestinationResponse();
  factory UpdateDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePartnerAccountResponse {
  UpdatePartnerAccountResponse();
  factory UpdatePartnerAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePartnerAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWirelessDeviceResponse {
  UpdateWirelessDeviceResponse();
  factory UpdateWirelessDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWirelessDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWirelessGatewayResponse {
  UpdateWirelessGatewayResponse();
  factory UpdateWirelessGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWirelessGatewayResponseFromJson(json);
}

/// UpdateWirelessGatewayTaskCreate object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UpdateWirelessGatewayTaskCreate {
  /// The properties that relate to the LoRaWAN wireless gateway.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANUpdateGatewayTaskCreate loRaWAN;

  /// The IAM role used to read data from the S3 bucket.
  @_s.JsonKey(name: 'UpdateDataRole')
  final String updateDataRole;

  /// The link to the S3 bucket.
  @_s.JsonKey(name: 'UpdateDataSource')
  final String updateDataSource;

  UpdateWirelessGatewayTaskCreate({
    this.loRaWAN,
    this.updateDataRole,
    this.updateDataSource,
  });
  factory UpdateWirelessGatewayTaskCreate.fromJson(Map<String, dynamic> json) =>
      _$UpdateWirelessGatewayTaskCreateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateWirelessGatewayTaskCreateToJson(this);
}

/// UpdateWirelessGatewayTaskEntry object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWirelessGatewayTaskEntry {
  /// The ID of the new wireless gateway task entry.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The properties that relate to the LoRaWAN wireless gateway.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANUpdateGatewayTaskEntry loRaWAN;

  UpdateWirelessGatewayTaskEntry({
    this.id,
    this.loRaWAN,
  });
  factory UpdateWirelessGatewayTaskEntry.fromJson(Map<String, dynamic> json) =>
      _$UpdateWirelessGatewayTaskEntryFromJson(json);
}

enum WirelessDeviceIdType {
  @_s.JsonValue('WirelessDeviceId')
  wirelessDeviceId,
  @_s.JsonValue('DevEui')
  devEui,
  @_s.JsonValue('ThingName')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a wireless device's operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WirelessDeviceStatistics {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the destination to which the device is assigned.
  @_s.JsonKey(name: 'DestinationName')
  final String destinationName;

  /// The ID of the wireless device reporting the data.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time when the most recent uplink was received.
  @_s.JsonKey(name: 'LastUplinkReceivedAt')
  final String lastUplinkReceivedAt;

  /// LoRaWAN device info.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANListDevice loRaWAN;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Sidewalk account credentials.
  @_s.JsonKey(name: 'Sidewalk')
  final SidewalkListDevice sidewalk;

  /// The wireless device type.
  @_s.JsonKey(name: 'Type')
  final WirelessDeviceType type;

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
  factory WirelessDeviceStatistics.fromJson(Map<String, dynamic> json) =>
      _$WirelessDeviceStatisticsFromJson(json);
}

enum WirelessDeviceType {
  @_s.JsonValue('Sidewalk')
  sidewalk,
  @_s.JsonValue('LoRaWAN')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum WirelessGatewayIdType {
  @_s.JsonValue('GatewayEui')
  gatewayEui,
  @_s.JsonValue('WirelessGatewayId')
  wirelessGatewayId,
  @_s.JsonValue('ThingName')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum WirelessGatewayServiceType {
  @_s.JsonValue('CUPS')
  cups,
  @_s.JsonValue('LNS')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a wireless gateway's operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WirelessGatewayStatistics {
  /// The Amazon Resource Name of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the resource.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the wireless gateway reporting the data.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time when the most recent uplink was received.
  @_s.JsonKey(name: 'LastUplinkReceivedAt')
  final String lastUplinkReceivedAt;

  /// LoRaWAN gateway info.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANGateway loRaWAN;

  /// The name of the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  WirelessGatewayStatistics({
    this.arn,
    this.description,
    this.id,
    this.lastUplinkReceivedAt,
    this.loRaWAN,
    this.name,
  });
  factory WirelessGatewayStatistics.fromJson(Map<String, dynamic> json) =>
      _$WirelessGatewayStatisticsFromJson(json);
}

enum WirelessGatewayTaskDefinitionType {
  @_s.JsonValue('UPDATE')
  update,
}

extension on WirelessGatewayTaskDefinitionType {
  String toValue() {
    switch (this) {
      case WirelessGatewayTaskDefinitionType.update:
        return 'UPDATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum WirelessGatewayTaskStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FIRST_RETRY')
  firstRetry,
  @_s.JsonValue('SECOND_RETRY')
  secondRetry,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

/// WirelessMetadata object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WirelessMetadata {
  /// LoRaWAN device info.
  @_s.JsonKey(name: 'LoRaWAN')
  final LoRaWANSendDataToDevice loRaWAN;

  /// The Sidewalk account credentials.
  @_s.JsonKey(name: 'Sidewalk')
  final SidewalkSendDataToDevice sidewalk;

  WirelessMetadata({
    this.loRaWAN,
    this.sidewalk,
  });
  Map<String, dynamic> toJson() => _$WirelessMetadataToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
