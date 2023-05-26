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

/// This is the AWS Lambda API Reference. The AWS Lambda Developer Guide
/// provides additional information. For the service overview, go to <a
/// href="http://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is AWS
/// Lambda</a>, and for information about how the service works, go to <a
/// href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS
/// LambdaL How it Works</a> in the AWS Lambda Developer Guide.
class Lambda {
  final _s.RestJsonProtocol _protocol;
  Lambda({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lambda',
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

  /// Identifies a stream as an event source for an AWS Lambda function. It can
  /// be either an Amazon Kinesis stream or a Amazon DynamoDB stream. AWS Lambda
  /// invokes the specified function when records are posted to the stream.
  ///
  /// This is the pull model, where AWS Lambda invokes the function. For more
  /// information, go to <a
  /// href="http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS
  /// Lambda: How it Works</a> in the AWS Lambda Developer Guide.
  ///
  /// This association between an Amazon Kinesis stream and an AWS Lambda
  /// function is called the event source mapping. You provide the configuration
  /// information (for example, which stream to read from and which AWS Lambda
  /// function to invoke) for the event source mapping in the request body.
  ///
  /// Each event source, such as a Kinesis stream, can only be associated with
  /// one AWS Lambda function. If you call <a>AddEventSource</a> for an event
  /// source that is already mapped to another AWS Lambda function, the existing
  /// mapping is updated to call the new function instead of the old one.
  ///
  /// This operation requires permission for the <code>iam:PassRole</code>
  /// action for the IAM role. It also requires permission for the
  /// <code>lambda:AddEventSource</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [eventSource] :
  /// The Amazon Resource Name (ARN) of the Amazon Kinesis stream that is the
  /// event source. Any record added to this stream causes AWS Lambda to invoke
  /// your Lambda function. AWS Lambda POSTs the Amazon Kinesis event,
  /// containing records, to your Lambda function as JSON.
  ///
  /// Parameter [functionName] :
  /// The Lambda function to invoke when AWS Lambda detects an event on the
  /// stream.
  ///
  /// Parameter [role] :
  /// The ARN of the IAM role (invocation role) that AWS Lambda can assume to
  /// read from the stream and invoke the function.
  ///
  /// Parameter [batchSize] :
  /// The largest number of records that AWS Lambda will give to your function
  /// in a single event. The default is 100 records.
  ///
  /// Parameter [parameters] :
  /// A map (key-value pairs) defining the configuration for AWS Lambda to use
  /// when reading the event source. Currently, AWS Lambda supports only the
  /// <code>InitialPositionInStream</code> key. The valid values are:
  /// "TRIM_HORIZON" and "LATEST". The default value is "TRIM_HORIZON". For more
  /// information, go to <a
  /// href="http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType">ShardIteratorType</a>
  /// in the Amazon Kinesis Service API Reference.
  Future<EventSourceConfiguration> addEventSource({
    required String eventSource,
    required String functionName,
    required String role,
    int? batchSize,
    Map<String, String>? parameters,
  }) async {
    final $payload = <String, dynamic>{
      'EventSource': eventSource,
      'FunctionName': functionName,
      'Role': role,
      if (batchSize != null) 'BatchSize': batchSize,
      if (parameters != null) 'Parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2014-11-13/event-source-mappings/',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceConfiguration.fromJson(response);
  }

  /// Deletes the specified Lambda function code and configuration.
  ///
  /// This operation requires permission for the
  /// <code>lambda:DeleteFunction</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The Lambda function to delete.
  Future<void> deleteFunction({
    required String functionName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2014-11-13/functions/${Uri.encodeComponent(functionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns configuration information for the specified event source mapping
  /// (see <a>AddEventSource</a>).
  ///
  /// This operation requires permission for the
  /// <code>lambda:GetEventSource</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [uuid] :
  /// The AWS Lambda assigned ID of the event source mapping.
  Future<EventSourceConfiguration> getEventSource({
    required String uuid,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2014-11-13/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceConfiguration.fromJson(response);
  }

  /// Returns the configuration information of the Lambda function and a
  /// presigned URL link to the .zip file you uploaded with
  /// <a>UploadFunction</a> so you can download the .zip file. Note that the URL
  /// is valid for up to 10 minutes. The configuration information is the same
  /// information you provided as parameters when uploading the function.
  ///
  /// This operation requires permission for the <code>lambda:GetFunction</code>
  /// action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The Lambda function name.
  Future<GetFunctionResponse> getFunction({
    required String functionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2014-11-13/functions/${Uri.encodeComponent(functionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionResponse.fromJson(response);
  }

  /// Returns the configuration information of the Lambda function. This the
  /// same information you provided as parameters when uploading the function by
  /// using <a>UploadFunction</a>.
  ///
  /// This operation requires permission for the
  /// <code>lambda:GetFunctionConfiguration</code> operation.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function for which you want to retrieve the
  /// configuration information.
  Future<FunctionConfiguration> getFunctionConfiguration({
    required String functionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2014-11-13/functions/${Uri.encodeComponent(functionName)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Submits an invocation request to AWS Lambda. Upon receiving the request,
  /// Lambda executes the specified function asynchronously. To see the logs
  /// generated by the Lambda function execution, see the CloudWatch logs
  /// console.
  ///
  /// This operation requires permission for the <code>lambda:InvokeAsync</code>
  /// action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestContentException].
  ///
  /// Parameter [functionName] :
  /// The Lambda function name.
  ///
  /// Parameter [invokeArgs] :
  /// JSON that you want to provide to your Lambda function as input.
  Future<InvokeAsyncResponse> invokeAsync({
    required String functionName,
    required Uint8List invokeArgs,
  }) async {
    final response = await _protocol.send(
      payload: invokeArgs,
      method: 'POST',
      requestUri:
          '/2014-11-13/functions/${Uri.encodeComponent(functionName)}/invoke-async/',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeAsyncResponse.fromJson(response);
  }

  /// Returns a list of event source mappings you created using the
  /// <code>AddEventSource</code> (see <a>AddEventSource</a>), where you
  /// identify a stream as event source. This list does not include Amazon S3
  /// event sources.
  ///
  /// For each mapping, the API returns configuration information. You can
  /// optionally specify filters to retrieve specific event source mappings.
  ///
  /// This operation requires permission for the
  /// <code>lambda:ListEventSources</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [eventSourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Kinesis stream.
  ///
  /// Parameter [functionName] :
  /// The name of the AWS Lambda function.
  ///
  /// Parameter [marker] :
  /// Optional string. An opaque pagination token returned from a previous
  /// <code>ListEventSources</code> operation. If present, specifies to continue
  /// the list from where the returning call left off.
  ///
  /// Parameter [maxItems] :
  /// Optional integer. Specifies the maximum number of event sources to return
  /// in response. This value must be greater than 0.
  Future<ListEventSourcesResponse> listEventSources({
    String? eventSourceArn,
    String? functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (eventSourceArn != null) 'EventSource': [eventSourceArn],
      if (functionName != null) 'FunctionName': [functionName],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2014-11-13/event-source-mappings/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventSourcesResponse.fromJson(response);
  }

  /// Returns a list of your Lambda functions. For each function, the response
  /// includes the function configuration information. You must use
  /// <a>GetFunction</a> to retrieve the code for your function.
  ///
  /// This operation requires permission for the
  /// <code>lambda:ListFunctions</code> action.
  ///
  /// May throw [ServiceException].
  ///
  /// Parameter [marker] :
  /// Optional string. An opaque pagination token returned from a previous
  /// <code>ListFunctions</code> operation. If present, indicates where to
  /// continue the listing.
  ///
  /// Parameter [maxItems] :
  /// Optional integer. Specifies the maximum number of AWS Lambda functions to
  /// return in response. This parameter value must be greater than 0.
  Future<ListFunctionsResponse> listFunctions({
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2014-11-13/functions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsResponse.fromJson(response);
  }

  /// Removes an event source mapping. This means AWS Lambda will no longer
  /// invoke the function for events in the associated source.
  ///
  /// This operation requires permission for the
  /// <code>lambda:RemoveEventSource</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [uuid] :
  /// The event source mapping ID.
  Future<void> removeEventSource({
    required String uuid,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2014-11-13/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration parameters for the specified Lambda function by
  /// using the values provided in the request. You provide only the parameters
  /// you want to change. This operation must only be used on an existing Lambda
  /// function and cannot be used to update the function's code.
  ///
  /// This operation requires permission for the
  /// <code>lambda:UpdateFunctionConfiguration</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  ///
  /// Parameter [description] :
  /// A short user-defined function description. Lambda does not use this value.
  /// Assign a meaningful description as you see fit.
  ///
  /// Parameter [handler] :
  /// The function that Lambda calls to begin executing your function. For
  /// Node.js, it is the <i>module-name.export</i> value in your function.
  ///
  /// Parameter [memorySize] :
  /// The amount of memory, in MB, your Lambda function is given. Lambda uses
  /// this memory size to infer the amount of CPU allocated to your function.
  /// Your function use-case determines your CPU and memory requirements. For
  /// example, a database operation might need less memory compared to an image
  /// processing function. The default value is 128 MB. The value must be a
  /// multiple of 64 MB.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the IAM role that Lambda will assume
  /// when it executes your function.
  ///
  /// Parameter [timeout] :
  /// The function execution time at which Lambda should terminate the function.
  /// Because the execution time has cost implications, we recommend you set
  /// this value based on your expected execution time. The default is 3
  /// seconds.
  Future<FunctionConfiguration> updateFunctionConfiguration({
    required String functionName,
    String? description,
    String? handler,
    int? memorySize,
    String? role,
    int? timeout,
  }) async {
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      1024,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      60,
    );
    final $query = <String, List<String>>{
      if (description != null) 'Description': [description],
      if (handler != null) 'Handler': [handler],
      if (memorySize != null) 'MemorySize': [memorySize.toString()],
      if (role != null) 'Role': [role],
      if (timeout != null) 'Timeout': [timeout.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2014-11-13/functions/${Uri.encodeComponent(functionName)}/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Creates a new Lambda function or updates an existing function. The
  /// function metadata is created from the request parameters, and the code for
  /// the function is provided by a .zip file in the request body. If the
  /// function name already exists, the existing Lambda function is updated with
  /// the new code and metadata.
  ///
  /// This operation requires permission for the
  /// <code>lambda:UploadFunction</code> action.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The name you want to assign to the function you are uploading. The
  /// function names appear in the console and are returned in the
  /// <a>ListFunctions</a> API. Function names are used to specify functions to
  /// other AWS Lambda APIs, such as <a>InvokeAsync</a>.
  ///
  /// Parameter [functionZip] :
  /// A .zip file containing your packaged source code. For more information
  /// about creating a .zip file, go to <a
  /// href="http://docs.aws.amazon.com/lambda/latest/dg/walkthrough-custom-events.html">AWS
  /// LambdaL How it Works</a> in the AWS Lambda Developer Guide.
  ///
  /// Parameter [handler] :
  /// The function that Lambda calls to begin execution. For Node.js, it is the
  /// <i>module-name</i>.<i>export</i> value in your function.
  ///
  /// Parameter [mode] :
  /// How the Lambda function will be invoked. Lambda supports only the "event"
  /// mode.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it
  /// executes your function to access any other Amazon Web Services (AWS)
  /// resources.
  ///
  /// Parameter [runtime] :
  /// The runtime environment for the Lambda function you are uploading.
  /// Currently, Lambda supports only "nodejs" as the runtime.
  ///
  /// Parameter [description] :
  /// A short, user-defined function description. Lambda does not use this
  /// value. Assign a meaningful description as you see fit.
  ///
  /// Parameter [memorySize] :
  /// The amount of memory, in MB, your Lambda function is given. Lambda uses
  /// this memory size to infer the amount of CPU allocated to your function.
  /// Your function use-case determines your CPU and memory requirements. For
  /// example, database operation might need less memory compared to image
  /// processing function. The default value is 128 MB. The value must be a
  /// multiple of 64 MB.
  ///
  /// Parameter [timeout] :
  /// The function execution time at which Lambda should terminate the function.
  /// Because the execution time has cost implications, we recommend you set
  /// this value based on your expected execution time. The default is 3
  /// seconds.
  Future<FunctionConfiguration> uploadFunction({
    required String functionName,
    required Uint8List functionZip,
    required String handler,
    required Mode mode,
    required String role,
    required Runtime runtime,
    String? description,
    int? memorySize,
    int? timeout,
  }) async {
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      1024,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      60,
    );
    final $query = <String, List<String>>{
      'Handler': [handler],
      'Mode': [mode.toValue()],
      'Role': [role],
      'Runtime': [runtime.toValue()],
      if (description != null) 'Description': [description],
      if (memorySize != null) 'MemorySize': [memorySize.toString()],
      if (timeout != null) 'Timeout': [timeout.toString()],
    };
    final response = await _protocol.send(
      payload: functionZip,
      method: 'PUT',
      requestUri: '/2014-11-13/functions/${Uri.encodeComponent(functionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }
}

/// Describes mapping between an Amazon Kinesis stream and a Lambda function.
class EventSourceConfiguration {
  /// The largest number of records that AWS Lambda will POST in the invocation
  /// request to your function.
  final int? batchSize;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis stream that is the
  /// source of events.
  final String? eventSource;

  /// The Lambda function to invoke when AWS Lambda detects an event on the
  /// stream.
  final String? functionName;

  /// Indicates whether the event source mapping is currently honored. Events are
  /// only processes if IsActive is true.
  final bool? isActive;

  /// The UTC time string indicating the last time the event mapping was updated.
  final DateTime? lastModified;

  /// The map (key-value pairs) defining the configuration for AWS Lambda to use
  /// when reading the event source.
  final Map<String, String>? parameters;

  /// The ARN of the IAM role (invocation role) that AWS Lambda can assume to read
  /// from the stream and invoke the function.
  final String? role;

  /// The description of the health of the event source mapping. Valid values are:
  /// "PENDING", "OK", and "PROBLEM:<i>message</i>". Initially this staus is
  /// "PENDING". When AWS Lambda begins processing events, it changes the status
  /// to "OK".
  final String? status;

  /// The AWS Lambda assigned opaque identifier for the mapping.
  final String? uuid;

  EventSourceConfiguration({
    this.batchSize,
    this.eventSource,
    this.functionName,
    this.isActive,
    this.lastModified,
    this.parameters,
    this.role,
    this.status,
    this.uuid,
  });

  factory EventSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return EventSourceConfiguration(
      batchSize: json['BatchSize'] as int?,
      eventSource: json['EventSource'] as String?,
      functionName: json['FunctionName'] as String?,
      isActive: json['IsActive'] as bool?,
      lastModified: timeStampFromJson(json['LastModified']),
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      role: json['Role'] as String?,
      status: json['Status'] as String?,
      uuid: json['UUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final eventSource = this.eventSource;
    final functionName = this.functionName;
    final isActive = this.isActive;
    final lastModified = this.lastModified;
    final parameters = this.parameters;
    final role = this.role;
    final status = this.status;
    final uuid = this.uuid;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (eventSource != null) 'EventSource': eventSource,
      if (functionName != null) 'FunctionName': functionName,
      if (isActive != null) 'IsActive': isActive,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (parameters != null) 'Parameters': parameters,
      if (role != null) 'Role': role,
      if (status != null) 'Status': status,
      if (uuid != null) 'UUID': uuid,
    };
  }
}

/// The object for the Lambda function location.
class FunctionCodeLocation {
  /// The presigned URL you can use to download the function's .zip file that you
  /// previously uploaded. The URL is valid for up to 10 minutes.
  final String? location;

  /// The repository from which you can download the function.
  final String? repositoryType;

  FunctionCodeLocation({
    this.location,
    this.repositoryType,
  });

  factory FunctionCodeLocation.fromJson(Map<String, dynamic> json) {
    return FunctionCodeLocation(
      location: json['Location'] as String?,
      repositoryType: json['RepositoryType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final location = this.location;
    final repositoryType = this.repositoryType;
    return {
      if (location != null) 'Location': location,
      if (repositoryType != null) 'RepositoryType': repositoryType,
    };
  }
}

/// A complex type that describes function metadata.
class FunctionConfiguration {
  /// The size, in bytes, of the function .zip file you uploaded.
  final int? codeSize;

  /// A Lambda-assigned unique identifier for the current function code and
  /// related configuration.
  final String? configurationId;

  /// The user-provided description.
  final String? description;

  /// The Amazon Resource Name (ARN) assigned to the function.
  final String? functionARN;

  /// The name of the function.
  final String? functionName;

  /// The function Lambda calls to begin executing your function.
  final String? handler;

  /// The timestamp of the last time you updated the function.
  final DateTime? lastModified;

  /// The memory size, in MB, you configured for the function. Must be a multiple
  /// of 64 MB.
  final int? memorySize;

  /// The type of the Lambda function you uploaded.
  final Mode? mode;

  /// The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it
  /// executes your function to access any other Amazon Web Services (AWS)
  /// resources.
  final String? role;

  /// The runtime environment for the Lambda function.
  final Runtime? runtime;

  /// The function execution time at which Lambda should terminate the function.
  /// Because the execution time has cost implications, we recommend you set this
  /// value based on your expected execution time. The default is 3 seconds.
  final int? timeout;

  FunctionConfiguration({
    this.codeSize,
    this.configurationId,
    this.description,
    this.functionARN,
    this.functionName,
    this.handler,
    this.lastModified,
    this.memorySize,
    this.mode,
    this.role,
    this.runtime,
    this.timeout,
  });

  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return FunctionConfiguration(
      codeSize: json['CodeSize'] as int?,
      configurationId: json['ConfigurationId'] as String?,
      description: json['Description'] as String?,
      functionARN: json['FunctionARN'] as String?,
      functionName: json['FunctionName'] as String?,
      handler: json['Handler'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      memorySize: json['MemorySize'] as int?,
      mode: (json['Mode'] as String?)?.toMode(),
      role: json['Role'] as String?,
      runtime: (json['Runtime'] as String?)?.toRuntime(),
      timeout: json['Timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSize = this.codeSize;
    final configurationId = this.configurationId;
    final description = this.description;
    final functionARN = this.functionARN;
    final functionName = this.functionName;
    final handler = this.handler;
    final lastModified = this.lastModified;
    final memorySize = this.memorySize;
    final mode = this.mode;
    final role = this.role;
    final runtime = this.runtime;
    final timeout = this.timeout;
    return {
      if (codeSize != null) 'CodeSize': codeSize,
      if (configurationId != null) 'ConfigurationId': configurationId,
      if (description != null) 'Description': description,
      if (functionARN != null) 'FunctionARN': functionARN,
      if (functionName != null) 'FunctionName': functionName,
      if (handler != null) 'Handler': handler,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (memorySize != null) 'MemorySize': memorySize,
      if (mode != null) 'Mode': mode.toValue(),
      if (role != null) 'Role': role,
      if (runtime != null) 'Runtime': runtime.toValue(),
      if (timeout != null) 'Timeout': timeout,
    };
  }
}

/// This response contains the object for AWS Lambda function location (see
/// <a>API_FunctionCodeLocation</a>
class GetFunctionResponse {
  final FunctionCodeLocation? code;
  final FunctionConfiguration? configuration;

  GetFunctionResponse({
    this.code,
    this.configuration,
  });

  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionResponse(
      code: json['Code'] != null
          ? FunctionCodeLocation.fromJson(json['Code'] as Map<String, dynamic>)
          : null,
      configuration: json['Configuration'] != null
          ? FunctionConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final configuration = this.configuration;
    return {
      if (code != null) 'Code': code,
      if (configuration != null) 'Configuration': configuration,
    };
  }
}

/// One of the parameters in the request is invalid. For example, if you
/// provided an IAM role for AWS Lambda to assume in the
/// <code>UploadFunction</code> or the <code>UpdateFunctionConfiguration</code>
/// API, that AWS Lambda is unable to assume you will get this exception.
class InvalidParameterValueException implements _s.AwsException {
  final String? type;
  final String? message;

  InvalidParameterValueException({
    this.type,
    this.message,
  });

  factory InvalidParameterValueException.fromJson(Map<String, dynamic> json) {
    return InvalidParameterValueException(
      type: json['Type'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final message = this.message;
    return {
      if (type != null) 'Type': type,
      if (message != null) 'message': message,
    };
  }
}

/// The request body could not be parsed as JSON.
class InvalidRequestContentException implements _s.AwsException {
  final String? type;
  final String? message;

  InvalidRequestContentException({
    this.type,
    this.message,
  });

  factory InvalidRequestContentException.fromJson(Map<String, dynamic> json) {
    return InvalidRequestContentException(
      type: json['Type'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final message = this.message;
    return {
      if (type != null) 'Type': type,
      if (message != null) 'message': message,
    };
  }
}

/// Upon success, it returns empty response. Otherwise, throws an exception.
class InvokeAsyncResponse {
  /// It will be 202 upon success.
  final int? status;

  InvokeAsyncResponse({
    this.status,
  });

  factory InvokeAsyncResponse.fromJson(Map<String, dynamic> json) {
    return InvokeAsyncResponse(
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {};
  }
}

/// Contains a list of event sources (see <a>API_EventSourceConfiguration</a>)
class ListEventSourcesResponse {
  /// An arrary of <code>EventSourceConfiguration</code> objects.
  final List<EventSourceConfiguration>? eventSources;

  /// A string, present if there are more event source mappings.
  final String? nextMarker;

  ListEventSourcesResponse({
    this.eventSources,
    this.nextMarker,
  });

  factory ListEventSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListEventSourcesResponse(
      eventSources: (json['EventSources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              EventSourceConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSources = this.eventSources;
    final nextMarker = this.nextMarker;
    return {
      if (eventSources != null) 'EventSources': eventSources,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// Contains a list of AWS Lambda function configurations (see
/// <a>API_FunctionConfiguration</a>.
class ListFunctionsResponse {
  /// A list of Lambda functions.
  final List<FunctionConfiguration>? functions;

  /// A string, present if there are more functions.
  final String? nextMarker;

  ListFunctionsResponse({
    this.functions,
    this.nextMarker,
  });

  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionsResponse(
      functions: (json['Functions'] as List?)
          ?.whereNotNull()
          .map((e) => FunctionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    final nextMarker = this.nextMarker;
    return {
      if (functions != null) 'Functions': functions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

enum Mode {
  event,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.event:
        return 'event';
    }
  }
}

extension ModeFromString on String {
  Mode toMode() {
    switch (this) {
      case 'event':
        return Mode.event;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

/// The function or the event source specified in the request does not exist.
class ResourceNotFoundException implements _s.AwsException {
  final String? message;
  final String? type;

  ResourceNotFoundException({
    this.message,
    this.type,
  });

  factory ResourceNotFoundException.fromJson(Map<String, dynamic> json) {
    return ResourceNotFoundException(
      message: json['Message'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type,
    };
  }
}

enum Runtime {
  nodejs,
}

extension RuntimeValueExtension on Runtime {
  String toValue() {
    switch (this) {
      case Runtime.nodejs:
        return 'nodejs';
    }
  }
}

extension RuntimeFromString on String {
  Runtime toRuntime() {
    switch (this) {
      case 'nodejs':
        return Runtime.nodejs;
    }
    throw Exception('$this is not known in enum Runtime');
  }
}

/// The AWS Lambda service encountered an internal error.
class ServiceException implements _s.AwsException {
  final String? message;
  final String? type;

  ServiceException({
    this.message,
    this.type,
  });

  factory ServiceException.fromJson(Map<String, dynamic> json) {
    return ServiceException(
      message: json['Message'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(message: message),
  'InvalidRequestContentException': (type, message) =>
      InvalidRequestContentException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'ServiceException': (type, message) => ServiceException(message: message),
};
