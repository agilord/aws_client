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

/// XML Attribute
class XmlAttribute {
  final _s.RestXmlProtocol _protocol;
  XmlAttribute({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    Grant? grant,
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
  final Grantee? grantee;

  Grant({
    this.grantee,
  });

  factory Grant.fromJson(Map<String, dynamic> json) {
    return Grant(
      grantee: json['Grantee'] != null
          ? Grantee.fromJson(json['Grantee'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grantee = this.grantee;
    return {
      if (grantee != null) 'Grantee': grantee,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final grantee = this.grantee;
    final $children = <_s.XmlNode>[
      if (grantee != null) grantee.toXml('Grantee'),
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

class Grantee {
  final String? emailAddress;
  final String? type;

  Grantee({
    this.emailAddress,
    this.type,
  });

  factory Grantee.fromJson(Map<String, dynamic> json) {
    return Grantee(
      emailAddress: json['EmailAddress'] as String?,
      type: json['xsi:type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final type = this.type;
    return {
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (type != null) 'xsi:type': type,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final emailAddress = this.emailAddress;
    final type = this.type;
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
      $children,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
