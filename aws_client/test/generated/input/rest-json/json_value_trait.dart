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

/// JSON value trait
class JsonValueTrait {
  final _s.RestJsonProtocol _protocol;
  JsonValueTrait({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'JSONValueTrait',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    BodyStructure? body,
    Object? headerField,
    Object? queryField,
  }) async {
    final headers = <String, String>{
      if (headerField != null)
        'X-Amz-Foo': base64Encode(utf8.encode(jsonEncode(headerField))),
    };
    final $query = <String, List<String>>{
      if (queryField != null) 'Bar': [jsonEncode(queryField)],
    };
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    BodyStructure? body,
    Object? headerField,
    Object? queryField,
  }) async {
    final headers = <String, String>{
      if (headerField != null)
        'X-Amz-Foo': base64Encode(utf8.encode(jsonEncode(headerField))),
    };
    final $query = <String, List<String>>{
      if (queryField != null) 'Bar': [jsonEncode(queryField)],
    };
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    BodyStructure? body,
    Object? headerField,
    Object? queryField,
  }) async {
    final headers = <String, String>{
      if (headerField != null)
        'X-Amz-Foo': base64Encode(utf8.encode(jsonEncode(headerField))),
    };
    final $query = <String, List<String>>{
      if (queryField != null) 'Bar': [jsonEncode(queryField)],
    };
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class BodyStructure {
  final Object? bodyField;
  final List<Object>? bodyListField;

  BodyStructure({
    this.bodyField,
    this.bodyListField,
  });

  factory BodyStructure.fromJson(Map<String, dynamic> json) {
    return BodyStructure(
      bodyField: json['BodyField'] == null
          ? null
          : jsonDecode(json['BodyField'] as String),
      bodyListField: json['BodyListField'] == null
          ? null
          : (json['BodyListField'] as List)
              .map((v) => jsonDecode(v as String))
              .toList()
              .cast<Object>(),
    );
  }

  Map<String, dynamic> toJson() {
    final bodyField = this.bodyField;
    final bodyListField = this.bodyListField;
    return {
      if (bodyField != null) 'BodyField': jsonEncode(bodyField),
      if (bodyListField != null)
        'BodyListField': bodyListField.map(jsonEncode).toList(),
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
