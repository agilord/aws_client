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

/// Enum output
class EnumOutput {
  final _s.JsonProtocol _protocol;
  EnumOutput({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'EnumOutput',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EnumOutput.OperationName'
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
  final JSONEnumType? fooEnum;
  final List<JSONEnumType>? listEnums;

  OutputShape({
    this.fooEnum,
    this.listEnums,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      fooEnum: (json['FooEnum'] as String?)?.toJSONEnumType(),
      listEnums: (json['ListEnums'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toJSONEnumType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fooEnum = this.fooEnum;
    final listEnums = this.listEnums;
    return {
      if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.toValue()).toList(),
    };
  }
}

enum JSONEnumType {
  foo,
  bar,
}

extension on JSONEnumType {
  String toValue() {
    switch (this) {
      case JSONEnumType.foo:
        return 'foo';
      case JSONEnumType.bar:
        return 'bar';
    }
  }
}

extension on String {
  JSONEnumType toJSONEnumType() {
    switch (this) {
      case 'foo':
        return JSONEnumType.foo;
      case 'bar':
        return JSONEnumType.bar;
    }
    throw Exception('$this is not known in enum JSONEnumType');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
