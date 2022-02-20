// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_credential_providers/aws_credential_providers.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Blob members
class BlobMembers {
  final _s.JsonProtocol _protocol;
  BlobMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider = defaultProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'BlobMembers',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'BlobMembers.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
  }
}

class OutputShape {
  final Uint8List? blobMember;
  final BlobContainer? structMember;

  OutputShape({
    this.blobMember,
    this.structMember,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      blobMember: _s.decodeNullableUint8List(json['BlobMember'] as String?),
      structMember: json['StructMember'] != null
          ? BlobContainer.fromJson(json['StructMember'] as Map<String, dynamic>)
          : null,
    );
  }
}

class BlobContainer {
  final Uint8List? foo;

  BlobContainer({
    this.foo,
  });
  factory BlobContainer.fromJson(Map<String, dynamic> json) {
    return BlobContainer(
      foo: _s.decodeNullableUint8List(json['foo'] as String?),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
