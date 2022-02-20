// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_credential_providers/aws_credential_providers.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

import 'flattened_list_of_structures.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Flattened list of structures
class FlattenedListOfStructures {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  FlattenedListOfStructures({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider = defaultProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'FlattenedListOfStructures',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

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
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      list: elem
          .findElements('List')
          .map((c) => StructureShape.fromXml(c))
          .toList(),
    );
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
  factory StructureShape.fromXml(_s.XmlElement elem) {
    return StructureShape(
      bar: _s.extractXmlStringValue(elem, 'Bar'),
      baz: _s.extractXmlStringValue(elem, 'Baz'),
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
