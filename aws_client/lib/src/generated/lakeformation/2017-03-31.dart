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

part '2017-03-31.g.dart';

/// Defines the public endpoint for the AWS Lake Formation service.
class LakeFormation {
  final _s.JsonProtocol _protocol;
  LakeFormation({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required List<BatchPermissionsRequestEntry> entries,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
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
    @_s.required List<BatchPermissionsRequestEntry> entries,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.DeregisterResource'
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

    return DeregisterResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceArn,
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
    String catalogId,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
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
    @_s.required String resourceArn,
    String catalogId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
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
    @_s.required List<Permission> permissions,
    @_s.required DataLakePrincipal principal,
    @_s.required Resource resource,
    String catalogId,
    List<Permission> permissionsWithGrantOption,
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
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.GrantPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Permissions': permissions?.map((e) => e?.toValue() ?? '')?.toList(),
        'Principal': principal,
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
        if (permissionsWithGrantOption != null)
          'PermissionsWithGrantOption': permissionsWithGrantOption
              .map((e) => e?.toValue() ?? '')
              .toList(),
      },
    );

    return GrantPermissionsResponse.fromJson(jsonResponse.body);
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
    String catalogId,
    int maxResults,
    String nextToken,
    DataLakePrincipal principal,
    Resource resource,
    DataLakeResourceType resourceType,
  }) async {
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
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
    List<FilterCondition> filterConditionList,
    int maxResults,
    String nextToken,
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
    @_s.required DataLakeSettings dataLakeSettings,
    String catalogId,
  }) async {
    ArgumentError.checkNotNull(dataLakeSettings, 'dataLakeSettings');
    _s.validateStringLength(
      'catalogId',
      catalogId,
      1,
      255,
    );
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.PutDataLakeSettings'
    };
    final jsonResponse = await _protocol.send(
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

    return PutDataLakeSettingsResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceArn,
    String roleArn,
    bool useServiceLinkedRole,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:aws:iam::[0-9]*:role/.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.RegisterResource'
    };
    final jsonResponse = await _protocol.send(
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

    return RegisterResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required List<Permission> permissions,
    @_s.required DataLakePrincipal principal,
    @_s.required Resource resource,
    String catalogId,
    List<Permission> permissionsWithGrantOption,
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
    _s.validateStringPattern(
      'catalogId',
      catalogId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.RevokePermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Permissions': permissions?.map((e) => e?.toValue() ?? '')?.toList(),
        'Principal': principal,
        'Resource': resource,
        if (catalogId != null) 'CatalogId': catalogId,
        if (permissionsWithGrantOption != null)
          'PermissionsWithGrantOption': permissionsWithGrantOption
              .map((e) => e?.toValue() ?? '')
              .toList(),
      },
    );

    return RevokePermissionsResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceArn,
    @_s.required String roleArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:aws:iam::[0-9]*:role/.*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSLakeFormation.UpdateResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UpdateResourceResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGrantPermissionsResponse {
  /// A list of failures to grant permissions to the resources.
  @_s.JsonKey(name: 'Failures')
  final List<BatchPermissionsFailureEntry> failures;

  BatchGrantPermissionsResponse({
    this.failures,
  });
  factory BatchGrantPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGrantPermissionsResponseFromJson(json);
}

/// A list of failures when performing a batch grant or batch revoke operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPermissionsFailureEntry {
  /// An error message that applies to the failure of the entry.
  @_s.JsonKey(name: 'Error')
  final ErrorDetail error;

  /// An identifier for an entry of the batch request.
  @_s.JsonKey(name: 'RequestEntry')
  final BatchPermissionsRequestEntry requestEntry;

  BatchPermissionsFailureEntry({
    this.error,
    this.requestEntry,
  });
  factory BatchPermissionsFailureEntry.fromJson(Map<String, dynamic> json) =>
      _$BatchPermissionsFailureEntryFromJson(json);
}

/// A permission to a resource granted by batch operation to the principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchPermissionsRequestEntry {
  /// A unique identifier for the batch permissions request entry.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The permissions to be granted.
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  /// Indicates if the option to pass permissions is granted.
  @_s.JsonKey(name: 'PermissionsWithGrantOption')
  final List<Permission> permissionsWithGrantOption;

  /// The principal to be granted a permission.
  @_s.JsonKey(name: 'Principal')
  final DataLakePrincipal principal;

  /// The resource to which the principal is to be granted a permission.
  @_s.JsonKey(name: 'Resource')
  final Resource resource;

  BatchPermissionsRequestEntry({
    @_s.required this.id,
    this.permissions,
    this.permissionsWithGrantOption,
    this.principal,
    this.resource,
  });
  factory BatchPermissionsRequestEntry.fromJson(Map<String, dynamic> json) =>
      _$BatchPermissionsRequestEntryFromJson(json);

  Map<String, dynamic> toJson() => _$BatchPermissionsRequestEntryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchRevokePermissionsResponse {
  /// A list of failures to revoke permissions to the resources.
  @_s.JsonKey(name: 'Failures')
  final List<BatchPermissionsFailureEntry> failures;

  BatchRevokePermissionsResponse({
    this.failures,
  });
  factory BatchRevokePermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchRevokePermissionsResponseFromJson(json);
}

/// A structure for the catalog object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CatalogResource {
  CatalogResource();
  factory CatalogResource.fromJson(Map<String, dynamic> json) =>
      _$CatalogResourceFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogResourceToJson(this);
}

/// A wildcard object, consisting of an optional list of excluded column names
/// or indexes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnWildcard {
  /// Excludes column names. Any column with this name will be excluded.
  @_s.JsonKey(name: 'ExcludedColumnNames')
  final List<String> excludedColumnNames;

  ColumnWildcard({
    this.excludedColumnNames,
  });
  factory ColumnWildcard.fromJson(Map<String, dynamic> json) =>
      _$ColumnWildcardFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnWildcardToJson(this);
}

enum ComparisonOperator {
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('LE')
  le,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('NOT_CONTAINS')
  notContains,
  @_s.JsonValue('BEGINS_WITH')
  beginsWith,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('BETWEEN')
  between,
}

/// The AWS Lake Formation principal. Supported principals are IAM users or IAM
/// roles.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataLakePrincipal {
  /// An identifier for the AWS Lake Formation principal.
  @_s.JsonKey(name: 'DataLakePrincipalIdentifier')
  final String dataLakePrincipalIdentifier;

  DataLakePrincipal({
    this.dataLakePrincipalIdentifier,
  });
  factory DataLakePrincipal.fromJson(Map<String, dynamic> json) =>
      _$DataLakePrincipalFromJson(json);

  Map<String, dynamic> toJson() => _$DataLakePrincipalToJson(this);
}

enum DataLakeResourceType {
  @_s.JsonValue('CATALOG')
  catalog,
  @_s.JsonValue('DATABASE')
  database,
  @_s.JsonValue('TABLE')
  table,
  @_s.JsonValue('DATA_LOCATION')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A structure representing a list of AWS Lake Formation principals designated
/// as data lake administrators and lists of principal permission entries for
/// default create database and default create table permissions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataLakeSettings {
  /// A structure representing a list of up to three principal permissions entries
  /// for default create database permissions.
  @_s.JsonKey(name: 'CreateDatabaseDefaultPermissions')
  final List<PrincipalPermissions> createDatabaseDefaultPermissions;

  /// A structure representing a list of up to three principal permissions entries
  /// for default create table permissions.
  @_s.JsonKey(name: 'CreateTableDefaultPermissions')
  final List<PrincipalPermissions> createTableDefaultPermissions;

  /// A list of AWS Lake Formation principals. Supported principals are IAM users
  /// or IAM roles.
  @_s.JsonKey(name: 'DataLakeAdmins')
  final List<DataLakePrincipal> dataLakeAdmins;

  /// A list of the resource-owning account IDs that the caller's account can use
  /// to share their user access details (user ARNs). The user ARNs can be logged
  /// in the resource owner's AWS CloudTrail log.
  ///
  /// You may want to specify this property when you are in a high-trust boundary,
  /// such as the same team or company.
  @_s.JsonKey(name: 'TrustedResourceOwners')
  final List<String> trustedResourceOwners;

  DataLakeSettings({
    this.createDatabaseDefaultPermissions,
    this.createTableDefaultPermissions,
    this.dataLakeAdmins,
    this.trustedResourceOwners,
  });
  factory DataLakeSettings.fromJson(Map<String, dynamic> json) =>
      _$DataLakeSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DataLakeSettingsToJson(this);
}

/// A structure for a data location object where permissions are granted or
/// revoked.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataLocationResource {
  /// The Amazon Resource Name (ARN) that uniquely identifies the data location
  /// resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The identifier for the Data Catalog where the location is registered with
  /// AWS Lake Formation. By default, it is the account ID of the caller.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DataLocationResource({
    @_s.required this.resourceArn,
    this.catalogId,
  });
  factory DataLocationResource.fromJson(Map<String, dynamic> json) =>
      _$DataLocationResourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataLocationResourceToJson(this);
}

/// A structure for the database object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatabaseResource {
  /// The name of the database resource. Unique to the Data Catalog.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The identifier for the Data Catalog. By default, it is the account ID of the
  /// caller.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  DatabaseResource({
    @_s.required this.name,
    this.catalogId,
  });
  factory DatabaseResource.fromJson(Map<String, dynamic> json) =>
      _$DatabaseResourceFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseResourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterResourceResponse {
  DeregisterResourceResponse();
  factory DeregisterResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeregisterResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourceResponse {
  /// A structure containing information about an AWS Lake Formation resource.
  @_s.JsonKey(name: 'ResourceInfo')
  final ResourceInfo resourceInfo;

  DescribeResourceResponse({
    this.resourceInfo,
  });
  factory DescribeResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeResourceResponseFromJson(json);
}

/// A structure containing the additional details to be returned in the
/// <code>AdditionalDetails</code> attribute of
/// <code>PrincipalResourcePermissions</code>.
///
/// If a catalog resource is shared through AWS Resource Access Manager (AWS
/// RAM), then there will exist a corresponding RAM share resource ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetailsMap {
  /// A share resource ARN for a catalog resource shared through AWS Resource
  /// Access Manager (AWS RAM).
  @_s.JsonKey(name: 'ResourceShare')
  final List<String> resourceShare;

  DetailsMap({
    this.resourceShare,
  });
  factory DetailsMap.fromJson(Map<String, dynamic> json) =>
      _$DetailsMapFromJson(json);
}

/// Contains details about an error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetail {
  /// The code associated with this error.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// A message describing the error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

enum FieldNameString {
  @_s.JsonValue('RESOURCE_ARN')
  resourceArn,
  @_s.JsonValue('ROLE_ARN')
  roleArn,
  @_s.JsonValue('LAST_MODIFIED')
  lastModified,
}

/// This structure describes the filtering of columns in a table based on a
/// filter condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FilterCondition {
  /// The comparison operator used in the filter condition.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// The field to filter in the filter condition.
  @_s.JsonKey(name: 'Field')
  final FieldNameString field;

  /// A string with values used in evaluating the filter condition.
  @_s.JsonKey(name: 'StringValueList')
  final List<String> stringValueList;

  FilterCondition({
    this.comparisonOperator,
    this.field,
    this.stringValueList,
  });
  Map<String, dynamic> toJson() => _$FilterConditionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataLakeSettingsResponse {
  /// A structure representing a list of AWS Lake Formation principals designated
  /// as data lake administrators.
  @_s.JsonKey(name: 'DataLakeSettings')
  final DataLakeSettings dataLakeSettings;

  GetDataLakeSettingsResponse({
    this.dataLakeSettings,
  });
  factory GetDataLakeSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDataLakeSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEffectivePermissionsForPathResponse {
  /// A continuation token, if this is not the first call to retrieve this list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the permissions for the specified table or database resource
  /// located at the path in Amazon S3.
  @_s.JsonKey(name: 'Permissions')
  final List<PrincipalResourcePermissions> permissions;

  GetEffectivePermissionsForPathResponse({
    this.nextToken,
    this.permissions,
  });
  factory GetEffectivePermissionsForPathResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEffectivePermissionsForPathResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GrantPermissionsResponse {
  GrantPermissionsResponse();
  factory GrantPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GrantPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPermissionsResponse {
  /// A continuation token, if this is not the first call to retrieve this list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of principals and their permissions on the resource for the specified
  /// principal and resource types.
  @_s.JsonKey(name: 'PrincipalResourcePermissions')
  final List<PrincipalResourcePermissions> principalResourcePermissions;

  ListPermissionsResponse({
    this.nextToken,
    this.principalResourcePermissions,
  });
  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesResponse {
  /// A continuation token, if this is not the first call to retrieve these
  /// resources.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A summary of the data lake resources.
  @_s.JsonKey(name: 'ResourceInfoList')
  final List<ResourceInfo> resourceInfoList;

  ListResourcesResponse({
    this.nextToken,
    this.resourceInfoList,
  });
  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourcesResponseFromJson(json);
}

enum Permission {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('SELECT')
  select,
  @_s.JsonValue('ALTER')
  alter,
  @_s.JsonValue('DROP')
  drop,
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('DESCRIBE')
  describe,
  @_s.JsonValue('CREATE_DATABASE')
  createDatabase,
  @_s.JsonValue('CREATE_TABLE')
  createTable,
  @_s.JsonValue('DATA_LOCATION_ACCESS')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Permissions granted to a principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PrincipalPermissions {
  /// The permissions that are granted to the principal.
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  /// The principal who is granted permissions.
  @_s.JsonKey(name: 'Principal')
  final DataLakePrincipal principal;

  PrincipalPermissions({
    this.permissions,
    this.principal,
  });
  factory PrincipalPermissions.fromJson(Map<String, dynamic> json) =>
      _$PrincipalPermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$PrincipalPermissionsToJson(this);
}

/// The permissions granted or revoked on a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PrincipalResourcePermissions {
  /// This attribute can be used to return any additional details of
  /// <code>PrincipalResourcePermissions</code>. Currently returns only as a RAM
  /// share resource ARN.
  @_s.JsonKey(name: 'AdditionalDetails')
  final DetailsMap additionalDetails;

  /// The permissions to be granted or revoked on the resource.
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  /// Indicates whether to grant the ability to grant permissions (as a subset of
  /// permissions granted).
  @_s.JsonKey(name: 'PermissionsWithGrantOption')
  final List<Permission> permissionsWithGrantOption;

  /// The Data Lake principal to be granted or revoked permissions.
  @_s.JsonKey(name: 'Principal')
  final DataLakePrincipal principal;

  /// The resource where permissions are to be granted or revoked.
  @_s.JsonKey(name: 'Resource')
  final Resource resource;

  PrincipalResourcePermissions({
    this.additionalDetails,
    this.permissions,
    this.permissionsWithGrantOption,
    this.principal,
    this.resource,
  });
  factory PrincipalResourcePermissions.fromJson(Map<String, dynamic> json) =>
      _$PrincipalResourcePermissionsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutDataLakeSettingsResponse {
  PutDataLakeSettingsResponse();
  factory PutDataLakeSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutDataLakeSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterResourceResponse {
  RegisterResourceResponse();
  factory RegisterResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResourceResponseFromJson(json);
}

/// A structure for the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Resource {
  /// The identifier for the Data Catalog. By default, the account ID. The Data
  /// Catalog is the persistent metadata store. It contains database definitions,
  /// table definitions, and other control information to manage your AWS Lake
  /// Formation environment.
  @_s.JsonKey(name: 'Catalog')
  final CatalogResource catalog;

  /// The location of an Amazon S3 path where permissions are granted or revoked.
  @_s.JsonKey(name: 'DataLocation')
  final DataLocationResource dataLocation;

  /// The database for the resource. Unique to the Data Catalog. A database is a
  /// set of associated table definitions organized into a logical group. You can
  /// Grant and Revoke database permissions to a principal.
  @_s.JsonKey(name: 'Database')
  final DatabaseResource database;

  /// The table for the resource. A table is a metadata definition that represents
  /// your data. You can Grant and Revoke table privileges to a principal.
  @_s.JsonKey(name: 'Table')
  final TableResource table;

  /// The table with columns for the resource. A principal with permissions to
  /// this resource can select metadata from the columns of a table in the Data
  /// Catalog and the underlying data in Amazon S3.
  @_s.JsonKey(name: 'TableWithColumns')
  final TableWithColumnsResource tableWithColumns;

  Resource({
    this.catalog,
    this.dataLocation,
    this.database,
    this.table,
    this.tableWithColumns,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

/// A structure containing information about an AWS Lake Formation resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceInfo {
  /// The date and time the resource was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
  final DateTime lastModified;

  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  /// The IAM role that registered a resource.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  ResourceInfo({
    this.lastModified,
    this.resourceArn,
    this.roleArn,
  });
  factory ResourceInfo.fromJson(Map<String, dynamic> json) =>
      _$ResourceInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevokePermissionsResponse {
  RevokePermissionsResponse();
  factory RevokePermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$RevokePermissionsResponseFromJson(json);
}

/// A structure for the table object. A table is a metadata definition that
/// represents your data. You can Grant and Revoke table privileges to a
/// principal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TableResource {
  /// The name of the database for the table. Unique to a Data Catalog. A database
  /// is a set of associated table definitions organized into a logical group. You
  /// can Grant and Revoke database privileges to a principal.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The identifier for the Data Catalog. By default, it is the account ID of the
  /// caller.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The name of the table.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A wildcard object representing every table under a database.
  ///
  /// At least one of <code>TableResource$Name</code> or
  /// <code>TableResource$TableWildcard</code> is required.
  @_s.JsonKey(name: 'TableWildcard')
  final TableWildcard tableWildcard;

  TableResource({
    @_s.required this.databaseName,
    this.catalogId,
    this.name,
    this.tableWildcard,
  });
  factory TableResource.fromJson(Map<String, dynamic> json) =>
      _$TableResourceFromJson(json);

  Map<String, dynamic> toJson() => _$TableResourceToJson(this);
}

/// A wildcard object representing every table under a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TableWildcard {
  TableWildcard();
  factory TableWildcard.fromJson(Map<String, dynamic> json) =>
      _$TableWildcardFromJson(json);

  Map<String, dynamic> toJson() => _$TableWildcardToJson(this);
}

/// A structure for a table with columns object. This object is only used when
/// granting a SELECT permission.
///
/// This object must take a value for at least one of <code>ColumnsNames</code>,
/// <code>ColumnsIndexes</code>, or <code>ColumnsWildcard</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TableWithColumnsResource {
  /// The name of the database for the table with columns resource. Unique to the
  /// Data Catalog. A database is a set of associated table definitions organized
  /// into a logical group. You can Grant and Revoke database privileges to a
  /// principal.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The name of the table resource. A table is a metadata definition that
  /// represents your data. You can Grant and Revoke table privileges to a
  /// principal.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The identifier for the Data Catalog. By default, it is the account ID of the
  /// caller.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// The list of column names for the table. At least one of
  /// <code>ColumnNames</code> or <code>ColumnWildcard</code> is required.
  @_s.JsonKey(name: 'ColumnNames')
  final List<String> columnNames;

  /// A wildcard specified by a <code>ColumnWildcard</code> object. At least one
  /// of <code>ColumnNames</code> or <code>ColumnWildcard</code> is required.
  @_s.JsonKey(name: 'ColumnWildcard')
  final ColumnWildcard columnWildcard;

  TableWithColumnsResource({
    @_s.required this.databaseName,
    @_s.required this.name,
    this.catalogId,
    this.columnNames,
    this.columnWildcard,
  });
  factory TableWithColumnsResource.fromJson(Map<String, dynamic> json) =>
      _$TableWithColumnsResourceFromJson(json);

  Map<String, dynamic> toJson() => _$TableWithColumnsResourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceResponse {
  UpdateResourceResponse();
  factory UpdateResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResourceResponseFromJson(json);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class EntityNotFoundException extends _s.GenericAwsException {
  EntityNotFoundException({String type, String message})
      : super(type: type, code: 'EntityNotFoundException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class OperationTimeoutException extends _s.GenericAwsException {
  OperationTimeoutException({String type, String message})
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
