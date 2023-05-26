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

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. You can
/// use AWS IoT Events API operations to create, read, update, and delete inputs
/// and detector models, and to list their versions.
class IoTEvents {
  final _s.RestJsonProtocol _protocol;
  IoTEvents({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotevents',
            signingName: 'iotevents',
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

  /// Creates an alarm model to monitor an AWS IoT Events input attribute. You
  /// can use the alarm to get notified when the value is outside a specified
  /// range. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/create-alarms.html">Create
  /// an alarm model</a> in the <i>AWS IoT Events Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// A unique name that helps you identify the alarm model. You can't change
  /// this name after you create the alarm model.
  ///
  /// Parameter [alarmRule] :
  /// Defines when your alarm is invoked.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that allows the alarm to perform actions and
  /// access AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [alarmCapabilities] :
  /// Contains the configuration information of alarm state changes.
  ///
  /// Parameter [alarmEventActions] :
  /// Contains information about one or more alarm actions.
  ///
  /// Parameter [alarmModelDescription] :
  /// A description that tells you what the alarm model detects.
  ///
  /// Parameter [alarmNotification] :
  /// Contains information about one or more notification actions.
  ///
  /// Parameter [key] :
  /// An input attribute used as a key to create an alarm. AWS IoT Events routes
  /// <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Input.html">inputs</a>
  /// associated with this key to the alarm.
  ///
  /// Parameter [severity] :
  /// A non-negative integer that reflects the severity level of the alarm.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the alarm model. The
  /// tags help you manage the alarm model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/tagging-iotevents.html">Tagging
  /// your AWS IoT Events resources</a> in the <i>AWS IoT Events Developer
  /// Guide</i>.
  ///
  /// You can create up to 50 tags for one alarm model.
  Future<CreateAlarmModelResponse> createAlarmModel({
    required String alarmModelName,
    required AlarmRule alarmRule,
    required String roleArn,
    AlarmCapabilities? alarmCapabilities,
    AlarmEventActions? alarmEventActions,
    String? alarmModelDescription,
    AlarmNotification? alarmNotification,
    String? key,
    int? severity,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'severity',
      severity,
      0,
      2147483647,
    );
    final $payload = <String, dynamic>{
      'alarmModelName': alarmModelName,
      'alarmRule': alarmRule,
      'roleArn': roleArn,
      if (alarmCapabilities != null) 'alarmCapabilities': alarmCapabilities,
      if (alarmEventActions != null) 'alarmEventActions': alarmEventActions,
      if (alarmModelDescription != null)
        'alarmModelDescription': alarmModelDescription,
      if (alarmNotification != null) 'alarmNotification': alarmNotification,
      if (key != null) 'key': key,
      if (severity != null) 'severity': severity,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarm-models',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAlarmModelResponse.fromJson(response);
  }

  /// Creates a detector model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelDefinition] :
  /// Information that defines how the detectors operate.
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that grants permission to AWS IoT Events to perform
  /// its operations.
  ///
  /// Parameter [detectorModelDescription] :
  /// A brief description of the detector model.
  ///
  /// Parameter [evaluationMethod] :
  /// Information about the order in which events are evaluated and how actions
  /// are executed.
  ///
  /// Parameter [key] :
  /// The input attribute key used to identify a device or system to create a
  /// detector (an instance of the detector model) and then to route each input
  /// received to the appropriate detector (instance). This parameter uses a
  /// JSON-path expression in the message payload of each input to specify the
  /// attribute-value pair that is used to identify the device associated with
  /// the input.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the detector model.
  Future<CreateDetectorModelResponse> createDetectorModel({
    required DetectorModelDefinition detectorModelDefinition,
    required String detectorModelName,
    required String roleArn,
    String? detectorModelDescription,
    EvaluationMethod? evaluationMethod,
    String? key,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'detectorModelDefinition': detectorModelDefinition,
      'detectorModelName': detectorModelName,
      'roleArn': roleArn,
      if (detectorModelDescription != null)
        'detectorModelDescription': detectorModelDescription,
      if (evaluationMethod != null)
        'evaluationMethod': evaluationMethod.toValue(),
      if (key != null) 'key': key,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector-models',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDetectorModelResponse.fromJson(response);
  }

  /// Creates an input.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [inputDefinition] :
  /// The definition of the input.
  ///
  /// Parameter [inputName] :
  /// The name you want to give to the input.
  ///
  /// Parameter [inputDescription] :
  /// A brief description of the input.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the input.
  Future<CreateInputResponse> createInput({
    required InputDefinition inputDefinition,
    required String inputName,
    String? inputDescription,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inputDefinition': inputDefinition,
      'inputName': inputName,
      if (inputDescription != null) 'inputDescription': inputDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/inputs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInputResponse.fromJson(response);
  }

  /// Deletes an alarm model. Any alarm instances that were created based on
  /// this alarm model are also deleted. This action can't be undone.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// The name of the alarm model.
  Future<void> deleteAlarmModel({
    required String alarmModelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/alarm-models/${Uri.encodeComponent(alarmModelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a detector model. Any active instances of the detector model are
  /// also deleted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model to be deleted.
  Future<void> deleteDetectorModel({
    required String detectorModelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/detector-models/${Uri.encodeComponent(detectorModelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an input.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [inputName] :
  /// The name of the input to delete.
  Future<void> deleteInput({
    required String inputName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/inputs/${Uri.encodeComponent(inputName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about an alarm model. If you don't specify a value
  /// for the <code>alarmModelVersion</code> parameter, the latest version is
  /// returned.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// The name of the alarm model.
  ///
  /// Parameter [alarmModelVersion] :
  /// The version of the alarm model.
  Future<DescribeAlarmModelResponse> describeAlarmModel({
    required String alarmModelName,
    String? alarmModelVersion,
  }) async {
    final $query = <String, List<String>>{
      if (alarmModelVersion != null) 'version': [alarmModelVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/alarm-models/${Uri.encodeComponent(alarmModelName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAlarmModelResponse.fromJson(response);
  }

  /// Describes a detector model. If the <code>version</code> parameter is not
  /// specified, information about the latest version is returned.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model.
  ///
  /// Parameter [detectorModelVersion] :
  /// The version of the detector model.
  Future<DescribeDetectorModelResponse> describeDetectorModel({
    required String detectorModelName,
    String? detectorModelVersion,
  }) async {
    final $query = <String, List<String>>{
      if (detectorModelVersion != null) 'version': [detectorModelVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector-models/${Uri.encodeComponent(detectorModelName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDetectorModelResponse.fromJson(response);
  }

  /// Retrieves runtime information about a detector model analysis.
  /// <note>
  /// After AWS IoT Events starts analyzing your detector model, you have up to
  /// 24 hours to retrieve the analysis results.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis result that you want to retrieve.
  Future<DescribeDetectorModelAnalysisResponse> describeDetectorModelAnalysis({
    required String analysisId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/analysis/detector-models/${Uri.encodeComponent(analysisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDetectorModelAnalysisResponse.fromJson(response);
  }

  /// Describes an input.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [inputName] :
  /// The name of the input.
  Future<DescribeInputResponse> describeInput({
    required String inputName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/inputs/${Uri.encodeComponent(inputName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInputResponse.fromJson(response);
  }

  /// Retrieves the current settings of the AWS IoT Events logging options.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnsupportedOperationException].
  Future<DescribeLoggingOptionsResponse> describeLoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLoggingOptionsResponse.fromJson(response);
  }

  /// Retrieves one or more analysis results of the detector model.
  /// <note>
  /// After AWS IoT Events starts analyzing your detector model, you have up to
  /// 24 hours to retrieve the analysis results.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis result that you want to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<GetDetectorModelAnalysisResultsResponse>
      getDetectorModelAnalysisResults({
    required String analysisId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/analysis/detector-models/${Uri.encodeComponent(analysisId)}/results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDetectorModelAnalysisResultsResponse.fromJson(response);
  }

  /// Lists all the versions of an alarm model. The operation returns only the
  /// metadata associated with each alarm model version.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// The name of the alarm model.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListAlarmModelVersionsResponse> listAlarmModelVersions({
    required String alarmModelName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/alarm-models/${Uri.encodeComponent(alarmModelName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAlarmModelVersionsResponse.fromJson(response);
  }

  /// Lists the alarm models that you created. The operation returns only the
  /// metadata associated with each alarm model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListAlarmModelsResponse> listAlarmModels({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/alarm-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAlarmModelsResponse.fromJson(response);
  }

  /// Lists all the versions of a detector model. Only the metadata associated
  /// with each detector model version is returned.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model whose versions are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListDetectorModelVersionsResponse> listDetectorModelVersions({
    required String detectorModelName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector-models/${Uri.encodeComponent(detectorModelName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectorModelVersionsResponse.fromJson(response);
  }

  /// Lists the detector models you have created. Only the metadata associated
  /// with each detector model is returned.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListDetectorModelsResponse> listDetectorModels({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectorModelsResponse.fromJson(response);
  }

  /// Lists one or more input routings.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [inputIdentifier] :
  /// The identifer of the routed input.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListInputRoutingsResponse> listInputRoutings({
    required InputIdentifier inputIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'inputIdentifier': inputIdentifier,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/input-routings',
      exceptionFnMap: _exceptionFns,
    );
    return ListInputRoutingsResponse.fromJson(response);
  }

  /// Lists the inputs you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token that you can use to return the next set of results.
  Future<ListInputsResponse> listInputs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/inputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInputsResponse.fromJson(response);
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Sets or updates the AWS IoT Events logging options.
  ///
  /// If you update the value of any <code>loggingOptions</code> field, it takes
  /// up to one minute for the change to take effect. If you change the policy
  /// attached to the role you specified in the <code>roleArn</code> field (for
  /// example, to correct an invalid policy), it takes up to five minutes for
  /// that change to take effect.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnsupportedOperationException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [loggingOptions] :
  /// The new values of the AWS IoT Events logging options.
  Future<void> putLoggingOptions({
    required LoggingOptions loggingOptions,
  }) async {
    final $payload = <String, dynamic>{
      'loggingOptions': loggingOptions,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Performs an analysis of your detector model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-analyze-api.html">Troubleshooting
  /// a detector model</a> in the <i>AWS IoT Events Developer Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  Future<StartDetectorModelAnalysisResponse> startDetectorModelAnalysis({
    required DetectorModelDefinition detectorModelDefinition,
  }) async {
    final $payload = <String, dynamic>{
      'detectorModelDefinition': detectorModelDefinition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/analysis/detector-models/',
      exceptionFnMap: _exceptionFns,
    );
    return StartDetectorModelAnalysisResponse.fromJson(response);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an alarm model. Any alarms that were created based on the previous
  /// version are deleted and then created again as new data arrives.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [alarmModelName] :
  /// The name of the alarm model.
  ///
  /// Parameter [alarmRule] :
  /// Defines when your alarm is invoked.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that allows the alarm to perform actions and
  /// access AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [alarmCapabilities] :
  /// Contains the configuration information of alarm state changes.
  ///
  /// Parameter [alarmEventActions] :
  /// Contains information about one or more alarm actions.
  ///
  /// Parameter [alarmModelDescription] :
  /// The description of the alarm model.
  ///
  /// Parameter [alarmNotification] :
  /// Contains information about one or more notification actions.
  ///
  /// Parameter [severity] :
  /// A non-negative integer that reflects the severity level of the alarm.
  Future<UpdateAlarmModelResponse> updateAlarmModel({
    required String alarmModelName,
    required AlarmRule alarmRule,
    required String roleArn,
    AlarmCapabilities? alarmCapabilities,
    AlarmEventActions? alarmEventActions,
    String? alarmModelDescription,
    AlarmNotification? alarmNotification,
    int? severity,
  }) async {
    _s.validateNumRange(
      'severity',
      severity,
      0,
      2147483647,
    );
    final $payload = <String, dynamic>{
      'alarmRule': alarmRule,
      'roleArn': roleArn,
      if (alarmCapabilities != null) 'alarmCapabilities': alarmCapabilities,
      if (alarmEventActions != null) 'alarmEventActions': alarmEventActions,
      if (alarmModelDescription != null)
        'alarmModelDescription': alarmModelDescription,
      if (alarmNotification != null) 'alarmNotification': alarmNotification,
      if (severity != null) 'severity': severity,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/alarm-models/${Uri.encodeComponent(alarmModelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAlarmModelResponse.fromJson(response);
  }

  /// Updates a detector model. Detectors (instances) spawned by the previous
  /// version are deleted and then re-created as new inputs arrive.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [detectorModelDefinition] :
  /// Information that defines how a detector operates.
  ///
  /// Parameter [detectorModelName] :
  /// The name of the detector model that is updated.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that grants permission to AWS IoT Events to perform
  /// its operations.
  ///
  /// Parameter [detectorModelDescription] :
  /// A brief description of the detector model.
  ///
  /// Parameter [evaluationMethod] :
  /// Information about the order in which events are evaluated and how actions
  /// are executed.
  Future<UpdateDetectorModelResponse> updateDetectorModel({
    required DetectorModelDefinition detectorModelDefinition,
    required String detectorModelName,
    required String roleArn,
    String? detectorModelDescription,
    EvaluationMethod? evaluationMethod,
  }) async {
    final $payload = <String, dynamic>{
      'detectorModelDefinition': detectorModelDefinition,
      'roleArn': roleArn,
      if (detectorModelDescription != null)
        'detectorModelDescription': detectorModelDescription,
      if (evaluationMethod != null)
        'evaluationMethod': evaluationMethod.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector-models/${Uri.encodeComponent(detectorModelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDetectorModelResponse.fromJson(response);
  }

  /// Updates an input.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [inputDefinition] :
  /// The definition of the input.
  ///
  /// Parameter [inputName] :
  /// The name of the input you want to update.
  ///
  /// Parameter [inputDescription] :
  /// A brief description of the input.
  Future<UpdateInputResponse> updateInput({
    required InputDefinition inputDefinition,
    required String inputName,
    String? inputDescription,
  }) async {
    final $payload = <String, dynamic>{
      'inputDefinition': inputDefinition,
      if (inputDescription != null) 'inputDescription': inputDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/inputs/${Uri.encodeComponent(inputName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInputResponse.fromJson(response);
  }
}

/// Specifies whether to get notified for alarm state changes.
class AcknowledgeFlow {
  /// The value must be <code>TRUE</code> or <code>FALSE</code>. If
  /// <code>TRUE</code>, you receive a notification when the alarm state changes.
  /// You must choose to acknowledge the notification before the alarm state can
  /// return to <code>NORMAL</code>. If <code>FALSE</code>, you won't receive
  /// notifications. The alarm automatically changes to the <code>NORMAL</code>
  /// state when the input property value returns to the specified range.
  final bool enabled;

  AcknowledgeFlow({
    required this.enabled,
  });

  factory AcknowledgeFlow.fromJson(Map<String, dynamic> json) {
    return AcknowledgeFlow(
      enabled: json['enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'enabled': enabled,
    };
  }
}

/// An action to be performed when the <code>condition</code> is TRUE.
class Action {
  /// Information needed to clear the timer.
  final ClearTimerAction? clearTimer;

  /// Writes to the DynamoDB table that you created. The default action payload
  /// contains all attribute-value pairs that have the information about the
  /// detector model instance and the event that triggered the action. You can
  /// customize the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
  /// One column of the DynamoDB table receives all attribute-value pairs in the
  /// payload that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-event-actions.html">Actions</a>
  /// in <i>AWS IoT Events Developer Guide</i>.
  final DynamoDBAction? dynamoDB;

  /// Writes to the DynamoDB table that you created. The default action payload
  /// contains all attribute-value pairs that have the information about the
  /// detector model instance and the event that triggered the action. You can
  /// customize the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
  /// A separate column of the DynamoDB table receives one attribute-value pair in
  /// the payload that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-event-actions.html">Actions</a>
  /// in <i>AWS IoT Events Developer Guide</i>.
  final DynamoDBv2Action? dynamoDBv2;

  /// Sends information about the detector model instance and the event that
  /// triggered the action to an Amazon Kinesis Data Firehose delivery stream.
  final FirehoseAction? firehose;

  /// Sends AWS IoT Events input, which passes information about the detector
  /// model instance and the event that triggered the action.
  final IotEventsAction? iotEvents;

  /// Sends information about the detector model instance and the event that
  /// triggered the action to an asset property in AWS IoT SiteWise .
  final IotSiteWiseAction? iotSiteWise;

  /// Publishes an MQTT message with the given topic to the AWS IoT message
  /// broker.
  final IotTopicPublishAction? iotTopicPublish;

  /// Calls a Lambda function, passing in information about the detector model
  /// instance and the event that triggered the action.
  final LambdaAction? lambda;

  /// Information needed to reset the timer.
  final ResetTimerAction? resetTimer;

  /// Information needed to set the timer.
  final SetTimerAction? setTimer;

  /// Sets a variable to a specified value.
  final SetVariableAction? setVariable;

  /// Sends an Amazon SNS message.
  final SNSTopicPublishAction? sns;

  /// Sends information about the detector model instance and the event that
  /// triggered the action to an Amazon SQS queue.
  final SqsAction? sqs;

  Action({
    this.clearTimer,
    this.dynamoDB,
    this.dynamoDBv2,
    this.firehose,
    this.iotEvents,
    this.iotSiteWise,
    this.iotTopicPublish,
    this.lambda,
    this.resetTimer,
    this.setTimer,
    this.setVariable,
    this.sns,
    this.sqs,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      clearTimer: json['clearTimer'] != null
          ? ClearTimerAction.fromJson(
              json['clearTimer'] as Map<String, dynamic>)
          : null,
      dynamoDB: json['dynamoDB'] != null
          ? DynamoDBAction.fromJson(json['dynamoDB'] as Map<String, dynamic>)
          : null,
      dynamoDBv2: json['dynamoDBv2'] != null
          ? DynamoDBv2Action.fromJson(
              json['dynamoDBv2'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? FirehoseAction.fromJson(json['firehose'] as Map<String, dynamic>)
          : null,
      iotEvents: json['iotEvents'] != null
          ? IotEventsAction.fromJson(json['iotEvents'] as Map<String, dynamic>)
          : null,
      iotSiteWise: json['iotSiteWise'] != null
          ? IotSiteWiseAction.fromJson(
              json['iotSiteWise'] as Map<String, dynamic>)
          : null,
      iotTopicPublish: json['iotTopicPublish'] != null
          ? IotTopicPublishAction.fromJson(
              json['iotTopicPublish'] as Map<String, dynamic>)
          : null,
      lambda: json['lambda'] != null
          ? LambdaAction.fromJson(json['lambda'] as Map<String, dynamic>)
          : null,
      resetTimer: json['resetTimer'] != null
          ? ResetTimerAction.fromJson(
              json['resetTimer'] as Map<String, dynamic>)
          : null,
      setTimer: json['setTimer'] != null
          ? SetTimerAction.fromJson(json['setTimer'] as Map<String, dynamic>)
          : null,
      setVariable: json['setVariable'] != null
          ? SetVariableAction.fromJson(
              json['setVariable'] as Map<String, dynamic>)
          : null,
      sns: json['sns'] != null
          ? SNSTopicPublishAction.fromJson(json['sns'] as Map<String, dynamic>)
          : null,
      sqs: json['sqs'] != null
          ? SqsAction.fromJson(json['sqs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clearTimer = this.clearTimer;
    final dynamoDB = this.dynamoDB;
    final dynamoDBv2 = this.dynamoDBv2;
    final firehose = this.firehose;
    final iotEvents = this.iotEvents;
    final iotSiteWise = this.iotSiteWise;
    final iotTopicPublish = this.iotTopicPublish;
    final lambda = this.lambda;
    final resetTimer = this.resetTimer;
    final setTimer = this.setTimer;
    final setVariable = this.setVariable;
    final sns = this.sns;
    final sqs = this.sqs;
    return {
      if (clearTimer != null) 'clearTimer': clearTimer,
      if (dynamoDB != null) 'dynamoDB': dynamoDB,
      if (dynamoDBv2 != null) 'dynamoDBv2': dynamoDBv2,
      if (firehose != null) 'firehose': firehose,
      if (iotEvents != null) 'iotEvents': iotEvents,
      if (iotSiteWise != null) 'iotSiteWise': iotSiteWise,
      if (iotTopicPublish != null) 'iotTopicPublish': iotTopicPublish,
      if (lambda != null) 'lambda': lambda,
      if (resetTimer != null) 'resetTimer': resetTimer,
      if (setTimer != null) 'setTimer': setTimer,
      if (setVariable != null) 'setVariable': setVariable,
      if (sns != null) 'sns': sns,
      if (sqs != null) 'sqs': sqs,
    };
  }
}

/// Specifies one of the following actions to receive notifications when the
/// alarm state changes.
class AlarmAction {
  final DynamoDBAction? dynamoDB;
  final DynamoDBv2Action? dynamoDBv2;
  final FirehoseAction? firehose;
  final IotEventsAction? iotEvents;
  final IotSiteWiseAction? iotSiteWise;
  final IotTopicPublishAction? iotTopicPublish;
  final LambdaAction? lambda;
  final SNSTopicPublishAction? sns;
  final SqsAction? sqs;

  AlarmAction({
    this.dynamoDB,
    this.dynamoDBv2,
    this.firehose,
    this.iotEvents,
    this.iotSiteWise,
    this.iotTopicPublish,
    this.lambda,
    this.sns,
    this.sqs,
  });

  factory AlarmAction.fromJson(Map<String, dynamic> json) {
    return AlarmAction(
      dynamoDB: json['dynamoDB'] != null
          ? DynamoDBAction.fromJson(json['dynamoDB'] as Map<String, dynamic>)
          : null,
      dynamoDBv2: json['dynamoDBv2'] != null
          ? DynamoDBv2Action.fromJson(
              json['dynamoDBv2'] as Map<String, dynamic>)
          : null,
      firehose: json['firehose'] != null
          ? FirehoseAction.fromJson(json['firehose'] as Map<String, dynamic>)
          : null,
      iotEvents: json['iotEvents'] != null
          ? IotEventsAction.fromJson(json['iotEvents'] as Map<String, dynamic>)
          : null,
      iotSiteWise: json['iotSiteWise'] != null
          ? IotSiteWiseAction.fromJson(
              json['iotSiteWise'] as Map<String, dynamic>)
          : null,
      iotTopicPublish: json['iotTopicPublish'] != null
          ? IotTopicPublishAction.fromJson(
              json['iotTopicPublish'] as Map<String, dynamic>)
          : null,
      lambda: json['lambda'] != null
          ? LambdaAction.fromJson(json['lambda'] as Map<String, dynamic>)
          : null,
      sns: json['sns'] != null
          ? SNSTopicPublishAction.fromJson(json['sns'] as Map<String, dynamic>)
          : null,
      sqs: json['sqs'] != null
          ? SqsAction.fromJson(json['sqs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamoDB = this.dynamoDB;
    final dynamoDBv2 = this.dynamoDBv2;
    final firehose = this.firehose;
    final iotEvents = this.iotEvents;
    final iotSiteWise = this.iotSiteWise;
    final iotTopicPublish = this.iotTopicPublish;
    final lambda = this.lambda;
    final sns = this.sns;
    final sqs = this.sqs;
    return {
      if (dynamoDB != null) 'dynamoDB': dynamoDB,
      if (dynamoDBv2 != null) 'dynamoDBv2': dynamoDBv2,
      if (firehose != null) 'firehose': firehose,
      if (iotEvents != null) 'iotEvents': iotEvents,
      if (iotSiteWise != null) 'iotSiteWise': iotSiteWise,
      if (iotTopicPublish != null) 'iotTopicPublish': iotTopicPublish,
      if (lambda != null) 'lambda': lambda,
      if (sns != null) 'sns': sns,
      if (sqs != null) 'sqs': sqs,
    };
  }
}

/// Contains the configuration information of alarm state changes.
class AlarmCapabilities {
  /// Specifies whether to get notified for alarm state changes.
  final AcknowledgeFlow? acknowledgeFlow;

  /// Specifies the default alarm state. The configuration applies to all alarms
  /// that were created based on this alarm model.
  final InitializationConfiguration? initializationConfiguration;

  AlarmCapabilities({
    this.acknowledgeFlow,
    this.initializationConfiguration,
  });

  factory AlarmCapabilities.fromJson(Map<String, dynamic> json) {
    return AlarmCapabilities(
      acknowledgeFlow: json['acknowledgeFlow'] != null
          ? AcknowledgeFlow.fromJson(
              json['acknowledgeFlow'] as Map<String, dynamic>)
          : null,
      initializationConfiguration: json['initializationConfiguration'] != null
          ? InitializationConfiguration.fromJson(
              json['initializationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgeFlow = this.acknowledgeFlow;
    final initializationConfiguration = this.initializationConfiguration;
    return {
      if (acknowledgeFlow != null) 'acknowledgeFlow': acknowledgeFlow,
      if (initializationConfiguration != null)
        'initializationConfiguration': initializationConfiguration,
    };
  }
}

/// Contains information about one or more alarm actions.
class AlarmEventActions {
  /// Specifies one or more supported actions to receive notifications when the
  /// alarm state changes.
  final List<AlarmAction>? alarmActions;

  AlarmEventActions({
    this.alarmActions,
  });

  factory AlarmEventActions.fromJson(Map<String, dynamic> json) {
    return AlarmEventActions(
      alarmActions: (json['alarmActions'] as List?)
          ?.whereNotNull()
          .map((e) => AlarmAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmActions = this.alarmActions;
    return {
      if (alarmActions != null) 'alarmActions': alarmActions,
    };
  }
}

/// Contains a summary of an alarm model.
class AlarmModelSummary {
  /// The description of the alarm model.
  final String? alarmModelDescription;

  /// The name of the alarm model.
  final String? alarmModelName;

  /// The time the alarm model was created, in the Unix epoch format.
  final DateTime? creationTime;

  AlarmModelSummary({
    this.alarmModelDescription,
    this.alarmModelName,
    this.creationTime,
  });

  factory AlarmModelSummary.fromJson(Map<String, dynamic> json) {
    return AlarmModelSummary(
      alarmModelDescription: json['alarmModelDescription'] as String?,
      alarmModelName: json['alarmModelName'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelDescription = this.alarmModelDescription;
    final alarmModelName = this.alarmModelName;
    final creationTime = this.creationTime;
    return {
      if (alarmModelDescription != null)
        'alarmModelDescription': alarmModelDescription,
      if (alarmModelName != null) 'alarmModelName': alarmModelName,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
    };
  }
}

enum AlarmModelVersionStatus {
  active,
  activating,
  inactive,
  failed,
}

extension AlarmModelVersionStatusValueExtension on AlarmModelVersionStatus {
  String toValue() {
    switch (this) {
      case AlarmModelVersionStatus.active:
        return 'ACTIVE';
      case AlarmModelVersionStatus.activating:
        return 'ACTIVATING';
      case AlarmModelVersionStatus.inactive:
        return 'INACTIVE';
      case AlarmModelVersionStatus.failed:
        return 'FAILED';
    }
  }
}

extension AlarmModelVersionStatusFromString on String {
  AlarmModelVersionStatus toAlarmModelVersionStatus() {
    switch (this) {
      case 'ACTIVE':
        return AlarmModelVersionStatus.active;
      case 'ACTIVATING':
        return AlarmModelVersionStatus.activating;
      case 'INACTIVE':
        return AlarmModelVersionStatus.inactive;
      case 'FAILED':
        return AlarmModelVersionStatus.failed;
    }
    throw Exception('$this is not known in enum AlarmModelVersionStatus');
  }
}

/// Contains a summary of an alarm model version.
class AlarmModelVersionSummary {
  /// The ARN of the alarm model. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? alarmModelArn;

  /// The name of the alarm model.
  final String? alarmModelName;

  /// The version of the alarm model.
  final String? alarmModelVersion;

  /// The time the alarm model was created, in the Unix epoch format.
  final DateTime? creationTime;

  /// The time the alarm model was last updated, in the Unix epoch format.
  final DateTime? lastUpdateTime;

  /// The ARN of the IAM role that allows the alarm to perform actions and access
  /// AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? roleArn;

  /// The status of the alarm model. The status can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The alarm model is active and it's ready to evaluate
  /// data.
  /// </li>
  /// <li>
  /// <code>ACTIVATING</code> - AWS IoT Events is activating your alarm model.
  /// Activating an alarm model can take up to a few minutes.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code> - The alarm model is inactive, so it isn't ready to
  /// evaluate data. Check your alarm model information and update the alarm
  /// model.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - You couldn't create or update the alarm model. Check
  /// your alarm model information and try again.
  /// </li>
  /// </ul>
  final AlarmModelVersionStatus? status;

  /// Contains information about the status of the alarm model version.
  final String? statusMessage;

  AlarmModelVersionSummary({
    this.alarmModelArn,
    this.alarmModelName,
    this.alarmModelVersion,
    this.creationTime,
    this.lastUpdateTime,
    this.roleArn,
    this.status,
    this.statusMessage,
  });

  factory AlarmModelVersionSummary.fromJson(Map<String, dynamic> json) {
    return AlarmModelVersionSummary(
      alarmModelArn: json['alarmModelArn'] as String?,
      alarmModelName: json['alarmModelName'] as String?,
      alarmModelVersion: json['alarmModelVersion'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toAlarmModelVersionStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelArn = this.alarmModelArn;
    final alarmModelName = this.alarmModelName;
    final alarmModelVersion = this.alarmModelVersion;
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final roleArn = this.roleArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (alarmModelArn != null) 'alarmModelArn': alarmModelArn,
      if (alarmModelName != null) 'alarmModelName': alarmModelName,
      if (alarmModelVersion != null) 'alarmModelVersion': alarmModelVersion,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// Contains information about one or more notification actions.
class AlarmNotification {
  /// Contains the notification settings of an alarm model. The settings apply to
  /// all alarms that were created based on this alarm model.
  final List<NotificationAction>? notificationActions;

  AlarmNotification({
    this.notificationActions,
  });

  factory AlarmNotification.fromJson(Map<String, dynamic> json) {
    return AlarmNotification(
      notificationActions: (json['notificationActions'] as List?)
          ?.whereNotNull()
          .map((e) => NotificationAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationActions = this.notificationActions;
    return {
      if (notificationActions != null)
        'notificationActions': notificationActions,
    };
  }
}

/// Defines when your alarm is invoked.
class AlarmRule {
  /// A rule that compares an input property value to a threshold value with a
  /// comparison operator.
  final SimpleRule? simpleRule;

  AlarmRule({
    this.simpleRule,
  });

  factory AlarmRule.fromJson(Map<String, dynamic> json) {
    return AlarmRule(
      simpleRule: json['simpleRule'] != null
          ? SimpleRule.fromJson(json['simpleRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final simpleRule = this.simpleRule;
    return {
      if (simpleRule != null) 'simpleRule': simpleRule,
    };
  }
}

/// Contains the result of the analysis.
class AnalysisResult {
  /// The severity level of the analysis result. Based on the severity level,
  /// analysis results fall into three general categories:
  ///
  /// <ul>
  /// <li>
  /// <code>INFO</code> - An information result tells you about a significant
  /// field in your detector model. This type of result usually doesn't require
  /// immediate action.
  /// </li>
  /// <li>
  /// <code>WARNING</code> - A warning result draws special attention to fields
  /// that might cause issues for your detector model. We recommend that you
  /// review warnings and take necessary actions before you use your detector
  /// model in production environments. Otherwise, the detector model might not
  /// work as expected.
  /// </li>
  /// <li>
  /// <code>ERROR</code> - An error result notifies you about a problem found in
  /// your detector model. You must fix all errors before you can publish your
  /// detector model.
  /// </li>
  /// </ul>
  final AnalysisResultLevel? level;

  /// Contains one or more locations that you can use to locate the fields in your
  /// detector model that the analysis result references.
  final List<AnalysisResultLocation>? locations;

  /// Contains additional information about the analysis result.
  final String? message;

  /// The type of the analysis result. Analyses fall into the following types
  /// based on the validators used to generate the analysis result:
  ///
  /// <ul>
  /// <li>
  /// <code>supported-actions</code> - You must specify AWS IoT Events supported
  /// actions that work with other AWS services in a supported AWS Region.
  /// </li>
  /// <li>
  /// <code>service-limits</code> - Resources or API operations can't exceed
  /// service quotas (also known as limits). Update your detector model or request
  /// a quota increase.
  /// </li>
  /// <li>
  /// <code>structure</code> - The detector model must follow a structure that AWS
  /// IoT Events supports.
  /// </li>
  /// <li>
  /// <code>expression-syntax</code> - Your expression must follow the required
  /// syntax.
  /// </li>
  /// <li>
  /// <code>data-type</code> - Data types referenced in the detector model must be
  /// compatible.
  /// </li>
  /// <li>
  /// <code>referenced-data</code> - You must define the data referenced in your
  /// detector model before you can use the data.
  /// </li>
  /// <li>
  /// <code>referenced-resource</code> - Resources that the detector model uses
  /// must be available.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-analyze-api.html">Running
  /// detector model analyses</a> in the <i>AWS IoT Events Developer Guide</i>.
  final String? type;

  AnalysisResult({
    this.level,
    this.locations,
    this.message,
    this.type,
  });

  factory AnalysisResult.fromJson(Map<String, dynamic> json) {
    return AnalysisResult(
      level: (json['level'] as String?)?.toAnalysisResultLevel(),
      locations: (json['locations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AnalysisResultLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final level = this.level;
    final locations = this.locations;
    final message = this.message;
    final type = this.type;
    return {
      if (level != null) 'level': level.toValue(),
      if (locations != null) 'locations': locations,
      if (message != null) 'message': message,
      if (type != null) 'type': type,
    };
  }
}

enum AnalysisResultLevel {
  info,
  warning,
  error,
}

extension AnalysisResultLevelValueExtension on AnalysisResultLevel {
  String toValue() {
    switch (this) {
      case AnalysisResultLevel.info:
        return 'INFO';
      case AnalysisResultLevel.warning:
        return 'WARNING';
      case AnalysisResultLevel.error:
        return 'ERROR';
    }
  }
}

extension AnalysisResultLevelFromString on String {
  AnalysisResultLevel toAnalysisResultLevel() {
    switch (this) {
      case 'INFO':
        return AnalysisResultLevel.info;
      case 'WARNING':
        return AnalysisResultLevel.warning;
      case 'ERROR':
        return AnalysisResultLevel.error;
    }
    throw Exception('$this is not known in enum AnalysisResultLevel');
  }
}

/// Contains information that you can use to locate the field in your detector
/// model that the analysis result references.
class AnalysisResultLocation {
  /// A <a href="https://github.com/json-path/JsonPath">JsonPath</a> expression
  /// that identifies the error field in your detector model.
  final String? path;

  AnalysisResultLocation({
    this.path,
  });

  factory AnalysisResultLocation.fromJson(Map<String, dynamic> json) {
    return AnalysisResultLocation(
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      if (path != null) 'path': path,
    };
  }
}

enum AnalysisStatus {
  running,
  complete,
  failed,
}

extension AnalysisStatusValueExtension on AnalysisStatus {
  String toValue() {
    switch (this) {
      case AnalysisStatus.running:
        return 'RUNNING';
      case AnalysisStatus.complete:
        return 'COMPLETE';
      case AnalysisStatus.failed:
        return 'FAILED';
    }
  }
}

extension AnalysisStatusFromString on String {
  AnalysisStatus toAnalysisStatus() {
    switch (this) {
      case 'RUNNING':
        return AnalysisStatus.running;
      case 'COMPLETE':
        return AnalysisStatus.complete;
      case 'FAILED':
        return AnalysisStatus.failed;
    }
    throw Exception('$this is not known in enum AnalysisStatus');
  }
}

/// A structure that contains timestamp information. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_TimeInNanos.html">TimeInNanos</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
///
/// You must use expressions for all parameters in
/// <code>AssetPropertyTimestamp</code>. The expressions accept literals,
/// operators, functions, references, and substitution templates.
/// <p class="title"> <b>Examples</b>
///
/// <ul>
/// <li>
/// For literal values, the expressions must contain single quotes. For example,
/// the value for the <code>timeInSeconds</code> parameter can be
/// <code>'1586400675'</code>.
/// </li>
/// <li>
/// For references, you must specify either variables or input values. For
/// example, the value for the <code>offsetInNanos</code> parameter can be
/// <code>$variable.time</code>.
/// </li>
/// <li>
/// For a substitution template, you must use <code>${}</code>, and the template
/// must be in single quotes. A substitution template can also contain a
/// combination of literals, operators, functions, references, and substitution
/// templates.
///
/// In the following example, the value for the <code>timeInSeconds</code>
/// parameter uses a substitution template.
///
/// <code>'${$input.TemperatureInput.sensorData.timestamp / 1000}'</code>
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
class AssetPropertyTimestamp {
  /// The timestamp, in seconds, in the Unix epoch format. The valid range is
  /// between 1-31556889864403199.
  final String timeInSeconds;

  /// The nanosecond offset converted from <code>timeInSeconds</code>. The valid
  /// range is between 0-999999999.
  final String? offsetInNanos;

  AssetPropertyTimestamp({
    required this.timeInSeconds,
    this.offsetInNanos,
  });

  factory AssetPropertyTimestamp.fromJson(Map<String, dynamic> json) {
    return AssetPropertyTimestamp(
      timeInSeconds: json['timeInSeconds'] as String,
      offsetInNanos: json['offsetInNanos'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeInSeconds = this.timeInSeconds;
    final offsetInNanos = this.offsetInNanos;
    return {
      'timeInSeconds': timeInSeconds,
      if (offsetInNanos != null) 'offsetInNanos': offsetInNanos,
    };
  }
}

/// A structure that contains value information. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_AssetPropertyValue.html">AssetPropertyValue</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
///
/// You must use expressions for all parameters in
/// <code>AssetPropertyValue</code>. The expressions accept literals, operators,
/// functions, references, and substitution templates.
/// <p class="title"> <b>Examples</b>
///
/// <ul>
/// <li>
/// For literal values, the expressions must contain single quotes. For example,
/// the value for the <code>quality</code> parameter can be <code>'GOOD'</code>.
/// </li>
/// <li>
/// For references, you must specify either variables or input values. For
/// example, the value for the <code>quality</code> parameter can be
/// <code>$input.TemperatureInput.sensorData.quality</code>.
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
class AssetPropertyValue {
  /// The quality of the asset property value. The value must be
  /// <code>'GOOD'</code>, <code>'BAD'</code>, or <code>'UNCERTAIN'</code>.
  final String? quality;

  /// The timestamp associated with the asset property value. The default is the
  /// current event time.
  final AssetPropertyTimestamp? timestamp;

  /// The value to send to an asset property.
  final AssetPropertyVariant? value;

  AssetPropertyValue({
    this.quality,
    this.timestamp,
    this.value,
  });

  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) {
    return AssetPropertyValue(
      quality: json['quality'] as String?,
      timestamp: json['timestamp'] != null
          ? AssetPropertyTimestamp.fromJson(
              json['timestamp'] as Map<String, dynamic>)
          : null,
      value: json['value'] != null
          ? AssetPropertyVariant.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quality = this.quality;
    final timestamp = this.timestamp;
    final value = this.value;
    return {
      if (quality != null) 'quality': quality,
      if (timestamp != null) 'timestamp': timestamp,
      if (value != null) 'value': value,
    };
  }
}

/// A structure that contains an asset property value. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_Variant.html">Variant</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
///
/// You must use expressions for all parameters in
/// <code>AssetPropertyVariant</code>. The expressions accept literals,
/// operators, functions, references, and substitution templates.
/// <p class="title"> <b>Examples</b>
///
/// <ul>
/// <li>
/// For literal values, the expressions must contain single quotes. For example,
/// the value for the <code>integerValue</code> parameter can be
/// <code>'100'</code>.
/// </li>
/// <li>
/// For references, you must specify either variables or parameters. For
/// example, the value for the <code>booleanValue</code> parameter can be
/// <code>$variable.offline</code>.
/// </li>
/// <li>
/// For a substitution template, you must use <code>${}</code>, and the template
/// must be in single quotes. A substitution template can also contain a
/// combination of literals, operators, functions, references, and substitution
/// templates.
///
/// In the following example, the value for the <code>doubleValue</code>
/// parameter uses a substitution template.
///
/// <code>'${$input.TemperatureInput.sensorData.temperature * 6 / 5 +
/// 32}'</code>
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
///
/// You must specify one of the following value types, depending on the
/// <code>dataType</code> of the specified asset property. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_AssetProperty.html">AssetProperty</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
class AssetPropertyVariant {
  /// The asset property value is a Boolean value that must be <code>'TRUE'</code>
  /// or <code>'FALSE'</code>. You must use an expression, and the evaluated
  /// result should be a Boolean value.
  final String? booleanValue;

  /// The asset property value is a double. You must use an expression, and the
  /// evaluated result should be a double.
  final String? doubleValue;

  /// The asset property value is an integer. You must use an expression, and the
  /// evaluated result should be an integer.
  final String? integerValue;

  /// The asset property value is a string. You must use an expression, and the
  /// evaluated result should be a string.
  final String? stringValue;

  AssetPropertyVariant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });

  factory AssetPropertyVariant.fromJson(Map<String, dynamic> json) {
    return AssetPropertyVariant(
      booleanValue: json['booleanValue'] as String?,
      doubleValue: json['doubleValue'] as String?,
      integerValue: json['integerValue'] as String?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final integerValue = this.integerValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// The attributes from the JSON payload that are made available by the input.
/// Inputs are derived from messages sent to the AWS IoT Events system using
/// <code>BatchPutMessage</code>. Each such message contains a JSON payload.
/// Those attributes (and their paired values) specified here are available for
/// use in the <code>condition</code> expressions used by detectors.
class Attribute {
  /// An expression that specifies an attribute-value pair in a JSON structure.
  /// Use this to specify an attribute from the JSON payload that is made
  /// available by the input. Inputs are derived from messages sent to AWS IoT
  /// Events (<code>BatchPutMessage</code>). Each such message contains a JSON
  /// payload. The attribute (and its paired value) specified here are available
  /// for use in the <code>condition</code> expressions used by detectors.
  ///
  /// Syntax: <code>&lt;field-name&gt;.&lt;field-name&gt;...</code>
  final String jsonPath;

  Attribute({
    required this.jsonPath,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      jsonPath: json['jsonPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    return {
      'jsonPath': jsonPath,
    };
  }
}

/// Information needed to clear the timer.
class ClearTimerAction {
  /// The name of the timer to clear.
  final String timerName;

  ClearTimerAction({
    required this.timerName,
  });

  factory ClearTimerAction.fromJson(Map<String, dynamic> json) {
    return ClearTimerAction(
      timerName: json['timerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final timerName = this.timerName;
    return {
      'timerName': timerName,
    };
  }
}

enum ComparisonOperator {
  greater,
  greaterOrEqual,
  less,
  lessOrEqual,
  equal,
  notEqual,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greater:
        return 'GREATER';
      case ComparisonOperator.greaterOrEqual:
        return 'GREATER_OR_EQUAL';
      case ComparisonOperator.less:
        return 'LESS';
      case ComparisonOperator.lessOrEqual:
        return 'LESS_OR_EQUAL';
      case ComparisonOperator.equal:
        return 'EQUAL';
      case ComparisonOperator.notEqual:
        return 'NOT_EQUAL';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GREATER':
        return ComparisonOperator.greater;
      case 'GREATER_OR_EQUAL':
        return ComparisonOperator.greaterOrEqual;
      case 'LESS':
        return ComparisonOperator.less;
      case 'LESS_OR_EQUAL':
        return ComparisonOperator.lessOrEqual;
      case 'EQUAL':
        return ComparisonOperator.equal;
      case 'NOT_EQUAL':
        return ComparisonOperator.notEqual;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

class CreateAlarmModelResponse {
  /// The ARN of the alarm model. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? alarmModelArn;

  /// The version of the alarm model.
  final String? alarmModelVersion;

  /// The time the alarm model was created, in the Unix epoch format.
  final DateTime? creationTime;

  /// The time the alarm model was last updated, in the Unix epoch format.
  final DateTime? lastUpdateTime;

  /// The status of the alarm model. The status can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The alarm model is active and it's ready to evaluate
  /// data.
  /// </li>
  /// <li>
  /// <code>ACTIVATING</code> - AWS IoT Events is activating your alarm model.
  /// Activating an alarm model can take up to a few minutes.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code> - The alarm model is inactive, so it isn't ready to
  /// evaluate data. Check your alarm model information and update the alarm
  /// model.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - You couldn't create or update the alarm model. Check
  /// your alarm model information and try again.
  /// </li>
  /// </ul>
  final AlarmModelVersionStatus? status;

  CreateAlarmModelResponse({
    this.alarmModelArn,
    this.alarmModelVersion,
    this.creationTime,
    this.lastUpdateTime,
    this.status,
  });

  factory CreateAlarmModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateAlarmModelResponse(
      alarmModelArn: json['alarmModelArn'] as String?,
      alarmModelVersion: json['alarmModelVersion'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      status: (json['status'] as String?)?.toAlarmModelVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelArn = this.alarmModelArn;
    final alarmModelVersion = this.alarmModelVersion;
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    return {
      if (alarmModelArn != null) 'alarmModelArn': alarmModelArn,
      if (alarmModelVersion != null) 'alarmModelVersion': alarmModelVersion,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateDetectorModelResponse {
  /// Information about how the detector model is configured.
  final DetectorModelConfiguration? detectorModelConfiguration;

  CreateDetectorModelResponse({
    this.detectorModelConfiguration,
  });

  factory CreateDetectorModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateDetectorModelResponse(
      detectorModelConfiguration: json['detectorModelConfiguration'] != null
          ? DetectorModelConfiguration.fromJson(
              json['detectorModelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModelConfiguration = this.detectorModelConfiguration;
    return {
      if (detectorModelConfiguration != null)
        'detectorModelConfiguration': detectorModelConfiguration,
    };
  }
}

class CreateInputResponse {
  /// Information about the configuration of the input.
  final InputConfiguration? inputConfiguration;

  CreateInputResponse({
    this.inputConfiguration,
  });

  factory CreateInputResponse.fromJson(Map<String, dynamic> json) {
    return CreateInputResponse(
      inputConfiguration: json['inputConfiguration'] != null
          ? InputConfiguration.fromJson(
              json['inputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputConfiguration = this.inputConfiguration;
    return {
      if (inputConfiguration != null) 'inputConfiguration': inputConfiguration,
    };
  }
}

class DeleteAlarmModelResponse {
  DeleteAlarmModelResponse();

  factory DeleteAlarmModelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAlarmModelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDetectorModelResponse {
  DeleteDetectorModelResponse();

  factory DeleteDetectorModelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDetectorModelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInputResponse {
  DeleteInputResponse();

  factory DeleteInputResponse.fromJson(Map<String, dynamic> _) {
    return DeleteInputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAlarmModelResponse {
  /// Contains the configuration information of alarm state changes.
  final AlarmCapabilities? alarmCapabilities;

  /// Contains information about one or more alarm actions.
  final AlarmEventActions? alarmEventActions;

  /// The ARN of the alarm model. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? alarmModelArn;

  /// The description of the alarm model.
  final String? alarmModelDescription;

  /// The name of the alarm model.
  final String? alarmModelName;

  /// The version of the alarm model.
  final String? alarmModelVersion;

  /// Contains information about one or more notification actions.
  final AlarmNotification? alarmNotification;

  /// Defines when your alarm is invoked.
  final AlarmRule? alarmRule;

  /// The time the alarm model was created, in the Unix epoch format.
  final DateTime? creationTime;

  /// An input attribute used as a key to create an alarm. AWS IoT Events routes
  /// <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Input.html">inputs</a>
  /// associated with this key to the alarm.
  final String? key;

  /// The time the alarm model was last updated, in the Unix epoch format.
  final DateTime? lastUpdateTime;

  /// The ARN of the IAM role that allows the alarm to perform actions and access
  /// AWS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? roleArn;

  /// A non-negative integer that reflects the severity level of the alarm.
  final int? severity;

  /// The status of the alarm model. The status can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The alarm model is active and it's ready to evaluate
  /// data.
  /// </li>
  /// <li>
  /// <code>ACTIVATING</code> - AWS IoT Events is activating your alarm model.
  /// Activating an alarm model can take up to a few minutes.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code> - The alarm model is inactive, so it isn't ready to
  /// evaluate data. Check your alarm model information and update the alarm
  /// model.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - You couldn't create or update the alarm model. Check
  /// your alarm model information and try again.
  /// </li>
  /// </ul>
  final AlarmModelVersionStatus? status;

  /// Contains information about the status of the alarm model.
  final String? statusMessage;

  DescribeAlarmModelResponse({
    this.alarmCapabilities,
    this.alarmEventActions,
    this.alarmModelArn,
    this.alarmModelDescription,
    this.alarmModelName,
    this.alarmModelVersion,
    this.alarmNotification,
    this.alarmRule,
    this.creationTime,
    this.key,
    this.lastUpdateTime,
    this.roleArn,
    this.severity,
    this.status,
    this.statusMessage,
  });

  factory DescribeAlarmModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAlarmModelResponse(
      alarmCapabilities: json['alarmCapabilities'] != null
          ? AlarmCapabilities.fromJson(
              json['alarmCapabilities'] as Map<String, dynamic>)
          : null,
      alarmEventActions: json['alarmEventActions'] != null
          ? AlarmEventActions.fromJson(
              json['alarmEventActions'] as Map<String, dynamic>)
          : null,
      alarmModelArn: json['alarmModelArn'] as String?,
      alarmModelDescription: json['alarmModelDescription'] as String?,
      alarmModelName: json['alarmModelName'] as String?,
      alarmModelVersion: json['alarmModelVersion'] as String?,
      alarmNotification: json['alarmNotification'] != null
          ? AlarmNotification.fromJson(
              json['alarmNotification'] as Map<String, dynamic>)
          : null,
      alarmRule: json['alarmRule'] != null
          ? AlarmRule.fromJson(json['alarmRule'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['creationTime']),
      key: json['key'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      roleArn: json['roleArn'] as String?,
      severity: json['severity'] as int?,
      status: (json['status'] as String?)?.toAlarmModelVersionStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmCapabilities = this.alarmCapabilities;
    final alarmEventActions = this.alarmEventActions;
    final alarmModelArn = this.alarmModelArn;
    final alarmModelDescription = this.alarmModelDescription;
    final alarmModelName = this.alarmModelName;
    final alarmModelVersion = this.alarmModelVersion;
    final alarmNotification = this.alarmNotification;
    final alarmRule = this.alarmRule;
    final creationTime = this.creationTime;
    final key = this.key;
    final lastUpdateTime = this.lastUpdateTime;
    final roleArn = this.roleArn;
    final severity = this.severity;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (alarmCapabilities != null) 'alarmCapabilities': alarmCapabilities,
      if (alarmEventActions != null) 'alarmEventActions': alarmEventActions,
      if (alarmModelArn != null) 'alarmModelArn': alarmModelArn,
      if (alarmModelDescription != null)
        'alarmModelDescription': alarmModelDescription,
      if (alarmModelName != null) 'alarmModelName': alarmModelName,
      if (alarmModelVersion != null) 'alarmModelVersion': alarmModelVersion,
      if (alarmNotification != null) 'alarmNotification': alarmNotification,
      if (alarmRule != null) 'alarmRule': alarmRule,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (key != null) 'key': key,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (severity != null) 'severity': severity,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class DescribeDetectorModelAnalysisResponse {
  /// The status of the analysis activity. The status can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>RUNNING</code> - AWS IoT Events is analyzing your detector model. This
  /// process can take several minutes to complete.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code> - AWS IoT Events finished analyzing your detector
  /// model.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - AWS IoT Events couldn't analyze your detector model.
  /// Try again later.
  /// </li>
  /// </ul>
  final AnalysisStatus? status;

  DescribeDetectorModelAnalysisResponse({
    this.status,
  });

  factory DescribeDetectorModelAnalysisResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDetectorModelAnalysisResponse(
      status: (json['status'] as String?)?.toAnalysisStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DescribeDetectorModelResponse {
  /// Information about the detector model.
  final DetectorModel? detectorModel;

  DescribeDetectorModelResponse({
    this.detectorModel,
  });

  factory DescribeDetectorModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDetectorModelResponse(
      detectorModel: json['detectorModel'] != null
          ? DetectorModel.fromJson(
              json['detectorModel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModel = this.detectorModel;
    return {
      if (detectorModel != null) 'detectorModel': detectorModel,
    };
  }
}

class DescribeInputResponse {
  /// Information about the input.
  final Input? input;

  DescribeInputResponse({
    this.input,
  });

  factory DescribeInputResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInputResponse(
      input: json['input'] != null
          ? Input.fromJson(json['input'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    return {
      if (input != null) 'input': input,
    };
  }
}

class DescribeLoggingOptionsResponse {
  /// The current settings of the AWS IoT Events logging options.
  final LoggingOptions? loggingOptions;

  DescribeLoggingOptionsResponse({
    this.loggingOptions,
  });

  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLoggingOptionsResponse(
      loggingOptions: json['loggingOptions'] != null
          ? LoggingOptions.fromJson(
              json['loggingOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingOptions = this.loggingOptions;
    return {
      if (loggingOptions != null) 'loggingOptions': loggingOptions,
    };
  }
}

/// The detector model and the specific detectors (instances) for which the
/// logging level is given.
class DetectorDebugOption {
  /// The name of the detector model.
  final String detectorModelName;

  /// The value of the input attribute key used to create the detector (the
  /// instance of the detector model).
  final String? keyValue;

  DetectorDebugOption({
    required this.detectorModelName,
    this.keyValue,
  });

  factory DetectorDebugOption.fromJson(Map<String, dynamic> json) {
    return DetectorDebugOption(
      detectorModelName: json['detectorModelName'] as String,
      keyValue: json['keyValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModelName = this.detectorModelName;
    final keyValue = this.keyValue;
    return {
      'detectorModelName': detectorModelName,
      if (keyValue != null) 'keyValue': keyValue,
    };
  }
}

/// Information about the detector model.
class DetectorModel {
  /// Information about how the detector is configured.
  final DetectorModelConfiguration? detectorModelConfiguration;

  /// Information that defines how a detector operates.
  final DetectorModelDefinition? detectorModelDefinition;

  DetectorModel({
    this.detectorModelConfiguration,
    this.detectorModelDefinition,
  });

  factory DetectorModel.fromJson(Map<String, dynamic> json) {
    return DetectorModel(
      detectorModelConfiguration: json['detectorModelConfiguration'] != null
          ? DetectorModelConfiguration.fromJson(
              json['detectorModelConfiguration'] as Map<String, dynamic>)
          : null,
      detectorModelDefinition: json['detectorModelDefinition'] != null
          ? DetectorModelDefinition.fromJson(
              json['detectorModelDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModelConfiguration = this.detectorModelConfiguration;
    final detectorModelDefinition = this.detectorModelDefinition;
    return {
      if (detectorModelConfiguration != null)
        'detectorModelConfiguration': detectorModelConfiguration,
      if (detectorModelDefinition != null)
        'detectorModelDefinition': detectorModelDefinition,
    };
  }
}

/// Information about how the detector model is configured.
class DetectorModelConfiguration {
  /// The time the detector model was created.
  final DateTime? creationTime;

  /// The ARN of the detector model.
  final String? detectorModelArn;

  /// A brief description of the detector model.
  final String? detectorModelDescription;

  /// The name of the detector model.
  final String? detectorModelName;

  /// The version of the detector model.
  final String? detectorModelVersion;

  /// Information about the order in which events are evaluated and how actions
  /// are executed.
  final EvaluationMethod? evaluationMethod;

  /// The value used to identify a detector instance. When a device or system
  /// sends input, a new detector instance with a unique key value is created. AWS
  /// IoT Events can continue to route input to its corresponding detector
  /// instance based on this identifying information.
  ///
  /// This parameter uses a JSON-path expression to select the attribute-value
  /// pair in the message payload that is used for identification. To route the
  /// message to the correct detector instance, the device must send a message
  /// payload that contains the same attribute-value.
  final String? key;

  /// The time the detector model was last updated.
  final DateTime? lastUpdateTime;

  /// The ARN of the role that grants permission to AWS IoT Events to perform its
  /// operations.
  final String? roleArn;

  /// The status of the detector model.
  final DetectorModelVersionStatus? status;

  DetectorModelConfiguration({
    this.creationTime,
    this.detectorModelArn,
    this.detectorModelDescription,
    this.detectorModelName,
    this.detectorModelVersion,
    this.evaluationMethod,
    this.key,
    this.lastUpdateTime,
    this.roleArn,
    this.status,
  });

  factory DetectorModelConfiguration.fromJson(Map<String, dynamic> json) {
    return DetectorModelConfiguration(
      creationTime: timeStampFromJson(json['creationTime']),
      detectorModelArn: json['detectorModelArn'] as String?,
      detectorModelDescription: json['detectorModelDescription'] as String?,
      detectorModelName: json['detectorModelName'] as String?,
      detectorModelVersion: json['detectorModelVersion'] as String?,
      evaluationMethod:
          (json['evaluationMethod'] as String?)?.toEvaluationMethod(),
      key: json['key'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toDetectorModelVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final detectorModelArn = this.detectorModelArn;
    final detectorModelDescription = this.detectorModelDescription;
    final detectorModelName = this.detectorModelName;
    final detectorModelVersion = this.detectorModelVersion;
    final evaluationMethod = this.evaluationMethod;
    final key = this.key;
    final lastUpdateTime = this.lastUpdateTime;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (detectorModelArn != null) 'detectorModelArn': detectorModelArn,
      if (detectorModelDescription != null)
        'detectorModelDescription': detectorModelDescription,
      if (detectorModelName != null) 'detectorModelName': detectorModelName,
      if (detectorModelVersion != null)
        'detectorModelVersion': detectorModelVersion,
      if (evaluationMethod != null)
        'evaluationMethod': evaluationMethod.toValue(),
      if (key != null) 'key': key,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Information that defines how a detector operates.
class DetectorModelDefinition {
  /// The state that is entered at the creation of each detector (instance).
  final String initialStateName;

  /// Information about the states of the detector.
  final List<State> states;

  DetectorModelDefinition({
    required this.initialStateName,
    required this.states,
  });

  factory DetectorModelDefinition.fromJson(Map<String, dynamic> json) {
    return DetectorModelDefinition(
      initialStateName: json['initialStateName'] as String,
      states: (json['states'] as List)
          .whereNotNull()
          .map((e) => State.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final initialStateName = this.initialStateName;
    final states = this.states;
    return {
      'initialStateName': initialStateName,
      'states': states,
    };
  }
}

/// Information about the detector model.
class DetectorModelSummary {
  /// The time the detector model was created.
  final DateTime? creationTime;

  /// A brief description of the detector model.
  final String? detectorModelDescription;

  /// The name of the detector model.
  final String? detectorModelName;

  DetectorModelSummary({
    this.creationTime,
    this.detectorModelDescription,
    this.detectorModelName,
  });

  factory DetectorModelSummary.fromJson(Map<String, dynamic> json) {
    return DetectorModelSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      detectorModelDescription: json['detectorModelDescription'] as String?,
      detectorModelName: json['detectorModelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final detectorModelDescription = this.detectorModelDescription;
    final detectorModelName = this.detectorModelName;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (detectorModelDescription != null)
        'detectorModelDescription': detectorModelDescription,
      if (detectorModelName != null) 'detectorModelName': detectorModelName,
    };
  }
}

enum DetectorModelVersionStatus {
  active,
  activating,
  inactive,
  deprecated,
  draft,
  paused,
  failed,
}

extension DetectorModelVersionStatusValueExtension
    on DetectorModelVersionStatus {
  String toValue() {
    switch (this) {
      case DetectorModelVersionStatus.active:
        return 'ACTIVE';
      case DetectorModelVersionStatus.activating:
        return 'ACTIVATING';
      case DetectorModelVersionStatus.inactive:
        return 'INACTIVE';
      case DetectorModelVersionStatus.deprecated:
        return 'DEPRECATED';
      case DetectorModelVersionStatus.draft:
        return 'DRAFT';
      case DetectorModelVersionStatus.paused:
        return 'PAUSED';
      case DetectorModelVersionStatus.failed:
        return 'FAILED';
    }
  }
}

extension DetectorModelVersionStatusFromString on String {
  DetectorModelVersionStatus toDetectorModelVersionStatus() {
    switch (this) {
      case 'ACTIVE':
        return DetectorModelVersionStatus.active;
      case 'ACTIVATING':
        return DetectorModelVersionStatus.activating;
      case 'INACTIVE':
        return DetectorModelVersionStatus.inactive;
      case 'DEPRECATED':
        return DetectorModelVersionStatus.deprecated;
      case 'DRAFT':
        return DetectorModelVersionStatus.draft;
      case 'PAUSED':
        return DetectorModelVersionStatus.paused;
      case 'FAILED':
        return DetectorModelVersionStatus.failed;
    }
    throw Exception('$this is not known in enum DetectorModelVersionStatus');
  }
}

/// Information about the detector model version.
class DetectorModelVersionSummary {
  /// The time the detector model version was created.
  final DateTime? creationTime;

  /// The ARN of the detector model version.
  final String? detectorModelArn;

  /// The name of the detector model.
  final String? detectorModelName;

  /// The ID of the detector model version.
  final String? detectorModelVersion;

  /// Information about the order in which events are evaluated and how actions
  /// are executed.
  final EvaluationMethod? evaluationMethod;

  /// The last time the detector model version was updated.
  final DateTime? lastUpdateTime;

  /// The ARN of the role that grants the detector model permission to perform its
  /// tasks.
  final String? roleArn;

  /// The status of the detector model version.
  final DetectorModelVersionStatus? status;

  DetectorModelVersionSummary({
    this.creationTime,
    this.detectorModelArn,
    this.detectorModelName,
    this.detectorModelVersion,
    this.evaluationMethod,
    this.lastUpdateTime,
    this.roleArn,
    this.status,
  });

  factory DetectorModelVersionSummary.fromJson(Map<String, dynamic> json) {
    return DetectorModelVersionSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      detectorModelArn: json['detectorModelArn'] as String?,
      detectorModelName: json['detectorModelName'] as String?,
      detectorModelVersion: json['detectorModelVersion'] as String?,
      evaluationMethod:
          (json['evaluationMethod'] as String?)?.toEvaluationMethod(),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toDetectorModelVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final detectorModelArn = this.detectorModelArn;
    final detectorModelName = this.detectorModelName;
    final detectorModelVersion = this.detectorModelVersion;
    final evaluationMethod = this.evaluationMethod;
    final lastUpdateTime = this.lastUpdateTime;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (detectorModelArn != null) 'detectorModelArn': detectorModelArn,
      if (detectorModelName != null) 'detectorModelName': detectorModelName,
      if (detectorModelVersion != null)
        'detectorModelVersion': detectorModelVersion,
      if (evaluationMethod != null)
        'evaluationMethod': evaluationMethod.toValue(),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Defines an action to write to the Amazon DynamoDB table that you created.
/// The standard action payload contains all the information about the detector
/// model instance and the event that triggered the action. You can customize
/// the <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
/// One column of the DynamoDB table receives all attribute-value pairs in the
/// payload that you specify.
///
/// You must use expressions for all parameters in <code>DynamoDBAction</code>.
/// The expressions accept literals, operators, functions, references, and
/// substitution templates.
/// <p class="title"> <b>Examples</b>
///
/// <ul>
/// <li>
/// For literal values, the expressions must contain single quotes. For example,
/// the value for the <code>hashKeyType</code> parameter can be
/// <code>'STRING'</code>.
/// </li>
/// <li>
/// For references, you must specify either variables or input values. For
/// example, the value for the <code>hashKeyField</code> parameter can be
/// <code>$input.GreenhouseInput.name</code>.
/// </li>
/// <li>
/// For a substitution template, you must use <code>${}</code>, and the template
/// must be in single quotes. A substitution template can also contain a
/// combination of literals, operators, functions, references, and substitution
/// templates.
///
/// In the following example, the value for the <code>hashKeyValue</code>
/// parameter uses a substitution template.
///
/// <code>'${$input.GreenhouseInput.temperature * 6 / 5 + 32} in
/// Fahrenheit'</code>
/// </li>
/// <li>
/// For a string concatenation, you must use <code>+</code>. A string
/// concatenation can also contain a combination of literals, operators,
/// functions, references, and substitution templates.
///
/// In the following example, the value for the <code>tableName</code> parameter
/// uses a string concatenation.
///
/// <code>'GreenhouseTemperatureTable ' + $input.GreenhouseInput.date</code>
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
///
/// If the defined payload type is a string, <code>DynamoDBAction</code> writes
/// non-JSON data to the DynamoDB table as binary data. The DynamoDB console
/// displays the data as Base64-encoded text. The value for the
/// <code>payloadField</code> parameter is
/// <code>&lt;payload-field&gt;_raw</code>.
class DynamoDBAction {
  /// The name of the hash key (also called the partition key). The
  /// <code>hashKeyField</code> value must match the partition key of the target
  /// DynamoDB table.
  final String hashKeyField;

  /// The value of the hash key (also called the partition key).
  final String hashKeyValue;

  /// The name of the DynamoDB table. The <code>tableName</code> value must match
  /// the table name of the target DynamoDB table.
  final String tableName;

  /// The data type for the hash key (also called the partition key). You can
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>'STRING'</code> - The hash key is a string.
  /// </li>
  /// <li>
  /// <code>'NUMBER'</code> - The hash key is a number.
  /// </li>
  /// </ul>
  /// If you don't specify <code>hashKeyType</code>, the default value is
  /// <code>'STRING'</code>.
  final String? hashKeyType;

  /// The type of operation to perform. You can specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>'INSERT'</code> - Insert data as a new item into the DynamoDB table.
  /// This item uses the specified hash key as a partition key. If you specified a
  /// range key, the item uses the range key as a sort key.
  /// </li>
  /// <li>
  /// <code>'UPDATE'</code> - Update an existing item of the DynamoDB table with
  /// new data. This item's partition key must match the specified hash key. If
  /// you specified a range key, the range key must match the item's sort key.
  /// </li>
  /// <li>
  /// <code>'DELETE'</code> - Delete an existing item of the DynamoDB table. This
  /// item's partition key must match the specified hash key. If you specified a
  /// range key, the range key must match the item's sort key.
  /// </li>
  /// </ul>
  /// If you don't specify this parameter, AWS IoT Events triggers the
  /// <code>'INSERT'</code> operation.
  final String? operation;
  final Payload? payload;

  /// The name of the DynamoDB column that receives the action payload.
  ///
  /// If you don't specify this parameter, the name of the DynamoDB column is
  /// <code>payload</code>.
  final String? payloadField;

  /// The name of the range key (also called the sort key). The
  /// <code>rangeKeyField</code> value must match the sort key of the target
  /// DynamoDB table.
  final String? rangeKeyField;

  /// The data type for the range key (also called the sort key), You can specify
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>'STRING'</code> - The range key is a string.
  /// </li>
  /// <li>
  /// <code>'NUMBER'</code> - The range key is number.
  /// </li>
  /// </ul>
  /// If you don't specify <code>rangeKeyField</code>, the default value is
  /// <code>'STRING'</code>.
  final String? rangeKeyType;

  /// The value of the range key (also called the sort key).
  final String? rangeKeyValue;

  DynamoDBAction({
    required this.hashKeyField,
    required this.hashKeyValue,
    required this.tableName,
    this.hashKeyType,
    this.operation,
    this.payload,
    this.payloadField,
    this.rangeKeyField,
    this.rangeKeyType,
    this.rangeKeyValue,
  });

  factory DynamoDBAction.fromJson(Map<String, dynamic> json) {
    return DynamoDBAction(
      hashKeyField: json['hashKeyField'] as String,
      hashKeyValue: json['hashKeyValue'] as String,
      tableName: json['tableName'] as String,
      hashKeyType: json['hashKeyType'] as String?,
      operation: json['operation'] as String?,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
      payloadField: json['payloadField'] as String?,
      rangeKeyField: json['rangeKeyField'] as String?,
      rangeKeyType: json['rangeKeyType'] as String?,
      rangeKeyValue: json['rangeKeyValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hashKeyField = this.hashKeyField;
    final hashKeyValue = this.hashKeyValue;
    final tableName = this.tableName;
    final hashKeyType = this.hashKeyType;
    final operation = this.operation;
    final payload = this.payload;
    final payloadField = this.payloadField;
    final rangeKeyField = this.rangeKeyField;
    final rangeKeyType = this.rangeKeyType;
    final rangeKeyValue = this.rangeKeyValue;
    return {
      'hashKeyField': hashKeyField,
      'hashKeyValue': hashKeyValue,
      'tableName': tableName,
      if (hashKeyType != null) 'hashKeyType': hashKeyType,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (payloadField != null) 'payloadField': payloadField,
      if (rangeKeyField != null) 'rangeKeyField': rangeKeyField,
      if (rangeKeyType != null) 'rangeKeyType': rangeKeyType,
      if (rangeKeyValue != null) 'rangeKeyValue': rangeKeyValue,
    };
  }
}

/// Defines an action to write to the Amazon DynamoDB table that you created.
/// The default action payload contains all the information about the detector
/// model instance and the event that triggered the action. You can customize
/// the <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
/// A separate column of the DynamoDB table receives one attribute-value pair in
/// the payload that you specify.
///
/// You must use expressions for all parameters in
/// <code>DynamoDBv2Action</code>. The expressions accept literals, operators,
/// functions, references, and substitution templates.
/// <p class="title"> <b>Examples</b>
///
/// <ul>
/// <li>
/// For literal values, the expressions must contain single quotes. For example,
/// the value for the <code>tableName</code> parameter can be
/// <code>'GreenhouseTemperatureTable'</code>.
/// </li>
/// <li>
/// For references, you must specify either variables or input values. For
/// example, the value for the <code>tableName</code> parameter can be
/// <code>$variable.ddbtableName</code>.
/// </li>
/// <li>
/// For a substitution template, you must use <code>${}</code>, and the template
/// must be in single quotes. A substitution template can also contain a
/// combination of literals, operators, functions, references, and substitution
/// templates.
///
/// In the following example, the value for the <code>contentExpression</code>
/// parameter in <code>Payload</code> uses a substitution template.
///
/// <code>'{\"sensorID\": \"${$input.GreenhouseInput.sensor_id}\",
/// \"temperature\": \"${$input.GreenhouseInput.temperature * 9 / 5 +
/// 32}\"}'</code>
/// </li>
/// <li>
/// For a string concatenation, you must use <code>+</code>. A string
/// concatenation can also contain a combination of literals, operators,
/// functions, references, and substitution templates.
///
/// In the following example, the value for the <code>tableName</code> parameter
/// uses a string concatenation.
///
/// <code>'GreenhouseTemperatureTable ' + $input.GreenhouseInput.date</code>
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
///
/// The value for the <code>type</code> parameter in <code>Payload</code> must
/// be <code>JSON</code>.
class DynamoDBv2Action {
  /// The name of the DynamoDB table.
  final String tableName;
  final Payload? payload;

  DynamoDBv2Action({
    required this.tableName,
    this.payload,
  });

  factory DynamoDBv2Action.fromJson(Map<String, dynamic> json) {
    return DynamoDBv2Action(
      tableName: json['tableName'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableName = this.tableName;
    final payload = this.payload;
    return {
      'tableName': tableName,
      if (payload != null) 'payload': payload,
    };
  }
}

/// Contains the configuration information of email notifications.
class EmailConfiguration {
  /// The email address that sends emails.
  /// <important>
  /// If you use the AWS IoT Events managed AWS Lambda function to manage your
  /// emails, you must <a
  /// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses.html">verify
  /// the email address that sends emails in Amazon SES</a>.
  /// </important>
  final String from;

  /// Contains the information of one or more recipients who receive the emails.
  /// <important>
  /// You must <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/addusers.html">add
  /// the users that receive emails to your AWS SSO store</a>.
  /// </important>
  final EmailRecipients recipients;

  /// Contains the subject and message of an email.
  final EmailContent? content;

  EmailConfiguration({
    required this.from,
    required this.recipients,
    this.content,
  });

  factory EmailConfiguration.fromJson(Map<String, dynamic> json) {
    return EmailConfiguration(
      from: json['from'] as String,
      recipients:
          EmailRecipients.fromJson(json['recipients'] as Map<String, dynamic>),
      content: json['content'] != null
          ? EmailContent.fromJson(json['content'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final recipients = this.recipients;
    final content = this.content;
    return {
      'from': from,
      'recipients': recipients,
      if (content != null) 'content': content,
    };
  }
}

/// Contains the subject and message of an email.
class EmailContent {
  /// The message that you want to send. The message can be up to 200 characters.
  final String? additionalMessage;

  /// The subject of the email.
  final String? subject;

  EmailContent({
    this.additionalMessage,
    this.subject,
  });

  factory EmailContent.fromJson(Map<String, dynamic> json) {
    return EmailContent(
      additionalMessage: json['additionalMessage'] as String?,
      subject: json['subject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalMessage = this.additionalMessage;
    final subject = this.subject;
    return {
      if (additionalMessage != null) 'additionalMessage': additionalMessage,
      if (subject != null) 'subject': subject,
    };
  }
}

/// Contains the information of one or more recipients who receive the emails.
/// <important>
/// You must <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/addusers.html">add
/// the users that receive emails to your AWS SSO store</a>.
/// </important>
class EmailRecipients {
  /// Specifies one or more recipients who receive the email.
  final List<RecipientDetail>? to;

  EmailRecipients({
    this.to,
  });

  factory EmailRecipients.fromJson(Map<String, dynamic> json) {
    return EmailRecipients(
      to: (json['to'] as List?)
          ?.whereNotNull()
          .map((e) => RecipientDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final to = this.to;
    return {
      if (to != null) 'to': to,
    };
  }
}

enum EvaluationMethod {
  batch,
  serial,
}

extension EvaluationMethodValueExtension on EvaluationMethod {
  String toValue() {
    switch (this) {
      case EvaluationMethod.batch:
        return 'BATCH';
      case EvaluationMethod.serial:
        return 'SERIAL';
    }
  }
}

extension EvaluationMethodFromString on String {
  EvaluationMethod toEvaluationMethod() {
    switch (this) {
      case 'BATCH':
        return EvaluationMethod.batch;
      case 'SERIAL':
        return EvaluationMethod.serial;
    }
    throw Exception('$this is not known in enum EvaluationMethod');
  }
}

/// Specifies the <code>actions</code> to be performed when the
/// <code>condition</code> evaluates to TRUE.
class Event {
  /// The name of the event.
  final String eventName;

  /// The actions to be performed.
  final List<Action>? actions;

  /// Optional. The Boolean expression that, when TRUE, causes the
  /// <code>actions</code> to be performed. If not present, the actions are
  /// performed (=TRUE). If the expression result is not a Boolean value, the
  /// actions are not performed (=FALSE).
  final String? condition;

  Event({
    required this.eventName,
    this.actions,
    this.condition,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['eventName'] as String,
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      condition: json['condition'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventName = this.eventName;
    final actions = this.actions;
    final condition = this.condition;
    return {
      'eventName': eventName,
      if (actions != null) 'actions': actions,
      if (condition != null) 'condition': condition,
    };
  }
}

/// Sends information about the detector model instance and the event that
/// triggered the action to an Amazon Kinesis Data Firehose delivery stream.
class FirehoseAction {
  /// The name of the Kinesis Data Firehose delivery stream where the data is
  /// written.
  final String deliveryStreamName;

  /// You can configure the action payload when you send a message to an Amazon
  /// Kinesis Data Firehose delivery stream.
  final Payload? payload;

  /// A character separator that is used to separate records written to the
  /// Kinesis Data Firehose delivery stream. Valid values are: '\n' (newline),
  /// '\t' (tab), '\r\n' (Windows newline), ',' (comma).
  final String? separator;

  FirehoseAction({
    required this.deliveryStreamName,
    this.payload,
    this.separator,
  });

  factory FirehoseAction.fromJson(Map<String, dynamic> json) {
    return FirehoseAction(
      deliveryStreamName: json['deliveryStreamName'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
      separator: json['separator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamName = this.deliveryStreamName;
    final payload = this.payload;
    final separator = this.separator;
    return {
      'deliveryStreamName': deliveryStreamName,
      if (payload != null) 'payload': payload,
      if (separator != null) 'separator': separator,
    };
  }
}

class GetDetectorModelAnalysisResultsResponse {
  /// Contains information about one or more analysis results.
  final List<AnalysisResult>? analysisResults;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  GetDetectorModelAnalysisResultsResponse({
    this.analysisResults,
    this.nextToken,
  });

  factory GetDetectorModelAnalysisResultsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDetectorModelAnalysisResultsResponse(
      analysisResults: (json['analysisResults'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisResults = this.analysisResults;
    final nextToken = this.nextToken;
    return {
      if (analysisResults != null) 'analysisResults': analysisResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Specifies the default alarm state. The configuration applies to all alarms
/// that were created based on this alarm model.
class InitializationConfiguration {
  /// The value must be <code>TRUE</code> or <code>FALSE</code>. If
  /// <code>FALSE</code>, all alarm instances created based on the alarm model are
  /// activated. The default value is <code>TRUE</code>.
  final bool disabledOnInitialization;

  InitializationConfiguration({
    required this.disabledOnInitialization,
  });

  factory InitializationConfiguration.fromJson(Map<String, dynamic> json) {
    return InitializationConfiguration(
      disabledOnInitialization: json['disabledOnInitialization'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final disabledOnInitialization = this.disabledOnInitialization;
    return {
      'disabledOnInitialization': disabledOnInitialization,
    };
  }
}

/// Information about the input.
class Input {
  /// Information about the configuration of an input.
  final InputConfiguration? inputConfiguration;

  /// The definition of the input.
  final InputDefinition? inputDefinition;

  Input({
    this.inputConfiguration,
    this.inputDefinition,
  });

  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      inputConfiguration: json['inputConfiguration'] != null
          ? InputConfiguration.fromJson(
              json['inputConfiguration'] as Map<String, dynamic>)
          : null,
      inputDefinition: json['inputDefinition'] != null
          ? InputDefinition.fromJson(
              json['inputDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputConfiguration = this.inputConfiguration;
    final inputDefinition = this.inputDefinition;
    return {
      if (inputConfiguration != null) 'inputConfiguration': inputConfiguration,
      if (inputDefinition != null) 'inputDefinition': inputDefinition,
    };
  }
}

/// Information about the configuration of an input.
class InputConfiguration {
  /// The time the input was created.
  final DateTime creationTime;

  /// The ARN of the input.
  final String inputArn;

  /// The name of the input.
  final String inputName;

  /// The last time the input was updated.
  final DateTime lastUpdateTime;

  /// The status of the input.
  final InputStatus status;

  /// A brief description of the input.
  final String? inputDescription;

  InputConfiguration({
    required this.creationTime,
    required this.inputArn,
    required this.inputName,
    required this.lastUpdateTime,
    required this.status,
    this.inputDescription,
  });

  factory InputConfiguration.fromJson(Map<String, dynamic> json) {
    return InputConfiguration(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      inputArn: json['inputArn'] as String,
      inputName: json['inputName'] as String,
      lastUpdateTime:
          nonNullableTimeStampFromJson(json['lastUpdateTime'] as Object),
      status: (json['status'] as String).toInputStatus(),
      inputDescription: json['inputDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final inputArn = this.inputArn;
    final inputName = this.inputName;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    final inputDescription = this.inputDescription;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'inputArn': inputArn,
      'inputName': inputName,
      'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      'status': status.toValue(),
      if (inputDescription != null) 'inputDescription': inputDescription,
    };
  }
}

/// The definition of the input.
class InputDefinition {
  /// The attributes from the JSON payload that are made available by the input.
  /// Inputs are derived from messages sent to the AWS IoT Events system using
  /// <code>BatchPutMessage</code>. Each such message contains a JSON payload, and
  /// those attributes (and their paired values) specified here are available for
  /// use in the <code>condition</code> expressions used by detectors that monitor
  /// this input.
  final List<Attribute> attributes;

  InputDefinition({
    required this.attributes,
  });

  factory InputDefinition.fromJson(Map<String, dynamic> json) {
    return InputDefinition(
      attributes: (json['attributes'] as List)
          .whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      'attributes': attributes,
    };
  }
}

/// The identifer of the input.
class InputIdentifier {
  /// The identifier of the input routed to AWS IoT Events.
  final IotEventsInputIdentifier? iotEventsInputIdentifier;

  /// The identifer of the input routed from AWS IoT SiteWise.
  final IotSiteWiseInputIdentifier? iotSiteWiseInputIdentifier;

  InputIdentifier({
    this.iotEventsInputIdentifier,
    this.iotSiteWiseInputIdentifier,
  });

  Map<String, dynamic> toJson() {
    final iotEventsInputIdentifier = this.iotEventsInputIdentifier;
    final iotSiteWiseInputIdentifier = this.iotSiteWiseInputIdentifier;
    return {
      if (iotEventsInputIdentifier != null)
        'iotEventsInputIdentifier': iotEventsInputIdentifier,
      if (iotSiteWiseInputIdentifier != null)
        'iotSiteWiseInputIdentifier': iotSiteWiseInputIdentifier,
    };
  }
}

enum InputStatus {
  creating,
  updating,
  active,
  deleting,
}

extension InputStatusValueExtension on InputStatus {
  String toValue() {
    switch (this) {
      case InputStatus.creating:
        return 'CREATING';
      case InputStatus.updating:
        return 'UPDATING';
      case InputStatus.active:
        return 'ACTIVE';
      case InputStatus.deleting:
        return 'DELETING';
    }
  }
}

extension InputStatusFromString on String {
  InputStatus toInputStatus() {
    switch (this) {
      case 'CREATING':
        return InputStatus.creating;
      case 'UPDATING':
        return InputStatus.updating;
      case 'ACTIVE':
        return InputStatus.active;
      case 'DELETING':
        return InputStatus.deleting;
    }
    throw Exception('$this is not known in enum InputStatus');
  }
}

/// Information about the input.
class InputSummary {
  /// The time the input was created.
  final DateTime? creationTime;

  /// The ARN of the input.
  final String? inputArn;

  /// A brief description of the input.
  final String? inputDescription;

  /// The name of the input.
  final String? inputName;

  /// The last time the input was updated.
  final DateTime? lastUpdateTime;

  /// The status of the input.
  final InputStatus? status;

  InputSummary({
    this.creationTime,
    this.inputArn,
    this.inputDescription,
    this.inputName,
    this.lastUpdateTime,
    this.status,
  });

  factory InputSummary.fromJson(Map<String, dynamic> json) {
    return InputSummary(
      creationTime: timeStampFromJson(json['creationTime']),
      inputArn: json['inputArn'] as String?,
      inputDescription: json['inputDescription'] as String?,
      inputName: json['inputName'] as String?,
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      status: (json['status'] as String?)?.toInputStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final inputArn = this.inputArn;
    final inputDescription = this.inputDescription;
    final inputName = this.inputName;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (inputArn != null) 'inputArn': inputArn,
      if (inputDescription != null) 'inputDescription': inputDescription,
      if (inputName != null) 'inputName': inputName,
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Sends an AWS IoT Events input, passing in information about the detector
/// model instance and the event that triggered the action.
class IotEventsAction {
  /// The name of the AWS IoT Events input where the data is sent.
  final String inputName;

  /// You can configure the action payload when you send a message to an AWS IoT
  /// Events input.
  final Payload? payload;

  IotEventsAction({
    required this.inputName,
    this.payload,
  });

  factory IotEventsAction.fromJson(Map<String, dynamic> json) {
    return IotEventsAction(
      inputName: json['inputName'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputName = this.inputName;
    final payload = this.payload;
    return {
      'inputName': inputName,
      if (payload != null) 'payload': payload,
    };
  }
}

/// The identifier of the input routed to AWS IoT Events.
class IotEventsInputIdentifier {
  /// The name of the input routed to AWS IoT Events.
  final String inputName;

  IotEventsInputIdentifier({
    required this.inputName,
  });

  Map<String, dynamic> toJson() {
    final inputName = this.inputName;
    return {
      'inputName': inputName,
    };
  }
}

/// Sends information about the detector model instance and the event that
/// triggered the action to a specified asset property in AWS IoT SiteWise.
///
/// You must use expressions for all parameters in
/// <code>IotSiteWiseAction</code>. The expressions accept literals, operators,
/// functions, references, and substitutions templates.
/// <p class="title"> <b>Examples</b>
///
/// <ul>
/// <li>
/// For literal values, the expressions must contain single quotes. For example,
/// the value for the <code>propertyAlias</code> parameter can be
/// <code>'/company/windfarm/3/turbine/7/temperature'</code>.
/// </li>
/// <li>
/// For references, you must specify either variables or input values. For
/// example, the value for the <code>assetId</code> parameter can be
/// <code>$input.TurbineInput.assetId1</code>.
/// </li>
/// <li>
/// For a substitution template, you must use <code>${}</code>, and the template
/// must be in single quotes. A substitution template can also contain a
/// combination of literals, operators, functions, references, and substitution
/// templates.
///
/// In the following example, the value for the <code>propertyAlias</code>
/// parameter uses a substitution template.
///
/// <code>'company/windfarm/${$input.TemperatureInput.sensorData.windfarmID}/turbine/
/// ${$input.TemperatureInput.sensorData.turbineID}/temperature'</code>
/// </li>
/// </ul>
/// You must specify either <code>propertyAlias</code> or both
/// <code>assetId</code> and <code>propertyId</code> to identify the target
/// asset property in AWS IoT SiteWise.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
class IotSiteWiseAction {
  /// The ID of the asset that has the specified property.
  final String? assetId;

  /// A unique identifier for this entry. You can use the entry ID to track which
  /// data entry causes an error in case of failure. The default is a new unique
  /// identifier.
  final String? entryId;

  /// The alias of the asset property.
  final String? propertyAlias;

  /// The ID of the asset property.
  final String? propertyId;

  /// The value to send to the asset property. This value contains timestamp,
  /// quality, and value (TQV) information.
  final AssetPropertyValue? propertyValue;

  IotSiteWiseAction({
    this.assetId,
    this.entryId,
    this.propertyAlias,
    this.propertyId,
    this.propertyValue,
  });

  factory IotSiteWiseAction.fromJson(Map<String, dynamic> json) {
    return IotSiteWiseAction(
      assetId: json['assetId'] as String?,
      entryId: json['entryId'] as String?,
      propertyAlias: json['propertyAlias'] as String?,
      propertyId: json['propertyId'] as String?,
      propertyValue: json['propertyValue'] != null
          ? AssetPropertyValue.fromJson(
              json['propertyValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final entryId = this.entryId;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    final propertyValue = this.propertyValue;
    return {
      if (assetId != null) 'assetId': assetId,
      if (entryId != null) 'entryId': entryId,
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
      if (propertyValue != null) 'propertyValue': propertyValue,
    };
  }
}

/// The asset model property identifer of the input routed from AWS IoT
/// SiteWise.
class IotSiteWiseAssetModelPropertyIdentifier {
  /// The ID of the AWS IoT SiteWise asset model.
  final String assetModelId;

  /// The ID of the AWS IoT SiteWise asset property.
  final String propertyId;

  IotSiteWiseAssetModelPropertyIdentifier({
    required this.assetModelId,
    required this.propertyId,
  });

  Map<String, dynamic> toJson() {
    final assetModelId = this.assetModelId;
    final propertyId = this.propertyId;
    return {
      'assetModelId': assetModelId,
      'propertyId': propertyId,
    };
  }
}

/// The identifer of the input routed from AWS IoT SiteWise.
class IotSiteWiseInputIdentifier {
  /// The identifier of the AWS IoT SiteWise asset model property.
  final IotSiteWiseAssetModelPropertyIdentifier?
      iotSiteWiseAssetModelPropertyIdentifier;

  IotSiteWiseInputIdentifier({
    this.iotSiteWiseAssetModelPropertyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final iotSiteWiseAssetModelPropertyIdentifier =
        this.iotSiteWiseAssetModelPropertyIdentifier;
    return {
      if (iotSiteWiseAssetModelPropertyIdentifier != null)
        'iotSiteWiseAssetModelPropertyIdentifier':
            iotSiteWiseAssetModelPropertyIdentifier,
    };
  }
}

/// Information required to publish the MQTT message through the AWS IoT message
/// broker.
class IotTopicPublishAction {
  /// The MQTT topic of the message. You can use a string expression that includes
  /// variables (<code>$variable.&lt;variable-name&gt;</code>) and input values
  /// (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>) as the topic
  /// string.
  final String mqttTopic;

  /// You can configure the action payload when you publish a message to an AWS
  /// IoT Core topic.
  final Payload? payload;

  IotTopicPublishAction({
    required this.mqttTopic,
    this.payload,
  });

  factory IotTopicPublishAction.fromJson(Map<String, dynamic> json) {
    return IotTopicPublishAction(
      mqttTopic: json['mqttTopic'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mqttTopic = this.mqttTopic;
    final payload = this.payload;
    return {
      'mqttTopic': mqttTopic,
      if (payload != null) 'payload': payload,
    };
  }
}

/// Calls a Lambda function, passing in information about the detector model
/// instance and the event that triggered the action.
class LambdaAction {
  /// The ARN of the Lambda function that is executed.
  final String functionArn;

  /// You can configure the action payload when you send a message to a Lambda
  /// function.
  final Payload? payload;

  LambdaAction({
    required this.functionArn,
    this.payload,
  });

  factory LambdaAction.fromJson(Map<String, dynamic> json) {
    return LambdaAction(
      functionArn: json['functionArn'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    final payload = this.payload;
    return {
      'functionArn': functionArn,
      if (payload != null) 'payload': payload,
    };
  }
}

class ListAlarmModelVersionsResponse {
  /// A list that summarizes each alarm model version.
  final List<AlarmModelVersionSummary>? alarmModelVersionSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  ListAlarmModelVersionsResponse({
    this.alarmModelVersionSummaries,
    this.nextToken,
  });

  factory ListAlarmModelVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAlarmModelVersionsResponse(
      alarmModelVersionSummaries: (json['alarmModelVersionSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AlarmModelVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelVersionSummaries = this.alarmModelVersionSummaries;
    final nextToken = this.nextToken;
    return {
      if (alarmModelVersionSummaries != null)
        'alarmModelVersionSummaries': alarmModelVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAlarmModelsResponse {
  /// A list that summarizes each alarm model.
  final List<AlarmModelSummary>? alarmModelSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  ListAlarmModelsResponse({
    this.alarmModelSummaries,
    this.nextToken,
  });

  factory ListAlarmModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListAlarmModelsResponse(
      alarmModelSummaries: (json['alarmModelSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AlarmModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelSummaries = this.alarmModelSummaries;
    final nextToken = this.nextToken;
    return {
      if (alarmModelSummaries != null)
        'alarmModelSummaries': alarmModelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDetectorModelVersionsResponse {
  /// Summary information about the detector model versions.
  final List<DetectorModelVersionSummary>? detectorModelVersionSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  ListDetectorModelVersionsResponse({
    this.detectorModelVersionSummaries,
    this.nextToken,
  });

  factory ListDetectorModelVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDetectorModelVersionsResponse(
      detectorModelVersionSummaries: (json['detectorModelVersionSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DetectorModelVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModelVersionSummaries = this.detectorModelVersionSummaries;
    final nextToken = this.nextToken;
    return {
      if (detectorModelVersionSummaries != null)
        'detectorModelVersionSummaries': detectorModelVersionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDetectorModelsResponse {
  /// Summary information about the detector models.
  final List<DetectorModelSummary>? detectorModelSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  ListDetectorModelsResponse({
    this.detectorModelSummaries,
    this.nextToken,
  });

  factory ListDetectorModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListDetectorModelsResponse(
      detectorModelSummaries: (json['detectorModelSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DetectorModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModelSummaries = this.detectorModelSummaries;
    final nextToken = this.nextToken;
    return {
      if (detectorModelSummaries != null)
        'detectorModelSummaries': detectorModelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListInputRoutingsResponse {
  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  /// Summary information about the routed resources.
  final List<RoutedResource>? routedResources;

  ListInputRoutingsResponse({
    this.nextToken,
    this.routedResources,
  });

  factory ListInputRoutingsResponse.fromJson(Map<String, dynamic> json) {
    return ListInputRoutingsResponse(
      nextToken: json['nextToken'] as String?,
      routedResources: (json['routedResources'] as List?)
          ?.whereNotNull()
          .map((e) => RoutedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final routedResources = this.routedResources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (routedResources != null) 'routedResources': routedResources,
    };
  }
}

class ListInputsResponse {
  /// Summary information about the inputs.
  final List<InputSummary>? inputSummaries;

  /// The token that you can use to return the next set of results, or
  /// <code>null</code> if there are no more results.
  final String? nextToken;

  ListInputsResponse({
    this.inputSummaries,
    this.nextToken,
  });

  factory ListInputsResponse.fromJson(Map<String, dynamic> json) {
    return ListInputsResponse(
      inputSummaries: (json['inputSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => InputSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSummaries = this.inputSummaries;
    final nextToken = this.nextToken;
    return {
      if (inputSummaries != null) 'inputSummaries': inputSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum LoggingLevel {
  error,
  info,
  debug,
}

extension LoggingLevelValueExtension on LoggingLevel {
  String toValue() {
    switch (this) {
      case LoggingLevel.error:
        return 'ERROR';
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
      case 'ERROR':
        return LoggingLevel.error;
      case 'INFO':
        return LoggingLevel.info;
      case 'DEBUG':
        return LoggingLevel.debug;
    }
    throw Exception('$this is not known in enum LoggingLevel');
  }
}

/// The values of the AWS IoT Events logging options.
class LoggingOptions {
  /// If TRUE, logging is enabled for AWS IoT Events.
  final bool enabled;

  /// The logging level.
  final LoggingLevel level;

  /// The ARN of the role that grants permission to AWS IoT Events to perform
  /// logging.
  final String roleArn;

  /// Information that identifies those detector models and their detectors
  /// (instances) for which the logging level is given.
  final List<DetectorDebugOption>? detectorDebugOptions;

  LoggingOptions({
    required this.enabled,
    required this.level,
    required this.roleArn,
    this.detectorDebugOptions,
  });

  factory LoggingOptions.fromJson(Map<String, dynamic> json) {
    return LoggingOptions(
      enabled: json['enabled'] as bool,
      level: (json['level'] as String).toLoggingLevel(),
      roleArn: json['roleArn'] as String,
      detectorDebugOptions: (json['detectorDebugOptions'] as List?)
          ?.whereNotNull()
          .map((e) => DetectorDebugOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final level = this.level;
    final roleArn = this.roleArn;
    final detectorDebugOptions = this.detectorDebugOptions;
    return {
      'enabled': enabled,
      'level': level.toValue(),
      'roleArn': roleArn,
      if (detectorDebugOptions != null)
        'detectorDebugOptions': detectorDebugOptions,
    };
  }
}

/// Contains the notification settings of an alarm model. The settings apply to
/// all alarms that were created based on this alarm model.
class NotificationAction {
  /// Specifies an AWS Lambda function to manage alarm notifications. You can
  /// create one or use the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/lambda-support.html">AWS
  /// Lambda function provided by AWS IoT Events</a>.
  final NotificationTargetActions action;

  /// Contains the configuration information of email notifications.
  final List<EmailConfiguration>? emailConfigurations;

  /// Contains the configuration information of SMS notifications.
  final List<SMSConfiguration>? smsConfigurations;

  NotificationAction({
    required this.action,
    this.emailConfigurations,
    this.smsConfigurations,
  });

  factory NotificationAction.fromJson(Map<String, dynamic> json) {
    return NotificationAction(
      action: NotificationTargetActions.fromJson(
          json['action'] as Map<String, dynamic>),
      emailConfigurations: (json['emailConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => EmailConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      smsConfigurations: (json['smsConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => SMSConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final emailConfigurations = this.emailConfigurations;
    final smsConfigurations = this.smsConfigurations;
    return {
      'action': action,
      if (emailConfigurations != null)
        'emailConfigurations': emailConfigurations,
      if (smsConfigurations != null) 'smsConfigurations': smsConfigurations,
    };
  }
}

/// Specifies an AWS Lambda function to manage alarm notifications. You can
/// create one or use the <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/lambda-support.html">AWS
/// Lambda function provided by AWS IoT Events</a>.
class NotificationTargetActions {
  final LambdaAction? lambdaAction;

  NotificationTargetActions({
    this.lambdaAction,
  });

  factory NotificationTargetActions.fromJson(Map<String, dynamic> json) {
    return NotificationTargetActions(
      lambdaAction: json['lambdaAction'] != null
          ? LambdaAction.fromJson(json['lambdaAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaAction = this.lambdaAction;
    return {
      if (lambdaAction != null) 'lambdaAction': lambdaAction,
    };
  }
}

/// When entering this state, perform these <code>actions</code> if the
/// <code>condition</code> is TRUE.
class OnEnterLifecycle {
  /// Specifies the actions that are performed when the state is entered and the
  /// <code>condition</code> is <code>TRUE</code>.
  final List<Event>? events;

  OnEnterLifecycle({
    this.events,
  });

  factory OnEnterLifecycle.fromJson(Map<String, dynamic> json) {
    return OnEnterLifecycle(
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    return {
      if (events != null) 'events': events,
    };
  }
}

/// When exiting this state, perform these <code>actions</code> if the specified
/// <code>condition</code> is <code>TRUE</code>.
class OnExitLifecycle {
  /// Specifies the <code>actions</code> that are performed when the state is
  /// exited and the <code>condition</code> is <code>TRUE</code>.
  final List<Event>? events;

  OnExitLifecycle({
    this.events,
  });

  factory OnExitLifecycle.fromJson(Map<String, dynamic> json) {
    return OnExitLifecycle(
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    return {
      if (events != null) 'events': events,
    };
  }
}

/// Specifies the actions performed when the <code>condition</code> evaluates to
/// TRUE.
class OnInputLifecycle {
  /// Specifies the actions performed when the <code>condition</code> evaluates to
  /// TRUE.
  final List<Event>? events;

  /// Specifies the actions performed, and the next state entered, when a
  /// <code>condition</code> evaluates to TRUE.
  final List<TransitionEvent>? transitionEvents;

  OnInputLifecycle({
    this.events,
    this.transitionEvents,
  });

  factory OnInputLifecycle.fromJson(Map<String, dynamic> json) {
    return OnInputLifecycle(
      events: (json['events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      transitionEvents: (json['transitionEvents'] as List?)
          ?.whereNotNull()
          .map((e) => TransitionEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final transitionEvents = this.transitionEvents;
    return {
      if (events != null) 'events': events,
      if (transitionEvents != null) 'transitionEvents': transitionEvents,
    };
  }
}

/// Information needed to configure the payload.
///
/// By default, AWS IoT Events generates a standard payload in JSON for any
/// action. This action payload contains all attribute-value pairs that have the
/// information about the detector model instance and the event triggered the
/// action. To configure the action payload, you can use
/// <code>contentExpression</code>.
class Payload {
  /// The content of the payload. You can use a string expression that includes
  /// quoted strings (<code>'&lt;string&gt;'</code>), variables
  /// (<code>$variable.&lt;variable-name&gt;</code>), input values
  /// (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>), string
  /// concatenations, and quoted strings that contain <code>${}</code> as the
  /// content. The recommended maximum size of a content expression is 1 KB.
  final String contentExpression;

  /// The value of the payload type can be either <code>STRING</code> or
  /// <code>JSON</code>.
  final PayloadType type;

  Payload({
    required this.contentExpression,
    required this.type,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      contentExpression: json['contentExpression'] as String,
      type: (json['type'] as String).toPayloadType(),
    );
  }

  Map<String, dynamic> toJson() {
    final contentExpression = this.contentExpression;
    final type = this.type;
    return {
      'contentExpression': contentExpression,
      'type': type.toValue(),
    };
  }
}

enum PayloadType {
  string,
  json,
}

extension PayloadTypeValueExtension on PayloadType {
  String toValue() {
    switch (this) {
      case PayloadType.string:
        return 'STRING';
      case PayloadType.json:
        return 'JSON';
    }
  }
}

extension PayloadTypeFromString on String {
  PayloadType toPayloadType() {
    switch (this) {
      case 'STRING':
        return PayloadType.string;
      case 'JSON':
        return PayloadType.json;
    }
    throw Exception('$this is not known in enum PayloadType');
  }
}

/// The information that identifies the recipient.
class RecipientDetail {
  /// The AWS Single Sign-On (AWS SSO) authentication information.
  final SSOIdentity? ssoIdentity;

  RecipientDetail({
    this.ssoIdentity,
  });

  factory RecipientDetail.fromJson(Map<String, dynamic> json) {
    return RecipientDetail(
      ssoIdentity: json['ssoIdentity'] != null
          ? SSOIdentity.fromJson(json['ssoIdentity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ssoIdentity = this.ssoIdentity;
    return {
      if (ssoIdentity != null) 'ssoIdentity': ssoIdentity,
    };
  }
}

/// Information required to reset the timer. The timer is reset to the
/// previously evaluated result of the duration. The duration expression isn't
/// reevaluated when you reset the timer.
class ResetTimerAction {
  /// The name of the timer to reset.
  final String timerName;

  ResetTimerAction({
    required this.timerName,
  });

  factory ResetTimerAction.fromJson(Map<String, dynamic> json) {
    return ResetTimerAction(
      timerName: json['timerName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final timerName = this.timerName;
    return {
      'timerName': timerName,
    };
  }
}

/// Contains information about the routed resource.
class RoutedResource {
  /// The ARN of the routed resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? arn;

  /// The name of the routed resource.
  final String? name;

  RoutedResource({
    this.arn,
    this.name,
  });

  factory RoutedResource.fromJson(Map<String, dynamic> json) {
    return RoutedResource(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

/// Contains the configuration information of SMS notifications.
class SMSConfiguration {
  /// Specifies one or more recipients who receive the message.
  /// <important>
  /// You must <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/addusers.html">add
  /// the users that receive SMS messages to your AWS SSO store</a>.
  /// </important>
  final List<RecipientDetail> recipients;

  /// The message that you want to send. The message can be up to 200 characters.
  final String? additionalMessage;

  /// The sender ID.
  final String? senderId;

  SMSConfiguration({
    required this.recipients,
    this.additionalMessage,
    this.senderId,
  });

  factory SMSConfiguration.fromJson(Map<String, dynamic> json) {
    return SMSConfiguration(
      recipients: (json['recipients'] as List)
          .whereNotNull()
          .map((e) => RecipientDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalMessage: json['additionalMessage'] as String?,
      senderId: json['senderId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recipients = this.recipients;
    final additionalMessage = this.additionalMessage;
    final senderId = this.senderId;
    return {
      'recipients': recipients,
      if (additionalMessage != null) 'additionalMessage': additionalMessage,
      if (senderId != null) 'senderId': senderId,
    };
  }
}

/// Information required to publish the Amazon SNS message.
class SNSTopicPublishAction {
  /// The ARN of the Amazon SNS target where the message is sent.
  final String targetArn;

  /// You can configure the action payload when you send a message as an Amazon
  /// SNS push notification.
  final Payload? payload;

  SNSTopicPublishAction({
    required this.targetArn,
    this.payload,
  });

  factory SNSTopicPublishAction.fromJson(Map<String, dynamic> json) {
    return SNSTopicPublishAction(
      targetArn: json['targetArn'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targetArn = this.targetArn;
    final payload = this.payload;
    return {
      'targetArn': targetArn,
      if (payload != null) 'payload': payload,
    };
  }
}

/// Contains information about your identity source in AWS Single Sign-On. For
/// more information, see the <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">AWS
/// Single Sign-On User Guide</a>.
class SSOIdentity {
  /// The ID of the AWS SSO identity store.
  final String identityStoreId;

  /// The user ID.
  final String? userId;

  SSOIdentity({
    required this.identityStoreId,
    this.userId,
  });

  factory SSOIdentity.fromJson(Map<String, dynamic> json) {
    return SSOIdentity(
      identityStoreId: json['identityStoreId'] as String,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityStoreId = this.identityStoreId;
    final userId = this.userId;
    return {
      'identityStoreId': identityStoreId,
      if (userId != null) 'userId': userId,
    };
  }
}

/// Information needed to set the timer.
class SetTimerAction {
  /// The name of the timer.
  final String timerName;

  /// The duration of the timer, in seconds. You can use a string expression that
  /// includes numbers, variables (<code>$variable.&lt;variable-name&gt;</code>),
  /// and input values
  /// (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>) as the
  /// duration. The range of the duration is 1-31622400 seconds. To ensure
  /// accuracy, the minimum duration is 60 seconds. The evaluated result of the
  /// duration is rounded down to the nearest whole number.
  final String? durationExpression;

  /// The number of seconds until the timer expires. The minimum value is 60
  /// seconds to ensure accuracy. The maximum value is 31622400 seconds.
  final int? seconds;

  SetTimerAction({
    required this.timerName,
    this.durationExpression,
    this.seconds,
  });

  factory SetTimerAction.fromJson(Map<String, dynamic> json) {
    return SetTimerAction(
      timerName: json['timerName'] as String,
      durationExpression: json['durationExpression'] as String?,
      seconds: json['seconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timerName = this.timerName;
    final durationExpression = this.durationExpression;
    final seconds = this.seconds;
    return {
      'timerName': timerName,
      if (durationExpression != null) 'durationExpression': durationExpression,
      if (seconds != null) 'seconds': seconds,
    };
  }
}

/// Information about the variable and its new value.
class SetVariableAction {
  /// The new value of the variable.
  final String value;

  /// The name of the variable.
  final String variableName;

  SetVariableAction({
    required this.value,
    required this.variableName,
  });

  factory SetVariableAction.fromJson(Map<String, dynamic> json) {
    return SetVariableAction(
      value: json['value'] as String,
      variableName: json['variableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final variableName = this.variableName;
    return {
      'value': value,
      'variableName': variableName,
    };
  }
}

/// A rule that compares an input property value to a threshold value with a
/// comparison operator.
class SimpleRule {
  /// The comparison operator.
  final ComparisonOperator comparisonOperator;

  /// The value on the left side of the comparison operator. You can specify an
  /// AWS IoT Events input attribute as an input property.
  final String inputProperty;

  /// The value on the right side of the comparison operator. You can enter a
  /// number or specify an AWS IoT Events input attribute.
  final String threshold;

  SimpleRule({
    required this.comparisonOperator,
    required this.inputProperty,
    required this.threshold,
  });

  factory SimpleRule.fromJson(Map<String, dynamic> json) {
    return SimpleRule(
      comparisonOperator:
          (json['comparisonOperator'] as String).toComparisonOperator(),
      inputProperty: json['inputProperty'] as String,
      threshold: json['threshold'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final inputProperty = this.inputProperty;
    final threshold = this.threshold;
    return {
      'comparisonOperator': comparisonOperator.toValue(),
      'inputProperty': inputProperty,
      'threshold': threshold,
    };
  }
}

/// Sends information about the detector model instance and the event that
/// triggered the action to an Amazon SQS queue.
class SqsAction {
  /// The URL of the SQS queue where the data is written.
  final String queueUrl;

  /// You can configure the action payload when you send a message to an Amazon
  /// SQS queue.
  final Payload? payload;

  /// Set this to TRUE if you want the data to be base-64 encoded before it is
  /// written to the queue. Otherwise, set this to FALSE.
  final bool? useBase64;

  SqsAction({
    required this.queueUrl,
    this.payload,
    this.useBase64,
  });

  factory SqsAction.fromJson(Map<String, dynamic> json) {
    return SqsAction(
      queueUrl: json['queueUrl'] as String,
      payload: json['payload'] != null
          ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
      useBase64: json['useBase64'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueUrl = this.queueUrl;
    final payload = this.payload;
    final useBase64 = this.useBase64;
    return {
      'queueUrl': queueUrl,
      if (payload != null) 'payload': payload,
      if (useBase64 != null) 'useBase64': useBase64,
    };
  }
}

class StartDetectorModelAnalysisResponse {
  /// The ID that you can use to retrieve the analysis result.
  final String? analysisId;

  StartDetectorModelAnalysisResponse({
    this.analysisId,
  });

  factory StartDetectorModelAnalysisResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDetectorModelAnalysisResponse(
      analysisId: json['analysisId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    return {
      if (analysisId != null) 'analysisId': analysisId,
    };
  }
}

/// Information that defines a state of a detector.
class State {
  /// The name of the state.
  final String stateName;

  /// When entering this state, perform these <code>actions</code> if the
  /// <code>condition</code> is TRUE.
  final OnEnterLifecycle? onEnter;

  /// When exiting this state, perform these <code>actions</code> if the specified
  /// <code>condition</code> is <code>TRUE</code>.
  final OnExitLifecycle? onExit;

  /// When an input is received and the <code>condition</code> is TRUE, perform
  /// the specified <code>actions</code>.
  final OnInputLifecycle? onInput;

  State({
    required this.stateName,
    this.onEnter,
    this.onExit,
    this.onInput,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      stateName: json['stateName'] as String,
      onEnter: json['onEnter'] != null
          ? OnEnterLifecycle.fromJson(json['onEnter'] as Map<String, dynamic>)
          : null,
      onExit: json['onExit'] != null
          ? OnExitLifecycle.fromJson(json['onExit'] as Map<String, dynamic>)
          : null,
      onInput: json['onInput'] != null
          ? OnInputLifecycle.fromJson(json['onInput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stateName = this.stateName;
    final onEnter = this.onEnter;
    final onExit = this.onExit;
    final onInput = this.onInput;
    return {
      'stateName': stateName,
      if (onEnter != null) 'onEnter': onEnter,
      if (onExit != null) 'onExit': onExit,
      if (onInput != null) 'onInput': onInput,
    };
  }
}

/// Metadata that can be used to manage the resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

/// Specifies the actions performed and the next state entered when a
/// <code>condition</code> evaluates to TRUE.
class TransitionEvent {
  /// Required. A Boolean expression that when TRUE causes the actions to be
  /// performed and the <code>nextState</code> to be entered.
  final String condition;

  /// The name of the transition event.
  final String eventName;

  /// The next state to enter.
  final String nextState;

  /// The actions to be performed.
  final List<Action>? actions;

  TransitionEvent({
    required this.condition,
    required this.eventName,
    required this.nextState,
    this.actions,
  });

  factory TransitionEvent.fromJson(Map<String, dynamic> json) {
    return TransitionEvent(
      condition: json['condition'] as String,
      eventName: json['eventName'] as String,
      nextState: json['nextState'] as String,
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final eventName = this.eventName;
    final nextState = this.nextState;
    final actions = this.actions;
    return {
      'condition': condition,
      'eventName': eventName,
      'nextState': nextState,
      if (actions != null) 'actions': actions,
    };
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

class UpdateAlarmModelResponse {
  /// The ARN of the alarm model. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? alarmModelArn;

  /// The version of the alarm model.
  final String? alarmModelVersion;

  /// The time the alarm model was created, in the Unix epoch format.
  final DateTime? creationTime;

  /// The time the alarm model was last updated, in the Unix epoch format.
  final DateTime? lastUpdateTime;

  /// The status of the alarm model. The status can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> - The alarm model is active and it's ready to evaluate
  /// data.
  /// </li>
  /// <li>
  /// <code>ACTIVATING</code> - AWS IoT Events is activating your alarm model.
  /// Activating an alarm model can take up to a few minutes.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code> - The alarm model is inactive, so it isn't ready to
  /// evaluate data. Check your alarm model information and update the alarm
  /// model.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - You couldn't create or update the alarm model. Check
  /// your alarm model information and try again.
  /// </li>
  /// </ul>
  final AlarmModelVersionStatus? status;

  UpdateAlarmModelResponse({
    this.alarmModelArn,
    this.alarmModelVersion,
    this.creationTime,
    this.lastUpdateTime,
    this.status,
  });

  factory UpdateAlarmModelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAlarmModelResponse(
      alarmModelArn: json['alarmModelArn'] as String?,
      alarmModelVersion: json['alarmModelVersion'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdateTime: timeStampFromJson(json['lastUpdateTime']),
      status: (json['status'] as String?)?.toAlarmModelVersionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmModelArn = this.alarmModelArn;
    final alarmModelVersion = this.alarmModelVersion;
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final status = this.status;
    return {
      if (alarmModelArn != null) 'alarmModelArn': alarmModelArn,
      if (alarmModelVersion != null) 'alarmModelVersion': alarmModelVersion,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdateTime != null)
        'lastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

class UpdateDetectorModelResponse {
  /// Information about how the detector model is configured.
  final DetectorModelConfiguration? detectorModelConfiguration;

  UpdateDetectorModelResponse({
    this.detectorModelConfiguration,
  });

  factory UpdateDetectorModelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDetectorModelResponse(
      detectorModelConfiguration: json['detectorModelConfiguration'] != null
          ? DetectorModelConfiguration.fromJson(
              json['detectorModelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorModelConfiguration = this.detectorModelConfiguration;
    return {
      if (detectorModelConfiguration != null)
        'detectorModelConfiguration': detectorModelConfiguration,
    };
  }
}

class UpdateInputResponse {
  /// Information about the configuration of the input.
  final InputConfiguration? inputConfiguration;

  UpdateInputResponse({
    this.inputConfiguration,
  });

  factory UpdateInputResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInputResponse(
      inputConfiguration: json['inputConfiguration'] != null
          ? InputConfiguration.fromJson(
              json['inputConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputConfiguration = this.inputConfiguration;
    return {
      if (inputConfiguration != null) 'inputConfiguration': inputConfiguration,
    };
  }
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
