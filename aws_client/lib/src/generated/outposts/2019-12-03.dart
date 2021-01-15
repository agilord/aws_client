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

part '2019-12-03.g.dart';

/// AWS Outposts is a fully managed service that extends AWS infrastructure,
/// APIs, and tools to customer premises. By providing local access to AWS
/// managed infrastructure, AWS Outposts enables customers to build and run
/// applications on premises using the same programming interfaces as in AWS
/// Regions, while using local compute and storage resources for lower latency
/// and local data processing needs.
class Outposts {
  final _s.RestJsonProtocol _protocol;
  Outposts({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'outposts',
            signingName: 'outposts',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [tags] :
  /// The tags to apply to the Outpost.
  Future<CreateOutpostOutput> createOutpost({
    @_s.required String name,
    @_s.required String siteId,
    String availabilityZone,
    String availabilityZoneId,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\S ]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(siteId, 'siteId');
    _s.validateStringLength(
      'siteId',
      siteId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'siteId',
      siteId,
      r'''os-[a-f0-9]{17}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'availabilityZone',
      availabilityZone,
      1,
      1000,
    );
    _s.validateStringPattern(
      'availabilityZone',
      availabilityZone,
      r'''[a-z\d-]+''',
    );
    _s.validateStringLength(
      'availabilityZoneId',
      availabilityZoneId,
      1,
      255,
    );
    _s.validateStringPattern(
      'availabilityZoneId',
      availabilityZoneId,
      r'''[a-z]+[0-9]+-az[0-9]+''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\S ]+$''',
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'SiteId': siteId,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/outposts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOutpostOutput.fromJson(response);
  }

  /// Deletes the Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<void> deleteOutpost({
    @_s.required String outpostId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      180,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outpostId',
      outpostId,
      r'''^(arn:aws([a-z-]+)?:outposts:[a-z\d-]+:\d{12}:outpost/)?op-[a-f0-9]{17}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOutpostOutput.fromJson(response);
  }

  /// Deletes the site.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<void> deleteSite({
    @_s.required String siteId,
  }) async {
    ArgumentError.checkNotNull(siteId, 'siteId');
    _s.validateStringLength(
      'siteId',
      siteId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'siteId',
      siteId,
      r'''os-[a-f0-9]{17}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSiteOutput.fromJson(response);
  }

  /// Gets information about the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<GetOutpostOutput> getOutpost({
    @_s.required String outpostId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      180,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outpostId',
      outpostId,
      r'''^(arn:aws([a-z-]+)?:outposts:[a-z\d-]+:\d{12}:outpost/)?op-[a-f0-9]{17}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostOutput.fromJson(response);
  }

  /// Lists the instance types for the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<GetOutpostInstanceTypesOutput> getOutpostInstanceTypes({
    @_s.required String outpostId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      180,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outpostId',
      outpostId,
      r'''^(arn:aws([a-z-]+)?:outposts:[a-z\d-]+:\d{12}:outpost/)?op-[a-f0-9]{17}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1005,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}/instanceTypes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostInstanceTypesOutput.fromJson(response);
  }

  /// List the Outposts for your AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<ListOutpostsOutput> listOutposts({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1005,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOutpostsOutput.fromJson(response);
  }

  /// Lists the sites for the specified AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<ListSitesOutput> listSites({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1005,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sites',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSitesOutput.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^(arn:aws([a-z-]+)?:outposts:[a-z\d-]+:\d{12}:([a-z\d-]+)/)[a-z]{2,8}-[a-f0-9]{17}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds tags to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^(arn:aws([a-z-]+)?:outposts:[a-z\d-]+:\d{12}:([a-z\d-]+)/)[a-z]{2,8}-[a-f0-9]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^(arn:aws([a-z-]+)?:outposts:[a-z\d-]+:\d{12}:([a-z\d-]+)/)[a-z]{2,8}-[a-f0-9]{17}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOutpostOutput {
  @_s.JsonKey(name: 'Outpost')
  final Outpost outpost;

  CreateOutpostOutput({
    this.outpost,
  });
  factory CreateOutpostOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateOutpostOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteOutpostOutput {
  DeleteOutpostOutput();
  factory DeleteOutpostOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteOutpostOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSiteOutput {
  DeleteSiteOutput();
  factory DeleteSiteOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteSiteOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOutpostInstanceTypesOutput {
  @_s.JsonKey(name: 'InstanceTypes')
  final List<InstanceTypeItem> instanceTypes;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'OutpostArn')
  final String outpostArn;
  @_s.JsonKey(name: 'OutpostId')
  final String outpostId;

  GetOutpostInstanceTypesOutput({
    this.instanceTypes,
    this.nextToken,
    this.outpostArn,
    this.outpostId,
  });
  factory GetOutpostInstanceTypesOutput.fromJson(Map<String, dynamic> json) =>
      _$GetOutpostInstanceTypesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOutpostOutput {
  @_s.JsonKey(name: 'Outpost')
  final Outpost outpost;

  GetOutpostOutput({
    this.outpost,
  });
  factory GetOutpostOutput.fromJson(Map<String, dynamic> json) =>
      _$GetOutpostOutputFromJson(json);
}

/// Information about an instance type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceTypeItem {
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  InstanceTypeItem({
    this.instanceType,
  });
  factory InstanceTypeItem.fromJson(Map<String, dynamic> json) =>
      _$InstanceTypeItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOutpostsOutput {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'Outposts')
  final List<Outpost> outposts;

  ListOutpostsOutput({
    this.nextToken,
    this.outposts,
  });
  factory ListOutpostsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListOutpostsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSitesOutput {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'Sites')
  final List<Site> sites;

  ListSitesOutput({
    this.nextToken,
    this.sites,
  });
  factory ListSitesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListSitesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The resource tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Information about an Outpost.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Outpost {
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;
  @_s.JsonKey(name: 'AvailabilityZoneId')
  final String availabilityZoneId;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'LifeCycleStatus')
  final String lifeCycleStatus;
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'OutpostArn')
  final String outpostArn;
  @_s.JsonKey(name: 'OutpostId')
  final String outpostId;
  @_s.JsonKey(name: 'OwnerId')
  final String ownerId;
  @_s.JsonKey(name: 'SiteId')
  final String siteId;

  /// The Outpost tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Outpost({
    this.availabilityZone,
    this.availabilityZoneId,
    this.description,
    this.lifeCycleStatus,
    this.name,
    this.outpostArn,
    this.outpostId,
    this.ownerId,
    this.siteId,
    this.tags,
  });
  factory Outpost.fromJson(Map<String, dynamic> json) =>
      _$OutpostFromJson(json);
}

/// Information about a site.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Site {
  @_s.JsonKey(name: 'AccountId')
  final String accountId;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'SiteId')
  final String siteId;

  /// The site tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  Site({
    this.accountId,
    this.description,
    this.name,
    this.siteId,
    this.tags,
  });
  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
