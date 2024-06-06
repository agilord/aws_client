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

/// Provides AWS Marketplace business intelligence data on-demand.
class MarketplaceCommerceAnalytics {
  final _s.JsonProtocol _protocol;
  MarketplaceCommerceAnalytics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'marketplacecommerceanalytics',
            signingName: 'marketplacecommerceanalytics',
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

  /// Given a data set type and data set publication date, asynchronously
  /// publishes the requested data set to the specified S3 bucket and notifies
  /// the specified SNS topic once the data is available. Returns a unique
  /// request identifier that can be used to correlate requests with
  /// notifications from the SNS topic. Data sets will be published in
  /// comma-separated values (CSV) format with the file name
  /// {data_set_type}_YYYY-MM-DD.csv. If a file with the same name already
  /// exists (e.g. if the same data set is requested twice), the original file
  /// will be overwritten by the new file. Requires a Role with an attached
  /// permissions policy providing Allow permissions for the following actions:
  /// s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish,
  /// iam:GetRolePolicy.
  ///
  /// May throw [MarketplaceCommerceAnalyticsException].
  ///
  /// Parameter [dataSetPublicationDate] :
  /// The date a data set was published. For daily data sets, provide a date
  /// with day-level granularity for the desired day. For monthly data sets
  /// except those with prefix disbursed_amount, provide a date with month-level
  /// granularity for the desired month (the day value will be ignored). For
  /// data sets with prefix disbursed_amount, provide a date with day-level
  /// granularity for the desired day. For these data sets we will look
  /// backwards in time over the range of 31 days until the first data set is
  /// found (the latest one).
  ///
  /// Parameter [dataSetType] :
  /// The desired data set type.
  ///
  ///
  /// <ul>
  /// <li> <strong>customer_subscriber_hourly_monthly_subscriptions</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>customer_subscriber_annual_subscriptions</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>daily_business_usage_by_instance_type</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>daily_business_fees</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>daily_business_free_trial_conversions</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>daily_business_new_instances</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>daily_business_new_product_subscribers</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>daily_business_canceled_product_subscribers</strong>
  /// From 2017-09-15 to present: Available daily by 24:00 UTC.
  /// </li>
  /// <li> <strong>monthly_revenue_billing_and_revenue_data</strong>
  /// From 2017-09-15 to present: Available monthly on the 15th day of the month
  /// by 24:00 UTC. Data includes metered transactions (e.g. hourly) from one
  /// month prior.
  /// </li>
  /// <li> <strong>monthly_revenue_annual_subscriptions</strong>
  /// From 2017-09-15 to present: Available monthly on the 15th day of the month
  /// by 24:00 UTC. Data includes up-front software charges (e.g. annual) from
  /// one month prior.
  /// </li>
  /// <li> <strong>monthly_revenue_field_demonstration_usage</strong>
  /// From 2018-03-15 to present: Available monthly on the 15th day of the month
  /// by 24:00 UTC.
  /// </li>
  /// <li> <strong>monthly_revenue_flexible_payment_schedule</strong>
  /// From 2018-11-15 to present: Available monthly on the 15th day of the month
  /// by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_product</strong>
  /// From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_instance_hours</strong>
  /// From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_customer_geo</strong>
  /// From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_age_of_uncollected_funds</strong>
  /// From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_age_of_disbursed_funds</strong>
  /// From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_age_of_past_due_funds</strong>
  /// From 2018-04-07 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_uncollected_funds_breakdown</strong>
  /// From 2019-10-04 to present: Available every 30 days by 24:00 UTC.
  /// </li>
  /// <li> <strong>sales_compensation_billed_revenue</strong>
  /// From 2017-09-15 to present: Available monthly on the 15th day of the month
  /// by 24:00 UTC. Data includes metered transactions (e.g. hourly) from one
  /// month prior, and up-front software charges (e.g. annual) from one month
  /// prior.
  /// </li>
  /// <li> <strong>us_sales_and_use_tax_records</strong>
  /// From 2017-09-15 to present: Available monthly on the 15th day of the month
  /// by 24:00 UTC.
  /// </li>
  /// <li> <strong>disbursed_amount_by_product_with_uncollected_funds</strong>
  /// This data set is deprecated. Download related reports from AMMP instead!
  /// </li>
  /// <li> <strong>customer_profile_by_industry</strong>
  /// This data set is deprecated. Download related reports from AMMP instead!
  /// </li>
  /// <li> <strong>customer_profile_by_revenue</strong>
  /// This data set is deprecated. Download related reports from AMMP instead!
  /// </li>
  /// <li> <strong>customer_profile_by_geography</strong>
  /// This data set is deprecated. Download related reports from AMMP instead!
  /// </li>
  /// </ul>
  ///
  /// Parameter [destinationS3BucketName] :
  /// The name (friendly name, not ARN) of the destination S3 bucket.
  ///
  /// Parameter [roleNameArn] :
  /// The Amazon Resource Name (ARN) of the Role with an attached permissions
  /// policy to interact with the provided AWS services.
  ///
  /// Parameter [snsTopicArn] :
  /// Amazon Resource Name (ARN) for the SNS Topic that will be notified when
  /// the data set has been published or if an error has occurred.
  ///
  /// Parameter [customerDefinedValues] :
  /// (Optional) Key-value pairs which will be returned, unmodified, in the
  /// Amazon SNS notification message and the data set metadata file. These
  /// key-value pairs can be used to correlated responses with tracking
  /// information from other systems.
  ///
  /// Parameter [destinationS3Prefix] :
  /// (Optional) The desired S3 prefix for the published data set, similar to a
  /// directory path in standard file systems. For example, if given the bucket
  /// name "mybucket" and the prefix "myprefix/mydatasets", the output file
  /// "outputfile" would be published to
  /// "s3://mybucket/myprefix/mydatasets/outputfile". If the prefix directory
  /// structure does not exist, it will be created. If no prefix is provided,
  /// the data set will be published to the S3 bucket root.
  Future<GenerateDataSetResult> generateDataSet({
    required DateTime dataSetPublicationDate,
    required DataSetType dataSetType,
    required String destinationS3BucketName,
    required String roleNameArn,
    required String snsTopicArn,
    Map<String, String>? customerDefinedValues,
    String? destinationS3Prefix,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'MarketplaceCommerceAnalytics20150701.GenerateDataSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSetPublicationDate': unixTimestampToJson(dataSetPublicationDate),
        'dataSetType': dataSetType.toValue(),
        'destinationS3BucketName': destinationS3BucketName,
        'roleNameArn': roleNameArn,
        'snsTopicArn': snsTopicArn,
        if (customerDefinedValues != null)
          'customerDefinedValues': customerDefinedValues,
        if (destinationS3Prefix != null)
          'destinationS3Prefix': destinationS3Prefix,
      },
    );

    return GenerateDataSetResult.fromJson(jsonResponse.body);
  }

  /// <i>This target has been deprecated.</i> Given a data set type and a from
  /// date, asynchronously publishes the requested customer support data to the
  /// specified S3 bucket and notifies the specified SNS topic once the data is
  /// available. Returns a unique request identifier that can be used to
  /// correlate requests with notifications from the SNS topic. Data sets will
  /// be published in comma-separated values (CSV) format with the file name
  /// {data_set_type}_YYYY-MM-DD'T'HH-mm-ss'Z'.csv. If a file with the same name
  /// already exists (e.g. if the same data set is requested twice), the
  /// original file will be overwritten by the new file. Requires a Role with an
  /// attached permissions policy providing Allow permissions for the following
  /// actions: s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes,
  /// sns:Publish, iam:GetRolePolicy.
  ///
  /// May throw [MarketplaceCommerceAnalyticsException].
  ///
  /// Parameter [dataSetType] :
  /// <i>This target has been deprecated.</i> Specifies the data set type to be
  /// written to the output csv file. The data set types
  /// customer_support_contacts_data and test_customer_support_contacts_data
  /// both result in a csv file containing the following fields: Product Id,
  /// Product Code, Customer Guid, Subscription Guid, Subscription Start Date,
  /// Organization, AWS Account Id, Given Name, Surname, Telephone Number,
  /// Email, Title, Country Code, ZIP Code, Operation Type, and Operation Time.
  ///
  ///
  /// <ul>
  /// <li><i>customer_support_contacts_data</i> Customer support contact data.
  /// The data set will contain all changes (Creates, Updates, and Deletes) to
  /// customer support contact data from the date specified in the from_date
  /// parameter.</li>
  /// <li><i>test_customer_support_contacts_data</i> An example data set
  /// containing static test data in the same format as
  /// customer_support_contacts_data</li>
  /// </ul>
  ///
  /// Parameter [destinationS3BucketName] :
  /// <i>This target has been deprecated.</i> The name (friendly name, not ARN)
  /// of the destination S3 bucket.
  ///
  /// Parameter [fromDate] :
  /// <i>This target has been deprecated.</i> The start date from which to
  /// retrieve the data set in UTC. This parameter only affects the
  /// customer_support_contacts_data data set type.
  ///
  /// Parameter [roleNameArn] :
  /// <i>This target has been deprecated.</i> The Amazon Resource Name (ARN) of
  /// the Role with an attached permissions policy to interact with the provided
  /// AWS services.
  ///
  /// Parameter [snsTopicArn] :
  /// <i>This target has been deprecated.</i> Amazon Resource Name (ARN) for the
  /// SNS Topic that will be notified when the data set has been published or if
  /// an error has occurred.
  ///
  /// Parameter [customerDefinedValues] :
  /// <i>This target has been deprecated.</i> (Optional) Key-value pairs which
  /// will be returned, unmodified, in the Amazon SNS notification message and
  /// the data set metadata file.
  ///
  /// Parameter [destinationS3Prefix] :
  /// <i>This target has been deprecated.</i> (Optional) The desired S3 prefix
  /// for the published data set, similar to a directory path in standard file
  /// systems. For example, if given the bucket name "mybucket" and the prefix
  /// "myprefix/mydatasets", the output file "outputfile" would be published to
  /// "s3://mybucket/myprefix/mydatasets/outputfile". If the prefix directory
  /// structure does not exist, it will be created. If no prefix is provided,
  /// the data set will be published to the S3 bucket root.
  @Deprecated(
      'This target has been deprecated. As of December 2022 Product Support Connection is no longer supported.')
  Future<StartSupportDataExportResult> startSupportDataExport({
    required SupportDataSetType dataSetType,
    required String destinationS3BucketName,
    required DateTime fromDate,
    required String roleNameArn,
    required String snsTopicArn,
    Map<String, String>? customerDefinedValues,
    String? destinationS3Prefix,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'MarketplaceCommerceAnalytics20150701.StartSupportDataExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSetType': dataSetType.toValue(),
        'destinationS3BucketName': destinationS3BucketName,
        'fromDate': unixTimestampToJson(fromDate),
        'roleNameArn': roleNameArn,
        'snsTopicArn': snsTopicArn,
        if (customerDefinedValues != null)
          'customerDefinedValues': customerDefinedValues,
        if (destinationS3Prefix != null)
          'destinationS3Prefix': destinationS3Prefix,
      },
    );

    return StartSupportDataExportResult.fromJson(jsonResponse.body);
  }
}

enum DataSetType {
  customerSubscriberHourlyMonthlySubscriptions,
  customerSubscriberAnnualSubscriptions,
  dailyBusinessUsageByInstanceType,
  dailyBusinessFees,
  dailyBusinessFreeTrialConversions,
  dailyBusinessNewInstances,
  dailyBusinessNewProductSubscribers,
  dailyBusinessCanceledProductSubscribers,
  monthlyRevenueBillingAndRevenueData,
  monthlyRevenueAnnualSubscriptions,
  monthlyRevenueFieldDemonstrationUsage,
  monthlyRevenueFlexiblePaymentSchedule,
  disbursedAmountByProduct,
  disbursedAmountByProductWithUncollectedFunds,
  disbursedAmountByInstanceHours,
  disbursedAmountByCustomerGeo,
  disbursedAmountByAgeOfUncollectedFunds,
  disbursedAmountByAgeOfDisbursedFunds,
  disbursedAmountByAgeOfPastDueFunds,
  disbursedAmountByUncollectedFundsBreakdown,
  customerProfileByIndustry,
  customerProfileByRevenue,
  customerProfileByGeography,
  salesCompensationBilledRevenue,
  usSalesAndUseTaxRecords,
}

extension DataSetTypeValueExtension on DataSetType {
  String toValue() {
    switch (this) {
      case DataSetType.customerSubscriberHourlyMonthlySubscriptions:
        return 'customer_subscriber_hourly_monthly_subscriptions';
      case DataSetType.customerSubscriberAnnualSubscriptions:
        return 'customer_subscriber_annual_subscriptions';
      case DataSetType.dailyBusinessUsageByInstanceType:
        return 'daily_business_usage_by_instance_type';
      case DataSetType.dailyBusinessFees:
        return 'daily_business_fees';
      case DataSetType.dailyBusinessFreeTrialConversions:
        return 'daily_business_free_trial_conversions';
      case DataSetType.dailyBusinessNewInstances:
        return 'daily_business_new_instances';
      case DataSetType.dailyBusinessNewProductSubscribers:
        return 'daily_business_new_product_subscribers';
      case DataSetType.dailyBusinessCanceledProductSubscribers:
        return 'daily_business_canceled_product_subscribers';
      case DataSetType.monthlyRevenueBillingAndRevenueData:
        return 'monthly_revenue_billing_and_revenue_data';
      case DataSetType.monthlyRevenueAnnualSubscriptions:
        return 'monthly_revenue_annual_subscriptions';
      case DataSetType.monthlyRevenueFieldDemonstrationUsage:
        return 'monthly_revenue_field_demonstration_usage';
      case DataSetType.monthlyRevenueFlexiblePaymentSchedule:
        return 'monthly_revenue_flexible_payment_schedule';
      case DataSetType.disbursedAmountByProduct:
        return 'disbursed_amount_by_product';
      case DataSetType.disbursedAmountByProductWithUncollectedFunds:
        return 'disbursed_amount_by_product_with_uncollected_funds';
      case DataSetType.disbursedAmountByInstanceHours:
        return 'disbursed_amount_by_instance_hours';
      case DataSetType.disbursedAmountByCustomerGeo:
        return 'disbursed_amount_by_customer_geo';
      case DataSetType.disbursedAmountByAgeOfUncollectedFunds:
        return 'disbursed_amount_by_age_of_uncollected_funds';
      case DataSetType.disbursedAmountByAgeOfDisbursedFunds:
        return 'disbursed_amount_by_age_of_disbursed_funds';
      case DataSetType.disbursedAmountByAgeOfPastDueFunds:
        return 'disbursed_amount_by_age_of_past_due_funds';
      case DataSetType.disbursedAmountByUncollectedFundsBreakdown:
        return 'disbursed_amount_by_uncollected_funds_breakdown';
      case DataSetType.customerProfileByIndustry:
        return 'customer_profile_by_industry';
      case DataSetType.customerProfileByRevenue:
        return 'customer_profile_by_revenue';
      case DataSetType.customerProfileByGeography:
        return 'customer_profile_by_geography';
      case DataSetType.salesCompensationBilledRevenue:
        return 'sales_compensation_billed_revenue';
      case DataSetType.usSalesAndUseTaxRecords:
        return 'us_sales_and_use_tax_records';
    }
  }
}

extension DataSetTypeFromString on String {
  DataSetType toDataSetType() {
    switch (this) {
      case 'customer_subscriber_hourly_monthly_subscriptions':
        return DataSetType.customerSubscriberHourlyMonthlySubscriptions;
      case 'customer_subscriber_annual_subscriptions':
        return DataSetType.customerSubscriberAnnualSubscriptions;
      case 'daily_business_usage_by_instance_type':
        return DataSetType.dailyBusinessUsageByInstanceType;
      case 'daily_business_fees':
        return DataSetType.dailyBusinessFees;
      case 'daily_business_free_trial_conversions':
        return DataSetType.dailyBusinessFreeTrialConversions;
      case 'daily_business_new_instances':
        return DataSetType.dailyBusinessNewInstances;
      case 'daily_business_new_product_subscribers':
        return DataSetType.dailyBusinessNewProductSubscribers;
      case 'daily_business_canceled_product_subscribers':
        return DataSetType.dailyBusinessCanceledProductSubscribers;
      case 'monthly_revenue_billing_and_revenue_data':
        return DataSetType.monthlyRevenueBillingAndRevenueData;
      case 'monthly_revenue_annual_subscriptions':
        return DataSetType.monthlyRevenueAnnualSubscriptions;
      case 'monthly_revenue_field_demonstration_usage':
        return DataSetType.monthlyRevenueFieldDemonstrationUsage;
      case 'monthly_revenue_flexible_payment_schedule':
        return DataSetType.monthlyRevenueFlexiblePaymentSchedule;
      case 'disbursed_amount_by_product':
        return DataSetType.disbursedAmountByProduct;
      case 'disbursed_amount_by_product_with_uncollected_funds':
        return DataSetType.disbursedAmountByProductWithUncollectedFunds;
      case 'disbursed_amount_by_instance_hours':
        return DataSetType.disbursedAmountByInstanceHours;
      case 'disbursed_amount_by_customer_geo':
        return DataSetType.disbursedAmountByCustomerGeo;
      case 'disbursed_amount_by_age_of_uncollected_funds':
        return DataSetType.disbursedAmountByAgeOfUncollectedFunds;
      case 'disbursed_amount_by_age_of_disbursed_funds':
        return DataSetType.disbursedAmountByAgeOfDisbursedFunds;
      case 'disbursed_amount_by_age_of_past_due_funds':
        return DataSetType.disbursedAmountByAgeOfPastDueFunds;
      case 'disbursed_amount_by_uncollected_funds_breakdown':
        return DataSetType.disbursedAmountByUncollectedFundsBreakdown;
      case 'customer_profile_by_industry':
        return DataSetType.customerProfileByIndustry;
      case 'customer_profile_by_revenue':
        return DataSetType.customerProfileByRevenue;
      case 'customer_profile_by_geography':
        return DataSetType.customerProfileByGeography;
      case 'sales_compensation_billed_revenue':
        return DataSetType.salesCompensationBilledRevenue;
      case 'us_sales_and_use_tax_records':
        return DataSetType.usSalesAndUseTaxRecords;
    }
    throw Exception('$this is not known in enum DataSetType');
  }
}

/// Container for the result of the GenerateDataSet operation.
class GenerateDataSetResult {
  /// A unique identifier representing a specific request to the GenerateDataSet
  /// operation. This identifier can be used to correlate a request with
  /// notifications from the SNS topic.
  final String? dataSetRequestId;

  GenerateDataSetResult({
    this.dataSetRequestId,
  });

  factory GenerateDataSetResult.fromJson(Map<String, dynamic> json) {
    return GenerateDataSetResult(
      dataSetRequestId: json['dataSetRequestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetRequestId = this.dataSetRequestId;
    return {
      if (dataSetRequestId != null) 'dataSetRequestId': dataSetRequestId,
    };
  }
}

/// <i>This target has been deprecated.</i> Container for the result of the
/// StartSupportDataExport operation.
@Deprecated(
    'This target has been deprecated. As of December 2022 Product Support Connection is no longer supported.')
class StartSupportDataExportResult {
  /// <i>This target has been deprecated.</i> A unique identifier representing a
  /// specific request to the StartSupportDataExport operation. This identifier
  /// can be used to correlate a request with notifications from the SNS topic.
  final String? dataSetRequestId;

  StartSupportDataExportResult({
    this.dataSetRequestId,
  });

  factory StartSupportDataExportResult.fromJson(Map<String, dynamic> json) {
    return StartSupportDataExportResult(
      dataSetRequestId: json['dataSetRequestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetRequestId = this.dataSetRequestId;
    return {
      if (dataSetRequestId != null) 'dataSetRequestId': dataSetRequestId,
    };
  }
}

enum SupportDataSetType {
  customerSupportContactsData,
  testCustomerSupportContactsData,
}

extension SupportDataSetTypeValueExtension on SupportDataSetType {
  String toValue() {
    switch (this) {
      case SupportDataSetType.customerSupportContactsData:
        return 'customer_support_contacts_data';
      case SupportDataSetType.testCustomerSupportContactsData:
        return 'test_customer_support_contacts_data';
    }
  }
}

extension SupportDataSetTypeFromString on String {
  SupportDataSetType toSupportDataSetType() {
    switch (this) {
      case 'customer_support_contacts_data':
        return SupportDataSetType.customerSupportContactsData;
      case 'test_customer_support_contacts_data':
        return SupportDataSetType.testCustomerSupportContactsData;
    }
    throw Exception('$this is not known in enum SupportDataSetType');
  }
}

class MarketplaceCommerceAnalyticsException extends _s.GenericAwsException {
  MarketplaceCommerceAnalyticsException({String? type, String? message})
      : super(
            type: type,
            code: 'MarketplaceCommerceAnalyticsException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'MarketplaceCommerceAnalyticsException': (type, message) =>
      MarketplaceCommerceAnalyticsException(type: type, message: message),
};
