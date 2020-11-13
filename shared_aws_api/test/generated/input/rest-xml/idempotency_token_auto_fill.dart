// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Idempotency token auto fill
class IdempotencyTokenAutoFill {
  final _s.RestXmlProtocol _protocol;
  IdempotencyTokenAutoFill({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    String token,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(token: token).toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    String token,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: InputShape(token: token).toXml('InputShape'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final String token;

  InputShape({
    this.token,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Token', token),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
