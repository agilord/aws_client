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

/// Amazon Cognito Sync provides an AWS service and client library that enable
/// cross-device syncing of application-related user data. High-level client
/// libraries are available for both iOS and Android. You can use these
/// libraries to persist data locally so that it's available even if the device
/// is offline. Developer credentials don't need to be stored on the mobile
/// device to access the service. You can use Amazon Cognito to obtain a
/// normalized user ID and credentials. User data is persisted in a dataset that
/// can store up to 1 MB of key-value pairs, and you can have up to 20 datasets
/// per user identity.
class CognitoSync {
  final _s.RestJsonProtocol _protocol;
  CognitoSync({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cognito-sync',
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

  /// Initiates a bulk publish of all existing datasets for an Identity Pool to
  /// the configured stream. Customers are limited to one successful bulk
  /// publish per 24 hours. Bulk publish is an asynchronous request, customers
  /// can see the status of the request via the GetBulkPublishDetails operation.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [DuplicateRequestException].
  /// May throw [AlreadyStreamedException].
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<BulkPublishResponse> bulkPublish({
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/bulkpublish',
      exceptionFnMap: _exceptionFns,
    );
    return BulkPublishResponse.fromJson(response);
  }

  /// Deletes the specific dataset. The dataset will be deleted permanently, and
  /// the action can't be undone. Datasets that this dataset was merged with
  /// will no longer report the merge. Any subsequent operation on this dataset
  /// will result in a ResourceNotFoundException.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [datasetName] :
  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  /// '_' (underscore), '-' (dash), and '.' (dot).
  ///
  /// Parameter [identityId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<DeleteDatasetResponse> deleteDataset({
    required String datasetName,
    required String identityId,
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatasetResponse.fromJson(response);
  }

  /// Gets meta data about a dataset by identity and dataset name. With Amazon
  /// Cognito Sync, each identity has access only to its own data. Thus, the
  /// credentials used to make this API call need to have access to the identity
  /// data.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials. You should use Cognito Identity
  /// credentials to make this API call.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [datasetName] :
  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  /// '_' (underscore), '-' (dash), and '.' (dot).
  ///
  /// Parameter [identityId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetName,
    required String identityId,
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDatasetResponse.fromJson(response);
  }

  /// Gets usage details (for example, data storage) about a particular identity
  /// pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<DescribeIdentityPoolUsageResponse> describeIdentityPoolUsage({
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/identitypools/${Uri.encodeComponent(identityPoolId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIdentityPoolUsageResponse.fromJson(response);
  }

  /// Gets usage information for an identity, including number of datasets and
  /// data usage.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [identityId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<DescribeIdentityUsageResponse> describeIdentityUsage({
    required String identityId,
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIdentityUsageResponse.fromJson(response);
  }

  /// Get the status of the last BulkPublish operation for an identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  Future<GetBulkPublishDetailsResponse> getBulkPublishDetails({
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/getBulkPublishDetails',
      exceptionFnMap: _exceptionFns,
    );
    return GetBulkPublishDetailsResponse.fromJson(response);
  }

  /// Gets the events and the corresponding Lambda functions associated with an
  /// identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [identityPoolId] :
  /// The Cognito Identity Pool ID for the request
  Future<GetCognitoEventsResponse> getCognitoEvents({
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/events',
      exceptionFnMap: _exceptionFns,
    );
    return GetCognitoEventsResponse.fromJson(response);
  }

  /// Gets the configuration settings of an identity pool.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// This is the ID of the pool for which to return a configuration.
  Future<GetIdentityPoolConfigurationResponse> getIdentityPoolConfiguration({
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdentityPoolConfigurationResponse.fromJson(response);
  }

  /// Lists datasets for an identity. With Amazon Cognito Sync, each identity
  /// has access only to its own data. Thus, the credentials used to make this
  /// API call need to have access to the identity data.
  ///
  /// ListDatasets can be called with temporary user credentials provided by
  /// Cognito Identity or with developer credentials. You should use the Cognito
  /// Identity credentials to make this API call.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [identityId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for obtaining the next page of results.
  Future<ListDatasetsResponse> listDatasets({
    required String identityId,
    required String identityPoolId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasetsResponse.fromJson(response);
  }

  /// Gets a list of identity pools registered with Cognito.
  ///
  /// ListIdentityPoolUsage can only be called with developer credentials. You
  /// cannot make this API call with the temporary user credentials provided by
  /// Cognito Identity.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for obtaining the next page of results.
  Future<ListIdentityPoolUsageResponse> listIdentityPoolUsage({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/identitypools',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentityPoolUsageResponse.fromJson(response);
  }

  /// Gets paginated records, optionally changed after a particular sync count
  /// for a dataset and identity. With Amazon Cognito Sync, each identity has
  /// access only to its own data. Thus, the credentials used to make this API
  /// call need to have access to the identity data.
  ///
  /// ListRecords can be called with temporary user credentials provided by
  /// Cognito Identity or with developer credentials. You should use Cognito
  /// Identity credentials to make this API call.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [datasetName] :
  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  /// '_' (underscore), '-' (dash), and '.' (dot).
  ///
  /// Parameter [identityId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [lastSyncCount] :
  /// The last server sync count for this record.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned.
  ///
  /// Parameter [nextToken] :
  /// A pagination token for obtaining the next page of results.
  ///
  /// Parameter [syncSessionToken] :
  /// A token containing a session ID, identity ID, and expiration.
  Future<ListRecordsResponse> listRecords({
    required String datasetName,
    required String identityId,
    required String identityPoolId,
    int? lastSyncCount,
    int? maxResults,
    String? nextToken,
    String? syncSessionToken,
  }) async {
    final $query = <String, List<String>>{
      if (lastSyncCount != null) 'lastSyncCount': [lastSyncCount.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (syncSessionToken != null) 'syncSessionToken': [syncSessionToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}/records',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecordsResponse.fromJson(response);
  }

  /// Registers a device to receive push sync notifications.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidConfigurationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [identityId] :
  /// The unique ID for this identity.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// Here, the ID of the pool that the identity belongs to.
  ///
  /// Parameter [platform] :
  /// The SNS platform type (e.g. GCM, SDM, APNS, APNS_SANDBOX).
  ///
  /// Parameter [token] :
  /// The push token.
  Future<RegisterDeviceResponse> registerDevice({
    required String identityId,
    required String identityPoolId,
    required Platform platform,
    required String token,
  }) async {
    final $payload = <String, dynamic>{
      'Platform': platform.toValue(),
      'Token': token,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identity/${Uri.encodeComponent(identityId)}/device',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterDeviceResponse.fromJson(response);
  }

  /// Sets the AWS Lambda function for a given event type for an identity pool.
  /// This request only updates the key/value pair specified. Other key/values
  /// pairs are not updated. To remove a key value pair, pass a empty value for
  /// the particular key.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [events] :
  /// The events to configure
  ///
  /// Parameter [identityPoolId] :
  /// The Cognito Identity Pool to use when configuring Cognito Events
  Future<void> setCognitoEvents({
    required Map<String, String> events,
    required String identityPoolId,
  }) async {
    final $payload = <String, dynamic>{
      'Events': events,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/events',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the necessary configuration for push sync.
  ///
  /// This API can only be called with developer credentials. You cannot call
  /// this API with the temporary user credentials provided by Cognito Identity.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// This is the ID of the pool to modify.
  ///
  /// Parameter [cognitoStreams] :
  /// Options to apply to this identity pool for Amazon Cognito streams.
  ///
  /// Parameter [pushSync] :
  /// Options to apply to this identity pool for push synchronization.
  Future<SetIdentityPoolConfigurationResponse> setIdentityPoolConfiguration({
    required String identityPoolId,
    CognitoStreams? cognitoStreams,
    PushSync? pushSync,
  }) async {
    final $payload = <String, dynamic>{
      if (cognitoStreams != null) 'CognitoStreams': cognitoStreams,
      if (pushSync != null) 'PushSync': pushSync,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return SetIdentityPoolConfigurationResponse.fromJson(response);
  }

  /// Subscribes to receive notifications when a dataset is modified by another
  /// device.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidConfigurationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset to subcribe to.
  ///
  /// Parameter [deviceId] :
  /// The unique ID generated for this device by Cognito.
  ///
  /// Parameter [identityId] :
  /// Unique ID for this identity.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// The ID of the pool to which the identity belongs.
  Future<void> subscribeToDataset({
    required String datasetName,
    required String deviceId,
    required String identityId,
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}/subscriptions/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Unsubscribes from receiving notifications when a dataset is modified by
  /// another device.
  ///
  /// This API can only be called with temporary credentials provided by Cognito
  /// Identity. You cannot call this API with developer credentials.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidConfigurationException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [datasetName] :
  /// The name of the dataset from which to unsubcribe.
  ///
  /// Parameter [deviceId] :
  /// The unique ID generated for this device by Cognito.
  ///
  /// Parameter [identityId] :
  /// Unique ID for this identity.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// The ID of the pool to which this identity belongs.
  Future<void> unsubscribeFromDataset({
    required String datasetName,
    required String deviceId,
    required String identityId,
    required String identityPoolId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}/subscriptions/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Posts updates to records and adds and deletes records for a dataset and
  /// user.
  ///
  /// The sync count in the record patch is your last known sync count for that
  /// record. The server will reject an UpdateRecords request with a
  /// ResourceConflictException if you try to patch a record with a new value
  /// but a stale sync count.
  ///
  /// For example, if the sync count on the server is 5 for a key called
  /// highScore and you try and submit a new highScore with sync count of 4, the
  /// request will be rejected. To obtain the current sync count for a record,
  /// call ListRecords. On a successful update of the record, the response
  /// returns the new sync count for that record. You should present that sync
  /// count the next time you try to update that same record. When the record
  /// does not exist, specify the sync count as 0.
  ///
  /// This API can be called with temporary user credentials provided by Cognito
  /// Identity or with developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InvalidLambdaFunctionOutputException].
  /// May throw [LambdaThrottledException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [datasetName] :
  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9,
  /// '_' (underscore), '-' (dash), and '.' (dot).
  ///
  /// Parameter [identityId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [identityPoolId] :
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  ///
  /// Parameter [syncSessionToken] :
  /// The SyncSessionToken returned by a previous call to ListRecords for this
  /// dataset and identity.
  ///
  /// Parameter [clientContext] :
  /// Intended to supply a device ID that will populate the lastModifiedBy field
  /// referenced in other methods. The ClientContext field is not yet
  /// implemented.
  ///
  /// Parameter [deviceId] :
  /// The unique ID generated for this device by Cognito.
  ///
  /// Parameter [recordPatches] :
  /// A list of patch operations.
  Future<UpdateRecordsResponse> updateRecords({
    required String datasetName,
    required String identityId,
    required String identityPoolId,
    required String syncSessionToken,
    String? clientContext,
    String? deviceId,
    List<RecordPatch>? recordPatches,
  }) async {
    final headers = <String, String>{
      if (clientContext != null)
        'x-amz-Client-Context': clientContext.toString(),
    };
    final $payload = <String, dynamic>{
      'SyncSessionToken': syncSessionToken,
      if (deviceId != null) 'DeviceId': deviceId,
      if (recordPatches != null) 'RecordPatches': recordPatches,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecordsResponse.fromJson(response);
  }
}

/// The output for the BulkPublish operation.
class BulkPublishResponse {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String? identityPoolId;

  BulkPublishResponse({
    this.identityPoolId,
  });

  factory BulkPublishResponse.fromJson(Map<String, dynamic> json) {
    return BulkPublishResponse(
      identityPoolId: json['IdentityPoolId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolId = this.identityPoolId;
    return {
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
    };
  }
}

enum BulkPublishStatus {
  notStarted,
  inProgress,
  failed,
  succeeded,
}

extension BulkPublishStatusValueExtension on BulkPublishStatus {
  String toValue() {
    switch (this) {
      case BulkPublishStatus.notStarted:
        return 'NOT_STARTED';
      case BulkPublishStatus.inProgress:
        return 'IN_PROGRESS';
      case BulkPublishStatus.failed:
        return 'FAILED';
      case BulkPublishStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension BulkPublishStatusFromString on String {
  BulkPublishStatus toBulkPublishStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return BulkPublishStatus.notStarted;
      case 'IN_PROGRESS':
        return BulkPublishStatus.inProgress;
      case 'FAILED':
        return BulkPublishStatus.failed;
      case 'SUCCEEDED':
        return BulkPublishStatus.succeeded;
    }
    throw Exception('$this is not known in enum BulkPublishStatus');
  }
}

/// Configuration options for configure Cognito streams.
class CognitoStreams {
  /// The ARN of the role Amazon Cognito can assume in order to publish to the
  /// stream. This role must grant access to Amazon Cognito (cognito-sync) to
  /// invoke PutRecord on your Cognito stream.
  final String? roleArn;

  /// The name of the Cognito stream to receive updates. This stream must be in
  /// the developers account and in the same region as the identity pool.
  final String? streamName;

  /// Status of the Cognito streams. Valid values are:
  /// ENABLED - Streaming of updates to identity pool is enabled.
  ///
  /// DISABLED - Streaming of updates to identity pool is disabled. Bulk publish
  /// will also fail if StreamingStatus is DISABLED.
  final StreamingStatus? streamingStatus;

  CognitoStreams({
    this.roleArn,
    this.streamName,
    this.streamingStatus,
  });

  factory CognitoStreams.fromJson(Map<String, dynamic> json) {
    return CognitoStreams(
      roleArn: json['RoleArn'] as String?,
      streamName: json['StreamName'] as String?,
      streamingStatus:
          (json['StreamingStatus'] as String?)?.toStreamingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final streamName = this.streamName;
    final streamingStatus = this.streamingStatus;
    return {
      if (roleArn != null) 'RoleArn': roleArn,
      if (streamName != null) 'StreamName': streamName,
      if (streamingStatus != null) 'StreamingStatus': streamingStatus.toValue(),
    };
  }
}

/// A collection of data for an identity pool. An identity pool can have
/// multiple datasets. A dataset is per identity and can be general or
/// associated with a particular entity in an application (like a saved game).
/// Datasets are automatically created if they don't exist. Data is synced by
/// dataset, and a dataset can hold up to 1MB of key-value pairs.
class Dataset {
  /// Date on which the dataset was created.
  final DateTime? creationDate;

  /// Total size in bytes of the records in this dataset.
  final int? dataStorage;

  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_'
  /// (underscore), '-' (dash), and '.' (dot).
  final String? datasetName;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String? identityId;

  /// The device that made the last change to this dataset.
  final String? lastModifiedBy;

  /// Date when the dataset was last modified.
  final DateTime? lastModifiedDate;

  /// Number of records in this dataset.
  final int? numRecords;

  Dataset({
    this.creationDate,
    this.dataStorage,
    this.datasetName,
    this.identityId,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.numRecords,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      creationDate: timeStampFromJson(json['CreationDate']),
      dataStorage: json['DataStorage'] as int?,
      datasetName: json['DatasetName'] as String?,
      identityId: json['IdentityId'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      numRecords: json['NumRecords'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final dataStorage = this.dataStorage;
    final datasetName = this.datasetName;
    final identityId = this.identityId;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final numRecords = this.numRecords;
    return {
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (datasetName != null) 'DatasetName': datasetName,
      if (identityId != null) 'IdentityId': identityId,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (numRecords != null) 'NumRecords': numRecords,
    };
  }
}

/// Response to a successful DeleteDataset request.
class DeleteDatasetResponse {
  /// A collection of data for an identity pool. An identity pool can have
  /// multiple datasets. A dataset is per identity and can be general or
  /// associated with a particular entity in an application (like a saved game).
  /// Datasets are automatically created if they don't exist. Data is synced by
  /// dataset, and a dataset can hold up to 1MB of key-value pairs.
  final Dataset? dataset;

  DeleteDatasetResponse({
    this.dataset,
  });

  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDatasetResponse(
      dataset: json['Dataset'] != null
          ? Dataset.fromJson(json['Dataset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      if (dataset != null) 'Dataset': dataset,
    };
  }
}

/// Response to a successful DescribeDataset request.
class DescribeDatasetResponse {
  /// Meta data for a collection of data for an identity. An identity can have
  /// multiple datasets. A dataset can be general or associated with a particular
  /// entity in an application (like a saved game). Datasets are automatically
  /// created if they don't exist. Data is synced by dataset, and a dataset can
  /// hold up to 1MB of key-value pairs.
  final Dataset? dataset;

  DescribeDatasetResponse({
    this.dataset,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      dataset: json['Dataset'] != null
          ? Dataset.fromJson(json['Dataset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      if (dataset != null) 'Dataset': dataset,
    };
  }
}

/// Response to a successful DescribeIdentityPoolUsage request.
class DescribeIdentityPoolUsageResponse {
  /// Information about the usage of the identity pool.
  final IdentityPoolUsage? identityPoolUsage;

  DescribeIdentityPoolUsageResponse({
    this.identityPoolUsage,
  });

  factory DescribeIdentityPoolUsageResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeIdentityPoolUsageResponse(
      identityPoolUsage: json['IdentityPoolUsage'] != null
          ? IdentityPoolUsage.fromJson(
              json['IdentityPoolUsage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolUsage = this.identityPoolUsage;
    return {
      if (identityPoolUsage != null) 'IdentityPoolUsage': identityPoolUsage,
    };
  }
}

/// The response to a successful DescribeIdentityUsage request.
class DescribeIdentityUsageResponse {
  /// Usage information for the identity.
  final IdentityUsage? identityUsage;

  DescribeIdentityUsageResponse({
    this.identityUsage,
  });

  factory DescribeIdentityUsageResponse.fromJson(Map<String, dynamic> json) {
    return DescribeIdentityUsageResponse(
      identityUsage: json['IdentityUsage'] != null
          ? IdentityUsage.fromJson(
              json['IdentityUsage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identityUsage = this.identityUsage;
    return {
      if (identityUsage != null) 'IdentityUsage': identityUsage,
    };
  }
}

/// The output for the GetBulkPublishDetails operation.
class GetBulkPublishDetailsResponse {
  /// If BulkPublishStatus is SUCCEEDED, the time the last bulk publish operation
  /// completed.
  final DateTime? bulkPublishCompleteTime;

  /// The date/time at which the last bulk publish was initiated.
  final DateTime? bulkPublishStartTime;

  /// Status of the last bulk publish operation, valid values are:
  /// NOT_STARTED - No bulk publish has been requested for this identity pool
  ///
  /// IN_PROGRESS - Data is being published to the configured stream
  ///
  /// SUCCEEDED - All data for the identity pool has been published to the
  /// configured stream
  ///
  /// FAILED - Some portion of the data has failed to publish, check
  /// FailureMessage for the cause.
  final BulkPublishStatus? bulkPublishStatus;

  /// If BulkPublishStatus is FAILED this field will contain the error message
  /// that caused the bulk publish to fail.
  final String? failureMessage;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String? identityPoolId;

  GetBulkPublishDetailsResponse({
    this.bulkPublishCompleteTime,
    this.bulkPublishStartTime,
    this.bulkPublishStatus,
    this.failureMessage,
    this.identityPoolId,
  });

  factory GetBulkPublishDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetBulkPublishDetailsResponse(
      bulkPublishCompleteTime:
          timeStampFromJson(json['BulkPublishCompleteTime']),
      bulkPublishStartTime: timeStampFromJson(json['BulkPublishStartTime']),
      bulkPublishStatus:
          (json['BulkPublishStatus'] as String?)?.toBulkPublishStatus(),
      failureMessage: json['FailureMessage'] as String?,
      identityPoolId: json['IdentityPoolId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bulkPublishCompleteTime = this.bulkPublishCompleteTime;
    final bulkPublishStartTime = this.bulkPublishStartTime;
    final bulkPublishStatus = this.bulkPublishStatus;
    final failureMessage = this.failureMessage;
    final identityPoolId = this.identityPoolId;
    return {
      if (bulkPublishCompleteTime != null)
        'BulkPublishCompleteTime': unixTimestampToJson(bulkPublishCompleteTime),
      if (bulkPublishStartTime != null)
        'BulkPublishStartTime': unixTimestampToJson(bulkPublishStartTime),
      if (bulkPublishStatus != null)
        'BulkPublishStatus': bulkPublishStatus.toValue(),
      if (failureMessage != null) 'FailureMessage': failureMessage,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
    };
  }
}

/// The response from the GetCognitoEvents request
class GetCognitoEventsResponse {
  /// The Cognito Events returned from the GetCognitoEvents request
  final Map<String, String>? events;

  GetCognitoEventsResponse({
    this.events,
  });

  factory GetCognitoEventsResponse.fromJson(Map<String, dynamic> json) {
    return GetCognitoEventsResponse(
      events: (json['Events'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    return {
      if (events != null) 'Events': events,
    };
  }
}

/// The output for the GetIdentityPoolConfiguration operation.
class GetIdentityPoolConfigurationResponse {
  /// Options to apply to this identity pool for Amazon Cognito streams.
  final CognitoStreams? cognitoStreams;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  final String? identityPoolId;

  /// Options to apply to this identity pool for push synchronization.
  final PushSync? pushSync;

  GetIdentityPoolConfigurationResponse({
    this.cognitoStreams,
    this.identityPoolId,
    this.pushSync,
  });

  factory GetIdentityPoolConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetIdentityPoolConfigurationResponse(
      cognitoStreams: json['CognitoStreams'] != null
          ? CognitoStreams.fromJson(
              json['CognitoStreams'] as Map<String, dynamic>)
          : null,
      identityPoolId: json['IdentityPoolId'] as String?,
      pushSync: json['PushSync'] != null
          ? PushSync.fromJson(json['PushSync'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cognitoStreams = this.cognitoStreams;
    final identityPoolId = this.identityPoolId;
    final pushSync = this.pushSync;
    return {
      if (cognitoStreams != null) 'CognitoStreams': cognitoStreams,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (pushSync != null) 'PushSync': pushSync,
    };
  }
}

/// Usage information for the identity pool.
class IdentityPoolUsage {
  /// Data storage information for the identity pool.
  final int? dataStorage;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String? identityPoolId;

  /// Date on which the identity pool was last modified.
  final DateTime? lastModifiedDate;

  /// Number of sync sessions for the identity pool.
  final int? syncSessionsCount;

  IdentityPoolUsage({
    this.dataStorage,
    this.identityPoolId,
    this.lastModifiedDate,
    this.syncSessionsCount,
  });

  factory IdentityPoolUsage.fromJson(Map<String, dynamic> json) {
    return IdentityPoolUsage(
      dataStorage: json['DataStorage'] as int?,
      identityPoolId: json['IdentityPoolId'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      syncSessionsCount: json['SyncSessionsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataStorage = this.dataStorage;
    final identityPoolId = this.identityPoolId;
    final lastModifiedDate = this.lastModifiedDate;
    final syncSessionsCount = this.syncSessionsCount;
    return {
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (syncSessionsCount != null) 'SyncSessionsCount': syncSessionsCount,
    };
  }
}

/// Usage information for the identity.
class IdentityUsage {
  /// Total data storage for this identity.
  final int? dataStorage;

  /// Number of datasets for the identity.
  final int? datasetCount;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String? identityId;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  final String? identityPoolId;

  /// Date on which the identity was last modified.
  final DateTime? lastModifiedDate;

  IdentityUsage({
    this.dataStorage,
    this.datasetCount,
    this.identityId,
    this.identityPoolId,
    this.lastModifiedDate,
  });

  factory IdentityUsage.fromJson(Map<String, dynamic> json) {
    return IdentityUsage(
      dataStorage: json['DataStorage'] as int?,
      datasetCount: json['DatasetCount'] as int?,
      identityId: json['IdentityId'] as String?,
      identityPoolId: json['IdentityPoolId'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataStorage = this.dataStorage;
    final datasetCount = this.datasetCount;
    final identityId = this.identityId;
    final identityPoolId = this.identityPoolId;
    final lastModifiedDate = this.lastModifiedDate;
    return {
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (datasetCount != null) 'DatasetCount': datasetCount,
      if (identityId != null) 'IdentityId': identityId,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
    };
  }
}

/// Returned for a successful ListDatasets request.
class ListDatasetsResponse {
  /// Number of datasets returned.
  final int? count;

  /// A set of datasets.
  final List<Dataset>? datasets;

  /// A pagination token for obtaining the next page of results.
  final String? nextToken;

  ListDatasetsResponse({
    this.count,
    this.datasets,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      count: json['Count'] as int?,
      datasets: (json['Datasets'] as List?)
          ?.whereNotNull()
          .map((e) => Dataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final datasets = this.datasets;
    final nextToken = this.nextToken;
    return {
      if (count != null) 'Count': count,
      if (datasets != null) 'Datasets': datasets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returned for a successful ListIdentityPoolUsage request.
class ListIdentityPoolUsageResponse {
  /// Total number of identities for the identity pool.
  final int? count;

  /// Usage information for the identity pools.
  final List<IdentityPoolUsage>? identityPoolUsages;

  /// The maximum number of results to be returned.
  final int? maxResults;

  /// A pagination token for obtaining the next page of results.
  final String? nextToken;

  ListIdentityPoolUsageResponse({
    this.count,
    this.identityPoolUsages,
    this.maxResults,
    this.nextToken,
  });

  factory ListIdentityPoolUsageResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentityPoolUsageResponse(
      count: json['Count'] as int?,
      identityPoolUsages: (json['IdentityPoolUsages'] as List?)
          ?.whereNotNull()
          .map((e) => IdentityPoolUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxResults: json['MaxResults'] as int?,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final identityPoolUsages = this.identityPoolUsages;
    final maxResults = this.maxResults;
    final nextToken = this.nextToken;
    return {
      if (count != null) 'Count': count,
      if (identityPoolUsages != null) 'IdentityPoolUsages': identityPoolUsages,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returned for a successful ListRecordsRequest.
class ListRecordsResponse {
  /// Total number of records.
  final int? count;

  /// A boolean value specifying whether to delete the dataset locally.
  final bool? datasetDeletedAfterRequestedSyncCount;

  /// Indicates whether the dataset exists.
  final bool? datasetExists;

  /// Server sync count for this dataset.
  final int? datasetSyncCount;

  /// The user/device that made the last change to this record.
  final String? lastModifiedBy;

  /// Names of merged datasets.
  final List<String>? mergedDatasetNames;

  /// A pagination token for obtaining the next page of results.
  final String? nextToken;

  /// A list of all records.
  final List<Record>? records;

  /// A token containing a session ID, identity ID, and expiration.
  final String? syncSessionToken;

  ListRecordsResponse({
    this.count,
    this.datasetDeletedAfterRequestedSyncCount,
    this.datasetExists,
    this.datasetSyncCount,
    this.lastModifiedBy,
    this.mergedDatasetNames,
    this.nextToken,
    this.records,
    this.syncSessionToken,
  });

  factory ListRecordsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecordsResponse(
      count: json['Count'] as int?,
      datasetDeletedAfterRequestedSyncCount:
          json['DatasetDeletedAfterRequestedSyncCount'] as bool?,
      datasetExists: json['DatasetExists'] as bool?,
      datasetSyncCount: json['DatasetSyncCount'] as int?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      mergedDatasetNames: (json['MergedDatasetNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
      records: (json['Records'] as List?)
          ?.whereNotNull()
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
      syncSessionToken: json['SyncSessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final datasetDeletedAfterRequestedSyncCount =
        this.datasetDeletedAfterRequestedSyncCount;
    final datasetExists = this.datasetExists;
    final datasetSyncCount = this.datasetSyncCount;
    final lastModifiedBy = this.lastModifiedBy;
    final mergedDatasetNames = this.mergedDatasetNames;
    final nextToken = this.nextToken;
    final records = this.records;
    final syncSessionToken = this.syncSessionToken;
    return {
      if (count != null) 'Count': count,
      if (datasetDeletedAfterRequestedSyncCount != null)
        'DatasetDeletedAfterRequestedSyncCount':
            datasetDeletedAfterRequestedSyncCount,
      if (datasetExists != null) 'DatasetExists': datasetExists,
      if (datasetSyncCount != null) 'DatasetSyncCount': datasetSyncCount,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (mergedDatasetNames != null) 'MergedDatasetNames': mergedDatasetNames,
      if (nextToken != null) 'NextToken': nextToken,
      if (records != null) 'Records': records,
      if (syncSessionToken != null) 'SyncSessionToken': syncSessionToken,
    };
  }
}

enum Operation {
  replace,
  remove,
}

extension OperationValueExtension on Operation {
  String toValue() {
    switch (this) {
      case Operation.replace:
        return 'replace';
      case Operation.remove:
        return 'remove';
    }
  }
}

extension OperationFromString on String {
  Operation toOperation() {
    switch (this) {
      case 'replace':
        return Operation.replace;
      case 'remove':
        return Operation.remove;
    }
    throw Exception('$this is not known in enum Operation');
  }
}

enum Platform {
  apns,
  apnsSandbox,
  gcm,
  adm,
}

extension PlatformValueExtension on Platform {
  String toValue() {
    switch (this) {
      case Platform.apns:
        return 'APNS';
      case Platform.apnsSandbox:
        return 'APNS_SANDBOX';
      case Platform.gcm:
        return 'GCM';
      case Platform.adm:
        return 'ADM';
    }
  }
}

extension PlatformFromString on String {
  Platform toPlatform() {
    switch (this) {
      case 'APNS':
        return Platform.apns;
      case 'APNS_SANDBOX':
        return Platform.apnsSandbox;
      case 'GCM':
        return Platform.gcm;
      case 'ADM':
        return Platform.adm;
    }
    throw Exception('$this is not known in enum Platform');
  }
}

/// Configuration options to be applied to the identity pool.
class PushSync {
  /// List of SNS platform application ARNs that could be used by clients.
  final List<String>? applicationArns;

  /// A role configured to allow Cognito to call SNS on behalf of the developer.
  final String? roleArn;

  PushSync({
    this.applicationArns,
    this.roleArn,
  });

  factory PushSync.fromJson(Map<String, dynamic> json) {
    return PushSync(
      applicationArns: (json['ApplicationArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArns = this.applicationArns;
    final roleArn = this.roleArn;
    return {
      if (applicationArns != null) 'ApplicationArns': applicationArns,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// The basic data structure of a dataset.
class Record {
  /// The last modified date of the client device.
  final DateTime? deviceLastModifiedDate;

  /// The key for the record.
  final String? key;

  /// The user/device that made the last change to this record.
  final String? lastModifiedBy;

  /// The date on which the record was last modified.
  final DateTime? lastModifiedDate;

  /// The server sync count for this record.
  final int? syncCount;

  /// The value for the record.
  final String? value;

  Record({
    this.deviceLastModifiedDate,
    this.key,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.syncCount,
    this.value,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      deviceLastModifiedDate: timeStampFromJson(json['DeviceLastModifiedDate']),
      key: json['Key'] as String?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      syncCount: json['SyncCount'] as int?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceLastModifiedDate = this.deviceLastModifiedDate;
    final key = this.key;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final syncCount = this.syncCount;
    final value = this.value;
    return {
      if (deviceLastModifiedDate != null)
        'DeviceLastModifiedDate': unixTimestampToJson(deviceLastModifiedDate),
      if (key != null) 'Key': key,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (syncCount != null) 'SyncCount': syncCount,
      if (value != null) 'Value': value,
    };
  }
}

/// An update operation for a record.
class RecordPatch {
  /// The key associated with the record patch.
  final String key;

  /// An operation, either replace or remove.
  final Operation op;

  /// Last known server sync count for this record. Set to 0 if unknown.
  final int syncCount;

  /// The last modified date of the client device.
  final DateTime? deviceLastModifiedDate;

  /// The value associated with the record patch.
  final String? value;

  RecordPatch({
    required this.key,
    required this.op,
    required this.syncCount,
    this.deviceLastModifiedDate,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final op = this.op;
    final syncCount = this.syncCount;
    final deviceLastModifiedDate = this.deviceLastModifiedDate;
    final value = this.value;
    return {
      'Key': key,
      'Op': op.toValue(),
      'SyncCount': syncCount,
      if (deviceLastModifiedDate != null)
        'DeviceLastModifiedDate': unixTimestampToJson(deviceLastModifiedDate),
      if (value != null) 'Value': value,
    };
  }
}

/// Response to a RegisterDevice request.
class RegisterDeviceResponse {
  /// The unique ID generated for this device by Cognito.
  final String? deviceId;

  RegisterDeviceResponse({
    this.deviceId,
  });

  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) {
    return RegisterDeviceResponse(
      deviceId: json['DeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    return {
      if (deviceId != null) 'DeviceId': deviceId,
    };
  }
}

/// The output for the SetIdentityPoolConfiguration operation
class SetIdentityPoolConfigurationResponse {
  /// Options to apply to this identity pool for Amazon Cognito streams.
  final CognitoStreams? cognitoStreams;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  final String? identityPoolId;

  /// Options to apply to this identity pool for push synchronization.
  final PushSync? pushSync;

  SetIdentityPoolConfigurationResponse({
    this.cognitoStreams,
    this.identityPoolId,
    this.pushSync,
  });

  factory SetIdentityPoolConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return SetIdentityPoolConfigurationResponse(
      cognitoStreams: json['CognitoStreams'] != null
          ? CognitoStreams.fromJson(
              json['CognitoStreams'] as Map<String, dynamic>)
          : null,
      identityPoolId: json['IdentityPoolId'] as String?,
      pushSync: json['PushSync'] != null
          ? PushSync.fromJson(json['PushSync'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cognitoStreams = this.cognitoStreams;
    final identityPoolId = this.identityPoolId;
    final pushSync = this.pushSync;
    return {
      if (cognitoStreams != null) 'CognitoStreams': cognitoStreams,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (pushSync != null) 'PushSync': pushSync,
    };
  }
}

enum StreamingStatus {
  enabled,
  disabled,
}

extension StreamingStatusValueExtension on StreamingStatus {
  String toValue() {
    switch (this) {
      case StreamingStatus.enabled:
        return 'ENABLED';
      case StreamingStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension StreamingStatusFromString on String {
  StreamingStatus toStreamingStatus() {
    switch (this) {
      case 'ENABLED':
        return StreamingStatus.enabled;
      case 'DISABLED':
        return StreamingStatus.disabled;
    }
    throw Exception('$this is not known in enum StreamingStatus');
  }
}

/// Response to a SubscribeToDataset request.
class SubscribeToDatasetResponse {
  SubscribeToDatasetResponse();

  factory SubscribeToDatasetResponse.fromJson(Map<String, dynamic> _) {
    return SubscribeToDatasetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response to an UnsubscribeFromDataset request.
class UnsubscribeFromDatasetResponse {
  UnsubscribeFromDatasetResponse();

  factory UnsubscribeFromDatasetResponse.fromJson(Map<String, dynamic> _) {
    return UnsubscribeFromDatasetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Returned for a successful UpdateRecordsRequest.
class UpdateRecordsResponse {
  /// A list of records that have been updated.
  final List<Record>? records;

  UpdateRecordsResponse({
    this.records,
  });

  factory UpdateRecordsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecordsResponse(
      records: (json['Records'] as List?)
          ?.whereNotNull()
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final records = this.records;
    return {
      if (records != null) 'Records': records,
    };
  }
}

class AlreadyStreamedException extends _s.GenericAwsException {
  AlreadyStreamedException({String? type, String? message})
      : super(type: type, code: 'AlreadyStreamedException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DuplicateRequestException extends _s.GenericAwsException {
  DuplicateRequestException({String? type, String? message})
      : super(type: type, code: 'DuplicateRequestException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidConfigurationException extends _s.GenericAwsException {
  InvalidConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConfigurationException',
            message: message);
}

class InvalidLambdaFunctionOutputException extends _s.GenericAwsException {
  InvalidLambdaFunctionOutputException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidLambdaFunctionOutputException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LambdaThrottledException extends _s.GenericAwsException {
  LambdaThrottledException({String? type, String? message})
      : super(type: type, code: 'LambdaThrottledException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyStreamedException': (type, message) =>
      AlreadyStreamedException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'DuplicateRequestException': (type, message) =>
      DuplicateRequestException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidConfigurationException': (type, message) =>
      InvalidConfigurationException(type: type, message: message),
  'InvalidLambdaFunctionOutputException': (type, message) =>
      InvalidLambdaFunctionOutputException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LambdaThrottledException': (type, message) =>
      LambdaThrottledException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
