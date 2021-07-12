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

import 'normal_map.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Normal map
class NormalMap {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  NormalMap({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NormalMap',
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
  final Map<String, StructType>? map;

  OutputShape({
    this.map,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      map: (json['Map'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, StructType.fromJson(e as Map<String, dynamic>))),
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      map: Map.fromEntries(
        elem.getElement('Map')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    StructType.fromXml(_s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final map = this.map;
    return {
      if (map != null) 'Map': map,
    };
  }
}

class StructType {
  final String? foo;

  StructType({
    this.foo,
  });

  factory StructType.fromJson(Map<String, dynamic> json) {
    return StructType(
      foo: json['foo'] as String?,
    );
  }

  factory StructType.fromXml(_s.XmlElement elem) {
    return StructType(
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
