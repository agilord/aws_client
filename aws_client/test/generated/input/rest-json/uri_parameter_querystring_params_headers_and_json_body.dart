// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

part 'uri_parameter_querystring_params_headers_and_json_body.g.dart';

/// URI parameter, querystring params, headers and JSON body
class UriParameterQuerystringParamsHeadersAndJsonBody {
  final _s.RestJsonProtocol _protocol;
  UriParameterQuerystringParamsHeadersAndJsonBody({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'URIParameter,QuerystringParams,HeadersAndJSONBody',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String ascending,
    String checksum,
    StructType config,
    String pageToken,
    String pipelineId,
  }) async {
    final headers = <String, String>{};
    checksum?.let((v) => headers['x-amz-checksum'] = v.toString());
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
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StructType {
  @_s.JsonKey(name: 'A')
  final String a;
  @_s.JsonKey(name: 'B')
  final String b;

  StructType({
    this.a,
    this.b,
  });
  Map<String, dynamic> toJson() => _$StructTypeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
