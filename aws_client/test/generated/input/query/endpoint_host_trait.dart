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

import 'endpoint_host_trait.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Endpoint host trait
class EndpointHostTrait {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  EndpointHostTrait({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'EndpointHostTrait',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> staticOp0({
    String? name,
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
    String? name,
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
