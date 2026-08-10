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

import 'v2025_08_05.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Manages flat-rate pricing subscriptions for supported AWS services. Use this
/// API to create, approve, update, and cancel subscriptions; associate and
/// disassociate resources; and retrieve subscription details. With a flat-rate
/// pricing subscription, you pay a fixed recurring fee for eligible resources
/// instead of usage-based pricing.
class PricingPlanManager {
  final _s.RestJsonProtocol _protocol;
  factory PricingPlanManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'pricingplanmanager',
    );
    return PricingPlanManager._(
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
  PricingPlanManager._({
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

  /// Approves a subscription that is in <code>PENDING_APPROVAL</code> status,
  /// activating it and starting billing.
  /// <note>
  /// This operation requires the current <code>ETag</code> value for
  /// concurrency control. Retrieve it from a previous
  /// <code>GetSubscription</code> or <code>ListSubscriptions</code> response.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription to approve.
  ///
  /// Parameter [ifMatch] :
  /// The <code>ETag</code> value from a previous <code>GetSubscription</code>
  /// or <code>ListSubscriptions</code> response. This ensures you are approving
  /// the expected version of the subscription.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is handled only once.
  Future<ApprovePaidSubscriptionOutput> approvePaidSubscription({
    required String arn,
    required String ifMatch,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'arn': arn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/ApprovePaidSubscription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ApprovePaidSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Adds one or more resources to an existing subscription. The subscription
  /// must be in an active state that is not pending other changes.
  /// <note>
  /// For subscriptions in the CloudFront plan family, the associated resources
  /// must include exactly one Amazon CloudFront distribution and one AWS WAF
  /// web ACL. You can also include other supported resources, such as Amazon
  /// Route 53 hosted zones, and CloudFront KeyValueStores.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription to add resources to.
  ///
  /// Parameter [ifMatch] :
  /// The <code>ETag</code> value from a previous <code>GetSubscription</code>
  /// or <code>ListSubscriptions</code> response.
  ///
  /// Parameter [resourceArns] :
  /// The ARNs of the resources to add to the subscription.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is handled only once.
  Future<AssociateResourcesToSubscriptionOutput>
      associateResourcesToSubscription({
    required String arn,
    required String ifMatch,
    required List<String> resourceArns,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'arn': arn,
      'resourceArns': resourceArns,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/AssociateResourcesToSubscription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return AssociateResourcesToSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Cancels a flat-rate pricing subscription.
  /// <note>
  /// For active subscriptions, the cancellation is scheduled to take effect at
  /// the end of the current billing period. The subscription remains active
  /// until that date. To revert a pending cancellation, use
  /// <code>CancelSubscriptionChange</code>.
  ///
  /// For subscriptions in <code>PENDING_APPROVAL</code> status, the
  /// subscription is deleted immediately without scheduling.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription to cancel.
  ///
  /// Parameter [ifMatch] :
  /// The <code>ETag</code> value from a previous <code>GetSubscription</code>
  /// or <code>ListSubscriptions</code> response.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is handled only once.
  Future<CancelSubscriptionOutput> cancelSubscription({
    required String arn,
    required String ifMatch,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'arn': arn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/CancelSubscription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CancelSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Cancels a pending scheduled change on a subscription, such as a pending
  /// downgrade or cancellation. The subscription returns to its state before
  /// the change was scheduled.
  /// <note>
  /// You cannot cancel a scheduled change close to its effective date. If the
  /// change is within the processing window, this operation returns an error.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription whose pending change you want to cancel.
  ///
  /// Parameter [ifMatch] :
  /// The <code>ETag</code> value from a previous <code>GetSubscription</code>
  /// or <code>ListSubscriptions</code> response.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is handled only once.
  Future<CancelSubscriptionChangeOutput> cancelSubscriptionChange({
    required String arn,
    required String ifMatch,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'arn': arn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/CancelSubscriptionChange',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CancelSubscriptionChangeOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Creates a flat-rate pricing subscription for the specified resources.
  /// <note>
  /// When <code>approvalMode</code> is set to <code>MANUAL</code>, paid-tier
  /// subscriptions are created in <code>PENDING_APPROVAL</code> status and
  /// require a separate <code>ApprovePaidSubscription</code> call before
  /// billing starts. Free-tier subscriptions are always activated immediately
  /// regardless of approval mode.
  ///
  /// When <code>approvalMode</code> is set to <code>IMMEDIATE</code> or is not
  /// specified, the subscription is activated immediately.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [planFamily] :
  /// The pricing plan family to subscribe to, such as <code>CloudFront</code>.
  ///
  /// Parameter [planTier] :
  /// The tier level for the subscription, such as <code>FREE</code>,
  /// <code>PRO</code>, <code>BUSINESS</code>, or <code>PREMIUM</code>.
  ///
  /// Parameter [resourceArns] :
  /// The ARNs of the AWS resources to include in the subscription. Specify one
  /// or more supported resources.
  /// <note>
  /// For subscriptions in the CloudFront plan family, the resources must
  /// include exactly one Amazon CloudFront distribution and exactly one AWS WAF
  /// web ACL. You can also include other supported resources, such as Amazon
  /// Route 53 hosted zones and CloudFront KeyValueStores.
  /// </note>
  ///
  /// Parameter [approvalMode] :
  /// Determines whether the subscription requires explicit approval before
  /// billing starts. Set to <code>MANUAL</code> to require a separate
  /// <code>ApprovePaidSubscription</code> call, or <code>IMMEDIATE</code> to
  /// activate the subscription right away. Defaults to <code>IMMEDIATE</code>
  /// if not specified.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure that the
  /// request is handled only once. If you send the same request with the same
  /// client token, the API returns the original response without creating a
  /// duplicate subscription.
  ///
  /// Parameter [usageLevel] :
  /// The usage level within the plan tier. Specify <code>DEFAULT</code> for the
  /// base configuration, or a higher level if your plan tier supports it.
  Future<CreateSubscriptionOutput> createSubscription({
    required String planFamily,
    required String planTier,
    required List<String> resourceArns,
    ApprovalMode? approvalMode,
    String? clientToken,
    String? usageLevel,
  }) async {
    final $payload = <String, dynamic>{
      'planFamily': planFamily,
      'planTier': planTier,
      'resourceArns': resourceArns,
      if (approvalMode != null) 'approvalMode': approvalMode.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (usageLevel != null) 'usageLevel': usageLevel,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/CreateSubscription',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Removes one or more resources from an existing subscription.
  /// <note>
  /// For subscriptions in the CloudFront plan family, the associated resources
  /// must always include exactly one Amazon CloudFront distribution and exactly
  /// one AWS WAF web ACL. You cannot remove these required resources.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription to remove resources from.
  ///
  /// Parameter [ifMatch] :
  /// The <code>ETag</code> value from a previous <code>GetSubscription</code>
  /// or <code>ListSubscriptions</code> response.
  ///
  /// Parameter [resourceArns] :
  /// The ARNs of the resources to remove from the subscription. For
  /// subscriptions in the CloudFront plan family, you cannot remove the
  /// required CloudFront distribution or WAF web ACL.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is handled only once.
  Future<DisassociateResourcesFromSubscriptionOutput>
      disassociateResourcesFromSubscription({
    required String arn,
    required String ifMatch,
    required List<String> resourceArns,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'arn': arn,
      'resourceArns': resourceArns,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/DisassociateResourcesFromSubscription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DisassociateResourcesFromSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Returns the details of a flat-rate pricing subscription, including its
  /// current status, associated resources, and any pending scheduled changes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription to retrieve.
  Future<GetSubscriptionOutput> getSubscription({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/GetSubscription',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }

  /// Returns a summary of all flat-rate pricing subscriptions in the calling
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// A token from a previous <code>ListSubscriptions</code> response. If the
  /// response included a <code>nextToken</code>, there are more results
  /// available. Pass this value to retrieve the next page of results.
  Future<ListSubscriptionsOutput> listSubscriptions({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/ListSubscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionsOutput.fromJson(response);
  }

  /// Changes the plan tier of an existing subscription.
  /// <note>
  /// Upgrades take effect immediately. Downgrades are scheduled and the current
  /// tier remains unchanged until the end of the billing cycle (calendar
  /// month). You cannot update a subscription while a scheduled change is
  /// pending. To make a new change, first cancel the pending change using
  /// <code>CancelSubscriptionChange</code>.
  ///
  /// This operation replaces the plan tier value. If you omit the optional
  /// <code>usageLevel</code> field, it is reset to the default.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The ARN of the subscription to update.
  ///
  /// Parameter [ifMatch] :
  /// The <code>ETag</code> value from a previous <code>GetSubscription</code>
  /// or <code>ListSubscriptions</code> response. This ensures you are updating
  /// the expected version of the subscription.
  ///
  /// Parameter [planTier] :
  /// The new tier level for the subscription.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the request
  /// is handled only once.
  ///
  /// Parameter [usageLevel] :
  /// The usage level within the plan tier. Specify <code>DEFAULT</code> for the
  /// base configuration. If omitted, the usage level is reset to the default.
  Future<UpdateSubscriptionOutput> updateSubscription({
    required String arn,
    required String ifMatch,
    required String planTier,
    String? clientToken,
    String? usageLevel,
  }) async {
    final headers = <String, String>{
      'If-Match': ifMatch.toString(),
    };
    final $payload = <String, dynamic>{
      'arn': arn,
      'planTier': planTier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (usageLevel != null) 'usageLevel': usageLevel,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/UpdateSubscription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateSubscriptionOutput(
      subscription: Subscription.fromJson($json),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag')!,
    );
  }
}

/// @nodoc
class ApprovePaidSubscriptionOutput {
  /// The updated entity tag for concurrency control.
  final String eTag;

  /// The details of the approved subscription.
  final Subscription subscription;

  ApprovePaidSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class AssociateResourcesToSubscriptionOutput {
  /// The updated entity tag for concurrency control.
  final String eTag;

  /// The details of the subscription with the newly added resources.
  final Subscription subscription;

  AssociateResourcesToSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class CancelSubscriptionOutput {
  /// The updated entity tag for concurrency control.
  final String eTag;

  /// The details of the subscription with the pending cancellation. For active
  /// subscriptions, a <code>scheduledChange</code> of type
  /// <code>CANCELLATION</code> is included.
  final Subscription subscription;

  CancelSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class CancelSubscriptionChangeOutput {
  /// The updated entity tag for concurrency control.
  final String eTag;

  /// The details of the subscription with the pending change removed.
  final Subscription subscription;

  CancelSubscriptionChangeOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class CreateSubscriptionOutput {
  /// The entity tag for concurrency control. Use this value in the
  /// <code>If-Match</code> header for subsequent operations on this subscription.
  final String eTag;

  /// The details of the newly created subscription.
  final Subscription subscription;

  CreateSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class DisassociateResourcesFromSubscriptionOutput {
  /// The updated entity tag for concurrency control.
  final String eTag;

  /// The details of the subscription with the specified resources removed.
  final Subscription subscription;

  DisassociateResourcesFromSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class GetSubscriptionOutput {
  /// The entity tag for concurrency control. Use this value in the
  /// <code>If-Match</code> header for subsequent operations on this subscription.
  final String eTag;

  /// The details of the requested subscription.
  final Subscription subscription;

  GetSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// @nodoc
class ListSubscriptionsOutput {
  /// The list of subscription summaries for the calling account.
  final List<SubscriptionSummary> subscriptionSummaries;

  /// A token that indicates there are more results available. Pass this value in
  /// a subsequent <code>ListSubscriptions</code> request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListSubscriptionsOutput({
    required this.subscriptionSummaries,
    this.nextToken,
  });

  factory ListSubscriptionsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsOutput(
      subscriptionSummaries: ((json['subscriptionSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => SubscriptionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionSummaries = this.subscriptionSummaries;
    final nextToken = this.nextToken;
    return {
      'subscriptionSummaries': subscriptionSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateSubscriptionOutput {
  /// The updated entity tag for concurrency control.
  final String eTag;

  /// The details of the updated subscription. For downgrades, the current tier
  /// remains unchanged and a <code>scheduledChange</code> indicates the pending
  /// change.
  final Subscription subscription;

  UpdateSubscriptionOutput({
    required this.eTag,
    required this.subscription,
  });

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final subscription = this.subscription;
    return {
      'subscription': subscription,
    };
  }
}

/// The full details of a flat-rate pricing subscription, including its current
/// configuration, status, and associated resources.
///
/// @nodoc
class Subscription {
  /// The Amazon Resource Name (ARN) that uniquely identifies this subscription.
  final String arn;

  /// The date and time when the subscription was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The pricing plan family for the subscription, such as
  /// <code>CloudFront</code>.
  final String planFamily;

  /// The current tier level of the pricing plan, such as <code>FREE</code>,
  /// <code>PRO</code>, <code>BUSINESS</code>, or <code>PREMIUM</code>.
  final String planTier;

  /// The ARNs of the AWS resources covered by this subscription.
  final List<String> resourceArns;

  /// The current status of the subscription. For the list of possible values, see
  /// the <code>Status</code> type.
  final Status status;

  /// The date and time when the subscription was last modified, in ISO 8601
  /// format.
  final DateTime updatedAt;

  /// A pending change that will take effect at the end of the current billing
  /// period. This field is present only when a downgrade or cancellation is
  /// scheduled.
  final ScheduledChange? scheduledChange;

  /// A human-readable explanation of the current status, present when additional
  /// context is available.
  final String? statusReason;

  /// The usage level within the plan tier. When present, indicates a specific
  /// capacity configuration beyond the base tier.
  final String? usageLevel;

  Subscription({
    required this.arn,
    required this.createdAt,
    required this.planFamily,
    required this.planTier,
    required this.resourceArns,
    required this.status,
    required this.updatedAt,
    this.scheduledChange,
    this.statusReason,
    this.usageLevel,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      planFamily: (json['planFamily'] as String?) ?? '',
      planTier: (json['planTier'] as String?) ?? '',
      resourceArns: ((json['resourceArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: Status.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      scheduledChange: json['scheduledChange'] != null
          ? ScheduledChange.fromJson(
              json['scheduledChange'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
      usageLevel: json['usageLevel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final planFamily = this.planFamily;
    final planTier = this.planTier;
    final resourceArns = this.resourceArns;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final scheduledChange = this.scheduledChange;
    final statusReason = this.statusReason;
    final usageLevel = this.usageLevel;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'planFamily': planFamily,
      'planTier': planTier,
      'resourceArns': resourceArns,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (scheduledChange != null) 'scheduledChange': scheduledChange,
      if (statusReason != null) 'statusReason': statusReason,
      if (usageLevel != null) 'usageLevel': usageLevel,
    };
  }
}

/// A pending change on a subscription that takes effect at the end of the
/// current billing period, such as a tier downgrade or cancellation.
///
/// @nodoc
class ScheduledChange {
  /// The type of pending change. Possible values are <code>DOWNGRADE</code> (a
  /// tier change to a lower level) and <code>CANCELLATION</code> (subscription
  /// termination).
  final ScheduledChangeType changeType;

  /// The date and time when the change takes effect, in ISO 8601 format. This
  /// value is populated after the change is confirmed by the billing system.
  final DateTime? effectiveDate;

  /// For downgrades, the tier level that the subscription will change to. Not
  /// present for cancellations.
  final String? planTier;

  /// For downgrades, the target usage level after the change takes effect.
  final String? usageLevel;

  ScheduledChange({
    required this.changeType,
    this.effectiveDate,
    this.planTier,
    this.usageLevel,
  });

  factory ScheduledChange.fromJson(Map<String, dynamic> json) {
    return ScheduledChange(
      changeType:
          ScheduledChangeType.fromString((json['changeType'] as String?) ?? ''),
      effectiveDate: timeStampFromJson(json['effectiveDate']),
      planTier: json['planTier'] as String?,
      usageLevel: json['usageLevel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeType = this.changeType;
    final effectiveDate = this.effectiveDate;
    final planTier = this.planTier;
    final usageLevel = this.usageLevel;
    return {
      'changeType': changeType.value,
      if (effectiveDate != null) 'effectiveDate': iso8601ToJson(effectiveDate),
      if (planTier != null) 'planTier': planTier,
      if (usageLevel != null) 'usageLevel': usageLevel,
    };
  }
}

/// The status of a flat-rate pricing subscription.
///
/// Possible values:
///
/// <ul>
/// <li>
/// <code>PENDING_APPROVAL</code> — The subscription was created with manual
/// approval and is waiting for an <code>ApprovePaidSubscription</code> call.
/// </li>
/// <li>
/// <code>ACTIVE</code> — The subscription is active and resources are covered
/// by flat-rate pricing.
/// </li>
/// <li>
/// <code>SYNC_IN_PROGRESS</code> — A change is being applied to the
/// subscription. Wait for the operation to complete before making additional
/// changes.
/// </li>
/// <li>
/// <code>FAILED</code> — The subscription encountered an error. Check the
/// <code>statusReason</code> field for details.
/// </li>
/// </ul>
///
/// @nodoc
class Status {
  static const pendingApproval = Status._('PENDING_APPROVAL');
  static const active = Status._('ACTIVE');
  static const syncInProgress = Status._('SYNC_IN_PROGRESS');
  static const failed = Status._('FAILED');

  final String value;

  const Status._(this.value);

  static const values = [pendingApproval, active, syncInProgress, failed];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of pending change on a subscription.
///
/// Possible values:
///
/// <ul>
/// <li>
/// <code>DOWNGRADE</code> — The subscription tier is being lowered at the end
/// of the billing period.
/// </li>
/// <li>
/// <code>CANCELLATION</code> — The subscription is being terminated at the end
/// of the billing period.
/// </li>
/// </ul>
///
/// @nodoc
class ScheduledChangeType {
  static const downgrade = ScheduledChangeType._('DOWNGRADE');
  static const cancellation = ScheduledChangeType._('CANCELLATION');

  final String value;

  const ScheduledChangeType._(this.value);

  static const values = [downgrade, cancellation];

  static ScheduledChangeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduledChangeType._(value));

  @override
  bool operator ==(other) =>
      other is ScheduledChangeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information for a flat-rate pricing subscription, as returned by
/// list operations.
///
/// @nodoc
class SubscriptionSummary {
  /// The Amazon Resource Name (ARN) that uniquely identifies this subscription.
  final String arn;

  /// The date and time when the subscription was created, in ISO 8601 format.
  final DateTime createdAt;

  /// The entity tag for concurrency control. Pass this value in the
  /// <code>If-Match</code> header when making changes to this subscription.
  final String eTag;

  /// The pricing plan family for the subscription, such as
  /// <code>CloudFront</code>.
  final String planFamily;

  /// The current tier level of the pricing plan.
  final String planTier;

  /// The ARNs of the AWS resources covered by this subscription.
  final List<String> resourceArns;

  /// The current status of the subscription.
  final Status status;

  /// The date and time when the subscription was last modified, in ISO 8601
  /// format.
  final DateTime updatedAt;

  /// A pending change that will take effect at the end of the current billing
  /// period, if any.
  final ScheduledChange? scheduledChange;

  /// A human-readable explanation of the current status, present when additional
  /// context is available.
  final String? statusReason;

  /// The usage level within the plan tier.
  final String? usageLevel;

  SubscriptionSummary({
    required this.arn,
    required this.createdAt,
    required this.eTag,
    required this.planFamily,
    required this.planTier,
    required this.resourceArns,
    required this.status,
    required this.updatedAt,
    this.scheduledChange,
    this.statusReason,
    this.usageLevel,
  });

  factory SubscriptionSummary.fromJson(Map<String, dynamic> json) {
    return SubscriptionSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      eTag: (json['eTag'] as String?) ?? '',
      planFamily: (json['planFamily'] as String?) ?? '',
      planTier: (json['planTier'] as String?) ?? '',
      resourceArns: ((json['resourceArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: Status.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      scheduledChange: json['scheduledChange'] != null
          ? ScheduledChange.fromJson(
              json['scheduledChange'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
      usageLevel: json['usageLevel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final eTag = this.eTag;
    final planFamily = this.planFamily;
    final planTier = this.planTier;
    final resourceArns = this.resourceArns;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final scheduledChange = this.scheduledChange;
    final statusReason = this.statusReason;
    final usageLevel = this.usageLevel;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'eTag': eTag,
      'planFamily': planFamily,
      'planTier': planTier,
      'resourceArns': resourceArns,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (scheduledChange != null) 'scheduledChange': scheduledChange,
      if (statusReason != null) 'statusReason': statusReason,
      if (usageLevel != null) 'usageLevel': usageLevel,
    };
  }
}

/// Determines whether a subscription requires explicit approval before billing
/// starts.
///
/// @nodoc
class ApprovalMode {
  static const manual = ApprovalMode._('MANUAL');
  static const immediate = ApprovalMode._('IMMEDIATE');

  final String value;

  const ApprovalMode._(this.value);

  static const values = [manual, immediate];

  static ApprovalMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ApprovalMode._(value));

  @override
  bool operator ==(other) => other is ApprovalMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
