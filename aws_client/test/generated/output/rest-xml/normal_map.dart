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

/// Normal map
class NormalMap {
  final _s.RestXmlProtocol _protocol;
  NormalMap({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NormalMap',
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
  final Map<String, SingleStructure> map;

  OutputShape({
    this.map,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      map: Map.fromEntries(
        elem.getElement('Map').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlChild(c, 'value')
                    ?.let((e) => SingleStructure.fromXml(e)),
              ),
            ),
      ),
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
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
