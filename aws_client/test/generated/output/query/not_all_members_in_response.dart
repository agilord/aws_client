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

import 'not_all_members_in_response.meta.dart';
export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Not all members in response
class NotAllMembersInResponse {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  NotAllMembersInResponse({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NotAllMembersInResponse',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  Future<OutputShape> operationName0() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'OperationNameResult',
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final int? num;
  final String? str;

  OutputShape({
    this.num,
    this.str,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      num: json['Num'] as int?,
      str: json['Str'] as String?,
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      num: _s.extractXmlIntValue(elem, 'Num'),
      str: _s.extractXmlStringValue(elem, 'Str'),
    );
  }

  Map<String, dynamic> toJson() {
    final num = this.num;
    final str = this.str;
    return {
      if (num != null) 'Num': num,
      if (str != null) 'Str': str,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
