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

part '2020-10-01.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String id,
    @_s.required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9a-z]+''',
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
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
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
  /// Parameter [clientToken] :
  /// The client idempotency token for this create call.
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
  /// Parameter [configurationOverrides] :
  /// The configuration settings that will be used to override existing
  /// configurations.
  ///
  /// Parameter [tags] :
  /// The tags of the managed endpoint.
  Future<CreateManagedEndpointResponse> createManagedEndpoint({
    @_s.required String certificateArn,
    @_s.required String clientToken,
    @_s.required String executionRoleArn,
    @_s.required String name,
    @_s.required String releaseLabel,
    @_s.required String type,
    @_s.required String virtualClusterId,
    ConfigurationOverrides configurationOverrides,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      44,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''^arn:(aws[a-zA-Z0-9-]*):acm:.+:(\d{12}):certificate/.+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:(aws[a-zA-Z0-9-]*):iam::(\d{12})?:(role((\u002F)|(\u002F[\u0021-\u007F]+\u002F))[\w+=,.@-]+)$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_/#A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'releaseLabel',
      releaseLabel,
      r'''[\.\-_/A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'type',
      type,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'certificateArn': certificateArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'executionRoleArn': executionRoleArn,
      'name': name,
      'releaseLabel': releaseLabel,
      'type': type,
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
  /// Parameter [clientToken] :
  /// The client token of the virtual cluster.
  ///
  /// Parameter [containerProvider] :
  /// The container provider of the virtual cluster.
  ///
  /// Parameter [name] :
  /// The specified name of the virtual cluster.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the virtual cluster.
  Future<CreateVirtualClusterResponse> createVirtualCluster({
    @_s.required String clientToken,
    @_s.required ContainerProvider containerProvider,
    @_s.required String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(containerProvider, 'containerProvider');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_/#A-Za-z0-9]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'containerProvider': containerProvider,
      'name': name,
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
    @_s.required String id,
    @_s.required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9a-z]+''',
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
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9a-z]+''',
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
    @_s.required String id,
    @_s.required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9a-z]+''',
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
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
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
    @_s.required String id,
    @_s.required String virtualClusterId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9a-z]+''',
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
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
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
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[0-9a-z]+''',
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
    @_s.required String virtualClusterId,
    DateTime createdAfter,
    DateTime createdBefore,
    int maxResults,
    String name,
    String nextToken,
    List<JobRunState> states,
  }) async {
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_/#A-Za-z0-9]+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null)
        'states': states.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String virtualClusterId,
    DateTime createdAfter,
    DateTime createdBefore,
    int maxResults,
    String nextToken,
    List<EndpointState> states,
    List<String> types,
  }) async {
    ArgumentError.checkNotNull(virtualClusterId, 'virtualClusterId');
    _s.validateStringLength(
      'virtualClusterId',
      virtualClusterId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null)
        'states': states.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      60,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws[a-zA-Z0-9-]*):emr-containers:.+:(\d{12}):/virtualclusters/.+$''',
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
    String containerProviderId,
    ContainerProviderType containerProviderType,
    DateTime createdAfter,
    DateTime createdBefore,
    int maxResults,
    String nextToken,
    List<VirtualClusterState> states,
  }) async {
    _s.validateStringLength(
      'containerProviderId',
      containerProviderId,
      1,
      1024,
    );
    _s.validateStringPattern(
      'containerProviderId',
      containerProviderId,
      r'''.*\S.*''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
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
      if (states != null)
        'states': states.map((e) => e?.toValue() ?? '').toList(),
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
  /// Parameter [clientToken] :
  /// The client idempotency token of the job run request.
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
  /// Parameter [configurationOverrides] :
  /// The configuration overrides for the job run.
  ///
  /// Parameter [name] :
  /// The name of the job run.
  ///
  /// Parameter [tags] :
  /// The tags assigned to job runs.
  Future<StartJobRunResponse> startJobRun({
    @_s.required String clientToken,
    @_s.required String executionRoleArn,
    @_s.required JobDriver jobDriver,
    @_s.required String releaseLabel,
    @_s.required String virtualClusterId,
    ConfigurationOverrides configurationOverrides,
    String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:(aws[a-zA-Z0-9-]*):iam::(\d{12})?:(role((\u002F)|(\u002F[\u0021-\u007F]+\u002F))[\w+=,.@-]+)$''',
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
    _s.validateStringPattern(
      'releaseLabel',
      releaseLabel,
      r'''[\.\-_/A-Za-z0-9]+''',
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
    _s.validateStringPattern(
      'virtualClusterId',
      virtualClusterId,
      r'''[0-9a-z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\.\-_/#A-Za-z0-9]+''',
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'executionRoleArn': executionRoleArn,
      'jobDriver': jobDriver,
      'releaseLabel': releaseLabel,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      60,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws[a-zA-Z0-9-]*):emr-containers:.+:(\d{12}):/virtualclusters/.+$''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      60,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws[a-zA-Z0-9-]*):emr-containers:.+:(\d{12}):/virtualclusters/.+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJobRunResponse {
  /// The output contains the ID of the cancelled job run.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The output contains the virtual cluster ID for which the job run is
  /// cancelled.
  @_s.JsonKey(name: 'virtualClusterId')
  final String virtualClusterId;

  CancelJobRunResponse({
    this.id,
    this.virtualClusterId,
  });
  factory CancelJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelJobRunResponseFromJson(json);
}

/// A configuration for CloudWatch monitoring. You can configure your jobs to
/// send log information to CloudWatch Logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchMonitoringConfiguration {
  /// The name of the log group for log publishing.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// The specified name prefix for log streams.
  @_s.JsonKey(name: 'logStreamNamePrefix')
  final String logStreamNamePrefix;

  CloudWatchMonitoringConfiguration({
    @_s.required this.logGroupName,
    this.logStreamNamePrefix,
  });
  factory CloudWatchMonitoringConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$CloudWatchMonitoringConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CloudWatchMonitoringConfigurationToJson(this);
}

/// A configuration specification to be used when provisioning virtual clusters,
/// which can include configurations for applications and software bundled with
/// Amazon EMR on EKS. A configuration consists of a classification, properties,
/// and optional nested configurations. A classification refers to an
/// application-specific configuration file. Properties are the settings you
/// want to change in that file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Configuration {
  /// The classification within a configuration.
  @_s.JsonKey(name: 'classification')
  final String classification;

  /// A list of additional configurations to apply within a configuration object.
  @_s.JsonKey(name: 'configurations')
  final List<Configuration> configurations;

  /// A set of properties specified within a configuration classification.
  @_s.JsonKey(name: 'properties')
  final Map<String, String> properties;

  Configuration({
    @_s.required this.classification,
    this.configurations,
    this.properties,
  });
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}

/// A configuration specification to be used to override existing
/// configurations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfigurationOverrides {
  /// The configurations for the application running by the job run.
  @_s.JsonKey(name: 'applicationConfiguration')
  final List<Configuration> applicationConfiguration;

  /// The configurations for monitoring.
  @_s.JsonKey(name: 'monitoringConfiguration')
  final MonitoringConfiguration monitoringConfiguration;

  ConfigurationOverrides({
    this.applicationConfiguration,
    this.monitoringConfiguration,
  });
  factory ConfigurationOverrides.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationOverridesFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationOverridesToJson(this);
}

/// The information about the container used for a job run or a managed
/// endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerInfo {
  /// The information about the EKS cluster.
  @_s.JsonKey(name: 'eksInfo')
  final EksInfo eksInfo;

  ContainerInfo({
    this.eksInfo,
  });
  factory ContainerInfo.fromJson(Map<String, dynamic> json) =>
      _$ContainerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerInfoToJson(this);
}

/// The information about the container provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerProvider {
  /// The ID of the container cluster.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The type of the container provider. EKS is the only supported type as of
  /// now.
  @_s.JsonKey(name: 'type')
  final ContainerProviderType type;

  /// The information about the container cluster.
  @_s.JsonKey(name: 'info')
  final ContainerInfo info;

  ContainerProvider({
    @_s.required this.id,
    @_s.required this.type,
    this.info,
  });
  factory ContainerProvider.fromJson(Map<String, dynamic> json) =>
      _$ContainerProviderFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerProviderToJson(this);
}

enum ContainerProviderType {
  @_s.JsonValue('EKS')
  eks,
}

extension on ContainerProviderType {
  String toValue() {
    switch (this) {
      case ContainerProviderType.eks:
        return 'EKS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateManagedEndpointResponse {
  /// The output contains the ARN of the managed endpoint.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The output contains the ID of the managed endpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The output contains the name of the managed endpoint.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The output contains the ID of the virtual cluster.
  @_s.JsonKey(name: 'virtualClusterId')
  final String virtualClusterId;

  CreateManagedEndpointResponse({
    this.arn,
    this.id,
    this.name,
    this.virtualClusterId,
  });
  factory CreateManagedEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateManagedEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVirtualClusterResponse {
  /// This output contains the ARN of virtual cluster.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// This output contains the virtual cluster ID.
  @_s.JsonKey(name: 'id')
  final String id;

  /// This output contains the name of the virtual cluster.
  @_s.JsonKey(name: 'name')
  final String name;

  CreateVirtualClusterResponse({
    this.arn,
    this.id,
    this.name,
  });
  factory CreateVirtualClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteManagedEndpointResponse {
  /// The output displays the ID of the managed endpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The output displays the ID of the endpoint's virtual cluster.
  @_s.JsonKey(name: 'virtualClusterId')
  final String virtualClusterId;

  DeleteManagedEndpointResponse({
    this.id,
    this.virtualClusterId,
  });
  factory DeleteManagedEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteManagedEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVirtualClusterResponse {
  /// This output contains the ID of the virtual cluster that will be deleted.
  @_s.JsonKey(name: 'id')
  final String id;

  DeleteVirtualClusterResponse({
    this.id,
  });
  factory DeleteVirtualClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualClusterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobRunResponse {
  /// The output displays information about a job run.
  @_s.JsonKey(name: 'jobRun')
  final JobRun jobRun;

  DescribeJobRunResponse({
    this.jobRun,
  });
  factory DescribeJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeManagedEndpointResponse {
  /// This output displays information about a managed endpoint.
  @_s.JsonKey(name: 'endpoint')
  final Endpoint endpoint;

  DescribeManagedEndpointResponse({
    this.endpoint,
  });
  factory DescribeManagedEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeManagedEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVirtualClusterResponse {
  /// This output displays information about the specified virtual cluster.
  @_s.JsonKey(name: 'virtualCluster')
  final VirtualCluster virtualCluster;

  DescribeVirtualClusterResponse({
    this.virtualCluster,
  });
  factory DescribeVirtualClusterResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualClusterResponseFromJson(json);
}

/// The information about the EKS cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EksInfo {
  /// The namespaces of the EKS cluster.
  @_s.JsonKey(name: 'namespace')
  final String namespace;

  EksInfo({
    this.namespace,
  });
  factory EksInfo.fromJson(Map<String, dynamic> json) =>
      _$EksInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EksInfoToJson(this);
}

/// This entity represents the endpoint that is managed by Amazon EMR on EKS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// The ARN of the endpoint.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The certificate ARN of the endpoint.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The configuration settings that are used to override existing configurations
  /// for endpoints.
  @_s.JsonKey(name: 'configurationOverrides')
  final ConfigurationOverrides configurationOverrides;

  /// The date and time when the endpoint was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The execution role ARN of the endpoint.
  @_s.JsonKey(name: 'executionRoleArn')
  final String executionRoleArn;

  /// The ID of the endpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the endpoint.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The EMR release version to be used for the endpoint.
  @_s.JsonKey(name: 'releaseLabel')
  final String releaseLabel;

  /// The security group configuration of the endpoint.
  @_s.JsonKey(name: 'securityGroup')
  final String securityGroup;

  /// The server URL of the endpoint.
  @_s.JsonKey(name: 'serverUrl')
  final String serverUrl;

  /// The state of the endpoint.
  @_s.JsonKey(name: 'state')
  final EndpointState state;

  /// The subnet IDs of the endpoint.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The tags of the endpoint.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The type of the endpoint.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The ID of the endpoint's virtual cluster.
  @_s.JsonKey(name: 'virtualClusterId')
  final String virtualClusterId;

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
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

enum EndpointState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('TERMINATED_WITH_ERRORS')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum FailureReason {
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('USER_ERROR')
  userError,
  @_s.JsonValue('VALIDATION_ERROR')
  validationError,
  @_s.JsonValue('CLUSTER_UNAVAILABLE')
  clusterUnavailable,
}

/// Specify the driver that the job runs on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobDriver {
  /// The job driver parameters specified for spark submit.
  @_s.JsonKey(name: 'sparkSubmitJobDriver')
  final SparkSubmitJobDriver sparkSubmitJobDriver;

  JobDriver({
    this.sparkSubmitJobDriver,
  });
  factory JobDriver.fromJson(Map<String, dynamic> json) =>
      _$JobDriverFromJson(json);

  Map<String, dynamic> toJson() => _$JobDriverToJson(this);
}

/// This entity describes a job run. A job run is a unit of work, such as a
/// Spark jar, PySpark script, or SparkSQL query, that you submit to Amazon EMR
/// on EKS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobRun {
  /// The ARN of job run.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The client token used to start a job run.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The configuration settings that are used to override default configuration.
  @_s.JsonKey(name: 'configurationOverrides')
  final ConfigurationOverrides configurationOverrides;

  /// The date and time when the job run was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The user who created the job run.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// The execution role ARN of the job run.
  @_s.JsonKey(name: 'executionRoleArn')
  final String executionRoleArn;

  /// The reasons why the job run has failed.
  @_s.JsonKey(name: 'failureReason')
  final FailureReason failureReason;

  /// The date and time when the job run has finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'finishedAt')
  final DateTime finishedAt;

  /// The ID of the job run.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Parameters of job driver for the job run.
  @_s.JsonKey(name: 'jobDriver')
  final JobDriver jobDriver;

  /// The name of the job run.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The release version of Amazon EMR.
  @_s.JsonKey(name: 'releaseLabel')
  final String releaseLabel;

  /// The state of the job run.
  @_s.JsonKey(name: 'state')
  final JobRunState state;

  /// Additional details of the job run state.
  @_s.JsonKey(name: 'stateDetails')
  final String stateDetails;

  /// The assigned tags of the job run.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The ID of the job run's virtual cluster.
  @_s.JsonKey(name: 'virtualClusterId')
  final String virtualClusterId;

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
  factory JobRun.fromJson(Map<String, dynamic> json) => _$JobRunFromJson(json);
}

enum JobRunState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('CANCEL_PENDING')
  cancelPending,
  @_s.JsonValue('COMPLETED')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobRunsResponse {
  /// This output lists information about the specified job runs.
  @_s.JsonKey(name: 'jobRuns')
  final List<JobRun> jobRuns;

  /// This output displays the token for the next set of job runs.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobRunsResponse({
    this.jobRuns,
    this.nextToken,
  });
  factory ListJobRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListManagedEndpointsResponse {
  /// The managed endpoints to be listed.
  @_s.JsonKey(name: 'endpoints')
  final List<Endpoint> endpoints;

  /// The token for the next set of endpoints to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListManagedEndpointsResponse({
    this.endpoints,
    this.nextToken,
  });
  factory ListManagedEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListManagedEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags assigned to resources.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
class ListVirtualClustersResponse {
  /// This output displays the token for the next set of virtual clusters.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// This output lists the specified virtual clusters.
  @_s.JsonKey(name: 'virtualClusters')
  final List<VirtualCluster> virtualClusters;

  ListVirtualClustersResponse({
    this.nextToken,
    this.virtualClusters,
  });
  factory ListVirtualClustersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualClustersResponseFromJson(json);
}

/// Configuration setting for monitoring.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringConfiguration {
  /// Monitoring configurations for CloudWatch.
  @_s.JsonKey(name: 'cloudWatchMonitoringConfiguration')
  final CloudWatchMonitoringConfiguration cloudWatchMonitoringConfiguration;

  /// Monitoring configurations for the persistent application UI.
  @_s.JsonKey(name: 'persistentAppUI')
  final PersistentAppUI persistentAppUI;

  /// Amazon S3 configuration for monitoring log publishing.
  @_s.JsonKey(name: 's3MonitoringConfiguration')
  final S3MonitoringConfiguration s3MonitoringConfiguration;

  MonitoringConfiguration({
    this.cloudWatchMonitoringConfiguration,
    this.persistentAppUI,
    this.s3MonitoringConfiguration,
  });
  factory MonitoringConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MonitoringConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringConfigurationToJson(this);
}

enum PersistentAppUI {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Amazon S3 configuration for monitoring log publishing. You can configure
/// your jobs to send log information to Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3MonitoringConfiguration {
  /// Amazon S3 destination URI for log publishing.
  @_s.JsonKey(name: 'logUri')
  final String logUri;

  S3MonitoringConfiguration({
    @_s.required this.logUri,
  });
  factory S3MonitoringConfiguration.fromJson(Map<String, dynamic> json) =>
      _$S3MonitoringConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$S3MonitoringConfigurationToJson(this);
}

/// The information about job driver for Spark submit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SparkSubmitJobDriver {
  /// The entry point of job application.
  @_s.JsonKey(name: 'entryPoint')
  final String entryPoint;

  /// The arguments for job application.
  @_s.JsonKey(name: 'entryPointArguments')
  final List<String> entryPointArguments;

  /// The Spark submit parameters that are used for job runs.
  @_s.JsonKey(name: 'sparkSubmitParameters')
  final String sparkSubmitParameters;

  SparkSubmitJobDriver({
    @_s.required this.entryPoint,
    this.entryPointArguments,
    this.sparkSubmitParameters,
  });
  factory SparkSubmitJobDriver.fromJson(Map<String, dynamic> json) =>
      _$SparkSubmitJobDriverFromJson(json);

  Map<String, dynamic> toJson() => _$SparkSubmitJobDriverToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartJobRunResponse {
  /// This output lists the ARN of job run.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// This output displays the started job run ID.
  @_s.JsonKey(name: 'id')
  final String id;

  /// This output displays the name of the started job run.
  @_s.JsonKey(name: 'name')
  final String name;

  /// This output displays the virtual cluster ID for which the job run was
  /// submitted.
  @_s.JsonKey(name: 'virtualClusterId')
  final String virtualClusterId;

  StartJobRunResponse({
    this.arn,
    this.id,
    this.name,
    this.virtualClusterId,
  });
  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) =>
      _$StartJobRunResponseFromJson(json);
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
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// This entity describes a virtual cluster. A virtual cluster is a Kubernetes
/// namespace that Amazon EMR is registered with. Amazon EMR uses virtual
/// clusters to run jobs and host endpoints. Multiple virtual clusters can be
/// backed by the same physical cluster. However, each virtual cluster maps to
/// one namespace on an EKS cluster. Virtual clusters do not create any active
/// resources that contribute to your bill or that require lifecycle management
/// outside the service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualCluster {
  /// The ARN of the virtual cluster.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The container provider of the virtual cluster.
  @_s.JsonKey(name: 'containerProvider')
  final ContainerProvider containerProvider;

  /// The date and time when the virtual cluster is created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the virtual cluster.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the virtual cluster.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The state of the virtual cluster.
  @_s.JsonKey(name: 'state')
  final VirtualClusterState state;

  /// The assigned tags of the virtual cluster.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  VirtualCluster({
    this.arn,
    this.containerProvider,
    this.createdAt,
    this.id,
    this.name,
    this.state,
    this.tags,
  });
  factory VirtualCluster.fromJson(Map<String, dynamic> json) =>
      _$VirtualClusterFromJson(json);
}

enum VirtualClusterState {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('TERMINATING')
  terminating,
  @_s.JsonValue('TERMINATED')
  terminated,
  @_s.JsonValue('ARRESTED')
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
    throw Exception('Unknown enum value: $this');
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
