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
  final _s.RestXmlProtocol _protocol;
  Enum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required EnumType uRIFooEnum,
    EnumType? fooEnum,
    EnumType? headerEnum,
    List<EnumType>? listEnums,
    List<EnumType>? uRIListEnums,
  }) async {
    ArgumentError.checkNotNull(uRIFooEnum, 'uRIFooEnum');
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.toValue(),
    };
    final $query = <String, List<String>>{
      if (uRIListEnums != null)
        'ListEnums': uRIListEnums.map((e) => e.toValue()).toList(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/Enum/${Uri.encodeComponent(uRIFooEnum.toValue())}',
      queryParams: $query,
      headers: headers,
      payload: InputShape(
              uRIFooEnum: uRIFooEnum,
              fooEnum: fooEnum,
              headerEnum: headerEnum,
              listEnums: listEnums,
              uRIListEnums: uRIListEnums)
          .toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    required EnumType uRIFooEnum,
    EnumType? fooEnum,
    EnumType? headerEnum,
    List<EnumType>? listEnums,
    List<EnumType>? uRIListEnums,
  }) async {
    ArgumentError.checkNotNull(uRIFooEnum, 'uRIFooEnum');
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.toValue(),
    };
    final $query = <String, List<String>>{
      if (uRIListEnums != null)
        'ListEnums': uRIListEnums.map((e) => e.toValue()).toList(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      queryParams: $query,
      headers: headers,
      payload: InputShape(
              uRIFooEnum: uRIFooEnum,
              fooEnum: fooEnum,
              headerEnum: headerEnum,
              listEnums: listEnums,
              uRIListEnums: uRIListEnums)
          .toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final EnumType uRIFooEnum;
  final EnumType? fooEnum;
  final EnumType? headerEnum;
  final List<EnumType>? listEnums;
  final List<EnumType>? uRIListEnums;

  InputShape({
    required this.uRIFooEnum,
    this.fooEnum,
    this.headerEnum,
    this.listEnums,
    this.uRIListEnums,
  });

  factory InputShape.fromJson(Map<String, dynamic> json) {
    return InputShape(
      uRIFooEnum: (json['URIEnum'] as String).toEnumType(),
      fooEnum: (json['FooEnum'] as String?)?.toEnumType(),
      headerEnum: (json['x-amz-enum'] as String?)?.toEnumType(),
      listEnums: (json['ListEnums'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEnumType())
          .toList(),
      uRIListEnums: (json['ListEnums'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEnumType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final uRIFooEnum = this.uRIFooEnum;
    final fooEnum = this.fooEnum;
    final headerEnum = this.headerEnum;
    final listEnums = this.listEnums;
    final uRIListEnums = this.uRIListEnums;
    return {
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.toValue()).toList(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final uRIFooEnum = this.uRIFooEnum;
    final fooEnum = this.fooEnum;
    final headerEnum = this.headerEnum;
    final listEnums = this.listEnums;
    final uRIListEnums = this.uRIListEnums;
    final $children = <_s.XmlNode>[
      if (fooEnum != null)
        _s.encodeXmlStringValue('FooEnum', fooEnum.toValue()),
      if (listEnums != null)
        _s.XmlElement(
            _s.XmlName('ListEnums'),
            [],
            listEnums
                .map((e) => _s.encodeXmlStringValue('member', e.toValue()))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
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
