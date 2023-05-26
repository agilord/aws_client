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

/// Use Amazon CloudWatch Observability Access Manager to create and manage
/// links between source accounts and monitoring accounts by using <i>CloudWatch
/// cross-account observability</i>. With CloudWatch cross-account
/// observability, you can monitor and troubleshoot applications that span
/// multiple accounts within a Region. Seamlessly search, visualize, and analyze
/// your metrics, logs, and traces in any of the linked accounts without account
/// boundaries.
/// <pre><code> &lt;p&gt;Set up one or more Amazon Web Services accounts as
/// &lt;i&gt;monitoring accounts&lt;/i&gt; and link them with multiple
/// &lt;i&gt;source accounts&lt;/i&gt;. A monitoring account is a central Amazon
/// Web Services account that can view and interact with observability data
/// generated from source accounts. A source account is an individual Amazon Web
/// Services account that generates observability data for the resources that
/// reside in it. Source accounts share their observability data with the
/// monitoring account. The shared observability data can include metrics in
/// Amazon CloudWatch, logs in Amazon CloudWatch Logs, and traces in
/// X-Ray.&lt;/p&gt; </code></pre>
class CloudWatchObservabilityAccessManager {
  final _s.RestJsonProtocol _protocol;
  CloudWatchObservabilityAccessManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'oam',
            signingName: 'oam',
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

  /// Creates a link between a source account and a sink that you have created
  /// in a monitoring account.
  ///
  /// Before you create a link, you must create a sink in the monitoring account
  /// and create a sink policy in that account. The sink policy must permit the
  /// source account to link to it. You can grant permission to source accounts
  /// by granting permission to an entire organization or to individual
  /// accounts.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_CreateSink.html">CreateSink</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_PutSinkPolicy.html">PutSinkPolicy</a>.
  ///
  /// Each monitoring account can be linked to as many as 100,000 source
  /// accounts.
  ///
  /// Each source account can be linked to as many as five monitoring accounts.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [ConflictException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [labelTemplate] :
  /// Specify a friendly human-readable name to use to identify this source
  /// account when you are viewing data from it in the monitoring account.
  ///
  /// You can use a custom label or use the following variables:
  ///
  /// <ul>
  /// <li>
  /// <code>$AccountName</code> is the name of the account
  /// </li>
  /// <li>
  /// <code>$AccountEmail</code> is the globally unique email address of the
  /// account
  /// </li>
  /// <li>
  /// <code>$AccountEmailNoDomain</code> is the email address of the account
  /// without the domain name
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceTypes] :
  /// An array of strings that define which types of data that the source
  /// account shares with the monitoring account.
  ///
  /// Parameter [sinkIdentifier] :
  /// The ARN of the sink to use to create this link. You can use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_ListSinks.html">ListSinks</a>
  /// to find the ARNs of sinks.
  ///
  /// For more information about sinks, see <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_CreateSink.html">CreateSink</a>.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the link.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// For more information about using tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
  /// access to Amazon Web Services resources using tags</a>.
  Future<CreateLinkOutput> createLink({
    required String labelTemplate,
    required List<ResourceType> resourceTypes,
    required String sinkIdentifier,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'LabelTemplate': labelTemplate,
      'ResourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
      'SinkIdentifier': sinkIdentifier,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLink',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLinkOutput.fromJson(response);
  }

  /// Use this to create a <i>sink</i> in the current account, so that it can be
  /// used as a monitoring account in CloudWatch cross-account observability. A
  /// sink is a resource that represents an attachment point in a monitoring
  /// account. Source accounts can link to the sink to send observability data.
  ///
  /// After you create a sink, you must create a sink policy that allows source
  /// accounts to attach to it. For more information, see <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_PutSinkPolicy.html">PutSinkPolicy</a>.
  ///
  /// Each account can contain one sink. If you delete a sink, you can then
  /// create a new one in that account.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [ConflictException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [name] :
  /// A name for the sink.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the link.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// For more information about using tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Controlling
  /// access to Amazon Web Services resources using tags</a>.
  Future<CreateSinkOutput> createSink({
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateSink',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSinkOutput.fromJson(response);
  }

  /// Deletes a link between a monitoring account sink and a source account. You
  /// must run this operation in the source account.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the link to delete.
  Future<void> deleteLink({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLink',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a sink. You must delete all links to a sink before you can delete
  /// that sink.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [ConflictException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the sink to delete.
  Future<void> deleteSink({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteSink',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns complete information about one link.
  ///
  /// To use this operation, provide the link ARN. To retrieve a list of link
  /// ARNs, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_ListLinks.html">ListLinks</a>.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the link to retrieve information for.
  Future<GetLinkOutput> getLink({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetLink',
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkOutput.fromJson(response);
  }

  /// Returns complete information about one monitoring account sink.
  ///
  /// To use this operation, provide the sink ARN. To retrieve a list of sink
  /// ARNs, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_ListSinks.html">ListSinks</a>.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the sink to retrieve information for.
  Future<GetSinkOutput> getSink({
    required String identifier,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetSink',
      exceptionFnMap: _exceptionFns,
    );
    return GetSinkOutput.fromJson(response);
  }

  /// Returns the current sink policy attached to this sink. The sink policy
  /// specifies what accounts can attach to this sink as source accounts, and
  /// what types of data they can share.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sinkIdentifier] :
  /// The ARN of the sink to retrieve the policy of.
  Future<GetSinkPolicyOutput> getSinkPolicy({
    required String sinkIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'SinkIdentifier': sinkIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetSinkPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return GetSinkPolicyOutput.fromJson(response);
  }

  /// Returns a list of source account links that are linked to this monitoring
  /// account sink.
  ///
  /// To use this operation, provide the sink ARN. To retrieve a list of sink
  /// ARNs, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_ListSinks.html">ListSinks</a>.
  ///
  /// To find a list of links for one source account, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_ListLinks.html">ListLinks</a>.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sinkIdentifier] :
  /// The ARN of the sink that you want to retrieve links for.
  ///
  /// Parameter [maxResults] :
  /// Limits the number of returned links to the specified number.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. You received this token
  /// from a previous call.
  Future<ListAttachedLinksOutput> listAttachedLinks({
    required String sinkIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'SinkIdentifier': sinkIdentifier,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAttachedLinks',
      exceptionFnMap: _exceptionFns,
    );
    return ListAttachedLinksOutput.fromJson(response);
  }

  /// Use this operation in a source account to return a list of links to
  /// monitoring account sinks that this source account has.
  ///
  /// To find a list of links for one monitoring account sink, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_ListAttachedLinks.html">ListAttachedLinks</a>
  /// from within the monitoring account.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Limits the number of returned links to the specified number.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. You received this token
  /// from a previous call.
  Future<ListLinksOutput> listLinks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLinks',
      exceptionFnMap: _exceptionFns,
    );
    return ListLinksOutput.fromJson(response);
  }

  /// Use this operation in a monitoring account to return the list of sinks
  /// created in that account.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// Limits the number of returned links to the specified number.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of items to return. You received this token
  /// from a previous call.
  Future<ListSinksOutput> listSinks({
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
      requestUri: '/ListSinks',
      exceptionFnMap: _exceptionFns,
    );
    return ListSinksOutput.fromJson(response);
  }

  /// Displays the tags associated with a resource. Both sinks and links support
  /// tagging.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you want to view tags for.
  ///
  /// The ARN format of a sink is
  /// <code>arn:aws:oam:<i>Region</i>:<i>account-id</i>:sink/<i>sink-id</i>
  /// </code>
  ///
  /// The ARN format of a link is
  /// <code>arn:aws:oam:<i>Region</i>:<i>account-id</i>:link/<i>link-id</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch
  /// Logs resources and operations</a>.
  /// <important>
  /// Unlike tagging permissions in other Amazon Web Services services, to
  /// retrieve the list of tags for links or sinks you must have the
  /// <code>oam:RequestTag</code> permission. The <code>aws:ReguestTag</code>
  /// permission does not allow you to tag and untag links and sinks.
  /// </important>
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

  /// Creates or updates the resource policy that grants permissions to source
  /// accounts to link to the monitoring account sink. When you create a sink
  /// policy, you can grant permissions to all accounts in an organization or to
  /// individual accounts.
  ///
  /// You can also use a sink policy to limit the types of data that is shared.
  /// The three types that you can allow or deny are:
  ///
  /// <ul>
  /// <li>
  /// <b>Metrics</b> - Specify with <code>AWS::CloudWatch::Metric</code>
  /// </li>
  /// <li>
  /// <b>Log groups</b> - Specify with <code>AWS::Logs::LogGroup</code>
  /// </li>
  /// <li>
  /// <b>Traces</b> - Specify with <code>AWS::XRay::Trace</code>
  /// </li>
  /// </ul>
  /// See the examples in this section to see how to specify permitted source
  /// accounts and data types.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [policy] :
  /// The JSON policy to use. If you are updating an existing policy, the entire
  /// existing policy is replaced by what you specify here.
  ///
  /// The policy must be in JSON string format with quotation marks escaped and
  /// no newlines.
  ///
  /// For examples of different types of policies, see the <b>Examples</b>
  /// section on this page.
  ///
  /// Parameter [sinkIdentifier] :
  /// The ARN of the sink to attach this policy to.
  Future<PutSinkPolicyOutput> putSinkPolicy({
    required String policy,
    required String sinkIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
      'SinkIdentifier': sinkIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutSinkPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutSinkPolicyOutput.fromJson(response);
  }

  /// Assigns one or more tags (key-value pairs) to the specified resource. Both
  /// sinks and links can be tagged.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key for the alarm, this tag is
  /// appended to the list of tags associated with the alarm. If you specify a
  /// tag key that is already associated with the alarm, the new tag value that
  /// you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  /// <important>
  /// Unlike tagging permissions in other Amazon Web Services services, to tag
  /// or untag links and sinks you must have the <code>oam:ResourceTag</code>
  /// permission. The <code>iam:ResourceTag</code> permission does not allow you
  /// to tag and untag links and sinks.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you're adding tags to.
  ///
  /// The ARN format of a sink is
  /// <code>arn:aws:oam:<i>Region</i>:<i>account-id</i>:sink/<i>sink-id</i>
  /// </code>
  ///
  /// The ARN format of a link is
  /// <code>arn:aws:oam:<i>Region</i>:<i>account-id</i>:link/<i>link-id</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch
  /// Logs resources and operations</a>.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  /// <important>
  /// Unlike tagging permissions in other Amazon Web Services services, to tag
  /// or untag links and sinks you must have the <code>oam:ResourceTag</code>
  /// permission. The <code>iam:TagResource</code> permission does not allow you
  /// to tag and untag links and sinks.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you're removing tags from.
  ///
  /// The ARN format of a sink is
  /// <code>arn:aws:oam:<i>Region</i>:<i>account-id</i>:sink/<i>sink-id</i>
  /// </code>
  ///
  /// The ARN format of a link is
  /// <code>arn:aws:oam:<i>Region</i>:<i>account-id</i>:link/<i>link-id</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html">CloudWatch
  /// Logs resources and operations</a>.
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

  /// Use this operation to change what types of data are shared from a source
  /// account to its linked monitoring account sink. You can't change the sink
  /// or change the monitoring account with this operation.
  ///
  /// To update the list of tags associated with the sink, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the link that you want to update.
  ///
  /// Parameter [resourceTypes] :
  /// An array of strings that define which types of data that the source
  /// account will send to the monitoring account.
  ///
  /// Your input here replaces the current set of data types that are shared.
  Future<UpdateLinkOutput> updateLink({
    required String identifier,
    required List<ResourceType> resourceTypes,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
      'ResourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLink',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLinkOutput.fromJson(response);
  }
}

class CreateLinkOutput {
  /// The ARN of the link that is newly created.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the link
  /// ARN.
  final String? id;

  /// The label that you assigned to this link. If the <code>labelTemplate</code>
  /// includes variables, this field displays the variables resolved to their
  /// actual values.
  final String? label;

  /// The exact label template that you specified, with the variables not
  /// resolved.
  final String? labelTemplate;

  /// The resource types supported by this link.
  final List<String>? resourceTypes;

  /// The ARN of the sink that is used for this link.
  final String? sinkArn;

  /// The tags assigned to the link.
  final Map<String, String>? tags;

  CreateLinkOutput({
    this.arn,
    this.id,
    this.label,
    this.labelTemplate,
    this.resourceTypes,
    this.sinkArn,
    this.tags,
  });

  factory CreateLinkOutput.fromJson(Map<String, dynamic> json) {
    return CreateLinkOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      label: json['Label'] as String?,
      labelTemplate: json['LabelTemplate'] as String?,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sinkArn: json['SinkArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final label = this.label;
    final labelTemplate = this.labelTemplate;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (labelTemplate != null) 'LabelTemplate': labelTemplate,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateSinkOutput {
  /// The ARN of the sink that is newly created.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the sink
  /// ARN.
  final String? id;

  /// The name of the sink.
  final String? name;

  /// The tags assigned to the sink.
  final Map<String, String>? tags;

  CreateSinkOutput({
    this.arn,
    this.id,
    this.name,
    this.tags,
  });

  factory CreateSinkOutput.fromJson(Map<String, dynamic> json) {
    return CreateSinkOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DeleteLinkOutput {
  DeleteLinkOutput();

  factory DeleteLinkOutput.fromJson(Map<String, dynamic> _) {
    return DeleteLinkOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSinkOutput {
  DeleteSinkOutput();

  factory DeleteSinkOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSinkOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetLinkOutput {
  /// The ARN of the link.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the link
  /// ARN.
  final String? id;

  /// The label that you assigned to this link, with the variables resolved to
  /// their actual values.
  final String? label;

  /// The exact label template that was specified when the link was created, with
  /// the template variables not resolved.
  final String? labelTemplate;

  /// The resource types supported by this link.
  final List<String>? resourceTypes;

  /// The ARN of the sink that is used for this link.
  final String? sinkArn;

  /// The tags assigned to the link.
  final Map<String, String>? tags;

  GetLinkOutput({
    this.arn,
    this.id,
    this.label,
    this.labelTemplate,
    this.resourceTypes,
    this.sinkArn,
    this.tags,
  });

  factory GetLinkOutput.fromJson(Map<String, dynamic> json) {
    return GetLinkOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      label: json['Label'] as String?,
      labelTemplate: json['LabelTemplate'] as String?,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sinkArn: json['SinkArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final label = this.label;
    final labelTemplate = this.labelTemplate;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (labelTemplate != null) 'LabelTemplate': labelTemplate,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetSinkOutput {
  /// The ARN of the sink.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the sink
  /// ARN.
  final String? id;

  /// The name of the sink.
  final String? name;

  /// The tags assigned to the sink.
  final Map<String, String>? tags;

  GetSinkOutput({
    this.arn,
    this.id,
    this.name,
    this.tags,
  });

  factory GetSinkOutput.fromJson(Map<String, dynamic> json) {
    return GetSinkOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetSinkPolicyOutput {
  /// The policy that you specified, in JSON format.
  final String? policy;

  /// The ARN of the sink.
  final String? sinkArn;

  /// The random ID string that Amazon Web Services generated as part of the sink
  /// ARN.
  final String? sinkId;

  GetSinkPolicyOutput({
    this.policy,
    this.sinkArn,
    this.sinkId,
  });

  factory GetSinkPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetSinkPolicyOutput(
      policy: json['Policy'] as String?,
      sinkArn: json['SinkArn'] as String?,
      sinkId: json['SinkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final sinkArn = this.sinkArn;
    final sinkId = this.sinkId;
    return {
      if (policy != null) 'Policy': policy,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (sinkId != null) 'SinkId': sinkId,
    };
  }
}

/// A structure that contains information about one link attached to this
/// monitoring account sink.
class ListAttachedLinksItem {
  /// The label that was assigned to this link at creation, with the variables
  /// resolved to their actual values.
  final String? label;

  /// The ARN of the link.
  final String? linkArn;

  /// The resource types supported by this link.
  final List<String>? resourceTypes;

  ListAttachedLinksItem({
    this.label,
    this.linkArn,
    this.resourceTypes,
  });

  factory ListAttachedLinksItem.fromJson(Map<String, dynamic> json) {
    return ListAttachedLinksItem(
      label: json['Label'] as String?,
      linkArn: json['LinkArn'] as String?,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final linkArn = this.linkArn;
    final resourceTypes = this.resourceTypes;
    return {
      if (label != null) 'Label': label,
      if (linkArn != null) 'LinkArn': linkArn,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
    };
  }
}

class ListAttachedLinksOutput {
  /// An array of structures that contain the information about the attached
  /// links.
  final List<ListAttachedLinksItem> items;

  /// The token to use when requesting the next set of links.
  final String? nextToken;

  ListAttachedLinksOutput({
    required this.items,
    this.nextToken,
  });

  factory ListAttachedLinksOutput.fromJson(Map<String, dynamic> json) {
    return ListAttachedLinksOutput(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => ListAttachedLinksItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that contains information about one of this source account's
/// links to a monitoring account.
class ListLinksItem {
  /// The ARN of the link.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the link
  /// ARN.
  final String? id;

  /// The label that was assigned to this link at creation, with the variables
  /// resolved to their actual values.
  final String? label;

  /// The resource types supported by this link.
  final List<String>? resourceTypes;

  /// The ARN of the sink that this link is attached to.
  final String? sinkArn;

  ListLinksItem({
    this.arn,
    this.id,
    this.label,
    this.resourceTypes,
    this.sinkArn,
  });

  factory ListLinksItem.fromJson(Map<String, dynamic> json) {
    return ListLinksItem(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      label: json['Label'] as String?,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sinkArn: json['SinkArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final label = this.label;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
    };
  }
}

class ListLinksOutput {
  /// An array of structures that contain the information about the returned
  /// links.
  final List<ListLinksItem> items;

  /// The token to use when requesting the next set of links.
  final String? nextToken;

  ListLinksOutput({
    required this.items,
    this.nextToken,
  });

  factory ListLinksOutput.fromJson(Map<String, dynamic> json) {
    return ListLinksOutput(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => ListLinksItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that contains information about one of this monitoring account's
/// sinks.
class ListSinksItem {
  /// The ARN of the sink.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the sink
  /// ARN.
  final String? id;

  /// The name of the sink.
  final String? name;

  ListSinksItem({
    this.arn,
    this.id,
    this.name,
  });

  factory ListSinksItem.fromJson(Map<String, dynamic> json) {
    return ListSinksItem(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

class ListSinksOutput {
  /// An array of structures that contain the information about the returned
  /// sinks.
  final List<ListSinksItem> items;

  /// The token to use when requesting the next set of sinks.
  final String? nextToken;

  ListSinksOutput({
    required this.items,
    this.nextToken,
  });

  factory ListSinksOutput.fromJson(Map<String, dynamic> json) {
    return ListSinksOutput(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => ListSinksItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// The list of tags associated with the requested resource.&gt;
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class PutSinkPolicyOutput {
  /// The policy that you specified.
  final String? policy;

  /// The ARN of the sink.
  final String? sinkArn;

  /// The random ID string that Amazon Web Services generated as part of the sink
  /// ARN.
  final String? sinkId;

  PutSinkPolicyOutput({
    this.policy,
    this.sinkArn,
    this.sinkId,
  });

  factory PutSinkPolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutSinkPolicyOutput(
      policy: json['Policy'] as String?,
      sinkArn: json['SinkArn'] as String?,
      sinkId: json['SinkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final sinkArn = this.sinkArn;
    final sinkId = this.sinkId;
    return {
      if (policy != null) 'Policy': policy,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (sinkId != null) 'SinkId': sinkId,
    };
  }
}

enum ResourceType {
  awsCloudWatchMetric,
  awsLogsLogGroup,
  awsXRayTrace,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.awsCloudWatchMetric:
        return 'AWS::CloudWatch::Metric';
      case ResourceType.awsLogsLogGroup:
        return 'AWS::Logs::LogGroup';
      case ResourceType.awsXRayTrace:
        return 'AWS::XRay::Trace';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'AWS::CloudWatch::Metric':
        return ResourceType.awsCloudWatchMetric;
      case 'AWS::Logs::LogGroup':
        return ResourceType.awsLogsLogGroup;
      case 'AWS::XRay::Trace':
        return ResourceType.awsXRayTrace;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLinkOutput {
  /// The ARN of the link that you have updated.
  final String? arn;

  /// The random ID string that Amazon Web Services generated as part of the sink
  /// ARN.
  final String? id;

  /// The label assigned to this link, with the variables resolved to their actual
  /// values.
  final String? label;

  /// The exact label template that was specified when the link was created, with
  /// the template variables not resolved.
  final String? labelTemplate;

  /// The resource types now supported by this link.
  final List<String>? resourceTypes;

  /// The ARN of the sink that is used for this link.
  final String? sinkArn;

  /// The tags assigned to the link.
  final Map<String, String>? tags;

  UpdateLinkOutput({
    this.arn,
    this.id,
    this.label,
    this.labelTemplate,
    this.resourceTypes,
    this.sinkArn,
    this.tags,
  });

  factory UpdateLinkOutput.fromJson(Map<String, dynamic> json) {
    return UpdateLinkOutput(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      label: json['Label'] as String?,
      labelTemplate: json['LabelTemplate'] as String?,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sinkArn: json['SinkArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final label = this.label;
    final labelTemplate = this.labelTemplate;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (labelTemplate != null) 'LabelTemplate': labelTemplate,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServiceFault extends _s.GenericAwsException {
  InternalServiceFault({String? type, String? message})
      : super(type: type, code: 'InternalServiceFault', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServiceFault': (type, message) =>
      InternalServiceFault(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'MissingRequiredParameterException': (type, message) =>
      MissingRequiredParameterException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
