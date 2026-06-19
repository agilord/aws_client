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

/// Amazon WorkSpaces Instances provides an API framework for managing virtual
/// workspace environments across multiple AWS regions, enabling programmatic
/// creation and configuration of desktop infrastructure.
class WorkspacesInstances {
  final _s.JsonProtocol _protocol;
  WorkspacesInstances({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workspaces-instances',
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

  /// Attaches a volume to a WorkSpace Instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [device] :
  /// Device path for volume attachment.
  ///
  /// Parameter [volumeId] :
  /// Volume to be attached.
  ///
  /// Parameter [workspaceInstanceId] :
  /// WorkSpace Instance to attach volume to.
  Future<void> associateVolume({
    required String device,
    required String volumeId,
    required String workspaceInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.AssociateVolume'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Device': device,
        'VolumeId': volumeId,
        'WorkspaceInstanceId': workspaceInstanceId,
      },
    );
  }

  /// Creates a new volume for WorkSpace Instances.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [availabilityZone] :
  /// Availability zone for the volume.
  ///
  /// Parameter [clientToken] :
  /// Unique token to prevent duplicate volume creation.
  ///
  /// Parameter [encrypted] :
  /// Indicates if the volume should be encrypted.
  ///
  /// Parameter [iops] :
  /// Input/output operations per second for the volume.
  ///
  /// Parameter [kmsKeyId] :
  /// KMS key for volume encryption.
  ///
  /// Parameter [sizeInGB] :
  /// Volume size in gigabytes.
  ///
  /// Parameter [snapshotId] :
  /// Source snapshot for volume creation.
  ///
  /// Parameter [tagSpecifications] :
  /// Metadata tags for the volume.
  ///
  /// Parameter [throughput] :
  /// Volume throughput performance.
  ///
  /// Parameter [volumeType] :
  /// Type of EBS volume.
  Future<CreateVolumeResponse> createVolume({
    required String availabilityZone,
    String? clientToken,
    bool? encrypted,
    int? iops,
    String? kmsKeyId,
    int? sizeInGB,
    String? snapshotId,
    List<TagSpecification>? tagSpecifications,
    int? throughput,
    VolumeTypeEnum? volumeType,
  }) async {
    _s.validateNumRange(
      'iops',
      iops,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'sizeInGB',
      sizeInGB,
      0,
      1152921504606846976,
    );
    _s.validateNumRange(
      'throughput',
      throughput,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.CreateVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AvailabilityZone': availabilityZone,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (encrypted != null) 'Encrypted': encrypted,
        if (iops != null) 'Iops': iops,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (sizeInGB != null) 'SizeInGB': sizeInGB,
        if (snapshotId != null) 'SnapshotId': snapshotId,
        if (tagSpecifications != null) 'TagSpecifications': tagSpecifications,
        if (throughput != null) 'Throughput': throughput,
        if (volumeType != null) 'VolumeType': volumeType.value,
      },
    );

    return CreateVolumeResponse.fromJson(jsonResponse.body);
  }

  /// Launches a new WorkSpace Instance with specified configuration parameters,
  /// enabling programmatic workspace deployment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [managedInstance] :
  /// Comprehensive configuration settings for the WorkSpaces Instance,
  /// including network, compute, and storage parameters.
  ///
  /// Parameter [billingConfiguration] :
  /// Optional billing configuration for the WorkSpace Instance. Allows
  /// customers to specify their preferred billing mode when creating a new
  /// instance. Defaults to hourly billing if not specified.
  ///
  /// Parameter [clientToken] :
  /// Unique token to ensure idempotent instance creation, preventing duplicate
  /// workspace launches.
  ///
  /// Parameter [tags] :
  /// Optional metadata tags for categorizing and managing WorkSpaces Instances.
  Future<CreateWorkspaceInstanceResponse> createWorkspaceInstance({
    required ManagedInstanceRequest managedInstance,
    BillingConfiguration? billingConfiguration,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.CreateWorkspaceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ManagedInstance': managedInstance,
        if (billingConfiguration != null)
          'BillingConfiguration': billingConfiguration,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateWorkspaceInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified volume.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [volumeId] :
  /// Identifier of the volume to delete.
  Future<void> deleteVolume({
    required String volumeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.DeleteVolume'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
      },
    );
  }

  /// Deletes the specified WorkSpace
  /// <important>
  /// Usage of this API will result in deletion of the resource in question.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceInstanceId] :
  /// Unique identifier of the WorkSpaces Instance targeted for deletion.
  Future<void> deleteWorkspaceInstance({
    required String workspaceInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.DeleteWorkspaceInstance'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceInstanceId': workspaceInstanceId,
      },
    );
  }

  /// Detaches a volume from a WorkSpace Instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [volumeId] :
  /// Volume to be detached.
  ///
  /// Parameter [workspaceInstanceId] :
  /// WorkSpace Instance to detach volume from.
  ///
  /// Parameter [device] :
  /// Device path of volume to detach.
  ///
  /// Parameter [disassociateMode] :
  /// Mode for volume detachment.
  Future<void> disassociateVolume({
    required String volumeId,
    required String workspaceInstanceId,
    String? device,
    DisassociateModeEnum? disassociateMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.DisassociateVolume'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
        'WorkspaceInstanceId': workspaceInstanceId,
        if (device != null) 'Device': device,
        if (disassociateMode != null)
          'DisassociateMode': disassociateMode.value,
      },
    );
  }

  /// Retrieves detailed information about a specific WorkSpace Instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceInstanceId] :
  /// Unique identifier of the WorkSpace Instance to retrieve.
  Future<GetWorkspaceInstanceResponse> getWorkspaceInstance({
    required String workspaceInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.GetWorkspaceInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceInstanceId': workspaceInstanceId,
      },
    );

    return GetWorkspaceInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of instance types supported by Amazon WorkSpaces
  /// Instances, enabling precise workspace infrastructure configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [instanceConfigurationFilter] :
  /// Optional filter to narrow instance type results based on configuration
  /// requirements. Only returns instance types that support the specified
  /// combination of tenancy, platform type, and billing mode.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of instance types to return in a single API call. Enables
  /// pagination of instance type results.
  ///
  /// Parameter [nextToken] :
  /// Pagination token for retrieving subsequent pages of instance type results.
  Future<ListInstanceTypesResponse> listInstanceTypes({
    InstanceConfigurationFilter? instanceConfigurationFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      600,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.ListInstanceTypes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (instanceConfigurationFilter != null)
          'InstanceConfigurationFilter': instanceConfigurationFilter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListInstanceTypesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of AWS regions supported by Amazon WorkSpaces Instances,
  /// enabling region discovery for workspace deployments.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of regions to return in a single API call. Enables
  /// pagination of region results.
  ///
  /// Parameter [nextToken] :
  /// Pagination token for retrieving subsequent pages of region results.
  Future<ListRegionsResponse> listRegions({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.ListRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRegionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves tags for a WorkSpace Instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workspaceInstanceId] :
  /// Unique identifier of the WorkSpace Instance.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String workspaceInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkspaceInstanceId': workspaceInstanceId,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a collection of WorkSpaces Instances based on specified filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of WorkSpaces Instances to return in a single response.
  ///
  /// Parameter [nextToken] :
  /// Pagination token for retrieving subsequent pages of WorkSpaces Instances.
  ///
  /// Parameter [provisionStates] :
  /// Filter WorkSpaces Instances by their current provisioning states.
  Future<ListWorkspaceInstancesResponse> listWorkspaceInstances({
    int? maxResults,
    String? nextToken,
    List<ProvisionStateEnum>? provisionStates,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.ListWorkspaceInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (provisionStates != null)
          'ProvisionStates': provisionStates.map((e) => e.value).toList(),
      },
    );

    return ListWorkspaceInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Adds tags to a WorkSpace Instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tags] :
  /// Tags to be added to the WorkSpace Instance.
  ///
  /// Parameter [workspaceInstanceId] :
  /// Unique identifier of the WorkSpace Instance to tag.
  Future<void> tagResource({
    required List<Tag> tags,
    required String workspaceInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Tags': tags,
        'WorkspaceInstanceId': workspaceInstanceId,
      },
    );
  }

  /// Removes tags from a WorkSpace Instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tagKeys] :
  /// Keys of tags to be removed.
  ///
  /// Parameter [workspaceInstanceId] :
  /// Unique identifier of the WorkSpace Instance to untag.
  Future<void> untagResource({
    required List<String> tagKeys,
    required String workspaceInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'EUCMIFrontendAPIService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TagKeys': tagKeys,
        'WorkspaceInstanceId': workspaceInstanceId,
      },
    );
  }
}

/// Confirms volume attachment.
///
/// @nodoc
class AssociateVolumeResponse {
  AssociateVolumeResponse();

  factory AssociateVolumeResponse.fromJson(Map<String, dynamic> _) {
    return AssociateVolumeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Returns the created volume identifier.
///
/// @nodoc
class CreateVolumeResponse {
  /// Unique identifier for the new volume.
  final String? volumeId;

  CreateVolumeResponse({
    this.volumeId,
  });

  factory CreateVolumeResponse.fromJson(Map<String, dynamic> json) {
    return CreateVolumeResponse(
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final volumeId = this.volumeId;
    return {
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// Returns the unique identifier for the newly created WorkSpaces Instance.
///
/// @nodoc
class CreateWorkspaceInstanceResponse {
  /// Unique identifier assigned to the newly created WorkSpaces Instance.
  final String? workspaceInstanceId;

  CreateWorkspaceInstanceResponse({
    this.workspaceInstanceId,
  });

  factory CreateWorkspaceInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceInstanceResponse(
      workspaceInstanceId: json['WorkspaceInstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaceInstanceId = this.workspaceInstanceId;
    return {
      if (workspaceInstanceId != null)
        'WorkspaceInstanceId': workspaceInstanceId,
    };
  }
}

/// Confirms volume deletion.
///
/// @nodoc
class DeleteVolumeResponse {
  DeleteVolumeResponse();

  factory DeleteVolumeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteVolumeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Confirms the successful deletion of the specified WorkSpace Instance.
///
/// @nodoc
class DeleteWorkspaceInstanceResponse {
  DeleteWorkspaceInstanceResponse();

  factory DeleteWorkspaceInstanceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkspaceInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Confirms volume detachment.
///
/// @nodoc
class DisassociateVolumeResponse {
  DisassociateVolumeResponse();

  factory DisassociateVolumeResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateVolumeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides comprehensive details about the requested WorkSpaces Instance.
///
/// @nodoc
class GetWorkspaceInstanceResponse {
  /// Returns the current billing configuration for the WorkSpace Instance,
  /// indicating the active billing mode.
  final BillingConfiguration? billingConfiguration;

  /// Includes any underlying EC2 instance errors encountered.
  final List<EC2InstanceError>? eC2InstanceErrors;

  /// Details of the associated EC2 managed instance.
  final EC2ManagedInstance? eC2ManagedInstance;

  /// Current provisioning state of the WorkSpaces Instance.
  final ProvisionStateEnum? provisionState;

  /// Captures any errors specific to the WorkSpace Instance lifecycle.
  final List<WorkspaceInstanceError>? workspaceInstanceErrors;

  /// Unique identifier of the retrieved WorkSpaces Instance.
  final String? workspaceInstanceId;

  GetWorkspaceInstanceResponse({
    this.billingConfiguration,
    this.eC2InstanceErrors,
    this.eC2ManagedInstance,
    this.provisionState,
    this.workspaceInstanceErrors,
    this.workspaceInstanceId,
  });

  factory GetWorkspaceInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkspaceInstanceResponse(
      billingConfiguration: json['BillingConfiguration'] != null
          ? BillingConfiguration.fromJson(
              json['BillingConfiguration'] as Map<String, dynamic>)
          : null,
      eC2InstanceErrors: (json['EC2InstanceErrors'] as List?)
          ?.nonNulls
          .map((e) => EC2InstanceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      eC2ManagedInstance: json['EC2ManagedInstance'] != null
          ? EC2ManagedInstance.fromJson(
              json['EC2ManagedInstance'] as Map<String, dynamic>)
          : null,
      provisionState: (json['ProvisionState'] as String?)
          ?.let(ProvisionStateEnum.fromString),
      workspaceInstanceErrors: (json['WorkspaceInstanceErrors'] as List?)
          ?.nonNulls
          .map(
              (e) => WorkspaceInstanceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      workspaceInstanceId: json['WorkspaceInstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingConfiguration = this.billingConfiguration;
    final eC2InstanceErrors = this.eC2InstanceErrors;
    final eC2ManagedInstance = this.eC2ManagedInstance;
    final provisionState = this.provisionState;
    final workspaceInstanceErrors = this.workspaceInstanceErrors;
    final workspaceInstanceId = this.workspaceInstanceId;
    return {
      if (billingConfiguration != null)
        'BillingConfiguration': billingConfiguration,
      if (eC2InstanceErrors != null) 'EC2InstanceErrors': eC2InstanceErrors,
      if (eC2ManagedInstance != null) 'EC2ManagedInstance': eC2ManagedInstance,
      if (provisionState != null) 'ProvisionState': provisionState.value,
      if (workspaceInstanceErrors != null)
        'WorkspaceInstanceErrors': workspaceInstanceErrors,
      if (workspaceInstanceId != null)
        'WorkspaceInstanceId': workspaceInstanceId,
    };
  }
}

/// Contains the list of instance types supported by WorkSpaces Instances.
///
/// @nodoc
class ListInstanceTypesResponse {
  /// Collection of supported instance types for WorkSpaces Instances.
  final List<InstanceTypeInfo> instanceTypes;

  /// Token for retrieving additional instance types if the result set is
  /// paginated.
  final String? nextToken;

  ListInstanceTypesResponse({
    required this.instanceTypes,
    this.nextToken,
  });

  factory ListInstanceTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstanceTypesResponse(
      instanceTypes: ((json['InstanceTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => InstanceTypeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTypes = this.instanceTypes;
    final nextToken = this.nextToken;
    return {
      'InstanceTypes': instanceTypes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Contains the list of supported AWS regions for WorkSpaces Instances.
///
/// @nodoc
class ListRegionsResponse {
  /// Collection of AWS regions supported by WorkSpaces Instances.
  final List<Region> regions;

  /// Token for retrieving additional regions if the result set is paginated.
  final String? nextToken;

  ListRegionsResponse({
    required this.regions,
    this.nextToken,
  });

  factory ListRegionsResponse.fromJson(Map<String, dynamic> json) {
    return ListRegionsResponse(
      regions: ((json['Regions'] as List?) ?? const [])
          .nonNulls
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regions = this.regions;
    final nextToken = this.nextToken;
    return {
      'Regions': regions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Returns the list of tags for the specified WorkSpace Instance.
///
/// @nodoc
class ListTagsForResourceResponse {
  /// Collection of tags associated with the WorkSpace Instance.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the list of WorkSpaces Instances matching the specified criteria.
///
/// @nodoc
class ListWorkspaceInstancesResponse {
  /// Collection of WorkSpaces Instances returned by the query.
  final List<WorkspaceInstance> workspaceInstances;

  /// Token for retrieving additional WorkSpaces Instances if the result set is
  /// paginated.
  final String? nextToken;

  ListWorkspaceInstancesResponse({
    required this.workspaceInstances,
    this.nextToken,
  });

  factory ListWorkspaceInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkspaceInstancesResponse(
      workspaceInstances: ((json['WorkspaceInstances'] as List?) ?? const [])
          .nonNulls
          .map((e) => WorkspaceInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaceInstances = this.workspaceInstances;
    final nextToken = this.nextToken;
    return {
      'WorkspaceInstances': workspaceInstances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Confirms successful tag addition.
///
/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Confirms successful tag removal.
///
/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a key-value metadata tag.
///
/// @nodoc
class Tag {
  /// Unique identifier for the tag.
  final String? key;

  /// Value associated with the tag key.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// Represents a single WorkSpace Instance.
///
/// @nodoc
class WorkspaceInstance {
  /// Details of the associated EC2 managed instance.
  final EC2ManagedInstance? eC2ManagedInstance;

  /// Current provisioning state of the WorkSpace Instance.
  final ProvisionStateEnum? provisionState;

  /// Unique identifier for the WorkSpace Instance.
  final String? workspaceInstanceId;

  WorkspaceInstance({
    this.eC2ManagedInstance,
    this.provisionState,
    this.workspaceInstanceId,
  });

  factory WorkspaceInstance.fromJson(Map<String, dynamic> json) {
    return WorkspaceInstance(
      eC2ManagedInstance: json['EC2ManagedInstance'] != null
          ? EC2ManagedInstance.fromJson(
              json['EC2ManagedInstance'] as Map<String, dynamic>)
          : null,
      provisionState: (json['ProvisionState'] as String?)
          ?.let(ProvisionStateEnum.fromString),
      workspaceInstanceId: json['WorkspaceInstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2ManagedInstance = this.eC2ManagedInstance;
    final provisionState = this.provisionState;
    final workspaceInstanceId = this.workspaceInstanceId;
    return {
      if (eC2ManagedInstance != null) 'EC2ManagedInstance': eC2ManagedInstance,
      if (provisionState != null) 'ProvisionState': provisionState.value,
      if (workspaceInstanceId != null)
        'WorkspaceInstanceId': workspaceInstanceId,
    };
  }
}

/// @nodoc
class ProvisionStateEnum {
  static const allocating = ProvisionStateEnum._('ALLOCATING');
  static const allocated = ProvisionStateEnum._('ALLOCATED');
  static const deallocating = ProvisionStateEnum._('DEALLOCATING');
  static const deallocated = ProvisionStateEnum._('DEALLOCATED');
  static const errorAllocating = ProvisionStateEnum._('ERROR_ALLOCATING');
  static const errorDeallocating = ProvisionStateEnum._('ERROR_DEALLOCATING');

  final String value;

  const ProvisionStateEnum._(this.value);

  static const values = [
    allocating,
    allocated,
    deallocating,
    deallocated,
    errorAllocating,
    errorDeallocating
  ];

  static ProvisionStateEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisionStateEnum._(value));

  @override
  bool operator ==(other) =>
      other is ProvisionStateEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an EC2 instance managed by WorkSpaces.
///
/// @nodoc
class EC2ManagedInstance {
  /// Unique identifier of the managed EC2 instance.
  final String? instanceId;

  EC2ManagedInstance({
    this.instanceId,
  });

  factory EC2ManagedInstance.fromJson(Map<String, dynamic> json) {
    return EC2ManagedInstance(
      instanceId: json['InstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    return {
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

/// Represents an AWS region supported by WorkSpaces Instances.
///
/// @nodoc
class Region {
  /// Name of the AWS region.
  final String? regionName;

  Region({
    this.regionName,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      regionName: json['RegionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    return {
      if (regionName != null) 'RegionName': regionName,
    };
  }
}

/// Provides details about a specific WorkSpace Instance type.
///
/// @nodoc
class InstanceTypeInfo {
  /// Unique identifier for the WorkSpace Instance type.
  final String? instanceType;

  /// Lists all valid combinations of tenancy, platform type, and billing mode
  /// supported for the specific WorkSpace Instance type. Contains the complete
  /// set of configuration options available for this instance type.
  final List<SupportedInstanceConfiguration>? supportedInstanceConfigurations;

  InstanceTypeInfo({
    this.instanceType,
    this.supportedInstanceConfigurations,
  });

  factory InstanceTypeInfo.fromJson(Map<String, dynamic> json) {
    return InstanceTypeInfo(
      instanceType: json['InstanceType'] as String?,
      supportedInstanceConfigurations:
          (json['SupportedInstanceConfigurations'] as List?)
              ?.nonNulls
              .map((e) => SupportedInstanceConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final supportedInstanceConfigurations =
        this.supportedInstanceConfigurations;
    return {
      if (instanceType != null) 'InstanceType': instanceType,
      if (supportedInstanceConfigurations != null)
        'SupportedInstanceConfigurations': supportedInstanceConfigurations,
    };
  }
}

/// Represents a single valid configuration combination that an instance type
/// supports, combining tenancy, platform type, and billing mode into one
/// complete configuration specification.
///
/// @nodoc
class SupportedInstanceConfiguration {
  /// Specifies the billing mode supported in this configuration combination.
  final BillingMode? billingMode;

  /// Specifies the operating system platform supported in this configuration
  /// combination.
  final PlatformTypeEnum? platformType;

  /// Specifies the tenancy model supported in this configuration combination.
  final InstanceConfigurationTenancyEnum? tenancy;

  SupportedInstanceConfiguration({
    this.billingMode,
    this.platformType,
    this.tenancy,
  });

  factory SupportedInstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return SupportedInstanceConfiguration(
      billingMode:
          (json['BillingMode'] as String?)?.let(BillingMode.fromString),
      platformType:
          (json['PlatformType'] as String?)?.let(PlatformTypeEnum.fromString),
      tenancy: (json['Tenancy'] as String?)
          ?.let(InstanceConfigurationTenancyEnum.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final billingMode = this.billingMode;
    final platformType = this.platformType;
    final tenancy = this.tenancy;
    return {
      if (billingMode != null) 'BillingMode': billingMode.value,
      if (platformType != null) 'PlatformType': platformType.value,
      if (tenancy != null) 'Tenancy': tenancy.value,
    };
  }
}

/// @nodoc
class BillingMode {
  static const monthly = BillingMode._('MONTHLY');
  static const hourly = BillingMode._('HOURLY');

  final String value;

  const BillingMode._(this.value);

  static const values = [monthly, hourly];

  static BillingMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BillingMode._(value));

  @override
  bool operator ==(other) => other is BillingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PlatformTypeEnum {
  static const windows = PlatformTypeEnum._('Windows');
  static const windowsByol = PlatformTypeEnum._('Windows BYOL');
  static const linuxUnix = PlatformTypeEnum._('Linux/UNIX');
  static const ubuntuProLinux = PlatformTypeEnum._('Ubuntu Pro Linux');
  static const redHatEnterpriseLinux =
      PlatformTypeEnum._('Red Hat Enterprise Linux');
  static const redHatByolLinux = PlatformTypeEnum._('Red Hat BYOL Linux');
  static const suseLinux = PlatformTypeEnum._('SUSE Linux');

  final String value;

  const PlatformTypeEnum._(this.value);

  static const values = [
    windows,
    windowsByol,
    linuxUnix,
    ubuntuProLinux,
    redHatEnterpriseLinux,
    redHatByolLinux,
    suseLinux
  ];

  static PlatformTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PlatformTypeEnum._(value));

  @override
  bool operator ==(other) => other is PlatformTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InstanceConfigurationTenancyEnum {
  static const shared = InstanceConfigurationTenancyEnum._('SHARED');
  static const dedicated = InstanceConfigurationTenancyEnum._('DEDICATED');

  final String value;

  const InstanceConfigurationTenancyEnum._(this.value);

  static const values = [shared, dedicated];

  static InstanceConfigurationTenancyEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceConfigurationTenancyEnum._(value));

  @override
  bool operator ==(other) =>
      other is InstanceConfigurationTenancyEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines filtering criteria for WorkSpace Instance type searches. Combines
/// multiple filter conditions including billing mode, platform type, and
/// tenancy to help customers find instance types that meet their specific
/// requirements.
///
/// @nodoc
class InstanceConfigurationFilter {
  /// Filters WorkSpace Instance types based on supported billing modes. Allows
  /// customers to search for instance types that support their preferred billing
  /// model, such as HOURLY or MONTHLY billing.
  final BillingMode billingMode;

  /// Filters WorkSpace Instance types by operating system platform. Allows
  /// customers to find instances that support their desired OS, such as Windows,
  /// Linux/UNIX, Ubuntu Pro, RHEL, or SUSE.
  final PlatformTypeEnum platformType;

  /// Filters WorkSpace Instance types by tenancy model. Allows customers to find
  /// instances that match their tenancy requirements, such as SHARED or
  /// DEDICATED.
  final InstanceConfigurationTenancyEnum tenancy;

  InstanceConfigurationFilter({
    required this.billingMode,
    required this.platformType,
    required this.tenancy,
  });

  Map<String, dynamic> toJson() {
    final billingMode = this.billingMode;
    final platformType = this.platformType;
    final tenancy = this.tenancy;
    return {
      'BillingMode': billingMode.value,
      'PlatformType': platformType.value,
      'Tenancy': tenancy.value,
    };
  }
}

/// Defines billing configuration settings for WorkSpace Instances, containing
/// the billing mode selection.
///
/// @nodoc
class BillingConfiguration {
  /// Specifies the billing mode for WorkSpace Instances. MONTHLY provides fixed
  /// monthly rates for predictable budgeting, while HOURLY enables pay-per-second
  /// billing for actual usage.
  final BillingMode billingMode;

  BillingConfiguration({
    required this.billingMode,
  });

  factory BillingConfiguration.fromJson(Map<String, dynamic> json) {
    return BillingConfiguration(
      billingMode:
          BillingMode.fromString((json['BillingMode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final billingMode = this.billingMode;
    return {
      'BillingMode': billingMode.value,
    };
  }
}

/// Captures detailed error information for EC2 instance operations.
///
/// @nodoc
class EC2InstanceError {
  /// Unique error code identifying the specific EC2 instance error.
  final String? eC2ErrorCode;

  /// Detailed description of the EC2 instance error.
  final String? eC2ErrorMessage;

  /// Type of exception encountered during EC2 instance operation.
  final String? eC2ExceptionType;

  EC2InstanceError({
    this.eC2ErrorCode,
    this.eC2ErrorMessage,
    this.eC2ExceptionType,
  });

  factory EC2InstanceError.fromJson(Map<String, dynamic> json) {
    return EC2InstanceError(
      eC2ErrorCode: json['EC2ErrorCode'] as String?,
      eC2ErrorMessage: json['EC2ErrorMessage'] as String?,
      eC2ExceptionType: json['EC2ExceptionType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2ErrorCode = this.eC2ErrorCode;
    final eC2ErrorMessage = this.eC2ErrorMessage;
    final eC2ExceptionType = this.eC2ExceptionType;
    return {
      if (eC2ErrorCode != null) 'EC2ErrorCode': eC2ErrorCode,
      if (eC2ErrorMessage != null) 'EC2ErrorMessage': eC2ErrorMessage,
      if (eC2ExceptionType != null) 'EC2ExceptionType': eC2ExceptionType,
    };
  }
}

/// Captures errors specific to WorkSpace Instance operations.
///
/// @nodoc
class WorkspaceInstanceError {
  /// Unique error code for the WorkSpace Instance error.
  final String? errorCode;

  /// Detailed description of the WorkSpace Instance error.
  final String? errorMessage;

  WorkspaceInstanceError({
    this.errorCode,
    this.errorMessage,
  });

  factory WorkspaceInstanceError.fromJson(Map<String, dynamic> json) {
    return WorkspaceInstanceError(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// @nodoc
class DisassociateModeEnum {
  static const force = DisassociateModeEnum._('FORCE');
  static const noForce = DisassociateModeEnum._('NO_FORCE');

  final String value;

  const DisassociateModeEnum._(this.value);

  static const values = [force, noForce];

  static DisassociateModeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DisassociateModeEnum._(value));

  @override
  bool operator ==(other) =>
      other is DisassociateModeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines comprehensive configuration for a managed WorkSpace Instance.
///
/// @nodoc
class ManagedInstanceRequest {
  /// Configures block device mappings for storage.
  final List<BlockDeviceMappingRequest>? blockDeviceMappings;

  /// Specifies capacity reservation preferences.
  final CapacityReservationSpecification? capacityReservationSpecification;

  /// Configures CPU-specific settings.
  final CpuOptionsRequest? cpuOptions;

  /// Defines CPU credit configuration for burstable instances.
  final CreditSpecificationRequest? creditSpecification;

  /// Prevents API-initiated instance stop.
  final bool? disableApiStop;

  /// Enables optimized EBS performance.
  final bool? ebsOptimized;

  /// Enables primary IPv6 address configuration.
  final bool? enablePrimaryIpv6;

  /// Configures AWS Nitro Enclave settings.
  final EnclaveOptionsRequest? enclaveOptions;

  /// Configures instance hibernation capabilities.
  final HibernationOptionsRequest? hibernationOptions;

  /// Specifies IAM instance profile configuration.
  final IamInstanceProfileSpecification? iamInstanceProfile;

  /// Identifies the Amazon Machine Image (AMI) for the instance.
  final String? imageId;

  /// Configures marketplace-specific deployment options.
  final InstanceMarketOptionsRequest? instanceMarketOptions;

  /// Specifies the WorkSpace Instance type.
  final String? instanceType;

  /// Specifies number of IPv6 addresses to assign.
  final int? ipv6AddressCount;

  /// Configures specific IPv6 addresses.
  final List<InstanceIpv6Address>? ipv6Addresses;

  /// Identifies the kernel for the instance.
  final String? kernelId;

  /// Specifies the key pair for instance access.
  final String? keyName;

  /// Configures license-related settings.
  final List<LicenseConfigurationRequest>? licenseSpecifications;

  /// Defines automatic maintenance settings.
  final InstanceMaintenanceOptionsRequest? maintenanceOptions;

  /// Configures instance metadata service settings.
  final InstanceMetadataOptionsRequest? metadataOptions;

  /// Enables or disables detailed instance monitoring.
  final RunInstancesMonitoringEnabled? monitoring;

  /// Configures network interface settings.
  final List<InstanceNetworkInterfaceSpecification>? networkInterfaces;

  /// Defines network performance configuration.
  final InstanceNetworkPerformanceOptionsRequest? networkPerformanceOptions;

  /// Specifies instance placement preferences.
  final Placement? placement;

  /// Configures private DNS name settings.
  final PrivateDnsNameOptionsRequest? privateDnsNameOptions;

  /// Specifies the primary private IP address.
  final String? privateIpAddress;

  /// Identifies the ramdisk for the instance.
  final String? ramdiskId;

  /// Specifies security group identifiers.
  final List<String>? securityGroupIds;

  /// Configures security group settings.
  final List<String>? securityGroups;

  /// Identifies the subnet for the instance.
  final String? subnetId;

  /// Configures resource tagging specifications.
  final List<TagSpecification>? tagSpecifications;

  /// Provides custom initialization data for the instance.
  final String? userData;

  ManagedInstanceRequest({
    this.blockDeviceMappings,
    this.capacityReservationSpecification,
    this.cpuOptions,
    this.creditSpecification,
    this.disableApiStop,
    this.ebsOptimized,
    this.enablePrimaryIpv6,
    this.enclaveOptions,
    this.hibernationOptions,
    this.iamInstanceProfile,
    this.imageId,
    this.instanceMarketOptions,
    this.instanceType,
    this.ipv6AddressCount,
    this.ipv6Addresses,
    this.kernelId,
    this.keyName,
    this.licenseSpecifications,
    this.maintenanceOptions,
    this.metadataOptions,
    this.monitoring,
    this.networkInterfaces,
    this.networkPerformanceOptions,
    this.placement,
    this.privateDnsNameOptions,
    this.privateIpAddress,
    this.ramdiskId,
    this.securityGroupIds,
    this.securityGroups,
    this.subnetId,
    this.tagSpecifications,
    this.userData,
  });

  Map<String, dynamic> toJson() {
    final blockDeviceMappings = this.blockDeviceMappings;
    final capacityReservationSpecification =
        this.capacityReservationSpecification;
    final cpuOptions = this.cpuOptions;
    final creditSpecification = this.creditSpecification;
    final disableApiStop = this.disableApiStop;
    final ebsOptimized = this.ebsOptimized;
    final enablePrimaryIpv6 = this.enablePrimaryIpv6;
    final enclaveOptions = this.enclaveOptions;
    final hibernationOptions = this.hibernationOptions;
    final iamInstanceProfile = this.iamInstanceProfile;
    final imageId = this.imageId;
    final instanceMarketOptions = this.instanceMarketOptions;
    final instanceType = this.instanceType;
    final ipv6AddressCount = this.ipv6AddressCount;
    final ipv6Addresses = this.ipv6Addresses;
    final kernelId = this.kernelId;
    final keyName = this.keyName;
    final licenseSpecifications = this.licenseSpecifications;
    final maintenanceOptions = this.maintenanceOptions;
    final metadataOptions = this.metadataOptions;
    final monitoring = this.monitoring;
    final networkInterfaces = this.networkInterfaces;
    final networkPerformanceOptions = this.networkPerformanceOptions;
    final placement = this.placement;
    final privateDnsNameOptions = this.privateDnsNameOptions;
    final privateIpAddress = this.privateIpAddress;
    final ramdiskId = this.ramdiskId;
    final securityGroupIds = this.securityGroupIds;
    final securityGroups = this.securityGroups;
    final subnetId = this.subnetId;
    final tagSpecifications = this.tagSpecifications;
    final userData = this.userData;
    return {
      if (blockDeviceMappings != null)
        'BlockDeviceMappings': blockDeviceMappings,
      if (capacityReservationSpecification != null)
        'CapacityReservationSpecification': capacityReservationSpecification,
      if (cpuOptions != null) 'CpuOptions': cpuOptions,
      if (creditSpecification != null)
        'CreditSpecification': creditSpecification,
      if (disableApiStop != null) 'DisableApiStop': disableApiStop,
      if (ebsOptimized != null) 'EbsOptimized': ebsOptimized,
      if (enablePrimaryIpv6 != null) 'EnablePrimaryIpv6': enablePrimaryIpv6,
      if (enclaveOptions != null) 'EnclaveOptions': enclaveOptions,
      if (hibernationOptions != null) 'HibernationOptions': hibernationOptions,
      if (iamInstanceProfile != null) 'IamInstanceProfile': iamInstanceProfile,
      if (imageId != null) 'ImageId': imageId,
      if (instanceMarketOptions != null)
        'InstanceMarketOptions': instanceMarketOptions,
      if (instanceType != null) 'InstanceType': instanceType,
      if (ipv6AddressCount != null) 'Ipv6AddressCount': ipv6AddressCount,
      if (ipv6Addresses != null) 'Ipv6Addresses': ipv6Addresses,
      if (kernelId != null) 'KernelId': kernelId,
      if (keyName != null) 'KeyName': keyName,
      if (licenseSpecifications != null)
        'LicenseSpecifications': licenseSpecifications,
      if (maintenanceOptions != null) 'MaintenanceOptions': maintenanceOptions,
      if (metadataOptions != null) 'MetadataOptions': metadataOptions,
      if (monitoring != null) 'Monitoring': monitoring,
      if (networkInterfaces != null) 'NetworkInterfaces': networkInterfaces,
      if (networkPerformanceOptions != null)
        'NetworkPerformanceOptions': networkPerformanceOptions,
      if (placement != null) 'Placement': placement,
      if (privateDnsNameOptions != null)
        'PrivateDnsNameOptions': privateDnsNameOptions,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (ramdiskId != null) 'RamdiskId': ramdiskId,
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (securityGroups != null) 'SecurityGroups': securityGroups,
      if (subnetId != null) 'SubnetId': subnetId,
      if (tagSpecifications != null) 'TagSpecifications': tagSpecifications,
      if (userData != null) 'UserData': userData,
    };
  }
}

/// Specifies capacity reservation preferences.
///
/// @nodoc
class CapacityReservationSpecification {
  /// Preference for using capacity reservation.
  final CapacityReservationPreferenceEnum? capacityReservationPreference;

  /// Specific capacity reservation target.
  final CapacityReservationTarget? capacityReservationTarget;

  CapacityReservationSpecification({
    this.capacityReservationPreference,
    this.capacityReservationTarget,
  });

  Map<String, dynamic> toJson() {
    final capacityReservationPreference = this.capacityReservationPreference;
    final capacityReservationTarget = this.capacityReservationTarget;
    return {
      if (capacityReservationPreference != null)
        'CapacityReservationPreference': capacityReservationPreference.value,
      if (capacityReservationTarget != null)
        'CapacityReservationTarget': capacityReservationTarget,
    };
  }
}

/// Configures CPU-specific settings for WorkSpace Instance.
///
/// @nodoc
class CpuOptionsRequest {
  /// AMD Secure Encrypted Virtualization configuration.
  final AmdSevSnpEnum? amdSevSnp;

  /// Number of CPU cores to allocate.
  final int? coreCount;

  /// Number of threads per CPU core.
  final int? threadsPerCore;

  CpuOptionsRequest({
    this.amdSevSnp,
    this.coreCount,
    this.threadsPerCore,
  });

  Map<String, dynamic> toJson() {
    final amdSevSnp = this.amdSevSnp;
    final coreCount = this.coreCount;
    final threadsPerCore = this.threadsPerCore;
    return {
      if (amdSevSnp != null) 'AmdSevSnp': amdSevSnp.value,
      if (coreCount != null) 'CoreCount': coreCount,
      if (threadsPerCore != null) 'ThreadsPerCore': threadsPerCore,
    };
  }
}

/// Defines CPU credit configuration for burstable instances.
///
/// @nodoc
class CreditSpecificationRequest {
  /// CPU credit specification mode.
  final CpuCreditsEnum? cpuCredits;

  CreditSpecificationRequest({
    this.cpuCredits,
  });

  Map<String, dynamic> toJson() {
    final cpuCredits = this.cpuCredits;
    return {
      if (cpuCredits != null) 'CpuCredits': cpuCredits.value,
    };
  }
}

/// Configures AWS Nitro Enclave options for the WorkSpace Instance.
///
/// @nodoc
class EnclaveOptionsRequest {
  /// Enables or disables AWS Nitro Enclaves for enhanced security.
  final bool? enabled;

  EnclaveOptionsRequest({
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Defines hibernation configuration for the WorkSpace Instance.
///
/// @nodoc
class HibernationOptionsRequest {
  /// Enables or disables instance hibernation capability.
  final bool? configured;

  HibernationOptionsRequest({
    this.configured,
  });

  Map<String, dynamic> toJson() {
    final configured = this.configured;
    return {
      if (configured != null) 'Configured': configured,
    };
  }
}

/// Defines IAM instance profile configuration for WorkSpace Instance.
///
/// @nodoc
class IamInstanceProfileSpecification {
  /// Amazon Resource Name (ARN) of the IAM instance profile.
  final String? arn;

  /// Name of the IAM instance profile.
  final String? name;

  IamInstanceProfileSpecification({
    this.arn,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

/// Configures marketplace-specific instance deployment options.
///
/// @nodoc
class InstanceMarketOptionsRequest {
  /// Specifies the type of marketplace for instance deployment.
  final MarketTypeEnum? marketType;

  /// Configuration options for spot instance deployment.
  final SpotMarketOptions? spotOptions;

  InstanceMarketOptionsRequest({
    this.marketType,
    this.spotOptions,
  });

  Map<String, dynamic> toJson() {
    final marketType = this.marketType;
    final spotOptions = this.spotOptions;
    return {
      if (marketType != null) 'MarketType': marketType.value,
      if (spotOptions != null) 'SpotOptions': spotOptions,
    };
  }
}

/// Configures automatic maintenance settings for WorkSpace Instance.
///
/// @nodoc
class InstanceMaintenanceOptionsRequest {
  /// Enables or disables automatic instance recovery.
  final AutoRecoveryEnum? autoRecovery;

  InstanceMaintenanceOptionsRequest({
    this.autoRecovery,
  });

  Map<String, dynamic> toJson() {
    final autoRecovery = this.autoRecovery;
    return {
      if (autoRecovery != null) 'AutoRecovery': autoRecovery.value,
    };
  }
}

/// Defines instance metadata service configuration.
///
/// @nodoc
class InstanceMetadataOptionsRequest {
  /// Enables or disables HTTP endpoint for instance metadata.
  final HttpEndpointEnum? httpEndpoint;

  /// Configures IPv6 support for instance metadata HTTP protocol.
  final HttpProtocolIpv6Enum? httpProtocolIpv6;

  /// Sets maximum number of network hops for metadata PUT responses.
  final int? httpPutResponseHopLimit;

  /// Configures token requirement for instance metadata retrieval.
  final HttpTokensEnum? httpTokens;

  /// Enables or disables instance metadata tags retrieval.
  final InstanceMetadataTagsEnum? instanceMetadataTags;

  InstanceMetadataOptionsRequest({
    this.httpEndpoint,
    this.httpProtocolIpv6,
    this.httpPutResponseHopLimit,
    this.httpTokens,
    this.instanceMetadataTags,
  });

  Map<String, dynamic> toJson() {
    final httpEndpoint = this.httpEndpoint;
    final httpProtocolIpv6 = this.httpProtocolIpv6;
    final httpPutResponseHopLimit = this.httpPutResponseHopLimit;
    final httpTokens = this.httpTokens;
    final instanceMetadataTags = this.instanceMetadataTags;
    return {
      if (httpEndpoint != null) 'HttpEndpoint': httpEndpoint.value,
      if (httpProtocolIpv6 != null) 'HttpProtocolIpv6': httpProtocolIpv6.value,
      if (httpPutResponseHopLimit != null)
        'HttpPutResponseHopLimit': httpPutResponseHopLimit,
      if (httpTokens != null) 'HttpTokens': httpTokens.value,
      if (instanceMetadataTags != null)
        'InstanceMetadataTags': instanceMetadataTags.value,
    };
  }
}

/// Configures detailed monitoring for WorkSpace Instance.
///
/// @nodoc
class RunInstancesMonitoringEnabled {
  /// Enables or disables detailed instance monitoring.
  final bool? enabled;

  RunInstancesMonitoringEnabled({
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Configures network performance settings for WorkSpace Instance.
///
/// @nodoc
class InstanceNetworkPerformanceOptionsRequest {
  /// Defines bandwidth allocation strategy for network interfaces.
  final BandwidthWeightingEnum? bandwidthWeighting;

  InstanceNetworkPerformanceOptionsRequest({
    this.bandwidthWeighting,
  });

  Map<String, dynamic> toJson() {
    final bandwidthWeighting = this.bandwidthWeighting;
    return {
      if (bandwidthWeighting != null)
        'BandwidthWeighting': bandwidthWeighting.value,
    };
  }
}

/// Defines instance placement configuration for WorkSpace Instance.
///
/// @nodoc
class Placement {
  /// Specifies host affinity for dedicated instances.
  final String? affinity;

  /// Identifies the specific AWS availability zone.
  final String? availabilityZone;

  /// Unique identifier for placement group.
  final String? groupId;

  /// Name of the placement group.
  final String? groupName;

  /// Identifies the specific dedicated host.
  final String? hostId;

  /// ARN of the host resource group.
  final String? hostResourceGroupArn;

  /// Specifies partition number for partition placement groups.
  final int? partitionNumber;

  /// Defines instance tenancy configuration.
  final TenancyEnum? tenancy;

  Placement({
    this.affinity,
    this.availabilityZone,
    this.groupId,
    this.groupName,
    this.hostId,
    this.hostResourceGroupArn,
    this.partitionNumber,
    this.tenancy,
  });

  Map<String, dynamic> toJson() {
    final affinity = this.affinity;
    final availabilityZone = this.availabilityZone;
    final groupId = this.groupId;
    final groupName = this.groupName;
    final hostId = this.hostId;
    final hostResourceGroupArn = this.hostResourceGroupArn;
    final partitionNumber = this.partitionNumber;
    final tenancy = this.tenancy;
    return {
      if (affinity != null) 'Affinity': affinity,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
      if (hostId != null) 'HostId': hostId,
      if (hostResourceGroupArn != null)
        'HostResourceGroupArn': hostResourceGroupArn,
      if (partitionNumber != null) 'PartitionNumber': partitionNumber,
      if (tenancy != null) 'Tenancy': tenancy.value,
    };
  }
}

/// Configures private DNS name settings for WorkSpace Instance.
///
/// @nodoc
class PrivateDnsNameOptionsRequest {
  /// Enables DNS AAAA record for resource name resolution.
  final bool? enableResourceNameDnsAAAARecord;

  /// Enables DNS A record for resource name resolution.
  final bool? enableResourceNameDnsARecord;

  /// Specifies the type of hostname configuration.
  final HostnameTypeEnum? hostnameType;

  PrivateDnsNameOptionsRequest({
    this.enableResourceNameDnsAAAARecord,
    this.enableResourceNameDnsARecord,
    this.hostnameType,
  });

  Map<String, dynamic> toJson() {
    final enableResourceNameDnsAAAARecord =
        this.enableResourceNameDnsAAAARecord;
    final enableResourceNameDnsARecord = this.enableResourceNameDnsARecord;
    final hostnameType = this.hostnameType;
    return {
      if (enableResourceNameDnsAAAARecord != null)
        'EnableResourceNameDnsAAAARecord': enableResourceNameDnsAAAARecord,
      if (enableResourceNameDnsARecord != null)
        'EnableResourceNameDnsARecord': enableResourceNameDnsARecord,
      if (hostnameType != null) 'HostnameType': hostnameType.value,
    };
  }
}

/// Defines tagging configuration for a resource.
///
/// @nodoc
class TagSpecification {
  /// Type of resource being tagged.
  final ResourceTypeEnum? resourceType;

  /// Collection of tags for the specified resource.
  final List<Tag>? tags;

  TagSpecification({
    this.resourceType,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final tags = this.tags;
    return {
      if (resourceType != null) 'ResourceType': resourceType.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class ResourceTypeEnum {
  static const instance = ResourceTypeEnum._('instance');
  static const volume = ResourceTypeEnum._('volume');
  static const spotInstancesRequest =
      ResourceTypeEnum._('spot-instances-request');
  static const networkInterface = ResourceTypeEnum._('network-interface');

  final String value;

  const ResourceTypeEnum._(this.value);

  static const values = [
    instance,
    volume,
    spotInstancesRequest,
    networkInterface
  ];

  static ResourceTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceTypeEnum._(value));

  @override
  bool operator ==(other) => other is ResourceTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HostnameTypeEnum {
  static const ipName = HostnameTypeEnum._('ip-name');
  static const resourceName = HostnameTypeEnum._('resource-name');

  final String value;

  const HostnameTypeEnum._(this.value);

  static const values = [ipName, resourceName];

  static HostnameTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HostnameTypeEnum._(value));

  @override
  bool operator ==(other) => other is HostnameTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TenancyEnum {
  static const $default = TenancyEnum._('default');
  static const dedicated = TenancyEnum._('dedicated');
  static const host = TenancyEnum._('host');

  final String value;

  const TenancyEnum._(this.value);

  static const values = [$default, dedicated, host];

  static TenancyEnum fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TenancyEnum._(value));

  @override
  bool operator ==(other) => other is TenancyEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BandwidthWeightingEnum {
  static const $default = BandwidthWeightingEnum._('default');
  static const vpc_1 = BandwidthWeightingEnum._('vpc-1');
  static const ebs_1 = BandwidthWeightingEnum._('ebs-1');

  final String value;

  const BandwidthWeightingEnum._(this.value);

  static const values = [$default, vpc_1, ebs_1];

  static BandwidthWeightingEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BandwidthWeightingEnum._(value));

  @override
  bool operator ==(other) =>
      other is BandwidthWeightingEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines network interface configuration for WorkSpace Instance.
///
/// @nodoc
class InstanceNetworkInterfaceSpecification {
  /// Enables carrier IP address association.
  final bool? associateCarrierIpAddress;

  /// Enables public IP address assignment.
  final bool? associatePublicIpAddress;

  /// Configures network connection tracking parameters.
  final ConnectionTrackingSpecificationRequest? connectionTrackingSpecification;

  /// Descriptive text for the network interface.
  final String? description;

  /// Unique index for the network interface.
  final int? deviceIndex;

  /// Configures Elastic Network Adapter Scalable Reliable Datagram settings.
  final EnaSrdSpecificationRequest? enaSrdSpecification;

  /// Security groups associated with the network interface.
  final List<String>? groups;

  /// Specifies the type of network interface.
  final InterfaceTypeEnum? interfaceType;

  /// Number of IPv4 prefixes to assign.
  final int? ipv4PrefixCount;

  /// IPv4 prefix configurations for the interface.
  final List<Ipv4PrefixSpecificationRequest>? ipv4Prefixes;

  /// Number of IPv6 addresses to assign.
  final int? ipv6AddressCount;

  /// Specific IPv6 addresses for the interface.
  final List<InstanceIpv6Address>? ipv6Addresses;

  /// Number of IPv6 prefixes to assign.
  final int? ipv6PrefixCount;

  /// IPv6 prefix configurations for the interface.
  final List<Ipv6PrefixSpecificationRequest>? ipv6Prefixes;

  /// Index of the network card for multiple network interfaces.
  final int? networkCardIndex;

  /// Unique identifier for the network interface.
  final String? networkInterfaceId;

  /// Indicates the primary IPv6 configuration.
  final bool? primaryIpv6;

  /// Primary private IP address for the interface.
  final String? privateIpAddress;

  /// List of private IP addresses for the interface.
  final List<PrivateIpAddressSpecification>? privateIpAddresses;

  /// Number of additional private IP addresses to assign.
  final int? secondaryPrivateIpAddressCount;

  /// Subnet identifier for the network interface.
  final String? subnetId;

  InstanceNetworkInterfaceSpecification({
    this.associateCarrierIpAddress,
    this.associatePublicIpAddress,
    this.connectionTrackingSpecification,
    this.description,
    this.deviceIndex,
    this.enaSrdSpecification,
    this.groups,
    this.interfaceType,
    this.ipv4PrefixCount,
    this.ipv4Prefixes,
    this.ipv6AddressCount,
    this.ipv6Addresses,
    this.ipv6PrefixCount,
    this.ipv6Prefixes,
    this.networkCardIndex,
    this.networkInterfaceId,
    this.primaryIpv6,
    this.privateIpAddress,
    this.privateIpAddresses,
    this.secondaryPrivateIpAddressCount,
    this.subnetId,
  });

  Map<String, dynamic> toJson() {
    final associateCarrierIpAddress = this.associateCarrierIpAddress;
    final associatePublicIpAddress = this.associatePublicIpAddress;
    final connectionTrackingSpecification =
        this.connectionTrackingSpecification;
    final description = this.description;
    final deviceIndex = this.deviceIndex;
    final enaSrdSpecification = this.enaSrdSpecification;
    final groups = this.groups;
    final interfaceType = this.interfaceType;
    final ipv4PrefixCount = this.ipv4PrefixCount;
    final ipv4Prefixes = this.ipv4Prefixes;
    final ipv6AddressCount = this.ipv6AddressCount;
    final ipv6Addresses = this.ipv6Addresses;
    final ipv6PrefixCount = this.ipv6PrefixCount;
    final ipv6Prefixes = this.ipv6Prefixes;
    final networkCardIndex = this.networkCardIndex;
    final networkInterfaceId = this.networkInterfaceId;
    final primaryIpv6 = this.primaryIpv6;
    final privateIpAddress = this.privateIpAddress;
    final privateIpAddresses = this.privateIpAddresses;
    final secondaryPrivateIpAddressCount = this.secondaryPrivateIpAddressCount;
    final subnetId = this.subnetId;
    return {
      if (associateCarrierIpAddress != null)
        'AssociateCarrierIpAddress': associateCarrierIpAddress,
      if (associatePublicIpAddress != null)
        'AssociatePublicIpAddress': associatePublicIpAddress,
      if (connectionTrackingSpecification != null)
        'ConnectionTrackingSpecification': connectionTrackingSpecification,
      if (description != null) 'Description': description,
      if (deviceIndex != null) 'DeviceIndex': deviceIndex,
      if (enaSrdSpecification != null)
        'EnaSrdSpecification': enaSrdSpecification,
      if (groups != null) 'Groups': groups,
      if (interfaceType != null) 'InterfaceType': interfaceType.value,
      if (ipv4PrefixCount != null) 'Ipv4PrefixCount': ipv4PrefixCount,
      if (ipv4Prefixes != null) 'Ipv4Prefixes': ipv4Prefixes,
      if (ipv6AddressCount != null) 'Ipv6AddressCount': ipv6AddressCount,
      if (ipv6Addresses != null) 'Ipv6Addresses': ipv6Addresses,
      if (ipv6PrefixCount != null) 'Ipv6PrefixCount': ipv6PrefixCount,
      if (ipv6Prefixes != null) 'Ipv6Prefixes': ipv6Prefixes,
      if (networkCardIndex != null) 'NetworkCardIndex': networkCardIndex,
      if (networkInterfaceId != null) 'NetworkInterfaceId': networkInterfaceId,
      if (primaryIpv6 != null) 'PrimaryIpv6': primaryIpv6,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
      if (privateIpAddresses != null) 'PrivateIpAddresses': privateIpAddresses,
      if (secondaryPrivateIpAddressCount != null)
        'SecondaryPrivateIpAddressCount': secondaryPrivateIpAddressCount,
      if (subnetId != null) 'SubnetId': subnetId,
    };
  }
}

/// Defines connection tracking parameters for network interfaces.
///
/// @nodoc
class ConnectionTrackingSpecificationRequest {
  /// Timeout for established TCP connections.
  final int? tcpEstablishedTimeout;

  /// Timeout for UDP stream connections.
  final int? udpStreamTimeout;

  /// General timeout for UDP connections.
  final int? udpTimeout;

  ConnectionTrackingSpecificationRequest({
    this.tcpEstablishedTimeout,
    this.udpStreamTimeout,
    this.udpTimeout,
  });

  Map<String, dynamic> toJson() {
    final tcpEstablishedTimeout = this.tcpEstablishedTimeout;
    final udpStreamTimeout = this.udpStreamTimeout;
    final udpTimeout = this.udpTimeout;
    return {
      if (tcpEstablishedTimeout != null)
        'TcpEstablishedTimeout': tcpEstablishedTimeout,
      if (udpStreamTimeout != null) 'UdpStreamTimeout': udpStreamTimeout,
      if (udpTimeout != null) 'UdpTimeout': udpTimeout,
    };
  }
}

/// Defines Elastic Network Adapter (ENA) Scalable Reliable Datagram (SRD)
/// configuration.
///
/// @nodoc
class EnaSrdSpecificationRequest {
  /// Enables or disables ENA SRD for network performance.
  final bool? enaSrdEnabled;

  /// Configures UDP-specific ENA SRD settings.
  final EnaSrdUdpSpecificationRequest? enaSrdUdpSpecification;

  EnaSrdSpecificationRequest({
    this.enaSrdEnabled,
    this.enaSrdUdpSpecification,
  });

  Map<String, dynamic> toJson() {
    final enaSrdEnabled = this.enaSrdEnabled;
    final enaSrdUdpSpecification = this.enaSrdUdpSpecification;
    return {
      if (enaSrdEnabled != null) 'EnaSrdEnabled': enaSrdEnabled,
      if (enaSrdUdpSpecification != null)
        'EnaSrdUdpSpecification': enaSrdUdpSpecification,
    };
  }
}

/// @nodoc
class InterfaceTypeEnum {
  static const interface = InterfaceTypeEnum._('interface');
  static const efa = InterfaceTypeEnum._('efa');
  static const efaOnly = InterfaceTypeEnum._('efa-only');

  final String value;

  const InterfaceTypeEnum._(this.value);

  static const values = [interface, efa, efaOnly];

  static InterfaceTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InterfaceTypeEnum._(value));

  @override
  bool operator ==(other) => other is InterfaceTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines private IP address configuration for network interface.
///
/// @nodoc
class PrivateIpAddressSpecification {
  /// Indicates if this is the primary private IP address.
  final bool? primary;

  /// Specific private IP address for the network interface.
  final String? privateIpAddress;

  PrivateIpAddressSpecification({
    this.primary,
    this.privateIpAddress,
  });

  Map<String, dynamic> toJson() {
    final primary = this.primary;
    final privateIpAddress = this.privateIpAddress;
    return {
      if (primary != null) 'Primary': primary,
      if (privateIpAddress != null) 'PrivateIpAddress': privateIpAddress,
    };
  }
}

/// Specifies IPv6 prefix configuration for network interfaces.
///
/// @nodoc
class Ipv6PrefixSpecificationRequest {
  /// Specific IPv6 prefix for network interface configuration.
  final String? ipv6Prefix;

  Ipv6PrefixSpecificationRequest({
    this.ipv6Prefix,
  });

  Map<String, dynamic> toJson() {
    final ipv6Prefix = this.ipv6Prefix;
    return {
      if (ipv6Prefix != null) 'Ipv6Prefix': ipv6Prefix,
    };
  }
}

/// Specifies IPv4 prefix configuration for network interfaces.
///
/// @nodoc
class Ipv4PrefixSpecificationRequest {
  /// Specific IPv4 prefix for network interface configuration.
  final String? ipv4Prefix;

  Ipv4PrefixSpecificationRequest({
    this.ipv4Prefix,
  });

  Map<String, dynamic> toJson() {
    final ipv4Prefix = this.ipv4Prefix;
    return {
      if (ipv4Prefix != null) 'Ipv4Prefix': ipv4Prefix,
    };
  }
}

/// Specifies UDP configuration for ENA SRD.
///
/// @nodoc
class EnaSrdUdpSpecificationRequest {
  /// Enables or disables ENA SRD for UDP traffic.
  final bool? enaSrdUdpEnabled;

  EnaSrdUdpSpecificationRequest({
    this.enaSrdUdpEnabled,
  });

  Map<String, dynamic> toJson() {
    final enaSrdUdpEnabled = this.enaSrdUdpEnabled;
    return {
      if (enaSrdUdpEnabled != null) 'EnaSrdUdpEnabled': enaSrdUdpEnabled,
    };
  }
}

/// @nodoc
class HttpEndpointEnum {
  static const enabled = HttpEndpointEnum._('enabled');
  static const disabled = HttpEndpointEnum._('disabled');

  final String value;

  const HttpEndpointEnum._(this.value);

  static const values = [enabled, disabled];

  static HttpEndpointEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HttpEndpointEnum._(value));

  @override
  bool operator ==(other) => other is HttpEndpointEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HttpProtocolIpv6Enum {
  static const enabled = HttpProtocolIpv6Enum._('enabled');
  static const disabled = HttpProtocolIpv6Enum._('disabled');

  final String value;

  const HttpProtocolIpv6Enum._(this.value);

  static const values = [enabled, disabled];

  static HttpProtocolIpv6Enum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HttpProtocolIpv6Enum._(value));

  @override
  bool operator ==(other) =>
      other is HttpProtocolIpv6Enum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class HttpTokensEnum {
  static const optional = HttpTokensEnum._('optional');
  static const required = HttpTokensEnum._('required');

  final String value;

  const HttpTokensEnum._(this.value);

  static const values = [optional, required];

  static HttpTokensEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HttpTokensEnum._(value));

  @override
  bool operator ==(other) => other is HttpTokensEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InstanceMetadataTagsEnum {
  static const enabled = InstanceMetadataTagsEnum._('enabled');
  static const disabled = InstanceMetadataTagsEnum._('disabled');

  final String value;

  const InstanceMetadataTagsEnum._(this.value);

  static const values = [enabled, disabled];

  static InstanceMetadataTagsEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceMetadataTagsEnum._(value));

  @override
  bool operator ==(other) =>
      other is InstanceMetadataTagsEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutoRecoveryEnum {
  static const disabled = AutoRecoveryEnum._('disabled');
  static const $default = AutoRecoveryEnum._('default');

  final String value;

  const AutoRecoveryEnum._(this.value);

  static const values = [disabled, $default];

  static AutoRecoveryEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoRecoveryEnum._(value));

  @override
  bool operator ==(other) => other is AutoRecoveryEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies license configuration for WorkSpace Instance.
///
/// @nodoc
class LicenseConfigurationRequest {
  /// ARN of the license configuration for the WorkSpace Instance.
  final String? licenseConfigurationArn;

  LicenseConfigurationRequest({
    this.licenseConfigurationArn,
  });

  Map<String, dynamic> toJson() {
    final licenseConfigurationArn = this.licenseConfigurationArn;
    return {
      if (licenseConfigurationArn != null)
        'LicenseConfigurationArn': licenseConfigurationArn,
    };
  }
}

/// Represents an IPv6 address configuration for a WorkSpace Instance.
///
/// @nodoc
class InstanceIpv6Address {
  /// Specific IPv6 address assigned to the instance.
  final String? ipv6Address;

  /// Indicates if this is the primary IPv6 address for the instance.
  final bool? isPrimaryIpv6;

  InstanceIpv6Address({
    this.ipv6Address,
    this.isPrimaryIpv6,
  });

  Map<String, dynamic> toJson() {
    final ipv6Address = this.ipv6Address;
    final isPrimaryIpv6 = this.isPrimaryIpv6;
    return {
      if (ipv6Address != null) 'Ipv6Address': ipv6Address,
      if (isPrimaryIpv6 != null) 'IsPrimaryIpv6': isPrimaryIpv6,
    };
  }
}

/// @nodoc
class MarketTypeEnum {
  static const spot = MarketTypeEnum._('spot');
  static const capacityBlock = MarketTypeEnum._('capacity-block');

  final String value;

  const MarketTypeEnum._(this.value);

  static const values = [spot, capacityBlock];

  static MarketTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MarketTypeEnum._(value));

  @override
  bool operator ==(other) => other is MarketTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines configuration for spot instance deployment.
///
/// @nodoc
class SpotMarketOptions {
  /// Duration of spot instance block reservation.
  final int? blockDurationMinutes;

  /// Specifies behavior when spot instance is interrupted.
  final InstanceInterruptionBehaviorEnum? instanceInterruptionBehavior;

  /// Maximum hourly price for spot instance.
  final String? maxPrice;

  /// Defines the type of spot instance request.
  final SpotInstanceTypeEnum? spotInstanceType;

  /// Timestamp until which spot instance request is valid.
  final DateTime? validUntilUtc;

  SpotMarketOptions({
    this.blockDurationMinutes,
    this.instanceInterruptionBehavior,
    this.maxPrice,
    this.spotInstanceType,
    this.validUntilUtc,
  });

  Map<String, dynamic> toJson() {
    final blockDurationMinutes = this.blockDurationMinutes;
    final instanceInterruptionBehavior = this.instanceInterruptionBehavior;
    final maxPrice = this.maxPrice;
    final spotInstanceType = this.spotInstanceType;
    final validUntilUtc = this.validUntilUtc;
    return {
      if (blockDurationMinutes != null)
        'BlockDurationMinutes': blockDurationMinutes,
      if (instanceInterruptionBehavior != null)
        'InstanceInterruptionBehavior': instanceInterruptionBehavior.value,
      if (maxPrice != null) 'MaxPrice': maxPrice,
      if (spotInstanceType != null) 'SpotInstanceType': spotInstanceType.value,
      if (validUntilUtc != null)
        'ValidUntilUtc': unixTimestampToJson(validUntilUtc),
    };
  }
}

/// @nodoc
class InstanceInterruptionBehaviorEnum {
  static const hibernate = InstanceInterruptionBehaviorEnum._('hibernate');
  static const stop = InstanceInterruptionBehaviorEnum._('stop');

  final String value;

  const InstanceInterruptionBehaviorEnum._(this.value);

  static const values = [hibernate, stop];

  static InstanceInterruptionBehaviorEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceInterruptionBehaviorEnum._(value));

  @override
  bool operator ==(other) =>
      other is InstanceInterruptionBehaviorEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SpotInstanceTypeEnum {
  static const oneTime = SpotInstanceTypeEnum._('one-time');
  static const persistent = SpotInstanceTypeEnum._('persistent');

  final String value;

  const SpotInstanceTypeEnum._(this.value);

  static const values = [oneTime, persistent];

  static SpotInstanceTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SpotInstanceTypeEnum._(value));

  @override
  bool operator ==(other) =>
      other is SpotInstanceTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CpuCreditsEnum {
  static const standard = CpuCreditsEnum._('standard');
  static const unlimited = CpuCreditsEnum._('unlimited');

  final String value;

  const CpuCreditsEnum._(this.value);

  static const values = [standard, unlimited];

  static CpuCreditsEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CpuCreditsEnum._(value));

  @override
  bool operator ==(other) => other is CpuCreditsEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AmdSevSnpEnum {
  static const enabled = AmdSevSnpEnum._('enabled');
  static const disabled = AmdSevSnpEnum._('disabled');

  final String value;

  const AmdSevSnpEnum._(this.value);

  static const values = [enabled, disabled];

  static AmdSevSnpEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AmdSevSnpEnum._(value));

  @override
  bool operator ==(other) => other is AmdSevSnpEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CapacityReservationPreferenceEnum {
  static const capacityReservationsOnly =
      CapacityReservationPreferenceEnum._('capacity-reservations-only');
  static const open = CapacityReservationPreferenceEnum._('open');
  static const none = CapacityReservationPreferenceEnum._('none');

  final String value;

  const CapacityReservationPreferenceEnum._(this.value);

  static const values = [capacityReservationsOnly, open, none];

  static CapacityReservationPreferenceEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CapacityReservationPreferenceEnum._(value));

  @override
  bool operator ==(other) =>
      other is CapacityReservationPreferenceEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifies a specific capacity reservation.
///
/// @nodoc
class CapacityReservationTarget {
  /// Unique identifier for the capacity reservation.
  final String? capacityReservationId;

  /// ARN of the capacity reservation resource group.
  final String? capacityReservationResourceGroupArn;

  CapacityReservationTarget({
    this.capacityReservationId,
    this.capacityReservationResourceGroupArn,
  });

  Map<String, dynamic> toJson() {
    final capacityReservationId = this.capacityReservationId;
    final capacityReservationResourceGroupArn =
        this.capacityReservationResourceGroupArn;
    return {
      if (capacityReservationId != null)
        'CapacityReservationId': capacityReservationId,
      if (capacityReservationResourceGroupArn != null)
        'CapacityReservationResourceGroupArn':
            capacityReservationResourceGroupArn,
    };
  }
}

/// Defines device mapping for WorkSpace Instance storage.
///
/// @nodoc
class BlockDeviceMappingRequest {
  /// Name of the device for storage mapping.
  final String? deviceName;

  /// EBS volume configuration for the device.
  final EbsBlockDevice? ebs;

  /// Indicates device should not be mapped.
  final String? noDevice;

  /// Virtual device name for ephemeral storage.
  final String? virtualName;

  BlockDeviceMappingRequest({
    this.deviceName,
    this.ebs,
    this.noDevice,
    this.virtualName,
  });

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final ebs = this.ebs;
    final noDevice = this.noDevice;
    final virtualName = this.virtualName;
    return {
      if (deviceName != null) 'DeviceName': deviceName,
      if (ebs != null) 'Ebs': ebs,
      if (noDevice != null) 'NoDevice': noDevice,
      if (virtualName != null) 'VirtualName': virtualName,
    };
  }
}

/// Defines configuration for an Elastic Block Store volume.
///
/// @nodoc
class EbsBlockDevice {
  /// Indicates if the volume is encrypted.
  final bool? encrypted;

  /// Input/output operations per second for the volume.
  final int? iops;

  /// KMS key used for volume encryption.
  final String? kmsKeyId;

  /// Volume data transfer rate.
  final int? throughput;

  /// Size of the EBS volume in gigabytes.
  final int? volumeSize;

  /// Type of EBS volume (e.g., gp2, io1).
  final VolumeTypeEnum? volumeType;

  EbsBlockDevice({
    this.encrypted,
    this.iops,
    this.kmsKeyId,
    this.throughput,
    this.volumeSize,
    this.volumeType,
  });

  Map<String, dynamic> toJson() {
    final encrypted = this.encrypted;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final throughput = this.throughput;
    final volumeSize = this.volumeSize;
    final volumeType = this.volumeType;
    return {
      if (encrypted != null) 'Encrypted': encrypted,
      if (iops != null) 'Iops': iops,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (throughput != null) 'Throughput': throughput,
      if (volumeSize != null) 'VolumeSize': volumeSize,
      if (volumeType != null) 'VolumeType': volumeType.value,
    };
  }
}

/// @nodoc
class VolumeTypeEnum {
  static const standard = VolumeTypeEnum._('standard');
  static const io1 = VolumeTypeEnum._('io1');
  static const io2 = VolumeTypeEnum._('io2');
  static const gp2 = VolumeTypeEnum._('gp2');
  static const sc1 = VolumeTypeEnum._('sc1');
  static const st1 = VolumeTypeEnum._('st1');
  static const gp3 = VolumeTypeEnum._('gp3');

  final String value;

  const VolumeTypeEnum._(this.value);

  static const values = [standard, io1, io2, gp2, sc1, st1, gp3];

  static VolumeTypeEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VolumeTypeEnum._(value));

  @override
  bool operator ==(other) => other is VolumeTypeEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
