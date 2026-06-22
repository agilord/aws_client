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

/// Endpoint host trait
class EndpointHostTrait {
  final _s.RestJsonProtocol _protocol;
  factory EndpointHostTrait({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'EndpointHostTrait',
    );
    return EndpointHostTrait._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.forProtocol(
            service: service, region: region, endpointUrl: endpointUrl),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  EndpointHostTrait._({
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

  Future<void> staticOp0({
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      hostPrefix: 'data-',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> memberRefOp1({
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      hostPrefix: 'foo-${name}.',
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
