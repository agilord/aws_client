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

/// This section contains the Amazon Managed Workflows for Apache Airflow (MWAA)
/// API reference documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html">What
/// Is Amazon MWAA?</a>.
class Mwaa {
  final _s.RestJsonProtocol _protocol;
  Mwaa({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'airflow',
            signingName: 'airflow',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Create a CLI token to use Airflow CLI.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// Create a CLI token request for a MWAA environment.
  Future<CreateCliTokenResponse> createCliToken({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/clitoken/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCliTokenResponse.fromJson(response);
  }

  /// Creates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dagS3Path] :
  /// The relative path to the DAGs folder on your Amazon S3 bucket. For
  /// example, <code>dags</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-folder.html">Adding
  /// or updating DAGs</a>.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the execution role for your environment.
  /// An execution role is an AWS Identity and Access Management (IAM) role that
  /// grants MWAA permission to access AWS services and resources used by your
  /// environment. For example,
  /// <code>arn:aws:iam::123456789:role/my-execution-role</code>. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-create-role.html">Amazon
  /// MWAA Execution role</a>.
  ///
  /// Parameter [name] :
  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  ///
  /// Parameter [networkConfiguration] :
  /// The VPC networking components used to secure and enable network traffic
  /// between the AWS resources for your environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
  /// networking on Amazon MWAA</a>.
  ///
  /// Parameter [sourceBucketArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code
  /// and supporting files are stored. For example,
  /// <code>arn:aws:s3:::my-airflow-bucket-unique-name</code>. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-s3-bucket.html">Create
  /// an Amazon S3 bucket for Amazon MWAA</a>.
  ///
  /// Parameter [airflowConfigurationOptions] :
  /// A list of key-value pairs containing the Apache Airflow configuration
  /// options you want to attach to your environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Apache
  /// Airflow configuration options</a>.
  ///
  /// Parameter [airflowVersion] :
  /// The Apache Airflow version for your environment. For example,
  /// <code>v1.10.12</code>. If no value is specified, defaults to the latest
  /// version. Valid values: <code>v1.10.12</code>.
  ///
  /// Parameter [environmentClass] :
  /// The environment class type. Valid values: <code>mw1.small</code>,
  /// <code>mw1.medium</code>, <code>mw1.large</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/environment-class.html">Amazon
  /// MWAA environment class</a>.
  ///
  /// Parameter [kmsKey] :
  /// The AWS Key Management Service (KMS) key to encrypt the data in your
  /// environment. You can use an AWS owned CMK, or a Customer managed CMK
  /// (advanced). To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/get-started.html">Get
  /// started with Amazon Managed Workflows for Apache Airflow</a>.
  ///
  /// Parameter [loggingConfiguration] :
  /// Defines the Apache Airflow logs to send to CloudWatch Logs:
  /// <code>DagProcessingLogs</code>, <code>SchedulerLogs</code>,
  /// <code>TaskLogs</code>, <code>WebserverLogs</code>,
  /// <code>WorkerLogs</code>.
  ///
  /// Parameter [maxWorkers] :
  /// The maximum number of workers that you want to run in your environment.
  /// MWAA scales the number of Apache Airflow workers up to the number you
  /// specify in the <code>MaxWorkers</code> field. For example,
  /// <code>20</code>. When there are no more tasks running, and no more in the
  /// queue, MWAA disposes of the extra workers leaving the one worker that is
  /// included with your environment, or the number you specify in
  /// <code>MinWorkers</code>.
  ///
  /// Parameter [minWorkers] :
  /// The minimum number of workers that you want to run in your environment.
  /// MWAA scales the number of Apache Airflow workers up to the number you
  /// specify in the <code>MaxWorkers</code> field. When there are no more tasks
  /// running, and no more in the queue, MWAA disposes of the extra workers
  /// leaving the worker count you specify in the <code>MinWorkers</code> field.
  /// For example, <code>2</code>.
  ///
  /// Parameter [pluginsS3ObjectVersion] :
  /// The version of the plugins.zip file on your Amazon S3 bucket. A version
  /// must be specified each time a plugins.zip file is updated. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [pluginsS3Path] :
  /// The relative path to the <code>plugins.zip</code> file on your Amazon S3
  /// bucket. For example, <code>plugins.zip</code>. If specified, then the
  /// plugins.zip version is required. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  ///
  /// Parameter [requirementsS3ObjectVersion] :
  /// The version of the requirements.txt file on your Amazon S3 bucket. A
  /// version must be specified each time a requirements.txt file is updated. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [requirementsS3Path] :
  /// The relative path to the <code>requirements.txt</code> file on your Amazon
  /// S3 bucket. For example, <code>requirements.txt</code>. If specified, then
  /// a file version is required. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  ///
  /// Parameter [schedulers] :
  /// The number of Apache Airflow schedulers to run in your environment.
  ///
  /// Parameter [tags] :
  /// The key-value tag pairs you want to associate to your environment. For
  /// example, <code>"Environment": "Staging"</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a>.
  ///
  /// Parameter [webserverAccessMode] :
  /// The Apache Airflow <i>Web server</i> access mode. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-networking.html">Apache
  /// Airflow access modes</a>.
  ///
  /// Parameter [weeklyMaintenanceWindowStart] :
  /// The day and time of the week to start weekly maintenance updates of your
  /// environment in the following format: <code>DAY:HH:MM</code>. For example:
  /// <code>TUE:03:30</code>. You can specify a start time in 30 minute
  /// increments only. Supported input includes the following:
  ///
  /// <ul>
  /// <li>
  /// MON|TUE|WED|THU|FRI|SAT|SUN:([01]\\d|2[0-3]):(00|30)
  /// </li>
  /// </ul>
  Future<CreateEnvironmentOutput> createEnvironment({
    required String dagS3Path,
    required String executionRoleArn,
    required String name,
    required NetworkConfiguration networkConfiguration,
    required String sourceBucketArn,
    Map<String, String>? airflowConfigurationOptions,
    String? airflowVersion,
    String? environmentClass,
    String? kmsKey,
    LoggingConfigurationInput? loggingConfiguration,
    int? maxWorkers,
    int? minWorkers,
    String? pluginsS3ObjectVersion,
    String? pluginsS3Path,
    String? requirementsS3ObjectVersion,
    String? requirementsS3Path,
    int? schedulers,
    Map<String, String>? tags,
    WebserverAccessMode? webserverAccessMode,
    String? weeklyMaintenanceWindowStart,
  }) async {
    ArgumentError.checkNotNull(dagS3Path, 'dagS3Path');
    _s.validateStringLength(
      'dagS3Path',
      dagS3Path,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      1,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkConfiguration, 'networkConfiguration');
    ArgumentError.checkNotNull(sourceBucketArn, 'sourceBucketArn');
    _s.validateStringLength(
      'sourceBucketArn',
      sourceBucketArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringLength(
      'airflowVersion',
      airflowVersion,
      1,
      32,
    );
    _s.validateStringLength(
      'environmentClass',
      environmentClass,
      1,
      1024,
    );
    _s.validateStringLength(
      'kmsKey',
      kmsKey,
      1,
      1224,
    );
    _s.validateNumRange(
      'maxWorkers',
      maxWorkers,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minWorkers',
      minWorkers,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'pluginsS3ObjectVersion',
      pluginsS3ObjectVersion,
      1,
      1024,
    );
    _s.validateStringLength(
      'pluginsS3Path',
      pluginsS3Path,
      1,
      1024,
    );
    _s.validateStringLength(
      'requirementsS3ObjectVersion',
      requirementsS3ObjectVersion,
      1,
      1024,
    );
    _s.validateStringLength(
      'requirementsS3Path',
      requirementsS3Path,
      1,
      1024,
    );
    _s.validateNumRange(
      'schedulers',
      schedulers,
      0,
      5,
    );
    _s.validateStringLength(
      'weeklyMaintenanceWindowStart',
      weeklyMaintenanceWindowStart,
      1,
      9,
    );
    final $payload = <String, dynamic>{
      'DagS3Path': dagS3Path,
      'ExecutionRoleArn': executionRoleArn,
      'NetworkConfiguration': networkConfiguration,
      'SourceBucketArn': sourceBucketArn,
      if (airflowConfigurationOptions != null)
        'AirflowConfigurationOptions': airflowConfigurationOptions,
      if (airflowVersion != null) 'AirflowVersion': airflowVersion,
      if (environmentClass != null) 'EnvironmentClass': environmentClass,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (maxWorkers != null) 'MaxWorkers': maxWorkers,
      if (minWorkers != null) 'MinWorkers': minWorkers,
      if (pluginsS3ObjectVersion != null)
        'PluginsS3ObjectVersion': pluginsS3ObjectVersion,
      if (pluginsS3Path != null) 'PluginsS3Path': pluginsS3Path,
      if (requirementsS3ObjectVersion != null)
        'RequirementsS3ObjectVersion': requirementsS3ObjectVersion,
      if (requirementsS3Path != null) 'RequirementsS3Path': requirementsS3Path,
      if (schedulers != null) 'Schedulers': schedulers,
      if (tags != null) 'Tags': tags,
      if (webserverAccessMode != null)
        'WebserverAccessMode': webserverAccessMode.toValue(),
      if (weeklyMaintenanceWindowStart != null)
        'WeeklyMaintenanceWindowStart': weeklyMaintenanceWindowStart,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/environments/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentOutput.fromJson(response);
  }

  /// Create a JWT token to be used to login to Airflow Web UI with claims based
  /// Authentication.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// Create an Airflow Web UI login token request for a MWAA environment.
  Future<CreateWebLoginTokenResponse> createWebLoginToken({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/webtoken/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWebLoginTokenResponse.fromJson(response);
  }

  /// Deletes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  Future<void> deleteEnvironment({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environments/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the details of an Amazon Managed Workflows for Apache Airflow
  /// (MWAA) environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  Future<GetEnvironmentOutput> getEnvironment({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentOutput.fromJson(response);
  }

  /// Lists the Amazon Managed Workflows for Apache Airflow (MWAA) environments.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve per page. For example,
  /// <code>5</code> environments per page.
  ///
  /// Parameter [nextToken] :
  /// Retrieves the next page of the results.
  Future<ListEnvironmentsOutput> listEnvironments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsOutput.fromJson(response);
  }

  /// Lists the key-value tag pairs associated to the Amazon Managed Workflows
  /// for Apache Airflow (MWAA) environment. For example, <code>"Environment":
  /// "Staging"</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon MWAA environment. For
  /// example,
  /// <code>arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment</code>.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// An operation for publishing metrics from the customers to the Ops plane.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// Publishes environment metric data to Amazon CloudWatch.
  ///
  /// Parameter [metricData] :
  /// Publishes metric data points to Amazon CloudWatch. CloudWatch associates
  /// the data points with the specified metrica.
  Future<void> publishMetrics({
    required String environmentName,
    required List<MetricDatum> metricData,
  }) async {
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      1,
      80,
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricData, 'metricData');
    final $payload = <String, dynamic>{
      'MetricData': metricData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/metrics/environments/${Uri.encodeComponent(environmentName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates key-value tag pairs to your Amazon Managed Workflows for Apache
  /// Airflow (MWAA) environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon MWAA environment. For
  /// example,
  /// <code>arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment</code>.
  ///
  /// Parameter [tags] :
  /// The key-value tag pairs you want to associate to your environment. For
  /// example, <code>"Environment": "Staging"</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes key-value tag pairs associated to your Amazon Managed Workflows
  /// for Apache Airflow (MWAA) environment. For example, <code>"Environment":
  /// "Staging"</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon MWAA environment. For
  /// example,
  /// <code>arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment</code>.
  ///
  /// Parameter [tagKeys] :
  /// The key-value tag pair you want to remove. For example,
  /// <code>"Environment": "Staging"</code>.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
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

  /// Updates an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of your Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  ///
  /// Parameter [airflowConfigurationOptions] :
  /// A list of key-value pairs containing the Apache Airflow configuration
  /// options you want to attach to your environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Apache
  /// Airflow configuration options</a>.
  ///
  /// Parameter [airflowVersion] :
  /// The Apache Airflow version for your environment. For example,
  /// <code>v1.10.12</code>. If no value is specified, defaults to the latest
  /// version. Valid values: <code>v1.10.12</code>.
  ///
  /// Parameter [dagS3Path] :
  /// The relative path to the DAGs folder on your Amazon S3 bucket. For
  /// example, <code>dags</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-folder.html">Adding
  /// or updating DAGs</a>.
  ///
  /// Parameter [environmentClass] :
  /// The environment class type. Valid values: <code>mw1.small</code>,
  /// <code>mw1.medium</code>, <code>mw1.large</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/environment-class.html">Amazon
  /// MWAA environment class</a>.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the execution role in IAM that allows
  /// MWAA to access AWS resources in your environment. For example,
  /// <code>arn:aws:iam::123456789:role/my-execution-role</code>. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-create-role.html">Amazon
  /// MWAA Execution role</a>.
  ///
  /// Parameter [loggingConfiguration] :
  /// Defines the Apache Airflow logs to send to CloudWatch Logs:
  /// <code>DagProcessingLogs</code>, <code>SchedulerLogs</code>,
  /// <code>TaskLogs</code>, <code>WebserverLogs</code>,
  /// <code>WorkerLogs</code>.
  ///
  /// Parameter [maxWorkers] :
  /// The maximum number of workers that you want to run in your environment.
  /// MWAA scales the number of Apache Airflow workers up to the number you
  /// specify in the <code>MaxWorkers</code> field. For example,
  /// <code>20</code>. When there are no more tasks running, and no more in the
  /// queue, MWAA disposes of the extra workers leaving the one worker that is
  /// included with your environment, or the number you specify in
  /// <code>MinWorkers</code>.
  ///
  /// Parameter [minWorkers] :
  /// The minimum number of workers that you want to run in your environment.
  /// MWAA scales the number of Apache Airflow workers up to the number you
  /// specify in the <code>MaxWorkers</code> field. When there are no more tasks
  /// running, and no more in the queue, MWAA disposes of the extra workers
  /// leaving the worker count you specify in the <code>MinWorkers</code> field.
  /// For example, <code>2</code>.
  ///
  /// Parameter [networkConfiguration] :
  /// The VPC networking components used to secure and enable network traffic
  /// between the AWS resources for your environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
  /// networking on Amazon MWAA</a>.
  ///
  /// Parameter [pluginsS3ObjectVersion] :
  /// The version of the plugins.zip file on your Amazon S3 bucket. A version
  /// must be specified each time a plugins.zip file is updated. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [pluginsS3Path] :
  /// The relative path to the <code>plugins.zip</code> file on your Amazon S3
  /// bucket. For example, <code>plugins.zip</code>. If specified, then the
  /// plugins.zip version is required. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  ///
  /// Parameter [requirementsS3ObjectVersion] :
  /// The version of the requirements.txt file on your Amazon S3 bucket. A
  /// version must be specified each time a requirements.txt file is updated. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [requirementsS3Path] :
  /// The relative path to the <code>requirements.txt</code> file on your Amazon
  /// S3 bucket. For example, <code>requirements.txt</code>. If specified, then
  /// a file version is required. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  ///
  /// Parameter [schedulers] :
  /// The number of Apache Airflow schedulers to run in your Amazon MWAA
  /// environment.
  ///
  /// Parameter [sourceBucketArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code
  /// and supporting files are stored. For example,
  /// <code>arn:aws:s3:::my-airflow-bucket-unique-name</code>. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-s3-bucket.html">Create
  /// an Amazon S3 bucket for Amazon MWAA</a>.
  ///
  /// Parameter [webserverAccessMode] :
  /// The Apache Airflow <i>Web server</i> access mode. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-networking.html">Apache
  /// Airflow access modes</a>.
  ///
  /// Parameter [weeklyMaintenanceWindowStart] :
  /// The day and time of the week to start weekly maintenance updates of your
  /// environment in the following format: <code>DAY:HH:MM</code>. For example:
  /// <code>TUE:03:30</code>. You can specify a start time in 30 minute
  /// increments only. Supported input includes the following:
  ///
  /// <ul>
  /// <li>
  /// MON|TUE|WED|THU|FRI|SAT|SUN:([01]\\d|2[0-3]):(00|30)
  /// </li>
  /// </ul>
  Future<UpdateEnvironmentOutput> updateEnvironment({
    required String name,
    Map<String, String>? airflowConfigurationOptions,
    String? airflowVersion,
    String? dagS3Path,
    String? environmentClass,
    String? executionRoleArn,
    LoggingConfigurationInput? loggingConfiguration,
    int? maxWorkers,
    int? minWorkers,
    UpdateNetworkConfigurationInput? networkConfiguration,
    String? pluginsS3ObjectVersion,
    String? pluginsS3Path,
    String? requirementsS3ObjectVersion,
    String? requirementsS3Path,
    int? schedulers,
    String? sourceBucketArn,
    WebserverAccessMode? webserverAccessMode,
    String? weeklyMaintenanceWindowStart,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringLength(
      'airflowVersion',
      airflowVersion,
      1,
      32,
    );
    _s.validateStringLength(
      'dagS3Path',
      dagS3Path,
      1,
      1024,
    );
    _s.validateStringLength(
      'environmentClass',
      environmentClass,
      1,
      1024,
    );
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      1,
      1224,
    );
    _s.validateNumRange(
      'maxWorkers',
      maxWorkers,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minWorkers',
      minWorkers,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'pluginsS3ObjectVersion',
      pluginsS3ObjectVersion,
      1,
      1024,
    );
    _s.validateStringLength(
      'pluginsS3Path',
      pluginsS3Path,
      1,
      1024,
    );
    _s.validateStringLength(
      'requirementsS3ObjectVersion',
      requirementsS3ObjectVersion,
      1,
      1024,
    );
    _s.validateStringLength(
      'requirementsS3Path',
      requirementsS3Path,
      1,
      1024,
    );
    _s.validateNumRange(
      'schedulers',
      schedulers,
      0,
      5,
    );
    _s.validateStringLength(
      'sourceBucketArn',
      sourceBucketArn,
      1,
      1224,
    );
    _s.validateStringLength(
      'weeklyMaintenanceWindowStart',
      weeklyMaintenanceWindowStart,
      1,
      9,
    );
    final $payload = <String, dynamic>{
      if (airflowConfigurationOptions != null)
        'AirflowConfigurationOptions': airflowConfigurationOptions,
      if (airflowVersion != null) 'AirflowVersion': airflowVersion,
      if (dagS3Path != null) 'DagS3Path': dagS3Path,
      if (environmentClass != null) 'EnvironmentClass': environmentClass,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (maxWorkers != null) 'MaxWorkers': maxWorkers,
      if (minWorkers != null) 'MinWorkers': minWorkers,
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (pluginsS3ObjectVersion != null)
        'PluginsS3ObjectVersion': pluginsS3ObjectVersion,
      if (pluginsS3Path != null) 'PluginsS3Path': pluginsS3Path,
      if (requirementsS3ObjectVersion != null)
        'RequirementsS3ObjectVersion': requirementsS3ObjectVersion,
      if (requirementsS3Path != null) 'RequirementsS3Path': requirementsS3Path,
      if (schedulers != null) 'Schedulers': schedulers,
      if (sourceBucketArn != null) 'SourceBucketArn': sourceBucketArn,
      if (webserverAccessMode != null)
        'WebserverAccessMode': webserverAccessMode.toValue(),
      if (weeklyMaintenanceWindowStart != null)
        'WeeklyMaintenanceWindowStart': weeklyMaintenanceWindowStart,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/environments/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentOutput.fromJson(response);
  }
}

class CreateCliTokenResponse {
  /// Create an Airflow CLI login token response for the provided JWT token.
  final String? cliToken;

  /// Create an Airflow CLI login token response for the provided webserver
  /// hostname.
  final String? webServerHostname;

  CreateCliTokenResponse({
    this.cliToken,
    this.webServerHostname,
  });

  factory CreateCliTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateCliTokenResponse(
      cliToken: json['CliToken'] as String?,
      webServerHostname: json['WebServerHostname'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cliToken = this.cliToken;
    final webServerHostname = this.webServerHostname;
    return {
      if (cliToken != null) 'CliToken': cliToken,
      if (webServerHostname != null) 'WebServerHostname': webServerHostname,
    };
  }
}

class CreateEnvironmentOutput {
  /// The Amazon Resource Name (ARN) returned in the response for the environment.
  final String? arn;

  CreateEnvironmentOutput({
    this.arn,
  });

  factory CreateEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class CreateWebLoginTokenResponse {
  /// Create an Airflow Web UI login token response for the provided webserver
  /// hostname.
  final String? webServerHostname;

  /// Create an Airflow Web UI login token response for the provided JWT token.
  final String? webToken;

  CreateWebLoginTokenResponse({
    this.webServerHostname,
    this.webToken,
  });

  factory CreateWebLoginTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebLoginTokenResponse(
      webServerHostname: json['WebServerHostname'] as String?,
      webToken: json['WebToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final webServerHostname = this.webServerHostname;
    final webToken = this.webToken;
    return {
      if (webServerHostname != null) 'WebServerHostname': webServerHostname,
      if (webToken != null) 'WebToken': webToken,
    };
  }
}

class DeleteEnvironmentOutput {
  DeleteEnvironmentOutput();

  factory DeleteEnvironmentOutput.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Internal only API.
class Dimension {
  /// Internal only API.
  final String name;

  /// Internal only API.
  final String value;

  Dimension({
    required this.name,
    required this.value,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// The Amazon Managed Workflows for Apache Airflow (MWAA) environment.
class Environment {
  /// A list of key-value pairs containing the Apache Airflow configuration
  /// options attached to your environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Apache
  /// Airflow configuration options</a>.
  final Map<String, String>? airflowConfigurationOptions;

  /// The Apache Airflow version on your environment. For example,
  /// <code>v1.10.12</code>.
  final String? airflowVersion;

  /// The Amazon Resource Name (ARN) of the Amazon MWAA environment.
  final String? arn;

  /// The day and time the environment was created.
  final DateTime? createdAt;

  /// The relative path to the DAGs folder on your Amazon S3 bucket. For example,
  /// <code>dags</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-folder.html">Adding
  /// or updating DAGs</a>.
  final String? dagS3Path;

  /// The environment class type. Valid values: <code>mw1.small</code>,
  /// <code>mw1.medium</code>, <code>mw1.large</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/environment-class.html">Amazon
  /// MWAA environment class</a>.
  final String? environmentClass;

  /// The Amazon Resource Name (ARN) of the execution role in IAM that allows MWAA
  /// to access AWS resources in your environment. For example,
  /// <code>arn:aws:iam::123456789:role/my-execution-role</code>. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-create-role.html">Amazon
  /// MWAA Execution role</a>.
  final String? executionRoleArn;

  /// The Key Management Service (KMS) encryption key used to encrypt the data in
  /// your environment.
  final String? kmsKey;
  final LastUpdate? lastUpdate;

  /// The Apache Airflow logs being sent to CloudWatch Logs:
  /// <code>DagProcessingLogs</code>, <code>SchedulerLogs</code>,
  /// <code>TaskLogs</code>, <code>WebserverLogs</code>, <code>WorkerLogs</code>.
  final LoggingConfiguration? loggingConfiguration;

  /// The maximum number of workers that run in your environment. For example,
  /// <code>20</code>.
  final int? maxWorkers;

  /// The minimum number of workers that run in your environment. For example,
  /// <code>2</code>.
  final int? minWorkers;

  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  final String? name;
  final NetworkConfiguration? networkConfiguration;

  /// The version of the plugins.zip file on your Amazon S3 bucket. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  final String? pluginsS3ObjectVersion;

  /// The relative path to the <code>plugins.zip</code> file on your Amazon S3
  /// bucket. For example, <code>plugins.zip</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  final String? pluginsS3Path;

  /// The version of the requirements.txt file on your Amazon S3 bucket. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  final String? requirementsS3ObjectVersion;

  /// The relative path to the <code>requirements.txt</code> file on your Amazon
  /// S3 bucket. For example, <code>requirements.txt</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  final String? requirementsS3Path;

  /// The number of Apache Airflow schedulers that run in your Amazon MWAA
  /// environment.
  final int? schedulers;

  /// The Amazon Resource Name (ARN) for the service-linked role of the
  /// environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-slr.html">Amazon
  /// MWAA Service-linked role</a>.
  final String? serviceRoleArn;

  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code
  /// and supporting files are stored. For example,
  /// <code>arn:aws:s3:::my-airflow-bucket-unique-name</code>. To learn more, see
  /// <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-s3-bucket.html">Create
  /// an Amazon S3 bucket for Amazon MWAA</a>.
  final String? sourceBucketArn;

  /// The status of the Amazon MWAA environment. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - Indicates the request to create the environment is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> - Indicates the request to create the environment
  /// failed, and the environment could not be created.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - Indicates the request was successful and the
  /// environment is ready to use.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - Indicates the request to update the environment is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Indicates the request to delete the environment is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Indicates the request to delete the environment is
  /// complete, and the environment has been deleted.
  /// </li>
  /// <li>
  /// <code>UNAVAILABLE</code> - Indicates the request failed, but the environment
  /// was unable to rollback and is not in a stable state.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> - Indicates the request to update the environment
  /// failed, and the environment has rolled back successfully and is ready to
  /// use.
  /// </li>
  /// </ul>
  /// We recommend reviewing our troubleshooting guide for a list of common errors
  /// and their solutions. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/troubleshooting.html">Amazon
  /// MWAA troubleshooting</a>.
  final EnvironmentStatus? status;

  /// The key-value tag pairs associated to your environment. For example,
  /// <code>"Environment": "Staging"</code>. To learn more, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a>.
  final Map<String, String>? tags;

  /// The Apache Airflow <i>Web server</i> access mode. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-networking.html">Apache
  /// Airflow access modes</a>.
  final WebserverAccessMode? webserverAccessMode;

  /// The Apache Airflow <i>Web server</i> host name for the Amazon MWAA
  /// environment. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/access-airflow-ui.html">Accessing
  /// the Apache Airflow UI</a>.
  final String? webserverUrl;

  /// The day and time of the week that weekly maintenance updates are scheduled.
  /// For example: <code>TUE:03:30</code>.
  final String? weeklyMaintenanceWindowStart;

  Environment({
    this.airflowConfigurationOptions,
    this.airflowVersion,
    this.arn,
    this.createdAt,
    this.dagS3Path,
    this.environmentClass,
    this.executionRoleArn,
    this.kmsKey,
    this.lastUpdate,
    this.loggingConfiguration,
    this.maxWorkers,
    this.minWorkers,
    this.name,
    this.networkConfiguration,
    this.pluginsS3ObjectVersion,
    this.pluginsS3Path,
    this.requirementsS3ObjectVersion,
    this.requirementsS3Path,
    this.schedulers,
    this.serviceRoleArn,
    this.sourceBucketArn,
    this.status,
    this.tags,
    this.webserverAccessMode,
    this.webserverUrl,
    this.weeklyMaintenanceWindowStart,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      airflowConfigurationOptions:
          (json['AirflowConfigurationOptions'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      airflowVersion: json['AirflowVersion'] as String?,
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dagS3Path: json['DagS3Path'] as String?,
      environmentClass: json['EnvironmentClass'] as String?,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      kmsKey: json['KmsKey'] as String?,
      lastUpdate: json['LastUpdate'] != null
          ? LastUpdate.fromJson(json['LastUpdate'] as Map<String, dynamic>)
          : null,
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
      maxWorkers: json['MaxWorkers'] as int?,
      minWorkers: json['MinWorkers'] as int?,
      name: json['Name'] as String?,
      networkConfiguration: json['NetworkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['NetworkConfiguration'] as Map<String, dynamic>)
          : null,
      pluginsS3ObjectVersion: json['PluginsS3ObjectVersion'] as String?,
      pluginsS3Path: json['PluginsS3Path'] as String?,
      requirementsS3ObjectVersion:
          json['RequirementsS3ObjectVersion'] as String?,
      requirementsS3Path: json['RequirementsS3Path'] as String?,
      schedulers: json['Schedulers'] as int?,
      serviceRoleArn: json['ServiceRoleArn'] as String?,
      sourceBucketArn: json['SourceBucketArn'] as String?,
      status: (json['Status'] as String?)?.toEnvironmentStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      webserverAccessMode:
          (json['WebserverAccessMode'] as String?)?.toWebserverAccessMode(),
      webserverUrl: json['WebserverUrl'] as String?,
      weeklyMaintenanceWindowStart:
          json['WeeklyMaintenanceWindowStart'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final airflowConfigurationOptions = this.airflowConfigurationOptions;
    final airflowVersion = this.airflowVersion;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final dagS3Path = this.dagS3Path;
    final environmentClass = this.environmentClass;
    final executionRoleArn = this.executionRoleArn;
    final kmsKey = this.kmsKey;
    final lastUpdate = this.lastUpdate;
    final loggingConfiguration = this.loggingConfiguration;
    final maxWorkers = this.maxWorkers;
    final minWorkers = this.minWorkers;
    final name = this.name;
    final networkConfiguration = this.networkConfiguration;
    final pluginsS3ObjectVersion = this.pluginsS3ObjectVersion;
    final pluginsS3Path = this.pluginsS3Path;
    final requirementsS3ObjectVersion = this.requirementsS3ObjectVersion;
    final requirementsS3Path = this.requirementsS3Path;
    final schedulers = this.schedulers;
    final serviceRoleArn = this.serviceRoleArn;
    final sourceBucketArn = this.sourceBucketArn;
    final status = this.status;
    final tags = this.tags;
    final webserverAccessMode = this.webserverAccessMode;
    final webserverUrl = this.webserverUrl;
    final weeklyMaintenanceWindowStart = this.weeklyMaintenanceWindowStart;
    return {
      if (airflowConfigurationOptions != null)
        'AirflowConfigurationOptions': airflowConfigurationOptions,
      if (airflowVersion != null) 'AirflowVersion': airflowVersion,
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dagS3Path != null) 'DagS3Path': dagS3Path,
      if (environmentClass != null) 'EnvironmentClass': environmentClass,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (lastUpdate != null) 'LastUpdate': lastUpdate,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (maxWorkers != null) 'MaxWorkers': maxWorkers,
      if (minWorkers != null) 'MinWorkers': minWorkers,
      if (name != null) 'Name': name,
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (pluginsS3ObjectVersion != null)
        'PluginsS3ObjectVersion': pluginsS3ObjectVersion,
      if (pluginsS3Path != null) 'PluginsS3Path': pluginsS3Path,
      if (requirementsS3ObjectVersion != null)
        'RequirementsS3ObjectVersion': requirementsS3ObjectVersion,
      if (requirementsS3Path != null) 'RequirementsS3Path': requirementsS3Path,
      if (schedulers != null) 'Schedulers': schedulers,
      if (serviceRoleArn != null) 'ServiceRoleArn': serviceRoleArn,
      if (sourceBucketArn != null) 'SourceBucketArn': sourceBucketArn,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (webserverAccessMode != null)
        'WebserverAccessMode': webserverAccessMode.toValue(),
      if (webserverUrl != null) 'WebserverUrl': webserverUrl,
      if (weeklyMaintenanceWindowStart != null)
        'WeeklyMaintenanceWindowStart': weeklyMaintenanceWindowStart,
    };
  }
}

enum EnvironmentStatus {
  creating,
  createFailed,
  available,
  updating,
  deleting,
  deleted,
  unavailable,
  updateFailed,
}

extension on EnvironmentStatus {
  String toValue() {
    switch (this) {
      case EnvironmentStatus.creating:
        return 'CREATING';
      case EnvironmentStatus.createFailed:
        return 'CREATE_FAILED';
      case EnvironmentStatus.available:
        return 'AVAILABLE';
      case EnvironmentStatus.updating:
        return 'UPDATING';
      case EnvironmentStatus.deleting:
        return 'DELETING';
      case EnvironmentStatus.deleted:
        return 'DELETED';
      case EnvironmentStatus.unavailable:
        return 'UNAVAILABLE';
      case EnvironmentStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  EnvironmentStatus toEnvironmentStatus() {
    switch (this) {
      case 'CREATING':
        return EnvironmentStatus.creating;
      case 'CREATE_FAILED':
        return EnvironmentStatus.createFailed;
      case 'AVAILABLE':
        return EnvironmentStatus.available;
      case 'UPDATING':
        return EnvironmentStatus.updating;
      case 'DELETING':
        return EnvironmentStatus.deleting;
      case 'DELETED':
        return EnvironmentStatus.deleted;
      case 'UNAVAILABLE':
        return EnvironmentStatus.unavailable;
      case 'UPDATE_FAILED':
        return EnvironmentStatus.updateFailed;
    }
    throw Exception('$this is not known in enum EnvironmentStatus');
  }
}

class GetEnvironmentOutput {
  /// An object containing all available details about the environment.
  final Environment? environment;

  GetEnvironmentOutput({
    this.environment,
  });

  factory GetEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentOutput(
      environment: json['Environment'] != null
          ? Environment.fromJson(json['Environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'Environment': environment,
    };
  }
}

/// The status of the last update on the environment, and any errors that were
/// encountered.
class LastUpdate {
  /// The day and time of the last update on the environment.
  final DateTime? createdAt;

  /// The error that was encountered during the last update of the environment.
  final UpdateError? error;

  /// The status of the last update on the environment. Valid values:
  /// <code>SUCCESS</code>, <code>PENDING</code>, <code>FAILED</code>.
  final UpdateStatus? status;

  LastUpdate({
    this.createdAt,
    this.error,
    this.status,
  });

  factory LastUpdate.fromJson(Map<String, dynamic> json) {
    return LastUpdate(
      createdAt: timeStampFromJson(json['CreatedAt']),
      error: json['Error'] != null
          ? UpdateError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final error = this.error;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (error != null) 'Error': error,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ListEnvironmentsOutput {
  /// Returns the list of Amazon MWAA environments.
  final List<String> environments;

  /// Retrieves the next page of the results.
  final String? nextToken;

  ListEnvironmentsOutput({
    required this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsOutput.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsOutput(
      environments: (json['Environments'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      'Environments': environments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// The key-value tag pairs associated to your environment. To learn more, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a>.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Defines the Apache Airflow logs to send to CloudWatch Logs:
/// <code>DagProcessingLogs</code>, <code>SchedulerLogs</code>,
/// <code>TaskLogs</code>, <code>WebserverLogs</code>, <code>WorkerLogs</code>.
class LoggingConfiguration {
  final ModuleLoggingConfiguration? dagProcessingLogs;
  final ModuleLoggingConfiguration? schedulerLogs;
  final ModuleLoggingConfiguration? taskLogs;
  final ModuleLoggingConfiguration? webserverLogs;
  final ModuleLoggingConfiguration? workerLogs;

  LoggingConfiguration({
    this.dagProcessingLogs,
    this.schedulerLogs,
    this.taskLogs,
    this.webserverLogs,
    this.workerLogs,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      dagProcessingLogs: json['DagProcessingLogs'] != null
          ? ModuleLoggingConfiguration.fromJson(
              json['DagProcessingLogs'] as Map<String, dynamic>)
          : null,
      schedulerLogs: json['SchedulerLogs'] != null
          ? ModuleLoggingConfiguration.fromJson(
              json['SchedulerLogs'] as Map<String, dynamic>)
          : null,
      taskLogs: json['TaskLogs'] != null
          ? ModuleLoggingConfiguration.fromJson(
              json['TaskLogs'] as Map<String, dynamic>)
          : null,
      webserverLogs: json['WebserverLogs'] != null
          ? ModuleLoggingConfiguration.fromJson(
              json['WebserverLogs'] as Map<String, dynamic>)
          : null,
      workerLogs: json['WorkerLogs'] != null
          ? ModuleLoggingConfiguration.fromJson(
              json['WorkerLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dagProcessingLogs = this.dagProcessingLogs;
    final schedulerLogs = this.schedulerLogs;
    final taskLogs = this.taskLogs;
    final webserverLogs = this.webserverLogs;
    final workerLogs = this.workerLogs;
    return {
      if (dagProcessingLogs != null) 'DagProcessingLogs': dagProcessingLogs,
      if (schedulerLogs != null) 'SchedulerLogs': schedulerLogs,
      if (taskLogs != null) 'TaskLogs': taskLogs,
      if (webserverLogs != null) 'WebserverLogs': webserverLogs,
      if (workerLogs != null) 'WorkerLogs': workerLogs,
    };
  }
}

/// Defines the Apache Airflow logs to send to CloudWatch Logs:
/// <code>DagProcessingLogs</code>, <code>SchedulerLogs</code>,
/// <code>TaskLogs</code>, <code>WebserverLogs</code>, <code>WorkerLogs</code>.
class LoggingConfigurationInput {
  final ModuleLoggingConfigurationInput? dagProcessingLogs;
  final ModuleLoggingConfigurationInput? schedulerLogs;
  final ModuleLoggingConfigurationInput? taskLogs;
  final ModuleLoggingConfigurationInput? webserverLogs;
  final ModuleLoggingConfigurationInput? workerLogs;

  LoggingConfigurationInput({
    this.dagProcessingLogs,
    this.schedulerLogs,
    this.taskLogs,
    this.webserverLogs,
    this.workerLogs,
  });

  factory LoggingConfigurationInput.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationInput(
      dagProcessingLogs: json['DagProcessingLogs'] != null
          ? ModuleLoggingConfigurationInput.fromJson(
              json['DagProcessingLogs'] as Map<String, dynamic>)
          : null,
      schedulerLogs: json['SchedulerLogs'] != null
          ? ModuleLoggingConfigurationInput.fromJson(
              json['SchedulerLogs'] as Map<String, dynamic>)
          : null,
      taskLogs: json['TaskLogs'] != null
          ? ModuleLoggingConfigurationInput.fromJson(
              json['TaskLogs'] as Map<String, dynamic>)
          : null,
      webserverLogs: json['WebserverLogs'] != null
          ? ModuleLoggingConfigurationInput.fromJson(
              json['WebserverLogs'] as Map<String, dynamic>)
          : null,
      workerLogs: json['WorkerLogs'] != null
          ? ModuleLoggingConfigurationInput.fromJson(
              json['WorkerLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dagProcessingLogs = this.dagProcessingLogs;
    final schedulerLogs = this.schedulerLogs;
    final taskLogs = this.taskLogs;
    final webserverLogs = this.webserverLogs;
    final workerLogs = this.workerLogs;
    return {
      if (dagProcessingLogs != null) 'DagProcessingLogs': dagProcessingLogs,
      if (schedulerLogs != null) 'SchedulerLogs': schedulerLogs,
      if (taskLogs != null) 'TaskLogs': taskLogs,
      if (webserverLogs != null) 'WebserverLogs': webserverLogs,
      if (workerLogs != null) 'WorkerLogs': workerLogs,
    };
  }
}

enum LoggingLevel {
  critical,
  error,
  warning,
  info,
  debug,
}

extension on LoggingLevel {
  String toValue() {
    switch (this) {
      case LoggingLevel.critical:
        return 'CRITICAL';
      case LoggingLevel.error:
        return 'ERROR';
      case LoggingLevel.warning:
        return 'WARNING';
      case LoggingLevel.info:
        return 'INFO';
      case LoggingLevel.debug:
        return 'DEBUG';
    }
  }
}

extension on String {
  LoggingLevel toLoggingLevel() {
    switch (this) {
      case 'CRITICAL':
        return LoggingLevel.critical;
      case 'ERROR':
        return LoggingLevel.error;
      case 'WARNING':
        return LoggingLevel.warning;
      case 'INFO':
        return LoggingLevel.info;
      case 'DEBUG':
        return LoggingLevel.debug;
    }
    throw Exception('$this is not known in enum LoggingLevel');
  }
}

/// Internal only API.
class MetricDatum {
  /// Internal only API.
  final String metricName;

  /// Internal only API.
  final DateTime timestamp;

  /// Internal only API.
  final List<Dimension>? dimensions;

  /// Internal only API.
  final StatisticSet? statisticValues;
  final Unit? unit;

  /// Internal only API.
  final double? value;

  MetricDatum({
    required this.metricName,
    required this.timestamp,
    this.dimensions,
    this.statisticValues,
    this.unit,
    this.value,
  });

  factory MetricDatum.fromJson(Map<String, dynamic> json) {
    return MetricDatum(
      metricName: json['MetricName'] as String,
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] as Object),
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      statisticValues: json['StatisticValues'] != null
          ? StatisticSet.fromJson(
              json['StatisticValues'] as Map<String, dynamic>)
          : null,
      unit: (json['Unit'] as String?)?.toUnit(),
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final timestamp = this.timestamp;
    final dimensions = this.dimensions;
    final statisticValues = this.statisticValues;
    final unit = this.unit;
    final value = this.value;
    return {
      'MetricName': metricName,
      'Timestamp': unixTimestampToJson(timestamp),
      if (dimensions != null) 'Dimensions': dimensions,
      if (statisticValues != null) 'StatisticValues': statisticValues,
      if (unit != null) 'Unit': unit.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// Defines the type of logs to send for the Apache Airflow log type (e.g.
/// <code>DagProcessingLogs</code>). Valid values:
/// <code>CloudWatchLogGroupArn</code>, <code>Enabled</code>,
/// <code>LogLevel</code>.
class ModuleLoggingConfiguration {
  /// The Amazon Resource Name (ARN) for the CloudWatch Logs group where the
  /// Apache Airflow log type (e.g. <code>DagProcessingLogs</code>) is published.
  /// For example,
  /// <code>arn:aws:logs:us-east-1:123456789012:log-group:airflow-MyMWAAEnvironment-MwaaEnvironment-DAGProcessing:*</code>.
  final String? cloudWatchLogGroupArn;

  /// Indicates whether to enable the Apache Airflow log type (e.g.
  /// <code>DagProcessingLogs</code>) in CloudWatch Logs.
  final bool? enabled;

  /// Defines the Apache Airflow logs to send for the log type (e.g.
  /// <code>DagProcessingLogs</code>) to CloudWatch Logs. Valid values:
  /// <code>CRITICAL</code>, <code>ERROR</code>, <code>WARNING</code>,
  /// <code>INFO</code>.
  final LoggingLevel? logLevel;

  ModuleLoggingConfiguration({
    this.cloudWatchLogGroupArn,
    this.enabled,
    this.logLevel,
  });

  factory ModuleLoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return ModuleLoggingConfiguration(
      cloudWatchLogGroupArn: json['CloudWatchLogGroupArn'] as String?,
      enabled: json['Enabled'] as bool?,
      logLevel: (json['LogLevel'] as String?)?.toLoggingLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupArn = this.cloudWatchLogGroupArn;
    final enabled = this.enabled;
    final logLevel = this.logLevel;
    return {
      if (cloudWatchLogGroupArn != null)
        'CloudWatchLogGroupArn': cloudWatchLogGroupArn,
      if (enabled != null) 'Enabled': enabled,
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
    };
  }
}

/// Defines the type of logs to send for the Apache Airflow log type (e.g.
/// <code>DagProcessingLogs</code>). Valid values:
/// <code>CloudWatchLogGroupArn</code>, <code>Enabled</code>,
/// <code>LogLevel</code>.
class ModuleLoggingConfigurationInput {
  /// Indicates whether to enable the Apache Airflow log type (e.g.
  /// <code>DagProcessingLogs</code>) in CloudWatch Logs.
  final bool enabled;

  /// Defines the Apache Airflow logs to send for the log type (e.g.
  /// <code>DagProcessingLogs</code>) to CloudWatch Logs. Valid values:
  /// <code>CRITICAL</code>, <code>ERROR</code>, <code>WARNING</code>,
  /// <code>INFO</code>.
  final LoggingLevel logLevel;

  ModuleLoggingConfigurationInput({
    required this.enabled,
    required this.logLevel,
  });

  factory ModuleLoggingConfigurationInput.fromJson(Map<String, dynamic> json) {
    return ModuleLoggingConfigurationInput(
      enabled: json['Enabled'] as bool,
      logLevel: (json['LogLevel'] as String).toLoggingLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logLevel = this.logLevel;
    return {
      'Enabled': enabled,
      'LogLevel': logLevel.toValue(),
    };
  }
}

/// The VPC networking components used to secure and enable network traffic
/// between the AWS resources for your environment. To learn more, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
/// networking on Amazon MWAA</a>.
class NetworkConfiguration {
  /// A list of 1 or more security group IDs. Accepts up to 5 security group IDs.
  /// A security group must be attached to the same VPC as the subnets. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/vpc-security.html">Security
  /// in your VPC on Amazon MWAA</a>.
  final List<String>? securityGroupIds;

  /// A list of 2 subnet IDs. <b>Required</b> to create an environment. Must be
  /// private subnets in two different availability zones. A subnet must be
  /// attached to the same VPC as the security group.
  final List<String>? subnetIds;

  NetworkConfiguration({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

class PublishMetricsOutput {
  PublishMetricsOutput();

  factory PublishMetricsOutput.fromJson(Map<String, dynamic> _) {
    return PublishMetricsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Internal only API.
class StatisticSet {
  /// Internal only API.
  final double? maximum;

  /// Internal only API.
  final double? minimum;

  /// Internal only API.
  final int? sampleCount;

  /// Internal only API.
  final double? sum;

  StatisticSet({
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
  });

  factory StatisticSet.fromJson(Map<String, dynamic> json) {
    return StatisticSet(
      maximum: json['Maximum'] as double?,
      minimum: json['Minimum'] as double?,
      sampleCount: json['SampleCount'] as int?,
      sum: json['Sum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    final minimum = this.minimum;
    final sampleCount = this.sampleCount;
    final sum = this.sum;
    return {
      if (maximum != null) 'Maximum': maximum,
      if (minimum != null) 'Minimum': minimum,
      if (sampleCount != null) 'SampleCount': sampleCount,
      if (sum != null) 'Sum': sum,
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

/// Unit
enum Unit {
  seconds,
  microseconds,
  milliseconds,
  bytes,
  kilobytes,
  megabytes,
  gigabytes,
  terabytes,
  bits,
  kilobits,
  megabits,
  gigabits,
  terabits,
  percent,
  count,
  bytesSecond,
  kilobytesSecond,
  megabytesSecond,
  gigabytesSecond,
  terabytesSecond,
  bitsSecond,
  kilobitsSecond,
  megabitsSecond,
  gigabitsSecond,
  terabitsSecond,
  countSecond,
  none,
}

extension on Unit {
  String toValue() {
    switch (this) {
      case Unit.seconds:
        return 'Seconds';
      case Unit.microseconds:
        return 'Microseconds';
      case Unit.milliseconds:
        return 'Milliseconds';
      case Unit.bytes:
        return 'Bytes';
      case Unit.kilobytes:
        return 'Kilobytes';
      case Unit.megabytes:
        return 'Megabytes';
      case Unit.gigabytes:
        return 'Gigabytes';
      case Unit.terabytes:
        return 'Terabytes';
      case Unit.bits:
        return 'Bits';
      case Unit.kilobits:
        return 'Kilobits';
      case Unit.megabits:
        return 'Megabits';
      case Unit.gigabits:
        return 'Gigabits';
      case Unit.terabits:
        return 'Terabits';
      case Unit.percent:
        return 'Percent';
      case Unit.count:
        return 'Count';
      case Unit.bytesSecond:
        return 'Bytes/Second';
      case Unit.kilobytesSecond:
        return 'Kilobytes/Second';
      case Unit.megabytesSecond:
        return 'Megabytes/Second';
      case Unit.gigabytesSecond:
        return 'Gigabytes/Second';
      case Unit.terabytesSecond:
        return 'Terabytes/Second';
      case Unit.bitsSecond:
        return 'Bits/Second';
      case Unit.kilobitsSecond:
        return 'Kilobits/Second';
      case Unit.megabitsSecond:
        return 'Megabits/Second';
      case Unit.gigabitsSecond:
        return 'Gigabits/Second';
      case Unit.terabitsSecond:
        return 'Terabits/Second';
      case Unit.countSecond:
        return 'Count/Second';
      case Unit.none:
        return 'None';
    }
  }
}

extension on String {
  Unit toUnit() {
    switch (this) {
      case 'Seconds':
        return Unit.seconds;
      case 'Microseconds':
        return Unit.microseconds;
      case 'Milliseconds':
        return Unit.milliseconds;
      case 'Bytes':
        return Unit.bytes;
      case 'Kilobytes':
        return Unit.kilobytes;
      case 'Megabytes':
        return Unit.megabytes;
      case 'Gigabytes':
        return Unit.gigabytes;
      case 'Terabytes':
        return Unit.terabytes;
      case 'Bits':
        return Unit.bits;
      case 'Kilobits':
        return Unit.kilobits;
      case 'Megabits':
        return Unit.megabits;
      case 'Gigabits':
        return Unit.gigabits;
      case 'Terabits':
        return Unit.terabits;
      case 'Percent':
        return Unit.percent;
      case 'Count':
        return Unit.count;
      case 'Bytes/Second':
        return Unit.bytesSecond;
      case 'Kilobytes/Second':
        return Unit.kilobytesSecond;
      case 'Megabytes/Second':
        return Unit.megabytesSecond;
      case 'Gigabytes/Second':
        return Unit.gigabytesSecond;
      case 'Terabytes/Second':
        return Unit.terabytesSecond;
      case 'Bits/Second':
        return Unit.bitsSecond;
      case 'Kilobits/Second':
        return Unit.kilobitsSecond;
      case 'Megabits/Second':
        return Unit.megabitsSecond;
      case 'Gigabits/Second':
        return Unit.gigabitsSecond;
      case 'Terabits/Second':
        return Unit.terabitsSecond;
      case 'Count/Second':
        return Unit.countSecond;
      case 'None':
        return Unit.none;
    }
    throw Exception('$this is not known in enum Unit');
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

class UpdateEnvironmentOutput {
  /// The Amazon Resource Name (ARN) of the Amazon MWAA environment. For example,
  /// <code>arn:aws:airflow:us-east-1:123456789012:environment/MyMWAAEnvironment</code>.
  final String? arn;

  UpdateEnvironmentOutput({
    this.arn,
  });

  factory UpdateEnvironmentOutput.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// An object containing the error encountered with the last update:
/// <code>ErrorCode</code>, <code>ErrorMessage</code>.
class UpdateError {
  /// The error code that corresponds to the error with the last update.
  final String? errorCode;

  /// The error message that corresponds to the error code.
  final String? errorMessage;

  UpdateError({
    this.errorCode,
    this.errorMessage,
  });

  factory UpdateError.fromJson(Map<String, dynamic> json) {
    return UpdateError(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// The VPC networking components used to secure and enable network traffic
/// between the AWS resources for your environment. To learn more, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
/// networking on Amazon MWAA</a>.
class UpdateNetworkConfigurationInput {
  /// A list of 1 or more security group IDs. Accepts up to 5 security group IDs.
  /// A security group must be attached to the same VPC as the subnets. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/vpc-security.html">Security
  /// in your VPC on Amazon MWAA</a>.
  final List<String> securityGroupIds;

  UpdateNetworkConfigurationInput({
    required this.securityGroupIds,
  });

  factory UpdateNetworkConfigurationInput.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkConfigurationInput(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    return {
      'SecurityGroupIds': securityGroupIds,
    };
  }
}

enum UpdateStatus {
  success,
  pending,
  failed,
}

extension on UpdateStatus {
  String toValue() {
    switch (this) {
      case UpdateStatus.success:
        return 'SUCCESS';
      case UpdateStatus.pending:
        return 'PENDING';
      case UpdateStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  UpdateStatus toUpdateStatus() {
    switch (this) {
      case 'SUCCESS':
        return UpdateStatus.success;
      case 'PENDING':
        return UpdateStatus.pending;
      case 'FAILED':
        return UpdateStatus.failed;
    }
    throw Exception('$this is not known in enum UpdateStatus');
  }
}

enum WebserverAccessMode {
  privateOnly,
  publicOnly,
}

extension on WebserverAccessMode {
  String toValue() {
    switch (this) {
      case WebserverAccessMode.privateOnly:
        return 'PRIVATE_ONLY';
      case WebserverAccessMode.publicOnly:
        return 'PUBLIC_ONLY';
    }
  }
}

extension on String {
  WebserverAccessMode toWebserverAccessMode() {
    switch (this) {
      case 'PRIVATE_ONLY':
        return WebserverAccessMode.privateOnly;
      case 'PUBLIC_ONLY':
        return WebserverAccessMode.publicOnly;
    }
    throw Exception('$this is not known in enum WebserverAccessMode');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
