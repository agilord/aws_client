// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

  /// Lists the tags associated with a specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Adds the specified tags to the given resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Creates a deployment for the given workload. Deployments created by this
  /// operation are not available in the Launch Wizard console to use the
  /// <code>Clone deployment</code> action on.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceLimitException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns information about the deployment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Updates a deployment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceLimitException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deploymentId] :
  /// The ID of the deployment.
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
  /// Parameter [deploymentPatternVersionName] :
  /// The name of the deployment pattern version.
  ///
  /// Parameter [dryRun] :
  /// Checks whether you have the required permissions for the action, without
  /// actually making the request, and provides an error response. If you have
  /// the required permissions, the error response is
  /// <code>DryRunOperation</code>. Otherwise, it is
  /// <code>UnauthorizedOperation</code>.
  ///
  /// Parameter [force] :
  /// Forces the update even if validation warnings are present.
  ///
  /// Parameter [workloadVersionName] :
  /// The name of the workload version.
  Future<UpdateDeploymentOutput> updateDeployment({
    required String deploymentId,
    required Map<String, String> specifications,
    String? deploymentPatternVersionName,
    bool? dryRun,
    bool? force,
    String? workloadVersionName,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentId': deploymentId,
      'specifications': specifications,
      if (deploymentPatternVersionName != null)
        'deploymentPatternVersionName': deploymentPatternVersionName,
      if (dryRun != null) 'dryRun': dryRun,
      if (force != null) 'force': force,
      if (workloadVersionName != null)
        'workloadVersionName': workloadVersionName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDeployment',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDeploymentOutput.fromJson(response);
  }

  /// Deletes a deployment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceLimitException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Lists the events of a deployment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns information about a workload.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns details for a given workload and deployment pattern, including the
  /// available specifications. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">ListWorkloads</a>
  /// operation to discover the available workload names and the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloadDeploymentPatterns.html">ListWorkloadDeploymentPatterns</a>
  /// operation to discover the available deployment pattern names of a given
  /// workload.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Lists the workload deployment patterns for a given workload name. You can
  /// use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">ListWorkloads</a>
  /// operation to discover the available workload names.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Returns information about a deployment pattern version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deploymentPatternName] :
  /// The name of the deployment pattern. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloadDeploymentPatterns.html">
  /// <code>ListWorkloadDeploymentPatterns</code> </a> operation to discover
  /// supported values for this parameter.
  ///
  /// Parameter [deploymentPatternVersionName] :
  /// The name of the deployment pattern version.
  ///
  /// Parameter [workloadName] :
  /// The name of the workload. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">
  /// <code>ListWorkloads</code> </a> operation to discover supported values for
  /// this parameter.
  Future<GetDeploymentPatternVersionOutput> getDeploymentPatternVersion({
    required String deploymentPatternName,
    required String deploymentPatternVersionName,
    required String workloadName,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentPatternName': deploymentPatternName,
      'deploymentPatternVersionName': deploymentPatternVersionName,
      'workloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getDeploymentPatternVersion',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentPatternVersionOutput.fromJson(response);
  }

  /// Lists the deployment pattern versions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deploymentPatternName] :
  /// The name of the deployment pattern. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloadDeploymentPatterns.html">
  /// <code>ListWorkloadDeploymentPatterns</code> </a> operation to discover
  /// supported values for this parameter.
  ///
  /// Parameter [workloadName] :
  /// The name of the workload. You can use the <a
  /// href="https://docs.aws.amazon.com/launchwizard/latest/APIReference/API_ListWorkloads.html">
  /// <code>ListWorkloads</code> </a> operation to discover supported values for
  /// this parameter.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing deployment pattern versions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of deployment pattern versions to list.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDeploymentPatternVersionsOutput> listDeploymentPatternVersions({
    required String deploymentPatternName,
    required String workloadName,
    List<DeploymentPatternVersionFilter>? filters,
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
      'deploymentPatternName': deploymentPatternName,
      'workloadName': workloadName,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listDeploymentPatternVersions',
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentPatternVersionsOutput.fromJson(response);
  }
}

/// @nodoc
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

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class UpdateDeploymentOutput {
  /// The deployment.
  final DeploymentDataSummary? deployment;

  UpdateDeploymentOutput({
    this.deployment,
  });

  factory UpdateDeploymentOutput.fromJson(Map<String, dynamic> json) {
    return UpdateDeploymentOutput(
      deployment: json['deployment'] != null
          ? DeploymentDataSummary.fromJson(
              json['deployment'] as Map<String, dynamic>)
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

/// @nodoc
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
      status: (json['status'] as String?)?.let(DeploymentStatus.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class GetDeploymentPatternVersionOutput {
  /// The deployment pattern version.
  final DeploymentPatternVersionDataSummary? deploymentPatternVersion;

  GetDeploymentPatternVersionOutput({
    this.deploymentPatternVersion,
  });

  factory GetDeploymentPatternVersionOutput.fromJson(
      Map<String, dynamic> json) {
    return GetDeploymentPatternVersionOutput(
      deploymentPatternVersion: json['deploymentPatternVersion'] != null
          ? DeploymentPatternVersionDataSummary.fromJson(
              json['deploymentPatternVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternVersion = this.deploymentPatternVersion;
    return {
      if (deploymentPatternVersion != null)
        'deploymentPatternVersion': deploymentPatternVersion,
    };
  }
}

/// @nodoc
class ListDeploymentPatternVersionsOutput {
  /// The deployment pattern versions.
  final List<DeploymentPatternVersionDataSummary>? deploymentPatternVersions;

  /// The token for the next set of results.
  final String? nextToken;

  ListDeploymentPatternVersionsOutput({
    this.deploymentPatternVersions,
    this.nextToken,
  });

  factory ListDeploymentPatternVersionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListDeploymentPatternVersionsOutput(
      deploymentPatternVersions: (json['deploymentPatternVersions'] as List?)
          ?.nonNulls
          .map((e) => DeploymentPatternVersionDataSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternVersions = this.deploymentPatternVersions;
    final nextToken = this.nextToken;
    return {
      if (deploymentPatternVersions != null)
        'deploymentPatternVersions': deploymentPatternVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Describes a deployment pattern version summary.
///
/// @nodoc
class DeploymentPatternVersionDataSummary {
  /// The name of the deployment pattern.
  final String? deploymentPatternName;

  /// The name of the deployment pattern version.
  final String? deploymentPatternVersionName;

  /// The description of the deployment pattern version.
  final String? description;

  /// The URL of the documentation for the deployment pattern version.
  final String? documentationUrl;

  /// The name of the workload.
  final String? workloadName;

  DeploymentPatternVersionDataSummary({
    this.deploymentPatternName,
    this.deploymentPatternVersionName,
    this.description,
    this.documentationUrl,
    this.workloadName,
  });

  factory DeploymentPatternVersionDataSummary.fromJson(
      Map<String, dynamic> json) {
    return DeploymentPatternVersionDataSummary(
      deploymentPatternName: json['deploymentPatternName'] as String?,
      deploymentPatternVersionName:
          json['deploymentPatternVersionName'] as String?,
      description: json['description'] as String?,
      documentationUrl: json['documentationUrl'] as String?,
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternName = this.deploymentPatternName;
    final deploymentPatternVersionName = this.deploymentPatternVersionName;
    final description = this.description;
    final documentationUrl = this.documentationUrl;
    final workloadName = this.workloadName;
    return {
      if (deploymentPatternName != null)
        'deploymentPatternName': deploymentPatternName,
      if (deploymentPatternVersionName != null)
        'deploymentPatternVersionName': deploymentPatternVersionName,
      if (description != null) 'description': description,
      if (documentationUrl != null) 'documentationUrl': documentationUrl,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// A filter for deployment pattern versions. Use this filter to specify
/// criteria for querying deployment pattern versions in Launch Wizard.
///
/// @nodoc
class DeploymentPatternVersionFilter {
  /// The name of the filter attribute. Specifies which attribute to filter on
  /// when querying deployment pattern versions.
  final DeploymentPatternVersionFilterKey name;

  /// The values to filter by. Contains the specific values to match against when
  /// filtering deployment pattern versions.
  final List<String> values;

  DeploymentPatternVersionFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

/// @nodoc
class DeploymentPatternVersionFilterKey {
  static const updateFromVersion =
      DeploymentPatternVersionFilterKey._('updateFromVersion');

  final String value;

  const DeploymentPatternVersionFilterKey._(this.value);

  static const values = [updateFromVersion];

  static DeploymentPatternVersionFilterKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeploymentPatternVersionFilterKey._(value));

  @override
  bool operator ==(other) =>
      other is DeploymentPatternVersionFilterKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a workload deployment pattern.
///
/// @nodoc
class WorkloadDeploymentPatternDataSummary {
  /// The name of a workload deployment pattern.
  final String? deploymentPatternName;

  /// The version name of a workload deployment pattern.
  final String? deploymentPatternVersionName;

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
    this.deploymentPatternVersionName,
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
      deploymentPatternVersionName:
          json['deploymentPatternVersionName'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      status: (json['status'] as String?)
          ?.let(WorkloadDeploymentPatternStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      workloadName: json['workloadName'] as String?,
      workloadVersionName: json['workloadVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternName = this.deploymentPatternName;
    final deploymentPatternVersionName = this.deploymentPatternVersionName;
    final description = this.description;
    final displayName = this.displayName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final workloadName = this.workloadName;
    final workloadVersionName = this.workloadVersionName;
    return {
      if (deploymentPatternName != null)
        'deploymentPatternName': deploymentPatternName,
      if (deploymentPatternVersionName != null)
        'deploymentPatternVersionName': deploymentPatternVersionName,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (workloadName != null) 'workloadName': workloadName,
      if (workloadVersionName != null)
        'workloadVersionName': workloadVersionName,
    };
  }
}

/// @nodoc
class WorkloadDeploymentPatternStatus {
  static const active = WorkloadDeploymentPatternStatus._('ACTIVE');
  static const inactive = WorkloadDeploymentPatternStatus._('INACTIVE');
  static const disabled = WorkloadDeploymentPatternStatus._('DISABLED');
  static const deleted = WorkloadDeploymentPatternStatus._('DELETED');

  final String value;

  const WorkloadDeploymentPatternStatus._(this.value);

  static const values = [active, inactive, disabled, deleted];

  static WorkloadDeploymentPatternStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadDeploymentPatternStatus._(value));

  @override
  bool operator ==(other) =>
      other is WorkloadDeploymentPatternStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data that details a workload deployment pattern.
///
/// @nodoc
class WorkloadDeploymentPatternData {
  /// The name of the deployment pattern.
  final String? deploymentPatternName;

  /// The version name of the deployment pattern.
  final String? deploymentPatternVersionName;

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
    this.deploymentPatternVersionName,
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
      deploymentPatternVersionName:
          json['deploymentPatternVersionName'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      specifications: (json['specifications'] as List?)
          ?.nonNulls
          .map((e) =>
              DeploymentSpecificationsField.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)
          ?.let(WorkloadDeploymentPatternStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      workloadName: json['workloadName'] as String?,
      workloadVersionName: json['workloadVersionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentPatternName = this.deploymentPatternName;
    final deploymentPatternVersionName = this.deploymentPatternVersionName;
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
      if (deploymentPatternVersionName != null)
        'deploymentPatternVersionName': deploymentPatternVersionName,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (specifications != null) 'specifications': specifications,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (workloadName != null) 'workloadName': workloadName,
      if (workloadVersionName != null)
        'workloadVersionName': workloadVersionName,
    };
  }
}

/// A field that details a specification of a deployment pattern.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      conditionals: (json['conditionals'] as List?)
          ?.nonNulls
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

/// A field that details a condition of the specifications for a deployment.
///
/// @nodoc
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

/// Describes workload data.
///
/// @nodoc
class WorkloadDataSummary {
  /// The display name of the workload data.
  final String? displayName;

  /// The status of the workload.
  final WorkloadStatus? status;

  /// The name of the workload.
  final String? workloadName;

  WorkloadDataSummary({
    this.displayName,
    this.status,
    this.workloadName,
  });

  factory WorkloadDataSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadDataSummary(
      displayName: json['displayName'] as String?,
      status: (json['status'] as String?)?.let(WorkloadStatus.fromString),
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final status = this.status;
    final workloadName = this.workloadName;
    return {
      if (displayName != null) 'displayName': displayName,
      if (status != null) 'status': status.value,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// @nodoc
class WorkloadStatus {
  static const active = WorkloadStatus._('ACTIVE');
  static const inactive = WorkloadStatus._('INACTIVE');
  static const disabled = WorkloadStatus._('DISABLED');
  static const deleted = WorkloadStatus._('DELETED');

  final String value;

  const WorkloadStatus._(this.value);

  static const values = [active, inactive, disabled, deleted];

  static WorkloadStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadStatus._(value));

  @override
  bool operator ==(other) => other is WorkloadStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a workload.
///
/// @nodoc
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
  ///
  /// <i>You can list deployments in the <code>DISABLED</code> status.</i>
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
      status: (json['status'] as String?)?.let(WorkloadStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// A summary of the deployment event data.
///
/// @nodoc
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
      status: (json['status'] as String?)?.let(EventStatus.fromString),
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
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// @nodoc
class EventStatus {
  static const canceled = EventStatus._('CANCELED');
  static const canceling = EventStatus._('CANCELING');
  static const completed = EventStatus._('COMPLETED');
  static const created = EventStatus._('CREATED');
  static const failed = EventStatus._('FAILED');
  static const inProgress = EventStatus._('IN_PROGRESS');
  static const pending = EventStatus._('PENDING');
  static const timedOut = EventStatus._('TIMED_OUT');

  final String value;

  const EventStatus._(this.value);

  static const values = [
    canceled,
    canceling,
    completed,
    created,
    failed,
    inProgress,
    pending,
    timedOut
  ];

  static EventStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventStatus._(value));

  @override
  bool operator ==(other) => other is EventStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of the deployment data.
///
/// @nodoc
class DeploymentDataSummary {
  /// The time the deployment was created.
  final DateTime? createdAt;

  /// The ID of the deployment.
  final String? id;

  /// The time the deployment was last modified.
  final DateTime? modifiedAt;

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
    this.modifiedAt,
    this.name,
    this.patternName,
    this.status,
    this.workloadName,
  });

  factory DeploymentDataSummary.fromJson(Map<String, dynamic> json) {
    return DeploymentDataSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      name: json['name'] as String?,
      patternName: json['patternName'] as String?,
      status: (json['status'] as String?)?.let(DeploymentStatus.fromString),
      workloadName: json['workloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final patternName = this.patternName;
    final status = this.status;
    final workloadName = this.workloadName;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (id != null) 'id': id,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (name != null) 'name': name,
      if (patternName != null) 'patternName': patternName,
      if (status != null) 'status': status.value,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// @nodoc
class DeploymentStatus {
  static const completed = DeploymentStatus._('COMPLETED');
  static const creating = DeploymentStatus._('CREATING');
  static const deleteInProgress = DeploymentStatus._('DELETE_IN_PROGRESS');
  static const deleteInitiating = DeploymentStatus._('DELETE_INITIATING');
  static const deleteFailed = DeploymentStatus._('DELETE_FAILED');
  static const deleted = DeploymentStatus._('DELETED');
  static const failed = DeploymentStatus._('FAILED');
  static const inProgress = DeploymentStatus._('IN_PROGRESS');
  static const validating = DeploymentStatus._('VALIDATING');
  static const updateInProgress = DeploymentStatus._('UPDATE_IN_PROGRESS');
  static const updateCompleted = DeploymentStatus._('UPDATE_COMPLETED');
  static const updateFailed = DeploymentStatus._('UPDATE_FAILED');
  static const updateRollbackCompleted =
      DeploymentStatus._('UPDATE_ROLLBACK_COMPLETED');
  static const updateRollbackFailed =
      DeploymentStatus._('UPDATE_ROLLBACK_FAILED');

  final String value;

  const DeploymentStatus._(this.value);

  static const values = [
    completed,
    creating,
    deleteInProgress,
    deleteInitiating,
    deleteFailed,
    deleted,
    failed,
    inProgress,
    validating,
    updateInProgress,
    updateCompleted,
    updateFailed,
    updateRollbackCompleted,
    updateRollbackFailed
  ];

  static DeploymentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeploymentStatus._(value));

  @override
  bool operator ==(other) => other is DeploymentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter name and value pair that is used to return more specific results
/// from a describe operation. Filters can be used to match a set of resources
/// by specific criteria.
///
/// @nodoc
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
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class DeploymentFilterKey {
  static const workloadName = DeploymentFilterKey._('WORKLOAD_NAME');
  static const deploymentStatus = DeploymentFilterKey._('DEPLOYMENT_STATUS');

  final String value;

  const DeploymentFilterKey._(this.value);

  static const values = [workloadName, deploymentStatus];

  static DeploymentFilterKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeploymentFilterKey._(value));

  @override
  bool operator ==(other) =>
      other is DeploymentFilterKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data associated with a deployment.
///
/// @nodoc
class DeploymentData {
  /// The time the deployment was created.
  final DateTime? createdAt;

  /// The time the deployment was deleted.
  final DateTime? deletedAt;

  /// The Amazon Resource Name (ARN) of the deployment.
  final String? deploymentArn;

  /// The ID of the deployment.
  final String? id;

  /// The time the deployment was last modified.
  final DateTime? modifiedAt;

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
    this.modifiedAt,
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
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      name: json['name'] as String?,
      patternName: json['patternName'] as String?,
      resourceGroup: json['resourceGroup'] as String?,
      specifications: (json['specifications'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.let(DeploymentStatus.fromString),
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
    final modifiedAt = this.modifiedAt;
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
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (name != null) 'name': name,
      if (patternName != null) 'patternName': patternName,
      if (resourceGroup != null) 'resourceGroup': resourceGroup,
      if (specifications != null) 'specifications': specifications,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (workloadName != null) 'workloadName': workloadName,
    };
  }
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceLimitException extends _s.GenericAwsException {
  ResourceLimitException({String? type, String? message})
      : super(type: type, code: 'ResourceLimitException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
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
