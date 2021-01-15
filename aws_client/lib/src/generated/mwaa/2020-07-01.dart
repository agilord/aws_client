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

part '2020-07-01.g.dart';

/// This section contains the Amazon Managed Workflows for Apache Airflow (MWAA)
/// API reference documentation. For more information, see <a
/// href="https://docs.aws.amazon.com/mwaa/latest/userguide/what-is-mwaa.html">What
/// Is Amazon MWAA?</a>.
class Mwaa {
  final _s.RestJsonProtocol _protocol;
  Mwaa({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
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

  /// JSON blob that describes the environment to create.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dagS3Path] :
  /// The relative path to the DAG folder on your Amazon S3 storage bucket. For
  /// example, <code>dags</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import.html">Importing
  /// DAGs on Amazon MWAA</a>.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the execution role for your environment.
  /// An execution role is an AWS Identity and Access Management (IAM) role that
  /// grants MWAA permission to access AWS services and resources used by your
  /// environment. For example,
  /// <code>arn:aws:iam::123456789:role/my-execution-role</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/manage-access.html">Managing
  /// access to Amazon Managed Workflows for Apache Airflow</a>.
  ///
  /// Parameter [name] :
  /// The name of your MWAA environment.
  ///
  /// Parameter [networkConfiguration] :
  /// The VPC networking components you want to use for your environment. At
  /// least two private subnet identifiers and one VPC security group identifier
  /// are required to create an environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/vpc-mwaa.html">Creating
  /// the VPC network for a MWAA environment</a>.
  ///
  /// Parameter [sourceBucketArn] :
  /// The Amazon Resource Name (ARN) of your Amazon S3 storage bucket. For
  /// example, <code>arn:aws:s3:::airflow-mybucketname</code>.
  ///
  /// Parameter [airflowConfigurationOptions] :
  /// The Apache Airflow configuration setting you want to override in your
  /// environment. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-env-variables.html">Environment
  /// configuration</a>.
  ///
  /// Parameter [airflowVersion] :
  /// The Apache Airflow version you want to use for your environment.
  ///
  /// Parameter [environmentClass] :
  /// The environment class you want to use for your environment. The
  /// environment class determines the size of the containers and database used
  /// for your Apache Airflow services.
  ///
  /// Parameter [kmsKey] :
  /// The AWS Key Management Service (KMS) key to encrypt and decrypt the data
  /// in your environment. You can use an AWS KMS key managed by MWAA, or a
  /// custom KMS key (advanced). For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html?icmpid=docs_console_unmapped#master_keys">Customer
  /// master keys (CMKs)</a> in the AWS KMS developer guide.
  ///
  /// Parameter [loggingConfiguration] :
  /// The Apache Airflow logs you want to send to Amazon CloudWatch Logs.
  ///
  /// Parameter [maxWorkers] :
  /// The maximum number of workers that you want to run in your environment.
  /// MWAA scales the number of Apache Airflow workers and the Fargate
  /// containers that run your tasks up to the number you specify in this field.
  /// When there are no more tasks running, and no more in the queue, MWAA
  /// disposes of the extra containers leaving the one worker that is included
  /// with your environment.
  ///
  /// Parameter [pluginsS3ObjectVersion] :
  /// The <code>plugins.zip</code> file version you want to use.
  ///
  /// Parameter [pluginsS3Path] :
  /// The relative path to the <code>plugins.zip</code> file on your Amazon S3
  /// storage bucket. For example, <code>plugins.zip</code>. If a relative path
  /// is provided in the request, then <code>PluginsS3ObjectVersion</code> is
  /// required. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import.html">Importing
  /// DAGs on Amazon MWAA</a>.
  ///
  /// Parameter [requirementsS3ObjectVersion] :
  /// The <code>requirements.txt</code> file version you want to use.
  ///
  /// Parameter [requirementsS3Path] :
  /// The relative path to the <code>requirements.txt</code> file on your Amazon
  /// S3 storage bucket. For example, <code>requirements.txt</code>. If a
  /// relative path is provided in the request, then
  /// <code>RequirementsS3ObjectVersion</code> is required. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/configuring-dag-import.html">Importing
  /// DAGs on Amazon MWAA</a>.
  ///
  /// Parameter [tags] :
  /// The metadata tags you want to attach to your environment. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a>.
  ///
  /// Parameter [webserverAccessMode] :
  /// The networking access of your Apache Airflow web server. A public network
  /// allows your Airflow UI to be accessed over the Internet by users granted
  /// access in your IAM policy. A private network limits access of your Airflow
  /// UI to users within your VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/mwaa/latest/userguide/vpc-mwaa.html">Creating
  /// the VPC network for a MWAA environment</a>.
  ///
  /// Parameter [weeklyMaintenanceWindowStart] :
  /// The day and time you want MWAA to start weekly maintenance updates on your
  /// environment.
  Future<CreateEnvironmentOutput> createEnvironment({
    @_s.required String dagS3Path,
    @_s.required String executionRoleArn,
    @_s.required String name,
    @_s.required NetworkConfiguration networkConfiguration,
    @_s.required String sourceBucketArn,
    Map<String, String> airflowConfigurationOptions,
    String airflowVersion,
    String environmentClass,
    String kmsKey,
    LoggingConfigurationInput loggingConfiguration,
    int maxWorkers,
    String pluginsS3ObjectVersion,
    String pluginsS3Path,
    String requirementsS3ObjectVersion,
    String requirementsS3Path,
    Map<String, String> tags,
    WebserverAccessMode webserverAccessMode,
    String weeklyMaintenanceWindowStart,
  }) async {
    ArgumentError.checkNotNull(dagS3Path, 'dagS3Path');
    _s.validateStringLength(
      'dagS3Path',
      dagS3Path,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dagS3Path',
      dagS3Path,
      r'''.*''',
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
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:aws(-[a-z]+)?:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
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
    _s.validateStringPattern(
      'sourceBucketArn',
      sourceBucketArn,
      r'''^arn:aws(-[a-z]+)?:s3:::airflow-[a-z0-9.\-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'airflowVersion',
      airflowVersion,
      1,
      32,
    );
    _s.validateStringPattern(
      'airflowVersion',
      airflowVersion,
      r'''^[0-9a-z.]+$''',
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
    _s.validateStringPattern(
      'kmsKey',
      kmsKey,
      r'''^(((arn:aws(-[a-z]+)?:kms:[a-z]{2}-[a-z]+-\d:\d+:)?key\/)?[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}|(arn:aws(-[a-z]+)?:kms:[a-z]{2}-[a-z]+-\d:\d+:)?alias/.+)$''',
    );
    _s.validateNumRange(
      'maxWorkers',
      maxWorkers,
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
    _s.validateStringPattern(
      'pluginsS3Path',
      pluginsS3Path,
      r'''.*''',
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
    _s.validateStringPattern(
      'requirementsS3Path',
      requirementsS3Path,
      r'''.*''',
    );
    _s.validateStringLength(
      'weeklyMaintenanceWindowStart',
      weeklyMaintenanceWindowStart,
      1,
      9,
    );
    _s.validateStringPattern(
      'weeklyMaintenanceWindowStart',
      weeklyMaintenanceWindowStart,
      r'''(MON|TUE|WED|THU|FRI|SAT|SUN):([01]\d|2[0-3]):(00|30)''',
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
      if (pluginsS3ObjectVersion != null)
        'PluginsS3ObjectVersion': pluginsS3ObjectVersion,
      if (pluginsS3Path != null) 'PluginsS3Path': pluginsS3Path,
      if (requirementsS3ObjectVersion != null)
        'RequirementsS3ObjectVersion': requirementsS3ObjectVersion,
      if (requirementsS3Path != null) 'RequirementsS3Path': requirementsS3Path,
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
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

  /// Delete an existing environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment to delete.
  Future<void> deleteEnvironment({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environments/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEnvironmentOutput.fromJson(response);
  }

  /// Get details of an existing environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the environment to retrieve.
  Future<GetEnvironmentOutput> getEnvironment({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
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

  /// List Amazon MWAA Environments.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum results when listing MWAA environments.
  ///
  /// Parameter [nextToken] :
  /// The Next Token when listing MWAA environments.
  Future<ListEnvironmentsOutput> listEnvironments({
    int maxResults,
    String nextToken,
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

  /// List the tags for MWAA environments.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the MWAA environment.
  Future<ListTagsForResourceOutput> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(-[a-z]+)?:airflow:[a-z0-9\-]+:\d{12}:environment/\w+''',
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
    @_s.required String environmentName,
    @_s.required List<MetricDatum> metricData,
  }) async {
    ArgumentError.checkNotNull(environmentName, 'environmentName');
    _s.validateStringLength(
      'environmentName',
      environmentName,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringPattern(
      'environmentName',
      environmentName,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
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
    return PublishMetricsOutput.fromJson(response);
  }

  /// Add tag to the MWAA environments.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The tag resource ARN of the MWAA environments.
  ///
  /// Parameter [tags] :
  /// The tag resource tag of the MWAA environments.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(-[a-z]+)?:airflow:[a-z0-9\-]+:\d{12}:environment/\w+''',
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
    return TagResourceOutput.fromJson(response);
  }

  /// Remove a tag from the MWAA environments.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The tag resource ARN of the MWAA environments.
  ///
  /// Parameter [tagKeys] :
  /// The tag resource key of the MWAA environments.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(-[a-z]+)?:airflow:[a-z0-9\-]+:\d{12}:environment/\w+''',
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
    return UntagResourceOutput.fromJson(response);
  }

  /// Update an MWAA environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of your Amazon MWAA environment that you wish to update.
  ///
  /// Parameter [airflowConfigurationOptions] :
  /// The Airflow Configuration Options to update of your Amazon MWAA
  /// environment.
  ///
  /// Parameter [airflowVersion] :
  /// The Airflow Version to update of your Amazon MWAA environment.
  ///
  /// Parameter [dagS3Path] :
  /// The Dags folder S3 Path to update of your Amazon MWAA environment.
  ///
  /// Parameter [environmentClass] :
  /// The Environment Class to update of your Amazon MWAA environment.
  ///
  /// Parameter [executionRoleArn] :
  /// The Executio Role ARN to update of your Amazon MWAA environment.
  ///
  /// Parameter [loggingConfiguration] :
  /// The Logging Configuration to update of your Amazon MWAA environment.
  ///
  /// Parameter [maxWorkers] :
  /// The Maximum Workers to update of your Amazon MWAA environment.
  ///
  /// Parameter [networkConfiguration] :
  /// The Network Configuration to update of your Amazon MWAA environment.
  ///
  /// Parameter [pluginsS3ObjectVersion] :
  /// The Plugins.zip S3 Object Version to update of your Amazon MWAA
  /// environment.
  ///
  /// Parameter [pluginsS3Path] :
  /// The Plugins.zip S3 Path to update of your Amazon MWAA environment.
  ///
  /// Parameter [requirementsS3ObjectVersion] :
  /// The Requirements.txt S3 ObjectV ersion to update of your Amazon MWAA
  /// environment.
  ///
  /// Parameter [requirementsS3Path] :
  /// The Requirements.txt S3 Path to update of your Amazon MWAA environment.
  ///
  /// Parameter [sourceBucketArn] :
  /// The S3 Source Bucket ARN to update of your Amazon MWAA environment.
  ///
  /// Parameter [webserverAccessMode] :
  /// The Webserver Access Mode to update of your Amazon MWAA environment.
  ///
  /// Parameter [weeklyMaintenanceWindowStart] :
  /// The Weekly Maintenance Window Start to update of your Amazon MWAA
  /// environment.
  Future<UpdateEnvironmentOutput> updateEnvironment({
    @_s.required String name,
    Map<String, String> airflowConfigurationOptions,
    String airflowVersion,
    String dagS3Path,
    String environmentClass,
    String executionRoleArn,
    LoggingConfigurationInput loggingConfiguration,
    int maxWorkers,
    UpdateNetworkConfigurationInput networkConfiguration,
    String pluginsS3ObjectVersion,
    String pluginsS3Path,
    String requirementsS3ObjectVersion,
    String requirementsS3Path,
    String sourceBucketArn,
    WebserverAccessMode webserverAccessMode,
    String weeklyMaintenanceWindowStart,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      80,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z][0-9a-zA-Z-_]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'airflowVersion',
      airflowVersion,
      1,
      32,
    );
    _s.validateStringPattern(
      'airflowVersion',
      airflowVersion,
      r'''^[0-9a-z.]+$''',
    );
    _s.validateStringLength(
      'dagS3Path',
      dagS3Path,
      1,
      1024,
    );
    _s.validateStringPattern(
      'dagS3Path',
      dagS3Path,
      r'''.*''',
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
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:aws(-[a-z]+)?:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    _s.validateNumRange(
      'maxWorkers',
      maxWorkers,
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
    _s.validateStringPattern(
      'pluginsS3Path',
      pluginsS3Path,
      r'''.*''',
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
    _s.validateStringPattern(
      'requirementsS3Path',
      requirementsS3Path,
      r'''.*''',
    );
    _s.validateStringLength(
      'sourceBucketArn',
      sourceBucketArn,
      1,
      1224,
    );
    _s.validateStringPattern(
      'sourceBucketArn',
      sourceBucketArn,
      r'''^arn:aws(-[a-z]+)?:s3:::airflow-[a-z0-9.\-]+$''',
    );
    _s.validateStringLength(
      'weeklyMaintenanceWindowStart',
      weeklyMaintenanceWindowStart,
      1,
      9,
    );
    _s.validateStringPattern(
      'weeklyMaintenanceWindowStart',
      weeklyMaintenanceWindowStart,
      r'''(MON|TUE|WED|THU|FRI|SAT|SUN):([01]\d|2[0-3]):(00|30)''',
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
      if (networkConfiguration != null)
        'NetworkConfiguration': networkConfiguration,
      if (pluginsS3ObjectVersion != null)
        'PluginsS3ObjectVersion': pluginsS3ObjectVersion,
      if (pluginsS3Path != null) 'PluginsS3Path': pluginsS3Path,
      if (requirementsS3ObjectVersion != null)
        'RequirementsS3ObjectVersion': requirementsS3ObjectVersion,
      if (requirementsS3Path != null) 'RequirementsS3Path': requirementsS3Path,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCliTokenResponse {
  /// Create an Airflow CLI login token response for the provided JWT token.
  @_s.JsonKey(name: 'CliToken')
  final String cliToken;

  /// Create an Airflow CLI login token response for the provided webserver
  /// hostname.
  @_s.JsonKey(name: 'WebServerHostname')
  final String webServerHostname;

  CreateCliTokenResponse({
    this.cliToken,
    this.webServerHostname,
  });
  factory CreateCliTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCliTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEnvironmentOutput {
  /// The resulting Amazon MWAA envirnonment ARN.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  CreateEnvironmentOutput({
    this.arn,
  });
  factory CreateEnvironmentOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateEnvironmentOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWebLoginTokenResponse {
  /// Create an Airflow Web UI login token response for the provided webserver
  /// hostname.
  @_s.JsonKey(name: 'WebServerHostname')
  final String webServerHostname;

  /// Create an Airflow Web UI login token response for the provided JWT token.
  @_s.JsonKey(name: 'WebToken')
  final String webToken;

  CreateWebLoginTokenResponse({
    this.webServerHostname,
    this.webToken,
  });
  factory CreateWebLoginTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWebLoginTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEnvironmentOutput {
  DeleteEnvironmentOutput();
  factory DeleteEnvironmentOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteEnvironmentOutputFromJson(json);
}

/// Internal only API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Dimension {
  /// Internal only API.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Internal only API.
  @_s.JsonKey(name: 'Value')
  final String value;

  Dimension({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$DimensionToJson(this);
}

/// An Amazon MWAA environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Environment {
  /// The Airflow Configuration Options of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'AirflowConfigurationOptions')
  final Map<String, String> airflowConfigurationOptions;

  /// The AirflowV ersion of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'AirflowVersion')
  final String airflowVersion;

  /// The ARN of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The Created At date of the Amazon MWAA Environment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The Dags S3 Path of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'DagS3Path')
  final String dagS3Path;

  /// The Environment Class (size) of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'EnvironmentClass')
  final String environmentClass;

  /// The Execution Role ARN of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'ExecutionRoleArn')
  final String executionRoleArn;

  /// The Kms Key of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'KmsKey')
  final String kmsKey;
  @_s.JsonKey(name: 'LastUpdate')
  final LastUpdate lastUpdate;

  /// The Logging Configuration of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  /// The Maximum Workers of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'MaxWorkers')
  final int maxWorkers;

  /// The name of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'NetworkConfiguration')
  final NetworkConfiguration networkConfiguration;

  /// The Plugins.zip S3 Object Version of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'PluginsS3ObjectVersion')
  final String pluginsS3ObjectVersion;

  /// The Plugins.zip S3 Path of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'PluginsS3Path')
  final String pluginsS3Path;

  /// The Requirements.txt file S3 Object Version of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'RequirementsS3ObjectVersion')
  final String requirementsS3ObjectVersion;

  /// The Requirement.txt S3 Path of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'RequirementsS3Path')
  final String requirementsS3Path;

  /// The Service Role ARN of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'ServiceRoleArn')
  final String serviceRoleArn;

  /// The Source S3 Bucket ARN of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'SourceBucketArn')
  final String sourceBucketArn;

  /// The status of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'Status')
  final EnvironmentStatus status;

  /// The Tags of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The Webserver Access Mode of the Amazon MWAA Environment (public or private
  /// only).
  @_s.JsonKey(name: 'WebserverAccessMode')
  final WebserverAccessMode webserverAccessMode;

  /// The Webserver URL of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'WebserverUrl')
  final String webserverUrl;

  /// The Weekly Maintenance Window Start of the Amazon MWAA Environment.
  @_s.JsonKey(name: 'WeeklyMaintenanceWindowStart')
  final String weeklyMaintenanceWindowStart;

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
    this.name,
    this.networkConfiguration,
    this.pluginsS3ObjectVersion,
    this.pluginsS3Path,
    this.requirementsS3ObjectVersion,
    this.requirementsS3Path,
    this.serviceRoleArn,
    this.sourceBucketArn,
    this.status,
    this.tags,
    this.webserverAccessMode,
    this.webserverUrl,
    this.weeklyMaintenanceWindowStart,
  });
  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}

enum EnvironmentStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEnvironmentOutput {
  /// A JSON blob with environment details.
  @_s.JsonKey(name: 'Environment')
  final Environment environment;

  GetEnvironmentOutput({
    this.environment,
  });
  factory GetEnvironmentOutput.fromJson(Map<String, dynamic> json) =>
      _$GetEnvironmentOutputFromJson(json);
}

/// Last update information for the environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LastUpdate {
  /// Time that last update occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Error string of last update, if applicable.
  @_s.JsonKey(name: 'Error')
  final UpdateError error;

  /// Status of last update of SUCCESS, FAILED, CREATING, DELETING.
  @_s.JsonKey(name: 'Status')
  final UpdateStatus status;

  LastUpdate({
    this.createdAt,
    this.error,
    this.status,
  });
  factory LastUpdate.fromJson(Map<String, dynamic> json) =>
      _$LastUpdateFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEnvironmentsOutput {
  /// The list of Amazon MWAA Environments.
  @_s.JsonKey(name: 'Environments')
  final List<String> environments;

  /// The Next Token when listing MWAA environments.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEnvironmentsOutput({
    @_s.required this.environments,
    this.nextToken,
  });
  factory ListEnvironmentsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListEnvironmentsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// The tags of the MWAA environments.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

/// The Logging Configuration of your Amazon MWAA environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoggingConfiguration {
  @_s.JsonKey(name: 'DagProcessingLogs')
  final ModuleLoggingConfiguration dagProcessingLogs;
  @_s.JsonKey(name: 'SchedulerLogs')
  final ModuleLoggingConfiguration schedulerLogs;
  @_s.JsonKey(name: 'TaskLogs')
  final ModuleLoggingConfiguration taskLogs;
  @_s.JsonKey(name: 'WebserverLogs')
  final ModuleLoggingConfiguration webserverLogs;
  @_s.JsonKey(name: 'WorkerLogs')
  final ModuleLoggingConfiguration workerLogs;

  LoggingConfiguration({
    this.dagProcessingLogs,
    this.schedulerLogs,
    this.taskLogs,
    this.webserverLogs,
    this.workerLogs,
  });
  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LoggingConfigurationFromJson(json);
}

/// The Logging Configuration of your Amazon MWAA environment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoggingConfigurationInput {
  @_s.JsonKey(name: 'DagProcessingLogs')
  final ModuleLoggingConfigurationInput dagProcessingLogs;
  @_s.JsonKey(name: 'SchedulerLogs')
  final ModuleLoggingConfigurationInput schedulerLogs;
  @_s.JsonKey(name: 'TaskLogs')
  final ModuleLoggingConfigurationInput taskLogs;
  @_s.JsonKey(name: 'WebserverLogs')
  final ModuleLoggingConfigurationInput webserverLogs;
  @_s.JsonKey(name: 'WorkerLogs')
  final ModuleLoggingConfigurationInput workerLogs;

  LoggingConfigurationInput({
    this.dagProcessingLogs,
    this.schedulerLogs,
    this.taskLogs,
    this.webserverLogs,
    this.workerLogs,
  });
  Map<String, dynamic> toJson() => _$LoggingConfigurationInputToJson(this);
}

enum LoggingLevel {
  @_s.JsonValue('CRITICAL')
  critical,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('WARNING')
  warning,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('DEBUG')
  debug,
}

/// Internal only API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MetricDatum {
  /// Internal only API.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// Internal only API.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// Internal only API.
  @_s.JsonKey(name: 'Dimensions')
  final List<Dimension> dimensions;

  /// Internal only API.
  @_s.JsonKey(name: 'StatisticValues')
  final StatisticSet statisticValues;
  @_s.JsonKey(name: 'Unit')
  final Unit unit;

  /// Internal only API.
  @_s.JsonKey(name: 'Value')
  final double value;

  MetricDatum({
    @_s.required this.metricName,
    @_s.required this.timestamp,
    this.dimensions,
    this.statisticValues,
    this.unit,
    this.value,
  });
  Map<String, dynamic> toJson() => _$MetricDatumToJson(this);
}

/// A JSON blob that provides configuration to use for logging with respect to
/// the various Apache Airflow services: DagProcessingLogs, SchedulerLogs,
/// TaskLogs, WebserverLogs, and WorkerLogs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModuleLoggingConfiguration {
  /// Provides the ARN for the CloudWatch group where the logs will be published.
  @_s.JsonKey(name: 'CloudWatchLogGroupArn')
  final String cloudWatchLogGroupArn;

  /// Defines that the logging module is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Defines the log level, which can be CRITICAL, ERROR, WARNING, or INFO.
  @_s.JsonKey(name: 'LogLevel')
  final LoggingLevel logLevel;

  ModuleLoggingConfiguration({
    this.cloudWatchLogGroupArn,
    this.enabled,
    this.logLevel,
  });
  factory ModuleLoggingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ModuleLoggingConfigurationFromJson(json);
}

/// A JSON blob that provides configuration to use for logging with respect to
/// the various Apache Airflow services: DagProcessingLogs, SchedulerLogs,
/// TaskLogs, WebserverLogs, and WorkerLogs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ModuleLoggingConfigurationInput {
  /// Defines that the logging module is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Defines the log level, which can be CRITICAL, ERROR, WARNING, or INFO.
  @_s.JsonKey(name: 'LogLevel')
  final LoggingLevel logLevel;

  ModuleLoggingConfigurationInput({
    @_s.required this.enabled,
    @_s.required this.logLevel,
  });
  Map<String, dynamic> toJson() =>
      _$ModuleLoggingConfigurationInputToJson(this);
}

/// Provide the security group and subnet IDs for the workers and scheduler.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkConfiguration {
  /// A JSON list of 1 or more security groups IDs by name, in the same VPC as the
  /// subnets.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// Provide a JSON list of 2 subnet IDs by name. These must be private subnets,
  /// in the same VPC, in two different availability zones.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  NetworkConfiguration({
    this.securityGroupIds,
    this.subnetIds,
  });
  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NetworkConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PublishMetricsOutput {
  PublishMetricsOutput();
  factory PublishMetricsOutput.fromJson(Map<String, dynamic> json) =>
      _$PublishMetricsOutputFromJson(json);
}

/// Internal only API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StatisticSet {
  /// Internal only API.
  @_s.JsonKey(name: 'Maximum')
  final double maximum;

  /// Internal only API.
  @_s.JsonKey(name: 'Minimum')
  final double minimum;

  /// Internal only API.
  @_s.JsonKey(name: 'SampleCount')
  final int sampleCount;

  /// Internal only API.
  @_s.JsonKey(name: 'Sum')
  final double sum;

  StatisticSet({
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
  });
  Map<String, dynamic> toJson() => _$StatisticSetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceOutput {
  TagResourceOutput();
  factory TagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$TagResourceOutputFromJson(json);
}

/// Unit
enum Unit {
  @_s.JsonValue('Seconds')
  seconds,
  @_s.JsonValue('Microseconds')
  microseconds,
  @_s.JsonValue('Milliseconds')
  milliseconds,
  @_s.JsonValue('Bytes')
  bytes,
  @_s.JsonValue('Kilobytes')
  kilobytes,
  @_s.JsonValue('Megabytes')
  megabytes,
  @_s.JsonValue('Gigabytes')
  gigabytes,
  @_s.JsonValue('Terabytes')
  terabytes,
  @_s.JsonValue('Bits')
  bits,
  @_s.JsonValue('Kilobits')
  kilobits,
  @_s.JsonValue('Megabits')
  megabits,
  @_s.JsonValue('Gigabits')
  gigabits,
  @_s.JsonValue('Terabits')
  terabits,
  @_s.JsonValue('Percent')
  percent,
  @_s.JsonValue('Count')
  count,
  @_s.JsonValue('Bytes/Second')
  bytesSecond,
  @_s.JsonValue('Kilobytes/Second')
  kilobytesSecond,
  @_s.JsonValue('Megabytes/Second')
  megabytesSecond,
  @_s.JsonValue('Gigabytes/Second')
  gigabytesSecond,
  @_s.JsonValue('Terabytes/Second')
  terabytesSecond,
  @_s.JsonValue('Bits/Second')
  bitsSecond,
  @_s.JsonValue('Kilobits/Second')
  kilobitsSecond,
  @_s.JsonValue('Megabits/Second')
  megabitsSecond,
  @_s.JsonValue('Gigabits/Second')
  gigabitsSecond,
  @_s.JsonValue('Terabits/Second')
  terabitsSecond,
  @_s.JsonValue('Count/Second')
  countSecond,
  @_s.JsonValue('None')
  none,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceOutput {
  UntagResourceOutput();
  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEnvironmentOutput {
  /// The ARN to update of your Amazon MWAA environment.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  UpdateEnvironmentOutput({
    this.arn,
  });
  factory UpdateEnvironmentOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateEnvironmentOutputFromJson(json);
}

/// Error information of update, if applicable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateError {
  /// Error code of update.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// Error message of update.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  UpdateError({
    this.errorCode,
    this.errorMessage,
  });
  factory UpdateError.fromJson(Map<String, dynamic> json) =>
      _$UpdateErrorFromJson(json);
}

/// Provide the security group and subnet IDs for the workers and scheduler.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateNetworkConfigurationInput {
  /// Provide a JSON list of 1 or more security groups IDs by name, in the same
  /// VPC as the subnets.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  UpdateNetworkConfigurationInput({
    @_s.required this.securityGroupIds,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateNetworkConfigurationInputToJson(this);
}

enum UpdateStatus {
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('FAILED')
  failed,
}

enum WebserverAccessMode {
  @_s.JsonValue('PRIVATE_ONLY')
  privateOnly,
  @_s.JsonValue('PUBLIC_ONLY')
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
    throw Exception('Unknown enum value: $this');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
