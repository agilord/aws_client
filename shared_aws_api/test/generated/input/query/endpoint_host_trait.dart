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

import 'endpoint_host_trait.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Endpoint host trait
class EndpointHostTrait {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  EndpointHostTrait({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: 'EndpointHostTrait',
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> staticOp0({
    String name,
  }) async {
    final $request = <String, dynamic>{};
    name?.also((arg) => $request['Name'] = arg);
    await _protocol.send(
      $request,
      action: 'StaticOp',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StaticInputShape'],
      shapes: shapes,
    );
  }

  Future<void> memberRefOp1({
    String name,
  }) async {
    final $request = <String, dynamic>{};
    name?.also((arg) => $request['Name'] = arg);
    await _protocol.send(
      $request,
      action: 'MemberRefOp',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['MemberRefInputShape'],
      shapes: shapes,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
