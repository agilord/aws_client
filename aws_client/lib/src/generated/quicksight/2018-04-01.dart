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

/// Amazon QuickSight is a fully managed, serverless business intelligence
/// service for the AWS Cloud that makes it easy to extend data and insights to
/// every user in your organization. This API reference contains documentation
/// for a programming interface that you can use to manage Amazon QuickSight.
class QuickSight {
  final _s.RestJsonProtocol _protocol;
  QuickSight({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String awsAccountId,
    required String dataSetId,
    required String ingestionId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required AccountCustomization accountCustomization,
    required String awsAccountId,
    String? namespace,
    List<Tag>? tags,
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String analysisId,
    required String awsAccountId,
    required String name,
    required AnalysisSourceEntity sourceEntity,
    Parameters? parameters,
    List<ResourcePermission>? permissions,
    List<Tag>? tags,
    String? themeArn,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
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
    required String awsAccountId,
    required String dashboardId,
    required String name,
    required DashboardSourceEntity sourceEntity,
    DashboardPublishOptions? dashboardPublishOptions,
    Parameters? parameters,
    List<ResourcePermission>? permissions,
    List<Tag>? tags,
    String? themeArn,
    String? versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
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
  /// Parameter [fieldFolders] :
  /// The folder that contains fields and nested subfolders for your dataset.
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
    required String awsAccountId,
    required String dataSetId,
    required DataSetImportMode importMode,
    required String name,
    required Map<String, PhysicalTable> physicalTableMap,
    List<ColumnGroup>? columnGroups,
    List<ColumnLevelPermissionRule>? columnLevelPermissionRules,
    Map<String, FieldFolder>? fieldFolders,
    Map<String, LogicalTable>? logicalTableMap,
    List<ResourcePermission>? permissions,
    RowLevelPermissionDataSet? rowLevelPermissionDataSet,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
      'ImportMode': importMode.toValue(),
      'Name': name,
      'PhysicalTableMap': physicalTableMap,
      if (columnGroups != null) 'ColumnGroups': columnGroups,
      if (columnLevelPermissionRules != null)
        'ColumnLevelPermissionRules': columnLevelPermissionRules,
      if (fieldFolders != null) 'FieldFolders': fieldFolders,
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
  /// operation are: <code>ATHENA, AURORA, AURORA_POSTGRESQL,
  /// AMAZON_ELASTICSEARCH, MARIADB, MYSQL, POSTGRESQL, PRESTO, REDSHIFT, S3,
  /// SNOWFLAKE, SPARK, SQLSERVER, TERADATA</code>. Use
  /// <code>ListDataSources</code> to return a list of all data sources.
  ///
  /// <code>AMAZON_ELASTICSEARCH</code> is for Amazon managed Elasticsearch
  /// Service.
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
    required String awsAccountId,
    required String dataSourceId,
    required String name,
    required DataSourceType type,
    DataSourceCredentials? credentials,
    DataSourceParameters? dataSourceParameters,
    List<ResourcePermission>? permissions,
    SslProperties? sslProperties,
    List<Tag>? tags,
    VpcConnectionProperties? vpcConnectionProperties,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
      'Type': type.toValue(),
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

  /// Creates an empty shared folder.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceExistsException].
  /// May throw [ConflictException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS Account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  ///
  /// Parameter [folderType] :
  /// The type of folder. By default, <code>folderType</code> is
  /// <code>SHARED</code>.
  ///
  /// Parameter [name] :
  /// The name of the folder.
  ///
  /// Parameter [parentFolderArn] :
  /// The Amazon Resource Name (ARN) for the parent folder.
  ///
  /// <code>ParentFolderArn</code> can be null. An empty
  /// <code>parentFolderArn</code> creates a root-level folder.
  ///
  /// Parameter [permissions] :
  /// A structure that describes the principals and the resource-level
  /// permissions of a folder.
  ///
  /// To specify no permissions, omit <code>Permissions</code>.
  ///
  /// Parameter [tags] :
  /// Tags for the folder.
  Future<CreateFolderResponse> createFolder({
    required String awsAccountId,
    required String folderId,
    FolderType? folderType,
    String? name,
    String? parentFolderArn,
    List<ResourcePermission>? permissions,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (folderType != null) 'FolderType': folderType.toValue(),
      if (name != null) 'Name': name,
      if (parentFolderArn != null) 'ParentFolderArn': parentFolderArn,
      if (permissions != null) 'Permissions': permissions,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFolderResponse.fromJson(response);
  }

  /// Adds an asset, such as a dashboard, analysis, or dataset into a folder.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceExistsException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS Account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  ///
  /// Parameter [memberId] :
  /// The ID of the asset (the dashboard, analysis, or dataset).
  ///
  /// Parameter [memberType] :
  /// The type of the member, including <code>DASHBOARD</code>,
  /// <code>ANALYSIS</code>, and <code>DATASET</code>.
  Future<CreateFolderMembershipResponse> createFolderMembership({
    required String awsAccountId,
    required String folderId,
    required String memberId,
    required MemberType memberType,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberType, 'memberType');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}/members/${Uri.encodeComponent(memberType.toValue())}/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFolderMembershipResponse.fromJson(response);
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
    required String awsAccountId,
    required String groupName,
    required String namespace,
    String? description,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required String groupName,
    required String memberName,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(memberName, 'memberName');
    _s.validateStringLength(
      'memberName',
      memberName,
      1,
      256,
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
    required String assignmentName,
    required AssignmentStatus assignmentStatus,
    required String awsAccountId,
    required String namespace,
    Map<String, List<String>>? identities,
    String? policyArn,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'AssignmentName': assignmentName,
      'AssignmentStatus': assignmentStatus.toValue(),
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
    required String awsAccountId,
    required String dataSetId,
    required String ingestionId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required IdentityStore identityStore,
    required String namespace,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    final $payload = <String, dynamic>{
      'IdentityStore': identityStore.toValue(),
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
    required String awsAccountId,
    required TemplateSourceEntity sourceEntity,
    required String templateId,
    String? name,
    List<ResourcePermission>? permissions,
    List<Tag>? tags,
    String? versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String aliasName,
    required String awsAccountId,
    required String templateId,
    required int templateVersionNumber,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
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
    required String awsAccountId,
    required String baseThemeId,
    required ThemeConfiguration configuration,
    required String name,
    required String themeId,
    List<ResourcePermission>? permissions,
    List<Tag>? tags,
    String? versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String aliasName,
    required String awsAccountId,
    required String themeId,
    required int themeVersionNumber,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
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
    required String awsAccountId,
    String? namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String analysisId,
    required String awsAccountId,
    bool? forceDeleteWithoutRecovery,
    int? recoveryWindowInDays,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    required String awsAccountId,
    required String dashboardId,
    int? versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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

  /// Deletes an empty folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [PreconditionNotMetException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS Account ID for the folder.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  Future<DeleteFolderResponse> deleteFolder({
    required String awsAccountId,
    required String folderId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFolderResponse.fromJson(response);
  }

  /// Removes an asset, such as a dashboard, analysis, or dataset, from a
  /// folder.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS Account ID.
  ///
  /// Parameter [folderId] :
  /// The Folder ID.
  ///
  /// Parameter [memberId] :
  /// The ID of the asset (the dashboard, analysis, or dataset) that you want to
  /// delete.
  ///
  /// Parameter [memberType] :
  /// The type of the member, including <code>DASHBOARD</code>,
  /// <code>ANALYSIS</code>, and <code>DATASET</code>
  Future<DeleteFolderMembershipResponse> deleteFolderMembership({
    required String awsAccountId,
    required String folderId,
    required String memberId,
    required MemberType memberType,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberType, 'memberType');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}/members/${Uri.encodeComponent(memberType.toValue())}/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFolderMembershipResponse.fromJson(response);
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
    required String awsAccountId,
    required String groupName,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required String groupName,
    required String memberName,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(memberName, 'memberName');
    _s.validateStringLength(
      'memberName',
      memberName,
      1,
      256,
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
    required String assignmentName,
    required String awsAccountId,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String templateId,
    int? versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String aliasName,
    required String awsAccountId,
    required String templateId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
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
    required String awsAccountId,
    required String themeId,
    int? versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String aliasName,
    required String awsAccountId,
    required String themeId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
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
    required String awsAccountId,
    required String namespace,
    required String userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
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
    required String awsAccountId,
    required String namespace,
    required String principalId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    String? namespace,
    bool? resolved,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String analysisId,
    required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    required String analysisId,
    required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    required String awsAccountId,
    required String dashboardId,
    String? aliasName,
    int? versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    required String awsAccountId,
    required String dashboardId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSetId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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

  /// Describes a folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  Future<DescribeFolderResponse> describeFolder({
    required String awsAccountId,
    required String folderId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFolderResponse.fromJson(response);
  }

  /// Describes permissions for a folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS Account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  Future<DescribeFolderPermissionsResponse> describeFolderPermissions({
    required String awsAccountId,
    required String folderId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFolderPermissionsResponse.fromJson(response);
  }

  /// Describes the folder resolved permissions. Permissions consists of both
  /// folder direct permissions and the inherited permissions from the ancestor
  /// folders.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  Future<DescribeFolderResolvedPermissionsResponse>
      describeFolderResolvedPermissions({
    required String awsAccountId,
    required String folderId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}/resolved-permissions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFolderResolvedPermissionsResponse.fromJson(response);
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
    required String awsAccountId,
    required String groupName,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String assignmentName,
    required String awsAccountId,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required String dataSetId,
    required String ingestionId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String namespace,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String templateId,
    String? aliasName,
    int? versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    required String aliasName,
    required String awsAccountId,
    required String templateId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
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
    required String awsAccountId,
    required String templateId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String themeId,
    String? aliasName,
    int? versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    required String aliasName,
    required String awsAccountId,
    required String themeId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
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
    required String awsAccountId,
    required String themeId,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String namespace,
    required String userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
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
    required String awsAccountId,
    required String dashboardId,
    required EmbeddingIdentityType identityType,
    List<String>? additionalDashboardIds,
    String? namespace,
    bool? resetDisabled,
    int? sessionLifetimeInMinutes,
    bool? statePersistenceEnabled,
    bool? undoRedoDisabled,
    String? userArn,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(identityType, 'identityType');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
    );
    _s.validateNumRange(
      'sessionLifetimeInMinutes',
      sessionLifetimeInMinutes,
      15,
      600,
    );
    final $query = <String, List<String>>{
      'creds-type': [identityType.toValue()],
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
    required String awsAccountId,
    String? entryPoint,
    int? sessionLifetimeInMinutes,
    String? userArn,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dashboardId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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

  /// List all assets (<code>DASHBOARD</code>, <code>ANALYSIS</code>, and
  /// <code>DATASET</code>) in a folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<ListFolderMembersResponse> listFolderMembers({
    required String awsAccountId,
    required String folderId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFolderMembersResponse.fromJson(response);
  }

  /// Lists all folders in an account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
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
  Future<ListFoldersResponse> listFolders({
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
      requestUri: '/accounts/${Uri.encodeComponent(awsAccountId)}/folders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFoldersResponse.fromJson(response);
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
    required String awsAccountId,
    required String groupName,
    required String namespace,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required String namespace,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String namespace,
    AssignmentStatus? assignmentStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String namespace,
    required String userName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
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
    required String awsAccountId,
    required String dataSetId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String resourceArn,
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
    required String awsAccountId,
    required String templateId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String templateId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String themeId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String themeId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    int? maxResults,
    String? nextToken,
    ThemeType? type,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String namespace,
    required String userName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
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
    required String awsAccountId,
    required String namespace,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
  /// Parameter [customFederationProviderUrl] :
  /// The URL of the custom OpenID Connect (OIDC) provider that provides
  /// identity to let a user federate into QuickSight with an associated AWS
  /// Identity and Access Management (IAM) role. This parameter should only be
  /// used when <code>ExternalLoginFederationProviderType</code> parameter is
  /// set to <code>CUSTOM_OIDC</code>.
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
  /// Parameter [externalLoginFederationProviderType] :
  /// The type of supported external login provider that provides identity to
  /// let a user federate into Amazon QuickSight with an associated AWS Identity
  /// and Access Management (IAM) role. The type of supported external login
  /// provider can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>COGNITO</code>: Amazon Cognito. The provider URL is
  /// cognito-identity.amazonaws.com. When choosing the <code>COGNITO</code>
  /// provider type, don’t use the "CustomFederationProviderUrl" parameter which
  /// is only needed when the external provider is custom.
  /// </li>
  /// <li>
  /// <code>CUSTOM_OIDC</code>: Custom OpenID Connect (OIDC) provider. When
  /// choosing <code>CUSTOM_OIDC</code> type, use the
  /// <code>CustomFederationProviderUrl</code> parameter to provide the custom
  /// OIDC provider URL.
  /// </li>
  /// </ul>
  ///
  /// Parameter [externalLoginId] :
  /// The identity ID for a user in the external login provider.
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
    required String awsAccountId,
    required String email,
    required IdentityType identityType,
    required String namespace,
    required UserRole userRole,
    String? customFederationProviderUrl,
    String? customPermissionsName,
    String? externalLoginFederationProviderType,
    String? externalLoginId,
    String? iamArn,
    String? sessionName,
    String? userName,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(userRole, 'userRole');
    _s.validateStringLength(
      'customPermissionsName',
      customPermissionsName,
      1,
      64,
    );
    _s.validateStringLength(
      'sessionName',
      sessionName,
      2,
      64,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Email': email,
      'IdentityType': identityType.toValue(),
      'UserRole': userRole.toValue(),
      if (customFederationProviderUrl != null)
        'CustomFederationProviderUrl': customFederationProviderUrl,
      if (customPermissionsName != null)
        'CustomPermissionsName': customPermissionsName,
      if (externalLoginFederationProviderType != null)
        'ExternalLoginFederationProviderType':
            externalLoginFederationProviderType,
      if (externalLoginId != null) 'ExternalLoginId': externalLoginId,
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
    required String analysisId,
    required String awsAccountId,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    required String awsAccountId,
    required List<AnalysisSearchFilter> filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required List<DashboardSearchFilter> filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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

  /// Searches the subfolders in a folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidNextTokenException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [filters] :
  /// The filters to apply to the search. Currently, you can search only by the
  /// parent folder ARN. For example, <code>"Filters": [ { "Name":
  /// "PARENT_FOLDER_ARN", "Operator": "StringEquals", "Value":
  /// "arn:aws:quicksight:us-east-1:1:folder/folderId" } ]</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or null if there are no more
  /// results.
  Future<SearchFoldersResponse> searchFolders({
    required String awsAccountId,
    required List<FolderSearchFilter> filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/search/folders',
      exceptionFnMap: _exceptionFns,
    );
    return SearchFoldersResponse.fromJson(response);
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
    required String resourceArn,
    required List<Tag> tags,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'keys': tagKeys,
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
    required AccountCustomization accountCustomization,
    required String awsAccountId,
    String? namespace,
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
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required String defaultNamespace,
    String? notificationEmail,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String analysisId,
    required String awsAccountId,
    required String name,
    required AnalysisSourceEntity sourceEntity,
    Parameters? parameters,
    String? themeArn,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
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
    required String analysisId,
    required String awsAccountId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(analysisId, 'analysisId');
    _s.validateStringLength(
      'analysisId',
      analysisId,
      1,
      2048,
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
    required String awsAccountId,
    required String dashboardId,
    required String name,
    required DashboardSourceEntity sourceEntity,
    DashboardPublishOptions? dashboardPublishOptions,
    Parameters? parameters,
    String? themeArn,
    String? versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      2048,
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
    required String awsAccountId,
    required String dashboardId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dashboardId,
    required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
  /// Parameter [fieldFolders] :
  /// The folder that contains fields and nested subfolders for your dataset.
  ///
  /// Parameter [logicalTableMap] :
  /// Configures the combination and transformation of the data from the
  /// physical tables.
  ///
  /// Parameter [rowLevelPermissionDataSet] :
  /// The row-level security configuration for the data you want to create.
  Future<UpdateDataSetResponse> updateDataSet({
    required String awsAccountId,
    required String dataSetId,
    required DataSetImportMode importMode,
    required String name,
    required Map<String, PhysicalTable> physicalTableMap,
    List<ColumnGroup>? columnGroups,
    List<ColumnLevelPermissionRule>? columnLevelPermissionRules,
    Map<String, FieldFolder>? fieldFolders,
    Map<String, LogicalTable>? logicalTableMap,
    RowLevelPermissionDataSet? rowLevelPermissionDataSet,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
      'ImportMode': importMode.toValue(),
      'Name': name,
      'PhysicalTableMap': physicalTableMap,
      if (columnGroups != null) 'ColumnGroups': columnGroups,
      if (columnLevelPermissionRules != null)
        'ColumnLevelPermissionRules': columnLevelPermissionRules,
      if (fieldFolders != null) 'FieldFolders': fieldFolders,
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
    required String awsAccountId,
    required String dataSetId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSourceId,
    required String name,
    DataSourceCredentials? credentials,
    DataSourceParameters? dataSourceParameters,
    SslProperties? sslProperties,
    VpcConnectionProperties? vpcConnectionProperties,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String dataSourceId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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

  /// Updates the name of a folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  ///
  /// Parameter [name] :
  /// The name of the folder.
  Future<UpdateFolderResponse> updateFolder({
    required String awsAccountId,
    required String folderId,
    required String name,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      200,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFolderResponse.fromJson(response);
  }

  /// Updates permissions of a folder.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [AccessDeniedException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedUserEditionException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [folderId] :
  /// The folder ID.
  ///
  /// Parameter [grantPermissions] :
  /// The permissions that you want to grant on a resource.
  ///
  /// Parameter [revokePermissions] :
  /// The permissions that you want to revoke from a resource.
  Future<UpdateFolderPermissionsResponse> updateFolderPermissions({
    required String awsAccountId,
    required String folderId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
      isRequired: true,
    );
    ArgumentError.checkNotNull(folderId, 'folderId');
    _s.validateStringLength(
      'folderId',
      folderId,
      1,
      2048,
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
          '/accounts/${Uri.encodeComponent(awsAccountId)}/folders/${Uri.encodeComponent(folderId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFolderPermissionsResponse.fromJson(response);
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
    required String awsAccountId,
    required String groupName,
    required String namespace,
    String? description,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String assignmentName,
    required String awsAccountId,
    required String namespace,
    AssignmentStatus? assignmentStatus,
    Map<String, List<String>>? identities,
    String? policyArn,
  }) async {
    ArgumentError.checkNotNull(assignmentName, 'assignmentName');
    _s.validateStringLength(
      'assignmentName',
      assignmentName,
      1,
      1152921504606846976,
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
    ArgumentError.checkNotNull(namespace, 'namespace');
    _s.validateStringLength(
      'namespace',
      namespace,
      0,
      64,
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
    required String awsAccountId,
    required TemplateSourceEntity sourceEntity,
    required String templateId,
    String? name,
    String? versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String aliasName,
    required String awsAccountId,
    required String templateId,
    required int templateVersionNumber,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      2048,
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
    required String awsAccountId,
    required String templateId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    required String awsAccountId,
    required String baseThemeId,
    required String themeId,
    ThemeConfiguration? configuration,
    String? name,
    String? versionDescription,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
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
    required String aliasName,
    required String awsAccountId,
    required String themeId,
    required int themeVersionNumber,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      2048,
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
    ArgumentError.checkNotNull(themeId, 'themeId');
    _s.validateStringLength(
      'themeId',
      themeId,
      1,
      2048,
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
    required String awsAccountId,
    required String themeId,
    List<ResourcePermission>? grantPermissions,
    List<ResourcePermission>? revokePermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
  /// Parameter [customFederationProviderUrl] :
  /// The URL of the custom OpenID Connect (OIDC) provider that provides
  /// identity to let a user federate into QuickSight with an associated AWS
  /// Identity and Access Management (IAM) role. This parameter should only be
  /// used when <code>ExternalLoginFederationProviderType</code> parameter is
  /// set to <code>CUSTOM_OIDC</code>.
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
  /// Parameter [externalLoginFederationProviderType] :
  /// The type of supported external login provider that provides identity to
  /// let a user federate into QuickSight with an associated AWS Identity and
  /// Access Management (IAM) role. The type of supported external login
  /// provider can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>COGNITO</code>: Amazon Cognito. The provider URL is
  /// cognito-identity.amazonaws.com. When choosing the <code>COGNITO</code>
  /// provider type, don’t use the "CustomFederationProviderUrl" parameter which
  /// is only needed when the external provider is custom.
  /// </li>
  /// <li>
  /// <code>CUSTOM_OIDC</code>: Custom OpenID Connect (OIDC) provider. When
  /// choosing <code>CUSTOM_OIDC</code> type, use the
  /// <code>CustomFederationProviderUrl</code> parameter to provide the custom
  /// OIDC provider URL.
  /// </li>
  /// <li>
  /// <code>NONE</code>: This clears all the previously saved external login
  /// information for a user. Use <code> <a>DescribeUser</a> </code> API to
  /// check the external login information.
  /// </li>
  /// </ul>
  ///
  /// Parameter [externalLoginId] :
  /// The identity ID for a user in the external login provider.
  ///
  /// Parameter [unapplyCustomPermissions] :
  /// A flag that you use to indicate that you want to remove all custom
  /// permissions from this user. Using this parameter resets the user to the
  /// state it was in before a custom permissions profile was applied. This
  /// parameter defaults to NULL and it doesn't accept any other value.
  Future<UpdateUserResponse> updateUser({
    required String awsAccountId,
    required String email,
    required String namespace,
    required UserRole role,
    required String userName,
    String? customFederationProviderUrl,
    String? customPermissionsName,
    String? externalLoginFederationProviderType,
    String? externalLoginId,
    bool? unapplyCustomPermissions,
  }) async {
    ArgumentError.checkNotNull(awsAccountId, 'awsAccountId');
    _s.validateStringLength(
      'awsAccountId',
      awsAccountId,
      12,
      12,
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
    ArgumentError.checkNotNull(role, 'role');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'customPermissionsName',
      customPermissionsName,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'Email': email,
      'Role': role.toValue(),
      if (customFederationProviderUrl != null)
        'CustomFederationProviderUrl': customFederationProviderUrl,
      if (customPermissionsName != null)
        'CustomPermissionsName': customPermissionsName,
      if (externalLoginFederationProviderType != null)
        'ExternalLoginFederationProviderType':
            externalLoginFederationProviderType,
      if (externalLoginId != null) 'ExternalLoginId': externalLoginId,
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
class AccountCustomization {
  /// The default theme for this QuickSight subscription.
  final String? defaultTheme;

  AccountCustomization({
    this.defaultTheme,
  });

  factory AccountCustomization.fromJson(Map<String, dynamic> json) {
    return AccountCustomization(
      defaultTheme: json['DefaultTheme'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultTheme = this.defaultTheme;
    return {
      if (defaultTheme != null) 'DefaultTheme': defaultTheme,
    };
  }
}

/// The QuickSight settings associated with your AWS account.
class AccountSettings {
  /// The "account name" you provided for the QuickSight subscription in your AWS
  /// account. You create this name when you sign up for QuickSight. It is unique
  /// in all of AWS and it appears only in the console when users sign in.
  final String? accountName;

  /// The default QuickSight namespace for your AWS account.
  final String? defaultNamespace;

  /// The edition of QuickSight that you're currently subscribed to: Enterprise
  /// edition or Standard edition.
  final Edition? edition;

  /// The main notification email for your QuickSight subscription.
  final String? notificationEmail;

  AccountSettings({
    this.accountName,
    this.defaultNamespace,
    this.edition,
    this.notificationEmail,
  });

  factory AccountSettings.fromJson(Map<String, dynamic> json) {
    return AccountSettings(
      accountName: json['AccountName'] as String?,
      defaultNamespace: json['DefaultNamespace'] as String?,
      edition: (json['Edition'] as String?)?.toEdition(),
      notificationEmail: json['NotificationEmail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountName = this.accountName;
    final defaultNamespace = this.defaultNamespace;
    final edition = this.edition;
    final notificationEmail = this.notificationEmail;
    return {
      if (accountName != null) 'AccountName': accountName,
      if (defaultNamespace != null) 'DefaultNamespace': defaultNamespace,
      if (edition != null) 'Edition': edition.toValue(),
      if (notificationEmail != null) 'NotificationEmail': notificationEmail,
    };
  }
}

/// The active AWS Identity and Access Management (IAM) policy assignment.
class ActiveIAMPolicyAssignment {
  /// A name for the IAM policy assignment.
  final String? assignmentName;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? policyArn;

  ActiveIAMPolicyAssignment({
    this.assignmentName,
    this.policyArn,
  });

  factory ActiveIAMPolicyAssignment.fromJson(Map<String, dynamic> json) {
    return ActiveIAMPolicyAssignment(
      assignmentName: json['AssignmentName'] as String?,
      policyArn: json['PolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentName = this.assignmentName;
    final policyArn = this.policyArn;
    return {
      if (assignmentName != null) 'AssignmentName': assignmentName,
      if (policyArn != null) 'PolicyArn': policyArn,
    };
  }
}

/// Ad hoc (one-time) filtering option.
class AdHocFilteringOption {
  /// Availability status.
  final DashboardBehavior? availabilityStatus;

  AdHocFilteringOption({
    this.availabilityStatus,
  });

  factory AdHocFilteringOption.fromJson(Map<String, dynamic> json) {
    return AdHocFilteringOption(
      availabilityStatus:
          (json['AvailabilityStatus'] as String?)?.toDashboardBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityStatus = this.availabilityStatus;
    return {
      if (availabilityStatus != null)
        'AvailabilityStatus': availabilityStatus.toValue(),
    };
  }
}

/// Amazon Elasticsearch Service parameters.
class AmazonElasticsearchParameters {
  /// The Amazon Elasticsearch Service domain.
  final String domain;

  AmazonElasticsearchParameters({
    required this.domain,
  });

  factory AmazonElasticsearchParameters.fromJson(Map<String, dynamic> json) {
    return AmazonElasticsearchParameters(
      domain: json['Domain'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      'Domain': domain,
    };
  }
}

/// Metadata structure for an analysis in Amazon QuickSight
class Analysis {
  /// The ID of the analysis.
  final String? analysisId;

  /// The Amazon Resource Name (ARN) of the analysis.
  final String? arn;

  /// The time that the analysis was created.
  final DateTime? createdTime;

  /// The ARNs of the datasets of the analysis.
  final List<String>? dataSetArns;

  /// Errors associated with the analysis.
  final List<AnalysisError>? errors;

  /// The time that the analysis was last updated.
  final DateTime? lastUpdatedTime;

  /// The descriptive name of the analysis.
  final String? name;

  /// A list of the associated sheets with the unique identifier and name of each
  /// sheet.
  final List<Sheet>? sheets;

  /// Status associated with the analysis.
  final ResourceStatus? status;

  /// The ARN of the theme of the analysis.
  final String? themeArn;

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

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      analysisId: json['AnalysisId'] as String?,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dataSetArns: (json['DataSetArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisError.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      sheets: (json['Sheets'] as List?)
          ?.whereNotNull()
          .map((e) => Sheet.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toResourceStatus(),
      themeArn: json['ThemeArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final dataSetArns = this.dataSetArns;
    final errors = this.errors;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final sheets = this.sheets;
    final status = this.status;
    final themeArn = this.themeArn;
    return {
      if (analysisId != null) 'AnalysisId': analysisId,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dataSetArns != null) 'DataSetArns': dataSetArns,
      if (errors != null) 'Errors': errors,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (sheets != null) 'Sheets': sheets,
      if (status != null) 'Status': status.toValue(),
      if (themeArn != null) 'ThemeArn': themeArn,
    };
  }
}

/// A metadata error structure for an analysis.
class AnalysisError {
  /// The message associated with the analysis error.
  final String? message;

  /// The type of the analysis error.
  final AnalysisErrorType? type;

  AnalysisError({
    this.message,
    this.type,
  });

  factory AnalysisError.fromJson(Map<String, dynamic> json) {
    return AnalysisError(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toAnalysisErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AnalysisErrorType {
  accessDenied,
  sourceNotFound,
  dataSetNotFound,
  internalFailure,
  parameterValueIncompatible,
  parameterTypeInvalid,
  parameterNotFound,
  columnTypeMismatch,
  columnGeographicRoleMismatch,
  columnReplacementMissing,
}

extension on AnalysisErrorType {
  String toValue() {
    switch (this) {
      case AnalysisErrorType.accessDenied:
        return 'ACCESS_DENIED';
      case AnalysisErrorType.sourceNotFound:
        return 'SOURCE_NOT_FOUND';
      case AnalysisErrorType.dataSetNotFound:
        return 'DATA_SET_NOT_FOUND';
      case AnalysisErrorType.internalFailure:
        return 'INTERNAL_FAILURE';
      case AnalysisErrorType.parameterValueIncompatible:
        return 'PARAMETER_VALUE_INCOMPATIBLE';
      case AnalysisErrorType.parameterTypeInvalid:
        return 'PARAMETER_TYPE_INVALID';
      case AnalysisErrorType.parameterNotFound:
        return 'PARAMETER_NOT_FOUND';
      case AnalysisErrorType.columnTypeMismatch:
        return 'COLUMN_TYPE_MISMATCH';
      case AnalysisErrorType.columnGeographicRoleMismatch:
        return 'COLUMN_GEOGRAPHIC_ROLE_MISMATCH';
      case AnalysisErrorType.columnReplacementMissing:
        return 'COLUMN_REPLACEMENT_MISSING';
    }
  }
}

extension on String {
  AnalysisErrorType toAnalysisErrorType() {
    switch (this) {
      case 'ACCESS_DENIED':
        return AnalysisErrorType.accessDenied;
      case 'SOURCE_NOT_FOUND':
        return AnalysisErrorType.sourceNotFound;
      case 'DATA_SET_NOT_FOUND':
        return AnalysisErrorType.dataSetNotFound;
      case 'INTERNAL_FAILURE':
        return AnalysisErrorType.internalFailure;
      case 'PARAMETER_VALUE_INCOMPATIBLE':
        return AnalysisErrorType.parameterValueIncompatible;
      case 'PARAMETER_TYPE_INVALID':
        return AnalysisErrorType.parameterTypeInvalid;
      case 'PARAMETER_NOT_FOUND':
        return AnalysisErrorType.parameterNotFound;
      case 'COLUMN_TYPE_MISMATCH':
        return AnalysisErrorType.columnTypeMismatch;
      case 'COLUMN_GEOGRAPHIC_ROLE_MISMATCH':
        return AnalysisErrorType.columnGeographicRoleMismatch;
      case 'COLUMN_REPLACEMENT_MISSING':
        return AnalysisErrorType.columnReplacementMissing;
    }
    throw Exception('$this is not known in enum AnalysisErrorType');
  }
}

enum AnalysisFilterAttribute {
  quicksightUser,
}

extension on AnalysisFilterAttribute {
  String toValue() {
    switch (this) {
      case AnalysisFilterAttribute.quicksightUser:
        return 'QUICKSIGHT_USER';
    }
  }
}

extension on String {
  AnalysisFilterAttribute toAnalysisFilterAttribute() {
    switch (this) {
      case 'QUICKSIGHT_USER':
        return AnalysisFilterAttribute.quicksightUser;
    }
    throw Exception('$this is not known in enum AnalysisFilterAttribute');
  }
}

/// A filter that you apply when searching for one or more analyses.
class AnalysisSearchFilter {
  /// The name of the value that you want to use as a filter, for example
  /// <code>"Name": "QUICKSIGHT_USER"</code>.
  final AnalysisFilterAttribute? name;

  /// The comparison operator that you want to use as a filter, for example
  /// <code>"Operator": "StringEquals"</code>.
  final FilterOperator? operator;

  /// The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that
  /// you want to use as a filter, for example <code>"Value"</code>. An example is
  /// <code>"arn:aws:quicksight:us-east-1:1:user/default/UserName1"</code>.
  final String? value;

  AnalysisSearchFilter({
    this.name,
    this.operator,
    this.value,
  });

  factory AnalysisSearchFilter.fromJson(Map<String, dynamic> json) {
    return AnalysisSearchFilter(
      name: (json['Name'] as String?)?.toAnalysisFilterAttribute(),
      operator: (json['Operator'] as String?)?.toFilterOperator(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      if (name != null) 'Name': name.toValue(),
      if (operator != null) 'Operator': operator.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// The source entity of an analysis.
class AnalysisSourceEntity {
  /// The source template for the source entity of the analysis.
  final AnalysisSourceTemplate? sourceTemplate;

  AnalysisSourceEntity({
    this.sourceTemplate,
  });

  factory AnalysisSourceEntity.fromJson(Map<String, dynamic> json) {
    return AnalysisSourceEntity(
      sourceTemplate: json['SourceTemplate'] != null
          ? AnalysisSourceTemplate.fromJson(
              json['SourceTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceTemplate = this.sourceTemplate;
    return {
      if (sourceTemplate != null) 'SourceTemplate': sourceTemplate,
    };
  }
}

/// The source template of an analysis.
class AnalysisSourceTemplate {
  /// The Amazon Resource Name (ARN) of the source template of an analysis.
  final String arn;

  /// The dataset references of the source template of an analysis.
  final List<DataSetReference> dataSetReferences;

  AnalysisSourceTemplate({
    required this.arn,
    required this.dataSetReferences,
  });

  factory AnalysisSourceTemplate.fromJson(Map<String, dynamic> json) {
    return AnalysisSourceTemplate(
      arn: json['Arn'] as String,
      dataSetReferences: (json['DataSetReferences'] as List)
          .whereNotNull()
          .map((e) => DataSetReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSetReferences = this.dataSetReferences;
    return {
      'Arn': arn,
      'DataSetReferences': dataSetReferences,
    };
  }
}

/// The summary metadata that describes an analysis.
class AnalysisSummary {
  /// The ID of the analysis. This ID displays in the URL.
  final String? analysisId;

  /// The Amazon Resource Name (ARN) for the analysis.
  final String? arn;

  /// The time that the analysis was created.
  final DateTime? createdTime;

  /// The time that the analysis was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the analysis. This name is displayed in the QuickSight console.
  final String? name;

  /// The last known status for the analysis.
  final ResourceStatus? status;

  AnalysisSummary({
    this.analysisId,
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.name,
    this.status,
  });

  factory AnalysisSummary.fromJson(Map<String, dynamic> json) {
    return AnalysisSummary(
      analysisId: json['AnalysisId'] as String?,
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toResourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final status = this.status;
    return {
      if (analysisId != null) 'AnalysisId': analysisId,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum AssignmentStatus {
  enabled,
  draft,
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
  }
}

extension on String {
  AssignmentStatus toAssignmentStatus() {
    switch (this) {
      case 'ENABLED':
        return AssignmentStatus.enabled;
      case 'DRAFT':
        return AssignmentStatus.draft;
      case 'DISABLED':
        return AssignmentStatus.disabled;
    }
    throw Exception('$this is not known in enum AssignmentStatus');
  }
}

/// Amazon Athena parameters.
class AthenaParameters {
  /// The workgroup that Amazon Athena uses.
  final String? workGroup;

  AthenaParameters({
    this.workGroup,
  });

  factory AthenaParameters.fromJson(Map<String, dynamic> json) {
    return AthenaParameters(
      workGroup: json['WorkGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workGroup = this.workGroup;
    return {
      if (workGroup != null) 'WorkGroup': workGroup,
    };
  }
}

/// Amazon Aurora parameters.
class AuroraParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  AuroraParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory AuroraParameters.fromJson(Map<String, dynamic> json) {
    return AuroraParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// Amazon Aurora with PostgreSQL compatibility parameters.
class AuroraPostgreSqlParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  AuroraPostgreSqlParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory AuroraPostgreSqlParameters.fromJson(Map<String, dynamic> json) {
    return AuroraPostgreSqlParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// AWS IoT Analytics parameters.
class AwsIotAnalyticsParameters {
  /// Dataset name.
  final String dataSetName;

  AwsIotAnalyticsParameters({
    required this.dataSetName,
  });

  factory AwsIotAnalyticsParameters.fromJson(Map<String, dynamic> json) {
    return AwsIotAnalyticsParameters(
      dataSetName: json['DataSetName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetName = this.dataSetName;
    return {
      'DataSetName': dataSetName,
    };
  }
}

/// The display options for tile borders for visuals.
class BorderStyle {
  /// The option to enable display of borders for visuals.
  final bool? show;

  BorderStyle({
    this.show,
  });

  factory BorderStyle.fromJson(Map<String, dynamic> json) {
    return BorderStyle(
      show: json['Show'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final show = this.show;
    return {
      if (show != null) 'Show': show,
    };
  }
}

/// A calculated column for a dataset.
class CalculatedColumn {
  /// A unique ID to identify a calculated column. During a dataset update, if the
  /// column ID of a calculated column matches that of an existing calculated
  /// column, Amazon QuickSight preserves the existing calculated column.
  final String columnId;

  /// Column name.
  final String columnName;

  /// An expression that defines the calculated column.
  final String expression;

  CalculatedColumn({
    required this.columnId,
    required this.columnName,
    required this.expression,
  });

  factory CalculatedColumn.fromJson(Map<String, dynamic> json) {
    return CalculatedColumn(
      columnId: json['ColumnId'] as String,
      columnName: json['ColumnName'] as String,
      expression: json['Expression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final columnId = this.columnId;
    final columnName = this.columnName;
    final expression = this.expression;
    return {
      'ColumnId': columnId,
      'ColumnName': columnName,
      'Expression': expression,
    };
  }
}

class CancelIngestionResponse {
  /// The Amazon Resource Name (ARN) for the data ingestion.
  final String? arn;

  /// An ID for the ingestion.
  final String? ingestionId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CancelIngestionResponse({
    this.arn,
    this.ingestionId,
    this.requestId,
    this.status,
  });

  factory CancelIngestionResponse.fromJson(Map<String, dynamic> json) {
    return CancelIngestionResponse(
      arn: json['Arn'] as String?,
      ingestionId: json['IngestionId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final ingestionId = this.ingestionId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (ingestionId != null) 'IngestionId': ingestionId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

/// A transform operation that casts a column to a different type.
class CastColumnTypeOperation {
  /// Column name.
  final String columnName;

  /// New column data type.
  final ColumnDataType newColumnType;

  /// When casting a column from string to datetime type, you can supply a string
  /// in a format supported by Amazon QuickSight to denote the source data format.
  final String? format;

  CastColumnTypeOperation({
    required this.columnName,
    required this.newColumnType,
    this.format,
  });

  factory CastColumnTypeOperation.fromJson(Map<String, dynamic> json) {
    return CastColumnTypeOperation(
      columnName: json['ColumnName'] as String,
      newColumnType: (json['NewColumnType'] as String).toColumnDataType(),
      format: json['Format'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final newColumnType = this.newColumnType;
    final format = this.format;
    return {
      'ColumnName': columnName,
      'NewColumnType': newColumnType.toValue(),
      if (format != null) 'Format': format,
    };
  }
}

enum ColumnDataType {
  string,
  integer,
  decimal,
  datetime,
}

extension on ColumnDataType {
  String toValue() {
    switch (this) {
      case ColumnDataType.string:
        return 'STRING';
      case ColumnDataType.integer:
        return 'INTEGER';
      case ColumnDataType.decimal:
        return 'DECIMAL';
      case ColumnDataType.datetime:
        return 'DATETIME';
    }
  }
}

extension on String {
  ColumnDataType toColumnDataType() {
    switch (this) {
      case 'STRING':
        return ColumnDataType.string;
      case 'INTEGER':
        return ColumnDataType.integer;
      case 'DECIMAL':
        return ColumnDataType.decimal;
      case 'DATETIME':
        return ColumnDataType.datetime;
    }
    throw Exception('$this is not known in enum ColumnDataType');
  }
}

/// Metadata that contains a description for a column.
class ColumnDescription {
  /// The text of a description for a column.
  final String? text;

  ColumnDescription({
    this.text,
  });

  factory ColumnDescription.fromJson(Map<String, dynamic> json) {
    return ColumnDescription(
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'Text': text,
    };
  }
}

/// Groupings of columns that work together in certain Amazon QuickSight
/// features. This is a variant type structure. For this structure to be valid,
/// only one of the attributes can be non-null.
class ColumnGroup {
  /// Geospatial column group that denotes a hierarchy.
  final GeoSpatialColumnGroup? geoSpatialColumnGroup;

  ColumnGroup({
    this.geoSpatialColumnGroup,
  });

  factory ColumnGroup.fromJson(Map<String, dynamic> json) {
    return ColumnGroup(
      geoSpatialColumnGroup: json['GeoSpatialColumnGroup'] != null
          ? GeoSpatialColumnGroup.fromJson(
              json['GeoSpatialColumnGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final geoSpatialColumnGroup = this.geoSpatialColumnGroup;
    return {
      if (geoSpatialColumnGroup != null)
        'GeoSpatialColumnGroup': geoSpatialColumnGroup,
    };
  }
}

/// A structure describing the name, data type, and geographic role of the
/// columns.
class ColumnGroupColumnSchema {
  /// The name of the column group's column schema.
  final String? name;

  ColumnGroupColumnSchema({
    this.name,
  });

  factory ColumnGroupColumnSchema.fromJson(Map<String, dynamic> json) {
    return ColumnGroupColumnSchema(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// The column group schema.
class ColumnGroupSchema {
  /// A structure containing the list of schemas for column group columns.
  final List<ColumnGroupColumnSchema>? columnGroupColumnSchemaList;

  /// The name of the column group schema.
  final String? name;

  ColumnGroupSchema({
    this.columnGroupColumnSchemaList,
    this.name,
  });

  factory ColumnGroupSchema.fromJson(Map<String, dynamic> json) {
    return ColumnGroupSchema(
      columnGroupColumnSchemaList:
          (json['ColumnGroupColumnSchemaList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  ColumnGroupColumnSchema.fromJson(e as Map<String, dynamic>))
              .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnGroupColumnSchemaList = this.columnGroupColumnSchemaList;
    final name = this.name;
    return {
      if (columnGroupColumnSchemaList != null)
        'ColumnGroupColumnSchemaList': columnGroupColumnSchemaList,
      if (name != null) 'Name': name,
    };
  }
}

/// A rule defined to grant access on one or more restricted columns. Each
/// dataset can have multiple rules. To create a restricted column, you add it
/// to one or more rules. Each rule must contain at least one column and at
/// least one user or group. To be able to see a restricted column, a user or
/// group needs to be added to a rule for that column.
class ColumnLevelPermissionRule {
  /// An array of column names.
  final List<String>? columnNames;

  /// An array of Amazon Resource Names (ARNs) for QuickSight users or groups.
  final List<String>? principals;

  ColumnLevelPermissionRule({
    this.columnNames,
    this.principals,
  });

  factory ColumnLevelPermissionRule.fromJson(Map<String, dynamic> json) {
    return ColumnLevelPermissionRule(
      columnNames: (json['ColumnNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      principals: (json['Principals'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnNames = this.columnNames;
    final principals = this.principals;
    return {
      if (columnNames != null) 'ColumnNames': columnNames,
      if (principals != null) 'Principals': principals,
    };
  }
}

/// The column schema.
class ColumnSchema {
  /// The data type of the column schema.
  final String? dataType;

  /// The geographic role of the column schema.
  final String? geographicRole;

  /// The name of the column schema.
  final String? name;

  ColumnSchema({
    this.dataType,
    this.geographicRole,
    this.name,
  });

  factory ColumnSchema.fromJson(Map<String, dynamic> json) {
    return ColumnSchema(
      dataType: json['DataType'] as String?,
      geographicRole: json['GeographicRole'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final geographicRole = this.geographicRole;
    final name = this.name;
    return {
      if (dataType != null) 'DataType': dataType,
      if (geographicRole != null) 'GeographicRole': geographicRole,
      if (name != null) 'Name': name,
    };
  }
}

/// A tag for a column in a <a>TagColumnOperation</a> structure. This is a
/// variant type structure. For this structure to be valid, only one of the
/// attributes can be non-null.
class ColumnTag {
  /// A description for a column.
  final ColumnDescription? columnDescription;

  /// A geospatial role for a column.
  final GeoSpatialDataRole? columnGeographicRole;

  ColumnTag({
    this.columnDescription,
    this.columnGeographicRole,
  });

  factory ColumnTag.fromJson(Map<String, dynamic> json) {
    return ColumnTag(
      columnDescription: json['ColumnDescription'] != null
          ? ColumnDescription.fromJson(
              json['ColumnDescription'] as Map<String, dynamic>)
          : null,
      columnGeographicRole:
          (json['ColumnGeographicRole'] as String?)?.toGeoSpatialDataRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnDescription = this.columnDescription;
    final columnGeographicRole = this.columnGeographicRole;
    return {
      if (columnDescription != null) 'ColumnDescription': columnDescription,
      if (columnGeographicRole != null)
        'ColumnGeographicRole': columnGeographicRole.toValue(),
    };
  }
}

class CreateAccountCustomizationResponse {
  /// The QuickSight customizations you're adding in the current AWS Region.
  final AccountCustomization? accountCustomization;

  /// The Amazon Resource Name (ARN) for the customization that you created for
  /// this AWS account.
  final String? arn;

  /// The ID for the AWS account that you want to customize QuickSight for.
  final String? awsAccountId;

  /// The namespace associated with the customization you're creating.
  final String? namespace;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateAccountCustomizationResponse({
    this.accountCustomization,
    this.arn,
    this.awsAccountId,
    this.namespace,
    this.requestId,
    this.status,
  });

  factory CreateAccountCustomizationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAccountCustomizationResponse(
      accountCustomization: json['AccountCustomization'] != null
          ? AccountCustomization.fromJson(
              json['AccountCustomization'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      awsAccountId: json['AwsAccountId'] as String?,
      namespace: json['Namespace'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountCustomization = this.accountCustomization;
    final arn = this.arn;
    final awsAccountId = this.awsAccountId;
    final namespace = this.namespace;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (accountCustomization != null)
        'AccountCustomization': accountCustomization,
      if (arn != null) 'Arn': arn,
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (namespace != null) 'Namespace': namespace,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateAnalysisResponse {
  /// The ID of the analysis.
  final String? analysisId;

  /// The ARN for the analysis.
  final String? arn;

  /// The status of the creation of the analysis.
  final ResourceStatus? creationStatus;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateAnalysisResponse({
    this.analysisId,
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
  });

  factory CreateAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnalysisResponse(
      analysisId: json['AnalysisId'] as String?,
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisId != null) 'AnalysisId': analysisId,
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

/// A transform operation that creates calculated columns. Columns created in
/// one such operation form a lexical closure.
class CreateColumnsOperation {
  /// Calculated columns to create.
  final List<CalculatedColumn> columns;

  CreateColumnsOperation({
    required this.columns,
  });

  factory CreateColumnsOperation.fromJson(Map<String, dynamic> json) {
    return CreateColumnsOperation(
      columns: (json['Columns'] as List)
          .whereNotNull()
          .map((e) => CalculatedColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    return {
      'Columns': columns,
    };
  }
}

class CreateDashboardResponse {
  /// The ARN of the dashboard.
  final String? arn;

  /// The status of the dashboard creation request.
  final ResourceStatus? creationStatus;

  /// The ID for the dashboard.
  final String? dashboardId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The ARN of the dashboard, including the version number of the first version
  /// that is created.
  final String? versionArn;

  CreateDashboardResponse({
    this.arn,
    this.creationStatus,
    this.dashboardId,
    this.requestId,
    this.status,
    this.versionArn,
  });

  factory CreateDashboardResponse.fromJson(Map<String, dynamic> json) {
    return CreateDashboardResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      dashboardId: json['DashboardId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      versionArn: json['VersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final dashboardId = this.dashboardId;
    final requestId = this.requestId;
    final status = this.status;
    final versionArn = this.versionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (requestId != null) 'RequestId': requestId,
      if (versionArn != null) 'VersionArn': versionArn,
    };
  }
}

class CreateDataSetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? arn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  final String? dataSetId;

  /// The ARN for the ingestion, which is triggered as a result of dataset
  /// creation if the import mode is SPICE.
  final String? ingestionArn;

  /// The ID of the ingestion, which is triggered as a result of dataset creation
  /// if the import mode is SPICE.
  final String? ingestionId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateDataSetResponse({
    this.arn,
    this.dataSetId,
    this.ingestionArn,
    this.ingestionId,
    this.requestId,
    this.status,
  });

  factory CreateDataSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSetResponse(
      arn: json['Arn'] as String?,
      dataSetId: json['DataSetId'] as String?,
      ingestionArn: json['IngestionArn'] as String?,
      ingestionId: json['IngestionId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSetId = this.dataSetId;
    final ingestionArn = this.ingestionArn;
    final ingestionId = this.ingestionId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (ingestionArn != null) 'IngestionArn': ingestionArn,
      if (ingestionId != null) 'IngestionId': ingestionId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateDataSourceResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  final String? arn;

  /// The status of creating the data source.
  final ResourceStatus? creationStatus;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  final String? dataSourceId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateDataSourceResponse({
    this.arn,
    this.creationStatus,
    this.dataSourceId,
    this.requestId,
    this.status,
  });

  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSourceResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      dataSourceId: json['DataSourceId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final dataSourceId = this.dataSourceId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateFolderMembershipResponse {
  /// Information about the member in the folder.
  final FolderMember? folderMember;

  /// The request ID.
  final String? requestId;

  /// The status of the folder membership. If succeeded, the status is <code>SC_OK
  /// (200)</code>.
  final int? status;

  CreateFolderMembershipResponse({
    this.folderMember,
    this.requestId,
    this.status,
  });

  factory CreateFolderMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateFolderMembershipResponse(
      folderMember: json['FolderMember'] != null
          ? FolderMember.fromJson(json['FolderMember'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final folderMember = this.folderMember;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (folderMember != null) 'FolderMember': folderMember,
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status,
    };
  }
}

class CreateFolderResponse {
  /// The Amazon Resource Name (ARN) for the newly created folder.
  final String? arn;

  /// The folder ID for the newly created folder.
  final String? folderId;

  /// The request ID for the newly created folder.
  final String? requestId;

  /// The status of the newly created folder. If succeeded, the status is
  /// <code>SC_OK (200)</code>.
  final int? status;

  CreateFolderResponse({
    this.arn,
    this.folderId,
    this.requestId,
    this.status,
  });

  factory CreateFolderResponse.fromJson(Map<String, dynamic> json) {
    return CreateFolderResponse(
      arn: json['Arn'] as String?,
      folderId: json['FolderId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final folderId = this.folderId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (folderId != null) 'FolderId': folderId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateGroupMembershipResponse {
  /// The group member.
  final GroupMember? groupMember;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateGroupMembershipResponse({
    this.groupMember,
    this.requestId,
    this.status,
  });

  factory CreateGroupMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupMembershipResponse(
      groupMember: json['GroupMember'] != null
          ? GroupMember.fromJson(json['GroupMember'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupMember = this.groupMember;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (groupMember != null) 'GroupMember': groupMember,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

/// The response object for this operation.
class CreateGroupResponse {
  /// The name of the group.
  final Group? group;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupResponse(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (group != null) 'Group': group,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateIAMPolicyAssignmentResponse {
  /// The ID for the assignment.
  final String? assignmentId;

  /// The name of the assignment. This name must be unique within the AWS account.
  final String? assignmentName;

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
  final AssignmentStatus? assignmentStatus;

  /// The QuickSight users, groups, or both that the IAM policy is assigned to.
  final Map<String, List<String>>? identities;

  /// The ARN for the IAM policy that is applied to the QuickSight users and
  /// groups specified in this assignment.
  final String? policyArn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

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
      Map<String, dynamic> json) {
    return CreateIAMPolicyAssignmentResponse(
      assignmentId: json['AssignmentId'] as String?,
      assignmentName: json['AssignmentName'] as String?,
      assignmentStatus:
          (json['AssignmentStatus'] as String?)?.toAssignmentStatus(),
      identities: (json['Identities'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      policyArn: json['PolicyArn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentId = this.assignmentId;
    final assignmentName = this.assignmentName;
    final assignmentStatus = this.assignmentStatus;
    final identities = this.identities;
    final policyArn = this.policyArn;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (assignmentId != null) 'AssignmentId': assignmentId,
      if (assignmentName != null) 'AssignmentName': assignmentName,
      if (assignmentStatus != null)
        'AssignmentStatus': assignmentStatus.toValue(),
      if (identities != null) 'Identities': identities,
      if (policyArn != null) 'PolicyArn': policyArn,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateIngestionResponse {
  /// The Amazon Resource Name (ARN) for the data ingestion.
  final String? arn;

  /// An ID for the ingestion.
  final String? ingestionId;

  /// The ingestion status.
  final IngestionStatus? ingestionStatus;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateIngestionResponse({
    this.arn,
    this.ingestionId,
    this.ingestionStatus,
    this.requestId,
    this.status,
  });

  factory CreateIngestionResponse.fromJson(Map<String, dynamic> json) {
    return CreateIngestionResponse(
      arn: json['Arn'] as String?,
      ingestionId: json['IngestionId'] as String?,
      ingestionStatus:
          (json['IngestionStatus'] as String?)?.toIngestionStatus(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final ingestionId = this.ingestionId;
    final ingestionStatus = this.ingestionStatus;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (ingestionId != null) 'IngestionId': ingestionId,
      if (ingestionStatus != null) 'IngestionStatus': ingestionStatus.toValue(),
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateNamespaceResponse {
  /// The ARN of the QuickSight namespace you created.
  final String? arn;

  /// The AWS Region that you want to use for the free SPICE capacity for the new
  /// namespace. This is set to the region that you run CreateNamespace in.
  final String? capacityRegion;

  /// The status of the creation of the namespace. This is an asynchronous
  /// process. A status of <code>CREATED</code> means that your namespace is ready
  /// to use. If an error occurs, it indicates if the process is
  /// <code>retryable</code> or <code>non-retryable</code>. In the case of a
  /// non-retryable error, refer to the error message for follow-up tasks.
  final NamespaceStatus? creationStatus;

  /// Specifies the type of your user identity directory. Currently, this supports
  /// users with an identity type of <code>QUICKSIGHT</code>.
  final IdentityStore? identityStore;

  /// The name of the new namespace that you created.
  final String? name;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  CreateNamespaceResponse({
    this.arn,
    this.capacityRegion,
    this.creationStatus,
    this.identityStore,
    this.name,
    this.requestId,
    this.status,
  });

  factory CreateNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateNamespaceResponse(
      arn: json['Arn'] as String?,
      capacityRegion: json['CapacityRegion'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toNamespaceStatus(),
      identityStore: (json['IdentityStore'] as String?)?.toIdentityStore(),
      name: json['Name'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityRegion = this.capacityRegion;
    final creationStatus = this.creationStatus;
    final identityStore = this.identityStore;
    final name = this.name;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (capacityRegion != null) 'CapacityRegion': capacityRegion,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (identityStore != null) 'IdentityStore': identityStore.toValue(),
      if (name != null) 'Name': name,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class CreateTemplateAliasResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Information about the template alias.
  final TemplateAlias? templateAlias;

  CreateTemplateAliasResponse({
    this.requestId,
    this.status,
    this.templateAlias,
  });

  factory CreateTemplateAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateTemplateAliasResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateAlias: json['TemplateAlias'] != null
          ? TemplateAlias.fromJson(
              json['TemplateAlias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final templateAlias = this.templateAlias;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (templateAlias != null) 'TemplateAlias': templateAlias,
    };
  }
}

class CreateTemplateResponse {
  /// The ARN for the template.
  final String? arn;

  /// The template creation status.
  final ResourceStatus? creationStatus;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The ID of the template.
  final String? templateId;

  /// The ARN for the template, including the version information of the first
  /// version.
  final String? versionArn;

  CreateTemplateResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.templateId,
    this.versionArn,
  });

  factory CreateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateTemplateResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateId: json['TemplateId'] as String?,
      versionArn: json['VersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final requestId = this.requestId;
    final status = this.status;
    final templateId = this.templateId;
    final versionArn = this.versionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (requestId != null) 'RequestId': requestId,
      if (templateId != null) 'TemplateId': templateId,
      if (versionArn != null) 'VersionArn': versionArn,
    };
  }
}

class CreateThemeAliasResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Information about the theme alias.
  final ThemeAlias? themeAlias;

  CreateThemeAliasResponse({
    this.requestId,
    this.status,
    this.themeAlias,
  });

  factory CreateThemeAliasResponse.fromJson(Map<String, dynamic> json) {
    return CreateThemeAliasResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeAlias: json['ThemeAlias'] != null
          ? ThemeAlias.fromJson(json['ThemeAlias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final themeAlias = this.themeAlias;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (themeAlias != null) 'ThemeAlias': themeAlias,
    };
  }
}

class CreateThemeResponse {
  /// The Amazon Resource Name (ARN) for the theme.
  final String? arn;

  /// The theme creation status.
  final ResourceStatus? creationStatus;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The ID of the theme.
  final String? themeId;

  /// The Amazon Resource Name (ARN) for the new theme.
  final String? versionArn;

  CreateThemeResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.themeId,
    this.versionArn,
  });

  factory CreateThemeResponse.fromJson(Map<String, dynamic> json) {
    return CreateThemeResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeId: json['ThemeId'] as String?,
      versionArn: json['VersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final requestId = this.requestId;
    final status = this.status;
    final themeId = this.themeId;
    final versionArn = this.versionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (requestId != null) 'RequestId': requestId,
      if (themeId != null) 'ThemeId': themeId,
      if (versionArn != null) 'VersionArn': versionArn,
    };
  }
}

/// The combination of user name and password that are used as credentials.
class CredentialPair {
  /// Password.
  final String password;

  /// User name.
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
  final List<DataSourceParameters>? alternateDataSourceParameters;

  CredentialPair({
    required this.password,
    required this.username,
    this.alternateDataSourceParameters,
  });

  factory CredentialPair.fromJson(Map<String, dynamic> json) {
    return CredentialPair(
      password: json['Password'] as String,
      username: json['Username'] as String,
      alternateDataSourceParameters: (json['AlternateDataSourceParameters']
              as List?)
          ?.whereNotNull()
          .map((e) => DataSourceParameters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    final alternateDataSourceParameters = this.alternateDataSourceParameters;
    return {
      'Password': password,
      'Username': username,
      if (alternateDataSourceParameters != null)
        'AlternateDataSourceParameters': alternateDataSourceParameters,
    };
  }
}

/// A physical table type built from the results of the custom SQL query.
class CustomSql {
  /// The Amazon Resource Name (ARN) of the data source.
  final String dataSourceArn;

  /// A display name for the SQL query result.
  final String name;

  /// The SQL query.
  final String sqlQuery;

  /// The column schema from the SQL query result set.
  final List<InputColumn>? columns;

  CustomSql({
    required this.dataSourceArn,
    required this.name,
    required this.sqlQuery,
    this.columns,
  });

  factory CustomSql.fromJson(Map<String, dynamic> json) {
    return CustomSql(
      dataSourceArn: json['DataSourceArn'] as String,
      name: json['Name'] as String,
      sqlQuery: json['SqlQuery'] as String,
      columns: (json['Columns'] as List?)
          ?.whereNotNull()
          .map((e) => InputColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final name = this.name;
    final sqlQuery = this.sqlQuery;
    final columns = this.columns;
    return {
      'DataSourceArn': dataSourceArn,
      'Name': name,
      'SqlQuery': sqlQuery,
      if (columns != null) 'Columns': columns,
    };
  }
}

/// Dashboard.
class Dashboard {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The time that this dataset was created.
  final DateTime? createdTime;

  /// Dashboard ID.
  final String? dashboardId;

  /// The last time that this dataset was published.
  final DateTime? lastPublishedTime;

  /// The last time that this dataset was updated.
  final DateTime? lastUpdatedTime;

  /// A display name for the dashboard.
  final String? name;

  /// Version.
  final DashboardVersion? version;

  Dashboard({
    this.arn,
    this.createdTime,
    this.dashboardId,
    this.lastPublishedTime,
    this.lastUpdatedTime,
    this.name,
    this.version,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dashboardId: json['DashboardId'] as String?,
      lastPublishedTime: timeStampFromJson(json['LastPublishedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      version: json['Version'] != null
          ? DashboardVersion.fromJson(json['Version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final dashboardId = this.dashboardId;
    final lastPublishedTime = this.lastPublishedTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (lastPublishedTime != null)
        'LastPublishedTime': unixTimestampToJson(lastPublishedTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

enum DashboardBehavior {
  enabled,
  disabled,
}

extension on DashboardBehavior {
  String toValue() {
    switch (this) {
      case DashboardBehavior.enabled:
        return 'ENABLED';
      case DashboardBehavior.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  DashboardBehavior toDashboardBehavior() {
    switch (this) {
      case 'ENABLED':
        return DashboardBehavior.enabled;
      case 'DISABLED':
        return DashboardBehavior.disabled;
    }
    throw Exception('$this is not known in enum DashboardBehavior');
  }
}

/// Dashboard error.
class DashboardError {
  /// Message.
  final String? message;

  /// Type.
  final DashboardErrorType? type;

  DashboardError({
    this.message,
    this.type,
  });

  factory DashboardError.fromJson(Map<String, dynamic> json) {
    return DashboardError(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toDashboardErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum DashboardErrorType {
  accessDenied,
  sourceNotFound,
  dataSetNotFound,
  internalFailure,
  parameterValueIncompatible,
  parameterTypeInvalid,
  parameterNotFound,
  columnTypeMismatch,
  columnGeographicRoleMismatch,
  columnReplacementMissing,
}

extension on DashboardErrorType {
  String toValue() {
    switch (this) {
      case DashboardErrorType.accessDenied:
        return 'ACCESS_DENIED';
      case DashboardErrorType.sourceNotFound:
        return 'SOURCE_NOT_FOUND';
      case DashboardErrorType.dataSetNotFound:
        return 'DATA_SET_NOT_FOUND';
      case DashboardErrorType.internalFailure:
        return 'INTERNAL_FAILURE';
      case DashboardErrorType.parameterValueIncompatible:
        return 'PARAMETER_VALUE_INCOMPATIBLE';
      case DashboardErrorType.parameterTypeInvalid:
        return 'PARAMETER_TYPE_INVALID';
      case DashboardErrorType.parameterNotFound:
        return 'PARAMETER_NOT_FOUND';
      case DashboardErrorType.columnTypeMismatch:
        return 'COLUMN_TYPE_MISMATCH';
      case DashboardErrorType.columnGeographicRoleMismatch:
        return 'COLUMN_GEOGRAPHIC_ROLE_MISMATCH';
      case DashboardErrorType.columnReplacementMissing:
        return 'COLUMN_REPLACEMENT_MISSING';
    }
  }
}

extension on String {
  DashboardErrorType toDashboardErrorType() {
    switch (this) {
      case 'ACCESS_DENIED':
        return DashboardErrorType.accessDenied;
      case 'SOURCE_NOT_FOUND':
        return DashboardErrorType.sourceNotFound;
      case 'DATA_SET_NOT_FOUND':
        return DashboardErrorType.dataSetNotFound;
      case 'INTERNAL_FAILURE':
        return DashboardErrorType.internalFailure;
      case 'PARAMETER_VALUE_INCOMPATIBLE':
        return DashboardErrorType.parameterValueIncompatible;
      case 'PARAMETER_TYPE_INVALID':
        return DashboardErrorType.parameterTypeInvalid;
      case 'PARAMETER_NOT_FOUND':
        return DashboardErrorType.parameterNotFound;
      case 'COLUMN_TYPE_MISMATCH':
        return DashboardErrorType.columnTypeMismatch;
      case 'COLUMN_GEOGRAPHIC_ROLE_MISMATCH':
        return DashboardErrorType.columnGeographicRoleMismatch;
      case 'COLUMN_REPLACEMENT_MISSING':
        return DashboardErrorType.columnReplacementMissing;
    }
    throw Exception('$this is not known in enum DashboardErrorType');
  }
}

enum DashboardFilterAttribute {
  quicksightUser,
}

extension on DashboardFilterAttribute {
  String toValue() {
    switch (this) {
      case DashboardFilterAttribute.quicksightUser:
        return 'QUICKSIGHT_USER';
    }
  }
}

extension on String {
  DashboardFilterAttribute toDashboardFilterAttribute() {
    switch (this) {
      case 'QUICKSIGHT_USER':
        return DashboardFilterAttribute.quicksightUser;
    }
    throw Exception('$this is not known in enum DashboardFilterAttribute');
  }
}

/// Dashboard publish options.
class DashboardPublishOptions {
  /// Ad hoc (one-time) filtering option.
  final AdHocFilteringOption? adHocFilteringOption;

  /// Export to .csv option.
  final ExportToCSVOption? exportToCSVOption;

  /// Sheet controls option.
  final SheetControlsOption? sheetControlsOption;

  DashboardPublishOptions({
    this.adHocFilteringOption,
    this.exportToCSVOption,
    this.sheetControlsOption,
  });

  factory DashboardPublishOptions.fromJson(Map<String, dynamic> json) {
    return DashboardPublishOptions(
      adHocFilteringOption: json['AdHocFilteringOption'] != null
          ? AdHocFilteringOption.fromJson(
              json['AdHocFilteringOption'] as Map<String, dynamic>)
          : null,
      exportToCSVOption: json['ExportToCSVOption'] != null
          ? ExportToCSVOption.fromJson(
              json['ExportToCSVOption'] as Map<String, dynamic>)
          : null,
      sheetControlsOption: json['SheetControlsOption'] != null
          ? SheetControlsOption.fromJson(
              json['SheetControlsOption'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adHocFilteringOption = this.adHocFilteringOption;
    final exportToCSVOption = this.exportToCSVOption;
    final sheetControlsOption = this.sheetControlsOption;
    return {
      if (adHocFilteringOption != null)
        'AdHocFilteringOption': adHocFilteringOption,
      if (exportToCSVOption != null) 'ExportToCSVOption': exportToCSVOption,
      if (sheetControlsOption != null)
        'SheetControlsOption': sheetControlsOption,
    };
  }
}

/// A filter that you apply when searching for dashboards.
class DashboardSearchFilter {
  /// The comparison operator that you want to use as a filter, for example,
  /// <code>"Operator": "StringEquals"</code>.
  final FilterOperator operator;

  /// The name of the value that you want to use as a filter, for example,
  /// <code>"Name": "QUICKSIGHT_USER"</code>.
  final DashboardFilterAttribute? name;

  /// The value of the named item, in this case <code>QUICKSIGHT_USER</code>, that
  /// you want to use as a filter, for example, <code>"Value":
  /// "arn:aws:quicksight:us-east-1:1:user/default/UserName1"</code>.
  final String? value;

  DashboardSearchFilter({
    required this.operator,
    this.name,
    this.value,
  });

  factory DashboardSearchFilter.fromJson(Map<String, dynamic> json) {
    return DashboardSearchFilter(
      operator: (json['Operator'] as String).toFilterOperator(),
      name: (json['Name'] as String?)?.toDashboardFilterAttribute(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final name = this.name;
    final value = this.value;
    return {
      'Operator': operator.toValue(),
      if (name != null) 'Name': name.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// Dashboard source entity.
class DashboardSourceEntity {
  /// Source template.
  final DashboardSourceTemplate? sourceTemplate;

  DashboardSourceEntity({
    this.sourceTemplate,
  });

  factory DashboardSourceEntity.fromJson(Map<String, dynamic> json) {
    return DashboardSourceEntity(
      sourceTemplate: json['SourceTemplate'] != null
          ? DashboardSourceTemplate.fromJson(
              json['SourceTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceTemplate = this.sourceTemplate;
    return {
      if (sourceTemplate != null) 'SourceTemplate': sourceTemplate,
    };
  }
}

/// Dashboard source template.
class DashboardSourceTemplate {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// Dataset references.
  final List<DataSetReference> dataSetReferences;

  DashboardSourceTemplate({
    required this.arn,
    required this.dataSetReferences,
  });

  factory DashboardSourceTemplate.fromJson(Map<String, dynamic> json) {
    return DashboardSourceTemplate(
      arn: json['Arn'] as String,
      dataSetReferences: (json['DataSetReferences'] as List)
          .whereNotNull()
          .map((e) => DataSetReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSetReferences = this.dataSetReferences;
    return {
      'Arn': arn,
      'DataSetReferences': dataSetReferences,
    };
  }
}

/// Dashboard summary.
class DashboardSummary {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The time that this dashboard was created.
  final DateTime? createdTime;

  /// Dashboard ID.
  final String? dashboardId;

  /// The last time that this dashboard was published.
  final DateTime? lastPublishedTime;

  /// The last time that this dashboard was updated.
  final DateTime? lastUpdatedTime;

  /// A display name for the dashboard.
  final String? name;

  /// Published version number.
  final int? publishedVersionNumber;

  DashboardSummary({
    this.arn,
    this.createdTime,
    this.dashboardId,
    this.lastPublishedTime,
    this.lastUpdatedTime,
    this.name,
    this.publishedVersionNumber,
  });

  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    return DashboardSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dashboardId: json['DashboardId'] as String?,
      lastPublishedTime: timeStampFromJson(json['LastPublishedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      publishedVersionNumber: json['PublishedVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final dashboardId = this.dashboardId;
    final lastPublishedTime = this.lastPublishedTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final publishedVersionNumber = this.publishedVersionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (lastPublishedTime != null)
        'LastPublishedTime': unixTimestampToJson(lastPublishedTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (publishedVersionNumber != null)
        'PublishedVersionNumber': publishedVersionNumber,
    };
  }
}

enum DashboardUIState {
  expanded,
  collapsed,
}

extension on DashboardUIState {
  String toValue() {
    switch (this) {
      case DashboardUIState.expanded:
        return 'EXPANDED';
      case DashboardUIState.collapsed:
        return 'COLLAPSED';
    }
  }
}

extension on String {
  DashboardUIState toDashboardUIState() {
    switch (this) {
      case 'EXPANDED':
        return DashboardUIState.expanded;
      case 'COLLAPSED':
        return DashboardUIState.collapsed;
    }
    throw Exception('$this is not known in enum DashboardUIState');
  }
}

/// Dashboard version.
class DashboardVersion {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The time that this dashboard version was created.
  final DateTime? createdTime;

  /// The Amazon Resource Numbers (ARNs) for the datasets that are associated with
  /// this version of the dashboard.
  final List<String>? dataSetArns;

  /// Description.
  final String? description;

  /// Errors associated with this dashboard version.
  final List<DashboardError>? errors;

  /// A list of the associated sheets with the unique identifier and name of each
  /// sheet.
  final List<Sheet>? sheets;

  /// Source entity ARN.
  final String? sourceEntityArn;

  /// The HTTP status of the request.
  final ResourceStatus? status;

  /// The ARN of the theme associated with a version of the dashboard.
  final String? themeArn;

  /// Version number for this version of the dashboard.
  final int? versionNumber;

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

  factory DashboardVersion.fromJson(Map<String, dynamic> json) {
    return DashboardVersion(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dataSetArns: (json['DataSetArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['Description'] as String?,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => DashboardError.fromJson(e as Map<String, dynamic>))
          .toList(),
      sheets: (json['Sheets'] as List?)
          ?.whereNotNull()
          .map((e) => Sheet.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceEntityArn: json['SourceEntityArn'] as String?,
      status: (json['Status'] as String?)?.toResourceStatus(),
      themeArn: json['ThemeArn'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final dataSetArns = this.dataSetArns;
    final description = this.description;
    final errors = this.errors;
    final sheets = this.sheets;
    final sourceEntityArn = this.sourceEntityArn;
    final status = this.status;
    final themeArn = this.themeArn;
    final versionNumber = this.versionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dataSetArns != null) 'DataSetArns': dataSetArns,
      if (description != null) 'Description': description,
      if (errors != null) 'Errors': errors,
      if (sheets != null) 'Sheets': sheets,
      if (sourceEntityArn != null) 'SourceEntityArn': sourceEntityArn,
      if (status != null) 'Status': status.toValue(),
      if (themeArn != null) 'ThemeArn': themeArn,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// Dashboard version summary.
class DashboardVersionSummary {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The time that this dashboard version was created.
  final DateTime? createdTime;

  /// Description.
  final String? description;

  /// Source entity ARN.
  final String? sourceEntityArn;

  /// The HTTP status of the request.
  final ResourceStatus? status;

  /// Version number.
  final int? versionNumber;

  DashboardVersionSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.sourceEntityArn,
    this.status,
    this.versionNumber,
  });

  factory DashboardVersionSummary.fromJson(Map<String, dynamic> json) {
    return DashboardVersionSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      sourceEntityArn: json['SourceEntityArn'] as String?,
      status: (json['Status'] as String?)?.toResourceStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final sourceEntityArn = this.sourceEntityArn;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (sourceEntityArn != null) 'SourceEntityArn': sourceEntityArn,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// The theme colors that are used for data colors in charts. The colors
/// description is a hexadecimal color code that consists of six alphanumerical
/// characters, prefixed with <code>#</code>, for example #37BFF5.
class DataColorPalette {
  /// The hexadecimal codes for the colors.
  final List<String>? colors;

  /// The hexadecimal code of a color that applies to charts where a lack of data
  /// is highlighted.
  final String? emptyFillColor;

  /// The minimum and maximum hexadecimal codes that describe a color gradient.
  final List<String>? minMaxGradient;

  DataColorPalette({
    this.colors,
    this.emptyFillColor,
    this.minMaxGradient,
  });

  factory DataColorPalette.fromJson(Map<String, dynamic> json) {
    return DataColorPalette(
      colors: (json['Colors'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      emptyFillColor: json['EmptyFillColor'] as String?,
      minMaxGradient: (json['MinMaxGradient'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final colors = this.colors;
    final emptyFillColor = this.emptyFillColor;
    final minMaxGradient = this.minMaxGradient;
    return {
      if (colors != null) 'Colors': colors,
      if (emptyFillColor != null) 'EmptyFillColor': emptyFillColor,
      if (minMaxGradient != null) 'MinMaxGradient': minMaxGradient,
    };
  }
}

/// Dataset.
class DataSet {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// Groupings of columns that work together in certain Amazon QuickSight
  /// features. Currently, only geospatial hierarchy is supported.
  final List<ColumnGroup>? columnGroups;

  /// A set of one or more definitions of a <code>
  /// <a>ColumnLevelPermissionRule</a> </code>.
  final List<ColumnLevelPermissionRule>? columnLevelPermissionRules;

  /// The amount of SPICE capacity used by this dataset. This is 0 if the dataset
  /// isn't imported into SPICE.
  final int? consumedSpiceCapacityInBytes;

  /// The time that this dataset was created.
  final DateTime? createdTime;

  /// The ID of the dataset.
  final String? dataSetId;

  /// The folder that contains fields and nested subfolders for your dataset.
  final Map<String, FieldFolder>? fieldFolders;

  /// A value that indicates whether you want to import the data into SPICE.
  final DataSetImportMode? importMode;

  /// The last time that this dataset was updated.
  final DateTime? lastUpdatedTime;

  /// Configures the combination and transformation of the data from the physical
  /// tables.
  final Map<String, LogicalTable>? logicalTableMap;

  /// A display name for the dataset.
  final String? name;

  /// The list of columns after all transforms. These columns are available in
  /// templates, analyses, and dashboards.
  final List<OutputColumn>? outputColumns;

  /// Declares the physical tables that are available in the underlying data
  /// sources.
  final Map<String, PhysicalTable>? physicalTableMap;

  /// The row-level security configuration for the dataset.
  final RowLevelPermissionDataSet? rowLevelPermissionDataSet;

  DataSet({
    this.arn,
    this.columnGroups,
    this.columnLevelPermissionRules,
    this.consumedSpiceCapacityInBytes,
    this.createdTime,
    this.dataSetId,
    this.fieldFolders,
    this.importMode,
    this.lastUpdatedTime,
    this.logicalTableMap,
    this.name,
    this.outputColumns,
    this.physicalTableMap,
    this.rowLevelPermissionDataSet,
  });

  factory DataSet.fromJson(Map<String, dynamic> json) {
    return DataSet(
      arn: json['Arn'] as String?,
      columnGroups: (json['ColumnGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      columnLevelPermissionRules: (json['ColumnLevelPermissionRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ColumnLevelPermissionRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumedSpiceCapacityInBytes:
          json['ConsumedSpiceCapacityInBytes'] as int?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dataSetId: json['DataSetId'] as String?,
      fieldFolders: (json['FieldFolders'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, FieldFolder.fromJson(e as Map<String, dynamic>))),
      importMode: (json['ImportMode'] as String?)?.toDataSetImportMode(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      logicalTableMap: (json['LogicalTableMap'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, LogicalTable.fromJson(e as Map<String, dynamic>))),
      name: json['Name'] as String?,
      outputColumns: (json['OutputColumns'] as List?)
          ?.whereNotNull()
          .map((e) => OutputColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      physicalTableMap: (json['PhysicalTableMap'] as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, PhysicalTable.fromJson(e as Map<String, dynamic>))),
      rowLevelPermissionDataSet: json['RowLevelPermissionDataSet'] != null
          ? RowLevelPermissionDataSet.fromJson(
              json['RowLevelPermissionDataSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final columnGroups = this.columnGroups;
    final columnLevelPermissionRules = this.columnLevelPermissionRules;
    final consumedSpiceCapacityInBytes = this.consumedSpiceCapacityInBytes;
    final createdTime = this.createdTime;
    final dataSetId = this.dataSetId;
    final fieldFolders = this.fieldFolders;
    final importMode = this.importMode;
    final lastUpdatedTime = this.lastUpdatedTime;
    final logicalTableMap = this.logicalTableMap;
    final name = this.name;
    final outputColumns = this.outputColumns;
    final physicalTableMap = this.physicalTableMap;
    final rowLevelPermissionDataSet = this.rowLevelPermissionDataSet;
    return {
      if (arn != null) 'Arn': arn,
      if (columnGroups != null) 'ColumnGroups': columnGroups,
      if (columnLevelPermissionRules != null)
        'ColumnLevelPermissionRules': columnLevelPermissionRules,
      if (consumedSpiceCapacityInBytes != null)
        'ConsumedSpiceCapacityInBytes': consumedSpiceCapacityInBytes,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (fieldFolders != null) 'FieldFolders': fieldFolders,
      if (importMode != null) 'ImportMode': importMode.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (logicalTableMap != null) 'LogicalTableMap': logicalTableMap,
      if (name != null) 'Name': name,
      if (outputColumns != null) 'OutputColumns': outputColumns,
      if (physicalTableMap != null) 'PhysicalTableMap': physicalTableMap,
      if (rowLevelPermissionDataSet != null)
        'RowLevelPermissionDataSet': rowLevelPermissionDataSet,
    };
  }
}

/// Dataset configuration.
class DataSetConfiguration {
  /// A structure containing the list of column group schemas.
  final List<ColumnGroupSchema>? columnGroupSchemaList;

  /// Dataset schema.
  final DataSetSchema? dataSetSchema;

  /// Placeholder.
  final String? placeholder;

  DataSetConfiguration({
    this.columnGroupSchemaList,
    this.dataSetSchema,
    this.placeholder,
  });

  factory DataSetConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSetConfiguration(
      columnGroupSchemaList: (json['ColumnGroupSchemaList'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnGroupSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      dataSetSchema: json['DataSetSchema'] != null
          ? DataSetSchema.fromJson(
              json['DataSetSchema'] as Map<String, dynamic>)
          : null,
      placeholder: json['Placeholder'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnGroupSchemaList = this.columnGroupSchemaList;
    final dataSetSchema = this.dataSetSchema;
    final placeholder = this.placeholder;
    return {
      if (columnGroupSchemaList != null)
        'ColumnGroupSchemaList': columnGroupSchemaList,
      if (dataSetSchema != null) 'DataSetSchema': dataSetSchema,
      if (placeholder != null) 'Placeholder': placeholder,
    };
  }
}

enum DataSetImportMode {
  spice,
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
  }
}

extension on String {
  DataSetImportMode toDataSetImportMode() {
    switch (this) {
      case 'SPICE':
        return DataSetImportMode.spice;
      case 'DIRECT_QUERY':
        return DataSetImportMode.directQuery;
    }
    throw Exception('$this is not known in enum DataSetImportMode');
  }
}

/// Dataset reference.
class DataSetReference {
  /// Dataset Amazon Resource Name (ARN).
  final String dataSetArn;

  /// Dataset placeholder.
  final String dataSetPlaceholder;

  DataSetReference({
    required this.dataSetArn,
    required this.dataSetPlaceholder,
  });

  factory DataSetReference.fromJson(Map<String, dynamic> json) {
    return DataSetReference(
      dataSetArn: json['DataSetArn'] as String,
      dataSetPlaceholder: json['DataSetPlaceholder'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetArn = this.dataSetArn;
    final dataSetPlaceholder = this.dataSetPlaceholder;
    return {
      'DataSetArn': dataSetArn,
      'DataSetPlaceholder': dataSetPlaceholder,
    };
  }
}

/// Dataset schema.
class DataSetSchema {
  /// A structure containing the list of column schemas.
  final List<ColumnSchema>? columnSchemaList;

  DataSetSchema({
    this.columnSchemaList,
  });

  factory DataSetSchema.fromJson(Map<String, dynamic> json) {
    return DataSetSchema(
      columnSchemaList: (json['ColumnSchemaList'] as List?)
          ?.whereNotNull()
          .map((e) => ColumnSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnSchemaList = this.columnSchemaList;
    return {
      if (columnSchemaList != null) 'ColumnSchemaList': columnSchemaList,
    };
  }
}

/// Dataset summary.
class DataSetSummary {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? arn;

  /// A value that indicates if the dataset has column level permission
  /// configured.
  final bool? columnLevelPermissionRulesApplied;

  /// The time that this dataset was created.
  final DateTime? createdTime;

  /// The ID of the dataset.
  final String? dataSetId;

  /// A value that indicates whether you want to import the data into SPICE.
  final DataSetImportMode? importMode;

  /// The last time that this dataset was updated.
  final DateTime? lastUpdatedTime;

  /// A display name for the dataset.
  final String? name;

  /// The row-level security configuration for the dataset.
  final RowLevelPermissionDataSet? rowLevelPermissionDataSet;

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

  factory DataSetSummary.fromJson(Map<String, dynamic> json) {
    return DataSetSummary(
      arn: json['Arn'] as String?,
      columnLevelPermissionRulesApplied:
          json['ColumnLevelPermissionRulesApplied'] as bool?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dataSetId: json['DataSetId'] as String?,
      importMode: (json['ImportMode'] as String?)?.toDataSetImportMode(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      rowLevelPermissionDataSet: json['RowLevelPermissionDataSet'] != null
          ? RowLevelPermissionDataSet.fromJson(
              json['RowLevelPermissionDataSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final columnLevelPermissionRulesApplied =
        this.columnLevelPermissionRulesApplied;
    final createdTime = this.createdTime;
    final dataSetId = this.dataSetId;
    final importMode = this.importMode;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final rowLevelPermissionDataSet = this.rowLevelPermissionDataSet;
    return {
      if (arn != null) 'Arn': arn,
      if (columnLevelPermissionRulesApplied != null)
        'ColumnLevelPermissionRulesApplied': columnLevelPermissionRulesApplied,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (importMode != null) 'ImportMode': importMode.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (rowLevelPermissionDataSet != null)
        'RowLevelPermissionDataSet': rowLevelPermissionDataSet,
    };
  }
}

/// The structure of a data source.
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
  final List<DataSourceParameters>? alternateDataSourceParameters;

  /// The Amazon Resource Name (ARN) of the data source.
  final String? arn;

  /// The time that this data source was created.
  final DateTime? createdTime;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  final String? dataSourceId;

  /// The parameters that Amazon QuickSight uses to connect to your underlying
  /// source. This is a variant type structure. For this structure to be valid,
  /// only one of the attributes can be non-null.
  final DataSourceParameters? dataSourceParameters;

  /// Error information from the last update or the creation of the data source.
  final DataSourceErrorInfo? errorInfo;

  /// The last time that this data source was updated.
  final DateTime? lastUpdatedTime;

  /// A display name for the data source.
  final String? name;

  /// Secure Socket Layer (SSL) properties that apply when QuickSight connects to
  /// your underlying source.
  final SslProperties? sslProperties;

  /// The HTTP status of the request.
  final ResourceStatus? status;

  /// The type of the data source. This type indicates which database engine the
  /// data source connects to.
  final DataSourceType? type;

  /// The VPC connection information. You need to use this parameter only when you
  /// want QuickSight to use a VPC connection when connecting to your underlying
  /// source.
  final VpcConnectionProperties? vpcConnectionProperties;

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

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      alternateDataSourceParameters: (json['AlternateDataSourceParameters']
              as List?)
          ?.whereNotNull()
          .map((e) => DataSourceParameters.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      dataSourceId: json['DataSourceId'] as String?,
      dataSourceParameters: json['DataSourceParameters'] != null
          ? DataSourceParameters.fromJson(
              json['DataSourceParameters'] as Map<String, dynamic>)
          : null,
      errorInfo: json['ErrorInfo'] != null
          ? DataSourceErrorInfo.fromJson(
              json['ErrorInfo'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      sslProperties: json['SslProperties'] != null
          ? SslProperties.fromJson(
              json['SslProperties'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toResourceStatus(),
      type: (json['Type'] as String?)?.toDataSourceType(),
      vpcConnectionProperties: json['VpcConnectionProperties'] != null
          ? VpcConnectionProperties.fromJson(
              json['VpcConnectionProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alternateDataSourceParameters = this.alternateDataSourceParameters;
    final arn = this.arn;
    final createdTime = this.createdTime;
    final dataSourceId = this.dataSourceId;
    final dataSourceParameters = this.dataSourceParameters;
    final errorInfo = this.errorInfo;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final sslProperties = this.sslProperties;
    final status = this.status;
    final type = this.type;
    final vpcConnectionProperties = this.vpcConnectionProperties;
    return {
      if (alternateDataSourceParameters != null)
        'AlternateDataSourceParameters': alternateDataSourceParameters,
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (dataSourceParameters != null)
        'DataSourceParameters': dataSourceParameters,
      if (errorInfo != null) 'ErrorInfo': errorInfo,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (sslProperties != null) 'SslProperties': sslProperties,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (vpcConnectionProperties != null)
        'VpcConnectionProperties': vpcConnectionProperties,
    };
  }
}

/// Data source credentials. This is a variant type structure. For this
/// structure to be valid, only one of the attributes can be non-null.
class DataSourceCredentials {
  /// The Amazon Resource Name (ARN) of a data source that has the credential pair
  /// that you want to use. When <code>CopySourceArn</code> is not null, the
  /// credential pair from the data source in the ARN is used as the credentials
  /// for the <code>DataSourceCredentials</code> structure.
  final String? copySourceArn;

  /// Credential pair. For more information, see <a>CredentialPair</a>.
  final CredentialPair? credentialPair;

  DataSourceCredentials({
    this.copySourceArn,
    this.credentialPair,
  });

  factory DataSourceCredentials.fromJson(Map<String, dynamic> json) {
    return DataSourceCredentials(
      copySourceArn: json['CopySourceArn'] as String?,
      credentialPair: json['CredentialPair'] != null
          ? CredentialPair.fromJson(
              json['CredentialPair'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final copySourceArn = this.copySourceArn;
    final credentialPair = this.credentialPair;
    return {
      if (copySourceArn != null) 'CopySourceArn': copySourceArn,
      if (credentialPair != null) 'CredentialPair': credentialPair,
    };
  }
}

/// Error information for the data source creation or update.
class DataSourceErrorInfo {
  /// Error message.
  final String? message;

  /// Error type.
  final DataSourceErrorInfoType? type;

  DataSourceErrorInfo({
    this.message,
    this.type,
  });

  factory DataSourceErrorInfo.fromJson(Map<String, dynamic> json) {
    return DataSourceErrorInfo(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toDataSourceErrorInfoType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum DataSourceErrorInfoType {
  accessDenied,
  copySourceNotFound,
  timeout,
  engineVersionNotSupported,
  unknownHost,
  genericSqlFailure,
  conflict,
  unknown,
}

extension on DataSourceErrorInfoType {
  String toValue() {
    switch (this) {
      case DataSourceErrorInfoType.accessDenied:
        return 'ACCESS_DENIED';
      case DataSourceErrorInfoType.copySourceNotFound:
        return 'COPY_SOURCE_NOT_FOUND';
      case DataSourceErrorInfoType.timeout:
        return 'TIMEOUT';
      case DataSourceErrorInfoType.engineVersionNotSupported:
        return 'ENGINE_VERSION_NOT_SUPPORTED';
      case DataSourceErrorInfoType.unknownHost:
        return 'UNKNOWN_HOST';
      case DataSourceErrorInfoType.genericSqlFailure:
        return 'GENERIC_SQL_FAILURE';
      case DataSourceErrorInfoType.conflict:
        return 'CONFLICT';
      case DataSourceErrorInfoType.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  DataSourceErrorInfoType toDataSourceErrorInfoType() {
    switch (this) {
      case 'ACCESS_DENIED':
        return DataSourceErrorInfoType.accessDenied;
      case 'COPY_SOURCE_NOT_FOUND':
        return DataSourceErrorInfoType.copySourceNotFound;
      case 'TIMEOUT':
        return DataSourceErrorInfoType.timeout;
      case 'ENGINE_VERSION_NOT_SUPPORTED':
        return DataSourceErrorInfoType.engineVersionNotSupported;
      case 'UNKNOWN_HOST':
        return DataSourceErrorInfoType.unknownHost;
      case 'GENERIC_SQL_FAILURE':
        return DataSourceErrorInfoType.genericSqlFailure;
      case 'CONFLICT':
        return DataSourceErrorInfoType.conflict;
      case 'UNKNOWN':
        return DataSourceErrorInfoType.unknown;
    }
    throw Exception('$this is not known in enum DataSourceErrorInfoType');
  }
}

/// The parameters that Amazon QuickSight uses to connect to your underlying
/// data source. This is a variant type structure. For this structure to be
/// valid, only one of the attributes can be non-null.
class DataSourceParameters {
  /// Amazon Elasticsearch Service parameters.
  final AmazonElasticsearchParameters? amazonElasticsearchParameters;

  /// Amazon Athena parameters.
  final AthenaParameters? athenaParameters;

  /// Amazon Aurora MySQL parameters.
  final AuroraParameters? auroraParameters;

  /// Aurora PostgreSQL parameters.
  final AuroraPostgreSqlParameters? auroraPostgreSqlParameters;

  /// AWS IoT Analytics parameters.
  final AwsIotAnalyticsParameters? awsIotAnalyticsParameters;

  /// Jira parameters.
  final JiraParameters? jiraParameters;

  /// MariaDB parameters.
  final MariaDbParameters? mariaDbParameters;

  /// MySQL parameters.
  final MySqlParameters? mySqlParameters;

  /// Oracle parameters.
  final OracleParameters? oracleParameters;

  /// PostgreSQL parameters.
  final PostgreSqlParameters? postgreSqlParameters;

  /// Presto parameters.
  final PrestoParameters? prestoParameters;

  /// Amazon RDS parameters.
  final RdsParameters? rdsParameters;

  /// Amazon Redshift parameters.
  final RedshiftParameters? redshiftParameters;

  /// S3 parameters.
  final S3Parameters? s3Parameters;

  /// ServiceNow parameters.
  final ServiceNowParameters? serviceNowParameters;

  /// Snowflake parameters.
  final SnowflakeParameters? snowflakeParameters;

  /// Spark parameters.
  final SparkParameters? sparkParameters;

  /// SQL Server parameters.
  final SqlServerParameters? sqlServerParameters;

  /// Teradata parameters.
  final TeradataParameters? teradataParameters;

  /// Twitter parameters.
  final TwitterParameters? twitterParameters;

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

  factory DataSourceParameters.fromJson(Map<String, dynamic> json) {
    return DataSourceParameters(
      amazonElasticsearchParameters:
          json['AmazonElasticsearchParameters'] != null
              ? AmazonElasticsearchParameters.fromJson(
                  json['AmazonElasticsearchParameters'] as Map<String, dynamic>)
              : null,
      athenaParameters: json['AthenaParameters'] != null
          ? AthenaParameters.fromJson(
              json['AthenaParameters'] as Map<String, dynamic>)
          : null,
      auroraParameters: json['AuroraParameters'] != null
          ? AuroraParameters.fromJson(
              json['AuroraParameters'] as Map<String, dynamic>)
          : null,
      auroraPostgreSqlParameters: json['AuroraPostgreSqlParameters'] != null
          ? AuroraPostgreSqlParameters.fromJson(
              json['AuroraPostgreSqlParameters'] as Map<String, dynamic>)
          : null,
      awsIotAnalyticsParameters: json['AwsIotAnalyticsParameters'] != null
          ? AwsIotAnalyticsParameters.fromJson(
              json['AwsIotAnalyticsParameters'] as Map<String, dynamic>)
          : null,
      jiraParameters: json['JiraParameters'] != null
          ? JiraParameters.fromJson(
              json['JiraParameters'] as Map<String, dynamic>)
          : null,
      mariaDbParameters: json['MariaDbParameters'] != null
          ? MariaDbParameters.fromJson(
              json['MariaDbParameters'] as Map<String, dynamic>)
          : null,
      mySqlParameters: json['MySqlParameters'] != null
          ? MySqlParameters.fromJson(
              json['MySqlParameters'] as Map<String, dynamic>)
          : null,
      oracleParameters: json['OracleParameters'] != null
          ? OracleParameters.fromJson(
              json['OracleParameters'] as Map<String, dynamic>)
          : null,
      postgreSqlParameters: json['PostgreSqlParameters'] != null
          ? PostgreSqlParameters.fromJson(
              json['PostgreSqlParameters'] as Map<String, dynamic>)
          : null,
      prestoParameters: json['PrestoParameters'] != null
          ? PrestoParameters.fromJson(
              json['PrestoParameters'] as Map<String, dynamic>)
          : null,
      rdsParameters: json['RdsParameters'] != null
          ? RdsParameters.fromJson(
              json['RdsParameters'] as Map<String, dynamic>)
          : null,
      redshiftParameters: json['RedshiftParameters'] != null
          ? RedshiftParameters.fromJson(
              json['RedshiftParameters'] as Map<String, dynamic>)
          : null,
      s3Parameters: json['S3Parameters'] != null
          ? S3Parameters.fromJson(json['S3Parameters'] as Map<String, dynamic>)
          : null,
      serviceNowParameters: json['ServiceNowParameters'] != null
          ? ServiceNowParameters.fromJson(
              json['ServiceNowParameters'] as Map<String, dynamic>)
          : null,
      snowflakeParameters: json['SnowflakeParameters'] != null
          ? SnowflakeParameters.fromJson(
              json['SnowflakeParameters'] as Map<String, dynamic>)
          : null,
      sparkParameters: json['SparkParameters'] != null
          ? SparkParameters.fromJson(
              json['SparkParameters'] as Map<String, dynamic>)
          : null,
      sqlServerParameters: json['SqlServerParameters'] != null
          ? SqlServerParameters.fromJson(
              json['SqlServerParameters'] as Map<String, dynamic>)
          : null,
      teradataParameters: json['TeradataParameters'] != null
          ? TeradataParameters.fromJson(
              json['TeradataParameters'] as Map<String, dynamic>)
          : null,
      twitterParameters: json['TwitterParameters'] != null
          ? TwitterParameters.fromJson(
              json['TwitterParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonElasticsearchParameters = this.amazonElasticsearchParameters;
    final athenaParameters = this.athenaParameters;
    final auroraParameters = this.auroraParameters;
    final auroraPostgreSqlParameters = this.auroraPostgreSqlParameters;
    final awsIotAnalyticsParameters = this.awsIotAnalyticsParameters;
    final jiraParameters = this.jiraParameters;
    final mariaDbParameters = this.mariaDbParameters;
    final mySqlParameters = this.mySqlParameters;
    final oracleParameters = this.oracleParameters;
    final postgreSqlParameters = this.postgreSqlParameters;
    final prestoParameters = this.prestoParameters;
    final rdsParameters = this.rdsParameters;
    final redshiftParameters = this.redshiftParameters;
    final s3Parameters = this.s3Parameters;
    final serviceNowParameters = this.serviceNowParameters;
    final snowflakeParameters = this.snowflakeParameters;
    final sparkParameters = this.sparkParameters;
    final sqlServerParameters = this.sqlServerParameters;
    final teradataParameters = this.teradataParameters;
    final twitterParameters = this.twitterParameters;
    return {
      if (amazonElasticsearchParameters != null)
        'AmazonElasticsearchParameters': amazonElasticsearchParameters,
      if (athenaParameters != null) 'AthenaParameters': athenaParameters,
      if (auroraParameters != null) 'AuroraParameters': auroraParameters,
      if (auroraPostgreSqlParameters != null)
        'AuroraPostgreSqlParameters': auroraPostgreSqlParameters,
      if (awsIotAnalyticsParameters != null)
        'AwsIotAnalyticsParameters': awsIotAnalyticsParameters,
      if (jiraParameters != null) 'JiraParameters': jiraParameters,
      if (mariaDbParameters != null) 'MariaDbParameters': mariaDbParameters,
      if (mySqlParameters != null) 'MySqlParameters': mySqlParameters,
      if (oracleParameters != null) 'OracleParameters': oracleParameters,
      if (postgreSqlParameters != null)
        'PostgreSqlParameters': postgreSqlParameters,
      if (prestoParameters != null) 'PrestoParameters': prestoParameters,
      if (rdsParameters != null) 'RdsParameters': rdsParameters,
      if (redshiftParameters != null) 'RedshiftParameters': redshiftParameters,
      if (s3Parameters != null) 'S3Parameters': s3Parameters,
      if (serviceNowParameters != null)
        'ServiceNowParameters': serviceNowParameters,
      if (snowflakeParameters != null)
        'SnowflakeParameters': snowflakeParameters,
      if (sparkParameters != null) 'SparkParameters': sparkParameters,
      if (sqlServerParameters != null)
        'SqlServerParameters': sqlServerParameters,
      if (teradataParameters != null) 'TeradataParameters': teradataParameters,
      if (twitterParameters != null) 'TwitterParameters': twitterParameters,
    };
  }
}

enum DataSourceType {
  adobeAnalytics,
  amazonElasticsearch,
  athena,
  aurora,
  auroraPostgresql,
  awsIotAnalytics,
  github,
  jira,
  mariadb,
  mysql,
  oracle,
  postgresql,
  presto,
  redshift,
  s3,
  salesforce,
  servicenow,
  snowflake,
  spark,
  sqlserver,
  teradata,
  twitter,
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
  }
}

extension on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'ADOBE_ANALYTICS':
        return DataSourceType.adobeAnalytics;
      case 'AMAZON_ELASTICSEARCH':
        return DataSourceType.amazonElasticsearch;
      case 'ATHENA':
        return DataSourceType.athena;
      case 'AURORA':
        return DataSourceType.aurora;
      case 'AURORA_POSTGRESQL':
        return DataSourceType.auroraPostgresql;
      case 'AWS_IOT_ANALYTICS':
        return DataSourceType.awsIotAnalytics;
      case 'GITHUB':
        return DataSourceType.github;
      case 'JIRA':
        return DataSourceType.jira;
      case 'MARIADB':
        return DataSourceType.mariadb;
      case 'MYSQL':
        return DataSourceType.mysql;
      case 'ORACLE':
        return DataSourceType.oracle;
      case 'POSTGRESQL':
        return DataSourceType.postgresql;
      case 'PRESTO':
        return DataSourceType.presto;
      case 'REDSHIFT':
        return DataSourceType.redshift;
      case 'S3':
        return DataSourceType.s3;
      case 'SALESFORCE':
        return DataSourceType.salesforce;
      case 'SERVICENOW':
        return DataSourceType.servicenow;
      case 'SNOWFLAKE':
        return DataSourceType.snowflake;
      case 'SPARK':
        return DataSourceType.spark;
      case 'SQLSERVER':
        return DataSourceType.sqlserver;
      case 'TERADATA':
        return DataSourceType.teradata;
      case 'TWITTER':
        return DataSourceType.twitter;
      case 'TIMESTREAM':
        return DataSourceType.timestream;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

/// A date-time parameter.
class DateTimeParameter {
  /// A display name for the date-time parameter.
  final String name;

  /// The values for the date-time parameter.
  final List<DateTime> values;

  DateTimeParameter({
    required this.name,
    required this.values,
  });

  factory DateTimeParameter.fromJson(Map<String, dynamic> json) {
    return DateTimeParameter(
      name: json['Name'] as String,
      values: (json['Values'] as List)
          .whereNotNull()
          .map(nonNullableTimeStampFromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values.map(unixTimestampToJson).toList(),
    };
  }
}

/// A decimal parameter.
class DecimalParameter {
  /// A display name for the decimal parameter.
  final String name;

  /// The values for the decimal parameter.
  final List<double> values;

  DecimalParameter({
    required this.name,
    required this.values,
  });

  factory DecimalParameter.fromJson(Map<String, dynamic> json) {
    return DecimalParameter(
      name: json['Name'] as String,
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

class DeleteAccountCustomizationResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteAccountCustomizationResponse({
    this.requestId,
    this.status,
  });

  factory DeleteAccountCustomizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteAccountCustomizationResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteAnalysisResponse {
  /// The ID of the deleted analysis.
  final String? analysisId;

  /// The Amazon Resource Name (ARN) of the deleted analysis.
  final String? arn;

  /// The date and time that the analysis is scheduled to be deleted.
  final DateTime? deletionTime;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteAnalysisResponse({
    this.analysisId,
    this.arn,
    this.deletionTime,
    this.requestId,
    this.status,
  });

  factory DeleteAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAnalysisResponse(
      analysisId: json['AnalysisId'] as String?,
      arn: json['Arn'] as String?,
      deletionTime: timeStampFromJson(json['DeletionTime']),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    final arn = this.arn;
    final deletionTime = this.deletionTime;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisId != null) 'AnalysisId': analysisId,
      if (arn != null) 'Arn': arn,
      if (deletionTime != null)
        'DeletionTime': unixTimestampToJson(deletionTime),
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteDashboardResponse {
  /// The Secure Socket Layer (SSL) properties that apply for the resource.
  final String? arn;

  /// The ID of the dashboard.
  final String? dashboardId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteDashboardResponse({
    this.arn,
    this.dashboardId,
    this.requestId,
    this.status,
  });

  factory DeleteDashboardResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDashboardResponse(
      arn: json['Arn'] as String?,
      dashboardId: json['DashboardId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dashboardId = this.dashboardId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteDataSetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? arn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  final String? dataSetId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteDataSetResponse({
    this.arn,
    this.dataSetId,
    this.requestId,
    this.status,
  });

  factory DeleteDataSetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataSetResponse(
      arn: json['Arn'] as String?,
      dataSetId: json['DataSetId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSetId = this.dataSetId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteDataSourceResponse {
  /// The Amazon Resource Name (ARN) of the data source that you deleted.
  final String? arn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  final String? dataSourceId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteDataSourceResponse({
    this.arn,
    this.dataSourceId,
    this.requestId,
    this.status,
  });

  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataSourceResponse(
      arn: json['Arn'] as String?,
      dataSourceId: json['DataSourceId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSourceId = this.dataSourceId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteFolderMembershipResponse {
  /// The request ID.
  final String? requestId;

  /// The status of deleting the asset. If succeeded, the status is <code>SC_OK
  /// (200)</code>.
  final int? status;

  DeleteFolderMembershipResponse({
    this.requestId,
    this.status,
  });

  factory DeleteFolderMembershipResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFolderMembershipResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status,
    };
  }
}

class DeleteFolderResponse {
  /// The Amazon Resource Name of the deleted folder.
  final String? arn;

  /// The folder ID.
  final String? folderId;

  /// The request ID.
  final String? requestId;

  /// The status of deleting the folder. If succeeded, the status is <code>SC_OK
  /// (200)</code>.
  final int? status;

  DeleteFolderResponse({
    this.arn,
    this.folderId,
    this.requestId,
    this.status,
  });

  factory DeleteFolderResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFolderResponse(
      arn: json['Arn'] as String?,
      folderId: json['FolderId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final folderId = this.folderId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (folderId != null) 'FolderId': folderId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteGroupMembershipResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteGroupMembershipResponse({
    this.requestId,
    this.status,
  });

  factory DeleteGroupMembershipResponse.fromJson(Map<String, dynamic> json) {
    return DeleteGroupMembershipResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteGroupResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteGroupResponse({
    this.requestId,
    this.status,
  });

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteGroupResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteIAMPolicyAssignmentResponse {
  /// The name of the assignment.
  final String? assignmentName;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteIAMPolicyAssignmentResponse({
    this.assignmentName,
    this.requestId,
    this.status,
  });

  factory DeleteIAMPolicyAssignmentResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteIAMPolicyAssignmentResponse(
      assignmentName: json['AssignmentName'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentName = this.assignmentName;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (assignmentName != null) 'AssignmentName': assignmentName,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteNamespaceResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteNamespaceResponse({
    this.requestId,
    this.status,
  });

  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNamespaceResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteTemplateAliasResponse {
  /// The name for the template alias.
  final String? aliasName;

  /// The Amazon Resource Name (ARN) of the template you want to delete.
  final String? arn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// An ID for the template associated with the deletion.
  final String? templateId;

  DeleteTemplateAliasResponse({
    this.aliasName,
    this.arn,
    this.requestId,
    this.status,
    this.templateId,
  });

  factory DeleteTemplateAliasResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTemplateAliasResponse(
      aliasName: json['AliasName'] as String?,
      arn: json['Arn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasName = this.aliasName;
    final arn = this.arn;
    final requestId = this.requestId;
    final status = this.status;
    final templateId = this.templateId;
    return {
      if (aliasName != null) 'AliasName': aliasName,
      if (arn != null) 'Arn': arn,
      if (requestId != null) 'RequestId': requestId,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class DeleteTemplateResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// An ID for the template.
  final String? templateId;

  DeleteTemplateResponse({
    this.arn,
    this.requestId,
    this.status,
    this.templateId,
  });

  factory DeleteTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTemplateResponse(
      arn: json['Arn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final requestId = this.requestId;
    final status = this.status;
    final templateId = this.templateId;
    return {
      if (arn != null) 'Arn': arn,
      if (requestId != null) 'RequestId': requestId,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class DeleteThemeAliasResponse {
  /// The name for the theme alias.
  final String? aliasName;

  /// The Amazon Resource Name (ARN) of the theme resource using the deleted
  /// alias.
  final String? arn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// An ID for the theme associated with the deletion.
  final String? themeId;

  DeleteThemeAliasResponse({
    this.aliasName,
    this.arn,
    this.requestId,
    this.status,
    this.themeId,
  });

  factory DeleteThemeAliasResponse.fromJson(Map<String, dynamic> json) {
    return DeleteThemeAliasResponse(
      aliasName: json['AliasName'] as String?,
      arn: json['Arn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeId: json['ThemeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasName = this.aliasName;
    final arn = this.arn;
    final requestId = this.requestId;
    final status = this.status;
    final themeId = this.themeId;
    return {
      if (aliasName != null) 'AliasName': aliasName,
      if (arn != null) 'Arn': arn,
      if (requestId != null) 'RequestId': requestId,
      if (themeId != null) 'ThemeId': themeId,
    };
  }
}

class DeleteThemeResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// An ID for the theme.
  final String? themeId;

  DeleteThemeResponse({
    this.arn,
    this.requestId,
    this.status,
    this.themeId,
  });

  factory DeleteThemeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteThemeResponse(
      arn: json['Arn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeId: json['ThemeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final requestId = this.requestId;
    final status = this.status;
    final themeId = this.themeId;
    return {
      if (arn != null) 'Arn': arn,
      if (requestId != null) 'RequestId': requestId,
      if (themeId != null) 'ThemeId': themeId,
    };
  }
}

class DeleteUserByPrincipalIdResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteUserByPrincipalIdResponse({
    this.requestId,
    this.status,
  });

  factory DeleteUserByPrincipalIdResponse.fromJson(Map<String, dynamic> json) {
    return DeleteUserByPrincipalIdResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DeleteUserResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DeleteUserResponse({
    this.requestId,
    this.status,
  });

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) {
    return DeleteUserResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeAccountCustomizationResponse {
  /// The QuickSight customizations that exist in the current AWS Region.
  final AccountCustomization? accountCustomization;

  /// The Amazon Resource Name (ARN) of the customization that's associated with
  /// this AWS account.
  final String? arn;

  /// The ID for the AWS account that you're describing.
  final String? awsAccountId;

  /// The QuickSight namespace that you're describing.
  final String? namespace;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeAccountCustomizationResponse({
    this.accountCustomization,
    this.arn,
    this.awsAccountId,
    this.namespace,
    this.requestId,
    this.status,
  });

  factory DescribeAccountCustomizationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccountCustomizationResponse(
      accountCustomization: json['AccountCustomization'] != null
          ? AccountCustomization.fromJson(
              json['AccountCustomization'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      awsAccountId: json['AwsAccountId'] as String?,
      namespace: json['Namespace'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountCustomization = this.accountCustomization;
    final arn = this.arn;
    final awsAccountId = this.awsAccountId;
    final namespace = this.namespace;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (accountCustomization != null)
        'AccountCustomization': accountCustomization,
      if (arn != null) 'Arn': arn,
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (namespace != null) 'Namespace': namespace,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeAccountSettingsResponse {
  /// The QuickSight settings for this AWS account. This information includes the
  /// edition of Amazon QuickSight that you subscribed to (Standard or Enterprise)
  /// and the notification email for the QuickSight subscription. In the
  /// QuickSight console, the QuickSight subscription is sometimes referred to as
  /// a QuickSight "account" even though it's technically not an account by
  /// itself. Instead, it's a subscription to the QuickSight service for your AWS
  /// account. The edition that you subscribe to applies to QuickSight in every
  /// AWS Region where you use it.
  final AccountSettings? accountSettings;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeAccountSettingsResponse({
    this.accountSettings,
    this.requestId,
    this.status,
  });

  factory DescribeAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccountSettingsResponse(
      accountSettings: json['AccountSettings'] != null
          ? AccountSettings.fromJson(
              json['AccountSettings'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettings = this.accountSettings;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (accountSettings != null) 'AccountSettings': accountSettings,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeAnalysisPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the analysis whose permissions you're
  /// describing.
  final String? analysisArn;

  /// The ID of the analysis whose permissions you're describing.
  final String? analysisId;

  /// A structure that describes the principals and the resource-level permissions
  /// on an analysis.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeAnalysisPermissionsResponse({
    this.analysisArn,
    this.analysisId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory DescribeAnalysisPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAnalysisPermissionsResponse(
      analysisArn: json['AnalysisArn'] as String?,
      analysisId: json['AnalysisId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisArn = this.analysisArn;
    final analysisId = this.analysisId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisArn != null) 'AnalysisArn': analysisArn,
      if (analysisId != null) 'AnalysisId': analysisId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeAnalysisResponse {
  /// A metadata structure that contains summary information for the analysis that
  /// you're describing.
  final Analysis? analysis;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeAnalysisResponse({
    this.analysis,
    this.requestId,
    this.status,
  });

  factory DescribeAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAnalysisResponse(
      analysis: json['Analysis'] != null
          ? Analysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeDashboardPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  final String? dashboardArn;

  /// The ID for the dashboard.
  final String? dashboardId;

  /// A structure that contains the permissions for the dashboard.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeDashboardPermissionsResponse({
    this.dashboardArn,
    this.dashboardId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory DescribeDashboardPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDashboardPermissionsResponse(
      dashboardArn: json['DashboardArn'] as String?,
      dashboardId: json['DashboardId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardId = this.dashboardId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboardArn != null) 'DashboardArn': dashboardArn,
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeDashboardResponse {
  /// Information about the dashboard.
  final Dashboard? dashboard;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of this request.
  final int? status;

  DescribeDashboardResponse({
    this.dashboard,
    this.requestId,
    this.status,
  });

  factory DescribeDashboardResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDashboardResponse(
      dashboard: json['Dashboard'] != null
          ? Dashboard.fromJson(json['Dashboard'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboard = this.dashboard;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboard != null) 'Dashboard': dashboard,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeDataSetPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? dataSetArn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  final String? dataSetId;

  /// A list of resource permissions on the dataset.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeDataSetPermissionsResponse({
    this.dataSetArn,
    this.dataSetId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory DescribeDataSetPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDataSetPermissionsResponse(
      dataSetArn: json['DataSetArn'] as String?,
      dataSetId: json['DataSetId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetArn = this.dataSetArn;
    final dataSetId = this.dataSetId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSetArn != null) 'DataSetArn': dataSetArn,
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeDataSetResponse {
  /// Information on the dataset.
  final DataSet? dataSet;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeDataSetResponse({
    this.dataSet,
    this.requestId,
    this.status,
  });

  factory DescribeDataSetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDataSetResponse(
      dataSet: json['DataSet'] != null
          ? DataSet.fromJson(json['DataSet'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSet = this.dataSet;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSet != null) 'DataSet': dataSet,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeDataSourcePermissionsResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  final String? dataSourceArn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  final String? dataSourceId;

  /// A list of resource permissions on the data source.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeDataSourcePermissionsResponse({
    this.dataSourceArn,
    this.dataSourceId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory DescribeDataSourcePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDataSourcePermissionsResponse(
      dataSourceArn: json['DataSourceArn'] as String?,
      dataSourceId: json['DataSourceId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final dataSourceId = this.dataSourceId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSourceArn != null) 'DataSourceArn': dataSourceArn,
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeDataSourceResponse {
  /// The information on the data source.
  final DataSource? dataSource;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeDataSourceResponse({
    this.dataSource,
    this.requestId,
    this.status,
  });

  factory DescribeDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDataSourceResponse(
      dataSource: json['DataSource'] != null
          ? DataSource.fromJson(json['DataSource'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSource != null) 'DataSource': dataSource,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeFolderPermissionsResponse {
  /// The Amazon Resource Name (ARN) for the folder.
  final String? arn;

  /// The folder ID.
  final String? folderId;

  /// Information about the permissions on the folder.
  final List<ResourcePermission>? permissions;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>.
  final int? status;

  DescribeFolderPermissionsResponse({
    this.arn,
    this.folderId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory DescribeFolderPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFolderPermissionsResponse(
      arn: json['Arn'] as String?,
      folderId: json['FolderId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final folderId = this.folderId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (folderId != null) 'FolderId': folderId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeFolderResolvedPermissionsResponse {
  /// The Amazon Resource Name (ARN).
  final String? arn;

  /// The folder ID.
  final String? folderId;

  /// Information about the permissions on the dashboard.
  final List<ResourcePermission>? permissions;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>
  final int? status;

  DescribeFolderResolvedPermissionsResponse({
    this.arn,
    this.folderId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory DescribeFolderResolvedPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFolderResolvedPermissionsResponse(
      arn: json['Arn'] as String?,
      folderId: json['FolderId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final folderId = this.folderId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (folderId != null) 'FolderId': folderId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeFolderResponse {
  /// Information about the folder.
  final Folder? folder;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK (200)</code>.
  final int? status;

  DescribeFolderResponse({
    this.folder,
    this.requestId,
    this.status,
  });

  factory DescribeFolderResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFolderResponse(
      folder: json['Folder'] != null
          ? Folder.fromJson(json['Folder'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final folder = this.folder;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (folder != null) 'Folder': folder,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeGroupResponse {
  /// The name of the group.
  final Group? group;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });

  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupResponse(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (group != null) 'Group': group,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeIAMPolicyAssignmentResponse {
  /// Information describing the IAM policy assignment.
  final IAMPolicyAssignment? iAMPolicyAssignment;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeIAMPolicyAssignmentResponse({
    this.iAMPolicyAssignment,
    this.requestId,
    this.status,
  });

  factory DescribeIAMPolicyAssignmentResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeIAMPolicyAssignmentResponse(
      iAMPolicyAssignment: json['IAMPolicyAssignment'] != null
          ? IAMPolicyAssignment.fromJson(
              json['IAMPolicyAssignment'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final iAMPolicyAssignment = this.iAMPolicyAssignment;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (iAMPolicyAssignment != null)
        'IAMPolicyAssignment': iAMPolicyAssignment,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeIngestionResponse {
  /// Information about the ingestion.
  final Ingestion? ingestion;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeIngestionResponse({
    this.ingestion,
    this.requestId,
    this.status,
  });

  factory DescribeIngestionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeIngestionResponse(
      ingestion: json['Ingestion'] != null
          ? Ingestion.fromJson(json['Ingestion'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestion = this.ingestion;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (ingestion != null) 'Ingestion': ingestion,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeNamespaceResponse {
  /// The information about the namespace that you're describing. The response
  /// includes the namespace ARN, name, AWS Region, creation status, and identity
  /// store. <code>DescribeNamespace</code> also works for namespaces that are in
  /// the process of being created. For incomplete namespaces, this API operation
  /// lists the namespace error types and messages associated with the creation
  /// process.
  final NamespaceInfoV2? namespace;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  DescribeNamespaceResponse({
    this.namespace,
    this.requestId,
    this.status,
  });

  factory DescribeNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeNamespaceResponse(
      namespace: json['Namespace'] != null
          ? NamespaceInfoV2.fromJson(json['Namespace'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (namespace != null) 'Namespace': namespace,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class DescribeTemplateAliasResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Information about the template alias.
  final TemplateAlias? templateAlias;

  DescribeTemplateAliasResponse({
    this.requestId,
    this.status,
    this.templateAlias,
  });

  factory DescribeTemplateAliasResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTemplateAliasResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateAlias: json['TemplateAlias'] != null
          ? TemplateAlias.fromJson(
              json['TemplateAlias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final templateAlias = this.templateAlias;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (templateAlias != null) 'TemplateAlias': templateAlias,
    };
  }
}

class DescribeTemplatePermissionsResponse {
  /// A list of resource permissions to be set on the template.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The Amazon Resource Name (ARN) of the template.
  final String? templateArn;

  /// The ID for the template.
  final String? templateId;

  DescribeTemplatePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.templateArn,
    this.templateId,
  });

  factory DescribeTemplatePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeTemplatePermissionsResponse(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateArn: json['TemplateArn'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    return {
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
      if (templateArn != null) 'TemplateArn': templateArn,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class DescribeTemplateResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The template structure for the object you want to describe.
  final Template? template;

  DescribeTemplateResponse({
    this.requestId,
    this.status,
    this.template,
  });

  factory DescribeTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTemplateResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      template: json['Template'] != null
          ? Template.fromJson(json['Template'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final template = this.template;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (template != null) 'Template': template,
    };
  }
}

class DescribeThemeAliasResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Information about the theme alias.
  final ThemeAlias? themeAlias;

  DescribeThemeAliasResponse({
    this.requestId,
    this.status,
    this.themeAlias,
  });

  factory DescribeThemeAliasResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThemeAliasResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeAlias: json['ThemeAlias'] != null
          ? ThemeAlias.fromJson(json['ThemeAlias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final themeAlias = this.themeAlias;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (themeAlias != null) 'ThemeAlias': themeAlias,
    };
  }
}

class DescribeThemePermissionsResponse {
  /// A list of resource permissions set on the theme.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The Amazon Resource Name (ARN) of the theme.
  final String? themeArn;

  /// The ID for the theme.
  final String? themeId;

  DescribeThemePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.themeArn,
    this.themeId,
  });

  factory DescribeThemePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThemePermissionsResponse(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeArn: json['ThemeArn'] as String?,
      themeId: json['ThemeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    final themeArn = this.themeArn;
    final themeId = this.themeId;
    return {
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
      if (themeArn != null) 'ThemeArn': themeArn,
      if (themeId != null) 'ThemeId': themeId,
    };
  }
}

class DescribeThemeResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The information about the theme that you are describing.
  final Theme? theme;

  DescribeThemeResponse({
    this.requestId,
    this.status,
    this.theme,
  });

  factory DescribeThemeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThemeResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      theme: json['Theme'] != null
          ? Theme.fromJson(json['Theme'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final theme = this.theme;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (theme != null) 'Theme': theme,
    };
  }
}

class DescribeUserResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The user name.
  final User? user;

  DescribeUserResponse({
    this.requestId,
    this.status,
    this.user,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final user = this.user;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
    };
  }
}

enum Edition {
  standard,
  enterprise,
}

extension on Edition {
  String toValue() {
    switch (this) {
      case Edition.standard:
        return 'STANDARD';
      case Edition.enterprise:
        return 'ENTERPRISE';
    }
  }
}

extension on String {
  Edition toEdition() {
    switch (this) {
      case 'STANDARD':
        return Edition.standard;
      case 'ENTERPRISE':
        return Edition.enterprise;
    }
    throw Exception('$this is not known in enum Edition');
  }
}

enum EmbeddingIdentityType {
  iam,
  quicksight,
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
  }
}

extension on String {
  EmbeddingIdentityType toEmbeddingIdentityType() {
    switch (this) {
      case 'IAM':
        return EmbeddingIdentityType.iam;
      case 'QUICKSIGHT':
        return EmbeddingIdentityType.quicksight;
      case 'ANONYMOUS':
        return EmbeddingIdentityType.anonymous;
    }
    throw Exception('$this is not known in enum EmbeddingIdentityType');
  }
}

/// Error information for the SPICE ingestion of a dataset.
class ErrorInfo {
  /// Error message.
  final String? message;

  /// Error type.
  final IngestionErrorType? type;

  ErrorInfo({
    this.message,
    this.type,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) {
    return ErrorInfo(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toIngestionErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Export to .csv option.
class ExportToCSVOption {
  /// Availability status.
  final DashboardBehavior? availabilityStatus;

  ExportToCSVOption({
    this.availabilityStatus,
  });

  factory ExportToCSVOption.fromJson(Map<String, dynamic> json) {
    return ExportToCSVOption(
      availabilityStatus:
          (json['AvailabilityStatus'] as String?)?.toDashboardBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityStatus = this.availabilityStatus;
    return {
      if (availabilityStatus != null)
        'AvailabilityStatus': availabilityStatus.toValue(),
    };
  }
}

/// A FieldFolder element is a folder that contains fields and nested
/// subfolders.
class FieldFolder {
  /// A folder has a list of columns. A column can only be in one folder.
  final List<String>? columns;

  /// The description for a field folder.
  final String? description;

  FieldFolder({
    this.columns,
    this.description,
  });

  factory FieldFolder.fromJson(Map<String, dynamic> json) {
    return FieldFolder(
      columns: (json['columns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    final description = this.description;
    return {
      if (columns != null) 'columns': columns,
      if (description != null) 'description': description,
    };
  }
}

enum FileFormat {
  csv,
  tsv,
  clf,
  elf,
  xlsx,
  json,
}

extension on FileFormat {
  String toValue() {
    switch (this) {
      case FileFormat.csv:
        return 'CSV';
      case FileFormat.tsv:
        return 'TSV';
      case FileFormat.clf:
        return 'CLF';
      case FileFormat.elf:
        return 'ELF';
      case FileFormat.xlsx:
        return 'XLSX';
      case FileFormat.json:
        return 'JSON';
    }
  }
}

extension on String {
  FileFormat toFileFormat() {
    switch (this) {
      case 'CSV':
        return FileFormat.csv;
      case 'TSV':
        return FileFormat.tsv;
      case 'CLF':
        return FileFormat.clf;
      case 'ELF':
        return FileFormat.elf;
      case 'XLSX':
        return FileFormat.xlsx;
      case 'JSON':
        return FileFormat.json;
    }
    throw Exception('$this is not known in enum FileFormat');
  }
}

/// A transform operation that filters rows based on a condition.
class FilterOperation {
  /// An expression that must evaluate to a Boolean value. Rows for which the
  /// expression evaluates to true are kept in the dataset.
  final String conditionExpression;

  FilterOperation({
    required this.conditionExpression,
  });

  factory FilterOperation.fromJson(Map<String, dynamic> json) {
    return FilterOperation(
      conditionExpression: json['ConditionExpression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionExpression = this.conditionExpression;
    return {
      'ConditionExpression': conditionExpression,
    };
  }
}

enum FilterOperator {
  stringEquals,
}

extension on FilterOperator {
  String toValue() {
    switch (this) {
      case FilterOperator.stringEquals:
        return 'StringEquals';
    }
  }
}

extension on String {
  FilterOperator toFilterOperator() {
    switch (this) {
      case 'StringEquals':
        return FilterOperator.stringEquals;
    }
    throw Exception('$this is not known in enum FilterOperator');
  }
}

/// A folder.
class Folder {
  /// The folder Amazon Resource Name (ARN).
  final String? arn;

  /// The time that the folder was created.
  final DateTime? createdTime;

  /// The folder ID.
  final String? folderId;

  /// An array of ancestor folder ARN strings.
  final List<String>? folderPath;

  /// The type of the folder.
  final FolderType? folderType;

  /// The time that the folder was last updated.
  final DateTime? lastUpdatedTime;

  /// A display name for the folder.
  final String? name;

  Folder({
    this.arn,
    this.createdTime,
    this.folderId,
    this.folderPath,
    this.folderType,
    this.lastUpdatedTime,
    this.name,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      folderId: json['FolderId'] as String?,
      folderPath: (json['FolderPath'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      folderType: (json['FolderType'] as String?)?.toFolderType(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final folderId = this.folderId;
    final folderPath = this.folderPath;
    final folderType = this.folderType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (folderId != null) 'FolderId': folderId,
      if (folderPath != null) 'FolderPath': folderPath,
      if (folderType != null) 'FolderType': folderType.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
    };
  }
}

enum FolderFilterAttribute {
  parentFolderArn,
}

extension on FolderFilterAttribute {
  String toValue() {
    switch (this) {
      case FolderFilterAttribute.parentFolderArn:
        return 'PARENT_FOLDER_ARN';
    }
  }
}

extension on String {
  FolderFilterAttribute toFolderFilterAttribute() {
    switch (this) {
      case 'PARENT_FOLDER_ARN':
        return FolderFilterAttribute.parentFolderArn;
    }
    throw Exception('$this is not known in enum FolderFilterAttribute');
  }
}

/// An asset in a folder, such as a dashboard, analysis, or dataset.
class FolderMember {
  /// The ID of the asset.
  final String? memberId;

  /// The type of the asset.
  final MemberType? memberType;

  FolderMember({
    this.memberId,
    this.memberType,
  });

  factory FolderMember.fromJson(Map<String, dynamic> json) {
    return FolderMember(
      memberId: json['MemberId'] as String?,
      memberType: (json['MemberType'] as String?)?.toMemberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final memberId = this.memberId;
    final memberType = this.memberType;
    return {
      if (memberId != null) 'MemberId': memberId,
      if (memberType != null) 'MemberType': memberType.toValue(),
    };
  }
}

/// Searches a folder by a filter.
class FolderSearchFilter {
  /// The name of the value that you want to use as a filter. For example,
  /// <code>"Name": "PARENT_FOLDER_ARN"</code>.
  final FolderFilterAttribute? name;

  /// The comparison operator that you want to use as a filter. For example,
  /// <code>"Operator": "StringEquals"</code>.
  final FilterOperator? operator;

  /// The value of the named item (in this example,
  /// <code>PARENT_FOLDER_ARN</code>), that you want to use as a filter. For
  /// example, <code>"Value":
  /// "arn:aws:quicksight:us-east-1:1:folder/folderId"</code>.
  final String? value;

  FolderSearchFilter({
    this.name,
    this.operator,
    this.value,
  });

  factory FolderSearchFilter.fromJson(Map<String, dynamic> json) {
    return FolderSearchFilter(
      name: (json['Name'] as String?)?.toFolderFilterAttribute(),
      operator: (json['Operator'] as String?)?.toFilterOperator(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      if (name != null) 'Name': name.toValue(),
      if (operator != null) 'Operator': operator.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// A summary of the folder.
class FolderSummary {
  /// The Amazon Resource Name (ARN).
  final String? arn;

  /// The time that the folder was created.
  final DateTime? createdTime;

  /// The folder ID.
  final String? folderId;

  /// The type of folder.
  final FolderType? folderType;

  /// The time that the folder was last updated.
  final DateTime? lastUpdatedTime;

  /// The display name of the folder.
  final String? name;

  FolderSummary({
    this.arn,
    this.createdTime,
    this.folderId,
    this.folderType,
    this.lastUpdatedTime,
    this.name,
  });

  factory FolderSummary.fromJson(Map<String, dynamic> json) {
    return FolderSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      folderId: json['FolderId'] as String?,
      folderType: (json['FolderType'] as String?)?.toFolderType(),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final folderId = this.folderId;
    final folderType = this.folderType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (folderId != null) 'FolderId': folderId,
      if (folderType != null) 'FolderType': folderType.toValue(),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
    };
  }
}

enum FolderType {
  shared,
}

extension on FolderType {
  String toValue() {
    switch (this) {
      case FolderType.shared:
        return 'SHARED';
    }
  }
}

extension on String {
  FolderType toFolderType() {
    switch (this) {
      case 'SHARED':
        return FolderType.shared;
    }
    throw Exception('$this is not known in enum FolderType');
  }
}

/// Geospatial column group that denotes a hierarchy.
class GeoSpatialColumnGroup {
  /// Columns in this hierarchy.
  final List<String> columns;

  /// Country code.
  final GeoSpatialCountryCode countryCode;

  /// A display name for the hierarchy.
  final String name;

  GeoSpatialColumnGroup({
    required this.columns,
    required this.countryCode,
    required this.name,
  });

  factory GeoSpatialColumnGroup.fromJson(Map<String, dynamic> json) {
    return GeoSpatialColumnGroup(
      columns: (json['Columns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      countryCode: (json['CountryCode'] as String).toGeoSpatialCountryCode(),
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final columns = this.columns;
    final countryCode = this.countryCode;
    final name = this.name;
    return {
      'Columns': columns,
      'CountryCode': countryCode.toValue(),
      'Name': name,
    };
  }
}

enum GeoSpatialCountryCode {
  us,
}

extension on GeoSpatialCountryCode {
  String toValue() {
    switch (this) {
      case GeoSpatialCountryCode.us:
        return 'US';
    }
  }
}

extension on String {
  GeoSpatialCountryCode toGeoSpatialCountryCode() {
    switch (this) {
      case 'US':
        return GeoSpatialCountryCode.us;
    }
    throw Exception('$this is not known in enum GeoSpatialCountryCode');
  }
}

enum GeoSpatialDataRole {
  country,
  state,
  county,
  city,
  postcode,
  longitude,
  latitude,
}

extension on GeoSpatialDataRole {
  String toValue() {
    switch (this) {
      case GeoSpatialDataRole.country:
        return 'COUNTRY';
      case GeoSpatialDataRole.state:
        return 'STATE';
      case GeoSpatialDataRole.county:
        return 'COUNTY';
      case GeoSpatialDataRole.city:
        return 'CITY';
      case GeoSpatialDataRole.postcode:
        return 'POSTCODE';
      case GeoSpatialDataRole.longitude:
        return 'LONGITUDE';
      case GeoSpatialDataRole.latitude:
        return 'LATITUDE';
    }
  }
}

extension on String {
  GeoSpatialDataRole toGeoSpatialDataRole() {
    switch (this) {
      case 'COUNTRY':
        return GeoSpatialDataRole.country;
      case 'STATE':
        return GeoSpatialDataRole.state;
      case 'COUNTY':
        return GeoSpatialDataRole.county;
      case 'CITY':
        return GeoSpatialDataRole.city;
      case 'POSTCODE':
        return GeoSpatialDataRole.postcode;
      case 'LONGITUDE':
        return GeoSpatialDataRole.longitude;
      case 'LATITUDE':
        return GeoSpatialDataRole.latitude;
    }
    throw Exception('$this is not known in enum GeoSpatialDataRole');
  }
}

/// Output returned from the <code>GetDashboardEmbedUrl</code> operation.
class GetDashboardEmbedUrlResponse {
  /// A single-use URL that you can put into your server-side webpage to embed
  /// your dashboard. This URL is valid for 5 minutes. The API operation provides
  /// the URL with an <code>auth_code</code> value that enables one (and only one)
  /// sign-on to a user session that is valid for 10 hours.
  final String? embedUrl;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  GetDashboardEmbedUrlResponse({
    this.embedUrl,
    this.requestId,
    this.status,
  });

  factory GetDashboardEmbedUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetDashboardEmbedUrlResponse(
      embedUrl: json['EmbedUrl'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final embedUrl = this.embedUrl;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (embedUrl != null) 'EmbedUrl': embedUrl,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class GetSessionEmbedUrlResponse {
  /// A single-use URL that you can put into your server-side web page to embed
  /// your QuickSight session. This URL is valid for 5 minutes. The API operation
  /// provides the URL with an <code>auth_code</code> value that enables one (and
  /// only one) sign-on to a user session that is valid for 10 hours.
  final String? embedUrl;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  GetSessionEmbedUrlResponse({
    this.embedUrl,
    this.requestId,
    this.status,
  });

  factory GetSessionEmbedUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionEmbedUrlResponse(
      embedUrl: json['EmbedUrl'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final embedUrl = this.embedUrl;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (embedUrl != null) 'EmbedUrl': embedUrl,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

/// A <i>group</i> in Amazon QuickSight consists of a set of users. You can use
/// groups to make it easier to manage access and security.
class Group {
  /// The Amazon Resource Name (ARN) for the group.
  final String? arn;

  /// The group description.
  final String? description;

  /// The name of the group.
  final String? groupName;

  /// The principal ID of the group.
  final String? principalId;

  Group({
    this.arn,
    this.description,
    this.groupName,
    this.principalId,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      groupName: json['GroupName'] as String?,
      principalId: json['PrincipalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final groupName = this.groupName;
    final principalId = this.principalId;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (groupName != null) 'GroupName': groupName,
      if (principalId != null) 'PrincipalId': principalId,
    };
  }
}

/// A member of an Amazon QuickSight group. Currently, group members must be
/// users. Groups can't be members of another group. .
class GroupMember {
  /// The Amazon Resource Name (ARN) for the group member (user).
  final String? arn;

  /// The name of the group member (user).
  final String? memberName;

  GroupMember({
    this.arn,
    this.memberName,
  });

  factory GroupMember.fromJson(Map<String, dynamic> json) {
    return GroupMember(
      arn: json['Arn'] as String?,
      memberName: json['MemberName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final memberName = this.memberName;
    return {
      if (arn != null) 'Arn': arn,
      if (memberName != null) 'MemberName': memberName,
    };
  }
}

/// The display options for gutter spacing between tiles on a sheet.
class GutterStyle {
  /// This Boolean value controls whether to display a gutter space between sheet
  /// tiles.
  final bool? show;

  GutterStyle({
    this.show,
  });

  factory GutterStyle.fromJson(Map<String, dynamic> json) {
    return GutterStyle(
      show: json['Show'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final show = this.show;
    return {
      if (show != null) 'Show': show,
    };
  }
}

/// An AWS Identity and Access Management (IAM) policy assignment.
class IAMPolicyAssignment {
  /// Assignment ID.
  final String? assignmentId;

  /// Assignment name.
  final String? assignmentName;

  /// Assignment status.
  final AssignmentStatus? assignmentStatus;

  /// The AWS account ID.
  final String? awsAccountId;

  /// Identities.
  final Map<String, List<String>>? identities;

  /// The Amazon Resource Name (ARN) for the IAM policy.
  final String? policyArn;

  IAMPolicyAssignment({
    this.assignmentId,
    this.assignmentName,
    this.assignmentStatus,
    this.awsAccountId,
    this.identities,
    this.policyArn,
  });

  factory IAMPolicyAssignment.fromJson(Map<String, dynamic> json) {
    return IAMPolicyAssignment(
      assignmentId: json['AssignmentId'] as String?,
      assignmentName: json['AssignmentName'] as String?,
      assignmentStatus:
          (json['AssignmentStatus'] as String?)?.toAssignmentStatus(),
      awsAccountId: json['AwsAccountId'] as String?,
      identities: (json['Identities'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      policyArn: json['PolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentId = this.assignmentId;
    final assignmentName = this.assignmentName;
    final assignmentStatus = this.assignmentStatus;
    final awsAccountId = this.awsAccountId;
    final identities = this.identities;
    final policyArn = this.policyArn;
    return {
      if (assignmentId != null) 'AssignmentId': assignmentId,
      if (assignmentName != null) 'AssignmentName': assignmentName,
      if (assignmentStatus != null)
        'AssignmentStatus': assignmentStatus.toValue(),
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (identities != null) 'Identities': identities,
      if (policyArn != null) 'PolicyArn': policyArn,
    };
  }
}

/// IAM policy assignment summary.
class IAMPolicyAssignmentSummary {
  /// Assignment name.
  final String? assignmentName;

  /// Assignment status.
  final AssignmentStatus? assignmentStatus;

  IAMPolicyAssignmentSummary({
    this.assignmentName,
    this.assignmentStatus,
  });

  factory IAMPolicyAssignmentSummary.fromJson(Map<String, dynamic> json) {
    return IAMPolicyAssignmentSummary(
      assignmentName: json['AssignmentName'] as String?,
      assignmentStatus:
          (json['AssignmentStatus'] as String?)?.toAssignmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentName = this.assignmentName;
    final assignmentStatus = this.assignmentStatus;
    return {
      if (assignmentName != null) 'AssignmentName': assignmentName,
      if (assignmentStatus != null)
        'AssignmentStatus': assignmentStatus.toValue(),
    };
  }
}

enum IdentityStore {
  quicksight,
}

extension on IdentityStore {
  String toValue() {
    switch (this) {
      case IdentityStore.quicksight:
        return 'QUICKSIGHT';
    }
  }
}

extension on String {
  IdentityStore toIdentityStore() {
    switch (this) {
      case 'QUICKSIGHT':
        return IdentityStore.quicksight;
    }
    throw Exception('$this is not known in enum IdentityStore');
  }
}

enum IdentityType {
  iam,
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
  }
}

extension on String {
  IdentityType toIdentityType() {
    switch (this) {
      case 'IAM':
        return IdentityType.iam;
      case 'QUICKSIGHT':
        return IdentityType.quicksight;
    }
    throw Exception('$this is not known in enum IdentityType');
  }
}

/// Information about the SPICE ingestion for a dataset.
class Ingestion {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// The time that this ingestion started.
  final DateTime createdTime;

  /// Ingestion status.
  final IngestionStatus ingestionStatus;

  /// Error information for this ingestion.
  final ErrorInfo? errorInfo;

  /// Ingestion ID.
  final String? ingestionId;

  /// The size of the data ingested, in bytes.
  final int? ingestionSizeInBytes;

  /// The time that this ingestion took, measured in seconds.
  final int? ingestionTimeInSeconds;
  final QueueInfo? queueInfo;

  /// Event source for this ingestion.
  final IngestionRequestSource? requestSource;

  /// Type of this ingestion.
  final IngestionRequestType? requestType;
  final RowInfo? rowInfo;

  Ingestion({
    required this.arn,
    required this.createdTime,
    required this.ingestionStatus,
    this.errorInfo,
    this.ingestionId,
    this.ingestionSizeInBytes,
    this.ingestionTimeInSeconds,
    this.queueInfo,
    this.requestSource,
    this.requestType,
    this.rowInfo,
  });

  factory Ingestion.fromJson(Map<String, dynamic> json) {
    return Ingestion(
      arn: json['Arn'] as String,
      createdTime: nonNullableTimeStampFromJson(json['CreatedTime'] as Object),
      ingestionStatus: (json['IngestionStatus'] as String).toIngestionStatus(),
      errorInfo: json['ErrorInfo'] != null
          ? ErrorInfo.fromJson(json['ErrorInfo'] as Map<String, dynamic>)
          : null,
      ingestionId: json['IngestionId'] as String?,
      ingestionSizeInBytes: json['IngestionSizeInBytes'] as int?,
      ingestionTimeInSeconds: json['IngestionTimeInSeconds'] as int?,
      queueInfo: json['QueueInfo'] != null
          ? QueueInfo.fromJson(json['QueueInfo'] as Map<String, dynamic>)
          : null,
      requestSource:
          (json['RequestSource'] as String?)?.toIngestionRequestSource(),
      requestType: (json['RequestType'] as String?)?.toIngestionRequestType(),
      rowInfo: json['RowInfo'] != null
          ? RowInfo.fromJson(json['RowInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final ingestionStatus = this.ingestionStatus;
    final errorInfo = this.errorInfo;
    final ingestionId = this.ingestionId;
    final ingestionSizeInBytes = this.ingestionSizeInBytes;
    final ingestionTimeInSeconds = this.ingestionTimeInSeconds;
    final queueInfo = this.queueInfo;
    final requestSource = this.requestSource;
    final requestType = this.requestType;
    final rowInfo = this.rowInfo;
    return {
      'Arn': arn,
      'CreatedTime': unixTimestampToJson(createdTime),
      'IngestionStatus': ingestionStatus.toValue(),
      if (errorInfo != null) 'ErrorInfo': errorInfo,
      if (ingestionId != null) 'IngestionId': ingestionId,
      if (ingestionSizeInBytes != null)
        'IngestionSizeInBytes': ingestionSizeInBytes,
      if (ingestionTimeInSeconds != null)
        'IngestionTimeInSeconds': ingestionTimeInSeconds,
      if (queueInfo != null) 'QueueInfo': queueInfo,
      if (requestSource != null) 'RequestSource': requestSource.toValue(),
      if (requestType != null) 'RequestType': requestType.toValue(),
      if (rowInfo != null) 'RowInfo': rowInfo,
    };
  }
}

enum IngestionErrorType {
  failureToAssumeRole,
  ingestionSuperseded,
  ingestionCanceled,
  dataSetDeleted,
  dataSetNotSpice,
  s3UploadedFileDeleted,
  s3ManifestError,
  dataToleranceException,
  spiceTableNotFound,
  dataSetSizeLimitExceeded,
  rowSizeLimitExceeded,
  accountCapacityLimitExceeded,
  customerError,
  dataSourceNotFound,
  iamRoleNotAvailable,
  connectionFailure,
  sqlTableNotFound,
  permissionDenied,
  sslCertificateValidationFailure,
  oauthTokenFailure,
  sourceApiLimitExceededFailure,
  passwordAuthenticationFailure,
  sqlSchemaMismatchError,
  invalidDateFormat,
  invalidDataprepSyntax,
  sourceResourceLimitExceeded,
  sqlInvalidParameterValue,
  queryTimeout,
  sqlNumericOverflow,
  unresolvableHost,
  unroutableHost,
  sqlException,
  s3FileInaccessible,
  iotFileNotFound,
  iotDataSetFileEmpty,
  invalidDataSourceConfig,
  dataSourceAuthFailed,
  dataSourceConnectionFailed,
  failureToProcessJsonFile,
  internalServiceError,
}

extension on IngestionErrorType {
  String toValue() {
    switch (this) {
      case IngestionErrorType.failureToAssumeRole:
        return 'FAILURE_TO_ASSUME_ROLE';
      case IngestionErrorType.ingestionSuperseded:
        return 'INGESTION_SUPERSEDED';
      case IngestionErrorType.ingestionCanceled:
        return 'INGESTION_CANCELED';
      case IngestionErrorType.dataSetDeleted:
        return 'DATA_SET_DELETED';
      case IngestionErrorType.dataSetNotSpice:
        return 'DATA_SET_NOT_SPICE';
      case IngestionErrorType.s3UploadedFileDeleted:
        return 'S3_UPLOADED_FILE_DELETED';
      case IngestionErrorType.s3ManifestError:
        return 'S3_MANIFEST_ERROR';
      case IngestionErrorType.dataToleranceException:
        return 'DATA_TOLERANCE_EXCEPTION';
      case IngestionErrorType.spiceTableNotFound:
        return 'SPICE_TABLE_NOT_FOUND';
      case IngestionErrorType.dataSetSizeLimitExceeded:
        return 'DATA_SET_SIZE_LIMIT_EXCEEDED';
      case IngestionErrorType.rowSizeLimitExceeded:
        return 'ROW_SIZE_LIMIT_EXCEEDED';
      case IngestionErrorType.accountCapacityLimitExceeded:
        return 'ACCOUNT_CAPACITY_LIMIT_EXCEEDED';
      case IngestionErrorType.customerError:
        return 'CUSTOMER_ERROR';
      case IngestionErrorType.dataSourceNotFound:
        return 'DATA_SOURCE_NOT_FOUND';
      case IngestionErrorType.iamRoleNotAvailable:
        return 'IAM_ROLE_NOT_AVAILABLE';
      case IngestionErrorType.connectionFailure:
        return 'CONNECTION_FAILURE';
      case IngestionErrorType.sqlTableNotFound:
        return 'SQL_TABLE_NOT_FOUND';
      case IngestionErrorType.permissionDenied:
        return 'PERMISSION_DENIED';
      case IngestionErrorType.sslCertificateValidationFailure:
        return 'SSL_CERTIFICATE_VALIDATION_FAILURE';
      case IngestionErrorType.oauthTokenFailure:
        return 'OAUTH_TOKEN_FAILURE';
      case IngestionErrorType.sourceApiLimitExceededFailure:
        return 'SOURCE_API_LIMIT_EXCEEDED_FAILURE';
      case IngestionErrorType.passwordAuthenticationFailure:
        return 'PASSWORD_AUTHENTICATION_FAILURE';
      case IngestionErrorType.sqlSchemaMismatchError:
        return 'SQL_SCHEMA_MISMATCH_ERROR';
      case IngestionErrorType.invalidDateFormat:
        return 'INVALID_DATE_FORMAT';
      case IngestionErrorType.invalidDataprepSyntax:
        return 'INVALID_DATAPREP_SYNTAX';
      case IngestionErrorType.sourceResourceLimitExceeded:
        return 'SOURCE_RESOURCE_LIMIT_EXCEEDED';
      case IngestionErrorType.sqlInvalidParameterValue:
        return 'SQL_INVALID_PARAMETER_VALUE';
      case IngestionErrorType.queryTimeout:
        return 'QUERY_TIMEOUT';
      case IngestionErrorType.sqlNumericOverflow:
        return 'SQL_NUMERIC_OVERFLOW';
      case IngestionErrorType.unresolvableHost:
        return 'UNRESOLVABLE_HOST';
      case IngestionErrorType.unroutableHost:
        return 'UNROUTABLE_HOST';
      case IngestionErrorType.sqlException:
        return 'SQL_EXCEPTION';
      case IngestionErrorType.s3FileInaccessible:
        return 'S3_FILE_INACCESSIBLE';
      case IngestionErrorType.iotFileNotFound:
        return 'IOT_FILE_NOT_FOUND';
      case IngestionErrorType.iotDataSetFileEmpty:
        return 'IOT_DATA_SET_FILE_EMPTY';
      case IngestionErrorType.invalidDataSourceConfig:
        return 'INVALID_DATA_SOURCE_CONFIG';
      case IngestionErrorType.dataSourceAuthFailed:
        return 'DATA_SOURCE_AUTH_FAILED';
      case IngestionErrorType.dataSourceConnectionFailed:
        return 'DATA_SOURCE_CONNECTION_FAILED';
      case IngestionErrorType.failureToProcessJsonFile:
        return 'FAILURE_TO_PROCESS_JSON_FILE';
      case IngestionErrorType.internalServiceError:
        return 'INTERNAL_SERVICE_ERROR';
    }
  }
}

extension on String {
  IngestionErrorType toIngestionErrorType() {
    switch (this) {
      case 'FAILURE_TO_ASSUME_ROLE':
        return IngestionErrorType.failureToAssumeRole;
      case 'INGESTION_SUPERSEDED':
        return IngestionErrorType.ingestionSuperseded;
      case 'INGESTION_CANCELED':
        return IngestionErrorType.ingestionCanceled;
      case 'DATA_SET_DELETED':
        return IngestionErrorType.dataSetDeleted;
      case 'DATA_SET_NOT_SPICE':
        return IngestionErrorType.dataSetNotSpice;
      case 'S3_UPLOADED_FILE_DELETED':
        return IngestionErrorType.s3UploadedFileDeleted;
      case 'S3_MANIFEST_ERROR':
        return IngestionErrorType.s3ManifestError;
      case 'DATA_TOLERANCE_EXCEPTION':
        return IngestionErrorType.dataToleranceException;
      case 'SPICE_TABLE_NOT_FOUND':
        return IngestionErrorType.spiceTableNotFound;
      case 'DATA_SET_SIZE_LIMIT_EXCEEDED':
        return IngestionErrorType.dataSetSizeLimitExceeded;
      case 'ROW_SIZE_LIMIT_EXCEEDED':
        return IngestionErrorType.rowSizeLimitExceeded;
      case 'ACCOUNT_CAPACITY_LIMIT_EXCEEDED':
        return IngestionErrorType.accountCapacityLimitExceeded;
      case 'CUSTOMER_ERROR':
        return IngestionErrorType.customerError;
      case 'DATA_SOURCE_NOT_FOUND':
        return IngestionErrorType.dataSourceNotFound;
      case 'IAM_ROLE_NOT_AVAILABLE':
        return IngestionErrorType.iamRoleNotAvailable;
      case 'CONNECTION_FAILURE':
        return IngestionErrorType.connectionFailure;
      case 'SQL_TABLE_NOT_FOUND':
        return IngestionErrorType.sqlTableNotFound;
      case 'PERMISSION_DENIED':
        return IngestionErrorType.permissionDenied;
      case 'SSL_CERTIFICATE_VALIDATION_FAILURE':
        return IngestionErrorType.sslCertificateValidationFailure;
      case 'OAUTH_TOKEN_FAILURE':
        return IngestionErrorType.oauthTokenFailure;
      case 'SOURCE_API_LIMIT_EXCEEDED_FAILURE':
        return IngestionErrorType.sourceApiLimitExceededFailure;
      case 'PASSWORD_AUTHENTICATION_FAILURE':
        return IngestionErrorType.passwordAuthenticationFailure;
      case 'SQL_SCHEMA_MISMATCH_ERROR':
        return IngestionErrorType.sqlSchemaMismatchError;
      case 'INVALID_DATE_FORMAT':
        return IngestionErrorType.invalidDateFormat;
      case 'INVALID_DATAPREP_SYNTAX':
        return IngestionErrorType.invalidDataprepSyntax;
      case 'SOURCE_RESOURCE_LIMIT_EXCEEDED':
        return IngestionErrorType.sourceResourceLimitExceeded;
      case 'SQL_INVALID_PARAMETER_VALUE':
        return IngestionErrorType.sqlInvalidParameterValue;
      case 'QUERY_TIMEOUT':
        return IngestionErrorType.queryTimeout;
      case 'SQL_NUMERIC_OVERFLOW':
        return IngestionErrorType.sqlNumericOverflow;
      case 'UNRESOLVABLE_HOST':
        return IngestionErrorType.unresolvableHost;
      case 'UNROUTABLE_HOST':
        return IngestionErrorType.unroutableHost;
      case 'SQL_EXCEPTION':
        return IngestionErrorType.sqlException;
      case 'S3_FILE_INACCESSIBLE':
        return IngestionErrorType.s3FileInaccessible;
      case 'IOT_FILE_NOT_FOUND':
        return IngestionErrorType.iotFileNotFound;
      case 'IOT_DATA_SET_FILE_EMPTY':
        return IngestionErrorType.iotDataSetFileEmpty;
      case 'INVALID_DATA_SOURCE_CONFIG':
        return IngestionErrorType.invalidDataSourceConfig;
      case 'DATA_SOURCE_AUTH_FAILED':
        return IngestionErrorType.dataSourceAuthFailed;
      case 'DATA_SOURCE_CONNECTION_FAILED':
        return IngestionErrorType.dataSourceConnectionFailed;
      case 'FAILURE_TO_PROCESS_JSON_FILE':
        return IngestionErrorType.failureToProcessJsonFile;
      case 'INTERNAL_SERVICE_ERROR':
        return IngestionErrorType.internalServiceError;
    }
    throw Exception('$this is not known in enum IngestionErrorType');
  }
}

enum IngestionRequestSource {
  manual,
  scheduled,
}

extension on IngestionRequestSource {
  String toValue() {
    switch (this) {
      case IngestionRequestSource.manual:
        return 'MANUAL';
      case IngestionRequestSource.scheduled:
        return 'SCHEDULED';
    }
  }
}

extension on String {
  IngestionRequestSource toIngestionRequestSource() {
    switch (this) {
      case 'MANUAL':
        return IngestionRequestSource.manual;
      case 'SCHEDULED':
        return IngestionRequestSource.scheduled;
    }
    throw Exception('$this is not known in enum IngestionRequestSource');
  }
}

enum IngestionRequestType {
  initialIngestion,
  edit,
  incrementalRefresh,
  fullRefresh,
}

extension on IngestionRequestType {
  String toValue() {
    switch (this) {
      case IngestionRequestType.initialIngestion:
        return 'INITIAL_INGESTION';
      case IngestionRequestType.edit:
        return 'EDIT';
      case IngestionRequestType.incrementalRefresh:
        return 'INCREMENTAL_REFRESH';
      case IngestionRequestType.fullRefresh:
        return 'FULL_REFRESH';
    }
  }
}

extension on String {
  IngestionRequestType toIngestionRequestType() {
    switch (this) {
      case 'INITIAL_INGESTION':
        return IngestionRequestType.initialIngestion;
      case 'EDIT':
        return IngestionRequestType.edit;
      case 'INCREMENTAL_REFRESH':
        return IngestionRequestType.incrementalRefresh;
      case 'FULL_REFRESH':
        return IngestionRequestType.fullRefresh;
    }
    throw Exception('$this is not known in enum IngestionRequestType');
  }
}

enum IngestionStatus {
  initialized,
  queued,
  running,
  failed,
  completed,
  cancelled,
}

extension on IngestionStatus {
  String toValue() {
    switch (this) {
      case IngestionStatus.initialized:
        return 'INITIALIZED';
      case IngestionStatus.queued:
        return 'QUEUED';
      case IngestionStatus.running:
        return 'RUNNING';
      case IngestionStatus.failed:
        return 'FAILED';
      case IngestionStatus.completed:
        return 'COMPLETED';
      case IngestionStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  IngestionStatus toIngestionStatus() {
    switch (this) {
      case 'INITIALIZED':
        return IngestionStatus.initialized;
      case 'QUEUED':
        return IngestionStatus.queued;
      case 'RUNNING':
        return IngestionStatus.running;
      case 'FAILED':
        return IngestionStatus.failed;
      case 'COMPLETED':
        return IngestionStatus.completed;
      case 'CANCELLED':
        return IngestionStatus.cancelled;
    }
    throw Exception('$this is not known in enum IngestionStatus');
  }
}

/// Metadata for a column that is used as the input of a transform operation.
class InputColumn {
  /// The name of this column in the underlying data source.
  final String name;

  /// The data type of the column.
  final InputColumnDataType type;

  InputColumn({
    required this.name,
    required this.type,
  });

  factory InputColumn.fromJson(Map<String, dynamic> json) {
    return InputColumn(
      name: json['Name'] as String,
      type: (json['Type'] as String).toInputColumnDataType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'Name': name,
      'Type': type.toValue(),
    };
  }
}

enum InputColumnDataType {
  string,
  integer,
  decimal,
  datetime,
  bit,
  boolean,
  json,
}

extension on InputColumnDataType {
  String toValue() {
    switch (this) {
      case InputColumnDataType.string:
        return 'STRING';
      case InputColumnDataType.integer:
        return 'INTEGER';
      case InputColumnDataType.decimal:
        return 'DECIMAL';
      case InputColumnDataType.datetime:
        return 'DATETIME';
      case InputColumnDataType.bit:
        return 'BIT';
      case InputColumnDataType.boolean:
        return 'BOOLEAN';
      case InputColumnDataType.json:
        return 'JSON';
    }
  }
}

extension on String {
  InputColumnDataType toInputColumnDataType() {
    switch (this) {
      case 'STRING':
        return InputColumnDataType.string;
      case 'INTEGER':
        return InputColumnDataType.integer;
      case 'DECIMAL':
        return InputColumnDataType.decimal;
      case 'DATETIME':
        return InputColumnDataType.datetime;
      case 'BIT':
        return InputColumnDataType.bit;
      case 'BOOLEAN':
        return InputColumnDataType.boolean;
      case 'JSON':
        return InputColumnDataType.json;
    }
    throw Exception('$this is not known in enum InputColumnDataType');
  }
}

/// An integer parameter.
class IntegerParameter {
  /// The name of the integer parameter.
  final String name;

  /// The values for the integer parameter.
  final List<int> values;

  IntegerParameter({
    required this.name,
    required this.values,
  });

  factory IntegerParameter.fromJson(Map<String, dynamic> json) {
    return IntegerParameter(
      name: json['Name'] as String,
      values:
          (json['Values'] as List).whereNotNull().map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

/// Jira parameters.
class JiraParameters {
  /// The base URL of the Jira site.
  final String siteBaseUrl;

  JiraParameters({
    required this.siteBaseUrl,
  });

  factory JiraParameters.fromJson(Map<String, dynamic> json) {
    return JiraParameters(
      siteBaseUrl: json['SiteBaseUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final siteBaseUrl = this.siteBaseUrl;
    return {
      'SiteBaseUrl': siteBaseUrl,
    };
  }
}

/// The instructions associated with a join.
class JoinInstruction {
  /// The operand on the left side of a join.
  final String leftOperand;

  /// The join instructions provided in the <code>ON</code> clause of a join.
  final String onClause;

  /// The operand on the right side of a join.
  final String rightOperand;

  /// The type of join that it is.
  final JoinType type;

  /// Join key properties of the left operand.
  final JoinKeyProperties? leftJoinKeyProperties;

  /// Join key properties of the right operand.
  final JoinKeyProperties? rightJoinKeyProperties;

  JoinInstruction({
    required this.leftOperand,
    required this.onClause,
    required this.rightOperand,
    required this.type,
    this.leftJoinKeyProperties,
    this.rightJoinKeyProperties,
  });

  factory JoinInstruction.fromJson(Map<String, dynamic> json) {
    return JoinInstruction(
      leftOperand: json['LeftOperand'] as String,
      onClause: json['OnClause'] as String,
      rightOperand: json['RightOperand'] as String,
      type: (json['Type'] as String).toJoinType(),
      leftJoinKeyProperties: json['LeftJoinKeyProperties'] != null
          ? JoinKeyProperties.fromJson(
              json['LeftJoinKeyProperties'] as Map<String, dynamic>)
          : null,
      rightJoinKeyProperties: json['RightJoinKeyProperties'] != null
          ? JoinKeyProperties.fromJson(
              json['RightJoinKeyProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final leftOperand = this.leftOperand;
    final onClause = this.onClause;
    final rightOperand = this.rightOperand;
    final type = this.type;
    final leftJoinKeyProperties = this.leftJoinKeyProperties;
    final rightJoinKeyProperties = this.rightJoinKeyProperties;
    return {
      'LeftOperand': leftOperand,
      'OnClause': onClause,
      'RightOperand': rightOperand,
      'Type': type.toValue(),
      if (leftJoinKeyProperties != null)
        'LeftJoinKeyProperties': leftJoinKeyProperties,
      if (rightJoinKeyProperties != null)
        'RightJoinKeyProperties': rightJoinKeyProperties,
    };
  }
}

/// Properties associated with the columns participating in a join.
class JoinKeyProperties {
  /// A value that indicates that a row in a table is uniquely identified by the
  /// columns in a join key. This is used by QuickSight to optimize query
  /// performance.
  final bool? uniqueKey;

  JoinKeyProperties({
    this.uniqueKey,
  });

  factory JoinKeyProperties.fromJson(Map<String, dynamic> json) {
    return JoinKeyProperties(
      uniqueKey: json['UniqueKey'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final uniqueKey = this.uniqueKey;
    return {
      if (uniqueKey != null) 'UniqueKey': uniqueKey,
    };
  }
}

enum JoinType {
  inner,
  outer,
  left,
  right,
}

extension on JoinType {
  String toValue() {
    switch (this) {
      case JoinType.inner:
        return 'INNER';
      case JoinType.outer:
        return 'OUTER';
      case JoinType.left:
        return 'LEFT';
      case JoinType.right:
        return 'RIGHT';
    }
  }
}

extension on String {
  JoinType toJoinType() {
    switch (this) {
      case 'INNER':
        return JoinType.inner;
      case 'OUTER':
        return JoinType.outer;
      case 'LEFT':
        return JoinType.left;
      case 'RIGHT':
        return JoinType.right;
    }
    throw Exception('$this is not known in enum JoinType');
  }
}

class ListAnalysesResponse {
  /// Metadata describing each of the analyses that are listed.
  final List<AnalysisSummary>? analysisSummaryList;

  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListAnalysesResponse({
    this.analysisSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListAnalysesResponse.fromJson(Map<String, dynamic> json) {
    return ListAnalysesResponse(
      analysisSummaryList: (json['AnalysisSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisSummaryList = this.analysisSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisSummaryList != null)
        'AnalysisSummaryList': analysisSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListDashboardVersionsResponse {
  /// A structure that contains information about each version of the dashboard.
  final List<DashboardVersionSummary>? dashboardVersionSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListDashboardVersionsResponse({
    this.dashboardVersionSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListDashboardVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListDashboardVersionsResponse(
      dashboardVersionSummaryList:
          (json['DashboardVersionSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  DashboardVersionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardVersionSummaryList = this.dashboardVersionSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboardVersionSummaryList != null)
        'DashboardVersionSummaryList': dashboardVersionSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListDashboardsResponse {
  /// A structure that contains all of the dashboards in your AWS account. This
  /// structure provides basic information about the dashboards.
  final List<DashboardSummary>? dashboardSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListDashboardsResponse({
    this.dashboardSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListDashboardsResponse.fromJson(Map<String, dynamic> json) {
    return ListDashboardsResponse(
      dashboardSummaryList: (json['DashboardSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => DashboardSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardSummaryList = this.dashboardSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboardSummaryList != null)
        'DashboardSummaryList': dashboardSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListDataSetsResponse {
  /// The list of dataset summaries.
  final List<DataSetSummary>? dataSetSummaries;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListDataSetsResponse({
    this.dataSetSummaries,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListDataSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSetsResponse(
      dataSetSummaries: (json['DataSetSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DataSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetSummaries = this.dataSetSummaries;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSetSummaries != null) 'DataSetSummaries': dataSetSummaries,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListDataSourcesResponse {
  /// A list of data sources.
  final List<DataSource>? dataSources;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListDataSourcesResponse({
    this.dataSources,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesResponse(
      dataSources: (json['DataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSources = this.dataSources;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSources != null) 'DataSources': dataSources,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListFolderMembersResponse {
  /// A structure that contains all of the folder members (dashboards, analyses,
  /// and datasets) in the folder.
  final List<MemberIdArnPair>? folderMemberList;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>
  final int? status;

  ListFolderMembersResponse({
    this.folderMemberList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListFolderMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListFolderMembersResponse(
      folderMemberList: (json['FolderMemberList'] as List?)
          ?.whereNotNull()
          .map((e) => MemberIdArnPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final folderMemberList = this.folderMemberList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (folderMemberList != null) 'FolderMemberList': folderMemberList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListFoldersResponse {
  /// A structure that contains all of the folders in your AWS account. This
  /// structure provides basic information about the folders.
  final List<FolderSummary>? folderSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>
  final int? status;

  ListFoldersResponse({
    this.folderSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListFoldersResponse.fromJson(Map<String, dynamic> json) {
    return ListFoldersResponse(
      folderSummaryList: (json['FolderSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => FolderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final folderSummaryList = this.folderSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (folderSummaryList != null) 'FolderSummaryList': folderSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListGroupMembershipsResponse {
  /// The list of the members of the group.
  final List<GroupMember>? groupMemberList;

  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListGroupMembershipsResponse({
    this.groupMemberList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListGroupMembershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupMembershipsResponse(
      groupMemberList: (json['GroupMemberList'] as List?)
          ?.whereNotNull()
          .map((e) => GroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupMemberList = this.groupMemberList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (groupMemberList != null) 'GroupMemberList': groupMemberList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListGroupsResponse {
  /// The list of the groups.
  final List<Group>? groupList;

  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListGroupsResponse({
    this.groupList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsResponse(
      groupList: (json['GroupList'] as List?)
          ?.whereNotNull()
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupList = this.groupList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (groupList != null) 'GroupList': groupList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListIAMPolicyAssignmentsForUserResponse {
  /// The active assignments for this user.
  final List<ActiveIAMPolicyAssignment>? activeAssignments;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListIAMPolicyAssignmentsForUserResponse({
    this.activeAssignments,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListIAMPolicyAssignmentsForUserResponse.fromJson(
      Map<String, dynamic> json) {
    return ListIAMPolicyAssignmentsForUserResponse(
      activeAssignments: (json['ActiveAssignments'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ActiveIAMPolicyAssignment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeAssignments = this.activeAssignments;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (activeAssignments != null) 'ActiveAssignments': activeAssignments,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListIAMPolicyAssignmentsResponse {
  /// Information describing the IAM policy assignments.
  final List<IAMPolicyAssignmentSummary>? iAMPolicyAssignments;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListIAMPolicyAssignmentsResponse({
    this.iAMPolicyAssignments,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListIAMPolicyAssignmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListIAMPolicyAssignmentsResponse(
      iAMPolicyAssignments: (json['IAMPolicyAssignments'] as List?)
          ?.whereNotNull()
          .map((e) =>
              IAMPolicyAssignmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final iAMPolicyAssignments = this.iAMPolicyAssignments;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (iAMPolicyAssignments != null)
        'IAMPolicyAssignments': iAMPolicyAssignments,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListIngestionsResponse {
  /// A list of the ingestions.
  final List<Ingestion>? ingestions;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListIngestionsResponse({
    this.ingestions,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListIngestionsResponse.fromJson(Map<String, dynamic> json) {
    return ListIngestionsResponse(
      ingestions: (json['Ingestions'] as List?)
          ?.whereNotNull()
          .map((e) => Ingestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestions = this.ingestions;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (ingestions != null) 'Ingestions': ingestions,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListNamespacesResponse {
  /// The information about the namespaces in this AWS account. The response
  /// includes the namespace ARN, name, AWS Region, notification email address,
  /// creation status, and identity store.
  final List<NamespaceInfoV2>? namespaces;

  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListNamespacesResponse({
    this.namespaces,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListNamespacesResponse(
      namespaces: (json['Namespaces'] as List?)
          ?.whereNotNull()
          .map((e) => NamespaceInfoV2.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (namespaces != null) 'Namespaces': namespaces,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListTagsForResourceResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Contains a map of the key-value pairs for the resource tag or tags assigned
  /// to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.requestId,
    this.status,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final tags = this.tags;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTemplateAliasesResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// A structure containing the list of the template's aliases.
  final List<TemplateAlias>? templateAliasList;

  ListTemplateAliasesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.templateAliasList,
  });

  factory ListTemplateAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplateAliasesResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateAliasList: (json['TemplateAliasList'] as List?)
          ?.whereNotNull()
          .map((e) => TemplateAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final templateAliasList = this.templateAliasList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (templateAliasList != null) 'TemplateAliasList': templateAliasList,
    };
  }
}

class ListTemplateVersionsResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// A structure containing a list of all the versions of the specified template.
  final List<TemplateVersionSummary>? templateVersionSummaryList;

  ListTemplateVersionsResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.templateVersionSummaryList,
  });

  factory ListTemplateVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplateVersionsResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateVersionSummaryList: (json['TemplateVersionSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => TemplateVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final templateVersionSummaryList = this.templateVersionSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (templateVersionSummaryList != null)
        'TemplateVersionSummaryList': templateVersionSummaryList,
    };
  }
}

class ListTemplatesResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// A structure containing information about the templates in the list.
  final List<TemplateSummary>? templateSummaryList;

  ListTemplatesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.templateSummaryList,
  });

  factory ListTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplatesResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateSummaryList: (json['TemplateSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => TemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final templateSummaryList = this.templateSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (templateSummaryList != null)
        'TemplateSummaryList': templateSummaryList,
    };
  }
}

class ListThemeAliasesResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// A structure containing the list of the theme's aliases.
  final List<ThemeAlias>? themeAliasList;

  ListThemeAliasesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.themeAliasList,
  });

  factory ListThemeAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListThemeAliasesResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeAliasList: (json['ThemeAliasList'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final themeAliasList = this.themeAliasList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (themeAliasList != null) 'ThemeAliasList': themeAliasList,
    };
  }
}

class ListThemeVersionsResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// A structure containing a list of all the versions of the specified theme.
  final List<ThemeVersionSummary>? themeVersionSummaryList;

  ListThemeVersionsResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.themeVersionSummaryList,
  });

  factory ListThemeVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListThemeVersionsResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeVersionSummaryList: (json['ThemeVersionSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final themeVersionSummaryList = this.themeVersionSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (themeVersionSummaryList != null)
        'ThemeVersionSummaryList': themeVersionSummaryList,
    };
  }
}

class ListThemesResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Information about the themes in the list.
  final List<ThemeSummary>? themeSummaryList;

  ListThemesResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.themeSummaryList,
  });

  factory ListThemesResponse.fromJson(Map<String, dynamic> json) {
    return ListThemesResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeSummaryList: (json['ThemeSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final themeSummaryList = this.themeSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (themeSummaryList != null) 'ThemeSummaryList': themeSummaryList,
    };
  }
}

class ListUserGroupsResponse {
  /// The list of groups the user is a member of.
  final List<Group>? groupList;

  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  ListUserGroupsResponse({
    this.groupList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory ListUserGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListUserGroupsResponse(
      groupList: (json['GroupList'] as List?)
          ?.whereNotNull()
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupList = this.groupList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (groupList != null) 'GroupList': groupList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class ListUsersResponse {
  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The list of users.
  final List<User>? userList;

  ListUsersResponse({
    this.nextToken,
    this.requestId,
    this.status,
    this.userList,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      userList: (json['UserList'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    final userList = this.userList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
      if (userList != null) 'UserList': userList,
    };
  }
}

/// A <i>logical table</i> is a unit that joins and that data transformations
/// operate on. A logical table has a source, which can be either a physical
/// table or result of a join. When a logical table points to a physical table,
/// the logical table acts as a mutable copy of that physical table through
/// transform operations.
class LogicalTable {
  /// A display name for the logical table.
  final String alias;

  /// Source of this logical table.
  final LogicalTableSource source;

  /// Transform operations that act on this logical table.
  final List<TransformOperation>? dataTransforms;

  LogicalTable({
    required this.alias,
    required this.source,
    this.dataTransforms,
  });

  factory LogicalTable.fromJson(Map<String, dynamic> json) {
    return LogicalTable(
      alias: json['Alias'] as String,
      source:
          LogicalTableSource.fromJson(json['Source'] as Map<String, dynamic>),
      dataTransforms: (json['DataTransforms'] as List?)
          ?.whereNotNull()
          .map((e) => TransformOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final source = this.source;
    final dataTransforms = this.dataTransforms;
    return {
      'Alias': alias,
      'Source': source,
      if (dataTransforms != null) 'DataTransforms': dataTransforms,
    };
  }
}

/// Information about the source of a logical table. This is a variant type
/// structure. For this structure to be valid, only one of the attributes can be
/// non-null.
class LogicalTableSource {
  /// Specifies the result of a join of two logical tables.
  final JoinInstruction? joinInstruction;

  /// Physical table ID.
  final String? physicalTableId;

  LogicalTableSource({
    this.joinInstruction,
    this.physicalTableId,
  });

  factory LogicalTableSource.fromJson(Map<String, dynamic> json) {
    return LogicalTableSource(
      joinInstruction: json['JoinInstruction'] != null
          ? JoinInstruction.fromJson(
              json['JoinInstruction'] as Map<String, dynamic>)
          : null,
      physicalTableId: json['PhysicalTableId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final joinInstruction = this.joinInstruction;
    final physicalTableId = this.physicalTableId;
    return {
      if (joinInstruction != null) 'JoinInstruction': joinInstruction,
      if (physicalTableId != null) 'PhysicalTableId': physicalTableId,
    };
  }
}

/// Amazon S3 manifest file location.
class ManifestFileLocation {
  /// Amazon S3 bucket.
  final String bucket;

  /// Amazon S3 key that identifies an object.
  final String key;

  ManifestFileLocation({
    required this.bucket,
    required this.key,
  });

  factory ManifestFileLocation.fromJson(Map<String, dynamic> json) {
    return ManifestFileLocation(
      bucket: json['Bucket'] as String,
      key: json['Key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'Bucket': bucket,
      'Key': key,
    };
  }
}

/// The display options for margins around the outside edge of sheets.
class MarginStyle {
  /// This Boolean value controls whether to display sheet margins.
  final bool? show;

  MarginStyle({
    this.show,
  });

  factory MarginStyle.fromJson(Map<String, dynamic> json) {
    return MarginStyle(
      show: json['Show'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final show = this.show;
    return {
      if (show != null) 'Show': show,
    };
  }
}

/// MariaDB parameters.
class MariaDbParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  MariaDbParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory MariaDbParameters.fromJson(Map<String, dynamic> json) {
    return MariaDbParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// An object that consists of the member Amazon Resource Name (ARN) and member
/// ID.
class MemberIdArnPair {
  /// The Amazon Resource Name (ARN) of the member.
  final String? memberArn;

  /// The ID of the member.
  final String? memberId;

  MemberIdArnPair({
    this.memberArn,
    this.memberId,
  });

  factory MemberIdArnPair.fromJson(Map<String, dynamic> json) {
    return MemberIdArnPair(
      memberArn: json['MemberArn'] as String?,
      memberId: json['MemberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberArn = this.memberArn;
    final memberId = this.memberId;
    return {
      if (memberArn != null) 'MemberArn': memberArn,
      if (memberId != null) 'MemberId': memberId,
    };
  }
}

enum MemberType {
  dashboard,
  analysis,
  dataset,
}

extension on MemberType {
  String toValue() {
    switch (this) {
      case MemberType.dashboard:
        return 'DASHBOARD';
      case MemberType.analysis:
        return 'ANALYSIS';
      case MemberType.dataset:
        return 'DATASET';
    }
  }
}

extension on String {
  MemberType toMemberType() {
    switch (this) {
      case 'DASHBOARD':
        return MemberType.dashboard;
      case 'ANALYSIS':
        return MemberType.analysis;
      case 'DATASET':
        return MemberType.dataset;
    }
    throw Exception('$this is not known in enum MemberType');
  }
}

/// MySQL parameters.
class MySqlParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  MySqlParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory MySqlParameters.fromJson(Map<String, dynamic> json) {
    return MySqlParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// Errors that occur during namespace creation.
class NamespaceError {
  /// The message for the error.
  final String? message;

  /// The error type.
  final NamespaceErrorType? type;

  NamespaceError({
    this.message,
    this.type,
  });

  factory NamespaceError.fromJson(Map<String, dynamic> json) {
    return NamespaceError(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toNamespaceErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum NamespaceErrorType {
  permissionDenied,
  internalServiceError,
}

extension on NamespaceErrorType {
  String toValue() {
    switch (this) {
      case NamespaceErrorType.permissionDenied:
        return 'PERMISSION_DENIED';
      case NamespaceErrorType.internalServiceError:
        return 'INTERNAL_SERVICE_ERROR';
    }
  }
}

extension on String {
  NamespaceErrorType toNamespaceErrorType() {
    switch (this) {
      case 'PERMISSION_DENIED':
        return NamespaceErrorType.permissionDenied;
      case 'INTERNAL_SERVICE_ERROR':
        return NamespaceErrorType.internalServiceError;
    }
    throw Exception('$this is not known in enum NamespaceErrorType');
  }
}

/// The error type.
class NamespaceInfoV2 {
  /// The namespace ARN.
  final String? arn;

  /// The namespace AWS Region.
  final String? capacityRegion;

  /// The creation status of a namespace that is not yet completely created.
  final NamespaceStatus? creationStatus;

  /// The identity store used for the namespace.
  final IdentityStore? identityStore;

  /// The name of the error.
  final String? name;

  /// An error that occurred when the namespace was created.
  final NamespaceError? namespaceError;

  NamespaceInfoV2({
    this.arn,
    this.capacityRegion,
    this.creationStatus,
    this.identityStore,
    this.name,
    this.namespaceError,
  });

  factory NamespaceInfoV2.fromJson(Map<String, dynamic> json) {
    return NamespaceInfoV2(
      arn: json['Arn'] as String?,
      capacityRegion: json['CapacityRegion'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toNamespaceStatus(),
      identityStore: (json['IdentityStore'] as String?)?.toIdentityStore(),
      name: json['Name'] as String?,
      namespaceError: json['NamespaceError'] != null
          ? NamespaceError.fromJson(
              json['NamespaceError'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final capacityRegion = this.capacityRegion;
    final creationStatus = this.creationStatus;
    final identityStore = this.identityStore;
    final name = this.name;
    final namespaceError = this.namespaceError;
    return {
      if (arn != null) 'Arn': arn,
      if (capacityRegion != null) 'CapacityRegion': capacityRegion,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (identityStore != null) 'IdentityStore': identityStore.toValue(),
      if (name != null) 'Name': name,
      if (namespaceError != null) 'NamespaceError': namespaceError,
    };
  }
}

enum NamespaceStatus {
  created,
  creating,
  deleting,
  retryableFailure,
  nonRetryableFailure,
}

extension on NamespaceStatus {
  String toValue() {
    switch (this) {
      case NamespaceStatus.created:
        return 'CREATED';
      case NamespaceStatus.creating:
        return 'CREATING';
      case NamespaceStatus.deleting:
        return 'DELETING';
      case NamespaceStatus.retryableFailure:
        return 'RETRYABLE_FAILURE';
      case NamespaceStatus.nonRetryableFailure:
        return 'NON_RETRYABLE_FAILURE';
    }
  }
}

extension on String {
  NamespaceStatus toNamespaceStatus() {
    switch (this) {
      case 'CREATED':
        return NamespaceStatus.created;
      case 'CREATING':
        return NamespaceStatus.creating;
      case 'DELETING':
        return NamespaceStatus.deleting;
      case 'RETRYABLE_FAILURE':
        return NamespaceStatus.retryableFailure;
      case 'NON_RETRYABLE_FAILURE':
        return NamespaceStatus.nonRetryableFailure;
    }
    throw Exception('$this is not known in enum NamespaceStatus');
  }
}

/// Oracle parameters.
class OracleParameters {
  /// Database.
  final String database;

  /// An Oracle host.
  final String host;

  /// Port.
  final int port;

  OracleParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory OracleParameters.fromJson(Map<String, dynamic> json) {
    return OracleParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// Output column.
class OutputColumn {
  /// A description for a column.
  final String? description;

  /// A display name for the dataset.
  final String? name;

  /// Type.
  final ColumnDataType? type;

  OutputColumn({
    this.description,
    this.name,
    this.type,
  });

  factory OutputColumn.fromJson(Map<String, dynamic> json) {
    return OutputColumn(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toColumnDataType(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A list of QuickSight parameters and the list's override values.
class Parameters {
  /// Date-time parameters.
  final List<DateTimeParameter>? dateTimeParameters;

  /// Decimal parameters.
  final List<DecimalParameter>? decimalParameters;

  /// Integer parameters.
  final List<IntegerParameter>? integerParameters;

  /// String parameters.
  final List<StringParameter>? stringParameters;

  Parameters({
    this.dateTimeParameters,
    this.decimalParameters,
    this.integerParameters,
    this.stringParameters,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      dateTimeParameters: (json['DateTimeParameters'] as List?)
          ?.whereNotNull()
          .map((e) => DateTimeParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      decimalParameters: (json['DecimalParameters'] as List?)
          ?.whereNotNull()
          .map((e) => DecimalParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      integerParameters: (json['IntegerParameters'] as List?)
          ?.whereNotNull()
          .map((e) => IntegerParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringParameters: (json['StringParameters'] as List?)
          ?.whereNotNull()
          .map((e) => StringParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dateTimeParameters = this.dateTimeParameters;
    final decimalParameters = this.decimalParameters;
    final integerParameters = this.integerParameters;
    final stringParameters = this.stringParameters;
    return {
      if (dateTimeParameters != null) 'DateTimeParameters': dateTimeParameters,
      if (decimalParameters != null) 'DecimalParameters': decimalParameters,
      if (integerParameters != null) 'IntegerParameters': integerParameters,
      if (stringParameters != null) 'StringParameters': stringParameters,
    };
  }
}

/// A view of a data source that contains information about the shape of the
/// data in the underlying source. This is a variant type structure. For this
/// structure to be valid, only one of the attributes can be non-null.
class PhysicalTable {
  /// A physical table type built from the results of the custom SQL query.
  final CustomSql? customSql;

  /// A physical table type for relational data sources.
  final RelationalTable? relationalTable;

  /// A physical table type for as S3 data source.
  final S3Source? s3Source;

  PhysicalTable({
    this.customSql,
    this.relationalTable,
    this.s3Source,
  });

  factory PhysicalTable.fromJson(Map<String, dynamic> json) {
    return PhysicalTable(
      customSql: json['CustomSql'] != null
          ? CustomSql.fromJson(json['CustomSql'] as Map<String, dynamic>)
          : null,
      relationalTable: json['RelationalTable'] != null
          ? RelationalTable.fromJson(
              json['RelationalTable'] as Map<String, dynamic>)
          : null,
      s3Source: json['S3Source'] != null
          ? S3Source.fromJson(json['S3Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customSql = this.customSql;
    final relationalTable = this.relationalTable;
    final s3Source = this.s3Source;
    return {
      if (customSql != null) 'CustomSql': customSql,
      if (relationalTable != null) 'RelationalTable': relationalTable,
      if (s3Source != null) 'S3Source': s3Source,
    };
  }
}

/// PostgreSQL parameters.
class PostgreSqlParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  PostgreSqlParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory PostgreSqlParameters.fromJson(Map<String, dynamic> json) {
    return PostgreSqlParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// Presto parameters.
class PrestoParameters {
  /// Catalog.
  final String catalog;

  /// Host.
  final String host;

  /// Port.
  final int port;

  PrestoParameters({
    required this.catalog,
    required this.host,
    required this.port,
  });

  factory PrestoParameters.fromJson(Map<String, dynamic> json) {
    return PrestoParameters(
      catalog: json['Catalog'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final host = this.host;
    final port = this.port;
    return {
      'Catalog': catalog,
      'Host': host,
      'Port': port,
    };
  }
}

/// A transform operation that projects columns. Operations that come after a
/// projection can only refer to projected columns.
class ProjectOperation {
  /// Projected columns.
  final List<String> projectedColumns;

  ProjectOperation({
    required this.projectedColumns,
  });

  factory ProjectOperation.fromJson(Map<String, dynamic> json) {
    return ProjectOperation(
      projectedColumns: (json['ProjectedColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final projectedColumns = this.projectedColumns;
    return {
      'ProjectedColumns': projectedColumns,
    };
  }
}

/// Information about a queued dataset SPICE ingestion.
class QueueInfo {
  /// The ID of the ongoing ingestion. The queued ingestion is waiting for the
  /// ongoing ingestion to complete.
  final String queuedIngestion;

  /// The ID of the queued ingestion.
  final String waitingOnIngestion;

  QueueInfo({
    required this.queuedIngestion,
    required this.waitingOnIngestion,
  });

  factory QueueInfo.fromJson(Map<String, dynamic> json) {
    return QueueInfo(
      queuedIngestion: json['QueuedIngestion'] as String,
      waitingOnIngestion: json['WaitingOnIngestion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final queuedIngestion = this.queuedIngestion;
    final waitingOnIngestion = this.waitingOnIngestion;
    return {
      'QueuedIngestion': queuedIngestion,
      'WaitingOnIngestion': waitingOnIngestion,
    };
  }
}

/// Amazon RDS parameters.
class RdsParameters {
  /// Database.
  final String database;

  /// Instance ID.
  final String instanceId;

  RdsParameters({
    required this.database,
    required this.instanceId,
  });

  factory RdsParameters.fromJson(Map<String, dynamic> json) {
    return RdsParameters(
      database: json['Database'] as String,
      instanceId: json['InstanceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final instanceId = this.instanceId;
    return {
      'Database': database,
      'InstanceId': instanceId,
    };
  }
}

/// Amazon Redshift parameters. The <code>ClusterId</code> field can be blank if
/// <code>Host</code> and <code>Port</code> are both set. The <code>Host</code>
/// and <code>Port</code> fields can be blank if the <code>ClusterId</code>
/// field is set.
class RedshiftParameters {
  /// Database.
  final String database;

  /// Cluster ID. This field can be blank if the <code>Host</code> and
  /// <code>Port</code> are provided.
  final String? clusterId;

  /// Host. This field can be blank if <code>ClusterId</code> is provided.
  final String? host;

  /// Port. This field can be blank if the <code>ClusterId</code> is provided.
  final int? port;

  RedshiftParameters({
    required this.database,
    this.clusterId,
    this.host,
    this.port,
  });

  factory RedshiftParameters.fromJson(Map<String, dynamic> json) {
    return RedshiftParameters(
      database: json['Database'] as String,
      clusterId: json['ClusterId'] as String?,
      host: json['Host'] as String?,
      port: json['Port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final clusterId = this.clusterId;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      if (clusterId != null) 'ClusterId': clusterId,
      if (host != null) 'Host': host,
      if (port != null) 'Port': port,
    };
  }
}

class RegisterUserResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The user's user name.
  final User? user;

  /// The URL the user visits to complete registration and provide a password.
  /// This is returned only for users with an identity type of
  /// <code>QUICKSIGHT</code>.
  final String? userInvitationUrl;

  RegisterUserResponse({
    this.requestId,
    this.status,
    this.user,
    this.userInvitationUrl,
  });

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
      userInvitationUrl: json['UserInvitationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final user = this.user;
    final userInvitationUrl = this.userInvitationUrl;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
      if (userInvitationUrl != null) 'UserInvitationUrl': userInvitationUrl,
    };
  }
}

/// A physical table type for relational data sources.
class RelationalTable {
  /// The Amazon Resource Name (ARN) for the data source.
  final String dataSourceArn;

  /// The column schema of the table.
  final List<InputColumn> inputColumns;

  /// The name of the relational table.
  final String name;

  /// The catalog associated with a table.
  final String? catalog;

  /// The schema name. This name applies to certain relational database engines.
  final String? schema;

  RelationalTable({
    required this.dataSourceArn,
    required this.inputColumns,
    required this.name,
    this.catalog,
    this.schema,
  });

  factory RelationalTable.fromJson(Map<String, dynamic> json) {
    return RelationalTable(
      dataSourceArn: json['DataSourceArn'] as String,
      inputColumns: (json['InputColumns'] as List)
          .whereNotNull()
          .map((e) => InputColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String,
      catalog: json['Catalog'] as String?,
      schema: json['Schema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final inputColumns = this.inputColumns;
    final name = this.name;
    final catalog = this.catalog;
    final schema = this.schema;
    return {
      'DataSourceArn': dataSourceArn,
      'InputColumns': inputColumns,
      'Name': name,
      if (catalog != null) 'Catalog': catalog,
      if (schema != null) 'Schema': schema,
    };
  }
}

/// A transform operation that renames a column.
class RenameColumnOperation {
  /// The name of the column to be renamed.
  final String columnName;

  /// The new name for the column.
  final String newColumnName;

  RenameColumnOperation({
    required this.columnName,
    required this.newColumnName,
  });

  factory RenameColumnOperation.fromJson(Map<String, dynamic> json) {
    return RenameColumnOperation(
      columnName: json['ColumnName'] as String,
      newColumnName: json['NewColumnName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final newColumnName = this.newColumnName;
    return {
      'ColumnName': columnName,
      'NewColumnName': newColumnName,
    };
  }
}

/// Permission for the resource.
class ResourcePermission {
  /// The IAM action to grant or revoke permissions on.
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
  final String principal;

  ResourcePermission({
    required this.actions,
    required this.principal,
  });

  factory ResourcePermission.fromJson(Map<String, dynamic> json) {
    return ResourcePermission(
      actions: (json['Actions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      principal: json['Principal'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final principal = this.principal;
    return {
      'Actions': actions,
      'Principal': principal,
    };
  }
}

enum ResourceStatus {
  creationInProgress,
  creationSuccessful,
  creationFailed,
  updateInProgress,
  updateSuccessful,
  updateFailed,
  deleted,
}

extension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.creationInProgress:
        return 'CREATION_IN_PROGRESS';
      case ResourceStatus.creationSuccessful:
        return 'CREATION_SUCCESSFUL';
      case ResourceStatus.creationFailed:
        return 'CREATION_FAILED';
      case ResourceStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case ResourceStatus.updateSuccessful:
        return 'UPDATE_SUCCESSFUL';
      case ResourceStatus.updateFailed:
        return 'UPDATE_FAILED';
      case ResourceStatus.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'CREATION_IN_PROGRESS':
        return ResourceStatus.creationInProgress;
      case 'CREATION_SUCCESSFUL':
        return ResourceStatus.creationSuccessful;
      case 'CREATION_FAILED':
        return ResourceStatus.creationFailed;
      case 'UPDATE_IN_PROGRESS':
        return ResourceStatus.updateInProgress;
      case 'UPDATE_SUCCESSFUL':
        return ResourceStatus.updateSuccessful;
      case 'UPDATE_FAILED':
        return ResourceStatus.updateFailed;
      case 'DELETED':
        return ResourceStatus.deleted;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

class RestoreAnalysisResponse {
  /// The ID of the analysis that you're restoring.
  final String? analysisId;

  /// The Amazon Resource Name (ARN) of the analysis that you're restoring.
  final String? arn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  RestoreAnalysisResponse({
    this.analysisId,
    this.arn,
    this.requestId,
    this.status,
  });

  factory RestoreAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return RestoreAnalysisResponse(
      analysisId: json['AnalysisId'] as String?,
      arn: json['Arn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    final arn = this.arn;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisId != null) 'AnalysisId': analysisId,
      if (arn != null) 'Arn': arn,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

/// Information about rows for a data set SPICE ingestion.
class RowInfo {
  /// The number of rows that were not ingested.
  final int? rowsDropped;

  /// The number of rows that were ingested.
  final int? rowsIngested;

  RowInfo({
    this.rowsDropped,
    this.rowsIngested,
  });

  factory RowInfo.fromJson(Map<String, dynamic> json) {
    return RowInfo(
      rowsDropped: json['RowsDropped'] as int?,
      rowsIngested: json['RowsIngested'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final rowsDropped = this.rowsDropped;
    final rowsIngested = this.rowsIngested;
    return {
      if (rowsDropped != null) 'RowsDropped': rowsDropped,
      if (rowsIngested != null) 'RowsIngested': rowsIngested,
    };
  }
}

/// Information about a dataset that contains permissions for row-level security
/// (RLS). The permissions dataset maps fields to users or groups. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/quicksight/latest/user/restrict-access-to-a-data-set-using-row-level-security.html">Using
/// Row-Level Security (RLS) to Restrict Access to a Dataset</a> in the
/// <i>Amazon QuickSight User Guide</i>.
///
/// The option to deny permissions by setting <code>PermissionPolicy</code> to
/// <code>DENY_ACCESS</code> is not supported for new RLS datasets.
class RowLevelPermissionDataSet {
  /// The Amazon Resource Name (ARN) of the dataset that contains permissions for
  /// RLS.
  final String arn;

  /// The type of permissions to use when interpretting the permissions for RLS.
  /// <code>DENY_ACCESS</code> is included for backward compatibility only.
  final RowLevelPermissionPolicy permissionPolicy;

  /// The user or group rules associated with the dataset that contains
  /// permissions for RLS.
  ///
  /// By default, <code>FormatVersion</code> is <code>VERSION_1</code>. When
  /// <code>FormatVersion</code> is <code>VERSION_1</code>, <code>UserName</code>
  /// and <code>GroupName</code> are required. When <code>FormatVersion</code> is
  /// <code>VERSION_2</code>, <code>UserARN</code> and <code>GroupARN</code> are
  /// required, and <code>Namespace</code> must not exist.
  final RowLevelPermissionFormatVersion? formatVersion;

  /// The namespace associated with the dataset that contains permissions for RLS.
  final String? namespace;

  RowLevelPermissionDataSet({
    required this.arn,
    required this.permissionPolicy,
    this.formatVersion,
    this.namespace,
  });

  factory RowLevelPermissionDataSet.fromJson(Map<String, dynamic> json) {
    return RowLevelPermissionDataSet(
      arn: json['Arn'] as String,
      permissionPolicy:
          (json['PermissionPolicy'] as String).toRowLevelPermissionPolicy(),
      formatVersion: (json['FormatVersion'] as String?)
          ?.toRowLevelPermissionFormatVersion(),
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final permissionPolicy = this.permissionPolicy;
    final formatVersion = this.formatVersion;
    final namespace = this.namespace;
    return {
      'Arn': arn,
      'PermissionPolicy': permissionPolicy.toValue(),
      if (formatVersion != null) 'FormatVersion': formatVersion.toValue(),
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

enum RowLevelPermissionFormatVersion {
  version_1,
  version_2,
}

extension on RowLevelPermissionFormatVersion {
  String toValue() {
    switch (this) {
      case RowLevelPermissionFormatVersion.version_1:
        return 'VERSION_1';
      case RowLevelPermissionFormatVersion.version_2:
        return 'VERSION_2';
    }
  }
}

extension on String {
  RowLevelPermissionFormatVersion toRowLevelPermissionFormatVersion() {
    switch (this) {
      case 'VERSION_1':
        return RowLevelPermissionFormatVersion.version_1;
      case 'VERSION_2':
        return RowLevelPermissionFormatVersion.version_2;
    }
    throw Exception(
        '$this is not known in enum RowLevelPermissionFormatVersion');
  }
}

enum RowLevelPermissionPolicy {
  grantAccess,
  denyAccess,
}

extension on RowLevelPermissionPolicy {
  String toValue() {
    switch (this) {
      case RowLevelPermissionPolicy.grantAccess:
        return 'GRANT_ACCESS';
      case RowLevelPermissionPolicy.denyAccess:
        return 'DENY_ACCESS';
    }
  }
}

extension on String {
  RowLevelPermissionPolicy toRowLevelPermissionPolicy() {
    switch (this) {
      case 'GRANT_ACCESS':
        return RowLevelPermissionPolicy.grantAccess;
      case 'DENY_ACCESS':
        return RowLevelPermissionPolicy.denyAccess;
    }
    throw Exception('$this is not known in enum RowLevelPermissionPolicy');
  }
}

/// S3 parameters.
class S3Parameters {
  /// Location of the Amazon S3 manifest file. This is NULL if the manifest file
  /// was uploaded in the console.
  final ManifestFileLocation manifestFileLocation;

  S3Parameters({
    required this.manifestFileLocation,
  });

  factory S3Parameters.fromJson(Map<String, dynamic> json) {
    return S3Parameters(
      manifestFileLocation: ManifestFileLocation.fromJson(
          json['ManifestFileLocation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final manifestFileLocation = this.manifestFileLocation;
    return {
      'ManifestFileLocation': manifestFileLocation,
    };
  }
}

/// A physical table type for an S3 data source.
class S3Source {
  /// The Amazon Resource Name (ARN) for the data source.
  final String dataSourceArn;

  /// A physical table type for an S3 data source.
  /// <note>
  /// For non-JSON files, only <code>STRING</code> data types are supported in
  /// input columns.
  /// </note>
  final List<InputColumn> inputColumns;

  /// Information about the format for the S3 source file or files.
  final UploadSettings? uploadSettings;

  S3Source({
    required this.dataSourceArn,
    required this.inputColumns,
    this.uploadSettings,
  });

  factory S3Source.fromJson(Map<String, dynamic> json) {
    return S3Source(
      dataSourceArn: json['DataSourceArn'] as String,
      inputColumns: (json['InputColumns'] as List)
          .whereNotNull()
          .map((e) => InputColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploadSettings: json['UploadSettings'] != null
          ? UploadSettings.fromJson(
              json['UploadSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final inputColumns = this.inputColumns;
    final uploadSettings = this.uploadSettings;
    return {
      'DataSourceArn': dataSourceArn,
      'InputColumns': inputColumns,
      if (uploadSettings != null) 'UploadSettings': uploadSettings,
    };
  }
}

class SearchAnalysesResponse {
  /// Metadata describing the analyses that you searched for.
  final List<AnalysisSummary>? analysisSummaryList;

  /// A pagination token that can be used in a subsequent request.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  SearchAnalysesResponse({
    this.analysisSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory SearchAnalysesResponse.fromJson(Map<String, dynamic> json) {
    return SearchAnalysesResponse(
      analysisSummaryList: (json['AnalysisSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => AnalysisSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisSummaryList = this.analysisSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisSummaryList != null)
        'AnalysisSummaryList': analysisSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class SearchDashboardsResponse {
  /// The list of dashboards owned by the user specified in <code>Filters</code>
  /// in your request.
  final List<DashboardSummary>? dashboardSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  SearchDashboardsResponse({
    this.dashboardSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory SearchDashboardsResponse.fromJson(Map<String, dynamic> json) {
    return SearchDashboardsResponse(
      dashboardSummaryList: (json['DashboardSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => DashboardSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardSummaryList = this.dashboardSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboardSummaryList != null)
        'DashboardSummaryList': dashboardSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class SearchFoldersResponse {
  /// A structure that contains all of the folders in your AWS account. This
  /// structure provides basic information about the folders.
  final List<FolderSummary>? folderSummaryList;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>.
  final int? status;

  SearchFoldersResponse({
    this.folderSummaryList,
    this.nextToken,
    this.requestId,
    this.status,
  });

  factory SearchFoldersResponse.fromJson(Map<String, dynamic> json) {
    return SearchFoldersResponse(
      folderSummaryList: (json['FolderSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => FolderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final folderSummaryList = this.folderSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (folderSummaryList != null) 'FolderSummaryList': folderSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

/// ServiceNow parameters.
class ServiceNowParameters {
  /// URL of the base site.
  final String siteBaseUrl;

  ServiceNowParameters({
    required this.siteBaseUrl,
  });

  factory ServiceNowParameters.fromJson(Map<String, dynamic> json) {
    return ServiceNowParameters(
      siteBaseUrl: json['SiteBaseUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final siteBaseUrl = this.siteBaseUrl;
    return {
      'SiteBaseUrl': siteBaseUrl,
    };
  }
}

/// A <i>sheet</i>, which is an object that contains a set of visuals that are
/// viewed together on one page in the Amazon QuickSight console. Every analysis
/// and dashboard contains at least one sheet. Each sheet contains at least one
/// visualization widget, for example a chart, pivot table, or narrative
/// insight. Sheets can be associated with other components, such as controls,
/// filters, and so on.
class Sheet {
  /// The name of a sheet. This name is displayed on the sheet's tab in the
  /// QuickSight console.
  final String? name;

  /// The unique identifier associated with a sheet.
  final String? sheetId;

  Sheet({
    this.name,
    this.sheetId,
  });

  factory Sheet.fromJson(Map<String, dynamic> json) {
    return Sheet(
      name: json['Name'] as String?,
      sheetId: json['SheetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sheetId = this.sheetId;
    return {
      if (name != null) 'Name': name,
      if (sheetId != null) 'SheetId': sheetId,
    };
  }
}

/// Sheet controls option.
class SheetControlsOption {
  /// Visibility state.
  final DashboardUIState? visibilityState;

  SheetControlsOption({
    this.visibilityState,
  });

  factory SheetControlsOption.fromJson(Map<String, dynamic> json) {
    return SheetControlsOption(
      visibilityState:
          (json['VisibilityState'] as String?)?.toDashboardUIState(),
    );
  }

  Map<String, dynamic> toJson() {
    final visibilityState = this.visibilityState;
    return {
      if (visibilityState != null) 'VisibilityState': visibilityState.toValue(),
    };
  }
}

/// The theme display options for sheets.
class SheetStyle {
  /// The display options for tiles.
  final TileStyle? tile;

  /// The layout options for tiles.
  final TileLayoutStyle? tileLayout;

  SheetStyle({
    this.tile,
    this.tileLayout,
  });

  factory SheetStyle.fromJson(Map<String, dynamic> json) {
    return SheetStyle(
      tile: json['Tile'] != null
          ? TileStyle.fromJson(json['Tile'] as Map<String, dynamic>)
          : null,
      tileLayout: json['TileLayout'] != null
          ? TileLayoutStyle.fromJson(json['TileLayout'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tile = this.tile;
    final tileLayout = this.tileLayout;
    return {
      if (tile != null) 'Tile': tile,
      if (tileLayout != null) 'TileLayout': tileLayout,
    };
  }
}

/// Snowflake parameters.
class SnowflakeParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Warehouse.
  final String warehouse;

  SnowflakeParameters({
    required this.database,
    required this.host,
    required this.warehouse,
  });

  factory SnowflakeParameters.fromJson(Map<String, dynamic> json) {
    return SnowflakeParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      warehouse: json['Warehouse'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final warehouse = this.warehouse;
    return {
      'Database': database,
      'Host': host,
      'Warehouse': warehouse,
    };
  }
}

/// Spark parameters.
class SparkParameters {
  /// Host.
  final String host;

  /// Port.
  final int port;

  SparkParameters({
    required this.host,
    required this.port,
  });

  factory SparkParameters.fromJson(Map<String, dynamic> json) {
    return SparkParameters(
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final host = this.host;
    final port = this.port;
    return {
      'Host': host,
      'Port': port,
    };
  }
}

/// SQL Server parameters.
class SqlServerParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  SqlServerParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory SqlServerParameters.fromJson(Map<String, dynamic> json) {
    return SqlServerParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

/// Secure Socket Layer (SSL) properties that apply when QuickSight connects to
/// your underlying data source.
class SslProperties {
  /// A Boolean option to control whether SSL should be disabled.
  final bool? disableSsl;

  SslProperties({
    this.disableSsl,
  });

  factory SslProperties.fromJson(Map<String, dynamic> json) {
    return SslProperties(
      disableSsl: json['DisableSsl'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final disableSsl = this.disableSsl;
    return {
      if (disableSsl != null) 'DisableSsl': disableSsl,
    };
  }
}

/// A string parameter.
class StringParameter {
  /// A display name for a string parameter.
  final String name;

  /// The values of a string parameter.
  final List<String> values;

  StringParameter({
    required this.name,
    required this.values,
  });

  factory StringParameter.fromJson(Map<String, dynamic> json) {
    return StringParameter(
      name: json['Name'] as String,
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name,
      'Values': values,
    };
  }
}

/// The key or keys of the key-value pairs for the resource tag or tags assigned
/// to the resource.
class Tag {
  /// Tag key.
  final String key;

  /// Tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// A transform operation that tags a column with additional information.
class TagColumnOperation {
  /// The column that this operation acts on.
  final String columnName;

  /// The dataset column tag, currently only used for geospatial type tagging. .
  /// <note>
  /// This is not tags for the AWS tagging feature. .
  /// </note>
  final List<ColumnTag> tags;

  TagColumnOperation({
    required this.columnName,
    required this.tags,
  });

  factory TagColumnOperation.fromJson(Map<String, dynamic> json) {
    return TagColumnOperation(
      columnName: json['ColumnName'] as String,
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => ColumnTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final columnName = this.columnName;
    final tags = this.tags;
    return {
      'ColumnName': columnName,
      'Tags': tags,
    };
  }
}

class TagResourceResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  TagResourceResponse({
    this.requestId,
    this.status,
  });

  factory TagResourceResponse.fromJson(Map<String, dynamic> json) {
    return TagResourceResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
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
class Template {
  /// The Amazon Resource Name (ARN) of the template.
  final String? arn;

  /// Time when this was created.
  final DateTime? createdTime;

  /// Time when this was last updated.
  final DateTime? lastUpdatedTime;

  /// The display name of the template.
  final String? name;

  /// The ID for the template. This is unique per AWS Region for each AWS account.
  final String? templateId;

  /// A structure describing the versions of the template.
  final TemplateVersion? version;

  Template({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.name,
    this.templateId,
    this.version,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      templateId: json['TemplateId'] as String?,
      version: json['Version'] != null
          ? TemplateVersion.fromJson(json['Version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final templateId = this.templateId;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (templateId != null) 'TemplateId': templateId,
      if (version != null) 'Version': version,
    };
  }
}

/// The template alias.
class TemplateAlias {
  /// The display name of the template alias.
  final String? aliasName;

  /// The Amazon Resource Name (ARN) of the template alias.
  final String? arn;

  /// The version number of the template alias.
  final int? templateVersionNumber;

  TemplateAlias({
    this.aliasName,
    this.arn,
    this.templateVersionNumber,
  });

  factory TemplateAlias.fromJson(Map<String, dynamic> json) {
    return TemplateAlias(
      aliasName: json['AliasName'] as String?,
      arn: json['Arn'] as String?,
      templateVersionNumber: json['TemplateVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasName = this.aliasName;
    final arn = this.arn;
    final templateVersionNumber = this.templateVersionNumber;
    return {
      if (aliasName != null) 'AliasName': aliasName,
      if (arn != null) 'Arn': arn,
      if (templateVersionNumber != null)
        'TemplateVersionNumber': templateVersionNumber,
    };
  }
}

/// List of errors that occurred when the template version creation failed.
class TemplateError {
  /// Description of the error type.
  final String? message;

  /// Type of error.
  final TemplateErrorType? type;

  TemplateError({
    this.message,
    this.type,
  });

  factory TemplateError.fromJson(Map<String, dynamic> json) {
    return TemplateError(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toTemplateErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum TemplateErrorType {
  sourceNotFound,
  dataSetNotFound,
  internalFailure,
  accessDenied,
}

extension on TemplateErrorType {
  String toValue() {
    switch (this) {
      case TemplateErrorType.sourceNotFound:
        return 'SOURCE_NOT_FOUND';
      case TemplateErrorType.dataSetNotFound:
        return 'DATA_SET_NOT_FOUND';
      case TemplateErrorType.internalFailure:
        return 'INTERNAL_FAILURE';
      case TemplateErrorType.accessDenied:
        return 'ACCESS_DENIED';
    }
  }
}

extension on String {
  TemplateErrorType toTemplateErrorType() {
    switch (this) {
      case 'SOURCE_NOT_FOUND':
        return TemplateErrorType.sourceNotFound;
      case 'DATA_SET_NOT_FOUND':
        return TemplateErrorType.dataSetNotFound;
      case 'INTERNAL_FAILURE':
        return TemplateErrorType.internalFailure;
      case 'ACCESS_DENIED':
        return TemplateErrorType.accessDenied;
    }
    throw Exception('$this is not known in enum TemplateErrorType');
  }
}

/// The source analysis of the template.
class TemplateSourceAnalysis {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  /// A structure containing information about the dataset references used as
  /// placeholders in the template.
  final List<DataSetReference> dataSetReferences;

  TemplateSourceAnalysis({
    required this.arn,
    required this.dataSetReferences,
  });

  factory TemplateSourceAnalysis.fromJson(Map<String, dynamic> json) {
    return TemplateSourceAnalysis(
      arn: json['Arn'] as String,
      dataSetReferences: (json['DataSetReferences'] as List)
          .whereNotNull()
          .map((e) => DataSetReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSetReferences = this.dataSetReferences;
    return {
      'Arn': arn,
      'DataSetReferences': dataSetReferences,
    };
  }
}

/// The source entity of the template.
class TemplateSourceEntity {
  /// The source analysis, if it is based on an analysis.
  final TemplateSourceAnalysis? sourceAnalysis;

  /// The source template, if it is based on an template.
  final TemplateSourceTemplate? sourceTemplate;

  TemplateSourceEntity({
    this.sourceAnalysis,
    this.sourceTemplate,
  });

  factory TemplateSourceEntity.fromJson(Map<String, dynamic> json) {
    return TemplateSourceEntity(
      sourceAnalysis: json['SourceAnalysis'] != null
          ? TemplateSourceAnalysis.fromJson(
              json['SourceAnalysis'] as Map<String, dynamic>)
          : null,
      sourceTemplate: json['SourceTemplate'] != null
          ? TemplateSourceTemplate.fromJson(
              json['SourceTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceAnalysis = this.sourceAnalysis;
    final sourceTemplate = this.sourceTemplate;
    return {
      if (sourceAnalysis != null) 'SourceAnalysis': sourceAnalysis,
      if (sourceTemplate != null) 'SourceTemplate': sourceTemplate,
    };
  }
}

/// The source template of the template.
class TemplateSourceTemplate {
  /// The Amazon Resource Name (ARN) of the resource.
  final String arn;

  TemplateSourceTemplate({
    required this.arn,
  });

  factory TemplateSourceTemplate.fromJson(Map<String, dynamic> json) {
    return TemplateSourceTemplate(
      arn: json['Arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

/// The template summary.
class TemplateSummary {
  /// A summary of a template.
  final String? arn;

  /// The last time that this template was created.
  final DateTime? createdTime;

  /// The last time that this template was updated.
  final DateTime? lastUpdatedTime;

  /// A structure containing a list of version numbers for the template summary.
  final int? latestVersionNumber;

  /// A display name for the template.
  final String? name;

  /// The ID of the template. This ID is unique per AWS Region for each AWS
  /// account.
  final String? templateId;

  TemplateSummary({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.latestVersionNumber,
    this.name,
    this.templateId,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      latestVersionNumber: json['LatestVersionNumber'] as int?,
      name: json['Name'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final latestVersionNumber = this.latestVersionNumber;
    final name = this.name;
    final templateId = this.templateId;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (latestVersionNumber != null)
        'LatestVersionNumber': latestVersionNumber,
      if (name != null) 'Name': name,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

/// A version of a template.
class TemplateVersion {
  /// The time that this template version was created.
  final DateTime? createdTime;

  /// Schema of the dataset identified by the placeholder. Any dashboard created
  /// from this template should be bound to new datasets matching the same schema
  /// described through this API operation.
  final List<DataSetConfiguration>? dataSetConfigurations;

  /// The description of the template.
  final String? description;

  /// Errors associated with this template version.
  final List<TemplateError>? errors;

  /// A list of the associated sheets with the unique identifier and name of each
  /// sheet.
  final List<Sheet>? sheets;

  /// The Amazon Resource Name (ARN) of an analysis or template that was used to
  /// create this template.
  final String? sourceEntityArn;

  /// The HTTP status of the request.
  final ResourceStatus? status;

  /// The ARN of the theme associated with this version of the template.
  final String? themeArn;

  /// The version number of the template version.
  final int? versionNumber;

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

  factory TemplateVersion.fromJson(Map<String, dynamic> json) {
    return TemplateVersion(
      createdTime: timeStampFromJson(json['CreatedTime']),
      dataSetConfigurations: (json['DataSetConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => DataSetConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => TemplateError.fromJson(e as Map<String, dynamic>))
          .toList(),
      sheets: (json['Sheets'] as List?)
          ?.whereNotNull()
          .map((e) => Sheet.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceEntityArn: json['SourceEntityArn'] as String?,
      status: (json['Status'] as String?)?.toResourceStatus(),
      themeArn: json['ThemeArn'] as String?,
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTime = this.createdTime;
    final dataSetConfigurations = this.dataSetConfigurations;
    final description = this.description;
    final errors = this.errors;
    final sheets = this.sheets;
    final sourceEntityArn = this.sourceEntityArn;
    final status = this.status;
    final themeArn = this.themeArn;
    final versionNumber = this.versionNumber;
    return {
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (dataSetConfigurations != null)
        'DataSetConfigurations': dataSetConfigurations,
      if (description != null) 'Description': description,
      if (errors != null) 'Errors': errors,
      if (sheets != null) 'Sheets': sheets,
      if (sourceEntityArn != null) 'SourceEntityArn': sourceEntityArn,
      if (status != null) 'Status': status.toValue(),
      if (themeArn != null) 'ThemeArn': themeArn,
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// The template version.
class TemplateVersionSummary {
  /// The Amazon Resource Name (ARN) of the template version.
  final String? arn;

  /// The time that this template version was created.
  final DateTime? createdTime;

  /// The description of the template version.
  final String? description;

  /// The status of the template version.
  final ResourceStatus? status;

  /// The version number of the template version.
  final int? versionNumber;

  TemplateVersionSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.status,
    this.versionNumber,
  });

  factory TemplateVersionSummary.fromJson(Map<String, dynamic> json) {
    return TemplateVersionSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      status: (json['Status'] as String?)?.toResourceStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// Teradata parameters.
class TeradataParameters {
  /// Database.
  final String database;

  /// Host.
  final String host;

  /// Port.
  final int port;

  TeradataParameters({
    required this.database,
    required this.host,
    required this.port,
  });

  factory TeradataParameters.fromJson(Map<String, dynamic> json) {
    return TeradataParameters(
      database: json['Database'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final host = this.host;
    final port = this.port;
    return {
      'Database': database,
      'Host': host,
      'Port': port,
    };
  }
}

enum TextQualifier {
  doubleQuote,
  singleQuote,
}

extension on TextQualifier {
  String toValue() {
    switch (this) {
      case TextQualifier.doubleQuote:
        return 'DOUBLE_QUOTE';
      case TextQualifier.singleQuote:
        return 'SINGLE_QUOTE';
    }
  }
}

extension on String {
  TextQualifier toTextQualifier() {
    switch (this) {
      case 'DOUBLE_QUOTE':
        return TextQualifier.doubleQuote;
      case 'SINGLE_QUOTE':
        return TextQualifier.singleQuote;
    }
    throw Exception('$this is not known in enum TextQualifier');
  }
}

/// Summary information about a theme.
class Theme {
  /// The Amazon Resource Name (ARN) of the theme.
  final String? arn;

  /// The date and time that the theme was created.
  final DateTime? createdTime;

  /// The date and time that the theme was last updated.
  final DateTime? lastUpdatedTime;

  /// The name that the user gives to the theme.
  final String? name;

  /// The identifier that the user gives to the theme.
  final String? themeId;

  /// The type of theme, based on how it was created. Valid values include:
  /// <code>QUICKSIGHT</code> and <code>CUSTOM</code>.
  final ThemeType? type;
  final ThemeVersion? version;

  Theme({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.name,
    this.themeId,
    this.type,
    this.version,
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      themeId: json['ThemeId'] as String?,
      type: (json['Type'] as String?)?.toThemeType(),
      version: json['Version'] != null
          ? ThemeVersion.fromJson(json['Version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final themeId = this.themeId;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (themeId != null) 'ThemeId': themeId,
      if (type != null) 'Type': type.toValue(),
      if (version != null) 'Version': version,
    };
  }
}

/// An alias for a theme.
class ThemeAlias {
  /// The display name of the theme alias.
  final String? aliasName;

  /// The Amazon Resource Name (ARN) of the theme alias.
  final String? arn;

  /// The version number of the theme alias.
  final int? themeVersionNumber;

  ThemeAlias({
    this.aliasName,
    this.arn,
    this.themeVersionNumber,
  });

  factory ThemeAlias.fromJson(Map<String, dynamic> json) {
    return ThemeAlias(
      aliasName: json['AliasName'] as String?,
      arn: json['Arn'] as String?,
      themeVersionNumber: json['ThemeVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasName = this.aliasName;
    final arn = this.arn;
    final themeVersionNumber = this.themeVersionNumber;
    return {
      if (aliasName != null) 'AliasName': aliasName,
      if (arn != null) 'Arn': arn,
      if (themeVersionNumber != null) 'ThemeVersionNumber': themeVersionNumber,
    };
  }
}

/// The theme configuration. This configuration contains all of the display
/// properties for a theme.
class ThemeConfiguration {
  /// Color properties that apply to chart data colors.
  final DataColorPalette? dataColorPalette;

  /// Display options related to sheets.
  final SheetStyle? sheet;

  /// Color properties that apply to the UI and to charts, excluding the colors
  /// that apply to data.
  final UIColorPalette? uIColorPalette;

  ThemeConfiguration({
    this.dataColorPalette,
    this.sheet,
    this.uIColorPalette,
  });

  factory ThemeConfiguration.fromJson(Map<String, dynamic> json) {
    return ThemeConfiguration(
      dataColorPalette: json['DataColorPalette'] != null
          ? DataColorPalette.fromJson(
              json['DataColorPalette'] as Map<String, dynamic>)
          : null,
      sheet: json['Sheet'] != null
          ? SheetStyle.fromJson(json['Sheet'] as Map<String, dynamic>)
          : null,
      uIColorPalette: json['UIColorPalette'] != null
          ? UIColorPalette.fromJson(
              json['UIColorPalette'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataColorPalette = this.dataColorPalette;
    final sheet = this.sheet;
    final uIColorPalette = this.uIColorPalette;
    return {
      if (dataColorPalette != null) 'DataColorPalette': dataColorPalette,
      if (sheet != null) 'Sheet': sheet,
      if (uIColorPalette != null) 'UIColorPalette': uIColorPalette,
    };
  }
}

/// Theme error.
class ThemeError {
  /// The error message.
  final String? message;

  /// The type of error.
  final ThemeErrorType? type;

  ThemeError({
    this.message,
    this.type,
  });

  factory ThemeError.fromJson(Map<String, dynamic> json) {
    return ThemeError(
      message: json['Message'] as String?,
      type: (json['Type'] as String?)?.toThemeErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final type = this.type;
    return {
      if (message != null) 'Message': message,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ThemeErrorType {
  internalFailure,
}

extension on ThemeErrorType {
  String toValue() {
    switch (this) {
      case ThemeErrorType.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension on String {
  ThemeErrorType toThemeErrorType() {
    switch (this) {
      case 'INTERNAL_FAILURE':
        return ThemeErrorType.internalFailure;
    }
    throw Exception('$this is not known in enum ThemeErrorType');
  }
}

/// The theme summary.
class ThemeSummary {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The date and time that this theme was created.
  final DateTime? createdTime;

  /// The last date and time that this theme was updated.
  final DateTime? lastUpdatedTime;

  /// The latest version number for the theme.
  final int? latestVersionNumber;

  /// the display name for the theme.
  final String? name;

  /// The ID of the theme. This ID is unique per AWS Region for each AWS account.
  final String? themeId;

  ThemeSummary({
    this.arn,
    this.createdTime,
    this.lastUpdatedTime,
    this.latestVersionNumber,
    this.name,
    this.themeId,
  });

  factory ThemeSummary.fromJson(Map<String, dynamic> json) {
    return ThemeSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      latestVersionNumber: json['LatestVersionNumber'] as int?,
      name: json['Name'] as String?,
      themeId: json['ThemeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final latestVersionNumber = this.latestVersionNumber;
    final name = this.name;
    final themeId = this.themeId;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (latestVersionNumber != null)
        'LatestVersionNumber': latestVersionNumber,
      if (name != null) 'Name': name,
      if (themeId != null) 'ThemeId': themeId,
    };
  }
}

enum ThemeType {
  quicksight,
  custom,
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
  }
}

extension on String {
  ThemeType toThemeType() {
    switch (this) {
      case 'QUICKSIGHT':
        return ThemeType.quicksight;
      case 'CUSTOM':
        return ThemeType.custom;
      case 'ALL':
        return ThemeType.all;
    }
    throw Exception('$this is not known in enum ThemeType');
  }
}

/// A version of a theme.
class ThemeVersion {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The Amazon QuickSight-defined ID of the theme that a custom theme inherits
  /// from. All themes initially inherit from a default QuickSight theme.
  final String? baseThemeId;

  /// The theme configuration, which contains all the theme display properties.
  final ThemeConfiguration? configuration;

  /// The date and time that this theme version was created.
  final DateTime? createdTime;

  /// The description of the theme.
  final String? description;

  /// Errors associated with the theme.
  final List<ThemeError>? errors;

  /// The status of the theme version.
  final ResourceStatus? status;

  /// The version number of the theme.
  final int? versionNumber;

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

  factory ThemeVersion.fromJson(Map<String, dynamic> json) {
    return ThemeVersion(
      arn: json['Arn'] as String?,
      baseThemeId: json['BaseThemeId'] as String?,
      configuration: json['Configuration'] != null
          ? ThemeConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => ThemeError.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toResourceStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final baseThemeId = this.baseThemeId;
    final configuration = this.configuration;
    final createdTime = this.createdTime;
    final description = this.description;
    final errors = this.errors;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (baseThemeId != null) 'BaseThemeId': baseThemeId,
      if (configuration != null) 'Configuration': configuration,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (errors != null) 'Errors': errors,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// The theme version.
class ThemeVersionSummary {
  /// The Amazon Resource Name (ARN) of the theme version.
  final String? arn;

  /// The date and time that this theme version was created.
  final DateTime? createdTime;

  /// The description of the theme version.
  final String? description;

  /// The status of the theme version.
  final ResourceStatus? status;

  /// The version number of the theme version.
  final int? versionNumber;

  ThemeVersionSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.status,
    this.versionNumber,
  });

  factory ThemeVersionSummary.fromJson(Map<String, dynamic> json) {
    return ThemeVersionSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      status: (json['Status'] as String?)?.toResourceStatus(),
      versionNumber: json['VersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final status = this.status;
    final versionNumber = this.versionNumber;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (status != null) 'Status': status.toValue(),
      if (versionNumber != null) 'VersionNumber': versionNumber,
    };
  }
}

/// The display options for the layout of tiles on a sheet.
class TileLayoutStyle {
  /// The gutter settings that apply between tiles.
  final GutterStyle? gutter;

  /// The margin settings that apply around the outside edge of sheets.
  final MarginStyle? margin;

  TileLayoutStyle({
    this.gutter,
    this.margin,
  });

  factory TileLayoutStyle.fromJson(Map<String, dynamic> json) {
    return TileLayoutStyle(
      gutter: json['Gutter'] != null
          ? GutterStyle.fromJson(json['Gutter'] as Map<String, dynamic>)
          : null,
      margin: json['Margin'] != null
          ? MarginStyle.fromJson(json['Margin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gutter = this.gutter;
    final margin = this.margin;
    return {
      if (gutter != null) 'Gutter': gutter,
      if (margin != null) 'Margin': margin,
    };
  }
}

/// Display options related to tiles on a sheet.
class TileStyle {
  /// The border around a tile.
  final BorderStyle? border;

  TileStyle({
    this.border,
  });

  factory TileStyle.fromJson(Map<String, dynamic> json) {
    return TileStyle(
      border: json['Border'] != null
          ? BorderStyle.fromJson(json['Border'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final border = this.border;
    return {
      if (border != null) 'Border': border,
    };
  }
}

/// A data transformation on a logical table. This is a variant type structure.
/// For this structure to be valid, only one of the attributes can be non-null.
class TransformOperation {
  /// A transform operation that casts a column to a different type.
  final CastColumnTypeOperation? castColumnTypeOperation;

  /// An operation that creates calculated columns. Columns created in one such
  /// operation form a lexical closure.
  final CreateColumnsOperation? createColumnsOperation;

  /// An operation that filters rows based on some condition.
  final FilterOperation? filterOperation;

  /// An operation that projects columns. Operations that come after a projection
  /// can only refer to projected columns.
  final ProjectOperation? projectOperation;

  /// An operation that renames a column.
  final RenameColumnOperation? renameColumnOperation;

  /// An operation that tags a column with additional information.
  final TagColumnOperation? tagColumnOperation;

  TransformOperation({
    this.castColumnTypeOperation,
    this.createColumnsOperation,
    this.filterOperation,
    this.projectOperation,
    this.renameColumnOperation,
    this.tagColumnOperation,
  });

  factory TransformOperation.fromJson(Map<String, dynamic> json) {
    return TransformOperation(
      castColumnTypeOperation: json['CastColumnTypeOperation'] != null
          ? CastColumnTypeOperation.fromJson(
              json['CastColumnTypeOperation'] as Map<String, dynamic>)
          : null,
      createColumnsOperation: json['CreateColumnsOperation'] != null
          ? CreateColumnsOperation.fromJson(
              json['CreateColumnsOperation'] as Map<String, dynamic>)
          : null,
      filterOperation: json['FilterOperation'] != null
          ? FilterOperation.fromJson(
              json['FilterOperation'] as Map<String, dynamic>)
          : null,
      projectOperation: json['ProjectOperation'] != null
          ? ProjectOperation.fromJson(
              json['ProjectOperation'] as Map<String, dynamic>)
          : null,
      renameColumnOperation: json['RenameColumnOperation'] != null
          ? RenameColumnOperation.fromJson(
              json['RenameColumnOperation'] as Map<String, dynamic>)
          : null,
      tagColumnOperation: json['TagColumnOperation'] != null
          ? TagColumnOperation.fromJson(
              json['TagColumnOperation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final castColumnTypeOperation = this.castColumnTypeOperation;
    final createColumnsOperation = this.createColumnsOperation;
    final filterOperation = this.filterOperation;
    final projectOperation = this.projectOperation;
    final renameColumnOperation = this.renameColumnOperation;
    final tagColumnOperation = this.tagColumnOperation;
    return {
      if (castColumnTypeOperation != null)
        'CastColumnTypeOperation': castColumnTypeOperation,
      if (createColumnsOperation != null)
        'CreateColumnsOperation': createColumnsOperation,
      if (filterOperation != null) 'FilterOperation': filterOperation,
      if (projectOperation != null) 'ProjectOperation': projectOperation,
      if (renameColumnOperation != null)
        'RenameColumnOperation': renameColumnOperation,
      if (tagColumnOperation != null) 'TagColumnOperation': tagColumnOperation,
    };
  }
}

/// Twitter parameters.
class TwitterParameters {
  /// Maximum number of rows to query Twitter.
  final int maxRows;

  /// Twitter query string.
  final String query;

  TwitterParameters({
    required this.maxRows,
    required this.query,
  });

  factory TwitterParameters.fromJson(Map<String, dynamic> json) {
    return TwitterParameters(
      maxRows: json['MaxRows'] as int,
      query: json['Query'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRows = this.maxRows;
    final query = this.query;
    return {
      'MaxRows': maxRows,
      'Query': query,
    };
  }
}

/// The theme colors that apply to UI and to charts, excluding data colors. The
/// colors description is a hexadecimal color code that consists of six
/// alphanumerical characters, prefixed with <code>#</code>, for example
/// #37BFF5. For more information, see <a
/// href="https://docs.aws.amazon.com/quicksight/latest/user/themes-in-quicksight.html">Using
/// Themes in Amazon QuickSight</a> in the <i>Amazon QuickSight User Guide.</i>
class UIColorPalette {
  /// This color is that applies to selected states and buttons.
  final String? accent;

  /// The foreground color that applies to any text or other elements that appear
  /// over the accent color.
  final String? accentForeground;

  /// The color that applies to error messages.
  final String? danger;

  /// The foreground color that applies to any text or other elements that appear
  /// over the error color.
  final String? dangerForeground;

  /// The color that applies to the names of fields that are identified as
  /// dimensions.
  final String? dimension;

  /// The foreground color that applies to any text or other elements that appear
  /// over the dimension color.
  final String? dimensionForeground;

  /// The color that applies to the names of fields that are identified as
  /// measures.
  final String? measure;

  /// The foreground color that applies to any text or other elements that appear
  /// over the measure color.
  final String? measureForeground;

  /// The background color that applies to visuals and other high emphasis UI.
  final String? primaryBackground;

  /// The color of text and other foreground elements that appear over the primary
  /// background regions, such as grid lines, borders, table banding, icons, and
  /// so on.
  final String? primaryForeground;

  /// The background color that applies to the sheet background and sheet
  /// controls.
  final String? secondaryBackground;

  /// The foreground color that applies to any sheet title, sheet control text, or
  /// UI that appears over the secondary background.
  final String? secondaryForeground;

  /// The color that applies to success messages, for example the check mark for a
  /// successful download.
  final String? success;

  /// The foreground color that applies to any text or other elements that appear
  /// over the success color.
  final String? successForeground;

  /// This color that applies to warning and informational messages.
  final String? warning;

  /// The foreground color that applies to any text or other elements that appear
  /// over the warning color.
  final String? warningForeground;

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

  factory UIColorPalette.fromJson(Map<String, dynamic> json) {
    return UIColorPalette(
      accent: json['Accent'] as String?,
      accentForeground: json['AccentForeground'] as String?,
      danger: json['Danger'] as String?,
      dangerForeground: json['DangerForeground'] as String?,
      dimension: json['Dimension'] as String?,
      dimensionForeground: json['DimensionForeground'] as String?,
      measure: json['Measure'] as String?,
      measureForeground: json['MeasureForeground'] as String?,
      primaryBackground: json['PrimaryBackground'] as String?,
      primaryForeground: json['PrimaryForeground'] as String?,
      secondaryBackground: json['SecondaryBackground'] as String?,
      secondaryForeground: json['SecondaryForeground'] as String?,
      success: json['Success'] as String?,
      successForeground: json['SuccessForeground'] as String?,
      warning: json['Warning'] as String?,
      warningForeground: json['WarningForeground'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accent = this.accent;
    final accentForeground = this.accentForeground;
    final danger = this.danger;
    final dangerForeground = this.dangerForeground;
    final dimension = this.dimension;
    final dimensionForeground = this.dimensionForeground;
    final measure = this.measure;
    final measureForeground = this.measureForeground;
    final primaryBackground = this.primaryBackground;
    final primaryForeground = this.primaryForeground;
    final secondaryBackground = this.secondaryBackground;
    final secondaryForeground = this.secondaryForeground;
    final success = this.success;
    final successForeground = this.successForeground;
    final warning = this.warning;
    final warningForeground = this.warningForeground;
    return {
      if (accent != null) 'Accent': accent,
      if (accentForeground != null) 'AccentForeground': accentForeground,
      if (danger != null) 'Danger': danger,
      if (dangerForeground != null) 'DangerForeground': dangerForeground,
      if (dimension != null) 'Dimension': dimension,
      if (dimensionForeground != null)
        'DimensionForeground': dimensionForeground,
      if (measure != null) 'Measure': measure,
      if (measureForeground != null) 'MeasureForeground': measureForeground,
      if (primaryBackground != null) 'PrimaryBackground': primaryBackground,
      if (primaryForeground != null) 'PrimaryForeground': primaryForeground,
      if (secondaryBackground != null)
        'SecondaryBackground': secondaryBackground,
      if (secondaryForeground != null)
        'SecondaryForeground': secondaryForeground,
      if (success != null) 'Success': success,
      if (successForeground != null) 'SuccessForeground': successForeground,
      if (warning != null) 'Warning': warning,
      if (warningForeground != null) 'WarningForeground': warningForeground,
    };
  }
}

class UntagResourceResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UntagResourceResponse({
    this.requestId,
    this.status,
  });

  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) {
    return UntagResourceResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateAccountCustomizationResponse {
  /// The QuickSight customizations you're updating in the current AWS Region.
  final AccountCustomization? accountCustomization;

  /// The Amazon Resource Name (ARN) for the updated customization for this AWS
  /// account.
  final String? arn;

  /// The ID for the AWS account that you want to update QuickSight customizations
  /// for.
  final String? awsAccountId;

  /// The namespace associated with the customization that you're updating.
  final String? namespace;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateAccountCustomizationResponse({
    this.accountCustomization,
    this.arn,
    this.awsAccountId,
    this.namespace,
    this.requestId,
    this.status,
  });

  factory UpdateAccountCustomizationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAccountCustomizationResponse(
      accountCustomization: json['AccountCustomization'] != null
          ? AccountCustomization.fromJson(
              json['AccountCustomization'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      awsAccountId: json['AwsAccountId'] as String?,
      namespace: json['Namespace'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountCustomization = this.accountCustomization;
    final arn = this.arn;
    final awsAccountId = this.awsAccountId;
    final namespace = this.namespace;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (accountCustomization != null)
        'AccountCustomization': accountCustomization,
      if (arn != null) 'Arn': arn,
      if (awsAccountId != null) 'AwsAccountId': awsAccountId,
      if (namespace != null) 'Namespace': namespace,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateAccountSettingsResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateAccountSettingsResponse({
    this.requestId,
    this.status,
  });

  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccountSettingsResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateAnalysisPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the analysis that you updated.
  final String? analysisArn;

  /// The ID of the analysis that you updated permissions for.
  final String? analysisId;

  /// A structure that describes the principals and the resource-level permissions
  /// on an analysis.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateAnalysisPermissionsResponse({
    this.analysisArn,
    this.analysisId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory UpdateAnalysisPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAnalysisPermissionsResponse(
      analysisArn: json['AnalysisArn'] as String?,
      analysisId: json['AnalysisId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisArn = this.analysisArn;
    final analysisId = this.analysisId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (analysisArn != null) 'AnalysisArn': analysisArn,
      if (analysisId != null) 'AnalysisId': analysisId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateAnalysisResponse {
  /// The ID of the analysis.
  final String? analysisId;

  /// The ARN of the analysis that you're updating.
  final String? arn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The update status of the last update that was made to the analysis.
  final ResourceStatus? updateStatus;

  UpdateAnalysisResponse({
    this.analysisId,
    this.arn,
    this.requestId,
    this.status,
    this.updateStatus,
  });

  factory UpdateAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAnalysisResponse(
      analysisId: json['AnalysisId'] as String?,
      arn: json['Arn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      updateStatus: (json['UpdateStatus'] as String?)?.toResourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysisId = this.analysisId;
    final arn = this.arn;
    final requestId = this.requestId;
    final status = this.status;
    final updateStatus = this.updateStatus;
    return {
      if (analysisId != null) 'AnalysisId': analysisId,
      if (arn != null) 'Arn': arn,
      if (requestId != null) 'RequestId': requestId,
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

class UpdateDashboardPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  final String? dashboardArn;

  /// The ID for the dashboard.
  final String? dashboardId;

  /// Information about the permissions on the dashboard.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateDashboardPermissionsResponse({
    this.dashboardArn,
    this.dashboardId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory UpdateDashboardPermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDashboardPermissionsResponse(
      dashboardArn: json['DashboardArn'] as String?,
      dashboardId: json['DashboardId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardId = this.dashboardId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboardArn != null) 'DashboardArn': dashboardArn,
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateDashboardPublishedVersionResponse {
  /// The Amazon Resource Name (ARN) of the dashboard.
  final String? dashboardArn;

  /// The ID for the dashboard.
  final String? dashboardId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateDashboardPublishedVersionResponse({
    this.dashboardArn,
    this.dashboardId,
    this.requestId,
    this.status,
  });

  factory UpdateDashboardPublishedVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDashboardPublishedVersionResponse(
      dashboardArn: json['DashboardArn'] as String?,
      dashboardId: json['DashboardId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardId = this.dashboardId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dashboardArn != null) 'DashboardArn': dashboardArn,
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateDashboardResponse {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The creation status of the request.
  final ResourceStatus? creationStatus;

  /// The ID for the dashboard.
  final String? dashboardId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The ARN of the dashboard, including the version number.
  final String? versionArn;

  UpdateDashboardResponse({
    this.arn,
    this.creationStatus,
    this.dashboardId,
    this.requestId,
    this.status,
    this.versionArn,
  });

  factory UpdateDashboardResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDashboardResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      dashboardId: json['DashboardId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      versionArn: json['VersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final dashboardId = this.dashboardId;
    final requestId = this.requestId;
    final status = this.status;
    final versionArn = this.versionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (dashboardId != null) 'DashboardId': dashboardId,
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status,
      if (versionArn != null) 'VersionArn': versionArn,
    };
  }
}

class UpdateDataSetPermissionsResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? dataSetArn;

  /// The ID for the dataset whose permissions you want to update. This ID is
  /// unique per AWS Region for each AWS account.
  final String? dataSetId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateDataSetPermissionsResponse({
    this.dataSetArn,
    this.dataSetId,
    this.requestId,
    this.status,
  });

  factory UpdateDataSetPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSetPermissionsResponse(
      dataSetArn: json['DataSetArn'] as String?,
      dataSetId: json['DataSetId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetArn = this.dataSetArn;
    final dataSetId = this.dataSetId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSetArn != null) 'DataSetArn': dataSetArn,
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateDataSetResponse {
  /// The Amazon Resource Name (ARN) of the dataset.
  final String? arn;

  /// The ID for the dataset that you want to create. This ID is unique per AWS
  /// Region for each AWS account.
  final String? dataSetId;

  /// The ARN for the ingestion, which is triggered as a result of dataset
  /// creation if the import mode is SPICE.
  final String? ingestionArn;

  /// The ID of the ingestion, which is triggered as a result of dataset creation
  /// if the import mode is SPICE.
  final String? ingestionId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateDataSetResponse({
    this.arn,
    this.dataSetId,
    this.ingestionArn,
    this.ingestionId,
    this.requestId,
    this.status,
  });

  factory UpdateDataSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSetResponse(
      arn: json['Arn'] as String?,
      dataSetId: json['DataSetId'] as String?,
      ingestionArn: json['IngestionArn'] as String?,
      ingestionId: json['IngestionId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSetId = this.dataSetId;
    final ingestionArn = this.ingestionArn;
    final ingestionId = this.ingestionId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (dataSetId != null) 'DataSetId': dataSetId,
      if (ingestionArn != null) 'IngestionArn': ingestionArn,
      if (ingestionId != null) 'IngestionId': ingestionId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateDataSourcePermissionsResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  final String? dataSourceArn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  final String? dataSourceId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateDataSourcePermissionsResponse({
    this.dataSourceArn,
    this.dataSourceId,
    this.requestId,
    this.status,
  });

  factory UpdateDataSourcePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataSourcePermissionsResponse(
      dataSourceArn: json['DataSourceArn'] as String?,
      dataSourceId: json['DataSourceId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final dataSourceId = this.dataSourceId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (dataSourceArn != null) 'DataSourceArn': dataSourceArn,
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateDataSourceResponse {
  /// The Amazon Resource Name (ARN) of the data source.
  final String? arn;

  /// The ID of the data source. This ID is unique per AWS Region for each AWS
  /// account.
  final String? dataSourceId;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The update status of the data source's last update.
  final ResourceStatus? updateStatus;

  UpdateDataSourceResponse({
    this.arn,
    this.dataSourceId,
    this.requestId,
    this.status,
    this.updateStatus,
  });

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSourceResponse(
      arn: json['Arn'] as String?,
      dataSourceId: json['DataSourceId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      updateStatus: (json['UpdateStatus'] as String?)?.toResourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataSourceId = this.dataSourceId;
    final requestId = this.requestId;
    final status = this.status;
    final updateStatus = this.updateStatus;
    return {
      if (arn != null) 'Arn': arn,
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (requestId != null) 'RequestId': requestId,
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

class UpdateFolderPermissionsResponse {
  /// The Amazon Resource Name (ARN).
  final String? arn;

  /// The folder ID.
  final String? folderId;

  /// Information about the permissions on the dashboard.
  final List<ResourcePermission>? permissions;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>.
  final int? status;

  UpdateFolderPermissionsResponse({
    this.arn,
    this.folderId,
    this.permissions,
    this.requestId,
    this.status,
  });

  factory UpdateFolderPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFolderPermissionsResponse(
      arn: json['Arn'] as String?,
      folderId: json['FolderId'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final folderId = this.folderId;
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (folderId != null) 'FolderId': folderId,
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
      if (status != null) 'Status': status,
    };
  }
}

class UpdateFolderResponse {
  /// The Amazon Resource Name (ARN).
  final String? arn;

  /// The folder ID.
  final String? folderId;

  /// The request ID.
  final String? requestId;

  /// The status. If succeeded, the status is <code>SC_OK</code>.
  final int? status;

  UpdateFolderResponse({
    this.arn,
    this.folderId,
    this.requestId,
    this.status,
  });

  factory UpdateFolderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFolderResponse(
      arn: json['Arn'] as String?,
      folderId: json['FolderId'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final folderId = this.folderId;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (folderId != null) 'FolderId': folderId,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateGroupResponse {
  /// The name of the group.
  final Group? group;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  UpdateGroupResponse({
    this.group,
    this.requestId,
    this.status,
  });

  factory UpdateGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGroupResponse(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (group != null) 'Group': group,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateIAMPolicyAssignmentResponse {
  /// The ID of the assignment.
  final String? assignmentId;

  /// The name of the assignment or rule.
  final String? assignmentName;

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
  final AssignmentStatus? assignmentStatus;

  /// The QuickSight users, groups, or both that the IAM policy is assigned to.
  final Map<String, List<String>>? identities;

  /// The ARN for the IAM policy applied to the QuickSight users and groups
  /// specified in this assignment.
  final String? policyArn;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

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
      Map<String, dynamic> json) {
    return UpdateIAMPolicyAssignmentResponse(
      assignmentId: json['AssignmentId'] as String?,
      assignmentName: json['AssignmentName'] as String?,
      assignmentStatus:
          (json['AssignmentStatus'] as String?)?.toAssignmentStatus(),
      identities: (json['Identities'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      policyArn: json['PolicyArn'] as String?,
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignmentId = this.assignmentId;
    final assignmentName = this.assignmentName;
    final assignmentStatus = this.assignmentStatus;
    final identities = this.identities;
    final policyArn = this.policyArn;
    final requestId = this.requestId;
    final status = this.status;
    return {
      if (assignmentId != null) 'AssignmentId': assignmentId,
      if (assignmentName != null) 'AssignmentName': assignmentName,
      if (assignmentStatus != null)
        'AssignmentStatus': assignmentStatus.toValue(),
      if (identities != null) 'Identities': identities,
      if (policyArn != null) 'PolicyArn': policyArn,
      if (requestId != null) 'RequestId': requestId,
    };
  }
}

class UpdateTemplateAliasResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The template alias.
  final TemplateAlias? templateAlias;

  UpdateTemplateAliasResponse({
    this.requestId,
    this.status,
    this.templateAlias,
  });

  factory UpdateTemplateAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTemplateAliasResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateAlias: json['TemplateAlias'] != null
          ? TemplateAlias.fromJson(
              json['TemplateAlias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final templateAlias = this.templateAlias;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (templateAlias != null) 'TemplateAlias': templateAlias,
    };
  }
}

class UpdateTemplatePermissionsResponse {
  /// A list of resource permissions to be set on the template.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The Amazon Resource Name (ARN) of the template.
  final String? templateArn;

  /// The ID for the template.
  final String? templateId;

  UpdateTemplatePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.templateArn,
    this.templateId,
  });

  factory UpdateTemplatePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateTemplatePermissionsResponse(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateArn: json['TemplateArn'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    final templateArn = this.templateArn;
    final templateId = this.templateId;
    return {
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
      if (templateArn != null) 'TemplateArn': templateArn,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class UpdateTemplateResponse {
  /// The Amazon Resource Name (ARN) for the template.
  final String? arn;

  /// The creation status of the template.
  final ResourceStatus? creationStatus;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The ID for the template.
  final String? templateId;

  /// The ARN for the template, including the version information of the first
  /// version.
  final String? versionArn;

  UpdateTemplateResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.templateId,
    this.versionArn,
  });

  factory UpdateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTemplateResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      templateId: json['TemplateId'] as String?,
      versionArn: json['VersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final requestId = this.requestId;
    final status = this.status;
    final templateId = this.templateId;
    final versionArn = this.versionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (requestId != null) 'RequestId': requestId,
      if (templateId != null) 'TemplateId': templateId,
      if (versionArn != null) 'VersionArn': versionArn,
    };
  }
}

class UpdateThemeAliasResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// Information about the theme alias.
  final ThemeAlias? themeAlias;

  UpdateThemeAliasResponse({
    this.requestId,
    this.status,
    this.themeAlias,
  });

  factory UpdateThemeAliasResponse.fromJson(Map<String, dynamic> json) {
    return UpdateThemeAliasResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeAlias: json['ThemeAlias'] != null
          ? ThemeAlias.fromJson(json['ThemeAlias'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final themeAlias = this.themeAlias;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (themeAlias != null) 'ThemeAlias': themeAlias,
    };
  }
}

class UpdateThemePermissionsResponse {
  /// The resulting list of resource permissions for the theme.
  final List<ResourcePermission>? permissions;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The Amazon Resource Name (ARN) of the theme.
  final String? themeArn;

  /// The ID for the theme.
  final String? themeId;

  UpdateThemePermissionsResponse({
    this.permissions,
    this.requestId,
    this.status,
    this.themeArn,
    this.themeId,
  });

  factory UpdateThemePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateThemePermissionsResponse(
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePermission.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeArn: json['ThemeArn'] as String?,
      themeId: json['ThemeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final requestId = this.requestId;
    final status = this.status;
    final themeArn = this.themeArn;
    final themeId = this.themeId;
    return {
      if (permissions != null) 'Permissions': permissions,
      if (requestId != null) 'RequestId': requestId,
      if (themeArn != null) 'ThemeArn': themeArn,
      if (themeId != null) 'ThemeId': themeId,
    };
  }
}

class UpdateThemeResponse {
  /// The Amazon Resource Name (ARN) for the theme.
  final String? arn;

  /// The creation status of the theme.
  final ResourceStatus? creationStatus;

  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The ID for the theme.
  final String? themeId;

  /// The Amazon Resource Name (ARN) for the new version of the theme.
  final String? versionArn;

  UpdateThemeResponse({
    this.arn,
    this.creationStatus,
    this.requestId,
    this.status,
    this.themeId,
    this.versionArn,
  });

  factory UpdateThemeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateThemeResponse(
      arn: json['Arn'] as String?,
      creationStatus: (json['CreationStatus'] as String?)?.toResourceStatus(),
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      themeId: json['ThemeId'] as String?,
      versionArn: json['VersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationStatus = this.creationStatus;
    final requestId = this.requestId;
    final status = this.status;
    final themeId = this.themeId;
    final versionArn = this.versionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (creationStatus != null) 'CreationStatus': creationStatus.toValue(),
      if (requestId != null) 'RequestId': requestId,
      if (themeId != null) 'ThemeId': themeId,
      if (versionArn != null) 'VersionArn': versionArn,
    };
  }
}

class UpdateUserResponse {
  /// The AWS request ID for this operation.
  final String? requestId;

  /// The HTTP status of the request.
  final int? status;

  /// The Amazon QuickSight user.
  final User? user;

  UpdateUserResponse({
    this.requestId,
    this.status,
    this.user,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      requestId: json['RequestId'] as String?,
      status: json['Status'] as int?,
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestId = this.requestId;
    final status = this.status;
    final user = this.user;
    return {
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
    };
  }
}

/// Information about the format for a source file or files.
class UploadSettings {
  /// Whether the file has a header row, or the files each have a header row.
  final bool? containsHeader;

  /// The delimiter between values in the file.
  final String? delimiter;

  /// File format.
  final FileFormat? format;

  /// A row number to start reading data from.
  final int? startFromRow;

  /// Text qualifier.
  final TextQualifier? textQualifier;

  UploadSettings({
    this.containsHeader,
    this.delimiter,
    this.format,
    this.startFromRow,
    this.textQualifier,
  });

  factory UploadSettings.fromJson(Map<String, dynamic> json) {
    return UploadSettings(
      containsHeader: json['ContainsHeader'] as bool?,
      delimiter: json['Delimiter'] as String?,
      format: (json['Format'] as String?)?.toFileFormat(),
      startFromRow: json['StartFromRow'] as int?,
      textQualifier: (json['TextQualifier'] as String?)?.toTextQualifier(),
    );
  }

  Map<String, dynamic> toJson() {
    final containsHeader = this.containsHeader;
    final delimiter = this.delimiter;
    final format = this.format;
    final startFromRow = this.startFromRow;
    final textQualifier = this.textQualifier;
    return {
      if (containsHeader != null) 'ContainsHeader': containsHeader,
      if (delimiter != null) 'Delimiter': delimiter,
      if (format != null) 'Format': format.toValue(),
      if (startFromRow != null) 'StartFromRow': startFromRow,
      if (textQualifier != null) 'TextQualifier': textQualifier.toValue(),
    };
  }
}

/// A registered user of Amazon QuickSight.
class User {
  /// The active status of user. When you create an Amazon QuickSight user that’s
  /// not an IAM user or an Active Directory user, that user is inactive until
  /// they sign in and provide a password.
  final bool? active;

  /// The Amazon Resource Name (ARN) for the user.
  final String? arn;

  /// The custom permissions profile associated with this user.
  final String? customPermissionsName;

  /// The user's email address.
  final String? email;

  /// The type of supported external login provider that provides identity to let
  /// the user federate into Amazon QuickSight with an associated IAM role. The
  /// type can be one of the following.
  ///
  /// <ul>
  /// <li>
  /// <code>COGNITO</code>: Amazon Cognito. The provider URL is
  /// cognito-identity.amazonaws.com.
  /// </li>
  /// <li>
  /// <code>CUSTOM_OIDC</code>: Custom OpenID Connect (OIDC) provider.
  /// </li>
  /// </ul>
  final String? externalLoginFederationProviderType;

  /// The URL of the external login provider.
  final String? externalLoginFederationProviderUrl;

  /// The identity ID for the user in the external login provider.
  final String? externalLoginId;

  /// The type of identity authentication used by the user.
  final IdentityType? identityType;

  /// The principal ID of the user.
  final String? principalId;

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
  final UserRole? role;

  /// The user's user name.
  final String? userName;

  User({
    this.active,
    this.arn,
    this.customPermissionsName,
    this.email,
    this.externalLoginFederationProviderType,
    this.externalLoginFederationProviderUrl,
    this.externalLoginId,
    this.identityType,
    this.principalId,
    this.role,
    this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      active: json['Active'] as bool?,
      arn: json['Arn'] as String?,
      customPermissionsName: json['CustomPermissionsName'] as String?,
      email: json['Email'] as String?,
      externalLoginFederationProviderType:
          json['ExternalLoginFederationProviderType'] as String?,
      externalLoginFederationProviderUrl:
          json['ExternalLoginFederationProviderUrl'] as String?,
      externalLoginId: json['ExternalLoginId'] as String?,
      identityType: (json['IdentityType'] as String?)?.toIdentityType(),
      principalId: json['PrincipalId'] as String?,
      role: (json['Role'] as String?)?.toUserRole(),
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final arn = this.arn;
    final customPermissionsName = this.customPermissionsName;
    final email = this.email;
    final externalLoginFederationProviderType =
        this.externalLoginFederationProviderType;
    final externalLoginFederationProviderUrl =
        this.externalLoginFederationProviderUrl;
    final externalLoginId = this.externalLoginId;
    final identityType = this.identityType;
    final principalId = this.principalId;
    final role = this.role;
    final userName = this.userName;
    return {
      if (active != null) 'Active': active,
      if (arn != null) 'Arn': arn,
      if (customPermissionsName != null)
        'CustomPermissionsName': customPermissionsName,
      if (email != null) 'Email': email,
      if (externalLoginFederationProviderType != null)
        'ExternalLoginFederationProviderType':
            externalLoginFederationProviderType,
      if (externalLoginFederationProviderUrl != null)
        'ExternalLoginFederationProviderUrl':
            externalLoginFederationProviderUrl,
      if (externalLoginId != null) 'ExternalLoginId': externalLoginId,
      if (identityType != null) 'IdentityType': identityType.toValue(),
      if (principalId != null) 'PrincipalId': principalId,
      if (role != null) 'Role': role.toValue(),
      if (userName != null) 'UserName': userName,
    };
  }
}

enum UserRole {
  admin,
  author,
  reader,
  restrictedAuthor,
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
  }
}

extension on String {
  UserRole toUserRole() {
    switch (this) {
      case 'ADMIN':
        return UserRole.admin;
      case 'AUTHOR':
        return UserRole.author;
      case 'READER':
        return UserRole.reader;
      case 'RESTRICTED_AUTHOR':
        return UserRole.restrictedAuthor;
      case 'RESTRICTED_READER':
        return UserRole.restrictedReader;
    }
    throw Exception('$this is not known in enum UserRole');
  }
}

/// VPC connection properties.
class VpcConnectionProperties {
  /// The Amazon Resource Name (ARN) for the VPC connection.
  final String vpcConnectionArn;

  VpcConnectionProperties({
    required this.vpcConnectionArn,
  });

  factory VpcConnectionProperties.fromJson(Map<String, dynamic> json) {
    return VpcConnectionProperties(
      vpcConnectionArn: json['VpcConnectionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcConnectionArn = this.vpcConnectionArn;
    return {
      'VpcConnectionArn': vpcConnectionArn,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConcurrentUpdatingException extends _s.GenericAwsException {
  ConcurrentUpdatingException({String? type, String? message})
      : super(
            type: type, code: 'ConcurrentUpdatingException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DomainNotWhitelistedException extends _s.GenericAwsException {
  DomainNotWhitelistedException({String? type, String? message})
      : super(
            type: type,
            code: 'DomainNotWhitelistedException',
            message: message);
}

class IdentityTypeNotSupportedException extends _s.GenericAwsException {
  IdentityTypeNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'IdentityTypeNotSupportedException',
            message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PreconditionNotMetException extends _s.GenericAwsException {
  PreconditionNotMetException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionNotMetException', message: message);
}

class QuickSightUserNotFoundException extends _s.GenericAwsException {
  QuickSightUserNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'QuickSightUserNotFoundException',
            message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String? type, String? message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class SessionLifetimeInMinutesInvalidException extends _s.GenericAwsException {
  SessionLifetimeInMinutesInvalidException({String? type, String? message})
      : super(
            type: type,
            code: 'SessionLifetimeInMinutesInvalidException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedPricingPlanException extends _s.GenericAwsException {
  UnsupportedPricingPlanException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedPricingPlanException',
            message: message);
}

class UnsupportedUserEditionException extends _s.GenericAwsException {
  UnsupportedUserEditionException({String? type, String? message})
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
