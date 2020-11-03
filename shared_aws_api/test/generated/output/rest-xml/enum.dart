// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Enum
class Enum {
  final _s.RestXmlProtocol _protocol;
  Enum({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'Enum',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result.body, headers: $result.headers);
  }

  Future<void> operationName1({
    RESTJSONEnumType fooEnum,
    RESTJSONEnumType headerEnum,
    List<String> listEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class OutputShape {
  final RESTJSONEnumType fooEnum;
  final RESTJSONEnumType headerEnum;
  final List<String> listEnums;

  OutputShape({
    this.fooEnum,
    this.headerEnum,
    this.listEnums,
  });
  factory OutputShape.fromXml(
    _s.XmlElement elem, {
    Map<String, String> headers,
  }) {
    return OutputShape(
      fooEnum: _s.extractXmlStringValue(elem, 'FooEnum')?.toRESTJSONEnumType(),
      headerEnum: _s
          .extractHeaderStringValue(headers, 'x-amz-enum')
          ?.toRESTJSONEnumType(),
      listEnums: _s
          .extractXmlChild(elem, 'ListEnums')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'ListEnums')),
    );
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
