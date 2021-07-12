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

/// Supports header maps
class SupportsHeaderMaps {
  final _s.RestJsonProtocol _protocol;
  SupportsHeaderMaps({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'SupportsHeaderMaps',
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
      allHeaders: _s.extractHeaderMapValues(response.headers, 'AllHeaders'),
      prefixedHeaders: _s.extractHeaderMapValues(response.headers, 'X-'),
    );
  }
}

class OutputShape {
  final Map<String, String>? allHeaders;
  final Map<String, String>? prefixedHeaders;

  OutputShape({
    this.allHeaders,
    this.prefixedHeaders,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      allHeaders: (json['AllHeaders'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      prefixedHeaders: (json['X-'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final allHeaders = this.allHeaders;
    final prefixedHeaders = this.prefixedHeaders;
    return {};
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
