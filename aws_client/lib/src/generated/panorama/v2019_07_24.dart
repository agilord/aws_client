// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// This is the <i>AWS Panorama API Reference</i>. For an introduction to the
/// service, see <a
/// href="https://docs.aws.amazon.com/panorama/latest/dev/panorama-welcome.html">What
/// is AWS Panorama?</a> in the <i>AWS Panorama Developer Guide</i>.
class Panorama {
  final _s.RestJsonProtocol _protocol;
  Panorama({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'panorama',
            signingName: 'panorama',
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

  /// Creates an application instance and deploys it to a device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [defaultRuntimeContextDevice] :
  /// A device's ID.
  ///
  /// Parameter [manifestPayload] :
  /// The application's manifest document.
  ///
  /// Parameter [applicationInstanceIdToReplace] :
  /// The ID of an application instance to replace with the new instance.
  ///
  /// Parameter [description] :
  /// A description for the application instance.
  ///
  /// Parameter [manifestOverridesPayload] :
  /// Setting overrides for the application manifest.
  ///
  /// Parameter [name] :
  /// A name for the application instance.
  ///
  /// Parameter [runtimeRoleArn] :
  /// The ARN of a runtime role for the application instance.
  ///
  /// Parameter [tags] :
  /// Tags for the application instance.
  Future<CreateApplicationInstanceResponse> createApplicationInstance({
    required String defaultRuntimeContextDevice,
    required ManifestPayload manifestPayload,
    String? applicationInstanceIdToReplace,
    String? description,
    ManifestOverridesPayload? manifestOverridesPayload,
    String? name,
    String? runtimeRoleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DefaultRuntimeContextDevice': defaultRuntimeContextDevice,
      'ManifestPayload': manifestPayload,
      if (applicationInstanceIdToReplace != null)
        'ApplicationInstanceIdToReplace': applicationInstanceIdToReplace,
      if (description != null) 'Description': description,
      if (manifestOverridesPayload != null)
        'ManifestOverridesPayload': manifestOverridesPayload,
      if (name != null) 'Name': name,
      if (runtimeRoleArn != null) 'RuntimeRoleArn': runtimeRoleArn,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/application-instances',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationInstanceResponse.fromJson(response);
  }

  /// Creates a job to run on a device. A job can update a device's software or
  /// reboot it.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceIds] :
  /// ID of target device.
  ///
  /// Parameter [jobType] :
  /// The type of job to run.
  ///
  /// Parameter [deviceJobConfig] :
  /// Configuration settings for a software update job.
  Future<CreateJobForDevicesResponse> createJobForDevices({
    required List<String> deviceIds,
    required JobType jobType,
    DeviceJobConfig? deviceJobConfig,
  }) async {
    final $payload = <String, dynamic>{
      'DeviceIds': deviceIds,
      'JobType': jobType.value,
      if (deviceJobConfig != null) 'DeviceJobConfig': deviceJobConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobForDevicesResponse.fromJson(response);
  }

  /// Creates a camera stream node.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [nodeName] :
  /// A name for the node.
  ///
  /// Parameter [outputPackageName] :
  /// An output package name for the node.
  ///
  /// Parameter [outputPackageVersion] :
  /// An output package version for the node.
  ///
  /// Parameter [templateParameters] :
  /// Template parameters for the node.
  ///
  /// Parameter [templateType] :
  /// The type of node.
  ///
  /// Parameter [jobTags] :
  /// Tags for the job.
  ///
  /// Parameter [nodeDescription] :
  /// A description for the node.
  Future<CreateNodeFromTemplateJobResponse> createNodeFromTemplateJob({
    required String nodeName,
    required String outputPackageName,
    required String outputPackageVersion,
    required Map<String, String> templateParameters,
    required TemplateType templateType,
    List<JobResourceTags>? jobTags,
    String? nodeDescription,
  }) async {
    final $payload = <String, dynamic>{
      'NodeName': nodeName,
      'OutputPackageName': outputPackageName,
      'OutputPackageVersion': outputPackageVersion,
      'TemplateParameters': templateParameters,
      'TemplateType': templateType.value,
      if (jobTags != null) 'JobTags': jobTags,
      if (nodeDescription != null) 'NodeDescription': nodeDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/packages/template-job',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNodeFromTemplateJobResponse.fromJson(response);
  }

  /// Creates a package and storage location in an Amazon S3 access point.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [packageName] :
  /// A name for the package.
  ///
  /// Parameter [tags] :
  /// Tags for the package.
  Future<CreatePackageResponse> createPackage({
    required String packageName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'PackageName': packageName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/packages',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageResponse.fromJson(response);
  }

  /// Imports a node package.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [clientToken] :
  /// A client token for the package import job.
  ///
  /// Parameter [inputConfig] :
  /// An input config for the package import job.
  ///
  /// Parameter [jobType] :
  /// A job type for the package import job.
  ///
  /// Parameter [outputConfig] :
  /// An output config for the package import job.
  ///
  /// Parameter [jobTags] :
  /// Tags for the package import job.
  Future<CreatePackageImportJobResponse> createPackageImportJob({
    required String clientToken,
    required PackageImportJobInputConfig inputConfig,
    required PackageImportJobType jobType,
    required PackageImportJobOutputConfig outputConfig,
    List<JobResourceTags>? jobTags,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken,
      'InputConfig': inputConfig,
      'JobType': jobType.value,
      'OutputConfig': outputConfig,
      if (jobTags != null) 'JobTags': jobTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/packages/import-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePackageImportJobResponse.fromJson(response);
  }

  /// Deletes a device.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The device's ID.
  Future<DeleteDeviceResponse> deleteDevice({
    required String deviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDeviceResponse.fromJson(response);
  }

  /// Deletes a package.
  /// <note>
  /// To delete a package, you need permission to call
  /// <code>s3:DeleteObject</code> in addition to permissions for the AWS
  /// Panorama API.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [packageId] :
  /// The package's ID.
  ///
  /// Parameter [forceDelete] :
  /// Delete the package even if it has artifacts stored in its access point.
  /// Deletes the package's artifacts from Amazon S3.
  Future<void> deletePackage({
    required String packageId,
    bool? forceDelete,
  }) async {
    final $query = <String, List<String>>{
      if (forceDelete != null) 'ForceDelete': [forceDelete.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/packages/${Uri.encodeComponent(packageId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters a package version.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [packageId] :
  /// A package ID.
  ///
  /// Parameter [packageVersion] :
  /// A package version.
  ///
  /// Parameter [patchVersion] :
  /// A patch version.
  ///
  /// Parameter [ownerAccount] :
  /// An owner account.
  ///
  /// Parameter [updatedLatestPatchVersion] :
  /// If the version was marked latest, the new version to maker as latest.
  Future<void> deregisterPackageVersion({
    required String packageId,
    required String packageVersion,
    required String patchVersion,
    String? ownerAccount,
    String? updatedLatestPatchVersion,
  }) async {
    final $query = <String, List<String>>{
      if (ownerAccount != null) 'OwnerAccount': [ownerAccount],
      if (updatedLatestPatchVersion != null)
        'UpdatedLatestPatchVersion': [updatedLatestPatchVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/packages/${Uri.encodeComponent(packageId)}/versions/${Uri.encodeComponent(packageVersion)}/patch/${Uri.encodeComponent(patchVersion)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about an application instance on a device.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationInstanceId] :
  /// The application instance's ID.
  Future<DescribeApplicationInstanceResponse> describeApplicationInstance({
    required String applicationInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/application-instances/${Uri.encodeComponent(applicationInstanceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeApplicationInstanceResponse.fromJson(response);
  }

  /// Returns information about an application instance's configuration
  /// manifest.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationInstanceId] :
  /// The application instance's ID.
  Future<DescribeApplicationInstanceDetailsResponse>
      describeApplicationInstanceDetails({
    required String applicationInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/application-instances/${Uri.encodeComponent(applicationInstanceId)}/details',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeApplicationInstanceDetailsResponse.fromJson(response);
  }

  /// Returns information about a device.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The device's ID.
  Future<DescribeDeviceResponse> describeDevice({
    required String deviceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeviceResponse.fromJson(response);
  }

  /// Returns information about a device job.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<DescribeDeviceJobResponse> describeDeviceJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeviceJobResponse.fromJson(response);
  }

  /// Returns information about a node.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [nodeId] :
  /// The node's ID.
  ///
  /// Parameter [ownerAccount] :
  /// The account ID of the node's owner.
  Future<DescribeNodeResponse> describeNode({
    required String nodeId,
    String? ownerAccount,
  }) async {
    final $query = <String, List<String>>{
      if (ownerAccount != null) 'OwnerAccount': [ownerAccount],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/nodes/${Uri.encodeComponent(nodeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNodeResponse.fromJson(response);
  }

  /// Returns information about a job to create a camera stream node.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<DescribeNodeFromTemplateJobResponse> describeNodeFromTemplateJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/template-job/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNodeFromTemplateJobResponse.fromJson(response);
  }

  /// Returns information about a package.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [packageId] :
  /// The package's ID.
  Future<DescribePackageResponse> describePackage({
    required String packageId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/metadata/${Uri.encodeComponent(packageId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageResponse.fromJson(response);
  }

  /// Returns information about a package import job.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The job's ID.
  Future<DescribePackageImportJobResponse> describePackageImportJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/import-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageImportJobResponse.fromJson(response);
  }

  /// Returns information about a package version.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [packageId] :
  /// The version's ID.
  ///
  /// Parameter [packageVersion] :
  /// The version's version.
  ///
  /// Parameter [ownerAccount] :
  /// The version's owner account.
  ///
  /// Parameter [patchVersion] :
  /// The version's patch version.
  Future<DescribePackageVersionResponse> describePackageVersion({
    required String packageId,
    required String packageVersion,
    String? ownerAccount,
    String? patchVersion,
  }) async {
    final $query = <String, List<String>>{
      if (ownerAccount != null) 'OwnerAccount': [ownerAccount],
      if (patchVersion != null) 'PatchVersion': [patchVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/packages/metadata/${Uri.encodeComponent(packageId)}/versions/${Uri.encodeComponent(packageVersion)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageVersionResponse.fromJson(response);
  }

  /// Returns a list of application instance dependencies.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationInstanceId] :
  /// The application instance's ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of application instance dependencies to return in one
  /// page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListApplicationInstanceDependenciesResponse>
      listApplicationInstanceDependencies({
    required String applicationInstanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/application-instances/${Uri.encodeComponent(applicationInstanceId)}/package-dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationInstanceDependenciesResponse.fromJson(response);
  }

  /// Returns a list of application node instances.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationInstanceId] :
  /// The node instances' application instance ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of node instances to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListApplicationInstanceNodeInstancesResponse>
      listApplicationInstanceNodeInstances({
    required String applicationInstanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/application-instances/${Uri.encodeComponent(applicationInstanceId)}/node-instances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationInstanceNodeInstancesResponse.fromJson(response);
  }

  /// Returns a list of application instances.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The application instances' device ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of application instances to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [statusFilter] :
  /// Only include instances with a specific status.
  Future<ListApplicationInstancesResponse> listApplicationInstances({
    String? deviceId,
    int? maxResults,
    String? nextToken,
    StatusFilter? statusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (deviceId != null) 'deviceId': [deviceId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (statusFilter != null) 'statusFilter': [statusFilter.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/application-instances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationInstancesResponse.fromJson(response);
  }

  /// Returns a list of devices.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceAggregatedStatusFilter] :
  /// Filter based on a device's status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of devices to return in one page of results.
  ///
  /// Parameter [nameFilter] :
  /// Filter based on device's name. Prefixes supported.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [sortBy] :
  /// The target column to be sorted on. Default column sort is CREATED_TIME.
  ///
  /// Parameter [sortOrder] :
  /// The sorting order for the returned list. SortOrder is DESCENDING by
  /// default based on CREATED_TIME. Otherwise, SortOrder is ASCENDING.
  Future<ListDevicesResponse> listDevices({
    DeviceAggregatedStatus? deviceAggregatedStatusFilter,
    int? maxResults,
    String? nameFilter,
    String? nextToken,
    ListDevicesSortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (deviceAggregatedStatusFilter != null)
        'DeviceAggregatedStatusFilter': [deviceAggregatedStatusFilter.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nameFilter != null) 'NameFilter': [nameFilter],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sortBy != null) 'SortBy': [sortBy.value],
      if (sortOrder != null) 'SortOrder': [sortOrder.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesResponse.fromJson(response);
  }

  /// Returns a list of jobs.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// Filter results by the job's target device ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of device jobs to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListDevicesJobsResponse> listDevicesJobs({
    String? deviceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (deviceId != null) 'DeviceId': [deviceId],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesJobsResponse.fromJson(response);
  }

  /// Returns a list of camera stream node jobs.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of node from template jobs to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListNodeFromTemplateJobsResponse> listNodeFromTemplateJobs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/template-job',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodeFromTemplateJobsResponse.fromJson(response);
  }

  /// Returns a list of nodes.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [category] :
  /// Search for nodes by category.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of nodes to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [ownerAccount] :
  /// Search for nodes by the account ID of the nodes' owner.
  ///
  /// Parameter [packageName] :
  /// Search for nodes by name.
  ///
  /// Parameter [packageVersion] :
  /// Search for nodes by version.
  ///
  /// Parameter [patchVersion] :
  /// Search for nodes by patch version.
  Future<ListNodesResponse> listNodes({
    NodeCategory? category,
    int? maxResults,
    String? nextToken,
    String? ownerAccount,
    String? packageName,
    String? packageVersion,
    String? patchVersion,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (category != null) 'category': [category.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (ownerAccount != null) 'ownerAccount': [ownerAccount],
      if (packageName != null) 'packageName': [packageName],
      if (packageVersion != null) 'packageVersion': [packageVersion],
      if (patchVersion != null) 'patchVersion': [patchVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/nodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodesResponse.fromJson(response);
  }

  /// Returns a list of package import jobs.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of package import jobs to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListPackageImportJobsResponse> listPackageImportJobs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages/import-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageImportJobsResponse.fromJson(response);
  }

  /// Returns a list of packages.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of packages to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListPackagesResponse> listPackages({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagesResponse.fromJson(response);
  }

  /// Returns a list of tags for a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's ARN.
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

  /// Creates a device and returns a configuration archive. The configuration
  /// archive is a ZIP file that contains a provisioning certificate that is
  /// valid for 5 minutes. Name the configuration archive
  /// <code>certificates-omni_<i>device-name</i>.zip</code> and transfer it to
  /// the device within 5 minutes. Use the included USB storage device and
  /// connect it to the USB 3.0 port next to the HDMI output.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// A name for the device.
  ///
  /// Parameter [description] :
  /// A description for the device.
  ///
  /// Parameter [networkingConfiguration] :
  /// A networking configuration for the device.
  ///
  /// Parameter [tags] :
  /// Tags for the device.
  Future<ProvisionDeviceResponse> provisionDevice({
    required String name,
    String? description,
    NetworkPayload? networkingConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (description != null) 'Description': description,
      if (networkingConfiguration != null)
        'NetworkingConfiguration': networkingConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/devices',
      exceptionFnMap: _exceptionFns,
    );
    return ProvisionDeviceResponse.fromJson(response);
  }

  /// Registers a package version.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [packageId] :
  /// A package ID.
  ///
  /// Parameter [packageVersion] :
  /// A package version.
  ///
  /// Parameter [patchVersion] :
  /// A patch version.
  ///
  /// Parameter [markLatest] :
  /// Whether to mark the new version as the latest version.
  ///
  /// Parameter [ownerAccount] :
  /// An owner account.
  Future<void> registerPackageVersion({
    required String packageId,
    required String packageVersion,
    required String patchVersion,
    bool? markLatest,
    String? ownerAccount,
  }) async {
    final $payload = <String, dynamic>{
      if (markLatest != null) 'MarkLatest': markLatest,
      if (ownerAccount != null) 'OwnerAccount': ownerAccount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/packages/${Uri.encodeComponent(packageId)}/versions/${Uri.encodeComponent(packageVersion)}/patch/${Uri.encodeComponent(patchVersion)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes an application instance.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationInstanceId] :
  /// An application instance ID.
  Future<void> removeApplicationInstance({
    required String applicationInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/application-instances/${Uri.encodeComponent(applicationInstanceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Signal camera nodes to stop or resume.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationInstanceId] :
  /// An application instance ID.
  ///
  /// Parameter [nodeSignals] :
  /// A list of signals.
  Future<SignalApplicationInstanceNodeInstancesResponse>
      signalApplicationInstanceNodeInstances({
    required String applicationInstanceId,
    required List<NodeSignal> nodeSignals,
  }) async {
    final $payload = <String, dynamic>{
      'NodeSignals': nodeSignals,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/application-instances/${Uri.encodeComponent(applicationInstanceId)}/node-signals',
      exceptionFnMap: _exceptionFns,
    );
    return SignalApplicationInstanceNodeInstancesResponse.fromJson(response);
  }

  /// Tags a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's ARN.
  ///
  /// Parameter [tags] :
  /// Tags for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
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

  /// Removes tags from a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's ARN.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
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

  /// Updates a device's metadata.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The device's ID.
  ///
  /// Parameter [description] :
  /// A description for the device.
  Future<UpdateDeviceMetadataResponse> updateDeviceMetadata({
    required String deviceId,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/devices/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDeviceMetadataResponse.fromJson(response);
  }
}

/// Details about a beta appliance software update.
class AlternateSoftwareMetadata {
  /// The appliance software version.
  final String? version;

  AlternateSoftwareMetadata({
    this.version,
  });

  factory AlternateSoftwareMetadata.fromJson(Map<String, dynamic> json) {
    return AlternateSoftwareMetadata(
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version,
    };
  }
}

/// An application instance on a device.
class ApplicationInstance {
  /// The application instance's ID.
  final String? applicationInstanceId;

  /// The application instance's ARN.
  final String? arn;

  /// When the application instance was created.
  final DateTime? createdTime;

  /// The device's ID.
  final String? defaultRuntimeContextDevice;

  /// The device's name.
  final String? defaultRuntimeContextDeviceName;

  /// The application instance's description.
  final String? description;

  /// The application instance's health status.
  final ApplicationInstanceHealthStatus? healthStatus;

  /// The application instance's name.
  final String? name;

  /// The application's state.
  final List<ReportedRuntimeContextState>? runtimeContextStates;

  /// The application instance's status.
  final ApplicationInstanceStatus? status;

  /// The application instance's status description.
  final String? statusDescription;

  /// The application instance's tags.
  final Map<String, String>? tags;

  ApplicationInstance({
    this.applicationInstanceId,
    this.arn,
    this.createdTime,
    this.defaultRuntimeContextDevice,
    this.defaultRuntimeContextDeviceName,
    this.description,
    this.healthStatus,
    this.name,
    this.runtimeContextStates,
    this.status,
    this.statusDescription,
    this.tags,
  });

  factory ApplicationInstance.fromJson(Map<String, dynamic> json) {
    return ApplicationInstance(
      applicationInstanceId: json['ApplicationInstanceId'] as String?,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      defaultRuntimeContextDevice:
          json['DefaultRuntimeContextDevice'] as String?,
      defaultRuntimeContextDeviceName:
          json['DefaultRuntimeContextDeviceName'] as String?,
      description: json['Description'] as String?,
      healthStatus: (json['HealthStatus'] as String?)
          ?.let(ApplicationInstanceHealthStatus.fromString),
      name: json['Name'] as String?,
      runtimeContextStates: (json['RuntimeContextStates'] as List?)
          ?.nonNulls
          .map((e) =>
              ReportedRuntimeContextState.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)
          ?.let(ApplicationInstanceStatus.fromString),
      statusDescription: json['StatusDescription'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInstanceId = this.applicationInstanceId;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final defaultRuntimeContextDevice = this.defaultRuntimeContextDevice;
    final defaultRuntimeContextDeviceName =
        this.defaultRuntimeContextDeviceName;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final name = this.name;
    final runtimeContextStates = this.runtimeContextStates;
    final status = this.status;
    final statusDescription = this.statusDescription;
    final tags = this.tags;
    return {
      if (applicationInstanceId != null)
        'ApplicationInstanceId': applicationInstanceId,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (defaultRuntimeContextDevice != null)
        'DefaultRuntimeContextDevice': defaultRuntimeContextDevice,
      if (defaultRuntimeContextDeviceName != null)
        'DefaultRuntimeContextDeviceName': defaultRuntimeContextDeviceName,
      if (description != null) 'Description': description,
      if (healthStatus != null) 'HealthStatus': healthStatus.value,
      if (name != null) 'Name': name,
      if (runtimeContextStates != null)
        'RuntimeContextStates': runtimeContextStates,
      if (status != null) 'Status': status.value,
      if (statusDescription != null) 'StatusDescription': statusDescription,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ApplicationInstanceHealthStatus {
  running('RUNNING'),
  error('ERROR'),
  notAvailable('NOT_AVAILABLE'),
  ;

  final String value;

  const ApplicationInstanceHealthStatus(this.value);

  static ApplicationInstanceHealthStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ApplicationInstanceHealthStatus'));
}

enum ApplicationInstanceStatus {
  deploymentPending('DEPLOYMENT_PENDING'),
  deploymentRequested('DEPLOYMENT_REQUESTED'),
  deploymentInProgress('DEPLOYMENT_IN_PROGRESS'),
  deploymentError('DEPLOYMENT_ERROR'),
  deploymentSucceeded('DEPLOYMENT_SUCCEEDED'),
  removalPending('REMOVAL_PENDING'),
  removalRequested('REMOVAL_REQUESTED'),
  removalInProgress('REMOVAL_IN_PROGRESS'),
  removalFailed('REMOVAL_FAILED'),
  removalSucceeded('REMOVAL_SUCCEEDED'),
  deploymentFailed('DEPLOYMENT_FAILED'),
  ;

  final String value;

  const ApplicationInstanceStatus(this.value);

  static ApplicationInstanceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ApplicationInstanceStatus'));
}

enum ConnectionType {
  staticIp('STATIC_IP'),
  dhcp('DHCP'),
  ;

  final String value;

  const ConnectionType(this.value);

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectionType'));
}

class CreateApplicationInstanceResponse {
  /// The application instance's ID.
  final String applicationInstanceId;

  CreateApplicationInstanceResponse({
    required this.applicationInstanceId,
  });

  factory CreateApplicationInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateApplicationInstanceResponse(
      applicationInstanceId: json['ApplicationInstanceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInstanceId = this.applicationInstanceId;
    return {
      'ApplicationInstanceId': applicationInstanceId,
    };
  }
}

class CreateJobForDevicesResponse {
  /// A list of jobs.
  final List<Job> jobs;

  CreateJobForDevicesResponse({
    required this.jobs,
  });

  factory CreateJobForDevicesResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobForDevicesResponse(
      jobs: (json['Jobs'] as List)
          .nonNulls
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    return {
      'Jobs': jobs,
    };
  }
}

class CreateNodeFromTemplateJobResponse {
  /// The job's ID.
  final String jobId;

  CreateNodeFromTemplateJobResponse({
    required this.jobId,
  });

  factory CreateNodeFromTemplateJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateNodeFromTemplateJobResponse(
      jobId: json['JobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'JobId': jobId,
    };
  }
}

class CreatePackageImportJobResponse {
  /// The job's ID.
  final String jobId;

  CreatePackageImportJobResponse({
    required this.jobId,
  });

  factory CreatePackageImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreatePackageImportJobResponse(
      jobId: json['JobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'JobId': jobId,
    };
  }
}

class CreatePackageResponse {
  /// The package's storage location.
  final StorageLocation storageLocation;

  /// The package's ARN.
  final String? arn;

  /// The package's ID.
  final String? packageId;

  CreatePackageResponse({
    required this.storageLocation,
    this.arn,
    this.packageId,
  });

  factory CreatePackageResponse.fromJson(Map<String, dynamic> json) {
    return CreatePackageResponse(
      storageLocation: StorageLocation.fromJson(
          json['StorageLocation'] as Map<String, dynamic>),
      arn: json['Arn'] as String?,
      packageId: json['PackageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageLocation = this.storageLocation;
    final arn = this.arn;
    final packageId = this.packageId;
    return {
      'StorageLocation': storageLocation,
      if (arn != null) 'Arn': arn,
      if (packageId != null) 'PackageId': packageId,
    };
  }
}

class DeleteDeviceResponse {
  /// The device's ID.
  final String? deviceId;

  DeleteDeviceResponse({
    this.deviceId,
  });

  factory DeleteDeviceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDeviceResponse(
      deviceId: json['DeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    return {
      if (deviceId != null) 'DeviceId': deviceId,
    };
  }
}

class DeletePackageResponse {
  DeletePackageResponse();

  factory DeletePackageResponse.fromJson(Map<String, dynamic> _) {
    return DeletePackageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterPackageVersionResponse {
  DeregisterPackageVersionResponse();

  factory DeregisterPackageVersionResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterPackageVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeApplicationInstanceDetailsResponse {
  /// The application instance's ID.
  final String? applicationInstanceId;

  /// The ID of the application instance that this instance replaced.
  final String? applicationInstanceIdToReplace;

  /// When the application instance was created.
  final DateTime? createdTime;

  /// The application instance's default runtime context device.
  final String? defaultRuntimeContextDevice;

  /// The application instance's description.
  final String? description;

  /// Parameter overrides for the configuration manifest.
  final ManifestOverridesPayload? manifestOverridesPayload;

  /// The application instance's configuration manifest.
  final ManifestPayload? manifestPayload;

  /// The application instance's name.
  final String? name;

  DescribeApplicationInstanceDetailsResponse({
    this.applicationInstanceId,
    this.applicationInstanceIdToReplace,
    this.createdTime,
    this.defaultRuntimeContextDevice,
    this.description,
    this.manifestOverridesPayload,
    this.manifestPayload,
    this.name,
  });

  factory DescribeApplicationInstanceDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationInstanceDetailsResponse(
      applicationInstanceId: json['ApplicationInstanceId'] as String?,
      applicationInstanceIdToReplace:
          json['ApplicationInstanceIdToReplace'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      defaultRuntimeContextDevice:
          json['DefaultRuntimeContextDevice'] as String?,
      description: json['Description'] as String?,
      manifestOverridesPayload: json['ManifestOverridesPayload'] != null
          ? ManifestOverridesPayload.fromJson(
              json['ManifestOverridesPayload'] as Map<String, dynamic>)
          : null,
      manifestPayload: json['ManifestPayload'] != null
          ? ManifestPayload.fromJson(
              json['ManifestPayload'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInstanceId = this.applicationInstanceId;
    final applicationInstanceIdToReplace = this.applicationInstanceIdToReplace;
    final createdTime = this.createdTime;
    final defaultRuntimeContextDevice = this.defaultRuntimeContextDevice;
    final description = this.description;
    final manifestOverridesPayload = this.manifestOverridesPayload;
    final manifestPayload = this.manifestPayload;
    final name = this.name;
    return {
      if (applicationInstanceId != null)
        'ApplicationInstanceId': applicationInstanceId,
      if (applicationInstanceIdToReplace != null)
        'ApplicationInstanceIdToReplace': applicationInstanceIdToReplace,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (defaultRuntimeContextDevice != null)
        'DefaultRuntimeContextDevice': defaultRuntimeContextDevice,
      if (description != null) 'Description': description,
      if (manifestOverridesPayload != null)
        'ManifestOverridesPayload': manifestOverridesPayload,
      if (manifestPayload != null) 'ManifestPayload': manifestPayload,
      if (name != null) 'Name': name,
    };
  }
}

class DescribeApplicationInstanceResponse {
  /// The application instance's ID.
  final String? applicationInstanceId;

  /// The ID of the application instance that this instance replaced.
  final String? applicationInstanceIdToReplace;

  /// The application instance's ARN.
  final String? arn;

  /// When the application instance was created.
  final DateTime? createdTime;

  /// The device's ID.
  final String? defaultRuntimeContextDevice;

  /// The device's bane.
  final String? defaultRuntimeContextDeviceName;

  /// The application instance's description.
  final String? description;

  /// The application instance's health status.
  final ApplicationInstanceHealthStatus? healthStatus;

  /// The application instance was updated.
  final DateTime? lastUpdatedTime;

  /// The application instance's name.
  final String? name;

  /// The application instance's state.
  final List<ReportedRuntimeContextState>? runtimeContextStates;

  /// The application instance's runtime role ARN.
  final String? runtimeRoleArn;

  /// The application instance's status.
  final ApplicationInstanceStatus? status;

  /// The application instance's status description.
  final String? statusDescription;

  /// The application instance's tags.
  final Map<String, String>? tags;

  DescribeApplicationInstanceResponse({
    this.applicationInstanceId,
    this.applicationInstanceIdToReplace,
    this.arn,
    this.createdTime,
    this.defaultRuntimeContextDevice,
    this.defaultRuntimeContextDeviceName,
    this.description,
    this.healthStatus,
    this.lastUpdatedTime,
    this.name,
    this.runtimeContextStates,
    this.runtimeRoleArn,
    this.status,
    this.statusDescription,
    this.tags,
  });

  factory DescribeApplicationInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeApplicationInstanceResponse(
      applicationInstanceId: json['ApplicationInstanceId'] as String?,
      applicationInstanceIdToReplace:
          json['ApplicationInstanceIdToReplace'] as String?,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      defaultRuntimeContextDevice:
          json['DefaultRuntimeContextDevice'] as String?,
      defaultRuntimeContextDeviceName:
          json['DefaultRuntimeContextDeviceName'] as String?,
      description: json['Description'] as String?,
      healthStatus: (json['HealthStatus'] as String?)
          ?.let(ApplicationInstanceHealthStatus.fromString),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      runtimeContextStates: (json['RuntimeContextStates'] as List?)
          ?.nonNulls
          .map((e) =>
              ReportedRuntimeContextState.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtimeRoleArn: json['RuntimeRoleArn'] as String?,
      status: (json['Status'] as String?)
          ?.let(ApplicationInstanceStatus.fromString),
      statusDescription: json['StatusDescription'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInstanceId = this.applicationInstanceId;
    final applicationInstanceIdToReplace = this.applicationInstanceIdToReplace;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final defaultRuntimeContextDevice = this.defaultRuntimeContextDevice;
    final defaultRuntimeContextDeviceName =
        this.defaultRuntimeContextDeviceName;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final runtimeContextStates = this.runtimeContextStates;
    final runtimeRoleArn = this.runtimeRoleArn;
    final status = this.status;
    final statusDescription = this.statusDescription;
    final tags = this.tags;
    return {
      if (applicationInstanceId != null)
        'ApplicationInstanceId': applicationInstanceId,
      if (applicationInstanceIdToReplace != null)
        'ApplicationInstanceIdToReplace': applicationInstanceIdToReplace,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (defaultRuntimeContextDevice != null)
        'DefaultRuntimeContextDevice': defaultRuntimeContextDevice,
      if (defaultRuntimeContextDeviceName != null)
        'DefaultRuntimeContextDeviceName': defaultRuntimeContextDeviceName,
      if (description != null) 'Description': description,
      if (healthStatus != null) 'HealthStatus': healthStatus.value,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (runtimeContextStates != null)
        'RuntimeContextStates': runtimeContextStates,
      if (runtimeRoleArn != null) 'RuntimeRoleArn': runtimeRoleArn,
      if (status != null) 'Status': status.value,
      if (statusDescription != null) 'StatusDescription': statusDescription,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DescribeDeviceJobResponse {
  /// When the job was created.
  final DateTime? createdTime;

  /// The device's ARN.
  final String? deviceArn;

  /// The device's ID.
  final String? deviceId;

  /// The device's name.
  final String? deviceName;

  /// The device's type.
  final DeviceType? deviceType;

  /// For an OTA job, the target version of the device software.
  final String? imageVersion;

  /// The job's ID.
  final String? jobId;

  /// The job's type.
  final JobType? jobType;

  /// The job's status.
  final UpdateProgress? status;

  DescribeDeviceJobResponse({
    this.createdTime,
    this.deviceArn,
    this.deviceId,
    this.deviceName,
    this.deviceType,
    this.imageVersion,
    this.jobId,
    this.jobType,
    this.status,
  });

  factory DescribeDeviceJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceJobResponse(
      createdTime: timeStampFromJson(json['CreatedTime']),
      deviceArn: json['DeviceArn'] as String?,
      deviceId: json['DeviceId'] as String?,
      deviceName: json['DeviceName'] as String?,
      deviceType: (json['DeviceType'] as String?)?.let(DeviceType.fromString),
      imageVersion: json['ImageVersion'] as String?,
      jobId: json['JobId'] as String?,
      jobType: (json['JobType'] as String?)?.let(JobType.fromString),
      status: (json['Status'] as String?)?.let(UpdateProgress.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final deviceArn = this.deviceArn;
    final deviceId = this.deviceId;
    final deviceName = this.deviceName;
    final deviceType = this.deviceType;
    final imageVersion = this.imageVersion;
    final jobId = this.jobId;
    final jobType = this.jobType;
    final status = this.status;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (deviceArn != null) 'DeviceArn': deviceArn,
      if (deviceId != null) 'DeviceId': deviceId,
      if (deviceName != null) 'DeviceName': deviceName,
      if (deviceType != null) 'DeviceType': deviceType.value,
      if (imageVersion != null) 'ImageVersion': imageVersion,
      if (jobId != null) 'JobId': jobId,
      if (jobType != null) 'JobType': jobType.value,
      if (status != null) 'Status': status.value,
    };
  }
}

class DescribeDeviceResponse {
  /// Beta software releases available for the device.
  final List<AlternateSoftwareMetadata>? alternateSoftwares;

  /// The device's ARN.
  final String? arn;

  /// The device's maker.
  final DeviceBrand? brand;

  /// When the device was created.
  final DateTime? createdTime;

  /// The device's networking status.
  final NetworkStatus? currentNetworkingStatus;

  /// The device's current software version.
  final String? currentSoftware;

  /// The device's description.
  final String? description;

  /// A device's aggregated status. Including the device's connection status,
  /// provisioning status, and lease status.
  final DeviceAggregatedStatus? deviceAggregatedStatus;

  /// The device's connection status.
  final DeviceConnectionStatus? deviceConnectionStatus;

  /// The device's ID.
  final String? deviceId;

  /// The most recent beta software release.
  final String? latestAlternateSoftware;

  /// A device's latest job. Includes the target image version, and the job
  /// status.
  final LatestDeviceJob? latestDeviceJob;

  /// The latest software version available for the device.
  final String? latestSoftware;

  /// The device's lease expiration time.
  final DateTime? leaseExpirationTime;

  /// The device's name.
  final String? name;

  /// The device's networking configuration.
  final NetworkPayload? networkingConfiguration;

  /// The device's provisioning status.
  final DeviceStatus? provisioningStatus;

  /// The device's serial number.
  final String? serialNumber;

  /// The device's tags.
  final Map<String, String>? tags;

  /// The device's type.
  final DeviceType? type;

  DescribeDeviceResponse({
    this.alternateSoftwares,
    this.arn,
    this.brand,
    this.createdTime,
    this.currentNetworkingStatus,
    this.currentSoftware,
    this.description,
    this.deviceAggregatedStatus,
    this.deviceConnectionStatus,
    this.deviceId,
    this.latestAlternateSoftware,
    this.latestDeviceJob,
    this.latestSoftware,
    this.leaseExpirationTime,
    this.name,
    this.networkingConfiguration,
    this.provisioningStatus,
    this.serialNumber,
    this.tags,
    this.type,
  });

  factory DescribeDeviceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeviceResponse(
      alternateSoftwares: (json['AlternateSoftwares'] as List?)
          ?.nonNulls
          .map((e) =>
              AlternateSoftwareMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      brand: (json['Brand'] as String?)?.let(DeviceBrand.fromString),
      createdTime: timeStampFromJson(json['CreatedTime']),
      currentNetworkingStatus: json['CurrentNetworkingStatus'] != null
          ? NetworkStatus.fromJson(
              json['CurrentNetworkingStatus'] as Map<String, dynamic>)
          : null,
      currentSoftware: json['CurrentSoftware'] as String?,
      description: json['Description'] as String?,
      deviceAggregatedStatus: (json['DeviceAggregatedStatus'] as String?)
          ?.let(DeviceAggregatedStatus.fromString),
      deviceConnectionStatus: (json['DeviceConnectionStatus'] as String?)
          ?.let(DeviceConnectionStatus.fromString),
      deviceId: json['DeviceId'] as String?,
      latestAlternateSoftware: json['LatestAlternateSoftware'] as String?,
      latestDeviceJob: json['LatestDeviceJob'] != null
          ? LatestDeviceJob.fromJson(
              json['LatestDeviceJob'] as Map<String, dynamic>)
          : null,
      latestSoftware: json['LatestSoftware'] as String?,
      leaseExpirationTime: timeStampFromJson(json['LeaseExpirationTime']),
      name: json['Name'] as String?,
      networkingConfiguration: json['NetworkingConfiguration'] != null
          ? NetworkPayload.fromJson(
              json['NetworkingConfiguration'] as Map<String, dynamic>)
          : null,
      provisioningStatus:
          (json['ProvisioningStatus'] as String?)?.let(DeviceStatus.fromString),
      serialNumber: json['SerialNumber'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.let(DeviceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final alternateSoftwares = this.alternateSoftwares;
    final arn = this.arn;
    final brand = this.brand;
    final createdTime = this.createdTime;
    final currentNetworkingStatus = this.currentNetworkingStatus;
    final currentSoftware = this.currentSoftware;
    final description = this.description;
    final deviceAggregatedStatus = this.deviceAggregatedStatus;
    final deviceConnectionStatus = this.deviceConnectionStatus;
    final deviceId = this.deviceId;
    final latestAlternateSoftware = this.latestAlternateSoftware;
    final latestDeviceJob = this.latestDeviceJob;
    final latestSoftware = this.latestSoftware;
    final leaseExpirationTime = this.leaseExpirationTime;
    final name = this.name;
    final networkingConfiguration = this.networkingConfiguration;
    final provisioningStatus = this.provisioningStatus;
    final serialNumber = this.serialNumber;
    final tags = this.tags;
    final type = this.type;
    return {
      if (alternateSoftwares != null) 'AlternateSoftwares': alternateSoftwares,
      if (arn != null) 'Arn': arn,
      if (brand != null) 'Brand': brand.value,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (currentNetworkingStatus != null)
        'CurrentNetworkingStatus': currentNetworkingStatus,
      if (currentSoftware != null) 'CurrentSoftware': currentSoftware,
      if (description != null) 'Description': description,
      if (deviceAggregatedStatus != null)
        'DeviceAggregatedStatus': deviceAggregatedStatus.value,
      if (deviceConnectionStatus != null)
        'DeviceConnectionStatus': deviceConnectionStatus.value,
      if (deviceId != null) 'DeviceId': deviceId,
      if (latestAlternateSoftware != null)
        'LatestAlternateSoftware': latestAlternateSoftware,
      if (latestDeviceJob != null) 'LatestDeviceJob': latestDeviceJob,
      if (latestSoftware != null) 'LatestSoftware': latestSoftware,
      if (leaseExpirationTime != null)
        'LeaseExpirationTime': unixTimestampToJson(leaseExpirationTime),
      if (name != null) 'Name': name,
      if (networkingConfiguration != null)
        'NetworkingConfiguration': networkingConfiguration,
      if (provisioningStatus != null)
        'ProvisioningStatus': provisioningStatus.value,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.value,
    };
  }
}

class DescribeNodeFromTemplateJobResponse {
  /// When the job was created.
  final DateTime createdTime;

  /// The job's ID.
  final String jobId;

  /// When the job was updated.
  final DateTime lastUpdatedTime;

  /// The node's name.
  final String nodeName;

  /// The job's output package name.
  final String outputPackageName;

  /// The job's output package version.
  final String outputPackageVersion;

  /// The job's status.
  final NodeFromTemplateJobStatus status;

  /// The job's status message.
  final String statusMessage;

  /// The job's template parameters.
  final Map<String, String> templateParameters;

  /// The job's template type.
  final TemplateType templateType;

  /// The job's tags.
  final List<JobResourceTags>? jobTags;

  /// The node's description.
  final String? nodeDescription;

  DescribeNodeFromTemplateJobResponse({
    required this.createdTime,
    required this.jobId,
    required this.lastUpdatedTime,
    required this.nodeName,
    required this.outputPackageName,
    required this.outputPackageVersion,
    required this.status,
    required this.statusMessage,
    required this.templateParameters,
    required this.templateType,
    this.jobTags,
    this.nodeDescription,
  });

  factory DescribeNodeFromTemplateJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeNodeFromTemplateJobResponse(
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      jobId: json['JobId'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] as Object),
      nodeName: json['NodeName'] as String,
      outputPackageName: json['OutputPackageName'] as String,
      outputPackageVersion: json['OutputPackageVersion'] as String,
      status: NodeFromTemplateJobStatus.fromString((json['Status'] as String)),
      statusMessage: json['StatusMessage'] as String,
      templateParameters: (json['TemplateParameters'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      templateType: TemplateType.fromString((json['TemplateType'] as String)),
      jobTags: (json['JobTags'] as List?)
          ?.nonNulls
          .map((e) => JobResourceTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      nodeDescription: json['NodeDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final jobId = this.jobId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final nodeName = this.nodeName;
    final outputPackageName = this.outputPackageName;
    final outputPackageVersion = this.outputPackageVersion;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final templateParameters = this.templateParameters;
    final templateType = this.templateType;
    final jobTags = this.jobTags;
    final nodeDescription = this.nodeDescription;
    return {
      'CreatedTime': unixTimestampToJson(createdTime),
      'JobId': jobId,
      'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'NodeName': nodeName,
      'OutputPackageName': outputPackageName,
      'OutputPackageVersion': outputPackageVersion,
      'Status': status.value,
      'StatusMessage': statusMessage,
      'TemplateParameters': templateParameters,
      'TemplateType': templateType.value,
      if (jobTags != null) 'JobTags': jobTags,
      if (nodeDescription != null) 'NodeDescription': nodeDescription,
    };
  }
}

class DescribeNodeResponse {
  /// The node's category.
  final NodeCategory category;

  /// When the node was created.
  final DateTime createdTime;

  /// The node's description.
  final String description;

  /// When the node was updated.
  final DateTime lastUpdatedTime;

  /// The node's name.
  final String name;

  /// The node's ID.
  final String nodeId;

  /// The node's interface.
  final NodeInterface nodeInterface;

  /// The account ID of the node's owner.
  final String ownerAccount;

  /// The node's package ID.
  final String packageId;

  /// The node's package name.
  final String packageName;

  /// The node's package version.
  final String packageVersion;

  /// The node's patch version.
  final String patchVersion;

  /// The node's asset name.
  final String? assetName;

  /// The node's ARN.
  final String? packageArn;

  DescribeNodeResponse({
    required this.category,
    required this.createdTime,
    required this.description,
    required this.lastUpdatedTime,
    required this.name,
    required this.nodeId,
    required this.nodeInterface,
    required this.ownerAccount,
    required this.packageId,
    required this.packageName,
    required this.packageVersion,
    required this.patchVersion,
    this.assetName,
    this.packageArn,
  });

  factory DescribeNodeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeNodeResponse(
      category: NodeCategory.fromString((json['Category'] as String)),
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      description: json['Description'] as String,
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] as Object),
      name: json['Name'] as String,
      nodeId: json['NodeId'] as String,
      nodeInterface:
          NodeInterface.fromJson(json['NodeInterface'] as Map<String, dynamic>),
      ownerAccount: json['OwnerAccount'] as String,
      packageId: json['PackageId'] as String,
      packageName: json['PackageName'] as String,
      packageVersion: json['PackageVersion'] as String,
      patchVersion: json['PatchVersion'] as String,
      assetName: json['AssetName'] as String?,
      packageArn: json['PackageArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final createdTime = this.createdTime;
    final description = this.description;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final nodeId = this.nodeId;
    final nodeInterface = this.nodeInterface;
    final ownerAccount = this.ownerAccount;
    final packageId = this.packageId;
    final packageName = this.packageName;
    final packageVersion = this.packageVersion;
    final patchVersion = this.patchVersion;
    final assetName = this.assetName;
    final packageArn = this.packageArn;
    return {
      'Category': category.value,
      'CreatedTime': unixTimestampToJson(createdTime),
      'Description': description,
      'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'Name': name,
      'NodeId': nodeId,
      'NodeInterface': nodeInterface,
      'OwnerAccount': ownerAccount,
      'PackageId': packageId,
      'PackageName': packageName,
      'PackageVersion': packageVersion,
      'PatchVersion': patchVersion,
      if (assetName != null) 'AssetName': assetName,
      if (packageArn != null) 'PackageArn': packageArn,
    };
  }
}

class DescribePackageImportJobResponse {
  /// When the job was created.
  final DateTime createdTime;

  /// The job's input config.
  final PackageImportJobInputConfig inputConfig;

  /// The job's ID.
  final String jobId;

  /// The job's type.
  final PackageImportJobType jobType;

  /// When the job was updated.
  final DateTime lastUpdatedTime;

  /// The job's output.
  final PackageImportJobOutput output;

  /// The job's output config.
  final PackageImportJobOutputConfig outputConfig;

  /// The job's status.
  final PackageImportJobStatus status;

  /// The job's status message.
  final String statusMessage;

  /// The job's client token.
  final String? clientToken;

  /// The job's tags.
  final List<JobResourceTags>? jobTags;

  DescribePackageImportJobResponse({
    required this.createdTime,
    required this.inputConfig,
    required this.jobId,
    required this.jobType,
    required this.lastUpdatedTime,
    required this.output,
    required this.outputConfig,
    required this.status,
    required this.statusMessage,
    this.clientToken,
    this.jobTags,
  });

  factory DescribePackageImportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribePackageImportJobResponse(
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      inputConfig: PackageImportJobInputConfig.fromJson(
          json['InputConfig'] as Map<String, dynamic>),
      jobId: json['JobId'] as String,
      jobType: PackageImportJobType.fromString((json['JobType'] as String)),
      lastUpdatedTime:
          nonNullableTimeStampFromJson(json['LastUpdatedTime'] as Object),
      output: PackageImportJobOutput.fromJson(
          json['Output'] as Map<String, dynamic>),
      outputConfig: PackageImportJobOutputConfig.fromJson(
          json['OutputConfig'] as Map<String, dynamic>),
      status: PackageImportJobStatus.fromString((json['Status'] as String)),
      statusMessage: json['StatusMessage'] as String,
      clientToken: json['ClientToken'] as String?,
      jobTags: (json['JobTags'] as List?)
          ?.nonNulls
          .map((e) => JobResourceTags.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final inputConfig = this.inputConfig;
    final jobId = this.jobId;
    final jobType = this.jobType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final output = this.output;
    final outputConfig = this.outputConfig;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final clientToken = this.clientToken;
    final jobTags = this.jobTags;
    return {
      'CreatedTime': unixTimestampToJson(createdTime),
      'InputConfig': inputConfig,
      'JobId': jobId,
      'JobType': jobType.value,
      'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      'Output': output,
      'OutputConfig': outputConfig,
      'Status': status.value,
      'StatusMessage': statusMessage,
      if (clientToken != null) 'ClientToken': clientToken,
      if (jobTags != null) 'JobTags': jobTags,
    };
  }
}

class DescribePackageResponse {
  /// The package's ARN.
  final String arn;

  /// When the package was created.
  final DateTime createdTime;

  /// The package's ID.
  final String packageId;

  /// The package's name.
  final String packageName;

  /// The package's storage location.
  final StorageLocation storageLocation;

  /// The package's tags.
  final Map<String, String> tags;

  /// ARNs of accounts that have read access to the package.
  final List<String>? readAccessPrincipalArns;

  /// ARNs of accounts that have write access to the package.
  final List<String>? writeAccessPrincipalArns;

  DescribePackageResponse({
    required this.arn,
    required this.createdTime,
    required this.packageId,
    required this.packageName,
    required this.storageLocation,
    required this.tags,
    this.readAccessPrincipalArns,
    this.writeAccessPrincipalArns,
  });

  factory DescribePackageResponse.fromJson(Map<String, dynamic> json) {
    return DescribePackageResponse(
      arn: json['Arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      packageId: json['PackageId'] as String,
      packageName: json['PackageName'] as String,
      storageLocation: StorageLocation.fromJson(
          json['StorageLocation'] as Map<String, dynamic>),
      tags: (json['Tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      readAccessPrincipalArns: (json['ReadAccessPrincipalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      writeAccessPrincipalArns: (json['WriteAccessPrincipalArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final packageId = this.packageId;
    final packageName = this.packageName;
    final storageLocation = this.storageLocation;
    final tags = this.tags;
    final readAccessPrincipalArns = this.readAccessPrincipalArns;
    final writeAccessPrincipalArns = this.writeAccessPrincipalArns;
    return {
      'Arn': arn,
      'CreatedTime': unixTimestampToJson(createdTime),
      'PackageId': packageId,
      'PackageName': packageName,
      'StorageLocation': storageLocation,
      'Tags': tags,
      if (readAccessPrincipalArns != null)
        'ReadAccessPrincipalArns': readAccessPrincipalArns,
      if (writeAccessPrincipalArns != null)
        'WriteAccessPrincipalArns': writeAccessPrincipalArns,
    };
  }
}

class DescribePackageVersionResponse {
  /// Whether the version is the latest available.
  final bool isLatestPatch;

  /// The version's ID.
  final String packageId;

  /// The version's name.
  final String packageName;

  /// The version's version.
  final String packageVersion;

  /// The version's patch version.
  final String patchVersion;

  /// The version's status.
  final PackageVersionStatus status;

  /// The account ID of the version's owner.
  final String? ownerAccount;

  /// The ARN of the package.
  final String? packageArn;

  /// The version's registered time.
  final DateTime? registeredTime;

  /// The version's status description.
  final String? statusDescription;

  DescribePackageVersionResponse({
    required this.isLatestPatch,
    required this.packageId,
    required this.packageName,
    required this.packageVersion,
    required this.patchVersion,
    required this.status,
    this.ownerAccount,
    this.packageArn,
    this.registeredTime,
    this.statusDescription,
  });

  factory DescribePackageVersionResponse.fromJson(Map<String, dynamic> json) {
    return DescribePackageVersionResponse(
      isLatestPatch: json['IsLatestPatch'] as bool,
      packageId: json['PackageId'] as String,
      packageName: json['PackageName'] as String,
      packageVersion: json['PackageVersion'] as String,
      patchVersion: json['PatchVersion'] as String,
      status: PackageVersionStatus.fromString((json['Status'] as String)),
      ownerAccount: json['OwnerAccount'] as String?,
      packageArn: json['PackageArn'] as String?,
      registeredTime: timeStampFromJson(json['RegisteredTime']),
      statusDescription: json['StatusDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isLatestPatch = this.isLatestPatch;
    final packageId = this.packageId;
    final packageName = this.packageName;
    final packageVersion = this.packageVersion;
    final patchVersion = this.patchVersion;
    final status = this.status;
    final ownerAccount = this.ownerAccount;
    final packageArn = this.packageArn;
    final registeredTime = this.registeredTime;
    final statusDescription = this.statusDescription;
    return {
      'IsLatestPatch': isLatestPatch,
      'PackageId': packageId,
      'PackageName': packageName,
      'PackageVersion': packageVersion,
      'PatchVersion': patchVersion,
      'Status': status.value,
      if (ownerAccount != null) 'OwnerAccount': ownerAccount,
      if (packageArn != null) 'PackageArn': packageArn,
      if (registeredTime != null)
        'RegisteredTime': unixTimestampToJson(registeredTime),
      if (statusDescription != null) 'StatusDescription': statusDescription,
    };
  }
}

enum DesiredState {
  running('RUNNING'),
  stopped('STOPPED'),
  removed('REMOVED'),
  ;

  final String value;

  const DesiredState(this.value);

  static DesiredState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DesiredState'));
}

/// A device.
class Device {
  /// The device's maker.
  final DeviceBrand? brand;

  /// When the device was created.
  final DateTime? createdTime;

  /// A device's current software.
  final String? currentSoftware;

  /// A description for the device.
  final String? description;

  /// A device's aggregated status. Including the device's connection status,
  /// provisioning status, and lease status.
  final DeviceAggregatedStatus? deviceAggregatedStatus;

  /// The device's ID.
  final String? deviceId;

  /// When the device was updated.
  final DateTime? lastUpdatedTime;

  /// A device's latest job. Includes the target image version, and the update job
  /// status.
  final LatestDeviceJob? latestDeviceJob;

  /// The device's lease expiration time.
  final DateTime? leaseExpirationTime;

  /// The device's name.
  final String? name;

  /// The device's provisioning status.
  final DeviceStatus? provisioningStatus;

  /// The device's tags.
  final Map<String, String>? tags;

  /// The device's type.
  final DeviceType? type;

  Device({
    this.brand,
    this.createdTime,
    this.currentSoftware,
    this.description,
    this.deviceAggregatedStatus,
    this.deviceId,
    this.lastUpdatedTime,
    this.latestDeviceJob,
    this.leaseExpirationTime,
    this.name,
    this.provisioningStatus,
    this.tags,
    this.type,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      brand: (json['Brand'] as String?)?.let(DeviceBrand.fromString),
      createdTime: timeStampFromJson(json['CreatedTime']),
      currentSoftware: json['CurrentSoftware'] as String?,
      description: json['Description'] as String?,
      deviceAggregatedStatus: (json['DeviceAggregatedStatus'] as String?)
          ?.let(DeviceAggregatedStatus.fromString),
      deviceId: json['DeviceId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      latestDeviceJob: json['LatestDeviceJob'] != null
          ? LatestDeviceJob.fromJson(
              json['LatestDeviceJob'] as Map<String, dynamic>)
          : null,
      leaseExpirationTime: timeStampFromJson(json['LeaseExpirationTime']),
      name: json['Name'] as String?,
      provisioningStatus:
          (json['ProvisioningStatus'] as String?)?.let(DeviceStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.let(DeviceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final brand = this.brand;
    final createdTime = this.createdTime;
    final currentSoftware = this.currentSoftware;
    final description = this.description;
    final deviceAggregatedStatus = this.deviceAggregatedStatus;
    final deviceId = this.deviceId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final latestDeviceJob = this.latestDeviceJob;
    final leaseExpirationTime = this.leaseExpirationTime;
    final name = this.name;
    final provisioningStatus = this.provisioningStatus;
    final tags = this.tags;
    final type = this.type;
    return {
      if (brand != null) 'Brand': brand.value,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (currentSoftware != null) 'CurrentSoftware': currentSoftware,
      if (description != null) 'Description': description,
      if (deviceAggregatedStatus != null)
        'DeviceAggregatedStatus': deviceAggregatedStatus.value,
      if (deviceId != null) 'DeviceId': deviceId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (latestDeviceJob != null) 'LatestDeviceJob': latestDeviceJob,
      if (leaseExpirationTime != null)
        'LeaseExpirationTime': unixTimestampToJson(leaseExpirationTime),
      if (name != null) 'Name': name,
      if (provisioningStatus != null)
        'ProvisioningStatus': provisioningStatus.value,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.value,
    };
  }
}

enum DeviceAggregatedStatus {
  error('ERROR'),
  awaitingProvisioning('AWAITING_PROVISIONING'),
  pending('PENDING'),
  failed('FAILED'),
  deleting('DELETING'),
  online('ONLINE'),
  offline('OFFLINE'),
  leaseExpired('LEASE_EXPIRED'),
  updateNeeded('UPDATE_NEEDED'),
  rebooting('REBOOTING'),
  ;

  final String value;

  const DeviceAggregatedStatus(this.value);

  static DeviceAggregatedStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DeviceAggregatedStatus'));
}

enum DeviceBrand {
  awsPanorama('AWS_PANORAMA'),
  lenovo('LENOVO'),
  ;

  final String value;

  const DeviceBrand(this.value);

  static DeviceBrand fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DeviceBrand'));
}

enum DeviceConnectionStatus {
  online('ONLINE'),
  offline('OFFLINE'),
  awaitingCredentials('AWAITING_CREDENTIALS'),
  notAvailable('NOT_AVAILABLE'),
  error('ERROR'),
  ;

  final String value;

  const DeviceConnectionStatus(this.value);

  static DeviceConnectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DeviceConnectionStatus'));
}

/// A job that runs on a device.
class DeviceJob {
  /// When the job was created.
  final DateTime? createdTime;

  /// The ID of the target device.
  final String? deviceId;

  /// The name of the target device
  final String? deviceName;

  /// The job's ID.
  final String? jobId;

  /// The job's type.
  final JobType? jobType;

  DeviceJob({
    this.createdTime,
    this.deviceId,
    this.deviceName,
    this.jobId,
    this.jobType,
  });

  factory DeviceJob.fromJson(Map<String, dynamic> json) {
    return DeviceJob(
      createdTime: timeStampFromJson(json['CreatedTime']),
      deviceId: json['DeviceId'] as String?,
      deviceName: json['DeviceName'] as String?,
      jobId: json['JobId'] as String?,
      jobType: (json['JobType'] as String?)?.let(JobType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final deviceId = this.deviceId;
    final deviceName = this.deviceName;
    final jobId = this.jobId;
    final jobType = this.jobType;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (deviceId != null) 'DeviceId': deviceId,
      if (deviceName != null) 'DeviceName': deviceName,
      if (jobId != null) 'JobId': jobId,
      if (jobType != null) 'JobType': jobType.value,
    };
  }
}

/// A job's configuration.
class DeviceJobConfig {
  /// A configuration for an over-the-air (OTA) upgrade. Required for OTA jobs.
  final OTAJobConfig? oTAJobConfig;

  DeviceJobConfig({
    this.oTAJobConfig,
  });

  Map<String, dynamic> toJson() {
    final oTAJobConfig = this.oTAJobConfig;
    return {
      if (oTAJobConfig != null) 'OTAJobConfig': oTAJobConfig,
    };
  }
}

enum DeviceReportedStatus {
  stopping('STOPPING'),
  stopped('STOPPED'),
  stopError('STOP_ERROR'),
  removalFailed('REMOVAL_FAILED'),
  removalInProgress('REMOVAL_IN_PROGRESS'),
  starting('STARTING'),
  running('RUNNING'),
  installError('INSTALL_ERROR'),
  launched('LAUNCHED'),
  launchError('LAUNCH_ERROR'),
  installInProgress('INSTALL_IN_PROGRESS'),
  ;

  final String value;

  const DeviceReportedStatus(this.value);

  static DeviceReportedStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DeviceReportedStatus'));
}

enum DeviceStatus {
  awaitingProvisioning('AWAITING_PROVISIONING'),
  pending('PENDING'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  error('ERROR'),
  deleting('DELETING'),
  ;

  final String value;

  const DeviceStatus(this.value);

  static DeviceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeviceStatus'));
}

enum DeviceType {
  panoramaApplianceDeveloperKit('PANORAMA_APPLIANCE_DEVELOPER_KIT'),
  panoramaAppliance('PANORAMA_APPLIANCE'),
  ;

  final String value;

  const DeviceType(this.value);

  static DeviceType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DeviceType'));
}

/// A device's network configuration.
class EthernetPayload {
  /// How the device gets an IP address.
  final ConnectionType connectionType;

  /// Network configuration for a static IP connection.
  final StaticIpConnectionInfo? staticIpConnectionInfo;

  EthernetPayload({
    required this.connectionType,
    this.staticIpConnectionInfo,
  });

  factory EthernetPayload.fromJson(Map<String, dynamic> json) {
    return EthernetPayload(
      connectionType:
          ConnectionType.fromString((json['ConnectionType'] as String)),
      staticIpConnectionInfo: json['StaticIpConnectionInfo'] != null
          ? StaticIpConnectionInfo.fromJson(
              json['StaticIpConnectionInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionType = this.connectionType;
    final staticIpConnectionInfo = this.staticIpConnectionInfo;
    return {
      'ConnectionType': connectionType.value,
      if (staticIpConnectionInfo != null)
        'StaticIpConnectionInfo': staticIpConnectionInfo,
    };
  }
}

/// A device's Ethernet status.
class EthernetStatus {
  /// The device's connection status.
  final NetworkConnectionStatus? connectionStatus;

  /// The device's physical address.
  final String? hwAddress;

  /// The device's IP address.
  final String? ipAddress;

  EthernetStatus({
    this.connectionStatus,
    this.hwAddress,
    this.ipAddress,
  });

  factory EthernetStatus.fromJson(Map<String, dynamic> json) {
    return EthernetStatus(
      connectionStatus: (json['ConnectionStatus'] as String?)
          ?.let(NetworkConnectionStatus.fromString),
      hwAddress: json['HwAddress'] as String?,
      ipAddress: json['IpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final hwAddress = this.hwAddress;
    final ipAddress = this.ipAddress;
    return {
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus.value,
      if (hwAddress != null) 'HwAddress': hwAddress,
      if (ipAddress != null) 'IpAddress': ipAddress,
    };
  }
}

/// A job for a device.
class Job {
  /// The target device's ID.
  final String? deviceId;

  /// The job's ID.
  final String? jobId;

  Job({
    this.deviceId,
    this.jobId,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      deviceId: json['DeviceId'] as String?,
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final jobId = this.jobId;
    return {
      if (deviceId != null) 'DeviceId': deviceId,
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// Tags for a job.
class JobResourceTags {
  /// The job's type.
  final JobResourceType resourceType;

  /// The job's tags.
  final Map<String, String> tags;

  JobResourceTags({
    required this.resourceType,
    required this.tags,
  });

  factory JobResourceTags.fromJson(Map<String, dynamic> json) {
    return JobResourceTags(
      resourceType:
          JobResourceType.fromString((json['ResourceType'] as String)),
      tags: (json['Tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final tags = this.tags;
    return {
      'ResourceType': resourceType.value,
      'Tags': tags,
    };
  }
}

enum JobResourceType {
  package('PACKAGE'),
  ;

  final String value;

  const JobResourceType(this.value);

  static JobResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum JobResourceType'));
}

enum JobType {
  ota('OTA'),
  reboot('REBOOT'),
  ;

  final String value;

  const JobType(this.value);

  static JobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum JobType'));
}

/// Returns information about the latest device job.
class LatestDeviceJob {
  /// The target version of the device software.
  final String? imageVersion;

  /// The job's type.
  final JobType? jobType;

  /// Status of the latest device job.
  final UpdateProgress? status;

  LatestDeviceJob({
    this.imageVersion,
    this.jobType,
    this.status,
  });

  factory LatestDeviceJob.fromJson(Map<String, dynamic> json) {
    return LatestDeviceJob(
      imageVersion: json['ImageVersion'] as String?,
      jobType: (json['JobType'] as String?)?.let(JobType.fromString),
      status: (json['Status'] as String?)?.let(UpdateProgress.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final imageVersion = this.imageVersion;
    final jobType = this.jobType;
    final status = this.status;
    return {
      if (imageVersion != null) 'ImageVersion': imageVersion,
      if (jobType != null) 'JobType': jobType.value,
      if (status != null) 'Status': status.value,
    };
  }
}

class ListApplicationInstanceDependenciesResponse {
  /// A pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of package objects.
  final List<PackageObject>? packageObjects;

  ListApplicationInstanceDependenciesResponse({
    this.nextToken,
    this.packageObjects,
  });

  factory ListApplicationInstanceDependenciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationInstanceDependenciesResponse(
      nextToken: json['NextToken'] as String?,
      packageObjects: (json['PackageObjects'] as List?)
          ?.nonNulls
          .map((e) => PackageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packageObjects = this.packageObjects;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (packageObjects != null) 'PackageObjects': packageObjects,
    };
  }
}

class ListApplicationInstanceNodeInstancesResponse {
  /// A pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of node instances.
  final List<NodeInstance>? nodeInstances;

  ListApplicationInstanceNodeInstancesResponse({
    this.nextToken,
    this.nodeInstances,
  });

  factory ListApplicationInstanceNodeInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationInstanceNodeInstancesResponse(
      nextToken: json['NextToken'] as String?,
      nodeInstances: (json['NodeInstances'] as List?)
          ?.nonNulls
          .map((e) => NodeInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodeInstances = this.nodeInstances;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (nodeInstances != null) 'NodeInstances': nodeInstances,
    };
  }
}

class ListApplicationInstancesResponse {
  /// A list of application instances.
  final List<ApplicationInstance>? applicationInstances;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListApplicationInstancesResponse({
    this.applicationInstances,
    this.nextToken,
  });

  factory ListApplicationInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationInstancesResponse(
      applicationInstances: (json['ApplicationInstances'] as List?)
          ?.nonNulls
          .map((e) => ApplicationInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInstances = this.applicationInstances;
    final nextToken = this.nextToken;
    return {
      if (applicationInstances != null)
        'ApplicationInstances': applicationInstances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDevicesJobsResponse {
  /// A list of jobs.
  final List<DeviceJob>? deviceJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListDevicesJobsResponse({
    this.deviceJobs,
    this.nextToken,
  });

  factory ListDevicesJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicesJobsResponse(
      deviceJobs: (json['DeviceJobs'] as List?)
          ?.nonNulls
          .map((e) => DeviceJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceJobs = this.deviceJobs;
    final nextToken = this.nextToken;
    return {
      if (deviceJobs != null) 'DeviceJobs': deviceJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDevicesResponse {
  /// A list of devices.
  final List<Device> devices;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListDevicesResponse({
    required this.devices,
    this.nextToken,
  });

  factory ListDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicesResponse(
      devices: (json['Devices'] as List)
          .nonNulls
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      'Devices': devices,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum ListDevicesSortBy {
  deviceId('DEVICE_ID'),
  createdTime('CREATED_TIME'),
  name('NAME'),
  deviceAggregatedStatus('DEVICE_AGGREGATED_STATUS'),
  ;

  final String value;

  const ListDevicesSortBy(this.value);

  static ListDevicesSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ListDevicesSortBy'));
}

class ListNodeFromTemplateJobsResponse {
  /// A list of jobs.
  final List<NodeFromTemplateJob> nodeFromTemplateJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListNodeFromTemplateJobsResponse({
    required this.nodeFromTemplateJobs,
    this.nextToken,
  });

  factory ListNodeFromTemplateJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListNodeFromTemplateJobsResponse(
      nodeFromTemplateJobs: (json['NodeFromTemplateJobs'] as List)
          .nonNulls
          .map((e) => NodeFromTemplateJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeFromTemplateJobs = this.nodeFromTemplateJobs;
    final nextToken = this.nextToken;
    return {
      'NodeFromTemplateJobs': nodeFromTemplateJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListNodesResponse {
  /// A pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of nodes.
  final List<Node>? nodes;

  ListNodesResponse({
    this.nextToken,
    this.nodes,
  });

  factory ListNodesResponse.fromJson(Map<String, dynamic> json) {
    return ListNodesResponse(
      nextToken: json['NextToken'] as String?,
      nodes: (json['Nodes'] as List?)
          ?.nonNulls
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodes = this.nodes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (nodes != null) 'Nodes': nodes,
    };
  }
}

class ListPackageImportJobsResponse {
  /// A list of package import jobs.
  final List<PackageImportJob> packageImportJobs;

  /// A pagination token that's included if more results are available.
  final String? nextToken;

  ListPackageImportJobsResponse({
    required this.packageImportJobs,
    this.nextToken,
  });

  factory ListPackageImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListPackageImportJobsResponse(
      packageImportJobs: (json['PackageImportJobs'] as List)
          .nonNulls
          .map((e) => PackageImportJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final packageImportJobs = this.packageImportJobs;
    final nextToken = this.nextToken;
    return {
      'PackageImportJobs': packageImportJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPackagesResponse {
  /// A pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of packages.
  final List<PackageListItem>? packages;

  ListPackagesResponse({
    this.nextToken,
    this.packages,
  });

  factory ListPackagesResponse.fromJson(Map<String, dynamic> json) {
    return ListPackagesResponse(
      nextToken: json['NextToken'] as String?,
      packages: (json['Packages'] as List?)
          ?.nonNulls
          .map((e) => PackageListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final packages = this.packages;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (packages != null) 'Packages': packages,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags.
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

/// Parameter overrides for an application instance. This is a JSON document
/// that has a single key (<code>PayloadData</code>) where the value is an
/// escaped string representation of the overrides document.
class ManifestOverridesPayload {
  /// The overrides document.
  final String? payloadData;

  ManifestOverridesPayload({
    this.payloadData,
  });

  factory ManifestOverridesPayload.fromJson(Map<String, dynamic> json) {
    return ManifestOverridesPayload(
      payloadData: json['PayloadData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final payloadData = this.payloadData;
    return {
      if (payloadData != null) 'PayloadData': payloadData,
    };
  }
}

/// A application verion's manifest file. This is a JSON document that has a
/// single key (<code>PayloadData</code>) where the value is an escaped string
/// representation of the application manifest (<code>graph.json</code>). This
/// file is located in the <code>graphs</code> folder in your application
/// source.
class ManifestPayload {
  /// The application manifest.
  final String? payloadData;

  ManifestPayload({
    this.payloadData,
  });

  factory ManifestPayload.fromJson(Map<String, dynamic> json) {
    return ManifestPayload(
      payloadData: json['PayloadData'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final payloadData = this.payloadData;
    return {
      if (payloadData != null) 'PayloadData': payloadData,
    };
  }
}

enum NetworkConnectionStatus {
  connected('CONNECTED'),
  notConnected('NOT_CONNECTED'),
  connecting('CONNECTING'),
  ;

  final String value;

  const NetworkConnectionStatus(this.value);

  static NetworkConnectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum NetworkConnectionStatus'));
}

/// The network configuration for a device.
class NetworkPayload {
  /// Settings for Ethernet port 0.
  final EthernetPayload? ethernet0;

  /// Settings for Ethernet port 1.
  final EthernetPayload? ethernet1;

  /// Network time protocol (NTP) server settings.
  final NtpPayload? ntp;

  NetworkPayload({
    this.ethernet0,
    this.ethernet1,
    this.ntp,
  });

  factory NetworkPayload.fromJson(Map<String, dynamic> json) {
    return NetworkPayload(
      ethernet0: json['Ethernet0'] != null
          ? EthernetPayload.fromJson(json['Ethernet0'] as Map<String, dynamic>)
          : null,
      ethernet1: json['Ethernet1'] != null
          ? EthernetPayload.fromJson(json['Ethernet1'] as Map<String, dynamic>)
          : null,
      ntp: json['Ntp'] != null
          ? NtpPayload.fromJson(json['Ntp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ethernet0 = this.ethernet0;
    final ethernet1 = this.ethernet1;
    final ntp = this.ntp;
    return {
      if (ethernet0 != null) 'Ethernet0': ethernet0,
      if (ethernet1 != null) 'Ethernet1': ethernet1,
      if (ntp != null) 'Ntp': ntp,
    };
  }
}

/// The network status of a device.
class NetworkStatus {
  /// The status of Ethernet port 0.
  final EthernetStatus? ethernet0Status;

  /// The status of Ethernet port 1.
  final EthernetStatus? ethernet1Status;

  /// When the network status changed.
  final DateTime? lastUpdatedTime;

  /// Details about a network time protocol (NTP) server connection.
  final NtpStatus? ntpStatus;

  NetworkStatus({
    this.ethernet0Status,
    this.ethernet1Status,
    this.lastUpdatedTime,
    this.ntpStatus,
  });

  factory NetworkStatus.fromJson(Map<String, dynamic> json) {
    return NetworkStatus(
      ethernet0Status: json['Ethernet0Status'] != null
          ? EthernetStatus.fromJson(
              json['Ethernet0Status'] as Map<String, dynamic>)
          : null,
      ethernet1Status: json['Ethernet1Status'] != null
          ? EthernetStatus.fromJson(
              json['Ethernet1Status'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      ntpStatus: json['NtpStatus'] != null
          ? NtpStatus.fromJson(json['NtpStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ethernet0Status = this.ethernet0Status;
    final ethernet1Status = this.ethernet1Status;
    final lastUpdatedTime = this.lastUpdatedTime;
    final ntpStatus = this.ntpStatus;
    return {
      if (ethernet0Status != null) 'Ethernet0Status': ethernet0Status,
      if (ethernet1Status != null) 'Ethernet1Status': ethernet1Status,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (ntpStatus != null) 'NtpStatus': ntpStatus,
    };
  }
}

/// An application node that represents a camera stream, a model, code, or
/// output.
class Node {
  /// The node's category.
  final NodeCategory category;

  /// When the node was created.
  final DateTime createdTime;

  /// The node's name.
  final String name;

  /// The node's ID.
  final String nodeId;

  /// The node's package ID.
  final String packageId;

  /// The node's package name.
  final String packageName;

  /// The node's package version.
  final String packageVersion;

  /// The node's patch version.
  final String patchVersion;

  /// The node's description.
  final String? description;

  /// The account ID of the node's owner.
  final String? ownerAccount;

  /// The node's ARN.
  final String? packageArn;

  Node({
    required this.category,
    required this.createdTime,
    required this.name,
    required this.nodeId,
    required this.packageId,
    required this.packageName,
    required this.packageVersion,
    required this.patchVersion,
    this.description,
    this.ownerAccount,
    this.packageArn,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      category: NodeCategory.fromString((json['Category'] as String)),
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      name: json['Name'] as String,
      nodeId: json['NodeId'] as String,
      packageId: json['PackageId'] as String,
      packageName: json['PackageName'] as String,
      packageVersion: json['PackageVersion'] as String,
      patchVersion: json['PatchVersion'] as String,
      description: json['Description'] as String?,
      ownerAccount: json['OwnerAccount'] as String?,
      packageArn: json['PackageArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final createdTime = this.createdTime;
    final name = this.name;
    final nodeId = this.nodeId;
    final packageId = this.packageId;
    final packageName = this.packageName;
    final packageVersion = this.packageVersion;
    final patchVersion = this.patchVersion;
    final description = this.description;
    final ownerAccount = this.ownerAccount;
    final packageArn = this.packageArn;
    return {
      'Category': category.value,
      'CreatedTime': unixTimestampToJson(createdTime),
      'Name': name,
      'NodeId': nodeId,
      'PackageId': packageId,
      'PackageName': packageName,
      'PackageVersion': packageVersion,
      'PatchVersion': patchVersion,
      if (description != null) 'Description': description,
      if (ownerAccount != null) 'OwnerAccount': ownerAccount,
      if (packageArn != null) 'PackageArn': packageArn,
    };
  }
}

enum NodeCategory {
  businessLogic('BUSINESS_LOGIC'),
  mlModel('ML_MODEL'),
  mediaSource('MEDIA_SOURCE'),
  mediaSink('MEDIA_SINK'),
  ;

  final String value;

  const NodeCategory(this.value);

  static NodeCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum NodeCategory'));
}

/// A job to create a camera stream node.
class NodeFromTemplateJob {
  /// When the job was created.
  final DateTime? createdTime;

  /// The job's ID.
  final String? jobId;

  /// The node's name.
  final String? nodeName;

  /// The job's status.
  final NodeFromTemplateJobStatus? status;

  /// The job's status message.
  final String? statusMessage;

  /// The job's template type.
  final TemplateType? templateType;

  NodeFromTemplateJob({
    this.createdTime,
    this.jobId,
    this.nodeName,
    this.status,
    this.statusMessage,
    this.templateType,
  });

  factory NodeFromTemplateJob.fromJson(Map<String, dynamic> json) {
    return NodeFromTemplateJob(
      createdTime: timeStampFromJson(json['CreatedTime']),
      jobId: json['JobId'] as String?,
      nodeName: json['NodeName'] as String?,
      status: (json['Status'] as String?)
          ?.let(NodeFromTemplateJobStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      templateType:
          (json['TemplateType'] as String?)?.let(TemplateType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final jobId = this.jobId;
    final nodeName = this.nodeName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final templateType = this.templateType;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (jobId != null) 'JobId': jobId,
      if (nodeName != null) 'NodeName': nodeName,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (templateType != null) 'TemplateType': templateType.value,
    };
  }
}

enum NodeFromTemplateJobStatus {
  pending('PENDING'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  ;

  final String value;

  const NodeFromTemplateJobStatus(this.value);

  static NodeFromTemplateJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum NodeFromTemplateJobStatus'));
}

/// A node input port.
class NodeInputPort {
  /// The input port's default value.
  final String? defaultValue;

  /// The input port's description.
  final String? description;

  /// The input port's max connections.
  final int? maxConnections;

  /// The input port's name.
  final String? name;

  /// The input port's type.
  final PortType? type;

  NodeInputPort({
    this.defaultValue,
    this.description,
    this.maxConnections,
    this.name,
    this.type,
  });

  factory NodeInputPort.fromJson(Map<String, dynamic> json) {
    return NodeInputPort(
      defaultValue: json['DefaultValue'] as String?,
      description: json['Description'] as String?,
      maxConnections: json['MaxConnections'] as int?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.let(PortType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final description = this.description;
    final maxConnections = this.maxConnections;
    final name = this.name;
    final type = this.type;
    return {
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (maxConnections != null) 'MaxConnections': maxConnections,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.value,
    };
  }
}

/// A node instance.
class NodeInstance {
  /// The instance's current status.
  final NodeInstanceStatus currentStatus;

  /// The instance's ID.
  final String nodeInstanceId;

  /// The node's ID.
  final String? nodeId;

  /// The instance's name.
  final String? nodeName;

  /// The instance's package name.
  final String? packageName;

  /// The instance's package patch version.
  final String? packagePatchVersion;

  /// The instance's package version.
  final String? packageVersion;

  NodeInstance({
    required this.currentStatus,
    required this.nodeInstanceId,
    this.nodeId,
    this.nodeName,
    this.packageName,
    this.packagePatchVersion,
    this.packageVersion,
  });

  factory NodeInstance.fromJson(Map<String, dynamic> json) {
    return NodeInstance(
      currentStatus:
          NodeInstanceStatus.fromString((json['CurrentStatus'] as String)),
      nodeInstanceId: json['NodeInstanceId'] as String,
      nodeId: json['NodeId'] as String?,
      nodeName: json['NodeName'] as String?,
      packageName: json['PackageName'] as String?,
      packagePatchVersion: json['PackagePatchVersion'] as String?,
      packageVersion: json['PackageVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentStatus = this.currentStatus;
    final nodeInstanceId = this.nodeInstanceId;
    final nodeId = this.nodeId;
    final nodeName = this.nodeName;
    final packageName = this.packageName;
    final packagePatchVersion = this.packagePatchVersion;
    final packageVersion = this.packageVersion;
    return {
      'CurrentStatus': currentStatus.value,
      'NodeInstanceId': nodeInstanceId,
      if (nodeId != null) 'NodeId': nodeId,
      if (nodeName != null) 'NodeName': nodeName,
      if (packageName != null) 'PackageName': packageName,
      if (packagePatchVersion != null)
        'PackagePatchVersion': packagePatchVersion,
      if (packageVersion != null) 'PackageVersion': packageVersion,
    };
  }
}

enum NodeInstanceStatus {
  running('RUNNING'),
  error('ERROR'),
  notAvailable('NOT_AVAILABLE'),
  paused('PAUSED'),
  ;

  final String value;

  const NodeInstanceStatus(this.value);

  static NodeInstanceStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum NodeInstanceStatus'));
}

/// A node interface.
class NodeInterface {
  /// The node interface's inputs.
  final List<NodeInputPort> inputs;

  /// The node interface's outputs.
  final List<NodeOutputPort> outputs;

  NodeInterface({
    required this.inputs,
    required this.outputs,
  });

  factory NodeInterface.fromJson(Map<String, dynamic> json) {
    return NodeInterface(
      inputs: (json['Inputs'] as List)
          .nonNulls
          .map((e) => NodeInputPort.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputs: (json['Outputs'] as List)
          .nonNulls
          .map((e) => NodeOutputPort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputs = this.inputs;
    final outputs = this.outputs;
    return {
      'Inputs': inputs,
      'Outputs': outputs,
    };
  }
}

/// A node output port.
class NodeOutputPort {
  /// The output port's description.
  final String? description;

  /// The output port's name.
  final String? name;

  /// The output port's type.
  final PortType? type;

  NodeOutputPort({
    this.description,
    this.name,
    this.type,
  });

  factory NodeOutputPort.fromJson(Map<String, dynamic> json) {
    return NodeOutputPort(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.let(PortType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.value,
    };
  }
}

/// A signal to a camera node to start or stop processing video.
class NodeSignal {
  /// The camera node's name, from the application manifest.
  final String nodeInstanceId;

  /// The signal value.
  final NodeSignalValue signal;

  NodeSignal({
    required this.nodeInstanceId,
    required this.signal,
  });

  Map<String, dynamic> toJson() {
    final nodeInstanceId = this.nodeInstanceId;
    final signal = this.signal;
    return {
      'NodeInstanceId': nodeInstanceId,
      'Signal': signal.value,
    };
  }
}

enum NodeSignalValue {
  pause('PAUSE'),
  resume('RESUME'),
  ;

  final String value;

  const NodeSignalValue(this.value);

  static NodeSignalValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum NodeSignalValue'));
}

/// Network time protocol (NTP) server settings. Use this option to connect to
/// local NTP servers instead of <code>pool.ntp.org</code>.
class NtpPayload {
  /// NTP servers to use, in order of preference.
  final List<String> ntpServers;

  NtpPayload({
    required this.ntpServers,
  });

  factory NtpPayload.fromJson(Map<String, dynamic> json) {
    return NtpPayload(
      ntpServers: (json['NtpServers'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ntpServers = this.ntpServers;
    return {
      'NtpServers': ntpServers,
    };
  }
}

/// Details about an NTP server connection.
class NtpStatus {
  /// The connection's status.
  final NetworkConnectionStatus? connectionStatus;

  /// The IP address of the server.
  final String? ipAddress;

  /// The domain name of the server.
  final String? ntpServerName;

  NtpStatus({
    this.connectionStatus,
    this.ipAddress,
    this.ntpServerName,
  });

  factory NtpStatus.fromJson(Map<String, dynamic> json) {
    return NtpStatus(
      connectionStatus: (json['ConnectionStatus'] as String?)
          ?.let(NetworkConnectionStatus.fromString),
      ipAddress: json['IpAddress'] as String?,
      ntpServerName: json['NtpServerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionStatus = this.connectionStatus;
    final ipAddress = this.ipAddress;
    final ntpServerName = this.ntpServerName;
    return {
      if (connectionStatus != null) 'ConnectionStatus': connectionStatus.value,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (ntpServerName != null) 'NtpServerName': ntpServerName,
    };
  }
}

/// An over-the-air update (OTA) job configuration.
class OTAJobConfig {
  /// The target version of the device software.
  final String imageVersion;

  /// Whether to apply the update if it is a major version change.
  final bool? allowMajorVersionUpdate;

  OTAJobConfig({
    required this.imageVersion,
    this.allowMajorVersionUpdate,
  });

  Map<String, dynamic> toJson() {
    final imageVersion = this.imageVersion;
    final allowMajorVersionUpdate = this.allowMajorVersionUpdate;
    return {
      'ImageVersion': imageVersion,
      if (allowMajorVersionUpdate != null)
        'AllowMajorVersionUpdate': allowMajorVersionUpdate,
    };
  }
}

/// The location of an output object in Amazon S3.
class OutPutS3Location {
  /// The object's bucket.
  final String bucketName;

  /// The object's key.
  final String objectKey;

  OutPutS3Location({
    required this.bucketName,
    required this.objectKey,
  });

  factory OutPutS3Location.fromJson(Map<String, dynamic> json) {
    return OutPutS3Location(
      bucketName: json['BucketName'] as String,
      objectKey: json['ObjectKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKey = this.objectKey;
    return {
      'BucketName': bucketName,
      'ObjectKey': objectKey,
    };
  }
}

/// A job to import a package version.
class PackageImportJob {
  /// When the job was created.
  final DateTime? createdTime;

  /// The job's ID.
  final String? jobId;

  /// The job's type.
  final PackageImportJobType? jobType;

  /// When the job was updated.
  final DateTime? lastUpdatedTime;

  /// The job's status.
  final PackageImportJobStatus? status;

  /// The job's status message.
  final String? statusMessage;

  PackageImportJob({
    this.createdTime,
    this.jobId,
    this.jobType,
    this.lastUpdatedTime,
    this.status,
    this.statusMessage,
  });

  factory PackageImportJob.fromJson(Map<String, dynamic> json) {
    return PackageImportJob(
      createdTime: timeStampFromJson(json['CreatedTime']),
      jobId: json['JobId'] as String?,
      jobType:
          (json['JobType'] as String?)?.let(PackageImportJobType.fromString),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      status:
          (json['Status'] as String?)?.let(PackageImportJobStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final jobId = this.jobId;
    final jobType = this.jobType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (jobId != null) 'JobId': jobId,
      if (jobType != null) 'JobType': jobType.value,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// A configuration for a package import job.
class PackageImportJobInputConfig {
  /// The package version's input configuration.
  final PackageVersionInputConfig? packageVersionInputConfig;

  PackageImportJobInputConfig({
    this.packageVersionInputConfig,
  });

  factory PackageImportJobInputConfig.fromJson(Map<String, dynamic> json) {
    return PackageImportJobInputConfig(
      packageVersionInputConfig: json['PackageVersionInputConfig'] != null
          ? PackageVersionInputConfig.fromJson(
              json['PackageVersionInputConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageVersionInputConfig = this.packageVersionInputConfig;
    return {
      if (packageVersionInputConfig != null)
        'PackageVersionInputConfig': packageVersionInputConfig,
    };
  }
}

/// Results of a package import job.
class PackageImportJobOutput {
  /// The package's output location.
  final OutPutS3Location outputS3Location;

  /// The package's ID.
  final String packageId;

  /// The package's version.
  final String packageVersion;

  /// The package's patch version.
  final String patchVersion;

  PackageImportJobOutput({
    required this.outputS3Location,
    required this.packageId,
    required this.packageVersion,
    required this.patchVersion,
  });

  factory PackageImportJobOutput.fromJson(Map<String, dynamic> json) {
    return PackageImportJobOutput(
      outputS3Location: OutPutS3Location.fromJson(
          json['OutputS3Location'] as Map<String, dynamic>),
      packageId: json['PackageId'] as String,
      packageVersion: json['PackageVersion'] as String,
      patchVersion: json['PatchVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final outputS3Location = this.outputS3Location;
    final packageId = this.packageId;
    final packageVersion = this.packageVersion;
    final patchVersion = this.patchVersion;
    return {
      'OutputS3Location': outputS3Location,
      'PackageId': packageId,
      'PackageVersion': packageVersion,
      'PatchVersion': patchVersion,
    };
  }
}

/// An output configuration for a package import job.
class PackageImportJobOutputConfig {
  /// The package version's output configuration.
  final PackageVersionOutputConfig? packageVersionOutputConfig;

  PackageImportJobOutputConfig({
    this.packageVersionOutputConfig,
  });

  factory PackageImportJobOutputConfig.fromJson(Map<String, dynamic> json) {
    return PackageImportJobOutputConfig(
      packageVersionOutputConfig: json['PackageVersionOutputConfig'] != null
          ? PackageVersionOutputConfig.fromJson(
              json['PackageVersionOutputConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageVersionOutputConfig = this.packageVersionOutputConfig;
    return {
      if (packageVersionOutputConfig != null)
        'PackageVersionOutputConfig': packageVersionOutputConfig,
    };
  }
}

enum PackageImportJobStatus {
  pending('PENDING'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  ;

  final String value;

  const PackageImportJobStatus(this.value);

  static PackageImportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PackageImportJobStatus'));
}

enum PackageImportJobType {
  nodePackageVersion('NODE_PACKAGE_VERSION'),
  marketplaceNodePackageVersion('MARKETPLACE_NODE_PACKAGE_VERSION'),
  ;

  final String value;

  const PackageImportJobType(this.value);

  static PackageImportJobType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PackageImportJobType'));
}

/// A package summary.
class PackageListItem {
  /// The package's ARN.
  final String? arn;

  /// When the package was created.
  final DateTime? createdTime;

  /// The package's ID.
  final String? packageId;

  /// The package's name.
  final String? packageName;

  /// The package's tags.
  final Map<String, String>? tags;

  PackageListItem({
    this.arn,
    this.createdTime,
    this.packageId,
    this.packageName,
    this.tags,
  });

  factory PackageListItem.fromJson(Map<String, dynamic> json) {
    return PackageListItem(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      packageId: json['PackageId'] as String?,
      packageName: json['PackageName'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final packageId = this.packageId;
    final packageName = this.packageName;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (packageId != null) 'PackageId': packageId,
      if (packageName != null) 'PackageName': packageName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A package object.
class PackageObject {
  /// The object's name.
  final String name;

  /// The object's package version.
  final String packageVersion;

  /// The object's patch version.
  final String patchVersion;

  PackageObject({
    required this.name,
    required this.packageVersion,
    required this.patchVersion,
  });

  factory PackageObject.fromJson(Map<String, dynamic> json) {
    return PackageObject(
      name: json['Name'] as String,
      packageVersion: json['PackageVersion'] as String,
      patchVersion: json['PatchVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final packageVersion = this.packageVersion;
    final patchVersion = this.patchVersion;
    return {
      'Name': name,
      'PackageVersion': packageVersion,
      'PatchVersion': patchVersion,
    };
  }
}

/// A package version input configuration.
class PackageVersionInputConfig {
  /// A location in Amazon S3.
  final S3Location s3Location;

  PackageVersionInputConfig({
    required this.s3Location,
  });

  factory PackageVersionInputConfig.fromJson(Map<String, dynamic> json) {
    return PackageVersionInputConfig(
      s3Location:
          S3Location.fromJson(json['S3Location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      'S3Location': s3Location,
    };
  }
}

/// A package version output configuration.
class PackageVersionOutputConfig {
  /// The output's package name.
  final String packageName;

  /// The output's package version.
  final String packageVersion;

  /// Indicates that the version is recommended for all users.
  final bool? markLatest;

  PackageVersionOutputConfig({
    required this.packageName,
    required this.packageVersion,
    this.markLatest,
  });

  factory PackageVersionOutputConfig.fromJson(Map<String, dynamic> json) {
    return PackageVersionOutputConfig(
      packageName: json['PackageName'] as String,
      packageVersion: json['PackageVersion'] as String,
      markLatest: json['MarkLatest'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final packageName = this.packageName;
    final packageVersion = this.packageVersion;
    final markLatest = this.markLatest;
    return {
      'PackageName': packageName,
      'PackageVersion': packageVersion,
      if (markLatest != null) 'MarkLatest': markLatest,
    };
  }
}

enum PackageVersionStatus {
  registerPending('REGISTER_PENDING'),
  registerCompleted('REGISTER_COMPLETED'),
  failed('FAILED'),
  deleting('DELETING'),
  ;

  final String value;

  const PackageVersionStatus(this.value);

  static PackageVersionStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PackageVersionStatus'));
}

enum PortType {
  boolean('BOOLEAN'),
  string('STRING'),
  int32('INT32'),
  float32('FLOAT32'),
  media('MEDIA'),
  ;

  final String value;

  const PortType(this.value);

  static PortType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PortType'));
}

class ProvisionDeviceResponse {
  /// The device's ARN.
  final String arn;

  /// The device's status.
  final DeviceStatus status;

  /// The device's configuration bundle.
  final Uint8List? certificates;

  /// The device's ID.
  final String? deviceId;

  /// The device's IoT thing name.
  final String? iotThingName;

  ProvisionDeviceResponse({
    required this.arn,
    required this.status,
    this.certificates,
    this.deviceId,
    this.iotThingName,
  });

  factory ProvisionDeviceResponse.fromJson(Map<String, dynamic> json) {
    return ProvisionDeviceResponse(
      arn: json['Arn'] as String,
      status: DeviceStatus.fromString((json['Status'] as String)),
      certificates: _s.decodeNullableUint8List(json['Certificates'] as String?),
      deviceId: json['DeviceId'] as String?,
      iotThingName: json['IotThingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    final certificates = this.certificates;
    final deviceId = this.deviceId;
    final iotThingName = this.iotThingName;
    return {
      'Arn': arn,
      'Status': status.value,
      if (certificates != null) 'Certificates': base64Encode(certificates),
      if (deviceId != null) 'DeviceId': deviceId,
      if (iotThingName != null) 'IotThingName': iotThingName,
    };
  }
}

class RegisterPackageVersionResponse {
  RegisterPackageVersionResponse();

  factory RegisterPackageVersionResponse.fromJson(Map<String, dynamic> _) {
    return RegisterPackageVersionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveApplicationInstanceResponse {
  RemoveApplicationInstanceResponse();

  factory RemoveApplicationInstanceResponse.fromJson(Map<String, dynamic> _) {
    return RemoveApplicationInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An application instance's state.
class ReportedRuntimeContextState {
  /// The application's desired state.
  final DesiredState desiredState;

  /// The application's reported status.
  final DeviceReportedStatus deviceReportedStatus;

  /// When the device reported the application's state.
  final DateTime deviceReportedTime;

  /// The device's name.
  final String runtimeContextName;

  ReportedRuntimeContextState({
    required this.desiredState,
    required this.deviceReportedStatus,
    required this.deviceReportedTime,
    required this.runtimeContextName,
  });

  factory ReportedRuntimeContextState.fromJson(Map<String, dynamic> json) {
    return ReportedRuntimeContextState(
      desiredState: DesiredState.fromString((json['DesiredState'] as String)),
      deviceReportedStatus: DeviceReportedStatus.fromString(
          (json['DeviceReportedStatus'] as String)),
      deviceReportedTime:
          nonNullableTimeStampFromJson(json['DeviceReportedTime'] as Object),
      runtimeContextName: json['RuntimeContextName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredState = this.desiredState;
    final deviceReportedStatus = this.deviceReportedStatus;
    final deviceReportedTime = this.deviceReportedTime;
    final runtimeContextName = this.runtimeContextName;
    return {
      'DesiredState': desiredState.value,
      'DeviceReportedStatus': deviceReportedStatus.value,
      'DeviceReportedTime': unixTimestampToJson(deviceReportedTime),
      'RuntimeContextName': runtimeContextName,
    };
  }
}

/// A location in Amazon S3.
class S3Location {
  /// A bucket name.
  final String bucketName;

  /// An object key.
  final String objectKey;

  /// The bucket's Region.
  final String? region;

  S3Location({
    required this.bucketName,
    required this.objectKey,
    this.region,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucketName: json['BucketName'] as String,
      objectKey: json['ObjectKey'] as String,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKey = this.objectKey;
    final region = this.region;
    return {
      'BucketName': bucketName,
      'ObjectKey': objectKey,
      if (region != null) 'Region': region,
    };
  }
}

class SignalApplicationInstanceNodeInstancesResponse {
  /// An application instance ID.
  final String applicationInstanceId;

  SignalApplicationInstanceNodeInstancesResponse({
    required this.applicationInstanceId,
  });

  factory SignalApplicationInstanceNodeInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return SignalApplicationInstanceNodeInstancesResponse(
      applicationInstanceId: json['ApplicationInstanceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationInstanceId = this.applicationInstanceId;
    return {
      'ApplicationInstanceId': applicationInstanceId,
    };
  }
}

enum SortOrder {
  ascending('ASCENDING'),
  descending('DESCENDING'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
}

/// A static IP configuration.
class StaticIpConnectionInfo {
  /// The connection's default gateway.
  final String defaultGateway;

  /// The connection's DNS address.
  final List<String> dns;

  /// The connection's IP address.
  final String ipAddress;

  /// The connection's DNS mask.
  final String mask;

  StaticIpConnectionInfo({
    required this.defaultGateway,
    required this.dns,
    required this.ipAddress,
    required this.mask,
  });

  factory StaticIpConnectionInfo.fromJson(Map<String, dynamic> json) {
    return StaticIpConnectionInfo(
      defaultGateway: json['DefaultGateway'] as String,
      dns: (json['Dns'] as List).nonNulls.map((e) => e as String).toList(),
      ipAddress: json['IpAddress'] as String,
      mask: json['Mask'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultGateway = this.defaultGateway;
    final dns = this.dns;
    final ipAddress = this.ipAddress;
    final mask = this.mask;
    return {
      'DefaultGateway': defaultGateway,
      'Dns': dns,
      'IpAddress': ipAddress,
      'Mask': mask,
    };
  }
}

enum StatusFilter {
  deploymentSucceeded('DEPLOYMENT_SUCCEEDED'),
  deploymentError('DEPLOYMENT_ERROR'),
  removalSucceeded('REMOVAL_SUCCEEDED'),
  removalFailed('REMOVAL_FAILED'),
  processingDeployment('PROCESSING_DEPLOYMENT'),
  processingRemoval('PROCESSING_REMOVAL'),
  deploymentFailed('DEPLOYMENT_FAILED'),
  ;

  final String value;

  const StatusFilter(this.value);

  static StatusFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum StatusFilter'));
}

/// A storage location.
class StorageLocation {
  /// The location's binary prefix.
  final String binaryPrefixLocation;

  /// The location's bucket.
  final String bucket;

  /// The location's generated prefix.
  final String generatedPrefixLocation;

  /// The location's manifest prefix.
  final String manifestPrefixLocation;

  /// The location's repo prefix.
  final String repoPrefixLocation;

  StorageLocation({
    required this.binaryPrefixLocation,
    required this.bucket,
    required this.generatedPrefixLocation,
    required this.manifestPrefixLocation,
    required this.repoPrefixLocation,
  });

  factory StorageLocation.fromJson(Map<String, dynamic> json) {
    return StorageLocation(
      binaryPrefixLocation: json['BinaryPrefixLocation'] as String,
      bucket: json['Bucket'] as String,
      generatedPrefixLocation: json['GeneratedPrefixLocation'] as String,
      manifestPrefixLocation: json['ManifestPrefixLocation'] as String,
      repoPrefixLocation: json['RepoPrefixLocation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final binaryPrefixLocation = this.binaryPrefixLocation;
    final bucket = this.bucket;
    final generatedPrefixLocation = this.generatedPrefixLocation;
    final manifestPrefixLocation = this.manifestPrefixLocation;
    final repoPrefixLocation = this.repoPrefixLocation;
    return {
      'BinaryPrefixLocation': binaryPrefixLocation,
      'Bucket': bucket,
      'GeneratedPrefixLocation': generatedPrefixLocation,
      'ManifestPrefixLocation': manifestPrefixLocation,
      'RepoPrefixLocation': repoPrefixLocation,
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

enum TemplateType {
  rtspCameraStream('RTSP_CAMERA_STREAM'),
  ;

  final String value;

  const TemplateType(this.value);

  static TemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TemplateType'));
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

class UpdateDeviceMetadataResponse {
  /// The device's ID.
  final String? deviceId;

  UpdateDeviceMetadataResponse({
    this.deviceId,
  });

  factory UpdateDeviceMetadataResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceMetadataResponse(
      deviceId: json['DeviceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    return {
      if (deviceId != null) 'DeviceId': deviceId,
    };
  }
}

enum UpdateProgress {
  pending('PENDING'),
  inProgress('IN_PROGRESS'),
  verifying('VERIFYING'),
  rebooting('REBOOTING'),
  downloading('DOWNLOADING'),
  completed('COMPLETED'),
  failed('FAILED'),
  ;

  final String value;

  const UpdateProgress(this.value);

  static UpdateProgress fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum UpdateProgress'));
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
