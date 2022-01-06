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

import 'blob.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Blob
class Blob {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Blob({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Blob',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
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
  final Uint8List? blob;

  OutputShape({
    this.blob,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      blob: _s.extractXmlUint8ListValue(elem, 'Blob'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
