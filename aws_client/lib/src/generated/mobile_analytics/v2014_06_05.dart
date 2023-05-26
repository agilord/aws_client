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

/// Amazon Mobile Analytics is a service for collecting, visualizing, and
/// understanding app usage data at scale.
class MobileAnalytics {
  final _s.RestJsonProtocol _protocol;
  MobileAnalytics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mobileanalytics',
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

  /// The PutEvents operation records one or more events. You can have up to
  /// 1,500 unique custom events per app, any combination of up to 40 attributes
  /// and metrics per custom event, and any number of attribute or metric
  /// values.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [clientContext] :
  /// The client context including the client ID, app title, app version and
  /// package name.
  ///
  /// Parameter [events] :
  /// An array of Event JSON objects
  ///
  /// Parameter [clientContextEncoding] :
  /// The encoding used for the client context.
  Future<void> putEvents({
    required String clientContext,
    required List<Event> events,
    String? clientContextEncoding,
  }) async {
    final headers = <String, String>{
      'x-amz-Client-Context': clientContext.toString(),
      if (clientContextEncoding != null)
        'x-amz-Client-Context-Encoding': clientContextEncoding.toString(),
    };
    final $payload = <String, dynamic>{
      'events': events,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2014-06-05/events',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An exception object returned when a request fails.
class BadRequestException implements _s.AwsException {
  /// A text description associated with the BadRequestException object.
  final String? message;

  BadRequestException({
    this.message,
  });

  factory BadRequestException.fromJson(Map<String, dynamic> json) {
    return BadRequestException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// A JSON object representing a batch of unique event occurrences in your app.
class Event {
  /// A name signifying an event that occurred in your app. This is used for
  /// grouping and aggregating like events together for reporting purposes.
  final String eventType;

  /// The time the event occurred in ISO 8601 standard date time format. For
  /// example, 2014-06-30T19:07:47.885Z
  final String timestamp;

  /// A collection of key-value pairs that give additional context to the event.
  /// The key-value pairs are specified by the developer.
  ///
  /// This collection can be empty or the attribute object can be omitted.
  final Map<String, String>? attributes;

  /// A collection of key-value pairs that gives additional, measurable context to
  /// the event. The key-value pairs are specified by the developer.
  ///
  /// This collection can be empty or the attribute object can be omitted.
  final Map<String, double>? metrics;

  /// The session the event occured within.
  final Session? session;

  /// The version of the event.
  final String? version;

  Event({
    required this.eventType,
    required this.timestamp,
    this.attributes,
    this.metrics,
    this.session,
    this.version,
  });

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final timestamp = this.timestamp;
    final attributes = this.attributes;
    final metrics = this.metrics;
    final session = this.session;
    final version = this.version;
    return {
      'eventType': eventType,
      'timestamp': timestamp,
      if (attributes != null) 'attributes': attributes,
      if (metrics != null) 'metrics': metrics,
      if (session != null) 'session': session,
      if (version != null) 'version': version,
    };
  }
}

/// Describes the session. Session information is required on ALL events.
class Session {
  /// The duration of the session.
  final int? duration;

  /// A unique identifier for the session
  final String? id;

  /// The time the event started in ISO 8601 standard date time format. For
  /// example, 2014-06-30T19:07:47.885Z
  final String? startTimestamp;

  /// The time the event terminated in ISO 8601 standard date time format. For
  /// example, 2014-06-30T19:07:47.885Z
  final String? stopTimestamp;

  Session({
    this.duration,
    this.id,
    this.startTimestamp,
    this.stopTimestamp,
  });

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final id = this.id;
    final startTimestamp = this.startTimestamp;
    final stopTimestamp = this.stopTimestamp;
    return {
      if (duration != null) 'duration': duration,
      if (id != null) 'id': id,
      if (startTimestamp != null) 'startTimestamp': startTimestamp,
      if (stopTimestamp != null) 'stopTimestamp': stopTimestamp,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(message: message),
};
