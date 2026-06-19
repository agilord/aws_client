// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Amazon Bedrock Data Automation Runtime
class BedrockDataAutomationRuntime {
  final _s.JsonProtocol _protocol;
  BedrockDataAutomationRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock-data-automation-runtime',
            signingName: 'bedrock',
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

  /// Sync API: Invoke data automation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataAutomationProfileArn] :
  /// Data automation profile ARN
  ///
  /// Parameter [inputConfiguration] :
  /// Input configuration.
  ///
  /// Parameter [blueprints] :
  /// Blueprint list.
  ///
  /// Parameter [dataAutomationConfiguration] :
  /// Data automation configuration.
  ///
  /// Parameter [encryptionConfiguration] :
  /// Encryption configuration.
  ///
  /// Parameter [outputConfiguration] :
  /// Output configuration.
  Future<InvokeDataAutomationResponse> invokeDataAutomation({
    required String dataAutomationProfileArn,
    required SyncInputConfiguration inputConfiguration,
    List<Blueprint>? blueprints,
    DataAutomationConfiguration? dataAutomationConfiguration,
    EncryptionConfiguration? encryptionConfiguration,
    OutputConfiguration? outputConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonBedrockKeystoneRuntimeService.InvokeDataAutomation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataAutomationProfileArn': dataAutomationProfileArn,
        'inputConfiguration': inputConfiguration,
        if (blueprints != null) 'blueprints': blueprints,
        if (dataAutomationConfiguration != null)
          'dataAutomationConfiguration': dataAutomationConfiguration,
        if (encryptionConfiguration != null)
          'encryptionConfiguration': encryptionConfiguration,
        if (outputConfiguration != null)
          'outputConfiguration': outputConfiguration,
      },
    );

    return InvokeDataAutomationResponse.fromJson(jsonResponse.body);
  }

  /// List tags for an Amazon Bedrock Data Automation resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonBedrockKeystoneRuntimeService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Tag an Amazon Bedrock Data Automation resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonBedrockKeystoneRuntimeService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceARN': resourceARN,
        'tags': tags,
      },
    );
  }

  /// Untag an Amazon Bedrock Data Automation resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonBedrockKeystoneRuntimeService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceARN': resourceARN,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Async API: Invoke data automation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataAutomationProfileArn] :
  /// Data automation profile ARN
  ///
  /// Parameter [inputConfiguration] :
  /// Input configuration.
  ///
  /// Parameter [outputConfiguration] :
  /// Output configuration.
  ///
  /// Parameter [blueprints] :
  /// Blueprint list.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token.
  ///
  /// Parameter [dataAutomationConfiguration] :
  /// Data automation configuration.
  ///
  /// Parameter [encryptionConfiguration] :
  /// Encryption configuration.
  ///
  /// Parameter [notificationConfiguration] :
  /// Notification configuration.
  ///
  /// Parameter [tags] :
  /// List of tags.
  Future<InvokeDataAutomationAsyncResponse> invokeDataAutomationAsync({
    required String dataAutomationProfileArn,
    required InputConfiguration inputConfiguration,
    required OutputConfiguration outputConfiguration,
    List<Blueprint>? blueprints,
    String? clientToken,
    DataAutomationConfiguration? dataAutomationConfiguration,
    EncryptionConfiguration? encryptionConfiguration,
    NotificationConfiguration? notificationConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonBedrockKeystoneRuntimeService.InvokeDataAutomationAsync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataAutomationProfileArn': dataAutomationProfileArn,
        'inputConfiguration': inputConfiguration,
        'outputConfiguration': outputConfiguration,
        if (blueprints != null) 'blueprints': blueprints,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dataAutomationConfiguration != null)
          'dataAutomationConfiguration': dataAutomationConfiguration,
        if (encryptionConfiguration != null)
          'encryptionConfiguration': encryptionConfiguration,
        if (notificationConfiguration != null)
          'notificationConfiguration': notificationConfiguration,
        if (tags != null) 'tags': tags,
      },
    );

    return InvokeDataAutomationAsyncResponse.fromJson(jsonResponse.body);
  }

  /// API used to get data automation status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invocationArn] :
  /// Invocation arn.
  Future<GetDataAutomationStatusResponse> getDataAutomationStatus({
    required String invocationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonBedrockKeystoneRuntimeService.GetDataAutomationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'invocationArn': invocationArn,
      },
    );

    return GetDataAutomationStatusResponse.fromJson(jsonResponse.body);
  }
}

/// Invoke Data Automation Response
///
/// @nodoc
class InvokeDataAutomationResponse {
  /// Detected semantic modality
  final SemanticModality semanticModality;

  /// Output configuration
  final OutputConfiguration? outputConfiguration;

  /// List of outputs for each logical sub-doc
  final List<OutputSegment>? outputSegments;

  InvokeDataAutomationResponse({
    required this.semanticModality,
    this.outputConfiguration,
    this.outputSegments,
  });

  factory InvokeDataAutomationResponse.fromJson(Map<String, dynamic> json) {
    return InvokeDataAutomationResponse(
      semanticModality: SemanticModality.fromString(
          (json['semanticModality'] as String?) ?? ''),
      outputConfiguration: json['outputConfiguration'] != null
          ? OutputConfiguration.fromJson(
              json['outputConfiguration'] as Map<String, dynamic>)
          : null,
      outputSegments: (json['outputSegments'] as List?)
          ?.nonNulls
          .map((e) => OutputSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final semanticModality = this.semanticModality;
    final outputConfiguration = this.outputConfiguration;
    final outputSegments = this.outputSegments;
    return {
      'semanticModality': semanticModality.value,
      if (outputConfiguration != null)
        'outputConfiguration': outputConfiguration,
      if (outputSegments != null) 'outputSegments': outputSegments,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Invoke Data Automation Async Response
///
/// @nodoc
class InvokeDataAutomationAsyncResponse {
  /// ARN of the automation job
  final String invocationArn;

  InvokeDataAutomationAsyncResponse({
    required this.invocationArn,
  });

  factory InvokeDataAutomationAsyncResponse.fromJson(
      Map<String, dynamic> json) {
    return InvokeDataAutomationAsyncResponse(
      invocationArn: (json['invocationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final invocationArn = this.invocationArn;
    return {
      'invocationArn': invocationArn,
    };
  }
}

/// Response of GetDataAutomationStatus API.
///
/// @nodoc
class GetDataAutomationStatusResponse {
  /// Error Message.
  final String? errorMessage;

  /// Error Type.
  final String? errorType;

  /// Job completion time.
  final DateTime? jobCompletionTime;

  /// Job duration in seconds.
  final int? jobDurationInSeconds;

  /// Job Submission time.
  final DateTime? jobSubmissionTime;

  /// Output configuration.
  final OutputConfiguration? outputConfiguration;

  /// Job Status.
  final AutomationJobStatus? status;

  GetDataAutomationStatusResponse({
    this.errorMessage,
    this.errorType,
    this.jobCompletionTime,
    this.jobDurationInSeconds,
    this.jobSubmissionTime,
    this.outputConfiguration,
    this.status,
  });

  factory GetDataAutomationStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetDataAutomationStatusResponse(
      errorMessage: json['errorMessage'] as String?,
      errorType: json['errorType'] as String?,
      jobCompletionTime: timeStampFromJson(json['jobCompletionTime']),
      jobDurationInSeconds: json['jobDurationInSeconds'] as int?,
      jobSubmissionTime: timeStampFromJson(json['jobSubmissionTime']),
      outputConfiguration: json['outputConfiguration'] != null
          ? OutputConfiguration.fromJson(
              json['outputConfiguration'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(AutomationJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final jobCompletionTime = this.jobCompletionTime;
    final jobDurationInSeconds = this.jobDurationInSeconds;
    final jobSubmissionTime = this.jobSubmissionTime;
    final outputConfiguration = this.outputConfiguration;
    final status = this.status;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorType != null) 'errorType': errorType,
      if (jobCompletionTime != null)
        'jobCompletionTime': iso8601ToJson(jobCompletionTime),
      if (jobDurationInSeconds != null)
        'jobDurationInSeconds': jobDurationInSeconds,
      if (jobSubmissionTime != null)
        'jobSubmissionTime': iso8601ToJson(jobSubmissionTime),
      if (outputConfiguration != null)
        'outputConfiguration': outputConfiguration,
      if (status != null) 'status': status.value,
    };
  }
}

/// List of status supported by automation jobs
///
/// @nodoc
class AutomationJobStatus {
  static const created = AutomationJobStatus._('Created');
  static const inProgress = AutomationJobStatus._('InProgress');
  static const success = AutomationJobStatus._('Success');
  static const serviceError = AutomationJobStatus._('ServiceError');
  static const clientError = AutomationJobStatus._('ClientError');

  final String value;

  const AutomationJobStatus._(this.value);

  static const values = [
    created,
    inProgress,
    success,
    serviceError,
    clientError
  ];

  static AutomationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is AutomationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Output configuration.
///
/// @nodoc
class OutputConfiguration {
  /// S3 uri.
  final String s3Uri;

  OutputConfiguration({
    required this.s3Uri,
  });

  factory OutputConfiguration.fromJson(Map<String, dynamic> json) {
    return OutputConfiguration(
      s3Uri: (json['s3Uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      's3Uri': s3Uri,
    };
  }
}

/// Input configuration.
///
/// @nodoc
class InputConfiguration {
  /// S3 uri.
  final String s3Uri;

  /// Asset processing configuration
  final AssetProcessingConfiguration? assetProcessingConfiguration;

  InputConfiguration({
    required this.s3Uri,
    this.assetProcessingConfiguration,
  });

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final assetProcessingConfiguration = this.assetProcessingConfiguration;
    return {
      's3Uri': s3Uri,
      if (assetProcessingConfiguration != null)
        'assetProcessingConfiguration': assetProcessingConfiguration,
    };
  }
}

/// Data automation configuration.
///
/// @nodoc
class DataAutomationConfiguration {
  /// Data automation project arn.
  final String dataAutomationProjectArn;

  /// Data automation stage.
  final DataAutomationStage? stage;

  DataAutomationConfiguration({
    required this.dataAutomationProjectArn,
    this.stage,
  });

  Map<String, dynamic> toJson() {
    final dataAutomationProjectArn = this.dataAutomationProjectArn;
    final stage = this.stage;
    return {
      'dataAutomationProjectArn': dataAutomationProjectArn,
      if (stage != null) 'stage': stage.value,
    };
  }
}

/// Encryption configuration.
///
/// @nodoc
class EncryptionConfiguration {
  /// Customer KMS key used for encryption
  final String kmsKeyId;

  /// KMS encryption context.
  final Map<String, String>? kmsEncryptionContext;

  EncryptionConfiguration({
    required this.kmsKeyId,
    this.kmsEncryptionContext,
  });

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final kmsEncryptionContext = this.kmsEncryptionContext;
    return {
      'kmsKeyId': kmsKeyId,
      if (kmsEncryptionContext != null)
        'kmsEncryptionContext': kmsEncryptionContext,
    };
  }
}

/// Notification configuration.
///
/// @nodoc
class NotificationConfiguration {
  /// Event bridge configuration.
  final EventBridgeConfiguration eventBridgeConfiguration;

  NotificationConfiguration({
    required this.eventBridgeConfiguration,
  });

  Map<String, dynamic> toJson() {
    final eventBridgeConfiguration = this.eventBridgeConfiguration;
    return {
      'eventBridgeConfiguration': eventBridgeConfiguration,
    };
  }
}

/// Key value pair of a tag
///
/// @nodoc
class Tag {
  final String key;
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
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

/// Structure for single blueprint entity.
///
/// @nodoc
class Blueprint {
  /// Arn of blueprint.
  final String blueprintArn;

  /// Stage of blueprint.
  final BlueprintStage? stage;

  /// Version of blueprint.
  final String? version;

  Blueprint({
    required this.blueprintArn,
    this.stage,
    this.version,
  });

  Map<String, dynamic> toJson() {
    final blueprintArn = this.blueprintArn;
    final stage = this.stage;
    final version = this.version;
    return {
      'blueprintArn': blueprintArn,
      if (stage != null) 'stage': stage.value,
      if (version != null) 'version': version,
    };
  }
}

/// Blueprint stage enum.
///
/// @nodoc
class BlueprintStage {
  static const development = BlueprintStage._('DEVELOPMENT');
  static const live = BlueprintStage._('LIVE');

  final String value;

  const BlueprintStage._(this.value);

  static const values = [development, live];

  static BlueprintStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BlueprintStage._(value));

  @override
  bool operator ==(other) => other is BlueprintStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Event bridge configuration.
///
/// @nodoc
class EventBridgeConfiguration {
  /// Event bridge flag.
  final bool eventBridgeEnabled;

  EventBridgeConfiguration({
    required this.eventBridgeEnabled,
  });

  Map<String, dynamic> toJson() {
    final eventBridgeEnabled = this.eventBridgeEnabled;
    return {
      'eventBridgeEnabled': eventBridgeEnabled,
    };
  }
}

/// Data automation stage.
///
/// @nodoc
class DataAutomationStage {
  static const live = DataAutomationStage._('LIVE');
  static const development = DataAutomationStage._('DEVELOPMENT');

  final String value;

  const DataAutomationStage._(this.value);

  static const values = [live, development];

  static DataAutomationStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataAutomationStage._(value));

  @override
  bool operator ==(other) =>
      other is DataAutomationStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Config containing asset processing related knobs for all modalities
///
/// @nodoc
class AssetProcessingConfiguration {
  /// Video asset processing configuration
  final VideoAssetProcessingConfiguration? video;

  AssetProcessingConfiguration({
    this.video,
  });

  Map<String, dynamic> toJson() {
    final video = this.video;
    return {
      if (video != null) 'video': video,
    };
  }
}

/// Video asset processing configuration
///
/// @nodoc
class VideoAssetProcessingConfiguration {
  /// Delimits the segment of the input that will be processed
  final VideoSegmentConfiguration? segmentConfiguration;

  VideoAssetProcessingConfiguration({
    this.segmentConfiguration,
  });

  Map<String, dynamic> toJson() {
    final segmentConfiguration = this.segmentConfiguration;
    return {
      if (segmentConfiguration != null)
        'segmentConfiguration': segmentConfiguration,
    };
  }
}

/// Delimits the segment of the input that will be processed
///
/// @nodoc
class VideoSegmentConfiguration {
  /// Timestamp segment
  final TimestampSegment? timestampSegment;

  VideoSegmentConfiguration({
    this.timestampSegment,
  });

  Map<String, dynamic> toJson() {
    final timestampSegment = this.timestampSegment;
    return {
      if (timestampSegment != null) 'timestampSegment': timestampSegment,
    };
  }
}

/// Timestamp segment
///
/// @nodoc
class TimestampSegment {
  /// End timestamp in milliseconds
  final int endTimeMillis;

  /// Start timestamp in milliseconds
  final int startTimeMillis;

  TimestampSegment({
    required this.endTimeMillis,
    required this.startTimeMillis,
  });

  Map<String, dynamic> toJson() {
    final endTimeMillis = this.endTimeMillis;
    final startTimeMillis = this.startTimeMillis;
    return {
      'endTimeMillis': endTimeMillis,
      'startTimeMillis': startTimeMillis,
    };
  }
}

/// Semantic modality enum
///
/// @nodoc
class SemanticModality {
  static const document = SemanticModality._('DOCUMENT');
  static const image = SemanticModality._('IMAGE');
  static const audio = SemanticModality._('AUDIO');
  static const video = SemanticModality._('VIDEO');

  final String value;

  const SemanticModality._(this.value);

  static const values = [document, image, audio, video];

  static SemanticModality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SemanticModality._(value));

  @override
  bool operator ==(other) => other is SemanticModality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Results for an output segment
///
/// @nodoc
class OutputSegment {
  /// Custom output response
  final String? customOutput;

  /// Status of blueprint match
  final CustomOutputStatus? customOutputStatus;

  /// Standard output response
  final String? standardOutput;

  OutputSegment({
    this.customOutput,
    this.customOutputStatus,
    this.standardOutput,
  });

  factory OutputSegment.fromJson(Map<String, dynamic> json) {
    return OutputSegment(
      customOutput: json['customOutput'] as String?,
      customOutputStatus: (json['customOutputStatus'] as String?)
          ?.let(CustomOutputStatus.fromString),
      standardOutput: json['standardOutput'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customOutput = this.customOutput;
    final customOutputStatus = this.customOutputStatus;
    final standardOutput = this.standardOutput;
    return {
      if (customOutput != null) 'customOutput': customOutput,
      if (customOutputStatus != null)
        'customOutputStatus': customOutputStatus.value,
      if (standardOutput != null) 'standardOutput': standardOutput,
    };
  }
}

/// Custom output status enum
///
/// @nodoc
class CustomOutputStatus {
  static const match = CustomOutputStatus._('MATCH');
  static const noMatch = CustomOutputStatus._('NO_MATCH');

  final String value;

  const CustomOutputStatus._(this.value);

  static const values = [match, noMatch];

  static CustomOutputStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomOutputStatus._(value));

  @override
  bool operator ==(other) =>
      other is CustomOutputStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Input configuration for synchronous API
///
/// @nodoc
class SyncInputConfiguration {
  /// Input data as bytes
  final Uint8List? bytes;

  /// S3 URI of the input data
  final String? s3Uri;

  SyncInputConfiguration({
    this.bytes,
    this.s3Uri,
  });

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final s3Uri = this.s3Uri;
    return {
      if (bytes != null) 'bytes': base64Encode(bytes),
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
