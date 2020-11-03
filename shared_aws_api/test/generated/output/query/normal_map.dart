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

import 'normal_map.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Normal map
class NormalMap {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  NormalMap({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: 'NormalMap',
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
  final Map<String, StructType> map;

  OutputShape({
    this.map,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      map: Map.fromEntries(
        elem.findElements('Map').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'null'),
                _s
                    .extractXmlChild(c, 'null')
                    ?.let((e) => StructType.fromXml(e)),
              ),
            ),
      ),
    );
  }
}

class StructType {
  final String foo;

  StructType({
    this.foo,
  });
  factory StructType.fromXml(_s.XmlElement elem) {
    return StructType(
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
