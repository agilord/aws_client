// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Serialize blobs in body
class SerializeBlobsInBody {
  final _s.RestJsonProtocol _protocol;
  SerializeBlobsInBody({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'SerializeBlobsInBody',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    @_s.required String foo,
    Uint8List bar,
  }) async {
    ArgumentError.checkNotNull(foo, 'foo');
    final $payload = <String, dynamic>{
      if (bar != null) 'Bar': base64Encode(bar),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2014-01-01/${Uri.encodeComponent(foo)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
