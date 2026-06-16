// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
        'dataSetType': dataSetType.value,
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
        'dataSetType': dataSetType.value,
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

class DataSetType {
  static const customerSubscriberHourlyMonthlySubscriptions =
      DataSetType._('customer_subscriber_hourly_monthly_subscriptions');
  static const customerSubscriberAnnualSubscriptions =
      DataSetType._('customer_subscriber_annual_subscriptions');
  static const dailyBusinessUsageByInstanceType =
      DataSetType._('daily_business_usage_by_instance_type');
  static const dailyBusinessFees = DataSetType._('daily_business_fees');
  static const dailyBusinessFreeTrialConversions =
      DataSetType._('daily_business_free_trial_conversions');
  static const dailyBusinessNewInstances =
      DataSetType._('daily_business_new_instances');
  static const dailyBusinessNewProductSubscribers =
      DataSetType._('daily_business_new_product_subscribers');
  static const dailyBusinessCanceledProductSubscribers =
      DataSetType._('daily_business_canceled_product_subscribers');
  static const monthlyRevenueBillingAndRevenueData =
      DataSetType._('monthly_revenue_billing_and_revenue_data');
  static const monthlyRevenueAnnualSubscriptions =
      DataSetType._('monthly_revenue_annual_subscriptions');
  static const monthlyRevenueFieldDemonstrationUsage =
      DataSetType._('monthly_revenue_field_demonstration_usage');
  static const monthlyRevenueFlexiblePaymentSchedule =
      DataSetType._('monthly_revenue_flexible_payment_schedule');
  static const disbursedAmountByProduct =
      DataSetType._('disbursed_amount_by_product');
  static const disbursedAmountByProductWithUncollectedFunds =
      DataSetType._('disbursed_amount_by_product_with_uncollected_funds');
  static const disbursedAmountByInstanceHours =
      DataSetType._('disbursed_amount_by_instance_hours');
  static const disbursedAmountByCustomerGeo =
      DataSetType._('disbursed_amount_by_customer_geo');
  static const disbursedAmountByAgeOfUncollectedFunds =
      DataSetType._('disbursed_amount_by_age_of_uncollected_funds');
  static const disbursedAmountByAgeOfDisbursedFunds =
      DataSetType._('disbursed_amount_by_age_of_disbursed_funds');
  static const disbursedAmountByAgeOfPastDueFunds =
      DataSetType._('disbursed_amount_by_age_of_past_due_funds');
  static const disbursedAmountByUncollectedFundsBreakdown =
      DataSetType._('disbursed_amount_by_uncollected_funds_breakdown');
  static const customerProfileByIndustry =
      DataSetType._('customer_profile_by_industry');
  static const customerProfileByRevenue =
      DataSetType._('customer_profile_by_revenue');
  static const customerProfileByGeography =
      DataSetType._('customer_profile_by_geography');
  static const salesCompensationBilledRevenue =
      DataSetType._('sales_compensation_billed_revenue');
  static const usSalesAndUseTaxRecords =
      DataSetType._('us_sales_and_use_tax_records');

  final String value;

  const DataSetType._(this.value);

  static const values = [
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
    usSalesAndUseTaxRecords
  ];

  static DataSetType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DataSetType._(value));

  @override
  bool operator ==(other) => other is DataSetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class SupportDataSetType {
  static const customerSupportContactsData =
      SupportDataSetType._('customer_support_contacts_data');
  static const testCustomerSupportContactsData =
      SupportDataSetType._('test_customer_support_contacts_data');

  final String value;

  const SupportDataSetType._(this.value);

  static const values = [
    customerSupportContactsData,
    testCustomerSupportContactsData
  ];

  static SupportDataSetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupportDataSetType._(value));

  @override
  bool operator ==(other) =>
      other is SupportDataSetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
