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

/// XML Attribute
class XmlAttribute {
  final _s.RestXmlProtocol _protocol;
  XmlAttribute({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'XMLAttribute',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    Grant grant,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      payload: grant?.toXml('Grant'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class Grant {
  final Grantee grantee;

  Grant({
    this.grantee,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (grantee != null) grantee?.toXml('Grantee'),
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

class Grantee {
  final String emailAddress;
  final String type;

  Grantee({
    this.emailAddress,
    this.type,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (emailAddress != null)
        _s.encodeXmlStringValue('EmailAddress', emailAddress),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      _s.XmlAttribute(_s.XmlName('xsi', 'xmlns'),
          'http://www.w3.org/2001/XMLSchema-instance'),
      if (type != null) _s.XmlAttribute(_s.XmlName('xsi:type'), type),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
