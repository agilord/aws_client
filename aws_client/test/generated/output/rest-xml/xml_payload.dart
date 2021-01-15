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

/// XML payload
class XmlPayload {
  final _s.RestXmlProtocol _protocol;
  XmlPayload({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  final SingleStructure data;
  final String header;

  OutputShape({
    this.data,
    this.header,
  });
}

class SingleStructure {
  final String foo;

  SingleStructure({
    this.foo,
  });
  factory SingleStructure.fromXml(_s.XmlElement elem) {
    return SingleStructure(
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
