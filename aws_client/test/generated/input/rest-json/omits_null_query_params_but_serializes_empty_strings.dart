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

/// Omits null query params, but serializes empty strings
class OmitsNullQueryParamsButSerializesEmptyStrings {
  final _s.RestJsonProtocol _protocol;
  OmitsNullQueryParamsButSerializesEmptyStrings({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'OmitsNullQueryParams,ButSerializesEmptyStrings',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String foo,
  }) async {
    final $query = <String, List<String>>{
      if (foo != null) 'param-name': [foo],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/path',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    String foo,
  }) async {
    final $query = <String, List<String>>{
      if (foo != null) 'param-name': [foo],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/path?abc=mno',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
