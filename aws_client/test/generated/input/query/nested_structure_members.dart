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

import 'nested_structure_members.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Nested structure members
class NestedStructureMembers {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  NestedStructureMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NestedStructureMembers',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

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

  factory StructType.fromJson(Map<String, dynamic> json) {
    return StructType(
      scalarArg: json['ScalarArg'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scalarArg = this.scalarArg;
    return {
      if (scalarArg != null) 'ScalarArg': scalarArg,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
