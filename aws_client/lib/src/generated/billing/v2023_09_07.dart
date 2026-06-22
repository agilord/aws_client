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

import 'v2023_09_07.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the Billing API to programatically list the billing views
/// available to you for a given time period. A billing view represents a set of
/// billing data.
///
/// The Billing API provides the following endpoint:
///
/// <code>https://billing.us-east-1.api.aws</code>
class Billing {
  final _s.JsonProtocol _protocol;
  factory Billing({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'billing',
    );
    return Billing._(
      protocol: _s.JsonProtocol(
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
  Billing._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Associates one or more source billing views with an existing billing view.
  /// This allows creating aggregate billing views that combine data from
  /// multiple sources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing view to associate source
  /// views with.
  ///
  /// Parameter [sourceViews] :
  /// A list of ARNs of the source billing views to associate.
  Future<AssociateSourceViewsResponse> associateSourceViews({
    required String arn,
    required List<String> sourceViews,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.AssociateSourceViews'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'sourceViews': sourceViews,
      },
    );

    return AssociateSourceViewsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a billing view with the specified billing view attributes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the billing view.
  ///
  /// Parameter [sourceViews] :
  /// A list of billing views used as the data source for the custom billing
  /// view.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier you specify to ensure idempotency of
  /// the request. Idempotency ensures that an API request completes no more
  /// than one time. If the original request completes successfully, any
  /// subsequent retries complete successfully without performing any further
  /// actions with an idempotent request.
  ///
  /// Parameter [dataFilterExpression] :
  /// See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
  /// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
  /// and <code>CostCategories</code>.
  ///
  /// Parameter [description] :
  /// The description of the billing view.
  ///
  /// Parameter [resourceTags] :
  /// A list of key value map specifying tags associated to the billing view
  /// being created.
  Future<CreateBillingViewResponse> createBillingView({
    required String name,
    required List<String> sourceViews,
    String? clientToken,
    Expression? dataFilterExpression,
    String? description,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.CreateBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'sourceViews': sourceViews,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dataFilterExpression != null)
          'dataFilterExpression': dataFilterExpression,
        if (description != null) 'description': description,
        if (resourceTags != null) 'resourceTags': resourceTags,
      },
    );

    return CreateBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified billing view.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [force] :
  /// If set to true, forces deletion of the billing view even if it has derived
  /// resources (e.g. other billing views or budgets). Use with caution as this
  /// may break dependent resources.
  Future<DeleteBillingViewResponse> deleteBillingView({
    required String arn,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.DeleteBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (force != null) 'force': force,
      },
    );

    return DeleteBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Removes the association between one or more source billing views and an
  /// existing billing view. This allows modifying the composition of aggregate
  /// billing views.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing view to disassociate source
  /// views from.
  ///
  /// Parameter [sourceViews] :
  /// A list of ARNs of the source billing views to disassociate.
  Future<DisassociateSourceViewsResponse> disassociateSourceViews({
    required String arn,
    required List<String> sourceViews,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.DisassociateSourceViews'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'sourceViews': sourceViews,
      },
    );

    return DisassociateSourceViewsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the metadata associated to the specified billing view ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  Future<GetBillingViewResponse> getBillingView({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Returns the resource-based policy document attached to the resource in
  /// <code>JSON</code> format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the billing view resource to which the
  /// policy is attached to.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Lists the billing views available for a given time period.
  ///
  /// Every Amazon Web Services account has a unique <code>PRIMARY</code>
  /// billing view that represents the billing data available by default.
  /// Accounts that use Billing Conductor also have <code>BILLING_GROUP</code>
  /// billing views representing pro forma costs associated with each created
  /// billing group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [activeTimeRange] :
  /// The time range for the billing views listed. <code>PRIMARY</code> billing
  /// view is always listed. <code>BILLING_GROUP</code> billing views are listed
  /// for time ranges when the associated billing group resource in Billing
  /// Conductor is active. The time range must be within one calendar month.
  ///
  /// Parameter [arns] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [billingViewTypes] :
  /// The type of billing view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of billing views to retrieve. Default is 100.
  ///
  /// Parameter [names] :
  /// Filters the list of billing views by name. You can specify search criteria
  /// to match billing view names based on the search option provided.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that is used on subsequent calls to list billing
  /// views.
  ///
  /// Parameter [ownerAccountId] :
  /// The list of owners of the billing view.
  ///
  /// Parameter [sourceAccountId] :
  /// Filters the results to include only billing views that use the specified
  /// account as a source.
  Future<ListBillingViewsResponse> listBillingViews({
    ActiveTimeRange? activeTimeRange,
    List<String>? arns,
    List<BillingViewType>? billingViewTypes,
    int? maxResults,
    List<StringSearch>? names,
    String? nextToken,
    String? ownerAccountId,
    String? sourceAccountId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.ListBillingViews'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (activeTimeRange != null) 'activeTimeRange': activeTimeRange,
        if (arns != null) 'arns': arns,
        if (billingViewTypes != null)
          'billingViewTypes': billingViewTypes.map((e) => e.value).toList(),
        if (maxResults != null) 'maxResults': maxResults,
        if (names != null) 'names': names,
        if (nextToken != null) 'nextToken': nextToken,
        if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
        if (sourceAccountId != null) 'sourceAccountId': sourceAccountId,
      },
    );

    return ListBillingViewsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the source views (managed Amazon Web Services billing views)
  /// associated with the billing view.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [maxResults] :
  /// The number of entries a paginated response contains.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that is used on subsequent calls to list billing
  /// views.
  Future<ListSourceViewsForBillingViewResponse> listSourceViewsForBillingView({
    required String arn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.ListSourceViewsForBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSourceViewsForBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags associated with the billing view resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// An API operation for adding one or more tags (key-value pairs) to a
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [resourceTags] :
  /// A list of tag key value pairs that are associated with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'resourceTags': resourceTags,
      },
    );
  }

  /// Removes one or more tags from a resource. Specify only tag keys in your
  /// request. Don't specify the value.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [resourceTagKeys] :
  /// A list of tag key value pairs that are associated with the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'resourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// An API to update the attributes of the billing view.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [dataFilterExpression] :
  /// See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
  /// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
  /// and <code>CostCategories</code>.
  ///
  /// Parameter [description] :
  /// The description of the billing view.
  ///
  /// Parameter [name] :
  /// The name of the billing view.
  Future<UpdateBillingViewResponse> updateBillingView({
    required String arn,
    Expression? dataFilterExpression,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.UpdateBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (dataFilterExpression != null)
          'dataFilterExpression': dataFilterExpression,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
      },
    );

    return UpdateBillingViewResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class AssociateSourceViewsResponse {
  /// The ARN of the billing view that the source views were associated with.
  final String arn;

  AssociateSourceViewsResponse({
    required this.arn,
  });

  factory AssociateSourceViewsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateSourceViewsResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class CreateBillingViewResponse {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String arn;

  /// The time when the billing view was created.
  final DateTime? createdAt;

  CreateBillingViewResponse({
    required this.arn,
    this.createdAt,
  });

  factory CreateBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return CreateBillingViewResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    return {
      'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
    };
  }
}

/// @nodoc
class DeleteBillingViewResponse {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String arn;

  DeleteBillingViewResponse({
    required this.arn,
  });

  factory DeleteBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBillingViewResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class DisassociateSourceViewsResponse {
  /// The ARN of the billing view that the source views were disassociated from.
  final String arn;

  DisassociateSourceViewsResponse({
    required this.arn,
  });

  factory DisassociateSourceViewsResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateSourceViewsResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class GetBillingViewResponse {
  /// The billing view element associated with the specified ARN.
  final BillingViewElement billingView;

  GetBillingViewResponse({
    required this.billingView,
  });

  factory GetBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return GetBillingViewResponse(
      billingView: BillingViewElement.fromJson(
          (json['billingView'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final billingView = this.billingView;
    return {
      'billingView': billingView,
    };
  }
}

/// @nodoc
class GetResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the billing view resource to which the
  /// policy is attached to.
  final String resourceArn;

  /// The resource-based policy document attached to the resource in
  /// <code>JSON</code> format.
  final String? policy;

  GetResourcePolicyResponse({
    required this.resourceArn,
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      resourceArn: (json['resourceArn'] as String?) ?? '',
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final policy = this.policy;
    return {
      'resourceArn': resourceArn,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class ListBillingViewsResponse {
  /// A list of <code>BillingViewListElement</code> retrieved.
  final List<BillingViewListElement> billingViews;

  /// The pagination token to use on subsequent calls to list billing views.
  final String? nextToken;

  ListBillingViewsResponse({
    required this.billingViews,
    this.nextToken,
  });

  factory ListBillingViewsResponse.fromJson(Map<String, dynamic> json) {
    return ListBillingViewsResponse(
      billingViews: ((json['billingViews'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => BillingViewListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingViews = this.billingViews;
    final nextToken = this.nextToken;
    return {
      'billingViews': billingViews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSourceViewsForBillingViewResponse {
  /// A list of billing views used as the data source for the custom billing view.
  final List<String> sourceViews;

  /// The pagination token that is used on subsequent calls to list billing views.
  final String? nextToken;

  ListSourceViewsForBillingViewResponse({
    required this.sourceViews,
    this.nextToken,
  });

  factory ListSourceViewsForBillingViewResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSourceViewsForBillingViewResponse(
      sourceViews: ((json['sourceViews'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceViews = this.sourceViews;
    final nextToken = this.nextToken;
    return {
      'sourceViews': sourceViews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A list of tag key value pairs that are associated with the resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'resourceTags': resourceTags,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateBillingViewResponse {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String arn;

  /// The time when the billing view was last updated.
  final DateTime? updatedAt;

  UpdateBillingViewResponse({
    required this.arn,
    this.updatedAt,
  });

  factory UpdateBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBillingViewResponse(
      arn: (json['arn'] as String?) ?? '',
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// See <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
/// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
/// and <code>CostCategories</code>.
///
/// @nodoc
class Expression {
  /// The filter that's based on <code>CostCategory</code> values.
  final CostCategoryValues? costCategories;

  /// The specific <code>Dimension</code> to use for <code>Expression</code>.
  final DimensionValues? dimensions;

  /// The specific <code>Tag</code> to use for <code>Expression</code>.
  final TagValues? tags;

  /// Specifies a time range filter for the billing view data.
  final TimeRange? timeRange;

  Expression({
    this.costCategories,
    this.dimensions,
    this.tags,
    this.timeRange,
  });

  factory Expression.fromJson(Map<String, dynamic> json) {
    return Expression(
      costCategories: json['costCategories'] != null
          ? CostCategoryValues.fromJson(
              json['costCategories'] as Map<String, dynamic>)
          : null,
      dimensions: json['dimensions'] != null
          ? DimensionValues.fromJson(json['dimensions'] as Map<String, dynamic>)
          : null,
      tags: json['tags'] != null
          ? TagValues.fromJson(json['tags'] as Map<String, dynamic>)
          : null,
      timeRange: json['timeRange'] != null
          ? TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategories = this.costCategories;
    final dimensions = this.dimensions;
    final tags = this.tags;
    final timeRange = this.timeRange;
    return {
      if (costCategories != null) 'costCategories': costCategories,
      if (dimensions != null) 'dimensions': dimensions,
      if (tags != null) 'tags': tags,
      if (timeRange != null) 'timeRange': timeRange,
    };
  }
}

/// The metadata that you can use to filter and group your results.
///
/// @nodoc
class DimensionValues {
  /// The names of the metadata types that you can use to filter and group your
  /// results.
  final Dimension key;

  /// The metadata values that you can use to filter and group your results.
  final List<String> values;

  DimensionValues({
    required this.key,
    required this.values,
  });

  factory DimensionValues.fromJson(Map<String, dynamic> json) {
    return DimensionValues(
      key: Dimension.fromString((json['key'] as String?) ?? ''),
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key.value,
      'values': values,
    };
  }
}

/// The values that are available for a tag.
///
/// @nodoc
class TagValues {
  /// The key for the tag.
  final String key;

  /// The specific value of the tag.
  final List<String> values;

  TagValues({
    required this.key,
    required this.values,
  });

  factory TagValues.fromJson(Map<String, dynamic> json) {
    return TagValues(
      key: (json['key'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key,
      'values': values,
    };
  }
}

/// The Cost Categories values used for filtering the costs.
///
/// @nodoc
class CostCategoryValues {
  /// The unique name of the Cost Category.
  final String key;

  /// The specific value of the Cost Category.
  final List<String> values;

  CostCategoryValues({
    required this.key,
    required this.values,
  });

  factory CostCategoryValues.fromJson(Map<String, dynamic> json) {
    return CostCategoryValues(
      key: (json['key'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key,
      'values': values,
    };
  }
}

/// Specifies a time range with inclusive begin and end dates.
///
/// @nodoc
class TimeRange {
  /// The inclusive start date of the time range.
  final DateTime? beginDateInclusive;

  /// The inclusive end date of the time range.
  final DateTime? endDateInclusive;

  TimeRange({
    this.beginDateInclusive,
    this.endDateInclusive,
  });

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      beginDateInclusive: timeStampFromJson(json['beginDateInclusive']),
      endDateInclusive: timeStampFromJson(json['endDateInclusive']),
    );
  }

  Map<String, dynamic> toJson() {
    final beginDateInclusive = this.beginDateInclusive;
    final endDateInclusive = this.endDateInclusive;
    return {
      if (beginDateInclusive != null)
        'beginDateInclusive': unixTimestampToJson(beginDateInclusive),
      if (endDateInclusive != null)
        'endDateInclusive': unixTimestampToJson(endDateInclusive),
    };
  }
}

/// @nodoc
class Dimension {
  static const linkedAccount = Dimension._('LINKED_ACCOUNT');

  final String value;

  const Dimension._(this.value);

  static const values = [linkedAccount];

  static Dimension fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Dimension._(value));

  @override
  bool operator ==(other) => other is Dimension && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tag structure that contains a tag key and value.
///
/// @nodoc
class ResourceTag {
  /// The key that's associated with the tag.
  final String key;

  /// The value that's associated with the tag.
  final String? value;

  ResourceTag({
    required this.key,
    this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: (json['key'] as String?) ?? '',
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// A representation of a billing view.
///
/// @nodoc
class BillingViewListElement {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String? arn;

  /// The type of billing view.
  final BillingViewType? billingViewType;

  /// The description of the billing view.
  final String? description;

  /// The current health status of the billing view.
  final BillingViewHealthStatus? healthStatus;

  /// A list of names of the Billing view.
  final String? name;

  /// The list of owners of the Billing view.
  final String? ownerAccountId;

  /// The Amazon Web Services account ID that owns the source billing view, if
  /// this is a derived billing view.
  final String? sourceAccountId;

  BillingViewListElement({
    this.arn,
    this.billingViewType,
    this.description,
    this.healthStatus,
    this.name,
    this.ownerAccountId,
    this.sourceAccountId,
  });

  factory BillingViewListElement.fromJson(Map<String, dynamic> json) {
    return BillingViewListElement(
      arn: json['arn'] as String?,
      billingViewType:
          (json['billingViewType'] as String?)?.let(BillingViewType.fromString),
      description: json['description'] as String?,
      healthStatus: json['healthStatus'] != null
          ? BillingViewHealthStatus.fromJson(
              json['healthStatus'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      ownerAccountId: json['ownerAccountId'] as String?,
      sourceAccountId: json['sourceAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingViewType = this.billingViewType;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final sourceAccountId = this.sourceAccountId;
    return {
      if (arn != null) 'arn': arn,
      if (billingViewType != null) 'billingViewType': billingViewType.value,
      if (description != null) 'description': description,
      if (healthStatus != null) 'healthStatus': healthStatus,
      if (name != null) 'name': name,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
      if (sourceAccountId != null) 'sourceAccountId': sourceAccountId,
    };
  }
}

/// @nodoc
class BillingViewType {
  static const primary = BillingViewType._('PRIMARY');
  static const billingGroup = BillingViewType._('BILLING_GROUP');
  static const custom = BillingViewType._('CUSTOM');
  static const billingTransfer = BillingViewType._('BILLING_TRANSFER');
  static const billingTransferShowback =
      BillingViewType._('BILLING_TRANSFER_SHOWBACK');

  final String value;

  const BillingViewType._(this.value);

  static const values = [
    primary,
    billingGroup,
    custom,
    billingTransfer,
    billingTransferShowback
  ];

  static BillingViewType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingViewType._(value));

  @override
  bool operator ==(other) => other is BillingViewType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the health status of a billing view, including a status code and
/// optional reasons for the status.
///
/// @nodoc
class BillingViewHealthStatus {
  /// The current health status code of the billing view.
  final BillingViewStatus? statusCode;

  /// A list of reasons explaining the current health status, if applicable.
  final List<BillingViewStatusReason>? statusReasons;

  BillingViewHealthStatus({
    this.statusCode,
    this.statusReasons,
  });

  factory BillingViewHealthStatus.fromJson(Map<String, dynamic> json) {
    return BillingViewHealthStatus(
      statusCode:
          (json['statusCode'] as String?)?.let(BillingViewStatus.fromString),
      statusReasons: (json['statusReasons'] as List?)
          ?.nonNulls
          .map((e) => BillingViewStatusReason.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReasons = this.statusReasons;
    return {
      if (statusCode != null) 'statusCode': statusCode.value,
      if (statusReasons != null)
        'statusReasons': statusReasons.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class BillingViewStatus {
  static const healthy = BillingViewStatus._('HEALTHY');
  static const unhealthy = BillingViewStatus._('UNHEALTHY');
  static const creating = BillingViewStatus._('CREATING');
  static const updating = BillingViewStatus._('UPDATING');

  final String value;

  const BillingViewStatus._(this.value);

  static const values = [healthy, unhealthy, creating, updating];

  static BillingViewStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingViewStatus._(value));

  @override
  bool operator ==(other) => other is BillingViewStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BillingViewStatusReason {
  static const sourceViewUnhealthy =
      BillingViewStatusReason._('SOURCE_VIEW_UNHEALTHY');
  static const sourceViewUpdating =
      BillingViewStatusReason._('SOURCE_VIEW_UPDATING');
  static const sourceViewAccessDenied =
      BillingViewStatusReason._('SOURCE_VIEW_ACCESS_DENIED');
  static const sourceViewNotFound =
      BillingViewStatusReason._('SOURCE_VIEW_NOT_FOUND');
  static const cyclicDependency =
      BillingViewStatusReason._('CYCLIC_DEPENDENCY');
  static const sourceViewDepthExceeded =
      BillingViewStatusReason._('SOURCE_VIEW_DEPTH_EXCEEDED');
  static const aggregateSource = BillingViewStatusReason._('AGGREGATE_SOURCE');
  static const viewOwnerNotManagementAccount =
      BillingViewStatusReason._('VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT');

  final String value;

  const BillingViewStatusReason._(this.value);

  static const values = [
    sourceViewUnhealthy,
    sourceViewUpdating,
    sourceViewAccessDenied,
    sourceViewNotFound,
    cyclicDependency,
    sourceViewDepthExceeded,
    aggregateSource,
    viewOwnerNotManagementAccount
  ];

  static BillingViewStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingViewStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is BillingViewStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A time range with a start and end time.
///
/// @nodoc
class ActiveTimeRange {
  /// The inclusive time range start date.
  final DateTime activeAfterInclusive;

  /// The inclusive time range end date.
  final DateTime activeBeforeInclusive;

  ActiveTimeRange({
    required this.activeAfterInclusive,
    required this.activeBeforeInclusive,
  });

  Map<String, dynamic> toJson() {
    final activeAfterInclusive = this.activeAfterInclusive;
    final activeBeforeInclusive = this.activeBeforeInclusive;
    return {
      'activeAfterInclusive': unixTimestampToJson(activeAfterInclusive),
      'activeBeforeInclusive': unixTimestampToJson(activeBeforeInclusive),
    };
  }
}

/// A structure that defines how to search for string values. You can specify a
/// search option and the value to search for.
///
/// @nodoc
class StringSearch {
  /// The type of search operation to perform on the string value. Determines how
  /// the search value is matched against the target field.
  final SearchOption searchOption;

  /// The string value to use in the search operation. This value is compared
  /// against the target field using the specified search option.
  final String searchValue;

  StringSearch({
    required this.searchOption,
    required this.searchValue,
  });

  Map<String, dynamic> toJson() {
    final searchOption = this.searchOption;
    final searchValue = this.searchValue;
    return {
      'searchOption': searchOption.value,
      'searchValue': searchValue,
    };
  }
}

/// @nodoc
class SearchOption {
  static const startsWith = SearchOption._('STARTS_WITH');

  final String value;

  const SearchOption._(this.value);

  static const values = [startsWith];

  static SearchOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SearchOption._(value));

  @override
  bool operator ==(other) => other is SearchOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The metadata associated to the billing view.
///
/// @nodoc
class BillingViewElement {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String? arn;

  /// The type of billing group.
  final BillingViewType? billingViewType;

  /// The time when the billing view was created.
  final DateTime? createdAt;

  /// See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
  /// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
  /// and <code>CostCategories</code>.
  final Expression? dataFilterExpression;

  /// The number of billing views that use this billing view as a source.
  final int? derivedViewCount;

  /// The description of the billing view.
  final String? description;

  /// The current health status of the billing view.
  final BillingViewHealthStatus? healthStatus;

  /// The account name of the billing view.
  final String? name;

  /// The account owner of the billing view.
  final String? ownerAccountId;

  /// The Amazon Web Services account ID that owns the source billing view, if
  /// this is a derived billing view.
  final String? sourceAccountId;

  /// The number of source views associated with this billing view.
  final int? sourceViewCount;

  /// The time when the billing view was last updated.
  final DateTime? updatedAt;

  /// The timestamp of when the billing view definition was last updated.
  final DateTime? viewDefinitionLastUpdatedAt;

  BillingViewElement({
    this.arn,
    this.billingViewType,
    this.createdAt,
    this.dataFilterExpression,
    this.derivedViewCount,
    this.description,
    this.healthStatus,
    this.name,
    this.ownerAccountId,
    this.sourceAccountId,
    this.sourceViewCount,
    this.updatedAt,
    this.viewDefinitionLastUpdatedAt,
  });

  factory BillingViewElement.fromJson(Map<String, dynamic> json) {
    return BillingViewElement(
      arn: json['arn'] as String?,
      billingViewType:
          (json['billingViewType'] as String?)?.let(BillingViewType.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      dataFilterExpression: json['dataFilterExpression'] != null
          ? Expression.fromJson(
              json['dataFilterExpression'] as Map<String, dynamic>)
          : null,
      derivedViewCount: json['derivedViewCount'] as int?,
      description: json['description'] as String?,
      healthStatus: json['healthStatus'] != null
          ? BillingViewHealthStatus.fromJson(
              json['healthStatus'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      ownerAccountId: json['ownerAccountId'] as String?,
      sourceAccountId: json['sourceAccountId'] as String?,
      sourceViewCount: json['sourceViewCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      viewDefinitionLastUpdatedAt:
          timeStampFromJson(json['viewDefinitionLastUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingViewType = this.billingViewType;
    final createdAt = this.createdAt;
    final dataFilterExpression = this.dataFilterExpression;
    final derivedViewCount = this.derivedViewCount;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final sourceAccountId = this.sourceAccountId;
    final sourceViewCount = this.sourceViewCount;
    final updatedAt = this.updatedAt;
    final viewDefinitionLastUpdatedAt = this.viewDefinitionLastUpdatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (billingViewType != null) 'billingViewType': billingViewType.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataFilterExpression != null)
        'dataFilterExpression': dataFilterExpression,
      if (derivedViewCount != null) 'derivedViewCount': derivedViewCount,
      if (description != null) 'description': description,
      if (healthStatus != null) 'healthStatus': healthStatus,
      if (name != null) 'name': name,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
      if (sourceAccountId != null) 'sourceAccountId': sourceAccountId,
      if (sourceViewCount != null) 'sourceViewCount': sourceViewCount,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (viewDefinitionLastUpdatedAt != null)
        'viewDefinitionLastUpdatedAt':
            unixTimestampToJson(viewDefinitionLastUpdatedAt),
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BillingViewHealthStatusException extends _s.GenericAwsException {
  BillingViewHealthStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'BillingViewHealthStatusException',
            message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BillingViewHealthStatusException': (type, message) =>
      BillingViewHealthStatusException(type: type, message: message),
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
