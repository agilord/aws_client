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

import 'flattened_list.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Flattened list
class FlattenedList {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  FlattenedList({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'FlattenedList',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> operationName0({
    List<String>? listArg,
    List<String>? namedListArg,
    String? scalarArg,
  }) async {
    final $request = <String, dynamic>{};
    listArg?.also((arg) => $request['ListArg'] = arg);
    namedListArg?.also((arg) => $request['NamedListArg'] = arg);
    scalarArg?.also((arg) => $request['ScalarArg'] = arg);
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }

  Future<void> operationName1({
    List<String>? listArg,
    List<String>? namedListArg,
    String? scalarArg,
  }) async {
    final $request = <String, dynamic>{};
    listArg?.also((arg) => $request['ListArg'] = arg);
    namedListArg?.also((arg) => $request['NamedListArg'] = arg);
    scalarArg?.also((arg) => $request['ScalarArg'] = arg);
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['InputShape'],
      shapes: shapes,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
