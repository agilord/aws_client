// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// The WorkMail Message Flow API provides access to email messages as they are
/// being sent and received by a WorkMail organization.
class WorkMailMessageFlow {
  final _s.RestJsonProtocol _protocol;
  WorkMailMessageFlow({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workmailmessageflow',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Retrieves the raw content of an in-transit email message, in MIME format.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [messageId] :
  /// The identifier of the email message to retrieve.
  Future<GetRawMessageContentResponse> getRawMessageContent({
    required String messageId,
  }) async {
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringLength(
      'messageId',
      messageId,
      1,
      120,
      isRequired: true,
    );
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''[a-z0-9\-]*''',
      isRequired: true,
    );
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
}

class GetRawMessageContentResponse {
  /// The raw content of the email message, in MIME format.
  final Uint8List messageContent;

  GetRawMessageContentResponse({
    required this.messageContent,
  });
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
