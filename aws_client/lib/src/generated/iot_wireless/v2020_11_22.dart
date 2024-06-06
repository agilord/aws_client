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

/// AWS IoT Wireless provides bi-directional communication between
/// internet-connected wireless devices and the AWS Cloud. To onboard both
/// LoRaWAN and Sidewalk devices to AWS IoT, use the IoT Wireless API. These
/// wireless devices use the Low Power Wide Area Networking (LPWAN)
/// communication protocol to communicate with AWS IoT.
///
/// Using the API, you can perform create, read, update, and delete operations
/// for your wireless devices, gateways, destinations, and profiles. After
/// onboarding your devices, you can use the API operations to set log levels
/// and monitor your devices with CloudWatch.
///
/// You can also use the API operations to create multicast groups and schedule
/// a multicast session for sending a downlink message to devices in the group.
/// By using Firmware Updates Over-The-Air (FUOTA) API operations, you can
/// create a FUOTA task and schedule a session to update the firmware of
/// individual devices or an entire group of devices in a multicast group.
///
/// To connect to the AWS IoT Wireless Service, use the Service endpoints as
/// described in <a
/// href="https://docs.aws.amazon.com/general/latest/gr/iot-lorawan.html#iot-wireless_region">IoT
/// Wireless Service endpoints</a> in the <i>AWS General Reference</i>.
class IoTWireless {
  final _s.RestJsonProtocol _protocol;
  IoTWireless({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
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

  /// Associate a multicast group with a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> associateMulticastGroupWithFuotaTask({
    required String id,
    required String multicastGroupId,
  }) async {
    final $payload = <String, dynamic>{
      'MulticastGroupId': multicastGroupId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}/multicast-group',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associate a wireless device with a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> associateWirelessDeviceWithFuotaTask({
    required String id,
    required String wirelessDeviceId,
  }) async {
    final $payload = <String, dynamic>{
      'WirelessDeviceId': wirelessDeviceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}/wireless-device',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a wireless device with a multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> associateWirelessDeviceWithMulticastGroup({
    required String id,
    required String wirelessDeviceId,
  }) async {
    final $payload = <String, dynamic>{
      'WirelessDeviceId': wirelessDeviceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/multicast-groups/${Uri.encodeComponent(id)}/wireless-device',
      exceptionFnMap: _exceptionFns,
    );
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

  /// Cancels an existing multicast group session.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> cancelMulticastGroupSession({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}/session',
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
  ///
  /// Parameter [loRaWAN] :
  /// The device profile information to use to create the device profile.
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [sidewalk] :
  /// The Sidewalk-related information for creating the Sidewalk device profile.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the new device profile. Tags are metadata that you
  /// can use to manage a resource.
  Future<CreateDeviceProfileResponse> createDeviceProfile({
    String? clientRequestToken,
    LoRaWANDeviceProfile? loRaWAN,
    String? name,
    SidewalkCreateDeviceProfile? sidewalk,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (sidewalk != null) 'Sidewalk': sidewalk,
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

  /// Creates a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<CreateFuotaTaskResponse> createFuotaTask({
    required String firmwareUpdateImage,
    required String firmwareUpdateRole,
    String? clientRequestToken,
    String? description,
    int? fragmentIntervalMS,
    int? fragmentSizeBytes,
    LoRaWANFuotaTask? loRaWAN,
    String? name,
    int? redundancyPercent,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'fragmentIntervalMS',
      fragmentIntervalMS,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'fragmentSizeBytes',
      fragmentSizeBytes,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'redundancyPercent',
      redundancyPercent,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'FirmwareUpdateImage': firmwareUpdateImage,
      'FirmwareUpdateRole': firmwareUpdateRole,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (fragmentIntervalMS != null) 'FragmentIntervalMS': fragmentIntervalMS,
      if (fragmentSizeBytes != null) 'FragmentSizeBytes': fragmentSizeBytes,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (redundancyPercent != null) 'RedundancyPercent': redundancyPercent,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/fuota-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFuotaTaskResponse.fromJson(response);
  }

  /// Creates a multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientRequestToken] :
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
  ///
  /// Parameter [description] :
  /// The description of the multicast group.
  Future<CreateMulticastGroupResponse> createMulticastGroup({
    required LoRaWANMulticast loRaWAN,
    String? clientRequestToken,
    String? description,
    String? name,
    List<Tag>? tags,
  }) async {
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
      requestUri: '/multicast-groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMulticastGroupResponse.fromJson(response);
  }

  /// Creates a new network analyzer configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [multicastGroups] :
  /// Multicast Group resources to add to the network analyzer configruation.
  /// Provide the <code>MulticastGroupId</code> of the resource to add in the
  /// input array.
  ///
  /// Parameter [wirelessDevices] :
  /// Wireless device resources to add to the network analyzer configuration.
  /// Provide the <code>WirelessDeviceId</code> of the resource to add in the
  /// input array.
  ///
  /// Parameter [wirelessGateways] :
  /// Wireless gateway resources to add to the network analyzer configuration.
  /// Provide the <code>WirelessGatewayId</code> of the resource to add in the
  /// input array.
  Future<CreateNetworkAnalyzerConfigurationResponse>
      createNetworkAnalyzerConfiguration({
    required String name,
    String? clientRequestToken,
    String? description,
    List<String>? multicastGroups,
    List<Tag>? tags,
    TraceContent? traceContent,
    List<String>? wirelessDevices,
    List<String>? wirelessGateways,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (multicastGroups != null) 'MulticastGroups': multicastGroups,
      if (tags != null) 'Tags': tags,
      if (traceContent != null) 'TraceContent': traceContent,
      if (wirelessDevices != null) 'WirelessDevices': wirelessDevices,
      if (wirelessGateways != null) 'WirelessGateways': wirelessGateways,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-analyzer-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkAnalyzerConfigurationResponse.fromJson(response);
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
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
  /// Parameter [positioning] :
  /// FPort values for the GNSS, stream, and ClockSync functions of the
  /// positioning information.
  ///
  /// Parameter [sidewalk] :
  /// The device configuration information to use to create the Sidewalk device.
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
    PositioningConfigStatus? positioning,
    SidewalkCreateWirelessDevice? sidewalk,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationName': destinationName,
      'Type': type.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (positioning != null) 'Positioning': positioning.toValue(),
      if (sidewalk != null) 'Sidewalk': sidewalk,
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
  /// <note>
  /// When provisioning a wireless gateway, you might run into duplication
  /// errors for the following reasons.
  ///
  /// <ul>
  /// <li>
  /// If you specify a <code>GatewayEui</code> value that already exists.
  /// </li>
  /// <li>
  /// If you used a <code>ClientRequestToken</code> with the same parameters
  /// within the last 10 minutes.
  /// </li>
  /// </ul>
  /// To avoid this error, make sure that you use unique identifiers and
  /// parameters for each request within the specified time period.
  /// </note>
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
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
  /// Each resource must have a unique client request token. The client token is
  /// used to implement idempotency. It ensures that the request completes no
  /// more than one time. If you retry a request with the same token and the
  /// same parameters, the request will complete successfully. However, if you
  /// try to create a new resource using the same token but different
  /// parameters, an HTTP 409 conflict occurs. If you omit this value, AWS SDKs
  /// will automatically generate a unique client request. For more information
  /// about idempotency, see <a
  /// href="https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html">Ensuring
  /// idempotency in Amazon EC2 API requests</a>.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/device-profiles/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> deleteFuotaTask({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a multicast group if it is not in use by a fuota task.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> deleteMulticastGroup({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a network analyzer configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  Future<void> deleteNetworkAnalyzerConfiguration({
    required String configurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/network-analyzer-configurations/${Uri.encodeComponent(configurationName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove queued messages from the downlink queue.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The ID of a given wireless device for which downlink messages will be
  /// deleted.
  ///
  /// Parameter [messageId] :
  /// If message ID is <code>"*"</code>, it cleares the entire downlink queue
  /// for a given device, specified by the wireless device ID. Otherwise, the
  /// downlink message with the specified message ID will be deleted.
  ///
  /// Parameter [wirelessDeviceType] :
  /// The wireless device type, which can be either Sidewalk or LoRaWAN.
  Future<void> deleteQueuedMessages({
    required String id,
    required String messageId,
    WirelessDeviceType? wirelessDeviceType,
  }) async {
    final $query = <String, List<String>>{
      'messageId': [messageId],
      if (wirelessDeviceType != null)
        'WirelessDeviceType': [wirelessDeviceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}/data',
      queryParams: $query,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete an import task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the import task to be deleted.
  Future<void> deleteWirelessDeviceImportTask({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/wireless_device_import_task/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a wireless gateway.
  /// <note>
  /// When deleting a wireless gateway, you might run into duplication errors
  /// for the following reasons.
  ///
  /// <ul>
  /// <li>
  /// If you specify a <code>GatewayEui</code> value that already exists.
  /// </li>
  /// <li>
  /// If you used a <code>ClientRequestToken</code> with the same parameters
  /// within the last 10 minutes.
  /// </li>
  /// </ul>
  /// To avoid this error, make sure that you use unique identifiers and
  /// parameters for each request within the specified time period.
  /// </note>
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/wireless-gateway-task-definitions/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregister a wireless device from AWS IoT Wireless.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// The identifier of the wireless device to deregister from AWS IoT Wireless.
  ///
  /// Parameter [wirelessDeviceType] :
  /// The type of wireless device to deregister from AWS IoT Wireless, which can
  /// be <code>LoRaWAN</code> or <code>Sidewalk</code>.
  Future<void> deregisterWirelessDevice({
    required String identifier,
    WirelessDeviceType? wirelessDeviceType,
  }) async {
    final $query = <String, List<String>>{
      if (wirelessDeviceType != null)
        'WirelessDeviceType': [wirelessDeviceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/wireless-devices/${Uri.encodeComponent(identifier)}/deregister',
      queryParams: $query,
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

  /// Disassociates a multicast group from a fuota task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  Future<void> disassociateMulticastGroupFromFuotaTask({
    required String id,
    required String multicastGroupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/fuota-tasks/${Uri.encodeComponent(id)}/multicast-groups/${Uri.encodeComponent(multicastGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a wireless device from a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> disassociateWirelessDeviceFromFuotaTask({
    required String id,
    required String wirelessDeviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/fuota-tasks/${Uri.encodeComponent(id)}/wireless-devices/${Uri.encodeComponent(wirelessDeviceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a wireless device from a multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> disassociateWirelessDeviceFromMulticastGroup({
    required String id,
    required String wirelessDeviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/multicast-groups/${Uri.encodeComponent(id)}/wireless-devices/${Uri.encodeComponent(wirelessDeviceId)}',
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/device-profiles/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceProfileResponse.fromJson(response);
  }

  /// Get the event configuration based on resource types.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<GetEventConfigurationByResourceTypesResponse>
      getEventConfigurationByResourceTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-configurations-resource-types',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventConfigurationByResourceTypesResponse.fromJson(response);
  }

  /// Gets information about a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetFuotaTaskResponse> getFuotaTask({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFuotaTaskResponse.fromJson(response);
  }

  /// Returns current default log levels or log levels by resource types. Based
  /// on resource types, log levels can be for wireless device log options or
  /// wireless gateway log options.
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

  /// Get the metric configuration status for this AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetMetricConfigurationResponse> getMetricConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metric-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetricConfigurationResponse.fromJson(response);
  }

  /// Get the summary metrics for this AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [summaryMetricQueries] :
  /// The list of queries to retrieve the summary metrics.
  Future<GetMetricsResponse> getMetrics({
    List<SummaryMetricQuery>? summaryMetricQueries,
  }) async {
    final $payload = <String, dynamic>{
      if (summaryMetricQueries != null)
        'SummaryMetricQueries': summaryMetricQueries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metrics',
      exceptionFnMap: _exceptionFns,
    );
    return GetMetricsResponse.fromJson(response);
  }

  /// Gets information about a multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetMulticastGroupResponse> getMulticastGroup({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMulticastGroupResponse.fromJson(response);
  }

  /// Gets information about a multicast group session.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetMulticastGroupSessionResponse> getMulticastGroupSession({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}/session',
      exceptionFnMap: _exceptionFns,
    );
    return GetMulticastGroupSessionResponse.fromJson(response);
  }

  /// Get network analyzer configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetNetworkAnalyzerConfigurationResponse>
      getNetworkAnalyzerConfiguration({
    required String configurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/network-analyzer-configurations/${Uri.encodeComponent(configurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkAnalyzerConfigurationResponse.fromJson(response);
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

  /// Get the position information for a given resource.
  /// <important>
  /// This action is no longer supported. Calls to retrieve the position
  /// information should use the <a
  /// href="https://docs.aws.amazon.com/iot-wireless/2020-11-22/apireference/API_GetResourcePosition.html">GetResourcePosition</a>
  /// API operation instead.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// Resource identifier used to retrieve the position information.
  ///
  /// Parameter [resourceType] :
  /// Resource type of the resource for which position information is retrieved.
  @Deprecated('This operation is no longer supported.')
  Future<GetPositionResponse> getPosition({
    required String resourceIdentifier,
    required PositionResourceType resourceType,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/positions/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPositionResponse.fromJson(response);
  }

  /// Get position configuration for a given resource.
  /// <important>
  /// This action is no longer supported. Calls to retrieve the position
  /// configuration should use the <a
  /// href="https://docs.aws.amazon.com/iot-wireless/2020-11-22/apireference/API_GetResourcePosition.html">GetResourcePosition</a>
  /// API operation instead.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// Resource identifier used in a position configuration.
  ///
  /// Parameter [resourceType] :
  /// Resource type of the resource for which position configuration is
  /// retrieved.
  @Deprecated('This operation is no longer supported.')
  Future<GetPositionConfigurationResponse> getPositionConfiguration({
    required String resourceIdentifier,
    required PositionResourceType resourceType,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/position-configurations/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPositionConfigurationResponse.fromJson(response);
  }

  /// Get estimated position information as a payload in GeoJSON format. The
  /// payload measurement data is resolved using solvers that are provided by
  /// third-party vendors.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [cellTowers] :
  /// Retrieves an estimated device position by resolving measurement data from
  /// cellular radio towers. The position is resolved using HERE's
  /// cellular-based solver.
  ///
  /// Parameter [gnss] :
  /// Retrieves an estimated device position by resolving the global navigation
  /// satellite system (GNSS) scan data. The position is resolved using the GNSS
  /// solver powered by LoRa Cloud.
  ///
  /// Parameter [ip] :
  /// Retrieves an estimated device position by resolving the IP address
  /// information from the device. The position is resolved using MaxMind's
  /// IP-based solver.
  ///
  /// Parameter [timestamp] :
  /// Optional information that specifies the time when the position information
  /// will be resolved. It uses the Unix timestamp format. If not specified, the
  /// time at which the request was received will be used.
  ///
  /// Parameter [wiFiAccessPoints] :
  /// Retrieves an estimated device position by resolving WLAN measurement data.
  /// The position is resolved using HERE's Wi-Fi based solver.
  Future<GetPositionEstimateResponse> getPositionEstimate({
    CellTowers? cellTowers,
    Gnss? gnss,
    Ip? ip,
    DateTime? timestamp,
    List<WiFiAccessPoint>? wiFiAccessPoints,
  }) async {
    final $payload = <String, dynamic>{
      if (cellTowers != null) 'CellTowers': cellTowers,
      if (gnss != null) 'Gnss': gnss,
      if (ip != null) 'Ip': ip,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (wiFiAccessPoints != null) 'WiFiAccessPoints': wiFiAccessPoints,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/position-estimate',
      exceptionFnMap: _exceptionFns,
    );
    return GetPositionEstimateResponse(
      geoJsonPayload: await response.stream.toBytes(),
    );
  }

  /// Get the event configuration for a particular resource identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identifier] :
  /// Resource identifier to opt in for event messaging.
  ///
  /// Parameter [identifierType] :
  /// Identifier type of the particular resource identifier for event
  /// configuration.
  ///
  /// Parameter [partnerType] :
  /// Partner type of the resource if the identifier type is
  /// <code>PartnerAccountId</code>.
  Future<GetResourceEventConfigurationResponse> getResourceEventConfiguration({
    required String identifier,
    required IdentifierType identifierType,
    EventNotificationPartnerType? partnerType,
  }) async {
    final $query = <String, List<String>>{
      'identifierType': [identifierType.toValue()],
      if (partnerType != null) 'partnerType': [partnerType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-configurations/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceEventConfigurationResponse.fromJson(response);
  }

  /// Fetches the log-level override, if any, for a given resource-ID and
  /// resource-type. It can be used for a wireless device or a wireless gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The type of the resource, which can be <code>WirelessDevice</code> or
  /// <code>WirelessGateway</code>.
  Future<GetResourceLogLevelResponse> getResourceLogLevel({
    required String resourceIdentifier,
    required String resourceType,
  }) async {
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

  /// Get the position information for a given wireless device or a wireless
  /// gateway resource. The position information uses the <a
  /// href="https://gisgeography.com/wgs84-world-geodetic-system/"> World
  /// Geodetic System (WGS84)</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier of the resource for which position information is
  /// retrieved. It can be the wireless device ID or the wireless gateway ID,
  /// depending on the resource type.
  ///
  /// Parameter [resourceType] :
  /// The type of resource for which position information is retrieved, which
  /// can be a wireless device or a wireless gateway.
  Future<GetResourcePositionResponse> getResourcePosition({
    required String resourceIdentifier,
    required PositionResourceType resourceType,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/resource-positions/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePositionResponse(
      geoJsonPayload: await response.stream.toBytes(),
    );
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
  /// <code>LNS</code> for the LoRaWAN Network Server endpoint or
  /// <code>CLAIM</code> for the global endpoint.
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

  /// Get information about an import task and count of device onboarding
  /// summary information for the import task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The identifier of the import task for which information is requested.
  Future<GetWirelessDeviceImportTaskResponse> getWirelessDeviceImportTask({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless_device_import_task/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWirelessDeviceImportTaskResponse.fromJson(response);
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
  /// Parameter [deviceProfileType] :
  /// A filter to list only device profiles that use this type, which can be
  /// <code>LoRaWAN</code> or <code>Sidewalk</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListDeviceProfilesResponse> listDeviceProfiles({
    DeviceProfileType? deviceProfileType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (deviceProfileType != null)
        'deviceProfileType': [deviceProfileType.toValue()],
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

  /// List the Sidewalk devices in an import task and their onboarding status.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The identifier of the import task for which wireless devices are listed.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <code>null</code> to receive the first set
  /// of results.
  ///
  /// Parameter [status] :
  /// The status of the devices in the import task.
  Future<ListDevicesForWirelessDeviceImportTaskResponse>
      listDevicesForWirelessDeviceImportTask({
    required String id,
    int? maxResults,
    String? nextToken,
    OnboardStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      'id': [id],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless_device_import_task',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesForWirelessDeviceImportTaskResponse.fromJson(response);
  }

  /// List event configurations where at least one event topic has been enabled.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceType] :
  /// Resource type to filter event configurations.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListEventConfigurationsResponse> listEventConfigurations({
    required EventNotificationResourceType resourceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventConfigurationsResponse.fromJson(response);
  }

  /// Lists the FUOTA tasks registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListFuotaTasksResponse> listFuotaTasks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/fuota-tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFuotaTasksResponse.fromJson(response);
  }

  /// Lists the multicast groups registered to your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListMulticastGroupsResponse> listMulticastGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/multicast-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMulticastGroupsResponse.fromJson(response);
  }

  /// List all multicast groups associated with a fuota task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListMulticastGroupsByFuotaTaskResponse>
      listMulticastGroupsByFuotaTask({
    required String id,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}/multicast-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMulticastGroupsByFuotaTaskResponse.fromJson(response);
  }

  /// Lists the network analyzer configurations.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListNetworkAnalyzerConfigurationsResponse>
      listNetworkAnalyzerConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/network-analyzer-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkAnalyzerConfigurationsResponse.fromJson(response);
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

  /// List position configurations for a given resource, such as positioning
  /// solvers.
  /// <important>
  /// This action is no longer supported. Calls to retrieve position information
  /// should use the <a
  /// href="https://docs.aws.amazon.com/iot-wireless/2020-11-22/apireference/API_GetResourcePosition.html">GetResourcePosition</a>
  /// API operation instead.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [resourceType] :
  /// Resource type for which position configurations are listed.
  @Deprecated('This operation is no longer supported.')
  Future<ListPositionConfigurationsResponse> listPositionConfigurations({
    int? maxResults,
    String? nextToken,
    PositionResourceType? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/position-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPositionConfigurationsResponse.fromJson(response);
  }

  /// List queued messages in the downlink queue.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The ID of a given wireless device which the downlink message packets are
  /// being sent.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [wirelessDeviceType] :
  /// The wireless device type, whic can be either Sidewalk or LoRaWAN.
  Future<ListQueuedMessagesResponse> listQueuedMessages({
    required String id,
    int? maxResults,
    String? nextToken,
    WirelessDeviceType? wirelessDeviceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (wirelessDeviceType != null)
        'WirelessDeviceType': [wirelessDeviceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}/data',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueuedMessagesResponse.fromJson(response);
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

  /// List wireless devices that have been added to an import task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <code>null</code> to receive the first set
  /// of results.
  Future<ListWirelessDeviceImportTasksResponse> listWirelessDeviceImportTasks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/wireless_device_import_tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWirelessDeviceImportTasksResponse.fromJson(response);
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
    String? fuotaTaskId,
    int? maxResults,
    String? multicastGroupId,
    String? nextToken,
    String? serviceProfileId,
    WirelessDeviceType? wirelessDeviceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      250,
    );
    final $query = <String, List<String>>{
      if (destinationName != null) 'destinationName': [destinationName],
      if (deviceProfileId != null) 'deviceProfileId': [deviceProfileId],
      if (fuotaTaskId != null) 'fuotaTaskId': [fuotaTaskId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (multicastGroupId != null) 'multicastGroupId': [multicastGroupId],
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

  /// Put position configuration for a given resource.
  /// <important>
  /// This action is no longer supported. Calls to update the position
  /// configuration should use the <a
  /// href="https://docs.aws.amazon.com/iot-wireless/2020-11-22/apireference/API_UpdateResourcePosition.html">UpdateResourcePosition</a>
  /// API operation instead.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// Resource identifier used to update the position configuration.
  ///
  /// Parameter [resourceType] :
  /// Resource type of the resource for which you want to update the position
  /// configuration.
  ///
  /// Parameter [destination] :
  /// The position data destination that describes the AWS IoT rule that
  /// processes the device's position data for use by AWS IoT Core for LoRaWAN.
  ///
  /// Parameter [solvers] :
  /// The positioning solvers used to update the position configuration of the
  /// resource.
  @Deprecated('This operation is no longer supported.')
  Future<void> putPositionConfiguration({
    required String resourceIdentifier,
    required PositionResourceType resourceType,
    String? destination,
    PositionSolverConfigurations? solvers,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final $payload = <String, dynamic>{
      if (destination != null) 'Destination': destination,
      if (solvers != null) 'Solvers': solvers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/position-configurations/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the log-level override for a resource-ID and resource-type. This
  /// option can be specified for a wireless gateway or a wireless device. A
  /// limit of 200 log level override can be set per account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The type of the resource, which can be <code>WirelessDevice</code> or
  /// <code>WirelessGateway</code>.
  Future<void> putResourceLogLevel({
    required LogLevel logLevel,
    required String resourceIdentifier,
    required String resourceType,
  }) async {
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

  /// Removes the log-level overrides for all resources; both wireless devices
  /// and wireless gateways.
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

  /// Removes the log-level override, if any, for a specific resource-ID and
  /// resource-type. It can be used for a wireless device or a wireless gateway.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The type of the resource, which can be <code>WirelessDevice</code> or
  /// <code>WirelessGateway</code>.
  Future<void> resetResourceLogLevel({
    required String resourceIdentifier,
    required String resourceType,
  }) async {
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

  /// Sends the specified data to a multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<SendDataToMulticastGroupResponse> sendDataToMulticastGroup({
    required String id,
    required String payloadData,
    required MulticastWirelessMetadata wirelessMetadata,
  }) async {
    final $payload = <String, dynamic>{
      'PayloadData': payloadData,
      'WirelessMetadata': wirelessMetadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}/data',
      exceptionFnMap: _exceptionFns,
    );
    return SendDataToMulticastGroupResponse.fromJson(response);
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

  /// Starts a bulk association of all qualifying wireless devices with a
  /// multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> startBulkAssociateWirelessDeviceWithMulticastGroup({
    required String id,
    String? queryString,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (queryString != null) 'QueryString': queryString,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}/bulk',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a bulk disassociatin of all qualifying wireless devices from a
  /// multicast group.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> startBulkDisassociateWirelessDeviceFromMulticastGroup({
    required String id,
    String? queryString,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (queryString != null) 'QueryString': queryString,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}/bulk',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  Future<void> startFuotaTask({
    required String id,
    LoRaWANStartFuotaTask? loRaWAN,
  }) async {
    final $payload = <String, dynamic>{
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a multicast group session.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> startMulticastGroupSession({
    required String id,
    required LoRaWANMulticastSession loRaWAN,
  }) async {
    final $payload = <String, dynamic>{
      'LoRaWAN': loRaWAN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}/session',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Start import task for a single wireless device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [destinationName] :
  /// The name of the Sidewalk destination that describes the IoT rule to route
  /// messages from the device in the import task that will be onboarded to AWS
  /// IoT Wireless.
  ///
  /// Parameter [sidewalk] :
  /// The Sidewalk-related parameters for importing a single wireless device.
  ///
  /// Parameter [deviceName] :
  /// The name of the wireless device for which an import task is being started.
  Future<StartSingleWirelessDeviceImportTaskResponse>
      startSingleWirelessDeviceImportTask({
    required String destinationName,
    required SidewalkSingleStartImportInfo sidewalk,
    String? clientRequestToken,
    String? deviceName,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationName': destinationName,
      'Sidewalk': sidewalk,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (deviceName != null) 'DeviceName': deviceName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless_single_device_import_task',
      exceptionFnMap: _exceptionFns,
    );
    return StartSingleWirelessDeviceImportTaskResponse.fromJson(response);
  }

  /// Start import task for provisioning Sidewalk devices in bulk using an S3
  /// CSV file.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [destinationName] :
  /// The name of the Sidewalk destination that describes the IoT rule to route
  /// messages from the devices in the import task that are onboarded to AWS IoT
  /// Wireless.
  ///
  /// Parameter [sidewalk] :
  /// The Sidewalk-related parameters for importing wireless devices that need
  /// to be provisioned in bulk.
  Future<StartWirelessDeviceImportTaskResponse> startWirelessDeviceImportTask({
    required String destinationName,
    required SidewalkStartImportInfo sidewalk,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationName': destinationName,
      'Sidewalk': sidewalk,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/wireless_device_import_task',
      exceptionFnMap: _exceptionFns,
    );
    return StartWirelessDeviceImportTaskResponse.fromJson(response);
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

  /// Update the event configuration based on resource types.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionStatus] :
  /// Connection status resource type event configuration object for enabling
  /// and disabling wireless gateway topic.
  ///
  /// Parameter [deviceRegistrationState] :
  /// Device registration state resource type event configuration object for
  /// enabling and disabling wireless gateway topic.
  ///
  /// Parameter [join] :
  /// Join resource type event configuration object for enabling and disabling
  /// wireless device topic.
  ///
  /// Parameter [messageDeliveryStatus] :
  /// Message delivery status resource type event configuration object for
  /// enabling and disabling wireless device topic.
  ///
  /// Parameter [proximity] :
  /// Proximity resource type event configuration object for enabling and
  /// disabling wireless gateway topic.
  Future<void> updateEventConfigurationByResourceTypes({
    ConnectionStatusResourceTypeEventConfiguration? connectionStatus,
    DeviceRegistrationStateResourceTypeEventConfiguration?
        deviceRegistrationState,
    JoinResourceTypeEventConfiguration? join,
    MessageDeliveryStatusResourceTypeEventConfiguration? messageDeliveryStatus,
    ProximityResourceTypeEventConfiguration? proximity,
  }) async {
    final $payload = <String, dynamic>{
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (deviceRegistrationState != null)
        'DeviceRegistrationState': deviceRegistrationState,
      if (join != null) 'Join': join,
      if (messageDeliveryStatus != null)
        'MessageDeliveryStatus': messageDeliveryStatus,
      if (proximity != null) 'Proximity': proximity,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/event-configurations-resource-types',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties of a FUOTA task.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> updateFuotaTask({
    required String id,
    String? description,
    String? firmwareUpdateImage,
    String? firmwareUpdateRole,
    int? fragmentIntervalMS,
    int? fragmentSizeBytes,
    LoRaWANFuotaTask? loRaWAN,
    String? name,
    int? redundancyPercent,
  }) async {
    _s.validateNumRange(
      'fragmentIntervalMS',
      fragmentIntervalMS,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'fragmentSizeBytes',
      fragmentSizeBytes,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'redundancyPercent',
      redundancyPercent,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (firmwareUpdateImage != null)
        'FirmwareUpdateImage': firmwareUpdateImage,
      if (firmwareUpdateRole != null) 'FirmwareUpdateRole': firmwareUpdateRole,
      if (fragmentIntervalMS != null) 'FragmentIntervalMS': fragmentIntervalMS,
      if (fragmentSizeBytes != null) 'FragmentSizeBytes': fragmentSizeBytes,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (redundancyPercent != null) 'RedundancyPercent': redundancyPercent,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/fuota-tasks/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Set default log level, or log levels by resource types. This can be for
  /// wireless device log options or wireless gateways log options and is used
  /// to control the log messages that'll be displayed in CloudWatch.
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

  /// Update the summary metric configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [summaryMetric] :
  /// The value to be used to set summary metric configuration.
  Future<void> updateMetricConfiguration({
    SummaryMetricConfiguration? summaryMetric,
  }) async {
    final $payload = <String, dynamic>{
      if (summaryMetric != null) 'SummaryMetric': summaryMetric,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/metric-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates properties of a multicast group session.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> updateMulticastGroup({
    required String id,
    String? description,
    LoRaWANMulticast? loRaWAN,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/multicast-groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update network analyzer configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [multicastGroupsToAdd] :
  /// Multicast group resources to add to the network analyzer configuration.
  /// Provide the <code>MulticastGroupId</code> of the resource to add in the
  /// input array.
  ///
  /// Parameter [multicastGroupsToRemove] :
  /// Multicast group resources to remove from the network analyzer
  /// configuration. Provide the <code>MulticastGroupId</code> of the resources
  /// to remove in the input array.
  ///
  /// Parameter [wirelessDevicesToAdd] :
  /// Wireless device resources to add to the network analyzer configuration.
  /// Provide the <code>WirelessDeviceId</code> of the resource to add in the
  /// input array.
  ///
  /// Parameter [wirelessDevicesToRemove] :
  /// Wireless device resources to remove from the network analyzer
  /// configuration. Provide the <code>WirelessDeviceId</code> of the resources
  /// to remove in the input array.
  ///
  /// Parameter [wirelessGatewaysToAdd] :
  /// Wireless gateway resources to add to the network analyzer configuration.
  /// Provide the <code>WirelessGatewayId</code> of the resource to add in the
  /// input array.
  ///
  /// Parameter [wirelessGatewaysToRemove] :
  /// Wireless gateway resources to remove from the network analyzer
  /// configuration. Provide the <code>WirelessGatewayId</code> of the resources
  /// to remove in the input array.
  Future<void> updateNetworkAnalyzerConfiguration({
    required String configurationName,
    String? description,
    List<String>? multicastGroupsToAdd,
    List<String>? multicastGroupsToRemove,
    TraceContent? traceContent,
    List<String>? wirelessDevicesToAdd,
    List<String>? wirelessDevicesToRemove,
    List<String>? wirelessGatewaysToAdd,
    List<String>? wirelessGatewaysToRemove,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (multicastGroupsToAdd != null)
        'MulticastGroupsToAdd': multicastGroupsToAdd,
      if (multicastGroupsToRemove != null)
        'MulticastGroupsToRemove': multicastGroupsToRemove,
      if (traceContent != null) 'TraceContent': traceContent,
      if (wirelessDevicesToAdd != null)
        'WirelessDevicesToAdd': wirelessDevicesToAdd,
      if (wirelessDevicesToRemove != null)
        'WirelessDevicesToRemove': wirelessDevicesToRemove,
      if (wirelessGatewaysToAdd != null)
        'WirelessGatewaysToAdd': wirelessGatewaysToAdd,
      if (wirelessGatewaysToRemove != null)
        'WirelessGatewaysToRemove': wirelessGatewaysToRemove,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/network-analyzer-configurations/${Uri.encodeComponent(configurationName)}',
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

  /// Update the position information of a resource.
  /// <important>
  /// This action is no longer supported. Calls to update the position
  /// information should use the <a
  /// href="https://docs.aws.amazon.com/iot-wireless/2020-11-22/apireference/API_UpdateResourcePosition.html">UpdateResourcePosition</a>
  /// API operation instead.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [position] :
  /// The position information of the resource.
  ///
  /// Parameter [resourceIdentifier] :
  /// Resource identifier of the resource for which position is updated.
  ///
  /// Parameter [resourceType] :
  /// Resource type of the resource for which position is updated.
  @Deprecated('This operation is no longer supported.')
  Future<void> updatePosition({
    required List<double> position,
    required String resourceIdentifier,
    required PositionResourceType resourceType,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final $payload = <String, dynamic>{
      'Position': position,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/positions/${Uri.encodeComponent(resourceIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the event configuration for a particular resource identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [identifier] :
  /// Resource identifier to opt in for event messaging.
  ///
  /// Parameter [identifierType] :
  /// Identifier type of the particular resource identifier for event
  /// configuration.
  ///
  /// Parameter [connectionStatus] :
  /// Event configuration for the connection status event.
  ///
  /// Parameter [deviceRegistrationState] :
  /// Event configuration for the device registration state event.
  ///
  /// Parameter [join] :
  /// Event configuration for the join event.
  ///
  /// Parameter [messageDeliveryStatus] :
  /// Event configuration for the message delivery status event.
  ///
  /// Parameter [partnerType] :
  /// Partner type of the resource if the identifier type is
  /// <code>PartnerAccountId</code>
  ///
  /// Parameter [proximity] :
  /// Event configuration for the proximity event.
  Future<void> updateResourceEventConfiguration({
    required String identifier,
    required IdentifierType identifierType,
    ConnectionStatusEventConfiguration? connectionStatus,
    DeviceRegistrationStateEventConfiguration? deviceRegistrationState,
    JoinEventConfiguration? join,
    MessageDeliveryStatusEventConfiguration? messageDeliveryStatus,
    EventNotificationPartnerType? partnerType,
    ProximityEventConfiguration? proximity,
  }) async {
    final $query = <String, List<String>>{
      'identifierType': [identifierType.toValue()],
      if (partnerType != null) 'partnerType': [partnerType.toValue()],
    };
    final $payload = <String, dynamic>{
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (deviceRegistrationState != null)
        'DeviceRegistrationState': deviceRegistrationState,
      if (join != null) 'Join': join,
      if (messageDeliveryStatus != null)
        'MessageDeliveryStatus': messageDeliveryStatus,
      if (proximity != null) 'Proximity': proximity,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/event-configurations/${Uri.encodeComponent(identifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the position information of a given wireless device or a wireless
  /// gateway resource. The position coordinates are based on the <a
  /// href="https://gisgeography.com/wgs84-world-geodetic-system/"> World
  /// Geodetic System (WGS84)</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceIdentifier] :
  /// The identifier of the resource for which position information is updated.
  /// It can be the wireless device ID or the wireless gateway ID, depending on
  /// the resource type.
  ///
  /// Parameter [resourceType] :
  /// The type of resource for which position information is updated, which can
  /// be a wireless device or a wireless gateway.
  ///
  /// Parameter [geoJsonPayload] :
  /// The position information of the resource, displayed as a JSON payload. The
  /// payload uses the GeoJSON format, which a format that's used to encode
  /// geographic data structures. For more information, see <a
  /// href="https://geojson.org/">GeoJSON</a>.
  Future<void> updateResourcePosition({
    required String resourceIdentifier,
    required PositionResourceType resourceType,
    Uint8List? geoJsonPayload,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: geoJsonPayload,
      method: 'PATCH',
      requestUri:
          '/resource-positions/${Uri.encodeComponent(resourceIdentifier)}',
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
  ///
  /// Parameter [positioning] :
  /// FPort values for the GNSS, stream, and ClockSync functions of the
  /// positioning information.
  Future<void> updateWirelessDevice({
    required String id,
    String? description,
    String? destinationName,
    LoRaWANUpdateDevice? loRaWAN,
    String? name,
    PositioningConfigStatus? positioning,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (destinationName != null) 'DestinationName': destinationName,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (positioning != null) 'Positioning': positioning.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/wireless-devices/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update an import task to add more devices to the task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The identifier of the import task to be updated.
  ///
  /// Parameter [sidewalk] :
  /// The Sidewalk-related parameters of the import task to be updated.
  Future<void> updateWirelessDeviceImportTask({
    required String id,
    required SidewalkUpdateImportInfo sidewalk,
  }) async {
    final $payload = <String, dynamic>{
      'Sidewalk': sidewalk,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/wireless_device_import_task/${Uri.encodeComponent(id)}',
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
  /// Parameter [maxEirp] :
  /// The MaxEIRP value.
  ///
  /// Parameter [name] :
  /// The new name of the resource.
  Future<void> updateWirelessGateway({
    required String id,
    String? description,
    List<List<String>>? joinEuiFilters,
    double? maxEirp,
    String? name,
    List<String>? netIdFilters,
  }) async {
    _s.validateNumRange(
      'maxEirp',
      maxEirp,
      0,
      30,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (joinEuiFilters != null) 'JoinEuiFilters': joinEuiFilters,
      if (maxEirp != null) 'MaxEirp': maxEirp,
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
// ignore: camel_case_types
class AbpV1_0_x {
  /// The DevAddr value.
  final String? devAddr;

  /// The FCnt init value.
  final int? fCntStart;

  /// Session keys for ABP v1.0.x
  final SessionKeysAbpV1_0_x? sessionKeys;

  AbpV1_0_x({
    this.devAddr,
    this.fCntStart,
    this.sessionKeys,
  });

  factory AbpV1_0_x.fromJson(Map<String, dynamic> json) {
    return AbpV1_0_x(
      devAddr: json['DevAddr'] as String?,
      fCntStart: json['FCntStart'] as int?,
      sessionKeys: json['SessionKeys'] != null
          ? SessionKeysAbpV1_0_x.fromJson(
              json['SessionKeys'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devAddr = this.devAddr;
    final fCntStart = this.fCntStart;
    final sessionKeys = this.sessionKeys;
    return {
      if (devAddr != null) 'DevAddr': devAddr,
      if (fCntStart != null) 'FCntStart': fCntStart,
      if (sessionKeys != null) 'SessionKeys': sessionKeys,
    };
  }
}

/// ABP device object for LoRaWAN specification v1.1
// ignore: camel_case_types
class AbpV1_1 {
  /// The DevAddr value.
  final String? devAddr;

  /// The FCnt init value.
  final int? fCntStart;

  /// Session keys for ABP v1.1
  final SessionKeysAbpV1_1? sessionKeys;

  AbpV1_1({
    this.devAddr,
    this.fCntStart,
    this.sessionKeys,
  });

  factory AbpV1_1.fromJson(Map<String, dynamic> json) {
    return AbpV1_1(
      devAddr: json['DevAddr'] as String?,
      fCntStart: json['FCntStart'] as int?,
      sessionKeys: json['SessionKeys'] != null
          ? SessionKeysAbpV1_1.fromJson(
              json['SessionKeys'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final devAddr = this.devAddr;
    final fCntStart = this.fCntStart;
    final sessionKeys = this.sessionKeys;
    return {
      if (devAddr != null) 'DevAddr': devAddr,
      if (fCntStart != null) 'FCntStart': fCntStart,
      if (sessionKeys != null) 'SessionKeys': sessionKeys,
    };
  }
}

/// The accuracy of the estimated position in meters. An empty value indicates
/// that no position data is available. A value of ‘0.0’ value indicates that
/// position data is available. This data corresponds to the position
/// information that you specified instead of the position computed by solver.
class Accuracy {
  /// The horizontal accuracy of the estimated position, which is the difference
  /// between the estimated location and the actual device location.
  final double? horizontalAccuracy;

  /// The vertical accuracy of the estimated position, which is the difference
  /// between the estimated altitude and actual device latitude in meters.
  final double? verticalAccuracy;

  Accuracy({
    this.horizontalAccuracy,
    this.verticalAccuracy,
  });

  factory Accuracy.fromJson(Map<String, dynamic> json) {
    return Accuracy(
      horizontalAccuracy: json['HorizontalAccuracy'] as double?,
      verticalAccuracy: json['VerticalAccuracy'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final horizontalAccuracy = this.horizontalAccuracy;
    final verticalAccuracy = this.verticalAccuracy;
    return {
      if (horizontalAccuracy != null) 'HorizontalAccuracy': horizontalAccuracy,
      if (verticalAccuracy != null) 'VerticalAccuracy': verticalAccuracy,
    };
  }
}

enum AggregationPeriod {
  oneHour,
  oneDay,
  oneWeek,
}

extension AggregationPeriodValueExtension on AggregationPeriod {
  String toValue() {
    switch (this) {
      case AggregationPeriod.oneHour:
        return 'OneHour';
      case AggregationPeriod.oneDay:
        return 'OneDay';
      case AggregationPeriod.oneWeek:
        return 'OneWeek';
    }
  }
}

extension AggregationPeriodFromString on String {
  AggregationPeriod toAggregationPeriod() {
    switch (this) {
      case 'OneHour':
        return AggregationPeriod.oneHour;
      case 'OneDay':
        return AggregationPeriod.oneDay;
      case 'OneWeek':
        return AggregationPeriod.oneWeek;
    }
    throw Exception('$this is not known in enum AggregationPeriod');
  }
}

/// LoRaWAN application configuration, which can be used to perform geolocation.
class ApplicationConfig {
  /// The name of the position data destination that describes the AWS IoT rule
  /// that processes the device's position data for use by AWS IoT Core for
  /// LoRaWAN.
  final String? destinationName;
  final int? fPort;

  /// Application type, which can be specified to obtain real-time position
  /// information of your LoRaWAN device.
  final ApplicationConfigType? type;

  ApplicationConfig({
    this.destinationName,
    this.fPort,
    this.type,
  });

  factory ApplicationConfig.fromJson(Map<String, dynamic> json) {
    return ApplicationConfig(
      destinationName: json['DestinationName'] as String?,
      fPort: json['FPort'] as int?,
      type: (json['Type'] as String?)?.toApplicationConfigType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationName = this.destinationName;
    final fPort = this.fPort;
    final type = this.type;
    return {
      if (destinationName != null) 'DestinationName': destinationName,
      if (fPort != null) 'FPort': fPort,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ApplicationConfigType {
  semtechGeolocation,
}

extension ApplicationConfigTypeValueExtension on ApplicationConfigType {
  String toValue() {
    switch (this) {
      case ApplicationConfigType.semtechGeolocation:
        return 'SemtechGeolocation';
    }
  }
}

extension ApplicationConfigTypeFromString on String {
  ApplicationConfigType toApplicationConfigType() {
    switch (this) {
      case 'SemtechGeolocation':
        return ApplicationConfigType.semtechGeolocation;
    }
    throw Exception('$this is not known in enum ApplicationConfigType');
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

class AssociateMulticastGroupWithFuotaTaskResponse {
  AssociateMulticastGroupWithFuotaTaskResponse();

  factory AssociateMulticastGroupWithFuotaTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateMulticastGroupWithFuotaTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateWirelessDeviceWithFuotaTaskResponse {
  AssociateWirelessDeviceWithFuotaTaskResponse();

  factory AssociateWirelessDeviceWithFuotaTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateWirelessDeviceWithFuotaTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateWirelessDeviceWithMulticastGroupResponse {
  AssociateWirelessDeviceWithMulticastGroupResponse();

  factory AssociateWirelessDeviceWithMulticastGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateWirelessDeviceWithMulticastGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

extension BatteryLevelValueExtension on BatteryLevel {
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

extension BatteryLevelFromString on String {
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

/// Beaconing parameters for configuring the wireless gateways.
class Beaconing {
  /// The data rate for gateways that are sending the beacons.
  final int? dataRate;

  /// The frequency list for the gateways to send the beacons.
  final List<int>? frequencies;

  Beaconing({
    this.dataRate,
    this.frequencies,
  });

  factory Beaconing.fromJson(Map<String, dynamic> json) {
    return Beaconing(
      dataRate: json['DataRate'] as int?,
      frequencies: (json['Frequencies'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataRate = this.dataRate;
    final frequencies = this.frequencies;
    return {
      if (dataRate != null) 'DataRate': dataRate,
      if (frequencies != null) 'Frequencies': frequencies,
    };
  }
}

class CancelMulticastGroupSessionResponse {
  CancelMulticastGroupSessionResponse();

  factory CancelMulticastGroupSessionResponse.fromJson(Map<String, dynamic> _) {
    return CancelMulticastGroupSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// CDMA local ID information, which corresponds to the local identification
/// parameters of a CDMA cell.
class CdmaLocalId {
  /// CDMA channel information.
  final int cdmaChannel;

  /// Pseudo-noise offset, which is a characteristic of the signal from a cell on
  /// a radio tower.
  final int pnOffset;

  CdmaLocalId({
    required this.cdmaChannel,
    required this.pnOffset,
  });

  Map<String, dynamic> toJson() {
    final cdmaChannel = this.cdmaChannel;
    final pnOffset = this.pnOffset;
    return {
      'CdmaChannel': cdmaChannel,
      'PnOffset': pnOffset,
    };
  }
}

/// CDMA object for network measurement reports.
class CdmaNmrObj {
  /// CDMA channel information.
  final int cdmaChannel;

  /// Pseudo-noise offset, which is a characteristic of the signal from a cell on
  /// a radio tower.
  final int pnOffset;

  /// CDMA base station ID (BSID).
  final int? baseStationId;

  /// Transmit power level of the pilot signal, measured in dBm
  /// (decibel-milliwatts).
  final int? pilotPower;

  CdmaNmrObj({
    required this.cdmaChannel,
    required this.pnOffset,
    this.baseStationId,
    this.pilotPower,
  });

  Map<String, dynamic> toJson() {
    final cdmaChannel = this.cdmaChannel;
    final pnOffset = this.pnOffset;
    final baseStationId = this.baseStationId;
    final pilotPower = this.pilotPower;
    return {
      'CdmaChannel': cdmaChannel,
      'PnOffset': pnOffset,
      if (baseStationId != null) 'BaseStationId': baseStationId,
      if (pilotPower != null) 'PilotPower': pilotPower,
    };
  }
}

/// CDMA (Code-division multiple access) object.
class CdmaObj {
  /// CDMA base station ID (BSID).
  final int baseStationId;

  /// CDMA network ID (NID).
  final int networkId;

  /// CDMA system ID (SID).
  final int systemId;

  /// CDMA base station latitude in degrees.
  final double? baseLat;

  /// CDMA base station longitude in degrees.
  final double? baseLng;

  /// CDMA local identification (local ID) parameters.
  final CdmaLocalId? cdmaLocalId;

  /// CDMA network measurement reports.
  final List<CdmaNmrObj>? cdmaNmr;

  /// Transmit power level of the pilot signal, measured in dBm
  /// (decibel-milliwatts).
  final int? pilotPower;

  /// CDMA registration zone (RZ).
  final int? registrationZone;

  CdmaObj({
    required this.baseStationId,
    required this.networkId,
    required this.systemId,
    this.baseLat,
    this.baseLng,
    this.cdmaLocalId,
    this.cdmaNmr,
    this.pilotPower,
    this.registrationZone,
  });

  Map<String, dynamic> toJson() {
    final baseStationId = this.baseStationId;
    final networkId = this.networkId;
    final systemId = this.systemId;
    final baseLat = this.baseLat;
    final baseLng = this.baseLng;
    final cdmaLocalId = this.cdmaLocalId;
    final cdmaNmr = this.cdmaNmr;
    final pilotPower = this.pilotPower;
    final registrationZone = this.registrationZone;
    return {
      'BaseStationId': baseStationId,
      'NetworkId': networkId,
      'SystemId': systemId,
      if (baseLat != null) 'BaseLat': baseLat,
      if (baseLng != null) 'BaseLng': baseLng,
      if (cdmaLocalId != null) 'CdmaLocalId': cdmaLocalId,
      if (cdmaNmr != null) 'CdmaNmr': cdmaNmr,
      if (pilotPower != null) 'PilotPower': pilotPower,
      if (registrationZone != null) 'RegistrationZone': registrationZone,
    };
  }
}

/// The cell towers that were used to perform the measurements.
class CellTowers {
  /// CDMA object information.
  final List<CdmaObj>? cdma;

  /// GSM object information.
  final List<GsmObj>? gsm;

  /// LTE object information.
  final List<LteObj>? lte;

  /// TD-SCDMA object information.
  final List<TdscdmaObj>? tdscdma;

  /// WCDMA object information.
  final List<WcdmaObj>? wcdma;

  CellTowers({
    this.cdma,
    this.gsm,
    this.lte,
    this.tdscdma,
    this.wcdma,
  });

  Map<String, dynamic> toJson() {
    final cdma = this.cdma;
    final gsm = this.gsm;
    final lte = this.lte;
    final tdscdma = this.tdscdma;
    final wcdma = this.wcdma;
    return {
      if (cdma != null) 'Cdma': cdma,
      if (gsm != null) 'Gsm': gsm,
      if (lte != null) 'Lte': lte,
      if (tdscdma != null) 'Tdscdma': tdscdma,
      if (wcdma != null) 'Wcdma': wcdma,
    };
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

extension ConnectionStatusValueExtension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.connected:
        return 'Connected';
      case ConnectionStatus.disconnected:
        return 'Disconnected';
    }
  }
}

extension ConnectionStatusFromString on String {
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

/// Connection status event configuration object for enabling or disabling
/// topic.
class ConnectionStatusEventConfiguration {
  /// Connection status event configuration object for enabling or disabling
  /// LoRaWAN related event topics.
  final LoRaWANConnectionStatusEventNotificationConfigurations? loRaWAN;

  /// Denotes whether the wireless gateway ID connection status event topic is
  /// enabled or disabled.
  final EventNotificationTopicStatus? wirelessGatewayIdEventTopic;

  ConnectionStatusEventConfiguration({
    this.loRaWAN,
    this.wirelessGatewayIdEventTopic,
  });

  factory ConnectionStatusEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ConnectionStatusEventConfiguration(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANConnectionStatusEventNotificationConfigurations.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      wirelessGatewayIdEventTopic:
          (json['WirelessGatewayIdEventTopic'] as String?)
              ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    final wirelessGatewayIdEventTopic = this.wirelessGatewayIdEventTopic;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (wirelessGatewayIdEventTopic != null)
        'WirelessGatewayIdEventTopic': wirelessGatewayIdEventTopic.toValue(),
    };
  }
}

/// Connection status resource type event configuration object for enabling or
/// disabling topic.
class ConnectionStatusResourceTypeEventConfiguration {
  /// Connection status resource type event configuration object for enabling or
  /// disabling LoRaWAN related event topics.
  final LoRaWANConnectionStatusResourceTypeEventConfiguration? loRaWAN;

  ConnectionStatusResourceTypeEventConfiguration({
    this.loRaWAN,
  });

  factory ConnectionStatusResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ConnectionStatusResourceTypeEventConfiguration(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANConnectionStatusResourceTypeEventConfiguration.fromJson(
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

class CreateFuotaTaskResponse {
  final String? arn;
  final String? id;

  CreateFuotaTaskResponse({
    this.arn,
    this.id,
  });

  factory CreateFuotaTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateFuotaTaskResponse(
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

class CreateMulticastGroupResponse {
  final String? arn;
  final String? id;

  CreateMulticastGroupResponse({
    this.arn,
    this.id,
  });

  factory CreateMulticastGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateMulticastGroupResponse(
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

class CreateNetworkAnalyzerConfigurationResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;
  final String? name;

  CreateNetworkAnalyzerConfigurationResponse({
    this.arn,
    this.name,
  });

  factory CreateNetworkAnalyzerConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateNetworkAnalyzerConfigurationResponse(
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

/// The device attestation key (DAK) information.
class DakCertificateMetadata {
  /// The certificate ID for the DAK.
  final String certificateId;

  /// The advertised product ID (APID) that's used for pre-production and
  /// production applications.
  final String? apId;

  /// The device type ID that's used for prototyping applications.
  final String? deviceTypeId;

  /// Whether factory support has been enabled.
  final bool? factorySupport;

  /// The maximum number of signatures that the DAK can sign. A value of
  /// <code>-1</code> indicates that there's no device limit.
  final int? maxAllowedSignature;

  DakCertificateMetadata({
    required this.certificateId,
    this.apId,
    this.deviceTypeId,
    this.factorySupport,
    this.maxAllowedSignature,
  });

  factory DakCertificateMetadata.fromJson(Map<String, dynamic> json) {
    return DakCertificateMetadata(
      certificateId: json['CertificateId'] as String,
      apId: json['ApId'] as String?,
      deviceTypeId: json['DeviceTypeId'] as String?,
      factorySupport: json['FactorySupport'] as bool?,
      maxAllowedSignature: json['MaxAllowedSignature'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateId = this.certificateId;
    final apId = this.apId;
    final deviceTypeId = this.deviceTypeId;
    final factorySupport = this.factorySupport;
    final maxAllowedSignature = this.maxAllowedSignature;
    return {
      'CertificateId': certificateId,
      if (apId != null) 'ApId': apId,
      if (deviceTypeId != null) 'DeviceTypeId': deviceTypeId,
      if (factorySupport != null) 'FactorySupport': factorySupport,
      if (maxAllowedSignature != null)
        'MaxAllowedSignature': maxAllowedSignature,
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

class DeleteFuotaTaskResponse {
  DeleteFuotaTaskResponse();

  factory DeleteFuotaTaskResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFuotaTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMulticastGroupResponse {
  DeleteMulticastGroupResponse();

  factory DeleteMulticastGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMulticastGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteNetworkAnalyzerConfigurationResponse {
  DeleteNetworkAnalyzerConfigurationResponse();

  factory DeleteNetworkAnalyzerConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteNetworkAnalyzerConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueuedMessagesResponse {
  DeleteQueuedMessagesResponse();

  factory DeleteQueuedMessagesResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueuedMessagesResponse();
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

class DeleteWirelessDeviceImportTaskResponse {
  DeleteWirelessDeviceImportTaskResponse();

  factory DeleteWirelessDeviceImportTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteWirelessDeviceImportTaskResponse();
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

class DeregisterWirelessDeviceResponse {
  DeregisterWirelessDeviceResponse();

  factory DeregisterWirelessDeviceResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterWirelessDeviceResponse();
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

enum DeviceProfileType {
  sidewalk,
  loRaWAN,
}

extension DeviceProfileTypeValueExtension on DeviceProfileType {
  String toValue() {
    switch (this) {
      case DeviceProfileType.sidewalk:
        return 'Sidewalk';
      case DeviceProfileType.loRaWAN:
        return 'LoRaWAN';
    }
  }
}

extension DeviceProfileTypeFromString on String {
  DeviceProfileType toDeviceProfileType() {
    switch (this) {
      case 'Sidewalk':
        return DeviceProfileType.sidewalk;
      case 'LoRaWAN':
        return DeviceProfileType.loRaWAN;
    }
    throw Exception('$this is not known in enum DeviceProfileType');
  }
}

/// Device registration state event configuration object for enabling and
/// disabling relevant topics.
class DeviceRegistrationStateEventConfiguration {
  /// Device registration state event configuration object for enabling or
  /// disabling Sidewalk related event topics.
  final SidewalkEventNotificationConfigurations? sidewalk;

  /// Denotes whether the wireless device ID device registration state event topic
  /// is enabled or disabled.
  final EventNotificationTopicStatus? wirelessDeviceIdEventTopic;

  DeviceRegistrationStateEventConfiguration({
    this.sidewalk,
    this.wirelessDeviceIdEventTopic,
  });

  factory DeviceRegistrationStateEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DeviceRegistrationStateEventConfiguration(
      sidewalk: json['Sidewalk'] != null
          ? SidewalkEventNotificationConfigurations.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      wirelessDeviceIdEventTopic:
          (json['WirelessDeviceIdEventTopic'] as String?)
              ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    final wirelessDeviceIdEventTopic = this.wirelessDeviceIdEventTopic;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (wirelessDeviceIdEventTopic != null)
        'WirelessDeviceIdEventTopic': wirelessDeviceIdEventTopic.toValue(),
    };
  }
}

/// Device registration state resource type event configuration object for
/// enabling or disabling topic.
class DeviceRegistrationStateResourceTypeEventConfiguration {
  /// Device registration resource type state event configuration object for
  /// enabling or disabling Sidewalk related event topics.
  final SidewalkResourceTypeEventConfiguration? sidewalk;

  DeviceRegistrationStateResourceTypeEventConfiguration({
    this.sidewalk,
  });

  factory DeviceRegistrationStateResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DeviceRegistrationStateResourceTypeEventConfiguration(
      sidewalk: json['Sidewalk'] != null
          ? SidewalkResourceTypeEventConfiguration.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
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

extension DeviceStateValueExtension on DeviceState {
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

extension DeviceStateFromString on String {
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

/// The required list of dimensions for the metric.
class Dimension {
  /// The name of the dimension.
  final DimensionName? name;

  /// The dimension's value.
  final String? value;

  Dimension({
    this.name,
    this.value,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      name: (json['name'] as String?)?.toDimensionName(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum DimensionName {
  deviceId,
  gatewayId,
}

extension DimensionNameValueExtension on DimensionName {
  String toValue() {
    switch (this) {
      case DimensionName.deviceId:
        return 'DeviceId';
      case DimensionName.gatewayId:
        return 'GatewayId';
    }
  }
}

extension DimensionNameFromString on String {
  DimensionName toDimensionName() {
    switch (this) {
      case 'DeviceId':
        return DimensionName.deviceId;
      case 'GatewayId':
        return DimensionName.gatewayId;
    }
    throw Exception('$this is not known in enum DimensionName');
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

class DisassociateMulticastGroupFromFuotaTaskResponse {
  DisassociateMulticastGroupFromFuotaTaskResponse();

  factory DisassociateMulticastGroupFromFuotaTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateMulticastGroupFromFuotaTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateWirelessDeviceFromFuotaTaskResponse {
  DisassociateWirelessDeviceFromFuotaTaskResponse();

  factory DisassociateWirelessDeviceFromFuotaTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWirelessDeviceFromFuotaTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateWirelessDeviceFromMulticastGroupResponse {
  DisassociateWirelessDeviceFromMulticastGroupResponse();

  factory DisassociateWirelessDeviceFromMulticastGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateWirelessDeviceFromMulticastGroupResponse();
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

/// DlClass for LoRaWAM, valid values are ClassB and ClassC.
enum DlClass {
  classB,
  classC,
}

extension DlClassValueExtension on DlClass {
  String toValue() {
    switch (this) {
      case DlClass.classB:
        return 'ClassB';
      case DlClass.classC:
        return 'ClassC';
    }
  }
}

extension DlClassFromString on String {
  DlClass toDlClass() {
    switch (this) {
      case 'ClassB':
        return DlClass.classB;
      case 'ClassC':
        return DlClass.classC;
    }
    throw Exception('$this is not known in enum DlClass');
  }
}

enum DownlinkMode {
  sequential,
  concurrent,
  usingUplinkGateway,
}

extension DownlinkModeValueExtension on DownlinkMode {
  String toValue() {
    switch (this) {
      case DownlinkMode.sequential:
        return 'SEQUENTIAL';
      case DownlinkMode.concurrent:
        return 'CONCURRENT';
      case DownlinkMode.usingUplinkGateway:
        return 'USING_UPLINK_GATEWAY';
    }
  }
}

extension DownlinkModeFromString on String {
  DownlinkMode toDownlinkMode() {
    switch (this) {
      case 'SEQUENTIAL':
        return DownlinkMode.sequential;
      case 'CONCURRENT':
        return DownlinkMode.concurrent;
      case 'USING_UPLINK_GATEWAY':
        return DownlinkMode.usingUplinkGateway;
    }
    throw Exception('$this is not known in enum DownlinkMode');
  }
}

/// The message in the downlink queue.
class DownlinkQueueMessage {
  final LoRaWANSendDataToDevice? loRaWAN;

  /// The message ID assigned by IoT Wireless to each downlink message, which
  /// helps identify the message.
  final String? messageId;

  /// The time at which Iot Wireless received the downlink message.
  final String? receivedAt;

  /// The transmit mode to use for sending data to the wireless device. This can
  /// be <code>0</code> for UM (unacknowledge mode) or <code>1</code> for AM
  /// (acknowledge mode).
  final int? transmitMode;

  DownlinkQueueMessage({
    this.loRaWAN,
    this.messageId,
    this.receivedAt,
    this.transmitMode,
  });

  factory DownlinkQueueMessage.fromJson(Map<String, dynamic> json) {
    return DownlinkQueueMessage(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANSendDataToDevice.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      messageId: json['MessageId'] as String?,
      receivedAt: json['ReceivedAt'] as String?,
      transmitMode: json['TransmitMode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    final messageId = this.messageId;
    final receivedAt = this.receivedAt;
    final transmitMode = this.transmitMode;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (messageId != null) 'MessageId': messageId,
      if (receivedAt != null) 'ReceivedAt': receivedAt,
      if (transmitMode != null) 'TransmitMode': transmitMode,
    };
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

extension EventValueExtension on Event {
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

extension EventFromString on String {
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

/// Event configuration object for a single resource.
class EventConfigurationItem {
  final EventNotificationItemConfigurations? events;

  /// Resource identifier opted in for event messaging.
  final String? identifier;

  /// Identifier type of the particular resource identifier for event
  /// configuration.
  final IdentifierType? identifierType;

  /// Partner type of the resource if the identifier type is PartnerAccountId.
  final EventNotificationPartnerType? partnerType;

  EventConfigurationItem({
    this.events,
    this.identifier,
    this.identifierType,
    this.partnerType,
  });

  factory EventConfigurationItem.fromJson(Map<String, dynamic> json) {
    return EventConfigurationItem(
      events: json['Events'] != null
          ? EventNotificationItemConfigurations.fromJson(
              json['Events'] as Map<String, dynamic>)
          : null,
      identifier: json['Identifier'] as String?,
      identifierType: (json['IdentifierType'] as String?)?.toIdentifierType(),
      partnerType:
          (json['PartnerType'] as String?)?.toEventNotificationPartnerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final identifier = this.identifier;
    final identifierType = this.identifierType;
    final partnerType = this.partnerType;
    return {
      if (events != null) 'Events': events,
      if (identifier != null) 'Identifier': identifier,
      if (identifierType != null) 'IdentifierType': identifierType.toValue(),
      if (partnerType != null) 'PartnerType': partnerType.toValue(),
    };
  }
}

/// Object of all event configurations and the status of the event topics.
class EventNotificationItemConfigurations {
  /// Connection status event configuration for an event configuration item.
  final ConnectionStatusEventConfiguration? connectionStatus;

  /// Device registration state event configuration for an event configuration
  /// item.
  final DeviceRegistrationStateEventConfiguration? deviceRegistrationState;

  /// Join event configuration for an event configuration item.
  final JoinEventConfiguration? join;

  /// Message delivery status event configuration for an event configuration item.
  final MessageDeliveryStatusEventConfiguration? messageDeliveryStatus;

  /// Proximity event configuration for an event configuration item.
  final ProximityEventConfiguration? proximity;

  EventNotificationItemConfigurations({
    this.connectionStatus,
    this.deviceRegistrationState,
    this.join,
    this.messageDeliveryStatus,
    this.proximity,
  });

  factory EventNotificationItemConfigurations.fromJson(
      Map<String, dynamic> json) {
    return EventNotificationItemConfigurations(
      connectionStatus: json['ConnectionStatus'] != null
          ? ConnectionStatusEventConfiguration.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      deviceRegistrationState: json['DeviceRegistrationState'] != null
          ? DeviceRegistrationStateEventConfiguration.fromJson(
              json['DeviceRegistrationState'] as Map<String, dynamic>)
          : null,
      join: json['Join'] != null
          ? JoinEventConfiguration.fromJson(
              json['Join'] as Map<String, dynamic>)
          : null,
      messageDeliveryStatus: json['MessageDeliveryStatus'] != null
          ? MessageDeliveryStatusEventConfiguration.fromJson(
              json['MessageDeliveryStatus'] as Map<String, dynamic>)
          : null,
      proximity: json['Proximity'] != null
          ? ProximityEventConfiguration.fromJson(
              json['Proximity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final deviceRegistrationState = this.deviceRegistrationState;
    final join = this.join;
    final messageDeliveryStatus = this.messageDeliveryStatus;
    final proximity = this.proximity;
    return {
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (deviceRegistrationState != null)
        'DeviceRegistrationState': deviceRegistrationState,
      if (join != null) 'Join': join,
      if (messageDeliveryStatus != null)
        'MessageDeliveryStatus': messageDeliveryStatus,
      if (proximity != null) 'Proximity': proximity,
    };
  }
}

enum EventNotificationPartnerType {
  sidewalk,
}

extension EventNotificationPartnerTypeValueExtension
    on EventNotificationPartnerType {
  String toValue() {
    switch (this) {
      case EventNotificationPartnerType.sidewalk:
        return 'Sidewalk';
    }
  }
}

extension EventNotificationPartnerTypeFromString on String {
  EventNotificationPartnerType toEventNotificationPartnerType() {
    switch (this) {
      case 'Sidewalk':
        return EventNotificationPartnerType.sidewalk;
    }
    throw Exception('$this is not known in enum EventNotificationPartnerType');
  }
}

enum EventNotificationResourceType {
  sidewalkAccount,
  wirelessDevice,
  wirelessGateway,
}

extension EventNotificationResourceTypeValueExtension
    on EventNotificationResourceType {
  String toValue() {
    switch (this) {
      case EventNotificationResourceType.sidewalkAccount:
        return 'SidewalkAccount';
      case EventNotificationResourceType.wirelessDevice:
        return 'WirelessDevice';
      case EventNotificationResourceType.wirelessGateway:
        return 'WirelessGateway';
    }
  }
}

extension EventNotificationResourceTypeFromString on String {
  EventNotificationResourceType toEventNotificationResourceType() {
    switch (this) {
      case 'SidewalkAccount':
        return EventNotificationResourceType.sidewalkAccount;
      case 'WirelessDevice':
        return EventNotificationResourceType.wirelessDevice;
      case 'WirelessGateway':
        return EventNotificationResourceType.wirelessGateway;
    }
    throw Exception('$this is not known in enum EventNotificationResourceType');
  }
}

enum EventNotificationTopicStatus {
  enabled,
  disabled,
}

extension EventNotificationTopicStatusValueExtension
    on EventNotificationTopicStatus {
  String toValue() {
    switch (this) {
      case EventNotificationTopicStatus.enabled:
        return 'Enabled';
      case EventNotificationTopicStatus.disabled:
        return 'Disabled';
    }
  }
}

extension EventNotificationTopicStatusFromString on String {
  EventNotificationTopicStatus toEventNotificationTopicStatus() {
    switch (this) {
      case 'Enabled':
        return EventNotificationTopicStatus.enabled;
      case 'Disabled':
        return EventNotificationTopicStatus.disabled;
    }
    throw Exception('$this is not known in enum EventNotificationTopicStatus');
  }
}

enum ExpressionType {
  ruleName,
  mqttTopic,
}

extension ExpressionTypeValueExtension on ExpressionType {
  String toValue() {
    switch (this) {
      case ExpressionType.ruleName:
        return 'RuleName';
      case ExpressionType.mqttTopic:
        return 'MqttTopic';
    }
  }
}

extension ExpressionTypeFromString on String {
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

/// List of FPort assigned for different LoRaWAN application packages to use
class FPorts {
  /// Optional LoRaWAN application information, which can be used for geolocation.
  final List<ApplicationConfig>? applications;
  final int? clockSync;
  final int? fuota;
  final int? multicast;

  /// FPort values for the GNSS, stream, and ClockSync functions of the
  /// positioning information.
  final Positioning? positioning;

  FPorts({
    this.applications,
    this.clockSync,
    this.fuota,
    this.multicast,
    this.positioning,
  });

  factory FPorts.fromJson(Map<String, dynamic> json) {
    return FPorts(
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      clockSync: json['ClockSync'] as int?,
      fuota: json['Fuota'] as int?,
      multicast: json['Multicast'] as int?,
      positioning: json['Positioning'] != null
          ? Positioning.fromJson(json['Positioning'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final clockSync = this.clockSync;
    final fuota = this.fuota;
    final multicast = this.multicast;
    final positioning = this.positioning;
    return {
      if (applications != null) 'Applications': applications,
      if (clockSync != null) 'ClockSync': clockSync,
      if (fuota != null) 'Fuota': fuota,
      if (multicast != null) 'Multicast': multicast,
      if (positioning != null) 'Positioning': positioning,
    };
  }
}

/// The status of a wireless device in a FUOTA task.
enum FuotaDeviceStatus {
  initial,
  packageNotSupported,
  fragAlgoUnsupported,
  notEnoughMemory,
  fragIndexUnsupported,
  wrongDescriptor,
  sessionCntReplay,
  missingFrag,
  memoryError,
  mICError,
  successful,
}

extension FuotaDeviceStatusValueExtension on FuotaDeviceStatus {
  String toValue() {
    switch (this) {
      case FuotaDeviceStatus.initial:
        return 'Initial';
      case FuotaDeviceStatus.packageNotSupported:
        return 'Package_Not_Supported';
      case FuotaDeviceStatus.fragAlgoUnsupported:
        return 'FragAlgo_unsupported';
      case FuotaDeviceStatus.notEnoughMemory:
        return 'Not_enough_memory';
      case FuotaDeviceStatus.fragIndexUnsupported:
        return 'FragIndex_unsupported';
      case FuotaDeviceStatus.wrongDescriptor:
        return 'Wrong_descriptor';
      case FuotaDeviceStatus.sessionCntReplay:
        return 'SessionCnt_replay';
      case FuotaDeviceStatus.missingFrag:
        return 'MissingFrag';
      case FuotaDeviceStatus.memoryError:
        return 'MemoryError';
      case FuotaDeviceStatus.mICError:
        return 'MICError';
      case FuotaDeviceStatus.successful:
        return 'Successful';
    }
  }
}

extension FuotaDeviceStatusFromString on String {
  FuotaDeviceStatus toFuotaDeviceStatus() {
    switch (this) {
      case 'Initial':
        return FuotaDeviceStatus.initial;
      case 'Package_Not_Supported':
        return FuotaDeviceStatus.packageNotSupported;
      case 'FragAlgo_unsupported':
        return FuotaDeviceStatus.fragAlgoUnsupported;
      case 'Not_enough_memory':
        return FuotaDeviceStatus.notEnoughMemory;
      case 'FragIndex_unsupported':
        return FuotaDeviceStatus.fragIndexUnsupported;
      case 'Wrong_descriptor':
        return FuotaDeviceStatus.wrongDescriptor;
      case 'SessionCnt_replay':
        return FuotaDeviceStatus.sessionCntReplay;
      case 'MissingFrag':
        return FuotaDeviceStatus.missingFrag;
      case 'MemoryError':
        return FuotaDeviceStatus.memoryError;
      case 'MICError':
        return FuotaDeviceStatus.mICError;
      case 'Successful':
        return FuotaDeviceStatus.successful;
    }
    throw Exception('$this is not known in enum FuotaDeviceStatus');
  }
}

/// A FUOTA task.
class FuotaTask {
  final String? arn;
  final String? id;
  final String? name;

  FuotaTask({
    this.arn,
    this.id,
    this.name,
  });

  factory FuotaTask.fromJson(Map<String, dynamic> json) {
    return FuotaTask(
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

/// The status of a FUOTA task.
enum FuotaTaskStatus {
  pending,
  fuotaSessionWaiting,
  inFuotaSession,
  fuotaDone,
  deleteWaiting,
}

extension FuotaTaskStatusValueExtension on FuotaTaskStatus {
  String toValue() {
    switch (this) {
      case FuotaTaskStatus.pending:
        return 'Pending';
      case FuotaTaskStatus.fuotaSessionWaiting:
        return 'FuotaSession_Waiting';
      case FuotaTaskStatus.inFuotaSession:
        return 'In_FuotaSession';
      case FuotaTaskStatus.fuotaDone:
        return 'FuotaDone';
      case FuotaTaskStatus.deleteWaiting:
        return 'Delete_Waiting';
    }
  }
}

extension FuotaTaskStatusFromString on String {
  FuotaTaskStatus toFuotaTaskStatus() {
    switch (this) {
      case 'Pending':
        return FuotaTaskStatus.pending;
      case 'FuotaSession_Waiting':
        return FuotaTaskStatus.fuotaSessionWaiting;
      case 'In_FuotaSession':
        return FuotaTaskStatus.inFuotaSession;
      case 'FuotaDone':
        return FuotaTaskStatus.fuotaDone;
      case 'Delete_Waiting':
        return FuotaTaskStatus.deleteWaiting;
    }
    throw Exception('$this is not known in enum FuotaTaskStatus');
  }
}

/// Gateway list item object that specifies the frequency and list of gateways
/// for which the downlink message should be sent.
class GatewayListItem {
  /// The frequency to use for the gateways when sending a downlink message to the
  /// wireless device.
  final int downlinkFrequency;

  /// The ID of the wireless gateways that you want to add to the list of gateways
  /// when sending downlink messages.
  final String gatewayId;

  GatewayListItem({
    required this.downlinkFrequency,
    required this.gatewayId,
  });

  factory GatewayListItem.fromJson(Map<String, dynamic> json) {
    return GatewayListItem(
      downlinkFrequency: json['DownlinkFrequency'] as int,
      gatewayId: json['GatewayId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final downlinkFrequency = this.downlinkFrequency;
    final gatewayId = this.gatewayId;
    return {
      'DownlinkFrequency': downlinkFrequency,
      'GatewayId': gatewayId,
    };
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

  /// Information about the Sidewalk parameters in the device profile.
  final SidewalkGetDeviceProfile? sidewalk;

  GetDeviceProfileResponse({
    this.arn,
    this.id,
    this.loRaWAN,
    this.name,
    this.sidewalk,
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
      sidewalk: json['Sidewalk'] != null
          ? SidewalkGetDeviceProfile.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    final sidewalk = this.sidewalk;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

class GetEventConfigurationByResourceTypesResponse {
  /// Resource type event configuration for the connection status event.
  final ConnectionStatusResourceTypeEventConfiguration? connectionStatus;

  /// Resource type event configuration for the device registration state event.
  final DeviceRegistrationStateResourceTypeEventConfiguration?
      deviceRegistrationState;

  /// Resource type event configuration for the join event.
  final JoinResourceTypeEventConfiguration? join;

  /// Resource type event configuration object for the message delivery status
  /// event.
  final MessageDeliveryStatusResourceTypeEventConfiguration?
      messageDeliveryStatus;

  /// Resource type event configuration for the proximity event.
  final ProximityResourceTypeEventConfiguration? proximity;

  GetEventConfigurationByResourceTypesResponse({
    this.connectionStatus,
    this.deviceRegistrationState,
    this.join,
    this.messageDeliveryStatus,
    this.proximity,
  });

  factory GetEventConfigurationByResourceTypesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEventConfigurationByResourceTypesResponse(
      connectionStatus: json['ConnectionStatus'] != null
          ? ConnectionStatusResourceTypeEventConfiguration.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      deviceRegistrationState: json['DeviceRegistrationState'] != null
          ? DeviceRegistrationStateResourceTypeEventConfiguration.fromJson(
              json['DeviceRegistrationState'] as Map<String, dynamic>)
          : null,
      join: json['Join'] != null
          ? JoinResourceTypeEventConfiguration.fromJson(
              json['Join'] as Map<String, dynamic>)
          : null,
      messageDeliveryStatus: json['MessageDeliveryStatus'] != null
          ? MessageDeliveryStatusResourceTypeEventConfiguration.fromJson(
              json['MessageDeliveryStatus'] as Map<String, dynamic>)
          : null,
      proximity: json['Proximity'] != null
          ? ProximityResourceTypeEventConfiguration.fromJson(
              json['Proximity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final deviceRegistrationState = this.deviceRegistrationState;
    final join = this.join;
    final messageDeliveryStatus = this.messageDeliveryStatus;
    final proximity = this.proximity;
    return {
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (deviceRegistrationState != null)
        'DeviceRegistrationState': deviceRegistrationState,
      if (join != null) 'Join': join,
      if (messageDeliveryStatus != null)
        'MessageDeliveryStatus': messageDeliveryStatus,
      if (proximity != null) 'Proximity': proximity,
    };
  }
}

class GetFuotaTaskResponse {
  final String? arn;
  final DateTime? createdAt;
  final String? description;
  final String? firmwareUpdateImage;
  final String? firmwareUpdateRole;
  final int? fragmentIntervalMS;
  final int? fragmentSizeBytes;
  final String? id;
  final LoRaWANFuotaTaskGetInfo? loRaWAN;
  final String? name;
  final int? redundancyPercent;
  final FuotaTaskStatus? status;

  GetFuotaTaskResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.firmwareUpdateImage,
    this.firmwareUpdateRole,
    this.fragmentIntervalMS,
    this.fragmentSizeBytes,
    this.id,
    this.loRaWAN,
    this.name,
    this.redundancyPercent,
    this.status,
  });

  factory GetFuotaTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetFuotaTaskResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      firmwareUpdateImage: json['FirmwareUpdateImage'] as String?,
      firmwareUpdateRole: json['FirmwareUpdateRole'] as String?,
      fragmentIntervalMS: json['FragmentIntervalMS'] as int?,
      fragmentSizeBytes: json['FragmentSizeBytes'] as int?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANFuotaTaskGetInfo.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      redundancyPercent: json['RedundancyPercent'] as int?,
      status: (json['Status'] as String?)?.toFuotaTaskStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final firmwareUpdateImage = this.firmwareUpdateImage;
    final firmwareUpdateRole = this.firmwareUpdateRole;
    final fragmentIntervalMS = this.fragmentIntervalMS;
    final fragmentSizeBytes = this.fragmentSizeBytes;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    final redundancyPercent = this.redundancyPercent;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (firmwareUpdateImage != null)
        'FirmwareUpdateImage': firmwareUpdateImage,
      if (firmwareUpdateRole != null) 'FirmwareUpdateRole': firmwareUpdateRole,
      if (fragmentIntervalMS != null) 'FragmentIntervalMS': fragmentIntervalMS,
      if (fragmentSizeBytes != null) 'FragmentSizeBytes': fragmentSizeBytes,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (redundancyPercent != null) 'RedundancyPercent': redundancyPercent,
      if (status != null) 'Status': status.toValue(),
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

class GetMetricConfigurationResponse {
  /// The configuration status of the AWS account for summary metric aggregation.
  final SummaryMetricConfiguration? summaryMetric;

  GetMetricConfigurationResponse({
    this.summaryMetric,
  });

  factory GetMetricConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetMetricConfigurationResponse(
      summaryMetric: json['SummaryMetric'] != null
          ? SummaryMetricConfiguration.fromJson(
              json['SummaryMetric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final summaryMetric = this.summaryMetric;
    return {
      if (summaryMetric != null) 'SummaryMetric': summaryMetric,
    };
  }
}

class GetMetricsResponse {
  /// The list of summary metrics that were retrieved.
  final List<SummaryMetricQueryResult>? summaryMetricQueryResults;

  GetMetricsResponse({
    this.summaryMetricQueryResults,
  });

  factory GetMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetMetricsResponse(
      summaryMetricQueryResults: (json['SummaryMetricQueryResults'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SummaryMetricQueryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final summaryMetricQueryResults = this.summaryMetricQueryResults;
    return {
      if (summaryMetricQueryResults != null)
        'SummaryMetricQueryResults': summaryMetricQueryResults,
    };
  }
}

class GetMulticastGroupResponse {
  final String? arn;
  final DateTime? createdAt;
  final String? description;
  final String? id;
  final LoRaWANMulticastGet? loRaWAN;
  final String? name;
  final String? status;

  GetMulticastGroupResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.id,
    this.loRaWAN,
    this.name,
    this.status,
  });

  factory GetMulticastGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetMulticastGroupResponse(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANMulticastGet.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      status: json['Status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final loRaWAN = this.loRaWAN;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status,
    };
  }
}

class GetMulticastGroupSessionResponse {
  final LoRaWANMulticastSession? loRaWAN;

  GetMulticastGroupSessionResponse({
    this.loRaWAN,
  });

  factory GetMulticastGroupSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetMulticastGroupSessionResponse(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANMulticastSession.fromJson(
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

class GetNetworkAnalyzerConfigurationResponse {
  /// The Amazon Resource Name of the new resource.
  final String? arn;
  final String? description;

  /// List of multicast group resources that have been added to the network
  /// analyzer configuration.
  final List<String>? multicastGroups;
  final String? name;
  final TraceContent? traceContent;

  /// List of wireless device resources that have been added to the network
  /// analyzer configuration.
  final List<String>? wirelessDevices;

  /// List of wireless gateway resources that have been added to the network
  /// analyzer configuration.
  final List<String>? wirelessGateways;

  GetNetworkAnalyzerConfigurationResponse({
    this.arn,
    this.description,
    this.multicastGroups,
    this.name,
    this.traceContent,
    this.wirelessDevices,
    this.wirelessGateways,
  });

  factory GetNetworkAnalyzerConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNetworkAnalyzerConfigurationResponse(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      multicastGroups: (json['MulticastGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      traceContent: json['TraceContent'] != null
          ? TraceContent.fromJson(json['TraceContent'] as Map<String, dynamic>)
          : null,
      wirelessDevices: (json['WirelessDevices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      wirelessGateways: (json['WirelessGateways'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final multicastGroups = this.multicastGroups;
    final name = this.name;
    final traceContent = this.traceContent;
    final wirelessDevices = this.wirelessDevices;
    final wirelessGateways = this.wirelessGateways;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (multicastGroups != null) 'MulticastGroups': multicastGroups,
      if (name != null) 'Name': name,
      if (traceContent != null) 'TraceContent': traceContent,
      if (wirelessDevices != null) 'WirelessDevices': wirelessDevices,
      if (wirelessGateways != null) 'WirelessGateways': wirelessGateways,
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

@Deprecated('This operation is no longer supported.')
class GetPositionConfigurationResponse {
  /// The position data destination that describes the AWS IoT rule that processes
  /// the device's position data for use by AWS IoT Core for LoRaWAN.
  final String? destination;

  /// The wrapper for the solver configuration details object.
  final PositionSolverDetails? solvers;

  GetPositionConfigurationResponse({
    this.destination,
    this.solvers,
  });

  factory GetPositionConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetPositionConfigurationResponse(
      destination: json['Destination'] as String?,
      solvers: json['Solvers'] != null
          ? PositionSolverDetails.fromJson(
              json['Solvers'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final solvers = this.solvers;
    return {
      if (destination != null) 'Destination': destination,
      if (solvers != null) 'Solvers': solvers,
    };
  }
}

class GetPositionEstimateResponse {
  /// The position information of the resource, displayed as a JSON payload. The
  /// payload is of type blob and uses the <a
  /// href="https://geojson.org/">GeoJSON</a> format, which a format that's used
  /// to encode geographic data structures. A sample payload contains the
  /// timestamp information, the WGS84 coordinates of the location, and the
  /// accuracy and confidence level. For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/location-resolve-console.html">Resolve
  /// device location (console)</a>.
  final Uint8List? geoJsonPayload;

  GetPositionEstimateResponse({
    this.geoJsonPayload,
  });

  Map<String, dynamic> toJson() {
    final geoJsonPayload = this.geoJsonPayload;
    return {
      if (geoJsonPayload != null)
        'GeoJsonPayload': base64Encode(geoJsonPayload),
    };
  }
}

@Deprecated('This operation is no longer supported.')
class GetPositionResponse {
  /// The accuracy of the estimated position in meters. An empty value indicates
  /// that no position data is available. A value of ‘0.0’ value indicates that
  /// position data is available. This data corresponds to the position
  /// information that you specified instead of the position computed by solver.
  final Accuracy? accuracy;

  /// The position information of the resource.
  final List<double>? position;

  /// The vendor of the positioning solver.
  final PositionSolverProvider? solverProvider;

  /// The type of solver used to identify the position of the resource.
  final PositionSolverType? solverType;

  /// The version of the positioning solver.
  final String? solverVersion;

  /// The timestamp at which the device's position was determined.
  final String? timestamp;

  GetPositionResponse({
    this.accuracy,
    this.position,
    this.solverProvider,
    this.solverType,
    this.solverVersion,
    this.timestamp,
  });

  factory GetPositionResponse.fromJson(Map<String, dynamic> json) {
    return GetPositionResponse(
      accuracy: json['Accuracy'] != null
          ? Accuracy.fromJson(json['Accuracy'] as Map<String, dynamic>)
          : null,
      position: (json['Position'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
      solverProvider:
          (json['SolverProvider'] as String?)?.toPositionSolverProvider(),
      solverType: (json['SolverType'] as String?)?.toPositionSolverType(),
      solverVersion: json['SolverVersion'] as String?,
      timestamp: json['Timestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accuracy = this.accuracy;
    final position = this.position;
    final solverProvider = this.solverProvider;
    final solverType = this.solverType;
    final solverVersion = this.solverVersion;
    final timestamp = this.timestamp;
    return {
      if (accuracy != null) 'Accuracy': accuracy,
      if (position != null) 'Position': position,
      if (solverProvider != null) 'SolverProvider': solverProvider.toValue(),
      if (solverType != null) 'SolverType': solverType.toValue(),
      if (solverVersion != null) 'SolverVersion': solverVersion,
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

class GetResourceEventConfigurationResponse {
  /// Event configuration for the connection status event.
  final ConnectionStatusEventConfiguration? connectionStatus;

  /// Event configuration for the device registration state event.
  final DeviceRegistrationStateEventConfiguration? deviceRegistrationState;

  /// Event configuration for the join event.
  final JoinEventConfiguration? join;

  /// Event configuration for the message delivery status event.
  final MessageDeliveryStatusEventConfiguration? messageDeliveryStatus;

  /// Event configuration for the proximity event.
  final ProximityEventConfiguration? proximity;

  GetResourceEventConfigurationResponse({
    this.connectionStatus,
    this.deviceRegistrationState,
    this.join,
    this.messageDeliveryStatus,
    this.proximity,
  });

  factory GetResourceEventConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceEventConfigurationResponse(
      connectionStatus: json['ConnectionStatus'] != null
          ? ConnectionStatusEventConfiguration.fromJson(
              json['ConnectionStatus'] as Map<String, dynamic>)
          : null,
      deviceRegistrationState: json['DeviceRegistrationState'] != null
          ? DeviceRegistrationStateEventConfiguration.fromJson(
              json['DeviceRegistrationState'] as Map<String, dynamic>)
          : null,
      join: json['Join'] != null
          ? JoinEventConfiguration.fromJson(
              json['Join'] as Map<String, dynamic>)
          : null,
      messageDeliveryStatus: json['MessageDeliveryStatus'] != null
          ? MessageDeliveryStatusEventConfiguration.fromJson(
              json['MessageDeliveryStatus'] as Map<String, dynamic>)
          : null,
      proximity: json['Proximity'] != null
          ? ProximityEventConfiguration.fromJson(
              json['Proximity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final deviceRegistrationState = this.deviceRegistrationState;
    final join = this.join;
    final messageDeliveryStatus = this.messageDeliveryStatus;
    final proximity = this.proximity;
    return {
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus,
      if (deviceRegistrationState != null)
        'DeviceRegistrationState': deviceRegistrationState,
      if (join != null) 'Join': join,
      if (messageDeliveryStatus != null)
        'MessageDeliveryStatus': messageDeliveryStatus,
      if (proximity != null) 'Proximity': proximity,
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

class GetResourcePositionResponse {
  /// The position information of the resource, displayed as a JSON payload. The
  /// payload uses the GeoJSON format, which a format that's used to encode
  /// geographic data structures. For more information, see <a
  /// href="https://geojson.org/">GeoJSON</a>.
  final Uint8List? geoJsonPayload;

  GetResourcePositionResponse({
    this.geoJsonPayload,
  });

  Map<String, dynamic> toJson() {
    final geoJsonPayload = this.geoJsonPayload;
    return {
      if (geoJsonPayload != null)
        'GeoJsonPayload': base64Encode(geoJsonPayload),
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

class GetWirelessDeviceImportTaskResponse {
  /// The ARN (Amazon Resource Name) of the import task.
  final String? arn;

  /// The time at which the import task was created.
  final DateTime? creationTime;

  /// The name of the destination that's assigned to the wireless devices in the
  /// import task.
  final String? destinationName;

  /// The number of devices in the import task that failed to onboard to the
  /// import task.
  final int? failedImportedDeviceCount;

  /// The identifier of the import task for which information is retrieved.
  final String? id;

  /// The number of devices in the import task that are waiting for the control
  /// log to start processing.
  final int? initializedImportedDeviceCount;

  /// The number of devices in the import task that have been onboarded to the
  /// import task.
  final int? onboardedImportedDeviceCount;

  /// The number of devices in the import task that are waiting in the import task
  /// queue to be onboarded.
  final int? pendingImportedDeviceCount;

  /// The Sidewalk-related information about an import task.
  final SidewalkGetStartImportInfo? sidewalk;

  /// The import task status.
  final ImportTaskStatus? status;

  /// The reason for the provided status information, such as a validation error
  /// that causes the import task to fail.
  final String? statusReason;

  GetWirelessDeviceImportTaskResponse({
    this.arn,
    this.creationTime,
    this.destinationName,
    this.failedImportedDeviceCount,
    this.id,
    this.initializedImportedDeviceCount,
    this.onboardedImportedDeviceCount,
    this.pendingImportedDeviceCount,
    this.sidewalk,
    this.status,
    this.statusReason,
  });

  factory GetWirelessDeviceImportTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return GetWirelessDeviceImportTaskResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      destinationName: json['DestinationName'] as String?,
      failedImportedDeviceCount: json['FailedImportedDeviceCount'] as int?,
      id: json['Id'] as String?,
      initializedImportedDeviceCount:
          json['InitializedImportedDeviceCount'] as int?,
      onboardedImportedDeviceCount:
          json['OnboardedImportedDeviceCount'] as int?,
      pendingImportedDeviceCount: json['PendingImportedDeviceCount'] as int?,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkGetStartImportInfo.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toImportTaskStatus(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final failedImportedDeviceCount = this.failedImportedDeviceCount;
    final id = this.id;
    final initializedImportedDeviceCount = this.initializedImportedDeviceCount;
    final onboardedImportedDeviceCount = this.onboardedImportedDeviceCount;
    final pendingImportedDeviceCount = this.pendingImportedDeviceCount;
    final sidewalk = this.sidewalk;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (destinationName != null) 'DestinationName': destinationName,
      if (failedImportedDeviceCount != null)
        'FailedImportedDeviceCount': failedImportedDeviceCount,
      if (id != null) 'Id': id,
      if (initializedImportedDeviceCount != null)
        'InitializedImportedDeviceCount': initializedImportedDeviceCount,
      if (onboardedImportedDeviceCount != null)
        'OnboardedImportedDeviceCount': onboardedImportedDeviceCount,
      if (pendingImportedDeviceCount != null)
        'PendingImportedDeviceCount': pendingImportedDeviceCount,
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
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

  /// FPort values for the GNSS, stream, and ClockSync functions of the
  /// positioning information.
  final PositioningConfigStatus? positioning;

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
    this.positioning,
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
      positioning:
          (json['Positioning'] as String?)?.toPositioningConfigStatus(),
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
    final positioning = this.positioning;
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
      if (positioning != null) 'Positioning': positioning.toValue(),
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (thingArn != null) 'ThingArn': thingArn,
      if (thingName != null) 'ThingName': thingName,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class GetWirelessDeviceStatisticsResponse {
  /// The date and time when the most recent uplink was received.
  /// <note>
  /// This value is only valid for 3 months.
  /// </note>
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
  /// <note>
  /// This value is only valid for 3 months.
  /// </note>
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
  /// <note>
  /// This value is only valid for 3 months.
  /// </note>
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

/// Global identity information.
class GlobalIdentity {
  /// GERAN (GSM EDGE Radio Access Network) cell global identifier.
  final int geranCid;

  /// Location area code of the global identity.
  final int lac;

  GlobalIdentity({
    required this.geranCid,
    required this.lac,
  });

  Map<String, dynamic> toJson() {
    final geranCid = this.geranCid;
    final lac = this.lac;
    return {
      'GeranCid': geranCid,
      'Lac': lac,
    };
  }
}

/// Global navigation satellite system (GNSS) object used for positioning.
class Gnss {
  /// Payload that contains the GNSS scan result, or NAV message, in hexadecimal
  /// notation.
  final String payload;

  /// Optional assistance altitude, which is the altitude of the device at capture
  /// time, specified in meters above the WGS84 reference ellipsoid.
  final double? assistAltitude;

  /// Optional assistance position information, specified using latitude and
  /// longitude values in degrees. The coordinates are inside the WGS84 reference
  /// frame.
  final List<double>? assistPosition;

  /// Optional parameter that gives an estimate of the time when the GNSS scan
  /// information is taken, in seconds GPS time (GPST). If capture time is not
  /// specified, the local server time is used.
  final double? captureTime;

  /// Optional value that gives the capture time estimate accuracy, in seconds. If
  /// capture time accuracy is not specified, default value of 300 is used.
  final double? captureTimeAccuracy;

  /// Optional parameter that forces 2D solve, which modifies the positioning
  /// algorithm to a 2D solution problem. When this parameter is specified, the
  /// assistance altitude should have an accuracy of at least 10 meters.
  final bool? use2DSolver;

  Gnss({
    required this.payload,
    this.assistAltitude,
    this.assistPosition,
    this.captureTime,
    this.captureTimeAccuracy,
    this.use2DSolver,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    final assistAltitude = this.assistAltitude;
    final assistPosition = this.assistPosition;
    final captureTime = this.captureTime;
    final captureTimeAccuracy = this.captureTimeAccuracy;
    final use2DSolver = this.use2DSolver;
    return {
      'Payload': payload,
      if (assistAltitude != null) 'AssistAltitude': assistAltitude,
      if (assistPosition != null) 'AssistPosition': assistPosition,
      if (captureTime != null) 'CaptureTime': captureTime,
      if (captureTimeAccuracy != null)
        'CaptureTimeAccuracy': captureTimeAccuracy,
      if (use2DSolver != null) 'Use2DSolver': use2DSolver,
    };
  }
}

/// GSM local ID information, which corresponds to the local identification
/// parameters of a GSM cell.
class GsmLocalId {
  /// GSM broadcast control channel.
  final int bcch;

  /// GSM base station identity code (BSIC).
  final int bsic;

  GsmLocalId({
    required this.bcch,
    required this.bsic,
  });

  Map<String, dynamic> toJson() {
    final bcch = this.bcch;
    final bsic = this.bsic;
    return {
      'Bcch': bcch,
      'Bsic': bsic,
    };
  }
}

/// GSM object for network measurement reports.
class GsmNmrObj {
  /// GSM broadcast control channel.
  final int bcch;

  /// GSM base station identity code (BSIC).
  final int bsic;

  /// Global identity information of the GSM object.
  final GlobalIdentity? globalIdentity;

  /// Rx level, which is the received signal power, measured in dBm
  /// (decibel-milliwatts).
  final int? rxLevel;

  GsmNmrObj({
    required this.bcch,
    required this.bsic,
    this.globalIdentity,
    this.rxLevel,
  });

  Map<String, dynamic> toJson() {
    final bcch = this.bcch;
    final bsic = this.bsic;
    final globalIdentity = this.globalIdentity;
    final rxLevel = this.rxLevel;
    return {
      'Bcch': bcch,
      'Bsic': bsic,
      if (globalIdentity != null) 'GlobalIdentity': globalIdentity,
      if (rxLevel != null) 'RxLevel': rxLevel,
    };
  }
}

/// GSM object.
class GsmObj {
  /// GERAN (GSM EDGE Radio Access Network) Cell Global Identifier.
  final int geranCid;

  /// Location area code.
  final int lac;

  /// Mobile Country Code.
  final int mcc;

  /// Mobile Network Code.
  final int mnc;

  /// GSM local identification (local ID) information.
  final GsmLocalId? gsmLocalId;

  /// GSM object for network measurement reports.
  final List<GsmNmrObj>? gsmNmr;

  /// Timing advance value, which corresponds to the length of time a signal takes
  /// to reach the base station from a mobile phone.
  final int? gsmTimingAdvance;

  /// Rx level, which is the received signal power, measured in dBm
  /// (decibel-milliwatts).
  final int? rxLevel;

  GsmObj({
    required this.geranCid,
    required this.lac,
    required this.mcc,
    required this.mnc,
    this.gsmLocalId,
    this.gsmNmr,
    this.gsmTimingAdvance,
    this.rxLevel,
  });

  Map<String, dynamic> toJson() {
    final geranCid = this.geranCid;
    final lac = this.lac;
    final mcc = this.mcc;
    final mnc = this.mnc;
    final gsmLocalId = this.gsmLocalId;
    final gsmNmr = this.gsmNmr;
    final gsmTimingAdvance = this.gsmTimingAdvance;
    final rxLevel = this.rxLevel;
    return {
      'GeranCid': geranCid,
      'Lac': lac,
      'Mcc': mcc,
      'Mnc': mnc,
      if (gsmLocalId != null) 'GsmLocalId': gsmLocalId,
      if (gsmNmr != null) 'GsmNmr': gsmNmr,
      if (gsmTimingAdvance != null) 'GsmTimingAdvance': gsmTimingAdvance,
      if (rxLevel != null) 'RxLevel': rxLevel,
    };
  }
}

enum IdentifierType {
  partnerAccountId,
  devEui,
  gatewayEui,
  wirelessDeviceId,
  wirelessGatewayId,
}

extension IdentifierTypeValueExtension on IdentifierType {
  String toValue() {
    switch (this) {
      case IdentifierType.partnerAccountId:
        return 'PartnerAccountId';
      case IdentifierType.devEui:
        return 'DevEui';
      case IdentifierType.gatewayEui:
        return 'GatewayEui';
      case IdentifierType.wirelessDeviceId:
        return 'WirelessDeviceId';
      case IdentifierType.wirelessGatewayId:
        return 'WirelessGatewayId';
    }
  }
}

extension IdentifierTypeFromString on String {
  IdentifierType toIdentifierType() {
    switch (this) {
      case 'PartnerAccountId':
        return IdentifierType.partnerAccountId;
      case 'DevEui':
        return IdentifierType.devEui;
      case 'GatewayEui':
        return IdentifierType.gatewayEui;
      case 'WirelessDeviceId':
        return IdentifierType.wirelessDeviceId;
      case 'WirelessGatewayId':
        return IdentifierType.wirelessGatewayId;
    }
    throw Exception('$this is not known in enum IdentifierType');
  }
}

enum ImportTaskStatus {
  initializing,
  initialized,
  pending,
  complete,
  failed,
  deleting,
}

extension ImportTaskStatusValueExtension on ImportTaskStatus {
  String toValue() {
    switch (this) {
      case ImportTaskStatus.initializing:
        return 'INITIALIZING';
      case ImportTaskStatus.initialized:
        return 'INITIALIZED';
      case ImportTaskStatus.pending:
        return 'PENDING';
      case ImportTaskStatus.complete:
        return 'COMPLETE';
      case ImportTaskStatus.failed:
        return 'FAILED';
      case ImportTaskStatus.deleting:
        return 'DELETING';
    }
  }
}

extension ImportTaskStatusFromString on String {
  ImportTaskStatus toImportTaskStatus() {
    switch (this) {
      case 'INITIALIZING':
        return ImportTaskStatus.initializing;
      case 'INITIALIZED':
        return ImportTaskStatus.initialized;
      case 'PENDING':
        return ImportTaskStatus.pending;
      case 'COMPLETE':
        return ImportTaskStatus.complete;
      case 'FAILED':
        return ImportTaskStatus.failed;
      case 'DELETING':
        return ImportTaskStatus.deleting;
    }
    throw Exception('$this is not known in enum ImportTaskStatus');
  }
}

/// Information about a Sidewalk device that has been added to an import task.
class ImportedSidewalkDevice {
  /// The time at which the status information was last updated.
  final DateTime? lastUpdateTime;

  /// The onboarding status of the Sidewalk device in the import task.
  final OnboardStatus? onboardingStatus;

  /// The reason for the onboarding status information for the Sidewalk device.
  final String? onboardingStatusReason;

  /// The Sidewalk manufacturing serial number (SMSN) of the Sidewalk device.
  final String? sidewalkManufacturingSn;

  ImportedSidewalkDevice({
    this.lastUpdateTime,
    this.onboardingStatus,
    this.onboardingStatusReason,
    this.sidewalkManufacturingSn,
  });

  factory ImportedSidewalkDevice.fromJson(Map<String, dynamic> json) {
    return ImportedSidewalkDevice(
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      onboardingStatus:
          (json['OnboardingStatus'] as String?)?.toOnboardStatus(),
      onboardingStatusReason: json['OnboardingStatusReason'] as String?,
      sidewalkManufacturingSn: json['SidewalkManufacturingSn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdateTime = this.lastUpdateTime;
    final onboardingStatus = this.onboardingStatus;
    final onboardingStatusReason = this.onboardingStatusReason;
    final sidewalkManufacturingSn = this.sidewalkManufacturingSn;
    return {
      if (lastUpdateTime != null)
        'LastUpdateTime': iso8601ToJson(lastUpdateTime),
      if (onboardingStatus != null)
        'OnboardingStatus': onboardingStatus.toValue(),
      if (onboardingStatusReason != null)
        'OnboardingStatusReason': onboardingStatusReason,
      if (sidewalkManufacturingSn != null)
        'SidewalkManufacturingSn': sidewalkManufacturingSn,
    };
  }
}

/// Information about a wireless device that has been added to an import task.
class ImportedWirelessDevice {
  /// The Sidewalk-related information about a device that has been added to an
  /// import task.
  final ImportedSidewalkDevice? sidewalk;

  ImportedWirelessDevice({
    this.sidewalk,
  });

  factory ImportedWirelessDevice.fromJson(Map<String, dynamic> json) {
    return ImportedWirelessDevice(
      sidewalk: json['Sidewalk'] != null
          ? ImportedSidewalkDevice.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

/// IP address used for resolving device location.
class Ip {
  /// IP address information.
  final String ipAddress;

  Ip({
    required this.ipAddress,
  });

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    return {
      'IpAddress': ipAddress,
    };
  }
}

/// Join event configuration object for enabling or disabling topic.
class JoinEventConfiguration {
  /// Join event configuration object for enabling or disabling LoRaWAN related
  /// event topics.
  final LoRaWANJoinEventNotificationConfigurations? loRaWAN;

  /// Denotes whether the wireless device ID join event topic is enabled or
  /// disabled.
  final EventNotificationTopicStatus? wirelessDeviceIdEventTopic;

  JoinEventConfiguration({
    this.loRaWAN,
    this.wirelessDeviceIdEventTopic,
  });

  factory JoinEventConfiguration.fromJson(Map<String, dynamic> json) {
    return JoinEventConfiguration(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANJoinEventNotificationConfigurations.fromJson(
              json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      wirelessDeviceIdEventTopic:
          (json['WirelessDeviceIdEventTopic'] as String?)
              ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    final wirelessDeviceIdEventTopic = this.wirelessDeviceIdEventTopic;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (wirelessDeviceIdEventTopic != null)
        'WirelessDeviceIdEventTopic': wirelessDeviceIdEventTopic.toValue(),
    };
  }
}

/// Join resource type event configuration object for enabling or disabling
/// topic.
class JoinResourceTypeEventConfiguration {
  /// Join resource type event configuration object for enabling or disabling
  /// LoRaWAN related event topics.
  final LoRaWANJoinResourceTypeEventConfiguration? loRaWAN;

  JoinResourceTypeEventConfiguration({
    this.loRaWAN,
  });

  factory JoinResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return JoinResourceTypeEventConfiguration(
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANJoinResourceTypeEventConfiguration.fromJson(
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

class ListDevicesForWirelessDeviceImportTaskResponse {
  /// The name of the Sidewalk destination that describes the IoT rule to route
  /// messages received from devices in an import task that are onboarded to AWS
  /// IoT Wireless.
  final String? destinationName;

  /// List of wireless devices in an import task and their onboarding status.
  final List<ImportedWirelessDevice>? importedWirelessDeviceList;

  /// The token to use to get the next set of results, or <code>null</code> if
  /// there are no additional results.
  final String? nextToken;

  ListDevicesForWirelessDeviceImportTaskResponse({
    this.destinationName,
    this.importedWirelessDeviceList,
    this.nextToken,
  });

  factory ListDevicesForWirelessDeviceImportTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDevicesForWirelessDeviceImportTaskResponse(
      destinationName: json['DestinationName'] as String?,
      importedWirelessDeviceList: (json['ImportedWirelessDeviceList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ImportedWirelessDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationName = this.destinationName;
    final importedWirelessDeviceList = this.importedWirelessDeviceList;
    final nextToken = this.nextToken;
    return {
      if (destinationName != null) 'DestinationName': destinationName,
      if (importedWirelessDeviceList != null)
        'ImportedWirelessDeviceList': importedWirelessDeviceList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventConfigurationsResponse {
  /// Event configurations of all events for a single resource.
  final List<EventConfigurationItem>? eventConfigurationsList;

  /// To retrieve the next set of results, the <code>nextToken</code> value from a
  /// previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  final String? nextToken;

  ListEventConfigurationsResponse({
    this.eventConfigurationsList,
    this.nextToken,
  });

  factory ListEventConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventConfigurationsResponse(
      eventConfigurationsList: (json['EventConfigurationsList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => EventConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventConfigurationsList = this.eventConfigurationsList;
    final nextToken = this.nextToken;
    return {
      if (eventConfigurationsList != null)
        'EventConfigurationsList': eventConfigurationsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFuotaTasksResponse {
  final List<FuotaTask>? fuotaTaskList;

  /// To retrieve the next set of results, the <code>nextToken</code> value from a
  /// previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  final String? nextToken;

  ListFuotaTasksResponse({
    this.fuotaTaskList,
    this.nextToken,
  });

  factory ListFuotaTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListFuotaTasksResponse(
      fuotaTaskList: (json['FuotaTaskList'] as List?)
          ?.whereNotNull()
          .map((e) => FuotaTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fuotaTaskList = this.fuotaTaskList;
    final nextToken = this.nextToken;
    return {
      if (fuotaTaskList != null) 'FuotaTaskList': fuotaTaskList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMulticastGroupsByFuotaTaskResponse {
  final List<MulticastGroupByFuotaTask>? multicastGroupList;

  /// To retrieve the next set of results, the <code>nextToken</code> value from a
  /// previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  final String? nextToken;

  ListMulticastGroupsByFuotaTaskResponse({
    this.multicastGroupList,
    this.nextToken,
  });

  factory ListMulticastGroupsByFuotaTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMulticastGroupsByFuotaTaskResponse(
      multicastGroupList: (json['MulticastGroupList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MulticastGroupByFuotaTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multicastGroupList = this.multicastGroupList;
    final nextToken = this.nextToken;
    return {
      if (multicastGroupList != null) 'MulticastGroupList': multicastGroupList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMulticastGroupsResponse {
  final List<MulticastGroup>? multicastGroupList;

  /// To retrieve the next set of results, the <code>nextToken</code> value from a
  /// previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  final String? nextToken;

  ListMulticastGroupsResponse({
    this.multicastGroupList,
    this.nextToken,
  });

  factory ListMulticastGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListMulticastGroupsResponse(
      multicastGroupList: (json['MulticastGroupList'] as List?)
          ?.whereNotNull()
          .map((e) => MulticastGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multicastGroupList = this.multicastGroupList;
    final nextToken = this.nextToken;
    return {
      if (multicastGroupList != null) 'MulticastGroupList': multicastGroupList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListNetworkAnalyzerConfigurationsResponse {
  /// The list of network analyzer configurations.
  final List<NetworkAnalyzerConfigurations>? networkAnalyzerConfigurationList;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  ListNetworkAnalyzerConfigurationsResponse({
    this.networkAnalyzerConfigurationList,
    this.nextToken,
  });

  factory ListNetworkAnalyzerConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkAnalyzerConfigurationsResponse(
      networkAnalyzerConfigurationList:
          (json['NetworkAnalyzerConfigurationList'] as List?)
              ?.whereNotNull()
              .map((e) => NetworkAnalyzerConfigurations.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkAnalyzerConfigurationList =
        this.networkAnalyzerConfigurationList;
    final nextToken = this.nextToken;
    return {
      if (networkAnalyzerConfigurationList != null)
        'NetworkAnalyzerConfigurationList': networkAnalyzerConfigurationList,
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

@Deprecated('This operation is no longer supported.')
class ListPositionConfigurationsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  final String? nextToken;

  /// A list of position configurations.
  final List<PositionConfigurationItem>? positionConfigurationList;

  ListPositionConfigurationsResponse({
    this.nextToken,
    this.positionConfigurationList,
  });

  factory ListPositionConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPositionConfigurationsResponse(
      nextToken: json['NextToken'] as String?,
      positionConfigurationList: (json['PositionConfigurationList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PositionConfigurationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final positionConfigurationList = this.positionConfigurationList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (positionConfigurationList != null)
        'PositionConfigurationList': positionConfigurationList,
    };
  }
}

class ListQueuedMessagesResponse {
  /// The messages in the downlink queue.
  final List<DownlinkQueueMessage>? downlinkQueueMessagesList;

  /// To retrieve the next set of results, the <code>nextToken</code> value from a
  /// previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  final String? nextToken;

  ListQueuedMessagesResponse({
    this.downlinkQueueMessagesList,
    this.nextToken,
  });

  factory ListQueuedMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueuedMessagesResponse(
      downlinkQueueMessagesList: (json['DownlinkQueueMessagesList'] as List?)
          ?.whereNotNull()
          .map((e) => DownlinkQueueMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downlinkQueueMessagesList = this.downlinkQueueMessagesList;
    final nextToken = this.nextToken;
    return {
      if (downlinkQueueMessagesList != null)
        'DownlinkQueueMessagesList': downlinkQueueMessagesList,
      if (nextToken != null) 'NextToken': nextToken,
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

class ListWirelessDeviceImportTasksResponse {
  /// The token to use to get the next set of results, or <code>null</code> if
  /// there are no additional results.
  final String? nextToken;

  /// List of import tasks and summary information of onboarding status of devices
  /// in each import task.
  final List<WirelessDeviceImportTask>? wirelessDeviceImportTaskList;

  ListWirelessDeviceImportTasksResponse({
    this.nextToken,
    this.wirelessDeviceImportTaskList,
  });

  factory ListWirelessDeviceImportTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWirelessDeviceImportTasksResponse(
      nextToken: json['NextToken'] as String?,
      wirelessDeviceImportTaskList:
          (json['WirelessDeviceImportTaskList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  WirelessDeviceImportTask.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final wirelessDeviceImportTaskList = this.wirelessDeviceImportTaskList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (wirelessDeviceImportTaskList != null)
        'WirelessDeviceImportTaskList': wirelessDeviceImportTaskList,
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

/// Object for LoRaWAN connection status resource type event configuration.
class LoRaWANConnectionStatusEventNotificationConfigurations {
  /// Denotes whether the gateway EUI connection status event topic is enabled or
  /// disabled.
  final EventNotificationTopicStatus? gatewayEuiEventTopic;

  LoRaWANConnectionStatusEventNotificationConfigurations({
    this.gatewayEuiEventTopic,
  });

  factory LoRaWANConnectionStatusEventNotificationConfigurations.fromJson(
      Map<String, dynamic> json) {
    return LoRaWANConnectionStatusEventNotificationConfigurations(
      gatewayEuiEventTopic: (json['GatewayEuiEventTopic'] as String?)
          ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayEuiEventTopic = this.gatewayEuiEventTopic;
    return {
      if (gatewayEuiEventTopic != null)
        'GatewayEuiEventTopic': gatewayEuiEventTopic.toValue(),
    };
  }
}

/// Object for LoRaWAN connection status resource type event configuration.
class LoRaWANConnectionStatusResourceTypeEventConfiguration {
  /// Denotes whether the wireless gateway connection status event topic is
  /// enabled or disabled.
  final EventNotificationTopicStatus? wirelessGatewayEventTopic;

  LoRaWANConnectionStatusResourceTypeEventConfiguration({
    this.wirelessGatewayEventTopic,
  });

  factory LoRaWANConnectionStatusResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LoRaWANConnectionStatusResourceTypeEventConfiguration(
      wirelessGatewayEventTopic: (json['WirelessGatewayEventTopic'] as String?)
          ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final wirelessGatewayEventTopic = this.wirelessGatewayEventTopic;
    return {
      if (wirelessGatewayEventTopic != null)
        'WirelessGatewayEventTopic': wirelessGatewayEventTopic.toValue(),
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
  final FPorts? fPorts;

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
    this.fPorts,
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
      fPorts: json['FPorts'] != null
          ? FPorts.fromJson(json['FPorts'] as Map<String, dynamic>)
          : null,
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
    final fPorts = this.fPorts;
    final otaaV1_0X = this.otaaV1_0X;
    final otaaV1_1 = this.otaaV1_1;
    final serviceProfileId = this.serviceProfileId;
    return {
      if (abpV1_0X != null) 'AbpV1_0_x': abpV1_0X,
      if (abpV1_1 != null) 'AbpV1_1': abpV1_1,
      if (devEui != null) 'DevEui': devEui,
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
      if (fPorts != null) 'FPorts': fPorts,
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

  /// Information about the LoRaWAN public network accessed by the device.
  final List<LoRaWANPublicGatewayMetadata>? publicGateways;

  /// The date and time of the metadata.
  final String? timestamp;

  LoRaWANDeviceMetadata({
    this.dataRate,
    this.devEui,
    this.fPort,
    this.frequency,
    this.gateways,
    this.publicGateways,
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
      publicGateways: (json['PublicGateways'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LoRaWANPublicGatewayMetadata.fromJson(e as Map<String, dynamic>))
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
    final publicGateways = this.publicGateways;
    final timestamp = this.timestamp;
    return {
      if (dataRate != null) 'DataRate': dataRate,
      if (devEui != null) 'DevEui': devEui,
      if (fPort != null) 'FPort': fPort,
      if (frequency != null) 'Frequency': frequency,
      if (gateways != null) 'Gateways': gateways,
      if (publicGateways != null) 'PublicGateways': publicGateways,
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

  /// The MaxDutyCycle value. It ranges from 0 to 15.
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

/// The LoRaWAN information used with a FUOTA task.
class LoRaWANFuotaTask {
  final SupportedRfRegion? rfRegion;

  LoRaWANFuotaTask({
    this.rfRegion,
  });

  Map<String, dynamic> toJson() {
    final rfRegion = this.rfRegion;
    return {
      if (rfRegion != null) 'RfRegion': rfRegion.toValue(),
    };
  }
}

/// The LoRaWAN information returned from getting a FUOTA task.
class LoRaWANFuotaTaskGetInfo {
  final String? rfRegion;
  final DateTime? startTime;

  LoRaWANFuotaTaskGetInfo({
    this.rfRegion,
    this.startTime,
  });

  factory LoRaWANFuotaTaskGetInfo.fromJson(Map<String, dynamic> json) {
    return LoRaWANFuotaTaskGetInfo(
      rfRegion: json['RfRegion'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final rfRegion = this.rfRegion;
    final startTime = this.startTime;
    return {
      if (rfRegion != null) 'RfRegion': rfRegion,
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
    };
  }
}

/// LoRaWANGateway object.
class LoRaWANGateway {
  /// Beaconing object information, which consists of the data rate and frequency
  /// parameters.
  final Beaconing? beaconing;

  /// The gateway's EUI value.
  final String? gatewayEui;
  final List<List<String>>? joinEuiFilters;

  /// The MaxEIRP value.
  final double? maxEirp;
  final List<String>? netIdFilters;

  /// The frequency band (RFRegion) value.
  final String? rfRegion;
  final List<int>? subBands;

  LoRaWANGateway({
    this.beaconing,
    this.gatewayEui,
    this.joinEuiFilters,
    this.maxEirp,
    this.netIdFilters,
    this.rfRegion,
    this.subBands,
  });

  factory LoRaWANGateway.fromJson(Map<String, dynamic> json) {
    return LoRaWANGateway(
      beaconing: json['Beaconing'] != null
          ? Beaconing.fromJson(json['Beaconing'] as Map<String, dynamic>)
          : null,
      gatewayEui: json['GatewayEui'] as String?,
      joinEuiFilters: (json['JoinEuiFilters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
      maxEirp: json['MaxEirp'] as double?,
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
    final beaconing = this.beaconing;
    final gatewayEui = this.gatewayEui;
    final joinEuiFilters = this.joinEuiFilters;
    final maxEirp = this.maxEirp;
    final netIdFilters = this.netIdFilters;
    final rfRegion = this.rfRegion;
    final subBands = this.subBands;
    return {
      if (beaconing != null) 'Beaconing': beaconing,
      if (gatewayEui != null) 'GatewayEui': gatewayEui,
      if (joinEuiFilters != null) 'JoinEuiFilters': joinEuiFilters,
      if (maxEirp != null) 'MaxEirp': maxEirp,
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

/// Object for LoRaWAN join resource type event configuration.
class LoRaWANJoinEventNotificationConfigurations {
  /// Denotes whether the Dev EUI join event topic is enabled or disabled.
  final EventNotificationTopicStatus? devEuiEventTopic;

  LoRaWANJoinEventNotificationConfigurations({
    this.devEuiEventTopic,
  });

  factory LoRaWANJoinEventNotificationConfigurations.fromJson(
      Map<String, dynamic> json) {
    return LoRaWANJoinEventNotificationConfigurations(
      devEuiEventTopic: (json['DevEuiEventTopic'] as String?)
          ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final devEuiEventTopic = this.devEuiEventTopic;
    return {
      if (devEuiEventTopic != null)
        'DevEuiEventTopic': devEuiEventTopic.toValue(),
    };
  }
}

/// Object for LoRaWAN join resource type event configuration.
class LoRaWANJoinResourceTypeEventConfiguration {
  /// Denotes whether the wireless device join event topic is enabled or disabled.
  final EventNotificationTopicStatus? wirelessDeviceEventTopic;

  LoRaWANJoinResourceTypeEventConfiguration({
    this.wirelessDeviceEventTopic,
  });

  factory LoRaWANJoinResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return LoRaWANJoinResourceTypeEventConfiguration(
      wirelessDeviceEventTopic: (json['WirelessDeviceEventTopic'] as String?)
          ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final wirelessDeviceEventTopic = this.wirelessDeviceEventTopic;
    return {
      if (wirelessDeviceEventTopic != null)
        'WirelessDeviceEventTopic': wirelessDeviceEventTopic.toValue(),
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

/// The LoRaWAN information that is to be used with the multicast group.
class LoRaWANMulticast {
  final DlClass? dlClass;
  final SupportedRfRegion? rfRegion;

  LoRaWANMulticast({
    this.dlClass,
    this.rfRegion,
  });

  Map<String, dynamic> toJson() {
    final dlClass = this.dlClass;
    final rfRegion = this.rfRegion;
    return {
      if (dlClass != null) 'DlClass': dlClass.toValue(),
      if (rfRegion != null) 'RfRegion': rfRegion.toValue(),
    };
  }
}

/// The LoRaWAN information that is to be returned from getting multicast group
/// information.
class LoRaWANMulticastGet {
  final DlClass? dlClass;
  final int? numberOfDevicesInGroup;
  final int? numberOfDevicesRequested;
  final SupportedRfRegion? rfRegion;

  LoRaWANMulticastGet({
    this.dlClass,
    this.numberOfDevicesInGroup,
    this.numberOfDevicesRequested,
    this.rfRegion,
  });

  factory LoRaWANMulticastGet.fromJson(Map<String, dynamic> json) {
    return LoRaWANMulticastGet(
      dlClass: (json['DlClass'] as String?)?.toDlClass(),
      numberOfDevicesInGroup: json['NumberOfDevicesInGroup'] as int?,
      numberOfDevicesRequested: json['NumberOfDevicesRequested'] as int?,
      rfRegion: (json['RfRegion'] as String?)?.toSupportedRfRegion(),
    );
  }

  Map<String, dynamic> toJson() {
    final dlClass = this.dlClass;
    final numberOfDevicesInGroup = this.numberOfDevicesInGroup;
    final numberOfDevicesRequested = this.numberOfDevicesRequested;
    final rfRegion = this.rfRegion;
    return {
      if (dlClass != null) 'DlClass': dlClass.toValue(),
      if (numberOfDevicesInGroup != null)
        'NumberOfDevicesInGroup': numberOfDevicesInGroup,
      if (numberOfDevicesRequested != null)
        'NumberOfDevicesRequested': numberOfDevicesRequested,
      if (rfRegion != null) 'RfRegion': rfRegion.toValue(),
    };
  }
}

/// The metadata information of the LoRaWAN multicast group.
class LoRaWANMulticastMetadata {
  final int? fPort;

  LoRaWANMulticastMetadata({
    this.fPort,
  });

  Map<String, dynamic> toJson() {
    final fPort = this.fPort;
    return {
      if (fPort != null) 'FPort': fPort,
    };
  }
}

/// The LoRaWAN information used with the multicast session.
class LoRaWANMulticastSession {
  final int? dlDr;
  final int? dlFreq;

  /// The PingSlotPeriod value.
  final int? pingSlotPeriod;
  final DateTime? sessionStartTime;
  final int? sessionTimeout;

  LoRaWANMulticastSession({
    this.dlDr,
    this.dlFreq,
    this.pingSlotPeriod,
    this.sessionStartTime,
    this.sessionTimeout,
  });

  factory LoRaWANMulticastSession.fromJson(Map<String, dynamic> json) {
    return LoRaWANMulticastSession(
      dlDr: json['DlDr'] as int?,
      dlFreq: json['DlFreq'] as int?,
      pingSlotPeriod: json['PingSlotPeriod'] as int?,
      sessionStartTime: timeStampFromJson(json['SessionStartTime']),
      sessionTimeout: json['SessionTimeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dlDr = this.dlDr;
    final dlFreq = this.dlFreq;
    final pingSlotPeriod = this.pingSlotPeriod;
    final sessionStartTime = this.sessionStartTime;
    final sessionTimeout = this.sessionTimeout;
    return {
      if (dlDr != null) 'DlDr': dlDr,
      if (dlFreq != null) 'DlFreq': dlFreq,
      if (pingSlotPeriod != null) 'PingSlotPeriod': pingSlotPeriod,
      if (sessionStartTime != null)
        'SessionStartTime': iso8601ToJson(sessionStartTime),
      if (sessionTimeout != null) 'SessionTimeout': sessionTimeout,
    };
  }
}

/// LoRaWAN public gateway metadata.
class LoRaWANPublicGatewayMetadata {
  /// Boolean that indicates whether downlink is allowed using the network.
  final bool? dlAllowed;

  /// The ID of the gateways that are operated by the network provider.
  final String? id;

  /// The ID of the LoRaWAN public network provider.
  final String? providerNetId;
  final String? rfRegion;

  /// The RSSI (received signal strength indicator) value.
  final double? rssi;

  /// The SNR (signal to noise ratio) value.
  final double? snr;

  LoRaWANPublicGatewayMetadata({
    this.dlAllowed,
    this.id,
    this.providerNetId,
    this.rfRegion,
    this.rssi,
    this.snr,
  });

  factory LoRaWANPublicGatewayMetadata.fromJson(Map<String, dynamic> json) {
    return LoRaWANPublicGatewayMetadata(
      dlAllowed: json['DlAllowed'] as bool?,
      id: json['Id'] as String?,
      providerNetId: json['ProviderNetId'] as String?,
      rfRegion: json['RfRegion'] as String?,
      rssi: json['Rssi'] as double?,
      snr: json['Snr'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dlAllowed = this.dlAllowed;
    final id = this.id;
    final providerNetId = this.providerNetId;
    final rfRegion = this.rfRegion;
    final rssi = this.rssi;
    final snr = this.snr;
    return {
      if (dlAllowed != null) 'DlAllowed': dlAllowed,
      if (id != null) 'Id': id,
      if (providerNetId != null) 'ProviderNetId': providerNetId,
      if (rfRegion != null) 'RfRegion': rfRegion,
      if (rssi != null) 'Rssi': rssi,
      if (snr != null) 'Snr': snr,
    };
  }
}

/// LoRaWAN router info.
class LoRaWANSendDataToDevice {
  final int? fPort;

  /// Choose the gateways that you want to use for the downlink data traffic when
  /// the wireless device is running in class B or class C mode.
  final ParticipatingGateways? participatingGateways;

  LoRaWANSendDataToDevice({
    this.fPort,
    this.participatingGateways,
  });

  factory LoRaWANSendDataToDevice.fromJson(Map<String, dynamic> json) {
    return LoRaWANSendDataToDevice(
      fPort: json['FPort'] as int?,
      participatingGateways: json['ParticipatingGateways'] != null
          ? ParticipatingGateways.fromJson(
              json['ParticipatingGateways'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fPort = this.fPort;
    final participatingGateways = this.participatingGateways;
    return {
      if (fPort != null) 'FPort': fPort,
      if (participatingGateways != null)
        'ParticipatingGateways': participatingGateways,
    };
  }
}

/// LoRaWANServiceProfile object.
class LoRaWANServiceProfile {
  /// The AddGWMetaData value.
  final bool? addGwMetadata;

  /// The DrMax value.
  final int? drMax;

  /// The DrMin value.
  final int? drMin;

  /// The PRAllowed value that describes whether passive roaming is allowed.
  final bool? prAllowed;

  /// The RAAllowed value that describes whether roaming activation is allowed.
  final bool? raAllowed;

  LoRaWANServiceProfile({
    this.addGwMetadata,
    this.drMax,
    this.drMin,
    this.prAllowed,
    this.raAllowed,
  });

  Map<String, dynamic> toJson() {
    final addGwMetadata = this.addGwMetadata;
    final drMax = this.drMax;
    final drMin = this.drMin;
    final prAllowed = this.prAllowed;
    final raAllowed = this.raAllowed;
    return {
      if (addGwMetadata != null) 'AddGwMetadata': addGwMetadata,
      if (drMax != null) 'DrMax': drMax,
      if (drMin != null) 'DrMin': drMin,
      if (prAllowed != null) 'PrAllowed': prAllowed,
      if (raAllowed != null) 'RaAllowed': raAllowed,
    };
  }
}

/// The LoRaWAN information used to start a FUOTA task.
class LoRaWANStartFuotaTask {
  final DateTime? startTime;

  LoRaWANStartFuotaTask({
    this.startTime,
  });

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    return {
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
    };
  }
}

/// LoRaWAN object for update functions.
class LoRaWANUpdateDevice {
  /// ABP device object for update APIs for v1.0.x
  final UpdateAbpV1_0_x? abpV1_0X;

  /// ABP device object for update APIs for v1.1
  final UpdateAbpV1_1? abpV1_1;

  /// The ID of the device profile for the wireless device.
  final String? deviceProfileId;

  /// FPorts object for the positioning information of the device.
  final UpdateFPorts? fPorts;

  /// The ID of the service profile.
  final String? serviceProfileId;

  LoRaWANUpdateDevice({
    this.abpV1_0X,
    this.abpV1_1,
    this.deviceProfileId,
    this.fPorts,
    this.serviceProfileId,
  });

  Map<String, dynamic> toJson() {
    final abpV1_0X = this.abpV1_0X;
    final abpV1_1 = this.abpV1_1;
    final deviceProfileId = this.deviceProfileId;
    final fPorts = this.fPorts;
    final serviceProfileId = this.serviceProfileId;
    return {
      if (abpV1_0X != null) 'AbpV1_0_x': abpV1_0X,
      if (abpV1_1 != null) 'AbpV1_1': abpV1_1,
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
      if (fPorts != null) 'FPorts': fPorts,
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

/// The log level for a log message. The log levels can be disabled, or set to
/// <code>ERROR</code> to display less verbose logs containing only error
/// information, or to <code>INFO</code> for more detailed logs.
enum LogLevel {
  info,
  error,
  disabled,
}

extension LogLevelValueExtension on LogLevel {
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

extension LogLevelFromString on String {
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

/// LTE local identification (local ID) information.
class LteLocalId {
  /// Evolved universal terrestrial radio access (E-UTRA) absolute radio frequency
  /// channel number (FCN).
  final int earfcn;

  /// Physical cell ID.
  final int pci;

  LteLocalId({
    required this.earfcn,
    required this.pci,
  });

  Map<String, dynamic> toJson() {
    final earfcn = this.earfcn;
    final pci = this.pci;
    return {
      'Earfcn': earfcn,
      'Pci': pci,
    };
  }
}

/// LTE object for network measurement reports.
class LteNmrObj {
  /// E-UTRA (Evolved universal terrestrial Radio Access) absolute radio frequency
  /// channel Number (EARFCN).
  final int earfcn;

  /// E-UTRAN (Evolved Universal Terrestrial Radio Access Network) cell global
  /// identifier (EUTRANCID).
  final int eutranCid;

  /// Physical cell ID.
  final int pci;

  /// Signal power of the reference signal received, measured in dBm
  /// (decibel-milliwatts).
  final int? rsrp;

  /// Signal quality of the reference Signal received, measured in decibels (dB).
  final double? rsrq;

  LteNmrObj({
    required this.earfcn,
    required this.eutranCid,
    required this.pci,
    this.rsrp,
    this.rsrq,
  });

  Map<String, dynamic> toJson() {
    final earfcn = this.earfcn;
    final eutranCid = this.eutranCid;
    final pci = this.pci;
    final rsrp = this.rsrp;
    final rsrq = this.rsrq;
    return {
      'Earfcn': earfcn,
      'EutranCid': eutranCid,
      'Pci': pci,
      if (rsrp != null) 'Rsrp': rsrp,
      if (rsrq != null) 'Rsrq': rsrq,
    };
  }
}

/// LTE object.
class LteObj {
  /// E-UTRAN (Evolved Universal Terrestrial Radio Access Network) Cell Global
  /// Identifier.
  final int eutranCid;

  /// Mobile Country Code.
  final int mcc;

  /// Mobile Network Code.
  final int mnc;

  /// LTE local identification (local ID) information.
  final LteLocalId? lteLocalId;

  /// LTE object for network measurement reports.
  final List<LteNmrObj>? lteNmr;

  /// LTE timing advance.
  final int? lteTimingAdvance;

  /// Parameter that determines whether the LTE object is capable of supporting NR
  /// (new radio).
  final bool? nrCapable;

  /// Signal power of the reference signal received, measured in dBm
  /// (decibel-milliwatts).
  final int? rsrp;

  /// Signal quality of the reference Signal received, measured in decibels (dB).
  final double? rsrq;

  /// LTE tracking area code.
  final int? tac;

  LteObj({
    required this.eutranCid,
    required this.mcc,
    required this.mnc,
    this.lteLocalId,
    this.lteNmr,
    this.lteTimingAdvance,
    this.nrCapable,
    this.rsrp,
    this.rsrq,
    this.tac,
  });

  Map<String, dynamic> toJson() {
    final eutranCid = this.eutranCid;
    final mcc = this.mcc;
    final mnc = this.mnc;
    final lteLocalId = this.lteLocalId;
    final lteNmr = this.lteNmr;
    final lteTimingAdvance = this.lteTimingAdvance;
    final nrCapable = this.nrCapable;
    final rsrp = this.rsrp;
    final rsrq = this.rsrq;
    final tac = this.tac;
    return {
      'EutranCid': eutranCid,
      'Mcc': mcc,
      'Mnc': mnc,
      if (lteLocalId != null) 'LteLocalId': lteLocalId,
      if (lteNmr != null) 'LteNmr': lteNmr,
      if (lteTimingAdvance != null) 'LteTimingAdvance': lteTimingAdvance,
      if (nrCapable != null) 'NrCapable': nrCapable,
      if (rsrp != null) 'Rsrp': rsrp,
      if (rsrq != null) 'Rsrq': rsrq,
      if (tac != null) 'Tac': tac,
    };
  }
}

/// Message delivery status event configuration object for enabling and
/// disabling relevant topics.
class MessageDeliveryStatusEventConfiguration {
  final SidewalkEventNotificationConfigurations? sidewalk;

  /// Denotes whether the wireless device ID message delivery status event topic
  /// is enabled or disabled.
  final EventNotificationTopicStatus? wirelessDeviceIdEventTopic;

  MessageDeliveryStatusEventConfiguration({
    this.sidewalk,
    this.wirelessDeviceIdEventTopic,
  });

  factory MessageDeliveryStatusEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MessageDeliveryStatusEventConfiguration(
      sidewalk: json['Sidewalk'] != null
          ? SidewalkEventNotificationConfigurations.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      wirelessDeviceIdEventTopic:
          (json['WirelessDeviceIdEventTopic'] as String?)
              ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    final wirelessDeviceIdEventTopic = this.wirelessDeviceIdEventTopic;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (wirelessDeviceIdEventTopic != null)
        'WirelessDeviceIdEventTopic': wirelessDeviceIdEventTopic.toValue(),
    };
  }
}

/// Message delivery status resource type event configuration object for
/// enabling or disabling relevant topic.
class MessageDeliveryStatusResourceTypeEventConfiguration {
  final SidewalkResourceTypeEventConfiguration? sidewalk;

  MessageDeliveryStatusResourceTypeEventConfiguration({
    this.sidewalk,
  });

  factory MessageDeliveryStatusResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MessageDeliveryStatusResourceTypeEventConfiguration(
      sidewalk: json['Sidewalk'] != null
          ? SidewalkResourceTypeEventConfiguration.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

/// Sidewalk device message type. Default value is
/// <code>CUSTOM_COMMAND_ID_NOTIFY</code>.
enum MessageType {
  customCommandIdNotify,
  customCommandIdGet,
  customCommandIdSet,
  customCommandIdResp,
}

extension MessageTypeValueExtension on MessageType {
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

extension MessageTypeFromString on String {
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

enum MetricName {
  deviceRSSI,
  deviceSNR,
  deviceUplinkCount,
  deviceDownlinkCount,
  deviceUplinkLostCount,
  deviceUplinkLostRate,
  deviceJoinRequestCount,
  deviceJoinAcceptCount,
  deviceRoamingUplinkCount,
  deviceRoamingDownlinkCount,
  gatewayUpTime,
  gatewayDownTime,
  gatewayRSSI,
  gatewaySNR,
  gatewayUplinkCount,
  gatewayDownlinkCount,
  gatewayJoinRequestCount,
  gatewayJoinAcceptCount,
  awsAccountUplinkCount,
  awsAccountDownlinkCount,
  awsAccountUplinkLostCount,
  awsAccountUplinkLostRate,
  awsAccountJoinRequestCount,
  awsAccountJoinAcceptCount,
  awsAccountRoamingUplinkCount,
  awsAccountRoamingDownlinkCount,
  awsAccountDeviceCount,
  awsAccountGatewayCount,
  awsAccountActiveDeviceCount,
  awsAccountActiveGatewayCount,
}

extension MetricNameValueExtension on MetricName {
  String toValue() {
    switch (this) {
      case MetricName.deviceRSSI:
        return 'DeviceRSSI';
      case MetricName.deviceSNR:
        return 'DeviceSNR';
      case MetricName.deviceUplinkCount:
        return 'DeviceUplinkCount';
      case MetricName.deviceDownlinkCount:
        return 'DeviceDownlinkCount';
      case MetricName.deviceUplinkLostCount:
        return 'DeviceUplinkLostCount';
      case MetricName.deviceUplinkLostRate:
        return 'DeviceUplinkLostRate';
      case MetricName.deviceJoinRequestCount:
        return 'DeviceJoinRequestCount';
      case MetricName.deviceJoinAcceptCount:
        return 'DeviceJoinAcceptCount';
      case MetricName.deviceRoamingUplinkCount:
        return 'DeviceRoamingUplinkCount';
      case MetricName.deviceRoamingDownlinkCount:
        return 'DeviceRoamingDownlinkCount';
      case MetricName.gatewayUpTime:
        return 'GatewayUpTime';
      case MetricName.gatewayDownTime:
        return 'GatewayDownTime';
      case MetricName.gatewayRSSI:
        return 'GatewayRSSI';
      case MetricName.gatewaySNR:
        return 'GatewaySNR';
      case MetricName.gatewayUplinkCount:
        return 'GatewayUplinkCount';
      case MetricName.gatewayDownlinkCount:
        return 'GatewayDownlinkCount';
      case MetricName.gatewayJoinRequestCount:
        return 'GatewayJoinRequestCount';
      case MetricName.gatewayJoinAcceptCount:
        return 'GatewayJoinAcceptCount';
      case MetricName.awsAccountUplinkCount:
        return 'AwsAccountUplinkCount';
      case MetricName.awsAccountDownlinkCount:
        return 'AwsAccountDownlinkCount';
      case MetricName.awsAccountUplinkLostCount:
        return 'AwsAccountUplinkLostCount';
      case MetricName.awsAccountUplinkLostRate:
        return 'AwsAccountUplinkLostRate';
      case MetricName.awsAccountJoinRequestCount:
        return 'AwsAccountJoinRequestCount';
      case MetricName.awsAccountJoinAcceptCount:
        return 'AwsAccountJoinAcceptCount';
      case MetricName.awsAccountRoamingUplinkCount:
        return 'AwsAccountRoamingUplinkCount';
      case MetricName.awsAccountRoamingDownlinkCount:
        return 'AwsAccountRoamingDownlinkCount';
      case MetricName.awsAccountDeviceCount:
        return 'AwsAccountDeviceCount';
      case MetricName.awsAccountGatewayCount:
        return 'AwsAccountGatewayCount';
      case MetricName.awsAccountActiveDeviceCount:
        return 'AwsAccountActiveDeviceCount';
      case MetricName.awsAccountActiveGatewayCount:
        return 'AwsAccountActiveGatewayCount';
    }
  }
}

extension MetricNameFromString on String {
  MetricName toMetricName() {
    switch (this) {
      case 'DeviceRSSI':
        return MetricName.deviceRSSI;
      case 'DeviceSNR':
        return MetricName.deviceSNR;
      case 'DeviceUplinkCount':
        return MetricName.deviceUplinkCount;
      case 'DeviceDownlinkCount':
        return MetricName.deviceDownlinkCount;
      case 'DeviceUplinkLostCount':
        return MetricName.deviceUplinkLostCount;
      case 'DeviceUplinkLostRate':
        return MetricName.deviceUplinkLostRate;
      case 'DeviceJoinRequestCount':
        return MetricName.deviceJoinRequestCount;
      case 'DeviceJoinAcceptCount':
        return MetricName.deviceJoinAcceptCount;
      case 'DeviceRoamingUplinkCount':
        return MetricName.deviceRoamingUplinkCount;
      case 'DeviceRoamingDownlinkCount':
        return MetricName.deviceRoamingDownlinkCount;
      case 'GatewayUpTime':
        return MetricName.gatewayUpTime;
      case 'GatewayDownTime':
        return MetricName.gatewayDownTime;
      case 'GatewayRSSI':
        return MetricName.gatewayRSSI;
      case 'GatewaySNR':
        return MetricName.gatewaySNR;
      case 'GatewayUplinkCount':
        return MetricName.gatewayUplinkCount;
      case 'GatewayDownlinkCount':
        return MetricName.gatewayDownlinkCount;
      case 'GatewayJoinRequestCount':
        return MetricName.gatewayJoinRequestCount;
      case 'GatewayJoinAcceptCount':
        return MetricName.gatewayJoinAcceptCount;
      case 'AwsAccountUplinkCount':
        return MetricName.awsAccountUplinkCount;
      case 'AwsAccountDownlinkCount':
        return MetricName.awsAccountDownlinkCount;
      case 'AwsAccountUplinkLostCount':
        return MetricName.awsAccountUplinkLostCount;
      case 'AwsAccountUplinkLostRate':
        return MetricName.awsAccountUplinkLostRate;
      case 'AwsAccountJoinRequestCount':
        return MetricName.awsAccountJoinRequestCount;
      case 'AwsAccountJoinAcceptCount':
        return MetricName.awsAccountJoinAcceptCount;
      case 'AwsAccountRoamingUplinkCount':
        return MetricName.awsAccountRoamingUplinkCount;
      case 'AwsAccountRoamingDownlinkCount':
        return MetricName.awsAccountRoamingDownlinkCount;
      case 'AwsAccountDeviceCount':
        return MetricName.awsAccountDeviceCount;
      case 'AwsAccountGatewayCount':
        return MetricName.awsAccountGatewayCount;
      case 'AwsAccountActiveDeviceCount':
        return MetricName.awsAccountActiveDeviceCount;
      case 'AwsAccountActiveGatewayCount':
        return MetricName.awsAccountActiveGatewayCount;
    }
    throw Exception('$this is not known in enum MetricName');
  }
}

enum MetricQueryStatus {
  succeeded,
  failed,
}

extension MetricQueryStatusValueExtension on MetricQueryStatus {
  String toValue() {
    switch (this) {
      case MetricQueryStatus.succeeded:
        return 'Succeeded';
      case MetricQueryStatus.failed:
        return 'Failed';
    }
  }
}

extension MetricQueryStatusFromString on String {
  MetricQueryStatus toMetricQueryStatus() {
    switch (this) {
      case 'Succeeded':
        return MetricQueryStatus.succeeded;
      case 'Failed':
        return MetricQueryStatus.failed;
    }
    throw Exception('$this is not known in enum MetricQueryStatus');
  }
}

/// The aggregated values of the metric.
class MetricQueryValue {
  /// The average of the values of all data points collected during the
  /// aggregation period.
  final double? avg;

  /// The maximum of the values of all the data points collected during the
  /// aggregation period.
  final double? max;

  /// The minimum of the values of all data points collected during the
  /// aggregation period.
  final double? min;

  /// The 90th percentile of the values of all data points collected during the
  /// aggregation period.
  final double? p90;

  /// The standard deviation of the values of all data points collected during the
  /// aggregation period.
  final double? std;

  /// The sum of the values of all data points collected during the aggregation
  /// period.
  final double? sum;

  MetricQueryValue({
    this.avg,
    this.max,
    this.min,
    this.p90,
    this.std,
    this.sum,
  });

  factory MetricQueryValue.fromJson(Map<String, dynamic> json) {
    return MetricQueryValue(
      avg: json['Avg'] as double?,
      max: json['Max'] as double?,
      min: json['Min'] as double?,
      p90: json['P90'] as double?,
      std: json['Std'] as double?,
      sum: json['Sum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final avg = this.avg;
    final max = this.max;
    final min = this.min;
    final p90 = this.p90;
    final std = this.std;
    final sum = this.sum;
    return {
      if (avg != null) 'Avg': avg,
      if (max != null) 'Max': max,
      if (min != null) 'Min': min,
      if (p90 != null) 'P90': p90,
      if (std != null) 'Std': std,
      if (sum != null) 'Sum': sum,
    };
  }
}

/// <code>FrameInfo</code> of your multicast group resources for the trace
/// content. Use FrameInfo to debug the multicast communication between your
/// multicast groups and the network server.
enum MulticastFrameInfo {
  enabled,
  disabled,
}

extension MulticastFrameInfoValueExtension on MulticastFrameInfo {
  String toValue() {
    switch (this) {
      case MulticastFrameInfo.enabled:
        return 'ENABLED';
      case MulticastFrameInfo.disabled:
        return 'DISABLED';
    }
  }
}

extension MulticastFrameInfoFromString on String {
  MulticastFrameInfo toMulticastFrameInfo() {
    switch (this) {
      case 'ENABLED':
        return MulticastFrameInfo.enabled;
      case 'DISABLED':
        return MulticastFrameInfo.disabled;
    }
    throw Exception('$this is not known in enum MulticastFrameInfo');
  }
}

/// A multicast group.
class MulticastGroup {
  final String? arn;
  final String? id;
  final String? name;

  MulticastGroup({
    this.arn,
    this.id,
    this.name,
  });

  factory MulticastGroup.fromJson(Map<String, dynamic> json) {
    return MulticastGroup(
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

/// A multicast group that is associated with a FUOTA task.
class MulticastGroupByFuotaTask {
  final String? id;

  MulticastGroupByFuotaTask({
    this.id,
  });

  factory MulticastGroupByFuotaTask.fromJson(Map<String, dynamic> json) {
    return MulticastGroupByFuotaTask(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// Wireless metadata that is to be sent to multicast group.
class MulticastWirelessMetadata {
  final LoRaWANMulticastMetadata? loRaWAN;

  MulticastWirelessMetadata({
    this.loRaWAN,
  });

  Map<String, dynamic> toJson() {
    final loRaWAN = this.loRaWAN;
    return {
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
    };
  }
}

/// Network analyzer configurations.
class NetworkAnalyzerConfigurations {
  /// The Amazon Resource Name of the new resource.
  final String? arn;
  final String? name;

  NetworkAnalyzerConfigurations({
    this.arn,
    this.name,
  });

  factory NetworkAnalyzerConfigurations.fromJson(Map<String, dynamic> json) {
    return NetworkAnalyzerConfigurations(
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

enum OnboardStatus {
  initialized,
  pending,
  onboarded,
  failed,
}

extension OnboardStatusValueExtension on OnboardStatus {
  String toValue() {
    switch (this) {
      case OnboardStatus.initialized:
        return 'INITIALIZED';
      case OnboardStatus.pending:
        return 'PENDING';
      case OnboardStatus.onboarded:
        return 'ONBOARDED';
      case OnboardStatus.failed:
        return 'FAILED';
    }
  }
}

extension OnboardStatusFromString on String {
  OnboardStatus toOnboardStatus() {
    switch (this) {
      case 'INITIALIZED':
        return OnboardStatus.initialized;
      case 'PENDING':
        return OnboardStatus.pending;
      case 'ONBOARDED':
        return OnboardStatus.onboarded;
      case 'FAILED':
        return OnboardStatus.failed;
    }
    throw Exception('$this is not known in enum OnboardStatus');
  }
}

/// OTAA device object for v1.0.x
// ignore: camel_case_types
class OtaaV1_0_x {
  /// The AppEUI value. You specify this value when using LoRaWAN versions v1.0.2
  /// or v1.0.3.
  final String? appEui;

  /// The AppKey value.
  final String? appKey;

  /// The GenAppKey value.
  final String? genAppKey;

  /// The JoinEUI value. You specify this value instead of the AppEUI when using
  /// LoRaWAN version v1.0.4.
  final String? joinEui;

  OtaaV1_0_x({
    this.appEui,
    this.appKey,
    this.genAppKey,
    this.joinEui,
  });

  factory OtaaV1_0_x.fromJson(Map<String, dynamic> json) {
    return OtaaV1_0_x(
      appEui: json['AppEui'] as String?,
      appKey: json['AppKey'] as String?,
      genAppKey: json['GenAppKey'] as String?,
      joinEui: json['JoinEui'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appEui = this.appEui;
    final appKey = this.appKey;
    final genAppKey = this.genAppKey;
    final joinEui = this.joinEui;
    return {
      if (appEui != null) 'AppEui': appEui,
      if (appKey != null) 'AppKey': appKey,
      if (genAppKey != null) 'GenAppKey': genAppKey,
      if (joinEui != null) 'JoinEui': joinEui,
    };
  }
}

/// OTAA device object for v1.1
// ignore: camel_case_types
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

/// Specify the list of gateways to which you want to send downlink data traffic
/// when the wireless device is running in class B or class C mode.
class ParticipatingGateways {
  /// Indicates whether to send the downlink message in sequential mode or
  /// concurrent mode, or to use only the chosen gateways from the previous uplink
  /// message transmission.
  final DownlinkMode downlinkMode;

  /// The list of gateways that you want to use for sending the downlink data
  /// traffic.
  final List<GatewayListItem> gatewayList;

  /// The duration of time for which AWS IoT Core for LoRaWAN will wait before
  /// transmitting the payload to the next gateway.
  final int transmissionInterval;

  ParticipatingGateways({
    required this.downlinkMode,
    required this.gatewayList,
    required this.transmissionInterval,
  });

  factory ParticipatingGateways.fromJson(Map<String, dynamic> json) {
    return ParticipatingGateways(
      downlinkMode: (json['DownlinkMode'] as String).toDownlinkMode(),
      gatewayList: (json['GatewayList'] as List)
          .whereNotNull()
          .map((e) => GatewayListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      transmissionInterval: json['TransmissionInterval'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final downlinkMode = this.downlinkMode;
    final gatewayList = this.gatewayList;
    final transmissionInterval = this.transmissionInterval;
    return {
      'DownlinkMode': downlinkMode.toValue(),
      'GatewayList': gatewayList,
      'TransmissionInterval': transmissionInterval,
    };
  }
}

enum PartnerType {
  sidewalk,
}

extension PartnerTypeValueExtension on PartnerType {
  String toValue() {
    switch (this) {
      case PartnerType.sidewalk:
        return 'Sidewalk';
    }
  }
}

extension PartnerTypeFromString on String {
  PartnerType toPartnerType() {
    switch (this) {
      case 'Sidewalk':
        return PartnerType.sidewalk;
    }
    throw Exception('$this is not known in enum PartnerType');
  }
}

enum PositionConfigurationFec {
  rose,
  none,
}

extension PositionConfigurationFecValueExtension on PositionConfigurationFec {
  String toValue() {
    switch (this) {
      case PositionConfigurationFec.rose:
        return 'ROSE';
      case PositionConfigurationFec.none:
        return 'NONE';
    }
  }
}

extension PositionConfigurationFecFromString on String {
  PositionConfigurationFec toPositionConfigurationFec() {
    switch (this) {
      case 'ROSE':
        return PositionConfigurationFec.rose;
      case 'NONE':
        return PositionConfigurationFec.none;
    }
    throw Exception('$this is not known in enum PositionConfigurationFec');
  }
}

/// The wrapper for a position configuration.
class PositionConfigurationItem {
  /// The position data destination that describes the AWS IoT rule that processes
  /// the device's position data for use by AWS IoT Core for LoRaWAN.
  final String? destination;

  /// Resource identifier for the position configuration.
  final String? resourceIdentifier;

  /// Resource type of the resource for the position configuration.
  final PositionResourceType? resourceType;

  /// The details of the positioning solver object used to compute the location.
  final PositionSolverDetails? solvers;

  PositionConfigurationItem({
    this.destination,
    this.resourceIdentifier,
    this.resourceType,
    this.solvers,
  });

  factory PositionConfigurationItem.fromJson(Map<String, dynamic> json) {
    return PositionConfigurationItem(
      destination: json['Destination'] as String?,
      resourceIdentifier: json['ResourceIdentifier'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toPositionResourceType(),
      solvers: json['Solvers'] != null
          ? PositionSolverDetails.fromJson(
              json['Solvers'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    final solvers = this.solvers;
    return {
      if (destination != null) 'Destination': destination,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (solvers != null) 'Solvers': solvers,
    };
  }
}

enum PositionConfigurationStatus {
  enabled,
  disabled,
}

extension PositionConfigurationStatusValueExtension
    on PositionConfigurationStatus {
  String toValue() {
    switch (this) {
      case PositionConfigurationStatus.enabled:
        return 'Enabled';
      case PositionConfigurationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension PositionConfigurationStatusFromString on String {
  PositionConfigurationStatus toPositionConfigurationStatus() {
    switch (this) {
      case 'Enabled':
        return PositionConfigurationStatus.enabled;
      case 'Disabled':
        return PositionConfigurationStatus.disabled;
    }
    throw Exception('$this is not known in enum PositionConfigurationStatus');
  }
}

enum PositionResourceType {
  wirelessDevice,
  wirelessGateway,
}

extension PositionResourceTypeValueExtension on PositionResourceType {
  String toValue() {
    switch (this) {
      case PositionResourceType.wirelessDevice:
        return 'WirelessDevice';
      case PositionResourceType.wirelessGateway:
        return 'WirelessGateway';
    }
  }
}

extension PositionResourceTypeFromString on String {
  PositionResourceType toPositionResourceType() {
    switch (this) {
      case 'WirelessDevice':
        return PositionResourceType.wirelessDevice;
      case 'WirelessGateway':
        return PositionResourceType.wirelessGateway;
    }
    throw Exception('$this is not known in enum PositionResourceType');
  }
}

/// The wrapper for position solver configurations.
class PositionSolverConfigurations {
  /// The Semtech GNSS solver configuration object.
  final SemtechGnssConfiguration? semtechGnss;

  PositionSolverConfigurations({
    this.semtechGnss,
  });

  Map<String, dynamic> toJson() {
    final semtechGnss = this.semtechGnss;
    return {
      if (semtechGnss != null) 'SemtechGnss': semtechGnss,
    };
  }
}

/// The wrapper for position solver details.
class PositionSolverDetails {
  /// The Semtech GNSS solver object details.
  final SemtechGnssDetail? semtechGnss;

  PositionSolverDetails({
    this.semtechGnss,
  });

  factory PositionSolverDetails.fromJson(Map<String, dynamic> json) {
    return PositionSolverDetails(
      semtechGnss: json['SemtechGnss'] != null
          ? SemtechGnssDetail.fromJson(
              json['SemtechGnss'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final semtechGnss = this.semtechGnss;
    return {
      if (semtechGnss != null) 'SemtechGnss': semtechGnss,
    };
  }
}

enum PositionSolverProvider {
  semtech,
}

extension PositionSolverProviderValueExtension on PositionSolverProvider {
  String toValue() {
    switch (this) {
      case PositionSolverProvider.semtech:
        return 'Semtech';
    }
  }
}

extension PositionSolverProviderFromString on String {
  PositionSolverProvider toPositionSolverProvider() {
    switch (this) {
      case 'Semtech':
        return PositionSolverProvider.semtech;
    }
    throw Exception('$this is not known in enum PositionSolverProvider');
  }
}

enum PositionSolverType {
  gnss,
}

extension PositionSolverTypeValueExtension on PositionSolverType {
  String toValue() {
    switch (this) {
      case PositionSolverType.gnss:
        return 'GNSS';
    }
  }
}

extension PositionSolverTypeFromString on String {
  PositionSolverType toPositionSolverType() {
    switch (this) {
      case 'GNSS':
        return PositionSolverType.gnss;
    }
    throw Exception('$this is not known in enum PositionSolverType');
  }
}

/// The FPorts for the position information.
class Positioning {
  final int? clockSync;
  final int? gnss;
  final int? stream;

  Positioning({
    this.clockSync,
    this.gnss,
    this.stream,
  });

  factory Positioning.fromJson(Map<String, dynamic> json) {
    return Positioning(
      clockSync: json['ClockSync'] as int?,
      gnss: json['Gnss'] as int?,
      stream: json['Stream'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final clockSync = this.clockSync;
    final gnss = this.gnss;
    final stream = this.stream;
    return {
      if (clockSync != null) 'ClockSync': clockSync,
      if (gnss != null) 'Gnss': gnss,
      if (stream != null) 'Stream': stream,
    };
  }
}

enum PositioningConfigStatus {
  enabled,
  disabled,
}

extension PositioningConfigStatusValueExtension on PositioningConfigStatus {
  String toValue() {
    switch (this) {
      case PositioningConfigStatus.enabled:
        return 'Enabled';
      case PositioningConfigStatus.disabled:
        return 'Disabled';
    }
  }
}

extension PositioningConfigStatusFromString on String {
  PositioningConfigStatus toPositioningConfigStatus() {
    switch (this) {
      case 'Enabled':
        return PositioningConfigStatus.enabled;
      case 'Disabled':
        return PositioningConfigStatus.disabled;
    }
    throw Exception('$this is not known in enum PositioningConfigStatus');
  }
}

/// Proximity event configuration object for enabling and disabling relevant
/// topics.
class ProximityEventConfiguration {
  /// Proximity event configuration object for enabling or disabling Sidewalk
  /// related event topics.
  final SidewalkEventNotificationConfigurations? sidewalk;

  /// Denotes whether the wireless device ID proximity event topic is enabled or
  /// disabled.
  final EventNotificationTopicStatus? wirelessDeviceIdEventTopic;

  ProximityEventConfiguration({
    this.sidewalk,
    this.wirelessDeviceIdEventTopic,
  });

  factory ProximityEventConfiguration.fromJson(Map<String, dynamic> json) {
    return ProximityEventConfiguration(
      sidewalk: json['Sidewalk'] != null
          ? SidewalkEventNotificationConfigurations.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      wirelessDeviceIdEventTopic:
          (json['WirelessDeviceIdEventTopic'] as String?)
              ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    final wirelessDeviceIdEventTopic = this.wirelessDeviceIdEventTopic;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (wirelessDeviceIdEventTopic != null)
        'WirelessDeviceIdEventTopic': wirelessDeviceIdEventTopic.toValue(),
    };
  }
}

/// Proximity resource type event configuration object for enabling or disabling
/// topic.
class ProximityResourceTypeEventConfiguration {
  /// Proximity resource type event configuration object for enabling and
  /// disabling wireless device topic.
  final SidewalkResourceTypeEventConfiguration? sidewalk;

  ProximityResourceTypeEventConfiguration({
    this.sidewalk,
  });

  factory ProximityResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProximityResourceTypeEventConfiguration(
      sidewalk: json['Sidewalk'] != null
          ? SidewalkResourceTypeEventConfiguration.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sidewalk = this.sidewalk;
    return {
      if (sidewalk != null) 'Sidewalk': sidewalk,
    };
  }
}

@Deprecated('This operation is no longer supported.')
class PutPositionConfigurationResponse {
  PutPositionConfigurationResponse();

  factory PutPositionConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return PutPositionConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// Information about the Semtech GNSS solver configuration.
class SemtechGnssConfiguration {
  /// Whether forward error correction is enabled.
  final PositionConfigurationFec fec;

  /// The status indicating whether the solver is enabled.
  final PositionConfigurationStatus status;

  SemtechGnssConfiguration({
    required this.fec,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    final fec = this.fec;
    final status = this.status;
    return {
      'Fec': fec.toValue(),
      'Status': status.toValue(),
    };
  }
}

/// Details of the Semtech GNSS solver object.
class SemtechGnssDetail {
  /// Whether forward error correction is enabled.
  final PositionConfigurationFec? fec;

  /// The vendor of the solver object.
  final PositionSolverProvider? provider;

  /// The status indicating whether the solver is enabled.
  final PositionConfigurationStatus? status;

  /// The type of positioning solver used.
  final PositionSolverType? type;

  SemtechGnssDetail({
    this.fec,
    this.provider,
    this.status,
    this.type,
  });

  factory SemtechGnssDetail.fromJson(Map<String, dynamic> json) {
    return SemtechGnssDetail(
      fec: (json['Fec'] as String?)?.toPositionConfigurationFec(),
      provider: (json['Provider'] as String?)?.toPositionSolverProvider(),
      status: (json['Status'] as String?)?.toPositionConfigurationStatus(),
      type: (json['Type'] as String?)?.toPositionSolverType(),
    );
  }

  Map<String, dynamic> toJson() {
    final fec = this.fec;
    final provider = this.provider;
    final status = this.status;
    final type = this.type;
    return {
      if (fec != null) 'Fec': fec.toValue(),
      if (provider != null) 'Provider': provider.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class SendDataToMulticastGroupResponse {
  final String? messageId;

  SendDataToMulticastGroupResponse({
    this.messageId,
  });

  factory SendDataToMulticastGroupResponse.fromJson(Map<String, dynamic> json) {
    return SendDataToMulticastGroupResponse(
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
// ignore: camel_case_types
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
// ignore: camel_case_types
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

/// Sidewalk object for creating a device profile.
class SidewalkCreateDeviceProfile {
  SidewalkCreateDeviceProfile();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Sidewalk object for creating a wireless device.
class SidewalkCreateWirelessDevice {
  /// The ID of the Sidewalk device profile.
  final String? deviceProfileId;

  SidewalkCreateWirelessDevice({
    this.deviceProfileId,
  });

  Map<String, dynamic> toJson() {
    final deviceProfileId = this.deviceProfileId;
    return {
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
    };
  }
}

/// Sidewalk device object.
class SidewalkDevice {
  final String? amazonId;

  /// The ID of the Sidewalk device profile.
  final String? certificateId;

  /// The sidewalk device certificates for Ed25519 and P256r1.
  final List<CertificateList>? deviceCertificates;

  /// The ID of the Sidewalk device profile.
  final String? deviceProfileId;

  /// The Sidewalk device private keys that will be used for onboarding the
  /// device.
  final List<CertificateList>? privateKeys;

  /// The sidewalk device identification.
  final String? sidewalkId;

  /// The Sidewalk manufacturing series number.
  final String? sidewalkManufacturingSn;

  /// The Sidewalk device status, such as provisioned or registered.
  final WirelessDeviceSidewalkStatus? status;

  SidewalkDevice({
    this.amazonId,
    this.certificateId,
    this.deviceCertificates,
    this.deviceProfileId,
    this.privateKeys,
    this.sidewalkId,
    this.sidewalkManufacturingSn,
    this.status,
  });

  factory SidewalkDevice.fromJson(Map<String, dynamic> json) {
    return SidewalkDevice(
      amazonId: json['AmazonId'] as String?,
      certificateId: json['CertificateId'] as String?,
      deviceCertificates: (json['DeviceCertificates'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateList.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceProfileId: json['DeviceProfileId'] as String?,
      privateKeys: (json['PrivateKeys'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateList.fromJson(e as Map<String, dynamic>))
          .toList(),
      sidewalkId: json['SidewalkId'] as String?,
      sidewalkManufacturingSn: json['SidewalkManufacturingSn'] as String?,
      status: (json['Status'] as String?)?.toWirelessDeviceSidewalkStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final amazonId = this.amazonId;
    final certificateId = this.certificateId;
    final deviceCertificates = this.deviceCertificates;
    final deviceProfileId = this.deviceProfileId;
    final privateKeys = this.privateKeys;
    final sidewalkId = this.sidewalkId;
    final sidewalkManufacturingSn = this.sidewalkManufacturingSn;
    final status = this.status;
    return {
      if (amazonId != null) 'AmazonId': amazonId,
      if (certificateId != null) 'CertificateId': certificateId,
      if (deviceCertificates != null) 'DeviceCertificates': deviceCertificates,
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
      if (privateKeys != null) 'PrivateKeys': privateKeys,
      if (sidewalkId != null) 'SidewalkId': sidewalkId,
      if (sidewalkManufacturingSn != null)
        'SidewalkManufacturingSn': sidewalkManufacturingSn,
      if (status != null) 'Status': status.toValue(),
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

/// <code>SidewalkEventNotificationConfigurations</code> object, which is the
/// event configuration object for Sidewalk-related event topics.
class SidewalkEventNotificationConfigurations {
  /// Denotes whether the Amazon ID event topic is enabled or disabled.
  final EventNotificationTopicStatus? amazonIdEventTopic;

  SidewalkEventNotificationConfigurations({
    this.amazonIdEventTopic,
  });

  factory SidewalkEventNotificationConfigurations.fromJson(
      Map<String, dynamic> json) {
    return SidewalkEventNotificationConfigurations(
      amazonIdEventTopic: (json['AmazonIdEventTopic'] as String?)
          ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final amazonIdEventTopic = this.amazonIdEventTopic;
    return {
      if (amazonIdEventTopic != null)
        'AmazonIdEventTopic': amazonIdEventTopic.toValue(),
    };
  }
}

/// Gets information about a Sidewalk device profile.
class SidewalkGetDeviceProfile {
  /// The Sidewalk application server public key.
  final String? applicationServerPublicKey;

  /// The DAK certificate information of the Sidewalk device profile.
  final List<DakCertificateMetadata>? dakCertificateMetadata;

  /// Gets information about the certification status of a Sidewalk device
  /// profile.
  final bool? qualificationStatus;

  SidewalkGetDeviceProfile({
    this.applicationServerPublicKey,
    this.dakCertificateMetadata,
    this.qualificationStatus,
  });

  factory SidewalkGetDeviceProfile.fromJson(Map<String, dynamic> json) {
    return SidewalkGetDeviceProfile(
      applicationServerPublicKey: json['ApplicationServerPublicKey'] as String?,
      dakCertificateMetadata: (json['DakCertificateMetadata'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DakCertificateMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      qualificationStatus: json['QualificationStatus'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationServerPublicKey = this.applicationServerPublicKey;
    final dakCertificateMetadata = this.dakCertificateMetadata;
    final qualificationStatus = this.qualificationStatus;
    return {
      if (applicationServerPublicKey != null)
        'ApplicationServerPublicKey': applicationServerPublicKey,
      if (dakCertificateMetadata != null)
        'DakCertificateMetadata': dakCertificateMetadata,
      if (qualificationStatus != null)
        'QualificationStatus': qualificationStatus,
    };
  }
}

/// Sidewalk-related information for devices in an import task that are being
/// onboarded.
class SidewalkGetStartImportInfo {
  /// List of Sidewalk devices that are added to the import task.
  final List<String>? deviceCreationFileList;

  /// The IAM role that allows AWS IoT Wireless to access the CSV file in the S3
  /// bucket.
  final String? role;

  SidewalkGetStartImportInfo({
    this.deviceCreationFileList,
    this.role,
  });

  factory SidewalkGetStartImportInfo.fromJson(Map<String, dynamic> json) {
    return SidewalkGetStartImportInfo(
      deviceCreationFileList: (json['DeviceCreationFileList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      role: json['Role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceCreationFileList = this.deviceCreationFileList;
    final role = this.role;
    return {
      if (deviceCreationFileList != null)
        'DeviceCreationFileList': deviceCreationFileList,
      if (role != null) 'Role': role,
    };
  }
}

/// Sidewalk object used by list functions.
class SidewalkListDevice {
  /// The Sidewalk Amazon ID.
  final String? amazonId;

  /// The sidewalk device certificates for Ed25519 and P256r1.
  final List<CertificateList>? deviceCertificates;

  /// Sidewalk object used by list functions.
  final String? deviceProfileId;

  /// The sidewalk device identification.
  final String? sidewalkId;

  /// The Sidewalk manufacturing series number.
  final String? sidewalkManufacturingSn;

  /// The status of the Sidewalk devices, such as provisioned or registered.
  final WirelessDeviceSidewalkStatus? status;

  SidewalkListDevice({
    this.amazonId,
    this.deviceCertificates,
    this.deviceProfileId,
    this.sidewalkId,
    this.sidewalkManufacturingSn,
    this.status,
  });

  factory SidewalkListDevice.fromJson(Map<String, dynamic> json) {
    return SidewalkListDevice(
      amazonId: json['AmazonId'] as String?,
      deviceCertificates: (json['DeviceCertificates'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateList.fromJson(e as Map<String, dynamic>))
          .toList(),
      deviceProfileId: json['DeviceProfileId'] as String?,
      sidewalkId: json['SidewalkId'] as String?,
      sidewalkManufacturingSn: json['SidewalkManufacturingSn'] as String?,
      status: (json['Status'] as String?)?.toWirelessDeviceSidewalkStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final amazonId = this.amazonId;
    final deviceCertificates = this.deviceCertificates;
    final deviceProfileId = this.deviceProfileId;
    final sidewalkId = this.sidewalkId;
    final sidewalkManufacturingSn = this.sidewalkManufacturingSn;
    final status = this.status;
    return {
      if (amazonId != null) 'AmazonId': amazonId,
      if (deviceCertificates != null) 'DeviceCertificates': deviceCertificates,
      if (deviceProfileId != null) 'DeviceProfileId': deviceProfileId,
      if (sidewalkId != null) 'SidewalkId': sidewalkId,
      if (sidewalkManufacturingSn != null)
        'SidewalkManufacturingSn': sidewalkManufacturingSn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Sidewalk resource type event configuration object for enabling or disabling
/// topic.
class SidewalkResourceTypeEventConfiguration {
  /// Denotes whether the wireless device join event topic is enabled or disabled.
  final EventNotificationTopicStatus? wirelessDeviceEventTopic;

  SidewalkResourceTypeEventConfiguration({
    this.wirelessDeviceEventTopic,
  });

  factory SidewalkResourceTypeEventConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SidewalkResourceTypeEventConfiguration(
      wirelessDeviceEventTopic: (json['WirelessDeviceEventTopic'] as String?)
          ?.toEventNotificationTopicStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final wirelessDeviceEventTopic = this.wirelessDeviceEventTopic;
    return {
      if (wirelessDeviceEventTopic != null)
        'WirelessDeviceEventTopic': wirelessDeviceEventTopic.toValue(),
    };
  }
}

/// Information about a Sidewalk router.
class SidewalkSendDataToDevice {
  /// The duration of time in seconds to retry sending the ACK.
  final int? ackModeRetryDurationSecs;
  final MessageType? messageType;

  /// The sequence number.
  final int? seq;

  SidewalkSendDataToDevice({
    this.ackModeRetryDurationSecs,
    this.messageType,
    this.seq,
  });

  Map<String, dynamic> toJson() {
    final ackModeRetryDurationSecs = this.ackModeRetryDurationSecs;
    final messageType = this.messageType;
    final seq = this.seq;
    return {
      if (ackModeRetryDurationSecs != null)
        'AckModeRetryDurationSecs': ackModeRetryDurationSecs,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (seq != null) 'Seq': seq,
    };
  }
}

/// Information about an import task created for an individual Sidewalk device.
class SidewalkSingleStartImportInfo {
  /// The Sidewalk manufacturing serial number (SMSN) of the device added to the
  /// import task.
  final String? sidewalkManufacturingSn;

  SidewalkSingleStartImportInfo({
    this.sidewalkManufacturingSn,
  });

  Map<String, dynamic> toJson() {
    final sidewalkManufacturingSn = this.sidewalkManufacturingSn;
    return {
      if (sidewalkManufacturingSn != null)
        'SidewalkManufacturingSn': sidewalkManufacturingSn,
    };
  }
}

/// Information about an import task created for bulk provisioning.
class SidewalkStartImportInfo {
  /// The CSV file contained in an S3 bucket that's used for adding devices to an
  /// import task.
  final String? deviceCreationFile;

  /// The IAM role that allows AWS IoT Wireless to access the CSV file in the S3
  /// bucket.
  final String? role;

  SidewalkStartImportInfo({
    this.deviceCreationFile,
    this.role,
  });

  Map<String, dynamic> toJson() {
    final deviceCreationFile = this.deviceCreationFile;
    final role = this.role;
    return {
      if (deviceCreationFile != null) 'DeviceCreationFile': deviceCreationFile,
      if (role != null) 'Role': role,
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

  Map<String, dynamic> toJson() {
    final appServerPrivateKey = this.appServerPrivateKey;
    return {
      if (appServerPrivateKey != null)
        'AppServerPrivateKey': appServerPrivateKey,
    };
  }
}

/// Sidewalk object information for updating an import task.
class SidewalkUpdateImportInfo {
  /// The CSV file contained in an S3 bucket that's used for appending devices to
  /// an existing import task.
  final String? deviceCreationFile;

  SidewalkUpdateImportInfo({
    this.deviceCreationFile,
  });

  Map<String, dynamic> toJson() {
    final deviceCreationFile = this.deviceCreationFile;
    return {
      if (deviceCreationFile != null) 'DeviceCreationFile': deviceCreationFile,
    };
  }
}

/// The certificate chain algorithm provided by sidewalk.
enum SigningAlg {
  ed25519,
  p256r1,
}

extension SigningAlgValueExtension on SigningAlg {
  String toValue() {
    switch (this) {
      case SigningAlg.ed25519:
        return 'Ed25519';
      case SigningAlg.p256r1:
        return 'P256r1';
    }
  }
}

extension SigningAlgFromString on String {
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

class StartBulkAssociateWirelessDeviceWithMulticastGroupResponse {
  StartBulkAssociateWirelessDeviceWithMulticastGroupResponse();

  factory StartBulkAssociateWirelessDeviceWithMulticastGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return StartBulkAssociateWirelessDeviceWithMulticastGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartBulkDisassociateWirelessDeviceFromMulticastGroupResponse {
  StartBulkDisassociateWirelessDeviceFromMulticastGroupResponse();

  factory StartBulkDisassociateWirelessDeviceFromMulticastGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return StartBulkDisassociateWirelessDeviceFromMulticastGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartFuotaTaskResponse {
  StartFuotaTaskResponse();

  factory StartFuotaTaskResponse.fromJson(Map<String, dynamic> _) {
    return StartFuotaTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartMulticastGroupSessionResponse {
  StartMulticastGroupSessionResponse();

  factory StartMulticastGroupSessionResponse.fromJson(Map<String, dynamic> _) {
    return StartMulticastGroupSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartSingleWirelessDeviceImportTaskResponse {
  /// The ARN (Amazon Resource Name) of the import task.
  final String? arn;

  /// The import task ID.
  final String? id;

  StartSingleWirelessDeviceImportTaskResponse({
    this.arn,
    this.id,
  });

  factory StartSingleWirelessDeviceImportTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSingleWirelessDeviceImportTaskResponse(
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

class StartWirelessDeviceImportTaskResponse {
  /// The ARN (Amazon Resource Name) of the import task.
  final String? arn;

  /// The import task ID.
  final String? id;

  StartWirelessDeviceImportTaskResponse({
    this.arn,
    this.id,
  });

  factory StartWirelessDeviceImportTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartWirelessDeviceImportTaskResponse(
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

/// The configuration of summary metrics.
class SummaryMetricConfiguration {
  /// The status of the configuration of summary metrics.
  final SummaryMetricConfigurationStatus? status;

  SummaryMetricConfiguration({
    this.status,
  });

  factory SummaryMetricConfiguration.fromJson(Map<String, dynamic> json) {
    return SummaryMetricConfiguration(
      status: (json['Status'] as String?)?.toSummaryMetricConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum SummaryMetricConfigurationStatus {
  enabled,
  disabled,
}

extension SummaryMetricConfigurationStatusValueExtension
    on SummaryMetricConfigurationStatus {
  String toValue() {
    switch (this) {
      case SummaryMetricConfigurationStatus.enabled:
        return 'Enabled';
      case SummaryMetricConfigurationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension SummaryMetricConfigurationStatusFromString on String {
  SummaryMetricConfigurationStatus toSummaryMetricConfigurationStatus() {
    switch (this) {
      case 'Enabled':
        return SummaryMetricConfigurationStatus.enabled;
      case 'Disabled':
        return SummaryMetricConfigurationStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum SummaryMetricConfigurationStatus');
  }
}

/// The summary metric query object.
class SummaryMetricQuery {
  /// The aggregation period of the summary metric.
  final AggregationPeriod? aggregationPeriod;

  /// The dimensions of the summary metric.
  final List<Dimension>? dimensions;

  /// The end timestamp for the summary metric query.
  final DateTime? endTimestamp;

  /// The name of the metric.
  final MetricName? metricName;

  /// The id of the summary metric query.
  final String? queryId;

  /// The start timestamp for the summary metric query.
  final DateTime? startTimestamp;

  SummaryMetricQuery({
    this.aggregationPeriod,
    this.dimensions,
    this.endTimestamp,
    this.metricName,
    this.queryId,
    this.startTimestamp,
  });

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final dimensions = this.dimensions;
    final endTimestamp = this.endTimestamp;
    final metricName = this.metricName;
    final queryId = this.queryId;
    final startTimestamp = this.startTimestamp;
    return {
      if (aggregationPeriod != null)
        'AggregationPeriod': aggregationPeriod.toValue(),
      if (dimensions != null) 'Dimensions': dimensions,
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
      if (metricName != null) 'MetricName': metricName.toValue(),
      if (queryId != null) 'QueryId': queryId,
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

/// The result of the summary metrics aggregation operation.
class SummaryMetricQueryResult {
  /// The aggregation period of the metric.
  final AggregationPeriod? aggregationPeriod;

  /// The dimensions of the metric.
  final List<Dimension>? dimensions;

  /// The end timestamp for the summary metric query.
  final DateTime? endTimestamp;

  /// The error message for the summary metric query result.
  final String? error;

  /// The name of the summary metric query result.
  final MetricName? metricName;

  /// The ID of the summary metric results query operation.
  final String? queryId;

  /// The status of the summary metric query result.
  final MetricQueryStatus? queryStatus;

  /// The start timestamp for the summary metric query.
  final DateTime? startTimestamp;

  /// The timestamp of each aggregation result.
  final List<DateTime>? timestamps;

  /// The units of measurement to be used for interpreting the aggregation result.
  final String? unit;

  /// The list of aggregated summary metric query results.
  final List<MetricQueryValue>? values;

  SummaryMetricQueryResult({
    this.aggregationPeriod,
    this.dimensions,
    this.endTimestamp,
    this.error,
    this.metricName,
    this.queryId,
    this.queryStatus,
    this.startTimestamp,
    this.timestamps,
    this.unit,
    this.values,
  });

  factory SummaryMetricQueryResult.fromJson(Map<String, dynamic> json) {
    return SummaryMetricQueryResult(
      aggregationPeriod:
          (json['AggregationPeriod'] as String?)?.toAggregationPeriod(),
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTimestamp: timeStampFromJson(json['EndTimestamp']),
      error: json['Error'] as String?,
      metricName: (json['MetricName'] as String?)?.toMetricName(),
      queryId: json['QueryId'] as String?,
      queryStatus: (json['QueryStatus'] as String?)?.toMetricQueryStatus(),
      startTimestamp: timeStampFromJson(json['StartTimestamp']),
      timestamps: (json['Timestamps'] as List?)
          ?.whereNotNull()
          .map(nonNullableTimeStampFromJson)
          .toList(),
      unit: json['Unit'] as String?,
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => MetricQueryValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final dimensions = this.dimensions;
    final endTimestamp = this.endTimestamp;
    final error = this.error;
    final metricName = this.metricName;
    final queryId = this.queryId;
    final queryStatus = this.queryStatus;
    final startTimestamp = this.startTimestamp;
    final timestamps = this.timestamps;
    final unit = this.unit;
    final values = this.values;
    return {
      if (aggregationPeriod != null)
        'AggregationPeriod': aggregationPeriod.toValue(),
      if (dimensions != null) 'Dimensions': dimensions,
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
      if (error != null) 'Error': error,
      if (metricName != null) 'MetricName': metricName.toValue(),
      if (queryId != null) 'QueryId': queryId,
      if (queryStatus != null) 'QueryStatus': queryStatus.toValue(),
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
      if (timestamps != null)
        'Timestamps': timestamps.map(unixTimestampToJson).toList(),
      if (unit != null) 'Unit': unit,
      if (values != null) 'Values': values,
    };
  }
}

/// Supported RfRegions
enum SupportedRfRegion {
  eu868,
  us915,
  au915,
  as923_1,
  as923_2,
  as923_3,
  as923_4,
  eu433,
  cn470,
  cn779,
  ru864,
  kr920,
  in865,
}

extension SupportedRfRegionValueExtension on SupportedRfRegion {
  String toValue() {
    switch (this) {
      case SupportedRfRegion.eu868:
        return 'EU868';
      case SupportedRfRegion.us915:
        return 'US915';
      case SupportedRfRegion.au915:
        return 'AU915';
      case SupportedRfRegion.as923_1:
        return 'AS923-1';
      case SupportedRfRegion.as923_2:
        return 'AS923-2';
      case SupportedRfRegion.as923_3:
        return 'AS923-3';
      case SupportedRfRegion.as923_4:
        return 'AS923-4';
      case SupportedRfRegion.eu433:
        return 'EU433';
      case SupportedRfRegion.cn470:
        return 'CN470';
      case SupportedRfRegion.cn779:
        return 'CN779';
      case SupportedRfRegion.ru864:
        return 'RU864';
      case SupportedRfRegion.kr920:
        return 'KR920';
      case SupportedRfRegion.in865:
        return 'IN865';
    }
  }
}

extension SupportedRfRegionFromString on String {
  SupportedRfRegion toSupportedRfRegion() {
    switch (this) {
      case 'EU868':
        return SupportedRfRegion.eu868;
      case 'US915':
        return SupportedRfRegion.us915;
      case 'AU915':
        return SupportedRfRegion.au915;
      case 'AS923-1':
        return SupportedRfRegion.as923_1;
      case 'AS923-2':
        return SupportedRfRegion.as923_2;
      case 'AS923-3':
        return SupportedRfRegion.as923_3;
      case 'AS923-4':
        return SupportedRfRegion.as923_4;
      case 'EU433':
        return SupportedRfRegion.eu433;
      case 'CN470':
        return SupportedRfRegion.cn470;
      case 'CN779':
        return SupportedRfRegion.cn779;
      case 'RU864':
        return SupportedRfRegion.ru864;
      case 'KR920':
        return SupportedRfRegion.kr920;
      case 'IN865':
        return SupportedRfRegion.in865;
    }
    throw Exception('$this is not known in enum SupportedRfRegion');
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

/// TD-SCDMA local identification (local Id) information.
class TdscdmaLocalId {
  /// Cell parameters for TD-SCDMA.
  final int cellParams;

  /// TD-SCDMA UTRA (Universal Terrestrial Radio Access Network) absolute RF
  /// channel number (UARFCN).
  final int uarfcn;

  TdscdmaLocalId({
    required this.cellParams,
    required this.uarfcn,
  });

  Map<String, dynamic> toJson() {
    final cellParams = this.cellParams;
    final uarfcn = this.uarfcn;
    return {
      'CellParams': cellParams,
      'Uarfcn': uarfcn,
    };
  }
}

/// TD-SCDMA object for network measurement reports.
class TdscdmaNmrObj {
  /// Cell parameters for TD-SCDMA network measurement reports object.
  final int cellParams;

  /// TD-SCDMA UTRA (Universal Terrestrial Radio Access Network) absolute RF
  /// channel number.
  final int uarfcn;

  /// Path loss, or path attenuation, is the reduction in power density of an
  /// electromagnetic wave as it propagates through space.
  final int? pathLoss;

  /// Code power of the received signal, measured in decibel-milliwatts (dBm).
  final int? rscp;

  /// UTRAN (UMTS Terrestrial Radio Access Network) cell global identifier.
  final int? utranCid;

  TdscdmaNmrObj({
    required this.cellParams,
    required this.uarfcn,
    this.pathLoss,
    this.rscp,
    this.utranCid,
  });

  Map<String, dynamic> toJson() {
    final cellParams = this.cellParams;
    final uarfcn = this.uarfcn;
    final pathLoss = this.pathLoss;
    final rscp = this.rscp;
    final utranCid = this.utranCid;
    return {
      'CellParams': cellParams,
      'Uarfcn': uarfcn,
      if (pathLoss != null) 'PathLoss': pathLoss,
      if (rscp != null) 'Rscp': rscp,
      if (utranCid != null) 'UtranCid': utranCid,
    };
  }
}

/// TD-SCDMA object.
class TdscdmaObj {
  /// Mobile Country Code.
  final int mcc;

  /// Mobile Network Code.
  final int mnc;

  /// UTRAN (UMTS Terrestrial Radio Access Network) Cell Global Identifier.
  final int utranCid;

  /// Location Area Code.
  final int? lac;

  /// Path loss, or path attenuation, is the reduction in power density of an
  /// electromagnetic wave as it propagates through space.
  final int? pathLoss;

  /// Signal power of the received signal (Received Signal Code Power), measured
  /// in decibel-milliwatts (dBm).
  final int? rscp;

  /// TD-SCDMA local identification (local ID) information.
  final TdscdmaLocalId? tdscdmaLocalId;

  /// TD-SCDMA object for network measurement reports.
  final List<TdscdmaNmrObj>? tdscdmaNmr;

  /// TD-SCDMA Timing advance.
  final int? tdscdmaTimingAdvance;

  TdscdmaObj({
    required this.mcc,
    required this.mnc,
    required this.utranCid,
    this.lac,
    this.pathLoss,
    this.rscp,
    this.tdscdmaLocalId,
    this.tdscdmaNmr,
    this.tdscdmaTimingAdvance,
  });

  Map<String, dynamic> toJson() {
    final mcc = this.mcc;
    final mnc = this.mnc;
    final utranCid = this.utranCid;
    final lac = this.lac;
    final pathLoss = this.pathLoss;
    final rscp = this.rscp;
    final tdscdmaLocalId = this.tdscdmaLocalId;
    final tdscdmaNmr = this.tdscdmaNmr;
    final tdscdmaTimingAdvance = this.tdscdmaTimingAdvance;
    return {
      'Mcc': mcc,
      'Mnc': mnc,
      'UtranCid': utranCid,
      if (lac != null) 'Lac': lac,
      if (pathLoss != null) 'PathLoss': pathLoss,
      if (rscp != null) 'Rscp': rscp,
      if (tdscdmaLocalId != null) 'TdscdmaLocalId': tdscdmaLocalId,
      if (tdscdmaNmr != null) 'TdscdmaNmr': tdscdmaNmr,
      if (tdscdmaTimingAdvance != null)
        'TdscdmaTimingAdvance': tdscdmaTimingAdvance,
    };
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

/// Trace content for your wireless devices, gateways, and multicast groups.
class TraceContent {
  final LogLevel? logLevel;
  final MulticastFrameInfo? multicastFrameInfo;
  final WirelessDeviceFrameInfo? wirelessDeviceFrameInfo;

  TraceContent({
    this.logLevel,
    this.multicastFrameInfo,
    this.wirelessDeviceFrameInfo,
  });

  factory TraceContent.fromJson(Map<String, dynamic> json) {
    return TraceContent(
      logLevel: (json['LogLevel'] as String?)?.toLogLevel(),
      multicastFrameInfo:
          (json['MulticastFrameInfo'] as String?)?.toMulticastFrameInfo(),
      wirelessDeviceFrameInfo: (json['WirelessDeviceFrameInfo'] as String?)
          ?.toWirelessDeviceFrameInfo(),
    );
  }

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    final multicastFrameInfo = this.multicastFrameInfo;
    final wirelessDeviceFrameInfo = this.wirelessDeviceFrameInfo;
    return {
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
      if (multicastFrameInfo != null)
        'MulticastFrameInfo': multicastFrameInfo.toValue(),
      if (wirelessDeviceFrameInfo != null)
        'WirelessDeviceFrameInfo': wirelessDeviceFrameInfo.toValue(),
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

/// ABP device object for LoRaWAN specification v1.0.x
// ignore: camel_case_types
class UpdateAbpV1_0_x {
  /// The FCnt init value.
  final int? fCntStart;

  UpdateAbpV1_0_x({
    this.fCntStart,
  });

  Map<String, dynamic> toJson() {
    final fCntStart = this.fCntStart;
    return {
      if (fCntStart != null) 'FCntStart': fCntStart,
    };
  }
}

/// ABP device object for LoRaWAN specification v1.1
// ignore: camel_case_types
class UpdateAbpV1_1 {
  /// The FCnt init value.
  final int? fCntStart;

  UpdateAbpV1_1({
    this.fCntStart,
  });

  Map<String, dynamic> toJson() {
    final fCntStart = this.fCntStart;
    return {
      if (fCntStart != null) 'FCntStart': fCntStart,
    };
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

class UpdateEventConfigurationByResourceTypesResponse {
  UpdateEventConfigurationByResourceTypesResponse();

  factory UpdateEventConfigurationByResourceTypesResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateEventConfigurationByResourceTypesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Object for updating the FPorts information.
class UpdateFPorts {
  /// LoRaWAN application, which can be used for geolocation by activating
  /// positioning.
  final List<ApplicationConfig>? applications;

  /// Positioning FPorts for the ClockSync, Stream, and GNSS functions.
  final Positioning? positioning;

  UpdateFPorts({
    this.applications,
    this.positioning,
  });

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final positioning = this.positioning;
    return {
      if (applications != null) 'Applications': applications,
      if (positioning != null) 'Positioning': positioning,
    };
  }
}

class UpdateFuotaTaskResponse {
  UpdateFuotaTaskResponse();

  factory UpdateFuotaTaskResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFuotaTaskResponse();
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

class UpdateMetricConfigurationResponse {
  UpdateMetricConfigurationResponse();

  factory UpdateMetricConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMetricConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMulticastGroupResponse {
  UpdateMulticastGroupResponse();

  factory UpdateMulticastGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMulticastGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNetworkAnalyzerConfigurationResponse {
  UpdateNetworkAnalyzerConfigurationResponse();

  factory UpdateNetworkAnalyzerConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateNetworkAnalyzerConfigurationResponse();
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

@Deprecated('This operation is no longer supported.')
class UpdatePositionResponse {
  UpdatePositionResponse();

  factory UpdatePositionResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePositionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourceEventConfigurationResponse {
  UpdateResourceEventConfigurationResponse();

  factory UpdateResourceEventConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateResourceEventConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourcePositionResponse {
  UpdateResourcePositionResponse();

  factory UpdateResourcePositionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourcePositionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWirelessDeviceImportTaskResponse {
  UpdateWirelessDeviceImportTaskResponse();

  factory UpdateWirelessDeviceImportTaskResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateWirelessDeviceImportTaskResponse();
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

/// WCDMA local identification (local ID) information.
class WcdmaLocalId {
  /// Primary Scrambling Code.
  final int psc;

  /// WCDMA UTRA Absolute RF Channel Number downlink.
  final int uarfcndl;

  WcdmaLocalId({
    required this.psc,
    required this.uarfcndl,
  });

  Map<String, dynamic> toJson() {
    final psc = this.psc;
    final uarfcndl = this.uarfcndl;
    return {
      'Psc': psc,
      'Uarfcndl': uarfcndl,
    };
  }
}

/// Network Measurement Reports.
class WcdmaNmrObj {
  /// Primary Scrambling Code.
  final int psc;

  /// WCDMA UTRA Absolute RF Channel Number downlink.
  final int uarfcndl;

  /// UTRAN (UMTS Terrestrial Radio Access Network) Cell Global Identifier.
  final int utranCid;

  /// Path loss, or path attenuation, is the reduction in power density of an
  /// electromagnetic wave as it propagates through space.
  final int? pathLoss;

  /// Received Signal Code Power (signal power) (dBm)
  final int? rscp;

  WcdmaNmrObj({
    required this.psc,
    required this.uarfcndl,
    required this.utranCid,
    this.pathLoss,
    this.rscp,
  });

  Map<String, dynamic> toJson() {
    final psc = this.psc;
    final uarfcndl = this.uarfcndl;
    final utranCid = this.utranCid;
    final pathLoss = this.pathLoss;
    final rscp = this.rscp;
    return {
      'Psc': psc,
      'Uarfcndl': uarfcndl,
      'UtranCid': utranCid,
      if (pathLoss != null) 'PathLoss': pathLoss,
      if (rscp != null) 'Rscp': rscp,
    };
  }
}

/// WCDMA.
class WcdmaObj {
  /// Mobile Country Code.
  final int mcc;

  /// Mobile Network Code.
  final int mnc;

  /// UTRAN (UMTS Terrestrial Radio Access Network) Cell Global Identifier.
  final int utranCid;

  /// Location Area Code.
  final int? lac;

  /// Path loss, or path attenuation, is the reduction in power density of an
  /// electromagnetic wave as it propagates through space.
  final int? pathLoss;

  /// Received Signal Code Power (signal power) (dBm).
  final int? rscp;

  /// WCDMA local ID information.
  final WcdmaLocalId? wcdmaLocalId;

  /// WCDMA object for network measurement reports.
  final List<WcdmaNmrObj>? wcdmaNmr;

  WcdmaObj({
    required this.mcc,
    required this.mnc,
    required this.utranCid,
    this.lac,
    this.pathLoss,
    this.rscp,
    this.wcdmaLocalId,
    this.wcdmaNmr,
  });

  Map<String, dynamic> toJson() {
    final mcc = this.mcc;
    final mnc = this.mnc;
    final utranCid = this.utranCid;
    final lac = this.lac;
    final pathLoss = this.pathLoss;
    final rscp = this.rscp;
    final wcdmaLocalId = this.wcdmaLocalId;
    final wcdmaNmr = this.wcdmaNmr;
    return {
      'Mcc': mcc,
      'Mnc': mnc,
      'UtranCid': utranCid,
      if (lac != null) 'Lac': lac,
      if (pathLoss != null) 'PathLoss': pathLoss,
      if (rscp != null) 'Rscp': rscp,
      if (wcdmaLocalId != null) 'WcdmaLocalId': wcdmaLocalId,
      if (wcdmaNmr != null) 'WcdmaNmr': wcdmaNmr,
    };
  }
}

/// Wi-Fi access point.
class WiFiAccessPoint {
  /// Wi-Fi MAC Address.
  final String macAddress;

  /// Received signal strength (dBm) of the WLAN measurement data.
  final int rss;

  WiFiAccessPoint({
    required this.macAddress,
    required this.rss,
  });

  Map<String, dynamic> toJson() {
    final macAddress = this.macAddress;
    final rss = this.rss;
    return {
      'MacAddress': macAddress,
      'Rss': rss,
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

extension WirelessDeviceEventValueExtension on WirelessDeviceEvent {
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

extension WirelessDeviceEventFromString on String {
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

/// The log options for a wireless device event and can be used to set log
/// levels for a specific wireless device event.
///
/// For a LoRaWAN device, possible events for a log messsage are:
/// <code>Join</code>, <code>Rejoin</code>, <code>Downlink_Data</code>, and
/// <code>Uplink_Data</code>. For a Sidewalk device, possible events for a log
/// message are <code>Registration</code>, <code>Downlink_Data</code>, and
/// <code>Uplink_Data</code>.
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

/// <code>FrameInfo</code> of your wireless device resources for the trace
/// content. Use FrameInfo to debug the communication between your LoRaWAN end
/// devices and the network server.
enum WirelessDeviceFrameInfo {
  enabled,
  disabled,
}

extension WirelessDeviceFrameInfoValueExtension on WirelessDeviceFrameInfo {
  String toValue() {
    switch (this) {
      case WirelessDeviceFrameInfo.enabled:
        return 'ENABLED';
      case WirelessDeviceFrameInfo.disabled:
        return 'DISABLED';
    }
  }
}

extension WirelessDeviceFrameInfoFromString on String {
  WirelessDeviceFrameInfo toWirelessDeviceFrameInfo() {
    switch (this) {
      case 'ENABLED':
        return WirelessDeviceFrameInfo.enabled;
      case 'DISABLED':
        return WirelessDeviceFrameInfo.disabled;
    }
    throw Exception('$this is not known in enum WirelessDeviceFrameInfo');
  }
}

enum WirelessDeviceIdType {
  wirelessDeviceId,
  devEui,
  thingName,
  sidewalkManufacturingSn,
}

extension WirelessDeviceIdTypeValueExtension on WirelessDeviceIdType {
  String toValue() {
    switch (this) {
      case WirelessDeviceIdType.wirelessDeviceId:
        return 'WirelessDeviceId';
      case WirelessDeviceIdType.devEui:
        return 'DevEui';
      case WirelessDeviceIdType.thingName:
        return 'ThingName';
      case WirelessDeviceIdType.sidewalkManufacturingSn:
        return 'SidewalkManufacturingSn';
    }
  }
}

extension WirelessDeviceIdTypeFromString on String {
  WirelessDeviceIdType toWirelessDeviceIdType() {
    switch (this) {
      case 'WirelessDeviceId':
        return WirelessDeviceIdType.wirelessDeviceId;
      case 'DevEui':
        return WirelessDeviceIdType.devEui;
      case 'ThingName':
        return WirelessDeviceIdType.thingName;
      case 'SidewalkManufacturingSn':
        return WirelessDeviceIdType.sidewalkManufacturingSn;
    }
    throw Exception('$this is not known in enum WirelessDeviceIdType');
  }
}

/// Information about an import task for wireless devices.
class WirelessDeviceImportTask {
  /// The ARN (Amazon Resource Name) of the wireless device import task.
  final String? arn;

  /// The time at which the import task was created.
  final DateTime? creationTime;

  /// The name of the Sidewalk destination that that describes the IoT rule to
  /// route messages from the device in the import task that will be onboarded to
  /// AWS IoT Wireless
  final String? destinationName;

  /// The summary information of count of wireless devices in an import task that
  /// failed to onboarded to the import task.
  final int? failedImportedDeviceCount;

  /// The ID of the wireless device import task.
  final String? id;

  /// The summary information of count of wireless devices that are waiting for
  /// the control log to be added to an import task.
  final int? initializedImportedDeviceCount;

  /// The summary information of count of wireless devices in an import task that
  /// have been onboarded to the import task.
  final int? onboardedImportedDeviceCount;

  /// The summary information of count of wireless devices in an import task that
  /// are waiting in the queue to be onboarded.
  final int? pendingImportedDeviceCount;

  /// The Sidewalk-related information of the wireless device import task.
  final SidewalkGetStartImportInfo? sidewalk;

  /// The status information of the wireless device import task.
  final ImportTaskStatus? status;

  /// The reason that provides additional information about the import task
  /// status.
  final String? statusReason;

  WirelessDeviceImportTask({
    this.arn,
    this.creationTime,
    this.destinationName,
    this.failedImportedDeviceCount,
    this.id,
    this.initializedImportedDeviceCount,
    this.onboardedImportedDeviceCount,
    this.pendingImportedDeviceCount,
    this.sidewalk,
    this.status,
    this.statusReason,
  });

  factory WirelessDeviceImportTask.fromJson(Map<String, dynamic> json) {
    return WirelessDeviceImportTask(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      destinationName: json['DestinationName'] as String?,
      failedImportedDeviceCount: json['FailedImportedDeviceCount'] as int?,
      id: json['Id'] as String?,
      initializedImportedDeviceCount:
          json['InitializedImportedDeviceCount'] as int?,
      onboardedImportedDeviceCount:
          json['OnboardedImportedDeviceCount'] as int?,
      pendingImportedDeviceCount: json['PendingImportedDeviceCount'] as int?,
      sidewalk: json['Sidewalk'] != null
          ? SidewalkGetStartImportInfo.fromJson(
              json['Sidewalk'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toImportTaskStatus(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final destinationName = this.destinationName;
    final failedImportedDeviceCount = this.failedImportedDeviceCount;
    final id = this.id;
    final initializedImportedDeviceCount = this.initializedImportedDeviceCount;
    final onboardedImportedDeviceCount = this.onboardedImportedDeviceCount;
    final pendingImportedDeviceCount = this.pendingImportedDeviceCount;
    final sidewalk = this.sidewalk;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (destinationName != null) 'DestinationName': destinationName,
      if (failedImportedDeviceCount != null)
        'FailedImportedDeviceCount': failedImportedDeviceCount,
      if (id != null) 'Id': id,
      if (initializedImportedDeviceCount != null)
        'InitializedImportedDeviceCount': initializedImportedDeviceCount,
      if (onboardedImportedDeviceCount != null)
        'OnboardedImportedDeviceCount': onboardedImportedDeviceCount,
      if (pendingImportedDeviceCount != null)
        'PendingImportedDeviceCount': pendingImportedDeviceCount,
      if (sidewalk != null) 'Sidewalk': sidewalk,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// The log options for wireless devices and can be used to set log levels for a
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

enum WirelessDeviceSidewalkStatus {
  provisioned,
  registered,
  activated,
  unknown,
}

extension WirelessDeviceSidewalkStatusValueExtension
    on WirelessDeviceSidewalkStatus {
  String toValue() {
    switch (this) {
      case WirelessDeviceSidewalkStatus.provisioned:
        return 'PROVISIONED';
      case WirelessDeviceSidewalkStatus.registered:
        return 'REGISTERED';
      case WirelessDeviceSidewalkStatus.activated:
        return 'ACTIVATED';
      case WirelessDeviceSidewalkStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension WirelessDeviceSidewalkStatusFromString on String {
  WirelessDeviceSidewalkStatus toWirelessDeviceSidewalkStatus() {
    switch (this) {
      case 'PROVISIONED':
        return WirelessDeviceSidewalkStatus.provisioned;
      case 'REGISTERED':
        return WirelessDeviceSidewalkStatus.registered;
      case 'ACTIVATED':
        return WirelessDeviceSidewalkStatus.activated;
      case 'UNKNOWN':
        return WirelessDeviceSidewalkStatus.unknown;
    }
    throw Exception('$this is not known in enum WirelessDeviceSidewalkStatus');
  }
}

/// Information about a wireless device's operation.
class WirelessDeviceStatistics {
  /// The Amazon Resource Name of the resource.
  final String? arn;

  /// The name of the destination to which the device is assigned.
  final String? destinationName;
  final FuotaDeviceStatus? fuotaDeviceStatus;

  /// The ID of the wireless device reporting the data.
  final String? id;

  /// The date and time when the most recent uplink was received.
  /// <note>
  /// Theis value is only valid for 3 months.
  /// </note>
  final String? lastUplinkReceivedAt;

  /// LoRaWAN device info.
  final LoRaWANListDevice? loRaWAN;
  final int? mcGroupId;

  /// The status of the wireless device in the multicast group.
  final String? multicastDeviceStatus;

  /// The name of the resource.
  final String? name;

  /// The Sidewalk account credentials.
  final SidewalkListDevice? sidewalk;

  /// The wireless device type.
  final WirelessDeviceType? type;

  WirelessDeviceStatistics({
    this.arn,
    this.destinationName,
    this.fuotaDeviceStatus,
    this.id,
    this.lastUplinkReceivedAt,
    this.loRaWAN,
    this.mcGroupId,
    this.multicastDeviceStatus,
    this.name,
    this.sidewalk,
    this.type,
  });

  factory WirelessDeviceStatistics.fromJson(Map<String, dynamic> json) {
    return WirelessDeviceStatistics(
      arn: json['Arn'] as String?,
      destinationName: json['DestinationName'] as String?,
      fuotaDeviceStatus:
          (json['FuotaDeviceStatus'] as String?)?.toFuotaDeviceStatus(),
      id: json['Id'] as String?,
      lastUplinkReceivedAt: json['LastUplinkReceivedAt'] as String?,
      loRaWAN: json['LoRaWAN'] != null
          ? LoRaWANListDevice.fromJson(json['LoRaWAN'] as Map<String, dynamic>)
          : null,
      mcGroupId: json['McGroupId'] as int?,
      multicastDeviceStatus: json['MulticastDeviceStatus'] as String?,
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
    final fuotaDeviceStatus = this.fuotaDeviceStatus;
    final id = this.id;
    final lastUplinkReceivedAt = this.lastUplinkReceivedAt;
    final loRaWAN = this.loRaWAN;
    final mcGroupId = this.mcGroupId;
    final multicastDeviceStatus = this.multicastDeviceStatus;
    final name = this.name;
    final sidewalk = this.sidewalk;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (destinationName != null) 'DestinationName': destinationName,
      if (fuotaDeviceStatus != null)
        'FuotaDeviceStatus': fuotaDeviceStatus.toValue(),
      if (id != null) 'Id': id,
      if (lastUplinkReceivedAt != null)
        'LastUplinkReceivedAt': lastUplinkReceivedAt,
      if (loRaWAN != null) 'LoRaWAN': loRaWAN,
      if (mcGroupId != null) 'McGroupId': mcGroupId,
      if (multicastDeviceStatus != null)
        'MulticastDeviceStatus': multicastDeviceStatus,
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

extension WirelessDeviceTypeValueExtension on WirelessDeviceType {
  String toValue() {
    switch (this) {
      case WirelessDeviceType.sidewalk:
        return 'Sidewalk';
      case WirelessDeviceType.loRaWAN:
        return 'LoRaWAN';
    }
  }
}

extension WirelessDeviceTypeFromString on String {
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

extension WirelessGatewayEventValueExtension on WirelessGatewayEvent {
  String toValue() {
    switch (this) {
      case WirelessGatewayEvent.cupsRequest:
        return 'CUPS_Request';
      case WirelessGatewayEvent.certificate:
        return 'Certificate';
    }
  }
}

extension WirelessGatewayEventFromString on String {
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

/// The log options for a wireless gateway event and can be used to set log
/// levels for a specific wireless gateway event.
///
/// For a LoRaWAN gateway, possible events for a log message are
/// <code>CUPS_Request</code> and <code>Certificate</code>.
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

extension WirelessGatewayIdTypeValueExtension on WirelessGatewayIdType {
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

extension WirelessGatewayIdTypeFromString on String {
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

/// The log options for wireless gateways and can be used to set log levels for
/// a specific type of wireless gateway.
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

extension WirelessGatewayServiceTypeValueExtension
    on WirelessGatewayServiceType {
  String toValue() {
    switch (this) {
      case WirelessGatewayServiceType.cups:
        return 'CUPS';
      case WirelessGatewayServiceType.lns:
        return 'LNS';
    }
  }
}

extension WirelessGatewayServiceTypeFromString on String {
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
  /// <note>
  /// This value is only valid for 3 months.
  /// </note>
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

extension WirelessGatewayTaskDefinitionTypeValueExtension
    on WirelessGatewayTaskDefinitionType {
  String toValue() {
    switch (this) {
      case WirelessGatewayTaskDefinitionType.update:
        return 'UPDATE';
    }
  }
}

extension WirelessGatewayTaskDefinitionTypeFromString on String {
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

extension WirelessGatewayTaskStatusValueExtension on WirelessGatewayTaskStatus {
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

extension WirelessGatewayTaskStatusFromString on String {
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

extension WirelessGatewayTypeValueExtension on WirelessGatewayType {
  String toValue() {
    switch (this) {
      case WirelessGatewayType.loRaWAN:
        return 'LoRaWAN';
    }
  }
}

extension WirelessGatewayTypeFromString on String {
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
