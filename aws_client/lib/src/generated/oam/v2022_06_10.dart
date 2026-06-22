// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2022_06_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Use Amazon CloudWatch Observability Access Manager to create and manage
/// links between source accounts and monitoring accounts by using <i>CloudWatch
/// cross-account observability</i>. With CloudWatch cross-account
/// observability, you can monitor and troubleshoot applications that span
/// multiple accounts within a Region. Seamlessly search, visualize, and analyze
/// your metrics, logs, traces, Application Signals services and service level
/// objectives (SLOs), Application Insights applications, and internet monitors
/// in any of the linked accounts without account boundaries.
///
/// Set up one or more Amazon Web Services accounts as <i>monitoring
/// accounts</i> and link them with multiple <i>source accounts</i>. A
/// monitoring account is a central Amazon Web Services account that can view
/// and interact with observability data generated from source accounts. A
/// source account is an individual Amazon Web Services account that generates
/// observability data for the resources that reside in it. Source accounts
/// share their observability data with the monitoring account. The shared
/// observability data can include metrics in Amazon CloudWatch, logs in Amazon
/// CloudWatch Logs, traces in X-Ray, Application Signals services and service
/// level objectives (SLOs), applications in Amazon CloudWatch Application
/// Insights, and internet monitors in CloudWatch Internet Monitor.
///
/// When you set up a link, you can choose to share the metrics from all
/// namespaces with the monitoring account, or filter to a subset of namespaces.
/// And for CloudWatch Logs, you can choose to share all log groups with the
/// monitoring account, or filter to a subset of log groups.
class Oam {
  final _s.RestJsonProtocol _protocol;
  factory Oam({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'oam',
    );
    return Oam._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Oam._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a link between a source account and a sink that you have created
  /// in a monitoring account. After the link is created, data is sent from the
  /// source account to the monitoring account. When you create a link, you can
  /// optionally specify filters that specify which metric namespaces and which
  /// log groups are shared from the source account to the monitoring account.
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
  /// May throw [ConflictException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServiceQuotaExceededException].
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
  /// </ul> <note>
  /// In the Amazon Web Services GovCloud (US-East) and Amazon Web Services
  /// GovCloud (US-West) Regions, the only supported option is to use custom
  /// labels, and the <code>$AccountName</code>, <code>$AccountEmail</code>, and
  /// <code>$AccountEmailNoDomain</code> variables all resolve as
  /// <i>account-id</i> instead of the specified variable.
  /// </note>
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
  /// Parameter [linkConfiguration] :
  /// Use this structure to optionally create filters that specify that only
  /// some metric namespaces or log groups are to be shared from the source
  /// account to the monitoring account.
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
    LinkConfiguration? linkConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'LabelTemplate': labelTemplate,
      'ResourceTypes': resourceTypes.map((e) => e.value).toList(),
      'SinkIdentifier': sinkIdentifier,
      if (linkConfiguration != null) 'LinkConfiguration': linkConfiguration,
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
  /// Each account can contain one sink per Region. If you delete a sink, you
  /// can then create a new one in that Region.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServiceQuotaExceededException].
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
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
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
  /// May throw [ConflictException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
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
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the link to retrieve information for.
  ///
  /// Parameter [includeTags] :
  /// Specifies whether to include the tags associated with the link in the
  /// response. When <code>IncludeTags</code> is set to <code>true</code> and
  /// the caller has the required permission,
  /// <code>oam:ListTagsForResource</code>, the API will return the tags for the
  /// specified resource. If the caller doesn't have the required permission,
  /// <code>oam:ListTagsForResource</code>, the API will raise an exception.
  ///
  /// The default value is <code>false</code>.
  Future<GetLinkOutput> getLink({
    required String identifier,
    bool? includeTags,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
      if (includeTags != null) 'IncludeTags': includeTags,
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
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The ARN of the sink to retrieve information for.
  ///
  /// Parameter [includeTags] :
  /// Specifies whether to include the tags associated with the sink in the
  /// response. When <code>IncludeTags</code> is set to <code>true</code> and
  /// the caller has the required permission,
  /// <code>oam:ListTagsForResource</code>, the API will return the tags for the
  /// specified resource. If the caller doesn't have the required permission,
  /// <code>oam:ListTagsForResource</code>, the API will raise an exception.
  ///
  /// The default value is <code>false</code>.
  Future<GetSinkOutput> getSink({
    required String identifier,
    bool? includeTags,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
      if (includeTags != null) 'IncludeTags': includeTags,
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
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
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
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// The six types of services with their respective resource types that you
  /// can allow or deny are:
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
  /// <li>
  /// <b>Application Insights - Applications</b> - Specify with
  /// <code>AWS::ApplicationInsights::Application</code>
  /// </li>
  /// <li>
  /// <b>Internet Monitor</b> - Specify with
  /// <code>AWS::InternetMonitor::Monitor</code>
  /// </li>
  /// <li>
  /// <b>Application Signals</b> - Specify with
  /// <code>AWS::ApplicationSignals::Service</code> and
  /// <code>AWS::ApplicationSignals::ServiceLevelObjective</code>
  /// </li>
  /// </ul>
  /// See the examples in this section to see how to specify permitted source
  /// accounts and data types.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// When you update a link, you can optionally specify filters that specify
  /// which metric namespaces and which log groups are shared from the source
  /// account to the monitoring account.
  ///
  /// To update the list of tags associated with the sink, use <a
  /// href="https://docs.aws.amazon.com/OAM/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
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
  ///
  /// Parameter [includeTags] :
  /// Specifies whether to include the tags associated with the link in the
  /// response after the update operation. When <code>IncludeTags</code> is set
  /// to <code>true</code> and the caller has the required permission,
  /// <code>oam:ListTagsForResource</code>, the API will return the tags for the
  /// specified resource. If the caller doesn't have the required permission,
  /// <code>oam:ListTagsForResource</code>, the API will raise an exception.
  ///
  /// The default value is <code>false</code>.
  ///
  /// Parameter [linkConfiguration] :
  /// Use this structure to filter which metric namespaces and which log groups
  /// are to be shared from the source account to the monitoring account.
  Future<UpdateLinkOutput> updateLink({
    required String identifier,
    required List<ResourceType> resourceTypes,
    bool? includeTags,
    LinkConfiguration? linkConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'Identifier': identifier,
      'ResourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (includeTags != null) 'IncludeTags': includeTags,
      if (linkConfiguration != null) 'LinkConfiguration': linkConfiguration,
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

/// @nodoc
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

  /// This structure includes filters that specify which metric namespaces and
  /// which log groups are shared from the source account to the monitoring
  /// account.
  final LinkConfiguration? linkConfiguration;

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
    this.linkConfiguration,
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
      linkConfiguration: json['LinkConfiguration'] != null
          ? LinkConfiguration.fromJson(
              json['LinkConfiguration'] as Map<String, dynamic>)
          : null,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.nonNulls
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
    final linkConfiguration = this.linkConfiguration;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (labelTemplate != null) 'LabelTemplate': labelTemplate,
      if (linkConfiguration != null) 'LinkConfiguration': linkConfiguration,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
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

/// @nodoc
class DeleteLinkOutput {
  DeleteLinkOutput();

  factory DeleteLinkOutput.fromJson(Map<String, dynamic> _) {
    return DeleteLinkOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteSinkOutput {
  DeleteSinkOutput();

  factory DeleteSinkOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSinkOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

  /// This structure includes filters that specify which metric namespaces and
  /// which log groups are shared from the source account to the monitoring
  /// account.
  final LinkConfiguration? linkConfiguration;

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
    this.linkConfiguration,
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
      linkConfiguration: json['LinkConfiguration'] != null
          ? LinkConfiguration.fromJson(
              json['LinkConfiguration'] as Map<String, dynamic>)
          : null,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.nonNulls
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
    final linkConfiguration = this.linkConfiguration;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (labelTemplate != null) 'LabelTemplate': labelTemplate,
      if (linkConfiguration != null) 'LinkConfiguration': linkConfiguration,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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
      items: ((json['Items'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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
      items: ((json['Items'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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
      items: ((json['Items'] as List?) ?? const [])
          .nonNulls
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

  /// This structure includes filters that specify which metric namespaces and
  /// which log groups are shared from the source account to the monitoring
  /// account.
  final LinkConfiguration? linkConfiguration;

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
    this.linkConfiguration,
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
      linkConfiguration: json['LinkConfiguration'] != null
          ? LinkConfiguration.fromJson(
              json['LinkConfiguration'] as Map<String, dynamic>)
          : null,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.nonNulls
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
    final linkConfiguration = this.linkConfiguration;
    final resourceTypes = this.resourceTypes;
    final sinkArn = this.sinkArn;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (labelTemplate != null) 'LabelTemplate': labelTemplate,
      if (linkConfiguration != null) 'LinkConfiguration': linkConfiguration,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Use this structure to optionally create filters that specify that only some
/// metric namespaces or log groups are to be shared from the source account to
/// the monitoring account.
///
/// @nodoc
class LinkConfiguration {
  /// Use this structure to filter which log groups are to send log events from
  /// the source account to the monitoring account.
  final LogGroupConfiguration? logGroupConfiguration;

  /// Use this structure to filter which metric namespaces are to be shared from
  /// the source account to the monitoring account.
  final MetricConfiguration? metricConfiguration;

  LinkConfiguration({
    this.logGroupConfiguration,
    this.metricConfiguration,
  });

  factory LinkConfiguration.fromJson(Map<String, dynamic> json) {
    return LinkConfiguration(
      logGroupConfiguration: json['LogGroupConfiguration'] != null
          ? LogGroupConfiguration.fromJson(
              json['LogGroupConfiguration'] as Map<String, dynamic>)
          : null,
      metricConfiguration: json['MetricConfiguration'] != null
          ? MetricConfiguration.fromJson(
              json['MetricConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupConfiguration = this.logGroupConfiguration;
    final metricConfiguration = this.metricConfiguration;
    return {
      if (logGroupConfiguration != null)
        'LogGroupConfiguration': logGroupConfiguration,
      if (metricConfiguration != null)
        'MetricConfiguration': metricConfiguration,
    };
  }
}

/// This structure contains the <code>Filter</code> parameter which you can use
/// to specify which log groups are to share log events from this source account
/// to the monitoring account.
///
/// @nodoc
class LogGroupConfiguration {
  /// Use this field to specify which log groups are to share their log events
  /// with the monitoring account. Use the term <code>LogGroupName</code> and one
  /// or more of the following operands. Use single quotation marks (') around log
  /// group names. The matching of log group names is case sensitive. Each filter
  /// has a limit of five conditional operands. Conditional operands are
  /// <code>AND</code> and <code>OR</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>=</code> and <code>!=</code>
  /// </li>
  /// <li>
  /// <code>AND</code>
  /// </li>
  /// <li>
  /// <code>OR</code>
  /// </li>
  /// <li>
  /// <code>LIKE</code> and <code>NOT LIKE</code>. These can be used only as
  /// prefix searches. Include a <code>%</code> at the end of the string that you
  /// want to search for and include.
  /// </li>
  /// <li>
  /// <code>IN</code> and <code>NOT IN</code>, using parentheses <code>( )</code>
  /// </li>
  /// </ul>
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>LogGroupName IN ('This-Log-Group', 'Other-Log-Group')</code> includes
  /// only the log groups with names <code>This-Log-Group</code> and
  /// <code>Other-Log-Group</code>.
  /// </li>
  /// <li>
  /// <code>LogGroupName NOT IN ('Private-Log-Group',
  /// 'Private-Log-Group-2')</code> includes all log groups except the log groups
  /// with names <code>Private-Log-Group</code> and
  /// <code>Private-Log-Group-2</code>.
  /// </li>
  /// <li>
  /// <code>LogGroupName LIKE 'aws/lambda/%' OR LogGroupName LIKE
  /// 'AWSLogs%'</code> includes all log groups that have names that start with
  /// <code>aws/lambda/</code> or <code>AWSLogs</code>.
  /// </li>
  /// </ul> <note>
  /// If you are updating a link that uses filters, you can specify <code>*</code>
  /// as the only value for the <code>filter</code> parameter to delete the filter
  /// and share all log groups with the monitoring account.
  /// </note>
  final String filter;

  LogGroupConfiguration({
    required this.filter,
  });

  factory LogGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return LogGroupConfiguration(
      filter: (json['Filter'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    return {
      'Filter': filter,
    };
  }
}

/// This structure contains the <code>Filter</code> parameter which you can use
/// to specify which metric namespaces are to be shared from this source account
/// to the monitoring account.
///
/// @nodoc
class MetricConfiguration {
  /// Use this field to specify which metrics are to be shared with the monitoring
  /// account. Use the term <code>Namespace</code> and one or more of the
  /// following operands. Use single quotation marks (') around namespace names.
  /// The matching of namespace names is case sensitive. Each filter has a limit
  /// of five conditional operands. Conditional operands are <code>AND</code> and
  /// <code>OR</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>=</code> and <code>!=</code>
  /// </li>
  /// <li>
  /// <code>AND</code>
  /// </li>
  /// <li>
  /// <code>OR</code>
  /// </li>
  /// <li>
  /// <code>LIKE</code> and <code>NOT LIKE</code>. These can be used only as
  /// prefix searches. Include a <code>%</code> at the end of the string that you
  /// want to search for and include.
  /// </li>
  /// <li>
  /// <code>IN</code> and <code>NOT IN</code>, using parentheses <code>( )</code>
  /// </li>
  /// </ul>
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>Namespace NOT LIKE 'AWS/%'</code> includes only namespaces that don't
  /// start with <code>AWS/</code>, such as custom namespaces.
  /// </li>
  /// <li>
  /// <code>Namespace IN ('AWS/EC2', 'AWS/ELB', 'AWS/S3')</code> includes only the
  /// metrics in the EC2, Elastic Load Balancing, and Amazon S3 namespaces.
  /// </li>
  /// <li>
  /// <code>Namespace = 'AWS/EC2' OR Namespace NOT LIKE 'AWS/%'</code> includes
  /// only the EC2 namespace and your custom namespaces.
  /// </li>
  /// </ul> <note>
  /// If you are updating a link that uses filters, you can specify <code>*</code>
  /// as the only value for the <code>filter</code> parameter to delete the filter
  /// and share all metric namespaces with the monitoring account.
  /// </note>
  final String filter;

  MetricConfiguration({
    required this.filter,
  });

  factory MetricConfiguration.fromJson(Map<String, dynamic> json) {
    return MetricConfiguration(
      filter: (json['Filter'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    return {
      'Filter': filter,
    };
  }
}

/// @nodoc
class ResourceType {
  static const awsCloudWatchMetric = ResourceType._('AWS::CloudWatch::Metric');
  static const awsLogsLogGroup = ResourceType._('AWS::Logs::LogGroup');
  static const awsXRayTrace = ResourceType._('AWS::XRay::Trace');
  static const awsApplicationInsightsApplication =
      ResourceType._('AWS::ApplicationInsights::Application');
  static const awsInternetMonitorMonitor =
      ResourceType._('AWS::InternetMonitor::Monitor');
  static const awsApplicationSignalsService =
      ResourceType._('AWS::ApplicationSignals::Service');
  static const awsApplicationSignalsServiceLevelObjective =
      ResourceType._('AWS::ApplicationSignals::ServiceLevelObjective');

  final String value;

  const ResourceType._(this.value);

  static const values = [
    awsCloudWatchMetric,
    awsLogsLogGroup,
    awsXRayTrace,
    awsApplicationInsightsApplication,
    awsInternetMonitorMonitor,
    awsApplicationSignalsService,
    awsApplicationSignalsServiceLevelObjective
  ];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains information about one of this monitoring account's
/// sinks.
///
/// @nodoc
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

/// A structure that contains information about one of this source account's
/// links to a monitoring account.
///
/// @nodoc
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
          ?.nonNulls
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

/// A structure that contains information about one link attached to this
/// monitoring account sink.
///
/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServiceFault extends _s.GenericAwsException {
  InternalServiceFault({String? type, String? message})
      : super(type: type, code: 'InternalServiceFault', message: message);
}

/// @nodoc
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

/// @nodoc
class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

/// @nodoc
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
