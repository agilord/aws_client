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

part '2018-11-07.g.dart';

/// AWS Elemental MediaPackage VOD
class MediaPackageVod {
  final _s.RestJsonProtocol _protocol;
  MediaPackageVod({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediapackage-vod',
            signingName: 'mediapackage-vod',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new MediaPackage VOD Asset resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Asset.
  ///
  /// Parameter [packagingGroupId] :
  /// The ID of the PackagingGroup for the Asset.
  ///
  /// Parameter [sourceArn] :
  /// ARN of the source object in S3.
  ///
  /// Parameter [sourceRoleArn] :
  /// The IAM role ARN used to access the source S3 bucket.
  ///
  /// Parameter [resourceId] :
  /// The resource ID to include in SPEKE key requests.
  Future<CreateAssetResponse> createAsset({
    @_s.required String id,
    @_s.required String packagingGroupId,
    @_s.required String sourceArn,
    @_s.required String sourceRoleArn,
    String resourceId,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(packagingGroupId, 'packagingGroupId');
    ArgumentError.checkNotNull(sourceArn, 'sourceArn');
    ArgumentError.checkNotNull(sourceRoleArn, 'sourceRoleArn');
    final $payload = <String, dynamic>{
      'id': id,
      'packagingGroupId': packagingGroupId,
      'sourceArn': sourceArn,
      'sourceRoleArn': sourceRoleArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetResponse.fromJson(response);
  }

  /// Creates a new MediaPackage VOD PackagingConfiguration resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the PackagingConfiguration.
  ///
  /// Parameter [packagingGroupId] :
  /// The ID of a PackagingGroup.
  Future<CreatePackagingConfigurationResponse> createPackagingConfiguration({
    @_s.required String id,
    @_s.required String packagingGroupId,
    CmafPackage cmafPackage,
    DashPackage dashPackage,
    HlsPackage hlsPackage,
    MssPackage mssPackage,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(packagingGroupId, 'packagingGroupId');
    final $payload = <String, dynamic>{
      'id': id,
      'packagingGroupId': packagingGroupId,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/packaging_configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackagingConfigurationResponse.fromJson(response);
  }

  /// Creates a new MediaPackage VOD PackagingGroup resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the PackagingGroup.
  Future<CreatePackagingGroupResponse> createPackagingGroup({
    @_s.required String id,
    Authorization authorization,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      'id': id,
      if (authorization != null) 'authorization': authorization,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/packaging_groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackagingGroupResponse.fromJson(response);
  }

  /// Deletes an existing MediaPackage VOD Asset resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the MediaPackage VOD Asset resource to delete.
  Future<void> deleteAsset({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assets/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssetResponse.fromJson(response);
  }

  /// Deletes a MediaPackage VOD PackagingConfiguration resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the MediaPackage VOD PackagingConfiguration resource to delete.
  Future<void> deletePackagingConfiguration({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/packaging_configurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackagingConfigurationResponse.fromJson(response);
  }

  /// Deletes a MediaPackage VOD PackagingGroup resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of the MediaPackage VOD PackagingGroup resource to delete.
  Future<void> deletePackagingGroup({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/packaging_groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackagingGroupResponse.fromJson(response);
  }

  /// Returns a description of a MediaPackage VOD Asset resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of an MediaPackage VOD Asset resource.
  Future<DescribeAssetResponse> describeAsset({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetResponse.fromJson(response);
  }

  /// Returns a description of a MediaPackage VOD PackagingConfiguration
  /// resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of a MediaPackage VOD PackagingConfiguration resource.
  Future<DescribePackagingConfigurationResponse>
      describePackagingConfiguration({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packaging_configurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackagingConfigurationResponse.fromJson(response);
  }

  /// Returns a description of a MediaPackage VOD PackagingGroup resource.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of a MediaPackage VOD PackagingGroup resource.
  Future<DescribePackagingGroupResponse> describePackagingGroup({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packaging_groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackagingGroupResponse.fromJson(response);
  }

  /// Returns a collection of MediaPackage VOD Asset resources.
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
  ///
  /// Parameter [packagingGroupId] :
  /// Returns Assets associated with the specified PackagingGroup.
  Future<ListAssetsResponse> listAssets({
    int maxResults,
    String nextToken,
    String packagingGroupId,
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
      if (packagingGroupId != null) 'packagingGroupId': [packagingGroupId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetsResponse.fromJson(response);
  }

  /// Returns a collection of MediaPackage VOD PackagingConfiguration resources.
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
  ///
  /// Parameter [packagingGroupId] :
  /// Returns MediaPackage VOD PackagingConfigurations associated with the
  /// specified PackagingGroup.
  Future<ListPackagingConfigurationsResponse> listPackagingConfigurations({
    int maxResults,
    String nextToken,
    String packagingGroupId,
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
      if (packagingGroupId != null) 'packagingGroupId': [packagingGroupId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packaging_configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagingConfigurationsResponse.fromJson(response);
  }

  /// Returns a collection of MediaPackage VOD PackagingGroup resources.
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
  Future<ListPackagingGroupsResponse> listPackagingGroups({
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
      requestUri: '/packaging_groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagingGroupsResponse.fromJson(response);
  }

  /// Returns a list of the tags assigned to the specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource. You can get this from the
  /// response to any request to the resource.
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

  /// Adds tags to the specified resource. You can specify one or more tags to
  /// add.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource. You can get this from the
  /// response to any request to the resource.
  ///
  /// Parameter [tags] :
  /// A collection of tags associated with a resource
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

  /// Removes tags from the specified resource. You can specify one or more tags
  /// to remove.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource. You can get this from the
  /// response to any request to the resource.
  ///
  /// Parameter [tagKeys] :
  /// A comma-separated list of the tag keys to remove from the resource.
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

  /// Updates a specific packaging group. You can't change the id attribute or
  /// any other system-generated attributes.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The ID of a MediaPackage VOD PackagingGroup resource.
  Future<UpdatePackagingGroupResponse> updatePackagingGroup({
    @_s.required String id,
    Authorization authorization,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (authorization != null) 'authorization': authorization,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/packaging_groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackagingGroupResponse.fromJson(response);
  }
}

enum AdMarkers {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SCTE35_ENHANCED')
  scte35Enhanced,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// A MediaPackage VOD Asset resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssetShallow {
  /// The ARN of the Asset.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time the Asset was initially submitted for Ingest.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The unique identifier for the Asset.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the PackagingGroup for the Asset.
  @_s.JsonKey(name: 'packagingGroupId')
  final String packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// ARN of the source object in S3.
  @_s.JsonKey(name: 'sourceArn')
  final String sourceArn;

  /// The IAM role ARN used to access the source S3 bucket.
  @_s.JsonKey(name: 'sourceRoleArn')
  final String sourceRoleArn;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  AssetShallow({
    this.arn,
    this.createdAt,
    this.id,
    this.packagingGroupId,
    this.resourceId,
    this.sourceArn,
    this.sourceRoleArn,
    this.tags,
  });
  factory AssetShallow.fromJson(Map<String, dynamic> json) =>
      _$AssetShallowFromJson(json);
}

/// CDN Authorization credentials
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Authorization {
  /// The Amazon Resource Name (ARN) for the secret in AWS Secrets Manager that is
  /// used for CDN authorization.
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

/// A CMAF encryption configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmafEncryption {
  @_s.JsonKey(name: 'spekeKeyProvider')
  final SpekeKeyProvider spekeKeyProvider;

  CmafEncryption({
    @_s.required this.spekeKeyProvider,
  });
  factory CmafEncryption.fromJson(Map<String, dynamic> json) =>
      _$CmafEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$CmafEncryptionToJson(this);
}

/// A CMAF packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CmafPackage {
  /// A list of HLS manifest configurations.
  @_s.JsonKey(name: 'hlsManifests')
  final List<HlsManifest> hlsManifests;
  @_s.JsonKey(name: 'encryption')
  final CmafEncryption encryption;

  /// Duration (in seconds) of each fragment. Actual fragments will be
  /// rounded to the nearest multiple of the source fragment duration.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;

  CmafPackage({
    @_s.required this.hlsManifests,
    this.encryption,
    this.segmentDurationSeconds,
  });
  factory CmafPackage.fromJson(Map<String, dynamic> json) =>
      _$CmafPackageFromJson(json);

  Map<String, dynamic> toJson() => _$CmafPackageToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssetResponse {
  /// The ARN of the Asset.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time the Asset was initially submitted for Ingest.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The list of egress endpoints available for the Asset.
  @_s.JsonKey(name: 'egressEndpoints')
  final List<EgressEndpoint> egressEndpoints;

  /// The unique identifier for the Asset.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the PackagingGroup for the Asset.
  @_s.JsonKey(name: 'packagingGroupId')
  final String packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// ARN of the source object in S3.
  @_s.JsonKey(name: 'sourceArn')
  final String sourceArn;

  /// The IAM role_arn used to access the source S3 bucket.
  @_s.JsonKey(name: 'sourceRoleArn')
  final String sourceRoleArn;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateAssetResponse({
    this.arn,
    this.createdAt,
    this.egressEndpoints,
    this.id,
    this.packagingGroupId,
    this.resourceId,
    this.sourceArn,
    this.sourceRoleArn,
    this.tags,
  });
  factory CreateAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePackagingConfigurationResponse {
  /// The ARN of the PackagingConfiguration.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the PackagingConfiguration.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// The ID of a PackagingGroup.
  @_s.JsonKey(name: 'packagingGroupId')
  final String packagingGroupId;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreatePackagingConfigurationResponse({
    this.arn,
    this.cmafPackage,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
    this.tags,
  });
  factory CreatePackagingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePackagingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePackagingGroupResponse {
  /// The ARN of the PackagingGroup.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The ID of the PackagingGroup.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreatePackagingGroupResponse({
    this.arn,
    this.authorization,
    this.domainName,
    this.id,
    this.tags,
  });
  factory CreatePackagingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePackagingGroupResponseFromJson(json);
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

  DashEncryption({
    @_s.required this.spekeKeyProvider,
  });
  factory DashEncryption.fromJson(Map<String, dynamic> json) =>
      _$DashEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$DashEncryptionToJson(this);
}

/// A DASH manifest configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashManifest {
  /// Determines the position of some tags in the Media Presentation Description
  /// (MPD).  When set to FULL, elements like SegmentTemplate and
  /// ContentProtection are included in each Representation.  When set to COMPACT,
  /// duplicate elements are combined and presented at the AdaptationSet level.
  @_s.JsonKey(name: 'manifestLayout')
  final ManifestLayout manifestLayout;

  /// An optional string to include in the name of the manifest.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  @_s.JsonKey(name: 'minBufferTimeSeconds')
  final int minBufferTimeSeconds;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type.  When set to
  /// "HBBTV_1_5", HbbTV 1.5 compliant output is enabled.
  @_s.JsonKey(name: 'profile')
  final Profile profile;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  DashManifest({
    this.manifestLayout,
    this.manifestName,
    this.minBufferTimeSeconds,
    this.profile,
    this.streamSelection,
  });
  factory DashManifest.fromJson(Map<String, dynamic> json) =>
      _$DashManifestFromJson(json);

  Map<String, dynamic> toJson() => _$DashManifestToJson(this);
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DashPackage {
  /// A list of DASH manifest configurations.
  @_s.JsonKey(name: 'dashManifests')
  final List<DashManifest> dashManifests;
  @_s.JsonKey(name: 'encryption')
  final DashEncryption encryption;

  /// A list of triggers that controls when the outgoing Dynamic Adaptive
  /// Streaming over HTTP (DASH)
  /// Media Presentation Description (MPD) will be partitioned into multiple
  /// periods. If empty, the content will not
  /// be partitioned into more than one period. If the list contains "ADS", new
  /// periods will be created where
  /// the Asset contains SCTE-35 ad markers.
  @_s.JsonKey(name: 'periodTriggers')
  final List<PeriodTriggersElement> periodTriggers;

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

  DashPackage({
    @_s.required this.dashManifests,
    this.encryption,
    this.periodTriggers,
    this.segmentDurationSeconds,
    this.segmentTemplateFormat,
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
class DeleteAssetResponse {
  DeleteAssetResponse();
  factory DeleteAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePackagingConfigurationResponse {
  DeletePackagingConfigurationResponse();
  factory DeletePackagingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePackagingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePackagingGroupResponse {
  DeletePackagingGroupResponse();
  factory DeletePackagingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePackagingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAssetResponse {
  /// The ARN of the Asset.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time the Asset was initially submitted for Ingest.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The list of egress endpoints available for the Asset.
  @_s.JsonKey(name: 'egressEndpoints')
  final List<EgressEndpoint> egressEndpoints;

  /// The unique identifier for the Asset.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the PackagingGroup for the Asset.
  @_s.JsonKey(name: 'packagingGroupId')
  final String packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// ARN of the source object in S3.
  @_s.JsonKey(name: 'sourceArn')
  final String sourceArn;

  /// The IAM role_arn used to access the source S3 bucket.
  @_s.JsonKey(name: 'sourceRoleArn')
  final String sourceRoleArn;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeAssetResponse({
    this.arn,
    this.createdAt,
    this.egressEndpoints,
    this.id,
    this.packagingGroupId,
    this.resourceId,
    this.sourceArn,
    this.sourceRoleArn,
    this.tags,
  });
  factory DescribeAssetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAssetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePackagingConfigurationResponse {
  /// The ARN of the PackagingConfiguration.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the PackagingConfiguration.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// The ID of a PackagingGroup.
  @_s.JsonKey(name: 'packagingGroupId')
  final String packagingGroupId;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribePackagingConfigurationResponse({
    this.arn,
    this.cmafPackage,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
    this.tags,
  });
  factory DescribePackagingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePackagingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePackagingGroupResponse {
  /// The ARN of the PackagingGroup.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The ID of the PackagingGroup.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribePackagingGroupResponse({
    this.arn,
    this.authorization,
    this.domainName,
    this.id,
    this.tags,
  });
  factory DescribePackagingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePackagingGroupResponseFromJson(json);
}

/// The endpoint URL used to access an Asset using one PackagingConfiguration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EgressEndpoint {
  /// The ID of the PackagingConfiguration being applied to the Asset.
  @_s.JsonKey(name: 'packagingConfigurationId')
  final String packagingConfigurationId;

  /// The URL of the parent manifest for the repackaged Asset.
  @_s.JsonKey(name: 'url')
  final String url;

  EgressEndpoint({
    this.packagingConfigurationId,
    this.url,
  });
  factory EgressEndpoint.fromJson(Map<String, dynamic> json) =>
      _$EgressEndpointFromJson(json);
}

enum EncryptionMethod {
  @_s.JsonValue('AES_128')
  aes_128,
  @_s.JsonValue('SAMPLE_AES')
  sampleAes,
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

  HlsEncryption({
    @_s.required this.spekeKeyProvider,
    this.constantInitializationVector,
    this.encryptionMethod,
  });
  factory HlsEncryption.fromJson(Map<String, dynamic> json) =>
      _$HlsEncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$HlsEncryptionToJson(this);
}

/// An HTTP Live Streaming (HLS) manifest configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsManifest {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint.
  /// "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest.
  /// "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35
  /// messages in the input source.
  @_s.JsonKey(name: 'adMarkers')
  final AdMarkers adMarkers;

  /// When enabled, an I-Frame only stream will be included in the output.
  @_s.JsonKey(name: 'includeIframeOnlyStream')
  final bool includeIframeOnlyStream;

  /// An optional string to include in the name of the manifest.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;

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

  /// When enabled, the EXT-X-KEY tag will be repeated in output manifests.
  @_s.JsonKey(name: 'repeatExtXKey')
  final bool repeatExtXKey;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  HlsManifest({
    this.adMarkers,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.programDateTimeIntervalSeconds,
    this.repeatExtXKey,
    this.streamSelection,
  });
  factory HlsManifest.fromJson(Map<String, dynamic> json) =>
      _$HlsManifestFromJson(json);

  Map<String, dynamic> toJson() => _$HlsManifestToJson(this);
}

/// An HTTP Live Streaming (HLS) packaging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsPackage {
  /// A list of HLS manifest configurations.
  @_s.JsonKey(name: 'hlsManifests')
  final List<HlsManifest> hlsManifests;
  @_s.JsonKey(name: 'encryption')
  final HlsEncryption encryption;

  /// Duration (in seconds) of each fragment. Actual fragments will be
  /// rounded to the nearest multiple of the source fragment duration.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;

  /// When enabled, audio streams will be placed in rendition groups in the
  /// output.
  @_s.JsonKey(name: 'useAudioRenditionGroup')
  final bool useAudioRenditionGroup;

  HlsPackage({
    @_s.required this.hlsManifests,
    this.encryption,
    this.segmentDurationSeconds,
    this.useAudioRenditionGroup,
  });
  factory HlsPackage.fromJson(Map<String, dynamic> json) =>
      _$HlsPackageFromJson(json);

  Map<String, dynamic> toJson() => _$HlsPackageToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssetsResponse {
  /// A list of MediaPackage VOD Asset resources.
  @_s.JsonKey(name: 'assets')
  final List<AssetShallow> assets;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssetsResponse({
    this.assets,
    this.nextToken,
  });
  factory ListAssetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPackagingConfigurationsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of MediaPackage VOD PackagingConfiguration resources.
  @_s.JsonKey(name: 'packagingConfigurations')
  final List<PackagingConfiguration> packagingConfigurations;

  ListPackagingConfigurationsResponse({
    this.nextToken,
    this.packagingConfigurations,
  });
  factory ListPackagingConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPackagingConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPackagingGroupsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of MediaPackage VOD PackagingGroup resources.
  @_s.JsonKey(name: 'packagingGroups')
  final List<PackagingGroup> packagingGroups;

  ListPackagingGroupsResponse({
    this.nextToken,
    this.packagingGroups,
  });
  factory ListPackagingGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPackagingGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A collection of tags associated with a resource
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

/// A Microsoft Smooth Streaming (MSS) manifest configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MssManifest {
  /// An optional string to include in the name of the manifest.
  @_s.JsonKey(name: 'manifestName')
  final String manifestName;
  @_s.JsonKey(name: 'streamSelection')
  final StreamSelection streamSelection;

  MssManifest({
    this.manifestName,
    this.streamSelection,
  });
  factory MssManifest.fromJson(Map<String, dynamic> json) =>
      _$MssManifestFromJson(json);

  Map<String, dynamic> toJson() => _$MssManifestToJson(this);
}

/// A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MssPackage {
  /// A list of MSS manifest configurations.
  @_s.JsonKey(name: 'mssManifests')
  final List<MssManifest> mssManifests;
  @_s.JsonKey(name: 'encryption')
  final MssEncryption encryption;

  /// The duration (in seconds) of each segment.
  @_s.JsonKey(name: 'segmentDurationSeconds')
  final int segmentDurationSeconds;

  MssPackage({
    @_s.required this.mssManifests,
    this.encryption,
    this.segmentDurationSeconds,
  });
  factory MssPackage.fromJson(Map<String, dynamic> json) =>
      _$MssPackageFromJson(json);

  Map<String, dynamic> toJson() => _$MssPackageToJson(this);
}

/// A MediaPackage VOD PackagingConfiguration resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PackagingConfiguration {
  /// The ARN of the PackagingConfiguration.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'cmafPackage')
  final CmafPackage cmafPackage;
  @_s.JsonKey(name: 'dashPackage')
  final DashPackage dashPackage;
  @_s.JsonKey(name: 'hlsPackage')
  final HlsPackage hlsPackage;

  /// The ID of the PackagingConfiguration.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'mssPackage')
  final MssPackage mssPackage;

  /// The ID of a PackagingGroup.
  @_s.JsonKey(name: 'packagingGroupId')
  final String packagingGroupId;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  PackagingConfiguration({
    this.arn,
    this.cmafPackage,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
    this.tags,
  });
  factory PackagingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PackagingConfigurationFromJson(json);
}

/// A MediaPackage VOD PackagingGroup resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PackagingGroup {
  /// The ARN of the PackagingGroup.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The ID of the PackagingGroup.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  PackagingGroup({
    this.arn,
    this.authorization,
    this.domainName,
    this.id,
    this.tags,
  });
  factory PackagingGroup.fromJson(Map<String, dynamic> json) =>
      _$PackagingGroupFromJson(json);
}

enum Profile {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HBBTV_1_5')
  hbbtv_1_5,
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

  SpekeKeyProvider({
    @_s.required this.roleArn,
    @_s.required this.systemIds,
    @_s.required this.url,
  });
  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) =>
      _$SpekeKeyProviderFromJson(json);

  Map<String, dynamic> toJson() => _$SpekeKeyProviderToJson(this);
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
class UpdatePackagingGroupResponse {
  /// The ARN of the PackagingGroup.
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'authorization')
  final Authorization authorization;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The ID of the PackagingGroup.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdatePackagingGroupResponse({
    this.arn,
    this.authorization,
    this.domainName,
    this.id,
    this.tags,
  });
  factory UpdatePackagingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePackagingGroupResponseFromJson(json);
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
