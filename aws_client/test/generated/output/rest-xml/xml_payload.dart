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

/// XML payload
class XmlPayload {
  final _s.RestXmlProtocol _protocol;
  XmlPayload({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'XMLPayload',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return OutputShape(
      data: SingleStructure.fromXml($elem),
      header: _s.extractHeaderStringValue($result.headers, 'X-Foo'),
    );
  }
}

class OutputShape {
  final SingleStructure? data;
  final String? header;

  OutputShape({
    this.data,
    this.header,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      data: json['Data'] != null
          ? SingleStructure.fromJson(json['Data'] as Map<String, dynamic>)
          : null,
      header: json['X-Foo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final header = this.header;
    return {
      if (data != null) 'Data': data,
    };
  }
}

class SingleStructure {
  final String? foo;

  SingleStructure({
    this.foo,
  });

  factory SingleStructure.fromJson(Map<String, dynamic> json) {
    return SingleStructure(
      foo: json['Foo'] as String?,
    );
  }

  factory SingleStructure.fromXml(_s.XmlElement elem) {
    return SingleStructure(
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'Foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
