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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

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
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    EnumType fooEnum,
    EnumType headerEnum,
    List<EnumType> listEnums,
    EnumType queryFooEnum,
    List<EnumType> queryListEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    final $query = <String, List<String>>{
      if (queryFooEnum != null) 'Enum': [queryFooEnum.toValue()],
      if (queryListEnums != null)
        'List': queryListEnums.map((e) => e?.toValue() ?? '').toList(),
    };
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e?.toValue() ?? '').toList(),
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
    EnumType fooEnum,
    EnumType headerEnum,
    List<EnumType> listEnums,
    EnumType queryFooEnum,
    List<EnumType> queryListEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    final $query = <String, List<String>>{
      if (queryFooEnum != null) 'Enum': [queryFooEnum.toValue()],
      if (queryListEnums != null)
        'List': queryListEnums.map((e) => e?.toValue() ?? '').toList(),
    };
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e?.toValue() ?? '').toList(),
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
