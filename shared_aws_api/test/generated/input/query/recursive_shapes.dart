// ignore_for_file: deprecated_member_use_from_same_package
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

/// Recursive shapes
class RecursiveShapes {
  final _s.QueryProtocol _protocol;

  RecursiveShapes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'RecursiveShapes',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> operationName0({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, String>{
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, String>{
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, String>{
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName3({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, String>{
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName4({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, String>{
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName5({
    RecursiveStructType? recursiveStruct,
  }) async {
    final $request = <String, String>{
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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

  Map<String, String> toQueryMap() {
    final noRecurse = this.noRecurse;
    final recursiveList = this.recursiveList;
    final recursiveMap = this.recursiveMap;
    final recursiveStruct = this.recursiveStruct;
    return {
      if (noRecurse != null) 'NoRecurse': noRecurse,
      if (recursiveList != null)
        if (recursiveList.isEmpty)
          'RecursiveList': ''
        else
          for (var i1 = 0; i1 < recursiveList.length; i1++)
            for (var e3 in recursiveList[i1].toQueryMap().entries)
              'RecursiveList.member.${i1 + 1}.${e3.key}': e3.value,
      if (recursiveMap != null)
        for (var e1 in recursiveMap.entries.toList().asMap().entries) ...{
          'RecursiveMap.entry.${e1.key + 1}.key': e1.value.key,
          for (var e4 in e1.value.value.toQueryMap().entries)
            'RecursiveMap.entry.${e1.key + 1}.value.${e4.key}': e4.value,
        },
      if (recursiveStruct != null)
        for (var e1 in recursiveStruct.toQueryMap().entries)
          'RecursiveStruct.${e1.key}': e1.value,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
