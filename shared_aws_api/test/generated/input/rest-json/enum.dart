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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Enum
class Enum {
  final _s.RestJsonProtocol _protocol;
  Enum({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'Enum',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    EnumType fooEnum,
    EnumType headerEnum,
    List<String> listEnums,
    EnumType queryFooEnum,
    List<String> queryListEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    var _query = '';
    _query = '?${[
      if (queryFooEnum != null) _s.toQueryParam('Enum', queryFooEnum),
      if (queryListEnums != null) _s.toQueryParam('List', queryListEnums),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum?.toValue(),
      if (listEnums != null) 'ListEnums': listEnums,
    };
    await _protocol.send(
      payload: $payload,
      headers: headers,
      method: 'POST',
      requestUri: '/path$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    EnumType fooEnum,
    EnumType headerEnum,
    List<String> listEnums,
    EnumType queryFooEnum,
    List<String> queryListEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    var _query = '';
    _query = '?${[
      if (queryFooEnum != null) _s.toQueryParam('Enum', queryFooEnum),
      if (queryListEnums != null) _s.toQueryParam('List', queryListEnums),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum?.toValue(),
      if (listEnums != null) 'ListEnums': listEnums,
    };
    await _protocol.send(
      payload: $payload,
      headers: headers,
      method: 'POST',
      requestUri: '/path$_query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum EnumType {
  @_s.JsonValue('foo')
  foo,
  @_s.JsonValue('bar')
  bar,
  @_s.JsonValue('baz')
  baz,
  @_s.JsonValue('0')
  $0,
  @_s.JsonValue('1')
  $1,
}

extension on EnumType {
  String toValue() {
    switch (this) {
      case EnumType.foo:
        return 'foo';
      case EnumType.bar:
        return 'bar';
      case EnumType.baz:
        return 'baz';
      case EnumType.$0:
        return '0';
      case EnumType.$1:
        return '1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
