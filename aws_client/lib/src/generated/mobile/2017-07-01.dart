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

part '2017-07-01.g.dart';

/// AWS Mobile Service provides mobile app and website developers with
/// capabilities required to configure AWS resources and bootstrap their
/// developer desktop projects with the necessary SDKs, constants, tools and
/// samples to make use of those resources.
class Mobile {
  final _s.RestJsonProtocol _protocol;
  Mobile({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mobile',
            signingName: 'AWSMobileHubService',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an AWS Mobile Hub project.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [contents] :
  /// ZIP or YAML file which contains configuration settings to be used when
  /// creating the project. This may be the contents of the file downloaded from
  /// the URL provided in an export project operation.
  ///
  /// Parameter [name] :
  /// Name of the project.
  ///
  /// Parameter [region] :
  /// Default region where project resources should be created.
  ///
  /// Parameter [snapshotId] :
  /// Unique identifier for an exported snapshot of project configuration. This
  /// snapshot identifier is included in the share URL when a project is
  /// exported.
  Future<CreateProjectResult> createProject({
    Uint8List contents,
    String name,
    String region,
    String snapshotId,
  }) async {
    final $query = <String, List<String>>{
      if (name != null) 'name': [name],
      if (region != null) 'region': [region],
      if (snapshotId != null) 'snapshotId': [snapshotId],
    };
    final response = await _protocol.send(
      payload: contents,
      method: 'POST',
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResult.fromJson(response);
  }

  /// Delets a project in AWS Mobile Hub.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [projectId] :
  /// Unique project identifier.
  Future<DeleteProjectResult> deleteProject({
    @_s.required String projectId,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProjectResult.fromJson(response);
  }

  /// Get the bundle details for the requested bundle id.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [bundleId] :
  /// Unique bundle identifier.
  Future<DescribeBundleResult> describeBundle({
    @_s.required String bundleId,
  }) async {
    ArgumentError.checkNotNull(bundleId, 'bundleId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/bundles/${Uri.encodeComponent(bundleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBundleResult.fromJson(response);
  }

  /// Gets details about a project in AWS Mobile Hub.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [projectId] :
  /// Unique project identifier.
  ///
  /// Parameter [syncFromResources] :
  /// If set to true, causes AWS Mobile Hub to synchronize information from
  /// other services, e.g., update state of AWS CloudFormation stacks in the AWS
  /// Mobile Hub project.
  Future<DescribeProjectResult> describeProject({
    @_s.required String projectId,
    bool syncFromResources,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    final $query = <String, List<String>>{
      if (projectId != null) 'projectId': [projectId],
      if (syncFromResources != null)
        'syncFromResources': [syncFromResources.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/project',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResult.fromJson(response);
  }

  /// Generates customized software development kit (SDK) and or tool packages
  /// used to integrate mobile web or mobile app clients with backend AWS
  /// resources.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [bundleId] :
  /// Unique bundle identifier.
  ///
  /// Parameter [platform] :
  /// Developer desktop or target application platform.
  ///
  /// Parameter [projectId] :
  /// Unique project identifier.
  Future<ExportBundleResult> exportBundle({
    @_s.required String bundleId,
    Platform platform,
    String projectId,
  }) async {
    ArgumentError.checkNotNull(bundleId, 'bundleId');
    final $query = <String, List<String>>{
      if (platform != null) 'platform': [platform.toValue()],
      if (projectId != null) 'projectId': [projectId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/bundles/${Uri.encodeComponent(bundleId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportBundleResult.fromJson(response);
  }

  /// Exports project configuration to a snapshot which can be downloaded and
  /// shared. Note that mobile app push credentials are encrypted in exported
  /// projects, so they can only be shared successfully within the same AWS
  /// account.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [projectId] :
  /// Unique project identifier.
  Future<ExportProjectResult> exportProject({
    @_s.required String projectId,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/exports/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ExportProjectResult.fromJson(response);
  }

  /// List all available bundles.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing bundles from start. If
  /// non-null pagination token is returned in a result, then pass its value in
  /// here in another request to list more bundles.
  Future<ListBundlesResult> listBundles({
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
      requestUri: '/bundles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBundlesResult.fromJson(response);
  }

  /// Lists projects in AWS Mobile Hub.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to list in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token. Set to null to start listing projects from start. If
  /// non-null pagination token is returned in a result, then pass its value in
  /// here in another request to list more projects.
  Future<ListProjectsResult> listProjects({
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
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResult.fromJson(response);
  }

  /// Update an existing project.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [AccountActionRequiredException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [projectId] :
  /// Unique project identifier.
  ///
  /// Parameter [contents] :
  /// ZIP or YAML file which contains project configuration to be updated. This
  /// should be the contents of the file downloaded from the URL provided in an
  /// export project operation.
  Future<UpdateProjectResult> updateProject({
    @_s.required String projectId,
    Uint8List contents,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    final $query = <String, List<String>>{
      if (projectId != null) 'projectId': [projectId],
    };
    final response = await _protocol.send(
      payload: contents,
      method: 'POST',
      requestUri: '/update',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProjectResult.fromJson(response);
  }
}

/// Account Action is required in order to continue the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountActionRequiredException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  AccountActionRequiredException({
    this.message,
  });
  factory AccountActionRequiredException.fromJson(Map<String, dynamic> json) =>
      _$AccountActionRequiredExceptionFromJson(json);
}

/// The request cannot be processed because some parameter is not valid or the
/// project state prevents the operation from being performed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BadRequestException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  BadRequestException({
    this.message,
  });
  factory BadRequestException.fromJson(Map<String, dynamic> json) =>
      _$BadRequestExceptionFromJson(json);
}

/// The details of the bundle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BundleDetails {
  @_s.JsonKey(name: 'availablePlatforms')
  final List<Platform> availablePlatforms;
  @_s.JsonKey(name: 'bundleId')
  final String bundleId;
  @_s.JsonKey(name: 'description')
  final String description;
  @_s.JsonKey(name: 'iconUrl')
  final String iconUrl;
  @_s.JsonKey(name: 'title')
  final String title;
  @_s.JsonKey(name: 'version')
  final String version;

  BundleDetails({
    this.availablePlatforms,
    this.bundleId,
    this.description,
    this.iconUrl,
    this.title,
    this.version,
  });
  factory BundleDetails.fromJson(Map<String, dynamic> json) =>
      _$BundleDetailsFromJson(json);
}

/// Result structure used in response to a request to create a project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProjectResult {
  /// Detailed information about the created AWS Mobile Hub project.
  @_s.JsonKey(name: 'details')
  final ProjectDetails details;

  CreateProjectResult({
    this.details,
  });
  factory CreateProjectResult.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectResultFromJson(json);
}

/// Result structure used in response to request to delete a project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProjectResult {
  /// Resources which were deleted.
  @_s.JsonKey(name: 'deletedResources')
  final List<Resource> deletedResources;

  /// Resources which were not deleted, due to a risk of losing potentially
  /// important data or files.
  @_s.JsonKey(name: 'orphanedResources')
  final List<Resource> orphanedResources;

  DeleteProjectResult({
    this.deletedResources,
    this.orphanedResources,
  });
  factory DeleteProjectResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteProjectResultFromJson(json);
}

/// Result structure contains the details of the bundle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBundleResult {
  /// The details of the bundle.
  @_s.JsonKey(name: 'details')
  final BundleDetails details;

  DescribeBundleResult({
    this.details,
  });
  factory DescribeBundleResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeBundleResultFromJson(json);
}

/// Result structure used for requests of project details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProjectResult {
  @_s.JsonKey(name: 'details')
  final ProjectDetails details;

  DescribeProjectResult({
    this.details,
  });
  factory DescribeProjectResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeProjectResultFromJson(json);
}

/// Result structure which contains link to download custom-generated SDK and
/// tool packages used to integrate mobile web or app clients with backed AWS
/// resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportBundleResult {
  /// URL which contains the custom-generated SDK and tool packages used to
  /// integrate the client mobile app or web app with the AWS resources created by
  /// the AWS Mobile Hub project.
  @_s.JsonKey(name: 'downloadUrl')
  final String downloadUrl;

  ExportBundleResult({
    this.downloadUrl,
  });
  factory ExportBundleResult.fromJson(Map<String, dynamic> json) =>
      _$ExportBundleResultFromJson(json);
}

/// Result structure used for requests to export project configuration details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportProjectResult {
  /// URL which can be used to download the exported project configuation file(s).
  @_s.JsonKey(name: 'downloadUrl')
  final String downloadUrl;

  /// URL which can be shared to allow other AWS users to create their own project
  /// in AWS Mobile Hub with the same configuration as the specified project. This
  /// URL pertains to a snapshot in time of the project configuration that is
  /// created when this API is called. If you want to share additional changes to
  /// your project configuration, then you will need to create and share a new
  /// snapshot by calling this method again.
  @_s.JsonKey(name: 'shareUrl')
  final String shareUrl;

  /// Unique identifier for the exported snapshot of the project configuration.
  /// This snapshot identifier is included in the share URL.
  @_s.JsonKey(name: 'snapshotId')
  final String snapshotId;

  ExportProjectResult({
    this.downloadUrl,
    this.shareUrl,
    this.snapshotId,
  });
  factory ExportProjectResult.fromJson(Map<String, dynamic> json) =>
      _$ExportProjectResultFromJson(json);
}

/// The service has encountered an unexpected error condition which prevents it
/// from servicing the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalFailureException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InternalFailureException({
    this.message,
  });
  factory InternalFailureException.fromJson(Map<String, dynamic> json) =>
      _$InternalFailureExceptionFromJson(json);
}

/// There are too many AWS Mobile Hub projects in the account or the account has
/// exceeded the maximum number of resources in some AWS service. You should
/// create another sub-account using AWS Organizations or remove some resources
/// and retry your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LimitExceededException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;
  @_s.JsonKey(name: 'Retry-After')
  final String retryAfterSeconds;

  LimitExceededException({
    this.message,
    this.retryAfterSeconds,
  });
  factory LimitExceededException.fromJson(Map<String, dynamic> json) =>
      _$LimitExceededExceptionFromJson(json);
}

/// Result structure contains a list of all available bundles with details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBundlesResult {
  /// A list of bundles.
  @_s.JsonKey(name: 'bundleList')
  final List<BundleDetails> bundleList;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBundlesResult({
    this.bundleList,
    this.nextToken,
  });
  factory ListBundlesResult.fromJson(Map<String, dynamic> json) =>
      _$ListBundlesResultFromJson(json);
}

/// Result structure used for requests to list projects in AWS Mobile Hub.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProjectsResult {
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;
  @_s.JsonKey(name: 'projects')
  final List<ProjectSummary> projects;

  ListProjectsResult({
    this.nextToken,
    this.projects,
  });
  factory ListProjectsResult.fromJson(Map<String, dynamic> json) =>
      _$ListProjectsResultFromJson(json);
}

/// No entity can be found with the specified identifier.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotFoundException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  NotFoundException({
    this.message,
  });
  factory NotFoundException.fromJson(Map<String, dynamic> json) =>
      _$NotFoundExceptionFromJson(json);
}

/// Developer desktop or target mobile app or website platform.
enum Platform {
  @_s.JsonValue('OSX')
  osx,
  @_s.JsonValue('WINDOWS')
  windows,
  @_s.JsonValue('LINUX')
  linux,
  @_s.JsonValue('OBJC')
  objc,
  @_s.JsonValue('SWIFT')
  swift,
  @_s.JsonValue('ANDROID')
  android,
  @_s.JsonValue('JAVASCRIPT')
  javascript,
}

extension on Platform {
  String toValue() {
    switch (this) {
      case Platform.osx:
        return 'OSX';
      case Platform.windows:
        return 'WINDOWS';
      case Platform.linux:
        return 'LINUX';
      case Platform.objc:
        return 'OBJC';
      case Platform.swift:
        return 'SWIFT';
      case Platform.android:
        return 'ANDROID';
      case Platform.javascript:
        return 'JAVASCRIPT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Detailed information about an AWS Mobile Hub project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectDetails {
  /// Website URL for this project in the AWS Mobile Hub console.
  @_s.JsonKey(name: 'consoleUrl')
  final String consoleUrl;

  /// Date the project was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// Date of the last modification of the project.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;
  @_s.JsonKey(name: 'name')
  final String name;
  @_s.JsonKey(name: 'projectId')
  final String projectId;
  @_s.JsonKey(name: 'region')
  final String region;
  @_s.JsonKey(name: 'resources')
  final List<Resource> resources;
  @_s.JsonKey(name: 'state')
  final ProjectState state;

  ProjectDetails({
    this.consoleUrl,
    this.createdDate,
    this.lastUpdatedDate,
    this.name,
    this.projectId,
    this.region,
    this.resources,
    this.state,
  });
  factory ProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsFromJson(json);
}

/// Synchronization state for a project.
enum ProjectState {
  @_s.JsonValue('NORMAL')
  normal,
  @_s.JsonValue('SYNCING')
  syncing,
  @_s.JsonValue('IMPORTING')
  importing,
}

/// Summary information about an AWS Mobile Hub project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProjectSummary {
  /// Name of the project.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Unique project identifier.
  @_s.JsonKey(name: 'projectId')
  final String projectId;

  ProjectSummary({
    this.name,
    this.projectId,
  });
  factory ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);
}

/// Information about an instance of an AWS resource associated with a project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  @_s.JsonKey(name: 'arn')
  final String arn;
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;
  @_s.JsonKey(name: 'feature')
  final String feature;
  @_s.JsonKey(name: 'name')
  final String name;
  @_s.JsonKey(name: 'type')
  final String type;

  Resource({
    this.arn,
    this.attributes,
    this.feature,
    this.name,
    this.type,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// The service is temporarily unavailable. The request should be retried after
/// some time delay.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceUnavailableException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;
  @_s.JsonKey(name: 'Retry-After')
  final String retryAfterSeconds;

  ServiceUnavailableException({
    this.message,
    this.retryAfterSeconds,
  });
  factory ServiceUnavailableException.fromJson(Map<String, dynamic> json) =>
      _$ServiceUnavailableExceptionFromJson(json);
}

/// Too many requests have been received for this AWS account in too short a
/// time. The request should be retried after some time delay.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TooManyRequestsException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;
  @_s.JsonKey(name: 'Retry-After')
  final String retryAfterSeconds;

  TooManyRequestsException({
    this.message,
    this.retryAfterSeconds,
  });
  factory TooManyRequestsException.fromJson(Map<String, dynamic> json) =>
      _$TooManyRequestsExceptionFromJson(json);
}

/// Credentials of the caller are insufficient to authorize the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnauthorizedException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  UnauthorizedException({
    this.message,
  });
  factory UnauthorizedException.fromJson(Map<String, dynamic> json) =>
      _$UnauthorizedExceptionFromJson(json);
}

/// Result structure used for requests to updated project configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProjectResult {
  /// Detailed information about the updated AWS Mobile Hub project.
  @_s.JsonKey(name: 'details')
  final ProjectDetails details;

  UpdateProjectResult({
    this.details,
  });
  factory UpdateProjectResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateProjectResultFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccountActionRequiredException': (type, message) =>
      AccountActionRequiredException(message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(message: message),
  'NotFoundException': (type, message) => NotFoundException(message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(message: message),
};
