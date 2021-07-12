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

/// Amazon EMR on EKS provides a deployment option for Amazon EMR that allows
/// you to run open-source big data frameworks on Amazon Elastic Kubernetes
/// Service (Amazon EKS). With this deployment option, you can focus on running
/// analytics workloads while Amazon EMR on EKS builds, configures, and manages
/// containers for open-source applications. For more information about Amazon
/// EMR on EKS concepts and tasks, see <a
/// href="https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/emr-eks.html">What
/// is Amazon EMR on EKS</a>.
///
/// <i>Amazon EMR containers</i> is the API name for Amazon EMR on EKS. The
/// <code>emr-containers</code> prefix is used in the following scenarios:
///
/// <ul>
/// <li>
/// It is the prefix in the CLI commands for Amazon EMR on EKS. For example,
/// <code>aws emr-containers start-job-run</code>.
/// </li>
/// <li>
/// It is the prefix before IAM policy actions for Amazon EMR on EKS. For
/// example, <code>"Action": [ "emr-containers:StartJobRun"]</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-actions">Policy
/// actions for Amazon EMR on EKS</a>.
/// </li>
/// <li>
/// It is the prefix used in Amazon EMR on EKS service endpoints. For example,
/// <code>emr-containers.us-east-2.amazonaws.com</code>. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/emr/latest/EMR-on-EKS-DevelopmentGuide/service-quotas.html#service-endpoints">Amazon
/// EMR on EKS Service Endpoints</a>.
/// </li>
/// </ul>
class EmrContainers {
  final _s.RestJsonProtocol _protocol;
  EmrContainers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'emr-containers',
            signingName: 'emr-containers',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels a job run. A job run is a unit of work, such as a Spark jar,
  /// PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the job run to cancel.
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the virtual cluster for which the job run will be canceled.
  Future<CancelJobRunResponse> cancelJobRun({
    required String id,
    required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/jobruns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobRunResponse.fromJson(response);
  }

  /// Creates a managed endpoint. A managed endpoint is a gateway that connects
  /// EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with
  /// your virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [certificateArn] :
  /// The certificate ARN of the managed endpoint.
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the execution role.
  ///
  /// Parameter [name] :
  /// The name of the managed endpoint.
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release version.
  ///
  /// Parameter [type] :
  /// The type of the managed endpoint.
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the virtual cluster for which a managed endpoint is created.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token for this create call.
  ///
  /// Parameter [configurationOverrides] :
  /// The configuration settings that will be used to override existing
  /// configurations.
  ///
  /// Parameter [tags] :
  /// The tags of the managed endpoint.
  Future<CreateManagedEndpointResponse> createManagedEndpoint({
    required String certificateArn,
    required String executionRoleArn,
    required String name,
    required String releaseLabel,
    required String type,
    required String virtualClusterId,
    String? clientToken,
    ConfigurationOverrides? configurationOverrides,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      44,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(releaseLabel, 'releaseLabel');
    _s.validateStringLength(
      'releaseLabel',
      releaseLabel,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'type',
      type,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'certificateArn': certificateArn,
      'executionRoleArn': executionRoleArn,
      'name': name,
      'releaseLabel': releaseLabel,
      'type': type,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/endpoints',
      exceptionFnMap: _exceptionFns,
    );
    return CreateManagedEndpointResponse.fromJson(response);
  }

  /// Creates a virtual cluster. Virtual cluster is a managed entity on Amazon
  /// EMR on EKS. You can create, describe, list and delete virtual clusters.
  /// They do not consume any additional resource in your system. A single
  /// virtual cluster maps to a single Kubernetes namespace. Given this
  /// relationship, you can model virtual clusters the same way you model
  /// Kubernetes namespaces to meet your requirements.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [containerProvider] :
  /// The container provider of the virtual cluster.
  ///
  /// Parameter [name] :
  /// The specified name of the virtual cluster.
  ///
  /// Parameter [clientToken] :
  /// The client token of the virtual cluster.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the virtual cluster.
  Future<CreateVirtualClusterResponse> createVirtualCluster({
    required ContainerProvider containerProvider,
    required String name,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(containerProvider, 'containerProvider');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'containerProvider': containerProvider,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/virtualclusters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVirtualClusterResponse.fromJson(response);
  }

  /// Deletes a managed endpoint. A managed endpoint is a gateway that connects
  /// EMR Studio to Amazon EMR on EKS so that EMR Studio can communicate with
  /// your virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the managed endpoint.
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the endpoint's virtual cluster.
  Future<DeleteManagedEndpointResponse> deleteManagedEndpoint({
    required String id,
    required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteManagedEndpointResponse.fromJson(response);
  }

  /// Deletes a virtual cluster. Virtual cluster is a managed entity on Amazon
  /// EMR on EKS. You can create, describe, list and delete virtual clusters.
  /// They do not consume any additional resource in your system. A single
  /// virtual cluster maps to a single Kubernetes namespace. Given this
  /// relationship, you can model virtual clusters the same way you model
  /// Kubernetes namespaces to meet your requirements.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the virtual cluster that will be deleted.
  Future<DeleteVirtualClusterResponse> deleteVirtualCluster({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/virtualclusters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVirtualClusterResponse.fromJson(response);
  }

  /// Displays detailed information about a job run. A job run is a unit of
  /// work, such as a Spark jar, PySpark script, or SparkSQL query, that you
  /// submit to Amazon EMR on EKS.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the job run request.
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the virtual cluster for which the job run is submitted.
  Future<DescribeJobRunResponse> describeJobRun({
    required String id,
    required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/jobruns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobRunResponse.fromJson(response);
  }

  /// Displays detailed information about a managed endpoint. A managed endpoint
  /// is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR
  /// Studio can communicate with your virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// This output displays ID of the managed endpoint.
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the endpoint's virtual cluster.
  Future<DescribeManagedEndpointResponse> describeManagedEndpoint({
    required String id,
    required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeManagedEndpointResponse.fromJson(response);
  }

  /// Displays detailed information about a specified virtual cluster. Virtual
  /// cluster is a managed entity on Amazon EMR on EKS. You can create,
  /// describe, list and delete virtual clusters. They do not consume any
  /// additional resource in your system. A single virtual cluster maps to a
  /// single Kubernetes namespace. Given this relationship, you can model
  /// virtual clusters the same way you model Kubernetes namespaces to meet your
  /// requirements.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the virtual cluster that will be described.
  Future<DescribeVirtualClusterResponse> describeVirtualCluster({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/virtualclusters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVirtualClusterResponse.fromJson(response);
  }

  /// Lists job runs based on a set of parameters. A job run is a unit of work,
  /// such as a Spark jar, PySpark script, or SparkSQL query, that you submit to
  /// Amazon EMR on EKS.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the virtual cluster for which to list the job run.
  ///
  /// Parameter [createdAfter] :
  /// The date and time after which the job runs were submitted.
  ///
  /// Parameter [createdBefore] :
  /// The date and time before which the job runs were submitted.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of job runs that can be listed.
  ///
  /// Parameter [name] :
  /// The name of the job run.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of job runs to return.
  ///
  /// Parameter [states] :
  /// The states of the job run.
  Future<ListJobRunsResponse> listJobRuns({
    required String virtualClusterId,
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? name,
    String? nextToken,
    List<JobRunState>? states,
  }) async {
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/jobruns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobRunsResponse.fromJson(response);
  }

  /// Lists managed endpoints based on a set of parameters. A managed endpoint
  /// is a gateway that connects EMR Studio to Amazon EMR on EKS so that EMR
  /// Studio can communicate with your virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [virtualClusterId] :
  /// The ID of the virtual cluster.
  ///
  /// Parameter [createdAfter] :
  /// The date and time after which the endpoints are created.
  ///
  /// Parameter [createdBefore] :
  /// The date and time before which the endpoints are created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of managed endpoints that can be listed.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of managed endpoints to return.
  ///
  /// Parameter [states] :
  /// The states of the managed endpoints.
  ///
  /// Parameter [types] :
  /// The types of the managed endpoints.
  Future<ListManagedEndpointsResponse> listManagedEndpoints({
    required String virtualClusterId,
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? nextToken,
    List<EndpointState>? states,
    List<String>? types,
  }) async {
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
      if (types != null) 'types': types,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedEndpointsResponse.fromJson(response);
  }

  /// Lists the tags assigned to the resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of tagged resources.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      60,
      500,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists information about the specified virtual cluster. Virtual cluster is
  /// a managed entity on Amazon EMR on EKS. You can create, describe, list and
  /// delete virtual clusters. They do not consume any additional resource in
  /// your system. A single virtual cluster maps to a single Kubernetes
  /// namespace. Given this relationship, you can model virtual clusters the
  /// same way you model Kubernetes namespaces to meet your requirements.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [containerProviderId] :
  /// The container provider ID of the virtual cluster.
  ///
  /// Parameter [containerProviderType] :
  /// The container provider type of the virtual cluster. EKS is the only
  /// supported type as of now.
  ///
  /// Parameter [createdAfter] :
  /// The date and time after which the virtual clusters are created.
  ///
  /// Parameter [createdBefore] :
  /// The date and time before which the virtual clusters are created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of virtual clusters that can be listed.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of virtual clusters to return.
  ///
  /// Parameter [states] :
  /// The states of the requested virtual clusters.
  Future<ListVirtualClustersResponse> listVirtualClusters({
    String? containerProviderId,
    ContainerProviderType? containerProviderType,
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? nextToken,
    List<VirtualClusterState>? states,
  }) async {
    _s.validateStringLength(
      'containerProviderId',
      containerProviderId,
      1,
      1024,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (containerProviderId != null)
        'containerProviderId': [containerProviderId],
      if (containerProviderType != null)
        'containerProviderType': [containerProviderType.toValue()],
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/virtualclusters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualClustersResponse.fromJson(response);
  }

  /// Starts a job run. A job run is a unit of work, such as a Spark jar,
  /// PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [executionRoleArn] :
  /// The execution role ARN for the job run.
  ///
  /// Parameter [jobDriver] :
  /// The job driver for the job run.
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release version to use for the job run.
  ///
  /// Parameter [virtualClusterId] :
  /// The virtual cluster ID for which the job run request is submitted.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token of the job run request.
  ///
  /// Parameter [configurationOverrides] :
  /// The configuration overrides for the job run.
  ///
  /// Parameter [name] :
  /// The name of the job run.
  ///
  /// Parameter [tags] :
  /// The tags assigned to job runs.
  Future<StartJobRunResponse> startJobRun({
    required String executionRoleArn,
    required JobDriver jobDriver,
    required String releaseLabel,
    required String virtualClusterId,
    String? clientToken,
    ConfigurationOverrides? configurationOverrides,
    String? name,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobDriver, 'jobDriver');
    ArgumentError.checkNotNull(releaseLabel, 'releaseLabel');
    _s.validateStringLength(
      'releaseLabel',
      releaseLabel,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'executionRoleArn': executionRoleArn,
      'jobDriver': jobDriver,
      'releaseLabel': releaseLabel,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/jobruns',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobRunResponse.fromJson(response);
  }

  /// Assigns tags to resources. A tag is a label that you assign to an AWS
  /// resource. Each tag consists of a key and an optional value, both of which
  /// you define. Tags enable you to categorize your AWS resources by attributes
  /// such as purpose, owner, or environment. When you have many resources of
  /// the same type, you can quickly identify a specific resource based on the
  /// tags you've assigned to it. For example, you can define a set of tags for
  /// your Amazon EMR on EKS clusters to help you track each cluster's owner and
  /// stack level. We recommend that you devise a consistent set of tag keys for
  /// each resource type. You can then search and filter the resources based on
  /// the tags that you add.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of resources.
  ///
  /// Parameter [tags] :
  /// The tags assigned to resources.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      60,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Removes tags from resources.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of resources.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the resources.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      60,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

class CancelJobRunResponse {
  /// The output contains the ID of the cancelled job run.
  final String? id;

  /// The output contains the virtual cluster ID for which the job run is
  /// cancelled.
  final String? virtualClusterId;

  CancelJobRunResponse({
    this.id,
    this.virtualClusterId,
  });

  factory CancelJobRunResponse.fromJson(Map<String, dynamic> json) {
    return CancelJobRunResponse(
      id: json['id'] as String?,
      virtualClusterId: json['virtualClusterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (id != null) 'id': id,
      if (virtualClusterId != null) 'virtualClusterId': virtualClusterId,
    };
  }
}

/// A configuration for CloudWatch monitoring. You can configure your jobs to
/// send log information to CloudWatch Logs.
class CloudWatchMonitoringConfiguration {
  /// The name of the log group for log publishing.
  final String logGroupName;

  /// The specified name prefix for log streams.
  final String? logStreamNamePrefix;

  CloudWatchMonitoringConfiguration({
    required this.logGroupName,
    this.logStreamNamePrefix,
  });

  factory CloudWatchMonitoringConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CloudWatchMonitoringConfiguration(
      logGroupName: json['logGroupName'] as String,
      logStreamNamePrefix: json['logStreamNamePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final logStreamNamePrefix = this.logStreamNamePrefix;
    return {
      'logGroupName': logGroupName,
      if (logStreamNamePrefix != null)
        'logStreamNamePrefix': logStreamNamePrefix,
    };
  }
}

/// A configuration specification to be used when provisioning virtual clusters,
/// which can include configurations for applications and software bundled with
/// Amazon EMR on EKS. A configuration consists of a classification, properties,
/// and optional nested configurations. A classification refers to an
/// application-specific configuration file. Properties are the settings you
/// want to change in that file.
class Configuration {
  /// The classification within a configuration.
  final String classification;

  /// A list of additional configurations to apply within a configuration object.
  final List<Configuration>? configurations;

  /// A set of properties specified within a configuration classification.
  final Map<String, String>? properties;

  Configuration({
    required this.classification,
    this.configurations,
    this.properties,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      classification: json['classification'] as String,
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final configurations = this.configurations;
    final properties = this.properties;
    return {
      'classification': classification,
      if (configurations != null) 'configurations': configurations,
      if (properties != null) 'properties': properties,
    };
  }
}

/// A configuration specification to be used to override existing
/// configurations.
class ConfigurationOverrides {
  /// The configurations for the application running by the job run.
  final List<Configuration>? applicationConfiguration;

  /// The configurations for monitoring.
  final MonitoringConfiguration? monitoringConfiguration;

  ConfigurationOverrides({
    this.applicationConfiguration,
    this.monitoringConfiguration,
  });

  factory ConfigurationOverrides.fromJson(Map<String, dynamic> json) {
    return ConfigurationOverrides(
      applicationConfiguration: (json['applicationConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      monitoringConfiguration: json['monitoringConfiguration'] != null
          ? MonitoringConfiguration.fromJson(
              json['monitoringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationConfiguration = this.applicationConfiguration;
    final monitoringConfiguration = this.monitoringConfiguration;
    return {
      if (applicationConfiguration != null)
        'applicationConfiguration': applicationConfiguration,
      if (monitoringConfiguration != null)
        'monitoringConfiguration': monitoringConfiguration,
    };
  }
}

/// The information about the container used for a job run or a managed
/// endpoint.
class ContainerInfo {
  /// The information about the EKS cluster.
  final EksInfo? eksInfo;

  ContainerInfo({
    this.eksInfo,
  });

  factory ContainerInfo.fromJson(Map<String, dynamic> json) {
    return ContainerInfo(
      eksInfo: json['eksInfo'] != null
          ? EksInfo.fromJson(json['eksInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eksInfo = this.eksInfo;
    return {
      if (eksInfo != null) 'eksInfo': eksInfo,
    };
  }
}

/// The information about the container provider.
class ContainerProvider {
  /// The ID of the container cluster.
  final String id;

  /// The type of the container provider. EKS is the only supported type as of
  /// now.
  final ContainerProviderType type;

  /// The information about the container cluster.
  final ContainerInfo? info;

  ContainerProvider({
    required this.id,
    required this.type,
    this.info,
  });

  factory ContainerProvider.fromJson(Map<String, dynamic> json) {
    return ContainerProvider(
      id: json['id'] as String,
      type: (json['type'] as String).toContainerProviderType(),
      info: json['info'] != null
          ? ContainerInfo.fromJson(json['info'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    final info = this.info;
    return {
      'id': id,
      'type': type.toValue(),
      if (info != null) 'info': info,
    };
  }
}

enum ContainerProviderType {
  eks,
}

extension on ContainerProviderType {
  String toValue() {
    switch (this) {
      case ContainerProviderType.eks:
        return 'EKS';
    }
  }
}

extension on String {
  ContainerProviderType toContainerProviderType() {
    switch (this) {
      case 'EKS':
        return ContainerProviderType.eks;
    }
    throw Exception('$this is not known in enum ContainerProviderType');
  }
}

class CreateManagedEndpointResponse {
  /// The output contains the ARN of the managed endpoint.
  final String? arn;

  /// The output contains the ID of the managed endpoint.
  final String? id;

  /// The output contains the name of the managed endpoint.
  final String? name;

  /// The output contains the ID of the virtual cluster.
  final String? virtualClusterId;

  CreateManagedEndpointResponse({
    this.arn,
    this.id,
    this.name,
    this.virtualClusterId,
  });

  factory CreateManagedEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateManagedEndpointResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      virtualClusterId: json['virtualClusterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (virtualClusterId != null) 'virtualClusterId': virtualClusterId,
    };
  }
}

class CreateVirtualClusterResponse {
  /// This output contains the ARN of virtual cluster.
  final String? arn;

  /// This output contains the virtual cluster ID.
  final String? id;

  /// This output contains the name of the virtual cluster.
  final String? name;

  CreateVirtualClusterResponse({
    this.arn,
    this.id,
    this.name,
  });

  factory CreateVirtualClusterResponse.fromJson(Map<String, dynamic> json) {
    return CreateVirtualClusterResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

class DeleteManagedEndpointResponse {
  /// The output displays the ID of the managed endpoint.
  final String? id;

  /// The output displays the ID of the endpoint's virtual cluster.
  final String? virtualClusterId;

  DeleteManagedEndpointResponse({
    this.id,
    this.virtualClusterId,
  });

  factory DeleteManagedEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DeleteManagedEndpointResponse(
      id: json['id'] as String?,
      virtualClusterId: json['virtualClusterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (id != null) 'id': id,
      if (virtualClusterId != null) 'virtualClusterId': virtualClusterId,
    };
  }
}

class DeleteVirtualClusterResponse {
  /// This output contains the ID of the virtual cluster that will be deleted.
  final String? id;

  DeleteVirtualClusterResponse({
    this.id,
  });

  factory DeleteVirtualClusterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVirtualClusterResponse(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

class DescribeJobRunResponse {
  /// The output displays information about a job run.
  final JobRun? jobRun;

  DescribeJobRunResponse({
    this.jobRun,
  });

  factory DescribeJobRunResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobRunResponse(
      jobRun: json['jobRun'] != null
          ? JobRun.fromJson(json['jobRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRun = this.jobRun;
    return {
      if (jobRun != null) 'jobRun': jobRun,
    };
  }
}

class DescribeManagedEndpointResponse {
  /// This output displays information about a managed endpoint.
  final Endpoint? endpoint;

  DescribeManagedEndpointResponse({
    this.endpoint,
  });

  factory DescribeManagedEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DescribeManagedEndpointResponse(
      endpoint: json['endpoint'] != null
          ? Endpoint.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class DescribeVirtualClusterResponse {
  /// This output displays information about the specified virtual cluster.
  final VirtualCluster? virtualCluster;

  DescribeVirtualClusterResponse({
    this.virtualCluster,
  });

  factory DescribeVirtualClusterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVirtualClusterResponse(
      virtualCluster: json['virtualCluster'] != null
          ? VirtualCluster.fromJson(
              json['virtualCluster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualCluster = this.virtualCluster;
    return {
      if (virtualCluster != null) 'virtualCluster': virtualCluster,
    };
  }
}

/// The information about the EKS cluster.
class EksInfo {
  /// The namespaces of the EKS cluster.
  final String? namespace;

  EksInfo({
    this.namespace,
  });

  factory EksInfo.fromJson(Map<String, dynamic> json) {
    return EksInfo(
      namespace: json['namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      if (namespace != null) 'namespace': namespace,
    };
  }
}

/// This entity represents the endpoint that is managed by Amazon EMR on EKS.
class Endpoint {
  /// The ARN of the endpoint.
  final String? arn;

  /// The certificate ARN of the endpoint.
  final String? certificateArn;

  /// The configuration settings that are used to override existing configurations
  /// for endpoints.
  final ConfigurationOverrides? configurationOverrides;

  /// The date and time when the endpoint was created.
  final DateTime? createdAt;

  /// The execution role ARN of the endpoint.
  final String? executionRoleArn;

  /// The ID of the endpoint.
  final String? id;

  /// The name of the endpoint.
  final String? name;

  /// The EMR release version to be used for the endpoint.
  final String? releaseLabel;

  /// The security group configuration of the endpoint.
  final String? securityGroup;

  /// The server URL of the endpoint.
  final String? serverUrl;

  /// The state of the endpoint.
  final EndpointState? state;

  /// The subnet IDs of the endpoint.
  final List<String>? subnetIds;

  /// The tags of the endpoint.
  final Map<String, String>? tags;

  /// The type of the endpoint.
  final String? type;

  /// The ID of the endpoint's virtual cluster.
  final String? virtualClusterId;

  Endpoint({
    this.arn,
    this.certificateArn,
    this.configurationOverrides,
    this.createdAt,
    this.executionRoleArn,
    this.id,
    this.name,
    this.releaseLabel,
    this.securityGroup,
    this.serverUrl,
    this.state,
    this.subnetIds,
    this.tags,
    this.type,
    this.virtualClusterId,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      arn: json['arn'] as String?,
      certificateArn: json['certificateArn'] as String?,
      configurationOverrides: json['configurationOverrides'] != null
          ? ConfigurationOverrides.fromJson(
              json['configurationOverrides'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      executionRoleArn: json['executionRoleArn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      releaseLabel: json['releaseLabel'] as String?,
      securityGroup: json['securityGroup'] as String?,
      serverUrl: json['serverUrl'] as String?,
      state: (json['state'] as String?)?.toEndpointState(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['type'] as String?,
      virtualClusterId: json['virtualClusterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateArn = this.certificateArn;
    final configurationOverrides = this.configurationOverrides;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final id = this.id;
    final name = this.name;
    final releaseLabel = this.releaseLabel;
    final securityGroup = this.securityGroup;
    final serverUrl = this.serverUrl;
    final state = this.state;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final type = this.type;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (arn != null) 'arn': arn,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (securityGroup != null) 'securityGroup': securityGroup,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.toValue(),
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type,
      if (virtualClusterId != null) 'virtualClusterId': virtualClusterId,
    };
  }
}

enum EndpointState {
  creating,
  active,
  terminating,
  terminated,
  terminatedWithErrors,
}

extension on EndpointState {
  String toValue() {
    switch (this) {
      case EndpointState.creating:
        return 'CREATING';
      case EndpointState.active:
        return 'ACTIVE';
      case EndpointState.terminating:
        return 'TERMINATING';
      case EndpointState.terminated:
        return 'TERMINATED';
      case EndpointState.terminatedWithErrors:
        return 'TERMINATED_WITH_ERRORS';
    }
  }
}

extension on String {
  EndpointState toEndpointState() {
    switch (this) {
      case 'CREATING':
        return EndpointState.creating;
      case 'ACTIVE':
        return EndpointState.active;
      case 'TERMINATING':
        return EndpointState.terminating;
      case 'TERMINATED':
        return EndpointState.terminated;
      case 'TERMINATED_WITH_ERRORS':
        return EndpointState.terminatedWithErrors;
    }
    throw Exception('$this is not known in enum EndpointState');
  }
}

enum FailureReason {
  internalError,
  userError,
  validationError,
  clusterUnavailable,
}

extension on FailureReason {
  String toValue() {
    switch (this) {
      case FailureReason.internalError:
        return 'INTERNAL_ERROR';
      case FailureReason.userError:
        return 'USER_ERROR';
      case FailureReason.validationError:
        return 'VALIDATION_ERROR';
      case FailureReason.clusterUnavailable:
        return 'CLUSTER_UNAVAILABLE';
    }
  }
}

extension on String {
  FailureReason toFailureReason() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return FailureReason.internalError;
      case 'USER_ERROR':
        return FailureReason.userError;
      case 'VALIDATION_ERROR':
        return FailureReason.validationError;
      case 'CLUSTER_UNAVAILABLE':
        return FailureReason.clusterUnavailable;
    }
    throw Exception('$this is not known in enum FailureReason');
  }
}

/// Specify the driver that the job runs on.
class JobDriver {
  /// The job driver parameters specified for spark submit.
  final SparkSubmitJobDriver? sparkSubmitJobDriver;

  JobDriver({
    this.sparkSubmitJobDriver,
  });

  factory JobDriver.fromJson(Map<String, dynamic> json) {
    return JobDriver(
      sparkSubmitJobDriver: json['sparkSubmitJobDriver'] != null
          ? SparkSubmitJobDriver.fromJson(
              json['sparkSubmitJobDriver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sparkSubmitJobDriver = this.sparkSubmitJobDriver;
    return {
      if (sparkSubmitJobDriver != null)
        'sparkSubmitJobDriver': sparkSubmitJobDriver,
    };
  }
}

/// This entity describes a job run. A job run is a unit of work, such as a
/// Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR
/// on EKS.
class JobRun {
  /// The ARN of job run.
  final String? arn;

  /// The client token used to start a job run.
  final String? clientToken;

  /// The configuration settings that are used to override default configuration.
  final ConfigurationOverrides? configurationOverrides;

  /// The date and time when the job run was created.
  final DateTime? createdAt;

  /// The user who created the job run.
  final String? createdBy;

  /// The execution role ARN of the job run.
  final String? executionRoleArn;

  /// The reasons why the job run has failed.
  final FailureReason? failureReason;

  /// The date and time when the job run has finished.
  final DateTime? finishedAt;

  /// The ID of the job run.
  final String? id;

  /// Parameters of job driver for the job run.
  final JobDriver? jobDriver;

  /// The name of the job run.
  final String? name;

  /// The release version of Amazon EMR.
  final String? releaseLabel;

  /// The state of the job run.
  final JobRunState? state;

  /// Additional details of the job run state.
  final String? stateDetails;

  /// The assigned tags of the job run.
  final Map<String, String>? tags;

  /// The ID of the job run's virtual cluster.
  final String? virtualClusterId;

  JobRun({
    this.arn,
    this.clientToken,
    this.configurationOverrides,
    this.createdAt,
    this.createdBy,
    this.executionRoleArn,
    this.failureReason,
    this.finishedAt,
    this.id,
    this.jobDriver,
    this.name,
    this.releaseLabel,
    this.state,
    this.stateDetails,
    this.tags,
    this.virtualClusterId,
  });

  factory JobRun.fromJson(Map<String, dynamic> json) {
    return JobRun(
      arn: json['arn'] as String?,
      clientToken: json['clientToken'] as String?,
      configurationOverrides: json['configurationOverrides'] != null
          ? ConfigurationOverrides.fromJson(
              json['configurationOverrides'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      executionRoleArn: json['executionRoleArn'] as String?,
      failureReason: (json['failureReason'] as String?)?.toFailureReason(),
      finishedAt: timeStampFromJson(json['finishedAt']),
      id: json['id'] as String?,
      jobDriver: json['jobDriver'] != null
          ? JobDriver.fromJson(json['jobDriver'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      releaseLabel: json['releaseLabel'] as String?,
      state: (json['state'] as String?)?.toJobRunState(),
      stateDetails: json['stateDetails'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      virtualClusterId: json['virtualClusterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final configurationOverrides = this.configurationOverrides;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final executionRoleArn = this.executionRoleArn;
    final failureReason = this.failureReason;
    final finishedAt = this.finishedAt;
    final id = this.id;
    final jobDriver = this.jobDriver;
    final name = this.name;
    final releaseLabel = this.releaseLabel;
    final state = this.state;
    final stateDetails = this.stateDetails;
    final tags = this.tags;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (arn != null) 'arn': arn,
      if (clientToken != null) 'clientToken': clientToken,
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (failureReason != null) 'failureReason': failureReason.toValue(),
      if (finishedAt != null) 'finishedAt': iso8601ToJson(finishedAt),
      if (id != null) 'id': id,
      if (jobDriver != null) 'jobDriver': jobDriver,
      if (name != null) 'name': name,
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (state != null) 'state': state.toValue(),
      if (stateDetails != null) 'stateDetails': stateDetails,
      if (tags != null) 'tags': tags,
      if (virtualClusterId != null) 'virtualClusterId': virtualClusterId,
    };
  }
}

enum JobRunState {
  pending,
  submitted,
  running,
  failed,
  cancelled,
  cancelPending,
  completed,
}

extension on JobRunState {
  String toValue() {
    switch (this) {
      case JobRunState.pending:
        return 'PENDING';
      case JobRunState.submitted:
        return 'SUBMITTED';
      case JobRunState.running:
        return 'RUNNING';
      case JobRunState.failed:
        return 'FAILED';
      case JobRunState.cancelled:
        return 'CANCELLED';
      case JobRunState.cancelPending:
        return 'CANCEL_PENDING';
      case JobRunState.completed:
        return 'COMPLETED';
    }
  }
}

extension on String {
  JobRunState toJobRunState() {
    switch (this) {
      case 'PENDING':
        return JobRunState.pending;
      case 'SUBMITTED':
        return JobRunState.submitted;
      case 'RUNNING':
        return JobRunState.running;
      case 'FAILED':
        return JobRunState.failed;
      case 'CANCELLED':
        return JobRunState.cancelled;
      case 'CANCEL_PENDING':
        return JobRunState.cancelPending;
      case 'COMPLETED':
        return JobRunState.completed;
    }
    throw Exception('$this is not known in enum JobRunState');
  }
}

class ListJobRunsResponse {
  /// This output lists information about the specified job runs.
  final List<JobRun>? jobRuns;

  /// This output displays the token for the next set of job runs.
  final String? nextToken;

  ListJobRunsResponse({
    this.jobRuns,
    this.nextToken,
  });

  factory ListJobRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobRunsResponse(
      jobRuns: (json['jobRuns'] as List?)
          ?.whereNotNull()
          .map((e) => JobRun.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRuns = this.jobRuns;
    final nextToken = this.nextToken;
    return {
      if (jobRuns != null) 'jobRuns': jobRuns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListManagedEndpointsResponse {
  /// The managed endpoints to be listed.
  final List<Endpoint>? endpoints;

  /// The token for the next set of endpoints to return.
  final String? nextToken;

  ListManagedEndpointsResponse({
    this.endpoints,
    this.nextToken,
  });

  factory ListManagedEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedEndpointsResponse(
      endpoints: (json['endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nextToken = this.nextToken;
    return {
      if (endpoints != null) 'endpoints': endpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags assigned to resources.
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

class ListVirtualClustersResponse {
  /// This output displays the token for the next set of virtual clusters.
  final String? nextToken;

  /// This output lists the specified virtual clusters.
  final List<VirtualCluster>? virtualClusters;

  ListVirtualClustersResponse({
    this.nextToken,
    this.virtualClusters,
  });

  factory ListVirtualClustersResponse.fromJson(Map<String, dynamic> json) {
    return ListVirtualClustersResponse(
      nextToken: json['nextToken'] as String?,
      virtualClusters: (json['virtualClusters'] as List?)
          ?.whereNotNull()
          .map((e) => VirtualCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final virtualClusters = this.virtualClusters;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (virtualClusters != null) 'virtualClusters': virtualClusters,
    };
  }
}

/// Configuration setting for monitoring.
class MonitoringConfiguration {
  /// Monitoring configurations for CloudWatch.
  final CloudWatchMonitoringConfiguration? cloudWatchMonitoringConfiguration;

  /// Monitoring configurations for the persistent application UI.
  final PersistentAppUI? persistentAppUI;

  /// Amazon S3 configuration for monitoring log publishing.
  final S3MonitoringConfiguration? s3MonitoringConfiguration;

  MonitoringConfiguration({
    this.cloudWatchMonitoringConfiguration,
    this.persistentAppUI,
    this.s3MonitoringConfiguration,
  });

  factory MonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return MonitoringConfiguration(
      cloudWatchMonitoringConfiguration:
          json['cloudWatchMonitoringConfiguration'] != null
              ? CloudWatchMonitoringConfiguration.fromJson(
                  json['cloudWatchMonitoringConfiguration']
                      as Map<String, dynamic>)
              : null,
      persistentAppUI:
          (json['persistentAppUI'] as String?)?.toPersistentAppUI(),
      s3MonitoringConfiguration: json['s3MonitoringConfiguration'] != null
          ? S3MonitoringConfiguration.fromJson(
              json['s3MonitoringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchMonitoringConfiguration =
        this.cloudWatchMonitoringConfiguration;
    final persistentAppUI = this.persistentAppUI;
    final s3MonitoringConfiguration = this.s3MonitoringConfiguration;
    return {
      if (cloudWatchMonitoringConfiguration != null)
        'cloudWatchMonitoringConfiguration': cloudWatchMonitoringConfiguration,
      if (persistentAppUI != null) 'persistentAppUI': persistentAppUI.toValue(),
      if (s3MonitoringConfiguration != null)
        's3MonitoringConfiguration': s3MonitoringConfiguration,
    };
  }
}

enum PersistentAppUI {
  enabled,
  disabled,
}

extension on PersistentAppUI {
  String toValue() {
    switch (this) {
      case PersistentAppUI.enabled:
        return 'ENABLED';
      case PersistentAppUI.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  PersistentAppUI toPersistentAppUI() {
    switch (this) {
      case 'ENABLED':
        return PersistentAppUI.enabled;
      case 'DISABLED':
        return PersistentAppUI.disabled;
    }
    throw Exception('$this is not known in enum PersistentAppUI');
  }
}

/// Amazon S3 configuration for monitoring log publishing. You can configure
/// your jobs to send log information to Amazon S3.
class S3MonitoringConfiguration {
  /// Amazon S3 destination URI for log publishing.
  final String logUri;

  S3MonitoringConfiguration({
    required this.logUri,
  });

  factory S3MonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return S3MonitoringConfiguration(
      logUri: json['logUri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final logUri = this.logUri;
    return {
      'logUri': logUri,
    };
  }
}

/// The information about job driver for Spark submit.
class SparkSubmitJobDriver {
  /// The entry point of job application.
  final String entryPoint;

  /// The arguments for job application.
  final List<String>? entryPointArguments;

  /// The Spark submit parameters that are used for job runs.
  final String? sparkSubmitParameters;

  SparkSubmitJobDriver({
    required this.entryPoint,
    this.entryPointArguments,
    this.sparkSubmitParameters,
  });

  factory SparkSubmitJobDriver.fromJson(Map<String, dynamic> json) {
    return SparkSubmitJobDriver(
      entryPoint: json['entryPoint'] as String,
      entryPointArguments: (json['entryPointArguments'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sparkSubmitParameters: json['sparkSubmitParameters'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entryPoint = this.entryPoint;
    final entryPointArguments = this.entryPointArguments;
    final sparkSubmitParameters = this.sparkSubmitParameters;
    return {
      'entryPoint': entryPoint,
      if (entryPointArguments != null)
        'entryPointArguments': entryPointArguments,
      if (sparkSubmitParameters != null)
        'sparkSubmitParameters': sparkSubmitParameters,
    };
  }
}

class StartJobRunResponse {
  /// This output lists the ARN of job run.
  final String? arn;

  /// This output displays the started job run ID.
  final String? id;

  /// This output displays the name of the started job run.
  final String? name;

  /// This output displays the virtual cluster ID for which the job run was
  /// submitted.
  final String? virtualClusterId;

  StartJobRunResponse({
    this.arn,
    this.id,
    this.name,
    this.virtualClusterId,
  });

  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) {
    return StartJobRunResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      virtualClusterId: json['virtualClusterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (virtualClusterId != null) 'virtualClusterId': virtualClusterId,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This entity describes a virtual cluster. A virtual cluster is a Kubernetes
/// namespace that Amazon EMR is registered with. Amazon EMR uses virtual
/// clusters to run jobs and host endpoints. Multiple virtual clusters can be
/// backed by the same physical cluster. However, each virtual cluster maps to
/// one namespace on an EKS cluster. Virtual clusters do not create any active
/// resources that contribute to your bill or that require lifecycle management
/// outside the service.
class VirtualCluster {
  /// The ARN of the virtual cluster.
  final String? arn;

  /// The container provider of the virtual cluster.
  final ContainerProvider? containerProvider;

  /// The date and time when the virtual cluster is created.
  final DateTime? createdAt;

  /// The ID of the virtual cluster.
  final String? id;

  /// The name of the virtual cluster.
  final String? name;

  /// The state of the virtual cluster.
  final VirtualClusterState? state;

  /// The assigned tags of the virtual cluster.
  final Map<String, String>? tags;

  VirtualCluster({
    this.arn,
    this.containerProvider,
    this.createdAt,
    this.id,
    this.name,
    this.state,
    this.tags,
  });

  factory VirtualCluster.fromJson(Map<String, dynamic> json) {
    return VirtualCluster(
      arn: json['arn'] as String?,
      containerProvider: json['containerProvider'] != null
          ? ContainerProvider.fromJson(
              json['containerProvider'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      name: json['name'] as String?,
      state: (json['state'] as String?)?.toVirtualClusterState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final containerProvider = this.containerProvider;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (containerProvider != null) 'containerProvider': containerProvider,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum VirtualClusterState {
  running,
  terminating,
  terminated,
  arrested,
}

extension on VirtualClusterState {
  String toValue() {
    switch (this) {
      case VirtualClusterState.running:
        return 'RUNNING';
      case VirtualClusterState.terminating:
        return 'TERMINATING';
      case VirtualClusterState.terminated:
        return 'TERMINATED';
      case VirtualClusterState.arrested:
        return 'ARRESTED';
    }
  }
}

extension on String {
  VirtualClusterState toVirtualClusterState() {
    switch (this) {
      case 'RUNNING':
        return VirtualClusterState.running;
      case 'TERMINATING':
        return VirtualClusterState.terminating;
      case 'TERMINATED':
        return VirtualClusterState.terminated;
      case 'ARRESTED':
        return VirtualClusterState.arrested;
    }
    throw Exception('$this is not known in enum VirtualClusterState');
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
