// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart' show Uint8ListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// String to string list maps in querystring
class StringToStringListMapsInQuerystring {
  final _s.RestXmlProtocol _protocol;
  StringToStringListMapsInQuerystring({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'StringToStringListMapsInQuerystring',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String pipelineId,
    Map<String, List<String>> queryDoc,
  }) async {
    final queryParams = <String, String>{};
    queryDoc?.let((v) => queryParams['QueryDoc'] = v.toString());
    await _protocol.send(
      method: 'GET',
      requestUri:
          '/2014-01-01/jobsByPipeline/${Uri.encodeComponent(pipelineId.toString())}',
      queryParams: queryParams,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
