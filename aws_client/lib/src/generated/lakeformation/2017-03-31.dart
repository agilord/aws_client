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

/// Defines the public endpoint for the AWS Lake Formation service.
class LakeFormation {
  final _s.JsonProtocol _protocol;
  LakeFormation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lakeformation',
            signingName: 'lakeformation',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Attaches one or more tags to an existing resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [lFTags] :
  /// The tags to attach to the resource.
  ///
  /// Parameter [resource] :
  /// The resource to which to attach a tag.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  Future<AddLFTagsToResourceResponse> addLFTagsToResource({
    required List<LFTagPair> lFTags,
    required Resource resource,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(lFTags, 'lFTags');
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.AddLFTagsToResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LFTags': lFTags,
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return AddLFTagsToResourceResponse.fromJson(jsonResponse.body);
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
  /// your AWS Lake Formation environment.
  Future<BatchGrantPermissionsResponse> batchGrantPermissions({
    required List<BatchPermissionsRequestEntry> entries,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.BatchGrantPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Entries': entries,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return BatchGrantPermissionsResponse.fromJson(jsonResponse.body);
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
  /// your AWS Lake Formation environment.
  Future<BatchRevokePermissionsResponse> batchRevokePermissions({
    required List<BatchPermissionsRequestEntry> entries,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.BatchRevokePermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Entries': entries,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return BatchRevokePermissionsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a tag with the specified name and values.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNumberLimitExceededException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the tag.
  ///
  /// Parameter [tagValues] :
  /// A list of possible values an attribute can take.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  Future<void> createLFTag({
    required String tagKey,
    required List<String> tagValues,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(tagKey, 'tagKey');
    _s.validateStringLength(
      'tagKey',
      tagKey,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagValues, 'tagValues');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.CreateLFTag'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TagKey': tagKey,
        'TagValues': tagValues,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );
  }

  /// Deletes the specified tag key name. If the attribute key does not exist or
  /// the tag does not exist, then the operation will not do anything. If the
  /// attribute key exists, then the operation checks if any resources are
  /// tagged with this attribute key, if yes, the API throws a 400 Exception
  /// with the message "Delete not allowed" as the tag key is still attached
  /// with resources. You can consider untagging resources with this tag key.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the tag to delete.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  Future<void> deleteLFTag({
    required String tagKey,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(tagKey, 'tagKey');
    _s.validateStringLength(
      'tagKey',
      tagKey,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.DeleteLFTag'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TagKey': tagKey,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.DeregisterResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Retrieves the current data access role for the given resource registered
  /// in AWS Lake Formation.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.DescribeResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return DescribeResourceResponse.fromJson(jsonResponse.body);
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
  /// your AWS Lake Formation environment.
  Future<GetDataLakeSettingsResponse> getDataLakeSettings({
    String? catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.GetDataLakeSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return GetDataLakeSettingsResponse.fromJson(jsonResponse.body);
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
  /// your AWS Lake Formation environment.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.GetEffectivePermissionsForPath'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetEffectivePermissionsForPathResponse.fromJson(jsonResponse.body);
  }

  /// Returns a tag definition.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the tag.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  Future<GetLFTagResponse> getLFTag({
    required String tagKey,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(tagKey, 'tagKey');
    _s.validateStringLength(
      'tagKey',
      tagKey,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.GetLFTag'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TagKey': tagKey,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return GetLFTagResponse.fromJson(jsonResponse.body);
  }

  /// Returns the tags applied to a resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [GlueEncryptionException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resource] :
  /// The resource for which you want to return tags.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  ///
  /// Parameter [showAssignedLFTags] :
  /// Indicates whether to show the assigned tags.
  Future<GetResourceLFTagsResponse> getResourceLFTags({
    required Resource resource,
    String? catalogId,
    bool? showAssignedLFTags,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.GetResourceLFTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
        if (showAssignedLFTags != null)
          'ShowAssignedLFTags': showAssignedLFTags,
      },
    );

    return GetResourceLFTagsResponse.fromJson(jsonResponse.body);
  }

  /// Grants permissions to the principal to access metadata in the Data Catalog
  /// and data organized in underlying data storage such as Amazon S3.
  ///
  /// For information about permissions, see <a
  /// href="https://docs-aws.amazon.com/lake-formation/latest/dg/security-data-access.html">Security
  /// and Access Control to Metadata and Data</a>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [permissions] :
  /// The permissions granted to the principal on the resource. AWS Lake
  /// Formation defines privileges to grant and revoke access to metadata in the
  /// Data Catalog and data organized in underlying data storage such as Amazon
  /// S3. AWS Lake Formation requires that each principal be authorized to
  /// perform a specific task on AWS Lake Formation resources.
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
  /// The resource to which permissions are to be granted. Resources in AWS Lake
  /// Formation are the Data Catalog, databases, and tables.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
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
    ArgumentError.checkNotNull(permissions, 'permissions');
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.GrantPermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Permissions': permissions.map((e) => e.toValue()).toList(),
        'Principal': principal,
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
        if (permissionsWithGrantOption != null)
          'PermissionsWithGrantOption':
              permissionsWithGrantOption.map((e) => e.toValue()).toList(),
      },
    );
  }

  /// Lists tags that the requester has permission to view.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A continuation token, if this is not the first call to retrieve this list.
  ///
  /// Parameter [resourceShareType] :
  /// If resource share type is <code>ALL</code>, returns both in-account tags
  /// and shared tags that the requester has permission to view. If resource
  /// share type is <code>FOREIGN</code>, returns all share tags that the
  /// requester can view. If no resource share type is passed, lists tags in the
  /// given catalog ID that the requester has permission to view.
  Future<ListLFTagsResponse> listLFTags({
    String? catalogId,
    int? maxResults,
    String? nextToken,
    ResourceShareType? resourceShareType,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.ListLFTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceShareType != null)
          'ResourceShareType': resourceShareType.toValue(),
      },
    );

    return ListLFTagsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the principal permissions on the resource, filtered by
  /// the permissions of the caller. For example, if you are granted an ALTER
  /// permission, you are able to see only the principal permissions for ALTER.
  ///
  /// This operation returns only those permissions that have been explicitly
  /// granted.
  ///
  /// For information about permissions, see <a
  /// href="https://docs-aws.amazon.com/lake-formation/latest/dg/security-data-access.html">Security
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
  /// your AWS Lake Formation environment.
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
    int? maxResults,
    String? nextToken,
    DataLakePrincipal? principal,
    Resource? resource,
    DataLakeResourceType? resourceType,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.ListPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (principal != null) 'Principal': principal,
        if (resource != null) 'Resource': resource,
        if (resourceType != null) 'ResourceType': resourceType.toValue(),
      },
    );

    return ListPermissionsResponse.fromJson(jsonResponse.body);
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.ListResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filterConditionList != null)
          'FilterConditionList': filterConditionList,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourcesResponse.fromJson(jsonResponse.body);
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
  /// A structure representing a list of AWS Lake Formation principals
  /// designated as data lake administrators.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  Future<void> putDataLakeSettings({
    required DataLakeSettings dataLakeSettings,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(dataLakeSettings, 'dataLakeSettings');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.PutDataLakeSettings'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataLakeSettings': dataLakeSettings,
        if (catalogId != null) 'CatalogId': catalogId,
      },
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
  /// The following request registers a new location and gives AWS Lake
  /// Formation permission to use the service-linked role to access that
  /// location.
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
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to register.
  ///
  /// Parameter [roleArn] :
  /// The identifier for the role that registers the resource.
  ///
  /// Parameter [useServiceLinkedRole] :
  /// Designates an AWS Identity and Access Management (IAM) service-linked role
  /// by registering this role with the Data Catalog. A service-linked role is a
  /// unique type of IAM role that is linked directly to Lake Formation.
  ///
  /// For more information, see <a
  /// href="https://docs-aws.amazon.com/lake-formation/latest/dg/service-linked-roles.html">Using
  /// Service-Linked Roles for Lake Formation</a>.
  Future<void> registerResource({
    required String resourceArn,
    String? roleArn,
    bool? useServiceLinkedRole,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.RegisterResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (roleArn != null) 'RoleArn': roleArn,
        if (useServiceLinkedRole != null)
          'UseServiceLinkedRole': useServiceLinkedRole,
      },
    );
  }

  /// Removes a tag from the resource. Only database, table, or tableWithColumns
  /// resource are allowed. To tag columns, use the column inclusion list in
  /// <code>tableWithColumns</code> to specify column input.
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
  /// The tags to be removed from the resource.
  ///
  /// Parameter [resource] :
  /// The resource where you want to remove a tag.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  Future<RemoveLFTagsFromResourceResponse> removeLFTagsFromResource({
    required List<LFTagPair> lFTags,
    required Resource resource,
    String? catalogId,
  }) async {
    ArgumentError.checkNotNull(lFTags, 'lFTags');
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.RemoveLFTagsFromResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LFTags': lFTags,
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
      },
    );

    return RemoveLFTagsFromResourceResponse.fromJson(jsonResponse.body);
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
  /// href="https://docs-aws.amazon.com/lake-formation/latest/dg/security-data-access.html">Security
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
  /// your AWS Lake Formation environment.
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
    ArgumentError.checkNotNull(permissions, 'permissions');
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.RevokePermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Permissions': permissions.map((e) => e.toValue()).toList(),
        'Principal': principal,
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
        if (permissionsWithGrantOption != null)
          'PermissionsWithGrantOption':
              permissionsWithGrantOption.map((e) => e.toValue()).toList(),
      },
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
  /// your AWS Lake Formation environment.
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
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.SearchDatabasesByLFTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Expression': expression,
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return SearchDatabasesByLFTagsResponse.fromJson(jsonResponse.body);
  }

  /// This operation allows a search on <code>TABLE</code> resources by
  /// <code>LFTag</code>s. This will be used by admins who want to grant user
  /// permissions on certain LFTags. Before making a grant, the admin can use
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
  /// your AWS Lake Formation environment.
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
    ArgumentError.checkNotNull(expression, 'expression');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.SearchTablesByLFTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Expression': expression,
        if (catalogId != null) 'CatalogId': catalogId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return SearchTablesByLFTagsResponse.fromJson(jsonResponse.body);
  }

  /// Updates the list of possible values for the specified tag key. If the tag
  /// does not exist, the operation throws an EntityNotFoundException. The
  /// values in the delete key values will be deleted from list of possible
  /// values. If any value in the delete key values is attached to a resource,
  /// then API errors out with a 400 Exception - "Update not allowed". Untag the
  /// attribute before deleting the tag key's value.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [InternalServiceException].
  /// May throw [OperationTimeoutException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [tagKey] :
  /// The key-name for the tag for which to add or delete values.
  ///
  /// Parameter [catalogId] :
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database
  /// definitions, table definitions, and other control information to manage
  /// your AWS Lake Formation environment.
  ///
  /// Parameter [tagValuesToAdd] :
  /// A list of tag values to add from the tag.
  ///
  /// Parameter [tagValuesToDelete] :
  /// A list of tag values to delete from the tag.
  Future<void> updateLFTag({
    required String tagKey,
    String? catalogId,
    List<String>? tagValuesToAdd,
    List<String>? tagValuesToDelete,
  }) async {
    ArgumentError.checkNotNull(tagKey, 'tagKey');
    _s.validateStringLength(
      'tagKey',
      tagKey,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.UpdateLFTag'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TagKey': tagKey,
        if (catalogId != null) 'CatalogId': catalogId,
        if (tagValuesToAdd != null) 'TagValuesToAdd': tagValuesToAdd,
        if (tagValuesToDelete != null) 'TagValuesToDelete': tagValuesToDelete,
      },
    );
  }

  /// Updates the data access role used for vending access to the given
  /// (registered) resource in AWS Lake Formation.
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
  /// The new role to use for the given resource registered in AWS Lake
  /// Formation.
  Future<void> updateResource({
    required String resourceArn,
    required String roleArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.UpdateResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'RoleArn': roleArn,
      },
    );
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

/// A structure containing the name of a column resource and the tags attached
/// to it.
class ColumnLFTag {
  /// The tags attached to a column resource.
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

extension on ComparisonOperator {
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

extension on String {
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

class CreateLFTagResponse {
  CreateLFTagResponse();

  factory CreateLFTagResponse.fromJson(Map<String, dynamic> _) {
    return CreateLFTagResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The AWS Lake Formation principal. Supported principals are IAM users or IAM
/// roles.
class DataLakePrincipal {
  /// An identifier for the AWS Lake Formation principal.
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

extension on DataLakeResourceType {
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

extension on String {
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

/// A structure representing a list of AWS Lake Formation principals designated
/// as data lake administrators and lists of principal permission entries for
/// default create database and default create table permissions.
class DataLakeSettings {
  /// A structure representing a list of up to three principal permissions entries
  /// for default create database permissions.
  final List<PrincipalPermissions>? createDatabaseDefaultPermissions;

  /// A structure representing a list of up to three principal permissions entries
  /// for default create table permissions.
  final List<PrincipalPermissions>? createTableDefaultPermissions;

  /// A list of AWS Lake Formation principals. Supported principals are IAM users
  /// or IAM roles.
  final List<DataLakePrincipal>? dataLakeAdmins;

  /// A list of the resource-owning account IDs that the caller's account can use
  /// to share their user access details (user ARNs). The user ARNs can be logged
  /// in the resource owner's AWS CloudTrail log.
  ///
  /// You may want to specify this property when you are in a high-trust boundary,
  /// such as the same team or company.
  final List<String>? trustedResourceOwners;

  DataLakeSettings({
    this.createDatabaseDefaultPermissions,
    this.createTableDefaultPermissions,
    this.dataLakeAdmins,
    this.trustedResourceOwners,
  });

  factory DataLakeSettings.fromJson(Map<String, dynamic> json) {
    return DataLakeSettings(
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
      trustedResourceOwners: (json['TrustedResourceOwners'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createDatabaseDefaultPermissions =
        this.createDatabaseDefaultPermissions;
    final createTableDefaultPermissions = this.createTableDefaultPermissions;
    final dataLakeAdmins = this.dataLakeAdmins;
    final trustedResourceOwners = this.trustedResourceOwners;
    return {
      if (createDatabaseDefaultPermissions != null)
        'CreateDatabaseDefaultPermissions': createDatabaseDefaultPermissions,
      if (createTableDefaultPermissions != null)
        'CreateTableDefaultPermissions': createTableDefaultPermissions,
      if (dataLakeAdmins != null) 'DataLakeAdmins': dataLakeAdmins,
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
  /// AWS Lake Formation. By default, it is the account ID of the caller.
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

class DeleteLFTagResponse {
  DeleteLFTagResponse();

  factory DeleteLFTagResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLFTagResponse();
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

class DescribeResourceResponse {
  /// A structure containing information about an AWS Lake Formation resource.
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

/// A structure containing the additional details to be returned in the
/// <code>AdditionalDetails</code> attribute of
/// <code>PrincipalResourcePermissions</code>.
///
/// If a catalog resource is shared through AWS Resource Access Manager (AWS
/// RAM), then there will exist a corresponding RAM resource share ARN.
class DetailsMap {
  /// A resource share ARN for a catalog resource shared through AWS Resource
  /// Access Manager (AWS RAM).
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

enum FieldNameString {
  resourceArn,
  roleArn,
  lastModified,
}

extension on FieldNameString {
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

extension on String {
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

  factory FilterCondition.fromJson(Map<String, dynamic> json) {
    return FilterCondition(
      comparisonOperator:
          (json['ComparisonOperator'] as String?)?.toComparisonOperator(),
      field: (json['Field'] as String?)?.toFieldNameString(),
      stringValueList: (json['StringValueList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

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

class GetDataLakeSettingsResponse {
  /// A structure representing a list of AWS Lake Formation principals designated
  /// as data lake administrators.
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
  /// table definitions, and other control information to manage your AWS Lake
  /// Formation environment.
  final String? catalogId;

  /// The key-name for the tag.
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

class GetResourceLFTagsResponse {
  /// A list of tags applied to a database resource.
  final List<LFTagPair>? lFTagOnDatabase;

  /// A list of tags applied to a column resource.
  final List<ColumnLFTag>? lFTagsOnColumns;

  /// A list of tags applied to a table resource.
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
/// conditions. For example, granting a role access to all columns not tagged
/// 'PII' of tables tagged 'Prod'.
class LFTag {
  /// The key-name for the tag.
  final String tagKey;

  /// A list of possible values an attribute can take.
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
  /// An error that occurred with the attachment or detachment of the tag.
  final ErrorDetail? error;

  /// The key-name of the tag.
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

/// A structure containing a tag key and values for a resource.
class LFTagKeyResource {
  /// The key-name for the tag.
  final String tagKey;

  /// A list of possible values an attribute can take.
  final List<String> tagValues;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your AWS Lake
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

/// A structure containing a tag key-value pair.
class LFTagPair {
  /// The key-name for the tag.
  final String tagKey;

  /// A list of possible values an attribute can take.
  final List<String> tagValues;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your AWS Lake
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

/// A structure containing a list of tag conditions that apply to a resource's
/// tag policy.
class LFTagPolicyResource {
  /// A list of tag conditions that apply to the resource's tag policy.
  final List<LFTag> expression;

  /// The resource type for which the tag policy applies.
  final ResourceType resourceType;

  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your AWS Lake
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

class ListLFTagsResponse {
  /// A list of tags that the requested has permission to view.
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
  createTag,
  alterTag,
  deleteTag,
  describeTag,
  associateTag,
}

extension on Permission {
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
      case Permission.createTag:
        return 'CREATE_TAG';
      case Permission.alterTag:
        return 'ALTER_TAG';
      case Permission.deleteTag:
        return 'DELETE_TAG';
      case Permission.describeTag:
        return 'DESCRIBE_TAG';
      case Permission.associateTag:
        return 'ASSOCIATE_TAG';
    }
  }
}

extension on String {
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
      case 'CREATE_TAG':
        return Permission.createTag;
      case 'ALTER_TAG':
        return Permission.alterTag;
      case 'DELETE_TAG':
        return Permission.deleteTag;
      case 'DESCRIBE_TAG':
        return Permission.describeTag;
      case 'ASSOCIATE_TAG':
        return Permission.associateTag;
    }
    throw Exception('$this is not known in enum Permission');
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
    final permissions = this.permissions;
    final permissionsWithGrantOption = this.permissionsWithGrantOption;
    final principal = this.principal;
    final resource = this.resource;
    return {
      if (additionalDetails != null) 'AdditionalDetails': additionalDetails,
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
  /// table definitions, and other control information to manage your AWS Lake
  /// Formation environment.
  final CatalogResource? catalog;

  /// The location of an Amazon S3 path where permissions are granted or revoked.
  final DataLocationResource? dataLocation;

  /// The database for the resource. Unique to the Data Catalog. A database is a
  /// set of associated table definitions organized into a logical group. You can
  /// Grant and Revoke database permissions to a principal.
  final DatabaseResource? database;

  /// The tag key and values attached to a resource.
  final LFTagKeyResource? lFTag;

  /// A list of tag conditions that define a resource's tag policy.
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
    final dataLocation = this.dataLocation;
    final database = this.database;
    final lFTag = this.lFTag;
    final lFTagPolicy = this.lFTagPolicy;
    final table = this.table;
    final tableWithColumns = this.tableWithColumns;
    return {
      if (catalog != null) 'Catalog': catalog,
      if (dataLocation != null) 'DataLocation': dataLocation,
      if (database != null) 'Database': database,
      if (lFTag != null) 'LFTag': lFTag,
      if (lFTagPolicy != null) 'LFTagPolicy': lFTagPolicy,
      if (table != null) 'Table': table,
      if (tableWithColumns != null) 'TableWithColumns': tableWithColumns,
    };
  }
}

/// A structure containing information about an AWS Lake Formation resource.
class ResourceInfo {
  /// The date and time the resource was last modified.
  final DateTime? lastModified;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// The IAM role that registered a resource.
  final String? roleArn;

  ResourceInfo({
    this.lastModified,
    this.resourceArn,
    this.roleArn,
  });

  factory ResourceInfo.fromJson(Map<String, dynamic> json) {
    return ResourceInfo(
      lastModified: timeStampFromJson(json['LastModified']),
      resourceArn: json['ResourceArn'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModified = this.lastModified;
    final resourceArn = this.resourceArn;
    final roleArn = this.roleArn;
    return {
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

enum ResourceShareType {
  foreign,
  all,
}

extension on ResourceShareType {
  String toValue() {
    switch (this) {
      case ResourceShareType.foreign:
        return 'FOREIGN';
      case ResourceShareType.all:
        return 'ALL';
    }
  }
}

extension on String {
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

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.database:
        return 'DATABASE';
      case ResourceType.table:
        return 'TABLE';
    }
  }
}

extension on String {
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

class SearchDatabasesByLFTagsResponse {
  /// A list of databases that meet the tag conditions.
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
  final String? nextToken;

  /// A list of tables that meet the tag conditions.
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

/// A structure describing a database resource with tags.
class TaggedDatabase {
  /// A database that has tags attached to it.
  final DatabaseResource? database;

  /// A list of tags attached to the database.
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

/// A structure describing a table resource with tags.
class TaggedTable {
  /// A list of tags attached to the database where the table resides.
  final List<LFTagPair>? lFTagOnDatabase;

  /// A list of tags attached to columns in the table.
  final List<ColumnLFTag>? lFTagsOnColumns;

  /// A list of tags attached to the table.
  final List<LFTagPair>? lFTagsOnTable;

  /// A table that has tags attached to it.
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

class UpdateLFTagResponse {
  UpdateLFTagResponse();

  factory UpdateLFTagResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLFTagResponse();
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

class ResourceNumberLimitExceededException extends _s.GenericAwsException {
  ResourceNumberLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceNumberLimitExceededException',
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
  'GlueEncryptionException': (type, message) =>
      GlueEncryptionException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'OperationTimeoutException': (type, message) =>
      OperationTimeoutException(type: type, message: message),
  'ResourceNumberLimitExceededException': (type, message) =>
      ResourceNumberLimitExceededException(type: type, message: message),
};
