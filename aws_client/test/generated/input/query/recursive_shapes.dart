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

import 'recursive_shapes.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

part 'recursive_shapes.g.dart';

/// Recursive shapes
class RecursiveShapes {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  RecursiveShapes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
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
    RecursiveStructType recursiveStruct,
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
    RecursiveStructType recursiveStruct,
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
    RecursiveStructType recursiveStruct,
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
    RecursiveStructType recursiveStruct,
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
    RecursiveStructType recursiveStruct,
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
    RecursiveStructType recursiveStruct,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RecursiveStructType {
  @_s.JsonKey(name: 'NoRecurse')
  final String noRecurse;
  @_s.JsonKey(name: 'RecursiveList')
  final List<RecursiveStructType> recursiveList;
  @_s.JsonKey(name: 'RecursiveMap')
  final Map<String, RecursiveStructType> recursiveMap;
  @_s.JsonKey(name: 'RecursiveStruct')
  final RecursiveStructType recursiveStruct;

  RecursiveStructType({
    this.noRecurse,
    this.recursiveList,
    this.recursiveMap,
    this.recursiveStruct,
  });
  Map<String, dynamic> toJson() => _$RecursiveStructTypeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
