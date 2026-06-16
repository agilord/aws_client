// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon CloudFront KeyValueStore Service to View and Update Data in a KVS
/// Resource
class CloudFrontKeyValueStore {
  final _s.RestJsonProtocol _protocol;
  CloudFrontKeyValueStore({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudfront-keyvaluestore',
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

  /// Deletes the key value pair specified by the key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ifMatch] :
  /// The current version (ETag) of the Key Value Store that you are deleting
  /// keys from, which you can get using DescribeKeyValueStore.
  ///
  /// Parameter [key] :
  /// The key to delete.
  ///
  /// Parameter [kvsARN] :
  /// The Amazon Resource Name (ARN) of the Key Value Store.
  Future<DeleteKeyResponse> deleteKey({
    required String ifMatch,
    required String key,
    required String kvsARN,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/key-value-stores/${Uri.encodeComponent(kvsARN)}/keys/${Uri.encodeComponent(key)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteKeyResponse(
      itemCount: ($json['ItemCount'] as int?) ?? 0,
      totalSizeInBytes: ($json['TotalSizeInBytes'] as int?) ?? 0,
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Returns metadata information about Key Value Store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [kvsARN] :
  /// The Amazon Resource Name (ARN) of the Key Value Store.
  Future<DescribeKeyValueStoreResponse> describeKeyValueStore({
    required String kvsARN,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/key-value-stores/${Uri.encodeComponent(kvsARN)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeKeyValueStoreResponse(
      created: nonNullableTimeStampFromJson($json['Created'] ?? 0),
      itemCount: ($json['ItemCount'] as int?) ?? 0,
      kvsARN: ($json['KvsARN'] as String?) ?? '',
      totalSizeInBytes: ($json['TotalSizeInBytes'] as int?) ?? 0,
      failureReason: $json['FailureReason'] as String?,
      lastModified: timeStampFromJson($json['LastModified']),
      status: $json['Status'] as String?,
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Returns a key value pair.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [key] :
  /// The key to get.
  ///
  /// Parameter [kvsARN] :
  /// The Amazon Resource Name (ARN) of the Key Value Store.
  Future<GetKeyResponse> getKey({
    required String key,
    required String kvsARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/key-value-stores/${Uri.encodeComponent(kvsARN)}/keys/${Uri.encodeComponent(key)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetKeyResponse.fromJson(response);
  }

  /// Returns a list of key value pairs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [kvsARN] :
  /// The Amazon Resource Name (ARN) of the Key Value Store.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results that are returned per call. The default is 10
  /// and maximum allowed page is 50.
  ///
  /// Parameter [nextToken] :
  /// If nextToken is returned in the response, there are more results
  /// available. Make the next call using the returned token to retrieve the
  /// next page.
  Future<ListKeysResponse> listKeys({
    required String kvsARN,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/key-value-stores/${Uri.encodeComponent(kvsARN)}/keys',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKeysResponse.fromJson(response);
  }

  /// Creates a new key value pair or replaces the value of an existing key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ifMatch] :
  /// The current version (ETag) of the Key Value Store that you are putting
  /// keys into, which you can get using DescribeKeyValueStore.
  ///
  /// Parameter [key] :
  /// The key to put.
  ///
  /// Parameter [kvsARN] :
  /// The Amazon Resource Name (ARN) of the Key Value Store.
  ///
  /// Parameter [value] :
  /// The value to put.
  Future<PutKeyResponse> putKey({
    required String ifMatch,
    required String key,
    required String kvsARN,
    required String value,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'Value': value,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/key-value-stores/${Uri.encodeComponent(kvsARN)}/keys/${Uri.encodeComponent(key)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return PutKeyResponse(
      itemCount: ($json['ItemCount'] as int?) ?? 0,
      totalSizeInBytes: ($json['TotalSizeInBytes'] as int?) ?? 0,
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Puts or Deletes multiple key value pairs in a single, all-or-nothing
  /// operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ifMatch] :
  /// The current version (ETag) of the Key Value Store that you are updating
  /// keys of, which you can get using DescribeKeyValueStore.
  ///
  /// Parameter [kvsARN] :
  /// The Amazon Resource Name (ARN) of the Key Value Store.
  ///
  /// Parameter [deletes] :
  /// List of keys to delete.
  ///
  /// Parameter [puts] :
  /// List of key value pairs to put.
  Future<UpdateKeysResponse> updateKeys({
    required String ifMatch,
    required String kvsARN,
    List<DeleteKeyRequestListItem>? deletes,
    List<PutKeyRequestListItem>? puts,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      if (deletes != null) 'Deletes': deletes,
      if (puts != null) 'Puts': puts,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/key-value-stores/${Uri.encodeComponent(kvsARN)}/keys',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateKeysResponse(
      itemCount: ($json['ItemCount'] as int?) ?? 0,
      totalSizeInBytes: ($json['TotalSizeInBytes'] as int?) ?? 0,
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }
}

/// Metadata information about a Key Value Store.
class DeleteKeyResponse {
  /// The current version identifier of the Key Value Store after the successful
  /// delete.
  final String eTag;

  /// Number of key value pairs in the Key Value Store after the successful
  /// delete.
  final int itemCount;

  /// Total size of the Key Value Store after the successful delete, in bytes.
  final int totalSizeInBytes;

  DeleteKeyResponse({
    required this.eTag,
    required this.itemCount,
    required this.totalSizeInBytes,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final itemCount = this.itemCount;
    final totalSizeInBytes = this.totalSizeInBytes;
    return {
      'ItemCount': itemCount,
      'TotalSizeInBytes': totalSizeInBytes,
    };
  }
}

/// Metadata information about a Key Value Store.
class DescribeKeyValueStoreResponse {
  /// Date and time when the Key Value Store was created.
  final DateTime created;

  /// The version identifier for the current version of the Key Value Store.
  final String eTag;

  /// Number of key value pairs in the Key Value Store.
  final int itemCount;

  /// The Amazon Resource Name (ARN) of the Key Value Store.
  final String kvsARN;

  /// Total size of the Key Value Store in bytes.
  final int totalSizeInBytes;

  /// The reason for Key Value Store creation failure.
  final String? failureReason;

  /// Date and time when the key value pairs in the Key Value Store was last
  /// modified.
  final DateTime? lastModified;

  /// The current status of the Key Value Store.
  final String? status;

  DescribeKeyValueStoreResponse({
    required this.created,
    required this.eTag,
    required this.itemCount,
    required this.kvsARN,
    required this.totalSizeInBytes,
    this.failureReason,
    this.lastModified,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final created = this.created;
    final eTag = this.eTag;
    final itemCount = this.itemCount;
    final kvsARN = this.kvsARN;
    final totalSizeInBytes = this.totalSizeInBytes;
    final failureReason = this.failureReason;
    final lastModified = this.lastModified;
    final status = this.status;
    return {
      'Created': unixTimestampToJson(created),
      'ItemCount': itemCount,
      'KvsARN': kvsARN,
      'TotalSizeInBytes': totalSizeInBytes,
      if (failureReason != null) 'FailureReason': failureReason,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (status != null) 'Status': status,
    };
  }
}

/// A key value pair.
class GetKeyResponse {
  /// Number of key value pairs in the Key Value Store.
  final int itemCount;

  /// The key of the key value pair.
  final String key;

  /// Total size of the Key Value Store in bytes.
  final int totalSizeInBytes;

  /// The value of the key value pair.
  final String value;

  GetKeyResponse({
    required this.itemCount,
    required this.key,
    required this.totalSizeInBytes,
    required this.value,
  });

  factory GetKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetKeyResponse(
      itemCount: (json['ItemCount'] as int?) ?? 0,
      key: (json['Key'] as String?) ?? '',
      totalSizeInBytes: (json['TotalSizeInBytes'] as int?) ?? 0,
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final itemCount = this.itemCount;
    final key = this.key;
    final totalSizeInBytes = this.totalSizeInBytes;
    final value = this.value;
    return {
      'ItemCount': itemCount,
      'Key': key,
      'TotalSizeInBytes': totalSizeInBytes,
      'Value': value,
    };
  }
}

class ListKeysResponse {
  /// Key value pairs
  final List<ListKeysResponseListItem>? items;

  /// If nextToken is returned in the response, there are more results available.
  /// Make the next call using the returned token to retrieve the next page.
  final String? nextToken;

  ListKeysResponse({
    this.items,
    this.nextToken,
  });

  factory ListKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListKeysResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ListKeysResponseListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Metadata information about a Key Value Store.
class PutKeyResponse {
  /// The current version identifier of the Key Value Store after the successful
  /// put.
  final String eTag;

  /// Number of key value pairs in the Key Value Store after the successful put.
  final int itemCount;

  /// Total size of the Key Value Store after the successful put, in bytes.
  final int totalSizeInBytes;

  PutKeyResponse({
    required this.eTag,
    required this.itemCount,
    required this.totalSizeInBytes,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final itemCount = this.itemCount;
    final totalSizeInBytes = this.totalSizeInBytes;
    return {
      'ItemCount': itemCount,
      'TotalSizeInBytes': totalSizeInBytes,
    };
  }
}

/// Metadata information about a Key Value Store.
class UpdateKeysResponse {
  /// The current version identifier of the Key Value Store after the successful
  /// update.
  final String eTag;

  /// Number of key value pairs in the Key Value Store after the successful
  /// update.
  final int itemCount;

  /// Total size of the Key Value Store after the successful update, in bytes.
  final int totalSizeInBytes;

  UpdateKeysResponse({
    required this.eTag,
    required this.itemCount,
    required this.totalSizeInBytes,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final itemCount = this.itemCount;
    final totalSizeInBytes = this.totalSizeInBytes;
    return {
      'ItemCount': itemCount,
      'TotalSizeInBytes': totalSizeInBytes,
    };
  }
}

/// List item for keys to delete.
class DeleteKeyRequestListItem {
  /// The key of the key value pair to be deleted.
  final String key;

  DeleteKeyRequestListItem({
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// List item for key value pair to put.
class PutKeyRequestListItem {
  /// The key of the key value pair list item to put.
  final String key;

  /// The value for the key value pair to put.
  final String value;

  PutKeyRequestListItem({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// A key value pair.
class ListKeysResponseListItem {
  /// The key of the key value pair.
  final String key;

  /// The value of the key value pair.
  final String value;

  ListKeysResponseListItem({
    required this.key,
    required this.value,
  });

  factory ListKeysResponseListItem.fromJson(Map<String, dynamic> json) {
    return ListKeysResponseListItem(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
