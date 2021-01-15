// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Empty string
class EmptyString {
  final _s.RestXmlProtocol _protocol;
  EmptyString({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'EmptyString',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result.body);
  }
}

class OutputShape {
  final String foo;

  OutputShape({
    this.foo,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
