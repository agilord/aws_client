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

import 'flattened_list_with_location_name.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Flattened list with location name
class FlattenedListWithLocationName {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  FlattenedListWithLocationName({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'FlattenedListWithLocationName',
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
  final List<String>? list;

  OutputShape({
    this.list,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      list: (json['List'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      list: _s.extractXmlStringListValues(elem, 'NamedList'),
    );
  }

  Map<String, dynamic> toJson() {
    final list = this.list;
    return {
      if (list != null) 'List': list,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
