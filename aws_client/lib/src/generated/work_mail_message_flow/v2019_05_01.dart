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

/// The WorkMail Message Flow API provides access to email messages as they are
/// being sent and received by a WorkMail organization.
class WorkMailMessageFlow {
  final _s.RestJsonProtocol _protocol;
  WorkMailMessageFlow({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workmailmessageflow',
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

  /// Retrieves the raw content of an in-transit email message, in MIME format.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [messageId] :
  /// The identifier of the email message to retrieve.
  Future<GetRawMessageContentResponse> getRawMessageContent({
    required String messageId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/messages/${Uri.encodeComponent(messageId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRawMessageContentResponse(
      messageContent: await response.stream.toBytes(),
    );
  }

  /// Updates the raw content of an in-transit email message, in MIME format.
  ///
  /// This example describes how to update in-transit email message. For more
  /// information and examples for using this API, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/update-with-lambda.html">
  /// Updating message content with AWS Lambda</a>.
  /// <note>
  /// Updates to an in-transit message only appear when you call
  /// <code>PutRawMessageContent</code> from an AWS Lambda function configured
  /// with a synchronous <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/lambda.html#synchronous-rules">
  /// Run Lambda</a> rule. If you call <code>PutRawMessageContent</code> on a
  /// delivered or sent message, the message remains unchanged, even though <a
  /// href="https://docs.aws.amazon.com/workmail/latest/APIReference/API_messageflow_GetRawMessageContent.html">GetRawMessageContent</a>
  /// returns an updated message.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidContentLocation].
  /// May throw [MessageRejected].
  /// May throw [MessageFrozen].
  ///
  /// Parameter [content] :
  /// Describes the raw message content of the updated email message.
  ///
  /// Parameter [messageId] :
  /// The identifier of the email message being updated.
  Future<void> putRawMessageContent({
    required RawMessageContent content,
    required String messageId,
  }) async {
    final $payload = <String, dynamic>{
      'content': content,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/messages/${Uri.encodeComponent(messageId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class GetRawMessageContentResponse {
  /// The raw content of the email message, in MIME format.
  final Uint8List messageContent;

  GetRawMessageContentResponse({
    required this.messageContent,
  });

  Map<String, dynamic> toJson() {
    final messageContent = this.messageContent;
    return {
      'messageContent': base64Encode(messageContent),
    };
  }
}

class PutRawMessageContentResponse {
  PutRawMessageContentResponse();

  factory PutRawMessageContentResponse.fromJson(Map<String, dynamic> _) {
    return PutRawMessageContentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides the MIME content of the updated email message as an S3 object. All
/// MIME content must meet the following criteria:
///
/// <ul>
/// <li>
/// Each part of a multipart MIME message must be formatted properly.
/// </li>
/// <li>
/// Attachments must be of a content type that Amazon SES supports. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types-appendix.html">Unsupported
/// Attachment Types</a>.
/// </li>
/// <li>
/// If any of the MIME parts in a message contain content that is outside of the
/// 7-bit ASCII character range, we recommend encoding that content.
/// </li>
/// <li>
/// Per <a href="https://tools.ietf.org/html/rfc5321#section-4.5.3.1.6">RFC
/// 5321</a>, the maximum length of each line of text, including the
/// &lt;CRLF&gt;, must not exceed 1,000 characters.
/// </li>
/// <li>
/// The message must contain all the required header fields. Check the returned
/// error message for more information.
/// </li>
/// <li>
/// The value of immutable headers must remain unchanged. Check the returned
/// error message for more information.
/// </li>
/// <li>
/// Certain unique headers can only appear once. Check the returned error
/// message for more information.
/// </li>
/// </ul>
class RawMessageContent {
  /// The S3 reference of an email message.
  final S3Reference s3Reference;

  RawMessageContent({
    required this.s3Reference,
  });

  Map<String, dynamic> toJson() {
    final s3Reference = this.s3Reference;
    return {
      's3Reference': s3Reference,
    };
  }
}

/// Amazon S3 object representing the updated message content, in MIME format.
/// <note>
/// The region for the S3 bucket containing the S3 object must match the region
/// used for WorkMail operations. Also, for WorkMail to process an S3 object, it
/// must have permission to access that object. For more information, see <a
/// href="https://docs.aws.amazon.com/workmail/latest/adminguide/update-with-lambda.html">
/// Updating message content with AWS Lambda</a>.
/// </note>
class S3Reference {
  /// The S3 bucket name.
  final String bucket;

  /// The S3 key object name.
  final String key;

  /// If you enable versioning for the bucket, you can specify the object version.
  final String? objectVersion;

  S3Reference({
    required this.bucket,
    required this.key,
    this.objectVersion,
  });

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final objectVersion = this.objectVersion;
    return {
      'bucket': bucket,
      'key': key,
      if (objectVersion != null) 'objectVersion': objectVersion,
    };
  }
}

class InvalidContentLocation extends _s.GenericAwsException {
  InvalidContentLocation({String? type, String? message})
      : super(type: type, code: 'InvalidContentLocation', message: message);
}

class MessageFrozen extends _s.GenericAwsException {
  MessageFrozen({String? type, String? message})
      : super(type: type, code: 'MessageFrozen', message: message);
}

class MessageRejected extends _s.GenericAwsException {
  MessageRejected({String? type, String? message})
      : super(type: type, code: 'MessageRejected', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidContentLocation': (type, message) =>
      InvalidContentLocation(type: type, message: message),
  'MessageFrozen': (type, message) =>
      MessageFrozen(type: type, message: message),
  'MessageRejected': (type, message) =>
      MessageRejected(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
