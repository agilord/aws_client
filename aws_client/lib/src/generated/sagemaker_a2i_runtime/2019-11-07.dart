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

part '2019-11-07.g.dart';

/// <important>
/// Amazon Augmented AI is in preview release and is subject to change. We do
/// not recommend using this product in production environments.
/// </important>
/// Amazon Augmented AI (Amazon A2I) adds the benefit of human judgment to any
/// machine learning application. When an AI application can't evaluate data
/// with a high degree of confidence, human reviewers can take over. This human
/// review is called a human review workflow. To create and start a human review
/// workflow, you need three resources: a <i>worker task template</i>, a <i>flow
/// definition</i>, and a <i>human loop</i>.
///
/// For information about these resources and prerequisites for using Amazon
/// A2I, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-getting-started.html">Get
/// Started with Amazon Augmented AI</a> in the Amazon SageMaker Developer
/// Guide.
///
/// This API reference includes information about API actions and data types
/// that you can use to interact with Amazon A2I programmatically. Use this
/// guide to:
///
/// <ul>
/// <li>
/// Start a human loop with the <code>StartHumanLoop</code> operation when using
/// Amazon A2I with a <i>custom task type</i>. To learn more about the
/// difference between custom and built-in task types, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-task-types-general.html">Use
/// Task Types </a>. To learn how to start a human loop using this API, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-start-human-loop.html#a2i-instructions-starthumanloop">Create
/// and Start a Human Loop for a Custom Task Type </a> in the Amazon SageMaker
/// Developer Guide.
/// </li>
/// <li>
/// Manage your human loops. You can list all human loops that you have created,
/// describe individual human loops, and stop and delete human loops. To learn
/// more, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-monitor-humanloop-results.html">Monitor
/// and Manage Your Human Loop </a> in the Amazon SageMaker Developer Guide.
/// </li>
/// </ul>
/// Amazon A2I integrates APIs from various AWS services to create and start
/// human review workflows for those services. To learn how Amazon A2I uses
/// these APIs, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-api-references.html">Use
/// APIs in Amazon A2I</a> in the Amazon SageMaker Developer Guide.
class AugmentedAIRuntime {
  final _s.RestJsonProtocol _protocol;
  AugmentedAIRuntime({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'a2i-runtime.sagemaker',
            signingName: 'sagemaker',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes the specified human loop for a flow definition.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [humanLoopName] :
  /// The name of the human loop that you want to delete.
  Future<void> deleteHumanLoop({
    @_s.required String humanLoopName,
  }) async {
    ArgumentError.checkNotNull(humanLoopName, 'humanLoopName');
    _s.validateStringLength(
      'humanLoopName',
      humanLoopName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'humanLoopName',
      humanLoopName,
      r'''^[a-z0-9](-*[a-z0-9])*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/human-loops/${Uri.encodeComponent(humanLoopName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteHumanLoopResponse.fromJson(response);
  }

  /// Returns information about the specified human loop.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [humanLoopName] :
  /// The name of the human loop that you want information about.
  Future<DescribeHumanLoopResponse> describeHumanLoop({
    @_s.required String humanLoopName,
  }) async {
    ArgumentError.checkNotNull(humanLoopName, 'humanLoopName');
    _s.validateStringLength(
      'humanLoopName',
      humanLoopName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'humanLoopName',
      humanLoopName,
      r'''^[a-z0-9](-*[a-z0-9])*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/human-loops/${Uri.encodeComponent(humanLoopName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeHumanLoopResponse.fromJson(response);
  }

  /// Returns information about human loops, given the specified parameters. If
  /// a human loop was deleted, it will not be included.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [flowDefinitionArn] :
  /// The Amazon Resource Name (ARN) of a flow definition.
  ///
  /// Parameter [creationTimeAfter] :
  /// (Optional) The timestamp of the date when you want the human loops to
  /// begin in ISO 8601 format. For example, <code>2020-02-24</code>.
  ///
  /// Parameter [creationTimeBefore] :
  /// (Optional) The timestamp of the date before which you want the human loops
  /// to begin in ISO 8601 format. For example, <code>2020-02-24</code>.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return. If the total number of available
  /// items is more than the value specified in <code>MaxResults</code>, then a
  /// <code>NextToken</code> is returned in the output. You can use this token
  /// to display the next page of results.
  ///
  /// Parameter [nextToken] :
  /// A token to display the next page of results.
  ///
  /// Parameter [sortOrder] :
  /// Optional. The order for displaying results. Valid values:
  /// <code>Ascending</code> and <code>Descending</code>.
  Future<ListHumanLoopsResponse> listHumanLoops({
    @_s.required String flowDefinitionArn,
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nextToken,
    SortOrder sortOrder,
  }) async {
    ArgumentError.checkNotNull(flowDefinitionArn, 'flowDefinitionArn');
    _s.validateStringLength(
      'flowDefinitionArn',
      flowDefinitionArn,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowDefinitionArn',
      flowDefinitionArn,
      r'''arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:flow-definition/.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
    );
    final $query = <String, List<String>>{
      if (flowDefinitionArn != null) 'FlowDefinitionArn': [flowDefinitionArn],
      if (creationTimeAfter != null)
        'CreationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'CreationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sortOrder != null) 'SortOrder': [sortOrder.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/human-loops',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHumanLoopsResponse.fromJson(response);
  }

  /// Starts a human loop, provided that at least one activation condition is
  /// met.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [flowDefinitionArn] :
  /// The Amazon Resource Name (ARN) of the flow definition associated with this
  /// human loop.
  ///
  /// Parameter [humanLoopInput] :
  /// An object that contains information about the human loop.
  ///
  /// Parameter [humanLoopName] :
  /// The name of the human loop.
  ///
  /// Parameter [dataAttributes] :
  /// Attributes of the specified data. Use <code>DataAttributes</code> to
  /// specify if your data is free of personally identifiable information and/or
  /// free of adult content.
  Future<StartHumanLoopResponse> startHumanLoop({
    @_s.required String flowDefinitionArn,
    @_s.required HumanLoopInput humanLoopInput,
    @_s.required String humanLoopName,
    HumanLoopDataAttributes dataAttributes,
  }) async {
    ArgumentError.checkNotNull(flowDefinitionArn, 'flowDefinitionArn');
    _s.validateStringLength(
      'flowDefinitionArn',
      flowDefinitionArn,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'flowDefinitionArn',
      flowDefinitionArn,
      r'''arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:flow-definition/.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(humanLoopInput, 'humanLoopInput');
    ArgumentError.checkNotNull(humanLoopName, 'humanLoopName');
    _s.validateStringLength(
      'humanLoopName',
      humanLoopName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'humanLoopName',
      humanLoopName,
      r'''^[a-z0-9](-*[a-z0-9])*$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'FlowDefinitionArn': flowDefinitionArn,
      'HumanLoopInput': humanLoopInput,
      'HumanLoopName': humanLoopName,
      if (dataAttributes != null) 'DataAttributes': dataAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/human-loops',
      exceptionFnMap: _exceptionFns,
    );
    return StartHumanLoopResponse.fromJson(response);
  }

  /// Stops the specified human loop.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [humanLoopName] :
  /// The name of the human loop that you want to stop.
  Future<void> stopHumanLoop({
    @_s.required String humanLoopName,
  }) async {
    ArgumentError.checkNotNull(humanLoopName, 'humanLoopName');
    _s.validateStringLength(
      'humanLoopName',
      humanLoopName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'humanLoopName',
      humanLoopName,
      r'''^[a-z0-9](-*[a-z0-9])*$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'HumanLoopName': humanLoopName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/human-loops/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopHumanLoopResponse.fromJson(response);
  }
}

enum ContentClassifier {
  @_s.JsonValue('FreeOfPersonallyIdentifiableInformation')
  freeOfPersonallyIdentifiableInformation,
  @_s.JsonValue('FreeOfAdultContent')
  freeOfAdultContent,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteHumanLoopResponse {
  DeleteHumanLoopResponse();
  factory DeleteHumanLoopResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHumanLoopResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHumanLoopResponse {
  /// The creation time when Amazon Augmented AI created the human loop.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the flow definition.
  @_s.JsonKey(name: 'FlowDefinitionArn')
  final String flowDefinitionArn;

  /// The Amazon Resource Name (ARN) of the human loop.
  @_s.JsonKey(name: 'HumanLoopArn')
  final String humanLoopArn;

  /// The name of the human loop. The name must be lowercase, unique within the
  /// Region in your account, and can have up to 63 characters. Valid characters:
  /// a-z, 0-9, and - (hyphen).
  @_s.JsonKey(name: 'HumanLoopName')
  final String humanLoopName;

  /// The status of the human loop.
  @_s.JsonKey(name: 'HumanLoopStatus')
  final HumanLoopStatus humanLoopStatus;

  /// A failure code that identifies the type of failure.
  @_s.JsonKey(name: 'FailureCode')
  final String failureCode;

  /// The reason why a human loop failed. The failure reason is returned when the
  /// status of the human loop is <code>Failed</code>.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// An object that contains information about the output of the human loop.
  @_s.JsonKey(name: 'HumanLoopOutput')
  final HumanLoopOutput humanLoopOutput;

  DescribeHumanLoopResponse({
    @_s.required this.creationTime,
    @_s.required this.flowDefinitionArn,
    @_s.required this.humanLoopArn,
    @_s.required this.humanLoopName,
    @_s.required this.humanLoopStatus,
    this.failureCode,
    this.failureReason,
    this.humanLoopOutput,
  });
  factory DescribeHumanLoopResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHumanLoopResponseFromJson(json);
}

/// Attributes of the data specified by the customer. Use these to describe the
/// data to be labeled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HumanLoopDataAttributes {
  /// Declares that your content is free of personally identifiable information or
  /// adult content.
  ///
  /// Amazon SageMaker can restrict the Amazon Mechanical Turk workers who can
  /// view your task based on this information.
  @_s.JsonKey(name: 'ContentClassifiers')
  final List<ContentClassifier> contentClassifiers;

  HumanLoopDataAttributes({
    @_s.required this.contentClassifiers,
  });
  Map<String, dynamic> toJson() => _$HumanLoopDataAttributesToJson(this);
}

/// An object containing the human loop input in JSON format.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HumanLoopInput {
  /// Serialized input from the human loop. The input must be a string
  /// representation of a file in JSON format.
  @_s.JsonKey(name: 'InputContent')
  final String inputContent;

  HumanLoopInput({
    @_s.required this.inputContent,
  });
  Map<String, dynamic> toJson() => _$HumanLoopInputToJson(this);
}

/// Information about where the human output will be stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HumanLoopOutput {
  /// The location of the Amazon S3 object where Amazon Augmented AI stores your
  /// human loop output.
  @_s.JsonKey(name: 'OutputS3Uri')
  final String outputS3Uri;

  HumanLoopOutput({
    @_s.required this.outputS3Uri,
  });
  factory HumanLoopOutput.fromJson(Map<String, dynamic> json) =>
      _$HumanLoopOutputFromJson(json);
}

enum HumanLoopStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Stopping')
  stopping,
}

/// Summary information about the human loop.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HumanLoopSummary {
  /// When Amazon Augmented AI created the human loop.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// The reason why the human loop failed. A failure reason is returned when the
  /// status of the human loop is <code>Failed</code>.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the flow definition used to configure the
  /// human loop.
  @_s.JsonKey(name: 'FlowDefinitionArn')
  final String flowDefinitionArn;

  /// The name of the human loop.
  @_s.JsonKey(name: 'HumanLoopName')
  final String humanLoopName;

  /// The status of the human loop.
  @_s.JsonKey(name: 'HumanLoopStatus')
  final HumanLoopStatus humanLoopStatus;

  HumanLoopSummary({
    this.creationTime,
    this.failureReason,
    this.flowDefinitionArn,
    this.humanLoopName,
    this.humanLoopStatus,
  });
  factory HumanLoopSummary.fromJson(Map<String, dynamic> json) =>
      _$HumanLoopSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHumanLoopsResponse {
  /// An array of objects that contain information about the human loops.
  @_s.JsonKey(name: 'HumanLoopSummaries')
  final List<HumanLoopSummary> humanLoopSummaries;

  /// A token to display the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHumanLoopsResponse({
    @_s.required this.humanLoopSummaries,
    this.nextToken,
  });
  factory ListHumanLoopsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHumanLoopsResponseFromJson(json);
}

enum SortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartHumanLoopResponse {
  /// The Amazon Resource Name (ARN) of the human loop.
  @_s.JsonKey(name: 'HumanLoopArn')
  final String humanLoopArn;

  StartHumanLoopResponse({
    this.humanLoopArn,
  });
  factory StartHumanLoopResponse.fromJson(Map<String, dynamic> json) =>
      _$StartHumanLoopResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopHumanLoopResponse {
  StopHumanLoopResponse();
  factory StopHumanLoopResponse.fromJson(Map<String, dynamic> json) =>
      _$StopHumanLoopResponseFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
