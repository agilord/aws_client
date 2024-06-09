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

/// Enum output
class EnumOutput {
  final _s.QueryProtocol _protocol;

  EnumOutput({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
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
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final EC2EnumType? fooEnum;
  final List<EC2EnumType>? listEnums;

  OutputShape({
    this.fooEnum,
    this.listEnums,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      fooEnum: _s
          .extractXmlStringValue(elem, 'FooEnum')
          ?.let(EC2EnumType.fromString),
      listEnums: _s.extractXmlChild(elem, 'ListEnums')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map(EC2EnumType.fromString)
          .toList()),
    );
  }
}

enum EC2EnumType {
  foo('foo'),
  bar('bar'),
  ;

  final String value;

  const EC2EnumType(this.value);

  static EC2EnumType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EC2EnumType'));
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
