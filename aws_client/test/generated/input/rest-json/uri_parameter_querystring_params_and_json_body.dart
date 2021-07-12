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

/// URI parameter, querystring params and JSON body
class UriParameterQuerystringParamsAndJsonBody {
  final _s.RestJsonProtocol _protocol;
  UriParameterQuerystringParamsAndJsonBody({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'URIParameter,QuerystringParamsAndJSONBody',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    required String pipelineId,
    String? ascending,
    StructType? config,
    String? pageToken,
  }) async {
    ArgumentError.checkNotNull(pipelineId, 'pipelineId');
    final $query = <String, List<String>>{
      if (ascending != null) 'Ascending': [ascending],
      if (pageToken != null) 'PageToken': [pageToken],
    };
    final $payload = <String, dynamic>{
      if (config != null) 'Config': config,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2014-01-01/jobsByPipeline/${Uri.encodeComponent(pipelineId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class StructType {
  final String? a;
  final String? b;

  StructType({
    this.a,
    this.b,
  });

  factory StructType.fromJson(Map<String, dynamic> json) {
    return StructType(
      a: json['A'] as String?,
      b: json['B'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final a = this.a;
    final b = this.b;
    return {
      if (a != null) 'A': a,
      if (b != null) 'B': b,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
