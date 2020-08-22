// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'outposts-2019-12-03.g.dart';

/// AWS Outposts is a fully-managed service that extends AWS infrastructure,
/// APIs, and tools to customer premises. By providing local access to
/// AWS-managed infrastructure, AWS Outposts enables customers to build and run
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
          service: 'outposts',
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
  Future<CreateOutpostOutput> createOutpost({
    @_s.required String siteId,
    String availabilityZone,
    String availabilityZoneId,
    String description,
    String name,
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
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\S ]+$''',
    );
    final $payload = <String, dynamic>{
      'SiteId': siteId,
      'AvailabilityZone': availabilityZone,
      'AvailabilityZoneId': availabilityZoneId,
      'Description': description,
      'Name': name,
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId.toString())}',
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/sites/${Uri.encodeComponent(siteId.toString())}',
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
      requestUri: '/outposts/${Uri.encodeComponent(outpostId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/outposts/${Uri.encodeComponent(outpostId.toString())}/instanceTypes$_query',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts$_query',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('MaxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('NextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sites$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListSitesOutput.fromJson(response);
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

  Site({
    this.accountId,
    this.description,
    this.name,
    this.siteId,
  });
  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
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
