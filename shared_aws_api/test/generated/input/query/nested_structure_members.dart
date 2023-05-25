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

import 'nested_structure_members.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Nested structure members
class NestedStructureMembers {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  NestedStructureMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NestedStructureMembers',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
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
    StructType? structArg,
  }) async {
    final $request = <String, dynamic>{};
    structArg?.also((arg) => $request['StructArg'] = arg);
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

class StructType {
  final String? scalarArg;

  StructType({
    this.scalarArg,
  });

  Map<String, dynamic> toJson() {
    final scalarArg = this.scalarArg;
    return {
      if (scalarArg != null) 'ScalarArg': scalarArg,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
