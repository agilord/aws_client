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

import 'v2024_06_19.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the Pricing Calculator API to programmatically create estimates
/// for your planned cloud use. You can model usage and commitments such as
/// Savings Plans and Reserved Instances, and generate estimated costs using
/// your discounts and benefit sharing preferences.
///
/// The Pricing Calculator API provides the following endpoint:
///
/// <ul>
/// <li>
/// <code>https://bcm-pricing-calculator.us-east-1.api.aws</code>
/// </li>
/// </ul>
class BcmPricingCalculator {
  final _s.JsonProtocol _protocol;
  factory BcmPricingCalculator({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'bcm-pricing-calculator',
    );
    return BcmPricingCalculator._(
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
  BcmPricingCalculator._({
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

  /// Retrieves the current preferences for Pricing Calculator.
  ///
  /// May throw [DataUnavailableException].
  Future<GetPreferencesResponse> getPreferences() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.GetPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource to list tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListTagsForResource'
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

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'tags': tags,
      },
    );
  }

  /// Removes one or more tags from a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the resource.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates the preferences for Pricing Calculator.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [managementAccountRateTypeSelections] :
  /// The updated preferred rate types for the management account.
  ///
  /// Parameter [memberAccountRateTypeSelections] :
  /// The updated preferred rate types for member accounts.
  ///
  /// Parameter [standaloneAccountRateTypeSelections] :
  /// The updated preferred rate types for a standalone account.
  Future<UpdatePreferencesResponse> updatePreferences({
    List<RateType>? managementAccountRateTypeSelections,
    List<RateType>? memberAccountRateTypeSelections,
    List<RateType>? standaloneAccountRateTypeSelections,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.UpdatePreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (managementAccountRateTypeSelections != null)
          'managementAccountRateTypeSelections':
              managementAccountRateTypeSelections.map((e) => e.value).toList(),
        if (memberAccountRateTypeSelections != null)
          'memberAccountRateTypeSelections':
              memberAccountRateTypeSelections.map((e) => e.value).toList(),
        if (standaloneAccountRateTypeSelections != null)
          'standaloneAccountRateTypeSelections':
              standaloneAccountRateTypeSelections.map((e) => e.value).toList(),
      },
    );

    return UpdatePreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Create a Bill estimate from a Bill scenario. In the Bill scenario you can
  /// model usage addition, usage changes, and usage removal. You can also model
  /// commitment addition and commitment removal. After all changes in a Bill
  /// scenario is made satisfactorily, you can call this API with a Bill
  /// scenario ID to generate the Bill estimate. Bill estimate calculates the
  /// pre-tax cost for your consolidated billing family, incorporating all
  /// modeled usage and commitments alongside existing usage and commitments
  /// from your most recent completed anniversary bill, with any applicable
  /// discounts applied.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to create a Bill estimate.
  ///
  /// Parameter [name] :
  /// The name of the Bill estimate that will be created. Names must be unique
  /// for an account.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// An optional list of tags to associate with the specified BillEstimate. You
  /// can use resource tags to control access to your BillEstimate using IAM
  /// policies. Each tag consists of a key and a value, and each key must be
  /// unique for the resource. The following restrictions apply to resource
  /// tags:
  ///
  /// <ul>
  /// <li>
  /// Although the maximum number of array members is 200, you can assign a
  /// maximum of 50 user-tags to one resource. The remaining are reserved for
  /// Amazon Web Services.
  /// </li>
  /// <li>
  /// The maximum length of a key is 128 characters.
  /// </li>
  /// <li>
  /// The maximum length of a value is 256 characters.
  /// </li>
  /// <li>
  /// Keys and values can only contain alphanumeric characters, spaces, and any
  /// of the following: <code>_.:/=+@-</code>.
  /// </li>
  /// <li>
  /// Keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Keys and values are trimmed for any leading or trailing whitespaces.
  /// </li>
  /// <li>
  /// Don't use <code>aws:</code> as a prefix for your keys. This prefix is
  /// reserved for Amazon Web Services.
  /// </li>
  /// </ul>
  Future<CreateBillEstimateResponse> createBillEstimate({
    required String billScenarioId,
    required String name,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.CreateBillEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateBillEstimateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details of a specific bill estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the bill estimate to retrieve.
  Future<GetBillEstimateResponse> getBillEstimate({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.GetBillEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return GetBillEstimateResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing bill estimate.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the bill estimate to update.
  ///
  /// Parameter [expiresAt] :
  /// The new expiration date for the bill estimate.
  ///
  /// Parameter [name] :
  /// The new name for the bill estimate.
  Future<UpdateBillEstimateResponse> updateBillEstimate({
    required String identifier,
    DateTime? expiresAt,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.UpdateBillEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
        if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
        if (name != null) 'name': name,
      },
    );

    return UpdateBillEstimateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing bill estimate.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the bill estimate to delete.
  Future<void> deleteBillEstimate({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.DeleteBillEstimate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );
  }

  /// Lists all bill estimates for the account.
  ///
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [createdAtFilter] :
  /// Filter bill estimates based on the creation date.
  ///
  /// Parameter [expiresAtFilter] :
  /// Filter bill estimates based on the expiration date.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of bill estimates.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillEstimatesResponse> listBillEstimates({
    FilterTimestamp? createdAtFilter,
    FilterTimestamp? expiresAtFilter,
    List<ListBillEstimatesFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListBillEstimates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (createdAtFilter != null) 'createdAtFilter': createdAtFilter,
        if (expiresAtFilter != null) 'expiresAtFilter': expiresAtFilter,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillEstimatesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the commitments associated with a bill estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billEstimateId] :
  /// The unique identifier of the bill estimate to list commitments for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillEstimateCommitmentsResponse> listBillEstimateCommitments({
    required String billEstimateId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListBillEstimateCommitments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billEstimateId': billEstimateId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillEstimateCommitmentsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the input commitment modifications associated with a bill estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billEstimateId] :
  /// The unique identifier of the bill estimate to list input commitment
  /// modifications for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillEstimateInputCommitmentModificationsResponse>
      listBillEstimateInputCommitmentModifications({
    required String billEstimateId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.ListBillEstimateInputCommitmentModifications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billEstimateId': billEstimateId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillEstimateInputCommitmentModificationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the input usage modifications associated with a bill estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billEstimateId] :
  /// The unique identifier of the bill estimate to list input usage
  /// modifications for.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of input usage modifications.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillEstimateInputUsageModificationsResponse>
      listBillEstimateInputUsageModifications({
    required String billEstimateId,
    List<ListUsageFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.ListBillEstimateInputUsageModifications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billEstimateId': billEstimateId,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillEstimateInputUsageModificationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the line items associated with a bill estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billEstimateId] :
  /// The unique identifier of the bill estimate to list line items for.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of line items.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillEstimateLineItemsResponse> listBillEstimateLineItems({
    required String billEstimateId,
    List<ListBillEstimateLineItemsFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListBillEstimateLineItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billEstimateId': billEstimateId,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillEstimateLineItemsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new bill scenario to model potential changes to Amazon Web
  /// Services usage and costs.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// A descriptive name for the bill scenario.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [costCategoryGroupSharingPreferenceArn] :
  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  ///
  /// Parameter [groupSharingPreference] :
  /// The setting for the reserved instance and savings plan group sharing used
  /// in this estimate.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the bill scenario.
  Future<CreateBillScenarioResponse> createBillScenario({
    required String name,
    String? clientToken,
    String? costCategoryGroupSharingPreferenceArn,
    GroupSharingPreferenceEnum? groupSharingPreference,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.CreateBillScenario'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (costCategoryGroupSharingPreferenceArn != null)
          'costCategoryGroupSharingPreferenceArn':
              costCategoryGroupSharingPreferenceArn,
        if (groupSharingPreference != null)
          'groupSharingPreference': groupSharingPreference.value,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateBillScenarioResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details of a specific bill scenario.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the bill scenario to retrieve.
  Future<GetBillScenarioResponse> getBillScenario({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.GetBillScenario'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return GetBillScenarioResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing bill scenario.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the bill scenario to update.
  ///
  /// Parameter [costCategoryGroupSharingPreferenceArn] :
  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  ///
  /// Parameter [expiresAt] :
  /// The new expiration date for the bill scenario.
  ///
  /// Parameter [groupSharingPreference] :
  /// The setting for the reserved instance and savings plan group sharing used
  /// in this estimate.
  ///
  /// Parameter [name] :
  /// The new name for the bill scenario.
  Future<UpdateBillScenarioResponse> updateBillScenario({
    required String identifier,
    String? costCategoryGroupSharingPreferenceArn,
    DateTime? expiresAt,
    GroupSharingPreferenceEnum? groupSharingPreference,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.UpdateBillScenario'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
        if (costCategoryGroupSharingPreferenceArn != null)
          'costCategoryGroupSharingPreferenceArn':
              costCategoryGroupSharingPreferenceArn,
        if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
        if (groupSharingPreference != null)
          'groupSharingPreference': groupSharingPreference.value,
        if (name != null) 'name': name,
      },
    );

    return UpdateBillScenarioResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing bill scenario.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the bill scenario to delete.
  Future<void> deleteBillScenario({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.DeleteBillScenario'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );
  }

  /// Lists all bill scenarios for the account.
  ///
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [createdAtFilter] :
  /// Filter bill scenarios based on the creation date.
  ///
  /// Parameter [expiresAtFilter] :
  /// Filter bill scenarios based on the expiration date.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of bill scenarios.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillScenariosResponse> listBillScenarios({
    FilterTimestamp? createdAtFilter,
    FilterTimestamp? expiresAtFilter,
    List<ListBillScenariosFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListBillScenarios'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (createdAtFilter != null) 'createdAtFilter': createdAtFilter,
        if (expiresAtFilter != null) 'expiresAtFilter': expiresAtFilter,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillScenariosResponse.fromJson(jsonResponse.body);
  }

  /// Lists the commitment modifications associated with a bill scenario.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billScenarioId] :
  /// The unique identifier of the bill scenario to list commitment
  /// modifications for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillScenarioCommitmentModificationsResponse>
      listBillScenarioCommitmentModifications({
    required String billScenarioId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.ListBillScenarioCommitmentModifications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillScenarioCommitmentModificationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Create Compute Savings Plans, EC2 Instance Savings Plans, or EC2 Reserved
  /// Instances commitments that you want to model in a Bill Scenario.
  /// <note>
  /// The <code>BatchCreateBillScenarioCommitmentModification</code> operation
  /// doesn't have its own IAM permission. To authorize this operation for
  /// Amazon Web Services principals, include the permission
  /// <code>bcm-pricing-calculator:CreateBillScenarioCommitmentModification</code>
  /// in your policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to create the modeled
  /// commitment.
  ///
  /// Parameter [commitmentModifications] :
  /// List of commitments that you want to model in the Bill Scenario.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<BatchCreateBillScenarioCommitmentModificationResponse>
      batchCreateBillScenarioCommitmentModification({
    required String billScenarioId,
    required List<BatchCreateBillScenarioCommitmentModificationEntry>
        commitmentModifications,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.BatchCreateBillScenarioCommitmentModification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'commitmentModifications': commitmentModifications,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return BatchCreateBillScenarioCommitmentModificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Delete commitment that you have created in a Bill Scenario. You can only
  /// delete a commitment that you had added and cannot model deletion (or
  /// removal) of a existing commitment. If you want model deletion of an
  /// existing commitment, see the negate <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BillScenarioCommitmentModificationAction.html">
  /// BillScenarioCommitmentModificationAction</a> of <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BatchCreateBillScenarioUsageModification.html">
  /// BatchCreateBillScenarioCommitmentModification</a> operation.
  /// <note>
  /// The <code>BatchDeleteBillScenarioCommitmentModification</code> operation
  /// doesn't have its own IAM permission. To authorize this operation for
  /// Amazon Web Services principals, include the permission
  /// <code>bcm-pricing-calculator:DeleteBillScenarioCommitmentModification</code>
  /// in your policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to delete the modeled
  /// commitment.
  ///
  /// Parameter [ids] :
  /// List of commitments that you want to delete from the Bill Scenario.
  Future<BatchDeleteBillScenarioCommitmentModificationResponse>
      batchDeleteBillScenarioCommitmentModification({
    required String billScenarioId,
    required List<String> ids,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.BatchDeleteBillScenarioCommitmentModification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'ids': ids,
      },
    );

    return BatchDeleteBillScenarioCommitmentModificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Update a newly added or existing commitment. You can update the commitment
  /// group based on a commitment ID and a Bill scenario ID.
  /// <note>
  /// The <code>BatchUpdateBillScenarioCommitmentModification</code> operation
  /// doesn't have its own IAM permission. To authorize this operation for
  /// Amazon Web Services principals, include the permission
  /// <code>bcm-pricing-calculator:UpdateBillScenarioCommitmentModification</code>
  /// in your policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to modify the commitment
  /// group of a modeled commitment.
  ///
  /// Parameter [commitmentModifications] :
  /// List of commitments that you want to update in a Bill Scenario.
  Future<BatchUpdateBillScenarioCommitmentModificationResponse>
      batchUpdateBillScenarioCommitmentModification({
    required String billScenarioId,
    required List<BatchUpdateBillScenarioCommitmentModificationEntry>
        commitmentModifications,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.BatchUpdateBillScenarioCommitmentModification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'commitmentModifications': commitmentModifications,
      },
    );

    return BatchUpdateBillScenarioCommitmentModificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the usage modifications associated with a bill scenario.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billScenarioId] :
  /// The unique identifier of the bill scenario to list usage modifications
  /// for.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of usage modifications.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListBillScenarioUsageModificationsResponse>
      listBillScenarioUsageModifications({
    required String billScenarioId,
    List<ListUsageFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.ListBillScenarioUsageModifications'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListBillScenarioUsageModificationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Create Amazon Web Services service usage that you want to model in a Bill
  /// Scenario.
  /// <note>
  /// The <code>BatchCreateBillScenarioUsageModification</code> operation
  /// doesn't have its own IAM permission. To authorize this operation for
  /// Amazon Web Services principals, include the permission
  /// <code>bcm-pricing-calculator:CreateBillScenarioUsageModification</code> in
  /// your policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to create the modeled
  /// usage.
  ///
  /// Parameter [usageModifications] :
  /// List of usage that you want to model in the Bill Scenario.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<BatchCreateBillScenarioUsageModificationResponse>
      batchCreateBillScenarioUsageModification({
    required String billScenarioId,
    required List<BatchCreateBillScenarioUsageModificationEntry>
        usageModifications,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.BatchCreateBillScenarioUsageModification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'usageModifications': usageModifications,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return BatchCreateBillScenarioUsageModificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Delete usage that you have created in a Bill Scenario. You can only delete
  /// usage that you had added and cannot model deletion (or removal) of a
  /// existing usage. If you want model removal of an existing usage, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BatchUpdateBillScenarioUsageModification.html">
  /// BatchUpdateBillScenarioUsageModification</a>.
  /// <note>
  /// The <code>BatchDeleteBillScenarioUsageModification</code> operation
  /// doesn't have its own IAM permission. To authorize this operation for
  /// Amazon Web Services principals, include the permission
  /// <code>bcm-pricing-calculator:DeleteBillScenarioUsageModification</code> in
  /// your policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to delete the modeled
  /// usage.
  ///
  /// Parameter [ids] :
  /// List of usage that you want to delete from the Bill Scenario.
  Future<BatchDeleteBillScenarioUsageModificationResponse>
      batchDeleteBillScenarioUsageModification({
    required String billScenarioId,
    required List<String> ids,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.BatchDeleteBillScenarioUsageModification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'ids': ids,
      },
    );

    return BatchDeleteBillScenarioUsageModificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Update a newly added or existing usage lines. You can update the usage
  /// amounts, usage hour, and usage group based on a usage ID and a Bill
  /// scenario ID.
  /// <note>
  /// The <code>BatchUpdateBillScenarioUsageModification</code> operation
  /// doesn't have its own IAM permission. To authorize this operation for
  /// Amazon Web Services principals, include the permission
  /// <code>bcm-pricing-calculator:UpdateBillScenarioUsageModification</code> in
  /// your policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [billScenarioId] :
  /// The ID of the Bill Scenario for which you want to modify the usage lines.
  ///
  /// Parameter [usageModifications] :
  /// List of usage lines that you want to update in a Bill Scenario identified
  /// by the usage ID.
  Future<BatchUpdateBillScenarioUsageModificationResponse>
      batchUpdateBillScenarioUsageModification({
    required String billScenarioId,
    required List<BatchUpdateBillScenarioUsageModificationEntry>
        usageModifications,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBCMPricingCalculator.BatchUpdateBillScenarioUsageModification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billScenarioId': billScenarioId,
        'usageModifications': usageModifications,
      },
    );

    return BatchUpdateBillScenarioUsageModificationResponse.fromJson(
        jsonResponse.body);
  }

  /// Creates a new workload estimate to model costs for a specific workload.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// A descriptive name for the workload estimate.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure idempotency of the request.
  ///
  /// Parameter [rateType] :
  /// The type of pricing rates to use for the estimate.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the workload estimate.
  Future<CreateWorkloadEstimateResponse> createWorkloadEstimate({
    required String name,
    String? clientToken,
    WorkloadEstimateRateType? rateType,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.CreateWorkloadEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (rateType != null) 'rateType': rateType.value,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateWorkloadEstimateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves details of a specific workload estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the workload estimate to retrieve.
  Future<GetWorkloadEstimateResponse> getWorkloadEstimate({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.GetWorkloadEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );

    return GetWorkloadEstimateResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing workload estimate.
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the workload estimate to update.
  ///
  /// Parameter [expiresAt] :
  /// The new expiration date for the workload estimate.
  ///
  /// Parameter [name] :
  /// The new name for the workload estimate.
  Future<UpdateWorkloadEstimateResponse> updateWorkloadEstimate({
    required String identifier,
    DateTime? expiresAt,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.UpdateWorkloadEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
        if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
        if (name != null) 'name': name,
      },
    );

    return UpdateWorkloadEstimateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing workload estimate.
  ///
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the workload estimate to delete.
  Future<void> deleteWorkloadEstimate({
    required String identifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.DeleteWorkloadEstimate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'identifier': identifier,
      },
    );
  }

  /// Lists all workload estimates for the account.
  ///
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [createdAtFilter] :
  /// Filter workload estimates based on the creation date.
  ///
  /// Parameter [expiresAtFilter] :
  /// Filter workload estimates based on the expiration date.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of workload estimates.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListWorkloadEstimatesResponse> listWorkloadEstimates({
    FilterTimestamp? createdAtFilter,
    FilterTimestamp? expiresAtFilter,
    List<ListWorkloadEstimatesFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListWorkloadEstimates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (createdAtFilter != null) 'createdAtFilter': createdAtFilter,
        if (expiresAtFilter != null) 'expiresAtFilter': expiresAtFilter,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListWorkloadEstimatesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the usage associated with a workload estimate.
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [workloadEstimateId] :
  /// The unique identifier of the workload estimate to list usage for.
  ///
  /// Parameter [filters] :
  /// Filters to apply to the list of usage items.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next page of results.
  Future<ListWorkloadEstimateUsageResponse> listWorkloadEstimateUsage({
    required String workloadEstimateId,
    List<ListUsageFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.ListWorkloadEstimateUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'workloadEstimateId': workloadEstimateId,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListWorkloadEstimateUsageResponse.fromJson(jsonResponse.body);
  }

  /// Create Amazon Web Services service usage that you want to model in a
  /// Workload Estimate.
  /// <note>
  /// The <code>BatchCreateWorkloadEstimateUsage</code> operation doesn't have
  /// its own IAM permission. To authorize this operation for Amazon Web
  /// Services principals, include the permission
  /// <code>bcm-pricing-calculator:CreateWorkloadEstimateUsage</code> in your
  /// policies.
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [usage] :
  /// List of usage that you want to model in the Workload estimate.
  ///
  /// Parameter [workloadEstimateId] :
  /// The ID of the Workload estimate for which you want to create the modeled
  /// usage.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<BatchCreateWorkloadEstimateUsageResponse>
      batchCreateWorkloadEstimateUsage({
    required List<BatchCreateWorkloadEstimateUsageEntry> usage,
    required String workloadEstimateId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.BatchCreateWorkloadEstimateUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'usage': usage,
        'workloadEstimateId': workloadEstimateId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return BatchCreateWorkloadEstimateUsageResponse.fromJson(jsonResponse.body);
  }

  /// Delete usage that you have created in a Workload estimate. You can only
  /// delete usage that you had added and cannot model deletion (or removal) of
  /// a existing usage. If you want model removal of an existing usage, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BatchUpdateWorkloadEstimateUsage.html">
  /// BatchUpdateWorkloadEstimateUsage</a>.
  /// <note>
  /// The <code>BatchDeleteWorkloadEstimateUsage</code> operation doesn't have
  /// its own IAM permission. To authorize this operation for Amazon Web
  /// Services principals, include the permission
  /// <code>bcm-pricing-calculator:DeleteWorkloadEstimateUsage</code> in your
  /// policies.
  /// </note>
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [ids] :
  /// List of usage that you want to delete from the Workload estimate.
  ///
  /// Parameter [workloadEstimateId] :
  /// The ID of the Workload estimate for which you want to delete the modeled
  /// usage.
  Future<BatchDeleteWorkloadEstimateUsageResponse>
      batchDeleteWorkloadEstimateUsage({
    required List<String> ids,
    required String workloadEstimateId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.BatchDeleteWorkloadEstimateUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ids': ids,
        'workloadEstimateId': workloadEstimateId,
      },
    );

    return BatchDeleteWorkloadEstimateUsageResponse.fromJson(jsonResponse.body);
  }

  /// Update a newly added or existing usage lines. You can update the usage
  /// amounts and usage group based on a usage ID and a Workload estimate ID.
  /// <note>
  /// The <code>BatchUpdateWorkloadEstimateUsage</code> operation doesn't have
  /// its own IAM permission. To authorize this operation for Amazon Web
  /// Services principals, include the permission
  /// <code>bcm-pricing-calculator:UpdateWorkloadEstimateUsage</code> in your
  /// policies.
  /// </note>
  ///
  /// May throw [DataUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [usage] :
  /// List of usage line amounts and usage group that you want to update in a
  /// Workload estimate identified by the usage ID.
  ///
  /// Parameter [workloadEstimateId] :
  /// The ID of the Workload estimate for which you want to modify the usage
  /// lines.
  Future<BatchUpdateWorkloadEstimateUsageResponse>
      batchUpdateWorkloadEstimateUsage({
    required List<BatchUpdateWorkloadEstimateUsageEntry> usage,
    required String workloadEstimateId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBCMPricingCalculator.BatchUpdateWorkloadEstimateUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'usage': usage,
        'workloadEstimateId': workloadEstimateId,
      },
    );

    return BatchUpdateWorkloadEstimateUsageResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class GetPreferencesResponse {
  /// The preferred rate types for the management account.
  final List<RateType>? managementAccountRateTypeSelections;

  /// The preferred rate types for member accounts.
  final List<RateType>? memberAccountRateTypeSelections;

  /// The preferred rate types for a standalone account.
  final List<RateType>? standaloneAccountRateTypeSelections;

  GetPreferencesResponse({
    this.managementAccountRateTypeSelections,
    this.memberAccountRateTypeSelections,
    this.standaloneAccountRateTypeSelections,
  });

  factory GetPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetPreferencesResponse(
      managementAccountRateTypeSelections:
          (json['managementAccountRateTypeSelections'] as List?)
              ?.nonNulls
              .map((e) => RateType.fromString((e as String)))
              .toList(),
      memberAccountRateTypeSelections:
          (json['memberAccountRateTypeSelections'] as List?)
              ?.nonNulls
              .map((e) => RateType.fromString((e as String)))
              .toList(),
      standaloneAccountRateTypeSelections:
          (json['standaloneAccountRateTypeSelections'] as List?)
              ?.nonNulls
              .map((e) => RateType.fromString((e as String)))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managementAccountRateTypeSelections =
        this.managementAccountRateTypeSelections;
    final memberAccountRateTypeSelections =
        this.memberAccountRateTypeSelections;
    final standaloneAccountRateTypeSelections =
        this.standaloneAccountRateTypeSelections;
    return {
      if (managementAccountRateTypeSelections != null)
        'managementAccountRateTypeSelections':
            managementAccountRateTypeSelections.map((e) => e.value).toList(),
      if (memberAccountRateTypeSelections != null)
        'memberAccountRateTypeSelections':
            memberAccountRateTypeSelections.map((e) => e.value).toList(),
      if (standaloneAccountRateTypeSelections != null)
        'standaloneAccountRateTypeSelections':
            standaloneAccountRateTypeSelections.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The list of tags associated with the specified resource.
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
class UpdatePreferencesResponse {
  /// The updated preferred rate types for the management account.
  final List<RateType>? managementAccountRateTypeSelections;

  /// The updated preferred rate types for member accounts.
  final List<RateType>? memberAccountRateTypeSelections;

  /// The updated preferred rate types for a standalone account.
  final List<RateType>? standaloneAccountRateTypeSelections;

  UpdatePreferencesResponse({
    this.managementAccountRateTypeSelections,
    this.memberAccountRateTypeSelections,
    this.standaloneAccountRateTypeSelections,
  });

  factory UpdatePreferencesResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePreferencesResponse(
      managementAccountRateTypeSelections:
          (json['managementAccountRateTypeSelections'] as List?)
              ?.nonNulls
              .map((e) => RateType.fromString((e as String)))
              .toList(),
      memberAccountRateTypeSelections:
          (json['memberAccountRateTypeSelections'] as List?)
              ?.nonNulls
              .map((e) => RateType.fromString((e as String)))
              .toList(),
      standaloneAccountRateTypeSelections:
          (json['standaloneAccountRateTypeSelections'] as List?)
              ?.nonNulls
              .map((e) => RateType.fromString((e as String)))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managementAccountRateTypeSelections =
        this.managementAccountRateTypeSelections;
    final memberAccountRateTypeSelections =
        this.memberAccountRateTypeSelections;
    final standaloneAccountRateTypeSelections =
        this.standaloneAccountRateTypeSelections;
    return {
      if (managementAccountRateTypeSelections != null)
        'managementAccountRateTypeSelections':
            managementAccountRateTypeSelections.map((e) => e.value).toList(),
      if (memberAccountRateTypeSelections != null)
        'memberAccountRateTypeSelections':
            memberAccountRateTypeSelections.map((e) => e.value).toList(),
      if (standaloneAccountRateTypeSelections != null)
        'standaloneAccountRateTypeSelections':
            standaloneAccountRateTypeSelections.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class CreateBillEstimateResponse {
  /// The unique identifier of your newly created Bill estimate.
  final String id;

  /// The bill month start and end timestamp that was used to create the Bill
  /// estimate. This is set to the last complete anniversary bill month start and
  /// end timestamp.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// Timestamp of the effective date of the cost category used in the group
  /// sharing settings.
  final DateTime? costCategoryGroupSharingPreferenceEffectiveDate;

  /// Returns summary-level cost information once a Bill estimate is successfully
  /// generated. This summary includes: 1) the total cost difference, showing the
  /// pre-tax cost change for the consolidated billing family between the
  /// completed anniversary bill and the estimated bill, and 2) total cost
  /// differences per service, detailing the pre-tax cost of each service,
  /// comparing the completed anniversary bill to the estimated bill on a
  /// per-service basis.
  final BillEstimateCostSummary? costSummary;

  /// The timestamp of when the Bill estimate create process was started (not when
  /// it successfully completed or failed).
  final DateTime? createdAt;

  /// The timestamp of when the Bill estimate will expire. A Bill estimate becomes
  /// inaccessible after expiration.
  final DateTime? expiresAt;

  /// This attribute provides the reason if a Bill estimate result generation
  /// fails.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The name of your newly created Bill estimate.
  final String? name;

  /// The status of your newly created Bill estimate. Bill estimate creation can
  /// take anywhere between 8 to 12 hours. The status will allow you to identify
  /// when the Bill estimate is complete or has failed.
  final BillEstimateStatus? status;

  CreateBillEstimateResponse({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.costCategoryGroupSharingPreferenceEffectiveDate,
    this.costSummary,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory CreateBillEstimateResponse.fromJson(Map<String, dynamic> json) {
    return CreateBillEstimateResponse(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      costCategoryGroupSharingPreferenceEffectiveDate: timeStampFromJson(
          json['costCategoryGroupSharingPreferenceEffectiveDate']),
      costSummary: json['costSummary'] != null
          ? BillEstimateCostSummary.fromJson(
              json['costSummary'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillEstimateStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final costCategoryGroupSharingPreferenceEffectiveDate =
        this.costCategoryGroupSharingPreferenceEffectiveDate;
    final costSummary = this.costSummary;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (costCategoryGroupSharingPreferenceEffectiveDate != null)
        'costCategoryGroupSharingPreferenceEffectiveDate': unixTimestampToJson(
            costCategoryGroupSharingPreferenceEffectiveDate),
      if (costSummary != null) 'costSummary': costSummary,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class GetBillEstimateResponse {
  /// The unique identifier of the retrieved bill estimate.
  final String id;

  /// The time period covered by the bill estimate.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// Timestamp of the effective date of the cost category used in the group
  /// sharing settings.
  final DateTime? costCategoryGroupSharingPreferenceEffectiveDate;

  /// A summary of the estimated costs.
  final BillEstimateCostSummary? costSummary;

  /// The timestamp when the bill estimate was created.
  final DateTime? createdAt;

  /// The timestamp when the bill estimate will expire.
  final DateTime? expiresAt;

  /// An error message if the bill estimate retrieval failed.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The name of the retrieved bill estimate.
  final String? name;

  /// The current status of the bill estimate.
  final BillEstimateStatus? status;

  GetBillEstimateResponse({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.costCategoryGroupSharingPreferenceEffectiveDate,
    this.costSummary,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory GetBillEstimateResponse.fromJson(Map<String, dynamic> json) {
    return GetBillEstimateResponse(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      costCategoryGroupSharingPreferenceEffectiveDate: timeStampFromJson(
          json['costCategoryGroupSharingPreferenceEffectiveDate']),
      costSummary: json['costSummary'] != null
          ? BillEstimateCostSummary.fromJson(
              json['costSummary'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillEstimateStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final costCategoryGroupSharingPreferenceEffectiveDate =
        this.costCategoryGroupSharingPreferenceEffectiveDate;
    final costSummary = this.costSummary;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (costCategoryGroupSharingPreferenceEffectiveDate != null)
        'costCategoryGroupSharingPreferenceEffectiveDate': unixTimestampToJson(
            costCategoryGroupSharingPreferenceEffectiveDate),
      if (costSummary != null) 'costSummary': costSummary,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class UpdateBillEstimateResponse {
  /// The unique identifier of the updated bill estimate.
  final String id;

  /// The time period covered by the updated bill estimate.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// Timestamp of the effective date of the cost category used in the group
  /// sharing settings.
  final DateTime? costCategoryGroupSharingPreferenceEffectiveDate;

  /// A summary of the updated estimated costs.
  final BillEstimateCostSummary? costSummary;

  /// The timestamp when the bill estimate was originally created.
  final DateTime? createdAt;

  /// The updated expiration timestamp for the bill estimate.
  final DateTime? expiresAt;

  /// An error message if the bill estimate update failed.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The updated name of the bill estimate.
  final String? name;

  /// The current status of the updated bill estimate.
  final BillEstimateStatus? status;

  UpdateBillEstimateResponse({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.costCategoryGroupSharingPreferenceEffectiveDate,
    this.costSummary,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory UpdateBillEstimateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBillEstimateResponse(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      costCategoryGroupSharingPreferenceEffectiveDate: timeStampFromJson(
          json['costCategoryGroupSharingPreferenceEffectiveDate']),
      costSummary: json['costSummary'] != null
          ? BillEstimateCostSummary.fromJson(
              json['costSummary'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillEstimateStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final costCategoryGroupSharingPreferenceEffectiveDate =
        this.costCategoryGroupSharingPreferenceEffectiveDate;
    final costSummary = this.costSummary;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (costCategoryGroupSharingPreferenceEffectiveDate != null)
        'costCategoryGroupSharingPreferenceEffectiveDate': unixTimestampToJson(
            costCategoryGroupSharingPreferenceEffectiveDate),
      if (costSummary != null) 'costSummary': costSummary,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class DeleteBillEstimateResponse {
  DeleteBillEstimateResponse();

  factory DeleteBillEstimateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBillEstimateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListBillEstimatesResponse {
  /// The list of bill estimates for the account.
  final List<BillEstimateSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillEstimatesResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillEstimatesResponse.fromJson(Map<String, dynamic> json) {
    return ListBillEstimatesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillEstimateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListBillEstimateCommitmentsResponse {
  /// The list of commitments associated with the bill estimate.
  final List<BillEstimateCommitmentSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillEstimateCommitmentsResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillEstimateCommitmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBillEstimateCommitmentsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              BillEstimateCommitmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListBillEstimateInputCommitmentModificationsResponse {
  /// The list of input commitment modifications associated with the bill
  /// estimate.
  final List<BillEstimateInputCommitmentModificationSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillEstimateInputCommitmentModificationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillEstimateInputCommitmentModificationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBillEstimateInputCommitmentModificationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillEstimateInputCommitmentModificationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListBillEstimateInputUsageModificationsResponse {
  /// The list of input usage modifications associated with the bill estimate.
  final List<BillEstimateInputUsageModificationSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillEstimateInputUsageModificationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillEstimateInputUsageModificationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBillEstimateInputUsageModificationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillEstimateInputUsageModificationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListBillEstimateLineItemsResponse {
  /// The list of line items associated with the bill estimate.
  final List<BillEstimateLineItemSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillEstimateLineItemsResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillEstimateLineItemsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBillEstimateLineItemsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              BillEstimateLineItemSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateBillScenarioResponse {
  /// The unique identifier for the created bill scenario.
  final String id;

  /// The time period covered by the bill scenario.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// The timestamp when the bill scenario was created.
  final DateTime? createdAt;

  /// The timestamp when the bill scenario will expire.
  final DateTime? expiresAt;

  /// An error message if the bill scenario creation failed.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The name of the created bill scenario.
  final String? name;

  /// The current status of the bill scenario.
  final BillScenarioStatus? status;

  CreateBillScenarioResponse({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory CreateBillScenarioResponse.fromJson(Map<String, dynamic> json) {
    return CreateBillScenarioResponse(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillScenarioStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class GetBillScenarioResponse {
  /// The unique identifier of the retrieved bill scenario.
  final String id;

  /// The time period covered by the bill scenario.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// The timestamp when the bill scenario was created.
  final DateTime? createdAt;

  /// The timestamp when the bill scenario will expire.
  final DateTime? expiresAt;

  /// An error message if the bill scenario retrieval failed.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The name of the retrieved bill scenario.
  final String? name;

  /// The current status of the bill scenario.
  final BillScenarioStatus? status;

  GetBillScenarioResponse({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory GetBillScenarioResponse.fromJson(Map<String, dynamic> json) {
    return GetBillScenarioResponse(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillScenarioStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class UpdateBillScenarioResponse {
  /// The unique identifier of the updated bill scenario.
  final String id;

  /// The time period covered by the updated bill scenario.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// The timestamp when the bill scenario was originally created.
  final DateTime? createdAt;

  /// The updated expiration timestamp for the bill scenario.
  final DateTime? expiresAt;

  /// An error message if the bill scenario update failed.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The updated name of the bill scenario.
  final String? name;

  /// The current status of the updated bill scenario.
  final BillScenarioStatus? status;

  UpdateBillScenarioResponse({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory UpdateBillScenarioResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBillScenarioResponse(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillScenarioStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class DeleteBillScenarioResponse {
  DeleteBillScenarioResponse();

  factory DeleteBillScenarioResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBillScenarioResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListBillScenariosResponse {
  /// The list of bill scenarios for the account.
  final List<BillScenarioSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillScenariosResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillScenariosResponse.fromJson(Map<String, dynamic> json) {
    return ListBillScenariosResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillScenarioSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListBillScenarioCommitmentModificationsResponse {
  /// The list of commitment modifications associated with the bill scenario.
  final List<BillScenarioCommitmentModificationItem>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillScenarioCommitmentModificationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillScenarioCommitmentModificationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBillScenarioCommitmentModificationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillScenarioCommitmentModificationItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchCreateBillScenarioCommitmentModificationResponse {
  /// Returns the list of errors reason and the commitment item keys that cannot
  /// be created in the Bill Scenario.
  final List<BatchCreateBillScenarioCommitmentModificationError>? errors;

  /// Returns the list of successful commitment line items that were created for
  /// the Bill Scenario.
  final List<BatchCreateBillScenarioCommitmentModificationItem>? items;

  BatchCreateBillScenarioCommitmentModificationResponse({
    this.errors,
    this.items,
  });

  factory BatchCreateBillScenarioCommitmentModificationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillScenarioCommitmentModificationResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchCreateBillScenarioCommitmentModificationError.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchCreateBillScenarioCommitmentModificationItem.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

/// @nodoc
class BatchDeleteBillScenarioCommitmentModificationResponse {
  /// Returns the list of errors reason and the commitment item keys that cannot
  /// be deleted from the Bill Scenario.
  final List<BatchDeleteBillScenarioCommitmentModificationError>? errors;

  BatchDeleteBillScenarioCommitmentModificationResponse({
    this.errors,
  });

  factory BatchDeleteBillScenarioCommitmentModificationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteBillScenarioCommitmentModificationResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchDeleteBillScenarioCommitmentModificationError.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// @nodoc
class BatchUpdateBillScenarioCommitmentModificationResponse {
  /// Returns the list of error reasons and commitment line item IDs that could
  /// not be updated for the Bill Scenario.
  final List<BatchUpdateBillScenarioCommitmentModificationError>? errors;

  /// Returns the list of successful commitment line items that were updated for a
  /// Bill Scenario.
  final List<BillScenarioCommitmentModificationItem>? items;

  BatchUpdateBillScenarioCommitmentModificationResponse({
    this.errors,
    this.items,
  });

  factory BatchUpdateBillScenarioCommitmentModificationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateBillScenarioCommitmentModificationResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUpdateBillScenarioCommitmentModificationError.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillScenarioCommitmentModificationItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

/// @nodoc
class ListBillScenarioUsageModificationsResponse {
  /// The list of usage modifications associated with the bill scenario.
  final List<BillScenarioUsageModificationItem>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListBillScenarioUsageModificationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListBillScenarioUsageModificationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBillScenarioUsageModificationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillScenarioUsageModificationItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchCreateBillScenarioUsageModificationResponse {
  /// Returns the list of errors reason and the usage item keys that cannot be
  /// created in the Bill Scenario.
  final List<BatchCreateBillScenarioUsageModificationError>? errors;

  /// Returns the list of successful usage line items that were created for the
  /// Bill Scenario.
  final List<BatchCreateBillScenarioUsageModificationItem>? items;

  BatchCreateBillScenarioUsageModificationResponse({
    this.errors,
    this.items,
  });

  factory BatchCreateBillScenarioUsageModificationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillScenarioUsageModificationResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchCreateBillScenarioUsageModificationError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BatchCreateBillScenarioUsageModificationItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

/// @nodoc
class BatchDeleteBillScenarioUsageModificationResponse {
  /// Returns the list of errors reason and the usage item keys that cannot be
  /// deleted from the Bill Scenario.
  final List<BatchDeleteBillScenarioUsageModificationError>? errors;

  BatchDeleteBillScenarioUsageModificationResponse({
    this.errors,
  });

  factory BatchDeleteBillScenarioUsageModificationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteBillScenarioUsageModificationResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchDeleteBillScenarioUsageModificationError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// @nodoc
class BatchUpdateBillScenarioUsageModificationResponse {
  /// Returns the list of error reasons and usage line item IDs that could not be
  /// updated for the Bill Scenario.
  final List<BatchUpdateBillScenarioUsageModificationError>? errors;

  /// Returns the list of successful usage line items that were updated for a Bill
  /// Scenario.
  final List<BillScenarioUsageModificationItem>? items;

  BatchUpdateBillScenarioUsageModificationResponse({
    this.errors,
    this.items,
  });

  factory BatchUpdateBillScenarioUsageModificationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateBillScenarioUsageModificationResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchUpdateBillScenarioUsageModificationError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BillScenarioUsageModificationItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

/// Mixin for common fields returned by CRUD APIs
///
/// @nodoc
class CreateWorkloadEstimateResponse {
  /// The unique identifier for the created workload estimate.
  final String id;

  /// The currency of the estimated cost.
  final CurrencyCode? costCurrency;

  /// The timestamp when the workload estimate was created.
  final DateTime? createdAt;

  /// The timestamp when the workload estimate will expire.
  final DateTime? expiresAt;

  /// An error message if the workload estimate creation failed.
  final String? failureMessage;

  /// The name of the created workload estimate.
  final String? name;

  /// The timestamp of the pricing rates used for the estimate.
  final DateTime? rateTimestamp;

  /// The type of pricing rates used for the estimate.
  final WorkloadEstimateRateType? rateType;

  /// The current status of the workload estimate.
  final WorkloadEstimateStatus? status;

  /// The total estimated cost for the workload.
  final double? totalCost;

  CreateWorkloadEstimateResponse({
    required this.id,
    this.costCurrency,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.name,
    this.rateTimestamp,
    this.rateType,
    this.status,
    this.totalCost,
  });

  factory CreateWorkloadEstimateResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkloadEstimateResponse(
      id: (json['id'] as String?) ?? '',
      costCurrency:
          (json['costCurrency'] as String?)?.let(CurrencyCode.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      name: json['name'] as String?,
      rateTimestamp: timeStampFromJson(json['rateTimestamp']),
      rateType: (json['rateType'] as String?)
          ?.let(WorkloadEstimateRateType.fromString),
      status:
          (json['status'] as String?)?.let(WorkloadEstimateStatus.fromString),
      totalCost: _s.parseJsonDouble(json['totalCost']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final costCurrency = this.costCurrency;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final name = this.name;
    final rateTimestamp = this.rateTimestamp;
    final rateType = this.rateType;
    final status = this.status;
    final totalCost = this.totalCost;
    return {
      'id': id,
      if (costCurrency != null) 'costCurrency': costCurrency.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (name != null) 'name': name,
      if (rateTimestamp != null)
        'rateTimestamp': unixTimestampToJson(rateTimestamp),
      if (rateType != null) 'rateType': rateType.value,
      if (status != null) 'status': status.value,
      if (totalCost != null) 'totalCost': _s.encodeJsonDouble(totalCost),
    };
  }
}

/// Mixin for common fields returned by CRUD APIs
///
/// @nodoc
class GetWorkloadEstimateResponse {
  /// The unique identifier of the retrieved workload estimate.
  final String id;

  /// The currency of the estimated cost.
  final CurrencyCode? costCurrency;

  /// The timestamp when the workload estimate was created.
  final DateTime? createdAt;

  /// The timestamp when the workload estimate will expire.
  final DateTime? expiresAt;

  /// An error message if the workload estimate retrieval failed.
  final String? failureMessage;

  /// The name of the retrieved workload estimate.
  final String? name;

  /// The timestamp of the pricing rates used for the estimate.
  final DateTime? rateTimestamp;

  /// The type of pricing rates used for the estimate.
  final WorkloadEstimateRateType? rateType;

  /// The current status of the workload estimate.
  final WorkloadEstimateStatus? status;

  /// The total estimated cost for the workload.
  final double? totalCost;

  GetWorkloadEstimateResponse({
    required this.id,
    this.costCurrency,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.name,
    this.rateTimestamp,
    this.rateType,
    this.status,
    this.totalCost,
  });

  factory GetWorkloadEstimateResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkloadEstimateResponse(
      id: (json['id'] as String?) ?? '',
      costCurrency:
          (json['costCurrency'] as String?)?.let(CurrencyCode.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      name: json['name'] as String?,
      rateTimestamp: timeStampFromJson(json['rateTimestamp']),
      rateType: (json['rateType'] as String?)
          ?.let(WorkloadEstimateRateType.fromString),
      status:
          (json['status'] as String?)?.let(WorkloadEstimateStatus.fromString),
      totalCost: _s.parseJsonDouble(json['totalCost']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final costCurrency = this.costCurrency;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final name = this.name;
    final rateTimestamp = this.rateTimestamp;
    final rateType = this.rateType;
    final status = this.status;
    final totalCost = this.totalCost;
    return {
      'id': id,
      if (costCurrency != null) 'costCurrency': costCurrency.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (name != null) 'name': name,
      if (rateTimestamp != null)
        'rateTimestamp': unixTimestampToJson(rateTimestamp),
      if (rateType != null) 'rateType': rateType.value,
      if (status != null) 'status': status.value,
      if (totalCost != null) 'totalCost': _s.encodeJsonDouble(totalCost),
    };
  }
}

/// Mixin for common fields returned by CRUD APIs
///
/// @nodoc
class UpdateWorkloadEstimateResponse {
  /// The unique identifier of the updated workload estimate.
  final String id;

  /// The currency of the updated estimated cost.
  final CurrencyCode? costCurrency;

  /// The timestamp when the workload estimate was originally created.
  final DateTime? createdAt;

  /// The updated expiration timestamp for the workload estimate.
  final DateTime? expiresAt;

  /// An error message if the workload estimate update failed.
  final String? failureMessage;

  /// The updated name of the workload estimate.
  final String? name;

  /// The timestamp of the pricing rates used for the updated estimate.
  final DateTime? rateTimestamp;

  /// The type of pricing rates used for the updated estimate.
  final WorkloadEstimateRateType? rateType;

  /// The current status of the updated workload estimate.
  final WorkloadEstimateStatus? status;

  /// The updated total estimated cost for the workload.
  final double? totalCost;

  UpdateWorkloadEstimateResponse({
    required this.id,
    this.costCurrency,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.name,
    this.rateTimestamp,
    this.rateType,
    this.status,
    this.totalCost,
  });

  factory UpdateWorkloadEstimateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkloadEstimateResponse(
      id: (json['id'] as String?) ?? '',
      costCurrency:
          (json['costCurrency'] as String?)?.let(CurrencyCode.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      name: json['name'] as String?,
      rateTimestamp: timeStampFromJson(json['rateTimestamp']),
      rateType: (json['rateType'] as String?)
          ?.let(WorkloadEstimateRateType.fromString),
      status:
          (json['status'] as String?)?.let(WorkloadEstimateStatus.fromString),
      totalCost: _s.parseJsonDouble(json['totalCost']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final costCurrency = this.costCurrency;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final name = this.name;
    final rateTimestamp = this.rateTimestamp;
    final rateType = this.rateType;
    final status = this.status;
    final totalCost = this.totalCost;
    return {
      'id': id,
      if (costCurrency != null) 'costCurrency': costCurrency.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (name != null) 'name': name,
      if (rateTimestamp != null)
        'rateTimestamp': unixTimestampToJson(rateTimestamp),
      if (rateType != null) 'rateType': rateType.value,
      if (status != null) 'status': status.value,
      if (totalCost != null) 'totalCost': _s.encodeJsonDouble(totalCost),
    };
  }
}

/// @nodoc
class DeleteWorkloadEstimateResponse {
  DeleteWorkloadEstimateResponse();

  factory DeleteWorkloadEstimateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkloadEstimateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListWorkloadEstimatesResponse {
  /// The list of workload estimates for the account.
  final List<WorkloadEstimateSummary>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListWorkloadEstimatesResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkloadEstimatesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkloadEstimatesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              WorkloadEstimateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListWorkloadEstimateUsageResponse {
  /// The list of usage items associated with the workload estimate.
  final List<WorkloadEstimateUsageItem>? items;

  /// A token to retrieve the next page of results, if any.
  final String? nextToken;

  ListWorkloadEstimateUsageResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkloadEstimateUsageResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWorkloadEstimateUsageResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              WorkloadEstimateUsageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchCreateWorkloadEstimateUsageResponse {
  /// Returns the list of errors reason and the usage item keys that cannot be
  /// created in the Workload estimate.
  final List<BatchCreateWorkloadEstimateUsageError>? errors;

  /// Returns the list of successful usage line items that were created for the
  /// Workload estimate.
  final List<BatchCreateWorkloadEstimateUsageItem>? items;

  BatchCreateWorkloadEstimateUsageResponse({
    this.errors,
    this.items,
  });

  factory BatchCreateWorkloadEstimateUsageResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateWorkloadEstimateUsageResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchCreateWorkloadEstimateUsageError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => BatchCreateWorkloadEstimateUsageItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

/// @nodoc
class BatchDeleteWorkloadEstimateUsageResponse {
  /// Returns the list of errors reason and the usage item keys that cannot be
  /// deleted from the Workload estimate.
  final List<BatchDeleteWorkloadEstimateUsageError>? errors;

  BatchDeleteWorkloadEstimateUsageResponse({
    this.errors,
  });

  factory BatchDeleteWorkloadEstimateUsageResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteWorkloadEstimateUsageResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchDeleteWorkloadEstimateUsageError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// @nodoc
class BatchUpdateWorkloadEstimateUsageResponse {
  /// Returns the list of error reasons and usage line item IDs that could not be
  /// updated for the Workload estimate.
  final List<BatchUpdateWorkloadEstimateUsageError>? errors;

  /// Returns the list of successful usage line items that were updated for a
  /// Workload estimate.
  final List<WorkloadEstimateUsageItem>? items;

  BatchUpdateWorkloadEstimateUsageResponse({
    this.errors,
    this.items,
  });

  factory BatchUpdateWorkloadEstimateUsageResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateWorkloadEstimateUsageResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchUpdateWorkloadEstimateUsageError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              WorkloadEstimateUsageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      if (errors != null) 'errors': errors,
      if (items != null) 'items': items,
    };
  }
}

/// Represents an error that occurred when updating usage in a workload
/// estimate.
///
/// @nodoc
class BatchUpdateWorkloadEstimateUsageError {
  /// The code associated with the error.
  final WorkloadEstimateUpdateUsageErrorCode? errorCode;

  /// The message that describes the error.
  final String? errorMessage;

  /// The ID of the error.
  final String? id;

  BatchUpdateWorkloadEstimateUsageError({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchUpdateWorkloadEstimateUsageError.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateWorkloadEstimateUsageError(
      errorCode: (json['errorCode'] as String?)
          ?.let(WorkloadEstimateUpdateUsageErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// @nodoc
class WorkloadEstimateUpdateUsageErrorCode {
  static const badRequest =
      WorkloadEstimateUpdateUsageErrorCode._('BAD_REQUEST');
  static const notFound = WorkloadEstimateUpdateUsageErrorCode._('NOT_FOUND');
  static const conflict = WorkloadEstimateUpdateUsageErrorCode._('CONFLICT');
  static const internalServerError =
      WorkloadEstimateUpdateUsageErrorCode._('INTERNAL_SERVER_ERROR');

  final String value;

  const WorkloadEstimateUpdateUsageErrorCode._(this.value);

  static const values = [badRequest, notFound, conflict, internalServerError];

  static WorkloadEstimateUpdateUsageErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadEstimateUpdateUsageErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is WorkloadEstimateUpdateUsageErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a usage item in a workload estimate.
///
/// @nodoc
class WorkloadEstimateUsageItem {
  /// The specific operation associated with this usage item.
  final String operation;

  /// The Amazon Web Services service code associated with this usage item.
  final String serviceCode;

  /// The type of usage for this item.
  final String usageType;

  /// The estimated cost for this usage item.
  final double? cost;

  /// The currency of the estimated cost.
  final CurrencyCode? currency;

  /// The group identifier for this usage item.
  final String? group;

  /// Historical usage data associated with this item, if available.
  final HistoricalUsageEntity? historicalUsage;

  /// The unique identifier of this usage item.
  final String? id;

  /// The location associated with this usage item.
  final String? location;

  /// The estimated usage quantity for this item.
  final WorkloadEstimateUsageQuantity? quantity;

  /// The current status of this usage item.
  final WorkloadEstimateCostStatus? status;

  /// The Amazon Web Services account ID associated with this usage item.
  final String? usageAccountId;

  WorkloadEstimateUsageItem({
    required this.operation,
    required this.serviceCode,
    required this.usageType,
    this.cost,
    this.currency,
    this.group,
    this.historicalUsage,
    this.id,
    this.location,
    this.quantity,
    this.status,
    this.usageAccountId,
  });

  factory WorkloadEstimateUsageItem.fromJson(Map<String, dynamic> json) {
    return WorkloadEstimateUsageItem(
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      cost: _s.parseJsonDouble(json['cost']),
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
      group: json['group'] as String?,
      historicalUsage: json['historicalUsage'] != null
          ? HistoricalUsageEntity.fromJson(
              json['historicalUsage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      location: json['location'] as String?,
      quantity: json['quantity'] != null
          ? WorkloadEstimateUsageQuantity.fromJson(
              json['quantity'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(WorkloadEstimateCostStatus.fromString),
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    final cost = this.cost;
    final currency = this.currency;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    final id = this.id;
    final location = this.location;
    final quantity = this.quantity;
    final status = this.status;
    final usageAccountId = this.usageAccountId;
    return {
      'operation': operation,
      'serviceCode': serviceCode,
      'usageType': usageType,
      if (cost != null) 'cost': _s.encodeJsonDouble(cost),
      if (currency != null) 'currency': currency.value,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (quantity != null) 'quantity': quantity,
      if (status != null) 'status': status.value,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents a usage quantity for a workload estimate.
///
/// @nodoc
class WorkloadEstimateUsageQuantity {
  /// The numeric value of the usage quantity.
  final double? amount;

  /// The unit of measurement for the usage quantity.
  final String? unit;

  WorkloadEstimateUsageQuantity({
    this.amount,
    this.unit,
  });

  factory WorkloadEstimateUsageQuantity.fromJson(Map<String, dynamic> json) {
    return WorkloadEstimateUsageQuantity(
      amount: _s.parseJsonDouble(json['amount']),
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final unit = this.unit;
    return {
      if (amount != null) 'amount': _s.encodeJsonDouble(amount),
      if (unit != null) 'unit': unit,
    };
  }
}

/// @nodoc
class CurrencyCode {
  static const usd = CurrencyCode._('USD');

  final String value;

  const CurrencyCode._(this.value);

  static const values = [usd];

  static CurrencyCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CurrencyCode._(value));

  @override
  bool operator ==(other) => other is CurrencyCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class WorkloadEstimateCostStatus {
  static const valid = WorkloadEstimateCostStatus._('VALID');
  static const invalid = WorkloadEstimateCostStatus._('INVALID');
  static const stale = WorkloadEstimateCostStatus._('STALE');

  final String value;

  const WorkloadEstimateCostStatus._(this.value);

  static const values = [valid, invalid, stale];

  static WorkloadEstimateCostStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadEstimateCostStatus._(value));

  @override
  bool operator ==(other) =>
      other is WorkloadEstimateCostStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents historical usage data for a specific entity.
///
/// @nodoc
class HistoricalUsageEntity {
  /// The time interval for the historical usage data.
  final BillInterval billInterval;

  /// An optional filter expression to apply to the historical usage data.
  final Expression filterExpression;

  /// The specific operation associated with the usage.
  final String operation;

  /// The Amazon Web Services service code associated with the usage.
  final String serviceCode;

  /// The Amazon Web Services account ID associated with the usage.
  final String usageAccountId;

  /// The type of usage.
  final String usageType;

  /// The location associated with the usage.
  final String? location;

  HistoricalUsageEntity({
    required this.billInterval,
    required this.filterExpression,
    required this.operation,
    required this.serviceCode,
    required this.usageAccountId,
    required this.usageType,
    this.location,
  });

  factory HistoricalUsageEntity.fromJson(Map<String, dynamic> json) {
    return HistoricalUsageEntity(
      billInterval: BillInterval.fromJson(
          (json['billInterval'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      filterExpression: Expression.fromJson(
          (json['filterExpression'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageAccountId: (json['usageAccountId'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      location: json['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billInterval = this.billInterval;
    final filterExpression = this.filterExpression;
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageAccountId = this.usageAccountId;
    final usageType = this.usageType;
    final location = this.location;
    return {
      'billInterval': billInterval,
      'filterExpression': filterExpression,
      'operation': operation,
      'serviceCode': serviceCode,
      'usageAccountId': usageAccountId,
      'usageType': usageType,
      if (location != null) 'location': location,
    };
  }
}

/// Represents a time interval for a bill or estimate.
///
/// @nodoc
class BillInterval {
  /// The end date and time of the interval.
  final DateTime? end;

  /// The start date and time of the interval.
  final DateTime? start;

  BillInterval({
    this.end,
    this.start,
  });

  factory BillInterval.fromJson(Map<String, dynamic> json) {
    return BillInterval(
      end: timeStampFromJson(json['end']),
      start: timeStampFromJson(json['start']),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'end': unixTimestampToJson(end),
      if (start != null) 'start': unixTimestampToJson(start),
    };
  }
}

/// Represents a complex filtering expression for cost and usage data.
///
/// @nodoc
class Expression {
  /// A list of expressions to be combined with AND logic.
  final List<Expression>? and;

  /// Filters based on cost categories.
  final ExpressionFilter? costCategories;

  /// Filters based on dimensions (e.g., service, operation).
  final ExpressionFilter? dimensions;

  /// An expression to be negated.
  final Expression? not;

  /// A list of expressions to be combined with OR logic.
  final List<Expression>? or;

  /// Filters based on resource tags.
  final ExpressionFilter? tags;

  Expression({
    this.and,
    this.costCategories,
    this.dimensions,
    this.not,
    this.or,
    this.tags,
  });

  factory Expression.fromJson(Map<String, dynamic> json) {
    return Expression(
      and: (json['and'] as List?)
          ?.nonNulls
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      costCategories: json['costCategories'] != null
          ? ExpressionFilter.fromJson(
              json['costCategories'] as Map<String, dynamic>)
          : null,
      dimensions: json['dimensions'] != null
          ? ExpressionFilter.fromJson(
              json['dimensions'] as Map<String, dynamic>)
          : null,
      not: json['not'] != null
          ? Expression.fromJson(json['not'] as Map<String, dynamic>)
          : null,
      or: (json['or'] as List?)
          ?.nonNulls
          .map((e) => Expression.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: json['tags'] != null
          ? ExpressionFilter.fromJson(json['tags'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    final costCategories = this.costCategories;
    final dimensions = this.dimensions;
    final not = this.not;
    final or = this.or;
    final tags = this.tags;
    return {
      if (and != null) 'and': and,
      if (costCategories != null) 'costCategories': costCategories,
      if (dimensions != null) 'dimensions': dimensions,
      if (not != null) 'not': not,
      if (or != null) 'or': or,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents a filter used within an expression.
///
/// @nodoc
class ExpressionFilter {
  /// The key or attribute to filter on.
  final String? key;

  /// The match options for the filter (e.g., equals, contains).
  final List<String>? matchOptions;

  /// The values to match against.
  final List<String>? values;

  ExpressionFilter({
    this.key,
    this.matchOptions,
    this.values,
  });

  factory ExpressionFilter.fromJson(Map<String, dynamic> json) {
    return ExpressionFilter(
      key: json['key'] as String?,
      matchOptions: (json['matchOptions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      values:
          (json['values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      if (key != null) 'key': key,
      if (matchOptions != null) 'matchOptions': matchOptions,
      if (values != null) 'values': values,
    };
  }
}

/// Represents an entry in a batch operation to update workload estimate usage.
///
/// @nodoc
class BatchUpdateWorkloadEstimateUsageEntry {
  /// The unique identifier of the usage estimate to update.
  final String id;

  /// The updated estimated usage amount.
  final double? amount;

  /// The updated group identifier for the usage estimate.
  final String? group;

  BatchUpdateWorkloadEstimateUsageEntry({
    required this.id,
    this.amount,
    this.group,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final amount = this.amount;
    final group = this.group;
    return {
      'id': id,
      if (amount != null) 'amount': _s.encodeJsonDouble(amount),
      if (group != null) 'group': group,
    };
  }
}

/// Represents an error that occurred when deleting usage in a workload
/// estimate.
///
/// @nodoc
class BatchDeleteWorkloadEstimateUsageError {
  /// The code associated with the error.
  final WorkloadEstimateUpdateUsageErrorCode? errorCode;

  /// The message that describes the error.
  final String? errorMessage;

  /// The ID of the error.
  final String? id;

  BatchDeleteWorkloadEstimateUsageError({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchDeleteWorkloadEstimateUsageError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteWorkloadEstimateUsageError(
      errorCode: (json['errorCode'] as String?)
          ?.let(WorkloadEstimateUpdateUsageErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// Represents an error that occurred during a batch create operation for
/// workload estimate usage.
///
/// @nodoc
class BatchCreateWorkloadEstimateUsageError {
  /// The error code associated with the failed operation.
  final BatchCreateWorkloadEstimateUsageCode? errorCode;

  /// A descriptive message for the error that occurred.
  final String? errorMessage;

  /// The key of the entry that caused the error.
  final String? key;

  BatchCreateWorkloadEstimateUsageError({
    this.errorCode,
    this.errorMessage,
    this.key,
  });

  factory BatchCreateWorkloadEstimateUsageError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateWorkloadEstimateUsageError(
      errorCode: (json['errorCode'] as String?)
          ?.let(BatchCreateWorkloadEstimateUsageCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final key = this.key;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (key != null) 'key': key,
    };
  }
}

/// @nodoc
class BatchCreateWorkloadEstimateUsageCode {
  static const badRequest =
      BatchCreateWorkloadEstimateUsageCode._('BAD_REQUEST');
  static const notFound = BatchCreateWorkloadEstimateUsageCode._('NOT_FOUND');
  static const conflict = BatchCreateWorkloadEstimateUsageCode._('CONFLICT');
  static const internalServerError =
      BatchCreateWorkloadEstimateUsageCode._('INTERNAL_SERVER_ERROR');

  final String value;

  const BatchCreateWorkloadEstimateUsageCode._(this.value);

  static const values = [badRequest, notFound, conflict, internalServerError];

  static BatchCreateWorkloadEstimateUsageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchCreateWorkloadEstimateUsageCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchCreateWorkloadEstimateUsageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a successfully created item in a batch operation for workload
/// estimate usage.
///
/// @nodoc
class BatchCreateWorkloadEstimateUsageItem {
  /// The specific operation associated with this usage estimate.
  final String operation;

  /// The Amazon Web Services service code for this usage estimate.
  final String serviceCode;

  /// The type of usage that was estimated.
  final String usageType;

  /// The estimated cost associated with this usage.
  final double? cost;

  /// The currency of the estimated cost.
  final CurrencyCode? currency;

  /// The group identifier for the created usage estimate.
  final String? group;

  /// Historical usage data associated with this estimate, if available.
  final HistoricalUsageEntity? historicalUsage;

  /// The unique identifier assigned to the created usage estimate.
  final String? id;

  /// The key of the successfully created entry.
  final String? key;

  /// The location associated with this usage estimate.
  final String? location;

  /// The estimated usage quantity.
  final WorkloadEstimateUsageQuantity? quantity;

  /// The current status of the created usage estimate.
  final WorkloadEstimateCostStatus? status;

  /// The Amazon Web Services account ID associated with the created usage
  /// estimate.
  final String? usageAccountId;

  BatchCreateWorkloadEstimateUsageItem({
    required this.operation,
    required this.serviceCode,
    required this.usageType,
    this.cost,
    this.currency,
    this.group,
    this.historicalUsage,
    this.id,
    this.key,
    this.location,
    this.quantity,
    this.status,
    this.usageAccountId,
  });

  factory BatchCreateWorkloadEstimateUsageItem.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateWorkloadEstimateUsageItem(
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      cost: _s.parseJsonDouble(json['cost']),
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
      group: json['group'] as String?,
      historicalUsage: json['historicalUsage'] != null
          ? HistoricalUsageEntity.fromJson(
              json['historicalUsage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      key: json['key'] as String?,
      location: json['location'] as String?,
      quantity: json['quantity'] != null
          ? WorkloadEstimateUsageQuantity.fromJson(
              json['quantity'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(WorkloadEstimateCostStatus.fromString),
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    final cost = this.cost;
    final currency = this.currency;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    final id = this.id;
    final key = this.key;
    final location = this.location;
    final quantity = this.quantity;
    final status = this.status;
    final usageAccountId = this.usageAccountId;
    return {
      'operation': operation,
      'serviceCode': serviceCode,
      'usageType': usageType,
      if (cost != null) 'cost': _s.encodeJsonDouble(cost),
      if (currency != null) 'currency': currency.value,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (location != null) 'location': location,
      if (quantity != null) 'quantity': quantity,
      if (status != null) 'status': status.value,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents an entry in a batch operation to create workload estimate usage.
///
/// @nodoc
class BatchCreateWorkloadEstimateUsageEntry {
  /// The estimated usage amount.
  final double amount;

  /// A unique identifier for this entry in the batch operation.
  final String key;

  /// The specific operation associated with this usage estimate.
  final String operation;

  /// The Amazon Web Services service code for this usage estimate.
  final String serviceCode;

  /// The Amazon Web Services account ID associated with this usage estimate.
  final String usageAccountId;

  /// The type of usage being estimated.
  final String usageType;

  /// An optional group identifier for the usage estimate.
  final String? group;

  /// Historical usage data associated with this estimate, if available.
  final HistoricalUsageEntity? historicalUsage;

  BatchCreateWorkloadEstimateUsageEntry({
    required this.amount,
    required this.key,
    required this.operation,
    required this.serviceCode,
    required this.usageAccountId,
    required this.usageType,
    this.group,
    this.historicalUsage,
  });

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final key = this.key;
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageAccountId = this.usageAccountId;
    final usageType = this.usageType;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    return {
      'amount': _s.encodeJsonDouble(amount),
      'key': key,
      'operation': operation,
      'serviceCode': serviceCode,
      'usageAccountId': usageAccountId,
      'usageType': usageType,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
    };
  }
}

/// Represents a filter for listing usage data.
///
/// @nodoc
class ListUsageFilter {
  /// The name of the filter attribute.
  final ListUsageFilterName name;

  /// The values to filter by.
  final List<String> values;

  /// The match option for the filter (e.g., equals, contains).
  final MatchOption? matchOption;

  ListUsageFilter({
    required this.name,
    required this.values,
    this.matchOption,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final matchOption = this.matchOption;
    return {
      'name': name.value,
      'values': values,
      if (matchOption != null) 'matchOption': matchOption.value,
    };
  }
}

/// @nodoc
class ListUsageFilterName {
  static const usageAccountId = ListUsageFilterName._('USAGE_ACCOUNT_ID');
  static const serviceCode = ListUsageFilterName._('SERVICE_CODE');
  static const usageType = ListUsageFilterName._('USAGE_TYPE');
  static const operation = ListUsageFilterName._('OPERATION');
  static const location = ListUsageFilterName._('LOCATION');
  static const usageGroup = ListUsageFilterName._('USAGE_GROUP');
  static const historicalUsageAccountId =
      ListUsageFilterName._('HISTORICAL_USAGE_ACCOUNT_ID');
  static const historicalServiceCode =
      ListUsageFilterName._('HISTORICAL_SERVICE_CODE');
  static const historicalUsageType =
      ListUsageFilterName._('HISTORICAL_USAGE_TYPE');
  static const historicalOperation =
      ListUsageFilterName._('HISTORICAL_OPERATION');
  static const historicalLocation =
      ListUsageFilterName._('HISTORICAL_LOCATION');

  final String value;

  const ListUsageFilterName._(this.value);

  static const values = [
    usageAccountId,
    serviceCode,
    usageType,
    operation,
    location,
    usageGroup,
    historicalUsageAccountId,
    historicalServiceCode,
    historicalUsageType,
    historicalOperation,
    historicalLocation
  ];

  static ListUsageFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListUsageFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ListUsageFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MatchOption {
  static const equals = MatchOption._('EQUALS');
  static const startsWith = MatchOption._('STARTS_WITH');
  static const contains = MatchOption._('CONTAINS');

  final String value;

  const MatchOption._(this.value);

  static const values = [equals, startsWith, contains];

  static MatchOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MatchOption._(value));

  @override
  bool operator ==(other) => other is MatchOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of a workload estimate.
///
/// @nodoc
class WorkloadEstimateSummary {
  /// The unique identifier of the workload estimate.
  final String id;

  /// The currency of the estimated cost.
  final CurrencyCode? costCurrency;

  /// The timestamp when the workload estimate was created.
  final DateTime? createdAt;

  /// The timestamp when the workload estimate will expire.
  final DateTime? expiresAt;

  /// An error message if the workload estimate creation or processing failed.
  final String? failureMessage;

  /// The name of the workload estimate.
  final String? name;

  /// The timestamp of the pricing rates used for the estimate.
  final DateTime? rateTimestamp;

  /// The type of pricing rates used for the estimate.
  final WorkloadEstimateRateType? rateType;

  /// The current status of the workload estimate.
  final WorkloadEstimateStatus? status;

  /// The total estimated cost for the workload.
  final double? totalCost;

  WorkloadEstimateSummary({
    required this.id,
    this.costCurrency,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.name,
    this.rateTimestamp,
    this.rateType,
    this.status,
    this.totalCost,
  });

  factory WorkloadEstimateSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadEstimateSummary(
      id: (json['id'] as String?) ?? '',
      costCurrency:
          (json['costCurrency'] as String?)?.let(CurrencyCode.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      name: json['name'] as String?,
      rateTimestamp: timeStampFromJson(json['rateTimestamp']),
      rateType: (json['rateType'] as String?)
          ?.let(WorkloadEstimateRateType.fromString),
      status:
          (json['status'] as String?)?.let(WorkloadEstimateStatus.fromString),
      totalCost: _s.parseJsonDouble(json['totalCost']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final costCurrency = this.costCurrency;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final name = this.name;
    final rateTimestamp = this.rateTimestamp;
    final rateType = this.rateType;
    final status = this.status;
    final totalCost = this.totalCost;
    return {
      'id': id,
      if (costCurrency != null) 'costCurrency': costCurrency.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (name != null) 'name': name,
      if (rateTimestamp != null)
        'rateTimestamp': unixTimestampToJson(rateTimestamp),
      if (rateType != null) 'rateType': rateType.value,
      if (status != null) 'status': status.value,
      if (totalCost != null) 'totalCost': _s.encodeJsonDouble(totalCost),
    };
  }
}

/// @nodoc
class WorkloadEstimateRateType {
  static const beforeDiscounts = WorkloadEstimateRateType._('BEFORE_DISCOUNTS');
  static const afterDiscounts = WorkloadEstimateRateType._('AFTER_DISCOUNTS');
  static const afterDiscountsAndCommitments =
      WorkloadEstimateRateType._('AFTER_DISCOUNTS_AND_COMMITMENTS');

  final String value;

  const WorkloadEstimateRateType._(this.value);

  static const values = [
    beforeDiscounts,
    afterDiscounts,
    afterDiscountsAndCommitments
  ];

  static WorkloadEstimateRateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadEstimateRateType._(value));

  @override
  bool operator ==(other) =>
      other is WorkloadEstimateRateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class WorkloadEstimateStatus {
  static const updating = WorkloadEstimateStatus._('UPDATING');
  static const valid = WorkloadEstimateStatus._('VALID');
  static const invalid = WorkloadEstimateStatus._('INVALID');
  static const actionNeeded = WorkloadEstimateStatus._('ACTION_NEEDED');

  final String value;

  const WorkloadEstimateStatus._(this.value);

  static const values = [updating, valid, invalid, actionNeeded];

  static WorkloadEstimateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WorkloadEstimateStatus._(value));

  @override
  bool operator ==(other) =>
      other is WorkloadEstimateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a time-based filter.
///
/// @nodoc
class FilterTimestamp {
  /// Include results after this timestamp.
  final DateTime? afterTimestamp;

  /// Include results before this timestamp.
  final DateTime? beforeTimestamp;

  FilterTimestamp({
    this.afterTimestamp,
    this.beforeTimestamp,
  });

  Map<String, dynamic> toJson() {
    final afterTimestamp = this.afterTimestamp;
    final beforeTimestamp = this.beforeTimestamp;
    return {
      if (afterTimestamp != null)
        'afterTimestamp': unixTimestampToJson(afterTimestamp),
      if (beforeTimestamp != null)
        'beforeTimestamp': unixTimestampToJson(beforeTimestamp),
    };
  }
}

/// Represents a filter for listing workload estimates.
///
/// @nodoc
class ListWorkloadEstimatesFilter {
  /// The name of the filter attribute.
  final ListWorkloadEstimatesFilterName name;

  /// The values to filter by.
  final List<String> values;

  /// The match option for the filter (e.g., equals, contains).
  final MatchOption? matchOption;

  ListWorkloadEstimatesFilter({
    required this.name,
    required this.values,
    this.matchOption,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final matchOption = this.matchOption;
    return {
      'name': name.value,
      'values': values,
      if (matchOption != null) 'matchOption': matchOption.value,
    };
  }
}

/// @nodoc
class ListWorkloadEstimatesFilterName {
  static const status = ListWorkloadEstimatesFilterName._('STATUS');
  static const name = ListWorkloadEstimatesFilterName._('NAME');

  final String value;

  const ListWorkloadEstimatesFilterName._(this.value);

  static const values = [status, name];

  static ListWorkloadEstimatesFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListWorkloadEstimatesFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ListWorkloadEstimatesFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an error that occurred when updating usage in a Bill Scenario.
///
/// @nodoc
class BatchUpdateBillScenarioUsageModificationError {
  /// The code associated with the error.
  final BatchUpdateBillScenarioUsageModificationErrorCode? errorCode;

  /// The message that describes the error.
  final String? errorMessage;

  /// The ID of the error.
  final String? id;

  BatchUpdateBillScenarioUsageModificationError({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchUpdateBillScenarioUsageModificationError.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateBillScenarioUsageModificationError(
      errorCode: (json['errorCode'] as String?)
          ?.let(BatchUpdateBillScenarioUsageModificationErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// @nodoc
class BatchUpdateBillScenarioUsageModificationErrorCode {
  static const badRequest =
      BatchUpdateBillScenarioUsageModificationErrorCode._('BAD_REQUEST');
  static const notFound =
      BatchUpdateBillScenarioUsageModificationErrorCode._('NOT_FOUND');
  static const conflict =
      BatchUpdateBillScenarioUsageModificationErrorCode._('CONFLICT');
  static const internalServerError =
      BatchUpdateBillScenarioUsageModificationErrorCode._(
          'INTERNAL_SERVER_ERROR');

  final String value;

  const BatchUpdateBillScenarioUsageModificationErrorCode._(this.value);

  static const values = [badRequest, notFound, conflict, internalServerError];

  static BatchUpdateBillScenarioUsageModificationErrorCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              BatchUpdateBillScenarioUsageModificationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchUpdateBillScenarioUsageModificationErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a usage modification item in a bill scenario.
///
/// @nodoc
class BillScenarioUsageModificationItem {
  /// The specific operation associated with this usage modification.
  final String operation;

  /// The Amazon Web Services service code for this usage modification.
  final String serviceCode;

  /// The type of usage being modified.
  final String usageType;

  /// The availability zone associated with this usage modification, if
  /// applicable.
  final String? availabilityZone;

  /// The group identifier for the usage modification.
  final String? group;

  /// Historical usage data associated with this modification, if available.
  final HistoricalUsageEntity? historicalUsage;

  /// The unique identifier of the usage modification.
  final String? id;

  /// The location associated with this usage modification.
  final String? location;

  /// The modified usage quantities.
  final List<UsageQuantity>? quantities;

  /// The Amazon Web Services account ID associated with this usage modification.
  final String? usageAccountId;

  BillScenarioUsageModificationItem({
    required this.operation,
    required this.serviceCode,
    required this.usageType,
    this.availabilityZone,
    this.group,
    this.historicalUsage,
    this.id,
    this.location,
    this.quantities,
    this.usageAccountId,
  });

  factory BillScenarioUsageModificationItem.fromJson(
      Map<String, dynamic> json) {
    return BillScenarioUsageModificationItem(
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      availabilityZone: json['availabilityZone'] as String?,
      group: json['group'] as String?,
      historicalUsage: json['historicalUsage'] != null
          ? HistoricalUsageEntity.fromJson(
              json['historicalUsage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      location: json['location'] as String?,
      quantities: (json['quantities'] as List?)
          ?.nonNulls
          .map((e) => UsageQuantity.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    final availabilityZone = this.availabilityZone;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    final id = this.id;
    final location = this.location;
    final quantities = this.quantities;
    final usageAccountId = this.usageAccountId;
    return {
      'operation': operation,
      'serviceCode': serviceCode,
      'usageType': usageType,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (quantities != null) 'quantities': quantities,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents a usage quantity with associated unit and time period.
///
/// @nodoc
class UsageQuantity {
  /// The numeric value of the usage quantity.
  final double? amount;

  /// The start hour of the usage period.
  final DateTime? startHour;

  /// The unit of measurement for the usage quantity.
  final String? unit;

  UsageQuantity({
    this.amount,
    this.startHour,
    this.unit,
  });

  factory UsageQuantity.fromJson(Map<String, dynamic> json) {
    return UsageQuantity(
      amount: _s.parseJsonDouble(json['amount']),
      startHour: timeStampFromJson(json['startHour']),
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final startHour = this.startHour;
    final unit = this.unit;
    return {
      if (amount != null) 'amount': _s.encodeJsonDouble(amount),
      if (startHour != null) 'startHour': unixTimestampToJson(startHour),
      if (unit != null) 'unit': unit,
    };
  }
}

/// Represents an entry in a batch operation to update bill scenario usage
/// modifications.
///
/// @nodoc
class BatchUpdateBillScenarioUsageModificationEntry {
  /// The unique identifier of the usage modification to update.
  final String id;

  /// The updated usage amounts for the modification.
  final List<UsageAmount>? amounts;

  /// The updated group identifier for the usage modification.
  final String? group;

  BatchUpdateBillScenarioUsageModificationEntry({
    required this.id,
    this.amounts,
    this.group,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final amounts = this.amounts;
    final group = this.group;
    return {
      'id': id,
      if (amounts != null) 'amounts': amounts,
      if (group != null) 'group': group,
    };
  }
}

/// Represents a usage amount for a specific time period.
///
/// @nodoc
class UsageAmount {
  /// The usage amount for the period.
  final double amount;

  /// The start hour of the usage period.
  final DateTime startHour;

  UsageAmount({
    required this.amount,
    required this.startHour,
  });

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final startHour = this.startHour;
    return {
      'amount': _s.encodeJsonDouble(amount),
      'startHour': unixTimestampToJson(startHour),
    };
  }
}

/// Represents an error that occurred when deleting usage in a Bill Scenario.
///
/// @nodoc
class BatchDeleteBillScenarioUsageModificationError {
  /// The code associated with the error.
  final BatchDeleteBillScenarioUsageModificationErrorCode? errorCode;

  /// The message that describes the error.
  final String? errorMessage;

  /// The ID of the error.
  final String? id;

  BatchDeleteBillScenarioUsageModificationError({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchDeleteBillScenarioUsageModificationError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteBillScenarioUsageModificationError(
      errorCode: (json['errorCode'] as String?)
          ?.let(BatchDeleteBillScenarioUsageModificationErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// @nodoc
class BatchDeleteBillScenarioUsageModificationErrorCode {
  static const badRequest =
      BatchDeleteBillScenarioUsageModificationErrorCode._('BAD_REQUEST');
  static const conflict =
      BatchDeleteBillScenarioUsageModificationErrorCode._('CONFLICT');
  static const internalServerError =
      BatchDeleteBillScenarioUsageModificationErrorCode._(
          'INTERNAL_SERVER_ERROR');

  final String value;

  const BatchDeleteBillScenarioUsageModificationErrorCode._(this.value);

  static const values = [badRequest, conflict, internalServerError];

  static BatchDeleteBillScenarioUsageModificationErrorCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              BatchDeleteBillScenarioUsageModificationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchDeleteBillScenarioUsageModificationErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an error that occurred during a batch create operation for bill
/// scenario usage modifications.
///
/// @nodoc
class BatchCreateBillScenarioUsageModificationError {
  /// The error code associated with the failed operation.
  final BatchCreateBillScenarioUsageModificationErrorCode? errorCode;

  /// A descriptive message for the error that occurred.
  final String? errorMessage;

  /// The key of the entry that caused the error.
  final String? key;

  BatchCreateBillScenarioUsageModificationError({
    this.errorCode,
    this.errorMessage,
    this.key,
  });

  factory BatchCreateBillScenarioUsageModificationError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillScenarioUsageModificationError(
      errorCode: (json['errorCode'] as String?)
          ?.let(BatchCreateBillScenarioUsageModificationErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final key = this.key;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (key != null) 'key': key,
    };
  }
}

/// @nodoc
class BatchCreateBillScenarioUsageModificationErrorCode {
  static const badRequest =
      BatchCreateBillScenarioUsageModificationErrorCode._('BAD_REQUEST');
  static const notFound =
      BatchCreateBillScenarioUsageModificationErrorCode._('NOT_FOUND');
  static const conflict =
      BatchCreateBillScenarioUsageModificationErrorCode._('CONFLICT');
  static const internalServerError =
      BatchCreateBillScenarioUsageModificationErrorCode._(
          'INTERNAL_SERVER_ERROR');

  final String value;

  const BatchCreateBillScenarioUsageModificationErrorCode._(this.value);

  static const values = [badRequest, notFound, conflict, internalServerError];

  static BatchCreateBillScenarioUsageModificationErrorCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              BatchCreateBillScenarioUsageModificationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchCreateBillScenarioUsageModificationErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a successfully created item in a batch operation for bill
/// scenario usage modifications.
///
/// @nodoc
class BatchCreateBillScenarioUsageModificationItem {
  /// The specific operation associated with this usage modification.
  final String operation;

  /// The Amazon Web Services service code for this usage modification.
  final String serviceCode;

  /// The type of usage that was modified.
  final String usageType;

  /// The availability zone associated with this usage modification, if
  /// applicable.
  final String? availabilityZone;

  /// The group identifier for the created usage modification.
  final String? group;

  /// Historical usage data associated with this modification, if available.
  final HistoricalUsageEntity? historicalUsage;

  /// The unique identifier assigned to the created usage modification.
  final String? id;

  /// The key of the successfully created entry.
  final String? key;

  /// The location associated with this usage modification.
  final String? location;

  /// The modified usage quantities.
  final List<UsageQuantity>? quantities;

  /// The Amazon Web Services account ID associated with the created usage
  /// modification.
  final String? usageAccountId;

  BatchCreateBillScenarioUsageModificationItem({
    required this.operation,
    required this.serviceCode,
    required this.usageType,
    this.availabilityZone,
    this.group,
    this.historicalUsage,
    this.id,
    this.key,
    this.location,
    this.quantities,
    this.usageAccountId,
  });

  factory BatchCreateBillScenarioUsageModificationItem.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillScenarioUsageModificationItem(
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      availabilityZone: json['availabilityZone'] as String?,
      group: json['group'] as String?,
      historicalUsage: json['historicalUsage'] != null
          ? HistoricalUsageEntity.fromJson(
              json['historicalUsage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      key: json['key'] as String?,
      location: json['location'] as String?,
      quantities: (json['quantities'] as List?)
          ?.nonNulls
          .map((e) => UsageQuantity.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    final availabilityZone = this.availabilityZone;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    final id = this.id;
    final key = this.key;
    final location = this.location;
    final quantities = this.quantities;
    final usageAccountId = this.usageAccountId;
    return {
      'operation': operation,
      'serviceCode': serviceCode,
      'usageType': usageType,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (location != null) 'location': location,
      if (quantities != null) 'quantities': quantities,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents an entry in a batch operation to create bill scenario usage
/// modifications.
///
/// @nodoc
class BatchCreateBillScenarioUsageModificationEntry {
  /// A unique identifier for this entry in the batch operation. This can be any
  /// valid string. This key is useful to identify errors associated with any
  /// usage entry as any error is returned with this key.
  final String key;

  /// The specific operation associated with this usage modification. Describes
  /// the specific Amazon Web Services operation that this usage line models. For
  /// example, <code>RunInstances</code> indicates the operation of an Amazon EC2
  /// instance.
  final String operation;

  /// The Amazon Web Services service code for this usage modification. This
  /// identifies the specific Amazon Web Services service to the customer as a
  /// unique short abbreviation. For example, <code>AmazonEC2</code> and
  /// <code>AWSKMS</code>.
  final String serviceCode;

  /// The Amazon Web Services account ID to which this usage will be applied to.
  final String usageAccountId;

  /// Describes the usage details of the usage line item.
  final String usageType;

  /// The amount of usage you want to create for the service use you are modeling.
  final List<UsageAmount>? amounts;

  /// The Availability Zone that this usage line uses.
  final String? availabilityZone;

  /// An optional group identifier for the usage modification.
  final String? group;

  /// Historical usage data associated with this modification, if available.
  final HistoricalUsageEntity? historicalUsage;

  BatchCreateBillScenarioUsageModificationEntry({
    required this.key,
    required this.operation,
    required this.serviceCode,
    required this.usageAccountId,
    required this.usageType,
    this.amounts,
    this.availabilityZone,
    this.group,
    this.historicalUsage,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageAccountId = this.usageAccountId;
    final usageType = this.usageType;
    final amounts = this.amounts;
    final availabilityZone = this.availabilityZone;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    return {
      'key': key,
      'operation': operation,
      'serviceCode': serviceCode,
      'usageAccountId': usageAccountId,
      'usageType': usageType,
      if (amounts != null) 'amounts': amounts,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
    };
  }
}

/// Represents an error that occurred when updating a commitment in a Bill
/// Scenario.
///
/// @nodoc
class BatchUpdateBillScenarioCommitmentModificationError {
  /// The code associated with the error.
  final BatchUpdateBillScenarioCommitmentModificationErrorCode? errorCode;

  /// The message that describes the error.
  final String? errorMessage;

  /// The ID of the error.
  final String? id;

  BatchUpdateBillScenarioCommitmentModificationError({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchUpdateBillScenarioCommitmentModificationError.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateBillScenarioCommitmentModificationError(
      errorCode: (json['errorCode'] as String?)?.let(
          BatchUpdateBillScenarioCommitmentModificationErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// @nodoc
class BatchUpdateBillScenarioCommitmentModificationErrorCode {
  static const badRequest =
      BatchUpdateBillScenarioCommitmentModificationErrorCode._('BAD_REQUEST');
  static const notFound =
      BatchUpdateBillScenarioCommitmentModificationErrorCode._('NOT_FOUND');
  static const conflict =
      BatchUpdateBillScenarioCommitmentModificationErrorCode._('CONFLICT');
  static const internalServerError =
      BatchUpdateBillScenarioCommitmentModificationErrorCode._(
          'INTERNAL_SERVER_ERROR');

  final String value;

  const BatchUpdateBillScenarioCommitmentModificationErrorCode._(this.value);

  static const values = [badRequest, notFound, conflict, internalServerError];

  static BatchUpdateBillScenarioCommitmentModificationErrorCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              BatchUpdateBillScenarioCommitmentModificationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchUpdateBillScenarioCommitmentModificationErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a commitment modification item in a bill scenario.
///
/// @nodoc
class BillScenarioCommitmentModificationItem {
  /// The specific commitment action taken in this modification.
  final BillScenarioCommitmentModificationAction? commitmentAction;

  /// The group identifier for the commitment modification.
  final String? group;

  /// The unique identifier of the commitment modification.
  final String? id;

  /// The Amazon Web Services account ID associated with this commitment
  /// modification.
  final String? usageAccountId;

  BillScenarioCommitmentModificationItem({
    this.commitmentAction,
    this.group,
    this.id,
    this.usageAccountId,
  });

  factory BillScenarioCommitmentModificationItem.fromJson(
      Map<String, dynamic> json) {
    return BillScenarioCommitmentModificationItem(
      commitmentAction: json['commitmentAction'] != null
          ? BillScenarioCommitmentModificationAction.fromJson(
              json['commitmentAction'] as Map<String, dynamic>)
          : null,
      group: json['group'] as String?,
      id: json['id'] as String?,
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitmentAction = this.commitmentAction;
    final group = this.group;
    final id = this.id;
    final usageAccountId = this.usageAccountId;
    return {
      if (commitmentAction != null) 'commitmentAction': commitmentAction,
      if (group != null) 'group': group,
      if (id != null) 'id': id,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents an action to modify commitments in a bill scenario.
///
/// @nodoc
class BillScenarioCommitmentModificationAction {
  /// Action to add a Reserved Instance to the scenario.
  final AddReservedInstanceAction? addReservedInstanceAction;

  /// Action to add a Savings Plan to the scenario.
  final AddSavingsPlanAction? addSavingsPlanAction;

  /// Action to remove a Reserved Instance from the scenario.
  final NegateReservedInstanceAction? negateReservedInstanceAction;

  /// Action to remove a Savings Plan from the scenario.
  final NegateSavingsPlanAction? negateSavingsPlanAction;

  BillScenarioCommitmentModificationAction({
    this.addReservedInstanceAction,
    this.addSavingsPlanAction,
    this.negateReservedInstanceAction,
    this.negateSavingsPlanAction,
  });

  factory BillScenarioCommitmentModificationAction.fromJson(
      Map<String, dynamic> json) {
    return BillScenarioCommitmentModificationAction(
      addReservedInstanceAction: json['addReservedInstanceAction'] != null
          ? AddReservedInstanceAction.fromJson(
              json['addReservedInstanceAction'] as Map<String, dynamic>)
          : null,
      addSavingsPlanAction: json['addSavingsPlanAction'] != null
          ? AddSavingsPlanAction.fromJson(
              json['addSavingsPlanAction'] as Map<String, dynamic>)
          : null,
      negateReservedInstanceAction: json['negateReservedInstanceAction'] != null
          ? NegateReservedInstanceAction.fromJson(
              json['negateReservedInstanceAction'] as Map<String, dynamic>)
          : null,
      negateSavingsPlanAction: json['negateSavingsPlanAction'] != null
          ? NegateSavingsPlanAction.fromJson(
              json['negateSavingsPlanAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addReservedInstanceAction = this.addReservedInstanceAction;
    final addSavingsPlanAction = this.addSavingsPlanAction;
    final negateReservedInstanceAction = this.negateReservedInstanceAction;
    final negateSavingsPlanAction = this.negateSavingsPlanAction;
    return {
      if (addReservedInstanceAction != null)
        'addReservedInstanceAction': addReservedInstanceAction,
      if (addSavingsPlanAction != null)
        'addSavingsPlanAction': addSavingsPlanAction,
      if (negateReservedInstanceAction != null)
        'negateReservedInstanceAction': negateReservedInstanceAction,
      if (negateSavingsPlanAction != null)
        'negateSavingsPlanAction': negateSavingsPlanAction,
    };
  }
}

/// Represents an action to add a Reserved Instance to a bill scenario.
///
/// @nodoc
class AddReservedInstanceAction {
  /// The number of instances to add for this Reserved Instance offering.
  final int? instanceCount;

  /// The ID of the Reserved Instance offering to add. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeReservedInstancesOfferings.html">
  /// DescribeReservedInstancesOfferings</a>.
  final String? reservedInstancesOfferingId;

  AddReservedInstanceAction({
    this.instanceCount,
    this.reservedInstancesOfferingId,
  });

  factory AddReservedInstanceAction.fromJson(Map<String, dynamic> json) {
    return AddReservedInstanceAction(
      instanceCount: json['instanceCount'] as int?,
      reservedInstancesOfferingId:
          json['reservedInstancesOfferingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCount = this.instanceCount;
    final reservedInstancesOfferingId = this.reservedInstancesOfferingId;
    return {
      if (instanceCount != null) 'instanceCount': instanceCount,
      if (reservedInstancesOfferingId != null)
        'reservedInstancesOfferingId': reservedInstancesOfferingId,
    };
  }
}

/// Represents an action to add a Savings Plan to a bill scenario.
///
/// @nodoc
class AddSavingsPlanAction {
  /// The hourly commitment, in the same currency of the
  /// <code>savingsPlanOfferingId</code>. This is a value between 0.001 and 1
  /// million. You cannot specify more than five digits after the decimal point.
  final double? commitment;

  /// The ID of the Savings Plan offering to add. For more information, see <a
  /// href="https://docs.aws.amazon.com/savingsplans/latest/APIReference/API_DescribeSavingsPlansOfferings.html">
  /// DescribeSavingsPlansOfferings</a>.
  final String? savingsPlanOfferingId;

  AddSavingsPlanAction({
    this.commitment,
    this.savingsPlanOfferingId,
  });

  factory AddSavingsPlanAction.fromJson(Map<String, dynamic> json) {
    return AddSavingsPlanAction(
      commitment: _s.parseJsonDouble(json['commitment']),
      savingsPlanOfferingId: json['savingsPlanOfferingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitment = this.commitment;
    final savingsPlanOfferingId = this.savingsPlanOfferingId;
    return {
      if (commitment != null) 'commitment': _s.encodeJsonDouble(commitment),
      if (savingsPlanOfferingId != null)
        'savingsPlanOfferingId': savingsPlanOfferingId,
    };
  }
}

/// Represents an action to remove a Reserved Instance from a bill scenario.
///
/// This is the ID of an existing Reserved Instance in your account.
///
/// @nodoc
class NegateReservedInstanceAction {
  /// The ID of the Reserved Instance to remove.
  final String? reservedInstancesId;

  NegateReservedInstanceAction({
    this.reservedInstancesId,
  });

  factory NegateReservedInstanceAction.fromJson(Map<String, dynamic> json) {
    return NegateReservedInstanceAction(
      reservedInstancesId: json['reservedInstancesId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservedInstancesId = this.reservedInstancesId;
    return {
      if (reservedInstancesId != null)
        'reservedInstancesId': reservedInstancesId,
    };
  }
}

/// Represents an action to remove a Savings Plan from a bill scenario.
///
/// This is the ID of an existing Savings Plan in your account.
///
/// @nodoc
class NegateSavingsPlanAction {
  /// The ID of the Savings Plan to remove.
  final String? savingsPlanId;

  NegateSavingsPlanAction({
    this.savingsPlanId,
  });

  factory NegateSavingsPlanAction.fromJson(Map<String, dynamic> json) {
    return NegateSavingsPlanAction(
      savingsPlanId: json['savingsPlanId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final savingsPlanId = this.savingsPlanId;
    return {
      if (savingsPlanId != null) 'savingsPlanId': savingsPlanId,
    };
  }
}

/// Represents an entry in a batch operation to update bill scenario commitment
/// modifications.
///
/// @nodoc
class BatchUpdateBillScenarioCommitmentModificationEntry {
  /// The unique identifier of the commitment modification to update.
  final String id;

  /// The updated group identifier for the commitment modification.
  final String? group;

  BatchUpdateBillScenarioCommitmentModificationEntry({
    required this.id,
    this.group,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final group = this.group;
    return {
      'id': id,
      if (group != null) 'group': group,
    };
  }
}

/// Represents an error that occurred when deleting a commitment in a Bill
/// Scenario.
///
/// @nodoc
class BatchDeleteBillScenarioCommitmentModificationError {
  /// The code associated with the error.
  final BatchDeleteBillScenarioCommitmentModificationErrorCode? errorCode;

  /// The message that describes the error.
  final String? errorMessage;

  /// The ID of the error.
  final String? id;

  BatchDeleteBillScenarioCommitmentModificationError({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchDeleteBillScenarioCommitmentModificationError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteBillScenarioCommitmentModificationError(
      errorCode: (json['errorCode'] as String?)?.let(
          BatchDeleteBillScenarioCommitmentModificationErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (id != null) 'id': id,
    };
  }
}

/// @nodoc
class BatchDeleteBillScenarioCommitmentModificationErrorCode {
  static const badRequest =
      BatchDeleteBillScenarioCommitmentModificationErrorCode._('BAD_REQUEST');
  static const conflict =
      BatchDeleteBillScenarioCommitmentModificationErrorCode._('CONFLICT');
  static const internalServerError =
      BatchDeleteBillScenarioCommitmentModificationErrorCode._(
          'INTERNAL_SERVER_ERROR');

  final String value;

  const BatchDeleteBillScenarioCommitmentModificationErrorCode._(this.value);

  static const values = [badRequest, conflict, internalServerError];

  static BatchDeleteBillScenarioCommitmentModificationErrorCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              BatchDeleteBillScenarioCommitmentModificationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchDeleteBillScenarioCommitmentModificationErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an error that occurred during a batch create operation for bill
/// scenario commitment modifications.
///
/// @nodoc
class BatchCreateBillScenarioCommitmentModificationError {
  /// The error code associated with the failed operation.
  final BatchCreateBillScenarioCommitmentModificationErrorCode? errorCode;

  /// A descriptive message for the error that occurred.
  final String? errorMessage;

  /// The key of the entry that caused the error.
  final String? key;

  BatchCreateBillScenarioCommitmentModificationError({
    this.errorCode,
    this.errorMessage,
    this.key,
  });

  factory BatchCreateBillScenarioCommitmentModificationError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillScenarioCommitmentModificationError(
      errorCode: (json['errorCode'] as String?)?.let(
          BatchCreateBillScenarioCommitmentModificationErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final key = this.key;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (key != null) 'key': key,
    };
  }
}

/// @nodoc
class BatchCreateBillScenarioCommitmentModificationErrorCode {
  static const conflict =
      BatchCreateBillScenarioCommitmentModificationErrorCode._('CONFLICT');
  static const internalServerError =
      BatchCreateBillScenarioCommitmentModificationErrorCode._(
          'INTERNAL_SERVER_ERROR');
  static const invalidAccount =
      BatchCreateBillScenarioCommitmentModificationErrorCode._(
          'INVALID_ACCOUNT');

  final String value;

  const BatchCreateBillScenarioCommitmentModificationErrorCode._(this.value);

  static const values = [conflict, internalServerError, invalidAccount];

  static BatchCreateBillScenarioCommitmentModificationErrorCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              BatchCreateBillScenarioCommitmentModificationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchCreateBillScenarioCommitmentModificationErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a successfully created item in a batch operation for bill
/// scenario commitment modifications.
///
/// @nodoc
class BatchCreateBillScenarioCommitmentModificationItem {
  /// The specific commitment action that was taken.
  final BillScenarioCommitmentModificationAction? commitmentAction;

  /// The group identifier for the created commitment modification.
  final String? group;

  /// The unique identifier assigned to the created commitment modification.
  final String? id;

  /// The key of the successfully created entry. This can be any valid string.
  /// This key is useful to identify errors associated with any commitment entry
  /// as any error is returned with this key.
  final String? key;

  /// The Amazon Web Services account ID associated with the created commitment
  /// modification.
  final String? usageAccountId;

  BatchCreateBillScenarioCommitmentModificationItem({
    this.commitmentAction,
    this.group,
    this.id,
    this.key,
    this.usageAccountId,
  });

  factory BatchCreateBillScenarioCommitmentModificationItem.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillScenarioCommitmentModificationItem(
      commitmentAction: json['commitmentAction'] != null
          ? BillScenarioCommitmentModificationAction.fromJson(
              json['commitmentAction'] as Map<String, dynamic>)
          : null,
      group: json['group'] as String?,
      id: json['id'] as String?,
      key: json['key'] as String?,
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitmentAction = this.commitmentAction;
    final group = this.group;
    final id = this.id;
    final key = this.key;
    final usageAccountId = this.usageAccountId;
    return {
      if (commitmentAction != null) 'commitmentAction': commitmentAction,
      if (group != null) 'group': group,
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents an entry object in the batch operation to create bill scenario
/// commitment modifications.
///
/// @nodoc
class BatchCreateBillScenarioCommitmentModificationEntry {
  /// The specific commitment action to be taken (e.g., adding a Reserved Instance
  /// or Savings Plan).
  final BillScenarioCommitmentModificationAction commitmentAction;

  /// A unique identifier for this entry in the batch operation. This can be any
  /// valid string. This key is useful to identify errors associated with any
  /// commitment entry as any error is returned with this key.
  final String key;

  /// The Amazon Web Services account ID to which this commitment will be applied
  /// to.
  final String usageAccountId;

  /// An optional group identifier for the commitment modification.
  final String? group;

  BatchCreateBillScenarioCommitmentModificationEntry({
    required this.commitmentAction,
    required this.key,
    required this.usageAccountId,
    this.group,
  });

  Map<String, dynamic> toJson() {
    final commitmentAction = this.commitmentAction;
    final key = this.key;
    final usageAccountId = this.usageAccountId;
    final group = this.group;
    return {
      'commitmentAction': commitmentAction,
      'key': key,
      'usageAccountId': usageAccountId,
      if (group != null) 'group': group,
    };
  }
}

/// Provides a summary of a bill scenario.
///
/// @nodoc
class BillScenarioSummary {
  /// The unique identifier of the bill scenario.
  final String id;

  /// The time period covered by the bill scenario.
  final BillInterval? billInterval;

  /// The arn of the cost category used in the reserved and prioritized group
  /// sharing.
  final String? costCategoryGroupSharingPreferenceArn;

  /// The timestamp when the bill scenario was created.
  final DateTime? createdAt;

  /// The timestamp when the bill scenario will expire.
  final DateTime? expiresAt;

  /// An error message if the bill scenario creation or processing failed.
  final String? failureMessage;

  /// The setting for the reserved instance and savings plan group sharing used in
  /// this estimate.
  final GroupSharingPreferenceEnum? groupSharingPreference;

  /// The name of the bill scenario.
  final String? name;

  /// The current status of the bill scenario.
  final BillScenarioStatus? status;

  BillScenarioSummary({
    required this.id,
    this.billInterval,
    this.costCategoryGroupSharingPreferenceArn,
    this.createdAt,
    this.expiresAt,
    this.failureMessage,
    this.groupSharingPreference,
    this.name,
    this.status,
  });

  factory BillScenarioSummary.fromJson(Map<String, dynamic> json) {
    return BillScenarioSummary(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      costCategoryGroupSharingPreferenceArn:
          json['costCategoryGroupSharingPreferenceArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      failureMessage: json['failureMessage'] as String?,
      groupSharingPreference: (json['groupSharingPreference'] as String?)
          ?.let(GroupSharingPreferenceEnum.fromString),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillScenarioStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final costCategoryGroupSharingPreferenceArn =
        this.costCategoryGroupSharingPreferenceArn;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final failureMessage = this.failureMessage;
    final groupSharingPreference = this.groupSharingPreference;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (costCategoryGroupSharingPreferenceArn != null)
        'costCategoryGroupSharingPreferenceArn':
            costCategoryGroupSharingPreferenceArn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (groupSharingPreference != null)
        'groupSharingPreference': groupSharingPreference.value,
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class BillScenarioStatus {
  static const ready = BillScenarioStatus._('READY');
  static const locked = BillScenarioStatus._('LOCKED');
  static const failed = BillScenarioStatus._('FAILED');
  static const stale = BillScenarioStatus._('STALE');

  final String value;

  const BillScenarioStatus._(this.value);

  static const values = [ready, locked, failed, stale];

  static BillScenarioStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillScenarioStatus._(value));

  @override
  bool operator ==(other) =>
      other is BillScenarioStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GroupSharingPreferenceEnum {
  static const open = GroupSharingPreferenceEnum._('OPEN');
  static const prioritized = GroupSharingPreferenceEnum._('PRIORITIZED');
  static const restricted = GroupSharingPreferenceEnum._('RESTRICTED');

  final String value;

  const GroupSharingPreferenceEnum._(this.value);

  static const values = [open, prioritized, restricted];

  static GroupSharingPreferenceEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GroupSharingPreferenceEnum._(value));

  @override
  bool operator ==(other) =>
      other is GroupSharingPreferenceEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a filter for listing bill scenarios.
///
/// @nodoc
class ListBillScenariosFilter {
  /// The name of the filter attribute.
  final ListBillScenariosFilterName name;

  /// The values to filter by.
  final List<String> values;

  /// The match option for the filter (e.g., equals, contains).
  final MatchOption? matchOption;

  ListBillScenariosFilter({
    required this.name,
    required this.values,
    this.matchOption,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final matchOption = this.matchOption;
    return {
      'name': name.value,
      'values': values,
      if (matchOption != null) 'matchOption': matchOption.value,
    };
  }
}

/// @nodoc
class ListBillScenariosFilterName {
  static const status = ListBillScenariosFilterName._('STATUS');
  static const name = ListBillScenariosFilterName._('NAME');
  static const groupSharingPreference =
      ListBillScenariosFilterName._('GROUP_SHARING_PREFERENCE');
  static const costCategoryArn =
      ListBillScenariosFilterName._('COST_CATEGORY_ARN');

  final String value;

  const ListBillScenariosFilterName._(this.value);

  static const values = [status, name, groupSharingPreference, costCategoryArn];

  static ListBillScenariosFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListBillScenariosFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ListBillScenariosFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of a line item in a bill estimate.
///
/// @nodoc
class BillEstimateLineItemSummary {
  /// The specific operation associated with this line item.
  final String operation;

  /// The Amazon Web Services service code associated with this line item.
  final String serviceCode;

  /// The type of usage for this line item.
  final String usageType;

  /// The availability zone associated with this line item, if applicable.
  final String? availabilityZone;

  /// The estimated cost for this line item.
  final CostAmount? estimatedCost;

  /// The estimated usage quantity for this line item.
  final UsageQuantityResult? estimatedUsageQuantity;

  /// The historical cost for this line item.
  final CostAmount? historicalCost;

  /// The historical usage quantity for this line item.
  final UsageQuantityResult? historicalUsageQuantity;

  /// The unique identifier of this line item.
  final String? id;

  /// The line item identifier from the original bill.
  final String? lineItemId;

  /// The type of this line item (e.g., Usage, Tax, Credit).
  final String? lineItemType;

  /// The location associated with this line item.
  final String? location;

  /// The Amazon Web Services account ID of the payer for this line item.
  final String? payerAccountId;

  /// The Amazon Resource Names (ARNs) of any Savings Plans applied to this line
  /// item.
  final List<String>? savingsPlanArns;

  /// The Amazon Web Services account ID associated with the usage for this line
  /// item.
  final String? usageAccountId;

  BillEstimateLineItemSummary({
    required this.operation,
    required this.serviceCode,
    required this.usageType,
    this.availabilityZone,
    this.estimatedCost,
    this.estimatedUsageQuantity,
    this.historicalCost,
    this.historicalUsageQuantity,
    this.id,
    this.lineItemId,
    this.lineItemType,
    this.location,
    this.payerAccountId,
    this.savingsPlanArns,
    this.usageAccountId,
  });

  factory BillEstimateLineItemSummary.fromJson(Map<String, dynamic> json) {
    return BillEstimateLineItemSummary(
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      availabilityZone: json['availabilityZone'] as String?,
      estimatedCost: json['estimatedCost'] != null
          ? CostAmount.fromJson(json['estimatedCost'] as Map<String, dynamic>)
          : null,
      estimatedUsageQuantity: json['estimatedUsageQuantity'] != null
          ? UsageQuantityResult.fromJson(
              json['estimatedUsageQuantity'] as Map<String, dynamic>)
          : null,
      historicalCost: json['historicalCost'] != null
          ? CostAmount.fromJson(json['historicalCost'] as Map<String, dynamic>)
          : null,
      historicalUsageQuantity: json['historicalUsageQuantity'] != null
          ? UsageQuantityResult.fromJson(
              json['historicalUsageQuantity'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lineItemId: json['lineItemId'] as String?,
      lineItemType: json['lineItemType'] as String?,
      location: json['location'] as String?,
      payerAccountId: json['payerAccountId'] as String?,
      savingsPlanArns: (json['savingsPlanArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    final availabilityZone = this.availabilityZone;
    final estimatedCost = this.estimatedCost;
    final estimatedUsageQuantity = this.estimatedUsageQuantity;
    final historicalCost = this.historicalCost;
    final historicalUsageQuantity = this.historicalUsageQuantity;
    final id = this.id;
    final lineItemId = this.lineItemId;
    final lineItemType = this.lineItemType;
    final location = this.location;
    final payerAccountId = this.payerAccountId;
    final savingsPlanArns = this.savingsPlanArns;
    final usageAccountId = this.usageAccountId;
    return {
      'operation': operation,
      'serviceCode': serviceCode,
      'usageType': usageType,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (estimatedCost != null) 'estimatedCost': estimatedCost,
      if (estimatedUsageQuantity != null)
        'estimatedUsageQuantity': estimatedUsageQuantity,
      if (historicalCost != null) 'historicalCost': historicalCost,
      if (historicalUsageQuantity != null)
        'historicalUsageQuantity': historicalUsageQuantity,
      if (id != null) 'id': id,
      if (lineItemId != null) 'lineItemId': lineItemId,
      if (lineItemType != null) 'lineItemType': lineItemType,
      if (location != null) 'location': location,
      if (payerAccountId != null) 'payerAccountId': payerAccountId,
      if (savingsPlanArns != null) 'savingsPlanArns': savingsPlanArns,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Represents the result of a usage quantity calculation.
///
/// @nodoc
class UsageQuantityResult {
  /// The numeric value of the usage quantity result.
  final double? amount;

  /// The unit of measurement for the usage quantity result.
  final String? unit;

  UsageQuantityResult({
    this.amount,
    this.unit,
  });

  factory UsageQuantityResult.fromJson(Map<String, dynamic> json) {
    return UsageQuantityResult(
      amount: _s.parseJsonDouble(json['amount']),
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final unit = this.unit;
    return {
      if (amount != null) 'amount': _s.encodeJsonDouble(amount),
      if (unit != null) 'unit': unit,
    };
  }
}

/// Represents a monetary amount with associated currency.
///
/// @nodoc
class CostAmount {
  /// The numeric value of the cost.
  final double? amount;

  /// The currency code for the cost amount.
  final CurrencyCode? currency;

  CostAmount({
    this.amount,
    this.currency,
  });

  factory CostAmount.fromJson(Map<String, dynamic> json) {
    return CostAmount(
      amount: _s.parseJsonDouble(json['amount']),
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currency = this.currency;
    return {
      if (amount != null) 'amount': _s.encodeJsonDouble(amount),
      if (currency != null) 'currency': currency.value,
    };
  }
}

/// Represents a filter for listing bill estimate line items.
///
/// @nodoc
class ListBillEstimateLineItemsFilter {
  /// The name of the filter attribute.
  final ListBillEstimateLineItemsFilterName name;

  /// The values to filter by.
  final List<String> values;

  /// The match option for the filter (e.g., equals, contains).
  final MatchOption? matchOption;

  ListBillEstimateLineItemsFilter({
    required this.name,
    required this.values,
    this.matchOption,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final matchOption = this.matchOption;
    return {
      'name': name.value,
      'values': values,
      if (matchOption != null) 'matchOption': matchOption.value,
    };
  }
}

/// @nodoc
class ListBillEstimateLineItemsFilterName {
  static const usageAccountId =
      ListBillEstimateLineItemsFilterName._('USAGE_ACCOUNT_ID');
  static const serviceCode =
      ListBillEstimateLineItemsFilterName._('SERVICE_CODE');
  static const usageType = ListBillEstimateLineItemsFilterName._('USAGE_TYPE');
  static const operation = ListBillEstimateLineItemsFilterName._('OPERATION');
  static const location = ListBillEstimateLineItemsFilterName._('LOCATION');
  static const lineItemType =
      ListBillEstimateLineItemsFilterName._('LINE_ITEM_TYPE');

  final String value;

  const ListBillEstimateLineItemsFilterName._(this.value);

  static const values = [
    usageAccountId,
    serviceCode,
    usageType,
    operation,
    location,
    lineItemType
  ];

  static ListBillEstimateLineItemsFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListBillEstimateLineItemsFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ListBillEstimateLineItemsFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summarizes an input usage modification for a bill estimate.
///
/// @nodoc
class BillEstimateInputUsageModificationSummary {
  /// The specific operation associated with this usage modification.
  final String operation;

  /// The Amazon Web Services service code for this usage modification.
  final String serviceCode;

  /// The type of usage being modified.
  final String usageType;

  /// The availability zone associated with this usage modification, if
  /// applicable.
  final String? availabilityZone;

  /// The group identifier for the usage modification.
  final String? group;

  /// Historical usage data associated with this modification, if available.
  final HistoricalUsageEntity? historicalUsage;

  /// The unique identifier of the usage modification.
  final String? id;

  /// The location associated with this usage modification.
  final String? location;

  /// The modified usage quantities.
  final List<UsageQuantity>? quantities;

  /// The Amazon Web Services account ID associated with this usage modification.
  final String? usageAccountId;

  BillEstimateInputUsageModificationSummary({
    required this.operation,
    required this.serviceCode,
    required this.usageType,
    this.availabilityZone,
    this.group,
    this.historicalUsage,
    this.id,
    this.location,
    this.quantities,
    this.usageAccountId,
  });

  factory BillEstimateInputUsageModificationSummary.fromJson(
      Map<String, dynamic> json) {
    return BillEstimateInputUsageModificationSummary(
      operation: (json['operation'] as String?) ?? '',
      serviceCode: (json['serviceCode'] as String?) ?? '',
      usageType: (json['usageType'] as String?) ?? '',
      availabilityZone: json['availabilityZone'] as String?,
      group: json['group'] as String?,
      historicalUsage: json['historicalUsage'] != null
          ? HistoricalUsageEntity.fromJson(
              json['historicalUsage'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      location: json['location'] as String?,
      quantities: (json['quantities'] as List?)
          ?.nonNulls
          .map((e) => UsageQuantity.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    final availabilityZone = this.availabilityZone;
    final group = this.group;
    final historicalUsage = this.historicalUsage;
    final id = this.id;
    final location = this.location;
    final quantities = this.quantities;
    final usageAccountId = this.usageAccountId;
    return {
      'operation': operation,
      'serviceCode': serviceCode,
      'usageType': usageType,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (group != null) 'group': group,
      if (historicalUsage != null) 'historicalUsage': historicalUsage,
      if (id != null) 'id': id,
      if (location != null) 'location': location,
      if (quantities != null) 'quantities': quantities,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Summarizes an input commitment modification for a bill estimate.
///
/// @nodoc
class BillEstimateInputCommitmentModificationSummary {
  /// The specific commitment action taken in this modification.
  final BillScenarioCommitmentModificationAction? commitmentAction;

  /// The group identifier for the commitment modification.
  final String? group;

  /// The unique identifier of the commitment modification.
  final String? id;

  /// The Amazon Web Services account ID associated with this commitment
  /// modification.
  final String? usageAccountId;

  BillEstimateInputCommitmentModificationSummary({
    this.commitmentAction,
    this.group,
    this.id,
    this.usageAccountId,
  });

  factory BillEstimateInputCommitmentModificationSummary.fromJson(
      Map<String, dynamic> json) {
    return BillEstimateInputCommitmentModificationSummary(
      commitmentAction: json['commitmentAction'] != null
          ? BillScenarioCommitmentModificationAction.fromJson(
              json['commitmentAction'] as Map<String, dynamic>)
          : null,
      group: json['group'] as String?,
      id: json['id'] as String?,
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitmentAction = this.commitmentAction;
    final group = this.group;
    final id = this.id;
    final usageAccountId = this.usageAccountId;
    return {
      if (commitmentAction != null) 'commitmentAction': commitmentAction,
      if (group != null) 'group': group,
      if (id != null) 'id': id,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// Provides a summary of commitment-related information for a bill estimate.
///
/// @nodoc
class BillEstimateCommitmentSummary {
  /// The unique identifier of the commitment.
  final String? id;

  /// The monthly payment amount for this commitment, if applicable.
  final CostAmount? monthlyPayment;

  /// The identifier of the specific offering associated with this commitment.
  final String? offeringId;

  /// The payment option chosen for this commitment (e.g., All Upfront, Partial
  /// Upfront, No Upfront).
  final String? paymentOption;

  /// The type of purchase agreement (e.g., Reserved Instance, Savings Plan).
  final PurchaseAgreementType? purchaseAgreementType;

  /// The Amazon Web Services region associated with this commitment.
  final String? region;

  /// The length of the commitment term.
  final String? termLength;

  /// The upfront payment amount for this commitment, if applicable.
  final CostAmount? upfrontPayment;

  /// The Amazon Web Services account ID associated with this commitment.
  final String? usageAccountId;

  BillEstimateCommitmentSummary({
    this.id,
    this.monthlyPayment,
    this.offeringId,
    this.paymentOption,
    this.purchaseAgreementType,
    this.region,
    this.termLength,
    this.upfrontPayment,
    this.usageAccountId,
  });

  factory BillEstimateCommitmentSummary.fromJson(Map<String, dynamic> json) {
    return BillEstimateCommitmentSummary(
      id: json['id'] as String?,
      monthlyPayment: json['monthlyPayment'] != null
          ? CostAmount.fromJson(json['monthlyPayment'] as Map<String, dynamic>)
          : null,
      offeringId: json['offeringId'] as String?,
      paymentOption: json['paymentOption'] as String?,
      purchaseAgreementType: (json['purchaseAgreementType'] as String?)
          ?.let(PurchaseAgreementType.fromString),
      region: json['region'] as String?,
      termLength: json['termLength'] as String?,
      upfrontPayment: json['upfrontPayment'] != null
          ? CostAmount.fromJson(json['upfrontPayment'] as Map<String, dynamic>)
          : null,
      usageAccountId: json['usageAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final monthlyPayment = this.monthlyPayment;
    final offeringId = this.offeringId;
    final paymentOption = this.paymentOption;
    final purchaseAgreementType = this.purchaseAgreementType;
    final region = this.region;
    final termLength = this.termLength;
    final upfrontPayment = this.upfrontPayment;
    final usageAccountId = this.usageAccountId;
    return {
      if (id != null) 'id': id,
      if (monthlyPayment != null) 'monthlyPayment': monthlyPayment,
      if (offeringId != null) 'offeringId': offeringId,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (purchaseAgreementType != null)
        'purchaseAgreementType': purchaseAgreementType.value,
      if (region != null) 'region': region,
      if (termLength != null) 'termLength': termLength,
      if (upfrontPayment != null) 'upfrontPayment': upfrontPayment,
      if (usageAccountId != null) 'usageAccountId': usageAccountId,
    };
  }
}

/// @nodoc
class PurchaseAgreementType {
  static const savingsPlans = PurchaseAgreementType._('SAVINGS_PLANS');
  static const reservedInstance = PurchaseAgreementType._('RESERVED_INSTANCE');

  final String value;

  const PurchaseAgreementType._(this.value);

  static const values = [savingsPlans, reservedInstance];

  static PurchaseAgreementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PurchaseAgreementType._(value));

  @override
  bool operator ==(other) =>
      other is PurchaseAgreementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of a bill estimate.
///
/// @nodoc
class BillEstimateSummary {
  /// The unique identifier of the bill estimate.
  final String id;

  /// The time period covered by the bill estimate.
  final BillInterval? billInterval;

  /// The timestamp when the bill estimate was created.
  final DateTime? createdAt;

  /// The timestamp when the bill estimate will expire.
  final DateTime? expiresAt;

  /// The name of the bill estimate.
  final String? name;

  /// The current status of the bill estimate.
  final BillEstimateStatus? status;

  BillEstimateSummary({
    required this.id,
    this.billInterval,
    this.createdAt,
    this.expiresAt,
    this.name,
    this.status,
  });

  factory BillEstimateSummary.fromJson(Map<String, dynamic> json) {
    return BillEstimateSummary(
      id: (json['id'] as String?) ?? '',
      billInterval: json['billInterval'] != null
          ? BillInterval.fromJson(json['billInterval'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      expiresAt: timeStampFromJson(json['expiresAt']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(BillEstimateStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final billInterval = this.billInterval;
    final createdAt = this.createdAt;
    final expiresAt = this.expiresAt;
    final name = this.name;
    final status = this.status;
    return {
      'id': id,
      if (billInterval != null) 'billInterval': billInterval,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (name != null) 'name': name,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class BillEstimateStatus {
  static const inProgress = BillEstimateStatus._('IN_PROGRESS');
  static const complete = BillEstimateStatus._('COMPLETE');
  static const failed = BillEstimateStatus._('FAILED');

  final String value;

  const BillEstimateStatus._(this.value);

  static const values = [inProgress, complete, failed];

  static BillEstimateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillEstimateStatus._(value));

  @override
  bool operator ==(other) =>
      other is BillEstimateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a filter for listing bill estimates.
///
/// @nodoc
class ListBillEstimatesFilter {
  /// The name of the filter attribute.
  final ListBillEstimatesFilterName name;

  /// The values to filter by.
  final List<String> values;

  /// The match option for the filter (e.g., equals, contains).
  final MatchOption? matchOption;

  ListBillEstimatesFilter({
    required this.name,
    required this.values,
    this.matchOption,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final matchOption = this.matchOption;
    return {
      'name': name.value,
      'values': values,
      if (matchOption != null) 'matchOption': matchOption.value,
    };
  }
}

/// @nodoc
class ListBillEstimatesFilterName {
  static const status = ListBillEstimatesFilterName._('STATUS');
  static const name = ListBillEstimatesFilterName._('NAME');

  final String value;

  const ListBillEstimatesFilterName._(this.value);

  static const values = [status, name];

  static ListBillEstimatesFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListBillEstimatesFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ListBillEstimatesFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of cost-related information for a bill estimate.
///
/// @nodoc
class BillEstimateCostSummary {
  /// A breakdown of cost differences by Amazon Web Services service.
  final Map<String, CostDifference>? serviceCostDifferences;

  /// The total difference in cost between the estimated and historical costs.
  final CostDifference? totalCostDifference;

  BillEstimateCostSummary({
    this.serviceCostDifferences,
    this.totalCostDifference,
  });

  factory BillEstimateCostSummary.fromJson(Map<String, dynamic> json) {
    return BillEstimateCostSummary(
      serviceCostDifferences: (json['serviceCostDifferences']
              as Map<String, dynamic>?)
          ?.map((k, e) =>
              MapEntry(k, CostDifference.fromJson(e as Map<String, dynamic>))),
      totalCostDifference: json['totalCostDifference'] != null
          ? CostDifference.fromJson(
              json['totalCostDifference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceCostDifferences = this.serviceCostDifferences;
    final totalCostDifference = this.totalCostDifference;
    return {
      if (serviceCostDifferences != null)
        'serviceCostDifferences': serviceCostDifferences,
      if (totalCostDifference != null)
        'totalCostDifference': totalCostDifference,
    };
  }
}

/// Represents the difference between historical and estimated costs.
///
/// @nodoc
class CostDifference {
  /// The estimated cost amount.
  final CostAmount? estimatedCost;

  /// The historical cost amount.
  final CostAmount? historicalCost;

  CostDifference({
    this.estimatedCost,
    this.historicalCost,
  });

  factory CostDifference.fromJson(Map<String, dynamic> json) {
    return CostDifference(
      estimatedCost: json['estimatedCost'] != null
          ? CostAmount.fromJson(json['estimatedCost'] as Map<String, dynamic>)
          : null,
      historicalCost: json['historicalCost'] != null
          ? CostAmount.fromJson(json['historicalCost'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedCost = this.estimatedCost;
    final historicalCost = this.historicalCost;
    return {
      if (estimatedCost != null) 'estimatedCost': estimatedCost,
      if (historicalCost != null) 'historicalCost': historicalCost,
    };
  }
}

/// @nodoc
class RateType {
  static const beforeDiscounts = RateType._('BEFORE_DISCOUNTS');
  static const afterDiscounts = RateType._('AFTER_DISCOUNTS');
  static const afterDiscountsAndCommitments =
      RateType._('AFTER_DISCOUNTS_AND_COMMITMENTS');

  final String value;

  const RateType._(this.value);

  static const values = [
    beforeDiscounts,
    afterDiscounts,
    afterDiscountsAndCommitments
  ];

  static RateType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RateType._(value));

  @override
  bool operator ==(other) => other is RateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class DataUnavailableException extends _s.GenericAwsException {
  DataUnavailableException({String? type, String? message})
      : super(type: type, code: 'DataUnavailableException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DataUnavailableException': (type, message) =>
      DataUnavailableException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
};
