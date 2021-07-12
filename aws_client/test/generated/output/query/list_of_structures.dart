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

import 'list_of_structures.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// List of structures
class ListOfStructures {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ListOfStructures({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ListOfStructures',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<OutputShape> operationName0() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'OperationNameResult',
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final List<StructureShape>? list;

  OutputShape({
    this.list,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      list: (json['List'] as List?)
          ?.whereNotNull()
          .map((e) => StructureShape.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      list: _s.extractXmlChild(elem, 'List')?.let((elem) => elem
          .findElements('member')
          .map((c) => StructureShape.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final list = this.list;
    return {
      if (list != null) 'List': list,
    };
  }
}

class StructureShape {
  final String? bar;
  final String? baz;
  final String? foo;

  StructureShape({
    this.bar,
    this.baz,
    this.foo,
  });

  factory StructureShape.fromJson(Map<String, dynamic> json) {
    return StructureShape(
      bar: json['Bar'] as String?,
      baz: json['Baz'] as String?,
      foo: json['Foo'] as String?,
    );
  }

  factory StructureShape.fromXml(_s.XmlElement elem) {
    return StructureShape(
      bar: _s.extractXmlStringValue(elem, 'Bar'),
      baz: _s.extractXmlStringValue(elem, 'Baz'),
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final bar = this.bar;
    final baz = this.baz;
    final foo = this.foo;
    return {
      if (bar != null) 'Bar': bar,
      if (baz != null) 'Baz': baz,
      if (foo != null) 'Foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
