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

/// Blob members
class BlobMembers {
  final _s.RestJsonProtocol _protocol;
  BlobMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'BlobMembers',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromJson(response);
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

  Map<String, dynamic> toJson() {
    final blobMember = this.blobMember;
    final structMember = this.structMember;
    return {
      if (blobMember != null) 'BlobMember': base64Encode(blobMember),
      if (structMember != null) 'StructMember': structMember,
    };
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

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'foo': base64Encode(foo),
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
