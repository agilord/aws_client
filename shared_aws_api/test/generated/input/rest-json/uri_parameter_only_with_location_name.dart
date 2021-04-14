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

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// URI parameter only with location name
class URIParameterOnlyWithLocationName {
  final _s.RestJsonProtocol _protocol;
  URIParameterOnlyWithLocationName({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'URIParameterOnlyWithLocationName',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    required String foo,
  }) async {
    ArgumentError.checkNotNull(foo, 'foo');
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2014-01-01/jobsByPipeline/${Uri.encodeComponent(foo)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
