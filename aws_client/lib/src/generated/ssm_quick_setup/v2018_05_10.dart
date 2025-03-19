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

/// Quick Setup helps you quickly configure frequently used services and
/// features with recommended best practices. Quick Setup simplifies setting up
/// services, including Systems Manager, by automating common or recommended
/// tasks.
class SystemsManagerQuickSetup {
  final _s.RestJsonProtocol _protocol;
  SystemsManagerQuickSetup({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ssm-quicksetup',
            signingName: 'ssm-quicksetup',
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

  /// Creates a Quick Setup configuration manager resource. This object is a
  /// collection of desired state configurations for multiple configuration
  /// definitions and summaries describing the deployments of those definitions.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [configurationDefinitions] :
  /// The definition of the Quick Setup configuration that the configuration
  /// manager deploys.
  ///
  /// Parameter [description] :
  /// A description of the configuration manager.
  ///
  /// Parameter [name] :
  /// A name for the configuration manager.
  ///
  /// Parameter [tags] :
  /// Key-value pairs of metadata to assign to the configuration manager.
  Future<CreateConfigurationManagerOutput> createConfigurationManager({
    required List<ConfigurationDefinitionInput> configurationDefinitions,
    String? description,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConfigurationDefinitions': configurationDefinitions,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configurationManager',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationManagerOutput.fromJson(response);
  }

  /// Deletes a configuration manager.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [managerArn] :
  /// The ID of the configuration manager.
  Future<void> deleteConfigurationManager({
    required String managerArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/configurationManager/${Uri.encodeComponent(managerArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a configuration manager.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [managerArn] :
  /// The ARN of the configuration manager.
  Future<GetConfigurationManagerOutput> getConfigurationManager({
    required String managerArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configurationManager/${Uri.encodeComponent(managerArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationManagerOutput.fromJson(response);
  }

  /// Returns settings configured for Quick Setup in the requesting Amazon Web
  /// Services account and Amazon Web Services Region.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetServiceSettingsOutput> getServiceSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/serviceSettings',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceSettingsOutput.fromJson(response);
  }

  /// Returns Quick Setup configuration managers.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Filters the results returned by the request.
  ///
  /// Parameter [maxItems] :
  /// Specifies the maximum number of configuration managers that are returned
  /// by the request.
  ///
  /// Parameter [startingToken] :
  /// The token to use when requesting a specific set of items from a list.
  Future<ListConfigurationManagersOutput> listConfigurationManagers({
    List<Filter>? filters,
    int? maxItems,
    String? startingToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxItems != null) 'MaxItems': maxItems,
      if (startingToken != null) 'StartingToken': startingToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listConfigurationManagers',
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationManagersOutput.fromJson(response);
  }

  /// Returns the available Quick Setup types.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListQuickSetupTypesOutput> listQuickSetupTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/listQuickSetupTypes',
      exceptionFnMap: _exceptionFns,
    );
    return ListQuickSetupTypesOutput.fromJson(response);
  }

  /// Returns tags assigned to the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource the tag is assigned to.
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

  /// Assigns key-value pairs of metadata to Amazon Web Services resources.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to tag.
  ///
  /// Parameter [tags] :
  /// Key-value pairs of metadata to assign to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a Quick Setup configuration definition.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [id] :
  /// The ID of the configuration definition you want to update.
  ///
  /// Parameter [managerArn] :
  /// The ARN of the configuration manager associated with the definition to
  /// update.
  ///
  /// Parameter [localDeploymentAdministrationRoleArn] :
  /// The ARN of the IAM role used to administrate local configuration
  /// deployments.
  ///
  /// Parameter [localDeploymentExecutionRoleName] :
  /// The name of the IAM role used to deploy local configurations.
  ///
  /// Parameter [parameters] :
  /// The parameters for the configuration definition type.
  ///
  /// Parameter [typeVersion] :
  /// The version of the Quick Setup type to use.
  Future<void> updateConfigurationDefinition({
    required String id,
    required String managerArn,
    String? localDeploymentAdministrationRoleArn,
    String? localDeploymentExecutionRoleName,
    Map<String, String>? parameters,
    String? typeVersion,
  }) async {
    final $payload = <String, dynamic>{
      if (localDeploymentAdministrationRoleArn != null)
        'LocalDeploymentAdministrationRoleArn':
            localDeploymentAdministrationRoleArn,
      if (localDeploymentExecutionRoleName != null)
        'LocalDeploymentExecutionRoleName': localDeploymentExecutionRoleName,
      if (parameters != null) 'Parameters': parameters,
      if (typeVersion != null) 'TypeVersion': typeVersion,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/configurationDefinition/${Uri.encodeComponent(managerArn)}/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a Quick Setup configuration manager.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [managerArn] :
  /// The ARN of the configuration manager.
  ///
  /// Parameter [description] :
  /// A description of the configuration manager.
  ///
  /// Parameter [name] :
  /// A name for the configuration manager.
  Future<void> updateConfigurationManager({
    required String managerArn,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/configurationManager/${Uri.encodeComponent(managerArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates settings configured for Quick Setup.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [explorerEnablingRoleArn] :
  /// The IAM role used to enable Explorer.
  Future<void> updateServiceSettings({
    String? explorerEnablingRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (explorerEnablingRoleArn != null)
        'ExplorerEnablingRoleArn': explorerEnablingRoleArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/serviceSettings',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The definition of a Quick Setup configuration.
class ConfigurationDefinition {
  /// A list of key-value pairs containing the required parameters for the
  /// configuration type.
  final Map<String, String> parameters;

  /// The type of the Quick Setup configuration.
  final String type;

  /// The ID of the configuration definition.
  final String? id;

  /// The ARN of the IAM role used to administrate local configuration
  /// deployments.
  final String? localDeploymentAdministrationRoleArn;

  /// The name of the IAM role used to deploy local configurations.
  final String? localDeploymentExecutionRoleName;

  /// The version of the Quick Setup type used.
  final String? typeVersion;

  ConfigurationDefinition({
    required this.parameters,
    required this.type,
    this.id,
    this.localDeploymentAdministrationRoleArn,
    this.localDeploymentExecutionRoleName,
    this.typeVersion,
  });

  factory ConfigurationDefinition.fromJson(Map<String, dynamic> json) {
    return ConfigurationDefinition(
      parameters: (json['Parameters'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      type: json['Type'] as String,
      id: json['Id'] as String?,
      localDeploymentAdministrationRoleArn:
          json['LocalDeploymentAdministrationRoleArn'] as String?,
      localDeploymentExecutionRoleName:
          json['LocalDeploymentExecutionRoleName'] as String?,
      typeVersion: json['TypeVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final type = this.type;
    final id = this.id;
    final localDeploymentAdministrationRoleArn =
        this.localDeploymentAdministrationRoleArn;
    final localDeploymentExecutionRoleName =
        this.localDeploymentExecutionRoleName;
    final typeVersion = this.typeVersion;
    return {
      'Parameters': parameters,
      'Type': type,
      if (id != null) 'Id': id,
      if (localDeploymentAdministrationRoleArn != null)
        'LocalDeploymentAdministrationRoleArn':
            localDeploymentAdministrationRoleArn,
      if (localDeploymentExecutionRoleName != null)
        'LocalDeploymentExecutionRoleName': localDeploymentExecutionRoleName,
      if (typeVersion != null) 'TypeVersion': typeVersion,
    };
  }
}

/// Defines the preferences and options for a configuration definition.
class ConfigurationDefinitionInput {
  /// The parameters for the configuration definition type. Parameters for
  /// configuration definitions vary based the configuration type. The following
  /// tables outline the parameters for each configuration type.
  /// <dl> <dt>OpsCenter (Type: Amazon Web
  /// ServicesQuickSetupType-SSMOpsCenter)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>DelegatedAccountId</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The ID of the delegated administrator account.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Resource Scheduler (Type: Amazon Web
  /// ServicesQuickSetupType-Scheduler)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>TargetTagKey</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The tag key assigned to the instances you want to
  /// target.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagValue</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The value of the tag key assigned to the instances
  /// you want to target.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ICalendarString</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) An iCalendar formatted string containing the
  /// schedule you want Change Manager to use.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Default Host Management Configuration (Type: Amazon Web
  /// ServicesQuickSetupType-DHMC)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>UpdateSSMAgent</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the SSM
  /// Agent is updated on the target instances every 2 weeks. The default value is
  /// "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Resource Explorer (Type: Amazon Web
  /// ServicesQuickSetupType-ResourceExplorer)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>SelectedAggregatorRegion</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The Amazon Web Services Region where you want to
  /// create the aggregator index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ReplaceExistingAggregator</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A boolean value that determines whether to demote an
  /// existing aggregator if it is in a Region that differs from the value you
  /// specify for the <code>SelectedAggregatorRegion</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Change Manager (Type: Amazon Web
  /// ServicesQuickSetupType-SSMChangeMgr)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>DelegatedAccountId</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The ID of the delegated administrator account.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>JobFunction</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The name for the Change Manager job function.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PermissionType</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Specifies whether you want to use default
  /// administrator permissions for the job function role, or provide a custom IAM
  /// policy. The valid values are <code>CustomPermissions</code> and
  /// <code>AdminPermissions</code>. The default value for the parameter is
  /// <code>CustomerPermissions</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CustomPermissions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A JSON string containing the IAM policy you want
  /// your job function to use. You must provide a value for this parameter if you
  /// specify <code>CustomPermissions</code> for the <code>PermissionType</code>
  /// parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>DevOps Guru (Type: Amazon Web
  /// ServicesQuickSetupType-DevOpsGuru)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>AnalyseAllResources</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether DevOps Guru
  /// analyzes all CloudFormation stacks in the account. The default value is
  /// "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>EnableSnsNotifications</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether DevOps Guru
  /// sends notifications when an insight is created. The default value is
  /// "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>EnableSsmOpsItems</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether DevOps Guru
  /// creates an OpsCenter OpsItem when an insight is created. The default value
  /// is "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>EnableDriftRemediation</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether a drift
  /// remediation schedule is used. The default value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RemediationSchedule</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A rate expression that defines the schedule for
  /// drift remediation. The valid values are <code>rate(30 days)</code>,
  /// <code>rate(14 days)</code>, <code>rate(1 days)</code>, and
  /// <code>none</code>. The default value is "<code>none</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Conformance Packs (Type: Amazon Web
  /// ServicesQuickSetupType-CFGCPacks)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>DelegatedAccountId</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the delegated administrator account. This
  /// parameter is required for Organization deployments.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RemediationSchedule</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A rate expression that defines the schedule for
  /// drift remediation. The valid values are <code>rate(30 days)</code>,
  /// <code>rate(14 days)</code>, <code>rate(2 days)</code>, and
  /// <code>none</code>. The default value is "<code>none</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CPackNames</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Config conformance packs.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the root of your Organization. This
  /// configuration type doesn't currently support choosing specific OUs. The
  /// configuration will be deployed to all the OUs in the Organization.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Config Recording (Type: Amazon Web
  /// ServicesQuickSetupType-CFGRecording)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>RecordAllResources</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether all
  /// supported resources are recorded. The default value is "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ResourceTypesToRecord</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of resource types you want to
  /// record.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RecordGlobalResourceTypes</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether global
  /// resources are recorded with all resource configurations. The default value
  /// is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>GlobalResourceTypesRegion</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Determines the Amazon Web Services Region where
  /// global resources are recorded.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UseCustomBucket</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether a custom
  /// Amazon S3 bucket is used for delivery. The default value is
  /// "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DeliveryBucketName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The name of the Amazon S3 bucket you want Config to
  /// deliver configuration snapshots and configuration history files to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>DeliveryBucketPrefix</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The key prefix you want to use in the custom Amazon
  /// S3 bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NotificationOptions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Determines the notification configuration for the
  /// recorder. The valid values are <code>NoStreaming</code>,
  /// <code>UseExistingTopic</code>, and <code>CreateTopic</code>. The default
  /// value is <code>NoStreaming</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CustomDeliveryTopicAccountId</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account where the
  /// Amazon SNS topic you want to use for notifications resides. You must specify
  /// a value for this parameter if you use the <code>UseExistingTopic</code>
  /// notification option.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CustomDeliveryTopicName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The name of the Amazon SNS topic you want to use for
  /// notifications. You must specify a value for this parameter if you use the
  /// <code>UseExistingTopic</code> notification option.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RemediationSchedule</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A rate expression that defines the schedule for
  /// drift remediation. The valid values are <code>rate(30 days)</code>,
  /// <code>rate(7 days)</code>, <code>rate(1 days)</code>, and <code>none</code>.
  /// The default value is "<code>none</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the root of your Organization. This
  /// configuration type doesn't currently support choosing specific OUs. The
  /// configuration will be deployed to all the OUs in the Organization.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Host Management (Type: Amazon Web
  /// ServicesQuickSetupType-SSMHostMgmt)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>UpdateSSMAgent</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the SSM
  /// Agent is updated on the target instances every 2 weeks. The default value is
  /// "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UpdateEc2LaunchAgent</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the EC2
  /// Launch agent is updated on the target instances every month. The default
  /// value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CollectInventory</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the EC2
  /// Launch agent is updated on the target instances every month. The default
  /// value is "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ScanInstances</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the target
  /// instances are scanned daily for available patches. The default value is
  /// "<code>true</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>InstallCloudWatchAgent</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the Amazon
  /// CloudWatch agent is installed on the target instances. The default value is
  /// "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UpdateCloudWatchAgent</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the Amazon
  /// CloudWatch agent is updated on the target instances every month. The default
  /// value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>IsPolicyAttachAllowed</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether Quick Setup
  /// attaches policies to instances profiles already associated with the target
  /// instances. The default value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetType</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Determines how instances are targeted for local
  /// account deployments. Don't specify a value for this parameter if you're
  /// deploying to OUs. The valid values are <code>*</code>,
  /// <code>InstanceIds</code>, <code>ResourceGroups</code>, and
  /// <code>Tags</code>. Use <code>*</code> to target all instances in the
  /// account.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetInstances</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of instance IDs. You must
  /// provide a value for this parameter if you specify <code>InstanceIds</code>
  /// for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagKey</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The tag key assigned to the instances you want to
  /// target. You must provide a value for this parameter if you specify
  /// <code>Tags</code> for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagValue</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The value of the tag key assigned to the instances
  /// you want to target. You must provide a value for this parameter if you
  /// specify <code>Tags</code> for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ResourceGroupName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The name of the resource group associated with the
  /// instances you want to target. You must provide a value for this parameter if
  /// you specify <code>ResourceGroups</code> for the <code>TargetType</code>
  /// parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Distributor (Type: Amazon Web
  /// ServicesQuickSetupType-Distributor)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>PackagesToInstall</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of packages you want to
  /// install on the target instances. The valid values are
  /// <code>AWSEFSTools</code>, <code>AWSCWAgent</code>, and
  /// <code>AWSEC2LaunchAgent</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RemediationSchedule</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A rate expression that defines the schedule for
  /// drift remediation. The valid values are <code>rate(30 days)</code>,
  /// <code>rate(14 days)</code>, <code>rate(2 days)</code>, and
  /// <code>none</code>. The default value is "<code>rate(30 days)</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>IsPolicyAttachAllowed</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether Quick Setup
  /// attaches policies to instances profiles already associated with the target
  /// instances. The default value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetType</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Determines how instances are targeted for local
  /// account deployments. Don't specify a value for this parameter if you're
  /// deploying to OUs. The valid values are <code>*</code>,
  /// <code>InstanceIds</code>, <code>ResourceGroups</code>, and
  /// <code>Tags</code>. Use <code>*</code> to target all instances in the
  /// account.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetInstances</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of instance IDs. You must
  /// provide a value for this parameter if you specify <code>InstanceIds</code>
  /// for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagKey</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The tag key assigned to the instances you want to
  /// target. You must provide a value for this parameter if you specify
  /// <code>Tags</code> for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagValue</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The value of the tag key assigned to the instances
  /// you want to target. You must provide a value for this parameter if you
  /// specify <code>Tags</code> for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ResourceGroupName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The name of the resource group associated with the
  /// instances you want to target. You must provide a value for this parameter if
  /// you specify <code>ResourceGroups</code> for the <code>TargetType</code>
  /// parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>Patch Policy (Type: Amazon Web
  /// ServicesQuickSetupType-PatchPolicy)</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>PatchPolicyName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A name for the patch policy. The value you provide
  /// is applied to target Amazon EC2 instances as a tag.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>SelectedPatchBaselines</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) An array of JSON objects containing the information
  /// for the patch baselines to include in your patch policy.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PatchBaselineUseDefault</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether the selected
  /// patch baselines are all Amazon Web Services provided.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ConfigurationOptionsPatchOperation</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Determines whether target instances scan for
  /// available patches, or scan and install available patches. The valid values
  /// are <code>Scan</code> and <code>ScanAndInstall</code>. The default value for
  /// the parameter is <code>Scan</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ConfigurationOptionsScanValue</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A cron expression that is used as the schedule for
  /// when instances scan for available patches.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ConfigurationOptionsInstallValue</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A cron expression that is used as the schedule for
  /// when instances install available patches.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ConfigurationOptionsScanNextInterval</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether instances
  /// should scan for available patches at the next cron interval. The default
  /// value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ConfigurationOptionsInstallNextInterval</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether instances
  /// should scan for available patches at the next cron interval. The default
  /// value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RebootOption</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether instances
  /// are rebooted after patches are installed. The default value is
  /// "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>IsPolicyAttachAllowed</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether Quick Setup
  /// attaches policies to instances profiles already associated with the target
  /// instances. The default value is "<code>false</code>".
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>OutputLogEnableS3</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A boolean value that determines whether command
  /// output logs are sent to Amazon S3.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>OutputS3Location</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A JSON string containing information about the
  /// Amazon S3 bucket where you want to store the output details of the request.
  ///
  /// <ul>
  /// <li>
  /// <code>OutputS3BucketRegion</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The Amazon Web Services Region where the Amazon S3
  /// bucket you want Config to deliver command output to is located.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>OutputS3BucketName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The name of the Amazon S3 bucket you want Config to
  /// deliver command output to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>OutputS3KeyPrefix</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The key prefix you want to use in the custom Amazon
  /// S3 bucket.
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetType</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) Determines how instances are targeted for local
  /// account deployments. Don't specify a value for this parameter if you're
  /// deploying to OUs. The valid values are <code>*</code>,
  /// <code>InstanceIds</code>, <code>ResourceGroups</code>, and
  /// <code>Tags</code>. Use <code>*</code> to target all instances in the
  /// account.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetInstances</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of instance IDs. You must
  /// provide a value for this parameter if you specify <code>InstanceIds</code>
  /// for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagKey</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The tag key assigned to the instances you want to
  /// target. You must provide a value for this parameter if you specify
  /// <code>Tags</code> for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetTagValue</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The value of the tag key assigned to the instances
  /// you want to target. You must provide a value for this parameter if you
  /// specify <code>Tags</code> for the <code>TargetType</code> parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ResourceGroupName</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) The name of the resource group associated with the
  /// instances you want to target. You must provide a value for this parameter if
  /// you specify <code>ResourceGroups</code> for the <code>TargetType</code>
  /// parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetAccounts</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) The ID of the Amazon Web Services account initiating
  /// the configuration deployment. You only need to provide a value for this
  /// parameter if you want to deploy the configuration locally. A value must be
  /// provided for either <code>TargetAccounts</code> or
  /// <code>TargetOrganizationalUnits</code>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetOrganizationalUnits</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Optional) A comma separated list of organizational units (OUs)
  /// you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>TargetRegions</code>
  ///
  /// <ul>
  /// <li>
  /// Description: (Required) A comma separated list of Amazon Web Services
  /// Regions you want to deploy the configuration to.
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> </dl>
  final Map<String, String> parameters;

  /// The type of the Quick Setup configuration.
  final String type;

  /// The ARN of the IAM role used to administrate local configuration
  /// deployments.
  final String? localDeploymentAdministrationRoleArn;

  /// The name of the IAM role used to deploy local configurations.
  final String? localDeploymentExecutionRoleName;

  /// The version of the Quick Setup type to use.
  final String? typeVersion;

  ConfigurationDefinitionInput({
    required this.parameters,
    required this.type,
    this.localDeploymentAdministrationRoleArn,
    this.localDeploymentExecutionRoleName,
    this.typeVersion,
  });

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final type = this.type;
    final localDeploymentAdministrationRoleArn =
        this.localDeploymentAdministrationRoleArn;
    final localDeploymentExecutionRoleName =
        this.localDeploymentExecutionRoleName;
    final typeVersion = this.typeVersion;
    return {
      'Parameters': parameters,
      'Type': type,
      if (localDeploymentAdministrationRoleArn != null)
        'LocalDeploymentAdministrationRoleArn':
            localDeploymentAdministrationRoleArn,
      if (localDeploymentExecutionRoleName != null)
        'LocalDeploymentExecutionRoleName': localDeploymentExecutionRoleName,
      if (typeVersion != null) 'TypeVersion': typeVersion,
    };
  }
}

/// A summarized definition of a Quick Setup configuration definition.
class ConfigurationDefinitionSummary {
  /// The common parameters and values for the configuration definition.
  final Map<String, String>? firstClassParameters;

  /// The ID of the configuration definition.
  final String? id;

  /// The type of the Quick Setup configuration used by the configuration
  /// definition.
  final String? type;

  /// The version of the Quick Setup type used by the configuration definition.
  final String? typeVersion;

  ConfigurationDefinitionSummary({
    this.firstClassParameters,
    this.id,
    this.type,
    this.typeVersion,
  });

  factory ConfigurationDefinitionSummary.fromJson(Map<String, dynamic> json) {
    return ConfigurationDefinitionSummary(
      firstClassParameters:
          (json['FirstClassParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      id: json['Id'] as String?,
      type: json['Type'] as String?,
      typeVersion: json['TypeVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstClassParameters = this.firstClassParameters;
    final id = this.id;
    final type = this.type;
    final typeVersion = this.typeVersion;
    return {
      if (firstClassParameters != null)
        'FirstClassParameters': firstClassParameters,
      if (id != null) 'Id': id,
      if (type != null) 'Type': type,
      if (typeVersion != null) 'TypeVersion': typeVersion,
    };
  }
}

/// A summary of a Quick Setup configuration manager.
class ConfigurationManagerSummary {
  /// The ARN of the Quick Setup configuration.
  final String managerArn;

  /// A summary of the Quick Setup configuration definition.
  final List<ConfigurationDefinitionSummary>? configurationDefinitionSummaries;

  /// The description of the configuration.
  final String? description;

  /// The name of the configuration
  final String? name;

  /// Summaries of the state of the configuration manager. These summaries include
  /// an aggregate of the statuses from the configuration definition associated
  /// with the configuration manager. This includes deployment statuses,
  /// association statuses, drift statuses, health checks, and more.
  final List<StatusSummary>? statusSummaries;

  ConfigurationManagerSummary({
    required this.managerArn,
    this.configurationDefinitionSummaries,
    this.description,
    this.name,
    this.statusSummaries,
  });

  factory ConfigurationManagerSummary.fromJson(Map<String, dynamic> json) {
    return ConfigurationManagerSummary(
      managerArn: json['ManagerArn'] as String,
      configurationDefinitionSummaries:
          (json['ConfigurationDefinitionSummaries'] as List?)
              ?.nonNulls
              .map((e) => ConfigurationDefinitionSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      statusSummaries: (json['StatusSummaries'] as List?)
          ?.nonNulls
          .map((e) => StatusSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managerArn = this.managerArn;
    final configurationDefinitionSummaries =
        this.configurationDefinitionSummaries;
    final description = this.description;
    final name = this.name;
    final statusSummaries = this.statusSummaries;
    return {
      'ManagerArn': managerArn,
      if (configurationDefinitionSummaries != null)
        'ConfigurationDefinitionSummaries': configurationDefinitionSummaries,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (statusSummaries != null) 'StatusSummaries': statusSummaries,
    };
  }
}

class CreateConfigurationManagerOutput {
  /// The ARN for the newly created configuration manager.
  final String managerArn;

  CreateConfigurationManagerOutput({
    required this.managerArn,
  });

  factory CreateConfigurationManagerOutput.fromJson(Map<String, dynamic> json) {
    return CreateConfigurationManagerOutput(
      managerArn: json['ManagerArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final managerArn = this.managerArn;
    return {
      'ManagerArn': managerArn,
    };
  }
}

/// A key-value pair to filter results.
class Filter {
  /// The key for the filter.
  final String key;

  /// The values for the filter keys.
  final List<String> values;

  Filter({
    required this.key,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'Key': key,
      'Values': values,
    };
  }
}

class GetConfigurationManagerOutput {
  /// The ARN of the configuration manager.
  final String managerArn;

  /// The configuration definitions association with the configuration manager.
  final List<ConfigurationDefinition>? configurationDefinitions;

  /// The datetime stamp when the configuration manager was created.
  final DateTime? createdAt;

  /// The description of the configuration manager.
  final String? description;

  /// The datetime stamp when the configuration manager was last updated.
  final DateTime? lastModifiedAt;

  /// The name of the configuration manager.
  final String? name;

  /// A summary of the state of the configuration manager. This includes
  /// deployment statuses, association statuses, drift statuses, health checks,
  /// and more.
  final List<StatusSummary>? statusSummaries;

  /// Key-value pairs of metadata to assign to the configuration manager.
  final Map<String, String>? tags;

  GetConfigurationManagerOutput({
    required this.managerArn,
    this.configurationDefinitions,
    this.createdAt,
    this.description,
    this.lastModifiedAt,
    this.name,
    this.statusSummaries,
    this.tags,
  });

  factory GetConfigurationManagerOutput.fromJson(Map<String, dynamic> json) {
    return GetConfigurationManagerOutput(
      managerArn: json['ManagerArn'] as String,
      configurationDefinitions: (json['ConfigurationDefinitions'] as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      lastModifiedAt: timeStampFromJson(json['LastModifiedAt']),
      name: json['Name'] as String?,
      statusSummaries: (json['StatusSummaries'] as List?)
          ?.nonNulls
          .map((e) => StatusSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final managerArn = this.managerArn;
    final configurationDefinitions = this.configurationDefinitions;
    final createdAt = this.createdAt;
    final description = this.description;
    final lastModifiedAt = this.lastModifiedAt;
    final name = this.name;
    final statusSummaries = this.statusSummaries;
    final tags = this.tags;
    return {
      'ManagerArn': managerArn,
      if (configurationDefinitions != null)
        'ConfigurationDefinitions': configurationDefinitions,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (description != null) 'Description': description,
      if (lastModifiedAt != null)
        'LastModifiedAt': iso8601ToJson(lastModifiedAt),
      if (name != null) 'Name': name,
      if (statusSummaries != null) 'StatusSummaries': statusSummaries,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetServiceSettingsOutput {
  /// Returns details about the settings for Quick Setup in the requesting Amazon
  /// Web Services account and Amazon Web Services Region.
  final ServiceSettings? serviceSettings;

  GetServiceSettingsOutput({
    this.serviceSettings,
  });

  factory GetServiceSettingsOutput.fromJson(Map<String, dynamic> json) {
    return GetServiceSettingsOutput(
      serviceSettings: json['ServiceSettings'] != null
          ? ServiceSettings.fromJson(
              json['ServiceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSettings = this.serviceSettings;
    return {
      if (serviceSettings != null) 'ServiceSettings': serviceSettings,
    };
  }
}

class ListConfigurationManagersOutput {
  /// The configuration managers returned by the request.
  final List<ConfigurationManagerSummary>? configurationManagersList;

  /// The token to use when requesting the next set of configuration managers. If
  /// there are no additional operations to return, the string is empty.
  final String? nextToken;

  ListConfigurationManagersOutput({
    this.configurationManagersList,
    this.nextToken,
  });

  factory ListConfigurationManagersOutput.fromJson(Map<String, dynamic> json) {
    return ListConfigurationManagersOutput(
      configurationManagersList: (json['ConfigurationManagersList'] as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationManagerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationManagersList = this.configurationManagersList;
    final nextToken = this.nextToken;
    return {
      if (configurationManagersList != null)
        'ConfigurationManagersList': configurationManagersList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListQuickSetupTypesOutput {
  /// An array of Quick Setup types.
  final List<QuickSetupTypeOutput>? quickSetupTypeList;

  ListQuickSetupTypesOutput({
    this.quickSetupTypeList,
  });

  factory ListQuickSetupTypesOutput.fromJson(Map<String, dynamic> json) {
    return ListQuickSetupTypesOutput(
      quickSetupTypeList: (json['QuickSetupTypeList'] as List?)
          ?.nonNulls
          .map((e) => QuickSetupTypeOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final quickSetupTypeList = this.quickSetupTypeList;
    return {
      if (quickSetupTypeList != null) 'QuickSetupTypeList': quickSetupTypeList,
    };
  }
}

class ListTagsForResourceResponse {
  /// Key-value pairs of metadata assigned to the resource.
  final List<TagEntry>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => TagEntry.fromJson(e as Map<String, dynamic>))
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

/// Information about the Quick Setup type.
class QuickSetupTypeOutput {
  /// The latest version number of the configuration.
  final String? latestVersion;

  /// The type of the Quick Setup configuration.
  final String? type;

  QuickSetupTypeOutput({
    this.latestVersion,
    this.type,
  });

  factory QuickSetupTypeOutput.fromJson(Map<String, dynamic> json) {
    return QuickSetupTypeOutput(
      latestVersion: json['LatestVersion'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestVersion = this.latestVersion;
    final type = this.type;
    return {
      if (latestVersion != null) 'LatestVersion': latestVersion,
      if (type != null) 'Type': type,
    };
  }
}

/// Settings configured for Quick Setup.
class ServiceSettings {
  /// The IAM role used to enable Explorer.
  final String? explorerEnablingRoleArn;

  ServiceSettings({
    this.explorerEnablingRoleArn,
  });

  factory ServiceSettings.fromJson(Map<String, dynamic> json) {
    return ServiceSettings(
      explorerEnablingRoleArn: json['ExplorerEnablingRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final explorerEnablingRoleArn = this.explorerEnablingRoleArn;
    return {
      if (explorerEnablingRoleArn != null)
        'ExplorerEnablingRoleArn': explorerEnablingRoleArn,
    };
  }
}

enum Status {
  initializing('INITIALIZING'),
  deploying('DEPLOYING'),
  succeeded('SUCCEEDED'),
  deleting('DELETING'),
  stopping('STOPPING'),
  failed('FAILED'),
  stopped('STOPPED'),
  deleteFailed('DELETE_FAILED'),
  stopFailed('STOP_FAILED'),
  none('NONE'),
  ;

  final String value;

  const Status(this.value);

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Status'));
}

/// A summarized description of the status.
class StatusSummary {
  /// The datetime stamp when the status was last updated.
  final DateTime lastUpdatedAt;

  /// The type of a status summary.
  final StatusType statusType;

  /// The current status.
  final Status? status;

  /// Details about the status.
  final Map<String, String>? statusDetails;

  /// When applicable, returns an informational message relevant to the current
  /// status and status type of the status summary object. We don't recommend
  /// implementing parsing logic around this value since the messages returned can
  /// vary in format.
  final String? statusMessage;

  StatusSummary({
    required this.lastUpdatedAt,
    required this.statusType,
    this.status,
    this.statusDetails,
    this.statusMessage,
  });

  factory StatusSummary.fromJson(Map<String, dynamic> json) {
    return StatusSummary(
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      statusType: StatusType.fromString((json['StatusType'] as String)),
      status: (json['Status'] as String?)?.let(Status.fromString),
      statusDetails: (json['StatusDetails'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final statusType = this.statusType;
    final status = this.status;
    final statusDetails = this.statusDetails;
    final statusMessage = this.statusMessage;
    return {
      'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'StatusType': statusType.value,
      if (status != null) 'Status': status.value,
      if (statusDetails != null) 'StatusDetails': statusDetails,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum StatusType {
  deployment('Deployment'),
  asyncExecutions('AsyncExecutions'),
  ;

  final String value;

  const StatusType(this.value);

  static StatusType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StatusType'));
}

/// Key-value pairs of metadata.
class TagEntry {
  /// The key for the tag.
  final String? key;

  /// The value for the tag.
  final String? value;

  TagEntry({
    this.key,
    this.value,
  });

  factory TagEntry.fromJson(Map<String, dynamic> json) {
    return TagEntry(
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
