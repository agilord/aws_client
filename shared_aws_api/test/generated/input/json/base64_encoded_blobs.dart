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
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'base64_encoded_blobs.g.dart';

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
          service: 'Base64EncodedBlobs',
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
      payload: InputShape(
        blobArg: blobArg,
        blobMap: blobMap,
      ),
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
      payload: InputShape(
        blobArg: blobArg,
        blobMap: blobMap,
      ),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputShape {
  @Uint8ListConverter()
  @_s.JsonKey(name: 'BlobArg')
  final Uint8List blobArg;
  @Uint8ListConverter()
  @_s.JsonKey(name: 'BlobMap')
  final Map<String, Uint8List> blobMap;

  InputShape({
    this.blobArg,
    this.blobMap,
  });
  Map<String, dynamic> toJson() => _$InputShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
