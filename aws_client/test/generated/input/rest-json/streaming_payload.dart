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

/// Streaming payload
class StreamingPayload {
  final _s.RestJsonProtocol _protocol;
  StreamingPayload({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'StreamingPayload',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    @_s.required String vaultName,
    Uint8List body,
    String checksum,
  }) async {
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final headers = <String, String>{};
    checksum?.let((v) => headers['x-amz-sha256-tree-hash'] = v.toString());
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri:
          '/2014-01-01/vaults/${Uri.encodeComponent(vaultName)}/archives',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
