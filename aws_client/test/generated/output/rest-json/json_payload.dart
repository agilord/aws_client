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

/// JSON payload
class JsonPayload {
  final _s.RestJsonProtocol _protocol;
  JsonPayload({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'JSONPayload',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      data: BodyStructure.fromJson($json),
      header: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
    );
  }
}

class OutputShape {
  final BodyStructure? data;
  final String? header;

  OutputShape({
    this.data,
    this.header,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      data: json['Data'] != null
          ? BodyStructure.fromJson(json['Data'] as Map<String, dynamic>)
          : null,
      header: json['X-Foo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final header = this.header;
    return {
      if (data != null) 'Data': data,
    };
  }
}

class BodyStructure {
  final String? foo;

  BodyStructure({
    this.foo,
  });

  factory BodyStructure.fromJson(Map<String, dynamic> json) {
    return BodyStructure(
      foo: json['Foo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'Foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
