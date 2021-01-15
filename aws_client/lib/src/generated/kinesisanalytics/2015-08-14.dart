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

part '2015-08-14.g.dart';

/// <note>
/// This documentation is for version 1 of the Amazon Kinesis Data Analytics
/// API, which only supports SQL applications. Version 2 of the API supports SQL
/// and Java applications. For more information about version 2, see <a
/// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
/// Analytics API V2 Documentation</a>.
/// </note>
/// This is the <i>Amazon Kinesis Analytics v1 API Reference</i>. The Amazon
/// Kinesis Analytics Developer Guide provides additional information.
class KinesisAnalytics {
  final _s.JsonProtocol _protocol;
  KinesisAnalytics({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisanalytics',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Adds a CloudWatch log stream to monitor application configuration errors.
  /// For more information about using CloudWatch log streams with Amazon
  /// Kinesis Analytics applications, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html">Working
  /// with Amazon CloudWatch Logs</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The Kinesis Analytics application name.
  ///
  /// Parameter [cloudWatchLoggingOption] :
  /// Provides the CloudWatch log stream Amazon Resource Name (ARN) and the IAM
  /// role ARN. Note: To write application messages to CloudWatch, the IAM role
  /// that is used must have the <code>PutLogEvents</code> policy action
  /// enabled.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the Kinesis Analytics application.
  Future<void> addApplicationCloudWatchLoggingOption({
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
          'KinesisAnalytics_20150814.AddApplicationCloudWatchLoggingOption'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Adds a streaming source to your Amazon Kinesis application. For conceptual
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  ///
  /// You can add a streaming source either when you create an application or
  /// you can use this operation to add a streaming source after you create an
  /// application. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_CreateApplication.html">CreateApplication</a>.
  ///
  /// Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to find the current application version.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:AddApplicationInput</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [CodeValidationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of your existing Amazon Kinesis Analytics application to which you
  /// want to add the streaming source.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// Current version of your Amazon Kinesis Analytics application. You can use
  /// the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to find the current application version.
  ///
  /// Parameter [input] :
  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_Input.html">Input</a>
  /// to add.
  Future<void> addApplicationInput({
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.AddApplicationInput'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Adds an <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>
  /// to an application. An input processor preprocesses records on the input
  /// stream before the application's SQL code executes. Currently, the only
  /// input processor available is <a
  /// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the application to which you want to add the input processing
  /// configuration.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// Version of the application to which you want to add the input processing
  /// configuration. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [inputId] :
  /// The ID of the input configuration to add the input processing
  /// configuration to. You can get a list of the input IDs for an application
  /// using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation.
  ///
  /// Parameter [inputProcessingConfiguration] :
  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>
  /// to add to the application.
  Future<void> addApplicationInputProcessingConfiguration({
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
          'KinesisAnalytics_20150814.AddApplicationInputProcessingConfiguration'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Adds an external destination to your Amazon Kinesis Analytics application.
  ///
  /// If you want Amazon Kinesis Analytics to deliver data from an
  /// in-application stream within your application to an external destination
  /// (such as an Amazon Kinesis stream, an Amazon Kinesis Firehose delivery
  /// stream, or an AWS Lambda function), you add the relevant configuration to
  /// your application using this operation. You can configure one or more
  /// outputs for your application. Each output configuration maps an
  /// in-application stream and an external destination.
  ///
  /// You can use one of the output configurations to deliver data from your
  /// in-application error stream to an external destination so that you can
  /// analyze the errors. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Understanding
  /// Application Output (Destination)</a>.
  ///
  /// Any configuration update, including adding a streaming source using this
  /// operation, results in a new version of the application. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to find the current application version.
  ///
  /// For the limits on the number of application inputs and outputs you can
  /// configure, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html">Limits</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:AddApplicationOutput</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the application to which you want to add the output configuration.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// Version of the application to which you want to add the output
  /// configuration. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [output] :
  /// An array of objects, each describing one output configuration. In the
  /// output configuration, you specify the name of an in-application stream, a
  /// destination (that is, an Amazon Kinesis stream, an Amazon Kinesis Firehose
  /// delivery stream, or an AWS Lambda function), and record the formation to
  /// use when writing to the destination.
  Future<void> addApplicationOutput({
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.AddApplicationOutput'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Adds a reference data source to an existing application.
  ///
  /// Amazon Kinesis Analytics reads reference data (that is, an Amazon S3
  /// object) and creates an in-application table within your application. In
  /// the request, you provide the source (S3 bucket name and object key name),
  /// name of the in-application table to create, and the necessary mapping
  /// information that describes how data in Amazon S3 object maps to columns in
  /// the resulting in-application table.
  ///
  /// For conceptual information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>. For the limits on data sources you can add to your
  /// application, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html">Limits</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:AddApplicationOutput</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of an existing application.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// Version of the application for which you are adding the reference data
  /// source. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [referenceDataSource] :
  /// The reference data source can be an object in your Amazon S3 bucket.
  /// Amazon Kinesis Analytics reads the object and copies the data into the
  /// in-application table that is created. You provide an S3 bucket, object key
  /// name, and the resulting in-application table that is created. You must
  /// also provide an IAM role with the necessary permissions that Amazon
  /// Kinesis Analytics can assume to read the object from your S3 bucket on
  /// your behalf.
  Future<void> addApplicationReferenceDataSource({
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
          'KinesisAnalytics_20150814.AddApplicationReferenceDataSource'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Creates an Amazon Kinesis Analytics application. You can configure each
  /// application with one streaming source as input, application code to
  /// process the input, and up to three destinations where you want Amazon
  /// Kinesis Analytics to write the output data from your application. For an
  /// overview, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works.html">How
  /// it Works</a>.
  ///
  /// In the input configuration, you map the streaming source to an
  /// in-application stream, which you can think of as a constantly updating
  /// table. In the mapping, you must provide a schema for the in-application
  /// stream and map each data column in the in-application stream to a data
  /// element in the streaming source.
  ///
  /// Your application code is one or more SQL statements that read input data,
  /// transform it, and generate output. Your application code can create one or
  /// more SQL artifacts like SQL streams or pumps.
  ///
  /// In the output configuration, you can configure the application to write
  /// data from in-application streams created in your applications to up to
  /// three destinations.
  ///
  /// To read data from your source stream or write data to destination streams,
  /// Amazon Kinesis Analytics needs your permissions. You grant these
  /// permissions by creating IAM roles. This operation requires permissions to
  /// perform the <code>kinesisanalytics:CreateApplication</code> action.
  ///
  /// For introductory exercises to create an Amazon Kinesis Analytics
  /// application, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/getting-started.html">Getting
  /// Started</a>.
  ///
  /// May throw [CodeValidationException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [TooManyTagsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [applicationName] :
  /// Name of your Amazon Kinesis Analytics application (for example,
  /// <code>sample-app</code>).
  ///
  /// Parameter [applicationCode] :
  /// One or more SQL statements that read input data, transform it, and
  /// generate output. For example, you can write a SQL statement that reads
  /// data from one in-application stream, generates a running average of the
  /// number of advertisement clicks by vendor, and insert resulting rows in
  /// another in-application stream using pumps. For more information about the
  /// typical pattern, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-app-code.html">Application
  /// Code</a>.
  ///
  /// You can provide such series of SQL statements, where output of one
  /// statement can be used as the input for the next statement. You store
  /// intermediate results by creating in-application streams and pumps.
  ///
  /// Note that the application code must create the streams with names
  /// specified in the <code>Outputs</code>. For example, if your
  /// <code>Outputs</code> defines output streams named
  /// <code>ExampleOutputStream1</code> and <code>ExampleOutputStream2</code>,
  /// then your application code must create these streams.
  ///
  /// Parameter [applicationDescription] :
  /// Summary description of the application.
  ///
  /// Parameter [cloudWatchLoggingOptions] :
  /// Use this parameter to configure a CloudWatch log stream to monitor
  /// application configuration errors. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html">Working
  /// with Amazon CloudWatch Logs</a>.
  ///
  /// Parameter [inputs] :
  /// Use this parameter to configure the application input.
  ///
  /// You can configure your application to receive input from a single
  /// streaming source. In this configuration, you map this streaming source to
  /// an in-application stream that is created. Your application code can then
  /// query the in-application stream like a table (you can think of it as a
  /// constantly updating table).
  ///
  /// For the streaming source, you provide its Amazon Resource Name (ARN) and
  /// format of data on the stream (for example, JSON, CSV, etc.). You also must
  /// provide an IAM role that Amazon Kinesis Analytics can assume to read this
  /// stream on your behalf.
  ///
  /// To create the in-application stream, you need to specify a schema to
  /// transform your data into a schematized version used in SQL. In the schema,
  /// you provide the necessary mapping of the data elements in the streaming
  /// source to record columns in the in-app stream.
  ///
  /// Parameter [outputs] :
  /// You can configure application output to write data from any of the
  /// in-application streams to up to three destinations.
  ///
  /// These destinations can be Amazon Kinesis streams, Amazon Kinesis Firehose
  /// delivery streams, AWS Lambda destinations, or any combination of the
  /// three.
  ///
  /// In the configuration, you specify the in-application stream name, the
  /// destination stream or Lambda function Amazon Resource Name (ARN), and the
  /// format to use when writing data. You must also provide an IAM role that
  /// Amazon Kinesis Analytics can assume to write to the destination stream or
  /// Lambda function on your behalf.
  ///
  /// In the output configuration, you also provide the output stream or Lambda
  /// function ARN. For stream destinations, you provide the format of data in
  /// the stream (for example, JSON, CSV). You also must provide an IAM role
  /// that Amazon Kinesis Analytics can assume to write to the stream or Lambda
  /// function on your behalf.
  ///
  /// Parameter [tags] :
  /// A list of one or more tags to assign to the application. A tag is a
  /// key-value pair that identifies an application. Note that the maximum
  /// number of application tags includes system tags. The maximum number of
  /// user-defined application tags is 50. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html">Using
  /// Tagging</a>.
  Future<CreateApplicationResponse> createApplication({
    @_s.required String applicationName,
    String applicationCode,
    String applicationDescription,
    List<CloudWatchLoggingOption> cloudWatchLoggingOptions,
    List<Input> inputs,
    List<Output> outputs,
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
    _s.validateStringLength(
      'applicationCode',
      applicationCode,
      0,
      102400,
    );
    _s.validateStringLength(
      'applicationDescription',
      applicationDescription,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.CreateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        if (applicationCode != null) 'ApplicationCode': applicationCode,
        if (applicationDescription != null)
          'ApplicationDescription': applicationDescription,
        if (cloudWatchLoggingOptions != null)
          'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
        if (inputs != null) 'Inputs': inputs,
        if (outputs != null) 'Outputs': outputs,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateApplicationResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Deletes the specified application. Amazon Kinesis Analytics halts
  /// application execution and deletes the application, including any
  /// application artifacts (such as in-application streams, reference table,
  /// and application code).
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:DeleteApplication</code> action.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the Amazon Kinesis Analytics application to delete.
  ///
  /// Parameter [createTimestamp] :
  /// You can use the <code>DescribeApplication</code> operation to get this
  /// value.
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.DeleteApplication'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Deletes a CloudWatch log stream from an application. For more information
  /// about using CloudWatch log streams with Amazon Kinesis Analytics
  /// applications, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html">Working
  /// with Amazon CloudWatch Logs</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The Kinesis Analytics application name.
  ///
  /// Parameter [cloudWatchLoggingOptionId] :
  /// The <code>CloudWatchLoggingOptionId</code> of the CloudWatch logging
  /// option to delete. You can get the <code>CloudWatchLoggingOptionId</code>
  /// by using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the Kinesis Analytics application.
  Future<void> deleteApplicationCloudWatchLoggingOption({
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
          'KinesisAnalytics_20150814.DeleteApplicationCloudWatchLoggingOption'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Deletes an <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>
  /// from an input.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// The Kinesis Analytics application name.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The version ID of the Kinesis Analytics application.
  ///
  /// Parameter [inputId] :
  /// The ID of the input configuration from which to delete the input
  /// processing configuration. You can get a list of the input IDs for an
  /// application by using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation.
  Future<void> deleteApplicationInputProcessingConfiguration({
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
          'KinesisAnalytics_20150814.DeleteApplicationInputProcessingConfiguration'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Deletes output destination configuration from your application
  /// configuration. Amazon Kinesis Analytics will no longer write data from the
  /// corresponding in-application stream to the external output destination.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:DeleteApplicationOutput</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Amazon Kinesis Analytics application name.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// Amazon Kinesis Analytics application version. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [outputId] :
  /// The ID of the configuration to delete. Each output configuration that is
  /// added to the application, either when the application is created or later
  /// using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationOutput.html">AddApplicationOutput</a>
  /// operation, has a unique ID. You need to provide the ID to uniquely
  /// identify the output configuration that you want to delete from the
  /// application configuration. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the specific <code>OutputId</code>.
  Future<void> deleteApplicationOutput({
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.DeleteApplicationOutput'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Deletes a reference data source configuration from the specified
  /// application configuration.
  ///
  /// If the application is running, Amazon Kinesis Analytics immediately
  /// removes the in-application table that you created using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html">AddApplicationReferenceDataSource</a>
  /// operation.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics.DeleteApplicationReferenceDataSource</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of an existing application.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// Version of the application. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the current application version. If the version specified
  /// is not the current version, the
  /// <code>ConcurrentModificationException</code> is returned.
  ///
  /// Parameter [referenceId] :
  /// ID of the reference data source. When you add a reference data source to
  /// your application using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html">AddApplicationReferenceDataSource</a>,
  /// Amazon Kinesis Analytics assigns an ID. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get the reference ID.
  Future<void> deleteApplicationReferenceDataSource({
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
          'KinesisAnalytics_20150814.DeleteApplicationReferenceDataSource'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Returns information about a specific Amazon Kinesis Analytics application.
  ///
  /// If you want to retrieve a list of all applications in your account, use
  /// the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_ListApplications.html">ListApplications</a>
  /// operation.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:DescribeApplication</code> action. You can use
  /// <code>DescribeApplication</code> to get the current application versionId,
  /// which you need to call other operations such as <code>Update</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the application.
  Future<DescribeApplicationResponse> describeApplication({
    @_s.required String applicationName,
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.DescribeApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
      },
    );

    return DescribeApplicationResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Infers a schema by evaluating sample records on the specified streaming
  /// source (Amazon Kinesis stream or Amazon Kinesis Firehose delivery stream)
  /// or S3 object. In the response, the operation returns the inferred schema
  /// and also the sample records that the operation used to infer the schema.
  ///
  /// You can use the inferred schema when configuring a streaming source for
  /// your application. For conceptual information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>. Note that when you create an application using the
  /// Amazon Kinesis Analytics console, the console uses this operation to infer
  /// a schema and show it in the console user interface.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:DiscoverInputSchema</code> action.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [UnableToDetectSchemaException].
  /// May throw [ResourceProvisionedThroughputExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [inputProcessingConfiguration] :
  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>
  /// to use to preprocess the records before discovering the schema of the
  /// records.
  ///
  /// Parameter [inputStartingPositionConfiguration] :
  /// Point at which you want Amazon Kinesis Analytics to start reading records
  /// from the specified streaming source discovery purposes.
  ///
  /// Parameter [resourceARN] :
  /// Amazon Resource Name (ARN) of the streaming source.
  ///
  /// Parameter [roleARN] :
  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf.
  ///
  /// Parameter [s3Configuration] :
  /// Specify this parameter to discover a schema from data in an Amazon S3
  /// object.
  Future<DiscoverInputSchemaResponse> discoverInputSchema({
    InputProcessingConfiguration inputProcessingConfiguration,
    InputStartingPositionConfiguration inputStartingPositionConfiguration,
    String resourceARN,
    String roleARN,
    S3Configuration s3Configuration,
  }) async {
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
    _s.validateStringLength(
      'roleARN',
      roleARN,
      1,
      2048,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''arn:aws:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.DiscoverInputSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (inputProcessingConfiguration != null)
          'InputProcessingConfiguration': inputProcessingConfiguration,
        if (inputStartingPositionConfiguration != null)
          'InputStartingPositionConfiguration':
              inputStartingPositionConfiguration,
        if (resourceARN != null) 'ResourceARN': resourceARN,
        if (roleARN != null) 'RoleARN': roleARN,
        if (s3Configuration != null) 'S3Configuration': s3Configuration,
      },
    );

    return DiscoverInputSchemaResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Returns a list of Amazon Kinesis Analytics applications in your account.
  /// For each application, the response includes the application name, Amazon
  /// Resource Name (ARN), and status. If the response returns the
  /// <code>HasMoreApplications</code> value as true, you can send another
  /// request by adding the <code>ExclusiveStartApplicationName</code> in the
  /// request body, and set the value of this to the last application name from
  /// the previous response.
  ///
  /// If you want detailed information about a specific application, use <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:ListApplications</code> action.
  ///
  /// Parameter [exclusiveStartApplicationName] :
  /// Name of the application to start the list with. When using pagination to
  /// retrieve the list, you don't need to specify this parameter in the first
  /// request. However, in subsequent requests, you add the last application
  /// name from the previous response to get the next page of applications.
  ///
  /// Parameter [limit] :
  /// Maximum number of applications to list.
  Future<ListApplicationsResponse> listApplications({
    String exclusiveStartApplicationName,
    int limit,
  }) async {
    _s.validateStringLength(
      'exclusiveStartApplicationName',
      exclusiveStartApplicationName,
      1,
      128,
    );
    _s.validateStringPattern(
      'exclusiveStartApplicationName',
      exclusiveStartApplicationName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.ListApplications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusiveStartApplicationName != null)
          'ExclusiveStartApplicationName': exclusiveStartApplicationName,
        if (limit != null) 'Limit': limit,
      },
    );

    return ListApplicationsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of key-value tags assigned to the application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html">Using
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
      r'''arn:aws:kinesisanalytics:[a-z]{2}-[a-z]+-\d{1}+:\d{12}+:application/[a-zA-Z0-9_.-]{1,128}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.ListTagsForResource'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Starts the specified Amazon Kinesis Analytics application. After creating
  /// an application, you must exclusively call this operation to start your
  /// application.
  ///
  /// After the application starts, it begins consuming the input data,
  /// processes it, and writes the output to the configured destination.
  ///
  /// The application status must be <code>READY</code> for you to start an
  /// application. You can get the application status in the console or using
  /// the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation.
  ///
  /// After you start the application, you can stop the application from
  /// processing the input by calling the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_StopApplication.html">StopApplication</a>
  /// operation.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:StartApplication</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidApplicationConfigurationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the application.
  ///
  /// Parameter [inputConfigurations] :
  /// Identifies the specific input, by ID, that the application starts
  /// consuming. Amazon Kinesis Analytics starts reading the streaming source
  /// associated with the input. You can also specify where in the streaming
  /// source you want Amazon Kinesis Analytics to start reading.
  Future<void> startApplication({
    @_s.required String applicationName,
    @_s.required List<InputConfiguration> inputConfigurations,
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
    ArgumentError.checkNotNull(inputConfigurations, 'inputConfigurations');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.StartApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'InputConfigurations': inputConfigurations,
      },
    );

    return StartApplicationResponse.fromJson(jsonResponse.body);
  }

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Stops the application from processing input data. You can stop an
  /// application only if it is in the running state. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to find the application state. After the application is stopped,
  /// Amazon Kinesis Analytics stops reading data from the input, the
  /// application stops processing data, and there is no output written to the
  /// destination.
  ///
  /// This operation requires permissions to perform the
  /// <code>kinesisanalytics:StopApplication</code> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the running application to stop.
  Future<void> stopApplication({
    @_s.required String applicationName,
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.StopApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
      },
    );

    return StopApplicationResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more key-value tags to a Kinesis Analytics application. Note
  /// that the maximum number of application tags includes system tags. The
  /// maximum number of user-defined application tags is 50. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html">Using
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
      r'''arn:aws:kinesisanalytics:[a-z]{2}-[a-z]+-\d{1}+:\d{12}+:application/[a-zA-Z0-9_.-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.TagResource'
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

  /// Removes one or more tags from a Kinesis Analytics application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html">Using
  /// Tagging</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the Kinesis Analytics application from which to remove the
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
      r'''arn:aws:kinesisanalytics:[a-z]{2}-[a-z]+-\d{1}+:\d{12}+:application/[a-zA-Z0-9_.-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.UntagResource'
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

  /// <note>
  /// This documentation is for version 1 of the Amazon Kinesis Data Analytics
  /// API, which only supports SQL applications. Version 2 of the API supports
  /// SQL and Java applications. For more information about version 2, see <a
  /// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
  /// Analytics API V2 Documentation</a>.
  /// </note>
  /// Updates an existing Amazon Kinesis Analytics application. Using this API,
  /// you can update application code, input configuration, and output
  /// configuration.
  ///
  /// Note that Amazon Kinesis Analytics updates the
  /// <code>CurrentApplicationVersionId</code> each time you update your
  /// application.
  ///
  /// This operation requires permission for the
  /// <code>kinesisanalytics:UpdateApplication</code> action.
  ///
  /// May throw [CodeValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [applicationName] :
  /// Name of the Amazon Kinesis Analytics application to update.
  ///
  /// Parameter [applicationUpdate] :
  /// Describes application updates.
  ///
  /// Parameter [currentApplicationVersionId] :
  /// The current application version ID. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get this value.
  Future<void> updateApplication({
    @_s.required String applicationName,
    @_s.required ApplicationUpdate applicationUpdate,
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
    ArgumentError.checkNotNull(applicationUpdate, 'applicationUpdate');
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.UpdateApplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
        'ApplicationUpdate': applicationUpdate,
        'CurrentApplicationVersionId': currentApplicationVersionId,
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
  AddApplicationCloudWatchLoggingOptionResponse();
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
  AddApplicationInputProcessingConfigurationResponse();
  factory AddApplicationInputProcessingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplicationInputProcessingConfigurationResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationInputResponse {
  AddApplicationInputResponse();
  factory AddApplicationInputResponse.fromJson(Map<String, dynamic> json) =>
      _$AddApplicationInputResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationOutputResponse {
  AddApplicationOutputResponse();
  factory AddApplicationOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$AddApplicationOutputResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddApplicationReferenceDataSourceResponse {
  AddApplicationReferenceDataSourceResponse();
  factory AddApplicationReferenceDataSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddApplicationReferenceDataSourceResponseFromJson(json);
}

/// <note>
/// This documentation is for version 1 of the Amazon Kinesis Data Analytics
/// API, which only supports SQL applications. Version 2 of the API supports SQL
/// and Java applications. For more information about version 2, see <a
/// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
/// Analytics API V2 Documentation</a>.
/// </note>
/// Provides a description of the application, including the application Amazon
/// Resource Name (ARN), status, latest version, and input and output
/// configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationDetail {
  /// ARN of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// Name of the application.
  @_s.JsonKey(name: 'ApplicationName')
  final String applicationName;

  /// Status of the application.
  @_s.JsonKey(name: 'ApplicationStatus')
  final ApplicationStatus applicationStatus;

  /// Provides the current application version.
  @_s.JsonKey(name: 'ApplicationVersionId')
  final int applicationVersionId;

  /// Returns the application code that you provided to perform data analysis on
  /// any of the in-application streams in your application.
  @_s.JsonKey(name: 'ApplicationCode')
  final String applicationCode;

  /// Description of the application.
  @_s.JsonKey(name: 'ApplicationDescription')
  final String applicationDescription;

  /// Describes the CloudWatch log streams that are configured to receive
  /// application messages. For more information about using CloudWatch log
  /// streams with Amazon Kinesis Analytics applications, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html">Working
  /// with Amazon CloudWatch Logs</a>.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionDescriptions')
  final List<CloudWatchLoggingOptionDescription>
      cloudWatchLoggingOptionDescriptions;

  /// Time stamp when the application version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTimestamp')
  final DateTime createTimestamp;

  /// Describes the application input configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  @_s.JsonKey(name: 'InputDescriptions')
  final List<InputDescription> inputDescriptions;

  /// Time stamp when the application was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTimestamp')
  final DateTime lastUpdateTimestamp;

  /// Describes the application output configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  @_s.JsonKey(name: 'OutputDescriptions')
  final List<OutputDescription> outputDescriptions;

  /// Describes reference data sources configured for the application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  @_s.JsonKey(name: 'ReferenceDataSourceDescriptions')
  final List<ReferenceDataSourceDescription> referenceDataSourceDescriptions;

  ApplicationDetail({
    @_s.required this.applicationARN,
    @_s.required this.applicationName,
    @_s.required this.applicationStatus,
    @_s.required this.applicationVersionId,
    this.applicationCode,
    this.applicationDescription,
    this.cloudWatchLoggingOptionDescriptions,
    this.createTimestamp,
    this.inputDescriptions,
    this.lastUpdateTimestamp,
    this.outputDescriptions,
    this.referenceDataSourceDescriptions,
  });
  factory ApplicationDetail.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDetailFromJson(json);
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
}

/// <note>
/// This documentation is for version 1 of the Amazon Kinesis Data Analytics
/// API, which only supports SQL applications. Version 2 of the API supports SQL
/// and Java applications. For more information about version 2, see <a
/// href="/kinesisanalytics/latest/apiv2/Welcome.html">Amazon Kinesis Data
/// Analytics API V2 Documentation</a>.
/// </note>
/// Provides application summary information, including the application Amazon
/// Resource Name (ARN), name, and status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationSummary {
  /// ARN of the application.
  @_s.JsonKey(name: 'ApplicationARN')
  final String applicationARN;

  /// Name of the application.
  @_s.JsonKey(name: 'ApplicationName')
  final String applicationName;

  /// Status of the application.
  @_s.JsonKey(name: 'ApplicationStatus')
  final ApplicationStatus applicationStatus;

  ApplicationSummary({
    @_s.required this.applicationARN,
    @_s.required this.applicationName,
    @_s.required this.applicationStatus,
  });
  factory ApplicationSummary.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSummaryFromJson(json);
}

/// Describes updates to apply to an existing Amazon Kinesis Analytics
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ApplicationUpdate {
  /// Describes application code updates.
  @_s.JsonKey(name: 'ApplicationCodeUpdate')
  final String applicationCodeUpdate;

  /// Describes application CloudWatch logging option updates.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionUpdates')
  final List<CloudWatchLoggingOptionUpdate> cloudWatchLoggingOptionUpdates;

  /// Describes application input configuration updates.
  @_s.JsonKey(name: 'InputUpdates')
  final List<InputUpdate> inputUpdates;

  /// Describes application output configuration updates.
  @_s.JsonKey(name: 'OutputUpdates')
  final List<OutputUpdate> outputUpdates;

  /// Describes application reference data source updates.
  @_s.JsonKey(name: 'ReferenceDataSourceUpdates')
  final List<ReferenceDataSourceUpdate> referenceDataSourceUpdates;

  ApplicationUpdate({
    this.applicationCodeUpdate,
    this.cloudWatchLoggingOptionUpdates,
    this.inputUpdates,
    this.outputUpdates,
    this.referenceDataSourceUpdates,
  });
  Map<String, dynamic> toJson() => _$ApplicationUpdateToJson(this);
}

/// Provides additional mapping information when the record format uses
/// delimiters, such as CSV. For example, the following sample records use CSV
/// format, where the records use the <i>'\n'</i> as the row delimiter and a
/// comma (",") as the column delimiter:
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
  /// Column delimiter. For example, in a CSV format, a comma (",") is the typical
  /// column delimiter.
  @_s.JsonKey(name: 'RecordColumnDelimiter')
  final String recordColumnDelimiter;

  /// Row delimiter. For example, in a CSV format, <i>'\n'</i> is the typical row
  /// delimiter.
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

/// Provides a description of CloudWatch logging options, including the log
/// stream Amazon Resource Name (ARN) and the role ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudWatchLoggingOption {
  /// ARN of the CloudWatch log to receive application messages.
  @_s.JsonKey(name: 'LogStreamARN')
  final String logStreamARN;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role that is used must have the
  /// <code>PutLogEvents</code> policy action enabled.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  CloudWatchLoggingOption({
    @_s.required this.logStreamARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$CloudWatchLoggingOptionToJson(this);
}

/// Description of the CloudWatch logging option.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudWatchLoggingOptionDescription {
  /// ARN of the CloudWatch log to receive application messages.
  @_s.JsonKey(name: 'LogStreamARN')
  final String logStreamARN;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role used must have the
  /// <code>PutLogEvents</code> policy action enabled.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// ID of the CloudWatch logging option description.
  @_s.JsonKey(name: 'CloudWatchLoggingOptionId')
  final String cloudWatchLoggingOptionId;

  CloudWatchLoggingOptionDescription({
    @_s.required this.logStreamARN,
    @_s.required this.roleARN,
    this.cloudWatchLoggingOptionId,
  });
  factory CloudWatchLoggingOptionDescription.fromJson(
          Map<String, dynamic> json) =>
      _$CloudWatchLoggingOptionDescriptionFromJson(json);
}

/// Describes CloudWatch logging option updates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CloudWatchLoggingOptionUpdate {
  /// ID of the CloudWatch logging option to update
  @_s.JsonKey(name: 'CloudWatchLoggingOptionId')
  final String cloudWatchLoggingOptionId;

  /// ARN of the CloudWatch log to receive application messages.
  @_s.JsonKey(name: 'LogStreamARNUpdate')
  final String logStreamARNUpdate;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role used must have the
  /// <code>PutLogEvents</code> policy action enabled.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  CloudWatchLoggingOptionUpdate({
    @_s.required this.cloudWatchLoggingOptionId,
    this.logStreamARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$CloudWatchLoggingOptionUpdateToJson(this);
}

/// TBD
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApplicationResponse {
  /// In response to your <code>CreateApplication</code> request, Amazon Kinesis
  /// Analytics returns a response with a summary of the application it created,
  /// including the application Amazon Resource Name (ARN), name, and status.
  @_s.JsonKey(name: 'ApplicationSummary')
  final ApplicationSummary applicationSummary;

  CreateApplicationResponse({
    @_s.required this.applicationSummary,
  });
  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationCloudWatchLoggingOptionResponse {
  DeleteApplicationCloudWatchLoggingOptionResponse();
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
  DeleteApplicationInputProcessingConfigurationResponse();
  factory DeleteApplicationInputProcessingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationInputProcessingConfigurationResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationOutputResponse {
  DeleteApplicationOutputResponse();
  factory DeleteApplicationOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApplicationOutputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApplicationReferenceDataSourceResponse {
  DeleteApplicationReferenceDataSourceResponse();
  factory DeleteApplicationReferenceDataSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApplicationReferenceDataSourceResponseFromJson(json);
}

/// <p/>
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

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeApplicationResponse {
  /// Provides a description of the application, such as the application Amazon
  /// Resource Name (ARN), status, latest version, and input and output
  /// configuration details.
  @_s.JsonKey(name: 'ApplicationDetail')
  final ApplicationDetail applicationDetail;

  DescribeApplicationResponse({
    @_s.required this.applicationDetail,
  });
  factory DescribeApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeApplicationResponseFromJson(json);
}

/// Describes the data format when records are written to the destination. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
/// Application Output</a>.
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

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiscoverInputSchemaResponse {
  /// Schema inferred from the streaming source. It identifies the format of the
  /// data in the streaming source and how each data element maps to corresponding
  /// columns in the in-application stream that you can create.
  @_s.JsonKey(name: 'InputSchema')
  final SourceSchema inputSchema;

  /// An array of elements, where each element corresponds to a row in a stream
  /// record (a stream record can have more than one row).
  @_s.JsonKey(name: 'ParsedInputRecords')
  final List<List<String>> parsedInputRecords;

  /// Stream data that was modified by the processor specified in the
  /// <code>InputProcessingConfiguration</code> parameter.
  @_s.JsonKey(name: 'ProcessedInputRecords')
  final List<String> processedInputRecords;

  /// Raw stream data that was sampled to infer the schema.
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

/// When you configure the application input, you specify the streaming source,
/// the in-application stream name that is created, and the mapping between the
/// two. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
/// Application Input</a>.
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

  /// Name prefix to use when creating an in-application stream. Suppose that you
  /// specify a prefix "MyInApplicationStream." Amazon Kinesis Analytics then
  /// creates one or more (as per the <code>InputParallelism</code> count you
  /// specified) in-application streams with names "MyInApplicationStream_001,"
  /// "MyInApplicationStream_002," and so on.
  @_s.JsonKey(name: 'NamePrefix')
  final String namePrefix;

  /// Describes the number of in-application streams to create.
  ///
  /// Data from your source is routed to these in-application input streams.
  ///
  /// (see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  @_s.JsonKey(name: 'InputParallelism')
  final InputParallelism inputParallelism;

  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>
  /// for the input. An input processor transforms records as they are received
  /// from the stream, before the application's SQL code executes. Currently, the
  /// only input processing configuration available is <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>.
  @_s.JsonKey(name: 'InputProcessingConfiguration')
  final InputProcessingConfiguration inputProcessingConfiguration;

  /// If the streaming source is an Amazon Kinesis Firehose delivery stream,
  /// identifies the delivery stream's ARN and an IAM role that enables Amazon
  /// Kinesis Analytics to access the stream on your behalf.
  ///
  /// Note: Either <code>KinesisStreamsInput</code> or
  /// <code>KinesisFirehoseInput</code> is required.
  @_s.JsonKey(name: 'KinesisFirehoseInput')
  final KinesisFirehoseInput kinesisFirehoseInput;

  /// If the streaming source is an Amazon Kinesis stream, identifies the stream's
  /// Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis
  /// Analytics to access the stream on your behalf.
  ///
  /// Note: Either <code>KinesisStreamsInput</code> or
  /// <code>KinesisFirehoseInput</code> is required.
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

/// When you start your application, you provide this configuration, which
/// identifies the input source and the point in the input source at which you
/// want the application to start processing records.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputConfiguration {
  /// Input source ID. You can get this ID by calling the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Point at which you want the application to start processing records from the
  /// streaming source.
  @_s.JsonKey(name: 'InputStartingPositionConfiguration')
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  InputConfiguration({
    @_s.required this.id,
    @_s.required this.inputStartingPositionConfiguration,
  });
  Map<String, dynamic> toJson() => _$InputConfigurationToJson(this);
}

/// Describes the application input configuration. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
/// Application Input</a>.
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

  /// Input ID associated with the application input. This is the ID that Amazon
  /// Kinesis Analytics assigns to each input configuration you add to your
  /// application.
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

  /// Point at which the application is configured to read from the input stream.
  @_s.JsonKey(name: 'InputStartingPositionConfiguration')
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  /// If an Amazon Kinesis Firehose delivery stream is configured as a streaming
  /// source, provides the delivery stream's ARN and an IAM role that enables
  /// Amazon Kinesis Analytics to access the stream on your behalf.
  @_s.JsonKey(name: 'KinesisFirehoseInputDescription')
  final KinesisFirehoseInputDescription kinesisFirehoseInputDescription;

  /// If an Amazon Kinesis stream is configured as streaming source, provides
  /// Amazon Kinesis stream's Amazon Resource Name (ARN) and an IAM role that
  /// enables Amazon Kinesis Analytics to access the stream on your behalf.
  @_s.JsonKey(name: 'KinesisStreamsInputDescription')
  final KinesisStreamsInputDescription kinesisStreamsInputDescription;

  /// In-application name prefix.
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

/// An object that contains the Amazon Resource Name (ARN) of the <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a> function that is
/// used to preprocess records in the stream, and the ARN of the IAM role that
/// is used to access the AWS Lambda function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputLambdaProcessor {
  /// The ARN of the <a href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>
  /// function that operates on records in the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  InputLambdaProcessor({
    @_s.required this.resourceARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$InputLambdaProcessorToJson(this);
}

/// An object that contains the Amazon Resource Name (ARN) of the <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a> function that is
/// used to preprocess records in the stream, and the ARN of the IAM role that
/// is used to access the AWS Lambda expression.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputLambdaProcessorDescription {
  /// The ARN of the <a href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>
  /// function that is used to preprocess the records in the stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  InputLambdaProcessorDescription({
    this.resourceARN,
    this.roleARN,
  });
  factory InputLambdaProcessorDescription.fromJson(Map<String, dynamic> json) =>
      _$InputLambdaProcessorDescriptionFromJson(json);
}

/// Represents an update to the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>
/// that is used to preprocess the records in the stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputLambdaProcessorUpdate {
  /// The Amazon Resource Name (ARN) of the new <a
  /// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a> function that is
  /// used to preprocess the records in the stream.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  /// The ARN of the new IAM role that is used to access the AWS Lambda function.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  InputLambdaProcessorUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$InputLambdaProcessorUpdateToJson(this);
}

/// Describes the number of in-application streams to create for a given
/// streaming source. For information about parallelism, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
/// Application Input</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputParallelism {
  /// Number of in-application streams to create. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html">Limits</a>.
  @_s.JsonKey(name: 'Count')
  final int count;

  InputParallelism({
    this.count,
  });
  factory InputParallelism.fromJson(Map<String, dynamic> json) =>
      _$InputParallelismFromJson(json);

  Map<String, dynamic> toJson() => _$InputParallelismToJson(this);
}

/// Provides updates to the parallelism count.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputParallelismUpdate {
  /// Number of in-application streams to create for the specified streaming
  /// source.
  @_s.JsonKey(name: 'CountUpdate')
  final int countUpdate;

  InputParallelismUpdate({
    this.countUpdate,
  });
  Map<String, dynamic> toJson() => _$InputParallelismUpdateToJson(this);
}

/// Provides a description of a processor that is used to preprocess the records
/// in the stream before being processed by your application code. Currently,
/// the only input processor available is <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputProcessingConfiguration {
  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>
  /// that is used to preprocess the records in the stream before being processed
  /// by your application code.
  @_s.JsonKey(name: 'InputLambdaProcessor')
  final InputLambdaProcessor inputLambdaProcessor;

  InputProcessingConfiguration({
    @_s.required this.inputLambdaProcessor,
  });
  Map<String, dynamic> toJson() => _$InputProcessingConfigurationToJson(this);
}

/// Provides configuration information about an input processor. Currently, the
/// only input processor available is <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputProcessingConfigurationDescription {
  /// Provides configuration information about the associated <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessorDescription.html">InputLambdaProcessorDescription</a>.
  @_s.JsonKey(name: 'InputLambdaProcessorDescription')
  final InputLambdaProcessorDescription inputLambdaProcessorDescription;

  InputProcessingConfigurationDescription({
    this.inputLambdaProcessorDescription,
  });
  factory InputProcessingConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$InputProcessingConfigurationDescriptionFromJson(json);
}

/// Describes updates to an <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputProcessingConfigurationUpdate {
  /// Provides update information for an <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>.
  @_s.JsonKey(name: 'InputLambdaProcessorUpdate')
  final InputLambdaProcessorUpdate inputLambdaProcessorUpdate;

  InputProcessingConfigurationUpdate({
    @_s.required this.inputLambdaProcessorUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$InputProcessingConfigurationUpdateToJson(this);
}

/// Describes updates for the application's input schema.
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

  /// Specifies the encoding of the records in the streaming source. For example,
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
  /// stream, start at the request time stamp that the customer issued.
  /// </li>
  /// <li>
  /// <code>TRIM_HORIZON</code> - Start reading at the last untrimmed record in
  /// the stream, which is the oldest record available in the stream. This option
  /// is not available for an Amazon Kinesis Firehose delivery stream.
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

/// Describes updates to a specific input configuration (identified by the
/// <code>InputId</code> of an application).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputUpdate {
  /// Input ID of the application input to be updated.
  @_s.JsonKey(name: 'InputId')
  final String inputId;

  /// Describes the parallelism updates (the number in-application streams Amazon
  /// Kinesis Analytics creates for the specific streaming source).
  @_s.JsonKey(name: 'InputParallelismUpdate')
  final InputParallelismUpdate inputParallelismUpdate;

  /// Describes updates for an input processing configuration.
  @_s.JsonKey(name: 'InputProcessingConfigurationUpdate')
  final InputProcessingConfigurationUpdate inputProcessingConfigurationUpdate;

  /// Describes the data format on the streaming source, and how record elements
  /// on the streaming source map to columns of the in-application stream that is
  /// created.
  @_s.JsonKey(name: 'InputSchemaUpdate')
  final InputSchemaUpdate inputSchemaUpdate;

  /// If an Amazon Kinesis Firehose delivery stream is the streaming source to be
  /// updated, provides an updated stream ARN and IAM role ARN.
  @_s.JsonKey(name: 'KinesisFirehoseInputUpdate')
  final KinesisFirehoseInputUpdate kinesisFirehoseInputUpdate;

  /// If an Amazon Kinesis stream is the streaming source to be updated, provides
  /// an updated stream Amazon Resource Name (ARN) and IAM role ARN.
  @_s.JsonKey(name: 'KinesisStreamsInputUpdate')
  final KinesisStreamsInputUpdate kinesisStreamsInputUpdate;

  /// Name prefix for in-application streams that Amazon Kinesis Analytics creates
  /// for the specific streaming source.
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

/// Provides additional mapping information when JSON is the record format on
/// the streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JSONMappingParameters {
  /// Path to the top-level parent that contains the records.
  @_s.JsonKey(name: 'RecordRowPath')
  final String recordRowPath;

  JSONMappingParameters({
    @_s.required this.recordRowPath,
  });
  factory JSONMappingParameters.fromJson(Map<String, dynamic> json) =>
      _$JSONMappingParametersFromJson(json);

  Map<String, dynamic> toJson() => _$JSONMappingParametersToJson(this);
}

/// Identifies an Amazon Kinesis Firehose delivery stream as the streaming
/// source. You provide the delivery stream's Amazon Resource Name (ARN) and an
/// IAM role ARN that enables Amazon Kinesis Analytics to access the stream on
/// your behalf.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseInput {
  /// ARN of the input delivery stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to make sure that the role has the necessary
  /// permissions to access the stream.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisFirehoseInput({
    @_s.required this.resourceARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseInputToJson(this);
}

/// Describes the Amazon Kinesis Firehose delivery stream that is configured as
/// the streaming source in the application input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisFirehoseInputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics assumes to access the
  /// stream.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisFirehoseInputDescription({
    this.resourceARN,
    this.roleARN,
  });
  factory KinesisFirehoseInputDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisFirehoseInputDescriptionFromJson(json);
}

/// When updating application input configuration, provides information about an
/// Amazon Kinesis Firehose delivery stream as the streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseInputUpdate {
  /// Amazon Resource Name (ARN) of the input Amazon Kinesis Firehose delivery
  /// stream to read.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  KinesisFirehoseInputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseInputUpdateToJson(this);
}

/// When configuring application output, identifies an Amazon Kinesis Firehose
/// delivery stream as the destination. You provide the stream Amazon Resource
/// Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to write to
/// the stream on your behalf.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseOutput {
  /// ARN of the destination Amazon Kinesis Firehose delivery stream to write to.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination stream on your behalf. You need to grant the necessary
  /// permissions to this role.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisFirehoseOutput({
    @_s.required this.resourceARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseOutputToJson(this);
}

/// For an application output, describes the Amazon Kinesis Firehose delivery
/// stream configured as its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisFirehoseOutputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisFirehoseOutputDescription({
    this.resourceARN,
    this.roleARN,
  });
  factory KinesisFirehoseOutputDescription.fromJson(
          Map<String, dynamic> json) =>
      _$KinesisFirehoseOutputDescriptionFromJson(json);
}

/// When updating an output configuration using the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation, provides information about an Amazon Kinesis Firehose delivery
/// stream configured as the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisFirehoseOutputUpdate {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream to
  /// write to.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  KinesisFirehoseOutputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisFirehoseOutputUpdateToJson(this);
}

/// Identifies an Amazon Kinesis stream as the streaming source. You provide the
/// stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon
/// Kinesis Analytics to access the stream on your behalf.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsInput {
  /// ARN of the input Amazon Kinesis stream to read.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamsInput({
    @_s.required this.resourceARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsInputToJson(this);
}

/// Describes the Amazon Kinesis stream that is configured as the streaming
/// source in the application input configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisStreamsInputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamsInputDescription({
    this.resourceARN,
    this.roleARN,
  });
  factory KinesisStreamsInputDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisStreamsInputDescriptionFromJson(json);
}

/// When updating application input configuration, provides information about an
/// Amazon Kinesis stream as the streaming source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsInputUpdate {
  /// Amazon Resource Name (ARN) of the input Amazon Kinesis stream to read.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  KinesisStreamsInputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsInputUpdateToJson(this);
}

/// When configuring application output, identifies an Amazon Kinesis stream as
/// the destination. You provide the stream Amazon Resource Name (ARN) and also
/// an IAM role ARN that Amazon Kinesis Analytics can use to write to the stream
/// on your behalf.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsOutput {
  /// ARN of the destination Amazon Kinesis stream to write to.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination stream on your behalf. You need to grant the necessary
  /// permissions to this role.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamsOutput({
    @_s.required this.resourceARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsOutputToJson(this);
}

/// For an application output, describes the Amazon Kinesis stream configured as
/// its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisStreamsOutputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamsOutputDescription({
    this.resourceARN,
    this.roleARN,
  });
  factory KinesisStreamsOutputDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisStreamsOutputDescriptionFromJson(json);
}

/// When updating an output configuration using the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation, provides information about an Amazon Kinesis stream configured as
/// the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamsOutputUpdate {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream where you want to
  /// write the output.
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  KinesisStreamsOutputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$KinesisStreamsOutputUpdateToJson(this);
}

/// When configuring application output, identifies an AWS Lambda function as
/// the destination. You provide the function Amazon Resource Name (ARN) and
/// also an IAM role ARN that Amazon Kinesis Analytics can use to write to the
/// function on your behalf.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaOutput {
  /// Amazon Resource Name (ARN) of the destination Lambda function to write to.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination function on your behalf. You need to grant the necessary
  /// permissions to this role.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  LambdaOutput({
    @_s.required this.resourceARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$LambdaOutputToJson(this);
}

/// For an application output, describes the AWS Lambda function configured as
/// its destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaOutputDescription {
  /// Amazon Resource Name (ARN) of the destination Lambda function.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination function.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  LambdaOutputDescription({
    this.resourceARN,
    this.roleARN,
  });
  factory LambdaOutputDescription.fromJson(Map<String, dynamic> json) =>
      _$LambdaOutputDescriptionFromJson(json);
}

/// When updating an output configuration using the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation, provides information about an AWS Lambda function configured as
/// the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LambdaOutputUpdate {
  /// Amazon Resource Name (ARN) of the destination Lambda function.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  @_s.JsonKey(name: 'ResourceARNUpdate')
  final String resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination function on your behalf. You need to grant the necessary
  /// permissions to this role.
  @_s.JsonKey(name: 'RoleARNUpdate')
  final String roleARNUpdate;

  LambdaOutputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$LambdaOutputUpdateToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApplicationsResponse {
  /// List of <code>ApplicationSummary</code> objects.
  @_s.JsonKey(name: 'ApplicationSummaries')
  final List<ApplicationSummary> applicationSummaries;

  /// Returns true if there are more applications to retrieve.
  @_s.JsonKey(name: 'HasMoreApplications')
  final bool hasMoreApplications;

  ListApplicationsResponse({
    @_s.required this.applicationSummaries,
    @_s.required this.hasMoreApplications,
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

/// When configuring application input at the time of creating or updating an
/// application, provides additional mapping information specific to the record
/// format (such as JSON, CSV, or record fields delimited by some delimiter) on
/// the streaming source.
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

/// Describes application output configuration in which you identify an
/// in-application stream and a destination where you want the in-application
/// stream data to be written. The destination can be an Amazon Kinesis stream
/// or an Amazon Kinesis Firehose delivery stream.
/// <p/>
/// For limits on how many destinations an application can write and other
/// limitations, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html">Limits</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Output {
  /// Describes the data format when records are written to the destination. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  @_s.JsonKey(name: 'DestinationSchema')
  final DestinationSchema destinationSchema;

  /// Name of the in-application stream.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Identifies an Amazon Kinesis Firehose delivery stream as the destination.
  @_s.JsonKey(name: 'KinesisFirehoseOutput')
  final KinesisFirehoseOutput kinesisFirehoseOutput;

  /// Identifies an Amazon Kinesis stream as the destination.
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

/// Describes the application output configuration, which includes the
/// in-application stream name and the destination where the stream data is
/// written. The destination can be an Amazon Kinesis stream or an Amazon
/// Kinesis Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputDescription {
  /// Data format used for writing data to the destination.
  @_s.JsonKey(name: 'DestinationSchema')
  final DestinationSchema destinationSchema;

  /// Describes the Amazon Kinesis Firehose delivery stream configured as the
  /// destination where output is written.
  @_s.JsonKey(name: 'KinesisFirehoseOutputDescription')
  final KinesisFirehoseOutputDescription kinesisFirehoseOutputDescription;

  /// Describes Amazon Kinesis stream configured as the destination where output
  /// is written.
  @_s.JsonKey(name: 'KinesisStreamsOutputDescription')
  final KinesisStreamsOutputDescription kinesisStreamsOutputDescription;

  /// Describes the AWS Lambda function configured as the destination where output
  /// is written.
  @_s.JsonKey(name: 'LambdaOutputDescription')
  final LambdaOutputDescription lambdaOutputDescription;

  /// Name of the in-application stream configured as output.
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

/// Describes updates to the output configuration identified by the
/// <code>OutputId</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OutputUpdate {
  /// Identifies the specific output configuration that you want to update.
  @_s.JsonKey(name: 'OutputId')
  final String outputId;

  /// Describes the data format when records are written to the destination. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  @_s.JsonKey(name: 'DestinationSchemaUpdate')
  final DestinationSchema destinationSchemaUpdate;

  /// Describes an Amazon Kinesis Firehose delivery stream as the destination for
  /// the output.
  @_s.JsonKey(name: 'KinesisFirehoseOutputUpdate')
  final KinesisFirehoseOutputUpdate kinesisFirehoseOutputUpdate;

  /// Describes an Amazon Kinesis stream as the destination for the output.
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

/// Describes the mapping of each data element in the streaming source to the
/// corresponding column in the in-application stream.
///
/// Also used to describe the format of the reference data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecordColumn {
  /// Name of the column created in the in-application input stream or reference
  /// table.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Type of column created in the in-application input stream or reference
  /// table.
  @_s.JsonKey(name: 'SqlType')
  final String sqlType;

  /// Reference to the data element in the streaming input or the reference data
  /// source. This element is required if the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_RecordFormat.html#analytics-Type-RecordFormat-RecordFormatTypel">RecordFormatType</a>
  /// is <code>JSON</code>.
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

/// Describes the record format and relevant mapping information that should be
/// applied to schematize the records on the stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecordFormat {
  /// The type of record format.
  @_s.JsonKey(name: 'RecordFormatType')
  final RecordFormatType recordFormatType;

  /// When configuring application input at the time of creating or updating an
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

/// Describes the reference data source by providing the source information (S3
/// bucket name and object key name), the resulting in-application table name
/// that is created, and the necessary schema to map the data elements in the
/// Amazon S3 object to the in-application table.
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

  /// Name of the in-application table to create.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// Identifies the S3 bucket and object that contains the reference data. Also
  /// identifies the IAM role Amazon Kinesis Analytics can assume to read this
  /// object on your behalf. An Amazon Kinesis Analytics application loads
  /// reference data only once. If the data changes, you call the
  /// <code>UpdateApplication</code> operation to trigger reloading of data into
  /// your application.
  @_s.JsonKey(name: 'S3ReferenceDataSource')
  final S3ReferenceDataSource s3ReferenceDataSource;

  ReferenceDataSource({
    @_s.required this.referenceSchema,
    @_s.required this.tableName,
    this.s3ReferenceDataSource,
  });
  Map<String, dynamic> toJson() => _$ReferenceDataSourceToJson(this);
}

/// Describes the reference data source configured for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReferenceDataSourceDescription {
  /// ID of the reference data source. This is the ID that Amazon Kinesis
  /// Analytics assigns when you add the reference data source to your application
  /// using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html">AddApplicationReferenceDataSource</a>
  /// operation.
  @_s.JsonKey(name: 'ReferenceId')
  final String referenceId;

  /// Provides the S3 bucket name, the object key name that contains the reference
  /// data. It also provides the Amazon Resource Name (ARN) of the IAM role that
  /// Amazon Kinesis Analytics can assume to read the Amazon S3 object and
  /// populate the in-application reference table.
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

/// When you update a reference data source configuration for an application,
/// this object provides all the updated values (such as the source bucket name
/// and object key name), the in-application table name that is created, and
/// updated mapping information that maps the data in the Amazon S3 object to
/// the in-application reference table that is created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReferenceDataSourceUpdate {
  /// ID of the reference data source being updated. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get this value.
  @_s.JsonKey(name: 'ReferenceId')
  final String referenceId;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  @_s.JsonKey(name: 'ReferenceSchemaUpdate')
  final SourceSchema referenceSchemaUpdate;

  /// Describes the S3 bucket name, object key name, and IAM role that Amazon
  /// Kinesis Analytics can assume to read the Amazon S3 object on your behalf and
  /// populate the in-application reference table.
  @_s.JsonKey(name: 'S3ReferenceDataSourceUpdate')
  final S3ReferenceDataSourceUpdate s3ReferenceDataSourceUpdate;

  /// In-application table name that is created by this update.
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

/// Provides a description of an Amazon S3 data source, including the Amazon
/// Resource Name (ARN) of the S3 bucket, the ARN of the IAM role that is used
/// to access the bucket, and the name of the Amazon S3 object that contains the
/// data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3Configuration {
  /// ARN of the S3 bucket that contains the data.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The name of the object that contains the data.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  /// IAM ARN of the role used to access the data.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  S3Configuration({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() => _$S3ConfigurationToJson(this);
}

/// Identifies the S3 bucket and object that contains the reference data. Also
/// identifies the IAM role Amazon Kinesis Analytics can assume to read this
/// object on your behalf.
///
/// An Amazon Kinesis Analytics application loads reference data only once. If
/// the data changes, you call the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation to trigger reloading of data into your application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ReferenceDataSource {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// Object key name containing reference data.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  /// ARN of the IAM role that the service can assume to read data on your behalf.
  /// This role must have permission for the <code>s3:GetObject</code> action on
  /// the object and trust policy that allows Amazon Kinesis Analytics service
  /// principal to assume this role.
  @_s.JsonKey(name: 'ReferenceRoleARN')
  final String referenceRoleARN;

  S3ReferenceDataSource({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
    @_s.required this.referenceRoleARN,
  });
  Map<String, dynamic> toJson() => _$S3ReferenceDataSourceToJson(this);
}

/// Provides the bucket name and object key name that stores the reference data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3ReferenceDataSourceDescription {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// Amazon S3 object key name.
  @_s.JsonKey(name: 'FileKey')
  final String fileKey;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to read the
  /// Amazon S3 object on your behalf to populate the in-application reference
  /// table.
  @_s.JsonKey(name: 'ReferenceRoleARN')
  final String referenceRoleARN;

  S3ReferenceDataSourceDescription({
    @_s.required this.bucketARN,
    @_s.required this.fileKey,
    @_s.required this.referenceRoleARN,
  });
  factory S3ReferenceDataSourceDescription.fromJson(
          Map<String, dynamic> json) =>
      _$S3ReferenceDataSourceDescriptionFromJson(json);
}

/// Describes the S3 bucket name, object key name, and IAM role that Amazon
/// Kinesis Analytics can assume to read the Amazon S3 object on your behalf and
/// populate the in-application reference table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3ReferenceDataSourceUpdate {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'BucketARNUpdate')
  final String bucketARNUpdate;

  /// Object key name.
  @_s.JsonKey(name: 'FileKeyUpdate')
  final String fileKeyUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to read the
  /// Amazon S3 object and populate the in-application.
  @_s.JsonKey(name: 'ReferenceRoleARNUpdate')
  final String referenceRoleARNUpdate;

  S3ReferenceDataSourceUpdate({
    this.bucketARNUpdate,
    this.fileKeyUpdate,
    this.referenceRoleARNUpdate,
  });
  Map<String, dynamic> toJson() => _$S3ReferenceDataSourceUpdateToJson(this);
}

/// Describes the format of the data in the streaming source, and how each data
/// element maps to corresponding columns created in the in-application stream.
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

/// <p/>
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

/// <p/>
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
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html">Using
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
  UpdateApplicationResponse();
  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApplicationResponseFromJson(json);
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
