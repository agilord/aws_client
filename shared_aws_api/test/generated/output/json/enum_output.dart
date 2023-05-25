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

/// Enum output
class EnumOutput {
  final _s.JsonProtocol _protocol;
  EnumOutput({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'EnumOutput',
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
}

enum JSONEnumType {
  foo,
  bar,
}

extension JSONEnumTypeValueExtension on JSONEnumType {
  String toValue() {
    switch (this) {
      case JSONEnumType.foo:
        return 'foo';
      case JSONEnumType.bar:
        return 'bar';
    }
  }
}

extension JSONEnumTypeFromString on String {
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
