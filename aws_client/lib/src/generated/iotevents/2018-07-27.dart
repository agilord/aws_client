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

part '2018-07-27.g.dart';

/// AWS IoT Events monitors your equipment or device fleets for failures or
/// changes in operation, and triggers actions when such events occur. You can
/// use AWS IoT Events API operations to create, read, update, and delete inputs
/// and detector models, and to list their versions.
class IoTEvents {
  final _s.RestJsonProtocol _protocol;
  IoTEvents({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotevents',
            signingName: 'iotevents',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required DetectorModelDefinition detectorModelDefinition,
    @_s.required String detectorModelName,
    @_s.required String roleArn,
    String detectorModelDescription,
    EvaluationMethod evaluationMethod,
    String key,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        detectorModelDefinition, 'detectorModelDefinition');
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'detectorModelDescription',
      detectorModelDescription,
      0,
      128,
    );
    _s.validateStringLength(
      'key',
      key,
      1,
      128,
    );
    _s.validateStringPattern(
      'key',
      key,
      r'''^((`[\w\- ]+`)|([\w\-]+))(\.((`[\w- ]+`)|([\w\-]+)))*$''',
    );
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
    @_s.required InputDefinition inputDefinition,
    @_s.required String inputName,
    String inputDescription,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(inputDefinition, 'inputDefinition');
    ArgumentError.checkNotNull(inputName, 'inputName');
    _s.validateStringLength(
      'inputName',
      inputName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputName',
      inputName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'inputDescription',
      inputDescription,
      0,
      128,
    );
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
    @_s.required String detectorModelName,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/detector-models/${Uri.encodeComponent(detectorModelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDetectorModelResponse.fromJson(response);
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
    @_s.required String inputName,
  }) async {
    ArgumentError.checkNotNull(inputName, 'inputName');
    _s.validateStringLength(
      'inputName',
      inputName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputName',
      inputName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/inputs/${Uri.encodeComponent(inputName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInputResponse.fromJson(response);
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
    @_s.required String detectorModelName,
    String detectorModelVersion,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'detectorModelVersion',
      detectorModelVersion,
      1,
      128,
    );
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
    @_s.required String inputName,
  }) async {
    ArgumentError.checkNotNull(inputName, 'inputName');
    _s.validateStringLength(
      'inputName',
      inputName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputName',
      inputName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*$''',
      isRequired: true,
    );
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
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDetectorModelVersionsResponse> listDetectorModelVersions({
    @_s.required String detectorModelName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
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
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDetectorModelsResponse> listDetectorModels({
    int maxResults,
    String nextToken,
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

  /// Lists the inputs you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListInputsResponse> listInputs({
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    @_s.required LoggingOptions loggingOptions,
  }) async {
    ArgumentError.checkNotNull(loggingOptions, 'loggingOptions');
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required DetectorModelDefinition detectorModelDefinition,
    @_s.required String detectorModelName,
    @_s.required String roleArn,
    String detectorModelDescription,
    EvaluationMethod evaluationMethod,
  }) async {
    ArgumentError.checkNotNull(
        detectorModelDefinition, 'detectorModelDefinition');
    ArgumentError.checkNotNull(detectorModelName, 'detectorModelName');
    _s.validateStringLength(
      'detectorModelName',
      detectorModelName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'detectorModelName',
      detectorModelName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'detectorModelDescription',
      detectorModelDescription,
      0,
      128,
    );
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
    @_s.required InputDefinition inputDefinition,
    @_s.required String inputName,
    String inputDescription,
  }) async {
    ArgumentError.checkNotNull(inputDefinition, 'inputDefinition');
    ArgumentError.checkNotNull(inputName, 'inputName');
    _s.validateStringLength(
      'inputName',
      inputName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputName',
      inputName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'inputDescription',
      inputDescription,
      0,
      128,
    );
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

/// An action to be performed when the <code>condition</code> is TRUE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Action {
  /// Information needed to clear the timer.
  @_s.JsonKey(name: 'clearTimer')
  final ClearTimerAction clearTimer;

  /// Writes to the DynamoDB table that you created. The default action payload
  /// contains all attribute-value pairs that have the information about the
  /// detector model instance and the event that triggered the action. You can
  /// also customize the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
  /// One column of the DynamoDB table receives all attribute-value pairs in the
  /// payload that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-event-actions.html">Actions</a>
  /// in <i>AWS IoT Events Developer Guide</i>.
  @_s.JsonKey(name: 'dynamoDB')
  final DynamoDBAction dynamoDB;

  /// Writes to the DynamoDB table that you created. The default action payload
  /// contains all attribute-value pairs that have the information about the
  /// detector model instance and the event that triggered the action. You can
  /// also customize the <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
  /// A separate column of the DynamoDB table receives one attribute-value pair in
  /// the payload that you specify. For more information, see <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-event-actions.html">Actions</a>
  /// in <i>AWS IoT Events Developer Guide</i>.
  @_s.JsonKey(name: 'dynamoDBv2')
  final DynamoDBv2Action dynamoDBv2;

  /// Sends information about the detector model instance and the event that
  /// triggered the action to an Amazon Kinesis Data Firehose delivery stream.
  @_s.JsonKey(name: 'firehose')
  final FirehoseAction firehose;

  /// Sends AWS IoT Events input, which passes information about the detector
  /// model instance and the event that triggered the action.
  @_s.JsonKey(name: 'iotEvents')
  final IotEventsAction iotEvents;

  /// Sends information about the detector model instance and the event that
  /// triggered the action to an asset property in AWS IoT SiteWise .
  @_s.JsonKey(name: 'iotSiteWise')
  final IotSiteWiseAction iotSiteWise;

  /// Publishes an MQTT message with the given topic to the AWS IoT message
  /// broker.
  @_s.JsonKey(name: 'iotTopicPublish')
  final IotTopicPublishAction iotTopicPublish;

  /// Calls a Lambda function, passing in information about the detector model
  /// instance and the event that triggered the action.
  @_s.JsonKey(name: 'lambda')
  final LambdaAction lambda;

  /// Information needed to reset the timer.
  @_s.JsonKey(name: 'resetTimer')
  final ResetTimerAction resetTimer;

  /// Information needed to set the timer.
  @_s.JsonKey(name: 'setTimer')
  final SetTimerAction setTimer;

  /// Sets a variable to a specified value.
  @_s.JsonKey(name: 'setVariable')
  final SetVariableAction setVariable;

  /// Sends an Amazon SNS message.
  @_s.JsonKey(name: 'sns')
  final SNSTopicPublishAction sns;

  /// Sends information about the detector model instance and the event that
  /// triggered the action to an Amazon SQS queue.
  @_s.JsonKey(name: 'sqs')
  final SqsAction sqs;

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
  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}

/// A structure that contains timestamp information. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_TimeInNanos.html">TimeInNanos</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
///
/// For parameters that are string data type, you can specify the following
/// options:
///
/// <ul>
/// <li>
/// Use a string. For example, the <code>timeInSeconds</code> value can be
/// <code>'1586400675'</code>.
/// </li>
/// <li>
/// Use an expression. For example, the <code>timeInSeconds</code> value can be
/// <code>'${$input.TemperatureInput.sensorData.timestamp/1000}'</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyTimestamp {
  /// The timestamp, in seconds, in the Unix epoch format. The valid range is
  /// between 1-31556889864403199. You can also specify an expression.
  @_s.JsonKey(name: 'timeInSeconds')
  final String timeInSeconds;

  /// The nanosecond offset converted from <code>timeInSeconds</code>. The valid
  /// range is between 0-999999999. You can also specify an expression.
  @_s.JsonKey(name: 'offsetInNanos')
  final String offsetInNanos;

  AssetPropertyTimestamp({
    @_s.required this.timeInSeconds,
    this.offsetInNanos,
  });
  factory AssetPropertyTimestamp.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyTimestampFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyTimestampToJson(this);
}

/// A structure that contains value information. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_AssetPropertyValue.html">AssetPropertyValue</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
///
/// For parameters that are string data type, you can specify the following
/// options:
///
/// <ul>
/// <li>
/// Use a string. For example, the <code>quality</code> value can be
/// <code>'GOOD'</code>.
/// </li>
/// <li>
/// Use an expression. For example, the <code>quality</code> value can be
/// <code>$input.TemperatureInput.sensorData.quality</code> .
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyValue {
  /// The value to send to an asset property.
  @_s.JsonKey(name: 'value')
  final AssetPropertyVariant value;

  /// The quality of the asset property value. The value must be
  /// <code>GOOD</code>, <code>BAD</code>, or <code>UNCERTAIN</code>. You can also
  /// specify an expression.
  @_s.JsonKey(name: 'quality')
  final String quality;

  /// The timestamp associated with the asset property value. The default is the
  /// current event time.
  @_s.JsonKey(name: 'timestamp')
  final AssetPropertyTimestamp timestamp;

  AssetPropertyValue({
    @_s.required this.value,
    this.quality,
    this.timestamp,
  });
  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyValueFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyValueToJson(this);
}

/// A structure that contains an asset property value. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_Variant.html">Variant</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
/// <important>
/// You must specify one of the following value types, depending on the
/// <code>dataType</code> of the specified asset property. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_AssetProperty.html">AssetProperty</a>
/// in the <i>AWS IoT SiteWise API Reference</i>.
/// </important>
/// For parameters that are string data type, you can specify the following
/// options:
///
/// <ul>
/// <li>
/// Use a string. For example, the <code>doubleValue</code> value can be
/// <code>'47.9'</code>.
/// </li>
/// <li>
/// Use an expression. For example, the <code>doubleValue</code> value can be
/// <code>$input.TemperatureInput.sensorData.temperature</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyVariant {
  /// The asset property value is a Boolean value that must be <code>TRUE</code>
  /// or <code>FALSE</code>. You can also specify an expression. If you use an
  /// expression, the evaluated result should be a Boolean value.
  @_s.JsonKey(name: 'booleanValue')
  final String booleanValue;

  /// The asset property value is a double. You can also specify an expression. If
  /// you use an expression, the evaluated result should be a double.
  @_s.JsonKey(name: 'doubleValue')
  final String doubleValue;

  /// The asset property value is an integer. You can also specify an expression.
  /// If you use an expression, the evaluated result should be an integer.
  @_s.JsonKey(name: 'integerValue')
  final String integerValue;

  /// The asset property value is a string. You can also specify an expression. If
  /// you use an expression, the evaluated result should be a string.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  AssetPropertyVariant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });
  factory AssetPropertyVariant.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyVariantFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyVariantToJson(this);
}

/// The attributes from the JSON payload that are made available by the input.
/// Inputs are derived from messages sent to the AWS IoT Events system using
/// <code>BatchPutMessage</code>. Each such message contains a JSON payload.
/// Those attributes (and their paired values) specified here are available for
/// use in the <code>condition</code> expressions used by detectors.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Attribute {
  /// An expression that specifies an attribute-value pair in a JSON structure.
  /// Use this to specify an attribute from the JSON payload that is made
  /// available by the input. Inputs are derived from messages sent to AWS IoT
  /// Events (<code>BatchPutMessage</code>). Each such message contains a JSON
  /// payload. The attribute (and its paired value) specified here are available
  /// for use in the <code>condition</code> expressions used by detectors.
  ///
  /// Syntax: <code>&lt;field-name&gt;.&lt;field-name&gt;...</code>
  @_s.JsonKey(name: 'jsonPath')
  final String jsonPath;

  Attribute({
    @_s.required this.jsonPath,
  });
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

/// Information needed to clear the timer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClearTimerAction {
  /// The name of the timer to clear.
  @_s.JsonKey(name: 'timerName')
  final String timerName;

  ClearTimerAction({
    @_s.required this.timerName,
  });
  factory ClearTimerAction.fromJson(Map<String, dynamic> json) =>
      _$ClearTimerActionFromJson(json);

  Map<String, dynamic> toJson() => _$ClearTimerActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDetectorModelResponse {
  /// Information about how the detector model is configured.
  @_s.JsonKey(name: 'detectorModelConfiguration')
  final DetectorModelConfiguration detectorModelConfiguration;

  CreateDetectorModelResponse({
    this.detectorModelConfiguration,
  });
  factory CreateDetectorModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDetectorModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInputResponse {
  /// Information about the configuration of the input.
  @_s.JsonKey(name: 'inputConfiguration')
  final InputConfiguration inputConfiguration;

  CreateInputResponse({
    this.inputConfiguration,
  });
  factory CreateInputResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDetectorModelResponse {
  DeleteDetectorModelResponse();
  factory DeleteDetectorModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDetectorModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInputResponse {
  DeleteInputResponse();
  factory DeleteInputResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDetectorModelResponse {
  /// Information about the detector model.
  @_s.JsonKey(name: 'detectorModel')
  final DetectorModel detectorModel;

  DescribeDetectorModelResponse({
    this.detectorModel,
  });
  factory DescribeDetectorModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDetectorModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInputResponse {
  /// Information about the input.
  @_s.JsonKey(name: 'input')
  final Input input;

  DescribeInputResponse({
    this.input,
  });
  factory DescribeInputResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeInputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLoggingOptionsResponse {
  /// The current settings of the AWS IoT Events logging options.
  @_s.JsonKey(name: 'loggingOptions')
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    this.loggingOptions,
  });
  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLoggingOptionsResponseFromJson(json);
}

/// The detector model and the specific detectors (instances) for which the
/// logging level is given.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DetectorDebugOption {
  /// The name of the detector model.
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  /// The value of the input attribute key used to create the detector (the
  /// instance of the detector model).
  @_s.JsonKey(name: 'keyValue')
  final String keyValue;

  DetectorDebugOption({
    @_s.required this.detectorModelName,
    this.keyValue,
  });
  factory DetectorDebugOption.fromJson(Map<String, dynamic> json) =>
      _$DetectorDebugOptionFromJson(json);

  Map<String, dynamic> toJson() => _$DetectorDebugOptionToJson(this);
}

/// Information about the detector model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorModel {
  /// Information about how the detector is configured.
  @_s.JsonKey(name: 'detectorModelConfiguration')
  final DetectorModelConfiguration detectorModelConfiguration;

  /// Information that defines how a detector operates.
  @_s.JsonKey(name: 'detectorModelDefinition')
  final DetectorModelDefinition detectorModelDefinition;

  DetectorModel({
    this.detectorModelConfiguration,
    this.detectorModelDefinition,
  });
  factory DetectorModel.fromJson(Map<String, dynamic> json) =>
      _$DetectorModelFromJson(json);
}

/// Information about how the detector model is configured.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorModelConfiguration {
  /// The time the detector model was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The ARN of the detector model.
  @_s.JsonKey(name: 'detectorModelArn')
  final String detectorModelArn;

  /// A brief description of the detector model.
  @_s.JsonKey(name: 'detectorModelDescription')
  final String detectorModelDescription;

  /// The name of the detector model.
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  /// The version of the detector model.
  @_s.JsonKey(name: 'detectorModelVersion')
  final String detectorModelVersion;

  /// Information about the order in which events are evaluated and how actions
  /// are executed.
  @_s.JsonKey(name: 'evaluationMethod')
  final EvaluationMethod evaluationMethod;

  /// The value used to identify a detector instance. When a device or system
  /// sends input, a new detector instance with a unique key value is created. AWS
  /// IoT Events can continue to route input to its corresponding detector
  /// instance based on this identifying information.
  ///
  /// This parameter uses a JSON-path expression to select the attribute-value
  /// pair in the message payload that is used for identification. To route the
  /// message to the correct detector instance, the device must send a message
  /// payload that contains the same attribute-value.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The time the detector model was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The ARN of the role that grants permission to AWS IoT Events to perform its
  /// operations.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The status of the detector model.
  @_s.JsonKey(name: 'status')
  final DetectorModelVersionStatus status;

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
  factory DetectorModelConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DetectorModelConfigurationFromJson(json);
}

/// Information that defines how a detector operates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DetectorModelDefinition {
  /// The state that is entered at the creation of each detector (instance).
  @_s.JsonKey(name: 'initialStateName')
  final String initialStateName;

  /// Information about the states of the detector.
  @_s.JsonKey(name: 'states')
  final List<State> states;

  DetectorModelDefinition({
    @_s.required this.initialStateName,
    @_s.required this.states,
  });
  factory DetectorModelDefinition.fromJson(Map<String, dynamic> json) =>
      _$DetectorModelDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DetectorModelDefinitionToJson(this);
}

/// Information about the detector model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorModelSummary {
  /// The time the detector model was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// A brief description of the detector model.
  @_s.JsonKey(name: 'detectorModelDescription')
  final String detectorModelDescription;

  /// The name of the detector model.
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  DetectorModelSummary({
    this.creationTime,
    this.detectorModelDescription,
    this.detectorModelName,
  });
  factory DetectorModelSummary.fromJson(Map<String, dynamic> json) =>
      _$DetectorModelSummaryFromJson(json);
}

enum DetectorModelVersionStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DEPRECATED')
  deprecated,
  @_s.JsonValue('DRAFT')
  draft,
  @_s.JsonValue('PAUSED')
  paused,
  @_s.JsonValue('FAILED')
  failed,
}

/// Information about the detector model version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectorModelVersionSummary {
  /// The time the detector model version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The ARN of the detector model version.
  @_s.JsonKey(name: 'detectorModelArn')
  final String detectorModelArn;

  /// The name of the detector model.
  @_s.JsonKey(name: 'detectorModelName')
  final String detectorModelName;

  /// The ID of the detector model version.
  @_s.JsonKey(name: 'detectorModelVersion')
  final String detectorModelVersion;

  /// Information about the order in which events are evaluated and how actions
  /// are executed.
  @_s.JsonKey(name: 'evaluationMethod')
  final EvaluationMethod evaluationMethod;

  /// The last time the detector model version was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The ARN of the role that grants the detector model permission to perform its
  /// tasks.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The status of the detector model version.
  @_s.JsonKey(name: 'status')
  final DetectorModelVersionStatus status;

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
  factory DetectorModelVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$DetectorModelVersionSummaryFromJson(json);
}

/// Defines an action to write to the Amazon DynamoDB table that you created.
/// The standard action payload contains all attribute-value pairs that have the
/// information about the detector model instance and the event that triggered
/// the action. You can also customize the <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
/// One column of the DynamoDB table receives all attribute-value pairs in the
/// payload that you specify.
///
/// The <code>tableName</code> and <code>hashKeyField</code> values must match
/// the table name and the partition key of the DynamoDB table.
/// <note>
/// If the DynamoDB table also has a sort key, you must specify
/// <code>rangeKeyField</code>. The <code>rangeKeyField</code> value must match
/// the sort key.
/// </note> <p/>
/// The <code>hashKeyValue</code> and <code>rangeKeyValue</code> use
/// substitution templates. These templates provide data at runtime. The syntax
/// is <code>${sql-expression}</code>.
///
/// You can use expressions for parameters that are string data type. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
/// <note>
/// If the defined payload type is a string, <code>DynamoDBAction</code> writes
/// non-JSON data to the DynamoDB table as binary data. The DynamoDB console
/// displays the data as Base64-encoded text. The <code>payloadField</code> is
/// <code>&lt;payload-field&gt;_raw</code>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamoDBAction {
  /// The name of the hash key (also called the partition key).
  @_s.JsonKey(name: 'hashKeyField')
  final String hashKeyField;

  /// The value of the hash key (also called the partition key).
  @_s.JsonKey(name: 'hashKeyValue')
  final String hashKeyValue;

  /// The name of the DynamoDB table.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  /// The data type for the hash key (also called the partition key). You can
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>STRING</code> - The hash key is a string.
  /// </li>
  /// <li>
  /// <code>NUMBER</code> - The hash key is a number.
  /// </li>
  /// </ul>
  /// If you don't specify <code>hashKeyType</code>, the default value is
  /// <code>STRING</code>.
  @_s.JsonKey(name: 'hashKeyType')
  final String hashKeyType;

  /// The type of operation to perform. You can specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>INSERT</code> - Insert data as a new item into the DynamoDB table.
  /// This item uses the specified hash key as a partition key. If you specified a
  /// range key, the item uses the range key as a sort key.
  /// </li>
  /// <li>
  /// <code>UPDATE</code> - Update an existing item of the DynamoDB table with new
  /// data. This item's partition key must match the specified hash key. If you
  /// specified a range key, the range key must match the item's sort key.
  /// </li>
  /// <li>
  /// <code>DELETE</code> - Delete an existing item of the DynamoDB table. This
  /// item's partition key must match the specified hash key. If you specified a
  /// range key, the range key must match the item's sort key.
  /// </li>
  /// </ul>
  /// If you don't specify this parameter, AWS IoT Events triggers the
  /// <code>INSERT</code> operation.
  @_s.JsonKey(name: 'operation')
  final String operation;
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  /// The name of the DynamoDB column that receives the action payload.
  ///
  /// If you don't specify this parameter, the name of the DynamoDB column is
  /// <code>payload</code>.
  @_s.JsonKey(name: 'payloadField')
  final String payloadField;

  /// The name of the range key (also called the sort key).
  @_s.JsonKey(name: 'rangeKeyField')
  final String rangeKeyField;

  /// The data type for the range key (also called the sort key), You can specify
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>STRING</code> - The range key is a string.
  /// </li>
  /// <li>
  /// <code>NUMBER</code> - The range key is number.
  /// </li>
  /// </ul>
  /// If you don't specify <code>rangeKeyField</code>, the default value is
  /// <code>STRING</code>.
  @_s.JsonKey(name: 'rangeKeyType')
  final String rangeKeyType;

  /// The value of the range key (also called the sort key).
  @_s.JsonKey(name: 'rangeKeyValue')
  final String rangeKeyValue;

  DynamoDBAction({
    @_s.required this.hashKeyField,
    @_s.required this.hashKeyValue,
    @_s.required this.tableName,
    this.hashKeyType,
    this.operation,
    this.payload,
    this.payloadField,
    this.rangeKeyField,
    this.rangeKeyType,
    this.rangeKeyValue,
  });
  factory DynamoDBAction.fromJson(Map<String, dynamic> json) =>
      _$DynamoDBActionFromJson(json);

  Map<String, dynamic> toJson() => _$DynamoDBActionToJson(this);
}

/// Defines an action to write to the Amazon DynamoDB table that you created.
/// The default action payload contains all attribute-value pairs that have the
/// information about the detector model instance and the event that triggered
/// the action. You can also customize the <a
/// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_Payload.html">payload</a>.
/// A separate column of the DynamoDB table receives one attribute-value pair in
/// the payload that you specify.
/// <important>
/// The <code>type</code> value for <code>Payload</code> must be
/// <code>JSON</code>.
/// </important>
/// You can use expressions for parameters that are strings. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamoDBv2Action {
  /// The name of the DynamoDB table.
  @_s.JsonKey(name: 'tableName')
  final String tableName;
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  DynamoDBv2Action({
    @_s.required this.tableName,
    this.payload,
  });
  factory DynamoDBv2Action.fromJson(Map<String, dynamic> json) =>
      _$DynamoDBv2ActionFromJson(json);

  Map<String, dynamic> toJson() => _$DynamoDBv2ActionToJson(this);
}

enum EvaluationMethod {
  @_s.JsonValue('BATCH')
  batch,
  @_s.JsonValue('SERIAL')
  serial,
}

extension on EvaluationMethod {
  String toValue() {
    switch (this) {
      case EvaluationMethod.batch:
        return 'BATCH';
      case EvaluationMethod.serial:
        return 'SERIAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the <code>actions</code> to be performed when the
/// <code>condition</code> evaluates to TRUE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Event {
  /// The name of the event.
  @_s.JsonKey(name: 'eventName')
  final String eventName;

  /// The actions to be performed.
  @_s.JsonKey(name: 'actions')
  final List<Action> actions;

  /// Optional. The Boolean expression that, when TRUE, causes the
  /// <code>actions</code> to be performed. If not present, the actions are
  /// performed (=TRUE). If the expression result is not a Boolean value, the
  /// actions are not performed (=FALSE).
  @_s.JsonKey(name: 'condition')
  final String condition;

  Event({
    @_s.required this.eventName,
    this.actions,
    this.condition,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

/// Sends information about the detector model instance and the event that
/// triggered the action to an Amazon Kinesis Data Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FirehoseAction {
  /// The name of the Kinesis Data Firehose delivery stream where the data is
  /// written.
  @_s.JsonKey(name: 'deliveryStreamName')
  final String deliveryStreamName;

  /// You can configure the action payload when you send a message to an Amazon
  /// Kinesis Data Firehose delivery stream.
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  /// A character separator that is used to separate records written to the
  /// Kinesis Data Firehose delivery stream. Valid values are: '\n' (newline),
  /// '\t' (tab), '\r\n' (Windows newline), ',' (comma).
  @_s.JsonKey(name: 'separator')
  final String separator;

  FirehoseAction({
    @_s.required this.deliveryStreamName,
    this.payload,
    this.separator,
  });
  factory FirehoseAction.fromJson(Map<String, dynamic> json) =>
      _$FirehoseActionFromJson(json);

  Map<String, dynamic> toJson() => _$FirehoseActionToJson(this);
}

/// Information about the input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Input {
  /// Information about the configuration of an input.
  @_s.JsonKey(name: 'inputConfiguration')
  final InputConfiguration inputConfiguration;

  /// The definition of the input.
  @_s.JsonKey(name: 'inputDefinition')
  final InputDefinition inputDefinition;

  Input({
    this.inputConfiguration,
    this.inputDefinition,
  });
  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);
}

/// Information about the configuration of an input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputConfiguration {
  /// The time the input was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The ARN of the input.
  @_s.JsonKey(name: 'inputArn')
  final String inputArn;

  /// The name of the input.
  @_s.JsonKey(name: 'inputName')
  final String inputName;

  /// The last time the input was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The status of the input.
  @_s.JsonKey(name: 'status')
  final InputStatus status;

  /// A brief description of the input.
  @_s.JsonKey(name: 'inputDescription')
  final String inputDescription;

  InputConfiguration({
    @_s.required this.creationTime,
    @_s.required this.inputArn,
    @_s.required this.inputName,
    @_s.required this.lastUpdateTime,
    @_s.required this.status,
    this.inputDescription,
  });
  factory InputConfiguration.fromJson(Map<String, dynamic> json) =>
      _$InputConfigurationFromJson(json);
}

/// The definition of the input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDefinition {
  /// The attributes from the JSON payload that are made available by the input.
  /// Inputs are derived from messages sent to the AWS IoT Events system using
  /// <code>BatchPutMessage</code>. Each such message contains a JSON payload, and
  /// those attributes (and their paired values) specified here are available for
  /// use in the <code>condition</code> expressions used by detectors that monitor
  /// this input.
  @_s.JsonKey(name: 'attributes')
  final List<Attribute> attributes;

  InputDefinition({
    @_s.required this.attributes,
  });
  factory InputDefinition.fromJson(Map<String, dynamic> json) =>
      _$InputDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$InputDefinitionToJson(this);
}

enum InputStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
}

/// Information about the input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputSummary {
  /// The time the input was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The ARN of the input.
  @_s.JsonKey(name: 'inputArn')
  final String inputArn;

  /// A brief description of the input.
  @_s.JsonKey(name: 'inputDescription')
  final String inputDescription;

  /// The name of the input.
  @_s.JsonKey(name: 'inputName')
  final String inputName;

  /// The last time the input was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdateTime')
  final DateTime lastUpdateTime;

  /// The status of the input.
  @_s.JsonKey(name: 'status')
  final InputStatus status;

  InputSummary({
    this.creationTime,
    this.inputArn,
    this.inputDescription,
    this.inputName,
    this.lastUpdateTime,
    this.status,
  });
  factory InputSummary.fromJson(Map<String, dynamic> json) =>
      _$InputSummaryFromJson(json);
}

/// Sends an AWS IoT Events input, passing in information about the detector
/// model instance and the event that triggered the action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotEventsAction {
  /// The name of the AWS IoT Events input where the data is sent.
  @_s.JsonKey(name: 'inputName')
  final String inputName;

  /// You can configure the action payload when you send a message to an AWS IoT
  /// Events input.
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  IotEventsAction({
    @_s.required this.inputName,
    this.payload,
  });
  factory IotEventsAction.fromJson(Map<String, dynamic> json) =>
      _$IotEventsActionFromJson(json);

  Map<String, dynamic> toJson() => _$IotEventsActionToJson(this);
}

/// Sends information about the detector model instance and the event that
/// triggered the action to a specified asset property in AWS IoT SiteWise.
/// <important>
/// You must specify either <code>propertyAlias</code> or both
/// <code>assetId</code> and <code>propertyId</code> to identify the target
/// asset property in AWS IoT SiteWise.
/// </important>
/// For parameters that are string data type, you can specify the following
/// options:
///
/// <ul>
/// <li>
/// Use a string. For example, the <code>propertyAlias</code> value can be
/// <code>'/company/windfarm/3/turbine/7/temperature'</code>.
/// </li>
/// <li>
/// Use an expression. For example, the <code>propertyAlias</code> value can be
/// <code>'company/windfarm/${$input.TemperatureInput.sensorData.windfarmID}/turbine/${$input.TemperatureInput.sensorData.turbineID}/temperature'</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iotevents/latest/developerguide/iotevents-expressions.html">Expressions</a>
/// in the <i>AWS IoT Events Developer Guide</i>.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotSiteWiseAction {
  /// The value to send to the asset property. This value contains timestamp,
  /// quality, and value (TQV) information.
  @_s.JsonKey(name: 'propertyValue')
  final AssetPropertyValue propertyValue;

  /// The ID of the asset that has the specified property. You can specify an
  /// expression.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// A unique identifier for this entry. You can use the entry ID to track which
  /// data entry causes an error in case of failure. The default is a new unique
  /// identifier. You can also specify an expression.
  @_s.JsonKey(name: 'entryId')
  final String entryId;

  /// The alias of the asset property. You can also specify an expression.
  @_s.JsonKey(name: 'propertyAlias')
  final String propertyAlias;

  /// The ID of the asset property. You can specify an expression.
  @_s.JsonKey(name: 'propertyId')
  final String propertyId;

  IotSiteWiseAction({
    @_s.required this.propertyValue,
    this.assetId,
    this.entryId,
    this.propertyAlias,
    this.propertyId,
  });
  factory IotSiteWiseAction.fromJson(Map<String, dynamic> json) =>
      _$IotSiteWiseActionFromJson(json);

  Map<String, dynamic> toJson() => _$IotSiteWiseActionToJson(this);
}

/// Information required to publish the MQTT message through the AWS IoT message
/// broker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotTopicPublishAction {
  /// The MQTT topic of the message. You can use a string expression that includes
  /// variables (<code>$variable.&lt;variable-name&gt;</code>) and input values
  /// (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>) as the topic
  /// string.
  @_s.JsonKey(name: 'mqttTopic')
  final String mqttTopic;

  /// You can configure the action payload when you publish a message to an AWS
  /// IoT Core topic.
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  IotTopicPublishAction({
    @_s.required this.mqttTopic,
    this.payload,
  });
  factory IotTopicPublishAction.fromJson(Map<String, dynamic> json) =>
      _$IotTopicPublishActionFromJson(json);

  Map<String, dynamic> toJson() => _$IotTopicPublishActionToJson(this);
}

/// Calls a Lambda function, passing in information about the detector model
/// instance and the event that triggered the action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaAction {
  /// The ARN of the Lambda function that is executed.
  @_s.JsonKey(name: 'functionArn')
  final String functionArn;

  /// You can configure the action payload when you send a message to a Lambda
  /// function.
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  LambdaAction({
    @_s.required this.functionArn,
    this.payload,
  });
  factory LambdaAction.fromJson(Map<String, dynamic> json) =>
      _$LambdaActionFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDetectorModelVersionsResponse {
  /// Summary information about the detector model versions.
  @_s.JsonKey(name: 'detectorModelVersionSummaries')
  final List<DetectorModelVersionSummary> detectorModelVersionSummaries;

  /// A token to retrieve the next set of results, or <code>null</code> if there
  /// are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDetectorModelVersionsResponse({
    this.detectorModelVersionSummaries,
    this.nextToken,
  });
  factory ListDetectorModelVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDetectorModelVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDetectorModelsResponse {
  /// Summary information about the detector models.
  @_s.JsonKey(name: 'detectorModelSummaries')
  final List<DetectorModelSummary> detectorModelSummaries;

  /// A token to retrieve the next set of results, or <code>null</code> if there
  /// are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDetectorModelsResponse({
    this.detectorModelSummaries,
    this.nextToken,
  });
  factory ListDetectorModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDetectorModelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInputsResponse {
  /// Summary information about the inputs.
  @_s.JsonKey(name: 'inputSummaries')
  final List<InputSummary> inputSummaries;

  /// A token to retrieve the next set of results, or <code>null</code> if there
  /// are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInputsResponse({
    this.inputSummaries,
    this.nextToken,
  });
  factory ListInputsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInputsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum LoggingLevel {
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('DEBUG')
  debug,
}

/// The values of the AWS IoT Events logging options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingOptions {
  /// If TRUE, logging is enabled for AWS IoT Events.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The logging level.
  @_s.JsonKey(name: 'level')
  final LoggingLevel level;

  /// The ARN of the role that grants permission to AWS IoT Events to perform
  /// logging.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Information that identifies those detector models and their detectors
  /// (instances) for which the logging level is given.
  @_s.JsonKey(name: 'detectorDebugOptions')
  final List<DetectorDebugOption> detectorDebugOptions;

  LoggingOptions({
    @_s.required this.enabled,
    @_s.required this.level,
    @_s.required this.roleArn,
    this.detectorDebugOptions,
  });
  factory LoggingOptions.fromJson(Map<String, dynamic> json) =>
      _$LoggingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingOptionsToJson(this);
}

/// When entering this state, perform these <code>actions</code> if the
/// <code>condition</code> is TRUE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnEnterLifecycle {
  /// Specifies the actions that are performed when the state is entered and the
  /// <code>condition</code> is <code>TRUE</code>.
  @_s.JsonKey(name: 'events')
  final List<Event> events;

  OnEnterLifecycle({
    this.events,
  });
  factory OnEnterLifecycle.fromJson(Map<String, dynamic> json) =>
      _$OnEnterLifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$OnEnterLifecycleToJson(this);
}

/// When exiting this state, perform these <code>actions</code> if the specified
/// <code>condition</code> is <code>TRUE</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnExitLifecycle {
  /// Specifies the <code>actions</code> that are performed when the state is
  /// exited and the <code>condition</code> is <code>TRUE</code>.
  @_s.JsonKey(name: 'events')
  final List<Event> events;

  OnExitLifecycle({
    this.events,
  });
  factory OnExitLifecycle.fromJson(Map<String, dynamic> json) =>
      _$OnExitLifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$OnExitLifecycleToJson(this);
}

/// Specifies the actions performed when the <code>condition</code> evaluates to
/// TRUE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnInputLifecycle {
  /// Specifies the actions performed when the <code>condition</code> evaluates to
  /// TRUE.
  @_s.JsonKey(name: 'events')
  final List<Event> events;

  /// Specifies the actions performed, and the next state entered, when a
  /// <code>condition</code> evaluates to TRUE.
  @_s.JsonKey(name: 'transitionEvents')
  final List<TransitionEvent> transitionEvents;

  OnInputLifecycle({
    this.events,
    this.transitionEvents,
  });
  factory OnInputLifecycle.fromJson(Map<String, dynamic> json) =>
      _$OnInputLifecycleFromJson(json);

  Map<String, dynamic> toJson() => _$OnInputLifecycleToJson(this);
}

/// Information needed to configure the payload.
///
/// By default, AWS IoT Events generates a standard payload in JSON for any
/// action. This action payload contains all attribute-value pairs that have the
/// information about the detector model instance and the event triggered the
/// action. To configure the action payload, you can use
/// <code>contentExpression</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Payload {
  /// The content of the payload. You can use a string expression that includes
  /// quoted strings (<code>'&lt;string&gt;'</code>), variables
  /// (<code>$variable.&lt;variable-name&gt;</code>), input values
  /// (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>), string
  /// concatenations, and quoted strings that contain <code>${}</code> as the
  /// content. The recommended maximum size of a content expression is 1 KB.
  @_s.JsonKey(name: 'contentExpression')
  final String contentExpression;

  /// The value of the payload type can be either <code>STRING</code> or
  /// <code>JSON</code>.
  @_s.JsonKey(name: 'type')
  final PayloadType type;

  Payload({
    @_s.required this.contentExpression,
    @_s.required this.type,
  });
  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

enum PayloadType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('JSON')
  json,
}

/// Information required to reset the timer. The timer is reset to the
/// previously evaluated result of the duration. The duration expression isn't
/// reevaluated when you reset the timer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResetTimerAction {
  /// The name of the timer to reset.
  @_s.JsonKey(name: 'timerName')
  final String timerName;

  ResetTimerAction({
    @_s.required this.timerName,
  });
  factory ResetTimerAction.fromJson(Map<String, dynamic> json) =>
      _$ResetTimerActionFromJson(json);

  Map<String, dynamic> toJson() => _$ResetTimerActionToJson(this);
}

/// Information required to publish the Amazon SNS message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SNSTopicPublishAction {
  /// The ARN of the Amazon SNS target where the message is sent.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// You can configure the action payload when you send a message as an Amazon
  /// SNS push notification.
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  SNSTopicPublishAction({
    @_s.required this.targetArn,
    this.payload,
  });
  factory SNSTopicPublishAction.fromJson(Map<String, dynamic> json) =>
      _$SNSTopicPublishActionFromJson(json);

  Map<String, dynamic> toJson() => _$SNSTopicPublishActionToJson(this);
}

/// Information needed to set the timer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SetTimerAction {
  /// The name of the timer.
  @_s.JsonKey(name: 'timerName')
  final String timerName;

  /// The duration of the timer, in seconds. You can use a string expression that
  /// includes numbers, variables (<code>$variable.&lt;variable-name&gt;</code>),
  /// and input values
  /// (<code>$input.&lt;input-name&gt;.&lt;path-to-datum&gt;</code>) as the
  /// duration. The range of the duration is 1-31622400 seconds. To ensure
  /// accuracy, the minimum duration is 60 seconds. The evaluated result of the
  /// duration is rounded down to the nearest whole number.
  @_s.JsonKey(name: 'durationExpression')
  final String durationExpression;

  /// The number of seconds until the timer expires. The minimum value is 60
  /// seconds to ensure accuracy. The maximum value is 31622400 seconds.
  @_s.JsonKey(name: 'seconds')
  final int seconds;

  SetTimerAction({
    @_s.required this.timerName,
    this.durationExpression,
    this.seconds,
  });
  factory SetTimerAction.fromJson(Map<String, dynamic> json) =>
      _$SetTimerActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetTimerActionToJson(this);
}

/// Information about the variable and its new value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SetVariableAction {
  /// The new value of the variable.
  @_s.JsonKey(name: 'value')
  final String value;

  /// The name of the variable.
  @_s.JsonKey(name: 'variableName')
  final String variableName;

  SetVariableAction({
    @_s.required this.value,
    @_s.required this.variableName,
  });
  factory SetVariableAction.fromJson(Map<String, dynamic> json) =>
      _$SetVariableActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetVariableActionToJson(this);
}

/// Sends information about the detector model instance and the event that
/// triggered the action to an Amazon SQS queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SqsAction {
  /// The URL of the SQS queue where the data is written.
  @_s.JsonKey(name: 'queueUrl')
  final String queueUrl;

  /// You can configure the action payload when you send a message to an Amazon
  /// SQS queue.
  @_s.JsonKey(name: 'payload')
  final Payload payload;

  /// Set this to TRUE if you want the data to be base-64 encoded before it is
  /// written to the queue. Otherwise, set this to FALSE.
  @_s.JsonKey(name: 'useBase64')
  final bool useBase64;

  SqsAction({
    @_s.required this.queueUrl,
    this.payload,
    this.useBase64,
  });
  factory SqsAction.fromJson(Map<String, dynamic> json) =>
      _$SqsActionFromJson(json);

  Map<String, dynamic> toJson() => _$SqsActionToJson(this);
}

/// Information that defines a state of a detector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class State {
  /// The name of the state.
  @_s.JsonKey(name: 'stateName')
  final String stateName;

  /// When entering this state, perform these <code>actions</code> if the
  /// <code>condition</code> is TRUE.
  @_s.JsonKey(name: 'onEnter')
  final OnEnterLifecycle onEnter;

  /// When exiting this state, perform these <code>actions</code> if the specified
  /// <code>condition</code> is <code>TRUE</code>.
  @_s.JsonKey(name: 'onExit')
  final OnExitLifecycle onExit;

  /// When an input is received and the <code>condition</code> is TRUE, perform
  /// the specified <code>actions</code>.
  @_s.JsonKey(name: 'onInput')
  final OnInputLifecycle onInput;

  State({
    @_s.required this.stateName,
    this.onEnter,
    this.onExit,
    this.onInput,
  });
  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

/// Metadata that can be used to manage the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag's key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The tag's value.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
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

/// Specifies the actions performed and the next state entered when a
/// <code>condition</code> evaluates to TRUE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransitionEvent {
  /// Required. A Boolean expression that when TRUE causes the actions to be
  /// performed and the <code>nextState</code> to be entered.
  @_s.JsonKey(name: 'condition')
  final String condition;

  /// The name of the transition event.
  @_s.JsonKey(name: 'eventName')
  final String eventName;

  /// The next state to enter.
  @_s.JsonKey(name: 'nextState')
  final String nextState;

  /// The actions to be performed.
  @_s.JsonKey(name: 'actions')
  final List<Action> actions;

  TransitionEvent({
    @_s.required this.condition,
    @_s.required this.eventName,
    @_s.required this.nextState,
    this.actions,
  });
  factory TransitionEvent.fromJson(Map<String, dynamic> json) =>
      _$TransitionEventFromJson(json);

  Map<String, dynamic> toJson() => _$TransitionEventToJson(this);
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
class UpdateDetectorModelResponse {
  /// Information about how the detector model is configured.
  @_s.JsonKey(name: 'detectorModelConfiguration')
  final DetectorModelConfiguration detectorModelConfiguration;

  UpdateDetectorModelResponse({
    this.detectorModelConfiguration,
  });
  factory UpdateDetectorModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDetectorModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInputResponse {
  /// Information about the configuration of the input.
  @_s.JsonKey(name: 'inputConfiguration')
  final InputConfiguration inputConfiguration;

  UpdateInputResponse({
    this.inputConfiguration,
  });
  factory UpdateInputResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInputResponseFromJson(json);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
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
