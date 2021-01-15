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

part 'enum.g.dart';

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

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      fooEnum: ($json['FooEnum'] as String)?.toRESTJSONEnumType(),
      listEnums: ($json['ListEnums'] as List)
          ?.map((e) => (e as String)?.toRESTJSONEnumType())
          ?.toList(),
      headerEnum: _s
          .extractHeaderStringValue(response.headers, 'x-amz-enum')
          ?.toRESTJSONEnumType(),
    );
  }

  Future<void> operationName1({
    RESTJSONEnumType fooEnum,
    RESTJSONEnumType headerEnum,
    List<RESTJSONEnumType> listEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    final $payload = <String, dynamic>{
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e?.toValue() ?? '').toList(),
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputShape {
  @_s.JsonKey(name: 'FooEnum')
  final RESTJSONEnumType fooEnum;
  @_s.JsonKey(name: 'x-amz-enum')
  final RESTJSONEnumType headerEnum;
  @_s.JsonKey(name: 'ListEnums')
  final List<RESTJSONEnumType> listEnums;

  OutputShape({
    this.fooEnum,
    this.headerEnum,
    this.listEnums,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) =>
      _$OutputShapeFromJson(json);
}

enum RESTJSONEnumType {
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

extension on RESTJSONEnumType {
  String toValue() {
    switch (this) {
      case RESTJSONEnumType.foo:
        return 'foo';
      case RESTJSONEnumType.bar:
        return 'bar';
      case RESTJSONEnumType.baz:
        return 'baz';
      case RESTJSONEnumType.$0:
        return '0';
      case RESTJSONEnumType.$1:
        return '1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RESTJSONEnumType toRESTJSONEnumType() {
    switch (this) {
      case 'foo':
        return RESTJSONEnumType.foo;
      case 'bar':
        return RESTJSONEnumType.bar;
      case 'baz':
        return RESTJSONEnumType.baz;
      case '0':
        return RESTJSONEnumType.$0;
      case '1':
        return RESTJSONEnumType.$1;
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
