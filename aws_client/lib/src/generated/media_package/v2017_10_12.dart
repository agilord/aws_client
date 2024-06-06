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

/// AWS Elemental MediaPackage
class MediaPackage {
  final _s.RestJsonProtocol _protocol;
  MediaPackage({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediapackage',
            signingName: 'mediapackage',
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
    required String id,
    EgressAccessLogs? egressAccessLogs,
    IngressAccessLogs? ingressAccessLogs,
  }) async {
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
    required String id,
    String? description,
    Map<String, String>? tags,
  }) async {
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
    required String endTime,
    required String id,
    required String originEndpointId,
    required S3Destination s3Destination,
    required String startTime,
  }) async {
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
    required String channelId,
    required String id,
    Authorization? authorization,
    CmafPackageCreateOrUpdateParameters? cmafPackage,
    DashPackage? dashPackage,
    String? description,
    HlsPackage? hlsPackage,
    String? manifestName,
    MssPackage? mssPackage,
    Origination? origination,
    int? startoverWindowSeconds,
    Map<String, String>? tags,
    int? timeDelaySeconds,
    List<String>? whitelist,
  }) async {
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
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/origin_endpoints/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
  }) async {
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
    required String id,
  }) async {
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
    required String id,
  }) async {
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
    int? maxResults,
    String? nextToken,
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
    String? includeChannelId,
    String? includeStatus,
    int? maxResults,
    String? nextToken,
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
    String? channelId,
    int? maxResults,
    String? nextToken,
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
    required String resourceArn,
  }) async {
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
  @Deprecated(
      'This API is deprecated. Please use RotateIngestEndpointCredentials instead')
  Future<RotateChannelCredentialsResponse> rotateChannelCredentials({
    required String id,
  }) async {
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
    required String id,
    required String ingestEndpointId,
  }) async {
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
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
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
    required String id,
    String? description,
  }) async {
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
    required String id,
    Authorization? authorization,
    CmafPackageCreateOrUpdateParameters? cmafPackage,
    DashPackage? dashPackage,
    String? description,
    HlsPackage? hlsPackage,
    String? manifestName,
    MssPackage? mssPackage,
    Origination? origination,
    int? startoverWindowSeconds,
    int? timeDelaySeconds,
    List<String>? whitelist,
  }) async {
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
  none,
  scte35Enhanced,
  passthrough,
  daterange,
}

extension AdMarkersValueExtension on AdMarkers {
  String toValue() {
    switch (this) {
      case AdMarkers.none:
        return 'NONE';
      case AdMarkers.scte35Enhanced:
        return 'SCTE35_ENHANCED';
      case AdMarkers.passthrough:
        return 'PASSTHROUGH';
      case AdMarkers.daterange:
        return 'DATERANGE';
    }
  }
}

extension AdMarkersFromString on String {
  AdMarkers toAdMarkers() {
    switch (this) {
      case 'NONE':
        return AdMarkers.none;
      case 'SCTE35_ENHANCED':
        return AdMarkers.scte35Enhanced;
      case 'PASSTHROUGH':
        return AdMarkers.passthrough;
      case 'DATERANGE':
        return AdMarkers.daterange;
    }
    throw Exception('$this is not known in enum AdMarkers');
  }
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
  none,
  restricted,
  unrestricted,
  both,
}

extension AdsOnDeliveryRestrictionsValueExtension on AdsOnDeliveryRestrictions {
  String toValue() {
    switch (this) {
      case AdsOnDeliveryRestrictions.none:
        return 'NONE';
      case AdsOnDeliveryRestrictions.restricted:
        return 'RESTRICTED';
      case AdsOnDeliveryRestrictions.unrestricted:
        return 'UNRESTRICTED';
      case AdsOnDeliveryRestrictions.both:
        return 'BOTH';
    }
  }
}

extension AdsOnDeliveryRestrictionsFromString on String {
  AdsOnDeliveryRestrictions toAdsOnDeliveryRestrictions() {
    switch (this) {
      case 'NONE':
        return AdsOnDeliveryRestrictions.none;
      case 'RESTRICTED':
        return AdsOnDeliveryRestrictions.restricted;
      case 'UNRESTRICTED':
        return AdsOnDeliveryRestrictions.unrestricted;
      case 'BOTH':
        return AdsOnDeliveryRestrictions.both;
    }
    throw Exception('$this is not known in enum AdsOnDeliveryRestrictions');
  }
}

/// CDN Authorization credentials
class Authorization {
  /// The Amazon Resource Name (ARN) for the secret in Secrets Manager that your
  /// Content Distribution Network (CDN) uses for authorization to access your
  /// endpoint.
  final String cdnIdentifierSecret;

  /// The Amazon Resource Name (ARN) for the IAM role that allows MediaPackage to
  /// communicate with AWS Secrets Manager.
  final String secretsRoleArn;

  Authorization({
    required this.cdnIdentifierSecret,
    required this.secretsRoleArn,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) {
    return Authorization(
      cdnIdentifierSecret: json['cdnIdentifierSecret'] as String,
      secretsRoleArn: json['secretsRoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cdnIdentifierSecret = this.cdnIdentifierSecret;
    final secretsRoleArn = this.secretsRoleArn;
    return {
      'cdnIdentifierSecret': cdnIdentifierSecret,
      'secretsRoleArn': secretsRoleArn,
    };
  }
}

/// A Channel resource configuration.
class Channel {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  Channel({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A Common Media Application Format (CMAF) encryption configuration.
class CmafEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  /// An optional 128-bit, 16-byte hex value represented by a 32-character string,
  /// used in conjunction with the key for encrypting blocks. If you don't specify
  /// a value, then MediaPackage creates the constant initialization vector (IV).
  final String? constantInitializationVector;
  final CmafEncryptionMethod? encryptionMethod;

  /// Time (in seconds) between each encryption key rotation.
  final int? keyRotationIntervalSeconds;

  CmafEncryption({
    required this.spekeKeyProvider,
    this.constantInitializationVector,
    this.encryptionMethod,
    this.keyRotationIntervalSeconds,
  });

  factory CmafEncryption.fromJson(Map<String, dynamic> json) {
    return CmafEncryption(
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['spekeKeyProvider'] as Map<String, dynamic>),
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      encryptionMethod:
          (json['encryptionMethod'] as String?)?.toCmafEncryptionMethod(),
      keyRotationIntervalSeconds: json['keyRotationIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    final constantInitializationVector = this.constantInitializationVector;
    final encryptionMethod = this.encryptionMethod;
    final keyRotationIntervalSeconds = this.keyRotationIntervalSeconds;
    return {
      'spekeKeyProvider': spekeKeyProvider,
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (encryptionMethod != null)
        'encryptionMethod': encryptionMethod.toValue(),
      if (keyRotationIntervalSeconds != null)
        'keyRotationIntervalSeconds': keyRotationIntervalSeconds,
    };
  }
}

/// The encryption method to use.
enum CmafEncryptionMethod {
  sampleAes,
  aesCtr,
}

extension CmafEncryptionMethodValueExtension on CmafEncryptionMethod {
  String toValue() {
    switch (this) {
      case CmafEncryptionMethod.sampleAes:
        return 'SAMPLE_AES';
      case CmafEncryptionMethod.aesCtr:
        return 'AES_CTR';
    }
  }
}

extension CmafEncryptionMethodFromString on String {
  CmafEncryptionMethod toCmafEncryptionMethod() {
    switch (this) {
      case 'SAMPLE_AES':
        return CmafEncryptionMethod.sampleAes;
      case 'AES_CTR':
        return CmafEncryptionMethod.aesCtr;
    }
    throw Exception('$this is not known in enum CmafEncryptionMethod');
  }
}

/// A Common Media Application Format (CMAF) packaging configuration.
class CmafPackage {
  final CmafEncryption? encryption;

  /// A list of HLS manifest configurations
  final List<HlsManifest>? hlsManifests;

  /// Duration (in seconds) of each segment. Actual segments will be
  /// rounded to the nearest multiple of the source segment duration.
  final int? segmentDurationSeconds;

  /// An optional custom string that is prepended to the name of each segment. If
  /// not specified, it defaults to the ChannelId.
  final String? segmentPrefix;
  final StreamSelection? streamSelection;

  CmafPackage({
    this.encryption,
    this.hlsManifests,
    this.segmentDurationSeconds,
    this.segmentPrefix,
    this.streamSelection,
  });

  factory CmafPackage.fromJson(Map<String, dynamic> json) {
    return CmafPackage(
      encryption: json['encryption'] != null
          ? CmafEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      hlsManifests: (json['hlsManifests'] as List?)
          ?.whereNotNull()
          .map((e) => HlsManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
      segmentPrefix: json['segmentPrefix'] as String?,
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryption = this.encryption;
    final hlsManifests = this.hlsManifests;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final segmentPrefix = this.segmentPrefix;
    final streamSelection = this.streamSelection;
    return {
      if (encryption != null) 'encryption': encryption,
      if (hlsManifests != null) 'hlsManifests': hlsManifests,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (segmentPrefix != null) 'segmentPrefix': segmentPrefix,
      if (streamSelection != null) 'streamSelection': streamSelection,
    };
  }
}

/// A Common Media Application Format (CMAF) packaging configuration.
class CmafPackageCreateOrUpdateParameters {
  final CmafEncryption? encryption;

  /// A list of HLS manifest configurations
  final List<HlsManifestCreateOrUpdateParameters>? hlsManifests;

  /// Duration (in seconds) of each segment. Actual segments will be
  /// rounded to the nearest multiple of the source segment duration.
  final int? segmentDurationSeconds;

  /// An optional custom string that is prepended to the name of each segment. If
  /// not specified, it defaults to the ChannelId.
  final String? segmentPrefix;
  final StreamSelection? streamSelection;

  CmafPackageCreateOrUpdateParameters({
    this.encryption,
    this.hlsManifests,
    this.segmentDurationSeconds,
    this.segmentPrefix,
    this.streamSelection,
  });

  Map<String, dynamic> toJson() {
    final encryption = this.encryption;
    final hlsManifests = this.hlsManifests;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final segmentPrefix = this.segmentPrefix;
    final streamSelection = this.streamSelection;
    return {
      if (encryption != null) 'encryption': encryption,
      if (hlsManifests != null) 'hlsManifests': hlsManifests,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (segmentPrefix != null) 'segmentPrefix': segmentPrefix,
      if (streamSelection != null) 'streamSelection': streamSelection,
    };
  }
}

class ConfigureLogsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  ConfigureLogsResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory ConfigureLogsResponse.fromJson(Map<String, dynamic> json) {
    return ConfigureLogsResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  CreateChannelResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateHarvestJobResponse {
  /// The Amazon Resource Name (ARN) assigned to the HarvestJob.
  final String? arn;

  /// The ID of the Channel that the HarvestJob will harvest from.
  final String? channelId;

  /// The date and time the HarvestJob was submitted.
  final String? createdAt;

  /// The end of the time-window which will be harvested.
  final String? endTime;

  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted.
  final String? id;

  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  final String? originEndpointId;
  final S3Destination? s3Destination;

  /// The start of the time-window which will be harvested.
  final String? startTime;

  /// The current status of the HarvestJob. Consider setting up a CloudWatch Event
  /// to listen for
  /// HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch
  /// Event will
  /// include an explanation of why the HarvestJob failed.
  final Status? status;

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

  factory CreateHarvestJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateHarvestJobResponse(
      arn: json['arn'] as String?,
      channelId: json['channelId'] as String?,
      createdAt: json['createdAt'] as String?,
      endTime: json['endTime'] as String?,
      id: json['id'] as String?,
      originEndpointId: json['originEndpointId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelId = this.channelId;
    final createdAt = this.createdAt;
    final endTime = this.endTime;
    final id = this.id;
    final originEndpointId = this.originEndpointId;
    final s3Destination = this.s3Destination;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (channelId != null) 'channelId': channelId,
      if (createdAt != null) 'createdAt': createdAt,
      if (endTime != null) 'endTime': endTime,
      if (id != null) 'id': id,
      if (originEndpointId != null) 'originEndpointId': originEndpointId,
      if (s3Destination != null) 's3Destination': s3Destination,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String? arn;
  final Authorization? authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String? channelId;
  final CmafPackage? cmafPackage;

  /// The date and time the OriginEndpoint was created.
  final String? createdAt;
  final DashPackage? dashPackage;

  /// A short text description of the OriginEndpoint.
  final String? description;
  final HlsPackage? hlsPackage;

  /// The ID of the OriginEndpoint.
  final String? id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String? manifestName;
  final MssPackage? mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  final Origination? origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  final int? startoverWindowSeconds;
  final Map<String, String>? tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int? timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String? url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String>? whitelist;

  CreateOriginEndpointResponse({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.createdAt,
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

  factory CreateOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateOriginEndpointResponse(
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      channelId: json['channelId'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      manifestName: json['manifestName'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      origination: (json['origination'] as String?)?.toOrigination(),
      startoverWindowSeconds: json['startoverWindowSeconds'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeDelaySeconds: json['timeDelaySeconds'] as int?,
      url: json['url'] as String?,
      whitelist: (json['whitelist'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorization = this.authorization;
    final channelId = this.channelId;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final description = this.description;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final manifestName = this.manifestName;
    final mssPackage = this.mssPackage;
    final origination = this.origination;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final timeDelaySeconds = this.timeDelaySeconds;
    final url = this.url;
    final whitelist = this.whitelist;
    return {
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (channelId != null) 'channelId': channelId,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (description != null) 'description': description,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (manifestName != null) 'manifestName': manifestName,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (origination != null) 'origination': origination.toValue(),
      if (startoverWindowSeconds != null)
        'startoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
      if (timeDelaySeconds != null) 'timeDelaySeconds': timeDelaySeconds,
      if (url != null) 'url': url,
      if (whitelist != null) 'whitelist': whitelist,
    };
  }
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
class DashEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  /// Time (in seconds) between each encryption key rotation.
  final int? keyRotationIntervalSeconds;

  DashEncryption({
    required this.spekeKeyProvider,
    this.keyRotationIntervalSeconds,
  });

  factory DashEncryption.fromJson(Map<String, dynamic> json) {
    return DashEncryption(
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['spekeKeyProvider'] as Map<String, dynamic>),
      keyRotationIntervalSeconds: json['keyRotationIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    final keyRotationIntervalSeconds = this.keyRotationIntervalSeconds;
    return {
      'spekeKeyProvider': spekeKeyProvider,
      if (keyRotationIntervalSeconds != null)
        'keyRotationIntervalSeconds': keyRotationIntervalSeconds,
    };
  }
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
class DashPackage {
  final List<AdTriggersElement>? adTriggers;
  final AdsOnDeliveryRestrictions? adsOnDeliveryRestrictions;
  final DashEncryption? encryption;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool? includeIframeOnlyStream;

  /// Determines the position of some tags in the Media Presentation Description
  /// (MPD).  When set to FULL, elements like SegmentTemplate and
  /// ContentProtection are included in each Representation.  When set to COMPACT,
  /// duplicate elements are combined and presented at the AdaptationSet level.
  /// When set to DRM_TOP_LEVEL_COMPACT, content protection elements are placed
  /// the MPD level and referenced at the AdaptationSet level.
  final ManifestLayout? manifestLayout;

  /// Time window (in seconds) contained in each manifest.
  final int? manifestWindowSeconds;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  final int? minBufferTimeSeconds;

  /// Minimum duration (in seconds) between potential changes to the Dynamic
  /// Adaptive Streaming over HTTP (DASH) Media Presentation Description (MPD).
  final int? minUpdatePeriodSeconds;

  /// A list of triggers that controls when the outgoing Dynamic Adaptive
  /// Streaming over HTTP (DASH)
  /// Media Presentation Description (MPD) will be partitioned into multiple
  /// periods. If empty, the content will not
  /// be partitioned into more than one period. If the list contains "ADS", new
  /// periods will be created where
  /// the Channel source contains SCTE-35 ad markers.
  final List<PeriodTriggersElement>? periodTriggers;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type.  When set to
  /// "HBBTV_1_5", HbbTV 1.5 compliant output is enabled. When set to
  /// "DVB-DASH_2014", DVB-DASH 2014 compliant output is enabled.
  final Profile? profile;

  /// Duration (in seconds) of each segment. Actual segments will be
  /// rounded to the nearest multiple of the source segment duration.
  final int? segmentDurationSeconds;

  /// Determines the type of SegmentTemplate included in the Media Presentation
  /// Description (MPD).  When set to NUMBER_WITH_TIMELINE, a full timeline is
  /// presented in each SegmentTemplate, with $Number$ media URLs.  When set to
  /// TIME_WITH_TIMELINE, a full timeline is presented in each SegmentTemplate,
  /// with $Time$ media URLs. When set to NUMBER_WITH_DURATION, only a duration is
  /// included in each SegmentTemplate, with $Number$ media URLs.
  final SegmentTemplateFormat? segmentTemplateFormat;
  final StreamSelection? streamSelection;

  /// Duration (in seconds) to delay live content before presentation.
  final int? suggestedPresentationDelaySeconds;

  /// Determines the type of UTCTiming included in the Media Presentation
  /// Description (MPD)
  final UtcTiming? utcTiming;

  /// Specifies the value attribute of the UTCTiming field when utcTiming is set
  /// to HTTP-ISO, HTTP-HEAD or HTTP-XSDATE
  final String? utcTimingUri;

  DashPackage({
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.encryption,
    this.includeIframeOnlyStream,
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

  factory DashPackage.fromJson(Map<String, dynamic> json) {
    return DashPackage(
      adTriggers: (json['adTriggers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAdTriggersElement())
          .toList(),
      adsOnDeliveryRestrictions: (json['adsOnDeliveryRestrictions'] as String?)
          ?.toAdsOnDeliveryRestrictions(),
      encryption: json['encryption'] != null
          ? DashEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool?,
      manifestLayout: (json['manifestLayout'] as String?)?.toManifestLayout(),
      manifestWindowSeconds: json['manifestWindowSeconds'] as int?,
      minBufferTimeSeconds: json['minBufferTimeSeconds'] as int?,
      minUpdatePeriodSeconds: json['minUpdatePeriodSeconds'] as int?,
      periodTriggers: (json['periodTriggers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPeriodTriggersElement())
          .toList(),
      profile: (json['profile'] as String?)?.toProfile(),
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
      segmentTemplateFormat:
          (json['segmentTemplateFormat'] as String?)?.toSegmentTemplateFormat(),
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
      suggestedPresentationDelaySeconds:
          json['suggestedPresentationDelaySeconds'] as int?,
      utcTiming: (json['utcTiming'] as String?)?.toUtcTiming(),
      utcTimingUri: json['utcTimingUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adTriggers = this.adTriggers;
    final adsOnDeliveryRestrictions = this.adsOnDeliveryRestrictions;
    final encryption = this.encryption;
    final includeIframeOnlyStream = this.includeIframeOnlyStream;
    final manifestLayout = this.manifestLayout;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final minBufferTimeSeconds = this.minBufferTimeSeconds;
    final minUpdatePeriodSeconds = this.minUpdatePeriodSeconds;
    final periodTriggers = this.periodTriggers;
    final profile = this.profile;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final segmentTemplateFormat = this.segmentTemplateFormat;
    final streamSelection = this.streamSelection;
    final suggestedPresentationDelaySeconds =
        this.suggestedPresentationDelaySeconds;
    final utcTiming = this.utcTiming;
    final utcTimingUri = this.utcTimingUri;
    return {
      if (adTriggers != null)
        'adTriggers': adTriggers.map((e) => e.toValue()).toList(),
      if (adsOnDeliveryRestrictions != null)
        'adsOnDeliveryRestrictions': adsOnDeliveryRestrictions.toValue(),
      if (encryption != null) 'encryption': encryption,
      if (includeIframeOnlyStream != null)
        'includeIframeOnlyStream': includeIframeOnlyStream,
      if (manifestLayout != null) 'manifestLayout': manifestLayout.toValue(),
      if (manifestWindowSeconds != null)
        'manifestWindowSeconds': manifestWindowSeconds,
      if (minBufferTimeSeconds != null)
        'minBufferTimeSeconds': minBufferTimeSeconds,
      if (minUpdatePeriodSeconds != null)
        'minUpdatePeriodSeconds': minUpdatePeriodSeconds,
      if (periodTriggers != null)
        'periodTriggers': periodTriggers.map((e) => e.toValue()).toList(),
      if (profile != null) 'profile': profile.toValue(),
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (segmentTemplateFormat != null)
        'segmentTemplateFormat': segmentTemplateFormat.toValue(),
      if (streamSelection != null) 'streamSelection': streamSelection,
      if (suggestedPresentationDelaySeconds != null)
        'suggestedPresentationDelaySeconds': suggestedPresentationDelaySeconds,
      if (utcTiming != null) 'utcTiming': utcTiming.toValue(),
      if (utcTimingUri != null) 'utcTimingUri': utcTimingUri,
    };
  }
}

class DeleteChannelResponse {
  DeleteChannelResponse();

  factory DeleteChannelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteOriginEndpointResponse {
  DeleteOriginEndpointResponse();

  factory DeleteOriginEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteOriginEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  DescribeChannelResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribeHarvestJobResponse {
  /// The Amazon Resource Name (ARN) assigned to the HarvestJob.
  final String? arn;

  /// The ID of the Channel that the HarvestJob will harvest from.
  final String? channelId;

  /// The date and time the HarvestJob was submitted.
  final String? createdAt;

  /// The end of the time-window which will be harvested.
  final String? endTime;

  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted.
  final String? id;

  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  final String? originEndpointId;
  final S3Destination? s3Destination;

  /// The start of the time-window which will be harvested.
  final String? startTime;

  /// The current status of the HarvestJob. Consider setting up a CloudWatch Event
  /// to listen for
  /// HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch
  /// Event will
  /// include an explanation of why the HarvestJob failed.
  final Status? status;

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

  factory DescribeHarvestJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeHarvestJobResponse(
      arn: json['arn'] as String?,
      channelId: json['channelId'] as String?,
      createdAt: json['createdAt'] as String?,
      endTime: json['endTime'] as String?,
      id: json['id'] as String?,
      originEndpointId: json['originEndpointId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelId = this.channelId;
    final createdAt = this.createdAt;
    final endTime = this.endTime;
    final id = this.id;
    final originEndpointId = this.originEndpointId;
    final s3Destination = this.s3Destination;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (channelId != null) 'channelId': channelId,
      if (createdAt != null) 'createdAt': createdAt,
      if (endTime != null) 'endTime': endTime,
      if (id != null) 'id': id,
      if (originEndpointId != null) 'originEndpointId': originEndpointId,
      if (s3Destination != null) 's3Destination': s3Destination,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DescribeOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String? arn;
  final Authorization? authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String? channelId;
  final CmafPackage? cmafPackage;

  /// The date and time the OriginEndpoint was created.
  final String? createdAt;
  final DashPackage? dashPackage;

  /// A short text description of the OriginEndpoint.
  final String? description;
  final HlsPackage? hlsPackage;

  /// The ID of the OriginEndpoint.
  final String? id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String? manifestName;
  final MssPackage? mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  final Origination? origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  final int? startoverWindowSeconds;
  final Map<String, String>? tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int? timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String? url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String>? whitelist;

  DescribeOriginEndpointResponse({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.createdAt,
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

  factory DescribeOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return DescribeOriginEndpointResponse(
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      channelId: json['channelId'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      manifestName: json['manifestName'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      origination: (json['origination'] as String?)?.toOrigination(),
      startoverWindowSeconds: json['startoverWindowSeconds'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeDelaySeconds: json['timeDelaySeconds'] as int?,
      url: json['url'] as String?,
      whitelist: (json['whitelist'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorization = this.authorization;
    final channelId = this.channelId;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final description = this.description;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final manifestName = this.manifestName;
    final mssPackage = this.mssPackage;
    final origination = this.origination;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final timeDelaySeconds = this.timeDelaySeconds;
    final url = this.url;
    final whitelist = this.whitelist;
    return {
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (channelId != null) 'channelId': channelId,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (description != null) 'description': description,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (manifestName != null) 'manifestName': manifestName,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (origination != null) 'origination': origination.toValue(),
      if (startoverWindowSeconds != null)
        'startoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
      if (timeDelaySeconds != null) 'timeDelaySeconds': timeDelaySeconds,
      if (url != null) 'url': url,
      if (whitelist != null) 'whitelist': whitelist,
    };
  }
}

/// Configure egress access logging.
class EgressAccessLogs {
  /// Customize the log group name.
  final String? logGroupName;

  EgressAccessLogs({
    this.logGroupName,
  });

  factory EgressAccessLogs.fromJson(Map<String, dynamic> json) {
    return EgressAccessLogs(
      logGroupName: json['logGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    return {
      if (logGroupName != null) 'logGroupName': logGroupName,
    };
  }
}

/// Use encryptionContractConfiguration to configure one or more content
/// encryption keys for your endpoints that use SPEKE 2.0.
/// The encryption contract defines which content keys are used to encrypt the
/// audio and video tracks in your stream.
/// To configure the encryption contract, specify which audio and video
/// encryption presets to use.
/// Note the following considerations when using
/// encryptionContractConfiguration:
/// encryptionContractConfiguration can be used for DASH or CMAF endpoints that
/// use SPEKE 2.0. SPEKE 2.0 relies on the CPIX 2.3 specification.
/// You must disable key rotation for this endpoint by setting
/// keyRotationIntervalSeconds to 0.
class EncryptionContractConfiguration {
  /// A collection of audio encryption presets.
  final PresetSpeke20Audio presetSpeke20Audio;

  /// A collection of video encryption presets.
  final PresetSpeke20Video presetSpeke20Video;

  EncryptionContractConfiguration({
    required this.presetSpeke20Audio,
    required this.presetSpeke20Video,
  });

  factory EncryptionContractConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionContractConfiguration(
      presetSpeke20Audio:
          (json['presetSpeke20Audio'] as String).toPresetSpeke20Audio(),
      presetSpeke20Video:
          (json['presetSpeke20Video'] as String).toPresetSpeke20Video(),
    );
  }

  Map<String, dynamic> toJson() {
    final presetSpeke20Audio = this.presetSpeke20Audio;
    final presetSpeke20Video = this.presetSpeke20Video;
    return {
      'presetSpeke20Audio': presetSpeke20Audio.toValue(),
      'presetSpeke20Video': presetSpeke20Video.toValue(),
    };
  }
}

enum EncryptionMethod {
  aes_128,
  sampleAes,
}

extension EncryptionMethodValueExtension on EncryptionMethod {
  String toValue() {
    switch (this) {
      case EncryptionMethod.aes_128:
        return 'AES_128';
      case EncryptionMethod.sampleAes:
        return 'SAMPLE_AES';
    }
  }
}

extension EncryptionMethodFromString on String {
  EncryptionMethod toEncryptionMethod() {
    switch (this) {
      case 'AES_128':
        return EncryptionMethod.aes_128;
      case 'SAMPLE_AES':
        return EncryptionMethod.sampleAes;
    }
    throw Exception('$this is not known in enum EncryptionMethod');
  }
}

/// A HarvestJob resource configuration
class HarvestJob {
  /// The Amazon Resource Name (ARN) assigned to the HarvestJob.
  final String? arn;

  /// The ID of the Channel that the HarvestJob will harvest from.
  final String? channelId;

  /// The date and time the HarvestJob was submitted.
  final String? createdAt;

  /// The end of the time-window which will be harvested.
  final String? endTime;

  /// The ID of the HarvestJob. The ID must be unique within the region
  /// and it cannot be changed after the HarvestJob is submitted.
  final String? id;

  /// The ID of the OriginEndpoint that the HarvestJob will harvest from.
  /// This cannot be changed after the HarvestJob is submitted.
  final String? originEndpointId;
  final S3Destination? s3Destination;

  /// The start of the time-window which will be harvested.
  final String? startTime;

  /// The current status of the HarvestJob. Consider setting up a CloudWatch Event
  /// to listen for
  /// HarvestJobs as they succeed or fail. In the event of failure, the CloudWatch
  /// Event will
  /// include an explanation of why the HarvestJob failed.
  final Status? status;

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

  factory HarvestJob.fromJson(Map<String, dynamic> json) {
    return HarvestJob(
      arn: json['arn'] as String?,
      channelId: json['channelId'] as String?,
      createdAt: json['createdAt'] as String?,
      endTime: json['endTime'] as String?,
      id: json['id'] as String?,
      originEndpointId: json['originEndpointId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelId = this.channelId;
    final createdAt = this.createdAt;
    final endTime = this.endTime;
    final id = this.id;
    final originEndpointId = this.originEndpointId;
    final s3Destination = this.s3Destination;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (channelId != null) 'channelId': channelId,
      if (createdAt != null) 'createdAt': createdAt,
      if (endTime != null) 'endTime': endTime,
      if (id != null) 'id': id,
      if (originEndpointId != null) 'originEndpointId': originEndpointId,
      if (s3Destination != null) 's3Destination': s3Destination,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An HTTP Live Streaming (HLS) encryption configuration.
class HlsEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  /// A constant initialization vector for encryption (optional).
  /// When not specified the initialization vector will be periodically rotated.
  final String? constantInitializationVector;

  /// The encryption method to use.
  final EncryptionMethod? encryptionMethod;

  /// Interval (in seconds) between each encryption key rotation.
  final int? keyRotationIntervalSeconds;

  /// When enabled, the EXT-X-KEY tag will be repeated in output manifests.
  final bool? repeatExtXKey;

  HlsEncryption({
    required this.spekeKeyProvider,
    this.constantInitializationVector,
    this.encryptionMethod,
    this.keyRotationIntervalSeconds,
    this.repeatExtXKey,
  });

  factory HlsEncryption.fromJson(Map<String, dynamic> json) {
    return HlsEncryption(
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['spekeKeyProvider'] as Map<String, dynamic>),
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      encryptionMethod:
          (json['encryptionMethod'] as String?)?.toEncryptionMethod(),
      keyRotationIntervalSeconds: json['keyRotationIntervalSeconds'] as int?,
      repeatExtXKey: json['repeatExtXKey'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    final constantInitializationVector = this.constantInitializationVector;
    final encryptionMethod = this.encryptionMethod;
    final keyRotationIntervalSeconds = this.keyRotationIntervalSeconds;
    final repeatExtXKey = this.repeatExtXKey;
    return {
      'spekeKeyProvider': spekeKeyProvider,
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (encryptionMethod != null)
        'encryptionMethod': encryptionMethod.toValue(),
      if (keyRotationIntervalSeconds != null)
        'keyRotationIntervalSeconds': keyRotationIntervalSeconds,
      if (repeatExtXKey != null) 'repeatExtXKey': repeatExtXKey,
    };
  }
}

/// An HTTP Live Streaming (HLS) ingest resource configuration.
class HlsIngest {
  /// A list of endpoints to which the source stream should be sent.
  final List<IngestEndpoint>? ingestEndpoints;

  HlsIngest({
    this.ingestEndpoints,
  });

  factory HlsIngest.fromJson(Map<String, dynamic> json) {
    return HlsIngest(
      ingestEndpoints: (json['ingestEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ingestEndpoints = this.ingestEndpoints;
    return {
      if (ingestEndpoints != null) 'ingestEndpoints': ingestEndpoints,
    };
  }
}

/// A HTTP Live Streaming (HLS) manifest configuration.
class HlsManifest {
  /// The ID of the manifest. The ID must be unique within the OriginEndpoint and
  /// it cannot be changed after it is created.
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
  final AdMarkers? adMarkers;
  final List<AdTriggersElement>? adTriggers;
  final AdsOnDeliveryRestrictions? adsOnDeliveryRestrictions;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool? includeIframeOnlyStream;

  /// An optional short string appended to the end of the OriginEndpoint URL. If
  /// not specified, defaults to the manifestName for the OriginEndpoint.
  final String? manifestName;

  /// The HTTP Live Streaming (HLS) playlist type.
  /// When either "EVENT" or "VOD" is specified, a corresponding
  /// EXT-X-PLAYLIST-TYPE
  /// entry will be included in the media playlist.
  final PlaylistType? playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  final int? playlistWindowSeconds;

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
  final int? programDateTimeIntervalSeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String? url;

  HlsManifest({
    required this.id,
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.url,
  });

  factory HlsManifest.fromJson(Map<String, dynamic> json) {
    return HlsManifest(
      id: json['id'] as String,
      adMarkers: (json['adMarkers'] as String?)?.toAdMarkers(),
      adTriggers: (json['adTriggers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAdTriggersElement())
          .toList(),
      adsOnDeliveryRestrictions: (json['adsOnDeliveryRestrictions'] as String?)
          ?.toAdsOnDeliveryRestrictions(),
      includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool?,
      manifestName: json['manifestName'] as String?,
      playlistType: (json['playlistType'] as String?)?.toPlaylistType(),
      playlistWindowSeconds: json['playlistWindowSeconds'] as int?,
      programDateTimeIntervalSeconds:
          json['programDateTimeIntervalSeconds'] as int?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final adMarkers = this.adMarkers;
    final adTriggers = this.adTriggers;
    final adsOnDeliveryRestrictions = this.adsOnDeliveryRestrictions;
    final includeIframeOnlyStream = this.includeIframeOnlyStream;
    final manifestName = this.manifestName;
    final playlistType = this.playlistType;
    final playlistWindowSeconds = this.playlistWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final url = this.url;
    return {
      'id': id,
      if (adMarkers != null) 'adMarkers': adMarkers.toValue(),
      if (adTriggers != null)
        'adTriggers': adTriggers.map((e) => e.toValue()).toList(),
      if (adsOnDeliveryRestrictions != null)
        'adsOnDeliveryRestrictions': adsOnDeliveryRestrictions.toValue(),
      if (includeIframeOnlyStream != null)
        'includeIframeOnlyStream': includeIframeOnlyStream,
      if (manifestName != null) 'manifestName': manifestName,
      if (playlistType != null) 'playlistType': playlistType.toValue(),
      if (playlistWindowSeconds != null)
        'playlistWindowSeconds': playlistWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'programDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (url != null) 'url': url,
    };
  }
}

/// A HTTP Live Streaming (HLS) manifest configuration.
class HlsManifestCreateOrUpdateParameters {
  /// The ID of the manifest. The ID must be unique within the OriginEndpoint and
  /// it cannot be changed after it is created.
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
  final AdMarkers? adMarkers;
  final List<AdTriggersElement>? adTriggers;
  final AdsOnDeliveryRestrictions? adsOnDeliveryRestrictions;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool? includeIframeOnlyStream;

  /// An optional short string appended to the end of the OriginEndpoint URL. If
  /// not specified, defaults to the manifestName for the OriginEndpoint.
  final String? manifestName;

  /// The HTTP Live Streaming (HLS) playlist type.
  /// When either "EVENT" or "VOD" is specified, a corresponding
  /// EXT-X-PLAYLIST-TYPE
  /// entry will be included in the media playlist.
  final PlaylistType? playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  final int? playlistWindowSeconds;

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
  final int? programDateTimeIntervalSeconds;

  HlsManifestCreateOrUpdateParameters({
    required this.id,
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final adMarkers = this.adMarkers;
    final adTriggers = this.adTriggers;
    final adsOnDeliveryRestrictions = this.adsOnDeliveryRestrictions;
    final includeIframeOnlyStream = this.includeIframeOnlyStream;
    final manifestName = this.manifestName;
    final playlistType = this.playlistType;
    final playlistWindowSeconds = this.playlistWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    return {
      'id': id,
      if (adMarkers != null) 'adMarkers': adMarkers.toValue(),
      if (adTriggers != null)
        'adTriggers': adTriggers.map((e) => e.toValue()).toList(),
      if (adsOnDeliveryRestrictions != null)
        'adsOnDeliveryRestrictions': adsOnDeliveryRestrictions.toValue(),
      if (includeIframeOnlyStream != null)
        'includeIframeOnlyStream': includeIframeOnlyStream,
      if (manifestName != null) 'manifestName': manifestName,
      if (playlistType != null) 'playlistType': playlistType.toValue(),
      if (playlistWindowSeconds != null)
        'playlistWindowSeconds': playlistWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'programDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
    };
  }
}

/// An HTTP Live Streaming (HLS) packaging configuration.
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
  final AdMarkers? adMarkers;
  final List<AdTriggersElement>? adTriggers;
  final AdsOnDeliveryRestrictions? adsOnDeliveryRestrictions;
  final HlsEncryption? encryption;

  /// When enabled, MediaPackage passes through digital video broadcasting (DVB)
  /// subtitles into the output.
  final bool? includeDvbSubtitles;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool? includeIframeOnlyStream;

  /// The HTTP Live Streaming (HLS) playlist type.
  /// When either "EVENT" or "VOD" is specified, a corresponding
  /// EXT-X-PLAYLIST-TYPE
  /// entry will be included in the media playlist.
  final PlaylistType? playlistType;

  /// Time window (in seconds) contained in each parent manifest.
  final int? playlistWindowSeconds;

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
  final int? programDateTimeIntervalSeconds;

  /// Duration (in seconds) of each fragment. Actual fragments will be
  /// rounded to the nearest multiple of the source fragment duration.
  final int? segmentDurationSeconds;
  final StreamSelection? streamSelection;

  /// When enabled, audio streams will be placed in rendition groups in the
  /// output.
  final bool? useAudioRenditionGroup;

  HlsPackage({
    this.adMarkers,
    this.adTriggers,
    this.adsOnDeliveryRestrictions,
    this.encryption,
    this.includeDvbSubtitles,
    this.includeIframeOnlyStream,
    this.playlistType,
    this.playlistWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.segmentDurationSeconds,
    this.streamSelection,
    this.useAudioRenditionGroup,
  });

  factory HlsPackage.fromJson(Map<String, dynamic> json) {
    return HlsPackage(
      adMarkers: (json['adMarkers'] as String?)?.toAdMarkers(),
      adTriggers: (json['adTriggers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAdTriggersElement())
          .toList(),
      adsOnDeliveryRestrictions: (json['adsOnDeliveryRestrictions'] as String?)
          ?.toAdsOnDeliveryRestrictions(),
      encryption: json['encryption'] != null
          ? HlsEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      includeDvbSubtitles: json['includeDvbSubtitles'] as bool?,
      includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool?,
      playlistType: (json['playlistType'] as String?)?.toPlaylistType(),
      playlistWindowSeconds: json['playlistWindowSeconds'] as int?,
      programDateTimeIntervalSeconds:
          json['programDateTimeIntervalSeconds'] as int?,
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
      useAudioRenditionGroup: json['useAudioRenditionGroup'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkers = this.adMarkers;
    final adTriggers = this.adTriggers;
    final adsOnDeliveryRestrictions = this.adsOnDeliveryRestrictions;
    final encryption = this.encryption;
    final includeDvbSubtitles = this.includeDvbSubtitles;
    final includeIframeOnlyStream = this.includeIframeOnlyStream;
    final playlistType = this.playlistType;
    final playlistWindowSeconds = this.playlistWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final streamSelection = this.streamSelection;
    final useAudioRenditionGroup = this.useAudioRenditionGroup;
    return {
      if (adMarkers != null) 'adMarkers': adMarkers.toValue(),
      if (adTriggers != null)
        'adTriggers': adTriggers.map((e) => e.toValue()).toList(),
      if (adsOnDeliveryRestrictions != null)
        'adsOnDeliveryRestrictions': adsOnDeliveryRestrictions.toValue(),
      if (encryption != null) 'encryption': encryption,
      if (includeDvbSubtitles != null)
        'includeDvbSubtitles': includeDvbSubtitles,
      if (includeIframeOnlyStream != null)
        'includeIframeOnlyStream': includeIframeOnlyStream,
      if (playlistType != null) 'playlistType': playlistType.toValue(),
      if (playlistWindowSeconds != null)
        'playlistWindowSeconds': playlistWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'programDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (streamSelection != null) 'streamSelection': streamSelection,
      if (useAudioRenditionGroup != null)
        'useAudioRenditionGroup': useAudioRenditionGroup,
    };
  }
}

/// An endpoint for ingesting source content for a Channel.
class IngestEndpoint {
  /// The system generated unique identifier for the IngestEndpoint
  final String? id;

  /// The system generated password for ingest authentication.
  final String? password;

  /// The ingest URL to which the source stream should be sent.
  final String? url;

  /// The system generated username for ingest authentication.
  final String? username;

  IngestEndpoint({
    this.id,
    this.password,
    this.url,
    this.username,
  });

  factory IngestEndpoint.fromJson(Map<String, dynamic> json) {
    return IngestEndpoint(
      id: json['id'] as String?,
      password: json['password'] as String?,
      url: json['url'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final password = this.password;
    final url = this.url;
    final username = this.username;
    return {
      if (id != null) 'id': id,
      if (password != null) 'password': password,
      if (url != null) 'url': url,
      if (username != null) 'username': username,
    };
  }
}

/// Configure ingress access logging.
class IngressAccessLogs {
  /// Customize the log group name.
  final String? logGroupName;

  IngressAccessLogs({
    this.logGroupName,
  });

  factory IngressAccessLogs.fromJson(Map<String, dynamic> json) {
    return IngressAccessLogs(
      logGroupName: json['logGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    return {
      if (logGroupName != null) 'logGroupName': logGroupName,
    };
  }
}

class ListChannelsResponse {
  /// A list of Channel records.
  final List<Channel>? channels;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String? nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channels: (json['channels'] as List?)
          ?.whereNotNull()
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'channels': channels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListHarvestJobsResponse {
  /// A list of HarvestJob records.
  final List<HarvestJob>? harvestJobs;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String? nextToken;

  ListHarvestJobsResponse({
    this.harvestJobs,
    this.nextToken,
  });

  factory ListHarvestJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListHarvestJobsResponse(
      harvestJobs: (json['harvestJobs'] as List?)
          ?.whereNotNull()
          .map((e) => HarvestJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final harvestJobs = this.harvestJobs;
    final nextToken = this.nextToken;
    return {
      if (harvestJobs != null) 'harvestJobs': harvestJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListOriginEndpointsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String? nextToken;

  /// A list of OriginEndpoint records.
  final List<OriginEndpoint>? originEndpoints;

  ListOriginEndpointsResponse({
    this.nextToken,
    this.originEndpoints,
  });

  factory ListOriginEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListOriginEndpointsResponse(
      nextToken: json['nextToken'] as String?,
      originEndpoints: (json['originEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => OriginEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final originEndpoints = this.originEndpoints;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (originEndpoints != null) 'originEndpoints': originEndpoints,
    };
  }
}

class ListTagsForResourceResponse {
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum ManifestLayout {
  full,
  compact,
  drmTopLevelCompact,
}

extension ManifestLayoutValueExtension on ManifestLayout {
  String toValue() {
    switch (this) {
      case ManifestLayout.full:
        return 'FULL';
      case ManifestLayout.compact:
        return 'COMPACT';
      case ManifestLayout.drmTopLevelCompact:
        return 'DRM_TOP_LEVEL_COMPACT';
    }
  }
}

extension ManifestLayoutFromString on String {
  ManifestLayout toManifestLayout() {
    switch (this) {
      case 'FULL':
        return ManifestLayout.full;
      case 'COMPACT':
        return ManifestLayout.compact;
      case 'DRM_TOP_LEVEL_COMPACT':
        return ManifestLayout.drmTopLevelCompact;
    }
    throw Exception('$this is not known in enum ManifestLayout');
  }
}

/// A Microsoft Smooth Streaming (MSS) encryption configuration.
class MssEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  MssEncryption({
    required this.spekeKeyProvider,
  });

  factory MssEncryption.fromJson(Map<String, dynamic> json) {
    return MssEncryption(
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['spekeKeyProvider'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    return {
      'spekeKeyProvider': spekeKeyProvider,
    };
  }
}

/// A Microsoft Smooth Streaming (MSS) packaging configuration.
class MssPackage {
  final MssEncryption? encryption;

  /// The time window (in seconds) contained in each manifest.
  final int? manifestWindowSeconds;

  /// The duration (in seconds) of each segment.
  final int? segmentDurationSeconds;
  final StreamSelection? streamSelection;

  MssPackage({
    this.encryption,
    this.manifestWindowSeconds,
    this.segmentDurationSeconds,
    this.streamSelection,
  });

  factory MssPackage.fromJson(Map<String, dynamic> json) {
    return MssPackage(
      encryption: json['encryption'] != null
          ? MssEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      manifestWindowSeconds: json['manifestWindowSeconds'] as int?,
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryption = this.encryption;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final streamSelection = this.streamSelection;
    return {
      if (encryption != null) 'encryption': encryption,
      if (manifestWindowSeconds != null)
        'manifestWindowSeconds': manifestWindowSeconds,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (streamSelection != null) 'streamSelection': streamSelection,
    };
  }
}

/// An OriginEndpoint resource configuration.
class OriginEndpoint {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String? arn;
  final Authorization? authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String? channelId;
  final CmafPackage? cmafPackage;

  /// The date and time the OriginEndpoint was created.
  final String? createdAt;
  final DashPackage? dashPackage;

  /// A short text description of the OriginEndpoint.
  final String? description;
  final HlsPackage? hlsPackage;

  /// The ID of the OriginEndpoint.
  final String? id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String? manifestName;
  final MssPackage? mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  final Origination? origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  final int? startoverWindowSeconds;
  final Map<String, String>? tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int? timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String? url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String>? whitelist;

  OriginEndpoint({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.createdAt,
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

  factory OriginEndpoint.fromJson(Map<String, dynamic> json) {
    return OriginEndpoint(
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      channelId: json['channelId'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      manifestName: json['manifestName'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      origination: (json['origination'] as String?)?.toOrigination(),
      startoverWindowSeconds: json['startoverWindowSeconds'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeDelaySeconds: json['timeDelaySeconds'] as int?,
      url: json['url'] as String?,
      whitelist: (json['whitelist'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorization = this.authorization;
    final channelId = this.channelId;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final description = this.description;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final manifestName = this.manifestName;
    final mssPackage = this.mssPackage;
    final origination = this.origination;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final timeDelaySeconds = this.timeDelaySeconds;
    final url = this.url;
    final whitelist = this.whitelist;
    return {
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (channelId != null) 'channelId': channelId,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (description != null) 'description': description,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (manifestName != null) 'manifestName': manifestName,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (origination != null) 'origination': origination.toValue(),
      if (startoverWindowSeconds != null)
        'startoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
      if (timeDelaySeconds != null) 'timeDelaySeconds': timeDelaySeconds,
      if (url != null) 'url': url,
      if (whitelist != null) 'whitelist': whitelist,
    };
  }
}

enum Origination {
  allow,
  deny,
}

extension OriginationValueExtension on Origination {
  String toValue() {
    switch (this) {
      case Origination.allow:
        return 'ALLOW';
      case Origination.deny:
        return 'DENY';
    }
  }
}

extension OriginationFromString on String {
  Origination toOrigination() {
    switch (this) {
      case 'ALLOW':
        return Origination.allow;
      case 'DENY':
        return Origination.deny;
    }
    throw Exception('$this is not known in enum Origination');
  }
}

enum PlaylistType {
  none,
  event,
  vod,
}

extension PlaylistTypeValueExtension on PlaylistType {
  String toValue() {
    switch (this) {
      case PlaylistType.none:
        return 'NONE';
      case PlaylistType.event:
        return 'EVENT';
      case PlaylistType.vod:
        return 'VOD';
    }
  }
}

extension PlaylistTypeFromString on String {
  PlaylistType toPlaylistType() {
    switch (this) {
      case 'NONE':
        return PlaylistType.none;
      case 'EVENT':
        return PlaylistType.event;
      case 'VOD':
        return PlaylistType.vod;
    }
    throw Exception('$this is not known in enum PlaylistType');
  }
}

enum PresetSpeke20Audio {
  presetAudio_1,
  presetAudio_2,
  presetAudio_3,
  shared,
  unencrypted,
}

extension PresetSpeke20AudioValueExtension on PresetSpeke20Audio {
  String toValue() {
    switch (this) {
      case PresetSpeke20Audio.presetAudio_1:
        return 'PRESET-AUDIO-1';
      case PresetSpeke20Audio.presetAudio_2:
        return 'PRESET-AUDIO-2';
      case PresetSpeke20Audio.presetAudio_3:
        return 'PRESET-AUDIO-3';
      case PresetSpeke20Audio.shared:
        return 'SHARED';
      case PresetSpeke20Audio.unencrypted:
        return 'UNENCRYPTED';
    }
  }
}

extension PresetSpeke20AudioFromString on String {
  PresetSpeke20Audio toPresetSpeke20Audio() {
    switch (this) {
      case 'PRESET-AUDIO-1':
        return PresetSpeke20Audio.presetAudio_1;
      case 'PRESET-AUDIO-2':
        return PresetSpeke20Audio.presetAudio_2;
      case 'PRESET-AUDIO-3':
        return PresetSpeke20Audio.presetAudio_3;
      case 'SHARED':
        return PresetSpeke20Audio.shared;
      case 'UNENCRYPTED':
        return PresetSpeke20Audio.unencrypted;
    }
    throw Exception('$this is not known in enum PresetSpeke20Audio');
  }
}

enum PresetSpeke20Video {
  presetVideo_1,
  presetVideo_2,
  presetVideo_3,
  presetVideo_4,
  presetVideo_5,
  presetVideo_6,
  presetVideo_7,
  presetVideo_8,
  shared,
  unencrypted,
}

extension PresetSpeke20VideoValueExtension on PresetSpeke20Video {
  String toValue() {
    switch (this) {
      case PresetSpeke20Video.presetVideo_1:
        return 'PRESET-VIDEO-1';
      case PresetSpeke20Video.presetVideo_2:
        return 'PRESET-VIDEO-2';
      case PresetSpeke20Video.presetVideo_3:
        return 'PRESET-VIDEO-3';
      case PresetSpeke20Video.presetVideo_4:
        return 'PRESET-VIDEO-4';
      case PresetSpeke20Video.presetVideo_5:
        return 'PRESET-VIDEO-5';
      case PresetSpeke20Video.presetVideo_6:
        return 'PRESET-VIDEO-6';
      case PresetSpeke20Video.presetVideo_7:
        return 'PRESET-VIDEO-7';
      case PresetSpeke20Video.presetVideo_8:
        return 'PRESET-VIDEO-8';
      case PresetSpeke20Video.shared:
        return 'SHARED';
      case PresetSpeke20Video.unencrypted:
        return 'UNENCRYPTED';
    }
  }
}

extension PresetSpeke20VideoFromString on String {
  PresetSpeke20Video toPresetSpeke20Video() {
    switch (this) {
      case 'PRESET-VIDEO-1':
        return PresetSpeke20Video.presetVideo_1;
      case 'PRESET-VIDEO-2':
        return PresetSpeke20Video.presetVideo_2;
      case 'PRESET-VIDEO-3':
        return PresetSpeke20Video.presetVideo_3;
      case 'PRESET-VIDEO-4':
        return PresetSpeke20Video.presetVideo_4;
      case 'PRESET-VIDEO-5':
        return PresetSpeke20Video.presetVideo_5;
      case 'PRESET-VIDEO-6':
        return PresetSpeke20Video.presetVideo_6;
      case 'PRESET-VIDEO-7':
        return PresetSpeke20Video.presetVideo_7;
      case 'PRESET-VIDEO-8':
        return PresetSpeke20Video.presetVideo_8;
      case 'SHARED':
        return PresetSpeke20Video.shared;
      case 'UNENCRYPTED':
        return PresetSpeke20Video.unencrypted;
    }
    throw Exception('$this is not known in enum PresetSpeke20Video');
  }
}

enum Profile {
  none,
  hbbtv_1_5,
  hybridcast,
  dvbDash_2014,
}

extension ProfileValueExtension on Profile {
  String toValue() {
    switch (this) {
      case Profile.none:
        return 'NONE';
      case Profile.hbbtv_1_5:
        return 'HBBTV_1_5';
      case Profile.hybridcast:
        return 'HYBRIDCAST';
      case Profile.dvbDash_2014:
        return 'DVB_DASH_2014';
    }
  }
}

extension ProfileFromString on String {
  Profile toProfile() {
    switch (this) {
      case 'NONE':
        return Profile.none;
      case 'HBBTV_1_5':
        return Profile.hbbtv_1_5;
      case 'HYBRIDCAST':
        return Profile.hybridcast;
      case 'DVB_DASH_2014':
        return Profile.dvbDash_2014;
    }
    throw Exception('$this is not known in enum Profile');
  }
}

@Deprecated('Deprecated')
class RotateChannelCredentialsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  RotateChannelCredentialsResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory RotateChannelCredentialsResponse.fromJson(Map<String, dynamic> json) {
    return RotateChannelCredentialsResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

class RotateIngestEndpointCredentialsResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  RotateIngestEndpointCredentialsResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory RotateIngestEndpointCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return RotateIngestEndpointCredentialsResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Configuration parameters for where in an S3 bucket to place the harvested
/// content
class S3Destination {
  /// The name of an S3 bucket within which harvested content will be exported
  final String bucketName;

  /// The key in the specified S3 bucket where the harvested top-level manifest
  /// will be placed.
  final String manifestKey;

  /// The IAM role used to write to the specified S3 bucket
  final String roleArn;

  S3Destination({
    required this.bucketName,
    required this.manifestKey,
    required this.roleArn,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      bucketName: json['bucketName'] as String,
      manifestKey: json['manifestKey'] as String,
      roleArn: json['roleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final manifestKey = this.manifestKey;
    final roleArn = this.roleArn;
    return {
      'bucketName': bucketName,
      'manifestKey': manifestKey,
      'roleArn': roleArn,
    };
  }
}

enum SegmentTemplateFormat {
  numberWithTimeline,
  timeWithTimeline,
  numberWithDuration,
}

extension SegmentTemplateFormatValueExtension on SegmentTemplateFormat {
  String toValue() {
    switch (this) {
      case SegmentTemplateFormat.numberWithTimeline:
        return 'NUMBER_WITH_TIMELINE';
      case SegmentTemplateFormat.timeWithTimeline:
        return 'TIME_WITH_TIMELINE';
      case SegmentTemplateFormat.numberWithDuration:
        return 'NUMBER_WITH_DURATION';
    }
  }
}

extension SegmentTemplateFormatFromString on String {
  SegmentTemplateFormat toSegmentTemplateFormat() {
    switch (this) {
      case 'NUMBER_WITH_TIMELINE':
        return SegmentTemplateFormat.numberWithTimeline;
      case 'TIME_WITH_TIMELINE':
        return SegmentTemplateFormat.timeWithTimeline;
      case 'NUMBER_WITH_DURATION':
        return SegmentTemplateFormat.numberWithDuration;
    }
    throw Exception('$this is not known in enum SegmentTemplateFormat');
  }
}

/// A configuration for accessing an external Secure Packager and Encoder Key
/// Exchange (SPEKE) service that will provide encryption keys.
class SpekeKeyProvider {
  /// The resource ID to include in key requests.
  final String resourceId;

  /// An Amazon Resource Name (ARN) of an IAM role that AWS Elemental
  /// MediaPackage will assume when accessing the key provider service.
  final String roleArn;

  /// The system IDs to include in key requests.
  final List<String> systemIds;

  /// The URL of the external key provider service.
  final String url;

  /// An Amazon Resource Name (ARN) of a Certificate Manager certificate
  /// that MediaPackage will use for enforcing secure end-to-end data
  /// transfer with the key provider service.
  final String? certificateArn;
  final EncryptionContractConfiguration? encryptionContractConfiguration;

  SpekeKeyProvider({
    required this.resourceId,
    required this.roleArn,
    required this.systemIds,
    required this.url,
    this.certificateArn,
    this.encryptionContractConfiguration,
  });

  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) {
    return SpekeKeyProvider(
      resourceId: json['resourceId'] as String,
      roleArn: json['roleArn'] as String,
      systemIds: (json['systemIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      url: json['url'] as String,
      certificateArn: json['certificateArn'] as String?,
      encryptionContractConfiguration:
          json['encryptionContractConfiguration'] != null
              ? EncryptionContractConfiguration.fromJson(
                  json['encryptionContractConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final roleArn = this.roleArn;
    final systemIds = this.systemIds;
    final url = this.url;
    final certificateArn = this.certificateArn;
    final encryptionContractConfiguration =
        this.encryptionContractConfiguration;
    return {
      'resourceId': resourceId,
      'roleArn': roleArn,
      'systemIds': systemIds,
      'url': url,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (encryptionContractConfiguration != null)
        'encryptionContractConfiguration': encryptionContractConfiguration,
    };
  }
}

enum Status {
  inProgress,
  succeeded,
  failed,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.inProgress:
        return 'IN_PROGRESS';
      case Status.succeeded:
        return 'SUCCEEDED';
      case Status.failed:
        return 'FAILED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return Status.inProgress;
      case 'SUCCEEDED':
        return Status.succeeded;
      case 'FAILED':
        return Status.failed;
    }
    throw Exception('$this is not known in enum Status');
  }
}

enum StreamOrder {
  original,
  videoBitrateAscending,
  videoBitrateDescending,
}

extension StreamOrderValueExtension on StreamOrder {
  String toValue() {
    switch (this) {
      case StreamOrder.original:
        return 'ORIGINAL';
      case StreamOrder.videoBitrateAscending:
        return 'VIDEO_BITRATE_ASCENDING';
      case StreamOrder.videoBitrateDescending:
        return 'VIDEO_BITRATE_DESCENDING';
    }
  }
}

extension StreamOrderFromString on String {
  StreamOrder toStreamOrder() {
    switch (this) {
      case 'ORIGINAL':
        return StreamOrder.original;
      case 'VIDEO_BITRATE_ASCENDING':
        return StreamOrder.videoBitrateAscending;
      case 'VIDEO_BITRATE_DESCENDING':
        return StreamOrder.videoBitrateDescending;
    }
    throw Exception('$this is not known in enum StreamOrder');
  }
}

/// A StreamSelection configuration.
class StreamSelection {
  /// The maximum video bitrate (bps) to include in output.
  final int? maxVideoBitsPerSecond;

  /// The minimum video bitrate (bps) to include in output.
  final int? minVideoBitsPerSecond;

  /// A directive that determines the order of streams in the output.
  final StreamOrder? streamOrder;

  StreamSelection({
    this.maxVideoBitsPerSecond,
    this.minVideoBitsPerSecond,
    this.streamOrder,
  });

  factory StreamSelection.fromJson(Map<String, dynamic> json) {
    return StreamSelection(
      maxVideoBitsPerSecond: json['maxVideoBitsPerSecond'] as int?,
      minVideoBitsPerSecond: json['minVideoBitsPerSecond'] as int?,
      streamOrder: (json['streamOrder'] as String?)?.toStreamOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxVideoBitsPerSecond = this.maxVideoBitsPerSecond;
    final minVideoBitsPerSecond = this.minVideoBitsPerSecond;
    final streamOrder = this.streamOrder;
    return {
      if (maxVideoBitsPerSecond != null)
        'maxVideoBitsPerSecond': maxVideoBitsPerSecond,
      if (minVideoBitsPerSecond != null)
        'minVideoBitsPerSecond': minVideoBitsPerSecond,
      if (streamOrder != null) 'streamOrder': streamOrder.toValue(),
    };
  }
}

class UpdateChannelResponse {
  /// The Amazon Resource Name (ARN) assigned to the Channel.
  final String? arn;

  /// The date and time the Channel was created.
  final String? createdAt;

  /// A short text description of the Channel.
  final String? description;
  final EgressAccessLogs? egressAccessLogs;
  final HlsIngest? hlsIngest;

  /// The ID of the Channel.
  final String? id;
  final IngressAccessLogs? ingressAccessLogs;
  final Map<String, String>? tags;

  UpdateChannelResponse({
    this.arn,
    this.createdAt,
    this.description,
    this.egressAccessLogs,
    this.hlsIngest,
    this.id,
    this.ingressAccessLogs,
    this.tags,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      description: json['description'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      hlsIngest: json['hlsIngest'] != null
          ? HlsIngest.fromJson(json['hlsIngest'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      ingressAccessLogs: json['ingressAccessLogs'] != null
          ? IngressAccessLogs.fromJson(
              json['ingressAccessLogs'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final egressAccessLogs = this.egressAccessLogs;
    final hlsIngest = this.hlsIngest;
    final id = this.id;
    final ingressAccessLogs = this.ingressAccessLogs;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (description != null) 'description': description,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (hlsIngest != null) 'hlsIngest': hlsIngest,
      if (id != null) 'id': id,
      if (ingressAccessLogs != null) 'ingressAccessLogs': ingressAccessLogs,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) assigned to the OriginEndpoint.
  final String? arn;
  final Authorization? authorization;

  /// The ID of the Channel the OriginEndpoint is associated with.
  final String? channelId;
  final CmafPackage? cmafPackage;

  /// The date and time the OriginEndpoint was created.
  final String? createdAt;
  final DashPackage? dashPackage;

  /// A short text description of the OriginEndpoint.
  final String? description;
  final HlsPackage? hlsPackage;

  /// The ID of the OriginEndpoint.
  final String? id;

  /// A short string appended to the end of the OriginEndpoint URL.
  final String? manifestName;
  final MssPackage? mssPackage;

  /// Control whether origination of video is allowed for this OriginEndpoint. If
  /// set to ALLOW, the OriginEndpoint
  /// may by requested, pursuant to any other form of access control. If set to
  /// DENY, the OriginEndpoint may not be
  /// requested. This can be helpful for Live to VOD harvesting, or for
  /// temporarily disabling origination
  final Origination? origination;

  /// Maximum duration (seconds) of content to retain for startover playback.
  /// If not specified, startover playback will be disabled for the
  /// OriginEndpoint.
  final int? startoverWindowSeconds;
  final Map<String, String>? tags;

  /// Amount of delay (seconds) to enforce on the playback of live content.
  /// If not specified, there will be no time delay in effect for the
  /// OriginEndpoint.
  final int? timeDelaySeconds;

  /// The URL of the packaged OriginEndpoint for consumption.
  final String? url;

  /// A list of source IP CIDR blocks that will be allowed to access the
  /// OriginEndpoint.
  final List<String>? whitelist;

  UpdateOriginEndpointResponse({
    this.arn,
    this.authorization,
    this.channelId,
    this.cmafPackage,
    this.createdAt,
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

  factory UpdateOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateOriginEndpointResponse(
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      channelId: json['channelId'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      manifestName: json['manifestName'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      origination: (json['origination'] as String?)?.toOrigination(),
      startoverWindowSeconds: json['startoverWindowSeconds'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeDelaySeconds: json['timeDelaySeconds'] as int?,
      url: json['url'] as String?,
      whitelist: (json['whitelist'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorization = this.authorization;
    final channelId = this.channelId;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final description = this.description;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final manifestName = this.manifestName;
    final mssPackage = this.mssPackage;
    final origination = this.origination;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final timeDelaySeconds = this.timeDelaySeconds;
    final url = this.url;
    final whitelist = this.whitelist;
    return {
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (channelId != null) 'channelId': channelId,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (description != null) 'description': description,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (manifestName != null) 'manifestName': manifestName,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (origination != null) 'origination': origination.toValue(),
      if (startoverWindowSeconds != null)
        'startoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
      if (timeDelaySeconds != null) 'timeDelaySeconds': timeDelaySeconds,
      if (url != null) 'url': url,
      if (whitelist != null) 'whitelist': whitelist,
    };
  }
}

enum UtcTiming {
  none,
  httpHead,
  httpIso,
  httpXsdate,
}

extension UtcTimingValueExtension on UtcTiming {
  String toValue() {
    switch (this) {
      case UtcTiming.none:
        return 'NONE';
      case UtcTiming.httpHead:
        return 'HTTP-HEAD';
      case UtcTiming.httpIso:
        return 'HTTP-ISO';
      case UtcTiming.httpXsdate:
        return 'HTTP-XSDATE';
    }
  }
}

extension UtcTimingFromString on String {
  UtcTiming toUtcTiming() {
    switch (this) {
      case 'NONE':
        return UtcTiming.none;
      case 'HTTP-HEAD':
        return UtcTiming.httpHead;
      case 'HTTP-ISO':
        return UtcTiming.httpIso;
      case 'HTTP-XSDATE':
        return UtcTiming.httpXsdate;
    }
    throw Exception('$this is not known in enum UtcTiming');
  }
}

enum AdTriggersElement {
  spliceInsert,
  $break,
  providerAdvertisement,
  distributorAdvertisement,
  providerPlacementOpportunity,
  distributorPlacementOpportunity,
  providerOverlayPlacementOpportunity,
  distributorOverlayPlacementOpportunity,
}

extension AdTriggersElementValueExtension on AdTriggersElement {
  String toValue() {
    switch (this) {
      case AdTriggersElement.spliceInsert:
        return 'SPLICE_INSERT';
      case AdTriggersElement.$break:
        return 'BREAK';
      case AdTriggersElement.providerAdvertisement:
        return 'PROVIDER_ADVERTISEMENT';
      case AdTriggersElement.distributorAdvertisement:
        return 'DISTRIBUTOR_ADVERTISEMENT';
      case AdTriggersElement.providerPlacementOpportunity:
        return 'PROVIDER_PLACEMENT_OPPORTUNITY';
      case AdTriggersElement.distributorPlacementOpportunity:
        return 'DISTRIBUTOR_PLACEMENT_OPPORTUNITY';
      case AdTriggersElement.providerOverlayPlacementOpportunity:
        return 'PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY';
      case AdTriggersElement.distributorOverlayPlacementOpportunity:
        return 'DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY';
    }
  }
}

extension AdTriggersElementFromString on String {
  AdTriggersElement toAdTriggersElement() {
    switch (this) {
      case 'SPLICE_INSERT':
        return AdTriggersElement.spliceInsert;
      case 'BREAK':
        return AdTriggersElement.$break;
      case 'PROVIDER_ADVERTISEMENT':
        return AdTriggersElement.providerAdvertisement;
      case 'DISTRIBUTOR_ADVERTISEMENT':
        return AdTriggersElement.distributorAdvertisement;
      case 'PROVIDER_PLACEMENT_OPPORTUNITY':
        return AdTriggersElement.providerPlacementOpportunity;
      case 'DISTRIBUTOR_PLACEMENT_OPPORTUNITY':
        return AdTriggersElement.distributorPlacementOpportunity;
      case 'PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY':
        return AdTriggersElement.providerOverlayPlacementOpportunity;
      case 'DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY':
        return AdTriggersElement.distributorOverlayPlacementOpportunity;
    }
    throw Exception('$this is not known in enum AdTriggersElement');
  }
}

enum PeriodTriggersElement {
  ads,
}

extension PeriodTriggersElementValueExtension on PeriodTriggersElement {
  String toValue() {
    switch (this) {
      case PeriodTriggersElement.ads:
        return 'ADS';
    }
  }
}

extension PeriodTriggersElementFromString on String {
  PeriodTriggersElement toPeriodTriggersElement() {
    switch (this) {
      case 'ADS':
        return PeriodTriggersElement.ads;
    }
    throw Exception('$this is not known in enum PeriodTriggersElement');
  }
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
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
