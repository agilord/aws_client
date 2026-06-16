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

/// The CloudWatch investigations feature is a generative AI-powered assistant
/// that can help you respond to incidents in your system. It uses generative AI
/// to scan your system's telemetry and quickly surface suggestions that might
/// be related to your issue. These suggestions include metrics, logs,
/// deployment events, and root-cause hypotheses.
///
/// You can use API actions to create, manage, and delete investigation groups
/// and investigation group policies. To start and manage investigations, you
/// must use the CloudWatch console.
class AIOps {
  final _s.RestJsonProtocol _protocol;
  AIOps({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'aiops',
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

  /// Displays the tags associated with a CloudWatch investigations resource.
  /// Currently, investigation groups support tagging.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch investigations resource that you want to view
  /// tags for. You can use the <code>ListInvestigationGroups</code> operation
  /// to find the ARNs of investigation groups.
  ///
  /// The ARN format for an investigation group is
  /// <code>arn:aws:aiops:<i>Region</i>:<i>account-id</i>:investigation-group:<i>investigation-group-id</i>
  /// </code>.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified resource.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to apply the
  /// tags to. You can use the <code>ListInvestigationGroups</code> operation to
  /// find the ARNs of investigation groups.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
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

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove the
  /// tags from. You can use the<code>ListInvestigationGroups</code> operation
  /// to find the ARNs of investigation groups.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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

  /// Creates an <i>investigation group</i> in your account. Creating an
  /// investigation group is a one-time setup task for each Region in your
  /// account. It is a necessary task to be able to perform investigations.
  ///
  /// Settings in the investigation group help you centrally manage the common
  /// properties of your investigations, such as the following:
  ///
  /// <ul>
  /// <li>
  /// Who can access the investigations
  /// </li>
  /// <li>
  /// Whether investigation data is encrypted with a customer managed Key
  /// Management Service key.
  /// </li>
  /// <li>
  /// How long investigations and their data are retained by default.
  /// </li>
  /// </ul>
  /// Currently, you can have one investigation group in each Region in your
  /// account. Each investigation in a Region is a part of the investigation
  /// group in that Region
  ///
  /// To create an investigation group and set up CloudWatch investigations, you
  /// must be signed in to an IAM principal that has either the
  /// <code>AIOpsConsoleAdminPolicy</code> or the
  /// <code>AdministratorAccess</code> IAM policy attached, or to an account
  /// that has similar permissions.
  /// <important>
  /// You can configure CloudWatch alarms to start investigations and add events
  /// to investigations. If you create your investigation group with
  /// <code>CreateInvestigationGroup</code> and you want to enable alarms to do
  /// this, you must use <code>PutInvestigationGroupPolicy</code> to create a
  /// resource policy that grants this permission to CloudWatch alarms.
  ///
  /// For more information about configuring CloudWatch alarms, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html">Using
  /// Amazon CloudWatch alarms</a>
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Provides a name for the investigation group.
  ///
  /// Parameter [roleArn] :
  /// Specify the ARN of the IAM role that CloudWatch investigations will use
  /// when it gathers investigation data. The permissions in this role determine
  /// which of your resources that CloudWatch investigations will have access to
  /// during investigations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Investigations-Security.html#Investigations-Security-Data">How
  /// to control what data CloudWatch investigations has access to during
  /// investigations</a>.
  ///
  /// Parameter [chatbotNotificationChannel] :
  /// Use this structure to integrate CloudWatch investigations with chat
  /// applications. This structure is a string array. For the first string,
  /// specify the ARN of an Amazon SNS topic. For the array of strings, specify
  /// the ARNs of one or more chat applications configurations that you want to
  /// associate with that topic. For more information about these configuration
  /// ARNs, see <a
  /// href="https://docs.aws.amazon.com/chatbot/latest/adminguide/getting-started.html">Getting
  /// started with Amazon Q in chat applications</a> and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awschatbot.html#awschatbot-resources-for-iam-policies">Resource
  /// type defined by Amazon Web Services Chatbot</a>.
  ///
  /// Parameter [crossAccountConfigurations] :
  /// List of <code>sourceRoleArn</code> values that have been configured for
  /// cross-account access.
  ///
  /// Parameter [encryptionConfiguration] :
  /// Use this structure if you want to use a customer managed KMS key to
  /// encrypt your investigation data. If you omit this parameter, CloudWatch
  /// investigations will use an Amazon Web Services key to encrypt the data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Investigations-Security.html#Investigations-KMS">Encryption
  /// of investigation data</a>.
  ///
  /// Parameter [isCloudTrailEventHistoryEnabled] :
  /// Specify <code>true</code> to enable CloudWatch investigations to have
  /// access to change events that are recorded by CloudTrail. The default is
  /// <code>true</code>.
  ///
  /// Parameter [retentionInDays] :
  /// Specify how long that investigation data is kept. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Investigations-Retention.html">Operational
  /// investigation data retention</a>.
  ///
  /// If you omit this parameter, the default of 90 days is used.
  ///
  /// Parameter [tagKeyBoundaries] :
  /// Enter the existing custom tag keys for custom applications in your system.
  /// Resource tags help CloudWatch investigations narrow the search space when
  /// it is unable to discover definite relationships between resources. For
  /// example, to discover that an Amazon ECS service depends on an Amazon RDS
  /// database, CloudWatch investigations can discover this relationship using
  /// data sources such as X-Ray and CloudWatch Application Signals. However, if
  /// you haven't deployed these features, CloudWatch investigations will
  /// attempt to identify possible relationships. Tag boundaries can be used to
  /// narrow the resources that will be discovered by CloudWatch investigations
  /// in these cases.
  ///
  /// You don't need to enter tags created by myApplications or CloudFormation,
  /// because CloudWatch investigations can automatically detect those tags.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the investigation group. You
  /// can associate as many as 50 tags with an investigation group. To be able
  /// to associate tags when you create the investigation group, you must have
  /// the <code>cloudwatch:TagResource</code> permission.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  Future<CreateInvestigationGroupOutput> createInvestigationGroup({
    required String name,
    required String roleArn,
    Map<String, List<String>>? chatbotNotificationChannel,
    List<CrossAccountConfiguration>? crossAccountConfigurations,
    EncryptionConfiguration? encryptionConfiguration,
    bool? isCloudTrailEventHistoryEnabled,
    int? retentionInDays,
    List<String>? tagKeyBoundaries,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'retentionInDays',
      retentionInDays,
      7,
      90,
    );
    final $payload = <String, dynamic>{
      'name': name,
      'roleArn': roleArn,
      if (chatbotNotificationChannel != null)
        'chatbotNotificationChannel': chatbotNotificationChannel,
      if (crossAccountConfigurations != null)
        'crossAccountConfigurations': crossAccountConfigurations,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (isCloudTrailEventHistoryEnabled != null)
        'isCloudTrailEventHistoryEnabled': isCloudTrailEventHistoryEnabled,
      if (retentionInDays != null) 'retentionInDays': retentionInDays,
      if (tagKeyBoundaries != null) 'tagKeyBoundaries': tagKeyBoundaries,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/investigationGroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInvestigationGroupOutput.fromJson(response);
  }

  /// Returns the configuration information for the specified investigation
  /// group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// Specify either the name or the ARN of the investigation group that you
  /// want to view. This is used to set the name of the investigation group.
  Future<GetInvestigationGroupResponse> getInvestigationGroup({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/investigationGroups/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInvestigationGroupResponse.fromJson(response);
  }

  /// Updates the configuration of the specified investigation group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Specify either the name or the ARN of the investigation group that you
  /// want to modify.
  ///
  /// Parameter [chatbotNotificationChannel] :
  /// Use this structure to integrate CloudWatch investigations with chat
  /// applications. This structure is a string array. For the first string,
  /// specify the ARN of an Amazon SNS topic. For the array of strings, specify
  /// the ARNs of one or more chat applications configurations that you want to
  /// associate with that topic. For more information about these configuration
  /// ARNs, see <a
  /// href="https://docs.aws.amazon.com/chatbot/latest/adminguide/getting-started.html">Getting
  /// started with Amazon Q in chat applications</a> and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awschatbot.html#awschatbot-resources-for-iam-policies">Resource
  /// type defined by Amazon Web Services Chatbot</a>.
  ///
  /// Parameter [crossAccountConfigurations] :
  /// Used to configure cross-account access for an investigation group. It
  /// allows the investigation group to access resources in other accounts.
  ///
  /// Parameter [encryptionConfiguration] :
  /// Use this structure if you want to use a customer managed KMS key to
  /// encrypt your investigation data. If you omit this parameter, CloudWatch
  /// investigations will use an Amazon Web Services key to encrypt the data.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Investigations-Security.html#Investigations-KMS">Encryption
  /// of investigation data</a>.
  ///
  /// Parameter [isCloudTrailEventHistoryEnabled] :
  /// Specify <code>true</code> to enable CloudWatch investigations to have
  /// access to change events that are recorded by CloudTrail. The default is
  /// <code>true</code>.
  ///
  /// Parameter [roleArn] :
  /// Specify this field if you want to change the IAM role that CloudWatch
  /// investigations will use when it gathers investigation data. To do so,
  /// specify the ARN of the new role.
  ///
  /// The permissions in this role determine which of your resources that
  /// CloudWatch investigations will have access to during investigations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Investigations-Security.html#Investigations-Security-Data">How
  /// to control what data CloudWatch investigations has access to during
  /// investigations</a>.
  ///
  /// Parameter [tagKeyBoundaries] :
  /// Enter the existing custom tag keys for custom applications in your system.
  /// Resource tags help CloudWatch investigations narrow the search space when
  /// it is unable to discover definite relationships between resources. For
  /// example, to discover that an Amazon ECS service depends on an Amazon RDS
  /// database, CloudWatch investigations can discover this relationship using
  /// data sources such as X-Ray and CloudWatch Application Signals. However, if
  /// you haven't deployed these features, CloudWatch investigations will
  /// attempt to identify possible relationships. Tag boundaries can be used to
  /// narrow the resources that will be discovered by CloudWatch investigations
  /// in these cases.
  ///
  /// You don't need to enter tags created by myApplications or CloudFormation,
  /// because CloudWatch investigations can automatically detect those tags.
  Future<void> updateInvestigationGroup({
    required String identifier,
    Map<String, List<String>>? chatbotNotificationChannel,
    List<CrossAccountConfiguration>? crossAccountConfigurations,
    EncryptionConfiguration? encryptionConfiguration,
    bool? isCloudTrailEventHistoryEnabled,
    String? roleArn,
    List<String>? tagKeyBoundaries,
  }) async {
    final $payload = <String, dynamic>{
      if (chatbotNotificationChannel != null)
        'chatbotNotificationChannel': chatbotNotificationChannel,
      if (crossAccountConfigurations != null)
        'crossAccountConfigurations': crossAccountConfigurations,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (isCloudTrailEventHistoryEnabled != null)
        'isCloudTrailEventHistoryEnabled': isCloudTrailEventHistoryEnabled,
      if (roleArn != null) 'roleArn': roleArn,
      if (tagKeyBoundaries != null) 'tagKeyBoundaries': tagKeyBoundaries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/investigationGroups/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified investigation group from your account. You can
  /// currently have one investigation group per Region in your account. After
  /// you delete an investigation group, you can later create a new
  /// investigation group in the same Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [identifier] :
  /// Specify either the name or the ARN of the investigation group that you
  /// want to delete.
  Future<void> deleteInvestigationGroup({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/investigationGroups/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the ARN and name of each investigation group in the account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 50 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of service operations.
  Future<ListInvestigationGroupsOutput> listInvestigationGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/investigationGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvestigationGroupsOutput.fromJson(response);
  }

  /// Creates an IAM resource policy and assigns it to the specified
  /// investigation group.
  ///
  /// If you create your investigation group with
  /// <code>CreateInvestigationGroup</code> and you want to enable CloudWatch
  /// alarms to create investigations and add events to investigations, you must
  /// use this operation to create a policy similar to this example.
  ///
  /// <code> { "Version": "2008-10-17", "Statement": [ { "Effect": "Allow",
  /// "Principal": { "Service": "aiops.alarms.cloudwatch.amazonaws.com" },
  /// "Action": [ "aiops:CreateInvestigation", "aiops:CreateInvestigationEvent"
  /// ], "Resource": "*", "Condition": { "StringEquals": { "aws:SourceAccount":
  /// "account-id" }, "ArnLike": { "aws:SourceArn":
  /// "arn:aws:cloudwatch:region:account-id:alarm:*" } } } ] } </code>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Specify either the name or the ARN of the investigation group that you
  /// want to assign the policy to.
  ///
  /// Parameter [policy] :
  /// The policy, in JSON format.
  Future<PutInvestigationGroupPolicyResponse> putInvestigationGroupPolicy({
    required String identifier,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/investigationGroups/${Uri.encodeComponent(identifier)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutInvestigationGroupPolicyResponse.fromJson(response);
  }

  /// Returns the JSON of the IAM resource policy associated with the specified
  /// investigation group in a string. For example,
  /// <code>{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aiops.alarms.cloudwatch.amazonaws.com\"},\"Action\":[\"aiops:CreateInvestigation\",\"aiops:CreateInvestigationEvent\"],\"Resource\":\"*\",\"Condition\":{\"StringEquals\":{\"aws:SourceAccount\":\"111122223333\"},\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:cloudwatch:us-east-1:111122223333:alarm:*\"}}}]}</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Specify either the name or the ARN of the investigation group that you
  /// want to view the policy of.
  Future<GetInvestigationGroupPolicyResponse> getInvestigationGroupPolicy({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/investigationGroups/${Uri.encodeComponent(identifier)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetInvestigationGroupPolicyResponse.fromJson(response);
  }

  /// Removes the IAM resource policy from being associated with the
  /// investigation group that you specify.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identifier] :
  /// Specify either the name or the ARN of the investigation group that you
  /// want to remove the policy from.
  Future<void> deleteInvestigationGroupPolicy({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/investigationGroups/${Uri.encodeComponent(identifier)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class ListTagsForResourceOutput {
  /// The list of tag keys and values associated with the resource you specified.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

class CreateInvestigationGroupOutput {
  /// The ARN of the investigation group that you just created.
  final String? arn;

  CreateInvestigationGroupOutput({
    this.arn,
  });

  factory CreateInvestigationGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateInvestigationGroupOutput(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

class GetInvestigationGroupResponse {
  /// The Amazon Resource Name (ARN) of the investigation group.
  final String? arn;

  /// This structure is a string array. The first string is the ARN of a Amazon
  /// SNS topic. The array of strings display the ARNs of chat applications
  /// configurations that are associated with that topic. For more information
  /// about these configuration ARNs, see <a
  /// href="https://docs.aws.amazon.com/chatbot/latest/adminguide/getting-started.html">Getting
  /// started with Amazon Q in chat applications</a> and <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awschatbot.html#awschatbot-resources-for-iam-policies">Resource
  /// type defined by Amazon Web Services Chatbot</a>.
  final Map<String, List<String>>? chatbotNotificationChannel;

  /// The date and time that the investigation group was created.
  final int? createdAt;

  /// The name of the user who created the investigation group.
  final String? createdBy;

  /// Lists the <code>AWSAccountId</code> of the accounts configured for
  /// cross-account access and the results of the last scan performed on each
  /// account.
  final List<CrossAccountConfiguration>? crossAccountConfigurations;

  /// Specifies the customer managed KMS key that the investigation group uses to
  /// encrypt data, if there is one. If not, the investigation group uses an
  /// Amazon Web Services key to encrypt the data.
  final EncryptionConfiguration? encryptionConfiguration;

  /// Specifies whether CloudWatch investigationshas access to change events that
  /// are recorded by CloudTrail.
  final bool? isCloudTrailEventHistoryEnabled;

  /// The date and time that the investigation group was most recently modified.
  final int? lastModifiedAt;

  /// The name of the user who created the investigation group.
  final String? lastModifiedBy;

  /// The name of the investigation group.
  final String? name;

  /// Specifies how long that investigation data is kept.
  final int? retentionInDays;

  /// The ARN of the IAM role that the investigation group uses for permissions to
  /// gather data.
  final String? roleArn;

  /// Displays the custom tag keys for custom applications in your system that you
  /// have specified in the investigation group. Resource tags help CloudWatch
  /// investigations narrow the search space when it is unable to discover
  /// definite relationships between resources.
  final List<String>? tagKeyBoundaries;

  GetInvestigationGroupResponse({
    this.arn,
    this.chatbotNotificationChannel,
    this.createdAt,
    this.createdBy,
    this.crossAccountConfigurations,
    this.encryptionConfiguration,
    this.isCloudTrailEventHistoryEnabled,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.name,
    this.retentionInDays,
    this.roleArn,
    this.tagKeyBoundaries,
  });

  factory GetInvestigationGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetInvestigationGroupResponse(
      arn: json['arn'] as String?,
      chatbotNotificationChannel:
          (json['chatbotNotificationChannel'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())),
      createdAt: json['createdAt'] as int?,
      createdBy: json['createdBy'] as String?,
      crossAccountConfigurations: (json['crossAccountConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              CrossAccountConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      isCloudTrailEventHistoryEnabled:
          json['isCloudTrailEventHistoryEnabled'] as bool?,
      lastModifiedAt: json['lastModifiedAt'] as int?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      name: json['name'] as String?,
      retentionInDays: json['retentionInDays'] as int?,
      roleArn: json['roleArn'] as String?,
      tagKeyBoundaries: (json['tagKeyBoundaries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final chatbotNotificationChannel = this.chatbotNotificationChannel;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final crossAccountConfigurations = this.crossAccountConfigurations;
    final encryptionConfiguration = this.encryptionConfiguration;
    final isCloudTrailEventHistoryEnabled =
        this.isCloudTrailEventHistoryEnabled;
    final lastModifiedAt = this.lastModifiedAt;
    final lastModifiedBy = this.lastModifiedBy;
    final name = this.name;
    final retentionInDays = this.retentionInDays;
    final roleArn = this.roleArn;
    final tagKeyBoundaries = this.tagKeyBoundaries;
    return {
      if (arn != null) 'arn': arn,
      if (chatbotNotificationChannel != null)
        'chatbotNotificationChannel': chatbotNotificationChannel,
      if (createdAt != null) 'createdAt': createdAt,
      if (createdBy != null) 'createdBy': createdBy,
      if (crossAccountConfigurations != null)
        'crossAccountConfigurations': crossAccountConfigurations,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (isCloudTrailEventHistoryEnabled != null)
        'isCloudTrailEventHistoryEnabled': isCloudTrailEventHistoryEnabled,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt,
      if (lastModifiedBy != null) 'lastModifiedBy': lastModifiedBy,
      if (name != null) 'name': name,
      if (retentionInDays != null) 'retentionInDays': retentionInDays,
      if (roleArn != null) 'roleArn': roleArn,
      if (tagKeyBoundaries != null) 'tagKeyBoundaries': tagKeyBoundaries,
    };
  }
}

class UpdateInvestigationGroupOutput {
  UpdateInvestigationGroupOutput();

  factory UpdateInvestigationGroupOutput.fromJson(Map<String, dynamic> _) {
    return UpdateInvestigationGroupOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListInvestigationGroupsOutput {
  /// An array of structures, where each structure contains the information about
  /// one investigation group in the account.
  final List<ListInvestigationGroupsModel>? investigationGroups;

  /// Include this value in your next use of this operation to get the next set of
  /// service operations.
  final String? nextToken;

  ListInvestigationGroupsOutput({
    this.investigationGroups,
    this.nextToken,
  });

  factory ListInvestigationGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListInvestigationGroupsOutput(
      investigationGroups: (json['investigationGroups'] as List?)
          ?.nonNulls
          .map((e) =>
              ListInvestigationGroupsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final investigationGroups = this.investigationGroups;
    final nextToken = this.nextToken;
    return {
      if (investigationGroups != null)
        'investigationGroups': investigationGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class PutInvestigationGroupPolicyResponse {
  /// The ARN of the investigation group that will use this policy.
  final String? investigationGroupArn;

  PutInvestigationGroupPolicyResponse({
    this.investigationGroupArn,
  });

  factory PutInvestigationGroupPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PutInvestigationGroupPolicyResponse(
      investigationGroupArn: json['investigationGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final investigationGroupArn = this.investigationGroupArn;
    return {
      if (investigationGroupArn != null)
        'investigationGroupArn': investigationGroupArn,
    };
  }
}

class GetInvestigationGroupPolicyResponse {
  /// The Amazon Resource Name (ARN) of the investigation group that you want to
  /// view the policy of.
  final String? investigationGroupArn;

  /// The policy, in JSON format.
  final String? policy;

  GetInvestigationGroupPolicyResponse({
    this.investigationGroupArn,
    this.policy,
  });

  factory GetInvestigationGroupPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInvestigationGroupPolicyResponse(
      investigationGroupArn: json['investigationGroupArn'] as String?,
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final investigationGroupArn = this.investigationGroupArn;
    final policy = this.policy;
    return {
      if (investigationGroupArn != null)
        'investigationGroupArn': investigationGroupArn,
      if (policy != null) 'policy': policy,
    };
  }
}

class DeleteInvestigationGroupPolicyOutput {
  DeleteInvestigationGroupPolicyOutput();

  factory DeleteInvestigationGroupPolicyOutput.fromJson(
      Map<String, dynamic> _) {
    return DeleteInvestigationGroupPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This structure contains information about one investigation group in the
/// account.
class ListInvestigationGroupsModel {
  /// The Amazon Resource Name (ARN) of the investigation group.
  final String? arn;

  /// The name of the investigation group.
  final String? name;

  ListInvestigationGroupsModel({
    this.arn,
    this.name,
  });

  factory ListInvestigationGroupsModel.fromJson(Map<String, dynamic> json) {
    return ListInvestigationGroupsModel(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
    };
  }
}

/// Use this structure to specify a customer managed KMS key to use to encrypt
/// investigation data.
class EncryptionConfiguration {
  /// If the investigation group uses a customer managed key for encryption, this
  /// field displays the ID of that key.
  final String? kmsKeyId;

  /// Displays whether investigation data is encrypted by a customer managed key
  /// or an Amazon Web Services owned key.
  final EncryptionConfigurationType? type;

  EncryptionConfiguration({
    this.kmsKeyId,
    this.type,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      kmsKeyId: json['kmsKeyId'] as String?,
      type: (json['type'] as String?)
          ?.let(EncryptionConfigurationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final type = this.type;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (type != null) 'type': type.value,
    };
  }
}

/// This structure contains information about the cross-account configuration in
/// the account.
class CrossAccountConfiguration {
  /// The ARN of an existing role which will be used to do investigations on your
  /// behalf.
  final String? sourceRoleArn;

  CrossAccountConfiguration({
    this.sourceRoleArn,
  });

  factory CrossAccountConfiguration.fromJson(Map<String, dynamic> json) {
    return CrossAccountConfiguration(
      sourceRoleArn: json['sourceRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceRoleArn = this.sourceRoleArn;
    return {
      if (sourceRoleArn != null) 'sourceRoleArn': sourceRoleArn,
    };
  }
}

class EncryptionConfigurationType {
  static const awsOwnedKey = EncryptionConfigurationType._('AWS_OWNED_KEY');
  static const customerManagedKmsKey =
      EncryptionConfigurationType._('CUSTOMER_MANAGED_KMS_KEY');

  final String value;

  const EncryptionConfigurationType._(this.value);

  static const values = [awsOwnedKey, customerManagedKmsKey];

  static EncryptionConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is EncryptionConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
