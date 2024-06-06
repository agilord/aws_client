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

/// Amazon Web Services Resource Explorer is a resource search and discovery
/// service. By using Resource Explorer, you can explore your resources using an
/// internet search engine-like experience. Examples of resources include Amazon
/// Relational Database Service (Amazon RDS) instances, Amazon Simple Storage
/// Service (Amazon S3) buckets, or Amazon DynamoDB tables. You can search for
/// your resources using resource metadata like names, tags, and IDs. Resource
/// Explorer can search across all of the Amazon Web Services Regions in your
/// account in which you turn the service on, to simplify your cross-Region
/// workloads.
///
/// Resource Explorer scans the resources in each of the Amazon Web Services
/// Regions in your Amazon Web Services account in which you turn on Resource
/// Explorer. Resource Explorer <a
/// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/getting-started-terms-and-concepts.html#term-index">creates
/// and maintains an index</a> in each Region, with the details of that Region's
/// resources.
///
/// You can <a
/// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-aggregator-region.html">search
/// across all of the indexed Regions in your account</a> by designating one of
/// your Amazon Web Services Regions to contain the aggregator index for the
/// account. When you <a
/// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-aggregator-region-turn-on.html">promote
/// a local index in a Region to become the aggregator index for the
/// account</a>, Resource Explorer automatically replicates the index
/// information from all local indexes in the other Regions to the aggregator
/// index. Therefore, the Region with the aggregator index has a copy of all
/// resource information for all Regions in the account where you turned on
/// Resource Explorer. As a result, views in the aggregator index Region include
/// resources from all of the indexed Regions in your account.
///
/// For more information about Amazon Web Services Resource Explorer, including
/// how to enable and configure the service, see the <a
/// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/">Amazon
/// Web Services Resource Explorer User Guide</a>.
class ResourceExplorer {
  final _s.RestJsonProtocol _protocol;
  ResourceExplorer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'resource-explorer-2',
            signingName: 'resource-explorer-2',
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

  /// Sets the specified view as the default for the Amazon Web Services Region
  /// in which you call this operation. When a user performs a <a>Search</a>
  /// that doesn't explicitly specify which view to use, then Amazon Web
  /// Services Resource Explorer automatically chooses this default view for
  /// searches performed in this Amazon Web Services Region.
  ///
  /// If an Amazon Web Services Region doesn't have a default view configured,
  /// then users must explicitly specify a view with every <code>Search</code>
  /// operation performed in that Region.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [viewArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view to set as the default for the Amazon
  /// Web Services Region and Amazon Web Services account in which you call this
  /// operation. The specified view must already exist in the called Region.
  Future<AssociateDefaultViewOutput> associateDefaultView({
    required String viewArn,
  }) async {
    final $payload = <String, dynamic>{
      'ViewArn': viewArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AssociateDefaultView',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateDefaultViewOutput.fromJson(response);
  }

  /// Retrieves details about a list of views.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [viewArns] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource names (ARNs)</a> that identify the views you want details for.
  Future<BatchGetViewOutput> batchGetView({
    List<String>? viewArns,
  }) async {
    final $payload = <String, dynamic>{
      if (viewArns != null) 'ViewArns': viewArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetView',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetViewOutput.fromJson(response);
  }

  /// Turns on Amazon Web Services Resource Explorer in the Amazon Web Services
  /// Region in which you called this operation by creating an index. Resource
  /// Explorer begins discovering the resources in this Region and stores the
  /// details about the resources in the index so that they can be queried by
  /// using the <a>Search</a> operation. You can create only one index in a
  /// Region.
  /// <note>
  /// This operation creates only a <i>local</i> index. To promote the local
  /// index in one Amazon Web Services Region into the aggregator index for the
  /// Amazon Web Services account, use the <a>UpdateIndexType</a> operation. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-aggregator-region.html">Turning
  /// on cross-Region search by creating an aggregator index</a> in the
  /// <i>Amazon Web Services Resource Explorer User Guide</i>.
  /// </note>
  /// For more details about what happens when you turn on Resource Explorer in
  /// an Amazon Web Services Region, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-service-activate.html">Turn
  /// on Resource Explorer to index your resources in an Amazon Web Services
  /// Region</a> in the <i>Amazon Web Services Resource Explorer User Guide</i>.
  ///
  /// If this is the first Amazon Web Services Region in which you've created an
  /// index for Resource Explorer, then this operation also <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/security_iam_service-linked-roles.html">creates
  /// a service-linked role</a> in your Amazon Web Services account that allows
  /// Resource Explorer to enumerate your resources to populate the index.
  ///
  /// <ul>
  /// <li>
  /// <b>Action</b>: <code>resource-explorer-2:CreateIndex</code>
  ///
  /// <b>Resource</b>: The ARN of the index (as it will exist after the
  /// operation completes) in the Amazon Web Services Region and account in
  /// which you're trying to create the index. Use the wildcard character
  /// (<code>*</code>) at the end of the string to match the eventual UUID. For
  /// example, the following <code>Resource</code> element restricts the role or
  /// user to creating an index in only the <code>us-east-2</code> Region of the
  /// specified account.
  ///
  /// <code>"Resource":
  /// "arn:aws:resource-explorer-2:us-west-2:<i>&lt;account-id&gt;</i>:index/*"</code>
  ///
  /// Alternatively, you can use <code>"Resource": "*"</code> to allow the role
  /// or user to create an index in any Region.
  /// </li>
  /// <li>
  /// <b>Action</b>: <code>iam:CreateServiceLinkedRole</code>
  ///
  /// <b>Resource</b>: No specific resource (*).
  ///
  /// This permission is required only the first time you create an index to
  /// turn on Resource Explorer in the account. Resource Explorer uses this to
  /// create the <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/security_iam_service-linked-roles.html">service-linked
  /// role needed to index the resources in your account</a>. Resource Explorer
  /// uses the same service-linked role for all additional indexes you create
  /// afterwards.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [clientToken] :
  /// This value helps ensure idempotency. Resource Explorer uses this value to
  /// prevent the accidental creation of duplicate versions. We recommend that
  /// you generate a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type
  /// value</a> to ensure the uniqueness of your index.
  ///
  /// Parameter [tags] :
  /// The specified tags are attached only to the index created in this Amazon
  /// Web Services Region. The tags aren't attached to any of the resources
  /// listed in the index.
  Future<CreateIndexOutput> createIndex({
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateIndex',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIndexOutput.fromJson(response);
  }

  /// Creates a view that users can query by using the <a>Search</a> operation.
  /// Results from queries that you make using this view include only resources
  /// that match the view's <code>Filters</code>. For more information about
  /// Amazon Web Services Resource Explorer views, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-views.html">Managing
  /// views</a> in the <i>Amazon Web Services Resource Explorer User Guide</i>.
  ///
  /// Only the principals with an IAM identity-based policy that grants
  /// <code>Allow</code> to the <code>Search</code> action on a
  /// <code>Resource</code> with the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of this view can <a>Search</a> using views you
  /// create with this operation.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [viewName] :
  /// The name of the new view. This name appears in the list of views in
  /// Resource Explorer.
  ///
  /// The name must be no more than 64 characters long, and can include letters,
  /// digits, and the dash (-) character. The name must be unique within its
  /// Amazon Web Services Region.
  ///
  /// Parameter [clientToken] :
  /// This value helps ensure idempotency. Resource Explorer uses this value to
  /// prevent the accidental creation of duplicate versions. We recommend that
  /// you generate a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type
  /// value</a> to ensure the uniqueness of your views.
  ///
  /// Parameter [filters] :
  /// An array of strings that specify which resources are included in the
  /// results of queries made using this view. When you use this view in a
  /// <a>Search</a> operation, the filter string is combined with the search's
  /// <code>QueryString</code> parameter using a logical <code>AND</code>
  /// operator.
  ///
  /// For information about the supported syntax, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html">Search
  /// query reference for Resource Explorer</a> in the <i>Amazon Web Services
  /// Resource Explorer User Guide</i>.
  /// <important>
  /// This query string in the context of this operation supports only <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html#query-syntax-filters">filter
  /// prefixes</a> with optional <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html#query-syntax-operators">operators</a>.
  /// It doesn't support free-form text. For example, the string
  /// <code>region:us* service:ec2 -tag:stage=prod</code> includes all Amazon
  /// EC2 resources in any Amazon Web Services Region that begins with the
  /// letters <code>us</code> and is <i>not</i> tagged with a key
  /// <code>Stage</code> that has the value <code>prod</code>.
  /// </important>
  ///
  /// Parameter [includedProperties] :
  /// Specifies optional fields that you want included in search results from
  /// this view. It is a list of objects that each describe a field to include.
  ///
  /// The default is an empty list, with no optional fields included in the
  /// results.
  ///
  /// Parameter [scope] :
  /// The root ARN of the account, an organizational unit (OU), or an
  /// organization ARN. If left empty, the default is account.
  ///
  /// Parameter [tags] :
  /// Tag key and value pairs that are attached to the view.
  Future<CreateViewOutput> createView({
    required String viewName,
    String? clientToken,
    SearchFilter? filters,
    List<IncludedProperty>? includedProperties,
    String? scope,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ViewName': viewName,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (filters != null) 'Filters': filters,
      if (includedProperties != null) 'IncludedProperties': includedProperties,
      if (scope != null) 'Scope': scope,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateView',
      exceptionFnMap: _exceptionFns,
    );
    return CreateViewOutput.fromJson(response);
  }

  /// Deletes the specified index and turns off Amazon Web Services Resource
  /// Explorer in the specified Amazon Web Services Region. When you delete an
  /// index, Resource Explorer stops discovering and indexing resources in that
  /// Region. Resource Explorer also deletes all views in that Region. These
  /// actions occur as asynchronous background tasks. You can check to see when
  /// the actions are complete by using the <a>GetIndex</a> operation and
  /// checking the <code>Status</code> response value.
  /// <note>
  /// If the index you delete is the aggregator index for the Amazon Web
  /// Services account, you must wait 24 hours before you can promote another
  /// local index to be the aggregator index for the account. Users can't
  /// perform account-wide searches using Resource Explorer until another
  /// aggregator index is configured.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index that you want to delete.
  Future<DeleteIndexOutput> deleteIndex({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteIndex',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteIndexOutput.fromJson(response);
  }

  /// Deletes the specified view.
  ///
  /// If the specified view is the default view for its Amazon Web Services
  /// Region, then all <a>Search</a> operations in that Region must explicitly
  /// specify the view to use until you configure a new default by calling the
  /// <a>AssociateDefaultView</a> operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [viewArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that you want to delete.
  Future<DeleteViewOutput> deleteView({
    required String viewArn,
  }) async {
    final $payload = <String, dynamic>{
      'ViewArn': viewArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteView',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteViewOutput.fromJson(response);
  }

  /// After you call this operation, the affected Amazon Web Services Region no
  /// longer has a default view. All <a>Search</a> operations in that Region
  /// must explicitly specify a view or the operation fails. You can configure a
  /// new default by calling the <a>AssociateDefaultView</a> operation.
  ///
  /// If an Amazon Web Services Region doesn't have a default view configured,
  /// then users must explicitly specify a view with every <code>Search</code>
  /// operation performed in that Region.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<void> disassociateDefaultView() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/DisassociateDefaultView',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the status of your account's Amazon Web Services service access,
  /// and validates the service linked role required to access the multi-account
  /// search feature. Only the management account or a delegated administrator
  /// with service access enabled can invoke this API call.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<GetAccountLevelServiceConfigurationOutput>
      getAccountLevelServiceConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetAccountLevelServiceConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountLevelServiceConfigurationOutput.fromJson(response);
  }

  /// Retrieves the Amazon Resource Name (ARN) of the view that is the default
  /// for the Amazon Web Services Region in which you call this operation. You
  /// can then call <a>GetView</a> to retrieve the details of that view.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<GetDefaultViewOutput> getDefaultView() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetDefaultView',
      exceptionFnMap: _exceptionFns,
    );
    return GetDefaultViewOutput.fromJson(response);
  }

  /// Retrieves details about the Amazon Web Services Resource Explorer index in
  /// the Amazon Web Services Region in which you invoked the operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  Future<GetIndexOutput> getIndex() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/GetIndex',
      exceptionFnMap: _exceptionFns,
    );
    return GetIndexOutput.fromJson(response);
  }

  /// Retrieves details of the specified view.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [viewArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that you want information about.
  Future<GetViewOutput> getView({
    required String viewArn,
  }) async {
    final $payload = <String, dynamic>{
      'ViewArn': viewArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetView',
      exceptionFnMap: _exceptionFns,
    );
    return GetViewOutput.fromJson(response);
  }

  /// Retrieves a list of all of the indexes in Amazon Web Services Regions that
  /// are currently collecting resource information for Amazon Web Services
  /// Resource Explorer.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// appropriate to the operation. If additional items exist beyond those
  /// included in the current response, the <code>NextToken</code> response
  /// element is present and has a value (is not null). Include that value as
  /// the <code>NextToken</code> request parameter in the next call to the
  /// operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from. The pagination tokens expire after 24 hours.
  ///
  /// Parameter [regions] :
  /// If specified, limits the response to only information about the index in
  /// the specified list of Amazon Web Services Regions.
  ///
  /// Parameter [type] :
  /// If specified, limits the output to only indexes of the specified Type,
  /// either <code>LOCAL</code> or <code>AGGREGATOR</code>.
  ///
  /// Use this option to discover the aggregator index for your account.
  Future<ListIndexesOutput> listIndexes({
    int? maxResults,
    String? nextToken,
    List<String>? regions,
    IndexType? type,
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
      if (regions != null) 'Regions': regions,
      if (type != null) 'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListIndexes',
      exceptionFnMap: _exceptionFns,
    );
    return ListIndexesOutput.fromJson(response);
  }

  /// Retrieves a list of a member's indexes in all Amazon Web Services Regions
  /// that are currently collecting resource information for Amazon Web Services
  /// Resource Explorer. Only the management account or a delegated
  /// administrator with service access enabled can invoke this API call.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accountIdList] :
  /// The account IDs will limit the output to only indexes from these accounts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// appropriate to the operation. If additional items exist beyond those
  /// included in the current response, the <code>NextToken</code> response
  /// element is present and has a value (is not null). Include that value as
  /// the <code>NextToken</code> request parameter in the next call to the
  /// operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from. The pagination tokens expire after 24 hours.
  Future<ListIndexesForMembersOutput> listIndexesForMembers({
    required List<String> accountIdList,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $payload = <String, dynamic>{
      'AccountIdList': accountIdList,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListIndexesForMembers',
      exceptionFnMap: _exceptionFns,
    );
    return ListIndexesForMembersOutput.fromJson(response);
  }

  /// Retrieves a list of all resource types currently supported by Amazon Web
  /// Services Resource Explorer.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// appropriate to the operation. If additional items exist beyond those
  /// included in the current response, the <code>NextToken</code> response
  /// element is present and has a value (is not null). Include that value as
  /// the <code>NextToken</code> request parameter in the next call to the
  /// operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from. The pagination tokens expire after 24 hours.
  Future<ListSupportedResourceTypesOutput> listSupportedResourceTypes({
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListSupportedResourceTypes',
      exceptionFnMap: _exceptionFns,
    );
    return ListSupportedResourceTypesOutput.fromJson(response);
  }

  /// Lists the tags that are attached to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view or index that you want to attach tags
  /// to.
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

  /// Lists the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource names (ARNs)</a> of the views available in the Amazon Web
  /// Services Region in which you call this operation.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a paginated operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// appropriate to the operation. If additional items exist beyond those
  /// included in the current response, the <code>NextToken</code> response
  /// element is present and has a value (is not null). Include that value as
  /// the <code>NextToken</code> request parameter in the next call to the
  /// operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from. The pagination tokens expire after 24 hours.
  Future<ListViewsOutput> listViews({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListViews',
      exceptionFnMap: _exceptionFns,
    );
    return ListViewsOutput.fromJson(response);
  }

  /// Searches for resources and displays details about all resources that match
  /// the specified criteria. You must specify a query string.
  ///
  /// All search queries must use a view. If you don't explicitly specify a
  /// view, then Amazon Web Services Resource Explorer uses the default view for
  /// the Amazon Web Services Region in which you call this operation. The
  /// results are the logical intersection of the results that match both the
  /// <code>QueryString</code> parameter supplied to this operation and the
  /// <code>SearchFilter</code> parameter attached to the view.
  ///
  /// For the complete syntax supported by the <code>QueryString</code>
  /// parameter, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/APIReference/about-query-syntax.html">Search
  /// query syntax reference for Resource Explorer</a>.
  ///
  /// If your search results are empty, or are missing results that you think
  /// should be there, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/troubleshooting_search.html">Troubleshooting
  /// Resource Explorer search</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [queryString] :
  /// A string that includes keywords and filters that specify the resources
  /// that you want to include in the results.
  ///
  /// For the complete syntax supported by the <code>QueryString</code>
  /// parameter, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html">Search
  /// query syntax reference for Resource Explorer</a>.
  ///
  /// The search is completely case insensitive. You can specify an empty string
  /// to return all results up to the limit of 1,000 total results.
  /// <note>
  /// The operation can return only the first 1,000 results. If the resource you
  /// want is not included, then use a different value for
  /// <code>QueryString</code> to refine the results.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// appropriate to the operation. If additional items exist beyond those
  /// included in the current response, the <code>NextToken</code> response
  /// element is present and has a value (is not null). Include that value as
  /// the <code>NextToken</code> request parameter in the next call to the
  /// operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from. The pagination tokens expire after 24 hours.
  ///
  /// Parameter [viewArn] :
  /// Specifies the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view to use for the query. If you don't
  /// specify a value for this parameter, then the operation automatically uses
  /// the default view for the Amazon Web Services Region in which you called
  /// this operation. If the Region either doesn't have a default view or if you
  /// don't have permission to use the default view, then the operation fails
  /// with a <code>401 Unauthorized</code> exception.
  Future<SearchOutput> search({
    required String queryString,
    int? maxResults,
    String? nextToken,
    String? viewArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'QueryString': queryString,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (viewArn != null) 'ViewArn': viewArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchOutput.fromJson(response);
  }

  /// Adds one or more tag key and value pairs to an Amazon Web Services
  /// Resource Explorer view or index.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the view or index that you want to
  /// attach tags to.
  ///
  /// Parameter [tags] :
  /// A list of tag key and value pairs that you want to attach to the specified
  /// view or index.
  Future<void> tagResource({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tag key and value pairs from an Amazon Web Services
  /// Resource Explorer view or index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the view or index that you want to
  /// remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys for the tags that you want to remove from the specified
  /// view or index.
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

  /// Changes the type of the index from one of the following types to the
  /// other. For more information about indexes and the role they perform in
  /// Amazon Web Services Resource Explorer, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-aggregator-region.html">Turning
  /// on cross-Region search by creating an aggregator index</a> in the
  /// <i>Amazon Web Services Resource Explorer User Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>AGGREGATOR</code> index type</b>
  ///
  /// The index contains information about resources from all Amazon Web
  /// Services Regions in the Amazon Web Services account in which you've
  /// created a Resource Explorer index. Resource information from all other
  /// Regions is replicated to this Region's index.
  ///
  /// When you change the index type to <code>AGGREGATOR</code>, Resource
  /// Explorer turns on replication of all discovered resource information from
  /// the other Amazon Web Services Regions in your account to this index. You
  /// can then, from this Region only, perform resource search queries that span
  /// all Amazon Web Services Regions in the Amazon Web Services account.
  /// Turning on replication from all other Regions is performed by asynchronous
  /// background tasks. You can check the status of the asynchronous tasks by
  /// using the <a>GetIndex</a> operation. When the asynchronous tasks complete,
  /// the <code>Status</code> response of that operation changes from
  /// <code>UPDATING</code> to <code>ACTIVE</code>. After that, you can start to
  /// see results from other Amazon Web Services Regions in query results.
  /// However, it can take several hours for replication from all other Regions
  /// to complete.
  /// <important>
  /// You can have only one aggregator index per Amazon Web Services account.
  /// Before you can promote a different index to be the aggregator index for
  /// the account, you must first demote the existing aggregator index to type
  /// <code>LOCAL</code>.
  /// </important> </li>
  /// <li>
  /// <b> <code>LOCAL</code> index type</b>
  ///
  /// The index contains information about resources in only the Amazon Web
  /// Services Region in which the index exists. If an aggregator index in
  /// another Region exists, then information in this local index is replicated
  /// to the aggregator index.
  ///
  /// When you change the index type to <code>LOCAL</code>, Resource Explorer
  /// turns off the replication of resource information from all other Amazon
  /// Web Services Regions in the Amazon Web Services account to this Region.
  /// The aggregator index remains in the <code>UPDATING</code> state until all
  /// replication with other Regions successfully stops. You can check the
  /// status of the asynchronous task by using the <a>GetIndex</a> operation.
  /// When Resource Explorer successfully stops all replication with other
  /// Regions, the <code>Status</code> response of that operation changes from
  /// <code>UPDATING</code> to <code>ACTIVE</code>. Separately, the resource
  /// information from other Regions that was previously stored in the index is
  /// deleted within 30 days by another background task. Until that asynchronous
  /// task completes, some results from other Regions can continue to appear in
  /// search results.
  /// <important>
  /// After you demote an aggregator index to a local index, you must wait 24
  /// hours before you can promote another index to be the new aggregator index
  /// for the account.
  /// </important> </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index that you want to update.
  ///
  /// Parameter [type] :
  /// The type of the index. To understand the difference between
  /// <code>LOCAL</code> and <code>AGGREGATOR</code>, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-aggregator-region.html">Turning
  /// on cross-Region search</a> in the <i>Amazon Web Services Resource Explorer
  /// User Guide</i>.
  Future<UpdateIndexTypeOutput> updateIndexType({
    required String arn,
    required IndexType type,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateIndexType',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIndexTypeOutput.fromJson(response);
  }

  /// Modifies some of the details of a view. You can change the filter string
  /// and the list of included properties. You can't change the name of the
  /// view.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [viewArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that you want to modify.
  ///
  /// Parameter [filters] :
  /// An array of strings that specify which resources are included in the
  /// results of queries made using this view. When you use this view in a
  /// <a>Search</a> operation, the filter string is combined with the search's
  /// <code>QueryString</code> parameter using a logical <code>AND</code>
  /// operator.
  ///
  /// For information about the supported syntax, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html">Search
  /// query reference for Resource Explorer</a> in the <i>Amazon Web Services
  /// Resource Explorer User Guide</i>.
  /// <important>
  /// This query string in the context of this operation supports only <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html#query-syntax-filters">filter
  /// prefixes</a> with optional <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/using-search-query-syntax.html#query-syntax-operators">operators</a>.
  /// It doesn't support free-form text. For example, the string
  /// <code>region:us* service:ec2 -tag:stage=prod</code> includes all Amazon
  /// EC2 resources in any Amazon Web Services Region that begins with the
  /// letters <code>us</code> and is <i>not</i> tagged with a key
  /// <code>Stage</code> that has the value <code>prod</code>.
  /// </important>
  ///
  /// Parameter [includedProperties] :
  /// Specifies optional fields that you want included in search results from
  /// this view. It is a list of objects that each describe a field to include.
  ///
  /// The default is an empty list, with no optional fields included in the
  /// results.
  Future<UpdateViewOutput> updateView({
    required String viewArn,
    SearchFilter? filters,
    List<IncludedProperty>? includedProperties,
  }) async {
    final $payload = <String, dynamic>{
      'ViewArn': viewArn,
      if (filters != null) 'Filters': filters,
      if (includedProperties != null) 'IncludedProperties': includedProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateView',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateViewOutput.fromJson(response);
  }
}

enum AWSServiceAccessStatus {
  enabled,
  disabled,
}

extension AWSServiceAccessStatusValueExtension on AWSServiceAccessStatus {
  String toValue() {
    switch (this) {
      case AWSServiceAccessStatus.enabled:
        return 'ENABLED';
      case AWSServiceAccessStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension AWSServiceAccessStatusFromString on String {
  AWSServiceAccessStatus toAWSServiceAccessStatus() {
    switch (this) {
      case 'ENABLED':
        return AWSServiceAccessStatus.enabled;
      case 'DISABLED':
        return AWSServiceAccessStatus.disabled;
    }
    throw Exception('$this is not known in enum AWSServiceAccessStatus');
  }
}

class AssociateDefaultViewOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that the operation set as the default
  /// for queries made in the Amazon Web Services Region and Amazon Web Services
  /// account in which you called this operation.
  final String? viewArn;

  AssociateDefaultViewOutput({
    this.viewArn,
  });

  factory AssociateDefaultViewOutput.fromJson(Map<String, dynamic> json) {
    return AssociateDefaultViewOutput(
      viewArn: json['ViewArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final viewArn = this.viewArn;
    return {
      if (viewArn != null) 'ViewArn': viewArn,
    };
  }
}

/// A collection of error messages for any views that Amazon Web Services
/// Resource Explorer couldn't retrieve details.
class BatchGetViewError {
  /// The description of the error for the specified view.
  final String errorMessage;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view for which Resource Explorer failed to
  /// retrieve details.
  final String viewArn;

  BatchGetViewError({
    required this.errorMessage,
    required this.viewArn,
  });

  factory BatchGetViewError.fromJson(Map<String, dynamic> json) {
    return BatchGetViewError(
      errorMessage: json['ErrorMessage'] as String,
      viewArn: json['ViewArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final viewArn = this.viewArn;
    return {
      'ErrorMessage': errorMessage,
      'ViewArn': viewArn,
    };
  }
}

class BatchGetViewOutput {
  /// If any of the specified ARNs result in an error, then this structure
  /// describes the error.
  final List<BatchGetViewError>? errors;

  /// A structure with a list of objects with details for each of the specified
  /// views.
  final List<View>? views;

  BatchGetViewOutput({
    this.errors,
    this.views,
  });

  factory BatchGetViewOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetViewOutput(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchGetViewError.fromJson(e as Map<String, dynamic>))
          .toList(),
      views: (json['Views'] as List?)
          ?.whereNotNull()
          .map((e) => View.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final views = this.views;
    return {
      if (errors != null) 'Errors': errors,
      if (views != null) 'Views': views,
    };
  }
}

class CreateIndexOutput {
  /// The ARN of the new local index for the Region. You can reference this ARN in
  /// IAM permission policies to authorize the following operations:
  /// <a>DeleteIndex</a> | <a>GetIndex</a> | <a>UpdateIndexType</a> |
  /// <a>CreateView</a>
  final String? arn;

  /// The date and timestamp when the index was created.
  final DateTime? createdAt;

  /// Indicates the current state of the index. You can check for changes to the
  /// state for asynchronous operations by calling the <a>GetIndex</a> operation.
  /// <note>
  /// The state can remain in the <code>CREATING</code> or <code>UPDATING</code>
  /// state for several hours as Resource Explorer discovers the information about
  /// your resources and populates the index.
  /// </note>
  final IndexState? state;

  CreateIndexOutput({
    this.arn,
    this.createdAt,
    this.state,
  });

  factory CreateIndexOutput.fromJson(Map<String, dynamic> json) {
    return CreateIndexOutput(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      state: (json['State'] as String?)?.toIndexState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (state != null) 'State': state.toValue(),
    };
  }
}

class CreateViewOutput {
  /// A structure that contains the details about the new view.
  final View? view;

  CreateViewOutput({
    this.view,
  });

  factory CreateViewOutput.fromJson(Map<String, dynamic> json) {
    return CreateViewOutput(
      view: json['View'] != null
          ? View.fromJson(json['View'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final view = this.view;
    return {
      if (view != null) 'View': view,
    };
  }
}

class DeleteIndexOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index that you successfully started the
  /// deletion process.
  /// <note>
  /// This operation is asynchronous. To check its status, call the
  /// <a>GetIndex</a> operation.
  /// </note>
  final String? arn;

  /// The date and time when you last updated this index.
  final DateTime? lastUpdatedAt;

  /// Indicates the current state of the index.
  final IndexState? state;

  DeleteIndexOutput({
    this.arn,
    this.lastUpdatedAt,
    this.state,
  });

  factory DeleteIndexOutput.fromJson(Map<String, dynamic> json) {
    return DeleteIndexOutput(
      arn: json['Arn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      state: (json['State'] as String?)?.toIndexState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final lastUpdatedAt = this.lastUpdatedAt;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (lastUpdatedAt != null) 'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DeleteViewOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that you successfully deleted.
  final String? viewArn;

  DeleteViewOutput({
    this.viewArn,
  });

  factory DeleteViewOutput.fromJson(Map<String, dynamic> json) {
    return DeleteViewOutput(
      viewArn: json['ViewArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final viewArn = this.viewArn;
    return {
      if (viewArn != null) 'ViewArn': viewArn,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAccountLevelServiceConfigurationOutput {
  /// Details about the organization, and whether configuration is
  /// <code>ENABLED</code> or <code>DISABLED</code>.
  final OrgConfiguration? orgConfiguration;

  GetAccountLevelServiceConfigurationOutput({
    this.orgConfiguration,
  });

  factory GetAccountLevelServiceConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetAccountLevelServiceConfigurationOutput(
      orgConfiguration: json['OrgConfiguration'] != null
          ? OrgConfiguration.fromJson(
              json['OrgConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final orgConfiguration = this.orgConfiguration;
    return {
      if (orgConfiguration != null) 'OrgConfiguration': orgConfiguration,
    };
  }
}

class GetDefaultViewOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that is the current default for the
  /// Amazon Web Services Region in which you called this operation.
  final String? viewArn;

  GetDefaultViewOutput({
    this.viewArn,
  });

  factory GetDefaultViewOutput.fromJson(Map<String, dynamic> json) {
    return GetDefaultViewOutput(
      viewArn: json['ViewArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final viewArn = this.viewArn;
    return {
      if (viewArn != null) 'ViewArn': viewArn,
    };
  }
}

class GetIndexOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index.
  final String? arn;

  /// The date and time when the index was originally created.
  final DateTime? createdAt;

  /// The date and time when the index was last updated.
  final DateTime? lastUpdatedAt;

  /// This response value is present only if this index is
  /// <code>Type=AGGREGATOR</code>.
  ///
  /// A list of the Amazon Web Services Regions that replicate their content to
  /// the index in this Region.
  final List<String>? replicatingFrom;

  /// This response value is present only if this index is
  /// <code>Type=LOCAL</code>.
  ///
  /// The Amazon Web Services Region that contains the aggregator index, if one
  /// exists. If an aggregator index does exist then the Region in which you
  /// called this operation replicates its index information to the Region
  /// specified in this response value.
  final List<String>? replicatingTo;

  /// The current state of the index in this Amazon Web Services Region.
  final IndexState? state;

  /// Tag key and value pairs that are attached to the index.
  final Map<String, String>? tags;

  /// The type of the index in this Region. For information about the aggregator
  /// index and how it differs from a local index, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/userguide/manage-aggregator-region.html">Turning
  /// on cross-Region search by creating an aggregator index</a>.
  final IndexType? type;

  GetIndexOutput({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.replicatingFrom,
    this.replicatingTo,
    this.state,
    this.tags,
    this.type,
  });

  factory GetIndexOutput.fromJson(Map<String, dynamic> json) {
    return GetIndexOutput(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      replicatingFrom: (json['ReplicatingFrom'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      replicatingTo: (json['ReplicatingTo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      state: (json['State'] as String?)?.toIndexState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toIndexType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final replicatingFrom = this.replicatingFrom;
    final replicatingTo = this.replicatingTo;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': iso8601ToJson(createdAt),
      if (lastUpdatedAt != null) 'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (replicatingFrom != null) 'ReplicatingFrom': replicatingFrom,
      if (replicatingTo != null) 'ReplicatingTo': replicatingTo,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class GetViewOutput {
  /// Tag key and value pairs that are attached to the view.
  final Map<String, String>? tags;

  /// A structure that contains the details for the requested view.
  final View? view;

  GetViewOutput({
    this.tags,
    this.view,
  });

  factory GetViewOutput.fromJson(Map<String, dynamic> json) {
    return GetViewOutput(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      view: json['View'] != null
          ? View.fromJson(json['View'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final view = this.view;
    return {
      if (tags != null) 'Tags': tags,
      if (view != null) 'View': view,
    };
  }
}

/// Information about an additional property that describes a resource, that you
/// can optionally include in the view. This lets you view that property in
/// search results, and filter your search results based on the value of the
/// property.
class IncludedProperty {
  /// The name of the property that is included in this view.
  ///
  /// You can specify the following property names for this field:
  ///
  /// <ul>
  /// <li>
  /// <code>Tags</code>
  /// </li>
  /// </ul>
  final String name;

  IncludedProperty({
    required this.name,
  });

  factory IncludedProperty.fromJson(Map<String, dynamic> json) {
    return IncludedProperty(
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// An index is the data store used by Amazon Web Services Resource Explorer to
/// hold information about your Amazon Web Services resources that the service
/// discovers. Creating an index in an Amazon Web Services Region turns on
/// Resource Explorer and lets it discover your resources.
///
/// By default, an index is <i>local</i>, meaning that it contains information
/// about resources in only the same Region as the index. However, you can
/// promote the index of one Region in the account by calling
/// <a>UpdateIndexType</a> to convert it into an aggregator index. The
/// aggregator index receives a replicated copy of the index information from
/// all other Regions where Resource Explorer is turned on. This allows search
/// operations in that Region to return results from all Regions in the account.
class Index {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index.
  final String? arn;

  /// The Amazon Web Services Region in which the index exists.
  final String? region;

  /// The type of index. It can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>LOCAL</code> – The index contains information about resources from
  /// only the same Amazon Web Services Region.
  /// </li>
  /// <li>
  /// <code>AGGREGATOR</code> – Resource Explorer replicates copies of the indexed
  /// information about resources in all other Amazon Web Services Regions to the
  /// aggregator index. This lets search results in the Region with the aggregator
  /// index to include resources from all Regions in the account where Resource
  /// Explorer is turned on.
  /// </li>
  /// </ul>
  final IndexType? type;

  Index({
    this.arn,
    this.region,
    this.type,
  });

  factory Index.fromJson(Map<String, dynamic> json) {
    return Index(
      arn: json['Arn'] as String?,
      region: json['Region'] as String?,
      type: (json['Type'] as String?)?.toIndexType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final region = this.region;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (region != null) 'Region': region,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum IndexState {
  creating,
  active,
  deleting,
  deleted,
  updating,
}

extension IndexStateValueExtension on IndexState {
  String toValue() {
    switch (this) {
      case IndexState.creating:
        return 'CREATING';
      case IndexState.active:
        return 'ACTIVE';
      case IndexState.deleting:
        return 'DELETING';
      case IndexState.deleted:
        return 'DELETED';
      case IndexState.updating:
        return 'UPDATING';
    }
  }
}

extension IndexStateFromString on String {
  IndexState toIndexState() {
    switch (this) {
      case 'CREATING':
        return IndexState.creating;
      case 'ACTIVE':
        return IndexState.active;
      case 'DELETING':
        return IndexState.deleting;
      case 'DELETED':
        return IndexState.deleted;
      case 'UPDATING':
        return IndexState.updating;
    }
    throw Exception('$this is not known in enum IndexState');
  }
}

enum IndexType {
  local,
  aggregator,
}

extension IndexTypeValueExtension on IndexType {
  String toValue() {
    switch (this) {
      case IndexType.local:
        return 'LOCAL';
      case IndexType.aggregator:
        return 'AGGREGATOR';
    }
  }
}

extension IndexTypeFromString on String {
  IndexType toIndexType() {
    switch (this) {
      case 'LOCAL':
        return IndexType.local;
      case 'AGGREGATOR':
        return IndexType.aggregator;
    }
    throw Exception('$this is not known in enum IndexType');
  }
}

class ListIndexesForMembersOutput {
  /// A structure that contains the details and status of each index.
  final List<MemberIndex>? indexes;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>. The pagination tokens expire after
  /// 24 hours.
  final String? nextToken;

  ListIndexesForMembersOutput({
    this.indexes,
    this.nextToken,
  });

  factory ListIndexesForMembersOutput.fromJson(Map<String, dynamic> json) {
    return ListIndexesForMembersOutput(
      indexes: (json['Indexes'] as List?)
          ?.whereNotNull()
          .map((e) => MemberIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexes = this.indexes;
    final nextToken = this.nextToken;
    return {
      if (indexes != null) 'Indexes': indexes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIndexesOutput {
  /// A structure that contains the details and status of each index.
  final List<Index>? indexes;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>. The pagination tokens expire after
  /// 24 hours.
  final String? nextToken;

  ListIndexesOutput({
    this.indexes,
    this.nextToken,
  });

  factory ListIndexesOutput.fromJson(Map<String, dynamic> json) {
    return ListIndexesOutput(
      indexes: (json['Indexes'] as List?)
          ?.whereNotNull()
          .map((e) => Index.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexes = this.indexes;
    final nextToken = this.nextToken;
    return {
      if (indexes != null) 'Indexes': indexes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSupportedResourceTypesOutput {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>. The pagination tokens expire after
  /// 24 hours.
  final String? nextToken;

  /// The list of resource types supported by Resource Explorer.
  final List<SupportedResourceType>? resourceTypes;

  ListSupportedResourceTypesOutput({
    this.nextToken,
    this.resourceTypes,
  });

  factory ListSupportedResourceTypesOutput.fromJson(Map<String, dynamic> json) {
    return ListSupportedResourceTypesOutput(
      nextToken: json['NextToken'] as String?,
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => SupportedResourceType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceTypes = this.resourceTypes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
    };
  }
}

class ListTagsForResourceOutput {
  /// The tag key and value pairs that you want to attach to the specified view or
  /// index.
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

class ListViewsOutput {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>. The pagination tokens expire after
  /// 24 hours.
  final String? nextToken;

  /// The list of views available in the Amazon Web Services Region in which you
  /// called this operation.
  final List<String>? views;

  ListViewsOutput({
    this.nextToken,
    this.views,
  });

  factory ListViewsOutput.fromJson(Map<String, dynamic> json) {
    return ListViewsOutput(
      nextToken: json['NextToken'] as String?,
      views: (json['Views'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final views = this.views;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (views != null) 'Views': views,
    };
  }
}

/// An index is the data store used by Amazon Web Services Resource Explorer to
/// hold information about your Amazon Web Services resources that the service
/// discovers.
class MemberIndex {
  /// The account ID for the index.
  final String? accountId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index.
  final String? arn;

  /// The Amazon Web Services Region in which the index exists.
  final String? region;

  /// The type of index. It can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>LOCAL</code> – The index contains information about resources from
  /// only the same Amazon Web Services Region.
  /// </li>
  /// <li>
  /// <code>AGGREGATOR</code> – Resource Explorer replicates copies of the indexed
  /// information about resources in all other Amazon Web Services Regions to the
  /// aggregator index. This lets search results in the Region with the aggregator
  /// index to include resources from all Regions in the account where Resource
  /// Explorer is turned on.
  /// </li>
  /// </ul>
  final IndexType? type;

  MemberIndex({
    this.accountId,
    this.arn,
    this.region,
    this.type,
  });

  factory MemberIndex.fromJson(Map<String, dynamic> json) {
    return MemberIndex(
      accountId: json['AccountId'] as String?,
      arn: json['Arn'] as String?,
      region: json['Region'] as String?,
      type: (json['Type'] as String?)?.toIndexType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final region = this.region;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (arn != null) 'Arn': arn,
      if (region != null) 'Region': region,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// This is a structure that contains the status of Amazon Web Services service
/// access, and whether you have a valid service-linked role to enable
/// multi-account search for your organization.
class OrgConfiguration {
  /// This value displays whether your Amazon Web Services service access is
  /// <code>ENABLED</code> or <code>DISABLED</code>.
  final AWSServiceAccessStatus awsServiceAccessStatus;

  /// This value shows whether or not you have a valid a service-linked role
  /// required to start the multi-account search feature.
  final String? serviceLinkedRole;

  OrgConfiguration({
    required this.awsServiceAccessStatus,
    this.serviceLinkedRole,
  });

  factory OrgConfiguration.fromJson(Map<String, dynamic> json) {
    return OrgConfiguration(
      awsServiceAccessStatus:
          (json['AWSServiceAccessStatus'] as String).toAWSServiceAccessStatus(),
      serviceLinkedRole: json['ServiceLinkedRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsServiceAccessStatus = this.awsServiceAccessStatus;
    final serviceLinkedRole = this.serviceLinkedRole;
    return {
      'AWSServiceAccessStatus': awsServiceAccessStatus.toValue(),
      if (serviceLinkedRole != null) 'ServiceLinkedRole': serviceLinkedRole,
    };
  }
}

/// A resource in Amazon Web Services that Amazon Web Services Resource Explorer
/// has discovered, and for which it has stored information in the index of the
/// Amazon Web Services Region that contains the resource.
class Resource {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the resource.
  final String? arn;

  /// The date and time that Resource Explorer last queried this resource and
  /// updated the index with the latest information about the resource.
  final DateTime? lastReportedAt;

  /// The Amazon Web Services account that owns the resource.
  final String? owningAccountId;

  /// A structure with additional type-specific details about the resource. These
  /// properties can be added by turning on integration between Resource Explorer
  /// and other Amazon Web Services services.
  final List<ResourceProperty>? properties;

  /// The Amazon Web Services Region in which the resource was created and exists.
  final String? region;

  /// The type of the resource.
  final String? resourceType;

  /// The Amazon Web Service that owns the resource and is responsible for
  /// creating and updating it.
  final String? service;

  Resource({
    this.arn,
    this.lastReportedAt,
    this.owningAccountId,
    this.properties,
    this.region,
    this.resourceType,
    this.service,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['Arn'] as String?,
      lastReportedAt: timeStampFromJson(json['LastReportedAt']),
      owningAccountId: json['OwningAccountId'] as String?,
      properties: (json['Properties'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['Region'] as String?,
      resourceType: json['ResourceType'] as String?,
      service: json['Service'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final lastReportedAt = this.lastReportedAt;
    final owningAccountId = this.owningAccountId;
    final properties = this.properties;
    final region = this.region;
    final resourceType = this.resourceType;
    final service = this.service;
    return {
      if (arn != null) 'Arn': arn,
      if (lastReportedAt != null)
        'LastReportedAt': iso8601ToJson(lastReportedAt),
      if (owningAccountId != null) 'OwningAccountId': owningAccountId,
      if (properties != null) 'Properties': properties,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType,
      if (service != null) 'Service': service,
    };
  }
}

/// Information about the number of results that match the query. At this time,
/// Amazon Web Services Resource Explorer doesn't count more than 1,000 matches
/// for any query. This structure provides information about whether the query
/// exceeded this limit.
///
/// This field is included in every page when you paginate the results.
class ResourceCount {
  /// Indicates whether the <code>TotalResources</code> value represents an
  /// exhaustive count of search results.
  ///
  /// <ul>
  /// <li>
  /// If <code>True</code>, it indicates that the search was exhaustive. Every
  /// resource that matches the query was counted.
  /// </li>
  /// <li>
  /// If <code>False</code>, then the search reached the limit of 1,000 matching
  /// results, and stopped counting.
  /// </li>
  /// </ul>
  final bool? complete;

  /// The number of resources that match the search query. This value can't exceed
  /// 1,000. If there are more than 1,000 resources that match the query, then
  /// only 1,000 are counted and the <code>Complete</code> field is set to false.
  /// We recommend that you refine your query to return a smaller number of
  /// results.
  final int? totalResources;

  ResourceCount({
    this.complete,
    this.totalResources,
  });

  factory ResourceCount.fromJson(Map<String, dynamic> json) {
    return ResourceCount(
      complete: json['Complete'] as bool?,
      totalResources: json['TotalResources'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final complete = this.complete;
    final totalResources = this.totalResources;
    return {
      if (complete != null) 'Complete': complete,
      if (totalResources != null) 'TotalResources': totalResources,
    };
  }
}

/// A structure that describes a property of a resource.
class ResourceProperty {
  /// Details about this property. The content of this field is a JSON object that
  /// varies based on the resource type.
  final Document? data;

  /// The date and time that the information about this resource property was last
  /// updated.
  final DateTime? lastReportedAt;

  /// The name of this property of the resource.
  final String? name;

  ResourceProperty({
    this.data,
    this.lastReportedAt,
    this.name,
  });

  factory ResourceProperty.fromJson(Map<String, dynamic> json) {
    return ResourceProperty(
      data: json['Data'] != null
          ? Document.fromJson(json['Data'] as Map<String, dynamic>)
          : null,
      lastReportedAt: timeStampFromJson(json['LastReportedAt']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final lastReportedAt = this.lastReportedAt;
    final name = this.name;
    return {
      if (data != null) 'Data': data,
      if (lastReportedAt != null)
        'LastReportedAt': iso8601ToJson(lastReportedAt),
      if (name != null) 'Name': name,
    };
  }
}

/// A search filter defines which resources can be part of a search query result
/// set.
class SearchFilter {
  /// The string that contains the search keywords, prefixes, and operators to
  /// control the results that can be returned by a <a>Search</a> operation. For
  /// more details, see <a
  /// href="https://docs.aws.amazon.com/resource-explorer/latest/APIReference/about-query-syntax.html">Search
  /// query syntax</a>.
  final String filterString;

  SearchFilter({
    required this.filterString,
  });

  factory SearchFilter.fromJson(Map<String, dynamic> json) {
    return SearchFilter(
      filterString: json['FilterString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final filterString = this.filterString;
    return {
      'FilterString': filterString,
    };
  }
}

class SearchOutput {
  /// The number of resources that match the query.
  final ResourceCount? count;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>. The pagination tokens expire after
  /// 24 hours.
  final String? nextToken;

  /// The list of structures that describe the resources that match the query.
  final List<Resource>? resources;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view that this operation used to perform the
  /// search.
  final String? viewArn;

  SearchOutput({
    this.count,
    this.nextToken,
    this.resources,
    this.viewArn,
  });

  factory SearchOutput.fromJson(Map<String, dynamic> json) {
    return SearchOutput(
      count: json['Count'] != null
          ? ResourceCount.fromJson(json['Count'] as Map<String, dynamic>)
          : null,
      nextToken: json['NextToken'] as String?,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewArn: json['ViewArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final nextToken = this.nextToken;
    final resources = this.resources;
    final viewArn = this.viewArn;
    return {
      if (count != null) 'Count': count,
      if (nextToken != null) 'NextToken': nextToken,
      if (resources != null) 'Resources': resources,
      if (viewArn != null) 'ViewArn': viewArn,
    };
  }
}

/// A structure that describes a resource type supported by Amazon Web Services
/// Resource Explorer.
class SupportedResourceType {
  /// The unique identifier of the resource type.
  final String? resourceType;

  /// The Amazon Web Service that is associated with the resource type. This is
  /// the primary service that lets you create and interact with resources of this
  /// type.
  final String? service;

  SupportedResourceType({
    this.resourceType,
    this.service,
  });

  factory SupportedResourceType.fromJson(Map<String, dynamic> json) {
    return SupportedResourceType(
      resourceType: json['ResourceType'] as String?,
      service: json['Service'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final service = this.service;
    return {
      if (resourceType != null) 'ResourceType': resourceType,
      if (service != null) 'Service': service,
    };
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

class UpdateIndexTypeOutput {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the index that you updated.
  final String? arn;

  /// The date and timestamp when the index was last updated.
  final DateTime? lastUpdatedAt;

  /// Indicates the state of the request to update the index. This operation is
  /// asynchronous. Call the <a>GetIndex</a> operation to check for changes.
  final IndexState? state;

  /// Specifies the type of the specified index after the operation completes.
  final IndexType? type;

  UpdateIndexTypeOutput({
    this.arn,
    this.lastUpdatedAt,
    this.state,
    this.type,
  });

  factory UpdateIndexTypeOutput.fromJson(Map<String, dynamic> json) {
    return UpdateIndexTypeOutput(
      arn: json['Arn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      state: (json['State'] as String?)?.toIndexState(),
      type: (json['Type'] as String?)?.toIndexType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final lastUpdatedAt = this.lastUpdatedAt;
    final state = this.state;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (lastUpdatedAt != null) 'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class UpdateViewOutput {
  /// Details about the view that you changed with this operation.
  final View? view;

  UpdateViewOutput({
    this.view,
  });

  factory UpdateViewOutput.fromJson(Map<String, dynamic> json) {
    return UpdateViewOutput(
      view: json['View'] != null
          ? View.fromJson(json['View'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final view = this.view;
    return {
      if (view != null) 'View': view,
    };
  }
}

/// A view is a structure that defines a set of filters that provide a view into
/// the information in the Amazon Web Services Resource Explorer index. The
/// filters specify which information from the index is visible to the users of
/// the view. For example, you can specify filters that include only resources
/// that are tagged with the key "ENV" and the value "DEVELOPMENT" in the
/// results returned by this view. You could also create a second view that
/// includes only resources that are tagged with "ENV" and "PRODUCTION".
class View {
  /// An array of <a>SearchFilter</a> objects that specify which resources can be
  /// included in the results of queries made using this view.
  final SearchFilter? filters;

  /// A structure that contains additional information about the view.
  final List<IncludedProperty>? includedProperties;

  /// The date and time when this view was last modified.
  final DateTime? lastUpdatedAt;

  /// The Amazon Web Services account that owns this view.
  final String? owner;

  /// An <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of an Amazon Web Services account, an organization,
  /// or an organizational unit (OU) that specifies whether this view includes
  /// resources from only the specified Amazon Web Services account, all accounts
  /// in the specified organization, or all accounts in the specified OU.
  ///
  /// If not specified, the value defaults to the Amazon Web Services account used
  /// to call this operation.
  final String? scope;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// resource name (ARN)</a> of the view.
  final String? viewArn;

  View({
    this.filters,
    this.includedProperties,
    this.lastUpdatedAt,
    this.owner,
    this.scope,
    this.viewArn,
  });

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      filters: json['Filters'] != null
          ? SearchFilter.fromJson(json['Filters'] as Map<String, dynamic>)
          : null,
      includedProperties: (json['IncludedProperties'] as List?)
          ?.whereNotNull()
          .map((e) => IncludedProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      owner: json['Owner'] as String?,
      scope: json['Scope'] as String?,
      viewArn: json['ViewArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final includedProperties = this.includedProperties;
    final lastUpdatedAt = this.lastUpdatedAt;
    final owner = this.owner;
    final scope = this.scope;
    final viewArn = this.viewArn;
    return {
      if (filters != null) 'Filters': filters,
      if (includedProperties != null) 'IncludedProperties': includedProperties,
      if (lastUpdatedAt != null) 'LastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (owner != null) 'Owner': owner,
      if (scope != null) 'Scope': scope,
      if (viewArn != null) 'ViewArn': viewArn,
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

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
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
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
