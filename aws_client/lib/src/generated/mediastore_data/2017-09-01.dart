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

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-09-01.g.dart';

/// An AWS Elemental MediaStore asset is an object, similar to an object in the
/// Amazon S3 service. Objects are the fundamental entities that are stored in
/// AWS Elemental MediaStore.
class MediaStoreData {
  final _s.RestJsonProtocol _protocol;
  MediaStoreData({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'data.mediastore',
            signingName: 'mediastore',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String path,
  }) async {
    ArgumentError.checkNotNull(path, 'path');
    _s.validateStringLength(
      'path',
      path,
      1,
      900,
      isRequired: true,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(?:[A-Za-z0-9_\.\-\~]+/){0,10}[A-Za-z0-9_\.\-\~]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/${path.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteObjectResponse.fromJson(response);
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
    @_s.required String path,
  }) async {
    ArgumentError.checkNotNull(path, 'path');
    _s.validateStringLength(
      'path',
      path,
      1,
      900,
      isRequired: true,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(?:[A-Za-z0-9_\.\-\~]+/){0,10}[A-Za-z0-9_\.\-\~]+''',
      isRequired: true,
    );
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
    @_s.required String path,
    String range,
  }) async {
    ArgumentError.checkNotNull(path, 'path');
    _s.validateStringLength(
      'path',
      path,
      1,
      900,
      isRequired: true,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(?:[A-Za-z0-9_\.\-\~]+/){0,10}[A-Za-z0-9_\.\-\~]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'range',
      range,
      r'''^bytes=(?:\d+\-\d*|\d*\-\d+)$''',
    );
    final headers = <String, String>{};
    range?.let((v) => headers['Range'] = v.toString());
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
    int maxResults,
    String nextToken,
    String path,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'path',
      path,
      0,
      900,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''/?(?:[A-Za-z0-9_\.\-\~]+/){0,10}(?:[A-Za-z0-9_\.\-\~]+)?/?''',
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
    @_s.required Uint8List body,
    @_s.required String path,
    String cacheControl,
    String contentType,
    StorageClass storageClass,
    UploadAvailability uploadAvailability,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(path, 'path');
    _s.validateStringLength(
      'path',
      path,
      1,
      900,
      isRequired: true,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(?:[A-Za-z0-9_\.\-\~]+/){0,10}[A-Za-z0-9_\.\-\~]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'contentType',
      contentType,
      r'''^[\w\-\/\.\+]{1,255}$''',
    );
    final headers = <String, String>{};
    cacheControl?.let((v) => headers['Cache-Control'] = v.toString());
    contentType?.let((v) => headers['Content-Type'] = v.toString());
    storageClass?.let((v) => headers['x-amz-storage-class'] = v.toValue());
    uploadAvailability
        ?.let((v) => headers['x-amz-upload-availability'] = v.toValue());
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteObjectResponse {
  DeleteObjectResponse();
  factory DeleteObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeObjectResponse {
  /// An optional <code>CacheControl</code> header that allows the caller to
  /// control the object's cache behavior. Headers can be passed in as specified
  /// in the HTTP at <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.
  ///
  /// Headers with a custom user-defined value are also accepted.
  @_s.JsonKey(name: 'Cache-Control')
  final String cacheControl;

  /// The length of the object in bytes.
  @_s.JsonKey(name: 'Content-Length')
  final int contentLength;

  /// The content type of the object.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// The ETag that represents a unique instance of the object.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The date and time that the object was last modified.
  @RfcDateTimeConverter()
  @_s.JsonKey(name: 'Last-Modified')
  final DateTime lastModified;

  DescribeObjectResponse({
    this.cacheControl,
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
  });
  factory DescribeObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetObjectResponse {
  /// The HTML status code of the request. Status codes ranging from 200 to 299
  /// indicate success. All other status codes indicate the type of error that
  /// occurred.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  /// The bytes of the object.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Body')
  final Uint8List body;

  /// An optional <code>CacheControl</code> header that allows the caller to
  /// control the object's cache behavior. Headers can be passed in as specified
  /// in the HTTP spec at <a
  /// href="https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9">https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9</a>.
  ///
  /// Headers with a custom user-defined value are also accepted.
  @_s.JsonKey(name: 'Cache-Control')
  final String cacheControl;

  /// The length of the object in bytes.
  @_s.JsonKey(name: 'Content-Length')
  final int contentLength;

  /// The range of bytes to retrieve.
  @_s.JsonKey(name: 'Content-Range')
  final String contentRange;

  /// The content type of the object.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// The ETag that represents a unique instance of the object.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The date and time that the object was last modified.
  @RfcDateTimeConverter()
  @_s.JsonKey(name: 'Last-Modified')
  final DateTime lastModified;

  GetObjectResponse({
    @_s.required this.statusCode,
    this.body,
    this.cacheControl,
    this.contentLength,
    this.contentRange,
    this.contentType,
    this.eTag,
    this.lastModified,
  });
  factory GetObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$GetObjectResponseFromJson(json);
}

/// A metadata entry for a folder or object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Item {
  /// The length of the item in bytes.
  @_s.JsonKey(name: 'ContentLength')
  final int contentLength;

  /// The content type of the item.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The ETag that represents a unique instance of the item.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The date and time that the item was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
  final DateTime lastModified;

  /// The name of the item.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The item type (folder or object).
  @_s.JsonKey(name: 'Type')
  final ItemType type;

  Item({
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
    this.name,
    this.type,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

enum ItemType {
  @_s.JsonValue('OBJECT')
  object,
  @_s.JsonValue('FOLDER')
  folder,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListItemsResponse {
  /// The metadata entries for the folders and objects at the requested path.
  @_s.JsonKey(name: 'Items')
  final List<Item> items;

  /// The token that can be used in a request to view the next set of results. For
  /// example, you submit a <code>ListItems</code> request that matches 2,000
  /// items with <code>MaxResults</code> set at 500. The service returns the first
  /// batch of results (up to 500) and a <code>NextToken</code> value that can be
  /// used to fetch the next batch of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListItemsResponse({
    this.items,
    this.nextToken,
  });
  factory ListItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListItemsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutObjectResponse {
  /// The SHA256 digest of the object that is persisted.
  @_s.JsonKey(name: 'ContentSHA256')
  final String contentSHA256;

  /// Unique identifier of the object in the container.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The storage class where the object was persisted. The class should be
  /// “Temporal”.
  @_s.JsonKey(name: 'StorageClass')
  final StorageClass storageClass;

  PutObjectResponse({
    this.contentSHA256,
    this.eTag,
    this.storageClass,
  });
  factory PutObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$PutObjectResponseFromJson(json);
}

enum StorageClass {
  @_s.JsonValue('TEMPORAL')
  temporal,
}

extension on StorageClass {
  String toValue() {
    switch (this) {
      case StorageClass.temporal:
        return 'TEMPORAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum UploadAvailability {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('STREAMING')
  streaming,
}

extension on UploadAvailability {
  String toValue() {
    switch (this) {
      case UploadAvailability.standard:
        return 'STANDARD';
      case UploadAvailability.streaming:
        return 'STREAMING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

class ContainerNotFoundException extends _s.GenericAwsException {
  ContainerNotFoundException({String type, String message})
      : super(type: type, code: 'ContainerNotFoundException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class ObjectNotFoundException extends _s.GenericAwsException {
  ObjectNotFoundException({String type, String message})
      : super(type: type, code: 'ObjectNotFoundException', message: message);
}

class RequestedRangeNotSatisfiableException extends _s.GenericAwsException {
  RequestedRangeNotSatisfiableException({String type, String message})
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
