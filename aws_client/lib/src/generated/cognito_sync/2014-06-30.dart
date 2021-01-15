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

part '2014-06-30.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cognito-sync',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String datasetName,
    @_s.required String identityId,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''[a-zA-Z0-9_.:-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String datasetName,
    @_s.required String identityId,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''[a-zA-Z0-9_.:-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityId,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityId,
    @_s.required String identityPoolId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    int maxResults,
    String nextToken,
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
    @_s.required String datasetName,
    @_s.required String identityId,
    @_s.required String identityPoolId,
    int lastSyncCount,
    int maxResults,
    String nextToken,
    String syncSessionToken,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''[a-zA-Z0-9_.:-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityId,
    @_s.required String identityPoolId,
    @_s.required Platform platform,
    @_s.required String token,
  }) async {
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(platform, 'platform');
    ArgumentError.checkNotNull(token, 'token');
    final $payload = <String, dynamic>{
      'Platform': platform?.toValue() ?? '',
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
    @_s.required Map<String, String> events,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(events, 'events');
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String identityPoolId,
    CognitoStreams cognitoStreams,
    PushSync pushSync,
  }) async {
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
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
    @_s.required String datasetName,
    @_s.required String deviceId,
    @_s.required String identityId,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''[a-zA-Z0-9_.:-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}/subscriptions/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return SubscribeToDatasetResponse.fromJson(response);
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
    @_s.required String datasetName,
    @_s.required String deviceId,
    @_s.required String identityId,
    @_s.required String identityPoolId,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''[a-zA-Z0-9_.:-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/identitypools/${Uri.encodeComponent(identityPoolId)}/identities/${Uri.encodeComponent(identityId)}/datasets/${Uri.encodeComponent(datasetName)}/subscriptions/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UnsubscribeFromDatasetResponse.fromJson(response);
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
    @_s.required String datasetName,
    @_s.required String identityId,
    @_s.required String identityPoolId,
    @_s.required String syncSessionToken,
    String clientContext,
    String deviceId,
    List<RecordPatch> recordPatches,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''[a-zA-Z0-9_.:-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityId, 'identityId');
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityId',
      identityId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityPoolId, 'identityPoolId');
    _s.validateStringLength(
      'identityPoolId',
      identityPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identityPoolId',
      identityPoolId,
      r'''[\w-]+:[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(syncSessionToken, 'syncSessionToken');
    _s.validateStringLength(
      'deviceId',
      deviceId,
      1,
      256,
    );
    final headers = <String, String>{};
    clientContext?.let((v) => headers['x-amz-Client-Context'] = v.toString());
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

/// An exception thrown when a bulk publish operation is requested less than 24
/// hours after a previous bulk publish operation completed successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AlreadyStreamedException implements _s.AwsException {
  /// The message associated with the AlreadyStreamedException exception.
  @_s.JsonKey(name: 'message')
  final String message;

  AlreadyStreamedException({
    @_s.required this.message,
  });
  factory AlreadyStreamedException.fromJson(Map<String, dynamic> json) =>
      _$AlreadyStreamedExceptionFromJson(json);
}

/// The output for the BulkPublish operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BulkPublishResponse {
  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  BulkPublishResponse({
    this.identityPoolId,
  });
  factory BulkPublishResponse.fromJson(Map<String, dynamic> json) =>
      _$BulkPublishResponseFromJson(json);
}

enum BulkPublishStatus {
  @_s.JsonValue('NOT_STARTED')
  notStarted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
}

/// Configuration options for configure Cognito streams.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CognitoStreams {
  /// The ARN of the role Amazon Cognito can assume in order to publish to the
  /// stream. This role must grant access to Amazon Cognito (cognito-sync) to
  /// invoke PutRecord on your Cognito stream.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The name of the Cognito stream to receive updates. This stream must be in
  /// the developers account and in the same region as the identity pool.
  @_s.JsonKey(name: 'StreamName')
  final String streamName;

  /// Status of the Cognito streams. Valid values are:
  /// ENABLED - Streaming of updates to identity pool is enabled.
  ///
  /// DISABLED - Streaming of updates to identity pool is disabled. Bulk publish
  /// will also fail if StreamingStatus is DISABLED.
  @_s.JsonKey(name: 'StreamingStatus')
  final StreamingStatus streamingStatus;

  CognitoStreams({
    this.roleArn,
    this.streamName,
    this.streamingStatus,
  });
  factory CognitoStreams.fromJson(Map<String, dynamic> json) =>
      _$CognitoStreamsFromJson(json);

  Map<String, dynamic> toJson() => _$CognitoStreamsToJson(this);
}

/// Thrown if there are parallel requests to modify a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConcurrentModificationException implements _s.AwsException {
  /// The message returned by a ConcurrentModicationException.
  @_s.JsonKey(name: 'message')
  final String message;

  ConcurrentModificationException({
    @_s.required this.message,
  });
  factory ConcurrentModificationException.fromJson(Map<String, dynamic> json) =>
      _$ConcurrentModificationExceptionFromJson(json);
}

/// A collection of data for an identity pool. An identity pool can have
/// multiple datasets. A dataset is per identity and can be general or
/// associated with a particular entity in an application (like a saved game).
/// Datasets are automatically created if they don't exist. Data is synced by
/// dataset, and a dataset can hold up to 1MB of key-value pairs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dataset {
  /// Date on which the dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Total size in bytes of the records in this dataset.
  @_s.JsonKey(name: 'DataStorage')
  final int dataStorage;

  /// A string of up to 128 characters. Allowed characters are a-z, A-Z, 0-9, '_'
  /// (underscore), '-' (dash), and '.' (dot).
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// The device that made the last change to this dataset.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// Date when the dataset was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// Number of records in this dataset.
  @_s.JsonKey(name: 'NumRecords')
  final int numRecords;

  Dataset({
    this.creationDate,
    this.dataStorage,
    this.datasetName,
    this.identityId,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.numRecords,
  });
  factory Dataset.fromJson(Map<String, dynamic> json) =>
      _$DatasetFromJson(json);
}

/// Response to a successful DeleteDataset request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDatasetResponse {
  /// A collection of data for an identity pool. An identity pool can have
  /// multiple datasets. A dataset is per identity and can be general or
  /// associated with a particular entity in an application (like a saved game).
  /// Datasets are automatically created if they don't exist. Data is synced by
  /// dataset, and a dataset can hold up to 1MB of key-value pairs.
  @_s.JsonKey(name: 'Dataset')
  final Dataset dataset;

  DeleteDatasetResponse({
    this.dataset,
  });
  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDatasetResponseFromJson(json);
}

/// Response to a successful DescribeDataset request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetResponse {
  /// Meta data for a collection of data for an identity. An identity can have
  /// multiple datasets. A dataset can be general or associated with a particular
  /// entity in an application (like a saved game). Datasets are automatically
  /// created if they don't exist. Data is synced by dataset, and a dataset can
  /// hold up to 1MB of key-value pairs.
  @_s.JsonKey(name: 'Dataset')
  final Dataset dataset;

  DescribeDatasetResponse({
    this.dataset,
  });
  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetResponseFromJson(json);
}

/// Response to a successful DescribeIdentityPoolUsage request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIdentityPoolUsageResponse {
  /// Information about the usage of the identity pool.
  @_s.JsonKey(name: 'IdentityPoolUsage')
  final IdentityPoolUsage identityPoolUsage;

  DescribeIdentityPoolUsageResponse({
    this.identityPoolUsage,
  });
  factory DescribeIdentityPoolUsageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeIdentityPoolUsageResponseFromJson(json);
}

/// The response to a successful DescribeIdentityUsage request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIdentityUsageResponse {
  /// Usage information for the identity.
  @_s.JsonKey(name: 'IdentityUsage')
  final IdentityUsage identityUsage;

  DescribeIdentityUsageResponse({
    this.identityUsage,
  });
  factory DescribeIdentityUsageResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeIdentityUsageResponseFromJson(json);
}

/// An exception thrown when there is an IN_PROGRESS bulk publish operation for
/// the given identity pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DuplicateRequestException implements _s.AwsException {
  /// The message associated with the DuplicateRequestException exception.
  @_s.JsonKey(name: 'message')
  final String message;

  DuplicateRequestException({
    @_s.required this.message,
  });
  factory DuplicateRequestException.fromJson(Map<String, dynamic> json) =>
      _$DuplicateRequestExceptionFromJson(json);
}

/// The output for the GetBulkPublishDetails operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBulkPublishDetailsResponse {
  /// If BulkPublishStatus is SUCCEEDED, the time the last bulk publish operation
  /// completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'BulkPublishCompleteTime')
  final DateTime bulkPublishCompleteTime;

  /// The date/time at which the last bulk publish was initiated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'BulkPublishStartTime')
  final DateTime bulkPublishStartTime;

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
  @_s.JsonKey(name: 'BulkPublishStatus')
  final BulkPublishStatus bulkPublishStatus;

  /// If BulkPublishStatus is FAILED this field will contain the error message
  /// that caused the bulk publish to fail.
  @_s.JsonKey(name: 'FailureMessage')
  final String failureMessage;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  GetBulkPublishDetailsResponse({
    this.bulkPublishCompleteTime,
    this.bulkPublishStartTime,
    this.bulkPublishStatus,
    this.failureMessage,
    this.identityPoolId,
  });
  factory GetBulkPublishDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBulkPublishDetailsResponseFromJson(json);
}

/// The response from the GetCognitoEvents request
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCognitoEventsResponse {
  /// The Cognito Events returned from the GetCognitoEvents request
  @_s.JsonKey(name: 'Events')
  final Map<String, String> events;

  GetCognitoEventsResponse({
    this.events,
  });
  factory GetCognitoEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCognitoEventsResponseFromJson(json);
}

/// The output for the GetIdentityPoolConfiguration operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIdentityPoolConfigurationResponse {
  /// Options to apply to this identity pool for Amazon Cognito streams.
  @_s.JsonKey(name: 'CognitoStreams')
  final CognitoStreams cognitoStreams;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// Options to apply to this identity pool for push synchronization.
  @_s.JsonKey(name: 'PushSync')
  final PushSync pushSync;

  GetIdentityPoolConfigurationResponse({
    this.cognitoStreams,
    this.identityPoolId,
    this.pushSync,
  });
  factory GetIdentityPoolConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetIdentityPoolConfigurationResponseFromJson(json);
}

/// Usage information for the identity pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityPoolUsage {
  /// Data storage information for the identity pool.
  @_s.JsonKey(name: 'DataStorage')
  final int dataStorage;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// Date on which the identity pool was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// Number of sync sessions for the identity pool.
  @_s.JsonKey(name: 'SyncSessionsCount')
  final int syncSessionsCount;

  IdentityPoolUsage({
    this.dataStorage,
    this.identityPoolId,
    this.lastModifiedDate,
    this.syncSessionsCount,
  });
  factory IdentityPoolUsage.fromJson(Map<String, dynamic> json) =>
      _$IdentityPoolUsageFromJson(json);
}

/// Usage information for the identity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityUsage {
  /// Total data storage for this identity.
  @_s.JsonKey(name: 'DataStorage')
  final int dataStorage;

  /// Number of datasets for the identity.
  @_s.JsonKey(name: 'DatasetCount')
  final int datasetCount;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  @_s.JsonKey(name: 'IdentityId')
  final String identityId;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  /// GUID generation is unique within a region.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// Date on which the identity was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  IdentityUsage({
    this.dataStorage,
    this.datasetCount,
    this.identityId,
    this.identityPoolId,
    this.lastModifiedDate,
  });
  factory IdentityUsage.fromJson(Map<String, dynamic> json) =>
      _$IdentityUsageFromJson(json);
}

/// Indicates an internal service error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalErrorException implements _s.AwsException {
  /// Message returned by InternalErrorException.
  @_s.JsonKey(name: 'message')
  final String message;

  InternalErrorException({
    @_s.required this.message,
  });
  factory InternalErrorException.fromJson(Map<String, dynamic> json) =>
      _$InternalErrorExceptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidConfigurationException implements _s.AwsException {
  /// Message returned by InvalidConfigurationException.
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidConfigurationException({
    @_s.required this.message,
  });
  factory InvalidConfigurationException.fromJson(Map<String, dynamic> json) =>
      _$InvalidConfigurationExceptionFromJson(json);
}

/// The AWS Lambda function returned invalid output or an exception.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidLambdaFunctionOutputException implements _s.AwsException {
  /// A message returned when an InvalidLambdaFunctionOutputException occurs
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidLambdaFunctionOutputException({
    @_s.required this.message,
  });
  factory InvalidLambdaFunctionOutputException.fromJson(
          Map<String, dynamic> json) =>
      _$InvalidLambdaFunctionOutputExceptionFromJson(json);
}

/// Thrown when a request parameter does not comply with the associated
/// constraints.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidParameterException implements _s.AwsException {
  /// Message returned by InvalidParameterException.
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidParameterException({
    @_s.required this.message,
  });
  factory InvalidParameterException.fromJson(Map<String, dynamic> json) =>
      _$InvalidParameterExceptionFromJson(json);
}

/// AWS Lambda throttled your account, please contact AWS Support
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LambdaThrottledException implements _s.AwsException {
  /// A message returned when an LambdaThrottledException is thrown
  @_s.JsonKey(name: 'message')
  final String message;

  LambdaThrottledException({
    @_s.required this.message,
  });
  factory LambdaThrottledException.fromJson(Map<String, dynamic> json) =>
      _$LambdaThrottledExceptionFromJson(json);
}

/// Thrown when the limit on the number of objects or operations has been
/// exceeded.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LimitExceededException implements _s.AwsException {
  /// Message returned by LimitExceededException.
  @_s.JsonKey(name: 'message')
  final String message;

  LimitExceededException({
    @_s.required this.message,
  });
  factory LimitExceededException.fromJson(Map<String, dynamic> json) =>
      _$LimitExceededExceptionFromJson(json);
}

/// Returned for a successful ListDatasets request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetsResponse {
  /// Number of datasets returned.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// A set of datasets.
  @_s.JsonKey(name: 'Datasets')
  final List<Dataset> datasets;

  /// A pagination token for obtaining the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDatasetsResponse({
    this.count,
    this.datasets,
    this.nextToken,
  });
  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetsResponseFromJson(json);
}

/// Returned for a successful ListIdentityPoolUsage request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIdentityPoolUsageResponse {
  /// Total number of identities for the identity pool.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// Usage information for the identity pools.
  @_s.JsonKey(name: 'IdentityPoolUsages')
  final List<IdentityPoolUsage> identityPoolUsages;

  /// The maximum number of results to be returned.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// A pagination token for obtaining the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIdentityPoolUsageResponse({
    this.count,
    this.identityPoolUsages,
    this.maxResults,
    this.nextToken,
  });
  factory ListIdentityPoolUsageResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIdentityPoolUsageResponseFromJson(json);
}

/// Returned for a successful ListRecordsRequest.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecordsResponse {
  /// Total number of records.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// A boolean value specifying whether to delete the dataset locally.
  @_s.JsonKey(name: 'DatasetDeletedAfterRequestedSyncCount')
  final bool datasetDeletedAfterRequestedSyncCount;

  /// Indicates whether the dataset exists.
  @_s.JsonKey(name: 'DatasetExists')
  final bool datasetExists;

  /// Server sync count for this dataset.
  @_s.JsonKey(name: 'DatasetSyncCount')
  final int datasetSyncCount;

  /// The user/device that made the last change to this record.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// Names of merged datasets.
  @_s.JsonKey(name: 'MergedDatasetNames')
  final List<String> mergedDatasetNames;

  /// A pagination token for obtaining the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of all records.
  @_s.JsonKey(name: 'Records')
  final List<Record> records;

  /// A token containing a session ID, identity ID, and expiration.
  @_s.JsonKey(name: 'SyncSessionToken')
  final String syncSessionToken;

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
  factory ListRecordsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRecordsResponseFromJson(json);
}

/// Thrown when a user is not authorized to access the requested resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotAuthorizedException implements _s.AwsException {
  /// The message returned by a NotAuthorizedException.
  @_s.JsonKey(name: 'message')
  final String message;

  NotAuthorizedException({
    @_s.required this.message,
  });
  factory NotAuthorizedException.fromJson(Map<String, dynamic> json) =>
      _$NotAuthorizedExceptionFromJson(json);
}

enum Operation {
  @_s.JsonValue('replace')
  replace,
  @_s.JsonValue('remove')
  remove,
}

enum Platform {
  @_s.JsonValue('APNS')
  apns,
  @_s.JsonValue('APNS_SANDBOX')
  apnsSandbox,
  @_s.JsonValue('GCM')
  gcm,
  @_s.JsonValue('ADM')
  adm,
}

extension on Platform {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Configuration options to be applied to the identity pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PushSync {
  /// List of SNS platform application ARNs that could be used by clients.
  @_s.JsonKey(name: 'ApplicationArns')
  final List<String> applicationArns;

  /// A role configured to allow Cognito to call SNS on behalf of the developer.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  PushSync({
    this.applicationArns,
    this.roleArn,
  });
  factory PushSync.fromJson(Map<String, dynamic> json) =>
      _$PushSyncFromJson(json);

  Map<String, dynamic> toJson() => _$PushSyncToJson(this);
}

/// The basic data structure of a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Record {
  /// The last modified date of the client device.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeviceLastModifiedDate')
  final DateTime deviceLastModifiedDate;

  /// The key for the record.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The user/device that made the last change to this record.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date on which the record was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The server sync count for this record.
  @_s.JsonKey(name: 'SyncCount')
  final int syncCount;

  /// The value for the record.
  @_s.JsonKey(name: 'Value')
  final String value;

  Record({
    this.deviceLastModifiedDate,
    this.key,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.syncCount,
    this.value,
  });
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

/// An update operation for a record.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RecordPatch {
  /// The key associated with the record patch.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// An operation, either replace or remove.
  @_s.JsonKey(name: 'Op')
  final Operation op;

  /// Last known server sync count for this record. Set to 0 if unknown.
  @_s.JsonKey(name: 'SyncCount')
  final int syncCount;

  /// The last modified date of the client device.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeviceLastModifiedDate')
  final DateTime deviceLastModifiedDate;

  /// The value associated with the record patch.
  @_s.JsonKey(name: 'Value')
  final String value;

  RecordPatch({
    @_s.required this.key,
    @_s.required this.op,
    @_s.required this.syncCount,
    this.deviceLastModifiedDate,
    this.value,
  });
  Map<String, dynamic> toJson() => _$RecordPatchToJson(this);
}

/// Response to a RegisterDevice request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterDeviceResponse {
  /// The unique ID generated for this device by Cognito.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  RegisterDeviceResponse({
    this.deviceId,
  });
  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseFromJson(json);
}

/// Thrown if an update can't be applied because the resource was changed by
/// another call and this would result in a conflict.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceConflictException implements _s.AwsException {
  /// The message returned by a ResourceConflictException.
  @_s.JsonKey(name: 'message')
  final String message;

  ResourceConflictException({
    @_s.required this.message,
  });
  factory ResourceConflictException.fromJson(Map<String, dynamic> json) =>
      _$ResourceConflictExceptionFromJson(json);
}

/// Thrown if the resource doesn't exist.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceNotFoundException implements _s.AwsException {
  /// Message returned by a ResourceNotFoundException.
  @_s.JsonKey(name: 'message')
  final String message;

  ResourceNotFoundException({
    @_s.required this.message,
  });
  factory ResourceNotFoundException.fromJson(Map<String, dynamic> json) =>
      _$ResourceNotFoundExceptionFromJson(json);
}

/// The output for the SetIdentityPoolConfiguration operation
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetIdentityPoolConfigurationResponse {
  /// Options to apply to this identity pool for Amazon Cognito streams.
  @_s.JsonKey(name: 'CognitoStreams')
  final CognitoStreams cognitoStreams;

  /// A name-spaced GUID (for example,
  /// us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon Cognito.
  @_s.JsonKey(name: 'IdentityPoolId')
  final String identityPoolId;

  /// Options to apply to this identity pool for push synchronization.
  @_s.JsonKey(name: 'PushSync')
  final PushSync pushSync;

  SetIdentityPoolConfigurationResponse({
    this.cognitoStreams,
    this.identityPoolId,
    this.pushSync,
  });
  factory SetIdentityPoolConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SetIdentityPoolConfigurationResponseFromJson(json);
}

enum StreamingStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Response to a SubscribeToDataset request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubscribeToDatasetResponse {
  SubscribeToDatasetResponse();
  factory SubscribeToDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscribeToDatasetResponseFromJson(json);
}

/// Thrown if the request is throttled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TooManyRequestsException implements _s.AwsException {
  /// Message returned by a TooManyRequestsException.
  @_s.JsonKey(name: 'message')
  final String message;

  TooManyRequestsException({
    @_s.required this.message,
  });
  factory TooManyRequestsException.fromJson(Map<String, dynamic> json) =>
      _$TooManyRequestsExceptionFromJson(json);
}

/// Response to an UnsubscribeFromDataset request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnsubscribeFromDatasetResponse {
  UnsubscribeFromDatasetResponse();
  factory UnsubscribeFromDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$UnsubscribeFromDatasetResponseFromJson(json);
}

/// Returned for a successful UpdateRecordsRequest.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRecordsResponse {
  /// A list of records that have been updated.
  @_s.JsonKey(name: 'Records')
  final List<Record> records;

  UpdateRecordsResponse({
    this.records,
  });
  factory UpdateRecordsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRecordsResponseFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyStreamedException': (type, message) =>
      AlreadyStreamedException(message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(message: message),
  'DuplicateRequestException': (type, message) =>
      DuplicateRequestException(message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(message: message),
  'InvalidConfigurationException': (type, message) =>
      InvalidConfigurationException(message: message),
  'InvalidLambdaFunctionOutputException': (type, message) =>
      InvalidLambdaFunctionOutputException(message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(message: message),
  'LambdaThrottledException': (type, message) =>
      LambdaThrottledException(message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(message: message),
};
