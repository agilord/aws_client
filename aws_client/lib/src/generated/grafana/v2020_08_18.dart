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

/// Amazon Managed Grafana is a fully managed and secure data visualization
/// service that you can use to instantly query, correlate, and visualize
/// operational metrics, logs, and traces from multiple sources. Amazon Managed
/// Grafana makes it easy to deploy, operate, and scale Grafana, a widely
/// deployed data visualization tool that is popular for its extensible data
/// support.
///
/// With Amazon Managed Grafana, you create logically isolated Grafana servers
/// called <i>workspaces</i>. In a workspace, you can create Grafana dashboards
/// and visualizations to analyze your metrics, logs, and traces without having
/// to build, package, or deploy any hardware to run Grafana servers.
class ManagedGrafana {
  final _s.RestJsonProtocol _protocol;
  ManagedGrafana({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'grafana',
            signingName: 'grafana',
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

  /// Assigns a Grafana Enterprise license to a workspace. To upgrade, you must
  /// use <code>ENTERPRISE</code> for the <code>licenseType</code>, and pass in
  /// a valid Grafana Labs token for the <code>grafanaToken</code>. Upgrading to
  /// Grafana Enterprise incurs additional fees. For more information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/upgrade-to-Grafana-Enterprise.html">Upgrade
  /// a workspace to Grafana Enterprise</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [licenseType] :
  /// The type of license to associate with the workspace.
  /// <note>
  /// Amazon Managed Grafana workspaces no longer support Grafana Enterprise
  /// free trials.
  /// </note>
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to associate the license with.
  ///
  /// Parameter [grafanaToken] :
  /// A token from Grafana Labs that ties your Amazon Web Services account with
  /// a Grafana Labs account. For more information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/upgrade-to-Grafana-Enterprise.html#AMG-workspace-register-enterprise">Link
  /// your account with Grafana Labs</a>.
  Future<AssociateLicenseResponse> associateLicense({
    required LicenseType licenseType,
    required String workspaceId,
    String? grafanaToken,
  }) async {
    final headers = <String, String>{
      if (grafanaToken != null) 'Grafana-Token': grafanaToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/licenses/${Uri.encodeComponent(licenseType.toValue())}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateLicenseResponse.fromJson(response);
  }

  /// Creates a <i>workspace</i>. In a workspace, you can create Grafana
  /// dashboards and visualizations to analyze your metrics, logs, and traces.
  /// You don't have to build, package, or deploy any hardware to run the
  /// Grafana server.
  ///
  /// Don't use <code>CreateWorkspace</code> to modify an existing workspace.
  /// Instead, use <a
  /// href="https://docs.aws.amazon.com/grafana/latest/APIReference/API_UpdateWorkspace.html">UpdateWorkspace</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [accountAccessType] :
  /// Specifies whether the workspace can access Amazon Web Services resources
  /// in this Amazon Web Services account only, or whether it can also access
  /// Amazon Web Services resources in other accounts in the same organization.
  /// If you specify <code>ORGANIZATION</code>, you must specify which
  /// organizational units the workspace can access in the
  /// <code>workspaceOrganizationalUnits</code> parameter.
  ///
  /// Parameter [authenticationProviders] :
  /// Specifies whether this workspace uses SAML 2.0, IAM Identity Center, or
  /// both to authenticate users for using the Grafana console within a
  /// workspace. For more information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/authentication-in-AMG.html">User
  /// authentication in Amazon Managed Grafana</a>.
  ///
  /// Parameter [permissionType] :
  /// When creating a workspace through the Amazon Web Services API, CLI or
  /// Amazon Web Services CloudFormation, you must manage IAM roles and
  /// provision the permissions that the workspace needs to use Amazon Web
  /// Services data sources and notification channels.
  ///
  /// You must also specify a <code>workspaceRoleArn</code> for a role that you
  /// will manage for the workspace to use when accessing those datasources and
  /// notification channels.
  ///
  /// The ability for Amazon Managed Grafana to create and update IAM roles on
  /// behalf of the user is supported only in the Amazon Managed Grafana
  /// console, where this value may be set to <code>SERVICE_MANAGED</code>.
  /// <note>
  /// Use only the <code>CUSTOMER_MANAGED</code> permission type when creating a
  /// workspace with the API, CLI or Amazon Web Services CloudFormation.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-manage-permissions.html">Amazon
  /// Managed Grafana permissions and policies for Amazon Web Services data
  /// sources and notification channels</a>.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [configuration] :
  /// The configuration string for the workspace that you create. For more
  /// information about the format and configuration options available, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-configure-workspace.html">Working
  /// in your Grafana workspace</a>.
  ///
  /// Parameter [grafanaVersion] :
  /// Specifies the version of Grafana to support in the new workspace. If not
  /// specified, defaults to the latest version (for example, 10.4).
  ///
  /// To get a list of supported versions, use the <code>ListVersions</code>
  /// operation.
  ///
  /// Parameter [networkAccessControl] :
  /// Configuration for network access to your workspace.
  ///
  /// When this is configured, only listed IP addresses and VPC endpoints will
  /// be able to access your workspace. Standard Grafana authentication and
  /// authorization will still be required.
  ///
  /// If this is not configured, or is removed, then all IP addresses and VPC
  /// endpoints will be allowed. Standard Grafana authentication and
  /// authorization will still be required.
  ///
  /// Parameter [organizationRoleName] :
  /// The name of an IAM role that already exists to use with Organizations to
  /// access Amazon Web Services data sources and notification channels in other
  /// accounts in an organization.
  ///
  /// Parameter [stackSetName] :
  /// The name of the CloudFormation stack set to use to generate IAM roles to
  /// be used for this workspace.
  ///
  /// Parameter [tags] :
  /// The list of tags associated with the workspace.
  ///
  /// Parameter [vpcConfiguration] :
  /// The configuration settings for an Amazon VPC that contains data sources
  /// for your Grafana workspace to connect to.
  /// <note>
  /// Connecting to a private VPC is not yet available in the Asia Pacific
  /// (Seoul) Region (ap-northeast-2).
  /// </note>
  ///
  /// Parameter [workspaceDataSources] :
  /// This parameter is for internal use only, and should not be used.
  ///
  /// Parameter [workspaceDescription] :
  /// A description for the workspace. This is used only to help you identify
  /// this workspace.
  ///
  /// Pattern: <code>^[\\p{L}\\p{Z}\\p{N}\\p{P}]{0,2048}$</code>
  ///
  /// Parameter [workspaceName] :
  /// The name for the workspace. It does not have to be unique.
  ///
  /// Parameter [workspaceNotificationDestinations] :
  /// Specify the Amazon Web Services notification channels that you plan to use
  /// in this workspace. Specifying these data sources here enables Amazon
  /// Managed Grafana to create IAM roles and permissions that allow Amazon
  /// Managed Grafana to use these channels.
  ///
  /// Parameter [workspaceOrganizationalUnits] :
  /// Specifies the organizational units that this workspace is allowed to use
  /// data sources from, if this workspace is in an account that is part of an
  /// organization.
  ///
  /// Parameter [workspaceRoleArn] :
  /// Specified the IAM role that grants permissions to the Amazon Web Services
  /// resources that the workspace will view data from, including both data
  /// sources and notification channels. You are responsible for managing the
  /// permissions for this role as new data sources or notification channels are
  /// added.
  Future<CreateWorkspaceResponse> createWorkspace({
    required AccountAccessType accountAccessType,
    required List<AuthenticationProviderTypes> authenticationProviders,
    required PermissionType permissionType,
    String? clientToken,
    Object? configuration,
    String? grafanaVersion,
    NetworkAccessConfiguration? networkAccessControl,
    String? organizationRoleName,
    String? stackSetName,
    Map<String, String>? tags,
    VpcConfiguration? vpcConfiguration,
    List<DataSourceType>? workspaceDataSources,
    String? workspaceDescription,
    String? workspaceName,
    List<NotificationDestinationType>? workspaceNotificationDestinations,
    List<String>? workspaceOrganizationalUnits,
    String? workspaceRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'accountAccessType': accountAccessType.toValue(),
      'authenticationProviders':
          authenticationProviders.map((e) => e.toValue()).toList(),
      'permissionType': permissionType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': jsonEncode(configuration),
      if (grafanaVersion != null) 'grafanaVersion': grafanaVersion,
      if (networkAccessControl != null)
        'networkAccessControl': networkAccessControl,
      if (organizationRoleName != null)
        'organizationRoleName': organizationRoleName,
      if (stackSetName != null) 'stackSetName': stackSetName,
      if (tags != null) 'tags': tags,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
      if (workspaceDataSources != null)
        'workspaceDataSources':
            workspaceDataSources.map((e) => e.toValue()).toList(),
      if (workspaceDescription != null)
        'workspaceDescription': workspaceDescription,
      if (workspaceName != null) 'workspaceName': workspaceName,
      if (workspaceNotificationDestinations != null)
        'workspaceNotificationDestinations':
            workspaceNotificationDestinations.map((e) => e.toValue()).toList(),
      if (workspaceOrganizationalUnits != null)
        'workspaceOrganizationalUnits': workspaceOrganizationalUnits,
      if (workspaceRoleArn != null) 'workspaceRoleArn': workspaceRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceResponse.fromJson(response);
  }

  /// Creates a Grafana API key for the workspace. This key can be used to
  /// authenticate requests sent to the workspace's HTTP API. See <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/Using-Grafana-APIs.html">https://docs.aws.amazon.com/grafana/latest/userguide/Using-Grafana-APIs.html</a>
  /// for available APIs and example requests.
  /// <note>
  /// In workspaces compatible with Grafana version 9 or above, use workspace
  /// service accounts instead of API keys. API keys will be removed in a future
  /// release.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [keyName] :
  /// Specifies the name of the key. Keynames must be unique to the workspace.
  ///
  /// Parameter [keyRole] :
  /// Specifies the permission level of the key.
  ///
  /// Valid values: <code>ADMIN</code>|<code>EDITOR</code>|<code>VIEWER</code>
  ///
  /// Parameter [secondsToLive] :
  /// Specifies the time in seconds until the key expires. Keys can be valid for
  /// up to 30 days.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to create an API key.
  Future<CreateWorkspaceApiKeyResponse> createWorkspaceApiKey({
    required String keyName,
    required String keyRole,
    required int secondsToLive,
    required String workspaceId,
  }) async {
    _s.validateNumRange(
      'secondsToLive',
      secondsToLive,
      1,
      2592000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'keyName': keyName,
      'keyRole': keyRole,
      'secondsToLive': secondsToLive,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/apikeys',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceApiKeyResponse.fromJson(response);
  }

  /// Creates a service account for the workspace. A service account can be used
  /// to call Grafana HTTP APIs, and run automated workloads. After creating the
  /// service account with the correct <code>GrafanaRole</code> for your use
  /// case, use <code>CreateWorkspaceServiceAccountToken</code> to create a
  /// token that can be used to authenticate and authorize Grafana HTTP API
  /// calls.
  ///
  /// You can only create service accounts for workspaces that are compatible
  /// with Grafana version 9 and above.
  /// <note>
  /// For more information about service accounts, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/service-accounts.html">Service
  /// accounts</a> in the <i>Amazon Managed Grafana User Guide</i>.
  ///
  /// For more information about the Grafana HTTP APIs, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/Using-Grafana-APIs.html">Using
  /// Grafana HTTP APIs</a> in the <i>Amazon Managed Grafana User Guide</i>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [grafanaRole] :
  /// The permission level to use for this service account.
  /// <note>
  /// For more information about the roles and the permissions each has, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/Grafana-user-roles.html">User
  /// roles</a> in the <i>Amazon Managed Grafana User Guide</i>.
  /// </note>
  ///
  /// Parameter [name] :
  /// A name for the service account. The name must be unique within the
  /// workspace, as it determines the ID associated with the service account.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace within which to create the service account.
  Future<CreateWorkspaceServiceAccountResponse> createWorkspaceServiceAccount({
    required Role grafanaRole,
    required String name,
    required String workspaceId,
  }) async {
    final $payload = <String, dynamic>{
      'grafanaRole': grafanaRole.toValue(),
      'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/serviceaccounts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceServiceAccountResponse.fromJson(response);
  }

  /// Creates a token that can be used to authenticate and authorize Grafana
  /// HTTP API operations for the given <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/service-accounts.html">workspace
  /// service account</a>. The service account acts as a user for the API
  /// operations, and defines the permissions that are used by the API.
  /// <important>
  /// When you create the service account token, you will receive a key that is
  /// used when calling Grafana APIs. Do not lose this key, as it will not be
  /// retrievable again.
  ///
  /// If you do lose the key, you can delete the token and recreate it to
  /// receive a new key. This will disable the initial key.
  /// </important>
  /// Service accounts are only available for workspaces that are compatible
  /// with Grafana version 9 and above.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// A name for the token to create.
  ///
  /// Parameter [secondsToLive] :
  /// Sets how long the token will be valid, in seconds. You can set the time up
  /// to 30 days in the future.
  ///
  /// Parameter [serviceAccountId] :
  /// The ID of the service account for which to create a token.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace the service account resides within.
  Future<CreateWorkspaceServiceAccountTokenResponse>
      createWorkspaceServiceAccountToken({
    required String name,
    required int secondsToLive,
    required String serviceAccountId,
    required String workspaceId,
  }) async {
    _s.validateNumRange(
      'secondsToLive',
      secondsToLive,
      1,
      2592000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'name': name,
      'secondsToLive': secondsToLive,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/serviceaccounts/${Uri.encodeComponent(serviceAccountId)}/tokens',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceServiceAccountTokenResponse.fromJson(response);
  }

  /// Deletes an Amazon Managed Grafana workspace.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete.
  Future<DeleteWorkspaceResponse> deleteWorkspace({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkspaceResponse.fromJson(response);
  }

  /// Deletes a Grafana API key for the workspace.
  /// <note>
  /// In workspaces compatible with Grafana version 9 or above, use workspace
  /// service accounts instead of API keys. API keys will be removed in a future
  /// release.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [keyName] :
  /// The name of the API key to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete.
  Future<DeleteWorkspaceApiKeyResponse> deleteWorkspaceApiKey({
    required String keyName,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/apikeys/${Uri.encodeComponent(keyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkspaceApiKeyResponse.fromJson(response);
  }

  /// Deletes a workspace service account from the workspace.
  ///
  /// This will delete any tokens created for the service account, as well. If
  /// the tokens are currently in use, the will fail to authenticate / authorize
  /// after they are deleted.
  ///
  /// Service accounts are only available for workspaces that are compatible
  /// with Grafana version 9 and above.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceAccountId] :
  /// The ID of the service account to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace where the service account resides.
  Future<DeleteWorkspaceServiceAccountResponse> deleteWorkspaceServiceAccount({
    required String serviceAccountId,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/serviceaccounts/${Uri.encodeComponent(serviceAccountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkspaceServiceAccountResponse.fromJson(response);
  }

  /// Deletes a token for the workspace service account.
  ///
  /// This will disable the key associated with the token. If any automation is
  /// currently using the key, it will no longer be authenticated or authorized
  /// to perform actions with the Grafana HTTP APIs.
  ///
  /// Service accounts are only available for workspaces that are compatible
  /// with Grafana version 9 and above.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceAccountId] :
  /// The ID of the service account from which to delete the token.
  ///
  /// Parameter [tokenId] :
  /// The ID of the token to delete.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace from which to delete the token.
  Future<DeleteWorkspaceServiceAccountTokenResponse>
      deleteWorkspaceServiceAccountToken({
    required String serviceAccountId,
    required String tokenId,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/serviceaccounts/${Uri.encodeComponent(serviceAccountId)}/tokens/${Uri.encodeComponent(tokenId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkspaceServiceAccountTokenResponse.fromJson(response);
  }

  /// Displays information about one Amazon Managed Grafana workspace.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to display information about.
  Future<DescribeWorkspaceResponse> describeWorkspace({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceResponse.fromJson(response);
  }

  /// Displays information about the authentication methods used in one Amazon
  /// Managed Grafana workspace.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to return authentication information about.
  Future<DescribeWorkspaceAuthenticationResponse>
      describeWorkspaceAuthentication({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/authentication',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceAuthenticationResponse.fromJson(response);
  }

  /// Gets the current configuration string for the given workspace.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to get configuration information for.
  Future<DescribeWorkspaceConfigurationResponse>
      describeWorkspaceConfiguration({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceConfigurationResponse.fromJson(response);
  }

  /// Removes the Grafana Enterprise license from a workspace.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [licenseType] :
  /// The type of license to remove from the workspace.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to remove the Grafana Enterprise license from.
  Future<DisassociateLicenseResponse> disassociateLicense({
    required LicenseType licenseType,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/licenses/${Uri.encodeComponent(licenseType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateLicenseResponse.fromJson(response);
  }

  /// Lists the users and groups who have the Grafana <code>Admin</code> and
  /// <code>Editor</code> roles in this workspace. If you use this operation
  /// without specifying <code>userId</code> or <code>groupId</code>, the
  /// operation returns the roles of all users and groups. If you specify a
  /// <code>userId</code> or a <code>groupId</code>, only the roles for that
  /// user or group are returned. If you do this, you can specify only one
  /// <code>userId</code> or one <code>groupId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to list permissions for. This parameter is
  /// required.
  ///
  /// Parameter [groupId] :
  /// (Optional) Limits the results to only the group that matches this ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You received
  /// this token from a previous <code>ListPermissions</code> operation.
  ///
  /// Parameter [userId] :
  /// (Optional) Limits the results to only the user that matches this ID.
  ///
  /// Parameter [userType] :
  /// (Optional) If you specify <code>SSO_USER</code>, then only the permissions
  /// of IAM Identity Center users are returned. If you specify
  /// <code>SSO_GROUP</code>, only the permissions of IAM Identity Center groups
  /// are returned.
  Future<ListPermissionsResponse> listPermissions({
    required String workspaceId,
    String? groupId,
    int? maxResults,
    String? nextToken,
    String? userId,
    UserType? userType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (groupId != null) 'groupId': [groupId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (userId != null) 'userId': [userId],
      if (userType != null) 'userType': [userType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/permissions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionsResponse.fromJson(response);
  }

  /// The <code>ListTagsForResource</code> operation returns the tags that are
  /// associated with the Amazon Managed Service for Grafana resource specified
  /// by the <code>resourceArn</code>. Currently, the only resource that can be
  /// tagged is a workspace.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource the list of tags are associated with.
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

  /// Lists available versions of Grafana. These are available when calling
  /// <code>CreateWorkspace</code>. Optionally, include a workspace to list the
  /// versions to which it can be upgraded.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to use when requesting the next set of results. You receive this
  /// token from a previous <code>ListVersions</code> operation.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to list the available upgrade versions. If not
  /// included, lists all versions of Grafana that are supported for
  /// <code>CreateWorkspace</code>.
  Future<ListVersionsResponse> listVersions({
    int? maxResults,
    String? nextToken,
    String? workspaceId,
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
      if (workspaceId != null) 'workspace-id': [workspaceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVersionsResponse.fromJson(response);
  }

  /// Returns a list of tokens for a workspace service account.
  /// <note>
  /// This does not return the key for each token. You cannot access keys after
  /// they are created. To create a new key, delete the token and recreate it.
  /// </note>
  /// Service accounts are only available for workspaces that are compatible
  /// with Grafana version 9 and above.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [serviceAccountId] :
  /// The ID of the service account for which to return tokens.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace for which to return tokens.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tokens to include in the results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of service accounts to return. (You receive
  /// this token from a previous <code>ListWorkspaceServiceAccountTokens</code>
  /// operation.)
  Future<ListWorkspaceServiceAccountTokensResponse>
      listWorkspaceServiceAccountTokens({
    required String serviceAccountId,
    required String workspaceId,
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
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/serviceaccounts/${Uri.encodeComponent(serviceAccountId)}/tokens',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkspaceServiceAccountTokensResponse.fromJson(response);
  }

  /// Returns a list of service accounts for a workspace.
  ///
  /// Service accounts are only available for workspaces that are compatible
  /// with Grafana version 9 and above.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The workspace for which to list service accounts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of service accounts to include in the results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of service accounts to return. (You receive
  /// this token from a previous <code>ListWorkspaceServiceAccounts</code>
  /// operation.)
  Future<ListWorkspaceServiceAccountsResponse> listWorkspaceServiceAccounts({
    required String workspaceId,
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
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/serviceaccounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkspaceServiceAccountsResponse.fromJson(response);
  }

  /// Returns a list of Amazon Managed Grafana workspaces in the account, with
  /// some information about each workspace. For more complete information about
  /// one workspace, use <a
  /// href="https://docs.aws.amazon.com/AAMG/latest/APIReference/API_DescribeWorkspace.html">DescribeWorkspace</a>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of workspaces to include in the results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of workspaces to return. (You receive this
  /// token from a previous <code>ListWorkspaces</code> operation.)
  Future<ListWorkspacesResponse> listWorkspaces({
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
      requestUri: '/workspaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkspacesResponse.fromJson(response);
  }

  /// The <code>TagResource</code> operation associates tags with an Amazon
  /// Managed Grafana resource. Currently, the only resource that can be tagged
  /// is workspaces.
  ///
  /// If you specify a new tag key for the resource, this tag is appended to the
  /// list of tags associated with the resource. If you specify a tag key that
  /// is already associated with the resource, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource the tag is associated with.
  ///
  /// Parameter [tags] :
  /// The list of tag keys and values to associate with the resource. You can
  /// associate tag keys only, tags (key and values) only or a combination of
  /// tag keys and tags.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The <code>UntagResource</code> operation removes the association of the
  /// tag with the Amazon Managed Grafana resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource the tag association is removed from.
  ///
  /// Parameter [tagKeys] :
  /// The key values of the tag to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates which users in a workspace have the Grafana <code>Admin</code> or
  /// <code>Editor</code> roles.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [updateInstructionBatch] :
  /// An array of structures that contain the permission updates to make.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update.
  Future<UpdatePermissionsResponse> updatePermissions({
    required List<UpdateInstruction> updateInstructionBatch,
    required String workspaceId,
  }) async {
    final $payload = <String, dynamic>{
      'updateInstructionBatch': updateInstructionBatch,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePermissionsResponse.fromJson(response);
  }

  /// Modifies an existing Amazon Managed Grafana workspace. If you use this
  /// operation and omit any optional parameters, the existing values of those
  /// parameters are not changed.
  ///
  /// To modify the user authentication methods that the workspace uses, such as
  /// SAML or IAM Identity Center, use <a
  /// href="https://docs.aws.amazon.com/grafana/latest/APIReference/API_UpdateWorkspaceAuthentication.html">UpdateWorkspaceAuthentication</a>.
  ///
  /// To modify which users in the workspace have the <code>Admin</code> and
  /// <code>Editor</code> Grafana roles, use <a
  /// href="https://docs.aws.amazon.com/grafana/latest/APIReference/API_UpdatePermissions.html">UpdatePermissions</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update.
  ///
  /// Parameter [accountAccessType] :
  /// Specifies whether the workspace can access Amazon Web Services resources
  /// in this Amazon Web Services account only, or whether it can also access
  /// Amazon Web Services resources in other accounts in the same organization.
  /// If you specify <code>ORGANIZATION</code>, you must specify which
  /// organizational units the workspace can access in the
  /// <code>workspaceOrganizationalUnits</code> parameter.
  ///
  /// Parameter [networkAccessControl] :
  /// The configuration settings for network access to your workspace.
  ///
  /// When this is configured, only listed IP addresses and VPC endpoints will
  /// be able to access your workspace. Standard Grafana authentication and
  /// authorization will still be required.
  ///
  /// If this is not configured, or is removed, then all IP addresses and VPC
  /// endpoints will be allowed. Standard Grafana authentication and
  /// authorization will still be required.
  ///
  /// Parameter [organizationRoleName] :
  /// The name of an IAM role that already exists to use to access resources
  /// through Organizations. This can only be used with a workspace that has the
  /// <code>permissionType</code> set to <code>CUSTOMER_MANAGED</code>.
  ///
  /// Parameter [permissionType] :
  /// Use this parameter if you want to change a workspace from
  /// <code>SERVICE_MANAGED</code> to <code>CUSTOMER_MANAGED</code>. This allows
  /// you to manage the permissions that the workspace uses to access
  /// datasources and notification channels. If the workspace is in a member
  /// Amazon Web Services account of an organization, and that account is not a
  /// delegated administrator account, and you want the workspace to access data
  /// sources in other Amazon Web Services accounts in the organization, you
  /// must choose <code>CUSTOMER_MANAGED</code>.
  ///
  /// If you specify this as <code>CUSTOMER_MANAGED</code>, you must also
  /// specify a <code>workspaceRoleArn</code> that the workspace will use for
  /// accessing Amazon Web Services resources.
  ///
  /// For more information on the role and permissions needed, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-manage-permissions.html">Amazon
  /// Managed Grafana permissions and policies for Amazon Web Services data
  /// sources and notification channels</a>
  /// <note>
  /// Do not use this to convert a <code>CUSTOMER_MANAGED</code> workspace to
  /// <code>SERVICE_MANAGED</code>. Do not include this parameter if you want to
  /// leave the workspace as <code>SERVICE_MANAGED</code>.
  ///
  /// You can convert a <code>CUSTOMER_MANAGED</code> workspace to
  /// <code>SERVICE_MANAGED</code> using the Amazon Managed Grafana console. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-datasource-and-notification.html">Managing
  /// permissions for data sources and notification channels</a>.
  /// </note>
  ///
  /// Parameter [removeNetworkAccessConfiguration] :
  /// Whether to remove the network access configuration from the workspace.
  ///
  /// Setting this to <code>true</code> and providing a
  /// <code>networkAccessControl</code> to set will return an error.
  ///
  /// If you remove this configuration by setting this to <code>true</code>,
  /// then all IP addresses and VPC endpoints will be allowed. Standard Grafana
  /// authentication and authorization will still be required.
  ///
  /// Parameter [removeVpcConfiguration] :
  /// Whether to remove the VPC configuration from the workspace.
  ///
  /// Setting this to <code>true</code> and providing a
  /// <code>vpcConfiguration</code> to set will return an error.
  ///
  /// Parameter [stackSetName] :
  /// The name of the CloudFormation stack set to use to generate IAM roles to
  /// be used for this workspace.
  ///
  /// Parameter [vpcConfiguration] :
  /// The configuration settings for an Amazon VPC that contains data sources
  /// for your Grafana workspace to connect to.
  ///
  /// Parameter [workspaceDataSources] :
  /// This parameter is for internal use only, and should not be used.
  ///
  /// Parameter [workspaceDescription] :
  /// A description for the workspace. This is used only to help you identify
  /// this workspace.
  ///
  /// Parameter [workspaceName] :
  /// A new name for the workspace to update.
  ///
  /// Parameter [workspaceNotificationDestinations] :
  /// Specify the Amazon Web Services notification channels that you plan to use
  /// in this workspace. Specifying these data sources here enables Amazon
  /// Managed Grafana to create IAM roles and permissions that allow Amazon
  /// Managed Grafana to use these channels.
  ///
  /// Parameter [workspaceOrganizationalUnits] :
  /// Specifies the organizational units that this workspace is allowed to use
  /// data sources from, if this workspace is in an account that is part of an
  /// organization.
  ///
  /// Parameter [workspaceRoleArn] :
  /// Specifies an IAM role that grants permissions to Amazon Web Services
  /// resources that the workspace accesses, such as data sources and
  /// notification channels. If this workspace has <code>permissionType</code>
  /// <code>CUSTOMER_MANAGED</code>, then this role is required.
  Future<UpdateWorkspaceResponse> updateWorkspace({
    required String workspaceId,
    AccountAccessType? accountAccessType,
    NetworkAccessConfiguration? networkAccessControl,
    String? organizationRoleName,
    PermissionType? permissionType,
    bool? removeNetworkAccessConfiguration,
    bool? removeVpcConfiguration,
    String? stackSetName,
    VpcConfiguration? vpcConfiguration,
    List<DataSourceType>? workspaceDataSources,
    String? workspaceDescription,
    String? workspaceName,
    List<NotificationDestinationType>? workspaceNotificationDestinations,
    List<String>? workspaceOrganizationalUnits,
    String? workspaceRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (accountAccessType != null)
        'accountAccessType': accountAccessType.toValue(),
      if (networkAccessControl != null)
        'networkAccessControl': networkAccessControl,
      if (organizationRoleName != null)
        'organizationRoleName': organizationRoleName,
      if (permissionType != null) 'permissionType': permissionType.toValue(),
      if (removeNetworkAccessConfiguration != null)
        'removeNetworkAccessConfiguration': removeNetworkAccessConfiguration,
      if (removeVpcConfiguration != null)
        'removeVpcConfiguration': removeVpcConfiguration,
      if (stackSetName != null) 'stackSetName': stackSetName,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
      if (workspaceDataSources != null)
        'workspaceDataSources':
            workspaceDataSources.map((e) => e.toValue()).toList(),
      if (workspaceDescription != null)
        'workspaceDescription': workspaceDescription,
      if (workspaceName != null) 'workspaceName': workspaceName,
      if (workspaceNotificationDestinations != null)
        'workspaceNotificationDestinations':
            workspaceNotificationDestinations.map((e) => e.toValue()).toList(),
      if (workspaceOrganizationalUnits != null)
        'workspaceOrganizationalUnits': workspaceOrganizationalUnits,
      if (workspaceRoleArn != null) 'workspaceRoleArn': workspaceRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkspaceResponse.fromJson(response);
  }

  /// Use this operation to define the identity provider (IdP) that this
  /// workspace authenticates users from, using SAML. You can also map SAML
  /// assertion attributes to workspace user information and define which groups
  /// in the assertion attribute are to have the <code>Admin</code> and
  /// <code>Editor</code> roles in the workspace.
  /// <note>
  /// Changes to the authentication method for a workspace may take a few
  /// minutes to take effect.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [authenticationProviders] :
  /// Specifies whether this workspace uses SAML 2.0, IAM Identity Center, or
  /// both to authenticate users for using the Grafana console within a
  /// workspace. For more information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/authentication-in-AMG.html">User
  /// authentication in Amazon Managed Grafana</a>.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update the authentication for.
  ///
  /// Parameter [samlConfiguration] :
  /// If the workspace uses SAML, use this structure to map SAML assertion
  /// attributes to workspace user information and define which groups in the
  /// assertion attribute are to have the <code>Admin</code> and
  /// <code>Editor</code> roles in the workspace.
  Future<UpdateWorkspaceAuthenticationResponse> updateWorkspaceAuthentication({
    required List<AuthenticationProviderTypes> authenticationProviders,
    required String workspaceId,
    SamlConfiguration? samlConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'authenticationProviders':
          authenticationProviders.map((e) => e.toValue()).toList(),
      if (samlConfiguration != null) 'samlConfiguration': samlConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/authentication',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkspaceAuthenticationResponse.fromJson(response);
  }

  /// Updates the configuration string for the given workspace
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configuration] :
  /// The new configuration string for the workspace. For more information about
  /// the format and configuration options available, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-configure-workspace.html">Working
  /// in your Grafana workspace</a>.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to update.
  ///
  /// Parameter [grafanaVersion] :
  /// Specifies the version of Grafana to support in the workspace. If not
  /// specified, keeps the current version of the workspace.
  ///
  /// Can only be used to upgrade (for example, from 8.4 to 9.4), not downgrade
  /// (for example, from 9.4 to 8.4).
  ///
  /// To know what versions are available to upgrade to for a specific
  /// workspace, see the <a
  /// href="https://docs.aws.amazon.com/grafana/latest/APIReference/API_ListVersions.html">ListVersions</a>
  /// operation.
  Future<void> updateWorkspaceConfiguration({
    required Object configuration,
    required String workspaceId,
    String? grafanaVersion,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': jsonEncode(configuration),
      if (grafanaVersion != null) 'grafanaVersion': grafanaVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum AccountAccessType {
  currentAccount,
  organization,
}

extension AccountAccessTypeValueExtension on AccountAccessType {
  String toValue() {
    switch (this) {
      case AccountAccessType.currentAccount:
        return 'CURRENT_ACCOUNT';
      case AccountAccessType.organization:
        return 'ORGANIZATION';
    }
  }
}

extension AccountAccessTypeFromString on String {
  AccountAccessType toAccountAccessType() {
    switch (this) {
      case 'CURRENT_ACCOUNT':
        return AccountAccessType.currentAccount;
      case 'ORGANIZATION':
        return AccountAccessType.organization;
    }
    throw Exception('$this is not known in enum AccountAccessType');
  }
}

/// A structure that defines which attributes in the IdP assertion are to be
/// used to define information about the users authenticated by the IdP to use
/// the workspace.
class AssertionAttributes {
  /// The name of the attribute within the SAML assertion to use as the email
  /// names for SAML users.
  final String? email;

  /// The name of the attribute within the SAML assertion to use as the user full
  /// "friendly" names for user groups.
  final String? groups;

  /// The name of the attribute within the SAML assertion to use as the login
  /// names for SAML users.
  final String? login;

  /// The name of the attribute within the SAML assertion to use as the user full
  /// "friendly" names for SAML users.
  final String? name;

  /// The name of the attribute within the SAML assertion to use as the user full
  /// "friendly" names for the users' organizations.
  final String? org;

  /// The name of the attribute within the SAML assertion to use as the user
  /// roles.
  final String? role;

  AssertionAttributes({
    this.email,
    this.groups,
    this.login,
    this.name,
    this.org,
    this.role,
  });

  factory AssertionAttributes.fromJson(Map<String, dynamic> json) {
    return AssertionAttributes(
      email: json['email'] as String?,
      groups: json['groups'] as String?,
      login: json['login'] as String?,
      name: json['name'] as String?,
      org: json['org'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final groups = this.groups;
    final login = this.login;
    final name = this.name;
    final org = this.org;
    final role = this.role;
    return {
      if (email != null) 'email': email,
      if (groups != null) 'groups': groups,
      if (login != null) 'login': login,
      if (name != null) 'name': name,
      if (org != null) 'org': org,
      if (role != null) 'role': role,
    };
  }
}

class AssociateLicenseResponse {
  /// A structure containing data about the workspace.
  final WorkspaceDescription workspace;

  AssociateLicenseResponse({
    required this.workspace,
  });

  factory AssociateLicenseResponse.fromJson(Map<String, dynamic> json) {
    return AssociateLicenseResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// A structure containing information about the user authentication methods
/// used by the workspace.
class AuthenticationDescription {
  /// Specifies whether this workspace uses IAM Identity Center, SAML, or both
  /// methods to authenticate users to use the Grafana console in the Amazon
  /// Managed Grafana workspace.
  final List<AuthenticationProviderTypes> providers;

  /// A structure containing information about how this workspace works with IAM
  /// Identity Center.
  final AwsSsoAuthentication? awsSso;

  /// A structure containing information about how this workspace works with SAML,
  /// including what attributes within the assertion are to be mapped to user
  /// information in the workspace.
  final SamlAuthentication? saml;

  AuthenticationDescription({
    required this.providers,
    this.awsSso,
    this.saml,
  });

  factory AuthenticationDescription.fromJson(Map<String, dynamic> json) {
    return AuthenticationDescription(
      providers: (json['providers'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAuthenticationProviderTypes())
          .toList(),
      awsSso: json['awsSso'] != null
          ? AwsSsoAuthentication.fromJson(
              json['awsSso'] as Map<String, dynamic>)
          : null,
      saml: json['saml'] != null
          ? SamlAuthentication.fromJson(json['saml'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final providers = this.providers;
    final awsSso = this.awsSso;
    final saml = this.saml;
    return {
      'providers': providers.map((e) => e.toValue()).toList(),
      if (awsSso != null) 'awsSso': awsSso,
      if (saml != null) 'saml': saml,
    };
  }
}

enum AuthenticationProviderTypes {
  awsSso,
  saml,
}

extension AuthenticationProviderTypesValueExtension
    on AuthenticationProviderTypes {
  String toValue() {
    switch (this) {
      case AuthenticationProviderTypes.awsSso:
        return 'AWS_SSO';
      case AuthenticationProviderTypes.saml:
        return 'SAML';
    }
  }
}

extension AuthenticationProviderTypesFromString on String {
  AuthenticationProviderTypes toAuthenticationProviderTypes() {
    switch (this) {
      case 'AWS_SSO':
        return AuthenticationProviderTypes.awsSso;
      case 'SAML':
        return AuthenticationProviderTypes.saml;
    }
    throw Exception('$this is not known in enum AuthenticationProviderTypes');
  }
}

/// A structure that describes whether the workspace uses SAML, IAM Identity
/// Center, or both methods for user authentication, and whether that
/// authentication is fully configured.
class AuthenticationSummary {
  /// Specifies whether the workspace uses SAML, IAM Identity Center, or both
  /// methods for user authentication.
  final List<AuthenticationProviderTypes> providers;

  /// Specifies whether the workplace's user authentication method is fully
  /// configured.
  final SamlConfigurationStatus? samlConfigurationStatus;

  AuthenticationSummary({
    required this.providers,
    this.samlConfigurationStatus,
  });

  factory AuthenticationSummary.fromJson(Map<String, dynamic> json) {
    return AuthenticationSummary(
      providers: (json['providers'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAuthenticationProviderTypes())
          .toList(),
      samlConfigurationStatus: (json['samlConfigurationStatus'] as String?)
          ?.toSamlConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final providers = this.providers;
    final samlConfigurationStatus = this.samlConfigurationStatus;
    return {
      'providers': providers.map((e) => e.toValue()).toList(),
      if (samlConfigurationStatus != null)
        'samlConfigurationStatus': samlConfigurationStatus.toValue(),
    };
  }
}

/// A structure containing information about how this workspace works with IAM
/// Identity Center.
class AwsSsoAuthentication {
  /// The ID of the IAM Identity Center-managed application that is created by
  /// Amazon Managed Grafana.
  final String? ssoClientId;

  AwsSsoAuthentication({
    this.ssoClientId,
  });

  factory AwsSsoAuthentication.fromJson(Map<String, dynamic> json) {
    return AwsSsoAuthentication(
      ssoClientId: json['ssoClientId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ssoClientId = this.ssoClientId;
    return {
      if (ssoClientId != null) 'ssoClientId': ssoClientId,
    };
  }
}

class CreateWorkspaceApiKeyResponse {
  /// The key token. Use this value as a bearer token to authenticate HTTP
  /// requests to the workspace.
  final String key;

  /// The name of the key that was created.
  final String keyName;

  /// The ID of the workspace that the key is valid for.
  final String workspaceId;

  CreateWorkspaceApiKeyResponse({
    required this.key,
    required this.keyName,
    required this.workspaceId,
  });

  factory CreateWorkspaceApiKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceApiKeyResponse(
      key: json['key'] as String,
      keyName: json['keyName'] as String,
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final keyName = this.keyName;
    final workspaceId = this.workspaceId;
    return {
      'key': key,
      'keyName': keyName,
      'workspaceId': workspaceId,
    };
  }
}

class CreateWorkspaceResponse {
  /// A structure containing data about the workspace that was created.
  final WorkspaceDescription workspace;

  CreateWorkspaceResponse({
    required this.workspace,
  });

  factory CreateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

class CreateWorkspaceServiceAccountResponse {
  /// The permission level given to the service account.
  final Role grafanaRole;

  /// The ID of the service account.
  final String id;

  /// The name of the service account.
  final String name;

  /// The workspace with which the service account is associated.
  final String workspaceId;

  CreateWorkspaceServiceAccountResponse({
    required this.grafanaRole,
    required this.id,
    required this.name,
    required this.workspaceId,
  });

  factory CreateWorkspaceServiceAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWorkspaceServiceAccountResponse(
      grafanaRole: (json['grafanaRole'] as String).toRole(),
      id: json['id'] as String,
      name: json['name'] as String,
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final grafanaRole = this.grafanaRole;
    final id = this.id;
    final name = this.name;
    final workspaceId = this.workspaceId;
    return {
      'grafanaRole': grafanaRole.toValue(),
      'id': id,
      'name': name,
      'workspaceId': workspaceId,
    };
  }
}

class CreateWorkspaceServiceAccountTokenResponse {
  /// The ID of the service account where the token was created.
  final String serviceAccountId;

  /// Information about the created token, including the key. Be sure to store the
  /// key securely.
  final ServiceAccountTokenSummaryWithKey serviceAccountToken;

  /// The ID of the workspace where the token was created.
  final String workspaceId;

  CreateWorkspaceServiceAccountTokenResponse({
    required this.serviceAccountId,
    required this.serviceAccountToken,
    required this.workspaceId,
  });

  factory CreateWorkspaceServiceAccountTokenResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateWorkspaceServiceAccountTokenResponse(
      serviceAccountId: json['serviceAccountId'] as String,
      serviceAccountToken: ServiceAccountTokenSummaryWithKey.fromJson(
          json['serviceAccountToken'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceAccountId = this.serviceAccountId;
    final serviceAccountToken = this.serviceAccountToken;
    final workspaceId = this.workspaceId;
    return {
      'serviceAccountId': serviceAccountId,
      'serviceAccountToken': serviceAccountToken,
      'workspaceId': workspaceId,
    };
  }
}

enum DataSourceType {
  amazonOpensearchService,
  cloudwatch,
  prometheus,
  xray,
  timestream,
  sitewise,
  athena,
  redshift,
  twinmaker,
}

extension DataSourceTypeValueExtension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.amazonOpensearchService:
        return 'AMAZON_OPENSEARCH_SERVICE';
      case DataSourceType.cloudwatch:
        return 'CLOUDWATCH';
      case DataSourceType.prometheus:
        return 'PROMETHEUS';
      case DataSourceType.xray:
        return 'XRAY';
      case DataSourceType.timestream:
        return 'TIMESTREAM';
      case DataSourceType.sitewise:
        return 'SITEWISE';
      case DataSourceType.athena:
        return 'ATHENA';
      case DataSourceType.redshift:
        return 'REDSHIFT';
      case DataSourceType.twinmaker:
        return 'TWINMAKER';
    }
  }
}

extension DataSourceTypeFromString on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'AMAZON_OPENSEARCH_SERVICE':
        return DataSourceType.amazonOpensearchService;
      case 'CLOUDWATCH':
        return DataSourceType.cloudwatch;
      case 'PROMETHEUS':
        return DataSourceType.prometheus;
      case 'XRAY':
        return DataSourceType.xray;
      case 'TIMESTREAM':
        return DataSourceType.timestream;
      case 'SITEWISE':
        return DataSourceType.sitewise;
      case 'ATHENA':
        return DataSourceType.athena;
      case 'REDSHIFT':
        return DataSourceType.redshift;
      case 'TWINMAKER':
        return DataSourceType.twinmaker;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

class DeleteWorkspaceApiKeyResponse {
  /// The name of the key that was deleted.
  final String keyName;

  /// The ID of the workspace where the key was deleted.
  final String workspaceId;

  DeleteWorkspaceApiKeyResponse({
    required this.keyName,
    required this.workspaceId,
  });

  factory DeleteWorkspaceApiKeyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkspaceApiKeyResponse(
      keyName: json['keyName'] as String,
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final keyName = this.keyName;
    final workspaceId = this.workspaceId;
    return {
      'keyName': keyName,
      'workspaceId': workspaceId,
    };
  }
}

class DeleteWorkspaceResponse {
  /// A structure containing information about the workspace that was deleted.
  final WorkspaceDescription workspace;

  DeleteWorkspaceResponse({
    required this.workspace,
  });

  factory DeleteWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

class DeleteWorkspaceServiceAccountResponse {
  /// The ID of the service account deleted.
  final String serviceAccountId;

  /// The ID of the workspace where the service account was deleted.
  final String workspaceId;

  DeleteWorkspaceServiceAccountResponse({
    required this.serviceAccountId,
    required this.workspaceId,
  });

  factory DeleteWorkspaceServiceAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteWorkspaceServiceAccountResponse(
      serviceAccountId: json['serviceAccountId'] as String,
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceAccountId = this.serviceAccountId;
    final workspaceId = this.workspaceId;
    return {
      'serviceAccountId': serviceAccountId,
      'workspaceId': workspaceId,
    };
  }
}

class DeleteWorkspaceServiceAccountTokenResponse {
  /// The ID of the service account where the token was deleted.
  final String serviceAccountId;

  /// The ID of the token that was deleted.
  final String tokenId;

  /// The ID of the workspace where the token was deleted.
  final String workspaceId;

  DeleteWorkspaceServiceAccountTokenResponse({
    required this.serviceAccountId,
    required this.tokenId,
    required this.workspaceId,
  });

  factory DeleteWorkspaceServiceAccountTokenResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteWorkspaceServiceAccountTokenResponse(
      serviceAccountId: json['serviceAccountId'] as String,
      tokenId: json['tokenId'] as String,
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceAccountId = this.serviceAccountId;
    final tokenId = this.tokenId;
    final workspaceId = this.workspaceId;
    return {
      'serviceAccountId': serviceAccountId,
      'tokenId': tokenId,
      'workspaceId': workspaceId,
    };
  }
}

class DescribeWorkspaceAuthenticationResponse {
  /// A structure containing information about the authentication methods used in
  /// the workspace.
  final AuthenticationDescription authentication;

  DescribeWorkspaceAuthenticationResponse({
    required this.authentication,
  });

  factory DescribeWorkspaceAuthenticationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspaceAuthenticationResponse(
      authentication: AuthenticationDescription.fromJson(
          json['authentication'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    return {
      'authentication': authentication,
    };
  }
}

class DescribeWorkspaceConfigurationResponse {
  /// The configuration string for the workspace that you requested. For more
  /// information about the format and configuration options available, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-configure-workspace.html">Working
  /// in your Grafana workspace</a>.
  final Object configuration;

  /// The supported Grafana version for the workspace.
  final String? grafanaVersion;

  DescribeWorkspaceConfigurationResponse({
    required this.configuration,
    this.grafanaVersion,
  });

  factory DescribeWorkspaceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorkspaceConfigurationResponse(
      configuration: jsonDecode(json['configuration'] as String) as Object,
      grafanaVersion: json['grafanaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final grafanaVersion = this.grafanaVersion;
    return {
      'configuration': jsonEncode(configuration),
      if (grafanaVersion != null) 'grafanaVersion': grafanaVersion,
    };
  }
}

class DescribeWorkspaceResponse {
  /// A structure containing information about the workspace.
  final WorkspaceDescription workspace;

  DescribeWorkspaceResponse({
    required this.workspace,
  });

  factory DescribeWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

class DisassociateLicenseResponse {
  /// A structure containing information about the workspace.
  final WorkspaceDescription workspace;

  DisassociateLicenseResponse({
    required this.workspace,
  });

  factory DisassociateLicenseResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateLicenseResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// A structure containing the identity provider (IdP) metadata used to
/// integrate the identity provider with this workspace. You can specify the
/// metadata either by providing a URL to its location in the <code>url</code>
/// parameter, or by specifying the full metadata in XML format in the
/// <code>xml</code> parameter. Specifying both will cause an error.
class IdpMetadata {
  /// The URL of the location containing the IdP metadata.
  final String? url;

  /// The full IdP metadata, in XML format.
  final String? xml;

  IdpMetadata({
    this.url,
    this.xml,
  });

  factory IdpMetadata.fromJson(Map<String, dynamic> json) {
    return IdpMetadata(
      url: json['url'] as String?,
      xml: json['xml'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final xml = this.xml;
    return {
      if (url != null) 'url': url,
      if (xml != null) 'xml': xml,
    };
  }
}

enum LicenseType {
  enterprise,
  enterpriseFreeTrial,
}

extension LicenseTypeValueExtension on LicenseType {
  String toValue() {
    switch (this) {
      case LicenseType.enterprise:
        return 'ENTERPRISE';
      case LicenseType.enterpriseFreeTrial:
        return 'ENTERPRISE_FREE_TRIAL';
    }
  }
}

extension LicenseTypeFromString on String {
  LicenseType toLicenseType() {
    switch (this) {
      case 'ENTERPRISE':
        return LicenseType.enterprise;
      case 'ENTERPRISE_FREE_TRIAL':
        return LicenseType.enterpriseFreeTrial;
    }
    throw Exception('$this is not known in enum LicenseType');
  }
}

class ListPermissionsResponse {
  /// The permissions returned by the operation.
  final List<PermissionEntry> permissions;

  /// The token to use in a subsequent <code>ListPermissions</code> operation to
  /// return the next set of results.
  final String? nextToken;

  ListPermissionsResponse({
    required this.permissions,
    this.nextToken,
  });

  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionsResponse(
      permissions: (json['permissions'] as List)
          .whereNotNull()
          .map((e) => PermissionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final nextToken = this.nextToken;
    return {
      'permissions': permissions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags that are associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListVersionsResponse {
  /// The Grafana versions available to create. If a workspace ID is included in
  /// the request, the Grafana versions to which this workspace can be upgraded.
  final List<String>? grafanaVersions;

  /// The token to use in a subsequent <code>ListVersions</code> operation to
  /// return the next set of results.
  final String? nextToken;

  ListVersionsResponse({
    this.grafanaVersions,
    this.nextToken,
  });

  factory ListVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListVersionsResponse(
      grafanaVersions: (json['grafanaVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grafanaVersions = this.grafanaVersions;
    final nextToken = this.nextToken;
    return {
      if (grafanaVersions != null) 'grafanaVersions': grafanaVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorkspaceServiceAccountTokensResponse {
  /// The ID of the service account where the tokens reside.
  final String serviceAccountId;

  /// An array of structures containing information about the tokens.
  final List<ServiceAccountTokenSummary> serviceAccountTokens;

  /// The ID of the workspace where the tokens reside.
  final String workspaceId;

  /// The token to use when requesting the next set of service accounts.
  final String? nextToken;

  ListWorkspaceServiceAccountTokensResponse({
    required this.serviceAccountId,
    required this.serviceAccountTokens,
    required this.workspaceId,
    this.nextToken,
  });

  factory ListWorkspaceServiceAccountTokensResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWorkspaceServiceAccountTokensResponse(
      serviceAccountId: json['serviceAccountId'] as String,
      serviceAccountTokens: (json['serviceAccountTokens'] as List)
          .whereNotNull()
          .map((e) =>
              ServiceAccountTokenSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      workspaceId: json['workspaceId'] as String,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceAccountId = this.serviceAccountId;
    final serviceAccountTokens = this.serviceAccountTokens;
    final workspaceId = this.workspaceId;
    final nextToken = this.nextToken;
    return {
      'serviceAccountId': serviceAccountId,
      'serviceAccountTokens': serviceAccountTokens,
      'workspaceId': workspaceId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorkspaceServiceAccountsResponse {
  /// An array of structures containing information about the service accounts.
  final List<ServiceAccountSummary> serviceAccounts;

  /// The workspace to which the service accounts are associated.
  final String workspaceId;

  /// The token to use when requesting the next set of service accounts.
  final String? nextToken;

  ListWorkspaceServiceAccountsResponse({
    required this.serviceAccounts,
    required this.workspaceId,
    this.nextToken,
  });

  factory ListWorkspaceServiceAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWorkspaceServiceAccountsResponse(
      serviceAccounts: (json['serviceAccounts'] as List)
          .whereNotNull()
          .map((e) => ServiceAccountSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      workspaceId: json['workspaceId'] as String,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceAccounts = this.serviceAccounts;
    final workspaceId = this.workspaceId;
    final nextToken = this.nextToken;
    return {
      'serviceAccounts': serviceAccounts,
      'workspaceId': workspaceId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorkspacesResponse {
  /// An array of structures that contain some information about the workspaces in
  /// the account.
  final List<WorkspaceSummary> workspaces;

  /// The token to use when requesting the next set of workspaces.
  final String? nextToken;

  ListWorkspacesResponse({
    required this.workspaces,
    this.nextToken,
  });

  factory ListWorkspacesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkspacesResponse(
      workspaces: (json['workspaces'] as List)
          .whereNotNull()
          .map((e) => WorkspaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaces = this.workspaces;
    final nextToken = this.nextToken;
    return {
      'workspaces': workspaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The configuration settings for in-bound network access to your workspace.
///
/// When this is configured, only listed IP addresses and VPC endpoints will be
/// able to access your workspace. Standard Grafana authentication and
/// authorization are still required.
///
/// Access is granted to a caller that is in either the IP address list or the
/// VPC endpoint list - they do not need to be in both.
///
/// If this is not configured, or is removed, then all IP addresses and VPC
/// endpoints are allowed. Standard Grafana authentication and authorization are
/// still required.
/// <note>
/// While both <code>prefixListIds</code> and <code>vpceIds</code> are required,
/// you can pass in an empty array of strings for either parameter if you do not
/// want to allow any of that type.
///
/// If both are passed as empty arrays, no traffic is allowed to the workspace,
/// because only <i>explicitly</i> allowed connections are accepted.
/// </note>
class NetworkAccessConfiguration {
  /// An array of prefix list IDs. A prefix list is a list of CIDR ranges of IP
  /// addresses. The IP addresses specified are allowed to access your workspace.
  /// If the list is not included in the configuration (passed an empty array)
  /// then no IP addresses are allowed to access the workspace. You create a
  /// prefix list using the Amazon VPC console.
  ///
  /// Prefix list IDs have the format <code>pl-<i>1a2b3c4d</i> </code>.
  ///
  /// For more information about prefix lists, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/managed-prefix-lists.html">Group
  /// CIDR blocks using managed prefix lists</a>in the <i>Amazon Virtual Private
  /// Cloud User Guide</i>.
  final List<String> prefixListIds;

  /// An array of Amazon VPC endpoint IDs for the workspace. You can create VPC
  /// endpoints to your Amazon Managed Grafana workspace for access from within a
  /// VPC. If a <code>NetworkAccessConfiguration</code> is specified then only VPC
  /// endpoints specified here are allowed to access the workspace. If you pass in
  /// an empty array of strings, then no VPCs are allowed to access the workspace.
  ///
  /// VPC endpoint IDs have the format <code>vpce-<i>1a2b3c4d</i> </code>.
  ///
  /// For more information about creating an interface VPC endpoint, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/VPC-endpoints">Interface
  /// VPC endpoints</a> in the <i>Amazon Managed Grafana User Guide</i>.
  /// <note>
  /// The only VPC endpoints that can be specified here are interface VPC
  /// endpoints for Grafana workspaces (using the
  /// <code>com.amazonaws.[region].grafana-workspace</code> service endpoint).
  /// Other VPC endpoints are ignored.
  /// </note>
  final List<String> vpceIds;

  NetworkAccessConfiguration({
    required this.prefixListIds,
    required this.vpceIds,
  });

  factory NetworkAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkAccessConfiguration(
      prefixListIds: (json['prefixListIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpceIds: (json['vpceIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final prefixListIds = this.prefixListIds;
    final vpceIds = this.vpceIds;
    return {
      'prefixListIds': prefixListIds,
      'vpceIds': vpceIds,
    };
  }
}

enum NotificationDestinationType {
  sns,
}

extension NotificationDestinationTypeValueExtension
    on NotificationDestinationType {
  String toValue() {
    switch (this) {
      case NotificationDestinationType.sns:
        return 'SNS';
    }
  }
}

extension NotificationDestinationTypeFromString on String {
  NotificationDestinationType toNotificationDestinationType() {
    switch (this) {
      case 'SNS':
        return NotificationDestinationType.sns;
    }
    throw Exception('$this is not known in enum NotificationDestinationType');
  }
}

/// A structure containing the identity of one user or group and the
/// <code>Admin</code>, <code>Editor</code>, or <code>Viewer</code> role that
/// they have.
class PermissionEntry {
  /// Specifies whether the user or group has the <code>Admin</code>,
  /// <code>Editor</code>, or <code>Viewer</code> role.
  final Role role;

  /// A structure with the ID of the user or group with this role.
  final User user;

  PermissionEntry({
    required this.role,
    required this.user,
  });

  factory PermissionEntry.fromJson(Map<String, dynamic> json) {
    return PermissionEntry(
      role: (json['role'] as String).toRole(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final user = this.user;
    return {
      'role': role.toValue(),
      'user': user,
    };
  }
}

enum PermissionType {
  customerManaged,
  serviceManaged,
}

extension PermissionTypeValueExtension on PermissionType {
  String toValue() {
    switch (this) {
      case PermissionType.customerManaged:
        return 'CUSTOMER_MANAGED';
      case PermissionType.serviceManaged:
        return 'SERVICE_MANAGED';
    }
  }
}

extension PermissionTypeFromString on String {
  PermissionType toPermissionType() {
    switch (this) {
      case 'CUSTOMER_MANAGED':
        return PermissionType.customerManaged;
      case 'SERVICE_MANAGED':
        return PermissionType.serviceManaged;
    }
    throw Exception('$this is not known in enum PermissionType');
  }
}

enum Role {
  admin,
  editor,
  viewer,
}

extension RoleValueExtension on Role {
  String toValue() {
    switch (this) {
      case Role.admin:
        return 'ADMIN';
      case Role.editor:
        return 'EDITOR';
      case Role.viewer:
        return 'VIEWER';
    }
  }
}

extension RoleFromString on String {
  Role toRole() {
    switch (this) {
      case 'ADMIN':
        return Role.admin;
      case 'EDITOR':
        return Role.editor;
      case 'VIEWER':
        return Role.viewer;
    }
    throw Exception('$this is not known in enum Role');
  }
}

/// This structure defines which groups defined in the SAML assertion attribute
/// are to be mapped to the Grafana <code>Admin</code> and <code>Editor</code>
/// roles in the workspace. SAML authenticated users not part of
/// <code>Admin</code> or <code>Editor</code> role groups have
/// <code>Viewer</code> permission over the workspace.
class RoleValues {
  /// A list of groups from the SAML assertion attribute to grant the Grafana
  /// <code>Admin</code> role to.
  final List<String>? admin;

  /// A list of groups from the SAML assertion attribute to grant the Grafana
  /// <code>Editor</code> role to.
  final List<String>? editor;

  RoleValues({
    this.admin,
    this.editor,
  });

  factory RoleValues.fromJson(Map<String, dynamic> json) {
    return RoleValues(
      admin: (json['admin'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      editor: (json['editor'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final admin = this.admin;
    final editor = this.editor;
    return {
      if (admin != null) 'admin': admin,
      if (editor != null) 'editor': editor,
    };
  }
}

/// A structure containing information about how this workspace works with SAML.
class SamlAuthentication {
  /// Specifies whether the workspace's SAML configuration is complete.
  final SamlConfigurationStatus status;

  /// A structure containing details about how this workspace works with SAML.
  final SamlConfiguration? configuration;

  SamlAuthentication({
    required this.status,
    this.configuration,
  });

  factory SamlAuthentication.fromJson(Map<String, dynamic> json) {
    return SamlAuthentication(
      status: (json['status'] as String).toSamlConfigurationStatus(),
      configuration: json['configuration'] != null
          ? SamlConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final configuration = this.configuration;
    return {
      'status': status.toValue(),
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// A structure containing information about how this workspace works with SAML.
class SamlConfiguration {
  /// A structure containing the identity provider (IdP) metadata used to
  /// integrate the identity provider with this workspace.
  final IdpMetadata idpMetadata;

  /// Lists which organizations defined in the SAML assertion are allowed to use
  /// the Amazon Managed Grafana workspace. If this is empty, all organizations in
  /// the assertion attribute have access.
  final List<String>? allowedOrganizations;

  /// A structure that defines which attributes in the SAML assertion are to be
  /// used to define information about the users authenticated by that IdP to use
  /// the workspace.
  final AssertionAttributes? assertionAttributes;

  /// How long a sign-on session by a SAML user is valid, before the user has to
  /// sign on again.
  final int? loginValidityDuration;

  /// A structure containing arrays that map group names in the SAML assertion to
  /// the Grafana <code>Admin</code> and <code>Editor</code> roles in the
  /// workspace.
  final RoleValues? roleValues;

  SamlConfiguration({
    required this.idpMetadata,
    this.allowedOrganizations,
    this.assertionAttributes,
    this.loginValidityDuration,
    this.roleValues,
  });

  factory SamlConfiguration.fromJson(Map<String, dynamic> json) {
    return SamlConfiguration(
      idpMetadata:
          IdpMetadata.fromJson(json['idpMetadata'] as Map<String, dynamic>),
      allowedOrganizations: (json['allowedOrganizations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      assertionAttributes: json['assertionAttributes'] != null
          ? AssertionAttributes.fromJson(
              json['assertionAttributes'] as Map<String, dynamic>)
          : null,
      loginValidityDuration: json['loginValidityDuration'] as int?,
      roleValues: json['roleValues'] != null
          ? RoleValues.fromJson(json['roleValues'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idpMetadata = this.idpMetadata;
    final allowedOrganizations = this.allowedOrganizations;
    final assertionAttributes = this.assertionAttributes;
    final loginValidityDuration = this.loginValidityDuration;
    final roleValues = this.roleValues;
    return {
      'idpMetadata': idpMetadata,
      if (allowedOrganizations != null)
        'allowedOrganizations': allowedOrganizations,
      if (assertionAttributes != null)
        'assertionAttributes': assertionAttributes,
      if (loginValidityDuration != null)
        'loginValidityDuration': loginValidityDuration,
      if (roleValues != null) 'roleValues': roleValues,
    };
  }
}

enum SamlConfigurationStatus {
  configured,
  notConfigured,
}

extension SamlConfigurationStatusValueExtension on SamlConfigurationStatus {
  String toValue() {
    switch (this) {
      case SamlConfigurationStatus.configured:
        return 'CONFIGURED';
      case SamlConfigurationStatus.notConfigured:
        return 'NOT_CONFIGURED';
    }
  }
}

extension SamlConfigurationStatusFromString on String {
  SamlConfigurationStatus toSamlConfigurationStatus() {
    switch (this) {
      case 'CONFIGURED':
        return SamlConfigurationStatus.configured;
      case 'NOT_CONFIGURED':
        return SamlConfigurationStatus.notConfigured;
    }
    throw Exception('$this is not known in enum SamlConfigurationStatus');
  }
}

/// A structure that contains the information about one service account.
class ServiceAccountSummary {
  /// The role of the service account, which sets the permission level used when
  /// calling Grafana APIs.
  final Role grafanaRole;

  /// The unique ID of the service account.
  final String id;

  /// Returns true if the service account is disabled. Service accounts can be
  /// disabled and enabled in the Amazon Managed Grafana console.
  final String isDisabled;

  /// The name of the service account.
  final String name;

  ServiceAccountSummary({
    required this.grafanaRole,
    required this.id,
    required this.isDisabled,
    required this.name,
  });

  factory ServiceAccountSummary.fromJson(Map<String, dynamic> json) {
    return ServiceAccountSummary(
      grafanaRole: (json['grafanaRole'] as String).toRole(),
      id: json['id'] as String,
      isDisabled: json['isDisabled'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final grafanaRole = this.grafanaRole;
    final id = this.id;
    final isDisabled = this.isDisabled;
    final name = this.name;
    return {
      'grafanaRole': grafanaRole.toValue(),
      'id': id,
      'isDisabled': isDisabled,
      'name': name,
    };
  }
}

/// A structure that contains the information about a service account token.
class ServiceAccountTokenSummary {
  /// When the service account token was created.
  final DateTime createdAt;

  /// When the service account token will expire.
  final DateTime expiresAt;

  /// The unique ID of the service account token.
  final String id;

  /// The name of the service account token.
  final String name;

  /// The last time the token was used to authorize a Grafana HTTP API.
  final DateTime? lastUsedAt;

  ServiceAccountTokenSummary({
    required this.createdAt,
    required this.expiresAt,
    required this.id,
    required this.name,
    this.lastUsedAt,
  });

  factory ServiceAccountTokenSummary.fromJson(Map<String, dynamic> json) {
    return ServiceAccountTokenSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      expiresAt: nonNullableTimeStampFromJson(json['expiresAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      lastUsedAt: timeStampFromJson(json['lastUsedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final id = this.id;
    final name = this.name;
    final lastUsedAt = this.lastUsedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'expiresAt': unixTimestampToJson(expiresAt),
      'id': id,
      'name': name,
      if (lastUsedAt != null) 'lastUsedAt': unixTimestampToJson(lastUsedAt),
    };
  }
}

/// A structure that contains the information about a service account token.
///
/// This structure is returned when creating the token. It is important to store
/// the <code>key</code> that is returned, as it is not retrievable at a later
/// time.
///
/// If you lose the key, you can delete and recreate the token, which will
/// create a new key.
class ServiceAccountTokenSummaryWithKey {
  /// The unique ID of the service account token.
  final String id;

  /// The key for the service account token. Used when making calls to the Grafana
  /// HTTP APIs to authenticate and authorize the requests.
  final String key;

  /// The name of the service account token.
  final String name;

  ServiceAccountTokenSummaryWithKey({
    required this.id,
    required this.key,
    required this.name,
  });

  factory ServiceAccountTokenSummaryWithKey.fromJson(
      Map<String, dynamic> json) {
    return ServiceAccountTokenSummaryWithKey(
      id: json['id'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final key = this.key;
    final name = this.name;
    return {
      'id': id,
      'key': key,
      'name': name,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum UpdateAction {
  add,
  revoke,
}

extension UpdateActionValueExtension on UpdateAction {
  String toValue() {
    switch (this) {
      case UpdateAction.add:
        return 'ADD';
      case UpdateAction.revoke:
        return 'REVOKE';
    }
  }
}

extension UpdateActionFromString on String {
  UpdateAction toUpdateAction() {
    switch (this) {
      case 'ADD':
        return UpdateAction.add;
      case 'REVOKE':
        return UpdateAction.revoke;
    }
    throw Exception('$this is not known in enum UpdateAction');
  }
}

/// A structure containing information about one error encountered while
/// performing an <a
/// href="https://docs.aws.amazon.com/grafana/latest/APIReference/API_UpdatePermissions.html">UpdatePermissions</a>
/// operation.
class UpdateError {
  /// Specifies which permission update caused the error.
  final UpdateInstruction causedBy;

  /// The error code.
  final int code;

  /// The message for this error.
  final String message;

  UpdateError({
    required this.causedBy,
    required this.code,
    required this.message,
  });

  factory UpdateError.fromJson(Map<String, dynamic> json) {
    return UpdateError(
      causedBy:
          UpdateInstruction.fromJson(json['causedBy'] as Map<String, dynamic>),
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final causedBy = this.causedBy;
    final code = this.code;
    final message = this.message;
    return {
      'causedBy': causedBy,
      'code': code,
      'message': message,
    };
  }
}

/// Contains the instructions for one Grafana role permission update in a <a
/// href="https://docs.aws.amazon.com/grafana/latest/APIReference/API_UpdatePermissions.html">UpdatePermissions</a>
/// operation.
class UpdateInstruction {
  /// Specifies whether this update is to add or revoke role permissions.
  final UpdateAction action;

  /// The role to add or revoke for the user or the group specified in
  /// <code>users</code>.
  final Role role;

  /// A structure that specifies the user or group to add or revoke the role for.
  final List<User> users;

  UpdateInstruction({
    required this.action,
    required this.role,
    required this.users,
  });

  factory UpdateInstruction.fromJson(Map<String, dynamic> json) {
    return UpdateInstruction(
      action: (json['action'] as String).toUpdateAction(),
      role: (json['role'] as String).toRole(),
      users: (json['users'] as List)
          .whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final role = this.role;
    final users = this.users;
    return {
      'action': action.toValue(),
      'role': role.toValue(),
      'users': users,
    };
  }
}

class UpdatePermissionsResponse {
  /// An array of structures that contain the errors from the operation, if any.
  final List<UpdateError> errors;

  UpdatePermissionsResponse({
    required this.errors,
  });

  factory UpdatePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePermissionsResponse(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => UpdateError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'errors': errors,
    };
  }
}

class UpdateWorkspaceAuthenticationResponse {
  /// A structure that describes the user authentication for this workspace after
  /// the update is made.
  final AuthenticationDescription authentication;

  UpdateWorkspaceAuthenticationResponse({
    required this.authentication,
  });

  factory UpdateWorkspaceAuthenticationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateWorkspaceAuthenticationResponse(
      authentication: AuthenticationDescription.fromJson(
          json['authentication'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    return {
      'authentication': authentication,
    };
  }
}

class UpdateWorkspaceConfigurationResponse {
  UpdateWorkspaceConfigurationResponse();

  factory UpdateWorkspaceConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateWorkspaceConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWorkspaceResponse {
  /// A structure containing data about the workspace that was created.
  final WorkspaceDescription workspace;

  UpdateWorkspaceResponse({
    required this.workspace,
  });

  factory UpdateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// A structure that specifies one user or group in the workspace.
class User {
  /// The ID of the user or group.
  ///
  /// Pattern:
  /// <code>^([0-9a-fA-F]{10}-|)[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}$</code>
  final String id;

  /// Specifies whether this is a single user or a group.
  final UserType type;

  User({
    required this.id,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      type: (json['type'] as String).toUserType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'id': id,
      'type': type.toValue(),
    };
  }
}

enum UserType {
  ssoUser,
  ssoGroup,
}

extension UserTypeValueExtension on UserType {
  String toValue() {
    switch (this) {
      case UserType.ssoUser:
        return 'SSO_USER';
      case UserType.ssoGroup:
        return 'SSO_GROUP';
    }
  }
}

extension UserTypeFromString on String {
  UserType toUserType() {
    switch (this) {
      case 'SSO_USER':
        return UserType.ssoUser;
      case 'SSO_GROUP':
        return UserType.ssoGroup;
    }
    throw Exception('$this is not known in enum UserType');
  }
}

/// The configuration settings for an Amazon VPC that contains data sources for
/// your Grafana workspace to connect to.
/// <note>
/// Provided <code>securityGroupIds</code> and <code>subnetIds</code> must be
/// part of the same VPC.
///
/// Connecting to a private VPC is not yet available in the Asia Pacific (Seoul)
/// Region (ap-northeast-2).
/// </note>
class VpcConfiguration {
  /// The list of Amazon EC2 security group IDs attached to the Amazon VPC for
  /// your Grafana workspace to connect. Duplicates not allowed.
  final List<String> securityGroupIds;

  /// The list of Amazon EC2 subnet IDs created in the Amazon VPC for your Grafana
  /// workspace to connect. Duplicates not allowed.
  final List<String> subnetIds;

  VpcConfiguration({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
    };
  }
}

/// A structure containing information about an Amazon Managed Grafana workspace
/// in your account.
class WorkspaceDescription {
  /// A structure that describes whether the workspace uses SAML, IAM Identity
  /// Center, or both methods for user authentication.
  final AuthenticationSummary authentication;

  /// The date that the workspace was created.
  final DateTime created;

  /// Specifies the Amazon Web Services data sources that have been configured to
  /// have IAM roles and permissions created to allow Amazon Managed Grafana to
  /// read data from these sources.
  ///
  /// This list is only used when the workspace was created through the Amazon Web
  /// Services console, and the <code>permissionType</code> is
  /// <code>SERVICE_MANAGED</code>.
  final List<DataSourceType> dataSources;

  /// The URL that users can use to access the Grafana console in the workspace.
  final String endpoint;

  /// The version of Grafana supported in this workspace.
  final String grafanaVersion;

  /// The unique ID of this workspace.
  final String id;

  /// The most recent date that the workspace was modified.
  final DateTime modified;

  /// The current status of the workspace.
  final WorkspaceStatus status;

  /// Specifies whether the workspace can access Amazon Web Services resources in
  /// this Amazon Web Services account only, or whether it can also access Amazon
  /// Web Services resources in other accounts in the same organization. If this
  /// is <code>ORGANIZATION</code>, the <code>workspaceOrganizationalUnits</code>
  /// parameter specifies which organizational units the workspace can access.
  final AccountAccessType? accountAccessType;

  /// The user-defined description of the workspace.
  final String? description;

  /// Specifies whether this workspace has already fully used its free trial for
  /// Grafana Enterprise.
  /// <note>
  /// Amazon Managed Grafana workspaces no longer support Grafana Enterprise free
  /// trials.
  /// </note>
  final bool? freeTrialConsumed;

  /// If this workspace is currently in the free trial period for Grafana
  /// Enterprise, this value specifies when that free trial ends.
  /// <note>
  /// Amazon Managed Grafana workspaces no longer support Grafana Enterprise free
  /// trials.
  /// </note>
  final DateTime? freeTrialExpiration;

  /// The token that ties this workspace to a Grafana Labs account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/upgrade-to-Grafana-Enterprise.html#AMG-workspace-register-enterprise">Link
  /// your account with Grafana Labs</a>.
  final String? grafanaToken;

  /// If this workspace has a full Grafana Enterprise license purchased through
  /// Amazon Web Services Marketplace, this specifies when the license ends and
  /// will need to be renewed. Purchasing the Enterprise plugins option through
  /// Amazon Managed Grafana does not have an expiration. It is valid until the
  /// license is removed.
  final DateTime? licenseExpiration;

  /// Specifies whether this workspace has a full Grafana Enterprise license.
  /// <note>
  /// Amazon Managed Grafana workspaces no longer support Grafana Enterprise free
  /// trials.
  /// </note>
  final LicenseType? licenseType;

  /// The name of the workspace.
  final String? name;

  /// The configuration settings for network access to your workspace.
  final NetworkAccessConfiguration? networkAccessControl;

  /// The Amazon Web Services notification channels that Amazon Managed Grafana
  /// can automatically create IAM roles and permissions for, to allow Amazon
  /// Managed Grafana to use these channels.
  final List<NotificationDestinationType>? notificationDestinations;

  /// The name of the IAM role that is used to access resources through
  /// Organizations.
  final String? organizationRoleName;

  /// Specifies the organizational units that this workspace is allowed to use
  /// data sources from, if this workspace is in an account that is part of an
  /// organization.
  final List<String>? organizationalUnits;

  /// If this is <code>SERVICE_MANAGED</code>, and the workplace was created
  /// through the Amazon Managed Grafana console, then Amazon Managed Grafana
  /// automatically creates the IAM roles and provisions the permissions that the
  /// workspace needs to use Amazon Web Services data sources and notification
  /// channels.
  ///
  /// If this is <code>CUSTOMER_MANAGED</code>, you must manage those roles and
  /// permissions yourself.
  ///
  /// If you are working with a workspace in a member account of an organization
  /// and that account is not a delegated administrator account, and you want the
  /// workspace to access data sources in other Amazon Web Services accounts in
  /// the organization, this parameter must be set to
  /// <code>CUSTOMER_MANAGED</code>.
  ///
  /// For more information about converting between customer and service managed,
  /// see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-datasource-and-notification.html">Managing
  /// permissions for data sources and notification channels</a>. For more
  /// information about the roles and permissions that must be managed for
  /// customer managed workspaces, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/AMG-manage-permissions.html">Amazon
  /// Managed Grafana permissions and policies for Amazon Web Services data
  /// sources and notification channels</a>
  final PermissionType? permissionType;

  /// The name of the CloudFormation stack set that is used to generate IAM roles
  /// to be used for this workspace.
  final String? stackSetName;

  /// The list of tags associated with the workspace.
  final Map<String, String>? tags;

  /// The configuration for connecting to data sources in a private VPC (Amazon
  /// Virtual Private Cloud).
  final VpcConfiguration? vpcConfiguration;

  /// The IAM role that grants permissions to the Amazon Web Services resources
  /// that the workspace will view data from. This role must already exist.
  final String? workspaceRoleArn;

  WorkspaceDescription({
    required this.authentication,
    required this.created,
    required this.dataSources,
    required this.endpoint,
    required this.grafanaVersion,
    required this.id,
    required this.modified,
    required this.status,
    this.accountAccessType,
    this.description,
    this.freeTrialConsumed,
    this.freeTrialExpiration,
    this.grafanaToken,
    this.licenseExpiration,
    this.licenseType,
    this.name,
    this.networkAccessControl,
    this.notificationDestinations,
    this.organizationRoleName,
    this.organizationalUnits,
    this.permissionType,
    this.stackSetName,
    this.tags,
    this.vpcConfiguration,
    this.workspaceRoleArn,
  });

  factory WorkspaceDescription.fromJson(Map<String, dynamic> json) {
    return WorkspaceDescription(
      authentication: AuthenticationSummary.fromJson(
          json['authentication'] as Map<String, dynamic>),
      created: nonNullableTimeStampFromJson(json['created'] as Object),
      dataSources: (json['dataSources'] as List)
          .whereNotNull()
          .map((e) => (e as String).toDataSourceType())
          .toList(),
      endpoint: json['endpoint'] as String,
      grafanaVersion: json['grafanaVersion'] as String,
      id: json['id'] as String,
      modified: nonNullableTimeStampFromJson(json['modified'] as Object),
      status: (json['status'] as String).toWorkspaceStatus(),
      accountAccessType:
          (json['accountAccessType'] as String?)?.toAccountAccessType(),
      description: json['description'] as String?,
      freeTrialConsumed: json['freeTrialConsumed'] as bool?,
      freeTrialExpiration: timeStampFromJson(json['freeTrialExpiration']),
      grafanaToken: json['grafanaToken'] as String?,
      licenseExpiration: timeStampFromJson(json['licenseExpiration']),
      licenseType: (json['licenseType'] as String?)?.toLicenseType(),
      name: json['name'] as String?,
      networkAccessControl: json['networkAccessControl'] != null
          ? NetworkAccessConfiguration.fromJson(
              json['networkAccessControl'] as Map<String, dynamic>)
          : null,
      notificationDestinations: (json['notificationDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNotificationDestinationType())
          .toList(),
      organizationRoleName: json['organizationRoleName'] as String?,
      organizationalUnits: (json['organizationalUnits'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      permissionType: (json['permissionType'] as String?)?.toPermissionType(),
      stackSetName: json['stackSetName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcConfiguration: json['vpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
      workspaceRoleArn: json['workspaceRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    final created = this.created;
    final dataSources = this.dataSources;
    final endpoint = this.endpoint;
    final grafanaVersion = this.grafanaVersion;
    final id = this.id;
    final modified = this.modified;
    final status = this.status;
    final accountAccessType = this.accountAccessType;
    final description = this.description;
    final freeTrialConsumed = this.freeTrialConsumed;
    final freeTrialExpiration = this.freeTrialExpiration;
    final grafanaToken = this.grafanaToken;
    final licenseExpiration = this.licenseExpiration;
    final licenseType = this.licenseType;
    final name = this.name;
    final networkAccessControl = this.networkAccessControl;
    final notificationDestinations = this.notificationDestinations;
    final organizationRoleName = this.organizationRoleName;
    final organizationalUnits = this.organizationalUnits;
    final permissionType = this.permissionType;
    final stackSetName = this.stackSetName;
    final tags = this.tags;
    final vpcConfiguration = this.vpcConfiguration;
    final workspaceRoleArn = this.workspaceRoleArn;
    return {
      'authentication': authentication,
      'created': unixTimestampToJson(created),
      'dataSources': dataSources.map((e) => e.toValue()).toList(),
      'endpoint': endpoint,
      'grafanaVersion': grafanaVersion,
      'id': id,
      'modified': unixTimestampToJson(modified),
      'status': status.toValue(),
      if (accountAccessType != null)
        'accountAccessType': accountAccessType.toValue(),
      if (description != null) 'description': description,
      if (freeTrialConsumed != null) 'freeTrialConsumed': freeTrialConsumed,
      if (freeTrialExpiration != null)
        'freeTrialExpiration': unixTimestampToJson(freeTrialExpiration),
      if (grafanaToken != null) 'grafanaToken': grafanaToken,
      if (licenseExpiration != null)
        'licenseExpiration': unixTimestampToJson(licenseExpiration),
      if (licenseType != null) 'licenseType': licenseType.toValue(),
      if (name != null) 'name': name,
      if (networkAccessControl != null)
        'networkAccessControl': networkAccessControl,
      if (notificationDestinations != null)
        'notificationDestinations':
            notificationDestinations.map((e) => e.toValue()).toList(),
      if (organizationRoleName != null)
        'organizationRoleName': organizationRoleName,
      if (organizationalUnits != null)
        'organizationalUnits': organizationalUnits,
      if (permissionType != null) 'permissionType': permissionType.toValue(),
      if (stackSetName != null) 'stackSetName': stackSetName,
      if (tags != null) 'tags': tags,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
      if (workspaceRoleArn != null) 'workspaceRoleArn': workspaceRoleArn,
    };
  }
}

enum WorkspaceStatus {
  active,
  creating,
  deleting,
  failed,
  updating,
  upgrading,
  deletionFailed,
  creationFailed,
  updateFailed,
  upgradeFailed,
  licenseRemovalFailed,
  versionUpdating,
  versionUpdateFailed,
}

extension WorkspaceStatusValueExtension on WorkspaceStatus {
  String toValue() {
    switch (this) {
      case WorkspaceStatus.active:
        return 'ACTIVE';
      case WorkspaceStatus.creating:
        return 'CREATING';
      case WorkspaceStatus.deleting:
        return 'DELETING';
      case WorkspaceStatus.failed:
        return 'FAILED';
      case WorkspaceStatus.updating:
        return 'UPDATING';
      case WorkspaceStatus.upgrading:
        return 'UPGRADING';
      case WorkspaceStatus.deletionFailed:
        return 'DELETION_FAILED';
      case WorkspaceStatus.creationFailed:
        return 'CREATION_FAILED';
      case WorkspaceStatus.updateFailed:
        return 'UPDATE_FAILED';
      case WorkspaceStatus.upgradeFailed:
        return 'UPGRADE_FAILED';
      case WorkspaceStatus.licenseRemovalFailed:
        return 'LICENSE_REMOVAL_FAILED';
      case WorkspaceStatus.versionUpdating:
        return 'VERSION_UPDATING';
      case WorkspaceStatus.versionUpdateFailed:
        return 'VERSION_UPDATE_FAILED';
    }
  }
}

extension WorkspaceStatusFromString on String {
  WorkspaceStatus toWorkspaceStatus() {
    switch (this) {
      case 'ACTIVE':
        return WorkspaceStatus.active;
      case 'CREATING':
        return WorkspaceStatus.creating;
      case 'DELETING':
        return WorkspaceStatus.deleting;
      case 'FAILED':
        return WorkspaceStatus.failed;
      case 'UPDATING':
        return WorkspaceStatus.updating;
      case 'UPGRADING':
        return WorkspaceStatus.upgrading;
      case 'DELETION_FAILED':
        return WorkspaceStatus.deletionFailed;
      case 'CREATION_FAILED':
        return WorkspaceStatus.creationFailed;
      case 'UPDATE_FAILED':
        return WorkspaceStatus.updateFailed;
      case 'UPGRADE_FAILED':
        return WorkspaceStatus.upgradeFailed;
      case 'LICENSE_REMOVAL_FAILED':
        return WorkspaceStatus.licenseRemovalFailed;
      case 'VERSION_UPDATING':
        return WorkspaceStatus.versionUpdating;
      case 'VERSION_UPDATE_FAILED':
        return WorkspaceStatus.versionUpdateFailed;
    }
    throw Exception('$this is not known in enum WorkspaceStatus');
  }
}

/// A structure that contains some information about one workspace in the
/// account.
class WorkspaceSummary {
  /// A structure containing information about the authentication methods used in
  /// the workspace.
  final AuthenticationSummary authentication;

  /// The date that the workspace was created.
  final DateTime created;

  /// The URL endpoint to use to access the Grafana console in the workspace.
  final String endpoint;

  /// The Grafana version that the workspace is running.
  final String grafanaVersion;

  /// The unique ID of the workspace.
  final String id;

  /// The most recent date that the workspace was modified.
  final DateTime modified;

  /// The current status of the workspace.
  final WorkspaceStatus status;

  /// The customer-entered description of the workspace.
  final String? description;

  /// The token that ties this workspace to a Grafana Labs account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/grafana/latest/userguide/upgrade-to-Grafana-Enterprise.html#AMG-workspace-register-enterprise">Link
  /// your account with Grafana Labs</a>.
  final String? grafanaToken;

  /// Specifies whether this workspace has a full Grafana Enterprise license.
  /// <note>
  /// Amazon Managed Grafana workspaces no longer support Grafana Enterprise free
  /// trials.
  /// </note>
  final LicenseType? licenseType;

  /// The name of the workspace.
  final String? name;

  /// The Amazon Web Services notification channels that Amazon Managed Grafana
  /// can automatically create IAM roles and permissions for, which allows Amazon
  /// Managed Grafana to use these channels.
  final List<NotificationDestinationType>? notificationDestinations;

  /// The list of tags associated with the workspace.
  final Map<String, String>? tags;

  WorkspaceSummary({
    required this.authentication,
    required this.created,
    required this.endpoint,
    required this.grafanaVersion,
    required this.id,
    required this.modified,
    required this.status,
    this.description,
    this.grafanaToken,
    this.licenseType,
    this.name,
    this.notificationDestinations,
    this.tags,
  });

  factory WorkspaceSummary.fromJson(Map<String, dynamic> json) {
    return WorkspaceSummary(
      authentication: AuthenticationSummary.fromJson(
          json['authentication'] as Map<String, dynamic>),
      created: nonNullableTimeStampFromJson(json['created'] as Object),
      endpoint: json['endpoint'] as String,
      grafanaVersion: json['grafanaVersion'] as String,
      id: json['id'] as String,
      modified: nonNullableTimeStampFromJson(json['modified'] as Object),
      status: (json['status'] as String).toWorkspaceStatus(),
      description: json['description'] as String?,
      grafanaToken: json['grafanaToken'] as String?,
      licenseType: (json['licenseType'] as String?)?.toLicenseType(),
      name: json['name'] as String?,
      notificationDestinations: (json['notificationDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNotificationDestinationType())
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    final created = this.created;
    final endpoint = this.endpoint;
    final grafanaVersion = this.grafanaVersion;
    final id = this.id;
    final modified = this.modified;
    final status = this.status;
    final description = this.description;
    final grafanaToken = this.grafanaToken;
    final licenseType = this.licenseType;
    final name = this.name;
    final notificationDestinations = this.notificationDestinations;
    final tags = this.tags;
    return {
      'authentication': authentication,
      'created': unixTimestampToJson(created),
      'endpoint': endpoint,
      'grafanaVersion': grafanaVersion,
      'id': id,
      'modified': unixTimestampToJson(modified),
      'status': status.toValue(),
      if (description != null) 'description': description,
      if (grafanaToken != null) 'grafanaToken': grafanaToken,
      if (licenseType != null) 'licenseType': licenseType.toValue(),
      if (name != null) 'name': name,
      if (notificationDestinations != null)
        'notificationDestinations':
            notificationDestinations.map((e) => e.toValue()).toList(),
      if (tags != null) 'tags': tags,
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
