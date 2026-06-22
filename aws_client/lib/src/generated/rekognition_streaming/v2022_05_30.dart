// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2022_05_30.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// A real-time video processing service based on Rekognition. This section
/// documents the API operations for Rekognition Face Liveness.
///
/// <b>Amazon Rekognition Face Liveness</b>
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_CreateFaceLivenessSession.html">CreateFaceLivenessSession</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_GetFaceLivenessSessionResults.html">GetFaceLivenessSessionResults</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/rekognition/latest/APIReference/API_rekognitionstreaming_StartFaceLivenessSession.html">StartFaceLivenessSession</a>
/// </li>
/// </ul>
class RekognitionStreaming {
  final _s.RestJsonProtocol _protocol;
  factory RekognitionStreaming({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'streaming-rekognition',
      signingName: 'rekognition',
    );
    return RekognitionStreaming._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  RekognitionStreaming._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Starts a Face Liveness video stream and liveness detection process for a
  /// given session.
  ///
  /// Requires <code>sessionId</code>, <code>ChallengeVersions</code>,
  /// <code>VideoWidth</code>, <code>VideoHeight</code> and a
  /// <code>RequestEventStream</code> as input. The event stream contains
  /// information about different events for the session, including the
  /// challenge information used for verification.
  ///
  /// The maximum video size for Face Liveness is 10 MB. Face Liveness throws a
  /// <code>ValidationException</code> if the video does not match the necessary
  /// formatting and size parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [SessionNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [challengeVersions] :
  /// String containing comma separated list of challenge versions supported by
  /// client.
  ///
  /// Parameter [sessionId] :
  /// A unique 128-bit UUID. Used to uniquely identify the session and also acta
  /// as an idempotency token for all operations associated with the session.
  ///
  /// Parameter [videoHeight] :
  /// The height of the video object included in a request to start a Face
  /// Liveness session.
  ///
  /// Parameter [videoWidth] :
  /// The width of the video object included in a request to start a Face
  /// Liveness session.
  ///
  /// Parameter [livenessRequestStream] :
  /// Information regarding the request stream for a Face Liveness session.
  Future<StartFaceLivenessSessionResponse> startFaceLivenessSession({
    required String challengeVersions,
    required String sessionId,
    required String videoHeight,
    required String videoWidth,
    LivenessRequestStream? livenessRequestStream,
  }) async {
    final headers = <String, String>{
      'x-amz-rekognition-streaming-liveness-challenge-versions':
          challengeVersions.toString(),
      'x-amz-rekognition-streaming-liveness-session-id': sessionId.toString(),
      'x-amz-rekognition-streaming-liveness-video-height':
          videoHeight.toString(),
      'x-amz-rekognition-streaming-liveness-video-width': videoWidth.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: livenessRequestStream,
      method: 'POST',
      requestUri: '/start-face-liveness-session',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartFaceLivenessSessionResponse(
      livenessResponseStream: LivenessResponseStream.fromJson($json),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-rekognition-streaming-liveness-session-id')!,
    );
  }
}

/// @nodoc
class StartFaceLivenessSessionResponse {
  /// The ID that identifies a Face Liveness session.
  final String sessionId;

  /// Information regarding the response stream for a Face Liveness session.
  final LivenessResponseStream? livenessResponseStream;

  StartFaceLivenessSessionResponse({
    required this.sessionId,
    this.livenessResponseStream,
  });

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final livenessResponseStream = this.livenessResponseStream;
    return {
      if (livenessResponseStream != null)
        'LivenessResponseStream': livenessResponseStream,
    };
  }
}

/// Unexpected error during processing of request.
///
/// @nodoc
class InternalServerException implements _s.AwsException {
  final String? code;
  final String? message;

  InternalServerException({
    this.code,
    this.message,
  });

  factory InternalServerException.fromJson(Map<String, dynamic> json) {
    return InternalServerException(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

/// Occurs when a request would cause a service quota to be exceeded.
///
/// @nodoc
class ServiceQuotaExceededException implements _s.AwsException {
  final String? code;
  final String? message;

  ServiceQuotaExceededException({
    this.code,
    this.message,
  });

  factory ServiceQuotaExceededException.fromJson(Map<String, dynamic> json) {
    return ServiceQuotaExceededException(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

/// Service-wide throttling to recover from an operational event or service is
/// not able to scale.
///
/// @nodoc
class ServiceUnavailableException implements _s.AwsException {
  final String? code;
  final String? message;

  ServiceUnavailableException({
    this.code,
    this.message,
  });

  factory ServiceUnavailableException.fromJson(Map<String, dynamic> json) {
    return ServiceUnavailableException(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

/// A request was denied due to request throttling. Occurs when too many
/// requests were made by a user (exceeding their service quota), the service
/// isn't able to scale, or a service-wide throttling was done to recover from
/// an operational event.
///
/// @nodoc
class ThrottlingException implements _s.AwsException {
  final String? code;
  final String? message;

  ThrottlingException({
    this.code,
    this.message,
  });

  factory ThrottlingException.fromJson(Map<String, dynamic> json) {
    return ThrottlingException(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

/// The input fails to satisfy the constraints specified by the service.
/// Potential reasons inlcude: video quality or size is invalid, video container
/// format not supported, video does not have enough information - no person
/// detected in video, request couldn't be parsed or is invalid, session has
/// expired or is invalid, S3 bucket is invalid/in another AWS region, KMS Key
/// is invalid.
///
/// @nodoc
class ValidationException implements _s.AwsException {
  final String? code;
  final String? message;

  ValidationException({
    this.code,
    this.message,
  });

  factory ValidationException.fromJson(Map<String, dynamic> json) {
    return ValidationException(
      code: json['Code'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code,
      if (message != null) 'Message': message,
    };
  }
}

/// Contains information event details and exception information for a Face
/// Liveness verification response stream.
///
/// @nodoc
class LivenessResponseStream {
  final ChallengeEvent? challengeEvent;

  /// Notification that disconnection event has occurred to a Face Liveness
  /// session.
  final DisconnectionEvent? disconnectionEvent;

  /// Notification that an InternalServerException occurred during a Face Liveness
  /// session.
  final InternalServerException? internalServerException;

  /// Details for a server session information event.
  final ServerSessionInformationEvent? serverSessionInformationEvent;

  /// Notification that a ServiceQuotaExceededException occurred during a Face
  /// Liveness session.
  final ServiceQuotaExceededException? serviceQuotaExceededException;

  /// Notification that a ServiceUnavailableException occurred during a Face
  /// Liveness session.
  final ServiceUnavailableException? serviceUnavailableException;

  /// Notification that a ThrottlingException occurred during a Face Liveness
  /// session.
  final ThrottlingException? throttlingException;

  /// Notification that a ValidationException occurred during a Face Liveness
  /// session.
  final ValidationException? validationException;

  LivenessResponseStream({
    this.challengeEvent,
    this.disconnectionEvent,
    this.internalServerException,
    this.serverSessionInformationEvent,
    this.serviceQuotaExceededException,
    this.serviceUnavailableException,
    this.throttlingException,
    this.validationException,
  });

  factory LivenessResponseStream.fromJson(Map<String, dynamic> json) {
    return LivenessResponseStream(
      challengeEvent: json['ChallengeEvent'] != null
          ? ChallengeEvent.fromJson(
              json['ChallengeEvent'] as Map<String, dynamic>)
          : null,
      disconnectionEvent: json['DisconnectionEvent'] != null
          ? DisconnectionEvent.fromJson(
              json['DisconnectionEvent'] as Map<String, dynamic>)
          : null,
      internalServerException: json['InternalServerException'] != null
          ? InternalServerException.fromJson(
              json['InternalServerException'] as Map<String, dynamic>)
          : null,
      serverSessionInformationEvent:
          json['ServerSessionInformationEvent'] != null
              ? ServerSessionInformationEvent.fromJson(
                  json['ServerSessionInformationEvent'] as Map<String, dynamic>)
              : null,
      serviceQuotaExceededException:
          json['ServiceQuotaExceededException'] != null
              ? ServiceQuotaExceededException.fromJson(
                  json['ServiceQuotaExceededException'] as Map<String, dynamic>)
              : null,
      serviceUnavailableException: json['ServiceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['ServiceUnavailableException'] as Map<String, dynamic>)
          : null,
      throttlingException: json['ThrottlingException'] != null
          ? ThrottlingException.fromJson(
              json['ThrottlingException'] as Map<String, dynamic>)
          : null,
      validationException: json['ValidationException'] != null
          ? ValidationException.fromJson(
              json['ValidationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final challengeEvent = this.challengeEvent;
    final disconnectionEvent = this.disconnectionEvent;
    final internalServerException = this.internalServerException;
    final serverSessionInformationEvent = this.serverSessionInformationEvent;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final serviceUnavailableException = this.serviceUnavailableException;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (challengeEvent != null) 'ChallengeEvent': challengeEvent,
      if (disconnectionEvent != null) 'DisconnectionEvent': disconnectionEvent,
      if (internalServerException != null)
        'InternalServerException': internalServerException,
      if (serverSessionInformationEvent != null)
        'ServerSessionInformationEvent': serverSessionInformationEvent,
      if (serviceQuotaExceededException != null)
        'ServiceQuotaExceededException': serviceQuotaExceededException,
      if (serviceUnavailableException != null)
        'ServiceUnavailableException': serviceUnavailableException,
      if (throttlingException != null)
        'ThrottlingException': throttlingException,
      if (validationException != null)
        'ValidationException': validationException,
    };
  }
}

/// Event containing session information for the server.
///
/// @nodoc
class ServerSessionInformationEvent {
  /// Contains the session information sent by the server..
  final SessionInformation sessionInformation;

  ServerSessionInformationEvent({
    required this.sessionInformation,
  });

  factory ServerSessionInformationEvent.fromJson(Map<String, dynamic> json) {
    return ServerSessionInformationEvent(
      sessionInformation: SessionInformation.fromJson(
          (json['SessionInformation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final sessionInformation = this.sessionInformation;
    return {
      'SessionInformation': sessionInformation,
    };
  }
}

/// Contains information regarding if a disconnection event took place during
/// the Face Liveness session. Disconnection events may indicate processing is
/// complete at the server side.
///
/// @nodoc
class DisconnectionEvent {
  /// The timestamp that a disconnection event took place at.
  final int timestampMillis;

  DisconnectionEvent({
    required this.timestampMillis,
  });

  factory DisconnectionEvent.fromJson(Map<String, dynamic> json) {
    return DisconnectionEvent(
      timestampMillis: (json['TimestampMillis'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final timestampMillis = this.timestampMillis;
    return {
      'TimestampMillis': timestampMillis,
    };
  }
}

/// @nodoc
class ChallengeEvent {
  final ChallengeType type;
  final String version;

  ChallengeEvent({
    required this.type,
    required this.version,
  });

  factory ChallengeEvent.fromJson(Map<String, dynamic> json) {
    return ChallengeEvent(
      type: ChallengeType.fromString((json['Type'] as String?) ?? ''),
      version: (json['Version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final version = this.version;
    return {
      'Type': type.value,
      'Version': version,
    };
  }
}

/// @nodoc
class ChallengeType {
  static const faceMovementAndLightChallenge =
      ChallengeType._('FaceMovementAndLightChallenge');
  static const faceMovementChallenge = ChallengeType._('FaceMovementChallenge');

  final String value;

  const ChallengeType._(this.value);

  static const values = [faceMovementAndLightChallenge, faceMovementChallenge];

  static ChallengeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChallengeType._(value));

  @override
  bool operator ==(other) => other is ChallengeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information required for the streaming session.
///
/// @nodoc
class SessionInformation {
  /// Object containing information of Face Liveness challenge to be performed by
  /// the client. The information is used to construct the challenges at the
  /// client's SDK.
  final ServerChallenge challenge;

  SessionInformation({
    required this.challenge,
  });

  factory SessionInformation.fromJson(Map<String, dynamic> json) {
    return SessionInformation(
      challenge: ServerChallenge.fromJson(
          (json['Challenge'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final challenge = this.challenge;
    return {
      'Challenge': challenge,
    };
  }
}

/// Information on the challenge sent by the server.
///
/// @nodoc
class ServerChallenge {
  /// Paramteters and configuration information for the face movement and light
  /// sequence challenges.
  final FaceMovementAndLightServerChallenge? faceMovementAndLightChallenge;
  final FaceMovementServerChallenge? faceMovementChallenge;

  ServerChallenge({
    this.faceMovementAndLightChallenge,
    this.faceMovementChallenge,
  });

  factory ServerChallenge.fromJson(Map<String, dynamic> json) {
    return ServerChallenge(
      faceMovementAndLightChallenge:
          json['FaceMovementAndLightChallenge'] != null
              ? FaceMovementAndLightServerChallenge.fromJson(
                  json['FaceMovementAndLightChallenge'] as Map<String, dynamic>)
              : null,
      faceMovementChallenge: json['FaceMovementChallenge'] != null
          ? FaceMovementServerChallenge.fromJson(
              json['FaceMovementChallenge'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final faceMovementAndLightChallenge = this.faceMovementAndLightChallenge;
    final faceMovementChallenge = this.faceMovementChallenge;
    return {
      if (faceMovementAndLightChallenge != null)
        'FaceMovementAndLightChallenge': faceMovementAndLightChallenge,
      if (faceMovementChallenge != null)
        'FaceMovementChallenge': faceMovementChallenge,
    };
  }
}

/// Contains information regarding the <code>OvalParameters</code> and
/// <code>LightChallengeType</code> for a challenge.
///
/// @nodoc
class FaceMovementAndLightServerChallenge {
  /// Configurations for attributes of the Face Liveness movement and light
  /// challenges.
  final ChallengeConfig challengeConfig;

  /// Used to generate a list of color sequences to be displayed on a user's
  /// screen.
  final List<ColorSequence> colorSequences;

  /// Information on the type of colored light challenge.
  final LightChallengeType lightChallengeType;

  /// The parameters needed for an oval to display and to complete oval match
  /// challenge.
  final OvalParameters ovalParameters;

  FaceMovementAndLightServerChallenge({
    required this.challengeConfig,
    required this.colorSequences,
    required this.lightChallengeType,
    required this.ovalParameters,
  });

  factory FaceMovementAndLightServerChallenge.fromJson(
      Map<String, dynamic> json) {
    return FaceMovementAndLightServerChallenge(
      challengeConfig: ChallengeConfig.fromJson(
          (json['ChallengeConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      colorSequences: ((json['ColorSequences'] as List?) ?? const [])
          .nonNulls
          .map((e) => ColorSequence.fromJson(e as Map<String, dynamic>))
          .toList(),
      lightChallengeType: LightChallengeType.fromString(
          (json['LightChallengeType'] as String?) ?? ''),
      ovalParameters: OvalParameters.fromJson(
          (json['OvalParameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final challengeConfig = this.challengeConfig;
    final colorSequences = this.colorSequences;
    final lightChallengeType = this.lightChallengeType;
    final ovalParameters = this.ovalParameters;
    return {
      'ChallengeConfig': challengeConfig,
      'ColorSequences': colorSequences,
      'LightChallengeType': lightChallengeType.value,
      'OvalParameters': ovalParameters,
    };
  }
}

/// @nodoc
class FaceMovementServerChallenge {
  final ChallengeConfig challengeConfig;
  final OvalParameters ovalParameters;

  FaceMovementServerChallenge({
    required this.challengeConfig,
    required this.ovalParameters,
  });

  factory FaceMovementServerChallenge.fromJson(Map<String, dynamic> json) {
    return FaceMovementServerChallenge(
      challengeConfig: ChallengeConfig.fromJson(
          (json['ChallengeConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      ovalParameters: OvalParameters.fromJson(
          (json['OvalParameters'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final challengeConfig = this.challengeConfig;
    final ovalParameters = this.ovalParameters;
    return {
      'ChallengeConfig': challengeConfig,
      'OvalParameters': ovalParameters,
    };
  }
}

/// Oval parameters need for oval display to complete oval match challenge.
///
/// @nodoc
class OvalParameters {
  /// X-axis co-ordinate of for center of oval
  final double centerX;

  /// Y-axis co-ordinate of for center of oval
  final double centerY;

  /// Height of the oval
  final double height;

  /// Width of the oval
  final double width;

  OvalParameters({
    required this.centerX,
    required this.centerY,
    required this.height,
    required this.width,
  });

  factory OvalParameters.fromJson(Map<String, dynamic> json) {
    return OvalParameters(
      centerX: (json['CenterX'] as double?) ?? 0,
      centerY: (json['CenterY'] as double?) ?? 0,
      height: (json['Height'] as double?) ?? 0,
      width: (json['Width'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final centerX = this.centerX;
    final centerY = this.centerY;
    final height = this.height;
    final width = this.width;
    return {
      'CenterX': centerX,
      'CenterY': centerY,
      'Height': height,
      'Width': width,
    };
  }
}

/// Configuration options for Face Liveness challenges performed at the client
/// side.
///
/// @nodoc
class ChallengeConfig {
  /// Threshold for face detection done using blaze face.
  final double? blazeFaceDetectionThreshold;

  /// Threshold for face distance threshold face liveness challenge.
  final double? faceDistanceThreshold;

  /// Threshold for the maximum distance that face can be from the camera before
  /// face oval match challenge starts.
  final double? faceDistanceThresholdMax;

  /// Threshold for the minimum distance that face can be from the camera before
  /// face oval match challenge starts.
  final double? faceDistanceThresholdMin;

  /// Threshold for height during face IOU (Intersection over Union) match.
  final double? faceIouHeightThreshold;

  /// Threshold for width during face IOU (Intersection over Union) match.
  final double? faceIouWidthThreshold;
  final int? ovalFitTimeout;

  /// Height to width ratio of oval used for face oval match.
  final double? ovalHeightWidthRatio;

  /// Threshold for height during oval IOU (Intersection over Union) match.
  final double? ovalIouHeightThreshold;

  /// Threshold for face oval match using IoU (Intersection over Union).
  final double? ovalIouThreshold;

  /// Threshold for width during oval IOU (Intersection over Union) match.
  final double? ovalIouWidthThreshold;

  ChallengeConfig({
    this.blazeFaceDetectionThreshold,
    this.faceDistanceThreshold,
    this.faceDistanceThresholdMax,
    this.faceDistanceThresholdMin,
    this.faceIouHeightThreshold,
    this.faceIouWidthThreshold,
    this.ovalFitTimeout,
    this.ovalHeightWidthRatio,
    this.ovalIouHeightThreshold,
    this.ovalIouThreshold,
    this.ovalIouWidthThreshold,
  });

  factory ChallengeConfig.fromJson(Map<String, dynamic> json) {
    return ChallengeConfig(
      blazeFaceDetectionThreshold:
          json['BlazeFaceDetectionThreshold'] as double?,
      faceDistanceThreshold: json['FaceDistanceThreshold'] as double?,
      faceDistanceThresholdMax: json['FaceDistanceThresholdMax'] as double?,
      faceDistanceThresholdMin: json['FaceDistanceThresholdMin'] as double?,
      faceIouHeightThreshold: json['FaceIouHeightThreshold'] as double?,
      faceIouWidthThreshold: json['FaceIouWidthThreshold'] as double?,
      ovalFitTimeout: json['OvalFitTimeout'] as int?,
      ovalHeightWidthRatio: json['OvalHeightWidthRatio'] as double?,
      ovalIouHeightThreshold: json['OvalIouHeightThreshold'] as double?,
      ovalIouThreshold: json['OvalIouThreshold'] as double?,
      ovalIouWidthThreshold: json['OvalIouWidthThreshold'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final blazeFaceDetectionThreshold = this.blazeFaceDetectionThreshold;
    final faceDistanceThreshold = this.faceDistanceThreshold;
    final faceDistanceThresholdMax = this.faceDistanceThresholdMax;
    final faceDistanceThresholdMin = this.faceDistanceThresholdMin;
    final faceIouHeightThreshold = this.faceIouHeightThreshold;
    final faceIouWidthThreshold = this.faceIouWidthThreshold;
    final ovalFitTimeout = this.ovalFitTimeout;
    final ovalHeightWidthRatio = this.ovalHeightWidthRatio;
    final ovalIouHeightThreshold = this.ovalIouHeightThreshold;
    final ovalIouThreshold = this.ovalIouThreshold;
    final ovalIouWidthThreshold = this.ovalIouWidthThreshold;
    return {
      if (blazeFaceDetectionThreshold != null)
        'BlazeFaceDetectionThreshold': blazeFaceDetectionThreshold,
      if (faceDistanceThreshold != null)
        'FaceDistanceThreshold': faceDistanceThreshold,
      if (faceDistanceThresholdMax != null)
        'FaceDistanceThresholdMax': faceDistanceThresholdMax,
      if (faceDistanceThresholdMin != null)
        'FaceDistanceThresholdMin': faceDistanceThresholdMin,
      if (faceIouHeightThreshold != null)
        'FaceIouHeightThreshold': faceIouHeightThreshold,
      if (faceIouWidthThreshold != null)
        'FaceIouWidthThreshold': faceIouWidthThreshold,
      if (ovalFitTimeout != null) 'OvalFitTimeout': ovalFitTimeout,
      if (ovalHeightWidthRatio != null)
        'OvalHeightWidthRatio': ovalHeightWidthRatio,
      if (ovalIouHeightThreshold != null)
        'OvalIouHeightThreshold': ovalIouHeightThreshold,
      if (ovalIouThreshold != null) 'OvalIouThreshold': ovalIouThreshold,
      if (ovalIouWidthThreshold != null)
        'OvalIouWidthThreshold': ovalIouWidthThreshold,
    };
  }
}

/// @nodoc
class LightChallengeType {
  static const sequential = LightChallengeType._('SEQUENTIAL');

  final String value;

  const LightChallengeType._(this.value);

  static const values = [sequential];

  static LightChallengeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LightChallengeType._(value));

  @override
  bool operator ==(other) =>
      other is LightChallengeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A color sequence to be displayed on the user’s screen.
///
/// @nodoc
class ColorSequence {
  /// Duration in milliseconds for which a given color in the color sequence will
  /// down-scroll before taking over full screen.
  final double downscrollDuration;

  /// Duration in milliseconds for which a given flat color in the color sequence
  /// will be displayed on the full screen.
  final double flatDisplayDuration;

  /// Represents the colors in a given ColorSequence to be flashed to the end
  /// user, with each color represented in RGB values.
  final FreshnessColor freshnessColor;

  ColorSequence({
    required this.downscrollDuration,
    required this.flatDisplayDuration,
    required this.freshnessColor,
  });

  factory ColorSequence.fromJson(Map<String, dynamic> json) {
    return ColorSequence(
      downscrollDuration: (json['DownscrollDuration'] as double?) ?? 0,
      flatDisplayDuration: (json['FlatDisplayDuration'] as double?) ?? 0,
      freshnessColor: FreshnessColor.fromJson(
          (json['FreshnessColor'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final downscrollDuration = this.downscrollDuration;
    final flatDisplayDuration = this.flatDisplayDuration;
    final freshnessColor = this.freshnessColor;
    return {
      'DownscrollDuration': downscrollDuration,
      'FlatDisplayDuration': flatDisplayDuration,
      'FreshnessColor': freshnessColor,
    };
  }
}

/// Represents the colors to be flashed to the end user, each color represented
/// in RGB values.
///
/// @nodoc
class FreshnessColor {
  /// RGB values for a color to be flashed to the end user.
  final List<int> rgb;

  FreshnessColor({
    required this.rgb,
  });

  factory FreshnessColor.fromJson(Map<String, dynamic> json) {
    return FreshnessColor(
      rgb: ((json['RGB'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rgb = this.rgb;
    return {
      'RGB': rgb,
    };
  }
}

/// Contains information regarding video events and client session details for a
/// Face Liveness verification request stream.
///
/// @nodoc
class LivenessRequestStream {
  /// Information event for the client session for a given Face Liveness request
  /// stream.
  final ClientSessionInformationEvent? clientSessionInformationEvent;

  /// Contains video events for a Face Liveness request stream.
  final VideoEvent? videoEvent;

  LivenessRequestStream({
    this.clientSessionInformationEvent,
    this.videoEvent,
  });

  Map<String, dynamic> toJson() {
    final clientSessionInformationEvent = this.clientSessionInformationEvent;
    final videoEvent = this.videoEvent;
    return {
      if (clientSessionInformationEvent != null)
        'ClientSessionInformationEvent': clientSessionInformationEvent,
      if (videoEvent != null) 'VideoEvent': videoEvent,
    };
  }
}

/// Contains the video chunk blob.
///
/// @nodoc
class VideoEvent {
  /// Milisecond timestamp for a video chunk in a video event.
  final int? timestampMillis;

  /// The video chunk for a video event.
  final Uint8List? videoChunk;

  VideoEvent({
    this.timestampMillis,
    this.videoChunk,
  });

  Map<String, dynamic> toJson() {
    final timestampMillis = this.timestampMillis;
    final videoChunk = this.videoChunk;
    return {
      if (timestampMillis != null) 'TimestampMillis': timestampMillis,
      if (videoChunk != null) 'VideoChunk': base64Encode(videoChunk),
    };
  }
}

/// Any information that the client needs to send for the streaming session. For
/// face movement challenge, it will contain information like initial face
/// position and target face position.
///
/// @nodoc
class ClientSessionInformationEvent {
  /// Contains information on FaceMovementAndLightChellenge, TargetFace, and
  /// ColorDisplayed, for a given Challenge.
  final ClientChallenge challenge;

  ClientSessionInformationEvent({
    required this.challenge,
  });

  Map<String, dynamic> toJson() {
    final challenge = this.challenge;
    return {
      'Challenge': challenge,
    };
  }
}

/// Object containing information for Face Liveness challenges performed at the
/// client side.
///
/// @nodoc
class ClientChallenge {
  /// Information about a face movement and light challenge type.
  final FaceMovementAndLightClientChallenge? faceMovementAndLightChallenge;
  final FaceMovementClientChallenge? faceMovementChallenge;

  ClientChallenge({
    this.faceMovementAndLightChallenge,
    this.faceMovementChallenge,
  });

  Map<String, dynamic> toJson() {
    final faceMovementAndLightChallenge = this.faceMovementAndLightChallenge;
    final faceMovementChallenge = this.faceMovementChallenge;
    return {
      if (faceMovementAndLightChallenge != null)
        'FaceMovementAndLightChallenge': faceMovementAndLightChallenge,
      if (faceMovementChallenge != null)
        'FaceMovementChallenge': faceMovementChallenge,
    };
  }
}

/// Holds information about the type of face movement and light challenges that
/// need to be performed.
///
/// @nodoc
class FaceMovementAndLightClientChallenge {
  /// An ID that uniquely identifies a challenge from a client.
  final String challengeId;

  /// Contains information regarding SequenceNumber, CurrentColor, PreviousColor,
  /// and CurrentColorStartTimestamp for a challenge.
  final ColorDisplayed? colorDisplayed;

  /// Contains the bounding box of the initial face position for the user on the
  /// device screen. Also contains an epoch timestamp of when the user was
  /// detected in this position. Used for Face Liveness detection.
  final InitialFace? initialFace;

  /// Contains the face position bounding box for the user on the device's screen,
  /// set at the target location constructed for the challenge. Generated using a
  /// precise oval location depending on the provided video
  ///
  /// dimensions in the input stream. Contains start and end epoch timestamp of
  /// when the user was detected in this position.
  final TargetFace? targetFace;

  /// Epoch timestamp indicating end of video recording.
  final int? videoEndTimestamp;

  /// Epoch timestamp indicating start of video recording.
  final int? videoStartTimestamp;

  FaceMovementAndLightClientChallenge({
    required this.challengeId,
    this.colorDisplayed,
    this.initialFace,
    this.targetFace,
    this.videoEndTimestamp,
    this.videoStartTimestamp,
  });

  Map<String, dynamic> toJson() {
    final challengeId = this.challengeId;
    final colorDisplayed = this.colorDisplayed;
    final initialFace = this.initialFace;
    final targetFace = this.targetFace;
    final videoEndTimestamp = this.videoEndTimestamp;
    final videoStartTimestamp = this.videoStartTimestamp;
    return {
      'ChallengeId': challengeId,
      if (colorDisplayed != null) 'ColorDisplayed': colorDisplayed,
      if (initialFace != null) 'InitialFace': initialFace,
      if (targetFace != null) 'TargetFace': targetFace,
      if (videoEndTimestamp != null) 'VideoEndTimestamp': videoEndTimestamp,
      if (videoStartTimestamp != null)
        'VideoStartTimestamp': videoStartTimestamp,
    };
  }
}

/// @nodoc
class FaceMovementClientChallenge {
  final String challengeId;
  final InitialFace? initialFace;
  final TargetFace? targetFace;
  final int? videoEndTimestamp;
  final int? videoStartTimestamp;

  FaceMovementClientChallenge({
    required this.challengeId,
    this.initialFace,
    this.targetFace,
    this.videoEndTimestamp,
    this.videoStartTimestamp,
  });

  Map<String, dynamic> toJson() {
    final challengeId = this.challengeId;
    final initialFace = this.initialFace;
    final targetFace = this.targetFace;
    final videoEndTimestamp = this.videoEndTimestamp;
    final videoStartTimestamp = this.videoStartTimestamp;
    return {
      'ChallengeId': challengeId,
      if (initialFace != null) 'InitialFace': initialFace,
      if (targetFace != null) 'TargetFace': targetFace,
      if (videoEndTimestamp != null) 'VideoEndTimestamp': videoEndTimestamp,
      if (videoStartTimestamp != null)
        'VideoStartTimestamp': videoStartTimestamp,
    };
  }
}

/// Contains bounding box of initial face position of the user on the device
/// screen. Contains an epoch timestamp of when the user was detected in this
/// position. Used for Face Liveness detection.
///
/// @nodoc
class InitialFace {
  /// The bounding box for the initial face position of the user on the device
  /// screen.
  final BoundingBox boundingBox;

  /// Timestamp that a face was initially detected at.
  final int initialFaceDetectedTimestamp;

  InitialFace({
    required this.boundingBox,
    required this.initialFaceDetectedTimestamp,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final initialFaceDetectedTimestamp = this.initialFaceDetectedTimestamp;
    return {
      'BoundingBox': boundingBox,
      'InitialFaceDetectedTimestamp': initialFaceDetectedTimestamp,
    };
  }
}

/// Contains bounding box of face position of the user on the device screen at
/// target location constructed for the challenge. This is generated using the
/// random offsets provided by the server to the client at session start. Also
/// contains start and end epoch timestamp of when the user was detected in this
/// position.
///
/// @nodoc
class TargetFace {
  /// A bounding box for the target face.
  final BoundingBox boundingBox;

  /// Ending timestamp at which a face was detected in the target position.
  final int faceDetectedInTargetPositionEndTimestamp;

  /// Starting timestamp at which a face was detected in the target position.
  final int faceDetectedInTargetPositionStartTimestamp;

  TargetFace({
    required this.boundingBox,
    required this.faceDetectedInTargetPositionEndTimestamp,
    required this.faceDetectedInTargetPositionStartTimestamp,
  });

  Map<String, dynamic> toJson() {
    final boundingBox = this.boundingBox;
    final faceDetectedInTargetPositionEndTimestamp =
        this.faceDetectedInTargetPositionEndTimestamp;
    final faceDetectedInTargetPositionStartTimestamp =
        this.faceDetectedInTargetPositionStartTimestamp;
    return {
      'BoundingBox': boundingBox,
      'FaceDetectedInTargetPositionEndTimestamp':
          faceDetectedInTargetPositionEndTimestamp,
      'FaceDetectedInTargetPositionStartTimestamp':
          faceDetectedInTargetPositionStartTimestamp,
    };
  }
}

/// Identifies the bounding box around a given label, face, text, object of
/// interest, or personal protective equipment. The left (x-coordinate) and top
/// (y-coordinate) are coordinates representing the top and left sides of the
/// bounding box. Note that the upper-left corner of the image is the origin
/// (0,0).
///
/// The top and left values returned are ratios of the overall image size. For
/// example, if the input image is 700x200 pixels, and the top-left coordinate
/// of the bounding box is 350x50 pixels, the API returns a left value of 0.5
/// (350/700) and a top value of 0.25 (50/200).
///
/// The width and height values represent the dimensions of the bounding box as
/// a ratio of the overall image dimension. For example, if the input image is
/// 700x200 pixels, and the bounding box width is 70 pixels, the width returned
/// is 0.1.
///
/// @nodoc
class BoundingBox {
  /// Height of the bounding box as a ratio of the overall image height.
  final double height;

  /// Left coordinate of the bounding box as a ratio of overall image width.
  final double left;

  /// Top coordinate of the bounding box as a ratio of overall image height.
  final double top;

  /// Width of the bounding box as a ratio of the overall image width.
  final double width;

  BoundingBox({
    required this.height,
    required this.left,
    required this.top,
    required this.width,
  });

  Map<String, dynamic> toJson() {
    final height = this.height;
    final left = this.left;
    final top = this.top;
    final width = this.width;
    return {
      'Height': height,
      'Left': left,
      'Top': top,
      'Width': width,
    };
  }
}

/// Contains information regarding <code>SequenceNumber</code>,
/// <code>CurrentColor</code>, <code>PreviousColor</code>, and
/// <code>CurrentColorStartTimestamp</code>.
///
/// @nodoc
class ColorDisplayed {
  /// The current color being displayed on the screen (flat or downscrolled). It
  /// will contain a separate RGB list having 3 elements (each element can have
  /// values between 0 to 255).
  final FreshnessColor currentColor;

  /// Epoch timestamp of when the current color was displayed on the user screen.
  final int currentColorStartTimestamp;

  /// The order in which the current color was displayed on the screen.
  final int sequenceNumber;

  /// The previous color displayed on screen (flat or downscrolled). It will
  /// contain a separate RGB list having 3 elements (each element can have values
  /// between 0 to 255).
  final FreshnessColor? previousColor;

  ColorDisplayed({
    required this.currentColor,
    required this.currentColorStartTimestamp,
    required this.sequenceNumber,
    this.previousColor,
  });

  Map<String, dynamic> toJson() {
    final currentColor = this.currentColor;
    final currentColorStartTimestamp = this.currentColorStartTimestamp;
    final sequenceNumber = this.sequenceNumber;
    final previousColor = this.previousColor;
    return {
      'CurrentColor': currentColor,
      'CurrentColorStartTimestamp': currentColorStartTimestamp,
      'SequenceNumber': sequenceNumber,
      if (previousColor != null) 'PreviousColor': previousColor,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class SessionNotFoundException extends _s.GenericAwsException {
  SessionNotFoundException({String? type, String? message})
      : super(type: type, code: 'SessionNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(message: message),
  'SessionNotFoundException': (type, message) =>
      SessionNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
