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

/// Serialize other scalar types
class SerializeOtherScalarTypes {
  final _s.RestXmlProtocol _protocol;
  SerializeOtherScalarTypes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'SerializeOtherScalarTypes',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    bool first,
    int fourth,
    bool second,
    double third,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      payload:
          InputShape(first: first, fourth: fourth, second: second, third: third)
              .toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final bool first;
  final int fourth;
  final bool second;
  final double third;

  InputShape({
    this.first,
    this.fourth,
    this.second,
    this.third,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (first != null) _s.encodeXmlBoolValue('First', first),
      if (second != null) _s.encodeXmlBoolValue('Second', second),
      if (third != null) _s.encodeXmlDoubleValue('Third', third),
      if (fourth != null) _s.encodeXmlIntValue('Fourth', fourth),
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
