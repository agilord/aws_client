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

/// <p/>
class KinesisVideoMedia {
  final _s.RestJsonProtocol _protocol;
  KinesisVideoMedia({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisvideo',
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

  /// Use this API to retrieve media content from a Kinesis video stream. In the
  /// request, you identify the stream name or stream Amazon Resource Name
  /// (ARN), and the starting chunk. Kinesis Video Streams then returns a stream
  /// of chunks in order by fragment number.
  /// <note>
  /// You must first call the <code>GetDataEndpoint</code> API to get an
  /// endpoint. Then send the <code>GetMedia</code> requests to this endpoint
  /// using the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/">--endpoint-url
  /// parameter</a>.
  /// </note>
  /// When you put media data (fragments) on a stream, Kinesis Video Streams
  /// stores each incoming fragment and related metadata in what is called a
  /// "chunk." For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_dataplane_PutMedia.html">PutMedia</a>.
  /// The <code>GetMedia</code> API returns a stream of these chunks starting
  /// from the chunk that you specify in the request.
  ///
  /// The following limits apply when using the <code>GetMedia</code> API:
  ///
  /// <ul>
  /// <li>
  /// A client can call <code>GetMedia</code> up to five times per second per
  /// stream.
  /// </li>
  /// <li>
  /// Kinesis Video Streams sends media data at a rate of up to 25 megabytes per
  /// second (or 200 megabits per second) during a <code>GetMedia</code>
  /// session.
  /// </li>
  /// </ul> <note>
  /// If an error is thrown after invoking a Kinesis Video Streams media API, in
  /// addition to the HTTP status code and the response body, it includes the
  /// following pieces of information:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-ErrorType</code> HTTP header – contains a more specific error
  /// type in addition to what the HTTP status code provides.
  /// </li>
  /// <li>
  /// <code>x-amz-RequestId</code> HTTP header – if you want to report an issue
  /// to AWS, the support team can better diagnose the problem if given the
  /// Request Id.
  /// </li>
  /// </ul>
  /// Both the HTTP status code and the ErrorType header can be utilized to make
  /// programmatic decisions about whether errors are retry-able and under what
  /// conditions, as well as provide information on what actions the client
  /// programmer might need to take in order to successfully try again.
  ///
  /// For more information, see the <b>Errors</b> section at the bottom of this
  /// topic, as well as <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html">Common
  /// Errors</a>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidEndpointException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ConnectionLimitExceededException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [startSelector] :
  /// Identifies the starting chunk to get from the specified stream.
  ///
  /// Parameter [streamARN] :
  /// The ARN of the stream from where you want to get the media content. If you
  /// don't specify the <code>streamARN</code>, you must specify the
  /// <code>streamName</code>.
  ///
  /// Parameter [streamName] :
  /// The Kinesis video stream name from where you want to get the media
  /// content. If you don't specify the <code>streamName</code>, you must
  /// specify the <code>streamARN</code>.
  Future<GetMediaOutput> getMedia({
    required StartSelector startSelector,
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      'StartSelector': startSelector,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/getMedia',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaOutput(
      payload: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }
}

class GetMediaOutput {
  /// The content type of the requested media.
  final String? contentType;

  /// The payload Kinesis Video Streams returns is a sequence of chunks from the
  /// specified stream. For information about the chunks, see . The chunks that
  /// Kinesis Video Streams returns in the <code>GetMedia</code> call also include
  /// the following additional Matroska (MKV) tags:
  ///
  /// <ul>
  /// <li>
  /// AWS_KINESISVIDEO_CONTINUATION_TOKEN (UTF-8 string) - In the event your
  /// <code>GetMedia</code> call terminates, you can use this continuation token
  /// in your next request to get the next chunk where the last request
  /// terminated.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_MILLIS_BEHIND_NOW (UTF-8 string) - Client applications can
  /// use this tag value to determine how far behind the chunk returned in the
  /// response is from the latest chunk on the stream.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_FRAGMENT_NUMBER - Fragment number returned in the chunk.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_SERVER_TIMESTAMP - Server timestamp of the fragment.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_PRODUCER_TIMESTAMP - Producer timestamp of the fragment.
  /// </li>
  /// </ul>
  /// The following tags will be present if an error occurs:
  ///
  /// <ul>
  /// <li>
  /// AWS_KINESISVIDEO_ERROR_CODE - String description of an error that caused
  /// GetMedia to stop.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_ERROR_ID: Integer code of the error.
  /// </li>
  /// </ul>
  /// The error codes are as follows:
  ///
  /// <ul>
  /// <li>
  /// 3002 - Error writing to the stream
  /// </li>
  /// <li>
  /// 4000 - Requested fragment is not found
  /// </li>
  /// <li>
  /// 4500 - Access denied for the stream's KMS key
  /// </li>
  /// <li>
  /// 4501 - Stream's KMS key is disabled
  /// </li>
  /// <li>
  /// 4502 - Validation error on the stream's KMS key
  /// </li>
  /// <li>
  /// 4503 - KMS key specified in the stream is unavailable
  /// </li>
  /// <li>
  /// 4504 - Invalid usage of the KMS key specified in the stream
  /// </li>
  /// <li>
  /// 4505 - Invalid state of the KMS key specified in the stream
  /// </li>
  /// <li>
  /// 4506 - Unable to find the KMS key specified in the stream
  /// </li>
  /// <li>
  /// 5000 - Internal error
  /// </li>
  /// </ul>
  final Uint8List? payload;

  GetMediaOutput({
    this.contentType,
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final payload = this.payload;
    return {
      if (payload != null) 'Payload': base64Encode(payload),
    };
  }
}

/// Identifies the chunk on the Kinesis video stream where you want the
/// <code>GetMedia</code> API to start returning media data. You have the
/// following options to identify the starting chunk:
///
/// <ul>
/// <li>
/// Choose the latest (or oldest) chunk.
/// </li>
/// <li>
/// Identify a specific chunk. You can identify a specific chunk either by
/// providing a fragment number or timestamp (server or producer).
/// </li>
/// <li>
/// Each chunk's metadata includes a continuation token as a Matroska (MKV) tag
/// (<code>AWS_KINESISVIDEO_CONTINUATION_TOKEN</code>). If your previous
/// <code>GetMedia</code> request terminated, you can use this tag value in your
/// next <code>GetMedia</code> request. The API then starts returning chunks
/// starting where the last API ended.
/// </li>
/// </ul>
class StartSelector {
  /// Identifies the fragment on the Kinesis video stream where you want to start
  /// getting the data from.
  ///
  /// <ul>
  /// <li>
  /// NOW - Start with the latest chunk on the stream.
  /// </li>
  /// <li>
  /// EARLIEST - Start with earliest available chunk on the stream.
  /// </li>
  /// <li>
  /// FRAGMENT_NUMBER - Start with the chunk after a specific fragment. You must
  /// also specify the <code>AfterFragmentNumber</code> parameter.
  /// </li>
  /// <li>
  /// PRODUCER_TIMESTAMP or SERVER_TIMESTAMP - Start with the chunk containing a
  /// fragment with the specified producer or server timestamp. You specify the
  /// timestamp by adding <code>StartTimestamp</code>.
  /// </li>
  /// <li>
  /// CONTINUATION_TOKEN - Read using the specified continuation token.
  /// </li>
  /// </ul> <note>
  /// If you choose the NOW, EARLIEST, or CONTINUATION_TOKEN as the
  /// <code>startSelectorType</code>, you don't provide any additional information
  /// in the <code>startSelector</code>.
  /// </note>
  final StartSelectorType startSelectorType;

  /// Specifies the fragment number from where you want the <code>GetMedia</code>
  /// API to start returning the fragments.
  final String? afterFragmentNumber;

  /// Continuation token that Kinesis Video Streams returned in the previous
  /// <code>GetMedia</code> response. The <code>GetMedia</code> API then starts
  /// with the chunk identified by the continuation token.
  final String? continuationToken;

  /// A timestamp value. This value is required if you choose the
  /// PRODUCER_TIMESTAMP or the SERVER_TIMESTAMP as the
  /// <code>startSelectorType</code>. The <code>GetMedia</code> API then starts
  /// with the chunk containing the fragment that has the specified timestamp.
  final DateTime? startTimestamp;

  StartSelector({
    required this.startSelectorType,
    this.afterFragmentNumber,
    this.continuationToken,
    this.startTimestamp,
  });

  Map<String, dynamic> toJson() {
    final startSelectorType = this.startSelectorType;
    final afterFragmentNumber = this.afterFragmentNumber;
    final continuationToken = this.continuationToken;
    final startTimestamp = this.startTimestamp;
    return {
      'StartSelectorType': startSelectorType.toValue(),
      if (afterFragmentNumber != null)
        'AfterFragmentNumber': afterFragmentNumber,
      if (continuationToken != null) 'ContinuationToken': continuationToken,
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

enum StartSelectorType {
  fragmentNumber,
  serverTimestamp,
  producerTimestamp,
  now,
  earliest,
  continuationToken,
}

extension StartSelectorTypeValueExtension on StartSelectorType {
  String toValue() {
    switch (this) {
      case StartSelectorType.fragmentNumber:
        return 'FRAGMENT_NUMBER';
      case StartSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
      case StartSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
      case StartSelectorType.now:
        return 'NOW';
      case StartSelectorType.earliest:
        return 'EARLIEST';
      case StartSelectorType.continuationToken:
        return 'CONTINUATION_TOKEN';
    }
  }
}

extension StartSelectorTypeFromString on String {
  StartSelectorType toStartSelectorType() {
    switch (this) {
      case 'FRAGMENT_NUMBER':
        return StartSelectorType.fragmentNumber;
      case 'SERVER_TIMESTAMP':
        return StartSelectorType.serverTimestamp;
      case 'PRODUCER_TIMESTAMP':
        return StartSelectorType.producerTimestamp;
      case 'NOW':
        return StartSelectorType.now;
      case 'EARLIEST':
        return StartSelectorType.earliest;
      case 'CONTINUATION_TOKEN':
        return StartSelectorType.continuationToken;
    }
    throw Exception('$this is not known in enum StartSelectorType');
  }
}

class ClientLimitExceededException extends _s.GenericAwsException {
  ClientLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'ClientLimitExceededException', message: message);
}

class ConnectionLimitExceededException extends _s.GenericAwsException {
  ConnectionLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ConnectionLimitExceededException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidEndpointException extends _s.GenericAwsException {
  InvalidEndpointException({String? type, String? message})
      : super(type: type, code: 'InvalidEndpointException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClientLimitExceededException': (type, message) =>
      ClientLimitExceededException(type: type, message: message),
  'ConnectionLimitExceededException': (type, message) =>
      ConnectionLimitExceededException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidEndpointException': (type, message) =>
      InvalidEndpointException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
