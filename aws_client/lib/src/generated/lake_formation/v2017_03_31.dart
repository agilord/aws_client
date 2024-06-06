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

/// Defines the public endpoint for the Lake Formation service.
class LakeFormation {
  final _s.RestJsonProtocol _protocol;
  LakeFormation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lakeformation',
            signingName: 'lakeformation',
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

  /// Attaches one or more LF-tags to an existing resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [lFTags] :
  /// The LF-tags to attach to the resource.
  ///
  /// Parameter [resource] :
  /// The database, table, or column resource to which to attach an LF-tag.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<AddLFTagsToResourceResponse> addLFTagsToResource({
    required List<LFTagPair> lFTags,
    required Resource resource,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'LFTags': lFTags,
      'Resource': resource,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AddLFTagsToResource',
      exceptionFnMap: _exceptionFns,
    );
    return AddLFTagsToResourceResponse.fromJson(response);
  }

  /// Allows a caller to assume an IAM role decorated as the SAML user specified
  /// in the SAML assertion included in the request. This decoration allows Lake
  /// Formation to enforce access policies against the SAML users and groups.
  /// This API operation requires SAML federation setup in the caller’s account
  /// as it can only be called with valid SAML assertions. Lake Formation does
  /// not scope down the permission of the assumed role. All permissions
  /// attached to the role via the SAML federation setup will be included in the
  /// role session.
  ///
  /// This decorated role is expected to access data in Amazon S3 by getting
  /// temporary access from Lake Formation which is authorized via the virtual
  /// API <code>GetDataAccess</code>. Therefore, all SAML roles that can be
  /// assumed via <code>AssumeDecoratedRoleWithSAML</code> must at a minimum
  /// include <code>lakeformation:GetDataAccess</code> in their role policies. A
  /// typical IAM policy attached to such a role would look as follows:
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [principalArn] :
  /// The Amazon Resource Name (ARN) of the SAML provider in IAM that describes
  /// the IdP.
  ///
  /// Parameter [roleArn] :
  /// The role that represents an IAM principal whose scope down policy allows
  /// it to call credential vending APIs such as
  /// <code>GetTemporaryTableCredentials</code>. The caller must also have
  /// iam:PassRole permission on this role.
  ///
  /// Parameter [sAMLAssertion] :
  /// A SAML assertion consisting of an assertion statement for the user who
  /// needs temporary credentials. This must match the SAML assertion that was
  /// issued to IAM. This must be Base64 encoded.
  ///
  /// Parameter [durationSeconds] :
  /// The time period, between 900 and 43,200 seconds, for the timeout of the
  /// temporary credentials.
  Future<AssumeDecoratedRoleWithSAMLResponse> assumeDecoratedRoleWithSAML({
    required String principalArn,
    required String roleArn,
    required String sAMLAssertion,
    int? durationSeconds,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      'PrincipalArn': principalArn,
      'RoleArn': roleArn,
      'SAMLAssertion': sAMLAssertion,
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AssumeDecoratedRoleWithSAML',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeDecoratedRoleWithSAMLResponse.fromJson(response);
  }

  /// Batch operation to grant permissions to the principal.
  ///
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [entries] :
  /// A list of up to 20 entries for resource permissions to be granted by batch
  /// operation to the principal.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<BatchGrantPermissionsResponse> batchGrantPermissions({
    required List<BatchPermissionsRequestEntry> entries,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'Entries': entries,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGrantPermissions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGrantPermissionsResponse.fromJson(response);
  }

  /// Batch operation to revoke permissions from the principal.
  ///
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [entries] :
  /// A list of up to 20 entries for resource permissions to be revoked by batch
  /// operation to the principal.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<BatchRevokePermissionsResponse> batchRevokePermissions({
    required List<BatchPermissionsRequestEntry> entries,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'Entries': entries,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchRevokePermissions',
      exceptionFnMap: _exceptionFns,
    );
    return BatchRevokePermissionsResponse.fromJson(response);
  }

  /// Attempts to cancel the specified transaction. Returns an exception if the
  /// transaction was previously committed.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [TransactionCommittedException].
  /// May throw [TransactionCommitInProgressException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [transactionId] :
  /// The transaction to cancel.
  Future<void> cancelTransaction({
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'TransactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CancelTransaction',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Attempts to commit the specified transaction. Returns an exception if the
  /// transaction was previously aborted. This API action is idempotent if
  /// called multiple times for the same transaction.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [TransactionCanceledException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [transactionId] :
  /// The transaction to commit.
  Future<CommitTransactionResponse> commitTransaction({
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'TransactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CommitTransaction',
      exceptionFnMap: _exceptionFns,
    );
    return CommitTransactionResponse.fromJson(response);
  }

  /// Creates a data cell filter to allow one to grant access to certain columns
  /// on certain rows.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tableData] :
  /// A <code>DataCellsFilter</code> structure containing information about the
  /// data cells filter.
  Future<void> createDataCellsFilter({
    required DataCellsFilter tableData,
  }) async {
    final $payload = <String, dynamic>{
      'TableData': tableData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateDataCellsFilter',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an LF-tag with the specified name and values.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the LF-tag.
  ///
  /// Parameter [tagValues] :
  /// A list of possible values an attribute can take.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<void> createLFTag({
    required String tagKey,
    required List<String> tagValues,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'TagKey': tagKey,
      'TagValues': tagValues,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLFTag',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an IAM Identity Center connection with Lake Formation to allow IAM
  /// Identity Center users and groups to access Data Catalog resources.
  ///
  /// May throw [InvalidInputException].
  /// May throw [AlreadyExistsException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, view definitions, and other control
  /// information to manage your Lake Formation environment.
  ///
  /// Parameter [externalFiltering] :
  /// A list of the account IDs of Amazon Web Services accounts of third-party
  /// applications that are allowed to access data managed by Lake Formation.
  ///
  /// Parameter [instanceArn] :
  /// The ARN of the IAM Identity Center instance for which the operation will
  /// be executed. For more information about ARNs, see Amazon Resource Names
  /// (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web
  /// Services General Reference.
  ///
  /// Parameter [shareRecipients] :
  /// A list of Amazon Web Services account IDs and/or Amazon Web Services
  /// organization/organizational unit ARNs that are allowed to access data
  /// managed by Lake Formation.
  ///
  /// If the <code>ShareRecipients</code> list includes valid values, a resource
  /// share is created with the principals you want to have access to the
  /// resources.
  ///
  /// If the <code>ShareRecipients</code> value is null or the list is empty, no
  /// resource share is created.
  Future<CreateLakeFormationIdentityCenterConfigurationResponse>
      createLakeFormationIdentityCenterConfiguration({
    String? catalogId,
    ExternalFilteringConfiguration? externalFiltering,
    String? instanceArn,
    List<DataLakePrincipal>? shareRecipients,
  }) async {
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
      if (externalFiltering != null) 'ExternalFiltering': externalFiltering,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (shareRecipients != null) 'ShareRecipients': shareRecipients,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLakeFormationIdentityCenterConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLakeFormationIdentityCenterConfigurationResponse.fromJson(
        response);
  }

  /// Enforce Lake Formation permissions for the given databases, tables, and
  /// principals.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  Future<void> createLakeFormationOptIn({
    required DataLakePrincipal principal,
    required Resource resource,
  }) async {
    final $payload = <String, dynamic>{
      'Principal': principal,
      'Resource': resource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLakeFormationOptIn',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a data cell filter.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [databaseName] :
  /// A database in the Glue Data Catalog.
  ///
  /// Parameter [name] :
  /// The name given by the user to the data filter cell.
  ///
  /// Parameter [tableCatalogId] :
  /// The ID of the catalog to which the table belongs.
  ///
  /// Parameter [tableName] :
  /// A table in the database.
  Future<void> deleteDataCellsFilter({
    String? databaseName,
    String? name,
    String? tableCatalogId,
    String? tableName,
  }) async {
    final $payload = <String, dynamic>{
      if (databaseName != null) 'DatabaseName': databaseName,
      if (name != null) 'Name': name,
      if (tableCatalogId != null) 'TableCatalogId': tableCatalogId,
      if (tableName != null) 'TableName': tableName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteDataCellsFilter',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified LF-tag given a key name. If the input parameter tag
  /// key was not found, then the operation will throw an exception. When you
  /// delete an LF-tag, the <code>LFTagPolicy</code> attached to the LF-tag
  /// becomes invalid. If the deleted LF-tag was still assigned to any resource,
  /// the tag policy attach to the deleted LF-tag will no longer be applied to
  /// the resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the LF-tag to delete.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<void> deleteLFTag({
    required String tagKey,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'TagKey': tagKey,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLFTag',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an IAM Identity Center connection with Lake Formation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, view definition, and other control
  /// information to manage your Lake Formation environment.
  Future<void> deleteLakeFormationIdentityCenterConfiguration({
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLakeFormationIdentityCenterConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove the Lake Formation permissions enforcement of the given databases,
  /// tables, and principals.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  Future<void> deleteLakeFormationOptIn({
    required DataLakePrincipal principal,
    required Resource resource,
  }) async {
    final $payload = <String, dynamic>{
      'Principal': principal,
      'Resource': resource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLakeFormationOptIn',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// For a specific governed table, provides a list of Amazon S3 objects that
  /// will be written during the current transaction and that can be
  /// automatically deleted if the transaction is canceled. Without this call,
  /// no Amazon S3 objects are automatically deleted when a transaction cancels.
  ///
  /// The Glue ETL library function
  /// <code>write_dynamic_frame.from_catalog()</code> includes an option to
  /// automatically call <code>DeleteObjectsOnCancel</code> before writes. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/transactions-data-operations.html#rolling-back-writes">Rolling
  /// Back Amazon S3 Writes</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [TransactionCommittedException].
  /// May throw [TransactionCanceledException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [databaseName] :
  /// The database that contains the governed table.
  ///
  /// Parameter [objects] :
  /// A list of VirtualObject structures, which indicates the Amazon S3 objects
  /// to be deleted if the transaction cancels.
  ///
  /// Parameter [tableName] :
  /// The name of the governed table.
  ///
  /// Parameter [transactionId] :
  /// ID of the transaction that the writes occur in.
  ///
  /// Parameter [catalogId] :
  /// The Glue data catalog that contains the governed table. Defaults to the
  /// current account ID.
  Future<void> deleteObjectsOnCancel({
    required String databaseName,
    required List<VirtualObject> objects,
    required String tableName,
    required String transactionId,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'DatabaseName': databaseName,
      'Objects': objects,
      'TableName': tableName,
      'TransactionId': transactionId,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteObjectsOnCancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters the resource as managed by the Data Catalog.
  ///
  /// When you deregister a path, Lake Formation removes the path from the
  /// inline policy attached to your service-linked role.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to
  /// deregister.
  Future<void> deregisterResource({
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeregisterResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the instance ARN and application ARN for the connection.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<DescribeLakeFormationIdentityCenterConfigurationResponse>
      describeLakeFormationIdentityCenterConfiguration({
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeLakeFormationIdentityCenterConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLakeFormationIdentityCenterConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves the current data access role for the given resource registered
  /// in Lake Formation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN.
  Future<DescribeResourceResponse> describeResource({
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeResource',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeResourceResponse.fromJson(response);
  }

  /// Returns the details of a single transaction.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [transactionId] :
  /// The transaction for which to return status.
  Future<DescribeTransactionResponse> describeTransaction({
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'TransactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeTransaction',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTransactionResponse.fromJson(response);
  }

  /// Indicates to the service that the specified transaction is still active
  /// and should not be treated as idle and aborted.
  ///
  /// Write transactions that remain idle for a long period are automatically
  /// aborted unless explicitly extended.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [TransactionCommittedException].
  /// May throw [TransactionCanceledException].
  /// May throw [TransactionCommitInProgressException].
  ///
  /// Parameter [transactionId] :
  /// The transaction to extend.
  Future<void> extendTransaction({
    String? transactionId,
  }) async {
    final $payload = <String, dynamic>{
      if (transactionId != null) 'TransactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ExtendTransaction',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a data cells filter.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [databaseName] :
  /// A database in the Glue Data Catalog.
  ///
  /// Parameter [name] :
  /// The name given by the user to the data filter cell.
  ///
  /// Parameter [tableCatalogId] :
  /// The ID of the catalog to which the table belongs.
  ///
  /// Parameter [tableName] :
  /// A table in the database.
  Future<GetDataCellsFilterResponse> getDataCellsFilter({
    required String databaseName,
    required String name,
    required String tableCatalogId,
    required String tableName,
  }) async {
    final $payload = <String, dynamic>{
      'DatabaseName': databaseName,
      'Name': name,
      'TableCatalogId': tableCatalogId,
      'TableName': tableName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetDataCellsFilter',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataCellsFilterResponse.fromJson(response);
  }

  /// Returns the identity of the invoking principal.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  Future<GetDataLakePrincipalResponse> getDataLakePrincipal() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetDataLakePrincipal',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakePrincipalResponse.fromJson(response);
  }

  /// Retrieves the list of the data lake administrators of a Lake
  /// Formation-managed data lake.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<GetDataLakeSettingsResponse> getDataLakeSettings({
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetDataLakeSettings',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataLakeSettingsResponse.fromJson(response);
  }

  /// Returns the Lake Formation permissions for a specified table or database
  /// resource located at a path in Amazon S3.
  /// <code>GetEffectivePermissionsForPath</code> will not return databases and
  /// tables if the catalog is encrypted.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to get
  /// permissions.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  Future<GetEffectivePermissionsForPathResponse>
      getEffectivePermissionsForPath({
    required String resourceArn,
    String? catalogId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetEffectivePermissionsForPath',
      exceptionFnMap: _exceptionFns,
    );
    return GetEffectivePermissionsForPathResponse.fromJson(response);
  }

  /// Returns an LF-tag definition.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the LF-tag.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<GetLFTagResponse> getLFTag({
    required String tagKey,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'TagKey': tagKey,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetLFTag',
      exceptionFnMap: _exceptionFns,
    );
    return GetLFTagResponse.fromJson(response);
  }

  /// Returns the state of a query previously submitted. Clients are expected to
  /// poll <code>GetQueryState</code> to monitor the current state of the
  /// planning before retrieving the work units. A query state is only visible
  /// to the principal that made the initial call to
  /// <code>StartQueryPlanning</code>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [queryId] :
  /// The ID of the plan query operation.
  Future<GetQueryStateResponse> getQueryState({
    required String queryId,
  }) async {
    final $payload = <String, dynamic>{
      'QueryId': queryId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetQueryState',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryStateResponse.fromJson(response);
  }

  /// Retrieves statistics on the planning and execution of a query.
  ///
  /// May throw [StatisticsNotReadyYetException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [ExpiredException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [queryId] :
  /// The ID of the plan query operation.
  Future<GetQueryStatisticsResponse> getQueryStatistics({
    required String queryId,
  }) async {
    final $payload = <String, dynamic>{
      'QueryId': queryId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetQueryStatistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueryStatisticsResponse.fromJson(response);
  }

  /// Returns the LF-tags applied to a resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resource] :
  /// The database, table, or column resource for which you want to return
  /// LF-tags.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [showAssignedLFTags] :
  /// Indicates whether to show the assigned LF-tags.
  Future<GetResourceLFTagsResponse> getResourceLFTags({
    required Resource resource,
    String? catalogId,
    bool? showAssignedLFTags,
  }) async {
    final $payload = <String, dynamic>{
      'Resource': resource,
      if (catalogId != null) 'CatalogId': catalogId,
      if (showAssignedLFTags != null) 'ShowAssignedLFTags': showAssignedLFTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetResourceLFTags',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceLFTagsResponse.fromJson(response);
  }

  /// Returns the set of Amazon S3 objects that make up the specified governed
  /// table. A transaction ID or timestamp can be specified for time-travel
  /// queries.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [TransactionCommittedException].
  /// May throw [TransactionCanceledException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [databaseName] :
  /// The database containing the governed table.
  ///
  /// Parameter [tableName] :
  /// The governed table for which to retrieve objects.
  ///
  /// Parameter [catalogId] :
  /// The catalog containing the governed table. Defaults to the caller’s
  /// account.
  ///
  /// Parameter [maxResults] :
  /// Specifies how many values to return in a page.
  ///
  /// Parameter [nextToken] :
  /// A continuation token if this is not the first call to retrieve these
  /// objects.
  ///
  /// Parameter [partitionPredicate] :
  /// A predicate to filter the objects returned based on the partition keys
  /// defined in the governed table.
  ///
  /// <ul>
  /// <li>
  /// The comparison operators supported are: =, &gt;, &lt;, &gt;=, &lt;=
  /// </li>
  /// <li>
  /// The logical operators supported are: AND
  /// </li>
  /// <li>
  /// The data types supported are integer, long, date(yyyy-MM-dd),
  /// timestamp(yyyy-MM-dd HH:mm:ssXXX or yyyy-MM-dd HH:mm:ss"), string and
  /// decimal.
  /// </li>
  /// </ul>
  ///
  /// Parameter [queryAsOfTime] :
  /// The time as of when to read the governed table contents. If not set, the
  /// most recent transaction commit time is used. Cannot be specified along
  /// with <code>TransactionId</code>.
  ///
  /// Parameter [transactionId] :
  /// The transaction ID at which to read the governed table contents. If this
  /// transaction has aborted, an error is returned. If not set, defaults to the
  /// most recent committed transaction. Cannot be specified along with
  /// <code>QueryAsOfTime</code>.
  Future<GetTableObjectsResponse> getTableObjects({
    required String databaseName,
    required String tableName,
    String? catalogId,
    int? maxResults,
    String? nextToken,
    String? partitionPredicate,
    DateTime? queryAsOfTime,
    String? transactionId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'DatabaseName': databaseName,
      'TableName': tableName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (partitionPredicate != null) 'PartitionPredicate': partitionPredicate,
      if (queryAsOfTime != null)
        'QueryAsOfTime': unixTimestampToJson(queryAsOfTime),
      if (transactionId != null) 'TransactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTableObjects',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableObjectsResponse.fromJson(response);
  }

  /// This API is identical to <code>GetTemporaryTableCredentials</code> except
  /// that this is used when the target Data Catalog resource is of type
  /// Partition. Lake Formation restricts the permission of the vended
  /// credentials with the same scope down policy which restricts access to a
  /// single Amazon S3 prefix.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [PermissionTypeMismatchException].
  ///
  /// Parameter [partition] :
  /// A list of partition values identifying a single partition.
  ///
  /// Parameter [tableArn] :
  /// The ARN of the partitions' table.
  ///
  /// Parameter [auditContext] :
  /// A structure representing context to access a resource (column names, query
  /// ID, etc).
  ///
  /// Parameter [durationSeconds] :
  /// The time period, between 900 and 21,600 seconds, for the timeout of the
  /// temporary credentials.
  ///
  /// Parameter [permissions] :
  /// Filters the request based on the user having been granted a list of
  /// specified permissions on the requested resource(s).
  ///
  /// Parameter [supportedPermissionTypes] :
  /// A list of supported permission types for the partition. Valid values are
  /// <code>COLUMN_PERMISSION</code> and <code>CELL_FILTER_PERMISSION</code>.
  Future<GetTemporaryGluePartitionCredentialsResponse>
      getTemporaryGluePartitionCredentials({
    required PartitionValueList partition,
    required String tableArn,
    AuditContext? auditContext,
    int? durationSeconds,
    List<Permission>? permissions,
    List<PermissionType>? supportedPermissionTypes,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      'Partition': partition,
      'TableArn': tableArn,
      if (auditContext != null) 'AuditContext': auditContext,
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
      if (permissions != null)
        'Permissions': permissions.map((e) => e.toValue()).toList(),
      if (supportedPermissionTypes != null)
        'SupportedPermissionTypes':
            supportedPermissionTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTemporaryGluePartitionCredentials',
      exceptionFnMap: _exceptionFns,
    );
    return GetTemporaryGluePartitionCredentialsResponse.fromJson(response);
  }

  /// Allows a caller in a secure environment to assume a role with permission
  /// to access Amazon S3. In order to vend such credentials, Lake Formation
  /// assumes the role associated with a registered location, for example an
  /// Amazon S3 bucket, with a scope down policy which restricts the access to a
  /// single prefix.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [PermissionTypeMismatchException].
  ///
  /// Parameter [tableArn] :
  /// The ARN identifying a table in the Data Catalog for the temporary
  /// credentials request.
  ///
  /// Parameter [auditContext] :
  /// A structure representing context to access a resource (column names, query
  /// ID, etc).
  ///
  /// Parameter [durationSeconds] :
  /// The time period, between 900 and 21,600 seconds, for the timeout of the
  /// temporary credentials.
  ///
  /// Parameter [permissions] :
  /// Filters the request based on the user having been granted a list of
  /// specified permissions on the requested resource(s).
  ///
  /// Parameter [querySessionContext] :
  /// A structure used as a protocol between query engines and Lake Formation or
  /// Glue. Contains both a Lake Formation generated authorization identifier
  /// and information from the request's authorization context.
  ///
  /// Parameter [s3Path] :
  /// The Amazon S3 path for the table.
  ///
  /// Parameter [supportedPermissionTypes] :
  /// A list of supported permission types for the table. Valid values are
  /// <code>COLUMN_PERMISSION</code> and <code>CELL_FILTER_PERMISSION</code>.
  Future<GetTemporaryGlueTableCredentialsResponse>
      getTemporaryGlueTableCredentials({
    required String tableArn,
    AuditContext? auditContext,
    int? durationSeconds,
    List<Permission>? permissions,
    QuerySessionContext? querySessionContext,
    String? s3Path,
    List<PermissionType>? supportedPermissionTypes,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    final $payload = <String, dynamic>{
      'TableArn': tableArn,
      if (auditContext != null) 'AuditContext': auditContext,
      if (durationSeconds != null) 'DurationSeconds': durationSeconds,
      if (permissions != null)
        'Permissions': permissions.map((e) => e.toValue()).toList(),
      if (querySessionContext != null)
        'QuerySessionContext': querySessionContext,
      if (s3Path != null) 'S3Path': s3Path,
      if (supportedPermissionTypes != null)
        'SupportedPermissionTypes':
            supportedPermissionTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetTemporaryGlueTableCredentials',
      exceptionFnMap: _exceptionFns,
    );
    return GetTemporaryGlueTableCredentialsResponse.fromJson(response);
  }

  /// Returns the work units resulting from the query. Work units can be
  /// executed in any order and in parallel.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [ExpiredException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [queryId] :
  /// The ID of the plan query operation for which to get results.
  ///
  /// Parameter [workUnitId] :
  /// The work unit ID for which to get results. Value generated by enumerating
  /// <code>WorkUnitIdMin</code> to <code>WorkUnitIdMax</code> (inclusive) from
  /// the <code>WorkUnitRange</code> in the output of <code>GetWorkUnits</code>.
  ///
  /// Parameter [workUnitToken] :
  /// A work token used to query the execution service. Token output from
  /// <code>GetWorkUnits</code>.
  Future<GetWorkUnitResultsResponse> getWorkUnitResults({
    required String queryId,
    required int workUnitId,
    required String workUnitToken,
  }) async {
    _s.validateNumRange(
      'workUnitId',
      workUnitId,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'QueryId': queryId,
      'WorkUnitId': workUnitId,
      'WorkUnitToken': workUnitToken,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetWorkUnitResults',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkUnitResultsResponse(
      resultStream: await response.stream.toBytes(),
    );
  }

  /// Retrieves the work units generated by the <code>StartQueryPlanning</code>
  /// operation.
  ///
  /// May throw [WorkUnitsNotReadyYetException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [ExpiredException].
  ///
  /// Parameter [queryId] :
  /// The ID of the plan query operation.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  ///
  /// Parameter [pageSize] :
  /// The size of each page to get in the Amazon Web Services service call. This
  /// does not affect the number of items returned in the command's output.
  /// Setting a smaller page size results in more calls to the Amazon Web
  /// Services service, retrieving fewer items in each call. This can help
  /// prevent the Amazon Web Services service calls from timing out.
  Future<GetWorkUnitsResponse> getWorkUnits({
    required String queryId,
    String? nextToken,
    int? pageSize,
  }) async {
    final $payload = <String, dynamic>{
      'QueryId': queryId,
      if (nextToken != null) 'NextToken': nextToken,
      if (pageSize != null) 'PageSize': pageSize,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetWorkUnits',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkUnitsResponse.fromJson(response);
  }

  /// Grants permissions to the principal to access metadata in the Data Catalog
  /// and data organized in underlying data storage such as Amazon S3.
  ///
  /// For information about permissions, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/security-data-access.html">Security
  /// and Access Control to Metadata and Data</a>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [permissions] :
  /// The permissions granted to the principal on the resource. Lake Formation
  /// defines privileges to grant and revoke access to metadata in the Data
  /// Catalog and data organized in underlying data storage such as Amazon S3.
  /// Lake Formation requires that each principal be authorized to perform a
  /// specific task on Lake Formation resources.
  ///
  /// Parameter [principal] :
  /// The principal to be granted the permissions on the resource. Supported
  /// principals are IAM users or IAM roles, and they are defined by their
  /// principal type and their ARN.
  ///
  /// Note that if you define a resource with a particular ARN, then later
  /// delete, and recreate a resource with that same ARN, the resource maintains
  /// the permissions already granted.
  ///
  /// Parameter [resource] :
  /// The resource to which permissions are to be granted. Resources in Lake
  /// Formation are the Data Catalog, databases, and tables.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [permissionsWithGrantOption] :
  /// Indicates a list of the granted permissions that the principal may pass to
  /// other users. These permissions may only be a subset of the permissions
  /// granted in the <code>Privileges</code>.
  Future<void> grantPermissions({
    required List<Permission> permissions,
    required DataLakePrincipal principal,
    required Resource resource,
    String? catalogId,
    List<Permission>? permissionsWithGrantOption,
  }) async {
    final $payload = <String, dynamic>{
      'Permissions': permissions.map((e) => e.toValue()).toList(),
      'Principal': principal,
      'Resource': resource,
      if (catalogId != null) 'CatalogId': catalogId,
      if (permissionsWithGrantOption != null)
        'PermissionsWithGrantOption':
            permissionsWithGrantOption.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GrantPermissions',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all the data cell filters on a table.
  ///
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum size of the response.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  ///
  /// Parameter [table] :
  /// A table in the Glue Data Catalog.
  Future<ListDataCellsFilterResponse> listDataCellsFilter({
    int? maxResults,
    String? nextToken,
    TableResource? table,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (table != null) 'Table': table,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListDataCellsFilter',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataCellsFilterResponse.fromJson(response);
  }

  /// Lists LF-tags that the requester has permission to view.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  ///
  /// Parameter [resourceShareType] :
  /// If resource share type is <code>ALL</code>, returns both in-account
  /// LF-tags and shared LF-tags that the requester has permission to view. If
  /// resource share type is <code>FOREIGN</code>, returns all share LF-tags
  /// that the requester can view. If no resource share type is passed, lists
  /// LF-tags in the given catalog ID that the requester has permission to view.
  Future<ListLFTagsResponse> listLFTags({
    String? catalogId,
    int? maxResults,
    String? nextToken,
    ResourceShareType? resourceShareType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceShareType != null)
        'ResourceShareType': resourceShareType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLFTags',
      exceptionFnMap: _exceptionFns,
    );
    return ListLFTagsResponse.fromJson(response);
  }

  /// Retrieve the current list of resources and principals that are opt in to
  /// enforce Lake Formation permissions.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  ///
  /// Parameter [resource] :
  /// A structure for the resource.
  Future<ListLakeFormationOptInsResponse> listLakeFormationOptIns({
    int? maxResults,
    String? nextToken,
    DataLakePrincipal? principal,
    Resource? resource,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (principal != null) 'Principal': principal,
      if (resource != null) 'Resource': resource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLakeFormationOptIns',
      exceptionFnMap: _exceptionFns,
    );
    return ListLakeFormationOptInsResponse.fromJson(response);
  }

  /// Returns a list of the principal permissions on the resource, filtered by
  /// the permissions of the caller. For example, if you are granted an ALTER
  /// permission, you are able to see only the principal permissions for ALTER.
  ///
  /// This operation returns only those permissions that have been explicitly
  /// granted.
  ///
  /// For information about permissions, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/security-data-access.html">Security
  /// and Access Control to Metadata and Data</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [includeRelated] :
  /// Indicates that related permissions should be included in the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  ///
  /// Parameter [principal] :
  /// Specifies a principal to filter the permissions returned.
  ///
  /// Parameter [resource] :
  /// A resource where you will get a list of the principal permissions.
  ///
  /// This operation does not support getting privileges on a table with
  /// columns. Instead, call this operation on the table, and the operation
  /// returns the table and the table w columns.
  ///
  /// Parameter [resourceType] :
  /// Specifies a resource type to filter the permissions returned.
  Future<ListPermissionsResponse> listPermissions({
    String? catalogId,
    String? includeRelated,
    int? maxResults,
    String? nextToken,
    DataLakePrincipal? principal,
    Resource? resource,
    DataLakeResourceType? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
      if (includeRelated != null) 'IncludeRelated': includeRelated,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (principal != null) 'Principal': principal,
      if (resource != null) 'Resource': resource,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListPermissions',
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionsResponse.fromJson(response);
  }

  /// Lists the resources registered to be managed by the Data Catalog.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [filterConditionList] :
  /// Any applicable row-level and/or column-level filtering conditions for the
  /// resources.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource results.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve these
  /// resources.
  Future<ListResourcesResponse> listResources({
    List<FilterCondition>? filterConditionList,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filterConditionList != null)
        'FilterConditionList': filterConditionList,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListResources',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcesResponse.fromJson(response);
  }

  /// Returns the configuration of all storage optimizers associated with a
  /// specified table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [databaseName] :
  /// Name of the database where the table is present.
  ///
  /// Parameter [tableName] :
  /// Name of the table.
  ///
  /// Parameter [catalogId] :
  /// The Catalog ID of the table.
  ///
  /// Parameter [maxResults] :
  /// The number of storage optimizers to return on each call.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is a continuation call.
  ///
  /// Parameter [storageOptimizerType] :
  /// The specific type of storage optimizers to list. The supported value is
  /// <code>compaction</code>.
  Future<ListTableStorageOptimizersResponse> listTableStorageOptimizers({
    required String databaseName,
    required String tableName,
    String? catalogId,
    int? maxResults,
    String? nextToken,
    OptimizerType? storageOptimizerType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'DatabaseName': databaseName,
      'TableName': tableName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (storageOptimizerType != null)
        'StorageOptimizerType': storageOptimizerType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTableStorageOptimizers',
      exceptionFnMap: _exceptionFns,
    );
    return ListTableStorageOptimizersResponse.fromJson(response);
  }

  /// Returns metadata about transactions and their status. To prevent the
  /// response from growing indefinitely, only uncommitted transactions and
  /// those available for time-travel queries are returned.
  ///
  /// This operation can help you identify uncommitted transactions or to get
  /// information about transactions.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The catalog for which to list transactions. Defaults to the account ID of
  /// the caller.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of transactions to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A continuation token if this is not the first call to retrieve
  /// transactions.
  ///
  /// Parameter [statusFilter] :
  /// A filter indicating the status of transactions to return. Options are ALL
  /// | COMPLETED | COMMITTED | ABORTED | ACTIVE. The default is
  /// <code>ALL</code>.
  Future<ListTransactionsResponse> listTransactions({
    String? catalogId,
    int? maxResults,
    String? nextToken,
    TransactionStatusFilter? statusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (statusFilter != null) 'StatusFilter': statusFilter.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTransactions',
      exceptionFnMap: _exceptionFns,
    );
    return ListTransactionsResponse.fromJson(response);
  }

  /// Sets the list of data lake administrators who have admin privileges on all
  /// resources managed by Lake Formation. For more information on admin
  /// privileges, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/lake-formation-permissions.html">Granting
  /// Lake Formation Permissions</a>.
  ///
  /// This API replaces the current list of data lake admins with the new list
  /// being passed. To add an admin, fetch the current list and add the new
  /// admin to that list and pass that list in this API.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [dataLakeSettings] :
  /// A structure representing a list of Lake Formation principals designated as
  /// data lake administrators.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<void> putDataLakeSettings({
    required DataLakeSettings dataLakeSettings,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'DataLakeSettings': dataLakeSettings,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutDataLakeSettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Registers the resource as managed by the Data Catalog.
  ///
  /// To add or update data, Lake Formation needs read/write access to the
  /// chosen Amazon S3 path. Choose a role that you know has permission to do
  /// this, or choose the AWSServiceRoleForLakeFormationDataAccess
  /// service-linked role. When you register the first Amazon S3 path, the
  /// service-linked role and a new inline policy are created on your behalf.
  /// Lake Formation adds the first path to the inline policy and attaches it to
  /// the service-linked role. When you register subsequent paths, Lake
  /// Formation adds the path to the existing policy.
  ///
  /// The following request registers a new location and gives Lake Formation
  /// permission to use the service-linked role to access that location.
  ///
  /// <code>ResourceArn = arn:aws:s3:::my-bucket UseServiceLinkedRole =
  /// true</code>
  ///
  /// If <code>UseServiceLinkedRole</code> is not set to true, you must provide
  /// or set the <code>RoleArn</code>:
  ///
  /// <code>arn:aws:iam::12345:role/my-data-access-role</code>
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AlreadyExistsException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to register.
  ///
  /// Parameter [hybridAccessEnabled] :
  /// Specifies whether the data access of tables pointing to the location can
  /// be managed by both Lake Formation permissions as well as Amazon S3 bucket
  /// policies.
  ///
  /// Parameter [roleArn] :
  /// The identifier for the role that registers the resource.
  ///
  /// Parameter [useServiceLinkedRole] :
  /// Designates an Identity and Access Management (IAM) service-linked role by
  /// registering this role with the Data Catalog. A service-linked role is a
  /// unique type of IAM role that is linked directly to Lake Formation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/service-linked-roles.html">Using
  /// Service-Linked Roles for Lake Formation</a>.
  ///
  /// Parameter [withFederation] :
  /// Whether or not the resource is a federated resource.
  Future<void> registerResource({
    required String resourceArn,
    bool? hybridAccessEnabled,
    String? roleArn,
    bool? useServiceLinkedRole,
    bool? withFederation,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      if (hybridAccessEnabled != null)
        'HybridAccessEnabled': hybridAccessEnabled,
      if (roleArn != null) 'RoleArn': roleArn,
      if (useServiceLinkedRole != null)
        'UseServiceLinkedRole': useServiceLinkedRole,
      if (withFederation != null) 'WithFederation': withFederation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RegisterResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes an LF-tag from the resource. Only database, table, or
  /// tableWithColumns resource are allowed. To tag columns, use the column
  /// inclusion list in <code>tableWithColumns</code> to specify column input.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [lFTags] :
  /// The LF-tags to be removed from the resource.
  ///
  /// Parameter [resource] :
  /// The database, table, or column resource where you want to remove an
  /// LF-tag.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  Future<RemoveLFTagsFromResourceResponse> removeLFTagsFromResource({
    required List<LFTagPair> lFTags,
    required Resource resource,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'LFTags': lFTags,
      'Resource': resource,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RemoveLFTagsFromResource',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveLFTagsFromResourceResponse.fromJson(response);
  }

  /// Revokes permissions to the principal to access metadata in the Data
  /// Catalog and data organized in underlying data storage such as Amazon S3.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [permissions] :
  /// The permissions revoked to the principal on the resource. For information
  /// about permissions, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/security-data-access.html">Security
  /// and Access Control to Metadata and Data</a>.
  ///
  /// Parameter [principal] :
  /// The principal to be revoked permissions on the resource.
  ///
  /// Parameter [resource] :
  /// The resource to which permissions are to be revoked.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [permissionsWithGrantOption] :
  /// Indicates a list of permissions for which to revoke the grant option
  /// allowing the principal to pass permissions to other principals.
  Future<void> revokePermissions({
    required List<Permission> permissions,
    required DataLakePrincipal principal,
    required Resource resource,
    String? catalogId,
    List<Permission>? permissionsWithGrantOption,
  }) async {
    final $payload = <String, dynamic>{
      'Permissions': permissions.map((e) => e.toValue()).toList(),
      'Principal': principal,
      'Resource': resource,
      if (catalogId != null) 'CatalogId': catalogId,
      if (permissionsWithGrantOption != null)
        'PermissionsWithGrantOption':
            permissionsWithGrantOption.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RevokePermissions',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation allows a search on <code>DATABASE</code> resources by
  /// <code>TagCondition</code>. This operation is used by admins who want to
  /// grant user permissions on certain <code>TagConditions</code>. Before
  /// making a grant, the admin can use <code>SearchDatabasesByTags</code> to
  /// find all resources where the given <code>TagConditions</code> are valid to
  /// verify whether the returned resources can be shared.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [expression] :
  /// A list of conditions (<code>LFTag</code> structures) to search for in
  /// database resources.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  Future<SearchDatabasesByLFTagsResponse> searchDatabasesByLFTags({
    required List<LFTag> expression,
    String? catalogId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'Expression': expression,
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SearchDatabasesByLFTags',
      exceptionFnMap: _exceptionFns,
    );
    return SearchDatabasesByLFTagsResponse.fromJson(response);
  }

  /// This operation allows a search on <code>TABLE</code> resources by
  /// <code>LFTag</code>s. This will be used by admins who want to grant user
  /// permissions on certain LF-tags. Before making a grant, the admin can use
  /// <code>SearchTablesByLFTags</code> to find all resources where the given
  /// <code>LFTag</code>s are valid to verify whether the returned resources can
  /// be shared.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [expression] :
  /// A list of conditions (<code>LFTag</code> structures) to search for in
  /// table resources.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  Future<SearchTablesByLFTagsResponse> searchTablesByLFTags({
    required List<LFTag> expression,
    String? catalogId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'Expression': expression,
      if (catalogId != null) 'CatalogId': catalogId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SearchTablesByLFTags',
      exceptionFnMap: _exceptionFns,
    );
    return SearchTablesByLFTagsResponse.fromJson(response);
  }

  /// Submits a request to process a query statement.
  ///
  /// This operation generates work units that can be retrieved with the
  /// <code>GetWorkUnits</code> operation as soon as the query state is
  /// WORKUNITS_AVAILABLE or FINISHED.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [queryPlanningContext] :
  /// A structure containing information about the query plan.
  ///
  /// Parameter [queryString] :
  /// A PartiQL query statement used as an input to the planner service.
  Future<StartQueryPlanningResponse> startQueryPlanning({
    required QueryPlanningContext queryPlanningContext,
    required String queryString,
  }) async {
    final $payload = <String, dynamic>{
      'QueryPlanningContext': queryPlanningContext,
      'QueryString': queryString,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartQueryPlanning',
      exceptionFnMap: _exceptionFns,
    );
    return StartQueryPlanningResponse.fromJson(response);
  }

  /// Starts a new transaction and returns its transaction ID. Transaction IDs
  /// are opaque objects that you can use to identify a transaction.
  ///
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [transactionType] :
  /// Indicates whether this transaction should be read only or read and write.
  /// Writes made using a read-only transaction ID will be rejected. Read-only
  /// transactions do not need to be committed.
  Future<StartTransactionResponse> startTransaction({
    TransactionType? transactionType,
  }) async {
    final $payload = <String, dynamic>{
      if (transactionType != null) 'TransactionType': transactionType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartTransaction',
      exceptionFnMap: _exceptionFns,
    );
    return StartTransactionResponse.fromJson(response);
  }

  /// Updates a data cell filter.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tableData] :
  /// A <code>DataCellsFilter</code> structure containing information about the
  /// data cells filter.
  Future<void> updateDataCellsFilter({
    required DataCellsFilter tableData,
  }) async {
    final $payload = <String, dynamic>{
      'TableData': tableData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateDataCellsFilter',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the list of possible values for the specified LF-tag key. If the
  /// LF-tag does not exist, the operation throws an EntityNotFoundException.
  /// The values in the delete key values will be deleted from list of possible
  /// values. If any value in the delete key values is attached to a resource,
  /// then API errors out with a 400 Exception - "Update not allowed". Untag the
  /// attribute before deleting the LF-tag key's value.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the LF-tag for which to add or delete values.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your Lake Formation environment.
  ///
  /// Parameter [tagValuesToAdd] :
  /// A list of LF-tag values to add from the LF-tag.
  ///
  /// Parameter [tagValuesToDelete] :
  /// A list of LF-tag values to delete from the LF-tag.
  Future<void> updateLFTag({
    required String tagKey,
    String? catalogId,
    List<String>? tagValuesToAdd,
    List<String>? tagValuesToDelete,
  }) async {
    final $payload = <String, dynamic>{
      'TagKey': tagKey,
      if (catalogId != null) 'CatalogId': catalogId,
      if (tagValuesToAdd != null) 'TagValuesToAdd': tagValuesToAdd,
      if (tagValuesToDelete != null) 'TagValuesToDelete': tagValuesToDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLFTag',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the IAM Identity Center connection parameters.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [applicationStatus] :
  /// Allows to enable or disable the IAM Identity Center connection.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, view definitions, and other control
  /// information to manage your Lake Formation environment.
  ///
  /// Parameter [externalFiltering] :
  /// A list of the account IDs of Amazon Web Services accounts of third-party
  /// applications that are allowed to access data managed by Lake Formation.
  ///
  /// Parameter [shareRecipients] :
  /// A list of Amazon Web Services account IDs or Amazon Web Services
  /// organization/organizational unit ARNs that are allowed to access to access
  /// data managed by Lake Formation.
  ///
  /// If the <code>ShareRecipients</code> list includes valid values, then the
  /// resource share is updated with the principals you want to have access to
  /// the resources.
  ///
  /// If the <code>ShareRecipients</code> value is null, both the list of share
  /// recipients and the resource share remain unchanged.
  ///
  /// If the <code>ShareRecipients</code> value is an empty list, then the
  /// existing share recipients list will be cleared, and the resource share
  /// will be deleted.
  Future<void> updateLakeFormationIdentityCenterConfiguration({
    ApplicationStatus? applicationStatus,
    String? catalogId,
    ExternalFilteringConfiguration? externalFiltering,
    List<DataLakePrincipal>? shareRecipients,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationStatus != null)
        'ApplicationStatus': applicationStatus.toValue(),
      if (catalogId != null) 'CatalogId': catalogId,
      if (externalFiltering != null) 'ExternalFiltering': externalFiltering,
      if (shareRecipients != null) 'ShareRecipients': shareRecipients,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLakeFormationIdentityCenterConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the data access role used for vending access to the given
  /// (registered) resource in Lake Formation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN.
  ///
  /// Parameter [roleArn] :
  /// The new role to use for the given resource registered in Lake Formation.
  ///
  /// Parameter [hybridAccessEnabled] :
  /// Specifies whether the data access of tables pointing to the location can
  /// be managed by both Lake Formation permissions as well as Amazon S3 bucket
  /// policies.
  ///
  /// Parameter [withFederation] :
  /// Whether or not the resource is a federated resource.
  Future<void> updateResource({
    required String resourceArn,
    required String roleArn,
    bool? hybridAccessEnabled,
    bool? withFederation,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'RoleArn': roleArn,
      if (hybridAccessEnabled != null)
        'HybridAccessEnabled': hybridAccessEnabled,
      if (withFederation != null) 'WithFederation': withFederation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the manifest of Amazon S3 objects that make up the specified
  /// governed table.
  ///
  /// May throw [InternalServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationTimeoutException].
  /// May throw [EntityNotFoundException].
  /// May throw [TransactionCommittedException].
  /// May throw [TransactionCanceledException].
  /// May throw [TransactionCommitInProgressException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [databaseName] :
  /// The database containing the governed table to update.
  ///
  /// Parameter [tableName] :
  /// The governed table to update.
  ///
  /// Parameter [writeOperations] :
  /// A list of <code>WriteOperation</code> objects that define an object to add
  /// to or delete from the manifest for a governed table.
  ///
  /// Parameter [catalogId] :
  /// The catalog containing the governed table to update. Defaults to the
  /// caller’s account ID.
  ///
  /// Parameter [transactionId] :
  /// The transaction at which to do the write.
  Future<void> updateTableObjects({
    required String databaseName,
    required String tableName,
    required List<WriteOperation> writeOperations,
    String? catalogId,
    String? transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'DatabaseName': databaseName,
      'TableName': tableName,
      'WriteOperations': writeOperations,
      if (catalogId != null) 'CatalogId': catalogId,
      if (transactionId != null) 'TransactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateTableObjects',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of the storage optimizers for a table.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [databaseName] :
  /// Name of the database where the table is present.
  ///
  /// Parameter [storageOptimizerConfig] :
  /// Name of the table for which to enable the storage optimizer.
  ///
  /// Parameter [tableName] :
  /// Name of the table for which to enable the storage optimizer.
  ///
  /// Parameter [catalogId] :
  /// The Catalog ID of the table.
  Future<UpdateTableStorageOptimizerResponse> updateTableStorageOptimizer({
    required String databaseName,
    required Map<OptimizerType, Map<String, String>> storageOptimizerConfig,
    required String tableName,
    String? catalogId,
  }) async {
    final $payload = <String, dynamic>{
      'DatabaseName': databaseName,
      'StorageOptimizerConfig':
          storageOptimizerConfig.map((k, e) => MapEntry(k.toValue(), e)),
      'TableName': tableName,
      if (catalogId != null) 'CatalogId': catalogId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateTableStorageOptimizer',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTableStorageOptimizerResponse.fromJson(response);
  }
}

class AddLFTagsToResourceResponse {
  /// A list of failures to tag the resource.
  final List<LFTagError>? failures;

  AddLFTagsToResourceResponse({
    this.failures,
  });

  factory AddLFTagsToResourceResponse.fromJson(Map<String, dynamic> json) {
    return AddLFTagsToResourceResponse(
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

/// A new object to add to the governed table.
class AddObjectInput {
  /// The Amazon S3 ETag of the object. Returned by <code>GetTableObjects</code>
  /// for validation and used to identify changes to the underlying data.
  final String eTag;

  /// The size of the Amazon S3 object in bytes.
  final int size;

  /// The Amazon S3 location of the object.
  final String uri;

  /// A list of partition values for the object. A value must be specified for
  /// each partition key associated with the table.
  ///
  /// The supported data types are integer, long, date(yyyy-MM-dd),
  /// timestamp(yyyy-MM-dd HH:mm:ssXXX or yyyy-MM-dd HH:mm:ss"), string and
  /// decimal.
  final List<String>? partitionValues;

  AddObjectInput({
    required this.eTag,
    required this.size,
    required this.uri,
    this.partitionValues,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final size = this.size;
    final uri = this.uri;
    final partitionValues = this.partitionValues;
    return {
      'ETag': eTag,
      'Size': size,
      'Uri': uri,
      if (partitionValues != null) 'PartitionValues': partitionValues,
    };
  }
}

/// A structure that you pass to indicate you want all rows in a filter.
class AllRowsWildcard {
  AllRowsWildcard();

  factory AllRowsWildcard.fromJson(Map<String, dynamic> _) {
    return AllRowsWildcard();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ApplicationStatus {
  enabled,
  disabled,
}

extension ApplicationStatusValueExtension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.enabled:
        return 'ENABLED';
      case ApplicationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ApplicationStatusFromString on String {
  ApplicationStatus toApplicationStatus() {
    switch (this) {
      case 'ENABLED':
        return ApplicationStatus.enabled;
      case 'DISABLED':
        return ApplicationStatus.disabled;
    }
    throw Exception('$this is not known in enum ApplicationStatus');
  }
}

class AssumeDecoratedRoleWithSAMLResponse {
  /// The access key ID for the temporary credentials. (The access key consists of
  /// an access key ID and a secret key).
  final String? accessKeyId;

  /// The date and time when the temporary credentials expire.
  final DateTime? expiration;

  /// The secret key for the temporary credentials. (The access key consists of an
  /// access key ID and a secret key).
  final String? secretAccessKey;

  /// The session token for the temporary credentials.
  final String? sessionToken;

  AssumeDecoratedRoleWithSAMLResponse({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
  });

  factory AssumeDecoratedRoleWithSAMLResponse.fromJson(
      Map<String, dynamic> json) {
    return AssumeDecoratedRoleWithSAMLResponse(
      accessKeyId: json['AccessKeyId'] as String?,
      expiration: timeStampFromJson(json['Expiration']),
      secretAccessKey: json['SecretAccessKey'] as String?,
      sessionToken: json['SessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (expiration != null) 'Expiration': unixTimestampToJson(expiration),
      if (secretAccessKey != null) 'SecretAccessKey': secretAccessKey,
      if (sessionToken != null) 'SessionToken': sessionToken,
    };
  }
}

/// A structure used to include auditing information on the privileged API.
class AuditContext {
  /// The filter engine can populate the 'AdditionalAuditContext' information with
  /// the request ID for you to track. This information will be displayed in
  /// CloudTrail log in your account.
  final String? additionalAuditContext;

  AuditContext({
    this.additionalAuditContext,
  });

  Map<String, dynamic> toJson() {
    final additionalAuditContext = this.additionalAuditContext;
    return {
      if (additionalAuditContext != null)
        'AdditionalAuditContext': additionalAuditContext,
    };
  }
}

class BatchGrantPermissionsResponse {
  /// A list of failures to grant permissions to the resources.
  final List<BatchPermissionsFailureEntry>? failures;

  BatchGrantPermissionsResponse({
    this.failures,
  });

  factory BatchGrantPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGrantPermissionsResponse(
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchPermissionsFailureEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

/// A list of failures when performing a batch grant or batch revoke operation.
class BatchPermissionsFailureEntry {
  /// An error message that applies to the failure of the entry.
  final ErrorDetail? error;

  /// An identifier for an entry of the batch request.
  final BatchPermissionsRequestEntry? requestEntry;

  BatchPermissionsFailureEntry({
    this.error,
    this.requestEntry,
  });

  factory BatchPermissionsFailureEntry.fromJson(Map<String, dynamic> json) {
    return BatchPermissionsFailureEntry(
      error: json['Error'] != null
          ? ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      requestEntry: json['RequestEntry'] != null
          ? BatchPermissionsRequestEntry.fromJson(
              json['RequestEntry'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final requestEntry = this.requestEntry;
    return {
      if (error != null) 'Error': error,
      if (requestEntry != null) 'RequestEntry': requestEntry,
    };
  }
}

/// A permission to a resource granted by batch operation to the principal.
class BatchPermissionsRequestEntry {
  /// A unique identifier for the batch permissions request entry.
  final String id;

  /// The permissions to be granted.
  final List<Permission>? permissions;

  /// Indicates if the option to pass permissions is granted.
  final List<Permission>? permissionsWithGrantOption;

  /// The principal to be granted a permission.
  final DataLakePrincipal? principal;

  /// The resource to which the principal is to be granted a permission.
  final Resource? resource;

  BatchPermissionsRequestEntry({
    required this.id,
    this.permissions,
    this.permissionsWithGrantOption,
    this.principal,
    this.resource,
  });

  factory BatchPermissionsRequestEntry.fromJson(Map<String, dynamic> json) {
    return BatchPermissionsRequestEntry(
      id: json['Id'] as String,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPermission())
          .toList(),
      permissionsWithGrantOption: (json['PermissionsWithGrantOption'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPermission())
          .toList(),
      principal: json['Principal'] != null
          ? DataLakePrincipal.fromJson(
              json['Principal'] as Map<String, dynamic>)
          : null,
      resource: json['Resource'] != null
          ? Resource.fromJson(json['Resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final permissions = this.permissions;
    final permissionsWithGrantOption = this.permissionsWithGrantOption;
    final principal = this.principal;
    final resource = this.resource;
    return {
      'Id': id,
      if (permissions != null)
        'Permissions': permissions.map((e) => e.toValue()).toList(),
      if (permissionsWithGrantOption != null)
        'PermissionsWithGrantOption':
            permissionsWithGrantOption.map((e) => e.toValue()).toList(),
      if (principal != null) 'Principal': principal,
      if (resource != null) 'Resource': resource,
    };
  }
}

class BatchRevokePermissionsResponse {
  /// A list of failures to revoke permissions to the resources.
  final List<BatchPermissionsFailureEntry>? failures;

  BatchRevokePermissionsResponse({
    this.failures,
  });

  factory BatchRevokePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return BatchRevokePermissionsResponse(
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchPermissionsFailureEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

class CancelTransactionResponse {
  CancelTransactionResponse();

  factory CancelTransactionResponse.fromJson(Map<String, dynamic> _) {
    return CancelTransactionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure for the catalog object.
class CatalogResource {
  CatalogResource();

  factory CatalogResource.fromJson(Map<String, dynamic> _) {
    return CatalogResource();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure containing the name of a column resource and the LF-tags
/// attached to it.
class ColumnLFTag {
  /// The LF-tags attached to a column resource.
  final List<LFTagPair>? lFTags;

  /// The name of a column resource.
  final String? name;

  ColumnLFTag({
    this.lFTags,
    this.name,
  });

  factory ColumnLFTag.fromJson(Map<String, dynamic> json) {
    return ColumnLFTag(
      lFTags: (json['LFTags'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lFTags = this.lFTags;
    final name = this.name;
    return {
      if (lFTags != null) 'LFTags': lFTags,
      if (name != null) 'Name': name,
    };
  }
}

/// A wildcard object, consisting of an optional list of excluded column names
/// or indexes.
class ColumnWildcard {
  /// Excludes column names. Any column with this name will be excluded.
  final List<String>? excludedColumnNames;

  ColumnWildcard({
    this.excludedColumnNames,
  });

  factory ColumnWildcard.fromJson(Map<String, dynamic> json) {
    return ColumnWildcard(
      excludedColumnNames: (json['ExcludedColumnNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludedColumnNames = this.excludedColumnNames;
    return {
      if (excludedColumnNames != null)
        'ExcludedColumnNames': excludedColumnNames,
    };
  }
}

class CommitTransactionResponse {
  /// The status of the transaction.
  final TransactionStatus? transactionStatus;

  CommitTransactionResponse({
    this.transactionStatus,
  });

  factory CommitTransactionResponse.fromJson(Map<String, dynamic> json) {
    return CommitTransactionResponse(
      transactionStatus:
          (json['TransactionStatus'] as String?)?.toTransactionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final transactionStatus = this.transactionStatus;
    return {
      if (transactionStatus != null)
        'TransactionStatus': transactionStatus.toValue(),
    };
  }
}

enum ComparisonOperator {
  eq,
  ne,
  le,
  lt,
  ge,
  gt,
  contains,
  notContains,
  beginsWith,
  $in,
  between,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.eq:
        return 'EQ';
      case ComparisonOperator.ne:
        return 'NE';
      case ComparisonOperator.le:
        return 'LE';
      case ComparisonOperator.lt:
        return 'LT';
      case ComparisonOperator.ge:
        return 'GE';
      case ComparisonOperator.gt:
        return 'GT';
      case ComparisonOperator.contains:
        return 'CONTAINS';
      case ComparisonOperator.notContains:
        return 'NOT_CONTAINS';
      case ComparisonOperator.beginsWith:
        return 'BEGINS_WITH';
      case ComparisonOperator.$in:
        return 'IN';
      case ComparisonOperator.between:
        return 'BETWEEN';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'EQ':
        return ComparisonOperator.eq;
      case 'NE':
        return ComparisonOperator.ne;
      case 'LE':
        return ComparisonOperator.le;
      case 'LT':
        return ComparisonOperator.lt;
      case 'GE':
        return ComparisonOperator.ge;
      case 'GT':
        return ComparisonOperator.gt;
      case 'CONTAINS':
        return ComparisonOperator.contains;
      case 'NOT_CONTAINS':
        return ComparisonOperator.notContains;
      case 'BEGINS_WITH':
        return ComparisonOperator.beginsWith;
      case 'IN':
        return ComparisonOperator.$in;
      case 'BETWEEN':
        return ComparisonOperator.between;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

class CreateDataCellsFilterResponse {
  CreateDataCellsFilterResponse();

  factory CreateDataCellsFilterResponse.fromJson(Map<String, dynamic> _) {
    return CreateDataCellsFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateLFTagResponse {
  CreateLFTagResponse();

  factory CreateLFTagResponse.fromJson(Map<String, dynamic> _) {
    return CreateLFTagResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateLakeFormationIdentityCenterConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the Lake Formation application integrated
  /// with IAM Identity Center.
  final String? applicationArn;

  CreateLakeFormationIdentityCenterConfigurationResponse({
    this.applicationArn,
  });

  factory CreateLakeFormationIdentityCenterConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLakeFormationIdentityCenterConfigurationResponse(
      applicationArn: json['ApplicationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
    };
  }
}

class CreateLakeFormationOptInResponse {
  CreateLakeFormationOptInResponse();

  factory CreateLakeFormationOptInResponse.fromJson(Map<String, dynamic> _) {
    return CreateLakeFormationOptInResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that describes certain columns on certain rows.
class DataCellsFilter {
  /// A database in the Glue Data Catalog.
  final String databaseName;

  /// The name given by the user to the data filter cell.
  final String name;

  /// The ID of the catalog to which the table belongs.
  final String tableCatalogId;

  /// A table in the database.
  final String tableName;

  /// A list of column names and/or nested column attributes. When specifying
  /// nested attributes, use a qualified dot (.) delimited format such as
  /// "address"."zip". Nested attributes within this list may not exceed a depth
  /// of 5.
  final List<String>? columnNames;

  /// A wildcard with exclusions.
  ///
  /// You must specify either a <code>ColumnNames</code> list or the
  /// <code>ColumnWildCard</code>.
  final ColumnWildcard? columnWildcard;

  /// A PartiQL predicate.
  final RowFilter? rowFilter;

  /// The ID of the data cells filter version.
  final String? versionId;

  DataCellsFilter({
    required this.databaseName,
    required this.name,
    required this.tableCatalogId,
    required this.tableName,
    this.columnNames,
    this.columnWildcard,
    this.rowFilter,
    this.versionId,
  });

  factory DataCellsFilter.fromJson(Map<String, dynamic> json) {
    return DataCellsFilter(
      databaseName: json['DatabaseName'] as String,
      name: json['Name'] as String,
      tableCatalogId: json['TableCatalogId'] as String,
      tableName: json['TableName'] as String,
      columnNames: (json['ColumnNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      columnWildcard: json['ColumnWildcard'] != null
          ? ColumnWildcard.fromJson(
              json['ColumnWildcard'] as Map<String, dynamic>)
          : null,
      rowFilter: json['RowFilter'] != null
          ? RowFilter.fromJson(json['RowFilter'] as Map<String, dynamic>)
          : null,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final name = this.name;
    final tableCatalogId = this.tableCatalogId;
    final tableName = this.tableName;
    final columnNames = this.columnNames;
    final columnWildcard = this.columnWildcard;
    final rowFilter = this.rowFilter;
    final versionId = this.versionId;
    return {
      'DatabaseName': databaseName,
      'Name': name,
      'TableCatalogId': tableCatalogId,
      'TableName': tableName,
      if (columnNames != null) 'ColumnNames': columnNames,
      if (columnWildcard != null) 'ColumnWildcard': columnWildcard,
      if (rowFilter != null) 'RowFilter': rowFilter,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// A structure for a data cells filter resource.
class DataCellsFilterResource {
  /// A database in the Glue Data Catalog.
  final String? databaseName;

  /// The name of the data cells filter.
  final String? name;

  /// The ID of the catalog to which the table belongs.
  final String? tableCatalogId;

  /// The name of the table.
  final String? tableName;

  DataCellsFilterResource({
    this.databaseName,
    this.name,
    this.tableCatalogId,
    this.tableName,
  });

  factory DataCellsFilterResource.fromJson(Map<String, dynamic> json) {
    return DataCellsFilterResource(
      databaseName: json['DatabaseName'] as String?,
      name: json['Name'] as String?,
      tableCatalogId: json['TableCatalogId'] as String?,
      tableName: json['TableName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final name = this.name;
    final tableCatalogId = this.tableCatalogId;
    final tableName = this.tableName;
    return {
      if (databaseName != null) 'DatabaseName': databaseName,
      if (name != null) 'Name': name,
      if (tableCatalogId != null) 'TableCatalogId': tableCatalogId,
      if (tableName != null) 'TableName': tableName,
    };
  }
}

/// The Lake Formation principal. Supported principals are IAM users or IAM
/// roles.
class DataLakePrincipal {
  /// An identifier for the Lake Formation principal.
  final String? dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });

  factory DataLakePrincipal.fromJson(Map<String, dynamic> json) {
    return DataLakePrincipal(
      dataLakePrincipalIdentifier:
          json['DataLakePrincipalIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakePrincipalIdentifier = this.dataLakePrincipalIdentifier;
    return {
      if (dataLakePrincipalIdentifier != null)
        'DataLakePrincipalIdentifier': dataLakePrincipalIdentifier,
    };
  }
}

enum DataLakeResourceType {
  catalog,
  database,
  table,
  dataLocation,
  lfTag,
  lfTagPolicy,
  lfTagPolicyDatabase,
  lfTagPolicyTable,
}

extension DataLakeResourceTypeValueExtension on DataLakeResourceType {
  String toValue() {
    switch (this) {
      case DataLakeResourceType.catalog:
        return 'CATALOG';
      case DataLakeResourceType.database:
        return 'DATABASE';
      case DataLakeResourceType.table:
        return 'TABLE';
      case DataLakeResourceType.dataLocation:
        return 'DATA_LOCATION';
      case DataLakeResourceType.lfTag:
        return 'LF_TAG';
      case DataLakeResourceType.lfTagPolicy:
        return 'LF_TAG_POLICY';
      case DataLakeResourceType.lfTagPolicyDatabase:
        return 'LF_TAG_POLICY_DATABASE';
      case DataLakeResourceType.lfTagPolicyTable:
        return 'LF_TAG_POLICY_TABLE';
    }
  }
}

extension DataLakeResourceTypeFromString on String {
  DataLakeResourceType toDataLakeResourceType() {
    switch (this) {
      case 'CATALOG':
        return DataLakeResourceType.catalog;
      case 'DATABASE':
        return DataLakeResourceType.database;
      case 'TABLE':
        return DataLakeResourceType.table;
      case 'DATA_LOCATION':
        return DataLakeResourceType.dataLocation;
      case 'LF_TAG':
        return DataLakeResourceType.lfTag;
      case 'LF_TAG_POLICY':
        return DataLakeResourceType.lfTagPolicy;
      case 'LF_TAG_POLICY_DATABASE':
        return DataLakeResourceType.lfTagPolicyDatabase;
      case 'LF_TAG_POLICY_TABLE':
        return DataLakeResourceType.lfTagPolicyTable;
    }
    throw Exception('$this is not known in enum DataLakeResourceType');
  }
}

/// A structure representing a list of Lake Formation principals designated as
/// data lake administrators and lists of principal permission entries for
/// default create database and default create table permissions.
class DataLakeSettings {
  /// Whether to allow Amazon EMR clusters to access data managed by Lake
  /// Formation.
  ///
  /// If true, you allow Amazon EMR clusters to access data in Amazon S3 locations
  /// that are registered with Lake Formation.
  ///
  /// If false or null, no Amazon EMR clusters will be able to access data in
  /// Amazon S3 locations that are registered with Lake Formation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/initial-LF-setup.html#external-data-filter">(Optional)
  /// Allow external data filtering</a>.
  final bool? allowExternalDataFiltering;

  /// Whether to allow a third-party query engine to get data access credentials
  /// without session tags when a caller has full data access permissions.
  final bool? allowFullTableExternalDataAccess;

  /// Lake Formation relies on a privileged process secured by Amazon EMR or the
  /// third party integrator to tag the user's role while assuming it. Lake
  /// Formation will publish the acceptable key-value pair, for example key =
  /// "LakeFormationTrustedCaller" and value = "TRUE" and the third party
  /// integrator must properly tag the temporary security credentials that will be
  /// used to call Lake Formation's administrative APIs.
  final List<String>? authorizedSessionTagValueList;

  /// Specifies whether access control on newly created database is managed by
  /// Lake Formation permissions or exclusively by IAM permissions.
  ///
  /// A null value indicates access control by Lake Formation permissions. A value
  /// that assigns ALL to IAM_ALLOWED_PRINCIPALS indicates access control by IAM
  /// permissions. This is referred to as the setting "Use only IAM access
  /// control," and is for backward compatibility with the Glue permission model
  /// implemented by IAM permissions.
  ///
  /// The only permitted values are an empty array or an array that contains a
  /// single JSON object that grants ALL to IAM_ALLOWED_PRINCIPALS.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/change-settings.html">Changing
  /// the Default Security Settings for Your Data Lake</a>.
  final List<PrincipalPermissions>? createDatabaseDefaultPermissions;

  /// Specifies whether access control on newly created table is managed by Lake
  /// Formation permissions or exclusively by IAM permissions.
  ///
  /// A null value indicates access control by Lake Formation permissions. A value
  /// that assigns ALL to IAM_ALLOWED_PRINCIPALS indicates access control by IAM
  /// permissions. This is referred to as the setting "Use only IAM access
  /// control," and is for backward compatibility with the Glue permission model
  /// implemented by IAM permissions.
  ///
  /// The only permitted values are an empty array or an array that contains a
  /// single JSON object that grants ALL to IAM_ALLOWED_PRINCIPALS.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/lake-formation/latest/dg/change-settings.html">Changing
  /// the Default Security Settings for Your Data Lake</a>.
  final List<PrincipalPermissions>? createTableDefaultPermissions;

  /// A list of Lake Formation principals. Supported principals are IAM users or
  /// IAM roles.
  final List<DataLakePrincipal>? dataLakeAdmins;

  /// A list of the account IDs of Amazon Web Services accounts with Amazon EMR
  /// clusters that are to perform data filtering.&gt;
  final List<DataLakePrincipal>? externalDataFilteringAllowList;

  /// A key-value map that provides an additional configuration on your data lake.
  /// CROSS_ACCOUNT_VERSION is the key you can configure in the Parameters field.
  /// Accepted values for the CrossAccountVersion key are 1, 2, 3, and 4.
  final Map<String, String>? parameters;

  /// A list of Lake Formation principals with only view access to the resources,
  /// without the ability to make changes. Supported principals are IAM users or
  /// IAM roles.
  final List<DataLakePrincipal>? readOnlyAdmins;

  /// A list of the resource-owning account IDs that the caller's account can use
  /// to share their user access details (user ARNs). The user ARNs can be logged
  /// in the resource owner's CloudTrail log.
  ///
  /// You may want to specify this property when you are in a high-trust boundary,
  /// such as the same team or company.
  final List<String>? trustedResourceOwners;

  DataLakeSettings({
    this.allowExternalDataFiltering,
    this.allowFullTableExternalDataAccess,
    this.authorizedSessionTagValueList,
    this.createDatabaseDefaultPermissions,
    this.createTableDefaultPermissions,
    this.dataLakeAdmins,
    this.externalDataFilteringAllowList,
    this.parameters,
    this.readOnlyAdmins,
    this.trustedResourceOwners,
  });

  factory DataLakeSettings.fromJson(Map<String, dynamic> json) {
    return DataLakeSettings(
      allowExternalDataFiltering: json['AllowExternalDataFiltering'] as bool?,
      allowFullTableExternalDataAccess:
          json['AllowFullTableExternalDataAccess'] as bool?,
      authorizedSessionTagValueList:
          (json['AuthorizedSessionTagValueList'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      createDatabaseDefaultPermissions: (json[
              'CreateDatabaseDefaultPermissions'] as List?)
          ?.whereNotNull()
          .map((e) => PrincipalPermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTableDefaultPermissions: (json['CreateTableDefaultPermissions']
              as List?)
          ?.whereNotNull()
          .map((e) => PrincipalPermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataLakeAdmins: (json['DataLakeAdmins'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakePrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalDataFilteringAllowList:
          (json['ExternalDataFilteringAllowList'] as List?)
              ?.whereNotNull()
              .map((e) => DataLakePrincipal.fromJson(e as Map<String, dynamic>))
              .toList(),
      parameters: (json['Parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      readOnlyAdmins: (json['ReadOnlyAdmins'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakePrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
      trustedResourceOwners: (json['TrustedResourceOwners'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowExternalDataFiltering = this.allowExternalDataFiltering;
    final allowFullTableExternalDataAccess =
        this.allowFullTableExternalDataAccess;
    final authorizedSessionTagValueList = this.authorizedSessionTagValueList;
    final createDatabaseDefaultPermissions =
        this.createDatabaseDefaultPermissions;
    final createTableDefaultPermissions = this.createTableDefaultPermissions;
    final dataLakeAdmins = this.dataLakeAdmins;
    final externalDataFilteringAllowList = this.externalDataFilteringAllowList;
    final parameters = this.parameters;
    final readOnlyAdmins = this.readOnlyAdmins;
    final trustedResourceOwners = this.trustedResourceOwners;
    return {
      if (allowExternalDataFiltering != null)
        'AllowExternalDataFiltering': allowExternalDataFiltering,
      if (allowFullTableExternalDataAccess != null)
        'AllowFullTableExternalDataAccess': allowFullTableExternalDataAccess,
      if (authorizedSessionTagValueList != null)
        'AuthorizedSessionTagValueList': authorizedSessionTagValueList,
      if (createDatabaseDefaultPermissions != null)
        'CreateDatabaseDefaultPermissions': createDatabaseDefaultPermissions,
      if (createTableDefaultPermissions != null)
        'CreateTableDefaultPermissions': createTableDefaultPermissions,
      if (dataLakeAdmins != null) 'DataLakeAdmins': dataLakeAdmins,
      if (externalDataFilteringAllowList != null)
        'ExternalDataFilteringAllowList': externalDataFilteringAllowList,
      if (parameters != null) 'Parameters': parameters,
      if (readOnlyAdmins != null) 'ReadOnlyAdmins': readOnlyAdmins,
      if (trustedResourceOwners != null)
        'TrustedResourceOwners': trustedResourceOwners,
    };
  }
}

/// A structure for a data location object where permissions are granted or
/// revoked.
class DataLocationResource {
  /// The Amazon Resource Name (ARN) that uniquely identifies the data location
  /// resource.
  final String resourceArn;

  /// The identifier for the Data Catalog where the location is registered with
  /// Lake Formation. By default, it is the account ID of the caller.
  final String? catalogId;

  DataLocationResource({
    required this.resourceArn,
    this.catalogId,
  });

  factory DataLocationResource.fromJson(Map<String, dynamic> json) {
    return DataLocationResource(
      resourceArn: json['ResourceArn'] as String,
      catalogId: json['CatalogId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final catalogId = this.catalogId;
    return {
      'ResourceArn': resourceArn,
      if (catalogId != null) 'CatalogId': catalogId,
    };
  }
}

/// A structure for the database object.
class DatabaseResource {
  /// The name of the database resource. Unique to the Data Catalog.
  final String name;

  /// The identifier for the Data Catalog. By default, it is the account ID of the
  /// caller.
  final String? catalogId;

  DatabaseResource({
    required this.name,
    this.catalogId,
  });

  factory DatabaseResource.fromJson(Map<String, dynamic> json) {
    return DatabaseResource(
      name: json['Name'] as String,
      catalogId: json['CatalogId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final catalogId = this.catalogId;
    return {
      'Name': name,
      if (catalogId != null) 'CatalogId': catalogId,
    };
  }
}

class DeleteDataCellsFilterResponse {
  DeleteDataCellsFilterResponse();

  factory DeleteDataCellsFilterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDataCellsFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLFTagResponse {
  DeleteLFTagResponse();

  factory DeleteLFTagResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLFTagResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLakeFormationIdentityCenterConfigurationResponse {
  DeleteLakeFormationIdentityCenterConfigurationResponse();

  factory DeleteLakeFormationIdentityCenterConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteLakeFormationIdentityCenterConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLakeFormationOptInResponse {
  DeleteLakeFormationOptInResponse();

  factory DeleteLakeFormationOptInResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLakeFormationOptInResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object to delete from the governed table.
class DeleteObjectInput {
  /// The Amazon S3 location of the object to delete.
  final String uri;

  /// The Amazon S3 ETag of the object. Returned by <code>GetTableObjects</code>
  /// for validation and used to identify changes to the underlying data.
  final String? eTag;

  /// A list of partition values for the object. A value must be specified for
  /// each partition key associated with the governed table.
  final List<String>? partitionValues;

  DeleteObjectInput({
    required this.uri,
    this.eTag,
    this.partitionValues,
  });

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    final eTag = this.eTag;
    final partitionValues = this.partitionValues;
    return {
      'Uri': uri,
      if (eTag != null) 'ETag': eTag,
      if (partitionValues != null) 'PartitionValues': partitionValues,
    };
  }
}

class DeleteObjectsOnCancelResponse {
  DeleteObjectsOnCancelResponse();

  factory DeleteObjectsOnCancelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteObjectsOnCancelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterResourceResponse {
  DeregisterResourceResponse();

  factory DeregisterResourceResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeLakeFormationIdentityCenterConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the Lake Formation application integrated
  /// with IAM Identity Center.
  final String? applicationArn;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your Lake
  /// Formation environment.
  final String? catalogId;

  /// Indicates if external filtering is enabled.
  final ExternalFilteringConfiguration? externalFiltering;

  /// The Amazon Resource Name (ARN) of the connection.
  final String? instanceArn;

  /// The Amazon Resource Name (ARN) of the RAM share.
  final String? resourceShare;

  /// A list of Amazon Web Services account IDs or Amazon Web Services
  /// organization/organizational unit ARNs that are allowed to access data
  /// managed by Lake Formation.
  ///
  /// If the <code>ShareRecipients</code> list includes valid values, a resource
  /// share is created with the principals you want to have access to the
  /// resources as the <code>ShareRecipients</code>.
  ///
  /// If the <code>ShareRecipients</code> value is null or the list is empty, no
  /// resource share is created.
  final List<DataLakePrincipal>? shareRecipients;

  DescribeLakeFormationIdentityCenterConfigurationResponse({
    this.applicationArn,
    this.catalogId,
    this.externalFiltering,
    this.instanceArn,
    this.resourceShare,
    this.shareRecipients,
  });

  factory DescribeLakeFormationIdentityCenterConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLakeFormationIdentityCenterConfigurationResponse(
      applicationArn: json['ApplicationArn'] as String?,
      catalogId: json['CatalogId'] as String?,
      externalFiltering: json['ExternalFiltering'] != null
          ? ExternalFilteringConfiguration.fromJson(
              json['ExternalFiltering'] as Map<String, dynamic>)
          : null,
      instanceArn: json['InstanceArn'] as String?,
      resourceShare: json['ResourceShare'] as String?,
      shareRecipients: (json['ShareRecipients'] as List?)
          ?.whereNotNull()
          .map((e) => DataLakePrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final catalogId = this.catalogId;
    final externalFiltering = this.externalFiltering;
    final instanceArn = this.instanceArn;
    final resourceShare = this.resourceShare;
    final shareRecipients = this.shareRecipients;
    return {
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (catalogId != null) 'CatalogId': catalogId,
      if (externalFiltering != null) 'ExternalFiltering': externalFiltering,
      if (instanceArn != null) 'InstanceArn': instanceArn,
      if (resourceShare != null) 'ResourceShare': resourceShare,
      if (shareRecipients != null) 'ShareRecipients': shareRecipients,
    };
  }
}

class DescribeResourceResponse {
  /// A structure containing information about an Lake Formation resource.
  final ResourceInfo? resourceInfo;

  DescribeResourceResponse({
    this.resourceInfo,
  });

  factory DescribeResourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourceResponse(
      resourceInfo: json['ResourceInfo'] != null
          ? ResourceInfo.fromJson(json['ResourceInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceInfo = this.resourceInfo;
    return {
      if (resourceInfo != null) 'ResourceInfo': resourceInfo,
    };
  }
}

class DescribeTransactionResponse {
  /// Returns a <code>TransactionDescription</code> object containing information
  /// about the transaction.
  final TransactionDescription? transactionDescription;

  DescribeTransactionResponse({
    this.transactionDescription,
  });

  factory DescribeTransactionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTransactionResponse(
      transactionDescription: json['TransactionDescription'] != null
          ? TransactionDescription.fromJson(
              json['TransactionDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transactionDescription = this.transactionDescription;
    return {
      if (transactionDescription != null)
        'TransactionDescription': transactionDescription,
    };
  }
}

/// A structure containing the additional details to be returned in the
/// <code>AdditionalDetails</code> attribute of
/// <code>PrincipalResourcePermissions</code>.
///
/// If a catalog resource is shared through Resource Access Manager (RAM), then
/// there will exist a corresponding RAM resource share ARN.
class DetailsMap {
  /// A resource share ARN for a catalog resource shared through RAM.
  final List<String>? resourceShare;

  DetailsMap({
    this.resourceShare,
  });

  factory DetailsMap.fromJson(Map<String, dynamic> json) {
    return DetailsMap(
      resourceShare: (json['ResourceShare'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceShare = this.resourceShare;
    return {
      if (resourceShare != null) 'ResourceShare': resourceShare,
    };
  }
}

enum EnableStatus {
  enabled,
  disabled,
}

extension EnableStatusValueExtension on EnableStatus {
  String toValue() {
    switch (this) {
      case EnableStatus.enabled:
        return 'ENABLED';
      case EnableStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension EnableStatusFromString on String {
  EnableStatus toEnableStatus() {
    switch (this) {
      case 'ENABLED':
        return EnableStatus.enabled;
      case 'DISABLED':
        return EnableStatus.disabled;
    }
    throw Exception('$this is not known in enum EnableStatus');
  }
}

/// Contains details about an error.
class ErrorDetail {
  /// The code associated with this error.
  final String? errorCode;

  /// A message describing the error.
  final String? errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
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

/// Statistics related to the processing of a query statement.
class ExecutionStatistics {
  /// The average time the request took to be executed.
  final int? averageExecutionTimeMillis;

  /// The amount of data that was scanned in bytes.
  final int? dataScannedBytes;

  /// The number of work units executed.
  final int? workUnitsExecutedCount;

  ExecutionStatistics({
    this.averageExecutionTimeMillis,
    this.dataScannedBytes,
    this.workUnitsExecutedCount,
  });

  factory ExecutionStatistics.fromJson(Map<String, dynamic> json) {
    return ExecutionStatistics(
      averageExecutionTimeMillis: json['AverageExecutionTimeMillis'] as int?,
      dataScannedBytes: json['DataScannedBytes'] as int?,
      workUnitsExecutedCount: json['WorkUnitsExecutedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final averageExecutionTimeMillis = this.averageExecutionTimeMillis;
    final dataScannedBytes = this.dataScannedBytes;
    final workUnitsExecutedCount = this.workUnitsExecutedCount;
    return {
      if (averageExecutionTimeMillis != null)
        'AverageExecutionTimeMillis': averageExecutionTimeMillis,
      if (dataScannedBytes != null) 'DataScannedBytes': dataScannedBytes,
      if (workUnitsExecutedCount != null)
        'WorkUnitsExecutedCount': workUnitsExecutedCount,
    };
  }
}

class ExtendTransactionResponse {
  ExtendTransactionResponse();

  factory ExtendTransactionResponse.fromJson(Map<String, dynamic> _) {
    return ExtendTransactionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration for enabling external data filtering for third-party
/// applications to access data managed by Lake Formation .
class ExternalFilteringConfiguration {
  /// List of third-party application <code>ARNs</code> integrated with Lake
  /// Formation.
  final List<String> authorizedTargets;

  /// Allows to enable or disable the third-party applications that are allowed to
  /// access data managed by Lake Formation.
  final EnableStatus status;

  ExternalFilteringConfiguration({
    required this.authorizedTargets,
    required this.status,
  });

  factory ExternalFilteringConfiguration.fromJson(Map<String, dynamic> json) {
    return ExternalFilteringConfiguration(
      authorizedTargets: (json['AuthorizedTargets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String).toEnableStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizedTargets = this.authorizedTargets;
    final status = this.status;
    return {
      'AuthorizedTargets': authorizedTargets,
      'Status': status.toValue(),
    };
  }
}

enum FieldNameString {
  resourceArn,
  roleArn,
  lastModified,
}

extension FieldNameStringValueExtension on FieldNameString {
  String toValue() {
    switch (this) {
      case FieldNameString.resourceArn:
        return 'RESOURCE_ARN';
      case FieldNameString.roleArn:
        return 'ROLE_ARN';
      case FieldNameString.lastModified:
        return 'LAST_MODIFIED';
    }
  }
}

extension FieldNameStringFromString on String {
  FieldNameString toFieldNameString() {
    switch (this) {
      case 'RESOURCE_ARN':
        return FieldNameString.resourceArn;
      case 'ROLE_ARN':
        return FieldNameString.roleArn;
      case 'LAST_MODIFIED':
        return FieldNameString.lastModified;
    }
    throw Exception('$this is not known in enum FieldNameString');
  }
}

/// This structure describes the filtering of columns in a table based on a
/// filter condition.
class FilterCondition {
  /// The comparison operator used in the filter condition.
  final ComparisonOperator? comparisonOperator;

  /// The field to filter in the filter condition.
  final FieldNameString? field;

  /// A string with values used in evaluating the filter condition.
  final List<String>? stringValueList;

  FilterCondition({
    this.comparisonOperator,
    this.field,
    this.stringValueList,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final field = this.field;
    final stringValueList = this.stringValueList;
    return {
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.toValue(),
      if (field != null) 'Field': field.toValue(),
      if (stringValueList != null) 'StringValueList': stringValueList,
    };
  }
}

class GetDataCellsFilterResponse {
  /// A structure that describes certain columns on certain rows.
  final DataCellsFilter? dataCellsFilter;

  GetDataCellsFilterResponse({
    this.dataCellsFilter,
  });

  factory GetDataCellsFilterResponse.fromJson(Map<String, dynamic> json) {
    return GetDataCellsFilterResponse(
      dataCellsFilter: json['DataCellsFilter'] != null
          ? DataCellsFilter.fromJson(
              json['DataCellsFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataCellsFilter = this.dataCellsFilter;
    return {
      if (dataCellsFilter != null) 'DataCellsFilter': dataCellsFilter,
    };
  }
}

class GetDataLakePrincipalResponse {
  /// A unique identifier of the invoking principal.
  final String? identity;

  GetDataLakePrincipalResponse({
    this.identity,
  });

  factory GetDataLakePrincipalResponse.fromJson(Map<String, dynamic> json) {
    return GetDataLakePrincipalResponse(
      identity: json['Identity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identity = this.identity;
    return {
      if (identity != null) 'Identity': identity,
    };
  }
}

class GetDataLakeSettingsResponse {
  /// A structure representing a list of Lake Formation principals designated as
  /// data lake administrators.
  final DataLakeSettings? dataLakeSettings;

  GetDataLakeSettingsResponse({
    this.dataLakeSettings,
  });

  factory GetDataLakeSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetDataLakeSettingsResponse(
      dataLakeSettings: json['DataLakeSettings'] != null
          ? DataLakeSettings.fromJson(
              json['DataLakeSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLakeSettings = this.dataLakeSettings;
    return {
      if (dataLakeSettings != null) 'DataLakeSettings': dataLakeSettings,
    };
  }
}

class GetEffectivePermissionsForPathResponse {
  /// A continuation token, if this is not the first call to retrieve this list.
  final String? nextToken;

  /// A list of the permissions for the specified table or database resource
  /// located at the path in Amazon S3.
  final List<PrincipalResourcePermissions>? permissions;

  GetEffectivePermissionsForPathResponse({
    this.nextToken,
    this.permissions,
  });

  factory GetEffectivePermissionsForPathResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEffectivePermissionsForPathResponse(
      nextToken: json['NextToken'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PrincipalResourcePermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (permissions != null) 'Permissions': permissions,
    };
  }
}

class GetLFTagResponse {
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your Lake
  /// Formation environment.
  final String? catalogId;

  /// The key-name for the LF-tag.
  final String? tagKey;

  /// A list of possible values an attribute can take.
  final List<String>? tagValues;

  GetLFTagResponse({
    this.catalogId,
    this.tagKey,
    this.tagValues,
  });

  factory GetLFTagResponse.fromJson(Map<String, dynamic> json) {
    return GetLFTagResponse(
      catalogId: json['CatalogId'] as String?,
      tagKey: json['TagKey'] as String?,
      tagValues: (json['TagValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    return {
      if (catalogId != null) 'CatalogId': catalogId,
      if (tagKey != null) 'TagKey': tagKey,
      if (tagValues != null) 'TagValues': tagValues,
    };
  }
}

/// A structure for the output.
class GetQueryStateResponse {
  /// The state of a query previously submitted. The possible states are:
  ///
  /// <ul>
  /// <li>
  /// PENDING: the query is pending.
  /// </li>
  /// <li>
  /// WORKUNITS_AVAILABLE: some work units are ready for retrieval and execution.
  /// </li>
  /// <li>
  /// FINISHED: the query planning finished successfully, and all work units are
  /// ready for retrieval and execution.
  /// </li>
  /// <li>
  /// ERROR: an error occurred with the query, such as an invalid query ID or a
  /// backend error.
  /// </li>
  /// </ul>
  final QueryStateString state;

  /// An error message when the operation fails.
  final String? error;

  GetQueryStateResponse({
    required this.state,
    this.error,
  });

  factory GetQueryStateResponse.fromJson(Map<String, dynamic> json) {
    return GetQueryStateResponse(
      state: (json['State'] as String).toQueryStateString(),
      error: json['Error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final error = this.error;
    return {
      'State': state.toValue(),
      if (error != null) 'Error': error,
    };
  }
}

class GetQueryStatisticsResponse {
  /// An <code>ExecutionStatistics</code> structure containing execution
  /// statistics.
  final ExecutionStatistics? executionStatistics;

  /// A <code>PlanningStatistics</code> structure containing query planning
  /// statistics.
  final PlanningStatistics? planningStatistics;

  /// The time that the query was submitted.
  final DateTime? querySubmissionTime;

  GetQueryStatisticsResponse({
    this.executionStatistics,
    this.planningStatistics,
    this.querySubmissionTime,
  });

  factory GetQueryStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetQueryStatisticsResponse(
      executionStatistics: json['ExecutionStatistics'] != null
          ? ExecutionStatistics.fromJson(
              json['ExecutionStatistics'] as Map<String, dynamic>)
          : null,
      planningStatistics: json['PlanningStatistics'] != null
          ? PlanningStatistics.fromJson(
              json['PlanningStatistics'] as Map<String, dynamic>)
          : null,
      querySubmissionTime: timeStampFromJson(json['QuerySubmissionTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final executionStatistics = this.executionStatistics;
    final planningStatistics = this.planningStatistics;
    final querySubmissionTime = this.querySubmissionTime;
    return {
      if (executionStatistics != null)
        'ExecutionStatistics': executionStatistics,
      if (planningStatistics != null) 'PlanningStatistics': planningStatistics,
      if (querySubmissionTime != null)
        'QuerySubmissionTime': iso8601ToJson(querySubmissionTime),
    };
  }
}

class GetResourceLFTagsResponse {
  /// A list of LF-tags applied to a database resource.
  final List<LFTagPair>? lFTagOnDatabase;

  /// A list of LF-tags applied to a column resource.
  final List<ColumnLFTag>? lFTagsOnColumns;

  /// A list of LF-tags applied to a table resource.
  final List<LFTagPair>? lFTagsOnTable;

  GetResourceLFTagsResponse({
    this.lFTagOnDatabase,
    this.lFTagsOnColumns,
    this.lFTagsOnTable,
  });

  factory GetResourceLFTagsResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceLFTagsResponse(
      lFTagOnDatabase: (json['LFTagOnDatabase'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      lFTagsOnColumns: (json['LFTagsOnColumns'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnLFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      lFTagsOnTable: (json['LFTagsOnTable'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lFTagOnDatabase = this.lFTagOnDatabase;
    final lFTagsOnColumns = this.lFTagsOnColumns;
    final lFTagsOnTable = this.lFTagsOnTable;
    return {
      if (lFTagOnDatabase != null) 'LFTagOnDatabase': lFTagOnDatabase,
      if (lFTagsOnColumns != null) 'LFTagsOnColumns': lFTagsOnColumns,
      if (lFTagsOnTable != null) 'LFTagsOnTable': lFTagsOnTable,
    };
  }
}

class GetTableObjectsResponse {
  /// A continuation token indicating whether additional data is available.
  final String? nextToken;

  /// A list of objects organized by partition keys.
  final List<PartitionObjects>? objects;

  GetTableObjectsResponse({
    this.nextToken,
    this.objects,
  });

  factory GetTableObjectsResponse.fromJson(Map<String, dynamic> json) {
    return GetTableObjectsResponse(
      nextToken: json['NextToken'] as String?,
      objects: (json['Objects'] as List?)
          ?.whereNotNull()
          .map((e) => PartitionObjects.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final objects = this.objects;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (objects != null) 'Objects': objects,
    };
  }
}

class GetTemporaryGluePartitionCredentialsResponse {
  /// The access key ID for the temporary credentials.
  final String? accessKeyId;

  /// The date and time when the temporary credentials expire.
  final DateTime? expiration;

  /// The secret key for the temporary credentials.
  final String? secretAccessKey;

  /// The session token for the temporary credentials.
  final String? sessionToken;

  GetTemporaryGluePartitionCredentialsResponse({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
  });

  factory GetTemporaryGluePartitionCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTemporaryGluePartitionCredentialsResponse(
      accessKeyId: json['AccessKeyId'] as String?,
      expiration: timeStampFromJson(json['Expiration']),
      secretAccessKey: json['SecretAccessKey'] as String?,
      sessionToken: json['SessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (expiration != null) 'Expiration': unixTimestampToJson(expiration),
      if (secretAccessKey != null) 'SecretAccessKey': secretAccessKey,
      if (sessionToken != null) 'SessionToken': sessionToken,
    };
  }
}

class GetTemporaryGlueTableCredentialsResponse {
  /// The access key ID for the temporary credentials.
  final String? accessKeyId;

  /// The date and time when the temporary credentials expire.
  final DateTime? expiration;

  /// The secret key for the temporary credentials.
  final String? secretAccessKey;

  /// The session token for the temporary credentials.
  final String? sessionToken;

  /// The Amazon S3 path for the temporary credentials.
  final List<String>? vendedS3Path;

  GetTemporaryGlueTableCredentialsResponse({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
    this.vendedS3Path,
  });

  factory GetTemporaryGlueTableCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTemporaryGlueTableCredentialsResponse(
      accessKeyId: json['AccessKeyId'] as String?,
      expiration: timeStampFromJson(json['Expiration']),
      secretAccessKey: json['SecretAccessKey'] as String?,
      sessionToken: json['SessionToken'] as String?,
      vendedS3Path: (json['VendedS3Path'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    final vendedS3Path = this.vendedS3Path;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (expiration != null) 'Expiration': unixTimestampToJson(expiration),
      if (secretAccessKey != null) 'SecretAccessKey': secretAccessKey,
      if (sessionToken != null) 'SessionToken': sessionToken,
      if (vendedS3Path != null) 'VendedS3Path': vendedS3Path,
    };
  }
}

/// A structure for the output.
class GetWorkUnitResultsResponse {
  /// Rows returned from the <code>GetWorkUnitResults</code> operation as a stream
  /// of Apache Arrow v1.0 messages.
  final Uint8List? resultStream;

  GetWorkUnitResultsResponse({
    this.resultStream,
  });

  Map<String, dynamic> toJson() {
    final resultStream = this.resultStream;
    return {
      if (resultStream != null) 'ResultStream': base64Encode(resultStream),
    };
  }
}

/// A structure for the output.
class GetWorkUnitsResponse {
  /// The ID of the plan query operation.
  final String queryId;

  /// A <code>WorkUnitRangeList</code> object that specifies the valid range of
  /// work unit IDs for querying the execution service.
  final List<WorkUnitRange> workUnitRanges;

  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  GetWorkUnitsResponse({
    required this.queryId,
    required this.workUnitRanges,
    this.nextToken,
  });

  factory GetWorkUnitsResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkUnitsResponse(
      queryId: json['QueryId'] as String,
      workUnitRanges: (json['WorkUnitRanges'] as List)
          .whereNotNull()
          .map((e) => WorkUnitRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    final workUnitRanges = this.workUnitRanges;
    final nextToken = this.nextToken;
    return {
      'QueryId': queryId,
      'WorkUnitRanges': workUnitRanges,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GrantPermissionsResponse {
  GrantPermissionsResponse();

  factory GrantPermissionsResponse.fromJson(Map<String, dynamic> _) {
    return GrantPermissionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that allows an admin to grant user permissions on certain
/// conditions. For example, granting a role access to all columns that do not
/// have the LF-tag 'PII' in tables that have the LF-tag 'Prod'.
class LFTag {
  /// The key-name for the LF-tag.
  final String tagKey;

  /// A list of possible values an attribute can take.
  ///
  /// The maximum number of values that can be defined for a LF-Tag is 1000. A
  /// single API call supports 50 values. You can use multiple API calls to add
  /// more values.
  final List<String> tagValues;

  LFTag({
    required this.tagKey,
    required this.tagValues,
  });

  factory LFTag.fromJson(Map<String, dynamic> json) {
    return LFTag(
      tagKey: json['TagKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    return {
      'TagKey': tagKey,
      'TagValues': tagValues,
    };
  }
}

/// A structure containing an error related to a <code>TagResource</code> or
/// <code>UnTagResource</code> operation.
class LFTagError {
  /// An error that occurred with the attachment or detachment of the LF-tag.
  final ErrorDetail? error;

  /// The key-name of the LF-tag.
  final LFTagPair? lFTag;

  LFTagError({
    this.error,
    this.lFTag,
  });

  factory LFTagError.fromJson(Map<String, dynamic> json) {
    return LFTagError(
      error: json['Error'] != null
          ? ErrorDetail.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lFTag: json['LFTag'] != null
          ? LFTagPair.fromJson(json['LFTag'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final lFTag = this.lFTag;
    return {
      if (error != null) 'Error': error,
      if (lFTag != null) 'LFTag': lFTag,
    };
  }
}

/// A structure containing an LF-tag key and values for a resource.
class LFTagKeyResource {
  /// The key-name for the LF-tag.
  final String tagKey;

  /// A list of possible values an attribute can take.
  final List<String> tagValues;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your Lake
  /// Formation environment.
  final String? catalogId;

  LFTagKeyResource({
    required this.tagKey,
    required this.tagValues,
    this.catalogId,
  });

  factory LFTagKeyResource.fromJson(Map<String, dynamic> json) {
    return LFTagKeyResource(
      tagKey: json['TagKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      catalogId: json['CatalogId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    final catalogId = this.catalogId;
    return {
      'TagKey': tagKey,
      'TagValues': tagValues,
      if (catalogId != null) 'CatalogId': catalogId,
    };
  }
}

/// A structure containing an LF-tag key-value pair.
class LFTagPair {
  /// The key-name for the LF-tag.
  final String tagKey;

  /// A list of possible values an attribute can take.
  final List<String> tagValues;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your Lake
  /// Formation environment.
  final String? catalogId;

  LFTagPair({
    required this.tagKey,
    required this.tagValues,
    this.catalogId,
  });

  factory LFTagPair.fromJson(Map<String, dynamic> json) {
    return LFTagPair(
      tagKey: json['TagKey'] as String,
      tagValues: (json['TagValues'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      catalogId: json['CatalogId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    final catalogId = this.catalogId;
    return {
      'TagKey': tagKey,
      'TagValues': tagValues,
      if (catalogId != null) 'CatalogId': catalogId,
    };
  }
}

/// A structure containing a list of LF-tag conditions that apply to a
/// resource's LF-tag policy.
class LFTagPolicyResource {
  /// A list of LF-tag conditions that apply to the resource's LF-tag policy.
  final List<LFTag> expression;

  /// The resource type for which the LF-tag policy applies.
  final ResourceType resourceType;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your Lake
  /// Formation environment.
  final String? catalogId;

  LFTagPolicyResource({
    required this.expression,
    required this.resourceType,
    this.catalogId,
  });

  factory LFTagPolicyResource.fromJson(Map<String, dynamic> json) {
    return LFTagPolicyResource(
      expression: (json['Expression'] as List)
          .whereNotNull()
          .map((e) => LFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as String).toResourceType(),
      catalogId: json['CatalogId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final resourceType = this.resourceType;
    final catalogId = this.catalogId;
    return {
      'Expression': expression,
      'ResourceType': resourceType.toValue(),
      if (catalogId != null) 'CatalogId': catalogId,
    };
  }
}

/// A single principal-resource pair that has Lake Formation permissins
/// enforced.
class LakeFormationOptInsInfo {
  /// The last modified date and time of the record.
  final DateTime? lastModified;

  /// The user who updated the record.
  final String? lastUpdatedBy;
  final DataLakePrincipal? principal;
  final Resource? resource;

  LakeFormationOptInsInfo({
    this.lastModified,
    this.lastUpdatedBy,
    this.principal,
    this.resource,
  });

  factory LakeFormationOptInsInfo.fromJson(Map<String, dynamic> json) {
    return LakeFormationOptInsInfo(
      lastModified: timeStampFromJson(json['LastModified']),
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      principal: json['Principal'] != null
          ? DataLakePrincipal.fromJson(
              json['Principal'] as Map<String, dynamic>)
          : null,
      resource: json['Resource'] != null
          ? Resource.fromJson(json['Resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModified = this.lastModified;
    final lastUpdatedBy = this.lastUpdatedBy;
    final principal = this.principal;
    final resource = this.resource;
    return {
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (lastUpdatedBy != null) 'LastUpdatedBy': lastUpdatedBy,
      if (principal != null) 'Principal': principal,
      if (resource != null) 'Resource': resource,
    };
  }
}

class ListDataCellsFilterResponse {
  /// A list of <code>DataCellFilter</code> structures.
  final List<DataCellsFilter>? dataCellsFilters;

  /// A continuation token, if not all requested data cell filters have been
  /// returned.
  final String? nextToken;

  ListDataCellsFilterResponse({
    this.dataCellsFilters,
    this.nextToken,
  });

  factory ListDataCellsFilterResponse.fromJson(Map<String, dynamic> json) {
    return ListDataCellsFilterResponse(
      dataCellsFilters: (json['DataCellsFilters'] as List?)
          ?.whereNotNull()
          .map((e) => DataCellsFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataCellsFilters = this.dataCellsFilters;
    final nextToken = this.nextToken;
    return {
      if (dataCellsFilters != null) 'DataCellsFilters': dataCellsFilters,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLFTagsResponse {
  /// A list of LF-tags that the requested has permission to view.
  final List<LFTagPair>? lFTags;

  /// A continuation token, present if the current list segment is not the last.
  final String? nextToken;

  ListLFTagsResponse({
    this.lFTags,
    this.nextToken,
  });

  factory ListLFTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListLFTagsResponse(
      lFTags: (json['LFTags'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lFTags = this.lFTags;
    final nextToken = this.nextToken;
    return {
      if (lFTags != null) 'LFTags': lFTags,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLakeFormationOptInsResponse {
  /// A list of principal-resource pairs that have Lake Formation permissins
  /// enforced.
  final List<LakeFormationOptInsInfo>? lakeFormationOptInsInfoList;

  /// A continuation token, if this is not the first call to retrieve this list.
  final String? nextToken;

  ListLakeFormationOptInsResponse({
    this.lakeFormationOptInsInfoList,
    this.nextToken,
  });

  factory ListLakeFormationOptInsResponse.fromJson(Map<String, dynamic> json) {
    return ListLakeFormationOptInsResponse(
      lakeFormationOptInsInfoList:
          (json['LakeFormationOptInsInfoList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  LakeFormationOptInsInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lakeFormationOptInsInfoList = this.lakeFormationOptInsInfoList;
    final nextToken = this.nextToken;
    return {
      if (lakeFormationOptInsInfoList != null)
        'LakeFormationOptInsInfoList': lakeFormationOptInsInfoList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPermissionsResponse {
  /// A continuation token, if this is not the first call to retrieve this list.
  final String? nextToken;

  /// A list of principals and their permissions on the resource for the specified
  /// principal and resource types.
  final List<PrincipalResourcePermissions>? principalResourcePermissions;

  ListPermissionsResponse({
    this.nextToken,
    this.principalResourcePermissions,
  });

  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionsResponse(
      nextToken: json['NextToken'] as String?,
      principalResourcePermissions: (json['PrincipalResourcePermissions']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              PrincipalResourcePermissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final principalResourcePermissions = this.principalResourcePermissions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (principalResourcePermissions != null)
        'PrincipalResourcePermissions': principalResourcePermissions,
    };
  }
}

class ListResourcesResponse {
  /// A continuation token, if this is not the first call to retrieve these
  /// resources.
  final String? nextToken;

  /// A summary of the data lake resources.
  final List<ResourceInfo>? resourceInfoList;

  ListResourcesResponse({
    this.nextToken,
    this.resourceInfoList,
  });

  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesResponse(
      nextToken: json['NextToken'] as String?,
      resourceInfoList: (json['ResourceInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceInfoList = this.resourceInfoList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceInfoList != null) 'ResourceInfoList': resourceInfoList,
    };
  }
}

class ListTableStorageOptimizersResponse {
  /// A continuation token for paginating the returned list of tokens, returned if
  /// the current segment of the list is not the last.
  final String? nextToken;

  /// A list of the storage optimizers associated with a table.
  final List<StorageOptimizer>? storageOptimizerList;

  ListTableStorageOptimizersResponse({
    this.nextToken,
    this.storageOptimizerList,
  });

  factory ListTableStorageOptimizersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTableStorageOptimizersResponse(
      nextToken: json['NextToken'] as String?,
      storageOptimizerList: (json['StorageOptimizerList'] as List?)
          ?.whereNotNull()
          .map((e) => StorageOptimizer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storageOptimizerList = this.storageOptimizerList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storageOptimizerList != null)
        'StorageOptimizerList': storageOptimizerList,
    };
  }
}

class ListTransactionsResponse {
  /// A continuation token indicating whether additional data is available.
  final String? nextToken;

  /// A list of transactions. The record for each transaction is a
  /// <code>TransactionDescription</code> object.
  final List<TransactionDescription>? transactions;

  ListTransactionsResponse({
    this.nextToken,
    this.transactions,
  });

  factory ListTransactionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTransactionsResponse(
      nextToken: json['NextToken'] as String?,
      transactions: (json['Transactions'] as List?)
          ?.whereNotNull()
          .map(
              (e) => TransactionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final transactions = this.transactions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (transactions != null) 'Transactions': transactions,
    };
  }
}

enum OptimizerType {
  compaction,
  garbageCollection,
  all,
}

extension OptimizerTypeValueExtension on OptimizerType {
  String toValue() {
    switch (this) {
      case OptimizerType.compaction:
        return 'COMPACTION';
      case OptimizerType.garbageCollection:
        return 'GARBAGE_COLLECTION';
      case OptimizerType.all:
        return 'ALL';
    }
  }
}

extension OptimizerTypeFromString on String {
  OptimizerType toOptimizerType() {
    switch (this) {
      case 'COMPACTION':
        return OptimizerType.compaction;
      case 'GARBAGE_COLLECTION':
        return OptimizerType.garbageCollection;
      case 'ALL':
        return OptimizerType.all;
    }
    throw Exception('$this is not known in enum OptimizerType');
  }
}

/// A structure containing a list of partition values and table objects.
class PartitionObjects {
  /// A list of table objects
  final List<TableObject>? objects;

  /// A list of partition values.
  final List<String>? partitionValues;

  PartitionObjects({
    this.objects,
    this.partitionValues,
  });

  factory PartitionObjects.fromJson(Map<String, dynamic> json) {
    return PartitionObjects(
      objects: (json['Objects'] as List?)
          ?.whereNotNull()
          .map((e) => TableObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      partitionValues: (json['PartitionValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final objects = this.objects;
    final partitionValues = this.partitionValues;
    return {
      if (objects != null) 'Objects': objects,
      if (partitionValues != null) 'PartitionValues': partitionValues,
    };
  }
}

/// Contains a list of values defining partitions.
class PartitionValueList {
  /// The list of partition values.
  final List<String> values;

  PartitionValueList({
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final values = this.values;
    return {
      'Values': values,
    };
  }
}

enum Permission {
  all,
  select,
  alter,
  drop,
  delete,
  insert,
  describe,
  createDatabase,
  createTable,
  dataLocationAccess,
  createLfTag,
  associate,
  grantWithLfTagExpression,
}

extension PermissionValueExtension on Permission {
  String toValue() {
    switch (this) {
      case Permission.all:
        return 'ALL';
      case Permission.select:
        return 'SELECT';
      case Permission.alter:
        return 'ALTER';
      case Permission.drop:
        return 'DROP';
      case Permission.delete:
        return 'DELETE';
      case Permission.insert:
        return 'INSERT';
      case Permission.describe:
        return 'DESCRIBE';
      case Permission.createDatabase:
        return 'CREATE_DATABASE';
      case Permission.createTable:
        return 'CREATE_TABLE';
      case Permission.dataLocationAccess:
        return 'DATA_LOCATION_ACCESS';
      case Permission.createLfTag:
        return 'CREATE_LF_TAG';
      case Permission.associate:
        return 'ASSOCIATE';
      case Permission.grantWithLfTagExpression:
        return 'GRANT_WITH_LF_TAG_EXPRESSION';
    }
  }
}

extension PermissionFromString on String {
  Permission toPermission() {
    switch (this) {
      case 'ALL':
        return Permission.all;
      case 'SELECT':
        return Permission.select;
      case 'ALTER':
        return Permission.alter;
      case 'DROP':
        return Permission.drop;
      case 'DELETE':
        return Permission.delete;
      case 'INSERT':
        return Permission.insert;
      case 'DESCRIBE':
        return Permission.describe;
      case 'CREATE_DATABASE':
        return Permission.createDatabase;
      case 'CREATE_TABLE':
        return Permission.createTable;
      case 'DATA_LOCATION_ACCESS':
        return Permission.dataLocationAccess;
      case 'CREATE_LF_TAG':
        return Permission.createLfTag;
      case 'ASSOCIATE':
        return Permission.associate;
      case 'GRANT_WITH_LF_TAG_EXPRESSION':
        return Permission.grantWithLfTagExpression;
    }
    throw Exception('$this is not known in enum Permission');
  }
}

enum PermissionType {
  columnPermission,
  cellFilterPermission,
  nestedPermission,
  nestedCellPermission,
}

extension PermissionTypeValueExtension on PermissionType {
  String toValue() {
    switch (this) {
      case PermissionType.columnPermission:
        return 'COLUMN_PERMISSION';
      case PermissionType.cellFilterPermission:
        return 'CELL_FILTER_PERMISSION';
      case PermissionType.nestedPermission:
        return 'NESTED_PERMISSION';
      case PermissionType.nestedCellPermission:
        return 'NESTED_CELL_PERMISSION';
    }
  }
}

extension PermissionTypeFromString on String {
  PermissionType toPermissionType() {
    switch (this) {
      case 'COLUMN_PERMISSION':
        return PermissionType.columnPermission;
      case 'CELL_FILTER_PERMISSION':
        return PermissionType.cellFilterPermission;
      case 'NESTED_PERMISSION':
        return PermissionType.nestedPermission;
      case 'NESTED_CELL_PERMISSION':
        return PermissionType.nestedCellPermission;
    }
    throw Exception('$this is not known in enum PermissionType');
  }
}

/// Statistics related to the processing of a query statement.
class PlanningStatistics {
  /// An estimate of the data that was scanned in bytes.
  final int? estimatedDataToScanBytes;

  /// The time that it took to process the request.
  final int? planningTimeMillis;

  /// The time the request was in queue to be processed.
  final int? queueTimeMillis;

  /// The number of work units generated.
  final int? workUnitsGeneratedCount;

  PlanningStatistics({
    this.estimatedDataToScanBytes,
    this.planningTimeMillis,
    this.queueTimeMillis,
    this.workUnitsGeneratedCount,
  });

  factory PlanningStatistics.fromJson(Map<String, dynamic> json) {
    return PlanningStatistics(
      estimatedDataToScanBytes: json['EstimatedDataToScanBytes'] as int?,
      planningTimeMillis: json['PlanningTimeMillis'] as int?,
      queueTimeMillis: json['QueueTimeMillis'] as int?,
      workUnitsGeneratedCount: json['WorkUnitsGeneratedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedDataToScanBytes = this.estimatedDataToScanBytes;
    final planningTimeMillis = this.planningTimeMillis;
    final queueTimeMillis = this.queueTimeMillis;
    final workUnitsGeneratedCount = this.workUnitsGeneratedCount;
    return {
      if (estimatedDataToScanBytes != null)
        'EstimatedDataToScanBytes': estimatedDataToScanBytes,
      if (planningTimeMillis != null) 'PlanningTimeMillis': planningTimeMillis,
      if (queueTimeMillis != null) 'QueueTimeMillis': queueTimeMillis,
      if (workUnitsGeneratedCount != null)
        'WorkUnitsGeneratedCount': workUnitsGeneratedCount,
    };
  }
}

/// Permissions granted to a principal.
class PrincipalPermissions {
  /// The permissions that are granted to the principal.
  final List<Permission>? permissions;

  /// The principal who is granted permissions.
  final DataLakePrincipal? principal;

  PrincipalPermissions({
    this.permissions,
    this.principal,
  });

  factory PrincipalPermissions.fromJson(Map<String, dynamic> json) {
    return PrincipalPermissions(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPermission())
          .toList(),
      principal: json['Principal'] != null
          ? DataLakePrincipal.fromJson(
              json['Principal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final principal = this.principal;
    return {
      if (permissions != null)
        'Permissions': permissions.map((e) => e.toValue()).toList(),
      if (principal != null) 'Principal': principal,
    };
  }
}

/// The permissions granted or revoked on a resource.
class PrincipalResourcePermissions {
  /// This attribute can be used to return any additional details of
  /// <code>PrincipalResourcePermissions</code>. Currently returns only as a RAM
  /// resource share ARN.
  final DetailsMap? additionalDetails;

  /// The date and time when the resource was last updated.
  final DateTime? lastUpdated;

  /// The user who updated the record.
  final String? lastUpdatedBy;

  /// The permissions to be granted or revoked on the resource.
  final List<Permission>? permissions;

  /// Indicates whether to grant the ability to grant permissions (as a subset of
  /// permissions granted).
  final List<Permission>? permissionsWithGrantOption;

  /// The Data Lake principal to be granted or revoked permissions.
  final DataLakePrincipal? principal;

  /// The resource where permissions are to be granted or revoked.
  final Resource? resource;

  PrincipalResourcePermissions({
    this.additionalDetails,
    this.lastUpdated,
    this.lastUpdatedBy,
    this.permissions,
    this.permissionsWithGrantOption,
    this.principal,
    this.resource,
  });

  factory PrincipalResourcePermissions.fromJson(Map<String, dynamic> json) {
    return PrincipalResourcePermissions(
      additionalDetails: json['AdditionalDetails'] != null
          ? DetailsMap.fromJson(
              json['AdditionalDetails'] as Map<String, dynamic>)
          : null,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPermission())
          .toList(),
      permissionsWithGrantOption: (json['PermissionsWithGrantOption'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPermission())
          .toList(),
      principal: json['Principal'] != null
          ? DataLakePrincipal.fromJson(
              json['Principal'] as Map<String, dynamic>)
          : null,
      resource: json['Resource'] != null
          ? Resource.fromJson(json['Resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalDetails = this.additionalDetails;
    final lastUpdated = this.lastUpdated;
    final lastUpdatedBy = this.lastUpdatedBy;
    final permissions = this.permissions;
    final permissionsWithGrantOption = this.permissionsWithGrantOption;
    final principal = this.principal;
    final resource = this.resource;
    return {
      if (additionalDetails != null) 'AdditionalDetails': additionalDetails,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (lastUpdatedBy != null) 'LastUpdatedBy': lastUpdatedBy,
      if (permissions != null)
        'Permissions': permissions.map((e) => e.toValue()).toList(),
      if (permissionsWithGrantOption != null)
        'PermissionsWithGrantOption':
            permissionsWithGrantOption.map((e) => e.toValue()).toList(),
      if (principal != null) 'Principal': principal,
      if (resource != null) 'Resource': resource,
    };
  }
}

class PutDataLakeSettingsResponse {
  PutDataLakeSettingsResponse();

  factory PutDataLakeSettingsResponse.fromJson(Map<String, dynamic> _) {
    return PutDataLakeSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure containing information about the query plan.
class QueryPlanningContext {
  /// The database containing the table.
  final String databaseName;

  /// The ID of the Data Catalog where the partition in question resides. If none
  /// is provided, the Amazon Web Services account ID is used by default.
  final String? catalogId;

  /// The time as of when to read the table contents. If not set, the most recent
  /// transaction commit time will be used. Cannot be specified along with
  /// <code>TransactionId</code>.
  final DateTime? queryAsOfTime;

  /// A map consisting of key-value pairs.
  final Map<String, String>? queryParameters;

  /// The transaction ID at which to read the table contents. If this transaction
  /// is not committed, the read will be treated as part of that transaction and
  /// will see its writes. If this transaction has aborted, an error will be
  /// returned. If not set, defaults to the most recent committed transaction.
  /// Cannot be specified along with <code>QueryAsOfTime</code>.
  final String? transactionId;

  QueryPlanningContext({
    required this.databaseName,
    this.catalogId,
    this.queryAsOfTime,
    this.queryParameters,
    this.transactionId,
  });

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final catalogId = this.catalogId;
    final queryAsOfTime = this.queryAsOfTime;
    final queryParameters = this.queryParameters;
    final transactionId = this.transactionId;
    return {
      'DatabaseName': databaseName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (queryAsOfTime != null)
        'QueryAsOfTime': unixTimestampToJson(queryAsOfTime),
      if (queryParameters != null) 'QueryParameters': queryParameters,
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

/// A structure used as a protocol between query engines and Lake Formation or
/// Glue. Contains both a Lake Formation generated authorization identifier and
/// information from the request's authorization context.
class QuerySessionContext {
  /// An opaque string-string map passed by the query engine.
  final Map<String, String>? additionalContext;

  /// An identifier string for the consumer cluster.
  final String? clusterId;

  /// A cryptographically generated query identifier generated by Glue or Lake
  /// Formation.
  final String? queryAuthorizationId;

  /// A unique identifier generated by the query engine for the query.
  final String? queryId;

  /// A timestamp provided by the query engine for when the query started.
  final DateTime? queryStartTime;

  QuerySessionContext({
    this.additionalContext,
    this.clusterId,
    this.queryAuthorizationId,
    this.queryId,
    this.queryStartTime,
  });

  Map<String, dynamic> toJson() {
    final additionalContext = this.additionalContext;
    final clusterId = this.clusterId;
    final queryAuthorizationId = this.queryAuthorizationId;
    final queryId = this.queryId;
    final queryStartTime = this.queryStartTime;
    return {
      if (additionalContext != null) 'AdditionalContext': additionalContext,
      if (clusterId != null) 'ClusterId': clusterId,
      if (queryAuthorizationId != null)
        'QueryAuthorizationId': queryAuthorizationId,
      if (queryId != null) 'QueryId': queryId,
      if (queryStartTime != null)
        'QueryStartTime': unixTimestampToJson(queryStartTime),
    };
  }
}

enum QueryStateString {
  pending,
  workunitsAvailable,
  error,
  finished,
  expired,
}

extension QueryStateStringValueExtension on QueryStateString {
  String toValue() {
    switch (this) {
      case QueryStateString.pending:
        return 'PENDING';
      case QueryStateString.workunitsAvailable:
        return 'WORKUNITS_AVAILABLE';
      case QueryStateString.error:
        return 'ERROR';
      case QueryStateString.finished:
        return 'FINISHED';
      case QueryStateString.expired:
        return 'EXPIRED';
    }
  }
}

extension QueryStateStringFromString on String {
  QueryStateString toQueryStateString() {
    switch (this) {
      case 'PENDING':
        return QueryStateString.pending;
      case 'WORKUNITS_AVAILABLE':
        return QueryStateString.workunitsAvailable;
      case 'ERROR':
        return QueryStateString.error;
      case 'FINISHED':
        return QueryStateString.finished;
      case 'EXPIRED':
        return QueryStateString.expired;
    }
    throw Exception('$this is not known in enum QueryStateString');
  }
}

class RegisterResourceResponse {
  RegisterResourceResponse();

  factory RegisterResourceResponse.fromJson(Map<String, dynamic> _) {
    return RegisterResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveLFTagsFromResourceResponse {
  /// A list of failures to untag a resource.
  final List<LFTagError>? failures;

  RemoveLFTagsFromResourceResponse({
    this.failures,
  });

  factory RemoveLFTagsFromResourceResponse.fromJson(Map<String, dynamic> json) {
    return RemoveLFTagsFromResourceResponse(
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

/// A structure for the resource.
class Resource {
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your Lake
  /// Formation environment.
  final CatalogResource? catalog;

  /// A data cell filter.
  final DataCellsFilterResource? dataCellsFilter;

  /// The location of an Amazon S3 path where permissions are granted or revoked.
  final DataLocationResource? dataLocation;

  /// The database for the resource. Unique to the Data Catalog. A database is a
  /// set of associated table definitions organized into a logical group. You can
  /// Grant and Revoke database permissions to a principal.
  final DatabaseResource? database;

  /// The LF-tag key and values attached to a resource.
  final LFTagKeyResource? lFTag;

  /// A list of LF-tag conditions that define a resource's LF-tag policy.
  final LFTagPolicyResource? lFTagPolicy;

  /// The table for the resource. A table is a metadata definition that represents
  /// your data. You can Grant and Revoke table privileges to a principal.
  final TableResource? table;

  /// The table with columns for the resource. A principal with permissions to
  /// this resource can select metadata from the columns of a table in the Data
  /// Catalog and the underlying data in Amazon S3.
  final TableWithColumnsResource? tableWithColumns;

  Resource({
    this.catalog,
    this.dataCellsFilter,
    this.dataLocation,
    this.database,
    this.lFTag,
    this.lFTagPolicy,
    this.table,
    this.tableWithColumns,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      catalog: json['Catalog'] != null
          ? CatalogResource.fromJson(json['Catalog'] as Map<String, dynamic>)
          : null,
      dataCellsFilter: json['DataCellsFilter'] != null
          ? DataCellsFilterResource.fromJson(
              json['DataCellsFilter'] as Map<String, dynamic>)
          : null,
      dataLocation: json['DataLocation'] != null
          ? DataLocationResource.fromJson(
              json['DataLocation'] as Map<String, dynamic>)
          : null,
      database: json['Database'] != null
          ? DatabaseResource.fromJson(json['Database'] as Map<String, dynamic>)
          : null,
      lFTag: json['LFTag'] != null
          ? LFTagKeyResource.fromJson(json['LFTag'] as Map<String, dynamic>)
          : null,
      lFTagPolicy: json['LFTagPolicy'] != null
          ? LFTagPolicyResource.fromJson(
              json['LFTagPolicy'] as Map<String, dynamic>)
          : null,
      table: json['Table'] != null
          ? TableResource.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
      tableWithColumns: json['TableWithColumns'] != null
          ? TableWithColumnsResource.fromJson(
              json['TableWithColumns'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final dataCellsFilter = this.dataCellsFilter;
    final dataLocation = this.dataLocation;
    final database = this.database;
    final lFTag = this.lFTag;
    final lFTagPolicy = this.lFTagPolicy;
    final table = this.table;
    final tableWithColumns = this.tableWithColumns;
    return {
      if (catalog != null) 'Catalog': catalog,
      if (dataCellsFilter != null) 'DataCellsFilter': dataCellsFilter,
      if (dataLocation != null) 'DataLocation': dataLocation,
      if (database != null) 'Database': database,
      if (lFTag != null) 'LFTag': lFTag,
      if (lFTagPolicy != null) 'LFTagPolicy': lFTagPolicy,
      if (table != null) 'Table': table,
      if (tableWithColumns != null) 'TableWithColumns': tableWithColumns,
    };
  }
}

/// A structure containing information about an Lake Formation resource.
class ResourceInfo {
  /// Indicates whether the data access of tables pointing to the location can be
  /// managed by both Lake Formation permissions as well as Amazon S3 bucket
  /// policies.
  final bool? hybridAccessEnabled;

  /// The date and time the resource was last modified.
  final DateTime? lastModified;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// The IAM role that registered a resource.
  final String? roleArn;

  /// Whether or not the resource is a federated resource.
  final bool? withFederation;

  ResourceInfo({
    this.hybridAccessEnabled,
    this.lastModified,
    this.resourceArn,
    this.roleArn,
    this.withFederation,
  });

  factory ResourceInfo.fromJson(Map<String, dynamic> json) {
    return ResourceInfo(
      hybridAccessEnabled: json['HybridAccessEnabled'] as bool?,
      lastModified: timeStampFromJson(json['LastModified']),
      resourceArn: json['ResourceArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      withFederation: json['WithFederation'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final hybridAccessEnabled = this.hybridAccessEnabled;
    final lastModified = this.lastModified;
    final resourceArn = this.resourceArn;
    final roleArn = this.roleArn;
    final withFederation = this.withFederation;
    return {
      if (hybridAccessEnabled != null)
        'HybridAccessEnabled': hybridAccessEnabled,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (withFederation != null) 'WithFederation': withFederation,
    };
  }
}

enum ResourceShareType {
  foreign,
  all,
}

extension ResourceShareTypeValueExtension on ResourceShareType {
  String toValue() {
    switch (this) {
      case ResourceShareType.foreign:
        return 'FOREIGN';
      case ResourceShareType.all:
        return 'ALL';
    }
  }
}

extension ResourceShareTypeFromString on String {
  ResourceShareType toResourceShareType() {
    switch (this) {
      case 'FOREIGN':
        return ResourceShareType.foreign;
      case 'ALL':
        return ResourceShareType.all;
    }
    throw Exception('$this is not known in enum ResourceShareType');
  }
}

enum ResourceType {
  database,
  table,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.database:
        return 'DATABASE';
      case ResourceType.table:
        return 'TABLE';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'DATABASE':
        return ResourceType.database;
      case 'TABLE':
        return ResourceType.table;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

class RevokePermissionsResponse {
  RevokePermissionsResponse();

  factory RevokePermissionsResponse.fromJson(Map<String, dynamic> _) {
    return RevokePermissionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A PartiQL predicate.
class RowFilter {
  /// A wildcard for all rows.
  final AllRowsWildcard? allRowsWildcard;

  /// A filter expression.
  final String? filterExpression;

  RowFilter({
    this.allRowsWildcard,
    this.filterExpression,
  });

  factory RowFilter.fromJson(Map<String, dynamic> json) {
    return RowFilter(
      allRowsWildcard: json['AllRowsWildcard'] != null
          ? AllRowsWildcard.fromJson(
              json['AllRowsWildcard'] as Map<String, dynamic>)
          : null,
      filterExpression: json['FilterExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allRowsWildcard = this.allRowsWildcard;
    final filterExpression = this.filterExpression;
    return {
      if (allRowsWildcard != null) 'AllRowsWildcard': allRowsWildcard,
      if (filterExpression != null) 'FilterExpression': filterExpression,
    };
  }
}

class SearchDatabasesByLFTagsResponse {
  /// A list of databases that meet the LF-tag conditions.
  final List<TaggedDatabase>? databaseList;

  /// A continuation token, present if the current list segment is not the last.
  final String? nextToken;

  SearchDatabasesByLFTagsResponse({
    this.databaseList,
    this.nextToken,
  });

  factory SearchDatabasesByLFTagsResponse.fromJson(Map<String, dynamic> json) {
    return SearchDatabasesByLFTagsResponse(
      databaseList: (json['DatabaseList'] as List?)
          ?.whereNotNull()
          .map((e) => TaggedDatabase.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseList = this.databaseList;
    final nextToken = this.nextToken;
    return {
      if (databaseList != null) 'DatabaseList': databaseList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class SearchTablesByLFTagsResponse {
  /// A continuation token, present if the current list segment is not the last.
  /// On the first run, if you include a not null (a value) token you can get
  /// empty pages.
  final String? nextToken;

  /// A list of tables that meet the LF-tag conditions.
  final List<TaggedTable>? tableList;

  SearchTablesByLFTagsResponse({
    this.nextToken,
    this.tableList,
  });

  factory SearchTablesByLFTagsResponse.fromJson(Map<String, dynamic> json) {
    return SearchTablesByLFTagsResponse(
      nextToken: json['NextToken'] as String?,
      tableList: (json['TableList'] as List?)
          ?.whereNotNull()
          .map((e) => TaggedTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tableList = this.tableList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tableList != null) 'TableList': tableList,
    };
  }
}

/// A structure for the output.
class StartQueryPlanningResponse {
  /// The ID of the plan query operation can be used to fetch the actual work unit
  /// descriptors that are produced as the result of the operation. The ID is also
  /// used to get the query state and as an input to the <code>Execute</code>
  /// operation.
  final String queryId;

  StartQueryPlanningResponse({
    required this.queryId,
  });

  factory StartQueryPlanningResponse.fromJson(Map<String, dynamic> json) {
    return StartQueryPlanningResponse(
      queryId: json['QueryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    return {
      'QueryId': queryId,
    };
  }
}

class StartTransactionResponse {
  /// An opaque identifier for the transaction.
  final String? transactionId;

  StartTransactionResponse({
    this.transactionId,
  });

  factory StartTransactionResponse.fromJson(Map<String, dynamic> json) {
    return StartTransactionResponse(
      transactionId: json['TransactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transactionId = this.transactionId;
    return {
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

/// A structure describing the configuration and details of a storage optimizer.
class StorageOptimizer {
  /// A map of the storage optimizer configuration. Currently contains only one
  /// key-value pair: <code>is_enabled</code> indicates true or false for
  /// acceleration.
  final Map<String, String>? config;

  /// A message that contains information about any error (if present).
  ///
  /// When an acceleration result has an enabled status, the error message is
  /// empty.
  ///
  /// When an acceleration result has a disabled status, the message describes an
  /// error or simply indicates "disabled by the user".
  final String? errorMessage;

  /// When an acceleration result has an enabled status, contains the details of
  /// the last job run.
  final String? lastRunDetails;

  /// The specific type of storage optimizer. The supported value is
  /// <code>compaction</code>.
  final OptimizerType? storageOptimizerType;

  /// A message that contains information about any warnings (if present).
  final String? warnings;

  StorageOptimizer({
    this.config,
    this.errorMessage,
    this.lastRunDetails,
    this.storageOptimizerType,
    this.warnings,
  });

  factory StorageOptimizer.fromJson(Map<String, dynamic> json) {
    return StorageOptimizer(
      config: (json['Config'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      errorMessage: json['ErrorMessage'] as String?,
      lastRunDetails: json['LastRunDetails'] as String?,
      storageOptimizerType:
          (json['StorageOptimizerType'] as String?)?.toOptimizerType(),
      warnings: json['Warnings'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final config = this.config;
    final errorMessage = this.errorMessage;
    final lastRunDetails = this.lastRunDetails;
    final storageOptimizerType = this.storageOptimizerType;
    final warnings = this.warnings;
    return {
      if (config != null) 'Config': config,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (lastRunDetails != null) 'LastRunDetails': lastRunDetails,
      if (storageOptimizerType != null)
        'StorageOptimizerType': storageOptimizerType.toValue(),
      if (warnings != null) 'Warnings': warnings,
    };
  }
}

/// Specifies the details of a governed table.
class TableObject {
  /// The Amazon S3 ETag of the object. Returned by <code>GetTableObjects</code>
  /// for validation and used to identify changes to the underlying data.
  final String? eTag;

  /// The size of the Amazon S3 object in bytes.
  final int? size;

  /// The Amazon S3 location of the object.
  final String? uri;

  TableObject({
    this.eTag,
    this.size,
    this.uri,
  });

  factory TableObject.fromJson(Map<String, dynamic> json) {
    return TableObject(
      eTag: json['ETag'] as String?,
      size: json['Size'] as int?,
      uri: json['Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final size = this.size;
    final uri = this.uri;
    return {
      if (eTag != null) 'ETag': eTag,
      if (size != null) 'Size': size,
      if (uri != null) 'Uri': uri,
    };
  }
}

/// A structure for the table object. A table is a metadata definition that
/// represents your data. You can Grant and Revoke table privileges to a
/// principal.
class TableResource {
  /// The name of the database for the table. Unique to a Data Catalog. A database
  /// is a set of associated table definitions organized into a logical group. You
  /// can Grant and Revoke database privileges to a principal.
  final String databaseName;

  /// The identifier for the Data Catalog. By default, it is the account ID of the
  /// caller.
  final String? catalogId;

  /// The name of the table.
  final String? name;

  /// A wildcard object representing every table under a database.
  ///
  /// At least one of <code>TableResource$Name</code> or
  /// <code>TableResource$TableWildcard</code> is required.
  final TableWildcard? tableWildcard;

  TableResource({
    required this.databaseName,
    this.catalogId,
    this.name,
    this.tableWildcard,
  });

  factory TableResource.fromJson(Map<String, dynamic> json) {
    return TableResource(
      databaseName: json['DatabaseName'] as String,
      catalogId: json['CatalogId'] as String?,
      name: json['Name'] as String?,
      tableWildcard: json['TableWildcard'] != null
          ? TableWildcard.fromJson(
              json['TableWildcard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final catalogId = this.catalogId;
    final name = this.name;
    final tableWildcard = this.tableWildcard;
    return {
      'DatabaseName': databaseName,
      if (catalogId != null) 'CatalogId': catalogId,
      if (name != null) 'Name': name,
      if (tableWildcard != null) 'TableWildcard': tableWildcard,
    };
  }
}

/// A wildcard object representing every table under a database.
class TableWildcard {
  TableWildcard();

  factory TableWildcard.fromJson(Map<String, dynamic> _) {
    return TableWildcard();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure for a table with columns object. This object is only used when
/// granting a SELECT permission.
///
/// This object must take a value for at least one of <code>ColumnsNames</code>,
/// <code>ColumnsIndexes</code>, or <code>ColumnsWildcard</code>.
class TableWithColumnsResource {
  /// The name of the database for the table with columns resource. Unique to the
  /// Data Catalog. A database is a set of associated table definitions organized
  /// into a logical group. You can Grant and Revoke database privileges to a
  /// principal.
  final String databaseName;

  /// The name of the table resource. A table is a metadata definition that
  /// represents your data. You can Grant and Revoke table privileges to a
  /// principal.
  final String name;

  /// The identifier for the Data Catalog. By default, it is the account ID of the
  /// caller.
  final String? catalogId;

  /// The list of column names for the table. At least one of
  /// <code>ColumnNames</code> or <code>ColumnWildcard</code> is required.
  final List<String>? columnNames;

  /// A wildcard specified by a <code>ColumnWildcard</code> object. At least one
  /// of <code>ColumnNames</code> or <code>ColumnWildcard</code> is required.
  final ColumnWildcard? columnWildcard;

  TableWithColumnsResource({
    required this.databaseName,
    required this.name,
    this.catalogId,
    this.columnNames,
    this.columnWildcard,
  });

  factory TableWithColumnsResource.fromJson(Map<String, dynamic> json) {
    return TableWithColumnsResource(
      databaseName: json['DatabaseName'] as String,
      name: json['Name'] as String,
      catalogId: json['CatalogId'] as String?,
      columnNames: (json['ColumnNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      columnWildcard: json['ColumnWildcard'] != null
          ? ColumnWildcard.fromJson(
              json['ColumnWildcard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseName = this.databaseName;
    final name = this.name;
    final catalogId = this.catalogId;
    final columnNames = this.columnNames;
    final columnWildcard = this.columnWildcard;
    return {
      'DatabaseName': databaseName,
      'Name': name,
      if (catalogId != null) 'CatalogId': catalogId,
      if (columnNames != null) 'ColumnNames': columnNames,
      if (columnWildcard != null) 'ColumnWildcard': columnWildcard,
    };
  }
}

/// A structure describing a database resource with LF-tags.
class TaggedDatabase {
  /// A database that has LF-tags attached to it.
  final DatabaseResource? database;

  /// A list of LF-tags attached to the database.
  final List<LFTagPair>? lFTags;

  TaggedDatabase({
    this.database,
    this.lFTags,
  });

  factory TaggedDatabase.fromJson(Map<String, dynamic> json) {
    return TaggedDatabase(
      database: json['Database'] != null
          ? DatabaseResource.fromJson(json['Database'] as Map<String, dynamic>)
          : null,
      lFTags: (json['LFTags'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final lFTags = this.lFTags;
    return {
      if (database != null) 'Database': database,
      if (lFTags != null) 'LFTags': lFTags,
    };
  }
}

/// A structure describing a table resource with LF-tags.
class TaggedTable {
  /// A list of LF-tags attached to the database where the table resides.
  final List<LFTagPair>? lFTagOnDatabase;

  /// A list of LF-tags attached to columns in the table.
  final List<ColumnLFTag>? lFTagsOnColumns;

  /// A list of LF-tags attached to the table.
  final List<LFTagPair>? lFTagsOnTable;

  /// A table that has LF-tags attached to it.
  final TableResource? table;

  TaggedTable({
    this.lFTagOnDatabase,
    this.lFTagsOnColumns,
    this.lFTagsOnTable,
    this.table,
  });

  factory TaggedTable.fromJson(Map<String, dynamic> json) {
    return TaggedTable(
      lFTagOnDatabase: (json['LFTagOnDatabase'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      lFTagsOnColumns: (json['LFTagsOnColumns'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnLFTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      lFTagsOnTable: (json['LFTagsOnTable'] as List?)
          ?.whereNotNull()
          .map((e) => LFTagPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      table: json['Table'] != null
          ? TableResource.fromJson(json['Table'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lFTagOnDatabase = this.lFTagOnDatabase;
    final lFTagsOnColumns = this.lFTagsOnColumns;
    final lFTagsOnTable = this.lFTagsOnTable;
    final table = this.table;
    return {
      if (lFTagOnDatabase != null) 'LFTagOnDatabase': lFTagOnDatabase,
      if (lFTagsOnColumns != null) 'LFTagsOnColumns': lFTagsOnColumns,
      if (lFTagsOnTable != null) 'LFTagsOnTable': lFTagsOnTable,
      if (table != null) 'Table': table,
    };
  }
}

/// A structure that contains information about a transaction.
class TransactionDescription {
  /// The time when the transaction committed or aborted, if it is not currently
  /// active.
  final DateTime? transactionEndTime;

  /// The ID of the transaction.
  final String? transactionId;

  /// The time when the transaction started.
  final DateTime? transactionStartTime;

  /// A status of ACTIVE, COMMITTED, or ABORTED.
  final TransactionStatus? transactionStatus;

  TransactionDescription({
    this.transactionEndTime,
    this.transactionId,
    this.transactionStartTime,
    this.transactionStatus,
  });

  factory TransactionDescription.fromJson(Map<String, dynamic> json) {
    return TransactionDescription(
      transactionEndTime: timeStampFromJson(json['TransactionEndTime']),
      transactionId: json['TransactionId'] as String?,
      transactionStartTime: timeStampFromJson(json['TransactionStartTime']),
      transactionStatus:
          (json['TransactionStatus'] as String?)?.toTransactionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final transactionEndTime = this.transactionEndTime;
    final transactionId = this.transactionId;
    final transactionStartTime = this.transactionStartTime;
    final transactionStatus = this.transactionStatus;
    return {
      if (transactionEndTime != null)
        'TransactionEndTime': unixTimestampToJson(transactionEndTime),
      if (transactionId != null) 'TransactionId': transactionId,
      if (transactionStartTime != null)
        'TransactionStartTime': unixTimestampToJson(transactionStartTime),
      if (transactionStatus != null)
        'TransactionStatus': transactionStatus.toValue(),
    };
  }
}

enum TransactionStatus {
  active,
  committed,
  aborted,
  commitInProgress,
}

extension TransactionStatusValueExtension on TransactionStatus {
  String toValue() {
    switch (this) {
      case TransactionStatus.active:
        return 'ACTIVE';
      case TransactionStatus.committed:
        return 'COMMITTED';
      case TransactionStatus.aborted:
        return 'ABORTED';
      case TransactionStatus.commitInProgress:
        return 'COMMIT_IN_PROGRESS';
    }
  }
}

extension TransactionStatusFromString on String {
  TransactionStatus toTransactionStatus() {
    switch (this) {
      case 'ACTIVE':
        return TransactionStatus.active;
      case 'COMMITTED':
        return TransactionStatus.committed;
      case 'ABORTED':
        return TransactionStatus.aborted;
      case 'COMMIT_IN_PROGRESS':
        return TransactionStatus.commitInProgress;
    }
    throw Exception('$this is not known in enum TransactionStatus');
  }
}

enum TransactionStatusFilter {
  all,
  completed,
  active,
  committed,
  aborted,
}

extension TransactionStatusFilterValueExtension on TransactionStatusFilter {
  String toValue() {
    switch (this) {
      case TransactionStatusFilter.all:
        return 'ALL';
      case TransactionStatusFilter.completed:
        return 'COMPLETED';
      case TransactionStatusFilter.active:
        return 'ACTIVE';
      case TransactionStatusFilter.committed:
        return 'COMMITTED';
      case TransactionStatusFilter.aborted:
        return 'ABORTED';
    }
  }
}

extension TransactionStatusFilterFromString on String {
  TransactionStatusFilter toTransactionStatusFilter() {
    switch (this) {
      case 'ALL':
        return TransactionStatusFilter.all;
      case 'COMPLETED':
        return TransactionStatusFilter.completed;
      case 'ACTIVE':
        return TransactionStatusFilter.active;
      case 'COMMITTED':
        return TransactionStatusFilter.committed;
      case 'ABORTED':
        return TransactionStatusFilter.aborted;
    }
    throw Exception('$this is not known in enum TransactionStatusFilter');
  }
}

enum TransactionType {
  readAndWrite,
  readOnly,
}

extension TransactionTypeValueExtension on TransactionType {
  String toValue() {
    switch (this) {
      case TransactionType.readAndWrite:
        return 'READ_AND_WRITE';
      case TransactionType.readOnly:
        return 'READ_ONLY';
    }
  }
}

extension TransactionTypeFromString on String {
  TransactionType toTransactionType() {
    switch (this) {
      case 'READ_AND_WRITE':
        return TransactionType.readAndWrite;
      case 'READ_ONLY':
        return TransactionType.readOnly;
    }
    throw Exception('$this is not known in enum TransactionType');
  }
}

class UpdateDataCellsFilterResponse {
  UpdateDataCellsFilterResponse();

  factory UpdateDataCellsFilterResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDataCellsFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLFTagResponse {
  UpdateLFTagResponse();

  factory UpdateLFTagResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLFTagResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLakeFormationIdentityCenterConfigurationResponse {
  UpdateLakeFormationIdentityCenterConfigurationResponse();

  factory UpdateLakeFormationIdentityCenterConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateLakeFormationIdentityCenterConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourceResponse {
  UpdateResourceResponse();

  factory UpdateResourceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTableObjectsResponse {
  UpdateTableObjectsResponse();

  factory UpdateTableObjectsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTableObjectsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTableStorageOptimizerResponse {
  /// A response indicating the success of failure of the operation.
  final String? result;

  UpdateTableStorageOptimizerResponse({
    this.result,
  });

  factory UpdateTableStorageOptimizerResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateTableStorageOptimizerResponse(
      result: json['Result'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final result = this.result;
    return {
      if (result != null) 'Result': result,
    };
  }
}

/// An object that defines an Amazon S3 object to be deleted if a transaction
/// cancels, provided that <code>VirtualPut</code> was called before writing the
/// object.
class VirtualObject {
  /// The path to the Amazon S3 object. Must start with s3://
  final String uri;

  /// The ETag of the Amazon S3 object.
  final String? eTag;

  VirtualObject({
    required this.uri,
    this.eTag,
  });

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    final eTag = this.eTag;
    return {
      'Uri': uri,
      if (eTag != null) 'ETag': eTag,
    };
  }
}

/// Defines the valid range of work unit IDs for querying the execution service.
class WorkUnitRange {
  /// Defines the maximum work unit ID in the range. The maximum value is
  /// inclusive.
  final int workUnitIdMax;

  /// Defines the minimum work unit ID in the range.
  final int workUnitIdMin;

  /// A work token used to query the execution service.
  final String workUnitToken;

  WorkUnitRange({
    required this.workUnitIdMax,
    required this.workUnitIdMin,
    required this.workUnitToken,
  });

  factory WorkUnitRange.fromJson(Map<String, dynamic> json) {
    return WorkUnitRange(
      workUnitIdMax: json['WorkUnitIdMax'] as int,
      workUnitIdMin: json['WorkUnitIdMin'] as int,
      workUnitToken: json['WorkUnitToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final workUnitIdMax = this.workUnitIdMax;
    final workUnitIdMin = this.workUnitIdMin;
    final workUnitToken = this.workUnitToken;
    return {
      'WorkUnitIdMax': workUnitIdMax,
      'WorkUnitIdMin': workUnitIdMin,
      'WorkUnitToken': workUnitToken,
    };
  }
}

/// Defines an object to add to or delete from a governed table.
class WriteOperation {
  /// A new object to add to the governed table.
  final AddObjectInput? addObject;

  /// An object to delete from the governed table.
  final DeleteObjectInput? deleteObject;

  WriteOperation({
    this.addObject,
    this.deleteObject,
  });

  Map<String, dynamic> toJson() {
    final addObject = this.addObject;
    final deleteObject = this.deleteObject;
    return {
      if (addObject != null) 'AddObject': addObject,
      if (deleteObject != null) 'DeleteObject': deleteObject,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class EntityNotFoundException extends _s.GenericAwsException {
  EntityNotFoundException({String? type, String? message})
      : super(type: type, code: 'EntityNotFoundException', message: message);
}

class ExpiredException extends _s.GenericAwsException {
  ExpiredException({String? type, String? message})
      : super(type: type, code: 'ExpiredException', message: message);
}

class GlueEncryptionException extends _s.GenericAwsException {
  GlueEncryptionException({String? type, String? message})
      : super(type: type, code: 'GlueEncryptionException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class OperationTimeoutException extends _s.GenericAwsException {
  OperationTimeoutException({String? type, String? message})
      : super(type: type, code: 'OperationTimeoutException', message: message);
}

class PermissionTypeMismatchException extends _s.GenericAwsException {
  PermissionTypeMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'PermissionTypeMismatchException',
            message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String? type, String? message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ResourceNumberLimitExceededException extends _s.GenericAwsException {
  ResourceNumberLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceNumberLimitExceededException',
            message: message);
}

class StatisticsNotReadyYetException extends _s.GenericAwsException {
  StatisticsNotReadyYetException({String? type, String? message})
      : super(
            type: type,
            code: 'StatisticsNotReadyYetException',
            message: message);
}

class ThrottledException extends _s.GenericAwsException {
  ThrottledException({String? type, String? message})
      : super(type: type, code: 'ThrottledException', message: message);
}

class TransactionCanceledException extends _s.GenericAwsException {
  TransactionCanceledException({String? type, String? message})
      : super(
            type: type, code: 'TransactionCanceledException', message: message);
}

class TransactionCommitInProgressException extends _s.GenericAwsException {
  TransactionCommitInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'TransactionCommitInProgressException',
            message: message);
}

class TransactionCommittedException extends _s.GenericAwsException {
  TransactionCommittedException({String? type, String? message})
      : super(
            type: type,
            code: 'TransactionCommittedException',
            message: message);
}

class WorkUnitsNotReadyYetException extends _s.GenericAwsException {
  WorkUnitsNotReadyYetException({String? type, String? message})
      : super(
            type: type,
            code: 'WorkUnitsNotReadyYetException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'EntityNotFoundException': (type, message) =>
      EntityNotFoundException(type: type, message: message),
  'ExpiredException': (type, message) =>
      ExpiredException(type: type, message: message),
  'GlueEncryptionException': (type, message) =>
      GlueEncryptionException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'OperationTimeoutException': (type, message) =>
      OperationTimeoutException(type: type, message: message),
  'PermissionTypeMismatchException': (type, message) =>
      PermissionTypeMismatchException(type: type, message: message),
  'ResourceNotReadyException': (type, message) =>
      ResourceNotReadyException(type: type, message: message),
  'ResourceNumberLimitExceededException': (type, message) =>
      ResourceNumberLimitExceededException(type: type, message: message),
  'StatisticsNotReadyYetException': (type, message) =>
      StatisticsNotReadyYetException(type: type, message: message),
  'ThrottledException': (type, message) =>
      ThrottledException(type: type, message: message),
  'TransactionCanceledException': (type, message) =>
      TransactionCanceledException(type: type, message: message),
  'TransactionCommitInProgressException': (type, message) =>
      TransactionCommitInProgressException(type: type, message: message),
  'TransactionCommittedException': (type, message) =>
      TransactionCommittedException(type: type, message: message),
  'WorkUnitsNotReadyYetException': (type, message) =>
      WorkUnitsNotReadyYetException(type: type, message: message),
};
