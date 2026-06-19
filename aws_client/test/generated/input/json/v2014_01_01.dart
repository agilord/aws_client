// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

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

/// Enum
class Enum {
  final _s.JsonProtocol _protocol;
  Enum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
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

  Future<void> operationName0({
    EnumType? fooEnum,
    List<EnumType>? listEnums,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Enum.OperationName'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fooEnum != null) 'FooEnum': fooEnum.value,
        if (listEnums != null)
          'ListEnums': listEnums.map((e) => e.value).toList(),
      },
    );
  }

  Future<void> operationName1({
    EnumType? fooEnum,
    List<EnumType>? listEnums,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Enum.OperationName'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fooEnum != null) 'FooEnum': fooEnum.value,
        if (listEnums != null)
          'ListEnums': listEnums.map((e) => e.value).toList(),
      },
    );
  }
}

/// @nodoc
class EnumType {
  static const foo = EnumType._('foo');
  static const bar = EnumType._('bar');

  final String value;

  const EnumType._(this.value);

  static const values = [foo, bar];

  static EnumType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EnumType._(value));

  @override
  bool operator ==(other) => other is EnumType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
