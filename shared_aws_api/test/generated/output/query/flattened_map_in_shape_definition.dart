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

import 'flattened_map_in_shape_definition.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Flattened map in shape definition
class FlattenedMapInShapeDefinition {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  FlattenedMapInShapeDefinition({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
            client: client,
            service: _s.ServiceMetadata(
              endpointPrefix: 'FlattenedMapInShapeDefinition',
            ),
            region: region,
            credentials: credentials,
            credentialsProvider: credentialsProvider),
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
  final Map<String, String>? map;

  OutputShape({
    this.map,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      map: Map.fromEntries(
        elem.findElements('Attribute').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'Name')!,
                _s.extractXmlStringValue(c, 'Value')!,
              ),
            ),
      ),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
