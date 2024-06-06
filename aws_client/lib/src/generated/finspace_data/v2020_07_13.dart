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

/// The FinSpace APIs let you take actions inside the FinSpace.
class FinSpaceData {
  final _s.RestJsonProtocol _protocol;
  FinSpaceData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'finspace-api',
            signingName: 'finspace-api',
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

  /// Adds a user to a permission group to grant permissions for actions a user
  /// can perform in FinSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [permissionGroupId] :
  /// The unique identifier for the permission group.
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<AssociateUserToPermissionGroupResponse>
      associateUserToPermissionGroup({
    required String permissionGroupId,
    required String userId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/permission-group/${Uri.encodeComponent(permissionGroupId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateUserToPermissionGroupResponse.fromJson(response);
  }

  /// Creates a new Changeset in a FinSpace Dataset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [changeType] :
  /// The option to indicate how a Changeset will be applied to a Dataset.
  ///
  /// <ul>
  /// <li>
  /// <code>REPLACE</code> – Changeset will be considered as a replacement to
  /// all prior loaded Changesets.
  /// </li>
  /// <li>
  /// <code>APPEND</code> – Changeset will be considered as an addition to the
  /// end of all prior loaded Changesets.
  /// </li>
  /// <li>
  /// <code>MODIFY</code> – Changeset is considered as a replacement to a
  /// specific prior ingested Changeset.
  /// </li>
  /// </ul>
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the FinSpace Dataset where the Changeset will be
  /// created.
  ///
  /// Parameter [formatParams] :
  /// Options that define the structure of the source file(s) including the
  /// format type (<code>formatType</code>), header row
  /// (<code>withHeader</code>), data separation character
  /// (<code>separator</code>) and the type of compression
  /// (<code>compression</code>).
  ///
  /// <code>formatType</code> is a required attribute and can have the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>PARQUET</code> – Parquet source file format.
  /// </li>
  /// <li>
  /// <code>CSV</code> – CSV source file format.
  /// </li>
  /// <li>
  /// <code>JSON</code> – JSON source file format.
  /// </li>
  /// <li>
  /// <code>XML</code> – XML source file format.
  /// </li>
  /// </ul>
  /// Here is an example of how you could specify the <code>formatParams</code>:
  ///
  /// <code> "formatParams": { "formatType": "CSV", "withHeader": "true",
  /// "separator": ",", "compression":"None" } </code>
  ///
  /// Note that if you only provide <code>formatType</code> as <code>CSV</code>,
  /// the rest of the attributes will automatically default to CSV values as
  /// following:
  ///
  /// <code> { "withHeader": "true", "separator": "," } </code>
  ///
  /// For more information about supported file formats, see <a
  /// href="https://docs.aws.amazon.com/finspace/latest/userguide/supported-data-types.html">Supported
  /// Data Types and File Formats</a> in the FinSpace User Guide.
  ///
  /// Parameter [sourceParams] :
  /// Options that define the location of the data being ingested
  /// (<code>s3SourcePath</code>) and the source of the changeset
  /// (<code>sourceType</code>).
  ///
  /// Both <code>s3SourcePath</code> and <code>sourceType</code> are required
  /// attributes.
  ///
  /// Here is an example of how you could specify the <code>sourceParams</code>:
  ///
  /// <code> "sourceParams": { "s3SourcePath":
  /// "s3://finspace-landing-us-east-2-bk7gcfvitndqa6ebnvys4d/scratch/wr5hh8pwkpqqkxa4sxrmcw/ingestion/equity.csv",
  /// "sourceType": "S3" } </code>
  ///
  /// The S3 path that you specify must allow the FinSpace role access. To do
  /// that, you first need to configure the IAM policy on S3 bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/finspace/latest/data-api/fs-using-the-finspace-api.html#access-s3-buckets">Loading
  /// data from an Amazon S3 Bucket using the FinSpace API</a> section.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<CreateChangesetResponse> createChangeset({
    required ChangeType changeType,
    required String datasetId,
    required Map<String, String> formatParams,
    required Map<String, String> sourceParams,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'changeType': changeType.toValue(),
      'formatParams': formatParams,
      'sourceParams': sourceParams,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasets/${Uri.encodeComponent(datasetId)}/changesetsv2',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChangesetResponse.fromJson(response);
  }

  /// Creates a Dataview for a Dataset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetId] :
  /// The unique Dataset identifier that is used to create a Dataview.
  ///
  /// Parameter [destinationTypeParams] :
  /// Options that define the destination type for the Dataview.
  ///
  /// Parameter [asOfTimestamp] :
  /// Beginning time to use for the Dataview. The value is determined as epoch
  /// time in milliseconds. For example, the value for Monday, November 1, 2021
  /// 12:00:00 PM UTC is specified as 1635768000000.
  ///
  /// Parameter [autoUpdate] :
  /// Flag to indicate Dataview should be updated automatically.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [partitionColumns] :
  /// Ordered set of column names used to partition data.
  ///
  /// Parameter [sortColumns] :
  /// Columns to be used for sorting the data.
  @Deprecated('This method will be discontinued.')
  Future<CreateDataViewResponse> createDataView({
    required String datasetId,
    required DataViewDestinationTypeParams destinationTypeParams,
    int? asOfTimestamp,
    bool? autoUpdate,
    String? clientToken,
    List<String>? partitionColumns,
    List<String>? sortColumns,
  }) async {
    final $payload = <String, dynamic>{
      'destinationTypeParams': destinationTypeParams,
      if (asOfTimestamp != null) 'asOfTimestamp': asOfTimestamp,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (partitionColumns != null) 'partitionColumns': partitionColumns,
      if (sortColumns != null) 'sortColumns': sortColumns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasets/${Uri.encodeComponent(datasetId)}/dataviewsv2',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataViewResponse.fromJson(response);
  }

  /// Creates a new FinSpace Dataset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetTitle] :
  /// Display title for a FinSpace Dataset.
  ///
  /// Parameter [kind] :
  /// The format in which Dataset data is structured.
  ///
  /// <ul>
  /// <li>
  /// <code>TABULAR</code> – Data is structured in a tabular format.
  /// </li>
  /// <li>
  /// <code>NON_TABULAR</code> – Data is structured in a non-tabular format.
  /// </li>
  /// </ul>
  ///
  /// Parameter [permissionGroupParams] :
  /// Permission group parameters for Dataset permissions.
  ///
  /// Parameter [alias] :
  /// The unique resource identifier for a Dataset.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [datasetDescription] :
  /// Description of a Dataset.
  ///
  /// Parameter [ownerInfo] :
  /// Contact information for a Dataset owner.
  ///
  /// Parameter [schemaDefinition] :
  /// Definition for a schema on a tabular Dataset.
  @Deprecated('This method will be discontinued.')
  Future<CreateDatasetResponse> createDataset({
    required String datasetTitle,
    required DatasetKind kind,
    required PermissionGroupParams permissionGroupParams,
    String? alias,
    String? clientToken,
    String? datasetDescription,
    DatasetOwnerInfo? ownerInfo,
    SchemaUnion? schemaDefinition,
  }) async {
    final $payload = <String, dynamic>{
      'datasetTitle': datasetTitle,
      'kind': kind.toValue(),
      'permissionGroupParams': permissionGroupParams,
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (datasetDescription != null) 'datasetDescription': datasetDescription,
      if (ownerInfo != null) 'ownerInfo': ownerInfo,
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasetsv2',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDatasetResponse.fromJson(response);
  }

  /// Creates a group of permissions for various actions that a user can perform
  /// in FinSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationPermissions] :
  /// The option to indicate FinSpace application permissions that are granted
  /// to a specific group.
  /// <important>
  /// When assigning application permissions, be aware that the permission
  /// <code>ManageUsersAndGroups</code> allows users to grant themselves or
  /// others access to any functionality in their FinSpace environment's
  /// application. It should only be granted to trusted users.
  /// </important>
  /// <ul>
  /// <li>
  /// <code>CreateDataset</code> – Group members can create new datasets.
  /// </li>
  /// <li>
  /// <code>ManageClusters</code> – Group members can manage Apache Spark
  /// clusters from FinSpace notebooks.
  /// </li>
  /// <li>
  /// <code>ManageUsersAndGroups</code> – Group members can manage users and
  /// permission groups. This is a privileged permission that allows users to
  /// grant themselves or others access to any functionality in the application.
  /// It should only be granted to trusted users.
  /// </li>
  /// <li>
  /// <code>ManageAttributeSets</code> – Group members can manage attribute
  /// sets.
  /// </li>
  /// <li>
  /// <code>ViewAuditData</code> – Group members can view audit data.
  /// </li>
  /// <li>
  /// <code>AccessNotebooks</code> – Group members will have access to FinSpace
  /// notebooks.
  /// </li>
  /// <li>
  /// <code>GetTemporaryCredentials</code> – Group members can get temporary API
  /// credentials.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the permission group.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A brief description for the permission group.
  @Deprecated('This method will be discontinued.')
  Future<CreatePermissionGroupResponse> createPermissionGroup({
    required List<ApplicationPermission> applicationPermissions,
    required String name,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'applicationPermissions':
          applicationPermissions.map((e) => e.toValue()).toList(),
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/permission-group',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePermissionGroupResponse.fromJson(response);
  }

  /// Creates a new user in FinSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [emailAddress] :
  /// The email address of the user that you want to register. The email address
  /// serves as a uniquer identifier for each user and cannot be changed after
  /// it's created.
  ///
  /// Parameter [type] :
  /// The option to indicate the type of user. Use one of the following options
  /// to specify this parameter:
  ///
  /// <ul>
  /// <li>
  /// <code>SUPER_USER</code> – A user with permission to all the functionality
  /// and data in FinSpace.
  /// </li>
  /// <li>
  /// <code>APP_USER</code> – A user with specific permissions in FinSpace. The
  /// users are assigned permissions by adding them to a permission group.
  /// </li>
  /// </ul>
  ///
  /// Parameter [apiAccess] :
  /// The option to indicate whether the user can use the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain credentials
  /// that can then be used to access other FinSpace Data API operations.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – The user has permissions to use the APIs.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user does not have permissions to use any
  /// APIs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [apiAccessPrincipalArn] :
  /// The ARN identifier of an AWS user or role that is allowed to call the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain a credentials
  /// token for a specific FinSpace user. This must be an IAM role within your
  /// FinSpace account.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [firstName] :
  /// The first name of the user that you want to register.
  ///
  /// Parameter [lastName] :
  /// The last name of the user that you want to register.
  @Deprecated('This method will be discontinued.')
  Future<CreateUserResponse> createUser({
    required String emailAddress,
    required UserType type,
    ApiAccess? apiAccess,
    String? apiAccessPrincipalArn,
    String? clientToken,
    String? firstName,
    String? lastName,
  }) async {
    final $payload = <String, dynamic>{
      'emailAddress': emailAddress,
      'type': type.toValue(),
      if (apiAccess != null) 'apiAccess': apiAccess.toValue(),
      if (apiAccessPrincipalArn != null)
        'apiAccessPrincipalArn': apiAccessPrincipalArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResponse.fromJson(response);
  }

  /// Deletes a FinSpace Dataset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [datasetId] :
  /// The unique identifier of the Dataset to be deleted.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<DeleteDatasetResponse> deleteDataset({
    required String datasetId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/datasetsv2/${Uri.encodeComponent(datasetId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDatasetResponse.fromJson(response);
  }

  /// Deletes a permission group. This action is irreversible.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [permissionGroupId] :
  /// The unique identifier for the permission group that you want to delete.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<DeletePermissionGroupResponse> deletePermissionGroup({
    required String permissionGroupId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/permission-group/${Uri.encodeComponent(permissionGroupId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePermissionGroupResponse.fromJson(response);
  }

  /// Denies access to the FinSpace web application and API for the specified
  /// user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user that you want to deactivate.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<DisableUserResponse> disableUser({
    required String userId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/${Uri.encodeComponent(userId)}/disable',
      exceptionFnMap: _exceptionFns,
    );
    return DisableUserResponse.fromJson(response);
  }

  /// Removes a user from a permission group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [permissionGroupId] :
  /// The unique identifier for the permission group.
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<DisassociateUserFromPermissionGroupResponse>
      disassociateUserFromPermissionGroup({
    required String permissionGroupId,
    required String userId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/permission-group/${Uri.encodeComponent(permissionGroupId)}/users/${Uri.encodeComponent(userId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateUserFromPermissionGroupResponse.fromJson(response);
  }

  /// Allows the specified user to access the FinSpace web application and API.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user that you want to activate.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<EnableUserResponse> enableUser({
    required String userId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/${Uri.encodeComponent(userId)}/enable',
      exceptionFnMap: _exceptionFns,
    );
    return EnableUserResponse.fromJson(response);
  }

  /// Get information about a Changeset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [changesetId] :
  /// The unique identifier of the Changeset for which to get data.
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the FinSpace Dataset where the Changeset is
  /// created.
  @Deprecated('This method will be discontinued.')
  Future<GetChangesetResponse> getChangeset({
    required String changesetId,
    required String datasetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/datasets/${Uri.encodeComponent(datasetId)}/changesetsv2/${Uri.encodeComponent(changesetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChangesetResponse.fromJson(response);
  }

  /// Gets information about a Dataview.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataViewId] :
  /// The unique identifier for the Dataview.
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the Dataset used in the Dataview.
  @Deprecated('This method will be discontinued.')
  Future<GetDataViewResponse> getDataView({
    required String dataViewId,
    required String datasetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/datasets/${Uri.encodeComponent(datasetId)}/dataviewsv2/${Uri.encodeComponent(dataViewId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataViewResponse.fromJson(response);
  }

  /// Returns information about a Dataset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for a Dataset.
  @Deprecated('This method will be discontinued.')
  Future<GetDatasetResponse> getDataset({
    required String datasetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasetsv2/${Uri.encodeComponent(datasetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatasetResponse.fromJson(response);
  }

  /// Returns the credentials to access the external Dataview from an S3
  /// location. To call this API:
  ///
  /// <ul>
  /// <li>
  /// You must retrieve the programmatic credentials.
  /// </li>
  /// <li>
  /// You must be a member of a FinSpace user group, where the dataset that you
  /// want to access has <code>Read Dataset Data</code> permissions.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataViewId] :
  /// The unique identifier for the Dataview that you want to access.
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the Dataset.
  @Deprecated('This method will be discontinued.')
  Future<GetExternalDataViewAccessDetailsResponse>
      getExternalDataViewAccessDetails({
    required String dataViewId,
    required String datasetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/datasets/${Uri.encodeComponent(datasetId)}/dataviewsv2/${Uri.encodeComponent(dataViewId)}/external-access-details',
      exceptionFnMap: _exceptionFns,
    );
    return GetExternalDataViewAccessDetailsResponse.fromJson(response);
  }

  /// Retrieves the details of a specific permission group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [permissionGroupId] :
  /// The unique identifier for the permission group.
  @Deprecated('This method will be discontinued.')
  Future<GetPermissionGroupResponse> getPermissionGroup({
    required String permissionGroupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/permission-group/${Uri.encodeComponent(permissionGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPermissionGroupResponse.fromJson(response);
  }

  /// Request programmatic credentials to use with FinSpace SDK. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/finspace/latest/data-api/fs-using-the-finspace-api.html#accessing-credentials">Step
  /// 2. Access credentials programmatically using IAM access key id and secret
  /// access key</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentId] :
  /// The FinSpace environment identifier.
  ///
  /// Parameter [durationInMinutes] :
  /// The time duration in which the credentials remain valid.
  @Deprecated('This method will be discontinued.')
  Future<GetProgrammaticAccessCredentialsResponse>
      getProgrammaticAccessCredentials({
    required String environmentId,
    int? durationInMinutes,
  }) async {
    _s.validateNumRange(
      'durationInMinutes',
      durationInMinutes,
      1,
      60,
    );
    final $query = <String, List<String>>{
      'environmentId': [environmentId],
      if (durationInMinutes != null)
        'durationInMinutes': [durationInMinutes.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/credentials/programmatic',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetProgrammaticAccessCredentialsResponse.fromJson(response);
  }

  /// Retrieves details for a specific user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user to get data for.
  @Deprecated('This method will be discontinued.')
  Future<GetUserResponse> getUser({
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/user/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetUserResponse.fromJson(response);
  }

  /// A temporary Amazon S3 location, where you can copy your files from a
  /// source location to stage or use as a scratch space in FinSpace notebook.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [locationType] :
  /// Specify the type of the working location.
  ///
  /// <ul>
  /// <li>
  /// <code>SAGEMAKER</code> – Use the Amazon S3 location as a temporary
  /// location to store data content when working with FinSpace Notebooks that
  /// run on SageMaker studio.
  /// </li>
  /// <li>
  /// <code>INGESTION</code> – Use the Amazon S3 location as a staging location
  /// to copy your data content and then use the location with the Changeset
  /// creation operation.
  /// </li>
  /// </ul>
  @Deprecated('This method will be discontinued.')
  Future<GetWorkingLocationResponse> getWorkingLocation({
    LocationType? locationType,
  }) async {
    final $payload = <String, dynamic>{
      if (locationType != null) 'locationType': locationType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workingLocationV1',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkingLocationResponse.fromJson(response);
  }

  /// Lists the FinSpace Changesets for a Dataset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the FinSpace Dataset to which the Changeset
  /// belongs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListChangesetsResponse> listChangesets({
    required String datasetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(datasetId)}/changesetsv2',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChangesetsResponse.fromJson(response);
  }

  /// Lists all available Dataviews for a Dataset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [datasetId] :
  /// The unique identifier of the Dataset for which to retrieve Dataviews.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListDataViewsResponse> listDataViews({
    required String datasetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasets/${Uri.encodeComponent(datasetId)}/dataviewsv2',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataViewsResponse.fromJson(response);
  }

  /// Lists all of the active Datasets that a user has access to.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListDatasetsResponse> listDatasets({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/datasetsv2',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDatasetsResponse.fromJson(response);
  }

  /// Lists all available permission groups in FinSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListPermissionGroupsResponse> listPermissionGroups({
    required int maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/permission-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionGroupsResponse.fromJson(response);
  }

  /// Lists all the permission groups that are associated with a specific user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListPermissionGroupsByUserResponse> listPermissionGroupsByUser({
    required int maxResults,
    required String userId,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/user/${Uri.encodeComponent(userId)}/permission-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionGroupsByUserResponse.fromJson(response);
  }

  /// Lists all available users in FinSpace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListUsersResponse> listUsers({
    required int maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/user',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Lists details of all the users in a specific permission group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results per page.
  ///
  /// Parameter [permissionGroupId] :
  /// The unique identifier for the permission group.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where a results page should begin.
  @Deprecated('This method will be discontinued.')
  Future<ListUsersByPermissionGroupResponse> listUsersByPermissionGroup({
    required int maxResults,
    required String permissionGroupId,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/permission-group/${Uri.encodeComponent(permissionGroupId)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersByPermissionGroupResponse.fromJson(response);
  }

  /// Resets the password for a specified user ID and generates a temporary one.
  /// Only a superuser can reset password for other users. Resetting the
  /// password immediately invalidates the previous password associated with the
  /// user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user that a temporary password is requested
  /// for.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<ResetUserPasswordResponse> resetUserPassword({
    required String userId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/${Uri.encodeComponent(userId)}/password',
      exceptionFnMap: _exceptionFns,
    );
    return ResetUserPasswordResponse.fromJson(response);
  }

  /// Updates a FinSpace Changeset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [changesetId] :
  /// The unique identifier for the Changeset to update.
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the FinSpace Dataset in which the Changeset is
  /// created.
  ///
  /// Parameter [formatParams] :
  /// Options that define the structure of the source file(s) including the
  /// format type (<code>formatType</code>), header row
  /// (<code>withHeader</code>), data separation character
  /// (<code>separator</code>) and the type of compression
  /// (<code>compression</code>).
  ///
  /// <code>formatType</code> is a required attribute and can have the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>PARQUET</code> – Parquet source file format.
  /// </li>
  /// <li>
  /// <code>CSV</code> – CSV source file format.
  /// </li>
  /// <li>
  /// <code>JSON</code> – JSON source file format.
  /// </li>
  /// <li>
  /// <code>XML</code> – XML source file format.
  /// </li>
  /// </ul>
  /// Here is an example of how you could specify the <code>formatParams</code>:
  ///
  /// <code> "formatParams": { "formatType": "CSV", "withHeader": "true",
  /// "separator": ",", "compression":"None" } </code>
  ///
  /// Note that if you only provide <code>formatType</code> as <code>CSV</code>,
  /// the rest of the attributes will automatically default to CSV values as
  /// following:
  ///
  /// <code> { "withHeader": "true", "separator": "," } </code>
  ///
  /// For more information about supported file formats, see <a
  /// href="https://docs.aws.amazon.com/finspace/latest/userguide/supported-data-types.html">Supported
  /// Data Types and File Formats</a> in the FinSpace User Guide.
  ///
  /// Parameter [sourceParams] :
  /// Options that define the location of the data being ingested
  /// (<code>s3SourcePath</code>) and the source of the changeset
  /// (<code>sourceType</code>).
  ///
  /// Both <code>s3SourcePath</code> and <code>sourceType</code> are required
  /// attributes.
  ///
  /// Here is an example of how you could specify the <code>sourceParams</code>:
  ///
  /// <code> "sourceParams": { "s3SourcePath":
  /// "s3://finspace-landing-us-east-2-bk7gcfvitndqa6ebnvys4d/scratch/wr5hh8pwkpqqkxa4sxrmcw/ingestion/equity.csv",
  /// "sourceType": "S3" } </code>
  ///
  /// The S3 path that you specify must allow the FinSpace role access. To do
  /// that, you first need to configure the IAM policy on S3 bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/finspace/latest/data-api/fs-using-the-finspace-api.html#access-s3-buckets">Loading
  /// data from an Amazon S3 Bucket using the FinSpace API</a>section.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  @Deprecated('This method will be discontinued.')
  Future<UpdateChangesetResponse> updateChangeset({
    required String changesetId,
    required String datasetId,
    required Map<String, String> formatParams,
    required Map<String, String> sourceParams,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'formatParams': formatParams,
      'sourceParams': sourceParams,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/datasets/${Uri.encodeComponent(datasetId)}/changesetsv2/${Uri.encodeComponent(changesetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChangesetResponse.fromJson(response);
  }

  /// Updates a FinSpace Dataset.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetId] :
  /// The unique identifier for the Dataset to update.
  ///
  /// Parameter [datasetTitle] :
  /// A display title for the Dataset.
  ///
  /// Parameter [kind] :
  /// The format in which the Dataset data is structured.
  ///
  /// <ul>
  /// <li>
  /// <code>TABULAR</code> – Data is structured in a tabular format.
  /// </li>
  /// <li>
  /// <code>NON_TABULAR</code> – Data is structured in a non-tabular format.
  /// </li>
  /// </ul>
  ///
  /// Parameter [alias] :
  /// The unique resource identifier for a Dataset.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [datasetDescription] :
  /// A description for the Dataset.
  ///
  /// Parameter [schemaDefinition] :
  /// Definition for a schema on a tabular Dataset.
  @Deprecated('This method will be discontinued.')
  Future<UpdateDatasetResponse> updateDataset({
    required String datasetId,
    required String datasetTitle,
    required DatasetKind kind,
    String? alias,
    String? clientToken,
    String? datasetDescription,
    SchemaUnion? schemaDefinition,
  }) async {
    final $payload = <String, dynamic>{
      'datasetTitle': datasetTitle,
      'kind': kind.toValue(),
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (datasetDescription != null) 'datasetDescription': datasetDescription,
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/datasetsv2/${Uri.encodeComponent(datasetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDatasetResponse.fromJson(response);
  }

  /// Modifies the details of a permission group. You cannot modify a
  /// <code>permissionGroupID</code>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [permissionGroupId] :
  /// The unique identifier for the permission group to update.
  ///
  /// Parameter [applicationPermissions] :
  /// The permissions that are granted to a specific group for accessing the
  /// FinSpace application.
  /// <important>
  /// When assigning application permissions, be aware that the permission
  /// <code>ManageUsersAndGroups</code> allows users to grant themselves or
  /// others access to any functionality in their FinSpace environment's
  /// application. It should only be granted to trusted users.
  /// </important>
  /// <ul>
  /// <li>
  /// <code>CreateDataset</code> – Group members can create new datasets.
  /// </li>
  /// <li>
  /// <code>ManageClusters</code> – Group members can manage Apache Spark
  /// clusters from FinSpace notebooks.
  /// </li>
  /// <li>
  /// <code>ManageUsersAndGroups</code> – Group members can manage users and
  /// permission groups. This is a privileged permission that allows users to
  /// grant themselves or others access to any functionality in the application.
  /// It should only be granted to trusted users.
  /// </li>
  /// <li>
  /// <code>ManageAttributeSets</code> – Group members can manage attribute
  /// sets.
  /// </li>
  /// <li>
  /// <code>ViewAuditData</code> – Group members can view audit data.
  /// </li>
  /// <li>
  /// <code>AccessNotebooks</code> – Group members will have access to FinSpace
  /// notebooks.
  /// </li>
  /// <li>
  /// <code>GetTemporaryCredentials</code> – Group members can get temporary API
  /// credentials.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [description] :
  /// A brief description for the permission group.
  ///
  /// Parameter [name] :
  /// The name of the permission group.
  @Deprecated('This method will be discontinued.')
  Future<UpdatePermissionGroupResponse> updatePermissionGroup({
    required String permissionGroupId,
    List<ApplicationPermission>? applicationPermissions,
    String? clientToken,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationPermissions != null)
        'applicationPermissions':
            applicationPermissions.map((e) => e.toValue()).toList(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/permission-group/${Uri.encodeComponent(permissionGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePermissionGroupResponse.fromJson(response);
  }

  /// Modifies the details of the specified user. You cannot update the
  /// <code>userId</code> for a user.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user that you want to update.
  ///
  /// Parameter [apiAccess] :
  /// The option to indicate whether the user can use the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain credentials
  /// that can then be used to access other FinSpace Data API operations.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – The user has permissions to use the APIs.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user does not have permissions to use any
  /// APIs.
  /// </li>
  /// </ul>
  ///
  /// Parameter [apiAccessPrincipalArn] :
  /// The ARN identifier of an AWS user or role that is allowed to call the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain a credentials
  /// token for a specific FinSpace user. This must be an IAM role within your
  /// FinSpace account.
  ///
  /// Parameter [clientToken] :
  /// A token that ensures idempotency. This token expires in 10 minutes.
  ///
  /// Parameter [firstName] :
  /// The first name of the user.
  ///
  /// Parameter [lastName] :
  /// The last name of the user.
  ///
  /// Parameter [type] :
  /// The option to indicate the type of user.
  ///
  /// <ul>
  /// <li>
  /// <code>SUPER_USER</code>– A user with permission to all the functionality
  /// and data in FinSpace.
  /// </li>
  /// <li>
  /// <code>APP_USER</code> – A user with specific permissions in FinSpace. The
  /// users are assigned permissions by adding them to a permission group.
  /// </li>
  /// </ul>
  @Deprecated('This method will be discontinued.')
  Future<UpdateUserResponse> updateUser({
    required String userId,
    ApiAccess? apiAccess,
    String? apiAccessPrincipalArn,
    String? clientToken,
    String? firstName,
    String? lastName,
    UserType? type,
  }) async {
    final $payload = <String, dynamic>{
      if (apiAccess != null) 'apiAccess': apiAccess.toValue(),
      if (apiAccessPrincipalArn != null)
        'apiAccessPrincipalArn': apiAccessPrincipalArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (type != null) 'type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/user/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }
}

enum ApiAccess {
  enabled,
  disabled,
}

extension ApiAccessValueExtension on ApiAccess {
  String toValue() {
    switch (this) {
      case ApiAccess.enabled:
        return 'ENABLED';
      case ApiAccess.disabled:
        return 'DISABLED';
    }
  }
}

extension ApiAccessFromString on String {
  ApiAccess toApiAccess() {
    switch (this) {
      case 'ENABLED':
        return ApiAccess.enabled;
      case 'DISABLED':
        return ApiAccess.disabled;
    }
    throw Exception('$this is not known in enum ApiAccess');
  }
}

enum ApplicationPermission {
  createDataset,
  manageClusters,
  manageUsersAndGroups,
  manageAttributeSets,
  viewAuditData,
  accessNotebooks,
  getTemporaryCredentials,
}

extension ApplicationPermissionValueExtension on ApplicationPermission {
  String toValue() {
    switch (this) {
      case ApplicationPermission.createDataset:
        return 'CreateDataset';
      case ApplicationPermission.manageClusters:
        return 'ManageClusters';
      case ApplicationPermission.manageUsersAndGroups:
        return 'ManageUsersAndGroups';
      case ApplicationPermission.manageAttributeSets:
        return 'ManageAttributeSets';
      case ApplicationPermission.viewAuditData:
        return 'ViewAuditData';
      case ApplicationPermission.accessNotebooks:
        return 'AccessNotebooks';
      case ApplicationPermission.getTemporaryCredentials:
        return 'GetTemporaryCredentials';
    }
  }
}

extension ApplicationPermissionFromString on String {
  ApplicationPermission toApplicationPermission() {
    switch (this) {
      case 'CreateDataset':
        return ApplicationPermission.createDataset;
      case 'ManageClusters':
        return ApplicationPermission.manageClusters;
      case 'ManageUsersAndGroups':
        return ApplicationPermission.manageUsersAndGroups;
      case 'ManageAttributeSets':
        return ApplicationPermission.manageAttributeSets;
      case 'ViewAuditData':
        return ApplicationPermission.viewAuditData;
      case 'AccessNotebooks':
        return ApplicationPermission.accessNotebooks;
      case 'GetTemporaryCredentials':
        return ApplicationPermission.getTemporaryCredentials;
    }
    throw Exception('$this is not known in enum ApplicationPermission');
  }
}

class AssociateUserToPermissionGroupResponse {
  /// The returned status code of the response.
  final int? statusCode;

  AssociateUserToPermissionGroupResponse({
    this.statusCode,
  });

  factory AssociateUserToPermissionGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateUserToPermissionGroupResponse(
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {};
  }
}

/// The credentials required to access the external Dataview from the S3
/// location.
class AwsCredentials {
  /// The unique identifier for the security credentials.
  final String? accessKeyId;

  /// The Epoch time when the current credentials expire.
  final int? expiration;

  /// The secret access key that can be used to sign requests.
  final String? secretAccessKey;

  /// The token that users must pass to use the credentials.
  final String? sessionToken;

  AwsCredentials({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
  });

  factory AwsCredentials.fromJson(Map<String, dynamic> json) {
    return AwsCredentials(
      accessKeyId: json['accessKeyId'] as String?,
      expiration: json['expiration'] as int?,
      secretAccessKey: json['secretAccessKey'] as String?,
      sessionToken: json['sessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (expiration != null) 'expiration': expiration,
      if (secretAccessKey != null) 'secretAccessKey': secretAccessKey,
      if (sessionToken != null) 'sessionToken': sessionToken,
    };
  }
}

/// Indicates how the given change will be applied to the dataset.
enum ChangeType {
  replace,
  append,
  modify,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.replace:
        return 'REPLACE';
      case ChangeType.append:
        return 'APPEND';
      case ChangeType.modify:
        return 'MODIFY';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'REPLACE':
        return ChangeType.replace;
      case 'APPEND':
        return ChangeType.append;
      case 'MODIFY':
        return ChangeType.modify;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

/// The structure with error messages.
class ChangesetErrorInfo {
  /// The category of the error.
  ///
  /// <ul>
  /// <li>
  /// <code>VALIDATION</code> – The inputs to this request are invalid.
  /// </li>
  /// <li>
  /// <code>SERVICE_QUOTA_EXCEEDED</code> – Service quotas have been exceeded.
  /// Please contact AWS support to increase quotas.
  /// </li>
  /// <li>
  /// <code>ACCESS_DENIED</code> – Missing required permission to perform this
  /// request.
  /// </li>
  /// <li>
  /// <code>RESOURCE_NOT_FOUND</code> – One or more inputs to this request were
  /// not found.
  /// </li>
  /// <li>
  /// <code>THROTTLING</code> – The system temporarily lacks sufficient resources
  /// to process the request.
  /// </li>
  /// <li>
  /// <code>INTERNAL_SERVICE_EXCEPTION</code> – An internal service error has
  /// occurred.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – Cancelled.
  /// </li>
  /// <li>
  /// <code>USER_RECOVERABLE</code> – A user recoverable error has occurred.
  /// </li>
  /// </ul>
  final ErrorCategory? errorCategory;

  /// The text of the error message.
  final String? errorMessage;

  ChangesetErrorInfo({
    this.errorCategory,
    this.errorMessage,
  });

  factory ChangesetErrorInfo.fromJson(Map<String, dynamic> json) {
    return ChangesetErrorInfo(
      errorCategory: (json['errorCategory'] as String?)?.toErrorCategory(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCategory = this.errorCategory;
    final errorMessage = this.errorMessage;
    return {
      if (errorCategory != null) 'errorCategory': errorCategory.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// A Changeset is unit of data in a Dataset.
class ChangesetSummary {
  /// Beginning time from which the Changeset is active. The value is determined
  /// as epoch time in milliseconds. For example, the value for Monday, November
  /// 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? activeFromTimestamp;

  /// Time until which the Changeset is active. The value is determined as epoch
  /// time in milliseconds. For example, the value for Monday, November 1, 2021
  /// 12:00:00 PM UTC is specified as 1635768000000.
  final int? activeUntilTimestamp;

  /// Type that indicates how a Changeset is applied to a Dataset.
  ///
  /// <ul>
  /// <li>
  /// <code>REPLACE</code> – Changeset is considered as a replacement to all prior
  /// loaded Changesets.
  /// </li>
  /// <li>
  /// <code>APPEND</code> – Changeset is considered as an addition to the end of
  /// all prior loaded Changesets.
  /// </li>
  /// <li>
  /// <code>MODIFY</code> – Changeset is considered as a replacement to a specific
  /// prior ingested Changeset.
  /// </li>
  /// </ul>
  final ChangeType? changeType;

  /// The ARN identifier of the Changeset.
  final String? changesetArn;

  /// The unique identifier for a Changeset.
  final String? changesetId;

  /// The timestamp at which the Changeset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? createTime;

  /// The unique identifier for the FinSpace Dataset in which the Changeset is
  /// created.
  final String? datasetId;

  /// The structure with error messages.
  final ChangesetErrorInfo? errorInfo;

  /// Options that define the structure of the source file(s).
  final Map<String, String>? formatParams;

  /// Options that define the location of the data being ingested.
  final Map<String, String>? sourceParams;

  /// Status of the Changeset ingestion.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – Changeset is pending creation.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – Changeset creation has failed.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – Changeset creation has succeeded.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> – Changeset creation is running.
  /// </li>
  /// <li>
  /// <code>STOP_REQUESTED</code> – User requested Changeset creation to stop.
  /// </li>
  /// </ul>
  final IngestionStatus? status;

  /// The unique identifier of the updated Changeset.
  final String? updatedByChangesetId;

  /// The unique identifier of the Changeset that is updated.
  final String? updatesChangesetId;

  ChangesetSummary({
    this.activeFromTimestamp,
    this.activeUntilTimestamp,
    this.changeType,
    this.changesetArn,
    this.changesetId,
    this.createTime,
    this.datasetId,
    this.errorInfo,
    this.formatParams,
    this.sourceParams,
    this.status,
    this.updatedByChangesetId,
    this.updatesChangesetId,
  });

  factory ChangesetSummary.fromJson(Map<String, dynamic> json) {
    return ChangesetSummary(
      activeFromTimestamp: json['activeFromTimestamp'] as int?,
      activeUntilTimestamp: json['activeUntilTimestamp'] as int?,
      changeType: (json['changeType'] as String?)?.toChangeType(),
      changesetArn: json['changesetArn'] as String?,
      changesetId: json['changesetId'] as String?,
      createTime: json['createTime'] as int?,
      datasetId: json['datasetId'] as String?,
      errorInfo: json['errorInfo'] != null
          ? ChangesetErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
      formatParams: (json['formatParams'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sourceParams: (json['sourceParams'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toIngestionStatus(),
      updatedByChangesetId: json['updatedByChangesetId'] as String?,
      updatesChangesetId: json['updatesChangesetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeFromTimestamp = this.activeFromTimestamp;
    final activeUntilTimestamp = this.activeUntilTimestamp;
    final changeType = this.changeType;
    final changesetArn = this.changesetArn;
    final changesetId = this.changesetId;
    final createTime = this.createTime;
    final datasetId = this.datasetId;
    final errorInfo = this.errorInfo;
    final formatParams = this.formatParams;
    final sourceParams = this.sourceParams;
    final status = this.status;
    final updatedByChangesetId = this.updatedByChangesetId;
    final updatesChangesetId = this.updatesChangesetId;
    return {
      if (activeFromTimestamp != null)
        'activeFromTimestamp': activeFromTimestamp,
      if (activeUntilTimestamp != null)
        'activeUntilTimestamp': activeUntilTimestamp,
      if (changeType != null) 'changeType': changeType.toValue(),
      if (changesetArn != null) 'changesetArn': changesetArn,
      if (changesetId != null) 'changesetId': changesetId,
      if (createTime != null) 'createTime': createTime,
      if (datasetId != null) 'datasetId': datasetId,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (formatParams != null) 'formatParams': formatParams,
      if (sourceParams != null) 'sourceParams': sourceParams,
      if (status != null) 'status': status.toValue(),
      if (updatedByChangesetId != null)
        'updatedByChangesetId': updatedByChangesetId,
      if (updatesChangesetId != null) 'updatesChangesetId': updatesChangesetId,
    };
  }
}

/// Data type of a column.
enum ColumnDataType {
  string,
  char,
  integer,
  tinyint,
  smallint,
  bigint,
  float,
  double,
  date,
  datetime,
  boolean,
  binary,
}

extension ColumnDataTypeValueExtension on ColumnDataType {
  String toValue() {
    switch (this) {
      case ColumnDataType.string:
        return 'STRING';
      case ColumnDataType.char:
        return 'CHAR';
      case ColumnDataType.integer:
        return 'INTEGER';
      case ColumnDataType.tinyint:
        return 'TINYINT';
      case ColumnDataType.smallint:
        return 'SMALLINT';
      case ColumnDataType.bigint:
        return 'BIGINT';
      case ColumnDataType.float:
        return 'FLOAT';
      case ColumnDataType.double:
        return 'DOUBLE';
      case ColumnDataType.date:
        return 'DATE';
      case ColumnDataType.datetime:
        return 'DATETIME';
      case ColumnDataType.boolean:
        return 'BOOLEAN';
      case ColumnDataType.binary:
        return 'BINARY';
    }
  }
}

extension ColumnDataTypeFromString on String {
  ColumnDataType toColumnDataType() {
    switch (this) {
      case 'STRING':
        return ColumnDataType.string;
      case 'CHAR':
        return ColumnDataType.char;
      case 'INTEGER':
        return ColumnDataType.integer;
      case 'TINYINT':
        return ColumnDataType.tinyint;
      case 'SMALLINT':
        return ColumnDataType.smallint;
      case 'BIGINT':
        return ColumnDataType.bigint;
      case 'FLOAT':
        return ColumnDataType.float;
      case 'DOUBLE':
        return ColumnDataType.double;
      case 'DATE':
        return ColumnDataType.date;
      case 'DATETIME':
        return ColumnDataType.datetime;
      case 'BOOLEAN':
        return ColumnDataType.boolean;
      case 'BINARY':
        return ColumnDataType.binary;
    }
    throw Exception('$this is not known in enum ColumnDataType');
  }
}

/// The definition of a column in a tabular Dataset.
class ColumnDefinition {
  /// Description for a column.
  final String? columnDescription;

  /// The name of a column.
  final String? columnName;

  /// Data type of a column.
  ///
  /// <ul>
  /// <li>
  /// <code>STRING</code> – A String data type.
  ///
  /// <code>CHAR</code> – A char data type.
  ///
  /// <code>INTEGER</code> – An integer data type.
  ///
  /// <code>TINYINT</code> – A tinyint data type.
  ///
  /// <code>SMALLINT</code> – A smallint data type.
  ///
  /// <code>BIGINT</code> – A bigint data type.
  ///
  /// <code>FLOAT</code> – A float data type.
  ///
  /// <code>DOUBLE</code> – A double data type.
  ///
  /// <code>DATE</code> – A date data type.
  ///
  /// <code>DATETIME</code> – A datetime data type.
  ///
  /// <code>BOOLEAN</code> – A boolean data type.
  ///
  /// <code>BINARY</code> – A binary data type.
  /// </li>
  /// </ul>
  final ColumnDataType? dataType;

  ColumnDefinition({
    this.columnDescription,
    this.columnName,
    this.dataType,
  });

  factory ColumnDefinition.fromJson(Map<String, dynamic> json) {
    return ColumnDefinition(
      columnDescription: json['columnDescription'] as String?,
      columnName: json['columnName'] as String?,
      dataType: (json['dataType'] as String?)?.toColumnDataType(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnDescription = this.columnDescription;
    final columnName = this.columnName;
    final dataType = this.dataType;
    return {
      if (columnDescription != null) 'columnDescription': columnDescription,
      if (columnName != null) 'columnName': columnName,
      if (dataType != null) 'dataType': dataType.toValue(),
    };
  }
}

/// The response from a CreateChangeset operation.
class CreateChangesetResponse {
  /// The unique identifier of the Changeset that is created.
  final String? changesetId;

  /// The unique identifier for the FinSpace Dataset where the Changeset is
  /// created.
  final String? datasetId;

  CreateChangesetResponse({
    this.changesetId,
    this.datasetId,
  });

  factory CreateChangesetResponse.fromJson(Map<String, dynamic> json) {
    return CreateChangesetResponse(
      changesetId: json['changesetId'] as String?,
      datasetId: json['datasetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changesetId = this.changesetId;
    final datasetId = this.datasetId;
    return {
      if (changesetId != null) 'changesetId': changesetId,
      if (datasetId != null) 'datasetId': datasetId,
    };
  }
}

/// Response for creating a data view.
class CreateDataViewResponse {
  /// The unique identifier for the created Dataview.
  final String? dataViewId;

  /// The unique identifier of the Dataset used for the Dataview.
  final String? datasetId;

  CreateDataViewResponse({
    this.dataViewId,
    this.datasetId,
  });

  factory CreateDataViewResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataViewResponse(
      dataViewId: json['dataViewId'] as String?,
      datasetId: json['datasetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataViewId = this.dataViewId;
    final datasetId = this.datasetId;
    return {
      if (dataViewId != null) 'dataViewId': dataViewId,
      if (datasetId != null) 'datasetId': datasetId,
    };
  }
}

/// The response from a CreateDataset operation
class CreateDatasetResponse {
  /// The unique identifier for the created Dataset.
  final String? datasetId;

  CreateDatasetResponse({
    this.datasetId,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetId: json['datasetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetId = this.datasetId;
    return {
      if (datasetId != null) 'datasetId': datasetId,
    };
  }
}

class CreatePermissionGroupResponse {
  /// The unique identifier for the permission group.
  final String? permissionGroupId;

  CreatePermissionGroupResponse({
    this.permissionGroupId,
  });

  factory CreatePermissionGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreatePermissionGroupResponse(
      permissionGroupId: json['permissionGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionGroupId = this.permissionGroupId;
    return {
      if (permissionGroupId != null) 'permissionGroupId': permissionGroupId,
    };
  }
}

class CreateUserResponse {
  /// The unique identifier for the user.
  final String? userId;

  CreateUserResponse({
    this.userId,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'userId': userId,
    };
  }
}

/// Short term API credentials.
class Credentials {
  /// The access key identifier.
  final String? accessKeyId;

  /// The access key.
  final String? secretAccessKey;

  /// The session token.
  final String? sessionToken;

  Credentials({
    this.accessKeyId,
    this.secretAccessKey,
    this.sessionToken,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      accessKeyId: json['accessKeyId'] as String?,
      secretAccessKey: json['secretAccessKey'] as String?,
      sessionToken: json['sessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (secretAccessKey != null) 'secretAccessKey': secretAccessKey,
      if (sessionToken != null) 'sessionToken': sessionToken,
    };
  }
}

/// Structure for the Dataview destination type parameters.
class DataViewDestinationTypeParams {
  /// Destination type for a Dataview.
  ///
  /// <ul>
  /// <li>
  /// <code>GLUE_TABLE</code> – Glue table destination type.
  /// </li>
  /// <li>
  /// <code>S3</code> – S3 destination type.
  /// </li>
  /// </ul>
  final String destinationType;

  /// Dataview export file format.
  ///
  /// <ul>
  /// <li>
  /// <code>PARQUET</code> – Parquet export file format.
  /// </li>
  /// <li>
  /// <code>DELIMITED_TEXT</code> – Delimited text export file format.
  /// </li>
  /// </ul>
  final ExportFileFormat? s3DestinationExportFileFormat;

  /// Format Options for S3 Destination type.
  ///
  /// Here is an example of how you could specify the
  /// <code>s3DestinationExportFileFormatOptions</code>
  ///
  /// <code> { "header": "true", "delimiter": ",", "compression": "gzip" }</code>
  final Map<String, String>? s3DestinationExportFileFormatOptions;

  DataViewDestinationTypeParams({
    required this.destinationType,
    this.s3DestinationExportFileFormat,
    this.s3DestinationExportFileFormatOptions,
  });

  factory DataViewDestinationTypeParams.fromJson(Map<String, dynamic> json) {
    return DataViewDestinationTypeParams(
      destinationType: json['destinationType'] as String,
      s3DestinationExportFileFormat:
          (json['s3DestinationExportFileFormat'] as String?)
              ?.toExportFileFormat(),
      s3DestinationExportFileFormatOptions:
          (json['s3DestinationExportFileFormatOptions']
                  as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationType = this.destinationType;
    final s3DestinationExportFileFormat = this.s3DestinationExportFileFormat;
    final s3DestinationExportFileFormatOptions =
        this.s3DestinationExportFileFormatOptions;
    return {
      'destinationType': destinationType,
      if (s3DestinationExportFileFormat != null)
        's3DestinationExportFileFormat':
            s3DestinationExportFileFormat.toValue(),
      if (s3DestinationExportFileFormatOptions != null)
        's3DestinationExportFileFormatOptions':
            s3DestinationExportFileFormatOptions,
    };
  }
}

/// The structure with error messages.
class DataViewErrorInfo {
  /// The category of the error.
  ///
  /// <ul>
  /// <li>
  /// <code>VALIDATION</code> – The inputs to this request are invalid.
  /// </li>
  /// <li>
  /// <code>SERVICE_QUOTA_EXCEEDED</code> – Service quotas have been exceeded.
  /// Please contact AWS support to increase quotas.
  /// </li>
  /// <li>
  /// <code>ACCESS_DENIED</code> – Missing required permission to perform this
  /// request.
  /// </li>
  /// <li>
  /// <code>RESOURCE_NOT_FOUND</code> – One or more inputs to this request were
  /// not found.
  /// </li>
  /// <li>
  /// <code>THROTTLING</code> – The system temporarily lacks sufficient resources
  /// to process the request.
  /// </li>
  /// <li>
  /// <code>INTERNAL_SERVICE_EXCEPTION</code> – An internal service error has
  /// occurred.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – Cancelled.
  /// </li>
  /// <li>
  /// <code>USER_RECOVERABLE</code> – A user recoverable error has occurred.
  /// </li>
  /// </ul>
  final ErrorCategory? errorCategory;

  /// The text of the error message.
  final String? errorMessage;

  DataViewErrorInfo({
    this.errorCategory,
    this.errorMessage,
  });

  factory DataViewErrorInfo.fromJson(Map<String, dynamic> json) {
    return DataViewErrorInfo(
      errorCategory: (json['errorCategory'] as String?)?.toErrorCategory(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCategory = this.errorCategory;
    final errorMessage = this.errorMessage;
    return {
      if (errorCategory != null) 'errorCategory': errorCategory.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// Status of a DataView
enum DataViewStatus {
  running,
  starting,
  failed,
  cancelled,
  timeout,
  success,
  pending,
  failedCleanupFailed,
}

extension DataViewStatusValueExtension on DataViewStatus {
  String toValue() {
    switch (this) {
      case DataViewStatus.running:
        return 'RUNNING';
      case DataViewStatus.starting:
        return 'STARTING';
      case DataViewStatus.failed:
        return 'FAILED';
      case DataViewStatus.cancelled:
        return 'CANCELLED';
      case DataViewStatus.timeout:
        return 'TIMEOUT';
      case DataViewStatus.success:
        return 'SUCCESS';
      case DataViewStatus.pending:
        return 'PENDING';
      case DataViewStatus.failedCleanupFailed:
        return 'FAILED_CLEANUP_FAILED';
    }
  }
}

extension DataViewStatusFromString on String {
  DataViewStatus toDataViewStatus() {
    switch (this) {
      case 'RUNNING':
        return DataViewStatus.running;
      case 'STARTING':
        return DataViewStatus.starting;
      case 'FAILED':
        return DataViewStatus.failed;
      case 'CANCELLED':
        return DataViewStatus.cancelled;
      case 'TIMEOUT':
        return DataViewStatus.timeout;
      case 'SUCCESS':
        return DataViewStatus.success;
      case 'PENDING':
        return DataViewStatus.pending;
      case 'FAILED_CLEANUP_FAILED':
        return DataViewStatus.failedCleanupFailed;
    }
    throw Exception('$this is not known in enum DataViewStatus');
  }
}

/// Structure for the summary of a Dataview.
class DataViewSummary {
  /// Time range to use for the Dataview. The value is determined as epoch time in
  /// milliseconds. For example, the value for Monday, November 1, 2021 12:00:00
  /// PM UTC is specified as 1635768000000.
  final int? asOfTimestamp;

  /// The flag to indicate Dataview should be updated automatically.
  final bool? autoUpdate;

  /// The timestamp at which the Dataview was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? createTime;

  /// The ARN identifier of the Dataview.
  final String? dataViewArn;

  /// The unique identifier for the Dataview.
  final String? dataViewId;

  /// Th unique identifier for the Dataview Dataset.
  final String? datasetId;

  /// Information about the Dataview destination.
  final DataViewDestinationTypeParams? destinationTypeProperties;

  /// The structure with error messages.
  final DataViewErrorInfo? errorInfo;

  /// The last time that a Dataview was modified. The value is determined as epoch
  /// time in milliseconds. For example, the value for Monday, November 1, 2021
  /// 12:00:00 PM UTC is specified as 1635768000000.
  final int? lastModifiedTime;

  /// Ordered set of column names used to partition data.
  final List<String>? partitionColumns;

  /// Columns to be used for sorting the data.
  final List<String>? sortColumns;

  /// The status of a Dataview creation.
  ///
  /// <ul>
  /// <li>
  /// <code>RUNNING</code> – Dataview creation is running.
  /// </li>
  /// <li>
  /// <code>STARTING</code> – Dataview creation is starting.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – Dataview creation has failed.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – Dataview creation has been cancelled.
  /// </li>
  /// <li>
  /// <code>TIMEOUT</code> – Dataview creation has timed out.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – Dataview creation has succeeded.
  /// </li>
  /// <li>
  /// <code>PENDING</code> – Dataview creation is pending.
  /// </li>
  /// <li>
  /// <code>FAILED_CLEANUP_FAILED</code> – Dataview creation failed and resource
  /// cleanup failed.
  /// </li>
  /// </ul>
  final DataViewStatus? status;

  DataViewSummary({
    this.asOfTimestamp,
    this.autoUpdate,
    this.createTime,
    this.dataViewArn,
    this.dataViewId,
    this.datasetId,
    this.destinationTypeProperties,
    this.errorInfo,
    this.lastModifiedTime,
    this.partitionColumns,
    this.sortColumns,
    this.status,
  });

  factory DataViewSummary.fromJson(Map<String, dynamic> json) {
    return DataViewSummary(
      asOfTimestamp: json['asOfTimestamp'] as int?,
      autoUpdate: json['autoUpdate'] as bool?,
      createTime: json['createTime'] as int?,
      dataViewArn: json['dataViewArn'] as String?,
      dataViewId: json['dataViewId'] as String?,
      datasetId: json['datasetId'] as String?,
      destinationTypeProperties: json['destinationTypeProperties'] != null
          ? DataViewDestinationTypeParams.fromJson(
              json['destinationTypeProperties'] as Map<String, dynamic>)
          : null,
      errorInfo: json['errorInfo'] != null
          ? DataViewErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: json['lastModifiedTime'] as int?,
      partitionColumns: (json['partitionColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sortColumns: (json['sortColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toDataViewStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final asOfTimestamp = this.asOfTimestamp;
    final autoUpdate = this.autoUpdate;
    final createTime = this.createTime;
    final dataViewArn = this.dataViewArn;
    final dataViewId = this.dataViewId;
    final datasetId = this.datasetId;
    final destinationTypeProperties = this.destinationTypeProperties;
    final errorInfo = this.errorInfo;
    final lastModifiedTime = this.lastModifiedTime;
    final partitionColumns = this.partitionColumns;
    final sortColumns = this.sortColumns;
    final status = this.status;
    return {
      if (asOfTimestamp != null) 'asOfTimestamp': asOfTimestamp,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (createTime != null) 'createTime': createTime,
      if (dataViewArn != null) 'dataViewArn': dataViewArn,
      if (dataViewId != null) 'dataViewId': dataViewId,
      if (datasetId != null) 'datasetId': datasetId,
      if (destinationTypeProperties != null)
        'destinationTypeProperties': destinationTypeProperties,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (partitionColumns != null) 'partitionColumns': partitionColumns,
      if (sortColumns != null) 'sortColumns': sortColumns,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The structure for a Dataset.
class Dataset {
  /// The unique resource identifier for a Dataset.
  final String? alias;

  /// The timestamp at which the Dataset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? createTime;

  /// The ARN identifier of the Dataset.
  final String? datasetArn;

  /// Description for a Dataset.
  final String? datasetDescription;

  /// An identifier for a Dataset.
  final String? datasetId;

  /// Display title for a Dataset.
  final String? datasetTitle;

  /// The format in which Dataset data is structured.
  ///
  /// <ul>
  /// <li>
  /// <code>TABULAR</code> – Data is structured in a tabular format.
  /// </li>
  /// <li>
  /// <code>NON_TABULAR</code> – Data is structured in a non-tabular format.
  /// </li>
  /// </ul>
  final DatasetKind? kind;

  /// The last time that the Dataset was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? lastModifiedTime;

  /// Contact information for a Dataset owner.
  final DatasetOwnerInfo? ownerInfo;

  /// Definition for a schema on a tabular Dataset.
  final SchemaUnion? schemaDefinition;

  Dataset({
    this.alias,
    this.createTime,
    this.datasetArn,
    this.datasetDescription,
    this.datasetId,
    this.datasetTitle,
    this.kind,
    this.lastModifiedTime,
    this.ownerInfo,
    this.schemaDefinition,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      alias: json['alias'] as String?,
      createTime: json['createTime'] as int?,
      datasetArn: json['datasetArn'] as String?,
      datasetDescription: json['datasetDescription'] as String?,
      datasetId: json['datasetId'] as String?,
      datasetTitle: json['datasetTitle'] as String?,
      kind: (json['kind'] as String?)?.toDatasetKind(),
      lastModifiedTime: json['lastModifiedTime'] as int?,
      ownerInfo: json['ownerInfo'] != null
          ? DatasetOwnerInfo.fromJson(json['ownerInfo'] as Map<String, dynamic>)
          : null,
      schemaDefinition: json['schemaDefinition'] != null
          ? SchemaUnion.fromJson(
              json['schemaDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final createTime = this.createTime;
    final datasetArn = this.datasetArn;
    final datasetDescription = this.datasetDescription;
    final datasetId = this.datasetId;
    final datasetTitle = this.datasetTitle;
    final kind = this.kind;
    final lastModifiedTime = this.lastModifiedTime;
    final ownerInfo = this.ownerInfo;
    final schemaDefinition = this.schemaDefinition;
    return {
      if (alias != null) 'alias': alias,
      if (createTime != null) 'createTime': createTime,
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetDescription != null) 'datasetDescription': datasetDescription,
      if (datasetId != null) 'datasetId': datasetId,
      if (datasetTitle != null) 'datasetTitle': datasetTitle,
      if (kind != null) 'kind': kind.toValue(),
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (ownerInfo != null) 'ownerInfo': ownerInfo,
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
    };
  }
}

/// Dataset Kind
enum DatasetKind {
  tabular,
  nonTabular,
}

extension DatasetKindValueExtension on DatasetKind {
  String toValue() {
    switch (this) {
      case DatasetKind.tabular:
        return 'TABULAR';
      case DatasetKind.nonTabular:
        return 'NON_TABULAR';
    }
  }
}

extension DatasetKindFromString on String {
  DatasetKind toDatasetKind() {
    switch (this) {
      case 'TABULAR':
        return DatasetKind.tabular;
      case 'NON_TABULAR':
        return DatasetKind.nonTabular;
    }
    throw Exception('$this is not known in enum DatasetKind');
  }
}

/// A structure for Dataset owner info.
class DatasetOwnerInfo {
  /// Email address for the Dataset owner.
  final String? email;

  /// The name of the Dataset owner.
  final String? name;

  /// Phone number for the Dataset owner.
  final String? phoneNumber;

  DatasetOwnerInfo({
    this.email,
    this.name,
    this.phoneNumber,
  });

  factory DatasetOwnerInfo.fromJson(Map<String, dynamic> json) {
    return DatasetOwnerInfo(
      email: json['email'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final name = this.name;
    final phoneNumber = this.phoneNumber;
    return {
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
    };
  }
}

/// Status of the dataset process returned from scheduler service.
enum DatasetStatus {
  pending,
  failed,
  success,
  running,
}

extension DatasetStatusValueExtension on DatasetStatus {
  String toValue() {
    switch (this) {
      case DatasetStatus.pending:
        return 'PENDING';
      case DatasetStatus.failed:
        return 'FAILED';
      case DatasetStatus.success:
        return 'SUCCESS';
      case DatasetStatus.running:
        return 'RUNNING';
    }
  }
}

extension DatasetStatusFromString on String {
  DatasetStatus toDatasetStatus() {
    switch (this) {
      case 'PENDING':
        return DatasetStatus.pending;
      case 'FAILED':
        return DatasetStatus.failed;
      case 'SUCCESS':
        return DatasetStatus.success;
      case 'RUNNING':
        return DatasetStatus.running;
    }
    throw Exception('$this is not known in enum DatasetStatus');
  }
}

/// The response from an DeleteDataset operation
class DeleteDatasetResponse {
  /// The unique identifier for the deleted Dataset.
  final String? datasetId;

  DeleteDatasetResponse({
    this.datasetId,
  });

  factory DeleteDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDatasetResponse(
      datasetId: json['datasetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetId = this.datasetId;
    return {
      if (datasetId != null) 'datasetId': datasetId,
    };
  }
}

class DeletePermissionGroupResponse {
  /// The unique identifier for the deleted permission group.
  final String? permissionGroupId;

  DeletePermissionGroupResponse({
    this.permissionGroupId,
  });

  factory DeletePermissionGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeletePermissionGroupResponse(
      permissionGroupId: json['permissionGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionGroupId = this.permissionGroupId;
    return {
      if (permissionGroupId != null) 'permissionGroupId': permissionGroupId,
    };
  }
}

class DisableUserResponse {
  /// The unique identifier for the deactivated user.
  final String? userId;

  DisableUserResponse({
    this.userId,
  });

  factory DisableUserResponse.fromJson(Map<String, dynamic> json) {
    return DisableUserResponse(
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'userId': userId,
    };
  }
}

class DisassociateUserFromPermissionGroupResponse {
  /// The returned status code of the response.
  final int? statusCode;

  DisassociateUserFromPermissionGroupResponse({
    this.statusCode,
  });

  factory DisassociateUserFromPermissionGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateUserFromPermissionGroupResponse(
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {};
  }
}

class EnableUserResponse {
  /// The unique identifier for the active user.
  final String? userId;

  EnableUserResponse({
    this.userId,
  });

  factory EnableUserResponse.fromJson(Map<String, dynamic> json) {
    return EnableUserResponse(
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'userId': userId,
    };
  }
}

/// Changeset Error Category
enum ErrorCategory {
  validation,
  serviceQuotaExceeded,
  accessDenied,
  resourceNotFound,
  throttling,
  internalServiceException,
  cancelled,
  userRecoverable,
}

extension ErrorCategoryValueExtension on ErrorCategory {
  String toValue() {
    switch (this) {
      case ErrorCategory.validation:
        return 'VALIDATION';
      case ErrorCategory.serviceQuotaExceeded:
        return 'SERVICE_QUOTA_EXCEEDED';
      case ErrorCategory.accessDenied:
        return 'ACCESS_DENIED';
      case ErrorCategory.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case ErrorCategory.throttling:
        return 'THROTTLING';
      case ErrorCategory.internalServiceException:
        return 'INTERNAL_SERVICE_EXCEPTION';
      case ErrorCategory.cancelled:
        return 'CANCELLED';
      case ErrorCategory.userRecoverable:
        return 'USER_RECOVERABLE';
    }
  }
}

extension ErrorCategoryFromString on String {
  ErrorCategory toErrorCategory() {
    switch (this) {
      case 'VALIDATION':
        return ErrorCategory.validation;
      case 'SERVICE_QUOTA_EXCEEDED':
        return ErrorCategory.serviceQuotaExceeded;
      case 'ACCESS_DENIED':
        return ErrorCategory.accessDenied;
      case 'RESOURCE_NOT_FOUND':
        return ErrorCategory.resourceNotFound;
      case 'THROTTLING':
        return ErrorCategory.throttling;
      case 'INTERNAL_SERVICE_EXCEPTION':
        return ErrorCategory.internalServiceException;
      case 'CANCELLED':
        return ErrorCategory.cancelled;
      case 'USER_RECOVERABLE':
        return ErrorCategory.userRecoverable;
    }
    throw Exception('$this is not known in enum ErrorCategory');
  }
}

/// Data View Export File Format
enum ExportFileFormat {
  parquet,
  delimitedText,
}

extension ExportFileFormatValueExtension on ExportFileFormat {
  String toValue() {
    switch (this) {
      case ExportFileFormat.parquet:
        return 'PARQUET';
      case ExportFileFormat.delimitedText:
        return 'DELIMITED_TEXT';
    }
  }
}

extension ExportFileFormatFromString on String {
  ExportFileFormat toExportFileFormat() {
    switch (this) {
      case 'PARQUET':
        return ExportFileFormat.parquet;
      case 'DELIMITED_TEXT':
        return ExportFileFormat.delimitedText;
    }
    throw Exception('$this is not known in enum ExportFileFormat');
  }
}

/// The response from a describe changeset operation
class GetChangesetResponse {
  /// Beginning time from which the Changeset is active. The value is determined
  /// as epoch time in milliseconds. For example, the value for Monday, November
  /// 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? activeFromTimestamp;

  /// Time until which the Changeset is active. The value is determined as epoch
  /// time in milliseconds. For example, the value for Monday, November 1, 2021
  /// 12:00:00 PM UTC is specified as 1635768000000.
  final int? activeUntilTimestamp;

  /// Type that indicates how a Changeset is applied to a Dataset.
  ///
  /// <ul>
  /// <li>
  /// <code>REPLACE</code> – Changeset is considered as a replacement to all prior
  /// loaded Changesets.
  /// </li>
  /// <li>
  /// <code>APPEND</code> – Changeset is considered as an addition to the end of
  /// all prior loaded Changesets.
  /// </li>
  /// <li>
  /// <code>MODIFY</code> – Changeset is considered as a replacement to a specific
  /// prior ingested Changeset.
  /// </li>
  /// </ul>
  final ChangeType? changeType;

  /// The ARN identifier of the Changeset.
  final String? changesetArn;

  /// The unique identifier for a Changeset.
  final String? changesetId;

  /// The timestamp at which the Changeset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? createTime;

  /// The unique identifier for the FinSpace Dataset where the Changeset is
  /// created.
  final String? datasetId;

  /// The structure with error messages.
  final ChangesetErrorInfo? errorInfo;

  /// Structure of the source file(s).
  final Map<String, String>? formatParams;

  /// Options that define the location of the data being ingested.
  final Map<String, String>? sourceParams;

  /// The status of Changeset creation operation.
  final IngestionStatus? status;

  /// The unique identifier of the updated Changeset.
  final String? updatedByChangesetId;

  /// The unique identifier of the Changeset that is being updated.
  final String? updatesChangesetId;

  GetChangesetResponse({
    this.activeFromTimestamp,
    this.activeUntilTimestamp,
    this.changeType,
    this.changesetArn,
    this.changesetId,
    this.createTime,
    this.datasetId,
    this.errorInfo,
    this.formatParams,
    this.sourceParams,
    this.status,
    this.updatedByChangesetId,
    this.updatesChangesetId,
  });

  factory GetChangesetResponse.fromJson(Map<String, dynamic> json) {
    return GetChangesetResponse(
      activeFromTimestamp: json['activeFromTimestamp'] as int?,
      activeUntilTimestamp: json['activeUntilTimestamp'] as int?,
      changeType: (json['changeType'] as String?)?.toChangeType(),
      changesetArn: json['changesetArn'] as String?,
      changesetId: json['changesetId'] as String?,
      createTime: json['createTime'] as int?,
      datasetId: json['datasetId'] as String?,
      errorInfo: json['errorInfo'] != null
          ? ChangesetErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
      formatParams: (json['formatParams'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sourceParams: (json['sourceParams'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toIngestionStatus(),
      updatedByChangesetId: json['updatedByChangesetId'] as String?,
      updatesChangesetId: json['updatesChangesetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeFromTimestamp = this.activeFromTimestamp;
    final activeUntilTimestamp = this.activeUntilTimestamp;
    final changeType = this.changeType;
    final changesetArn = this.changesetArn;
    final changesetId = this.changesetId;
    final createTime = this.createTime;
    final datasetId = this.datasetId;
    final errorInfo = this.errorInfo;
    final formatParams = this.formatParams;
    final sourceParams = this.sourceParams;
    final status = this.status;
    final updatedByChangesetId = this.updatedByChangesetId;
    final updatesChangesetId = this.updatesChangesetId;
    return {
      if (activeFromTimestamp != null)
        'activeFromTimestamp': activeFromTimestamp,
      if (activeUntilTimestamp != null)
        'activeUntilTimestamp': activeUntilTimestamp,
      if (changeType != null) 'changeType': changeType.toValue(),
      if (changesetArn != null) 'changesetArn': changesetArn,
      if (changesetId != null) 'changesetId': changesetId,
      if (createTime != null) 'createTime': createTime,
      if (datasetId != null) 'datasetId': datasetId,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (formatParams != null) 'formatParams': formatParams,
      if (sourceParams != null) 'sourceParams': sourceParams,
      if (status != null) 'status': status.toValue(),
      if (updatedByChangesetId != null)
        'updatedByChangesetId': updatedByChangesetId,
      if (updatesChangesetId != null) 'updatesChangesetId': updatesChangesetId,
    };
  }
}

/// Response from retrieving a dataview, which includes details on the target
/// database and table name
class GetDataViewResponse {
  /// Time range to use for the Dataview. The value is determined as epoch time in
  /// milliseconds. For example, the value for Monday, November 1, 2021 12:00:00
  /// PM UTC is specified as 1635768000000.
  final int? asOfTimestamp;

  /// Flag to indicate Dataview should be updated automatically.
  final bool? autoUpdate;

  /// The timestamp at which the Dataview was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? createTime;

  /// The ARN identifier of the Dataview.
  final String? dataViewArn;

  /// The unique identifier for the Dataview.
  final String? dataViewId;

  /// The unique identifier for the Dataset used in the Dataview.
  final String? datasetId;

  /// Options that define the destination type for the Dataview.
  final DataViewDestinationTypeParams? destinationTypeParams;

  /// Information about an error that occurred for the Dataview.
  final DataViewErrorInfo? errorInfo;

  /// The last time that a Dataview was modified. The value is determined as epoch
  /// time in milliseconds. For example, the value for Monday, November 1, 2021
  /// 12:00:00 PM UTC is specified as 1635768000000.
  final int? lastModifiedTime;

  /// Ordered set of column names used to partition data.
  final List<String>? partitionColumns;

  /// Columns to be used for sorting the data.
  final List<String>? sortColumns;

  /// The status of a Dataview creation.
  ///
  /// <ul>
  /// <li>
  /// <code>RUNNING</code> – Dataview creation is running.
  /// </li>
  /// <li>
  /// <code>STARTING</code> – Dataview creation is starting.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – Dataview creation has failed.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – Dataview creation has been cancelled.
  /// </li>
  /// <li>
  /// <code>TIMEOUT</code> – Dataview creation has timed out.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – Dataview creation has succeeded.
  /// </li>
  /// <li>
  /// <code>PENDING</code> – Dataview creation is pending.
  /// </li>
  /// <li>
  /// <code>FAILED_CLEANUP_FAILED</code> – Dataview creation failed and resource
  /// cleanup failed.
  /// </li>
  /// </ul>
  final DataViewStatus? status;

  GetDataViewResponse({
    this.asOfTimestamp,
    this.autoUpdate,
    this.createTime,
    this.dataViewArn,
    this.dataViewId,
    this.datasetId,
    this.destinationTypeParams,
    this.errorInfo,
    this.lastModifiedTime,
    this.partitionColumns,
    this.sortColumns,
    this.status,
  });

  factory GetDataViewResponse.fromJson(Map<String, dynamic> json) {
    return GetDataViewResponse(
      asOfTimestamp: json['asOfTimestamp'] as int?,
      autoUpdate: json['autoUpdate'] as bool?,
      createTime: json['createTime'] as int?,
      dataViewArn: json['dataViewArn'] as String?,
      dataViewId: json['dataViewId'] as String?,
      datasetId: json['datasetId'] as String?,
      destinationTypeParams: json['destinationTypeParams'] != null
          ? DataViewDestinationTypeParams.fromJson(
              json['destinationTypeParams'] as Map<String, dynamic>)
          : null,
      errorInfo: json['errorInfo'] != null
          ? DataViewErrorInfo.fromJson(
              json['errorInfo'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: json['lastModifiedTime'] as int?,
      partitionColumns: (json['partitionColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sortColumns: (json['sortColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toDataViewStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final asOfTimestamp = this.asOfTimestamp;
    final autoUpdate = this.autoUpdate;
    final createTime = this.createTime;
    final dataViewArn = this.dataViewArn;
    final dataViewId = this.dataViewId;
    final datasetId = this.datasetId;
    final destinationTypeParams = this.destinationTypeParams;
    final errorInfo = this.errorInfo;
    final lastModifiedTime = this.lastModifiedTime;
    final partitionColumns = this.partitionColumns;
    final sortColumns = this.sortColumns;
    final status = this.status;
    return {
      if (asOfTimestamp != null) 'asOfTimestamp': asOfTimestamp,
      if (autoUpdate != null) 'autoUpdate': autoUpdate,
      if (createTime != null) 'createTime': createTime,
      if (dataViewArn != null) 'dataViewArn': dataViewArn,
      if (dataViewId != null) 'dataViewId': dataViewId,
      if (datasetId != null) 'datasetId': datasetId,
      if (destinationTypeParams != null)
        'destinationTypeParams': destinationTypeParams,
      if (errorInfo != null) 'errorInfo': errorInfo,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (partitionColumns != null) 'partitionColumns': partitionColumns,
      if (sortColumns != null) 'sortColumns': sortColumns,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Response for the GetDataset operation
class GetDatasetResponse {
  /// The unique resource identifier for a Dataset.
  final String? alias;

  /// The timestamp at which the Dataset was created in FinSpace. The value is
  /// determined as epoch time in milliseconds. For example, the value for Monday,
  /// November 1, 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? createTime;

  /// The ARN identifier of the Dataset.
  final String? datasetArn;

  /// A description of the Dataset.
  final String? datasetDescription;

  /// The unique identifier for a Dataset.
  final String? datasetId;

  /// Display title for a Dataset.
  final String? datasetTitle;

  /// The format in which Dataset data is structured.
  ///
  /// <ul>
  /// <li>
  /// <code>TABULAR</code> – Data is structured in a tabular format.
  /// </li>
  /// <li>
  /// <code>NON_TABULAR</code> – Data is structured in a non-tabular format.
  /// </li>
  /// </ul>
  final DatasetKind? kind;

  /// The last time that the Dataset was modified. The value is determined as
  /// epoch time in milliseconds. For example, the value for Monday, November 1,
  /// 2021 12:00:00 PM UTC is specified as 1635768000000.
  final int? lastModifiedTime;

  /// Definition for a schema on a tabular Dataset.
  final SchemaUnion? schemaDefinition;

  /// Status of the Dataset creation.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> – Dataset is pending creation.
  /// </li>
  /// <li>
  /// <code>FAILED</code> – Dataset creation has failed.
  /// </li>
  /// <li>
  /// <code>SUCCESS</code> – Dataset creation has succeeded.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> – Dataset creation is running.
  /// </li>
  /// </ul>
  final DatasetStatus? status;

  GetDatasetResponse({
    this.alias,
    this.createTime,
    this.datasetArn,
    this.datasetDescription,
    this.datasetId,
    this.datasetTitle,
    this.kind,
    this.lastModifiedTime,
    this.schemaDefinition,
    this.status,
  });

  factory GetDatasetResponse.fromJson(Map<String, dynamic> json) {
    return GetDatasetResponse(
      alias: json['alias'] as String?,
      createTime: json['createTime'] as int?,
      datasetArn: json['datasetArn'] as String?,
      datasetDescription: json['datasetDescription'] as String?,
      datasetId: json['datasetId'] as String?,
      datasetTitle: json['datasetTitle'] as String?,
      kind: (json['kind'] as String?)?.toDatasetKind(),
      lastModifiedTime: json['lastModifiedTime'] as int?,
      schemaDefinition: json['schemaDefinition'] != null
          ? SchemaUnion.fromJson(
              json['schemaDefinition'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toDatasetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final createTime = this.createTime;
    final datasetArn = this.datasetArn;
    final datasetDescription = this.datasetDescription;
    final datasetId = this.datasetId;
    final datasetTitle = this.datasetTitle;
    final kind = this.kind;
    final lastModifiedTime = this.lastModifiedTime;
    final schemaDefinition = this.schemaDefinition;
    final status = this.status;
    return {
      if (alias != null) 'alias': alias,
      if (createTime != null) 'createTime': createTime,
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetDescription != null) 'datasetDescription': datasetDescription,
      if (datasetId != null) 'datasetId': datasetId,
      if (datasetTitle != null) 'datasetTitle': datasetTitle,
      if (kind != null) 'kind': kind.toValue(),
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (schemaDefinition != null) 'schemaDefinition': schemaDefinition,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetExternalDataViewAccessDetailsResponse {
  /// The credentials required to access the external Dataview from the S3
  /// location.
  final AwsCredentials? credentials;

  /// The location where the external Dataview is stored.
  final S3Location? s3Location;

  GetExternalDataViewAccessDetailsResponse({
    this.credentials,
    this.s3Location,
  });

  factory GetExternalDataViewAccessDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetExternalDataViewAccessDetailsResponse(
      credentials: json['credentials'] != null
          ? AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>)
          : null,
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final s3Location = this.s3Location;
    return {
      if (credentials != null) 'credentials': credentials,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class GetPermissionGroupResponse {
  final PermissionGroup? permissionGroup;

  GetPermissionGroupResponse({
    this.permissionGroup,
  });

  factory GetPermissionGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetPermissionGroupResponse(
      permissionGroup: json['permissionGroup'] != null
          ? PermissionGroup.fromJson(
              json['permissionGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionGroup = this.permissionGroup;
    return {
      if (permissionGroup != null) 'permissionGroup': permissionGroup,
    };
  }
}

/// Response for GetProgrammaticAccessCredentials operation
class GetProgrammaticAccessCredentialsResponse {
  /// Returns the programmatic credentials.
  final Credentials? credentials;

  /// Returns the duration in which the credentials will remain valid.
  final int? durationInMinutes;

  GetProgrammaticAccessCredentialsResponse({
    this.credentials,
    this.durationInMinutes,
  });

  factory GetProgrammaticAccessCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProgrammaticAccessCredentialsResponse(
      credentials: json['credentials'] != null
          ? Credentials.fromJson(json['credentials'] as Map<String, dynamic>)
          : null,
      durationInMinutes: json['durationInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final durationInMinutes = this.durationInMinutes;
    return {
      if (credentials != null) 'credentials': credentials,
      if (durationInMinutes != null) 'durationInMinutes': durationInMinutes,
    };
  }
}

class GetUserResponse {
  /// Indicates whether the user can use the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain credentials that
  /// can then be used to access other FinSpace Data API operations.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – The user has permissions to use the APIs.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user does not have permissions to use any APIs.
  /// </li>
  /// </ul>
  final ApiAccess? apiAccess;

  /// The ARN identifier of an AWS user or role that is allowed to call the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain a credentials
  /// token for a specific FinSpace user. This must be an IAM role within your
  /// FinSpace account.
  final String? apiAccessPrincipalArn;

  /// The timestamp at which the user was created in FinSpace. The value is
  /// determined as epoch time in milliseconds.
  final int? createTime;

  /// The email address that is associated with the user.
  final String? emailAddress;

  /// The first name of the user.
  final String? firstName;

  /// Describes the last time the user was deactivated. The value is determined as
  /// epoch time in milliseconds.
  final int? lastDisabledTime;

  /// Describes the last time the user was activated. The value is determined as
  /// epoch time in milliseconds.
  final int? lastEnabledTime;

  /// Describes the last time that the user logged into their account. The value
  /// is determined as epoch time in milliseconds.
  final int? lastLoginTime;

  /// Describes the last time the user details were updated. The value is
  /// determined as epoch time in milliseconds.
  final int? lastModifiedTime;

  /// The last name of the user.
  final String? lastName;

  /// The current status of the user.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The creation is in progress.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> – The user is created and is currently active.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user is currently inactive.
  /// </li>
  /// </ul>
  final UserStatus? status;

  /// Indicates the type of user.
  ///
  /// <ul>
  /// <li>
  /// <code>SUPER_USER</code> – A user with permission to all the functionality
  /// and data in FinSpace.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>APP_USER</code> – A user with specific permissions in FinSpace. The
  /// users are assigned permissions by adding them to a permission group.
  /// </li>
  /// </ul>
  final UserType? type;

  /// The unique identifier for the user that is retrieved.
  final String? userId;

  GetUserResponse({
    this.apiAccess,
    this.apiAccessPrincipalArn,
    this.createTime,
    this.emailAddress,
    this.firstName,
    this.lastDisabledTime,
    this.lastEnabledTime,
    this.lastLoginTime,
    this.lastModifiedTime,
    this.lastName,
    this.status,
    this.type,
    this.userId,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      apiAccess: (json['apiAccess'] as String?)?.toApiAccess(),
      apiAccessPrincipalArn: json['apiAccessPrincipalArn'] as String?,
      createTime: json['createTime'] as int?,
      emailAddress: json['emailAddress'] as String?,
      firstName: json['firstName'] as String?,
      lastDisabledTime: json['lastDisabledTime'] as int?,
      lastEnabledTime: json['lastEnabledTime'] as int?,
      lastLoginTime: json['lastLoginTime'] as int?,
      lastModifiedTime: json['lastModifiedTime'] as int?,
      lastName: json['lastName'] as String?,
      status: (json['status'] as String?)?.toUserStatus(),
      type: (json['type'] as String?)?.toUserType(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiAccess = this.apiAccess;
    final apiAccessPrincipalArn = this.apiAccessPrincipalArn;
    final createTime = this.createTime;
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final lastDisabledTime = this.lastDisabledTime;
    final lastEnabledTime = this.lastEnabledTime;
    final lastLoginTime = this.lastLoginTime;
    final lastModifiedTime = this.lastModifiedTime;
    final lastName = this.lastName;
    final status = this.status;
    final type = this.type;
    final userId = this.userId;
    return {
      if (apiAccess != null) 'apiAccess': apiAccess.toValue(),
      if (apiAccessPrincipalArn != null)
        'apiAccessPrincipalArn': apiAccessPrincipalArn,
      if (createTime != null) 'createTime': createTime,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (firstName != null) 'firstName': firstName,
      if (lastDisabledTime != null) 'lastDisabledTime': lastDisabledTime,
      if (lastEnabledTime != null) 'lastEnabledTime': lastEnabledTime,
      if (lastLoginTime != null) 'lastLoginTime': lastLoginTime,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (lastName != null) 'lastName': lastName,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (userId != null) 'userId': userId,
    };
  }
}

class GetWorkingLocationResponse {
  /// Returns the Amazon S3 bucket name for the working location.
  final String? s3Bucket;

  /// Returns the Amazon S3 Path for the working location.
  final String? s3Path;

  /// Returns the Amazon S3 URI for the working location.
  final String? s3Uri;

  GetWorkingLocationResponse({
    this.s3Bucket,
    this.s3Path,
    this.s3Uri,
  });

  factory GetWorkingLocationResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkingLocationResponse(
      s3Bucket: json['s3Bucket'] as String?,
      s3Path: json['s3Path'] as String?,
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Path = this.s3Path;
    final s3Uri = this.s3Uri;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Path != null) 's3Path': s3Path,
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// Status of the ingestion process returned from scheduler service.
enum IngestionStatus {
  pending,
  failed,
  success,
  running,
  stopRequested,
}

extension IngestionStatusValueExtension on IngestionStatus {
  String toValue() {
    switch (this) {
      case IngestionStatus.pending:
        return 'PENDING';
      case IngestionStatus.failed:
        return 'FAILED';
      case IngestionStatus.success:
        return 'SUCCESS';
      case IngestionStatus.running:
        return 'RUNNING';
      case IngestionStatus.stopRequested:
        return 'STOP_REQUESTED';
    }
  }
}

extension IngestionStatusFromString on String {
  IngestionStatus toIngestionStatus() {
    switch (this) {
      case 'PENDING':
        return IngestionStatus.pending;
      case 'FAILED':
        return IngestionStatus.failed;
      case 'SUCCESS':
        return IngestionStatus.success;
      case 'RUNNING':
        return IngestionStatus.running;
      case 'STOP_REQUESTED':
        return IngestionStatus.stopRequested;
    }
    throw Exception('$this is not known in enum IngestionStatus');
  }
}

/// Response to ListChangesetsResponse. This returns a list of dataset
/// changesets that match the query criteria.
class ListChangesetsResponse {
  /// List of Changesets found.
  final List<ChangesetSummary>? changesets;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListChangesetsResponse({
    this.changesets,
    this.nextToken,
  });

  factory ListChangesetsResponse.fromJson(Map<String, dynamic> json) {
    return ListChangesetsResponse(
      changesets: (json['changesets'] as List?)
          ?.whereNotNull()
          .map((e) => ChangesetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changesets = this.changesets;
    final nextToken = this.nextToken;
    return {
      if (changesets != null) 'changesets': changesets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataViewsResponse {
  /// A list of Dataviews.
  final List<DataViewSummary>? dataViews;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListDataViewsResponse({
    this.dataViews,
    this.nextToken,
  });

  factory ListDataViewsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataViewsResponse(
      dataViews: (json['dataViews'] as List?)
          ?.whereNotNull()
          .map((e) => DataViewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataViews = this.dataViews;
    final nextToken = this.nextToken;
    return {
      if (dataViews != null) 'dataViews': dataViews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response for the ListDatasets operation
class ListDatasetsResponse {
  /// List of Datasets.
  final List<Dataset>? datasets;

  /// A token that indicates where a results page should begin.
  final String? nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasets: (json['datasets'] as List?)
          ?.whereNotNull()
          .map((e) => Dataset.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasets = this.datasets;
    final nextToken = this.nextToken;
    return {
      if (datasets != null) 'datasets': datasets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPermissionGroupsByUserResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// A list of returned permission groups.
  final List<PermissionGroupByUser>? permissionGroups;

  ListPermissionGroupsByUserResponse({
    this.nextToken,
    this.permissionGroups,
  });

  factory ListPermissionGroupsByUserResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPermissionGroupsByUserResponse(
      nextToken: json['nextToken'] as String?,
      permissionGroups: (json['permissionGroups'] as List?)
          ?.whereNotNull()
          .map((e) => PermissionGroupByUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissionGroups = this.permissionGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissionGroups != null) 'permissionGroups': permissionGroups,
    };
  }
}

class ListPermissionGroupsResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// A list of all the permission groups.
  final List<PermissionGroup>? permissionGroups;

  ListPermissionGroupsResponse({
    this.nextToken,
    this.permissionGroups,
  });

  factory ListPermissionGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionGroupsResponse(
      nextToken: json['nextToken'] as String?,
      permissionGroups: (json['permissionGroups'] as List?)
          ?.whereNotNull()
          .map((e) => PermissionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissionGroups = this.permissionGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissionGroups != null) 'permissionGroups': permissionGroups,
    };
  }
}

class ListUsersByPermissionGroupResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// Lists details of all users in a specific permission group.
  final List<UserByPermissionGroup>? users;

  ListUsersByPermissionGroupResponse({
    this.nextToken,
    this.users,
  });

  factory ListUsersByPermissionGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return ListUsersByPermissionGroupResponse(
      nextToken: json['nextToken'] as String?,
      users: (json['users'] as List?)
          ?.whereNotNull()
          .map((e) => UserByPermissionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (users != null) 'users': users,
    };
  }
}

class ListUsersResponse {
  /// A token that indicates where a results page should begin.
  final String? nextToken;

  /// A list of all the users.
  final List<User>? users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['nextToken'] as String?,
      users: (json['users'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (users != null) 'users': users,
    };
  }
}

/// The structure for a permission group.
class PermissionGroup {
  /// Indicates the permissions that are granted to a specific group for accessing
  /// the FinSpace application.
  /// <important>
  /// When assigning application permissions, be aware that the permission
  /// <code>ManageUsersAndGroups</code> allows users to grant themselves or others
  /// access to any functionality in their FinSpace environment's application. It
  /// should only be granted to trusted users.
  /// </important>
  /// <ul>
  /// <li>
  /// <code>CreateDataset</code> – Group members can create new datasets.
  /// </li>
  /// <li>
  /// <code>ManageClusters</code> – Group members can manage Apache Spark clusters
  /// from FinSpace notebooks.
  /// </li>
  /// <li>
  /// <code>ManageUsersAndGroups</code> – Group members can manage users and
  /// permission groups. This is a privileged permission that allows users to
  /// grant themselves or others access to any functionality in the application.
  /// It should only be granted to trusted users.
  /// </li>
  /// <li>
  /// <code>ManageAttributeSets</code> – Group members can manage attribute sets.
  /// </li>
  /// <li>
  /// <code>ViewAuditData</code> – Group members can view audit data.
  /// </li>
  /// <li>
  /// <code>AccessNotebooks</code> – Group members will have access to FinSpace
  /// notebooks.
  /// </li>
  /// <li>
  /// <code>GetTemporaryCredentials</code> – Group members can get temporary API
  /// credentials.
  /// </li>
  /// </ul>
  final List<ApplicationPermission>? applicationPermissions;

  /// The timestamp at which the group was created in FinSpace. The value is
  /// determined as epoch time in milliseconds.
  final int? createTime;

  /// A brief description for the permission group.
  final String? description;

  /// Describes the last time the permission group was updated. The value is
  /// determined as epoch time in milliseconds.
  final int? lastModifiedTime;

  /// Indicates the status of the user within a permission group.
  ///
  /// <ul>
  /// <li>
  /// <code>ADDITION_IN_PROGRESS</code> – The user is currently being added to the
  /// permission group.
  /// </li>
  /// <li>
  /// <code>ADDITION_SUCCESS</code> – The user is successfully added to the
  /// permission group.
  /// </li>
  /// <li>
  /// <code>REMOVAL_IN_PROGRESS</code> – The user is currently being removed from
  /// the permission group.
  /// </li>
  /// </ul>
  final PermissionGroupMembershipStatus? membershipStatus;

  /// The name of the permission group.
  final String? name;

  /// The unique identifier for the permission group.
  final String? permissionGroupId;

  PermissionGroup({
    this.applicationPermissions,
    this.createTime,
    this.description,
    this.lastModifiedTime,
    this.membershipStatus,
    this.name,
    this.permissionGroupId,
  });

  factory PermissionGroup.fromJson(Map<String, dynamic> json) {
    return PermissionGroup(
      applicationPermissions: (json['applicationPermissions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toApplicationPermission())
          .toList(),
      createTime: json['createTime'] as int?,
      description: json['description'] as String?,
      lastModifiedTime: json['lastModifiedTime'] as int?,
      membershipStatus: (json['membershipStatus'] as String?)
          ?.toPermissionGroupMembershipStatus(),
      name: json['name'] as String?,
      permissionGroupId: json['permissionGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationPermissions = this.applicationPermissions;
    final createTime = this.createTime;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final membershipStatus = this.membershipStatus;
    final name = this.name;
    final permissionGroupId = this.permissionGroupId;
    return {
      if (applicationPermissions != null)
        'applicationPermissions':
            applicationPermissions.map((e) => e.toValue()).toList(),
      if (createTime != null) 'createTime': createTime,
      if (description != null) 'description': description,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (membershipStatus != null)
        'membershipStatus': membershipStatus.toValue(),
      if (name != null) 'name': name,
      if (permissionGroupId != null) 'permissionGroupId': permissionGroupId,
    };
  }
}

/// The structure of a permission group associated with a user.
class PermissionGroupByUser {
  /// Indicates the status of the user within a permission group.
  ///
  /// <ul>
  /// <li>
  /// <code>ADDITION_IN_PROGRESS</code> – The user is currently being added to the
  /// permission group.
  /// </li>
  /// <li>
  /// <code>ADDITION_SUCCESS</code> – The user is successfully added to the
  /// permission group.
  /// </li>
  /// <li>
  /// <code>REMOVAL_IN_PROGRESS</code> – The user is currently being removed from
  /// the permission group.
  /// </li>
  /// </ul>
  final PermissionGroupMembershipStatus? membershipStatus;

  /// The name of the permission group.
  final String? name;

  /// The unique identifier for the permission group.
  final String? permissionGroupId;

  PermissionGroupByUser({
    this.membershipStatus,
    this.name,
    this.permissionGroupId,
  });

  factory PermissionGroupByUser.fromJson(Map<String, dynamic> json) {
    return PermissionGroupByUser(
      membershipStatus: (json['membershipStatus'] as String?)
          ?.toPermissionGroupMembershipStatus(),
      name: json['name'] as String?,
      permissionGroupId: json['permissionGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final membershipStatus = this.membershipStatus;
    final name = this.name;
    final permissionGroupId = this.permissionGroupId;
    return {
      if (membershipStatus != null)
        'membershipStatus': membershipStatus.toValue(),
      if (name != null) 'name': name,
      if (permissionGroupId != null) 'permissionGroupId': permissionGroupId,
    };
  }
}

enum PermissionGroupMembershipStatus {
  additionInProgress,
  additionSuccess,
  removalInProgress,
}

extension PermissionGroupMembershipStatusValueExtension
    on PermissionGroupMembershipStatus {
  String toValue() {
    switch (this) {
      case PermissionGroupMembershipStatus.additionInProgress:
        return 'ADDITION_IN_PROGRESS';
      case PermissionGroupMembershipStatus.additionSuccess:
        return 'ADDITION_SUCCESS';
      case PermissionGroupMembershipStatus.removalInProgress:
        return 'REMOVAL_IN_PROGRESS';
    }
  }
}

extension PermissionGroupMembershipStatusFromString on String {
  PermissionGroupMembershipStatus toPermissionGroupMembershipStatus() {
    switch (this) {
      case 'ADDITION_IN_PROGRESS':
        return PermissionGroupMembershipStatus.additionInProgress;
      case 'ADDITION_SUCCESS':
        return PermissionGroupMembershipStatus.additionSuccess;
      case 'REMOVAL_IN_PROGRESS':
        return PermissionGroupMembershipStatus.removalInProgress;
    }
    throw Exception(
        '$this is not known in enum PermissionGroupMembershipStatus');
  }
}

/// Permission group parameters for Dataset permissions.
///
/// Here is an example of how you could specify the
/// <code>PermissionGroupParams</code>:
///
/// <code> { "permissionGroupId": "0r6fCRtSTUk4XPfXQe3M0g",
/// "datasetPermissions": [ {"permission": "ViewDatasetDetails"}, {"permission":
/// "AddDatasetData"}, {"permission": "EditDatasetMetadata"}, {"permission":
/// "DeleteDataset"} ] } </code>
class PermissionGroupParams {
  /// List of resource permissions.
  final List<ResourcePermission>? datasetPermissions;

  /// The unique identifier for the <code>PermissionGroup</code>.
  final String? permissionGroupId;

  PermissionGroupParams({
    this.datasetPermissions,
    this.permissionGroupId,
  });

  Map<String, dynamic> toJson() {
    final datasetPermissions = this.datasetPermissions;
    final permissionGroupId = this.permissionGroupId;
    return {
      if (datasetPermissions != null) 'datasetPermissions': datasetPermissions,
      if (permissionGroupId != null) 'permissionGroupId': permissionGroupId,
    };
  }
}

class ResetUserPasswordResponse {
  /// A randomly generated temporary password for the requested user. This
  /// password expires in 7 days.
  final String? temporaryPassword;

  /// The unique identifier of the user that a new password is generated for.
  final String? userId;

  ResetUserPasswordResponse({
    this.temporaryPassword,
    this.userId,
  });

  factory ResetUserPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetUserPasswordResponse(
      temporaryPassword: json['temporaryPassword'] as String?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final temporaryPassword = this.temporaryPassword;
    final userId = this.userId;
    return {
      if (temporaryPassword != null) 'temporaryPassword': temporaryPassword,
      if (userId != null) 'userId': userId,
    };
  }
}

/// Resource permission for a dataset. When you create a dataset, all the other
/// members of the same user group inherit access to the dataset. You can only
/// create a dataset if your user group has application permission for Create
/// Datasets.
///
/// The following is a list of valid dataset permissions that you can apply:
///
/// <ul>
/// <li>
/// <code>ViewDatasetDetails</code>
/// </li>
/// <li>
/// <code>ReadDatasetDetails</code>
/// </li>
/// <li>
/// <code>AddDatasetData</code>
/// </li>
/// <li>
/// <code>CreateDataView</code>
/// </li>
/// <li>
/// <code>EditDatasetMetadata</code>
/// </li>
/// <li>
/// <code>DeleteDataset</code>
/// </li>
/// </ul>
/// For more information on the dataset permissions, see <a
/// href="https://docs.aws.amazon.com/finspace/latest/userguide/managing-user-permissions.html#supported-dataset-permissions">Supported
/// Dataset Permissions</a> in the FinSpace User Guide.
class ResourcePermission {
  /// Permission for a resource.
  final String? permission;

  ResourcePermission({
    this.permission,
  });

  Map<String, dynamic> toJson() {
    final permission = this.permission;
    return {
      if (permission != null) 'permission': permission,
    };
  }
}

/// The location of an external Dataview in an S3 bucket.
class S3Location {
  /// The name of the S3 bucket.
  final String bucket;

  /// The path of the folder, within the S3 bucket that contains the Dataset.
  final String key;

  S3Location({
    required this.bucket,
    required this.key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String,
      key: json['key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'bucket': bucket,
      'key': key,
    };
  }
}

/// Definition for a schema on a tabular Dataset.
class SchemaDefinition {
  /// List of column definitions.
  final List<ColumnDefinition>? columns;

  /// List of column names used for primary key.
  final List<String>? primaryKeyColumns;

  SchemaDefinition({
    this.columns,
    this.primaryKeyColumns,
  });

  factory SchemaDefinition.fromJson(Map<String, dynamic> json) {
    return SchemaDefinition(
      columns: (json['columns'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryKeyColumns: (json['primaryKeyColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    final primaryKeyColumns = this.primaryKeyColumns;
    return {
      if (columns != null) 'columns': columns,
      if (primaryKeyColumns != null) 'primaryKeyColumns': primaryKeyColumns,
    };
  }
}

/// A union of schema types.
class SchemaUnion {
  /// The configuration for a schema on a tabular Dataset.
  final SchemaDefinition? tabularSchemaConfig;

  SchemaUnion({
    this.tabularSchemaConfig,
  });

  factory SchemaUnion.fromJson(Map<String, dynamic> json) {
    return SchemaUnion(
      tabularSchemaConfig: json['tabularSchemaConfig'] != null
          ? SchemaDefinition.fromJson(
              json['tabularSchemaConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tabularSchemaConfig = this.tabularSchemaConfig;
    return {
      if (tabularSchemaConfig != null)
        'tabularSchemaConfig': tabularSchemaConfig,
    };
  }
}

/// The response from a update changeset operation.
class UpdateChangesetResponse {
  /// The unique identifier for the Changeset to update.
  final String? changesetId;

  /// The unique identifier for the FinSpace Dataset in which the Changeset is
  /// created.
  final String? datasetId;

  UpdateChangesetResponse({
    this.changesetId,
    this.datasetId,
  });

  factory UpdateChangesetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChangesetResponse(
      changesetId: json['changesetId'] as String?,
      datasetId: json['datasetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changesetId = this.changesetId;
    final datasetId = this.datasetId;
    return {
      if (changesetId != null) 'changesetId': changesetId,
      if (datasetId != null) 'datasetId': datasetId,
    };
  }
}

/// The response from an UpdateDataset operation
class UpdateDatasetResponse {
  /// The unique identifier for updated Dataset.
  final String? datasetId;

  UpdateDatasetResponse({
    this.datasetId,
  });

  factory UpdateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDatasetResponse(
      datasetId: json['datasetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetId = this.datasetId;
    return {
      if (datasetId != null) 'datasetId': datasetId,
    };
  }
}

class UpdatePermissionGroupResponse {
  /// The unique identifier for the updated permission group.
  final String? permissionGroupId;

  UpdatePermissionGroupResponse({
    this.permissionGroupId,
  });

  factory UpdatePermissionGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePermissionGroupResponse(
      permissionGroupId: json['permissionGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionGroupId = this.permissionGroupId;
    return {
      if (permissionGroupId != null) 'permissionGroupId': permissionGroupId,
    };
  }
}

class UpdateUserResponse {
  /// The unique identifier of the updated user.
  final String? userId;

  UpdateUserResponse({
    this.userId,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'userId': userId,
    };
  }
}

/// The details of the user.
class User {
  /// Indicates whether the user can use the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain credentials that
  /// can then be used to access other FinSpace Data API operations.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – The user has permissions to use the APIs.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user does not have permissions to use any APIs.
  /// </li>
  /// </ul>
  final ApiAccess? apiAccess;

  /// The ARN identifier of an AWS user or role that is allowed to call the
  /// <code>GetProgrammaticAccessCredentials</code> API to obtain a credentials
  /// token for a specific FinSpace user. This must be an IAM role within your
  /// FinSpace account.
  final String? apiAccessPrincipalArn;

  /// The timestamp at which the user was created in FinSpace. The value is
  /// determined as epoch time in milliseconds.
  final int? createTime;

  /// The email address of the user. The email address serves as a uniquer
  /// identifier for each user and cannot be changed after it's created.
  final String? emailAddress;

  /// The first name of the user.
  final String? firstName;

  /// Describes the last time the user was deactivated. The value is determined as
  /// epoch time in milliseconds.
  final int? lastDisabledTime;

  /// Describes the last time the user was activated. The value is determined as
  /// epoch time in milliseconds.
  final int? lastEnabledTime;

  /// Describes the last time that the user logged into their account. The value
  /// is determined as epoch time in milliseconds.
  final int? lastLoginTime;

  /// Describes the last time the user was updated. The value is determined as
  /// epoch time in milliseconds.
  final int? lastModifiedTime;

  /// The last name of the user.
  final String? lastName;

  /// The current status of the user.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The user creation is in progress.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> – The user is created and is currently active.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user is currently inactive.
  /// </li>
  /// </ul>
  final UserStatus? status;

  /// Indicates the type of user.
  ///
  /// <ul>
  /// <li>
  /// <code>SUPER_USER</code> – A user with permission to all the functionality
  /// and data in FinSpace.
  /// </li>
  /// <li>
  /// <code>APP_USER</code> – A user with specific permissions in FinSpace. The
  /// users are assigned permissions by adding them to a permission group.
  /// </li>
  /// </ul>
  final UserType? type;

  /// The unique identifier for the user.
  final String? userId;

  User({
    this.apiAccess,
    this.apiAccessPrincipalArn,
    this.createTime,
    this.emailAddress,
    this.firstName,
    this.lastDisabledTime,
    this.lastEnabledTime,
    this.lastLoginTime,
    this.lastModifiedTime,
    this.lastName,
    this.status,
    this.type,
    this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      apiAccess: (json['apiAccess'] as String?)?.toApiAccess(),
      apiAccessPrincipalArn: json['apiAccessPrincipalArn'] as String?,
      createTime: json['createTime'] as int?,
      emailAddress: json['emailAddress'] as String?,
      firstName: json['firstName'] as String?,
      lastDisabledTime: json['lastDisabledTime'] as int?,
      lastEnabledTime: json['lastEnabledTime'] as int?,
      lastLoginTime: json['lastLoginTime'] as int?,
      lastModifiedTime: json['lastModifiedTime'] as int?,
      lastName: json['lastName'] as String?,
      status: (json['status'] as String?)?.toUserStatus(),
      type: (json['type'] as String?)?.toUserType(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiAccess = this.apiAccess;
    final apiAccessPrincipalArn = this.apiAccessPrincipalArn;
    final createTime = this.createTime;
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final lastDisabledTime = this.lastDisabledTime;
    final lastEnabledTime = this.lastEnabledTime;
    final lastLoginTime = this.lastLoginTime;
    final lastModifiedTime = this.lastModifiedTime;
    final lastName = this.lastName;
    final status = this.status;
    final type = this.type;
    final userId = this.userId;
    return {
      if (apiAccess != null) 'apiAccess': apiAccess.toValue(),
      if (apiAccessPrincipalArn != null)
        'apiAccessPrincipalArn': apiAccessPrincipalArn,
      if (createTime != null) 'createTime': createTime,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (firstName != null) 'firstName': firstName,
      if (lastDisabledTime != null) 'lastDisabledTime': lastDisabledTime,
      if (lastEnabledTime != null) 'lastEnabledTime': lastEnabledTime,
      if (lastLoginTime != null) 'lastLoginTime': lastLoginTime,
      if (lastModifiedTime != null) 'lastModifiedTime': lastModifiedTime,
      if (lastName != null) 'lastName': lastName,
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (userId != null) 'userId': userId,
    };
  }
}

/// The structure of a user associated with a permission group.
class UserByPermissionGroup {
  /// Indicates whether the user can access FinSpace API operations.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> – The user has permissions to use the API operations.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user does not have permissions to use any API
  /// operations.
  /// </li>
  /// </ul>
  final ApiAccess? apiAccess;

  /// The IAM ARN identifier that is attached to FinSpace API calls.
  final String? apiAccessPrincipalArn;

  /// The email address of the user. The email address serves as a unique
  /// identifier for each user and cannot be changed after it's created.
  final String? emailAddress;

  /// The first name of the user.
  final String? firstName;

  /// The last name of the user.
  final String? lastName;

  /// Indicates the status of the user within a permission group.
  ///
  /// <ul>
  /// <li>
  /// <code>ADDITION_IN_PROGRESS</code> – The user is currently being added to the
  /// permission group.
  /// </li>
  /// <li>
  /// <code>ADDITION_SUCCESS</code> – The user is successfully added to the
  /// permission group.
  /// </li>
  /// <li>
  /// <code>REMOVAL_IN_PROGRESS</code> – The user is currently being removed from
  /// the permission group.
  /// </li>
  /// </ul>
  final PermissionGroupMembershipStatus? membershipStatus;

  /// The current status of the user.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> – The user creation is in progress.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> – The user is created and is currently active.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> – The user is currently inactive.
  /// </li>
  /// </ul>
  final UserStatus? status;

  /// Indicates the type of user.
  ///
  /// <ul>
  /// <li>
  /// <code>SUPER_USER</code> – A user with permission to all the functionality
  /// and data in FinSpace.
  /// </li>
  /// <li>
  /// <code>APP_USER</code> – A user with specific permissions in FinSpace. The
  /// users are assigned permissions by adding them to a permission group.
  /// </li>
  /// </ul>
  final UserType? type;

  /// The unique identifier for the user.
  final String? userId;

  UserByPermissionGroup({
    this.apiAccess,
    this.apiAccessPrincipalArn,
    this.emailAddress,
    this.firstName,
    this.lastName,
    this.membershipStatus,
    this.status,
    this.type,
    this.userId,
  });

  factory UserByPermissionGroup.fromJson(Map<String, dynamic> json) {
    return UserByPermissionGroup(
      apiAccess: (json['apiAccess'] as String?)?.toApiAccess(),
      apiAccessPrincipalArn: json['apiAccessPrincipalArn'] as String?,
      emailAddress: json['emailAddress'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      membershipStatus: (json['membershipStatus'] as String?)
          ?.toPermissionGroupMembershipStatus(),
      status: (json['status'] as String?)?.toUserStatus(),
      type: (json['type'] as String?)?.toUserType(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiAccess = this.apiAccess;
    final apiAccessPrincipalArn = this.apiAccessPrincipalArn;
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final membershipStatus = this.membershipStatus;
    final status = this.status;
    final type = this.type;
    final userId = this.userId;
    return {
      if (apiAccess != null) 'apiAccess': apiAccess.toValue(),
      if (apiAccessPrincipalArn != null)
        'apiAccessPrincipalArn': apiAccessPrincipalArn,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (membershipStatus != null)
        'membershipStatus': membershipStatus.toValue(),
      if (status != null) 'status': status.toValue(),
      if (type != null) 'type': type.toValue(),
      if (userId != null) 'userId': userId,
    };
  }
}

enum UserStatus {
  creating,
  enabled,
  disabled,
}

extension UserStatusValueExtension on UserStatus {
  String toValue() {
    switch (this) {
      case UserStatus.creating:
        return 'CREATING';
      case UserStatus.enabled:
        return 'ENABLED';
      case UserStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension UserStatusFromString on String {
  UserStatus toUserStatus() {
    switch (this) {
      case 'CREATING':
        return UserStatus.creating;
      case 'ENABLED':
        return UserStatus.enabled;
      case 'DISABLED':
        return UserStatus.disabled;
    }
    throw Exception('$this is not known in enum UserStatus');
  }
}

enum UserType {
  superUser,
  appUser,
}

extension UserTypeValueExtension on UserType {
  String toValue() {
    switch (this) {
      case UserType.superUser:
        return 'SUPER_USER';
      case UserType.appUser:
        return 'APP_USER';
    }
  }
}

extension UserTypeFromString on String {
  UserType toUserType() {
    switch (this) {
      case 'SUPER_USER':
        return UserType.superUser;
      case 'APP_USER':
        return UserType.appUser;
    }
    throw Exception('$this is not known in enum UserType');
  }
}

enum LocationType {
  ingestion,
  sagemaker,
}

extension LocationTypeValueExtension on LocationType {
  String toValue() {
    switch (this) {
      case LocationType.ingestion:
        return 'INGESTION';
      case LocationType.sagemaker:
        return 'SAGEMAKER';
    }
  }
}

extension LocationTypeFromString on String {
  LocationType toLocationType() {
    switch (this) {
      case 'INGESTION':
        return LocationType.ingestion;
      case 'SAGEMAKER':
        return LocationType.sagemaker;
    }
    throw Exception('$this is not known in enum LocationType');
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

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
