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

part '2018-05-23.g.dart';

/// Amazon Kinesis Data Analytics is a fully managed service that you can use to
/// process and analyze streaming data using Java, SQL, or Scala. The service
/// enables you to quickly author and run Java, SQL, or Scala code against
/// streaming sources to perform time series analytics, feed real-time
/// dashboards, and create real-time metrics.
class KinesisAnalyticsV2 {
  final _s.JsonProtocol _protocol;
  KinesisAnalyticsV2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisanalytics',
            signingName: 'kinesisanalytics',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the Kinesis Data Analytics application. You can retrieve
  /// the application version ID using <a>DescribeApplication</a>.
  Future<AddApplicationCloudWatchLoggingOptionResponse>
      addApplicationCloudWatchLoggingOption({
    @_s.required String applicationName,
    @_s.required CloudWatchLoggingOption cloudWatchLoggingOption,
    @_s.required int currentApplicationVersionId,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        cloudWatchLoggingOption, 'cloudWatchLoggingOption');
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
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
  /// The current version of your application. You can use the
  /// <a>DescribeApplication</a> operation to find the current application
  /// version.
  ///
  /// Parameter [input] :
  /// The <a>Input</a> to add.
  Future<AddApplicationInputResponse> addApplicationInput({
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required Input input,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(input, 'input');
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
  /// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
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
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required String inputId,
    @_s.required InputProcessingConfiguration inputProcessingConfiguration,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputId, 'inputId');
    _s.validateStringLength(
      'inputId',
      inputId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputId',
      inputId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        inputProcessingConfiguration, 'inputProcessingConfiguration');
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
  /// Kinesis data stream, a Kinesis Data Firehose delivery stream, or an AWS
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
  /// delivery stream, or an AWS Lambda function), and record the formation to
  /// use when writing to the destination.
  Future<AddApplicationOutputResponse> addApplicationOutput({
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required Output output,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(output, 'output');
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
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required ReferenceDataSource referenceDataSource,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(referenceDataSource, 'referenceDataSource');
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
  /// Note the following about VPC configurations for Kinesis Data Analytics
  /// applications:
  ///
  /// <ul>
  /// <li>
  /// VPC configurations are not supported for SQL applications.
  /// </li>
  /// <li>
  /// When a VPC is added to a Kinesis Data Analytics application, the
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
  /// Parameter [currentApplicationVersionId] :
  /// The version of the application to which you want to add the VPC
  /// configuration. You can use the <a>DescribeApplication</a> operation to get
  /// the current application version. If the version specified is not the
  /// current version, the <code>ConcurrentModificationException</code> is
  /// returned.
  ///
  /// Parameter [vpcConfiguration] :
  /// Description of the VPC to add to the application.
  Future<AddApplicationVpcConfigurationResponse>
      addApplicationVpcConfiguration({
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required VpcConfiguration vpcConfiguration,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpcConfiguration, 'vpcConfiguration');
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
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'VpcConfiguration': vpcConfiguration,
      },
    );

    return AddApplicationVpcConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Kinesis Data Analytics application. For information about
  /// creating a Kinesis Data Analytics application, see <a
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
  ///
  /// Parameter [applicationName] :
  /// The name of your application (for example, <code>sample-app</code>).
  ///
  /// Parameter [runtimeEnvironment] :
  /// The runtime environment for the application (<code>SQL-1.0</code>,
  /// <code>FLINK-1_6</code>, or <code>FLINK-1_8</code>).
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
    @_s.required String applicationName,
    @_s.required RuntimeEnvironment runtimeEnvironment,
    @_s.required String serviceExecutionRole,
    ApplicationConfiguration applicationConfiguration,
    String applicationDescription,
    List<CloudWatchLoggingOption> cloudWatchLoggingOptions,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runtimeEnvironment, 'runtimeEnvironment');
    ArgumentError.checkNotNull(serviceExecutionRole, 'serviceExecutionRole');
    _s.validateStringLength(
      'serviceExecutionRole',
      serviceExecutionRole,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceExecutionRole',
      serviceExecutionRole,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationDescription',
      applicationDescription,
      0,
      1024,
    );
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
        'RuntimeEnvironment': runtimeEnvironment?.toValue() ?? '',
        'ServiceExecutionRole': serviceExecutionRole,
        if (applicationConfiguration != null)
          'ApplicationConfiguration': applicationConfiguration,
        if (applicationDescription != null)
          'ApplicationDescription': applicationDescription,
        if (cloudWatchLoggingOptions != null)
          'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Creates and returns a URL that you can use to connect to an application's
  /// extension. Currently, the only available extension is the Apache Flink
  /// dashboard.
  ///
  /// The IAM role or user used to call this API defines the permissions to
  /// access the extension. Once the presigned URL is created, no additional
  /// permission is required to access this URL. IAM authorization policies for
  /// this API are also enforced for every HTTP request that attempts to connect
  /// to the extension.
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
    @_s.required String applicationName,
    @_s.required UrlType urlType,
    int sessionExpirationDurationInSeconds,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(urlType, 'urlType');
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
        'UrlType': urlType?.toValue() ?? '',
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
    @_s.required String applicationName,
    @_s.required String snapshotName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(snapshotName, 'snapshotName');
    _s.validateStringLength(
      'snapshotName',
      snapshotName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snapshotName',
      snapshotName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.CreateApplicationSnapshot'
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

    return CreateApplicationSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified application. Kinesis Data Analytics halts
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
    @_s.required String applicationName,
    @_s.required DateTime createTimestamp,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(createTimestamp, 'createTimestamp');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DeleteApplication'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon CloudWatch log stream from an Kinesis Data Analytics
  /// application.
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
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the application. You can retrieve the application
  /// version ID using <a>DescribeApplication</a>.
  Future<DeleteApplicationCloudWatchLoggingOptionResponse>
      deleteApplicationCloudWatchLoggingOption({
    @_s.required String applicationName,
    @_s.required String cloudWatchLoggingOptionId,
    @_s.required int currentApplicationVersionId,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        cloudWatchLoggingOptionId, 'cloudWatchLoggingOptionId');
    _s.validateStringLength(
      'cloudWatchLoggingOptionId',
      cloudWatchLoggingOptionId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'cloudWatchLoggingOptionId',
      cloudWatchLoggingOptionId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
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
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required String inputId,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputId, 'inputId');
    _s.validateStringLength(
      'inputId',
      inputId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputId',
      inputId,
      r'''[a-zA-Z0-9_.-]+''',
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
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required String outputId,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputId, 'outputId');
    _s.validateStringLength(
      'outputId',
      outputId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outputId',
      outputId,
      r'''[a-zA-Z0-9_.-]+''',
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
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required String referenceId,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(referenceId, 'referenceId');
    _s.validateStringLength(
      'referenceId',
      referenceId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'referenceId',
      referenceId,
      r'''[a-zA-Z0-9_.-]+''',
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
    @_s.required String applicationName,
    @_s.required DateTime snapshotCreationTimestamp,
    @_s.required String snapshotName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        snapshotCreationTimestamp, 'snapshotCreationTimestamp');
    ArgumentError.checkNotNull(snapshotName, 'snapshotName');
    _s.validateStringLength(
      'snapshotName',
      snapshotName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snapshotName',
      snapshotName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.DeleteApplicationSnapshot'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteApplicationSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Removes a VPC configuration from a Kinesis Data Analytics application.
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
  /// Parameter [currentApplicationVersionId] :
  /// The current application version ID. You can retrieve the application
  /// version ID using <a>DescribeApplication</a>.
  ///
  /// Parameter [vpcConfigurationId] :
  /// The ID of the VPC configuration to delete.
  Future<DeleteApplicationVpcConfigurationResponse>
      deleteApplicationVpcConfiguration({
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    @_s.required String vpcConfigurationId,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vpcConfigurationId, 'vpcConfigurationId');
    _s.validateStringLength(
      'vpcConfigurationId',
      vpcConfigurationId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vpcConfigurationId',
      vpcConfigurationId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
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
        'CurrentApplicationVersionId': currentApplicationVersionId,
        'VpcConfigurationId': vpcConfigurationId,
      },
    );

    return DeleteApplicationVpcConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns information about a specific Kinesis Data Analytics application.
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
  /// Displays verbose information about a Kinesis Data Analytics application,
  /// including the application's job plan.
  Future<DescribeApplicationResponse> describeApplication({
    @_s.required String applicationName,
    bool includeAdditionalDetails,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
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
    @_s.required String applicationName,
    @_s.required String snapshotName,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(snapshotName, 'snapshotName');
    _s.validateStringLength(
      'snapshotName',
      snapshotName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snapshotName',
      snapshotName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
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
  /// records from the specified streaming source discovery purposes.
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the streaming source.
  ///
  /// Parameter [s3Configuration] :
  /// Specify this parameter to discover a schema from data in an Amazon S3
  /// object.
  Future<DiscoverInputSchemaResponse> discoverInputSchema({
    @_s.required String serviceExecutionRole,
    InputProcessingConfiguration inputProcessingConfiguration,
    InputStartingPositionConfiguration inputStartingPositionConfiguration,
    String resourceARN,
    S3Configuration s3Configuration,
  }) async {
    ArgumentError.checkNotNull(serviceExecutionRole, 'serviceExecutionRole');
    _s.validateStringLength(
      'serviceExecutionRole',
      serviceExecutionRole,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceExecutionRole',
      serviceExecutionRole,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      2048,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:.*''',
    );
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
    @_s.required String applicationName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      512,
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

  /// Returns a list of Kinesis Data Analytics applications in your account. For
  /// each application, the response includes the application name, Amazon
  /// Resource Name (ARN), and status.
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
  /// the AWS Command Line Interface's Pagination Options</a>.
  Future<ListApplicationsResponse> listApplications({
    int limit,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      128,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.-]+''',
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
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:.*''',
      isRequired: true,
    );
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

  /// Starts the specified Kinesis Data Analytics application. After creating an
  /// application, you must exclusively call this operation to start your
  /// application.
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
  /// Identifies the run configuration (start parameters) of a Kinesis Data
  /// Analytics application.
  Future<void> startApplication({
    @_s.required String applicationName,
    @_s.required RunConfiguration runConfiguration,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runConfiguration, 'runConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.StartApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'RunConfiguration': runConfiguration,
      },
    );

    return StartApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Stops the application from processing data. You can stop an application
  /// only if it is in the running status, unless you set the <code>Force</code>
  /// parameter to <code>true</code>.
  ///
  /// You can use the <a>DescribeApplication</a> operation to find the
  /// application status.
  ///
  /// Kinesis Data Analytics takes a snapshot when the application is stopped,
  /// unless <code>Force</code> is set to <code>true</code>.
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
  /// <code>Force</code> to <code>true</code>, Kinesis Data Analytics stops the
  /// application without taking a snapshot.
  /// <note>
  /// Force-stopping your application may lead to data loss or duplication. To
  /// prevent data loss or duplicate processing of data during application
  /// restarts, we recommend you to take frequent snapshots of your application.
  /// </note>
  /// You can only force stop a Flink-based Kinesis Data Analytics application.
  /// You can't force stop a SQL-based Kinesis Data Analytics application.
  ///
  /// The application must be in the <code>STARTING</code>,
  /// <code>UPDATING</code>, <code>STOPPING</code>, <code>AUTOSCALING</code>, or
  /// <code>RUNNING</code> status.
  Future<void> stopApplication({
    @_s.required String applicationName,
    bool force,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.StopApplication'
    };
    final jsonResponse = await _protocol.send(
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

    return StopApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more key-value tags to a Kinesis Data Analytics application.
  /// Note that the maximum number of application tags includes system tags. The
  /// maximum number of user-defined application tags is 50. For more
  /// information, see <a
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from a Kinesis Data Analytics application. For
  /// more information, see <a
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
  /// The ARN of the Kinesis Data Analytics application from which to remove the
  /// tags.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys of tags to remove from the specified application.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20180523.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing Kinesis Data Analytics application. Using this
  /// operation, you can update application code, input configuration, and
  /// output configuration.
  ///
  /// Kinesis Data Analytics updates the <code>ApplicationVersionId</code> each
  /// time you update your application.
  /// <note>
  /// You cannot update the <code>RuntimeEnvironment</code> of an existing
  /// application. If you need to update an application's
  /// <code>RuntimeEnvironment</code>, you must delete the application and
  /// create it again.
  /// </note>
  ///
  /// May throw [CodeValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidApplicationConfigurationException].
  ///
  /// Parameter [applicationName] :
  /// The name of the application to update.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current application version ID. You can retrieve the application
  /// version ID using <a>DescribeApplication</a>.
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
  /// Parameter [runConfigurationUpdate] :
  /// Describes updates to the application's starting parameters.
  ///
  /// Parameter [serviceExecutionRoleUpdate] :
  /// Describes updates to the service execution role.
  Future<UpdateApplicationResponse> updateApplication({
    @_s.required String applicationName,
    @_s.required int currentApplicationVersionId,
    ApplicationConfigurationUpdate applicationConfigurationUpdate,
    List<CloudWatchLoggingOptionUpdate> cloudWatchLoggingOptionUpdates,
    RunConfigurationUpdate runConfigurationUpdate,
    String serviceExecutionRoleUpdate,
  }) async {
    ArgumentError.checkNotNull(applicationName, 'applicationName');
    _s.validateStringLength(
      'applicationName',
      applicationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'applicationName',
      applicationName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        currentApplicationVersionId, 'currentApplicationVersionId');
    _s.validateNumRange(
      'currentApplicationVersionId',
      currentApplicationVersionId,
      1,
      999999999,
      isRequired: true,
    );
    _s.validateStringLength(
      'serviceExecutionRoleUpdate',
      serviceExecutionRoleUpdate,
      1,
      2048,
    );
    _s.validateStringPattern(
      'serviceExecutionRoleUpdate',
      serviceExecutionRoleUpdate,
      r'''arn:.*''',
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
        'CurrentApplicationVersionId': currentApplicationVersionId,
        if (applicationConfigurationUpdate != null)
          'ApplicationConfigurationUpdate': applicationConfigurationUpdate,
        if (cloudWatchLoggingOptionUpdates != null)
          'CloudWatchLoggingOptionUpdates': cloudWatchLoggingOptionUpdates,
        if (runConfigurationUpdate != null)
          'RunConfigurationUpdate': runConfigurationUpdate,
        if (serviceExecutionRoleUpdate != null)
          'ServiceExecutionRoleUpdate': serviceExecutionRoleUpdate,
      },
    );

    return UpdateApplicationResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationCloudWatchLoggingOptionResponse {
  /// The application's ARN.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The new version ID of the Kinesis Data Analytics application. Kinesis Data
  /// Analytics updates the <code>ApplicationVersionId</code> each time you change
  /// the CloudWatch logging options.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The descriptions of the current CloudWatch logging options for the Kinesis
  /// Data Analytics application.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionDescriptions')
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  AddApplicationCloudWatchLoggingOptionResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.cloudWatchLoggingOptionDescriptions,
  });
  factory AddApplicationCloudWatchLoggingOptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplicationCloudWatchLoggingOptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationInputProcessingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// Provides the current application version.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The input ID that is associated with the application input. This is the ID
  /// that Kinesis Data Analytics assigns to each input configuration that you add
  /// to your application.
  @_s.JsonKey(name: 'InputId')
  final String inputId;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  @_s.JsonKey(name: 'InputProcessingConfigurationDescription')
  final InputProcessingConfigurationDescription
      inputProcessingConfigurationDescription;

  AddApplicationInputProcessingConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.inputId,
    this.inputProcessingConfigurationDescription,
  });
  factory AddApplicationInputProcessingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplicationInputProcessingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationInputResponse {
  /// The Amazon Resource Name (ARN) of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// Provides the current application version.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// Describes the application input configuration.
  @_s.JsonKey(name: 'InputDescriptions')
  final List<InputDescription> inputDescriptions;

  AddApplicationInputResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.inputDescriptions,
  });
  factory AddApplicationInputResponse.fromJson(Map<String, dynamic> json) =>
      _$AddApplicationInputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationOutputResponse {
  /// The application Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The updated application version ID. Kinesis Data Analytics increments this
  /// ID when the application is updated.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// Describes the application output configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  @_s.JsonKey(name: 'OutputDescriptions')
  final List<OutputDescription> outputDescriptions;

  AddApplicationOutputResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.outputDescriptions,
  });
  factory AddApplicationOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$AddApplicationOutputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationReferenceDataSourceResponse {
  /// The application Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The updated application version ID. Kinesis Data Analytics increments this
  /// ID when the application is updated.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// Describes reference data sources configured for the application.
  @_s.JsonKey(name: 'ReferenceDataSourceDescriptions')
  final List<ReferenceDataSourceDescription> referenceDataSourceDescriptions;

  AddApplicationReferenceDataSourceResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.referenceDataSourceDescriptions,
  });
  factory AddApplicationReferenceDataSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplicationReferenceDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationVpcConfigurationResponse {
  /// The ARN of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// Provides the current application version. Kinesis Data Analytics updates the
  /// ApplicationVersionId each time you update the application.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The parameters of the new VPC configuration.
  @_s.JsonKey(name: 'VpcConfigurationDescription')
  final VpcConfigurationDescription vpcConfigurationDescription;

  AddApplicationVpcConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.vpcConfigurationDescription,
  });
  factory AddApplicationVpcConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplicationVpcConfigurationResponseFromJson(json);
}

/// Describes code configuration for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationCodeConfiguration {
  /// Specifies whether the code content is in text or zip format.
  @_s.JsonKey(name: 'CodeContentType')
  final CodeContentType codeContentType;

  /// The location and type of the application code.
  @_s.JsonKey(name: 'CodeContent')
  final CodeContent codeContent;

  ApplicationCodeConfiguration({
    @_s.required this.codeContentType,
    this.codeContent,
  });
  Map<String, dynamic> toJson() => _$ApplicationCodeConfigurationToJson(this);
}

/// Describes code configuration for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationCodeConfigurationDescription {
  /// Specifies whether the code content is in text or zip format.
  @_s.JsonKey(name: 'CodeContentType')
  final CodeContentType codeContentType;

  /// Describes details about the location and format of the application code.
  @_s.JsonKey(name: 'CodeContentDescription')
  final CodeContentDescription codeContentDescription;

  ApplicationCodeConfigurationDescription({
    @_s.required this.codeContentType,
    this.codeContentDescription,
  });
  factory ApplicationCodeConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ApplicationCodeConfigurationDescriptionFromJson(json);
}

/// Describes code configuration updates to a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationCodeConfigurationUpdate {
  /// Describes updates to the code content type.
  @_s.JsonKey(name: 'CodeContentTypeUpdate')
  final CodeContentType codeContentTypeUpdate;

  /// Describes updates to the code content of an application.
  @_s.JsonKey(name: 'CodeContentUpdate')
  final CodeContentUpdate codeContentUpdate;

  ApplicationCodeConfigurationUpdate({
    this.codeContentTypeUpdate,
    this.codeContentUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$ApplicationCodeConfigurationUpdateToJson(this);
}

/// Specifies the creation parameters for a Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationConfiguration {
  /// The code location and type parameters for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'ApplicationCodeConfiguration')
  final ApplicationCodeConfiguration applicationCodeConfiguration;

  /// Describes whether snapshots are enabled for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'ApplicationSnapshotConfiguration')
  final ApplicationSnapshotConfiguration applicationSnapshotConfiguration;

  /// Describes execution properties for a Flink-based Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'EnvironmentProperties')
  final EnvironmentProperties environmentProperties;

  /// The creation and update parameters for a Flink-based Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'FlinkApplicationConfiguration')
  final FlinkApplicationConfiguration flinkApplicationConfiguration;

  /// The creation and update parameters for a SQL-based Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'SqlApplicationConfiguration')
  final SqlApplicationConfiguration sqlApplicationConfiguration;

  /// The array of descriptions of VPC configurations available to the
  /// application.
  @_s.JsonKey(name: 'VpcConfigurations')
  final List<VpcConfiguration> vpcConfigurations;

  ApplicationConfiguration({
    @_s.required this.applicationCodeConfiguration,
    this.applicationSnapshotConfiguration,
    this.environmentProperties,
    this.flinkApplicationConfiguration,
    this.sqlApplicationConfiguration,
    this.vpcConfigurations,
  });
  Map<String, dynamic> toJson() => _$ApplicationConfigurationToJson(this);
}

/// Describes details about the application code and starting parameters for a
/// Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationConfigurationDescription {
  /// The details about the application code for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'ApplicationCodeConfigurationDescription')
  final ApplicationCodeConfigurationDescription
      applicationCodeConfigurationDescription;

  /// Describes whether snapshots are enabled for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'ApplicationSnapshotConfigurationDescription')
  final ApplicationSnapshotConfigurationDescription
      applicationSnapshotConfigurationDescription;

  /// Describes execution properties for a Flink-based Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'EnvironmentPropertyDescriptions')
  final EnvironmentPropertyDescriptions environmentPropertyDescriptions;

  /// The details about a Flink-based Kinesis Data Analytics application.
  @_s.JsonKey(name: 'FlinkApplicationConfigurationDescription')
  final FlinkApplicationConfigurationDescription
      flinkApplicationConfigurationDescription;

  /// The details about the starting properties for a Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'RunConfigurationDescription')
  final RunConfigurationDescription runConfigurationDescription;

  /// The details about inputs, outputs, and reference data sources for a
  /// SQL-based Kinesis Data Analytics application.
  @_s.JsonKey(name: 'SqlApplicationConfigurationDescription')
  final SqlApplicationConfigurationDescription
      sqlApplicationConfigurationDescription;

  /// The array of descriptions of VPC configurations available to the
  /// application.
  @_s.JsonKey(name: 'VpcConfigurationDescriptions')
  final List<VpcConfigurationDescription> vpcConfigurationDescriptions;

  ApplicationConfigurationDescription({
    this.applicationCodeConfigurationDescription,
    this.applicationSnapshotConfigurationDescription,
    this.environmentPropertyDescriptions,
    this.flinkApplicationConfigurationDescription,
    this.runConfigurationDescription,
    this.sqlApplicationConfigurationDescription,
    this.vpcConfigurationDescriptions,
  });
  factory ApplicationConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ApplicationConfigurationDescriptionFromJson(json);
}

/// Describes updates to an application's configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationConfigurationUpdate {
  /// Describes updates to a Flink-based Kinesis Data Analytics application's code
  /// configuration.
  @_s.JsonKey(name: 'ApplicationCodeConfigurationUpdate')
  final ApplicationCodeConfigurationUpdate applicationCodeConfigurationUpdate;

  /// Describes whether snapshots are enabled for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'ApplicationSnapshotConfigurationUpdate')
  final ApplicationSnapshotConfigurationUpdate
      applicationSnapshotConfigurationUpdate;

  /// Describes updates to the environment properties for a Flink-based Kinesis
  /// Data Analytics application.
  @_s.JsonKey(name: 'EnvironmentPropertyUpdates')
  final EnvironmentPropertyUpdates environmentPropertyUpdates;

  /// Describes updates to a Flink-based Kinesis Data Analytics application's
  /// configuration.
  @_s.JsonKey(name: 'FlinkApplicationConfigurationUpdate')
  final FlinkApplicationConfigurationUpdate flinkApplicationConfigurationUpdate;

  /// Describes updates to a SQL-based Kinesis Data Analytics application's
  /// configuration.
  @_s.JsonKey(name: 'SqlApplicationConfigurationUpdate')
  final SqlApplicationConfigurationUpdate sqlApplicationConfigurationUpdate;

  /// Updates to the array of descriptions of VPC configurations available to the
  /// application.
  @_s.JsonKey(name: 'VpcConfigurationUpdates')
  final List<VpcConfigurationUpdate> vpcConfigurationUpdates;

  ApplicationConfigurationUpdate({
    this.applicationCodeConfigurationUpdate,
    this.applicationSnapshotConfigurationUpdate,
    this.environmentPropertyUpdates,
    this.flinkApplicationConfigurationUpdate,
    this.sqlApplicationConfigurationUpdate,
    this.vpcConfigurationUpdates,
  });
  Map<String, dynamic> toJson() => _$ApplicationConfigurationUpdateToJson(this);
}

/// Describes the application, including the application Amazon Resource Name
/// (ARN), status, latest version, and input and output configurations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationDetail {
  /// The ARN of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The name of the application.
  @_s.JsonKey(name: 'ApplicationName')
  final String applicationName;

  /// The status of the application.
  @_s.JsonKey(name: 'ApplicationStatus')
  final ApplicationStatus applicationStatus;

  /// Provides the current application version. Kinesis Data Analytics updates the
  /// <code>ApplicationVersionId</code> each time you update the application.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The runtime environment for the application (<code>SQL-1.0</code>,
  /// <code>FLINK-1_6</code>, or <code>FLINK-1_8</code>).
  @_s.JsonKey(name: 'RuntimeEnvironment')
  final RuntimeEnvironment runtimeEnvironment;

  /// Provides details about the application's Java, SQL, or Scala code and
  /// starting parameters.
  @_s.JsonKey(name: 'ApplicationConfigurationDescription')
  final ApplicationConfigurationDescription applicationConfigurationDescription;

  /// The description of the application.
  @_s.JsonKey(name: 'ApplicationDescription')
  final String applicationDescription;

  /// Describes the application Amazon CloudWatch logging options.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionDescriptions')
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  /// The current timestamp when the application was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTimestamp')
  final DateTime createTimestamp;

  /// The current timestamp when the application was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTimestamp')
  final DateTime lastUpdateTimestamp;

  /// Specifies the IAM role that the application uses to access external
  /// resources.
  @_s.JsonKey(name: 'ServiceExecutionRole')
  final String serviceExecutionRole;

  ApplicationDetail({
    @_s.required this.applicationARN,
    @_s.required this.applicationName,
    @_s.required this.applicationStatus,
    @_s.required this.applicationVersionId,
    @_s.required this.runtimeEnvironment,
    this.applicationConfigurationDescription,
    this.applicationDescription,
    this.cloudWatchLoggingOptionDescriptions,
    this.createTimestamp,
    this.lastUpdateTimestamp,
    this.serviceExecutionRole,
  });
  factory ApplicationDetail.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDetailFromJson(json);
}

/// Specifies the method and snapshot to use when restarting an application
/// using previously saved application state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ApplicationRestoreConfiguration {
  /// Specifies how the application should be restored.
  @_s.JsonKey(name: 'ApplicationRestoreType')
  final ApplicationRestoreType applicationRestoreType;

  /// The identifier of an existing snapshot of application state to use to
  /// restart an application. The application uses this value if
  /// <code>RESTORE_FROM_CUSTOM_SNAPSHOT</code> is specified for the
  /// <code>ApplicationRestoreType</code>.
  @_s.JsonKey(name: 'SnapshotName')
  final String snapshotName;

  ApplicationRestoreConfiguration({
    @_s.required this.applicationRestoreType,
    this.snapshotName,
  });
  factory ApplicationRestoreConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ApplicationRestoreConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApplicationRestoreConfigurationToJson(this);
}

enum ApplicationRestoreType {
  @_s.JsonValue('SKIP_RESTORE_FROM_SNAPSHOT')
  skipRestoreFromSnapshot,
  @_s.JsonValue('RESTORE_FROM_LATEST_SNAPSHOT')
  restoreFromLatestSnapshot,
  @_s.JsonValue('RESTORE_FROM_CUSTOM_SNAPSHOT')
  restoreFromCustomSnapshot,
}

/// Describes whether snapshots are enabled for a Flink-based Kinesis Data
/// Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationSnapshotConfiguration {
  /// Describes whether snapshots are enabled for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'SnapshotsEnabled')
  final bool snapshotsEnabled;

  ApplicationSnapshotConfiguration({
    @_s.required this.snapshotsEnabled,
  });
  Map<String, dynamic> toJson() =>
      _$ApplicationSnapshotConfigurationToJson(this);
}

/// Describes whether snapshots are enabled for a Flink-based Kinesis Data
/// Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationSnapshotConfigurationDescription {
  /// Describes whether snapshots are enabled for a Flink-based Kinesis Data
  /// Analytics application.
  @_s.JsonKey(name: 'SnapshotsEnabled')
  final bool snapshotsEnabled;

  ApplicationSnapshotConfigurationDescription({
    @_s.required this.snapshotsEnabled,
  });
  factory ApplicationSnapshotConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ApplicationSnapshotConfigurationDescriptionFromJson(json);
}

/// Describes updates to whether snapshots are enabled for a Flink-based Kinesis
/// Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationSnapshotConfigurationUpdate {
  /// Describes updates to whether snapshots are enabled for a Flink-based Kinesis
  /// Data Analytics application.
  @_s.JsonKey(name: 'SnapshotsEnabledUpdate')
  final bool snapshotsEnabledUpdate;

  ApplicationSnapshotConfigurationUpdate({
    @_s.required this.snapshotsEnabledUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$ApplicationSnapshotConfigurationUpdateToJson(this);
}

enum ApplicationStatus {
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('AUTOSCALING')
  autoscaling,
  @_s.JsonValue('FORCE_STOPPING')
  forceStopping,
}

/// Provides application summary information, including the application Amazon
/// Resource Name (ARN), name, and status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationSummary {
  /// The ARN of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The name of the application.
  @_s.JsonKey(name: 'ApplicationName')
  final String applicationName;

  /// The status of the application.
  @_s.JsonKey(name: 'ApplicationStatus')
  final ApplicationStatus applicationStatus;

  /// Provides the current application version.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The runtime environment for the application (<code>SQL-1.0</code>,
  /// <code>FLINK-1_6</code>, or <code>FLINK-1_8</code>).
  @_s.JsonKey(name: 'RuntimeEnvironment')
  final RuntimeEnvironment runtimeEnvironment;

  ApplicationSummary({
    @_s.required this.applicationARN,
    @_s.required this.applicationName,
    @_s.required this.applicationStatus,
    @_s.required this.applicationVersionId,
    @_s.required this.runtimeEnvironment,
  });
  factory ApplicationSummary.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSummaryFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CSVMappingParameters {
  /// The column delimiter. For example, in a CSV format, a comma (",") is the
  /// typical column delimiter.
  @_s.JsonKey(name: 'RecordColumnDelimiter')
  final String recordColumnDelimiter;

  /// The row delimiter. For example, in a CSV format, <i>'\n'</i> is the typical
  /// row delimiter.
  @_s.JsonKey(name: 'RecordRowDelimiter')
  final String recordRowDelimiter;

  CSVMappingParameters({
    @_s.required this.recordColumnDelimiter,
    @_s.required this.recordRowDelimiter,
  });
  factory CSVMappingParameters.fromJson(Map<String, dynamic> json) =>
      _$CSVMappingParametersFromJson(json);

  Map<String, dynamic> toJson() => _$CSVMappingParametersToJson(this);
}

/// Describes an application's checkpointing configuration. Checkpointing is the
/// process of persisting application state for fault tolerance. For more
/// information, see <a
/// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/concepts/programming-model.html#checkpoints-for-fault-tolerance">
/// Checkpoints for Fault Tolerance</a> in the <a
/// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/">Apache
/// Flink Documentation</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CheckpointConfiguration {
  /// Describes whether the application uses Kinesis Data Analytics' default
  /// checkpointing behavior. You must set this property to <code>CUSTOM</code> in
  /// order to set the <code>CheckpointingEnabled</code>,
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
  @_s.JsonKey(name: 'ConfigurationType')
  final ConfigurationType configurationType;

  /// Describes the interval in milliseconds between checkpoint operations.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointInterval</code> vaue of 60000, even if this value is set to
  /// another value using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'CheckpointInterval')
  final int checkpointInterval;

  /// Describes whether checkpointing is enabled for a Flink-based Kinesis Data
  /// Analytics application.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointingEnabled</code> value of <code>true</code>, even if this
  /// value is set to another value using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'CheckpointingEnabled')
  final bool checkpointingEnabled;

  /// Describes the minimum time in milliseconds after a checkpoint operation
  /// completes that a new checkpoint operation can start. If a checkpoint
  /// operation takes longer than the <code>CheckpointInterval</code>, the
  /// application otherwise performs continual checkpoint operations. For more
  /// information, see <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/ops/state/large_state_tuning.html#tuning-checkpointing">
  /// Tuning Checkpointing</a> in the <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/">Apache
  /// Flink Documentation</a>.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>MinPauseBetweenCheckpoints</code> value of 5000, even if this value is
  /// set using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'MinPauseBetweenCheckpoints')
  final int minPauseBetweenCheckpoints;

  CheckpointConfiguration({
    @_s.required this.configurationType,
    this.checkpointInterval,
    this.checkpointingEnabled,
    this.minPauseBetweenCheckpoints,
  });
  Map<String, dynamic> toJson() => _$CheckpointConfigurationToJson(this);
}

/// Describes checkpointing parameters for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CheckpointConfigurationDescription {
  /// Describes the interval in milliseconds between checkpoint operations.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointInterval</code> vaue of 60000, even if this value is set to
  /// another value using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'CheckpointInterval')
  final int checkpointInterval;

  /// Describes whether checkpointing is enabled for a Flink-based Kinesis Data
  /// Analytics application.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointingEnabled</code> value of <code>true</code>, even if this
  /// value is set to another value using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'CheckpointingEnabled')
  final bool checkpointingEnabled;

  /// Describes whether the application uses the default checkpointing behavior in
  /// Kinesis Data Analytics.
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
  @_s.JsonKey(name: 'ConfigurationType')
  final ConfigurationType configurationType;

  /// Describes the minimum time in milliseconds after a checkpoint operation
  /// completes that a new checkpoint operation can start.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>MinPauseBetweenCheckpoints</code> value of 5000, even if this value is
  /// set using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'MinPauseBetweenCheckpoints')
  final int minPauseBetweenCheckpoints;

  CheckpointConfigurationDescription({
    this.checkpointInterval,
    this.checkpointingEnabled,
    this.configurationType,
    this.minPauseBetweenCheckpoints,
  });
  factory CheckpointConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$CheckpointConfigurationDescriptionFromJson(json);
}

/// Describes updates to the checkpointing parameters for a Flink-based Kinesis
/// Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CheckpointConfigurationUpdate {
  /// Describes updates to the interval in milliseconds between checkpoint
  /// operations.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointInterval</code> vaue of 60000, even if this value is set to
  /// another value using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'CheckpointIntervalUpdate')
  final int checkpointIntervalUpdate;

  /// Describes updates to whether checkpointing is enabled for an application.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>CheckpointingEnabled</code> value of <code>true</code>, even if this
  /// value is set to another value using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'CheckpointingEnabledUpdate')
  final bool checkpointingEnabledUpdate;

  /// Describes updates to whether the application uses the default checkpointing
  /// behavior of Kinesis Data Analytics. You must set this property to
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
  @_s.JsonKey(name: 'ConfigurationTypeUpdate')
  final ConfigurationType configurationTypeUpdate;

  /// Describes updates to the minimum time in milliseconds after a checkpoint
  /// operation completes that a new checkpoint operation can start.
  /// <note>
  /// If <code>CheckpointConfiguration.ConfigurationType</code> is
  /// <code>DEFAULT</code>, the application will use a
  /// <code>MinPauseBetweenCheckpoints</code> value of 5000, even if this value is
  /// set using this API or in application code.
  /// </note>
  @_s.JsonKey(name: 'MinPauseBetweenCheckpointsUpdate')
  final int minPauseBetweenCheckpointsUpdate;

  CheckpointConfigurationUpdate({
    this.checkpointIntervalUpdate,
    this.checkpointingEnabledUpdate,
    this.configurationTypeUpdate,
    this.minPauseBetweenCheckpointsUpdate,
  });
  Map<String, dynamic> toJson() => _$CheckpointConfigurationUpdateToJson(this);
}

/// Provides a description of Amazon CloudWatch logging options, including the
/// log stream Amazon Resource Name (ARN).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudWatchLoggingOption {
  /// The ARN of the CloudWatch log to receive application messages.
  @_s.JsonKey(name: 'LogStreamARN')
  final String logStreamARN;

  CloudWatchLoggingOption({
    @_s.required this.logStreamARN,
  });
  Map<String, dynamic> toJson() => _$CloudWatchLoggingOptionToJson(this);
}

/// Describes the Amazon CloudWatch logging option.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudWatchLoggingOptionDescription {
  /// The Amazon Resource Name (ARN) of the CloudWatch log to receive application
  /// messages.
  @_s.JsonKey(name: 'LogStreamARN')
  final String logStreamARN;

  /// The ID of the CloudWatch logging option description.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionId')
  final String cloudWatchLoggingOptionId;

  /// The IAM ARN of the role to use to send application messages.
  /// <note>
  /// Provided for backward compatibility. Applications created with the current
  /// API version have an application-level service execution role rather than a
  /// resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  CloudWatchLoggingOptionDescription({
    @_s.required this.logStreamARN,
    this.cloudWatchLoggingOptionId,
    this.roleARN,
  });
  factory CloudWatchLoggingOptionDescription.fromJson(
          Map<String, dynamic> json) =>
      _$CloudWatchLoggingOptionDescriptionFromJson(json);
}

/// Describes the Amazon CloudWatch logging option updates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudWatchLoggingOptionUpdate {
  /// The ID of the CloudWatch logging option to update
  @_s.JsonKey(name: 'CloudWatchLoggingOptionId')
  final String cloudWatchLoggingOptionId;

  /// The Amazon Resource Name (ARN) of the CloudWatch log to receive application
  /// messages.
  @_s.JsonKey(name: 'LogStreamARNUpdate')
  final String logStreamARNUpdate;

  CloudWatchLoggingOptionUpdate({
    @_s.required this.cloudWatchLoggingOptionId,
    this.logStreamARNUpdate,
  });
  Map<String, dynamic> toJson() => _$CloudWatchLoggingOptionUpdateToJson(this);
}

/// Specifies either the application code, or the location of the application
/// code, for a Flink-based Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeContent {
  /// Information about the Amazon S3 bucket containing the application code.
  @_s.JsonKey(name: 'S3ContentLocation')
  final S3ContentLocation s3ContentLocation;

  /// The text-format code for a Flink-based Kinesis Data Analytics application.
  @_s.JsonKey(name: 'TextContent')
  final String textContent;

  /// The zip-format code for a Flink-based Kinesis Data Analytics application.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'ZipFileContent')
  final Uint8List zipFileContent;

  CodeContent({
    this.s3ContentLocation,
    this.textContent,
    this.zipFileContent,
  });
  Map<String, dynamic> toJson() => _$CodeContentToJson(this);
}

/// Describes details about the application code for a Flink-based Kinesis Data
/// Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeContentDescription {
  /// The checksum that can be used to validate zip-format code.
  @_s.JsonKey(name: 'CodeMD5')
  final String codeMD5;

  /// The size in bytes of the application code. Can be used to validate
  /// zip-format code.
  @_s.JsonKey(name: 'CodeSize')
  final int codeSize;

  /// The S3 bucket Amazon Resource Name (ARN), file key, and object version of
  /// the application code stored in Amazon S3.
  @_s.JsonKey(name: 'S3ApplicationCodeLocationDescription')
  final S3ApplicationCodeLocationDescription
      s3ApplicationCodeLocationDescription;

  /// The text-format code
  @_s.JsonKey(name: 'TextContent')
  final String textContent;

  CodeContentDescription({
    this.codeMD5,
    this.codeSize,
    this.s3ApplicationCodeLocationDescription,
    this.textContent,
  });
  factory CodeContentDescription.fromJson(Map<String, dynamic> json) =>
      _$CodeContentDescriptionFromJson(json);
}

enum CodeContentType {
  @_s.JsonValue('PLAINTEXT')
  plaintext,
  @_s.JsonValue('ZIPFILE')
  zipfile,
}

/// Describes an update to the code of a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CodeContentUpdate {
  /// Describes an update to the location of code for an application.
  @_s.JsonKey(name: 'S3ContentLocationUpdate')
  final S3ContentLocationUpdate s3ContentLocationUpdate;

  /// Describes an update to the text code for an application.
  @_s.JsonKey(name: 'TextContentUpdate')
  final String textContentUpdate;

  /// Describes an update to the zipped code for an application.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'ZipFileContentUpdate')
  final Uint8List zipFileContentUpdate;

  CodeContentUpdate({
    this.s3ContentLocationUpdate,
    this.textContentUpdate,
    this.zipFileContentUpdate,
  });
  Map<String, dynamic> toJson() => _$CodeContentUpdateToJson(this);
}

enum ConfigurationType {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('CUSTOM')
  custom,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationPresignedUrlResponse {
  /// The URL of the extension.
  @_s.JsonKey(name: 'AuthorizedUrl')
  final String authorizedUrl;

  CreateApplicationPresignedUrlResponse({
    this.authorizedUrl,
  });
  factory CreateApplicationPresignedUrlResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateApplicationPresignedUrlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationResponse {
  /// In response to your <code>CreateApplication</code> request, Kinesis Data
  /// Analytics returns a response with details of the application it created.
  @_s.JsonKey(name: 'ApplicationDetail')
  final ApplicationDetail applicationDetail;

  CreateApplicationResponse({
    @_s.required this.applicationDetail,
  });
  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationSnapshotResponse {
  CreateApplicationSnapshotResponse();
  factory CreateApplicationSnapshotResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateApplicationSnapshotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationCloudWatchLoggingOptionResponse {
  /// The application's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The version ID of the application. Kinesis Data Analytics updates the
  /// <code>ApplicationVersionId</code> each time you change the CloudWatch
  /// logging options.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The descriptions of the remaining CloudWatch logging options for the
  /// application.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionDescriptions')
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  DeleteApplicationCloudWatchLoggingOptionResponse({
    this.applicationARN,
    this.applicationVersionId,
    this.cloudWatchLoggingOptionDescriptions,
  });
  factory DeleteApplicationCloudWatchLoggingOptionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationCloudWatchLoggingOptionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationInputProcessingConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The current application version ID.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  DeleteApplicationInputProcessingConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
  });
  factory DeleteApplicationInputProcessingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationInputProcessingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationOutputResponse {
  /// The application Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The current application version ID.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  DeleteApplicationOutputResponse({
    this.applicationARN,
    this.applicationVersionId,
  });
  factory DeleteApplicationOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApplicationOutputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationReferenceDataSourceResponse {
  /// The application Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The updated version ID of the application.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  DeleteApplicationReferenceDataSourceResponse({
    this.applicationARN,
    this.applicationVersionId,
  });
  factory DeleteApplicationReferenceDataSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationReferenceDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationResponse {
  DeleteApplicationResponse();
  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationSnapshotResponse {
  DeleteApplicationSnapshotResponse();
  factory DeleteApplicationSnapshotResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationSnapshotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationVpcConfigurationResponse {
  /// The ARN of the Kinesis Data Analytics application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// The updated version ID of the application.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  DeleteApplicationVpcConfigurationResponse({
    this.applicationARN,
    this.applicationVersionId,
  });
  factory DeleteApplicationVpcConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationVpcConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeApplicationResponse {
  /// Provides a description of the application, such as the application's Amazon
  /// Resource Name (ARN), status, and latest version.
  @_s.JsonKey(name: 'ApplicationDetail')
  final ApplicationDetail applicationDetail;

  DescribeApplicationResponse({
    @_s.required this.applicationDetail,
  });
  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeApplicationSnapshotResponse {
  /// An object containing information about the application snapshot.
  @_s.JsonKey(name: 'SnapshotDetails')
  final SnapshotDetails snapshotDetails;

  DescribeApplicationSnapshotResponse({
    @_s.required this.snapshotDetails,
  });
  factory DescribeApplicationSnapshotResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeApplicationSnapshotResponseFromJson(json);
}

/// Describes the data format when records are written to the destination in a
/// SQL-based Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationSchema {
  /// Specifies the format of the records on the output stream.
  @_s.JsonKey(name: 'RecordFormatType')
  final RecordFormatType recordFormatType;

  DestinationSchema({
    @_s.required this.recordFormatType,
  });
  factory DestinationSchema.fromJson(Map<String, dynamic> json) =>
      _$DestinationSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationSchemaToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiscoverInputSchemaResponse {
  /// The schema inferred from the streaming source. It identifies the format of
  /// the data in the streaming source and how each data element maps to
  /// corresponding columns in the in-application stream that you can create.
  @_s.JsonKey(name: 'InputSchema')
  final SourceSchema inputSchema;

  /// An array of elements, where each element corresponds to a row in a stream
  /// record (a stream record can have more than one row).
  @_s.JsonKey(name: 'ParsedInputRecords')
  final List<List<String>> parsedInputRecords;

  /// The stream data that was modified by the processor specified in the
  /// <code>InputProcessingConfiguration</code> parameter.
  @_s.JsonKey(name: 'ProcessedInputRecords')
  final List<String> processedInputRecords;

  /// The raw stream data that was sampled to infer the schema.
  @_s.JsonKey(name: 'RawInputRecords')
  final List<String> rawInputRecords;

  DiscoverInputSchemaResponse({
    this.inputSchema,
    this.parsedInputRecords,
    this.processedInputRecords,
    this.rawInputRecords,
  });
  factory DiscoverInputSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscoverInputSchemaResponseFromJson(json);
}

/// Describes execution properties for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EnvironmentProperties {
  /// Describes the execution property groups.
  @_s.JsonKey(name: 'PropertyGroups')
  final List<PropertyGroup> propertyGroups;

  EnvironmentProperties({
    @_s.required this.propertyGroups,
  });
  Map<String, dynamic> toJson() => _$EnvironmentPropertiesToJson(this);
}

/// Describes the execution properties for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnvironmentPropertyDescriptions {
  /// Describes the execution property groups.
  @_s.JsonKey(name: 'PropertyGroupDescriptions')
  final List<PropertyGroup> propertyGroupDescriptions;

  EnvironmentPropertyDescriptions({
    this.propertyGroupDescriptions,
  });
  factory EnvironmentPropertyDescriptions.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentPropertyDescriptionsFromJson(json);
}

/// Describes updates to the execution property groups for a Flink-based Kinesis
/// Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EnvironmentPropertyUpdates {
  /// Describes updates to the execution property groups.
  @_s.JsonKey(name: 'PropertyGroups')
  final List<PropertyGroup> propertyGroups;

  EnvironmentPropertyUpdates({
    @_s.required this.propertyGroups,
  });
  Map<String, dynamic> toJson() => _$EnvironmentPropertyUpdatesToJson(this);
}

/// Describes configuration parameters for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FlinkApplicationConfiguration {
  /// Describes an application's checkpointing configuration. Checkpointing is the
  /// process of persisting application state for fault tolerance. For more
  /// information, see <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/concepts/programming-model.html#checkpoints-for-fault-tolerance">
  /// Checkpoints for Fault Tolerance</a> in the <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/">Apache
  /// Flink Documentation</a>.
  @_s.JsonKey(name: 'CheckpointConfiguration')
  final CheckpointConfiguration checkpointConfiguration;

  /// Describes configuration parameters for Amazon CloudWatch logging for an
  /// application.
  @_s.JsonKey(name: 'MonitoringConfiguration')
  final MonitoringConfiguration monitoringConfiguration;

  /// Describes parameters for how an application executes multiple tasks
  /// simultaneously.
  @_s.JsonKey(name: 'ParallelismConfiguration')
  final ParallelismConfiguration parallelismConfiguration;

  FlinkApplicationConfiguration({
    this.checkpointConfiguration,
    this.monitoringConfiguration,
    this.parallelismConfiguration,
  });
  Map<String, dynamic> toJson() => _$FlinkApplicationConfigurationToJson(this);
}

/// Describes configuration parameters for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlinkApplicationConfigurationDescription {
  /// Describes an application's checkpointing configuration. Checkpointing is the
  /// process of persisting application state for fault tolerance.
  @_s.JsonKey(name: 'CheckpointConfigurationDescription')
  final CheckpointConfigurationDescription checkpointConfigurationDescription;

  /// The job plan for an application. For more information about the job plan,
  /// see <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/internals/job_scheduling.html">Jobs
  /// and Scheduling</a> in the <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/">Apache
  /// Flink Documentation</a>. To retrieve the job plan for the application, use
  /// the <a>DescribeApplicationRequest$IncludeAdditionalDetails</a> parameter of
  /// the <a>DescribeApplication</a> operation.
  @_s.JsonKey(name: 'JobPlanDescription')
  final String jobPlanDescription;

  /// Describes configuration parameters for Amazon CloudWatch logging for an
  /// application.
  @_s.JsonKey(name: 'MonitoringConfigurationDescription')
  final MonitoringConfigurationDescription monitoringConfigurationDescription;

  /// Describes parameters for how an application executes multiple tasks
  /// simultaneously.
  @_s.JsonKey(name: 'ParallelismConfigurationDescription')
  final ParallelismConfigurationDescription parallelismConfigurationDescription;

  FlinkApplicationConfigurationDescription({
    this.checkpointConfigurationDescription,
    this.jobPlanDescription,
    this.monitoringConfigurationDescription,
    this.parallelismConfigurationDescription,
  });
  factory FlinkApplicationConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$FlinkApplicationConfigurationDescriptionFromJson(json);
}

/// Describes updates to the configuration parameters for a Flink-based Kinesis
/// Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FlinkApplicationConfigurationUpdate {
  /// Describes updates to an application's checkpointing configuration.
  /// Checkpointing is the process of persisting application state for fault
  /// tolerance.
  @_s.JsonKey(name: 'CheckpointConfigurationUpdate')
  final CheckpointConfigurationUpdate checkpointConfigurationUpdate;

  /// Describes updates to the configuration parameters for Amazon CloudWatch
  /// logging for an application.
  @_s.JsonKey(name: 'MonitoringConfigurationUpdate')
  final MonitoringConfigurationUpdate monitoringConfigurationUpdate;

  /// Describes updates to the parameters for how an application executes multiple
  /// tasks simultaneously.
  @_s.JsonKey(name: 'ParallelismConfigurationUpdate')
  final ParallelismConfigurationUpdate parallelismConfigurationUpdate;

  FlinkApplicationConfigurationUpdate({
    this.checkpointConfigurationUpdate,
    this.monitoringConfigurationUpdate,
    this.parallelismConfigurationUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$FlinkApplicationConfigurationUpdateToJson(this);
}

/// Describes the starting parameters for a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FlinkRunConfiguration {
  /// When restoring from a snapshot, specifies whether the runtime is allowed to
  /// skip a state that cannot be mapped to the new program. This will happen if
  /// the program is updated between snapshots to remove stateful parameters, and
  /// state data in the snapshot no longer corresponds to valid application data.
  /// For more information, see <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/ops/state/savepoints.html#allowing-non-restored-state">
  /// Allowing Non-Restored State</a> in the <a
  /// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/">Apache
  /// Flink documentation</a>.
  /// <note>
  /// This value defaults to <code>false</code>. If you update your application
  /// without specifying this parameter, <code>AllowNonRestoredState</code> will
  /// be set to <code>false</code>, even if it was previously set to
  /// <code>true</code>.
  /// </note>
  @_s.JsonKey(name: 'AllowNonRestoredState')
  final bool allowNonRestoredState;

  FlinkRunConfiguration({
    this.allowNonRestoredState,
  });
  factory FlinkRunConfiguration.fromJson(Map<String, dynamic> json) =>
      _$FlinkRunConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$FlinkRunConfigurationToJson(this);
}

/// When you configure the application input for a SQL-based Kinesis Data
/// Analytics application, you specify the streaming source, the in-application
/// stream name that is created, and the mapping between the two.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Input {
  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns in the in-application stream that is
  /// being created.
  ///
  /// Also used to describe the format of the reference data source.
  @_s.JsonKey(name: 'InputSchema')
  final SourceSchema inputSchema;

  /// The name prefix to use when creating an in-application stream. Suppose that
  /// you specify a prefix "<code>MyInApplicationStream</code>." Kinesis Data
  /// Analytics then creates one or more (as per the <code>InputParallelism</code>
  /// count you specified) in-application streams with the names
  /// "<code>MyInApplicationStream_001</code>,"
  /// "<code>MyInApplicationStream_002</code>," and so on.
  @_s.JsonKey(name: 'NamePrefix')
  final String namePrefix;

  /// Describes the number of in-application streams to create.
  @_s.JsonKey(name: 'InputParallelism')
  final InputParallelism inputParallelism;

  /// The <a>InputProcessingConfiguration</a> for the input. An input processor
  /// transforms records as they are received from the stream, before the
  /// application's SQL code executes. Currently, the only input processing
  /// configuration available is <a>InputLambdaProcessor</a>.
  @_s.JsonKey(name: 'InputProcessingConfiguration')
  final InputProcessingConfiguration inputProcessingConfiguration;

  /// If the streaming source is an Amazon Kinesis Data Firehose delivery stream,
  /// identifies the delivery stream's ARN.
  @_s.JsonKey(name: 'KinesisFirehoseInput')
  final KinesisFirehoseInput kinesisFirehoseInput;

  /// If the streaming source is an Amazon Kinesis data stream, identifies the
  /// stream's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'KinesisStreamsInput')
  final KinesisStreamsInput kinesisStreamsInput;

  Input({
    @_s.required this.inputSchema,
    @_s.required this.namePrefix,
    this.inputParallelism,
    this.inputProcessingConfiguration,
    this.kinesisFirehoseInput,
    this.kinesisStreamsInput,
  });
  Map<String, dynamic> toJson() => _$InputToJson(this);
}

/// Describes the application input configuration for a SQL-based Kinesis Data
/// Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDescription {
  /// Returns the in-application stream names that are mapped to the stream
  /// source.
  @_s.JsonKey(name: 'InAppStreamNames')
  final List<String> inAppStreamNames;

  /// The input ID that is associated with the application input. This is the ID
  /// that Kinesis Data Analytics assigns to each input configuration that you add
  /// to your application.
  @_s.JsonKey(name: 'InputId')
  final String inputId;

  /// Describes the configured parallelism (number of in-application streams
  /// mapped to the streaming source).
  @_s.JsonKey(name: 'InputParallelism')
  final InputParallelism inputParallelism;

  /// The description of the preprocessor that executes on records in this input
  /// before the application's code is run.
  @_s.JsonKey(name: 'InputProcessingConfigurationDescription')
  final InputProcessingConfigurationDescription
      inputProcessingConfigurationDescription;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns in the in-application stream that is
  /// being created.
  @_s.JsonKey(name: 'InputSchema')
  final SourceSchema inputSchema;

  /// The point at which the application is configured to read from the input
  /// stream.
  @_s.JsonKey(name: 'InputStartingPositionConfiguration')
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  /// If a Kinesis Data Firehose delivery stream is configured as a streaming
  /// source, provides the delivery stream's ARN.
  @_s.JsonKey(name: 'KinesisFirehoseInputDescription')
  final KinesisFirehoseInputDescription kinesisFirehoseInputDescription;

  /// If a Kinesis data stream is configured as a streaming source, provides the
  /// Kinesis data stream's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'KinesisStreamsInputDescription')
  final KinesisStreamsInputDescription kinesisStreamsInputDescription;

  /// The in-application name prefix.
  @_s.JsonKey(name: 'NamePrefix')
  final String namePrefix;

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
  factory InputDescription.fromJson(Map<String, dynamic> json) =>
      _$InputDescriptionFromJson(json);
}

/// An object that contains the Amazon Resource Name (ARN) of the AWS Lambda
/// function that is used to preprocess records in the stream in a SQL-based
/// Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputLambdaProcessor {
  /// The ARN of the AWS Lambda function that operates on records in the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  InputLambdaProcessor({
    @_s.required this.resourceARN,
  });
  Map<String, dynamic> toJson() => _$InputLambdaProcessorToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, an object that contains
/// the Amazon Resource Name (ARN) of the AWS Lambda function that is used to
/// preprocess records in the stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputLambdaProcessorDescription {
  /// The ARN of the AWS Lambda function that is used to preprocess the records in
  /// the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  InputLambdaProcessorDescription({
    @_s.required this.resourceARN,
    this.roleARN,
  });
  factory InputLambdaProcessorDescription.fromJson(Map<String, dynamic> json) =>
      _$InputLambdaProcessorDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, represents an update to
/// the <a>InputLambdaProcessor</a> that is used to preprocess the records in
/// the stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputLambdaProcessorUpdate {
  /// The Amazon Resource Name (ARN) of the new AWS Lambda function that is used
  /// to preprocess the records in the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  InputLambdaProcessorUpdate({
    @_s.required this.resourceARNUpdate,
  });
  Map<String, dynamic> toJson() => _$InputLambdaProcessorUpdateToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes the number of
/// in-application streams to create for a given streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputParallelism {
  /// The number of in-application streams to create.
  @_s.JsonKey(name: 'Count')
  final int count;

  InputParallelism({
    this.count,
  });
  factory InputParallelism.fromJson(Map<String, dynamic> json) =>
      _$InputParallelismFromJson(json);

  Map<String, dynamic> toJson() => _$InputParallelismToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, provides updates to the
/// parallelism count.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputParallelismUpdate {
  /// The number of in-application streams to create for the specified streaming
  /// source.
  @_s.JsonKey(name: 'CountUpdate')
  final int countUpdate;

  InputParallelismUpdate({
    @_s.required this.countUpdate,
  });
  Map<String, dynamic> toJson() => _$InputParallelismUpdateToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes a processor
/// that is used to preprocess the records in the stream before being processed
/// by your application code. Currently, the only input processor available is
/// <a href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputProcessingConfiguration {
  /// The <a>InputLambdaProcessor</a> that is used to preprocess the records in
  /// the stream before being processed by your application code.
  @_s.JsonKey(name: 'InputLambdaProcessor')
  final InputLambdaProcessor inputLambdaProcessor;

  InputProcessingConfiguration({
    @_s.required this.inputLambdaProcessor,
  });
  Map<String, dynamic> toJson() => _$InputProcessingConfigurationToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, provides the
/// configuration information about an input processor. Currently, the only
/// input processor available is <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputProcessingConfigurationDescription {
  /// Provides configuration information about the associated
  /// <a>InputLambdaProcessorDescription</a>
  @_s.JsonKey(name: 'InputLambdaProcessorDescription')
  final InputLambdaProcessorDescription inputLambdaProcessorDescription;

  InputProcessingConfigurationDescription({
    this.inputLambdaProcessorDescription,
  });
  factory InputProcessingConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$InputProcessingConfigurationDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, describes updates to an
/// <a>InputProcessingConfiguration</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputProcessingConfigurationUpdate {
  /// Provides update information for an <a>InputLambdaProcessor</a>.
  @_s.JsonKey(name: 'InputLambdaProcessorUpdate')
  final InputLambdaProcessorUpdate inputLambdaProcessorUpdate;

  InputProcessingConfigurationUpdate({
    @_s.required this.inputLambdaProcessorUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$InputProcessingConfigurationUpdateToJson(this);
}

/// Describes updates for an SQL-based Kinesis Data Analytics application's
/// input schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputSchemaUpdate {
  /// A list of <code>RecordColumn</code> objects. Each object describes the
  /// mapping of the streaming source element to the corresponding column in the
  /// in-application stream.
  @_s.JsonKey(name: 'RecordColumnUpdates')
  final List<RecordColumn> recordColumnUpdates;

  /// Specifies the encoding of the records in the streaming source; for example,
  /// UTF-8.
  @_s.JsonKey(name: 'RecordEncodingUpdate')
  final String recordEncodingUpdate;

  /// Specifies the format of the records on the streaming source.
  @_s.JsonKey(name: 'RecordFormatUpdate')
  final RecordFormat recordFormatUpdate;

  InputSchemaUpdate({
    this.recordColumnUpdates,
    this.recordEncodingUpdate,
    this.recordFormatUpdate,
  });
  Map<String, dynamic> toJson() => _$InputSchemaUpdateToJson(this);
}

enum InputStartingPosition {
  @_s.JsonValue('NOW')
  now,
  @_s.JsonValue('TRIM_HORIZON')
  trimHorizon,
  @_s.JsonValue('LAST_STOPPED_POINT')
  lastStoppedPoint,
}

/// Describes the point at which the application reads from the streaming
/// source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'InputStartingPosition')
  final InputStartingPosition inputStartingPosition;

  InputStartingPositionConfiguration({
    this.inputStartingPosition,
  });
  factory InputStartingPositionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$InputStartingPositionConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InputStartingPositionConfigurationToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes updates to a
/// specific input configuration (identified by the <code>InputId</code> of an
/// application).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputUpdate {
  /// The input ID of the application input to be updated.
  @_s.JsonKey(name: 'InputId')
  final String inputId;

  /// Describes the parallelism updates (the number of in-application streams
  /// Kinesis Data Analytics creates for the specific streaming source).
  @_s.JsonKey(name: 'InputParallelismUpdate')
  final InputParallelismUpdate inputParallelismUpdate;

  /// Describes updates to an <a>InputProcessingConfiguration</a>.
  @_s.JsonKey(name: 'InputProcessingConfigurationUpdate')
  final InputProcessingConfigurationUpdate inputProcessingConfigurationUpdate;

  /// Describes the data format on the streaming source, and how record elements
  /// on the streaming source map to columns of the in-application stream that is
  /// created.
  @_s.JsonKey(name: 'InputSchemaUpdate')
  final InputSchemaUpdate inputSchemaUpdate;

  /// If a Kinesis Data Firehose delivery stream is the streaming source to be
  /// updated, provides an updated stream ARN.
  @_s.JsonKey(name: 'KinesisFirehoseInputUpdate')
  final KinesisFirehoseInputUpdate kinesisFirehoseInputUpdate;

  /// If a Kinesis data stream is the streaming source to be updated, provides an
  /// updated stream Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'KinesisStreamsInputUpdate')
  final KinesisStreamsInputUpdate kinesisStreamsInputUpdate;

  /// The name prefix for in-application streams that Kinesis Data Analytics
  /// creates for the specific streaming source.
  @_s.JsonKey(name: 'NamePrefixUpdate')
  final String namePrefixUpdate;

  InputUpdate({
    @_s.required this.inputId,
    this.inputParallelismUpdate,
    this.inputProcessingConfigurationUpdate,
    this.inputSchemaUpdate,
    this.kinesisFirehoseInputUpdate,
    this.kinesisStreamsInputUpdate,
    this.namePrefixUpdate,
  });
  Map<String, dynamic> toJson() => _$InputUpdateToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, provides additional
/// mapping information when JSON is the record format on the streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JSONMappingParameters {
  /// The path to the top-level parent that contains the records.
  @_s.JsonKey(name: 'RecordRowPath')
  final String recordRowPath;

  JSONMappingParameters({
    @_s.required this.recordRowPath,
  });
  factory JSONMappingParameters.fromJson(Map<String, dynamic> json) =>
      _$JSONMappingParametersFromJson(json);

  Map<String, dynamic> toJson() => _$JSONMappingParametersToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, identifies a Kinesis
/// Data Firehose delivery stream as the streaming source. You provide the
/// delivery stream's Amazon Resource Name (ARN).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseInput {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  KinesisFirehoseInput({
    @_s.required this.resourceARN,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseInputToJson(this);
}

/// Describes the Amazon Kinesis Data Firehose delivery stream that is
/// configured as the streaming source in the application input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisFirehoseInputDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics assumes to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisFirehoseInputDescription({
    @_s.required this.resourceARN,
    this.roleARN,
  });
  factory KinesisFirehoseInputDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisFirehoseInputDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, when updating
/// application input configuration, provides information about a Kinesis Data
/// Firehose delivery stream as the streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseInputUpdate {
  /// The Amazon Resource Name (ARN) of the input delivery stream to read.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  KinesisFirehoseInputUpdate({
    @_s.required this.resourceARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseInputUpdateToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, when configuring
/// application output, identifies a Kinesis Data Firehose delivery stream as
/// the destination. You provide the stream Amazon Resource Name (ARN) of the
/// delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseOutput {
  /// The ARN of the destination delivery stream to write to.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  KinesisFirehoseOutput({
    @_s.required this.resourceARN,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseOutputToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application's output, describes the
/// Kinesis Data Firehose delivery stream that is configured as its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisFirehoseOutputDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisFirehoseOutputDescription({
    @_s.required this.resourceARN,
    this.roleARN,
  });
  factory KinesisFirehoseOutputDescription.fromJson(
          Map<String, dynamic> json) =>
      _$KinesisFirehoseOutputDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, when updating an output
/// configuration using the <a>UpdateApplication</a> operation, provides
/// information about a Kinesis Data Firehose delivery stream that is configured
/// as the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseOutputUpdate {
  /// The Amazon Resource Name (ARN) of the delivery stream to write to.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  KinesisFirehoseOutputUpdate({
    @_s.required this.resourceARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseOutputUpdateToJson(this);
}

/// Identifies a Kinesis data stream as the streaming source. You provide the
/// stream's Amazon Resource Name (ARN).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsInput {
  /// The ARN of the input Kinesis data stream to read.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  KinesisStreamsInput({
    @_s.required this.resourceARN,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsInputToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes the Kinesis
/// data stream that is configured as the streaming source in the application
/// input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisStreamsInputDescription {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamsInputDescription({
    @_s.required this.resourceARN,
    this.roleARN,
  });
  factory KinesisStreamsInputDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisStreamsInputDescriptionFromJson(json);
}

/// When you update the input configuration for a SQL-based Kinesis Data
/// Analytics application, provides information about a Kinesis stream as the
/// streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsInputUpdate {
  /// The Amazon Resource Name (ARN) of the input Kinesis data stream to read.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  KinesisStreamsInputUpdate({
    @_s.required this.resourceARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsInputUpdateToJson(this);
}

/// When you configure a SQL-based Kinesis Data Analytics application's output,
/// identifies a Kinesis data stream as the destination. You provide the stream
/// Amazon Resource Name (ARN).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsOutput {
  /// The ARN of the destination Kinesis data stream to write to.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  KinesisStreamsOutput({
    @_s.required this.resourceARN,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsOutputToJson(this);
}

/// For an SQL-based Kinesis Data Analytics application's output, describes the
/// Kinesis data stream that is configured as its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisStreamsOutputDescription {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to access the
  /// stream.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamsOutputDescription({
    @_s.required this.resourceARN,
    this.roleARN,
  });
  factory KinesisStreamsOutputDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisStreamsOutputDescriptionFromJson(json);
}

/// When you update a SQL-based Kinesis Data Analytics application's output
/// configuration using the <a>UpdateApplication</a> operation, provides
/// information about a Kinesis data stream that is configured as the
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsOutputUpdate {
  /// The Amazon Resource Name (ARN) of the Kinesis data stream where you want to
  /// write the output.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  KinesisStreamsOutputUpdate({
    @_s.required this.resourceARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsOutputUpdateToJson(this);
}

/// When you configure a SQL-based Kinesis Data Analytics application's output,
/// identifies an AWS Lambda function as the destination. You provide the
/// function Amazon Resource Name (ARN) of the Lambda function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaOutput {
  /// The Amazon Resource Name (ARN) of the destination Lambda function to write
  /// to.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  LambdaOutput({
    @_s.required this.resourceARN,
  });
  Map<String, dynamic> toJson() => _$LambdaOutputToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application's output, describes the
/// AWS Lambda function that is configured as its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaOutputDescription {
  /// The Amazon Resource Name (ARN) of the destination Lambda function.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to write to
  /// the destination function.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  LambdaOutputDescription({
    @_s.required this.resourceARN,
    this.roleARN,
  });
  factory LambdaOutputDescription.fromJson(Map<String, dynamic> json) =>
      _$LambdaOutputDescriptionFromJson(json);
}

/// When you update an SQL-based Kinesis Data Analytics application's output
/// configuration using the <a>UpdateApplication</a> operation, provides
/// information about an AWS Lambda function that is configured as the
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaOutputUpdate {
  /// The Amazon Resource Name (ARN) of the destination AWS Lambda function.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  LambdaOutputUpdate({
    @_s.required this.resourceARNUpdate,
  });
  Map<String, dynamic> toJson() => _$LambdaOutputUpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationSnapshotsResponse {
  /// The token for the next set of results, or <code>null</code> if there are no
  /// additional results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A collection of objects containing information about the application
  /// snapshots.
  @_s.JsonKey(name: 'SnapshotSummaries')
  final List<SnapshotDetails> snapshotSummaries;

  ListApplicationSnapshotsResponse({
    this.nextToken,
    this.snapshotSummaries,
  });
  factory ListApplicationSnapshotsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListApplicationSnapshotsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationsResponse {
  /// A list of <code>ApplicationSummary</code> objects.
  @_s.JsonKey(name: 'ApplicationSummaries')
  final List<ApplicationSummary> applicationSummaries;

  /// The pagination token for the next set of results, or <code>null</code> if
  /// there are no additional results. Pass this token into a subsequent command
  /// to retrieve the next set of items For more information about pagination, see
  /// <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Using
  /// the AWS Command Line Interface's Pagination Options</a>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListApplicationsResponse({
    @_s.required this.applicationSummaries,
    this.nextToken,
  });
  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The key-value tags assigned to the application.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LogLevel {
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('WARN')
  warn,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('DEBUG')
  debug,
}

/// When you configure a SQL-based Kinesis Data Analytics application's input at
/// the time of creating or updating an application, provides additional mapping
/// information specific to the record format (such as JSON, CSV, or record
/// fields delimited by some delimiter) on the streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MappingParameters {
  /// Provides additional mapping information when the record format uses
  /// delimiters (for example, CSV).
  @_s.JsonKey(name: 'CSVMappingParameters')
  final CSVMappingParameters cSVMappingParameters;

  /// Provides additional mapping information when JSON is the record format on
  /// the streaming source.
  @_s.JsonKey(name: 'JSONMappingParameters')
  final JSONMappingParameters jSONMappingParameters;

  MappingParameters({
    this.cSVMappingParameters,
    this.jSONMappingParameters,
  });
  factory MappingParameters.fromJson(Map<String, dynamic> json) =>
      _$MappingParametersFromJson(json);

  Map<String, dynamic> toJson() => _$MappingParametersToJson(this);
}

enum MetricsLevel {
  @_s.JsonValue('APPLICATION')
  application,
  @_s.JsonValue('TASK')
  task,
  @_s.JsonValue('OPERATOR')
  operator,
  @_s.JsonValue('PARALLELISM')
  parallelism,
}

/// Describes configuration parameters for Amazon CloudWatch logging for a
/// Flink-based Kinesis Data Analytics application. For more information about
/// CloudWatch logging, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/monitoring-overview.html">Monitoring</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MonitoringConfiguration {
  /// Describes whether to use the default CloudWatch logging configuration for an
  /// application. You must set this property to <code>CUSTOM</code> in order to
  /// set the <code>LogLevel</code> or <code>MetricsLevel</code> parameters.
  @_s.JsonKey(name: 'ConfigurationType')
  final ConfigurationType configurationType;

  /// Describes the verbosity of the CloudWatch Logs for an application.
  @_s.JsonKey(name: 'LogLevel')
  final LogLevel logLevel;

  /// Describes the granularity of the CloudWatch Logs for an application. The
  /// <code>Parallelism</code> level is not recommended for applications with a
  /// Parallelism over 64 due to excessive costs.
  @_s.JsonKey(name: 'MetricsLevel')
  final MetricsLevel metricsLevel;

  MonitoringConfiguration({
    @_s.required this.configurationType,
    this.logLevel,
    this.metricsLevel,
  });
  Map<String, dynamic> toJson() => _$MonitoringConfigurationToJson(this);
}

/// Describes configuration parameters for CloudWatch logging for a Flink-based
/// Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonitoringConfigurationDescription {
  /// Describes whether to use the default CloudWatch logging configuration for an
  /// application.
  @_s.JsonKey(name: 'ConfigurationType')
  final ConfigurationType configurationType;

  /// Describes the verbosity of the CloudWatch Logs for an application.
  @_s.JsonKey(name: 'LogLevel')
  final LogLevel logLevel;

  /// Describes the granularity of the CloudWatch Logs for an application.
  @_s.JsonKey(name: 'MetricsLevel')
  final MetricsLevel metricsLevel;

  MonitoringConfigurationDescription({
    this.configurationType,
    this.logLevel,
    this.metricsLevel,
  });
  factory MonitoringConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$MonitoringConfigurationDescriptionFromJson(json);
}

/// Describes updates to configuration parameters for Amazon CloudWatch logging
/// for a Flink-based Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MonitoringConfigurationUpdate {
  /// Describes updates to whether to use the default CloudWatch logging
  /// configuration for an application. You must set this property to
  /// <code>CUSTOM</code> in order to set the <code>LogLevel</code> or
  /// <code>MetricsLevel</code> parameters.
  @_s.JsonKey(name: 'ConfigurationTypeUpdate')
  final ConfigurationType configurationTypeUpdate;

  /// Describes updates to the verbosity of the CloudWatch Logs for an
  /// application.
  @_s.JsonKey(name: 'LogLevelUpdate')
  final LogLevel logLevelUpdate;

  /// Describes updates to the granularity of the CloudWatch Logs for an
  /// application. The <code>Parallelism</code> level is not recommended for
  /// applications with a Parallelism over 64 due to excessive costs.
  @_s.JsonKey(name: 'MetricsLevelUpdate')
  final MetricsLevel metricsLevelUpdate;

  MonitoringConfigurationUpdate({
    this.configurationTypeUpdate,
    this.logLevelUpdate,
    this.metricsLevelUpdate,
  });
  Map<String, dynamic> toJson() => _$MonitoringConfigurationUpdateToJson(this);
}

/// Describes a SQL-based Kinesis Data Analytics application's output
/// configuration, in which you identify an in-application stream and a
/// destination where you want the in-application stream data to be written. The
/// destination can be a Kinesis data stream or a Kinesis Data Firehose delivery
/// stream.
/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Output {
  /// Describes the data format when records are written to the destination.
  @_s.JsonKey(name: 'DestinationSchema')
  final DestinationSchema destinationSchema;

  /// The name of the in-application stream.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Identifies a Kinesis Data Firehose delivery stream as the destination.
  @_s.JsonKey(name: 'KinesisFirehoseOutput')
  final KinesisFirehoseOutput kinesisFirehoseOutput;

  /// Identifies a Kinesis data stream as the destination.
  @_s.JsonKey(name: 'KinesisStreamsOutput')
  final KinesisStreamsOutput kinesisStreamsOutput;

  /// Identifies an AWS Lambda function as the destination.
  @_s.JsonKey(name: 'LambdaOutput')
  final LambdaOutput lambdaOutput;

  Output({
    @_s.required this.destinationSchema,
    @_s.required this.name,
    this.kinesisFirehoseOutput,
    this.kinesisStreamsOutput,
    this.lambdaOutput,
  });
  Map<String, dynamic> toJson() => _$OutputToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes the
/// application output configuration, which includes the in-application stream
/// name and the destination where the stream data is written. The destination
/// can be a Kinesis data stream or a Kinesis Data Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputDescription {
  /// The data format used for writing data to the destination.
  @_s.JsonKey(name: 'DestinationSchema')
  final DestinationSchema destinationSchema;

  /// Describes the Kinesis Data Firehose delivery stream that is configured as
  /// the destination where output is written.
  @_s.JsonKey(name: 'KinesisFirehoseOutputDescription')
  final KinesisFirehoseOutputDescription kinesisFirehoseOutputDescription;

  /// Describes the Kinesis data stream that is configured as the destination
  /// where output is written.
  @_s.JsonKey(name: 'KinesisStreamsOutputDescription')
  final KinesisStreamsOutputDescription kinesisStreamsOutputDescription;

  /// Describes the Lambda function that is configured as the destination where
  /// output is written.
  @_s.JsonKey(name: 'LambdaOutputDescription')
  final LambdaOutputDescription lambdaOutputDescription;

  /// The name of the in-application stream that is configured as output.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A unique identifier for the output configuration.
  @_s.JsonKey(name: 'OutputId')
  final String outputId;

  OutputDescription({
    this.destinationSchema,
    this.kinesisFirehoseOutputDescription,
    this.kinesisStreamsOutputDescription,
    this.lambdaOutputDescription,
    this.name,
    this.outputId,
  });
  factory OutputDescription.fromJson(Map<String, dynamic> json) =>
      _$OutputDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, describes updates to the
/// output configuration identified by the <code>OutputId</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OutputUpdate {
  /// Identifies the specific output configuration that you want to update.
  @_s.JsonKey(name: 'OutputId')
  final String outputId;

  /// Describes the data format when records are written to the destination.
  @_s.JsonKey(name: 'DestinationSchemaUpdate')
  final DestinationSchema destinationSchemaUpdate;

  /// Describes a Kinesis Data Firehose delivery stream as the destination for the
  /// output.
  @_s.JsonKey(name: 'KinesisFirehoseOutputUpdate')
  final KinesisFirehoseOutputUpdate kinesisFirehoseOutputUpdate;

  /// Describes a Kinesis data stream as the destination for the output.
  @_s.JsonKey(name: 'KinesisStreamsOutputUpdate')
  final KinesisStreamsOutputUpdate kinesisStreamsOutputUpdate;

  /// Describes an AWS Lambda function as the destination for the output.
  @_s.JsonKey(name: 'LambdaOutputUpdate')
  final LambdaOutputUpdate lambdaOutputUpdate;

  /// If you want to specify a different in-application stream for this output
  /// configuration, use this field to specify the new in-application stream name.
  @_s.JsonKey(name: 'NameUpdate')
  final String nameUpdate;

  OutputUpdate({
    @_s.required this.outputId,
    this.destinationSchemaUpdate,
    this.kinesisFirehoseOutputUpdate,
    this.kinesisStreamsOutputUpdate,
    this.lambdaOutputUpdate,
    this.nameUpdate,
  });
  Map<String, dynamic> toJson() => _$OutputUpdateToJson(this);
}

/// Describes parameters for how a Flink-based Kinesis Data Analytics
/// application application executes multiple tasks simultaneously. For more
/// information about parallelism, see <a
/// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/dev/parallel.html">Parallel
/// Execution</a> in the <a
/// href="https://ci.apache.org/projects/flink/flink-docs-release-1.8/">Apache
/// Flink Documentation</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParallelismConfiguration {
  /// Describes whether the application uses the default parallelism for the
  /// Kinesis Data Analytics service. You must set this property to
  /// <code>CUSTOM</code> in order to change your application's
  /// <code>AutoScalingEnabled</code>, <code>Parallelism</code>, or
  /// <code>ParallelismPerKPU</code> properties.
  @_s.JsonKey(name: 'ConfigurationType')
  final ConfigurationType configurationType;

  /// Describes whether the Kinesis Data Analytics service can increase the
  /// parallelism of the application in response to increased throughput.
  @_s.JsonKey(name: 'AutoScalingEnabled')
  final bool autoScalingEnabled;

  /// Describes the initial number of parallel tasks that a Flink-based Kinesis
  /// Data Analytics application can perform. If <code>AutoScalingEnabled</code>
  /// is set to True, Kinesis Data Analytics increases the
  /// <code>CurrentParallelism</code> value in response to application load. The
  /// service can increase the <code>CurrentParallelism</code> value up to the
  /// maximum parallelism, which is <code>ParalellismPerKPU</code> times the
  /// maximum KPUs for the application. The maximum KPUs for an application is 32
  /// by default, and can be increased by requesting a limit increase. If
  /// application load is reduced, the service can reduce the
  /// <code>CurrentParallelism</code> value down to the <code>Parallelism</code>
  /// setting.
  @_s.JsonKey(name: 'Parallelism')
  final int parallelism;

  /// Describes the number of parallel tasks that a Flink-based Kinesis Data
  /// Analytics application can perform per Kinesis Processing Unit (KPU) used by
  /// the application. For more information about KPUs, see <a
  /// href="http://aws.amazon.com/kinesis/data-analytics/pricing/">Amazon Kinesis
  /// Data Analytics Pricing</a>.
  @_s.JsonKey(name: 'ParallelismPerKPU')
  final int parallelismPerKPU;

  ParallelismConfiguration({
    @_s.required this.configurationType,
    this.autoScalingEnabled,
    this.parallelism,
    this.parallelismPerKPU,
  });
  Map<String, dynamic> toJson() => _$ParallelismConfigurationToJson(this);
}

/// Describes parameters for how a Flink-based Kinesis Data Analytics
/// application executes multiple tasks simultaneously.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ParallelismConfigurationDescription {
  /// Describes whether the Kinesis Data Analytics service can increase the
  /// parallelism of the application in response to increased throughput.
  @_s.JsonKey(name: 'AutoScalingEnabled')
  final bool autoScalingEnabled;

  /// Describes whether the application uses the default parallelism for the
  /// Kinesis Data Analytics service.
  @_s.JsonKey(name: 'ConfigurationType')
  final ConfigurationType configurationType;

  /// Describes the current number of parallel tasks that a Flink-based Kinesis
  /// Data Analytics application can perform. If <code>AutoScalingEnabled</code>
  /// is set to True, Kinesis Data Analytics can increase this value in response
  /// to application load. The service can increase this value up to the maximum
  /// parallelism, which is <code>ParalellismPerKPU</code> times the maximum KPUs
  /// for the application. The maximum KPUs for an application is 32 by default,
  /// and can be increased by requesting a limit increase. If application load is
  /// reduced, the service can reduce the <code>CurrentParallelism</code> value
  /// down to the <code>Parallelism</code> setting.
  @_s.JsonKey(name: 'CurrentParallelism')
  final int currentParallelism;

  /// Describes the initial number of parallel tasks that a Flink-based Kinesis
  /// Data Analytics application can perform. If <code>AutoScalingEnabled</code>
  /// is set to True, then Kinesis Data Analytics can increase the
  /// <code>CurrentParallelism</code> value in response to application load. The
  /// service can increase <code>CurrentParallelism</code> up to the maximum
  /// parallelism, which is <code>ParalellismPerKPU</code> times the maximum KPUs
  /// for the application. The maximum KPUs for an application is 32 by default,
  /// and can be increased by requesting a limit increase. If application load is
  /// reduced, the service can reduce the <code>CurrentParallelism</code> value
  /// down to the <code>Parallelism</code> setting.
  @_s.JsonKey(name: 'Parallelism')
  final int parallelism;

  /// Describes the number of parallel tasks that a Flink-based Kinesis Data
  /// Analytics application can perform per Kinesis Processing Unit (KPU) used by
  /// the application.
  @_s.JsonKey(name: 'ParallelismPerKPU')
  final int parallelismPerKPU;

  ParallelismConfigurationDescription({
    this.autoScalingEnabled,
    this.configurationType,
    this.currentParallelism,
    this.parallelism,
    this.parallelismPerKPU,
  });
  factory ParallelismConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ParallelismConfigurationDescriptionFromJson(json);
}

/// Describes updates to parameters for how a Flink-based Kinesis Data Analytics
/// application executes multiple tasks simultaneously.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ParallelismConfigurationUpdate {
  /// Describes updates to whether the Kinesis Data Analytics service can increase
  /// the parallelism of the application in response to increased throughput.
  @_s.JsonKey(name: 'AutoScalingEnabledUpdate')
  final bool autoScalingEnabledUpdate;

  /// Describes updates to whether the application uses the default parallelism
  /// for the Kinesis Data Analytics service, or if a custom parallelism is used.
  /// You must set this property to <code>CUSTOM</code> in order to change your
  /// application's <code>AutoScalingEnabled</code>, <code>Parallelism</code>, or
  /// <code>ParallelismPerKPU</code> properties.
  @_s.JsonKey(name: 'ConfigurationTypeUpdate')
  final ConfigurationType configurationTypeUpdate;

  /// Describes updates to the number of parallel tasks an application can perform
  /// per Kinesis Processing Unit (KPU) used by the application.
  @_s.JsonKey(name: 'ParallelismPerKPUUpdate')
  final int parallelismPerKPUUpdate;

  /// Describes updates to the initial number of parallel tasks an application can
  /// perform. If <code>AutoScalingEnabled</code> is set to True, then Kinesis
  /// Data Analytics can increase the <code>CurrentParallelism</code> value in
  /// response to application load. The service can increase
  /// <code>CurrentParallelism</code> up to the maximum parallelism, which is
  /// <code>ParalellismPerKPU</code> times the maximum KPUs for the application.
  /// The maximum KPUs for an application is 32 by default, and can be increased
  /// by requesting a limit increase. If application load is reduced, the service
  /// will reduce <code>CurrentParallelism</code> down to the
  /// <code>Parallelism</code> setting.
  @_s.JsonKey(name: 'ParallelismUpdate')
  final int parallelismUpdate;

  ParallelismConfigurationUpdate({
    this.autoScalingEnabledUpdate,
    this.configurationTypeUpdate,
    this.parallelismPerKPUUpdate,
    this.parallelismUpdate,
  });
  Map<String, dynamic> toJson() => _$ParallelismConfigurationUpdateToJson(this);
}

/// Property key-value pairs passed into a Flink-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PropertyGroup {
  /// Describes the key of an application execution property key-value pair.
  @_s.JsonKey(name: 'PropertyGroupId')
  final String propertyGroupId;

  /// Describes the value of an application execution property key-value pair.
  @_s.JsonKey(name: 'PropertyMap')
  final Map<String, String> propertyMap;

  PropertyGroup({
    @_s.required this.propertyGroupId,
    @_s.required this.propertyMap,
  });
  factory PropertyGroup.fromJson(Map<String, dynamic> json) =>
      _$PropertyGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyGroupToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes the mapping of
/// each data element in the streaming source to the corresponding column in the
/// in-application stream.
///
/// Also used to describe the format of the reference data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecordColumn {
  /// The name of the column that is created in the in-application input stream or
  /// reference table.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of column created in the in-application input stream or reference
  /// table.
  @_s.JsonKey(name: 'SqlType')
  final String sqlType;

  /// A reference to the data element in the streaming input or the reference data
  /// source.
  @_s.JsonKey(name: 'Mapping')
  final String mapping;

  RecordColumn({
    @_s.required this.name,
    @_s.required this.sqlType,
    this.mapping,
  });
  factory RecordColumn.fromJson(Map<String, dynamic> json) =>
      _$RecordColumnFromJson(json);

  Map<String, dynamic> toJson() => _$RecordColumnToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes the record
/// format and relevant mapping information that should be applied to schematize
/// the records on the stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecordFormat {
  /// The type of record format.
  @_s.JsonKey(name: 'RecordFormatType')
  final RecordFormatType recordFormatType;

  /// When you configure application input at the time of creating or updating an
  /// application, provides additional mapping information specific to the record
  /// format (such as JSON, CSV, or record fields delimited by some delimiter) on
  /// the streaming source.
  @_s.JsonKey(name: 'MappingParameters')
  final MappingParameters mappingParameters;

  RecordFormat({
    @_s.required this.recordFormatType,
    this.mappingParameters,
  });
  factory RecordFormat.fromJson(Map<String, dynamic> json) =>
      _$RecordFormatFromJson(json);

  Map<String, dynamic> toJson() => _$RecordFormatToJson(this);
}

enum RecordFormatType {
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('CSV')
  csv,
}

/// For a SQL-based Kinesis Data Analytics application, describes the reference
/// data source by providing the source information (Amazon S3 bucket name and
/// object key name), the resulting in-application table name that is created,
/// and the necessary schema to map the data elements in the Amazon S3 object to
/// the in-application table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReferenceDataSource {
  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  @_s.JsonKey(name: 'ReferenceSchema')
  final SourceSchema referenceSchema;

  /// The name of the in-application table to create.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// Identifies the S3 bucket and object that contains the reference data. A
  /// Kinesis Data Analytics application loads reference data only once. If the
  /// data changes, you call the <a>UpdateApplication</a> operation to trigger
  /// reloading of data into your application.
  @_s.JsonKey(name: 'S3ReferenceDataSource')
  final S3ReferenceDataSource s3ReferenceDataSource;

  ReferenceDataSource({
    @_s.required this.referenceSchema,
    @_s.required this.tableName,
    this.s3ReferenceDataSource,
  });
  Map<String, dynamic> toJson() => _$ReferenceDataSourceToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, describes the reference
/// data source configured for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReferenceDataSourceDescription {
  /// The ID of the reference data source. This is the ID that Kinesis Data
  /// Analytics assigns when you add the reference data source to your application
  /// using the <a>CreateApplication</a> or <a>UpdateApplication</a> operation.
  @_s.JsonKey(name: 'ReferenceId')
  final String referenceId;

  /// Provides the Amazon S3 bucket name, the object key name that contains the
  /// reference data.
  @_s.JsonKey(name: 'S3ReferenceDataSourceDescription')
  final S3ReferenceDataSourceDescription s3ReferenceDataSourceDescription;

  /// The in-application table name created by the specific reference data source
  /// configuration.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  @_s.JsonKey(name: 'ReferenceSchema')
  final SourceSchema referenceSchema;

  ReferenceDataSourceDescription({
    @_s.required this.referenceId,
    @_s.required this.s3ReferenceDataSourceDescription,
    @_s.required this.tableName,
    this.referenceSchema,
  });
  factory ReferenceDataSourceDescription.fromJson(Map<String, dynamic> json) =>
      _$ReferenceDataSourceDescriptionFromJson(json);
}

/// When you update a reference data source configuration for a SQL-based
/// Kinesis Data Analytics application, this object provides all the updated
/// values (such as the source bucket name and object key name), the
/// in-application table name that is created, and updated mapping information
/// that maps the data in the Amazon S3 object to the in-application reference
/// table that is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReferenceDataSourceUpdate {
  /// The ID of the reference data source that is being updated. You can use the
  /// <a>DescribeApplication</a> operation to get this value.
  @_s.JsonKey(name: 'ReferenceId')
  final String referenceId;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  @_s.JsonKey(name: 'ReferenceSchemaUpdate')
  final SourceSchema referenceSchemaUpdate;

  /// Describes the S3 bucket name, object key name, and IAM role that Kinesis
  /// Data Analytics can assume to read the Amazon S3 object on your behalf and
  /// populate the in-application reference table.
  @_s.JsonKey(name: 'S3ReferenceDataSourceUpdate')
  final S3ReferenceDataSourceUpdate s3ReferenceDataSourceUpdate;

  /// The in-application table name that is created by this update.
  @_s.JsonKey(name: 'TableNameUpdate')
  final String tableNameUpdate;

  ReferenceDataSourceUpdate({
    @_s.required this.referenceId,
    this.referenceSchemaUpdate,
    this.s3ReferenceDataSourceUpdate,
    this.tableNameUpdate,
  });
  Map<String, dynamic> toJson() => _$ReferenceDataSourceUpdateToJson(this);
}

/// Describes the starting parameters for an Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RunConfiguration {
  /// Describes the restore behavior of a restarting application.
  @_s.JsonKey(name: 'ApplicationRestoreConfiguration')
  final ApplicationRestoreConfiguration applicationRestoreConfiguration;

  /// Describes the starting parameters for a Flink-based Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'FlinkRunConfiguration')
  final FlinkRunConfiguration flinkRunConfiguration;

  /// Describes the starting parameters for a SQL-based Kinesis Data Analytics
  /// application application.
  @_s.JsonKey(name: 'SqlRunConfigurations')
  final List<SqlRunConfiguration> sqlRunConfigurations;

  RunConfiguration({
    this.applicationRestoreConfiguration,
    this.flinkRunConfiguration,
    this.sqlRunConfigurations,
  });
  Map<String, dynamic> toJson() => _$RunConfigurationToJson(this);
}

/// Describes the starting properties for a Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RunConfigurationDescription {
  /// Describes the restore behavior of a restarting application.
  @_s.JsonKey(name: 'ApplicationRestoreConfigurationDescription')
  final ApplicationRestoreConfiguration
      applicationRestoreConfigurationDescription;
  @_s.JsonKey(name: 'FlinkRunConfigurationDescription')
  final FlinkRunConfiguration flinkRunConfigurationDescription;

  RunConfigurationDescription({
    this.applicationRestoreConfigurationDescription,
    this.flinkRunConfigurationDescription,
  });
  factory RunConfigurationDescription.fromJson(Map<String, dynamic> json) =>
      _$RunConfigurationDescriptionFromJson(json);
}

/// Describes the updates to the starting parameters for a Kinesis Data
/// Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RunConfigurationUpdate {
  /// Describes updates to the restore behavior of a restarting application.
  @_s.JsonKey(name: 'ApplicationRestoreConfiguration')
  final ApplicationRestoreConfiguration applicationRestoreConfiguration;

  /// Describes the starting parameters for a Flink-based Kinesis Data Analytics
  /// application.
  @_s.JsonKey(name: 'FlinkRunConfiguration')
  final FlinkRunConfiguration flinkRunConfiguration;

  RunConfigurationUpdate({
    this.applicationRestoreConfiguration,
    this.flinkRunConfiguration,
  });
  Map<String, dynamic> toJson() => _$RunConfigurationUpdateToJson(this);
}

enum RuntimeEnvironment {
  @_s.JsonValue('SQL-1_0')
  sql_1_0,
  @_s.JsonValue('FLINK-1_6')
  flink_1_6,
  @_s.JsonValue('FLINK-1_8')
  flink_1_8,
  @_s.JsonValue('FLINK-1_11')
  flink_1_11,
}

extension on RuntimeEnvironment {
  String toValue() {
    switch (this) {
      case RuntimeEnvironment.sql_1_0:
        return 'SQL-1_0';
      case RuntimeEnvironment.flink_1_6:
        return 'FLINK-1_6';
      case RuntimeEnvironment.flink_1_8:
        return 'FLINK-1_8';
      case RuntimeEnvironment.flink_1_11:
        return 'FLINK-1_11';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the location of a Flink-based Kinesis Data Analytics application's
/// code stored in an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3ApplicationCodeLocationDescription {
  /// The Amazon Resource Name (ARN) for the S3 bucket containing the application
  /// code.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The file key for the object containing the application code.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  /// The version of the object containing the application code.
  @_s.JsonKey(name: 'ObjectVersion')
  final String objectVersion;

  S3ApplicationCodeLocationDescription({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
    this.objectVersion,
  });
  factory S3ApplicationCodeLocationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$S3ApplicationCodeLocationDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, provides a description
/// of an Amazon S3 data source, including the Amazon Resource Name (ARN) of the
/// S3 bucket and the name of the Amazon S3 object that contains the data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3Configuration {
  /// The ARN of the S3 bucket that contains the data.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The name of the object that contains the data.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  S3Configuration({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
  });
  Map<String, dynamic> toJson() => _$S3ConfigurationToJson(this);
}

/// For a Flink-based Kinesis Data Analytics application, provides a description
/// of an Amazon S3 object, including the Amazon Resource Name (ARN) of the S3
/// bucket, the name of the Amazon S3 object that contains the data, and the
/// version number of the Amazon S3 object that contains the data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ContentLocation {
  /// The Amazon Resource Name (ARN) for the S3 bucket containing the application
  /// code.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The file key for the object containing the application code.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  /// The version of the object containing the application code.
  @_s.JsonKey(name: 'ObjectVersion')
  final String objectVersion;

  S3ContentLocation({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
    this.objectVersion,
  });
  Map<String, dynamic> toJson() => _$S3ContentLocationToJson(this);
}

/// Describes an update for the Amazon S3 code content location for a
/// Flink-based Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ContentLocationUpdate {
  /// The new Amazon Resource Name (ARN) for the S3 bucket containing the
  /// application code.
  @_s.JsonKey(name: 'BucketARNUpdate')
  final String bucketARNUpdate;

  /// The new file key for the object containing the application code.
  @_s.JsonKey(name: 'FileKeyUpdate')
  final String fileKeyUpdate;

  /// The new version of the object containing the application code.
  @_s.JsonKey(name: 'ObjectVersionUpdate')
  final String objectVersionUpdate;

  S3ContentLocationUpdate({
    this.bucketARNUpdate,
    this.fileKeyUpdate,
    this.objectVersionUpdate,
  });
  Map<String, dynamic> toJson() => _$S3ContentLocationUpdateToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, identifies the Amazon S3
/// bucket and object that contains the reference data.
///
/// A Kinesis Data Analytics application loads reference data only once. If the
/// data changes, you call the <a>UpdateApplication</a> operation to trigger
/// reloading of data into your application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ReferenceDataSource {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The object key name containing the reference data.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  S3ReferenceDataSource({
    this.bucketARN,
    this.fileKey,
  });
  Map<String, dynamic> toJson() => _$S3ReferenceDataSourceToJson(this);
}

/// For a SQL-based Kinesis Data Analytics application, provides the bucket name
/// and object key name that stores the reference data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3ReferenceDataSourceDescription {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// Amazon S3 object key name.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  /// The ARN of the IAM role that Kinesis Data Analytics can assume to read the
  /// Amazon S3 object on your behalf to populate the in-application reference
  /// table.
  /// <note>
  /// Provided for backward compatibility. Applications that are created with the
  /// current API version have an application-level service execution role rather
  /// than a resource-level role.
  /// </note>
  @_s.JsonKey(name: 'ReferenceRoleARN')
  final String referenceRoleARN;

  S3ReferenceDataSourceDescription({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
    this.referenceRoleARN,
  });
  factory S3ReferenceDataSourceDescription.fromJson(
          Map<String, dynamic> json) =>
      _$S3ReferenceDataSourceDescriptionFromJson(json);
}

/// For a SQL-based Kinesis Data Analytics application, describes the Amazon S3
/// bucket name and object key name for an in-application reference table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ReferenceDataSourceUpdate {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'BucketARNUpdate')
  final String bucketARNUpdate;

  /// The object key name.
  @_s.JsonKey(name: 'FileKeyUpdate')
  final String fileKeyUpdate;

  S3ReferenceDataSourceUpdate({
    this.bucketARNUpdate,
    this.fileKeyUpdate,
  });
  Map<String, dynamic> toJson() => _$S3ReferenceDataSourceUpdateToJson(this);
}

/// Provides details about a snapshot of application state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SnapshotDetails {
  /// The current application version ID when the snapshot was created.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// The identifier for the application snapshot.
  @_s.JsonKey(name: 'SnapshotName')
  final String snapshotName;

  /// The status of the application snapshot.
  @_s.JsonKey(name: 'SnapshotStatus')
  final SnapshotStatus snapshotStatus;

  /// The timestamp of the application snapshot.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SnapshotCreationTimestamp')
  final DateTime snapshotCreationTimestamp;

  SnapshotDetails({
    @_s.required this.applicationVersionId,
    @_s.required this.snapshotName,
    @_s.required this.snapshotStatus,
    this.snapshotCreationTimestamp,
  });
  factory SnapshotDetails.fromJson(Map<String, dynamic> json) =>
      _$SnapshotDetailsFromJson(json);
}

enum SnapshotStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

/// For a SQL-based Kinesis Data Analytics application, describes the format of
/// the data in the streaming source, and how each data element maps to
/// corresponding columns created in the in-application stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceSchema {
  /// A list of <code>RecordColumn</code> objects.
  @_s.JsonKey(name: 'RecordColumns')
  final List<RecordColumn> recordColumns;

  /// Specifies the format of the records on the streaming source.
  @_s.JsonKey(name: 'RecordFormat')
  final RecordFormat recordFormat;

  /// Specifies the encoding of the records in the streaming source. For example,
  /// UTF-8.
  @_s.JsonKey(name: 'RecordEncoding')
  final String recordEncoding;

  SourceSchema({
    @_s.required this.recordColumns,
    @_s.required this.recordFormat,
    this.recordEncoding,
  });
  factory SourceSchema.fromJson(Map<String, dynamic> json) =>
      _$SourceSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SourceSchemaToJson(this);
}

/// Describes the inputs, outputs, and reference data sources for a SQL-based
/// Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SqlApplicationConfiguration {
  /// The array of <a>Input</a> objects describing the input streams used by the
  /// application.
  @_s.JsonKey(name: 'Inputs')
  final List<Input> inputs;

  /// The array of <a>Output</a> objects describing the destination streams used
  /// by the application.
  @_s.JsonKey(name: 'Outputs')
  final List<Output> outputs;

  /// The array of <a>ReferenceDataSource</a> objects describing the reference
  /// data sources used by the application.
  @_s.JsonKey(name: 'ReferenceDataSources')
  final List<ReferenceDataSource> referenceDataSources;

  SqlApplicationConfiguration({
    this.inputs,
    this.outputs,
    this.referenceDataSources,
  });
  Map<String, dynamic> toJson() => _$SqlApplicationConfigurationToJson(this);
}

/// Describes the inputs, outputs, and reference data sources for a SQL-based
/// Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SqlApplicationConfigurationDescription {
  /// The array of <a>InputDescription</a> objects describing the input streams
  /// used by the application.
  @_s.JsonKey(name: 'InputDescriptions')
  final List<InputDescription> inputDescriptions;

  /// The array of <a>OutputDescription</a> objects describing the destination
  /// streams used by the application.
  @_s.JsonKey(name: 'OutputDescriptions')
  final List<OutputDescription> outputDescriptions;

  /// The array of <a>ReferenceDataSourceDescription</a> objects describing the
  /// reference data sources used by the application.
  @_s.JsonKey(name: 'ReferenceDataSourceDescriptions')
  final List<ReferenceDataSourceDescription> referenceDataSourceDescriptions;

  SqlApplicationConfigurationDescription({
    this.inputDescriptions,
    this.outputDescriptions,
    this.referenceDataSourceDescriptions,
  });
  factory SqlApplicationConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$SqlApplicationConfigurationDescriptionFromJson(json);
}

/// Describes updates to the input streams, destination streams, and reference
/// data sources for a SQL-based Kinesis Data Analytics application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SqlApplicationConfigurationUpdate {
  /// The array of <a>InputUpdate</a> objects describing the new input streams
  /// used by the application.
  @_s.JsonKey(name: 'InputUpdates')
  final List<InputUpdate> inputUpdates;

  /// The array of <a>OutputUpdate</a> objects describing the new destination
  /// streams used by the application.
  @_s.JsonKey(name: 'OutputUpdates')
  final List<OutputUpdate> outputUpdates;

  /// The array of <a>ReferenceDataSourceUpdate</a> objects describing the new
  /// reference data sources used by the application.
  @_s.JsonKey(name: 'ReferenceDataSourceUpdates')
  final List<ReferenceDataSourceUpdate> referenceDataSourceUpdates;

  SqlApplicationConfigurationUpdate({
    this.inputUpdates,
    this.outputUpdates,
    this.referenceDataSourceUpdates,
  });
  Map<String, dynamic> toJson() =>
      _$SqlApplicationConfigurationUpdateToJson(this);
}

/// Describes the starting parameters for a SQL-based Kinesis Data Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SqlRunConfiguration {
  /// The input source ID. You can get this ID by calling the
  /// <a>DescribeApplication</a> operation.
  @_s.JsonKey(name: 'InputId')
  final String inputId;

  /// The point at which you want the application to start processing records from
  /// the streaming source.
  @_s.JsonKey(name: 'InputStartingPositionConfiguration')
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  SqlRunConfiguration({
    @_s.required this.inputId,
    @_s.required this.inputStartingPositionConfiguration,
  });
  Map<String, dynamic> toJson() => _$SqlRunConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartApplicationResponse {
  StartApplicationResponse();
  factory StartApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$StartApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopApplicationResponse {
  StopApplicationResponse();
  factory StopApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$StopApplicationResponseFromJson(json);
}

/// A key-value pair (the value is optional) that you can define and assign to
/// AWS resources. If you specify a tag that already exists, the tag value is
/// replaced with the value that you specify in the request. Note that the
/// maximum number of application tags includes system tags. The maximum number
/// of user-defined application tags is 50. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html">Using
/// Tagging</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the key-value tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the key-value tag. The value is optional.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApplicationResponse {
  /// Describes application updates.
  @_s.JsonKey(name: 'ApplicationDetail')
  final ApplicationDetail applicationDetail;

  UpdateApplicationResponse({
    @_s.required this.applicationDetail,
  });
  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApplicationResponseFromJson(json);
}

enum UrlType {
  @_s.JsonValue('FLINK_DASHBOARD_URL')
  flinkDashboardUrl,
}

extension on UrlType {
  String toValue() {
    switch (this) {
      case UrlType.flinkDashboardUrl:
        return 'FLINK_DASHBOARD_URL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the parameters of a VPC used by the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcConfiguration {
  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html">SecurityGroup</a>
  /// IDs used by the VPC configuration.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html">Subnet</a>
  /// IDs used by the VPC configuration.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  VpcConfiguration({
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
  });
  Map<String, dynamic> toJson() => _$VpcConfigurationToJson(this);
}

/// Describes the parameters of a VPC used by the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcConfigurationDescription {
  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html">SecurityGroup</a>
  /// IDs used by the VPC configuration.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html">Subnet</a>
  /// IDs used by the VPC configuration.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC configuration.
  @_s.JsonKey(name: 'VpcConfigurationId')
  final String vpcConfigurationId;

  /// The ID of the associated VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  VpcConfigurationDescription({
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
    @_s.required this.vpcConfigurationId,
    @_s.required this.vpcId,
  });
  factory VpcConfigurationDescription.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigurationDescriptionFromJson(json);
}

/// Describes updates to the VPC configuration used by the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcConfigurationUpdate {
  /// Describes an update to the ID of the VPC configuration.
  @_s.JsonKey(name: 'VpcConfigurationId')
  final String vpcConfigurationId;

  /// Describes updates to the array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_SecurityGroup.html">SecurityGroup</a>
  /// IDs used by the VPC configuration.
  @_s.JsonKey(name: 'SecurityGroupIdUpdates')
  final List<String> securityGroupIdUpdates;

  /// Describes updates to the array of <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_Subnet.html">Subnet</a>
  /// IDs used by the VPC configuration.
  @_s.JsonKey(name: 'SubnetIdUpdates')
  final List<String> subnetIdUpdates;

  VpcConfigurationUpdate({
    @_s.required this.vpcConfigurationId,
    this.securityGroupIdUpdates,
    this.subnetIdUpdates,
  });
  Map<String, dynamic> toJson() => _$VpcConfigurationUpdateToJson(this);
}

class CodeValidationException extends _s.GenericAwsException {
  CodeValidationException({String type, String message})
      : super(type: type, code: 'CodeValidationException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidApplicationConfigurationException extends _s.GenericAwsException {
  InvalidApplicationConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidApplicationConfigurationException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String type, String message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceProvisionedThroughputExceededException
    extends _s.GenericAwsException {
  ResourceProvisionedThroughputExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceProvisionedThroughputExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnableToDetectSchemaException extends _s.GenericAwsException {
  UnableToDetectSchemaException({String type, String message})
      : super(
            type: type,
            code: 'UnableToDetectSchemaException',
            message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
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
