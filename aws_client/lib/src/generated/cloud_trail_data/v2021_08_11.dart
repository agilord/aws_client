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

/// The CloudTrail Data Service lets you ingest events into CloudTrail from any
/// source in your hybrid environments, such as in-house or SaaS applications
/// hosted on-premises or in the cloud, virtual machines, or containers. You can
/// store, access, analyze, troubleshoot and take action on this data without
/// maintaining multiple log aggregators and reporting tools. After you run
/// <code>PutAuditEvents</code> to ingest your application activity into
/// CloudTrail, you can use CloudTrail Lake to search, query, and analyze the
/// data that is logged from your applications.
class CloudTrailData {
  final _s.RestJsonProtocol _protocol;
  CloudTrailData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudtrail-data',
            signingName: 'cloudtrail-data',
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

  /// Ingests your application events into CloudTrail Lake. A required
  /// parameter, <code>auditEvents</code>, accepts the JSON records (also called
  /// <i>payload</i>) of events that you want CloudTrail to ingest. You can add
  /// up to 100 of these events (or up to 1 MB) per <code>PutAuditEvents</code>
  /// request.
  ///
  /// May throw [ChannelInsufficientPermission].
  /// May throw [ChannelNotFound].
  /// May throw [InvalidChannelARN].
  /// May throw [ChannelUnsupportedSchema].
  /// May throw [DuplicatedAuditEventId].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [auditEvents] :
  /// The JSON payload of events that you want to ingest. You can also point to
  /// the JSON event payload in a file.
  ///
  /// Parameter [channelArn] :
  /// The ARN or ID (the ARN suffix) of a channel.
  ///
  /// Parameter [externalId] :
  /// A unique identifier that is conditionally required when the channel's
  /// resource policy includes an external ID. This value can be any string,
  /// such as a passphrase or account number.
  Future<PutAuditEventsResponse> putAuditEvents({
    required List<AuditEvent> auditEvents,
    required String channelArn,
    String? externalId,
  }) async {
    final $query = <String, List<String>>{
      'channelArn': [channelArn],
      if (externalId != null) 'externalId': [externalId],
    };
    final $payload = <String, dynamic>{
      'auditEvents': auditEvents,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutAuditEvents',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutAuditEventsResponse.fromJson(response);
  }
}

/// An event from a source outside of Amazon Web Services that you want
/// CloudTrail to log.
class AuditEvent {
  /// The content of an audit event that comes from the event, such as
  /// <code>userIdentity</code>, <code>userAgent</code>, and
  /// <code>eventSource</code>.
  final String eventData;

  /// The original event ID from the source event.
  final String id;

  /// A checksum is a base64-SHA256 algorithm that helps you verify that
  /// CloudTrail receives the event that matches with the checksum. Calculate the
  /// checksum by running a command like the following:
  ///
  /// <code>printf %s <i>$eventdata</i> | openssl dgst -binary -sha256 |
  /// base64</code>
  final String? eventDataChecksum;

  AuditEvent({
    required this.eventData,
    required this.id,
    this.eventDataChecksum,
  });

  Map<String, dynamic> toJson() {
    final eventData = this.eventData;
    final id = this.id;
    final eventDataChecksum = this.eventDataChecksum;
    return {
      'eventData': eventData,
      'id': id,
      if (eventDataChecksum != null) 'eventDataChecksum': eventDataChecksum,
    };
  }
}

/// A response that includes successful and failed event results.
class AuditEventResultEntry {
  /// The event ID assigned by CloudTrail.
  final String eventID;

  /// The original event ID from the source event.
  final String id;

  AuditEventResultEntry({
    required this.eventID,
    required this.id,
  });

  factory AuditEventResultEntry.fromJson(Map<String, dynamic> json) {
    return AuditEventResultEntry(
      eventID: json['eventID'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final eventID = this.eventID;
    final id = this.id;
    return {
      'eventID': eventID,
      'id': id,
    };
  }
}

class PutAuditEventsResponse {
  /// Lists events in the provided event payload that could not be ingested into
  /// CloudTrail, and includes the error code and error message returned for
  /// events that could not be ingested.
  final List<ResultErrorEntry> failed;

  /// Lists events in the provided event payload that were successfully ingested
  /// into CloudTrail.
  final List<AuditEventResultEntry> successful;

  PutAuditEventsResponse({
    required this.failed,
    required this.successful,
  });

  factory PutAuditEventsResponse.fromJson(Map<String, dynamic> json) {
    return PutAuditEventsResponse(
      failed: (json['failed'] as List)
          .whereNotNull()
          .map((e) => ResultErrorEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      successful: (json['successful'] as List)
          .whereNotNull()
          .map((e) => AuditEventResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final successful = this.successful;
    return {
      'failed': failed,
      'successful': successful,
    };
  }
}

/// Includes the error code and error message for events that could not be
/// ingested by CloudTrail.
class ResultErrorEntry {
  /// The error code for events that could not be ingested by CloudTrail. Possible
  /// error codes include: <code>FieldTooLong</code>, <code>FieldNotFound</code>,
  /// <code>InvalidChecksum</code>, <code>InvalidData</code>,
  /// <code>InvalidRecipient</code>, <code>InvalidEventSource</code>,
  /// <code>AccountNotSubscribed</code>, <code>Throttling</code>, and
  /// <code>InternalFailure</code>.
  final String errorCode;

  /// The message that describes the error for events that could not be ingested
  /// by CloudTrail.
  final String errorMessage;

  /// The original event ID from the source event that could not be ingested by
  /// CloudTrail.
  final String id;

  ResultErrorEntry({
    required this.errorCode,
    required this.errorMessage,
    required this.id,
  });

  factory ResultErrorEntry.fromJson(Map<String, dynamic> json) {
    return ResultErrorEntry(
      errorCode: json['errorCode'] as String,
      errorMessage: json['errorMessage'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      'errorCode': errorCode,
      'errorMessage': errorMessage,
      'id': id,
    };
  }
}

class ChannelInsufficientPermission extends _s.GenericAwsException {
  ChannelInsufficientPermission({String? type, String? message})
      : super(
            type: type,
            code: 'ChannelInsufficientPermission',
            message: message);
}

class ChannelNotFound extends _s.GenericAwsException {
  ChannelNotFound({String? type, String? message})
      : super(type: type, code: 'ChannelNotFound', message: message);
}

class ChannelUnsupportedSchema extends _s.GenericAwsException {
  ChannelUnsupportedSchema({String? type, String? message})
      : super(type: type, code: 'ChannelUnsupportedSchema', message: message);
}

class DuplicatedAuditEventId extends _s.GenericAwsException {
  DuplicatedAuditEventId({String? type, String? message})
      : super(type: type, code: 'DuplicatedAuditEventId', message: message);
}

class InvalidChannelARN extends _s.GenericAwsException {
  InvalidChannelARN({String? type, String? message})
      : super(type: type, code: 'InvalidChannelARN', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ChannelInsufficientPermission': (type, message) =>
      ChannelInsufficientPermission(type: type, message: message),
  'ChannelNotFound': (type, message) =>
      ChannelNotFound(type: type, message: message),
  'ChannelUnsupportedSchema': (type, message) =>
      ChannelUnsupportedSchema(type: type, message: message),
  'DuplicatedAuditEventId': (type, message) =>
      DuplicatedAuditEventId(type: type, message: message),
  'InvalidChannelARN': (type, message) =>
      InvalidChannelARN(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
