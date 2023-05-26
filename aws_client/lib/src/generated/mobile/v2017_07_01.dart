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

/// AWS Mobile Service provides mobile app and website developers with
/// capabilities required to configure AWS resources and bootstrap their
/// developer desktop projects with the necessary SDKs, constants, tools and
/// samples to make use of those resources.
class Mobile {
  final _s.RestJsonProtocol _protocol;
  Mobile({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mobile',
            signingName: 'AWSMobileHubService',
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
    Uint8List? contents,
    String? name,
    String? region,
    String? snapshotId,
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
    required String projectId,
  }) async {
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
    required String bundleId,
  }) async {
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
    required String projectId,
    bool? syncFromResources,
  }) async {
    final $query = <String, List<String>>{
      'projectId': [projectId],
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
    required String bundleId,
    Platform? platform,
    String? projectId,
  }) async {
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
    required String projectId,
  }) async {
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
    required String projectId,
    Uint8List? contents,
  }) async {
    final $query = <String, List<String>>{
      'projectId': [projectId],
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
class AccountActionRequiredException implements _s.AwsException {
  final String? message;

  AccountActionRequiredException({
    this.message,
  });

  factory AccountActionRequiredException.fromJson(Map<String, dynamic> json) {
    return AccountActionRequiredException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The request cannot be processed because some parameter is not valid or the
/// project state prevents the operation from being performed.
class BadRequestException implements _s.AwsException {
  final String? message;

  BadRequestException({
    this.message,
  });

  factory BadRequestException.fromJson(Map<String, dynamic> json) {
    return BadRequestException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// The details of the bundle.
class BundleDetails {
  final List<Platform>? availablePlatforms;
  final String? bundleId;
  final String? description;
  final String? iconUrl;
  final String? title;
  final String? version;

  BundleDetails({
    this.availablePlatforms,
    this.bundleId,
    this.description,
    this.iconUrl,
    this.title,
    this.version,
  });

  factory BundleDetails.fromJson(Map<String, dynamic> json) {
    return BundleDetails(
      availablePlatforms: (json['availablePlatforms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPlatform())
          .toList(),
      bundleId: json['bundleId'] as String?,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      title: json['title'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availablePlatforms = this.availablePlatforms;
    final bundleId = this.bundleId;
    final description = this.description;
    final iconUrl = this.iconUrl;
    final title = this.title;
    final version = this.version;
    return {
      if (availablePlatforms != null)
        'availablePlatforms':
            availablePlatforms.map((e) => e.toValue()).toList(),
      if (bundleId != null) 'bundleId': bundleId,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (title != null) 'title': title,
      if (version != null) 'version': version,
    };
  }
}

/// Result structure used in response to a request to create a project.
class CreateProjectResult {
  /// Detailed information about the created AWS Mobile Hub project.
  final ProjectDetails? details;

  CreateProjectResult({
    this.details,
  });

  factory CreateProjectResult.fromJson(Map<String, dynamic> json) {
    return CreateProjectResult(
      details: json['details'] != null
          ? ProjectDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    return {
      if (details != null) 'details': details,
    };
  }
}

/// Result structure used in response to request to delete a project.
class DeleteProjectResult {
  /// Resources which were deleted.
  final List<Resource>? deletedResources;

  /// Resources which were not deleted, due to a risk of losing potentially
  /// important data or files.
  final List<Resource>? orphanedResources;

  DeleteProjectResult({
    this.deletedResources,
    this.orphanedResources,
  });

  factory DeleteProjectResult.fromJson(Map<String, dynamic> json) {
    return DeleteProjectResult(
      deletedResources: (json['deletedResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      orphanedResources: (json['orphanedResources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deletedResources = this.deletedResources;
    final orphanedResources = this.orphanedResources;
    return {
      if (deletedResources != null) 'deletedResources': deletedResources,
      if (orphanedResources != null) 'orphanedResources': orphanedResources,
    };
  }
}

/// Result structure contains the details of the bundle.
class DescribeBundleResult {
  /// The details of the bundle.
  final BundleDetails? details;

  DescribeBundleResult({
    this.details,
  });

  factory DescribeBundleResult.fromJson(Map<String, dynamic> json) {
    return DescribeBundleResult(
      details: json['details'] != null
          ? BundleDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    return {
      if (details != null) 'details': details,
    };
  }
}

/// Result structure used for requests of project details.
class DescribeProjectResult {
  final ProjectDetails? details;

  DescribeProjectResult({
    this.details,
  });

  factory DescribeProjectResult.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResult(
      details: json['details'] != null
          ? ProjectDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    return {
      if (details != null) 'details': details,
    };
  }
}

/// Result structure which contains link to download custom-generated SDK and
/// tool packages used to integrate mobile web or app clients with backed AWS
/// resources.
class ExportBundleResult {
  /// URL which contains the custom-generated SDK and tool packages used to
  /// integrate the client mobile app or web app with the AWS resources created by
  /// the AWS Mobile Hub project.
  final String? downloadUrl;

  ExportBundleResult({
    this.downloadUrl,
  });

  factory ExportBundleResult.fromJson(Map<String, dynamic> json) {
    return ExportBundleResult(
      downloadUrl: json['downloadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUrl = this.downloadUrl;
    return {
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
    };
  }
}

/// Result structure used for requests to export project configuration details.
class ExportProjectResult {
  /// URL which can be used to download the exported project configuation file(s).
  final String? downloadUrl;

  /// URL which can be shared to allow other AWS users to create their own project
  /// in AWS Mobile Hub with the same configuration as the specified project. This
  /// URL pertains to a snapshot in time of the project configuration that is
  /// created when this API is called. If you want to share additional changes to
  /// your project configuration, then you will need to create and share a new
  /// snapshot by calling this method again.
  final String? shareUrl;

  /// Unique identifier for the exported snapshot of the project configuration.
  /// This snapshot identifier is included in the share URL.
  final String? snapshotId;

  ExportProjectResult({
    this.downloadUrl,
    this.shareUrl,
    this.snapshotId,
  });

  factory ExportProjectResult.fromJson(Map<String, dynamic> json) {
    return ExportProjectResult(
      downloadUrl: json['downloadUrl'] as String?,
      shareUrl: json['shareUrl'] as String?,
      snapshotId: json['snapshotId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUrl = this.downloadUrl;
    final shareUrl = this.shareUrl;
    final snapshotId = this.snapshotId;
    return {
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
      if (shareUrl != null) 'shareUrl': shareUrl,
      if (snapshotId != null) 'snapshotId': snapshotId,
    };
  }
}

/// The service has encountered an unexpected error condition which prevents it
/// from servicing the request.
class InternalFailureException implements _s.AwsException {
  final String? message;

  InternalFailureException({
    this.message,
  });

  factory InternalFailureException.fromJson(Map<String, dynamic> json) {
    return InternalFailureException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// There are too many AWS Mobile Hub projects in the account or the account has
/// exceeded the maximum number of resources in some AWS service. You should
/// create another sub-account using AWS Organizations or remove some resources
/// and retry your request.
class LimitExceededException implements _s.AwsException {
  final String? message;
  final String? retryAfterSeconds;

  LimitExceededException({
    this.message,
    this.retryAfterSeconds,
  });

  factory LimitExceededException.fromJson(Map<String, dynamic> json) {
    return LimitExceededException(
      message: json['message'] as String?,
      retryAfterSeconds: json['Retry-After'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final retryAfterSeconds = this.retryAfterSeconds;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Result structure contains a list of all available bundles with details.
class ListBundlesResult {
  /// A list of bundles.
  final List<BundleDetails>? bundleList;

  /// Pagination token. If non-null pagination token is returned in a result, then
  /// pass its value in another request to fetch more entries.
  final String? nextToken;

  ListBundlesResult({
    this.bundleList,
    this.nextToken,
  });

  factory ListBundlesResult.fromJson(Map<String, dynamic> json) {
    return ListBundlesResult(
      bundleList: (json['bundleList'] as List?)
          ?.whereNotNull()
          .map((e) => BundleDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleList = this.bundleList;
    final nextToken = this.nextToken;
    return {
      if (bundleList != null) 'bundleList': bundleList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Result structure used for requests to list projects in AWS Mobile Hub.
class ListProjectsResult {
  final String? nextToken;
  final List<ProjectSummary>? projects;

  ListProjectsResult({
    this.nextToken,
    this.projects,
  });

  factory ListProjectsResult.fromJson(Map<String, dynamic> json) {
    return ListProjectsResult(
      nextToken: json['nextToken'] as String?,
      projects: (json['projects'] as List?)
          ?.whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final projects = this.projects;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (projects != null) 'projects': projects,
    };
  }
}

/// No entity can be found with the specified identifier.
class NotFoundException implements _s.AwsException {
  final String? message;

  NotFoundException({
    this.message,
  });

  factory NotFoundException.fromJson(Map<String, dynamic> json) {
    return NotFoundException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Developer desktop or target mobile app or website platform.
enum Platform {
  osx,
  windows,
  linux,
  objc,
  swift,
  android,
  javascript,
}

extension PlatformValueExtension on Platform {
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
  }
}

extension PlatformFromString on String {
  Platform toPlatform() {
    switch (this) {
      case 'OSX':
        return Platform.osx;
      case 'WINDOWS':
        return Platform.windows;
      case 'LINUX':
        return Platform.linux;
      case 'OBJC':
        return Platform.objc;
      case 'SWIFT':
        return Platform.swift;
      case 'ANDROID':
        return Platform.android;
      case 'JAVASCRIPT':
        return Platform.javascript;
    }
    throw Exception('$this is not known in enum Platform');
  }
}

/// Detailed information about an AWS Mobile Hub project.
class ProjectDetails {
  /// Website URL for this project in the AWS Mobile Hub console.
  final String? consoleUrl;

  /// Date the project was created.
  final DateTime? createdDate;

  /// Date of the last modification of the project.
  final DateTime? lastUpdatedDate;
  final String? name;
  final String? projectId;
  final String? region;
  final List<Resource>? resources;
  final ProjectState? state;

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

  factory ProjectDetails.fromJson(Map<String, dynamic> json) {
    return ProjectDetails(
      consoleUrl: json['consoleUrl'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      projectId: json['projectId'] as String?,
      region: json['region'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['state'] as String?)?.toProjectState(),
    );
  }

  Map<String, dynamic> toJson() {
    final consoleUrl = this.consoleUrl;
    final createdDate = this.createdDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final name = this.name;
    final projectId = this.projectId;
    final region = this.region;
    final resources = this.resources;
    final state = this.state;
    return {
      if (consoleUrl != null) 'consoleUrl': consoleUrl,
      if (createdDate != null) 'createdDate': unixTimestampToJson(createdDate),
      if (lastUpdatedDate != null)
        'lastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (name != null) 'name': name,
      if (projectId != null) 'projectId': projectId,
      if (region != null) 'region': region,
      if (resources != null) 'resources': resources,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Synchronization state for a project.
enum ProjectState {
  normal,
  syncing,
  importing,
}

extension ProjectStateValueExtension on ProjectState {
  String toValue() {
    switch (this) {
      case ProjectState.normal:
        return 'NORMAL';
      case ProjectState.syncing:
        return 'SYNCING';
      case ProjectState.importing:
        return 'IMPORTING';
    }
  }
}

extension ProjectStateFromString on String {
  ProjectState toProjectState() {
    switch (this) {
      case 'NORMAL':
        return ProjectState.normal;
      case 'SYNCING':
        return ProjectState.syncing;
      case 'IMPORTING':
        return ProjectState.importing;
    }
    throw Exception('$this is not known in enum ProjectState');
  }
}

/// Summary information about an AWS Mobile Hub project.
class ProjectSummary {
  /// Name of the project.
  final String? name;

  /// Unique project identifier.
  final String? projectId;

  ProjectSummary({
    this.name,
    this.projectId,
  });

  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      name: json['name'] as String?,
      projectId: json['projectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final projectId = this.projectId;
    return {
      if (name != null) 'name': name,
      if (projectId != null) 'projectId': projectId,
    };
  }
}

/// Information about an instance of an AWS resource associated with a project.
class Resource {
  final String? arn;
  final Map<String, String>? attributes;
  final String? feature;
  final String? name;
  final String? type;

  Resource({
    this.arn,
    this.attributes,
    this.feature,
    this.name,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      feature: json['feature'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attributes = this.attributes;
    final feature = this.feature;
    final name = this.name;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (attributes != null) 'attributes': attributes,
      if (feature != null) 'feature': feature,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
  }
}

/// The service is temporarily unavailable. The request should be retried after
/// some time delay.
class ServiceUnavailableException implements _s.AwsException {
  final String? message;
  final String? retryAfterSeconds;

  ServiceUnavailableException({
    this.message,
    this.retryAfterSeconds,
  });

  factory ServiceUnavailableException.fromJson(Map<String, dynamic> json) {
    return ServiceUnavailableException(
      message: json['message'] as String?,
      retryAfterSeconds: json['Retry-After'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final retryAfterSeconds = this.retryAfterSeconds;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Too many requests have been received for this AWS account in too short a
/// time. The request should be retried after some time delay.
class TooManyRequestsException implements _s.AwsException {
  final String? message;
  final String? retryAfterSeconds;

  TooManyRequestsException({
    this.message,
    this.retryAfterSeconds,
  });

  factory TooManyRequestsException.fromJson(Map<String, dynamic> json) {
    return TooManyRequestsException(
      message: json['message'] as String?,
      retryAfterSeconds: json['Retry-After'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final retryAfterSeconds = this.retryAfterSeconds;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Credentials of the caller are insufficient to authorize the request.
class UnauthorizedException implements _s.AwsException {
  final String? message;

  UnauthorizedException({
    this.message,
  });

  factory UnauthorizedException.fromJson(Map<String, dynamic> json) {
    return UnauthorizedException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// Result structure used for requests to updated project configuration.
class UpdateProjectResult {
  /// Detailed information about the updated AWS Mobile Hub project.
  final ProjectDetails? details;

  UpdateProjectResult({
    this.details,
  });

  factory UpdateProjectResult.fromJson(Map<String, dynamic> json) {
    return UpdateProjectResult(
      details: json['details'] != null
          ? ProjectDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    return {
      if (details != null) 'details': details,
    };
  }
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
