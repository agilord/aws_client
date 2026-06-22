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

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Map with enum key
class MapWithEnumKey {
  final _s.QueryProtocol _protocol;
  factory MapWithEnumKey({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'MapWithEnumKey',
    );
    return MapWithEnumKey._(
      protocol: _s.QueryProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.forProtocol(
            service: service, region: region, endpointUrl: endpointUrl),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  MapWithEnumKey._({
    required _s.QueryProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> createQueue0({
    required String queueName,
    Map<QueueAttributeName, String>? attributes,
  }) async {
    final $request = <String, String>{
      'QueueName': queueName,
      if (attributes != null)
        for (var e1 in attributes.entries.toList().asMap().entries) ...{
          'Attributes.${e1.key + 1}.Name': e1.value.key.value,
          'Attributes.${e1.key + 1}.Value': e1.value.value,
        },
    };
    await _protocol.send(
      $request,
      action: 'CreateQueue',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class QueueAttributeName {
  static const all = QueueAttributeName._('All');
  static const policy = QueueAttributeName._('Policy');

  final String value;

  const QueueAttributeName._(this.value);

  static const values = [all, policy];

  static QueueAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueueAttributeName._(value));

  @override
  bool operator ==(other) =>
      other is QueueAttributeName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
