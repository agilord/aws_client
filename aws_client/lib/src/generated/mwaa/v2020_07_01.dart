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

/// This section contains the Amazon Managed Workflows for Apache Airflow (MWAA)
/// API reference documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html">What
/// is Amazon MWAA?</a>.
class Mwaa {
  final _s.RestJsonProtocol _protocol;
  Mwaa({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Creates a CLI token for the Airflow CLI. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/call-mwaa-apis-cli.html">Creating
  /// an Apache Airflow CLI token</a>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  Future<CreateCliTokenResponse> createCliToken({
    required String name,
  }) async {
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
  /// example, <code>dags</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-folder.html">Adding
  /// or updating DAGs</a>.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the execution role for your environment.
  /// An execution role is an Amazon Web Services Identity and Access Management
  /// (IAM) role that grants MWAA permission to access Amazon Web Services
  /// services and resources used by your environment. For example,
  /// <code>arn:aws:iam::123456789:role/my-execution-role</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-create-role.html">Amazon
  /// MWAA Execution role</a>.
  ///
  /// Parameter [name] :
  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  ///
  /// Parameter [networkConfiguration] :
  /// The VPC networking components used to secure and enable network traffic
  /// between the Amazon Web Services resources for your environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
  /// networking on Amazon MWAA</a>.
  ///
  /// Parameter [sourceBucketArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code
  /// and supporting files are stored. For example,
  /// <code>arn:aws:s3:::my-airflow-bucket-unique-name</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-s3-bucket.html">Create
  /// an Amazon S3 bucket for Amazon MWAA</a>.
  ///
  /// Parameter [airflowConfigurationOptions] :
  /// A list of key-value pairs containing the Apache Airflow configuration
  /// options you want to attach to your environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Apache
  /// Airflow configuration options</a>.
  ///
  /// Parameter [airflowVersion] :
  /// The Apache Airflow version for your environment. If no value is specified,
  /// it defaults to the latest version. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/airflow-versions.html">Apache
  /// Airflow versions on Amazon Managed Workflows for Apache Airflow
  /// (MWAA)</a>.
  ///
  /// Valid values: <code>1.10.12</code>, <code>2.0.2</code>,
  /// <code>2.2.2</code>, <code>2.4.3</code>, <code>2.5.1</code>,
  /// <code>2.6.3</code>, <code>2.7.2</code> <code>2.8.1</code>
  ///
  /// Parameter [endpointManagement] :
  /// Defines whether the VPC endpoints configured for the environment are
  /// created, and managed, by the customer or by Amazon MWAA. If set to
  /// <code>SERVICE</code>, Amazon MWAA will create and manage the required VPC
  /// endpoints in your VPC. If set to <code>CUSTOMER</code>, you must create,
  /// and manage, the VPC endpoints for your VPC. If you choose to create an
  /// environment in a shared VPC, you must set this value to
  /// <code>CUSTOMER</code>. In a shared VPC deployment, the environment will
  /// remain in <code>PENDING</code> status until you create the VPC endpoints.
  /// If you do not take action to create the endpoints within 72 hours, the
  /// status will change to <code>CREATE_FAILED</code>. You can delete the
  /// failed environment and create a new one.
  ///
  /// Parameter [environmentClass] :
  /// The environment class type. Valid values: <code>mw1.small</code>,
  /// <code>mw1.medium</code>, <code>mw1.large</code>, <code>mw1.xlarge</code>,
  /// and <code>mw1.2xlarge</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/environment-class.html">Amazon
  /// MWAA environment class</a>.
  ///
  /// Parameter [kmsKey] :
  /// The Amazon Web Services Key Management Service (KMS) key to encrypt the
  /// data in your environment. You can use an Amazon Web Services owned CMK, or
  /// a Customer managed CMK (advanced). For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/create-environment.html">Create
  /// an Amazon MWAA environment</a>.
  ///
  /// Parameter [loggingConfiguration] :
  /// Defines the Apache Airflow logs to send to CloudWatch Logs.
  ///
  /// Parameter [maxWebservers] :
  /// The maximum number of web servers that you want to run in your
  /// environment. Amazon MWAA scales the number of Apache Airflow web servers
  /// up to the number you specify for <code>MaxWebservers</code> when you
  /// interact with your Apache Airflow environment using Apache Airflow REST
  /// API, or the Apache Airflow CLI. For example, in scenarios where your
  /// workload requires network calls to the Apache Airflow REST API with a high
  /// transaction-per-second (TPS) rate, Amazon MWAA will increase the number of
  /// web servers up to the number set in <code>MaxWebserers</code>. As TPS
  /// rates decrease Amazon MWAA disposes of the additional web servers, and
  /// scales down to the number set in <code>MinxWebserers</code>.
  ///
  /// Valid values: Accepts between <code>2</code> and <code>5</code>. Defaults
  /// to <code>2</code>.
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
  /// Parameter [minWebservers] :
  /// The minimum number of web servers that you want to run in your
  /// environment. Amazon MWAA scales the number of Apache Airflow web servers
  /// up to the number you specify for <code>MaxWebservers</code> when you
  /// interact with your Apache Airflow environment using Apache Airflow REST
  /// API, or the Apache Airflow CLI. As the transaction-per-second rate, and
  /// the network load, decrease, Amazon MWAA disposes of the additional web
  /// servers, and scales down to the number set in <code>MinxWebserers</code>.
  ///
  /// Valid values: Accepts between <code>2</code> and <code>5</code>. Defaults
  /// to <code>2</code>.
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
  /// The version of the plugins.zip file on your Amazon S3 bucket. You must
  /// specify a version each time a plugins.zip file is updated. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [pluginsS3Path] :
  /// The relative path to the <code>plugins.zip</code> file on your Amazon S3
  /// bucket. For example, <code>plugins.zip</code>. If specified, then the
  /// <code>plugins.zip</code> version is required. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  ///
  /// Parameter [requirementsS3ObjectVersion] :
  /// The version of the <code>requirements.txt</code> file on your Amazon S3
  /// bucket. You must specify a version each time a requirements.txt file is
  /// updated. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [requirementsS3Path] :
  /// The relative path to the <code>requirements.txt</code> file on your Amazon
  /// S3 bucket. For example, <code>requirements.txt</code>. If specified, then
  /// a version is required. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  ///
  /// Parameter [schedulers] :
  /// The number of Apache Airflow schedulers to run in your environment. Valid
  /// values:
  ///
  /// <ul>
  /// <li>
  /// v2 - Accepts between <code>2</code> to <code>5</code>. Defaults to
  /// <code>2</code>.
  /// </li>
  /// <li>
  /// v1 - Accepts <code>1</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [startupScriptS3ObjectVersion] :
  /// The version of the startup shell script in your Amazon S3 bucket. You must
  /// specify the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">version
  /// ID</a> that Amazon S3 assigns to the file every time you update the
  /// script.
  ///
  /// Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque strings that are
  /// no more than 1,024 bytes long. The following is an example:
  ///
  /// <code>3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/using-startup-script.html">Using
  /// a startup script</a>.
  ///
  /// Parameter [startupScriptS3Path] :
  /// The relative path to the startup shell script in your Amazon S3 bucket.
  /// For example, <code>s3://mwaa-environment/startup.sh</code>.
  ///
  /// Amazon MWAA runs the script as your environment starts, and before running
  /// the Apache Airflow process. You can use this script to install
  /// dependencies, modify Apache Airflow configuration options, and set
  /// environment variables. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/using-startup-script.html">Using
  /// a startup script</a>.
  ///
  /// Parameter [tags] :
  /// The key-value tag pairs you want to associate to your environment. For
  /// example, <code>"Environment": "Staging"</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  ///
  /// Parameter [webserverAccessMode] :
  /// Defines the access mode for the Apache Airflow <i>web server</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-networking.html">Apache
  /// Airflow access modes</a>.
  ///
  /// Parameter [weeklyMaintenanceWindowStart] :
  /// The day and time of the week in Coordinated Universal Time (UTC) 24-hour
  /// standard time to start weekly maintenance updates of your environment in
  /// the following format: <code>DAY:HH:MM</code>. For example:
  /// <code>TUE:03:30</code>. You can specify a start time in 30 minute
  /// increments only.
  Future<CreateEnvironmentOutput> createEnvironment({
    required String dagS3Path,
    required String executionRoleArn,
    required String name,
    required NetworkConfiguration networkConfiguration,
    required String sourceBucketArn,
    Map<String, String>? airflowConfigurationOptions,
    String? airflowVersion,
    EndpointManagement? endpointManagement,
    String? environmentClass,
    String? kmsKey,
    LoggingConfigurationInput? loggingConfiguration,
    int? maxWebservers,
    int? maxWorkers,
    int? minWebservers,
    int? minWorkers,
    String? pluginsS3ObjectVersion,
    String? pluginsS3Path,
    String? requirementsS3ObjectVersion,
    String? requirementsS3Path,
    int? schedulers,
    String? startupScriptS3ObjectVersion,
    String? startupScriptS3Path,
    Map<String, String>? tags,
    WebserverAccessMode? webserverAccessMode,
    String? weeklyMaintenanceWindowStart,
  }) async {
    _s.validateNumRange(
      'maxWebservers',
      maxWebservers,
      2,
      1152921504606846976,
    );
    _s.validateNumRange(
      'maxWorkers',
      maxWorkers,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minWebservers',
      minWebservers,
      2,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minWorkers',
      minWorkers,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'schedulers',
      schedulers,
      0,
      5,
    );
    final $payload = <String, dynamic>{
      'DagS3Path': dagS3Path,
      'ExecutionRoleArn': executionRoleArn,
      'NetworkConfiguration': networkConfiguration,
      'SourceBucketArn': sourceBucketArn,
      if (airflowConfigurationOptions != null)
        'AirflowConfigurationOptions': airflowConfigurationOptions,
      if (airflowVersion != null) 'AirflowVersion': airflowVersion,
      if (endpointManagement != null)
        'EndpointManagement': endpointManagement.toValue(),
      if (environmentClass != null) 'EnvironmentClass': environmentClass,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (maxWebservers != null) 'MaxWebservers': maxWebservers,
      if (maxWorkers != null) 'MaxWorkers': maxWorkers,
      if (minWebservers != null) 'MinWebservers': minWebservers,
      if (minWorkers != null) 'MinWorkers': minWorkers,
      if (pluginsS3ObjectVersion != null)
        'PluginsS3ObjectVersion': pluginsS3ObjectVersion,
      if (pluginsS3Path != null) 'PluginsS3Path': pluginsS3Path,
      if (requirementsS3ObjectVersion != null)
        'RequirementsS3ObjectVersion': requirementsS3ObjectVersion,
      if (requirementsS3Path != null) 'RequirementsS3Path': requirementsS3Path,
      if (schedulers != null) 'Schedulers': schedulers,
      if (startupScriptS3ObjectVersion != null)
        'StartupScriptS3ObjectVersion': startupScriptS3ObjectVersion,
      if (startupScriptS3Path != null)
        'StartupScriptS3Path': startupScriptS3Path,
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

  /// Creates a web login token for the Airflow Web UI. To learn more, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/call-mwaa-apis-web.html">Creating
  /// an Apache Airflow web login token</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  Future<CreateWebLoginTokenResponse> createWebLoginToken({
    required String name,
  }) async {
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environments/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes an Amazon Managed Workflows for Apache Airflow (MWAA)
  /// environment.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// <b>Internal only</b>. Publishes environment health metrics to Amazon
  /// CloudWatch.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentName] :
  /// <b>Internal only</b>. The name of the environment.
  ///
  /// Parameter [metricData] :
  /// <b>Internal only</b>. Publishes metrics to Amazon CloudWatch. To learn
  /// more about the metrics published to Amazon CloudWatch, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/cw-metrics.html">Amazon
  /// MWAA performance metrics in Amazon CloudWatch</a>.
  @Deprecated(
      'This API is for internal use and not meant for public use, and is no longer available.')
  Future<void> publishMetrics({
    required String environmentName,
    required List<MetricDatum> metricData,
  }) async {
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
  /// example, <code>"Environment": "Staging"</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
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
  /// options you want to attach to your environment. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Apache
  /// Airflow configuration options</a>.
  ///
  /// Parameter [airflowVersion] :
  /// The Apache Airflow version for your environment. To upgrade your
  /// environment, specify a newer version of Apache Airflow supported by Amazon
  /// MWAA.
  ///
  /// Before you upgrade an environment, make sure your requirements, DAGs,
  /// plugins, and other resources used in your workflows are compatible with
  /// the new Apache Airflow version. For more information about updating your
  /// resources, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/upgrading-environment.html">Upgrading
  /// an Amazon MWAA environment</a>.
  ///
  /// Valid values: <code>1.10.12</code>, <code>2.0.2</code>,
  /// <code>2.2.2</code>, <code>2.4.3</code>, <code>2.5.1</code>,
  /// <code>2.6.3</code>, <code>2.7.2</code>, <code>2.8.1</code>.
  ///
  /// Parameter [dagS3Path] :
  /// The relative path to the DAGs folder on your Amazon S3 bucket. For
  /// example, <code>dags</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-folder.html">Adding
  /// or updating DAGs</a>.
  ///
  /// Parameter [environmentClass] :
  /// The environment class type. Valid values: <code>mw1.small</code>,
  /// <code>mw1.medium</code>, <code>mw1.large</code>, <code>mw1.xlarge</code>,
  /// and <code>mw1.2xlarge</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/environment-class.html">Amazon
  /// MWAA environment class</a>.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the execution role in IAM that allows
  /// MWAA to access Amazon Web Services resources in your environment. For
  /// example, <code>arn:aws:iam::123456789:role/my-execution-role</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-create-role.html">Amazon
  /// MWAA Execution role</a>.
  ///
  /// Parameter [loggingConfiguration] :
  /// The Apache Airflow log types to send to CloudWatch Logs.
  ///
  /// Parameter [maxWebservers] :
  /// The maximum number of web servers that you want to run in your
  /// environment. Amazon MWAA scales the number of Apache Airflow web servers
  /// up to the number you specify for <code>MaxWebservers</code> when you
  /// interact with your Apache Airflow environment using Apache Airflow REST
  /// API, or the Apache Airflow CLI. For example, in scenarios where your
  /// workload requires network calls to the Apache Airflow REST API with a high
  /// transaction-per-second (TPS) rate, Amazon MWAA will increase the number of
  /// web servers up to the number set in <code>MaxWebserers</code>. As TPS
  /// rates decrease Amazon MWAA disposes of the additional web servers, and
  /// scales down to the number set in <code>MinxWebserers</code>.
  ///
  /// Valid values: Accepts between <code>2</code> and <code>5</code>. Defaults
  /// to <code>2</code>.
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
  /// Parameter [minWebservers] :
  /// The minimum number of web servers that you want to run in your
  /// environment. Amazon MWAA scales the number of Apache Airflow web servers
  /// up to the number you specify for <code>MaxWebservers</code> when you
  /// interact with your Apache Airflow environment using Apache Airflow REST
  /// API, or the Apache Airflow CLI. As the transaction-per-second rate, and
  /// the network load, decrease, Amazon MWAA disposes of the additional web
  /// servers, and scales down to the number set in <code>MinxWebserers</code>.
  ///
  /// Valid values: Accepts between <code>2</code> and <code>5</code>. Defaults
  /// to <code>2</code>.
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
  /// between the Amazon Web Services resources for your environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
  /// networking on Amazon MWAA</a>.
  ///
  /// Parameter [pluginsS3ObjectVersion] :
  /// The version of the plugins.zip file on your Amazon S3 bucket. You must
  /// specify a version each time a <code>plugins.zip</code> file is updated.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [pluginsS3Path] :
  /// The relative path to the <code>plugins.zip</code> file on your Amazon S3
  /// bucket. For example, <code>plugins.zip</code>. If specified, then the
  /// plugins.zip version is required. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  ///
  /// Parameter [requirementsS3ObjectVersion] :
  /// The version of the requirements.txt file on your Amazon S3 bucket. You
  /// must specify a version each time a <code>requirements.txt</code> file is
  /// updated. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">How
  /// S3 Versioning works</a>.
  ///
  /// Parameter [requirementsS3Path] :
  /// The relative path to the <code>requirements.txt</code> file on your Amazon
  /// S3 bucket. For example, <code>requirements.txt</code>. If specified, then
  /// a file version is required. For more information, see <a
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
  /// <code>arn:aws:s3:::my-airflow-bucket-unique-name</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-s3-bucket.html">Create
  /// an Amazon S3 bucket for Amazon MWAA</a>.
  ///
  /// Parameter [startupScriptS3ObjectVersion] :
  /// The version of the startup shell script in your Amazon S3 bucket. You must
  /// specify the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">version
  /// ID</a> that Amazon S3 assigns to the file every time you update the
  /// script.
  ///
  /// Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque strings that are
  /// no more than 1,024 bytes long. The following is an example:
  ///
  /// <code>3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/using-startup-script.html">Using
  /// a startup script</a>.
  ///
  /// Parameter [startupScriptS3Path] :
  /// The relative path to the startup shell script in your Amazon S3 bucket.
  /// For example, <code>s3://mwaa-environment/startup.sh</code>.
  ///
  /// Amazon MWAA runs the script as your environment starts, and before running
  /// the Apache Airflow process. You can use this script to install
  /// dependencies, modify Apache Airflow configuration options, and set
  /// environment variables. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/using-startup-script.html">Using
  /// a startup script</a>.
  ///
  /// Parameter [webserverAccessMode] :
  /// The Apache Airflow <i>Web server</i> access mode. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-networking.html">Apache
  /// Airflow access modes</a>.
  ///
  /// Parameter [weeklyMaintenanceWindowStart] :
  /// The day and time of the week in Coordinated Universal Time (UTC) 24-hour
  /// standard time to start weekly maintenance updates of your environment in
  /// the following format: <code>DAY:HH:MM</code>. For example:
  /// <code>TUE:03:30</code>. You can specify a start time in 30 minute
  /// increments only.
  Future<UpdateEnvironmentOutput> updateEnvironment({
    required String name,
    Map<String, String>? airflowConfigurationOptions,
    String? airflowVersion,
    String? dagS3Path,
    String? environmentClass,
    String? executionRoleArn,
    LoggingConfigurationInput? loggingConfiguration,
    int? maxWebservers,
    int? maxWorkers,
    int? minWebservers,
    int? minWorkers,
    UpdateNetworkConfigurationInput? networkConfiguration,
    String? pluginsS3ObjectVersion,
    String? pluginsS3Path,
    String? requirementsS3ObjectVersion,
    String? requirementsS3Path,
    int? schedulers,
    String? sourceBucketArn,
    String? startupScriptS3ObjectVersion,
    String? startupScriptS3Path,
    WebserverAccessMode? webserverAccessMode,
    String? weeklyMaintenanceWindowStart,
  }) async {
    _s.validateNumRange(
      'maxWebservers',
      maxWebservers,
      2,
      1152921504606846976,
    );
    _s.validateNumRange(
      'maxWorkers',
      maxWorkers,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minWebservers',
      minWebservers,
      2,
      1152921504606846976,
    );
    _s.validateNumRange(
      'minWorkers',
      minWorkers,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'schedulers',
      schedulers,
      0,
      5,
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
      if (maxWebservers != null) 'MaxWebservers': maxWebservers,
      if (maxWorkers != null) 'MaxWorkers': maxWorkers,
      if (minWebservers != null) 'MinWebservers': minWebservers,
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
      if (startupScriptS3ObjectVersion != null)
        'StartupScriptS3ObjectVersion': startupScriptS3ObjectVersion,
      if (startupScriptS3Path != null)
        'StartupScriptS3Path': startupScriptS3Path,
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
  /// An Airflow CLI login token.
  final String? cliToken;

  /// The Airflow web server hostname for the environment.
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
  /// The user name of the Apache Airflow identity creating the web login token.
  final String? airflowIdentity;

  /// The name of the IAM identity creating the web login token. This might be an
  /// IAM user, or an assumed or federated identity. For example,
  /// <code>assumed-role/Admin/your-name</code>.
  final String? iamIdentity;

  /// The Airflow web server hostname for the environment.
  final String? webServerHostname;

  /// An Airflow web server login token.
  final String? webToken;

  CreateWebLoginTokenResponse({
    this.airflowIdentity,
    this.iamIdentity,
    this.webServerHostname,
    this.webToken,
  });

  factory CreateWebLoginTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateWebLoginTokenResponse(
      airflowIdentity: json['AirflowIdentity'] as String?,
      iamIdentity: json['IamIdentity'] as String?,
      webServerHostname: json['WebServerHostname'] as String?,
      webToken: json['WebToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final airflowIdentity = this.airflowIdentity;
    final iamIdentity = this.iamIdentity;
    final webServerHostname = this.webServerHostname;
    final webToken = this.webToken;
    return {
      if (airflowIdentity != null) 'AirflowIdentity': airflowIdentity,
      if (iamIdentity != null) 'IamIdentity': iamIdentity,
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

/// <b>Internal only</b>. Represents the dimensions of a metric. To learn more
/// about the metrics published to Amazon CloudWatch, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/cw-metrics.html">Amazon
/// MWAA performance metrics in Amazon CloudWatch</a>.
@Deprecated(
    'This type is for internal use and not meant for public use. Data set for this type will be ignored.')
class Dimension {
  /// <b>Internal only</b>. The name of the dimension.
  final String name;

  /// <b>Internal only</b>. The value of the dimension.
  final String value;

  Dimension({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

enum EndpointManagement {
  customer,
  service,
}

extension EndpointManagementValueExtension on EndpointManagement {
  String toValue() {
    switch (this) {
      case EndpointManagement.customer:
        return 'CUSTOMER';
      case EndpointManagement.service:
        return 'SERVICE';
    }
  }
}

extension EndpointManagementFromString on String {
  EndpointManagement toEndpointManagement() {
    switch (this) {
      case 'CUSTOMER':
        return EndpointManagement.customer;
      case 'SERVICE':
        return EndpointManagement.service;
    }
    throw Exception('$this is not known in enum EndpointManagement');
  }
}

/// Describes an Amazon Managed Workflows for Apache Airflow (MWAA) environment.
class Environment {
  /// A list of key-value pairs containing the Apache Airflow configuration
  /// options attached to your environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Apache
  /// Airflow configuration options</a>.
  final Map<String, String>? airflowConfigurationOptions;

  /// The Apache Airflow version on your environment.
  ///
  /// Valid values: <code>1.10.12</code>, <code>2.0.2</code>, <code>2.2.2</code>,
  /// <code>2.4.3</code>, <code>2.5.1</code>, <code>2.6.3</code>,
  /// <code>2.7.2</code>, <code>2.8.1</code>.
  final String? airflowVersion;

  /// The Amazon Resource Name (ARN) of the Amazon MWAA environment.
  final String? arn;

  /// The queue ARN for the environment's <a
  /// href="https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/executor/celery.html">Celery
  /// Executor</a>. Amazon MWAA uses a Celery Executor to distribute tasks across
  /// multiple workers. When you create an environment in a shared VPC, you must
  /// provide access to the Celery Executor queue from your VPC.
  final String? celeryExecutorQueue;

  /// The day and time the environment was created.
  final DateTime? createdAt;

  /// The relative path to the DAGs folder in your Amazon S3 bucket. For example,
  /// <code>s3://mwaa-environment/dags</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-folder.html">Adding
  /// or updating DAGs</a>.
  final String? dagS3Path;

  /// The VPC endpoint for the environment's Amazon RDS database.
  final String? databaseVpcEndpointService;

  /// Defines whether the VPC endpoints configured for the environment are
  /// created, and managed, by the customer or by Amazon MWAA. If set to
  /// <code>SERVICE</code>, Amazon MWAA will create and manage the required VPC
  /// endpoints in your VPC. If set to <code>CUSTOMER</code>, you must create, and
  /// manage, the VPC endpoints in your VPC.
  final EndpointManagement? endpointManagement;

  /// The environment class type. Valid values: <code>mw1.small</code>,
  /// <code>mw1.medium</code>, <code>mw1.large</code>, <code>mw1.xlarge</code>,
  /// and <code>mw1.2xlarge</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/environment-class.html">Amazon
  /// MWAA environment class</a>.
  final String? environmentClass;

  /// The Amazon Resource Name (ARN) of the execution role in IAM that allows MWAA
  /// to access Amazon Web Services resources in your environment. For example,
  /// <code>arn:aws:iam::123456789:role/my-execution-role</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-create-role.html">Amazon
  /// MWAA Execution role</a>.
  final String? executionRoleArn;

  /// The KMS encryption key used to encrypt the data in your environment.
  final String? kmsKey;

  /// The status of the last update on the environment.
  final LastUpdate? lastUpdate;

  /// The Apache Airflow logs published to CloudWatch Logs.
  final LoggingConfiguration? loggingConfiguration;

  /// The maximum number of web servers that you want to run in your environment.
  /// Amazon MWAA scales the number of Apache Airflow web servers up to the number
  /// you specify for <code>MaxWebservers</code> when you interact with your
  /// Apache Airflow environment using Apache Airflow REST API, or the Apache
  /// Airflow CLI. For example, in scenarios where your workload requires network
  /// calls to the Apache Airflow REST API with a high transaction-per-second
  /// (TPS) rate, Amazon MWAA will increase the number of web servers up to the
  /// number set in <code>MaxWebserers</code>. As TPS rates decrease Amazon MWAA
  /// disposes of the additional web servers, and scales down to the number set in
  /// <code>MinxWebserers</code>.
  ///
  /// Valid values: Accepts between <code>2</code> and <code>5</code>. Defaults to
  /// <code>2</code>.
  final int? maxWebservers;

  /// The maximum number of workers that run in your environment. For example,
  /// <code>20</code>.
  final int? maxWorkers;

  /// The minimum number of web servers that you want to run in your environment.
  /// Amazon MWAA scales the number of Apache Airflow web servers up to the number
  /// you specify for <code>MaxWebservers</code> when you interact with your
  /// Apache Airflow environment using Apache Airflow REST API, or the Apache
  /// Airflow CLI. As the transaction-per-second rate, and the network load,
  /// decrease, Amazon MWAA disposes of the additional web servers, and scales
  /// down to the number set in <code>MinxWebserers</code>.
  ///
  /// Valid values: Accepts between <code>2</code> and <code>5</code>. Defaults to
  /// <code>2</code>.
  final int? minWebservers;

  /// The minimum number of workers that run in your environment. For example,
  /// <code>2</code>.
  final int? minWorkers;

  /// The name of the Amazon MWAA environment. For example,
  /// <code>MyMWAAEnvironment</code>.
  final String? name;

  /// Describes the VPC networking components used to secure and enable network
  /// traffic between the Amazon Web Services resources for your environment. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
  /// networking on Amazon MWAA</a>.
  final NetworkConfiguration? networkConfiguration;

  /// The version of the <code>plugins.zip</code> file in your Amazon S3 bucket.
  /// You must specify the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">version
  /// ID</a> that Amazon S3 assigns to the file.
  ///
  /// Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque strings that are
  /// no more than 1,024 bytes long. The following is an example:
  ///
  /// <code>3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  final String? pluginsS3ObjectVersion;

  /// The relative path to the file in your Amazon S3 bucket. For example,
  /// <code>s3://mwaa-environment/plugins.zip</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import-plugins.html">Installing
  /// custom plugins</a>.
  final String? pluginsS3Path;

  /// The version of the <code>requirements.txt </code> file on your Amazon S3
  /// bucket. You must specify the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">version
  /// ID</a> that Amazon S3 assigns to the file.
  ///
  /// Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque strings that are
  /// no more than 1,024 bytes long. The following is an example:
  ///
  /// <code>3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  final String? requirementsS3ObjectVersion;

  /// The relative path to the <code>requirements.txt</code> file in your Amazon
  /// S3 bucket. For example, <code>s3://mwaa-environment/requirements.txt</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/working-dags-dependencies.html">Installing
  /// Python dependencies</a>.
  final String? requirementsS3Path;

  /// The number of Apache Airflow schedulers that run in your Amazon MWAA
  /// environment.
  final int? schedulers;

  /// The Amazon Resource Name (ARN) for the service-linked role of the
  /// environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-slr.html">Amazon
  /// MWAA Service-linked role</a>.
  final String? serviceRoleArn;

  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket where your DAG code
  /// and supporting files are stored. For example,
  /// <code>arn:aws:s3:::my-airflow-bucket-unique-name</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/mwaa-s3-bucket.html">Create
  /// an Amazon S3 bucket for Amazon MWAA</a>.
  final String? sourceBucketArn;

  /// The version of the startup shell script in your Amazon S3 bucket. You must
  /// specify the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/versioning-workflows.html">version
  /// ID</a> that Amazon S3 assigns to the file.
  ///
  /// Version IDs are Unicode, UTF-8 encoded, URL-ready, opaque strings that are
  /// no more than 1,024 bytes long. The following is an example:
  ///
  /// <code>3sL4kqtJlcpXroDTDmJ+rmSpXd3dIbrHY+MTRCxf3vjVBH40Nr8X8gdRQBpUMLUo</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/using-startup-script.html">Using
  /// a startup script</a>.
  final String? startupScriptS3ObjectVersion;

  /// The relative path to the startup shell script in your Amazon S3 bucket. For
  /// example, <code>s3://mwaa-environment/startup.sh</code>.
  ///
  /// Amazon MWAA runs the script as your environment starts, and before running
  /// the Apache Airflow process. You can use this script to install dependencies,
  /// modify Apache Airflow configuration options, and set environment variables.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/using-startup-script.html">Using
  /// a startup script</a>.
  final String? startupScriptS3Path;

  /// The status of the Amazon MWAA environment.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - Indicates the request to create the environment is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>CREATING_SNAPSHOT</code> - Indicates the request to update environment
  /// details, or upgrade the environment version, is in progress and Amazon MWAA
  /// is creating a storage volume snapshot of the Amazon RDS database cluster
  /// associated with the environment. A database snapshot is a backup created at
  /// a specific point in time. Amazon MWAA uses snapshots to recover environment
  /// metadata if the process to update or upgrade an environment fails.
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
  /// <code>PENDING</code> - Indicates the request was successful, but the process
  /// to create the environment is paused until you create the required VPC
  /// endpoints in your VPC. After you create the VPC endpoints, the process
  /// resumes.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - Indicates the request to update the environment is
  /// in progress.
  /// </li>
  /// <li>
  /// <code>ROLLING_BACK</code> - Indicates the request to update environment
  /// details, or upgrade the environment version, failed and Amazon MWAA is
  /// restoring the environment using the latest storage volume snapshot.
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
  /// did not return to its previous state and is not stable.
  /// </li>
  /// <li>
  /// <code>UPDATE_FAILED</code> - Indicates the request to update the environment
  /// failed, and the environment was restored to its previous state successfully
  /// and is ready to use.
  /// </li>
  /// <li>
  /// <code>MAINTENANCE</code> - Indicates that the environment is undergoing
  /// maintenance. Depending on the type of work Amazon MWAA is performing, your
  /// environment might become unavailable during this process. After all
  /// operations are done, your environment will return to its status prior to
  /// mainteneace operations.
  /// </li>
  /// </ul>
  /// We recommend reviewing our troubleshooting guide for a list of common errors
  /// and their solutions. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/troubleshooting.html">Amazon
  /// MWAA troubleshooting</a>.
  final EnvironmentStatus? status;

  /// The key-value tag pairs associated to your environment. For example,
  /// <code>"Environment": "Staging"</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  final Map<String, String>? tags;

  /// The Apache Airflow <i>web server</i> access mode. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-networking.html">Apache
  /// Airflow access modes</a>.
  final WebserverAccessMode? webserverAccessMode;

  /// The Apache Airflow <i>web server</i> host name for the Amazon MWAA
  /// environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/access-airflow-ui.html">Accessing
  /// the Apache Airflow UI</a>.
  final String? webserverUrl;

  /// The VPC endpoint for the environment's web server.
  final String? webserverVpcEndpointService;

  /// The day and time of the week in Coordinated Universal Time (UTC) 24-hour
  /// standard time that weekly maintenance updates are scheduled. For example:
  /// <code>TUE:03:30</code>.
  final String? weeklyMaintenanceWindowStart;

  Environment({
    this.airflowConfigurationOptions,
    this.airflowVersion,
    this.arn,
    this.celeryExecutorQueue,
    this.createdAt,
    this.dagS3Path,
    this.databaseVpcEndpointService,
    this.endpointManagement,
    this.environmentClass,
    this.executionRoleArn,
    this.kmsKey,
    this.lastUpdate,
    this.loggingConfiguration,
    this.maxWebservers,
    this.maxWorkers,
    this.minWebservers,
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
    this.startupScriptS3ObjectVersion,
    this.startupScriptS3Path,
    this.status,
    this.tags,
    this.webserverAccessMode,
    this.webserverUrl,
    this.webserverVpcEndpointService,
    this.weeklyMaintenanceWindowStart,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      airflowConfigurationOptions:
          (json['AirflowConfigurationOptions'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      airflowVersion: json['AirflowVersion'] as String?,
      arn: json['Arn'] as String?,
      celeryExecutorQueue: json['CeleryExecutorQueue'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      dagS3Path: json['DagS3Path'] as String?,
      databaseVpcEndpointService: json['DatabaseVpcEndpointService'] as String?,
      endpointManagement:
          (json['EndpointManagement'] as String?)?.toEndpointManagement(),
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
      maxWebservers: json['MaxWebservers'] as int?,
      maxWorkers: json['MaxWorkers'] as int?,
      minWebservers: json['MinWebservers'] as int?,
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
      startupScriptS3ObjectVersion:
          json['StartupScriptS3ObjectVersion'] as String?,
      startupScriptS3Path: json['StartupScriptS3Path'] as String?,
      status: (json['Status'] as String?)?.toEnvironmentStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      webserverAccessMode:
          (json['WebserverAccessMode'] as String?)?.toWebserverAccessMode(),
      webserverUrl: json['WebserverUrl'] as String?,
      webserverVpcEndpointService:
          json['WebserverVpcEndpointService'] as String?,
      weeklyMaintenanceWindowStart:
          json['WeeklyMaintenanceWindowStart'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final airflowConfigurationOptions = this.airflowConfigurationOptions;
    final airflowVersion = this.airflowVersion;
    final arn = this.arn;
    final celeryExecutorQueue = this.celeryExecutorQueue;
    final createdAt = this.createdAt;
    final dagS3Path = this.dagS3Path;
    final databaseVpcEndpointService = this.databaseVpcEndpointService;
    final endpointManagement = this.endpointManagement;
    final environmentClass = this.environmentClass;
    final executionRoleArn = this.executionRoleArn;
    final kmsKey = this.kmsKey;
    final lastUpdate = this.lastUpdate;
    final loggingConfiguration = this.loggingConfiguration;
    final maxWebservers = this.maxWebservers;
    final maxWorkers = this.maxWorkers;
    final minWebservers = this.minWebservers;
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
    final startupScriptS3ObjectVersion = this.startupScriptS3ObjectVersion;
    final startupScriptS3Path = this.startupScriptS3Path;
    final status = this.status;
    final tags = this.tags;
    final webserverAccessMode = this.webserverAccessMode;
    final webserverUrl = this.webserverUrl;
    final webserverVpcEndpointService = this.webserverVpcEndpointService;
    final weeklyMaintenanceWindowStart = this.weeklyMaintenanceWindowStart;
    return {
      if (airflowConfigurationOptions != null)
        'AirflowConfigurationOptions': airflowConfigurationOptions,
      if (airflowVersion != null) 'AirflowVersion': airflowVersion,
      if (arn != null) 'Arn': arn,
      if (celeryExecutorQueue != null)
        'CeleryExecutorQueue': celeryExecutorQueue,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dagS3Path != null) 'DagS3Path': dagS3Path,
      if (databaseVpcEndpointService != null)
        'DatabaseVpcEndpointService': databaseVpcEndpointService,
      if (endpointManagement != null)
        'EndpointManagement': endpointManagement.toValue(),
      if (environmentClass != null) 'EnvironmentClass': environmentClass,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (kmsKey != null) 'KmsKey': kmsKey,
      if (lastUpdate != null) 'LastUpdate': lastUpdate,
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
      if (maxWebservers != null) 'MaxWebservers': maxWebservers,
      if (maxWorkers != null) 'MaxWorkers': maxWorkers,
      if (minWebservers != null) 'MinWebservers': minWebservers,
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
      if (startupScriptS3ObjectVersion != null)
        'StartupScriptS3ObjectVersion': startupScriptS3ObjectVersion,
      if (startupScriptS3Path != null)
        'StartupScriptS3Path': startupScriptS3Path,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (webserverAccessMode != null)
        'WebserverAccessMode': webserverAccessMode.toValue(),
      if (webserverUrl != null) 'WebserverUrl': webserverUrl,
      if (webserverVpcEndpointService != null)
        'WebserverVpcEndpointService': webserverVpcEndpointService,
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
  rollingBack,
  creatingSnapshot,
  pending,
  maintenance,
}

extension EnvironmentStatusValueExtension on EnvironmentStatus {
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
      case EnvironmentStatus.rollingBack:
        return 'ROLLING_BACK';
      case EnvironmentStatus.creatingSnapshot:
        return 'CREATING_SNAPSHOT';
      case EnvironmentStatus.pending:
        return 'PENDING';
      case EnvironmentStatus.maintenance:
        return 'MAINTENANCE';
    }
  }
}

extension EnvironmentStatusFromString on String {
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
      case 'ROLLING_BACK':
        return EnvironmentStatus.rollingBack;
      case 'CREATING_SNAPSHOT':
        return EnvironmentStatus.creatingSnapshot;
      case 'PENDING':
        return EnvironmentStatus.pending;
      case 'MAINTENANCE':
        return EnvironmentStatus.maintenance;
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

/// Describes the status of the last update on the environment, and any errors
/// that were encountered.
class LastUpdate {
  /// The day and time of the last update on the environment.
  final DateTime? createdAt;

  /// The error that was encountered during the last update of the environment.
  final UpdateError? error;

  /// The source of the last update to the environment. Includes internal
  /// processes by Amazon MWAA, such as an environment maintenance update.
  final String? source;

  /// The status of the last update on the environment.
  final UpdateStatus? status;

  LastUpdate({
    this.createdAt,
    this.error,
    this.source,
    this.status,
  });

  factory LastUpdate.fromJson(Map<String, dynamic> json) {
    return LastUpdate(
      createdAt: timeStampFromJson(json['CreatedAt']),
      error: json['Error'] != null
          ? UpdateError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      source: json['Source'] as String?,
      status: (json['Status'] as String?)?.toUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final error = this.error;
    final source = this.source;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (error != null) 'Error': error,
      if (source != null) 'Source': source,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ListEnvironmentsOutput {
  /// Returns a list of Amazon MWAA environments.
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
  /// The key-value tag pairs associated to your environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
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

/// Describes the Apache Airflow log types that are published to CloudWatch
/// Logs.
class LoggingConfiguration {
  /// The Airflow DAG processing logs published to CloudWatch Logs and the log
  /// level.
  final ModuleLoggingConfiguration? dagProcessingLogs;

  /// The Airflow scheduler logs published to CloudWatch Logs and the log level.
  final ModuleLoggingConfiguration? schedulerLogs;

  /// The Airflow task logs published to CloudWatch Logs and the log level.
  final ModuleLoggingConfiguration? taskLogs;

  /// The Airflow web server logs published to CloudWatch Logs and the log level.
  final ModuleLoggingConfiguration? webserverLogs;

  /// The Airflow worker logs published to CloudWatch Logs and the log level.
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

/// Defines the Apache Airflow log types to send to CloudWatch Logs.
class LoggingConfigurationInput {
  /// Publishes Airflow DAG processing logs to CloudWatch Logs.
  final ModuleLoggingConfigurationInput? dagProcessingLogs;

  /// Publishes Airflow scheduler logs to CloudWatch Logs.
  final ModuleLoggingConfigurationInput? schedulerLogs;

  /// Publishes Airflow task logs to CloudWatch Logs.
  final ModuleLoggingConfigurationInput? taskLogs;

  /// Publishes Airflow web server logs to CloudWatch Logs.
  final ModuleLoggingConfigurationInput? webserverLogs;

  /// Publishes Airflow worker logs to CloudWatch Logs.
  final ModuleLoggingConfigurationInput? workerLogs;

  LoggingConfigurationInput({
    this.dagProcessingLogs,
    this.schedulerLogs,
    this.taskLogs,
    this.webserverLogs,
    this.workerLogs,
  });

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

extension LoggingLevelValueExtension on LoggingLevel {
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

extension LoggingLevelFromString on String {
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

/// <b>Internal only</b>. Collects Apache Airflow metrics. To learn more about
/// the metrics published to Amazon CloudWatch, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/cw-metrics.html">Amazon
/// MWAA performance metrics in Amazon CloudWatch</a>.
@Deprecated(
    'This type is for internal use and not meant for public use. Data set for this type will be ignored.')
class MetricDatum {
  /// <b>Internal only</b>. The name of the metric.
  final String metricName;

  /// <b>Internal only</b>. The time the metric data was received.
  final DateTime timestamp;

  /// <b>Internal only</b>. The dimensions associated with the metric.
  final List<Dimension>? dimensions;

  /// <b>Internal only</b>. The statistical values for the metric.
  final StatisticSet? statisticValues;

  /// <b>Internal only</b>. The unit used to store the metric.
  final Unit? unit;

  /// <b>Internal only</b>. The value for the metric.
  final double? value;

  MetricDatum({
    required this.metricName,
    required this.timestamp,
    this.dimensions,
    this.statisticValues,
    this.unit,
    this.value,
  });

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

/// Describes the Apache Airflow log details for the log type (e.g.
/// <code>DagProcessingLogs</code>).
class ModuleLoggingConfiguration {
  /// The Amazon Resource Name (ARN) for the CloudWatch Logs group where the
  /// Apache Airflow log type (e.g. <code>DagProcessingLogs</code>) is published.
  /// For example,
  /// <code>arn:aws:logs:us-east-1:123456789012:log-group:airflow-MyMWAAEnvironment-MwaaEnvironment-DAGProcessing:*</code>.
  final String? cloudWatchLogGroupArn;

  /// Indicates whether the Apache Airflow log type (e.g.
  /// <code>DagProcessingLogs</code>) is enabled.
  final bool? enabled;

  /// The Apache Airflow log level for the log type (e.g.
  /// <code>DagProcessingLogs</code>).
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

/// Enables the Apache Airflow log type (e.g. <code>DagProcessingLogs</code>)
/// and defines the log level to send to CloudWatch Logs (e.g.
/// <code>INFO</code>).
class ModuleLoggingConfigurationInput {
  /// Indicates whether to enable the Apache Airflow log type (e.g.
  /// <code>DagProcessingLogs</code>).
  final bool enabled;

  /// Defines the Apache Airflow log level (e.g. <code>INFO</code>) to send to
  /// CloudWatch Logs.
  final LoggingLevel logLevel;

  ModuleLoggingConfigurationInput({
    required this.enabled,
    required this.logLevel,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logLevel = this.logLevel;
    return {
      'Enabled': enabled,
      'LogLevel': logLevel.toValue(),
    };
  }
}

/// Describes the VPC networking components used to secure and enable network
/// traffic between the Amazon Web Services resources for your environment. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
/// networking on Amazon MWAA</a>.
class NetworkConfiguration {
  /// A list of security group IDs. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/vpc-security.html">Security
  /// in your VPC on Amazon MWAA</a>.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
  /// networking on Amazon MWAA</a>.
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

@Deprecated(
    'This type is for internal use and not meant for public use. Data set for this type will be ignored.')
class PublishMetricsOutput {
  PublishMetricsOutput();

  factory PublishMetricsOutput.fromJson(Map<String, dynamic> _) {
    return PublishMetricsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <b>Internal only</b>. Represents a set of statistics that describe a
/// specific metric. To learn more about the metrics published to Amazon
/// CloudWatch, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/cw-metrics.html">Amazon
/// MWAA performance metrics in Amazon CloudWatch</a>.
@Deprecated(
    'This type is for internal use and not meant for public use. Data set for this type will be ignored.')
class StatisticSet {
  /// <b>Internal only</b>. The maximum value of the sample set.
  final double? maximum;

  /// <b>Internal only</b>. The minimum value of the sample set.
  final double? minimum;

  /// <b>Internal only</b>. The number of samples used for the statistic set.
  final int? sampleCount;

  /// <b>Internal only</b>. The sum of values for the sample set.
  final double? sum;

  StatisticSet({
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
  });

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

extension UnitValueExtension on Unit {
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

extension UnitFromString on String {
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

/// Describes the error(s) encountered with the last update of the environment.
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

/// Defines the VPC networking components used to secure and enable network
/// traffic between the Amazon Web Services resources for your environment. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/networking-about.html">About
/// networking on Amazon MWAA</a>.
class UpdateNetworkConfigurationInput {
  /// A list of security group IDs. A security group must be attached to the same
  /// VPC as the subnets. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/vpc-security.html">Security
  /// in your VPC on Amazon MWAA</a>.
  final List<String> securityGroupIds;

  UpdateNetworkConfigurationInput({
    required this.securityGroupIds,
  });

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

extension UpdateStatusValueExtension on UpdateStatus {
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

extension UpdateStatusFromString on String {
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

extension WebserverAccessModeValueExtension on WebserverAccessMode {
  String toValue() {
    switch (this) {
      case WebserverAccessMode.privateOnly:
        return 'PRIVATE_ONLY';
      case WebserverAccessMode.publicOnly:
        return 'PUBLIC_ONLY';
    }
  }
}

extension WebserverAccessModeFromString on String {
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
