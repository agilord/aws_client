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

/// List of structures
class ListOfStructures {
  final _s.RestXmlProtocol _protocol;
  ListOfStructures({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ListOfStructures',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    List<SingleFieldStruct>? listParam,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      payload: InputShape(listParam: listParam).toXml(
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
  final List<SingleFieldStruct>? listParam;

  InputShape({
    this.listParam,
  });

  factory InputShape.fromJson(Map<String, dynamic> json) {
    return InputShape(
      listParam: (json['item'] as List?)
          ?.whereNotNull()
          .map((e) => SingleFieldStruct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final listParam = this.listParam;
    return {
      if (listParam != null) 'item': listParam,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final listParam = this.listParam;
    final $children = <_s.XmlNode>[
      if (listParam != null) ...listParam.map((e) => e.toXml('item')),
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

class SingleFieldStruct {
  final String? element;

  SingleFieldStruct({
    this.element,
  });

  factory SingleFieldStruct.fromJson(Map<String, dynamic> json) {
    return SingleFieldStruct(
      element: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final element = this.element;
    return {
      if (element != null) 'value': element,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final element = this.element;
    final $children = <_s.XmlNode>[
      if (element != null) _s.encodeXmlStringValue('value', element),
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
