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

/// Amazon Web Services Billing Conductor is a fully managed service that you
/// can use to customize a <a
/// href="https://docs.aws.amazon.com/billingconductor/latest/userguide/understanding-eb.html#eb-other-definitions">proforma</a>
/// version of your billing data each month, to accurately show or chargeback
/// your end customers. Amazon Web Services Billing Conductor doesn't change the
/// way you're billed by Amazon Web Services each month by design. Instead, it
/// provides you with a mechanism to configure, generate, and display rates to
/// certain customers over a given billing period. You can also analyze the
/// difference between the rates you apply to your accounting groupings relative
/// to your actual rates from Amazon Web Services. As a result of your Amazon
/// Web Services Billing Conductor configuration, the payer account can also see
/// the custom rate applied on the billing details page of the <a
/// href="https://console.aws.amazon.com/billing">Amazon Web Services Billing
/// console</a>, or configure a cost and usage report per billing group.
///
/// This documentation shows how you can configure Amazon Web Services Billing
/// Conductor using its API. For more information about using the <a
/// href="https://console.aws.amazon.com/billingconductor/">Amazon Web Services
/// Billing Conductor</a> user interface, see the <a
/// href="https://docs.aws.amazon.com/billingconductor/latest/userguide/what-is-billingconductor.html">
/// Amazon Web Services Billing Conductor User Guide</a>.
class BillingConductor {
  final _s.RestJsonProtocol _protocol;
  BillingConductor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'billingconductor',
            signingName: 'billingconductor',
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

  /// Connects an array of account IDs in a consolidated billing family to a
  /// predefined billing group. The account IDs must be a part of the
  /// consolidated billing family during the current month, and not already
  /// associated with another billing group. The maximum number of accounts that
  /// can be associated in one call is 30.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The associating array of account IDs.
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing group that associates the
  /// array of account IDs.
  Future<AssociateAccountsOutput> associateAccounts({
    required List<String> accountIds,
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associate-accounts',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateAccountsOutput.fromJson(response);
  }

  /// Connects an array of <code>PricingRuleArns</code> to a defined
  /// <code>PricingPlan</code>. The maximum number <code>PricingRuleArn</code>
  /// that can be associated in one call is 30.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The <code>PricingPlanArn</code> that the <code>PricingRuleArns</code> are
  /// associated with.
  ///
  /// Parameter [pricingRuleArns] :
  /// The <code>PricingRuleArns</code> that are associated with the Pricing
  /// Plan.
  Future<AssociatePricingRulesOutput> associatePricingRules({
    required String arn,
    required List<String> pricingRuleArns,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'PricingRuleArns': pricingRuleArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/associate-pricing-rules',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePricingRulesOutput.fromJson(response);
  }

  /// Associates a batch of resources to a percentage custom line item.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// A list containing the ARNs of the resources to be associated.
  ///
  /// Parameter [targetArn] :
  /// A percentage custom line item ARN to associate the resources to.
  Future<BatchAssociateResourcesToCustomLineItemOutput>
      batchAssociateResourcesToCustomLineItem({
    required List<String> resourceArns,
    required String targetArn,
    CustomLineItemBillingPeriodRange? billingPeriodRange,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArns': resourceArns,
      'TargetArn': targetArn,
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/batch-associate-resources-to-custom-line-item',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateResourcesToCustomLineItemOutput.fromJson(response);
  }

  /// Disassociates a batch of resources from a percentage custom line item.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArns] :
  /// A list containing the ARNs of resources to be disassociated.
  ///
  /// Parameter [targetArn] :
  /// A percentage custom line item ARN to disassociate the resources from.
  Future<BatchDisassociateResourcesFromCustomLineItemOutput>
      batchDisassociateResourcesFromCustomLineItem({
    required List<String> resourceArns,
    required String targetArn,
    CustomLineItemBillingPeriodRange? billingPeriodRange,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArns': resourceArns,
      'TargetArn': targetArn,
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/batch-disassociate-resources-from-custom-line-item',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateResourcesFromCustomLineItemOutput.fromJson(
        response);
  }

  /// Creates a billing group that resembles a consolidated billing family that
  /// Amazon Web Services charges, based off of the predefined pricing plan
  /// computation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountGrouping] :
  /// The set of accounts that will be under the billing group. The set of
  /// accounts resemble the linked accounts in a consolidated billing family.
  ///
  /// Parameter [computationPreference] :
  /// The preferences and settings that will be used to compute the Amazon Web
  /// Services charges for a billing group.
  ///
  /// Parameter [name] :
  /// The billing group name. The names must be unique.
  ///
  /// Parameter [clientToken] :
  /// The token that is needed to support idempotency. Idempotency isn't
  /// currently supported, but will be implemented in a future update.
  ///
  /// Parameter [description] :
  /// The description of the billing group.
  ///
  /// Parameter [primaryAccountId] :
  /// The account ID that serves as the main account in a billing group.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to a billing
  /// group. This feature isn't available during the beta.
  Future<CreateBillingGroupOutput> createBillingGroup({
    required AccountGrouping accountGrouping,
    required ComputationPreference computationPreference,
    required String name,
    String? clientToken,
    String? description,
    String? primaryAccountId,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'AccountGrouping': accountGrouping,
      'ComputationPreference': computationPreference,
      'Name': name,
      if (description != null) 'Description': description,
      if (primaryAccountId != null) 'PrimaryAccountId': primaryAccountId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-billing-group',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateBillingGroupOutput.fromJson(response);
  }

  /// Creates a custom line item that can be used to create a one-time fixed
  /// charge that can be applied to a single billing group for the current or
  /// previous billing period. The one-time fixed charge is either a fee or
  /// discount.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [billingGroupArn] :
  /// The Amazon Resource Name (ARN) that references the billing group where the
  /// custom line item applies to.
  ///
  /// Parameter [chargeDetails] :
  /// A <code>CustomLineItemChargeDetails</code> that describes the charge
  /// details for a custom line item.
  ///
  /// Parameter [description] :
  /// The description of the custom line item. This is shown on the Bills page
  /// in association with the charge value.
  ///
  /// Parameter [name] :
  /// The name of the custom line item.
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account in which this custom line item will be
  /// applied to.
  ///
  /// Parameter [billingPeriodRange] :
  /// A time range for which the custom line item is effective.
  ///
  /// Parameter [clientToken] :
  /// The token that is needed to support idempotency. Idempotency isn't
  /// currently supported, but will be implemented in a future update.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to a custom
  /// line item.
  Future<CreateCustomLineItemOutput> createCustomLineItem({
    required String billingGroupArn,
    required CustomLineItemChargeDetails chargeDetails,
    required String description,
    required String name,
    String? accountId,
    CustomLineItemBillingPeriodRange? billingPeriodRange,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'BillingGroupArn': billingGroupArn,
      'ChargeDetails': chargeDetails,
      'Description': description,
      'Name': name,
      if (accountId != null) 'AccountId': accountId,
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-custom-line-item',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomLineItemOutput.fromJson(response);
  }

  /// Creates a pricing plan that is used for computing Amazon Web Services
  /// charges for billing groups.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [name] :
  /// The name of the pricing plan. The names must be unique to each pricing
  /// plan.
  ///
  /// Parameter [clientToken] :
  /// The token that is needed to support idempotency. Idempotency isn't
  /// currently supported, but will be implemented in a future update.
  ///
  /// Parameter [description] :
  /// The description of the pricing plan.
  ///
  /// Parameter [pricingRuleArns] :
  /// A list of Amazon Resource Names (ARNs) that define the pricing plan
  /// parameters.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to a pricing
  /// plan.
  Future<CreatePricingPlanOutput> createPricingPlan({
    required String name,
    String? clientToken,
    String? description,
    List<String>? pricingRuleArns,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      if (description != null) 'Description': description,
      if (pricingRuleArns != null) 'PricingRuleArns': pricingRuleArns,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-pricing-plan',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePricingPlanOutput.fromJson(response);
  }

  /// Creates a pricing rule can be associated to a pricing plan, or a set of
  /// pricing plans.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The pricing rule name. The names must be unique to each pricing rule.
  ///
  /// Parameter [scope] :
  /// The scope of pricing rule that indicates if it's globally applicable, or
  /// it's service-specific.
  ///
  /// Parameter [type] :
  /// The type of pricing rule.
  ///
  /// Parameter [billingEntity] :
  /// The seller of services provided by Amazon Web Services, their affiliates,
  /// or third-party providers selling services via Amazon Web Services
  /// Marketplace.
  ///
  /// Parameter [clientToken] :
  /// The token that's needed to support idempotency. Idempotency isn't
  /// currently supported, but will be implemented in a future update.
  ///
  /// Parameter [description] :
  /// The pricing rule description.
  ///
  /// Parameter [modifierPercentage] :
  /// A percentage modifier that's applied on the public pricing rates.
  ///
  /// Parameter [operation] :
  /// Operation is the specific Amazon Web Services action covered by this line
  /// item. This describes the specific usage of the line item.
  ///
  /// If the <code>Scope</code> attribute is set to <code>SKU</code>, this
  /// attribute indicates which operation the <code>PricingRule</code> is
  /// modifying. For example, a value of <code>RunInstances:0202</code>
  /// indicates the operation of running an Amazon EC2 instance.
  ///
  /// Parameter [service] :
  /// If the <code>Scope</code> attribute is set to <code>SERVICE</code> or
  /// <code>SKU</code>, the attribute indicates which service the
  /// <code>PricingRule</code> is applicable for.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to a pricing
  /// rule.
  ///
  /// Parameter [tiering] :
  /// The set of tiering configurations for the pricing rule.
  ///
  /// Parameter [usageType] :
  /// Usage type is the unit that each service uses to measure the usage of a
  /// specific type of resource.
  ///
  /// If the <code>Scope</code> attribute is set to <code>SKU</code>, this
  /// attribute indicates which usage type the <code>PricingRule</code> is
  /// modifying. For example, <code>USW2-BoxUsage:m2.2xlarge</code> describes
  /// an<code> M2 High Memory Double Extra Large</code> instance in the US West
  /// (Oregon) Region. <pre><code>&lt;/p&gt; </code></pre>
  Future<CreatePricingRuleOutput> createPricingRule({
    required String name,
    required PricingRuleScope scope,
    required PricingRuleType type,
    String? billingEntity,
    String? clientToken,
    String? description,
    double? modifierPercentage,
    String? operation,
    String? service,
    Map<String, String>? tags,
    CreateTieringInput? tiering,
    String? usageType,
  }) async {
    _s.validateNumRange(
      'modifierPercentage',
      modifierPercentage,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amzn-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Name': name,
      'Scope': scope.toValue(),
      'Type': type.toValue(),
      if (billingEntity != null) 'BillingEntity': billingEntity,
      if (description != null) 'Description': description,
      if (modifierPercentage != null) 'ModifierPercentage': modifierPercentage,
      if (operation != null) 'Operation': operation,
      if (service != null) 'Service': service,
      if (tags != null) 'Tags': tags,
      if (tiering != null) 'Tiering': tiering,
      if (usageType != null) 'UsageType': usageType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-pricing-rule',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePricingRuleOutput.fromJson(response);
  }

  /// Deletes a billing group.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing group that you're deleting.
  Future<DeleteBillingGroupOutput> deleteBillingGroup({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-billing-group',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBillingGroupOutput.fromJson(response);
  }

  /// Deletes the custom line item identified by the given ARN in the current,
  /// or previous billing period.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The ARN of the custom line item to be deleted.
  Future<DeleteCustomLineItemOutput> deleteCustomLineItem({
    required String arn,
    CustomLineItemBillingPeriodRange? billingPeriodRange,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-custom-line-item',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCustomLineItemOutput.fromJson(response);
  }

  /// Deletes a pricing plan. The pricing plan must not be associated with any
  /// billing groups to delete successfully.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pricing plan that you're deleting.
  Future<DeletePricingPlanOutput> deletePricingPlan({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-pricing-plan',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePricingPlanOutput.fromJson(response);
  }

  /// Deletes the pricing rule that's identified by the input Amazon Resource
  /// Name (ARN).
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pricing rule that you are deleting.
  Future<DeletePricingRuleOutput> deletePricingRule({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-pricing-rule',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePricingRuleOutput.fromJson(response);
  }

  /// Removes the specified list of account IDs from the given billing group.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accountIds] :
  /// The array of account IDs to disassociate.
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing group that the array of
  /// account IDs will disassociate from.
  Future<DisassociateAccountsOutput> disassociateAccounts({
    required List<String> accountIds,
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'AccountIds': accountIds,
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociate-accounts',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateAccountsOutput.fromJson(response);
  }

  /// Disassociates a list of pricing rules from a pricing plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The pricing plan Amazon Resource Name (ARN) to disassociate pricing rules
  /// from.
  ///
  /// Parameter [pricingRuleArns] :
  /// A list containing the Amazon Resource Name (ARN) of the pricing rules that
  /// will be disassociated.
  Future<DisassociatePricingRulesOutput> disassociatePricingRules({
    required String arn,
    required List<String> pricingRuleArns,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'PricingRuleArns': pricingRuleArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/disassociate-pricing-rules',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociatePricingRulesOutput.fromJson(response);
  }

  /// Retrieves the margin summary report, which includes the Amazon Web
  /// Services cost and charged amount (pro forma cost) by Amazon Web Service
  /// for a specific billing group.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Number (ARN) that uniquely identifies the billing
  /// group.
  ///
  /// Parameter [billingPeriodRange] :
  /// A time range for which the margin summary is effective. You can specify up
  /// to 12 months.
  ///
  /// Parameter [groupBy] :
  /// A list of strings that specify the attributes that are used to break down
  /// costs in the margin summary reports for the billing group. For example,
  /// you can view your costs by the Amazon Web Service name or the billing
  /// period.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of margin summary reports to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used on subsequent calls to get reports.
  Future<GetBillingGroupCostReportOutput> getBillingGroupCostReport({
    required String arn,
    BillingPeriodRange? billingPeriodRange,
    List<GroupByAttributeName>? groupBy,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      200,
      300,
    );
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
      if (groupBy != null) 'GroupBy': groupBy.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-billing-group-cost-report',
      exceptionFnMap: _exceptionFns,
    );
    return GetBillingGroupCostReportOutput.fromJson(response);
  }

  /// This is a paginated call to list linked accounts that are linked to the
  /// payer account for the specified time period. If no information is
  /// provided, the current billing period is used. The response will optionally
  /// include the billing group that's associated with the linked account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingPeriod] :
  /// The preferred billing period to get account associations.
  ///
  /// Parameter [filters] :
  /// The filter on the account ID of the linked account, or any of the
  /// following:
  ///
  /// <code>MONITORED</code>: linked accounts that are associated to billing
  /// groups.
  ///
  /// <code>UNMONITORED</code>: linked accounts that aren't associated to
  /// billing groups.
  ///
  /// <code>Billing Group Arn</code>: linked accounts that are associated to the
  /// provided billing group Arn.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent calls to retrieve accounts.
  Future<ListAccountAssociationsOutput> listAccountAssociations({
    String? billingPeriod,
    ListAccountAssociationsFilter? filters,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-account-associations',
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountAssociationsOutput.fromJson(response);
  }

  /// A paginated call to retrieve a summary report of actual Amazon Web
  /// Services charges and the calculated Amazon Web Services charges based on
  /// the associated pricing plan of a billing group.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingPeriod] :
  /// The preferred billing period for your report.
  ///
  /// Parameter [filters] :
  /// A <code>ListBillingGroupCostReportsFilter</code> to specify billing groups
  /// to retrieve reports from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of reports to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent calls to get reports.
  Future<ListBillingGroupCostReportsOutput> listBillingGroupCostReports({
    String? billingPeriod,
    ListBillingGroupCostReportsFilter? filters,
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
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-billing-group-cost-reports',
      exceptionFnMap: _exceptionFns,
    );
    return ListBillingGroupCostReportsOutput.fromJson(response);
  }

  /// A paginated call to retrieve a list of billing groups for the given
  /// billing period. If you don't provide a billing group, the current billing
  /// period is used.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingPeriod] :
  /// The preferred billing period to get billing groups.
  ///
  /// Parameter [filters] :
  /// A <code>ListBillingGroupsFilter</code> that specifies the billing group
  /// and pricing plan to retrieve billing group information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of billing groups to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent calls to get billing
  /// groups.
  Future<ListBillingGroupsOutput> listBillingGroups({
    String? billingPeriod,
    ListBillingGroupsFilter? filters,
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
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-billing-groups',
      exceptionFnMap: _exceptionFns,
    );
    return ListBillingGroupsOutput.fromJson(response);
  }

  /// A paginated call to get a list of all custom line item versions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for the custom line item.
  ///
  /// Parameter [filters] :
  /// A <code>ListCustomLineItemVersionsFilter</code> that specifies the billing
  /// period range in which the custom line item versions are applied.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom line item versions to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent calls to retrieve custom
  /// line item versions.
  Future<ListCustomLineItemVersionsOutput> listCustomLineItemVersions({
    required String arn,
    ListCustomLineItemVersionsFilter? filters,
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
      'Arn': arn,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-custom-line-item-versions',
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomLineItemVersionsOutput.fromJson(response);
  }

  /// A paginated call to get a list of all custom line items (FFLIs) for the
  /// given billing period. If you don't provide a billing period, the current
  /// billing period is used.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingPeriod] :
  /// The preferred billing period to get custom line items (FFLIs).
  ///
  /// Parameter [filters] :
  /// A <code>ListCustomLineItemsFilter</code> that specifies the custom line
  /// item names and/or billing group Amazon Resource Names (ARNs) to retrieve
  /// FFLI information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of billing groups to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent calls to get custom line
  /// items (FFLIs).
  Future<ListCustomLineItemsOutput> listCustomLineItems({
    String? billingPeriod,
    ListCustomLineItemsFilter? filters,
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
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-custom-line-items',
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomLineItemsOutput.fromJson(response);
  }

  /// A paginated call to get pricing plans for the given billing period. If you
  /// don't provide a billing period, the current billing period is used.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [billingPeriod] :
  /// The preferred billing period to get pricing plan.
  ///
  /// Parameter [filters] :
  /// A <code>ListPricingPlansFilter</code> that specifies the Amazon Resource
  /// Name (ARNs) of pricing plans to retrieve pricing plans information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pricing plans to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent call to get pricing plans.
  Future<ListPricingPlansOutput> listPricingPlans({
    String? billingPeriod,
    ListPricingPlansFilter? filters,
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
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-pricing-plans',
      exceptionFnMap: _exceptionFns,
    );
    return ListPricingPlansOutput.fromJson(response);
  }

  /// A list of the pricing plans that are associated with a pricing rule.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [pricingRuleArn] :
  /// The pricing rule Amazon Resource Name (ARN) for which associations will be
  /// listed.
  ///
  /// Parameter [billingPeriod] :
  /// The pricing plan billing period for which associations will be listed.
  ///
  /// Parameter [maxResults] :
  /// The optional maximum number of pricing rule associations to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The optional pagination token returned by a previous call.
  Future<ListPricingPlansAssociatedWithPricingRuleOutput>
      listPricingPlansAssociatedWithPricingRule({
    required String pricingRuleArn,
    String? billingPeriod,
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
      'PricingRuleArn': pricingRuleArn,
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-pricing-plans-associated-with-pricing-rule',
      exceptionFnMap: _exceptionFns,
    );
    return ListPricingPlansAssociatedWithPricingRuleOutput.fromJson(response);
  }

  /// Describes a pricing rule that can be associated to a pricing plan, or set
  /// of pricing plans.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [billingPeriod] :
  /// The preferred billing period to get the pricing plan.
  ///
  /// Parameter [filters] :
  /// A <code>DescribePricingRuleFilter</code> that specifies the Amazon
  /// Resource Name (ARNs) of pricing rules to retrieve pricing rules
  /// information.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pricing rules to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used on subsequent call to get pricing rules.
  Future<ListPricingRulesOutput> listPricingRules({
    String? billingPeriod,
    ListPricingRulesFilter? filters,
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
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-pricing-rules',
      exceptionFnMap: _exceptionFns,
    );
    return ListPricingRulesOutput.fromJson(response);
  }

  /// Lists the pricing rules that are associated with a pricing plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [pricingPlanArn] :
  /// The Amazon Resource Name (ARN) of the pricing plan for which associations
  /// are to be listed.
  ///
  /// Parameter [billingPeriod] :
  /// The billing period for which the pricing rule associations are to be
  /// listed.
  ///
  /// Parameter [maxResults] :
  /// The optional maximum number of pricing rule associations to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The optional pagination token returned by a previous call.
  Future<ListPricingRulesAssociatedToPricingPlanOutput>
      listPricingRulesAssociatedToPricingPlan({
    required String pricingPlanArn,
    String? billingPeriod,
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
      'PricingPlanArn': pricingPlanArn,
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-pricing-rules-associated-to-pricing-plan',
      exceptionFnMap: _exceptionFns,
    );
    return ListPricingRulesAssociatedToPricingPlanOutput.fromJson(response);
  }

  /// List the resources that are associated to a custom line item.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the custom line item for which the resource associations will
  /// be listed.
  ///
  /// Parameter [billingPeriod] :
  /// The billing period for which the resource associations will be listed.
  ///
  /// Parameter [filters] :
  /// (Optional) A <code>ListResourcesAssociatedToCustomLineItemFilter</code>
  /// that can specify the types of resources that should be retrieved.
  ///
  /// Parameter [maxResults] :
  /// (Optional) The maximum number of resource associations to be retrieved.
  ///
  /// Parameter [nextToken] :
  /// (Optional) The pagination token that's returned by a previous request.
  Future<ListResourcesAssociatedToCustomLineItemOutput>
      listResourcesAssociatedToCustomLineItem({
    required String arn,
    String? billingPeriod,
    ListResourcesAssociatedToCustomLineItemFilter? filters,
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
      'Arn': arn,
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-resources-associated-to-custom-line-item',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcesAssociatedToCustomLineItemOutput.fromJson(response);
  }

  /// A list the tags for a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags.
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

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource are not specified
  /// in the request parameters, they are not changed.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which to add tags.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource as a list of key-value pairs.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which to delete tags.
  ///
  /// Parameter [tagKeys] :
  /// The tags to delete from the resource as a list of key-value pairs.
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

  /// This updates an existing billing group.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing group being updated.
  ///
  /// Parameter [accountGrouping] :
  /// Specifies if the billing group has automatic account association
  /// (<code>AutoAssociate</code>) enabled.
  ///
  /// Parameter [computationPreference] :
  /// The preferences and settings that will be used to compute the Amazon Web
  /// Services charges for a billing group.
  ///
  /// Parameter [description] :
  /// A description of the billing group.
  ///
  /// Parameter [name] :
  /// The name of the billing group. The names must be unique to each billing
  /// group.
  ///
  /// Parameter [status] :
  /// The status of the billing group. Only one of the valid values can be used.
  Future<UpdateBillingGroupOutput> updateBillingGroup({
    required String arn,
    UpdateBillingGroupAccountGrouping? accountGrouping,
    ComputationPreference? computationPreference,
    String? description,
    String? name,
    BillingGroupStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (accountGrouping != null) 'AccountGrouping': accountGrouping,
      if (computationPreference != null)
        'ComputationPreference': computationPreference,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-billing-group',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBillingGroupOutput.fromJson(response);
  }

  /// Update an existing custom line item in the current or previous billing
  /// period.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the custom line item to be updated.
  ///
  /// Parameter [chargeDetails] :
  /// A <code>ListCustomLineItemChargeDetails</code> containing the new charge
  /// details for the custom line item.
  ///
  /// Parameter [description] :
  /// The new line item description of the custom line item.
  ///
  /// Parameter [name] :
  /// The new name for the custom line item.
  Future<UpdateCustomLineItemOutput> updateCustomLineItem({
    required String arn,
    CustomLineItemBillingPeriodRange? billingPeriodRange,
    UpdateCustomLineItemChargeDetails? chargeDetails,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
      if (chargeDetails != null) 'ChargeDetails': chargeDetails,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-custom-line-item',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCustomLineItemOutput.fromJson(response);
  }

  /// This updates an existing pricing plan.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pricing plan that you're updating.
  ///
  /// Parameter [description] :
  /// The description of the pricing plan.
  ///
  /// Parameter [name] :
  /// The name of the pricing plan. The name must be unique to each pricing
  /// plan.
  Future<UpdatePricingPlanOutput> updatePricingPlan({
    required String arn,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/update-pricing-plan',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePricingPlanOutput.fromJson(response);
  }

  /// Updates an existing pricing rule.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the pricing rule to update.
  ///
  /// Parameter [description] :
  /// The new description for the pricing rule.
  ///
  /// Parameter [modifierPercentage] :
  /// The new modifier to show pricing plan rates as a percentage.
  ///
  /// Parameter [name] :
  /// The new name of the pricing rule. The name must be unique to each pricing
  /// rule.
  ///
  /// Parameter [tiering] :
  /// The set of tiering configurations for the pricing rule.
  ///
  /// Parameter [type] :
  /// The new pricing rule type.
  Future<UpdatePricingRuleOutput> updatePricingRule({
    required String arn,
    String? description,
    double? modifierPercentage,
    String? name,
    UpdateTieringInput? tiering,
    PricingRuleType? type,
  }) async {
    _s.validateNumRange(
      'modifierPercentage',
      modifierPercentage,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (description != null) 'Description': description,
      if (modifierPercentage != null) 'ModifierPercentage': modifierPercentage,
      if (name != null) 'Name': name,
      if (tiering != null) 'Tiering': tiering,
      if (type != null) 'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/update-pricing-rule',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePricingRuleOutput.fromJson(response);
  }
}

/// A representation of a linked account.
class AccountAssociationsListElement {
  /// The Amazon Web Services account email.
  final String? accountEmail;

  /// The associating array of account IDs.
  final String? accountId;

  /// The Amazon Web Services account name.
  final String? accountName;

  /// The Billing Group Arn that the linked account is associated to.
  final String? billingGroupArn;

  AccountAssociationsListElement({
    this.accountEmail,
    this.accountId,
    this.accountName,
    this.billingGroupArn,
  });

  factory AccountAssociationsListElement.fromJson(Map<String, dynamic> json) {
    return AccountAssociationsListElement(
      accountEmail: json['AccountEmail'] as String?,
      accountId: json['AccountId'] as String?,
      accountName: json['AccountName'] as String?,
      billingGroupArn: json['BillingGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountEmail = this.accountEmail;
    final accountId = this.accountId;
    final accountName = this.accountName;
    final billingGroupArn = this.billingGroupArn;
    return {
      if (accountEmail != null) 'AccountEmail': accountEmail,
      if (accountId != null) 'AccountId': accountId,
      if (accountName != null) 'AccountName': accountName,
      if (billingGroupArn != null) 'BillingGroupArn': billingGroupArn,
    };
  }
}

/// The set of accounts that will be under the billing group. The set of
/// accounts resemble the linked accounts in a consolidated billing family.
class AccountGrouping {
  /// The account IDs that make up the billing group. Account IDs must be a part
  /// of the consolidated billing family, and not associated with another billing
  /// group.
  final List<String> linkedAccountIds;

  /// Specifies if this billing group will automatically associate newly added
  /// Amazon Web Services accounts that join your consolidated billing family.
  final bool? autoAssociate;

  AccountGrouping({
    required this.linkedAccountIds,
    this.autoAssociate,
  });

  Map<String, dynamic> toJson() {
    final linkedAccountIds = this.linkedAccountIds;
    final autoAssociate = this.autoAssociate;
    return {
      'LinkedAccountIds': linkedAccountIds,
      if (autoAssociate != null) 'AutoAssociate': autoAssociate,
    };
  }
}

class AssociateAccountsOutput {
  /// The Amazon Resource Name (ARN) of the billing group that associates the
  /// array of account IDs.
  final String? arn;

  AssociateAccountsOutput({
    this.arn,
  });

  factory AssociateAccountsOutput.fromJson(Map<String, dynamic> json) {
    return AssociateAccountsOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class AssociatePricingRulesOutput {
  /// The <code>PricingPlanArn</code> that the <code>PricingRuleArns</code> are
  /// associated with.
  final String? arn;

  AssociatePricingRulesOutput({
    this.arn,
  });

  factory AssociatePricingRulesOutput.fromJson(Map<String, dynamic> json) {
    return AssociatePricingRulesOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// A representation of a resource association error.
class AssociateResourceError {
  /// The reason why the resource association failed.
  final String? message;

  /// A static error code that's used to classify the type of failure.
  final AssociateResourceErrorReason? reason;

  AssociateResourceError({
    this.message,
    this.reason,
  });

  factory AssociateResourceError.fromJson(Map<String, dynamic> json) {
    return AssociateResourceError(
      message: json['Message'] as String?,
      reason: (json['Reason'] as String?)?.toAssociateResourceErrorReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final reason = this.reason;
    return {
      if (message != null) 'Message': message,
      if (reason != null) 'Reason': reason.toValue(),
    };
  }
}

enum AssociateResourceErrorReason {
  invalidArn,
  serviceLimitExceeded,
  illegalCustomlineitem,
  internalServerException,
  invalidBillingPeriodRange,
}

extension AssociateResourceErrorReasonValueExtension
    on AssociateResourceErrorReason {
  String toValue() {
    switch (this) {
      case AssociateResourceErrorReason.invalidArn:
        return 'INVALID_ARN';
      case AssociateResourceErrorReason.serviceLimitExceeded:
        return 'SERVICE_LIMIT_EXCEEDED';
      case AssociateResourceErrorReason.illegalCustomlineitem:
        return 'ILLEGAL_CUSTOMLINEITEM';
      case AssociateResourceErrorReason.internalServerException:
        return 'INTERNAL_SERVER_EXCEPTION';
      case AssociateResourceErrorReason.invalidBillingPeriodRange:
        return 'INVALID_BILLING_PERIOD_RANGE';
    }
  }
}

extension AssociateResourceErrorReasonFromString on String {
  AssociateResourceErrorReason toAssociateResourceErrorReason() {
    switch (this) {
      case 'INVALID_ARN':
        return AssociateResourceErrorReason.invalidArn;
      case 'SERVICE_LIMIT_EXCEEDED':
        return AssociateResourceErrorReason.serviceLimitExceeded;
      case 'ILLEGAL_CUSTOMLINEITEM':
        return AssociateResourceErrorReason.illegalCustomlineitem;
      case 'INTERNAL_SERVER_EXCEPTION':
        return AssociateResourceErrorReason.internalServerException;
      case 'INVALID_BILLING_PERIOD_RANGE':
        return AssociateResourceErrorReason.invalidBillingPeriodRange;
    }
    throw Exception('$this is not known in enum AssociateResourceErrorReason');
  }
}

/// A resource association result for a percentage custom line item.
class AssociateResourceResponseElement {
  /// The resource ARN that was associated to the custom line item.
  final String? arn;

  /// An <code>AssociateResourceError</code> that will populate if the resource
  /// association fails.
  final AssociateResourceError? error;

  AssociateResourceResponseElement({
    this.arn,
    this.error,
  });

  factory AssociateResourceResponseElement.fromJson(Map<String, dynamic> json) {
    return AssociateResourceResponseElement(
      arn: json['Arn'] as String?,
      error: json['Error'] != null
          ? AssociateResourceError.fromJson(
              json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final error = this.error;
    return {
      if (arn != null) 'Arn': arn,
      if (error != null) 'Error': error,
    };
  }
}

/// The key-value pair that represents the attribute by which the
/// <code>BillingGroupCostReportResults</code> are grouped. For example, if you
/// want a service-level breakdown for Amazon Simple Storage Service (Amazon S3)
/// of the billing group, the attribute will be a key-value pair of
/// <code>"PRODUCT_NAME"</code> and <code>"S3"</code>.
class Attribute {
  /// The key in a key-value pair that describes the margin summary.
  final String? key;

  /// The value in a key-value pair that describes the margin summary.
  final String? value;

  Attribute({
    this.key,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
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

class BatchAssociateResourcesToCustomLineItemOutput {
  /// A list of <code>AssociateResourceResponseElement</code> for each resource
  /// that failed association to a percentage custom line item.
  final List<AssociateResourceResponseElement>? failedAssociatedResources;

  /// A list of <code>AssociateResourceResponseElement</code> for each resource
  /// that's been associated to a percentage custom line item successfully.
  final List<AssociateResourceResponseElement>? successfullyAssociatedResources;

  BatchAssociateResourcesToCustomLineItemOutput({
    this.failedAssociatedResources,
    this.successfullyAssociatedResources,
  });

  factory BatchAssociateResourcesToCustomLineItemOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateResourcesToCustomLineItemOutput(
      failedAssociatedResources: (json['FailedAssociatedResources'] as List?)
          ?.whereNotNull()
          .map((e) => AssociateResourceResponseElement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successfullyAssociatedResources:
          (json['SuccessfullyAssociatedResources'] as List?)
              ?.whereNotNull()
              .map((e) => AssociateResourceResponseElement.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedAssociatedResources = this.failedAssociatedResources;
    final successfullyAssociatedResources =
        this.successfullyAssociatedResources;
    return {
      if (failedAssociatedResources != null)
        'FailedAssociatedResources': failedAssociatedResources,
      if (successfullyAssociatedResources != null)
        'SuccessfullyAssociatedResources': successfullyAssociatedResources,
    };
  }
}

class BatchDisassociateResourcesFromCustomLineItemOutput {
  /// A list of <code>DisassociateResourceResponseElement</code> for each resource
  /// that failed disassociation from a percentage custom line item.
  final List<DisassociateResourceResponseElement>? failedDisassociatedResources;

  /// A list of <code>DisassociateResourceResponseElement</code> for each resource
  /// that's been disassociated from a percentage custom line item successfully.
  final List<DisassociateResourceResponseElement>?
      successfullyDisassociatedResources;

  BatchDisassociateResourcesFromCustomLineItemOutput({
    this.failedDisassociatedResources,
    this.successfullyDisassociatedResources,
  });

  factory BatchDisassociateResourcesFromCustomLineItemOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateResourcesFromCustomLineItemOutput(
      failedDisassociatedResources:
          (json['FailedDisassociatedResources'] as List?)
              ?.whereNotNull()
              .map((e) => DisassociateResourceResponseElement.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      successfullyDisassociatedResources:
          (json['SuccessfullyDisassociatedResources'] as List?)
              ?.whereNotNull()
              .map((e) => DisassociateResourceResponseElement.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedDisassociatedResources = this.failedDisassociatedResources;
    final successfullyDisassociatedResources =
        this.successfullyDisassociatedResources;
    return {
      if (failedDisassociatedResources != null)
        'FailedDisassociatedResources': failedDisassociatedResources,
      if (successfullyDisassociatedResources != null)
        'SuccessfullyDisassociatedResources':
            successfullyDisassociatedResources,
    };
  }
}

/// A summary report of actual Amazon Web Services charges and calculated Amazon
/// Web Services charges, based on the associated pricing plan of a billing
/// group.
class BillingGroupCostReportElement {
  /// The actual Amazon Web Services charges for the billing group.
  final String? awsCost;

  /// The Amazon Resource Name (ARN) of a billing group.
  final String? arn;

  /// The displayed currency.
  final String? currency;

  /// The billing group margin.
  final String? margin;

  /// The percentage of billing group margin.
  final String? marginPercentage;

  /// The hypothetical Amazon Web Services charges based on the associated pricing
  /// plan of a billing group.
  final String? proformaCost;

  BillingGroupCostReportElement({
    this.awsCost,
    this.arn,
    this.currency,
    this.margin,
    this.marginPercentage,
    this.proformaCost,
  });

  factory BillingGroupCostReportElement.fromJson(Map<String, dynamic> json) {
    return BillingGroupCostReportElement(
      awsCost: json['AWSCost'] as String?,
      arn: json['Arn'] as String?,
      currency: json['Currency'] as String?,
      margin: json['Margin'] as String?,
      marginPercentage: json['MarginPercentage'] as String?,
      proformaCost: json['ProformaCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsCost = this.awsCost;
    final arn = this.arn;
    final currency = this.currency;
    final margin = this.margin;
    final marginPercentage = this.marginPercentage;
    final proformaCost = this.proformaCost;
    return {
      if (awsCost != null) 'AWSCost': awsCost,
      if (arn != null) 'Arn': arn,
      if (currency != null) 'Currency': currency,
      if (margin != null) 'Margin': margin,
      if (marginPercentage != null) 'MarginPercentage': marginPercentage,
      if (proformaCost != null) 'ProformaCost': proformaCost,
    };
  }
}

/// A paginated call to retrieve a list of summary reports of actual Amazon Web
/// Services charges and the calculated Amazon Web Services charges, broken down
/// by attributes.
class BillingGroupCostReportResultElement {
  /// The actual Amazon Web Services charges for the billing group.
  final String? awsCost;

  /// The Amazon Resource Number (ARN) that uniquely identifies the billing group.
  final String? arn;

  /// The list of key-value pairs that represent the attributes by which the
  /// <code>BillingGroupCostReportResults</code> are grouped. For example, if you
  /// want the Amazon S3 service-level breakdown of a billing group for November
  /// 2023, the attributes list will contain a key-value pair of
  /// <code>"PRODUCT_NAME"</code> and <code>"S3"</code> and a key-value pair of
  /// <code>"BILLING_PERIOD"</code> and <code>"Nov 2023"</code>.
  final List<Attribute>? attributes;

  /// The displayed currency.
  final String? currency;

  /// The billing group margin.
  final String? margin;

  /// The percentage of the billing group margin.
  final String? marginPercentage;

  /// The hypothetical Amazon Web Services charges based on the associated pricing
  /// plan of a billing group.
  final String? proformaCost;

  BillingGroupCostReportResultElement({
    this.awsCost,
    this.arn,
    this.attributes,
    this.currency,
    this.margin,
    this.marginPercentage,
    this.proformaCost,
  });

  factory BillingGroupCostReportResultElement.fromJson(
      Map<String, dynamic> json) {
    return BillingGroupCostReportResultElement(
      awsCost: json['AWSCost'] as String?,
      arn: json['Arn'] as String?,
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      currency: json['Currency'] as String?,
      margin: json['Margin'] as String?,
      marginPercentage: json['MarginPercentage'] as String?,
      proformaCost: json['ProformaCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsCost = this.awsCost;
    final arn = this.arn;
    final attributes = this.attributes;
    final currency = this.currency;
    final margin = this.margin;
    final marginPercentage = this.marginPercentage;
    final proformaCost = this.proformaCost;
    return {
      if (awsCost != null) 'AWSCost': awsCost,
      if (arn != null) 'Arn': arn,
      if (attributes != null) 'Attributes': attributes,
      if (currency != null) 'Currency': currency,
      if (margin != null) 'Margin': margin,
      if (marginPercentage != null) 'MarginPercentage': marginPercentage,
      if (proformaCost != null) 'ProformaCost': proformaCost,
    };
  }
}

/// A representation of a billing group.
class BillingGroupListElement {
  /// Specifies if the billing group has automatic account association
  /// (<code>AutoAssociate</code>) enabled.
  final ListBillingGroupAccountGrouping? accountGrouping;

  /// The Amazon Resource Number (ARN) that can be used to uniquely identify the
  /// billing group.
  final String? arn;
  final ComputationPreference? computationPreference;

  /// The time when the billing group was created.
  final int? creationTime;

  /// The description of the billing group.
  final String? description;

  /// The most recent time when the billing group was modified.
  final int? lastModifiedTime;

  /// The name of the billing group.
  final String? name;

  /// The account ID that serves as the main account in a billing group.
  final String? primaryAccountId;

  /// The number of accounts in the particular billing group.
  final int? size;

  /// The billing group status. Only one of the valid values can be used.
  final BillingGroupStatus? status;

  /// The reason why the billing group is in its current status.
  final String? statusReason;

  BillingGroupListElement({
    this.accountGrouping,
    this.arn,
    this.computationPreference,
    this.creationTime,
    this.description,
    this.lastModifiedTime,
    this.name,
    this.primaryAccountId,
    this.size,
    this.status,
    this.statusReason,
  });

  factory BillingGroupListElement.fromJson(Map<String, dynamic> json) {
    return BillingGroupListElement(
      accountGrouping: json['AccountGrouping'] != null
          ? ListBillingGroupAccountGrouping.fromJson(
              json['AccountGrouping'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      computationPreference: json['ComputationPreference'] != null
          ? ComputationPreference.fromJson(
              json['ComputationPreference'] as Map<String, dynamic>)
          : null,
      creationTime: json['CreationTime'] as int?,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
      primaryAccountId: json['PrimaryAccountId'] as String?,
      size: json['Size'] as int?,
      status: (json['Status'] as String?)?.toBillingGroupStatus(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountGrouping = this.accountGrouping;
    final arn = this.arn;
    final computationPreference = this.computationPreference;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final primaryAccountId = this.primaryAccountId;
    final size = this.size;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (accountGrouping != null) 'AccountGrouping': accountGrouping,
      if (arn != null) 'Arn': arn,
      if (computationPreference != null)
        'ComputationPreference': computationPreference,
      if (creationTime != null) 'CreationTime': creationTime,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
      if (primaryAccountId != null) 'PrimaryAccountId': primaryAccountId,
      if (size != null) 'Size': size,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum BillingGroupStatus {
  active,
  primaryAccountMissing,
}

extension BillingGroupStatusValueExtension on BillingGroupStatus {
  String toValue() {
    switch (this) {
      case BillingGroupStatus.active:
        return 'ACTIVE';
      case BillingGroupStatus.primaryAccountMissing:
        return 'PRIMARY_ACCOUNT_MISSING';
    }
  }
}

extension BillingGroupStatusFromString on String {
  BillingGroupStatus toBillingGroupStatus() {
    switch (this) {
      case 'ACTIVE':
        return BillingGroupStatus.active;
      case 'PRIMARY_ACCOUNT_MISSING':
        return BillingGroupStatus.primaryAccountMissing;
    }
    throw Exception('$this is not known in enum BillingGroupStatus');
  }
}

/// A time range for which the margin summary is effective. The time range can
/// be up to 12 months.
class BillingPeriodRange {
  /// The exclusive end billing period that defines a billing period range for the
  /// margin summary. For example, if you choose a billing period that starts in
  /// October 2023 and ends in December 2023, the margin summary will only include
  /// data from October 2023 and November 2023.
  final String exclusiveEndBillingPeriod;

  /// The inclusive start billing period that defines a billing period range for
  /// the margin summary.
  final String inclusiveStartBillingPeriod;

  BillingPeriodRange({
    required this.exclusiveEndBillingPeriod,
    required this.inclusiveStartBillingPeriod,
  });

  Map<String, dynamic> toJson() {
    final exclusiveEndBillingPeriod = this.exclusiveEndBillingPeriod;
    final inclusiveStartBillingPeriod = this.inclusiveStartBillingPeriod;
    return {
      'ExclusiveEndBillingPeriod': exclusiveEndBillingPeriod,
      'InclusiveStartBillingPeriod': inclusiveStartBillingPeriod,
    };
  }
}

/// The preferences and settings that will be used to compute the Amazon Web
/// Services charges for a billing group.
class ComputationPreference {
  /// The Amazon Resource Name (ARN) of the pricing plan that's used to compute
  /// the Amazon Web Services charges for a billing group.
  final String pricingPlanArn;

  ComputationPreference({
    required this.pricingPlanArn,
  });

  factory ComputationPreference.fromJson(Map<String, dynamic> json) {
    return ComputationPreference(
      pricingPlanArn: json['PricingPlanArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final pricingPlanArn = this.pricingPlanArn;
    return {
      'PricingPlanArn': pricingPlanArn,
    };
  }
}

class CreateBillingGroupOutput {
  /// The Amazon Resource Name (ARN) of the created billing group.
  final String? arn;

  CreateBillingGroupOutput({
    this.arn,
  });

  factory CreateBillingGroupOutput.fromJson(Map<String, dynamic> json) {
    return CreateBillingGroupOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class CreateCustomLineItemOutput {
  /// The Amazon Resource Name (ARN) of the created custom line item.
  final String? arn;

  CreateCustomLineItemOutput({
    this.arn,
  });

  factory CreateCustomLineItemOutput.fromJson(Map<String, dynamic> json) {
    return CreateCustomLineItemOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// The possible Amazon Web Services Free Tier configurations.
class CreateFreeTierConfig {
  /// Activate or deactivate Amazon Web Services Free Tier.
  final bool activated;

  CreateFreeTierConfig({
    required this.activated,
  });

  Map<String, dynamic> toJson() {
    final activated = this.activated;
    return {
      'Activated': activated,
    };
  }
}

class CreatePricingPlanOutput {
  /// The Amazon Resource Name (ARN) of the created pricing plan.
  final String? arn;

  CreatePricingPlanOutput({
    this.arn,
  });

  factory CreatePricingPlanOutput.fromJson(Map<String, dynamic> json) {
    return CreatePricingPlanOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class CreatePricingRuleOutput {
  /// The Amazon Resource Name (ARN) of the created pricing rule.
  final String? arn;

  CreatePricingRuleOutput({
    this.arn,
  });

  factory CreatePricingRuleOutput.fromJson(Map<String, dynamic> json) {
    return CreatePricingRuleOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// The set of tiering configurations for the pricing rule.
class CreateTieringInput {
  /// The possible Amazon Web Services Free Tier configurations.
  final CreateFreeTierConfig freeTier;

  CreateTieringInput({
    required this.freeTier,
  });

  Map<String, dynamic> toJson() {
    final freeTier = this.freeTier;
    return {
      'FreeTier': freeTier,
    };
  }
}

enum CurrencyCode {
  usd,
  cny,
}

extension CurrencyCodeValueExtension on CurrencyCode {
  String toValue() {
    switch (this) {
      case CurrencyCode.usd:
        return 'USD';
      case CurrencyCode.cny:
        return 'CNY';
    }
  }
}

extension CurrencyCodeFromString on String {
  CurrencyCode toCurrencyCode() {
    switch (this) {
      case 'USD':
        return CurrencyCode.usd;
      case 'CNY':
        return CurrencyCode.cny;
    }
    throw Exception('$this is not known in enum CurrencyCode');
  }
}

/// The billing period range in which the custom line item request will be
/// applied.
class CustomLineItemBillingPeriodRange {
  /// The inclusive start billing period that defines a billing period range where
  /// a custom line is applied.
  final String inclusiveStartBillingPeriod;

  /// The inclusive end billing period that defines a billing period range where a
  /// custom line is applied.
  final String? exclusiveEndBillingPeriod;

  CustomLineItemBillingPeriodRange({
    required this.inclusiveStartBillingPeriod,
    this.exclusiveEndBillingPeriod,
  });

  Map<String, dynamic> toJson() {
    final inclusiveStartBillingPeriod = this.inclusiveStartBillingPeriod;
    final exclusiveEndBillingPeriod = this.exclusiveEndBillingPeriod;
    return {
      'InclusiveStartBillingPeriod': inclusiveStartBillingPeriod,
      if (exclusiveEndBillingPeriod != null)
        'ExclusiveEndBillingPeriod': exclusiveEndBillingPeriod,
    };
  }
}

/// The charge details of a custom line item. It should contain only one of
/// <code>Flat</code> or <code>Percentage</code>.
class CustomLineItemChargeDetails {
  /// The type of the custom line item that indicates whether the charge is a fee
  /// or credit.
  final CustomLineItemType type;

  /// A <code>CustomLineItemFlatChargeDetails</code> that describes the charge
  /// details of a flat custom line item.
  final CustomLineItemFlatChargeDetails? flat;

  /// A representation of the line item filter.
  final List<LineItemFilter>? lineItemFilters;

  /// A <code>CustomLineItemPercentageChargeDetails</code> that describes the
  /// charge details of a percentage custom line item.
  final CustomLineItemPercentageChargeDetails? percentage;

  CustomLineItemChargeDetails({
    required this.type,
    this.flat,
    this.lineItemFilters,
    this.percentage,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final flat = this.flat;
    final lineItemFilters = this.lineItemFilters;
    final percentage = this.percentage;
    return {
      'Type': type.toValue(),
      if (flat != null) 'Flat': flat,
      if (lineItemFilters != null) 'LineItemFilters': lineItemFilters,
      if (percentage != null) 'Percentage': percentage,
    };
  }
}

/// A representation of the charge details that are associated with a flat
/// custom line item.
class CustomLineItemFlatChargeDetails {
  /// The custom line item's fixed charge value in USD.
  final double chargeValue;

  CustomLineItemFlatChargeDetails({
    required this.chargeValue,
  });

  Map<String, dynamic> toJson() {
    final chargeValue = this.chargeValue;
    return {
      'ChargeValue': chargeValue,
    };
  }
}

/// A representation of a custom line item.
class CustomLineItemListElement {
  /// The Amazon Web Services account in which this custom line item will be
  /// applied to.
  final String? accountId;

  /// The Amazon Resource Names (ARNs) for custom line items.
  final String? arn;

  /// The number of resources that are associated to the custom line item.
  final int? associationSize;

  /// The Amazon Resource Name (ARN) that references the billing group where the
  /// custom line item applies to.
  final String? billingGroupArn;

  /// A <code>ListCustomLineItemChargeDetails</code> that describes the charge
  /// details of a custom line item.
  final ListCustomLineItemChargeDetails? chargeDetails;

  /// The time created.
  final int? creationTime;

  /// The custom line item's charge value currency. Only one of the valid values
  /// can be used.
  final CurrencyCode? currencyCode;

  /// The custom line item's description. This is shown on the Bills page in
  /// association with the charge value.
  final String? description;

  /// The most recent time when the custom line item was modified.
  final int? lastModifiedTime;

  /// The custom line item's name.
  final String? name;

  /// The product code that's associated with the custom line item.
  final String? productCode;

  CustomLineItemListElement({
    this.accountId,
    this.arn,
    this.associationSize,
    this.billingGroupArn,
    this.chargeDetails,
    this.creationTime,
    this.currencyCode,
    this.description,
    this.lastModifiedTime,
    this.name,
    this.productCode,
  });

  factory CustomLineItemListElement.fromJson(Map<String, dynamic> json) {
    return CustomLineItemListElement(
      accountId: json['AccountId'] as String?,
      arn: json['Arn'] as String?,
      associationSize: json['AssociationSize'] as int?,
      billingGroupArn: json['BillingGroupArn'] as String?,
      chargeDetails: json['ChargeDetails'] != null
          ? ListCustomLineItemChargeDetails.fromJson(
              json['ChargeDetails'] as Map<String, dynamic>)
          : null,
      creationTime: json['CreationTime'] as int?,
      currencyCode: (json['CurrencyCode'] as String?)?.toCurrencyCode(),
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
      productCode: json['ProductCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final associationSize = this.associationSize;
    final billingGroupArn = this.billingGroupArn;
    final chargeDetails = this.chargeDetails;
    final creationTime = this.creationTime;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final productCode = this.productCode;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (arn != null) 'Arn': arn,
      if (associationSize != null) 'AssociationSize': associationSize,
      if (billingGroupArn != null) 'BillingGroupArn': billingGroupArn,
      if (chargeDetails != null) 'ChargeDetails': chargeDetails,
      if (creationTime != null) 'CreationTime': creationTime,
      if (currencyCode != null) 'CurrencyCode': currencyCode.toValue(),
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
      if (productCode != null) 'ProductCode': productCode,
    };
  }
}

/// A representation of the charge details that are associated with a percentage
/// custom line item.
class CustomLineItemPercentageChargeDetails {
  /// The custom line item's percentage value. This will be multiplied against the
  /// combined value of its associated resources to determine its charge value.
  final double percentageValue;

  /// A list of resource ARNs to associate to the percentage custom line item.
  final List<String>? associatedValues;

  CustomLineItemPercentageChargeDetails({
    required this.percentageValue,
    this.associatedValues,
  });

  Map<String, dynamic> toJson() {
    final percentageValue = this.percentageValue;
    final associatedValues = this.associatedValues;
    return {
      'PercentageValue': percentageValue,
      if (associatedValues != null) 'AssociatedValues': associatedValues,
    };
  }
}

enum CustomLineItemRelationship {
  parent,
  child,
}

extension CustomLineItemRelationshipValueExtension
    on CustomLineItemRelationship {
  String toValue() {
    switch (this) {
      case CustomLineItemRelationship.parent:
        return 'PARENT';
      case CustomLineItemRelationship.child:
        return 'CHILD';
    }
  }
}

extension CustomLineItemRelationshipFromString on String {
  CustomLineItemRelationship toCustomLineItemRelationship() {
    switch (this) {
      case 'PARENT':
        return CustomLineItemRelationship.parent;
      case 'CHILD':
        return CustomLineItemRelationship.child;
    }
    throw Exception('$this is not known in enum CustomLineItemRelationship');
  }
}

enum CustomLineItemType {
  credit,
  fee,
}

extension CustomLineItemTypeValueExtension on CustomLineItemType {
  String toValue() {
    switch (this) {
      case CustomLineItemType.credit:
        return 'CREDIT';
      case CustomLineItemType.fee:
        return 'FEE';
    }
  }
}

extension CustomLineItemTypeFromString on String {
  CustomLineItemType toCustomLineItemType() {
    switch (this) {
      case 'CREDIT':
        return CustomLineItemType.credit;
      case 'FEE':
        return CustomLineItemType.fee;
    }
    throw Exception('$this is not known in enum CustomLineItemType');
  }
}

/// A representation of a custom line item version.
class CustomLineItemVersionListElement {
  /// The Amazon Web Services account in which this custom line item will be
  /// applied to.
  final String? accountId;

  /// A list of custom line item Amazon Resource Names (ARNs) to retrieve
  /// information.
  final String? arn;

  /// The number of resources that are associated with the custom line item.
  final int? associationSize;

  /// The Amazon Resource Name (ARN) of the billing group that the custom line
  /// item applies to.
  final String? billingGroupArn;
  final ListCustomLineItemChargeDetails? chargeDetails;

  /// The time when the custom line item version was created.
  final int? creationTime;

  /// The charge value currency of the custom line item.
  final CurrencyCode? currencyCode;

  /// The description of the custom line item.
  final String? description;

  /// The end billing period of the custom line item version.
  final String? endBillingPeriod;

  /// The most recent time that the custom line item version was modified.
  final int? lastModifiedTime;

  /// The name of the custom line item.
  final String? name;

  /// The product code that’s associated with the custom line item.
  final String? productCode;

  /// The start billing period of the custom line item version.
  final String? startBillingPeriod;

  /// The inclusive start time.
  final int? startTime;

  CustomLineItemVersionListElement({
    this.accountId,
    this.arn,
    this.associationSize,
    this.billingGroupArn,
    this.chargeDetails,
    this.creationTime,
    this.currencyCode,
    this.description,
    this.endBillingPeriod,
    this.lastModifiedTime,
    this.name,
    this.productCode,
    this.startBillingPeriod,
    this.startTime,
  });

  factory CustomLineItemVersionListElement.fromJson(Map<String, dynamic> json) {
    return CustomLineItemVersionListElement(
      accountId: json['AccountId'] as String?,
      arn: json['Arn'] as String?,
      associationSize: json['AssociationSize'] as int?,
      billingGroupArn: json['BillingGroupArn'] as String?,
      chargeDetails: json['ChargeDetails'] != null
          ? ListCustomLineItemChargeDetails.fromJson(
              json['ChargeDetails'] as Map<String, dynamic>)
          : null,
      creationTime: json['CreationTime'] as int?,
      currencyCode: (json['CurrencyCode'] as String?)?.toCurrencyCode(),
      description: json['Description'] as String?,
      endBillingPeriod: json['EndBillingPeriod'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
      productCode: json['ProductCode'] as String?,
      startBillingPeriod: json['StartBillingPeriod'] as String?,
      startTime: json['StartTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final associationSize = this.associationSize;
    final billingGroupArn = this.billingGroupArn;
    final chargeDetails = this.chargeDetails;
    final creationTime = this.creationTime;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final endBillingPeriod = this.endBillingPeriod;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final productCode = this.productCode;
    final startBillingPeriod = this.startBillingPeriod;
    final startTime = this.startTime;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (arn != null) 'Arn': arn,
      if (associationSize != null) 'AssociationSize': associationSize,
      if (billingGroupArn != null) 'BillingGroupArn': billingGroupArn,
      if (chargeDetails != null) 'ChargeDetails': chargeDetails,
      if (creationTime != null) 'CreationTime': creationTime,
      if (currencyCode != null) 'CurrencyCode': currencyCode.toValue(),
      if (description != null) 'Description': description,
      if (endBillingPeriod != null) 'EndBillingPeriod': endBillingPeriod,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
      if (productCode != null) 'ProductCode': productCode,
      if (startBillingPeriod != null) 'StartBillingPeriod': startBillingPeriod,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

class DeleteBillingGroupOutput {
  /// The Amazon Resource Name (ARN) of the deleted billing group.
  final String? arn;

  DeleteBillingGroupOutput({
    this.arn,
  });

  factory DeleteBillingGroupOutput.fromJson(Map<String, dynamic> json) {
    return DeleteBillingGroupOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DeleteCustomLineItemOutput {
  /// The ARN of the deleted custom line item.
  final String? arn;

  DeleteCustomLineItemOutput({
    this.arn,
  });

  factory DeleteCustomLineItemOutput.fromJson(Map<String, dynamic> json) {
    return DeleteCustomLineItemOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DeletePricingPlanOutput {
  /// The Amazon Resource Name (ARN) of the deleted pricing plan.
  final String? arn;

  DeletePricingPlanOutput({
    this.arn,
  });

  factory DeletePricingPlanOutput.fromJson(Map<String, dynamic> json) {
    return DeletePricingPlanOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DeletePricingRuleOutput {
  /// The Amazon Resource Name (ARN) of the deleted pricing rule.
  final String? arn;

  DeletePricingRuleOutput({
    this.arn,
  });

  factory DeletePricingRuleOutput.fromJson(Map<String, dynamic> json) {
    return DeletePricingRuleOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DisassociateAccountsOutput {
  /// The Amazon Resource Name (ARN) of the billing group that the array of
  /// account IDs is disassociated from.
  final String? arn;

  DisassociateAccountsOutput({
    this.arn,
  });

  factory DisassociateAccountsOutput.fromJson(Map<String, dynamic> json) {
    return DisassociateAccountsOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DisassociatePricingRulesOutput {
  /// The Amazon Resource Name (ARN) of the pricing plan that the pricing rules
  /// successfully disassociated from.
  final String? arn;

  DisassociatePricingRulesOutput({
    this.arn,
  });

  factory DisassociatePricingRulesOutput.fromJson(Map<String, dynamic> json) {
    return DisassociatePricingRulesOutput(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// A resource disassociation result for a percentage custom line item.
class DisassociateResourceResponseElement {
  /// The resource ARN that was disassociated from the custom line item.
  final String? arn;

  /// An <code>AssociateResourceError</code> that's shown if the resource
  /// disassociation fails.
  final AssociateResourceError? error;

  DisassociateResourceResponseElement({
    this.arn,
    this.error,
  });

  factory DisassociateResourceResponseElement.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResourceResponseElement(
      arn: json['Arn'] as String?,
      error: json['Error'] != null
          ? AssociateResourceError.fromJson(
              json['Error'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final error = this.error;
    return {
      if (arn != null) 'Arn': arn,
      if (error != null) 'Error': error,
    };
  }
}

/// The possible Amazon Web Services Free Tier configurations.
class FreeTierConfig {
  /// Activate or deactivate Amazon Web Services Free Tier application.
  final bool activated;

  FreeTierConfig({
    required this.activated,
  });

  factory FreeTierConfig.fromJson(Map<String, dynamic> json) {
    return FreeTierConfig(
      activated: json['Activated'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final activated = this.activated;
    return {
      'Activated': activated,
    };
  }
}

class GetBillingGroupCostReportOutput {
  /// The list of margin summary reports.
  final List<BillingGroupCostReportResultElement>?
      billingGroupCostReportResults;

  /// The pagination token used on subsequent calls to get reports.
  final String? nextToken;

  GetBillingGroupCostReportOutput({
    this.billingGroupCostReportResults,
    this.nextToken,
  });

  factory GetBillingGroupCostReportOutput.fromJson(Map<String, dynamic> json) {
    return GetBillingGroupCostReportOutput(
      billingGroupCostReportResults:
          (json['BillingGroupCostReportResults'] as List?)
              ?.whereNotNull()
              .map((e) => BillingGroupCostReportResultElement.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingGroupCostReportResults = this.billingGroupCostReportResults;
    final nextToken = this.nextToken;
    return {
      if (billingGroupCostReportResults != null)
        'BillingGroupCostReportResults': billingGroupCostReportResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum GroupByAttributeName {
  productName,
  billingPeriod,
}

extension GroupByAttributeNameValueExtension on GroupByAttributeName {
  String toValue() {
    switch (this) {
      case GroupByAttributeName.productName:
        return 'PRODUCT_NAME';
      case GroupByAttributeName.billingPeriod:
        return 'BILLING_PERIOD';
    }
  }
}

extension GroupByAttributeNameFromString on String {
  GroupByAttributeName toGroupByAttributeName() {
    switch (this) {
      case 'PRODUCT_NAME':
        return GroupByAttributeName.productName;
      case 'BILLING_PERIOD':
        return GroupByAttributeName.billingPeriod;
    }
    throw Exception('$this is not known in enum GroupByAttributeName');
  }
}

/// A representation of the line item filter for your custom line item. You can
/// use line item filters to include or exclude specific resource values from
/// the billing group's total cost. For example, if you create a custom line
/// item and you want to filter out a value, such as Savings Plan discounts, you
/// can update <code>LineItemFilter</code> to exclude it.
class LineItemFilter {
  /// The attribute of the line item filter. This specifies what attribute that
  /// you can filter on.
  final LineItemFilterAttributeName attribute;

  /// The match criteria of the line item filter. This parameter specifies whether
  /// not to include the resource value from the billing group total cost.
  final MatchOption matchOption;

  /// The values of the line item filter. This specifies the values to filter on.
  /// Currently, you can only exclude Savings Plan discounts.
  final List<LineItemFilterValue> values;

  LineItemFilter({
    required this.attribute,
    required this.matchOption,
    required this.values,
  });

  factory LineItemFilter.fromJson(Map<String, dynamic> json) {
    return LineItemFilter(
      attribute: (json['Attribute'] as String).toLineItemFilterAttributeName(),
      matchOption: (json['MatchOption'] as String).toMatchOption(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => (e as String).toLineItemFilterValue())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final matchOption = this.matchOption;
    final values = this.values;
    return {
      'Attribute': attribute.toValue(),
      'MatchOption': matchOption.toValue(),
      'Values': values.map((e) => e.toValue()).toList(),
    };
  }
}

enum LineItemFilterAttributeName {
  lineItemType,
}

extension LineItemFilterAttributeNameValueExtension
    on LineItemFilterAttributeName {
  String toValue() {
    switch (this) {
      case LineItemFilterAttributeName.lineItemType:
        return 'LINE_ITEM_TYPE';
    }
  }
}

extension LineItemFilterAttributeNameFromString on String {
  LineItemFilterAttributeName toLineItemFilterAttributeName() {
    switch (this) {
      case 'LINE_ITEM_TYPE':
        return LineItemFilterAttributeName.lineItemType;
    }
    throw Exception('$this is not known in enum LineItemFilterAttributeName');
  }
}

enum LineItemFilterValue {
  savingsPlanNegation,
}

extension LineItemFilterValueValueExtension on LineItemFilterValue {
  String toValue() {
    switch (this) {
      case LineItemFilterValue.savingsPlanNegation:
        return 'SAVINGS_PLAN_NEGATION';
    }
  }
}

extension LineItemFilterValueFromString on String {
  LineItemFilterValue toLineItemFilterValue() {
    switch (this) {
      case 'SAVINGS_PLAN_NEGATION':
        return LineItemFilterValue.savingsPlanNegation;
    }
    throw Exception('$this is not known in enum LineItemFilterValue');
  }
}

/// The filter on the account ID of the linked account, or any of the following:
///
/// <code>MONITORED</code>: linked accounts that are associated to billing
/// groups.
///
/// <code>UNMONITORED</code>: linked accounts that are not associated to billing
/// groups.
///
/// <code>Billing Group Arn</code>: linked accounts that are associated to the
/// provided Billing Group Arn.
class ListAccountAssociationsFilter {
  /// The Amazon Web Services account ID to filter on.
  final String? accountId;

  /// The list of Amazon Web Services IDs to retrieve their associated billing
  /// group for a given time range.
  final List<String>? accountIds;

  /// <code>MONITORED</code>: linked accounts that are associated to billing
  /// groups.
  ///
  /// <code>UNMONITORED</code>: linked accounts that are not associated to billing
  /// groups.
  ///
  /// <code>Billing Group Arn</code>: linked accounts that are associated to the
  /// provided Billing Group Arn.
  final String? association;

  ListAccountAssociationsFilter({
    this.accountId,
    this.accountIds,
    this.association,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountIds = this.accountIds;
    final association = this.association;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (accountIds != null) 'AccountIds': accountIds,
      if (association != null) 'Association': association,
    };
  }
}

class ListAccountAssociationsOutput {
  /// The list of linked accounts in the payer account.
  final List<AccountAssociationsListElement>? linkedAccounts;

  /// The pagination token that's used on subsequent calls to get accounts.
  final String? nextToken;

  ListAccountAssociationsOutput({
    this.linkedAccounts,
    this.nextToken,
  });

  factory ListAccountAssociationsOutput.fromJson(Map<String, dynamic> json) {
    return ListAccountAssociationsOutput(
      linkedAccounts: (json['LinkedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => AccountAssociationsListElement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedAccounts = this.linkedAccounts;
    final nextToken = this.nextToken;
    return {
      if (linkedAccounts != null) 'LinkedAccounts': linkedAccounts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies if the billing group has the following features enabled.
class ListBillingGroupAccountGrouping {
  /// Specifies if this billing group will automatically associate newly added
  /// Amazon Web Services accounts that join your consolidated billing family.
  final bool? autoAssociate;

  ListBillingGroupAccountGrouping({
    this.autoAssociate,
  });

  factory ListBillingGroupAccountGrouping.fromJson(Map<String, dynamic> json) {
    return ListBillingGroupAccountGrouping(
      autoAssociate: json['AutoAssociate'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoAssociate = this.autoAssociate;
    return {
      if (autoAssociate != null) 'AutoAssociate': autoAssociate,
    };
  }
}

/// The filter used to retrieve specific
/// <code>BillingGroupCostReportElements</code>.
class ListBillingGroupCostReportsFilter {
  /// The list of Amazon Resource Names (ARNs) used to filter billing groups to
  /// retrieve reports.
  final List<String>? billingGroupArns;

  ListBillingGroupCostReportsFilter({
    this.billingGroupArns,
  });

  Map<String, dynamic> toJson() {
    final billingGroupArns = this.billingGroupArns;
    return {
      if (billingGroupArns != null) 'BillingGroupArns': billingGroupArns,
    };
  }
}

class ListBillingGroupCostReportsOutput {
  /// A list of <code>BillingGroupCostReportElement</code> retrieved.
  final List<BillingGroupCostReportElement>? billingGroupCostReports;

  /// The pagination token that's used on subsequent calls to get reports.
  final String? nextToken;

  ListBillingGroupCostReportsOutput({
    this.billingGroupCostReports,
    this.nextToken,
  });

  factory ListBillingGroupCostReportsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListBillingGroupCostReportsOutput(
      billingGroupCostReports: (json['BillingGroupCostReports'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BillingGroupCostReportElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingGroupCostReports = this.billingGroupCostReports;
    final nextToken = this.nextToken;
    return {
      if (billingGroupCostReports != null)
        'BillingGroupCostReports': billingGroupCostReports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The filter that specifies the billing groups and pricing plans to retrieve
/// billing group information.
class ListBillingGroupsFilter {
  /// The list of billing group Amazon Resource Names (ARNs) to retrieve
  /// information.
  final List<String>? arns;

  /// Specifies if this billing group will automatically associate newly added
  /// Amazon Web Services accounts that join your consolidated billing family.
  final bool? autoAssociate;

  /// The pricing plan Amazon Resource Names (ARNs) to retrieve information.
  final String? pricingPlan;

  /// A list of billing groups to retrieve their current status for a specific
  /// time range
  final List<BillingGroupStatus>? statuses;

  ListBillingGroupsFilter({
    this.arns,
    this.autoAssociate,
    this.pricingPlan,
    this.statuses,
  });

  Map<String, dynamic> toJson() {
    final arns = this.arns;
    final autoAssociate = this.autoAssociate;
    final pricingPlan = this.pricingPlan;
    final statuses = this.statuses;
    return {
      if (arns != null) 'Arns': arns,
      if (autoAssociate != null) 'AutoAssociate': autoAssociate,
      if (pricingPlan != null) 'PricingPlan': pricingPlan,
      if (statuses != null)
        'Statuses': statuses.map((e) => e.toValue()).toList(),
    };
  }
}

class ListBillingGroupsOutput {
  /// A list of <code>BillingGroupListElement</code> retrieved.
  final List<BillingGroupListElement>? billingGroups;

  /// The pagination token that's used on subsequent calls to get billing groups.
  final String? nextToken;

  ListBillingGroupsOutput({
    this.billingGroups,
    this.nextToken,
  });

  factory ListBillingGroupsOutput.fromJson(Map<String, dynamic> json) {
    return ListBillingGroupsOutput(
      billingGroups: (json['BillingGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BillingGroupListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingGroups = this.billingGroups;
    final nextToken = this.nextToken;
    return {
      if (billingGroups != null) 'BillingGroups': billingGroups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A representation of the charge details of a custom line item.
class ListCustomLineItemChargeDetails {
  /// The type of the custom line item that indicates whether the charge is a
  /// <code>fee</code> or <code>credit</code>.
  final CustomLineItemType type;

  /// A <code>ListCustomLineItemFlatChargeDetails</code> that describes the charge
  /// details of a flat custom line item.
  final ListCustomLineItemFlatChargeDetails? flat;

  /// A representation of the line item filter.
  final List<LineItemFilter>? lineItemFilters;

  /// A <code>ListCustomLineItemPercentageChargeDetails</code> that describes the
  /// charge details of a percentage custom line item.
  final ListCustomLineItemPercentageChargeDetails? percentage;

  ListCustomLineItemChargeDetails({
    required this.type,
    this.flat,
    this.lineItemFilters,
    this.percentage,
  });

  factory ListCustomLineItemChargeDetails.fromJson(Map<String, dynamic> json) {
    return ListCustomLineItemChargeDetails(
      type: (json['Type'] as String).toCustomLineItemType(),
      flat: json['Flat'] != null
          ? ListCustomLineItemFlatChargeDetails.fromJson(
              json['Flat'] as Map<String, dynamic>)
          : null,
      lineItemFilters: (json['LineItemFilters'] as List?)
          ?.whereNotNull()
          .map((e) => LineItemFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      percentage: json['Percentage'] != null
          ? ListCustomLineItemPercentageChargeDetails.fromJson(
              json['Percentage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final flat = this.flat;
    final lineItemFilters = this.lineItemFilters;
    final percentage = this.percentage;
    return {
      'Type': type.toValue(),
      if (flat != null) 'Flat': flat,
      if (lineItemFilters != null) 'LineItemFilters': lineItemFilters,
      if (percentage != null) 'Percentage': percentage,
    };
  }
}

/// A representation of the charge details that are associated with a flat
/// custom line item.
class ListCustomLineItemFlatChargeDetails {
  /// The custom line item's fixed charge value in USD.
  final double chargeValue;

  ListCustomLineItemFlatChargeDetails({
    required this.chargeValue,
  });

  factory ListCustomLineItemFlatChargeDetails.fromJson(
      Map<String, dynamic> json) {
    return ListCustomLineItemFlatChargeDetails(
      chargeValue: json['ChargeValue'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final chargeValue = this.chargeValue;
    return {
      'ChargeValue': chargeValue,
    };
  }
}

/// A representation of the charge details that are associated with a percentage
/// custom line item.
class ListCustomLineItemPercentageChargeDetails {
  /// The custom line item's percentage value. This will be multiplied against the
  /// combined value of its associated resources to determine its charge value.
  final double percentageValue;

  ListCustomLineItemPercentageChargeDetails({
    required this.percentageValue,
  });

  factory ListCustomLineItemPercentageChargeDetails.fromJson(
      Map<String, dynamic> json) {
    return ListCustomLineItemPercentageChargeDetails(
      percentageValue: json['PercentageValue'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final percentageValue = this.percentageValue;
    return {
      'PercentageValue': percentageValue,
    };
  }
}

/// A billing period filter that specifies the custom line item versions to
/// retrieve.
class ListCustomLineItemVersionsBillingPeriodRangeFilter {
  /// The exclusive end billing period that defines a billing period range where a
  /// custom line item version is applied.
  final String? endBillingPeriod;

  /// The inclusive start billing period that defines a billing period range where
  /// a custom line item version is applied.
  final String? startBillingPeriod;

  ListCustomLineItemVersionsBillingPeriodRangeFilter({
    this.endBillingPeriod,
    this.startBillingPeriod,
  });

  Map<String, dynamic> toJson() {
    final endBillingPeriod = this.endBillingPeriod;
    final startBillingPeriod = this.startBillingPeriod;
    return {
      if (endBillingPeriod != null) 'EndBillingPeriod': endBillingPeriod,
      if (startBillingPeriod != null) 'StartBillingPeriod': startBillingPeriod,
    };
  }
}

/// A filter that specifies the billing period range where the custom line item
/// versions reside.
class ListCustomLineItemVersionsFilter {
  /// The billing period range in which the custom line item version is applied.
  final ListCustomLineItemVersionsBillingPeriodRangeFilter? billingPeriodRange;

  ListCustomLineItemVersionsFilter({
    this.billingPeriodRange,
  });

  Map<String, dynamic> toJson() {
    final billingPeriodRange = this.billingPeriodRange;
    return {
      if (billingPeriodRange != null) 'BillingPeriodRange': billingPeriodRange,
    };
  }
}

class ListCustomLineItemVersionsOutput {
  /// A list of <code>CustomLineItemVersionListElements</code> that are received.
  final List<CustomLineItemVersionListElement>? customLineItemVersions;

  /// The pagination token that's used on subsequent calls to retrieve custom line
  /// item versions.
  final String? nextToken;

  ListCustomLineItemVersionsOutput({
    this.customLineItemVersions,
    this.nextToken,
  });

  factory ListCustomLineItemVersionsOutput.fromJson(Map<String, dynamic> json) {
    return ListCustomLineItemVersionsOutput(
      customLineItemVersions: (json['CustomLineItemVersions'] as List?)
          ?.whereNotNull()
          .map((e) => CustomLineItemVersionListElement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customLineItemVersions = this.customLineItemVersions;
    final nextToken = this.nextToken;
    return {
      if (customLineItemVersions != null)
        'CustomLineItemVersions': customLineItemVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A filter that specifies the custom line items and billing groups to retrieve
/// FFLI information.
class ListCustomLineItemsFilter {
  /// The Amazon Web Services accounts in which this custom line item will be
  /// applied to.
  final List<String>? accountIds;

  /// A list of custom line item ARNs to retrieve information.
  final List<String>? arns;

  /// The billing group Amazon Resource Names (ARNs) to retrieve information.
  final List<String>? billingGroups;

  /// A list of custom line items to retrieve information.
  final List<String>? names;

  ListCustomLineItemsFilter({
    this.accountIds,
    this.arns,
    this.billingGroups,
    this.names,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final arns = this.arns;
    final billingGroups = this.billingGroups;
    final names = this.names;
    return {
      if (accountIds != null) 'AccountIds': accountIds,
      if (arns != null) 'Arns': arns,
      if (billingGroups != null) 'BillingGroups': billingGroups,
      if (names != null) 'Names': names,
    };
  }
}

class ListCustomLineItemsOutput {
  /// A list of <code>FreeFormLineItemListElements</code> received.
  final List<CustomLineItemListElement>? customLineItems;

  /// The pagination token that's used on subsequent calls to get custom line
  /// items (FFLIs).
  final String? nextToken;

  ListCustomLineItemsOutput({
    this.customLineItems,
    this.nextToken,
  });

  factory ListCustomLineItemsOutput.fromJson(Map<String, dynamic> json) {
    return ListCustomLineItemsOutput(
      customLineItems: (json['CustomLineItems'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CustomLineItemListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customLineItems = this.customLineItems;
    final nextToken = this.nextToken;
    return {
      if (customLineItems != null) 'CustomLineItems': customLineItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPricingPlansAssociatedWithPricingRuleOutput {
  /// The pricing plan billing period for which associations will be listed.
  final String? billingPeriod;

  /// The pagination token to be used on subsequent calls.
  final String? nextToken;

  /// The list containing pricing plans that are associated with the requested
  /// pricing rule.
  final List<String>? pricingPlanArns;

  /// The pricing rule Amazon Resource Name (ARN) for which associations will be
  /// listed.
  final String? pricingRuleArn;

  ListPricingPlansAssociatedWithPricingRuleOutput({
    this.billingPeriod,
    this.nextToken,
    this.pricingPlanArns,
    this.pricingRuleArn,
  });

  factory ListPricingPlansAssociatedWithPricingRuleOutput.fromJson(
      Map<String, dynamic> json) {
    return ListPricingPlansAssociatedWithPricingRuleOutput(
      billingPeriod: json['BillingPeriod'] as String?,
      nextToken: json['NextToken'] as String?,
      pricingPlanArns: (json['PricingPlanArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pricingRuleArn: json['PricingRuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final nextToken = this.nextToken;
    final pricingPlanArns = this.pricingPlanArns;
    final pricingRuleArn = this.pricingRuleArn;
    return {
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (pricingPlanArns != null) 'PricingPlanArns': pricingPlanArns,
      if (pricingRuleArn != null) 'PricingRuleArn': pricingRuleArn,
    };
  }
}

/// The filter that specifies the Amazon Resource Names (ARNs) of pricing plans,
/// to retrieve pricing plan information.
class ListPricingPlansFilter {
  /// A list of pricing plan Amazon Resource Names (ARNs) to retrieve information.
  final List<String>? arns;

  ListPricingPlansFilter({
    this.arns,
  });

  Map<String, dynamic> toJson() {
    final arns = this.arns;
    return {
      if (arns != null) 'Arns': arns,
    };
  }
}

class ListPricingPlansOutput {
  /// The billing period for which the described pricing plans are applicable.
  final String? billingPeriod;

  /// The pagination token that's used on subsequent calls to get pricing plans.
  final String? nextToken;

  /// A list of <code>PricingPlanListElement</code> retrieved.
  final List<PricingPlanListElement>? pricingPlans;

  ListPricingPlansOutput({
    this.billingPeriod,
    this.nextToken,
    this.pricingPlans,
  });

  factory ListPricingPlansOutput.fromJson(Map<String, dynamic> json) {
    return ListPricingPlansOutput(
      billingPeriod: json['BillingPeriod'] as String?,
      nextToken: json['NextToken'] as String?,
      pricingPlans: (json['PricingPlans'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PricingPlanListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final nextToken = this.nextToken;
    final pricingPlans = this.pricingPlans;
    return {
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (pricingPlans != null) 'PricingPlans': pricingPlans,
    };
  }
}

class ListPricingRulesAssociatedToPricingPlanOutput {
  /// The billing period for which the pricing rule associations are listed.
  final String? billingPeriod;

  /// The pagination token to be used on subsequent calls.
  final String? nextToken;

  /// The Amazon Resource Name (ARN) of the pricing plan for which associations
  /// are listed.
  final String? pricingPlanArn;

  /// A list containing pricing rules that are associated with the requested
  /// pricing plan.
  final List<String>? pricingRuleArns;

  ListPricingRulesAssociatedToPricingPlanOutput({
    this.billingPeriod,
    this.nextToken,
    this.pricingPlanArn,
    this.pricingRuleArns,
  });

  factory ListPricingRulesAssociatedToPricingPlanOutput.fromJson(
      Map<String, dynamic> json) {
    return ListPricingRulesAssociatedToPricingPlanOutput(
      billingPeriod: json['BillingPeriod'] as String?,
      nextToken: json['NextToken'] as String?,
      pricingPlanArn: json['PricingPlanArn'] as String?,
      pricingRuleArns: (json['PricingRuleArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final nextToken = this.nextToken;
    final pricingPlanArn = this.pricingPlanArn;
    final pricingRuleArns = this.pricingRuleArns;
    return {
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (pricingPlanArn != null) 'PricingPlanArn': pricingPlanArn,
      if (pricingRuleArns != null) 'PricingRuleArns': pricingRuleArns,
    };
  }
}

/// The filter that specifies criteria that the pricing rules returned by the
/// <code>ListPricingRules</code> API will adhere to.
class ListPricingRulesFilter {
  /// A list containing the pricing rule Amazon Resource Names (ARNs) to include
  /// in the API response.
  final List<String>? arns;

  ListPricingRulesFilter({
    this.arns,
  });

  Map<String, dynamic> toJson() {
    final arns = this.arns;
    return {
      if (arns != null) 'Arns': arns,
    };
  }
}

class ListPricingRulesOutput {
  /// The billing period for which the described pricing rules are applicable.
  final String? billingPeriod;

  /// The pagination token that's used on subsequent calls to get pricing rules.
  final String? nextToken;

  /// A list containing the described pricing rules.
  final List<PricingRuleListElement>? pricingRules;

  ListPricingRulesOutput({
    this.billingPeriod,
    this.nextToken,
    this.pricingRules,
  });

  factory ListPricingRulesOutput.fromJson(Map<String, dynamic> json) {
    return ListPricingRulesOutput(
      billingPeriod: json['BillingPeriod'] as String?,
      nextToken: json['NextToken'] as String?,
      pricingRules: (json['PricingRules'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PricingRuleListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final nextToken = this.nextToken;
    final pricingRules = this.pricingRules;
    return {
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (pricingRules != null) 'PricingRules': pricingRules,
    };
  }
}

/// A filter that specifies the type of resource associations that should be
/// retrieved for a custom line item.
class ListResourcesAssociatedToCustomLineItemFilter {
  /// The type of relationship between the custom line item and the associated
  /// resource.
  final CustomLineItemRelationship? relationship;

  ListResourcesAssociatedToCustomLineItemFilter({
    this.relationship,
  });

  Map<String, dynamic> toJson() {
    final relationship = this.relationship;
    return {
      if (relationship != null) 'Relationship': relationship.toValue(),
    };
  }
}

class ListResourcesAssociatedToCustomLineItemOutput {
  /// The custom line item ARN for which the resource associations are listed.
  final String? arn;

  /// A list of
  /// <code>ListResourcesAssociatedToCustomLineItemResponseElement</code> for each
  /// resource association retrieved.
  final List<ListResourcesAssociatedToCustomLineItemResponseElement>?
      associatedResources;

  /// The pagination token to be used in subsequent requests to retrieve
  /// additional results.
  final String? nextToken;

  ListResourcesAssociatedToCustomLineItemOutput({
    this.arn,
    this.associatedResources,
    this.nextToken,
  });

  factory ListResourcesAssociatedToCustomLineItemOutput.fromJson(
      Map<String, dynamic> json) {
    return ListResourcesAssociatedToCustomLineItemOutput(
      arn: json['Arn'] as String?,
      associatedResources: (json['AssociatedResources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ListResourcesAssociatedToCustomLineItemResponseElement.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedResources = this.associatedResources;
    final nextToken = this.nextToken;
    return {
      if (arn != null) 'Arn': arn,
      if (associatedResources != null)
        'AssociatedResources': associatedResources,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A representation of a resource association for a custom line item.
class ListResourcesAssociatedToCustomLineItemResponseElement {
  /// The ARN of the associated resource.
  final String? arn;

  /// The end billing period of the associated resource.
  final String? endBillingPeriod;

  /// The type of relationship between the custom line item and the associated
  /// resource.
  final CustomLineItemRelationship? relationship;

  ListResourcesAssociatedToCustomLineItemResponseElement({
    this.arn,
    this.endBillingPeriod,
    this.relationship,
  });

  factory ListResourcesAssociatedToCustomLineItemResponseElement.fromJson(
      Map<String, dynamic> json) {
    return ListResourcesAssociatedToCustomLineItemResponseElement(
      arn: json['Arn'] as String?,
      endBillingPeriod: json['EndBillingPeriod'] as String?,
      relationship:
          (json['Relationship'] as String?)?.toCustomLineItemRelationship(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final endBillingPeriod = this.endBillingPeriod;
    final relationship = this.relationship;
    return {
      if (arn != null) 'Arn': arn,
      if (endBillingPeriod != null) 'EndBillingPeriod': endBillingPeriod,
      if (relationship != null) 'Relationship': relationship.toValue(),
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

enum MatchOption {
  notEqual,
}

extension MatchOptionValueExtension on MatchOption {
  String toValue() {
    switch (this) {
      case MatchOption.notEqual:
        return 'NOT_EQUAL';
    }
  }
}

extension MatchOptionFromString on String {
  MatchOption toMatchOption() {
    switch (this) {
      case 'NOT_EQUAL':
        return MatchOption.notEqual;
    }
    throw Exception('$this is not known in enum MatchOption');
  }
}

/// A representation of a pricing plan.
class PricingPlanListElement {
  /// The pricing plan Amazon Resource Names (ARN). This can be used to uniquely
  /// identify a pricing plan.
  final String? arn;

  /// The time when the pricing plan was created.
  final int? creationTime;

  /// The pricing plan description.
  final String? description;

  /// The most recent time when the pricing plan was modified.
  final int? lastModifiedTime;

  /// The name of a pricing plan.
  final String? name;

  /// The pricing rules count that's currently associated with this pricing plan
  /// list element.
  final int? size;

  PricingPlanListElement({
    this.arn,
    this.creationTime,
    this.description,
    this.lastModifiedTime,
    this.name,
    this.size,
  });

  factory PricingPlanListElement.fromJson(Map<String, dynamic> json) {
    return PricingPlanListElement(
      arn: json['Arn'] as String?,
      creationTime: json['CreationTime'] as int?,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final size = this.size;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null) 'CreationTime': creationTime,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
      if (size != null) 'Size': size,
    };
  }
}

/// A representation of a pricing rule.
class PricingRuleListElement {
  /// The Amazon Resource Name (ARN) used to uniquely identify a pricing rule.
  final String? arn;

  /// The pricing plans count that this pricing rule is associated with.
  final int? associatedPricingPlanCount;

  /// The seller of services provided by Amazon Web Services, their affiliates, or
  /// third-party providers selling services via Amazon Web Services Marketplace.
  final String? billingEntity;

  /// The time when the pricing rule was created.
  final int? creationTime;

  /// The pricing rule description.
  final String? description;

  /// The most recent time when the pricing rule was modified.
  final int? lastModifiedTime;

  /// A percentage modifier applied on the public pricing rates.
  final double? modifierPercentage;

  /// The name of a pricing rule.
  final String? name;

  /// Operation is the specific Amazon Web Services action covered by this line
  /// item. This describes the specific usage of the line item.
  ///
  /// If the <code>Scope</code> attribute is set to <code>SKU</code>, this
  /// attribute indicates which operation the <code>PricingRule</code> is
  /// modifying. For example, a value of <code>RunInstances:0202</code> indicates
  /// the operation of running an Amazon EC2 instance.
  final String? operation;

  /// The scope of pricing rule that indicates if it is globally applicable, or if
  /// it is service-specific.
  final PricingRuleScope? scope;

  /// If the <code>Scope</code> attribute is <code>SERVICE</code>, this attribute
  /// indicates which service the <code>PricingRule</code> is applicable for.
  final String? service;

  /// The set of tiering configurations for the pricing rule.
  final Tiering? tiering;

  /// The type of pricing rule.
  final PricingRuleType? type;

  /// Usage type is the unit that each service uses to measure the usage of a
  /// specific type of resource.
  ///
  /// If the <code>Scope</code> attribute is set to <code>SKU</code>, this
  /// attribute indicates which usage type the <code>PricingRule</code> is
  /// modifying. For example, <code>USW2-BoxUsage:m2.2xlarge</code> describes
  /// an<code> M2 High Memory Double Extra Large</code> instance in the US West
  /// (Oregon) Region. <pre><code>&lt;/p&gt; </code></pre>
  final String? usageType;

  PricingRuleListElement({
    this.arn,
    this.associatedPricingPlanCount,
    this.billingEntity,
    this.creationTime,
    this.description,
    this.lastModifiedTime,
    this.modifierPercentage,
    this.name,
    this.operation,
    this.scope,
    this.service,
    this.tiering,
    this.type,
    this.usageType,
  });

  factory PricingRuleListElement.fromJson(Map<String, dynamic> json) {
    return PricingRuleListElement(
      arn: json['Arn'] as String?,
      associatedPricingPlanCount: json['AssociatedPricingPlanCount'] as int?,
      billingEntity: json['BillingEntity'] as String?,
      creationTime: json['CreationTime'] as int?,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      modifierPercentage: json['ModifierPercentage'] as double?,
      name: json['Name'] as String?,
      operation: json['Operation'] as String?,
      scope: (json['Scope'] as String?)?.toPricingRuleScope(),
      service: json['Service'] as String?,
      tiering: json['Tiering'] != null
          ? Tiering.fromJson(json['Tiering'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toPricingRuleType(),
      usageType: json['UsageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedPricingPlanCount = this.associatedPricingPlanCount;
    final billingEntity = this.billingEntity;
    final creationTime = this.creationTime;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final modifierPercentage = this.modifierPercentage;
    final name = this.name;
    final operation = this.operation;
    final scope = this.scope;
    final service = this.service;
    final tiering = this.tiering;
    final type = this.type;
    final usageType = this.usageType;
    return {
      if (arn != null) 'Arn': arn,
      if (associatedPricingPlanCount != null)
        'AssociatedPricingPlanCount': associatedPricingPlanCount,
      if (billingEntity != null) 'BillingEntity': billingEntity,
      if (creationTime != null) 'CreationTime': creationTime,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (modifierPercentage != null) 'ModifierPercentage': modifierPercentage,
      if (name != null) 'Name': name,
      if (operation != null) 'Operation': operation,
      if (scope != null) 'Scope': scope.toValue(),
      if (service != null) 'Service': service,
      if (tiering != null) 'Tiering': tiering,
      if (type != null) 'Type': type.toValue(),
      if (usageType != null) 'UsageType': usageType,
    };
  }
}

enum PricingRuleScope {
  global,
  service,
  billingEntity,
  sku,
}

extension PricingRuleScopeValueExtension on PricingRuleScope {
  String toValue() {
    switch (this) {
      case PricingRuleScope.global:
        return 'GLOBAL';
      case PricingRuleScope.service:
        return 'SERVICE';
      case PricingRuleScope.billingEntity:
        return 'BILLING_ENTITY';
      case PricingRuleScope.sku:
        return 'SKU';
    }
  }
}

extension PricingRuleScopeFromString on String {
  PricingRuleScope toPricingRuleScope() {
    switch (this) {
      case 'GLOBAL':
        return PricingRuleScope.global;
      case 'SERVICE':
        return PricingRuleScope.service;
      case 'BILLING_ENTITY':
        return PricingRuleScope.billingEntity;
      case 'SKU':
        return PricingRuleScope.sku;
    }
    throw Exception('$this is not known in enum PricingRuleScope');
  }
}

enum PricingRuleType {
  markup,
  discount,
  tiering,
}

extension PricingRuleTypeValueExtension on PricingRuleType {
  String toValue() {
    switch (this) {
      case PricingRuleType.markup:
        return 'MARKUP';
      case PricingRuleType.discount:
        return 'DISCOUNT';
      case PricingRuleType.tiering:
        return 'TIERING';
    }
  }
}

extension PricingRuleTypeFromString on String {
  PricingRuleType toPricingRuleType() {
    switch (this) {
      case 'MARKUP':
        return PricingRuleType.markup;
      case 'DISCOUNT':
        return PricingRuleType.discount;
      case 'TIERING':
        return PricingRuleType.tiering;
    }
    throw Exception('$this is not known in enum PricingRuleType');
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

/// The set of tiering configurations for the pricing rule.
class Tiering {
  /// The possible Amazon Web Services Free Tier configurations.
  final FreeTierConfig freeTier;

  Tiering({
    required this.freeTier,
  });

  factory Tiering.fromJson(Map<String, dynamic> json) {
    return Tiering(
      freeTier:
          FreeTierConfig.fromJson(json['FreeTier'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final freeTier = this.freeTier;
    return {
      'FreeTier': freeTier,
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

/// Specifies if the billing group has the following features enabled.
class UpdateBillingGroupAccountGrouping {
  /// Specifies if this billing group will automatically associate newly added
  /// Amazon Web Services accounts that join your consolidated billing family.
  final bool? autoAssociate;

  UpdateBillingGroupAccountGrouping({
    this.autoAssociate,
  });

  factory UpdateBillingGroupAccountGrouping.fromJson(
      Map<String, dynamic> json) {
    return UpdateBillingGroupAccountGrouping(
      autoAssociate: json['AutoAssociate'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoAssociate = this.autoAssociate;
    return {
      if (autoAssociate != null) 'AutoAssociate': autoAssociate,
    };
  }
}

class UpdateBillingGroupOutput {
  /// Specifies if the billing group has automatic account association
  /// (<code>AutoAssociate</code>) enabled.
  final UpdateBillingGroupAccountGrouping? accountGrouping;

  /// The Amazon Resource Name (ARN) of the billing group that was updated.
  final String? arn;

  /// A description of the billing group.
  final String? description;

  /// The most recent time when the billing group was modified.
  final int? lastModifiedTime;

  /// The name of the billing group. The names must be unique to each billing
  /// group.
  final String? name;

  /// The Amazon Resource Name (ARN) of the pricing plan to compute Amazon Web
  /// Services charges for the billing group.
  final String? pricingPlanArn;

  /// The account ID that serves as the main account in a billing group.
  final String? primaryAccountId;

  /// The number of accounts in the particular billing group.
  final int? size;

  /// The status of the billing group. Only one of the valid values can be used.
  final BillingGroupStatus? status;

  /// The reason why the billing group is in its current status.
  final String? statusReason;

  UpdateBillingGroupOutput({
    this.accountGrouping,
    this.arn,
    this.description,
    this.lastModifiedTime,
    this.name,
    this.pricingPlanArn,
    this.primaryAccountId,
    this.size,
    this.status,
    this.statusReason,
  });

  factory UpdateBillingGroupOutput.fromJson(Map<String, dynamic> json) {
    return UpdateBillingGroupOutput(
      accountGrouping: json['AccountGrouping'] != null
          ? UpdateBillingGroupAccountGrouping.fromJson(
              json['AccountGrouping'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
      pricingPlanArn: json['PricingPlanArn'] as String?,
      primaryAccountId: json['PrimaryAccountId'] as String?,
      size: json['Size'] as int?,
      status: (json['Status'] as String?)?.toBillingGroupStatus(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountGrouping = this.accountGrouping;
    final arn = this.arn;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final pricingPlanArn = this.pricingPlanArn;
    final primaryAccountId = this.primaryAccountId;
    final size = this.size;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (accountGrouping != null) 'AccountGrouping': accountGrouping,
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
      if (pricingPlanArn != null) 'PricingPlanArn': pricingPlanArn,
      if (primaryAccountId != null) 'PrimaryAccountId': primaryAccountId,
      if (size != null) 'Size': size,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// A representation of the new charge details of a custom line item. This
/// should contain only one of <code>Flat</code> or <code>Percentage</code>.
class UpdateCustomLineItemChargeDetails {
  /// An <code>UpdateCustomLineItemFlatChargeDetails</code> that describes the new
  /// charge details of a flat custom line item.
  final UpdateCustomLineItemFlatChargeDetails? flat;

  /// A representation of the line item filter.
  final List<LineItemFilter>? lineItemFilters;

  /// An <code>UpdateCustomLineItemPercentageChargeDetails</code> that describes
  /// the new charge details of a percentage custom line item.
  final UpdateCustomLineItemPercentageChargeDetails? percentage;

  UpdateCustomLineItemChargeDetails({
    this.flat,
    this.lineItemFilters,
    this.percentage,
  });

  Map<String, dynamic> toJson() {
    final flat = this.flat;
    final lineItemFilters = this.lineItemFilters;
    final percentage = this.percentage;
    return {
      if (flat != null) 'Flat': flat,
      if (lineItemFilters != null) 'LineItemFilters': lineItemFilters,
      if (percentage != null) 'Percentage': percentage,
    };
  }
}

/// A representation of the new charge details that are associated with a flat
/// custom line item.
class UpdateCustomLineItemFlatChargeDetails {
  /// The custom line item's new fixed charge value in USD.
  final double chargeValue;

  UpdateCustomLineItemFlatChargeDetails({
    required this.chargeValue,
  });

  Map<String, dynamic> toJson() {
    final chargeValue = this.chargeValue;
    return {
      'ChargeValue': chargeValue,
    };
  }
}

class UpdateCustomLineItemOutput {
  /// The ARN of the successfully updated custom line item.
  final String? arn;

  /// The number of resources that are associated to the custom line item.
  final int? associationSize;

  /// The ARN of the billing group that the custom line item is applied to.
  final String? billingGroupArn;

  /// A <code>ListCustomLineItemChargeDetails</code> containing the charge details
  /// of the successfully updated custom line item.
  final ListCustomLineItemChargeDetails? chargeDetails;

  /// The description of the successfully updated custom line item.
  final String? description;

  /// The most recent time when the custom line item was modified.
  final int? lastModifiedTime;

  /// The name of the successfully updated custom line item.
  final String? name;

  UpdateCustomLineItemOutput({
    this.arn,
    this.associationSize,
    this.billingGroupArn,
    this.chargeDetails,
    this.description,
    this.lastModifiedTime,
    this.name,
  });

  factory UpdateCustomLineItemOutput.fromJson(Map<String, dynamic> json) {
    return UpdateCustomLineItemOutput(
      arn: json['Arn'] as String?,
      associationSize: json['AssociationSize'] as int?,
      billingGroupArn: json['BillingGroupArn'] as String?,
      chargeDetails: json['ChargeDetails'] != null
          ? ListCustomLineItemChargeDetails.fromJson(
              json['ChargeDetails'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associationSize = this.associationSize;
    final billingGroupArn = this.billingGroupArn;
    final chargeDetails = this.chargeDetails;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (associationSize != null) 'AssociationSize': associationSize,
      if (billingGroupArn != null) 'BillingGroupArn': billingGroupArn,
      if (chargeDetails != null) 'ChargeDetails': chargeDetails,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
    };
  }
}

/// A representation of the new charge details that are associated with a
/// percentage custom line item.
class UpdateCustomLineItemPercentageChargeDetails {
  /// The custom line item's new percentage value. This will be multiplied against
  /// the combined value of its associated resources to determine its charge
  /// value.
  final double percentageValue;

  UpdateCustomLineItemPercentageChargeDetails({
    required this.percentageValue,
  });

  Map<String, dynamic> toJson() {
    final percentageValue = this.percentageValue;
    return {
      'PercentageValue': percentageValue,
    };
  }
}

/// The possible Amazon Web Services Free Tier configurations.
class UpdateFreeTierConfig {
  /// Activate or deactivate application of Amazon Web Services Free Tier.
  final bool activated;

  UpdateFreeTierConfig({
    required this.activated,
  });

  factory UpdateFreeTierConfig.fromJson(Map<String, dynamic> json) {
    return UpdateFreeTierConfig(
      activated: json['Activated'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final activated = this.activated;
    return {
      'Activated': activated,
    };
  }
}

class UpdatePricingPlanOutput {
  /// The Amazon Resource Name (ARN) of the updated pricing plan.
  final String? arn;

  /// The new description for the pricing rule.
  final String? description;

  /// The most recent time when the pricing plan was modified.
  final int? lastModifiedTime;

  /// The name of the pricing plan. The name must be unique to each pricing plan.
  final String? name;

  /// The pricing rules count that's currently associated with this pricing plan
  /// list.
  final int? size;

  UpdatePricingPlanOutput({
    this.arn,
    this.description,
    this.lastModifiedTime,
    this.name,
    this.size,
  });

  factory UpdatePricingPlanOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePricingPlanOutput(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      name: json['Name'] as String?,
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final name = this.name;
    final size = this.size;
    return {
      if (arn != null) 'Arn': arn,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (name != null) 'Name': name,
      if (size != null) 'Size': size,
    };
  }
}

class UpdatePricingRuleOutput {
  /// The Amazon Resource Name (ARN) of the successfully updated pricing rule.
  final String? arn;

  /// The pricing plans count that this pricing rule is associated with.
  final int? associatedPricingPlanCount;

  /// The seller of services provided by Amazon Web Services, their affiliates, or
  /// third-party providers selling services via Amazon Web Services Marketplace.
  final String? billingEntity;

  /// The new description for the pricing rule.
  final String? description;

  /// The most recent time the pricing rule was modified.
  final int? lastModifiedTime;

  /// The new modifier to show pricing plan rates as a percentage.
  final double? modifierPercentage;

  /// The new name of the pricing rule. The name must be unique to each pricing
  /// rule.
  final String? name;

  /// Operation refers to the specific Amazon Web Services covered by this line
  /// item. This describes the specific usage of the line item.
  ///
  /// If the <code>Scope</code> attribute is set to <code>SKU</code>, this
  /// attribute indicates which operation the <code>PricingRule</code> is
  /// modifying. For example, a value of <code>RunInstances:0202</code> indicates
  /// the operation of running an Amazon EC2 instance.
  final String? operation;

  /// The scope of pricing rule that indicates if it's globally applicable, or
  /// it's service-specific.
  final PricingRuleScope? scope;

  /// If the <code>Scope</code> attribute is set to <code>SERVICE</code>, the
  /// attribute indicates which service the <code>PricingRule</code> is applicable
  /// for.
  final String? service;

  /// The set of tiering configurations for the pricing rule.
  final UpdateTieringInput? tiering;

  /// The new pricing rule type.
  final PricingRuleType? type;

  /// Usage type is the unit that each service uses to measure the usage of a
  /// specific type of resource.
  ///
  /// If the <code>Scope</code> attribute is set to <code>SKU</code>, this
  /// attribute indicates which usage type the <code>PricingRule</code> is
  /// modifying. For example, <code>USW2-BoxUsage:m2.2xlarge</code> describes an
  /// <code>M2 High Memory Double Extra Large</code> instance in the US West
  /// (Oregon) Region.
  final String? usageType;

  UpdatePricingRuleOutput({
    this.arn,
    this.associatedPricingPlanCount,
    this.billingEntity,
    this.description,
    this.lastModifiedTime,
    this.modifierPercentage,
    this.name,
    this.operation,
    this.scope,
    this.service,
    this.tiering,
    this.type,
    this.usageType,
  });

  factory UpdatePricingRuleOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePricingRuleOutput(
      arn: json['Arn'] as String?,
      associatedPricingPlanCount: json['AssociatedPricingPlanCount'] as int?,
      billingEntity: json['BillingEntity'] as String?,
      description: json['Description'] as String?,
      lastModifiedTime: json['LastModifiedTime'] as int?,
      modifierPercentage: json['ModifierPercentage'] as double?,
      name: json['Name'] as String?,
      operation: json['Operation'] as String?,
      scope: (json['Scope'] as String?)?.toPricingRuleScope(),
      service: json['Service'] as String?,
      tiering: json['Tiering'] != null
          ? UpdateTieringInput.fromJson(json['Tiering'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toPricingRuleType(),
      usageType: json['UsageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedPricingPlanCount = this.associatedPricingPlanCount;
    final billingEntity = this.billingEntity;
    final description = this.description;
    final lastModifiedTime = this.lastModifiedTime;
    final modifierPercentage = this.modifierPercentage;
    final name = this.name;
    final operation = this.operation;
    final scope = this.scope;
    final service = this.service;
    final tiering = this.tiering;
    final type = this.type;
    final usageType = this.usageType;
    return {
      if (arn != null) 'Arn': arn,
      if (associatedPricingPlanCount != null)
        'AssociatedPricingPlanCount': associatedPricingPlanCount,
      if (billingEntity != null) 'BillingEntity': billingEntity,
      if (description != null) 'Description': description,
      if (lastModifiedTime != null) 'LastModifiedTime': lastModifiedTime,
      if (modifierPercentage != null) 'ModifierPercentage': modifierPercentage,
      if (name != null) 'Name': name,
      if (operation != null) 'Operation': operation,
      if (scope != null) 'Scope': scope.toValue(),
      if (service != null) 'Service': service,
      if (tiering != null) 'Tiering': tiering,
      if (type != null) 'Type': type.toValue(),
      if (usageType != null) 'UsageType': usageType,
    };
  }
}

/// The set of tiering configurations for the pricing rule.
class UpdateTieringInput {
  /// The possible Amazon Web Services Free Tier configurations.
  final UpdateFreeTierConfig freeTier;

  UpdateTieringInput({
    required this.freeTier,
  });

  factory UpdateTieringInput.fromJson(Map<String, dynamic> json) {
    return UpdateTieringInput(
      freeTier: UpdateFreeTierConfig.fromJson(
          json['FreeTier'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final freeTier = this.freeTier;
    return {
      'FreeTier': freeTier,
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

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
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
  'ServiceLimitExceededException': (type, message) =>
      ServiceLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
