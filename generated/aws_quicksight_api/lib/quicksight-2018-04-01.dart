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

part 'quicksight-2018-04-01.g.dart';

/// Amazon QuickSight is a fully managed, serverless business intelligence
/// service for the AWS Cloud that makes it easy to extend data and insights to
/// every user in your organization. This API reference contains documentation
/// for a programming interface that you can use to manage Amazon QuickSight.
class QuickSight {
  final _s.RestJsonProtocol _protocol;
  QuickSight({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'quicksight',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels an ongoing ingestion of data into SPICE.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID of the dataset used in the ingestion.
  ///
  /// Parameter [ingestionId] :
  /// An ID for the ingestion.
  Future<CancelIngestionResponse> cancelIngestion({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    @_s.required String ingestionId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(ingestionId, 'ingestionId');
    _s.validateStringLength(
      'ingestionId',
      ingestionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ingestionId',
      ingestionId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}/ingestions/${Uri.encodeComponent(ingestionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelIngestionResponse.fromJson(response);
  }

  /// Creates a dashboard from a template. To first create a template, see the
  /// CreateTemplate API operation.
  ///
  /// A dashboard is an entity in QuickSight that identifies QuickSight reports,
  /// created from analyses. You can share QuickSight dashboards. With the right
  /// permissions, you can create scheduled email reports from them. The
  /// <code>CreateDashboard</code>, <code>DescribeDashboard</code>, and
  /// <code>ListDashboardsByUser</code> API operations act on the dashboard
  /// entity. If you have the correct permissions, you can create a dashboard
  /// from a template that exists in a different AWS account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account where you want to create the dashboard.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard, also added to the IAM policy.
  ///
  /// Parameter [name] :
  /// The display name of the dashboard.
  ///
  /// Parameter [sourceEntity] :
  /// The source entity from which the dashboard is created. The source entity
  /// accepts the Amazon Resource Name (ARN) of the source template or analysis
  /// and also references the replacement datasets for the placeholders set when
  /// creating the template. The replacement datasets need to follow the same
  /// schema as the datasets for which placeholders were created when creating
  /// the template.
  ///
  /// If you are creating a dashboard from a source entity in a different AWS
  /// account, use the ARN of the source template.
  ///
  /// Parameter [dashboardPublishOptions] :
  /// Options for publishing the dashboard when you create it:
  ///
  /// <ul>
  /// <li>
  /// <code>AvailabilityStatus</code> for <code>AdHocFilteringOption</code> -
  /// This status can be either <code>ENABLED</code> or <code>DISABLED</code>.
  /// When this is set to <code>DISABLED</code>, QuickSight disables the left
  /// filter pane on the published dashboard, which can be used for ad hoc
  /// (one-time) filtering. This option is <code>ENABLED</code> by default.
  /// </li>
  /// <li>
  /// <code>AvailabilityStatus</code> for <code>ExportToCSVOption</code> - This
  /// status can be either <code>ENABLED</code> or <code>DISABLED</code>. The
  /// visual option to export data to .csv format isn't enabled when this is set
  /// to <code>DISABLED</code>. This option is <code>ENABLED</code> by default.
  /// </li>
  /// <li>
  /// <code>VisibilityState</code> for <code>SheetControlsOption</code> - This
  /// visibility state can be either <code>COLLAPSED</code> or
  /// <code>EXPANDED</code>. The sheet controls pane is collapsed by default
  /// when set to true. This option is <code>COLLAPSED</code> by default.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// A structure that contains the parameters of the dashboard. These are
  /// parameter overrides for a dashboard. A dashboard can have any type of
  /// parameters, and some parameters might accept multiple values. You can use
  /// the dashboard permissions structure described following to override two
  /// string parameters that accept multiple values.
  ///
  /// Parameter [permissions] :
  /// A structure that contains the permissions of the dashboard. You can use
  /// this structure for granting permissions with principal and action
  /// information.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the dashboard.
  ///
  /// Parameter [versionDescription] :
  /// A description for the first version of the dashboard being created.
  Future<CreateDashboardResponse> createDashboard({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    @_s.required String name,
    @_s.required DashboardSourceEntity sourceEntity,
    DashboardPublishOptions dashboardPublishOptions,
    Parameters parameters,
    List<ResourcePermission> permissions,
    List<Tag> tags,
    String versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceEntity, 'sourceEntity');
    _s.validateStringLength(
      'versionDescription',
      versionDescription,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'SourceEntity': sourceEntity,
      if (dashboardPublishOptions != null)
        'DashboardPublishOptions': dashboardPublishOptions,
      if (parameters != null) 'Parameters': parameters,
      if (permissions != null) 'Permissions': permissions,
      if (tags != null) 'Tags': tags,
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDashboardResponse.fromJson(response);
  }

  /// Creates a dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// An ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  ///
  /// Parameter [importMode] :
  /// Indicates whether you want to import the data into SPICE.
  ///
  /// Parameter [name] :
  /// The display name for the dataset.
  ///
  /// Parameter [physicalTableMap] :
  /// Declares the physical tables that are available in the underlying data
  /// sources.
  ///
  /// Parameter [columnGroups] :
  /// Groupings of columns that work together in certain QuickSight features.
  /// Currently, only geospatial hierarchy is supported.
  ///
  /// Parameter [logicalTableMap] :
  /// Configures the combination and transformation of the data from the
  /// physical tables.
  ///
  /// Parameter [permissions] :
  /// A list of resource permissions on the dataset.
  ///
  /// Parameter [rowLevelPermissionDataSet] :
  /// The row-level security configuration for the data that you want to create.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the dataset.
  Future<CreateDataSetResponse> createDataSet({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    @_s.required DataSetImportMode importMode,
    @_s.required String name,
    @_s.required Map<String, PhysicalTable> physicalTableMap,
    List<ColumnGroup> columnGroups,
    Map<String, LogicalTable> logicalTableMap,
    List<ResourcePermission> permissions,
    RowLevelPermissionDataSet rowLevelPermissionDataSet,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(importMode, 'importMode');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(physicalTableMap, 'physicalTableMap');
    final $payload = <String, dynamic>{
      'DataSetId': dataSetId,
      'ImportMode': importMode?.toValue() ?? '',
      'Name': name,
      'PhysicalTableMap': physicalTableMap,
      if (columnGroups != null) 'ColumnGroups': columnGroups,
      if (logicalTableMap != null) 'LogicalTableMap': logicalTableMap,
      if (permissions != null) 'Permissions': permissions,
      if (rowLevelPermissionDataSet != null)
        'RowLevelPermissionDataSet': rowLevelPermissionDataSet,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSetResponse.fromJson(response);
  }

  /// Creates a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSourceId] :
  /// An ID for the data source. This ID is unique per AWS Region for each AWS
  /// account.
  ///
  /// Parameter [name] :
  /// A display name for the data source.
  ///
  /// Parameter [type] :
  /// The type of the data source. Currently, the supported types for this
  /// operation are: <code>ATHENA, AURORA, AURORA_POSTGRESQL, MARIADB, MYSQL,
  /// POSTGRESQL, PRESTO, REDSHIFT, S3, SNOWFLAKE, SPARK, SQLSERVER,
  /// TERADATA</code>. Use <code>ListDataSources</code> to return a list of all
  /// data sources.
  ///
  /// Parameter [credentials] :
  /// The credentials QuickSight that uses to connect to your underlying source.
  /// Currently, only credentials based on user name and password are supported.
  ///
  /// Parameter [dataSourceParameters] :
  /// The parameters that QuickSight uses to connect to your underlying source.
  ///
  /// Parameter [permissions] :
  /// A list of resource permissions on the data source.
  ///
  /// Parameter [sslProperties] :
  /// Secure Socket Layer (SSL) properties that apply when QuickSight connects
  /// to your underlying source.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the data source.
  ///
  /// Parameter [vpcConnectionProperties] :
  /// Use this parameter only when you want QuickSight to use a VPC connection
  /// when connecting to your underlying source.
  Future<CreateDataSourceResponse> createDataSource({
    @_s.required String awsAccountId,
    @_s.required String dataSourceId,
    @_s.required String name,
    @_s.required DataSourceType type,
    DataSourceCredentials credentials,
    DataSourceParameters dataSourceParameters,
    List<ResourcePermission> permissions,
    SslProperties sslProperties,
    List<Tag> tags,
    VpcConnectionProperties vpcConnectionProperties,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'DataSourceId': dataSourceId,
      'Name': name,
      'Type': type?.toValue() ?? '',
      if (credentials != null) 'Credentials': credentials,
      if (dataSourceParameters != null)
        'DataSourceParameters': dataSourceParameters,
      if (permissions != null) 'Permissions': permissions,
      if (sslProperties != null) 'SslProperties': sslProperties,
      if (tags != null) 'Tags': tags,
      if (vpcConnectionProperties != null)
        'VpcConnectionProperties': vpcConnectionProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSourceResponse.fromJson(response);
  }

  /// Creates an Amazon QuickSight group.
  ///
  /// The permissions resource is
  /// <code>arn:aws:quicksight:us-east-1:<i>&lt;relevant-aws-account-id&gt;</i>:group/default/<i>&lt;group-name&gt;</i>
  /// </code>.
  ///
  /// The response is a group object.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [PreconditionNotMetException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// A name for the group that you want to create.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [description] :
  /// A description for the group that you want to create.
  Future<CreateGroupResponse> createGroup({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String namespace,
    String description,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'GroupName': groupName,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupResponse.fromJson(response);
  }

  /// Adds an Amazon QuickSight user to an Amazon QuickSight group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// The name of the group that you want to add the user to.
  ///
  /// Parameter [memberName] :
  /// The name of the user that you want to add to the group membership.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  Future<CreateGroupMembershipResponse> createGroupMembership({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String memberName,
    @_s.required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberName, 'memberName');
    _s.validateStringLength(
      'memberName',
      memberName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'memberName',
      memberName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups/${Uri.encodeComponent(groupName)}/members/${Uri.encodeComponent(memberName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupMembershipResponse.fromJson(response);
  }

  /// Creates an assignment with one specified IAM policy, identified by its
  /// Amazon Resource Name (ARN). This policy will be assigned to specified
  /// groups or users of Amazon QuickSight. The users and groups need to be in
  /// the same namespace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConcurrentUpdatingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [assignmentName] :
  /// The name of the assignment. It must be unique within an AWS account.
  ///
  /// Parameter [assignmentStatus] :
  /// The status of the assignment. Possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Anything specified in this assignment is used when
  /// creating the data source.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - This assignment isn't used when creating the data
  /// source.
  /// </li>
  /// <li>
  /// <code>DRAFT</code> - This assignment is an unfinished draft and isn't used
  /// when creating the data source.
  /// </li>
  /// </ul>
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account where you want to assign an IAM policy to
  /// QuickSight users or groups.
  ///
  /// Parameter [namespace] :
  /// The namespace that contains the assignment.
  ///
  /// Parameter [identities] :
  /// The QuickSight users, groups, or both that you want to assign the policy
  /// to.
  ///
  /// Parameter [policyArn] :
  /// The ARN for the IAM policy to apply to the QuickSight users and groups
  /// specified in this assignment.
  Future<CreateIAMPolicyAssignmentResponse> createIAMPolicyAssignment({
    @_s.required String assignmentName,
    @_s.required AssignmentStatus assignmentStatus,
    @_s.required String awsAccountId,
    @_s.required String namespace,
    Map<String, List<String>> identities,
    String policyArn,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assignmentName',
      assignmentName,
      r'''(?=^.{2,256}$)(?!.*\s)[0-9a-zA-Z-_.:=+@]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(assignmentStatus, 'assignmentStatus');
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'AssignmentName': assignmentName,
      'AssignmentStatus': assignmentStatus?.toValue() ?? '',
      if (identities != null) 'Identities': identities,
      if (policyArn != null) 'PolicyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/iam-policy-assignments/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIAMPolicyAssignmentResponse.fromJson(response);
  }

  /// Creates and starts a new SPICE ingestion on a dataset
  ///
  /// Any ingestions operating on tagged datasets inherit the same tags
  /// automatically for use in access control. For an example, see <a
  /// href="https://aws.example.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/">How
  /// do I create an IAM policy to control access to Amazon EC2 resources using
  /// tags?</a> in the AWS Knowledge Center. Tags are visible on the tagged
  /// dataset, but not on the ingestion resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID of the dataset used in the ingestion.
  ///
  /// Parameter [ingestionId] :
  /// An ID for the ingestion.
  Future<CreateIngestionResponse> createIngestion({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    @_s.required String ingestionId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(ingestionId, 'ingestionId');
    _s.validateStringLength(
      'ingestionId',
      ingestionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ingestionId',
      ingestionId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}/ingestions/${Uri.encodeComponent(ingestionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIngestionResponse.fromJson(response);
  }

  /// Creates a template from an existing QuickSight analysis or template. You
  /// can use the resulting template to create a dashboard.
  ///
  /// A <i>template</i> is an entity in QuickSight that encapsulates the
  /// metadata required to create an analysis and that you can use to create s
  /// dashboard. A template adds a layer of abstraction by using placeholders to
  /// replace the dataset associated with the analysis. You can use templates to
  /// create dashboards by replacing dataset placeholders with datasets that
  /// follow the same schema that was used to create the source analysis and
  /// template.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [sourceEntity] :
  /// The Amazon Resource Name (ARN) of the source entity from which this
  /// template is being created. Currently, you can create a template from an
  /// analysis or another template. If the ARN is for an analysis, include its
  /// dataset references.
  ///
  /// Parameter [templateId] :
  /// An ID for the template that you want to create. This template is unique
  /// per AWS Region in each AWS account.
  ///
  /// Parameter [name] :
  /// A display name for the template.
  ///
  /// Parameter [permissions] :
  /// A list of resource permissions to be set on the template.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the resource.
  ///
  /// Parameter [versionDescription] :
  /// A description of the current template version being created. This API
  /// operation creates the first version of the template. Every time
  /// <code>UpdateTemplate</code> is called, a new version is created. Each
  /// version of the template maintains a description of the version in the
  /// <code>VersionDescription</code> field.
  Future<CreateTemplateResponse> createTemplate({
    @_s.required String awsAccountId,
    @_s.required TemplateSourceEntity sourceEntity,
    @_s.required String templateId,
    String name,
    List<ResourcePermission> permissions,
    List<Tag> tags,
    String versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceEntity, 'sourceEntity');
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateStringLength(
      'versionDescription',
      versionDescription,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'SourceEntity': sourceEntity,
      if (name != null) 'Name': name,
      if (permissions != null) 'Permissions': permissions,
      if (tags != null) 'Tags': tags,
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTemplateResponse.fromJson(response);
  }

  /// Creates a template alias for a template.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ResourceExistsException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name that you want to give to the template alias that you're creating.
  /// Don't start the alias name with the <code>$</code> character. Alias names
  /// that start with <code>$</code> are reserved by QuickSight.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template that you creating an
  /// alias for.
  ///
  /// Parameter [templateId] :
  /// An ID for the template.
  ///
  /// Parameter [templateVersionNumber] :
  /// The version number of the template.
  Future<CreateTemplateAliasResponse> createTemplateAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String templateId,
    @_s.required int templateVersionNumber,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''[\w\-]+|(\$LATEST)|(\$PUBLISHED)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateVersionNumber, 'templateVersionNumber');
    _s.validateNumRange(
      'templateVersionNumber',
      templateVersionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'TemplateVersionNumber': templateVersionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTemplateAliasResponse.fromJson(response);
  }

  /// Deletes a dashboard.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard that you're
  /// deleting.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the dashboard. If the version number property is
  /// provided, only the specified version of the dashboard is deleted.
  Future<DeleteDashboardResponse> deleteDashboard({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (versionNumber != null) 'version-number': [versionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDashboardResponse.fromJson(response);
  }

  /// Deletes a dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  Future<DeleteDataSetResponse> deleteDataSet({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataSetResponse.fromJson(response);
  }

  /// Deletes the data source permanently. This action breaks all the datasets
  /// that reference the deleted data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSourceId] :
  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  Future<DeleteDataSourceResponse> deleteDataSource({
    @_s.required String awsAccountId,
    @_s.required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataSourceResponse.fromJson(response);
  }

  /// Removes a user group from Amazon QuickSight.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// The name of the group that you want to delete.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  Future<DeleteGroupResponse> deleteGroup({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups/${Uri.encodeComponent(groupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGroupResponse.fromJson(response);
  }

  /// Removes a user from a group so that the user is no longer a member of the
  /// group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// The name of the group that you want to delete the user from.
  ///
  /// Parameter [memberName] :
  /// The name of the user that you want to delete from the group membership.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  Future<DeleteGroupMembershipResponse> deleteGroupMembership({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String memberName,
    @_s.required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberName, 'memberName');
    _s.validateStringLength(
      'memberName',
      memberName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'memberName',
      memberName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups/${Uri.encodeComponent(groupName)}/members/${Uri.encodeComponent(memberName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGroupMembershipResponse.fromJson(response);
  }

  /// Deletes an existing IAM policy assignment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConcurrentUpdatingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [assignmentName] :
  /// The name of the assignment.
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID where you want to delete the IAM policy assignment.
  ///
  /// Parameter [namespace] :
  /// The namespace that contains the assignment.
  Future<DeleteIAMPolicyAssignmentResponse> deleteIAMPolicyAssignment({
    @_s.required String assignmentName,
    @_s.required String awsAccountId,
    @_s.required String namespace,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assignmentName',
      assignmentName,
      r'''(?=^.{2,256}$)(?!.*\s)[0-9a-zA-Z-_.:=+@]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespace/${Uri.encodeComponent(namespace)}/iam-policy-assignments/${Uri.encodeComponent(assignmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteIAMPolicyAssignmentResponse.fromJson(response);
  }

  /// Deletes a template.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template that you're deleting.
  ///
  /// Parameter [templateId] :
  /// An ID for the template you want to delete.
  ///
  /// Parameter [versionNumber] :
  /// Specifies the version of the template that you want to delete. If you
  /// don't provide a version number, <code>DeleteTemplate</code> deletes all
  /// versions of the template.
  Future<DeleteTemplateResponse> deleteTemplate({
    @_s.required String awsAccountId,
    @_s.required String templateId,
    int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (versionNumber != null) 'version-number': [versionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTemplateResponse.fromJson(response);
  }

  /// Deletes the item that the specified template alias points to. If you
  /// provide a specific alias, you delete the version of the template that the
  /// alias points to.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name for the template alias. If you name a specific alias, you delete
  /// the version that the alias points to. You can specify the latest version
  /// of the template by providing the keyword <code>$LATEST</code> in the
  /// <code>AliasName</code> parameter.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the item to delete.
  ///
  /// Parameter [templateId] :
  /// The ID for the template that the specified alias is for.
  Future<DeleteTemplateAliasResponse> deleteTemplateAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String templateId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''[\w\-]+|(\$LATEST)|(\$PUBLISHED)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTemplateAliasResponse.fromJson(response);
  }

  /// Deletes the Amazon QuickSight user that is associated with the identity of
  /// the AWS Identity and Access Management (IAM) user or role that's making
  /// the call. The IAM user isn't deleted as a result of this call.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the user is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [userName] :
  /// The name of the user that you want to delete.
  Future<DeleteUserResponse> deleteUser({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users/${Uri.encodeComponent(userName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteUserResponse.fromJson(response);
  }

  /// Deletes a user identified by its principal ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the user is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the user.
  Future<DeleteUserByPrincipalIdResponse> deleteUserByPrincipalId({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    @_s.required String principalId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principalId, 'principalId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/user-principals/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteUserByPrincipalIdResponse.fromJson(response);
  }

  /// Provides a summary for a dashboard.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard that you're
  /// describing.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard.
  ///
  /// Parameter [aliasName] :
  /// The alias name.
  ///
  /// Parameter [versionNumber] :
  /// The version number for the dashboard. If a version number isn't passed,
  /// the latest published dashboard version is described.
  Future<DescribeDashboardResponse> describeDashboard({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    String aliasName,
    int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''[\w\-]+|(\$LATEST)|(\$PUBLISHED)''',
    );
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (aliasName != null) 'alias-name': [aliasName],
      if (versionNumber != null) 'version-number': [versionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDashboardResponse.fromJson(response);
  }

  /// Describes read and write permissions for a dashboard.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard that you're
  /// describing permissions for.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard, also added to the IAM policy.
  Future<DescribeDashboardPermissionsResponse> describeDashboardPermissions({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDashboardPermissionsResponse.fromJson(response);
  }

  /// Describes a dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  Future<DescribeDataSetResponse> describeDataSet({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDataSetResponse.fromJson(response);
  }

  /// Describes the permissions on a dataset.
  ///
  /// The permissions resource is
  /// <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  Future<DescribeDataSetPermissionsResponse> describeDataSetPermissions({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDataSetPermissionsResponse.fromJson(response);
  }

  /// Describes a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSourceId] :
  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  Future<DescribeDataSourceResponse> describeDataSource({
    @_s.required String awsAccountId,
    @_s.required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDataSourceResponse.fromJson(response);
  }

  /// Describes the resource permissions for a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSourceId] :
  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  Future<DescribeDataSourcePermissionsResponse> describeDataSourcePermissions({
    @_s.required String awsAccountId,
    @_s.required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources/${Uri.encodeComponent(dataSourceId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDataSourcePermissionsResponse.fromJson(response);
  }

  /// Returns an Amazon QuickSight group's description and Amazon Resource Name
  /// (ARN).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// The name of the group that you want to describe.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  Future<DescribeGroupResponse> describeGroup({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups/${Uri.encodeComponent(groupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGroupResponse.fromJson(response);
  }

  /// Describes an existing IAM policy assignment, as specified by the
  /// assignment name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [assignmentName] :
  /// The name of the assignment.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the assignment that you want to
  /// describe.
  ///
  /// Parameter [namespace] :
  /// The namespace that contains the assignment.
  Future<DescribeIAMPolicyAssignmentResponse> describeIAMPolicyAssignment({
    @_s.required String assignmentName,
    @_s.required String awsAccountId,
    @_s.required String namespace,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assignmentName',
      assignmentName,
      r'''(?=^.{2,256}$)(?!.*\s)[0-9a-zA-Z-_.:=+@]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/iam-policy-assignments/${Uri.encodeComponent(assignmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIAMPolicyAssignmentResponse.fromJson(response);
  }

  /// Describes a SPICE ingestion.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID of the dataset used in the ingestion.
  ///
  /// Parameter [ingestionId] :
  /// An ID for the ingestion.
  Future<DescribeIngestionResponse> describeIngestion({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    @_s.required String ingestionId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(ingestionId, 'ingestionId');
    _s.validateStringLength(
      'ingestionId',
      ingestionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ingestionId',
      ingestionId,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}/ingestions/${Uri.encodeComponent(ingestionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIngestionResponse.fromJson(response);
  }

  /// Describes a template's metadata.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template that you're
  /// describing.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  ///
  /// Parameter [aliasName] :
  /// The alias of the template that you want to describe. If you name a
  /// specific alias, you describe the version that the alias points to. You can
  /// specify the latest version of the template by providing the keyword
  /// <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword
  /// <code>$PUBLISHED</code> doesn't apply to templates.
  ///
  /// Parameter [versionNumber] :
  /// (Optional) The number for the version to describe. If a
  /// <code>VersionNumber</code> parameter value isn't provided, the latest
  /// version of the template is described.
  Future<DescribeTemplateResponse> describeTemplate({
    @_s.required String awsAccountId,
    @_s.required String templateId,
    String aliasName,
    int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''[\w\-]+|(\$LATEST)|(\$PUBLISHED)''',
    );
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (aliasName != null) 'alias-name': [aliasName],
      if (versionNumber != null) 'version-number': [versionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTemplateResponse.fromJson(response);
  }

  /// Describes the template alias for a template.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name of the template alias that you want to describe. If you name a
  /// specific alias, you describe the version that the alias points to. You can
  /// specify the latest version of the template by providing the keyword
  /// <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword
  /// <code>$PUBLISHED</code> doesn't apply to templates.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template alias that you're
  /// describing.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  Future<DescribeTemplateAliasResponse> describeTemplateAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String templateId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''[\w\-]+|(\$LATEST)|(\$PUBLISHED)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTemplateAliasResponse.fromJson(response);
  }

  /// Describes read and write permissions on a template.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template that you're
  /// describing.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  Future<DescribeTemplatePermissionsResponse> describeTemplatePermissions({
    @_s.required String awsAccountId,
    @_s.required String templateId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeTemplatePermissionsResponse.fromJson(response);
  }

  /// Returns information about a user, given the user name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the user is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [userName] :
  /// The name of the user that you want to describe.
  Future<DescribeUserResponse> describeUser({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users/${Uri.encodeComponent(userName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeUserResponse.fromJson(response);
  }

  /// Generates a server-side embeddable URL and authorization code. For this
  /// process to work properly, first configure the dashboards and user
  /// permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/user/embedding-dashboards.html">Embedding
  /// Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight User
  /// Guide</i> or <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/APIReference/qs-dev-embedded-dashboards.html">Embedding
  /// Amazon QuickSight Dashboards</a> in the <i>Amazon QuickSight API
  /// Reference</i>.
  ///
  /// Currently, you can use <code>GetDashboardEmbedURL</code> only from the
  /// server, not from the user’s browser.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [DomainNotWhitelistedException].
  /// May throw [QuickSightUserNotFoundException].
  /// May throw [IdentityTypeNotSupportedException].
  /// May throw [SessionLifetimeInMinutesInvalidException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that contains the dashboard that you're
  /// embedding.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard, also added to the IAM policy.
  ///
  /// Parameter [identityType] :
  /// The authentication method that the user uses to sign in.
  ///
  /// Parameter [resetDisabled] :
  /// Remove the reset button on the embedded dashboard. The default is FALSE,
  /// which enables the reset button.
  ///
  /// Parameter [sessionLifetimeInMinutes] :
  /// How many minutes the session is valid. The session lifetime must be 15-600
  /// minutes.
  ///
  /// Parameter [undoRedoDisabled] :
  /// Remove the undo/redo button on the embedded dashboard. The default is
  /// FALSE, which enables the undo/redo button.
  ///
  /// Parameter [userArn] :
  /// The Amazon QuickSight user's Amazon Resource Name (ARN), for use with
  /// <code>QUICKSIGHT</code> identity type. You can use this for any Amazon
  /// QuickSight users in your account (readers, authors, or admins)
  /// authenticated as one of the following:
  ///
  /// <ul>
  /// <li>
  /// Active Directory (AD) users or group members
  /// </li>
  /// <li>
  /// Invited nonfederated users
  /// </li>
  /// <li>
  /// IAM users and IAM role-based sessions authenticated through Federated
  /// Single Sign-On using SAML, OpenID Connect, or IAM federation.
  /// </li>
  /// </ul>
  Future<GetDashboardEmbedUrlResponse> getDashboardEmbedUrl({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    @_s.required IdentityType identityType,
    bool resetDisabled,
    int sessionLifetimeInMinutes,
    bool undoRedoDisabled,
    String userArn,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(identityType, 'identityType');
    _s.validateNumRange(
      'sessionLifetimeInMinutes',
      sessionLifetimeInMinutes,
      15,
      600,
    );
    final $query = <String, List<String>>{
      if (identityType != null) 'creds-type': [identityType.toValue()],
      if (resetDisabled != null) 'reset-disabled': [resetDisabled.toString()],
      if (sessionLifetimeInMinutes != null)
        'session-lifetime': [sessionLifetimeInMinutes.toString()],
      if (undoRedoDisabled != null)
        'undo-redo-disabled': [undoRedoDisabled.toString()],
      if (userArn != null) 'user-arn': [userArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}/embed-url',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDashboardEmbedUrlResponse.fromJson(response);
  }

  /// Lists all the versions of the dashboards in the QuickSight subscription.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard that you're listing
  /// versions for.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListDashboardVersionsResponse> listDashboardVersions({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDashboardVersionsResponse.fromJson(response);
  }

  /// Lists dashboards in an AWS account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboards that you're
  /// listing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListDashboardsResponse> listDashboards({
    @_s.required String awsAccountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDashboardsResponse.fromJson(response);
  }

  /// Lists all of the datasets belonging to the current AWS account in an AWS
  /// Region.
  ///
  /// The permissions resource is
  /// <code>arn:aws:quicksight:region:aws-account-id:dataset/*</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListDataSetsResponse> listDataSets({
    @_s.required String awsAccountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSetsResponse.fromJson(response);
  }

  /// Lists data sources in current AWS Region that belong to this AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListDataSourcesResponse> listDataSources({
    @_s.required String awsAccountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourcesResponse.fromJson(response);
  }

  /// Lists member users in a group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// The name of the group that you want to see a membership list of.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from this request.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListGroupMembershipsResponse> listGroupMemberships({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String namespace,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups/${Uri.encodeComponent(groupName)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupMembershipsResponse.fromJson(response);
  }

  /// Lists all user groups in Amazon QuickSight.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListGroupsResponse> listGroups({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGroupsResponse.fromJson(response);
  }

  /// Lists IAM policy assignments in the current Amazon QuickSight account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains these IAM policy assignments.
  ///
  /// Parameter [namespace] :
  /// The namespace for the assignments.
  ///
  /// Parameter [assignmentStatus] :
  /// The status of the assignments.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListIAMPolicyAssignmentsResponse> listIAMPolicyAssignments({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    AssignmentStatus assignmentStatus,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/iam-policy-assignments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIAMPolicyAssignmentsResponse.fromJson(response);
  }

  /// Lists all the IAM policy assignments, including the Amazon Resource Names
  /// (ARNs) for the IAM policies assigned to the specified user and group or
  /// groups that the user belongs to.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConcurrentUpdatingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the assignments.
  ///
  /// Parameter [namespace] :
  /// The namespace of the assignment.
  ///
  /// Parameter [userName] :
  /// The name of the user.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListIAMPolicyAssignmentsForUserResponse>
      listIAMPolicyAssignmentsForUser({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    @_s.required String userName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users/${Uri.encodeComponent(userName)}/iam-policy-assignments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIAMPolicyAssignmentsForUserResponse.fromJson(response);
  }

  /// Lists the history of SPICE ingestions for a dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID of the dataset used in the ingestion.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListIngestionsResponse> listIngestions({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}/ingestions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIngestionsResponse.fromJson(response);
  }

  /// Lists the tags assigned to a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want a list of
  /// tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resources/${Uri.encodeComponent(resourceArn)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists all the aliases of a template.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template aliases that you're
  /// listing.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListTemplateAliasesResponse> listTemplateAliases({
    @_s.required String awsAccountId,
    @_s.required String templateId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-result': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateAliasesResponse.fromJson(response);
  }

  /// Lists all the versions of the templates in the current Amazon QuickSight
  /// account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the templates that you're listing.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListTemplateVersionsResponse> listTemplateVersions({
    @_s.required String awsAccountId,
    @_s.required String templateId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateVersionsResponse.fromJson(response);
  }

  /// Lists all the templates in the current Amazon QuickSight account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the templates that you're listing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListTemplatesResponse> listTemplates({
    @_s.required String awsAccountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-result': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplatesResponse.fromJson(response);
  }

  /// Lists the Amazon QuickSight groups that an Amazon QuickSight user is a
  /// member of.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID that the user is in. Currently, you use the ID for the
  /// AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [userName] :
  /// The Amazon QuickSight user name that you want to list group memberships
  /// for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from this request.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListUserGroupsResponse> listUserGroups({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    @_s.required String userName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users/${Uri.encodeComponent(userName)}/groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUserGroupsResponse.fromJson(response);
  }

  /// Returns a list of all of the Amazon QuickSight users belonging to this
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the user is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from this request.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListUsersResponse> listUsers({
    @_s.required String awsAccountId,
    @_s.required String namespace,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Creates an Amazon QuickSight user, whose identity is associated with the
  /// AWS Identity and Access Management (IAM) identity or role specified in the
  /// request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceExistsException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the user is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [email] :
  /// The email address of the user that you want to register.
  ///
  /// Parameter [identityType] :
  /// Amazon QuickSight supports several ways of managing the identity of users.
  /// This parameter accepts two values:
  ///
  /// <ul>
  /// <li>
  /// <code>IAM</code>: A user whose identity maps to an existing IAM user or
  /// role.
  /// </li>
  /// <li>
  /// <code>QUICKSIGHT</code>: A user whose identity is owned and managed
  /// internally by Amazon QuickSight.
  /// </li>
  /// </ul>
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [userRole] :
  /// The Amazon QuickSight role for the user. The user role can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>READER</code>: A user who has read-only access to dashboards.
  /// </li>
  /// <li>
  /// <code>AUTHOR</code>: A user who can create data sources, datasets,
  /// analyses, and dashboards.
  /// </li>
  /// <li>
  /// <code>ADMIN</code>: A user who is an author, who can also manage Amazon
  /// QuickSight settings.
  /// </li>
  /// <li>
  /// <code>RESTRICTED_READER</code>: This role isn't currently available for
  /// use.
  /// </li>
  /// <li>
  /// <code>RESTRICTED_AUTHOR</code>: This role isn't currently available for
  /// use.
  /// </li>
  /// </ul>
  ///
  /// Parameter [iamArn] :
  /// The ARN of the IAM user or role that you are registering with Amazon
  /// QuickSight.
  ///
  /// Parameter [sessionName] :
  /// You need to use this parameter only when you register one or more users
  /// using an assumed IAM role. You don't need to provide the session name for
  /// other scenarios, for example when you are registering an IAM user or an
  /// Amazon QuickSight user. You can register multiple users using the same IAM
  /// role if each user has a different session name. For more information on
  /// assuming IAM roles, see <a
  /// href="https://docs.aws.example.com/cli/latest/reference/sts/assume-role.html">
  /// <code>assume-role</code> </a> in the <i>AWS CLI Reference.</i>
  ///
  /// Parameter [userName] :
  /// The Amazon QuickSight user name that you want to create for the user you
  /// are registering.
  Future<RegisterUserResponse> registerUser({
    @_s.required String awsAccountId,
    @_s.required String email,
    @_s.required IdentityType identityType,
    @_s.required String namespace,
    @_s.required UserRole userRole,
    String iamArn,
    String sessionName,
    String userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(identityType, 'identityType');
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userRole, 'userRole');
    _s.validateStringLength(
      'sessionName',
      sessionName,
      2,
      64,
    );
    _s.validateStringPattern(
      'sessionName',
      sessionName,
      r'''[\w+=.@-]*''',
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\u0020-\u00FF]+''',
    );
    final $payload = <String, dynamic>{
      'Email': email,
      'IdentityType': identityType?.toValue() ?? '',
      'UserRole': userRole?.toValue() ?? '',
      if (iamArn != null) 'IamArn': iamArn,
      if (sessionName != null) 'SessionName': sessionName,
      if (userName != null) 'UserName': userName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterUserResponse.fromJson(response);
  }

  /// Searchs for dashboards that belong to a user.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the user whose dashboards you're
  /// searching for.
  ///
  /// Parameter [filters] :
  /// The filters to apply to the search. Currently, you can search only by user
  /// name. For example, <code>"Filters": [ { "Name": "QUICKSIGHT_USER",
  /// "Operator": "StringEquals", "Value":
  /// "arn:aws:quicksight:us-east-1:1:user/default/UserName1" } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<SearchDashboardsResponse> searchDashboards({
    @_s.required String awsAccountId,
    @_s.required List<DashboardSearchFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(filters, 'filters');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/search/dashboards',
      exceptionFnMap: _exceptionFns,
    );
    return SearchDashboardsResponse.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified QuickSight
  /// resource.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values. You can use the
  /// <code>TagResource</code> operation with a resource that already has tags.
  /// If you specify a new tag key for the resource, this tag is appended to the
  /// list of tags associated with the resource. If you specify a tag key that
  /// is already associated with the resource, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource. QuickSight supports
  /// tagging on data set, data source, dashboard, and template.
  ///
  /// Tagging for QuickSight works in a similar way to tagging for other AWS
  /// services, except for the following:
  ///
  /// <ul>
  /// <li>
  /// You can't use tags to track AWS costs for QuickSight. This restriction is
  /// because QuickSight costs are based on users and SPICE capacity, which
  /// aren't taggable resources.
  /// </li>
  /// <li>
  /// QuickSight doesn't currently support the Tag Editor for AWS Resource
  /// Groups.
  /// </li>
  /// </ul>
  ///
  /// May throw [LimitExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the resource.
  Future<TagResourceResponse> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resources/${Uri.encodeComponent(resourceArn)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes a tag or tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the resource tag or tags assigned to
  /// the resource.
  Future<UntagResourceResponse> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'keys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resources/${Uri.encodeComponent(resourceArn)}/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates a dashboard in an AWS account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard that you're
  /// updating.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard.
  ///
  /// Parameter [name] :
  /// The display name of the dashboard.
  ///
  /// Parameter [sourceEntity] :
  /// The template or analysis from which the dashboard is created. The
  /// <code>SouceTemplate</code> entity accepts the Amazon Resource Name (ARN)
  /// of the template and also references to replacement datasets for the
  /// placeholders set when creating the template. The replacement datasets need
  /// to follow the same schema as the datasets for which placeholders were
  /// created when creating the template.
  ///
  /// Parameter [dashboardPublishOptions] :
  /// Options for publishing the dashboard when you create it:
  ///
  /// <ul>
  /// <li>
  /// <code>AvailabilityStatus</code> for <code>AdHocFilteringOption</code> -
  /// This status can be either <code>ENABLED</code> or <code>DISABLED</code>.
  /// When this is set to <code>DISABLED</code>, QuickSight disables the left
  /// filter pane on the published dashboard, which can be used for ad hoc
  /// (one-time) filtering. This option is <code>ENABLED</code> by default.
  /// </li>
  /// <li>
  /// <code>AvailabilityStatus</code> for <code>ExportToCSVOption</code> - This
  /// status can be either <code>ENABLED</code> or <code>DISABLED</code>. The
  /// visual option to export data to .csv format isn't enabled when this is set
  /// to <code>DISABLED</code>. This option is <code>ENABLED</code> by default.
  /// </li>
  /// <li>
  /// <code>VisibilityState</code> for <code>SheetControlsOption</code> - This
  /// visibility state can be either <code>COLLAPSED</code> or
  /// <code>EXPANDED</code>. The sheet controls pane is collapsed by default
  /// when set to true. This option is <code>COLLAPSED</code> by default.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// A structure that contains the parameters of the dashboard.
  ///
  /// Parameter [versionDescription] :
  /// A description for the first version of the dashboard being created.
  Future<UpdateDashboardResponse> updateDashboard({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    @_s.required String name,
    @_s.required DashboardSourceEntity sourceEntity,
    DashboardPublishOptions dashboardPublishOptions,
    Parameters parameters,
    String versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceEntity, 'sourceEntity');
    _s.validateStringLength(
      'versionDescription',
      versionDescription,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'SourceEntity': sourceEntity,
      if (dashboardPublishOptions != null)
        'DashboardPublishOptions': dashboardPublishOptions,
      if (parameters != null) 'Parameters': parameters,
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDashboardResponse.fromJson(response);
  }

  /// Updates read and write permissions on a dashboard.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard whose permissions
  /// you're updating.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard.
  ///
  /// Parameter [grantPermissions] :
  /// The permissions that you want to grant on this resource.
  ///
  /// Parameter [revokePermissions] :
  /// The permissions that you want to revoke from this resource.
  Future<UpdateDashboardPermissionsResponse> updateDashboardPermissions({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    List<ResourcePermission> grantPermissions,
    List<ResourcePermission> revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (grantPermissions != null) 'GrantPermissions': grantPermissions,
      if (revokePermissions != null) 'RevokePermissions': revokePermissions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDashboardPermissionsResponse.fromJson(response);
  }

  /// Updates the published version of a dashboard.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the dashboard that you're
  /// updating.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the dashboard.
  Future<UpdateDashboardPublishedVersionResponse>
      updateDashboardPublishedVersion({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    @_s.required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dashboardId',
      dashboardId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/dashboards/${Uri.encodeComponent(dashboardId)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDashboardPublishedVersionResponse.fromJson(response);
  }

  /// Updates a dataset.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID for the dataset that you want to update. This ID is unique per AWS
  /// Region for each AWS account.
  ///
  /// Parameter [importMode] :
  /// Indicates whether you want to import the data into SPICE.
  ///
  /// Parameter [name] :
  /// The display name for the dataset.
  ///
  /// Parameter [physicalTableMap] :
  /// Declares the physical tables that are available in the underlying data
  /// sources.
  ///
  /// Parameter [columnGroups] :
  /// Groupings of columns that work together in certain QuickSight features.
  /// Currently, only geospatial hierarchy is supported.
  ///
  /// Parameter [logicalTableMap] :
  /// Configures the combination and transformation of the data from the
  /// physical tables.
  ///
  /// Parameter [rowLevelPermissionDataSet] :
  /// The row-level security configuration for the data you want to create.
  Future<UpdateDataSetResponse> updateDataSet({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    @_s.required DataSetImportMode importMode,
    @_s.required String name,
    @_s.required Map<String, PhysicalTable> physicalTableMap,
    List<ColumnGroup> columnGroups,
    Map<String, LogicalTable> logicalTableMap,
    RowLevelPermissionDataSet rowLevelPermissionDataSet,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    ArgumentError.checkNotNull(importMode, 'importMode');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(physicalTableMap, 'physicalTableMap');
    final $payload = <String, dynamic>{
      'ImportMode': importMode?.toValue() ?? '',
      'Name': name,
      'PhysicalTableMap': physicalTableMap,
      if (columnGroups != null) 'ColumnGroups': columnGroups,
      if (logicalTableMap != null) 'LogicalTableMap': logicalTableMap,
      if (rowLevelPermissionDataSet != null)
        'RowLevelPermissionDataSet': rowLevelPermissionDataSet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSetResponse.fromJson(response);
  }

  /// Updates the permissions on a dataset.
  ///
  /// The permissions resource is
  /// <code>arn:aws:quicksight:region:aws-account-id:dataset/data-set-id</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSetId] :
  /// The ID for the dataset whose permissions you want to update. This ID is
  /// unique per AWS Region for each AWS account.
  ///
  /// Parameter [grantPermissions] :
  /// The resource permissions that you want to grant to the dataset.
  ///
  /// Parameter [revokePermissions] :
  /// The resource permissions that you want to revoke from the dataset.
  Future<UpdateDataSetPermissionsResponse> updateDataSetPermissions({
    @_s.required String awsAccountId,
    @_s.required String dataSetId,
    List<ResourcePermission> grantPermissions,
    List<ResourcePermission> revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSetId, 'dataSetId');
    final $payload = <String, dynamic>{
      if (grantPermissions != null) 'GrantPermissions': grantPermissions,
      if (revokePermissions != null) 'RevokePermissions': revokePermissions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sets/${Uri.encodeComponent(dataSetId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSetPermissionsResponse.fromJson(response);
  }

  /// Updates a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSourceId] :
  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  ///
  /// Parameter [name] :
  /// A display name for the data source.
  ///
  /// Parameter [credentials] :
  /// The credentials that QuickSight that uses to connect to your underlying
  /// source. Currently, only credentials based on user name and password are
  /// supported.
  ///
  /// Parameter [dataSourceParameters] :
  /// The parameters that QuickSight uses to connect to your underlying source.
  ///
  /// Parameter [sslProperties] :
  /// Secure Socket Layer (SSL) properties that apply when QuickSight connects
  /// to your underlying source.
  ///
  /// Parameter [vpcConnectionProperties] :
  /// Use this parameter only when you want QuickSight to use a VPC connection
  /// when connecting to your underlying source.
  Future<UpdateDataSourceResponse> updateDataSource({
    @_s.required String awsAccountId,
    @_s.required String dataSourceId,
    @_s.required String name,
    DataSourceCredentials credentials,
    DataSourceParameters dataSourceParameters,
    SslProperties sslProperties,
    VpcConnectionProperties vpcConnectionProperties,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      if (credentials != null) 'Credentials': credentials,
      if (dataSourceParameters != null)
        'DataSourceParameters': dataSourceParameters,
      if (sslProperties != null) 'SslProperties': sslProperties,
      if (vpcConnectionProperties != null)
        'VpcConnectionProperties': vpcConnectionProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources/${Uri.encodeComponent(dataSourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSourceResponse.fromJson(response);
  }

  /// Updates the permissions to a data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [dataSourceId] :
  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  ///
  /// Parameter [grantPermissions] :
  /// A list of resource permissions that you want to grant on the data source.
  ///
  /// Parameter [revokePermissions] :
  /// A list of resource permissions that you want to revoke on the data source.
  Future<UpdateDataSourcePermissionsResponse> updateDataSourcePermissions({
    @_s.required String awsAccountId,
    @_s.required String dataSourceId,
    List<ResourcePermission> grantPermissions,
    List<ResourcePermission> revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    final $payload = <String, dynamic>{
      if (grantPermissions != null) 'GrantPermissions': grantPermissions,
      if (revokePermissions != null) 'RevokePermissions': revokePermissions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/data-sources/${Uri.encodeComponent(dataSourceId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSourcePermissionsResponse.fromJson(response);
  }

  /// Changes a group description.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [groupName] :
  /// The name of the group that you want to update.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [description] :
  /// The description for the group that you want to update.
  Future<UpdateGroupResponse> updateGroup({
    @_s.required String awsAccountId,
    @_s.required String groupName,
    @_s.required String namespace,
    String description,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/groups/${Uri.encodeComponent(groupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupResponse.fromJson(response);
  }

  /// Updates an existing IAM policy assignment. This operation updates only the
  /// optional parameter or parameters that are specified in the request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConcurrentUpdatingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [assignmentName] :
  /// The name of the assignment. This name must be unique within an AWS
  /// account.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the IAM policy assignment.
  ///
  /// Parameter [namespace] :
  /// The namespace of the assignment.
  ///
  /// Parameter [assignmentStatus] :
  /// The status of the assignment. Possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Anything specified in this assignment is used when
  /// creating the data source.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - This assignment isn't used when creating the data
  /// source.
  /// </li>
  /// <li>
  /// <code>DRAFT</code> - This assignment is an unfinished draft and isn't used
  /// when creating the data source.
  /// </li>
  /// </ul>
  ///
  /// Parameter [identities] :
  /// The QuickSight users, groups, or both that you want to assign the policy
  /// to.
  ///
  /// Parameter [policyArn] :
  /// The ARN for the IAM policy to apply to the QuickSight users and groups
  /// specified in this assignment.
  Future<UpdateIAMPolicyAssignmentResponse> updateIAMPolicyAssignment({
    @_s.required String assignmentName,
    @_s.required String awsAccountId,
    @_s.required String namespace,
    AssignmentStatus assignmentStatus,
    Map<String, List<String>> identities,
    String policyArn,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assignmentName',
      assignmentName,
      r'''(?=^.{2,256}$)(?!.*\s)[0-9a-zA-Z-_.:=+@]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (assignmentStatus != null)
        'AssignmentStatus': assignmentStatus.toValue(),
      if (identities != null) 'Identities': identities,
      if (policyArn != null) 'PolicyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/iam-policy-assignments/${Uri.encodeComponent(assignmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIAMPolicyAssignmentResponse.fromJson(response);
  }

  /// Updates a template from an existing Amazon QuickSight analysis or another
  /// template.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template that you're updating.
  ///
  /// Parameter [sourceEntity] :
  /// The source QuickSight entity from which this template is being updated.
  /// You can currently update templates from an Analysis or another template.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  ///
  /// Parameter [name] :
  /// The name for the template.
  ///
  /// Parameter [versionDescription] :
  /// A description of the current template version that is being updated. Every
  /// time you call <code>UpdateTemplate</code>, you create a new version of the
  /// template. Each version of the template maintains a description of the
  /// version in the <code>VersionDescription</code> field.
  Future<UpdateTemplateResponse> updateTemplate({
    @_s.required String awsAccountId,
    @_s.required TemplateSourceEntity sourceEntity,
    @_s.required String templateId,
    String name,
    String versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceEntity, 'sourceEntity');
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateStringLength(
      'versionDescription',
      versionDescription,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'SourceEntity': sourceEntity,
      if (name != null) 'Name': name,
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTemplateResponse.fromJson(response);
  }

  /// Updates the template alias of a template.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The alias of the template that you want to update. If you name a specific
  /// alias, you update the version that the alias points to. You can specify
  /// the latest version of the template by providing the keyword
  /// <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword
  /// <code>$PUBLISHED</code> doesn't apply to templates.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template alias that you're
  /// updating.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  ///
  /// Parameter [templateVersionNumber] :
  /// The version number of the template.
  Future<UpdateTemplateAliasResponse> updateTemplateAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String templateId,
    @_s.required int templateVersionNumber,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''[\w\-]+|(\$LATEST)|(\$PUBLISHED)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateVersionNumber, 'templateVersionNumber');
    _s.validateNumRange(
      'templateVersionNumber',
      templateVersionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'TemplateVersionNumber': templateVersionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTemplateAliasResponse.fromJson(response);
  }

  /// Updates the resource permissions for a template.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the template.
  ///
  /// Parameter [templateId] :
  /// The ID for the template.
  ///
  /// Parameter [grantPermissions] :
  /// A list of resource permissions to be granted on the template.
  ///
  /// Parameter [revokePermissions] :
  /// A list of resource permissions to be revoked from the template.
  Future<UpdateTemplatePermissionsResponse> updateTemplatePermissions({
    @_s.required String awsAccountId,
    @_s.required String templateId,
    List<ResourcePermission> grantPermissions,
    List<ResourcePermission> revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (grantPermissions != null) 'GrantPermissions': grantPermissions,
      if (revokePermissions != null) 'RevokePermissions': revokePermissions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/templates/${Uri.encodeComponent(templateId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTemplatePermissionsResponse.fromJson(response);
  }

  /// Updates an Amazon QuickSight user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the user is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [email] :
  /// The email address of the user that you want to update.
  ///
  /// Parameter [namespace] :
  /// The namespace. Currently, you should set this to <code>default</code>.
  ///
  /// Parameter [role] :
  /// The Amazon QuickSight role of the user. The user role can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>READER</code>: A user who has read-only access to dashboards.
  /// </li>
  /// <li>
  /// <code>AUTHOR</code>: A user who can create data sources, datasets,
  /// analyses, and dashboards.
  /// </li>
  /// <li>
  /// <code>ADMIN</code>: A user who is an author, who can also manage Amazon
  /// QuickSight settings.
  /// </li>
  /// </ul>
  ///
  /// Parameter [userName] :
  /// The Amazon QuickSight user name that you want to update.
  Future<UpdateUserResponse> updateUser({
    @_s.required String awsAccountId,
    @_s.required String email,
    @_s.required String namespace,
    @_s.required UserRole role,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^[0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\u0020-\u00FF]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Email': email,
      'Role': role?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}/users/${Uri.encodeComponent(userName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }
}

/// The active AWS Identity and Access Management (IAM) policy assignment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActiveIAMPolicyAssignment {
  /// A name for the IAM policy assignment.
  @_s.JsonKey(name: 'AssignmentName')
  final String assignmentName;

  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  ActiveIAMPolicyAssignment({
    this.assignmentName,
    this.policyArn,
  });
  factory ActiveIAMPolicyAssignment.fromJson(Map<String, dynamic> json) =>
      _$ActiveIAMPolicyAssignmentFromJson(json);
}

/// Ad hoc (one-time) filtering option.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AdHocFilteringOption {
  /// Availability status.
  @_s.JsonKey(name: 'AvailabilityStatus')
  final DashboardBehavior availabilityStatus;

  AdHocFilteringOption({
    this.availabilityStatus,
  });
  Map<String, dynamic> toJson() => _$AdHocFilteringOptionToJson(this);
}

/// Amazon Elasticsearch Service parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AmazonElasticsearchParameters {
  /// The Amazon Elasticsearch Service domain.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  AmazonElasticsearchParameters({
    @_s.required this.domain,
  });
  factory AmazonElasticsearchParameters.fromJson(Map<String, dynamic> json) =>
      _$AmazonElasticsearchParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AmazonElasticsearchParametersToJson(this);
}

enum AssignmentStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DRAFT')
  draft,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on AssignmentStatus {
  String toValue() {
    switch (this) {
      case AssignmentStatus.enabled:
        return 'ENABLED';
      case AssignmentStatus.draft:
        return 'DRAFT';
      case AssignmentStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Amazon Athena parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AthenaParameters {
  /// The workgroup that Amazon Athena uses.
  @_s.JsonKey(name: 'WorkGroup')
  final String workGroup;

  AthenaParameters({
    this.workGroup,
  });
  factory AthenaParameters.fromJson(Map<String, dynamic> json) =>
      _$AthenaParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AthenaParametersToJson(this);
}

/// Amazon Aurora parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuroraParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  AuroraParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory AuroraParameters.fromJson(Map<String, dynamic> json) =>
      _$AuroraParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AuroraParametersToJson(this);
}

/// Amazon Aurora with PostgreSQL compatibility parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuroraPostgreSqlParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  AuroraPostgreSqlParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory AuroraPostgreSqlParameters.fromJson(Map<String, dynamic> json) =>
      _$AuroraPostgreSqlParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AuroraPostgreSqlParametersToJson(this);
}

/// AWS IoT Analytics parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIotAnalyticsParameters {
  /// Dataset name.
  @_s.JsonKey(name: 'DataSetName')
  final String dataSetName;

  AwsIotAnalyticsParameters({
    @_s.required this.dataSetName,
  });
  factory AwsIotAnalyticsParameters.fromJson(Map<String, dynamic> json) =>
      _$AwsIotAnalyticsParametersFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIotAnalyticsParametersToJson(this);
}

/// A calculated column for a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CalculatedColumn {
  /// A unique ID to identify a calculated column. During a dataset update, if the
  /// column ID of a calculated column matches that of an existing calculated
  /// column, Amazon QuickSight preserves the existing calculated column.
  @_s.JsonKey(name: 'ColumnId')
  final String columnId;

  /// Column name.
  @_s.JsonKey(name: 'ColumnName')
  final String columnName;

  /// An expression that defines the calculated column.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  CalculatedColumn({
    @_s.required this.columnId,
    @_s.required this.columnName,
    @_s.required this.expression,
  });
  factory CalculatedColumn.fromJson(Map<String, dynamic> json) =>
      _$CalculatedColumnFromJson(json);

  Map<String, dynamic> toJson() => _$CalculatedColumnToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelIngestionResponse {
  /// The Amazon Resource Name (ARN) for the data ingestion.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// An ID for the ingestion.
  @_s.JsonKey(name: 'IngestionId')
  final String ingestionId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CancelIngestionResponse({
    this.arn,
    this.ingestionId,
    this.requestId,
    this.status,
  });
  factory CancelIngestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelIngestionResponseFromJson(json);
}

/// A transform operation that casts a column to a different type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CastColumnTypeOperation {
  /// Column name.
  @_s.JsonKey(name: 'ColumnName')
  final String columnName;

  /// New column data type.
  @_s.JsonKey(name: 'NewColumnType')
  final ColumnDataType newColumnType;

  /// When casting a column from string to datetime type, you can supply a string
  /// in a format supported by Amazon QuickSight to denote the source data format.
  @_s.JsonKey(name: 'Format')
  final String format;

  CastColumnTypeOperation({
    @_s.required this.columnName,
    @_s.required this.newColumnType,
    this.format,
  });
  factory CastColumnTypeOperation.fromJson(Map<String, dynamic> json) =>
      _$CastColumnTypeOperationFromJson(json);

  Map<String, dynamic> toJson() => _$CastColumnTypeOperationToJson(this);
}

enum ColumnDataType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('INTEGER')
  integer,
  @_s.JsonValue('DECIMAL')
  decimal,
  @_s.JsonValue('DATETIME')
  datetime,
}

/// Groupings of columns that work together in certain Amazon QuickSight
/// features. This is a variant type structure. For this structure to be valid,
/// only one of the attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnGroup {
  /// Geospatial column group that denotes a hierarchy.
  @_s.JsonKey(name: 'GeoSpatialColumnGroup')
  final GeoSpatialColumnGroup geoSpatialColumnGroup;

  ColumnGroup({
    this.geoSpatialColumnGroup,
  });
  factory ColumnGroup.fromJson(Map<String, dynamic> json) =>
      _$ColumnGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnGroupToJson(this);
}

/// A structure describing the name, data type, and geographic role of the
/// columns.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnGroupColumnSchema {
  /// The name of the column group's column schema.
  @_s.JsonKey(name: 'Name')
  final String name;

  ColumnGroupColumnSchema({
    this.name,
  });
  factory ColumnGroupColumnSchema.fromJson(Map<String, dynamic> json) =>
      _$ColumnGroupColumnSchemaFromJson(json);
}

/// The column group schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnGroupSchema {
  /// A structure containing the list of schemas for column group columns.
  @_s.JsonKey(name: 'ColumnGroupColumnSchemaList')
  final List<ColumnGroupColumnSchema> columnGroupColumnSchemaList;

  /// The name of the column group schema.
  @_s.JsonKey(name: 'Name')
  final String name;

  ColumnGroupSchema({
    this.columnGroupColumnSchemaList,
    this.name,
  });
  factory ColumnGroupSchema.fromJson(Map<String, dynamic> json) =>
      _$ColumnGroupSchemaFromJson(json);
}

/// The column schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ColumnSchema {
  /// The data type of the column schema.
  @_s.JsonKey(name: 'DataType')
  final String dataType;

  /// The geographic role of the column schema.
  @_s.JsonKey(name: 'GeographicRole')
  final String geographicRole;

  /// The name of the column schema.
  @_s.JsonKey(name: 'Name')
  final String name;

  ColumnSchema({
    this.dataType,
    this.geographicRole,
    this.name,
  });
  factory ColumnSchema.fromJson(Map<String, dynamic> json) =>
      _$ColumnSchemaFromJson(json);
}

/// A tag for a column in a <code>TagColumnOperation</code> structure. This is a
/// variant type structure. For this structure to be valid, only one of the
/// attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnTag {
  /// A geospatial role for a column.
  @_s.JsonKey(name: 'ColumnGeographicRole')
  final GeoSpatialDataRole columnGeographicRole;

  ColumnTag({
    this.columnGeographicRole,
  });
  factory ColumnTag.fromJson(Map<String, dynamic> json) =>
      _$ColumnTagFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnTagToJson(this);
}

/// A transform operation that creates calculated columns. Columns created in
/// one such operation form a lexical closure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateColumnsOperation {
  /// Calculated columns to create.
  @_s.JsonKey(name: 'Columns')
  final List<CalculatedColumn> columns;

  CreateColumnsOperation({
    @_s.required this.columns,
  });
  factory CreateColumnsOperation.fromJson(Map<String, dynamic> json) =>
      _$CreateColumnsOperationFromJson(json);

  Map<String, dynamic> toJson() => _$CreateColumnsOperationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDashboardResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The status of the dashboard creation request.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The ID for the dashboard.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The ARN of the dashboard, including the version number of the first version
  /// that is created.
  @_s.JsonKey(name: 'VersionArn')
  final String versionArn;

  CreateDashboardResponse({
    this.arn,
    this.creationStatus,
    this.dashboardId,
    this.requestId,
    this.status,
    this.versionArn,
  });
  factory CreateDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The ARN for the ingestion, which is triggered as a result of dataset
  /// creation if the import mode is SPICE.
  @_s.JsonKey(name: 'IngestionArn')
  final String ingestionArn;

  /// The ID of the ingestion, which is triggered as a result of dataset creation
  /// if the import mode is SPICE.
  @_s.JsonKey(name: 'IngestionId')
  final String ingestionId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateDataSetResponse({
    this.arn,
    this.dataSetId,
    this.ingestionArn,
    this.ingestionId,
    this.requestId,
    this.status,
  });
  factory CreateDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSourceResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The status of creating the data source.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateDataSourceResponse({
    this.arn,
    this.creationStatus,
    this.dataSourceId,
    this.requestId,
    this.status,
  });
  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupMembershipResponse {
  /// The group member.
  @_s.JsonKey(name: 'GroupMember')
  final GroupMember groupMember;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateGroupMembershipResponse({
    this.groupMember,
    this.requestId,
    this.status,
  });
  factory CreateGroupMembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupMembershipResponseFromJson(json);
}

/// The response object for this operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupResponse {
  /// The name of the group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });
  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIAMPolicyAssignmentResponse {
  /// The ID for the assignment.
  @_s.JsonKey(name: 'AssignmentId')
  final String assignmentId;

  /// The name of the assignment. This name must be unique within the AWS account.
  @_s.JsonKey(name: 'AssignmentName')
  final String assignmentName;

  /// The status of the assignment. Possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Anything specified in this assignment is used when
  /// creating the data source.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - This assignment isn't used when creating the data
  /// source.
  /// </li>
  /// <li>
  /// <code>DRAFT</code> - This assignment is an unfinished draft and isn't used
  /// when creating the data source.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'AssignmentStatus')
  final AssignmentStatus assignmentStatus;

  /// The QuickSight users, groups, or both that the IAM policy is assigned to.
  @_s.JsonKey(name: 'Identities')
  final Map<String, List<String>> identities;

  /// The ARN for the IAM policy that is applied to the QuickSight users and
  /// groups specified in this assignment.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateIAMPolicyAssignmentResponse({
    this.assignmentId,
    this.assignmentName,
    this.assignmentStatus,
    this.identities,
    this.policyArn,
    this.requestId,
    this.status,
  });
  factory CreateIAMPolicyAssignmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateIAMPolicyAssignmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIngestionResponse {
  /// The Amazon Resource Name (ARN) for the data ingestion.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// An ID for the ingestion.
  @_s.JsonKey(name: 'IngestionId')
  final String ingestionId;

  /// The ingestion status.
  @_s.JsonKey(name: 'IngestionStatus')
  final IngestionStatus ingestionStatus;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateIngestionResponse({
    this.arn,
    this.ingestionId,
    this.ingestionStatus,
    this.requestId,
    this.status,
  });
  factory CreateIngestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIngestionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTemplateAliasResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Information about the template alias.
  @_s.JsonKey(name: 'TemplateAlias')
  final TemplateAlias templateAlias;

  CreateTemplateAliasResponse({
    this.requestId,
    this.status,
    this.templateAlias,
  });
  factory CreateTemplateAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTemplateResponse {
  /// The ARN for the template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The template creation status.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The ID of the template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  /// The ARN for the template, including the version information of the first
  /// version.
  @_s.JsonKey(name: 'VersionArn')
  final String versionArn;

  CreateTemplateResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.templateId,
    this.versionArn,
  });
  factory CreateTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateResponseFromJson(json);
}

/// The combination of user name and password that are used as credentials.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CredentialPair {
  /// Password.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// User name.
  @_s.JsonKey(name: 'Username')
  final String username;

  CredentialPair({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() => _$CredentialPairToJson(this);
}

/// A physical table type built from the results of the custom SQL query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomSql {
  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'DataSourceArn')
  final String dataSourceArn;

  /// A display name for the SQL query result.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The SQL query.
  @_s.JsonKey(name: 'SqlQuery')
  final String sqlQuery;

  /// The column schema from the SQL query result set.
  @_s.JsonKey(name: 'Columns')
  final List<InputColumn> columns;

  CustomSql({
    @_s.required this.dataSourceArn,
    @_s.required this.name,
    @_s.required this.sqlQuery,
    this.columns,
  });
  factory CustomSql.fromJson(Map<String, dynamic> json) =>
      _$CustomSqlFromJson(json);

  Map<String, dynamic> toJson() => _$CustomSqlToJson(this);
}

/// Dashboard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dashboard {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this dataset was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Dashboard ID.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The last time that this dataset was published.
  @_s.JsonKey(
      name: 'LastPublishedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastPublishedTime;

  /// The last time that this dataset was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Version.
  @_s.JsonKey(name: 'Version')
  final DashboardVersion version;

  Dashboard({
    this.arn,
    this.createdTime,
    this.dashboardId,
    this.lastPublishedTime,
    this.lastUpdatedTime,
    this.name,
    this.version,
  });
  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}

enum DashboardBehavior {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Dashboard error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DashboardError {
  /// Message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Type.
  @_s.JsonKey(name: 'Type')
  final DashboardErrorType type;

  DashboardError({
    this.message,
    this.type,
  });
  factory DashboardError.fromJson(Map<String, dynamic> json) =>
      _$DashboardErrorFromJson(json);
}

enum DashboardErrorType {
  @_s.JsonValue('DATA_SET_NOT_FOUND')
  dataSetNotFound,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
  @_s.JsonValue('PARAMETER_VALUE_INCOMPATIBLE')
  parameterValueIncompatible,
  @_s.JsonValue('PARAMETER_TYPE_INVALID')
  parameterTypeInvalid,
  @_s.JsonValue('PARAMETER_NOT_FOUND')
  parameterNotFound,
  @_s.JsonValue('COLUMN_TYPE_MISMATCH')
  columnTypeMismatch,
  @_s.JsonValue('COLUMN_GEOGRAPHIC_ROLE_MISMATCH')
  columnGeographicRoleMismatch,
  @_s.JsonValue('COLUMN_REPLACEMENT_MISSING')
  columnReplacementMissing,
}

enum DashboardFilterAttribute {
  @_s.JsonValue('QUICKSIGHT_USER')
  quicksightUser,
}

/// Dashboard publish options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DashboardPublishOptions {
  /// Ad hoc (one-time) filtering option.
  @_s.JsonKey(name: 'AdHocFilteringOption')
  final AdHocFilteringOption adHocFilteringOption;

  /// Export to .csv option.
  @_s.JsonKey(name: 'ExportToCSVOption')
  final ExportToCSVOption exportToCSVOption;

  /// Sheet controls option.
  @_s.JsonKey(name: 'SheetControlsOption')
  final SheetControlsOption sheetControlsOption;

  DashboardPublishOptions({
    this.adHocFilteringOption,
    this.exportToCSVOption,
    this.sheetControlsOption,
  });
  Map<String, dynamic> toJson() => _$DashboardPublishOptionsToJson(this);
}

/// A filter that you apply when searching for dashboards.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DashboardSearchFilter {
  /// The comparison operator that you want to use as a filter. For example,
  /// <code>"Operator": "StringEquals"</code>.
  @_s.JsonKey(name: 'Operator')
  final FilterOperator operator;

  /// The name of the value that you want to use as a filter. For example,
  /// <code>"Name": "QUICKSIGHT_USER"</code>.
  @_s.JsonKey(name: 'Name')
  final DashboardFilterAttribute name;

  /// The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that
  /// you want to use as a filter. For example, <code>"Value":
  /// "arn:aws:quicksight:us-east-1:1:user/default/UserName1"</code>.
  @_s.JsonKey(name: 'Value')
  final String value;

  DashboardSearchFilter({
    @_s.required this.operator,
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$DashboardSearchFilterToJson(this);
}

/// Dashboard source entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DashboardSourceEntity {
  /// Source template.
  @_s.JsonKey(name: 'SourceTemplate')
  final DashboardSourceTemplate sourceTemplate;

  DashboardSourceEntity({
    this.sourceTemplate,
  });
  Map<String, dynamic> toJson() => _$DashboardSourceEntityToJson(this);
}

/// Dashboard source template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DashboardSourceTemplate {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Dataset references.
  @_s.JsonKey(name: 'DataSetReferences')
  final List<DataSetReference> dataSetReferences;

  DashboardSourceTemplate({
    @_s.required this.arn,
    @_s.required this.dataSetReferences,
  });
  Map<String, dynamic> toJson() => _$DashboardSourceTemplateToJson(this);
}

/// Dashboard summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DashboardSummary {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this dashboard was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Dashboard ID.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The last time that this dashboard was published.
  @_s.JsonKey(
      name: 'LastPublishedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastPublishedTime;

  /// The last time that this dashboard was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// A display name for the dashboard.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Published version number.
  @_s.JsonKey(name: 'PublishedVersionNumber')
  final int publishedVersionNumber;

  DashboardSummary({
    this.arn,
    this.createdTime,
    this.dashboardId,
    this.lastPublishedTime,
    this.lastUpdatedTime,
    this.name,
    this.publishedVersionNumber,
  });
  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);
}

enum DashboardUIState {
  @_s.JsonValue('EXPANDED')
  expanded,
  @_s.JsonValue('COLLAPSED')
  collapsed,
}

/// Dashboard version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DashboardVersion {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this dashboard version was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Errors.
  @_s.JsonKey(name: 'Errors')
  final List<DashboardError> errors;

  /// Source entity ARN.
  @_s.JsonKey(name: 'SourceEntityArn')
  final String sourceEntityArn;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// Version number.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  DashboardVersion({
    this.arn,
    this.createdTime,
    this.description,
    this.errors,
    this.sourceEntityArn,
    this.status,
    this.versionNumber,
  });
  factory DashboardVersion.fromJson(Map<String, dynamic> json) =>
      _$DashboardVersionFromJson(json);
}

/// Dashboard version summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DashboardVersionSummary {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this dashboard version was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Source entity ARN.
  @_s.JsonKey(name: 'SourceEntityArn')
  final String sourceEntityArn;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// Version number.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  DashboardVersionSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.sourceEntityArn,
    this.status,
    this.versionNumber,
  });
  factory DashboardVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardVersionSummaryFromJson(json);
}

/// Dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSet {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Groupings of columns that work together in certain Amazon QuickSight
  /// features. Currently, only geospatial hierarchy is supported.
  @_s.JsonKey(name: 'ColumnGroups')
  final List<ColumnGroup> columnGroups;

  /// The amount of SPICE capacity used by this dataset. This is 0 if the dataset
  /// isn't imported into SPICE.
  @_s.JsonKey(name: 'ConsumedSpiceCapacityInBytes')
  final int consumedSpiceCapacityInBytes;

  /// The time that this dataset was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// The ID of the dataset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// Indicates whether you want to import the data into SPICE.
  @_s.JsonKey(name: 'ImportMode')
  final DataSetImportMode importMode;

  /// The last time that this dataset was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// Configures the combination and transformation of the data from the physical
  /// tables.
  @_s.JsonKey(name: 'LogicalTableMap')
  final Map<String, LogicalTable> logicalTableMap;

  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The list of columns after all transforms. These columns are available in
  /// templates, analyses, and dashboards.
  @_s.JsonKey(name: 'OutputColumns')
  final List<OutputColumn> outputColumns;

  /// Declares the physical tables that are available in the underlying data
  /// sources.
  @_s.JsonKey(name: 'PhysicalTableMap')
  final Map<String, PhysicalTable> physicalTableMap;

  /// The row-level security configuration for the dataset.
  @_s.JsonKey(name: 'RowLevelPermissionDataSet')
  final RowLevelPermissionDataSet rowLevelPermissionDataSet;

  DataSet({
    this.arn,
    this.columnGroups,
    this.consumedSpiceCapacityInBytes,
    this.createdTime,
    this.dataSetId,
    this.importMode,
    this.lastUpdatedTime,
    this.logicalTableMap,
    this.name,
    this.outputColumns,
    this.physicalTableMap,
    this.rowLevelPermissionDataSet,
  });
  factory DataSet.fromJson(Map<String, dynamic> json) =>
      _$DataSetFromJson(json);
}

/// Dataset configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSetConfiguration {
  /// A structure containing the list of column group schemas.
  @_s.JsonKey(name: 'ColumnGroupSchemaList')
  final List<ColumnGroupSchema> columnGroupSchemaList;

  /// Dataset schema.
  @_s.JsonKey(name: 'DataSetSchema')
  final DataSetSchema dataSetSchema;

  /// Placeholder.
  @_s.JsonKey(name: 'Placeholder')
  final String placeholder;

  DataSetConfiguration({
    this.columnGroupSchemaList,
    this.dataSetSchema,
    this.placeholder,
  });
  factory DataSetConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DataSetConfigurationFromJson(json);
}

enum DataSetImportMode {
  @_s.JsonValue('SPICE')
  spice,
  @_s.JsonValue('DIRECT_QUERY')
  directQuery,
}

extension on DataSetImportMode {
  String toValue() {
    switch (this) {
      case DataSetImportMode.spice:
        return 'SPICE';
      case DataSetImportMode.directQuery:
        return 'DIRECT_QUERY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Dataset reference.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DataSetReference {
  /// Dataset Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'DataSetArn')
  final String dataSetArn;

  /// Dataset placeholder.
  @_s.JsonKey(name: 'DataSetPlaceholder')
  final String dataSetPlaceholder;

  DataSetReference({
    @_s.required this.dataSetArn,
    @_s.required this.dataSetPlaceholder,
  });
  Map<String, dynamic> toJson() => _$DataSetReferenceToJson(this);
}

/// Dataset schema.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSetSchema {
  /// A structure containing the list of column schemas.
  @_s.JsonKey(name: 'ColumnSchemaList')
  final List<ColumnSchema> columnSchemaList;

  DataSetSchema({
    this.columnSchemaList,
  });
  factory DataSetSchema.fromJson(Map<String, dynamic> json) =>
      _$DataSetSchemaFromJson(json);
}

/// Dataset summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSetSummary {
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this dataset was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// The ID of the dataset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// Indicates whether you want to import the data into SPICE.
  @_s.JsonKey(name: 'ImportMode')
  final DataSetImportMode importMode;

  /// The last time that this dataset was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The row-level security configuration for the dataset.
  @_s.JsonKey(name: 'RowLevelPermissionDataSet')
  final RowLevelPermissionDataSet rowLevelPermissionDataSet;

  DataSetSummary({
    this.arn,
    this.createdTime,
    this.dataSetId,
    this.importMode,
    this.lastUpdatedTime,
    this.name,
    this.rowLevelPermissionDataSet,
  });
  factory DataSetSummary.fromJson(Map<String, dynamic> json) =>
      _$DataSetSummaryFromJson(json);
}

/// The structure of a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSource {
  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this data source was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The parameters that Amazon QuickSight uses to connect to your underlying
  /// source. This is a variant type structure. For this structure to be valid,
  /// only one of the attributes can be non-null.
  @_s.JsonKey(name: 'DataSourceParameters')
  final DataSourceParameters dataSourceParameters;

  /// Error information from the last update or the creation of the data source.
  @_s.JsonKey(name: 'ErrorInfo')
  final DataSourceErrorInfo errorInfo;

  /// The last time that this data source was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// A display name for the data source.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Secure Socket Layer (SSL) properties that apply when QuickSight connects to
  /// your underlying source.
  @_s.JsonKey(name: 'SslProperties')
  final SslProperties sslProperties;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The type of the data source. This type indicates which database engine the
  /// data source connects to.
  @_s.JsonKey(name: 'Type')
  final DataSourceType type;

  /// The VPC connection information. You need to use this parameter only when you
  /// want QuickSight to use a VPC connection when connecting to your underlying
  /// source.
  @_s.JsonKey(name: 'VpcConnectionProperties')
  final VpcConnectionProperties vpcConnectionProperties;

  DataSource({
    this.arn,
    this.createdTime,
    this.dataSourceId,
    this.dataSourceParameters,
    this.errorInfo,
    this.lastUpdatedTime,
    this.name,
    this.sslProperties,
    this.status,
    this.type,
    this.vpcConnectionProperties,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);
}

/// Data source credentials.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DataSourceCredentials {
  /// Credential pair.
  @_s.JsonKey(name: 'CredentialPair')
  final CredentialPair credentialPair;

  DataSourceCredentials({
    this.credentialPair,
  });
  Map<String, dynamic> toJson() => _$DataSourceCredentialsToJson(this);
}

/// Error information for the data source creation or update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSourceErrorInfo {
  /// Error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Error type.
  @_s.JsonKey(name: 'Type')
  final DataSourceErrorInfoType type;

  DataSourceErrorInfo({
    this.message,
    this.type,
  });
  factory DataSourceErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$DataSourceErrorInfoFromJson(json);
}

enum DataSourceErrorInfoType {
  @_s.JsonValue('TIMEOUT')
  timeout,
  @_s.JsonValue('ENGINE_VERSION_NOT_SUPPORTED')
  engineVersionNotSupported,
  @_s.JsonValue('UNKNOWN_HOST')
  unknownHost,
  @_s.JsonValue('GENERIC_SQL_FAILURE')
  genericSqlFailure,
  @_s.JsonValue('CONFLICT')
  conflict,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

/// The parameters that Amazon QuickSight uses to connect to your underlying
/// data source. This is a variant type structure. For this structure to be
/// valid, only one of the attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceParameters {
  /// Amazon Elasticsearch Service parameters.
  @_s.JsonKey(name: 'AmazonElasticsearchParameters')
  final AmazonElasticsearchParameters amazonElasticsearchParameters;

  /// Amazon Athena parameters.
  @_s.JsonKey(name: 'AthenaParameters')
  final AthenaParameters athenaParameters;

  /// Amazon Aurora MySQL parameters.
  @_s.JsonKey(name: 'AuroraParameters')
  final AuroraParameters auroraParameters;

  /// Aurora PostgreSQL parameters.
  @_s.JsonKey(name: 'AuroraPostgreSqlParameters')
  final AuroraPostgreSqlParameters auroraPostgreSqlParameters;

  /// AWS IoT Analytics parameters.
  @_s.JsonKey(name: 'AwsIotAnalyticsParameters')
  final AwsIotAnalyticsParameters awsIotAnalyticsParameters;

  /// Jira parameters.
  @_s.JsonKey(name: 'JiraParameters')
  final JiraParameters jiraParameters;

  /// MariaDB parameters.
  @_s.JsonKey(name: 'MariaDbParameters')
  final MariaDbParameters mariaDbParameters;

  /// MySQL parameters.
  @_s.JsonKey(name: 'MySqlParameters')
  final MySqlParameters mySqlParameters;

  /// PostgreSQL parameters.
  @_s.JsonKey(name: 'PostgreSqlParameters')
  final PostgreSqlParameters postgreSqlParameters;

  /// Presto parameters.
  @_s.JsonKey(name: 'PrestoParameters')
  final PrestoParameters prestoParameters;

  /// Amazon RDS parameters.
  @_s.JsonKey(name: 'RdsParameters')
  final RdsParameters rdsParameters;

  /// Amazon Redshift parameters.
  @_s.JsonKey(name: 'RedshiftParameters')
  final RedshiftParameters redshiftParameters;

  /// S3 parameters.
  @_s.JsonKey(name: 'S3Parameters')
  final S3Parameters s3Parameters;

  /// ServiceNow parameters.
  @_s.JsonKey(name: 'ServiceNowParameters')
  final ServiceNowParameters serviceNowParameters;

  /// Snowflake parameters.
  @_s.JsonKey(name: 'SnowflakeParameters')
  final SnowflakeParameters snowflakeParameters;

  /// Spark parameters.
  @_s.JsonKey(name: 'SparkParameters')
  final SparkParameters sparkParameters;

  /// SQL Server parameters.
  @_s.JsonKey(name: 'SqlServerParameters')
  final SqlServerParameters sqlServerParameters;

  /// Teradata parameters.
  @_s.JsonKey(name: 'TeradataParameters')
  final TeradataParameters teradataParameters;

  /// Twitter parameters.
  @_s.JsonKey(name: 'TwitterParameters')
  final TwitterParameters twitterParameters;

  DataSourceParameters({
    this.amazonElasticsearchParameters,
    this.athenaParameters,
    this.auroraParameters,
    this.auroraPostgreSqlParameters,
    this.awsIotAnalyticsParameters,
    this.jiraParameters,
    this.mariaDbParameters,
    this.mySqlParameters,
    this.postgreSqlParameters,
    this.prestoParameters,
    this.rdsParameters,
    this.redshiftParameters,
    this.s3Parameters,
    this.serviceNowParameters,
    this.snowflakeParameters,
    this.sparkParameters,
    this.sqlServerParameters,
    this.teradataParameters,
    this.twitterParameters,
  });
  factory DataSourceParameters.fromJson(Map<String, dynamic> json) =>
      _$DataSourceParametersFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceParametersToJson(this);
}

enum DataSourceType {
  @_s.JsonValue('ADOBE_ANALYTICS')
  adobeAnalytics,
  @_s.JsonValue('AMAZON_ELASTICSEARCH')
  amazonElasticsearch,
  @_s.JsonValue('ATHENA')
  athena,
  @_s.JsonValue('AURORA')
  aurora,
  @_s.JsonValue('AURORA_POSTGRESQL')
  auroraPostgresql,
  @_s.JsonValue('AWS_IOT_ANALYTICS')
  awsIotAnalytics,
  @_s.JsonValue('GITHUB')
  github,
  @_s.JsonValue('JIRA')
  jira,
  @_s.JsonValue('MARIADB')
  mariadb,
  @_s.JsonValue('MYSQL')
  mysql,
  @_s.JsonValue('POSTGRESQL')
  postgresql,
  @_s.JsonValue('PRESTO')
  presto,
  @_s.JsonValue('REDSHIFT')
  redshift,
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('SALESFORCE')
  salesforce,
  @_s.JsonValue('SERVICENOW')
  servicenow,
  @_s.JsonValue('SNOWFLAKE')
  snowflake,
  @_s.JsonValue('SPARK')
  spark,
  @_s.JsonValue('SQLSERVER')
  sqlserver,
  @_s.JsonValue('TERADATA')
  teradata,
  @_s.JsonValue('TWITTER')
  twitter,
}

extension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.adobeAnalytics:
        return 'ADOBE_ANALYTICS';
      case DataSourceType.amazonElasticsearch:
        return 'AMAZON_ELASTICSEARCH';
      case DataSourceType.athena:
        return 'ATHENA';
      case DataSourceType.aurora:
        return 'AURORA';
      case DataSourceType.auroraPostgresql:
        return 'AURORA_POSTGRESQL';
      case DataSourceType.awsIotAnalytics:
        return 'AWS_IOT_ANALYTICS';
      case DataSourceType.github:
        return 'GITHUB';
      case DataSourceType.jira:
        return 'JIRA';
      case DataSourceType.mariadb:
        return 'MARIADB';
      case DataSourceType.mysql:
        return 'MYSQL';
      case DataSourceType.postgresql:
        return 'POSTGRESQL';
      case DataSourceType.presto:
        return 'PRESTO';
      case DataSourceType.redshift:
        return 'REDSHIFT';
      case DataSourceType.s3:
        return 'S3';
      case DataSourceType.salesforce:
        return 'SALESFORCE';
      case DataSourceType.servicenow:
        return 'SERVICENOW';
      case DataSourceType.snowflake:
        return 'SNOWFLAKE';
      case DataSourceType.spark:
        return 'SPARK';
      case DataSourceType.sqlserver:
        return 'SQLSERVER';
      case DataSourceType.teradata:
        return 'TERADATA';
      case DataSourceType.twitter:
        return 'TWITTER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Date time parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DateTimeParameter {
  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Values.
  @_s.JsonKey(name: 'Values')
  final List<DateTime> values;

  DateTimeParameter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$DateTimeParameterToJson(this);
}

/// Decimal parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DecimalParameter {
  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Values.
  @_s.JsonKey(name: 'Values')
  final List<double> values;

  DecimalParameter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$DecimalParameterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDashboardResponse {
  /// The Secure Socket Layer (SSL) properties that apply for the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the dashboard.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteDashboardResponse({
    this.arn,
    this.dashboardId,
    this.requestId,
    this.status,
  });
  factory DeleteDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDataSetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteDataSetResponse({
    this.arn,
    this.dataSetId,
    this.requestId,
    this.status,
  });
  factory DeleteDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDataSourceResponse {
  /// The Amazon Resource Name (ARN) of the data source that you deleted.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteDataSourceResponse({
    this.arn,
    this.dataSourceId,
    this.requestId,
    this.status,
  });
  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGroupMembershipResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteGroupMembershipResponse({
    this.requestId,
    this.status,
  });
  factory DeleteGroupMembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupMembershipResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGroupResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteGroupResponse({
    this.requestId,
    this.status,
  });
  factory DeleteGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteIAMPolicyAssignmentResponse {
  /// The name of the assignment.
  @_s.JsonKey(name: 'AssignmentName')
  final String assignmentName;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteIAMPolicyAssignmentResponse({
    this.assignmentName,
    this.requestId,
    this.status,
  });
  factory DeleteIAMPolicyAssignmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteIAMPolicyAssignmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTemplateAliasResponse {
  /// The name for the template alias.
  @_s.JsonKey(name: 'AliasName')
  final String aliasName;

  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// An ID for the template associated with the deletion.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  DeleteTemplateAliasResponse({
    this.aliasName,
    this.arn,
    this.requestId,
    this.status,
    this.templateId,
  });
  factory DeleteTemplateAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTemplateAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTemplateResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// An ID for the template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  DeleteTemplateResponse({
    this.arn,
    this.requestId,
    this.status,
    this.templateId,
  });
  factory DeleteTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserByPrincipalIdResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteUserByPrincipalIdResponse({
    this.requestId,
    this.status,
  });
  factory DeleteUserByPrincipalIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserByPrincipalIdResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteUserResponse({
    this.requestId,
    this.status,
  });
  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDashboardPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  @_s.JsonKey(name: 'DashboardArn')
  final String dashboardArn;

  /// The ID for the dashboard.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// A structure that contains the permissions for the dashboard.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeDashboardPermissionsResponse({
    this.dashboardArn,
    this.dashboardId,
    this.permissions,
    this.requestId,
    this.status,
  });
  factory DescribeDashboardPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDashboardPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDashboardResponse {
  /// Information about the dashboard.
  @_s.JsonKey(name: 'Dashboard')
  final Dashboard dashboard;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of this request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeDashboardResponse({
    this.dashboard,
    this.requestId,
    this.status,
  });
  factory DescribeDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataSetPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'DataSetArn')
  final String dataSetArn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// A list of resource permissions on the dataset.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeDataSetPermissionsResponse({
    this.dataSetArn,
    this.dataSetId,
    this.permissions,
    this.requestId,
    this.status,
  });
  factory DescribeDataSetPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDataSetPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataSetResponse {
  /// Information on the dataset.
  @_s.JsonKey(name: 'DataSet')
  final DataSet dataSet;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeDataSetResponse({
    this.dataSet,
    this.requestId,
    this.status,
  });
  factory DescribeDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataSourcePermissionsResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'DataSourceArn')
  final String dataSourceArn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// A list of resource permissions on the data source.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeDataSourcePermissionsResponse({
    this.dataSourceArn,
    this.dataSourceId,
    this.permissions,
    this.requestId,
    this.status,
  });
  factory DescribeDataSourcePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDataSourcePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataSourceResponse {
  /// The information on the data source.
  @_s.JsonKey(name: 'DataSource')
  final DataSource dataSource;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeDataSourceResponse({
    this.dataSource,
    this.requestId,
    this.status,
  });
  factory DescribeDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGroupResponse {
  /// The name of the group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });
  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIAMPolicyAssignmentResponse {
  /// Information describing the IAM policy assignment.
  @_s.JsonKey(name: 'IAMPolicyAssignment')
  final IAMPolicyAssignment iAMPolicyAssignment;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeIAMPolicyAssignmentResponse({
    this.iAMPolicyAssignment,
    this.requestId,
    this.status,
  });
  factory DescribeIAMPolicyAssignmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeIAMPolicyAssignmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIngestionResponse {
  /// Information about the ingestion.
  @_s.JsonKey(name: 'Ingestion')
  final Ingestion ingestion;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeIngestionResponse({
    this.ingestion,
    this.requestId,
    this.status,
  });
  factory DescribeIngestionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeIngestionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTemplateAliasResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Information about the template alias.
  @_s.JsonKey(name: 'TemplateAlias')
  final TemplateAlias templateAlias;

  DescribeTemplateAliasResponse({
    this.requestId,
    this.status,
    this.templateAlias,
  });
  factory DescribeTemplateAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTemplateAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTemplatePermissionsResponse {
  /// A list of resource permissions to be set on the template.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The Amazon Resource Name (ARN) of the template.
  @_s.JsonKey(name: 'TemplateArn')
  final String templateArn;

  /// The ID for the template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  DescribeTemplatePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.templateArn,
    this.templateId,
  });
  factory DescribeTemplatePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTemplatePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTemplateResponse {
  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The template structure for the object you want to describe.
  @_s.JsonKey(name: 'Template')
  final Template template;

  DescribeTemplateResponse({
    this.status,
    this.template,
  });
  factory DescribeTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The user name.
  @_s.JsonKey(name: 'User')
  final User user;

  DescribeUserResponse({
    this.requestId,
    this.status,
    this.user,
  });
  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserResponseFromJson(json);
}

/// Error information for the SPICE ingestion of a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorInfo {
  /// Error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Error type.
  @_s.JsonKey(name: 'Type')
  final IngestionErrorType type;

  ErrorInfo({
    this.message,
    this.type,
  });
  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);
}

/// Export to .csv option.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExportToCSVOption {
  /// Availability status.
  @_s.JsonKey(name: 'AvailabilityStatus')
  final DashboardBehavior availabilityStatus;

  ExportToCSVOption({
    this.availabilityStatus,
  });
  Map<String, dynamic> toJson() => _$ExportToCSVOptionToJson(this);
}

enum FileFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('TSV')
  tsv,
  @_s.JsonValue('CLF')
  clf,
  @_s.JsonValue('ELF')
  elf,
  @_s.JsonValue('XLSX')
  xlsx,
  @_s.JsonValue('JSON')
  json,
}

/// A transform operation that filters rows based on a condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FilterOperation {
  /// An expression that must evaluate to a Boolean value. Rows for which the
  /// expression evaluates to true are kept in the dataset.
  @_s.JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  FilterOperation({
    @_s.required this.conditionExpression,
  });
  factory FilterOperation.fromJson(Map<String, dynamic> json) =>
      _$FilterOperationFromJson(json);

  Map<String, dynamic> toJson() => _$FilterOperationToJson(this);
}

enum FilterOperator {
  @_s.JsonValue('StringEquals')
  stringEquals,
}

/// Geospatial column group that denotes a hierarchy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GeoSpatialColumnGroup {
  /// Columns in this hierarchy.
  @_s.JsonKey(name: 'Columns')
  final List<String> columns;

  /// Country code.
  @_s.JsonKey(name: 'CountryCode')
  final GeoSpatialCountryCode countryCode;

  /// A display name for the hierarchy.
  @_s.JsonKey(name: 'Name')
  final String name;

  GeoSpatialColumnGroup({
    @_s.required this.columns,
    @_s.required this.countryCode,
    @_s.required this.name,
  });
  factory GeoSpatialColumnGroup.fromJson(Map<String, dynamic> json) =>
      _$GeoSpatialColumnGroupFromJson(json);

  Map<String, dynamic> toJson() => _$GeoSpatialColumnGroupToJson(this);
}

enum GeoSpatialCountryCode {
  @_s.JsonValue('US')
  us,
}

enum GeoSpatialDataRole {
  @_s.JsonValue('COUNTRY')
  country,
  @_s.JsonValue('STATE')
  state,
  @_s.JsonValue('COUNTY')
  county,
  @_s.JsonValue('CITY')
  city,
  @_s.JsonValue('POSTCODE')
  postcode,
  @_s.JsonValue('LONGITUDE')
  longitude,
  @_s.JsonValue('LATITUDE')
  latitude,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDashboardEmbedUrlResponse {
  /// An URL that you can put into your server-side webpage to embed your
  /// dashboard. This URL is valid for 5 minutes, and the resulting session is
  /// valid for 10 hours. The API provides the URL with an <code>auth_code</code>
  /// value that enables a single sign-on session.
  @_s.JsonKey(name: 'EmbedUrl')
  final String embedUrl;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  GetDashboardEmbedUrlResponse({
    this.embedUrl,
    this.requestId,
    this.status,
  });
  factory GetDashboardEmbedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDashboardEmbedUrlResponseFromJson(json);
}

/// A <i>group</i> in Amazon QuickSight consists of a set of users. You can use
/// groups to make it easier to manage access and security. Currently, an Amazon
/// QuickSight subscription can't contain more than 500 Amazon QuickSight
/// groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// The Amazon Resource Name (ARN) for the group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The group description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The principal ID of the group.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  Group({
    this.arn,
    this.description,
    this.groupName,
    this.principalId,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

/// A member of an Amazon QuickSight group. Currently, group members must be
/// users. Groups can't be members of another group. .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupMember {
  /// The Amazon Resource Name (ARN) for the group member (user).
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name of the group member (user).
  @_s.JsonKey(name: 'MemberName')
  final String memberName;

  GroupMember({
    this.arn,
    this.memberName,
  });
  factory GroupMember.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberFromJson(json);
}

/// An IAM policy assignment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IAMPolicyAssignment {
  /// Assignment ID.
  @_s.JsonKey(name: 'AssignmentId')
  final String assignmentId;

  /// Assignment name.
  @_s.JsonKey(name: 'AssignmentName')
  final String assignmentName;

  /// Assignment status.
  @_s.JsonKey(name: 'AssignmentStatus')
  final AssignmentStatus assignmentStatus;

  /// The AWS account ID.
  @_s.JsonKey(name: 'AwsAccountId')
  final String awsAccountId;

  /// Identities.
  @_s.JsonKey(name: 'Identities')
  final Map<String, List<String>> identities;

  /// The Amazon Resource Name (ARN) for the IAM policy.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  IAMPolicyAssignment({
    this.assignmentId,
    this.assignmentName,
    this.assignmentStatus,
    this.awsAccountId,
    this.identities,
    this.policyArn,
  });
  factory IAMPolicyAssignment.fromJson(Map<String, dynamic> json) =>
      _$IAMPolicyAssignmentFromJson(json);
}

/// IAM policy assignment summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IAMPolicyAssignmentSummary {
  /// Assignment name.
  @_s.JsonKey(name: 'AssignmentName')
  final String assignmentName;

  /// Assignment status.
  @_s.JsonKey(name: 'AssignmentStatus')
  final AssignmentStatus assignmentStatus;

  IAMPolicyAssignmentSummary({
    this.assignmentName,
    this.assignmentStatus,
  });
  factory IAMPolicyAssignmentSummary.fromJson(Map<String, dynamic> json) =>
      _$IAMPolicyAssignmentSummaryFromJson(json);
}

enum IdentityType {
  @_s.JsonValue('IAM')
  iam,
  @_s.JsonValue('QUICKSIGHT')
  quicksight,
}

extension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.iam:
        return 'IAM';
      case IdentityType.quicksight:
        return 'QUICKSIGHT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the SPICE ingestion for a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Ingestion {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this ingestion started.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Ingestion status.
  @_s.JsonKey(name: 'IngestionStatus')
  final IngestionStatus ingestionStatus;

  /// Error information for this ingestion.
  @_s.JsonKey(name: 'ErrorInfo')
  final ErrorInfo errorInfo;

  /// Ingestion ID.
  @_s.JsonKey(name: 'IngestionId')
  final String ingestionId;

  /// The size of the data ingested, in bytes.
  @_s.JsonKey(name: 'IngestionSizeInBytes')
  final int ingestionSizeInBytes;

  /// The time that this ingestion took, measured in seconds.
  @_s.JsonKey(name: 'IngestionTimeInSeconds')
  final int ingestionTimeInSeconds;
  @_s.JsonKey(name: 'QueueInfo')
  final QueueInfo queueInfo;

  /// Event source for this ingestion.
  @_s.JsonKey(name: 'RequestSource')
  final IngestionRequestSource requestSource;

  /// Type of this ingestion.
  @_s.JsonKey(name: 'RequestType')
  final IngestionRequestType requestType;
  @_s.JsonKey(name: 'RowInfo')
  final RowInfo rowInfo;

  Ingestion({
    @_s.required this.arn,
    @_s.required this.createdTime,
    @_s.required this.ingestionStatus,
    this.errorInfo,
    this.ingestionId,
    this.ingestionSizeInBytes,
    this.ingestionTimeInSeconds,
    this.queueInfo,
    this.requestSource,
    this.requestType,
    this.rowInfo,
  });
  factory Ingestion.fromJson(Map<String, dynamic> json) =>
      _$IngestionFromJson(json);
}

enum IngestionErrorType {
  @_s.JsonValue('FAILURE_TO_ASSUME_ROLE')
  failureToAssumeRole,
  @_s.JsonValue('INGESTION_SUPERSEDED')
  ingestionSuperseded,
  @_s.JsonValue('INGESTION_CANCELED')
  ingestionCanceled,
  @_s.JsonValue('DATA_SET_DELETED')
  dataSetDeleted,
  @_s.JsonValue('DATA_SET_NOT_SPICE')
  dataSetNotSpice,
  @_s.JsonValue('S3_UPLOADED_FILE_DELETED')
  s3UploadedFileDeleted,
  @_s.JsonValue('S3_MANIFEST_ERROR')
  s3ManifestError,
  @_s.JsonValue('DATA_TOLERANCE_EXCEPTION')
  dataToleranceException,
  @_s.JsonValue('SPICE_TABLE_NOT_FOUND')
  spiceTableNotFound,
  @_s.JsonValue('DATA_SET_SIZE_LIMIT_EXCEEDED')
  dataSetSizeLimitExceeded,
  @_s.JsonValue('ROW_SIZE_LIMIT_EXCEEDED')
  rowSizeLimitExceeded,
  @_s.JsonValue('ACCOUNT_CAPACITY_LIMIT_EXCEEDED')
  accountCapacityLimitExceeded,
  @_s.JsonValue('CUSTOMER_ERROR')
  customerError,
  @_s.JsonValue('DATA_SOURCE_NOT_FOUND')
  dataSourceNotFound,
  @_s.JsonValue('IAM_ROLE_NOT_AVAILABLE')
  iamRoleNotAvailable,
  @_s.JsonValue('CONNECTION_FAILURE')
  connectionFailure,
  @_s.JsonValue('SQL_TABLE_NOT_FOUND')
  sqlTableNotFound,
  @_s.JsonValue('PERMISSION_DENIED')
  permissionDenied,
  @_s.JsonValue('SSL_CERTIFICATE_VALIDATION_FAILURE')
  sslCertificateValidationFailure,
  @_s.JsonValue('OAUTH_TOKEN_FAILURE')
  oauthTokenFailure,
  @_s.JsonValue('SOURCE_API_LIMIT_EXCEEDED_FAILURE')
  sourceApiLimitExceededFailure,
  @_s.JsonValue('PASSWORD_AUTHENTICATION_FAILURE')
  passwordAuthenticationFailure,
  @_s.JsonValue('SQL_SCHEMA_MISMATCH_ERROR')
  sqlSchemaMismatchError,
  @_s.JsonValue('INVALID_DATE_FORMAT')
  invalidDateFormat,
  @_s.JsonValue('INVALID_DATAPREP_SYNTAX')
  invalidDataprepSyntax,
  @_s.JsonValue('SOURCE_RESOURCE_LIMIT_EXCEEDED')
  sourceResourceLimitExceeded,
  @_s.JsonValue('SQL_INVALID_PARAMETER_VALUE')
  sqlInvalidParameterValue,
  @_s.JsonValue('QUERY_TIMEOUT')
  queryTimeout,
  @_s.JsonValue('SQL_NUMERIC_OVERFLOW')
  sqlNumericOverflow,
  @_s.JsonValue('UNRESOLVABLE_HOST')
  unresolvableHost,
  @_s.JsonValue('UNROUTABLE_HOST')
  unroutableHost,
  @_s.JsonValue('SQL_EXCEPTION')
  sqlException,
  @_s.JsonValue('S3_FILE_INACCESSIBLE')
  s3FileInaccessible,
  @_s.JsonValue('IOT_FILE_NOT_FOUND')
  iotFileNotFound,
  @_s.JsonValue('IOT_DATA_SET_FILE_EMPTY')
  iotDataSetFileEmpty,
  @_s.JsonValue('INVALID_DATA_SOURCE_CONFIG')
  invalidDataSourceConfig,
  @_s.JsonValue('DATA_SOURCE_AUTH_FAILED')
  dataSourceAuthFailed,
  @_s.JsonValue('DATA_SOURCE_CONNECTION_FAILED')
  dataSourceConnectionFailed,
  @_s.JsonValue('FAILURE_TO_PROCESS_JSON_FILE')
  failureToProcessJsonFile,
  @_s.JsonValue('INTERNAL_SERVICE_ERROR')
  internalServiceError,
}

enum IngestionRequestSource {
  @_s.JsonValue('MANUAL')
  manual,
  @_s.JsonValue('SCHEDULED')
  scheduled,
}

enum IngestionRequestType {
  @_s.JsonValue('INITIAL_INGESTION')
  initialIngestion,
  @_s.JsonValue('EDIT')
  edit,
  @_s.JsonValue('INCREMENTAL_REFRESH')
  incrementalRefresh,
  @_s.JsonValue('FULL_REFRESH')
  fullRefresh,
}

enum IngestionStatus {
  @_s.JsonValue('INITIALIZED')
  initialized,
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELLED')
  cancelled,
}

/// Metadata for a column that is used as the input of a transform operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputColumn {
  /// The name of this column in the underlying data source.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The data type of the column.
  @_s.JsonKey(name: 'Type')
  final InputColumnDataType type;

  InputColumn({
    @_s.required this.name,
    @_s.required this.type,
  });
  factory InputColumn.fromJson(Map<String, dynamic> json) =>
      _$InputColumnFromJson(json);

  Map<String, dynamic> toJson() => _$InputColumnToJson(this);
}

enum InputColumnDataType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('INTEGER')
  integer,
  @_s.JsonValue('DECIMAL')
  decimal,
  @_s.JsonValue('DATETIME')
  datetime,
  @_s.JsonValue('BIT')
  bit,
  @_s.JsonValue('BOOLEAN')
  boolean,
  @_s.JsonValue('JSON')
  json,
}

/// Integer parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IntegerParameter {
  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Values.
  @_s.JsonKey(name: 'Values')
  final List<int> values;

  IntegerParameter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$IntegerParameterToJson(this);
}

/// Jira parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JiraParameters {
  /// The base URL of the Jira site.
  @_s.JsonKey(name: 'SiteBaseUrl')
  final String siteBaseUrl;

  JiraParameters({
    @_s.required this.siteBaseUrl,
  });
  factory JiraParameters.fromJson(Map<String, dynamic> json) =>
      _$JiraParametersFromJson(json);

  Map<String, dynamic> toJson() => _$JiraParametersToJson(this);
}

/// Join instruction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JoinInstruction {
  /// Left operand.
  @_s.JsonKey(name: 'LeftOperand')
  final String leftOperand;

  /// On Clause.
  @_s.JsonKey(name: 'OnClause')
  final String onClause;

  /// Right operand.
  @_s.JsonKey(name: 'RightOperand')
  final String rightOperand;

  /// Type.
  @_s.JsonKey(name: 'Type')
  final JoinType type;

  JoinInstruction({
    @_s.required this.leftOperand,
    @_s.required this.onClause,
    @_s.required this.rightOperand,
    @_s.required this.type,
  });
  factory JoinInstruction.fromJson(Map<String, dynamic> json) =>
      _$JoinInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$JoinInstructionToJson(this);
}

enum JoinType {
  @_s.JsonValue('INNER')
  inner,
  @_s.JsonValue('OUTER')
  outer,
  @_s.JsonValue('LEFT')
  left,
  @_s.JsonValue('RIGHT')
  right,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDashboardVersionsResponse {
  /// A structure that contains information about each version of the dashboard.
  @_s.JsonKey(name: 'DashboardVersionSummaryList')
  final List<DashboardVersionSummary> dashboardVersionSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListDashboardVersionsResponse({
    this.dashboardVersionSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListDashboardVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDashboardVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDashboardsResponse {
  /// A structure that contains all of the dashboards shared with the user. This
  /// structure provides basic information about the dashboards.
  @_s.JsonKey(name: 'DashboardSummaryList')
  final List<DashboardSummary> dashboardSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListDashboardsResponse({
    this.dashboardSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListDashboardsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDashboardsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSetsResponse {
  /// The list of dataset summaries.
  @_s.JsonKey(name: 'DataSetSummaries')
  final List<DataSetSummary> dataSetSummaries;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListDataSetsResponse({
    this.dataSetSummaries,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListDataSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSourcesResponse {
  /// A list of data sources.
  @_s.JsonKey(name: 'DataSources')
  final List<DataSource> dataSources;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListDataSourcesResponse({
    this.dataSources,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupMembershipsResponse {
  /// The list of the members of the group.
  @_s.JsonKey(name: 'GroupMemberList')
  final List<GroupMember> groupMemberList;

  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListGroupMembershipsResponse({
    this.groupMemberList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListGroupMembershipsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupMembershipsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupsResponse {
  /// The list of the groups.
  @_s.JsonKey(name: 'GroupList')
  final List<Group> groupList;

  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListGroupsResponse({
    this.groupList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIAMPolicyAssignmentsForUserResponse {
  /// The active assignments for this user.
  @_s.JsonKey(name: 'ActiveAssignments')
  final List<ActiveIAMPolicyAssignment> activeAssignments;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListIAMPolicyAssignmentsForUserResponse({
    this.activeAssignments,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListIAMPolicyAssignmentsForUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListIAMPolicyAssignmentsForUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIAMPolicyAssignmentsResponse {
  /// Information describing the IAM policy assignments.
  @_s.JsonKey(name: 'IAMPolicyAssignments')
  final List<IAMPolicyAssignmentSummary> iAMPolicyAssignments;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListIAMPolicyAssignmentsResponse({
    this.iAMPolicyAssignments,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListIAMPolicyAssignmentsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListIAMPolicyAssignmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIngestionsResponse {
  /// A list of the ingestions.
  @_s.JsonKey(name: 'Ingestions')
  final List<Ingestion> ingestions;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListIngestionsResponse({
    this.ingestions,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListIngestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIngestionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Contains a map of the key-value pairs for the resource tag or tags assigned
  /// to the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.requestId,
    this.status,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTemplateAliasesResponse {
  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// A structure containing the list of the template's aliases.
  @_s.JsonKey(name: 'TemplateAliasList')
  final List<TemplateAlias> templateAliasList;

  ListTemplateAliasesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.templateAliasList,
  });
  factory ListTemplateAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTemplateAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTemplateVersionsResponse {
  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// A structure containing a list of all the versions of the specified template.
  @_s.JsonKey(name: 'TemplateVersionSummaryList')
  final List<TemplateVersionSummary> templateVersionSummaryList;

  ListTemplateVersionsResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.templateVersionSummaryList,
  });
  factory ListTemplateVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTemplateVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTemplatesResponse {
  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// A structure containing information about the templates in the list.
  @_s.JsonKey(name: 'TemplateSummaryList')
  final List<TemplateSummary> templateSummaryList;

  ListTemplatesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.templateSummaryList,
  });
  factory ListTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserGroupsResponse {
  /// The list of groups the user is a member of.
  @_s.JsonKey(name: 'GroupList')
  final List<Group> groupList;

  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListUserGroupsResponse({
    this.groupList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListUserGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The list of users.
  @_s.JsonKey(name: 'UserList')
  final List<User> userList;

  ListUsersResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.userList,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// A <i>logical table</i> is a unit that joins and that data transformations
/// operate on. A logical table has a source, which can be either a physical
/// table or result of a join. When a logical table points to a physical table,
/// the logical table acts as a mutable copy of that physical table through
/// transform operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogicalTable {
  /// A display name for the logical table.
  @_s.JsonKey(name: 'Alias')
  final String alias;

  /// Source of this logical table.
  @_s.JsonKey(name: 'Source')
  final LogicalTableSource source;

  /// Transform operations that act on this logical table.
  @_s.JsonKey(name: 'DataTransforms')
  final List<TransformOperation> dataTransforms;

  LogicalTable({
    @_s.required this.alias,
    @_s.required this.source,
    this.dataTransforms,
  });
  factory LogicalTable.fromJson(Map<String, dynamic> json) =>
      _$LogicalTableFromJson(json);

  Map<String, dynamic> toJson() => _$LogicalTableToJson(this);
}

/// Information about the source of a logical table. This is a variant type
/// structure. For this structure to be valid, only one of the attributes can be
/// non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogicalTableSource {
  /// Specifies the result of a join of two logical tables.
  @_s.JsonKey(name: 'JoinInstruction')
  final JoinInstruction joinInstruction;

  /// Physical table ID.
  @_s.JsonKey(name: 'PhysicalTableId')
  final String physicalTableId;

  LogicalTableSource({
    this.joinInstruction,
    this.physicalTableId,
  });
  factory LogicalTableSource.fromJson(Map<String, dynamic> json) =>
      _$LogicalTableSourceFromJson(json);

  Map<String, dynamic> toJson() => _$LogicalTableSourceToJson(this);
}

/// Amazon S3 manifest file location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ManifestFileLocation {
  /// Amazon S3 bucket.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// Amazon S3 key that identifies an object.
  @_s.JsonKey(name: 'Key')
  final String key;

  ManifestFileLocation({
    @_s.required this.bucket,
    @_s.required this.key,
  });
  factory ManifestFileLocation.fromJson(Map<String, dynamic> json) =>
      _$ManifestFileLocationFromJson(json);

  Map<String, dynamic> toJson() => _$ManifestFileLocationToJson(this);
}

/// MariaDB parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MariaDbParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  MariaDbParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory MariaDbParameters.fromJson(Map<String, dynamic> json) =>
      _$MariaDbParametersFromJson(json);

  Map<String, dynamic> toJson() => _$MariaDbParametersToJson(this);
}

/// MySQL parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MySqlParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  MySqlParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory MySqlParameters.fromJson(Map<String, dynamic> json) =>
      _$MySqlParametersFromJson(json);

  Map<String, dynamic> toJson() => _$MySqlParametersToJson(this);
}

/// Output column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputColumn {
  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Type.
  @_s.JsonKey(name: 'Type')
  final ColumnDataType type;

  OutputColumn({
    this.name,
    this.type,
  });
  factory OutputColumn.fromJson(Map<String, dynamic> json) =>
      _$OutputColumnFromJson(json);
}

/// Parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Parameters {
  /// DateTime parameters.
  @_s.JsonKey(name: 'DateTimeParameters')
  final List<DateTimeParameter> dateTimeParameters;

  /// Decimal parameters.
  @_s.JsonKey(name: 'DecimalParameters')
  final List<DecimalParameter> decimalParameters;

  /// Integer parameters.
  @_s.JsonKey(name: 'IntegerParameters')
  final List<IntegerParameter> integerParameters;

  /// String parameters.
  @_s.JsonKey(name: 'StringParameters')
  final List<StringParameter> stringParameters;

  Parameters({
    this.dateTimeParameters,
    this.decimalParameters,
    this.integerParameters,
    this.stringParameters,
  });
  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}

/// A view of a data source that contains information about the shape of the
/// data in the underlying source. This is a variant type structure. For this
/// structure to be valid, only one of the attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PhysicalTable {
  /// A physical table type built from the results of the custom SQL query.
  @_s.JsonKey(name: 'CustomSql')
  final CustomSql customSql;

  /// A physical table type for relational data sources.
  @_s.JsonKey(name: 'RelationalTable')
  final RelationalTable relationalTable;

  /// A physical table type for as S3 data source.
  @_s.JsonKey(name: 'S3Source')
  final S3Source s3Source;

  PhysicalTable({
    this.customSql,
    this.relationalTable,
    this.s3Source,
  });
  factory PhysicalTable.fromJson(Map<String, dynamic> json) =>
      _$PhysicalTableFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalTableToJson(this);
}

/// PostgreSQL parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PostgreSqlParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  PostgreSqlParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory PostgreSqlParameters.fromJson(Map<String, dynamic> json) =>
      _$PostgreSqlParametersFromJson(json);

  Map<String, dynamic> toJson() => _$PostgreSqlParametersToJson(this);
}

/// Presto parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PrestoParameters {
  /// Catalog.
  @_s.JsonKey(name: 'Catalog')
  final String catalog;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  PrestoParameters({
    @_s.required this.catalog,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory PrestoParameters.fromJson(Map<String, dynamic> json) =>
      _$PrestoParametersFromJson(json);

  Map<String, dynamic> toJson() => _$PrestoParametersToJson(this);
}

/// A transform operation that projects columns. Operations that come after a
/// projection can only refer to projected columns.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProjectOperation {
  /// Projected columns.
  @_s.JsonKey(name: 'ProjectedColumns')
  final List<String> projectedColumns;

  ProjectOperation({
    @_s.required this.projectedColumns,
  });
  factory ProjectOperation.fromJson(Map<String, dynamic> json) =>
      _$ProjectOperationFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectOperationToJson(this);
}

/// Information about a queued dataset SPICE ingestion.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueueInfo {
  /// The ID of the ongoing ingestion. The queued ingestion is waiting for the
  /// ongoing ingestion to complete.
  @_s.JsonKey(name: 'QueuedIngestion')
  final String queuedIngestion;

  /// The ID of the queued ingestion.
  @_s.JsonKey(name: 'WaitingOnIngestion')
  final String waitingOnIngestion;

  QueueInfo({
    @_s.required this.queuedIngestion,
    @_s.required this.waitingOnIngestion,
  });
  factory QueueInfo.fromJson(Map<String, dynamic> json) =>
      _$QueueInfoFromJson(json);
}

/// Amazon RDS parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RdsParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Instance ID.
  @_s.JsonKey(name: 'InstanceId')
  final String instanceId;

  RdsParameters({
    @_s.required this.database,
    @_s.required this.instanceId,
  });
  factory RdsParameters.fromJson(Map<String, dynamic> json) =>
      _$RdsParametersFromJson(json);

  Map<String, dynamic> toJson() => _$RdsParametersToJson(this);
}

/// Amazon Redshift parameters. The <code>ClusterId</code> field can be blank if
/// <code>Host</code> and <code>Port</code> are both set. The <code>Host</code>
/// and <code>Port</code> fields can be blank if the <code>ClusterId</code>
/// field is set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RedshiftParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Cluster ID. This field can be blank if the <code>Host</code> and
  /// <code>Port</code> are provided.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// Host. This field can be blank if <code>ClusterId</code> is provided.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port. This field can be blank if the <code>ClusterId</code> is provided.
  @_s.JsonKey(name: 'Port')
  final int port;

  RedshiftParameters({
    @_s.required this.database,
    this.clusterId,
    this.host,
    this.port,
  });
  factory RedshiftParameters.fromJson(Map<String, dynamic> json) =>
      _$RedshiftParametersFromJson(json);

  Map<String, dynamic> toJson() => _$RedshiftParametersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterUserResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The user name.
  @_s.JsonKey(name: 'User')
  final User user;

  /// The URL the user visits to complete registration and provide a password.
  /// This is returned only for users with an identity type of
  /// <code>QUICKSIGHT</code>.
  @_s.JsonKey(name: 'UserInvitationUrl')
  final String userInvitationUrl;

  RegisterUserResponse({
    this.requestId,
    this.status,
    this.user,
    this.userInvitationUrl,
  });
  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);
}

/// A physical table type for relational data sources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RelationalTable {
  /// The Amazon Resource Name (ARN) for the data source.
  @_s.JsonKey(name: 'DataSourceArn')
  final String dataSourceArn;

  /// The column schema of the table.
  @_s.JsonKey(name: 'InputColumns')
  final List<InputColumn> inputColumns;

  /// The name of the relational table.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The schema name. This name applies to certain relational database engines.
  @_s.JsonKey(name: 'Schema')
  final String schema;

  RelationalTable({
    @_s.required this.dataSourceArn,
    @_s.required this.inputColumns,
    @_s.required this.name,
    this.schema,
  });
  factory RelationalTable.fromJson(Map<String, dynamic> json) =>
      _$RelationalTableFromJson(json);

  Map<String, dynamic> toJson() => _$RelationalTableToJson(this);
}

/// A transform operation that renames a column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RenameColumnOperation {
  /// The name of the column to be renamed.
  @_s.JsonKey(name: 'ColumnName')
  final String columnName;

  /// The new name for the column.
  @_s.JsonKey(name: 'NewColumnName')
  final String newColumnName;

  RenameColumnOperation({
    @_s.required this.columnName,
    @_s.required this.newColumnName,
  });
  factory RenameColumnOperation.fromJson(Map<String, dynamic> json) =>
      _$RenameColumnOperationFromJson(json);

  Map<String, dynamic> toJson() => _$RenameColumnOperationToJson(this);
}

/// Permission for the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourcePermission {
  /// The action to grant or revoke permissions on, for example
  /// <code>"quicksight:DescribeDashboard"</code>.
  @_s.JsonKey(name: 'Actions')
  final List<String> actions;

  /// The Amazon Resource Name (ARN) of an Amazon QuickSight user or group, or an
  /// IAM ARN. If you are using cross-account resource sharing, this is the IAM
  /// ARN of an account root. Otherwise, it is the ARN of a QuickSight user or
  /// group. .
  @_s.JsonKey(name: 'Principal')
  final String principal;

  ResourcePermission({
    @_s.required this.actions,
    @_s.required this.principal,
  });
  factory ResourcePermission.fromJson(Map<String, dynamic> json) =>
      _$ResourcePermissionFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcePermissionToJson(this);
}

enum ResourceStatus {
  @_s.JsonValue('CREATION_IN_PROGRESS')
  creationInProgress,
  @_s.JsonValue('CREATION_SUCCESSFUL')
  creationSuccessful,
  @_s.JsonValue('CREATION_FAILED')
  creationFailed,
  @_s.JsonValue('UPDATE_IN_PROGRESS')
  updateInProgress,
  @_s.JsonValue('UPDATE_SUCCESSFUL')
  updateSuccessful,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

/// Information about rows for a data set SPICE ingestion.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RowInfo {
  /// The number of rows that were not ingested.
  @_s.JsonKey(name: 'RowsDropped')
  final int rowsDropped;

  /// The number of rows that were ingested.
  @_s.JsonKey(name: 'RowsIngested')
  final int rowsIngested;

  RowInfo({
    this.rowsDropped,
    this.rowsIngested,
  });
  factory RowInfo.fromJson(Map<String, dynamic> json) =>
      _$RowInfoFromJson(json);
}

/// The row-level security configuration for the dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RowLevelPermissionDataSet {
  /// The Amazon Resource Name (ARN) of the permission dataset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Permission policy.
  @_s.JsonKey(name: 'PermissionPolicy')
  final RowLevelPermissionPolicy permissionPolicy;

  RowLevelPermissionDataSet({
    @_s.required this.arn,
    @_s.required this.permissionPolicy,
  });
  factory RowLevelPermissionDataSet.fromJson(Map<String, dynamic> json) =>
      _$RowLevelPermissionDataSetFromJson(json);

  Map<String, dynamic> toJson() => _$RowLevelPermissionDataSetToJson(this);
}

enum RowLevelPermissionPolicy {
  @_s.JsonValue('GRANT_ACCESS')
  grantAccess,
  @_s.JsonValue('DENY_ACCESS')
  denyAccess,
}

/// S3 parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Parameters {
  /// Location of the Amazon S3 manifest file. This is NULL if the manifest file
  /// was uploaded in the console.
  @_s.JsonKey(name: 'ManifestFileLocation')
  final ManifestFileLocation manifestFileLocation;

  S3Parameters({
    @_s.required this.manifestFileLocation,
  });
  factory S3Parameters.fromJson(Map<String, dynamic> json) =>
      _$S3ParametersFromJson(json);

  Map<String, dynamic> toJson() => _$S3ParametersToJson(this);
}

/// A physical table type for as S3 data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Source {
  /// The amazon Resource Name (ARN) for the data source.
  @_s.JsonKey(name: 'DataSourceArn')
  final String dataSourceArn;

  /// A physical table type for as S3 data source.
  @_s.JsonKey(name: 'InputColumns')
  final List<InputColumn> inputColumns;

  /// Information about the format for the S3 source file or files.
  @_s.JsonKey(name: 'UploadSettings')
  final UploadSettings uploadSettings;

  S3Source({
    @_s.required this.dataSourceArn,
    @_s.required this.inputColumns,
    this.uploadSettings,
  });
  factory S3Source.fromJson(Map<String, dynamic> json) =>
      _$S3SourceFromJson(json);

  Map<String, dynamic> toJson() => _$S3SourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchDashboardsResponse {
  /// The list of dashboards owned by the user specified in <code>Filters</code>
  /// in your request.
  @_s.JsonKey(name: 'DashboardSummaryList')
  final List<DashboardSummary> dashboardSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  SearchDashboardsResponse({
    this.dashboardSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory SearchDashboardsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchDashboardsResponseFromJson(json);
}

/// ServiceNow parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceNowParameters {
  /// URL of the base site.
  @_s.JsonKey(name: 'SiteBaseUrl')
  final String siteBaseUrl;

  ServiceNowParameters({
    @_s.required this.siteBaseUrl,
  });
  factory ServiceNowParameters.fromJson(Map<String, dynamic> json) =>
      _$ServiceNowParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceNowParametersToJson(this);
}

/// Sheet controls option.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SheetControlsOption {
  /// Visibility state.
  @_s.JsonKey(name: 'VisibilityState')
  final DashboardUIState visibilityState;

  SheetControlsOption({
    this.visibilityState,
  });
  Map<String, dynamic> toJson() => _$SheetControlsOptionToJson(this);
}

/// Snowflake parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnowflakeParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Warehouse.
  @_s.JsonKey(name: 'Warehouse')
  final String warehouse;

  SnowflakeParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.warehouse,
  });
  factory SnowflakeParameters.fromJson(Map<String, dynamic> json) =>
      _$SnowflakeParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SnowflakeParametersToJson(this);
}

/// Spark parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SparkParameters {
  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  SparkParameters({
    @_s.required this.host,
    @_s.required this.port,
  });
  factory SparkParameters.fromJson(Map<String, dynamic> json) =>
      _$SparkParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SparkParametersToJson(this);
}

/// SQL Server parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SqlServerParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  SqlServerParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory SqlServerParameters.fromJson(Map<String, dynamic> json) =>
      _$SqlServerParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SqlServerParametersToJson(this);
}

/// Secure Socket Layer (SSL) properties that apply when QuickSight connects to
/// your underlying data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SslProperties {
  /// A Boolean option to control whether SSL should be disabled.
  @_s.JsonKey(name: 'DisableSsl')
  final bool disableSsl;

  SslProperties({
    this.disableSsl,
  });
  factory SslProperties.fromJson(Map<String, dynamic> json) =>
      _$SslPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$SslPropertiesToJson(this);
}

/// String parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StringParameter {
  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  StringParameter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$StringParameterToJson(this);
}

/// The key or keys of the key-value pairs for the resource tag or tags assigned
/// to the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// A transform operation that tags a column with additional information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagColumnOperation {
  /// The column that this operation acts on.
  @_s.JsonKey(name: 'ColumnName')
  final String columnName;

  /// The dataset column tag, currently only used for geospatial type tagging. .
  /// <note>
  /// This is not tags for the AWS tagging feature. .
  /// </note>
  @_s.JsonKey(name: 'Tags')
  final List<ColumnTag> tags;

  TagColumnOperation({
    @_s.required this.columnName,
    @_s.required this.tags,
  });
  factory TagColumnOperation.fromJson(Map<String, dynamic> json) =>
      _$TagColumnOperationFromJson(json);

  Map<String, dynamic> toJson() => _$TagColumnOperationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  TagResourceResponse({
    this.requestId,
    this.status,
  });
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// A template object. A <i>template</i> is an entity in QuickSight that
/// encapsulates the metadata required to create an analysis and that you can
/// use to create a dashboard. A template adds a layer of abstraction by using
/// placeholders to replace the dataset associated with the analysis. You can
/// use templates to create dashboards by replacing dataset placeholders with
/// datasets that follow the same schema that was used to create the source
/// analysis and template.
///
/// You can share templates across AWS accounts by allowing users in other AWS
/// accounts to create a template or a dashboard from an existing template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Template {
  /// The Amazon Resource Name (ARN) of the template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Time when this was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Time when this was last updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// The display name of the template.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID for the template. This is unique per AWS Region for each AWS account.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  /// A structure describing the versions of the template.
  @_s.JsonKey(name: 'Version')
  final TemplateVersion version;

  Template({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.name,
    this.templateId,
    this.version,
  });
  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);
}

/// The template alias.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateAlias {
  /// The display name of the template alias.
  @_s.JsonKey(name: 'AliasName')
  final String aliasName;

  /// The Amazon Resource Name (ARN) of the template alias.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The version number of the template alias.
  @_s.JsonKey(name: 'TemplateVersionNumber')
  final int templateVersionNumber;

  TemplateAlias({
    this.aliasName,
    this.arn,
    this.templateVersionNumber,
  });
  factory TemplateAlias.fromJson(Map<String, dynamic> json) =>
      _$TemplateAliasFromJson(json);
}

/// List of errors that occurred when the template version creation failed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateError {
  /// Description of the error type.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Type of error.
  @_s.JsonKey(name: 'Type')
  final TemplateErrorType type;

  TemplateError({
    this.message,
    this.type,
  });
  factory TemplateError.fromJson(Map<String, dynamic> json) =>
      _$TemplateErrorFromJson(json);
}

enum TemplateErrorType {
  @_s.JsonValue('DATA_SET_NOT_FOUND')
  dataSetNotFound,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
}

/// The source analysis of the template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TemplateSourceAnalysis {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// A structure containing information about the dataset references used as
  /// placeholders in the template.
  @_s.JsonKey(name: 'DataSetReferences')
  final List<DataSetReference> dataSetReferences;

  TemplateSourceAnalysis({
    @_s.required this.arn,
    @_s.required this.dataSetReferences,
  });
  Map<String, dynamic> toJson() => _$TemplateSourceAnalysisToJson(this);
}

/// The source entity of the template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TemplateSourceEntity {
  /// The source analysis, if it is based on an analysis.
  @_s.JsonKey(name: 'SourceAnalysis')
  final TemplateSourceAnalysis sourceAnalysis;

  /// The source template, if it is based on an template.
  @_s.JsonKey(name: 'SourceTemplate')
  final TemplateSourceTemplate sourceTemplate;

  TemplateSourceEntity({
    this.sourceAnalysis,
    this.sourceTemplate,
  });
  Map<String, dynamic> toJson() => _$TemplateSourceEntityToJson(this);
}

/// The source template of the template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TemplateSourceTemplate {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  TemplateSourceTemplate({
    @_s.required this.arn,
  });
  Map<String, dynamic> toJson() => _$TemplateSourceTemplateToJson(this);
}

/// The template summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateSummary {
  /// A summary of a template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The last time that this template was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// The last time that this template was updated.
  @_s.JsonKey(
      name: 'LastUpdatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedTime;

  /// A structure containing a list of version numbers for the template summary.
  @_s.JsonKey(name: 'LatestVersionNumber')
  final int latestVersionNumber;

  /// A display name for the template.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the template. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  TemplateSummary({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.latestVersionNumber,
    this.name,
    this.templateId,
  });
  factory TemplateSummary.fromJson(Map<String, dynamic> json) =>
      _$TemplateSummaryFromJson(json);
}

/// A version of a template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateVersion {
  /// The time that this template version was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// Schema of the dataset identified by the placeholder. The idea is that any
  /// dashboard created from the template should be bound to new datasets matching
  /// the same schema described through this API. .
  @_s.JsonKey(name: 'DataSetConfigurations')
  final List<DataSetConfiguration> dataSetConfigurations;

  /// The description of the template.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Errors associated with the template.
  @_s.JsonKey(name: 'Errors')
  final List<TemplateError> errors;

  /// The Amazon Resource Name (ARN) of the analysis or template which was used to
  /// create this template.
  @_s.JsonKey(name: 'SourceEntityArn')
  final String sourceEntityArn;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The version number of the template.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  TemplateVersion({
    this.createdTime,
    this.dataSetConfigurations,
    this.description,
    this.errors,
    this.sourceEntityArn,
    this.status,
    this.versionNumber,
  });
  factory TemplateVersion.fromJson(Map<String, dynamic> json) =>
      _$TemplateVersionFromJson(json);
}

/// The template version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateVersionSummary {
  /// The ARN of the template version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this template version was created.
  @_s.JsonKey(
      name: 'CreatedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdTime;

  /// The description of the template version.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The status of the template version.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The version number of the template version.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  TemplateVersionSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.status,
    this.versionNumber,
  });
  factory TemplateVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$TemplateVersionSummaryFromJson(json);
}

/// Teradata parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TeradataParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// Host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  TeradataParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory TeradataParameters.fromJson(Map<String, dynamic> json) =>
      _$TeradataParametersFromJson(json);

  Map<String, dynamic> toJson() => _$TeradataParametersToJson(this);
}

enum TextQualifier {
  @_s.JsonValue('DOUBLE_QUOTE')
  doubleQuote,
  @_s.JsonValue('SINGLE_QUOTE')
  singleQuote,
}

/// A data transformation on a logical table. This is a variant type structure.
/// For this structure to be valid, only one of the attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformOperation {
  /// A transform operation that casts a column to a different type.
  @_s.JsonKey(name: 'CastColumnTypeOperation')
  final CastColumnTypeOperation castColumnTypeOperation;

  /// An operation that creates calculated columns. Columns created in one such
  /// operation form a lexical closure.
  @_s.JsonKey(name: 'CreateColumnsOperation')
  final CreateColumnsOperation createColumnsOperation;

  /// An operation that filters rows based on some condition.
  @_s.JsonKey(name: 'FilterOperation')
  final FilterOperation filterOperation;

  /// An operation that projects columns. Operations that come after a projection
  /// can only refer to projected columns.
  @_s.JsonKey(name: 'ProjectOperation')
  final ProjectOperation projectOperation;

  /// An operation that renames a column.
  @_s.JsonKey(name: 'RenameColumnOperation')
  final RenameColumnOperation renameColumnOperation;

  /// An operation that tags a column with additional information.
  @_s.JsonKey(name: 'TagColumnOperation')
  final TagColumnOperation tagColumnOperation;

  TransformOperation({
    this.castColumnTypeOperation,
    this.createColumnsOperation,
    this.filterOperation,
    this.projectOperation,
    this.renameColumnOperation,
    this.tagColumnOperation,
  });
  factory TransformOperation.fromJson(Map<String, dynamic> json) =>
      _$TransformOperationFromJson(json);

  Map<String, dynamic> toJson() => _$TransformOperationToJson(this);
}

/// Twitter parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TwitterParameters {
  /// Maximum number of rows to query Twitter.
  @_s.JsonKey(name: 'MaxRows')
  final int maxRows;

  /// Twitter query string.
  @_s.JsonKey(name: 'Query')
  final String query;

  TwitterParameters({
    @_s.required this.maxRows,
    @_s.required this.query,
  });
  factory TwitterParameters.fromJson(Map<String, dynamic> json) =>
      _$TwitterParametersFromJson(json);

  Map<String, dynamic> toJson() => _$TwitterParametersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UntagResourceResponse({
    this.requestId,
    this.status,
  });
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDashboardPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  @_s.JsonKey(name: 'DashboardArn')
  final String dashboardArn;

  /// The ID for the dashboard.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// Information about the permissions on the dashboard.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateDashboardPermissionsResponse({
    this.dashboardArn,
    this.dashboardId,
    this.permissions,
    this.requestId,
    this.status,
  });
  factory UpdateDashboardPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDashboardPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDashboardPublishedVersionResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  @_s.JsonKey(name: 'DashboardArn')
  final String dashboardArn;

  /// The ID for the dashboard.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateDashboardPublishedVersionResponse({
    this.dashboardArn,
    this.dashboardId,
    this.requestId,
    this.status,
  });
  factory UpdateDashboardPublishedVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDashboardPublishedVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDashboardResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The creation status of the request.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The ID for the dashboard.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The ARN of the dashboard, including the version number.
  @_s.JsonKey(name: 'VersionArn')
  final String versionArn;

  UpdateDashboardResponse({
    this.arn,
    this.creationStatus,
    this.dashboardId,
    this.requestId,
    this.status,
    this.versionArn,
  });
  factory UpdateDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDashboardResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSetPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'DataSetArn')
  final String dataSetArn;

  /// The ID for the dataset whose permissions you want to update. This ID is
  /// unique per AWS Region for each AWS account.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateDataSetPermissionsResponse({
    this.dataSetArn,
    this.dataSetId,
    this.requestId,
    this.status,
  });
  factory UpdateDataSetPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDataSetPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// The ARN for the ingestion, which is triggered as a result of dataset
  /// creation if the import mode is SPICE.
  @_s.JsonKey(name: 'IngestionArn')
  final String ingestionArn;

  /// The ID of the ingestion, which is triggered as a result of dataset creation
  /// if the import mode is SPICE.
  @_s.JsonKey(name: 'IngestionId')
  final String ingestionId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateDataSetResponse({
    this.arn,
    this.dataSetId,
    this.ingestionArn,
    this.ingestionId,
    this.requestId,
    this.status,
  });
  factory UpdateDataSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSourcePermissionsResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'DataSourceArn')
  final String dataSourceArn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateDataSourcePermissionsResponse({
    this.dataSourceArn,
    this.dataSourceId,
    this.requestId,
    this.status,
  });
  factory UpdateDataSourcePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDataSourcePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSourceResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The update status of the data source's last update.
  @_s.JsonKey(name: 'UpdateStatus')
  final ResourceStatus updateStatus;

  UpdateDataSourceResponse({
    this.arn,
    this.dataSourceId,
    this.requestId,
    this.status,
    this.updateStatus,
  });
  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupResponse {
  /// The name of the group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });
  factory UpdateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIAMPolicyAssignmentResponse {
  /// The ID of the assignment.
  @_s.JsonKey(name: 'AssignmentId')
  final String assignmentId;

  /// The name of the assignment.
  @_s.JsonKey(name: 'AssignmentName')
  final String assignmentName;

  /// The status of the assignment. Possible values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Anything specified in this assignment is used when
  /// creating the data source.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - This assignment isn't used when creating the data
  /// source.
  /// </li>
  /// <li>
  /// <code>DRAFT</code> - This assignment is an unfinished draft and isn't used
  /// when creating the data source.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'AssignmentStatus')
  final AssignmentStatus assignmentStatus;

  /// The QuickSight users, groups, or both that the IAM policy is assigned to.
  @_s.JsonKey(name: 'Identities')
  final Map<String, List<String>> identities;

  /// The ARN for the IAM policy applied to the QuickSight users and groups
  /// specified in this assignment.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateIAMPolicyAssignmentResponse({
    this.assignmentId,
    this.assignmentName,
    this.assignmentStatus,
    this.identities,
    this.policyArn,
    this.requestId,
    this.status,
  });
  factory UpdateIAMPolicyAssignmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateIAMPolicyAssignmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTemplateAliasResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The template alias.
  @_s.JsonKey(name: 'TemplateAlias')
  final TemplateAlias templateAlias;

  UpdateTemplateAliasResponse({
    this.requestId,
    this.status,
    this.templateAlias,
  });
  factory UpdateTemplateAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTemplateAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTemplatePermissionsResponse {
  /// A list of resource permissions to be set on the template.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The Amazon Resource Name (ARN) of the template.
  @_s.JsonKey(name: 'TemplateArn')
  final String templateArn;

  /// The ID for the template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  UpdateTemplatePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.templateArn,
    this.templateId,
  });
  factory UpdateTemplatePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateTemplatePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTemplateResponse {
  /// The Amazon Resource Name (ARN) for the template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The creation status of the template.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The ID for the template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  /// The ARN for the template, including the version information of the first
  /// version.
  @_s.JsonKey(name: 'VersionArn')
  final String versionArn;

  UpdateTemplateResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.templateId,
    this.versionArn,
  });
  factory UpdateTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The Amazon QuickSight user.
  @_s.JsonKey(name: 'User')
  final User user;

  UpdateUserResponse({
    this.requestId,
    this.status,
    this.user,
  });
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}

/// Information about the format for a source file or files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UploadSettings {
  /// Whether the file has a header row, or the files each have a header row.
  @_s.JsonKey(name: 'ContainsHeader')
  final bool containsHeader;

  /// The delimiter between values in the file.
  @_s.JsonKey(name: 'Delimiter')
  final String delimiter;

  /// File format.
  @_s.JsonKey(name: 'Format')
  final FileFormat format;

  /// A row number to start reading data from.
  @_s.JsonKey(name: 'StartFromRow')
  final int startFromRow;

  /// Text qualifier.
  @_s.JsonKey(name: 'TextQualifier')
  final TextQualifier textQualifier;

  UploadSettings({
    this.containsHeader,
    this.delimiter,
    this.format,
    this.startFromRow,
    this.textQualifier,
  });
  factory UploadSettings.fromJson(Map<String, dynamic> json) =>
      _$UploadSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UploadSettingsToJson(this);
}

/// A registered user of Amazon QuickSight. Currently, an Amazon QuickSight
/// subscription can't contain more than 20 million users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The active status of user. When you create an Amazon QuickSight user that’s
  /// not an IAM user or an Active Directory user, that user is inactive until
  /// they sign in and provide a password.
  @_s.JsonKey(name: 'Active')
  final bool active;

  /// The Amazon Resource Name (ARN) for the user.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The user's email address.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The type of identity authentication used by the user.
  @_s.JsonKey(name: 'IdentityType')
  final IdentityType identityType;

  /// The principal ID of the user.
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The Amazon QuickSight role for the user. The user role can be one of the
  /// following:.
  ///
  /// <ul>
  /// <li>
  /// <code>READER</code>: A user who has read-only access to dashboards.
  /// </li>
  /// <li>
  /// <code>AUTHOR</code>: A user who can create data sources, datasets, analyses,
  /// and dashboards.
  /// </li>
  /// <li>
  /// <code>ADMIN</code>: A user who is an author, who can also manage Amazon
  /// QuickSight settings.
  /// </li>
  /// <li>
  /// <code>RESTRICTED_READER</code>: This role isn't currently available for use.
  /// </li>
  /// <li>
  /// <code>RESTRICTED_AUTHOR</code>: This role isn't currently available for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Role')
  final UserRole role;

  /// The user's user name.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  User({
    this.active,
    this.arn,
    this.email,
    this.identityType,
    this.principalId,
    this.role,
    this.userName,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserRole {
  @_s.JsonValue('ADMIN')
  admin,
  @_s.JsonValue('AUTHOR')
  author,
  @_s.JsonValue('READER')
  reader,
  @_s.JsonValue('RESTRICTED_AUTHOR')
  restrictedAuthor,
  @_s.JsonValue('RESTRICTED_READER')
  restrictedReader,
}

extension on UserRole {
  String toValue() {
    switch (this) {
      case UserRole.admin:
        return 'ADMIN';
      case UserRole.author:
        return 'AUTHOR';
      case UserRole.reader:
        return 'READER';
      case UserRole.restrictedAuthor:
        return 'RESTRICTED_AUTHOR';
      case UserRole.restrictedReader:
        return 'RESTRICTED_READER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// VPC connection properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VpcConnectionProperties {
  /// The Amazon Resource Name (ARN) for the VPC connection.
  @_s.JsonKey(name: 'VpcConnectionArn')
  final String vpcConnectionArn;

  VpcConnectionProperties({
    @_s.required this.vpcConnectionArn,
  });
  factory VpcConnectionProperties.fromJson(Map<String, dynamic> json) =>
      _$VpcConnectionPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$VpcConnectionPropertiesToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConcurrentUpdatingException extends _s.GenericAwsException {
  ConcurrentUpdatingException({String type, String message})
      : super(
            type: type, code: 'ConcurrentUpdatingException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DomainNotWhitelistedException extends _s.GenericAwsException {
  DomainNotWhitelistedException({String type, String message})
      : super(
            type: type,
            code: 'DomainNotWhitelistedException',
            message: message);
}

class IdentityTypeNotSupportedException extends _s.GenericAwsException {
  IdentityTypeNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'IdentityTypeNotSupportedException',
            message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PreconditionNotMetException extends _s.GenericAwsException {
  PreconditionNotMetException({String type, String message})
      : super(
            type: type, code: 'PreconditionNotMetException', message: message);
}

class QuickSightUserNotFoundException extends _s.GenericAwsException {
  QuickSightUserNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'QuickSightUserNotFoundException',
            message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String type, String message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class SessionLifetimeInMinutesInvalidException extends _s.GenericAwsException {
  SessionLifetimeInMinutesInvalidException({String type, String message})
      : super(
            type: type,
            code: 'SessionLifetimeInMinutesInvalidException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedUserEditionException extends _s.GenericAwsException {
  UnsupportedUserEditionException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedUserEditionException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConcurrentUpdatingException': (type, message) =>
      ConcurrentUpdatingException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DomainNotWhitelistedException': (type, message) =>
      DomainNotWhitelistedException(type: type, message: message),
  'IdentityTypeNotSupportedException': (type, message) =>
      IdentityTypeNotSupportedException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'PreconditionNotMetException': (type, message) =>
      PreconditionNotMetException(type: type, message: message),
  'QuickSightUserNotFoundException': (type, message) =>
      QuickSightUserNotFoundException(type: type, message: message),
  'ResourceExistsException': (type, message) =>
      ResourceExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'SessionLifetimeInMinutesInvalidException': (type, message) =>
      SessionLifetimeInMinutesInvalidException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedUserEditionException': (type, message) =>
      UnsupportedUserEditionException(type: type, message: message),
};
