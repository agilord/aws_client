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

/// Streaming payload
class StreamingPayload {
  final _s.RestXmlProtocol _protocol;
  StreamingPayload({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'StreamingPayload',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape(
      stream: await $result.stream.toBytes(),
    );
  }
}

class OutputShape {
  final Uint8List stream;

  OutputShape({
    this.stream,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      stream: _s.extractXmlUint8ListValue(elem, 'Stream'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
