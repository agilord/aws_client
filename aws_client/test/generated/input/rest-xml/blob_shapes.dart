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

/// Blob shapes
class BlobShapes {
  final _s.RestXmlProtocol _protocol;
  BlobShapes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'BlobShapes',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    StructureShape? structureParam,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      payload: InputShape(structureParam: structureParam).toXml(
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
  final StructureShape? structureParam;

  InputShape({
    this.structureParam,
  });

  factory InputShape.fromJson(Map<String, dynamic> json) {
    return InputShape(
      structureParam: json['StructureParam'] != null
          ? StructureShape.fromJson(
              json['StructureParam'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final structureParam = this.structureParam;
    return {
      if (structureParam != null) 'StructureParam': structureParam,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final structureParam = this.structureParam;
    final $children = <_s.XmlNode>[
      if (structureParam != null) structureParam.toXml('StructureParam'),
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

class StructureShape {
  final Uint8List? b;

  StructureShape({
    this.b,
  });

  factory StructureShape.fromJson(Map<String, dynamic> json) {
    return StructureShape(
      b: _s.decodeNullableUint8List(json['b'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final b = this.b;
    return {
      if (b != null) 'b': base64Encode(b),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final b = this.b;
    final $children = <_s.XmlNode>[
      if (b != null) _s.encodeXmlUint8ListValue('b', b),
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
