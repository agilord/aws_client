// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2026_04_30.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS Lambda Core is a set of APIs for managing shared infrastructure
/// resources used by AWS Lambda. The Lambda Core API provides operations for
/// creating and managing network connectors that enable Lambda MicroVMs to
/// access resources in your Amazon Virtual Private Cloud (Amazon VPC).
///
/// Network connectors provision elastic network interfaces (ENIs) in your VPC
/// subnets, providing a managed network path from Lambda compute environments
/// to private resources such as Amazon RDS databases, Amazon ElastiCache
/// clusters, and internal APIs. You create a network connector once and attach
/// it to one or more Lambda MicroVMs at run time.
class LambdaCore {
  final _s.RestJsonProtocol _protocol;
  factory LambdaCore({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'lambda',
    );
    return LambdaCore._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  LambdaCore._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a network connector that enables Lambda compute resources to route
  /// outbound traffic through your Amazon VPC. The network connector provisions
  /// elastic network interfaces (ENIs) in the subnets you specify, providing a
  /// managed network path to private resources such as databases, caches, and
  /// internal APIs.
  ///
  /// This operation is asynchronous. The network connector starts in
  /// <code>PENDING</code> state while ENIs are provisioned in your VPC
  /// (provisioning typically takes up to 10 minutes). Use
  /// <code>GetNetworkConnector</code> to poll the connector state until it
  /// reaches <code>ACTIVE</code>. Once active, you can attach the connector to
  /// Lambda MicroVMs at run time using the <code>egressNetworkConnectors</code>
  /// parameter on <code>RunMicroVm</code>.
  ///
  /// This operation is idempotent when you provide a <code>ClientToken</code> —
  /// if you retry a request that completed successfully using the same client
  /// token, the operation returns the existing connector without creating a
  /// duplicate.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [NetworkConnectorLimitExceededException].
  /// May throw [ResourceConflictException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [configuration] :
  /// The network configuration for the connector. Specify a
  /// <code>VpcEgressConfiguration</code> to enable outbound traffic routing
  /// through your VPC.
  ///
  /// Parameter [name] :
  /// A unique name for the network connector within your account and Region.
  /// You can use the name to identify the connector in subsequent API calls.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you retry a request with the same client
  /// token, the API returns the existing connector without creating a
  /// duplicate.
  ///
  /// Parameter [operatorRole] :
  /// The ARN of the IAM role that Lambda assumes to manage elastic network
  /// interfaces in your VPC. This role must have permissions for
  /// <code>ec2:CreateNetworkInterface</code>,
  /// <code>ec2:DeleteNetworkInterface</code>, and related describe operations.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs to associate with the network connector for
  /// organization, cost allocation, or access control.
  Future<CreateNetworkConnectorResponse> createNetworkConnector({
    required NetworkConnectorConfiguration configuration,
    required String name,
    String? clientToken,
    String? operatorRole,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (operatorRole != null) 'OperatorRole': operatorRole,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-04-04/network-connectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkConnectorResponse.fromJson(response);
  }

  /// Retrieves the current configuration, state, and metadata of a network
  /// connector. The <code>Identifier</code> parameter accepts the connector ID,
  /// name, or full ARN. Use this operation to poll connector state after
  /// creation or update, or to inspect the current VPC configuration and any
  /// failure reasons.
  ///
  /// The response includes the full connector configuration, current state, and
  /// — if the connector has been updated — the <code>LastUpdateStatus</code>
  /// and <code>LastUpdateStatusReasonCode</code> fields that indicate whether
  /// the most recent update succeeded or failed.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<GetNetworkConnectorResponse> getNetworkConnector({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2026-04-04/network-connectors/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkConnectorResponse.fromJson(response);
  }

  /// Updates the VPC configuration or operator role of an existing network
  /// connector. You can modify the subnet IDs, security group IDs, network
  /// protocol, or operator role. The connector must be in <code>ACTIVE</code>
  /// state to accept updates.
  ///
  /// This operation is asynchronous. The connector remains in
  /// <code>ACTIVE</code> state during the update — existing workloads that
  /// reference this connector are not disrupted. Use
  /// <code>GetNetworkConnector</code> to monitor the
  /// <code>LastUpdateStatus</code> field, which transitions through
  /// <code>InProgress</code> to <code>Successful</code> or <code>Failed</code>.
  /// If the update fails, the <code>LastUpdateStatusReasonCode</code> field
  /// provides a specific error code for troubleshooting. This operation is
  /// idempotent when you provide a <code>ClientToken</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the update
  /// request.
  ///
  /// Parameter [configuration] :
  /// The updated network configuration for the connector. Provide the full
  /// <code>VpcEgressConfiguration</code> including all subnet IDs and security
  /// group IDs — this replaces the existing configuration.
  ///
  /// Parameter [operatorRole] :
  /// The updated ARN of the IAM role that Lambda assumes to manage ENIs. Use
  /// this to change the operator role without recreating the connector.
  Future<UpdateNetworkConnectorResponse> updateNetworkConnector({
    required String identifier,
    String? clientToken,
    NetworkConnectorConfiguration? configuration,
    String? operatorRole,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'Configuration': configuration,
      if (operatorRole != null) 'OperatorRole': operatorRole,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2026-04-04/network-connectors/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkConnectorResponse.fromJson(response);
  }

  /// Initiates deletion of a network connector. The connector transitions to
  /// <code>DELETING</code> state while elastic network interfaces are cleaned
  /// up asynchronously. After deletion completes, subsequent calls to
  /// <code>GetNetworkConnector</code> return
  /// <code>ResourceNotFoundException</code>.
  ///
  /// This operation is idempotent — calling delete on a connector that is
  /// already deleting or has been deleted succeeds without error. You can
  /// delete connectors in <code>ACTIVE</code> or <code>FAILED</code> states.
  /// Before deleting a connector, ensure that no Lambda MicroVMs are using it,
  /// as they will lose VPC egress connectivity immediately.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<DeleteNetworkConnectorResponse> deleteNetworkConnector({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2026-04-04/network-connectors/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNetworkConnectorResponse.fromJson(response);
  }

  /// Returns a paginated list of network connectors in your account for the
  /// current Region. You can optionally filter results by connector state. Use
  /// the <code>Marker</code> parameter from a previous response to retrieve the
  /// next page of results.
  ///
  /// Each item in the response includes the connector ARN, name, ID, type,
  /// current state, and last modified timestamp. To retrieve full configuration
  /// details for a specific connector, use <code>GetNetworkConnector</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [marker] :
  /// The pagination token from a previous <code>ListNetworkConnectors</code>
  /// response. Use this value to retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of connectors to return per page. Valid range: 1 to
  /// 100.
  ///
  /// Parameter [state] :
  /// Optional filter to return only connectors in the specified state (for
  /// example, <code>ACTIVE</code> or <code>FAILED</code>).
  Future<ListNetworkConnectorsResponse> listNetworkConnectors({
    String? marker,
    int? maxItems,
    NetworkConnectorState? state,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
      if (state != null) 'State': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2026-04-04/network-connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkConnectorsResponse.fromJson(response);
  }
}

/// @nodoc
class CreateNetworkConnectorResponse {
  /// The Amazon Resource Name (ARN) of the network connector.
  final String arn;
  final String id;

  /// The name of the network connector.
  final String name;

  /// The network configuration of the connector, including VPC subnets and
  /// security groups.
  final NetworkConnectorConfiguration? configuration;

  /// The ARN of the IAM role that Lambda uses to manage the underlying ENI
  /// resources for this connector.
  final String? operatorRole;

  /// The current state of the network connector.
  final NetworkConnectorState? state;

  CreateNetworkConnectorResponse({
    required this.arn,
    required this.id,
    required this.name,
    this.configuration,
    this.operatorRole,
    this.state,
  });

  factory CreateNetworkConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkConnectorResponse(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      configuration: json['Configuration'] != null
          ? NetworkConnectorConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      operatorRole: json['OperatorRole'] as String?,
      state: (json['State'] as String?)?.let(NetworkConnectorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final configuration = this.configuration;
    final operatorRole = this.operatorRole;
    final state = this.state;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (operatorRole != null) 'OperatorRole': operatorRole,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class GetNetworkConnectorResponse {
  /// The Amazon Resource Name (ARN) of the network connector.
  final String arn;
  final String id;

  /// The name of the network connector.
  final String name;

  /// The network configuration of the connector, including VPC subnets and
  /// security groups.
  final NetworkConnectorConfiguration? configuration;

  /// The date and time when the connector configuration was last modified.
  final DateTime? lastModified;

  /// The status of the most recent update operation (<code>Successful</code>,
  /// <code>Failed</code>, or <code>InProgress</code>).
  final NetworkConnectorLastUpdateStatus? lastUpdateStatus;

  /// A human-readable explanation of the last update status.
  final String? lastUpdateStatusReason;

  /// A machine-readable code indicating the reason for the last update status.
  /// Use this for programmatic error handling.
  final NetworkConnectorLastUpdateStatusReasonCode? lastUpdateStatusReasonCode;

  /// The ARN of the IAM role that Lambda uses to manage the underlying ENI
  /// resources for this connector.
  final String? operatorRole;

  /// The current state of the network connector.
  final NetworkConnectorState? state;

  /// A human-readable explanation of the current state, populated when the state
  /// is <code>FAILED</code> or <code>DELETE_FAILED</code>.
  final String? stateReason;

  /// A machine-readable code indicating the reason for the current state. Use
  /// this for programmatic error handling.
  final NetworkConnectorStateReasonCode? stateReasonCode;

  /// The version number of the connector configuration, incremented on each
  /// update.
  final int? version;

  GetNetworkConnectorResponse({
    required this.arn,
    required this.id,
    required this.name,
    this.configuration,
    this.lastModified,
    this.lastUpdateStatus,
    this.lastUpdateStatusReason,
    this.lastUpdateStatusReasonCode,
    this.operatorRole,
    this.state,
    this.stateReason,
    this.stateReasonCode,
    this.version,
  });

  factory GetNetworkConnectorResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkConnectorResponse(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      configuration: json['Configuration'] != null
          ? NetworkConnectorConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['LastModified']),
      lastUpdateStatus: (json['LastUpdateStatus'] as String?)
          ?.let(NetworkConnectorLastUpdateStatus.fromString),
      lastUpdateStatusReason: json['LastUpdateStatusReason'] as String?,
      lastUpdateStatusReasonCode:
          (json['LastUpdateStatusReasonCode'] as String?)
              ?.let(NetworkConnectorLastUpdateStatusReasonCode.fromString),
      operatorRole: json['OperatorRole'] as String?,
      state: (json['State'] as String?)?.let(NetworkConnectorState.fromString),
      stateReason: json['StateReason'] as String?,
      stateReasonCode: (json['StateReasonCode'] as String?)
          ?.let(NetworkConnectorStateReasonCode.fromString),
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final configuration = this.configuration;
    final lastModified = this.lastModified;
    final lastUpdateStatus = this.lastUpdateStatus;
    final lastUpdateStatusReason = this.lastUpdateStatusReason;
    final lastUpdateStatusReasonCode = this.lastUpdateStatusReasonCode;
    final operatorRole = this.operatorRole;
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    final version = this.version;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (lastModified != null) 'LastModified': iso8601ToJson(lastModified),
      if (lastUpdateStatus != null) 'LastUpdateStatus': lastUpdateStatus.value,
      if (lastUpdateStatusReason != null)
        'LastUpdateStatusReason': lastUpdateStatusReason,
      if (lastUpdateStatusReasonCode != null)
        'LastUpdateStatusReasonCode': lastUpdateStatusReasonCode.value,
      if (operatorRole != null) 'OperatorRole': operatorRole,
      if (state != null) 'State': state.value,
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.value,
      if (version != null) 'Version': version,
    };
  }
}

/// @nodoc
class UpdateNetworkConnectorResponse {
  /// The Amazon Resource Name (ARN) of the network connector.
  final String arn;
  final String id;

  /// The name of the network connector.
  final String name;

  /// The network configuration of the connector, including VPC subnets and
  /// security groups.
  final NetworkConnectorConfiguration? configuration;

  /// The timestamp of this update.
  final DateTime? lastModified;

  /// The status of this update operation (typically <code>InProgress</code>
  /// immediately after the call).
  final NetworkConnectorLastUpdateStatus? lastUpdateStatus;

  /// A human-readable explanation of the update status.
  final String? lastUpdateStatusReason;

  /// The ARN of the IAM role that Lambda uses to manage the underlying ENI
  /// resources for this connector.
  final String? operatorRole;

  /// The current state of the network connector.
  final NetworkConnectorState? state;

  UpdateNetworkConnectorResponse({
    required this.arn,
    required this.id,
    required this.name,
    this.configuration,
    this.lastModified,
    this.lastUpdateStatus,
    this.lastUpdateStatusReason,
    this.operatorRole,
    this.state,
  });

  factory UpdateNetworkConnectorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkConnectorResponse(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      configuration: json['Configuration'] != null
          ? NetworkConnectorConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['LastModified']),
      lastUpdateStatus: (json['LastUpdateStatus'] as String?)
          ?.let(NetworkConnectorLastUpdateStatus.fromString),
      lastUpdateStatusReason: json['LastUpdateStatusReason'] as String?,
      operatorRole: json['OperatorRole'] as String?,
      state: (json['State'] as String?)?.let(NetworkConnectorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final configuration = this.configuration;
    final lastModified = this.lastModified;
    final lastUpdateStatus = this.lastUpdateStatus;
    final lastUpdateStatusReason = this.lastUpdateStatusReason;
    final operatorRole = this.operatorRole;
    final state = this.state;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (lastModified != null) 'LastModified': iso8601ToJson(lastModified),
      if (lastUpdateStatus != null) 'LastUpdateStatus': lastUpdateStatus.value,
      if (lastUpdateStatusReason != null)
        'LastUpdateStatusReason': lastUpdateStatusReason,
      if (operatorRole != null) 'OperatorRole': operatorRole,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class DeleteNetworkConnectorResponse {
  /// The Amazon Resource Name (ARN) of the network connector.
  final String arn;
  final String id;

  /// The name of the network connector.
  final String name;

  /// The network configuration of the connector, including VPC subnets and
  /// security groups.
  final NetworkConnectorConfiguration? configuration;

  /// The ARN of the IAM role that Lambda uses to manage the underlying ENI
  /// resources for this connector.
  final String? operatorRole;

  /// The current state of the network connector. The State field is typically
  /// <code>DELETING</code> after this call.
  final NetworkConnectorState? state;

  DeleteNetworkConnectorResponse({
    required this.arn,
    required this.id,
    required this.name,
    this.configuration,
    this.operatorRole,
    this.state,
  });

  factory DeleteNetworkConnectorResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNetworkConnectorResponse(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      configuration: json['Configuration'] != null
          ? NetworkConnectorConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      operatorRole: json['OperatorRole'] as String?,
      state: (json['State'] as String?)?.let(NetworkConnectorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final configuration = this.configuration;
    final operatorRole = this.operatorRole;
    final state = this.state;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
      if (operatorRole != null) 'OperatorRole': operatorRole,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class ListNetworkConnectorsResponse {
  /// A list of network connector summaries for the current page of results.
  final List<NetworkConnectorSummary> networkConnectors;

  /// The pagination token to include in a subsequent request to retrieve the next
  /// page. This value is null when there are no more results.
  final String? nextMarker;

  ListNetworkConnectorsResponse({
    required this.networkConnectors,
    this.nextMarker,
  });

  factory ListNetworkConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListNetworkConnectorsResponse(
      networkConnectors: ((json['NetworkConnectors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              NetworkConnectorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkConnectors = this.networkConnectors;
    final nextMarker = this.nextMarker;
    return {
      'NetworkConnectors': networkConnectors,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// Summary information about a network connector returned by
/// <code>ListNetworkConnectors</code>. Contains identifying fields and current
/// state. To retrieve full configuration details, use
/// <code>GetNetworkConnector</code>.
///
/// @nodoc
class NetworkConnectorSummary {
  /// The ARN of the network connector.
  final String arn;
  final String id;

  /// The name of the network connector.
  final String name;

  /// The type of the network connector (<code>VPC_EGRESS</code>).
  final NetworkConnectorType type;

  /// The date and time when the connector was last modified.
  final DateTime? lastModified;

  /// The current state of the network connector.
  final NetworkConnectorState? state;

  NetworkConnectorSummary({
    required this.arn,
    required this.id,
    required this.name,
    required this.type,
    this.lastModified,
    this.state,
  });

  factory NetworkConnectorSummary.fromJson(Map<String, dynamic> json) {
    return NetworkConnectorSummary(
      arn: (json['Arn'] as String?) ?? '',
      id: (json['Id'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      type: NetworkConnectorType.fromString((json['Type'] as String?) ?? ''),
      lastModified: timeStampFromJson(json['LastModified']),
      state: (json['State'] as String?)?.let(NetworkConnectorState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final type = this.type;
    final lastModified = this.lastModified;
    final state = this.state;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      'Type': type.value,
      if (lastModified != null) 'LastModified': iso8601ToJson(lastModified),
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class NetworkConnectorType {
  static const vpcEgress = NetworkConnectorType._('VPC_EGRESS');

  final String value;

  const NetworkConnectorType._(this.value);

  static const values = [vpcEgress];

  static NetworkConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkConnectorType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkConnectorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NetworkConnectorState {
  static const pending = NetworkConnectorState._('PENDING');
  static const active = NetworkConnectorState._('ACTIVE');
  static const inactive = NetworkConnectorState._('INACTIVE');
  static const failed = NetworkConnectorState._('FAILED');
  static const deleting = NetworkConnectorState._('DELETING');
  static const deleteFailed = NetworkConnectorState._('DELETE_FAILED');

  final String value;

  const NetworkConnectorState._(this.value);

  static const values = [
    pending,
    active,
    inactive,
    failed,
    deleting,
    deleteFailed
  ];

  static NetworkConnectorState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkConnectorState._(value));

  @override
  bool operator ==(other) =>
      other is NetworkConnectorState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The network configuration for a network connector. Different connector types
/// use different configuration shapes; specify the configuration that matches
/// your connector type.
///
/// @nodoc
class NetworkConnectorConfiguration {
  /// Configuration for a VPC egress network connector. Specifies the subnets,
  /// security groups, and network protocol for routing outbound traffic through
  /// your VPC.
  final NetworkConnectorVpcEgressConfiguration? vpcEgressConfiguration;

  NetworkConnectorConfiguration({
    this.vpcEgressConfiguration,
  });

  factory NetworkConnectorConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConnectorConfiguration(
      vpcEgressConfiguration: json['VpcEgressConfiguration'] != null
          ? NetworkConnectorVpcEgressConfiguration.fromJson(
              json['VpcEgressConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcEgressConfiguration = this.vpcEgressConfiguration;
    return {
      if (vpcEgressConfiguration != null)
        'VpcEgressConfiguration': vpcEgressConfiguration,
    };
  }
}

/// Configuration for a VPC egress network connector. Specifies the VPC subnets,
/// security groups, network protocol, and associated Lambda compute resource
/// types.
///
/// @nodoc
class NetworkConnectorVpcEgressConfiguration {
  /// The types of Lambda compute resources that can use this connector.
  /// Currently, only <code>MicroVm</code> is supported.
  final List<ComputeResourceType>? associatedComputeResourceTypes;

  /// The network protocol for the connector. Specify <code>IPv4</code> for
  /// IPv4-only networking, or <code>DualStack</code> for both IPv4 and IPv6.
  final NetworkProtocol? networkProtocol;

  /// The IDs of the VPC security groups to attach to the ENIs. Specify 0 to 5
  /// security groups. All security groups must be in the same VPC as the subnets.
  final List<String>? securityGroupIds;

  /// The IDs of the VPC subnets where Lambda provisions elastic network
  /// interfaces (ENIs). Specify 1 to 16 subnets. All subnets must be in the same
  /// VPC.
  final List<String>? subnetIds;

  NetworkConnectorVpcEgressConfiguration({
    this.associatedComputeResourceTypes,
    this.networkProtocol,
    this.securityGroupIds,
    this.subnetIds,
  });

  factory NetworkConnectorVpcEgressConfiguration.fromJson(
      Map<String, dynamic> json) {
    return NetworkConnectorVpcEgressConfiguration(
      associatedComputeResourceTypes:
          (json['AssociatedComputeResourceTypes'] as List?)
              ?.nonNulls
              .map((e) => ComputeResourceType.fromString((e as String)))
              .toList(),
      networkProtocol:
          (json['NetworkProtocol'] as String?)?.let(NetworkProtocol.fromString),
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedComputeResourceTypes = this.associatedComputeResourceTypes;
    final networkProtocol = this.networkProtocol;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (associatedComputeResourceTypes != null)
        'AssociatedComputeResourceTypes':
            associatedComputeResourceTypes.map((e) => e.value).toList(),
      if (networkProtocol != null) 'NetworkProtocol': networkProtocol.value,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// @nodoc
class NetworkProtocol {
  static const iPv4 = NetworkProtocol._('IPv4');
  static const dualStack = NetworkProtocol._('DualStack');

  final String value;

  const NetworkProtocol._(this.value);

  static const values = [iPv4, dualStack];

  static NetworkProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkProtocol._(value));

  @override
  bool operator ==(other) => other is NetworkProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ComputeResourceType {
  static const microVm = ComputeResourceType._('MicroVm');

  final String value;

  const ComputeResourceType._(this.value);

  static const values = [microVm];

  static ComputeResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComputeResourceType._(value));

  @override
  bool operator ==(other) =>
      other is ComputeResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NetworkConnectorLastUpdateStatus {
  static const successful = NetworkConnectorLastUpdateStatus._('Successful');
  static const failed = NetworkConnectorLastUpdateStatus._('Failed');
  static const inProgress = NetworkConnectorLastUpdateStatus._('InProgress');

  final String value;

  const NetworkConnectorLastUpdateStatus._(this.value);

  static const values = [successful, failed, inProgress];

  static NetworkConnectorLastUpdateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkConnectorLastUpdateStatus._(value));

  @override
  bool operator ==(other) =>
      other is NetworkConnectorLastUpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NetworkConnectorStateReasonCode {
  static const disallowedByVpcEncryptionControl =
      NetworkConnectorStateReasonCode._('DisallowedByVpcEncryptionControl');
  static const ec2RequestLimitExceeded =
      NetworkConnectorStateReasonCode._('Ec2RequestLimitExceeded');
  static const insufficientRolePermissions =
      NetworkConnectorStateReasonCode._('InsufficientRolePermissions');
  static const internalError =
      NetworkConnectorStateReasonCode._('InternalError');
  static const invalidSecurityGroup =
      NetworkConnectorStateReasonCode._('InvalidSecurityGroup');
  static const invalidSubnet =
      NetworkConnectorStateReasonCode._('InvalidSubnet');
  static const subnetOutOfIPAddresses =
      NetworkConnectorStateReasonCode._('SubnetOutOfIPAddresses');

  final String value;

  const NetworkConnectorStateReasonCode._(this.value);

  static const values = [
    disallowedByVpcEncryptionControl,
    ec2RequestLimitExceeded,
    insufficientRolePermissions,
    internalError,
    invalidSecurityGroup,
    invalidSubnet,
    subnetOutOfIPAddresses
  ];

  static NetworkConnectorStateReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkConnectorStateReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is NetworkConnectorStateReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NetworkConnectorLastUpdateStatusReasonCode {
  static const disallowedByVpcEncryptionControl =
      NetworkConnectorLastUpdateStatusReasonCode._(
          'DisallowedByVpcEncryptionControl');
  static const ec2RequestLimitExceeded =
      NetworkConnectorLastUpdateStatusReasonCode._('Ec2RequestLimitExceeded');
  static const insufficientRolePermissions =
      NetworkConnectorLastUpdateStatusReasonCode._(
          'InsufficientRolePermissions');
  static const internalError =
      NetworkConnectorLastUpdateStatusReasonCode._('InternalError');
  static const invalidSecurityGroup =
      NetworkConnectorLastUpdateStatusReasonCode._('InvalidSecurityGroup');
  static const invalidSubnet =
      NetworkConnectorLastUpdateStatusReasonCode._('InvalidSubnet');
  static const subnetOutOfIPAddresses =
      NetworkConnectorLastUpdateStatusReasonCode._('SubnetOutOfIPAddresses');

  final String value;

  const NetworkConnectorLastUpdateStatusReasonCode._(this.value);

  static const values = [
    disallowedByVpcEncryptionControl,
    ec2RequestLimitExceeded,
    insufficientRolePermissions,
    internalError,
    invalidSecurityGroup,
    invalidSubnet,
    subnetOutOfIPAddresses
  ];

  static NetworkConnectorLastUpdateStatusReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkConnectorLastUpdateStatusReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is NetworkConnectorLastUpdateStatusReasonCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

/// @nodoc
class NetworkConnectorLimitExceededException extends _s.GenericAwsException {
  NetworkConnectorLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'NetworkConnectorLimitExceededException',
            message: message);
}

/// @nodoc
class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

/// @nodoc
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'NetworkConnectorLimitExceededException': (type, message) =>
      NetworkConnectorLimitExceededException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
