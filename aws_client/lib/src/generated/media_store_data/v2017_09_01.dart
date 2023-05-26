// ignore_for_file: deprecated_member_use_from_same_package
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

/// An AWS Elemental MediaStore asset is an object, similar to an object in the
/// Amazon S3 service. Objects are the fundamental entities that are stored in
/// AWS Elemental MediaStore.
class MediaStoreData {
  final _s.RestJsonProtocol _protocol;
  MediaStoreData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.mediastore',
            signingName: 'mediastore',
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

  /// Deletes an object at the specified path.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [ObjectNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [path] :
  /// The path (including the file name) where the object is stored in the
  /// container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file
  /// name&gt;
  Future<void> deleteObject({
    required String path,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/${path.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the headers for an object at the specified path.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [ObjectNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [path] :
  /// The path (including the file name) where the object is stored in the
  /// container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file
  /// name&gt;
  Future<DescribeObjectResponse> describeObject({
    required String path,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'HEAD',
      requestUri: '/${path.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeObjectResponse(
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentLength:
          _s.extractHeaderIntValue(response.headers, 'Content-Length'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
      lastModified:
          _s.extractHeaderDateTimeValue(response.headers, 'Last-Modified'),
    );
  }

  /// Downloads the object at the specified path. If the object’s upload
  /// availability is set to <code>streaming</code>, AWS Elemental MediaStore
  /// downloads the object even if it’s still uploading the object.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [ObjectNotFoundException].
  /// May throw [RequestedRangeNotSatisfiableException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [path] :
  /// The path (including the file name) where the object is stored in the
  /// container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file
  /// name&gt;
  ///
  /// For example, to upload the file <code>mlaw.avi</code> to the folder path
  /// <code>premium\canada</code> in the container <code>movies</code>, enter
  /// the path <code>premium/canada/mlaw.avi</code>.
  ///
  /// Do not include the container name in this path.
  ///
  /// If the path includes any folders that don't exist yet, the service creates
  /// them. For example, suppose you have an existing <code>premium/usa</code>
  /// subfolder. If you specify <code>premium/canada</code>, the service creates
  /// a <code>canada</code> subfolder in the <code>premium</code> folder. You
  /// then have two subfolders, <code>usa</code> and <code>canada</code>, in the
  /// <code>premium</code> folder.
  ///
  /// There is no correlation between the path to the source and the path
  /// (folders) in the container in AWS Elemental MediaStore.
  ///
  /// For more information about folders and how they exist in a container, see
  /// the <a href="http://docs.aws.amazon.com/mediastore/latest/ug/">AWS
  /// Elemental MediaStore User Guide</a>.
  ///
  /// The file name is the name that is assigned to the file that you upload.
  /// The file can have the same name inside and outside of AWS Elemental
  /// MediaStore, or it can have the same name. The file name can include or
  /// omit an extension.
  ///
  /// Parameter [range] :
  /// The range bytes of an object to retrieve. For more information about the
  /// <code>Range</code> header, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35">http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35</a>.
  /// AWS Elemental MediaStore ignores this header for partially uploaded
  /// objects that have streaming upload availability.
  Future<GetObjectResponse> getObject({
    required String path,
    String? range,
  }) async {
    final headers = <String, String>{
      if (range != null) 'Range': range.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/${path.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectResponse(
      body: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentLength:
          _s.extractHeaderIntValue(response.headers, 'Content-Length'),
      contentRange:
          _s.extractHeaderStringValue(response.headers, 'Content-Range'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
      lastModified:
          _s.extractHeaderDateTimeValue(response.headers, 'Last-Modified'),
      statusCode: response.statusCode,
    );
  }

  /// Provides a list of metadata entries about folders and objects in the
  /// specified folder.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a <code>ListItems</code> request with <code>MaxResults</code> set
  /// at 500. Although 2,000 items match your request, the service returns no
  /// more than the first 500 items. (The service also returns a
  /// <code>NextToken</code> value that you can use to fetch the next batch of
  /// results.) The service might return fewer results than the
  /// <code>MaxResults</code> value.
  ///
  /// If <code>MaxResults</code> is not included in the request, the service
  /// defaults to pagination with a maximum of 1,000 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a <code>ListItems</code> request with
  /// <code>MaxResults</code> set at 500. The service returns the first batch of
  /// results (up to 500) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListItems</code> request a
  /// second time and specify the <code>NextToken</code> value.
  ///
  /// Tokens expire after 15 minutes.
  ///
  /// Parameter [path] :
  /// The path in the container from which to retrieve items. Format: &lt;folder
  /// name&gt;/&lt;folder name&gt;/&lt;file name&gt;
  Future<ListItemsResponse> listItems({
    int? maxResults,
    String? nextToken,
    String? path,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (path != null) 'Path': [path],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListItemsResponse.fromJson(response);
  }

  /// Uploads an object to the specified path. Object sizes are limited to 25 MB
  /// for standard upload availability and 10 MB for streaming upload
  /// availability.
  ///
  /// May throw [ContainerNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [body] :
  /// The bytes to be stored.
  ///
  /// Parameter [path] :
  /// The path (including the file name) where the object is stored in the
  /// container. Format: &lt;folder name&gt;/&lt;folder name&gt;/&lt;file
  /// name&gt;
  ///
  /// For example, to upload the file <code>mlaw.avi</code> to the folder path
  /// <code>premium\canada</code> in the container <code>movies</code>, enter
  /// the path <code>premium/canada/mlaw.avi</code>.
  ///
  /// Do not include the container name in this path.
  ///
  /// If the path includes any folders that don't exist yet, the service creates
  /// them. For example, suppose you have an existing <code>premium/usa</code>
  /// subfolder. If you specify <code>premium/canada</code>, the service creates
  /// a <code>canada</code> subfolder in the <code>premium</code> folder. You
  /// then have two subfolders, <code>usa</code> and <code>canada</code>, in the
  /// <code>premium</code> folder.
  ///
  /// There is no correlation between the path to the source and the path
  /// (folders) in the container in AWS Elemental MediaStore.
  ///
  /// For more information about folders and how they exist in a container, see
  /// the <a href="http://docs.aws.amazon.com/mediastore/latest/ug/">AWS
  /// Elemental MediaStore User Guide</a>.
  ///
  /// The file name is the name that is assigned to the file that you upload.
  /// The file can have the same name inside and outside of AWS Elemental
  /// MediaStore, or it can have the same name. The file name can include or
  /// omit an extension.
  ///
  /// Parameter [cacheControl] :
  /// An optional <code>CacheControl</code> header that allows the caller to
  /// control the object's cache behavior. Headers can be passed in as specified
  /// in the HTTP at <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.
  ///
  /// Headers with a custom user-defined value are also accepted.
  ///
  /// Parameter [contentType] :
  /// The content type of the object.
  ///
  /// Parameter [storageClass] :
  /// Indicates the storage class of a <code>Put</code> request. Defaults to
  /// high-performance temporal storage class, and objects are persisted into
  /// durable storage shortly after being received.
  ///
  /// Parameter [uploadAvailability] :
  /// Indicates the availability of an object while it is still uploading. If
  /// the value is set to <code>streaming</code>, the object is available for
  /// downloading after some initial buffering but before the object is uploaded
  /// completely. If the value is set to <code>standard</code>, the object is
  /// available for downloading only when it is uploaded completely. The default
  /// value for this header is <code>standard</code>.
  ///
  /// To use this header, you must also set the HTTP
  /// <code>Transfer-Encoding</code> header to <code>chunked</code>.
  Future<PutObjectResponse> putObject({
    required Uint8List body,
    required String path,
    String? cacheControl,
    String? contentType,
    StorageClass? storageClass,
    UploadAvailability? uploadAvailability,
  }) async {
    final headers = <String, String>{
      if (cacheControl != null) 'Cache-Control': cacheControl.toString(),
      if (contentType != null) 'Content-Type': contentType.toString(),
      if (storageClass != null) 'x-amz-storage-class': storageClass.toValue(),
      if (uploadAvailability != null)
        'x-amz-upload-availability': uploadAvailability.toValue(),
    };
    final response = await _protocol.send(
      payload: body,
      method: 'PUT',
      requestUri: '/${path.split('/').map(Uri.encodeComponent).join('/')}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutObjectResponse.fromJson(response);
  }
}

class DeleteObjectResponse {
  DeleteObjectResponse();

  factory DeleteObjectResponse.fromJson(Map<String, dynamic> _) {
    return DeleteObjectResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeObjectResponse {
  /// An optional <code>CacheControl</code> header that allows the caller to
  /// control the object's cache behavior. Headers can be passed in as specified
  /// in the HTTP at <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.
  ///
  /// Headers with a custom user-defined value are also accepted.
  final String? cacheControl;

  /// The length of the object in bytes.
  final int? contentLength;

  /// The content type of the object.
  final String? contentType;

  /// The ETag that represents a unique instance of the object.
  final String? eTag;

  /// The date and time that the object was last modified.
  final DateTime? lastModified;

  DescribeObjectResponse({
    this.cacheControl,
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
  });

  Map<String, dynamic> toJson() {
    final cacheControl = this.cacheControl;
    final contentLength = this.contentLength;
    final contentType = this.contentType;
    final eTag = this.eTag;
    final lastModified = this.lastModified;
    return {};
  }
}

class GetObjectResponse {
  /// The HTML status code of the request. Status codes ranging from 200 to 299
  /// indicate success. All other status codes indicate the type of error that
  /// occurred.
  final int statusCode;

  /// The bytes of the object.
  final Uint8List? body;

  /// An optional <code>CacheControl</code> header that allows the caller to
  /// control the object's cache behavior. Headers can be passed in as specified
  /// in the HTTP spec at <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.
  ///
  /// Headers with a custom user-defined value are also accepted.
  final String? cacheControl;

  /// The length of the object in bytes.
  final int? contentLength;

  /// The range of bytes to retrieve.
  final String? contentRange;

  /// The content type of the object.
  final String? contentType;

  /// The ETag that represents a unique instance of the object.
  final String? eTag;

  /// The date and time that the object was last modified.
  final DateTime? lastModified;

  GetObjectResponse({
    required this.statusCode,
    this.body,
    this.cacheControl,
    this.contentLength,
    this.contentRange,
    this.contentType,
    this.eTag,
    this.lastModified,
  });

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final body = this.body;
    final cacheControl = this.cacheControl;
    final contentLength = this.contentLength;
    final contentRange = this.contentRange;
    final contentType = this.contentType;
    final eTag = this.eTag;
    final lastModified = this.lastModified;
    return {
      if (body != null) 'Body': base64Encode(body),
    };
  }
}

/// A metadata entry for a folder or object.
class Item {
  /// The length of the item in bytes.
  final int? contentLength;

  /// The content type of the item.
  final String? contentType;

  /// The ETag that represents a unique instance of the item.
  final String? eTag;

  /// The date and time that the item was last modified.
  final DateTime? lastModified;

  /// The name of the item.
  final String? name;

  /// The item type (folder or object).
  final ItemType? type;

  Item({
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
    this.name,
    this.type,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      contentLength: json['ContentLength'] as int?,
      contentType: json['ContentType'] as String?,
      eTag: json['ETag'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toItemType(),
    );
  }

  Map<String, dynamic> toJson() {
    final contentLength = this.contentLength;
    final contentType = this.contentType;
    final eTag = this.eTag;
    final lastModified = this.lastModified;
    final name = this.name;
    final type = this.type;
    return {
      if (contentLength != null) 'ContentLength': contentLength,
      if (contentType != null) 'ContentType': contentType,
      if (eTag != null) 'ETag': eTag,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ItemType {
  object,
  folder,
}

extension ItemTypeValueExtension on ItemType {
  String toValue() {
    switch (this) {
      case ItemType.object:
        return 'OBJECT';
      case ItemType.folder:
        return 'FOLDER';
    }
  }
}

extension ItemTypeFromString on String {
  ItemType toItemType() {
    switch (this) {
      case 'OBJECT':
        return ItemType.object;
      case 'FOLDER':
        return ItemType.folder;
    }
    throw Exception('$this is not known in enum ItemType');
  }
}

class ListItemsResponse {
  /// The metadata entries for the folders and objects at the requested path.
  final List<Item>? items;

  /// The token that can be used in a request to view the next set of results. For
  /// example, you submit a <code>ListItems</code> request that matches 2,000
  /// items with <code>MaxResults</code> set at 500. The service returns the first
  /// batch of results (up to 500) and a <code>NextToken</code> value that can be
  /// used to fetch the next batch of results.
  final String? nextToken;

  ListItemsResponse({
    this.items,
    this.nextToken,
  });

  factory ListItemsResponse.fromJson(Map<String, dynamic> json) {
    return ListItemsResponse(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
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

class PutObjectResponse {
  /// The SHA256 digest of the object that is persisted.
  final String? contentSHA256;

  /// Unique identifier of the object in the container.
  final String? eTag;

  /// The storage class where the object was persisted. The class should be
  /// “Temporal”.
  final StorageClass? storageClass;

  PutObjectResponse({
    this.contentSHA256,
    this.eTag,
    this.storageClass,
  });

  factory PutObjectResponse.fromJson(Map<String, dynamic> json) {
    return PutObjectResponse(
      contentSHA256: json['ContentSHA256'] as String?,
      eTag: json['ETag'] as String?,
      storageClass: (json['StorageClass'] as String?)?.toStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final contentSHA256 = this.contentSHA256;
    final eTag = this.eTag;
    final storageClass = this.storageClass;
    return {
      if (contentSHA256 != null) 'ContentSHA256': contentSHA256,
      if (eTag != null) 'ETag': eTag,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
    };
  }
}

enum StorageClass {
  temporal,
}

extension StorageClassValueExtension on StorageClass {
  String toValue() {
    switch (this) {
      case StorageClass.temporal:
        return 'TEMPORAL';
    }
  }
}

extension StorageClassFromString on String {
  StorageClass toStorageClass() {
    switch (this) {
      case 'TEMPORAL':
        return StorageClass.temporal;
    }
    throw Exception('$this is not known in enum StorageClass');
  }
}

enum UploadAvailability {
  standard,
  streaming,
}

extension UploadAvailabilityValueExtension on UploadAvailability {
  String toValue() {
    switch (this) {
      case UploadAvailability.standard:
        return 'STANDARD';
      case UploadAvailability.streaming:
        return 'STREAMING';
    }
  }
}

extension UploadAvailabilityFromString on String {
  UploadAvailability toUploadAvailability() {
    switch (this) {
      case 'STANDARD':
        return UploadAvailability.standard;
      case 'STREAMING':
        return UploadAvailability.streaming;
    }
    throw Exception('$this is not known in enum UploadAvailability');
  }
}

class ContainerNotFoundException extends _s.GenericAwsException {
  ContainerNotFoundException({String? type, String? message})
      : super(type: type, code: 'ContainerNotFoundException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class ObjectNotFoundException extends _s.GenericAwsException {
  ObjectNotFoundException({String? type, String? message})
      : super(type: type, code: 'ObjectNotFoundException', message: message);
}

class RequestedRangeNotSatisfiableException extends _s.GenericAwsException {
  RequestedRangeNotSatisfiableException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestedRangeNotSatisfiableException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ContainerNotFoundException': (type, message) =>
      ContainerNotFoundException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'ObjectNotFoundException': (type, message) =>
      ObjectNotFoundException(type: type, message: message),
  'RequestedRangeNotSatisfiableException': (type, message) =>
      RequestedRangeNotSatisfiableException(type: type, message: message),
};
