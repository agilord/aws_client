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

/// <note>
/// Amazon Managed Service for Apache Flink was previously known as Amazon
/// Kinesis Data Analytics for Apache Flink.
/// </note>
/// Amazon Managed Service for Apache Flink is a fully managed service that you
/// can use to process and analyze streaming data using Java, Python, SQL, or
/// Scala. The service enables you to quickly author and run Java, SQL, or Scala
/// code against streaming sources to perform time series analytics, feed
/// real-time dashboards, and create real-time metrics.
class KinesisAnalyticsV2 {
  final _s.JsonProtocol _protocol;
  KinesisAnalyticsV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisanalytics',
            signingName: 'kinesisanalytics',
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

  /// Adds an Amazon CloudWatch log stream to monitor application configuration
  /// errors.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The Kinesis Data Analytics application name.
  ///
  /// Parameter [cloudWatchLoggingOption] :
  /// Provides the Amazon CloudWatch log stream Amazon Resource Name (ARN).
  ///
  /// Parameter [conditionalToken] :
  /// A value you use to implement strong concurrency for application updates.
  /// You must provide the <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You get the application's current
  /// <code>ConditionalToken</code> using <a>DescribeApplication</a>. For better
  /// concurrency support, use the <code>ConditionalToken</code> parameter
  /// instead of <code>CurrentApplicationVersionId</code>.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the SQL-based Kinesis Data Analytics application. You
  /// must provide the <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>.You can retrieve the application version ID
  /// using <a>DescribeApplication</a>. For better concurrency support, use the
  /// <code>ConditionalToken</code> parameter instead of
  /// <code>CurrentApplicationVersionId</code>.
  Future<AddApplicationCloudWatchLoggingOptionResponse>
      addApplicationCloudWatchLoggingOption({
    required String applicationName,
    required CloudWatchLoggingOption cloudWatchLoggingOption,
    String? conditionalToken,
    int? currentApplicationVersionId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.AddApplicationCloudWatchLoggingOption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CloudWatchLoggingOption': cloudWatchLoggingOption,
        if (conditionalToken != null) 'ConditionalToken': conditionalToken,
        if (currentApplicationVersionId != null)
          'CurrentApplicationVersionId': currentApplicationVersionId,
      },
    );

    return AddApplicationCloudWatchLoggingOptionResponse.fromJson(
        jsonResponse.body);
  }

  /// Adds a streaming source to your SQL-based Kinesis Data Analytics
  /// application.
  ///
  /// You can add a streaming source when you create an application, or you can
  /// use this operation to add a streaming source after you create an
  /// application. For more information, see <a>CreateApplication</a>.
  ///
  /// Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the
  /// <a>DescribeApplication</a> operation to find the current application
  /// version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [CodeValidationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of your existing application to which you want to add the
  /// streaming source.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current version of your application. You must provide the
  /// <code>ApplicationVersionID</code> or the <code>ConditionalToken</code>.You
  /// can use the <a>DescribeApplication</a> operation to find the current
  /// application version.
  ///
  /// Parameter [input] :
  /// The <a>Input</a> to add.
  Future<AddApplicationInputResponse> addApplicationInput({
    required String applicationName,
    required int currentApplicationVersionId,
    required Input input,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.AddApplicationInput'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'Input': input,
      },
    );

    return AddApplicationInputResponse.fromJson(jsonResponse.body);
  }

  /// Adds an <a>InputProcessingConfiguration</a> to a SQL-based Kinesis Data
  /// Analytics application. An input processor pre-processes records on the
  /// input stream before the application's SQL code executes. Currently, the
  /// only input processor available is <a
  /// href="https://docs.aws.amazon.com/lambda/">Amazon Lambda</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to which you want to add the input processing
  /// configuration.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version of the application to which you want to add the input
  /// processing configuration. You can use the <a>DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [inputId] :
  /// The ID of the input configuration to add the input processing
  /// configuration to. You can get a list of the input IDs for an application
  /// using the <a>DescribeApplication</a> operation.
  ///
  /// Parameter [inputProcessingConfiguration] :
  /// The <a>InputProcessingConfiguration</a> to add to the application.
  Future<AddApplicationInputProcessingConfigurationResponse>
      addApplicationInputProcessingConfiguration({
    required String applicationName,
    required int currentApplicationVersionId,
    required String inputId,
    required InputProcessingConfiguration inputProcessingConfiguration,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.AddApplicationInputProcessingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'InputId': inputId,
        'InputProcessingConfiguration': inputProcessingConfiguration,
      },
    );

    return AddApplicationInputProcessingConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Adds an external destination to your SQL-based Kinesis Data Analytics
  /// application.
  ///
  /// If you want Kinesis Data Analytics to deliver data from an in-application
  /// stream within your application to an external destination (such as an
  /// Kinesis data stream, a Kinesis Data Firehose delivery stream, or an Amazon
  /// Lambda function), you add the relevant configuration to your application
  /// using this operation. You can configure one or more outputs for your
  /// application. Each output configuration maps an in-application stream and
  /// an external destination.
  ///
  /// You can use one of the output configurations to deliver data from your
  /// in-application error stream to an external destination so that you can
  /// analyze the errors.
  ///
  /// Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the
  /// <a>DescribeApplication</a> operation to find the current application
  /// version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to which you want to add the output
  /// configuration.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version of the application to which you want to add the output
  /// configuration. You can use the <a>DescribeApplication</a> operation to get
  /// the current application version. If the version specified is not the
  /// current version, the <code>ConcurrentModificationException</code> is
  /// returned.
  ///
  /// Parameter [output] :
  /// An array of objects, each describing one output configuration. In the
  /// output configuration, you specify the name of an in-application stream, a
  /// destination (that is, a Kinesis data stream, a Kinesis Data Firehose
  /// delivery stream, or an Amazon Lambda function), and record the formation
  /// to use when writing to the destination.
  Future<AddApplicationOutputResponse> addApplicationOutput({
    required String applicationName,
    required int currentApplicationVersionId,
    required Output output,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.AddApplicationOutput'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'Output': output,
      },
    );

    return AddApplicationOutputResponse.fromJson(jsonResponse.body);
  }

  /// Adds a reference data source to an existing SQL-based Kinesis Data
  /// Analytics application.
  ///
  /// Kinesis Data Analytics reads reference data (that is, an Amazon S3 object)
  /// and creates an in-application table within your application. In the
  /// request, you provide the source (S3 bucket name and object key name), name
  /// of the in-application table to create, and the necessary mapping
  /// information that describes how data in an Amazon S3 object maps to columns
  /// in the resulting in-application table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version of the application for which you are adding the reference data
  /// source. You can use the <a>DescribeApplication</a> operation to get the
  /// current application version. If the version specified is not the current
  /// version, the <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [referenceDataSource] :
  /// The reference data source can be an object in your Amazon S3 bucket.
  /// Kinesis Data Analytics reads the object and copies the data into the
  /// in-application table that is created. You provide an S3 bucket, object key
  /// name, and the resulting in-application table that is created.
  Future<AddApplicationReferenceDataSourceResponse>
      addApplicationReferenceDataSource({
    required String applicationName,
    required int currentApplicationVersionId,
    required ReferenceDataSource referenceDataSource,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.AddApplicationReferenceDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'ReferenceDataSource': referenceDataSource,
      },
    );

    return AddApplicationReferenceDataSourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Adds a Virtual Private Cloud (VPC) configuration to the application.
  /// Applications can use VPCs to store and access resources securely.
  ///
  /// Note the following about VPC configurations for Managed Service for Apache
  /// Flink applications:
  ///
  /// <ul>
  /// <li>
  /// VPC configurations are not supported for SQL applications.
  /// </li>
  /// <li>
  /// When a VPC is added to a Managed Service for Apache Flink application, the
  /// application can no longer be accessed from the Internet directly. To
  /// enable Internet access to the application, add an Internet gateway to your
  /// VPC.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [vpcConfiguration] :
  /// Description of the VPC to add to the application.
  ///
  /// Parameter [conditionalToken] :
  /// A value you use to implement strong concurrency for application updates.
  /// You must provide the <code>ApplicationVersionID</code> or the
  /// <code>ConditionalToken</code>. You get the application's current
  /// <code>ConditionalToken</code> using <a>DescribeApplication</a>. For better
  /// concurrency support, use the <code>ConditionalToken</code> parameter
  /// instead of <code>CurrentApplicationVersionId</code>.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version of the application to which you want to add the VPC
  /// configuration. You must provide the
  /// <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You can use the <a>DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned. For better
  /// concurrency support, use the <code>ConditionalToken</code> parameter
  /// instead of <code>CurrentApplicationVersionId</code>.
  Future<AddApplicationVpcConfigurationResponse>
      addApplicationVpcConfiguration({
    required String applicationName,
    required VpcConfiguration vpcConfiguration,
    String? conditionalToken,
    int? currentApplicationVersionId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.AddApplicationVpcConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'VpcConfiguration': vpcConfiguration,
        if (conditionalToken != null) 'ConditionalToken': conditionalToken,
        if (currentApplicationVersionId != null)
          'CurrentApplicationVersionId': currentApplicationVersionId,
      },
    );

    return AddApplicationVpcConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Managed Service for Apache Flink application. For information
  /// about creating a Managed Service for Apache Flink application, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html">Creating
  /// an Application</a>.
  ///
  /// May throw [CodeValidationException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidRequestException].
  /// May throw [TooManyTagsException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The name of your application (for example, <code>sample-app</code>).
  ///
  /// Parameter [runtimeEnvironment] :
  /// The runtime environment for the application.
  ///
  /// Parameter [serviceExecutionRole] :
  /// The IAM role used by the application to access Kinesis data streams,
  /// Kinesis Data Firehose delivery streams, Amazon S3 objects, and other
  /// external resources.
  ///
  /// Parameter [applicationConfiguration] :
  /// Use this parameter to configure the application.
  ///
  /// Parameter [applicationDescription] :
  /// A summary description of the application.
  ///
  /// Parameter [applicationMode] :
  /// Use the <code>STREAMING</code> mode to create a Managed Service for Apache
  /// Flink application. To create a Managed Service for Apache Flink Studio
  /// notebook, use the <code>INTERACTIVE</code> mode.
  ///
  /// Parameter [cloudWatchLoggingOptions] :
  /// Use this parameter to configure an Amazon CloudWatch log stream to monitor
  /// application configuration errors.
  ///
  /// Parameter [tags] :
  /// A list of one or more tags to assign to the application. A tag is a
  /// key-value pair that identifies an application. Note that the maximum
  /// number of application tags includes system tags. The maximum number of
  /// user-defined application tags is 50. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using
  /// Tagging</a>.
  Future<CreateApplicationResponse> createApplication({
    required String applicationName,
    required RuntimeEnvironment runtimeEnvironment,
    required String serviceExecutionRole,
    ApplicationConfiguration? applicationConfiguration,
    String? applicationDescription,
    ApplicationMode? applicationMode,
    List<CloudWatchLoggingOption>? cloudWatchLoggingOptions,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'RuntimeEnvironment': runtimeEnvironment.toValue(),
        'ServiceExecutionRole': serviceExecutionRole,
        if (applicationConfiguration != null)
          'ApplicationConfiguration': applicationConfiguration,
        if (applicationDescription != null)
          'ApplicationDescription': applicationDescription,
        if (applicationMode != null)
          'ApplicationMode': applicationMode.toValue(),
        if (cloudWatchLoggingOptions != null)
          'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Creates and returns a URL that you can use to connect to an application's
  /// extension.
  ///
  /// The IAM role or user used to call this API defines the permissions to
  /// access the extension. After the presigned URL is created, no additional
  /// permission is required to access this URL. IAM authorization policies for
  /// this API are also enforced for every HTTP request that attempts to connect
  /// to the extension.
  ///
  /// You control the amount of time that the URL will be valid using the
  /// <code>SessionExpirationDurationInSeconds</code> parameter. If you do not
  /// provide this parameter, the returned URL is valid for twelve hours.
  /// <note>
  /// The URL that you get from a call to CreateApplicationPresignedUrl must be
  /// used within 3 minutes to be valid. If you first try to use the URL after
  /// the 3-minute limit expires, the service returns an HTTP 403 Forbidden
  /// error.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [urlType] :
  /// The type of the extension for which to create and return a URL. Currently,
  /// the only valid extension URL type is <code>FLINK_DASHBOARD_URL</code>.
  ///
  /// Parameter [sessionExpirationDurationInSeconds] :
  /// The duration in seconds for which the returned URL will be valid.
  Future<CreateApplicationPresignedUrlResponse> createApplicationPresignedUrl({
    required String applicationName,
    required UrlType urlType,
    int? sessionExpirationDurationInSeconds,
  }) async {
    _s.validateNumRange(
      'sessionExpirationDurationInSeconds',
      sessionExpirationDurationInSeconds,
      1800,
      43200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.CreateApplicationPresignedUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'UrlType': urlType.toValue(),
        if (sessionExpirationDurationInSeconds != null)
          'SessionExpirationDurationInSeconds':
              sessionExpirationDurationInSeconds,
      },
    );

    return CreateApplicationPresignedUrlResponse.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot of the application's state data.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application
  ///
  /// Parameter [snapshotName] :
  /// An identifier for the application snapshot.
  Future<void> createApplicationSnapshot({
    required String applicationName,
    required String snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.CreateApplicationSnapshot'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'SnapshotName': snapshotName,
      },
    );
  }

  /// Deletes the specified application. Managed Service for Apache Flink halts
  /// application execution and deletes the application.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to delete.
  ///
  /// Parameter [createTimestamp] :
  /// Use the <code>DescribeApplication</code> operation to get this value.
  Future<void> deleteApplication({
    required String applicationName,
    required DateTime createTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DeleteApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CreateTimestamp': unixTimestampToJson(createTimestamp),
      },
    );
  }

  /// Deletes an Amazon CloudWatch log stream from an SQL-based Kinesis Data
  /// Analytics application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The application name.
  ///
  /// Parameter [cloudWatchLoggingOptionId] :
  /// The <code>CloudWatchLoggingOptionId</code> of the Amazon CloudWatch
  /// logging option to delete. You can get the
  /// <code>CloudWatchLoggingOptionId</code> by using the
  /// <a>DescribeApplication</a> operation.
  ///
  /// Parameter [conditionalToken] :
  /// A value you use to implement strong concurrency for application updates.
  /// You must provide the <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You get the application's current
  /// <code>ConditionalToken</code> using <a>DescribeApplication</a>. For better
  /// concurrency support, use the <code>ConditionalToken</code> parameter
  /// instead of <code>CurrentApplicationVersionId</code>.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the application. You must provide the
  /// <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You can retrieve the application version ID
  /// using <a>DescribeApplication</a>. For better concurrency support, use the
  /// <code>ConditionalToken</code> parameter instead of
  /// <code>CurrentApplicationVersionId</code>.
  Future<DeleteApplicationCloudWatchLoggingOptionResponse>
      deleteApplicationCloudWatchLoggingOption({
    required String applicationName,
    required String cloudWatchLoggingOptionId,
    String? conditionalToken,
    int? currentApplicationVersionId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.DeleteApplicationCloudWatchLoggingOption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CloudWatchLoggingOptionId': cloudWatchLoggingOptionId,
        if (conditionalToken != null) 'ConditionalToken': conditionalToken,
        if (currentApplicationVersionId != null)
          'CurrentApplicationVersionId': currentApplicationVersionId,
      },
    );

    return DeleteApplicationCloudWatchLoggingOptionResponse.fromJson(
        jsonResponse.body);
  }

  /// Deletes an <a>InputProcessingConfiguration</a> from an input.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The application version. You can use the <a>DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [inputId] :
  /// The ID of the input configuration from which to delete the input
  /// processing configuration. You can get a list of the input IDs for an
  /// application by using the <a>DescribeApplication</a> operation.
  Future<DeleteApplicationInputProcessingConfigurationResponse>
      deleteApplicationInputProcessingConfiguration({
    required String applicationName,
    required int currentApplicationVersionId,
    required String inputId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.DeleteApplicationInputProcessingConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'InputId': inputId,
      },
    );

    return DeleteApplicationInputProcessingConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Deletes the output destination configuration from your SQL-based Kinesis
  /// Data Analytics application's configuration. Kinesis Data Analytics will no
  /// longer write data from the corresponding in-application stream to the
  /// external output destination.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The application name.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The application version. You can use the <a>DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [outputId] :
  /// The ID of the configuration to delete. Each output configuration that is
  /// added to the application (either when the application is created or later)
  /// using the <a>AddApplicationOutput</a> operation has a unique ID. You need
  /// to provide the ID to uniquely identify the output configuration that you
  /// want to delete from the application configuration. You can use the
  /// <a>DescribeApplication</a> operation to get the specific
  /// <code>OutputId</code>.
  Future<DeleteApplicationOutputResponse> deleteApplicationOutput({
    required String applicationName,
    required int currentApplicationVersionId,
    required String outputId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DeleteApplicationOutput'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'OutputId': outputId,
      },
    );

    return DeleteApplicationOutputResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a reference data source configuration from the specified SQL-based
  /// Kinesis Data Analytics application's configuration.
  ///
  /// If the application is running, Kinesis Data Analytics immediately removes
  /// the in-application table that you created using the
  /// <a>AddApplicationReferenceDataSource</a> operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current application version. You can use the
  /// <a>DescribeApplication</a> operation to get the current application
  /// version. If the version specified is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [referenceId] :
  /// The ID of the reference data source. When you add a reference data source
  /// to your application using the <a>AddApplicationReferenceDataSource</a>,
  /// Kinesis Data Analytics assigns an ID. You can use the
  /// <a>DescribeApplication</a> operation to get the reference ID.
  Future<DeleteApplicationReferenceDataSourceResponse>
      deleteApplicationReferenceDataSource({
    required String applicationName,
    required int currentApplicationVersionId,
    required String referenceId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.DeleteApplicationReferenceDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'ReferenceId': referenceId,
      },
    );

    return DeleteApplicationReferenceDataSourceResponse.fromJson(
        jsonResponse.body);
  }

  /// Deletes a snapshot of application state.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [snapshotCreationTimestamp] :
  /// The creation timestamp of the application snapshot to delete. You can
  /// retrieve this value using or .
  ///
  /// Parameter [snapshotName] :
  /// The identifier for the snapshot delete.
  Future<void> deleteApplicationSnapshot({
    required String applicationName,
    required DateTime snapshotCreationTimestamp,
    required String snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DeleteApplicationSnapshot'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'SnapshotCreationTimestamp':
            unixTimestampToJson(snapshotCreationTimestamp),
        'SnapshotName': snapshotName,
      },
    );
  }

  /// Removes a VPC configuration from a Managed Service for Apache Flink
  /// application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [vpcConfigurationId] :
  /// The ID of the VPC configuration to delete.
  ///
  /// Parameter [conditionalToken] :
  /// A value you use to implement strong concurrency for application updates.
  /// You must provide the <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You get the application's current
  /// <code>ConditionalToken</code> using <a>DescribeApplication</a>. For better
  /// concurrency support, use the <code>ConditionalToken</code> parameter
  /// instead of <code>CurrentApplicationVersionId</code>.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current application version ID. You must provide the
  /// <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You can retrieve the application version ID
  /// using <a>DescribeApplication</a>. For better concurrency support, use the
  /// <code>ConditionalToken</code> parameter instead of
  /// <code>CurrentApplicationVersionId</code>.
  Future<DeleteApplicationVpcConfigurationResponse>
      deleteApplicationVpcConfiguration({
    required String applicationName,
    required String vpcConfigurationId,
    String? conditionalToken,
    int? currentApplicationVersionId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.DeleteApplicationVpcConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'VpcConfigurationId': vpcConfigurationId,
        if (conditionalToken != null) 'ConditionalToken': conditionalToken,
        if (currentApplicationVersionId != null)
          'CurrentApplicationVersionId': currentApplicationVersionId,
      },
    );

    return DeleteApplicationVpcConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information about a specific Managed Service for Apache Flink
  /// application.
  ///
  /// If you want to retrieve a list of all applications in your account, use
  /// the <a>ListApplications</a> operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [includeAdditionalDetails] :
  /// Displays verbose information about a Managed Service for Apache Flink
  /// application, including the application's job plan.
  Future<DescribeApplicationResponse> describeApplication({
    required String applicationName,
    bool? includeAdditionalDetails,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DescribeApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (includeAdditionalDetails != null)
          'IncludeAdditionalDetails': includeAdditionalDetails,
      },
    );

    return DescribeApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a snapshot of application state data.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [snapshotName] :
  /// The identifier of an application snapshot. You can retrieve this value
  /// using .
  Future<DescribeApplicationSnapshotResponse> describeApplicationSnapshot({
    required String applicationName,
    required String snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DescribeApplicationSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'SnapshotName': snapshotName,
      },
    );

    return DescribeApplicationSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Provides a detailed description of a specified version of the application.
  /// To see a list of all the versions of an application, invoke the
  /// <a>ListApplicationVersions</a> operation.
  /// <note>
  /// This operation is supported only for Managed Service for Apache Flink.
  /// </note>
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application for which you want to get the version
  /// description.
  ///
  /// Parameter [applicationVersionId] :
  /// The ID of the application version for which you want to get the
  /// description.
  Future<DescribeApplicationVersionResponse> describeApplicationVersion({
    required String applicationName,
    required int applicationVersionId,
  }) async {
    _s.validateNumRange(
      'applicationVersionId',
      applicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DescribeApplicationVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'ApplicationVersionId': applicationVersionId,
      },
    );

    return DescribeApplicationVersionResponse.fromJson(jsonResponse.body);
  }

  /// Infers a schema for a SQL-based Kinesis Data Analytics application by
  /// evaluating sample records on the specified streaming source (Kinesis data
  /// stream or Kinesis Data Firehose delivery stream) or Amazon S3 object. In
  /// the response, the operation returns the inferred schema and also the
  /// sample records that the operation used to infer the schema.
  ///
  /// You can use the inferred schema when configuring a streaming source for
  /// your application. When you create an application using the Kinesis Data
  /// Analytics console, the console uses this operation to infer a schema and
  /// show it in the console user interface.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [UnableToDetectSchemaException].
  /// May throw [ResourceProvisionedThroughputExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [serviceExecutionRole] :
  /// The ARN of the role that is used to access the streaming source.
  ///
  /// Parameter [inputProcessingConfiguration] :
  /// The <a>InputProcessingConfiguration</a> to use to preprocess the records
  /// before discovering the schema of the records.
  ///
  /// Parameter [inputStartingPositionConfiguration] :
  /// The point at which you want Kinesis Data Analytics to start reading
  /// records from the specified streaming source for discovery purposes.
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the streaming source.
  ///
  /// Parameter [s3Configuration] :
  /// Specify this parameter to discover a schema from data in an Amazon S3
  /// object.
  Future<DiscoverInputSchemaResponse> discoverInputSchema({
    required String serviceExecutionRole,
    InputProcessingConfiguration? inputProcessingConfiguration,
    InputStartingPositionConfiguration? inputStartingPositionConfiguration,
    String? resourceARN,
    S3Configuration? s3Configuration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DiscoverInputSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceExecutionRole': serviceExecutionRole,
        if (inputProcessingConfiguration != null)
          'InputProcessingConfiguration': inputProcessingConfiguration,
        if (inputStartingPositionConfiguration != null)
          'InputStartingPositionConfiguration':
              inputStartingPositionConfiguration,
        if (resourceARN != null) 'ResourceARN': resourceARN,
        if (s3Configuration != null) 'S3Configuration': s3Configuration,
      },
    );

    return DiscoverInputSchemaResponse.fromJson(jsonResponse.body);
  }

  /// Lists information about the current application snapshots.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The name of an existing application.
  ///
  /// Parameter [limit] :
  /// The maximum number of application snapshots to list.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter if you receive a <code>NextToken</code> response in a
  /// previous request that indicates that there is more output available. Set
  /// it to the value of the previous call's <code>NextToken</code> response to
  /// indicate where the output should continue from.
  Future<ListApplicationSnapshotsResponse> listApplicationSnapshots({
    required String applicationName,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.ListApplicationSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationSnapshotsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the versions for the specified application, including versions
  /// that were rolled back. The response also includes a summary of the
  /// configuration associated with each version.
  ///
  /// To get the complete description of a specific application version, invoke
  /// the <a>DescribeApplicationVersion</a> operation.
  /// <note>
  /// This operation is supported only for Managed Service for Apache Flink.
  /// </note>
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application for which you want to list all versions.
  ///
  /// Parameter [limit] :
  /// The maximum number of versions to list in this invocation of the
  /// operation.
  ///
  /// Parameter [nextToken] :
  /// If a previous invocation of this operation returned a pagination token,
  /// pass it into this value to retrieve the next set of results. For more
  /// information about pagination, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Using
  /// the Amazon Command Line Interface's Pagination Options</a>.
  Future<ListApplicationVersionsResponse> listApplicationVersions({
    required String applicationName,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.ListApplicationVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of Managed Service for Apache Flink applications in your
  /// account. For each application, the response includes the application name,
  /// Amazon Resource Name (ARN), and status.
  ///
  /// If you want detailed information about a specific application, use
  /// <a>DescribeApplication</a>.
  ///
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [limit] :
  /// The maximum number of applications to list.
  ///
  /// Parameter [nextToken] :
  /// If a previous command returned a pagination token, pass it into this value
  /// to retrieve the next set of results. For more information about
  /// pagination, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Using
  /// the Amazon Command Line Interface's Pagination Options</a>.
  Future<ListApplicationsResponse> listApplications({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.ListApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListApplicationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of key-value tags assigned to the application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using
  /// Tagging</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the application for which to retrieve tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Reverts the application to the previous running version. You can roll back
  /// an application if you suspect it is stuck in a transient status.
  ///
  /// You can roll back an application only if it is in the
  /// <code>UPDATING</code> or <code>AUTOSCALING</code> status.
  ///
  /// When you rollback an application, it loads state data from the last
  /// successful snapshot. If the application has no snapshots, Managed Service
  /// for Apache Flink rejects the rollback request.
  ///
  /// This action is not supported for Managed Service for Apache Flink for SQL
  /// applications.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current application version ID. You can retrieve the application
  /// version ID using <a>DescribeApplication</a>.
  Future<RollbackApplicationResponse> rollbackApplication({
    required String applicationName,
    required int currentApplicationVersionId,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.RollbackApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'CurrentApplicationVersionId': currentApplicationVersionId,
      },
    );

    return RollbackApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Starts the specified Managed Service for Apache Flink application. After
  /// creating an application, you must exclusively call this operation to start
  /// your application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidApplicationConfigurationException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application.
  ///
  /// Parameter [runConfiguration] :
  /// Identifies the run configuration (start parameters) of a Managed Service
  /// for Apache Flink application.
  Future<void> startApplication({
    required String applicationName,
    RunConfiguration? runConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.StartApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (runConfiguration != null) 'RunConfiguration': runConfiguration,
      },
    );
  }

  /// Stops the application from processing data. You can stop an application
  /// only if it is in the running status, unless you set the <code>Force</code>
  /// parameter to <code>true</code>.
  ///
  /// You can use the <a>DescribeApplication</a> operation to find the
  /// application status.
  ///
  /// Managed Service for Apache Flink takes a snapshot when the application is
  /// stopped, unless <code>Force</code> is set to <code>true</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [applicationName] :
  /// The name of the running application to stop.
  ///
  /// Parameter [force] :
  /// Set to <code>true</code> to force the application to stop. If you set
  /// <code>Force</code> to <code>true</code>, Managed Service for Apache Flink
  /// stops the application without taking a snapshot.
  /// <note>
  /// Force-stopping your application may lead to data loss or duplication. To
  /// prevent data loss or duplicate processing of data during application
  /// restarts, we recommend you to take frequent snapshots of your application.
  /// </note>
  /// You can only force stop a Managed Service for Apache Flink application.
  /// You can't force stop a SQL-based Kinesis Data Analytics application.
  ///
  /// The application must be in the <code>STARTING</code>,
  /// <code>UPDATING</code>, <code>STOPPING</code>, <code>AUTOSCALING</code>, or
  /// <code>RUNNING</code> status.
  Future<void> stopApplication({
    required String applicationName,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.StopApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (force != null) 'Force': force,
      },
    );
  }

  /// Adds one or more key-value tags to a Managed Service for Apache Flink
  /// application. Note that the maximum number of application tags includes
  /// system tags. The maximum number of user-defined application tags is 50.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using
  /// Tagging</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the application to assign the tags.
  ///
  /// Parameter [tags] :
  /// The key-value tags to assign to the application.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes one or more tags from a Managed Service for Apache Flink
  /// application. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using
  /// Tagging</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the Managed Service for Apache Flink application from which to
  /// remove the tags.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys of tags to remove from the specified application.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates an existing Managed Service for Apache Flink application. Using
  /// this operation, you can update application code, input configuration, and
  /// output configuration.
  ///
  /// Managed Service for Apache Flink updates the
  /// <code>ApplicationVersionId</code> each time you update your application.
  ///
  /// May throw [CodeValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to update.
  ///
  /// Parameter [applicationConfigurationUpdate] :
  /// Describes application configuration updates.
  ///
  /// Parameter [cloudWatchLoggingOptionUpdates] :
  /// Describes application Amazon CloudWatch logging option updates. You can
  /// only update existing CloudWatch logging options with this action. To add a
  /// new CloudWatch logging option, use
  /// <a>AddApplicationCloudWatchLoggingOption</a>.
  ///
  /// Parameter [conditionalToken] :
  /// A value you use to implement strong concurrency for application updates.
  /// You must provide the <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>. You get the application's current
  /// <code>ConditionalToken</code> using <a>DescribeApplication</a>. For better
  /// concurrency support, use the <code>ConditionalToken</code> parameter
  /// instead of <code>CurrentApplicationVersionId</code>.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current application version ID. You must provide the
  /// <code>CurrentApplicationVersionId</code> or the
  /// <code>ConditionalToken</code>.You can retrieve the application version ID
  /// using <a>DescribeApplication</a>. For better concurrency support, use the
  /// <code>ConditionalToken</code> parameter instead of
  /// <code>CurrentApplicationVersionId</code>.
  ///
  /// Parameter [runConfigurationUpdate] :
  /// Describes updates to the application's starting parameters.
  ///
  /// Parameter [runtimeEnvironmentUpdate] :
  /// Updates the Managed Service for Apache Flink runtime environment used to
  /// run your code. To avoid issues you must:
  ///
  /// <ul>
  /// <li>
  /// Ensure your new jar and dependencies are compatible with the new runtime
  /// selected.
  /// </li>
  /// <li>
  /// Ensure your new code's state is compatible with the snapshot from which
  /// your application will start
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceExecutionRoleUpdate] :
  /// Describes updates to the service execution role.
  Future<UpdateApplicationResponse> updateApplication({
    required String applicationName,
    ApplicationConfigurationUpdate? applicationConfigurationUpdate,
    List<CloudWatchLoggingOptionUpdate>? cloudWatchLoggingOptionUpdates,
    String? conditionalToken,
    int? currentApplicationVersionId,
    RunConfigurationUpdate? runConfigurationUpdate,
    RuntimeEnvironment? runtimeEnvironmentUpdate,
    String? serviceExecutionRoleUpdate,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.UpdateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (applicationConfigurationUpdate != null)
          'ApplicationConfigurationUpdate': applicationConfigurationUpdate,
        if (cloudWatchLoggingOptionUpdates != null)
          'CloudWatchLoggingOptionUpdates': cloudWatchLoggingOptionUpdates,
        if (conditionalToken != null) 'ConditionalToken': conditionalToken,
        if (currentApplicationVersionId != null)
          'CurrentApplicationVersionId': currentApplicationVersionId,
        if (runConfigurationUpdate != null)
          'RunConfigurationUpdate': runConfigurationUpdate,
        if (runtimeEnvironmentUpdate != null)
          'RuntimeEnvironmentUpdate': runtimeEnvironmentUpdate.toValue(),
        if (serviceExecutionRoleUpdate != null)
          'ServiceExecutionRoleUpdate': serviceExecutionRoleUpdate,
      },
    );

    return UpdateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the maintenance configuration of the Managed Service for Apache
  /// Flink application.
  ///
  /// You can invoke this operation on an application that is in one of the two
  /// following states: <code>READY</code> or <code>RUNNING</code>. If you
  /// invoke it when the application is in a state other than these two states,
  /// it throws a <code>ResourceInUseException</code>. The service makes use of
  /// the updated configuration the next time it schedules maintenance for the
  /// application. If you invoke this operation after the service schedules
  /// maintenance, the service will apply the configuration update the next time
  /// it schedules maintenance for the application. This means that you might
  /// not see the maintenance configuration update applied to the maintenance
  /// process that follows a successful invocation of this operation, but to the
  /// following maintenance process instead.
  ///
  /// To see the current maintenance configuration of your application, invoke
  /// the <a>DescribeApplication</a> operation.
  ///
  /// For information about application maintenance, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/maintenance.html">Managed
  /// Service for Apache Flink for Apache Flink Maintenance</a>.
  /// <note>
  /// This operation is supported only for Managed Service for Apache Flink.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationMaintenanceConfigurationUpdate] :
  /// Describes the application maintenance configuration update.
  ///
  /// Parameter [applicationName] :
  /// The name of the application for which you want to update the maintenance
  /// configuration.
  Future<UpdateApplicationMaintenanceConfigurationResponse>
      updateApplicationMaintenanceConfiguration({
    required ApplicationMaintenanceConfigurationUpdate
        applicationMaintenanceConfigurationUpdate,
    required String applicationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'KinesisAnalytics_20180523.UpdateApplicationMaintenanceConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationMaintenanceConfigurationUpdate':
            applicationMaintenanceConfigurationUpdate,
        'ApplicationName': applicationName,
      },
    );

    return UpdateApplicationMaintenanceConfigurationResponse.fromJson(
        jsonResponse.body);
  }
}

class AddApplicationCloudWatchLoggingOptionResponse {
  /// The application's ARN.
  final String? applicationARN;

  /// The new version ID of the SQL-based Kinesis Data Analytics application.
  /// Kinesis Data Analytics updates the <code>ApplicationVersionId</code> each
  /// time you change the CloudWatch logging options.
  final int? applicationVersionId;

  /// The descriptions of the current CloudWatch logging options for the SQL-based
  /// Kinesis Data Analytics application.
  final List<CloudWatchLoggingOptionDescription>?
      cloudWatchLoggingOptionDescriptions;

  AddApplicationCloudWatchLoggingOptionResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.cloudWatchLoggingOptionDescriptions,
  });

  factory AddApplicationCloudWatchLoggingOptionResponse.fromJson(
      Map<String, dynamic> json) {
    return AddApplicationCloudWatchLoggingOptionResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      cloudWatchLoggingOptionDescriptions:
          (json['CloudWatchLoggingOptionDescriptions'] as List?)
              ?.whereNotNull()
              .map((e) => CloudWatchLoggingOptionDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final cloudWatchLoggingOptionDescriptions =
        this.cloudWatchLoggingOptionDescriptions;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (cloudWatchLoggingOptionDescriptions != null)
        'CloudWatchLoggingOptionDescriptions':
            cloudWatchLoggingOptionDescriptions,
    };
  }
}

class AddApplicationInputProcessingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String? applicationARN;

  /// Provides the current application version.
  final int? applicationVersionId;

  /// The input ID that is associated with the application input. This is the ID
  /// that Kinesis Data Analytics assigns to each input configuration that you add
  /// to your application.
  final String? inputId;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  final InputProcessingConfigurationDescription?
      inputProcessingConfigurationDescription;

  AddApplicationInputProcessingConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.inputId,
    this.inputProcessingConfigurationDescription,
  });

  factory AddApplicationInputProcessingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return AddApplicationInputProcessingConfigurationResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      inputId: json['InputId'] as String?,
      inputProcessingConfigurationDescription:
          json['InputProcessingConfigurationDescription'] != null
              ? InputProcessingConfigurationDescription.fromJson(
                  json['InputProcessingConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final inputId = this.inputId;
    final inputProcessingConfigurationDescription =
        this.inputProcessingConfigurationDescription;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (inputId != null) 'InputId': inputId,
      if (inputProcessingConfigurationDescription != null)
        'InputProcessingConfigurationDescription':
            inputProcessingConfigurationDescription,
    };
  }
}

class AddApplicationInputResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String? applicationARN;

  /// Provides the current application version.
  final int? applicationVersionId;

  /// Describes the application input configuration.
  final List<InputDescription>? inputDescriptions;

  AddApplicationInputResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.inputDescriptions,
  });

  factory AddApplicationInputResponse.fromJson(Map<String, dynamic> json) {
    return AddApplicationInputResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      inputDescriptions: (json['InputDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => InputDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final inputDescriptions = this.inputDescriptions;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (inputDescriptions != null) 'InputDescriptions': inputDescriptions,
    };
  }
}

class AddApplicationOutputResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationARN;

  /// The updated application version ID. Kinesis Data Analytics increments this
  /// ID when the application is updated.
  final int? applicationVersionId;

  /// Describes the application output configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  final List<OutputDescription>? outputDescriptions;

  AddApplicationOutputResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.outputDescriptions,
  });

  factory AddApplicationOutputResponse.fromJson(Map<String, dynamic> json) {
    return AddApplicationOutputResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      outputDescriptions: (json['OutputDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final outputDescriptions = this.outputDescriptions;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (outputDescriptions != null) 'OutputDescriptions': outputDescriptions,
    };
  }
}

class AddApplicationReferenceDataSourceResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationARN;

  /// The updated application version ID. Kinesis Data Analytics increments this
  /// ID when the application is updated.
  final int? applicationVersionId;

  /// Describes reference data sources configured for the application.
  final List<ReferenceDataSourceDescription>? referenceDataSourceDescriptions;

  AddApplicationReferenceDataSourceResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.referenceDataSourceDescriptions,
  });

  factory AddApplicationReferenceDataSourceResponse.fromJson(
      Map<String, dynamic> json) {
    return AddApplicationReferenceDataSourceResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      referenceDataSourceDescriptions:
          (json['ReferenceDataSourceDescriptions'] as List?)
              ?.whereNotNull()
              .map((e) => ReferenceDataSourceDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final referenceDataSourceDescriptions =
        this.referenceDataSourceDescriptions;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (referenceDataSourceDescriptions != null)
        'ReferenceDataSourceDescriptions': referenceDataSourceDescriptions,
    };
  }
}

class AddApplicationVpcConfigurationResponse {
  /// The ARN of the application.
  final String? applicationARN;

  /// Provides the current application version. Managed Service for Apache Flink
  /// updates the ApplicationVersionId each time you update the application.
  final int? applicationVersionId;

  /// The parameters of the new VPC configuration.
  final VpcConfigurationDescription? vpcConfigurationDescription;

  AddApplicationVpcConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.vpcConfigurationDescription,
  });

  factory AddApplicationVpcConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return AddApplicationVpcConfigurationResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      vpcConfigurationDescription: json['VpcConfigurationDescription'] != null
          ? VpcConfigurationDescription.fromJson(
              json['VpcConfigurationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final vpcConfigurationDescription = this.vpcConfigurationDescription;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (vpcConfigurationDescription != null)
        'VpcConfigurationDescription': vpcConfigurationDescription,
    };
  }
}

/// Describes code configuration for an application.
class ApplicationCodeConfiguration {
  /// Specifies whether the code content is in text or zip format.
  final CodeContentType codeContentType;

  /// The location and type of the application code.
  final CodeContent? codeContent;

  ApplicationCodeConfiguration({
    required this.codeContentType,
    this.codeContent,
  });

  Map<String, dynamic> toJson() {
    final codeContentType = this.codeContentType;
    final codeContent = this.codeContent;
    return {
      'CodeContentType': codeContentType.toValue(),
      if (codeContent != null) 'CodeContent': codeContent,
    };
  }
}

/// Describes code configuration for an application.
class ApplicationCodeConfigurationDescription {
  /// Specifies whether the code content is in text or zip format.
  final CodeContentType codeContentType;

  /// Describes details about the location and format of the application code.
  final CodeContentDescription? codeContentDescription;

  ApplicationCodeConfigurationDescription({
    required this.codeContentType,
    this.codeContentDescription,
  });

  factory ApplicationCodeConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ApplicationCodeConfigurationDescription(
      codeContentType: (json['CodeContentType'] as String).toCodeContentType(),
      codeContentDescription: json['CodeContentDescription'] != null
          ? CodeContentDescription.fromJson(
              json['CodeContentDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeContentType = this.codeContentType;
    final codeContentDescription = this.codeContentDescription;
    return {
      'CodeContentType': codeContentType.toValue(),
      if (codeContentDescription != null)
        'CodeContentDescription': codeContentDescription,
    };
  }
}

/// Describes code configuration updates for an application. This is supported
/// for a Managed Service for Apache Flink application or a SQL-based Kinesis
/// Data Analytics application.
class ApplicationCodeConfigurationUpdate {
  /// Describes updates to the code content type.
  final CodeContentType? codeContentTypeUpdate;

  /// Describes updates to the code content of an application.
  final CodeContentUpdate? codeContentUpdate;

  ApplicationCodeConfigurationUpdate({
    this.codeContentTypeUpdate,
    this.codeContentUpdate,
  });

  Map<String, dynamic> toJson() {
    final codeContentTypeUpdate = this.codeContentTypeUpdate;
    final codeContentUpdate = this.codeContentUpdate;
    return {
      if (codeContentTypeUpdate != null)
        'CodeContentTypeUpdate': codeContentTypeUpdate.toValue(),
      if (codeContentUpdate != null) 'CodeContentUpdate': codeContentUpdate,
    };
  }
}

/// Specifies the creation parameters for a Managed Service for Apache Flink
/// application.
class ApplicationConfiguration {
  /// The code location and type parameters for a Managed Service for Apache Flink
  /// application.
  final ApplicationCodeConfiguration? applicationCodeConfiguration;

  /// Describes whether snapshots are enabled for a Managed Service for Apache
  /// Flink application.
  final ApplicationSnapshotConfiguration? applicationSnapshotConfiguration;

  /// Describes execution properties for a Managed Service for Apache Flink
  /// application.
  final EnvironmentProperties? environmentProperties;

  /// The creation and update parameters for a Managed Service for Apache Flink
  /// application.
  final FlinkApplicationConfiguration? flinkApplicationConfiguration;

  /// The creation and update parameters for a SQL-based Kinesis Data Analytics
  /// application.
  final SqlApplicationConfiguration? sqlApplicationConfiguration;

  /// The array of descriptions of VPC configurations available to the
  /// application.
  final List<VpcConfiguration>? vpcConfigurations;

  /// The configuration parameters for a Managed Service for Apache Flink Studio
  /// notebook.
  final ZeppelinApplicationConfiguration? zeppelinApplicationConfiguration;

  ApplicationConfiguration({
    this.applicationCodeConfiguration,
    this.applicationSnapshotConfiguration,
    this.environmentProperties,
    this.flinkApplicationConfiguration,
    this.sqlApplicationConfiguration,
    this.vpcConfigurations,
    this.zeppelinApplicationConfiguration,
  });

  Map<String, dynamic> toJson() {
    final applicationCodeConfiguration = this.applicationCodeConfiguration;
    final applicationSnapshotConfiguration =
        this.applicationSnapshotConfiguration;
    final environmentProperties = this.environmentProperties;
    final flinkApplicationConfiguration = this.flinkApplicationConfiguration;
    final sqlApplicationConfiguration = this.sqlApplicationConfiguration;
    final vpcConfigurations = this.vpcConfigurations;
    final zeppelinApplicationConfiguration =
        this.zeppelinApplicationConfiguration;
    return {
      if (applicationCodeConfiguration != null)
        'ApplicationCodeConfiguration': applicationCodeConfiguration,
      if (applicationSnapshotConfiguration != null)
        'ApplicationSnapshotConfiguration': applicationSnapshotConfiguration,
      if (environmentProperties != null)
        'EnvironmentProperties': environmentProperties,
      if (flinkApplicationConfiguration != null)
        'FlinkApplicationConfiguration': flinkApplicationConfiguration,
      if (sqlApplicationConfiguration != null)
        'SqlApplicationConfiguration': sqlApplicationConfiguration,
      if (vpcConfigurations != null) 'VpcConfigurations': vpcConfigurations,
      if (zeppelinApplicationConfiguration != null)
        'ZeppelinApplicationConfiguration': zeppelinApplicationConfiguration,
    };
  }
}

/// Describes details about the application code and starting parameters for a
/// Managed Service for Apache Flink application.
class ApplicationConfigurationDescription {
  /// The details about the application code for a Managed Service for Apache
  /// Flink application.
  final ApplicationCodeConfigurationDescription?
      applicationCodeConfigurationDescription;

  /// Describes whether snapshots are enabled for a Managed Service for Apache
  /// Flink application.
  final ApplicationSnapshotConfigurationDescription?
      applicationSnapshotConfigurationDescription;

  /// Describes execution properties for a Managed Service for Apache Flink
  /// application.
  final EnvironmentPropertyDescriptions? environmentPropertyDescriptions;

  /// The details about a Managed Service for Apache Flink application.
  final FlinkApplicationConfigurationDescription?
      flinkApplicationConfigurationDescription;

  /// The details about the starting properties for a Managed Service for Apache
  /// Flink application.
  final RunConfigurationDescription? runConfigurationDescription;

  /// The details about inputs, outputs, and reference data sources for a
  /// SQL-based Kinesis Data Analytics application.
  final SqlApplicationConfigurationDescription?
      sqlApplicationConfigurationDescription;

  /// The array of descriptions of VPC configurations available to the
  /// application.
  final List<VpcConfigurationDescription>? vpcConfigurationDescriptions;

  /// The configuration parameters for a Managed Service for Apache Flink Studio
  /// notebook.
  final ZeppelinApplicationConfigurationDescription?
      zeppelinApplicationConfigurationDescription;

  ApplicationConfigurationDescription({
    this.applicationCodeConfigurationDescription,
    this.applicationSnapshotConfigurationDescription,
    this.environmentPropertyDescriptions,
    this.flinkApplicationConfigurationDescription,
    this.runConfigurationDescription,
    this.sqlApplicationConfigurationDescription,
    this.vpcConfigurationDescriptions,
    this.zeppelinApplicationConfigurationDescription,
  });

  factory ApplicationConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ApplicationConfigurationDescription(
      applicationCodeConfigurationDescription:
          json['ApplicationCodeConfigurationDescription'] != null
              ? ApplicationCodeConfigurationDescription.fromJson(
                  json['ApplicationCodeConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      applicationSnapshotConfigurationDescription:
          json['ApplicationSnapshotConfigurationDescription'] != null
              ? ApplicationSnapshotConfigurationDescription.fromJson(
                  json['ApplicationSnapshotConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      environmentPropertyDescriptions:
          json['EnvironmentPropertyDescriptions'] != null
              ? EnvironmentPropertyDescriptions.fromJson(
                  json['EnvironmentPropertyDescriptions']
                      as Map<String, dynamic>)
              : null,
      flinkApplicationConfigurationDescription:
          json['FlinkApplicationConfigurationDescription'] != null
              ? FlinkApplicationConfigurationDescription.fromJson(
                  json['FlinkApplicationConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      runConfigurationDescription: json['RunConfigurationDescription'] != null
          ? RunConfigurationDescription.fromJson(
              json['RunConfigurationDescription'] as Map<String, dynamic>)
          : null,
      sqlApplicationConfigurationDescription:
          json['SqlApplicationConfigurationDescription'] != null
              ? SqlApplicationConfigurationDescription.fromJson(
                  json['SqlApplicationConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      vpcConfigurationDescriptions: (json['VpcConfigurationDescriptions']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              VpcConfigurationDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      zeppelinApplicationConfigurationDescription:
          json['ZeppelinApplicationConfigurationDescription'] != null
              ? ZeppelinApplicationConfigurationDescription.fromJson(
                  json['ZeppelinApplicationConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationCodeConfigurationDescription =
        this.applicationCodeConfigurationDescription;
    final applicationSnapshotConfigurationDescription =
        this.applicationSnapshotConfigurationDescription;
    final environmentPropertyDescriptions =
        this.environmentPropertyDescriptions;
    final flinkApplicationConfigurationDescription =
        this.flinkApplicationConfigurationDescription;
    final runConfigurationDescription = this.runConfigurationDescription;
    final sqlApplicationConfigurationDescription =
        this.sqlApplicationConfigurationDescription;
    final vpcConfigurationDescriptions = this.vpcConfigurationDescriptions;
    final zeppelinApplicationConfigurationDescription =
        this.zeppelinApplicationConfigurationDescription;
    return {
      if (applicationCodeConfigurationDescription != null)
        'ApplicationCodeConfigurationDescription':
            applicationCodeConfigurationDescription,
      if (applicationSnapshotConfigurationDescription != null)
        'ApplicationSnapshotConfigurationDescription':
            applicationSnapshotConfigurationDescription,
      if (environmentPropertyDescriptions != null)
        'EnvironmentPropertyDescriptions': environmentPropertyDescriptions,
      if (flinkApplicationConfigurationDescription != null)
        'FlinkApplicationConfigurationDescription':
            flinkApplicationConfigurationDescription,
      if (runConfigurationDescription != null)
        'RunConfigurationDescription': runConfigurationDescription,
      if (sqlApplicationConfigurationDescription != null)
        'SqlApplicationConfigurationDescription':
            sqlApplicationConfigurationDescription,
      if (vpcConfigurationDescriptions != null)
        'VpcConfigurationDescriptions': vpcConfigurationDescriptions,
      if (zeppelinApplicationConfigurationDescription != null)
        'ZeppelinApplicationConfigurationDescription':
            zeppelinApplicationConfigurationDescription,
    };
  }
}

/// Describes updates to an application's configuration.
class ApplicationConfigurationUpdate {
  /// Describes updates to an application's code configuration.
  final ApplicationCodeConfigurationUpdate? applicationCodeConfigurationUpdate;

  /// Describes whether snapshots are enabled for a Managed Service for Apache
  /// Flink application.
  final ApplicationSnapshotConfigurationUpdate?
      applicationSnapshotConfigurationUpdate;

  /// Describes updates to the environment properties for a Managed Service for
  /// Apache Flink application.
  final EnvironmentPropertyUpdates? environmentPropertyUpdates;

  /// Describes updates to a Managed Service for Apache Flink application's
  /// configuration.
  final FlinkApplicationConfigurationUpdate?
      flinkApplicationConfigurationUpdate;

  /// Describes updates to a SQL-based Kinesis Data Analytics application's
  /// configuration.
  final SqlApplicationConfigurationUpdate? sqlApplicationConfigurationUpdate;

  /// Updates to the array of descriptions of VPC configurations available to the
  /// application.
  final List<VpcConfigurationUpdate>? vpcConfigurationUpdates;

  /// Updates to the configuration of a Managed Service for Apache Flink Studio
  /// notebook.
  final ZeppelinApplicationConfigurationUpdate?
      zeppelinApplicationConfigurationUpdate;

  ApplicationConfigurationUpdate({
    this.applicationCodeConfigurationUpdate,
    this.applicationSnapshotConfigurationUpdate,
    this.environmentPropertyUpdates,
    this.flinkApplicationConfigurationUpdate,
    this.sqlApplicationConfigurationUpdate,
    this.vpcConfigurationUpdates,
    this.zeppelinApplicationConfigurationUpdate,
  });

  Map<String, dynamic> toJson() {
    final applicationCodeConfigurationUpdate =
        this.applicationCodeConfigurationUpdate;
    final applicationSnapshotConfigurationUpdate =
        this.applicationSnapshotConfigurationUpdate;
    final environmentPropertyUpdates = this.environmentPropertyUpdates;
    final flinkApplicationConfigurationUpdate =
        this.flinkApplicationConfigurationUpdate;
    final sqlApplicationConfigurationUpdate =
        this.sqlApplicationConfigurationUpdate;
    final vpcConfigurationUpdates = this.vpcConfigurationUpdates;
    final zeppelinApplicationConfigurationUpdate =
        this.zeppelinApplicationConfigurationUpdate;
    return {
      if (applicationCodeConfigurationUpdate != null)
        'ApplicationCodeConfigurationUpdate':
            applicationCodeConfigurationUpdate,
      if (applicationSnapshotConfigurationUpdate != null)
        'ApplicationSnapshotConfigurationUpdate':
            applicationSnapshotConfigurationUpdate,
      if (environmentPropertyUpdates != null)
        'EnvironmentPropertyUpdates': environmentPropertyUpdates,
      if (flinkApplicationConfigurationUpdate != null)
        'FlinkApplicationConfigurationUpdate':
            flinkApplicationConfigurationUpdate,
      if (sqlApplicationConfigurationUpdate != null)
        'SqlApplicationConfigurationUpdate': sqlApplicationConfigurationUpdate,
      if (vpcConfigurationUpdates != null)
        'VpcConfigurationUpdates': vpcConfigurationUpdates,
      if (zeppelinApplicationConfigurationUpdate != null)
        'ZeppelinApplicationConfigurationUpdate':
            zeppelinApplicationConfigurationUpdate,
    };
  }
}

/// Describes the application, including the application Amazon Resource Name
/// (ARN), status, latest version, and input and output configurations.
class ApplicationDetail {
  /// The ARN of the application.
  final String applicationARN;

  /// The name of the application.
  final String applicationName;

  /// The status of the application.
  final ApplicationStatus applicationStatus;

  /// Provides the current application version. Managed Service for Apache Flink
  /// updates the <code>ApplicationVersionId</code> each time you update the
  /// application.
  final int applicationVersionId;

  /// The runtime environment for the application.
  final RuntimeEnvironment runtimeEnvironment;

  /// Describes details about the application code and starting parameters for a
  /// Managed Service for Apache Flink application.
  final ApplicationConfigurationDescription?
      applicationConfigurationDescription;

  /// The description of the application.
  final String? applicationDescription;

  /// The details of the maintenance configuration for the application.
  final ApplicationMaintenanceConfigurationDescription?
      applicationMaintenanceConfigurationDescription;

  /// To create a Managed Service for Apache Flink Studio notebook, you must set
  /// the mode to <code>INTERACTIVE</code>. However, for a Managed Service for
  /// Apache Flink application, the mode is optional.
  final ApplicationMode? applicationMode;

  /// If you reverted the application using <a>RollbackApplication</a>, the
  /// application version when <code>RollbackApplication</code> was called.
  final int? applicationVersionRolledBackFrom;

  /// The version to which you want to roll back the application.
  final int? applicationVersionRolledBackTo;

  /// The previous application version before the latest application update.
  /// <a>RollbackApplication</a> reverts the application to this version.
  final int? applicationVersionUpdatedFrom;

  /// Describes the application Amazon CloudWatch logging options.
  final List<CloudWatchLoggingOptionDescription>?
      cloudWatchLoggingOptionDescriptions;

  /// A value you use to implement strong concurrency for application updates.
  final String? conditionalToken;

  /// The current timestamp when the application was created.
  final DateTime? createTimestamp;

  /// The current timestamp when the application was last updated.
  final DateTime? lastUpdateTimestamp;

  /// Specifies the IAM role that the application uses to access external
  /// resources.
  final String? serviceExecutionRole;

  ApplicationDetail({
    required this.applicationARN,
    required this.applicationName,
    required this.applicationStatus,
    required this.applicationVersionId,
    required this.runtimeEnvironment,
    this.applicationConfigurationDescription,
    this.applicationDescription,
    this.applicationMaintenanceConfigurationDescription,
    this.applicationMode,
    this.applicationVersionRolledBackFrom,
    this.applicationVersionRolledBackTo,
    this.applicationVersionUpdatedFrom,
    this.cloudWatchLoggingOptionDescriptions,
    this.conditionalToken,
    this.createTimestamp,
    this.lastUpdateTimestamp,
    this.serviceExecutionRole,
  });

  factory ApplicationDetail.fromJson(Map<String, dynamic> json) {
    return ApplicationDetail(
      applicationARN: json['ApplicationARN'] as String,
      applicationName: json['ApplicationName'] as String,
      applicationStatus:
          (json['ApplicationStatus'] as String).toApplicationStatus(),
      applicationVersionId: json['ApplicationVersionId'] as int,
      runtimeEnvironment:
          (json['RuntimeEnvironment'] as String).toRuntimeEnvironment(),
      applicationConfigurationDescription:
          json['ApplicationConfigurationDescription'] != null
              ? ApplicationConfigurationDescription.fromJson(
                  json['ApplicationConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      applicationDescription: json['ApplicationDescription'] as String?,
      applicationMaintenanceConfigurationDescription:
          json['ApplicationMaintenanceConfigurationDescription'] != null
              ? ApplicationMaintenanceConfigurationDescription.fromJson(
                  json['ApplicationMaintenanceConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      applicationMode:
          (json['ApplicationMode'] as String?)?.toApplicationMode(),
      applicationVersionRolledBackFrom:
          json['ApplicationVersionRolledBackFrom'] as int?,
      applicationVersionRolledBackTo:
          json['ApplicationVersionRolledBackTo'] as int?,
      applicationVersionUpdatedFrom:
          json['ApplicationVersionUpdatedFrom'] as int?,
      cloudWatchLoggingOptionDescriptions:
          (json['CloudWatchLoggingOptionDescriptions'] as List?)
              ?.whereNotNull()
              .map((e) => CloudWatchLoggingOptionDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      conditionalToken: json['ConditionalToken'] as String?,
      createTimestamp: timeStampFromJson(json['CreateTimestamp']),
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
      serviceExecutionRole: json['ServiceExecutionRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationName = this.applicationName;
    final applicationStatus = this.applicationStatus;
    final applicationVersionId = this.applicationVersionId;
    final runtimeEnvironment = this.runtimeEnvironment;
    final applicationConfigurationDescription =
        this.applicationConfigurationDescription;
    final applicationDescription = this.applicationDescription;
    final applicationMaintenanceConfigurationDescription =
        this.applicationMaintenanceConfigurationDescription;
    final applicationMode = this.applicationMode;
    final applicationVersionRolledBackFrom =
        this.applicationVersionRolledBackFrom;
    final applicationVersionRolledBackTo = this.applicationVersionRolledBackTo;
    final applicationVersionUpdatedFrom = this.applicationVersionUpdatedFrom;
    final cloudWatchLoggingOptionDescriptions =
        this.cloudWatchLoggingOptionDescriptions;
    final conditionalToken = this.conditionalToken;
    final createTimestamp = this.createTimestamp;
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final serviceExecutionRole = this.serviceExecutionRole;
    return {
      'ApplicationARN': applicationARN,
      'ApplicationName': applicationName,
      'ApplicationStatus': applicationStatus.toValue(),
      'ApplicationVersionId': applicationVersionId,
      'RuntimeEnvironment': runtimeEnvironment.toValue(),
      if (applicationConfigurationDescription != null)
        'ApplicationConfigurationDescription':
            applicationConfigurationDescription,
      if (applicationDescription != null)
        'ApplicationDescription': applicationDescription,
      if (applicationMaintenanceConfigurationDescription != null)
        'ApplicationMaintenanceConfigurationDescription':
            applicationMaintenanceConfigurationDescription,
      if (applicationMode != null) 'ApplicationMode': applicationMode.toValue(),
      if (applicationVersionRolledBackFrom != null)
        'ApplicationVersionRolledBackFrom': applicationVersionRolledBackFrom,
      if (applicationVersionRolledBackTo != null)
        'ApplicationVersionRolledBackTo': applicationVersionRolledBackTo,
      if (applicationVersionUpdatedFrom != null)
        'ApplicationVersionUpdatedFrom': applicationVersionUpdatedFrom,
      if (cloudWatchLoggingOptionDescriptions != null)
        'CloudWatchLoggingOptionDescriptions':
            cloudWatchLoggingOptionDescriptions,
      if (conditionalToken != null) 'ConditionalToken': conditionalToken,
      if (createTimestamp != null)
        'CreateTimestamp': unixTimestampToJson(createTimestamp),
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (serviceExecutionRole != null)
        'ServiceExecutionRole': serviceExecutionRole,
    };
  }
}

/// The details of the maintenance configuration for the application.
class ApplicationMaintenanceConfigurationDescription {
  /// The end time for the maintenance window.
  final String applicationMaintenanceWindowEndTime;

  /// The start time for the maintenance window.
  final String applicationMaintenanceWindowStartTime;

  ApplicationMaintenanceConfigurationDescription({
    required this.applicationMaintenanceWindowEndTime,
    required this.applicationMaintenanceWindowStartTime,
  });

  factory ApplicationMaintenanceConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ApplicationMaintenanceConfigurationDescription(
      applicationMaintenanceWindowEndTime:
          json['ApplicationMaintenanceWindowEndTime'] as String,
      applicationMaintenanceWindowStartTime:
          json['ApplicationMaintenanceWindowStartTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationMaintenanceWindowEndTime =
        this.applicationMaintenanceWindowEndTime;
    final applicationMaintenanceWindowStartTime =
        this.applicationMaintenanceWindowStartTime;
    return {
      'ApplicationMaintenanceWindowEndTime':
          applicationMaintenanceWindowEndTime,
      'ApplicationMaintenanceWindowStartTime':
          applicationMaintenanceWindowStartTime,
    };
  }
}

/// Describes the updated maintenance configuration for the application.
class ApplicationMaintenanceConfigurationUpdate {
  /// The updated start time for the maintenance window.
  final String applicationMaintenanceWindowStartTimeUpdate;

  ApplicationMaintenanceConfigurationUpdate({
    required this.applicationMaintenanceWindowStartTimeUpdate,
  });

  Map<String, dynamic> toJson() {
    final applicationMaintenanceWindowStartTimeUpdate =
        this.applicationMaintenanceWindowStartTimeUpdate;
    return {
      'ApplicationMaintenanceWindowStartTimeUpdate':
          applicationMaintenanceWindowStartTimeUpdate,
    };
  }
}

enum ApplicationMode {
  streaming,
  interactive,
}

extension ApplicationModeValueExtension on ApplicationMode {
  String toValue() {
    switch (this) {
      case ApplicationMode.streaming:
        return 'STREAMING';
      case ApplicationMode.interactive:
        return 'INTERACTIVE';
    }
  }
}

extension ApplicationModeFromString on String {
  ApplicationMode toApplicationMode() {
    switch (this) {
      case 'STREAMING':
        return ApplicationMode.streaming;
      case 'INTERACTIVE':
        return ApplicationMode.interactive;
    }
    throw Exception('$this is not known in enum ApplicationMode');
  }
}

/// Specifies the method and snapshot to use when restarting an application
/// using previously saved application state.
class ApplicationRestoreConfiguration {
  /// Specifies how the application should be restored.
  final ApplicationRestoreType applicationRestoreType;

  /// The identifier of an existing snapshot of application state to use to
  /// restart an application. The application uses this value if
  /// <code>RESTORE_FROM_CUSTOM_SNAPSHOT</code> is specified for the
  /// <code>ApplicationRestoreType</code>.
  final String? snapshotName;

  ApplicationRestoreConfiguration({
    required this.applicationRestoreType,
    this.snapshotName,
  });

  factory ApplicationRestoreConfiguration.fromJson(Map<String, dynamic> json) {
    return ApplicationRestoreConfiguration(
      applicationRestoreType:
          (json['ApplicationRestoreType'] as String).toApplicationRestoreType(),
      snapshotName: json['SnapshotName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationRestoreType = this.applicationRestoreType;
    final snapshotName = this.snapshotName;
    return {
      'ApplicationRestoreType': applicationRestoreType.toValue(),
      if (snapshotName != null) 'SnapshotName': snapshotName,
    };
  }
}

enum ApplicationRestoreType {
  skipRestoreFromSnapshot,
  restoreFromLatestSnapshot,
  restoreFromCustomSnapshot,
}

extension ApplicationRestoreTypeValueExtension on ApplicationRestoreType {
  String toValue() {
    switch (this) {
      case ApplicationRestoreType.skipRestoreFromSnapshot:
        return 'SKIP_RESTORE_FROM_SNAPSHOT';
      case ApplicationRestoreType.restoreFromLatestSnapshot:
        return 'RESTORE_FROM_LATEST_SNAPSHOT';
      case ApplicationRestoreType.restoreFromCustomSnapshot:
        return 'RESTORE_FROM_CUSTOM_SNAPSHOT';
    }
  }
}

extension ApplicationRestoreTypeFromString on String {
  ApplicationRestoreType toApplicationRestoreType() {
    switch (this) {
      case 'SKIP_RESTORE_FROM_SNAPSHOT':
        return ApplicationRestoreType.skipRestoreFromSnapshot;
      case 'RESTORE_FROM_LATEST_SNAPSHOT':
        return ApplicationRestoreType.restoreFromLatestSnapshot;
      case 'RESTORE_FROM_CUSTOM_SNAPSHOT':
        return ApplicationRestoreType.restoreFromCustomSnapshot;
    }
    throw Exception('$this is not known in enum ApplicationRestoreType');
  }
}

/// Describes whether snapshots are enabled for a Managed Service for Apache
/// Flink application.
class ApplicationSnapshotConfiguration {
  /// Describes whether snapshots are enabled for a Managed Service for Apache
  /// Flink application.
  final bool snapshotsEnabled;

  ApplicationSnapshotConfiguration({
    required this.snapshotsEnabled,
  });

  Map<String, dynamic> toJson() {
    final snapshotsEnabled = this.snapshotsEnabled;
    return {
      'SnapshotsEnabled': snapshotsEnabled,
    };
  }
}

/// Describes whether snapshots are enabled for a Managed Service for Apache
/// Flink application.
class ApplicationSnapshotConfigurationDescription {
  /// Describes whether snapshots are enabled for a Managed Service for Apache
  /// Flink application.
  final bool snapshotsEnabled;

  ApplicationSnapshotConfigurationDescription({
    required this.snapshotsEnabled,
  });

  factory ApplicationSnapshotConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ApplicationSnapshotConfigurationDescription(
      snapshotsEnabled: json['SnapshotsEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotsEnabled = this.snapshotsEnabled;
    return {
      'SnapshotsEnabled': snapshotsEnabled,
    };
  }
}

/// Describes updates to whether snapshots are enabled for a Managed Service for
/// Apache Flink application.
class ApplicationSnapshotConfigurationUpdate {
  /// Describes updates to whether snapshots are enabled for an application.
  final bool snapshotsEnabledUpdate;

  ApplicationSnapshotConfigurationUpdate({
    required this.snapshotsEnabledUpdate,
  });

  Map<String, dynamic> toJson() {
    final snapshotsEnabledUpdate = this.snapshotsEnabledUpdate;
    return {
      'SnapshotsEnabledUpdate': snapshotsEnabledUpdate,
    };
  }
}

enum ApplicationStatus {
  deleting,
  starting,
  stopping,
  ready,
  running,
  updating,
  autoscaling,
  forceStopping,
  rollingBack,
  maintenance,
  rolledBack,
}

extension ApplicationStatusValueExtension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.deleting:
        return 'DELETING';
      case ApplicationStatus.starting:
        return 'STARTING';
      case ApplicationStatus.stopping:
        return 'STOPPING';
      case ApplicationStatus.ready:
        return 'READY';
      case ApplicationStatus.running:
        return 'RUNNING';
      case ApplicationStatus.updating:
        return 'UPDATING';
      case ApplicationStatus.autoscaling:
        return 'AUTOSCALING';
      case ApplicationStatus.forceStopping:
        return 'FORCE_STOPPING';
      case ApplicationStatus.rollingBack:
        return 'ROLLING_BACK';
      case ApplicationStatus.maintenance:
        return 'MAINTENANCE';
      case ApplicationStatus.rolledBack:
        return 'ROLLED_BACK';
    }
  }
}

extension ApplicationStatusFromString on String {
  ApplicationStatus toApplicationStatus() {
    switch (this) {
      case 'DELETING':
        return ApplicationStatus.deleting;
      case 'STARTING':
        return ApplicationStatus.starting;
      case 'STOPPING':
        return ApplicationStatus.stopping;
      case 'READY':
        return ApplicationStatus.ready;
      case 'RUNNING':
        return ApplicationStatus.running;
      case 'UPDATING':
        return ApplicationStatus.updating;
      case 'AUTOSCALING':
        return ApplicationStatus.autoscaling;
      case 'FORCE_STOPPING':
        return ApplicationStatus.forceStopping;
      case 'ROLLING_BACK':
        return ApplicationStatus.rollingBack;
      case 'MAINTENANCE':
        return ApplicationStatus.maintenance;
      case 'ROLLED_BACK':
        return ApplicationStatus.rolledBack;
    }
    throw Exception('$this is not known in enum ApplicationStatus');
  }
}

/// Provides application summary information, including the application Amazon
/// Resource Name (ARN), name, and status.
class ApplicationSummary {
  /// The ARN of the application.
  final String applicationARN;

  /// The name of the application.
  final String applicationName;

  /// The status of the application.
  final ApplicationStatus applicationStatus;

  /// Provides the current application version.
  final int applicationVersionId;

  /// The runtime environment for the application.
  final RuntimeEnvironment runtimeEnvironment;

  /// For a Managed Service for Apache Flink application, the mode is
  /// <code>STREAMING</code>. For a Managed Service for Apache Flink Studio
  /// notebook, it is <code>INTERACTIVE</code>.
  final ApplicationMode? applicationMode;

  ApplicationSummary({
    required this.applicationARN,
    required this.applicationName,
    required this.applicationStatus,
    required this.applicationVersionId,
    required this.runtimeEnvironment,
    this.applicationMode,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      applicationARN: json['ApplicationARN'] as String,
      applicationName: json['ApplicationName'] as String,
      applicationStatus:
          (json['ApplicationStatus'] as String).toApplicationStatus(),
      applicationVersionId: json['ApplicationVersionId'] as int,
      runtimeEnvironment:
          (json['RuntimeEnvironment'] as String).toRuntimeEnvironment(),
      applicationMode:
          (json['ApplicationMode'] as String?)?.toApplicationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationName = this.applicationName;
    final applicationStatus = this.applicationStatus;
    final applicationVersionId = this.applicationVersionId;
    final runtimeEnvironment = this.runtimeEnvironment;
    final applicationMode = this.applicationMode;
    return {
      'ApplicationARN': applicationARN,
      'ApplicationName': applicationName,
      'ApplicationStatus': applicationStatus.toValue(),
      'ApplicationVersionId': applicationVersionId,
      'RuntimeEnvironment': runtimeEnvironment.toValue(),
      if (applicationMode != null) 'ApplicationMode': applicationMode.toValue(),
    };
  }
}

/// The summary of the application version.
class ApplicationVersionSummary {
  /// The status of the application.
  final ApplicationStatus applicationStatus;

  /// The ID of the application version. Managed Service for Apache Flink updates
  /// the <code>ApplicationVersionId</code> each time you update the application.
  final int applicationVersionId;

  ApplicationVersionSummary({
    required this.applicationStatus,
    required this.applicationVersionId,
  });

  factory ApplicationVersionSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationVersionSummary(
      applicationStatus:
          (json['ApplicationStatus'] as String).toApplicationStatus(),
      applicationVersionId: json['ApplicationVersionId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationStatus = this.applicationStatus;
    final applicationVersionId = this.applicationVersionId;
    return {
      'ApplicationStatus': applicationStatus.toValue(),
      'ApplicationVersionId': applicationVersionId,
    };
  }
}

enum ArtifactType {
  udf,
  dependencyJar,
}

extension ArtifactTypeValueExtension on ArtifactType {
  String toValue() {
    switch (this) {
      case ArtifactType.udf:
        return 'UDF';
      case ArtifactType.dependencyJar:
        return 'DEPENDENCY_JAR';
    }
  }
}

extension ArtifactTypeFromString on String {
  ArtifactType toArtifactType() {
    switch (this) {
      case 'UDF':
        return ArtifactType.udf;
      case 'DEPENDENCY_JAR':
        return ArtifactType.dependencyJar;
    }
    throw Exception('$this is not known in enum ArtifactType');
  }
}

/// For a SQL-based Kinesis Data Analytics application, provides additional
/// mapping information when the record format uses delimiters, such as CSV. For
/// example, the following sample records use CSV format, where the records use
/// the <i>'\n'</i> as the row delimiter and a comma (",") as the column
/// delimiter:
///
/// <code>"name1", "address1"</code>
///
/// <code>"name2", "address2"</code>
class CSVMappingParameters {
  /// The column delimiter. For example, in a CSV format, a comma (",") is the
  /// typical column delimiter.
  final String recordColumnDelimiter;

  /// The row delimiter. For example, in a CSV format, <i>'\n'</i> is the typical
  /// row delimiter.
  final String recordRowDelimiter;

  CSVMappingParameters({
    required this.recordColumnDelimiter,
    required this.recordRowDelimiter,
  });

  factory CSVMappingParameters.fromJson(Map<String, dynamic> json) {
    return CSVMappingParameters(
      recordColumnDelimiter: json['RecordColumnDelimiter'] as String,
      recordRowDelimiter: json['RecordRowDelimiter'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final recordColumnDelimiter = this.recordColumnDelimiter;
    final recordRowDelimiter = this.recordRowDelimiter;
    return {
      'RecordColumnDelimiter': recordColumnDelimiter,
      'RecordRowDelimiter': recordRowDelimiter,
    };
  }
}

/// The configuration parameters for the default Amazon Glue database. You use
/// this database for SQL queries that you write in a Managed Service for Apache
/// Flink Studio notebook.
class CatalogConfiguration {
  /// The configuration parameters for the default Amazon Glue database. You use
  /// this database for Apache Flink SQL queries and table API transforms that you
  /// write in a Managed Service for Apache Flink Studio notebook.
  final GlueDataCatalogConfiguration glueDataCatalogConfiguration;

  CatalogConfiguration({
    required this.glueDataCatalogConfiguration,
  });

  Map<String, dynamic> toJson() {
    final glueDataCatalogConfiguration = this.glueDataCatalogConfiguration;
    return {
      'GlueDataCatalogConfiguration': glueDataCatalogConfiguration,
    };
  }
}

/// The configuration parameters for the default Amazon Glue database. You use
/// this database for Apache Flink SQL queries and table API transforms that you
/// write in a Managed Service for Apache Flink Studio notebook.
class CatalogConfigurationDescription {
  /// The configuration parameters for the default Amazon Glue database. You use
  /// this database for SQL queries that you write in a Managed Service for Apache
  /// Flink Studio notebook.
  final GlueDataCatalogConfigurationDescription
      glueDataCatalogConfigurationDescription;

  CatalogConfigurationDescription({
    required this.glueDataCatalogConfigurationDescription,
  });

  factory CatalogConfigurationDescription.fromJson(Map<String, dynamic> json) {
    return CatalogConfigurationDescription(
      glueDataCatalogConfigurationDescription:
          GlueDataCatalogConfigurationDescription.fromJson(
              json['GlueDataCatalogConfigurationDescription']
                  as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final glueDataCatalogConfigurationDescription =
        this.glueDataCatalogConfigurationDescription;
    return {
      'GlueDataCatalogConfigurationDescription':
          glueDataCatalogConfigurationDescription,
    };
  }
}

/// Updates to the configuration parameters for the default Amazon Glue
/// database. You use this database for SQL queries that you write in a Managed
/// Service for Apache Flink Studio notebook.
class CatalogConfigurationUpdate {
  /// Updates to the configuration parameters for the default Amazon Glue
  /// database. You use this database for SQL queries that you write in a Managed
  /// Service for Apache Flink Studio notebook.
  final GlueDataCatalogConfigurationUpdate glueDataCatalogConfigurationUpdate;

  CatalogConfigurationUpdate({
    required this.glueDataCatalogConfigurationUpdate,
  });

  Map<String, dynamic> toJson() {
    final glueDataCatalogConfigurationUpdate =
        this.glueDataCatalogConfigurationUpdate;
    return {
      'GlueDataCatalogConfigurationUpdate': glueDataCatalogConfigurationUpdate,
    };
  }
}

/// Describes an application's checkpointing configuration. Checkpointing is the
/// process of persisting application state for fault tolerance. For more
/// information, see <a
/// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing">
/// Checkpoints for Fault Tolerance</a> in the <a
/// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/">Apache
/// Flink Documentation</a>.
class CheckpointConfiguration {
  /// Describes whether the application uses Managed Service for Apache Flink'
  /// default checkpointing behavior. You must set this property to
  /// <code>CUSTOM</code> in order to set the <code>CheckpointingEnabled</code>,
  /// <code>CheckpointInterval</code>, or <code>MinPauseBetweenCheckpoints</code>
  /// parameters.
  /// <note>
  /// If this value is set to <code>DEFAULT</code>, the application will use the
  /// following values, even if they are set to other values using APIs or
  /// application code:
  ///
  /// <ul>
  /// <li>
  /// <b>CheckpointingEnabled:</b> true
  /// </li>
  /// <li>
  /// <b>CheckpointInterval:</b> 60000
  /// </li>
  /// <li>
  /// <b>MinPauseBetweenCheckpoints:</b> 5000
  /// </li>
  /// </ul> </note>
  final ConfigurationType configurationType;

  /// Describes the interval in milliseconds between checkpoint operations.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointInterval</code> value of 60000, even if this value is set to
  /// another value using this API or in application code.
  /// </note>
  final int? checkpointInterval;

  /// Describes whether checkpointing is enabled for a Managed Service for Apache
  /// Flink application.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointingEnabled</code> value of <code>true</code>, even if this
  /// value is set to another value using this API or in application code.
  /// </note>
  final bool? checkpointingEnabled;

  /// Describes the minimum time in milliseconds after a checkpoint operation
  /// completes that a new checkpoint operation can start. If a checkpoint
  /// operation takes longer than the <code>CheckpointInterval</code>, the
  /// application otherwise performs continual checkpoint operations. For more
  /// information, see <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/ops/state/large_state_tuning/#tuning-checkpointing">
  /// Tuning Checkpointing</a> in the <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/">Apache
  /// Flink Documentation</a>.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>MinPauseBetweenCheckpoints</code> value of 5000, even if this value is
  /// set using this API or in application code.
  /// </note>
  final int? minPauseBetweenCheckpoints;

  CheckpointConfiguration({
    required this.configurationType,
    this.checkpointInterval,
    this.checkpointingEnabled,
    this.minPauseBetweenCheckpoints,
  });

  Map<String, dynamic> toJson() {
    final configurationType = this.configurationType;
    final checkpointInterval = this.checkpointInterval;
    final checkpointingEnabled = this.checkpointingEnabled;
    final minPauseBetweenCheckpoints = this.minPauseBetweenCheckpoints;
    return {
      'ConfigurationType': configurationType.toValue(),
      if (checkpointInterval != null) 'CheckpointInterval': checkpointInterval,
      if (checkpointingEnabled != null)
        'CheckpointingEnabled': checkpointingEnabled,
      if (minPauseBetweenCheckpoints != null)
        'MinPauseBetweenCheckpoints': minPauseBetweenCheckpoints,
    };
  }
}

/// Describes checkpointing parameters for a Managed Service for Apache Flink
/// application.
class CheckpointConfigurationDescription {
  /// Describes the interval in milliseconds between checkpoint operations.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointInterval</code> value of 60000, even if this value is set to
  /// another value using this API or in application code.
  /// </note>
  final int? checkpointInterval;

  /// Describes whether checkpointing is enabled for a Managed Service for Apache
  /// Flink application.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointingEnabled</code> value of <code>true</code>, even if this
  /// value is set to another value using this API or in application code.
  /// </note>
  final bool? checkpointingEnabled;

  /// Describes whether the application uses the default checkpointing behavior in
  /// Managed Service for Apache Flink.
  /// <note>
  /// If this value is set to <code>DEFAULT</code>, the application will use the
  /// following values, even if they are set to other values using APIs or
  /// application code:
  ///
  /// <ul>
  /// <li>
  /// <b>CheckpointingEnabled:</b> true
  /// </li>
  /// <li>
  /// <b>CheckpointInterval:</b> 60000
  /// </li>
  /// <li>
  /// <b>MinPauseBetweenCheckpoints:</b> 5000
  /// </li>
  /// </ul> </note>
  final ConfigurationType? configurationType;

  /// Describes the minimum time in milliseconds after a checkpoint operation
  /// completes that a new checkpoint operation can start.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>MinPauseBetweenCheckpoints</code> value of 5000, even if this value is
  /// set using this API or in application code.
  /// </note>
  final int? minPauseBetweenCheckpoints;

  CheckpointConfigurationDescription({
    this.checkpointInterval,
    this.checkpointingEnabled,
    this.configurationType,
    this.minPauseBetweenCheckpoints,
  });

  factory CheckpointConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return CheckpointConfigurationDescription(
      checkpointInterval: json['CheckpointInterval'] as int?,
      checkpointingEnabled: json['CheckpointingEnabled'] as bool?,
      configurationType:
          (json['ConfigurationType'] as String?)?.toConfigurationType(),
      minPauseBetweenCheckpoints: json['MinPauseBetweenCheckpoints'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkpointInterval = this.checkpointInterval;
    final checkpointingEnabled = this.checkpointingEnabled;
    final configurationType = this.configurationType;
    final minPauseBetweenCheckpoints = this.minPauseBetweenCheckpoints;
    return {
      if (checkpointInterval != null) 'CheckpointInterval': checkpointInterval,
      if (checkpointingEnabled != null)
        'CheckpointingEnabled': checkpointingEnabled,
      if (configurationType != null)
        'ConfigurationType': configurationType.toValue(),
      if (minPauseBetweenCheckpoints != null)
        'MinPauseBetweenCheckpoints': minPauseBetweenCheckpoints,
    };
  }
}

/// Describes updates to the checkpointing parameters for a Managed Service for
/// Apache Flink application.
class CheckpointConfigurationUpdate {
  /// Describes updates to the interval in milliseconds between checkpoint
  /// operations.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointInterval</code> value of 60000, even if this value is set to
  /// another value using this API or in application code.
  /// </note>
  final int? checkpointIntervalUpdate;

  /// Describes updates to whether checkpointing is enabled for an application.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointingEnabled</code> value of <code>true</code>, even if this
  /// value is set to another value using this API or in application code.
  /// </note>
  final bool? checkpointingEnabledUpdate;

  /// Describes updates to whether the application uses the default checkpointing
  /// behavior of Managed Service for Apache Flink. You must set this property to
  /// <code>CUSTOM</code> in order to set the <code>CheckpointingEnabled</code>,
  /// <code>CheckpointInterval</code>, or <code>MinPauseBetweenCheckpoints</code>
  /// parameters.
  /// <note>
  /// If this value is set to <code>DEFAULT</code>, the application will use the
  /// following values, even if they are set to other values using APIs or
  /// application code:
  ///
  /// <ul>
  /// <li>
  /// <b>CheckpointingEnabled:</b> true
  /// </li>
  /// <li>
  /// <b>CheckpointInterval:</b> 60000
  /// </li>
  /// <li>
  /// <b>MinPauseBetweenCheckpoints:</b> 5000
  /// </li>
  /// </ul> </note>
  final ConfigurationType? configurationTypeUpdate;

  /// Describes updates to the minimum time in milliseconds after a checkpoint
  /// operation completes that a new checkpoint operation can start.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>MinPauseBetweenCheckpoints</code> value of 5000, even if this value is
  /// set using this API or in application code.
  /// </note>
  final int? minPauseBetweenCheckpointsUpdate;

  CheckpointConfigurationUpdate({
    this.checkpointIntervalUpdate,
    this.checkpointingEnabledUpdate,
    this.configurationTypeUpdate,
    this.minPauseBetweenCheckpointsUpdate,
  });

  Map<String, dynamic> toJson() {
    final checkpointIntervalUpdate = this.checkpointIntervalUpdate;
    final checkpointingEnabledUpdate = this.checkpointingEnabledUpdate;
    final configurationTypeUpdate = this.configurationTypeUpdate;
    final minPauseBetweenCheckpointsUpdate =
        this.minPauseBetweenCheckpointsUpdate;
    return {
      if (checkpointIntervalUpdate != null)
        'CheckpointIntervalUpdate': checkpointIntervalUpdate,
      if (checkpointingEnabledUpdate != null)
        'CheckpointingEnabledUpdate': checkpointingEnabledUpdate,
      if (configurationTypeUpdate != null)
        'ConfigurationTypeUpdate': configurationTypeUpdate.toValue(),
      if (minPauseBetweenCheckpointsUpdate != null)
        'MinPauseBetweenCheckpointsUpdate': minPauseBetweenCheckpointsUpdate,
    };
  }
}

/// Provides a description of Amazon CloudWatch logging options, including the
/// log stream Amazon Resource Name (ARN).
class CloudWatchLoggingOption {
  /// The ARN of the CloudWatch log to receive application messages.
  final String logStreamARN;

  CloudWatchLoggingOption({
    required this.logStreamARN,
  });

  Map<String, dynamic> toJson() {
    final logStreamARN = this.logStreamARN;
    return {
      'LogStreamARN': logStreamARN,
    };
  }
}

/// Describes the Amazon CloudWatch logging option.
class CloudWatchLoggingOptionDescription {
  /// The Amazon Resource Name (ARN) of the CloudWatch log to receive application
  /// messages.
  final String logStreamARN;

  /// The ID of the CloudWatch logging option description.
  final String? cloudWatchLoggingOptionId;

  /// The IAM ARN of the role to use to send application messages.
  /// <note>
  /// Provided for backward compatibility. Applications created with the current
  /// API version have an application-level service execution role rather than a
  /// resource-level role.
  /// </note>
  final String? roleARN;

  CloudWatchLoggingOptionDescription({
    required this.logStreamARN,
    this.cloudWatchLoggingOptionId,
    this.roleARN,
  });

  factory CloudWatchLoggingOptionDescription.fromJson(
      Map<String, dynamic> json) {
    return CloudWatchLoggingOptionDescription(
      logStreamARN: json['LogStreamARN'] as String,
      cloudWatchLoggingOptionId: json['CloudWatchLoggingOptionId'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logStreamARN = this.logStreamARN;
    final cloudWatchLoggingOptionId = this.cloudWatchLoggingOptionId;
    final roleARN = this.roleARN;
    return {
      'LogStreamARN': logStreamARN,
      if (cloudWatchLoggingOptionId != null)
        'CloudWatchLoggingOptionId': cloudWatchLoggingOptionId,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// Describes the Amazon CloudWatch logging option updates.
class CloudWatchLoggingOptionUpdate {
  /// The ID of the CloudWatch logging option to update
  final String cloudWatchLoggingOptionId;

  /// The Amazon Resource Name (ARN) of the CloudWatch log to receive application
  /// messages.
  final String? logStreamARNUpdate;

  CloudWatchLoggingOptionUpdate({
    required this.cloudWatchLoggingOptionId,
    this.logStreamARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchLoggingOptionId = this.cloudWatchLoggingOptionId;
    final logStreamARNUpdate = this.logStreamARNUpdate;
    return {
      'CloudWatchLoggingOptionId': cloudWatchLoggingOptionId,
      if (logStreamARNUpdate != null) 'LogStreamARNUpdate': logStreamARNUpdate,
    };
  }
}

/// Specifies either the application code, or the location of the application
/// code, for a Managed Service for Apache Flink application.
class CodeContent {
  /// Information about the Amazon S3 bucket that contains the application code.
  final S3ContentLocation? s3ContentLocation;

  /// The text-format code for a Managed Service for Apache Flink application.
  final String? textContent;

  /// The zip-format code for a Managed Service for Apache Flink application.
  final Uint8List? zipFileContent;

  CodeContent({
    this.s3ContentLocation,
    this.textContent,
    this.zipFileContent,
  });

  Map<String, dynamic> toJson() {
    final s3ContentLocation = this.s3ContentLocation;
    final textContent = this.textContent;
    final zipFileContent = this.zipFileContent;
    return {
      if (s3ContentLocation != null) 'S3ContentLocation': s3ContentLocation,
      if (textContent != null) 'TextContent': textContent,
      if (zipFileContent != null)
        'ZipFileContent': base64Encode(zipFileContent),
    };
  }
}

/// Describes details about the code of a Managed Service for Apache Flink
/// application.
class CodeContentDescription {
  /// The checksum that can be used to validate zip-format code.
  final String? codeMD5;

  /// The size in bytes of the application code. Can be used to validate
  /// zip-format code.
  final int? codeSize;

  /// The S3 bucket Amazon Resource Name (ARN), file key, and object version of
  /// the application code stored in Amazon S3.
  final S3ApplicationCodeLocationDescription?
      s3ApplicationCodeLocationDescription;

  /// The text-format code
  final String? textContent;

  CodeContentDescription({
    this.codeMD5,
    this.codeSize,
    this.s3ApplicationCodeLocationDescription,
    this.textContent,
  });

  factory CodeContentDescription.fromJson(Map<String, dynamic> json) {
    return CodeContentDescription(
      codeMD5: json['CodeMD5'] as String?,
      codeSize: json['CodeSize'] as int?,
      s3ApplicationCodeLocationDescription:
          json['S3ApplicationCodeLocationDescription'] != null
              ? S3ApplicationCodeLocationDescription.fromJson(
                  json['S3ApplicationCodeLocationDescription']
                      as Map<String, dynamic>)
              : null,
      textContent: json['TextContent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeMD5 = this.codeMD5;
    final codeSize = this.codeSize;
    final s3ApplicationCodeLocationDescription =
        this.s3ApplicationCodeLocationDescription;
    final textContent = this.textContent;
    return {
      if (codeMD5 != null) 'CodeMD5': codeMD5,
      if (codeSize != null) 'CodeSize': codeSize,
      if (s3ApplicationCodeLocationDescription != null)
        'S3ApplicationCodeLocationDescription':
            s3ApplicationCodeLocationDescription,
      if (textContent != null) 'TextContent': textContent,
    };
  }
}

enum CodeContentType {
  plaintext,
  zipfile,
}

extension CodeContentTypeValueExtension on CodeContentType {
  String toValue() {
    switch (this) {
      case CodeContentType.plaintext:
        return 'PLAINTEXT';
      case CodeContentType.zipfile:
        return 'ZIPFILE';
    }
  }
}

extension CodeContentTypeFromString on String {
  CodeContentType toCodeContentType() {
    switch (this) {
      case 'PLAINTEXT':
        return CodeContentType.plaintext;
      case 'ZIPFILE':
        return CodeContentType.zipfile;
    }
    throw Exception('$this is not known in enum CodeContentType');
  }
}

/// Describes an update to the code of an application. Not supported for Apache
/// Zeppelin.
class CodeContentUpdate {
  /// Describes an update to the location of code for an application.
  final S3ContentLocationUpdate? s3ContentLocationUpdate;

  /// Describes an update to the text code for an application.
  final String? textContentUpdate;

  /// Describes an update to the zipped code for an application.
  final Uint8List? zipFileContentUpdate;

  CodeContentUpdate({
    this.s3ContentLocationUpdate,
    this.textContentUpdate,
    this.zipFileContentUpdate,
  });

  Map<String, dynamic> toJson() {
    final s3ContentLocationUpdate = this.s3ContentLocationUpdate;
    final textContentUpdate = this.textContentUpdate;
    final zipFileContentUpdate = this.zipFileContentUpdate;
    return {
      if (s3ContentLocationUpdate != null)
        'S3ContentLocationUpdate': s3ContentLocationUpdate,
      if (textContentUpdate != null) 'TextContentUpdate': textContentUpdate,
      if (zipFileContentUpdate != null)
        'ZipFileContentUpdate': base64Encode(zipFileContentUpdate),
    };
  }
}

enum ConfigurationType {
  $default,
  custom,
}

extension ConfigurationTypeValueExtension on ConfigurationType {
  String toValue() {
    switch (this) {
      case ConfigurationType.$default:
        return 'DEFAULT';
      case ConfigurationType.custom:
        return 'CUSTOM';
    }
  }
}

extension ConfigurationTypeFromString on String {
  ConfigurationType toConfigurationType() {
    switch (this) {
      case 'DEFAULT':
        return ConfigurationType.$default;
      case 'CUSTOM':
        return ConfigurationType.custom;
    }
    throw Exception('$this is not known in enum ConfigurationType');
  }
}

class CreateApplicationPresignedUrlResponse {
  /// The URL of the extension.
  final String? authorizedUrl;

  CreateApplicationPresignedUrlResponse({
    this.authorizedUrl,
  });

  factory CreateApplicationPresignedUrlResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateApplicationPresignedUrlResponse(
      authorizedUrl: json['AuthorizedUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedUrl = this.authorizedUrl;
    return {
      if (authorizedUrl != null) 'AuthorizedUrl': authorizedUrl,
    };
  }
}

class CreateApplicationResponse {
  /// In response to your <code>CreateApplication</code> request, Managed Service
  /// for Apache Flink returns a response with details of the application it
  /// created.
  final ApplicationDetail applicationDetail;

  CreateApplicationResponse({
    required this.applicationDetail,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationDetail: ApplicationDetail.fromJson(
          json['ApplicationDetail'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationDetail = this.applicationDetail;
    return {
      'ApplicationDetail': applicationDetail,
    };
  }
}

class CreateApplicationSnapshotResponse {
  CreateApplicationSnapshotResponse();

  factory CreateApplicationSnapshotResponse.fromJson(Map<String, dynamic> _) {
    return CreateApplicationSnapshotResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies dependency JARs, as well as JAR files that contain user-defined
/// functions (UDF).
class CustomArtifactConfiguration {
  /// <code>UDF</code> stands for user-defined functions. This type of artifact
  /// must be in an S3 bucket. A <code>DEPENDENCY_JAR</code> can be in either
  /// Maven or an S3 bucket.
  final ArtifactType artifactType;

  /// The parameters required to fully specify a Maven reference.
  final MavenReference? mavenReference;
  final S3ContentLocation? s3ContentLocation;

  CustomArtifactConfiguration({
    required this.artifactType,
    this.mavenReference,
    this.s3ContentLocation,
  });

  Map<String, dynamic> toJson() {
    final artifactType = this.artifactType;
    final mavenReference = this.mavenReference;
    final s3ContentLocation = this.s3ContentLocation;
    return {
      'ArtifactType': artifactType.toValue(),
      if (mavenReference != null) 'MavenReference': mavenReference,
      if (s3ContentLocation != null) 'S3ContentLocation': s3ContentLocation,
    };
  }
}

/// Specifies a dependency JAR or a JAR of user-defined functions.
class CustomArtifactConfigurationDescription {
  /// <code>UDF</code> stands for user-defined functions. This type of artifact
  /// must be in an S3 bucket. A <code>DEPENDENCY_JAR</code> can be in either
  /// Maven or an S3 bucket.
  final ArtifactType? artifactType;

  /// The parameters that are required to specify a Maven dependency.
  final MavenReference? mavenReferenceDescription;
  final S3ContentLocation? s3ContentLocationDescription;

  CustomArtifactConfigurationDescription({
    this.artifactType,
    this.mavenReferenceDescription,
    this.s3ContentLocationDescription,
  });

  factory CustomArtifactConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return CustomArtifactConfigurationDescription(
      artifactType: (json['ArtifactType'] as String?)?.toArtifactType(),
      mavenReferenceDescription: json['MavenReferenceDescription'] != null
          ? MavenReference.fromJson(
              json['MavenReferenceDescription'] as Map<String, dynamic>)
          : null,
      s3ContentLocationDescription: json['S3ContentLocationDescription'] != null
          ? S3ContentLocation.fromJson(
              json['S3ContentLocationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactType = this.artifactType;
    final mavenReferenceDescription = this.mavenReferenceDescription;
    final s3ContentLocationDescription = this.s3ContentLocationDescription;
    return {
      if (artifactType != null) 'ArtifactType': artifactType.toValue(),
      if (mavenReferenceDescription != null)
        'MavenReferenceDescription': mavenReferenceDescription,
      if (s3ContentLocationDescription != null)
        'S3ContentLocationDescription': s3ContentLocationDescription,
    };
  }
}

class DeleteApplicationCloudWatchLoggingOptionResponse {
  /// The application's Amazon Resource Name (ARN).
  final String? applicationARN;

  /// The version ID of the application. Kinesis Data Analytics updates the
  /// <code>ApplicationVersionId</code> each time you change the CloudWatch
  /// logging options.
  final int? applicationVersionId;

  /// The descriptions of the remaining CloudWatch logging options for the
  /// application.
  final List<CloudWatchLoggingOptionDescription>?
      cloudWatchLoggingOptionDescriptions;

  DeleteApplicationCloudWatchLoggingOptionResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.cloudWatchLoggingOptionDescriptions,
  });

  factory DeleteApplicationCloudWatchLoggingOptionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteApplicationCloudWatchLoggingOptionResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
      cloudWatchLoggingOptionDescriptions:
          (json['CloudWatchLoggingOptionDescriptions'] as List?)
              ?.whereNotNull()
              .map((e) => CloudWatchLoggingOptionDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    final cloudWatchLoggingOptionDescriptions =
        this.cloudWatchLoggingOptionDescriptions;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
      if (cloudWatchLoggingOptionDescriptions != null)
        'CloudWatchLoggingOptionDescriptions':
            cloudWatchLoggingOptionDescriptions,
    };
  }
}

class DeleteApplicationInputProcessingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String? applicationARN;

  /// The current application version ID.
  final int? applicationVersionId;

  DeleteApplicationInputProcessingConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
  });

  factory DeleteApplicationInputProcessingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteApplicationInputProcessingConfigurationResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
    };
  }
}

class DeleteApplicationOutputResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationARN;

  /// The current application version ID.
  final int? applicationVersionId;

  DeleteApplicationOutputResponse({
    this.applicationARN,
    this.applicationVersionId,
  });

  factory DeleteApplicationOutputResponse.fromJson(Map<String, dynamic> json) {
    return DeleteApplicationOutputResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
    };
  }
}

class DeleteApplicationReferenceDataSourceResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationARN;

  /// The updated version ID of the application.
  final int? applicationVersionId;

  DeleteApplicationReferenceDataSourceResponse({
    this.applicationARN,
    this.applicationVersionId,
  });

  factory DeleteApplicationReferenceDataSourceResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteApplicationReferenceDataSourceResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
    };
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationSnapshotResponse {
  DeleteApplicationSnapshotResponse();

  factory DeleteApplicationSnapshotResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationSnapshotResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationVpcConfigurationResponse {
  /// The ARN of the Managed Service for Apache Flink application.
  final String? applicationARN;

  /// The updated version ID of the application.
  final int? applicationVersionId;

  DeleteApplicationVpcConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
  });

  factory DeleteApplicationVpcConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteApplicationVpcConfigurationResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationVersionId: json['ApplicationVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationVersionId = this.applicationVersionId;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationVersionId != null)
        'ApplicationVersionId': applicationVersionId,
    };
  }
}

/// The information required to deploy a Managed Service for Apache Flink Studio
/// notebook as an application with durable state.
class DeployAsApplicationConfiguration {
  /// The description of an Amazon S3 object that contains the Amazon Data
  /// Analytics application, including the Amazon Resource Name (ARN) of the S3
  /// bucket, the name of the Amazon S3 object that contains the data, and the
  /// version number of the Amazon S3 object that contains the data.
  final S3ContentBaseLocation s3ContentLocation;

  DeployAsApplicationConfiguration({
    required this.s3ContentLocation,
  });

  Map<String, dynamic> toJson() {
    final s3ContentLocation = this.s3ContentLocation;
    return {
      'S3ContentLocation': s3ContentLocation,
    };
  }
}

/// The configuration information required to deploy an Amazon Data Analytics
/// Studio notebook as an application with durable state.
class DeployAsApplicationConfigurationDescription {
  /// The location that holds the data required to specify an Amazon Data
  /// Analytics application.
  final S3ContentBaseLocationDescription s3ContentLocationDescription;

  DeployAsApplicationConfigurationDescription({
    required this.s3ContentLocationDescription,
  });

  factory DeployAsApplicationConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return DeployAsApplicationConfigurationDescription(
      s3ContentLocationDescription: S3ContentBaseLocationDescription.fromJson(
          json['S3ContentLocationDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3ContentLocationDescription = this.s3ContentLocationDescription;
    return {
      'S3ContentLocationDescription': s3ContentLocationDescription,
    };
  }
}

/// Updates to the configuration information required to deploy an Amazon Data
/// Analytics Studio notebook as an application with durable state.
class DeployAsApplicationConfigurationUpdate {
  /// Updates to the location that holds the data required to specify an Amazon
  /// Data Analytics application.
  final S3ContentBaseLocationUpdate? s3ContentLocationUpdate;

  DeployAsApplicationConfigurationUpdate({
    this.s3ContentLocationUpdate,
  });

  Map<String, dynamic> toJson() {
    final s3ContentLocationUpdate = this.s3ContentLocationUpdate;
    return {
      if (s3ContentLocationUpdate != null)
        'S3ContentLocationUpdate': s3ContentLocationUpdate,
    };
  }
}

class DescribeApplicationResponse {
  /// Provides a description of the application, such as the application's Amazon
  /// Resource Name (ARN), status, and latest version.
  final ApplicationDetail applicationDetail;

  DescribeApplicationResponse({
    required this.applicationDetail,
  });

  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeApplicationResponse(
      applicationDetail: ApplicationDetail.fromJson(
          json['ApplicationDetail'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationDetail = this.applicationDetail;
    return {
      'ApplicationDetail': applicationDetail,
    };
  }
}

class DescribeApplicationSnapshotResponse {
  /// An object containing information about the application snapshot.
  final SnapshotDetails snapshotDetails;

  DescribeApplicationSnapshotResponse({
    required this.snapshotDetails,
  });

  factory DescribeApplicationSnapshotResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationSnapshotResponse(
      snapshotDetails: SnapshotDetails.fromJson(
          json['SnapshotDetails'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotDetails = this.snapshotDetails;
    return {
      'SnapshotDetails': snapshotDetails,
    };
  }
}

class DescribeApplicationVersionResponse {
  final ApplicationDetail? applicationVersionDetail;

  DescribeApplicationVersionResponse({
    this.applicationVersionDetail,
  });

  factory DescribeApplicationVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationVersionResponse(
      applicationVersionDetail: json['ApplicationVersionDetail'] != null
          ? ApplicationDetail.fromJson(
              json['ApplicationVersionDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersionDetail = this.applicationVersionDetail;
    return {
      if (applicationVersionDetail != null)
        'ApplicationVersionDetail': applicationVersionDetail,
    };
  }
}

/// Describes the data format when records are written to the destination in a
/// SQL-based Kinesis Data Analytics application.
class DestinationSchema {
  /// Specifies the format of the records on the output stream.
  final RecordFormatType recordFormatType;

  DestinationSchema({
    required this.recordFormatType,
  });

  factory DestinationSchema.fromJson(Map<String, dynamic> json) {
    return DestinationSchema(
      recordFormatType:
          (json['RecordFormatType'] as String).toRecordFormatType(),
    );
  }

  Map<String, dynamic> toJson() {
    final recordFormatType = this.recordFormatType;
    return {
      'RecordFormatType': recordFormatType.toValue(),
    };
  }
}

class DiscoverInputSchemaResponse {
  /// The schema inferred from the streaming source. It identifies the format of
  /// the data in the streaming source and how each data element maps to
  /// corresponding columns in the in-application stream that you can create.
  final SourceSchema? inputSchema;

  /// An array of elements, where each element corresponds to a row in a stream
  /// record (a stream record can have more than one row).
  final List<List<String>>? parsedInputRecords;

  /// The stream data that was modified by the processor specified in the
  /// <code>InputProcessingConfiguration</code> parameter.
  final List<String>? processedInputRecords;

  /// The raw stream data that was sampled to infer the schema.
  final List<String>? rawInputRecords;

  DiscoverInputSchemaResponse({
    this.inputSchema,
    this.parsedInputRecords,
    this.processedInputRecords,
    this.rawInputRecords,
  });

  factory DiscoverInputSchemaResponse.fromJson(Map<String, dynamic> json) {
    return DiscoverInputSchemaResponse(
      inputSchema: json['InputSchema'] != null
          ? SourceSchema.fromJson(json['InputSchema'] as Map<String, dynamic>)
          : null,
      parsedInputRecords: (json['ParsedInputRecords'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
      processedInputRecords: (json['ProcessedInputRecords'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      rawInputRecords: (json['RawInputRecords'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputSchema = this.inputSchema;
    final parsedInputRecords = this.parsedInputRecords;
    final processedInputRecords = this.processedInputRecords;
    final rawInputRecords = this.rawInputRecords;
    return {
      if (inputSchema != null) 'InputSchema': inputSchema,
      if (parsedInputRecords != null) 'ParsedInputRecords': parsedInputRecords,
      if (processedInputRecords != null)
        'ProcessedInputRecords': processedInputRecords,
      if (rawInputRecords != null) 'RawInputRecords': rawInputRecords,
    };
  }
}

/// Describes execution properties for a Managed Service for Apache Flink
/// application.
class EnvironmentProperties {
  /// Describes the execution property groups.
  final List<PropertyGroup> propertyGroups;

  EnvironmentProperties({
    required this.propertyGroups,
  });

  Map<String, dynamic> toJson() {
    final propertyGroups = this.propertyGroups;
    return {
      'PropertyGroups': propertyGroups,
    };
  }
}

/// Describes the execution properties for an Apache Flink runtime.
class EnvironmentPropertyDescriptions {
  /// Describes the execution property groups.
  final List<PropertyGroup>? propertyGroupDescriptions;

  EnvironmentPropertyDescriptions({
    this.propertyGroupDescriptions,
  });

  factory EnvironmentPropertyDescriptions.fromJson(Map<String, dynamic> json) {
    return EnvironmentPropertyDescriptions(
      propertyGroupDescriptions: (json['PropertyGroupDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => PropertyGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final propertyGroupDescriptions = this.propertyGroupDescriptions;
    return {
      if (propertyGroupDescriptions != null)
        'PropertyGroupDescriptions': propertyGroupDescriptions,
    };
  }
}

/// Describes updates to the execution property groups for a Managed Service for
/// Apache Flink application or a Studio notebook.
class EnvironmentPropertyUpdates {
  /// Describes updates to the execution property groups.
  final List<PropertyGroup> propertyGroups;

  EnvironmentPropertyUpdates({
    required this.propertyGroups,
  });

  Map<String, dynamic> toJson() {
    final propertyGroups = this.propertyGroups;
    return {
      'PropertyGroups': propertyGroups,
    };
  }
}

/// Describes configuration parameters for a Managed Service for Apache Flink
/// application or a Studio notebook.
class FlinkApplicationConfiguration {
  /// Describes an application's checkpointing configuration. Checkpointing is the
  /// process of persisting application state for fault tolerance. For more
  /// information, see <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/dev/datastream/fault-tolerance/checkpointing/#enabling-and-configuring-checkpointing">
  /// Checkpoints for Fault Tolerance</a> in the <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/">Apache
  /// Flink Documentation</a>.
  final CheckpointConfiguration? checkpointConfiguration;

  /// Describes configuration parameters for Amazon CloudWatch logging for an
  /// application.
  final MonitoringConfiguration? monitoringConfiguration;

  /// Describes parameters for how an application executes multiple tasks
  /// simultaneously.
  final ParallelismConfiguration? parallelismConfiguration;

  FlinkApplicationConfiguration({
    this.checkpointConfiguration,
    this.monitoringConfiguration,
    this.parallelismConfiguration,
  });

  Map<String, dynamic> toJson() {
    final checkpointConfiguration = this.checkpointConfiguration;
    final monitoringConfiguration = this.monitoringConfiguration;
    final parallelismConfiguration = this.parallelismConfiguration;
    return {
      if (checkpointConfiguration != null)
        'CheckpointConfiguration': checkpointConfiguration,
      if (monitoringConfiguration != null)
        'MonitoringConfiguration': monitoringConfiguration,
      if (parallelismConfiguration != null)
        'ParallelismConfiguration': parallelismConfiguration,
    };
  }
}

/// Describes configuration parameters for a Managed Service for Apache Flink
/// application.
class FlinkApplicationConfigurationDescription {
  /// Describes an application's checkpointing configuration. Checkpointing is the
  /// process of persisting application state for fault tolerance.
  final CheckpointConfigurationDescription? checkpointConfigurationDescription;

  /// The job plan for an application. For more information about the job plan,
  /// see <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/internals/job_scheduling.html">Jobs
  /// and Scheduling</a> in the <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/">Apache
  /// Flink Documentation</a>. To retrieve the job plan for the application, use
  /// the <a>DescribeApplicationRequest$IncludeAdditionalDetails</a> parameter of
  /// the <a>DescribeApplication</a> operation.
  final String? jobPlanDescription;

  /// Describes configuration parameters for Amazon CloudWatch logging for an
  /// application.
  final MonitoringConfigurationDescription? monitoringConfigurationDescription;

  /// Describes parameters for how an application executes multiple tasks
  /// simultaneously.
  final ParallelismConfigurationDescription?
      parallelismConfigurationDescription;

  FlinkApplicationConfigurationDescription({
    this.checkpointConfigurationDescription,
    this.jobPlanDescription,
    this.monitoringConfigurationDescription,
    this.parallelismConfigurationDescription,
  });

  factory FlinkApplicationConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return FlinkApplicationConfigurationDescription(
      checkpointConfigurationDescription:
          json['CheckpointConfigurationDescription'] != null
              ? CheckpointConfigurationDescription.fromJson(
                  json['CheckpointConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      jobPlanDescription: json['JobPlanDescription'] as String?,
      monitoringConfigurationDescription:
          json['MonitoringConfigurationDescription'] != null
              ? MonitoringConfigurationDescription.fromJson(
                  json['MonitoringConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      parallelismConfigurationDescription:
          json['ParallelismConfigurationDescription'] != null
              ? ParallelismConfigurationDescription.fromJson(
                  json['ParallelismConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final checkpointConfigurationDescription =
        this.checkpointConfigurationDescription;
    final jobPlanDescription = this.jobPlanDescription;
    final monitoringConfigurationDescription =
        this.monitoringConfigurationDescription;
    final parallelismConfigurationDescription =
        this.parallelismConfigurationDescription;
    return {
      if (checkpointConfigurationDescription != null)
        'CheckpointConfigurationDescription':
            checkpointConfigurationDescription,
      if (jobPlanDescription != null) 'JobPlanDescription': jobPlanDescription,
      if (monitoringConfigurationDescription != null)
        'MonitoringConfigurationDescription':
            monitoringConfigurationDescription,
      if (parallelismConfigurationDescription != null)
        'ParallelismConfigurationDescription':
            parallelismConfigurationDescription,
    };
  }
}

/// Describes updates to the configuration parameters for a Managed Service for
/// Apache Flink application.
class FlinkApplicationConfigurationUpdate {
  /// Describes updates to an application's checkpointing configuration.
  /// Checkpointing is the process of persisting application state for fault
  /// tolerance.
  final CheckpointConfigurationUpdate? checkpointConfigurationUpdate;

  /// Describes updates to the configuration parameters for Amazon CloudWatch
  /// logging for an application.
  final MonitoringConfigurationUpdate? monitoringConfigurationUpdate;

  /// Describes updates to the parameters for how an application executes multiple
  /// tasks simultaneously.
  final ParallelismConfigurationUpdate? parallelismConfigurationUpdate;

  FlinkApplicationConfigurationUpdate({
    this.checkpointConfigurationUpdate,
    this.monitoringConfigurationUpdate,
    this.parallelismConfigurationUpdate,
  });

  Map<String, dynamic> toJson() {
    final checkpointConfigurationUpdate = this.checkpointConfigurationUpdate;
    final monitoringConfigurationUpdate = this.monitoringConfigurationUpdate;
    final parallelismConfigurationUpdate = this.parallelismConfigurationUpdate;
    return {
      if (checkpointConfigurationUpdate != null)
        'CheckpointConfigurationUpdate': checkpointConfigurationUpdate,
      if (monitoringConfigurationUpdate != null)
        'MonitoringConfigurationUpdate': monitoringConfigurationUpdate,
      if (parallelismConfigurationUpdate != null)
        'ParallelismConfigurationUpdate': parallelismConfigurationUpdate,
    };
  }
}

/// Describes the starting parameters for a Managed Service for Apache Flink
/// application.
class FlinkRunConfiguration {
  /// When restoring from a snapshot, specifies whether the runtime is allowed to
  /// skip a state that cannot be mapped to the new program. This will happen if
  /// the program is updated between snapshots to remove stateful parameters, and
  /// state data in the snapshot no longer corresponds to valid application data.
  /// For more information, see <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/docs/ops/state/savepoints/#allowing-non-restored-state">
  /// Allowing Non-Restored State</a> in the <a
  /// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/">Apache
  /// Flink documentation</a>.
  /// <note>
  /// This value defaults to <code>false</code>. If you update your application
  /// without specifying this parameter, <code>AllowNonRestoredState</code> will
  /// be set to <code>false</code>, even if it was previously set to
  /// <code>true</code>.
  /// </note>
  final bool? allowNonRestoredState;

  FlinkRunConfiguration({
    this.allowNonRestoredState,
  });

  factory FlinkRunConfiguration.fromJson(Map<String, dynamic> json) {
    return FlinkRunConfiguration(
      allowNonRestoredState: json['AllowNonRestoredState'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowNonRestoredState = this.allowNonRestoredState;
    return {
      if (allowNonRestoredState != null)
        'AllowNonRestoredState': allowNonRestoredState,
    };
  }
}

/// The configuration of the Glue Data Catalog that you use for Apache Flink SQL
/// queries and table API transforms that you write in an application.
class GlueDataCatalogConfiguration {
  /// The Amazon Resource Name (ARN) of the database.
  final String databaseARN;

  GlueDataCatalogConfiguration({
    required this.databaseARN,
  });

  Map<String, dynamic> toJson() {
    final databaseARN = this.databaseARN;
    return {
      'DatabaseARN': databaseARN,
    };
  }
}

/// The configuration of the Glue Data Catalog that you use for Apache Flink SQL
/// queries and table API transforms that you write in an application.
class GlueDataCatalogConfigurationDescription {
  /// The Amazon Resource Name (ARN) of the database.
  final String databaseARN;

  GlueDataCatalogConfigurationDescription({
    required this.databaseARN,
  });

  factory GlueDataCatalogConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return GlueDataCatalogConfigurationDescription(
      databaseARN: json['DatabaseARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseARN = this.databaseARN;
    return {
      'DatabaseARN': databaseARN,
    };
  }
}

/// Updates to the configuration of the Glue Data Catalog that you use for SQL
/// queries that you write in a Managed Service for Apache Flink Studio
/// notebook.
class GlueDataCatalogConfigurationUpdate {
  /// The updated Amazon Resource Name (ARN) of the database.
  final String databaseARNUpdate;

  GlueDataCatalogConfigurationUpdate({
    required this.databaseARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final databaseARNUpdate = this.databaseARNUpdate;
    return {
      'DatabaseARNUpdate': databaseARNUpdate,
    };
  }
}

/// When you configure the application input for a SQL-based Kinesis Data
/// Analytics application, you specify the streaming source, the in-application
/// stream name that is created, and the mapping between the two.
class Input {
  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns in the in-application stream that is
  /// being created.
  ///
  /// Also used to describe the format of the reference data source.
  final SourceSchema inputSchema;

  /// The name prefix to use when creating an in-application stream. Suppose that
  /// you specify a prefix "<code>MyInApplicationStream</code>." Kinesis Data
  /// Analytics then creates one or more (as per the <code>InputParallelism</code>
  /// count you specified) in-application streams with the names
  /// "<code>MyInApplicationStream_001</code>,"
  /// "<code>MyInApplicationStream_002</code>," and so on.
  final String namePrefix;

  /// Describes the number of in-application streams to create.
  final InputParallelism? inputParallelism;

  /// The <a>InputProcessingConfiguration</a> for the input. An input processor
  /// transforms records as they are received from the stream, before the
  /// application's SQL code executes. Currently, the only input processing
  /// configuration available is <a>InputLambdaProcessor</a>.
  final InputProcessingConfiguration? inputProcessingConfiguration;

  /// If the streaming source is an Amazon Kinesis Data Firehose delivery stream,
  /// identifies the delivery stream's ARN.
  final KinesisFirehoseInput? kinesisFirehoseInput;

  /// If the streaming source is an Amazon Kinesis data stream, identifies the
  /// stream's Amazon Resource Name (ARN).
  final KinesisStreamsInput? kinesisStreamsInput;

  Input({
    required this.inputSchema,
    required this.namePrefix,
    this.inputParallelism,
    this.inputProcessingConfiguration,
    this.kinesisFirehoseInput,
    this.kinesisStreamsInput,
  });

  Map<String, dynamic> toJson() {
    final inputSchema = this.inputSchema;
    final namePrefix = this.namePrefix;
    final inputParallelism = this.inputParallelism;
    final inputProcessingConfiguration = this.inputProcessingConfiguration;
    final kinesisFirehoseInput = this.kinesisFirehoseInput;
    final kinesisStreamsInput = this.kinesisStreamsInput;
    return {
      'InputSchema': inputSchema,
      'NamePrefix': namePrefix,
      if (inputParallelism != null) 'InputParallelism': inputParallelism,
      if (inputProcessingConfiguration != null)
        'InputProcessingConfiguration': inputProcessingConfiguration,
      if (kinesisFirehoseInput != null)
        'KinesisFirehoseInput': kinesisFirehoseInput,
      if (kinesisStreamsInput != null)
        'KinesisStreamsInput': kinesisStreamsInput,
    };
  }
}

/// Describes the application input configuration for a SQL-based Kinesis Data
/// Analytics application.
class InputDescription {
  /// Returns the in-application stream names that are mapped to the stream
  /// source.
  final List<String>? inAppStreamNames;

  /// The input ID that is associated with the application input. This is the ID
  /// that Kinesis Data Analytics assigns to each input configuration that you add
  /// to your application.
  final String? inputId;

  /// Describes the configured parallelism (number of in-application streams
  /// mapped to the streaming source).
  final InputParallelism? inputParallelism;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  final InputProcessingConfigurationDescription?
      inputProcessingConfigurationDescription;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns in the in-application stream that is
  /// being created.
  final SourceSchema? inputSchema;

  /// The point at which the application is configured to read from the input
  /// stream.
  final InputStartingPositionConfiguration? inputStartingPositionConfiguration;

  /// If a Kinesis Data Firehose delivery stream is configured as a streaming
  /// source, provides the delivery stream's ARN.
  final KinesisFirehoseInputDescription? kinesisFirehoseInputDescription;

  /// If a Kinesis data stream is configured as a streaming source, provides the
  /// Kinesis data stream's Amazon Resource Name (ARN).
  final KinesisStreamsInputDescription? kinesisStreamsInputDescription;

  /// The in-application name prefix.
  final String? namePrefix;

  InputDescription({
    this.inAppStreamNames,
    this.inputId,
    this.inputParallelism,
    this.inputProcessingConfigurationDescription,
    this.inputSchema,
    this.inputStartingPositionConfiguration,
    this.kinesisFirehoseInputDescription,
    this.kinesisStreamsInputDescription,
    this.namePrefix,
  });

  factory InputDescription.fromJson(Map<String, dynamic> json) {
    return InputDescription(
      inAppStreamNames: (json['InAppStreamNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inputId: json['InputId'] as String?,
      inputParallelism: json['InputParallelism'] != null
          ? InputParallelism.fromJson(
              json['InputParallelism'] as Map<String, dynamic>)
          : null,
      inputProcessingConfigurationDescription:
          json['InputProcessingConfigurationDescription'] != null
              ? InputProcessingConfigurationDescription.fromJson(
                  json['InputProcessingConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      inputSchema: json['InputSchema'] != null
          ? SourceSchema.fromJson(json['InputSchema'] as Map<String, dynamic>)
          : null,
      inputStartingPositionConfiguration:
          json['InputStartingPositionConfiguration'] != null
              ? InputStartingPositionConfiguration.fromJson(
                  json['InputStartingPositionConfiguration']
                      as Map<String, dynamic>)
              : null,
      kinesisFirehoseInputDescription:
          json['KinesisFirehoseInputDescription'] != null
              ? KinesisFirehoseInputDescription.fromJson(
                  json['KinesisFirehoseInputDescription']
                      as Map<String, dynamic>)
              : null,
      kinesisStreamsInputDescription: json['KinesisStreamsInputDescription'] !=
              null
          ? KinesisStreamsInputDescription.fromJson(
              json['KinesisStreamsInputDescription'] as Map<String, dynamic>)
          : null,
      namePrefix: json['NamePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inAppStreamNames = this.inAppStreamNames;
    final inputId = this.inputId;
    final inputParallelism = this.inputParallelism;
    final inputProcessingConfigurationDescription =
        this.inputProcessingConfigurationDescription;
    final inputSchema = this.inputSchema;
    final inputStartingPositionConfiguration =
        this.inputStartingPositionConfiguration;
    final kinesisFirehoseInputDescription =
        this.kinesisFirehoseInputDescription;
    final kinesisStreamsInputDescription = this.kinesisStreamsInputDescription;
    final namePrefix = this.namePrefix;
    return {
      if (inAppStreamNames != null) 'InAppStreamNames': inAppStreamNames,
      if (inputId != null) 'InputId': inputId,
      if (inputParallelism != null) 'InputParallelism': inputParallelism,
      if (inputProcessingConfigurationDescription != null)
        'InputProcessingConfigurationDescription':
            inputProcessingConfigurationDescription,
      if (inputSchema != null) 'InputSchema': inputSchema,
      if (inputStartingPositionConfiguration != null)
        'InputStartingPositionConfiguration':
            inputStartingPositionConfiguration,
      if (kinesisFirehoseInputDescription != null)
        'KinesisFirehoseInputDescription': kinesisFirehoseInputDescription,
      if (kinesisStreamsInputDescription != null)
        'KinesisStreamsInputDescription': kinesisStreamsInputDescription,
      if (namePrefix != null) 'NamePrefix': namePrefix,
    };
  }
}

/// An object that contains the Amazon Resource Name (ARN) of the Amazon Lambda
/// function that is used to preprocess records in the stream in a SQL-based
/// Kinesis Data Analytics application.
class InputLambdaProcessor {
  /// The ARN of the Amazon Lambda function that operates on records in the
  /// stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: Amazon Lambda</a>
  /// </note>
  final String resourceARN;

  InputLambdaProcessor({
    required this.resourceARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      'ResourceARN': resourceARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, an object that contains
/// the Amazon Resource Name (ARN) of the Amazon Lambda function that is used to
/// preprocess records in the stream.
class InputLambdaProcessorDescription {
  /// The ARN of the Amazon Lambda function that is used to preprocess the records
  /// in the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: Amazon Lambda</a>
  /// </note>
  final String resourceARN;

  /// The ARN of the IAM role that is used to access the Amazon Lambda function.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? roleARN;

  InputLambdaProcessorDescription({
    required this.resourceARN,
    this.roleARN,
  });

  factory InputLambdaProcessorDescription.fromJson(Map<String, dynamic> json) {
    return InputLambdaProcessorDescription(
      resourceARN: json['ResourceARN'] as String,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, represents an update to
/// the <a>InputLambdaProcessor</a> that is used to preprocess the records in
/// the stream.
class InputLambdaProcessorUpdate {
  /// The Amazon Resource Name (ARN) of the new Amazon Lambda function that is
  /// used to preprocess the records in the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: Amazon Lambda</a>
  /// </note>
  final String resourceARNUpdate;

  InputLambdaProcessorUpdate({
    required this.resourceARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    return {
      'ResourceARNUpdate': resourceARNUpdate,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the number of
/// in-application streams to create for a given streaming source.
class InputParallelism {
  /// The number of in-application streams to create.
  final int? count;

  InputParallelism({
    this.count,
  });

  factory InputParallelism.fromJson(Map<String, dynamic> json) {
    return InputParallelism(
      count: json['Count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    return {
      if (count != null) 'Count': count,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, provides updates to the
/// parallelism count.
class InputParallelismUpdate {
  /// The number of in-application streams to create for the specified streaming
  /// source.
  final int countUpdate;

  InputParallelismUpdate({
    required this.countUpdate,
  });

  Map<String, dynamic> toJson() {
    final countUpdate = this.countUpdate;
    return {
      'CountUpdate': countUpdate,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes a processor
/// that is used to preprocess the records in the stream before being processed
/// by your application code. Currently, the only input processor available is
/// <a href="https://docs.aws.amazon.com/lambda/">Amazon Lambda</a>.
class InputProcessingConfiguration {
  /// The <a>InputLambdaProcessor</a> that is used to preprocess the records in
  /// the stream before being processed by your application code.
  final InputLambdaProcessor inputLambdaProcessor;

  InputProcessingConfiguration({
    required this.inputLambdaProcessor,
  });

  Map<String, dynamic> toJson() {
    final inputLambdaProcessor = this.inputLambdaProcessor;
    return {
      'InputLambdaProcessor': inputLambdaProcessor,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, provides the
/// configuration information about an input processor. Currently, the only
/// input processor available is <a
/// href="https://docs.aws.amazon.com/lambda/">Amazon Lambda</a>.
class InputProcessingConfigurationDescription {
  /// Provides configuration information about the associated
  /// <a>InputLambdaProcessorDescription</a>
  final InputLambdaProcessorDescription? inputLambdaProcessorDescription;

  InputProcessingConfigurationDescription({
    this.inputLambdaProcessorDescription,
  });

  factory InputProcessingConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return InputProcessingConfigurationDescription(
      inputLambdaProcessorDescription:
          json['InputLambdaProcessorDescription'] != null
              ? InputLambdaProcessorDescription.fromJson(
                  json['InputLambdaProcessorDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputLambdaProcessorDescription =
        this.inputLambdaProcessorDescription;
    return {
      if (inputLambdaProcessorDescription != null)
        'InputLambdaProcessorDescription': inputLambdaProcessorDescription,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes updates to an
/// <a>InputProcessingConfiguration</a>.
class InputProcessingConfigurationUpdate {
  /// Provides update information for an <a>InputLambdaProcessor</a>.
  final InputLambdaProcessorUpdate inputLambdaProcessorUpdate;

  InputProcessingConfigurationUpdate({
    required this.inputLambdaProcessorUpdate,
  });

  Map<String, dynamic> toJson() {
    final inputLambdaProcessorUpdate = this.inputLambdaProcessorUpdate;
    return {
      'InputLambdaProcessorUpdate': inputLambdaProcessorUpdate,
    };
  }
}

/// Describes updates for an SQL-based Kinesis Data Analytics application's
/// input schema.
class InputSchemaUpdate {
  /// A list of <code>RecordColumn</code> objects. Each object describes the
  /// mapping of the streaming source element to the corresponding column in the
  /// in-application stream.
  final List<RecordColumn>? recordColumnUpdates;

  /// Specifies the encoding of the records in the streaming source; for example,
  /// UTF-8.
  final String? recordEncodingUpdate;

  /// Specifies the format of the records on the streaming source.
  final RecordFormat? recordFormatUpdate;

  InputSchemaUpdate({
    this.recordColumnUpdates,
    this.recordEncodingUpdate,
    this.recordFormatUpdate,
  });

  Map<String, dynamic> toJson() {
    final recordColumnUpdates = this.recordColumnUpdates;
    final recordEncodingUpdate = this.recordEncodingUpdate;
    final recordFormatUpdate = this.recordFormatUpdate;
    return {
      if (recordColumnUpdates != null)
        'RecordColumnUpdates': recordColumnUpdates,
      if (recordEncodingUpdate != null)
        'RecordEncodingUpdate': recordEncodingUpdate,
      if (recordFormatUpdate != null) 'RecordFormatUpdate': recordFormatUpdate,
    };
  }
}

enum InputStartingPosition {
  now,
  trimHorizon,
  lastStoppedPoint,
}

extension InputStartingPositionValueExtension on InputStartingPosition {
  String toValue() {
    switch (this) {
      case InputStartingPosition.now:
        return 'NOW';
      case InputStartingPosition.trimHorizon:
        return 'TRIM_HORIZON';
      case InputStartingPosition.lastStoppedPoint:
        return 'LAST_STOPPED_POINT';
    }
  }
}

extension InputStartingPositionFromString on String {
  InputStartingPosition toInputStartingPosition() {
    switch (this) {
      case 'NOW':
        return InputStartingPosition.now;
      case 'TRIM_HORIZON':
        return InputStartingPosition.trimHorizon;
      case 'LAST_STOPPED_POINT':
        return InputStartingPosition.lastStoppedPoint;
    }
    throw Exception('$this is not known in enum InputStartingPosition');
  }
}

/// Describes the point at which the application reads from the streaming
/// source.
class InputStartingPositionConfiguration {
  /// The starting position on the stream.
  ///
  /// <ul>
  /// <li>
  /// <code>NOW</code> - Start reading just after the most recent record in the
  /// stream, and start at the request timestamp that the customer issued.
  /// </li>
  /// <li>
  /// <code>TRIM_HORIZON</code> - Start reading at the last untrimmed record in
  /// the stream, which is the oldest record available in the stream. This option
  /// is not available for an Amazon Kinesis Data Firehose delivery stream.
  /// </li>
  /// <li>
  /// <code>LAST_STOPPED_POINT</code> - Resume reading from where the application
  /// last stopped reading.
  /// </li>
  /// </ul>
  final InputStartingPosition? inputStartingPosition;

  InputStartingPositionConfiguration({
    this.inputStartingPosition,
  });

  factory InputStartingPositionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return InputStartingPositionConfiguration(
      inputStartingPosition:
          (json['InputStartingPosition'] as String?)?.toInputStartingPosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputStartingPosition = this.inputStartingPosition;
    return {
      if (inputStartingPosition != null)
        'InputStartingPosition': inputStartingPosition.toValue(),
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes updates to a
/// specific input configuration (identified by the <code>InputId</code> of an
/// application).
class InputUpdate {
  /// The input ID of the application input to be updated.
  final String inputId;

  /// Describes the parallelism updates (the number of in-application streams
  /// Kinesis Data Analytics creates for the specific streaming source).
  final InputParallelismUpdate? inputParallelismUpdate;

  /// Describes updates to an <a>InputProcessingConfiguration</a>.
  final InputProcessingConfigurationUpdate? inputProcessingConfigurationUpdate;

  /// Describes the data format on the streaming source, and how record elements
  /// on the streaming source map to columns of the in-application stream that is
  /// created.
  final InputSchemaUpdate? inputSchemaUpdate;

  /// If a Kinesis Data Firehose delivery stream is the streaming source to be
  /// updated, provides an updated stream ARN.
  final KinesisFirehoseInputUpdate? kinesisFirehoseInputUpdate;

  /// If a Kinesis data stream is the streaming source to be updated, provides an
  /// updated stream Amazon Resource Name (ARN).
  final KinesisStreamsInputUpdate? kinesisStreamsInputUpdate;

  /// The name prefix for in-application streams that Kinesis Data Analytics
  /// creates for the specific streaming source.
  final String? namePrefixUpdate;

  InputUpdate({
    required this.inputId,
    this.inputParallelismUpdate,
    this.inputProcessingConfigurationUpdate,
    this.inputSchemaUpdate,
    this.kinesisFirehoseInputUpdate,
    this.kinesisStreamsInputUpdate,
    this.namePrefixUpdate,
  });

  Map<String, dynamic> toJson() {
    final inputId = this.inputId;
    final inputParallelismUpdate = this.inputParallelismUpdate;
    final inputProcessingConfigurationUpdate =
        this.inputProcessingConfigurationUpdate;
    final inputSchemaUpdate = this.inputSchemaUpdate;
    final kinesisFirehoseInputUpdate = this.kinesisFirehoseInputUpdate;
    final kinesisStreamsInputUpdate = this.kinesisStreamsInputUpdate;
    final namePrefixUpdate = this.namePrefixUpdate;
    return {
      'InputId': inputId,
      if (inputParallelismUpdate != null)
        'InputParallelismUpdate': inputParallelismUpdate,
      if (inputProcessingConfigurationUpdate != null)
        'InputProcessingConfigurationUpdate':
            inputProcessingConfigurationUpdate,
      if (inputSchemaUpdate != null) 'InputSchemaUpdate': inputSchemaUpdate,
      if (kinesisFirehoseInputUpdate != null)
        'KinesisFirehoseInputUpdate': kinesisFirehoseInputUpdate,
      if (kinesisStreamsInputUpdate != null)
        'KinesisStreamsInputUpdate': kinesisStreamsInputUpdate,
      if (namePrefixUpdate != null) 'NamePrefixUpdate': namePrefixUpdate,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, provides additional
/// mapping information when JSON is the record format on the streaming source.
class JSONMappingParameters {
  /// The path to the top-level parent that contains the records.
  final String recordRowPath;

  JSONMappingParameters({
    required this.recordRowPath,
  });

  factory JSONMappingParameters.fromJson(Map<String, dynamic> json) {
    return JSONMappingParameters(
      recordRowPath: json['RecordRowPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final recordRowPath = this.recordRowPath;
    return {
      'RecordRowPath': recordRowPath,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, identifies a Kinesis
/// Data Firehose delivery stream as the streaming source. You provide the
/// delivery stream's Amazon Resource Name (ARN).
class KinesisFirehoseInput {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String resourceARN;

  KinesisFirehoseInput({
    required this.resourceARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      'ResourceARN': resourceARN,
    };
  }
}

/// Describes the Amazon Kinesis Data Firehose delivery stream that is
/// configured as the streaming source in the application input configuration.
class KinesisFirehoseInputDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics assumes to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? roleARN;

  KinesisFirehoseInputDescription({
    required this.resourceARN,
    this.roleARN,
  });

  factory KinesisFirehoseInputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseInputDescription(
      resourceARN: json['ResourceARN'] as String,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, when updating
/// application input configuration, provides information about a Kinesis Data
/// Firehose delivery stream as the streaming source.
class KinesisFirehoseInputUpdate {
  /// The Amazon Resource Name (ARN) of the input delivery stream to read.
  final String resourceARNUpdate;

  KinesisFirehoseInputUpdate({
    required this.resourceARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    return {
      'ResourceARNUpdate': resourceARNUpdate,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, when configuring
/// application output, identifies a Kinesis Data Firehose delivery stream as
/// the destination. You provide the stream Amazon Resource Name (ARN) of the
/// delivery stream.
class KinesisFirehoseOutput {
  /// The ARN of the destination delivery stream to write to.
  final String resourceARN;

  KinesisFirehoseOutput({
    required this.resourceARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      'ResourceARN': resourceARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application's output, describes the
/// Kinesis Data Firehose delivery stream that is configured as its destination.
class KinesisFirehoseOutputDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? roleARN;

  KinesisFirehoseOutputDescription({
    required this.resourceARN,
    this.roleARN,
  });

  factory KinesisFirehoseOutputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseOutputDescription(
      resourceARN: json['ResourceARN'] as String,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, when updating an output
/// configuration using the <a>UpdateApplication</a> operation, provides
/// information about a Kinesis Data Firehose delivery stream that is configured
/// as the destination.
class KinesisFirehoseOutputUpdate {
  /// The Amazon Resource Name (ARN) of the delivery stream to write to.
  final String resourceARNUpdate;

  KinesisFirehoseOutputUpdate({
    required this.resourceARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    return {
      'ResourceARNUpdate': resourceARNUpdate,
    };
  }
}

/// Identifies a Kinesis data stream as the streaming source. You provide the
/// stream's Amazon Resource Name (ARN).
class KinesisStreamsInput {
  /// The ARN of the input Kinesis data stream to read.
  final String resourceARN;

  KinesisStreamsInput({
    required this.resourceARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      'ResourceARN': resourceARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the Kinesis
/// data stream that is configured as the streaming source in the application
/// input configuration.
class KinesisStreamsInputDescription {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream.
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? roleARN;

  KinesisStreamsInputDescription({
    required this.resourceARN,
    this.roleARN,
  });

  factory KinesisStreamsInputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisStreamsInputDescription(
      resourceARN: json['ResourceARN'] as String,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When you update the input configuration for a SQL-based Kinesis Data
/// Analytics application, provides information about a Kinesis stream as the
/// streaming source.
class KinesisStreamsInputUpdate {
  /// The Amazon Resource Name (ARN) of the input Kinesis data stream to read.
  final String resourceARNUpdate;

  KinesisStreamsInputUpdate({
    required this.resourceARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    return {
      'ResourceARNUpdate': resourceARNUpdate,
    };
  }
}

/// When you configure a SQL-based Kinesis Data Analytics application's output,
/// identifies a Kinesis data stream as the destination. You provide the stream
/// Amazon Resource Name (ARN).
class KinesisStreamsOutput {
  /// The ARN of the destination Kinesis data stream to write to.
  final String resourceARN;

  KinesisStreamsOutput({
    required this.resourceARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      'ResourceARN': resourceARN,
    };
  }
}

/// For an SQL-based Kinesis Data Analytics application's output, describes the
/// Kinesis data stream that is configured as its destination.
class KinesisStreamsOutputDescription {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream.
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? roleARN;

  KinesisStreamsOutputDescription({
    required this.resourceARN,
    this.roleARN,
  });

  factory KinesisStreamsOutputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisStreamsOutputDescription(
      resourceARN: json['ResourceARN'] as String,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When you update a SQL-based Kinesis Data Analytics application's output
/// configuration using the <a>UpdateApplication</a> operation, provides
/// information about a Kinesis data stream that is configured as the
/// destination.
class KinesisStreamsOutputUpdate {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream where you want to
  /// write the output.
  final String resourceARNUpdate;

  KinesisStreamsOutputUpdate({
    required this.resourceARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    return {
      'ResourceARNUpdate': resourceARNUpdate,
    };
  }
}

/// When you configure a SQL-based Kinesis Data Analytics application's output,
/// identifies an Amazon Lambda function as the destination. You provide the
/// function Amazon Resource Name (ARN) of the Lambda function.
class LambdaOutput {
  /// The Amazon Resource Name (ARN) of the destination Lambda function to write
  /// to.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: Amazon Lambda</a>
  /// </note>
  final String resourceARN;

  LambdaOutput({
    required this.resourceARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    return {
      'ResourceARN': resourceARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application's output, describes the
/// Amazon Lambda function that is configured as its destination.
class LambdaOutputDescription {
  /// The Amazon Resource Name (ARN) of the destination Lambda function.
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to write to
  /// the destination function.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? roleARN;

  LambdaOutputDescription({
    required this.resourceARN,
    this.roleARN,
  });

  factory LambdaOutputDescription.fromJson(Map<String, dynamic> json) {
    return LambdaOutputDescription(
      resourceARN: json['ResourceARN'] as String,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When you update an SQL-based Kinesis Data Analytics application's output
/// configuration using the <a>UpdateApplication</a> operation, provides
/// information about an Amazon Lambda function that is configured as the
/// destination.
class LambdaOutputUpdate {
  /// The Amazon Resource Name (ARN) of the destination Amazon Lambda function.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: Amazon Lambda</a>
  /// </note>
  final String resourceARNUpdate;

  LambdaOutputUpdate({
    required this.resourceARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    return {
      'ResourceARNUpdate': resourceARNUpdate,
    };
  }
}

class ListApplicationSnapshotsResponse {
  /// The token for the next set of results, or <code>null</code> if there are no
  /// additional results.
  final String? nextToken;

  /// A collection of objects containing information about the application
  /// snapshots.
  final List<SnapshotDetails>? snapshotSummaries;

  ListApplicationSnapshotsResponse({
    this.nextToken,
    this.snapshotSummaries,
  });

  factory ListApplicationSnapshotsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationSnapshotsResponse(
      nextToken: json['NextToken'] as String?,
      snapshotSummaries: (json['SnapshotSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SnapshotDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshotSummaries = this.snapshotSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (snapshotSummaries != null) 'SnapshotSummaries': snapshotSummaries,
    };
  }
}

class ListApplicationVersionsResponse {
  /// A list of the application versions and the associated configuration
  /// summaries. The list includes application versions that were rolled back.
  ///
  /// To get the complete description of a specific application version, invoke
  /// the <a>DescribeApplicationVersion</a> operation.
  final List<ApplicationVersionSummary>? applicationVersionSummaries;

  /// The pagination token for the next set of results, or <code>null</code> if
  /// there are no additional results. To retrieve the next set of items, pass
  /// this token into a subsequent invocation of this operation. For more
  /// information about pagination, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Using
  /// the Amazon Command Line Interface's Pagination Options</a>.
  final String? nextToken;

  ListApplicationVersionsResponse({
    this.applicationVersionSummaries,
    this.nextToken,
  });

  factory ListApplicationVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationVersionsResponse(
      applicationVersionSummaries:
          (json['ApplicationVersionSummaries'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ApplicationVersionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersionSummaries = this.applicationVersionSummaries;
    final nextToken = this.nextToken;
    return {
      if (applicationVersionSummaries != null)
        'ApplicationVersionSummaries': applicationVersionSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListApplicationsResponse {
  /// A list of <code>ApplicationSummary</code> objects.
  final List<ApplicationSummary> applicationSummaries;

  /// The pagination token for the next set of results, or <code>null</code> if
  /// there are no additional results. Pass this token into a subsequent command
  /// to retrieve the next set of items For more information about pagination, see
  /// <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Using
  /// the Amazon Command Line Interface's Pagination Options</a>.
  final String? nextToken;

  ListApplicationsResponse({
    required this.applicationSummaries,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applicationSummaries: (json['ApplicationSummaries'] as List)
          .whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSummaries = this.applicationSummaries;
    final nextToken = this.nextToken;
    return {
      'ApplicationSummaries': applicationSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The key-value tags assigned to the application.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum LogLevel {
  info,
  warn,
  error,
  debug,
}

extension LogLevelValueExtension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.info:
        return 'INFO';
      case LogLevel.warn:
        return 'WARN';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.debug:
        return 'DEBUG';
    }
  }
}

extension LogLevelFromString on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'INFO':
        return LogLevel.info;
      case 'WARN':
        return LogLevel.warn;
      case 'ERROR':
        return LogLevel.error;
      case 'DEBUG':
        return LogLevel.debug;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

/// When you configure a SQL-based Kinesis Data Analytics application's input at
/// the time of creating or updating an application, provides additional mapping
/// information specific to the record format (such as JSON, CSV, or record
/// fields delimited by some delimiter) on the streaming source.
class MappingParameters {
  /// Provides additional mapping information when the record format uses
  /// delimiters (for example, CSV).
  final CSVMappingParameters? cSVMappingParameters;

  /// Provides additional mapping information when JSON is the record format on
  /// the streaming source.
  final JSONMappingParameters? jSONMappingParameters;

  MappingParameters({
    this.cSVMappingParameters,
    this.jSONMappingParameters,
  });

  factory MappingParameters.fromJson(Map<String, dynamic> json) {
    return MappingParameters(
      cSVMappingParameters: json['CSVMappingParameters'] != null
          ? CSVMappingParameters.fromJson(
              json['CSVMappingParameters'] as Map<String, dynamic>)
          : null,
      jSONMappingParameters: json['JSONMappingParameters'] != null
          ? JSONMappingParameters.fromJson(
              json['JSONMappingParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cSVMappingParameters = this.cSVMappingParameters;
    final jSONMappingParameters = this.jSONMappingParameters;
    return {
      if (cSVMappingParameters != null)
        'CSVMappingParameters': cSVMappingParameters,
      if (jSONMappingParameters != null)
        'JSONMappingParameters': jSONMappingParameters,
    };
  }
}

/// The information required to specify a Maven reference. You can use Maven
/// references to specify dependency JAR files.
class MavenReference {
  /// The artifact ID of the Maven reference.
  final String artifactId;

  /// The group ID of the Maven reference.
  final String groupId;

  /// The version of the Maven reference.
  final String version;

  MavenReference({
    required this.artifactId,
    required this.groupId,
    required this.version,
  });

  factory MavenReference.fromJson(Map<String, dynamic> json) {
    return MavenReference(
      artifactId: json['ArtifactId'] as String,
      groupId: json['GroupId'] as String,
      version: json['Version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactId = this.artifactId;
    final groupId = this.groupId;
    final version = this.version;
    return {
      'ArtifactId': artifactId,
      'GroupId': groupId,
      'Version': version,
    };
  }
}

enum MetricsLevel {
  application,
  task,
  operator,
  parallelism,
}

extension MetricsLevelValueExtension on MetricsLevel {
  String toValue() {
    switch (this) {
      case MetricsLevel.application:
        return 'APPLICATION';
      case MetricsLevel.task:
        return 'TASK';
      case MetricsLevel.operator:
        return 'OPERATOR';
      case MetricsLevel.parallelism:
        return 'PARALLELISM';
    }
  }
}

extension MetricsLevelFromString on String {
  MetricsLevel toMetricsLevel() {
    switch (this) {
      case 'APPLICATION':
        return MetricsLevel.application;
      case 'TASK':
        return MetricsLevel.task;
      case 'OPERATOR':
        return MetricsLevel.operator;
      case 'PARALLELISM':
        return MetricsLevel.parallelism;
    }
    throw Exception('$this is not known in enum MetricsLevel');
  }
}

/// Describes configuration parameters for Amazon CloudWatch logging for an
/// application. For more information about CloudWatch logging, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html">Monitoring</a>.
class MonitoringConfiguration {
  /// Describes whether to use the default CloudWatch logging configuration for an
  /// application. You must set this property to <code>CUSTOM</code> in order to
  /// set the <code>LogLevel</code> or <code>MetricsLevel</code> parameters.
  final ConfigurationType configurationType;

  /// Describes the verbosity of the CloudWatch Logs for an application.
  final LogLevel? logLevel;

  /// Describes the granularity of the CloudWatch Logs for an application. The
  /// <code>Parallelism</code> level is not recommended for applications with a
  /// Parallelism over 64 due to excessive costs.
  final MetricsLevel? metricsLevel;

  MonitoringConfiguration({
    required this.configurationType,
    this.logLevel,
    this.metricsLevel,
  });

  Map<String, dynamic> toJson() {
    final configurationType = this.configurationType;
    final logLevel = this.logLevel;
    final metricsLevel = this.metricsLevel;
    return {
      'ConfigurationType': configurationType.toValue(),
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
      if (metricsLevel != null) 'MetricsLevel': metricsLevel.toValue(),
    };
  }
}

/// Describes configuration parameters for CloudWatch logging for an
/// application.
class MonitoringConfigurationDescription {
  /// Describes whether to use the default CloudWatch logging configuration for an
  /// application.
  final ConfigurationType? configurationType;

  /// Describes the verbosity of the CloudWatch Logs for an application.
  final LogLevel? logLevel;

  /// Describes the granularity of the CloudWatch Logs for an application.
  final MetricsLevel? metricsLevel;

  MonitoringConfigurationDescription({
    this.configurationType,
    this.logLevel,
    this.metricsLevel,
  });

  factory MonitoringConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return MonitoringConfigurationDescription(
      configurationType:
          (json['ConfigurationType'] as String?)?.toConfigurationType(),
      logLevel: (json['LogLevel'] as String?)?.toLogLevel(),
      metricsLevel: (json['MetricsLevel'] as String?)?.toMetricsLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationType = this.configurationType;
    final logLevel = this.logLevel;
    final metricsLevel = this.metricsLevel;
    return {
      if (configurationType != null)
        'ConfigurationType': configurationType.toValue(),
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
      if (metricsLevel != null) 'MetricsLevel': metricsLevel.toValue(),
    };
  }
}

/// Describes updates to configuration parameters for Amazon CloudWatch logging
/// for an application.
class MonitoringConfigurationUpdate {
  /// Describes updates to whether to use the default CloudWatch logging
  /// configuration for an application. You must set this property to
  /// <code>CUSTOM</code> in order to set the <code>LogLevel</code> or
  /// <code>MetricsLevel</code> parameters.
  final ConfigurationType? configurationTypeUpdate;

  /// Describes updates to the verbosity of the CloudWatch Logs for an
  /// application.
  final LogLevel? logLevelUpdate;

  /// Describes updates to the granularity of the CloudWatch Logs for an
  /// application. The <code>Parallelism</code> level is not recommended for
  /// applications with a Parallelism over 64 due to excessive costs.
  final MetricsLevel? metricsLevelUpdate;

  MonitoringConfigurationUpdate({
    this.configurationTypeUpdate,
    this.logLevelUpdate,
    this.metricsLevelUpdate,
  });

  Map<String, dynamic> toJson() {
    final configurationTypeUpdate = this.configurationTypeUpdate;
    final logLevelUpdate = this.logLevelUpdate;
    final metricsLevelUpdate = this.metricsLevelUpdate;
    return {
      if (configurationTypeUpdate != null)
        'ConfigurationTypeUpdate': configurationTypeUpdate.toValue(),
      if (logLevelUpdate != null) 'LogLevelUpdate': logLevelUpdate.toValue(),
      if (metricsLevelUpdate != null)
        'MetricsLevelUpdate': metricsLevelUpdate.toValue(),
    };
  }
}

/// Describes a SQL-based Kinesis Data Analytics application's output
/// configuration, in which you identify an in-application stream and a
/// destination where you want the in-application stream data to be written. The
/// destination can be a Kinesis data stream or a Kinesis Data Firehose delivery
/// stream.
/// <p/>
class Output {
  /// Describes the data format when records are written to the destination.
  final DestinationSchema destinationSchema;

  /// The name of the in-application stream.
  final String name;

  /// Identifies a Kinesis Data Firehose delivery stream as the destination.
  final KinesisFirehoseOutput? kinesisFirehoseOutput;

  /// Identifies a Kinesis data stream as the destination.
  final KinesisStreamsOutput? kinesisStreamsOutput;

  /// Identifies an Amazon Lambda function as the destination.
  final LambdaOutput? lambdaOutput;

  Output({
    required this.destinationSchema,
    required this.name,
    this.kinesisFirehoseOutput,
    this.kinesisStreamsOutput,
    this.lambdaOutput,
  });

  Map<String, dynamic> toJson() {
    final destinationSchema = this.destinationSchema;
    final name = this.name;
    final kinesisFirehoseOutput = this.kinesisFirehoseOutput;
    final kinesisStreamsOutput = this.kinesisStreamsOutput;
    final lambdaOutput = this.lambdaOutput;
    return {
      'DestinationSchema': destinationSchema,
      'Name': name,
      if (kinesisFirehoseOutput != null)
        'KinesisFirehoseOutput': kinesisFirehoseOutput,
      if (kinesisStreamsOutput != null)
        'KinesisStreamsOutput': kinesisStreamsOutput,
      if (lambdaOutput != null) 'LambdaOutput': lambdaOutput,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the
/// application output configuration, which includes the in-application stream
/// name and the destination where the stream data is written. The destination
/// can be a Kinesis data stream or a Kinesis Data Firehose delivery stream.
class OutputDescription {
  /// The data format used for writing data to the destination.
  final DestinationSchema? destinationSchema;

  /// Describes the Kinesis Data Firehose delivery stream that is configured as
  /// the destination where output is written.
  final KinesisFirehoseOutputDescription? kinesisFirehoseOutputDescription;

  /// Describes the Kinesis data stream that is configured as the destination
  /// where output is written.
  final KinesisStreamsOutputDescription? kinesisStreamsOutputDescription;

  /// Describes the Lambda function that is configured as the destination where
  /// output is written.
  final LambdaOutputDescription? lambdaOutputDescription;

  /// The name of the in-application stream that is configured as output.
  final String? name;

  /// A unique identifier for the output configuration.
  final String? outputId;

  OutputDescription({
    this.destinationSchema,
    this.kinesisFirehoseOutputDescription,
    this.kinesisStreamsOutputDescription,
    this.lambdaOutputDescription,
    this.name,
    this.outputId,
  });

  factory OutputDescription.fromJson(Map<String, dynamic> json) {
    return OutputDescription(
      destinationSchema: json['DestinationSchema'] != null
          ? DestinationSchema.fromJson(
              json['DestinationSchema'] as Map<String, dynamic>)
          : null,
      kinesisFirehoseOutputDescription:
          json['KinesisFirehoseOutputDescription'] != null
              ? KinesisFirehoseOutputDescription.fromJson(
                  json['KinesisFirehoseOutputDescription']
                      as Map<String, dynamic>)
              : null,
      kinesisStreamsOutputDescription:
          json['KinesisStreamsOutputDescription'] != null
              ? KinesisStreamsOutputDescription.fromJson(
                  json['KinesisStreamsOutputDescription']
                      as Map<String, dynamic>)
              : null,
      lambdaOutputDescription: json['LambdaOutputDescription'] != null
          ? LambdaOutputDescription.fromJson(
              json['LambdaOutputDescription'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      outputId: json['OutputId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationSchema = this.destinationSchema;
    final kinesisFirehoseOutputDescription =
        this.kinesisFirehoseOutputDescription;
    final kinesisStreamsOutputDescription =
        this.kinesisStreamsOutputDescription;
    final lambdaOutputDescription = this.lambdaOutputDescription;
    final name = this.name;
    final outputId = this.outputId;
    return {
      if (destinationSchema != null) 'DestinationSchema': destinationSchema,
      if (kinesisFirehoseOutputDescription != null)
        'KinesisFirehoseOutputDescription': kinesisFirehoseOutputDescription,
      if (kinesisStreamsOutputDescription != null)
        'KinesisStreamsOutputDescription': kinesisStreamsOutputDescription,
      if (lambdaOutputDescription != null)
        'LambdaOutputDescription': lambdaOutputDescription,
      if (name != null) 'Name': name,
      if (outputId != null) 'OutputId': outputId,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes updates to the
/// output configuration identified by the <code>OutputId</code>.
class OutputUpdate {
  /// Identifies the specific output configuration that you want to update.
  final String outputId;

  /// Describes the data format when records are written to the destination.
  final DestinationSchema? destinationSchemaUpdate;

  /// Describes a Kinesis Data Firehose delivery stream as the destination for the
  /// output.
  final KinesisFirehoseOutputUpdate? kinesisFirehoseOutputUpdate;

  /// Describes a Kinesis data stream as the destination for the output.
  final KinesisStreamsOutputUpdate? kinesisStreamsOutputUpdate;

  /// Describes an Amazon Lambda function as the destination for the output.
  final LambdaOutputUpdate? lambdaOutputUpdate;

  /// If you want to specify a different in-application stream for this output
  /// configuration, use this field to specify the new in-application stream name.
  final String? nameUpdate;

  OutputUpdate({
    required this.outputId,
    this.destinationSchemaUpdate,
    this.kinesisFirehoseOutputUpdate,
    this.kinesisStreamsOutputUpdate,
    this.lambdaOutputUpdate,
    this.nameUpdate,
  });

  Map<String, dynamic> toJson() {
    final outputId = this.outputId;
    final destinationSchemaUpdate = this.destinationSchemaUpdate;
    final kinesisFirehoseOutputUpdate = this.kinesisFirehoseOutputUpdate;
    final kinesisStreamsOutputUpdate = this.kinesisStreamsOutputUpdate;
    final lambdaOutputUpdate = this.lambdaOutputUpdate;
    final nameUpdate = this.nameUpdate;
    return {
      'OutputId': outputId,
      if (destinationSchemaUpdate != null)
        'DestinationSchemaUpdate': destinationSchemaUpdate,
      if (kinesisFirehoseOutputUpdate != null)
        'KinesisFirehoseOutputUpdate': kinesisFirehoseOutputUpdate,
      if (kinesisStreamsOutputUpdate != null)
        'KinesisStreamsOutputUpdate': kinesisStreamsOutputUpdate,
      if (lambdaOutputUpdate != null) 'LambdaOutputUpdate': lambdaOutputUpdate,
      if (nameUpdate != null) 'NameUpdate': nameUpdate,
    };
  }
}

/// Describes parameters for how a Managed Service for Apache Flink application
/// executes multiple tasks simultaneously. For more information about
/// parallelism, see <a
/// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/dev/parallel.html">Parallel
/// Execution</a> in the <a
/// href="https://nightlies.apache.org/flink/flink-docs-release-1.18/">Apache
/// Flink Documentation</a>.
class ParallelismConfiguration {
  /// Describes whether the application uses the default parallelism for the
  /// Managed Service for Apache Flink service. You must set this property to
  /// <code>CUSTOM</code> in order to change your application's
  /// <code>AutoScalingEnabled</code>, <code>Parallelism</code>, or
  /// <code>ParallelismPerKPU</code> properties.
  final ConfigurationType configurationType;

  /// Describes whether the Managed Service for Apache Flink service can increase
  /// the parallelism of the application in response to increased throughput.
  final bool? autoScalingEnabled;

  /// Describes the initial number of parallel tasks that a Managed Service for
  /// Apache Flink application can perform. If <code>AutoScalingEnabled</code> is
  /// set to True, Managed Service for Apache Flink increases the
  /// <code>CurrentParallelism</code> value in response to application load. The
  /// service can increase the <code>CurrentParallelism</code> value up to the
  /// maximum parallelism, which is <code>ParalellismPerKPU</code> times the
  /// maximum KPUs for the application. The maximum KPUs for an application is 32
  /// by default, and can be increased by requesting a limit increase. If
  /// application load is reduced, the service can reduce the
  /// <code>CurrentParallelism</code> value down to the <code>Parallelism</code>
  /// setting.
  final int? parallelism;

  /// Describes the number of parallel tasks that a Managed Service for Apache
  /// Flink application can perform per Kinesis Processing Unit (KPU) used by the
  /// application. For more information about KPUs, see <a
  /// href="http://aws.amazon.com/kinesis/data-analytics/pricing/">Amazon Managed
  /// Service for Apache Flink Pricing</a>.
  final int? parallelismPerKPU;

  ParallelismConfiguration({
    required this.configurationType,
    this.autoScalingEnabled,
    this.parallelism,
    this.parallelismPerKPU,
  });

  Map<String, dynamic> toJson() {
    final configurationType = this.configurationType;
    final autoScalingEnabled = this.autoScalingEnabled;
    final parallelism = this.parallelism;
    final parallelismPerKPU = this.parallelismPerKPU;
    return {
      'ConfigurationType': configurationType.toValue(),
      if (autoScalingEnabled != null) 'AutoScalingEnabled': autoScalingEnabled,
      if (parallelism != null) 'Parallelism': parallelism,
      if (parallelismPerKPU != null) 'ParallelismPerKPU': parallelismPerKPU,
    };
  }
}

/// Describes parameters for how a Managed Service for Apache Flink application
/// executes multiple tasks simultaneously.
class ParallelismConfigurationDescription {
  /// Describes whether the Managed Service for Apache Flink service can increase
  /// the parallelism of the application in response to increased throughput.
  final bool? autoScalingEnabled;

  /// Describes whether the application uses the default parallelism for the
  /// Managed Service for Apache Flink service.
  final ConfigurationType? configurationType;

  /// Describes the current number of parallel tasks that a Managed Service for
  /// Apache Flink application can perform. If <code>AutoScalingEnabled</code> is
  /// set to True, Managed Service for Apache Flink can increase this value in
  /// response to application load. The service can increase this value up to the
  /// maximum parallelism, which is <code>ParalellismPerKPU</code> times the
  /// maximum KPUs for the application. The maximum KPUs for an application is 32
  /// by default, and can be increased by requesting a limit increase. If
  /// application load is reduced, the service can reduce the
  /// <code>CurrentParallelism</code> value down to the <code>Parallelism</code>
  /// setting.
  final int? currentParallelism;

  /// Describes the initial number of parallel tasks that a Managed Service for
  /// Apache Flink application can perform. If <code>AutoScalingEnabled</code> is
  /// set to True, then Managed Service for Apache Flink can increase the
  /// <code>CurrentParallelism</code> value in response to application load. The
  /// service can increase <code>CurrentParallelism</code> up to the maximum
  /// parallelism, which is <code>ParalellismPerKPU</code> times the maximum KPUs
  /// for the application. The maximum KPUs for an application is 32 by default,
  /// and can be increased by requesting a limit increase. If application load is
  /// reduced, the service can reduce the <code>CurrentParallelism</code> value
  /// down to the <code>Parallelism</code> setting.
  final int? parallelism;

  /// Describes the number of parallel tasks that a Managed Service for Apache
  /// Flink application can perform per Kinesis Processing Unit (KPU) used by the
  /// application.
  final int? parallelismPerKPU;

  ParallelismConfigurationDescription({
    this.autoScalingEnabled,
    this.configurationType,
    this.currentParallelism,
    this.parallelism,
    this.parallelismPerKPU,
  });

  factory ParallelismConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ParallelismConfigurationDescription(
      autoScalingEnabled: json['AutoScalingEnabled'] as bool?,
      configurationType:
          (json['ConfigurationType'] as String?)?.toConfigurationType(),
      currentParallelism: json['CurrentParallelism'] as int?,
      parallelism: json['Parallelism'] as int?,
      parallelismPerKPU: json['ParallelismPerKPU'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoScalingEnabled = this.autoScalingEnabled;
    final configurationType = this.configurationType;
    final currentParallelism = this.currentParallelism;
    final parallelism = this.parallelism;
    final parallelismPerKPU = this.parallelismPerKPU;
    return {
      if (autoScalingEnabled != null) 'AutoScalingEnabled': autoScalingEnabled,
      if (configurationType != null)
        'ConfigurationType': configurationType.toValue(),
      if (currentParallelism != null) 'CurrentParallelism': currentParallelism,
      if (parallelism != null) 'Parallelism': parallelism,
      if (parallelismPerKPU != null) 'ParallelismPerKPU': parallelismPerKPU,
    };
  }
}

/// Describes updates to parameters for how an application executes multiple
/// tasks simultaneously.
class ParallelismConfigurationUpdate {
  /// Describes updates to whether the Managed Service for Apache Flink service
  /// can increase the parallelism of a Managed Service for Apache Flink
  /// application in response to increased throughput.
  final bool? autoScalingEnabledUpdate;

  /// Describes updates to whether the application uses the default parallelism
  /// for the Managed Service for Apache Flink service, or if a custom parallelism
  /// is used. You must set this property to <code>CUSTOM</code> in order to
  /// change your application's <code>AutoScalingEnabled</code>,
  /// <code>Parallelism</code>, or <code>ParallelismPerKPU</code> properties.
  final ConfigurationType? configurationTypeUpdate;

  /// Describes updates to the number of parallel tasks an application can perform
  /// per Kinesis Processing Unit (KPU) used by the application.
  final int? parallelismPerKPUUpdate;

  /// Describes updates to the initial number of parallel tasks an application can
  /// perform. If <code>AutoScalingEnabled</code> is set to True, then Managed
  /// Service for Apache Flink can increase the <code>CurrentParallelism</code>
  /// value in response to application load. The service can increase
  /// <code>CurrentParallelism</code> up to the maximum parallelism, which is
  /// <code>ParalellismPerKPU</code> times the maximum KPUs for the application.
  /// The maximum KPUs for an application is 32 by default, and can be increased
  /// by requesting a limit increase. If application load is reduced, the service
  /// will reduce <code>CurrentParallelism</code> down to the
  /// <code>Parallelism</code> setting.
  final int? parallelismUpdate;

  ParallelismConfigurationUpdate({
    this.autoScalingEnabledUpdate,
    this.configurationTypeUpdate,
    this.parallelismPerKPUUpdate,
    this.parallelismUpdate,
  });

  Map<String, dynamic> toJson() {
    final autoScalingEnabledUpdate = this.autoScalingEnabledUpdate;
    final configurationTypeUpdate = this.configurationTypeUpdate;
    final parallelismPerKPUUpdate = this.parallelismPerKPUUpdate;
    final parallelismUpdate = this.parallelismUpdate;
    return {
      if (autoScalingEnabledUpdate != null)
        'AutoScalingEnabledUpdate': autoScalingEnabledUpdate,
      if (configurationTypeUpdate != null)
        'ConfigurationTypeUpdate': configurationTypeUpdate.toValue(),
      if (parallelismPerKPUUpdate != null)
        'ParallelismPerKPUUpdate': parallelismPerKPUUpdate,
      if (parallelismUpdate != null) 'ParallelismUpdate': parallelismUpdate,
    };
  }
}

/// Property key-value pairs passed into an application.
class PropertyGroup {
  /// Describes the key of an application execution property key-value pair.
  final String propertyGroupId;

  /// Describes the value of an application execution property key-value pair.
  final Map<String, String> propertyMap;

  PropertyGroup({
    required this.propertyGroupId,
    required this.propertyMap,
  });

  factory PropertyGroup.fromJson(Map<String, dynamic> json) {
    return PropertyGroup(
      propertyGroupId: json['PropertyGroupId'] as String,
      propertyMap: (json['PropertyMap'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final propertyGroupId = this.propertyGroupId;
    final propertyMap = this.propertyMap;
    return {
      'PropertyGroupId': propertyGroupId,
      'PropertyMap': propertyMap,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the mapping of
/// each data element in the streaming source to the corresponding column in the
/// in-application stream.
///
/// Also used to describe the format of the reference data source.
class RecordColumn {
  /// The name of the column that is created in the in-application input stream or
  /// reference table.
  final String name;

  /// The type of column created in the in-application input stream or reference
  /// table.
  final String sqlType;

  /// A reference to the data element in the streaming input or the reference data
  /// source.
  final String? mapping;

  RecordColumn({
    required this.name,
    required this.sqlType,
    this.mapping,
  });

  factory RecordColumn.fromJson(Map<String, dynamic> json) {
    return RecordColumn(
      name: json['Name'] as String,
      sqlType: json['SqlType'] as String,
      mapping: json['Mapping'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sqlType = this.sqlType;
    final mapping = this.mapping;
    return {
      'Name': name,
      'SqlType': sqlType,
      if (mapping != null) 'Mapping': mapping,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the record
/// format and relevant mapping information that should be applied to schematize
/// the records on the stream.
class RecordFormat {
  /// The type of record format.
  final RecordFormatType recordFormatType;

  /// When you configure application input at the time of creating or updating an
  /// application, provides additional mapping information specific to the record
  /// format (such as JSON, CSV, or record fields delimited by some delimiter) on
  /// the streaming source.
  final MappingParameters? mappingParameters;

  RecordFormat({
    required this.recordFormatType,
    this.mappingParameters,
  });

  factory RecordFormat.fromJson(Map<String, dynamic> json) {
    return RecordFormat(
      recordFormatType:
          (json['RecordFormatType'] as String).toRecordFormatType(),
      mappingParameters: json['MappingParameters'] != null
          ? MappingParameters.fromJson(
              json['MappingParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordFormatType = this.recordFormatType;
    final mappingParameters = this.mappingParameters;
    return {
      'RecordFormatType': recordFormatType.toValue(),
      if (mappingParameters != null) 'MappingParameters': mappingParameters,
    };
  }
}

enum RecordFormatType {
  json,
  csv,
}

extension RecordFormatTypeValueExtension on RecordFormatType {
  String toValue() {
    switch (this) {
      case RecordFormatType.json:
        return 'JSON';
      case RecordFormatType.csv:
        return 'CSV';
    }
  }
}

extension RecordFormatTypeFromString on String {
  RecordFormatType toRecordFormatType() {
    switch (this) {
      case 'JSON':
        return RecordFormatType.json;
      case 'CSV':
        return RecordFormatType.csv;
    }
    throw Exception('$this is not known in enum RecordFormatType');
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the reference
/// data source by providing the source information (Amazon S3 bucket name and
/// object key name), the resulting in-application table name that is created,
/// and the necessary schema to map the data elements in the Amazon S3 object to
/// the in-application table.
class ReferenceDataSource {
  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  final SourceSchema referenceSchema;

  /// The name of the in-application table to create.
  final String tableName;

  /// Identifies the S3 bucket and object that contains the reference data. A
  /// SQL-based Kinesis Data Analytics application loads reference data only once.
  /// If the data changes, you call the <a>UpdateApplication</a> operation to
  /// trigger reloading of data into your application.
  final S3ReferenceDataSource? s3ReferenceDataSource;

  ReferenceDataSource({
    required this.referenceSchema,
    required this.tableName,
    this.s3ReferenceDataSource,
  });

  Map<String, dynamic> toJson() {
    final referenceSchema = this.referenceSchema;
    final tableName = this.tableName;
    final s3ReferenceDataSource = this.s3ReferenceDataSource;
    return {
      'ReferenceSchema': referenceSchema,
      'TableName': tableName,
      if (s3ReferenceDataSource != null)
        'S3ReferenceDataSource': s3ReferenceDataSource,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the reference
/// data source configured for an application.
class ReferenceDataSourceDescription {
  /// The ID of the reference data source. This is the ID that Kinesis Data
  /// Analytics assigns when you add the reference data source to your application
  /// using the <a>CreateApplication</a> or <a>UpdateApplication</a> operation.
  final String referenceId;

  /// Provides the Amazon S3 bucket name, the object key name that contains the
  /// reference data.
  final S3ReferenceDataSourceDescription s3ReferenceDataSourceDescription;

  /// The in-application table name created by the specific reference data source
  /// configuration.
  final String tableName;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  final SourceSchema? referenceSchema;

  ReferenceDataSourceDescription({
    required this.referenceId,
    required this.s3ReferenceDataSourceDescription,
    required this.tableName,
    this.referenceSchema,
  });

  factory ReferenceDataSourceDescription.fromJson(Map<String, dynamic> json) {
    return ReferenceDataSourceDescription(
      referenceId: json['ReferenceId'] as String,
      s3ReferenceDataSourceDescription:
          S3ReferenceDataSourceDescription.fromJson(
              json['S3ReferenceDataSourceDescription'] as Map<String, dynamic>),
      tableName: json['TableName'] as String,
      referenceSchema: json['ReferenceSchema'] != null
          ? SourceSchema.fromJson(
              json['ReferenceSchema'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final referenceId = this.referenceId;
    final s3ReferenceDataSourceDescription =
        this.s3ReferenceDataSourceDescription;
    final tableName = this.tableName;
    final referenceSchema = this.referenceSchema;
    return {
      'ReferenceId': referenceId,
      'S3ReferenceDataSourceDescription': s3ReferenceDataSourceDescription,
      'TableName': tableName,
      if (referenceSchema != null) 'ReferenceSchema': referenceSchema,
    };
  }
}

/// When you update a reference data source configuration for a SQL-based
/// Kinesis Data Analytics application, this object provides all the updated
/// values (such as the source bucket name and object key name), the
/// in-application table name that is created, and updated mapping information
/// that maps the data in the Amazon S3 object to the in-application reference
/// table that is created.
class ReferenceDataSourceUpdate {
  /// The ID of the reference data source that is being updated. You can use the
  /// <a>DescribeApplication</a> operation to get this value.
  final String referenceId;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  final SourceSchema? referenceSchemaUpdate;

  /// Describes the S3 bucket name, object key name, and IAM role that Kinesis
  /// Data Analytics can assume to read the Amazon S3 object on your behalf and
  /// populate the in-application reference table.
  final S3ReferenceDataSourceUpdate? s3ReferenceDataSourceUpdate;

  /// The in-application table name that is created by this update.
  final String? tableNameUpdate;

  ReferenceDataSourceUpdate({
    required this.referenceId,
    this.referenceSchemaUpdate,
    this.s3ReferenceDataSourceUpdate,
    this.tableNameUpdate,
  });

  Map<String, dynamic> toJson() {
    final referenceId = this.referenceId;
    final referenceSchemaUpdate = this.referenceSchemaUpdate;
    final s3ReferenceDataSourceUpdate = this.s3ReferenceDataSourceUpdate;
    final tableNameUpdate = this.tableNameUpdate;
    return {
      'ReferenceId': referenceId,
      if (referenceSchemaUpdate != null)
        'ReferenceSchemaUpdate': referenceSchemaUpdate,
      if (s3ReferenceDataSourceUpdate != null)
        'S3ReferenceDataSourceUpdate': s3ReferenceDataSourceUpdate,
      if (tableNameUpdate != null) 'TableNameUpdate': tableNameUpdate,
    };
  }
}

class RollbackApplicationResponse {
  final ApplicationDetail applicationDetail;

  RollbackApplicationResponse({
    required this.applicationDetail,
  });

  factory RollbackApplicationResponse.fromJson(Map<String, dynamic> json) {
    return RollbackApplicationResponse(
      applicationDetail: ApplicationDetail.fromJson(
          json['ApplicationDetail'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationDetail = this.applicationDetail;
    return {
      'ApplicationDetail': applicationDetail,
    };
  }
}

/// Describes the starting parameters for an Managed Service for Apache Flink
/// application.
class RunConfiguration {
  /// Describes the restore behavior of a restarting application.
  final ApplicationRestoreConfiguration? applicationRestoreConfiguration;

  /// Describes the starting parameters for a Managed Service for Apache Flink
  /// application.
  final FlinkRunConfiguration? flinkRunConfiguration;

  /// Describes the starting parameters for a SQL-based Kinesis Data Analytics
  /// application application.
  final List<SqlRunConfiguration>? sqlRunConfigurations;

  RunConfiguration({
    this.applicationRestoreConfiguration,
    this.flinkRunConfiguration,
    this.sqlRunConfigurations,
  });

  Map<String, dynamic> toJson() {
    final applicationRestoreConfiguration =
        this.applicationRestoreConfiguration;
    final flinkRunConfiguration = this.flinkRunConfiguration;
    final sqlRunConfigurations = this.sqlRunConfigurations;
    return {
      if (applicationRestoreConfiguration != null)
        'ApplicationRestoreConfiguration': applicationRestoreConfiguration,
      if (flinkRunConfiguration != null)
        'FlinkRunConfiguration': flinkRunConfiguration,
      if (sqlRunConfigurations != null)
        'SqlRunConfigurations': sqlRunConfigurations,
    };
  }
}

/// Describes the starting properties for a Managed Service for Apache Flink
/// application.
class RunConfigurationDescription {
  /// Describes the restore behavior of a restarting application.
  final ApplicationRestoreConfiguration?
      applicationRestoreConfigurationDescription;
  final FlinkRunConfiguration? flinkRunConfigurationDescription;

  RunConfigurationDescription({
    this.applicationRestoreConfigurationDescription,
    this.flinkRunConfigurationDescription,
  });

  factory RunConfigurationDescription.fromJson(Map<String, dynamic> json) {
    return RunConfigurationDescription(
      applicationRestoreConfigurationDescription:
          json['ApplicationRestoreConfigurationDescription'] != null
              ? ApplicationRestoreConfiguration.fromJson(
                  json['ApplicationRestoreConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      flinkRunConfigurationDescription:
          json['FlinkRunConfigurationDescription'] != null
              ? FlinkRunConfiguration.fromJson(
                  json['FlinkRunConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationRestoreConfigurationDescription =
        this.applicationRestoreConfigurationDescription;
    final flinkRunConfigurationDescription =
        this.flinkRunConfigurationDescription;
    return {
      if (applicationRestoreConfigurationDescription != null)
        'ApplicationRestoreConfigurationDescription':
            applicationRestoreConfigurationDescription,
      if (flinkRunConfigurationDescription != null)
        'FlinkRunConfigurationDescription': flinkRunConfigurationDescription,
    };
  }
}

/// Describes the updates to the starting parameters for a Managed Service for
/// Apache Flink application.
class RunConfigurationUpdate {
  /// Describes updates to the restore behavior of a restarting application.
  final ApplicationRestoreConfiguration? applicationRestoreConfiguration;

  /// Describes the starting parameters for a Managed Service for Apache Flink
  /// application.
  final FlinkRunConfiguration? flinkRunConfiguration;

  RunConfigurationUpdate({
    this.applicationRestoreConfiguration,
    this.flinkRunConfiguration,
  });

  Map<String, dynamic> toJson() {
    final applicationRestoreConfiguration =
        this.applicationRestoreConfiguration;
    final flinkRunConfiguration = this.flinkRunConfiguration;
    return {
      if (applicationRestoreConfiguration != null)
        'ApplicationRestoreConfiguration': applicationRestoreConfiguration,
      if (flinkRunConfiguration != null)
        'FlinkRunConfiguration': flinkRunConfiguration,
    };
  }
}

enum RuntimeEnvironment {
  sql_1_0,
  flink_1_6,
  flink_1_8,
  zeppelinFlink_1_0,
  flink_1_11,
  flink_1_13,
  zeppelinFlink_2_0,
  flink_1_15,
  zeppelinFlink_3_0,
  flink_1_18,
}

extension RuntimeEnvironmentValueExtension on RuntimeEnvironment {
  String toValue() {
    switch (this) {
      case RuntimeEnvironment.sql_1_0:
        return 'SQL-1_0';
      case RuntimeEnvironment.flink_1_6:
        return 'FLINK-1_6';
      case RuntimeEnvironment.flink_1_8:
        return 'FLINK-1_8';
      case RuntimeEnvironment.zeppelinFlink_1_0:
        return 'ZEPPELIN-FLINK-1_0';
      case RuntimeEnvironment.flink_1_11:
        return 'FLINK-1_11';
      case RuntimeEnvironment.flink_1_13:
        return 'FLINK-1_13';
      case RuntimeEnvironment.zeppelinFlink_2_0:
        return 'ZEPPELIN-FLINK-2_0';
      case RuntimeEnvironment.flink_1_15:
        return 'FLINK-1_15';
      case RuntimeEnvironment.zeppelinFlink_3_0:
        return 'ZEPPELIN-FLINK-3_0';
      case RuntimeEnvironment.flink_1_18:
        return 'FLINK-1_18';
    }
  }
}

extension RuntimeEnvironmentFromString on String {
  RuntimeEnvironment toRuntimeEnvironment() {
    switch (this) {
      case 'SQL-1_0':
        return RuntimeEnvironment.sql_1_0;
      case 'FLINK-1_6':
        return RuntimeEnvironment.flink_1_6;
      case 'FLINK-1_8':
        return RuntimeEnvironment.flink_1_8;
      case 'ZEPPELIN-FLINK-1_0':
        return RuntimeEnvironment.zeppelinFlink_1_0;
      case 'FLINK-1_11':
        return RuntimeEnvironment.flink_1_11;
      case 'FLINK-1_13':
        return RuntimeEnvironment.flink_1_13;
      case 'ZEPPELIN-FLINK-2_0':
        return RuntimeEnvironment.zeppelinFlink_2_0;
      case 'FLINK-1_15':
        return RuntimeEnvironment.flink_1_15;
      case 'ZEPPELIN-FLINK-3_0':
        return RuntimeEnvironment.zeppelinFlink_3_0;
      case 'FLINK-1_18':
        return RuntimeEnvironment.flink_1_18;
    }
    throw Exception('$this is not known in enum RuntimeEnvironment');
  }
}

/// Describes the location of an application's code stored in an S3 bucket.
class S3ApplicationCodeLocationDescription {
  /// The Amazon Resource Name (ARN) for the S3 bucket containing the application
  /// code.
  final String bucketARN;

  /// The file key for the object containing the application code.
  final String fileKey;

  /// The version of the object containing the application code.
  final String? objectVersion;

  S3ApplicationCodeLocationDescription({
    required this.bucketARN,
    required this.fileKey,
    this.objectVersion,
  });

  factory S3ApplicationCodeLocationDescription.fromJson(
      Map<String, dynamic> json) {
    return S3ApplicationCodeLocationDescription(
      bucketARN: json['BucketARN'] as String,
      fileKey: json['FileKey'] as String,
      objectVersion: json['ObjectVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    final objectVersion = this.objectVersion;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
      if (objectVersion != null) 'ObjectVersion': objectVersion,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, provides a description
/// of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the
/// S3 bucket and the name of the Amazon S3 object that contains the data.
class S3Configuration {
  /// The ARN of the S3 bucket that contains the data.
  final String bucketARN;

  /// The name of the object that contains the data.
  final String fileKey;

  S3Configuration({
    required this.bucketARN,
    required this.fileKey,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
    };
  }
}

/// The S3 bucket that holds the application information.
class S3ContentBaseLocation {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketARN;

  /// The base path for the S3 bucket.
  final String? basePath;

  S3ContentBaseLocation({
    required this.bucketARN,
    this.basePath,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final basePath = this.basePath;
    return {
      'BucketARN': bucketARN,
      if (basePath != null) 'BasePath': basePath,
    };
  }
}

/// The description of the S3 base location that holds the application.
class S3ContentBaseLocationDescription {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketARN;

  /// The base path for the S3 bucket.
  final String? basePath;

  S3ContentBaseLocationDescription({
    required this.bucketARN,
    this.basePath,
  });

  factory S3ContentBaseLocationDescription.fromJson(Map<String, dynamic> json) {
    return S3ContentBaseLocationDescription(
      bucketARN: json['BucketARN'] as String,
      basePath: json['BasePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final basePath = this.basePath;
    return {
      'BucketARN': bucketARN,
      if (basePath != null) 'BasePath': basePath,
    };
  }
}

/// The information required to update the S3 base location that holds the
/// application.
class S3ContentBaseLocationUpdate {
  /// The updated S3 bucket path.
  final String? basePathUpdate;

  /// The updated Amazon Resource Name (ARN) of the S3 bucket.
  final String? bucketARNUpdate;

  S3ContentBaseLocationUpdate({
    this.basePathUpdate,
    this.bucketARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final basePathUpdate = this.basePathUpdate;
    final bucketARNUpdate = this.bucketARNUpdate;
    return {
      if (basePathUpdate != null) 'BasePathUpdate': basePathUpdate,
      if (bucketARNUpdate != null) 'BucketARNUpdate': bucketARNUpdate,
    };
  }
}

/// For a Managed Service for Apache Flink application provides a description of
/// an Amazon S3 object, including the Amazon Resource Name (ARN) of the S3
/// bucket, the name of the Amazon S3 object that contains the data, and the
/// version number of the Amazon S3 object that contains the data.
class S3ContentLocation {
  /// The Amazon Resource Name (ARN) for the S3 bucket containing the application
  /// code.
  final String bucketARN;

  /// The file key for the object containing the application code.
  final String fileKey;

  /// The version of the object containing the application code.
  final String? objectVersion;

  S3ContentLocation({
    required this.bucketARN,
    required this.fileKey,
    this.objectVersion,
  });

  factory S3ContentLocation.fromJson(Map<String, dynamic> json) {
    return S3ContentLocation(
      bucketARN: json['BucketARN'] as String,
      fileKey: json['FileKey'] as String,
      objectVersion: json['ObjectVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    final objectVersion = this.objectVersion;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
      if (objectVersion != null) 'ObjectVersion': objectVersion,
    };
  }
}

/// Describes an update for the Amazon S3 code content location for an
/// application.
class S3ContentLocationUpdate {
  /// The new Amazon Resource Name (ARN) for the S3 bucket containing the
  /// application code.
  final String? bucketARNUpdate;

  /// The new file key for the object containing the application code.
  final String? fileKeyUpdate;

  /// The new version of the object containing the application code.
  final String? objectVersionUpdate;

  S3ContentLocationUpdate({
    this.bucketARNUpdate,
    this.fileKeyUpdate,
    this.objectVersionUpdate,
  });

  Map<String, dynamic> toJson() {
    final bucketARNUpdate = this.bucketARNUpdate;
    final fileKeyUpdate = this.fileKeyUpdate;
    final objectVersionUpdate = this.objectVersionUpdate;
    return {
      if (bucketARNUpdate != null) 'BucketARNUpdate': bucketARNUpdate,
      if (fileKeyUpdate != null) 'FileKeyUpdate': fileKeyUpdate,
      if (objectVersionUpdate != null)
        'ObjectVersionUpdate': objectVersionUpdate,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, identifies the Amazon S3
/// bucket and object that contains the reference data.
///
/// A SQL-based Kinesis Data Analytics application loads reference data only
/// once. If the data changes, you call the <a>UpdateApplication</a> operation
/// to trigger reloading of data into your application.
class S3ReferenceDataSource {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String? bucketARN;

  /// The object key name containing the reference data.
  final String? fileKey;

  S3ReferenceDataSource({
    this.bucketARN,
    this.fileKey,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    return {
      if (bucketARN != null) 'BucketARN': bucketARN,
      if (fileKey != null) 'FileKey': fileKey,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, provides the bucket name
/// and object key name that stores the reference data.
class S3ReferenceDataSourceDescription {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketARN;

  /// Amazon S3 object key name.
  final String fileKey;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to read the
  /// Amazon S3 object on your behalf to populate the in-application reference
  /// table.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  final String? referenceRoleARN;

  S3ReferenceDataSourceDescription({
    required this.bucketARN,
    required this.fileKey,
    this.referenceRoleARN,
  });

  factory S3ReferenceDataSourceDescription.fromJson(Map<String, dynamic> json) {
    return S3ReferenceDataSourceDescription(
      bucketARN: json['BucketARN'] as String,
      fileKey: json['FileKey'] as String,
      referenceRoleARN: json['ReferenceRoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    final referenceRoleARN = this.referenceRoleARN;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
      if (referenceRoleARN != null) 'ReferenceRoleARN': referenceRoleARN,
    };
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the Amazon S3
/// bucket name and object key name for an in-application reference table.
class S3ReferenceDataSourceUpdate {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String? bucketARNUpdate;

  /// The object key name.
  final String? fileKeyUpdate;

  S3ReferenceDataSourceUpdate({
    this.bucketARNUpdate,
    this.fileKeyUpdate,
  });

  Map<String, dynamic> toJson() {
    final bucketARNUpdate = this.bucketARNUpdate;
    final fileKeyUpdate = this.fileKeyUpdate;
    return {
      if (bucketARNUpdate != null) 'BucketARNUpdate': bucketARNUpdate,
      if (fileKeyUpdate != null) 'FileKeyUpdate': fileKeyUpdate,
    };
  }
}

/// Provides details about a snapshot of application state.
class SnapshotDetails {
  /// The current application version ID when the snapshot was created.
  final int applicationVersionId;

  /// The identifier for the application snapshot.
  final String snapshotName;

  /// The status of the application snapshot.
  final SnapshotStatus snapshotStatus;

  /// The Flink Runtime for the application snapshot.
  final RuntimeEnvironment? runtimeEnvironment;

  /// The timestamp of the application snapshot.
  final DateTime? snapshotCreationTimestamp;

  SnapshotDetails({
    required this.applicationVersionId,
    required this.snapshotName,
    required this.snapshotStatus,
    this.runtimeEnvironment,
    this.snapshotCreationTimestamp,
  });

  factory SnapshotDetails.fromJson(Map<String, dynamic> json) {
    return SnapshotDetails(
      applicationVersionId: json['ApplicationVersionId'] as int,
      snapshotName: json['SnapshotName'] as String,
      snapshotStatus: (json['SnapshotStatus'] as String).toSnapshotStatus(),
      runtimeEnvironment:
          (json['RuntimeEnvironment'] as String?)?.toRuntimeEnvironment(),
      snapshotCreationTimestamp:
          timeStampFromJson(json['SnapshotCreationTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersionId = this.applicationVersionId;
    final snapshotName = this.snapshotName;
    final snapshotStatus = this.snapshotStatus;
    final runtimeEnvironment = this.runtimeEnvironment;
    final snapshotCreationTimestamp = this.snapshotCreationTimestamp;
    return {
      'ApplicationVersionId': applicationVersionId,
      'SnapshotName': snapshotName,
      'SnapshotStatus': snapshotStatus.toValue(),
      if (runtimeEnvironment != null)
        'RuntimeEnvironment': runtimeEnvironment.toValue(),
      if (snapshotCreationTimestamp != null)
        'SnapshotCreationTimestamp':
            unixTimestampToJson(snapshotCreationTimestamp),
    };
  }
}

enum SnapshotStatus {
  creating,
  ready,
  deleting,
  failed,
}

extension SnapshotStatusValueExtension on SnapshotStatus {
  String toValue() {
    switch (this) {
      case SnapshotStatus.creating:
        return 'CREATING';
      case SnapshotStatus.ready:
        return 'READY';
      case SnapshotStatus.deleting:
        return 'DELETING';
      case SnapshotStatus.failed:
        return 'FAILED';
    }
  }
}

extension SnapshotStatusFromString on String {
  SnapshotStatus toSnapshotStatus() {
    switch (this) {
      case 'CREATING':
        return SnapshotStatus.creating;
      case 'READY':
        return SnapshotStatus.ready;
      case 'DELETING':
        return SnapshotStatus.deleting;
      case 'FAILED':
        return SnapshotStatus.failed;
    }
    throw Exception('$this is not known in enum SnapshotStatus');
  }
}

/// For a SQL-based Kinesis Data Analytics application, describes the format of
/// the data in the streaming source, and how each data element maps to
/// corresponding columns created in the in-application stream.
class SourceSchema {
  /// A list of <code>RecordColumn</code> objects.
  final List<RecordColumn> recordColumns;

  /// Specifies the format of the records on the streaming source.
  final RecordFormat recordFormat;

  /// Specifies the encoding of the records in the streaming source. For example,
  /// UTF-8.
  final String? recordEncoding;

  SourceSchema({
    required this.recordColumns,
    required this.recordFormat,
    this.recordEncoding,
  });

  factory SourceSchema.fromJson(Map<String, dynamic> json) {
    return SourceSchema(
      recordColumns: (json['RecordColumns'] as List)
          .whereNotNull()
          .map((e) => RecordColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      recordFormat:
          RecordFormat.fromJson(json['RecordFormat'] as Map<String, dynamic>),
      recordEncoding: json['RecordEncoding'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordColumns = this.recordColumns;
    final recordFormat = this.recordFormat;
    final recordEncoding = this.recordEncoding;
    return {
      'RecordColumns': recordColumns,
      'RecordFormat': recordFormat,
      if (recordEncoding != null) 'RecordEncoding': recordEncoding,
    };
  }
}

/// Describes the inputs, outputs, and reference data sources for a SQL-based
/// Kinesis Data Analytics application.
class SqlApplicationConfiguration {
  /// The array of <a>Input</a> objects describing the input streams used by the
  /// application.
  final List<Input>? inputs;

  /// The array of <a>Output</a> objects describing the destination streams used
  /// by the application.
  final List<Output>? outputs;

  /// The array of <a>ReferenceDataSource</a> objects describing the reference
  /// data sources used by the application.
  final List<ReferenceDataSource>? referenceDataSources;

  SqlApplicationConfiguration({
    this.inputs,
    this.outputs,
    this.referenceDataSources,
  });

  Map<String, dynamic> toJson() {
    final inputs = this.inputs;
    final outputs = this.outputs;
    final referenceDataSources = this.referenceDataSources;
    return {
      if (inputs != null) 'Inputs': inputs,
      if (outputs != null) 'Outputs': outputs,
      if (referenceDataSources != null)
        'ReferenceDataSources': referenceDataSources,
    };
  }
}

/// Describes the inputs, outputs, and reference data sources for a SQL-based
/// Kinesis Data Analytics application.
class SqlApplicationConfigurationDescription {
  /// The array of <a>InputDescription</a> objects describing the input streams
  /// used by the application.
  final List<InputDescription>? inputDescriptions;

  /// The array of <a>OutputDescription</a> objects describing the destination
  /// streams used by the application.
  final List<OutputDescription>? outputDescriptions;

  /// The array of <a>ReferenceDataSourceDescription</a> objects describing the
  /// reference data sources used by the application.
  final List<ReferenceDataSourceDescription>? referenceDataSourceDescriptions;

  SqlApplicationConfigurationDescription({
    this.inputDescriptions,
    this.outputDescriptions,
    this.referenceDataSourceDescriptions,
  });

  factory SqlApplicationConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return SqlApplicationConfigurationDescription(
      inputDescriptions: (json['InputDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => InputDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputDescriptions: (json['OutputDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceDataSourceDescriptions:
          (json['ReferenceDataSourceDescriptions'] as List?)
              ?.whereNotNull()
              .map((e) => ReferenceDataSourceDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputDescriptions = this.inputDescriptions;
    final outputDescriptions = this.outputDescriptions;
    final referenceDataSourceDescriptions =
        this.referenceDataSourceDescriptions;
    return {
      if (inputDescriptions != null) 'InputDescriptions': inputDescriptions,
      if (outputDescriptions != null) 'OutputDescriptions': outputDescriptions,
      if (referenceDataSourceDescriptions != null)
        'ReferenceDataSourceDescriptions': referenceDataSourceDescriptions,
    };
  }
}

/// Describes updates to the input streams, destination streams, and reference
/// data sources for a SQL-based Kinesis Data Analytics application.
class SqlApplicationConfigurationUpdate {
  /// The array of <a>InputUpdate</a> objects describing the new input streams
  /// used by the application.
  final List<InputUpdate>? inputUpdates;

  /// The array of <a>OutputUpdate</a> objects describing the new destination
  /// streams used by the application.
  final List<OutputUpdate>? outputUpdates;

  /// The array of <a>ReferenceDataSourceUpdate</a> objects describing the new
  /// reference data sources used by the application.
  final List<ReferenceDataSourceUpdate>? referenceDataSourceUpdates;

  SqlApplicationConfigurationUpdate({
    this.inputUpdates,
    this.outputUpdates,
    this.referenceDataSourceUpdates,
  });

  Map<String, dynamic> toJson() {
    final inputUpdates = this.inputUpdates;
    final outputUpdates = this.outputUpdates;
    final referenceDataSourceUpdates = this.referenceDataSourceUpdates;
    return {
      if (inputUpdates != null) 'InputUpdates': inputUpdates,
      if (outputUpdates != null) 'OutputUpdates': outputUpdates,
      if (referenceDataSourceUpdates != null)
        'ReferenceDataSourceUpdates': referenceDataSourceUpdates,
    };
  }
}

/// Describes the starting parameters for a SQL-based Kinesis Data Analytics
/// application.
class SqlRunConfiguration {
  /// The input source ID. You can get this ID by calling the
  /// <a>DescribeApplication</a> operation.
  final String inputId;

  /// The point at which you want the application to start processing records from
  /// the streaming source.
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  SqlRunConfiguration({
    required this.inputId,
    required this.inputStartingPositionConfiguration,
  });

  Map<String, dynamic> toJson() {
    final inputId = this.inputId;
    final inputStartingPositionConfiguration =
        this.inputStartingPositionConfiguration;
    return {
      'InputId': inputId,
      'InputStartingPositionConfiguration': inputStartingPositionConfiguration,
    };
  }
}

class StartApplicationResponse {
  StartApplicationResponse();

  factory StartApplicationResponse.fromJson(Map<String, dynamic> _) {
    return StartApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopApplicationResponse {
  StopApplicationResponse();

  factory StopApplicationResponse.fromJson(Map<String, dynamic> _) {
    return StopApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A key-value pair (the value is optional) that you can define and assign to
/// Amazon resources. If you specify a tag that already exists, the tag value is
/// replaced with the value that you specify in the request. Note that the
/// maximum number of application tags includes system tags. The maximum number
/// of user-defined application tags is 50. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using
/// Tagging</a>.
class Tag {
  /// The key of the key-value tag.
  final String key;

  /// The value of the key-value tag. The value is optional.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
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

class UpdateApplicationMaintenanceConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String? applicationARN;

  /// The application maintenance configuration description after the update.
  final ApplicationMaintenanceConfigurationDescription?
      applicationMaintenanceConfigurationDescription;

  UpdateApplicationMaintenanceConfigurationResponse({
    this.applicationARN,
    this.applicationMaintenanceConfigurationDescription,
  });

  factory UpdateApplicationMaintenanceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateApplicationMaintenanceConfigurationResponse(
      applicationARN: json['ApplicationARN'] as String?,
      applicationMaintenanceConfigurationDescription:
          json['ApplicationMaintenanceConfigurationDescription'] != null
              ? ApplicationMaintenanceConfigurationDescription.fromJson(
                  json['ApplicationMaintenanceConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationMaintenanceConfigurationDescription =
        this.applicationMaintenanceConfigurationDescription;
    return {
      if (applicationARN != null) 'ApplicationARN': applicationARN,
      if (applicationMaintenanceConfigurationDescription != null)
        'ApplicationMaintenanceConfigurationDescription':
            applicationMaintenanceConfigurationDescription,
    };
  }
}

class UpdateApplicationResponse {
  /// Describes application updates.
  final ApplicationDetail applicationDetail;

  UpdateApplicationResponse({
    required this.applicationDetail,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      applicationDetail: ApplicationDetail.fromJson(
          json['ApplicationDetail'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationDetail = this.applicationDetail;
    return {
      'ApplicationDetail': applicationDetail,
    };
  }
}

enum UrlType {
  flinkDashboardUrl,
  zeppelinUiUrl,
}

extension UrlTypeValueExtension on UrlType {
  String toValue() {
    switch (this) {
      case UrlType.flinkDashboardUrl:
        return 'FLINK_DASHBOARD_URL';
      case UrlType.zeppelinUiUrl:
        return 'ZEPPELIN_UI_URL';
    }
  }
}

extension UrlTypeFromString on String {
  UrlType toUrlType() {
    switch (this) {
      case 'FLINK_DASHBOARD_URL':
        return UrlType.flinkDashboardUrl;
      case 'ZEPPELIN_UI_URL':
        return UrlType.zeppelinUiUrl;
    }
    throw Exception('$this is not known in enum UrlType');
  }
}

/// Describes the parameters of a VPC used by the application.
class VpcConfiguration {
  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html">SecurityGroup</a>
  /// IDs used by the VPC configuration.
  final List<String> securityGroupIds;

  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html">Subnet</a>
  /// IDs used by the VPC configuration.
  final List<String> subnetIds;

  VpcConfiguration({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
    };
  }
}

/// Describes the parameters of a VPC used by the application.
class VpcConfigurationDescription {
  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html">SecurityGroup</a>
  /// IDs used by the VPC configuration.
  final List<String> securityGroupIds;

  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html">Subnet</a>
  /// IDs used by the VPC configuration.
  final List<String> subnetIds;

  /// The ID of the VPC configuration.
  final String vpcConfigurationId;

  /// The ID of the associated VPC.
  final String vpcId;

  VpcConfigurationDescription({
    required this.securityGroupIds,
    required this.subnetIds,
    required this.vpcConfigurationId,
    required this.vpcId,
  });

  factory VpcConfigurationDescription.fromJson(Map<String, dynamic> json) {
    return VpcConfigurationDescription(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcConfigurationId: json['VpcConfigurationId'] as String,
      vpcId: json['VpcId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcConfigurationId = this.vpcConfigurationId;
    final vpcId = this.vpcId;
    return {
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
      'VpcConfigurationId': vpcConfigurationId,
      'VpcId': vpcId,
    };
  }
}

/// Describes updates to the VPC configuration used by the application.
class VpcConfigurationUpdate {
  /// Describes an update to the ID of the VPC configuration.
  final String vpcConfigurationId;

  /// Describes updates to the array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html">SecurityGroup</a>
  /// IDs used by the VPC configuration.
  final List<String>? securityGroupIdUpdates;

  /// Describes updates to the array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html">Subnet</a>
  /// IDs used by the VPC configuration.
  final List<String>? subnetIdUpdates;

  VpcConfigurationUpdate({
    required this.vpcConfigurationId,
    this.securityGroupIdUpdates,
    this.subnetIdUpdates,
  });

  Map<String, dynamic> toJson() {
    final vpcConfigurationId = this.vpcConfigurationId;
    final securityGroupIdUpdates = this.securityGroupIdUpdates;
    final subnetIdUpdates = this.subnetIdUpdates;
    return {
      'VpcConfigurationId': vpcConfigurationId,
      if (securityGroupIdUpdates != null)
        'SecurityGroupIdUpdates': securityGroupIdUpdates,
      if (subnetIdUpdates != null) 'SubnetIdUpdates': subnetIdUpdates,
    };
  }
}

/// The configuration of a Managed Service for Apache Flink Studio notebook.
class ZeppelinApplicationConfiguration {
  /// The Amazon Glue Data Catalog that you use in queries in a Managed Service
  /// for Apache Flink Studio notebook.
  final CatalogConfiguration? catalogConfiguration;

  /// Custom artifacts are dependency JARs and user-defined functions (UDF).
  final List<CustomArtifactConfiguration>? customArtifactsConfiguration;

  /// The information required to deploy a Managed Service for Apache Flink Studio
  /// notebook as an application with durable state.
  final DeployAsApplicationConfiguration? deployAsApplicationConfiguration;

  /// The monitoring configuration of a Managed Service for Apache Flink Studio
  /// notebook.
  final ZeppelinMonitoringConfiguration? monitoringConfiguration;

  ZeppelinApplicationConfiguration({
    this.catalogConfiguration,
    this.customArtifactsConfiguration,
    this.deployAsApplicationConfiguration,
    this.monitoringConfiguration,
  });

  Map<String, dynamic> toJson() {
    final catalogConfiguration = this.catalogConfiguration;
    final customArtifactsConfiguration = this.customArtifactsConfiguration;
    final deployAsApplicationConfiguration =
        this.deployAsApplicationConfiguration;
    final monitoringConfiguration = this.monitoringConfiguration;
    return {
      if (catalogConfiguration != null)
        'CatalogConfiguration': catalogConfiguration,
      if (customArtifactsConfiguration != null)
        'CustomArtifactsConfiguration': customArtifactsConfiguration,
      if (deployAsApplicationConfiguration != null)
        'DeployAsApplicationConfiguration': deployAsApplicationConfiguration,
      if (monitoringConfiguration != null)
        'MonitoringConfiguration': monitoringConfiguration,
    };
  }
}

/// The configuration of a Managed Service for Apache Flink Studio notebook.
class ZeppelinApplicationConfigurationDescription {
  /// The monitoring configuration of a Managed Service for Apache Flink Studio
  /// notebook.
  final ZeppelinMonitoringConfigurationDescription
      monitoringConfigurationDescription;

  /// The Amazon Glue Data Catalog that is associated with the Managed Service for
  /// Apache Flink Studio notebook.
  final CatalogConfigurationDescription? catalogConfigurationDescription;

  /// Custom artifacts are dependency JARs and user-defined functions (UDF).
  final List<CustomArtifactConfigurationDescription>?
      customArtifactsConfigurationDescription;

  /// The parameters required to deploy a Managed Service for Apache Flink Studio
  /// notebook as an application with durable state.
  final DeployAsApplicationConfigurationDescription?
      deployAsApplicationConfigurationDescription;

  ZeppelinApplicationConfigurationDescription({
    required this.monitoringConfigurationDescription,
    this.catalogConfigurationDescription,
    this.customArtifactsConfigurationDescription,
    this.deployAsApplicationConfigurationDescription,
  });

  factory ZeppelinApplicationConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ZeppelinApplicationConfigurationDescription(
      monitoringConfigurationDescription:
          ZeppelinMonitoringConfigurationDescription.fromJson(
              json['MonitoringConfigurationDescription']
                  as Map<String, dynamic>),
      catalogConfigurationDescription:
          json['CatalogConfigurationDescription'] != null
              ? CatalogConfigurationDescription.fromJson(
                  json['CatalogConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
      customArtifactsConfigurationDescription:
          (json['CustomArtifactsConfigurationDescription'] as List?)
              ?.whereNotNull()
              .map((e) => CustomArtifactConfigurationDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      deployAsApplicationConfigurationDescription:
          json['DeployAsApplicationConfigurationDescription'] != null
              ? DeployAsApplicationConfigurationDescription.fromJson(
                  json['DeployAsApplicationConfigurationDescription']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final monitoringConfigurationDescription =
        this.monitoringConfigurationDescription;
    final catalogConfigurationDescription =
        this.catalogConfigurationDescription;
    final customArtifactsConfigurationDescription =
        this.customArtifactsConfigurationDescription;
    final deployAsApplicationConfigurationDescription =
        this.deployAsApplicationConfigurationDescription;
    return {
      'MonitoringConfigurationDescription': monitoringConfigurationDescription,
      if (catalogConfigurationDescription != null)
        'CatalogConfigurationDescription': catalogConfigurationDescription,
      if (customArtifactsConfigurationDescription != null)
        'CustomArtifactsConfigurationDescription':
            customArtifactsConfigurationDescription,
      if (deployAsApplicationConfigurationDescription != null)
        'DeployAsApplicationConfigurationDescription':
            deployAsApplicationConfigurationDescription,
    };
  }
}

/// Updates to the configuration of Managed Service for Apache Flink Studio
/// notebook.
class ZeppelinApplicationConfigurationUpdate {
  /// Updates to the configuration of the Amazon Glue Data Catalog that is
  /// associated with the Managed Service for Apache Flink Studio notebook.
  final CatalogConfigurationUpdate? catalogConfigurationUpdate;

  /// Updates to the customer artifacts. Custom artifacts are dependency JAR files
  /// and user-defined functions (UDF).
  final List<CustomArtifactConfiguration>? customArtifactsConfigurationUpdate;
  final DeployAsApplicationConfigurationUpdate?
      deployAsApplicationConfigurationUpdate;

  /// Updates to the monitoring configuration of a Managed Service for Apache
  /// Flink Studio notebook.
  final ZeppelinMonitoringConfigurationUpdate? monitoringConfigurationUpdate;

  ZeppelinApplicationConfigurationUpdate({
    this.catalogConfigurationUpdate,
    this.customArtifactsConfigurationUpdate,
    this.deployAsApplicationConfigurationUpdate,
    this.monitoringConfigurationUpdate,
  });

  Map<String, dynamic> toJson() {
    final catalogConfigurationUpdate = this.catalogConfigurationUpdate;
    final customArtifactsConfigurationUpdate =
        this.customArtifactsConfigurationUpdate;
    final deployAsApplicationConfigurationUpdate =
        this.deployAsApplicationConfigurationUpdate;
    final monitoringConfigurationUpdate = this.monitoringConfigurationUpdate;
    return {
      if (catalogConfigurationUpdate != null)
        'CatalogConfigurationUpdate': catalogConfigurationUpdate,
      if (customArtifactsConfigurationUpdate != null)
        'CustomArtifactsConfigurationUpdate':
            customArtifactsConfigurationUpdate,
      if (deployAsApplicationConfigurationUpdate != null)
        'DeployAsApplicationConfigurationUpdate':
            deployAsApplicationConfigurationUpdate,
      if (monitoringConfigurationUpdate != null)
        'MonitoringConfigurationUpdate': monitoringConfigurationUpdate,
    };
  }
}

/// Describes configuration parameters for Amazon CloudWatch logging for a
/// Managed Service for Apache Flink Studio notebook. For more information about
/// CloudWatch logging, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html">Monitoring</a>.
class ZeppelinMonitoringConfiguration {
  /// The verbosity of the CloudWatch Logs for an application.
  final LogLevel logLevel;

  ZeppelinMonitoringConfiguration({
    required this.logLevel,
  });

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    return {
      'LogLevel': logLevel.toValue(),
    };
  }
}

/// The monitoring configuration for Apache Zeppelin within a Managed Service
/// for Apache Flink Studio notebook.
class ZeppelinMonitoringConfigurationDescription {
  /// Describes the verbosity of the CloudWatch Logs for an application.
  final LogLevel? logLevel;

  ZeppelinMonitoringConfigurationDescription({
    this.logLevel,
  });

  factory ZeppelinMonitoringConfigurationDescription.fromJson(
      Map<String, dynamic> json) {
    return ZeppelinMonitoringConfigurationDescription(
      logLevel: (json['LogLevel'] as String?)?.toLogLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final logLevel = this.logLevel;
    return {
      if (logLevel != null) 'LogLevel': logLevel.toValue(),
    };
  }
}

/// Updates to the monitoring configuration for Apache Zeppelin within a Managed
/// Service for Apache Flink Studio notebook.
class ZeppelinMonitoringConfigurationUpdate {
  /// Updates to the logging level for Apache Zeppelin within a Managed Service
  /// for Apache Flink Studio notebook.
  final LogLevel logLevelUpdate;

  ZeppelinMonitoringConfigurationUpdate({
    required this.logLevelUpdate,
  });

  Map<String, dynamic> toJson() {
    final logLevelUpdate = this.logLevelUpdate;
    return {
      'LogLevelUpdate': logLevelUpdate.toValue(),
    };
  }
}

class CodeValidationException extends _s.GenericAwsException {
  CodeValidationException({String? type, String? message})
      : super(type: type, code: 'CodeValidationException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidApplicationConfigurationException extends _s.GenericAwsException {
  InvalidApplicationConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidApplicationConfigurationException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceProvisionedThroughputExceededException
    extends _s.GenericAwsException {
  ResourceProvisionedThroughputExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ResourceProvisionedThroughputExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnableToDetectSchemaException extends _s.GenericAwsException {
  UnableToDetectSchemaException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToDetectSchemaException',
            message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CodeValidationException': (type, message) =>
      CodeValidationException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InvalidApplicationConfigurationException': (type, message) =>
      InvalidApplicationConfigurationException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceProvisionedThroughputExceededException': (type, message) =>
      ResourceProvisionedThroughputExceededException(
          type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnableToDetectSchemaException': (type, message) =>
      UnableToDetectSchemaException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
