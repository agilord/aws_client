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

import 'recursive_shapes.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Recursive shapes
class RecursiveShapes {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  RecursiveShapes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'RecursiveShapes',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<void> operationName0({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, dynamic>{};
    recursiveStruct?.also((arg) => $request['RecursiveStruct'] = arg);
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
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, dynamic>{};
    recursiveStruct?.also((arg) => $request['RecursiveStruct'] = arg);
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

  Future<void> operationName2({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, dynamic>{};
    recursiveStruct?.also((arg) => $request['RecursiveStruct'] = arg);
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

  Future<void> operationName3({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, dynamic>{};
    recursiveStruct?.also((arg) => $request['RecursiveStruct'] = arg);
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

  Future<void> operationName4({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, dynamic>{};
    recursiveStruct?.also((arg) => $request['RecursiveStruct'] = arg);
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

  Future<void> operationName5({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, dynamic>{};
    recursiveStruct?.also((arg) => $request['RecursiveStruct'] = arg);
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

class RecursiveStructType {
  final String? noRecurse;
  final List<RecursiveStructType>? recursiveList;
  final Map<String, RecursiveStructType>? recursiveMap;
  final RecursiveStructType? recursiveStruct;

  RecursiveStructType({
    this.noRecurse,
    this.recursiveList,
    this.recursiveMap,
    this.recursiveStruct,
  });

  factory RecursiveStructType.fromJson(Map<String, dynamic> json) {
    return RecursiveStructType(
      noRecurse: json['NoRecurse'] as String?,
      recursiveList: (json['RecursiveList'] as List?)
          ?.whereNotNull()
          .map((e) => RecursiveStructType.fromJson(e as Map<String, dynamic>))
          .toList(),
      recursiveMap: (json['RecursiveMap'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, RecursiveStructType.fromJson(e as Map<String, dynamic>))),
      recursiveStruct: json['RecursiveStruct'] != null
          ? RecursiveStructType.fromJson(
              json['RecursiveStruct'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final noRecurse = this.noRecurse;
    final recursiveList = this.recursiveList;
    final recursiveMap = this.recursiveMap;
    final recursiveStruct = this.recursiveStruct;
    return {
      if (noRecurse != null) 'NoRecurse': noRecurse,
      if (recursiveList != null) 'RecursiveList': recursiveList,
      if (recursiveMap != null) 'RecursiveMap': recursiveMap,
      if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
