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

/// AWS Elemental MediaPackage VOD
class MediaPackageVod {
  final _s.RestJsonProtocol _protocol;
  MediaPackageVod({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediapackage-vod',
            signingName: 'mediapackage-vod',
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

  /// Changes the packaging group's properities to configure log subscription
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
  Future<ConfigureLogsResponse> configureLogs({
    required String id,
    EgressAccessLogs? egressAccessLogs,
  }) async {
    final $payload = <String, dynamic>{
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/packaging_groups/${Uri.encodeComponent(id)}/configure_logs',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigureLogsResponse.fromJson(response);
  }

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
    required String id,
    required String packagingGroupId,
    required String sourceArn,
    required String sourceRoleArn,
    String? resourceId,
    Map<String, String>? tags,
  }) async {
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
    required String id,
    required String packagingGroupId,
    CmafPackage? cmafPackage,
    DashPackage? dashPackage,
    HlsPackage? hlsPackage,
    MssPackage? mssPackage,
    Map<String, String>? tags,
  }) async {
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
    required String id,
    Authorization? authorization,
    EgressAccessLogs? egressAccessLogs,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'id': id,
      if (authorization != null) 'authorization': authorization,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
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
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assets/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/packaging_configurations/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/packaging_groups/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
  }) async {
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
    required String id,
  }) async {
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
    required String id,
  }) async {
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
    int? maxResults,
    String? nextToken,
    String? packagingGroupId,
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
    int? maxResults,
    String? nextToken,
    String? packagingGroupId,
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
    required String id,
    Authorization? authorization,
  }) async {
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
  none('NONE'),
  scte35Enhanced('SCTE35_ENHANCED'),
  passthrough('PASSTHROUGH'),
  ;

  final String value;

  const AdMarkers(this.value);

  static AdMarkers fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AdMarkers'));
}

/// A MediaPackage VOD Asset resource.
class AssetShallow {
  /// The ARN of the Asset.
  final String? arn;

  /// The time the Asset was initially submitted for Ingest.
  final String? createdAt;

  /// The unique identifier for the Asset.
  final String? id;

  /// The ID of the PackagingGroup for the Asset.
  final String? packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  final String? resourceId;

  /// ARN of the source object in S3.
  final String? sourceArn;

  /// The IAM role ARN used to access the source S3 bucket.
  final String? sourceRoleArn;
  final Map<String, String>? tags;

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

  factory AssetShallow.fromJson(Map<String, dynamic> json) {
    return AssetShallow(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      packagingGroupId: json['packagingGroupId'] as String?,
      resourceId: json['resourceId'] as String?,
      sourceArn: json['sourceArn'] as String?,
      sourceRoleArn: json['sourceRoleArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final packagingGroupId = this.packagingGroupId;
    final resourceId = this.resourceId;
    final sourceArn = this.sourceArn;
    final sourceRoleArn = this.sourceRoleArn;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (id != null) 'id': id,
      if (packagingGroupId != null) 'packagingGroupId': packagingGroupId,
      if (resourceId != null) 'resourceId': resourceId,
      if (sourceArn != null) 'sourceArn': sourceArn,
      if (sourceRoleArn != null) 'sourceRoleArn': sourceRoleArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// CDN Authorization credentials
class Authorization {
  /// The Amazon Resource Name (ARN) for the secret in AWS Secrets Manager that is
  /// used for CDN authorization.
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

/// A CMAF encryption configuration.
class CmafEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  /// An optional 128-bit, 16-byte hex value represented by a 32-character string,
  /// used in conjunction with the key for encrypting blocks. If you don't specify
  /// a value, then MediaPackage creates the constant initialization vector (IV).
  final String? constantInitializationVector;

  CmafEncryption({
    required this.spekeKeyProvider,
    this.constantInitializationVector,
  });

  factory CmafEncryption.fromJson(Map<String, dynamic> json) {
    return CmafEncryption(
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['spekeKeyProvider'] as Map<String, dynamic>),
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    final constantInitializationVector = this.constantInitializationVector;
    return {
      'spekeKeyProvider': spekeKeyProvider,
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
    };
  }
}

/// A CMAF packaging configuration.
class CmafPackage {
  /// A list of HLS manifest configurations.
  final List<HlsManifest> hlsManifests;
  final CmafEncryption? encryption;

  /// When includeEncoderConfigurationInSegments is set to true, MediaPackage
  /// places your encoder's Sequence Parameter Set (SPS), Picture Parameter Set
  /// (PPS), and Video Parameter Set (VPS) metadata in every video segment instead
  /// of in the init fragment. This lets you use different SPS/PPS/VPS settings
  /// for your assets during content playback.
  final bool? includeEncoderConfigurationInSegments;

  /// Duration (in seconds) of each fragment. Actual fragments will be
  /// rounded to the nearest multiple of the source fragment duration.
  final int? segmentDurationSeconds;

  CmafPackage({
    required this.hlsManifests,
    this.encryption,
    this.includeEncoderConfigurationInSegments,
    this.segmentDurationSeconds,
  });

  factory CmafPackage.fromJson(Map<String, dynamic> json) {
    return CmafPackage(
      hlsManifests: (json['hlsManifests'] as List)
          .nonNulls
          .map((e) => HlsManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryption: json['encryption'] != null
          ? CmafEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      includeEncoderConfigurationInSegments:
          json['includeEncoderConfigurationInSegments'] as bool?,
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final hlsManifests = this.hlsManifests;
    final encryption = this.encryption;
    final includeEncoderConfigurationInSegments =
        this.includeEncoderConfigurationInSegments;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    return {
      'hlsManifests': hlsManifests,
      if (encryption != null) 'encryption': encryption,
      if (includeEncoderConfigurationInSegments != null)
        'includeEncoderConfigurationInSegments':
            includeEncoderConfigurationInSegments,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
    };
  }
}

class ConfigureLogsResponse {
  /// The ARN of the PackagingGroup.
  final String? arn;
  final Authorization? authorization;

  /// The time the PackagingGroup was created.
  final String? createdAt;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  final String? domainName;
  final EgressAccessLogs? egressAccessLogs;

  /// The ID of the PackagingGroup.
  final String? id;
  final Map<String, String>? tags;

  ConfigureLogsResponse({
    this.arn,
    this.authorization,
    this.createdAt,
    this.domainName,
    this.egressAccessLogs,
    this.id,
    this.tags,
  });

  factory ConfigureLogsResponse.fromJson(Map<String, dynamic> json) {
    return ConfigureLogsResponse(
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      domainName: json['domainName'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorization = this.authorization;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final egressAccessLogs = this.egressAccessLogs;
    final id = this.id;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (createdAt != null) 'createdAt': createdAt,
      if (domainName != null) 'domainName': domainName,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateAssetResponse {
  /// The ARN of the Asset.
  final String? arn;

  /// The time the Asset was initially submitted for Ingest.
  final String? createdAt;

  /// The list of egress endpoints available for the Asset.
  final List<EgressEndpoint>? egressEndpoints;

  /// The unique identifier for the Asset.
  final String? id;

  /// The ID of the PackagingGroup for the Asset.
  final String? packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  final String? resourceId;

  /// ARN of the source object in S3.
  final String? sourceArn;

  /// The IAM role_arn used to access the source S3 bucket.
  final String? sourceRoleArn;
  final Map<String, String>? tags;

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

  factory CreateAssetResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssetResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.nonNulls
          .map((e) => EgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      packagingGroupId: json['packagingGroupId'] as String?,
      resourceId: json['resourceId'] as String?,
      sourceArn: json['sourceArn'] as String?,
      sourceRoleArn: json['sourceRoleArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final egressEndpoints = this.egressEndpoints;
    final id = this.id;
    final packagingGroupId = this.packagingGroupId;
    final resourceId = this.resourceId;
    final sourceArn = this.sourceArn;
    final sourceRoleArn = this.sourceRoleArn;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (id != null) 'id': id,
      if (packagingGroupId != null) 'packagingGroupId': packagingGroupId,
      if (resourceId != null) 'resourceId': resourceId,
      if (sourceArn != null) 'sourceArn': sourceArn,
      if (sourceRoleArn != null) 'sourceRoleArn': sourceRoleArn,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreatePackagingConfigurationResponse {
  /// The ARN of the PackagingConfiguration.
  final String? arn;
  final CmafPackage? cmafPackage;

  /// The time the PackagingConfiguration was created.
  final String? createdAt;
  final DashPackage? dashPackage;
  final HlsPackage? hlsPackage;

  /// The ID of the PackagingConfiguration.
  final String? id;
  final MssPackage? mssPackage;

  /// The ID of a PackagingGroup.
  final String? packagingGroupId;
  final Map<String, String>? tags;

  CreatePackagingConfigurationResponse({
    this.arn,
    this.cmafPackage,
    this.createdAt,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
    this.tags,
  });

  factory CreatePackagingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePackagingConfigurationResponse(
      arn: json['arn'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      packagingGroupId: json['packagingGroupId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final mssPackage = this.mssPackage;
    final packagingGroupId = this.packagingGroupId;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (packagingGroupId != null) 'packagingGroupId': packagingGroupId,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreatePackagingGroupResponse {
  /// The ARN of the PackagingGroup.
  final String? arn;
  final Authorization? authorization;

  /// The time the PackagingGroup was created.
  final String? createdAt;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  final String? domainName;
  final EgressAccessLogs? egressAccessLogs;

  /// The ID of the PackagingGroup.
  final String? id;
  final Map<String, String>? tags;

  CreatePackagingGroupResponse({
    this.arn,
    this.authorization,
    this.createdAt,
    this.domainName,
    this.egressAccessLogs,
    this.id,
    this.tags,
  });

  factory CreatePackagingGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreatePackagingGroupResponse(
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      domainName: json['domainName'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorization = this.authorization;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final egressAccessLogs = this.egressAccessLogs;
    final id = this.id;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (createdAt != null) 'createdAt': createdAt,
      if (domainName != null) 'domainName': domainName,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) encryption configuration.
class DashEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  DashEncryption({
    required this.spekeKeyProvider,
  });

  factory DashEncryption.fromJson(Map<String, dynamic> json) {
    return DashEncryption(
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

/// A DASH manifest configuration.
class DashManifest {
  /// Determines the position of some tags in the Media Presentation Description
  /// (MPD).  When set to FULL, elements like SegmentTemplate and
  /// ContentProtection are included in each Representation.  When set to COMPACT,
  /// duplicate elements are combined and presented at the AdaptationSet level.
  final ManifestLayout? manifestLayout;

  /// An optional string to include in the name of the manifest.
  final String? manifestName;

  /// Minimum duration (in seconds) that a player will buffer media before
  /// starting the presentation.
  final int? minBufferTimeSeconds;

  /// The Dynamic Adaptive Streaming over HTTP (DASH) profile type.  When set to
  /// "HBBTV_1_5", HbbTV 1.5 compliant output is enabled.
  final Profile? profile;

  /// The source of scte markers used. When set to SEGMENTS, the scte markers are
  /// sourced from the segments of the ingested content. When set to MANIFEST, the
  /// scte markers are sourced from the manifest of the ingested content.
  final ScteMarkersSource? scteMarkersSource;
  final StreamSelection? streamSelection;

  DashManifest({
    this.manifestLayout,
    this.manifestName,
    this.minBufferTimeSeconds,
    this.profile,
    this.scteMarkersSource,
    this.streamSelection,
  });

  factory DashManifest.fromJson(Map<String, dynamic> json) {
    return DashManifest(
      manifestLayout:
          (json['manifestLayout'] as String?)?.let(ManifestLayout.fromString),
      manifestName: json['manifestName'] as String?,
      minBufferTimeSeconds: json['minBufferTimeSeconds'] as int?,
      profile: (json['profile'] as String?)?.let(Profile.fromString),
      scteMarkersSource: (json['scteMarkersSource'] as String?)
          ?.let(ScteMarkersSource.fromString),
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestLayout = this.manifestLayout;
    final manifestName = this.manifestName;
    final minBufferTimeSeconds = this.minBufferTimeSeconds;
    final profile = this.profile;
    final scteMarkersSource = this.scteMarkersSource;
    final streamSelection = this.streamSelection;
    return {
      if (manifestLayout != null) 'manifestLayout': manifestLayout.value,
      if (manifestName != null) 'manifestName': manifestName,
      if (minBufferTimeSeconds != null)
        'minBufferTimeSeconds': minBufferTimeSeconds,
      if (profile != null) 'profile': profile.value,
      if (scteMarkersSource != null)
        'scteMarkersSource': scteMarkersSource.value,
      if (streamSelection != null) 'streamSelection': streamSelection,
    };
  }
}

/// A Dynamic Adaptive Streaming over HTTP (DASH) packaging configuration.
class DashPackage {
  /// A list of DASH manifest configurations.
  final List<DashManifest> dashManifests;
  final DashEncryption? encryption;

  /// When includeEncoderConfigurationInSegments is set to true, MediaPackage
  /// places your encoder's Sequence Parameter Set (SPS), Picture Parameter Set
  /// (PPS), and Video Parameter Set (VPS) metadata in every video segment instead
  /// of in the init fragment. This lets you use different SPS/PPS/VPS settings
  /// for your assets during content playback.
  final bool? includeEncoderConfigurationInSegments;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool? includeIframeOnlyStream;

  /// A list of triggers that controls when the outgoing Dynamic Adaptive
  /// Streaming over HTTP (DASH)
  /// Media Presentation Description (MPD) will be partitioned into multiple
  /// periods. If empty, the content will not
  /// be partitioned into more than one period. If the list contains "ADS", new
  /// periods will be created where
  /// the Asset contains SCTE-35 ad markers.
  final List<PeriodTriggersElement>? periodTriggers;

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

  DashPackage({
    required this.dashManifests,
    this.encryption,
    this.includeEncoderConfigurationInSegments,
    this.includeIframeOnlyStream,
    this.periodTriggers,
    this.segmentDurationSeconds,
    this.segmentTemplateFormat,
  });

  factory DashPackage.fromJson(Map<String, dynamic> json) {
    return DashPackage(
      dashManifests: (json['dashManifests'] as List)
          .nonNulls
          .map((e) => DashManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryption: json['encryption'] != null
          ? DashEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      includeEncoderConfigurationInSegments:
          json['includeEncoderConfigurationInSegments'] as bool?,
      includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool?,
      periodTriggers: (json['periodTriggers'] as List?)
          ?.nonNulls
          .map((e) => PeriodTriggersElement.fromString((e as String)))
          .toList(),
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
      segmentTemplateFormat: (json['segmentTemplateFormat'] as String?)
          ?.let(SegmentTemplateFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dashManifests = this.dashManifests;
    final encryption = this.encryption;
    final includeEncoderConfigurationInSegments =
        this.includeEncoderConfigurationInSegments;
    final includeIframeOnlyStream = this.includeIframeOnlyStream;
    final periodTriggers = this.periodTriggers;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final segmentTemplateFormat = this.segmentTemplateFormat;
    return {
      'dashManifests': dashManifests,
      if (encryption != null) 'encryption': encryption,
      if (includeEncoderConfigurationInSegments != null)
        'includeEncoderConfigurationInSegments':
            includeEncoderConfigurationInSegments,
      if (includeIframeOnlyStream != null)
        'includeIframeOnlyStream': includeIframeOnlyStream,
      if (periodTriggers != null)
        'periodTriggers': periodTriggers.map((e) => e.value).toList(),
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (segmentTemplateFormat != null)
        'segmentTemplateFormat': segmentTemplateFormat.value,
    };
  }
}

class DeleteAssetResponse {
  DeleteAssetResponse();

  factory DeleteAssetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePackagingConfigurationResponse {
  DeletePackagingConfigurationResponse();

  factory DeletePackagingConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeletePackagingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePackagingGroupResponse {
  DeletePackagingGroupResponse();

  factory DeletePackagingGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeletePackagingGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAssetResponse {
  /// The ARN of the Asset.
  final String? arn;

  /// The time the Asset was initially submitted for Ingest.
  final String? createdAt;

  /// The list of egress endpoints available for the Asset.
  final List<EgressEndpoint>? egressEndpoints;

  /// The unique identifier for the Asset.
  final String? id;

  /// The ID of the PackagingGroup for the Asset.
  final String? packagingGroupId;

  /// The resource ID to include in SPEKE key requests.
  final String? resourceId;

  /// ARN of the source object in S3.
  final String? sourceArn;

  /// The IAM role_arn used to access the source S3 bucket.
  final String? sourceRoleArn;
  final Map<String, String>? tags;

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

  factory DescribeAssetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetResponse(
      arn: json['arn'] as String?,
      createdAt: json['createdAt'] as String?,
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.nonNulls
          .map((e) => EgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      packagingGroupId: json['packagingGroupId'] as String?,
      resourceId: json['resourceId'] as String?,
      sourceArn: json['sourceArn'] as String?,
      sourceRoleArn: json['sourceRoleArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final egressEndpoints = this.egressEndpoints;
    final id = this.id;
    final packagingGroupId = this.packagingGroupId;
    final resourceId = this.resourceId;
    final sourceArn = this.sourceArn;
    final sourceRoleArn = this.sourceRoleArn;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': createdAt,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (id != null) 'id': id,
      if (packagingGroupId != null) 'packagingGroupId': packagingGroupId,
      if (resourceId != null) 'resourceId': resourceId,
      if (sourceArn != null) 'sourceArn': sourceArn,
      if (sourceRoleArn != null) 'sourceRoleArn': sourceRoleArn,
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribePackagingConfigurationResponse {
  /// The ARN of the PackagingConfiguration.
  final String? arn;
  final CmafPackage? cmafPackage;

  /// The time the PackagingConfiguration was created.
  final String? createdAt;
  final DashPackage? dashPackage;
  final HlsPackage? hlsPackage;

  /// The ID of the PackagingConfiguration.
  final String? id;
  final MssPackage? mssPackage;

  /// The ID of a PackagingGroup.
  final String? packagingGroupId;
  final Map<String, String>? tags;

  DescribePackagingConfigurationResponse({
    this.arn,
    this.cmafPackage,
    this.createdAt,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
    this.tags,
  });

  factory DescribePackagingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePackagingConfigurationResponse(
      arn: json['arn'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      packagingGroupId: json['packagingGroupId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final mssPackage = this.mssPackage;
    final packagingGroupId = this.packagingGroupId;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (packagingGroupId != null) 'packagingGroupId': packagingGroupId,
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribePackagingGroupResponse {
  /// The approximate asset count of the PackagingGroup.
  final int? approximateAssetCount;

  /// The ARN of the PackagingGroup.
  final String? arn;
  final Authorization? authorization;

  /// The time the PackagingGroup was created.
  final String? createdAt;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  final String? domainName;
  final EgressAccessLogs? egressAccessLogs;

  /// The ID of the PackagingGroup.
  final String? id;
  final Map<String, String>? tags;

  DescribePackagingGroupResponse({
    this.approximateAssetCount,
    this.arn,
    this.authorization,
    this.createdAt,
    this.domainName,
    this.egressAccessLogs,
    this.id,
    this.tags,
  });

  factory DescribePackagingGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribePackagingGroupResponse(
      approximateAssetCount: json['approximateAssetCount'] as int?,
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      domainName: json['domainName'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateAssetCount = this.approximateAssetCount;
    final arn = this.arn;
    final authorization = this.authorization;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final egressAccessLogs = this.egressAccessLogs;
    final id = this.id;
    final tags = this.tags;
    return {
      if (approximateAssetCount != null)
        'approximateAssetCount': approximateAssetCount,
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (createdAt != null) 'createdAt': createdAt,
      if (domainName != null) 'domainName': domainName,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
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

/// The endpoint URL used to access an Asset using one PackagingConfiguration.
class EgressEndpoint {
  /// The ID of the PackagingConfiguration being applied to the Asset.
  final String? packagingConfigurationId;

  /// The current processing status of the asset used for the packaging
  /// configuration. The status can be either QUEUED, PROCESSING, PLAYABLE, or
  /// FAILED. Status information won't be available for most assets ingested
  /// before 2021-09-30.
  final String? status;

  /// The URL of the parent manifest for the repackaged Asset.
  final String? url;

  EgressEndpoint({
    this.packagingConfigurationId,
    this.status,
    this.url,
  });

  factory EgressEndpoint.fromJson(Map<String, dynamic> json) {
    return EgressEndpoint(
      packagingConfigurationId: json['packagingConfigurationId'] as String?,
      status: json['status'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final packagingConfigurationId = this.packagingConfigurationId;
    final status = this.status;
    final url = this.url;
    return {
      if (packagingConfigurationId != null)
        'packagingConfigurationId': packagingConfigurationId,
      if (status != null) 'status': status,
      if (url != null) 'url': url,
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
/// encryptionContractConfiguration can be used for DASH endpoints that use
/// SPEKE 2.0. SPEKE 2.0 relies on the CPIX 2.3 specification.
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
          PresetSpeke20Audio.fromString((json['presetSpeke20Audio'] as String)),
      presetSpeke20Video:
          PresetSpeke20Video.fromString((json['presetSpeke20Video'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final presetSpeke20Audio = this.presetSpeke20Audio;
    final presetSpeke20Video = this.presetSpeke20Video;
    return {
      'presetSpeke20Audio': presetSpeke20Audio.value,
      'presetSpeke20Video': presetSpeke20Video.value,
    };
  }
}

enum EncryptionMethod {
  aes_128('AES_128'),
  sampleAes('SAMPLE_AES'),
  ;

  final String value;

  const EncryptionMethod(this.value);

  static EncryptionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EncryptionMethod'));
}

/// An HTTP Live Streaming (HLS) encryption configuration.
class HlsEncryption {
  final SpekeKeyProvider spekeKeyProvider;

  /// A constant initialization vector for encryption (optional).
  /// When not specified the initialization vector will be periodically rotated.
  final String? constantInitializationVector;

  /// The encryption method to use.
  final EncryptionMethod? encryptionMethod;

  HlsEncryption({
    required this.spekeKeyProvider,
    this.constantInitializationVector,
    this.encryptionMethod,
  });

  factory HlsEncryption.fromJson(Map<String, dynamic> json) {
    return HlsEncryption(
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          json['spekeKeyProvider'] as Map<String, dynamic>),
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      encryptionMethod: (json['encryptionMethod'] as String?)
          ?.let(EncryptionMethod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final spekeKeyProvider = this.spekeKeyProvider;
    final constantInitializationVector = this.constantInitializationVector;
    final encryptionMethod = this.encryptionMethod;
    return {
      'spekeKeyProvider': spekeKeyProvider,
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (encryptionMethod != null) 'encryptionMethod': encryptionMethod.value,
    };
  }
}

/// An HTTP Live Streaming (HLS) manifest configuration.
class HlsManifest {
  /// This setting controls how ad markers are included in the packaged
  /// OriginEndpoint.
  /// "NONE" will omit all SCTE-35 ad markers from the output.
  /// "PASSTHROUGH" causes the manifest to contain a copy of the SCTE-35 ad
  /// markers (comments) taken directly from the input HTTP Live Streaming (HLS)
  /// manifest.
  /// "SCTE35_ENHANCED" generates ad markers and blackout tags based on SCTE-35
  /// messages in the input source.
  final AdMarkers? adMarkers;

  /// When enabled, an I-Frame only stream will be included in the output.
  final bool? includeIframeOnlyStream;

  /// An optional string to include in the name of the manifest.
  final String? manifestName;

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

  /// When enabled, the EXT-X-KEY tag will be repeated in output manifests.
  final bool? repeatExtXKey;
  final StreamSelection? streamSelection;

  HlsManifest({
    this.adMarkers,
    this.includeIframeOnlyStream,
    this.manifestName,
    this.programDateTimeIntervalSeconds,
    this.repeatExtXKey,
    this.streamSelection,
  });

  factory HlsManifest.fromJson(Map<String, dynamic> json) {
    return HlsManifest(
      adMarkers: (json['adMarkers'] as String?)?.let(AdMarkers.fromString),
      includeIframeOnlyStream: json['includeIframeOnlyStream'] as bool?,
      manifestName: json['manifestName'] as String?,
      programDateTimeIntervalSeconds:
          json['programDateTimeIntervalSeconds'] as int?,
      repeatExtXKey: json['repeatExtXKey'] as bool?,
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkers = this.adMarkers;
    final includeIframeOnlyStream = this.includeIframeOnlyStream;
    final manifestName = this.manifestName;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final repeatExtXKey = this.repeatExtXKey;
    final streamSelection = this.streamSelection;
    return {
      if (adMarkers != null) 'adMarkers': adMarkers.value,
      if (includeIframeOnlyStream != null)
        'includeIframeOnlyStream': includeIframeOnlyStream,
      if (manifestName != null) 'manifestName': manifestName,
      if (programDateTimeIntervalSeconds != null)
        'programDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (repeatExtXKey != null) 'repeatExtXKey': repeatExtXKey,
      if (streamSelection != null) 'streamSelection': streamSelection,
    };
  }
}

/// An HTTP Live Streaming (HLS) packaging configuration.
class HlsPackage {
  /// A list of HLS manifest configurations.
  final List<HlsManifest> hlsManifests;
  final HlsEncryption? encryption;

  /// When enabled, MediaPackage passes through digital video broadcasting (DVB)
  /// subtitles into the output.
  final bool? includeDvbSubtitles;

  /// Duration (in seconds) of each fragment. Actual fragments will be
  /// rounded to the nearest multiple of the source fragment duration.
  final int? segmentDurationSeconds;

  /// When enabled, audio streams will be placed in rendition groups in the
  /// output.
  final bool? useAudioRenditionGroup;

  HlsPackage({
    required this.hlsManifests,
    this.encryption,
    this.includeDvbSubtitles,
    this.segmentDurationSeconds,
    this.useAudioRenditionGroup,
  });

  factory HlsPackage.fromJson(Map<String, dynamic> json) {
    return HlsPackage(
      hlsManifests: (json['hlsManifests'] as List)
          .nonNulls
          .map((e) => HlsManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryption: json['encryption'] != null
          ? HlsEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      includeDvbSubtitles: json['includeDvbSubtitles'] as bool?,
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
      useAudioRenditionGroup: json['useAudioRenditionGroup'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final hlsManifests = this.hlsManifests;
    final encryption = this.encryption;
    final includeDvbSubtitles = this.includeDvbSubtitles;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final useAudioRenditionGroup = this.useAudioRenditionGroup;
    return {
      'hlsManifests': hlsManifests,
      if (encryption != null) 'encryption': encryption,
      if (includeDvbSubtitles != null)
        'includeDvbSubtitles': includeDvbSubtitles,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
      if (useAudioRenditionGroup != null)
        'useAudioRenditionGroup': useAudioRenditionGroup,
    };
  }
}

class ListAssetsResponse {
  /// A list of MediaPackage VOD Asset resources.
  final List<AssetShallow>? assets;

  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String? nextToken;

  ListAssetsResponse({
    this.assets,
    this.nextToken,
  });

  factory ListAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetsResponse(
      assets: (json['assets'] as List?)
          ?.nonNulls
          .map((e) => AssetShallow.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    final nextToken = this.nextToken;
    return {
      if (assets != null) 'assets': assets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPackagingConfigurationsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String? nextToken;

  /// A list of MediaPackage VOD PackagingConfiguration resources.
  final List<PackagingConfiguration>? packagingConfigurations;

  ListPackagingConfigurationsResponse({
    this.nextToken,
    this.packagingConfigurations,
  });

  factory ListPackagingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPackagingConfigurationsResponse(
      nextToken: json['nextToken'] as String?,
      packagingConfigurations: (json['packagingConfigurations'] as List?)
          ?.nonNulls
          .map(
              (e) => PackagingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packagingConfigurations = this.packagingConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (packagingConfigurations != null)
        'packagingConfigurations': packagingConfigurations,
    };
  }
}

class ListPackagingGroupsResponse {
  /// A token that can be used to resume pagination from the end of the
  /// collection.
  final String? nextToken;

  /// A list of MediaPackage VOD PackagingGroup resources.
  final List<PackagingGroup>? packagingGroups;

  ListPackagingGroupsResponse({
    this.nextToken,
    this.packagingGroups,
  });

  factory ListPackagingGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListPackagingGroupsResponse(
      nextToken: json['nextToken'] as String?,
      packagingGroups: (json['packagingGroups'] as List?)
          ?.nonNulls
          .map((e) => PackagingGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packagingGroups = this.packagingGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (packagingGroups != null) 'packagingGroups': packagingGroups,
    };
  }
}

class ListTagsForResourceResponse {
  /// A collection of tags associated with a resource
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
  full('FULL'),
  compact('COMPACT'),
  ;

  final String value;

  const ManifestLayout(this.value);

  static ManifestLayout fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ManifestLayout'));
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

/// A Microsoft Smooth Streaming (MSS) manifest configuration.
class MssManifest {
  /// An optional string to include in the name of the manifest.
  final String? manifestName;
  final StreamSelection? streamSelection;

  MssManifest({
    this.manifestName,
    this.streamSelection,
  });

  factory MssManifest.fromJson(Map<String, dynamic> json) {
    return MssManifest(
      manifestName: json['manifestName'] as String?,
      streamSelection: json['streamSelection'] != null
          ? StreamSelection.fromJson(
              json['streamSelection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final streamSelection = this.streamSelection;
    return {
      if (manifestName != null) 'manifestName': manifestName,
      if (streamSelection != null) 'streamSelection': streamSelection,
    };
  }
}

/// A Microsoft Smooth Streaming (MSS) PackagingConfiguration.
class MssPackage {
  /// A list of MSS manifest configurations.
  final List<MssManifest> mssManifests;
  final MssEncryption? encryption;

  /// The duration (in seconds) of each segment.
  final int? segmentDurationSeconds;

  MssPackage({
    required this.mssManifests,
    this.encryption,
    this.segmentDurationSeconds,
  });

  factory MssPackage.fromJson(Map<String, dynamic> json) {
    return MssPackage(
      mssManifests: (json['mssManifests'] as List)
          .nonNulls
          .map((e) => MssManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryption: json['encryption'] != null
          ? MssEncryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      segmentDurationSeconds: json['segmentDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mssManifests = this.mssManifests;
    final encryption = this.encryption;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    return {
      'mssManifests': mssManifests,
      if (encryption != null) 'encryption': encryption,
      if (segmentDurationSeconds != null)
        'segmentDurationSeconds': segmentDurationSeconds,
    };
  }
}

/// A MediaPackage VOD PackagingConfiguration resource.
class PackagingConfiguration {
  /// The ARN of the PackagingConfiguration.
  final String? arn;
  final CmafPackage? cmafPackage;

  /// The time the PackagingConfiguration was created.
  final String? createdAt;
  final DashPackage? dashPackage;
  final HlsPackage? hlsPackage;

  /// The ID of the PackagingConfiguration.
  final String? id;
  final MssPackage? mssPackage;

  /// The ID of a PackagingGroup.
  final String? packagingGroupId;
  final Map<String, String>? tags;

  PackagingConfiguration({
    this.arn,
    this.cmafPackage,
    this.createdAt,
    this.dashPackage,
    this.hlsPackage,
    this.id,
    this.mssPackage,
    this.packagingGroupId,
    this.tags,
  });

  factory PackagingConfiguration.fromJson(Map<String, dynamic> json) {
    return PackagingConfiguration(
      arn: json['arn'] as String?,
      cmafPackage: json['cmafPackage'] != null
          ? CmafPackage.fromJson(json['cmafPackage'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      dashPackage: json['dashPackage'] != null
          ? DashPackage.fromJson(json['dashPackage'] as Map<String, dynamic>)
          : null,
      hlsPackage: json['hlsPackage'] != null
          ? HlsPackage.fromJson(json['hlsPackage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      mssPackage: json['mssPackage'] != null
          ? MssPackage.fromJson(json['mssPackage'] as Map<String, dynamic>)
          : null,
      packagingGroupId: json['packagingGroupId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cmafPackage = this.cmafPackage;
    final createdAt = this.createdAt;
    final dashPackage = this.dashPackage;
    final hlsPackage = this.hlsPackage;
    final id = this.id;
    final mssPackage = this.mssPackage;
    final packagingGroupId = this.packagingGroupId;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (cmafPackage != null) 'cmafPackage': cmafPackage,
      if (createdAt != null) 'createdAt': createdAt,
      if (dashPackage != null) 'dashPackage': dashPackage,
      if (hlsPackage != null) 'hlsPackage': hlsPackage,
      if (id != null) 'id': id,
      if (mssPackage != null) 'mssPackage': mssPackage,
      if (packagingGroupId != null) 'packagingGroupId': packagingGroupId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A MediaPackage VOD PackagingGroup resource.
class PackagingGroup {
  /// The approximate asset count of the PackagingGroup.
  final int? approximateAssetCount;

  /// The ARN of the PackagingGroup.
  final String? arn;
  final Authorization? authorization;

  /// The time the PackagingGroup was created.
  final String? createdAt;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  final String? domainName;
  final EgressAccessLogs? egressAccessLogs;

  /// The ID of the PackagingGroup.
  final String? id;
  final Map<String, String>? tags;

  PackagingGroup({
    this.approximateAssetCount,
    this.arn,
    this.authorization,
    this.createdAt,
    this.domainName,
    this.egressAccessLogs,
    this.id,
    this.tags,
  });

  factory PackagingGroup.fromJson(Map<String, dynamic> json) {
    return PackagingGroup(
      approximateAssetCount: json['approximateAssetCount'] as int?,
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      domainName: json['domainName'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateAssetCount = this.approximateAssetCount;
    final arn = this.arn;
    final authorization = this.authorization;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final egressAccessLogs = this.egressAccessLogs;
    final id = this.id;
    final tags = this.tags;
    return {
      if (approximateAssetCount != null)
        'approximateAssetCount': approximateAssetCount,
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (createdAt != null) 'createdAt': createdAt,
      if (domainName != null) 'domainName': domainName,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

enum PresetSpeke20Audio {
  presetAudio_1('PRESET-AUDIO-1'),
  presetAudio_2('PRESET-AUDIO-2'),
  presetAudio_3('PRESET-AUDIO-3'),
  shared('SHARED'),
  unencrypted('UNENCRYPTED'),
  ;

  final String value;

  const PresetSpeke20Audio(this.value);

  static PresetSpeke20Audio fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PresetSpeke20Audio'));
}

enum PresetSpeke20Video {
  presetVideo_1('PRESET-VIDEO-1'),
  presetVideo_2('PRESET-VIDEO-2'),
  presetVideo_3('PRESET-VIDEO-3'),
  presetVideo_4('PRESET-VIDEO-4'),
  presetVideo_5('PRESET-VIDEO-5'),
  presetVideo_6('PRESET-VIDEO-6'),
  presetVideo_7('PRESET-VIDEO-7'),
  presetVideo_8('PRESET-VIDEO-8'),
  shared('SHARED'),
  unencrypted('UNENCRYPTED'),
  ;

  final String value;

  const PresetSpeke20Video(this.value);

  static PresetSpeke20Video fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PresetSpeke20Video'));
}

enum Profile {
  none('NONE'),
  hbbtv_1_5('HBBTV_1_5'),
  ;

  final String value;

  const Profile(this.value);

  static Profile fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Profile'));
}

enum ScteMarkersSource {
  segments('SEGMENTS'),
  manifest('MANIFEST'),
  ;

  final String value;

  const ScteMarkersSource(this.value);

  static ScteMarkersSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ScteMarkersSource'));
}

enum SegmentTemplateFormat {
  numberWithTimeline('NUMBER_WITH_TIMELINE'),
  timeWithTimeline('TIME_WITH_TIMELINE'),
  numberWithDuration('NUMBER_WITH_DURATION'),
  ;

  final String value;

  const SegmentTemplateFormat(this.value);

  static SegmentTemplateFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SegmentTemplateFormat'));
}

/// A configuration for accessing an external Secure Packager and Encoder Key
/// Exchange (SPEKE) service that will provide encryption keys.
class SpekeKeyProvider {
  /// An Amazon Resource Name (ARN) of an IAM role that AWS Elemental
  /// MediaPackage will assume when accessing the key provider service.
  final String roleArn;

  /// The system IDs to include in key requests.
  final List<String> systemIds;

  /// The URL of the external key provider service.
  final String url;
  final EncryptionContractConfiguration? encryptionContractConfiguration;

  SpekeKeyProvider({
    required this.roleArn,
    required this.systemIds,
    required this.url,
    this.encryptionContractConfiguration,
  });

  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) {
    return SpekeKeyProvider(
      roleArn: json['roleArn'] as String,
      systemIds:
          (json['systemIds'] as List).nonNulls.map((e) => e as String).toList(),
      url: json['url'] as String,
      encryptionContractConfiguration:
          json['encryptionContractConfiguration'] != null
              ? EncryptionContractConfiguration.fromJson(
                  json['encryptionContractConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final systemIds = this.systemIds;
    final url = this.url;
    final encryptionContractConfiguration =
        this.encryptionContractConfiguration;
    return {
      'roleArn': roleArn,
      'systemIds': systemIds,
      'url': url,
      if (encryptionContractConfiguration != null)
        'encryptionContractConfiguration': encryptionContractConfiguration,
    };
  }
}

enum StreamOrder {
  original('ORIGINAL'),
  videoBitrateAscending('VIDEO_BITRATE_ASCENDING'),
  videoBitrateDescending('VIDEO_BITRATE_DESCENDING'),
  ;

  final String value;

  const StreamOrder(this.value);

  static StreamOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StreamOrder'));
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
      streamOrder:
          (json['streamOrder'] as String?)?.let(StreamOrder.fromString),
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
      if (streamOrder != null) 'streamOrder': streamOrder.value,
    };
  }
}

class UpdatePackagingGroupResponse {
  /// The approximate asset count of the PackagingGroup.
  final int? approximateAssetCount;

  /// The ARN of the PackagingGroup.
  final String? arn;
  final Authorization? authorization;

  /// The time the PackagingGroup was created.
  final String? createdAt;

  /// The fully qualified domain name for Assets in the PackagingGroup.
  final String? domainName;
  final EgressAccessLogs? egressAccessLogs;

  /// The ID of the PackagingGroup.
  final String? id;
  final Map<String, String>? tags;

  UpdatePackagingGroupResponse({
    this.approximateAssetCount,
    this.arn,
    this.authorization,
    this.createdAt,
    this.domainName,
    this.egressAccessLogs,
    this.id,
    this.tags,
  });

  factory UpdatePackagingGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePackagingGroupResponse(
      approximateAssetCount: json['approximateAssetCount'] as int?,
      arn: json['arn'] as String?,
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      createdAt: json['createdAt'] as String?,
      domainName: json['domainName'] as String?,
      egressAccessLogs: json['egressAccessLogs'] != null
          ? EgressAccessLogs.fromJson(
              json['egressAccessLogs'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateAssetCount = this.approximateAssetCount;
    final arn = this.arn;
    final authorization = this.authorization;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final egressAccessLogs = this.egressAccessLogs;
    final id = this.id;
    final tags = this.tags;
    return {
      if (approximateAssetCount != null)
        'approximateAssetCount': approximateAssetCount,
      if (arn != null) 'arn': arn,
      if (authorization != null) 'authorization': authorization,
      if (createdAt != null) 'createdAt': createdAt,
      if (domainName != null) 'domainName': domainName,
      if (egressAccessLogs != null) 'egressAccessLogs': egressAccessLogs,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

enum PeriodTriggersElement {
  ads('ADS'),
  ;

  final String value;

  const PeriodTriggersElement(this.value);

  static PeriodTriggersElement fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PeriodTriggersElement'));
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
