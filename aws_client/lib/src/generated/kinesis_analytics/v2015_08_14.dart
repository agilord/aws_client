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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisanalytics',
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
    required String applicationName,
    required CloudWatchLoggingOption cloudWatchLoggingOption,
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
      'X-Amz-Target':
          'KinesisAnalytics_20150814.AddApplicationCloudWatchLoggingOption'
    };
    await _protocol.send(
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.AddApplicationInput'
    };
    await _protocol.send(
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
          'KinesisAnalytics_20150814.AddApplicationInputProcessingConfiguration'
    };
    await _protocol.send(
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.AddApplicationOutput'
    };
    await _protocol.send(
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
          'KinesisAnalytics_20150814.AddApplicationReferenceDataSource'
    };
    await _protocol.send(
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
    required String applicationName,
    String? applicationCode,
    String? applicationDescription,
    List<CloudWatchLoggingOption>? cloudWatchLoggingOptions,
    List<Input>? inputs,
    List<Output>? outputs,
    List<Tag>? tags,
  }) async {
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
    required String applicationName,
    required DateTime createTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.DeleteApplication'
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
    required String applicationName,
    required String cloudWatchLoggingOptionId,
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
      'X-Amz-Target':
          'KinesisAnalytics_20150814.DeleteApplicationCloudWatchLoggingOption'
    };
    await _protocol.send(
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
          'KinesisAnalytics_20150814.DeleteApplicationInputProcessingConfiguration'
    };
    await _protocol.send(
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.DeleteApplicationOutput'
    };
    await _protocol.send(
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
          'KinesisAnalytics_20150814.DeleteApplicationReferenceDataSource'
    };
    await _protocol.send(
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
    required String applicationName,
  }) async {
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
    InputProcessingConfiguration? inputProcessingConfiguration,
    InputStartingPositionConfiguration? inputStartingPositionConfiguration,
    String? resourceARN,
    String? roleARN,
    S3Configuration? s3Configuration,
  }) async {
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
    String? exclusiveStartApplicationName,
    int? limit,
  }) async {
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
    required String resourceARN,
  }) async {
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
    required String applicationName,
    required List<InputConfiguration> inputConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.StartApplication'
    };
    await _protocol.send(
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
    required String applicationName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.StopApplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ApplicationName': applicationName,
      },
    );
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
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.TagResource'
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
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'KinesisAnalytics_20150814.UntagResource'
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
    required String applicationName,
    required ApplicationUpdate applicationUpdate,
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
      'X-Amz-Target': 'KinesisAnalytics_20150814.UpdateApplication'
    };
    await _protocol.send(
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
  }
}

class AddApplicationCloudWatchLoggingOptionResponse {
  AddApplicationCloudWatchLoggingOptionResponse();

  factory AddApplicationCloudWatchLoggingOptionResponse.fromJson(
      Map<String, dynamic> _) {
    return AddApplicationCloudWatchLoggingOptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AddApplicationInputProcessingConfigurationResponse {
  AddApplicationInputProcessingConfigurationResponse();

  factory AddApplicationInputProcessingConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return AddApplicationInputProcessingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class AddApplicationInputResponse {
  AddApplicationInputResponse();

  factory AddApplicationInputResponse.fromJson(Map<String, dynamic> _) {
    return AddApplicationInputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class AddApplicationOutputResponse {
  AddApplicationOutputResponse();

  factory AddApplicationOutputResponse.fromJson(Map<String, dynamic> _) {
    return AddApplicationOutputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class AddApplicationReferenceDataSourceResponse {
  AddApplicationReferenceDataSourceResponse();

  factory AddApplicationReferenceDataSourceResponse.fromJson(
      Map<String, dynamic> _) {
    return AddApplicationReferenceDataSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
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
class ApplicationDetail {
  /// ARN of the application.
  final String applicationARN;

  /// Name of the application.
  final String applicationName;

  /// Status of the application.
  final ApplicationStatus applicationStatus;

  /// Provides the current application version.
  final int applicationVersionId;

  /// Returns the application code that you provided to perform data analysis on
  /// any of the in-application streams in your application.
  final String? applicationCode;

  /// Description of the application.
  final String? applicationDescription;

  /// Describes the CloudWatch log streams that are configured to receive
  /// application messages. For more information about using CloudWatch log
  /// streams with Amazon Kinesis Analytics applications, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/cloudwatch-logs.html">Working
  /// with Amazon CloudWatch Logs</a>.
  final List<CloudWatchLoggingOptionDescription>?
      cloudWatchLoggingOptionDescriptions;

  /// Time stamp when the application version was created.
  final DateTime? createTimestamp;

  /// Describes the application input configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  final List<InputDescription>? inputDescriptions;

  /// Time stamp when the application was last updated.
  final DateTime? lastUpdateTimestamp;

  /// Describes the application output configuration. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  final List<OutputDescription>? outputDescriptions;

  /// Describes reference data sources configured for the application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  final List<ReferenceDataSourceDescription>? referenceDataSourceDescriptions;

  ApplicationDetail({
    required this.applicationARN,
    required this.applicationName,
    required this.applicationStatus,
    required this.applicationVersionId,
    this.applicationCode,
    this.applicationDescription,
    this.cloudWatchLoggingOptionDescriptions,
    this.createTimestamp,
    this.inputDescriptions,
    this.lastUpdateTimestamp,
    this.outputDescriptions,
    this.referenceDataSourceDescriptions,
  });

  factory ApplicationDetail.fromJson(Map<String, dynamic> json) {
    return ApplicationDetail(
      applicationARN: json['ApplicationARN'] as String,
      applicationName: json['ApplicationName'] as String,
      applicationStatus:
          (json['ApplicationStatus'] as String).toApplicationStatus(),
      applicationVersionId: json['ApplicationVersionId'] as int,
      applicationCode: json['ApplicationCode'] as String?,
      applicationDescription: json['ApplicationDescription'] as String?,
      cloudWatchLoggingOptionDescriptions:
          (json['CloudWatchLoggingOptionDescriptions'] as List?)
              ?.whereNotNull()
              .map((e) => CloudWatchLoggingOptionDescription.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      createTimestamp: timeStampFromJson(json['CreateTimestamp']),
      inputDescriptions: (json['InputDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => InputDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
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
    final applicationARN = this.applicationARN;
    final applicationName = this.applicationName;
    final applicationStatus = this.applicationStatus;
    final applicationVersionId = this.applicationVersionId;
    final applicationCode = this.applicationCode;
    final applicationDescription = this.applicationDescription;
    final cloudWatchLoggingOptionDescriptions =
        this.cloudWatchLoggingOptionDescriptions;
    final createTimestamp = this.createTimestamp;
    final inputDescriptions = this.inputDescriptions;
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final outputDescriptions = this.outputDescriptions;
    final referenceDataSourceDescriptions =
        this.referenceDataSourceDescriptions;
    return {
      'ApplicationARN': applicationARN,
      'ApplicationName': applicationName,
      'ApplicationStatus': applicationStatus.toValue(),
      'ApplicationVersionId': applicationVersionId,
      if (applicationCode != null) 'ApplicationCode': applicationCode,
      if (applicationDescription != null)
        'ApplicationDescription': applicationDescription,
      if (cloudWatchLoggingOptionDescriptions != null)
        'CloudWatchLoggingOptionDescriptions':
            cloudWatchLoggingOptionDescriptions,
      if (createTimestamp != null)
        'CreateTimestamp': unixTimestampToJson(createTimestamp),
      if (inputDescriptions != null) 'InputDescriptions': inputDescriptions,
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (outputDescriptions != null) 'OutputDescriptions': outputDescriptions,
      if (referenceDataSourceDescriptions != null)
        'ReferenceDataSourceDescriptions': referenceDataSourceDescriptions,
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
    }
    throw Exception('$this is not known in enum ApplicationStatus');
  }
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
class ApplicationSummary {
  /// ARN of the application.
  final String applicationARN;

  /// Name of the application.
  final String applicationName;

  /// Status of the application.
  final ApplicationStatus applicationStatus;

  ApplicationSummary({
    required this.applicationARN,
    required this.applicationName,
    required this.applicationStatus,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      applicationARN: json['ApplicationARN'] as String,
      applicationName: json['ApplicationName'] as String,
      applicationStatus:
          (json['ApplicationStatus'] as String).toApplicationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationARN = this.applicationARN;
    final applicationName = this.applicationName;
    final applicationStatus = this.applicationStatus;
    return {
      'ApplicationARN': applicationARN,
      'ApplicationName': applicationName,
      'ApplicationStatus': applicationStatus.toValue(),
    };
  }
}

/// Describes updates to apply to an existing Amazon Kinesis Analytics
/// application.
class ApplicationUpdate {
  /// Describes application code updates.
  final String? applicationCodeUpdate;

  /// Describes application CloudWatch logging option updates.
  final List<CloudWatchLoggingOptionUpdate>? cloudWatchLoggingOptionUpdates;

  /// Describes application input configuration updates.
  final List<InputUpdate>? inputUpdates;

  /// Describes application output configuration updates.
  final List<OutputUpdate>? outputUpdates;

  /// Describes application reference data source updates.
  final List<ReferenceDataSourceUpdate>? referenceDataSourceUpdates;

  ApplicationUpdate({
    this.applicationCodeUpdate,
    this.cloudWatchLoggingOptionUpdates,
    this.inputUpdates,
    this.outputUpdates,
    this.referenceDataSourceUpdates,
  });

  Map<String, dynamic> toJson() {
    final applicationCodeUpdate = this.applicationCodeUpdate;
    final cloudWatchLoggingOptionUpdates = this.cloudWatchLoggingOptionUpdates;
    final inputUpdates = this.inputUpdates;
    final outputUpdates = this.outputUpdates;
    final referenceDataSourceUpdates = this.referenceDataSourceUpdates;
    return {
      if (applicationCodeUpdate != null)
        'ApplicationCodeUpdate': applicationCodeUpdate,
      if (cloudWatchLoggingOptionUpdates != null)
        'CloudWatchLoggingOptionUpdates': cloudWatchLoggingOptionUpdates,
      if (inputUpdates != null) 'InputUpdates': inputUpdates,
      if (outputUpdates != null) 'OutputUpdates': outputUpdates,
      if (referenceDataSourceUpdates != null)
        'ReferenceDataSourceUpdates': referenceDataSourceUpdates,
    };
  }
}

/// Provides additional mapping information when the record format uses
/// delimiters, such as CSV. For example, the following sample records use CSV
/// format, where the records use the <i>'\n'</i> as the row delimiter and a
/// comma (",") as the column delimiter:
///
/// <code>"name1", "address1"</code>
///
/// <code>"name2", "address2"</code>
class CSVMappingParameters {
  /// Column delimiter. For example, in a CSV format, a comma (",") is the typical
  /// column delimiter.
  final String recordColumnDelimiter;

  /// Row delimiter. For example, in a CSV format, <i>'\n'</i> is the typical row
  /// delimiter.
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

/// Provides a description of CloudWatch logging options, including the log
/// stream Amazon Resource Name (ARN) and the role ARN.
class CloudWatchLoggingOption {
  /// ARN of the CloudWatch log to receive application messages.
  final String logStreamARN;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role that is used must have the
  /// <code>PutLogEvents</code> policy action enabled.
  final String roleARN;

  CloudWatchLoggingOption({
    required this.logStreamARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final logStreamARN = this.logStreamARN;
    final roleARN = this.roleARN;
    return {
      'LogStreamARN': logStreamARN,
      'RoleARN': roleARN,
    };
  }
}

/// Description of the CloudWatch logging option.
class CloudWatchLoggingOptionDescription {
  /// ARN of the CloudWatch log to receive application messages.
  final String logStreamARN;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role used must have the
  /// <code>PutLogEvents</code> policy action enabled.
  final String roleARN;

  /// ID of the CloudWatch logging option description.
  final String? cloudWatchLoggingOptionId;

  CloudWatchLoggingOptionDescription({
    required this.logStreamARN,
    required this.roleARN,
    this.cloudWatchLoggingOptionId,
  });

  factory CloudWatchLoggingOptionDescription.fromJson(
      Map<String, dynamic> json) {
    return CloudWatchLoggingOptionDescription(
      logStreamARN: json['LogStreamARN'] as String,
      roleARN: json['RoleARN'] as String,
      cloudWatchLoggingOptionId: json['CloudWatchLoggingOptionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logStreamARN = this.logStreamARN;
    final roleARN = this.roleARN;
    final cloudWatchLoggingOptionId = this.cloudWatchLoggingOptionId;
    return {
      'LogStreamARN': logStreamARN,
      'RoleARN': roleARN,
      if (cloudWatchLoggingOptionId != null)
        'CloudWatchLoggingOptionId': cloudWatchLoggingOptionId,
    };
  }
}

/// Describes CloudWatch logging option updates.
class CloudWatchLoggingOptionUpdate {
  /// ID of the CloudWatch logging option to update
  final String cloudWatchLoggingOptionId;

  /// ARN of the CloudWatch log to receive application messages.
  final String? logStreamARNUpdate;

  /// IAM ARN of the role to use to send application messages. Note: To write
  /// application messages to CloudWatch, the IAM role used must have the
  /// <code>PutLogEvents</code> policy action enabled.
  final String? roleARNUpdate;

  CloudWatchLoggingOptionUpdate({
    required this.cloudWatchLoggingOptionId,
    this.logStreamARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchLoggingOptionId = this.cloudWatchLoggingOptionId;
    final logStreamARNUpdate = this.logStreamARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      'CloudWatchLoggingOptionId': cloudWatchLoggingOptionId,
      if (logStreamARNUpdate != null) 'LogStreamARNUpdate': logStreamARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// TBD
class CreateApplicationResponse {
  /// In response to your <code>CreateApplication</code> request, Amazon Kinesis
  /// Analytics returns a response with a summary of the application it created,
  /// including the application Amazon Resource Name (ARN), name, and status.
  final ApplicationSummary applicationSummary;

  CreateApplicationResponse({
    required this.applicationSummary,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationSummary: ApplicationSummary.fromJson(
          json['ApplicationSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSummary = this.applicationSummary;
    return {
      'ApplicationSummary': applicationSummary,
    };
  }
}

class DeleteApplicationCloudWatchLoggingOptionResponse {
  DeleteApplicationCloudWatchLoggingOptionResponse();

  factory DeleteApplicationCloudWatchLoggingOptionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteApplicationCloudWatchLoggingOptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationInputProcessingConfigurationResponse {
  DeleteApplicationInputProcessingConfigurationResponse();

  factory DeleteApplicationInputProcessingConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteApplicationInputProcessingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class DeleteApplicationOutputResponse {
  DeleteApplicationOutputResponse();

  factory DeleteApplicationOutputResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationOutputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationReferenceDataSourceResponse {
  DeleteApplicationReferenceDataSourceResponse();

  factory DeleteApplicationReferenceDataSourceResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteApplicationReferenceDataSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
class DescribeApplicationResponse {
  /// Provides a description of the application, such as the application Amazon
  /// Resource Name (ARN), status, latest version, and input and output
  /// configuration details.
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

/// Describes the data format when records are written to the destination. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
/// Application Output</a>.
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

/// <p/>
class DiscoverInputSchemaResponse {
  /// Schema inferred from the streaming source. It identifies the format of the
  /// data in the streaming source and how each data element maps to corresponding
  /// columns in the in-application stream that you can create.
  final SourceSchema? inputSchema;

  /// An array of elements, where each element corresponds to a row in a stream
  /// record (a stream record can have more than one row).
  final List<List<String>>? parsedInputRecords;

  /// Stream data that was modified by the processor specified in the
  /// <code>InputProcessingConfiguration</code> parameter.
  final List<String>? processedInputRecords;

  /// Raw stream data that was sampled to infer the schema.
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

/// When you configure the application input, you specify the streaming source,
/// the in-application stream name that is created, and the mapping between the
/// two. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
/// Application Input</a>.
class Input {
  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns in the in-application stream that is
  /// being created.
  ///
  /// Also used to describe the format of the reference data source.
  final SourceSchema inputSchema;

  /// Name prefix to use when creating an in-application stream. Suppose that you
  /// specify a prefix "MyInApplicationStream." Amazon Kinesis Analytics then
  /// creates one or more (as per the <code>InputParallelism</code> count you
  /// specified) in-application streams with names "MyInApplicationStream_001,"
  /// "MyInApplicationStream_002," and so on.
  final String namePrefix;

  /// Describes the number of in-application streams to create.
  ///
  /// Data from your source is routed to these in-application input streams.
  ///
  /// (see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
  /// Application Input</a>.
  final InputParallelism? inputParallelism;

  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>
  /// for the input. An input processor transforms records as they are received
  /// from the stream, before the application's SQL code executes. Currently, the
  /// only input processing configuration available is <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>.
  final InputProcessingConfiguration? inputProcessingConfiguration;

  /// If the streaming source is an Amazon Kinesis Firehose delivery stream,
  /// identifies the delivery stream's ARN and an IAM role that enables Amazon
  /// Kinesis Analytics to access the stream on your behalf.
  ///
  /// Note: Either <code>KinesisStreamsInput</code> or
  /// <code>KinesisFirehoseInput</code> is required.
  final KinesisFirehoseInput? kinesisFirehoseInput;

  /// If the streaming source is an Amazon Kinesis stream, identifies the stream's
  /// Amazon Resource Name (ARN) and an IAM role that enables Amazon Kinesis
  /// Analytics to access the stream on your behalf.
  ///
  /// Note: Either <code>KinesisStreamsInput</code> or
  /// <code>KinesisFirehoseInput</code> is required.
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

/// When you start your application, you provide this configuration, which
/// identifies the input source and the point in the input source at which you
/// want the application to start processing records.
class InputConfiguration {
  /// Input source ID. You can get this ID by calling the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation.
  final String id;

  /// Point at which you want the application to start processing records from the
  /// streaming source.
  final InputStartingPositionConfiguration inputStartingPositionConfiguration;

  InputConfiguration({
    required this.id,
    required this.inputStartingPositionConfiguration,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final inputStartingPositionConfiguration =
        this.inputStartingPositionConfiguration;
    return {
      'Id': id,
      'InputStartingPositionConfiguration': inputStartingPositionConfiguration,
    };
  }
}

/// Describes the application input configuration. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
/// Application Input</a>.
class InputDescription {
  /// Returns the in-application stream names that are mapped to the stream
  /// source.
  final List<String>? inAppStreamNames;

  /// Input ID associated with the application input. This is the ID that Amazon
  /// Kinesis Analytics assigns to each input configuration you add to your
  /// application.
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

  /// Point at which the application is configured to read from the input stream.
  final InputStartingPositionConfiguration? inputStartingPositionConfiguration;

  /// If an Amazon Kinesis Firehose delivery stream is configured as a streaming
  /// source, provides the delivery stream's ARN and an IAM role that enables
  /// Amazon Kinesis Analytics to access the stream on your behalf.
  final KinesisFirehoseInputDescription? kinesisFirehoseInputDescription;

  /// If an Amazon Kinesis stream is configured as streaming source, provides
  /// Amazon Kinesis stream's Amazon Resource Name (ARN) and an IAM role that
  /// enables Amazon Kinesis Analytics to access the stream on your behalf.
  final KinesisStreamsInputDescription? kinesisStreamsInputDescription;

  /// In-application name prefix.
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

/// An object that contains the Amazon Resource Name (ARN) of the <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a> function that is
/// used to preprocess records in the stream, and the ARN of the IAM role that
/// is used to access the AWS Lambda function.
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
  final String resourceARN;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  final String roleARN;

  InputLambdaProcessor({
    required this.resourceARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      'RoleARN': roleARN,
    };
  }
}

/// An object that contains the Amazon Resource Name (ARN) of the <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a> function that is
/// used to preprocess records in the stream, and the ARN of the IAM role that
/// is used to access the AWS Lambda expression.
class InputLambdaProcessorDescription {
  /// The ARN of the <a href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>
  /// function that is used to preprocess the records in the stream.
  final String? resourceARN;

  /// The ARN of the IAM role that is used to access the AWS Lambda function.
  final String? roleARN;

  InputLambdaProcessorDescription({
    this.resourceARN,
    this.roleARN,
  });

  factory InputLambdaProcessorDescription.fromJson(Map<String, dynamic> json) {
    return InputLambdaProcessorDescription(
      resourceARN: json['ResourceARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// Represents an update to the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>
/// that is used to preprocess the records in the stream.
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
  final String? resourceARNUpdate;

  /// The ARN of the new IAM role that is used to access the AWS Lambda function.
  final String? roleARNUpdate;

  InputLambdaProcessorUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      if (resourceARNUpdate != null) 'ResourceARNUpdate': resourceARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// Describes the number of in-application streams to create for a given
/// streaming source. For information about parallelism, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-input.html">Configuring
/// Application Input</a>.
class InputParallelism {
  /// Number of in-application streams to create. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html">Limits</a>.
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

/// Provides updates to the parallelism count.
class InputParallelismUpdate {
  /// Number of in-application streams to create for the specified streaming
  /// source.
  final int? countUpdate;

  InputParallelismUpdate({
    this.countUpdate,
  });

  Map<String, dynamic> toJson() {
    final countUpdate = this.countUpdate;
    return {
      if (countUpdate != null) 'CountUpdate': countUpdate,
    };
  }
}

/// Provides a description of a processor that is used to preprocess the records
/// in the stream before being processed by your application code. Currently,
/// the only input processor available is <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
class InputProcessingConfiguration {
  /// The <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>
  /// that is used to preprocess the records in the stream before being processed
  /// by your application code.
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

/// Provides configuration information about an input processor. Currently, the
/// only input processor available is <a
/// href="https://docs.aws.amazon.com/lambda/">AWS Lambda</a>.
class InputProcessingConfigurationDescription {
  /// Provides configuration information about the associated <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessorDescription.html">InputLambdaProcessorDescription</a>.
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

/// Describes updates to an <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputProcessingConfiguration.html">InputProcessingConfiguration</a>.
class InputProcessingConfigurationUpdate {
  /// Provides update information for an <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_InputLambdaProcessor.html">InputLambdaProcessor</a>.
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

/// Describes updates for the application's input schema.
class InputSchemaUpdate {
  /// A list of <code>RecordColumn</code> objects. Each object describes the
  /// mapping of the streaming source element to the corresponding column in the
  /// in-application stream.
  final List<RecordColumn>? recordColumnUpdates;

  /// Specifies the encoding of the records in the streaming source. For example,
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

/// Describes updates to a specific input configuration (identified by the
/// <code>InputId</code> of an application).
class InputUpdate {
  /// Input ID of the application input to be updated.
  final String inputId;

  /// Describes the parallelism updates (the number in-application streams Amazon
  /// Kinesis Analytics creates for the specific streaming source).
  final InputParallelismUpdate? inputParallelismUpdate;

  /// Describes updates for an input processing configuration.
  final InputProcessingConfigurationUpdate? inputProcessingConfigurationUpdate;

  /// Describes the data format on the streaming source, and how record elements
  /// on the streaming source map to columns of the in-application stream that is
  /// created.
  final InputSchemaUpdate? inputSchemaUpdate;

  /// If an Amazon Kinesis Firehose delivery stream is the streaming source to be
  /// updated, provides an updated stream ARN and IAM role ARN.
  final KinesisFirehoseInputUpdate? kinesisFirehoseInputUpdate;

  /// If an Amazon Kinesis stream is the streaming source to be updated, provides
  /// an updated stream Amazon Resource Name (ARN) and IAM role ARN.
  final KinesisStreamsInputUpdate? kinesisStreamsInputUpdate;

  /// Name prefix for in-application streams that Amazon Kinesis Analytics creates
  /// for the specific streaming source.
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

/// Provides additional mapping information when JSON is the record format on
/// the streaming source.
class JSONMappingParameters {
  /// Path to the top-level parent that contains the records.
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

/// Identifies an Amazon Kinesis Firehose delivery stream as the streaming
/// source. You provide the delivery stream's Amazon Resource Name (ARN) and an
/// IAM role ARN that enables Amazon Kinesis Analytics to access the stream on
/// your behalf.
class KinesisFirehoseInput {
  /// ARN of the input delivery stream.
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to make sure that the role has the necessary
  /// permissions to access the stream.
  final String roleARN;

  KinesisFirehoseInput({
    required this.resourceARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      'RoleARN': roleARN,
    };
  }
}

/// Describes the Amazon Kinesis Firehose delivery stream that is configured as
/// the streaming source in the application input configuration.
class KinesisFirehoseInputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
  final String? resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics assumes to access the
  /// stream.
  final String? roleARN;

  KinesisFirehoseInputDescription({
    this.resourceARN,
    this.roleARN,
  });

  factory KinesisFirehoseInputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseInputDescription(
      resourceARN: json['ResourceARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When updating application input configuration, provides information about an
/// Amazon Kinesis Firehose delivery stream as the streaming source.
class KinesisFirehoseInputUpdate {
  /// Amazon Resource Name (ARN) of the input Amazon Kinesis Firehose delivery
  /// stream to read.
  final String? resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String? roleARNUpdate;

  KinesisFirehoseInputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      if (resourceARNUpdate != null) 'ResourceARNUpdate': resourceARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// When configuring application output, identifies an Amazon Kinesis Firehose
/// delivery stream as the destination. You provide the stream Amazon Resource
/// Name (ARN) and an IAM role that enables Amazon Kinesis Analytics to write to
/// the stream on your behalf.
class KinesisFirehoseOutput {
  /// ARN of the destination Amazon Kinesis Firehose delivery stream to write to.
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination stream on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleARN;

  KinesisFirehoseOutput({
    required this.resourceARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      'RoleARN': roleARN,
    };
  }
}

/// For an application output, describes the Amazon Kinesis Firehose delivery
/// stream configured as its destination.
class KinesisFirehoseOutputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream.
  final String? resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  final String? roleARN;

  KinesisFirehoseOutputDescription({
    this.resourceARN,
    this.roleARN,
  });

  factory KinesisFirehoseOutputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseOutputDescription(
      resourceARN: json['ResourceARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When updating an output configuration using the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation, provides information about an Amazon Kinesis Firehose delivery
/// stream configured as the destination.
class KinesisFirehoseOutputUpdate {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis Firehose delivery stream to
  /// write to.
  final String? resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String? roleARNUpdate;

  KinesisFirehoseOutputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      if (resourceARNUpdate != null) 'ResourceARNUpdate': resourceARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// Identifies an Amazon Kinesis stream as the streaming source. You provide the
/// stream's Amazon Resource Name (ARN) and an IAM role ARN that enables Amazon
/// Kinesis Analytics to access the stream on your behalf.
class KinesisStreamsInput {
  /// ARN of the input Amazon Kinesis stream to read.
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String roleARN;

  KinesisStreamsInput({
    required this.resourceARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      'RoleARN': roleARN,
    };
  }
}

/// Describes the Amazon Kinesis stream that is configured as the streaming
/// source in the application input configuration.
class KinesisStreamsInputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  final String? resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  final String? roleARN;

  KinesisStreamsInputDescription({
    this.resourceARN,
    this.roleARN,
  });

  factory KinesisStreamsInputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisStreamsInputDescription(
      resourceARN: json['ResourceARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When updating application input configuration, provides information about an
/// Amazon Kinesis stream as the streaming source.
class KinesisStreamsInputUpdate {
  /// Amazon Resource Name (ARN) of the input Amazon Kinesis stream to read.
  final String? resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String? roleARNUpdate;

  KinesisStreamsInputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      if (resourceARNUpdate != null) 'ResourceARNUpdate': resourceARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// When configuring application output, identifies an Amazon Kinesis stream as
/// the destination. You provide the stream Amazon Resource Name (ARN) and also
/// an IAM role ARN that Amazon Kinesis Analytics can use to write to the stream
/// on your behalf.
class KinesisStreamsOutput {
  /// ARN of the destination Amazon Kinesis stream to write to.
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination stream on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleARN;

  KinesisStreamsOutput({
    required this.resourceARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      'RoleARN': roleARN,
    };
  }
}

/// For an application output, describes the Amazon Kinesis stream configured as
/// its destination.
class KinesisStreamsOutputDescription {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  final String? resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream.
  final String? roleARN;

  KinesisStreamsOutputDescription({
    this.resourceARN,
    this.roleARN,
  });

  factory KinesisStreamsOutputDescription.fromJson(Map<String, dynamic> json) {
    return KinesisStreamsOutputDescription(
      resourceARN: json['ResourceARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When updating an output configuration using the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation, provides information about an Amazon Kinesis stream configured as
/// the destination.
class KinesisStreamsOutputUpdate {
  /// Amazon Resource Name (ARN) of the Amazon Kinesis stream where you want to
  /// write the output.
  final String? resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to access the
  /// stream on your behalf. You need to grant the necessary permissions to this
  /// role.
  final String? roleARNUpdate;

  KinesisStreamsOutputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      if (resourceARNUpdate != null) 'ResourceARNUpdate': resourceARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// When configuring application output, identifies an AWS Lambda function as
/// the destination. You provide the function Amazon Resource Name (ARN) and
/// also an IAM role ARN that Amazon Kinesis Analytics can use to write to the
/// function on your behalf.
class LambdaOutput {
  /// Amazon Resource Name (ARN) of the destination Lambda function to write to.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  final String resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination function on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String roleARN;

  LambdaOutput({
    required this.resourceARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      'ResourceARN': resourceARN,
      'RoleARN': roleARN,
    };
  }
}

/// For an application output, describes the AWS Lambda function configured as
/// its destination.
class LambdaOutputDescription {
  /// Amazon Resource Name (ARN) of the destination Lambda function.
  final String? resourceARN;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination function.
  final String? roleARN;

  LambdaOutputDescription({
    this.resourceARN,
    this.roleARN,
  });

  factory LambdaOutputDescription.fromJson(Map<String, dynamic> json) {
    return LambdaOutputDescription(
      resourceARN: json['ResourceARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final roleARN = this.roleARN;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// When updating an output configuration using the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation, provides information about an AWS Lambda function configured as
/// the destination.
class LambdaOutputUpdate {
  /// Amazon Resource Name (ARN) of the destination Lambda function.
  /// <note>
  /// To specify an earlier version of the Lambda function than the latest,
  /// include the Lambda function version in the Lambda function ARN. For more
  /// information about Lambda ARNs, see <a
  /// href="/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-lambda">Example
  /// ARNs: AWS Lambda</a>
  /// </note>
  final String? resourceARNUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to write to the
  /// destination function on your behalf. You need to grant the necessary
  /// permissions to this role.
  final String? roleARNUpdate;

  LambdaOutputUpdate({
    this.resourceARNUpdate,
    this.roleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final resourceARNUpdate = this.resourceARNUpdate;
    final roleARNUpdate = this.roleARNUpdate;
    return {
      if (resourceARNUpdate != null) 'ResourceARNUpdate': resourceARNUpdate,
      if (roleARNUpdate != null) 'RoleARNUpdate': roleARNUpdate,
    };
  }
}

/// <p/>
class ListApplicationsResponse {
  /// List of <code>ApplicationSummary</code> objects.
  final List<ApplicationSummary> applicationSummaries;

  /// Returns true if there are more applications to retrieve.
  final bool hasMoreApplications;

  ListApplicationsResponse({
    required this.applicationSummaries,
    required this.hasMoreApplications,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applicationSummaries: (json['ApplicationSummaries'] as List)
          .whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMoreApplications: json['HasMoreApplications'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSummaries = this.applicationSummaries;
    final hasMoreApplications = this.hasMoreApplications;
    return {
      'ApplicationSummaries': applicationSummaries,
      'HasMoreApplications': hasMoreApplications,
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

/// When configuring application input at the time of creating or updating an
/// application, provides additional mapping information specific to the record
/// format (such as JSON, CSV, or record fields delimited by some delimiter) on
/// the streaming source.
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

/// Describes application output configuration in which you identify an
/// in-application stream and a destination where you want the in-application
/// stream data to be written. The destination can be an Amazon Kinesis stream
/// or an Amazon Kinesis Firehose delivery stream.
/// <p/>
/// For limits on how many destinations an application can write and other
/// limitations, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/limits.html">Limits</a>.
class Output {
  /// Describes the data format when records are written to the destination. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  final DestinationSchema destinationSchema;

  /// Name of the in-application stream.
  final String name;

  /// Identifies an Amazon Kinesis Firehose delivery stream as the destination.
  final KinesisFirehoseOutput? kinesisFirehoseOutput;

  /// Identifies an Amazon Kinesis stream as the destination.
  final KinesisStreamsOutput? kinesisStreamsOutput;

  /// Identifies an AWS Lambda function as the destination.
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

/// Describes the application output configuration, which includes the
/// in-application stream name and the destination where the stream data is
/// written. The destination can be an Amazon Kinesis stream or an Amazon
/// Kinesis Firehose delivery stream.
class OutputDescription {
  /// Data format used for writing data to the destination.
  final DestinationSchema? destinationSchema;

  /// Describes the Amazon Kinesis Firehose delivery stream configured as the
  /// destination where output is written.
  final KinesisFirehoseOutputDescription? kinesisFirehoseOutputDescription;

  /// Describes Amazon Kinesis stream configured as the destination where output
  /// is written.
  final KinesisStreamsOutputDescription? kinesisStreamsOutputDescription;

  /// Describes the AWS Lambda function configured as the destination where output
  /// is written.
  final LambdaOutputDescription? lambdaOutputDescription;

  /// Name of the in-application stream configured as output.
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

/// Describes updates to the output configuration identified by the
/// <code>OutputId</code>.
class OutputUpdate {
  /// Identifies the specific output configuration that you want to update.
  final String outputId;

  /// Describes the data format when records are written to the destination. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-it-works-output.html">Configuring
  /// Application Output</a>.
  final DestinationSchema? destinationSchemaUpdate;

  /// Describes an Amazon Kinesis Firehose delivery stream as the destination for
  /// the output.
  final KinesisFirehoseOutputUpdate? kinesisFirehoseOutputUpdate;

  /// Describes an Amazon Kinesis stream as the destination for the output.
  final KinesisStreamsOutputUpdate? kinesisStreamsOutputUpdate;

  /// Describes an AWS Lambda function as the destination for the output.
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

/// Describes the mapping of each data element in the streaming source to the
/// corresponding column in the in-application stream.
///
/// Also used to describe the format of the reference data source.
class RecordColumn {
  /// Name of the column created in the in-application input stream or reference
  /// table.
  final String name;

  /// Type of column created in the in-application input stream or reference
  /// table.
  final String sqlType;

  /// Reference to the data element in the streaming input or the reference data
  /// source. This element is required if the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_RecordFormat.html#analytics-Type-RecordFormat-RecordFormatTypel">RecordFormatType</a>
  /// is <code>JSON</code>.
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

/// Describes the record format and relevant mapping information that should be
/// applied to schematize the records on the stream.
class RecordFormat {
  /// The type of record format.
  final RecordFormatType recordFormatType;

  /// When configuring application input at the time of creating or updating an
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

/// Describes the reference data source by providing the source information (S3
/// bucket name and object key name), the resulting in-application table name
/// that is created, and the necessary schema to map the data elements in the
/// Amazon S3 object to the in-application table.
class ReferenceDataSource {
  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  final SourceSchema referenceSchema;

  /// Name of the in-application table to create.
  final String tableName;

  /// Identifies the S3 bucket and object that contains the reference data. Also
  /// identifies the IAM role Amazon Kinesis Analytics can assume to read this
  /// object on your behalf. An Amazon Kinesis Analytics application loads
  /// reference data only once. If the data changes, you call the
  /// <code>UpdateApplication</code> operation to trigger reloading of data into
  /// your application.
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

/// Describes the reference data source configured for an application.
class ReferenceDataSourceDescription {
  /// ID of the reference data source. This is the ID that Amazon Kinesis
  /// Analytics assigns when you add the reference data source to your application
  /// using the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_AddApplicationReferenceDataSource.html">AddApplicationReferenceDataSource</a>
  /// operation.
  final String referenceId;

  /// Provides the S3 bucket name, the object key name that contains the reference
  /// data. It also provides the Amazon Resource Name (ARN) of the IAM role that
  /// Amazon Kinesis Analytics can assume to read the Amazon S3 object and
  /// populate the in-application reference table.
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

/// When you update a reference data source configuration for an application,
/// this object provides all the updated values (such as the source bucket name
/// and object key name), the in-application table name that is created, and
/// updated mapping information that maps the data in the Amazon S3 object to
/// the in-application reference table that is created.
class ReferenceDataSourceUpdate {
  /// ID of the reference data source being updated. You can use the <a
  /// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_DescribeApplication.html">DescribeApplication</a>
  /// operation to get this value.
  final String referenceId;

  /// Describes the format of the data in the streaming source, and how each data
  /// element maps to corresponding columns created in the in-application stream.
  final SourceSchema? referenceSchemaUpdate;

  /// Describes the S3 bucket name, object key name, and IAM role that Amazon
  /// Kinesis Analytics can assume to read the Amazon S3 object on your behalf and
  /// populate the in-application reference table.
  final S3ReferenceDataSourceUpdate? s3ReferenceDataSourceUpdate;

  /// In-application table name that is created by this update.
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

/// Provides a description of an Amazon S3 data source, including the Amazon
/// Resource Name (ARN) of the S3 bucket, the ARN of the IAM role that is used
/// to access the bucket, and the name of the Amazon S3 object that contains the
/// data.
class S3Configuration {
  /// ARN of the S3 bucket that contains the data.
  final String bucketARN;

  /// The name of the object that contains the data.
  final String fileKey;

  /// IAM ARN of the role used to access the data.
  final String roleARN;

  S3Configuration({
    required this.bucketARN,
    required this.fileKey,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    final roleARN = this.roleARN;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
      'RoleARN': roleARN,
    };
  }
}

/// Identifies the S3 bucket and object that contains the reference data. Also
/// identifies the IAM role Amazon Kinesis Analytics can assume to read this
/// object on your behalf.
///
/// An Amazon Kinesis Analytics application loads reference data only once. If
/// the data changes, you call the <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/API_UpdateApplication.html">UpdateApplication</a>
/// operation to trigger reloading of data into your application.
class S3ReferenceDataSource {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketARN;

  /// Object key name containing reference data.
  final String fileKey;

  /// ARN of the IAM role that the service can assume to read data on your behalf.
  /// This role must have permission for the <code>s3:GetObject</code> action on
  /// the object and trust policy that allows Amazon Kinesis Analytics service
  /// principal to assume this role.
  final String referenceRoleARN;

  S3ReferenceDataSource({
    required this.bucketARN,
    required this.fileKey,
    required this.referenceRoleARN,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    final referenceRoleARN = this.referenceRoleARN;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
      'ReferenceRoleARN': referenceRoleARN,
    };
  }
}

/// Provides the bucket name and object key name that stores the reference data.
class S3ReferenceDataSourceDescription {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  final String bucketARN;

  /// Amazon S3 object key name.
  final String fileKey;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to read the
  /// Amazon S3 object on your behalf to populate the in-application reference
  /// table.
  final String referenceRoleARN;

  S3ReferenceDataSourceDescription({
    required this.bucketARN,
    required this.fileKey,
    required this.referenceRoleARN,
  });

  factory S3ReferenceDataSourceDescription.fromJson(Map<String, dynamic> json) {
    return S3ReferenceDataSourceDescription(
      bucketARN: json['BucketARN'] as String,
      fileKey: json['FileKey'] as String,
      referenceRoleARN: json['ReferenceRoleARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final fileKey = this.fileKey;
    final referenceRoleARN = this.referenceRoleARN;
    return {
      'BucketARN': bucketARN,
      'FileKey': fileKey,
      'ReferenceRoleARN': referenceRoleARN,
    };
  }
}

/// Describes the S3 bucket name, object key name, and IAM role that Amazon
/// Kinesis Analytics can assume to read the Amazon S3 object on your behalf and
/// populate the in-application reference table.
class S3ReferenceDataSourceUpdate {
  /// Amazon Resource Name (ARN) of the S3 bucket.
  final String? bucketARNUpdate;

  /// Object key name.
  final String? fileKeyUpdate;

  /// ARN of the IAM role that Amazon Kinesis Analytics can assume to read the
  /// Amazon S3 object and populate the in-application.
  final String? referenceRoleARNUpdate;

  S3ReferenceDataSourceUpdate({
    this.bucketARNUpdate,
    this.fileKeyUpdate,
    this.referenceRoleARNUpdate,
  });

  Map<String, dynamic> toJson() {
    final bucketARNUpdate = this.bucketARNUpdate;
    final fileKeyUpdate = this.fileKeyUpdate;
    final referenceRoleARNUpdate = this.referenceRoleARNUpdate;
    return {
      if (bucketARNUpdate != null) 'BucketARNUpdate': bucketARNUpdate,
      if (fileKeyUpdate != null) 'FileKeyUpdate': fileKeyUpdate,
      if (referenceRoleARNUpdate != null)
        'ReferenceRoleARNUpdate': referenceRoleARNUpdate,
    };
  }
}

/// Describes the format of the data in the streaming source, and how each data
/// element maps to corresponding columns created in the in-application stream.
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

/// <p/>
class StartApplicationResponse {
  StartApplicationResponse();

  factory StartApplicationResponse.fromJson(Map<String, dynamic> _) {
    return StartApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// <p/>
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
/// AWS resources. If you specify a tag that already exists, the tag value is
/// replaced with the value that you specify in the request. Note that the
/// maximum number of application tags includes system tags. The maximum number
/// of user-defined application tags is 50. For more information, see <a
/// href="https://docs.aws.amazon.com/kinesisanalytics/latest/dev/how-tagging.html">Using
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

class UpdateApplicationResponse {
  UpdateApplicationResponse();

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
