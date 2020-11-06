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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

import 'list_of_structures.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// List of structures
class ListOfStructures {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ListOfStructures({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: 'ListOfStructures',
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
  final List<StructureShape> list;

  OutputShape({
    this.list,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      list: _s.extractXmlChild(elem, 'List')?.let((elem) => elem
          .findElements('member')
          .map((c) => StructureShape.fromXml(c))
          .toList()),
    );
  }
}

class StructureShape {
  final String bar;
  final String baz;
  final String foo;

  StructureShape({
    this.bar,
    this.baz,
    this.foo,
  });
  factory StructureShape.fromXml(_s.XmlElement elem) {
    return StructureShape(
      bar: _s.extractXmlStringValue(elem, 'Bar'),
      baz: _s.extractXmlStringValue(elem, 'Baz'),
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
