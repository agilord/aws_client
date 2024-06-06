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

/// AWS Chatbot API
class Chatbot {
  final _s.RestJsonProtocol _protocol;
  Chatbot({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'chatbot',
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

  /// Creates Chime Webhook Configuration
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [CreateChimeWebhookConfigurationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [configurationName] :
  /// The name of the configuration.
  ///
  /// Parameter [iamRoleArn] :
  /// This is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS
  /// Chatbot.
  ///
  /// Parameter [snsTopicArns] :
  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  ///
  /// Parameter [webhookDescription] :
  /// Description of the webhook. Recommend using the convention
  /// `RoomName/WebhookName`. See Chime setup tutorial for more details:
  /// https://docs.aws.amazon.com/chatbot/latest/adminguide/chime-setup.html.
  ///
  /// Parameter [webhookUrl] :
  /// URL for the Chime webhook.
  ///
  /// Parameter [loggingLevel] :
  /// Logging levels include ERROR, INFO, or NONE.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the configuration.
  Future<CreateChimeWebhookConfigurationResult>
      createChimeWebhookConfiguration({
    required String configurationName,
    required String iamRoleArn,
    required List<String> snsTopicArns,
    required String webhookDescription,
    required String webhookUrl,
    String? loggingLevel,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConfigurationName': configurationName,
      'IamRoleArn': iamRoleArn,
      'SnsTopicArns': snsTopicArns,
      'WebhookDescription': webhookDescription,
      'WebhookUrl': webhookUrl,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-chime-webhook-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChimeWebhookConfigurationResult.fromJson(response);
  }

  /// Creates MS Teams Channel Configuration
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [CreateTeamsChannelConfigurationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelId] :
  /// The ID of the Microsoft Teams channel.
  ///
  /// Parameter [configurationName] :
  /// The name of the configuration.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS
  /// Chatbot.
  ///
  /// Parameter [teamId] :
  /// The ID of the Microsoft Team authorized with AWS Chatbot. To get the team
  /// ID, you must perform the initial authorization flow with Microsoft Teams
  /// in the AWS Chatbot console. Then you can copy and paste the team ID from
  /// the console. For more details, see steps 1-4 in Get started with Microsoft
  /// Teams in the AWS Chatbot Administrator Guide.
  ///
  /// Parameter [tenantId] :
  /// The ID of the Microsoft Teams tenant.
  ///
  /// Parameter [channelName] :
  /// The name of the Microsoft Teams channel.
  ///
  /// Parameter [guardrailPolicyArns] :
  /// The list of IAM policy ARNs that are applied as channel guardrails. The
  /// AWS managed 'AdministratorAccess' policy is applied by default if this is
  /// not set.
  ///
  /// Parameter [loggingLevel] :
  /// Logging levels include ERROR, INFO, or NONE.
  ///
  /// Parameter [snsTopicArns] :
  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the configuration.
  ///
  /// Parameter [teamName] :
  /// The name of the Microsoft Teams Team.
  ///
  /// Parameter [userAuthorizationRequired] :
  /// Enables use of a user role requirement in your chat configuration.
  Future<CreateTeamsChannelConfigurationResult>
      createMicrosoftTeamsChannelConfiguration({
    required String channelId,
    required String configurationName,
    required String iamRoleArn,
    required String teamId,
    required String tenantId,
    String? channelName,
    List<String>? guardrailPolicyArns,
    String? loggingLevel,
    List<String>? snsTopicArns,
    List<Tag>? tags,
    String? teamName,
    bool? userAuthorizationRequired,
  }) async {
    final $payload = <String, dynamic>{
      'ChannelId': channelId,
      'ConfigurationName': configurationName,
      'IamRoleArn': iamRoleArn,
      'TeamId': teamId,
      'TenantId': tenantId,
      if (channelName != null) 'ChannelName': channelName,
      if (guardrailPolicyArns != null)
        'GuardrailPolicyArns': guardrailPolicyArns,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (snsTopicArns != null) 'SnsTopicArns': snsTopicArns,
      if (tags != null) 'Tags': tags,
      if (teamName != null) 'TeamName': teamName,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-ms-teams-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTeamsChannelConfigurationResult.fromJson(response);
  }

  /// Creates Slack Channel Configuration
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [CreateSlackChannelConfigurationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [configurationName] :
  /// The name of the configuration.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS
  /// Chatbot.
  ///
  /// Parameter [slackChannelId] :
  /// The ID of the Slack channel. To get the ID, open Slack, right click on the
  /// channel name in the left pane, then choose Copy Link. The channel ID is
  /// the 9-character string at the end of the URL. For example, ABCBBLZZZ.
  ///
  /// Parameter [slackTeamId] :
  /// The ID of the Slack workspace authorized with AWS Chatbot.
  ///
  /// Parameter [guardrailPolicyArns] :
  /// The list of IAM policy ARNs that are applied as channel guardrails. The
  /// AWS managed 'AdministratorAccess' policy is applied by default if this is
  /// not set.
  ///
  /// Parameter [loggingLevel] :
  /// Logging levels include ERROR, INFO, or NONE.
  ///
  /// Parameter [slackChannelName] :
  /// The name of the Slack Channel.
  ///
  /// Parameter [snsTopicArns] :
  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the configuration.
  ///
  /// Parameter [userAuthorizationRequired] :
  /// Enables use of a user role requirement in your chat configuration.
  Future<CreateSlackChannelConfigurationResult>
      createSlackChannelConfiguration({
    required String configurationName,
    required String iamRoleArn,
    required String slackChannelId,
    required String slackTeamId,
    List<String>? guardrailPolicyArns,
    String? loggingLevel,
    String? slackChannelName,
    List<String>? snsTopicArns,
    List<Tag>? tags,
    bool? userAuthorizationRequired,
  }) async {
    final $payload = <String, dynamic>{
      'ConfigurationName': configurationName,
      'IamRoleArn': iamRoleArn,
      'SlackChannelId': slackChannelId,
      'SlackTeamId': slackTeamId,
      if (guardrailPolicyArns != null)
        'GuardrailPolicyArns': guardrailPolicyArns,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (slackChannelName != null) 'SlackChannelName': slackChannelName,
      if (snsTopicArns != null) 'SnsTopicArns': snsTopicArns,
      if (tags != null) 'Tags': tags,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-slack-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSlackChannelConfigurationResult.fromJson(response);
  }

  /// Deletes a Chime Webhook Configuration
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DeleteChimeWebhookConfigurationException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the ChimeWebhookConfiguration to delete.
  Future<void> deleteChimeWebhookConfiguration({
    required String chatConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-chime-webhook-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes MS Teams Channel Configuration
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DeleteTeamsChannelConfigurationException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the MicrosoftTeamsChannelConfiguration to delete.
  Future<void> deleteMicrosoftTeamsChannelConfiguration({
    required String chatConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-ms-teams-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Microsoft Teams team authorization allowing for channels to be
  /// configured in that Microsoft Teams team. Note that the Microsoft Teams
  /// team must have no channels configured to remove it.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DeleteTeamsConfiguredTeamException].
  ///
  /// Parameter [teamId] :
  /// The ID of the Microsoft Team authorized with AWS Chatbot. To get the team
  /// ID, you must perform the initial authorization flow with Microsoft Teams
  /// in the AWS Chatbot console. Then you can copy and paste the team ID from
  /// the console. For more details, see steps 1-4 in Get started with Microsoft
  /// Teams in the AWS Chatbot Administrator Guide.
  Future<void> deleteMicrosoftTeamsConfiguredTeam({
    required String teamId,
  }) async {
    final $payload = <String, dynamic>{
      'TeamId': teamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-ms-teams-configured-teams',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Teams user identity
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DeleteMicrosoftTeamsUserIdentityException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the MicrosoftTeamsChannelConfiguration associated with the user
  /// identity to delete.
  ///
  /// Parameter [userId] :
  /// Id from Microsoft Teams for user.
  Future<void> deleteMicrosoftTeamsUserIdentity({
    required String chatConfigurationArn,
    required String userId,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
      'UserId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-ms-teams-user-identity',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes Slack Channel Configuration
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DeleteSlackChannelConfigurationException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the SlackChannelConfiguration to delete.
  Future<void> deleteSlackChannelConfiguration({
    required String chatConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-slack-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Slack user identity
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DeleteSlackUserIdentityException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the SlackChannelConfiguration associated with the user identity
  /// to delete.
  ///
  /// Parameter [slackTeamId] :
  /// The ID of the Slack workspace authorized with AWS Chatbot.
  ///
  /// Parameter [slackUserId] :
  /// The ID of the user in Slack.
  Future<void> deleteSlackUserIdentity({
    required String chatConfigurationArn,
    required String slackTeamId,
    required String slackUserId,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
      'SlackTeamId': slackTeamId,
      'SlackUserId': slackUserId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-slack-user-identity',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the Slack workspace authorization that allows channels to be
  /// configured in that workspace. This requires all configured channels in the
  /// workspace to be deleted.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DeleteSlackWorkspaceAuthorizationFault].
  ///
  /// Parameter [slackTeamId] :
  /// The ID of the Slack workspace authorized with AWS Chatbot.
  Future<void> deleteSlackWorkspaceAuthorization({
    required String slackTeamId,
  }) async {
    final $payload = <String, dynamic>{
      'SlackTeamId': slackTeamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-slack-workspace-authorization',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists Chime Webhook Configurations optionally filtered by
  /// ChatConfigurationArn
  ///
  /// May throw [DescribeChimeWebhookConfigurationsException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// An optional ARN of a ChimeWebhookConfiguration to describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<DescribeChimeWebhookConfigurationsResult>
      describeChimeWebhookConfigurations({
    String? chatConfigurationArn,
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
      if (chatConfigurationArn != null)
        'ChatConfigurationArn': chatConfigurationArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-chime-webhook-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChimeWebhookConfigurationsResult.fromJson(response);
  }

  /// Lists Slack Channel Configurations optionally filtered by
  /// ChatConfigurationArn
  ///
  /// May throw [DescribeSlackChannelConfigurationsException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// An optional ARN of a SlackChannelConfiguration to describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<DescribeSlackChannelConfigurationsResult>
      describeSlackChannelConfigurations({
    String? chatConfigurationArn,
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
      if (chatConfigurationArn != null)
        'ChatConfigurationArn': chatConfigurationArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-slack-channel-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSlackChannelConfigurationsResult.fromJson(response);
  }

  /// Lists all Slack user identities with a mapped role.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DescribeSlackUserIdentitiesException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the SlackChannelConfiguration associated with the user
  /// identities to describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<DescribeSlackUserIdentitiesResult> describeSlackUserIdentities({
    String? chatConfigurationArn,
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
      if (chatConfigurationArn != null)
        'ChatConfigurationArn': chatConfigurationArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-slack-user-identities',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSlackUserIdentitiesResult.fromJson(response);
  }

  /// Lists all authorized Slack Workspaces for AWS Account
  ///
  /// May throw [DescribeSlackWorkspacesException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<DescribeSlackWorkspacesResult> describeSlackWorkspaces({
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-slack-workspaces',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSlackWorkspacesResult.fromJson(response);
  }

  /// Get Chatbot account level preferences
  ///
  /// May throw [GetAccountPreferencesException].
  /// May throw [InvalidRequestException].
  Future<GetAccountPreferencesResult> getAccountPreferences() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/get-account-preferences',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountPreferencesResult.fromJson(response);
  }

  /// Get a single MS Teams Channel Configurations
  ///
  /// May throw [GetTeamsChannelConfigurationException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the MicrosoftTeamsChannelConfiguration to retrieve.
  Future<GetTeamsChannelConfigurationResult>
      getMicrosoftTeamsChannelConfiguration({
    required String chatConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-ms-teams-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetTeamsChannelConfigurationResult.fromJson(response);
  }

  /// Lists MS Teams Channel Configurations optionally filtered by TeamId
  ///
  /// May throw [ListTeamsChannelConfigurationsException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  ///
  /// Parameter [teamId] :
  /// The ID of the Microsoft Team authorized with AWS Chatbot. To get the team
  /// ID, you must perform the initial authorization flow with Microsoft Teams
  /// in the AWS Chatbot console. Then you can copy and paste the team ID from
  /// the console. For more details, see steps 1-4 in Get started with Microsoft
  /// Teams in the AWS Chatbot Administrator Guide.
  Future<ListTeamsChannelConfigurationsResult>
      listMicrosoftTeamsChannelConfigurations({
    int? maxResults,
    String? nextToken,
    String? teamId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (teamId != null) 'TeamId': teamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-ms-teams-channel-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListTeamsChannelConfigurationsResult.fromJson(response);
  }

  /// Lists all authorized MS teams for AWS Account
  ///
  /// May throw [ListMicrosoftTeamsConfiguredTeamsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<ListMicrosoftTeamsConfiguredTeamsResult>
      listMicrosoftTeamsConfiguredTeams({
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-ms-teams-configured-teams',
      exceptionFnMap: _exceptionFns,
    );
    return ListMicrosoftTeamsConfiguredTeamsResult.fromJson(response);
  }

  /// Lists all Microsoft Teams user identities with a mapped role.
  ///
  /// May throw [ListMicrosoftTeamsUserIdentitiesException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the MicrosoftTeamsChannelConfiguration associated with the user
  /// identities to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  Future<ListMicrosoftTeamsUserIdentitiesResult>
      listMicrosoftTeamsUserIdentities({
    String? chatConfigurationArn,
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
      if (chatConfigurationArn != null)
        'ChatConfigurationArn': chatConfigurationArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-ms-teams-user-identities',
      exceptionFnMap: _exceptionFns,
    );
    return ListMicrosoftTeamsUserIdentitiesResult.fromJson(response);
  }

  /// Retrieves the list of tags applied to a configuration.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the configuration.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-tags-for-resource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Applies the supplied tags to a configuration.
  ///
  /// May throw [InternalServiceError].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the configuration.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the configuration.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the supplied tags from a configuration
  ///
  /// May throw [InternalServiceError].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the configuration.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the configuration.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update Chatbot account level preferences
  ///
  /// May throw [UpdateAccountPreferencesException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [trainingDataCollectionEnabled] :
  /// Turns on training data collection. This helps improve the AWS Chatbot
  /// experience by allowing AWS Chatbot to store and use your customer
  /// information, such as AWS Chatbot configurations, notifications, user
  /// inputs, AWS Chatbot generated responses, and interaction data. This data
  /// helps us to continuously improve and develop Artificial Intelligence (AI)
  /// technologies. Your data is not shared with any third parties and is
  /// protected using sophisticated controls to prevent unauthorized access and
  /// misuse. AWS Chatbot does not store or use interactions in chat channels
  /// with Amazon Q for training AWS Chatbot’s AI technologies.
  ///
  /// Parameter [userAuthorizationRequired] :
  /// Enables use of a user role requirement in your chat configuration.
  Future<UpdateAccountPreferencesResult> updateAccountPreferences({
    bool? trainingDataCollectionEnabled,
    bool? userAuthorizationRequired,
  }) async {
    final $payload = <String, dynamic>{
      if (trainingDataCollectionEnabled != null)
        'TrainingDataCollectionEnabled': trainingDataCollectionEnabled,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-account-preferences',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountPreferencesResult.fromJson(response);
  }

  /// Updates a Chime Webhook Configuration
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [UpdateChimeWebhookConfigurationException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the ChimeWebhookConfiguration to update.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS
  /// Chatbot.
  ///
  /// Parameter [loggingLevel] :
  /// Logging levels include ERROR, INFO, or NONE.
  ///
  /// Parameter [snsTopicArns] :
  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  ///
  /// Parameter [webhookDescription] :
  /// Description of the webhook. Recommend using the convention
  /// `RoomName/WebhookName`. See Chime setup tutorial for more details:
  /// https://docs.aws.amazon.com/chatbot/latest/adminguide/chime-setup.html.
  ///
  /// Parameter [webhookUrl] :
  /// URL for the Chime webhook.
  Future<UpdateChimeWebhookConfigurationResult>
      updateChimeWebhookConfiguration({
    required String chatConfigurationArn,
    String? iamRoleArn,
    String? loggingLevel,
    List<String>? snsTopicArns,
    String? webhookDescription,
    String? webhookUrl,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (snsTopicArns != null) 'SnsTopicArns': snsTopicArns,
      if (webhookDescription != null) 'WebhookDescription': webhookDescription,
      if (webhookUrl != null) 'WebhookUrl': webhookUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-chime-webhook-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChimeWebhookConfigurationResult.fromJson(response);
  }

  /// Updates MS Teams Channel Configuration
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [UpdateTeamsChannelConfigurationException].
  ///
  /// Parameter [channelId] :
  /// The ID of the Microsoft Teams channel.
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the MicrosoftTeamsChannelConfiguration to update.
  ///
  /// Parameter [channelName] :
  /// The name of the Microsoft Teams channel.
  ///
  /// Parameter [guardrailPolicyArns] :
  /// The list of IAM policy ARNs that are applied as channel guardrails. The
  /// AWS managed 'AdministratorAccess' policy is applied by default if this is
  /// not set.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS
  /// Chatbot.
  ///
  /// Parameter [loggingLevel] :
  /// Logging levels include ERROR, INFO, or NONE.
  ///
  /// Parameter [snsTopicArns] :
  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  ///
  /// Parameter [userAuthorizationRequired] :
  /// Enables use of a user role requirement in your chat configuration.
  Future<UpdateTeamsChannelConfigurationResult>
      updateMicrosoftTeamsChannelConfiguration({
    required String channelId,
    required String chatConfigurationArn,
    String? channelName,
    List<String>? guardrailPolicyArns,
    String? iamRoleArn,
    String? loggingLevel,
    List<String>? snsTopicArns,
    bool? userAuthorizationRequired,
  }) async {
    final $payload = <String, dynamic>{
      'ChannelId': channelId,
      'ChatConfigurationArn': chatConfigurationArn,
      if (channelName != null) 'ChannelName': channelName,
      if (guardrailPolicyArns != null)
        'GuardrailPolicyArns': guardrailPolicyArns,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (snsTopicArns != null) 'SnsTopicArns': snsTopicArns,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-ms-teams-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTeamsChannelConfigurationResult.fromJson(response);
  }

  /// Updates Slack Channel Configuration
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [UpdateSlackChannelConfigurationException].
  ///
  /// Parameter [chatConfigurationArn] :
  /// The ARN of the SlackChannelConfiguration to update.
  ///
  /// Parameter [slackChannelId] :
  /// The ID of the Slack channel. To get the ID, open Slack, right click on the
  /// channel name in the left pane, then choose Copy Link. The channel ID is
  /// the 9-character string at the end of the URL. For example, ABCBBLZZZ.
  ///
  /// Parameter [guardrailPolicyArns] :
  /// The list of IAM policy ARNs that are applied as channel guardrails. The
  /// AWS managed 'AdministratorAccess' policy is applied by default if this is
  /// not set.
  ///
  /// Parameter [iamRoleArn] :
  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS
  /// Chatbot.
  ///
  /// Parameter [loggingLevel] :
  /// Logging levels include ERROR, INFO, or NONE.
  ///
  /// Parameter [slackChannelName] :
  /// The name of the Slack Channel.
  ///
  /// Parameter [snsTopicArns] :
  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  ///
  /// Parameter [userAuthorizationRequired] :
  /// Enables use of a user role requirement in your chat configuration.
  Future<UpdateSlackChannelConfigurationResult>
      updateSlackChannelConfiguration({
    required String chatConfigurationArn,
    required String slackChannelId,
    List<String>? guardrailPolicyArns,
    String? iamRoleArn,
    String? loggingLevel,
    String? slackChannelName,
    List<String>? snsTopicArns,
    bool? userAuthorizationRequired,
  }) async {
    final $payload = <String, dynamic>{
      'ChatConfigurationArn': chatConfigurationArn,
      'SlackChannelId': slackChannelId,
      if (guardrailPolicyArns != null)
        'GuardrailPolicyArns': guardrailPolicyArns,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (slackChannelName != null) 'SlackChannelName': slackChannelName,
      if (snsTopicArns != null) 'SnsTopicArns': snsTopicArns,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-slack-channel-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSlackChannelConfigurationResult.fromJson(response);
  }
}

/// Preferences which apply for AWS Chatbot usage in the calling AWS account.
class AccountPreferences {
  /// Turns on training data collection. This helps improve the AWS Chatbot
  /// experience by allowing AWS Chatbot to store and use your customer
  /// information, such as AWS Chatbot configurations, notifications, user inputs,
  /// AWS Chatbot generated responses, and interaction data. This data helps us to
  /// continuously improve and develop Artificial Intelligence (AI) technologies.
  /// Your data is not shared with any third parties and is protected using
  /// sophisticated controls to prevent unauthorized access and misuse. AWS
  /// Chatbot does not store or use interactions in chat channels with Amazon Q
  /// for training AWS Chatbot’s AI technologies.
  final bool? trainingDataCollectionEnabled;

  /// Enables use of a user role requirement in your chat configuration.
  final bool? userAuthorizationRequired;

  AccountPreferences({
    this.trainingDataCollectionEnabled,
    this.userAuthorizationRequired,
  });

  factory AccountPreferences.fromJson(Map<String, dynamic> json) {
    return AccountPreferences(
      trainingDataCollectionEnabled:
          json['TrainingDataCollectionEnabled'] as bool?,
      userAuthorizationRequired: json['UserAuthorizationRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainingDataCollectionEnabled = this.trainingDataCollectionEnabled;
    final userAuthorizationRequired = this.userAuthorizationRequired;
    return {
      if (trainingDataCollectionEnabled != null)
        'TrainingDataCollectionEnabled': trainingDataCollectionEnabled,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
  }
}

/// An AWS Chatbot configuration for Amazon Chime.
class ChimeWebhookConfiguration {
  /// The ARN of the ChimeWebhookConfiguration.
  final String chatConfigurationArn;

  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS Chatbot.
  final String iamRoleArn;

  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  final List<String> snsTopicArns;

  /// Description of the webhook. Recommend using the convention
  /// `RoomName/WebhookName`. See Chime setup tutorial for more details:
  /// https://docs.aws.amazon.com/chatbot/latest/adminguide/chime-setup.html.
  final String webhookDescription;

  /// The name of the configuration.
  final String? configurationName;

  /// Specifies the logging level for this configuration. This property affects
  /// the log entries pushed to Amazon CloudWatch Logs.Logging levels include
  /// ERROR, INFO, or NONE.
  final String? loggingLevel;

  /// A list of tags applied to the configuration.
  final List<Tag>? tags;

  ChimeWebhookConfiguration({
    required this.chatConfigurationArn,
    required this.iamRoleArn,
    required this.snsTopicArns,
    required this.webhookDescription,
    this.configurationName,
    this.loggingLevel,
    this.tags,
  });

  factory ChimeWebhookConfiguration.fromJson(Map<String, dynamic> json) {
    return ChimeWebhookConfiguration(
      chatConfigurationArn: json['ChatConfigurationArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
      snsTopicArns: (json['SnsTopicArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      webhookDescription: json['WebhookDescription'] as String,
      configurationName: json['ConfigurationName'] as String?,
      loggingLevel: json['LoggingLevel'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final chatConfigurationArn = this.chatConfigurationArn;
    final iamRoleArn = this.iamRoleArn;
    final snsTopicArns = this.snsTopicArns;
    final webhookDescription = this.webhookDescription;
    final configurationName = this.configurationName;
    final loggingLevel = this.loggingLevel;
    final tags = this.tags;
    return {
      'ChatConfigurationArn': chatConfigurationArn,
      'IamRoleArn': iamRoleArn,
      'SnsTopicArns': snsTopicArns,
      'WebhookDescription': webhookDescription,
      if (configurationName != null) 'ConfigurationName': configurationName,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A Microsoft Teams team that has been authorized with AWS Chatbot.
class ConfiguredTeam {
  /// The ID of the Microsoft Team authorized with AWS Chatbot. To get the team
  /// ID, you must perform the initial authorization flow with Microsoft Teams in
  /// the AWS Chatbot console. Then you can copy and paste the team ID from the
  /// console. For more details, see steps 1-4 in Get started with Microsoft Teams
  /// in the AWS Chatbot Administrator Guide.
  final String teamId;

  /// The ID of the Microsoft Teams tenant.
  final String tenantId;

  /// The name of the Microsoft Teams Team.
  final String? teamName;

  ConfiguredTeam({
    required this.teamId,
    required this.tenantId,
    this.teamName,
  });

  factory ConfiguredTeam.fromJson(Map<String, dynamic> json) {
    return ConfiguredTeam(
      teamId: json['TeamId'] as String,
      tenantId: json['TenantId'] as String,
      teamName: json['TeamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final teamId = this.teamId;
    final tenantId = this.tenantId;
    final teamName = this.teamName;
    return {
      'TeamId': teamId,
      'TenantId': tenantId,
      if (teamName != null) 'TeamName': teamName,
    };
  }
}

class CreateChimeWebhookConfigurationResult {
  /// Chime webhook configuration.
  final ChimeWebhookConfiguration? webhookConfiguration;

  CreateChimeWebhookConfigurationResult({
    this.webhookConfiguration,
  });

  factory CreateChimeWebhookConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return CreateChimeWebhookConfigurationResult(
      webhookConfiguration: json['WebhookConfiguration'] != null
          ? ChimeWebhookConfiguration.fromJson(
              json['WebhookConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final webhookConfiguration = this.webhookConfiguration;
    return {
      if (webhookConfiguration != null)
        'WebhookConfiguration': webhookConfiguration,
    };
  }
}

class CreateSlackChannelConfigurationResult {
  /// The configuration for a Slack channel configured with AWS Chatbot.
  final SlackChannelConfiguration? channelConfiguration;

  CreateSlackChannelConfigurationResult({
    this.channelConfiguration,
  });

  factory CreateSlackChannelConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return CreateSlackChannelConfigurationResult(
      channelConfiguration: json['ChannelConfiguration'] != null
          ? SlackChannelConfiguration.fromJson(
              json['ChannelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelConfiguration = this.channelConfiguration;
    return {
      if (channelConfiguration != null)
        'ChannelConfiguration': channelConfiguration,
    };
  }
}

class CreateTeamsChannelConfigurationResult {
  /// The configuration for a Microsoft Teams channel configured with AWS Chatbot.
  final TeamsChannelConfiguration? channelConfiguration;

  CreateTeamsChannelConfigurationResult({
    this.channelConfiguration,
  });

  factory CreateTeamsChannelConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return CreateTeamsChannelConfigurationResult(
      channelConfiguration: json['ChannelConfiguration'] != null
          ? TeamsChannelConfiguration.fromJson(
              json['ChannelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelConfiguration = this.channelConfiguration;
    return {
      if (channelConfiguration != null)
        'ChannelConfiguration': channelConfiguration,
    };
  }
}

class DeleteChimeWebhookConfigurationResult {
  DeleteChimeWebhookConfigurationResult();

  factory DeleteChimeWebhookConfigurationResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteChimeWebhookConfigurationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMicrosoftTeamsUserIdentityResult {
  DeleteMicrosoftTeamsUserIdentityResult();

  factory DeleteMicrosoftTeamsUserIdentityResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteMicrosoftTeamsUserIdentityResult();
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

class DeleteSlackUserIdentityResult {
  DeleteSlackUserIdentityResult();

  factory DeleteSlackUserIdentityResult.fromJson(Map<String, dynamic> _) {
    return DeleteSlackUserIdentityResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSlackWorkspaceAuthorizationResult {
  DeleteSlackWorkspaceAuthorizationResult();

  factory DeleteSlackWorkspaceAuthorizationResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteSlackWorkspaceAuthorizationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTeamsChannelConfigurationResult {
  DeleteTeamsChannelConfigurationResult();

  factory DeleteTeamsChannelConfigurationResult.fromJson(
      Map<String, dynamic> _) {
    return DeleteTeamsChannelConfigurationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTeamsConfiguredTeamResult {
  DeleteTeamsConfiguredTeamResult();

  factory DeleteTeamsConfiguredTeamResult.fromJson(Map<String, dynamic> _) {
    return DeleteTeamsConfiguredTeamResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeChimeWebhookConfigurationsResult {
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// A list of Chime webhooks associated with the account.
  final List<ChimeWebhookConfiguration>? webhookConfigurations;

  DescribeChimeWebhookConfigurationsResult({
    this.nextToken,
    this.webhookConfigurations,
  });

  factory DescribeChimeWebhookConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeChimeWebhookConfigurationsResult(
      nextToken: json['NextToken'] as String?,
      webhookConfigurations: (json['WebhookConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ChimeWebhookConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final webhookConfigurations = this.webhookConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (webhookConfigurations != null)
        'WebhookConfigurations': webhookConfigurations,
    };
  }
}

class DescribeSlackChannelConfigurationsResult {
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// A list of Slack channel configurations.
  final List<SlackChannelConfiguration>? slackChannelConfigurations;

  DescribeSlackChannelConfigurationsResult({
    this.nextToken,
    this.slackChannelConfigurations,
  });

  factory DescribeSlackChannelConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeSlackChannelConfigurationsResult(
      nextToken: json['NextToken'] as String?,
      slackChannelConfigurations: (json['SlackChannelConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SlackChannelConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slackChannelConfigurations = this.slackChannelConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (slackChannelConfigurations != null)
        'SlackChannelConfigurations': slackChannelConfigurations,
    };
  }
}

class DescribeSlackUserIdentitiesResult {
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// A list of Slack User Identities.
  final List<SlackUserIdentity>? slackUserIdentities;

  DescribeSlackUserIdentitiesResult({
    this.nextToken,
    this.slackUserIdentities,
  });

  factory DescribeSlackUserIdentitiesResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeSlackUserIdentitiesResult(
      nextToken: json['NextToken'] as String?,
      slackUserIdentities: (json['SlackUserIdentities'] as List?)
          ?.whereNotNull()
          .map((e) => SlackUserIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slackUserIdentities = this.slackUserIdentities;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (slackUserIdentities != null)
        'SlackUserIdentities': slackUserIdentities,
    };
  }
}

class DescribeSlackWorkspacesResult {
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// A list of Slack Workspaces registered with AWS Chatbot.
  final List<SlackWorkspace>? slackWorkspaces;

  DescribeSlackWorkspacesResult({
    this.nextToken,
    this.slackWorkspaces,
  });

  factory DescribeSlackWorkspacesResult.fromJson(Map<String, dynamic> json) {
    return DescribeSlackWorkspacesResult(
      nextToken: json['NextToken'] as String?,
      slackWorkspaces: (json['SlackWorkspaces'] as List?)
          ?.whereNotNull()
          .map((e) => SlackWorkspace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final slackWorkspaces = this.slackWorkspaces;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (slackWorkspaces != null) 'SlackWorkspaces': slackWorkspaces,
    };
  }
}

class GetAccountPreferencesResult {
  /// Preferences which apply for AWS Chatbot usage in the calling AWS account.
  final AccountPreferences? accountPreferences;

  GetAccountPreferencesResult({
    this.accountPreferences,
  });

  factory GetAccountPreferencesResult.fromJson(Map<String, dynamic> json) {
    return GetAccountPreferencesResult(
      accountPreferences: json['AccountPreferences'] != null
          ? AccountPreferences.fromJson(
              json['AccountPreferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountPreferences = this.accountPreferences;
    return {
      if (accountPreferences != null) 'AccountPreferences': accountPreferences,
    };
  }
}

class GetTeamsChannelConfigurationResult {
  /// The configuration for a Microsoft Teams channel configured with AWS Chatbot.
  final TeamsChannelConfiguration? channelConfiguration;

  GetTeamsChannelConfigurationResult({
    this.channelConfiguration,
  });

  factory GetTeamsChannelConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return GetTeamsChannelConfigurationResult(
      channelConfiguration: json['ChannelConfiguration'] != null
          ? TeamsChannelConfiguration.fromJson(
              json['ChannelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelConfiguration = this.channelConfiguration;
    return {
      if (channelConfiguration != null)
        'ChannelConfiguration': channelConfiguration,
    };
  }
}

class ListMicrosoftTeamsConfiguredTeamsResult {
  /// A list of teams in Microsoft Teams that have been configured with AWS
  /// Chatbot.
  final List<ConfiguredTeam>? configuredTeams;

  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  ListMicrosoftTeamsConfiguredTeamsResult({
    this.configuredTeams,
    this.nextToken,
  });

  factory ListMicrosoftTeamsConfiguredTeamsResult.fromJson(
      Map<String, dynamic> json) {
    return ListMicrosoftTeamsConfiguredTeamsResult(
      configuredTeams: (json['ConfiguredTeams'] as List?)
          ?.whereNotNull()
          .map((e) => ConfiguredTeam.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredTeams = this.configuredTeams;
    final nextToken = this.nextToken;
    return {
      if (configuredTeams != null) 'ConfiguredTeams': configuredTeams,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMicrosoftTeamsUserIdentitiesResult {
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// User level permissions associated to a channel configuration.
  final List<TeamsUserIdentity>? teamsUserIdentities;

  ListMicrosoftTeamsUserIdentitiesResult({
    this.nextToken,
    this.teamsUserIdentities,
  });

  factory ListMicrosoftTeamsUserIdentitiesResult.fromJson(
      Map<String, dynamic> json) {
    return ListMicrosoftTeamsUserIdentitiesResult(
      nextToken: json['NextToken'] as String?,
      teamsUserIdentities: (json['TeamsUserIdentities'] as List?)
          ?.whereNotNull()
          .map((e) => TeamsUserIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final teamsUserIdentities = this.teamsUserIdentities;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (teamsUserIdentities != null)
        'TeamsUserIdentities': teamsUserIdentities,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags applied to the configuration.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
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

class ListTeamsChannelConfigurationsResult {
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// A list of AWS Chatbot channel configurations for Microsoft Teams.
  final List<TeamsChannelConfiguration>? teamChannelConfigurations;

  ListTeamsChannelConfigurationsResult({
    this.nextToken,
    this.teamChannelConfigurations,
  });

  factory ListTeamsChannelConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return ListTeamsChannelConfigurationsResult(
      nextToken: json['NextToken'] as String?,
      teamChannelConfigurations: (json['TeamChannelConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TeamsChannelConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final teamChannelConfigurations = this.teamChannelConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (teamChannelConfigurations != null)
        'TeamChannelConfigurations': teamChannelConfigurations,
    };
  }
}

/// An AWS Chatbot configuration for Slack.
class SlackChannelConfiguration {
  /// The ARN of the SlackChannelConfiguration.
  final String chatConfigurationArn;

  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS Chatbot.
  final String iamRoleArn;

  /// The ID of the Slack channel. To get the ID, open Slack, right click on the
  /// channel name in the left pane, then choose Copy Link. The channel ID is the
  /// 9-character string at the end of the URL. For example, ABCBBLZZZ.
  final String slackChannelId;

  /// The name of the Slack Channel.
  final String slackChannelName;

  /// The ID of the Slack workspace authorized with AWS Chatbot.
  final String slackTeamId;

  /// Name of the Slack Workspace.
  final String slackTeamName;

  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  final List<String> snsTopicArns;

  /// The name of the configuration.
  final String? configurationName;

  /// The list of IAM policy ARNs that are applied as channel guardrails. The AWS
  /// managed 'AdministratorAccess' policy is applied by default if this is not
  /// set.
  final List<String>? guardrailPolicyArns;

  /// Logging levels include ERROR, INFO, or NONE.
  final String? loggingLevel;

  /// A list of tags applied to the configuration.
  final List<Tag>? tags;

  /// Enables use of a user role requirement in your chat configuration.
  final bool? userAuthorizationRequired;

  SlackChannelConfiguration({
    required this.chatConfigurationArn,
    required this.iamRoleArn,
    required this.slackChannelId,
    required this.slackChannelName,
    required this.slackTeamId,
    required this.slackTeamName,
    required this.snsTopicArns,
    this.configurationName,
    this.guardrailPolicyArns,
    this.loggingLevel,
    this.tags,
    this.userAuthorizationRequired,
  });

  factory SlackChannelConfiguration.fromJson(Map<String, dynamic> json) {
    return SlackChannelConfiguration(
      chatConfigurationArn: json['ChatConfigurationArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
      slackChannelId: json['SlackChannelId'] as String,
      slackChannelName: json['SlackChannelName'] as String,
      slackTeamId: json['SlackTeamId'] as String,
      slackTeamName: json['SlackTeamName'] as String,
      snsTopicArns: (json['SnsTopicArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      configurationName: json['ConfigurationName'] as String?,
      guardrailPolicyArns: (json['GuardrailPolicyArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      loggingLevel: json['LoggingLevel'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAuthorizationRequired: json['UserAuthorizationRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final chatConfigurationArn = this.chatConfigurationArn;
    final iamRoleArn = this.iamRoleArn;
    final slackChannelId = this.slackChannelId;
    final slackChannelName = this.slackChannelName;
    final slackTeamId = this.slackTeamId;
    final slackTeamName = this.slackTeamName;
    final snsTopicArns = this.snsTopicArns;
    final configurationName = this.configurationName;
    final guardrailPolicyArns = this.guardrailPolicyArns;
    final loggingLevel = this.loggingLevel;
    final tags = this.tags;
    final userAuthorizationRequired = this.userAuthorizationRequired;
    return {
      'ChatConfigurationArn': chatConfigurationArn,
      'IamRoleArn': iamRoleArn,
      'SlackChannelId': slackChannelId,
      'SlackChannelName': slackChannelName,
      'SlackTeamId': slackTeamId,
      'SlackTeamName': slackTeamName,
      'SnsTopicArns': snsTopicArns,
      if (configurationName != null) 'ConfigurationName': configurationName,
      if (guardrailPolicyArns != null)
        'GuardrailPolicyArns': guardrailPolicyArns,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (tags != null) 'Tags': tags,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
  }
}

/// Identifes a User level permission for a channel configuration.
class SlackUserIdentity {
  /// The ARN of the SlackChannelConfiguration associated with the user identity.
  final String chatConfigurationArn;

  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS Chatbot.
  final String iamRoleArn;

  /// The ID of the Slack workspace authorized with AWS Chatbot.
  final String slackTeamId;

  /// The ID of the user in Slack.
  final String slackUserId;

  /// The AWS user identity ARN used to associate a Slack User Identity with an
  /// IAM Role.
  final String? awsUserIdentity;

  SlackUserIdentity({
    required this.chatConfigurationArn,
    required this.iamRoleArn,
    required this.slackTeamId,
    required this.slackUserId,
    this.awsUserIdentity,
  });

  factory SlackUserIdentity.fromJson(Map<String, dynamic> json) {
    return SlackUserIdentity(
      chatConfigurationArn: json['ChatConfigurationArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
      slackTeamId: json['SlackTeamId'] as String,
      slackUserId: json['SlackUserId'] as String,
      awsUserIdentity: json['AwsUserIdentity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chatConfigurationArn = this.chatConfigurationArn;
    final iamRoleArn = this.iamRoleArn;
    final slackTeamId = this.slackTeamId;
    final slackUserId = this.slackUserId;
    final awsUserIdentity = this.awsUserIdentity;
    return {
      'ChatConfigurationArn': chatConfigurationArn,
      'IamRoleArn': iamRoleArn,
      'SlackTeamId': slackTeamId,
      'SlackUserId': slackUserId,
      if (awsUserIdentity != null) 'AwsUserIdentity': awsUserIdentity,
    };
  }
}

/// A Slack Workspace.
class SlackWorkspace {
  /// The ID of the Slack workspace authorized with AWS Chatbot.
  final String slackTeamId;

  /// Name of the Slack Workspace.
  final String slackTeamName;

  SlackWorkspace({
    required this.slackTeamId,
    required this.slackTeamName,
  });

  factory SlackWorkspace.fromJson(Map<String, dynamic> json) {
    return SlackWorkspace(
      slackTeamId: json['SlackTeamId'] as String,
      slackTeamName: json['SlackTeamName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final slackTeamId = this.slackTeamId;
    final slackTeamName = this.slackTeamName;
    return {
      'SlackTeamId': slackTeamId,
      'SlackTeamName': slackTeamName,
    };
  }
}

/// A tag applied to the configuration.
class Tag {
  /// The tag key.
  final String tagKey;

  /// The tag value.
  final String tagValue;

  Tag({
    required this.tagKey,
    required this.tagValue,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagKey: json['TagKey'] as String,
      tagValue: json['TagValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValue = this.tagValue;
    return {
      'TagKey': tagKey,
      'TagValue': tagValue,
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

/// An AWS Chatbot configuration for Microsoft Teams.
class TeamsChannelConfiguration {
  /// The ID of the Microsoft Teams channel.
  final String channelId;

  /// The ARN of the MicrosoftTeamsChannelConfiguration.
  final String chatConfigurationArn;

  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS Chatbot.
  final String iamRoleArn;

  /// The ARNs of the SNS topics that deliver notifications to AWS Chatbot.
  final List<String> snsTopicArns;

  /// The ID of the Microsoft Team authorized with AWS Chatbot. To get the team
  /// ID, you must perform the initial authorization flow with Microsoft Teams in
  /// the AWS Chatbot console. Then you can copy and paste the team ID from the
  /// console. For more details, see steps 1-4 in Get started with Microsoft Teams
  /// in the AWS Chatbot Administrator Guide.
  final String teamId;

  /// The ID of the Microsoft Teams tenant.
  final String tenantId;

  /// The name of the Microsoft Teams channel.
  final String? channelName;

  /// The name of the configuration.
  final String? configurationName;

  /// The list of IAM policy ARNs that are applied as channel guardrails. The AWS
  /// managed 'AdministratorAccess' policy is applied by default if this is not
  /// set.
  final List<String>? guardrailPolicyArns;

  /// Logging levels include ERROR, INFO, or NONE.
  final String? loggingLevel;

  /// A list of tags applied to the configuration.
  final List<Tag>? tags;

  /// The name of the Microsoft Teams Team.
  final String? teamName;

  /// Enables use of a user role requirement in your chat configuration.
  final bool? userAuthorizationRequired;

  TeamsChannelConfiguration({
    required this.channelId,
    required this.chatConfigurationArn,
    required this.iamRoleArn,
    required this.snsTopicArns,
    required this.teamId,
    required this.tenantId,
    this.channelName,
    this.configurationName,
    this.guardrailPolicyArns,
    this.loggingLevel,
    this.tags,
    this.teamName,
    this.userAuthorizationRequired,
  });

  factory TeamsChannelConfiguration.fromJson(Map<String, dynamic> json) {
    return TeamsChannelConfiguration(
      channelId: json['ChannelId'] as String,
      chatConfigurationArn: json['ChatConfigurationArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
      snsTopicArns: (json['SnsTopicArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      teamId: json['TeamId'] as String,
      tenantId: json['TenantId'] as String,
      channelName: json['ChannelName'] as String?,
      configurationName: json['ConfigurationName'] as String?,
      guardrailPolicyArns: (json['GuardrailPolicyArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      loggingLevel: json['LoggingLevel'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      teamName: json['TeamName'] as String?,
      userAuthorizationRequired: json['UserAuthorizationRequired'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final chatConfigurationArn = this.chatConfigurationArn;
    final iamRoleArn = this.iamRoleArn;
    final snsTopicArns = this.snsTopicArns;
    final teamId = this.teamId;
    final tenantId = this.tenantId;
    final channelName = this.channelName;
    final configurationName = this.configurationName;
    final guardrailPolicyArns = this.guardrailPolicyArns;
    final loggingLevel = this.loggingLevel;
    final tags = this.tags;
    final teamName = this.teamName;
    final userAuthorizationRequired = this.userAuthorizationRequired;
    return {
      'ChannelId': channelId,
      'ChatConfigurationArn': chatConfigurationArn,
      'IamRoleArn': iamRoleArn,
      'SnsTopicArns': snsTopicArns,
      'TeamId': teamId,
      'TenantId': tenantId,
      if (channelName != null) 'ChannelName': channelName,
      if (configurationName != null) 'ConfigurationName': configurationName,
      if (guardrailPolicyArns != null)
        'GuardrailPolicyArns': guardrailPolicyArns,
      if (loggingLevel != null) 'LoggingLevel': loggingLevel,
      if (tags != null) 'Tags': tags,
      if (teamName != null) 'TeamName': teamName,
      if (userAuthorizationRequired != null)
        'UserAuthorizationRequired': userAuthorizationRequired,
    };
  }
}

/// Identifes a user level permission for a channel configuration.
class TeamsUserIdentity {
  /// The ARN of the MicrosoftTeamsChannelConfiguration associated with the user
  /// identity.
  final String chatConfigurationArn;

  /// The ARN of the IAM role that defines the permissions for AWS Chatbot. This
  /// is a user-defined role that AWS Chatbot will assume. This is not the
  /// service-linked role. For more information, see IAM Policies for AWS Chatbot.
  final String iamRoleArn;

  /// The ID of the Microsoft Team authorized with AWS Chatbot. To get the team
  /// ID, you must perform the initial authorization flow with Microsoft Teams in
  /// the AWS Chatbot console. Then you can copy and paste the team ID from the
  /// console. For more details, see steps 1-4 in Get started with Microsoft Teams
  /// in the AWS Chatbot Administrator Guide.
  final String teamId;

  /// The AWS user identity ARN used to associate a Microsoft Teams User Identity
  /// with an IAM Role.
  final String? awsUserIdentity;

  /// The ID of the Microsoft Teams channel.
  final String? teamsChannelId;

  /// The ID of the Microsoft Teams tenant.
  final String? teamsTenantId;

  /// Id from Microsoft Teams for user.
  final String? userId;

  TeamsUserIdentity({
    required this.chatConfigurationArn,
    required this.iamRoleArn,
    required this.teamId,
    this.awsUserIdentity,
    this.teamsChannelId,
    this.teamsTenantId,
    this.userId,
  });

  factory TeamsUserIdentity.fromJson(Map<String, dynamic> json) {
    return TeamsUserIdentity(
      chatConfigurationArn: json['ChatConfigurationArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
      teamId: json['TeamId'] as String,
      awsUserIdentity: json['AwsUserIdentity'] as String?,
      teamsChannelId: json['TeamsChannelId'] as String?,
      teamsTenantId: json['TeamsTenantId'] as String?,
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chatConfigurationArn = this.chatConfigurationArn;
    final iamRoleArn = this.iamRoleArn;
    final teamId = this.teamId;
    final awsUserIdentity = this.awsUserIdentity;
    final teamsChannelId = this.teamsChannelId;
    final teamsTenantId = this.teamsTenantId;
    final userId = this.userId;
    return {
      'ChatConfigurationArn': chatConfigurationArn,
      'IamRoleArn': iamRoleArn,
      'TeamId': teamId,
      if (awsUserIdentity != null) 'AwsUserIdentity': awsUserIdentity,
      if (teamsChannelId != null) 'TeamsChannelId': teamsChannelId,
      if (teamsTenantId != null) 'TeamsTenantId': teamsTenantId,
      if (userId != null) 'UserId': userId,
    };
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

class UpdateAccountPreferencesResult {
  /// Preferences which apply for AWS Chatbot usage in the calling AWS account.
  final AccountPreferences? accountPreferences;

  UpdateAccountPreferencesResult({
    this.accountPreferences,
  });

  factory UpdateAccountPreferencesResult.fromJson(Map<String, dynamic> json) {
    return UpdateAccountPreferencesResult(
      accountPreferences: json['AccountPreferences'] != null
          ? AccountPreferences.fromJson(
              json['AccountPreferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountPreferences = this.accountPreferences;
    return {
      if (accountPreferences != null) 'AccountPreferences': accountPreferences,
    };
  }
}

class UpdateChimeWebhookConfigurationResult {
  /// Chime webhook configuration.
  final ChimeWebhookConfiguration? webhookConfiguration;

  UpdateChimeWebhookConfigurationResult({
    this.webhookConfiguration,
  });

  factory UpdateChimeWebhookConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateChimeWebhookConfigurationResult(
      webhookConfiguration: json['WebhookConfiguration'] != null
          ? ChimeWebhookConfiguration.fromJson(
              json['WebhookConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final webhookConfiguration = this.webhookConfiguration;
    return {
      if (webhookConfiguration != null)
        'WebhookConfiguration': webhookConfiguration,
    };
  }
}

class UpdateSlackChannelConfigurationResult {
  /// The configuration for a Slack channel configured with AWS Chatbot.
  final SlackChannelConfiguration? channelConfiguration;

  UpdateSlackChannelConfigurationResult({
    this.channelConfiguration,
  });

  factory UpdateSlackChannelConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateSlackChannelConfigurationResult(
      channelConfiguration: json['ChannelConfiguration'] != null
          ? SlackChannelConfiguration.fromJson(
              json['ChannelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelConfiguration = this.channelConfiguration;
    return {
      if (channelConfiguration != null)
        'ChannelConfiguration': channelConfiguration,
    };
  }
}

class UpdateTeamsChannelConfigurationResult {
  /// The configuration for a Microsoft Teams channel configured with AWS Chatbot.
  final TeamsChannelConfiguration? channelConfiguration;

  UpdateTeamsChannelConfigurationResult({
    this.channelConfiguration,
  });

  factory UpdateTeamsChannelConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateTeamsChannelConfigurationResult(
      channelConfiguration: json['ChannelConfiguration'] != null
          ? TeamsChannelConfiguration.fromJson(
              json['ChannelConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelConfiguration = this.channelConfiguration;
    return {
      if (channelConfiguration != null)
        'ChannelConfiguration': channelConfiguration,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class CreateChimeWebhookConfigurationException extends _s.GenericAwsException {
  CreateChimeWebhookConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'CreateChimeWebhookConfigurationException',
            message: message);
}

class CreateSlackChannelConfigurationException extends _s.GenericAwsException {
  CreateSlackChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'CreateSlackChannelConfigurationException',
            message: message);
}

class CreateTeamsChannelConfigurationException extends _s.GenericAwsException {
  CreateTeamsChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'CreateTeamsChannelConfigurationException',
            message: message);
}

class DeleteChimeWebhookConfigurationException extends _s.GenericAwsException {
  DeleteChimeWebhookConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteChimeWebhookConfigurationException',
            message: message);
}

class DeleteMicrosoftTeamsUserIdentityException extends _s.GenericAwsException {
  DeleteMicrosoftTeamsUserIdentityException({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteMicrosoftTeamsUserIdentityException',
            message: message);
}

class DeleteSlackChannelConfigurationException extends _s.GenericAwsException {
  DeleteSlackChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteSlackChannelConfigurationException',
            message: message);
}

class DeleteSlackUserIdentityException extends _s.GenericAwsException {
  DeleteSlackUserIdentityException({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteSlackUserIdentityException',
            message: message);
}

class DeleteSlackWorkspaceAuthorizationFault extends _s.GenericAwsException {
  DeleteSlackWorkspaceAuthorizationFault({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteSlackWorkspaceAuthorizationFault',
            message: message);
}

class DeleteTeamsChannelConfigurationException extends _s.GenericAwsException {
  DeleteTeamsChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteTeamsChannelConfigurationException',
            message: message);
}

class DeleteTeamsConfiguredTeamException extends _s.GenericAwsException {
  DeleteTeamsConfiguredTeamException({String? type, String? message})
      : super(
            type: type,
            code: 'DeleteTeamsConfiguredTeamException',
            message: message);
}

class DescribeChimeWebhookConfigurationsException
    extends _s.GenericAwsException {
  DescribeChimeWebhookConfigurationsException({String? type, String? message})
      : super(
            type: type,
            code: 'DescribeChimeWebhookConfigurationsException',
            message: message);
}

class DescribeSlackChannelConfigurationsException
    extends _s.GenericAwsException {
  DescribeSlackChannelConfigurationsException({String? type, String? message})
      : super(
            type: type,
            code: 'DescribeSlackChannelConfigurationsException',
            message: message);
}

class DescribeSlackUserIdentitiesException extends _s.GenericAwsException {
  DescribeSlackUserIdentitiesException({String? type, String? message})
      : super(
            type: type,
            code: 'DescribeSlackUserIdentitiesException',
            message: message);
}

class DescribeSlackWorkspacesException extends _s.GenericAwsException {
  DescribeSlackWorkspacesException({String? type, String? message})
      : super(
            type: type,
            code: 'DescribeSlackWorkspacesException',
            message: message);
}

class GetAccountPreferencesException extends _s.GenericAwsException {
  GetAccountPreferencesException({String? type, String? message})
      : super(
            type: type,
            code: 'GetAccountPreferencesException',
            message: message);
}

class GetTeamsChannelConfigurationException extends _s.GenericAwsException {
  GetTeamsChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'GetTeamsChannelConfigurationException',
            message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ListMicrosoftTeamsConfiguredTeamsException
    extends _s.GenericAwsException {
  ListMicrosoftTeamsConfiguredTeamsException({String? type, String? message})
      : super(
            type: type,
            code: 'ListMicrosoftTeamsConfiguredTeamsException',
            message: message);
}

class ListMicrosoftTeamsUserIdentitiesException extends _s.GenericAwsException {
  ListMicrosoftTeamsUserIdentitiesException({String? type, String? message})
      : super(
            type: type,
            code: 'ListMicrosoftTeamsUserIdentitiesException',
            message: message);
}

class ListTeamsChannelConfigurationsException extends _s.GenericAwsException {
  ListTeamsChannelConfigurationsException({String? type, String? message})
      : super(
            type: type,
            code: 'ListTeamsChannelConfigurationsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UpdateAccountPreferencesException extends _s.GenericAwsException {
  UpdateAccountPreferencesException({String? type, String? message})
      : super(
            type: type,
            code: 'UpdateAccountPreferencesException',
            message: message);
}

class UpdateChimeWebhookConfigurationException extends _s.GenericAwsException {
  UpdateChimeWebhookConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'UpdateChimeWebhookConfigurationException',
            message: message);
}

class UpdateSlackChannelConfigurationException extends _s.GenericAwsException {
  UpdateSlackChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'UpdateSlackChannelConfigurationException',
            message: message);
}

class UpdateTeamsChannelConfigurationException extends _s.GenericAwsException {
  UpdateTeamsChannelConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'UpdateTeamsChannelConfigurationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'CreateChimeWebhookConfigurationException': (type, message) =>
      CreateChimeWebhookConfigurationException(type: type, message: message),
  'CreateSlackChannelConfigurationException': (type, message) =>
      CreateSlackChannelConfigurationException(type: type, message: message),
  'CreateTeamsChannelConfigurationException': (type, message) =>
      CreateTeamsChannelConfigurationException(type: type, message: message),
  'DeleteChimeWebhookConfigurationException': (type, message) =>
      DeleteChimeWebhookConfigurationException(type: type, message: message),
  'DeleteMicrosoftTeamsUserIdentityException': (type, message) =>
      DeleteMicrosoftTeamsUserIdentityException(type: type, message: message),
  'DeleteSlackChannelConfigurationException': (type, message) =>
      DeleteSlackChannelConfigurationException(type: type, message: message),
  'DeleteSlackUserIdentityException': (type, message) =>
      DeleteSlackUserIdentityException(type: type, message: message),
  'DeleteSlackWorkspaceAuthorizationFault': (type, message) =>
      DeleteSlackWorkspaceAuthorizationFault(type: type, message: message),
  'DeleteTeamsChannelConfigurationException': (type, message) =>
      DeleteTeamsChannelConfigurationException(type: type, message: message),
  'DeleteTeamsConfiguredTeamException': (type, message) =>
      DeleteTeamsConfiguredTeamException(type: type, message: message),
  'DescribeChimeWebhookConfigurationsException': (type, message) =>
      DescribeChimeWebhookConfigurationsException(type: type, message: message),
  'DescribeSlackChannelConfigurationsException': (type, message) =>
      DescribeSlackChannelConfigurationsException(type: type, message: message),
  'DescribeSlackUserIdentitiesException': (type, message) =>
      DescribeSlackUserIdentitiesException(type: type, message: message),
  'DescribeSlackWorkspacesException': (type, message) =>
      DescribeSlackWorkspacesException(type: type, message: message),
  'GetAccountPreferencesException': (type, message) =>
      GetAccountPreferencesException(type: type, message: message),
  'GetTeamsChannelConfigurationException': (type, message) =>
      GetTeamsChannelConfigurationException(type: type, message: message),
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ListMicrosoftTeamsConfiguredTeamsException': (type, message) =>
      ListMicrosoftTeamsConfiguredTeamsException(type: type, message: message),
  'ListMicrosoftTeamsUserIdentitiesException': (type, message) =>
      ListMicrosoftTeamsUserIdentitiesException(type: type, message: message),
  'ListTeamsChannelConfigurationsException': (type, message) =>
      ListTeamsChannelConfigurationsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UpdateAccountPreferencesException': (type, message) =>
      UpdateAccountPreferencesException(type: type, message: message),
  'UpdateChimeWebhookConfigurationException': (type, message) =>
      UpdateChimeWebhookConfigurationException(type: type, message: message),
  'UpdateSlackChannelConfigurationException': (type, message) =>
      UpdateSlackChannelConfigurationException(type: type, message: message),
  'UpdateTeamsChannelConfigurationException': (type, message) =>
      UpdateTeamsChannelConfigurationException(type: type, message: message),
};
