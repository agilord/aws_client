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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'a2i-runtime.sagemaker',
            signingName: 'sagemaker',
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

  /// Deletes the specified human loop for a flow definition.
  ///
  /// If the human loop was deleted, this operation will return a
  /// <code>ResourceNotFoundException</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [humanLoopName] :
  /// The name of the human loop that you want to delete.
  Future<void> deleteHumanLoop({
    required String humanLoopName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/human-loops/${Uri.encodeComponent(humanLoopName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about the specified human loop. If the human loop was
  /// deleted, this operation will return a
  /// <code>ResourceNotFoundException</code> error.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [humanLoopName] :
  /// The name of the human loop that you want information about.
  Future<DescribeHumanLoopResponse> describeHumanLoop({
    required String humanLoopName,
  }) async {
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
    required String flowDefinitionArn,
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? nextToken,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'FlowDefinitionArn': [flowDefinitionArn],
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
    required String flowDefinitionArn,
    required HumanLoopInput humanLoopInput,
    required String humanLoopName,
    HumanLoopDataAttributes? dataAttributes,
  }) async {
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
    required String humanLoopName,
  }) async {
    final $payload = <String, dynamic>{
      'HumanLoopName': humanLoopName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/human-loops/stop',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum ContentClassifier {
  freeOfPersonallyIdentifiableInformation,
  freeOfAdultContent,
}

extension ContentClassifierValueExtension on ContentClassifier {
  String toValue() {
    switch (this) {
      case ContentClassifier.freeOfPersonallyIdentifiableInformation:
        return 'FreeOfPersonallyIdentifiableInformation';
      case ContentClassifier.freeOfAdultContent:
        return 'FreeOfAdultContent';
    }
  }
}

extension ContentClassifierFromString on String {
  ContentClassifier toContentClassifier() {
    switch (this) {
      case 'FreeOfPersonallyIdentifiableInformation':
        return ContentClassifier.freeOfPersonallyIdentifiableInformation;
      case 'FreeOfAdultContent':
        return ContentClassifier.freeOfAdultContent;
    }
    throw Exception('$this is not known in enum ContentClassifier');
  }
}

class DeleteHumanLoopResponse {
  DeleteHumanLoopResponse();

  factory DeleteHumanLoopResponse.fromJson(Map<String, dynamic> _) {
    return DeleteHumanLoopResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeHumanLoopResponse {
  /// The creation time when Amazon Augmented AI created the human loop.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the flow definition.
  final String flowDefinitionArn;

  /// The Amazon Resource Name (ARN) of the human loop.
  final String humanLoopArn;

  /// The name of the human loop. The name must be lowercase, unique within the
  /// Region in your account, and can have up to 63 characters. Valid characters:
  /// a-z, 0-9, and - (hyphen).
  final String humanLoopName;

  /// The status of the human loop.
  final HumanLoopStatus humanLoopStatus;

  /// A failure code that identifies the type of failure.
  ///
  /// Possible values: <code>ValidationError</code>, <code>Expired</code>,
  /// <code>InternalError</code>
  final String? failureCode;

  /// The reason why a human loop failed. The failure reason is returned when the
  /// status of the human loop is <code>Failed</code>.
  final String? failureReason;

  /// An object that contains information about the output of the human loop.
  final HumanLoopOutput? humanLoopOutput;

  DescribeHumanLoopResponse({
    required this.creationTime,
    required this.flowDefinitionArn,
    required this.humanLoopArn,
    required this.humanLoopName,
    required this.humanLoopStatus,
    this.failureCode,
    this.failureReason,
    this.humanLoopOutput,
  });

  factory DescribeHumanLoopResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHumanLoopResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      flowDefinitionArn: json['FlowDefinitionArn'] as String,
      humanLoopArn: json['HumanLoopArn'] as String,
      humanLoopName: json['HumanLoopName'] as String,
      humanLoopStatus: (json['HumanLoopStatus'] as String).toHumanLoopStatus(),
      failureCode: json['FailureCode'] as String?,
      failureReason: json['FailureReason'] as String?,
      humanLoopOutput: json['HumanLoopOutput'] != null
          ? HumanLoopOutput.fromJson(
              json['HumanLoopOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final flowDefinitionArn = this.flowDefinitionArn;
    final humanLoopArn = this.humanLoopArn;
    final humanLoopName = this.humanLoopName;
    final humanLoopStatus = this.humanLoopStatus;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final humanLoopOutput = this.humanLoopOutput;
    return {
      'CreationTime': iso8601ToJson(creationTime),
      'FlowDefinitionArn': flowDefinitionArn,
      'HumanLoopArn': humanLoopArn,
      'HumanLoopName': humanLoopName,
      'HumanLoopStatus': humanLoopStatus.toValue(),
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureReason != null) 'FailureReason': failureReason,
      if (humanLoopOutput != null) 'HumanLoopOutput': humanLoopOutput,
    };
  }
}

/// Attributes of the data specified by the customer. Use these to describe the
/// data to be labeled.
class HumanLoopDataAttributes {
  /// Declares that your content is free of personally identifiable information or
  /// adult content.
  ///
  /// Amazon SageMaker can restrict the Amazon Mechanical Turk workers who can
  /// view your task based on this information.
  final List<ContentClassifier> contentClassifiers;

  HumanLoopDataAttributes({
    required this.contentClassifiers,
  });

  Map<String, dynamic> toJson() {
    final contentClassifiers = this.contentClassifiers;
    return {
      'ContentClassifiers': contentClassifiers.map((e) => e.toValue()).toList(),
    };
  }
}

/// An object containing the human loop input in JSON format.
class HumanLoopInput {
  /// Serialized input from the human loop. The input must be a string
  /// representation of a file in JSON format.
  final String inputContent;

  HumanLoopInput({
    required this.inputContent,
  });

  Map<String, dynamic> toJson() {
    final inputContent = this.inputContent;
    return {
      'InputContent': inputContent,
    };
  }
}

/// Information about where the human output will be stored.
class HumanLoopOutput {
  /// The location of the Amazon S3 object where Amazon Augmented AI stores your
  /// human loop output.
  final String outputS3Uri;

  HumanLoopOutput({
    required this.outputS3Uri,
  });

  factory HumanLoopOutput.fromJson(Map<String, dynamic> json) {
    return HumanLoopOutput(
      outputS3Uri: json['OutputS3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Uri = this.outputS3Uri;
    return {
      'OutputS3Uri': outputS3Uri,
    };
  }
}

enum HumanLoopStatus {
  inProgress,
  failed,
  completed,
  stopped,
  stopping,
}

extension HumanLoopStatusValueExtension on HumanLoopStatus {
  String toValue() {
    switch (this) {
      case HumanLoopStatus.inProgress:
        return 'InProgress';
      case HumanLoopStatus.failed:
        return 'Failed';
      case HumanLoopStatus.completed:
        return 'Completed';
      case HumanLoopStatus.stopped:
        return 'Stopped';
      case HumanLoopStatus.stopping:
        return 'Stopping';
    }
  }
}

extension HumanLoopStatusFromString on String {
  HumanLoopStatus toHumanLoopStatus() {
    switch (this) {
      case 'InProgress':
        return HumanLoopStatus.inProgress;
      case 'Failed':
        return HumanLoopStatus.failed;
      case 'Completed':
        return HumanLoopStatus.completed;
      case 'Stopped':
        return HumanLoopStatus.stopped;
      case 'Stopping':
        return HumanLoopStatus.stopping;
    }
    throw Exception('$this is not known in enum HumanLoopStatus');
  }
}

/// Summary information about the human loop.
class HumanLoopSummary {
  /// When Amazon Augmented AI created the human loop.
  final DateTime? creationTime;

  /// The reason why the human loop failed. A failure reason is returned when the
  /// status of the human loop is <code>Failed</code>.
  final String? failureReason;

  /// The Amazon Resource Name (ARN) of the flow definition used to configure the
  /// human loop.
  final String? flowDefinitionArn;

  /// The name of the human loop.
  final String? humanLoopName;

  /// The status of the human loop.
  final HumanLoopStatus? humanLoopStatus;

  HumanLoopSummary({
    this.creationTime,
    this.failureReason,
    this.flowDefinitionArn,
    this.humanLoopName,
    this.humanLoopStatus,
  });

  factory HumanLoopSummary.fromJson(Map<String, dynamic> json) {
    return HumanLoopSummary(
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      flowDefinitionArn: json['FlowDefinitionArn'] as String?,
      humanLoopName: json['HumanLoopName'] as String?,
      humanLoopStatus:
          (json['HumanLoopStatus'] as String?)?.toHumanLoopStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final flowDefinitionArn = this.flowDefinitionArn;
    final humanLoopName = this.humanLoopName;
    final humanLoopStatus = this.humanLoopStatus;
    return {
      if (creationTime != null) 'CreationTime': iso8601ToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (flowDefinitionArn != null) 'FlowDefinitionArn': flowDefinitionArn,
      if (humanLoopName != null) 'HumanLoopName': humanLoopName,
      if (humanLoopStatus != null) 'HumanLoopStatus': humanLoopStatus.toValue(),
    };
  }
}

class ListHumanLoopsResponse {
  /// An array of objects that contain information about the human loops.
  final List<HumanLoopSummary> humanLoopSummaries;

  /// A token to display the next page of results.
  final String? nextToken;

  ListHumanLoopsResponse({
    required this.humanLoopSummaries,
    this.nextToken,
  });

  factory ListHumanLoopsResponse.fromJson(Map<String, dynamic> json) {
    return ListHumanLoopsResponse(
      humanLoopSummaries: (json['HumanLoopSummaries'] as List)
          .whereNotNull()
          .map((e) => HumanLoopSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final humanLoopSummaries = this.humanLoopSummaries;
    final nextToken = this.nextToken;
    return {
      'HumanLoopSummaries': humanLoopSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'Ascending':
        return SortOrder.ascending;
      case 'Descending':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

class StartHumanLoopResponse {
  /// The Amazon Resource Name (ARN) of the human loop.
  final String? humanLoopArn;

  StartHumanLoopResponse({
    this.humanLoopArn,
  });

  factory StartHumanLoopResponse.fromJson(Map<String, dynamic> json) {
    return StartHumanLoopResponse(
      humanLoopArn: json['HumanLoopArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final humanLoopArn = this.humanLoopArn;
    return {
      if (humanLoopArn != null) 'HumanLoopArn': humanLoopArn,
    };
  }
}

class StopHumanLoopResponse {
  StopHumanLoopResponse();

  factory StopHumanLoopResponse.fromJson(Map<String, dynamic> _) {
    return StopHumanLoopResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
