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

/// Launch Wizard offers a guided way of sizing, configuring, and deploying
/// Amazon Web Services resources for third party applications, such as
/// Microsoft SQL Server Always On and HANA based SAP systems, without the need
/// to manually identify and provision individual Amazon Web Services resources.
class LaunchWizard {
  final _s.RestJsonProtocol _protocol;
  LaunchWizard({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'launchwizard',
            signingName: 'launchwizard',
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

  /// Creates a deployment for the given workload. Deployments created by this
  /// operation are not available in the Launch Wizard console to use the
  /// <code>Clone deployment</code> action on.
  ///
  /// May throw [ResourceLimitException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deploymentPatternName] :
  /// The name of the deployment pattern supported by a given workload. You can
  /// use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloadDeploymentPatterns.html">
  /// <code>ListWorkloadDeploymentPatterns</code> </a> operation to discover
  /// supported values for this parameter.
  ///
  /// Parameter [name] :
  /// The name of the deployment.
  ///
  /// Parameter [specifications] :
  /// The settings specified for the deployment. These settings define how to
  /// deploy and configure your resources created by the deployment. For more
  /// information about the specifications required for creating a deployment
  /// for a SAP workload, see <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/launch-wizard-specifications-sap.html">SAP
  /// deployment specifications</a>. To retrieve the specifications required to
  /// create a deployment for other workloads, use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_GetWorkloadDeploymentPattern.html">
  /// <code>GetWorkloadDeploymentPattern</code> </a> operation.
  ///
  /// Parameter [workloadName] :
  /// The name of the workload. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">
  /// <code>ListWorkloads</code> </a> operation to discover supported values for
  /// this parameter.
  ///
  /// Parameter [dryRun] :
  /// Checks whether you have the required permissions for the action, without
  /// actually making the request, and provides an error response. If you have
  /// the required permissions, the error response is
  /// <code>DryRunOperation</code>. Otherwise, it is
  /// <code>UnauthorizedOperation</code>.
  ///
  /// Parameter [tags] :
  /// The tags to add to the deployment.
  Future<CreateDeploymentOutput> createDeployment({
    required String deploymentPatternName,
    required String name,
    required Map<String, String> specifications,
    required String workloadName,
    bool? dryRun,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentPatternName': deploymentPatternName,
      'name': name,
      'specifications': specifications,
      'workloadName': workloadName,
      if (dryRun != null) 'dryRun': dryRun,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createDeployment',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentOutput.fromJson(response);
  }

  /// Deletes a deployment.
  ///
  /// May throw [ResourceLimitException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  Future<DeleteDeploymentOutput> deleteDeployment({
    required String deploymentId,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentId': deploymentId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteDeployment',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDeploymentOutput.fromJson(response);
  }

  /// Returns information about the deployment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  Future<GetDeploymentOutput> getDeployment({
    required String deploymentId,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentId': deploymentId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getDeployment',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentOutput.fromJson(response);
  }

  /// Returns information about a workload.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [workloadName] :
  /// The name of the workload.
  Future<GetWorkloadOutput> getWorkload({
    required String workloadName,
  }) async {
    final $payload = <String, dynamic>{
      'workloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getWorkload',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadOutput.fromJson(response);
  }

  /// Returns details for a given workload and deployment pattern, including the
  /// available specifications. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">ListWorkloads</a>
  /// operation to discover the available workload names and the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloadDeploymentPatterns.html">ListWorkloadDeploymentPatterns</a>
  /// operation to discover the available deployment pattern names of a given
  /// workload.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deploymentPatternName] :
  /// The name of the deployment pattern.
  ///
  /// Parameter [workloadName] :
  /// The name of the workload.
  Future<GetWorkloadDeploymentPatternOutput> getWorkloadDeploymentPattern({
    required String deploymentPatternName,
    required String workloadName,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentPatternName': deploymentPatternName,
      'workloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getWorkloadDeploymentPattern',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadDeploymentPatternOutput.fromJson(response);
  }

  /// Lists the events of a deployment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this request. To get the next
  /// page of items, make another request with the token returned in the output.
  ///
  /// Parameter [nextToken] :
  /// The token returned from a previous paginated request. Pagination continues
  /// from the end of the items returned by the previous request.
  Future<ListDeploymentEventsOutput> listDeploymentEvents({
    required String deploymentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'deploymentId': deploymentId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listDeploymentEvents',
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentEventsOutput.fromJson(response);
  }

  /// Lists the deployments that have been created.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Filters to scope the results. The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>WORKLOAD_NAME</code> - The name used in deployments.
  /// </li>
  /// <li>
  /// <code>DEPLOYMENT_STATUS</code> - <code>COMPLETED</code> |
  /// <code>CREATING</code> | <code>DELETE_IN_PROGRESS</code> |
  /// <code>DELETE_INITIATING</code> | <code>DELETE_FAILED</code> |
  /// <code>DELETED</code> | <code>FAILED</code> | <code>IN_PROGRESS</code> |
  /// <code>VALIDATING</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this request. To get the next
  /// page of items, make another request with the token returned in the output.
  ///
  /// Parameter [nextToken] :
  /// The token returned from a previous paginated request. Pagination continues
  /// from the end of the items returned by the previous request.
  Future<ListDeploymentsOutput> listDeployments({
    List<DeploymentFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listDeployments',
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentsOutput.fromJson(response);
  }

  /// Lists the tags associated with a specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Lists the workload deployment patterns for a given workload name. You can
  /// use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">ListWorkloads</a>
  /// operation to discover the available workload names.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [workloadName] :
  /// The name of the workload.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this request. To get the next
  /// page of items, make another request with the token returned in the output.
  ///
  /// Parameter [nextToken] :
  /// The token returned from a previous paginated request. Pagination continues
  /// from the end of the items returned by the previous request.
  Future<ListWorkloadDeploymentPatternsOutput> listWorkloadDeploymentPatterns({
    required String workloadName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'workloadName': workloadName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWorkloadDeploymentPatterns',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkloadDeploymentPatternsOutput.fromJson(response);
  }

  /// Lists the available workload names. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloadDeploymentPatterns.html">ListWorkloadDeploymentPatterns</a>
  /// operation to discover the available deployment patterns for a given
  /// workload.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this request. To get the next
  /// page of items, make another request with the token returned in the output.
  ///
  /// Parameter [nextToken] :
  /// The token returned from a previous paginated request. Pagination continues
  /// from the end of the items returned by the previous request.
  Future<ListWorkloadsOutput> listWorkloads({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWorkloads',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkloadsOutput.fromJson(response);
  }

  /// Adds the specified tags to the given resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags to attach to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the given resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Keys identifying the tags to remove.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class CreateDeploymentOutput {
  /// The ID of the deployment.
  final String? deploymentId;

  CreateDeploymentOutput({
    this.deploymentId,
  });

  factory CreateDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentOutput(
      deploymentId: json['deploymentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
    };
  }
}

class DeleteDeploymentOutput {
  /// The status of the deployment.
  final DeploymentStatus? status;

  /// The reason for the deployment status.
  final String? statusReason;

  DeleteDeploymentOutput({
    this.status,
    this.statusReason,
  });

  factory DeleteDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDeploymentOutput(
      status: (json['status'] as String?)?.toDeploymentStatus(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// A field that details a condition of the specifications for a deployment.
class DeploymentConditionalField {
  /// The comparator of the condition.
  ///
  /// Valid values: <code>Equal | NotEqual</code>
  final String? comparator;

  /// The name of the deployment condition.
  final String? name;

  /// The value of the condition.
  final String? value;

  DeploymentConditionalField({
    this.comparator,
    this.name,
    this.value,
  });

  factory DeploymentConditionalField.fromJson(Map<String, dynamic> json) {
    return DeploymentConditionalField(
      comparator: json['comparator'] as String?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final name = this.name;
    final value = this.value;
    return {
      if (comparator != null) 'comparator': comparator,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// The data associated with a deployment.
class DeploymentData {
  /// The time the deployment was created.
  final DateTime? createdAt;

  /// The time the deployment was deleted.
  final DateTime? deletedAt;

  /// The Amazon Resource Name (ARN) of the deployment.
  final String? deploymentArn;

  /// The ID of the deployment.
  final String? id;

  /// The name of the deployment.
  final String? name;

  /// The pattern name of the deployment.
  final String? patternName;

  /// The resource group of the deployment.
  final String? resourceGroup;

  /// The settings specified for the deployment. These settings define how to
  /// deploy and configure your resources created by the deployment. For more
  /// information about the specifications required for creating a deployment for
  /// a SAP workload, see <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/launch-wizard-specifications-sap.html">SAP
  /// deployment specifications</a>. To retrieve the specifications required to
  /// create a deployment for other workloads, use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_GetWorkloadDeploymentPattern.html">
  /// <code>GetWorkloadDeploymentPattern</code> </a> operation.
  final Map<String, String>? specifications;

  /// The status of the deployment.
  final DeploymentStatus? status;

  /// Information about the tags attached to a deployment.
  final Map<String, String>? tags;

  /// The name of the workload.
  final String? workloadName;

  DeploymentData({
    this.createdAt,
    this.deletedAt,
    this.deploymentArn,
    this.id,
    this.name,
    this.patternName,
    this.resourceGroup,
    this.specifications,
    this.status,
    this.tags,
    this.workloadName,
  });

  factory DeploymentData.fromJson(Map<String, dynamic> json) {
    return DeploymentData(
      createdAt: timeStampFromJson(json['createdAt']),
      deletedAt: timeStampFromJson(json['deletedAt']),
      deploymentArn: json['deploymentArn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      patternName: json['patternName'] as String?,
      resourceGroup: json['resourceGroup'] as String?,
      specifications: (json['specifications'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toDeploymentStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deletedAt = this.deletedAt;
    final deploymentArn = this.deploymentArn;
    final id = this.id;
    final name = this.name;
    final patternName = this.patternName;
    final resourceGroup = this.resourceGroup;
    final specifications = this.specifications;
    final status = this.status;
    final tags = this.tags;
    final workloadName = this.workloadName;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deletedAt != null) 'deletedAt': unixTimestampToJson(deletedAt),
      if (deploymentArn != null) 'deploymentArn': deploymentArn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (patternName != null) 'patternName': patternName,
      if (resourceGroup != null) 'resourceGroup': resourceGroup,
      if (specifications != null) 'specifications': specifications,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// A summary of the deployment data.
class DeploymentDataSummary {
  /// The time the deployment was created.
  final DateTime? createdAt;

  /// The ID of the deployment.
  final String? id;

  /// The name of the deployment
  final String? name;

  /// The name of the workload deployment pattern.
  final String? patternName;

  /// The status of the deployment.
  final DeploymentStatus? status;

  /// The name of the workload.
  final String? workloadName;

  DeploymentDataSummary({
    this.createdAt,
    this.id,
    this.name,
    this.patternName,
    this.status,
    this.workloadName,
  });

  factory DeploymentDataSummary.fromJson(Map<String, dynamic> json) {
    return DeploymentDataSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      patternName: json['patternName'] as String?,
      status: (json['status'] as String?)?.toDeploymentStatus(),
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final patternName = this.patternName;
    final status = this.status;
    final workloadName = this.workloadName;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (patternName != null) 'patternName': patternName,
      if (status != null) 'status': status.toValue(),
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// A summary of the deployment event data.
class DeploymentEventDataSummary {
  /// The description of the deployment event.
  final String? description;

  /// The name of the deployment event.
  final String? name;

  /// The status of the deployment event.
  final EventStatus? status;

  /// The reason of the deployment event status.
  final String? statusReason;

  /// The timestamp of the deployment event.
  final DateTime? timestamp;

  DeploymentEventDataSummary({
    this.description,
    this.name,
    this.status,
    this.statusReason,
    this.timestamp,
  });

  factory DeploymentEventDataSummary.fromJson(Map<String, dynamic> json) {
    return DeploymentEventDataSummary(
      description: json['description'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toEventStatus(),
      statusReason: json['statusReason'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final status = this.status;
    final statusReason = this.statusReason;
    final timestamp = this.timestamp;
    return {
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// A filter name and value pair that is used to return more specific results
/// from a describe operation. Filters can be used to match a set of resources
/// by specific criteria.
class DeploymentFilter {
  /// The name of the filter. Filter names are case-sensitive.
  final DeploymentFilterKey? name;

  /// The filter values. Filter values are case-sensitive. If you specify multiple
  /// values for a filter, the values are joined with an <code>OR</code>, and the
  /// request returns all results that match any of the specified values.
  final List<String>? values;

  DeploymentFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.toValue(),
      if (values != null) 'values': values,
    };
  }
}

enum DeploymentFilterKey {
  workloadName,
  deploymentStatus,
}

extension DeploymentFilterKeyValueExtension on DeploymentFilterKey {
  String toValue() {
    switch (this) {
      case DeploymentFilterKey.workloadName:
        return 'WORKLOAD_NAME';
      case DeploymentFilterKey.deploymentStatus:
        return 'DEPLOYMENT_STATUS';
    }
  }
}

extension DeploymentFilterKeyFromString on String {
  DeploymentFilterKey toDeploymentFilterKey() {
    switch (this) {
      case 'WORKLOAD_NAME':
        return DeploymentFilterKey.workloadName;
      case 'DEPLOYMENT_STATUS':
        return DeploymentFilterKey.deploymentStatus;
    }
    throw Exception('$this is not known in enum DeploymentFilterKey');
  }
}

/// A field that details a specification of a deployment pattern.
class DeploymentSpecificationsField {
  /// The allowed values of the deployment specification.
  final List<String>? allowedValues;

  /// The conditionals used for the deployment specification.
  final List<DeploymentConditionalField>? conditionals;

  /// The description of the deployment specification.
  final String? description;

  /// The name of the deployment specification.
  final String? name;

  /// Indicates if the deployment specification is required.
  final String? required;

  DeploymentSpecificationsField({
    this.allowedValues,
    this.conditionals,
    this.description,
    this.name,
    this.required,
  });

  factory DeploymentSpecificationsField.fromJson(Map<String, dynamic> json) {
    return DeploymentSpecificationsField(
      allowedValues: (json['allowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      conditionals: (json['conditionals'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentConditionalField.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      name: json['name'] as String?,
      required: json['required'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final conditionals = this.conditionals;
    final description = this.description;
    final name = this.name;
    final required = this.required;
    return {
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (conditionals != null) 'conditionals': conditionals,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (required != null) 'required': required,
    };
  }
}

enum DeploymentStatus {
  completed,
  creating,
  deleteInProgress,
  deleteInitiating,
  deleteFailed,
  deleted,
  failed,
  inProgress,
  validating,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.completed:
        return 'COMPLETED';
      case DeploymentStatus.creating:
        return 'CREATING';
      case DeploymentStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case DeploymentStatus.deleteInitiating:
        return 'DELETE_INITIATING';
      case DeploymentStatus.deleteFailed:
        return 'DELETE_FAILED';
      case DeploymentStatus.deleted:
        return 'DELETED';
      case DeploymentStatus.failed:
        return 'FAILED';
      case DeploymentStatus.inProgress:
        return 'IN_PROGRESS';
      case DeploymentStatus.validating:
        return 'VALIDATING';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'COMPLETED':
        return DeploymentStatus.completed;
      case 'CREATING':
        return DeploymentStatus.creating;
      case 'DELETE_IN_PROGRESS':
        return DeploymentStatus.deleteInProgress;
      case 'DELETE_INITIATING':
        return DeploymentStatus.deleteInitiating;
      case 'DELETE_FAILED':
        return DeploymentStatus.deleteFailed;
      case 'DELETED':
        return DeploymentStatus.deleted;
      case 'FAILED':
        return DeploymentStatus.failed;
      case 'IN_PROGRESS':
        return DeploymentStatus.inProgress;
      case 'VALIDATING':
        return DeploymentStatus.validating;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

enum EventStatus {
  canceled,
  canceling,
  completed,
  created,
  failed,
  inProgress,
  pending,
  timedOut,
}

extension EventStatusValueExtension on EventStatus {
  String toValue() {
    switch (this) {
      case EventStatus.canceled:
        return 'CANCELED';
      case EventStatus.canceling:
        return 'CANCELING';
      case EventStatus.completed:
        return 'COMPLETED';
      case EventStatus.created:
        return 'CREATED';
      case EventStatus.failed:
        return 'FAILED';
      case EventStatus.inProgress:
        return 'IN_PROGRESS';
      case EventStatus.pending:
        return 'PENDING';
      case EventStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension EventStatusFromString on String {
  EventStatus toEventStatus() {
    switch (this) {
      case 'CANCELED':
        return EventStatus.canceled;
      case 'CANCELING':
        return EventStatus.canceling;
      case 'COMPLETED':
        return EventStatus.completed;
      case 'CREATED':
        return EventStatus.created;
      case 'FAILED':
        return EventStatus.failed;
      case 'IN_PROGRESS':
        return EventStatus.inProgress;
      case 'PENDING':
        return EventStatus.pending;
      case 'TIMED_OUT':
        return EventStatus.timedOut;
    }
    throw Exception('$this is not known in enum EventStatus');
  }
}

class GetDeploymentOutput {
  /// An object that details the deployment.
  final DeploymentData? deployment;

  GetDeploymentOutput({
    this.deployment,
  });

  factory GetDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return GetDeploymentOutput(
      deployment: json['deployment'] != null
          ? DeploymentData.fromJson(json['deployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deployment = this.deployment;
    return {
      if (deployment != null) 'deployment': deployment,
    };
  }
}

class GetWorkloadDeploymentPatternOutput {
  /// Details about the workload deployment pattern.
  final WorkloadDeploymentPatternData? workloadDeploymentPattern;

  GetWorkloadDeploymentPatternOutput({
    this.workloadDeploymentPattern,
  });

  factory GetWorkloadDeploymentPatternOutput.fromJson(
      Map<String, dynamic> json) {
    return GetWorkloadDeploymentPatternOutput(
      workloadDeploymentPattern: json['workloadDeploymentPattern'] != null
          ? WorkloadDeploymentPatternData.fromJson(
              json['workloadDeploymentPattern'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadDeploymentPattern = this.workloadDeploymentPattern;
    return {
      if (workloadDeploymentPattern != null)
        'workloadDeploymentPattern': workloadDeploymentPattern,
    };
  }
}

class GetWorkloadOutput {
  /// Information about the workload.
  final WorkloadData? workload;

  GetWorkloadOutput({
    this.workload,
  });

  factory GetWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return GetWorkloadOutput(
      workload: json['workload'] != null
          ? WorkloadData.fromJson(json['workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workload = this.workload;
    return {
      if (workload != null) 'workload': workload,
    };
  }
}

class ListDeploymentEventsOutput {
  /// Lists the deployment events.
  final List<DeploymentEventDataSummary>? deploymentEvents;

  /// The token to include in another request to get the next page of items. This
  /// value is <code>null</code> when there are no more items to return.
  final String? nextToken;

  ListDeploymentEventsOutput({
    this.deploymentEvents,
    this.nextToken,
  });

  factory ListDeploymentEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentEventsOutput(
      deploymentEvents: (json['deploymentEvents'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentEventDataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentEvents = this.deploymentEvents;
    final nextToken = this.nextToken;
    return {
      if (deploymentEvents != null) 'deploymentEvents': deploymentEvents,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDeploymentsOutput {
  /// Lists the deployments.
  final List<DeploymentDataSummary>? deployments;

  /// The token to include in another request to get the next page of items. This
  /// value is <code>null</code> when there are no more items to return.
  final String? nextToken;

  ListDeploymentsOutput({
    this.deployments,
    this.nextToken,
  });

  factory ListDeploymentsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeploymentsOutput(
      deployments: (json['deployments'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentDataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      if (deployments != null) 'deployments': deployments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// Information about the tags.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

class ListWorkloadDeploymentPatternsOutput {
  /// The token to include in another request to get the next page of items. This
  /// value is <code>null</code> when there are no more items to return.
  final String? nextToken;

  /// Describes the workload deployment patterns.
  final List<WorkloadDeploymentPatternDataSummary>? workloadDeploymentPatterns;

  ListWorkloadDeploymentPatternsOutput({
    this.nextToken,
    this.workloadDeploymentPatterns,
  });

  factory ListWorkloadDeploymentPatternsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListWorkloadDeploymentPatternsOutput(
      nextToken: json['nextToken'] as String?,
      workloadDeploymentPatterns: (json['workloadDeploymentPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => WorkloadDeploymentPatternDataSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloadDeploymentPatterns = this.workloadDeploymentPatterns;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workloadDeploymentPatterns != null)
        'workloadDeploymentPatterns': workloadDeploymentPatterns,
    };
  }
}

class ListWorkloadsOutput {
  /// The token to include in another request to get the next page of items. This
  /// value is <code>null</code> when there are no more items to return.
  final String? nextToken;

  /// Information about the workloads.
  final List<WorkloadDataSummary>? workloads;

  ListWorkloadsOutput({
    this.nextToken,
    this.workloads,
  });

  factory ListWorkloadsOutput.fromJson(Map<String, dynamic> json) {
    return ListWorkloadsOutput(
      nextToken: json['nextToken'] as String?,
      workloads: (json['workloads'] as List?)
          ?.whereNotNull()
          .map((e) => WorkloadDataSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloads = this.workloads;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workloads != null) 'workloads': workloads,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes a workload.
class WorkloadData {
  /// The description of a workload.
  final String? description;

  /// The display name of a workload.
  final String? displayName;

  /// The URL of a workload document.
  final String? documentationUrl;

  /// The URL of a workload icon.
  final String? iconUrl;

  /// The status of a workload.
  final WorkloadStatus? status;

  /// The message about a workload's status.
  final String? statusMessage;

  /// The name of the workload.
  final String? workloadName;

  WorkloadData({
    this.description,
    this.displayName,
    this.documentationUrl,
    this.iconUrl,
    this.status,
    this.statusMessage,
    this.workloadName,
  });

  factory WorkloadData.fromJson(Map<String, dynamic> json) {
    return WorkloadData(
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      documentationUrl: json['documentationUrl'] as String?,
      iconUrl: json['iconUrl'] as String?,
      status: (json['status'] as String?)?.toWorkloadStatus(),
      statusMessage: json['statusMessage'] as String?,
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final documentationUrl = this.documentationUrl;
    final iconUrl = this.iconUrl;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final workloadName = this.workloadName;
    return {
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (documentationUrl != null) 'documentationUrl': documentationUrl,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// Describes workload data.
class WorkloadDataSummary {
  /// The display name of the workload data.
  final String? displayName;

  /// The name of the workload.
  final String? workloadName;

  WorkloadDataSummary({
    this.displayName,
    this.workloadName,
  });

  factory WorkloadDataSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadDataSummary(
      displayName: json['displayName'] as String?,
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final workloadName = this.workloadName;
    return {
      if (displayName != null) 'displayName': displayName,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// The data that details a workload deployment pattern.
class WorkloadDeploymentPatternData {
  /// The name of the deployment pattern.
  final String? deploymentPatternName;

  /// The description of the deployment pattern.
  final String? description;

  /// The display name of the deployment pattern.
  final String? displayName;

  /// The settings specified for the deployment. These settings define how to
  /// deploy and configure your resources created by the deployment. For more
  /// information about the specifications required for creating a deployment for
  /// a SAP workload, see <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/launch-wizard-specifications-sap.html">SAP
  /// deployment specifications</a>. To retrieve the specifications required to
  /// create a deployment for other workloads, use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_GetWorkloadDeploymentPattern.html">
  /// <code>GetWorkloadDeploymentPattern</code> </a> operation.
  final List<DeploymentSpecificationsField>? specifications;

  /// The status of the deployment pattern.
  final WorkloadDeploymentPatternStatus? status;

  /// The status message of the deployment pattern.
  final String? statusMessage;

  /// The workload name of the deployment pattern.
  final String? workloadName;

  /// The workload version name of the deployment pattern.
  final String? workloadVersionName;

  WorkloadDeploymentPatternData({
    this.deploymentPatternName,
    this.description,
    this.displayName,
    this.specifications,
    this.status,
    this.statusMessage,
    this.workloadName,
    this.workloadVersionName,
  });

  factory WorkloadDeploymentPatternData.fromJson(Map<String, dynamic> json) {
    return WorkloadDeploymentPatternData(
      deploymentPatternName: json['deploymentPatternName'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      specifications: (json['specifications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentSpecificationsField.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toWorkloadDeploymentPatternStatus(),
      statusMessage: json['statusMessage'] as String?,
      workloadName: json['workloadName'] as String?,
      workloadVersionName: json['workloadVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternName = this.deploymentPatternName;
    final description = this.description;
    final displayName = this.displayName;
    final specifications = this.specifications;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final workloadName = this.workloadName;
    final workloadVersionName = this.workloadVersionName;
    return {
      if (deploymentPatternName != null)
        'deploymentPatternName': deploymentPatternName,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (specifications != null) 'specifications': specifications,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (workloadName != null) 'workloadName': workloadName,
      if (workloadVersionName != null)
        'workloadVersionName': workloadVersionName,
    };
  }
}

/// Describes a workload deployment pattern.
class WorkloadDeploymentPatternDataSummary {
  /// The name of a workload deployment pattern.
  final String? deploymentPatternName;

  /// The description of a workload deployment pattern.
  final String? description;

  /// The display name of a workload deployment pattern.
  final String? displayName;

  /// The status of a workload deployment pattern.
  final WorkloadDeploymentPatternStatus? status;

  /// A message about a workload deployment pattern's status.
  final String? statusMessage;

  /// The name of the workload.
  final String? workloadName;

  /// The name of the workload deployment pattern version.
  final String? workloadVersionName;

  WorkloadDeploymentPatternDataSummary({
    this.deploymentPatternName,
    this.description,
    this.displayName,
    this.status,
    this.statusMessage,
    this.workloadName,
    this.workloadVersionName,
  });

  factory WorkloadDeploymentPatternDataSummary.fromJson(
      Map<String, dynamic> json) {
    return WorkloadDeploymentPatternDataSummary(
      deploymentPatternName: json['deploymentPatternName'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      status: (json['status'] as String?)?.toWorkloadDeploymentPatternStatus(),
      statusMessage: json['statusMessage'] as String?,
      workloadName: json['workloadName'] as String?,
      workloadVersionName: json['workloadVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternName = this.deploymentPatternName;
    final description = this.description;
    final displayName = this.displayName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final workloadName = this.workloadName;
    final workloadVersionName = this.workloadVersionName;
    return {
      if (deploymentPatternName != null)
        'deploymentPatternName': deploymentPatternName,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (workloadName != null) 'workloadName': workloadName,
      if (workloadVersionName != null)
        'workloadVersionName': workloadVersionName,
    };
  }
}

enum WorkloadDeploymentPatternStatus {
  active,
  inactive,
  disabled,
  deleted,
}

extension WorkloadDeploymentPatternStatusValueExtension
    on WorkloadDeploymentPatternStatus {
  String toValue() {
    switch (this) {
      case WorkloadDeploymentPatternStatus.active:
        return 'ACTIVE';
      case WorkloadDeploymentPatternStatus.inactive:
        return 'INACTIVE';
      case WorkloadDeploymentPatternStatus.disabled:
        return 'DISABLED';
      case WorkloadDeploymentPatternStatus.deleted:
        return 'DELETED';
    }
  }
}

extension WorkloadDeploymentPatternStatusFromString on String {
  WorkloadDeploymentPatternStatus toWorkloadDeploymentPatternStatus() {
    switch (this) {
      case 'ACTIVE':
        return WorkloadDeploymentPatternStatus.active;
      case 'INACTIVE':
        return WorkloadDeploymentPatternStatus.inactive;
      case 'DISABLED':
        return WorkloadDeploymentPatternStatus.disabled;
      case 'DELETED':
        return WorkloadDeploymentPatternStatus.deleted;
    }
    throw Exception(
        '$this is not known in enum WorkloadDeploymentPatternStatus');
  }
}

enum WorkloadStatus {
  active,
  inactive,
  disabled,
  deleted,
}

extension WorkloadStatusValueExtension on WorkloadStatus {
  String toValue() {
    switch (this) {
      case WorkloadStatus.active:
        return 'ACTIVE';
      case WorkloadStatus.inactive:
        return 'INACTIVE';
      case WorkloadStatus.disabled:
        return 'DISABLED';
      case WorkloadStatus.deleted:
        return 'DELETED';
    }
  }
}

extension WorkloadStatusFromString on String {
  WorkloadStatus toWorkloadStatus() {
    switch (this) {
      case 'ACTIVE':
        return WorkloadStatus.active;
      case 'INACTIVE':
        return WorkloadStatus.inactive;
      case 'DISABLED':
        return WorkloadStatus.disabled;
      case 'DELETED':
        return WorkloadStatus.deleted;
    }
    throw Exception('$this is not known in enum WorkloadStatus');
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceLimitException extends _s.GenericAwsException {
  ResourceLimitException({String? type, String? message})
      : super(type: type, code: 'ResourceLimitException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceLimitException': (type, message) =>
      ResourceLimitException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
