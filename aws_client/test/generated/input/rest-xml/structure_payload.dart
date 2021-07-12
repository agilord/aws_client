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

/// Structure payload
class StructurePayload {
  final _s.RestXmlProtocol _protocol;
  StructurePayload({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'StructurePayload',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    FooShape? foo,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      payload: foo?.toXml('foo'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    FooShape? foo,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      payload: foo?.toXml('foo'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    FooShape? foo,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      payload: foo?.toXml('foo'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName3({
    FooShape? foo,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      payload: foo?.toXml('foo'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class FooShape {
  final String? baz;

  FooShape({
    this.baz,
  });

  factory FooShape.fromJson(Map<String, dynamic> json) {
    return FooShape(
      baz: json['baz'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baz = this.baz;
    return {
      if (baz != null) 'baz': baz,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final baz = this.baz;
    final $children = <_s.XmlNode>[
      if (baz != null) _s.encodeXmlStringValue('baz', baz),
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

final _exceptionFns = <String, _s.AwsExceptionFn>{};
