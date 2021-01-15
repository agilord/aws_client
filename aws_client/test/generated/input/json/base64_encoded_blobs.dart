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

/// Base64 encoded Blobs
class Base64EncodedBlobs {
  final _s.JsonProtocol _protocol;
  Base64EncodedBlobs({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Base64EncodedBlobs',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    Uint8List blobArg,
    Map<String, Uint8List> blobMap,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (blobArg != null) 'BlobArg': base64Encode(blobArg),
        if (blobMap != null)
          'BlobMap': blobMap.map((k, e) => MapEntry(k, e?.let(base64Encode))),
      },
    );
  }

  Future<void> operationName1({
    Uint8List blobArg,
    Map<String, Uint8List> blobMap,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'com.amazonaws.foo.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (blobArg != null) 'BlobArg': base64Encode(blobArg),
        if (blobMap != null)
          'BlobMap': blobMap.map((k, e) => MapEntry(k, e?.let(base64Encode))),
      },
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
