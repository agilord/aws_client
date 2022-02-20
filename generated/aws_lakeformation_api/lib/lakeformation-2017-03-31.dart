// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_credential_providers/aws_credential_providers.dart';
import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Defines the public endpoint for the AWS Lake Formation service.
class LakeFormation {
  final _s.JsonProtocol _protocol;
  LakeFormation({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider = defaultProvider,
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

class DeregisterResourceResponse {
  DeregisterResourceResponse();
  factory DeregisterResourceResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterResourceResponse();
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
}

/// A structure containing the additional details to be returned in the
/// <code>AdditionalDetails</code> attribute of
/// <code>PrincipalResourcePermissions</code>.
///
/// If a catalog resource is shared through AWS Resource Access Manager (AWS
/// RAM), then there will exist a corresponding RAM share resource ARN.
class DetailsMap {
  /// A share resource ARN for a catalog resource shared through AWS Resource
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
}

class GrantPermissionsResponse {
  GrantPermissionsResponse();
  factory GrantPermissionsResponse.fromJson(Map<String, dynamic> _) {
    return GrantPermissionsResponse();
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
  /// share resource ARN.
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
}

class PutDataLakeSettingsResponse {
  PutDataLakeSettingsResponse();
  factory PutDataLakeSettingsResponse.fromJson(Map<String, dynamic> _) {
    return PutDataLakeSettingsResponse();
  }
}

class RegisterResourceResponse {
  RegisterResourceResponse();
  factory RegisterResourceResponse.fromJson(Map<String, dynamic> _) {
    return RegisterResourceResponse();
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
    final table = this.table;
    final tableWithColumns = this.tableWithColumns;
    return {
      if (catalog != null) 'Catalog': catalog,
      if (dataLocation != null) 'DataLocation': dataLocation,
      if (database != null) 'Database': database,
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
}

class RevokePermissionsResponse {
  RevokePermissionsResponse();
  factory RevokePermissionsResponse.fromJson(Map<String, dynamic> _) {
    return RevokePermissionsResponse();
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

class UpdateResourceResponse {
  UpdateResourceResponse();
  factory UpdateResourceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourceResponse();
  }
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'EntityNotFoundException': (type, message) =>
      EntityNotFoundException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'OperationTimeoutException': (type, message) =>
      OperationTimeoutException(type: type, message: message),
};
