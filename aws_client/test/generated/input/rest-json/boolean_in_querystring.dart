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

/// Boolean in querystring
class BooleanInQuerystring {
  final _s.RestJsonProtocol _protocol;
  BooleanInQuerystring({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'BooleanInQuerystring',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    bool? boolQuery,
  }) async {
    final $query = <String, List<String>>{
      if (boolQuery != null) 'bool-query': [boolQuery.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/path',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    bool? boolQuery,
  }) async {
    final $query = <String, List<String>>{
      if (boolQuery != null) 'bool-query': [boolQuery.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/path',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
