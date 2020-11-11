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

part 'recursive_shapes.g.dart';

/// Recursive shapes
class RecursiveShapes {
  final _s.RestJsonProtocol _protocol;
  RecursiveShapes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'RecursiveShapes',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    RecursiveStructType recursiveStruct,
  }) async {
    final $payload = InputShape(
      recursiveStruct: recursiveStruct,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    RecursiveStructType recursiveStruct,
  }) async {
    final $payload = InputShape(
      recursiveStruct: recursiveStruct,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    RecursiveStructType recursiveStruct,
  }) async {
    final $payload = InputShape(
      recursiveStruct: recursiveStruct,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName3({
    RecursiveStructType recursiveStruct,
  }) async {
    final $payload = InputShape(
      recursiveStruct: recursiveStruct,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName4({
    RecursiveStructType recursiveStruct,
  }) async {
    final $payload = InputShape(
      recursiveStruct: recursiveStruct,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName5({
    RecursiveStructType recursiveStruct,
  }) async {
    final $payload = InputShape(
      recursiveStruct: recursiveStruct,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
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
  @_s.JsonKey(name: 'RecursiveStruct')
  final RecursiveStructType recursiveStruct;

  InputShape({
    this.recursiveStruct,
  });
  Map<String, dynamic> toJson() => _$InputShapeToJson(this);
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
