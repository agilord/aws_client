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

/// This reference provides descriptions of the low-level AWS Marketplace
/// Metering Service API.
class MarketplaceMetering {
  final _s.JsonProtocol _protocol;
  MarketplaceMetering({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'metering.marketplace',
            signingName: 'aws-marketplace',
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

  /// <code>BatchMeterUsage</code> is called from a SaaS application listed on
  /// AWS Marketplace to post metering records for a set of customers.
  ///
  /// For identical requests, the API is idempotent; requests can be retried
  /// with the same records or a subset of the input records.
  ///
  /// Every request to <code>BatchMeterUsage</code> is for one product. If you
  /// need to meter usage for multiple products, you must make multiple calls to
  /// <code>BatchMeterUsage</code>.
  ///
  /// Usage records are expected to be submitted as quickly as possible after
  /// the event that is being recorded, and are not accepted more than 6 hours
  /// after the event.
  ///
  /// <code>BatchMeterUsage</code> can process up to 25
  /// <code>UsageRecords</code> at a time.
  ///
  /// A <code>UsageRecord</code> can optionally include multiple usage
  /// allocations, to provide customers with usage data split into buckets by
  /// tags that you define (or allow the customer to define).
  ///
  /// <code>BatchMeterUsage</code> returns a list of
  /// <code>UsageRecordResult</code> objects, showing the result for each
  /// <code>UsageRecord</code>, as well as a list of
  /// <code>UnprocessedRecords</code>, indicating errors in the service side
  /// that you should retry.
  ///
  /// <code>BatchMeterUsage</code> requests must be less than 1MB in size.
  /// <note>
  /// For an example of using <code>BatchMeterUsage</code>, see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/userguide/saas-code-examples.html#saas-batchmeterusage-example">
  /// BatchMeterUsage code example</a> in the <i>AWS Marketplace Seller
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidProductCodeException].
  /// May throw [InvalidUsageDimensionException].
  /// May throw [InvalidTagException].
  /// May throw [InvalidUsageAllocationsException].
  /// May throw [InvalidCustomerIdentifierException].
  /// May throw [TimestampOutOfBoundsException].
  /// May throw [ThrottlingException].
  /// May throw [DisabledApiException].
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in AWS Marketplace.
  /// The product code should be the same as the one used during the publishing
  /// of a new product.
  ///
  /// Parameter [usageRecords] :
  /// The set of <code>UsageRecords</code> to submit.
  /// <code>BatchMeterUsage</code> accepts up to 25 <code>UsageRecords</code> at
  /// a time.
  Future<BatchMeterUsageResult> batchMeterUsage({
    required String productCode,
    required List<UsageRecord> usageRecords,
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
        'ProductCode': productCode,
        'UsageRecords': usageRecords,
      },
    );

    return BatchMeterUsageResult.fromJson(jsonResponse.body);
  }

  /// API to emit metering records. For identical requests, the API is
  /// idempotent. It simply returns the metering record ID.
  ///
  /// <code>MeterUsage</code> is authenticated on the buyer's AWS account using
  /// credentials from the EC2 instance, ECS task, or EKS pod.
  ///
  /// <code>MeterUsage</code> can optionally include multiple usage allocations,
  /// to provide customers with usage data split into buckets by tags that you
  /// define (or allow the customer to define).
  ///
  /// Usage records are expected to be submitted as quickly as possible after
  /// the event that is being recorded, and are not accepted more than 6 hours
  /// after the event.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidProductCodeException].
  /// May throw [InvalidUsageDimensionException].
  /// May throw [InvalidTagException].
  /// May throw [InvalidUsageAllocationsException].
  /// May throw [InvalidEndpointRegionException].
  /// May throw [TimestampOutOfBoundsException].
  /// May throw [DuplicateRequestException].
  /// May throw [ThrottlingException].
  /// May throw [CustomerNotEntitledException].
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in AWS Marketplace.
  /// The product code should be the same as the one used during the publishing
  /// of a new product.
  ///
  /// Parameter [timestamp] :
  /// Timestamp, in UTC, for which the usage is being reported. Your application
  /// can meter usage for up to one hour in the past. Make sure the
  /// <code>timestamp</code> value is not before the start of the software
  /// usage.
  ///
  /// Parameter [usageDimension] :
  /// It will be one of the fcp dimension name provided during the publishing of
  /// the product.
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
        if (dryRun != null) 'DryRun': dryRun,
        if (usageAllocations != null) 'UsageAllocations': usageAllocations,
        if (usageQuantity != null) 'UsageQuantity': usageQuantity,
      },
    );

    return MeterUsageResult.fromJson(jsonResponse.body);
  }

  /// Paid container software products sold through AWS Marketplace must
  /// integrate with the AWS Marketplace Metering Service and call the
  /// <code>RegisterUsage</code> operation for software entitlement and
  /// metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't
  /// required to call <code>RegisterUsage</code>, but you may choose to do so
  /// if you would like to receive usage data in your seller reports. The
  /// sections below explain the behavior of <code>RegisterUsage</code>.
  /// <code>RegisterUsage</code> performs two primary functions: metering and
  /// entitlement.
  ///
  /// <ul>
  /// <li>
  /// <i>Entitlement</i>: <code>RegisterUsage</code> allows you to verify that
  /// the customer running your paid software is subscribed to your product on
  /// AWS Marketplace, enabling you to guard against unauthorized use. Your
  /// container image that integrates with <code>RegisterUsage</code> is only
  /// required to guard against unauthorized use at container startup, as such a
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
  /// will be charged: (10 * hourly_rate). Metering for software use is
  /// automatically handled by the AWS Marketplace Metering Control Plane --
  /// your software is not required to perform any metering specific actions,
  /// other than call <code>RegisterUsage</code> once for metering of software
  /// use to commence. The AWS Marketplace Metering Control Plane will also
  /// continue to bill customers for running ECS tasks and Amazon EKS pods,
  /// regardless of the customers subscription state, removing the need for your
  /// software to perform entitlement checks at runtime.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidProductCodeException].
  /// May throw [InvalidRegionException].
  /// May throw [InvalidPublicKeyVersionException].
  /// May throw [PlatformNotSupportedException].
  /// May throw [CustomerNotEntitledException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  /// May throw [DisabledApiException].
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in AWS Marketplace.
  /// The product code should be the same as the one used during the publishing
  /// of a new product.
  ///
  /// Parameter [publicKeyVersion] :
  /// Public Key Version provided by AWS Marketplace
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
  /// <code>CustomerAWSAccountId</code> and <code>ProductCode</code>.
  /// <note>
  /// The API needs to called from the seller account id used to publish the
  /// SaaS application to successfully resolve the token.
  ///
  /// For an example of using <code>ResolveCustomer</code>, see <a
  /// href="https://docs.aws.amazon.com/marketplace/latest/userguide/saas-code-examples.html#saas-resolvecustomer-example">
  /// ResolveCustomer code example</a> in the <i>AWS Marketplace Seller
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidTokenException].
  /// May throw [ExpiredTokenException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  /// May throw [DisabledApiException].
  ///
  /// Parameter [registrationToken] :
  /// When a buyer visits your website during the registration process, the
  /// buyer submits a registration token through the browser. The registration
  /// token is resolved to obtain a <code>CustomerIdentifier</code> along with
  /// the <code>CustomerAWSAccountId</code> and <code>ProductCode</code>.
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
class BatchMeterUsageResult {
  /// Contains all <code>UsageRecords</code> processed by
  /// <code>BatchMeterUsage</code>. These records were either honored by AWS
  /// Marketplace Metering Service or were invalid. Invalid records should be
  /// fixed before being resubmitted.
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
          ?.whereNotNull()
          .map((e) => UsageRecordResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedRecords: (json['UnprocessedRecords'] as List?)
          ?.whereNotNull()
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
/// <code>CustomerAWSAccountId</code> and <code>ProductCode</code>.
class ResolveCustomerResult {
  /// The <code>CustomerAWSAccountId</code> provides the AWS account ID associated
  /// with the <code>CustomerIdentifier</code> for the individual customer.
  final String? customerAWSAccountId;

  /// The <code>CustomerIdentifier</code> is used to identify an individual
  /// customer in your application. Calls to <code>BatchMeterUsage</code> require
  /// <code>CustomerIdentifiers</code> for each <code>UsageRecord</code>.
  final String? customerIdentifier;

  /// The product code is returned to confirm that the buyer is registering for
  /// your product. Subsequent <code>BatchMeterUsage</code> calls should be made
  /// using this product code.
  final String? productCode;

  ResolveCustomerResult({
    this.customerAWSAccountId,
    this.customerIdentifier,
    this.productCode,
  });

  factory ResolveCustomerResult.fromJson(Map<String, dynamic> json) {
    return ResolveCustomerResult(
      customerAWSAccountId: json['CustomerAWSAccountId'] as String?,
      customerIdentifier: json['CustomerIdentifier'] as String?,
      productCode: json['ProductCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerAWSAccountId = this.customerAWSAccountId;
    final customerIdentifier = this.customerIdentifier;
    final productCode = this.productCode;
    return {
      if (customerAWSAccountId != null)
        'CustomerAWSAccountId': customerAWSAccountId,
      if (customerIdentifier != null) 'CustomerIdentifier': customerIdentifier,
      if (productCode != null) 'ProductCode': productCode,
    };
  }
}

/// Metadata assigned to an allocation. Each tag is made up of a
/// <code>key</code> and a <code>value</code>.
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
      key: json['Key'] as String,
      value: json['Value'] as String,
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

/// Usage allocations allow you to split usage into buckets by tags.
///
/// Each <code>UsageAllocation</code> indicates the usage quantity for a
/// specific set of tags.
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
      allocatedUsageQuantity: json['AllocatedUsageQuantity'] as int,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
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

/// A <code>UsageRecord</code> indicates a quantity of usage for a given
/// product, customer, dimension and time.
///
/// Multiple requests with the same <code>UsageRecords</code> as input will be
/// de-duplicated to prevent double charges.
class UsageRecord {
  /// The <code>CustomerIdentifier</code> is obtained through the
  /// <code>ResolveCustomer</code> operation and represents an individual buyer in
  /// your application.
  final String customerIdentifier;

  /// During the process of registering a product on AWS Marketplace, dimensions
  /// are specified. These represent different units of value in your application.
  final String dimension;

  /// Timestamp, in UTC, for which the usage is being reported.
  ///
  /// Your application can meter usage for up to one hour in the past. Make sure
  /// the <code>timestamp</code> value is not before the start of the software
  /// usage.
  final DateTime timestamp;

  /// The quantity of usage consumed by the customer for the given dimension and
  /// time. Defaults to <code>0</code> if not specified.
  final int? quantity;

  /// The set of <code>UsageAllocations</code> to submit. The sum of all
  /// <code>UsageAllocation</code> quantities must equal the Quantity of the
  /// <code>UsageRecord</code>.
  final List<UsageAllocation>? usageAllocations;

  UsageRecord({
    required this.customerIdentifier,
    required this.dimension,
    required this.timestamp,
    this.quantity,
    this.usageAllocations,
  });

  factory UsageRecord.fromJson(Map<String, dynamic> json) {
    return UsageRecord(
      customerIdentifier: json['CustomerIdentifier'] as String,
      dimension: json['Dimension'] as String,
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] as Object),
      quantity: json['Quantity'] as int?,
      usageAllocations: (json['UsageAllocations'] as List?)
          ?.whereNotNull()
          .map((e) => UsageAllocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerIdentifier = this.customerIdentifier;
    final dimension = this.dimension;
    final timestamp = this.timestamp;
    final quantity = this.quantity;
    final usageAllocations = this.usageAllocations;
    return {
      'CustomerIdentifier': customerIdentifier,
      'Dimension': dimension,
      'Timestamp': unixTimestampToJson(timestamp),
      if (quantity != null) 'Quantity': quantity,
      if (usageAllocations != null) 'UsageAllocations': usageAllocations,
    };
  }
}

/// A <code>UsageRecordResult</code> indicates the status of a given
/// <code>UsageRecord</code> processed by <code>BatchMeterUsage</code>.
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
  /// The customer's AWS account was suspended.
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
      status: (json['Status'] as String?)?.toUsageRecordResultStatus(),
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
      if (status != null) 'Status': status.toValue(),
      if (usageRecord != null) 'UsageRecord': usageRecord,
    };
  }
}

enum UsageRecordResultStatus {
  success,
  customerNotSubscribed,
  duplicateRecord,
}

extension UsageRecordResultStatusValueExtension on UsageRecordResultStatus {
  String toValue() {
    switch (this) {
      case UsageRecordResultStatus.success:
        return 'Success';
      case UsageRecordResultStatus.customerNotSubscribed:
        return 'CustomerNotSubscribed';
      case UsageRecordResultStatus.duplicateRecord:
        return 'DuplicateRecord';
    }
  }
}

extension UsageRecordResultStatusFromString on String {
  UsageRecordResultStatus toUsageRecordResultStatus() {
    switch (this) {
      case 'Success':
        return UsageRecordResultStatus.success;
      case 'CustomerNotSubscribed':
        return UsageRecordResultStatus.customerNotSubscribed;
      case 'DuplicateRecord':
        return UsageRecordResultStatus.duplicateRecord;
    }
    throw Exception('$this is not known in enum UsageRecordResultStatus');
  }
}

class CustomerNotEntitledException extends _s.GenericAwsException {
  CustomerNotEntitledException({String? type, String? message})
      : super(
            type: type, code: 'CustomerNotEntitledException', message: message);
}

class DisabledApiException extends _s.GenericAwsException {
  DisabledApiException({String? type, String? message})
      : super(type: type, code: 'DisabledApiException', message: message);
}

class DuplicateRequestException extends _s.GenericAwsException {
  DuplicateRequestException({String? type, String? message})
      : super(type: type, code: 'DuplicateRequestException', message: message);
}

class ExpiredTokenException extends _s.GenericAwsException {
  ExpiredTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredTokenException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidCustomerIdentifierException extends _s.GenericAwsException {
  InvalidCustomerIdentifierException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCustomerIdentifierException',
            message: message);
}

class InvalidEndpointRegionException extends _s.GenericAwsException {
  InvalidEndpointRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEndpointRegionException',
            message: message);
}

class InvalidProductCodeException extends _s.GenericAwsException {
  InvalidProductCodeException({String? type, String? message})
      : super(
            type: type, code: 'InvalidProductCodeException', message: message);
}

class InvalidPublicKeyVersionException extends _s.GenericAwsException {
  InvalidPublicKeyVersionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPublicKeyVersionException',
            message: message);
}

class InvalidRegionException extends _s.GenericAwsException {
  InvalidRegionException({String? type, String? message})
      : super(type: type, code: 'InvalidRegionException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String? type, String? message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class InvalidTokenException extends _s.GenericAwsException {
  InvalidTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidTokenException', message: message);
}

class InvalidUsageAllocationsException extends _s.GenericAwsException {
  InvalidUsageAllocationsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidUsageAllocationsException',
            message: message);
}

class InvalidUsageDimensionException extends _s.GenericAwsException {
  InvalidUsageDimensionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidUsageDimensionException',
            message: message);
}

class PlatformNotSupportedException extends _s.GenericAwsException {
  PlatformNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'PlatformNotSupportedException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

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
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidCustomerIdentifierException': (type, message) =>
      InvalidCustomerIdentifierException(type: type, message: message),
  'InvalidEndpointRegionException': (type, message) =>
      InvalidEndpointRegionException(type: type, message: message),
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
