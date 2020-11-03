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

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// URI parameter and querystring params
class URIParameterAndQuerystringParams {
  final _s.RestJsonProtocol _protocol;
  URIParameterAndQuerystringParams({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'URIParameterAndQuerystringParams',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String ascending,
    String pageToken,
    String pipelineId,
  }) async {
    var _query = '';
    _query = '?${[
      if (ascending != null) _s.toQueryParam('Ascending', ascending),
      if (pageToken != null) _s.toQueryParam('PageToken', pageToken),
    ].where((e) => e != null).join('&')}';
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2014-01-01/jobsByPipeline/${Uri.encodeComponent(pipelineId.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
