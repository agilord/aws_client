// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
  Enum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    EnumType? fooEnum,
    EnumType? headerEnum,
    List<EnumType>? listEnums,
    EnumType? queryFooEnum,
    List<EnumType>? queryListEnums,
  }) async {
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.toValue(),
    };
    final $query = <String, List<String>>{
      if (queryFooEnum != null) 'Enum': [queryFooEnum.toValue()],
      if (queryListEnums != null)
        'List': queryListEnums.map((e) => e.toValue()).toList(),
    };
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.toValue()).toList(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    EnumType? fooEnum,
    EnumType? headerEnum,
    List<EnumType>? listEnums,
    EnumType? queryFooEnum,
    List<EnumType>? queryListEnums,
  }) async {
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.toValue(),
    };
    final $query = <String, List<String>>{
      if (queryFooEnum != null) 'Enum': [queryFooEnum.toValue()],
      if (queryListEnums != null)
        'List': queryListEnums.map((e) => e.toValue()).toList(),
    };
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.toValue()).toList(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum EnumType {
  foo,
  bar,
  baz,
  $0,
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
  }
}

extension on String {
  EnumType toEnumType() {
    switch (this) {
      case 'foo':
        return EnumType.foo;
      case 'bar':
        return EnumType.bar;
      case 'baz':
        return EnumType.baz;
      case '0':
        return EnumType.$0;
      case '1':
        return EnumType.$1;
    }
    throw Exception('$this is not known in enum EnumType');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
