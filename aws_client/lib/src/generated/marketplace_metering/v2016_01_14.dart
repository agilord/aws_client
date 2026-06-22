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

import 'v2016_01_14.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// This reference provides descriptions of the low-level Marketplace Metering
/// Service API.
class MarketplaceMetering {
  final _s.JsonProtocol _protocol;
  factory MarketplaceMetering({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'metering.marketplace',
      signingName: 'aws-marketplace',
    );
    return MarketplaceMetering._(
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
  MarketplaceMetering._({
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

  /// <important>
  /// Amazon Web Services Marketplace is introducing Concurrent Agreements,
  /// enabling buyers to make multiple purchases per Amazon Web Services
  /// account. Starting June 1, 2026, new SaaS products must use
  /// <code>CustomerAWSAccountId</code> (instead of
  /// <code>CustomerIdentifier</code>), <code>LicenseArn</code> (instead of
  /// <code>ProductCode</code>) to support this feature. Existing integrations
  /// will continue to work. Review the new integration for Concurrent
  /// Agreements <a
  /// href="https://catalog.workshops.aws/mpseller/en-US/saas/integration-for-concurrent-agreements">here</a>.
  /// </important>
  /// To post metering records for customers, SaaS applications call
  /// <code>BatchMeterUsage</code>, which is used for metering SaaS flexible
  /// consumption pricing (FCP). Identical requests are idempotent and can be
  /// retried with the same records or a subset of records. Each
  /// <code>BatchMeterUsage</code> request is for only one product. If you want
  /// to meter usage for multiple products, you must make multiple
  /// <code>BatchMeterUsage</code> calls.
  ///
  /// Usage records should be submitted in quick succession following a recorded
  /// event. Usage records aren't accepted 6 hours or more after an event.
  ///
  /// <code>BatchMeterUsage</code> can process up to 25
  /// <code>UsageRecords</code> at a time, and each request must be less than 1
  /// MB in size. Optionally, you can have multiple usage allocations for usage
  /// data that's split into buckets according to predefined tags.
  ///
  /// <code>BatchMeterUsage</code> returns a list of
  /// <code>UsageRecordResult</code> objects, which have each
  /// <code>UsageRecord</code>. It also returns a list of
  /// <code>UnprocessedRecords</code>, which indicate errors on the service side
  /// that should be retried.
  ///
  /// For Amazon Web Services Regions that support <code>BatchMeterUsage</code>,
  /// see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#batchmeterusage-region-support">BatchMeterUsage
  /// Region support</a>.
  /// <note>
  /// For an example of <code>BatchMeterUsage</code>, see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/userguide/saas-code-examples.html#saas-batchmeterusage-example">
  /// BatchMeterUsage code example</a> in the <i>Amazon Web Services Marketplace
  /// Seller Guide</i>.
  /// </note>
  ///
  /// May throw [DisabledApiException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidCustomerIdentifierException].
  /// May throw [InvalidLicenseException].
  /// May throw [InvalidProductCodeException].
  /// May throw [InvalidTagException].
  /// May throw [InvalidUsageAllocationsException].
  /// May throw [InvalidUsageDimensionException].
  /// May throw [ThrottlingException].
  /// May throw [TimestampOutOfBoundsException].
  ///
  /// Parameter [usageRecords] :
  /// The set of <code>UsageRecords</code> to submit.
  /// <code>BatchMeterUsage</code> accepts up to 25 <code>UsageRecords</code> at
  /// a time.
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in Amazon Web Services
  /// Marketplace. The product code should be the same as the one used during
  /// the publishing of a new product.
  Future<BatchMeterUsageResult> batchMeterUsage({
    required List<UsageRecord> usageRecords,
    String? productCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMPMeteringService.BatchMeterUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UsageRecords': usageRecords,
        if (productCode != null) 'ProductCode': productCode,
      },
    );

    return BatchMeterUsageResult.fromJson(jsonResponse.body);
  }

  /// As a seller, your software hosted in the buyer's Amazon Web Services
  /// account uses this API action to emit metering records directly to Amazon
  /// Web Services Marketplace. You must use the following buyer Amazon Web
  /// Services account credentials to sign the API request.
  ///
  /// <ul>
  /// <li>
  /// For <b>Amazon EC2</b> deployments, your software must use the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html">IAM
  /// role for Amazon EC2</a> to sign the API call for <code>MeterUsage</code>
  /// API operation.
  /// </li>
  /// <li>
  /// For <b>Amazon EKS</b> deployments, your software must use <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html">IAM
  /// roles for service accounts (IRSA)</a> to sign the API call for the
  /// <code>MeterUsage</code> API operation. Using <a
  /// href="https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html">EKS
  /// Pod Identity</a>, the node role, or long-term access keys is not
  /// supported.
  /// </li>
  /// <li>
  /// For <b>Amazon ECS</b> deployments, your software must use <a
  /// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html">Amazon
  /// ECS task IAM</a> role to sign the API call for the <code>MeterUsage</code>
  /// API operation. Using the node role or long-term access keys are not
  /// supported.
  /// </li>
  /// <li>
  /// For <b>Amazon Bedrock AgentCore Runtime</b> deployments, your software
  /// must use the <a
  /// href="https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/runtime-permissions.html#runtime-permissions-execution">AgentCore
  /// Runtime execution role</a> to sign the API call for the
  /// <code>MeterUsage</code> API operation. Long-term access keys are not
  /// supported.
  /// </li>
  /// </ul>
  /// The handling of <code>MeterUsage</code> requests varies between Amazon
  /// Bedrock AgentCore Runtime and non-Amazon Bedrock AgentCore deployments.
  ///
  /// <ul>
  /// <li>
  /// For <b>non-Amazon Bedrock AgentCore Runtime</b> deployments, you can only
  /// report usage once per hour for each dimension. For AMI-based products,
  /// this is per dimension and per EC2 instance. For container products, this
  /// is per dimension and per ECS task or EKS pod. You can't modify values
  /// after they're recorded. If you report usage before a current hour ends,
  /// you will be unable to report additional usage until the next hour begins.
  /// The <code>Timestamp</code> request parameter is rounded down to the hour
  /// and used to enforce this once-per-hour rule for idempotency. For requests
  /// that are identical after the <code>Timestamp</code> is rounded down, the
  /// API is idempotent and returns the metering record ID.
  /// </li>
  /// <li>
  /// For <b>Amazon Bedrock AgentCore Runtime</b> deployments, you can report
  /// usage multiple times per hour for the same dimension. You do not need to
  /// aggregate metering records by the hour. You must include an idempotency
  /// token in the <code>ClientToken</code> request parameter. If using an
  /// Amazon SDK or the Amazon Web Services CLI, you must use the latest version
  /// which automatically includes an idempotency token in the
  /// <code>ClientToken</code> request parameter so that the request is
  /// processed successfully. The <code>Timestamp</code> request parameter is
  /// not rounded down to the hour and is not used for duplicate validation.
  /// Requests with duplicate <code>Timestamps</code> are aggregated as long as
  /// the <code>ClientToken</code> is unique.
  /// </li>
  /// </ul>
  /// If you submit records more than six hours after events occur, the records
  /// won't be accepted. The timestamp in your request determines when an event
  /// is recorded.
  ///
  /// You can optionally include multiple usage allocations, to provide
  /// customers with usage data split into buckets by tags that you define or
  /// allow the customer to define.
  ///
  /// For Amazon Web Services Regions that support <code>MeterUsage</code>, see
  /// <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#meterusage-region-support-ec2">MeterUsage
  /// Region support for Amazon EC2</a> and <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#meterusage-region-support-ecs-eks">MeterUsage
  /// Region support for Amazon ECS and Amazon EKS</a>.
  ///
  /// May throw [CustomerNotEntitledException].
  /// May throw [DuplicateRequestException].
  /// May throw [IdempotencyConflictException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidEndpointRegionException].
  /// May throw [InvalidProductCodeException].
  /// May throw [InvalidTagException].
  /// May throw [InvalidUsageAllocationsException].
  /// May throw [InvalidUsageDimensionException].
  /// May throw [ThrottlingException].
  /// May throw [TimestampOutOfBoundsException].
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in Amazon Web Services
  /// Marketplace. The product code should be the same as the one used during
  /// the publishing of a new product.
  ///
  /// Parameter [timestamp] :
  /// Timestamp, in UTC, for which the usage is being reported. Your application
  /// can meter usage for up to six hours in the past. Make sure the
  /// <code>timestamp</code> value is not before the start of the software
  /// usage.
  ///
  /// Parameter [usageDimension] :
  /// It will be one of the fcp dimension name provided during the publishing of
  /// the product.
  ///
  /// Parameter [clientToken] :
  /// Specifies a unique, case-sensitive identifier that you provide to ensure
  /// the idempotency of the request. This lets you safely retry the request
  /// without accidentally performing the same operation a second time. Passing
  /// the same value to a later call to an operation requires that you also pass
  /// the same value for all other parameters. We recommend that you use a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID type
  /// of value</a>.
  ///
  /// If you don't provide this value, then Amazon Web Services generates a
  /// random one for you.
  ///
  /// If you retry the operation with the same <code>ClientToken</code>, but
  /// with different parameters, the retry fails with an
  /// <code>IdempotencyConflictException</code> error.
  ///
  /// Parameter [dryRun] :
  /// Checks whether you have the permissions required for the action, but does
  /// not make the request. If you have the permissions, the request returns
  /// <code>DryRunOperation</code>; otherwise, it returns
  /// <code>UnauthorizedException</code>. Defaults to <code>false</code> if not
  /// specified.
  ///
  /// Parameter [usageAllocations] :
  /// The set of <code>UsageAllocations</code> to submit.
  ///
  /// The sum of all <code>UsageAllocation</code> quantities must equal the
  /// <code>UsageQuantity</code> of the <code>MeterUsage</code> request, and
  /// each <code>UsageAllocation</code> must have a unique set of tags (include
  /// no tags).
  ///
  /// Parameter [usageQuantity] :
  /// Consumption value for the hour. Defaults to <code>0</code> if not
  /// specified.
  Future<MeterUsageResult> meterUsage({
    required String productCode,
    required DateTime timestamp,
    required String usageDimension,
    String? clientToken,
    bool? dryRun,
    List<UsageAllocation>? usageAllocations,
    int? usageQuantity,
  }) async {
    _s.validateNumRange(
      'usageQuantity',
      usageQuantity,
      0,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMPMeteringService.MeterUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductCode': productCode,
        'Timestamp': unixTimestampToJson(timestamp),
        'UsageDimension': usageDimension,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dryRun != null) 'DryRun': dryRun,
        if (usageAllocations != null) 'UsageAllocations': usageAllocations,
        if (usageQuantity != null) 'UsageQuantity': usageQuantity,
      },
    );

    return MeterUsageResult.fromJson(jsonResponse.body);
  }

  /// Paid container software products sold through Amazon Web Services
  /// Marketplace must integrate with the Amazon Web Services Marketplace
  /// Metering Service and call the <code>RegisterUsage</code> operation for
  /// software entitlement and metering. Free and BYOL products for Amazon ECS
  /// or Amazon EKS aren't required to call <code>RegisterUsage</code>, but you
  /// may choose to do so if you would like to receive usage data in your seller
  /// reports. The sections below explain the behavior of
  /// <code>RegisterUsage</code>. <code>RegisterUsage</code> performs two
  /// primary functions: metering and entitlement.
  ///
  /// <ul>
  /// <li>
  /// <i>Entitlement</i>: <code>RegisterUsage</code> allows you to verify that
  /// the customer running your paid software is subscribed to your product on
  /// Amazon Web Services Marketplace, enabling you to guard against
  /// unauthorized use. Your container image that integrates with
  /// <code>RegisterUsage</code> is only required to guard against unauthorized
  /// use at container startup, as such a
  /// <code>CustomerNotSubscribedException</code> or
  /// <code>PlatformNotSupportedException</code> will only be thrown on the
  /// initial call to <code>RegisterUsage</code>. Subsequent calls from the same
  /// Amazon ECS task instance (e.g. task-id) or Amazon EKS pod will not throw a
  /// <code>CustomerNotSubscribedException</code>, even if the customer
  /// unsubscribes while the Amazon ECS task or Amazon EKS pod is still running.
  /// </li>
  /// <li>
  /// <i>Metering</i>: <code>RegisterUsage</code> meters software use per ECS
  /// task, per hour, or per pod for Amazon EKS with usage prorated to the
  /// second. A minimum of 1 minute of usage applies to tasks that are short
  /// lived. For example, if a customer has a 10 node Amazon ECS or Amazon EKS
  /// cluster and a service configured as a Daemon Set, then Amazon ECS or
  /// Amazon EKS will launch a task on all 10 cluster nodes and the customer
  /// will be charged for 10 tasks. Software metering is handled by the Amazon
  /// Web Services Marketplace metering control plane—your software is not
  /// required to perform metering-specific actions other than to call
  /// <code>RegisterUsage</code> to commence metering. The Amazon Web Services
  /// Marketplace metering control plane will also bill customers for running
  /// ECS tasks and Amazon EKS pods, regardless of the customer's subscription
  /// state, which removes the need for your software to run entitlement checks
  /// at runtime. For containers, <code>RegisterUsage</code> should be called
  /// immediately at launch. If you don’t register the container within the
  /// first 6 hours of the launch, Amazon Web Services Marketplace Metering
  /// Service doesn’t provide any metering guarantees for previous months.
  /// Metering will continue, however, for the current month forward until the
  /// container ends. <code>RegisterUsage</code> is for metering paid hourly
  /// container products.
  ///
  /// For Amazon Web Services Regions that support <code>RegisterUsage</code>,
  /// see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#registerusage-region-support">RegisterUsage
  /// Region support</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [CustomerNotEntitledException].
  /// May throw [DisabledApiException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidProductCodeException].
  /// May throw [InvalidPublicKeyVersionException].
  /// May throw [InvalidRegionException].
  /// May throw [PlatformNotSupportedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in Amazon Web Services
  /// Marketplace. The product code should be the same as the one used during
  /// the publishing of a new product.
  ///
  /// Parameter [publicKeyVersion] :
  /// Public Key Version provided by Amazon Web Services Marketplace
  ///
  /// Parameter [nonce] :
  /// (Optional) To scope down the registration to a specific running software
  /// instance and guard against replay attacks.
  Future<RegisterUsageResult> registerUsage({
    required String productCode,
    required int publicKeyVersion,
    String? nonce,
  }) async {
    _s.validateNumRange(
      'publicKeyVersion',
      publicKeyVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMPMeteringService.RegisterUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductCode': productCode,
        'PublicKeyVersion': publicKeyVersion,
        if (nonce != null) 'Nonce': nonce,
      },
    );

    return RegisterUsageResult.fromJson(jsonResponse.body);
  }

  /// <code>ResolveCustomer</code> is called by a SaaS application during the
  /// registration process. When a buyer visits your website during the
  /// registration process, the buyer submits a registration token through their
  /// browser. The registration token is resolved through this API to obtain a
  /// <code>CustomerIdentifier</code> along with the
  /// <code>CustomerAWSAccountId</code>, <code>ProductCode</code>, and
  /// <code>LicenseArn</code>.
  /// <note>
  /// To successfully resolve the token, the API must be called from the account
  /// that was used to publish the SaaS application. For an example of using
  /// <code>ResolveCustomer</code>, see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/userguide/saas-code-examples.html#saas-resolvecustomer-example">
  /// ResolveCustomer code example</a> in the <i>Amazon Web Services Marketplace
  /// Seller Guide</i>.
  /// </note>
  /// Permission is required for this operation. Your IAM role or user
  /// performing this operation requires a policy to allow the
  /// <code>aws-marketplace:ResolveCustomer</code> action. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsmarketplacemeteringservice.html">Actions,
  /// resources, and condition keys for Amazon Web Services Marketplace Metering
  /// Service</a> in the <i>Service Authorization Reference</i>.
  ///
  /// For Amazon Web Services Regions that support <code>ResolveCustomer</code>,
  /// see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#resolvecustomer-region-support">ResolveCustomer
  /// Region support</a>.
  ///
  /// May throw [DisabledApiException].
  /// May throw [ExpiredTokenException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidTokenException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [registrationToken] :
  /// When a buyer visits your website during the registration process, the
  /// buyer submits a registration token through the browser. The registration
  /// token is resolved to obtain a <code>CustomerIdentifier</code> along with
  /// the <code>CustomerAWSAccountId</code>, <code>ProductCode</code>, and
  /// <code>LicenseArn</code>.
  Future<ResolveCustomerResult> resolveCustomer({
    required String registrationToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMPMeteringService.ResolveCustomer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationToken': registrationToken,
      },
    );

    return ResolveCustomerResult.fromJson(jsonResponse.body);
  }
}

/// Contains the <code>UsageRecords</code> processed by
/// <code>BatchMeterUsage</code> and any records that have failed due to
/// transient error.
///
/// @nodoc
class BatchMeterUsageResult {
  /// Contains all <code>UsageRecords</code> processed by
  /// <code>BatchMeterUsage</code>. These records were either honored by Amazon
  /// Web Services Marketplace Metering Service or were invalid. Invalid records
  /// should be fixed before being resubmitted.
  final List<UsageRecordResult>? results;

  /// Contains all <code>UsageRecords</code> that were not processed by
  /// <code>BatchMeterUsage</code>. This is a list of <code>UsageRecords</code>.
  /// You can retry the failed request by making another
  /// <code>BatchMeterUsage</code> call with this list as input in the
  /// <code>BatchMeterUsageRequest</code>.
  final List<UsageRecord>? unprocessedRecords;

  BatchMeterUsageResult({
    this.results,
    this.unprocessedRecords,
  });

  factory BatchMeterUsageResult.fromJson(Map<String, dynamic> json) {
    return BatchMeterUsageResult(
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => UsageRecordResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedRecords: (json['UnprocessedRecords'] as List?)
          ?.nonNulls
          .map((e) => UsageRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final unprocessedRecords = this.unprocessedRecords;
    return {
      if (results != null) 'Results': results,
      if (unprocessedRecords != null) 'UnprocessedRecords': unprocessedRecords,
    };
  }
}

/// @nodoc
class MeterUsageResult {
  /// Metering record id.
  final String? meteringRecordId;

  MeterUsageResult({
    this.meteringRecordId,
  });

  factory MeterUsageResult.fromJson(Map<String, dynamic> json) {
    return MeterUsageResult(
      meteringRecordId: json['MeteringRecordId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meteringRecordId = this.meteringRecordId;
    return {
      if (meteringRecordId != null) 'MeteringRecordId': meteringRecordId,
    };
  }
}

/// @nodoc
class RegisterUsageResult {
  /// (Optional) Only included when public key version has expired
  final DateTime? publicKeyRotationTimestamp;

  /// JWT Token
  final String? signature;

  RegisterUsageResult({
    this.publicKeyRotationTimestamp,
    this.signature,
  });

  factory RegisterUsageResult.fromJson(Map<String, dynamic> json) {
    return RegisterUsageResult(
      publicKeyRotationTimestamp:
          timeStampFromJson(json['PublicKeyRotationTimestamp']),
      signature: json['Signature'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final publicKeyRotationTimestamp = this.publicKeyRotationTimestamp;
    final signature = this.signature;
    return {
      if (publicKeyRotationTimestamp != null)
        'PublicKeyRotationTimestamp':
            unixTimestampToJson(publicKeyRotationTimestamp),
      if (signature != null) 'Signature': signature,
    };
  }
}

/// The result of the <code>ResolveCustomer</code> operation. Contains the
/// <code>CustomerIdentifier</code> along with the
/// <code>CustomerAWSAccountId</code>, <code>ProductCode</code>, and
/// <code>LicenseArn</code>.
///
/// @nodoc
class ResolveCustomerResult {
  /// The <code>CustomerAWSAccountId</code> provides the Amazon Web Services
  /// account ID associated with the <code>CustomerIdentifier</code> for the
  /// individual customer. Calls to <code>BatchMeterUsage</code> require
  /// <code>CustomerAWSAccountId</code> for each <code>UsageRecord</code>.
  final String? customerAWSAccountId;

  /// The <code>CustomerIdentifier</code> is used to identify an individual
  /// customer in your application.
  final String? customerIdentifier;

  /// The <code>LicenseArn</code> is a unique identifier for a specific granted
  /// license. These are typically used for software purchased through Amazon Web
  /// Services Marketplace. Calls to <code>BatchMeterUsage</code> require
  /// <code>LicenseArn</code> for each <code>UsageRecord</code>.
  /// <note>
  /// Once you receive the <code>CustomerAWSAccountId</code> and
  /// <code>LicenseArn</code> in the response, store that for future purposes/API
  /// calls/integrations.
  /// </note>
  final String? licenseArn;

  /// The product code is returned to confirm that the buyer is registering for
  /// your product. Subsequent <code>BatchMeterUsage</code> calls should be made
  /// using this product code.
  final String? productCode;

  ResolveCustomerResult({
    this.customerAWSAccountId,
    this.customerIdentifier,
    this.licenseArn,
    this.productCode,
  });

  factory ResolveCustomerResult.fromJson(Map<String, dynamic> json) {
    return ResolveCustomerResult(
      customerAWSAccountId: json['CustomerAWSAccountId'] as String?,
      customerIdentifier: json['CustomerIdentifier'] as String?,
      licenseArn: json['LicenseArn'] as String?,
      productCode: json['ProductCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerAWSAccountId = this.customerAWSAccountId;
    final customerIdentifier = this.customerIdentifier;
    final licenseArn = this.licenseArn;
    final productCode = this.productCode;
    return {
      if (customerAWSAccountId != null)
        'CustomerAWSAccountId': customerAWSAccountId,
      if (customerIdentifier != null) 'CustomerIdentifier': customerIdentifier,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (productCode != null) 'ProductCode': productCode,
    };
  }
}

/// Usage allocations allow you to split usage into buckets by tags.
///
/// Each <code>UsageAllocation</code> indicates the usage quantity for a
/// specific set of tags.
///
/// @nodoc
class UsageAllocation {
  /// The total quantity allocated to this bucket of usage.
  final int allocatedUsageQuantity;

  /// The set of tags that define the bucket of usage. For the bucket of items
  /// with no tags, this parameter can be left out.
  final List<Tag>? tags;

  UsageAllocation({
    required this.allocatedUsageQuantity,
    this.tags,
  });

  factory UsageAllocation.fromJson(Map<String, dynamic> json) {
    return UsageAllocation(
      allocatedUsageQuantity: (json['AllocatedUsageQuantity'] as int?) ?? 0,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedUsageQuantity = this.allocatedUsageQuantity;
    final tags = this.tags;
    return {
      'AllocatedUsageQuantity': allocatedUsageQuantity,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Metadata assigned to an allocation. Each tag is made up of a
/// <code>key</code> and a <code>value</code>.
///
/// @nodoc
class Tag {
  /// One part of a key-value pair that makes up a <code>tag</code>. A
  /// <code>key</code> is a label that acts like a category for the specific tag
  /// values.
  final String key;

  /// One part of a key-value pair that makes up a <code>tag</code>. A
  /// <code>value</code> acts as a descriptor within a tag category (key). The
  /// value can be empty or null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// A <code>UsageRecord</code> indicates a quantity of usage for a given
/// product, customer, dimension and time.
///
/// Multiple requests with the same <code>UsageRecords</code> as input will be
/// de-duplicated to prevent double charges.
///
/// @nodoc
class UsageRecord {
  /// During the process of registering a product on Amazon Web Services
  /// Marketplace, dimensions are specified. These represent different units of
  /// value in your application.
  final String dimension;

  /// Timestamp, in UTC, for which the usage is being reported.
  ///
  /// Your application can meter usage for up to six hours in the past. Make sure
  /// the <code>timestamp</code> value is not before the start of the software
  /// usage.
  final DateTime timestamp;

  /// The <code>CustomerAWSAccountId</code> parameter specifies the AWS account ID
  /// of the buyer.
  /// <note>
  /// For existing integrations, to access your <code>CustomerIdentifier</code> to
  /// <code>CustomerAWSAccountId</code> mapping, see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/userguide/data-feed-account.html">Account
  /// Feeds</a>.
  /// </note>
  final String? customerAWSAccountId;

  /// The <code>CustomerIdentifier</code> is obtained through the
  /// <code>ResolveCustomer</code> operation and represents an individual buyer in
  /// your application.
  final String? customerIdentifier;

  /// The <code>LicenseArn</code> is a unique identifier for a specific granted
  /// license. These are used for software purchased through Amazon Web Services
  /// Marketplace.
  /// <note>
  /// To access your <code>CustomerAWSAccountId</code> and <code>LicenseArn</code>
  /// mapping, visit <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/userguide/data-feed-agreements.html">Agreements
  /// Feeds</a>.
  /// </note>
  final String? licenseArn;

  /// The quantity of usage consumed by the customer for the given dimension and
  /// time. Defaults to <code>0</code> if not specified.
  final int? quantity;

  /// The set of <code>UsageAllocations</code> to submit. The sum of all
  /// <code>UsageAllocation</code> quantities must equal the Quantity of the
  /// <code>UsageRecord</code>.
  final List<UsageAllocation>? usageAllocations;

  UsageRecord({
    required this.dimension,
    required this.timestamp,
    this.customerAWSAccountId,
    this.customerIdentifier,
    this.licenseArn,
    this.quantity,
    this.usageAllocations,
  });

  factory UsageRecord.fromJson(Map<String, dynamic> json) {
    return UsageRecord(
      dimension: (json['Dimension'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] ?? 0),
      customerAWSAccountId: json['CustomerAWSAccountId'] as String?,
      customerIdentifier: json['CustomerIdentifier'] as String?,
      licenseArn: json['LicenseArn'] as String?,
      quantity: json['Quantity'] as int?,
      usageAllocations: (json['UsageAllocations'] as List?)
          ?.nonNulls
          .map((e) => UsageAllocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    final timestamp = this.timestamp;
    final customerAWSAccountId = this.customerAWSAccountId;
    final customerIdentifier = this.customerIdentifier;
    final licenseArn = this.licenseArn;
    final quantity = this.quantity;
    final usageAllocations = this.usageAllocations;
    return {
      'Dimension': dimension,
      'Timestamp': unixTimestampToJson(timestamp),
      if (customerAWSAccountId != null)
        'CustomerAWSAccountId': customerAWSAccountId,
      if (customerIdentifier != null) 'CustomerIdentifier': customerIdentifier,
      if (licenseArn != null) 'LicenseArn': licenseArn,
      if (quantity != null) 'Quantity': quantity,
      if (usageAllocations != null) 'UsageAllocations': usageAllocations,
    };
  }
}

/// A <code>UsageRecordResult</code> indicates the status of a given
/// <code>UsageRecord</code> processed by <code>BatchMeterUsage</code>.
///
/// @nodoc
class UsageRecordResult {
  /// The <code>MeteringRecordId</code> is a unique identifier for this metering
  /// event.
  final String? meteringRecordId;

  /// The <code>UsageRecordResult</code> <code>Status</code> indicates the status
  /// of an individual <code>UsageRecord</code> processed by
  /// <code>BatchMeterUsage</code>.
  ///
  /// <ul>
  /// <li>
  /// <i>Success</i>- The <code>UsageRecord</code> was accepted and honored by
  /// <code>BatchMeterUsage</code>.
  /// </li>
  /// <li>
  /// <i>CustomerNotSubscribed</i>- The <code>CustomerIdentifier</code> specified
  /// is not able to use your product. The <code>UsageRecord</code> was not
  /// honored. There are three causes for this result:
  ///
  /// <ul>
  /// <li>
  /// The customer identifier is invalid.
  /// </li>
  /// <li>
  /// The customer identifier provided in the metering record does not have an
  /// active agreement or subscription with this product. Future
  /// <code>UsageRecords</code> for this customer will fail until the customer
  /// subscribes to your product.
  /// </li>
  /// <li>
  /// The customer's Amazon Web Services account was suspended.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i>DuplicateRecord</i>- Indicates that the <code>UsageRecord</code> was
  /// invalid and not honored. A previously metered <code>UsageRecord</code> had
  /// the same customer, dimension, and time, but a different quantity.
  /// </li>
  /// </ul>
  final UsageRecordResultStatus? status;

  /// The <code>UsageRecord</code> that was part of the
  /// <code>BatchMeterUsage</code> request.
  final UsageRecord? usageRecord;

  UsageRecordResult({
    this.meteringRecordId,
    this.status,
    this.usageRecord,
  });

  factory UsageRecordResult.fromJson(Map<String, dynamic> json) {
    return UsageRecordResult(
      meteringRecordId: json['MeteringRecordId'] as String?,
      status:
          (json['Status'] as String?)?.let(UsageRecordResultStatus.fromString),
      usageRecord: json['UsageRecord'] != null
          ? UsageRecord.fromJson(json['UsageRecord'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meteringRecordId = this.meteringRecordId;
    final status = this.status;
    final usageRecord = this.usageRecord;
    return {
      if (meteringRecordId != null) 'MeteringRecordId': meteringRecordId,
      if (status != null) 'Status': status.value,
      if (usageRecord != null) 'UsageRecord': usageRecord,
    };
  }
}

/// @nodoc
class UsageRecordResultStatus {
  static const success = UsageRecordResultStatus._('Success');
  static const customerNotSubscribed =
      UsageRecordResultStatus._('CustomerNotSubscribed');
  static const duplicateRecord = UsageRecordResultStatus._('DuplicateRecord');

  final String value;

  const UsageRecordResultStatus._(this.value);

  static const values = [success, customerNotSubscribed, duplicateRecord];

  static UsageRecordResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UsageRecordResultStatus._(value));

  @override
  bool operator ==(other) =>
      other is UsageRecordResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CustomerNotEntitledException extends _s.GenericAwsException {
  CustomerNotEntitledException({String? type, String? message})
      : super(
            type: type, code: 'CustomerNotEntitledException', message: message);
}

/// @nodoc
class DisabledApiException extends _s.GenericAwsException {
  DisabledApiException({String? type, String? message})
      : super(type: type, code: 'DisabledApiException', message: message);
}

/// @nodoc
class DuplicateRequestException extends _s.GenericAwsException {
  DuplicateRequestException({String? type, String? message})
      : super(type: type, code: 'DuplicateRequestException', message: message);
}

/// @nodoc
class ExpiredTokenException extends _s.GenericAwsException {
  ExpiredTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredTokenException', message: message);
}

/// @nodoc
class IdempotencyConflictException extends _s.GenericAwsException {
  IdempotencyConflictException({String? type, String? message})
      : super(
            type: type, code: 'IdempotencyConflictException', message: message);
}

/// @nodoc
class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

/// @nodoc
class InvalidCustomerIdentifierException extends _s.GenericAwsException {
  InvalidCustomerIdentifierException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCustomerIdentifierException',
            message: message);
}

/// @nodoc
class InvalidEndpointRegionException extends _s.GenericAwsException {
  InvalidEndpointRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEndpointRegionException',
            message: message);
}

/// @nodoc
class InvalidLicenseException extends _s.GenericAwsException {
  InvalidLicenseException({String? type, String? message})
      : super(type: type, code: 'InvalidLicenseException', message: message);
}

/// @nodoc
class InvalidProductCodeException extends _s.GenericAwsException {
  InvalidProductCodeException({String? type, String? message})
      : super(
            type: type, code: 'InvalidProductCodeException', message: message);
}

/// @nodoc
class InvalidPublicKeyVersionException extends _s.GenericAwsException {
  InvalidPublicKeyVersionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPublicKeyVersionException',
            message: message);
}

/// @nodoc
class InvalidRegionException extends _s.GenericAwsException {
  InvalidRegionException({String? type, String? message})
      : super(type: type, code: 'InvalidRegionException', message: message);
}

/// @nodoc
class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String? type, String? message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

/// @nodoc
class InvalidTokenException extends _s.GenericAwsException {
  InvalidTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidTokenException', message: message);
}

/// @nodoc
class InvalidUsageAllocationsException extends _s.GenericAwsException {
  InvalidUsageAllocationsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidUsageAllocationsException',
            message: message);
}

/// @nodoc
class InvalidUsageDimensionException extends _s.GenericAwsException {
  InvalidUsageDimensionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidUsageDimensionException',
            message: message);
}

/// @nodoc
class PlatformNotSupportedException extends _s.GenericAwsException {
  PlatformNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'PlatformNotSupportedException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class TimestampOutOfBoundsException extends _s.GenericAwsException {
  TimestampOutOfBoundsException({String? type, String? message})
      : super(
            type: type,
            code: 'TimestampOutOfBoundsException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CustomerNotEntitledException': (type, message) =>
      CustomerNotEntitledException(type: type, message: message),
  'DisabledApiException': (type, message) =>
      DisabledApiException(type: type, message: message),
  'DuplicateRequestException': (type, message) =>
      DuplicateRequestException(type: type, message: message),
  'ExpiredTokenException': (type, message) =>
      ExpiredTokenException(type: type, message: message),
  'IdempotencyConflictException': (type, message) =>
      IdempotencyConflictException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidCustomerIdentifierException': (type, message) =>
      InvalidCustomerIdentifierException(type: type, message: message),
  'InvalidEndpointRegionException': (type, message) =>
      InvalidEndpointRegionException(type: type, message: message),
  'InvalidLicenseException': (type, message) =>
      InvalidLicenseException(type: type, message: message),
  'InvalidProductCodeException': (type, message) =>
      InvalidProductCodeException(type: type, message: message),
  'InvalidPublicKeyVersionException': (type, message) =>
      InvalidPublicKeyVersionException(type: type, message: message),
  'InvalidRegionException': (type, message) =>
      InvalidRegionException(type: type, message: message),
  'InvalidTagException': (type, message) =>
      InvalidTagException(type: type, message: message),
  'InvalidTokenException': (type, message) =>
      InvalidTokenException(type: type, message: message),
  'InvalidUsageAllocationsException': (type, message) =>
      InvalidUsageAllocationsException(type: type, message: message),
  'InvalidUsageDimensionException': (type, message) =>
      InvalidUsageDimensionException(type: type, message: message),
  'PlatformNotSupportedException': (type, message) =>
      PlatformNotSupportedException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TimestampOutOfBoundsException': (type, message) =>
      TimestampOutOfBoundsException(type: type, message: message),
};
