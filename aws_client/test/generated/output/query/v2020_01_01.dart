// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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
  final _s.QueryProtocol _protocol;
  factory EnumOutput({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'EnumOutput',
    );
    return EnumOutput._(
      protocol: _s.QueryProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.forProtocol(
            service: service, region: region, endpointUrl: endpointUrl),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  EnumOutput._({
    required _s.QueryProtocol protocol,
  }) : _protocol = protocol;

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

/// @nodoc
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

  Map<String, dynamic> toJson() {
    final fooEnum = this.fooEnum;
    final listEnums = this.listEnums;
    return {
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (listEnums != null)
        'ListEnums': listEnums.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class EC2EnumType {
  static const foo = EC2EnumType._('foo');
  static const bar = EC2EnumType._('bar');

  final String value;

  const EC2EnumType._(this.value);

  static const values = [foo, bar];

  static EC2EnumType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EC2EnumType._(value));

  @override
  bool operator ==(other) => other is EC2EnumType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
