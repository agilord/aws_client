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

/// You can use the Amazon Web Services Support App in Slack API to manage your
/// support cases in Slack for your Amazon Web Services account. After you
/// configure your Slack workspace and channel with the Amazon Web Services
/// Support App, you can perform the following tasks directly in your Slack
/// channel:
class SupportApp {
  final _s.RestJsonProtocol _protocol;
  SupportApp({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'supportapp',
            signingName: 'supportapp',
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

  /// Creates a Slack channel configuration for your Amazon Web Services
  /// account.
  /// <note>
  /// <ul>
  /// <li>
  /// You can add up to 5 Slack workspaces for your account.
  /// </li>
  /// <li>
  /// You can add up to 20 Slack channels for your account.
  /// </li>
  /// </ul> </note>
  /// A Slack channel can have up to 100 Amazon Web Services accounts. This
  /// means that only 100 accounts can add the same Slack channel to the Amazon
  /// Web Services Support App. We recommend that you only add the accounts that
  /// you need to manage support cases for your organization. This can reduce
  /// the notifications about case updates that you receive in the Slack
  /// channel.
  /// <note>
  /// We recommend that you choose a private Slack channel so that only members
  /// in that channel have read and write access to your support cases. Anyone
  /// in your Slack channel can create, update, or resolve support cases for
  /// your account. Users require an invitation to join private channels.
  /// </note>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelId] :
  /// The channel ID in Slack. This ID identifies a channel within a Slack
  /// workspace.
  ///
  /// Parameter [channelRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that you want to use to
  /// perform operations on Amazon Web Services. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/support-app-permissions.html">Managing
  /// access to the Amazon Web Services Support App</a> in the <i>Amazon Web
  /// Services Support User Guide</i>.
  ///
  /// Parameter [notifyOnCaseSeverity] :
  /// The case severity for a support case that you want to receive
  /// notifications.
  ///
  /// If you specify <code>high</code> or <code>all</code>, you must specify
  /// <code>true</code> for at least one of the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>notifyOnAddCorrespondenceToCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnCreateOrReopenCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnResolveCase</code>
  /// </li>
  /// </ul>
  /// If you specify <code>none</code>, the following parameters must be null or
  /// <code>false</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>notifyOnAddCorrespondenceToCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnCreateOrReopenCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnResolveCase</code>
  /// </li>
  /// </ul> <note>
  /// If you don't specify these parameters in your request, they default to
  /// <code>false</code>.
  /// </note>
  ///
  /// Parameter [teamId] :
  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such
  /// as <code>T012ABCDEFG</code>.
  ///
  /// Parameter [channelName] :
  /// The name of the Slack channel that you configure for the Amazon Web
  /// Services Support App.
  ///
  /// Parameter [notifyOnAddCorrespondenceToCase] :
  /// Whether you want to get notified when a support case has a new
  /// correspondence.
  ///
  /// Parameter [notifyOnCreateOrReopenCase] :
  /// Whether you want to get notified when a support case is created or
  /// reopened.
  ///
  /// Parameter [notifyOnResolveCase] :
  /// Whether you want to get notified when a support case is resolved.
  Future<void> createSlackChannelConfiguration({
    required String channelId,
    required String channelRoleArn,
    required NotificationSeverityLevel notifyOnCaseSeverity,
    required String teamId,
    String? channelName,
    bool? notifyOnAddCorrespondenceToCase,
    bool? notifyOnCreateOrReopenCase,
    bool? notifyOnResolveCase,
  }) async {
    final $payload = <String, dynamic>{
      'channelId': channelId,
      'channelRoleArn': channelRoleArn,
      'notifyOnCaseSeverity': notifyOnCaseSeverity.toValue(),
      'teamId': teamId,
      if (channelName != null) 'channelName': channelName,
      if (notifyOnAddCorrespondenceToCase != null)
        'notifyOnAddCorrespondenceToCase': notifyOnAddCorrespondenceToCase,
      if (notifyOnCreateOrReopenCase != null)
        'notifyOnCreateOrReopenCase': notifyOnCreateOrReopenCase,
      if (notifyOnResolveCase != null)
        'notifyOnResolveCase': notifyOnResolveCase,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/create-slack-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an alias for an Amazon Web Services account ID. The alias appears
  /// in the Amazon Web Services Support App page of the Amazon Web Services
  /// Support Center. The alias also appears in Slack messages from the Amazon
  /// Web Services Support App.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<void> deleteAccountAlias() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/control/delete-account-alias',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Slack channel configuration from your Amazon Web Services
  /// account. This operation doesn't delete your Slack channel.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelId] :
  /// The channel ID in Slack. This ID identifies a channel within a Slack
  /// workspace.
  ///
  /// Parameter [teamId] :
  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such
  /// as <code>T012ABCDEFG</code>.
  Future<void> deleteSlackChannelConfiguration({
    required String channelId,
    required String teamId,
  }) async {
    final $payload = <String, dynamic>{
      'channelId': channelId,
      'teamId': teamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/delete-slack-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Slack workspace configuration from your Amazon Web Services
  /// account. This operation doesn't delete your Slack workspace.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [teamId] :
  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such
  /// as <code>T012ABCDEFG</code>.
  Future<void> deleteSlackWorkspaceConfiguration({
    required String teamId,
  }) async {
    final $payload = <String, dynamic>{
      'teamId': teamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/delete-slack-workspace-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the alias from an Amazon Web Services account ID. The alias
  /// appears in the Amazon Web Services Support App page of the Amazon Web
  /// Services Support Center. The alias also appears in Slack messages from the
  /// Amazon Web Services Support App.
  ///
  /// May throw [InternalServerException].
  Future<GetAccountAliasResult> getAccountAlias() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/control/get-account-alias',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountAliasResult.fromJson(response);
  }

  /// Lists the Slack channel configurations for an Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, the API only returns a portion of
  /// the results and includes a <code>nextToken</code> pagination token in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When the API returns the last set
  /// of results, the response doesn't include a pagination token value.
  Future<ListSlackChannelConfigurationsResult> listSlackChannelConfigurations({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/list-slack-channel-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListSlackChannelConfigurationsResult.fromJson(response);
  }

  /// Lists the Slack workspace configurations for an Amazon Web Services
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [nextToken] :
  /// If the results of a search are large, the API only returns a portion of
  /// the results and includes a <code>nextToken</code> pagination token in the
  /// response. To retrieve the next batch of results, reissue the search
  /// request and include the returned token. When the API returns the last set
  /// of results, the response doesn't include a pagination token value.
  Future<ListSlackWorkspaceConfigurationsResult>
      listSlackWorkspaceConfigurations({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/list-slack-workspace-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListSlackWorkspaceConfigurationsResult.fromJson(response);
  }

  /// Creates or updates an individual alias for each Amazon Web Services
  /// account ID. The alias appears in the Amazon Web Services Support App page
  /// of the Amazon Web Services Support Center. The alias also appears in Slack
  /// messages from the Amazon Web Services Support App.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountAlias] :
  /// An alias or short name for an Amazon Web Services account.
  Future<void> putAccountAlias({
    required String accountAlias,
  }) async {
    final $payload = <String, dynamic>{
      'accountAlias': accountAlias,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/put-account-alias',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Registers a Slack workspace for your Amazon Web Services account. To call
  /// this API, your account must be part of an organization in Organizations.
  ///
  /// If you're the <i>management account</i> and you want to register Slack
  /// workspaces for your organization, you must complete the following tasks:
  /// <ol>
  /// <li>
  /// Sign in to the <a href="https://console.aws.amazon.com/support/app">Amazon
  /// Web Services Support Center</a> and authorize the Slack workspaces where
  /// you want your organization to have access to. See <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/authorize-slack-workspace.html">Authorize
  /// a Slack workspace</a> in the <i>Amazon Web Services Support User
  /// Guide</i>.
  /// </li>
  /// <li>
  /// Call the <code>RegisterSlackWorkspaceForOrganization</code> API to
  /// authorize each Slack workspace for the organization.
  /// </li> </ol>
  /// After the management account authorizes the Slack workspace, member
  /// accounts can call this API to authorize the same Slack workspace for their
  /// individual accounts. Member accounts don't need to authorize the Slack
  /// workspace manually through the <a
  /// href="https://console.aws.amazon.com/support/app">Amazon Web Services
  /// Support Center</a>.
  ///
  /// To use the Amazon Web Services Support App, each account must then
  /// complete the following tasks:
  ///
  /// <ul>
  /// <li>
  /// Create an Identity and Access Management (IAM) role with the required
  /// permission. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/support-app-permissions.html">Managing
  /// access to the Amazon Web Services Support App</a>.
  /// </li>
  /// <li>
  /// Configure a Slack channel to use the Amazon Web Services Support App for
  /// support cases for that account. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/add-your-slack-channel.html">Configuring
  /// a Slack channel</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [teamId] :
  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such
  /// as <code>T012ABCDEFG</code>. Specify the Slack workspace that you want to
  /// use for your organization.
  Future<RegisterSlackWorkspaceForOrganizationResult>
      registerSlackWorkspaceForOrganization({
    required String teamId,
  }) async {
    final $payload = <String, dynamic>{
      'teamId': teamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/register-slack-workspace-for-organization',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterSlackWorkspaceForOrganizationResult.fromJson(response);
  }

  /// Updates the configuration for a Slack channel, such as case update
  /// notifications.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelId] :
  /// The channel ID in Slack. This ID identifies a channel within a Slack
  /// workspace.
  ///
  /// Parameter [teamId] :
  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such
  /// as <code>T012ABCDEFG</code>.
  ///
  /// Parameter [channelName] :
  /// The Slack channel name that you want to update.
  ///
  /// Parameter [channelRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that you want to use to
  /// perform operations on Amazon Web Services. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/support-app-permissions.html">Managing
  /// access to the Amazon Web Services Support App</a> in the <i>Amazon Web
  /// Services Support User Guide</i>.
  ///
  /// Parameter [notifyOnAddCorrespondenceToCase] :
  /// Whether you want to get notified when a support case has a new
  /// correspondence.
  ///
  /// Parameter [notifyOnCaseSeverity] :
  /// The case severity for a support case that you want to receive
  /// notifications.
  ///
  /// If you specify <code>high</code> or <code>all</code>, at least one of the
  /// following parameters must be <code>true</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>notifyOnAddCorrespondenceToCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnCreateOrReopenCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnResolveCase</code>
  /// </li>
  /// </ul>
  /// If you specify <code>none</code>, any of the following parameters that you
  /// specify in your request must be <code>false</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>notifyOnAddCorrespondenceToCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnCreateOrReopenCase</code>
  /// </li>
  /// <li>
  /// <code>notifyOnResolveCase</code>
  /// </li>
  /// </ul> <note>
  /// If you don't specify these parameters in your request, the Amazon Web
  /// Services Support App uses the current values by default.
  /// </note>
  ///
  /// Parameter [notifyOnCreateOrReopenCase] :
  /// Whether you want to get notified when a support case is created or
  /// reopened.
  ///
  /// Parameter [notifyOnResolveCase] :
  /// Whether you want to get notified when a support case is resolved.
  Future<UpdateSlackChannelConfigurationResult>
      updateSlackChannelConfiguration({
    required String channelId,
    required String teamId,
    String? channelName,
    String? channelRoleArn,
    bool? notifyOnAddCorrespondenceToCase,
    NotificationSeverityLevel? notifyOnCaseSeverity,
    bool? notifyOnCreateOrReopenCase,
    bool? notifyOnResolveCase,
  }) async {
    final $payload = <String, dynamic>{
      'channelId': channelId,
      'teamId': teamId,
      if (channelName != null) 'channelName': channelName,
      if (channelRoleArn != null) 'channelRoleArn': channelRoleArn,
      if (notifyOnAddCorrespondenceToCase != null)
        'notifyOnAddCorrespondenceToCase': notifyOnAddCorrespondenceToCase,
      if (notifyOnCaseSeverity != null)
        'notifyOnCaseSeverity': notifyOnCaseSeverity.toValue(),
      if (notifyOnCreateOrReopenCase != null)
        'notifyOnCreateOrReopenCase': notifyOnCreateOrReopenCase,
      if (notifyOnResolveCase != null)
        'notifyOnResolveCase': notifyOnResolveCase,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/control/update-slack-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSlackChannelConfigurationResult.fromJson(response);
  }
}

enum AccountType {
  management,
  member,
}

extension AccountTypeValueExtension on AccountType {
  String toValue() {
    switch (this) {
      case AccountType.management:
        return 'management';
      case AccountType.member:
        return 'member';
    }
  }
}

extension AccountTypeFromString on String {
  AccountType toAccountType() {
    switch (this) {
      case 'management':
        return AccountType.management;
      case 'member':
        return AccountType.member;
    }
    throw Exception('$this is not known in enum AccountType');
  }
}

class CreateSlackChannelConfigurationResult {
  CreateSlackChannelConfigurationResult();

  factory CreateSlackChannelConfigurationResult.fromJson(
      Map<String, dynamic> _) {
    return CreateSlackChannelConfigurationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAccountAliasResult {
  DeleteAccountAliasResult();

  factory DeleteAccountAliasResult.fromJson(Map<String, dynamic> _) {
    return DeleteAccountAliasResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSlackChannelConfigurationResult {
  DeleteSlackChannelConfigurationResult();

  factory DeleteSlackChannelConfigurationResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteSlackChannelConfigurationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSlackWorkspaceConfigurationResult {
  DeleteSlackWorkspaceConfigurationResult();

  factory DeleteSlackWorkspaceConfigurationResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteSlackWorkspaceConfigurationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAccountAliasResult {
  /// An alias or short name for an Amazon Web Services account.
  final String? accountAlias;

  GetAccountAliasResult({
    this.accountAlias,
  });

  factory GetAccountAliasResult.fromJson(Map<String, dynamic> json) {
    return GetAccountAliasResult(
      accountAlias: json['accountAlias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAlias = this.accountAlias;
    return {
      if (accountAlias != null) 'accountAlias': accountAlias,
    };
  }
}

class ListSlackChannelConfigurationsResult {
  /// The configurations for a Slack channel.
  final List<SlackChannelConfiguration> slackChannelConfigurations;

  /// The point where pagination should resume when the response returns only
  /// partial results.
  final String? nextToken;

  ListSlackChannelConfigurationsResult({
    required this.slackChannelConfigurations,
    this.nextToken,
  });

  factory ListSlackChannelConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return ListSlackChannelConfigurationsResult(
      slackChannelConfigurations: (json['slackChannelConfigurations'] as List)
          .whereNotNull()
          .map((e) =>
              SlackChannelConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final slackChannelConfigurations = this.slackChannelConfigurations;
    final nextToken = this.nextToken;
    return {
      'slackChannelConfigurations': slackChannelConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSlackWorkspaceConfigurationsResult {
  /// The point where pagination should resume when the response returns only
  /// partial results.
  final String? nextToken;

  /// The configurations for a Slack workspace.
  final List<SlackWorkspaceConfiguration>? slackWorkspaceConfigurations;

  ListSlackWorkspaceConfigurationsResult({
    this.nextToken,
    this.slackWorkspaceConfigurations,
  });

  factory ListSlackWorkspaceConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return ListSlackWorkspaceConfigurationsResult(
      nextToken: json['nextToken'] as String?,
      slackWorkspaceConfigurations: (json['slackWorkspaceConfigurations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              SlackWorkspaceConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slackWorkspaceConfigurations = this.slackWorkspaceConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (slackWorkspaceConfigurations != null)
        'slackWorkspaceConfigurations': slackWorkspaceConfigurations,
    };
  }
}

enum NotificationSeverityLevel {
  none,
  all,
  high,
}

extension NotificationSeverityLevelValueExtension on NotificationSeverityLevel {
  String toValue() {
    switch (this) {
      case NotificationSeverityLevel.none:
        return 'none';
      case NotificationSeverityLevel.all:
        return 'all';
      case NotificationSeverityLevel.high:
        return 'high';
    }
  }
}

extension NotificationSeverityLevelFromString on String {
  NotificationSeverityLevel toNotificationSeverityLevel() {
    switch (this) {
      case 'none':
        return NotificationSeverityLevel.none;
      case 'all':
        return NotificationSeverityLevel.all;
      case 'high':
        return NotificationSeverityLevel.high;
    }
    throw Exception('$this is not known in enum NotificationSeverityLevel');
  }
}

class PutAccountAliasResult {
  PutAccountAliasResult();

  factory PutAccountAliasResult.fromJson(Map<String, dynamic> _) {
    return PutAccountAliasResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegisterSlackWorkspaceForOrganizationResult {
  /// Whether the Amazon Web Services account is a management or member account
  /// that's part of an organization in Organizations.
  final AccountType? accountType;

  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such as
  /// <code>T012ABCDEFG</code>.
  final String? teamId;

  /// The name of the Slack workspace.
  final String? teamName;

  RegisterSlackWorkspaceForOrganizationResult({
    this.accountType,
    this.teamId,
    this.teamName,
  });

  factory RegisterSlackWorkspaceForOrganizationResult.fromJson(
      Map<String, dynamic> json) {
    return RegisterSlackWorkspaceForOrganizationResult(
      accountType: (json['accountType'] as String?)?.toAccountType(),
      teamId: json['teamId'] as String?,
      teamName: json['teamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountType = this.accountType;
    final teamId = this.teamId;
    final teamName = this.teamName;
    return {
      if (accountType != null) 'accountType': accountType.toValue(),
      if (teamId != null) 'teamId': teamId,
      if (teamName != null) 'teamName': teamName,
    };
  }
}

/// The configuration for a Slack channel that you added for your Amazon Web
/// Services account.
class SlackChannelConfiguration {
  /// The channel ID in Slack. This ID identifies a channel within a Slack
  /// workspace.
  final String channelId;

  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such as
  /// <code>T012ABCDEFG</code>.
  final String teamId;

  /// The name of the Slack channel that you configured with the Amazon Web
  /// Services Support App for your Amazon Web Services account.
  final String? channelName;

  /// The Amazon Resource Name (ARN) of an IAM role that you want to use to
  /// perform operations on Amazon Web Services. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/support-app-permissions.html">Managing
  /// access to the Amazon Web Services Support App</a> in the <i>Amazon Web
  /// Services Support User Guide</i>.
  final String? channelRoleArn;

  /// Whether you want to get notified when a support case has a new
  /// correspondence.
  final bool? notifyOnAddCorrespondenceToCase;

  /// The case severity for a support case that you want to receive notifications.
  final NotificationSeverityLevel? notifyOnCaseSeverity;

  /// Whether you want to get notified when a support case is created or reopened.
  final bool? notifyOnCreateOrReopenCase;

  /// Whether you want to get notified when a support case is resolved.
  final bool? notifyOnResolveCase;

  SlackChannelConfiguration({
    required this.channelId,
    required this.teamId,
    this.channelName,
    this.channelRoleArn,
    this.notifyOnAddCorrespondenceToCase,
    this.notifyOnCaseSeverity,
    this.notifyOnCreateOrReopenCase,
    this.notifyOnResolveCase,
  });

  factory SlackChannelConfiguration.fromJson(Map<String, dynamic> json) {
    return SlackChannelConfiguration(
      channelId: json['channelId'] as String,
      teamId: json['teamId'] as String,
      channelName: json['channelName'] as String?,
      channelRoleArn: json['channelRoleArn'] as String?,
      notifyOnAddCorrespondenceToCase:
          json['notifyOnAddCorrespondenceToCase'] as bool?,
      notifyOnCaseSeverity: (json['notifyOnCaseSeverity'] as String?)
          ?.toNotificationSeverityLevel(),
      notifyOnCreateOrReopenCase: json['notifyOnCreateOrReopenCase'] as bool?,
      notifyOnResolveCase: json['notifyOnResolveCase'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final teamId = this.teamId;
    final channelName = this.channelName;
    final channelRoleArn = this.channelRoleArn;
    final notifyOnAddCorrespondenceToCase =
        this.notifyOnAddCorrespondenceToCase;
    final notifyOnCaseSeverity = this.notifyOnCaseSeverity;
    final notifyOnCreateOrReopenCase = this.notifyOnCreateOrReopenCase;
    final notifyOnResolveCase = this.notifyOnResolveCase;
    return {
      'channelId': channelId,
      'teamId': teamId,
      if (channelName != null) 'channelName': channelName,
      if (channelRoleArn != null) 'channelRoleArn': channelRoleArn,
      if (notifyOnAddCorrespondenceToCase != null)
        'notifyOnAddCorrespondenceToCase': notifyOnAddCorrespondenceToCase,
      if (notifyOnCaseSeverity != null)
        'notifyOnCaseSeverity': notifyOnCaseSeverity.toValue(),
      if (notifyOnCreateOrReopenCase != null)
        'notifyOnCreateOrReopenCase': notifyOnCreateOrReopenCase,
      if (notifyOnResolveCase != null)
        'notifyOnResolveCase': notifyOnResolveCase,
    };
  }
}

/// The configuration for a Slack workspace that you added to an Amazon Web
/// Services account.
class SlackWorkspaceConfiguration {
  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such as
  /// <code>T012ABCDEFG</code>.
  final String teamId;

  /// Whether to allow member accounts to authorize Slack workspaces. Member
  /// accounts must be part of an organization in Organizations.
  final bool? allowOrganizationMemberAccount;

  /// The name of the Slack workspace.
  final String? teamName;

  SlackWorkspaceConfiguration({
    required this.teamId,
    this.allowOrganizationMemberAccount,
    this.teamName,
  });

  factory SlackWorkspaceConfiguration.fromJson(Map<String, dynamic> json) {
    return SlackWorkspaceConfiguration(
      teamId: json['teamId'] as String,
      allowOrganizationMemberAccount:
          json['allowOrganizationMemberAccount'] as bool?,
      teamName: json['teamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final teamId = this.teamId;
    final allowOrganizationMemberAccount = this.allowOrganizationMemberAccount;
    final teamName = this.teamName;
    return {
      'teamId': teamId,
      if (allowOrganizationMemberAccount != null)
        'allowOrganizationMemberAccount': allowOrganizationMemberAccount,
      if (teamName != null) 'teamName': teamName,
    };
  }
}

class UpdateSlackChannelConfigurationResult {
  /// The channel ID in Slack. This ID identifies a channel within a Slack
  /// workspace.
  final String? channelId;

  /// The name of the Slack channel that you configure for the Amazon Web Services
  /// Support App.
  final String? channelName;

  /// The Amazon Resource Name (ARN) of an IAM role that you want to use to
  /// perform operations on Amazon Web Services. For more information, see <a
  /// href="https://docs.aws.amazon.com/awssupport/latest/user/support-app-permissions.html">Managing
  /// access to the Amazon Web Services Support App</a> in the <i>Amazon Web
  /// Services Support User Guide</i>.
  final String? channelRoleArn;

  /// Whether you want to get notified when a support case has a new
  /// correspondence.
  final bool? notifyOnAddCorrespondenceToCase;

  /// The case severity for a support case that you want to receive notifications.
  final NotificationSeverityLevel? notifyOnCaseSeverity;

  /// Whether you want to get notified when a support case is created or reopened.
  final bool? notifyOnCreateOrReopenCase;

  /// Whether you want to get notified when a support case is resolved.
  final bool? notifyOnResolveCase;

  /// The team ID in Slack. This ID uniquely identifies a Slack workspace, such as
  /// <code>T012ABCDEFG</code>.
  final String? teamId;

  UpdateSlackChannelConfigurationResult({
    this.channelId,
    this.channelName,
    this.channelRoleArn,
    this.notifyOnAddCorrespondenceToCase,
    this.notifyOnCaseSeverity,
    this.notifyOnCreateOrReopenCase,
    this.notifyOnResolveCase,
    this.teamId,
  });

  factory UpdateSlackChannelConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateSlackChannelConfigurationResult(
      channelId: json['channelId'] as String?,
      channelName: json['channelName'] as String?,
      channelRoleArn: json['channelRoleArn'] as String?,
      notifyOnAddCorrespondenceToCase:
          json['notifyOnAddCorrespondenceToCase'] as bool?,
      notifyOnCaseSeverity: (json['notifyOnCaseSeverity'] as String?)
          ?.toNotificationSeverityLevel(),
      notifyOnCreateOrReopenCase: json['notifyOnCreateOrReopenCase'] as bool?,
      notifyOnResolveCase: json['notifyOnResolveCase'] as bool?,
      teamId: json['teamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final channelName = this.channelName;
    final channelRoleArn = this.channelRoleArn;
    final notifyOnAddCorrespondenceToCase =
        this.notifyOnAddCorrespondenceToCase;
    final notifyOnCaseSeverity = this.notifyOnCaseSeverity;
    final notifyOnCreateOrReopenCase = this.notifyOnCreateOrReopenCase;
    final notifyOnResolveCase = this.notifyOnResolveCase;
    final teamId = this.teamId;
    return {
      if (channelId != null) 'channelId': channelId,
      if (channelName != null) 'channelName': channelName,
      if (channelRoleArn != null) 'channelRoleArn': channelRoleArn,
      if (notifyOnAddCorrespondenceToCase != null)
        'notifyOnAddCorrespondenceToCase': notifyOnAddCorrespondenceToCase,
      if (notifyOnCaseSeverity != null)
        'notifyOnCaseSeverity': notifyOnCaseSeverity.toValue(),
      if (notifyOnCreateOrReopenCase != null)
        'notifyOnCreateOrReopenCase': notifyOnCreateOrReopenCase,
      if (notifyOnResolveCase != null)
        'notifyOnResolveCase': notifyOnResolveCase,
      if (teamId != null) 'teamId': teamId,
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
