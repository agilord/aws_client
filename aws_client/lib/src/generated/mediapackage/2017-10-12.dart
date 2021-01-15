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

part '2017-10-12.g.dart';

/// AWS Elemental MediaPackage
class MediaPackage {
  final _s.RestJsonProtocol _protocol;
  MediaPackage({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediapackage',
            signingName: 'mediapackage',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Changes the Channel's properities to configure log subscription
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the channel to log subscription.
  Future<ConfigureLogsResponse> configureLogs({
    @_s.required String id,
    EgressAccessLogs egressAccessLogs,
    IngressAccessLogs ingressAccessLogs,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(id)}/configure_logs',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigureLogsResponse.fromJson(response);
  }

  /// Creates a new Channel.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the Channel. The ID must be unique within the region and it
  /// cannot be changed after a Channel is created.
  ///
  /// Parameter [description] :
  /// A short text description of the Channel.
  Future<CreateChannelResponse> createChannel({
    @_s.required String id,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      'id': id,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Creates a new HarvestJob record.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [endTime] :
  /// The end of the time-window which will be harvested
  ///
  /// Parameter [id] :
  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted
  ///
  /// Parameter [originEndpointId] :
  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  ///
  /// Parameter [startTime] :
  /// The start of the time-window which will be harvested
  Future<CreateHarvestJobResponse> createHarvestJob({
    @_s.required String endTime,
    @_s.required String id,
    @_s.required String originEndpointId,
    @_s.required S3Destination s3Destination,
    @_s.required String startTime,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(originEndpointId, 'originEndpointId');
    ArgumentError.checkNotNull(s3Destination, 's3Destination');
    ArgumentError.checkNotNull(startTime, 'startTime');
    final $payload = <String, dynamic>{
      'endTime': endTime,
      'id': id,
      'originEndpointId': originEndpointId,
      's3Destination': s3Destination,
      'startTime': startTime,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/harvest_jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateHarvestJobResponse.fromJson(response);
  }

  /// Creates a new OriginEndpoint record.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelId] :
  /// The ID of the Channel that the OriginEndpoint will be associated with.
  /// This cannot be changed after the OriginEndpoint is created.
  ///
  /// Parameter [id] :
  /// The ID of the OriginEndpoint.  The ID must be unique within the region
  /// and it cannot be changed after the OriginEndpoint is created.
  ///
  /// Parameter [description] :
  /// A short text description of the OriginEndpoint.
  ///
  /// Parameter [manifestName] :
  /// A short string that will be used as the filename of the OriginEndpoint URL
  /// (defaults to "index").
  ///
  /// Parameter [origination] :
  /// Control whether origination of video is allowed for this OriginEndpoint.
  /// If set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  ///
  /// Parameter [startoverWindowSeconds] :
  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  ///
  /// Parameter [timeDelaySeconds] :
  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  ///
  /// Parameter [whitelist] :
  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  Future<CreateOriginEndpointResponse> createOriginEndpoint({
    @_s.required String channelId,
    @_s.required String id,
    Authorization authorization,
    CmafPackageCreateOrUpdateParameters cmafPackage,
    DashPackage dashPackage,
    String description,
    HlsPackage hlsPackage,
    String manifestName,
    MssPackage mssPackage,
    Origination origination,
    int startoverWindowSeconds,
    Map<String, String> tags,
    int timeDelaySeconds,
    List<String> whitelist,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      'channelId': channelId,
      'id': id,
      if (authorization != null) 'authorization': authorization,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (description != null) 'description': description,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (manifestName != null) 'manifestName': manifestName,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (origination != null) 'origination': origination.toValue(),
      if (startoverWindowSeconds != null)
        'startoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
      if (timeDelaySeconds != null) 'timeDelaySeconds': timeDelaySeconds,
      if (whitelist != null) 'whitelist': whitelist,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/origin_endpoints',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOriginEndpointResponse.fromJson(response);
  }

  /// Deletes an existing Channel.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the Channel to delete.
  Future<void> deleteChannel({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteChannelResponse.fromJson(response);
  }

  /// Deletes an existing OriginEndpoint.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the OriginEndpoint to delete.
  Future<void> deleteOriginEndpoint({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/origin_endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOriginEndpointResponse.fromJson(response);
  }

  /// Gets details about a Channel.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of a Channel.
  Future<DescribeChannelResponse> describeChannel({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelResponse.fromJson(response);
  }

  /// Gets details about an existing HarvestJob.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the HarvestJob.
  Future<DescribeHarvestJobResponse> describeHarvestJob({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/harvest_jobs/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeHarvestJobResponse.fromJson(response);
  }

  /// Gets details about an existing OriginEndpoint.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the OriginEndpoint.
  Future<DescribeOriginEndpointResponse> describeOriginEndpoint({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/origin_endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOriginEndpointResponse.fromJson(response);
  }

  /// Returns a collection of Channels.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// Upper bound on number of records to return.
  ///
  /// Parameter [nextToken] :
  /// A token used to resume pagination from the end of a previous request.
  Future<ListChannelsResponse> listChannels({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Returns a collection of HarvestJob records.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [includeChannelId] :
  /// When specified, the request will return only HarvestJobs associated with
  /// the given Channel ID.
  ///
  /// Parameter [includeStatus] :
  /// When specified, the request will return only HarvestJobs in the given
  /// status.
  ///
  /// Parameter [maxResults] :
  /// The upper bound on the number of records to return.
  ///
  /// Parameter [nextToken] :
  /// A token used to resume pagination from the end of a previous request.
  Future<ListHarvestJobsResponse> listHarvestJobs({
    String includeChannelId,
    String includeStatus,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (includeChannelId != null) 'includeChannelId': [includeChannelId],
      if (includeStatus != null) 'includeStatus': [includeStatus],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/harvest_jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHarvestJobsResponse.fromJson(response);
  }

  /// Returns a collection of OriginEndpoint records.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelId] :
  /// When specified, the request will return only OriginEndpoints associated
  /// with the given Channel ID.
  ///
  /// Parameter [maxResults] :
  /// The upper bound on the number of records to return.
  ///
  /// Parameter [nextToken] :
  /// A token used to resume pagination from the end of a previous request.
  Future<ListOriginEndpointsResponse> listOriginEndpoints({
    String channelId,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (channelId != null) 'channelId': [channelId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/origin_endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOriginEndpointsResponse.fromJson(response);
  }

  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Changes the Channel's first IngestEndpoint's username and password.
  /// WARNING - This API is deprecated. Please use
  /// RotateIngestEndpointCredentials instead
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the channel to update.
  @Deprecated('Deprecated')
  Future<RotateChannelCredentialsResponse> rotateChannelCredentials({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(id)}/credentials',
      exceptionFnMap: _exceptionFns,
    );
    return RotateChannelCredentialsResponse.fromJson(response);
  }

  /// Rotate the IngestEndpoint's username and password, as specified by the
  /// IngestEndpoint's id.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the channel the IngestEndpoint is on.
  ///
  /// Parameter [ingestEndpointId] :
  /// The id of the IngestEndpoint whose credentials should be rotated
  Future<RotateIngestEndpointCredentialsResponse>
      rotateIngestEndpointCredentials({
    @_s.required String id,
    @_s.required String ingestEndpointId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(ingestEndpointId, 'ingestEndpointId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/channels/${Uri.encodeComponent(id)}/ingest_endpoints/${Uri.encodeComponent(ingestEndpointId)}/credentials',
      exceptionFnMap: _exceptionFns,
    );
    return RotateIngestEndpointCredentialsResponse.fromJson(response);
  }

  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// Parameter [tagKeys] :
  /// The key(s) of tag to be deleted
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing Channel.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the Channel to update.
  ///
  /// Parameter [description] :
  /// A short text description of the Channel.
  Future<UpdateChannelResponse> updateChannel({
    @_s.required String id,
    String description,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Updates an existing OriginEndpoint.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the OriginEndpoint to update.
  ///
  /// Parameter [description] :
  /// A short text description of the OriginEndpoint.
  ///
  /// Parameter [manifestName] :
  /// A short string that will be appended to the end of the Endpoint URL.
  ///
  /// Parameter [origination] :
  /// Control whether origination of video is allowed for this OriginEndpoint.
  /// If set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  ///
  /// Parameter [startoverWindowSeconds] :
  /// Maximum duration (in seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  ///
  /// Parameter [timeDelaySeconds] :
  /// Amount of delay (in seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  ///
  /// Parameter [whitelist] :
  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  Future<UpdateOriginEndpointResponse> updateOriginEndpoint({
    @_s.required String id,
    Authorization authorization,
    CmafPackageCreateOrUpdateParameters cmafPackage,
    DashPackage dashPackage,
    String description,
    HlsPackage hlsPackage,
    String manifestName,
    MssPackage mssPackage,
    Origination origination,
    int startoverWindowSeconds,
    int timeDelaySeconds,
    List<String> whitelist,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (authorization != null) 'authorization': authorization,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (description != null) 'description': description,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (manifestName != null) 'manifestName': manifestName,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (origination != null) 'origination': origination.toValue(),
      if (startoverWindowSeconds != null)
        'startoverWindowSeconds': startoverWindowSeconds,
      if (timeDelaySeconds != null) 'timeDelaySeconds': timeDelaySeconds,
      if (whitelist != null) 'whitelist': whitelist,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/origin_endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOriginEndpointResponse.fromJson(response);
  }
}

enum AdMarkers {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SCTE35_ENHANCED')
  scte35Enhanced,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('DATERANGE')
  daterange,
}

/// This setting allows the delivery restriction flags on SCTE-35 segmentation
/// descriptors to
/// determine whether a message signals an ad.  Choosing "NONE" means no SCTE-35
/// messages become
/// ads.  Choosing "RESTRICTED" means SCTE-35 messages of the types specified in
/// AdTriggers that
/// contain delivery restrictions will be treated as ads.  Choosing
/// "UNRESTRICTED" means SCTE-35
/// messages of the types specified in AdTriggers that do not contain delivery
/// restrictions will
/// be treated as ads.  Choosing "BOTH" means all SCTE-35 messages of the types
/// specified in
/// AdTriggers will be treated as ads.  Note that Splice Insert messages do not
/// have these flags
/// and are always treated as ads if specified in AdTriggers.
enum AdsOnDeliveryRestrictions {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('RESTRICTED')
  restricted,
  @_s.JsonValue('UNRESTRICTED')
  unrestricted,
  @_s.JsonValue('BOTH')
  both,
}

/// CDN Authorization credentials
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Authorization {
  /// The Amazon Resource Name (ARN) for the secret in Secrets Manager that your
  /// Content Distribution Network (CDN) uses for authorization to access your
  /// endpoint.
  @_s.JsonKey(name: 'cdnIdentifierSecret')
  final String cdnIdentifierSecret;

  /// The Amazon Resource Name (ARN) for the IAM role that allows MediaPackage to
  /// communicate with AWS Secrets Manager.
  @_s.JsonKey(name: 'secretsRoleArn')
  final String secretsRoleArn;

  Authorization({
    @_s.required this.cdnIdentifierSecret,
    @_s.required this.secretsRoleArn,
  });
  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);
}

/// A Channel resource configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Channel {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Channel({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

/// A Common Media Application Format (CMAF) encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmafEncryption {
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  /// Time (in seconds) between each encryption key rotation.
  @_s.JsonKey(name: 'keyRotationIntervalSeconds')
  final int keyRotationIntervalSeconds;

  CmafEncryption({
    @_s.required this.spekeKeyProvider,
    this.keyRotationIntervalSeconds,
  });
  factory CmafEncryption.fromJson(Map<String, dynamic> json) =>
      _$CmafEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$CmafEncryptionToJson(this);
}

/// A Common Media Application Format (CMAF) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CmafPackage {
  @_s.JsonKey(name: 'encryption')
  final CmafEncryption encryption;

  /// A list of HLS manifest configurations
  @_s.JsonKey(name: 'hlsManifests')
  final List<HlsManifest> hlsManifests;

  /// Duration (in seconds) of each segment. Actual segments will be
  /// rounded to the nearest multiple of the source segment duration.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;

  /// An optional custom string that is prepended to the name of each segment. If
  /// not specified, it defaults to the ChannelId.
  @_s.JsonKey(name: 'segmentPrefix')
  final String segmentPrefix;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  CmafPackage({
    this.encryption,
    this.hlsManifests,
    this.segmentDurationSeconds,
    this.segmentPrefix,
    this.streamSelection,
  });
  factory CmafPackage.fromJson(Map<String, dynamic> json) =>
      _$CmafPackageFromJson(json);
}

/// A Common Media Application Format (CMAF) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CmafPackageCreateOrUpdateParameters {
  @_s.JsonKey(name: 'encryption')
  final CmafEncryption encryption;

  /// A list of HLS manifest configurations
  @_s.JsonKey(name: 'hlsManifests')
  final List<HlsManifestCreateOrUpdateParameters> hlsManifests;

  /// Duration (in seconds) of each segment. Actual segments will be
  /// rounded to the nearest multiple of the source segment duration.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;

  /// An optional custom string that is prepended to the name of each segment. If
  /// not specified, it defaults to the ChannelId.
  @_s.JsonKey(name: 'segmentPrefix')
  final String segmentPrefix;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  CmafPackageCreateOrUpdateParameters({
    this.encryption,
    this.hlsManifests,
    this.segmentDurationSeconds,
    this.segmentPrefix,
    this.streamSelection,
  });
  Map<String, dynamic> toJson() =>
      _$CmafPackageCreateOrUpdateParametersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigureLogsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ConfigureLogsResponse({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory ConfigureLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigureLogsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateChannelResponse({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHarvestJobResponse {
  /// The Amazon Resource Name (ARN) assigned to the HarvestJob.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the Channel that the HarvestJob will harvest from.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The time the HarvestJob was submitted
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The end of the time-window which will be harvested.
  @_s.JsonKey(name: 'endTime')
  final String endTime;

  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  @_s.JsonKey(name: 'originEndpointId')
  final String originEndpointId;
  @_s.JsonKey(name: 's3Destination')
  final S3Destination s3Destination;

  /// The start of the time-window which will be harvested.
  @_s.JsonKey(name: 'startTime')
  final String startTime;

  /// The current status of the HarvestJob. Consider setting up a CloudWatch Event
  /// to listen for
  /// HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch
  /// Event will
  /// include an explanation of why the HarvestJob failed.
  @_s.JsonKey(name: 'status')
  final Status status;

  CreateHarvestJobResponse({
    this.arn,
    this.channelId,
    this.createdAt,
    this.endTime,
    this.id,
    this.originEndpointId,
    this.s3Destination,
    this.startTime,
    this.status,
  });
  factory CreateHarvestJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateHarvestJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  @_s.JsonKey(name: 'channelId')
  final String channelId;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  @_s.JsonKey(name: 'origination')
  final Origination origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'startoverWindowSeconds')
  final int startoverWindowSeconds;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'timeDelaySeconds')
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  @_s.JsonKey(name: 'url')
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'whitelist')
  final List<String> whitelist;

  CreateOriginEndpointResponse({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.origination,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  factory CreateOriginEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOriginEndpointResponseFromJson(json);
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashEncryption {
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  /// Time (in seconds) between each encryption key rotation.
  @_s.JsonKey(name: 'keyRotationIntervalSeconds')
  final int keyRotationIntervalSeconds;

  DashEncryption({
    @_s.required this.spekeKeyProvider,
    this.keyRotationIntervalSeconds,
  });
  factory DashEncryption.fromJson(Map<String, dynamic> json) =>
      _$DashEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$DashEncryptionToJson(this);
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashPackage {
  @_s.JsonKey(name: 'adTriggers')
  final List<AdTriggersElement> adTriggers;
  @_s.JsonKey(name: 'adsOnDeliveryRestrictions')
  final AdsOnDeliveryRestrictions adsOnDeliveryRestrictions;
  @_s.JsonKey(name: 'encryption')
  final DashEncryption encryption;

  /// Determines the position of some tags in the Media Presentation Description
  /// (MPD).  When set to FULL, elements like SegmentTemplate and
  /// ContentProtection are included in each Representation.  When set to COMPACT,
  /// duplicate elements are combined and presented at the AdaptationSet level.
  @_s.JsonKey(name: 'manifestLayout')
  final ManifestLayout manifestLayout;

  /// Time window (in seconds) contained in each manifest.
  @_s.JsonKey(name: 'manifestWindowSeconds')
  final int manifestWindowSeconds;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  @_s.JsonKey(name: 'minBufferTimeSeconds')
  final int minBufferTimeSeconds;

  /// Minimum duration (in seconds) between potential changes to the Dynamic
  /// Adaptive Streaming over HTTP (DASH) Media Presentation Description (MPD).
  @_s.JsonKey(name: 'minUpdatePeriodSeconds')
  final int minUpdatePeriodSeconds;

  /// A list of triggers that controls when the outgoing Dynamic Adaptive
  /// Streaming over HTTP (DASH)
  /// Media Presentation Description (MPD) will be partitioned into multiple
  /// periods. If empty, the content will not
  /// be partitioned into more than one period. If the list contains "ADS", new
  /// periods will be created where
  /// the Channel source contains SCTE-35 ad markers.
  @_s.JsonKey(name: 'periodTriggers')
  final List<PeriodTriggersElement> periodTriggers;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type.  When set to
  /// "HBBTV_1_5", HbbTV 1.5 compliant output is enabled.
  @_s.JsonKey(name: 'profile')
  final Profile profile;

  /// Duration (in seconds) of each segment. Actual segments will be
  /// rounded to the nearest multiple of the source segment duration.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;

  /// Determines the type of SegmentTemplate included in the Media Presentation
  /// Description (MPD).  When set to NUMBER_WITH_TIMELINE, a full timeline is
  /// presented in each SegmentTemplate, with $Number$ media URLs.  When set to
  /// TIME_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate,
  /// with $Time$ media URLs. When set to NUMBER_WITH_DURATION, only a duration is
  /// included in each SegmentTemplate, with $Number$ media URLs.
  @_s.JsonKey(name: 'segmentTemplateFormat')
  final SegmentTemplateFormat segmentTemplateFormat;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  /// Duration (in seconds) to delay live content before presentation.
  @_s.JsonKey(name: 'suggestedPresentationDelaySeconds')
  final int suggestedPresentationDelaySeconds;

  /// Determines the type of UTCTiming included in the Media Presentation
  /// Description (MPD)
  @_s.JsonKey(name: 'utcTiming')
  final UtcTiming utcTiming;

  /// Specifies the value attribute of the UTCTiming field when utcTiming is set
  /// to HTTP-ISO or HTTP-HEAD
  @_s.JsonKey(name: 'utcTimingUri')
  final String utcTimingUri;

  DashPackage({
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.encryption,
    this.manifestLayout,
    this.manifestWindowSeconds,
    this.minBufferTimeSeconds,
    this.minUpdatePeriodSeconds,
    this.periodTriggers,
    this.profile,
    this.segmentDurationSeconds,
    this.segmentTemplateFormat,
    this.streamSelection,
    this.suggestedPresentationDelaySeconds,
    this.utcTiming,
    this.utcTimingUri,
  });
  factory DashPackage.fromJson(Map<String, dynamic> json) =>
      _$DashPackageFromJson(json);

  Map<String, dynamic> toJson() => _$DashPackageToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteChannelResponse {
  DeleteChannelResponse();
  factory DeleteChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteOriginEndpointResponse {
  DeleteOriginEndpointResponse();
  factory DeleteOriginEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteOriginEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeChannelResponse({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHarvestJobResponse {
  /// The Amazon Resource Name (ARN) assigned to the HarvestJob.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the Channel that the HarvestJob will harvest from.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The time the HarvestJob was submitted
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The end of the time-window which will be harvested.
  @_s.JsonKey(name: 'endTime')
  final String endTime;

  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  @_s.JsonKey(name: 'originEndpointId')
  final String originEndpointId;
  @_s.JsonKey(name: 's3Destination')
  final S3Destination s3Destination;

  /// The start of the time-window which will be harvested.
  @_s.JsonKey(name: 'startTime')
  final String startTime;

  /// The current status of the HarvestJob. Consider setting up a CloudWatch Event
  /// to listen for
  /// HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch
  /// Event will
  /// include an explanation of why the HarvestJob failed.
  @_s.JsonKey(name: 'status')
  final Status status;

  DescribeHarvestJobResponse({
    this.arn,
    this.channelId,
    this.createdAt,
    this.endTime,
    this.id,
    this.originEndpointId,
    this.s3Destination,
    this.startTime,
    this.status,
  });
  factory DescribeHarvestJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHarvestJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  @_s.JsonKey(name: 'channelId')
  final String channelId;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  @_s.JsonKey(name: 'origination')
  final Origination origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'startoverWindowSeconds')
  final int startoverWindowSeconds;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'timeDelaySeconds')
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  @_s.JsonKey(name: 'url')
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'whitelist')
  final List<String> whitelist;

  DescribeOriginEndpointResponse({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.origination,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  factory DescribeOriginEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeOriginEndpointResponseFromJson(json);
}

/// Configure egress access logging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EgressAccessLogs {
  /// Customize the log group name.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  EgressAccessLogs({
    this.logGroupName,
  });
  factory EgressAccessLogs.fromJson(Map<String, dynamic> json) =>
      _$EgressAccessLogsFromJson(json);

  Map<String, dynamic> toJson() => _$EgressAccessLogsToJson(this);
}

enum EncryptionMethod {
  @_s.JsonValue('AES_128')
  aes_128,
  @_s.JsonValue('SAMPLE_AES')
  sampleAes,
}

/// A HarvestJob resource configuration
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HarvestJob {
  /// The Amazon Resource Name (ARN) assigned to the HarvestJob.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the Channel that the HarvestJob will harvest from.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The time the HarvestJob was submitted
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The end of the time-window which will be harvested.
  @_s.JsonKey(name: 'endTime')
  final String endTime;

  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  @_s.JsonKey(name: 'originEndpointId')
  final String originEndpointId;
  @_s.JsonKey(name: 's3Destination')
  final S3Destination s3Destination;

  /// The start of the time-window which will be harvested.
  @_s.JsonKey(name: 'startTime')
  final String startTime;

  /// The current status of the HarvestJob. Consider setting up a CloudWatch Event
  /// to listen for
  /// HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch
  /// Event will
  /// include an explanation of why the HarvestJob failed.
  @_s.JsonKey(name: 'status')
  final Status status;

  HarvestJob({
    this.arn,
    this.channelId,
    this.createdAt,
    this.endTime,
    this.id,
    this.originEndpointId,
    this.s3Destination,
    this.startTime,
    this.status,
  });
  factory HarvestJob.fromJson(Map<String, dynamic> json) =>
      _$HarvestJobFromJson(json);
}

/// An HTTP Live Streaming (HLS) encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsEncryption {
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  /// A constant initialization vector for encryption (optional).
  /// When not specified the initialization vector will be periodically rotated.
  @_s.JsonKey(name: 'constantInitializationVector')
  final String constantInitializationVector;

  /// The encryption method to use.
  @_s.JsonKey(name: 'encryptionMethod')
  final EncryptionMethod encryptionMethod;

  /// Interval (in seconds) between each encryption key rotation.
  @_s.JsonKey(name: 'keyRotationIntervalSeconds')
  final int keyRotationIntervalSeconds;

  /// When enabled, the EXT-X-KEY tag will be repeated in output manifests.
  @_s.JsonKey(name: 'repeatExtXKey')
  final bool repeatExtXKey;

  HlsEncryption({
    @_s.required this.spekeKeyProvider,
    this.constantInitializationVector,
    this.encryptionMethod,
    this.keyRotationIntervalSeconds,
    this.repeatExtXKey,
  });
  factory HlsEncryption.fromJson(Map<String, dynamic> json) =>
      _$HlsEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$HlsEncryptionToJson(this);
}

/// An HTTP Live Streaming (HLS) ingest resource configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HlsIngest {
  /// A list of endpoints to which the source stream should be sent.
  @_s.JsonKey(name: 'ingestEndpoints')
  final List<IngestEndpoint> ingestEndpoints;

  HlsIngest({
    this.ingestEndpoints,
  });
  factory HlsIngest.fromJson(Map<String, dynamic> json) =>
      _$HlsIngestFromJson(json);
}

/// A HTTP Live Streaming (HLS) manifest configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HlsManifest {
  /// The ID of the manifest. The ID must be unique within the OriginEndpoint and
  /// it cannot be changed after it is created.
  @_s.JsonKey(name: 'id')
  final String id;

  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint.
  /// "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest.
  /// "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35
  /// messages in the input source.
  /// "DATERANGE" inserts EXT-X-DATERANGE tags to signal ad and program transition
  /// events
  /// in HLS and CMAF manifests. For this option, you must set a
  /// programDateTimeIntervalSeconds value
  /// that is greater than 0.
  @_s.JsonKey(name: 'adMarkers')
  final AdMarkers adMarkers;

  /// When enabled, an I-Frame only stream will be included in the output.
  @_s.JsonKey(name: 'includeIframeOnlyStream')
  final bool includeIframeOnlyStream;

  /// An optional short string appended to the end of the OriginEndpoint URL. If
  /// not specified, defaults to the manifestName for the OriginEndpoint.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;

  /// The HTTP Live Streaming (HLS) playlist type.
  /// When either "EVENT" or "VOD" is specified, a corresponding
  /// EXT-X-PLAYLIST-TYPE
  /// entry will be included in the media playlist.
  @_s.JsonKey(name: 'playlistType')
  final PlaylistType playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  @_s.JsonKey(name: 'playlistWindowSeconds')
  final int playlistWindowSeconds;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content.
  /// If the interval is not specified, or set to 0, then
  /// no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no
  /// ID3Timed Metadata messages will be generated. Note that irrespective
  /// of this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input,
  /// it will be passed through to HLS output.
  @_s.JsonKey(name: 'programDateTimeIntervalSeconds')
  final int programDateTimeIntervalSeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  @_s.JsonKey(name: 'url')
  final String url;

  HlsManifest({
    @_s.required this.id,
    this.adMarkers,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.url,
  });
  factory HlsManifest.fromJson(Map<String, dynamic> json) =>
      _$HlsManifestFromJson(json);
}

/// A HTTP Live Streaming (HLS) manifest configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HlsManifestCreateOrUpdateParameters {
  /// The ID of the manifest. The ID must be unique within the OriginEndpoint and
  /// it cannot be changed after it is created.
  @_s.JsonKey(name: 'id')
  final String id;

  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint.
  /// "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest.
  /// "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35
  /// messages in the input source.
  /// "DATERANGE" inserts EXT-X-DATERANGE tags to signal ad and program transition
  /// events
  /// in HLS and CMAF manifests. For this option, you must set a
  /// programDateTimeIntervalSeconds value
  /// that is greater than 0.
  @_s.JsonKey(name: 'adMarkers')
  final AdMarkers adMarkers;
  @_s.JsonKey(name: 'adTriggers')
  final List<AdTriggersElement> adTriggers;
  @_s.JsonKey(name: 'adsOnDeliveryRestrictions')
  final AdsOnDeliveryRestrictions adsOnDeliveryRestrictions;

  /// When enabled, an I-Frame only stream will be included in the output.
  @_s.JsonKey(name: 'includeIframeOnlyStream')
  final bool includeIframeOnlyStream;

  /// An optional short string appended to the end of the OriginEndpoint URL. If
  /// not specified, defaults to the manifestName for the OriginEndpoint.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;

  /// The HTTP Live Streaming (HLS) playlist type.
  /// When either "EVENT" or "VOD" is specified, a corresponding
  /// EXT-X-PLAYLIST-TYPE
  /// entry will be included in the media playlist.
  @_s.JsonKey(name: 'playlistType')
  final PlaylistType playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  @_s.JsonKey(name: 'playlistWindowSeconds')
  final int playlistWindowSeconds;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content.
  /// If the interval is not specified, or set to 0, then
  /// no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no
  /// ID3Timed Metadata messages will be generated. Note that irrespective
  /// of this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input,
  /// it will be passed through to HLS output.
  @_s.JsonKey(name: 'programDateTimeIntervalSeconds')
  final int programDateTimeIntervalSeconds;

  HlsManifestCreateOrUpdateParameters({
    @_s.required this.id,
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
  });
  Map<String, dynamic> toJson() =>
      _$HlsManifestCreateOrUpdateParametersToJson(this);
}

/// An HTTP Live Streaming (HLS) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsPackage {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint.
  /// "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest.
  /// "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35
  /// messages in the input source.
  /// "DATERANGE" inserts EXT-X-DATERANGE tags to signal ad and program transition
  /// events
  /// in HLS and CMAF manifests. For this option, you must set a
  /// programDateTimeIntervalSeconds value
  /// that is greater than 0.
  @_s.JsonKey(name: 'adMarkers')
  final AdMarkers adMarkers;
  @_s.JsonKey(name: 'adTriggers')
  final List<AdTriggersElement> adTriggers;
  @_s.JsonKey(name: 'adsOnDeliveryRestrictions')
  final AdsOnDeliveryRestrictions adsOnDeliveryRestrictions;
  @_s.JsonKey(name: 'encryption')
  final HlsEncryption encryption;

  /// When enabled, an I-Frame only stream will be included in the output.
  @_s.JsonKey(name: 'includeIframeOnlyStream')
  final bool includeIframeOnlyStream;

  /// The HTTP Live Streaming (HLS) playlist type.
  /// When either "EVENT" or "VOD" is specified, a corresponding
  /// EXT-X-PLAYLIST-TYPE
  /// entry will be included in the media playlist.
  @_s.JsonKey(name: 'playlistType')
  final PlaylistType playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  @_s.JsonKey(name: 'playlistWindowSeconds')
  final int playlistWindowSeconds;

  /// The interval (in seconds) between each EXT-X-PROGRAM-DATE-TIME tag
  /// inserted into manifests. Additionally, when an interval is specified
  /// ID3Timed Metadata messages will be generated every 5 seconds using the
  /// ingest time of the content.
  /// If the interval is not specified, or set to 0, then
  /// no EXT-X-PROGRAM-DATE-TIME tags will be inserted into manifests and no
  /// ID3Timed Metadata messages will be generated. Note that irrespective
  /// of this parameter, if any ID3 Timed Metadata is found in HTTP Live Streaming
  /// (HLS) input,
  /// it will be passed through to HLS output.
  @_s.JsonKey(name: 'programDateTimeIntervalSeconds')
  final int programDateTimeIntervalSeconds;

  /// Duration (in seconds) of each fragment. Actual fragments will be
  /// rounded to the nearest multiple of the source fragment duration.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  /// When enabled, audio streams will be placed in rendition groups in the
  /// output.
  @_s.JsonKey(name: 'useAudioRenditionGroup')
  final bool useAudioRenditionGroup;

  HlsPackage({
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.encryption,
    this.includeIframeOnlyStream,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.segmentDurationSeconds,
    this.streamSelection,
    this.useAudioRenditionGroup,
  });
  factory HlsPackage.fromJson(Map<String, dynamic> json) =>
      _$HlsPackageFromJson(json);

  Map<String, dynamic> toJson() => _$HlsPackageToJson(this);
}

/// An endpoint for ingesting source content for a Channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IngestEndpoint {
  /// The system generated unique identifier for the IngestEndpoint
  @_s.JsonKey(name: 'id')
  final String id;

  /// The system generated password for ingest authentication.
  @_s.JsonKey(name: 'password')
  final String password;

  /// The ingest URL to which the source stream should be sent.
  @_s.JsonKey(name: 'url')
  final String url;

  /// The system generated username for ingest authentication.
  @_s.JsonKey(name: 'username')
  final String username;

  IngestEndpoint({
    this.id,
    this.password,
    this.url,
    this.username,
  });
  factory IngestEndpoint.fromJson(Map<String, dynamic> json) =>
      _$IngestEndpointFromJson(json);
}

/// Configure ingress access logging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IngressAccessLogs {
  /// Customize the log group name.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  IngressAccessLogs({
    this.logGroupName,
  });
  factory IngressAccessLogs.fromJson(Map<String, dynamic> json) =>
      _$IngressAccessLogsFromJson(json);

  Map<String, dynamic> toJson() => _$IngressAccessLogsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelsResponse {
  /// A list of Channel records.
  @_s.JsonKey(name: 'channels')
  final List<Channel> channels;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });
  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHarvestJobsResponse {
  /// A list of HarvestJob records.
  @_s.JsonKey(name: 'harvestJobs')
  final List<HarvestJob> harvestJobs;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListHarvestJobsResponse({
    this.harvestJobs,
    this.nextToken,
  });
  factory ListHarvestJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHarvestJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOriginEndpointsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of OriginEndpoint records.
  @_s.JsonKey(name: 'originEndpoints')
  final List<OriginEndpoint> originEndpoints;

  ListOriginEndpointsResponse({
    this.nextToken,
    this.originEndpoints,
  });
  factory ListOriginEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOriginEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum ManifestLayout {
  @_s.JsonValue('FULL')
  full,
  @_s.JsonValue('COMPACT')
  compact,
}

/// A Microsoft Smooth Streaming (MSS) encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MssEncryption {
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  MssEncryption({
    @_s.required this.spekeKeyProvider,
  });
  factory MssEncryption.fromJson(Map<String, dynamic> json) =>
      _$MssEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$MssEncryptionToJson(this);
}

/// A Microsoft Smooth Streaming (MSS) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MssPackage {
  @_s.JsonKey(name: 'encryption')
  final MssEncryption encryption;

  /// The time window (in seconds) contained in each manifest.
  @_s.JsonKey(name: 'manifestWindowSeconds')
  final int manifestWindowSeconds;

  /// The duration (in seconds) of each segment.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  MssPackage({
    this.encryption,
    this.manifestWindowSeconds,
    this.segmentDurationSeconds,
    this.streamSelection,
  });
  factory MssPackage.fromJson(Map<String, dynamic> json) =>
      _$MssPackageFromJson(json);

  Map<String, dynamic> toJson() => _$MssPackageToJson(this);
}

/// An OriginEndpoint resource configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OriginEndpoint {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  @_s.JsonKey(name: 'channelId')
  final String channelId;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  @_s.JsonKey(name: 'origination')
  final Origination origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'startoverWindowSeconds')
  final int startoverWindowSeconds;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'timeDelaySeconds')
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  @_s.JsonKey(name: 'url')
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'whitelist')
  final List<String> whitelist;

  OriginEndpoint({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.origination,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  factory OriginEndpoint.fromJson(Map<String, dynamic> json) =>
      _$OriginEndpointFromJson(json);
}

enum Origination {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

extension on Origination {
  String toValue() {
    switch (this) {
      case Origination.allow:
        return 'ALLOW';
      case Origination.deny:
        return 'DENY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PlaylistType {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('EVENT')
  event,
  @_s.JsonValue('VOD')
  vod,
}

enum Profile {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HBBTV_1_5')
  hbbtv_1_5,
}

@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RotateChannelCredentialsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  RotateChannelCredentialsResponse({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory RotateChannelCredentialsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RotateChannelCredentialsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RotateIngestEndpointCredentialsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  RotateIngestEndpointCredentialsResponse({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory RotateIngestEndpointCredentialsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RotateIngestEndpointCredentialsResponseFromJson(json);
}

/// Configuration parameters for where in an S3 bucket to place the harvested
/// content
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Destination {
  /// The name of an S3 bucket within which harvested content will be exported
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The key in the specified S3 bucket where the harvested top-level manifest
  /// will be placed.
  @_s.JsonKey(name: 'manifestKey')
  final String manifestKey;

  /// The IAM role used to write to the specified S3 bucket
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  S3Destination({
    @_s.required this.bucketName,
    @_s.required this.manifestKey,
    @_s.required this.roleArn,
  });
  factory S3Destination.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationToJson(this);
}

enum SegmentTemplateFormat {
  @_s.JsonValue('NUMBER_WITH_TIMELINE')
  numberWithTimeline,
  @_s.JsonValue('TIME_WITH_TIMELINE')
  timeWithTimeline,
  @_s.JsonValue('NUMBER_WITH_DURATION')
  numberWithDuration,
}

/// A configuration for accessing an external Secure Packager and Encoder Key
/// Exchange (SPEKE) service that will provide encryption keys.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SpekeKeyProvider {
  /// The resource ID to include in key requests.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// An Amazon Resource Name (ARN) of an IAM role that AWS Elemental
  /// MediaPackage will assume when accessing the key provider service.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The system IDs to include in key requests.
  @_s.JsonKey(name: 'systemIds')
  final List<String> systemIds;

  /// The URL of the external key provider service.
  @_s.JsonKey(name: 'url')
  final String url;

  /// An Amazon Resource Name (ARN) of a Certificate Manager certificate
  /// that MediaPackage will use for enforcing secure end-to-end data
  /// transfer with the key provider service.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  SpekeKeyProvider({
    @_s.required this.resourceId,
    @_s.required this.roleArn,
    @_s.required this.systemIds,
    @_s.required this.url,
    this.certificateArn,
  });
  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) =>
      _$SpekeKeyProviderFromJson(json);

  Map<String, dynamic> toJson() => _$SpekeKeyProviderToJson(this);
}

enum Status {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

enum StreamOrder {
  @_s.JsonValue('ORIGINAL')
  original,
  @_s.JsonValue('VIDEO_BITRATE_ASCENDING')
  videoBitrateAscending,
  @_s.JsonValue('VIDEO_BITRATE_DESCENDING')
  videoBitrateDescending,
}

/// A StreamSelection configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamSelection {
  /// The maximum video bitrate (bps) to include in output.
  @_s.JsonKey(name: 'maxVideoBitsPerSecond')
  final int maxVideoBitsPerSecond;

  /// The minimum video bitrate (bps) to include in output.
  @_s.JsonKey(name: 'minVideoBitsPerSecond')
  final int minVideoBitsPerSecond;

  /// A directive that determines the order of streams in the output.
  @_s.JsonKey(name: 'streamOrder')
  final StreamOrder streamOrder;

  StreamSelection({
    this.maxVideoBitsPerSecond,
    this.minVideoBitsPerSecond,
    this.streamOrder,
  });
  factory StreamSelection.fromJson(Map<String, dynamic> json) =>
      _$StreamSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$StreamSelectionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A short text description of the Channel.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'egressAccessLogs')
  final EgressAccessLogs egressAccessLogs;
  @_s.JsonKey(name: 'hlsIngest')
  final HlsIngest hlsIngest;

  /// The ID of the Channel.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'ingressAccessLogs')
  final IngressAccessLogs ingressAccessLogs;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdateChannelResponse({
    this.arn,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });
  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  @_s.JsonKey(name: 'channelId')
  final String channelId;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;

  /// A short text description of the OriginEndpoint.
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the OriginEndpoint.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A short string appended to the end of the OriginEndpoint URL.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  @_s.JsonKey(name: 'origination')
  final Origination origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'startoverWindowSeconds')
  final int startoverWindowSeconds;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'timeDelaySeconds')
  final int timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  @_s.JsonKey(name: 'url')
  final String url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  @_s.JsonKey(name: 'whitelist')
  final List<String> whitelist;

  UpdateOriginEndpointResponse({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.dashPackage,
    this.description,
    this.hlsPackage,
    this.id,
    this.manifestName,
    this.mssPackage,
    this.origination,
    this.startoverWindowSeconds,
    this.tags,
    this.timeDelaySeconds,
    this.url,
    this.whitelist,
  });
  factory UpdateOriginEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateOriginEndpointResponseFromJson(json);
}

enum UtcTiming {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HTTP-HEAD')
  httpHead,
  @_s.JsonValue('HTTP-ISO')
  httpIso,
}

enum AdTriggersElement {
  @_s.JsonValue('SPLICE_INSERT')
  spliceInsert,
  @_s.JsonValue('BREAK')
  $break,
  @_s.JsonValue('PROVIDER_ADVERTISEMENT')
  providerAdvertisement,
  @_s.JsonValue('DISTRIBUTOR_ADVERTISEMENT')
  distributorAdvertisement,
  @_s.JsonValue('PROVIDER_PLACEMENT_OPPORTUNITY')
  providerPlacementOpportunity,
  @_s.JsonValue('DISTRIBUTOR_PLACEMENT_OPPORTUNITY')
  distributorPlacementOpportunity,
  @_s.JsonValue('PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY')
  providerOverlayPlacementOpportunity,
  @_s.JsonValue('DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY')
  distributorOverlayPlacementOpportunity,
}

enum PeriodTriggersElement {
  @_s.JsonValue('ADS')
  ads,
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String type, String message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
};
