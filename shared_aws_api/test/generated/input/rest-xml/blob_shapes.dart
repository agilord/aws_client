// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Blob shapes
class BlobShapes {
  final _s.RestXmlProtocol _protocol;
  BlobShapes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'BlobShapes',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
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
