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

/// Welcome to the Routing Control (Recovery Cluster) API Reference Guide for
/// Amazon Route 53 Application Recovery Controller.
///
/// With Route 53 ARC, you can use routing control with extreme reliability to
/// recover applications by rerouting traffic across Availability Zones or
/// Amazon Web Services Regions. Routing controls are simple on/off switches
/// hosted on a highly available cluster in Route 53 ARC. A cluster provides a
/// set of five redundant Regional endpoints against which you can run API calls
/// to get or update the state of routing controls. To implement failover, you
/// set one routing control to ON and another one to OFF, to reroute traffic
/// from one Availability Zone or Amazon Web Services Region to another.
///
/// <i>Be aware that you must specify a Regional endpoint for a cluster when you
/// work with API cluster operations to get or update routing control states in
/// Route 53 ARC.</i> In addition, you must specify the US West (Oregon) Region
/// for Route 53 ARC API calls. For example, use the parameter <code>--region
/// us-west-2</code> with AWS CLI commands. For more information, see <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.api.html">
/// Get and update routing control states using the API</a> in the Amazon Route
/// 53 Application Recovery Controller Developer Guide.
///
/// This API guide includes information about the API operations for how to get
/// and update routing control states in Route 53 ARC. To work with routing
/// control in Route 53 ARC, you must first create the required components
/// (clusters, control panels, and routing controls) using the recovery cluster
/// configuration API.
///
/// For more information about working with routing control in Route 53 ARC, see
/// the following:
///
/// <ul>
/// <li>
/// Create clusters, control panels, and routing controls by using API
/// operations. For more information, see the <a
/// href="https://docs.aws.amazon.com/recovery-cluster/latest/api/">Recovery
/// Control Configuration API Reference Guide for Amazon Route 53 Application
/// Recovery Controller</a>.
/// </li>
/// <li>
/// Learn about the components in recovery control, including clusters, routing
/// controls, and control panels, and how to work with Route 53 ARC in the
/// Amazon Web Services console. For more information, see <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/introduction-components.html#introduction-components-routing">
/// Recovery control components</a> in the Amazon Route 53 Application Recovery
/// Controller Developer Guide.
/// </li>
/// <li>
/// Route 53 ARC also provides readiness checks that continually audit resources
/// to help make sure that your applications are scaled and ready to handle
/// failover traffic. For more information about the related API operations, see
/// the <a
/// href="https://docs.aws.amazon.com/recovery-readiness/latest/api/">Recovery
/// Readiness API Reference Guide for Amazon Route 53 Application Recovery
/// Controller</a>.
/// </li>
/// <li>
/// For more information about creating resilient applications and preparing for
/// recovery readiness with Route 53 ARC, see the <a
/// href="https://docs.aws.amazon.com/r53recovery/latest/dg/">Amazon Route 53
/// Application Recovery Controller Developer Guide</a>.
/// </li>
/// </ul>
class Route53RecoveryCluster {
  final _s.JsonProtocol _protocol;
  Route53RecoveryCluster({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53-recovery-cluster',
            signingName: 'route53-recovery-cluster',
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

  /// Get the state for a routing control. A routing control is a simple on/off
  /// switch that you can use to route traffic to cells. When a routing control
  /// state is set to ON, traffic flows to a cell. When the state is set to OFF,
  /// traffic does not flow.
  ///
  /// Before you can create a routing control, you must first create a cluster,
  /// and then host the control in a control panel on the cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.create.html">
  /// Create routing control structures</a> in the Amazon Route 53 Application
  /// Recovery Controller Developer Guide. You access one of the endpoints for
  /// the cluster to get or update the routing control state to redirect traffic
  /// for your application.
  ///
  /// <i>You must specify Regional endpoints when you work with API cluster
  /// operations to get or update routing control states in Route 53 ARC.</i>
  ///
  /// To see a code example for getting a routing control state, including
  /// accessing Regional cluster endpoints in sequence, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html">API
  /// examples</a> in the Amazon Route 53 Application Recovery Controller
  /// Developer Guide.
  ///
  /// Learn more about working with routing controls in the following topics in
  /// the Amazon Route 53 Application Recovery Controller Developer Guide:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html">
  /// Viewing and updating routing control states</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Working
  /// with routing controls in Route 53 ARC</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [EndpointTemporarilyUnavailableException].
  ///
  /// Parameter [routingControlArn] :
  /// The Amazon Resource Name (ARN) for the routing control that you want to
  /// get the state for.
  Future<GetRoutingControlStateResponse> getRoutingControlState({
    required String routingControlArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ToggleCustomerAPI.GetRoutingControlState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoutingControlArn': routingControlArn,
      },
    );

    return GetRoutingControlStateResponse.fromJson(jsonResponse.body);
  }

  /// List routing control names and Amazon Resource Names (ARNs), as well as
  /// the routing control state for each routing control, along with the control
  /// panel name and control panel ARN for the routing controls. If you specify
  /// a control panel ARN, this call lists the routing controls in the control
  /// panel. Otherwise, it lists all the routing controls in the cluster.
  ///
  /// A routing control is a simple on/off switch in Route 53 ARC that you can
  /// use to route traffic to cells. When a routing control state is set to ON,
  /// traffic flows to a cell. When the state is set to OFF, traffic does not
  /// flow.
  ///
  /// Before you can create a routing control, you must first create a cluster,
  /// and then host the control in a control panel on the cluster. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.create.html">
  /// Create routing control structures</a> in the Amazon Route 53 Application
  /// Recovery Controller Developer Guide. You access one of the endpoints for
  /// the cluster to get or update the routing control state to redirect traffic
  /// for your application.
  ///
  /// <i>You must specify Regional endpoints when you work with API cluster
  /// operations to use this API operation to list routing controls in Route 53
  /// ARC.</i>
  ///
  /// Learn more about working with routing controls in the following topics in
  /// the Amazon Route 53 Application Recovery Controller Developer Guide:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html">
  /// Viewing and updating routing control states</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Working
  /// with routing controls in Route 53 ARC</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [EndpointTemporarilyUnavailableException].
  ///
  /// Parameter [controlPanelArn] :
  /// The Amazon Resource Name (ARN) of the control panel of the routing
  /// controls to list.
  ///
  /// Parameter [maxResults] :
  /// The number of routing controls objects that you want to return with this
  /// call. The default value is 500.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous call.
  Future<ListRoutingControlsResponse> listRoutingControls({
    String? controlPanelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ToggleCustomerAPI.ListRoutingControls'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (controlPanelArn != null) 'ControlPanelArn': controlPanelArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRoutingControlsResponse.fromJson(jsonResponse.body);
  }

  /// Set the state of the routing control to reroute traffic. You can set the
  /// value to ON or OFF. When the state is ON, traffic flows to a cell. When
  /// the state is OFF, traffic does not flow.
  ///
  /// With Route 53 ARC, you can add safety rules for routing controls, which
  /// are safeguards for routing control state updates that help prevent
  /// unexpected outcomes, like fail open traffic routing. However, there are
  /// scenarios when you might want to bypass the routing control safeguards
  /// that are enforced with safety rules that you've configured. For example,
  /// you might want to fail over quickly for disaster recovery, and one or more
  /// safety rules might be unexpectedly preventing you from updating a routing
  /// control state to reroute traffic. In a "break glass" scenario like this,
  /// you can override one or more safety rules to change a routing control
  /// state and fail over your application.
  ///
  /// The <code>SafetyRulesToOverride</code> property enables you override one
  /// or more safety rules and update routing control states. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html">
  /// Override safety rules to reroute traffic</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  ///
  /// <i>You must specify Regional endpoints when you work with API cluster
  /// operations to get or update routing control states in Route 53 ARC.</i>
  ///
  /// To see a code example for getting a routing control state, including
  /// accessing Regional cluster endpoints in sequence, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html">API
  /// examples</a> in the Amazon Route 53 Application Recovery Controller
  /// Developer Guide.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html">
  /// Viewing and updating routing control states</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Working
  /// with routing controls overall</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [EndpointTemporarilyUnavailableException].
  /// May throw [ConflictException].
  ///
  /// Parameter [routingControlArn] :
  /// The Amazon Resource Name (ARN) for the routing control that you want to
  /// update the state for.
  ///
  /// Parameter [routingControlState] :
  /// The state of the routing control. You can set the value to ON or OFF.
  ///
  /// Parameter [safetyRulesToOverride] :
  /// The Amazon Resource Names (ARNs) for the safety rules that you want to
  /// override when you're updating the state of a routing control. You can
  /// override one safety rule or multiple safety rules by including one or more
  /// ARNs, separated by commas.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html">
  /// Override safety rules to reroute traffic</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  Future<void> updateRoutingControlState({
    required String routingControlArn,
    required RoutingControlState routingControlState,
    List<String>? safetyRulesToOverride,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ToggleCustomerAPI.UpdateRoutingControlState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoutingControlArn': routingControlArn,
        'RoutingControlState': routingControlState.toValue(),
        if (safetyRulesToOverride != null)
          'SafetyRulesToOverride': safetyRulesToOverride,
      },
    );
  }

  /// Set multiple routing control states. You can set the value for each state
  /// to be ON or OFF. When the state is ON, traffic flows to a cell. When it's
  /// OFF, traffic does not flow.
  ///
  /// With Route 53 ARC, you can add safety rules for routing controls, which
  /// are safeguards for routing control state updates that help prevent
  /// unexpected outcomes, like fail open traffic routing. However, there are
  /// scenarios when you might want to bypass the routing control safeguards
  /// that are enforced with safety rules that you've configured. For example,
  /// you might want to fail over quickly for disaster recovery, and one or more
  /// safety rules might be unexpectedly preventing you from updating a routing
  /// control state to reroute traffic. In a "break glass" scenario like this,
  /// you can override one or more safety rules to change a routing control
  /// state and fail over your application.
  ///
  /// The <code>SafetyRulesToOverride</code> property enables you override one
  /// or more safety rules and update routing control states. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html">
  /// Override safety rules to reroute traffic</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  ///
  /// <i>You must specify Regional endpoints when you work with API cluster
  /// operations to get or update routing control states in Route 53 ARC.</i>
  ///
  /// To see a code example for getting a routing control state, including
  /// accessing Regional cluster endpoints in sequence, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html">API
  /// examples</a> in the Amazon Route 53 Application Recovery Controller
  /// Developer Guide.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html">
  /// Viewing and updating routing control states</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html">Working
  /// with routing controls overall</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [EndpointTemporarilyUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ServiceLimitExceededException].
  ///
  /// Parameter [updateRoutingControlStateEntries] :
  /// A set of routing control entries that you want to update.
  ///
  /// Parameter [safetyRulesToOverride] :
  /// The Amazon Resource Names (ARNs) for the safety rules that you want to
  /// override when you're updating routing control states. You can override one
  /// safety rule or multiple safety rules by including one or more ARNs,
  /// separated by commas.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html">
  /// Override safety rules to reroute traffic</a> in the Amazon Route 53
  /// Application Recovery Controller Developer Guide.
  Future<void> updateRoutingControlStates({
    required List<UpdateRoutingControlStateEntry>
        updateRoutingControlStateEntries,
    List<String>? safetyRulesToOverride,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'ToggleCustomerAPI.UpdateRoutingControlStates'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UpdateRoutingControlStateEntries': updateRoutingControlStateEntries,
        if (safetyRulesToOverride != null)
          'SafetyRulesToOverride': safetyRulesToOverride,
      },
    );
  }
}

class GetRoutingControlStateResponse {
  /// The Amazon Resource Name (ARN) of the response.
  final String routingControlArn;

  /// The state of the routing control.
  final RoutingControlState routingControlState;

  /// The routing control name.
  final String? routingControlName;

  GetRoutingControlStateResponse({
    required this.routingControlArn,
    required this.routingControlState,
    this.routingControlName,
  });

  factory GetRoutingControlStateResponse.fromJson(Map<String, dynamic> json) {
    return GetRoutingControlStateResponse(
      routingControlArn: json['RoutingControlArn'] as String,
      routingControlState:
          (json['RoutingControlState'] as String).toRoutingControlState(),
      routingControlName: json['RoutingControlName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routingControlArn = this.routingControlArn;
    final routingControlState = this.routingControlState;
    final routingControlName = this.routingControlName;
    return {
      'RoutingControlArn': routingControlArn,
      'RoutingControlState': routingControlState.toValue(),
      if (routingControlName != null) 'RoutingControlName': routingControlName,
    };
  }
}

class ListRoutingControlsResponse {
  /// The list of routing controls.
  final List<RoutingControl> routingControls;

  /// The token for the next set of results. You receive this token from a
  /// previous call.
  final String? nextToken;

  ListRoutingControlsResponse({
    required this.routingControls,
    this.nextToken,
  });

  factory ListRoutingControlsResponse.fromJson(Map<String, dynamic> json) {
    return ListRoutingControlsResponse(
      routingControls: (json['RoutingControls'] as List)
          .whereNotNull()
          .map((e) => RoutingControl.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routingControls = this.routingControls;
    final nextToken = this.nextToken;
    return {
      'RoutingControls': routingControls,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A routing control, which is a simple on/off switch that you can use to route
/// traffic to cells. When a routing control state is set to ON, traffic flows
/// to a cell. When the state is set to OFF, traffic does not flow.
class RoutingControl {
  /// The Amazon Resource Name (ARN) of the control panel where the routing
  /// control is located.
  final String? controlPanelArn;

  /// The name of the control panel where the routing control is located. Only
  /// ASCII characters are supported for control panel names.
  final String? controlPanelName;

  /// The Amazon Web Services account ID of the routing control owner.
  final String? owner;

  /// The Amazon Resource Name (ARN) of the routing control.
  final String? routingControlArn;

  /// The name of the routing control.
  final String? routingControlName;

  /// The current state of the routing control. When a routing control state is
  /// set to ON, traffic flows to a cell. When the state is set to OFF, traffic
  /// does not flow.
  final RoutingControlState? routingControlState;

  RoutingControl({
    this.controlPanelArn,
    this.controlPanelName,
    this.owner,
    this.routingControlArn,
    this.routingControlName,
    this.routingControlState,
  });

  factory RoutingControl.fromJson(Map<String, dynamic> json) {
    return RoutingControl(
      controlPanelArn: json['ControlPanelArn'] as String?,
      controlPanelName: json['ControlPanelName'] as String?,
      owner: json['Owner'] as String?,
      routingControlArn: json['RoutingControlArn'] as String?,
      routingControlName: json['RoutingControlName'] as String?,
      routingControlState:
          (json['RoutingControlState'] as String?)?.toRoutingControlState(),
    );
  }

  Map<String, dynamic> toJson() {
    final controlPanelArn = this.controlPanelArn;
    final controlPanelName = this.controlPanelName;
    final owner = this.owner;
    final routingControlArn = this.routingControlArn;
    final routingControlName = this.routingControlName;
    final routingControlState = this.routingControlState;
    return {
      if (controlPanelArn != null) 'ControlPanelArn': controlPanelArn,
      if (controlPanelName != null) 'ControlPanelName': controlPanelName,
      if (owner != null) 'Owner': owner,
      if (routingControlArn != null) 'RoutingControlArn': routingControlArn,
      if (routingControlName != null) 'RoutingControlName': routingControlName,
      if (routingControlState != null)
        'RoutingControlState': routingControlState.toValue(),
    };
  }
}

enum RoutingControlState {
  on,
  off,
}

extension RoutingControlStateValueExtension on RoutingControlState {
  String toValue() {
    switch (this) {
      case RoutingControlState.on:
        return 'On';
      case RoutingControlState.off:
        return 'Off';
    }
  }
}

extension RoutingControlStateFromString on String {
  RoutingControlState toRoutingControlState() {
    switch (this) {
      case 'On':
        return RoutingControlState.on;
      case 'Off':
        return RoutingControlState.off;
    }
    throw Exception('$this is not known in enum RoutingControlState');
  }
}

/// A routing control state entry.
class UpdateRoutingControlStateEntry {
  /// The Amazon Resource Name (ARN) for a routing control state entry.
  final String routingControlArn;

  /// The routing control state in a set of routing control state entries.
  final RoutingControlState routingControlState;

  UpdateRoutingControlStateEntry({
    required this.routingControlArn,
    required this.routingControlState,
  });

  Map<String, dynamic> toJson() {
    final routingControlArn = this.routingControlArn;
    final routingControlState = this.routingControlState;
    return {
      'RoutingControlArn': routingControlArn,
      'RoutingControlState': routingControlState.toValue(),
    };
  }
}

class UpdateRoutingControlStateResponse {
  UpdateRoutingControlStateResponse();

  factory UpdateRoutingControlStateResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRoutingControlStateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRoutingControlStatesResponse {
  UpdateRoutingControlStatesResponse();

  factory UpdateRoutingControlStatesResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRoutingControlStatesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class EndpointTemporarilyUnavailableException extends _s.GenericAwsException {
  EndpointTemporarilyUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'EndpointTemporarilyUnavailableException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
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
  'EndpointTemporarilyUnavailableException': (type, message) =>
      EndpointTemporarilyUnavailableException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceLimitExceededException': (type, message) =>
      ServiceLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
