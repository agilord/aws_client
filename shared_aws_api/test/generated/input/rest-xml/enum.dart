// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Enum
class Enum {
  final _s.RestXmlProtocol _protocol;
  Enum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> operationName0({
    required EnumType uRIFooEnum,
    EnumType? fooEnum,
    EnumType? headerEnum,
    List<EnumType>? listEnums,
    List<EnumType>? uRIListEnums,
  }) async {
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.value,
    };
    final $query = <String, List<String>>{
      if (uRIListEnums != null)
        'ListEnums': uRIListEnums.map((e) => e.value).toList(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/Enum/${Uri.encodeComponent(uRIFooEnum.value)}',
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
    final headers = <String, String>{
      if (headerEnum != null) 'x-amz-enum': headerEnum.value,
    };
    final $query = <String, List<String>>{
      if (uRIListEnums != null)
        'ListEnums': uRIListEnums.map((e) => e.value).toList(),
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
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final uRIFooEnum = this.uRIFooEnum;
    final fooEnum = this.fooEnum;
    final headerEnum = this.headerEnum;
    final listEnums = this.listEnums;
    final uRIListEnums = this.uRIListEnums;
    final $children = <_s.XmlNode>[
      if (fooEnum != null) _s.encodeXmlStringValue('FooEnum', fooEnum.value),
      if (listEnums != null)
        _s.XmlElement(_s.XmlName('ListEnums'), [],
            listEnums.map((e) => _s.encodeXmlStringValue('member', e.value))),
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
  foo('foo'),
  bar('bar'),
  baz('baz'),
  $0('0'),
  $1('1'),
  ;

  final String value;

  const EnumType(this.value);

  static EnumType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EnumType'));
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
