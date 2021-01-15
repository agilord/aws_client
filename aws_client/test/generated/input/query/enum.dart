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

import 'enum.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Enum
class Enum {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Enum({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> operationName0({
    EnumType fooEnum,
    List<EnumType> listEnums,
  }) async {
    final $request = <String, dynamic>{};
    fooEnum?.also((arg) => $request['FooEnum'] = arg.toValue());
    listEnums?.also((arg) =>
        $request['ListEnums'] = arg.map((e) => e?.toValue() ?? '').toList());
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }

  Future<void> operationName1({
    EnumType fooEnum,
    List<EnumType> listEnums,
  }) async {
    final $request = <String, dynamic>{};
    fooEnum?.also((arg) => $request['FooEnum'] = arg.toValue());
    listEnums?.also((arg) =>
        $request['ListEnums'] = arg.map((e) => e?.toValue() ?? '').toList());
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }

  Future<void> operationName2({
    EnumType fooEnum,
    List<EnumType> listEnums,
  }) async {
    final $request = <String, dynamic>{};
    fooEnum?.also((arg) => $request['FooEnum'] = arg.toValue());
    listEnums?.also((arg) =>
        $request['ListEnums'] = arg.map((e) => e?.toValue() ?? '').toList());
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }
}

enum EnumType {
  @_s.JsonValue('foo')
  foo,
  @_s.JsonValue('bar')
  bar,
}

extension on EnumType {
  String toValue() {
    switch (this) {
      case EnumType.foo:
        return 'foo';
      case EnumType.bar:
        return 'bar';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  EnumType toEnumType() {
    switch (this) {
      case 'foo':
        return EnumType.foo;
      case 'bar':
        return EnumType.bar;
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
