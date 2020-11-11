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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'omits_null_query_params,_but_serializes_empty_strings.g.dart';

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
          service: 'OmitsNullQueryParams,ButSerializesEmptyStrings',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String foo,
  }) async {
    var _query = '';
    _query = '?${[
      if (foo != null) _s.toQueryParam('param-name', foo),
    ].where((e) => e != null).join('&')}';
    final $payload = InputShape(
      foo: foo,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    String foo,
  }) async {
    var _query = '';
    _query = '?${[
      if (foo != null) _s.toQueryParam('param-name', foo),
    ].where((e) => e != null).join('&')}';
    final $payload = InputShape(
      foo: foo,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path?abc=mno$_query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputShape {
  @_s.JsonKey(name: 'param-name', ignore: true)
  final String foo;

  InputShape({
    this.foo,
  });
  Map<String, dynamic> toJson() => _$InputShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
