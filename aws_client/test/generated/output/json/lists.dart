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

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Lists
class Lists {
  final _s.JsonProtocol _protocol;
  Lists({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Lists',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Lists.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
  }

  Future<OutputShape> operationName1() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Lists.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
  }
}

class OutputShape {
  final List<String>? listMember;
  final List<Map<String, String>>? listMemberMap;
  final List<StructType>? listMemberStruct;

  OutputShape({
    this.listMember,
    this.listMemberMap,
    this.listMemberStruct,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      listMember: (json['ListMember'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      listMemberMap: (json['ListMemberMap'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      listMemberStruct: (json['ListMemberStruct'] as List?)
          ?.whereNotNull()
          .map((e) => StructType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final listMember = this.listMember;
    final listMemberMap = this.listMemberMap;
    final listMemberStruct = this.listMemberStruct;
    return {
      if (listMember != null) 'ListMember': listMember,
      if (listMemberMap != null) 'ListMemberMap': listMemberMap,
      if (listMemberStruct != null) 'ListMemberStruct': listMemberStruct,
    };
  }
}

class StructType {
  StructType();

  factory StructType.fromJson(Map<String, dynamic> _) {
    return StructType();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
