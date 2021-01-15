// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-08-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregationConfig _$AggregationConfigFromJson(Map<String, dynamic> json) {
  return AggregationConfig(
    aggregationType:
        _$enumDecodeNullable(_$AggregationTypeEnumMap, json['aggregationType']),
  );
}

Map<String, dynamic> _$AggregationConfigToJson(AggregationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'aggregationType', _$AggregationTypeEnumMap[instance.aggregationType]);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AggregationTypeEnumMap = {
  AggregationType.none: 'None',
  AggregationType.singleFile: 'SingleFile',
};

Map<String, dynamic> _$AmplitudeConnectorProfileCredentialsToJson(
    AmplitudeConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiKey', instance.apiKey);
  writeNotNull('secretKey', instance.secretKey);
  return val;
}

AmplitudeConnectorProfileProperties
    _$AmplitudeConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return AmplitudeConnectorProfileProperties();
}

Map<String, dynamic> _$AmplitudeConnectorProfilePropertiesToJson(
        AmplitudeConnectorProfileProperties instance) =>
    <String, dynamic>{};

AmplitudeMetadata _$AmplitudeMetadataFromJson(Map<String, dynamic> json) {
  return AmplitudeMetadata();
}

AmplitudeSourceProperties _$AmplitudeSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return AmplitudeSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$AmplitudeSourcePropertiesToJson(
    AmplitudeSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

ConnectorConfiguration _$ConnectorConfigurationFromJson(
    Map<String, dynamic> json) {
  return ConnectorConfiguration(
    canUseAsDestination: json['canUseAsDestination'] as bool,
    canUseAsSource: json['canUseAsSource'] as bool,
    connectorMetadata: json['connectorMetadata'] == null
        ? null
        : ConnectorMetadata.fromJson(
            json['connectorMetadata'] as Map<String, dynamic>),
    isPrivateLinkEnabled: json['isPrivateLinkEnabled'] as bool,
    isPrivateLinkEndpointUrlRequired:
        json['isPrivateLinkEndpointUrlRequired'] as bool,
    supportedDestinationConnectors:
        (json['supportedDestinationConnectors'] as List)
            ?.map((e) => _$enumDecodeNullable(_$ConnectorTypeEnumMap, e))
            ?.toList(),
    supportedSchedulingFrequencies: (json['supportedSchedulingFrequencies']
            as List)
        ?.map((e) => _$enumDecodeNullable(_$ScheduleFrequencyTypeEnumMap, e))
        ?.toList(),
    supportedTriggerTypes: (json['supportedTriggerTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TriggerTypeEnumMap, e))
        ?.toList(),
  );
}

const _$ConnectorTypeEnumMap = {
  ConnectorType.salesforce: 'Salesforce',
  ConnectorType.singular: 'Singular',
  ConnectorType.slack: 'Slack',
  ConnectorType.redshift: 'Redshift',
  ConnectorType.s3: 'S3',
  ConnectorType.marketo: 'Marketo',
  ConnectorType.googleanalytics: 'Googleanalytics',
  ConnectorType.zendesk: 'Zendesk',
  ConnectorType.servicenow: 'Servicenow',
  ConnectorType.datadog: 'Datadog',
  ConnectorType.trendmicro: 'Trendmicro',
  ConnectorType.snowflake: 'Snowflake',
  ConnectorType.dynatrace: 'Dynatrace',
  ConnectorType.infornexus: 'Infornexus',
  ConnectorType.amplitude: 'Amplitude',
  ConnectorType.veeva: 'Veeva',
  ConnectorType.eventBridge: 'EventBridge',
  ConnectorType.upsolver: 'Upsolver',
};

const _$ScheduleFrequencyTypeEnumMap = {
  ScheduleFrequencyType.byminute: 'BYMINUTE',
  ScheduleFrequencyType.hourly: 'HOURLY',
  ScheduleFrequencyType.daily: 'DAILY',
  ScheduleFrequencyType.weekly: 'WEEKLY',
  ScheduleFrequencyType.monthly: 'MONTHLY',
  ScheduleFrequencyType.once: 'ONCE',
};

const _$TriggerTypeEnumMap = {
  TriggerType.scheduled: 'Scheduled',
  TriggerType.event: 'Event',
  TriggerType.onDemand: 'OnDemand',
};

ConnectorEntity _$ConnectorEntityFromJson(Map<String, dynamic> json) {
  return ConnectorEntity(
    name: json['name'] as String,
    hasNestedEntities: json['hasNestedEntities'] as bool,
    label: json['label'] as String,
  );
}

ConnectorEntityField _$ConnectorEntityFieldFromJson(Map<String, dynamic> json) {
  return ConnectorEntityField(
    identifier: json['identifier'] as String,
    description: json['description'] as String,
    destinationProperties: json['destinationProperties'] == null
        ? null
        : DestinationFieldProperties.fromJson(
            json['destinationProperties'] as Map<String, dynamic>),
    label: json['label'] as String,
    sourceProperties: json['sourceProperties'] == null
        ? null
        : SourceFieldProperties.fromJson(
            json['sourceProperties'] as Map<String, dynamic>),
    supportedFieldTypeDetails: json['supportedFieldTypeDetails'] == null
        ? null
        : SupportedFieldTypeDetails.fromJson(
            json['supportedFieldTypeDetails'] as Map<String, dynamic>),
  );
}

ConnectorMetadata _$ConnectorMetadataFromJson(Map<String, dynamic> json) {
  return ConnectorMetadata(
    amplitude: json['Amplitude'] == null
        ? null
        : AmplitudeMetadata.fromJson(json['Amplitude'] as Map<String, dynamic>),
    datadog: json['Datadog'] == null
        ? null
        : DatadogMetadata.fromJson(json['Datadog'] as Map<String, dynamic>),
    dynatrace: json['Dynatrace'] == null
        ? null
        : DynatraceMetadata.fromJson(json['Dynatrace'] as Map<String, dynamic>),
    eventBridge: json['EventBridge'] == null
        ? null
        : EventBridgeMetadata.fromJson(
            json['EventBridge'] as Map<String, dynamic>),
    googleAnalytics: json['GoogleAnalytics'] == null
        ? null
        : GoogleAnalyticsMetadata.fromJson(
            json['GoogleAnalytics'] as Map<String, dynamic>),
    inforNexus: json['InforNexus'] == null
        ? null
        : InforNexusMetadata.fromJson(
            json['InforNexus'] as Map<String, dynamic>),
    marketo: json['Marketo'] == null
        ? null
        : MarketoMetadata.fromJson(json['Marketo'] as Map<String, dynamic>),
    redshift: json['Redshift'] == null
        ? null
        : RedshiftMetadata.fromJson(json['Redshift'] as Map<String, dynamic>),
    s3: json['S3'] == null
        ? null
        : S3Metadata.fromJson(json['S3'] as Map<String, dynamic>),
    salesforce: json['Salesforce'] == null
        ? null
        : SalesforceMetadata.fromJson(
            json['Salesforce'] as Map<String, dynamic>),
    serviceNow: json['ServiceNow'] == null
        ? null
        : ServiceNowMetadata.fromJson(
            json['ServiceNow'] as Map<String, dynamic>),
    singular: json['Singular'] == null
        ? null
        : SingularMetadata.fromJson(json['Singular'] as Map<String, dynamic>),
    slack: json['Slack'] == null
        ? null
        : SlackMetadata.fromJson(json['Slack'] as Map<String, dynamic>),
    snowflake: json['Snowflake'] == null
        ? null
        : SnowflakeMetadata.fromJson(json['Snowflake'] as Map<String, dynamic>),
    trendmicro: json['Trendmicro'] == null
        ? null
        : TrendmicroMetadata.fromJson(
            json['Trendmicro'] as Map<String, dynamic>),
    upsolver: json['Upsolver'] == null
        ? null
        : UpsolverMetadata.fromJson(json['Upsolver'] as Map<String, dynamic>),
    veeva: json['Veeva'] == null
        ? null
        : VeevaMetadata.fromJson(json['Veeva'] as Map<String, dynamic>),
    zendesk: json['Zendesk'] == null
        ? null
        : ZendeskMetadata.fromJson(json['Zendesk'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConnectorOAuthRequestToJson(
    ConnectorOAuthRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authCode', instance.authCode);
  writeNotNull('redirectUri', instance.redirectUri);
  return val;
}

ConnectorOperator _$ConnectorOperatorFromJson(Map<String, dynamic> json) {
  return ConnectorOperator(
    amplitude: _$enumDecodeNullable(
        _$AmplitudeConnectorOperatorEnumMap, json['Amplitude']),
    datadog: _$enumDecodeNullable(
        _$DatadogConnectorOperatorEnumMap, json['Datadog']),
    dynatrace: _$enumDecodeNullable(
        _$DynatraceConnectorOperatorEnumMap, json['Dynatrace']),
    googleAnalytics: _$enumDecodeNullable(
        _$GoogleAnalyticsConnectorOperatorEnumMap, json['GoogleAnalytics']),
    inforNexus: _$enumDecodeNullable(
        _$InforNexusConnectorOperatorEnumMap, json['InforNexus']),
    marketo: _$enumDecodeNullable(
        _$MarketoConnectorOperatorEnumMap, json['Marketo']),
    s3: _$enumDecodeNullable(_$S3ConnectorOperatorEnumMap, json['S3']),
    salesforce: _$enumDecodeNullable(
        _$SalesforceConnectorOperatorEnumMap, json['Salesforce']),
    serviceNow: _$enumDecodeNullable(
        _$ServiceNowConnectorOperatorEnumMap, json['ServiceNow']),
    singular: _$enumDecodeNullable(
        _$SingularConnectorOperatorEnumMap, json['Singular']),
    slack: _$enumDecodeNullable(_$SlackConnectorOperatorEnumMap, json['Slack']),
    trendmicro: _$enumDecodeNullable(
        _$TrendmicroConnectorOperatorEnumMap, json['Trendmicro']),
    veeva: _$enumDecodeNullable(_$VeevaConnectorOperatorEnumMap, json['Veeva']),
    zendesk: _$enumDecodeNullable(
        _$ZendeskConnectorOperatorEnumMap, json['Zendesk']),
  );
}

Map<String, dynamic> _$ConnectorOperatorToJson(ConnectorOperator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Amplitude', _$AmplitudeConnectorOperatorEnumMap[instance.amplitude]);
  writeNotNull('Datadog', _$DatadogConnectorOperatorEnumMap[instance.datadog]);
  writeNotNull(
      'Dynatrace', _$DynatraceConnectorOperatorEnumMap[instance.dynatrace]);
  writeNotNull('GoogleAnalytics',
      _$GoogleAnalyticsConnectorOperatorEnumMap[instance.googleAnalytics]);
  writeNotNull(
      'InforNexus', _$InforNexusConnectorOperatorEnumMap[instance.inforNexus]);
  writeNotNull('Marketo', _$MarketoConnectorOperatorEnumMap[instance.marketo]);
  writeNotNull('S3', _$S3ConnectorOperatorEnumMap[instance.s3]);
  writeNotNull(
      'Salesforce', _$SalesforceConnectorOperatorEnumMap[instance.salesforce]);
  writeNotNull(
      'ServiceNow', _$ServiceNowConnectorOperatorEnumMap[instance.serviceNow]);
  writeNotNull(
      'Singular', _$SingularConnectorOperatorEnumMap[instance.singular]);
  writeNotNull('Slack', _$SlackConnectorOperatorEnumMap[instance.slack]);
  writeNotNull(
      'Trendmicro', _$TrendmicroConnectorOperatorEnumMap[instance.trendmicro]);
  writeNotNull('Veeva', _$VeevaConnectorOperatorEnumMap[instance.veeva]);
  writeNotNull('Zendesk', _$ZendeskConnectorOperatorEnumMap[instance.zendesk]);
  return val;
}

const _$AmplitudeConnectorOperatorEnumMap = {
  AmplitudeConnectorOperator.between: 'BETWEEN',
};

const _$DatadogConnectorOperatorEnumMap = {
  DatadogConnectorOperator.projection: 'PROJECTION',
  DatadogConnectorOperator.between: 'BETWEEN',
  DatadogConnectorOperator.equalTo: 'EQUAL_TO',
  DatadogConnectorOperator.addition: 'ADDITION',
  DatadogConnectorOperator.multiplication: 'MULTIPLICATION',
  DatadogConnectorOperator.division: 'DIVISION',
  DatadogConnectorOperator.subtraction: 'SUBTRACTION',
  DatadogConnectorOperator.maskAll: 'MASK_ALL',
  DatadogConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  DatadogConnectorOperator.maskLastN: 'MASK_LAST_N',
  DatadogConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  DatadogConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  DatadogConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  DatadogConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  DatadogConnectorOperator.noOp: 'NO_OP',
};

const _$DynatraceConnectorOperatorEnumMap = {
  DynatraceConnectorOperator.projection: 'PROJECTION',
  DynatraceConnectorOperator.between: 'BETWEEN',
  DynatraceConnectorOperator.equalTo: 'EQUAL_TO',
  DynatraceConnectorOperator.addition: 'ADDITION',
  DynatraceConnectorOperator.multiplication: 'MULTIPLICATION',
  DynatraceConnectorOperator.division: 'DIVISION',
  DynatraceConnectorOperator.subtraction: 'SUBTRACTION',
  DynatraceConnectorOperator.maskAll: 'MASK_ALL',
  DynatraceConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  DynatraceConnectorOperator.maskLastN: 'MASK_LAST_N',
  DynatraceConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  DynatraceConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  DynatraceConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  DynatraceConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  DynatraceConnectorOperator.noOp: 'NO_OP',
};

const _$GoogleAnalyticsConnectorOperatorEnumMap = {
  GoogleAnalyticsConnectorOperator.projection: 'PROJECTION',
  GoogleAnalyticsConnectorOperator.between: 'BETWEEN',
};

const _$InforNexusConnectorOperatorEnumMap = {
  InforNexusConnectorOperator.projection: 'PROJECTION',
  InforNexusConnectorOperator.between: 'BETWEEN',
  InforNexusConnectorOperator.equalTo: 'EQUAL_TO',
  InforNexusConnectorOperator.addition: 'ADDITION',
  InforNexusConnectorOperator.multiplication: 'MULTIPLICATION',
  InforNexusConnectorOperator.division: 'DIVISION',
  InforNexusConnectorOperator.subtraction: 'SUBTRACTION',
  InforNexusConnectorOperator.maskAll: 'MASK_ALL',
  InforNexusConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  InforNexusConnectorOperator.maskLastN: 'MASK_LAST_N',
  InforNexusConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  InforNexusConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  InforNexusConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  InforNexusConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  InforNexusConnectorOperator.noOp: 'NO_OP',
};

const _$MarketoConnectorOperatorEnumMap = {
  MarketoConnectorOperator.projection: 'PROJECTION',
  MarketoConnectorOperator.lessThan: 'LESS_THAN',
  MarketoConnectorOperator.greaterThan: 'GREATER_THAN',
  MarketoConnectorOperator.between: 'BETWEEN',
  MarketoConnectorOperator.addition: 'ADDITION',
  MarketoConnectorOperator.multiplication: 'MULTIPLICATION',
  MarketoConnectorOperator.division: 'DIVISION',
  MarketoConnectorOperator.subtraction: 'SUBTRACTION',
  MarketoConnectorOperator.maskAll: 'MASK_ALL',
  MarketoConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  MarketoConnectorOperator.maskLastN: 'MASK_LAST_N',
  MarketoConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  MarketoConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  MarketoConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  MarketoConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  MarketoConnectorOperator.noOp: 'NO_OP',
};

const _$S3ConnectorOperatorEnumMap = {
  S3ConnectorOperator.projection: 'PROJECTION',
  S3ConnectorOperator.lessThan: 'LESS_THAN',
  S3ConnectorOperator.greaterThan: 'GREATER_THAN',
  S3ConnectorOperator.between: 'BETWEEN',
  S3ConnectorOperator.lessThanOrEqualTo: 'LESS_THAN_OR_EQUAL_TO',
  S3ConnectorOperator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
  S3ConnectorOperator.equalTo: 'EQUAL_TO',
  S3ConnectorOperator.notEqualTo: 'NOT_EQUAL_TO',
  S3ConnectorOperator.addition: 'ADDITION',
  S3ConnectorOperator.multiplication: 'MULTIPLICATION',
  S3ConnectorOperator.division: 'DIVISION',
  S3ConnectorOperator.subtraction: 'SUBTRACTION',
  S3ConnectorOperator.maskAll: 'MASK_ALL',
  S3ConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  S3ConnectorOperator.maskLastN: 'MASK_LAST_N',
  S3ConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  S3ConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  S3ConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  S3ConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  S3ConnectorOperator.noOp: 'NO_OP',
};

const _$SalesforceConnectorOperatorEnumMap = {
  SalesforceConnectorOperator.projection: 'PROJECTION',
  SalesforceConnectorOperator.lessThan: 'LESS_THAN',
  SalesforceConnectorOperator.contains: 'CONTAINS',
  SalesforceConnectorOperator.greaterThan: 'GREATER_THAN',
  SalesforceConnectorOperator.between: 'BETWEEN',
  SalesforceConnectorOperator.lessThanOrEqualTo: 'LESS_THAN_OR_EQUAL_TO',
  SalesforceConnectorOperator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
  SalesforceConnectorOperator.equalTo: 'EQUAL_TO',
  SalesforceConnectorOperator.notEqualTo: 'NOT_EQUAL_TO',
  SalesforceConnectorOperator.addition: 'ADDITION',
  SalesforceConnectorOperator.multiplication: 'MULTIPLICATION',
  SalesforceConnectorOperator.division: 'DIVISION',
  SalesforceConnectorOperator.subtraction: 'SUBTRACTION',
  SalesforceConnectorOperator.maskAll: 'MASK_ALL',
  SalesforceConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  SalesforceConnectorOperator.maskLastN: 'MASK_LAST_N',
  SalesforceConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  SalesforceConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  SalesforceConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  SalesforceConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  SalesforceConnectorOperator.noOp: 'NO_OP',
};

const _$ServiceNowConnectorOperatorEnumMap = {
  ServiceNowConnectorOperator.projection: 'PROJECTION',
  ServiceNowConnectorOperator.contains: 'CONTAINS',
  ServiceNowConnectorOperator.lessThan: 'LESS_THAN',
  ServiceNowConnectorOperator.greaterThan: 'GREATER_THAN',
  ServiceNowConnectorOperator.between: 'BETWEEN',
  ServiceNowConnectorOperator.lessThanOrEqualTo: 'LESS_THAN_OR_EQUAL_TO',
  ServiceNowConnectorOperator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
  ServiceNowConnectorOperator.equalTo: 'EQUAL_TO',
  ServiceNowConnectorOperator.notEqualTo: 'NOT_EQUAL_TO',
  ServiceNowConnectorOperator.addition: 'ADDITION',
  ServiceNowConnectorOperator.multiplication: 'MULTIPLICATION',
  ServiceNowConnectorOperator.division: 'DIVISION',
  ServiceNowConnectorOperator.subtraction: 'SUBTRACTION',
  ServiceNowConnectorOperator.maskAll: 'MASK_ALL',
  ServiceNowConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  ServiceNowConnectorOperator.maskLastN: 'MASK_LAST_N',
  ServiceNowConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  ServiceNowConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  ServiceNowConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  ServiceNowConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  ServiceNowConnectorOperator.noOp: 'NO_OP',
};

const _$SingularConnectorOperatorEnumMap = {
  SingularConnectorOperator.projection: 'PROJECTION',
  SingularConnectorOperator.equalTo: 'EQUAL_TO',
  SingularConnectorOperator.addition: 'ADDITION',
  SingularConnectorOperator.multiplication: 'MULTIPLICATION',
  SingularConnectorOperator.division: 'DIVISION',
  SingularConnectorOperator.subtraction: 'SUBTRACTION',
  SingularConnectorOperator.maskAll: 'MASK_ALL',
  SingularConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  SingularConnectorOperator.maskLastN: 'MASK_LAST_N',
  SingularConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  SingularConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  SingularConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  SingularConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  SingularConnectorOperator.noOp: 'NO_OP',
};

const _$SlackConnectorOperatorEnumMap = {
  SlackConnectorOperator.projection: 'PROJECTION',
  SlackConnectorOperator.lessThan: 'LESS_THAN',
  SlackConnectorOperator.greaterThan: 'GREATER_THAN',
  SlackConnectorOperator.between: 'BETWEEN',
  SlackConnectorOperator.lessThanOrEqualTo: 'LESS_THAN_OR_EQUAL_TO',
  SlackConnectorOperator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
  SlackConnectorOperator.equalTo: 'EQUAL_TO',
  SlackConnectorOperator.addition: 'ADDITION',
  SlackConnectorOperator.multiplication: 'MULTIPLICATION',
  SlackConnectorOperator.division: 'DIVISION',
  SlackConnectorOperator.subtraction: 'SUBTRACTION',
  SlackConnectorOperator.maskAll: 'MASK_ALL',
  SlackConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  SlackConnectorOperator.maskLastN: 'MASK_LAST_N',
  SlackConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  SlackConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  SlackConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  SlackConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  SlackConnectorOperator.noOp: 'NO_OP',
};

const _$TrendmicroConnectorOperatorEnumMap = {
  TrendmicroConnectorOperator.projection: 'PROJECTION',
  TrendmicroConnectorOperator.equalTo: 'EQUAL_TO',
  TrendmicroConnectorOperator.addition: 'ADDITION',
  TrendmicroConnectorOperator.multiplication: 'MULTIPLICATION',
  TrendmicroConnectorOperator.division: 'DIVISION',
  TrendmicroConnectorOperator.subtraction: 'SUBTRACTION',
  TrendmicroConnectorOperator.maskAll: 'MASK_ALL',
  TrendmicroConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  TrendmicroConnectorOperator.maskLastN: 'MASK_LAST_N',
  TrendmicroConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  TrendmicroConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  TrendmicroConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  TrendmicroConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  TrendmicroConnectorOperator.noOp: 'NO_OP',
};

const _$VeevaConnectorOperatorEnumMap = {
  VeevaConnectorOperator.projection: 'PROJECTION',
  VeevaConnectorOperator.lessThan: 'LESS_THAN',
  VeevaConnectorOperator.greaterThan: 'GREATER_THAN',
  VeevaConnectorOperator.contains: 'CONTAINS',
  VeevaConnectorOperator.between: 'BETWEEN',
  VeevaConnectorOperator.lessThanOrEqualTo: 'LESS_THAN_OR_EQUAL_TO',
  VeevaConnectorOperator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
  VeevaConnectorOperator.equalTo: 'EQUAL_TO',
  VeevaConnectorOperator.notEqualTo: 'NOT_EQUAL_TO',
  VeevaConnectorOperator.addition: 'ADDITION',
  VeevaConnectorOperator.multiplication: 'MULTIPLICATION',
  VeevaConnectorOperator.division: 'DIVISION',
  VeevaConnectorOperator.subtraction: 'SUBTRACTION',
  VeevaConnectorOperator.maskAll: 'MASK_ALL',
  VeevaConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  VeevaConnectorOperator.maskLastN: 'MASK_LAST_N',
  VeevaConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  VeevaConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  VeevaConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  VeevaConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  VeevaConnectorOperator.noOp: 'NO_OP',
};

const _$ZendeskConnectorOperatorEnumMap = {
  ZendeskConnectorOperator.projection: 'PROJECTION',
  ZendeskConnectorOperator.greaterThan: 'GREATER_THAN',
  ZendeskConnectorOperator.addition: 'ADDITION',
  ZendeskConnectorOperator.multiplication: 'MULTIPLICATION',
  ZendeskConnectorOperator.division: 'DIVISION',
  ZendeskConnectorOperator.subtraction: 'SUBTRACTION',
  ZendeskConnectorOperator.maskAll: 'MASK_ALL',
  ZendeskConnectorOperator.maskFirstN: 'MASK_FIRST_N',
  ZendeskConnectorOperator.maskLastN: 'MASK_LAST_N',
  ZendeskConnectorOperator.validateNonNull: 'VALIDATE_NON_NULL',
  ZendeskConnectorOperator.validateNonZero: 'VALIDATE_NON_ZERO',
  ZendeskConnectorOperator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  ZendeskConnectorOperator.validateNumeric: 'VALIDATE_NUMERIC',
  ZendeskConnectorOperator.noOp: 'NO_OP',
};

ConnectorProfile _$ConnectorProfileFromJson(Map<String, dynamic> json) {
  return ConnectorProfile(
    connectionMode:
        _$enumDecodeNullable(_$ConnectionModeEnumMap, json['connectionMode']),
    connectorProfileArn: json['connectorProfileArn'] as String,
    connectorProfileName: json['connectorProfileName'] as String,
    connectorProfileProperties: json['connectorProfileProperties'] == null
        ? null
        : ConnectorProfileProperties.fromJson(
            json['connectorProfileProperties'] as Map<String, dynamic>),
    connectorType:
        _$enumDecodeNullable(_$ConnectorTypeEnumMap, json['connectorType']),
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    credentialsArn: json['credentialsArn'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
  );
}

const _$ConnectionModeEnumMap = {
  ConnectionMode.public: 'Public',
  ConnectionMode.private: 'Private',
};

Map<String, dynamic> _$ConnectorProfileConfigToJson(
    ConnectorProfileConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectorProfileCredentials',
      instance.connectorProfileCredentials?.toJson());
  writeNotNull('connectorProfileProperties',
      instance.connectorProfileProperties?.toJson());
  return val;
}

Map<String, dynamic> _$ConnectorProfileCredentialsToJson(
    ConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amplitude', instance.amplitude?.toJson());
  writeNotNull('Datadog', instance.datadog?.toJson());
  writeNotNull('Dynatrace', instance.dynatrace?.toJson());
  writeNotNull('GoogleAnalytics', instance.googleAnalytics?.toJson());
  writeNotNull('InforNexus', instance.inforNexus?.toJson());
  writeNotNull('Marketo', instance.marketo?.toJson());
  writeNotNull('Redshift', instance.redshift?.toJson());
  writeNotNull('Salesforce', instance.salesforce?.toJson());
  writeNotNull('ServiceNow', instance.serviceNow?.toJson());
  writeNotNull('Singular', instance.singular?.toJson());
  writeNotNull('Slack', instance.slack?.toJson());
  writeNotNull('Snowflake', instance.snowflake?.toJson());
  writeNotNull('Trendmicro', instance.trendmicro?.toJson());
  writeNotNull('Veeva', instance.veeva?.toJson());
  writeNotNull('Zendesk', instance.zendesk?.toJson());
  return val;
}

ConnectorProfileProperties _$ConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return ConnectorProfileProperties(
    amplitude: json['Amplitude'] == null
        ? null
        : AmplitudeConnectorProfileProperties.fromJson(
            json['Amplitude'] as Map<String, dynamic>),
    datadog: json['Datadog'] == null
        ? null
        : DatadogConnectorProfileProperties.fromJson(
            json['Datadog'] as Map<String, dynamic>),
    dynatrace: json['Dynatrace'] == null
        ? null
        : DynatraceConnectorProfileProperties.fromJson(
            json['Dynatrace'] as Map<String, dynamic>),
    googleAnalytics: json['GoogleAnalytics'] == null
        ? null
        : GoogleAnalyticsConnectorProfileProperties.fromJson(
            json['GoogleAnalytics'] as Map<String, dynamic>),
    inforNexus: json['InforNexus'] == null
        ? null
        : InforNexusConnectorProfileProperties.fromJson(
            json['InforNexus'] as Map<String, dynamic>),
    marketo: json['Marketo'] == null
        ? null
        : MarketoConnectorProfileProperties.fromJson(
            json['Marketo'] as Map<String, dynamic>),
    redshift: json['Redshift'] == null
        ? null
        : RedshiftConnectorProfileProperties.fromJson(
            json['Redshift'] as Map<String, dynamic>),
    salesforce: json['Salesforce'] == null
        ? null
        : SalesforceConnectorProfileProperties.fromJson(
            json['Salesforce'] as Map<String, dynamic>),
    serviceNow: json['ServiceNow'] == null
        ? null
        : ServiceNowConnectorProfileProperties.fromJson(
            json['ServiceNow'] as Map<String, dynamic>),
    singular: json['Singular'] == null
        ? null
        : SingularConnectorProfileProperties.fromJson(
            json['Singular'] as Map<String, dynamic>),
    slack: json['Slack'] == null
        ? null
        : SlackConnectorProfileProperties.fromJson(
            json['Slack'] as Map<String, dynamic>),
    snowflake: json['Snowflake'] == null
        ? null
        : SnowflakeConnectorProfileProperties.fromJson(
            json['Snowflake'] as Map<String, dynamic>),
    trendmicro: json['Trendmicro'] == null
        ? null
        : TrendmicroConnectorProfileProperties.fromJson(
            json['Trendmicro'] as Map<String, dynamic>),
    veeva: json['Veeva'] == null
        ? null
        : VeevaConnectorProfileProperties.fromJson(
            json['Veeva'] as Map<String, dynamic>),
    zendesk: json['Zendesk'] == null
        ? null
        : ZendeskConnectorProfileProperties.fromJson(
            json['Zendesk'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConnectorProfilePropertiesToJson(
    ConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amplitude', instance.amplitude?.toJson());
  writeNotNull('Datadog', instance.datadog?.toJson());
  writeNotNull('Dynatrace', instance.dynatrace?.toJson());
  writeNotNull('GoogleAnalytics', instance.googleAnalytics?.toJson());
  writeNotNull('InforNexus', instance.inforNexus?.toJson());
  writeNotNull('Marketo', instance.marketo?.toJson());
  writeNotNull('Redshift', instance.redshift?.toJson());
  writeNotNull('Salesforce', instance.salesforce?.toJson());
  writeNotNull('ServiceNow', instance.serviceNow?.toJson());
  writeNotNull('Singular', instance.singular?.toJson());
  writeNotNull('Slack', instance.slack?.toJson());
  writeNotNull('Snowflake', instance.snowflake?.toJson());
  writeNotNull('Trendmicro', instance.trendmicro?.toJson());
  writeNotNull('Veeva', instance.veeva?.toJson());
  writeNotNull('Zendesk', instance.zendesk?.toJson());
  return val;
}

CreateConnectorProfileResponse _$CreateConnectorProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConnectorProfileResponse(
    connectorProfileArn: json['connectorProfileArn'] as String,
  );
}

CreateFlowResponse _$CreateFlowResponseFromJson(Map<String, dynamic> json) {
  return CreateFlowResponse(
    flowArn: json['flowArn'] as String,
    flowStatus: _$enumDecodeNullable(_$FlowStatusEnumMap, json['flowStatus']),
  );
}

const _$FlowStatusEnumMap = {
  FlowStatus.active: 'Active',
  FlowStatus.deprecated: 'Deprecated',
  FlowStatus.deleted: 'Deleted',
  FlowStatus.draft: 'Draft',
  FlowStatus.errored: 'Errored',
  FlowStatus.suspended: 'Suspended',
};

Map<String, dynamic> _$DatadogConnectorProfileCredentialsToJson(
    DatadogConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiKey', instance.apiKey);
  writeNotNull('applicationKey', instance.applicationKey);
  return val;
}

DatadogConnectorProfileProperties _$DatadogConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return DatadogConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$DatadogConnectorProfilePropertiesToJson(
    DatadogConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

DatadogMetadata _$DatadogMetadataFromJson(Map<String, dynamic> json) {
  return DatadogMetadata();
}

DatadogSourceProperties _$DatadogSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return DatadogSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$DatadogSourcePropertiesToJson(
    DatadogSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

DeleteConnectorProfileResponse _$DeleteConnectorProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectorProfileResponse();
}

DeleteFlowResponse _$DeleteFlowResponseFromJson(Map<String, dynamic> json) {
  return DeleteFlowResponse();
}

DescribeConnectorEntityResponse _$DescribeConnectorEntityResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConnectorEntityResponse(
    connectorEntityFields: (json['connectorEntityFields'] as List)
        ?.map((e) => e == null
            ? null
            : ConnectorEntityField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeConnectorProfilesResponse _$DescribeConnectorProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConnectorProfilesResponse(
    connectorProfileDetails: (json['connectorProfileDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ConnectorProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeConnectorsResponse _$DescribeConnectorsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConnectorsResponse(
    connectorConfigurations:
        (json['connectorConfigurations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$ConnectorTypeEnumMap, k),
          e == null
              ? null
              : ConnectorConfiguration.fromJson(e as Map<String, dynamic>)),
    ),
    nextToken: json['nextToken'] as String,
  );
}

DescribeFlowExecutionRecordsResponse
    _$DescribeFlowExecutionRecordsResponseFromJson(Map<String, dynamic> json) {
  return DescribeFlowExecutionRecordsResponse(
    flowExecutions: (json['flowExecutions'] as List)
        ?.map((e) => e == null
            ? null
            : ExecutionRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeFlowResponse _$DescribeFlowResponseFromJson(Map<String, dynamic> json) {
  return DescribeFlowResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    description: json['description'] as String,
    destinationFlowConfigList: (json['destinationFlowConfigList'] as List)
        ?.map((e) => e == null
            ? null
            : DestinationFlowConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flowArn: json['flowArn'] as String,
    flowName: json['flowName'] as String,
    flowStatus: _$enumDecodeNullable(_$FlowStatusEnumMap, json['flowStatus']),
    flowStatusMessage: json['flowStatusMessage'] as String,
    kmsArn: json['kmsArn'] as String,
    lastRunExecutionDetails: json['lastRunExecutionDetails'] == null
        ? null
        : ExecutionDetails.fromJson(
            json['lastRunExecutionDetails'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lastUpdatedBy: json['lastUpdatedBy'] as String,
    sourceFlowConfig: json['sourceFlowConfig'] == null
        ? null
        : SourceFlowConfig.fromJson(
            json['sourceFlowConfig'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    triggerConfig: json['triggerConfig'] == null
        ? null
        : TriggerConfig.fromJson(json['triggerConfig'] as Map<String, dynamic>),
  );
}

DestinationConnectorProperties _$DestinationConnectorPropertiesFromJson(
    Map<String, dynamic> json) {
  return DestinationConnectorProperties(
    eventBridge: json['EventBridge'] == null
        ? null
        : EventBridgeDestinationProperties.fromJson(
            json['EventBridge'] as Map<String, dynamic>),
    redshift: json['Redshift'] == null
        ? null
        : RedshiftDestinationProperties.fromJson(
            json['Redshift'] as Map<String, dynamic>),
    s3: json['S3'] == null
        ? null
        : S3DestinationProperties.fromJson(json['S3'] as Map<String, dynamic>),
    salesforce: json['Salesforce'] == null
        ? null
        : SalesforceDestinationProperties.fromJson(
            json['Salesforce'] as Map<String, dynamic>),
    snowflake: json['Snowflake'] == null
        ? null
        : SnowflakeDestinationProperties.fromJson(
            json['Snowflake'] as Map<String, dynamic>),
    upsolver: json['Upsolver'] == null
        ? null
        : UpsolverDestinationProperties.fromJson(
            json['Upsolver'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DestinationConnectorPropertiesToJson(
    DestinationConnectorProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventBridge', instance.eventBridge?.toJson());
  writeNotNull('Redshift', instance.redshift?.toJson());
  writeNotNull('S3', instance.s3?.toJson());
  writeNotNull('Salesforce', instance.salesforce?.toJson());
  writeNotNull('Snowflake', instance.snowflake?.toJson());
  writeNotNull('Upsolver', instance.upsolver?.toJson());
  return val;
}

DestinationFieldProperties _$DestinationFieldPropertiesFromJson(
    Map<String, dynamic> json) {
  return DestinationFieldProperties(
    isCreatable: json['isCreatable'] as bool,
    isNullable: json['isNullable'] as bool,
    isUpdatable: json['isUpdatable'] as bool,
    isUpsertable: json['isUpsertable'] as bool,
    supportedWriteOperations: (json['supportedWriteOperations'] as List)
        ?.map((e) => _$enumDecodeNullable(_$WriteOperationTypeEnumMap, e))
        ?.toList(),
  );
}

const _$WriteOperationTypeEnumMap = {
  WriteOperationType.insert: 'INSERT',
  WriteOperationType.upsert: 'UPSERT',
  WriteOperationType.update: 'UPDATE',
};

DestinationFlowConfig _$DestinationFlowConfigFromJson(
    Map<String, dynamic> json) {
  return DestinationFlowConfig(
    connectorType:
        _$enumDecodeNullable(_$ConnectorTypeEnumMap, json['connectorType']),
    destinationConnectorProperties:
        json['destinationConnectorProperties'] == null
            ? null
            : DestinationConnectorProperties.fromJson(
                json['destinationConnectorProperties'] as Map<String, dynamic>),
    connectorProfileName: json['connectorProfileName'] as String,
  );
}

Map<String, dynamic> _$DestinationFlowConfigToJson(
    DestinationFlowConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectorType', _$ConnectorTypeEnumMap[instance.connectorType]);
  writeNotNull('destinationConnectorProperties',
      instance.destinationConnectorProperties?.toJson());
  writeNotNull('connectorProfileName', instance.connectorProfileName);
  return val;
}

Map<String, dynamic> _$DynatraceConnectorProfileCredentialsToJson(
    DynatraceConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiToken', instance.apiToken);
  return val;
}

DynatraceConnectorProfileProperties
    _$DynatraceConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return DynatraceConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$DynatraceConnectorProfilePropertiesToJson(
    DynatraceConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

DynatraceMetadata _$DynatraceMetadataFromJson(Map<String, dynamic> json) {
  return DynatraceMetadata();
}

DynatraceSourceProperties _$DynatraceSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return DynatraceSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$DynatraceSourcePropertiesToJson(
    DynatraceSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

ErrorHandlingConfig _$ErrorHandlingConfigFromJson(Map<String, dynamic> json) {
  return ErrorHandlingConfig(
    bucketName: json['bucketName'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
    failOnFirstDestinationError: json['failOnFirstDestinationError'] as bool,
  );
}

Map<String, dynamic> _$ErrorHandlingConfigToJson(ErrorHandlingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  writeNotNull(
      'failOnFirstDestinationError', instance.failOnFirstDestinationError);
  return val;
}

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  return ErrorInfo(
    executionMessage: json['executionMessage'] as String,
    putFailuresCount: json['putFailuresCount'] as int,
  );
}

EventBridgeDestinationProperties _$EventBridgeDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return EventBridgeDestinationProperties(
    object: json['object'] as String,
    errorHandlingConfig: json['errorHandlingConfig'] == null
        ? null
        : ErrorHandlingConfig.fromJson(
            json['errorHandlingConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventBridgeDestinationPropertiesToJson(
    EventBridgeDestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  writeNotNull('errorHandlingConfig', instance.errorHandlingConfig?.toJson());
  return val;
}

EventBridgeMetadata _$EventBridgeMetadataFromJson(Map<String, dynamic> json) {
  return EventBridgeMetadata();
}

ExecutionDetails _$ExecutionDetailsFromJson(Map<String, dynamic> json) {
  return ExecutionDetails(
    mostRecentExecutionMessage: json['mostRecentExecutionMessage'] as String,
    mostRecentExecutionStatus: _$enumDecodeNullable(
        _$ExecutionStatusEnumMap, json['mostRecentExecutionStatus']),
    mostRecentExecutionTime:
        const UnixDateTimeConverter().fromJson(json['mostRecentExecutionTime']),
  );
}

const _$ExecutionStatusEnumMap = {
  ExecutionStatus.inProgress: 'InProgress',
  ExecutionStatus.successful: 'Successful',
  ExecutionStatus.error: 'Error',
};

ExecutionRecord _$ExecutionRecordFromJson(Map<String, dynamic> json) {
  return ExecutionRecord(
    executionId: json['executionId'] as String,
    executionResult: json['executionResult'] == null
        ? null
        : ExecutionResult.fromJson(
            json['executionResult'] as Map<String, dynamic>),
    executionStatus:
        _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['executionStatus']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    startedAt: const UnixDateTimeConverter().fromJson(json['startedAt']),
  );
}

ExecutionResult _$ExecutionResultFromJson(Map<String, dynamic> json) {
  return ExecutionResult(
    bytesProcessed: json['bytesProcessed'] as int,
    bytesWritten: json['bytesWritten'] as int,
    errorInfo: json['errorInfo'] == null
        ? null
        : ErrorInfo.fromJson(json['errorInfo'] as Map<String, dynamic>),
    recordsProcessed: json['recordsProcessed'] as int,
  );
}

FieldTypeDetails _$FieldTypeDetailsFromJson(Map<String, dynamic> json) {
  return FieldTypeDetails(
    fieldType: json['fieldType'] as String,
    filterOperators: (json['filterOperators'] as List)
        ?.map((e) => _$enumDecodeNullable(_$OperatorEnumMap, e))
        ?.toList(),
    supportedValues:
        (json['supportedValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$OperatorEnumMap = {
  Operator.projection: 'PROJECTION',
  Operator.lessThan: 'LESS_THAN',
  Operator.greaterThan: 'GREATER_THAN',
  Operator.contains: 'CONTAINS',
  Operator.between: 'BETWEEN',
  Operator.lessThanOrEqualTo: 'LESS_THAN_OR_EQUAL_TO',
  Operator.greaterThanOrEqualTo: 'GREATER_THAN_OR_EQUAL_TO',
  Operator.equalTo: 'EQUAL_TO',
  Operator.notEqualTo: 'NOT_EQUAL_TO',
  Operator.addition: 'ADDITION',
  Operator.multiplication: 'MULTIPLICATION',
  Operator.division: 'DIVISION',
  Operator.subtraction: 'SUBTRACTION',
  Operator.maskAll: 'MASK_ALL',
  Operator.maskFirstN: 'MASK_FIRST_N',
  Operator.maskLastN: 'MASK_LAST_N',
  Operator.validateNonNull: 'VALIDATE_NON_NULL',
  Operator.validateNonZero: 'VALIDATE_NON_ZERO',
  Operator.validateNonNegative: 'VALIDATE_NON_NEGATIVE',
  Operator.validateNumeric: 'VALIDATE_NUMERIC',
  Operator.noOp: 'NO_OP',
};

FlowDefinition _$FlowDefinitionFromJson(Map<String, dynamic> json) {
  return FlowDefinition(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    createdBy: json['createdBy'] as String,
    description: json['description'] as String,
    destinationConnectorType: _$enumDecodeNullable(
        _$ConnectorTypeEnumMap, json['destinationConnectorType']),
    flowArn: json['flowArn'] as String,
    flowName: json['flowName'] as String,
    flowStatus: _$enumDecodeNullable(_$FlowStatusEnumMap, json['flowStatus']),
    lastRunExecutionDetails: json['lastRunExecutionDetails'] == null
        ? null
        : ExecutionDetails.fromJson(
            json['lastRunExecutionDetails'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    lastUpdatedBy: json['lastUpdatedBy'] as String,
    sourceConnectorType: _$enumDecodeNullable(
        _$ConnectorTypeEnumMap, json['sourceConnectorType']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    triggerType:
        _$enumDecodeNullable(_$TriggerTypeEnumMap, json['triggerType']),
  );
}

Map<String, dynamic> _$GoogleAnalyticsConnectorProfileCredentialsToJson(
    GoogleAnalyticsConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('oAuthRequest', instance.oAuthRequest?.toJson());
  writeNotNull('refreshToken', instance.refreshToken);
  return val;
}

GoogleAnalyticsConnectorProfileProperties
    _$GoogleAnalyticsConnectorProfilePropertiesFromJson(
        Map<String, dynamic> json) {
  return GoogleAnalyticsConnectorProfileProperties();
}

Map<String, dynamic> _$GoogleAnalyticsConnectorProfilePropertiesToJson(
        GoogleAnalyticsConnectorProfileProperties instance) =>
    <String, dynamic>{};

GoogleAnalyticsMetadata _$GoogleAnalyticsMetadataFromJson(
    Map<String, dynamic> json) {
  return GoogleAnalyticsMetadata(
    oAuthScopes:
        (json['oAuthScopes'] as List)?.map((e) => e as String)?.toList(),
  );
}

GoogleAnalyticsSourceProperties _$GoogleAnalyticsSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return GoogleAnalyticsSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$GoogleAnalyticsSourcePropertiesToJson(
    GoogleAnalyticsSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

IncrementalPullConfig _$IncrementalPullConfigFromJson(
    Map<String, dynamic> json) {
  return IncrementalPullConfig(
    datetimeTypeFieldName: json['datetimeTypeFieldName'] as String,
  );
}

Map<String, dynamic> _$IncrementalPullConfigToJson(
    IncrementalPullConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('datetimeTypeFieldName', instance.datetimeTypeFieldName);
  return val;
}

Map<String, dynamic> _$InforNexusConnectorProfileCredentialsToJson(
    InforNexusConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessKeyId', instance.accessKeyId);
  writeNotNull('datakey', instance.datakey);
  writeNotNull('secretAccessKey', instance.secretAccessKey);
  writeNotNull('userId', instance.userId);
  return val;
}

InforNexusConnectorProfileProperties
    _$InforNexusConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return InforNexusConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$InforNexusConnectorProfilePropertiesToJson(
    InforNexusConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

InforNexusMetadata _$InforNexusMetadataFromJson(Map<String, dynamic> json) {
  return InforNexusMetadata();
}

InforNexusSourceProperties _$InforNexusSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return InforNexusSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$InforNexusSourcePropertiesToJson(
    InforNexusSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

ListConnectorEntitiesResponse _$ListConnectorEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return ListConnectorEntitiesResponse(
    connectorEntityMap:
        (json['connectorEntityMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ConnectorEntity.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

ListFlowsResponse _$ListFlowsResponseFromJson(Map<String, dynamic> json) {
  return ListFlowsResponse(
    flows: (json['flows'] as List)
        ?.map((e) => e == null
            ? null
            : FlowDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$MarketoConnectorProfileCredentialsToJson(
    MarketoConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('oAuthRequest', instance.oAuthRequest?.toJson());
  return val;
}

MarketoConnectorProfileProperties _$MarketoConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return MarketoConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$MarketoConnectorProfilePropertiesToJson(
    MarketoConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

MarketoMetadata _$MarketoMetadataFromJson(Map<String, dynamic> json) {
  return MarketoMetadata();
}

MarketoSourceProperties _$MarketoSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return MarketoSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$MarketoSourcePropertiesToJson(
    MarketoSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

PrefixConfig _$PrefixConfigFromJson(Map<String, dynamic> json) {
  return PrefixConfig(
    prefixFormat:
        _$enumDecodeNullable(_$PrefixFormatEnumMap, json['prefixFormat']),
    prefixType: _$enumDecodeNullable(_$PrefixTypeEnumMap, json['prefixType']),
  );
}

Map<String, dynamic> _$PrefixConfigToJson(PrefixConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefixFormat', _$PrefixFormatEnumMap[instance.prefixFormat]);
  writeNotNull('prefixType', _$PrefixTypeEnumMap[instance.prefixType]);
  return val;
}

const _$PrefixFormatEnumMap = {
  PrefixFormat.year: 'YEAR',
  PrefixFormat.month: 'MONTH',
  PrefixFormat.day: 'DAY',
  PrefixFormat.hour: 'HOUR',
  PrefixFormat.minute: 'MINUTE',
};

const _$PrefixTypeEnumMap = {
  PrefixType.filename: 'FILENAME',
  PrefixType.path: 'PATH',
  PrefixType.pathAndFilename: 'PATH_AND_FILENAME',
};

Map<String, dynamic> _$RedshiftConnectorProfileCredentialsToJson(
    RedshiftConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  return val;
}

RedshiftConnectorProfileProperties _$RedshiftConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return RedshiftConnectorProfileProperties(
    bucketName: json['bucketName'] as String,
    databaseUrl: json['databaseUrl'] as String,
    roleArn: json['roleArn'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
  );
}

Map<String, dynamic> _$RedshiftConnectorProfilePropertiesToJson(
    RedshiftConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('databaseUrl', instance.databaseUrl);
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  return val;
}

RedshiftDestinationProperties _$RedshiftDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return RedshiftDestinationProperties(
    intermediateBucketName: json['intermediateBucketName'] as String,
    object: json['object'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
    errorHandlingConfig: json['errorHandlingConfig'] == null
        ? null
        : ErrorHandlingConfig.fromJson(
            json['errorHandlingConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RedshiftDestinationPropertiesToJson(
    RedshiftDestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('intermediateBucketName', instance.intermediateBucketName);
  writeNotNull('object', instance.object);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  writeNotNull('errorHandlingConfig', instance.errorHandlingConfig?.toJson());
  return val;
}

RedshiftMetadata _$RedshiftMetadataFromJson(Map<String, dynamic> json) {
  return RedshiftMetadata();
}

S3DestinationProperties _$S3DestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return S3DestinationProperties(
    bucketName: json['bucketName'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
    s3OutputFormatConfig: json['s3OutputFormatConfig'] == null
        ? null
        : S3OutputFormatConfig.fromJson(
            json['s3OutputFormatConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3DestinationPropertiesToJson(
    S3DestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  writeNotNull('s3OutputFormatConfig', instance.s3OutputFormatConfig?.toJson());
  return val;
}

S3Metadata _$S3MetadataFromJson(Map<String, dynamic> json) {
  return S3Metadata();
}

S3OutputFormatConfig _$S3OutputFormatConfigFromJson(Map<String, dynamic> json) {
  return S3OutputFormatConfig(
    aggregationConfig: json['aggregationConfig'] == null
        ? null
        : AggregationConfig.fromJson(
            json['aggregationConfig'] as Map<String, dynamic>),
    fileType: _$enumDecodeNullable(_$FileTypeEnumMap, json['fileType']),
    prefixConfig: json['prefixConfig'] == null
        ? null
        : PrefixConfig.fromJson(json['prefixConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3OutputFormatConfigToJson(
    S3OutputFormatConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aggregationConfig', instance.aggregationConfig?.toJson());
  writeNotNull('fileType', _$FileTypeEnumMap[instance.fileType]);
  writeNotNull('prefixConfig', instance.prefixConfig?.toJson());
  return val;
}

const _$FileTypeEnumMap = {
  FileType.csv: 'CSV',
  FileType.json: 'JSON',
  FileType.parquet: 'PARQUET',
};

S3SourceProperties _$S3SourcePropertiesFromJson(Map<String, dynamic> json) {
  return S3SourceProperties(
    bucketName: json['bucketName'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
  );
}

Map<String, dynamic> _$S3SourcePropertiesToJson(S3SourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  return val;
}

Map<String, dynamic> _$SalesforceConnectorProfileCredentialsToJson(
    SalesforceConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('clientCredentialsArn', instance.clientCredentialsArn);
  writeNotNull('oAuthRequest', instance.oAuthRequest?.toJson());
  writeNotNull('refreshToken', instance.refreshToken);
  return val;
}

SalesforceConnectorProfileProperties
    _$SalesforceConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return SalesforceConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
    isSandboxEnvironment: json['isSandboxEnvironment'] as bool,
  );
}

Map<String, dynamic> _$SalesforceConnectorProfilePropertiesToJson(
    SalesforceConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  writeNotNull('isSandboxEnvironment', instance.isSandboxEnvironment);
  return val;
}

SalesforceDestinationProperties _$SalesforceDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return SalesforceDestinationProperties(
    object: json['object'] as String,
    errorHandlingConfig: json['errorHandlingConfig'] == null
        ? null
        : ErrorHandlingConfig.fromJson(
            json['errorHandlingConfig'] as Map<String, dynamic>),
    idFieldNames:
        (json['idFieldNames'] as List)?.map((e) => e as String)?.toList(),
    writeOperationType: _$enumDecodeNullable(
        _$WriteOperationTypeEnumMap, json['writeOperationType']),
  );
}

Map<String, dynamic> _$SalesforceDestinationPropertiesToJson(
    SalesforceDestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  writeNotNull('errorHandlingConfig', instance.errorHandlingConfig?.toJson());
  writeNotNull('idFieldNames', instance.idFieldNames);
  writeNotNull('writeOperationType',
      _$WriteOperationTypeEnumMap[instance.writeOperationType]);
  return val;
}

SalesforceMetadata _$SalesforceMetadataFromJson(Map<String, dynamic> json) {
  return SalesforceMetadata(
    oAuthScopes:
        (json['oAuthScopes'] as List)?.map((e) => e as String)?.toList(),
  );
}

SalesforceSourceProperties _$SalesforceSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return SalesforceSourceProperties(
    object: json['object'] as String,
    enableDynamicFieldUpdate: json['enableDynamicFieldUpdate'] as bool,
    includeDeletedRecords: json['includeDeletedRecords'] as bool,
  );
}

Map<String, dynamic> _$SalesforceSourcePropertiesToJson(
    SalesforceSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  writeNotNull('enableDynamicFieldUpdate', instance.enableDynamicFieldUpdate);
  writeNotNull('includeDeletedRecords', instance.includeDeletedRecords);
  return val;
}

ScheduledTriggerProperties _$ScheduledTriggerPropertiesFromJson(
    Map<String, dynamic> json) {
  return ScheduledTriggerProperties(
    scheduleExpression: json['scheduleExpression'] as String,
    dataPullMode:
        _$enumDecodeNullable(_$DataPullModeEnumMap, json['dataPullMode']),
    scheduleEndTime:
        const UnixDateTimeConverter().fromJson(json['scheduleEndTime']),
    scheduleStartTime:
        const UnixDateTimeConverter().fromJson(json['scheduleStartTime']),
    timezone: json['timezone'] as String,
  );
}

Map<String, dynamic> _$ScheduledTriggerPropertiesToJson(
    ScheduledTriggerProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scheduleExpression', instance.scheduleExpression);
  writeNotNull('dataPullMode', _$DataPullModeEnumMap[instance.dataPullMode]);
  writeNotNull('scheduleEndTime',
      const UnixDateTimeConverter().toJson(instance.scheduleEndTime));
  writeNotNull('scheduleStartTime',
      const UnixDateTimeConverter().toJson(instance.scheduleStartTime));
  writeNotNull('timezone', instance.timezone);
  return val;
}

const _$DataPullModeEnumMap = {
  DataPullMode.incremental: 'Incremental',
  DataPullMode.complete: 'Complete',
};

Map<String, dynamic> _$ServiceNowConnectorProfileCredentialsToJson(
    ServiceNowConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  return val;
}

ServiceNowConnectorProfileProperties
    _$ServiceNowConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return ServiceNowConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$ServiceNowConnectorProfilePropertiesToJson(
    ServiceNowConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

ServiceNowMetadata _$ServiceNowMetadataFromJson(Map<String, dynamic> json) {
  return ServiceNowMetadata();
}

ServiceNowSourceProperties _$ServiceNowSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return ServiceNowSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$ServiceNowSourcePropertiesToJson(
    ServiceNowSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

Map<String, dynamic> _$SingularConnectorProfileCredentialsToJson(
    SingularConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiKey', instance.apiKey);
  return val;
}

SingularConnectorProfileProperties _$SingularConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return SingularConnectorProfileProperties();
}

Map<String, dynamic> _$SingularConnectorProfilePropertiesToJson(
        SingularConnectorProfileProperties instance) =>
    <String, dynamic>{};

SingularMetadata _$SingularMetadataFromJson(Map<String, dynamic> json) {
  return SingularMetadata();
}

SingularSourceProperties _$SingularSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return SingularSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$SingularSourcePropertiesToJson(
    SingularSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

Map<String, dynamic> _$SlackConnectorProfileCredentialsToJson(
    SlackConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('oAuthRequest', instance.oAuthRequest?.toJson());
  return val;
}

SlackConnectorProfileProperties _$SlackConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return SlackConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$SlackConnectorProfilePropertiesToJson(
    SlackConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

SlackMetadata _$SlackMetadataFromJson(Map<String, dynamic> json) {
  return SlackMetadata(
    oAuthScopes:
        (json['oAuthScopes'] as List)?.map((e) => e as String)?.toList(),
  );
}

SlackSourceProperties _$SlackSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return SlackSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$SlackSourcePropertiesToJson(
    SlackSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

Map<String, dynamic> _$SnowflakeConnectorProfileCredentialsToJson(
    SnowflakeConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  return val;
}

SnowflakeConnectorProfileProperties
    _$SnowflakeConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return SnowflakeConnectorProfileProperties(
    bucketName: json['bucketName'] as String,
    stage: json['stage'] as String,
    warehouse: json['warehouse'] as String,
    accountName: json['accountName'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
    privateLinkServiceName: json['privateLinkServiceName'] as String,
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$SnowflakeConnectorProfilePropertiesToJson(
    SnowflakeConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('stage', instance.stage);
  writeNotNull('warehouse', instance.warehouse);
  writeNotNull('accountName', instance.accountName);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  writeNotNull('privateLinkServiceName', instance.privateLinkServiceName);
  writeNotNull('region', instance.region);
  return val;
}

SnowflakeDestinationProperties _$SnowflakeDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return SnowflakeDestinationProperties(
    intermediateBucketName: json['intermediateBucketName'] as String,
    object: json['object'] as String,
    bucketPrefix: json['bucketPrefix'] as String,
    errorHandlingConfig: json['errorHandlingConfig'] == null
        ? null
        : ErrorHandlingConfig.fromJson(
            json['errorHandlingConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SnowflakeDestinationPropertiesToJson(
    SnowflakeDestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('intermediateBucketName', instance.intermediateBucketName);
  writeNotNull('object', instance.object);
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  writeNotNull('errorHandlingConfig', instance.errorHandlingConfig?.toJson());
  return val;
}

SnowflakeMetadata _$SnowflakeMetadataFromJson(Map<String, dynamic> json) {
  return SnowflakeMetadata(
    supportedRegions:
        (json['supportedRegions'] as List)?.map((e) => e as String)?.toList(),
  );
}

SourceConnectorProperties _$SourceConnectorPropertiesFromJson(
    Map<String, dynamic> json) {
  return SourceConnectorProperties(
    amplitude: json['Amplitude'] == null
        ? null
        : AmplitudeSourceProperties.fromJson(
            json['Amplitude'] as Map<String, dynamic>),
    datadog: json['Datadog'] == null
        ? null
        : DatadogSourceProperties.fromJson(
            json['Datadog'] as Map<String, dynamic>),
    dynatrace: json['Dynatrace'] == null
        ? null
        : DynatraceSourceProperties.fromJson(
            json['Dynatrace'] as Map<String, dynamic>),
    googleAnalytics: json['GoogleAnalytics'] == null
        ? null
        : GoogleAnalyticsSourceProperties.fromJson(
            json['GoogleAnalytics'] as Map<String, dynamic>),
    inforNexus: json['InforNexus'] == null
        ? null
        : InforNexusSourceProperties.fromJson(
            json['InforNexus'] as Map<String, dynamic>),
    marketo: json['Marketo'] == null
        ? null
        : MarketoSourceProperties.fromJson(
            json['Marketo'] as Map<String, dynamic>),
    s3: json['S3'] == null
        ? null
        : S3SourceProperties.fromJson(json['S3'] as Map<String, dynamic>),
    salesforce: json['Salesforce'] == null
        ? null
        : SalesforceSourceProperties.fromJson(
            json['Salesforce'] as Map<String, dynamic>),
    serviceNow: json['ServiceNow'] == null
        ? null
        : ServiceNowSourceProperties.fromJson(
            json['ServiceNow'] as Map<String, dynamic>),
    singular: json['Singular'] == null
        ? null
        : SingularSourceProperties.fromJson(
            json['Singular'] as Map<String, dynamic>),
    slack: json['Slack'] == null
        ? null
        : SlackSourceProperties.fromJson(json['Slack'] as Map<String, dynamic>),
    trendmicro: json['Trendmicro'] == null
        ? null
        : TrendmicroSourceProperties.fromJson(
            json['Trendmicro'] as Map<String, dynamic>),
    veeva: json['Veeva'] == null
        ? null
        : VeevaSourceProperties.fromJson(json['Veeva'] as Map<String, dynamic>),
    zendesk: json['Zendesk'] == null
        ? null
        : ZendeskSourceProperties.fromJson(
            json['Zendesk'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SourceConnectorPropertiesToJson(
    SourceConnectorProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amplitude', instance.amplitude?.toJson());
  writeNotNull('Datadog', instance.datadog?.toJson());
  writeNotNull('Dynatrace', instance.dynatrace?.toJson());
  writeNotNull('GoogleAnalytics', instance.googleAnalytics?.toJson());
  writeNotNull('InforNexus', instance.inforNexus?.toJson());
  writeNotNull('Marketo', instance.marketo?.toJson());
  writeNotNull('S3', instance.s3?.toJson());
  writeNotNull('Salesforce', instance.salesforce?.toJson());
  writeNotNull('ServiceNow', instance.serviceNow?.toJson());
  writeNotNull('Singular', instance.singular?.toJson());
  writeNotNull('Slack', instance.slack?.toJson());
  writeNotNull('Trendmicro', instance.trendmicro?.toJson());
  writeNotNull('Veeva', instance.veeva?.toJson());
  writeNotNull('Zendesk', instance.zendesk?.toJson());
  return val;
}

SourceFieldProperties _$SourceFieldPropertiesFromJson(
    Map<String, dynamic> json) {
  return SourceFieldProperties(
    isQueryable: json['isQueryable'] as bool,
    isRetrievable: json['isRetrievable'] as bool,
  );
}

SourceFlowConfig _$SourceFlowConfigFromJson(Map<String, dynamic> json) {
  return SourceFlowConfig(
    connectorType:
        _$enumDecodeNullable(_$ConnectorTypeEnumMap, json['connectorType']),
    sourceConnectorProperties: json['sourceConnectorProperties'] == null
        ? null
        : SourceConnectorProperties.fromJson(
            json['sourceConnectorProperties'] as Map<String, dynamic>),
    connectorProfileName: json['connectorProfileName'] as String,
    incrementalPullConfig: json['incrementalPullConfig'] == null
        ? null
        : IncrementalPullConfig.fromJson(
            json['incrementalPullConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SourceFlowConfigToJson(SourceFlowConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('connectorType', _$ConnectorTypeEnumMap[instance.connectorType]);
  writeNotNull('sourceConnectorProperties',
      instance.sourceConnectorProperties?.toJson());
  writeNotNull('connectorProfileName', instance.connectorProfileName);
  writeNotNull(
      'incrementalPullConfig', instance.incrementalPullConfig?.toJson());
  return val;
}

StartFlowResponse _$StartFlowResponseFromJson(Map<String, dynamic> json) {
  return StartFlowResponse(
    executionId: json['executionId'] as String,
    flowArn: json['flowArn'] as String,
    flowStatus: _$enumDecodeNullable(_$FlowStatusEnumMap, json['flowStatus']),
  );
}

StopFlowResponse _$StopFlowResponseFromJson(Map<String, dynamic> json) {
  return StopFlowResponse(
    flowArn: json['flowArn'] as String,
    flowStatus: _$enumDecodeNullable(_$FlowStatusEnumMap, json['flowStatus']),
  );
}

SupportedFieldTypeDetails _$SupportedFieldTypeDetailsFromJson(
    Map<String, dynamic> json) {
  return SupportedFieldTypeDetails(
    v1: json['v1'] == null
        ? null
        : FieldTypeDetails.fromJson(json['v1'] as Map<String, dynamic>),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    sourceFields:
        (json['sourceFields'] as List)?.map((e) => e as String)?.toList(),
    taskType: _$enumDecodeNullable(_$TaskTypeEnumMap, json['taskType']),
    connectorOperator: json['connectorOperator'] == null
        ? null
        : ConnectorOperator.fromJson(
            json['connectorOperator'] as Map<String, dynamic>),
    destinationField: json['destinationField'] as String,
    taskProperties: (json['taskProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$OperatorPropertiesKeysEnumMap, k),
          e as String),
    ),
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceFields', instance.sourceFields);
  writeNotNull('taskType', _$TaskTypeEnumMap[instance.taskType]);
  writeNotNull('connectorOperator', instance.connectorOperator?.toJson());
  writeNotNull('destinationField', instance.destinationField);
  writeNotNull(
      'taskProperties',
      instance.taskProperties
          ?.map((k, e) => MapEntry(_$OperatorPropertiesKeysEnumMap[k], e)));
  return val;
}

const _$TaskTypeEnumMap = {
  TaskType.arithmetic: 'Arithmetic',
  TaskType.filter: 'Filter',
  TaskType.map: 'Map',
  TaskType.mask: 'Mask',
  TaskType.merge: 'Merge',
  TaskType.truncate: 'Truncate',
  TaskType.validate: 'Validate',
};

const _$OperatorPropertiesKeysEnumMap = {
  OperatorPropertiesKeys.value: 'VALUE',
  OperatorPropertiesKeys.$values: 'VALUES',
  OperatorPropertiesKeys.dataType: 'DATA_TYPE',
  OperatorPropertiesKeys.upperBound: 'UPPER_BOUND',
  OperatorPropertiesKeys.lowerBound: 'LOWER_BOUND',
  OperatorPropertiesKeys.sourceDataType: 'SOURCE_DATA_TYPE',
  OperatorPropertiesKeys.destinationDataType: 'DESTINATION_DATA_TYPE',
  OperatorPropertiesKeys.validationAction: 'VALIDATION_ACTION',
  OperatorPropertiesKeys.maskValue: 'MASK_VALUE',
  OperatorPropertiesKeys.maskLength: 'MASK_LENGTH',
  OperatorPropertiesKeys.truncateLength: 'TRUNCATE_LENGTH',
  OperatorPropertiesKeys.mathOperationFieldsOrder:
      'MATH_OPERATION_FIELDS_ORDER',
  OperatorPropertiesKeys.concatFormat: 'CONCAT_FORMAT',
  OperatorPropertiesKeys.subfieldCategoryMap: 'SUBFIELD_CATEGORY_MAP',
};

Map<String, dynamic> _$TrendmicroConnectorProfileCredentialsToJson(
    TrendmicroConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiSecretKey', instance.apiSecretKey);
  return val;
}

TrendmicroConnectorProfileProperties
    _$TrendmicroConnectorProfilePropertiesFromJson(Map<String, dynamic> json) {
  return TrendmicroConnectorProfileProperties();
}

Map<String, dynamic> _$TrendmicroConnectorProfilePropertiesToJson(
        TrendmicroConnectorProfileProperties instance) =>
    <String, dynamic>{};

TrendmicroMetadata _$TrendmicroMetadataFromJson(Map<String, dynamic> json) {
  return TrendmicroMetadata();
}

TrendmicroSourceProperties _$TrendmicroSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return TrendmicroSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$TrendmicroSourcePropertiesToJson(
    TrendmicroSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

TriggerConfig _$TriggerConfigFromJson(Map<String, dynamic> json) {
  return TriggerConfig(
    triggerType:
        _$enumDecodeNullable(_$TriggerTypeEnumMap, json['triggerType']),
    triggerProperties: json['triggerProperties'] == null
        ? null
        : TriggerProperties.fromJson(
            json['triggerProperties'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TriggerConfigToJson(TriggerConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('triggerType', _$TriggerTypeEnumMap[instance.triggerType]);
  writeNotNull('triggerProperties', instance.triggerProperties?.toJson());
  return val;
}

TriggerProperties _$TriggerPropertiesFromJson(Map<String, dynamic> json) {
  return TriggerProperties(
    scheduled: json['Scheduled'] == null
        ? null
        : ScheduledTriggerProperties.fromJson(
            json['Scheduled'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TriggerPropertiesToJson(TriggerProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Scheduled', instance.scheduled?.toJson());
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateConnectorProfileResponse _$UpdateConnectorProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConnectorProfileResponse(
    connectorProfileArn: json['connectorProfileArn'] as String,
  );
}

UpdateFlowResponse _$UpdateFlowResponseFromJson(Map<String, dynamic> json) {
  return UpdateFlowResponse(
    flowStatus: _$enumDecodeNullable(_$FlowStatusEnumMap, json['flowStatus']),
  );
}

UpsolverDestinationProperties _$UpsolverDestinationPropertiesFromJson(
    Map<String, dynamic> json) {
  return UpsolverDestinationProperties(
    bucketName: json['bucketName'] as String,
    s3OutputFormatConfig: json['s3OutputFormatConfig'] == null
        ? null
        : UpsolverS3OutputFormatConfig.fromJson(
            json['s3OutputFormatConfig'] as Map<String, dynamic>),
    bucketPrefix: json['bucketPrefix'] as String,
  );
}

Map<String, dynamic> _$UpsolverDestinationPropertiesToJson(
    UpsolverDestinationProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('s3OutputFormatConfig', instance.s3OutputFormatConfig?.toJson());
  writeNotNull('bucketPrefix', instance.bucketPrefix);
  return val;
}

UpsolverMetadata _$UpsolverMetadataFromJson(Map<String, dynamic> json) {
  return UpsolverMetadata();
}

UpsolverS3OutputFormatConfig _$UpsolverS3OutputFormatConfigFromJson(
    Map<String, dynamic> json) {
  return UpsolverS3OutputFormatConfig(
    prefixConfig: json['prefixConfig'] == null
        ? null
        : PrefixConfig.fromJson(json['prefixConfig'] as Map<String, dynamic>),
    aggregationConfig: json['aggregationConfig'] == null
        ? null
        : AggregationConfig.fromJson(
            json['aggregationConfig'] as Map<String, dynamic>),
    fileType: _$enumDecodeNullable(_$FileTypeEnumMap, json['fileType']),
  );
}

Map<String, dynamic> _$UpsolverS3OutputFormatConfigToJson(
    UpsolverS3OutputFormatConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefixConfig', instance.prefixConfig?.toJson());
  writeNotNull('aggregationConfig', instance.aggregationConfig?.toJson());
  writeNotNull('fileType', _$FileTypeEnumMap[instance.fileType]);
  return val;
}

Map<String, dynamic> _$VeevaConnectorProfileCredentialsToJson(
    VeevaConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  return val;
}

VeevaConnectorProfileProperties _$VeevaConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return VeevaConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$VeevaConnectorProfilePropertiesToJson(
    VeevaConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

VeevaMetadata _$VeevaMetadataFromJson(Map<String, dynamic> json) {
  return VeevaMetadata();
}

VeevaSourceProperties _$VeevaSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return VeevaSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$VeevaSourcePropertiesToJson(
    VeevaSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}

Map<String, dynamic> _$ZendeskConnectorProfileCredentialsToJson(
    ZendeskConnectorProfileCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('oAuthRequest', instance.oAuthRequest?.toJson());
  return val;
}

ZendeskConnectorProfileProperties _$ZendeskConnectorProfilePropertiesFromJson(
    Map<String, dynamic> json) {
  return ZendeskConnectorProfileProperties(
    instanceUrl: json['instanceUrl'] as String,
  );
}

Map<String, dynamic> _$ZendeskConnectorProfilePropertiesToJson(
    ZendeskConnectorProfileProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instanceUrl', instance.instanceUrl);
  return val;
}

ZendeskMetadata _$ZendeskMetadataFromJson(Map<String, dynamic> json) {
  return ZendeskMetadata(
    oAuthScopes:
        (json['oAuthScopes'] as List)?.map((e) => e as String)?.toList(),
  );
}

ZendeskSourceProperties _$ZendeskSourcePropertiesFromJson(
    Map<String, dynamic> json) {
  return ZendeskSourceProperties(
    object: json['object'] as String,
  );
}

Map<String, dynamic> _$ZendeskSourcePropertiesToJson(
    ZendeskSourceProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  return val;
}
