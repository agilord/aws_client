// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

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
          service: _s.ServiceMetadata(
            endpointPrefix: 'StringToStringListMapsInQuerystring',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String pipelineId,
    Map<String, List<String>> queryDoc,
  }) async {
    final $query = <String, List<String>>{
      if (queryDoc != null)
        for (var e in queryDoc.entries) e.key: e.value,
    };
    await _protocol.send(
      method: 'GET',
      requestUri:
          '/2014-01-01/jobsByPipeline/${Uri.encodeComponent(pipelineId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
