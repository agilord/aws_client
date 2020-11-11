// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart' show Uint8ListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// XML payload
class XMLPayload {
  final _s.RestXmlProtocol _protocol;
  XMLPayload({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'XMLPayload',
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
    return OutputShape.fromXml($result.body, headers: $result.headers);
  }
}

class OutputShape {
  final SingleStructure data;
  final String header;

  OutputShape({
    this.data,
    this.header,
  });
  factory OutputShape.fromXml(
    _s.XmlElement elem, {
    Map<String, String> headers,
  }) {
    return OutputShape(
      data: elem?.let((e) => SingleStructure.fromXml(e)),
      header: _s.extractHeaderStringValue(headers, 'X-Foo'),
    );
  }
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
