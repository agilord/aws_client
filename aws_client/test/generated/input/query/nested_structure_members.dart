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

import 'nested_structure_members.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

part 'nested_structure_members.g.dart';

/// Nested structure members
class NestedStructureMembers {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  NestedStructureMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
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
    StructType structArg,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StructType {
  @_s.JsonKey(name: 'ScalarArg')
  final String scalarArg;

  StructType({
    this.scalarArg,
  });
  Map<String, dynamic> toJson() => _$StructTypeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
