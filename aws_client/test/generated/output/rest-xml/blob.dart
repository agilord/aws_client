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

/// Blob
class Blob {
  final _s.RestXmlProtocol _protocol;
  Blob({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Blob',
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
  final Uint8List? blob;

  OutputShape({
    this.blob,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      blob: _s.extractXmlUint8ListValue(elem, 'Blob'),
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
