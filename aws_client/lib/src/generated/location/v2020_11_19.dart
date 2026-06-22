// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2020_11_19.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// "Suite of geospatial services including Maps, Places, Routes, Tracking, and
/// Geofencing"
class Location {
  final _s.RestJsonProtocol _protocol;
  factory Location({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'geo',
    );
    return Location._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  Location._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates an API key resource in your Amazon Web Services account, which
  /// lets you grant actions for Amazon Location resources to the API key
  /// bearer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">Use
  /// API keys to authenticate</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyName] :
  /// A custom name for the API key resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique API key name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleAPIKey</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [restrictions] :
  /// The API key restrictions for the API key resource.
  ///
  /// Parameter [description] :
  /// An optional description for the API key resource.
  ///
  /// Parameter [expireTime] :
  /// The optional timestamp for when the API key resource will expire in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. One of
  /// <code>NoExpiry</code> or <code>ExpireTime</code> must be set.
  ///
  /// Parameter [noExpiry] :
  /// Optionally set to <code>true</code> to set no expiration time for the API
  /// key. One of <code>NoExpiry</code> or <code>ExpireTime</code> must be set.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the map resource. A tag is a key-value pair
  /// that helps manage, identify, search, and filter your resources by
  /// labelling them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateKeyResponse> createKey({
    required String keyName,
    required ApiKeyRestrictions restrictions,
    String? description,
    DateTime? expireTime,
    bool? noExpiry,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'KeyName': keyName,
      'Restrictions': restrictions,
      if (description != null) 'Description': description,
      if (expireTime != null) 'ExpireTime': iso8601ToJson(expireTime),
      if (noExpiry != null) 'NoExpiry': noExpiry,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/keys',
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateKeyResponse.fromJson(response);
  }

  /// Retrieves the API key resource details.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">Use
  /// API keys to authenticate</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key resource.
  Future<DescribeKeyResponse> describeKey({
    required String keyName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metadata/v0/keys/${Uri.encodeComponent(keyName)}',
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeKeyResponse.fromJson(response);
  }

  /// Updates the specified properties of a given API key resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key resource to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the API key resource.
  ///
  /// Parameter [expireTime] :
  /// Updates the timestamp for when the API key resource will expire in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// Parameter [forceUpdate] :
  /// The boolean flag to be included for updating <code>ExpireTime</code> or
  /// <code>Restrictions</code> details.
  ///
  /// Must be set to <code>true</code> to update an API key resource that has
  /// been used in the past 7 days.
  ///
  /// <code>False</code> if force update is not preferred
  ///
  /// Default value: <code>False</code>
  ///
  /// Parameter [noExpiry] :
  /// Whether the API key should expire. Set to <code>true</code> to set the API
  /// key to have no expiration time.
  ///
  /// Parameter [restrictions] :
  /// Updates the API key restrictions for the API key resource.
  Future<UpdateKeyResponse> updateKey({
    required String keyName,
    String? description,
    DateTime? expireTime,
    bool? forceUpdate,
    bool? noExpiry,
    ApiKeyRestrictions? restrictions,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (expireTime != null) 'ExpireTime': iso8601ToJson(expireTime),
      if (forceUpdate != null) 'ForceUpdate': forceUpdate,
      if (noExpiry != null) 'NoExpiry': noExpiry,
      if (restrictions != null) 'Restrictions': restrictions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/metadata/v0/keys/${Uri.encodeComponent(keyName)}',
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateKeyResponse.fromJson(response);
  }

  /// Deletes the specified API key. The API key must have been deactivated more
  /// than 90 days previously.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">Use
  /// API keys to authenticate</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key to delete.
  ///
  /// Parameter [forceDelete] :
  /// ForceDelete bypasses an API key's expiry conditions and deletes the key.
  /// Set the parameter <code>true</code> to delete the key or to
  /// <code>false</code> to not preemptively delete the API key.
  ///
  /// Valid values: <code>true</code>, or <code>false</code>.
  ///
  /// Required: No
  /// <note>
  /// This action is irreversible. Only use ForceDelete if you are certain the
  /// key is no longer in use.
  /// </note>
  Future<void> deleteKey({
    required String keyName,
    bool? forceDelete,
  }) async {
    final $query = <String, List<String>>{
      if (forceDelete != null) 'forceDelete': [forceDelete.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/metadata/v0/keys/${Uri.encodeComponent(keyName)}',
      queryParams: $query,
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists API key resources in your Amazon Web Services account.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html">Use
  /// API keys to authenticate</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// Optionally filter the list to only <code>Active</code> or
  /// <code>Expired</code> API keys.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListKeysResponse> listKeys({
    ApiKeyFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'Filter': filter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/list-keys',
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return ListKeysResponse.fromJson(response);
  }

  /// Returns a list of tags that are applied to the specified Amazon Location
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// retrieve.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code>
  /// </li>
  /// </ul>
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified Amazon
  /// Location Service resource.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// You can use the <code>TagResource</code> operation with an Amazon Location
  /// Service resource that already has tags. If you specify a new tag key for
  /// the resource, this tag is appended to the tags already associated with the
  /// resource. If you specify a tag key that's already associated with the
  /// resource, the new tag value that you specify replaces the previous value
  /// for that tag.
  ///
  /// You can associate up to 50 tags with a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// update.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to specific resource. A tag is a key-value pair
  /// that helps you manage, identify, search, and filter your resources.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource.
  /// </li>
  /// <li>
  /// Each tag key must be unique and must have exactly one associated value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified Amazon Location resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which you want to
  /// remove tags.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      hostPrefix: 'cp.metadata.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a geofence collection, which manages and stores geofences.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// A custom name for the geofence collection.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique geofence collection name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleGeofenceCollection</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// An optional description for the geofence collection.
  ///
  /// Parameter [kmsKeyId] :
  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>. Enter a key ID, key ARN, alias
  /// name, or alias ARN.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the geofence collection. A tag is a key-value
  /// pair helps manage, identify, search, and filter your resources by
  /// labelling them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateGeofenceCollectionResponse> createGeofenceCollection({
    required String collectionName,
    String? description,
    String? kmsKeyId,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CollectionName': collectionName,
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/geofencing/v0/collections',
      hostPrefix: 'cp.geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGeofenceCollectionResponse.fromJson(response);
  }

  /// Retrieves the geofence collection details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection.
  Future<DescribeGeofenceCollectionResponse> describeGeofenceCollection({
    required String collectionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      hostPrefix: 'cp.geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGeofenceCollectionResponse.fromJson(response);
  }

  /// Updates the specified properties of a given geofence collection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the geofence collection.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
  Future<UpdateGeofenceCollectionResponse> updateGeofenceCollection({
    required String collectionName,
    String? description,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      hostPrefix: 'cp.geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGeofenceCollectionResponse.fromJson(response);
  }

  /// Deletes a geofence collection from your Amazon Web Services account.
  /// <note>
  /// This operation deletes the resource permanently. If the geofence
  /// collection is the target of a tracker resource, the devices will no longer
  /// be monitored.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection to be deleted.
  Future<void> deleteGeofenceCollection({
    required String collectionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}',
      hostPrefix: 'cp.geofencing.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists geofence collections in your Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListGeofenceCollectionsResponse> listGeofenceCollections({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/geofencing/v0/list-collections',
      hostPrefix: 'cp.geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return ListGeofenceCollectionsResponse.fromJson(response);
  }

  /// Deletes a batch of geofences from a geofence collection.
  /// <note>
  /// This operation deletes the resource permanently.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection storing the geofences to be deleted.
  ///
  /// Parameter [geofenceIds] :
  /// The batch of geofences to be deleted.
  Future<BatchDeleteGeofenceResponse> batchDeleteGeofence({
    required String collectionName,
    required List<String> geofenceIds,
  }) async {
    final $payload = <String, dynamic>{
      'GeofenceIds': geofenceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/delete-geofences',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteGeofenceResponse.fromJson(response);
  }

  /// Evaluates device positions against the geofence geometries from a given
  /// geofence collection.
  ///
  /// This operation always returns an empty response because geofences are
  /// asynchronously evaluated. The evaluation determines if the device has
  /// entered or exited a geofenced area, and then publishes one of the
  /// following events to Amazon EventBridge:
  ///
  /// <ul>
  /// <li>
  /// <code>ENTER</code> if Amazon Location determines that the tracked device
  /// has entered a geofenced area.
  /// </li>
  /// <li>
  /// <code>EXIT</code> if Amazon Location determines that the tracked device
  /// has exited a geofenced area.
  /// </li>
  /// </ul> <note>
  /// The last geofence that a device was observed within is tracked for 30 days
  /// after the most recent device position update.
  /// </note> <note>
  /// Geofence evaluation uses the given device position. It does not account
  /// for the optional <code>Accuracy</code> of a
  /// <code>DevicePositionUpdate</code>.
  /// </note> <note>
  /// The <code>DeviceID</code> is used as a string to represent the device. You
  /// do not need to have a <code>Tracker</code> associated with the
  /// <code>DeviceID</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection used in evaluating the position of devices against
  /// its geofences.
  ///
  /// Parameter [devicePositionUpdates] :
  /// Contains device details for each device to be evaluated against the given
  /// geofence collection.
  Future<BatchEvaluateGeofencesResponse> batchEvaluateGeofences({
    required String collectionName,
    required List<DevicePositionUpdate> devicePositionUpdates,
  }) async {
    final $payload = <String, dynamic>{
      'DevicePositionUpdates': devicePositionUpdates,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/positions',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return BatchEvaluateGeofencesResponse.fromJson(response);
  }

  /// A batch request for storing geofence geometries into a given geofence
  /// collection, or updates the geometry of an existing geofence if a geofence
  /// ID is included in the request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection storing the geofences.
  ///
  /// Parameter [entries] :
  /// The batch of geofences to be stored in a geofence collection.
  Future<BatchPutGeofenceResponse> batchPutGeofence({
    required String collectionName,
    required List<BatchPutGeofenceRequestEntry> entries,
  }) async {
    final $payload = <String, dynamic>{
      'Entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/put-geofences',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutGeofenceResponse.fromJson(response);
  }

  /// This action forecasts future geofence events that are likely to occur
  /// within a specified time horizon if a device continues moving at its
  /// current speed. Each forecasted event is associated with a geofence from a
  /// provided geofence collection. A forecast event can have one of the
  /// following states:
  ///
  /// <code>ENTER</code>: The device position is outside the referenced
  /// geofence, but the device may cross into the geofence during the
  /// forecasting time horizon if it maintains its current speed.
  ///
  /// <code>EXIT</code>: The device position is inside the referenced geofence,
  /// but the device may leave the geofence during the forecasted time horizon
  /// if the device maintains it's current speed.
  ///
  /// <code>IDLE</code>:The device is inside the geofence, and it will remain
  /// inside the geofence through the end of the time horizon if the device
  /// maintains it's current speed.
  /// <note>
  /// Heading direction is not considered in the current version. The API takes
  /// a conservative approach and includes events that can occur for any
  /// heading.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection.
  ///
  /// Parameter [deviceState] :
  /// Represents the device's state, including its current position and speed.
  /// When speed is omitted, this API performs a <i>containment check</i>. The
  /// <i>containment check</i> operation returns <code>IDLE</code> events for
  /// geofences where the device is currently inside of, but no other events.
  ///
  /// Parameter [distanceUnit] :
  /// The distance unit used for the <code>NearestDistance</code> property
  /// returned in a forecasted event. The measurement system must match for
  /// <code>DistanceUnit</code> and <code>SpeedUnit</code>; if
  /// <code>Kilometers</code> is specified for <code>DistanceUnit</code>, then
  /// <code>SpeedUnit</code> must be <code>KilometersPerHour</code>.
  ///
  /// Default Value: <code>Kilometers</code>
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>20</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  ///
  /// Parameter [speedUnit] :
  /// The speed unit for the device captured by the device state. The
  /// measurement system must match for <code>DistanceUnit</code> and
  /// <code>SpeedUnit</code>; if <code>Kilometers</code> is specified for
  /// <code>DistanceUnit</code>, then <code>SpeedUnit</code> must be
  /// <code>KilometersPerHour</code>.
  ///
  /// Default Value: <code>KilometersPerHour</code>.
  ///
  /// Parameter [timeHorizonMinutes] :
  /// The forward-looking time window for forecasting, specified in minutes. The
  /// API only returns events that are predicted to occur within this time
  /// horizon. When no value is specified, this API performs a <i>containment
  /// check</i>. The <i>containment check</i> operation returns
  /// <code>IDLE</code> events for geofences where the device is currently
  /// inside of, but no other events.
  Future<ForecastGeofenceEventsResponse> forecastGeofenceEvents({
    required String collectionName,
    required ForecastGeofenceEventsDeviceState deviceState,
    DistanceUnit? distanceUnit,
    int? maxResults,
    String? nextToken,
    SpeedUnit? speedUnit,
    double? timeHorizonMinutes,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceState': deviceState,
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.value,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (speedUnit != null) 'SpeedUnit': speedUnit.value,
      if (timeHorizonMinutes != null) 'TimeHorizonMinutes': timeHorizonMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/forecast-geofence-events',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return ForecastGeofenceEventsResponse.fromJson(response);
  }

  /// Retrieves the geofence details from a geofence collection.
  /// <note>
  /// The returned geometry will always match the geometry format used when the
  /// geofence was created.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection storing the target geofence.
  ///
  /// Parameter [geofenceId] :
  /// The geofence you're retrieving details for.
  Future<GetGeofenceResponse> getGeofence({
    required String collectionName,
    required String geofenceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/geofences/${Uri.encodeComponent(geofenceId)}',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return GetGeofenceResponse.fromJson(response);
  }

  /// Lists geofences stored in a given geofence collection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The name of the geofence collection storing the list of geofences.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of geofences returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListGeofencesResponse> listGeofences({
    required String collectionName,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/list-geofences',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return ListGeofencesResponse.fromJson(response);
  }

  /// Stores a geofence geometry in a given geofence collection, or updates the
  /// geometry of an existing geofence if a geofence ID is included in the
  /// request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [collectionName] :
  /// The geofence collection to store the geofence in.
  ///
  /// Parameter [geofenceId] :
  /// An identifier for the geofence. For example,
  /// <code>ExampleGeofence-1</code>.
  ///
  /// Parameter [geometry] :
  /// Contains the details to specify the position of the geofence. Can be a
  /// circle, a polygon, or a multipolygon. <code>Polygon</code> and
  /// <code>MultiPolygon</code> geometries can be defined using their respective
  /// parameters, or encoded in Geobuf format using the <code>Geobuf</code>
  /// parameter. Including multiple geometry types in the same request will
  /// return a validation error.
  /// <note>
  /// The geofence <code>Polygon</code> and <code>MultiPolygon</code> formats
  /// support a maximum of 1,000 total vertices. The <code>Geobuf</code> format
  /// supports a maximum of 100,000 vertices.
  /// </note>
  ///
  /// Parameter [geofenceProperties] :
  /// Associates one of more properties with the geofence. A property is a
  /// key-value pair stored with the geofence and added to any geofence event
  /// triggered with that geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  Future<PutGeofenceResponse> putGeofence({
    required String collectionName,
    required String geofenceId,
    required GeofenceGeometry geometry,
    Map<String, String>? geofenceProperties,
  }) async {
    final $payload = <String, dynamic>{
      'Geometry': geometry,
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/geofencing/v0/collections/${Uri.encodeComponent(collectionName)}/geofences/${Uri.encodeComponent(geofenceId)}',
      hostPrefix: 'geofencing.',
      exceptionFnMap: _exceptionFns,
    );
    return PutGeofenceResponse.fromJson(response);
  }

  /// <code>StartJob</code> starts a new asynchronous bulk processing job. You
  /// specify the input data location in Amazon S3, the action to perform, and
  /// the output location where results are written.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/jobs-concepts.html">Job
  /// concepts</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action to perform on the input data.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that Amazon Location
  /// Service assumes during job processing. Amazon Location Service uses this
  /// role to access the input and output locations specified for the job.
  /// <note>
  /// The IAM role must be created in the same Amazon Web Services account where
  /// you plan to run your job.
  /// </note>
  /// For more information about configuring IAM roles for Amazon Location jobs,
  /// see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/configure-iam-role-policy-credentials.html">Configure
  /// IAM permissions</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [inputOptions] :
  /// Configuration for input data location and format.
  /// <note>
  /// Input files have a limitation of 10gb per file, and 1gb per Parquet
  /// row-group within the file.
  /// </note>
  ///
  /// Parameter [outputOptions] :
  /// Configuration for output data location and format.
  ///
  /// Parameter [actionOptions] :
  /// Additional parameters that can be requested for each result.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  ///
  /// Parameter [name] :
  /// An optional name for the job resource.
  ///
  /// Parameter [tags] :
  /// Tags and corresponding values to be associated with the job.
  Future<StartJobResponse> startJob({
    required JobAction action,
    required String executionRoleArn,
    required JobInputOptions inputOptions,
    required JobOutputOptions outputOptions,
    JobActionOptions? actionOptions,
    String? clientToken,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Action': action.value,
      'ExecutionRoleArn': executionRoleArn,
      'InputOptions': inputOptions,
      'OutputOptions': outputOptions,
      if (actionOptions != null) 'ActionOptions': actionOptions,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/jobs',
      hostPrefix: 'metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobResponse.fromJson(response);
  }

  /// <code>GetJob</code> retrieves detailed information about a specific job,
  /// including its current status, configuration, and error information if the
  /// job failed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/jobs-concepts.html">Job
  /// concepts</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the job to retrieve.
  Future<GetJobResponse> getJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/metadata/v0/jobs/${Uri.encodeComponent(jobId)}',
      hostPrefix: 'metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// <code>ListJobs</code> retrieves a list of jobs with optional filtering and
  /// pagination support.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/jobs-concepts.html">Job
  /// concepts</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// An optional structure containing criteria by which to filter job results.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of jobs to return.
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  Future<ListJobsResponse> listJobs({
    JobsFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'Filter': filter,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/jobs/list-jobs',
      hostPrefix: 'metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// <code>CancelJob</code> cancels a job that is currently running or pending.
  /// If the job is already in a terminal state (<code>Completed</code>,
  /// <code>Failed</code>, or <code>Cancelled</code>), the operation returns
  /// successfully with the current status.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/jobs-concepts.html">Job
  /// concepts</a> in the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the job to cancel.
  Future<CancelJobResponse> cancelJob({
    required String jobId,
  }) async {
    final $payload = <String, dynamic>{
      'JobId': jobId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/metadata/v0/jobs/cancel-job',
      hostPrefix: 'metadata.',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to the Maps API V2 unless you require
  /// <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>CreateMap</code> is part of a previous Amazon Location Service Maps
  /// API (version 1) which has been superseded by a more intuitive, powerful,
  /// and complete API (version 2).
  /// </li>
  /// <li>
  /// The Maps API version 2 has a simplified interface that can be used without
  /// creating or managing map resources.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Creates a map resource in your Amazon Web Services account, which provides
  /// map tiles of different styles sourced from global location data providers.
  /// <note>
  /// If your application is tracking or routing assets you use in your
  /// business, such as delivery vehicles or employees, you must not use Esri as
  /// your geolocation provider. See section 82 of the <a
  /// href="http://aws.amazon.com/service-terms">Amazon Web Services service
  /// terms</a> for more details.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// Specifies the <code>MapConfiguration</code>, including the map style, for
  /// the map resource that you create. The map style defines the look of maps
  /// and the data provider for your map resource.
  ///
  /// Parameter [mapName] :
  /// The name for the map resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Must contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-),
  /// periods (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique map resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleMap</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// An optional description for the map resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the map resource. A tag is a key-value pair
  /// helps manage, identify, search, and filter your resources by labelling
  /// them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateMapResponse> createMap({
    required MapConfiguration configuration,
    required String mapName,
    String? description,
    PricingPlan? pricingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Configuration': configuration,
      'MapName': mapName,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/maps/v0/maps',
      hostPrefix: 'cp.maps.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMapResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to the Maps API V2 unless you require
  /// <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>DescribeMap</code> is part of a previous Amazon Location Service
  /// Maps API (version 1) which has been superseded by a more intuitive,
  /// powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Maps API version 2 has a simplified interface that can be used without
  /// creating or managing map resources.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves the map resource details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mapName] :
  /// The name of the map resource.
  Future<DescribeMapResponse> describeMap({
    required String mapName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      hostPrefix: 'cp.maps.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMapResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to the Maps API V2 unless you require
  /// <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>UpdateMap</code> is part of a previous Amazon Location Service Maps
  /// API (version 1) which has been superseded by a more intuitive, powerful,
  /// and complete API (version 2).
  /// </li>
  /// <li>
  /// The Maps API version 2 has a simplified interface that can be used without
  /// creating or managing map resources.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Updates the specified properties of a given map resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mapName] :
  /// The name of the map resource to update.
  ///
  /// Parameter [configurationUpdate] :
  /// Updates the parts of the map configuration that can be updated, including
  /// the political view.
  ///
  /// Parameter [description] :
  /// Updates the description for the map resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  Future<UpdateMapResponse> updateMap({
    required String mapName,
    MapConfigurationUpdate? configurationUpdate,
    String? description,
    PricingPlan? pricingPlan,
  }) async {
    final $payload = <String, dynamic>{
      if (configurationUpdate != null)
        'ConfigurationUpdate': configurationUpdate,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      hostPrefix: 'cp.maps.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMapResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to the Maps API V2 unless you require
  /// <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>DeleteMap</code> is part of a previous Amazon Location Service Maps
  /// API (version 1) which has been superseded by a more intuitive, powerful,
  /// and complete API (version 2).
  /// </li>
  /// <li>
  /// The Maps API version 2 has a simplified interface that can be used without
  /// creating or managing map resources.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Deletes a map resource from your Amazon Web Services account.
  /// <note>
  /// This operation deletes the resource permanently. If the map is being used
  /// in an application, the map may not render.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mapName] :
  /// The name of the map resource to be deleted.
  Future<void> deleteMap({
    required String mapName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/maps/v0/maps/${Uri.encodeComponent(mapName)}',
      hostPrefix: 'cp.maps.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to the Maps API V2 unless you require
  /// <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>ListMaps</code> is part of a previous Amazon Location Service Maps
  /// API (version 1) which has been superseded by a more intuitive, powerful,
  /// and complete API (version 2).
  /// </li>
  /// <li>
  /// The Maps API version 2 has a simplified interface that can be used without
  /// creating or managing map resources.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Lists map resources in your Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListMapsResponse> listMaps({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/maps/v0/list-maps',
      hostPrefix: 'cp.maps.',
      exceptionFnMap: _exceptionFns,
    );
    return ListMapsResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_geomaps_GetGlyphs.html">
  /// <code>GetGlyphs</code> </a> unless you require <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>GetMapGlyphs</code> is part of a previous Amazon Location Service
  /// Maps API (version 1) which has been superseded by a more intuitive,
  /// powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>GetGlyphs</code> operation gives a better user
  /// experience and is compatible with the remainder of the V2 Maps API.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves glyphs used to display labels on a map.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fontStack] :
  /// A comma-separated list of fonts to load glyphs from in order of
  /// preference. For example, <code>Noto Sans Regular, Arial Unicode</code>.
  ///
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/esri.html">Esri</a>
  /// styles:
  ///
  /// <ul>
  /// <li>
  /// VectorEsriDarkGrayCanvas – <code>Ubuntu Medium Italic</code> |
  /// <code>Ubuntu Medium</code> | <code>Ubuntu Italic</code> | <code>Ubuntu
  /// Regular</code> | <code>Ubuntu Bold</code>
  /// </li>
  /// <li>
  /// VectorEsriLightGrayCanvas – <code>Ubuntu Italic</code> | <code>Ubuntu
  /// Regular</code> | <code>Ubuntu Light</code> | <code>Ubuntu Bold</code>
  /// </li>
  /// <li>
  /// VectorEsriTopographic – <code>Noto Sans Italic</code> | <code>Noto Sans
  /// Regular</code> | <code>Noto Sans Bold</code> | <code>Noto Serif
  /// Regular</code> | <code>Roboto Condensed Light Italic</code>
  /// </li>
  /// <li>
  /// VectorEsriStreets – <code>Arial Regular</code> | <code>Arial Italic</code>
  /// | <code>Arial Bold</code>
  /// </li>
  /// <li>
  /// VectorEsriNavigation – <code>Arial Regular</code> | <code>Arial
  /// Italic</code> | <code>Arial Bold</code>
  /// </li>
  /// </ul>
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/HERE.html">HERE
  /// Technologies</a> styles:
  ///
  /// <ul>
  /// <li>
  /// VectorHereContrast – <code>Fira GO Regular</code> | <code>Fira GO
  /// Bold</code>
  /// </li>
  /// <li>
  /// VectorHereExplore, VectorHereExploreTruck, HybridHereExploreSatellite –
  /// <code>Fira GO Italic</code> | <code>Fira GO Map</code> | <code>Fira GO Map
  /// Bold</code> | <code>Noto Sans CJK JP Bold</code> | <code>Noto Sans CJK JP
  /// Light</code> | <code>Noto Sans CJK JP Regular</code>
  /// </li>
  /// </ul>
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html">GrabMaps</a>
  /// styles:
  ///
  /// <ul>
  /// <li>
  /// VectorGrabStandardLight, VectorGrabStandardDark – <code>Noto Sans
  /// Regular</code> | <code>Noto Sans Medium</code> | <code>Noto Sans
  /// Bold</code>
  /// </li>
  /// </ul>
  /// Valid font stacks for <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/open-data.html">Open
  /// Data</a> styles:
  ///
  /// <ul>
  /// <li>
  /// VectorOpenDataStandardLight, VectorOpenDataStandardDark,
  /// VectorOpenDataVisualizationLight, VectorOpenDataVisualizationDark –
  /// <code>Amazon Ember Regular,Noto Sans Regular</code> | <code>Amazon Ember
  /// Bold,Noto Sans Bold</code> | <code>Amazon Ember Medium,Noto Sans
  /// Medium</code> | <code>Amazon Ember Regular Italic,Noto Sans Italic</code>
  /// | <code>Amazon Ember Condensed RC Regular,Noto Sans Regular</code> |
  /// <code>Amazon Ember Condensed RC Bold,Noto Sans Bold</code> | <code>Amazon
  /// Ember Regular,Noto Sans Regular,Noto Sans Arabic Regular</code> |
  /// <code>Amazon Ember Condensed RC Bold,Noto Sans Bold,Noto Sans Arabic
  /// Condensed Bold</code> | <code>Amazon Ember Bold,Noto Sans Bold,Noto Sans
  /// Arabic Bold</code> | <code>Amazon Ember Regular Italic,Noto Sans
  /// Italic,Noto Sans Arabic Regular</code> | <code>Amazon Ember Condensed RC
  /// Regular,Noto Sans Regular,Noto Sans Arabic Condensed Regular</code> |
  /// <code>Amazon Ember Medium,Noto Sans Medium,Noto Sans Arabic Medium</code>
  /// </li>
  /// </ul> <note>
  /// The fonts used by the Open Data map styles are combined fonts that use
  /// <code>Amazon Ember</code> for most glyphs but <code>Noto Sans</code> for
  /// glyphs unsupported by <code>Amazon Ember</code>.
  /// </note>
  ///
  /// Parameter [fontUnicodeRange] :
  /// A Unicode range of characters to download glyphs for. Each response will
  /// contain 256 characters. For example, 0–255 includes all characters from
  /// range <code>U+0000</code> to <code>00FF</code>. Must be aligned to
  /// multiples of 256.
  ///
  /// Parameter [mapName] :
  /// The map resource associated with the glyph ﬁle.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapGlyphsResponse> getMapGlyphs({
    required String fontStack,
    required String fontUnicodeRange,
    required String mapName,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/glyphs/${Uri.encodeComponent(fontStack)}/${Uri.encodeComponent(fontUnicodeRange)}',
      queryParams: $query,
      hostPrefix: 'maps.',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapGlyphsResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_geomaps_GetSprites.html">
  /// <code>GetSprites</code> </a> unless you require <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>GetMapSprites</code> is part of a previous Amazon Location Service
  /// Maps API (version 1) which has been superseded by a more intuitive,
  /// powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>GetSprites</code> operation gives a better user
  /// experience and is compatible with the remainder of the V2 Maps API.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves the sprite sheet corresponding to a map resource. The sprite
  /// sheet is a PNG image paired with a JSON document describing the offsets of
  /// individual icons that will be displayed on a rendered map.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fileName] :
  /// The name of the sprite ﬁle. Use the following ﬁle names for the sprite
  /// sheet:
  ///
  /// <ul>
  /// <li>
  /// <code>sprites.png</code>
  /// </li>
  /// <li>
  /// <code>sprites@2x.png</code> for high pixel density displays
  /// </li>
  /// </ul>
  /// For the JSON document containing image offsets. Use the following ﬁle
  /// names:
  ///
  /// <ul>
  /// <li>
  /// <code>sprites.json</code>
  /// </li>
  /// <li>
  /// <code>sprites@2x.json</code> for high pixel density displays
  /// </li>
  /// </ul>
  ///
  /// Parameter [mapName] :
  /// The map resource associated with the sprite ﬁle.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapSpritesResponse> getMapSprites({
    required String fileName,
    required String mapName,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/sprites/${Uri.encodeComponent(fileName)}',
      queryParams: $query,
      hostPrefix: 'maps.',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapSpritesResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_geomaps_GetStyleDescriptor.html">
  /// <code>GetStyleDescriptor</code> </a> unless you require <code>Grab</code>
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>GetMapStyleDescriptor</code> is part of a previous Amazon Location
  /// Service Maps API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>GetStyleDescriptor</code> operation gives a better
  /// user experience and is compatible with the remainder of the V2 Maps API.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves the map style descriptor from a map resource.
  ///
  /// The style descriptor contains speciﬁcations on how features render on a
  /// map. For example, what data to display, what order to display the data in,
  /// and the style for the data. Style descriptors follow the Mapbox Style
  /// Specification.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mapName] :
  /// The map resource to retrieve the style descriptor from.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapStyleDescriptorResponse> getMapStyleDescriptor({
    required String mapName,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/style-descriptor',
      queryParams: $query,
      hostPrefix: 'maps.',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapStyleDescriptorResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend upgrading to <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_geomaps_GetTile.html">
  /// <code>GetTile</code> </a> unless you require <code>Grab</code> data.
  ///
  /// <ul>
  /// <li>
  /// <code>GetMapTile</code> is part of a previous Amazon Location Service Maps
  /// API (version 1) which has been superseded by a more intuitive, powerful,
  /// and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>GetTile</code> operation gives a better user
  /// experience and is compatible with the remainder of the V2 Maps API.
  /// </li>
  /// <li>
  /// If you are using an AWS SDK or the AWS CLI, note that the Maps API version
  /// 2 is found under <code>geo-maps</code> or <code>geo_maps</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since <code>Grab</code> is not yet fully supported in Maps API version 2,
  /// we recommend you continue using API version 1 when using
  /// <code>Grab</code>.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_Operations_Amazon_Location_Service_Maps_V2.html">Maps
  /// V2 API Reference</a> or the <a
  /// href="https://docs.aws.amazon.com/location/latest/developerguide/maps.html">Developer
  /// Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves a vector data tile from the map resource. Map tiles are used by
  /// clients to render a map. they're addressed using a grid arrangement with
  /// an X coordinate, Y coordinate, and Z (zoom) level.
  ///
  /// The origin (0, 0) is the top left of the map. Increasing the zoom level by
  /// 1 doubles both the X and Y dimensions, so a tile containing data for the
  /// entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0,
  /// 1/0/1, 1/1/0, 1/1/1).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mapName] :
  /// The map resource to retrieve the map tiles from.
  ///
  /// Parameter [x] :
  /// The X axis value for the map tile.
  ///
  /// Parameter [y] :
  /// The Y axis value for the map tile.
  ///
  /// Parameter [z] :
  /// The zoom value for the map tile.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  Future<GetMapTileResponse> getMapTile({
    required String mapName,
    required String x,
    required String y,
    required String z,
    String? key,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/maps/v0/maps/${Uri.encodeComponent(mapName)}/tiles/${Uri.encodeComponent(z)}/${Uri.encodeComponent(x)}/${Uri.encodeComponent(y)}',
      queryParams: $query,
      hostPrefix: 'maps.',
      exceptionFnMap: _exceptionFns,
    );
    return GetMapTileResponse(
      blob: await response.stream.toBytes(),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Places API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>CreatePlaceIndex</code> is part of a previous Amazon Location
  /// Service Places API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Places API version 2 has a simplified interface that can be used
  /// without creating or managing place index resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Places V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Places_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/places.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Creates a place index resource in your Amazon Web Services account. Use a
  /// place index resource to geocode addresses and other text queries by using
  /// the <code>SearchPlaceIndexForText</code> operation, and reverse geocode
  /// coordinates by using the <code>SearchPlaceIndexForPosition</code>
  /// operation, and enable autosuggestions by using the
  /// <code>SearchPlaceIndexForSuggestions</code> operation.
  /// <note>
  /// If your application is tracking or routing assets you use in your
  /// business, such as delivery vehicles or employees, you must not use Esri as
  /// your geolocation provider. See section 82 of the <a
  /// href="http://aws.amazon.com/service-terms">Amazon Web Services service
  /// terms</a> for more details.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataSource] :
  /// Specifies the geospatial data provider for the new place index.
  /// <note>
  /// This field is case-sensitive. Enter the valid values as shown. For
  /// example, entering <code>HERE</code> returns an error.
  /// </note>
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/esri.html">Esri</a>'s
  /// coverage in your region of interest, see <a
  /// href="https://developers.arcgis.com/rest/geocode/api-reference/geocode-coverage.htm">Esri
  /// details on geocoding coverage</a>.
  /// </li>
  /// <li>
  /// <code>Grab</code> – Grab provides place index functionality for Southeast
  /// Asia. For additional information about <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html">GrabMaps</a>'
  /// coverage, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html#grab-coverage-area">GrabMaps
  /// countries and areas covered</a>.
  /// </li>
  /// <li>
  /// <code>Here</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/HERE.html">HERE
  /// Technologies</a>' coverage in your region of interest, see <a
  /// href="https://developer.here.com/documentation/geocoder/dev_guide/topics/coverage-geocoder.html">HERE
  /// details on goecoding coverage</a>.
  /// <important>
  /// If you specify HERE Technologies (<code>Here</code>) as the data provider,
  /// you may not <a
  /// href="https://docs.aws.amazon.com/location-places/latest/APIReference/API_DataSourceConfiguration.html">store
  /// results</a> for locations in Japan. For more information, see the <a
  /// href="http://aws.amazon.com/service-terms/">Amazon Web Services service
  /// terms</a> for Amazon Location Service.
  /// </important> </li>
  /// </ul>
  /// For additional information , see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Data
  /// providers</a> on the <i>Amazon Location Service developer guide</i>.
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique place index resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExamplePlaceIndex</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Specifies the data storage option requesting Places.
  ///
  /// Parameter [description] :
  /// The optional description for the place index resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the place index resource. A tag is a key-value
  /// pair that helps you manage, identify, search, and filter your resources.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource.
  /// </li>
  /// <li>
  /// Each tag key must be unique and must have exactly one associated value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8.
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreatePlaceIndexResponse> createPlaceIndex({
    required String dataSource,
    required String indexName,
    DataSourceConfiguration? dataSourceConfiguration,
    String? description,
    PricingPlan? pricingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DataSource': dataSource,
      'IndexName': indexName,
      if (dataSourceConfiguration != null)
        'DataSourceConfiguration': dataSourceConfiguration,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/places/v0/indexes',
      hostPrefix: 'cp.places.',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePlaceIndexResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Places API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>DescribePlaceIndex</code> is part of a previous Amazon Location
  /// Service Places API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Places API version 2 has a simplified interface that can be used
  /// without creating or managing place index resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Places V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Places_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/places.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves the place index resource details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource.
  Future<DescribePlaceIndexResponse> describePlaceIndex({
    required String indexName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      hostPrefix: 'cp.places.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePlaceIndexResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Places API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>UpdatePlaceIndex</code> is part of a previous Amazon Location
  /// Service Places API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Places API version 2 has a simplified interface that can be used
  /// without creating or managing place index resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Places V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Places_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/places.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Updates the specified properties of a given place index resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource to update.
  ///
  /// Parameter [dataSourceConfiguration] :
  /// Updates the data storage option for the place index resource.
  ///
  /// Parameter [description] :
  /// Updates the description for the place index resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  Future<UpdatePlaceIndexResponse> updatePlaceIndex({
    required String indexName,
    DataSourceConfiguration? dataSourceConfiguration,
    String? description,
    PricingPlan? pricingPlan,
  }) async {
    final $payload = <String, dynamic>{
      if (dataSourceConfiguration != null)
        'DataSourceConfiguration': dataSourceConfiguration,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      hostPrefix: 'cp.places.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePlaceIndexResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Places API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>DeletePlaceIndex</code> is part of a previous Amazon Location
  /// Service Places API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Places API version 2 has a simplified interface that can be used
  /// without creating or managing place index resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Places V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Places_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/places.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Deletes a place index resource from your Amazon Web Services account.
  /// <note>
  /// This operation deletes the resource permanently.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource to be deleted.
  Future<void> deletePlaceIndex({
    required String indexName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/places/v0/indexes/${Uri.encodeComponent(indexName)}',
      hostPrefix: 'cp.places.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Places API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>ListPlaceIndexes</code> is part of a previous Amazon Location
  /// Service Places API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Places API version 2 has a simplified interface that can be used
  /// without creating or managing place index resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Places V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Places_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/places.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Lists place index resources in your Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the maximum number of results returned in a single
  /// call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListPlaceIndexesResponse> listPlaceIndexes({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/places/v0/list-indexes',
      hostPrefix: 'cp.places.',
      exceptionFnMap: _exceptionFns,
    );
    return ListPlaceIndexesResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the <a
  /// href="/location/latest/APIReference/API_geoplaces_GetPlace.html">V2
  /// <code>GetPlace</code> </a> operation unless you require Grab data.
  ///
  /// <ul>
  /// <li>
  /// This version of <code>GetPlace</code> is part of a previous Amazon
  /// Location Service Places API (version 1) which has been superseded by a
  /// more intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// Version 2 of the <code>GetPlace</code> operation interoperates with the
  /// rest of the Places V2 API, while this version does not.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Places V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Places_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/places.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Finds a place by its unique ID. A <code>PlaceId</code> is returned by
  /// other search operations.
  /// <note>
  /// A PlaceId is valid only if all of the following are the same in the
  /// original search request and the call to <code>GetPlace</code>.
  ///
  /// <ul>
  /// <li>
  /// Customer Amazon Web Services account
  /// </li>
  /// <li>
  /// Amazon Web Services Region
  /// </li>
  /// <li>
  /// Data provider specified in the place index resource
  /// </li>
  /// </ul> </note> <note>
  /// If your Place index resource is configured with Grab as your geolocation
  /// provider and Storage as Intended use, the GetPlace operation is
  /// unavailable. For more information, see <a
  /// href="http://aws.amazon.com/service-terms">AWS service terms</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource that you want to use for the search.
  ///
  /// Parameter [placeId] :
  /// The identifier of the place to find.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results, but not the
  /// results themselves. If no language is specified, or not supported for a
  /// particular result, the partner automatically chooses a language for the
  /// result.
  ///
  /// For an example, we'll use the Greek language. You search for a location
  /// around Athens, Greece, with the <code>language</code> parameter set to
  /// <code>en</code>. The <code>city</code> in the results will most likely be
  /// returned as <code>Athens</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the <code>city</code> in the results will more likely be
  /// returned as <code>Αθήνα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  Future<GetPlaceResponse> getPlace({
    required String indexName,
    required String placeId,
    String? key,
    String? language,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
      if (language != null) 'language': [language],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/places/${Uri.encodeComponent(placeId)}',
      queryParams: $query,
      hostPrefix: 'places.',
      exceptionFnMap: _exceptionFns,
    );
    return GetPlaceResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to <a
  /// href="/location/latest/APIReference/API_geoplaces_ReverseGeocode.html">
  /// <code>ReverseGeocode</code> </a> or <a
  /// href="/location/latest/APIReference/API_geoplaces_SearchNearby.html">
  /// <code>SearchNearby</code> </a> unless you require Grab data.
  ///
  /// <ul>
  /// <li>
  /// <code>SearchPlaceIndexForPosition</code> is part of a previous Amazon
  /// Location Service Places API (version 1) which has been superseded by a
  /// more intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>ReverseGeocode</code> operation gives better results
  /// in the address reverse-geocoding use case, while the version 2
  /// <code>SearchNearby</code> operation gives better results when searching
  /// for businesses and points of interest near a specific location.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// </ul> </important>
  /// Reverse geocodes a given coordinate and returns a legible address. Allows
  /// you to search for Places or points of interest near a given position.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource you want to use for the search.
  ///
  /// Parameter [position] :
  /// Specifies the longitude and latitude of the position to query.
  ///
  /// This parameter must contain a pair of numbers. The first number represents
  /// the X coordinate, or longitude; the second number represents the Y
  /// coordinate, or latitude.
  ///
  /// For example, <code>\[-123.1174, 49.2847\]</code> represents a position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results, but not the
  /// results themselves. If no language is specified, or not supported for a
  /// particular result, the partner automatically chooses a language for the
  /// result.
  ///
  /// For an example, we'll use the Greek language. You search for a location
  /// around Athens, Greece, with the <code>language</code> parameter set to
  /// <code>en</code>. The <code>city</code> in the results will most likely be
  /// returned as <code>Athens</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the <code>city</code> in the results will more likely be
  /// returned as <code>Αθήνα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// Default value: <code>50</code>
  Future<SearchPlaceIndexForPositionResponse> searchPlaceIndexForPosition({
    required String indexName,
    required List<double> position,
    String? key,
    String? language,
    int? maxResults,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Position': position,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/position',
      queryParams: $query,
      hostPrefix: 'places.',
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForPositionResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to <a
  /// href="/location/latest/APIReference/API_geoplaces_Suggest.html">
  /// <code>Suggest</code> </a> or <a
  /// href="/location/latest/APIReference/API_geoplaces_Autocomplete.html">
  /// <code>Autocomplete</code> </a> unless you require Grab data.
  ///
  /// <ul>
  /// <li>
  /// <code>SearchPlaceIndexForSuggestions</code> is part of a previous Amazon
  /// Location Service Places API (version 1) which has been superseded by a
  /// more intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>Suggest</code> operation gives better results for
  /// typeahead place search suggestions with fuzzy matching, while the version
  /// 2 <code>Autocomplete</code> operation gives better results for address
  /// completion based on partial input.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// </ul> </important>
  /// Generates suggestions for addresses and points of interest based on
  /// partial or misspelled free-form text. This operation is also known as
  /// autocomplete, autosuggest, or fuzzy matching.
  ///
  /// Optional parameters let you narrow your search results by bounding box or
  /// country, or bias your search toward a specific position on the globe.
  /// <note>
  /// You can search for suggested place names near a specified position by
  /// using <code>BiasPosition</code>, or filter results within a bounding box
  /// by using <code>FilterBBox</code>. These parameters are mutually exclusive;
  /// using both <code>BiasPosition</code> and <code>FilterBBox</code> in the
  /// same command returns an error.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource you want to use for the search.
  ///
  /// Parameter [text] :
  /// The free-form partial text to use to generate place suggestions. For
  /// example, <code>eiffel tow</code>.
  ///
  /// Parameter [biasPosition] :
  /// An optional parameter that indicates a preference for place suggestions
  /// that are closer to a specified position.
  ///
  /// If provided, this parameter must contain a pair of numbers. The first
  /// number represents the X coordinate, or longitude; the second number
  /// represents the Y coordinate, or latitude.
  ///
  /// For example, <code>\[-123.1174, 49.2847\]</code> represents the position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  /// <note>
  /// <code>BiasPosition</code> and <code>FilterBBox</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterBBox] :
  /// An optional parameter that limits the search results by returning only
  /// suggestions within a specified bounding box.
  ///
  /// If provided, this parameter must contain a total of four consecutive
  /// numbers in two pairs. The first pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the southwest corner
  /// of the bounding box; the second pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the northeast corner
  /// of the bounding box.
  ///
  /// For example, <code>\[-12.7935, -37.4835, -12.0684, -36.9542\]</code>
  /// represents a bounding box where the southwest corner has longitude
  /// <code>-12.7935</code> and latitude <code>-37.4835</code>, and the
  /// northeast corner has longitude <code>-12.0684</code> and latitude
  /// <code>-36.9542</code>.
  /// <note>
  /// <code>FilterBBox</code> and <code>BiasPosition</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterCategories] :
  /// A list of one or more Amazon Location categories to filter the returned
  /// places. If you include more than one category, the results will include
  /// results that match <i>any</i> of the categories listed.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service developer guide</i>.
  ///
  /// Parameter [filterCountries] :
  /// An optional parameter that limits the search results by returning only
  /// suggestions within the provided list of countries.
  ///
  /// <ul>
  /// <li>
  /// Use the <a href="https://www.iso.org/iso-3166-country-codes.html">ISO
  /// 3166</a> 3-digit country code. For example, Australia uses three
  /// upper-case characters: <code>AUS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results. If no language is
  /// specified, or not supported for a particular result, the partner
  /// automatically chooses a language for the result.
  ///
  /// For an example, we'll use the Greek language. You search for <code>Athens,
  /// Gr</code> to get suggestions with the <code>language</code> parameter set
  /// to <code>en</code>. The results found will most likely be returned as
  /// <code>Athens, Greece</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the result found will more likely be returned as <code>Αθήνα,
  /// Ελλάδα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// The default: <code>5</code>
  Future<SearchPlaceIndexForSuggestionsResponse>
      searchPlaceIndexForSuggestions({
    required String indexName,
    required String text,
    List<double>? biasPosition,
    List<double>? filterBBox,
    List<String>? filterCategories,
    List<String>? filterCountries,
    String? key,
    String? language,
    int? maxResults,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/suggestions',
      queryParams: $query,
      hostPrefix: 'places.',
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForSuggestionsResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to <a
  /// href="/location/latest/APIReference/API_geoplaces_Geocode.html">
  /// <code>Geocode</code> </a> or <a
  /// href="/location/latest/APIReference/API_geoplaces_SearchText.html">
  /// <code>SearchText</code> </a> unless you require Grab data.
  ///
  /// <ul>
  /// <li>
  /// <code>SearchPlaceIndexForText</code> is part of a previous Amazon Location
  /// Service Places API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>Geocode</code> operation gives better results in the
  /// address geocoding use case, while the version 2 <code>SearchText</code>
  /// operation gives better results when searching for businesses and points of
  /// interest.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Places API version 2 is found under
  /// <code>geo-places</code> or <code>geo_places</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Places API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// </ul> </important>
  /// Geocodes free-form text, such as an address, name, city, or region to
  /// allow you to search for Places or points of interest.
  ///
  /// Optional parameters let you narrow your search results by bounding box or
  /// country, or bias your search toward a specific position on the globe.
  /// <note>
  /// You can search for places near a given position using
  /// <code>BiasPosition</code>, or filter results within a bounding box using
  /// <code>FilterBBox</code>. Providing both parameters simultaneously returns
  /// an error.
  /// </note>
  /// Search results are returned in order of highest to lowest relevance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [indexName] :
  /// The name of the place index resource you want to use for the search.
  ///
  /// Parameter [text] :
  /// The address, name, city, or region to be used in the search in free-form
  /// text format. For example, <code>123 Any Street</code>.
  ///
  /// Parameter [biasPosition] :
  /// An optional parameter that indicates a preference for places that are
  /// closer to a specified position.
  ///
  /// If provided, this parameter must contain a pair of numbers. The first
  /// number represents the X coordinate, or longitude; the second number
  /// represents the Y coordinate, or latitude.
  ///
  /// For example, <code>\[-123.1174, 49.2847\]</code> represents the position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  /// <note>
  /// <code>BiasPosition</code> and <code>FilterBBox</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterBBox] :
  /// An optional parameter that limits the search results by returning only
  /// places that are within the provided bounding box.
  ///
  /// If provided, this parameter must contain a total of four consecutive
  /// numbers in two pairs. The first pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the southwest corner
  /// of the bounding box; the second pair of numbers represents the X and Y
  /// coordinates (longitude and latitude, respectively) of the northeast corner
  /// of the bounding box.
  ///
  /// For example, <code>\[-12.7935, -37.4835, -12.0684, -36.9542\]</code>
  /// represents a bounding box where the southwest corner has longitude
  /// <code>-12.7935</code> and latitude <code>-37.4835</code>, and the
  /// northeast corner has longitude <code>-12.0684</code> and latitude
  /// <code>-36.9542</code>.
  /// <note>
  /// <code>FilterBBox</code> and <code>BiasPosition</code> are mutually
  /// exclusive. Specifying both options results in an error.
  /// </note>
  ///
  /// Parameter [filterCategories] :
  /// A list of one or more Amazon Location categories to filter the returned
  /// places. If you include more than one category, the results will include
  /// results that match <i>any</i> of the categories listed.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service developer guide</i>.
  ///
  /// Parameter [filterCountries] :
  /// An optional parameter that limits the search results by returning only
  /// places that are in a specified list of countries.
  ///
  /// <ul>
  /// <li>
  /// Valid values include <a
  /// href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a>
  /// 3-digit country codes. For example, Australia uses three upper-case
  /// characters: <code>AUS</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [language] :
  /// The preferred language used to return results. The value must be a valid
  /// <a href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  ///
  /// This setting affects the languages used in the results, but not the
  /// results themselves. If no language is specified, or not supported for a
  /// particular result, the partner automatically chooses a language for the
  /// result.
  ///
  /// For an example, we'll use the Greek language. You search for <code>Athens,
  /// Greece</code>, with the <code>language</code> parameter set to
  /// <code>en</code>. The result found will most likely be returned as
  /// <code>Athens</code>.
  ///
  /// If you set the <code>language</code> parameter to <code>el</code>, for
  /// Greek, then the result found will more likely be returned as
  /// <code>Αθήνα</code>.
  ///
  /// If the data provider does not have a value for Greek, the result will be
  /// in a language that the provider does support.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter. The maximum number of results returned per request.
  ///
  /// The default: <code>50</code>
  Future<SearchPlaceIndexForTextResponse> searchPlaceIndexForText({
    required String indexName,
    required String text,
    List<double>? biasPosition,
    List<double>? filterBBox,
    List<String>? filterCategories,
    List<String>? filterCountries,
    String? key,
    String? language,
    int? maxResults,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/places/v0/indexes/${Uri.encodeComponent(indexName)}/search/text',
      queryParams: $query,
      hostPrefix: 'places.',
      exceptionFnMap: _exceptionFns,
    );
    return SearchPlaceIndexForTextResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Routes API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>CreateRouteCalculator</code> is part of a previous Amazon Location
  /// Service Routes API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Routes API version 2 has a simplified interface that can be used
  /// without creating or managing route calculator resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Routes V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Routes_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/routes.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Creates a route calculator resource in your Amazon Web Services account.
  ///
  /// You can send requests to a route calculator resource to estimate travel
  /// time, distance, and get directions. A route calculator sources traffic and
  /// road network data from your chosen data provider.
  /// <note>
  /// If your application is tracking or routing assets you use in your
  /// business, such as delivery vehicles or employees, you must not use Esri as
  /// your geolocation provider. See section 82 of the <a
  /// href="http://aws.amazon.com/service-terms">Amazon Web Services service
  /// terms</a> for more details.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9) , hyphens (-), periods
  /// (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique Route calculator resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleRouteCalculator</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dataSource] :
  /// Specifies the data provider of traffic and road network data.
  /// <note>
  /// This field is case-sensitive. Enter the valid values as shown. For
  /// example, entering <code>HERE</code> returns an error.
  /// </note>
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/esri.html">Esri</a>'s
  /// coverage in your region of interest, see <a
  /// href="https://doc.arcgis.com/en/arcgis-online/reference/network-coverage.htm">Esri
  /// details on street networks and traffic coverage</a>.
  ///
  /// Route calculators that use Esri as a data source only calculate routes
  /// that are shorter than 400 km.
  /// </li>
  /// <li>
  /// <code>Grab</code> – Grab provides routing functionality for Southeast
  /// Asia. For additional information about <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html">GrabMaps</a>'
  /// coverage, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html#grab-coverage-area">GrabMaps
  /// countries and areas covered</a>.
  /// </li>
  /// <li>
  /// <code>Here</code> – For additional information about <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/HERE.html">HERE
  /// Technologies</a>' coverage in your region of interest, see <a
  /// href="https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/car-routing.html">HERE
  /// car routing coverage</a> and <a
  /// href="https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/truck-routing.html">HERE
  /// truck routing coverage</a>.
  /// </li>
  /// </ul>
  /// For additional information , see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Data
  /// providers</a> on the <i>Amazon Location Service Developer Guide</i>.
  ///
  /// Parameter [description] :
  /// The optional description for the route calculator resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the route calculator resource. A tag is a
  /// key-value pair helps manage, identify, search, and filter your resources
  /// by labelling them.
  ///
  /// <ul>
  /// <li>
  /// For example: { <code>"tag1" : "value1"</code>, <code>"tag2" :
  /// "value2"</code>}
  /// </li>
  /// </ul>
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateRouteCalculatorResponse> createRouteCalculator({
    required String calculatorName,
    required String dataSource,
    String? description,
    PricingPlan? pricingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CalculatorName': calculatorName,
      'DataSource': dataSource,
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/routes/v0/calculators',
      hostPrefix: 'cp.routes.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouteCalculatorResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Routes API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>DescribeRouteCalculator</code> is part of a previous Amazon Location
  /// Service Routes API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Routes API version 2 has a simplified interface that can be used
  /// without creating or managing route calculator resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Routes V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Routes_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/routes.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Retrieves the route calculator resource details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource.
  Future<DescribeRouteCalculatorResponse> describeRouteCalculator({
    required String calculatorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      hostPrefix: 'cp.routes.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRouteCalculatorResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Routes API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>UpdateRouteCalculator</code> is part of a previous Amazon Location
  /// Service Routes API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Routes API version 2 has a simplified interface that can be used
  /// without creating or managing route calculator resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Routes V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Routes_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/routes.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Updates the specified properties for a given route calculator resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the route calculator resource.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  Future<UpdateRouteCalculatorResponse> updateRouteCalculator({
    required String calculatorName,
    String? description,
    PricingPlan? pricingPlan,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      hostPrefix: 'cp.routes.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouteCalculatorResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Routes API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>DeleteRouteCalculator</code> is part of a previous Amazon Location
  /// Service Routes API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Routes API version 2 has a simplified interface that can be used
  /// without creating or managing route calculator resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Routes V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Routes_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/routes.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Deletes a route calculator resource from your Amazon Web Services account.
  /// <note>
  /// This operation deletes the resource permanently.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource to be deleted.
  Future<void> deleteRouteCalculator({
    required String calculatorName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}',
      hostPrefix: 'cp.routes.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the Routes API V2 unless you require Grab
  /// data.
  ///
  /// <ul>
  /// <li>
  /// <code>ListRouteCalculators</code> is part of a previous Amazon Location
  /// Service Routes API (version 1) which has been superseded by a more
  /// intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The Routes API version 2 has a simplified interface that can be used
  /// without creating or managing route calculator resources.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Routes V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Routes_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/routes.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// Lists route calculator resources in your Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional maximum number of results returned in a single call.
  ///
  /// Default Value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default Value: <code>null</code>
  Future<ListRouteCalculatorsResponse> listRouteCalculators({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/routes/v0/list-calculators',
      hostPrefix: 'cp.routes.',
      exceptionFnMap: _exceptionFns,
    );
    return ListRouteCalculatorsResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to <a
  /// href="/location/latest/APIReference/API_CalculateRoutes.html">
  /// <code>CalculateRoutes</code> </a> or <a
  /// href="/location/latest/APIReference/API_CalculateIsolines.html">
  /// <code>CalculateIsolines</code> </a> unless you require Grab data.
  ///
  /// <ul>
  /// <li>
  /// <code>CalculateRoute</code> is part of a previous Amazon Location Service
  /// Routes API (version 1) which has been superseded by a more intuitive,
  /// powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>CalculateRoutes</code> operation gives better results
  /// for point-to-point routing, while the version 2
  /// <code>CalculateIsolines</code> operation adds support for calculating
  /// service areas and travel time envelopes.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// </ul> </important>
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/calculate-route.html">Calculates
  /// a route</a> given the following required parameters:
  /// <code>DeparturePosition</code> and <code>DestinationPosition</code>.
  /// Requires that you first <a
  /// href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create
  /// a route calculator resource</a>.
  ///
  /// By default, a request that doesn't specify a departure time uses the best
  /// time of day to travel with the best traffic conditions when calculating
  /// the route.
  ///
  /// Additional options include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/departure-time.html">Specifying
  /// a departure time</a> using either <code>DepartureTime</code> or
  /// <code>DepartNow</code>. This calculates a route based on predictive
  /// traffic data at the given time.
  /// <note>
  /// You can't specify both <code>DepartureTime</code> and
  /// <code>DepartNow</code> in a single request. Specifying both parameters
  /// returns a validation error.
  /// </note> </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/travel-mode.html">Specifying
  /// a travel mode</a> using TravelMode sets the transportation mode used to
  /// calculate the routes. This also lets you specify additional route
  /// preferences in <code>CarModeOptions</code> if traveling by
  /// <code>Car</code>, or <code>TruckModeOptions</code> if traveling by
  /// <code>Truck</code>.
  /// <note>
  /// If you specify <code>walking</code> for the travel mode and your data
  /// provider is Esri, the start and destination must be within 40km.
  /// </note> </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource that you want to use to
  /// calculate the route.
  ///
  /// Parameter [departurePosition] :
  /// The start position for the route. Defined in <a
  /// href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">World
  /// Geodetic System (WGS 84)</a> format: <code>\[longitude, latitude\]</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>\[-123.115, 49.285\]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a departure that's not located on a road, Amazon Location
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">moves
  /// the position to the nearest road</a>. If Esri is the provider for your
  /// route calculator, specifying a route that is longer than 400 km returns a
  /// <code>400 RoutesValidationException</code> error.
  /// </note>
  /// Valid Values: <code>\[-180 to 180,-90 to 90\]</code>
  ///
  /// Parameter [destinationPosition] :
  /// The finish position for the route. Defined in <a
  /// href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">World
  /// Geodetic System (WGS 84)</a> format: <code>\[longitude, latitude\]</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>\[-122.339, 47.615\]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a destination that's not located on a road, Amazon Location
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">moves
  /// the position to the nearest road</a>.
  /// </note>
  /// Valid Values: <code>\[-180 to 180,-90 to 90\]</code>
  ///
  /// Parameter [arrivalTime] :
  /// Specifies the desired time of arrival. Uses the given time to calculate
  /// the route. Otherwise, the best time of day to travel with the best traffic
  /// conditions is used to calculate the route.
  /// <note>
  /// ArrivalTime is not supported Esri.
  /// </note>
  ///
  /// Parameter [carModeOptions] :
  /// Specifies route preferences when traveling by <code>Car</code>, such as
  /// avoiding routes that use ferries or tolls.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Car</code>.
  ///
  /// Parameter [departNow] :
  /// Sets the time of departure as the current time. Uses the current time to
  /// calculate a route. Otherwise, the best time of day to travel with the best
  /// traffic conditions is used to calculate the route.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  ///
  /// Parameter [departureTime] :
  /// Specifies the desired time of departure. Uses the given time to calculate
  /// the route. Otherwise, the best time of day to travel with the best traffic
  /// conditions is used to calculate the route.
  ///
  /// <ul>
  /// <li>
  /// In <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example,
  /// <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [distanceUnit] :
  /// Set the unit system to specify the distance.
  ///
  /// Default Value: <code>Kilometers</code>
  ///
  /// Parameter [includeLegGeometry] :
  /// Set to include the geometry details in the result for each path between a
  /// pair of positions.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [optimizeFor] :
  /// Specifies the distance to optimize for when calculating a route.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility. You can choose
  /// <code>Car</code>, <code>Truck</code>, <code>Walking</code>,
  /// <code>Bicycle</code> or <code>Motorcycle</code> as options for the
  /// <code>TravelMode</code>.
  /// <note>
  /// <code>Bicycle</code> and <code>Motorcycle</code> are only valid when using
  /// Grab as a data provider, and only within Southeast Asia.
  ///
  /// <code>Truck</code> is not available for Grab.
  ///
  /// For more details on the using Grab for routing, including areas of
  /// coverage, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html">GrabMaps</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  /// </note>
  /// The <code>TravelMode</code> you specify also determines how you specify
  /// route preferences:
  ///
  /// <ul>
  /// <li>
  /// If traveling by <code>Car</code> use the <code>CarModeOptions</code>
  /// parameter.
  /// </li>
  /// <li>
  /// If traveling by <code>Truck</code> use the <code>TruckModeOptions</code>
  /// parameter.
  /// </li>
  /// </ul>
  /// Default Value: <code>Car</code>
  ///
  /// Parameter [truckModeOptions] :
  /// Specifies route preferences when traveling by <code>Truck</code>, such as
  /// avoiding routes that use ferries or tolls, and truck specifications to
  /// consider when choosing an optimal road.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Truck</code>.
  ///
  /// Parameter [waypointPositions] :
  /// Specifies an ordered list of up to 23 intermediate positions to include
  /// along a route between the departure position and destination position.
  ///
  /// <ul>
  /// <li>
  /// For example, from the <code>DeparturePosition</code> <code>\[-123.115,
  /// 49.285\]</code>, the route follows the order that the waypoint positions
  /// are given <code>\[\[-122.757, 49.0021\],\[-122.349, 47.620\]\]</code>
  /// </li>
  /// </ul> <note>
  /// If you specify a waypoint position that's not located on a road, Amazon
  /// Location <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">moves
  /// the position to the nearest road</a>.
  ///
  /// Specifying more than 23 waypoints returns a <code>400
  /// ValidationException</code> error.
  ///
  /// If Esri is the provider for your route calculator, specifying a route that
  /// is longer than 400 km returns a <code>400 RoutesValidationException</code>
  /// error.
  /// </note>
  /// Valid Values: <code>\[-180 to 180,-90 to 90\]</code>
  Future<CalculateRouteResponse> calculateRoute({
    required String calculatorName,
    required List<double> departurePosition,
    required List<double> destinationPosition,
    DateTime? arrivalTime,
    CalculateRouteCarModeOptions? carModeOptions,
    bool? departNow,
    DateTime? departureTime,
    DistanceUnit? distanceUnit,
    bool? includeLegGeometry,
    String? key,
    OptimizationMode? optimizeFor,
    TravelMode? travelMode,
    CalculateRouteTruckModeOptions? truckModeOptions,
    List<List<double>>? waypointPositions,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'DeparturePosition': departurePosition,
      'DestinationPosition': destinationPosition,
      if (arrivalTime != null) 'ArrivalTime': iso8601ToJson(arrivalTime),
      if (carModeOptions != null) 'CarModeOptions': carModeOptions,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': iso8601ToJson(departureTime),
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.value,
      if (includeLegGeometry != null) 'IncludeLegGeometry': includeLegGeometry,
      if (optimizeFor != null) 'OptimizeFor': optimizeFor.value,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (truckModeOptions != null) 'TruckModeOptions': truckModeOptions,
      if (waypointPositions != null) 'WaypointPositions': waypointPositions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}/calculate/route',
      queryParams: $query,
      hostPrefix: 'routes.',
      exceptionFnMap: _exceptionFns,
    );
    return CalculateRouteResponse.fromJson(response);
  }

  /// <important>
  /// This operation is no longer current and may be deprecated in the future.
  /// We recommend you upgrade to the <a
  /// href="/location/latest/APIReference/API_CalculateRouteMatrix.html">V2
  /// <code>CalculateRouteMatrix</code> </a> unless you require Grab data.
  ///
  /// <ul>
  /// <li>
  /// This version of <code>CalculateRouteMatrix</code> is part of a previous
  /// Amazon Location Service Routes API (version 1) which has been superseded
  /// by a more intuitive, powerful, and complete API (version 2).
  /// </li>
  /// <li>
  /// The version 2 <code>CalculateRouteMatrix</code> operation gives better
  /// results for matrix routing calculations.
  /// </li>
  /// <li>
  /// If you are using an Amazon Web Services SDK or the Amazon Web Services
  /// CLI, note that the Routes API version 2 is found under
  /// <code>geo-routes</code> or <code>geo_routes</code>, not under
  /// <code>location</code>.
  /// </li>
  /// <li>
  /// Since Grab is not yet fully supported in Routes API version 2, we
  /// recommend you continue using API version 1 when using Grab.
  /// </li>
  /// <li>
  /// Start your version 2 API journey with the Routes V2 <a
  /// href="/location/latest/APIReference/API_Operations_Amazon_Location_Service_Routes_V2.html">API
  /// Reference</a> or the <a
  /// href="/location/latest/developerguide/routes.html">Developer Guide</a>.
  /// </li>
  /// </ul> </important>
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/calculate-route-matrix.html">
  /// Calculates a route matrix</a> given the following required parameters:
  /// <code>DeparturePositions</code> and <code>DestinationPositions</code>.
  /// <code>CalculateRouteMatrix</code> calculates routes and returns the travel
  /// time and travel distance from each departure position to each destination
  /// position in the request. For example, given departure positions A and B,
  /// and destination positions X and Y, <code>CalculateRouteMatrix</code> will
  /// return time and distance for routes from A to X, A to Y, B to X, and B to
  /// Y (in that order). The number of results returned (and routes calculated)
  /// will be the number of <code>DeparturePositions</code> times the number of
  /// <code>DestinationPositions</code>.
  /// <note>
  /// Your account is charged for each route calculated, not the number of
  /// requests.
  /// </note>
  /// Requires that you first <a
  /// href="https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html">create
  /// a route calculator resource</a>.
  ///
  /// By default, a request that doesn't specify a departure time uses the best
  /// time of day to travel with the best traffic conditions when calculating
  /// routes.
  ///
  /// Additional options include:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/departure-time.html">
  /// Specifying a departure time</a> using either <code>DepartureTime</code> or
  /// <code>DepartNow</code>. This calculates routes based on predictive traffic
  /// data at the given time.
  /// <note>
  /// You can't specify both <code>DepartureTime</code> and
  /// <code>DepartNow</code> in a single request. Specifying both parameters
  /// returns a validation error.
  /// </note> </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/travel-mode.html">Specifying
  /// a travel mode</a> using TravelMode sets the transportation mode used to
  /// calculate the routes. This also lets you specify additional route
  /// preferences in <code>CarModeOptions</code> if traveling by
  /// <code>Car</code>, or <code>TruckModeOptions</code> if traveling by
  /// <code>Truck</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [calculatorName] :
  /// The name of the route calculator resource that you want to use to
  /// calculate the route matrix.
  ///
  /// Parameter [departurePositions] :
  /// The list of departure (origin) positions for the route matrix. An array of
  /// points, each of which is itself a 2-value array defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a>
  /// format: <code>\[longitude, latitude\]</code>. For example,
  /// <code>\[-123.115, 49.285\]</code>.
  /// <important>
  /// Depending on the data provider selected in the route calculator resource
  /// there may be additional restrictions on the inputs you can choose. See <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/calculate-route-matrix.html#matrix-routing-position-limits">
  /// Position restrictions</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  /// </important> <note>
  /// For route calculators that use Esri as the data provider, if you specify a
  /// departure that's not located on a road, Amazon Location <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">
  /// moves the position to the nearest road</a>. The snapped value is available
  /// in the result in <code>SnappedDeparturePositions</code>.
  /// </note>
  /// Valid Values: <code>\[-180 to 180,-90 to 90\]</code>
  ///
  /// Parameter [destinationPositions] :
  /// The list of destination positions for the route matrix. An array of
  /// points, each of which is itself a 2-value array defined in <a
  /// href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a>
  /// format: <code>\[longitude, latitude\]</code>. For example,
  /// <code>\[-122.339, 47.615\]</code>
  /// <important>
  /// Depending on the data provider selected in the route calculator resource
  /// there may be additional restrictions on the inputs you can choose. See <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/calculate-route-matrix.html#matrix-routing-position-limits">
  /// Position restrictions</a> in the <i>Amazon Location Service Developer
  /// Guide</i>.
  /// </important> <note>
  /// For route calculators that use Esri as the data provider, if you specify a
  /// destination that's not located on a road, Amazon Location <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">
  /// moves the position to the nearest road</a>. The snapped value is available
  /// in the result in <code>SnappedDestinationPositions</code>.
  /// </note>
  /// Valid Values: <code>\[-180 to 180,-90 to 90\]</code>
  ///
  /// Parameter [carModeOptions] :
  /// Specifies route preferences when traveling by <code>Car</code>, such as
  /// avoiding routes that use ferries or tolls.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Car</code>.
  ///
  /// Parameter [departNow] :
  /// Sets the time of departure as the current time. Uses the current time to
  /// calculate the route matrix. You can't set both <code>DepartureTime</code>
  /// and <code>DepartNow</code>. If neither is set, the best time of day to
  /// travel with the best traffic conditions is used to calculate the route
  /// matrix.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  ///
  /// Parameter [departureTime] :
  /// Specifies the desired time of departure. Uses the given time to calculate
  /// the route matrix. You can't set both <code>DepartureTime</code> and
  /// <code>DepartNow</code>. If neither is set, the best time of day to travel
  /// with the best traffic conditions is used to calculate the route matrix.
  /// <note>
  /// Setting a departure time in the past returns a <code>400
  /// ValidationException</code> error.
  /// </note>
  /// <ul>
  /// <li>
  /// In <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example,
  /// <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [distanceUnit] :
  /// Set the unit system to specify the distance.
  ///
  /// Default Value: <code>Kilometers</code>
  ///
  /// Parameter [key] :
  /// The optional <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/using-apikeys.html">API
  /// key</a> to authorize the request.
  ///
  /// Parameter [travelMode] :
  /// Specifies the mode of transport when calculating a route. Used in
  /// estimating the speed of travel and road compatibility.
  ///
  /// The <code>TravelMode</code> you specify also determines how you specify
  /// route preferences:
  ///
  /// <ul>
  /// <li>
  /// If traveling by <code>Car</code> use the <code>CarModeOptions</code>
  /// parameter.
  /// </li>
  /// <li>
  /// If traveling by <code>Truck</code> use the <code>TruckModeOptions</code>
  /// parameter.
  /// </li>
  /// </ul> <note>
  /// <code>Bicycle</code> or <code>Motorcycle</code> are only valid when using
  /// <code>Grab</code> as a data provider, and only within Southeast Asia.
  ///
  /// <code>Truck</code> is not available for Grab.
  ///
  /// For more information about using Grab as a data provider, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html">GrabMaps</a>
  /// in the <i>Amazon Location Service Developer Guide</i>.
  /// </note>
  /// Default Value: <code>Car</code>
  ///
  /// Parameter [truckModeOptions] :
  /// Specifies route preferences when traveling by <code>Truck</code>, such as
  /// avoiding routes that use ferries or tolls, and truck specifications to
  /// consider when choosing an optimal road.
  ///
  /// Requirements: <code>TravelMode</code> must be specified as
  /// <code>Truck</code>.
  Future<CalculateRouteMatrixResponse> calculateRouteMatrix({
    required String calculatorName,
    required List<List<double>> departurePositions,
    required List<List<double>> destinationPositions,
    CalculateRouteCarModeOptions? carModeOptions,
    bool? departNow,
    DateTime? departureTime,
    DistanceUnit? distanceUnit,
    String? key,
    TravelMode? travelMode,
    CalculateRouteTruckModeOptions? truckModeOptions,
  }) async {
    final $query = <String, List<String>>{
      if (key != null) 'key': [key],
    };
    final $payload = <String, dynamic>{
      'DeparturePositions': departurePositions,
      'DestinationPositions': destinationPositions,
      if (carModeOptions != null) 'CarModeOptions': carModeOptions,
      if (departNow != null) 'DepartNow': departNow,
      if (departureTime != null) 'DepartureTime': iso8601ToJson(departureTime),
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.value,
      if (travelMode != null) 'TravelMode': travelMode.value,
      if (truckModeOptions != null) 'TruckModeOptions': truckModeOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/routes/v0/calculators/${Uri.encodeComponent(calculatorName)}/calculate/route-matrix',
      queryParams: $query,
      hostPrefix: 'routes.',
      exceptionFnMap: _exceptionFns,
    );
    return CalculateRouteMatrixResponse.fromJson(response);
  }

  /// Creates a tracker resource in your Amazon Web Services account, which lets
  /// you retrieve current and historical location of devices.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The name for the tracker resource.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-),
  /// periods (.), and underscores (_).
  /// </li>
  /// <li>
  /// Must be a unique tracker resource name.
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>ExampleTracker</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// An optional description for the tracker resource.
  ///
  /// Parameter [eventBridgeEnabled] :
  /// Whether to enable position <code>UPDATE</code> events from this tracker to
  /// be sent to EventBridge.
  /// <note>
  /// You do not need enable this feature to get <code>ENTER</code> and
  /// <code>EXIT</code> events for geofences with this tracker. Those events are
  /// always sent to EventBridge.
  /// </note>
  ///
  /// Parameter [kmsKeyEnableGeospatialQueries] :
  /// Enables <code>GeospatialQueries</code> for a tracker that uses a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>.
  ///
  /// This parameter is only used if you are using a KMS customer managed key.
  /// <note>
  /// If you wish to encrypt your data using your own KMS customer managed key,
  /// then the Bounding Polygon Queries feature will be disabled by default.
  /// This is because by using this feature, a representation of your device
  /// positions will not be encrypted using the your KMS managed key. The exact
  /// device position, however; is still encrypted using your managed key.
  ///
  /// You can choose to opt-in to the Bounding Polygon Quseries feature. This is
  /// done by setting the <code>KmsKeyEnableGeospatialQueries</code> parameter
  /// to true when creating or updating a Tracker.
  /// </note>
  ///
  /// Parameter [kmsKeyId] :
  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>. Enter a key ID, key ARN, alias
  /// name, or alias ARN.
  ///
  /// Parameter [positionFiltering] :
  /// Specifies the position filtering for the tracker resource.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>TimeBased</code> - Location updates are evaluated against linked
  /// geofence collections, but not every location update is stored. If your
  /// update frequency is more often than 30 seconds, only one update per 30
  /// seconds is stored for each unique device ID.
  /// </li>
  /// <li>
  /// <code>DistanceBased</code> - If the device has moved less than 30 m (98.4
  /// ft), location updates are ignored. Location updates within this area are
  /// neither evaluated against linked geofence collections, nor stored. This
  /// helps control costs by reducing the number of geofence evaluations and
  /// historical device positions to paginate through. Distance-based filtering
  /// can also reduce the effects of GPS noise when displaying device
  /// trajectories on a map.
  /// </li>
  /// <li>
  /// <code>AccuracyBased</code> - If the device has moved less than the
  /// measured accuracy, location updates are ignored. For example, if two
  /// consecutive updates from a device have a horizontal accuracy of 5 m and 10
  /// m, the second update is ignored if the device has moved less than 15 m.
  /// Ignored location updates are neither evaluated against linked geofence
  /// collections, nor stored. This can reduce the effects of GPS noise when
  /// displaying device trajectories on a map, and can help control your costs
  /// by reducing the number of geofence evaluations.
  /// </li>
  /// </ul>
  /// This field is optional. If not specified, the default value is
  /// <code>TimeBased</code>.
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to the tracker resource. A tag is a key-value
  /// pair helps manage, identify, search, and filter your resources by
  /// labelling them.
  ///
  /// Format: <code>"key" : "value"</code>
  ///
  /// Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Maximum 50 tags per resource
  /// </li>
  /// <li>
  /// Each resource tag must be unique with a maximum of one value.
  /// </li>
  /// <li>
  /// Maximum key length: 128 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length: 256 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Can use alphanumeric characters (A–Z, a–z, 0–9), and the following
  /// characters: + - = . _ : / @.
  /// </li>
  /// <li>
  /// Cannot use "aws:" as a prefix for a key.
  /// </li>
  /// </ul>
  Future<CreateTrackerResponse> createTracker({
    required String trackerName,
    String? description,
    bool? eventBridgeEnabled,
    bool? kmsKeyEnableGeospatialQueries,
    String? kmsKeyId,
    PositionFiltering? positionFiltering,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'TrackerName': trackerName,
      if (description != null) 'Description': description,
      if (eventBridgeEnabled != null) 'EventBridgeEnabled': eventBridgeEnabled,
      if (kmsKeyEnableGeospatialQueries != null)
        'KmsKeyEnableGeospatialQueries': kmsKeyEnableGeospatialQueries,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (positionFiltering != null)
        'PositionFiltering': positionFiltering.value,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tracking/v0/trackers',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTrackerResponse.fromJson(response);
  }

  /// Retrieves the tracker resource details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource.
  Future<DescribeTrackerResponse> describeTracker({
    required String trackerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTrackerResponse.fromJson(response);
  }

  /// Updates the specified properties of a given tracker resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to update.
  ///
  /// Parameter [description] :
  /// Updates the description for the tracker resource.
  ///
  /// Parameter [eventBridgeEnabled] :
  /// Whether to enable position <code>UPDATE</code> events from this tracker to
  /// be sent to EventBridge.
  /// <note>
  /// You do not need enable this feature to get <code>ENTER</code> and
  /// <code>EXIT</code> events for geofences with this tracker. Those events are
  /// always sent to EventBridge.
  /// </note>
  ///
  /// Parameter [kmsKeyEnableGeospatialQueries] :
  /// Enables <code>GeospatialQueries</code> for a tracker that uses a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>.
  ///
  /// This parameter is only used if you are using a KMS customer managed key.
  ///
  /// Parameter [positionFiltering] :
  /// Updates the position filtering for the tracker resource.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>TimeBased</code> - Location updates are evaluated against linked
  /// geofence collections, but not every location update is stored. If your
  /// update frequency is more often than 30 seconds, only one update per 30
  /// seconds is stored for each unique device ID.
  /// </li>
  /// <li>
  /// <code>DistanceBased</code> - If the device has moved less than 30 m (98.4
  /// ft), location updates are ignored. Location updates within this distance
  /// are neither evaluated against linked geofence collections, nor stored.
  /// This helps control costs by reducing the number of geofence evaluations
  /// and historical device positions to paginate through. Distance-based
  /// filtering can also reduce the effects of GPS noise when displaying device
  /// trajectories on a map.
  /// </li>
  /// <li>
  /// <code>AccuracyBased</code> - If the device has moved less than the
  /// measured accuracy, location updates are ignored. For example, if two
  /// consecutive updates from a device have a horizontal accuracy of 5 m and 10
  /// m, the second update is ignored if the device has moved less than 15 m.
  /// Ignored location updates are neither evaluated against linked geofence
  /// collections, nor stored. This helps educe the effects of GPS noise when
  /// displaying device trajectories on a map, and can help control costs by
  /// reducing the number of geofence evaluations.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pricingPlan] :
  /// No longer used. If included, the only allowed value is
  /// <code>RequestBasedUsage</code>.
  ///
  /// Parameter [pricingPlanDataSource] :
  /// This parameter is no longer used.
  Future<UpdateTrackerResponse> updateTracker({
    required String trackerName,
    String? description,
    bool? eventBridgeEnabled,
    bool? kmsKeyEnableGeospatialQueries,
    PositionFiltering? positionFiltering,
    PricingPlan? pricingPlan,
    String? pricingPlanDataSource,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (eventBridgeEnabled != null) 'EventBridgeEnabled': eventBridgeEnabled,
      if (kmsKeyEnableGeospatialQueries != null)
        'KmsKeyEnableGeospatialQueries': kmsKeyEnableGeospatialQueries,
      if (positionFiltering != null)
        'PositionFiltering': positionFiltering.value,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTrackerResponse.fromJson(response);
  }

  /// Deletes a tracker resource from your Amazon Web Services account.
  /// <note>
  /// This operation deletes the resource permanently. If the tracker resource
  /// is in use, you may encounter an error. Make sure that the target resource
  /// isn't a dependency for your applications.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be deleted.
  Future<void> deleteTracker({
    required String trackerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists tracker resources in your Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListTrackersResponse> listTrackers({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tracking/v0/list-trackers',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return ListTrackersResponse.fromJson(response);
  }

  /// Creates an association between a geofence collection and a tracker
  /// resource. This allows the tracker resource to communicate location data to
  /// the linked geofence collection.
  ///
  /// You can associate up to five geofence collections to each tracker
  /// resource.
  /// <note>
  /// Currently not supported — Cross-account configurations, such as creating
  /// associations between a tracker resource in one account and a geofence
  /// collection in another account.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) for the geofence collection to be
  /// associated to tracker resource. Used when you need to specify a resource
  /// across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be associated with a geofence
  /// collection.
  Future<void> associateTrackerConsumer({
    required String consumerArn,
    required String trackerName,
  }) async {
    final $payload = <String, dynamic>{
      'ConsumerArn': consumerArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/consumers',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the position history of one or more devices from a tracker
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceIds] :
  /// Devices whose position history you want to delete.
  ///
  /// <ul>
  /// <li>
  /// For example, for two devices: <code>“DeviceIds” :
  /// \[DeviceId1,DeviceId2\]</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to delete the device position history
  /// from.
  Future<BatchDeleteDevicePositionHistoryResponse>
      batchDeleteDevicePositionHistory({
    required List<String> deviceIds,
    required String trackerName,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceIds': deviceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/delete-positions',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteDevicePositionHistoryResponse.fromJson(response);
  }

  /// Lists the latest device positions for requested devices.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceIds] :
  /// Devices whose position you want to retrieve.
  ///
  /// <ul>
  /// <li>
  /// For example, for two devices:
  /// <code>device-ids=DeviceId1&amp;device-ids=DeviceId2</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The tracker resource retrieving the device position.
  Future<BatchGetDevicePositionResponse> batchGetDevicePosition({
    required List<String> deviceIds,
    required String trackerName,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceIds': deviceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/get-positions',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetDevicePositionResponse.fromJson(response);
  }

  /// Uploads position update data for one or more devices to a tracker resource
  /// (up to 10 devices per batch). Amazon Location uses the data when it
  /// reports the last known device position and position history. Amazon
  /// Location retains location data for 30 days.
  /// <note>
  /// Position updates are handled based on the <code>PositionFiltering</code>
  /// property of the tracker. When <code>PositionFiltering</code> is set to
  /// <code>TimeBased</code>, updates are evaluated against linked geofence
  /// collections, and location data is stored at a maximum of one position per
  /// 30 second interval. If your update frequency is more often than every 30
  /// seconds, only one update per 30 seconds is stored for each unique device
  /// ID.
  ///
  /// When <code>PositionFiltering</code> is set to <code>DistanceBased</code>
  /// filtering, location data is stored and evaluated against linked geofence
  /// collections only if the device has moved more than 30 m (98.4 ft).
  ///
  /// When <code>PositionFiltering</code> is set to <code>AccuracyBased</code>
  /// filtering, location data is stored and evaluated against linked geofence
  /// collections only if the device has moved more than the measured accuracy.
  /// For example, if two consecutive updates from a device have a horizontal
  /// accuracy of 5 m and 10 m, the second update is neither stored or evaluated
  /// if the device has moved less than 15 m. If <code>PositionFiltering</code>
  /// is set to <code>AccuracyBased</code> filtering, Amazon Location uses the
  /// default value <code>{ "Horizontal": 0}</code> when accuracy is not
  /// provided on a <code>DevicePositionUpdate</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to update.
  ///
  /// Parameter [updates] :
  /// Contains the position update details for each device, up to 10 devices.
  Future<BatchUpdateDevicePositionResponse> batchUpdateDevicePosition({
    required String trackerName,
    required List<DevicePositionUpdate> updates,
  }) async {
    final $payload = <String, dynamic>{
      'Updates': updates,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/positions',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateDevicePositionResponse.fromJson(response);
  }

  /// Removes the association between a tracker resource and a geofence
  /// collection.
  /// <note>
  /// Once you unlink a tracker resource from a geofence collection, the tracker
  /// positions will no longer be automatically evaluated against geofences.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [consumerArn] :
  /// The Amazon Resource Name (ARN) for the geofence collection to be
  /// disassociated from the tracker resource. Used when you need to specify a
  /// resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be dissociated from the consumer.
  Future<void> disassociateTrackerConsumer({
    required String consumerArn,
    required String trackerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/consumers/${Uri.encodeComponent(consumerArn)}',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a device's most recent position according to its sample time.
  /// <note>
  /// Device positions are deleted after 30 days.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceId] :
  /// The device whose position you want to retrieve.
  ///
  /// Parameter [trackerName] :
  /// The tracker resource receiving the position update.
  Future<GetDevicePositionResponse> getDevicePosition({
    required String deviceId,
    required String trackerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/devices/${Uri.encodeComponent(deviceId)}/positions/latest',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return GetDevicePositionResponse.fromJson(response);
  }

  /// Retrieves the device position history from a tracker resource within a
  /// specified range of time.
  /// <note>
  /// Device positions are deleted after 30 days.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceId] :
  /// The device whose position history you want to retrieve.
  ///
  /// Parameter [trackerName] :
  /// The tracker resource receiving the request for the device position
  /// history.
  ///
  /// Parameter [endTimeExclusive] :
  /// Specify the end time for the position history in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the
  /// value will be the time that the request is made.
  ///
  /// Requirement:
  ///
  /// <ul>
  /// <li>
  /// The time specified for <code>EndTimeExclusive</code> must be after the
  /// time for <code>StartTimeInclusive</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of device positions returned in a single
  /// call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  ///
  /// Parameter [startTimeInclusive] :
  /// Specify the start time for the position history in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the
  /// value will be 24 hours prior to the time that the request is made.
  ///
  /// Requirement:
  ///
  /// <ul>
  /// <li>
  /// The time specified for <code>StartTimeInclusive</code> must be before
  /// <code>EndTimeExclusive</code>.
  /// </li>
  /// </ul>
  Future<GetDevicePositionHistoryResponse> getDevicePositionHistory({
    required String deviceId,
    required String trackerName,
    DateTime? endTimeExclusive,
    int? maxResults,
    String? nextToken,
    DateTime? startTimeInclusive,
  }) async {
    final $payload = <String, dynamic>{
      if (endTimeExclusive != null)
        'EndTimeExclusive': iso8601ToJson(endTimeExclusive),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (startTimeInclusive != null)
        'StartTimeInclusive': iso8601ToJson(startTimeInclusive),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/devices/${Uri.encodeComponent(deviceId)}/list-positions',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return GetDevicePositionHistoryResponse.fromJson(response);
  }

  /// A batch request to retrieve all device positions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The tracker resource containing the requested devices.
  ///
  /// Parameter [filterGeometry] :
  /// The geometry used to filter device positions.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of entries returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListDevicePositionsResponse> listDevicePositions({
    required String trackerName,
    TrackingFilterGeometry? filterGeometry,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filterGeometry != null) 'FilterGeometry': filterGeometry,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/list-positions',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicePositionsResponse.fromJson(response);
  }

  /// Lists geofence collections currently associated to the given tracker
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [trackerName] :
  /// The tracker resource whose associated geofence collections you want to
  /// list.
  ///
  /// Parameter [maxResults] :
  /// An optional limit for the number of resources returned in a single call.
  ///
  /// Default value: <code>100</code>
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  ///
  /// Default value: <code>null</code>
  Future<ListTrackerConsumersResponse> listTrackerConsumers({
    required String trackerName,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/list-consumers',
      hostPrefix: 'cp.tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return ListTrackerConsumersResponse.fromJson(response);
  }

  /// Verifies the integrity of the device's position by determining if it was
  /// reported behind a proxy, and by comparing it to an inferred position
  /// estimated based on the device's state.
  /// <note>
  /// The Location Integrity SDK provides enhanced features related to device
  /// verification, and it is available for use by request. To get access to the
  /// SDK, contact <a
  /// href="https://aws.amazon.com/contact-us/sales-support/?pg=locationprice&amp;cta=herobtn">Sales
  /// Support</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [deviceState] :
  /// The device's state, including position, IP address, cell signals and Wi-Fi
  /// access points.
  ///
  /// Parameter [trackerName] :
  /// The name of the tracker resource to be associated with verification
  /// request.
  ///
  /// Parameter [distanceUnit] :
  /// The distance unit for the verification request.
  ///
  /// Default Value: <code>Kilometers</code>
  Future<VerifyDevicePositionResponse> verifyDevicePosition({
    required DeviceState deviceState,
    required String trackerName,
    DistanceUnit? distanceUnit,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceState': deviceState,
      if (distanceUnit != null) 'DistanceUnit': distanceUnit.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/tracking/v0/trackers/${Uri.encodeComponent(trackerName)}/positions/verify',
      hostPrefix: 'tracking.',
      exceptionFnMap: _exceptionFns,
    );
    return VerifyDevicePositionResponse.fromJson(response);
  }
}

/// @nodoc
class CreateKeyResponse {
  /// The timestamp for when the API key resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The key value/string of an API key. This value is used when making API calls
  /// to authorize the call. For example, see <a
  /// href="https://docs.aws.amazon.com/location/previous/APIReference/API_GetMapGlyphs.html">GetMapGlyphs</a>.
  final String key;

  /// The Amazon Resource Name (ARN) for the API key resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code>
  /// </li>
  /// </ul>
  final String keyArn;

  /// The name of the API key resource.
  final String keyName;

  CreateKeyResponse({
    required this.createTime,
    required this.key,
    required this.keyArn,
    required this.keyName,
  });

  factory CreateKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateKeyResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      key: (json['Key'] as String?) ?? '',
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyName: (json['KeyName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final key = this.key;
    final keyArn = this.keyArn;
    final keyName = this.keyName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Key': key,
      'KeyArn': keyArn,
      'KeyName': keyName,
    };
  }
}

/// @nodoc
class DescribeKeyResponse {
  /// The timestamp for when the API key resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The timestamp for when the API key resource will expire in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime expireTime;

  /// The key value/string of an API key.
  final String key;

  /// The Amazon Resource Name (ARN) for the API key resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code>
  /// </li>
  /// </ul>
  final String keyArn;

  /// The name of the API key resource.
  final String keyName;
  final ApiKeyRestrictions restrictions;

  /// The timestamp for when the API key resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// The optional description for the API key resource.
  final String? description;

  /// Tags associated with the API key resource.
  final Map<String, String>? tags;

  DescribeKeyResponse({
    required this.createTime,
    required this.expireTime,
    required this.key,
    required this.keyArn,
    required this.keyName,
    required this.restrictions,
    required this.updateTime,
    this.description,
    this.tags,
  });

  factory DescribeKeyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeKeyResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      expireTime: nonNullableTimeStampFromJson(json['ExpireTime'] ?? 0),
      key: (json['Key'] as String?) ?? '',
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyName: (json['KeyName'] as String?) ?? '',
      restrictions: ApiKeyRestrictions.fromJson(
          (json['Restrictions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      description: json['Description'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final expireTime = this.expireTime;
    final key = this.key;
    final keyArn = this.keyArn;
    final keyName = this.keyName;
    final restrictions = this.restrictions;
    final updateTime = this.updateTime;
    final description = this.description;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'ExpireTime': iso8601ToJson(expireTime),
      'Key': key,
      'KeyArn': keyArn,
      'KeyName': keyName,
      'Restrictions': restrictions,
      'UpdateTime': iso8601ToJson(updateTime),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateKeyResponse {
  /// The Amazon Resource Name (ARN) for the API key resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:key/ExampleKey</code>
  /// </li>
  /// </ul>
  final String keyArn;

  /// The name of the API key resource.
  final String keyName;

  /// The timestamp for when the API key resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateKeyResponse({
    required this.keyArn,
    required this.keyName,
    required this.updateTime,
  });

  factory UpdateKeyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateKeyResponse(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyName: (json['KeyName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyName = this.keyName;
    final updateTime = this.updateTime;
    return {
      'KeyArn': keyArn,
      'KeyName': keyName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteKeyResponse {
  DeleteKeyResponse();

  factory DeleteKeyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListKeysResponse {
  /// Contains API key resources in your Amazon Web Services account. Details
  /// include API key name, allowed referers and timestamp for when the API key
  /// will expire.
  final List<ListKeysResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListKeysResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListKeysResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListKeysResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Tags that have been applied to the specified resource. Tags are mapped from
  /// the tag key to the tag value: <code>"TagKey" : "TagValue"</code>.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>{"tag1" : "value1", "tag2" : "value2"} </code>
  /// </li>
  /// </ul>
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code>
  /// </li>
  /// </ul>
  final String collectionArn;

  /// The name for the geofence collection.
  final String collectionName;

  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  CreateGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.createTime,
  });

  factory CreateGeofenceCollectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateGeofenceCollectionResponse(
      collectionArn: (json['CollectionArn'] as String?) ?? '',
      collectionName: (json['CollectionName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
    };
  }
}

/// @nodoc
class DescribeGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) for the geofence collection resource. Used
  /// when you need to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code>
  /// </li>
  /// </ul>
  final String collectionArn;

  /// The name of the geofence collection.
  final String collectionName;

  /// The timestamp for when the geofence resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The optional description for the geofence collection.
  final String description;

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// The number of geofences in the geofence collection.
  final int? geofenceCount;

  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a> assigned to the Amazon Location
  /// resource
  final String? kmsKeyId;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  /// Displays the key, value pairs of tags associated with this resource.
  final Map<String, String>? tags;

  DescribeGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.createTime,
    required this.description,
    required this.updateTime,
    this.geofenceCount,
    this.kmsKeyId,
    this.pricingPlan,
    this.pricingPlanDataSource,
    this.tags,
  });

  factory DescribeGeofenceCollectionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeGeofenceCollectionResponse(
      collectionArn: (json['CollectionArn'] as String?) ?? '',
      collectionName: (json['CollectionName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      geofenceCount: json['GeofenceCount'] as int?,
      kmsKeyId: json['KmsKeyId'] as String?,
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    final description = this.description;
    final updateTime = this.updateTime;
    final geofenceCount = this.geofenceCount;
    final kmsKeyId = this.kmsKeyId;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    final tags = this.tags;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (geofenceCount != null) 'GeofenceCount': geofenceCount,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateGeofenceCollectionResponse {
  /// The Amazon Resource Name (ARN) of the updated geofence collection. Used to
  /// specify a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code>
  /// </li>
  /// </ul>
  final String collectionArn;

  /// The name of the updated geofence collection.
  final String collectionName;

  /// The time when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  UpdateGeofenceCollectionResponse({
    required this.collectionArn,
    required this.collectionName,
    required this.updateTime,
  });

  factory UpdateGeofenceCollectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGeofenceCollectionResponse(
      collectionArn: (json['CollectionArn'] as String?) ?? '',
      collectionName: (json['CollectionName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final collectionArn = this.collectionArn;
    final collectionName = this.collectionName;
    final updateTime = this.updateTime;
    return {
      'CollectionArn': collectionArn,
      'CollectionName': collectionName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteGeofenceCollectionResponse {
  DeleteGeofenceCollectionResponse();

  factory DeleteGeofenceCollectionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGeofenceCollectionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListGeofenceCollectionsResponse {
  /// Lists the geofence collections that exist in your Amazon Web Services
  /// account.
  final List<ListGeofenceCollectionsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListGeofenceCollectionsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListGeofenceCollectionsResponse.fromJson(Map<String, dynamic> json) {
    return ListGeofenceCollectionsResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListGeofenceCollectionsResponseEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchDeleteGeofenceResponse {
  /// Contains error details for each geofence that failed to delete.
  final List<BatchDeleteGeofenceError> errors;

  BatchDeleteGeofenceResponse({
    required this.errors,
  });

  factory BatchDeleteGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteGeofenceResponse(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchDeleteGeofenceError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// @nodoc
class BatchEvaluateGeofencesResponse {
  /// Contains error details for each device that failed to evaluate its position
  /// against the given geofence collection.
  final List<BatchEvaluateGeofencesError> errors;

  BatchEvaluateGeofencesResponse({
    required this.errors,
  });

  factory BatchEvaluateGeofencesResponse.fromJson(Map<String, dynamic> json) {
    return BatchEvaluateGeofencesResponse(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchEvaluateGeofencesError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// @nodoc
class BatchPutGeofenceResponse {
  /// Contains additional error details for each geofence that failed to be stored
  /// in a geofence collection.
  final List<BatchPutGeofenceError> errors;

  /// Contains each geofence that was successfully stored in a geofence
  /// collection.
  final List<BatchPutGeofenceSuccess> successes;

  BatchPutGeofenceResponse({
    required this.errors,
    required this.successes,
  });

  factory BatchPutGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceResponse(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchPutGeofenceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      successes: ((json['Successes'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchPutGeofenceSuccess.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final successes = this.successes;
    return {
      'Errors': errors,
      'Successes': successes,
    };
  }
}

/// @nodoc
class ForecastGeofenceEventsResponse {
  /// The distance unit for the forecasted events.
  final DistanceUnit distanceUnit;

  /// The list of forecasted events.
  final List<ForecastedEvent> forecastedEvents;

  /// The speed unit for the forecasted events.
  final SpeedUnit speedUnit;

  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  final String? nextToken;

  ForecastGeofenceEventsResponse({
    required this.distanceUnit,
    required this.forecastedEvents,
    required this.speedUnit,
    this.nextToken,
  });

  factory ForecastGeofenceEventsResponse.fromJson(Map<String, dynamic> json) {
    return ForecastGeofenceEventsResponse(
      distanceUnit:
          DistanceUnit.fromString((json['DistanceUnit'] as String?) ?? ''),
      forecastedEvents: ((json['ForecastedEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) => ForecastedEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      speedUnit: SpeedUnit.fromString((json['SpeedUnit'] as String?) ?? ''),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distanceUnit = this.distanceUnit;
    final forecastedEvents = this.forecastedEvents;
    final speedUnit = this.speedUnit;
    final nextToken = this.nextToken;
    return {
      'DistanceUnit': distanceUnit.value,
      'ForecastedEvents': forecastedEvents,
      'SpeedUnit': speedUnit.value,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class GetGeofenceResponse {
  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence identifier.
  final String geofenceId;

  /// Contains the geofence geometry details describing the position of the
  /// geofence. Can be a circle, a polygon, or a multipolygon.
  final GeofenceGeometry geometry;

  /// Identifies the state of the geofence. A geofence will hold one of the
  /// following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> — The geofence has been indexed by the system.
  /// </li>
  /// <li>
  /// <code>PENDING</code> — The geofence is being processed by the system.
  /// </li>
  /// <li>
  /// <code>FAILED</code> — The geofence failed to be indexed by the system.
  /// </li>
  /// <li>
  /// <code>DELETED</code> — The geofence has been deleted from the system index.
  /// </li>
  /// <li>
  /// <code>DELETING</code> — The geofence is being deleted from the system index.
  /// </li>
  /// </ul>
  final String status;

  /// The timestamp for when the geofence collection was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// User defined properties of the geofence. A property is a key-value pair
  /// stored with the geofence and added to any geofence event triggered with that
  /// geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? geofenceProperties;

  GetGeofenceResponse({
    required this.createTime,
    required this.geofenceId,
    required this.geometry,
    required this.status,
    required this.updateTime,
    this.geofenceProperties,
  });

  factory GetGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return GetGeofenceResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
      geometry: GeofenceGeometry.fromJson(
          (json['Geometry'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: (json['Status'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      geofenceProperties: (json['GeofenceProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final status = this.status;
    final updateTime = this.updateTime;
    final geofenceProperties = this.geofenceProperties;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      'Status': status,
      'UpdateTime': iso8601ToJson(updateTime),
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
    };
  }
}

/// @nodoc
class ListGeofencesResponse {
  /// Contains a list of geofences stored in the geofence collection.
  final List<ListGeofenceResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListGeofencesResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListGeofencesResponse.fromJson(Map<String, dynamic> json) {
    return ListGeofencesResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListGeofenceResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class PutGeofenceResponse {
  /// The timestamp for when the geofence was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence identifier entered in the request.
  final String geofenceId;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  PutGeofenceResponse({
    required this.createTime,
    required this.geofenceId,
    required this.updateTime,
  });

  factory PutGeofenceResponse.fromJson(Map<String, dynamic> json) {
    return PutGeofenceResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class StartJobResponse {
  /// Job creation time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) for the job resource. Used when you need to
  /// specify a resource across all Amazon Web Services.
  ///
  /// Format example: <code>arn:aws:geo:region:account-id:job/ExampleJob</code>
  final String jobArn;

  /// Unique job identifier.
  final String jobId;

  /// Initial job status (always "Pending" for new jobs).
  final JobStatus status;

  StartJobResponse({
    required this.createdAt,
    required this.jobArn,
    required this.jobId,
    required this.status,
  });

  factory StartJobResponse.fromJson(Map<String, dynamic> json) {
    return StartJobResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      jobArn: (json['JobArn'] as String?) ?? '',
      jobId: (json['JobId'] as String?) ?? '',
      status: JobStatus.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final status = this.status;
    return {
      'CreatedAt': iso8601ToJson(createdAt),
      'JobArn': jobArn,
      'JobId': jobId,
      'Status': status.value,
    };
  }
}

/// @nodoc
class GetJobResponse {
  /// Action performed by the job.
  final JobAction action;

  /// Job creation time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>.
  final DateTime createdAt;

  /// IAM role used for permissions when running the job.
  final String executionRoleArn;

  /// Input configuration.
  final JobInputOptions inputOptions;

  /// Amazon Resource Name (ARN) of the specified job.
  final String jobArn;

  /// Unique job identifier.
  final String jobId;

  /// Output configuration.
  final JobOutputOptions outputOptions;

  /// Current job status.
  final JobStatus status;

  /// Last update time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>.
  final DateTime updatedAt;

  /// Additional options for configuring job action parameters.
  final JobActionOptions? actionOptions;

  /// Job completion time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>. Only returned for jobs in a
  /// terminal status: <code>Completed</code> | <code>Failed</code> |
  /// <code>Cancelled</code>.
  final DateTime? endedAt;

  /// Error information if the job failed.
  final JobError? error;

  /// Job name (if provided during creation).
  final String? name;

  /// Tags and corresponding values associated with the specified job.
  final Map<String, String>? tags;

  GetJobResponse({
    required this.action,
    required this.createdAt,
    required this.executionRoleArn,
    required this.inputOptions,
    required this.jobArn,
    required this.jobId,
    required this.outputOptions,
    required this.status,
    required this.updatedAt,
    this.actionOptions,
    this.endedAt,
    this.error,
    this.name,
    this.tags,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      action: JobAction.fromString((json['Action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      executionRoleArn: (json['ExecutionRoleArn'] as String?) ?? '',
      inputOptions: JobInputOptions.fromJson(
          (json['InputOptions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['JobArn'] as String?) ?? '',
      jobId: (json['JobId'] as String?) ?? '',
      outputOptions: JobOutputOptions.fromJson(
          (json['OutputOptions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: JobStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      actionOptions: json['ActionOptions'] != null
          ? JobActionOptions.fromJson(
              json['ActionOptions'] as Map<String, dynamic>)
          : null,
      endedAt: timeStampFromJson(json['EndedAt']),
      error: json['Error'] != null
          ? JobError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final inputOptions = this.inputOptions;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final outputOptions = this.outputOptions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final actionOptions = this.actionOptions;
    final endedAt = this.endedAt;
    final error = this.error;
    final name = this.name;
    final tags = this.tags;
    return {
      'Action': action.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'ExecutionRoleArn': executionRoleArn,
      'InputOptions': inputOptions,
      'JobArn': jobArn,
      'JobId': jobId,
      'OutputOptions': outputOptions,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (actionOptions != null) 'ActionOptions': actionOptions,
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (error != null) 'Error': error,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class ListJobsResponse {
  /// List of jobs in your Amazon Web Services account.
  final List<ListJobsResponseEntry> entries;

  /// Token for retrieving the next page (present if more results available).
  final String? nextToken;

  ListJobsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListJobsResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CancelJobResponse {
  /// Amazon Resource Name (ARN) of the cancelled job.
  final String jobArn;

  /// Unique job identifier.
  final String jobId;

  /// Job status after cancellation request.
  final JobStatus status;

  CancelJobResponse({
    required this.jobArn,
    required this.jobId,
    required this.status,
  });

  factory CancelJobResponse.fromJson(Map<String, dynamic> json) {
    return CancelJobResponse(
      jobArn: (json['JobArn'] as String?) ?? '',
      jobId: (json['JobId'] as String?) ?? '',
      status: JobStatus.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final status = this.status;
    return {
      'JobArn': jobArn,
      'JobId': jobId,
      'Status': status.value,
    };
  }
}

/// @nodoc
class CreateMapResponse {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the map resource. Used to specify a
  /// resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The name of the map resource.
  final String mapName;

  CreateMapResponse({
    required this.createTime,
    required this.mapArn,
    required this.mapName,
  });

  factory CreateMapResponse.fromJson(Map<String, dynamic> json) {
    return CreateMapResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      mapArn: (json['MapArn'] as String?) ?? '',
      mapName: (json['MapName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final mapArn = this.mapArn;
    final mapName = this.mapName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'MapArn': mapArn,
      'MapName': mapName,
    };
  }
}

/// @nodoc
class DescribeMapResponse {
  /// Specifies the map tile style selected from a partner data provider.
  final MapConfiguration configuration;

  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// Specifies the data provider for the associated map tiles.
  final String dataSource;

  /// The optional description for the map resource.
  final String description;

  /// The Amazon Resource Name (ARN) for the map resource. Used to specify a
  /// resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The map style selected from an available provider.
  final String mapName;

  /// The timestamp for when the map resource was last update in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// Tags associated with the map resource.
  final Map<String, String>? tags;

  DescribeMapResponse({
    required this.configuration,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.mapArn,
    required this.mapName,
    required this.updateTime,
    this.pricingPlan,
    this.tags,
  });

  factory DescribeMapResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMapResponse(
      configuration: MapConfiguration.fromJson(
          (json['Configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      dataSource: (json['DataSource'] as String?) ?? '',
      description: (json['Description'] as String?) ?? '',
      mapArn: (json['MapArn'] as String?) ?? '',
      mapName: (json['MapName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final mapArn = this.mapArn;
    final mapName = this.mapName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final tags = this.tags;
    return {
      'Configuration': configuration,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'MapArn': mapArn,
      'MapName': mapName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateMapResponse {
  /// The Amazon Resource Name (ARN) of the updated map resource. Used to specify
  /// a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:map/ExampleMap</code>
  /// </li>
  /// </ul>
  final String mapArn;

  /// The name of the updated map resource.
  final String mapName;

  /// The timestamp for when the map resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateMapResponse({
    required this.mapArn,
    required this.mapName,
    required this.updateTime,
  });

  factory UpdateMapResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMapResponse(
      mapArn: (json['MapArn'] as String?) ?? '',
      mapName: (json['MapName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final mapArn = this.mapArn;
    final mapName = this.mapName;
    final updateTime = this.updateTime;
    return {
      'MapArn': mapArn,
      'MapName': mapName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteMapResponse {
  DeleteMapResponse();

  factory DeleteMapResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMapResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMapsResponse {
  /// Contains a list of maps in your Amazon Web Services account
  final List<ListMapsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListMapsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListMapsResponse.fromJson(Map<String, dynamic> json) {
    return ListMapsResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListMapsResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class GetMapGlyphsResponse {
  /// The glyph, as binary blob.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The map glyph content type. For example,
  /// <code>application/octet-stream</code>.
  final String? contentType;

  GetMapGlyphsResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetMapSpritesResponse {
  /// Contains the body of the sprite sheet or JSON offset ﬁle.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The content type of the sprite sheet and offsets. For example, the sprite
  /// sheet content type is <code>image/png</code>, and the sprite offset JSON
  /// document is <code>application/json</code>.
  final String? contentType;

  GetMapSpritesResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetMapStyleDescriptorResponse {
  /// Contains the body of the style descriptor.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The style descriptor's content type. For example,
  /// <code>application/json</code>.
  final String? contentType;

  GetMapStyleDescriptorResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class GetMapTileResponse {
  /// Contains Mapbox Vector Tile (MVT) data.
  final Uint8List? blob;

  /// The HTTP Cache-Control directive for the value.
  final String? cacheControl;

  /// The map tile's content type. For example,
  /// <code>application/vnd.mapbox-vector-tile</code>.
  final String? contentType;

  GetMapTileResponse({
    this.blob,
    this.cacheControl,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final cacheControl = this.cacheControl;
    final contentType = this.contentType;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
    };
  }
}

/// @nodoc
class CreatePlaceIndexResponse {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the place index resource. Used to specify
  /// a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code>
  /// </li>
  /// </ul>
  final String indexArn;

  /// The name for the place index resource.
  final String indexName;

  CreatePlaceIndexResponse({
    required this.createTime,
    required this.indexArn,
    required this.indexName,
  });

  factory CreatePlaceIndexResponse.fromJson(Map<String, dynamic> json) {
    return CreatePlaceIndexResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      indexArn: (json['IndexArn'] as String?) ?? '',
      indexName: (json['IndexName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'IndexArn': indexArn,
      'IndexName': indexName,
    };
  }
}

/// @nodoc
class DescribePlaceIndexResponse {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The data provider of geospatial data. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The specified data storage option for requesting Places.
  final DataSourceConfiguration dataSourceConfiguration;

  /// The optional description for the place index resource.
  final String description;

  /// The Amazon Resource Name (ARN) for the place index resource. Used to specify
  /// a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code>
  /// </li>
  /// </ul>
  final String indexArn;

  /// The name of the place index resource being described.
  final String indexName;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// Tags associated with place index resource.
  final Map<String, String>? tags;

  DescribePlaceIndexResponse({
    required this.createTime,
    required this.dataSource,
    required this.dataSourceConfiguration,
    required this.description,
    required this.indexArn,
    required this.indexName,
    required this.updateTime,
    this.pricingPlan,
    this.tags,
  });

  factory DescribePlaceIndexResponse.fromJson(Map<String, dynamic> json) {
    return DescribePlaceIndexResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      dataSource: (json['DataSource'] as String?) ?? '',
      dataSourceConfiguration: DataSourceConfiguration.fromJson(
          (json['DataSourceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      description: (json['Description'] as String?) ?? '',
      indexArn: (json['IndexArn'] as String?) ?? '',
      indexName: (json['IndexName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final dataSourceConfiguration = this.dataSourceConfiguration;
    final description = this.description;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'DataSourceConfiguration': dataSourceConfiguration,
      'Description': description,
      'IndexArn': indexArn,
      'IndexName': indexName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdatePlaceIndexResponse {
  /// The Amazon Resource Name (ARN) of the upated place index resource. Used to
  /// specify a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:place-
  /// index/ExamplePlaceIndex</code>
  /// </li>
  /// </ul>
  final String indexArn;

  /// The name of the updated place index resource.
  final String indexName;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdatePlaceIndexResponse({
    required this.indexArn,
    required this.indexName,
    required this.updateTime,
  });

  factory UpdatePlaceIndexResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePlaceIndexResponse(
      indexArn: (json['IndexArn'] as String?) ?? '',
      indexName: (json['IndexName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final updateTime = this.updateTime;
    return {
      'IndexArn': indexArn,
      'IndexName': indexName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeletePlaceIndexResponse {
  DeletePlaceIndexResponse();

  factory DeletePlaceIndexResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlaceIndexResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListPlaceIndexesResponse {
  /// Lists the place index resources that exist in your Amazon Web Services
  /// account
  final List<ListPlaceIndexesResponseEntry> entries;

  /// A pagination token indicating that there are additional pages available. You
  /// can use the token in a new request to fetch the next page of results.
  final String? nextToken;

  ListPlaceIndexesResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListPlaceIndexesResponse.fromJson(Map<String, dynamic> json) {
    return ListPlaceIndexesResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListPlaceIndexesResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class GetPlaceResponse {
  /// Details about the result, such as its address and position.
  final Place place;

  GetPlaceResponse({
    required this.place,
  });

  factory GetPlaceResponse.fromJson(Map<String, dynamic> json) {
    return GetPlaceResponse(
      place: Place.fromJson((json['Place'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    return {
      'Place': place,
    };
  }
}

/// @nodoc
class SearchPlaceIndexForPositionResponse {
  /// Returns a list of Places closest to the specified position. Each result
  /// contains additional information about the Places returned.
  final List<SearchForPositionResult> results;

  /// Contains a summary of the request. Echoes the input values for
  /// <code>Position</code>, <code>Language</code>, <code>MaxResults</code>, and
  /// the <code>DataSource</code> of the place index.
  final SearchPlaceIndexForPositionSummary summary;

  SearchPlaceIndexForPositionResponse({
    required this.results,
    required this.summary,
  });

  factory SearchPlaceIndexForPositionResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForPositionResponse(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SearchForPositionResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: SearchPlaceIndexForPositionSummary.fromJson(
          (json['Summary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final summary = this.summary;
    return {
      'Results': results,
      'Summary': summary,
    };
  }
}

/// @nodoc
class SearchPlaceIndexForSuggestionsResponse {
  /// A list of place suggestions that best match the search text.
  final List<SearchForSuggestionsResult> results;

  /// Contains a summary of the request. Echoes the input values for
  /// <code>BiasPosition</code>, <code>FilterBBox</code>,
  /// <code>FilterCountries</code>, <code>Language</code>,
  /// <code>MaxResults</code>, and <code>Text</code>. Also includes the
  /// <code>DataSource</code> of the place index.
  final SearchPlaceIndexForSuggestionsSummary summary;

  SearchPlaceIndexForSuggestionsResponse({
    required this.results,
    required this.summary,
  });

  factory SearchPlaceIndexForSuggestionsResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForSuggestionsResponse(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SearchForSuggestionsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: SearchPlaceIndexForSuggestionsSummary.fromJson(
          (json['Summary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final summary = this.summary;
    return {
      'Results': results,
      'Summary': summary,
    };
  }
}

/// @nodoc
class SearchPlaceIndexForTextResponse {
  /// A list of Places matching the input text. Each result contains additional
  /// information about the specific point of interest.
  ///
  /// Not all response properties are included with all responses. Some properties
  /// may only be returned by specific data partners.
  final List<SearchForTextResult> results;

  /// Contains a summary of the request. Echoes the input values for
  /// <code>BiasPosition</code>, <code>FilterBBox</code>,
  /// <code>FilterCountries</code>, <code>Language</code>,
  /// <code>MaxResults</code>, and <code>Text</code>. Also includes the
  /// <code>DataSource</code> of the place index and the bounding box,
  /// <code>ResultBBox</code>, which surrounds the search results.
  final SearchPlaceIndexForTextSummary summary;

  SearchPlaceIndexForTextResponse({
    required this.results,
    required this.summary,
  });

  factory SearchPlaceIndexForTextResponse.fromJson(Map<String, dynamic> json) {
    return SearchPlaceIndexForTextResponse(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) => SearchForTextResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: SearchPlaceIndexForTextSummary.fromJson(
          (json['Summary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final summary = this.summary;
    return {
      'Results': results,
      'Summary': summary,
    };
  }
}

/// @nodoc
class CreateRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) for the route calculator resource. Use the
  /// ARN when you specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code>
  /// </li>
  /// </ul>
  final String calculatorArn;

  /// The name of the route calculator resource.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>ExampleRouteCalculator</code>.
  /// </li>
  /// </ul>
  final String calculatorName;

  /// The timestamp when the route calculator resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime createTime;

  CreateRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.createTime,
  });

  factory CreateRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return CreateRouteCalculatorResponse(
      calculatorArn: (json['CalculatorArn'] as String?) ?? '',
      calculatorName: (json['CalculatorName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorArn = this.calculatorArn;
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
    };
  }
}

/// @nodoc
class DescribeRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) for the Route calculator resource. Use the
  /// ARN when you specify a resource across Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code>
  /// </li>
  /// </ul>
  final String calculatorArn;

  /// The name of the route calculator resource being described.
  final String calculatorName;

  /// The timestamp when the route calculator resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime createTime;

  /// The data provider of traffic and road network data. Indicates one of the
  /// available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The optional description of the route calculator resource.
  final String description;

  /// The timestamp when the route calculator resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime updateTime;

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// Tags associated with route calculator resource.
  final Map<String, String>? tags;

  DescribeRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.updateTime,
    this.pricingPlan,
    this.tags,
  });

  factory DescribeRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRouteCalculatorResponse(
      calculatorArn: (json['CalculatorArn'] as String?) ?? '',
      calculatorName: (json['CalculatorName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      dataSource: (json['DataSource'] as String?) ?? '',
      description: (json['Description'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorArn = this.calculatorArn;
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final tags = this.tags;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateRouteCalculatorResponse {
  /// The Amazon Resource Name (ARN) of the updated route calculator resource.
  /// Used to specify a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example: <code>arn:aws:geo:region:account-id:route-
  /// calculator/ExampleCalculator</code>
  /// </li>
  /// </ul>
  final String calculatorArn;

  /// The name of the updated route calculator resource.
  final String calculatorName;

  /// The timestamp for when the route calculator was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateRouteCalculatorResponse({
    required this.calculatorArn,
    required this.calculatorName,
    required this.updateTime,
  });

  factory UpdateRouteCalculatorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRouteCalculatorResponse(
      calculatorArn: (json['CalculatorArn'] as String?) ?? '',
      calculatorName: (json['CalculatorName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorArn = this.calculatorArn;
    final calculatorName = this.calculatorName;
    final updateTime = this.updateTime;
    return {
      'CalculatorArn': calculatorArn,
      'CalculatorName': calculatorName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteRouteCalculatorResponse {
  DeleteRouteCalculatorResponse();

  factory DeleteRouteCalculatorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRouteCalculatorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListRouteCalculatorsResponse {
  /// Lists the route calculator resources that exist in your Amazon Web Services
  /// account
  final List<ListRouteCalculatorsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a subsequent request to fetch the next set of results.
  final String? nextToken;

  ListRouteCalculatorsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListRouteCalculatorsResponse.fromJson(Map<String, dynamic> json) {
    return ListRouteCalculatorsResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListRouteCalculatorsResponseEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returns the result of the route calculation. Metadata includes legs and
/// route summary.
///
/// @nodoc
class CalculateRouteResponse {
  /// Contains details about each path between a pair of positions included along
  /// a route such as: <code>StartPosition</code>, <code>EndPosition</code>,
  /// <code>Distance</code>, <code>DurationSeconds</code>, <code>Geometry</code>,
  /// and <code>Steps</code>. The number of legs returned corresponds to one fewer
  /// than the total number of positions in the request.
  ///
  /// For example, a route with a departure position and destination position
  /// returns one leg with the positions <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">snapped
  /// to a nearby road</a>:
  ///
  /// <ul>
  /// <li>
  /// The <code>StartPosition</code> is the departure position.
  /// </li>
  /// <li>
  /// The <code>EndPosition</code> is the destination position.
  /// </li>
  /// </ul>
  /// A route with a waypoint between the departure and destination position
  /// returns two legs with the positions snapped to a nearby road:
  ///
  /// <ul>
  /// <li>
  /// Leg 1: The <code>StartPosition</code> is the departure position . The
  /// <code>EndPosition</code> is the waypoint positon.
  /// </li>
  /// <li>
  /// Leg 2: The <code>StartPosition</code> is the waypoint position. The
  /// <code>EndPosition</code> is the destination position.
  /// </li>
  /// </ul>
  final List<Leg> legs;

  /// Contains information about the whole route, such as: <code>RouteBBox</code>,
  /// <code>DataSource</code>, <code>Distance</code>, <code>DistanceUnit</code>,
  /// and <code>DurationSeconds</code>.
  final CalculateRouteSummary summary;

  CalculateRouteResponse({
    required this.legs,
    required this.summary,
  });

  factory CalculateRouteResponse.fromJson(Map<String, dynamic> json) {
    return CalculateRouteResponse(
      legs: ((json['Legs'] as List?) ?? const [])
          .nonNulls
          .map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: CalculateRouteSummary.fromJson(
          (json['Summary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final legs = this.legs;
    final summary = this.summary;
    return {
      'Legs': legs,
      'Summary': summary,
    };
  }
}

/// Returns the result of the route matrix calculation.
///
/// @nodoc
class CalculateRouteMatrixResponse {
  /// The calculated route matrix containing the results for all pairs of
  /// <code>DeparturePositions</code> to <code>DestinationPositions</code>. Each
  /// row corresponds to one entry in <code>DeparturePositions</code>. Each entry
  /// in the row corresponds to the route from that entry in
  /// <code>DeparturePositions</code> to an entry in
  /// <code>DestinationPositions</code>.
  final List<List<RouteMatrixEntry>> routeMatrix;

  /// Contains information about the route matrix, <code>DataSource</code>,
  /// <code>DistanceUnit</code>, <code>RouteCount</code> and
  /// <code>ErrorCount</code>.
  final CalculateRouteMatrixSummary summary;

  /// For routes calculated using an Esri route calculator resource, departure
  /// positions are snapped to the closest road. For Esri route calculator
  /// resources, this returns the list of departure/origin positions used for
  /// calculation of the <code>RouteMatrix</code>.
  final List<List<double>>? snappedDeparturePositions;

  /// The list of destination positions for the route matrix used for calculation
  /// of the <code>RouteMatrix</code>.
  final List<List<double>>? snappedDestinationPositions;

  CalculateRouteMatrixResponse({
    required this.routeMatrix,
    required this.summary,
    this.snappedDeparturePositions,
    this.snappedDestinationPositions,
  });

  factory CalculateRouteMatrixResponse.fromJson(Map<String, dynamic> json) {
    return CalculateRouteMatrixResponse(
      routeMatrix: ((json['RouteMatrix'] as List?) ?? const [])
          .nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => RouteMatrixEntry.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      summary: CalculateRouteMatrixSummary.fromJson(
          (json['Summary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      snappedDeparturePositions: (json['SnappedDeparturePositions'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
          .toList(),
      snappedDestinationPositions:
          (json['SnappedDestinationPositions'] as List?)
              ?.nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final routeMatrix = this.routeMatrix;
    final summary = this.summary;
    final snappedDeparturePositions = this.snappedDeparturePositions;
    final snappedDestinationPositions = this.snappedDestinationPositions;
    return {
      'RouteMatrix': routeMatrix,
      'Summary': summary,
      if (snappedDeparturePositions != null)
        'SnappedDeparturePositions': snappedDeparturePositions,
      if (snappedDestinationPositions != null)
        'SnappedDestinationPositions': snappedDestinationPositions,
    };
  }
}

/// @nodoc
class CreateTrackerResponse {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code>
  /// </li>
  /// </ul>
  final String trackerArn;

  /// The name of the tracker resource.
  final String trackerName;

  CreateTrackerResponse({
    required this.createTime,
    required this.trackerArn,
    required this.trackerName,
  });

  factory CreateTrackerResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrackerResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      trackerArn: (json['TrackerArn'] as String?) ?? '',
      trackerName: (json['TrackerName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
    };
  }
}

/// @nodoc
class DescribeTrackerResponse {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The optional description for the tracker resource.
  final String description;

  /// The Amazon Resource Name (ARN) for the tracker resource. Used when you need
  /// to specify a resource across all Amazon Web Services.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code>
  /// </li>
  /// </ul>
  final String trackerArn;

  /// The name of the tracker resource.
  final String trackerName;

  /// The timestamp for when the tracker resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// Whether <code>UPDATE</code> events from this tracker in EventBridge are
  /// enabled. If set to <code>true</code> these events will be sent to
  /// EventBridge.
  final bool? eventBridgeEnabled;

  /// Enables <code>GeospatialQueries</code> for a tracker that uses a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a>.
  ///
  /// This parameter is only used if you are using a KMS customer managed key.
  /// <note>
  /// If you wish to encrypt your data using your own KMS customer managed key,
  /// then the Bounding Polygon Queries feature will be disabled by default. This
  /// is because by using this feature, a representation of your device positions
  /// will not be encrypted using the your KMS managed key. The exact device
  /// position, however; is still encrypted using your managed key.
  ///
  /// You can choose to opt-in to the Bounding Polygon Quseries feature. This is
  /// done by setting the <code>KmsKeyEnableGeospatialQueries</code> parameter to
  /// true when creating or updating a Tracker.
  /// </note>
  final bool? kmsKeyEnableGeospatialQueries;

  /// A key identifier for an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">Amazon
  /// Web Services KMS customer managed key</a> assigned to the Amazon Location
  /// resource.
  final String? kmsKeyId;

  /// The position filtering method of the tracker resource.
  final PositionFiltering? positionFiltering;

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  /// The tags associated with the tracker resource.
  final Map<String, String>? tags;

  DescribeTrackerResponse({
    required this.createTime,
    required this.description,
    required this.trackerArn,
    required this.trackerName,
    required this.updateTime,
    this.eventBridgeEnabled,
    this.kmsKeyEnableGeospatialQueries,
    this.kmsKeyId,
    this.positionFiltering,
    this.pricingPlan,
    this.pricingPlanDataSource,
    this.tags,
  });

  factory DescribeTrackerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTrackerResponse(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      trackerArn: (json['TrackerArn'] as String?) ?? '',
      trackerName: (json['TrackerName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      eventBridgeEnabled: json['EventBridgeEnabled'] as bool?,
      kmsKeyEnableGeospatialQueries:
          json['KmsKeyEnableGeospatialQueries'] as bool?,
      kmsKeyId: json['KmsKeyId'] as String?,
      positionFiltering: (json['PositionFiltering'] as String?)
          ?.let(PositionFiltering.fromString),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    final eventBridgeEnabled = this.eventBridgeEnabled;
    final kmsKeyEnableGeospatialQueries = this.kmsKeyEnableGeospatialQueries;
    final kmsKeyId = this.kmsKeyId;
    final positionFiltering = this.positionFiltering;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    final tags = this.tags;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (eventBridgeEnabled != null) 'EventBridgeEnabled': eventBridgeEnabled,
      if (kmsKeyEnableGeospatialQueries != null)
        'KmsKeyEnableGeospatialQueries': kmsKeyEnableGeospatialQueries,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (positionFiltering != null)
        'PositionFiltering': positionFiltering.value,
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateTrackerResponse {
  /// The Amazon Resource Name (ARN) of the updated tracker resource. Used to
  /// specify a resource across AWS.
  ///
  /// <ul>
  /// <li>
  /// Format example:
  /// <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code>
  /// </li>
  /// </ul>
  final String trackerArn;

  /// The name of the updated tracker resource.
  final String trackerName;

  /// The timestamp for when the tracker resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  UpdateTrackerResponse({
    required this.trackerArn,
    required this.trackerName,
    required this.updateTime,
  });

  factory UpdateTrackerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTrackerResponse(
      trackerArn: (json['TrackerArn'] as String?) ?? '',
      trackerName: (json['TrackerName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final trackerArn = this.trackerArn;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    return {
      'TrackerArn': trackerArn,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// @nodoc
class DeleteTrackerResponse {
  DeleteTrackerResponse();

  factory DeleteTrackerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrackerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListTrackersResponse {
  /// Contains tracker resources in your Amazon Web Services account. Details
  /// include tracker name, description and timestamps for when the tracker was
  /// created and last updated.
  final List<ListTrackersResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListTrackersResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListTrackersResponse.fromJson(Map<String, dynamic> json) {
    return ListTrackersResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListTrackersResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class AssociateTrackerConsumerResponse {
  AssociateTrackerConsumerResponse();

  factory AssociateTrackerConsumerResponse.fromJson(Map<String, dynamic> _) {
    return AssociateTrackerConsumerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class BatchDeleteDevicePositionHistoryResponse {
  /// Contains error details for each device history that failed to delete.
  final List<BatchDeleteDevicePositionHistoryError> errors;

  BatchDeleteDevicePositionHistoryResponse({
    required this.errors,
  });

  factory BatchDeleteDevicePositionHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDevicePositionHistoryResponse(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchDeleteDevicePositionHistoryError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// @nodoc
class BatchGetDevicePositionResponse {
  /// Contains device position details such as the device ID, position, and
  /// timestamps for when the position was received and sampled.
  final List<DevicePosition> devicePositions;

  /// Contains error details for each device that failed to send its position to
  /// the tracker resource.
  final List<BatchGetDevicePositionError> errors;

  BatchGetDevicePositionResponse({
    required this.devicePositions,
    required this.errors,
  });

  factory BatchGetDevicePositionResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetDevicePositionResponse(
      devicePositions: ((json['DevicePositions'] as List?) ?? const [])
          .nonNulls
          .map((e) => DevicePosition.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchGetDevicePositionError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final devicePositions = this.devicePositions;
    final errors = this.errors;
    return {
      'DevicePositions': devicePositions,
      'Errors': errors,
    };
  }
}

/// @nodoc
class BatchUpdateDevicePositionResponse {
  /// Contains error details for each device that failed to update its position.
  final List<BatchUpdateDevicePositionError> errors;

  BatchUpdateDevicePositionResponse({
    required this.errors,
  });

  factory BatchUpdateDevicePositionResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateDevicePositionResponse(
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchUpdateDevicePositionError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
    };
  }
}

/// @nodoc
class DisassociateTrackerConsumerResponse {
  DisassociateTrackerConsumerResponse();

  factory DisassociateTrackerConsumerResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateTrackerConsumerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetDevicePositionResponse {
  /// The last known device position.
  final List<double> position;

  /// The timestamp for when the tracker resource received the device position.
  /// Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime receivedTime;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// The device whose position you retrieved.
  final String? deviceId;

  /// The properties associated with the position.
  final Map<String, String>? positionProperties;

  GetDevicePositionResponse({
    required this.position,
    required this.receivedTime,
    required this.sampleTime,
    this.accuracy,
    this.deviceId,
    this.positionProperties,
  });

  factory GetDevicePositionResponse.fromJson(Map<String, dynamic> json) {
    return GetDevicePositionResponse(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      receivedTime: nonNullableTimeStampFromJson(json['ReceivedTime'] ?? 0),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] ?? 0),
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      deviceId: json['DeviceId'] as String?,
      positionProperties: (json['PositionProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final deviceId = this.deviceId;
    final positionProperties = this.positionProperties;
    return {
      'Position': position,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (deviceId != null) 'DeviceId': deviceId,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

/// @nodoc
class GetDevicePositionHistoryResponse {
  /// Contains the position history details for the requested device.
  final List<DevicePosition> devicePositions;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  GetDevicePositionHistoryResponse({
    required this.devicePositions,
    this.nextToken,
  });

  factory GetDevicePositionHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetDevicePositionHistoryResponse(
      devicePositions: ((json['DevicePositions'] as List?) ?? const [])
          .nonNulls
          .map((e) => DevicePosition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePositions = this.devicePositions;
    final nextToken = this.nextToken;
    return {
      'DevicePositions': devicePositions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListDevicePositionsResponse {
  /// Contains details about each device's last known position.
  final List<ListDevicePositionsResponseEntry> entries;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListDevicePositionsResponse({
    required this.entries,
    this.nextToken,
  });

  factory ListDevicePositionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicePositionsResponse(
      entries: ((json['Entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListDevicePositionsResponseEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTrackerConsumersResponse {
  /// Contains the list of geofence collection ARNs associated to the tracker
  /// resource.
  final List<String> consumerArns;

  /// A pagination token indicating there are additional pages available. You can
  /// use the token in a following request to fetch the next set of results.
  final String? nextToken;

  ListTrackerConsumersResponse({
    required this.consumerArns,
    this.nextToken,
  });

  factory ListTrackerConsumersResponse.fromJson(Map<String, dynamic> json) {
    return ListTrackerConsumersResponse(
      consumerArns: ((json['ConsumerArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerArns = this.consumerArns;
    final nextToken = this.nextToken;
    return {
      'ConsumerArns': consumerArns,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class VerifyDevicePositionResponse {
  /// The device identifier.
  final String deviceId;

  /// The distance unit for the verification response.
  final DistanceUnit distanceUnit;

  /// The inferred state of the device, given the provided position, IP address,
  /// cellular signals, and Wi-Fi- access points.
  final InferredState inferredState;

  /// The timestamp for when the tracker resource received the device position in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601
  /// </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime receivedTime;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  VerifyDevicePositionResponse({
    required this.deviceId,
    required this.distanceUnit,
    required this.inferredState,
    required this.receivedTime,
    required this.sampleTime,
  });

  factory VerifyDevicePositionResponse.fromJson(Map<String, dynamic> json) {
    return VerifyDevicePositionResponse(
      deviceId: (json['DeviceId'] as String?) ?? '',
      distanceUnit:
          DistanceUnit.fromString((json['DistanceUnit'] as String?) ?? ''),
      inferredState: InferredState.fromJson(
          (json['InferredState'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      receivedTime: nonNullableTimeStampFromJson(json['ReceivedTime'] ?? 0),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final distanceUnit = this.distanceUnit;
    final inferredState = this.inferredState;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'DistanceUnit': distanceUnit.value,
      'InferredState': inferredState,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

/// The inferred state of the device, given the provided position, IP address,
/// cellular signals, and Wi-Fi- access points.
///
/// @nodoc
class InferredState {
  /// Indicates if a proxy was used.
  final bool proxyDetected;

  /// The level of certainty of the inferred position.
  final PositionalAccuracy? accuracy;

  /// The distance between the inferred position and the device's self-reported
  /// position.
  final double? deviationDistance;

  /// The device position inferred by the provided position, IP address, cellular
  /// signals, and Wi-Fi- access points.
  final List<double>? position;

  InferredState({
    required this.proxyDetected,
    this.accuracy,
    this.deviationDistance,
    this.position,
  });

  factory InferredState.fromJson(Map<String, dynamic> json) {
    return InferredState(
      proxyDetected: (json['ProxyDetected'] as bool?) ?? false,
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      deviationDistance: json['DeviationDistance'] as double?,
      position: (json['Position'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final proxyDetected = this.proxyDetected;
    final accuracy = this.accuracy;
    final deviationDistance = this.deviationDistance;
    final position = this.position;
    return {
      'ProxyDetected': proxyDetected,
      if (accuracy != null) 'Accuracy': accuracy,
      if (deviationDistance != null) 'DeviationDistance': deviationDistance,
      if (position != null) 'Position': position,
    };
  }
}

/// @nodoc
class DistanceUnit {
  static const kilometers = DistanceUnit._('Kilometers');
  static const miles = DistanceUnit._('Miles');

  final String value;

  const DistanceUnit._(this.value);

  static const values = [kilometers, miles];

  static DistanceUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DistanceUnit._(value));

  @override
  bool operator ==(other) => other is DistanceUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the level of certainty of the position.
///
/// @nodoc
class PositionalAccuracy {
  /// Estimated maximum distance, in meters, between the measured position and the
  /// true position of a device, along the Earth's surface.
  final double horizontal;

  PositionalAccuracy({
    required this.horizontal,
  });

  factory PositionalAccuracy.fromJson(Map<String, dynamic> json) {
    return PositionalAccuracy(
      horizontal: (json['Horizontal'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final horizontal = this.horizontal;
    return {
      'Horizontal': horizontal,
    };
  }
}

/// The device's position, IP address, and Wi-Fi access points.
///
/// @nodoc
class DeviceState {
  /// The device identifier.
  final String deviceId;

  /// The last known device position.
  final List<double> position;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;
  final PositionalAccuracy? accuracy;

  /// The cellular network infrastructure that the device is connected to.
  final CellSignals? cellSignals;

  /// The device's Ipv4 address.
  final String? ipv4Address;

  /// The Wi-Fi access points the device is using.
  final List<WiFiAccessPoint>? wiFiAccessPoints;

  DeviceState({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
    this.accuracy,
    this.cellSignals,
    this.ipv4Address,
    this.wiFiAccessPoints,
  });

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final cellSignals = this.cellSignals;
    final ipv4Address = this.ipv4Address;
    final wiFiAccessPoints = this.wiFiAccessPoints;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (cellSignals != null) 'CellSignals': cellSignals,
      if (ipv4Address != null) 'Ipv4Address': ipv4Address,
      if (wiFiAccessPoints != null) 'WiFiAccessPoints': wiFiAccessPoints,
    };
  }
}

/// The cellular network communication infrastructure that the device uses.
///
/// @nodoc
class CellSignals {
  /// Information about the Long-Term Evolution (LTE) network the device is
  /// connected to.
  final List<LteCellDetails> lteCellDetails;

  CellSignals({
    required this.lteCellDetails,
  });

  Map<String, dynamic> toJson() {
    final lteCellDetails = this.lteCellDetails;
    return {
      'LteCellDetails': lteCellDetails,
    };
  }
}

/// Details about the Long-Term Evolution (LTE) network.
///
/// @nodoc
class LteCellDetails {
  /// The E-UTRAN Cell Identifier (ECI).
  final int cellId;

  /// The Mobile Country Code (MCC).
  final int mcc;

  /// The Mobile Network Code (MNC)
  final int mnc;

  /// The LTE local identification information (local ID).
  final LteLocalId? localId;

  /// The network measurements.
  final List<LteNetworkMeasurements>? networkMeasurements;

  /// Indicates whether the LTE object is capable of supporting NR (new radio).
  final bool? nrCapable;

  /// Signal power of the reference signal received, measured in
  /// decibel-milliwatts (dBm).
  final int? rsrp;

  /// Signal quality of the reference Signal received, measured in decibels (dB).
  final double? rsrq;

  /// LTE Tracking Area Code (TAC).
  final int? tac;

  /// Timing Advance (TA).
  final int? timingAdvance;

  LteCellDetails({
    required this.cellId,
    required this.mcc,
    required this.mnc,
    this.localId,
    this.networkMeasurements,
    this.nrCapable,
    this.rsrp,
    this.rsrq,
    this.tac,
    this.timingAdvance,
  });

  Map<String, dynamic> toJson() {
    final cellId = this.cellId;
    final mcc = this.mcc;
    final mnc = this.mnc;
    final localId = this.localId;
    final networkMeasurements = this.networkMeasurements;
    final nrCapable = this.nrCapable;
    final rsrp = this.rsrp;
    final rsrq = this.rsrq;
    final tac = this.tac;
    final timingAdvance = this.timingAdvance;
    return {
      'CellId': cellId,
      'Mcc': mcc,
      'Mnc': mnc,
      if (localId != null) 'LocalId': localId,
      if (networkMeasurements != null)
        'NetworkMeasurements': networkMeasurements,
      if (nrCapable != null) 'NrCapable': nrCapable,
      if (rsrp != null) 'Rsrp': rsrp,
      if (rsrq != null) 'Rsrq': rsrq,
      if (tac != null) 'Tac': tac,
      if (timingAdvance != null) 'TimingAdvance': timingAdvance,
    };
  }
}

/// LTE local identification information (local ID).
///
/// @nodoc
class LteLocalId {
  /// E-UTRA (Evolved Universal Terrestrial Radio Access) absolute radio frequency
  /// channel number (EARFCN).
  final int earfcn;

  /// Physical Cell ID (PCI).
  final int pci;

  LteLocalId({
    required this.earfcn,
    required this.pci,
  });

  Map<String, dynamic> toJson() {
    final earfcn = this.earfcn;
    final pci = this.pci;
    return {
      'Earfcn': earfcn,
      'Pci': pci,
    };
  }
}

/// LTE network measurements.
///
/// @nodoc
class LteNetworkMeasurements {
  /// E-UTRAN Cell Identifier (ECI).
  final int cellId;

  /// E-UTRA (Evolved Universal Terrestrial Radio Access) absolute radio frequency
  /// channel number (EARFCN).
  final int earfcn;

  /// Physical Cell ID (PCI).
  final int pci;

  /// Signal power of the reference signal received, measured in dBm
  /// (decibel-milliwatts).
  final int? rsrp;

  /// Signal quality of the reference Signal received, measured in decibels (dB).
  final double? rsrq;

  LteNetworkMeasurements({
    required this.cellId,
    required this.earfcn,
    required this.pci,
    this.rsrp,
    this.rsrq,
  });

  Map<String, dynamic> toJson() {
    final cellId = this.cellId;
    final earfcn = this.earfcn;
    final pci = this.pci;
    final rsrp = this.rsrp;
    final rsrq = this.rsrq;
    return {
      'CellId': cellId,
      'Earfcn': earfcn,
      'Pci': pci,
      if (rsrp != null) 'Rsrp': rsrp,
      if (rsrq != null) 'Rsrq': rsrq,
    };
  }
}

/// Wi-Fi access point.
///
/// @nodoc
class WiFiAccessPoint {
  /// Medium access control address (Mac).
  final String macAddress;

  /// Received signal strength (dBm) of the WLAN measurement data.
  final int rss;

  WiFiAccessPoint({
    required this.macAddress,
    required this.rss,
  });

  Map<String, dynamic> toJson() {
    final macAddress = this.macAddress;
    final rss = this.rss;
    return {
      'MacAddress': macAddress,
      'Rss': rss,
    };
  }
}

/// Contains the tracker resource details.
///
/// @nodoc
class ListDevicePositionsResponseEntry {
  /// The ID of the device for this position.
  final String deviceId;

  /// The last known device position. Empty if no positions currently stored.
  final List<double> position;

  /// The timestamp at which the device position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// The properties associated with the position.
  final Map<String, String>? positionProperties;

  ListDevicePositionsResponseEntry({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
    this.accuracy,
    this.positionProperties,
  });

  factory ListDevicePositionsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListDevicePositionsResponseEntry(
      deviceId: (json['DeviceId'] as String?) ?? '',
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] ?? 0),
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      positionProperties: (json['PositionProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final positionProperties = this.positionProperties;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

/// The geomerty used to filter device positions.
///
/// @nodoc
class TrackingFilterGeometry {
  /// The set of arrays which define the polygon. A polygon can have between 4 and
  /// 1000 vertices.
  final List<List<List<double>>>? polygon;

  TrackingFilterGeometry({
    this.polygon,
  });

  Map<String, dynamic> toJson() {
    final polygon = this.polygon;
    return {
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

/// Contains the device position details.
///
/// @nodoc
class DevicePosition {
  /// The last known device position.
  final List<double> position;

  /// The timestamp for when the tracker resource received the device position in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime receivedTime;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// The device whose position you retrieved.
  final String? deviceId;

  /// The properties associated with the position.
  final Map<String, String>? positionProperties;

  DevicePosition({
    required this.position,
    required this.receivedTime,
    required this.sampleTime,
    this.accuracy,
    this.deviceId,
    this.positionProperties,
  });

  factory DevicePosition.fromJson(Map<String, dynamic> json) {
    return DevicePosition(
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      receivedTime: nonNullableTimeStampFromJson(json['ReceivedTime'] ?? 0),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] ?? 0),
      accuracy: json['Accuracy'] != null
          ? PositionalAccuracy.fromJson(
              json['Accuracy'] as Map<String, dynamic>)
          : null,
      deviceId: json['DeviceId'] as String?,
      positionProperties: (json['PositionProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final position = this.position;
    final receivedTime = this.receivedTime;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final deviceId = this.deviceId;
    final positionProperties = this.positionProperties;
    return {
      'Position': position,
      'ReceivedTime': iso8601ToJson(receivedTime),
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (deviceId != null) 'DeviceId': deviceId,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

/// Contains error details for each device that failed to update its position.
///
/// @nodoc
class BatchUpdateDevicePositionError {
  /// The device associated with the failed location update.
  final String deviceId;

  /// Contains details related to the error code such as the error code and error
  /// message.
  final BatchItemError error;

  /// The timestamp at which the device position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime sampleTime;

  BatchUpdateDevicePositionError({
    required this.deviceId,
    required this.error,
    required this.sampleTime,
  });

  factory BatchUpdateDevicePositionError.fromJson(Map<String, dynamic> json) {
    return BatchUpdateDevicePositionError(
      deviceId: (json['DeviceId'] as String?) ?? '',
      error: BatchItemError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'Error': error,
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

/// Contains the batch request error details associated with the request.
///
/// @nodoc
class BatchItemError {
  /// The error code associated with the batch request error.
  final BatchItemErrorCode? code;

  /// A message with the reason for the batch request error.
  final String? message;

  BatchItemError({
    this.code,
    this.message,
  });

  factory BatchItemError.fromJson(Map<String, dynamic> json) {
    return BatchItemError(
      code: (json['Code'] as String?)?.let(BatchItemErrorCode.fromString),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class BatchItemErrorCode {
  static const accessDeniedError = BatchItemErrorCode._('AccessDeniedError');
  static const conflictError = BatchItemErrorCode._('ConflictError');
  static const internalServerError =
      BatchItemErrorCode._('InternalServerError');
  static const resourceNotFoundError =
      BatchItemErrorCode._('ResourceNotFoundError');
  static const throttlingError = BatchItemErrorCode._('ThrottlingError');
  static const validationError = BatchItemErrorCode._('ValidationError');

  final String value;

  const BatchItemErrorCode._(this.value);

  static const values = [
    accessDeniedError,
    conflictError,
    internalServerError,
    resourceNotFoundError,
    throttlingError,
    validationError
  ];

  static BatchItemErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchItemErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchItemErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the position update details for a device.
///
/// @nodoc
class DevicePositionUpdate {
  /// The device associated to the position update.
  final String deviceId;

  /// The latest device position defined in <a
  /// href="https://earth-info.nga.mil/index.php?dir=wgs84&amp;action=wgs84">WGS
  /// 84</a> format: <code>\[X or longitude, Y or latitude\]</code>.
  final List<double> position;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime sampleTime;

  /// The accuracy of the device position.
  final PositionalAccuracy? accuracy;

  /// Associates one of more properties with the position update. A property is a
  /// key-value pair stored with the position update and added to any geofence
  /// event the update may trigger.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? positionProperties;

  DevicePositionUpdate({
    required this.deviceId,
    required this.position,
    required this.sampleTime,
    this.accuracy,
    this.positionProperties,
  });

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final position = this.position;
    final sampleTime = this.sampleTime;
    final accuracy = this.accuracy;
    final positionProperties = this.positionProperties;
    return {
      'DeviceId': deviceId,
      'Position': position,
      'SampleTime': iso8601ToJson(sampleTime),
      if (accuracy != null) 'Accuracy': accuracy,
      if (positionProperties != null) 'PositionProperties': positionProperties,
    };
  }
}

/// Contains error details for each device that didn't return a position.
///
/// @nodoc
class BatchGetDevicePositionError {
  /// The ID of the device that didn't return a position.
  final String deviceId;

  /// Contains details related to the error code.
  final BatchItemError error;

  BatchGetDevicePositionError({
    required this.deviceId,
    required this.error,
  });

  factory BatchGetDevicePositionError.fromJson(Map<String, dynamic> json) {
    return BatchGetDevicePositionError(
      deviceId: (json['DeviceId'] as String?) ?? '',
      error: BatchItemError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    return {
      'DeviceId': deviceId,
      'Error': error,
    };
  }
}

/// Contains the tracker resource details.
///
/// @nodoc
class BatchDeleteDevicePositionHistoryError {
  /// The ID of the device for this position.
  final String deviceId;
  final BatchItemError error;

  BatchDeleteDevicePositionHistoryError({
    required this.deviceId,
    required this.error,
  });

  factory BatchDeleteDevicePositionHistoryError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDevicePositionHistoryError(
      deviceId: (json['DeviceId'] as String?) ?? '',
      error: BatchItemError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    return {
      'DeviceId': deviceId,
      'Error': error,
    };
  }
}

/// Contains the tracker resource details.
///
/// @nodoc
class ListTrackersResponseEntry {
  /// The timestamp for when the tracker resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The description for the tracker resource.
  final String description;

  /// The name of the tracker resource.
  final String trackerName;

  /// The timestamp at which the device's position was determined. Uses <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  ListTrackersResponseEntry({
    required this.createTime,
    required this.description,
    required this.trackerName,
    required this.updateTime,
    this.pricingPlan,
    this.pricingPlanDataSource,
  });

  factory ListTrackersResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListTrackersResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      trackerName: (json['TrackerName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final description = this.description;
    final trackerName = this.trackerName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'TrackerName': trackerName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
  }
}

/// @nodoc
class PricingPlan {
  static const requestBasedUsage = PricingPlan._('RequestBasedUsage');
  static const mobileAssetTracking = PricingPlan._('MobileAssetTracking');
  static const mobileAssetManagement = PricingPlan._('MobileAssetManagement');

  final String value;

  const PricingPlan._(this.value);

  static const values = [
    requestBasedUsage,
    mobileAssetTracking,
    mobileAssetManagement
  ];

  static PricingPlan fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PricingPlan._(value));

  @override
  bool operator ==(other) => other is PricingPlan && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PositionFiltering {
  static const timeBased = PositionFiltering._('TimeBased');
  static const distanceBased = PositionFiltering._('DistanceBased');
  static const accuracyBased = PositionFiltering._('AccuracyBased');

  final String value;

  const PositionFiltering._(this.value);

  static const values = [timeBased, distanceBased, accuracyBased];

  static PositionFiltering fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PositionFiltering._(value));

  @override
  bool operator ==(other) => other is PositionFiltering && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of the calculated route matrix.
///
/// @nodoc
class CalculateRouteMatrixSummary {
  /// The data provider of traffic and road network data used to calculate the
  /// routes. Indicates one of the available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The unit of measurement for route distances.
  final DistanceUnit distanceUnit;

  /// The count of error results in the route matrix. If this number is 0, all
  /// routes were calculated successfully.
  final int errorCount;

  /// The count of cells in the route matrix. Equal to the number of
  /// <code>DeparturePositions</code> multiplied by the number of
  /// <code>DestinationPositions</code>.
  final int routeCount;

  CalculateRouteMatrixSummary({
    required this.dataSource,
    required this.distanceUnit,
    required this.errorCount,
    required this.routeCount,
  });

  factory CalculateRouteMatrixSummary.fromJson(Map<String, dynamic> json) {
    return CalculateRouteMatrixSummary(
      dataSource: (json['DataSource'] as String?) ?? '',
      distanceUnit:
          DistanceUnit.fromString((json['DistanceUnit'] as String?) ?? ''),
      errorCount: (json['ErrorCount'] as int?) ?? 0,
      routeCount: (json['RouteCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final distanceUnit = this.distanceUnit;
    final errorCount = this.errorCount;
    final routeCount = this.routeCount;
    return {
      'DataSource': dataSource,
      'DistanceUnit': distanceUnit.value,
      'ErrorCount': errorCount,
      'RouteCount': routeCount,
    };
  }
}

/// The result for the calculated route of one <code>DeparturePosition</code>
/// <code>DestinationPosition</code> pair.
///
/// @nodoc
class RouteMatrixEntry {
  /// The total distance of travel for the route.
  final double? distance;

  /// The expected duration of travel for the route.
  final double? durationSeconds;

  /// An error corresponding to the calculation of a route between the
  /// <code>DeparturePosition</code> and <code>DestinationPosition</code>.
  final RouteMatrixEntryError? error;

  RouteMatrixEntry({
    this.distance,
    this.durationSeconds,
    this.error,
  });

  factory RouteMatrixEntry.fromJson(Map<String, dynamic> json) {
    return RouteMatrixEntry(
      distance: json['Distance'] as double?,
      durationSeconds: json['DurationSeconds'] as double?,
      error: json['Error'] != null
          ? RouteMatrixEntryError.fromJson(
              json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final durationSeconds = this.durationSeconds;
    final error = this.error;
    return {
      if (distance != null) 'Distance': distance,
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
      if (error != null) 'Error': error,
    };
  }
}

/// An error corresponding to the calculation of a route between the
/// <code>DeparturePosition</code> and <code>DestinationPosition</code>.
///
/// The error code can be one of the following:
///
/// <ul>
/// <li>
/// <code>RouteNotFound</code> - Unable to find a valid route with the given
/// parameters.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>RouteTooLong</code> - Route calculation went beyond the maximum size
/// of a route and was terminated before completion.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>PositionsNotFound</code> - One or more of the input positions were not
/// found on the route network.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>DestinationPositionNotFound</code> - The destination position was not
/// found on the route network.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>DeparturePositionNotFound</code> - The departure position was not
/// found on the route network.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>OtherValidationError</code> - The given inputs were not valid or a
/// route was not found. More information is given in the error
/// <code>Message</code>
/// </li>
/// </ul>
///
/// @nodoc
class RouteMatrixEntryError {
  /// The type of error which occurred for the route calculation.
  final RouteMatrixErrorCode code;

  /// A message about the error that occurred for the route calculation.
  final String? message;

  RouteMatrixEntryError({
    required this.code,
    this.message,
  });

  factory RouteMatrixEntryError.fromJson(Map<String, dynamic> json) {
    return RouteMatrixEntryError(
      code: RouteMatrixErrorCode.fromString((json['Code'] as String?) ?? ''),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'Code': code.value,
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class RouteMatrixErrorCode {
  static const routeNotFound = RouteMatrixErrorCode._('RouteNotFound');
  static const routeTooLong = RouteMatrixErrorCode._('RouteTooLong');
  static const positionsNotFound = RouteMatrixErrorCode._('PositionsNotFound');
  static const destinationPositionNotFound =
      RouteMatrixErrorCode._('DestinationPositionNotFound');
  static const departurePositionNotFound =
      RouteMatrixErrorCode._('DeparturePositionNotFound');
  static const otherValidationError =
      RouteMatrixErrorCode._('OtherValidationError');

  final String value;

  const RouteMatrixErrorCode._(this.value);

  static const values = [
    routeNotFound,
    routeTooLong,
    positionsNotFound,
    destinationPositionNotFound,
    departurePositionNotFound,
    otherValidationError
  ];

  static RouteMatrixErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouteMatrixErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is RouteMatrixErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TravelMode {
  static const car = TravelMode._('Car');
  static const truck = TravelMode._('Truck');
  static const walking = TravelMode._('Walking');
  static const bicycle = TravelMode._('Bicycle');
  static const motorcycle = TravelMode._('Motorcycle');

  final String value;

  const TravelMode._(this.value);

  static const values = [car, truck, walking, bicycle, motorcycle];

  static TravelMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TravelMode._(value));

  @override
  bool operator ==(other) => other is TravelMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about additional route preferences for requests that
/// specify <code>TravelMode</code> as <code>Car</code>.
///
/// @nodoc
class CalculateRouteCarModeOptions {
  /// Avoids ferries when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidFerries;

  /// Avoids tolls when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidTolls;

  CalculateRouteCarModeOptions({
    this.avoidFerries,
    this.avoidTolls,
  });

  Map<String, dynamic> toJson() {
    final avoidFerries = this.avoidFerries;
    final avoidTolls = this.avoidTolls;
    return {
      if (avoidFerries != null) 'AvoidFerries': avoidFerries,
      if (avoidTolls != null) 'AvoidTolls': avoidTolls,
    };
  }
}

/// Contains details about additional route preferences for requests that
/// specify <code>TravelMode</code> as <code>Truck</code>.
///
/// @nodoc
class CalculateRouteTruckModeOptions {
  /// Avoids ferries when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidFerries;

  /// Avoids tolls when calculating routes.
  ///
  /// Default Value: <code>false</code>
  ///
  /// Valid Values: <code>false</code> | <code>true</code>
  final bool? avoidTolls;

  /// Specifies the truck's dimension specifications including length, height,
  /// width, and unit of measurement. Used to avoid roads that can't support the
  /// truck's dimensions.
  final TruckDimensions? dimensions;

  /// Specifies the truck's weight specifications including total weight and unit
  /// of measurement. Used to avoid roads that can't support the truck's weight.
  final TruckWeight? weight;

  CalculateRouteTruckModeOptions({
    this.avoidFerries,
    this.avoidTolls,
    this.dimensions,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    final avoidFerries = this.avoidFerries;
    final avoidTolls = this.avoidTolls;
    final dimensions = this.dimensions;
    final weight = this.weight;
    return {
      if (avoidFerries != null) 'AvoidFerries': avoidFerries,
      if (avoidTolls != null) 'AvoidTolls': avoidTolls,
      if (dimensions != null) 'Dimensions': dimensions,
      if (weight != null) 'Weight': weight,
    };
  }
}

/// Contains details about the truck dimensions in the unit of measurement that
/// you specify. Used to filter out roads that can't support or allow the
/// specified dimensions for requests that specify <code>TravelMode</code> as
/// <code>Truck</code>.
///
/// @nodoc
class TruckDimensions {
  /// The height of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>4.5</code>.
  /// </li>
  /// </ul> <note>
  /// For routes calculated with a HERE resource, this value must be between 0 and
  /// 50 meters.
  /// </note>
  final double? height;

  /// The length of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>15.5</code>.
  /// </li>
  /// </ul> <note>
  /// For routes calculated with a HERE resource, this value must be between 0 and
  /// 300 meters.
  /// </note>
  final double? length;

  /// Specifies the unit of measurement for the truck dimensions.
  ///
  /// Default Value: <code>Meters</code>
  final DimensionUnit? unit;

  /// The width of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>4.5</code>.
  /// </li>
  /// </ul> <note>
  /// For routes calculated with a HERE resource, this value must be between 0 and
  /// 50 meters.
  /// </note>
  final double? width;

  TruckDimensions({
    this.height,
    this.length,
    this.unit,
    this.width,
  });

  Map<String, dynamic> toJson() {
    final height = this.height;
    final length = this.length;
    final unit = this.unit;
    final width = this.width;
    return {
      if (height != null) 'Height': height,
      if (length != null) 'Length': length,
      if (unit != null) 'Unit': unit.value,
      if (width != null) 'Width': width,
    };
  }
}

/// Contains details about the truck's weight specifications. Used to avoid
/// roads that can't support or allow the total weight for requests that specify
/// <code>TravelMode</code> as <code>Truck</code>.
///
/// @nodoc
class TruckWeight {
  /// The total weight of the truck.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>3500</code>.
  /// </li>
  /// </ul>
  final double? total;

  /// The unit of measurement to use for the truck weight.
  ///
  /// Default Value: <code>Kilograms</code>
  final VehicleWeightUnit? unit;

  TruckWeight({
    this.total,
    this.unit,
  });

  Map<String, dynamic> toJson() {
    final total = this.total;
    final unit = this.unit;
    return {
      if (total != null) 'Total': total,
      if (unit != null) 'Unit': unit.value,
    };
  }
}

/// @nodoc
class VehicleWeightUnit {
  static const kilograms = VehicleWeightUnit._('Kilograms');
  static const pounds = VehicleWeightUnit._('Pounds');

  final String value;

  const VehicleWeightUnit._(this.value);

  static const values = [kilograms, pounds];

  static VehicleWeightUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VehicleWeightUnit._(value));

  @override
  bool operator ==(other) => other is VehicleWeightUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DimensionUnit {
  static const meters = DimensionUnit._('Meters');
  static const feet = DimensionUnit._('Feet');

  final String value;

  const DimensionUnit._(this.value);

  static const values = [meters, feet];

  static DimensionUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DimensionUnit._(value));

  @override
  bool operator ==(other) => other is DimensionUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of the calculated route.
///
/// @nodoc
class CalculateRouteSummary {
  /// The data provider of traffic and road network data used to calculate the
  /// route. Indicates one of the available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The total distance covered by the route. The sum of the distance travelled
  /// between every stop on the route.
  /// <note>
  /// If Esri is the data source for the route calculator, the route distance
  /// can’t be greater than 400 km. If the route exceeds 400 km, the response is a
  /// <code>400 RoutesValidationException</code> error.
  /// </note>
  final double distance;

  /// The unit of measurement for route distances.
  final DistanceUnit distanceUnit;

  /// The total travel time for the route measured in seconds. The sum of the
  /// travel time between every stop on the route.
  final double durationSeconds;

  /// Specifies a geographical box surrounding a route. Used to zoom into a route
  /// when displaying it in a map. For example, <code>\[min x, min y, max x, max
  /// y\]</code>.
  ///
  /// The first 2 <code>bbox</code> parameters describe the lower southwest
  /// corner:
  ///
  /// <ul>
  /// <li>
  /// The first <code>bbox</code> position is the X coordinate or longitude of the
  /// lower southwest corner.
  /// </li>
  /// <li>
  /// The second <code>bbox</code> position is the Y coordinate or latitude of the
  /// lower southwest corner.
  /// </li>
  /// </ul>
  /// The next 2 <code>bbox</code> parameters describe the upper northeast corner:
  ///
  /// <ul>
  /// <li>
  /// The third <code>bbox</code> position is the X coordinate, or longitude of
  /// the upper northeast corner.
  /// </li>
  /// <li>
  /// The fourth <code>bbox</code> position is the Y coordinate, or latitude of
  /// the upper northeast corner.
  /// </li>
  /// </ul>
  final List<double> routeBBox;

  CalculateRouteSummary({
    required this.dataSource,
    required this.distance,
    required this.distanceUnit,
    required this.durationSeconds,
    required this.routeBBox,
  });

  factory CalculateRouteSummary.fromJson(Map<String, dynamic> json) {
    return CalculateRouteSummary(
      dataSource: (json['DataSource'] as String?) ?? '',
      distance: (json['Distance'] as double?) ?? 0,
      distanceUnit:
          DistanceUnit.fromString((json['DistanceUnit'] as String?) ?? ''),
      durationSeconds: (json['DurationSeconds'] as double?) ?? 0,
      routeBBox: ((json['RouteBBox'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final distance = this.distance;
    final distanceUnit = this.distanceUnit;
    final durationSeconds = this.durationSeconds;
    final routeBBox = this.routeBBox;
    return {
      'DataSource': dataSource,
      'Distance': distance,
      'DistanceUnit': distanceUnit.value,
      'DurationSeconds': durationSeconds,
      'RouteBBox': routeBBox,
    };
  }
}

/// Contains the calculated route's details for each path between a pair of
/// positions. The number of legs returned corresponds to one fewer than the
/// total number of positions in the request.
///
/// For example, a route with a departure position and destination position
/// returns one leg with the positions <a
/// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">snapped
/// to a nearby road</a>:
///
/// <ul>
/// <li>
/// The <code>StartPosition</code> is the departure position.
/// </li>
/// <li>
/// The <code>EndPosition</code> is the destination position.
/// </li>
/// </ul>
/// A route with a waypoint between the departure and destination position
/// returns two legs with the positions snapped to a nearby road:
///
/// <ul>
/// <li>
/// Leg 1: The <code>StartPosition</code> is the departure position . The
/// <code>EndPosition</code> is the waypoint positon.
/// </li>
/// <li>
/// Leg 2: The <code>StartPosition</code> is the waypoint position. The
/// <code>EndPosition</code> is the destination position.
/// </li>
/// </ul>
///
/// @nodoc
class Leg {
  /// The distance between the leg's <code>StartPosition</code> and
  /// <code>EndPosition</code> along a calculated route.
  ///
  /// <ul>
  /// <li>
  /// The default measurement is <code>Kilometers</code> unless the request
  /// specifies a <code>DistanceUnit</code> of <code>Miles</code>.
  /// </li>
  /// </ul>
  final double distance;

  /// The estimated travel time between the leg's <code>StartPosition</code> and
  /// <code>EndPosition</code>. The travel mode and departure time that you
  /// specify in the request determines the calculated time.
  final double durationSeconds;

  /// The terminating position of the leg. Follows the format
  /// <code>\[longitude,latitude\]</code>.
  /// <note>
  /// If the <code>EndPosition</code> isn't located on a road, it's <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/nap-to-nearby-road.html">snapped
  /// to a nearby road</a>.
  /// </note>
  final List<double> endPosition;

  /// The starting position of the leg. Follows the format
  /// <code>\[longitude,latitude\]</code>.
  /// <note>
  /// If the <code>StartPosition</code> isn't located on a road, it's <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/snap-to-nearby-road.html">snapped
  /// to a nearby road</a>.
  /// </note>
  final List<double> startPosition;

  /// Contains a list of steps, which represent subsections of a leg. Each step
  /// provides instructions for how to move to the next step in the leg such as
  /// the step's start position, end position, travel distance, travel duration,
  /// and geometry offset.
  final List<Step> steps;

  /// Contains the calculated route's path as a linestring geometry.
  final LegGeometry? geometry;

  Leg({
    required this.distance,
    required this.durationSeconds,
    required this.endPosition,
    required this.startPosition,
    required this.steps,
    this.geometry,
  });

  factory Leg.fromJson(Map<String, dynamic> json) {
    return Leg(
      distance: (json['Distance'] as double?) ?? 0,
      durationSeconds: (json['DurationSeconds'] as double?) ?? 0,
      endPosition: ((json['EndPosition'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      startPosition: ((json['StartPosition'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      steps: ((json['Steps'] as List?) ?? const [])
          .nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometry: json['Geometry'] != null
          ? LegGeometry.fromJson(json['Geometry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final durationSeconds = this.durationSeconds;
    final endPosition = this.endPosition;
    final startPosition = this.startPosition;
    final steps = this.steps;
    final geometry = this.geometry;
    return {
      'Distance': distance,
      'DurationSeconds': durationSeconds,
      'EndPosition': endPosition,
      'StartPosition': startPosition,
      'Steps': steps,
      if (geometry != null) 'Geometry': geometry,
    };
  }
}

/// Contains the geometry details for each path between a pair of positions.
/// Used in plotting a route leg on a map.
///
/// @nodoc
class LegGeometry {
  /// An ordered list of positions used to plot a route on a map.
  ///
  /// The first position is closest to the start position for the leg, and the
  /// last position is the closest to the end position for the leg.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>\[\[-123.117, 49.284\],\[-123.115, 49.285\],\[-123.115,
  /// 49.285\]\]</code>
  /// </li>
  /// </ul>
  final List<List<double>>? lineString;

  LegGeometry({
    this.lineString,
  });

  factory LegGeometry.fromJson(Map<String, dynamic> json) {
    return LegGeometry(
      lineString: (json['LineString'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lineString = this.lineString;
    return {
      if (lineString != null) 'LineString': lineString,
    };
  }
}

/// Represents an element of a leg within a route. A step contains instructions
/// for how to move to the next step in the leg.
///
/// @nodoc
class Step {
  /// The travel distance between the step's <code>StartPosition</code> and
  /// <code>EndPosition</code>.
  final double distance;

  /// The estimated travel time, in seconds, from the step's
  /// <code>StartPosition</code> to the <code>EndPosition</code>. . The travel
  /// mode and departure time that you specify in the request determines the
  /// calculated time.
  final double durationSeconds;

  /// The end position of a step. If the position the last step in the leg, this
  /// position is the same as the end position of the leg.
  final List<double> endPosition;

  /// The starting position of a step. If the position is the first step in the
  /// leg, this position is the same as the start position of the leg.
  final List<double> startPosition;

  /// Represents the start position, or index, in a sequence of steps within the
  /// leg's line string geometry. For example, the index of the first step in a
  /// leg geometry is <code>0</code>.
  ///
  /// Included in the response for queries that set
  /// <code>IncludeLegGeometry</code> to <code>True</code>.
  final int? geometryOffset;

  Step({
    required this.distance,
    required this.durationSeconds,
    required this.endPosition,
    required this.startPosition,
    this.geometryOffset,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      distance: (json['Distance'] as double?) ?? 0,
      durationSeconds: (json['DurationSeconds'] as double?) ?? 0,
      endPosition: ((json['EndPosition'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      startPosition: ((json['StartPosition'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      geometryOffset: json['GeometryOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final durationSeconds = this.durationSeconds;
    final endPosition = this.endPosition;
    final startPosition = this.startPosition;
    final geometryOffset = this.geometryOffset;
    return {
      'Distance': distance,
      'DurationSeconds': durationSeconds,
      'EndPosition': endPosition,
      'StartPosition': startPosition,
      if (geometryOffset != null) 'GeometryOffset': geometryOffset,
    };
  }
}

/// @nodoc
class OptimizationMode {
  static const fastestRoute = OptimizationMode._('FastestRoute');
  static const shortestRoute = OptimizationMode._('ShortestRoute');

  final String value;

  const OptimizationMode._(this.value);

  static const values = [fastestRoute, shortestRoute];

  static OptimizationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OptimizationMode._(value));

  @override
  bool operator ==(other) => other is OptimizationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A route calculator resource listed in your Amazon Web Services account.
///
/// @nodoc
class ListRouteCalculatorsResponseEntry {
  /// The name of the route calculator resource.
  final String calculatorName;

  /// The timestamp when the route calculator resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime createTime;

  /// The data provider of traffic and road network data. Indicates one of the
  /// available providers:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The optional description of the route calculator resource.
  final String description;

  /// The timestamp when the route calculator resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  ///
  /// <ul>
  /// <li>
  /// For example, <code>2020–07-2T12:15:20.000Z+01:00</code>
  /// </li>
  /// </ul>
  final DateTime updateTime;

  /// Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  ListRouteCalculatorsResponseEntry({
    required this.calculatorName,
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.updateTime,
    this.pricingPlan,
  });

  factory ListRouteCalculatorsResponseEntry.fromJson(
      Map<String, dynamic> json) {
    return ListRouteCalculatorsResponseEntry(
      calculatorName: (json['CalculatorName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      dataSource: (json['DataSource'] as String?) ?? '',
      description: (json['Description'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatorName = this.calculatorName;
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    return {
      'CalculatorName': calculatorName,
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
    };
  }
}

/// A summary of the request sent by using <code>SearchPlaceIndexForText</code>.
///
/// @nodoc
class SearchPlaceIndexForTextSummary {
  /// The geospatial data provider attached to the place index resource specified
  /// in the request. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// Grab
  /// </li>
  /// <li>
  /// Here
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The search text specified in the request.
  final String text;

  /// Contains the coordinates for the optional bias position specified in the
  /// request.
  ///
  /// This parameter contains a pair of numbers. The first number represents the X
  /// coordinate, or longitude; the second number represents the Y coordinate, or
  /// latitude.
  ///
  /// For example, <code>\[-123.1174, 49.2847\]</code> represents the position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  final List<double>? biasPosition;

  /// Contains the coordinates for the optional bounding box specified in the
  /// request.
  final List<double>? filterBBox;

  /// The optional category filter specified in the request.
  final List<String>? filterCategories;

  /// Contains the optional country filter specified in the request.
  final List<String>? filterCountries;

  /// The preferred language used to return results. Matches the language in the
  /// request. The value is a valid <a
  /// href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  final String? language;

  /// Contains the optional result count limit specified in the request.
  final int? maxResults;

  /// The bounding box that fully contains all search results.
  /// <note>
  /// If you specified the optional <code>FilterBBox</code> parameter in the
  /// request, <code>ResultBBox</code> is contained within
  /// <code>FilterBBox</code>.
  /// </note>
  final List<double>? resultBBox;

  SearchPlaceIndexForTextSummary({
    required this.dataSource,
    required this.text,
    this.biasPosition,
    this.filterBBox,
    this.filterCategories,
    this.filterCountries,
    this.language,
    this.maxResults,
    this.resultBBox,
  });

  factory SearchPlaceIndexForTextSummary.fromJson(Map<String, dynamic> json) {
    return SearchPlaceIndexForTextSummary(
      dataSource: (json['DataSource'] as String?) ?? '',
      text: (json['Text'] as String?) ?? '',
      biasPosition: (json['BiasPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      filterBBox: (json['FilterBBox'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      filterCategories: (json['FilterCategories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      filterCountries: (json['FilterCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      language: json['Language'] as String?,
      maxResults: json['MaxResults'] as int?,
      resultBBox: (json['ResultBBox'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final text = this.text;
    final biasPosition = this.biasPosition;
    final filterBBox = this.filterBBox;
    final filterCategories = this.filterCategories;
    final filterCountries = this.filterCountries;
    final language = this.language;
    final maxResults = this.maxResults;
    final resultBBox = this.resultBBox;
    return {
      'DataSource': dataSource,
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
      if (resultBBox != null) 'ResultBBox': resultBBox,
    };
  }
}

/// Contains a search result from a text search query that is run on a place
/// index resource.
///
/// @nodoc
class SearchForTextResult {
  /// Details about the search result, such as its address and position.
  final Place place;

  /// The distance in meters of a great-circle arc between the bias position
  /// specified and the result. <code>Distance</code> will be returned only if a
  /// bias position was specified in the query.
  /// <note>
  /// A great-circle arc is the shortest path on a sphere, in this case the Earth.
  /// This returns the shortest distance between two locations.
  /// </note>
  final double? distance;

  /// The unique identifier of the place. You can use this with the
  /// <code>GetPlace</code> operation to find the place again later.
  /// <note>
  /// For <code>SearchPlaceIndexForText</code> operations, the
  /// <code>PlaceId</code> is returned only by place indexes that use HERE or Grab
  /// as a data provider.
  /// </note>
  final String? placeId;

  /// The relative confidence in the match for a result among the results
  /// returned. For example, if more fields for an address match (including house
  /// number, street, city, country/region, and postal code), the relevance score
  /// is closer to 1.
  ///
  /// Returned only when the partner selected is Esri or Grab.
  final double? relevance;

  SearchForTextResult({
    required this.place,
    this.distance,
    this.placeId,
    this.relevance,
  });

  factory SearchForTextResult.fromJson(Map<String, dynamic> json) {
    return SearchForTextResult(
      place: Place.fromJson((json['Place'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      distance: json['Distance'] as double?,
      placeId: json['PlaceId'] as String?,
      relevance: json['Relevance'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final place = this.place;
    final distance = this.distance;
    final placeId = this.placeId;
    final relevance = this.relevance;
    return {
      'Place': place,
      if (distance != null) 'Distance': distance,
      if (placeId != null) 'PlaceId': placeId,
      if (relevance != null) 'Relevance': relevance,
    };
  }
}

/// Contains details about addresses or points of interest that match the search
/// criteria.
///
/// Not all details are included with all responses. Some details may only be
/// returned by specific data partners.
///
/// @nodoc
class Place {
  final PlaceGeometry geometry;

  /// The numerical portion of an address, such as a building number.
  final String? addressNumber;

  /// The Amazon Location categories that describe this Place.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service developer guide</i>.
  final List<String>? categories;

  /// A country/region specified using <a
  /// href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit
  /// country/region code. For example, <code>CAN</code>.
  final String? country;

  /// <code>True</code> if the result is interpolated from other known places.
  ///
  /// <code>False</code> if the Place is a known place.
  ///
  /// Not returned when the partner does not provide the information.
  ///
  /// For example, returns <code>False</code> for an address location that is
  /// found in the partner data, but returns <code>True</code> if an address does
  /// not exist in the partner data and its location is calculated by
  /// interpolating between other known addresses.
  final bool? interpolated;

  /// The full name and address of the point of interest such as a city, region,
  /// or country. For example, <code>123 Any Street, Any Town, USA</code>.
  final String? label;

  /// A name for a local area, such as a city or town name. For example,
  /// <code>Toronto</code>.
  final String? municipality;

  /// The name of a community district. For example, <code>Downtown</code>.
  final String? neighborhood;

  /// A group of numbers and letters in a country-specific format, which
  /// accompanies the address for the purpose of identifying a location.
  final String? postalCode;

  /// A name for an area or geographical division, such as a province or state
  /// name. For example, <code>British Columbia</code>.
  final String? region;

  /// The name for a street or a road to identify a location. For example,
  /// <code>Main Street</code>.
  final String? street;

  /// An area that's part of a larger municipality. For example, <code>Blissville
  /// </code> is a submunicipality in the Queen County in New York.
  /// <note>
  /// This property supported by Esri and OpenData. The Esri property is
  /// <code>district</code>, and the OpenData property is <code>borough</code>.
  /// </note>
  final String? subMunicipality;

  /// A county, or an area that's part of a larger region. For example,
  /// <code>Metro Vancouver</code>.
  final String? subRegion;

  /// Categories from the data provider that describe the Place that are not
  /// mapped to any Amazon Location categories.
  final List<String>? supplementalCategories;

  /// The time zone in which the <code>Place</code> is located. Returned only when
  /// using HERE or Grab as the selected partner.
  final TimeZone? timeZone;

  /// For addresses with multiple units, the unit identifier. Can include numbers
  /// and letters, for example <code>3B</code> or <code>Unit 123</code>.
  /// <note>
  /// Returned only for a place index that uses Esri or Grab as a data provider.
  /// Is not returned for <code>SearchPlaceIndexForPosition</code>.
  /// </note>
  final String? unitNumber;

  /// For addresses with a <code>UnitNumber</code>, the type of unit. For example,
  /// <code>Apartment</code>.
  /// <note>
  /// Returned only for a place index that uses Esri as a data provider.
  /// </note>
  final String? unitType;

  Place({
    required this.geometry,
    this.addressNumber,
    this.categories,
    this.country,
    this.interpolated,
    this.label,
    this.municipality,
    this.neighborhood,
    this.postalCode,
    this.region,
    this.street,
    this.subMunicipality,
    this.subRegion,
    this.supplementalCategories,
    this.timeZone,
    this.unitNumber,
    this.unitType,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      geometry: PlaceGeometry.fromJson(
          (json['Geometry'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      addressNumber: json['AddressNumber'] as String?,
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      country: json['Country'] as String?,
      interpolated: json['Interpolated'] as bool?,
      label: json['Label'] as String?,
      municipality: json['Municipality'] as String?,
      neighborhood: json['Neighborhood'] as String?,
      postalCode: json['PostalCode'] as String?,
      region: json['Region'] as String?,
      street: json['Street'] as String?,
      subMunicipality: json['SubMunicipality'] as String?,
      subRegion: json['SubRegion'] as String?,
      supplementalCategories: (json['SupplementalCategories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      timeZone: json['TimeZone'] != null
          ? TimeZone.fromJson(json['TimeZone'] as Map<String, dynamic>)
          : null,
      unitNumber: json['UnitNumber'] as String?,
      unitType: json['UnitType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final geometry = this.geometry;
    final addressNumber = this.addressNumber;
    final categories = this.categories;
    final country = this.country;
    final interpolated = this.interpolated;
    final label = this.label;
    final municipality = this.municipality;
    final neighborhood = this.neighborhood;
    final postalCode = this.postalCode;
    final region = this.region;
    final street = this.street;
    final subMunicipality = this.subMunicipality;
    final subRegion = this.subRegion;
    final supplementalCategories = this.supplementalCategories;
    final timeZone = this.timeZone;
    final unitNumber = this.unitNumber;
    final unitType = this.unitType;
    return {
      'Geometry': geometry,
      if (addressNumber != null) 'AddressNumber': addressNumber,
      if (categories != null) 'Categories': categories,
      if (country != null) 'Country': country,
      if (interpolated != null) 'Interpolated': interpolated,
      if (label != null) 'Label': label,
      if (municipality != null) 'Municipality': municipality,
      if (neighborhood != null) 'Neighborhood': neighborhood,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
      if (street != null) 'Street': street,
      if (subMunicipality != null) 'SubMunicipality': subMunicipality,
      if (subRegion != null) 'SubRegion': subRegion,
      if (supplementalCategories != null)
        'SupplementalCategories': supplementalCategories,
      if (timeZone != null) 'TimeZone': timeZone,
      if (unitNumber != null) 'UnitNumber': unitNumber,
      if (unitType != null) 'UnitType': unitType,
    };
  }
}

/// Places uses a point geometry to specify a location or a Place.
///
/// @nodoc
class PlaceGeometry {
  /// A single point geometry specifies a location for a Place using <a
  /// href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a>
  /// coordinates:
  ///
  /// <ul>
  /// <li>
  /// <i>x</i> — Specifies the x coordinate or longitude.
  /// </li>
  /// <li>
  /// <i>y</i> — Specifies the y coordinate or latitude.
  /// </li>
  /// </ul>
  final List<double>? point;

  PlaceGeometry({
    this.point,
  });

  factory PlaceGeometry.fromJson(Map<String, dynamic> json) {
    return PlaceGeometry(
      point:
          (json['Point'] as List?)?.nonNulls.map((e) => e as double).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final point = this.point;
    return {
      if (point != null) 'Point': point,
    };
  }
}

/// Information about a time zone. Includes the name of the time zone and the
/// offset from UTC in seconds.
///
/// @nodoc
class TimeZone {
  /// The name of the time zone, following the <a
  /// href="https://www.iana.org/time-zones"> IANA time zone standard</a>. For
  /// example, <code>America/Los_Angeles</code>.
  final String name;

  /// The time zone's offset, in seconds, from UTC.
  final int? offset;

  TimeZone({
    required this.name,
    this.offset,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      name: (json['Name'] as String?) ?? '',
      offset: json['Offset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final offset = this.offset;
    return {
      'Name': name,
      if (offset != null) 'Offset': offset,
    };
  }
}

/// A summary of the request sent by using
/// <code>SearchPlaceIndexForSuggestions</code>.
///
/// @nodoc
class SearchPlaceIndexForSuggestionsSummary {
  /// The geospatial data provider attached to the place index resource specified
  /// in the request. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// Grab
  /// </li>
  /// <li>
  /// Here
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The free-form partial text input specified in the request.
  final String text;

  /// Contains the coordinates for the optional bias position specified in the
  /// request.
  ///
  /// This parameter contains a pair of numbers. The first number represents the X
  /// coordinate, or longitude; the second number represents the Y coordinate, or
  /// latitude.
  ///
  /// For example, <code>\[-123.1174, 49.2847\]</code> represents the position
  /// with longitude <code>-123.1174</code> and latitude <code>49.2847</code>.
  final List<double>? biasPosition;

  /// Contains the coordinates for the optional bounding box specified in the
  /// request.
  final List<double>? filterBBox;

  /// The optional category filter specified in the request.
  final List<String>? filterCategories;

  /// Contains the optional country filter specified in the request.
  final List<String>? filterCountries;

  /// The preferred language used to return results. Matches the language in the
  /// request. The value is a valid <a
  /// href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  final String? language;

  /// Contains the optional result count limit specified in the request.
  final int? maxResults;

  SearchPlaceIndexForSuggestionsSummary({
    required this.dataSource,
    required this.text,
    this.biasPosition,
    this.filterBBox,
    this.filterCategories,
    this.filterCountries,
    this.language,
    this.maxResults,
  });

  factory SearchPlaceIndexForSuggestionsSummary.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForSuggestionsSummary(
      dataSource: (json['DataSource'] as String?) ?? '',
      text: (json['Text'] as String?) ?? '',
      biasPosition: (json['BiasPosition'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      filterBBox: (json['FilterBBox'] as List?)
          ?.nonNulls
          .map((e) => e as double)
          .toList(),
      filterCategories: (json['FilterCategories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      filterCountries: (json['FilterCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      language: json['Language'] as String?,
      maxResults: json['MaxResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final text = this.text;
    final biasPosition = this.biasPosition;
    final filterBBox = this.filterBBox;
    final filterCategories = this.filterCategories;
    final filterCountries = this.filterCountries;
    final language = this.language;
    final maxResults = this.maxResults;
    return {
      'DataSource': dataSource,
      'Text': text,
      if (biasPosition != null) 'BiasPosition': biasPosition,
      if (filterBBox != null) 'FilterBBox': filterBBox,
      if (filterCategories != null) 'FilterCategories': filterCategories,
      if (filterCountries != null) 'FilterCountries': filterCountries,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
  }
}

/// Contains a place suggestion resulting from a place suggestion query that is
/// run on a place index resource.
///
/// @nodoc
class SearchForSuggestionsResult {
  /// The text of the place suggestion, typically formatted as an address string.
  final String text;

  /// The Amazon Location categories that describe the Place.
  ///
  /// For more information about using categories, including a list of Amazon
  /// Location categories, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/category-filtering.html">Categories
  /// and filtering</a>, in the <i>Amazon Location Service developer guide</i>.
  final List<String>? categories;

  /// The unique identifier of the Place. You can use this with the
  /// <code>GetPlace</code> operation to find the place again later, or to get
  /// full information for the Place.
  ///
  /// The <code>GetPlace</code> request must use the same <code>PlaceIndex</code>
  /// resource as the <code>SearchPlaceIndexForSuggestions</code> that generated
  /// the Place ID.
  /// <note>
  /// For <code>SearchPlaceIndexForSuggestions</code> operations, the
  /// <code>PlaceId</code> is returned by place indexes that use Esri, Grab, or
  /// HERE as data providers.
  /// </note>
  final String? placeId;

  /// Categories from the data provider that describe the Place that are not
  /// mapped to any Amazon Location categories.
  final List<String>? supplementalCategories;

  SearchForSuggestionsResult({
    required this.text,
    this.categories,
    this.placeId,
    this.supplementalCategories,
  });

  factory SearchForSuggestionsResult.fromJson(Map<String, dynamic> json) {
    return SearchForSuggestionsResult(
      text: (json['Text'] as String?) ?? '',
      categories: (json['Categories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      placeId: json['PlaceId'] as String?,
      supplementalCategories: (json['SupplementalCategories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final categories = this.categories;
    final placeId = this.placeId;
    final supplementalCategories = this.supplementalCategories;
    return {
      'Text': text,
      if (categories != null) 'Categories': categories,
      if (placeId != null) 'PlaceId': placeId,
      if (supplementalCategories != null)
        'SupplementalCategories': supplementalCategories,
    };
  }
}

/// A summary of the request sent by using
/// <code>SearchPlaceIndexForPosition</code>.
///
/// @nodoc
class SearchPlaceIndexForPositionSummary {
  /// The geospatial data provider attached to the place index resource specified
  /// in the request. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// Esri
  /// </li>
  /// <li>
  /// Grab
  /// </li>
  /// <li>
  /// Here
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The position specified in the request.
  final List<double> position;

  /// The preferred language used to return results. Matches the language in the
  /// request. The value is a valid <a
  /// href="https://tools.ietf.org/search/bcp47">BCP 47</a> language tag, for
  /// example, <code>en</code> for English.
  final String? language;

  /// Contains the optional result count limit that is specified in the request.
  ///
  /// Default value: <code>50</code>
  final int? maxResults;

  SearchPlaceIndexForPositionSummary({
    required this.dataSource,
    required this.position,
    this.language,
    this.maxResults,
  });

  factory SearchPlaceIndexForPositionSummary.fromJson(
      Map<String, dynamic> json) {
    return SearchPlaceIndexForPositionSummary(
      dataSource: (json['DataSource'] as String?) ?? '',
      position: ((json['Position'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      language: json['Language'] as String?,
      maxResults: json['MaxResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final position = this.position;
    final language = this.language;
    final maxResults = this.maxResults;
    return {
      'DataSource': dataSource,
      'Position': position,
      if (language != null) 'Language': language,
      if (maxResults != null) 'MaxResults': maxResults,
    };
  }
}

/// Contains a search result from a position search query that is run on a place
/// index resource.
///
/// @nodoc
class SearchForPositionResult {
  /// The distance in meters of a great-circle arc between the query position and
  /// the result.
  /// <note>
  /// A great-circle arc is the shortest path on a sphere, in this case the Earth.
  /// This returns the shortest distance between two locations.
  /// </note>
  final double distance;

  /// Details about the search result, such as its address and position.
  final Place place;

  /// The unique identifier of the place. You can use this with the
  /// <code>GetPlace</code> operation to find the place again later.
  /// <note>
  /// For <code>SearchPlaceIndexForPosition</code> operations, the
  /// <code>PlaceId</code> is returned only by place indexes that use HERE or Grab
  /// as a data provider.
  /// </note>
  final String? placeId;

  SearchForPositionResult({
    required this.distance,
    required this.place,
    this.placeId,
  });

  factory SearchForPositionResult.fromJson(Map<String, dynamic> json) {
    return SearchForPositionResult(
      distance: (json['Distance'] as double?) ?? 0,
      place: Place.fromJson((json['Place'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      placeId: json['PlaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distance = this.distance;
    final place = this.place;
    final placeId = this.placeId;
    return {
      'Distance': distance,
      'Place': place,
      if (placeId != null) 'PlaceId': placeId,
    };
  }
}

/// A place index resource listed in your Amazon Web Services account.
///
/// @nodoc
class ListPlaceIndexesResponseEntry {
  /// The timestamp for when the place index resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The data provider of geospatial data. Values can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Esri</code>
  /// </li>
  /// <li>
  /// <code>Grab</code>
  /// </li>
  /// <li>
  /// <code>Here</code>
  /// </li>
  /// </ul>
  /// For more information about data providers, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/what-is-data-provider.html">Amazon
  /// Location Service data providers</a>.
  final String dataSource;

  /// The optional description for the place index resource.
  final String description;

  /// The name of the place index resource.
  final String indexName;

  /// The timestamp for when the place index resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  ListPlaceIndexesResponseEntry({
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.indexName,
    required this.updateTime,
    this.pricingPlan,
  });

  factory ListPlaceIndexesResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListPlaceIndexesResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      dataSource: (json['DataSource'] as String?) ?? '',
      description: (json['Description'] as String?) ?? '',
      indexName: (json['IndexName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final indexName = this.indexName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'IndexName': indexName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
    };
  }
}

/// Specifies the data storage option chosen for requesting Places.
/// <important>
/// When using Amazon Location Places:
///
/// <ul>
/// <li>
/// If using HERE Technologies as a data provider, you can't store results for
/// locations in Japan by setting <code>IntendedUse</code> to
/// <code>Storage</code>. parameter.
/// </li>
/// <li>
/// Under the <code>MobileAssetTracking</code> or
/// <code>MobilAssetManagement</code> pricing plan, you can't store results from
/// your place index resources by setting <code>IntendedUse</code> to
/// <code>Storage</code>. This returns a validation exception error.
/// </li>
/// </ul>
/// For more information, see the <a
/// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for
/// Amazon Location Service.
/// </important>
///
/// @nodoc
class DataSourceConfiguration {
  /// Specifies how the results of an operation will be stored by the caller.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>SingleUse</code> specifies that the results won't be stored.
  /// </li>
  /// <li>
  /// <code>Storage</code> specifies that the result can be cached or stored in a
  /// database.
  /// </li>
  /// </ul>
  /// Default value: <code>SingleUse</code>
  final IntendedUse? intendedUse;

  DataSourceConfiguration({
    this.intendedUse,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      intendedUse:
          (json['IntendedUse'] as String?)?.let(IntendedUse.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final intendedUse = this.intendedUse;
    return {
      if (intendedUse != null) 'IntendedUse': intendedUse.value,
    };
  }
}

/// @nodoc
class IntendedUse {
  static const singleUse = IntendedUse._('SingleUse');
  static const storage = IntendedUse._('Storage');

  final String value;

  const IntendedUse._(this.value);

  static const values = [singleUse, storage];

  static IntendedUse fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IntendedUse._(value));

  @override
  bool operator ==(other) => other is IntendedUse && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details of an existing map resource in your Amazon Web Services
/// account.
///
/// @nodoc
class ListMapsResponseEntry {
  /// The timestamp for when the map resource was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// Specifies the data provider for the associated map tiles.
  final String dataSource;

  /// The description for the map resource.
  final String description;

  /// The name of the associated map resource.
  final String mapName;

  /// The timestamp for when the map resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  ListMapsResponseEntry({
    required this.createTime,
    required this.dataSource,
    required this.description,
    required this.mapName,
    required this.updateTime,
    this.pricingPlan,
  });

  factory ListMapsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListMapsResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      dataSource: (json['DataSource'] as String?) ?? '',
      description: (json['Description'] as String?) ?? '',
      mapName: (json['MapName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final dataSource = this.dataSource;
    final description = this.description;
    final mapName = this.mapName;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'DataSource': dataSource,
      'Description': description,
      'MapName': mapName,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
    };
  }
}

/// Specifies the political view for the style.
///
/// @nodoc
class MapConfigurationUpdate {
  /// Specifies the custom layers for the style. Leave unset to not enable any
  /// custom layer, or, for styles that support custom layers, you can enable
  /// layer(s), such as POI layer for the VectorEsriNavigation style. Default is
  /// <code>unset</code>.
  /// <note>
  /// Not all map resources or styles support custom layers. See Custom Layers for
  /// more information.
  /// </note>
  final List<String>? customLayers;

  /// Specifies the political view for the style. Set to an empty string to not
  /// use a political view, or, for styles that support specific political views,
  /// you can choose a view, such as <code>IND</code> for the Indian view.
  /// <note>
  /// Not all map resources or styles support political view styles. See <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/map-concepts.html#political-views">Political
  /// views</a> for more information.
  /// </note>
  final String? politicalView;

  MapConfigurationUpdate({
    this.customLayers,
    this.politicalView,
  });

  Map<String, dynamic> toJson() {
    final customLayers = this.customLayers;
    final politicalView = this.politicalView;
    return {
      if (customLayers != null) 'CustomLayers': customLayers,
      if (politicalView != null) 'PoliticalView': politicalView,
    };
  }
}

/// Specifies the map tile style selected from an available provider.
///
/// @nodoc
class MapConfiguration {
  /// Specifies the map style selected from an available data provider.
  ///
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/esri.html">Esri
  /// map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorEsriDarkGrayCanvas</code> – The Esri Dark Gray Canvas map style.
  /// A vector basemap with a dark gray, neutral background with minimal colors,
  /// labels, and features that's designed to draw attention to your thematic
  /// content.
  /// </li>
  /// <li>
  /// <code>RasterEsriImagery</code> – The Esri Imagery map style. A raster
  /// basemap that provides one meter or better satellite and aerial imagery in
  /// many parts of the world and lower resolution satellite imagery worldwide.
  /// </li>
  /// <li>
  /// <code>VectorEsriLightGrayCanvas</code> – The Esri Light Gray Canvas map
  /// style, which provides a detailed vector basemap with a light gray, neutral
  /// background style with minimal colors, labels, and features that's designed
  /// to draw attention to your thematic content.
  /// </li>
  /// <li>
  /// <code>VectorEsriTopographic</code> – The Esri Light map style, which
  /// provides a detailed vector basemap with a classic Esri map style.
  /// </li>
  /// <li>
  /// <code>VectorEsriStreets</code> – The Esri Street Map style, which provides a
  /// detailed vector basemap for the world symbolized with a classic Esri street
  /// map style. The vector tile layer is similar in content and style to the
  /// World Street Map raster map.
  /// </li>
  /// <li>
  /// <code>VectorEsriNavigation</code> – The Esri Navigation map style, which
  /// provides a detailed basemap for the world symbolized with a custom
  /// navigation map style that's designed for use during the day in mobile
  /// devices.
  /// </li>
  /// </ul>
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/HERE.html">HERE
  /// Technologies map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorHereContrast</code> – The HERE Contrast (Berlin) map style is a
  /// high contrast detailed base map of the world that blends 3D and 2D
  /// rendering.
  /// <note>
  /// The <code>VectorHereContrast</code> style has been renamed from
  /// <code>VectorHereBerlin</code>. <code>VectorHereBerlin</code> has been
  /// deprecated, but will continue to work in applications that use it.
  /// </note> </li>
  /// <li>
  /// <code>VectorHereExplore</code> – A default HERE map style containing a
  /// neutral, global map and its features including roads, buildings, landmarks,
  /// and water features. It also now includes a fully designed map of Japan.
  /// </li>
  /// <li>
  /// <code>VectorHereExploreTruck</code> – A global map containing truck
  /// restrictions and attributes (e.g. width / height / HAZMAT) symbolized with
  /// highlighted segments and icons on top of HERE Explore to support use cases
  /// within transport and logistics.
  /// </li>
  /// <li>
  /// <code>RasterHereExploreSatellite</code> – A global map containing high
  /// resolution satellite imagery.
  /// </li>
  /// <li>
  /// <code>HybridHereExploreSatellite</code> – A global map displaying the road
  /// network, street names, and city labels over satellite imagery. This style
  /// will automatically retrieve both raster and vector tiles, and your charges
  /// will be based on total tiles retrieved.
  /// <note>
  /// Hybrid styles use both vector and raster tiles when rendering the map that
  /// you see. This means that more tiles are retrieved than when using either
  /// vector or raster tiles alone. Your charges will include all tiles retrieved.
  /// </note> </li>
  /// </ul>
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html">GrabMaps
  /// map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorGrabStandardLight</code> – The Grab Standard Light map style
  /// provides a basemap with detailed land use coloring, area names, roads,
  /// landmarks, and points of interest covering Southeast Asia.
  /// </li>
  /// <li>
  /// <code>VectorGrabStandardDark</code> – The Grab Standard Dark map style
  /// provides a dark variation of the standard basemap covering Southeast Asia.
  /// </li>
  /// </ul> <note>
  /// Grab provides maps only for countries in Southeast Asia, and is only
  /// available in the Asia Pacific (Singapore) Region
  /// (<code>ap-southeast-1</code>). For more information, see <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/grab.html#grab-coverage-area">GrabMaps
  /// countries and area covered</a>.
  /// </note>
  /// Valid <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/open-data.html">Open
  /// Data map styles</a>:
  ///
  /// <ul>
  /// <li>
  /// <code>VectorOpenDataStandardLight</code> – The Open Data Standard Light map
  /// style provides a detailed basemap for the world suitable for website and
  /// mobile application use. The map includes highways major roads, minor roads,
  /// railways, water features, cities, parks, landmarks, building footprints, and
  /// administrative boundaries.
  /// </li>
  /// <li>
  /// <code>VectorOpenDataStandardDark</code> – Open Data Standard Dark is a
  /// dark-themed map style that provides a detailed basemap for the world
  /// suitable for website and mobile application use. The map includes highways
  /// major roads, minor roads, railways, water features, cities, parks,
  /// landmarks, building footprints, and administrative boundaries.
  /// </li>
  /// <li>
  /// <code>VectorOpenDataVisualizationLight</code> – The Open Data Visualization
  /// Light map style is a light-themed style with muted colors and fewer features
  /// that aids in understanding overlaid data.
  /// </li>
  /// <li>
  /// <code>VectorOpenDataVisualizationDark</code> – The Open Data Visualization
  /// Dark map style is a dark-themed style with muted colors and fewer features
  /// that aids in understanding overlaid data.
  /// </li>
  /// </ul>
  final String style;

  /// Specifies the custom layers for the style. Leave unset to not enable any
  /// custom layer, or, for styles that support custom layers, you can enable
  /// layer(s), such as POI layer for the VectorEsriNavigation style. Default is
  /// <code>unset</code>.
  /// <note>
  /// Not all map resources or styles support custom layers. See Custom Layers for
  /// more information.
  /// </note>
  final List<String>? customLayers;

  /// Specifies the political view for the style. Leave unset to not use a
  /// political view, or, for styles that support specific political views, you
  /// can choose a view, such as <code>IND</code> for the Indian view.
  ///
  /// Default is unset.
  /// <note>
  /// Not all map resources or styles support political view styles. See <a
  /// href="https://docs.aws.amazon.com/location/previous/developerguide/map-concepts.html#political-views">Political
  /// views</a> for more information.
  /// </note>
  final String? politicalView;

  MapConfiguration({
    required this.style,
    this.customLayers,
    this.politicalView,
  });

  factory MapConfiguration.fromJson(Map<String, dynamic> json) {
    return MapConfiguration(
      style: (json['Style'] as String?) ?? '',
      customLayers: (json['CustomLayers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      politicalView: json['PoliticalView'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final style = this.style;
    final customLayers = this.customLayers;
    final politicalView = this.politicalView;
    return {
      'Style': style,
      if (customLayers != null) 'CustomLayers': customLayers,
      if (politicalView != null) 'PoliticalView': politicalView,
    };
  }
}

/// @nodoc
class JobStatus {
  static const pending = JobStatus._('Pending');
  static const running = JobStatus._('Running');
  static const completed = JobStatus._('Completed');
  static const failed = JobStatus._('Failed');
  static const cancelling = JobStatus._('Cancelling');
  static const cancelled = JobStatus._('Cancelled');

  final String value;

  const JobStatus._(this.value);

  static const values = [
    pending,
    running,
    completed,
    failed,
    cancelling,
    cancelled
  ];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Job summary information returned in list operations.
///
/// @nodoc
class ListJobsResponseEntry {
  /// Action performed by the job.
  final JobAction action;

  /// Job creation time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>.
  final DateTime createdAt;

  /// IAM role used for job execution.
  final String executionRoleArn;

  /// Input configuration.
  final JobInputOptions inputOptions;

  /// Amazon Resource Name (ARN) of the job.
  final String jobArn;

  /// Unique job identifier.
  final String jobId;

  /// Output configuration.
  final JobOutputOptions outputOptions;

  /// Current job status.
  final JobStatus status;

  /// Last update time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>.
  final DateTime updatedAt;

  /// Additional options for configuring job action parameters.
  final JobActionOptions? actionOptions;

  /// Job completion time in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sss</code>. Only returned for jobs in a
  /// terminal status: <code>Completed</code> | <code>Failed</code> |
  /// <code>Cancelled</code>.
  final DateTime? endedAt;

  /// Error information if the job failed.
  final JobError? error;

  /// Job name (if provided during creation).
  final String? name;

  ListJobsResponseEntry({
    required this.action,
    required this.createdAt,
    required this.executionRoleArn,
    required this.inputOptions,
    required this.jobArn,
    required this.jobId,
    required this.outputOptions,
    required this.status,
    required this.updatedAt,
    this.actionOptions,
    this.endedAt,
    this.error,
    this.name,
  });

  factory ListJobsResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListJobsResponseEntry(
      action: JobAction.fromString((json['Action'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      executionRoleArn: (json['ExecutionRoleArn'] as String?) ?? '',
      inputOptions: JobInputOptions.fromJson(
          (json['InputOptions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['JobArn'] as String?) ?? '',
      jobId: (json['JobId'] as String?) ?? '',
      outputOptions: JobOutputOptions.fromJson(
          (json['OutputOptions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: JobStatus.fromString((json['Status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      actionOptions: json['ActionOptions'] != null
          ? JobActionOptions.fromJson(
              json['ActionOptions'] as Map<String, dynamic>)
          : null,
      endedAt: timeStampFromJson(json['EndedAt']),
      error: json['Error'] != null
          ? JobError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final executionRoleArn = this.executionRoleArn;
    final inputOptions = this.inputOptions;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final outputOptions = this.outputOptions;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final actionOptions = this.actionOptions;
    final endedAt = this.endedAt;
    final error = this.error;
    final name = this.name;
    return {
      'Action': action.value,
      'CreatedAt': iso8601ToJson(createdAt),
      'ExecutionRoleArn': executionRoleArn,
      'InputOptions': inputOptions,
      'JobArn': jobArn,
      'JobId': jobId,
      'OutputOptions': outputOptions,
      'Status': status.value,
      'UpdatedAt': iso8601ToJson(updatedAt),
      if (actionOptions != null) 'ActionOptions': actionOptions,
      if (endedAt != null) 'EndedAt': iso8601ToJson(endedAt),
      if (error != null) 'Error': error,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class JobAction {
  static const validateAddress = JobAction._('ValidateAddress');

  final String value;

  const JobAction._(this.value);

  static const values = [validateAddress];

  static JobAction fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobAction._(value));

  @override
  bool operator ==(other) => other is JobAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional options for configuring job action parameters.
///
/// @nodoc
class JobActionOptions {
  /// Options specific to address validation jobs.
  final ValidateAddressActionOptions? validateAddress;

  JobActionOptions({
    this.validateAddress,
  });

  factory JobActionOptions.fromJson(Map<String, dynamic> json) {
    return JobActionOptions(
      validateAddress: json['ValidateAddress'] != null
          ? ValidateAddressActionOptions.fromJson(
              json['ValidateAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final validateAddress = this.validateAddress;
    return {
      if (validateAddress != null) 'ValidateAddress': validateAddress,
    };
  }
}

/// Error information for failed jobs.
///
/// @nodoc
class JobError {
  /// Error code indicating the type of error that occurred.
  final JobErrorCode code;

  /// Error messages providing details about the failure.
  final List<String>? messages;

  JobError({
    required this.code,
    this.messages,
  });

  factory JobError.fromJson(Map<String, dynamic> json) {
    return JobError(
      code: JobErrorCode.fromString((json['Code'] as String?) ?? ''),
      messages: (json['Messages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final messages = this.messages;
    return {
      'Code': code.value,
      if (messages != null) 'Messages': messages,
    };
  }
}

/// Configuration for input data location and format.
/// <note>
/// Input files have a limitation of 10gb per file, and 1gb per Parquet
/// row-group within the file.
/// </note>
///
/// @nodoc
class JobInputOptions {
  /// Input data format. Currently only <code>Parquet</code> is supported.
  /// <note>
  /// Input files have a limitation of 10gb per file, and 1gb per Parquet
  /// row-group within the file.
  /// </note>
  final JobInputFormat format;

  /// S3 ARN or URI where input files are stored.
  /// <note>
  /// The Amazon S3 bucket must be created in the same Amazon Web Services region
  /// where you plan to run your job.
  /// </note>
  final String location;

  JobInputOptions({
    required this.format,
    required this.location,
  });

  factory JobInputOptions.fromJson(Map<String, dynamic> json) {
    return JobInputOptions(
      format: JobInputFormat.fromString((json['Format'] as String?) ?? ''),
      location: (json['Location'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final location = this.location;
    return {
      'Format': format.value,
      'Location': location,
    };
  }
}

/// Configuration for output data location and format.
///
/// @nodoc
class JobOutputOptions {
  /// Output data format. Currently only "Parquet" is supported.
  final JobOutputFormat format;

  /// S3 ARN or URI where output files will be written.
  /// <note>
  /// The Amazon S3 bucket must exist in the same Amazon Web Services region where
  /// you plan to run your job.
  /// </note>
  final String location;

  JobOutputOptions({
    required this.format,
    required this.location,
  });

  factory JobOutputOptions.fromJson(Map<String, dynamic> json) {
    return JobOutputOptions(
      format: JobOutputFormat.fromString((json['Format'] as String?) ?? ''),
      location: (json['Location'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final location = this.location;
    return {
      'Format': format.value,
      'Location': location,
    };
  }
}

/// @nodoc
class JobOutputFormat {
  static const parquet = JobOutputFormat._('Parquet');

  final String value;

  const JobOutputFormat._(this.value);

  static const values = [parquet];

  static JobOutputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobOutputFormat._(value));

  @override
  bool operator ==(other) => other is JobOutputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class JobInputFormat {
  static const parquet = JobInputFormat._('Parquet');

  final String value;

  const JobInputFormat._(this.value);

  static const values = [parquet];

  static JobInputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobInputFormat._(value));

  @override
  bool operator ==(other) => other is JobInputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class JobErrorCode {
  static const validationError = JobErrorCode._('ValidationError');
  static const internalServerError = JobErrorCode._('InternalServerError');

  final String value;

  const JobErrorCode._(this.value);

  static const values = [validationError, internalServerError];

  static JobErrorCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobErrorCode._(value));

  @override
  bool operator ==(other) => other is JobErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Options specific to address validation jobs.
///
/// @nodoc
class ValidateAddressActionOptions {
  /// A list of optional additional parameters that can be requested for each
  /// result.
  ///
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <code>Position</code> - Return the position coordinates of the address if
  /// available.
  /// </li>
  /// <li>
  /// <code>CountrySpecificAttributes</code> - Return additional information about
  /// the address specific to the country of origin.
  /// </li>
  /// </ul>
  final List<ValidateAddressAdditionalFeature>? additionalFeatures;

  ValidateAddressActionOptions({
    this.additionalFeatures,
  });

  factory ValidateAddressActionOptions.fromJson(Map<String, dynamic> json) {
    return ValidateAddressActionOptions(
      additionalFeatures: (json['AdditionalFeatures'] as List?)
          ?.nonNulls
          .map(
              (e) => ValidateAddressAdditionalFeature.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalFeatures = this.additionalFeatures;
    return {
      if (additionalFeatures != null)
        'AdditionalFeatures': additionalFeatures.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ValidateAddressAdditionalFeature {
  static const position = ValidateAddressAdditionalFeature._('Position');
  static const countrySpecificAttributes =
      ValidateAddressAdditionalFeature._('CountrySpecificAttributes');

  final String value;

  const ValidateAddressAdditionalFeature._(this.value);

  static const values = [position, countrySpecificAttributes];

  static ValidateAddressAdditionalFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ValidateAddressAdditionalFeature._(value));

  @override
  bool operator ==(other) =>
      other is ValidateAddressAdditionalFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Criteria for filtering jobs.
///
/// @nodoc
class JobsFilter {
  /// Filter by job status.
  final JobStatus? jobStatus;

  JobsFilter({
    this.jobStatus,
  });

  Map<String, dynamic> toJson() {
    final jobStatus = this.jobStatus;
    return {
      if (jobStatus != null) 'JobStatus': jobStatus.value,
    };
  }
}

/// Contains the geofence geometry details.
///
/// A geofence geometry can be a circle, a polygon, or a multipolygon.
/// <code>Polygon</code> and <code>MultiPolygon</code> geometries can be defined
/// using their respective parameters, or encoded in Geobuf format using the
/// <code>Geobuf</code> parameter. Including multiple geometry types in the same
/// request will return a validation error.
/// <note>
/// Amazon Location doesn't currently support polygons that cross the
/// antimeridian.
/// </note>
///
/// @nodoc
class GeofenceGeometry {
  /// A circle on the earth, as defined by a center point and a radius.
  final Circle? circle;

  /// Geobuf is a compact binary encoding for geographic data that provides
  /// lossless compression of GeoJSON polygons. The Geobuf must be Base64-encoded.
  ///
  /// This parameter can contain a Geobuf-encoded GeoJSON geometry object of type
  /// <code>Polygon</code> <i>OR</i> <code>MultiPolygon</code>. For more
  /// information and specific configuration requirements for these object types,
  /// see <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_WaypointGeofencing_GeofenceGeometry.html#location-Type-WaypointGeofencing_GeofenceGeometry-Polygon">Polygon</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_WaypointGeofencing_GeofenceGeometry.html#location-Type-WaypointGeofencing_GeofenceGeometry-MultiPolygon">MultiPolygon</a>.
  /// <note>
  /// The following limitations apply specifically to geometries defined using the
  /// <code>Geobuf</code> parameter, and supercede the corresponding limitations
  /// of the <code>Polygon</code> and <code>MultiPolygon</code> parameters:
  ///
  /// <ul>
  /// <li>
  /// A <code>Polygon</code> in <code>Geobuf</code> format can have up to 25,000
  /// rings and up to 100,000 total vertices, including all vertices from all
  /// component rings.
  /// </li>
  /// <li>
  /// A <code>MultiPolygon</code> in <code>Geobuf</code> format can contain up to
  /// 10,000 <code>Polygons</code> and up to 100,000 total vertices, including all
  /// vertices from all component <code>Polygons</code>.
  /// </li>
  /// </ul> </note>
  final Uint8List? geobuf;

  /// A <code>MultiPolygon</code> is a list of up to 250 <code>Polygon</code>
  /// elements which represent the shape of a geofence. The <code>Polygon</code>
  /// components of a <code>MultiPolygon</code> geometry can define separate
  /// geographical areas that are considered part of the same geofence, perimeters
  /// of larger exterior areas with smaller interior spaces that are excluded from
  /// the geofence, or some combination of these use cases to form complex
  /// geofence boundaries.
  ///
  /// For more information and specific configuration requirements for the
  /// <code>Polygon</code> components that form a <code>MultiPolygon</code>, see
  /// <a
  /// href="https://docs.aws.amazon.com/location/latest/APIReference/API_WaypointGeofencing_GeofenceGeometry.html#location-Type-WaypointGeofencing_GeofenceGeometry-Polygon">Polygon</a>.
  /// <note>
  /// The following additional requirements and limitations apply to geometries
  /// defined using the <code>MultiPolygon</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// The entire <code>MultiPolygon</code> must consist of no more than 1,000
  /// vertices, including all vertices from all component <code>Polygons</code>.
  /// </li>
  /// <li>
  /// Each edge of a component <code>Polygon</code> must intersect no more than 5
  /// edges from other <code>Polygons</code>. Parallel edges that are shared but
  /// do not cross are not counted toward this limit.
  /// </li>
  /// <li>
  /// The total number of intersecting edges of component <code>Polygons</code>
  /// must be no more than 100,000. Parallel edges that are shared but do not
  /// cross are not counted toward this limit.
  /// </li>
  /// </ul> </note>
  final List<List<List<List<double>>>>? multiPolygon;

  /// A <code>Polygon</code> is a list of up to 250 linear rings which represent
  /// the shape of a geofence. This list <i>must</i> include 1 exterior ring
  /// (representing the outer perimeter of the geofence), and can optionally
  /// include up to 249 interior rings (representing polygonal spaces within the
  /// perimeter, which are excluded from the geofence area).
  ///
  /// A linear ring is an array of 4 or more vertices, where the first and last
  /// vertex are the same (to form a closed boundary). Each vertex is a
  /// 2-dimensional point represented as an array of doubles of length 2:
  /// <code>\[longitude, latitude\]</code>.
  ///
  /// Each linear ring is represented as an array of arrays of doubles
  /// (<code>\[\[longitude, latitude\], \[longitude, latitude\], ...\]</code>).
  /// The vertices for the exterior ring must be listed in
  /// <i>counter-clockwise</i> sequence. Vertices for all interior rings must be
  /// listed in <i>clockwise</i> sequence.
  ///
  /// The list of linear rings that describe the entire <code>Polygon</code> is
  /// represented as an array of arrays of arrays of doubles
  /// (<code>\[\[\[longitude, latitude\], \[longitude, latitude\], ...\],
  /// \[\[longitude, latitude\], \[longitude, latitude\], ...\], ...\]</code>).
  /// The exterior ring must be listed first, before any interior rings.
  /// <note>
  /// The following additional requirements and limitations apply to geometries
  /// defined using the <code>Polygon</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// The entire <code>Polygon</code> must consist of no more than 1,000 vertices,
  /// including all vertices from the exterior ring and all interior rings.
  /// </li>
  /// <li>
  /// Rings must not touch or cross each other.
  /// </li>
  /// <li>
  /// All interior rings must be fully contained within the exterior ring.
  /// </li>
  /// <li>
  /// Interior rings must not contain other interior rings.
  /// </li>
  /// <li>
  /// No ring is permitted to intersect itself.
  /// </li>
  /// </ul> </note>
  final List<List<List<double>>>? polygon;

  GeofenceGeometry({
    this.circle,
    this.geobuf,
    this.multiPolygon,
    this.polygon,
  });

  factory GeofenceGeometry.fromJson(Map<String, dynamic> json) {
    return GeofenceGeometry(
      circle: json['Circle'] != null
          ? Circle.fromJson(json['Circle'] as Map<String, dynamic>)
          : null,
      geobuf: _s.decodeNullableUint8List(json['Geobuf'] as String?),
      multiPolygon: (json['MultiPolygon'] as List?)
          ?.nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List)
                  .nonNulls
                  .map((e) =>
                      (e as List).nonNulls.map((e) => e as double).toList())
                  .toList())
              .toList())
          .toList(),
      polygon: (json['Polygon'] as List?)
          ?.nonNulls
          .map((e) => (e as List)
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as double).toList())
              .toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final circle = this.circle;
    final geobuf = this.geobuf;
    final multiPolygon = this.multiPolygon;
    final polygon = this.polygon;
    return {
      if (circle != null) 'Circle': circle,
      if (geobuf != null) 'Geobuf': base64Encode(geobuf),
      if (multiPolygon != null) 'MultiPolygon': multiPolygon,
      if (polygon != null) 'Polygon': polygon,
    };
  }
}

/// A circle on the earth, as defined by a center point and a radius.
///
/// @nodoc
class Circle {
  /// A single point geometry, specifying the center of the circle, using <a
  /// href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a>
  /// coordinates, in the form <code>\[longitude, latitude\]</code>.
  final List<double> center;

  /// The radius of the circle in meters. Must be greater than zero and no larger
  /// than 100,000 (100 kilometers).
  final double radius;

  Circle({
    required this.center,
    required this.radius,
  });

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      center: ((json['Center'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as double)
          .toList(),
      radius: (json['Radius'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final center = this.center;
    final radius = this.radius;
    return {
      'Center': center,
      'Radius': radius,
    };
  }
}

/// Contains a list of geofences stored in a given geofence collection.
/// <note>
/// The returned geometry will always match the geometry format used when the
/// geofence was created.
/// </note>
///
/// @nodoc
class ListGeofenceResponseEntry {
  /// The timestamp for when the geofence was stored in a geofence collection in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence identifier.
  final String geofenceId;

  /// Contains the geofence geometry details describing the position of the
  /// geofence. Can be a circle, a polygon, or a multipolygon.
  final GeofenceGeometry geometry;

  /// Identifies the state of the geofence. A geofence will hold one of the
  /// following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> — The geofence has been indexed by the system.
  /// </li>
  /// <li>
  /// <code>PENDING</code> — The geofence is being processed by the system.
  /// </li>
  /// <li>
  /// <code>FAILED</code> — The geofence failed to be indexed by the system.
  /// </li>
  /// <li>
  /// <code>DELETED</code> — The geofence has been deleted from the system index.
  /// </li>
  /// <li>
  /// <code>DELETING</code> — The geofence is being deleted from the system index.
  /// </li>
  /// </ul>
  final String status;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// User defined properties of the geofence. A property is a key-value pair
  /// stored with the geofence and added to any geofence event triggered with that
  /// geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? geofenceProperties;

  ListGeofenceResponseEntry({
    required this.createTime,
    required this.geofenceId,
    required this.geometry,
    required this.status,
    required this.updateTime,
    this.geofenceProperties,
  });

  factory ListGeofenceResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListGeofenceResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
      geometry: GeofenceGeometry.fromJson(
          (json['Geometry'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: (json['Status'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      geofenceProperties: (json['GeofenceProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final status = this.status;
    final updateTime = this.updateTime;
    final geofenceProperties = this.geofenceProperties;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      'Status': status,
      'UpdateTime': iso8601ToJson(updateTime),
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
    };
  }
}

/// @nodoc
class SpeedUnit {
  static const kilometersPerHour = SpeedUnit._('KilometersPerHour');
  static const milesPerHour = SpeedUnit._('MilesPerHour');

  final String value;

  const SpeedUnit._(this.value);

  static const values = [kilometersPerHour, milesPerHour];

  static SpeedUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SpeedUnit._(value));

  @override
  bool operator ==(other) => other is SpeedUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A forecasted event represents a geofence event in relation to the requested
/// device state, that may occur given the provided device state and time
/// horizon.
///
/// @nodoc
class ForecastedEvent {
  /// The forecasted event identifier.
  final String eventId;

  /// The event type, forecasting three states for which a device can be in
  /// relative to a geofence:
  ///
  /// <code>ENTER</code>: If a device is outside of a geofence, but would breach
  /// the fence if the device is moving at its current speed within time horizon
  /// window.
  ///
  /// <code>EXIT</code>: If a device is inside of a geofence, but would breach the
  /// fence if the device is moving at its current speed within time horizon
  /// window.
  ///
  /// <code>IDLE</code>: If a device is inside of a geofence, and the device is
  /// not moving.
  final ForecastedGeofenceEventType eventType;

  /// The geofence identifier pertaining to the forecasted event.
  final String geofenceId;

  /// Indicates if the device is located within the geofence.
  final bool isDeviceInGeofence;

  /// The closest distance from the device's position to the geofence.
  final double nearestDistance;

  /// The forecasted time the device will breach the geofence in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime? forecastedBreachTime;

  /// The geofence properties.
  final Map<String, String>? geofenceProperties;

  ForecastedEvent({
    required this.eventId,
    required this.eventType,
    required this.geofenceId,
    required this.isDeviceInGeofence,
    required this.nearestDistance,
    this.forecastedBreachTime,
    this.geofenceProperties,
  });

  factory ForecastedEvent.fromJson(Map<String, dynamic> json) {
    return ForecastedEvent(
      eventId: (json['EventId'] as String?) ?? '',
      eventType: ForecastedGeofenceEventType.fromString(
          (json['EventType'] as String?) ?? ''),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
      isDeviceInGeofence: (json['IsDeviceInGeofence'] as bool?) ?? false,
      nearestDistance: (json['NearestDistance'] as double?) ?? 0,
      forecastedBreachTime: timeStampFromJson(json['ForecastedBreachTime']),
      geofenceProperties: (json['GeofenceProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventId = this.eventId;
    final eventType = this.eventType;
    final geofenceId = this.geofenceId;
    final isDeviceInGeofence = this.isDeviceInGeofence;
    final nearestDistance = this.nearestDistance;
    final forecastedBreachTime = this.forecastedBreachTime;
    final geofenceProperties = this.geofenceProperties;
    return {
      'EventId': eventId,
      'EventType': eventType.value,
      'GeofenceId': geofenceId,
      'IsDeviceInGeofence': isDeviceInGeofence,
      'NearestDistance': nearestDistance,
      if (forecastedBreachTime != null)
        'ForecastedBreachTime': iso8601ToJson(forecastedBreachTime),
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
    };
  }
}

/// @nodoc
class ForecastedGeofenceEventType {
  static const enter = ForecastedGeofenceEventType._('ENTER');
  static const exit = ForecastedGeofenceEventType._('EXIT');
  static const idle = ForecastedGeofenceEventType._('IDLE');

  final String value;

  const ForecastedGeofenceEventType._(this.value);

  static const values = [enter, exit, idle];

  static ForecastedGeofenceEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ForecastedGeofenceEventType._(value));

  @override
  bool operator ==(other) =>
      other is ForecastedGeofenceEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The device's position and speed.
///
/// @nodoc
class ForecastGeofenceEventsDeviceState {
  /// The device's position.
  final List<double> position;

  /// The device's speed.
  final double? speed;

  ForecastGeofenceEventsDeviceState({
    required this.position,
    this.speed,
  });

  Map<String, dynamic> toJson() {
    final position = this.position;
    final speed = this.speed;
    return {
      'Position': position,
      if (speed != null) 'Speed': speed,
    };
  }
}

/// Contains error details for each geofence that failed to be stored in a given
/// geofence collection.
///
/// @nodoc
class BatchPutGeofenceError {
  /// Contains details associated to the batch error.
  final BatchItemError error;

  /// The geofence associated with the error message.
  final String geofenceId;

  BatchPutGeofenceError({
    required this.error,
    required this.geofenceId,
  });

  factory BatchPutGeofenceError.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceError(
      error: BatchItemError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final geofenceId = this.geofenceId;
    return {
      'Error': error,
      'GeofenceId': geofenceId,
    };
  }
}

/// Contains a summary of each geofence that was successfully stored in a given
/// geofence collection.
///
/// @nodoc
class BatchPutGeofenceSuccess {
  /// The timestamp for when the geofence was stored in a geofence collection in
  /// <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO
  /// 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The geofence successfully stored in a geofence collection.
  final String geofenceId;

  /// The timestamp for when the geofence was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  BatchPutGeofenceSuccess({
    required this.createTime,
    required this.geofenceId,
    required this.updateTime,
  });

  factory BatchPutGeofenceSuccess.fromJson(Map<String, dynamic> json) {
    return BatchPutGeofenceSuccess(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final geofenceId = this.geofenceId;
    final updateTime = this.updateTime;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'GeofenceId': geofenceId,
      'UpdateTime': iso8601ToJson(updateTime),
    };
  }
}

/// Contains geofence geometry details.
///
/// @nodoc
class BatchPutGeofenceRequestEntry {
  /// The identifier for the geofence to be stored in a given geofence collection.
  final String geofenceId;

  /// Contains the details to specify the position of the geofence. Can be a
  /// circle, a polygon, or a multipolygon. <code>Polygon</code> and
  /// <code>MultiPolygon</code> geometries can be defined using their respective
  /// parameters, or encoded in Geobuf format using the <code>Geobuf</code>
  /// parameter. Including multiple geometry types in the same request will return
  /// a validation error.
  /// <note>
  /// The geofence <code>Polygon</code> and <code>MultiPolygon</code> formats
  /// support a maximum of 1,000 total vertices. The <code>Geobuf</code> format
  /// supports a maximum of 100,000 vertices.
  /// </note>
  final GeofenceGeometry geometry;

  /// Associates one of more properties with the geofence. A property is a
  /// key-value pair stored with the geofence and added to any geofence event
  /// triggered with that geofence.
  ///
  /// Format: <code>"key" : "value"</code>
  final Map<String, String>? geofenceProperties;

  BatchPutGeofenceRequestEntry({
    required this.geofenceId,
    required this.geometry,
    this.geofenceProperties,
  });

  Map<String, dynamic> toJson() {
    final geofenceId = this.geofenceId;
    final geometry = this.geometry;
    final geofenceProperties = this.geofenceProperties;
    return {
      'GeofenceId': geofenceId,
      'Geometry': geometry,
      if (geofenceProperties != null) 'GeofenceProperties': geofenceProperties,
    };
  }
}

/// Contains error details for each device that failed to evaluate its position
/// against the geofences in a given geofence collection.
///
/// @nodoc
class BatchEvaluateGeofencesError {
  /// The device associated with the position evaluation error.
  final String deviceId;

  /// Contains details associated to the batch error.
  final BatchItemError error;

  /// Specifies a timestamp for when the error occurred in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime sampleTime;

  BatchEvaluateGeofencesError({
    required this.deviceId,
    required this.error,
    required this.sampleTime,
  });

  factory BatchEvaluateGeofencesError.fromJson(Map<String, dynamic> json) {
    return BatchEvaluateGeofencesError(
      deviceId: (json['DeviceId'] as String?) ?? '',
      error: BatchItemError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      sampleTime: nonNullableTimeStampFromJson(json['SampleTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final error = this.error;
    final sampleTime = this.sampleTime;
    return {
      'DeviceId': deviceId,
      'Error': error,
      'SampleTime': iso8601ToJson(sampleTime),
    };
  }
}

/// Contains error details for each geofence that failed to delete from the
/// geofence collection.
///
/// @nodoc
class BatchDeleteGeofenceError {
  /// Contains details associated to the batch error.
  final BatchItemError error;

  /// The geofence associated with the error message.
  final String geofenceId;

  BatchDeleteGeofenceError({
    required this.error,
    required this.geofenceId,
  });

  factory BatchDeleteGeofenceError.fromJson(Map<String, dynamic> json) {
    return BatchDeleteGeofenceError(
      error: BatchItemError.fromJson((json['Error'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      geofenceId: (json['GeofenceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final geofenceId = this.geofenceId;
    return {
      'Error': error,
      'GeofenceId': geofenceId,
    };
  }
}

/// Contains the geofence collection details.
/// <note>
/// The returned geometry will always match the geometry format used when the
/// geofence was created.
/// </note>
///
/// @nodoc
class ListGeofenceCollectionsResponseEntry {
  /// The name of the geofence collection.
  final String collectionName;

  /// The timestamp for when the geofence collection was created in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime createTime;

  /// The description for the geofence collection
  final String description;

  /// Specifies a timestamp for when the resource was last updated in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime updateTime;

  /// No longer used. Always returns <code>RequestBasedUsage</code>.
  final PricingPlan? pricingPlan;

  /// No longer used. Always returns an empty string.
  final String? pricingPlanDataSource;

  ListGeofenceCollectionsResponseEntry({
    required this.collectionName,
    required this.createTime,
    required this.description,
    required this.updateTime,
    this.pricingPlan,
    this.pricingPlanDataSource,
  });

  factory ListGeofenceCollectionsResponseEntry.fromJson(
      Map<String, dynamic> json) {
    return ListGeofenceCollectionsResponseEntry(
      collectionName: (json['CollectionName'] as String?) ?? '',
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      pricingPlan:
          (json['PricingPlan'] as String?)?.let(PricingPlan.fromString),
      pricingPlanDataSource: json['PricingPlanDataSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final collectionName = this.collectionName;
    final createTime = this.createTime;
    final description = this.description;
    final updateTime = this.updateTime;
    final pricingPlan = this.pricingPlan;
    final pricingPlanDataSource = this.pricingPlanDataSource;
    return {
      'CollectionName': collectionName,
      'CreateTime': iso8601ToJson(createTime),
      'Description': description,
      'UpdateTime': iso8601ToJson(updateTime),
      if (pricingPlan != null) 'PricingPlan': pricingPlan.value,
      if (pricingPlanDataSource != null)
        'PricingPlanDataSource': pricingPlanDataSource,
    };
  }
}

/// An API key resource listed in your Amazon Web Services account.
///
/// @nodoc
class ListKeysResponseEntry {
  /// The timestamp of when the API key was created, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime createTime;

  /// The timestamp for when the API key resource will expire, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime expireTime;

  /// The name of the API key resource.
  final String keyName;
  final ApiKeyRestrictions restrictions;

  /// The timestamp of when the API key was last updated, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a>
  /// format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.
  final DateTime updateTime;

  /// The optional description for the API key resource.
  final String? description;

  ListKeysResponseEntry({
    required this.createTime,
    required this.expireTime,
    required this.keyName,
    required this.restrictions,
    required this.updateTime,
    this.description,
  });

  factory ListKeysResponseEntry.fromJson(Map<String, dynamic> json) {
    return ListKeysResponseEntry(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] ?? 0),
      expireTime: nonNullableTimeStampFromJson(json['ExpireTime'] ?? 0),
      keyName: (json['KeyName'] as String?) ?? '',
      restrictions: ApiKeyRestrictions.fromJson(
          (json['Restrictions'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final expireTime = this.expireTime;
    final keyName = this.keyName;
    final restrictions = this.restrictions;
    final updateTime = this.updateTime;
    final description = this.description;
    return {
      'CreateTime': iso8601ToJson(createTime),
      'ExpireTime': iso8601ToJson(expireTime),
      'KeyName': keyName,
      'Restrictions': restrictions,
      'UpdateTime': iso8601ToJson(updateTime),
      if (description != null) 'Description': description,
    };
  }
}

/// API Restrictions on the allowed actions, resources, and referers for an API
/// key resource.
///
/// @nodoc
class ApiKeyRestrictions {
  /// A list of allowed actions that an API key resource grants permissions to
  /// perform. You must have at least one action for each type of resource. For
  /// example, if you have a place resource, you must include at least one place
  /// action.
  ///
  /// The following are valid values for the actions.
  ///
  /// <ul>
  /// <li>
  /// <b>Map actions</b>
  ///
  /// <ul>
  /// <li>
  /// <code>geo:GetMap*</code> - Allows all actions needed for map rendering.
  /// </li>
  /// <li>
  /// <code>geo-maps:GetTile</code> - Allows retrieving map tiles.
  /// </li>
  /// <li>
  /// <code>geo-maps:GetStaticMap</code> - Allows retrieving static map images.
  /// </li>
  /// <li>
  /// <code>geo-maps:*</code> - Allows all actions related to map functionalities.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Place actions</b>
  ///
  /// <ul>
  /// <li>
  /// <code>geo:SearchPlaceIndexForText</code> - Allows geocoding.
  /// </li>
  /// <li>
  /// <code>geo:SearchPlaceIndexForPosition</code> - Allows reverse geocoding.
  /// </li>
  /// <li>
  /// <code>geo:SearchPlaceIndexForSuggestions</code> - Allows generating
  /// suggestions from text.
  /// </li>
  /// <li>
  /// <code>GetPlace</code> - Allows finding a place by place ID.
  /// </li>
  /// <li>
  /// <code>geo-places:Geocode</code> - Allows geocoding using place information.
  /// </li>
  /// <li>
  /// <code>geo-places:ReverseGeocode</code> - Allows reverse geocoding from
  /// location coordinates.
  /// </li>
  /// <li>
  /// <code>geo-places:SearchNearby</code> - Allows searching for places near a
  /// location.
  /// </li>
  /// <li>
  /// <code>geo-places:SearchText</code> - Allows searching for places based on
  /// text input.
  /// </li>
  /// <li>
  /// <code>geo-places:Autocomplete</code> - Allows auto-completion of place names
  /// based on text input.
  /// </li>
  /// <li>
  /// <code>geo-places:Suggest</code> - Allows generating suggestions for places
  /// based on partial input.
  /// </li>
  /// <li>
  /// <code>geo-places:GetPlace</code> - Allows finding a place by its ID.
  /// </li>
  /// <li>
  /// <code>geo-places:*</code> - Allows all actions related to place services.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Route actions</b>
  ///
  /// <ul>
  /// <li>
  /// <code>geo:CalculateRoute</code> - Allows point to point routing.
  /// </li>
  /// <li>
  /// <code>geo:CalculateRouteMatrix</code> - Allows calculating a matrix of
  /// routes.
  /// </li>
  /// <li>
  /// <code>geo-routes:CalculateRoutes</code> - Allows calculating multiple routes
  /// between points.
  /// </li>
  /// <li>
  /// <code>geo-routes:CalculateRouteMatrix</code> - Allows calculating a matrix
  /// of routes between points.
  /// </li>
  /// <li>
  /// <code>geo-routes:CalculateIsolines</code> - Allows calculating isolines for
  /// a given area.
  /// </li>
  /// <li>
  /// <code>geo-routes:OptimizeWaypoints</code> - Allows optimizing the order of
  /// waypoints in a route.
  /// </li>
  /// <li>
  /// <code>geo-routes:SnapToRoads</code> - Allows snapping a route to the nearest
  /// roads.
  /// </li>
  /// <li>
  /// <code>geo-routes:*</code> - Allows all actions related to routing
  /// functionalities.
  /// </li>
  /// </ul> </li>
  /// </ul> <note>
  /// You must use these strings exactly. For example, to provide access to map
  /// rendering, the only valid action is <code>geo:GetMap*</code> as an input to
  /// the list. <code>\["geo:GetMap*"\]</code> is valid but
  /// <code>\["geo:GetMapTile"\]</code> is not. Similarly, you cannot use
  /// <code>\["geo:SearchPlaceIndexFor*"\]</code> - you must list each of the
  /// Place actions separately.
  /// </note>
  final List<String> allowActions;

  /// A list of allowed resource ARNs that a API key bearer can perform actions
  /// on.
  ///
  /// <ul>
  /// <li>
  /// The ARN must be the correct ARN for a map, place, or route ARN. You may
  /// include wildcards in the resource-id to match multiple resources of the same
  /// type.
  /// </li>
  /// <li>
  /// The resources must be in the same <code>partition</code>,
  /// <code>region</code>, and <code>account-id</code> as the key that is being
  /// created.
  /// </li>
  /// <li>
  /// Other than wildcards, you must include the full ARN, including the
  /// <code>arn</code>, <code>partition</code>, <code>service</code>,
  /// <code>region</code>, <code>account-id</code> and <code>resource-id</code>
  /// delimited by colons (:).
  /// </li>
  /// <li>
  /// No spaces allowed, even with wildcards. For example,
  /// <code>arn:aws:geo:region:<i>account-id</i>:map/ExampleMap*</code>.
  /// </li>
  /// </ul>
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  final List<String> allowResources;

  /// An optional list of allowed Android applications for which requests must
  /// originate from. Requests using this API key from other sources will not be
  /// allowed.
  final List<AndroidApp>? allowAndroidApps;

  /// An optional list of allowed Apple applications for which requests must
  /// originate from. Requests using this API key from other sources will not be
  /// allowed.
  final List<AppleApp>? allowAppleApps;

  /// An optional list of allowed HTTP referers for which requests must originate
  /// from. Requests using this API key from other domains will not be allowed.
  ///
  /// Requirements:
  ///
  /// <ul>
  /// <li>
  /// Contain only alphanumeric characters (A–Z, a–z, 0–9) or any symbols in this
  /// list <code>$\-._+!*`(),;/?:@=&amp;</code>
  /// </li>
  /// <li>
  /// May contain a percent (%) if followed by 2 hexadecimal digits (A-F, a-f,
  /// 0-9); this is used for URL encoding purposes.
  /// </li>
  /// <li>
  /// May contain wildcard characters question mark (?) and asterisk (*).
  ///
  /// Question mark (?) will replace any single character (including hexadecimal
  /// digits).
  ///
  /// Asterisk (*) will replace any multiple characters (including multiple
  /// hexadecimal digits).
  /// </li>
  /// <li>
  /// No spaces allowed. For example, <code>https://example.com</code>.
  /// </li>
  /// </ul>
  final List<String>? allowReferers;

  ApiKeyRestrictions({
    required this.allowActions,
    required this.allowResources,
    this.allowAndroidApps,
    this.allowAppleApps,
    this.allowReferers,
  });

  factory ApiKeyRestrictions.fromJson(Map<String, dynamic> json) {
    return ApiKeyRestrictions(
      allowActions: ((json['AllowActions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allowResources: ((json['AllowResources'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allowAndroidApps: (json['AllowAndroidApps'] as List?)
          ?.nonNulls
          .map((e) => AndroidApp.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowAppleApps: (json['AllowAppleApps'] as List?)
          ?.nonNulls
          .map((e) => AppleApp.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowReferers: (json['AllowReferers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowActions = this.allowActions;
    final allowResources = this.allowResources;
    final allowAndroidApps = this.allowAndroidApps;
    final allowAppleApps = this.allowAppleApps;
    final allowReferers = this.allowReferers;
    return {
      'AllowActions': allowActions,
      'AllowResources': allowResources,
      if (allowAndroidApps != null) 'AllowAndroidApps': allowAndroidApps,
      if (allowAppleApps != null) 'AllowAppleApps': allowAppleApps,
      if (allowReferers != null) 'AllowReferers': allowReferers,
    };
  }
}

/// Unique identifying information for an Apple app (iOS, macOS, tvOS and
/// watchOS). Consists of an Apple Bundle ID.
///
/// @nodoc
class AppleApp {
  /// The unique identifier of the app across all Apple platforms (iOS, macOS,
  /// tvOS and watchOS).
  ///
  /// Example: <code>com.mydomain.appname</code>
  final String bundleId;

  AppleApp({
    required this.bundleId,
  });

  factory AppleApp.fromJson(Map<String, dynamic> json) {
    return AppleApp(
      bundleId: (json['BundleId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    return {
      'BundleId': bundleId,
    };
  }
}

/// Unique identifying information for an Android app. Consists of a package
/// name and a 20 byte SHA-1 certificate fingerprint.
///
/// @nodoc
class AndroidApp {
  /// 20 byte SHA-1 certificate fingerprint associated with the Android app
  /// signing certificate.
  ///
  /// Example:
  /// <code>BB:0D:AC:74:D3:21:E1:43:67:71:9B:62:91:AF:A1:66:6E:44:5D:75</code>
  final String certificateFingerprint;

  /// Unique package name identifier for an Android app.
  ///
  /// Example: <code>com.mydomain.appname</code>
  final String package;

  AndroidApp({
    required this.certificateFingerprint,
    required this.package,
  });

  factory AndroidApp.fromJson(Map<String, dynamic> json) {
    return AndroidApp(
      certificateFingerprint: (json['CertificateFingerprint'] as String?) ?? '',
      package: (json['Package'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final certificateFingerprint = this.certificateFingerprint;
    final package = this.package;
    return {
      'CertificateFingerprint': certificateFingerprint,
      'Package': package,
    };
  }
}

/// Options for filtering API keys.
///
/// @nodoc
class ApiKeyFilter {
  /// Filter on <code>Active</code> or <code>Expired</code> API keys.
  final Status? keyStatus;

  ApiKeyFilter({
    this.keyStatus,
  });

  Map<String, dynamic> toJson() {
    final keyStatus = this.keyStatus;
    return {
      if (keyStatus != null) 'KeyStatus': keyStatus.value,
    };
  }
}

/// @nodoc
class Status {
  static const active = Status._('Active');
  static const expired = Status._('Expired');

  final String value;

  const Status._(this.value);

  static const values = [active, expired];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
