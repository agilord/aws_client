// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplacecommerceanalytics-2015-07-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GenerateDataSetRequestToJson(
    GenerateDataSetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSetPublicationDate',
      unixTimestampToJson(instance.dataSetPublicationDate));
  writeNotNull('dataSetType', _$DataSetTypeEnumMap[instance.dataSetType]);
  writeNotNull('destinationS3BucketName', instance.destinationS3BucketName);
  writeNotNull('roleNameArn', instance.roleNameArn);
  writeNotNull('snsTopicArn', instance.snsTopicArn);
  writeNotNull('customerDefinedValues', instance.customerDefinedValues);
  writeNotNull('destinationS3Prefix', instance.destinationS3Prefix);
  return val;
}

const _$DataSetTypeEnumMap = {
  DataSetType.customerSubscriberHourlyMonthlySubscriptions:
      'customer_subscriber_hourly_monthly_subscriptions',
  DataSetType.customerSubscriberAnnualSubscriptions:
      'customer_subscriber_annual_subscriptions',
  DataSetType.dailyBusinessUsageByInstanceType:
      'daily_business_usage_by_instance_type',
  DataSetType.dailyBusinessFees: 'daily_business_fees',
  DataSetType.dailyBusinessFreeTrialConversions:
      'daily_business_free_trial_conversions',
  DataSetType.dailyBusinessNewInstances: 'daily_business_new_instances',
  DataSetType.dailyBusinessNewProductSubscribers:
      'daily_business_new_product_subscribers',
  DataSetType.dailyBusinessCanceledProductSubscribers:
      'daily_business_canceled_product_subscribers',
  DataSetType.monthlyRevenueBillingAndRevenueData:
      'monthly_revenue_billing_and_revenue_data',
  DataSetType.monthlyRevenueAnnualSubscriptions:
      'monthly_revenue_annual_subscriptions',
  DataSetType.monthlyRevenueFieldDemonstrationUsage:
      'monthly_revenue_field_demonstration_usage',
  DataSetType.monthlyRevenueFlexiblePaymentSchedule:
      'monthly_revenue_flexible_payment_schedule',
  DataSetType.disbursedAmountByProduct: 'disbursed_amount_by_product',
  DataSetType.disbursedAmountByProductWithUncollectedFunds:
      'disbursed_amount_by_product_with_uncollected_funds',
  DataSetType.disbursedAmountByInstanceHours:
      'disbursed_amount_by_instance_hours',
  DataSetType.disbursedAmountByCustomerGeo: 'disbursed_amount_by_customer_geo',
  DataSetType.disbursedAmountByAgeOfUncollectedFunds:
      'disbursed_amount_by_age_of_uncollected_funds',
  DataSetType.disbursedAmountByAgeOfDisbursedFunds:
      'disbursed_amount_by_age_of_disbursed_funds',
  DataSetType.disbursedAmountByAgeOfPastDueFunds:
      'disbursed_amount_by_age_of_past_due_funds',
  DataSetType.disbursedAmountByUncollectedFundsBreakdown:
      'disbursed_amount_by_uncollected_funds_breakdown',
  DataSetType.customerProfileByIndustry: 'customer_profile_by_industry',
  DataSetType.customerProfileByRevenue: 'customer_profile_by_revenue',
  DataSetType.customerProfileByGeography: 'customer_profile_by_geography',
  DataSetType.salesCompensationBilledRevenue:
      'sales_compensation_billed_revenue',
  DataSetType.usSalesAndUseTaxRecords: 'us_sales_and_use_tax_records',
};

GenerateDataSetResult _$GenerateDataSetResultFromJson(
    Map<String, dynamic> json) {
  return GenerateDataSetResult(
    dataSetRequestId: json['dataSetRequestId'] as String,
  );
}

Map<String, dynamic> _$StartSupportDataExportRequestToJson(
    StartSupportDataExportRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'dataSetType', _$SupportDataSetTypeEnumMap[instance.dataSetType]);
  writeNotNull('destinationS3BucketName', instance.destinationS3BucketName);
  writeNotNull('fromDate', unixTimestampToJson(instance.fromDate));
  writeNotNull('roleNameArn', instance.roleNameArn);
  writeNotNull('snsTopicArn', instance.snsTopicArn);
  writeNotNull('customerDefinedValues', instance.customerDefinedValues);
  writeNotNull('destinationS3Prefix', instance.destinationS3Prefix);
  return val;
}

const _$SupportDataSetTypeEnumMap = {
  SupportDataSetType.customerSupportContactsData:
      'customer_support_contacts_data',
  SupportDataSetType.testCustomerSupportContactsData:
      'test_customer_support_contacts_data',
};

StartSupportDataExportResult _$StartSupportDataExportResultFromJson(
    Map<String, dynamic> json) {
  return StartSupportDataExportResult(
    dataSetRequestId: json['dataSetRequestId'] as String,
  );
}
