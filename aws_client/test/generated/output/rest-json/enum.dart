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

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      fooEnum: ($json['FooEnum'] as String?)?.toRESTJSONEnumType(),
      listEnums: ($json['ListEnums'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRESTJSONEnumType())
          .toList(),
      headerEnum: _s
          .extractHeaderStringValue(response.headers, 'x-amz-enum')
          ?.toRESTJSONEnumType(),
    );
  }

  Future<void> operationName1({
    RESTJSONEnumType? fooEnum,
    RESTJSONEnumType? headerEnum,
    List<RESTJSONEnumType>? listEnums,
  }) async {
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.toValue(),
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
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class OutputShape {
  final RESTJSONEnumType? fooEnum;
  final RESTJSONEnumType? headerEnum;
  final List<RESTJSONEnumType>? listEnums;

  OutputShape({
    this.fooEnum,
    this.headerEnum,
    this.listEnums,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      fooEnum: (json['FooEnum'] as String?)?.toRESTJSONEnumType(),
      headerEnum: (json['x-amz-enum'] as String?)?.toRESTJSONEnumType(),
      listEnums: (json['ListEnums'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRESTJSONEnumType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fooEnum = this.fooEnum;
    final headerEnum = this.headerEnum;
    final listEnums = this.listEnums;
    return {
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.toValue()).toList(),
    };
  }
}

enum RESTJSONEnumType {
  foo,
  bar,
  baz,
  $0,
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
    throw Exception('$this is not known in enum RESTJSONEnumType');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
