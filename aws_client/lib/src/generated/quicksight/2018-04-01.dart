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

part '2018-04-01.g.dart';

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

  /// Creates Amazon QuickSight customizations the current AWS Region.
  /// Currently, you can add a custom default theme by using the
  /// <code>CreateAccountCustomization</code> or
  /// <code>UpdateAccountCustomization</code> API operation. To further
  /// customize QuickSight by removing QuickSight sample assets and videos for
  /// all new users, see <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/user/customizing-quicksight.html">Customizing
  /// QuickSight</a> in the <i>Amazon QuickSight User Guide.</i>
  ///
  /// You can create customizations for your AWS account or, if you specify a
  /// namespace, for a QuickSight namespace instead. Customizations that apply
  /// to a namespace always override customizations that apply to an AWS
  /// account. To find out which customizations apply, use the
  /// <code>DescribeAccountCustomization</code> API operation.
  ///
  /// Before you use the <code>CreateAccountCustomization</code> API operation
  /// to add a theme as the namespace default, make sure that you first share
  /// the theme with the namespace. If you don't share it with the namespace,
  /// the theme isn't visible to your users even if you make it the default
  /// theme. To check if the theme is shared, view the current permissions by
  /// using the <code> <a>DescribeThemePermissions</a> </code> API operation. To
  /// share the theme, grant permissions by using the <code>
  /// <a>UpdateThemePermissions</a> </code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [accountCustomization] :
  /// The QuickSight customizations you're adding in the current AWS Region. You
  /// can add these to an AWS account and a QuickSight namespace.
  ///
  /// For example, you can add a default theme by setting
  /// <code>AccountCustomization</code> to the midnight theme:
  /// <code>"AccountCustomization": { "DefaultTheme":
  /// "arn:aws:quicksight::aws:theme/MIDNIGHT" }</code>. Or, you can add a
  /// custom theme by specifying <code>"AccountCustomization": { "DefaultTheme":
  /// "arn:aws:quicksight:us-west-2:111122223333:theme/bdb844d0-0fe9-4d9d-b520-0fe602d93639"
  /// }</code>.
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that you want to customize QuickSight for.
  ///
  /// Parameter [namespace] :
  /// The QuickSight namespace that you want to add customizations to.
  ///
  /// Parameter [tags] :
  /// A list of the tags that you want to attach to this resource.
  Future<CreateAccountCustomizationResponse> createAccountCustomization({
    @_s.required AccountCustomization accountCustomization,
    @_s.required String awsAccountId,
    String namespace,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(accountCustomization, 'accountCustomization');
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    final $query = <String, List<String>>{
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'AccountCustomization': accountCustomization,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/customizations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccountCustomizationResponse.fromJson(response);
  }

  /// Creates an analysis in Amazon QuickSight.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID for the analysis that you're creating. This ID displays in the URL
  /// of the analysis.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account where you are creating an analysis.
  ///
  /// Parameter [name] :
  /// A descriptive name for the analysis that you're creating. This name
  /// displays for the analysis in the QuickSight console.
  ///
  /// Parameter [sourceEntity] :
  /// A source entity to use for the analysis that you're creating. This
  /// metadata structure contains details that describe a source template and
  /// one or more datasets.
  ///
  /// Parameter [parameters] :
  /// The parameter names and override values that you want to use. An analysis
  /// can have any parameter type, and some parameters might accept multiple
  /// values.
  ///
  /// Parameter [permissions] :
  /// A structure that describes the principals and the resource-level
  /// permissions on an analysis. You can use the <code>Permissions</code>
  /// structure to grant permissions by providing a list of AWS Identity and
  /// Access Management (IAM) action information for each principal listed by
  /// Amazon Resource Name (ARN).
  ///
  /// To specify no permissions, omit <code>Permissions</code>.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the analysis.
  ///
  /// Parameter [themeArn] :
  /// The ARN for the theme to apply to the analysis that you're creating. To
  /// see the theme in the QuickSight console, make sure that you have access to
  /// it.
  Future<CreateAnalysisResponse> createAnalysis({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
    @_s.required String name,
    @_s.required AnalysisSourceEntity sourceEntity,
    Parameters parameters,
    List<ResourcePermission> permissions,
    List<Tag> tags,
    String themeArn,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    final $payload = <String, dynamic>{
      'Name': name,
      'SourceEntity': sourceEntity,
      if (parameters != null) 'Parameters': parameters,
      if (permissions != null) 'Permissions': permissions,
      if (tags != null) 'Tags': tags,
      if (themeArn != null) 'ThemeArn': themeArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses/${Uri.encodeComponent(analysisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnalysisResponse.fromJson(response);
  }

  /// Creates a dashboard from a template. To first create a template, see the
  /// <code> <a>CreateTemplate</a> </code> API operation.
  ///
  /// A dashboard is an entity in QuickSight that identifies QuickSight reports,
  /// created from analyses. You can share QuickSight dashboards. With the right
  /// permissions, you can create scheduled email reports from them. If you have
  /// the correct permissions, you can create a dashboard from a template that
  /// exists in a different AWS account.
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
  /// The entity that you are using as a source when you create the dashboard.
  /// In <code>SourceEntity</code>, you specify the type of object you're using
  /// as source. You can only create a dashboard from a template, so you use a
  /// <code>SourceTemplate</code> entity. If you need to create a dashboard from
  /// an analysis, first convert the analysis to a template by using the
  /// <a>CreateTemplate</a> API operation. For <code>SourceTemplate</code>,
  /// specify the Amazon Resource Name (ARN) of the source template. The
  /// <code>SourceTemplate</code>ARN can contain any AWS Account and any
  /// QuickSight-supported AWS Region.
  ///
  /// Use the <code>DataSetReferences</code> entity within
  /// <code>SourceTemplate</code> to list the replacement datasets for the
  /// placeholders listed in the original. The schema in each dataset must match
  /// its placeholder.
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
  /// visual option to export data to .CSV format isn't enabled when this is set
  /// to <code>DISABLED</code>. This option is <code>ENABLED</code> by default.
  /// </li>
  /// <li>
  /// <code>VisibilityState</code> for <code>SheetControlsOption</code> - This
  /// visibility state can be either <code>COLLAPSED</code> or
  /// <code>EXPANDED</code>. This option is <code>COLLAPSED</code> by default.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// The parameters for the creation of the dashboard, which you want to use to
  /// override the default settings. A dashboard can have any type of
  /// parameters, and some parameters might accept multiple values.
  ///
  /// Parameter [permissions] :
  /// A structure that contains the permissions of the dashboard. You can use
  /// this structure for granting permissions by providing a list of IAM action
  /// information for each principal ARN.
  ///
  /// To specify no permissions, omit the permissions list.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the dashboard.
  ///
  /// Parameter [themeArn] :
  /// The Amazon Resource Name (ARN) of the theme that is being used for this
  /// dashboard. If you add a value for this field, it overrides the value that
  /// is used in the source entity. The theme ARN must exist in the same AWS
  /// account where you create the dashboard.
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
    String themeArn,
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
      if (themeArn != null) 'ThemeArn': themeArn,
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
  /// Parameter [columnLevelPermissionRules] :
  /// A set of one or more definitions of a <code>
  /// <a>ColumnLevelPermissionRule</a> </code>.
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
    List<ColumnLevelPermissionRule> columnLevelPermissionRules,
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
      if (columnLevelPermissionRules != null)
        'ColumnLevelPermissionRules': columnLevelPermissionRules,
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
  /// Amazon Resource Name (ARN). This policy assignment is attached to the
  /// specified groups or users of Amazon QuickSight. Assignment names are
  /// unique per AWS account. To avoid overwriting rules in other namespaces,
  /// use assignment names that are unique.
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
  /// The name of the assignment, also called a rule. It must be unique within
  /// an AWS account.
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
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/iam-ec2-resource-tags/">How
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

  /// (Enterprise edition only) Creates a new namespace for you to use with
  /// Amazon QuickSight.
  ///
  /// A namespace allows you to isolate the QuickSight users and groups that are
  /// registered for that namespace. Users that access the namespace can share
  /// assets only with other users or groups in the same namespace. They can't
  /// see users and groups in other namespaces. You can create a namespace after
  /// your AWS account is subscribed to QuickSight. The namespace must be unique
  /// within the AWS account. By default, there is a limit of 100 namespaces per
  /// AWS account. To increase your limit, create a ticket with AWS Support.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceExistsException].
  /// May throw [PreconditionNotMetException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that you want to create the QuickSight
  /// namespace in.
  ///
  /// Parameter [identityStore] :
  /// Specifies the type of your user identity directory. Currently, this
  /// supports users with an identity type of <code>QUICKSIGHT</code>.
  ///
  /// Parameter [namespace] :
  /// The name that you want to use to describe the new namespace.
  ///
  /// Parameter [tags] :
  /// The tags that you want to associate with the namespace that you're
  /// creating.
  Future<CreateNamespaceResponse> createNamespace({
    @_s.required String awsAccountId,
    @_s.required IdentityStore identityStore,
    @_s.required String namespace,
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
    ArgumentError.checkNotNull(identityStore, 'identityStore');
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
      'IdentityStore': identityStore?.toValue() ?? '',
      'Namespace': namespace,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNamespaceResponse.fromJson(response);
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
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that the group is in. Currently, you use the ID
  /// for the AWS account that contains your Amazon QuickSight account.
  ///
  /// Parameter [sourceEntity] :
  /// The entity that you are using as a source when you create the template. In
  /// <code>SourceEntity</code>, you specify the type of object you're using as
  /// source: <code>SourceTemplate</code> for a template or
  /// <code>SourceAnalysis</code> for an analysis. Both of these require an
  /// Amazon Resource Name (ARN). For <code>SourceTemplate</code>, specify the
  /// ARN of the source template. For <code>SourceAnalysis</code>, specify the
  /// ARN of the source analysis. The <code>SourceTemplate</code> ARN can
  /// contain any AWS Account and any QuickSight-supported AWS Region.
  ///
  /// Use the <code>DataSetReferences</code> entity within
  /// <code>SourceTemplate</code> or <code>SourceAnalysis</code> to list the
  /// replacement datasets for the placeholders listed in the original. The
  /// schema in each dataset must match its placeholder.
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
  /// May throw [ConflictException].
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

  /// Creates a theme.
  ///
  /// A <i>theme</i> is set of configuration options for color and layout.
  /// Themes apply to analyses and dashboards. For more information, see <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/user/themes-in-quicksight.html">Using
  /// Themes in Amazon QuickSight</a> in the <i>Amazon QuickSight User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account where you want to store the new theme.
  ///
  /// Parameter [baseThemeId] :
  /// The ID of the theme that a custom theme will inherit from. All themes
  /// inherit from one of the starting themes defined by Amazon QuickSight. For
  /// a list of the starting themes, use <code>ListThemes</code> or choose
  /// <b>Themes</b> from within a QuickSight analysis.
  ///
  /// Parameter [configuration] :
  /// The theme configuration, which contains the theme display properties.
  ///
  /// Parameter [name] :
  /// A display name for the theme.
  ///
  /// Parameter [themeId] :
  /// An ID for the theme that you want to create. The theme ID is unique per
  /// AWS Region in each AWS account.
  ///
  /// Parameter [permissions] :
  /// A valid grouping of resource permissions to apply to the new theme.
  ///
  /// Parameter [tags] :
  /// A map of the key-value pairs for the resource tag or tags that you want to
  /// add to the resource.
  ///
  /// Parameter [versionDescription] :
  /// A description of the first version of the theme that you're creating.
  /// Every time <code>UpdateTheme</code> is called, a new version is created.
  /// Each version of the theme has a description of the version in the
  /// <code>VersionDescription</code> field.
  Future<CreateThemeResponse> createTheme({
    @_s.required String awsAccountId,
    @_s.required String baseThemeId,
    @_s.required ThemeConfiguration configuration,
    @_s.required String name,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(baseThemeId, 'baseThemeId');
    _s.validateStringLength(
      'baseThemeId',
      baseThemeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baseThemeId',
      baseThemeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(configuration, 'configuration');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'versionDescription',
      versionDescription,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'BaseThemeId': baseThemeId,
      'Configuration': configuration,
      'Name': name,
      if (permissions != null) 'Permissions': permissions,
      if (tags != null) 'Tags': tags,
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThemeResponse.fromJson(response);
  }

  /// Creates a theme alias for a theme.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name that you want to give to the theme alias that you are creating.
  /// The alias name can't begin with a <code>$</code>. Alias names that start
  /// with <code>$</code> are reserved by Amazon QuickSight.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme for the new theme alias.
  ///
  /// Parameter [themeId] :
  /// An ID for the theme alias.
  ///
  /// Parameter [themeVersionNumber] :
  /// The version number of the theme.
  Future<CreateThemeAliasResponse> createThemeAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String themeId,
    @_s.required int themeVersionNumber,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(themeVersionNumber, 'themeVersionNumber');
    _s.validateNumRange(
      'themeVersionNumber',
      themeVersionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ThemeVersionNumber': themeVersionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThemeAliasResponse.fromJson(response);
  }

  /// Deletes all Amazon QuickSight customizations in this AWS Region for the
  /// specified AWS account and QuickSight namespace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that you want to delete QuickSight
  /// customizations from in this AWS Region.
  ///
  /// Parameter [namespace] :
  /// The QuickSight namespace that you're deleting the customizations from.
  Future<DeleteAccountCustomizationResponse> deleteAccountCustomization({
    @_s.required String awsAccountId,
    String namespace,
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    final $query = <String, List<String>>{
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/customizations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAccountCustomizationResponse.fromJson(response);
  }

  /// Deletes an analysis from Amazon QuickSight. You can optionally include a
  /// recovery window during which you can restore the analysis. If you don't
  /// specify a recovery window value, the operation defaults to 30 days.
  /// QuickSight attaches a <code>DeletionTime</code> stamp to the response that
  /// specifies the end of the recovery window. At the end of the recovery
  /// window, QuickSight deletes the analysis permanently.
  ///
  /// At any time before recovery window ends, you can use the
  /// <code>RestoreAnalysis</code> API operation to remove the
  /// <code>DeletionTime</code> stamp and cancel the deletion of the analysis.
  /// The analysis remains visible in the API until it's deleted, so you can
  /// describe it but you can't make a template from it.
  ///
  /// An analysis that's scheduled for deletion isn't accessible in the
  /// QuickSight console. To access it in the console, restore it. Deleting an
  /// analysis doesn't delete the dashboards that you publish from it.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis that you're deleting.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account where you want to delete an analysis.
  ///
  /// Parameter [forceDeleteWithoutRecovery] :
  /// This option defaults to the value
  /// <code>NoForceDeleteWithoutRecovery</code>. To immediately delete the
  /// analysis, add the <code>ForceDeleteWithoutRecovery</code> option. You
  /// can't restore an analysis after it's deleted.
  ///
  /// Parameter [recoveryWindowInDays] :
  /// A value that specifies the number of days that QuickSight waits before it
  /// deletes the analysis. You can't use this parameter with the
  /// <code>ForceDeleteWithoutRecovery</code> option in the same API call. The
  /// default value is 30.
  Future<DeleteAnalysisResponse> deleteAnalysis({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
    bool forceDeleteWithoutRecovery,
    int recoveryWindowInDays,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    _s.validateNumRange(
      'recoveryWindowInDays',
      recoveryWindowInDays,
      7,
      30,
    );
    final $query = <String, List<String>>{
      if (forceDeleteWithoutRecovery != null)
        'force-delete-without-recovery': [
          forceDeleteWithoutRecovery.toString()
        ],
      if (recoveryWindowInDays != null)
        'recovery-window-in-days': [recoveryWindowInDays.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses/${Uri.encodeComponent(analysisId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAnalysisResponse.fromJson(response);
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

  /// Deletes the data source permanently. This operation breaks all the
  /// datasets that reference the deleted data source.
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

  /// Deletes a namespace and the users and groups that are associated with the
  /// namespace. This is an asynchronous process. Assets including dashboards,
  /// analyses, datasets and data sources are not deleted. To delete these
  /// assets, you use the API operations for the relevant asset.
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
  /// The ID for the AWS account that you want to delete the QuickSight
  /// namespace from.
  ///
  /// Parameter [namespace] :
  /// The namespace that you want to delete.
  Future<DeleteNamespaceResponse> deleteNamespace({
    @_s.required String awsAccountId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNamespaceResponse.fromJson(response);
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
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name for the template alias. To delete a specific alias, you delete
  /// the version that the alias points to. You can specify the alias name, or
  /// specify the latest version of the template by providing the keyword
  /// <code>$LATEST</code> in the <code>AliasName</code> parameter.
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

  /// Deletes a theme.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme that you're deleting.
  ///
  /// Parameter [themeId] :
  /// An ID for the theme that you want to delete.
  ///
  /// Parameter [versionNumber] :
  /// The version of the theme that you want to delete.
  ///
  /// <b>Note:</b> If you don't provide a version number, you're using this call
  /// to <code>DeleteTheme</code> to delete all versions of the theme.
  Future<DeleteThemeResponse> deleteTheme({
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThemeResponse.fromJson(response);
  }

  /// Deletes the version of the theme that the specified theme alias points to.
  /// If you provide a specific alias, you delete the version of the theme that
  /// the alias points to.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The unique name for the theme alias to delete.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme alias to delete.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme that the specified alias is for.
  Future<DeleteThemeAliasResponse> deleteThemeAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThemeAliasResponse.fromJson(response);
  }

  /// Deletes the Amazon QuickSight user that is associated with the identity of
  /// the AWS Identity and Access Management (IAM) user or role that's making
  /// the call. The IAM user isn't deleted as a result of this call.
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
  /// May throw [PreconditionNotMetException].
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

  /// Describes the customizations associated with the provided AWS account and
  /// Amazon QuickSight namespace in an AWS Region. The QuickSight console
  /// evaluates which customizations to apply by running this API operation with
  /// the <code>Resolved</code> flag included.
  ///
  /// To determine what customizations display when you run this command, it can
  /// help to visualize the relationship of the entities involved.
  ///
  /// <ul>
  /// <li>
  /// <code>AWS Account</code> - The AWS account exists at the top of the
  /// hierarchy. It has the potential to use all of the AWS Regions and AWS
  /// Services. When you subscribe to QuickSight, you choose one AWS Region to
  /// use as your home Region. That's where your free SPICE capacity is located.
  /// You can use QuickSight in any supported AWS Region.
  /// </li>
  /// <li>
  /// <code>AWS Region</code> - In each AWS Region where you sign in to
  /// QuickSight at least once, QuickSight acts as a separate instance of the
  /// same service. If you have a user directory, it resides in us-east-1, which
  /// is the US East (N. Virginia). Generally speaking, these users have access
  /// to QuickSight in any AWS Region, unless they are constrained to a
  /// namespace.
  ///
  /// To run the command in a different AWS Region, you change your Region
  /// settings. If you're using the AWS CLI, you can use one of the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// Use <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-options.html">command
  /// line options</a>.
  /// </li>
  /// <li>
  /// Use <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html">named
  /// profiles</a>.
  /// </li>
  /// <li>
  /// Run <code>aws configure</code> to change your default AWS Region. Use
  /// Enter to key the same settings for your keys. For more information, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html">Configuring
  /// the AWS CLI</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>Namespace</code> - A QuickSight namespace is a partition that
  /// contains users and assets (data sources, datasets, dashboards, and so on).
  /// To access assets that are in a specific namespace, users and groups must
  /// also be part of the same namespace. People who share a namespace are
  /// completely isolated from users and assets in other namespaces, even if
  /// they are in the same AWS account and AWS Region.
  /// </li>
  /// <li>
  /// <code>Applied customizations</code> - Within an AWS Region, a set of
  /// QuickSight customizations can apply to an AWS account or to a namespace.
  /// Settings that you apply to a namespace override settings that you apply to
  /// an AWS account. All settings are isolated to a single AWS Region. To apply
  /// them in other AWS Regions, run the <code>CreateAccountCustomization</code>
  /// command in each AWS Region where you want to apply the same
  /// customizations.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that you want to describe QuickSight
  /// customizations for.
  ///
  /// Parameter [namespace] :
  /// The QuickSight namespace that you want to describe QuickSight
  /// customizations for.
  ///
  /// Parameter [resolved] :
  /// The <code>Resolved</code> flag works with the other parameters to
  /// determine which view of QuickSight customizations is returned. You can add
  /// this flag to your command to use the same view that QuickSight uses to
  /// identify which customizations to apply to the console. Omit this flag, or
  /// set it to <code>no-resolved</code>, to reveal customizations that are
  /// configured at different levels.
  Future<DescribeAccountCustomizationResponse> describeAccountCustomization({
    @_s.required String awsAccountId,
    String namespace,
    bool resolved,
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    final $query = <String, List<String>>{
      if (namespace != null) 'namespace': [namespace],
      if (resolved != null) 'resolved': [resolved.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/customizations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountCustomizationResponse.fromJson(response);
  }

  /// Describes the settings that were used when your QuickSight subscription
  /// was first created in this AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that contains the settings that you want to
  /// list.
  Future<DescribeAccountSettingsResponse> describeAccountSettings({
    @_s.required String awsAccountId,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountSettingsResponse.fromJson(response);
  }

  /// Provides a summary of the metadata for an analysis.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis that you're describing. The ID is part of the URL
  /// of the analysis.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analysis. You must be using
  /// the AWS account that the analysis is in.
  Future<DescribeAnalysisResponse> describeAnalysis({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses/${Uri.encodeComponent(analysisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnalysisResponse.fromJson(response);
  }

  /// Provides the read and write permissions for an analysis.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis whose permissions you're describing. The ID is part
  /// of the analysis URL.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analysis whose permissions
  /// you're describing. You must be using the AWS account that the analysis is
  /// in.
  Future<DescribeAnalysisPermissionsResponse> describeAnalysisPermissions({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses/${Uri.encodeComponent(analysisId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnalysisPermissionsResponse.fromJson(response);
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
  /// The name of the assignment, also called a rule.
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

  /// Describes the current namespace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that contains the QuickSight namespace that you
  /// want to describe.
  ///
  /// Parameter [namespace] :
  /// The namespace that you want to describe.
  Future<DescribeNamespaceResponse> describeNamespace({
    @_s.required String awsAccountId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces/${Uri.encodeComponent(namespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNamespaceResponse.fromJson(response);
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

  /// Describes a theme.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme that you're describing.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  ///
  /// Parameter [aliasName] :
  /// The alias of the theme that you want to describe. If you name a specific
  /// alias, you describe the version that the alias points to. You can specify
  /// the latest version of the theme by providing the keyword
  /// <code>$LATEST</code> in the <code>AliasName</code> parameter. The keyword
  /// <code>$PUBLISHED</code> doesn't apply to themes.
  ///
  /// Parameter [versionNumber] :
  /// The version number for the version to describe. If a
  /// <code>VersionNumber</code> parameter value isn't provided, the latest
  /// version of the theme is described.
  Future<DescribeThemeResponse> describeTheme({
    @_s.required String awsAccountId,
    @_s.required String themeId,
    String aliasName,
    int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringPattern(
      'awsAccountId',
      awsAccountId,
      r'''^(aws|[0-9]{12})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThemeResponse.fromJson(response);
  }

  /// Describes the alias for a theme.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name of the theme alias that you want to describe.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme alias that you're
  /// describing.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  Future<DescribeThemeAliasResponse> describeThemeAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThemeAliasResponse.fromJson(response);
  }

  /// Describes the read and write permissions for a theme.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme that you're describing.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme that you want to describe permissions for.
  Future<DescribeThemePermissionsResponse> describeThemePermissions({
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThemePermissionsResponse.fromJson(response);
  }

  /// Returns information about a user, given the user name.
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

  /// Generates a session URL and authorization code that you can use to embed
  /// an Amazon QuickSight read-only dashboard in your web server code. Before
  /// you use this command, make sure that you have configured the dashboards
  /// and permissions.
  ///
  /// Currently, you can use <code>GetDashboardEmbedURL</code> only from the
  /// server, not from the user's browser. The following rules apply to the
  /// combination of URL and authorization code:
  ///
  /// <ul>
  /// <li>
  /// They must be used together.
  /// </li>
  /// <li>
  /// They can be used one time only.
  /// </li>
  /// <li>
  /// They are valid for 5 minutes after you run this command.
  /// </li>
  /// <li>
  /// The resulting user session is valid for 10 hours.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/user/embedded-analytics.html">Embedded
  /// Analytics</a> in the <i>Amazon QuickSight User Guide</i>.
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
  /// May throw [UnsupportedPricingPlanException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that contains the dashboard that you're
  /// embedding.
  ///
  /// Parameter [dashboardId] :
  /// The ID for the dashboard, also added to the AWS Identity and Access
  /// Management (IAM) policy.
  ///
  /// Parameter [identityType] :
  /// The authentication method that the user uses to sign in.
  ///
  /// Parameter [additionalDashboardIds] :
  /// A list of one or more dashboard IDs that you want to add to a session that
  /// includes anonymous users. The <code>IdentityType</code> parameter must be
  /// set to <code>ANONYMOUS</code> for this to work, because other identity
  /// types authenticate as QuickSight or IAM users. For example, if you set
  /// "<code>--dashboard-id dash_id1 --dashboard-id dash_id2 dash_id3
  /// identity-type ANONYMOUS</code>", the session can access all three
  /// dashboards.
  ///
  /// Parameter [namespace] :
  /// The QuickSight namespace that contains the dashboard IDs in this request.
  /// If you're not using a custom namespace, set this to
  /// "<code>default</code>".
  ///
  /// Parameter [resetDisabled] :
  /// Remove the reset button on the embedded dashboard. The default is FALSE,
  /// which enables the reset button.
  ///
  /// Parameter [sessionLifetimeInMinutes] :
  /// How many minutes the session is valid. The session lifetime must be 15-600
  /// minutes.
  ///
  /// Parameter [statePersistenceEnabled] :
  /// Adds persistence of state for the user session in an embedded dashboard.
  /// Persistence applies to the sheet and the parameter settings. These are
  /// control settings that the dashboard subscriber (QuickSight reader) chooses
  /// while viewing the dashboard. If this is set to <code>TRUE</code>, the
  /// settings are the same when the subscriber reopens the same dashboard URL.
  /// The state is stored in QuickSight, not in a browser cookie. If this is set
  /// to FALSE, the state of the user session is not persisted. The default is
  /// <code>FALSE</code>.
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
  /// Omit this parameter for users in the third group – IAM users and IAM
  /// role-based sessions.
  Future<GetDashboardEmbedUrlResponse> getDashboardEmbedUrl({
    @_s.required String awsAccountId,
    @_s.required String dashboardId,
    @_s.required EmbeddingIdentityType identityType,
    List<String> additionalDashboardIds,
    String namespace,
    bool resetDisabled,
    int sessionLifetimeInMinutes,
    bool statePersistenceEnabled,
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    _s.validateNumRange(
      'sessionLifetimeInMinutes',
      sessionLifetimeInMinutes,
      15,
      600,
    );
    final $query = <String, List<String>>{
      if (identityType != null) 'creds-type': [identityType.toValue()],
      if (additionalDashboardIds != null)
        'additional-dashboard-ids': additionalDashboardIds,
      if (namespace != null) 'namespace': [namespace],
      if (resetDisabled != null) 'reset-disabled': [resetDisabled.toString()],
      if (sessionLifetimeInMinutes != null)
        'session-lifetime': [sessionLifetimeInMinutes.toString()],
      if (statePersistenceEnabled != null)
        'state-persistence-enabled': [statePersistenceEnabled.toString()],
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

  /// Generates a session URL and authorization code that you can use to embed
  /// the Amazon QuickSight console in your web server code. Use
  /// <code>GetSessionEmbedUrl</code> where you want to provide an authoring
  /// portal that allows users to create data sources, datasets, analyses, and
  /// dashboards. The users who access an embedded QuickSight console need
  /// belong to the author or admin security cohort. If you want to restrict
  /// permissions to some of these features, add a custom permissions profile to
  /// the user with the <code> <a>UpdateUser</a> </code> API operation. Use
  /// <code> <a>RegisterUser</a> </code> API operation to add a new user with a
  /// custom permission profile attached. For more information, see the
  /// following sections in the <i>Amazon QuickSight User Guide</i>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/user/embedding-the-quicksight-console.html">Embedding
  /// the Amazon QuickSight Console</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/quicksight/latest/user/customizing-permissions-to-the-quicksight-console.html">Customizing
  /// Access to the Amazon QuickSight Console</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [QuickSightUserNotFoundException].
  /// May throw [SessionLifetimeInMinutesInvalidException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account associated with your QuickSight subscription.
  ///
  /// Parameter [entryPoint] :
  /// The URL you use to access the embedded session. The entry point URL is
  /// constrained to the following paths:
  ///
  /// <ul>
  /// <li>
  /// <code>/start</code>
  /// </li>
  /// <li>
  /// <code>/start/analyses</code>
  /// </li>
  /// <li>
  /// <code>/start/dashboards</code>
  /// </li>
  /// <li>
  /// <code>/start/favorites</code>
  /// </li>
  /// <li>
  /// <code>/dashboards/<i>DashboardId</i> </code> - where
  /// <code>DashboardId</code> is the actual ID key from the QuickSight console
  /// URL of the dashboard
  /// </li>
  /// <li>
  /// <code>/analyses/<i>AnalysisId</i> </code> - where <code>AnalysisId</code>
  /// is the actual ID key from the QuickSight console URL of the analysis
  /// </li>
  /// </ul>
  ///
  /// Parameter [sessionLifetimeInMinutes] :
  /// How many minutes the session is valid. The session lifetime must be 15-600
  /// minutes.
  ///
  /// Parameter [userArn] :
  /// The Amazon QuickSight user's Amazon Resource Name (ARN), for use with
  /// <code>QUICKSIGHT</code> identity type. You can use this for any type of
  /// Amazon QuickSight users in your account (readers, authors, or admins).
  /// They need to be authenticated as one of the following:
  /// <ol>
  /// <li>
  /// Active Directory (AD) users or group members
  /// </li>
  /// <li>
  /// Invited nonfederated users
  /// </li>
  /// <li>
  /// AWS Identity and Access Management (IAM) users and IAM role-based sessions
  /// authenticated through Federated Single Sign-On using SAML, OpenID Connect,
  /// or IAM federation
  /// </li> </ol>
  /// Omit this parameter for users in the third group, IAM users and IAM
  /// role-based sessions.
  Future<GetSessionEmbedUrlResponse> getSessionEmbedUrl({
    @_s.required String awsAccountId,
    String entryPoint,
    int sessionLifetimeInMinutes,
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
    _s.validateStringLength(
      'entryPoint',
      entryPoint,
      1,
      1000,
    );
    _s.validateNumRange(
      'sessionLifetimeInMinutes',
      sessionLifetimeInMinutes,
      15,
      600,
    );
    final $query = <String, List<String>>{
      if (entryPoint != null) 'entry-point': [entryPoint],
      if (sessionLifetimeInMinutes != null)
        'session-lifetime': [sessionLifetimeInMinutes.toString()],
      if (userArn != null) 'user-arn': [userArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/session-embed-url',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionEmbedUrlResponse.fromJson(response);
  }

  /// Lists Amazon QuickSight analyses that exist in the specified AWS account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analyses.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListAnalysesResponse> listAnalyses({
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
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnalysesResponse.fromJson(response);
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

  /// Lists the namespaces for the specified AWS account.
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
  /// The ID for the AWS account that contains the QuickSight namespaces that
  /// you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<ListNamespacesResponse> listNamespaces({
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
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/namespaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNamespacesResponse.fromJson(response);
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
  /// May throw [InvalidNextTokenException].
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

  /// Lists all the aliases of a theme.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme aliases that you're
  /// listing.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListThemeAliasesResponse> listThemeAliases({
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThemeAliasesResponse.fromJson(response);
  }

  /// Lists all the versions of the themes in the current AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the themes that you're listing.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListThemeVersionsResponse> listThemeVersions({
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThemeVersionsResponse.fromJson(response);
  }

  /// Lists all the themes in the current AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the themes that you're listing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  ///
  /// Parameter [type] :
  /// The type of themes that you want to list. Valid options include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL (default)</code>- Display all existing themes.
  /// </li>
  /// <li>
  /// <code>CUSTOM</code> - Display only the themes created by people using
  /// Amazon QuickSight.
  /// </li>
  /// <li>
  /// <code>QUICKSIGHT</code> - Display only the starting themes defined by
  /// QuickSight.
  /// </li>
  /// </ul>
  Future<ListThemesResponse> listThemes({
    @_s.required String awsAccountId,
    int maxResults,
    String nextToken,
    ThemeType type,
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
      if (type != null) 'type': [type.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/themes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThemesResponse.fromJson(response);
  }

  /// Lists the Amazon QuickSight groups that an Amazon QuickSight user is a
  /// member of.
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
  /// May throw [PreconditionNotMetException].
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
  /// Parameter [customPermissionsName] :
  /// (Enterprise edition only) The name of the custom permissions profile that
  /// you want to assign to this user. Customized permissions allows you to
  /// control a user's access by restricting access the following operations:
  ///
  /// <ul>
  /// <li>
  /// Create and update data sources
  /// </li>
  /// <li>
  /// Create and update datasets
  /// </li>
  /// <li>
  /// Create and update email reports
  /// </li>
  /// <li>
  /// Subscribe to email reports
  /// </li>
  /// </ul>
  /// To add custom permissions to an existing user, use <code>
  /// <a>UpdateUser</a> </code> instead.
  ///
  /// A set of custom permissions includes any combination of these
  /// restrictions. Currently, you need to create the profile names for custom
  /// permission sets by using the QuickSight console. Then, you use the
  /// <code>RegisterUser</code> API operation to assign the named set of
  /// permissions to a QuickSight user.
  ///
  /// QuickSight custom permissions are applied through IAM policies. Therefore,
  /// they override the permissions typically granted by assigning QuickSight
  /// users to one of the default security cohorts in QuickSight (admin, author,
  /// reader).
  ///
  /// This feature is available only to QuickSight Enterprise edition
  /// subscriptions that use SAML 2.0-Based Federation for Single Sign-On (SSO).
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
  /// href="https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role.html">
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
    String customPermissionsName,
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
      'customPermissionsName',
      customPermissionsName,
      1,
      64,
    );
    _s.validateStringPattern(
      'customPermissionsName',
      customPermissionsName,
      r'''^[a-zA-Z0-9+=,.@_-]+$''',
    );
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
      if (customPermissionsName != null)
        'CustomPermissionsName': customPermissionsName,
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

  /// Restores an analysis.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis that you're restoring.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analysis.
  Future<RestoreAnalysisResponse> restoreAnalysis({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/restore/analyses/${Uri.encodeComponent(analysisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RestoreAnalysisResponse.fromJson(response);
  }

  /// Searches for analyses that belong to the user specified in the filter.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analyses that you're searching
  /// for.
  ///
  /// Parameter [filters] :
  /// The structure for the search filters that you want to apply to your
  /// search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token that can be used in a subsequent request.
  Future<SearchAnalysesResponse> searchAnalyses({
    @_s.required String awsAccountId,
    @_s.required List<AnalysisSearchFilter> filters,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/search/analyses',
      exceptionFnMap: _exceptionFns,
    );
    return SearchAnalysesResponse.fromJson(response);
  }

  /// Searches for dashboards that belong to a user.
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
  /// name, for example, <code>"Filters": [ { "Name": "QUICKSIGHT_USER",
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

  /// Updates Amazon QuickSight customizations the current AWS Region.
  /// Currently, the only customization you can use is a theme.
  ///
  /// You can use customizations for your AWS account or, if you specify a
  /// namespace, for a QuickSight namespace instead. Customizations that apply
  /// to a namespace override customizations that apply to an AWS account. To
  /// find out which customizations apply, use the
  /// <code>DescribeAccountCustomization</code> API operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [accountCustomization] :
  /// The QuickSight customizations you're updating in the current AWS Region.
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that you want to update QuickSight
  /// customizations for.
  ///
  /// Parameter [namespace] :
  /// The namespace that you want to update QuickSight customizations for.
  Future<UpdateAccountCustomizationResponse> updateAccountCustomization({
    @_s.required AccountCustomization accountCustomization,
    @_s.required String awsAccountId,
    String namespace,
  }) async {
    ArgumentError.checkNotNull(accountCustomization, 'accountCustomization');
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
    );
    _s.validateStringPattern(
      'namespace',
      namespace,
      r'''^[a-zA-Z0-9._-]*$''',
    );
    final $query = <String, List<String>>{
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'AccountCustomization': accountCustomization,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/customizations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountCustomizationResponse.fromJson(response);
  }

  /// Updates the Amazon QuickSight settings in your AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID for the AWS account that contains the QuickSight settings that you
  /// want to list.
  ///
  /// Parameter [defaultNamespace] :
  /// The default namespace for this AWS account. Currently, the default is
  /// <code>default</code>. AWS Identity and Access Management (IAM) users that
  /// register for the first time with QuickSight provide an email that becomes
  /// associated with the default namespace.
  ///
  /// Parameter [notificationEmail] :
  /// The email address that you want QuickSight to send notifications to
  /// regarding your AWS account or QuickSight subscription.
  Future<UpdateAccountSettingsResponse> updateAccountSettings({
    @_s.required String awsAccountId,
    @_s.required String defaultNamespace,
    String notificationEmail,
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
    ArgumentError.checkNotNull(defaultNamespace, 'defaultNamespace');
    _s.validateStringLength(
      'defaultNamespace',
      defaultNamespace,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'defaultNamespace',
      defaultNamespace,
      r'''^[a-zA-Z0-9._-]*$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DefaultNamespace': defaultNamespace,
      if (notificationEmail != null) 'NotificationEmail': notificationEmail,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountSettingsResponse.fromJson(response);
  }

  /// Updates an analysis in Amazon QuickSight
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID for the analysis that you're updating. This ID displays in the URL
  /// of the analysis.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analysis that you're updating.
  ///
  /// Parameter [name] :
  /// A descriptive name for the analysis that you're updating. This name
  /// displays for the analysis in the QuickSight console.
  ///
  /// Parameter [sourceEntity] :
  /// A source entity to use for the analysis that you're updating. This
  /// metadata structure contains details that describe a source template and
  /// one or more datasets.
  ///
  /// Parameter [parameters] :
  /// The parameter names and override values that you want to use. An analysis
  /// can have any parameter type, and some parameters might accept multiple
  /// values.
  ///
  /// Parameter [themeArn] :
  /// The Amazon Resource Name (ARN) for the theme to apply to the analysis that
  /// you're creating. To see the theme in the QuickSight console, make sure
  /// that you have access to it.
  Future<UpdateAnalysisResponse> updateAnalysis({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
    @_s.required String name,
    @_s.required AnalysisSourceEntity sourceEntity,
    Parameters parameters,
    String themeArn,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    final $payload = <String, dynamic>{
      'Name': name,
      'SourceEntity': sourceEntity,
      if (parameters != null) 'Parameters': parameters,
      if (themeArn != null) 'ThemeArn': themeArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses/${Uri.encodeComponent(analysisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnalysisResponse.fromJson(response);
  }

  /// Updates the read and write permissions for an analysis.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [analysisId] :
  /// The ID of the analysis whose permissions you're updating. The ID is part
  /// of the analysis URL.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the analysis whose permissions
  /// you're updating. You must be using the AWS account that the analysis is
  /// in.
  ///
  /// Parameter [grantPermissions] :
  /// A structure that describes the permissions to add and the principal to add
  /// them to.
  ///
  /// Parameter [revokePermissions] :
  /// A structure that describes the permissions to remove and the principal to
  /// remove them from.
  Future<UpdateAnalysisPermissionsResponse> updateAnalysisPermissions({
    @_s.required String analysisId,
    @_s.required String awsAccountId,
    List<ResourcePermission> grantPermissions,
    List<ResourcePermission> revokePermissions,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analysisId',
      analysisId,
      r'''[\w\-]+''',
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
    final $payload = <String, dynamic>{
      if (grantPermissions != null) 'GrantPermissions': grantPermissions,
      if (revokePermissions != null) 'RevokePermissions': revokePermissions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/analyses/${Uri.encodeComponent(analysisId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnalysisPermissionsResponse.fromJson(response);
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
  /// The entity that you are using as a source when you update the dashboard.
  /// In <code>SourceEntity</code>, you specify the type of object you're using
  /// as source. You can only update a dashboard from a template, so you use a
  /// <code>SourceTemplate</code> entity. If you need to update a dashboard from
  /// an analysis, first convert the analysis to a template by using the
  /// <a>CreateTemplate</a> API operation. For <code>SourceTemplate</code>,
  /// specify the Amazon Resource Name (ARN) of the source template. The
  /// <code>SourceTemplate</code> ARN can contain any AWS Account and any
  /// QuickSight-supported AWS Region.
  ///
  /// Use the <code>DataSetReferences</code> entity within
  /// <code>SourceTemplate</code> to list the replacement datasets for the
  /// placeholders listed in the original. The schema in each dataset must match
  /// its placeholder.
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
  /// visual option to export data to .CSV format isn't enabled when this is set
  /// to <code>DISABLED</code>. This option is <code>ENABLED</code> by default.
  /// </li>
  /// <li>
  /// <code>VisibilityState</code> for <code>SheetControlsOption</code> - This
  /// visibility state can be either <code>COLLAPSED</code> or
  /// <code>EXPANDED</code>. This option is <code>COLLAPSED</code> by default.
  /// </li>
  /// </ul>
  ///
  /// Parameter [parameters] :
  /// A structure that contains the parameters of the dashboard. These are
  /// parameter overrides for a dashboard. A dashboard can have any type of
  /// parameters, and some parameters might accept multiple values.
  ///
  /// Parameter [themeArn] :
  /// The Amazon Resource Name (ARN) of the theme that is being used for this
  /// dashboard. If you add a value for this field, it overrides the value that
  /// was originally associated with the entity. The theme ARN must exist in the
  /// same AWS account where you create the dashboard.
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
    String themeArn,
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
      if (themeArn != null) 'ThemeArn': themeArn,
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
  /// Parameter [columnLevelPermissionRules] :
  /// A set of one or more definitions of a <code>
  /// <a>ColumnLevelPermissionRule</a> </code>.
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
    List<ColumnLevelPermissionRule> columnLevelPermissionRules,
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
      if (columnLevelPermissionRules != null)
        'ColumnLevelPermissionRules': columnLevelPermissionRules,
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
  /// optional parameter or parameters that are specified in the request. This
  /// overwrites all of the users included in <code>Identities</code>.
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
  /// The name of the assignment, also called a rule. This name must be unique
  /// within an AWS account.
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
  /// The entity that you are using as a source when you update the template. In
  /// <code>SourceEntity</code>, you specify the type of object you're using as
  /// source: <code>SourceTemplate</code> for a template or
  /// <code>SourceAnalysis</code> for an analysis. Both of these require an
  /// Amazon Resource Name (ARN). For <code>SourceTemplate</code>, specify the
  /// ARN of the source template. For <code>SourceAnalysis</code>, specify the
  /// ARN of the source analysis. The <code>SourceTemplate</code> ARN can
  /// contain any AWS Account and any QuickSight-supported AWS Region.
  ///
  /// Use the <code>DataSetReferences</code> entity within
  /// <code>SourceTemplate</code> or <code>SourceAnalysis</code> to list the
  /// replacement datasets for the placeholders listed in the original. The
  /// schema in each dataset must match its placeholder.
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
  /// May throw [ConflictException].
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

  /// Updates a theme.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme that you're updating.
  ///
  /// Parameter [baseThemeId] :
  /// The theme ID, defined by Amazon QuickSight, that a custom theme inherits
  /// from. All themes initially inherit from a default QuickSight theme.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  ///
  /// Parameter [configuration] :
  /// The theme configuration, which contains the theme display properties.
  ///
  /// Parameter [name] :
  /// The name for the theme.
  ///
  /// Parameter [versionDescription] :
  /// A description of the theme version that you're updating Every time that
  /// you call <code>UpdateTheme</code>, you create a new version of the theme.
  /// Each version of the theme maintains a description of the version in
  /// <code>VersionDescription</code>.
  Future<UpdateThemeResponse> updateTheme({
    @_s.required String awsAccountId,
    @_s.required String baseThemeId,
    @_s.required String themeId,
    ThemeConfiguration configuration,
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
    ArgumentError.checkNotNull(baseThemeId, 'baseThemeId');
    _s.validateStringLength(
      'baseThemeId',
      baseThemeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'baseThemeId',
      baseThemeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
    );
    _s.validateStringLength(
      'versionDescription',
      versionDescription,
      1,
      512,
    );
    final $payload = <String, dynamic>{
      'BaseThemeId': baseThemeId,
      if (configuration != null) 'Configuration': configuration,
      if (name != null) 'Name': name,
      if (versionDescription != null) 'VersionDescription': versionDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThemeResponse.fromJson(response);
  }

  /// Updates an alias of a theme.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [aliasName] :
  /// The name of the theme alias that you want to update.
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme alias that you're
  /// updating.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  ///
  /// Parameter [themeVersionNumber] :
  /// The version number of the theme that the alias should reference.
  Future<UpdateThemeAliasResponse> updateThemeAlias({
    @_s.required String aliasName,
    @_s.required String awsAccountId,
    @_s.required String themeId,
    @_s.required int themeVersionNumber,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
      r'''[\w\-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(themeVersionNumber, 'themeVersionNumber');
    _s.validateNumRange(
      'themeVersionNumber',
      themeVersionNumber,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ThemeVersionNumber': themeVersionNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/aliases/${Uri.encodeComponent(aliasName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThemeAliasResponse.fromJson(response);
  }

  /// Updates the resource permissions for a theme. Permissions apply to the
  /// action to grant or revoke permissions on, for example
  /// <code>"quicksight:DescribeTheme"</code>.
  ///
  /// Theme permissions apply in groupings. Valid groupings include the
  /// following for the three levels of permissions, which are user, owner, or
  /// no permissions:
  ///
  /// <ul>
  /// <li>
  /// User
  ///
  /// <ul>
  /// <li>
  /// <code>"quicksight:DescribeTheme"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:DescribeThemeAlias"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:ListThemeAliases"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:ListThemeVersions"</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Owner
  ///
  /// <ul>
  /// <li>
  /// <code>"quicksight:DescribeTheme"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:DescribeThemeAlias"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:ListThemeAliases"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:ListThemeVersions"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:DeleteTheme"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:UpdateTheme"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:CreateThemeAlias"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:DeleteThemeAlias"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:UpdateThemeAlias"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:UpdateThemePermissions"</code>
  /// </li>
  /// <li>
  /// <code>"quicksight:DescribeThemePermissions"</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// To specify no permissions, omit the permissions list.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The ID of the AWS account that contains the theme.
  ///
  /// Parameter [themeId] :
  /// The ID for the theme.
  ///
  /// Parameter [grantPermissions] :
  /// A list of resource permissions to be granted for the theme.
  ///
  /// Parameter [revokePermissions] :
  /// A list of resource permissions to be revoked from the theme.
  Future<UpdateThemePermissionsResponse> updateThemePermissions({
    @_s.required String awsAccountId,
    @_s.required String themeId,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'themeId',
      themeId,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/themes/${Uri.encodeComponent(themeId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThemePermissionsResponse.fromJson(response);
  }

  /// Updates an Amazon QuickSight user.
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
  /// The Amazon QuickSight role of the user. The role can be one of the
  /// following default security cohorts:
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
  /// The name of the QuickSight role is invisible to the user except for the
  /// console screens dealing with permissions.
  ///
  /// Parameter [userName] :
  /// The Amazon QuickSight user name that you want to update.
  ///
  /// Parameter [customPermissionsName] :
  /// (Enterprise edition only) The name of the custom permissions profile that
  /// you want to assign to this user. Customized permissions allows you to
  /// control a user's access by restricting access the following operations:
  ///
  /// <ul>
  /// <li>
  /// Create and update data sources
  /// </li>
  /// <li>
  /// Create and update datasets
  /// </li>
  /// <li>
  /// Create and update email reports
  /// </li>
  /// <li>
  /// Subscribe to email reports
  /// </li>
  /// </ul>
  /// A set of custom permissions includes any combination of these
  /// restrictions. Currently, you need to create the profile names for custom
  /// permission sets by using the QuickSight console. Then, you use the
  /// <code>RegisterUser</code> API operation to assign the named set of
  /// permissions to a QuickSight user.
  ///
  /// QuickSight custom permissions are applied through IAM policies. Therefore,
  /// they override the permissions typically granted by assigning QuickSight
  /// users to one of the default security cohorts in QuickSight (admin, author,
  /// reader).
  ///
  /// This feature is available only to QuickSight Enterprise edition
  /// subscriptions that use SAML 2.0-Based Federation for Single Sign-On (SSO).
  ///
  /// Parameter [unapplyCustomPermissions] :
  /// A flag that you use to indicate that you want to remove all custom
  /// permissions from this user. Using this parameter resets the user to the
  /// state it was in before a custom permissions profile was applied. This
  /// parameter defaults to NULL and it doesn't accept any other value.
  Future<UpdateUserResponse> updateUser({
    @_s.required String awsAccountId,
    @_s.required String email,
    @_s.required String namespace,
    @_s.required UserRole role,
    @_s.required String userName,
    String customPermissionsName,
    bool unapplyCustomPermissions,
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
    _s.validateStringLength(
      'customPermissionsName',
      customPermissionsName,
      1,
      64,
    );
    _s.validateStringPattern(
      'customPermissionsName',
      customPermissionsName,
      r'''^[a-zA-Z0-9+=,.@_-]+$''',
    );
    final $payload = <String, dynamic>{
      'Email': email,
      'Role': role?.toValue() ?? '',
      if (customPermissionsName != null)
        'CustomPermissionsName': customPermissionsName,
      if (unapplyCustomPermissions != null)
        'UnapplyCustomPermissions': unapplyCustomPermissions,
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

/// The Amazon QuickSight customizations associated with your AWS account or a
/// QuickSight namespace in a specific AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountCustomization {
  /// The default theme for this QuickSight subscription.
  @_s.JsonKey(name: 'DefaultTheme')
  final String defaultTheme;

  AccountCustomization({
    this.defaultTheme,
  });
  factory AccountCustomization.fromJson(Map<String, dynamic> json) =>
      _$AccountCustomizationFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCustomizationToJson(this);
}

/// The QuickSight settings associated with your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountSettings {
  /// The "account name" you provided for the QuickSight subscription in your AWS
  /// account. You create this name when you sign up for QuickSight. It is unique
  /// in all of AWS and it appears only in the console when users sign in.
  @_s.JsonKey(name: 'AccountName')
  final String accountName;

  /// The default QuickSight namespace for your AWS account.
  @_s.JsonKey(name: 'DefaultNamespace')
  final String defaultNamespace;

  /// The edition of QuickSight that you're currently subscribed to: Enterprise
  /// edition or Standard edition.
  @_s.JsonKey(name: 'Edition')
  final Edition edition;

  /// The main notification email for your QuickSight subscription.
  @_s.JsonKey(name: 'NotificationEmail')
  final String notificationEmail;

  AccountSettings({
    this.accountName,
    this.defaultNamespace,
    this.edition,
    this.notificationEmail,
  });
  factory AccountSettings.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsFromJson(json);
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

/// Metadata structure for an analysis in Amazon QuickSight
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Analysis {
  /// The ID of the analysis.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// The Amazon Resource Name (ARN) of the analysis.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that the analysis was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The ARNs of the datasets of the analysis.
  @_s.JsonKey(name: 'DataSetArns')
  final List<String> dataSetArns;

  /// Errors associated with the analysis.
  @_s.JsonKey(name: 'Errors')
  final List<AnalysisError> errors;

  /// The time that the analysis was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The descriptive name of the analysis.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of the associated sheets with the unique identifier and name of each
  /// sheet.
  @_s.JsonKey(name: 'Sheets')
  final List<Sheet> sheets;

  /// Status associated with the analysis.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The ARN of the theme of the analysis.
  @_s.JsonKey(name: 'ThemeArn')
  final String themeArn;

  Analysis({
    this.analysisId,
    this.arn,
    this.createdTime,
    this.dataSetArns,
    this.errors,
    this.lastUpdatedTime,
    this.name,
    this.sheets,
    this.status,
    this.themeArn,
  });
  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);
}

/// A metadata error structure for an analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnalysisError {
  /// The message associated with the analysis error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The type of the analysis error.
  @_s.JsonKey(name: 'Type')
  final AnalysisErrorType type;

  AnalysisError({
    this.message,
    this.type,
  });
  factory AnalysisError.fromJson(Map<String, dynamic> json) =>
      _$AnalysisErrorFromJson(json);
}

enum AnalysisErrorType {
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('SOURCE_NOT_FOUND')
  sourceNotFound,
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

enum AnalysisFilterAttribute {
  @_s.JsonValue('QUICKSIGHT_USER')
  quicksightUser,
}

/// A filter that you apply when searching for one or more analyses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AnalysisSearchFilter {
  /// The name of the value that you want to use as a filter, for example
  /// <code>"Name": "QUICKSIGHT_USER"</code>.
  @_s.JsonKey(name: 'Name')
  final AnalysisFilterAttribute name;

  /// The comparison operator that you want to use as a filter, for example
  /// <code>"Operator": "StringEquals"</code>.
  @_s.JsonKey(name: 'Operator')
  final FilterOperator operator;

  /// The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that
  /// you want to use as a filter, for example <code>"Value"</code>. An example is
  /// <code>"arn:aws:quicksight:us-east-1:1:user/default/UserName1"</code>.
  @_s.JsonKey(name: 'Value')
  final String value;

  AnalysisSearchFilter({
    this.name,
    this.operator,
    this.value,
  });
  Map<String, dynamic> toJson() => _$AnalysisSearchFilterToJson(this);
}

/// The source entity of an analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AnalysisSourceEntity {
  /// The source template for the source entity of the analysis.
  @_s.JsonKey(name: 'SourceTemplate')
  final AnalysisSourceTemplate sourceTemplate;

  AnalysisSourceEntity({
    this.sourceTemplate,
  });
  Map<String, dynamic> toJson() => _$AnalysisSourceEntityToJson(this);
}

/// The source template of an analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AnalysisSourceTemplate {
  /// The Amazon Resource Name (ARN) of the source template of an analysis.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The dataset references of the source template of an analysis.
  @_s.JsonKey(name: 'DataSetReferences')
  final List<DataSetReference> dataSetReferences;

  AnalysisSourceTemplate({
    @_s.required this.arn,
    @_s.required this.dataSetReferences,
  });
  Map<String, dynamic> toJson() => _$AnalysisSourceTemplateToJson(this);
}

/// The summary metadata that describes an analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnalysisSummary {
  /// The ID of the analysis. This ID displays in the URL.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// The Amazon Resource Name (ARN) for the analysis.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that the analysis was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The time that the analysis was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The name of the analysis. This name is displayed in the QuickSight console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The last known status for the analysis.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  AnalysisSummary({
    this.analysisId,
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.name,
    this.status,
  });
  factory AnalysisSummary.fromJson(Map<String, dynamic> json) =>
      _$AnalysisSummaryFromJson(json);
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

/// The display options for tile borders for visuals.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BorderStyle {
  /// The option to enable display of borders for visuals.
  @_s.JsonKey(name: 'Show')
  final bool show;

  BorderStyle({
    this.show,
  });
  factory BorderStyle.fromJson(Map<String, dynamic> json) =>
      _$BorderStyleFromJson(json);

  Map<String, dynamic> toJson() => _$BorderStyleToJson(this);
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

/// Metadata that contains a description for a column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnDescription {
  /// The text of a description for a column.
  @_s.JsonKey(name: 'Text')
  final String text;

  ColumnDescription({
    this.text,
  });
  factory ColumnDescription.fromJson(Map<String, dynamic> json) =>
      _$ColumnDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnDescriptionToJson(this);
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

/// A rule defined to grant access on one or more restricted columns. Each
/// dataset can have multiple rules. To create a restricted column, you add it
/// to one or more rules. Each rule must contain at least one column and at
/// least one user or group. To be able to see a restricted column, a user or
/// group needs to be added to a rule for that column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnLevelPermissionRule {
  /// An array of column names.
  @_s.JsonKey(name: 'ColumnNames')
  final List<String> columnNames;

  /// An array of Amazon Resource Names (ARNs) for QuickSight users or groups.
  @_s.JsonKey(name: 'Principals')
  final List<String> principals;

  ColumnLevelPermissionRule({
    this.columnNames,
    this.principals,
  });
  factory ColumnLevelPermissionRule.fromJson(Map<String, dynamic> json) =>
      _$ColumnLevelPermissionRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnLevelPermissionRuleToJson(this);
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

/// A tag for a column in a <a>TagColumnOperation</a> structure. This is a
/// variant type structure. For this structure to be valid, only one of the
/// attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnTag {
  /// A description for a column.
  @_s.JsonKey(name: 'ColumnDescription')
  final ColumnDescription columnDescription;

  /// A geospatial role for a column.
  @_s.JsonKey(name: 'ColumnGeographicRole')
  final GeoSpatialDataRole columnGeographicRole;

  ColumnTag({
    this.columnDescription,
    this.columnGeographicRole,
  });
  factory ColumnTag.fromJson(Map<String, dynamic> json) =>
      _$ColumnTagFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnTagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccountCustomizationResponse {
  /// The QuickSight customizations you're adding in the current AWS Region.
  @_s.JsonKey(name: 'AccountCustomization')
  final AccountCustomization accountCustomization;

  /// The Amazon Resource Name (ARN) for the customization that you created for
  /// this AWS account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID for the AWS account that you want to customize QuickSight for.
  @_s.JsonKey(name: 'AwsAccountId')
  final String awsAccountId;

  /// The namespace associated with the customization you're creating.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateAccountCustomizationResponse({
    this.accountCustomization,
    this.arn,
    this.awsAccountId,
    this.namespace,
    this.requestId,
    this.status,
  });
  factory CreateAccountCustomizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateAccountCustomizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAnalysisResponse {
  /// The ID of the analysis.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// The ARN for the analysis.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The status of the creation of the analysis.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateAnalysisResponse({
    this.analysisId,
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
  });
  factory CreateAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAnalysisResponseFromJson(json);
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
  /// The ARN of the dashboard.
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
class CreateNamespaceResponse {
  /// The ARN of the QuickSight namespace you created.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS Region that you want to use for the free SPICE capacity for the new
  /// namespace. This is set to the region that you run CreateNamespace in.
  @_s.JsonKey(name: 'CapacityRegion')
  final String capacityRegion;

  /// The status of the creation of the namespace. This is an asynchronous
  /// process. A status of <code>CREATED</code> means that your namespace is ready
  /// to use. If an error occurs, it indicates if the process is
  /// <code>retryable</code> or <code>non-retryable</code>. In the case of a
  /// non-retryable error, refer to the error message for follow-up tasks.
  @_s.JsonKey(name: 'CreationStatus')
  final NamespaceStatus creationStatus;

  /// Specifies the type of your user identity directory. Currently, this supports
  /// users with an identity type of <code>QUICKSIGHT</code>.
  @_s.JsonKey(name: 'IdentityStore')
  final IdentityStore identityStore;

  /// The name of the new namespace that you created.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  CreateNamespaceResponse({
    this.arn,
    this.capacityRegion,
    this.creationStatus,
    this.identityStore,
    this.name,
    this.requestId,
    this.status,
  });
  factory CreateNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateNamespaceResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThemeAliasResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Information about the theme alias.
  @_s.JsonKey(name: 'ThemeAlias')
  final ThemeAlias themeAlias;

  CreateThemeAliasResponse({
    this.requestId,
    this.status,
    this.themeAlias,
  });
  factory CreateThemeAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThemeAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThemeResponse {
  /// The Amazon Resource Name (ARN) for the theme.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The theme creation status.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The ID of the theme.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  /// The Amazon Resource Name (ARN) for the new theme.
  @_s.JsonKey(name: 'VersionArn')
  final String versionArn;

  CreateThemeResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.themeId,
    this.versionArn,
  });
  factory CreateThemeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThemeResponseFromJson(json);
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

  /// A set of alternate data source parameters that you want to share for these
  /// credentials. The credentials are applied in tandem with the data source
  /// parameters when you copy a data source by using a create or update request.
  /// The API operation compares the <code>DataSourceParameters</code> structure
  /// that's in the request with the structures in the
  /// <code>AlternateDataSourceParameters</code> allow list. If the structures are
  /// an exact match, the request is allowed to use the new data source with the
  /// existing credentials. If the <code>AlternateDataSourceParameters</code> list
  /// is null, the <code>DataSourceParameters</code> originally used with these
  /// <code>Credentials</code> is automatically allowed.
  @_s.JsonKey(name: 'AlternateDataSourceParameters')
  final List<DataSourceParameters> alternateDataSourceParameters;

  CredentialPair({
    @_s.required this.password,
    @_s.required this.username,
    this.alternateDataSourceParameters,
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Dashboard ID.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The last time that this dataset was published.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastPublishedTime')
  final DateTime lastPublishedTime;

  /// The last time that this dataset was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// A display name for the dashboard.
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
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('SOURCE_NOT_FOUND')
  sourceNotFound,
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
  /// The comparison operator that you want to use as a filter, for example,
  /// <code>"Operator": "StringEquals"</code>.
  @_s.JsonKey(name: 'Operator')
  final FilterOperator operator;

  /// The name of the value that you want to use as a filter, for example,
  /// <code>"Name": "QUICKSIGHT_USER"</code>.
  @_s.JsonKey(name: 'Name')
  final DashboardFilterAttribute name;

  /// The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that
  /// you want to use as a filter, for example, <code>"Value":
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Dashboard ID.
  @_s.JsonKey(name: 'DashboardId')
  final String dashboardId;

  /// The last time that this dashboard was published.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastPublishedTime')
  final DateTime lastPublishedTime;

  /// The last time that this dashboard was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The Amazon Resource Numbers (ARNs) for the datasets that are associated with
  /// this version of the dashboard.
  @_s.JsonKey(name: 'DataSetArns')
  final List<String> dataSetArns;

  /// Description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Errors associated with this dashboard version.
  @_s.JsonKey(name: 'Errors')
  final List<DashboardError> errors;

  /// A list of the associated sheets with the unique identifier and name of each
  /// sheet.
  @_s.JsonKey(name: 'Sheets')
  final List<Sheet> sheets;

  /// Source entity ARN.
  @_s.JsonKey(name: 'SourceEntityArn')
  final String sourceEntityArn;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The ARN of the theme associated with a version of the dashboard.
  @_s.JsonKey(name: 'ThemeArn')
  final String themeArn;

  /// Version number for this version of the dashboard.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  DashboardVersion({
    this.arn,
    this.createdTime,
    this.dataSetArns,
    this.description,
    this.errors,
    this.sheets,
    this.sourceEntityArn,
    this.status,
    this.themeArn,
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
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

/// The theme colors that are used for data colors in charts. The colors
/// description is a hexadecimal color code that consists of six alphanumerical
/// characters, prefixed with <code>#</code>, for example #37BFF5.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataColorPalette {
  /// The hexadecimal codes for the colors.
  @_s.JsonKey(name: 'Colors')
  final List<String> colors;

  /// The hexadecimal code of a color that applies to charts where a lack of data
  /// is highlighted.
  @_s.JsonKey(name: 'EmptyFillColor')
  final String emptyFillColor;

  /// The minimum and maximum hexadecimal codes that describe a color gradient.
  @_s.JsonKey(name: 'MinMaxGradient')
  final List<String> minMaxGradient;

  DataColorPalette({
    this.colors,
    this.emptyFillColor,
    this.minMaxGradient,
  });
  factory DataColorPalette.fromJson(Map<String, dynamic> json) =>
      _$DataColorPaletteFromJson(json);

  Map<String, dynamic> toJson() => _$DataColorPaletteToJson(this);
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

  /// A set of one or more definitions of a <code>
  /// <a>ColumnLevelPermissionRule</a> </code>.
  @_s.JsonKey(name: 'ColumnLevelPermissionRules')
  final List<ColumnLevelPermissionRule> columnLevelPermissionRules;

  /// The amount of SPICE capacity used by this dataset. This is 0 if the dataset
  /// isn't imported into SPICE.
  @_s.JsonKey(name: 'ConsumedSpiceCapacityInBytes')
  final int consumedSpiceCapacityInBytes;

  /// The time that this dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The ID of the dataset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// A value that indicates whether you want to import the data into SPICE.
  @_s.JsonKey(name: 'ImportMode')
  final DataSetImportMode importMode;

  /// The last time that this dataset was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
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
    this.columnLevelPermissionRules,
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

  /// A value that indicates if the dataset has column level permission
  /// configured.
  @_s.JsonKey(name: 'ColumnLevelPermissionRulesApplied')
  final bool columnLevelPermissionRulesApplied;

  /// The time that this dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The ID of the dataset.
  @_s.JsonKey(name: 'DataSetId')
  final String dataSetId;

  /// A value that indicates whether you want to import the data into SPICE.
  @_s.JsonKey(name: 'ImportMode')
  final DataSetImportMode importMode;

  /// The last time that this dataset was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The row-level security configuration for the dataset.
  @_s.JsonKey(name: 'RowLevelPermissionDataSet')
  final RowLevelPermissionDataSet rowLevelPermissionDataSet;

  DataSetSummary({
    this.arn,
    this.columnLevelPermissionRulesApplied,
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
  /// A set of alternate data source parameters that you want to share for the
  /// credentials stored with this data source. The credentials are applied in
  /// tandem with the data source parameters when you copy a data source by using
  /// a create or update request. The API operation compares the
  /// <code>DataSourceParameters</code> structure that's in the request with the
  /// structures in the <code>AlternateDataSourceParameters</code> allow list. If
  /// the structures are an exact match, the request is allowed to use the
  /// credentials from this existing data source. If the
  /// <code>AlternateDataSourceParameters</code> list is null, the
  /// <code>Credentials</code> originally used with this
  /// <code>DataSourceParameters</code> are automatically allowed.
  @_s.JsonKey(name: 'AlternateDataSourceParameters')
  final List<DataSourceParameters> alternateDataSourceParameters;

  /// The Amazon Resource Name (ARN) of the data source.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this data source was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
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
    this.alternateDataSourceParameters,
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

/// Data source credentials. This is a variant type structure. For this
/// structure to be valid, only one of the attributes can be non-null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DataSourceCredentials {
  /// The Amazon Resource Name (ARN) of a data source that has the credential pair
  /// that you want to use. When <code>CopySourceArn</code> is not null, the
  /// credential pair from the data source in the ARN is used as the credentials
  /// for the <code>DataSourceCredentials</code> structure.
  @_s.JsonKey(name: 'CopySourceArn')
  final String copySourceArn;

  /// Credential pair. For more information, see <a>CredentialPair</a>.
  @_s.JsonKey(name: 'CredentialPair')
  final CredentialPair credentialPair;

  DataSourceCredentials({
    this.copySourceArn,
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
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('COPY_SOURCE_NOT_FOUND')
  copySourceNotFound,
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

  /// Oracle parameters.
  @_s.JsonKey(name: 'OracleParameters')
  final OracleParameters oracleParameters;

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
    this.oracleParameters,
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
  @_s.JsonValue('ORACLE')
  oracle,
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
  @_s.JsonValue('TIMESTREAM')
  timestream,
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
      case DataSourceType.oracle:
        return 'ORACLE';
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
      case DataSourceType.timestream:
        return 'TIMESTREAM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A date-time parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DateTimeParameter {
  /// A display name for the date-time parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The values for the date-time parameter.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Values')
  final List<DateTime> values;

  DateTimeParameter({
    @_s.required this.name,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$DateTimeParameterToJson(this);
}

/// A decimal parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DecimalParameter {
  /// A display name for the decimal parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The values for the decimal parameter.
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
class DeleteAccountCustomizationResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteAccountCustomizationResponse({
    this.requestId,
    this.status,
  });
  factory DeleteAccountCustomizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAccountCustomizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAnalysisResponse {
  /// The ID of the deleted analysis.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// The Amazon Resource Name (ARN) of the deleted analysis.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the analysis is scheduled to be deleted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletionTime')
  final DateTime deletionTime;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteAnalysisResponse({
    this.analysisId,
    this.arn,
    this.deletionTime,
    this.requestId,
    this.status,
  });
  factory DeleteAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAnalysisResponseFromJson(json);
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
class DeleteNamespaceResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DeleteNamespaceResponse({
    this.requestId,
    this.status,
  });
  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNamespaceResponseFromJson(json);
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

  /// The Amazon Resource Name (ARN) of the template you want to delete.
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
class DeleteThemeAliasResponse {
  /// The name for the theme alias.
  @_s.JsonKey(name: 'AliasName')
  final String aliasName;

  /// The Amazon Resource Name (ARN) of the theme resource using the deleted
  /// alias.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// An ID for the theme associated with the deletion.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  DeleteThemeAliasResponse({
    this.aliasName,
    this.arn,
    this.requestId,
    this.status,
    this.themeId,
  });
  factory DeleteThemeAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThemeAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteThemeResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// An ID for the theme.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  DeleteThemeResponse({
    this.arn,
    this.requestId,
    this.status,
    this.themeId,
  });
  factory DeleteThemeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThemeResponseFromJson(json);
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
class DescribeAccountCustomizationResponse {
  /// The QuickSight customizations that exist in the current AWS Region.
  @_s.JsonKey(name: 'AccountCustomization')
  final AccountCustomization accountCustomization;

  /// The Amazon Resource Name (ARN) of the customization that's associated with
  /// this AWS account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID for the AWS account that you're describing.
  @_s.JsonKey(name: 'AwsAccountId')
  final String awsAccountId;

  /// The QuickSight namespace that you're describing.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeAccountCustomizationResponse({
    this.accountCustomization,
    this.arn,
    this.awsAccountId,
    this.namespace,
    this.requestId,
    this.status,
  });
  factory DescribeAccountCustomizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAccountCustomizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountSettingsResponse {
  /// The QuickSight settings for this AWS account. This information includes the
  /// edition of Amazon QuickSight that you subscribed to (Standard or Enterprise)
  /// and the notification email for the QuickSight subscription. In the
  /// QuickSight console, the QuickSight subscription is sometimes referred to as
  /// a QuickSight "account" even though it's technically not an account by
  /// itself. Instead, it's a subscription to the QuickSight service for your AWS
  /// account. The edition that you subscribe to applies to QuickSight in every
  /// AWS Region where you use it.
  @_s.JsonKey(name: 'AccountSettings')
  final AccountSettings accountSettings;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeAccountSettingsResponse({
    this.accountSettings,
    this.requestId,
    this.status,
  });
  factory DescribeAccountSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccountSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAnalysisPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the analysis whose permissions you're
  /// describing.
  @_s.JsonKey(name: 'AnalysisArn')
  final String analysisArn;

  /// The ID of the analysis whose permissions you're describing.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// A structure that describes the principals and the resource-level permissions
  /// on an analysis.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeAnalysisPermissionsResponse({
    this.analysisArn,
    this.analysisId,
    this.permissions,
    this.requestId,
    this.status,
  });
  factory DescribeAnalysisPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAnalysisPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAnalysisResponse {
  /// A metadata structure that contains summary information for the analysis that
  /// you're describing.
  @_s.JsonKey(name: 'Analysis')
  final Analysis analysis;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeAnalysisResponse({
    this.analysis,
    this.requestId,
    this.status,
  });
  factory DescribeAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAnalysisResponseFromJson(json);
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
class DescribeNamespaceResponse {
  /// The information about the namespace that you're describing. The response
  /// includes the namespace ARN, name, AWS Region, creation status, and identity
  /// store. <code>DescribeNamespace</code> also works for namespaces that are in
  /// the process of being created. For incomplete namespaces, this API operation
  /// lists the namespace error types and messages associated with the creation
  /// process.
  @_s.JsonKey(name: 'Namespace')
  final NamespaceInfoV2 namespace;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  DescribeNamespaceResponse({
    this.namespace,
    this.requestId,
    this.status,
  });
  factory DescribeNamespaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeNamespaceResponseFromJson(json);
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
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The template structure for the object you want to describe.
  @_s.JsonKey(name: 'Template')
  final Template template;

  DescribeTemplateResponse({
    this.requestId,
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
class DescribeThemeAliasResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Information about the theme alias.
  @_s.JsonKey(name: 'ThemeAlias')
  final ThemeAlias themeAlias;

  DescribeThemeAliasResponse({
    this.requestId,
    this.status,
    this.themeAlias,
  });
  factory DescribeThemeAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeThemeAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThemePermissionsResponse {
  /// A list of resource permissions set on the theme.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The Amazon Resource Name (ARN) of the theme.
  @_s.JsonKey(name: 'ThemeArn')
  final String themeArn;

  /// The ID for the theme.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  DescribeThemePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.themeArn,
    this.themeId,
  });
  factory DescribeThemePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeThemePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThemeResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The information about the theme that you are describing.
  @_s.JsonKey(name: 'Theme')
  final Theme theme;

  DescribeThemeResponse({
    this.requestId,
    this.status,
    this.theme,
  });
  factory DescribeThemeResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeThemeResponseFromJson(json);
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

enum Edition {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('ENTERPRISE')
  enterprise,
}

enum EmbeddingIdentityType {
  @_s.JsonValue('IAM')
  iam,
  @_s.JsonValue('QUICKSIGHT')
  quicksight,
  @_s.JsonValue('ANONYMOUS')
  anonymous,
}

extension on EmbeddingIdentityType {
  String toValue() {
    switch (this) {
      case EmbeddingIdentityType.iam:
        return 'IAM';
      case EmbeddingIdentityType.quicksight:
        return 'QUICKSIGHT';
      case EmbeddingIdentityType.anonymous:
        return 'ANONYMOUS';
    }
    throw Exception('Unknown enum value: $this');
  }
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

/// Output returned from the <code>GetDashboardEmbedUrl</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDashboardEmbedUrlResponse {
  /// A single-use URL that you can put into your server-side webpage to embed
  /// your dashboard. This URL is valid for 5 minutes. The API operation provides
  /// the URL with an <code>auth_code</code> value that enables one (and only one)
  /// sign-on to a user session that is valid for 10 hours.
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSessionEmbedUrlResponse {
  /// A single-use URL that you can put into your server-side web page to embed
  /// your QuickSight session. This URL is valid for 5 minutes. The API operation
  /// provides the URL with an <code>auth_code</code> value that enables one (and
  /// only one) sign-on to a user session that is valid for 10 hours.
  @_s.JsonKey(name: 'EmbedUrl')
  final String embedUrl;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  GetSessionEmbedUrlResponse({
    this.embedUrl,
    this.requestId,
    this.status,
  });
  factory GetSessionEmbedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSessionEmbedUrlResponseFromJson(json);
}

/// A <i>group</i> in Amazon QuickSight consists of a set of users. You can use
/// groups to make it easier to manage access and security.
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

/// The display options for gutter spacing between tiles on a sheet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GutterStyle {
  /// This Boolean value controls whether to display a gutter space between sheet
  /// tiles.
  @_s.JsonKey(name: 'Show')
  final bool show;

  GutterStyle({
    this.show,
  });
  factory GutterStyle.fromJson(Map<String, dynamic> json) =>
      _$GutterStyleFromJson(json);

  Map<String, dynamic> toJson() => _$GutterStyleToJson(this);
}

/// An AWS Identity and Access Management (IAM) policy assignment.
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

enum IdentityStore {
  @_s.JsonValue('QUICKSIGHT')
  quicksight,
}

extension on IdentityStore {
  String toValue() {
    switch (this) {
      case IdentityStore.quicksight:
        return 'QUICKSIGHT';
    }
    throw Exception('Unknown enum value: $this');
  }
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
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

/// An integer parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class IntegerParameter {
  /// The name of the integer parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The values for the integer parameter.
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

/// The instructions associated with a join.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JoinInstruction {
  /// The operand on the left side of a join.
  @_s.JsonKey(name: 'LeftOperand')
  final String leftOperand;

  /// The join instructions provided in the <code>ON</code> clause of a join.
  @_s.JsonKey(name: 'OnClause')
  final String onClause;

  /// The operand on the right side of a join.
  @_s.JsonKey(name: 'RightOperand')
  final String rightOperand;

  /// The type of join that it is.
  @_s.JsonKey(name: 'Type')
  final JoinType type;

  /// Join key properties of the left operand.
  @_s.JsonKey(name: 'LeftJoinKeyProperties')
  final JoinKeyProperties leftJoinKeyProperties;

  /// Join key properties of the right operand.
  @_s.JsonKey(name: 'RightJoinKeyProperties')
  final JoinKeyProperties rightJoinKeyProperties;

  JoinInstruction({
    @_s.required this.leftOperand,
    @_s.required this.onClause,
    @_s.required this.rightOperand,
    @_s.required this.type,
    this.leftJoinKeyProperties,
    this.rightJoinKeyProperties,
  });
  factory JoinInstruction.fromJson(Map<String, dynamic> json) =>
      _$JoinInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$JoinInstructionToJson(this);
}

/// Properties associated with the columns participating in a join.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JoinKeyProperties {
  /// A value that indicates that a row in a table is uniquely identified by the
  /// columns in a join key. This is used by QuickSight to optimize query
  /// performance.
  @_s.JsonKey(name: 'UniqueKey')
  final bool uniqueKey;

  JoinKeyProperties({
    this.uniqueKey,
  });
  factory JoinKeyProperties.fromJson(Map<String, dynamic> json) =>
      _$JoinKeyPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$JoinKeyPropertiesToJson(this);
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
class ListAnalysesResponse {
  /// Metadata describing each of the analyses that are listed.
  @_s.JsonKey(name: 'AnalysisSummaryList')
  final List<AnalysisSummary> analysisSummaryList;

  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListAnalysesResponse({
    this.analysisSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListAnalysesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAnalysesResponseFromJson(json);
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
  /// A structure that contains all of the dashboards in your AWS account. This
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
class ListNamespacesResponse {
  /// The information about the namespaces in this AWS account. The response
  /// includes the namespace ARN, name, AWS Region, notification email address,
  /// creation status, and identity store.
  @_s.JsonKey(name: 'Namespaces')
  final List<NamespaceInfoV2> namespaces;

  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  ListNamespacesResponse({
    this.namespaces,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory ListNamespacesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNamespacesResponseFromJson(json);
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
class ListThemeAliasesResponse {
  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// A structure containing the list of the theme's aliases.
  @_s.JsonKey(name: 'ThemeAliasList')
  final List<ThemeAlias> themeAliasList;

  ListThemeAliasesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.themeAliasList,
  });
  factory ListThemeAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThemeAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThemeVersionsResponse {
  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// A structure containing a list of all the versions of the specified theme.
  @_s.JsonKey(name: 'ThemeVersionSummaryList')
  final List<ThemeVersionSummary> themeVersionSummaryList;

  ListThemeVersionsResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.themeVersionSummaryList,
  });
  factory ListThemeVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThemeVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThemesResponse {
  /// The token for the next set of results, or null if there are no more results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Information about the themes in the list.
  @_s.JsonKey(name: 'ThemeSummaryList')
  final List<ThemeSummary> themeSummaryList;

  ListThemesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.themeSummaryList,
  });
  factory ListThemesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThemesResponseFromJson(json);
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

/// The display options for margins around the outside edge of sheets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MarginStyle {
  /// This Boolean value controls whether to display sheet margins.
  @_s.JsonKey(name: 'Show')
  final bool show;

  MarginStyle({
    this.show,
  });
  factory MarginStyle.fromJson(Map<String, dynamic> json) =>
      _$MarginStyleFromJson(json);

  Map<String, dynamic> toJson() => _$MarginStyleToJson(this);
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

/// Errors that occur during namespace creation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NamespaceError {
  /// The message for the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The error type.
  @_s.JsonKey(name: 'Type')
  final NamespaceErrorType type;

  NamespaceError({
    this.message,
    this.type,
  });
  factory NamespaceError.fromJson(Map<String, dynamic> json) =>
      _$NamespaceErrorFromJson(json);
}

enum NamespaceErrorType {
  @_s.JsonValue('PERMISSION_DENIED')
  permissionDenied,
  @_s.JsonValue('INTERNAL_SERVICE_ERROR')
  internalServiceError,
}

/// The error type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NamespaceInfoV2 {
  /// The namespace ARN.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The namespace AWS Region.
  @_s.JsonKey(name: 'CapacityRegion')
  final String capacityRegion;

  /// The creation status of a namespace that is not yet completely created.
  @_s.JsonKey(name: 'CreationStatus')
  final NamespaceStatus creationStatus;

  /// The identity store used for the namespace.
  @_s.JsonKey(name: 'IdentityStore')
  final IdentityStore identityStore;

  /// The name of the error.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An error that occurred when the namespace was created.
  @_s.JsonKey(name: 'NamespaceError')
  final NamespaceError namespaceError;

  NamespaceInfoV2({
    this.arn,
    this.capacityRegion,
    this.creationStatus,
    this.identityStore,
    this.name,
    this.namespaceError,
  });
  factory NamespaceInfoV2.fromJson(Map<String, dynamic> json) =>
      _$NamespaceInfoV2FromJson(json);
}

enum NamespaceStatus {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('RETRYABLE_FAILURE')
  retryableFailure,
  @_s.JsonValue('NON_RETRYABLE_FAILURE')
  nonRetryableFailure,
}

/// Oracle parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OracleParameters {
  /// Database.
  @_s.JsonKey(name: 'Database')
  final String database;

  /// An Oracle host.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// Port.
  @_s.JsonKey(name: 'Port')
  final int port;

  OracleParameters({
    @_s.required this.database,
    @_s.required this.host,
    @_s.required this.port,
  });
  factory OracleParameters.fromJson(Map<String, dynamic> json) =>
      _$OracleParametersFromJson(json);

  Map<String, dynamic> toJson() => _$OracleParametersToJson(this);
}

/// Output column.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputColumn {
  /// A description for a column.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A display name for the dataset.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Type.
  @_s.JsonKey(name: 'Type')
  final ColumnDataType type;

  OutputColumn({
    this.description,
    this.name,
    this.type,
  });
  factory OutputColumn.fromJson(Map<String, dynamic> json) =>
      _$OutputColumnFromJson(json);
}

/// A list of QuickSight parameters and the list's override values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Parameters {
  /// Date-time parameters.
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

  /// The user's user name.
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

  /// The catalog associated with a table.
  @_s.JsonKey(name: 'Catalog')
  final String catalog;

  /// The schema name. This name applies to certain relational database engines.
  @_s.JsonKey(name: 'Schema')
  final String schema;

  RelationalTable({
    @_s.required this.dataSourceArn,
    @_s.required this.inputColumns,
    @_s.required this.name,
    this.catalog,
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
  /// The IAM action to grant or revoke permissions on.
  @_s.JsonKey(name: 'Actions')
  final List<String> actions;

  /// The Amazon Resource Name (ARN) of the principal. This can be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// The ARN of an Amazon QuickSight user or group associated with a data source
  /// or dataset. (This is common.)
  /// </li>
  /// <li>
  /// The ARN of an Amazon QuickSight user, group, or namespace associated with an
  /// analysis, dashboard, template, or theme. (This is common.)
  /// </li>
  /// <li>
  /// The ARN of an AWS account root: This is an IAM ARN rather than a QuickSight
  /// ARN. Use this option only to share resources (templates) across AWS
  /// accounts. (This is less common.)
  /// </li>
  /// </ul>
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
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreAnalysisResponse {
  /// The ID of the analysis that you're restoring.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// The Amazon Resource Name (ARN) of the analysis that you're restoring.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  RestoreAnalysisResponse({
    this.analysisId,
    this.arn,
    this.requestId,
    this.status,
  });
  factory RestoreAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$RestoreAnalysisResponseFromJson(json);
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

  /// The namespace associated with the row-level permissions dataset.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  RowLevelPermissionDataSet({
    @_s.required this.arn,
    @_s.required this.permissionPolicy,
    this.namespace,
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
class SearchAnalysesResponse {
  /// Metadata describing the analyses that you searched for.
  @_s.JsonKey(name: 'AnalysisSummaryList')
  final List<AnalysisSummary> analysisSummaryList;

  /// A pagination token that can be used in a subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  SearchAnalysesResponse({
    this.analysisSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });
  factory SearchAnalysesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAnalysesResponseFromJson(json);
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

/// A <i>sheet</i>, which is an object that contains a set of visuals that are
/// viewed together on one page in the Amazon QuickSight console. Every analysis
/// and dashboard contains at least one sheet. Each sheet contains at least one
/// visualization widget, for example a chart, pivot table, or narrative
/// insight. Sheets can be associated with other components, such as controls,
/// filters, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Sheet {
  /// The name of a sheet. This name is displayed on the sheet's tab in the
  /// QuickSight console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier associated with a sheet.
  @_s.JsonKey(name: 'SheetId')
  final String sheetId;

  Sheet({
    this.name,
    this.sheetId,
  });
  factory Sheet.fromJson(Map<String, dynamic> json) => _$SheetFromJson(json);
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

/// The theme display options for sheets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SheetStyle {
  /// The display options for tiles.
  @_s.JsonKey(name: 'Tile')
  final TileStyle tile;

  /// The layout options for tiles.
  @_s.JsonKey(name: 'TileLayout')
  final TileLayoutStyle tileLayout;

  SheetStyle({
    this.tile,
    this.tileLayout,
  });
  factory SheetStyle.fromJson(Map<String, dynamic> json) =>
      _$SheetStyleFromJson(json);

  Map<String, dynamic> toJson() => _$SheetStyleToJson(this);
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

/// A string parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StringParameter {
  /// A display name for a string parameter.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The values of a string parameter.
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
/// placeholders to replace the dataset associated with an analysis. You can use
/// templates to create dashboards by replacing dataset placeholders with
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Time when this was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
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
  @_s.JsonValue('SOURCE_NOT_FOUND')
  sourceNotFound,
  @_s.JsonValue('DATA_SET_NOT_FOUND')
  dataSetNotFound,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The last time that this template was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
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
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// Schema of the dataset identified by the placeholder. Any dashboard created
  /// from this template should be bound to new datasets matching the same schema
  /// described through this API operation.
  @_s.JsonKey(name: 'DataSetConfigurations')
  final List<DataSetConfiguration> dataSetConfigurations;

  /// The description of the template.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Errors associated with this template version.
  @_s.JsonKey(name: 'Errors')
  final List<TemplateError> errors;

  /// A list of the associated sheets with the unique identifier and name of each
  /// sheet.
  @_s.JsonKey(name: 'Sheets')
  final List<Sheet> sheets;

  /// The Amazon Resource Name (ARN) of an analysis or template that was used to
  /// create this template.
  @_s.JsonKey(name: 'SourceEntityArn')
  final String sourceEntityArn;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The ARN of the theme associated with this version of the template.
  @_s.JsonKey(name: 'ThemeArn')
  final String themeArn;

  /// The version number of the template version.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  TemplateVersion({
    this.createdTime,
    this.dataSetConfigurations,
    this.description,
    this.errors,
    this.sheets,
    this.sourceEntityArn,
    this.status,
    this.themeArn,
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
  /// The Amazon Resource Name (ARN) of the template version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time that this template version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
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

/// Summary information about a theme.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Theme {
  /// The Amazon Resource Name (ARN) of the theme.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the theme was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The date and time that the theme was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The name that the user gives to the theme.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The identifier that the user gives to the theme.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  /// The type of theme, based on how it was created. Valid values include:
  /// <code>QUICKSIGHT</code> and <code>CUSTOM</code>.
  @_s.JsonKey(name: 'Type')
  final ThemeType type;
  @_s.JsonKey(name: 'Version')
  final ThemeVersion version;

  Theme({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.name,
    this.themeId,
    this.type,
    this.version,
  });
  factory Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);
}

/// An alias for a theme.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThemeAlias {
  /// The display name of the theme alias.
  @_s.JsonKey(name: 'AliasName')
  final String aliasName;

  /// The Amazon Resource Name (ARN) of the theme alias.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The version number of the theme alias.
  @_s.JsonKey(name: 'ThemeVersionNumber')
  final int themeVersionNumber;

  ThemeAlias({
    this.aliasName,
    this.arn,
    this.themeVersionNumber,
  });
  factory ThemeAlias.fromJson(Map<String, dynamic> json) =>
      _$ThemeAliasFromJson(json);
}

/// The theme configuration. This configuration contains all of the display
/// properties for a theme.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThemeConfiguration {
  /// Color properties that apply to chart data colors.
  @_s.JsonKey(name: 'DataColorPalette')
  final DataColorPalette dataColorPalette;

  /// Display options related to sheets.
  @_s.JsonKey(name: 'Sheet')
  final SheetStyle sheet;

  /// Color properties that apply to the UI and to charts, excluding the colors
  /// that apply to data.
  @_s.JsonKey(name: 'UIColorPalette')
  final UIColorPalette uIColorPalette;

  ThemeConfiguration({
    this.dataColorPalette,
    this.sheet,
    this.uIColorPalette,
  });
  factory ThemeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ThemeConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeConfigurationToJson(this);
}

/// Theme error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThemeError {
  /// The error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The type of error.
  @_s.JsonKey(name: 'Type')
  final ThemeErrorType type;

  ThemeError({
    this.message,
    this.type,
  });
  factory ThemeError.fromJson(Map<String, dynamic> json) =>
      _$ThemeErrorFromJson(json);
}

enum ThemeErrorType {
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
}

/// The theme summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThemeSummary {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that this theme was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The last date and time that this theme was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The latest version number for the theme.
  @_s.JsonKey(name: 'LatestVersionNumber')
  final int latestVersionNumber;

  /// the display name for the theme.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the theme. This ID is unique per AWS Region for each AWS account.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  ThemeSummary({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.latestVersionNumber,
    this.name,
    this.themeId,
  });
  factory ThemeSummary.fromJson(Map<String, dynamic> json) =>
      _$ThemeSummaryFromJson(json);
}

enum ThemeType {
  @_s.JsonValue('QUICKSIGHT')
  quicksight,
  @_s.JsonValue('CUSTOM')
  custom,
  @_s.JsonValue('ALL')
  all,
}

extension on ThemeType {
  String toValue() {
    switch (this) {
      case ThemeType.quicksight:
        return 'QUICKSIGHT';
      case ThemeType.custom:
        return 'CUSTOM';
      case ThemeType.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A version of a theme.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThemeVersion {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The Amazon QuickSight-defined ID of the theme that a custom theme inherits
  /// from. All themes initially inherit from a default QuickSight theme.
  @_s.JsonKey(name: 'BaseThemeId')
  final String baseThemeId;

  /// The theme configuration, which contains all the theme display properties.
  @_s.JsonKey(name: 'Configuration')
  final ThemeConfiguration configuration;

  /// The date and time that this theme version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the theme.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Errors associated with the theme.
  @_s.JsonKey(name: 'Errors')
  final List<ThemeError> errors;

  /// The status of the theme version.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The version number of the theme.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  ThemeVersion({
    this.arn,
    this.baseThemeId,
    this.configuration,
    this.createdTime,
    this.description,
    this.errors,
    this.status,
    this.versionNumber,
  });
  factory ThemeVersion.fromJson(Map<String, dynamic> json) =>
      _$ThemeVersionFromJson(json);
}

/// The theme version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThemeVersionSummary {
  /// The Amazon Resource Name (ARN) of the theme version.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that this theme version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The description of the theme version.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The status of the theme version.
  @_s.JsonKey(name: 'Status')
  final ResourceStatus status;

  /// The version number of the theme version.
  @_s.JsonKey(name: 'VersionNumber')
  final int versionNumber;

  ThemeVersionSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.status,
    this.versionNumber,
  });
  factory ThemeVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$ThemeVersionSummaryFromJson(json);
}

/// The display options for the layout of tiles on a sheet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TileLayoutStyle {
  /// The gutter settings that apply between tiles.
  @_s.JsonKey(name: 'Gutter')
  final GutterStyle gutter;

  /// The margin settings that apply around the outside edge of sheets.
  @_s.JsonKey(name: 'Margin')
  final MarginStyle margin;

  TileLayoutStyle({
    this.gutter,
    this.margin,
  });
  factory TileLayoutStyle.fromJson(Map<String, dynamic> json) =>
      _$TileLayoutStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TileLayoutStyleToJson(this);
}

/// Display options related to tiles on a sheet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TileStyle {
  /// The border around a tile.
  @_s.JsonKey(name: 'Border')
  final BorderStyle border;

  TileStyle({
    this.border,
  });
  factory TileStyle.fromJson(Map<String, dynamic> json) =>
      _$TileStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TileStyleToJson(this);
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

/// The theme colors that apply to UI and to charts, excluding data colors. The
/// colors description is a hexadecimal color code that consists of six
/// alphanumerical characters, prefixed with <code>#</code>, for example
/// #37BFF5. For more information, see <a
/// href="https://docs.aws.amazon.com/quicksight/latest/user/themes-in-quicksight.html">Using
/// Themes in Amazon QuickSight</a> in the <i>Amazon QuickSight User Guide.</i>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UIColorPalette {
  /// This color is that applies to selected states and buttons.
  @_s.JsonKey(name: 'Accent')
  final String accent;

  /// The foreground color that applies to any text or other elements that appear
  /// over the accent color.
  @_s.JsonKey(name: 'AccentForeground')
  final String accentForeground;

  /// The color that applies to error messages.
  @_s.JsonKey(name: 'Danger')
  final String danger;

  /// The foreground color that applies to any text or other elements that appear
  /// over the error color.
  @_s.JsonKey(name: 'DangerForeground')
  final String dangerForeground;

  /// The color that applies to the names of fields that are identified as
  /// dimensions.
  @_s.JsonKey(name: 'Dimension')
  final String dimension;

  /// The foreground color that applies to any text or other elements that appear
  /// over the dimension color.
  @_s.JsonKey(name: 'DimensionForeground')
  final String dimensionForeground;

  /// The color that applies to the names of fields that are identified as
  /// measures.
  @_s.JsonKey(name: 'Measure')
  final String measure;

  /// The foreground color that applies to any text or other elements that appear
  /// over the measure color.
  @_s.JsonKey(name: 'MeasureForeground')
  final String measureForeground;

  /// The background color that applies to visuals and other high emphasis UI.
  @_s.JsonKey(name: 'PrimaryBackground')
  final String primaryBackground;

  /// The color of text and other foreground elements that appear over the primary
  /// background regions, such as grid lines, borders, table banding, icons, and
  /// so on.
  @_s.JsonKey(name: 'PrimaryForeground')
  final String primaryForeground;

  /// The background color that applies to the sheet background and sheet
  /// controls.
  @_s.JsonKey(name: 'SecondaryBackground')
  final String secondaryBackground;

  /// The foreground color that applies to any sheet title, sheet control text, or
  /// UI that appears over the secondary background.
  @_s.JsonKey(name: 'SecondaryForeground')
  final String secondaryForeground;

  /// The color that applies to success messages, for example the check mark for a
  /// successful download.
  @_s.JsonKey(name: 'Success')
  final String success;

  /// The foreground color that applies to any text or other elements that appear
  /// over the success color.
  @_s.JsonKey(name: 'SuccessForeground')
  final String successForeground;

  /// This color that applies to warning and informational messages.
  @_s.JsonKey(name: 'Warning')
  final String warning;

  /// The foreground color that applies to any text or other elements that appear
  /// over the warning color.
  @_s.JsonKey(name: 'WarningForeground')
  final String warningForeground;

  UIColorPalette({
    this.accent,
    this.accentForeground,
    this.danger,
    this.dangerForeground,
    this.dimension,
    this.dimensionForeground,
    this.measure,
    this.measureForeground,
    this.primaryBackground,
    this.primaryForeground,
    this.secondaryBackground,
    this.secondaryForeground,
    this.success,
    this.successForeground,
    this.warning,
    this.warningForeground,
  });
  factory UIColorPalette.fromJson(Map<String, dynamic> json) =>
      _$UIColorPaletteFromJson(json);

  Map<String, dynamic> toJson() => _$UIColorPaletteToJson(this);
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
class UpdateAccountCustomizationResponse {
  /// The QuickSight customizations you're updating in the current AWS Region.
  @_s.JsonKey(name: 'AccountCustomization')
  final AccountCustomization accountCustomization;

  /// The Amazon Resource Name (ARN) for the updated customization for this AWS
  /// account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The ID for the AWS account that you want to update QuickSight customizations
  /// for.
  @_s.JsonKey(name: 'AwsAccountId')
  final String awsAccountId;

  /// The namespace associated with the customization that you're updating.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateAccountCustomizationResponse({
    this.accountCustomization,
    this.arn,
    this.awsAccountId,
    this.namespace,
    this.requestId,
    this.status,
  });
  factory UpdateAccountCustomizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAccountCustomizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAccountSettingsResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateAccountSettingsResponse({
    this.requestId,
    this.status,
  });
  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAnalysisPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the analysis that you updated.
  @_s.JsonKey(name: 'AnalysisArn')
  final String analysisArn;

  /// The ID of the analysis that you updated permissions for.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// A structure that describes the principals and the resource-level permissions
  /// on an analysis.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  UpdateAnalysisPermissionsResponse({
    this.analysisArn,
    this.analysisId,
    this.permissions,
    this.requestId,
    this.status,
  });
  factory UpdateAnalysisPermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAnalysisPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAnalysisResponse {
  /// The ID of the analysis.
  @_s.JsonKey(name: 'AnalysisId')
  final String analysisId;

  /// The ARN of the analysis that you're updating.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The update status of the last update that was made to the analysis.
  @_s.JsonKey(name: 'UpdateStatus')
  final ResourceStatus updateStatus;

  UpdateAnalysisResponse({
    this.analysisId,
    this.arn,
    this.requestId,
    this.status,
    this.updateStatus,
  });
  factory UpdateAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAnalysisResponseFromJson(json);
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

  /// The name of the assignment or rule.
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
class UpdateThemeAliasResponse {
  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// Information about the theme alias.
  @_s.JsonKey(name: 'ThemeAlias')
  final ThemeAlias themeAlias;

  UpdateThemeAliasResponse({
    this.requestId,
    this.status,
    this.themeAlias,
  });
  factory UpdateThemeAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThemeAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThemePermissionsResponse {
  /// The resulting list of resource permissions for the theme.
  @_s.JsonKey(name: 'Permissions')
  final List<ResourcePermission> permissions;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The Amazon Resource Name (ARN) of the theme.
  @_s.JsonKey(name: 'ThemeArn')
  final String themeArn;

  /// The ID for the theme.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  UpdateThemePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.themeArn,
    this.themeId,
  });
  factory UpdateThemePermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThemePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThemeResponse {
  /// The Amazon Resource Name (ARN) for the theme.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The creation status of the theme.
  @_s.JsonKey(name: 'CreationStatus')
  final ResourceStatus creationStatus;

  /// The AWS request ID for this operation.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// The HTTP status of the request.
  @_s.JsonKey(name: 'Status')
  final int status;

  /// The ID for the theme.
  @_s.JsonKey(name: 'ThemeId')
  final String themeId;

  /// The Amazon Resource Name (ARN) for the new version of the theme.
  @_s.JsonKey(name: 'VersionArn')
  final String versionArn;

  UpdateThemeResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.themeId,
    this.versionArn,
  });
  factory UpdateThemeResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThemeResponseFromJson(json);
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

/// A registered user of Amazon QuickSight.
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

  /// The custom permissions profile associated with this user.
  @_s.JsonKey(name: 'CustomPermissionsName')
  final String customPermissionsName;

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
    this.customPermissionsName,
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

class UnsupportedPricingPlanException extends _s.GenericAwsException {
  UnsupportedPricingPlanException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedPricingPlanException',
            message: message);
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
  'UnsupportedPricingPlanException': (type, message) =>
      UnsupportedPricingPlanException(type: type, message: message),
  'UnsupportedUserEditionException': (type, message) =>
      UnsupportedUserEditionException(type: type, message: message),
};
