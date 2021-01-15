// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

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
    EnumType uRIFooEnum,
    List<EnumType> uRIListEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    final $query = <String, List<String>>{
      if (uRIListEnums != null)
        'ListEnums': uRIListEnums.map((e) => e?.toValue() ?? '').toList(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/Enum/${Uri.encodeComponent(uRIFooEnum.toValue())}',
      queryParams: $query,
      headers: headers,
      payload: InputShape(
              fooEnum: fooEnum,
              headerEnum: headerEnum,
              listEnums: listEnums,
              uRIFooEnum: uRIFooEnum,
              uRIListEnums: uRIListEnums)
          .toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    EnumType fooEnum,
    EnumType headerEnum,
    List<EnumType> listEnums,
    EnumType uRIFooEnum,
    List<EnumType> uRIListEnums,
  }) async {
    final headers = <String, String>{};
    headerEnum?.let((v) => headers['x-amz-enum'] = v.toValue());
    final $query = <String, List<String>>{
      if (uRIListEnums != null)
        'ListEnums': uRIListEnums.map((e) => e?.toValue() ?? '').toList(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      queryParams: $query,
      headers: headers,
      payload: InputShape(
              fooEnum: fooEnum,
              headerEnum: headerEnum,
              listEnums: listEnums,
              uRIFooEnum: uRIFooEnum,
              uRIListEnums: uRIListEnums)
          .toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final EnumType fooEnum;
  final EnumType headerEnum;
  final List<EnumType> listEnums;
  final EnumType uRIFooEnum;
  final List<EnumType> uRIListEnums;

  InputShape({
    this.fooEnum,
    this.headerEnum,
    this.listEnums,
    this.uRIFooEnum,
    this.uRIListEnums,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (fooEnum != null)
        _s.encodeXmlStringValue('FooEnum', fooEnum.toValue()),
      if (listEnums != null)
        _s.XmlElement(
            _s.XmlName('ListEnums'),
            [],
            listEnums.map(
                (e) => _s.encodeXmlStringValue('member', e?.toValue() ?? ''))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
      case 'baz':
        return EnumType.baz;
      case '0':
        return EnumType.$0;
      case '1':
        return EnumType.$1;
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
