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

/// Enum
class Enum {
  final _s.RestJsonProtocol _protocol;
  factory Enum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'Enum',
    );
    return Enum._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.forProtocol(
            service: service, region: region, endpointUrl: endpointUrl),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Enum._({
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

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      fooEnum: ($json['FooEnum'] as String?)?.let(RESTJSONEnumType.fromString),
      listEnums: ($json['ListEnums'] as List?)
          ?.nonNulls
          .map((e) => RESTJSONEnumType.fromString((e as String)))
          .toList(),
      headerEnum: _s
          .extractHeaderStringValue(response.headers, 'x-amz-enum')
          ?.let(RESTJSONEnumType.fromString),
    );
  }

  Future<void> operationName1({
    RESTJSONEnumType? fooEnum,
    RESTJSONEnumType? headerEnum,
    List<RESTJSONEnumType>? listEnums,
  }) async {
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.value,
    };
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.value).toList(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class OutputShape {
  final RESTJSONEnumType? fooEnum;
  final RESTJSONEnumType? headerEnum;
  final List<RESTJSONEnumType>? listEnums;

  OutputShape({
    this.fooEnum,
    this.headerEnum,
    this.listEnums,
  });

  Map<String, dynamic> toJson() {
    final fooEnum = this.fooEnum;
    final headerEnum = this.headerEnum;
    final listEnums = this.listEnums;
    return {
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class RESTJSONEnumType {
  static const foo = RESTJSONEnumType._('foo');
  static const bar = RESTJSONEnumType._('bar');
  static const baz = RESTJSONEnumType._('baz');
  static const $0 = RESTJSONEnumType._('0');
  static const $1 = RESTJSONEnumType._('1');

  final String value;

  const RESTJSONEnumType._(this.value);

  static const values = [foo, bar, baz, $0, $1];

  static RESTJSONEnumType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RESTJSONEnumType._(value));

  @override
  bool operator ==(other) => other is RESTJSONEnumType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
