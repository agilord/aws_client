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

/// Idempotency token auto fill
class IdempotencyTokenAutoFill {
  final _s.RestXmlProtocol _protocol;
  IdempotencyTokenAutoFill({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'IdempotencyTokenAutoFill',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String? token,
  }) async {
    token ??= _s.generateIdempotencyToken();
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(token: token).toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    String? token,
  }) async {
    token ??= _s.generateIdempotencyToken();
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(token: token).toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final String? token;

  InputShape({
    this.token,
  });

  factory InputShape.fromJson(Map<String, dynamic> json) {
    return InputShape(
      token: json['Token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    return {
      if (token != null) 'Token': token,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final token = this.token;
    final $children = <_s.XmlNode>[
      if (token != null) _s.encodeXmlStringValue('Token', token),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
