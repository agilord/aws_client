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

part 'recursive_shapes.g.dart';

/// Recursive shapes
class RecursiveShapes {
  final _s.JsonProtocol _protocol;
  RecursiveShapes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'RecursiveShapes',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    RecursiveStructType recursiveStruct,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      },
    );
  }

  Future<void> operationName1({
    RecursiveStructType recursiveStruct,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      },
    );
  }

  Future<void> operationName2({
    RecursiveStructType recursiveStruct,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      },
    );
  }

  Future<void> operationName3({
    RecursiveStructType recursiveStruct,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      },
    );
  }

  Future<void> operationName4({
    RecursiveStructType recursiveStruct,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      },
    );
  }

  Future<void> operationName5({
    RecursiveStructType recursiveStruct,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      },
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
