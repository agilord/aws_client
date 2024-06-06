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
/// EMR on EKSService Endpoints</a>.
/// </li>
/// </ul>
class EmrContainers {
  final _s.RestJsonProtocol _protocol;
  EmrContainers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/jobruns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobRunResponse.fromJson(response);
  }

  /// Creates a job template. Job template stores values of StartJobRun API
  /// request in a template and can be used to start a job run. Job template
  /// allows two use cases: avoid repeating recurring StartJobRun API request
  /// values, enforcing certain values in StartJobRun API request.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobTemplateData] :
  /// The job template data which holds values of StartJobRun API request.
  ///
  /// Parameter [name] :
  /// The specified name of the job template.
  ///
  /// Parameter [clientToken] :
  /// The client token of the job template.
  ///
  /// Parameter [kmsKeyArn] :
  /// The KMS key ARN used to encrypt the job template.
  ///
  /// Parameter [tags] :
  /// The tags that are associated with the job template.
  Future<CreateJobTemplateResponse> createJobTemplate({
    required JobTemplateData jobTemplateData,
    required String name,
    String? clientToken,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'jobTemplateData': jobTemplateData,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobtemplates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobTemplateResponse.fromJson(response);
  }

  /// Creates a managed endpoint. A managed endpoint is a gateway that connects
  /// Amazon EMR Studio to Amazon EMR on EKS so that Amazon EMR Studio can
  /// communicate with your virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// Parameter [certificateArn] :
  /// The certificate ARN provided by users for the managed endpoint. This field
  /// is under deprecation and will be removed in future releases.
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
    required String executionRoleArn,
    required String name,
    required String releaseLabel,
    required String type,
    required String virtualClusterId,
    String? certificateArn,
    String? clientToken,
    ConfigurationOverrides? configurationOverrides,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'executionRoleArn': executionRoleArn,
      'name': name,
      'releaseLabel': releaseLabel,
      'type': type,
      if (certificateArn != null) 'certificateArn': certificateArn,
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

  /// Creates a security configuration. Security configurations in Amazon EMR on
  /// EKS are templates for different security setups. You can use security
  /// configurations to configure the Lake Formation integration setup. You can
  /// also create a security configuration to re-use a security setup each time
  /// you create a virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the security configuration.
  ///
  /// Parameter [securityConfigurationData] :
  /// Security configuration input for the request.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token to use when creating the security
  /// configuration.
  ///
  /// Parameter [tags] :
  /// The tags to add to the security configuration.
  Future<CreateSecurityConfigurationResponse> createSecurityConfiguration({
    required String name,
    required SecurityConfigurationData securityConfigurationData,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'securityConfigurationData': securityConfigurationData,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/securityconfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSecurityConfigurationResponse.fromJson(response);
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
  /// May throw [EKSRequestThrottledException].
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
  /// Parameter [securityConfigurationId] :
  /// The ID of the security configuration.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the virtual cluster.
  Future<CreateVirtualClusterResponse> createVirtualCluster({
    required ContainerProvider containerProvider,
    required String name,
    String? clientToken,
    String? securityConfigurationId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'containerProvider': containerProvider,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (securityConfigurationId != null)
        'securityConfigurationId': securityConfigurationId,
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

  /// Deletes a job template. Job template stores values of StartJobRun API
  /// request in a template and can be used to start a job run. Job template
  /// allows two use cases: avoid repeating recurring StartJobRun API request
  /// values, enforcing certain values in StartJobRun API request.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the job template that will be deleted.
  Future<DeleteJobTemplateResponse> deleteJobTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/jobtemplates/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteJobTemplateResponse.fromJson(response);
  }

  /// Deletes a managed endpoint. A managed endpoint is a gateway that connects
  /// Amazon EMR Studio to Amazon EMR on EKS so that Amazon EMR Studio can
  /// communicate with your virtual cluster.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/jobruns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobRunResponse.fromJson(response);
  }

  /// Displays detailed information about a specified job template. Job template
  /// stores values of StartJobRun API request in a template and can be used to
  /// start a job run. Job template allows two use cases: avoid repeating
  /// recurring StartJobRun API request values, enforcing certain values in
  /// StartJobRun API request.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the job template that will be described.
  Future<DescribeJobTemplateResponse> describeJobTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobtemplates/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobTemplateResponse.fromJson(response);
  }

  /// Displays detailed information about a managed endpoint. A managed endpoint
  /// is a gateway that connects Amazon EMR Studio to Amazon EMR on EKS so that
  /// Amazon EMR Studio can communicate with your virtual cluster.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterId)}/endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeManagedEndpointResponse.fromJson(response);
  }

  /// Displays detailed information about a specified security configuration.
  /// Security configurations in Amazon EMR on EKS are templates for different
  /// security setups. You can use security configurations to configure the Lake
  /// Formation integration setup. You can also create a security configuration
  /// to re-use a security setup each time you create a virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The ID of the security configuration.
  Future<DescribeSecurityConfigurationResponse> describeSecurityConfiguration({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/securityconfigurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSecurityConfigurationResponse.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/virtualclusters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVirtualClusterResponse.fromJson(response);
  }

  /// Generate a session token to connect to a managed endpoint.
  ///
  /// May throw [ValidationException].
  /// May throw [RequestThrottledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [credentialType] :
  /// Type of the token requested. Currently supported and default value of this
  /// field is “TOKEN.”
  ///
  /// Parameter [endpointIdentifier] :
  /// The ARN of the managed endpoint for which the request is submitted.
  ///
  /// Parameter [executionRoleArn] :
  /// The IAM Execution Role ARN that will be used by the job run.
  ///
  /// Parameter [virtualClusterIdentifier] :
  /// The ARN of the Virtual Cluster which the Managed Endpoint belongs to.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token of the job run request.
  ///
  /// Parameter [durationInSeconds] :
  /// Duration in seconds for which the session token is valid. The default
  /// duration is 15 minutes and the maximum is 12 hours.
  ///
  /// Parameter [logContext] :
  /// String identifier used to separate sections of the execution logs uploaded
  /// to S3.
  Future<GetManagedEndpointSessionCredentialsResponse>
      getManagedEndpointSessionCredentials({
    required String credentialType,
    required String endpointIdentifier,
    required String executionRoleArn,
    required String virtualClusterIdentifier,
    String? clientToken,
    int? durationInSeconds,
    String? logContext,
  }) async {
    final $payload = <String, dynamic>{
      'credentialType': credentialType,
      'executionRoleArn': executionRoleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (durationInSeconds != null) 'durationInSeconds': durationInSeconds,
      if (logContext != null) 'logContext': logContext,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/virtualclusters/${Uri.encodeComponent(virtualClusterIdentifier)}/endpoints/${Uri.encodeComponent(endpointIdentifier)}/credentials',
      exceptionFnMap: _exceptionFns,
    );
    return GetManagedEndpointSessionCredentialsResponse.fromJson(response);
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

  /// Lists job templates based on a set of parameters. Job template stores
  /// values of StartJobRun API request in a template and can be used to start a
  /// job run. Job template allows two use cases: avoid repeating recurring
  /// StartJobRun API request values, enforcing certain values in StartJobRun
  /// API request.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [createdAfter] :
  /// The date and time after which the job templates were created.
  ///
  /// Parameter [createdBefore] :
  /// The date and time before which the job templates were created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of job templates that can be listed.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of job templates to return.
  Future<ListJobTemplatesResponse> listJobTemplates({
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobtemplates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobTemplatesResponse.fromJson(response);
  }

  /// Lists managed endpoints based on a set of parameters. A managed endpoint
  /// is a gateway that connects Amazon EMR Studio to Amazon EMR on EKS so that
  /// Amazon EMR Studio can communicate with your virtual cluster.
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

  /// Lists security configurations based on a set of parameters. Security
  /// configurations in Amazon EMR on EKS are templates for different security
  /// setups. You can use security configurations to configure the Lake
  /// Formation integration setup. You can also create a security configuration
  /// to re-use a security setup each time you create a virtual cluster.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [createdAfter] :
  /// The date and time after which the security configuration was created.
  ///
  /// Parameter [createdBefore] :
  /// The date and time before which the security configuration was created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of security configurations the operation can list.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of security configurations to return.
  Future<ListSecurityConfigurationsResponse> listSecurityConfigurations({
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/securityconfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityConfigurationsResponse.fromJson(response);
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
  /// The container provider type of the virtual cluster. Amazon EKS is the only
  /// supported type as of now.
  ///
  /// Parameter [createdAfter] :
  /// The date and time after which the virtual clusters are created.
  ///
  /// Parameter [createdBefore] :
  /// The date and time before which the virtual clusters are created.
  ///
  /// Parameter [eksAccessEntryIntegrated] :
  /// Optional Boolean that specifies whether the operation should return the
  /// virtual clusters that have the access entry integration enabled or
  /// disabled. If not specified, the operation returns all applicable virtual
  /// clusters.
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
    bool? eksAccessEntryIntegrated,
    int? maxResults,
    String? nextToken,
    List<VirtualClusterState>? states,
  }) async {
    final $query = <String, List<String>>{
      if (containerProviderId != null)
        'containerProviderId': [containerProviderId],
      if (containerProviderType != null)
        'containerProviderType': [containerProviderType.toValue()],
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (eksAccessEntryIntegrated != null)
        'eksAccessEntryIntegrated': [eksAccessEntryIntegrated.toString()],
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
  /// Parameter [virtualClusterId] :
  /// The virtual cluster ID for which the job run request is submitted.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token of the job run request.
  ///
  /// Parameter [configurationOverrides] :
  /// The configuration overrides for the job run.
  ///
  /// Parameter [executionRoleArn] :
  /// The execution role ARN for the job run.
  ///
  /// Parameter [jobDriver] :
  /// The job driver for the job run.
  ///
  /// Parameter [jobTemplateId] :
  /// The job template ID to be used to start the job run.
  ///
  /// Parameter [jobTemplateParameters] :
  /// The values of job template parameters to start a job run.
  ///
  /// Parameter [name] :
  /// The name of the job run.
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release version to use for the job run.
  ///
  /// Parameter [retryPolicyConfiguration] :
  /// The retry policy configuration for the job run.
  ///
  /// Parameter [tags] :
  /// The tags assigned to job runs.
  Future<StartJobRunResponse> startJobRun({
    required String virtualClusterId,
    String? clientToken,
    ConfigurationOverrides? configurationOverrides,
    String? executionRoleArn,
    JobDriver? jobDriver,
    String? jobTemplateId,
    Map<String, String>? jobTemplateParameters,
    String? name,
    String? releaseLabel,
    RetryPolicyConfiguration? retryPolicyConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (jobDriver != null) 'jobDriver': jobDriver,
      if (jobTemplateId != null) 'jobTemplateId': jobTemplateId,
      if (jobTemplateParameters != null)
        'jobTemplateParameters': jobTemplateParameters,
      if (name != null) 'name': name,
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (retryPolicyConfiguration != null)
        'retryPolicyConfiguration': retryPolicyConfiguration,
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

  /// Assigns tags to resources. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key and an optional value,
  /// both of which you define. Tags enable you to categorize your Amazon Web
  /// Services resources by attributes such as purpose, owner, or environment.
  /// When you have many resources of the same type, you can quickly identify a
  /// specific resource based on the tags you've assigned to it. For example,
  /// you can define a set of tags for your Amazon EMR on EKS clusters to help
  /// you track each cluster's owner and stack level. We recommend that you
  /// devise a consistent set of tag keys for each resource type. You can then
  /// search and filter the resources based on the tags that you add.
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

/// Authorization-related configuration inputs for the security configuration.
class AuthorizationConfiguration {
  /// Encryption-related configuration input for the security configuration.
  final EncryptionConfiguration? encryptionConfiguration;

  /// Lake Formation related configuration inputs for the security configuration.
  final LakeFormationConfiguration? lakeFormationConfiguration;

  AuthorizationConfiguration({
    this.encryptionConfiguration,
    this.lakeFormationConfiguration,
  });

  factory AuthorizationConfiguration.fromJson(Map<String, dynamic> json) {
    return AuthorizationConfiguration(
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      lakeFormationConfiguration: json['lakeFormationConfiguration'] != null
          ? LakeFormationConfiguration.fromJson(
              json['lakeFormationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    final lakeFormationConfiguration = this.lakeFormationConfiguration;
    return {
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (lakeFormationConfiguration != null)
        'lakeFormationConfiguration': lakeFormationConfiguration,
    };
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

/// The entity representing certificate data generated for managed endpoint.
class Certificate {
  /// The ARN of the certificate generated for managed endpoint.
  final String? certificateArn;

  /// The base64 encoded PEM certificate data generated for managed endpoint.
  final String? certificateData;

  Certificate({
    this.certificateArn,
    this.certificateData,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      certificateArn: json['certificateArn'] as String?,
      certificateData: json['certificateData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateData = this.certificateData;
    return {
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (certificateData != null) 'certificateData': certificateData,
    };
  }
}

enum CertificateProviderType {
  pem,
}

extension CertificateProviderTypeValueExtension on CertificateProviderType {
  String toValue() {
    switch (this) {
      case CertificateProviderType.pem:
        return 'PEM';
    }
  }
}

extension CertificateProviderTypeFromString on String {
  CertificateProviderType toCertificateProviderType() {
    switch (this) {
      case 'PEM':
        return CertificateProviderType.pem;
    }
    throw Exception('$this is not known in enum CertificateProviderType');
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
  /// The information about the Amazon EKS cluster.
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

/// The settings for container log rotation.
class ContainerLogRotationConfiguration {
  /// The number of files to keep in container after rotation.
  final int maxFilesToKeep;

  /// The file size at which to rotate logs. Minimum of 2KB, Maximum of 2GB.
  final String rotationSize;

  ContainerLogRotationConfiguration({
    required this.maxFilesToKeep,
    required this.rotationSize,
  });

  factory ContainerLogRotationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ContainerLogRotationConfiguration(
      maxFilesToKeep: json['maxFilesToKeep'] as int,
      rotationSize: json['rotationSize'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final maxFilesToKeep = this.maxFilesToKeep;
    final rotationSize = this.rotationSize;
    return {
      'maxFilesToKeep': maxFilesToKeep,
      'rotationSize': rotationSize,
    };
  }
}

/// The information about the container provider.
class ContainerProvider {
  /// The ID of the container cluster.
  final String id;

  /// The type of the container provider. Amazon EKS is the only supported type as
  /// of now.
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

extension ContainerProviderTypeValueExtension on ContainerProviderType {
  String toValue() {
    switch (this) {
      case ContainerProviderType.eks:
        return 'EKS';
    }
  }
}

extension ContainerProviderTypeFromString on String {
  ContainerProviderType toContainerProviderType() {
    switch (this) {
      case 'EKS':
        return ContainerProviderType.eks;
    }
    throw Exception('$this is not known in enum ContainerProviderType');
  }
}

class CreateJobTemplateResponse {
  /// This output display the ARN of the created job template.
  final String? arn;

  /// This output displays the date and time when the job template was created.
  final DateTime? createdAt;

  /// This output display the created job template ID.
  final String? id;

  /// This output displays the name of the created job template.
  final String? name;

  CreateJobTemplateResponse({
    this.arn,
    this.createdAt,
    this.id,
    this.name,
  });

  factory CreateJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobTemplateResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
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

class CreateSecurityConfigurationResponse {
  /// The ARN (Amazon Resource Name) of the security configuration.
  final String? arn;

  /// The ID of the security configuration.
  final String? id;

  /// The name of the security configuration.
  final String? name;

  CreateSecurityConfigurationResponse({
    this.arn,
    this.id,
    this.name,
  });

  factory CreateSecurityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSecurityConfigurationResponse(
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

/// The structure containing the session token being returned.
class Credentials {
  /// The actual session token being returned.
  final String? token;

  Credentials({
    this.token,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    return {
      if (token != null) 'token': token,
    };
  }
}

class DeleteJobTemplateResponse {
  /// This output contains the ID of the job template that was deleted.
  final String? id;

  DeleteJobTemplateResponse({
    this.id,
  });

  factory DeleteJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DeleteJobTemplateResponse(
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

class DescribeJobTemplateResponse {
  /// This output displays information about the specified job template.
  final JobTemplate? jobTemplate;

  DescribeJobTemplateResponse({
    this.jobTemplate,
  });

  factory DescribeJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobTemplateResponse(
      jobTemplate: json['jobTemplate'] != null
          ? JobTemplate.fromJson(json['jobTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobTemplate = this.jobTemplate;
    return {
      if (jobTemplate != null) 'jobTemplate': jobTemplate,
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

class DescribeSecurityConfigurationResponse {
  /// Details of the security configuration.
  final SecurityConfiguration? securityConfiguration;

  DescribeSecurityConfigurationResponse({
    this.securityConfiguration,
  });

  factory DescribeSecurityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSecurityConfigurationResponse(
      securityConfiguration: json['securityConfiguration'] != null
          ? SecurityConfiguration.fromJson(
              json['securityConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityConfiguration = this.securityConfiguration;
    return {
      if (securityConfiguration != null)
        'securityConfiguration': securityConfiguration,
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

/// The information about the Amazon EKS cluster.
class EksInfo {
  /// The namespaces of the Amazon EKS cluster.
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

/// Configurations related to encryption for the security configuration.
class EncryptionConfiguration {
  /// In-transit encryption-related input for the security configuration.
  final InTransitEncryptionConfiguration? inTransitEncryptionConfiguration;

  EncryptionConfiguration({
    this.inTransitEncryptionConfiguration,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      inTransitEncryptionConfiguration:
          json['inTransitEncryptionConfiguration'] != null
              ? InTransitEncryptionConfiguration.fromJson(
                  json['inTransitEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inTransitEncryptionConfiguration =
        this.inTransitEncryptionConfiguration;
    return {
      if (inTransitEncryptionConfiguration != null)
        'inTransitEncryptionConfiguration': inTransitEncryptionConfiguration,
    };
  }
}

/// This entity represents the endpoint that is managed by Amazon EMR on EKS.
class Endpoint {
  /// The ARN of the endpoint.
  final String? arn;

  /// The certificate ARN of the endpoint. This field is under deprecation and
  /// will be removed in future.
  final String? certificateArn;

  /// The certificate generated by emr control plane on customer behalf to secure
  /// the managed endpoint.
  final Certificate? certificateAuthority;

  /// The configuration settings that are used to override existing configurations
  /// for endpoints.
  final ConfigurationOverrides? configurationOverrides;

  /// The date and time when the endpoint was created.
  final DateTime? createdAt;

  /// The execution role ARN of the endpoint.
  final String? executionRoleArn;

  /// The reasons why the endpoint has failed.
  final FailureReason? failureReason;

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

  /// Additional details of the endpoint state.
  final String? stateDetails;

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
    this.certificateAuthority,
    this.configurationOverrides,
    this.createdAt,
    this.executionRoleArn,
    this.failureReason,
    this.id,
    this.name,
    this.releaseLabel,
    this.securityGroup,
    this.serverUrl,
    this.state,
    this.stateDetails,
    this.subnetIds,
    this.tags,
    this.type,
    this.virtualClusterId,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      arn: json['arn'] as String?,
      certificateArn: json['certificateArn'] as String?,
      certificateAuthority: json['certificateAuthority'] != null
          ? Certificate.fromJson(
              json['certificateAuthority'] as Map<String, dynamic>)
          : null,
      configurationOverrides: json['configurationOverrides'] != null
          ? ConfigurationOverrides.fromJson(
              json['configurationOverrides'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      executionRoleArn: json['executionRoleArn'] as String?,
      failureReason: (json['failureReason'] as String?)?.toFailureReason(),
      id: json['id'] as String?,
      name: json['name'] as String?,
      releaseLabel: json['releaseLabel'] as String?,
      securityGroup: json['securityGroup'] as String?,
      serverUrl: json['serverUrl'] as String?,
      state: (json['state'] as String?)?.toEndpointState(),
      stateDetails: json['stateDetails'] as String?,
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
    final certificateAuthority = this.certificateAuthority;
    final configurationOverrides = this.configurationOverrides;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final failureReason = this.failureReason;
    final id = this.id;
    final name = this.name;
    final releaseLabel = this.releaseLabel;
    final securityGroup = this.securityGroup;
    final serverUrl = this.serverUrl;
    final state = this.state;
    final stateDetails = this.stateDetails;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final type = this.type;
    final virtualClusterId = this.virtualClusterId;
    return {
      if (arn != null) 'arn': arn,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (certificateAuthority != null)
        'certificateAuthority': certificateAuthority,
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (failureReason != null) 'failureReason': failureReason.toValue(),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (securityGroup != null) 'securityGroup': securityGroup,
      if (serverUrl != null) 'serverUrl': serverUrl,
      if (state != null) 'state': state.toValue(),
      if (stateDetails != null) 'stateDetails': stateDetails,
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

extension EndpointStateValueExtension on EndpointState {
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

extension EndpointStateFromString on String {
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

extension FailureReasonValueExtension on FailureReason {
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

extension FailureReasonFromString on String {
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

class GetManagedEndpointSessionCredentialsResponse {
  /// The structure containing the session credentials.
  final Credentials? credentials;

  /// The date and time when the session token will expire.
  final DateTime? expiresAt;

  /// The identifier of the session token returned.
  final String? id;

  GetManagedEndpointSessionCredentialsResponse({
    this.credentials,
    this.expiresAt,
    this.id,
  });

  factory GetManagedEndpointSessionCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetManagedEndpointSessionCredentialsResponse(
      credentials: json['credentials'] != null
          ? Credentials.fromJson(json['credentials'] as Map<String, dynamic>)
          : null,
      expiresAt: timeStampFromJson(json['expiresAt']),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final expiresAt = this.expiresAt;
    final id = this.id;
    return {
      if (credentials != null) 'credentials': credentials,
      if (expiresAt != null) 'expiresAt': iso8601ToJson(expiresAt),
      if (id != null) 'id': id,
    };
  }
}

/// Configurations related to in-transit encryption for the security
/// configuration.
class InTransitEncryptionConfiguration {
  /// TLS certificate-related configuration input for the security configuration.
  final TLSCertificateConfiguration? tlsCertificateConfiguration;

  InTransitEncryptionConfiguration({
    this.tlsCertificateConfiguration,
  });

  factory InTransitEncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return InTransitEncryptionConfiguration(
      tlsCertificateConfiguration: json['tlsCertificateConfiguration'] != null
          ? TLSCertificateConfiguration.fromJson(
              json['tlsCertificateConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tlsCertificateConfiguration = this.tlsCertificateConfiguration;
    return {
      if (tlsCertificateConfiguration != null)
        'tlsCertificateConfiguration': tlsCertificateConfiguration,
    };
  }
}

/// Specify the driver that the job runs on. Exactly one of the two available
/// job drivers is required, either sparkSqlJobDriver or sparkSubmitJobDriver.
class JobDriver {
  /// The job driver for job type.
  final SparkSqlJobDriver? sparkSqlJobDriver;

  /// The job driver parameters specified for spark submit.
  final SparkSubmitJobDriver? sparkSubmitJobDriver;

  JobDriver({
    this.sparkSqlJobDriver,
    this.sparkSubmitJobDriver,
  });

  factory JobDriver.fromJson(Map<String, dynamic> json) {
    return JobDriver(
      sparkSqlJobDriver: json['sparkSqlJobDriver'] != null
          ? SparkSqlJobDriver.fromJson(
              json['sparkSqlJobDriver'] as Map<String, dynamic>)
          : null,
      sparkSubmitJobDriver: json['sparkSubmitJobDriver'] != null
          ? SparkSubmitJobDriver.fromJson(
              json['sparkSubmitJobDriver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sparkSqlJobDriver = this.sparkSqlJobDriver;
    final sparkSubmitJobDriver = this.sparkSubmitJobDriver;
    return {
      if (sparkSqlJobDriver != null) 'sparkSqlJobDriver': sparkSqlJobDriver,
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

  /// The configuration of the retry policy that the job runs on.
  final RetryPolicyConfiguration? retryPolicyConfiguration;

  /// The current status of the retry policy executed on the job.
  final RetryPolicyExecution? retryPolicyExecution;

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
    this.retryPolicyConfiguration,
    this.retryPolicyExecution,
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
      retryPolicyConfiguration: json['retryPolicyConfiguration'] != null
          ? RetryPolicyConfiguration.fromJson(
              json['retryPolicyConfiguration'] as Map<String, dynamic>)
          : null,
      retryPolicyExecution: json['retryPolicyExecution'] != null
          ? RetryPolicyExecution.fromJson(
              json['retryPolicyExecution'] as Map<String, dynamic>)
          : null,
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
    final retryPolicyConfiguration = this.retryPolicyConfiguration;
    final retryPolicyExecution = this.retryPolicyExecution;
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
      if (retryPolicyConfiguration != null)
        'retryPolicyConfiguration': retryPolicyConfiguration,
      if (retryPolicyExecution != null)
        'retryPolicyExecution': retryPolicyExecution,
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

extension JobRunStateValueExtension on JobRunState {
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

extension JobRunStateFromString on String {
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

/// This entity describes a job template. Job template stores values of
/// StartJobRun API request in a template and can be used to start a job run.
/// Job template allows two use cases: avoid repeating recurring StartJobRun API
/// request values, enforcing certain values in StartJobRun API request.
class JobTemplate {
  /// The job template data which holds values of StartJobRun API request.
  final JobTemplateData jobTemplateData;

  /// The ARN of the job template.
  final String? arn;

  /// The date and time when the job template was created.
  final DateTime? createdAt;

  /// The user who created the job template.
  final String? createdBy;

  /// The error message in case the decryption of job template fails.
  final String? decryptionError;

  /// The ID of the job template.
  final String? id;

  /// The KMS key ARN used to encrypt the job template.
  final String? kmsKeyArn;

  /// The name of the job template.
  final String? name;

  /// The tags assigned to the job template.
  final Map<String, String>? tags;

  JobTemplate({
    required this.jobTemplateData,
    this.arn,
    this.createdAt,
    this.createdBy,
    this.decryptionError,
    this.id,
    this.kmsKeyArn,
    this.name,
    this.tags,
  });

  factory JobTemplate.fromJson(Map<String, dynamic> json) {
    return JobTemplate(
      jobTemplateData: JobTemplateData.fromJson(
          json['jobTemplateData'] as Map<String, dynamic>),
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      decryptionError: json['decryptionError'] as String?,
      id: json['id'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final jobTemplateData = this.jobTemplateData;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final decryptionError = this.decryptionError;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final name = this.name;
    final tags = this.tags;
    return {
      'jobTemplateData': jobTemplateData,
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (decryptionError != null) 'decryptionError': decryptionError,
      if (id != null) 'id': id,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The values of StartJobRun API requests used in job runs started using the
/// job template.
class JobTemplateData {
  /// The execution role ARN of the job run.
  final String executionRoleArn;
  final JobDriver jobDriver;

  /// The release version of Amazon EMR.
  final String releaseLabel;

  /// The configuration settings that are used to override defaults configuration.
  final ParametricConfigurationOverrides? configurationOverrides;

  /// The tags assigned to jobs started using the job template.
  final Map<String, String>? jobTags;

  /// The configuration of parameters existing in the job template.
  final Map<String, TemplateParameterConfiguration>? parameterConfiguration;

  JobTemplateData({
    required this.executionRoleArn,
    required this.jobDriver,
    required this.releaseLabel,
    this.configurationOverrides,
    this.jobTags,
    this.parameterConfiguration,
  });

  factory JobTemplateData.fromJson(Map<String, dynamic> json) {
    return JobTemplateData(
      executionRoleArn: json['executionRoleArn'] as String,
      jobDriver: JobDriver.fromJson(json['jobDriver'] as Map<String, dynamic>),
      releaseLabel: json['releaseLabel'] as String,
      configurationOverrides: json['configurationOverrides'] != null
          ? ParametricConfigurationOverrides.fromJson(
              json['configurationOverrides'] as Map<String, dynamic>)
          : null,
      jobTags: (json['jobTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      parameterConfiguration:
          (json['parameterConfiguration'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k,
                  TemplateParameterConfiguration.fromJson(
                      e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final executionRoleArn = this.executionRoleArn;
    final jobDriver = this.jobDriver;
    final releaseLabel = this.releaseLabel;
    final configurationOverrides = this.configurationOverrides;
    final jobTags = this.jobTags;
    final parameterConfiguration = this.parameterConfiguration;
    return {
      'executionRoleArn': executionRoleArn,
      'jobDriver': jobDriver,
      'releaseLabel': releaseLabel,
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (jobTags != null) 'jobTags': jobTags,
      if (parameterConfiguration != null)
        'parameterConfiguration': parameterConfiguration,
    };
  }
}

/// Lake Formation related configuration inputs for the security configuration.
class LakeFormationConfiguration {
  /// The session tag to authorize Amazon EMR on EKS for API calls to Lake
  /// Formation.
  final String? authorizedSessionTagValue;

  /// The query engine IAM role ARN that is tied to the secure Spark job. The
  /// <code>QueryEngine</code> role assumes the <code>JobExecutionRole</code> to
  /// execute all the Lake Formation calls.
  final String? queryEngineRoleArn;

  /// The namespace input of the system job.
  final SecureNamespaceInfo? secureNamespaceInfo;

  LakeFormationConfiguration({
    this.authorizedSessionTagValue,
    this.queryEngineRoleArn,
    this.secureNamespaceInfo,
  });

  factory LakeFormationConfiguration.fromJson(Map<String, dynamic> json) {
    return LakeFormationConfiguration(
      authorizedSessionTagValue: json['authorizedSessionTagValue'] as String?,
      queryEngineRoleArn: json['queryEngineRoleArn'] as String?,
      secureNamespaceInfo: json['secureNamespaceInfo'] != null
          ? SecureNamespaceInfo.fromJson(
              json['secureNamespaceInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedSessionTagValue = this.authorizedSessionTagValue;
    final queryEngineRoleArn = this.queryEngineRoleArn;
    final secureNamespaceInfo = this.secureNamespaceInfo;
    return {
      if (authorizedSessionTagValue != null)
        'authorizedSessionTagValue': authorizedSessionTagValue,
      if (queryEngineRoleArn != null) 'queryEngineRoleArn': queryEngineRoleArn,
      if (secureNamespaceInfo != null)
        'secureNamespaceInfo': secureNamespaceInfo,
    };
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

class ListJobTemplatesResponse {
  /// This output displays the token for the next set of job templates.
  final String? nextToken;

  /// This output lists information about the specified job templates.
  final List<JobTemplate>? templates;

  ListJobTemplatesResponse({
    this.nextToken,
    this.templates,
  });

  factory ListJobTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListJobTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      templates: (json['templates'] as List?)
          ?.whereNotNull()
          .map((e) => JobTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final templates = this.templates;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (templates != null) 'templates': templates,
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

class ListSecurityConfigurationsResponse {
  /// The token for the next set of security configurations to return.
  final String? nextToken;

  /// The list of returned security configurations.
  final List<SecurityConfiguration>? securityConfigurations;

  ListSecurityConfigurationsResponse({
    this.nextToken,
    this.securityConfigurations,
  });

  factory ListSecurityConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSecurityConfigurationsResponse(
      nextToken: json['nextToken'] as String?,
      securityConfigurations: (json['securityConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => SecurityConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityConfigurations = this.securityConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (securityConfigurations != null)
        'securityConfigurations': securityConfigurations,
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

  /// Enable or disable container log rotation.
  final ContainerLogRotationConfiguration? containerLogRotationConfiguration;

  /// Monitoring configurations for the persistent application UI.
  final PersistentAppUI? persistentAppUI;

  /// Amazon S3 configuration for monitoring log publishing.
  final S3MonitoringConfiguration? s3MonitoringConfiguration;

  MonitoringConfiguration({
    this.cloudWatchMonitoringConfiguration,
    this.containerLogRotationConfiguration,
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
      containerLogRotationConfiguration:
          json['containerLogRotationConfiguration'] != null
              ? ContainerLogRotationConfiguration.fromJson(
                  json['containerLogRotationConfiguration']
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
    final containerLogRotationConfiguration =
        this.containerLogRotationConfiguration;
    final persistentAppUI = this.persistentAppUI;
    final s3MonitoringConfiguration = this.s3MonitoringConfiguration;
    return {
      if (cloudWatchMonitoringConfiguration != null)
        'cloudWatchMonitoringConfiguration': cloudWatchMonitoringConfiguration,
      if (containerLogRotationConfiguration != null)
        'containerLogRotationConfiguration': containerLogRotationConfiguration,
      if (persistentAppUI != null) 'persistentAppUI': persistentAppUI.toValue(),
      if (s3MonitoringConfiguration != null)
        's3MonitoringConfiguration': s3MonitoringConfiguration,
    };
  }
}

/// A configuration for CloudWatch monitoring. You can configure your jobs to
/// send log information to CloudWatch Logs. This data type allows job template
/// parameters to be specified within.
class ParametricCloudWatchMonitoringConfiguration {
  /// The name of the log group for log publishing.
  final String? logGroupName;

  /// The specified name prefix for log streams.
  final String? logStreamNamePrefix;

  ParametricCloudWatchMonitoringConfiguration({
    this.logGroupName,
    this.logStreamNamePrefix,
  });

  factory ParametricCloudWatchMonitoringConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ParametricCloudWatchMonitoringConfiguration(
      logGroupName: json['logGroupName'] as String?,
      logStreamNamePrefix: json['logStreamNamePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final logStreamNamePrefix = this.logStreamNamePrefix;
    return {
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (logStreamNamePrefix != null)
        'logStreamNamePrefix': logStreamNamePrefix,
    };
  }
}

/// A configuration specification to be used to override existing
/// configurations. This data type allows job template parameters to be
/// specified within.
class ParametricConfigurationOverrides {
  /// The configurations for the application running by the job run.
  final List<Configuration>? applicationConfiguration;

  /// The configurations for monitoring.
  final ParametricMonitoringConfiguration? monitoringConfiguration;

  ParametricConfigurationOverrides({
    this.applicationConfiguration,
    this.monitoringConfiguration,
  });

  factory ParametricConfigurationOverrides.fromJson(Map<String, dynamic> json) {
    return ParametricConfigurationOverrides(
      applicationConfiguration: (json['applicationConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      monitoringConfiguration: json['monitoringConfiguration'] != null
          ? ParametricMonitoringConfiguration.fromJson(
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

/// Configuration setting for monitoring. This data type allows job template
/// parameters to be specified within.
class ParametricMonitoringConfiguration {
  /// Monitoring configurations for CloudWatch.
  final ParametricCloudWatchMonitoringConfiguration?
      cloudWatchMonitoringConfiguration;

  /// Monitoring configurations for the persistent application UI.
  final String? persistentAppUI;

  /// Amazon S3 configuration for monitoring log publishing.
  final ParametricS3MonitoringConfiguration? s3MonitoringConfiguration;

  ParametricMonitoringConfiguration({
    this.cloudWatchMonitoringConfiguration,
    this.persistentAppUI,
    this.s3MonitoringConfiguration,
  });

  factory ParametricMonitoringConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ParametricMonitoringConfiguration(
      cloudWatchMonitoringConfiguration:
          json['cloudWatchMonitoringConfiguration'] != null
              ? ParametricCloudWatchMonitoringConfiguration.fromJson(
                  json['cloudWatchMonitoringConfiguration']
                      as Map<String, dynamic>)
              : null,
      persistentAppUI: json['persistentAppUI'] as String?,
      s3MonitoringConfiguration: json['s3MonitoringConfiguration'] != null
          ? ParametricS3MonitoringConfiguration.fromJson(
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
      if (persistentAppUI != null) 'persistentAppUI': persistentAppUI,
      if (s3MonitoringConfiguration != null)
        's3MonitoringConfiguration': s3MonitoringConfiguration,
    };
  }
}

/// Amazon S3 configuration for monitoring log publishing. You can configure
/// your jobs to send log information to Amazon S3. This data type allows job
/// template parameters to be specified within.
class ParametricS3MonitoringConfiguration {
  /// Amazon S3 destination URI for log publishing.
  final String? logUri;

  ParametricS3MonitoringConfiguration({
    this.logUri,
  });

  factory ParametricS3MonitoringConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ParametricS3MonitoringConfiguration(
      logUri: json['logUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logUri = this.logUri;
    return {
      if (logUri != null) 'logUri': logUri,
    };
  }
}

enum PersistentAppUI {
  enabled,
  disabled,
}

extension PersistentAppUIValueExtension on PersistentAppUI {
  String toValue() {
    switch (this) {
      case PersistentAppUI.enabled:
        return 'ENABLED';
      case PersistentAppUI.disabled:
        return 'DISABLED';
    }
  }
}

extension PersistentAppUIFromString on String {
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

/// The configuration of the retry policy that the job runs on.
class RetryPolicyConfiguration {
  /// The maximum number of attempts on the job's driver.
  final int maxAttempts;

  RetryPolicyConfiguration({
    required this.maxAttempts,
  });

  factory RetryPolicyConfiguration.fromJson(Map<String, dynamic> json) {
    return RetryPolicyConfiguration(
      maxAttempts: json['maxAttempts'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxAttempts = this.maxAttempts;
    return {
      'maxAttempts': maxAttempts,
    };
  }
}

/// The current status of the retry policy executed on the job.
class RetryPolicyExecution {
  /// The current number of attempts made on the driver of the job.
  final int currentAttemptCount;

  RetryPolicyExecution({
    required this.currentAttemptCount,
  });

  factory RetryPolicyExecution.fromJson(Map<String, dynamic> json) {
    return RetryPolicyExecution(
      currentAttemptCount: json['currentAttemptCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final currentAttemptCount = this.currentAttemptCount;
    return {
      'currentAttemptCount': currentAttemptCount,
    };
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

/// Namespace inputs for the system job.
class SecureNamespaceInfo {
  /// The ID of the Amazon EKS cluster where Amazon EMR on EKS jobs run.
  final String? clusterId;

  /// The namespace of the Amazon EKS cluster where the system jobs run.
  final String? namespace;

  SecureNamespaceInfo({
    this.clusterId,
    this.namespace,
  });

  factory SecureNamespaceInfo.fromJson(Map<String, dynamic> json) {
    return SecureNamespaceInfo(
      clusterId: json['clusterId'] as String?,
      namespace: json['namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterId = this.clusterId;
    final namespace = this.namespace;
    return {
      if (clusterId != null) 'clusterId': clusterId,
      if (namespace != null) 'namespace': namespace,
    };
  }
}

/// Inputs related to the security configuration. Security configurations in
/// Amazon EMR on EKS are templates for different security setups. You can use
/// security configurations to configure the Lake Formation integration setup.
/// You can also create a security configuration to re-use a security setup each
/// time you create a virtual cluster.
class SecurityConfiguration {
  /// The ARN (Amazon Resource Name) of the security configuration.
  final String? arn;

  /// The date and time that the job run was created.
  final DateTime? createdAt;

  /// The user who created the job run.
  final String? createdBy;

  /// The ID of the security configuration.
  final String? id;

  /// The name of the security configuration.
  final String? name;

  /// Security configuration inputs for the request.
  final SecurityConfigurationData? securityConfigurationData;

  /// The tags to assign to the security configuration.
  final Map<String, String>? tags;

  SecurityConfiguration({
    this.arn,
    this.createdAt,
    this.createdBy,
    this.id,
    this.name,
    this.securityConfigurationData,
    this.tags,
  });

  factory SecurityConfiguration.fromJson(Map<String, dynamic> json) {
    return SecurityConfiguration(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      securityConfigurationData: json['securityConfigurationData'] != null
          ? SecurityConfigurationData.fromJson(
              json['securityConfigurationData'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final id = this.id;
    final name = this.name;
    final securityConfigurationData = this.securityConfigurationData;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (securityConfigurationData != null)
        'securityConfigurationData': securityConfigurationData,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Configurations related to the security configuration for the request.
class SecurityConfigurationData {
  /// Authorization-related configuration input for the security configuration.
  final AuthorizationConfiguration? authorizationConfiguration;

  SecurityConfigurationData({
    this.authorizationConfiguration,
  });

  factory SecurityConfigurationData.fromJson(Map<String, dynamic> json) {
    return SecurityConfigurationData(
      authorizationConfiguration: json['authorizationConfiguration'] != null
          ? AuthorizationConfiguration.fromJson(
              json['authorizationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationConfiguration = this.authorizationConfiguration;
    return {
      if (authorizationConfiguration != null)
        'authorizationConfiguration': authorizationConfiguration,
    };
  }
}

/// The job driver for job type.
class SparkSqlJobDriver {
  /// The SQL file to be executed.
  final String? entryPoint;

  /// The Spark parameters to be included in the Spark SQL command.
  final String? sparkSqlParameters;

  SparkSqlJobDriver({
    this.entryPoint,
    this.sparkSqlParameters,
  });

  factory SparkSqlJobDriver.fromJson(Map<String, dynamic> json) {
    return SparkSqlJobDriver(
      entryPoint: json['entryPoint'] as String?,
      sparkSqlParameters: json['sparkSqlParameters'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entryPoint = this.entryPoint;
    final sparkSqlParameters = this.sparkSqlParameters;
    return {
      if (entryPoint != null) 'entryPoint': entryPoint,
      if (sparkSqlParameters != null) 'sparkSqlParameters': sparkSqlParameters,
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

/// Configurations related to the TLS certificate for the security
/// configuration.
class TLSCertificateConfiguration {
  /// The TLS certificate type. Acceptable values: <code>PEM</code> or
  /// <code>Custom</code>.
  final CertificateProviderType? certificateProviderType;

  /// Secrets Manager ARN that contains the private TLS certificate contents, used
  /// for communication between the user job and the system job.
  final String? privateCertificateSecretArn;

  /// Secrets Manager ARN that contains the public TLS certificate contents, used
  /// for communication between the user job and the system job.
  final String? publicCertificateSecretArn;

  TLSCertificateConfiguration({
    this.certificateProviderType,
    this.privateCertificateSecretArn,
    this.publicCertificateSecretArn,
  });

  factory TLSCertificateConfiguration.fromJson(Map<String, dynamic> json) {
    return TLSCertificateConfiguration(
      certificateProviderType: (json['certificateProviderType'] as String?)
          ?.toCertificateProviderType(),
      privateCertificateSecretArn:
          json['privateCertificateSecretArn'] as String?,
      publicCertificateSecretArn: json['publicCertificateSecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateProviderType = this.certificateProviderType;
    final privateCertificateSecretArn = this.privateCertificateSecretArn;
    final publicCertificateSecretArn = this.publicCertificateSecretArn;
    return {
      if (certificateProviderType != null)
        'certificateProviderType': certificateProviderType.toValue(),
      if (privateCertificateSecretArn != null)
        'privateCertificateSecretArn': privateCertificateSecretArn,
      if (publicCertificateSecretArn != null)
        'publicCertificateSecretArn': publicCertificateSecretArn,
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

/// The configuration of a job template parameter.
class TemplateParameterConfiguration {
  /// The default value for the job template parameter.
  final String? defaultValue;

  /// The type of the job template parameter. Allowed values are: ‘STRING’,
  /// ‘NUMBER’.
  final TemplateParameterDataType? type;

  TemplateParameterConfiguration({
    this.defaultValue,
    this.type,
  });

  factory TemplateParameterConfiguration.fromJson(Map<String, dynamic> json) {
    return TemplateParameterConfiguration(
      defaultValue: json['defaultValue'] as String?,
      type: (json['type'] as String?)?.toTemplateParameterDataType(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final type = this.type;
    return {
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum TemplateParameterDataType {
  number,
  string,
}

extension TemplateParameterDataTypeValueExtension on TemplateParameterDataType {
  String toValue() {
    switch (this) {
      case TemplateParameterDataType.number:
        return 'NUMBER';
      case TemplateParameterDataType.string:
        return 'STRING';
    }
  }
}

extension TemplateParameterDataTypeFromString on String {
  TemplateParameterDataType toTemplateParameterDataType() {
    switch (this) {
      case 'NUMBER':
        return TemplateParameterDataType.number;
      case 'STRING':
        return TemplateParameterDataType.string;
    }
    throw Exception('$this is not known in enum TemplateParameterDataType');
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
/// one namespace on an Amazon EKS cluster. Virtual clusters do not create any
/// active resources that contribute to your bill or that require lifecycle
/// management outside the service.
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

  /// The ID of the security configuration.
  final String? securityConfigurationId;

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
    this.securityConfigurationId,
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
      securityConfigurationId: json['securityConfigurationId'] as String?,
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
    final securityConfigurationId = this.securityConfigurationId;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (containerProvider != null) 'containerProvider': containerProvider,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (securityConfigurationId != null)
        'securityConfigurationId': securityConfigurationId,
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

extension VirtualClusterStateValueExtension on VirtualClusterState {
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

extension VirtualClusterStateFromString on String {
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

class EKSRequestThrottledException extends _s.GenericAwsException {
  EKSRequestThrottledException({String? type, String? message})
      : super(
            type: type, code: 'EKSRequestThrottledException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class RequestThrottledException extends _s.GenericAwsException {
  RequestThrottledException({String? type, String? message})
      : super(type: type, code: 'RequestThrottledException', message: message);
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
  'EKSRequestThrottledException': (type, message) =>
      EKSRequestThrottledException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'RequestThrottledException': (type, message) =>
      RequestThrottledException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
