// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// AWS Outposts is a fully managed service that extends AWS infrastructure,
/// APIs, and tools to customer premises. By providing local access to AWS
/// managed infrastructure, AWS Outposts enables customers to build and run
/// applications on premises using the same programming interfaces as in AWS
/// Regions, while using local compute and storage resources for lower latency
/// and local data processing needs.
class Outposts {
  final _s.RestJsonProtocol _protocol;
  Outposts({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// You can specify <code>AvailabilityZone</code> or
  /// <code>AvailabilityZoneId</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [tags] :
  /// The tags to apply to the Outpost.
  Future<CreateOutpostOutput> createOutpost({
    required String name,
    required String siteId,
    String? availabilityZone,
    String? availabilityZoneId,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
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
    _s.validateStringLength(
      'availabilityZone',
      availabilityZone,
      1,
      1000,
    );
    _s.validateStringLength(
      'availabilityZoneId',
      availabilityZoneId,
      1,
      255,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
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
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<void> deleteOutpost({
    required String outpostId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      180,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the site.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<void> deleteSite({
    required String siteId,
  }) async {
    ArgumentError.checkNotNull(siteId, 'siteId');
    _s.validateStringLength(
      'siteId',
      siteId,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<GetOutpostOutput> getOutpost({
    required String outpostId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      180,
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
    required String outpostId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateStringLength(
      'outpostId',
      outpostId,
      1,
      180,
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

  /// Create a list of the Outposts for your AWS account. Add filters to your
  /// request to return a more specific list of results. Use filters to match an
  /// Outpost lifecycle status, Availibility Zone (<code>us-east-1a</code>), and
  /// AZ ID (<code>use1-az1</code>).
  ///
  /// If you specify multiple filters, the filters are joined with an
  /// <code>AND</code>, and the request returns only results that match all of
  /// the specified filters.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [availabilityZoneFilter] :
  /// A filter for the Availibility Zone (<code>us-east-1a</code>) of the
  /// Outpost.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [availabilityZoneIdFilter] :
  /// A filter for the AZ IDs (<code>use1-az1</code>) of the Outpost.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [lifeCycleStatusFilter] :
  /// A filter for the lifecycle status of the Outpost.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  Future<ListOutpostsOutput> listOutposts({
    List<String>? availabilityZoneFilter,
    List<String>? availabilityZoneIdFilter,
    List<String>? lifeCycleStatusFilter,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (availabilityZoneFilter != null)
        'AvailabilityZoneFilter': availabilityZoneFilter,
      if (availabilityZoneIdFilter != null)
        'AvailabilityZoneIdFilter': availabilityZoneIdFilter,
      if (lifeCycleStatusFilter != null)
        'LifeCycleStatusFilter': lifeCycleStatusFilter,
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
    int? maxResults,
    String? nextToken,
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
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1011,
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
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1011,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class CreateOutpostOutput {
  final Outpost? outpost;

  CreateOutpostOutput({
    this.outpost,
  });

  factory CreateOutpostOutput.fromJson(Map<String, dynamic> json) {
    return CreateOutpostOutput(
      outpost: json['Outpost'] != null
          ? Outpost.fromJson(json['Outpost'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpost = this.outpost;
    return {
      if (outpost != null) 'Outpost': outpost,
    };
  }
}

class DeleteOutpostOutput {
  DeleteOutpostOutput();

  factory DeleteOutpostOutput.fromJson(Map<String, dynamic> _) {
    return DeleteOutpostOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSiteOutput {
  DeleteSiteOutput();

  factory DeleteSiteOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSiteOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetOutpostInstanceTypesOutput {
  final List<InstanceTypeItem>? instanceTypes;
  final String? nextToken;
  final String? outpostArn;
  final String? outpostId;

  GetOutpostInstanceTypesOutput({
    this.instanceTypes,
    this.nextToken,
    this.outpostArn,
    this.outpostId,
  });

  factory GetOutpostInstanceTypesOutput.fromJson(Map<String, dynamic> json) {
    return GetOutpostInstanceTypesOutput(
      instanceTypes: (json['InstanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      outpostId: json['OutpostId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTypes = this.instanceTypes;
    final nextToken = this.nextToken;
    final outpostArn = this.outpostArn;
    final outpostId = this.outpostId;
    return {
      if (instanceTypes != null) 'InstanceTypes': instanceTypes,
      if (nextToken != null) 'NextToken': nextToken,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (outpostId != null) 'OutpostId': outpostId,
    };
  }
}

class GetOutpostOutput {
  final Outpost? outpost;

  GetOutpostOutput({
    this.outpost,
  });

  factory GetOutpostOutput.fromJson(Map<String, dynamic> json) {
    return GetOutpostOutput(
      outpost: json['Outpost'] != null
          ? Outpost.fromJson(json['Outpost'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpost = this.outpost;
    return {
      if (outpost != null) 'Outpost': outpost,
    };
  }
}

/// Information about an instance type.
class InstanceTypeItem {
  final String? instanceType;

  InstanceTypeItem({
    this.instanceType,
  });

  factory InstanceTypeItem.fromJson(Map<String, dynamic> json) {
    return InstanceTypeItem(
      instanceType: json['InstanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    return {
      if (instanceType != null) 'InstanceType': instanceType,
    };
  }
}

class ListOutpostsOutput {
  final String? nextToken;
  final List<Outpost>? outposts;

  ListOutpostsOutput({
    this.nextToken,
    this.outposts,
  });

  factory ListOutpostsOutput.fromJson(Map<String, dynamic> json) {
    return ListOutpostsOutput(
      nextToken: json['NextToken'] as String?,
      outposts: (json['Outposts'] as List?)
          ?.whereNotNull()
          .map((e) => Outpost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final outposts = this.outposts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (outposts != null) 'Outposts': outposts,
    };
  }
}

class ListSitesOutput {
  final String? nextToken;
  final List<Site>? sites;

  ListSitesOutput({
    this.nextToken,
    this.sites,
  });

  factory ListSitesOutput.fromJson(Map<String, dynamic> json) {
    return ListSitesOutput(
      nextToken: json['NextToken'] as String?,
      sites: (json['Sites'] as List?)
          ?.whereNotNull()
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sites = this.sites;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sites != null) 'Sites': sites,
    };
  }
}

class ListTagsForResourceResponse {
  /// The resource tags.
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

/// Information about an Outpost.
class Outpost {
  final String? availabilityZone;
  final String? availabilityZoneId;
  final String? description;
  final String? lifeCycleStatus;
  final String? name;
  final String? outpostArn;
  final String? outpostId;
  final String? ownerId;
  final String? siteArn;
  final String? siteId;

  /// The Outpost tags.
  final Map<String, String>? tags;

  Outpost({
    this.availabilityZone,
    this.availabilityZoneId,
    this.description,
    this.lifeCycleStatus,
    this.name,
    this.outpostArn,
    this.outpostId,
    this.ownerId,
    this.siteArn,
    this.siteId,
    this.tags,
  });

  factory Outpost.fromJson(Map<String, dynamic> json) {
    return Outpost(
      availabilityZone: json['AvailabilityZone'] as String?,
      availabilityZoneId: json['AvailabilityZoneId'] as String?,
      description: json['Description'] as String?,
      lifeCycleStatus: json['LifeCycleStatus'] as String?,
      name: json['Name'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      outpostId: json['OutpostId'] as String?,
      ownerId: json['OwnerId'] as String?,
      siteArn: json['SiteArn'] as String?,
      siteId: json['SiteId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final availabilityZoneId = this.availabilityZoneId;
    final description = this.description;
    final lifeCycleStatus = this.lifeCycleStatus;
    final name = this.name;
    final outpostArn = this.outpostArn;
    final outpostId = this.outpostId;
    final ownerId = this.ownerId;
    final siteArn = this.siteArn;
    final siteId = this.siteId;
    final tags = this.tags;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (description != null) 'Description': description,
      if (lifeCycleStatus != null) 'LifeCycleStatus': lifeCycleStatus,
      if (name != null) 'Name': name,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (outpostId != null) 'OutpostId': outpostId,
      if (ownerId != null) 'OwnerId': ownerId,
      if (siteArn != null) 'SiteArn': siteArn,
      if (siteId != null) 'SiteId': siteId,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about a site.
class Site {
  final String? accountId;
  final String? description;
  final String? name;
  final String? siteArn;
  final String? siteId;

  /// The site tags.
  final Map<String, String>? tags;

  Site({
    this.accountId,
    this.description,
    this.name,
    this.siteArn,
    this.siteId,
    this.tags,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      accountId: json['AccountId'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      siteArn: json['SiteArn'] as String?,
      siteId: json['SiteId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final name = this.name;
    final siteArn = this.siteArn;
    final siteId = this.siteId;
    final tags = this.tags;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (siteArn != null) 'SiteArn': siteArn,
      if (siteId != null) 'SiteId': siteId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

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
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
