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

/// Nested structures
class NestedStructures {
  final _s.RestXmlProtocol _protocol;
  NestedStructures({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NestedStructures',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    String? description,
    SubStructure? subStructure,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      payload: InputShape(description: description, subStructure: subStructure)
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
  final String? description;
  final SubStructure? subStructure;

  InputShape({
    this.description,
    this.subStructure,
  });

  factory InputShape.fromJson(Map<String, dynamic> json) {
    return InputShape(
      description: json['Description'] as String?,
      subStructure: json['SubStructure'] != null
          ? SubStructure.fromJson(json['SubStructure'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final subStructure = this.subStructure;
    return {
      if (description != null) 'Description': description,
      if (subStructure != null) 'SubStructure': subStructure,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final description = this.description;
    final subStructure = this.subStructure;
    final $children = <_s.XmlNode>[
      if (subStructure != null) subStructure.toXml('SubStructure'),
      if (description != null)
        _s.encodeXmlStringValue('Description', description),
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

class SubStructure {
  final String? bar;
  final String? foo;

  SubStructure({
    this.bar,
    this.foo,
  });

  factory SubStructure.fromJson(Map<String, dynamic> json) {
    return SubStructure(
      bar: json['Bar'] as String?,
      foo: json['Foo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bar = this.bar;
    final foo = this.foo;
    return {
      if (bar != null) 'Bar': bar,
      if (foo != null) 'Foo': foo,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bar = this.bar;
    final foo = this.foo;
    final $children = <_s.XmlNode>[
      if (foo != null) _s.encodeXmlStringValue('Foo', foo),
      if (bar != null) _s.encodeXmlStringValue('Bar', bar),
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
