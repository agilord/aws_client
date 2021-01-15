// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-11-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAggregationSource _$AccountAggregationSourceFromJson(
    Map<String, dynamic> json) {
  return AccountAggregationSource(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    allAwsRegions: json['AllAwsRegions'] as bool,
    awsRegions: (json['AwsRegions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AccountAggregationSourceToJson(
    AccountAggregationSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountIds', instance.accountIds);
  writeNotNull('AllAwsRegions', instance.allAwsRegions);
  writeNotNull('AwsRegions', instance.awsRegions);
  return val;
}

AggregateComplianceByConfigRule _$AggregateComplianceByConfigRuleFromJson(
    Map<String, dynamic> json) {
  return AggregateComplianceByConfigRule(
    accountId: json['AccountId'] as String,
    awsRegion: json['AwsRegion'] as String,
    compliance: json['Compliance'] == null
        ? null
        : Compliance.fromJson(json['Compliance'] as Map<String, dynamic>),
    configRuleName: json['ConfigRuleName'] as String,
  );
}

AggregateComplianceCount _$AggregateComplianceCountFromJson(
    Map<String, dynamic> json) {
  return AggregateComplianceCount(
    complianceSummary: json['ComplianceSummary'] == null
        ? null
        : ComplianceSummary.fromJson(
            json['ComplianceSummary'] as Map<String, dynamic>),
    groupName: json['GroupName'] as String,
  );
}

AggregateEvaluationResult _$AggregateEvaluationResultFromJson(
    Map<String, dynamic> json) {
  return AggregateEvaluationResult(
    accountId: json['AccountId'] as String,
    annotation: json['Annotation'] as String,
    awsRegion: json['AwsRegion'] as String,
    complianceType:
        _$enumDecodeNullable(_$ComplianceTypeEnumMap, json['ComplianceType']),
    configRuleInvokedTime:
        const UnixDateTimeConverter().fromJson(json['ConfigRuleInvokedTime']),
    evaluationResultIdentifier: json['EvaluationResultIdentifier'] == null
        ? null
        : EvaluationResultIdentifier.fromJson(
            json['EvaluationResultIdentifier'] as Map<String, dynamic>),
    resultRecordedTime:
        const UnixDateTimeConverter().fromJson(json['ResultRecordedTime']),
  );
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

const _$ComplianceTypeEnumMap = {
  ComplianceType.compliant: 'COMPLIANT',
  ComplianceType.nonCompliant: 'NON_COMPLIANT',
  ComplianceType.notApplicable: 'NOT_APPLICABLE',
  ComplianceType.insufficientData: 'INSUFFICIENT_DATA',
};

AggregateResourceIdentifier _$AggregateResourceIdentifierFromJson(
    Map<String, dynamic> json) {
  return AggregateResourceIdentifier(
    resourceId: json['ResourceId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['ResourceType']),
    sourceAccountId: json['SourceAccountId'] as String,
    sourceRegion: json['SourceRegion'] as String,
    resourceName: json['ResourceName'] as String,
  );
}

Map<String, dynamic> _$AggregateResourceIdentifierToJson(
    AggregateResourceIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('ResourceType', _$ResourceTypeEnumMap[instance.resourceType]);
  writeNotNull('SourceAccountId', instance.sourceAccountId);
  writeNotNull('SourceRegion', instance.sourceRegion);
  writeNotNull('ResourceName', instance.resourceName);
  return val;
}

const _$ResourceTypeEnumMap = {
  ResourceType.awsEc2CustomerGateway: 'AWS::EC2::CustomerGateway',
  ResourceType.awsEc2Eip: 'AWS::EC2::EIP',
  ResourceType.awsEc2Host: 'AWS::EC2::Host',
  ResourceType.awsEc2Instance: 'AWS::EC2::Instance',
  ResourceType.awsEc2InternetGateway: 'AWS::EC2::InternetGateway',
  ResourceType.awsEc2NetworkAcl: 'AWS::EC2::NetworkAcl',
  ResourceType.awsEc2NetworkInterface: 'AWS::EC2::NetworkInterface',
  ResourceType.awsEc2RouteTable: 'AWS::EC2::RouteTable',
  ResourceType.awsEc2SecurityGroup: 'AWS::EC2::SecurityGroup',
  ResourceType.awsEc2Subnet: 'AWS::EC2::Subnet',
  ResourceType.awsCloudTrailTrail: 'AWS::CloudTrail::Trail',
  ResourceType.awsEc2Volume: 'AWS::EC2::Volume',
  ResourceType.awsEc2Vpc: 'AWS::EC2::VPC',
  ResourceType.awsEc2VPNConnection: 'AWS::EC2::VPNConnection',
  ResourceType.awsEc2VPNGateway: 'AWS::EC2::VPNGateway',
  ResourceType.awsEc2RegisteredHAInstance: 'AWS::EC2::RegisteredHAInstance',
  ResourceType.awsEc2NatGateway: 'AWS::EC2::NatGateway',
  ResourceType.awsEc2EgressOnlyInternetGateway:
      'AWS::EC2::EgressOnlyInternetGateway',
  ResourceType.awsEc2VPCEndpoint: 'AWS::EC2::VPCEndpoint',
  ResourceType.awsEc2VPCEndpointService: 'AWS::EC2::VPCEndpointService',
  ResourceType.awsEc2FlowLog: 'AWS::EC2::FlowLog',
  ResourceType.awsEc2VPCPeeringConnection: 'AWS::EC2::VPCPeeringConnection',
  ResourceType.awsElasticsearchDomain: 'AWS::Elasticsearch::Domain',
  ResourceType.awsIamGroup: 'AWS::IAM::Group',
  ResourceType.awsIamPolicy: 'AWS::IAM::Policy',
  ResourceType.awsIamRole: 'AWS::IAM::Role',
  ResourceType.awsIamUser: 'AWS::IAM::User',
  ResourceType.awsElasticLoadBalancingV2LoadBalancer:
      'AWS::ElasticLoadBalancingV2::LoadBalancer',
  ResourceType.awsAcmCertificate: 'AWS::ACM::Certificate',
  ResourceType.awsRdsDBInstance: 'AWS::RDS::DBInstance',
  ResourceType.awsRdsDBSubnetGroup: 'AWS::RDS::DBSubnetGroup',
  ResourceType.awsRdsDBSecurityGroup: 'AWS::RDS::DBSecurityGroup',
  ResourceType.awsRdsDBSnapshot: 'AWS::RDS::DBSnapshot',
  ResourceType.awsRdsDBCluster: 'AWS::RDS::DBCluster',
  ResourceType.awsRdsDBClusterSnapshot: 'AWS::RDS::DBClusterSnapshot',
  ResourceType.awsRdsEventSubscription: 'AWS::RDS::EventSubscription',
  ResourceType.awsS3Bucket: 'AWS::S3::Bucket',
  ResourceType.awsS3AccountPublicAccessBlock:
      'AWS::S3::AccountPublicAccessBlock',
  ResourceType.awsRedshiftCluster: 'AWS::Redshift::Cluster',
  ResourceType.awsRedshiftClusterSnapshot: 'AWS::Redshift::ClusterSnapshot',
  ResourceType.awsRedshiftClusterParameterGroup:
      'AWS::Redshift::ClusterParameterGroup',
  ResourceType.awsRedshiftClusterSecurityGroup:
      'AWS::Redshift::ClusterSecurityGroup',
  ResourceType.awsRedshiftClusterSubnetGroup:
      'AWS::Redshift::ClusterSubnetGroup',
  ResourceType.awsRedshiftEventSubscription: 'AWS::Redshift::EventSubscription',
  ResourceType.awsSsmManagedInstanceInventory:
      'AWS::SSM::ManagedInstanceInventory',
  ResourceType.awsCloudWatchAlarm: 'AWS::CloudWatch::Alarm',
  ResourceType.awsCloudFormationStack: 'AWS::CloudFormation::Stack',
  ResourceType.awsElasticLoadBalancingLoadBalancer:
      'AWS::ElasticLoadBalancing::LoadBalancer',
  ResourceType.awsAutoScalingAutoScalingGroup:
      'AWS::AutoScaling::AutoScalingGroup',
  ResourceType.awsAutoScalingLaunchConfiguration:
      'AWS::AutoScaling::LaunchConfiguration',
  ResourceType.awsAutoScalingScalingPolicy: 'AWS::AutoScaling::ScalingPolicy',
  ResourceType.awsAutoScalingScheduledAction:
      'AWS::AutoScaling::ScheduledAction',
  ResourceType.awsDynamoDBTable: 'AWS::DynamoDB::Table',
  ResourceType.awsCodeBuildProject: 'AWS::CodeBuild::Project',
  ResourceType.awsWafRateBasedRule: 'AWS::WAF::RateBasedRule',
  ResourceType.awsWafRule: 'AWS::WAF::Rule',
  ResourceType.awsWafRuleGroup: 'AWS::WAF::RuleGroup',
  ResourceType.awsWafWebACL: 'AWS::WAF::WebACL',
  ResourceType.awsWAFRegionalRateBasedRule: 'AWS::WAFRegional::RateBasedRule',
  ResourceType.awsWAFRegionalRule: 'AWS::WAFRegional::Rule',
  ResourceType.awsWAFRegionalRuleGroup: 'AWS::WAFRegional::RuleGroup',
  ResourceType.awsWAFRegionalWebACL: 'AWS::WAFRegional::WebACL',
  ResourceType.awsCloudFrontDistribution: 'AWS::CloudFront::Distribution',
  ResourceType.awsCloudFrontStreamingDistribution:
      'AWS::CloudFront::StreamingDistribution',
  ResourceType.awsLambdaFunction: 'AWS::Lambda::Function',
  ResourceType.awsNetworkFirewallFirewall: 'AWS::NetworkFirewall::Firewall',
  ResourceType.awsNetworkFirewallFirewallPolicy:
      'AWS::NetworkFirewall::FirewallPolicy',
  ResourceType.awsNetworkFirewallRuleGroup: 'AWS::NetworkFirewall::RuleGroup',
  ResourceType.awsElasticBeanstalkApplication:
      'AWS::ElasticBeanstalk::Application',
  ResourceType.awsElasticBeanstalkApplicationVersion:
      'AWS::ElasticBeanstalk::ApplicationVersion',
  ResourceType.awsElasticBeanstalkEnvironment:
      'AWS::ElasticBeanstalk::Environment',
  ResourceType.awsWAFv2WebACL: 'AWS::WAFv2::WebACL',
  ResourceType.awsWAFv2RuleGroup: 'AWS::WAFv2::RuleGroup',
  ResourceType.awsWAFv2IPSet: 'AWS::WAFv2::IPSet',
  ResourceType.awsWAFv2RegexPatternSet: 'AWS::WAFv2::RegexPatternSet',
  ResourceType.awsWAFv2ManagedRuleSet: 'AWS::WAFv2::ManagedRuleSet',
  ResourceType.awsXRayEncryptionConfig: 'AWS::XRay::EncryptionConfig',
  ResourceType.awsSsmAssociationCompliance: 'AWS::SSM::AssociationCompliance',
  ResourceType.awsSsmPatchCompliance: 'AWS::SSM::PatchCompliance',
  ResourceType.awsShieldProtection: 'AWS::Shield::Protection',
  ResourceType.awsShieldRegionalProtection: 'AWS::ShieldRegional::Protection',
  ResourceType.awsConfigResourceCompliance: 'AWS::Config::ResourceCompliance',
  ResourceType.awsApiGatewayStage: 'AWS::ApiGateway::Stage',
  ResourceType.awsApiGatewayRestApi: 'AWS::ApiGateway::RestApi',
  ResourceType.awsApiGatewayV2Stage: 'AWS::ApiGatewayV2::Stage',
  ResourceType.awsApiGatewayV2Api: 'AWS::ApiGatewayV2::Api',
  ResourceType.awsCodePipelinePipeline: 'AWS::CodePipeline::Pipeline',
  ResourceType.awsServiceCatalogCloudFormationProvisionedProduct:
      'AWS::ServiceCatalog::CloudFormationProvisionedProduct',
  ResourceType.awsServiceCatalogCloudFormationProduct:
      'AWS::ServiceCatalog::CloudFormationProduct',
  ResourceType.awsServiceCatalogPortfolio: 'AWS::ServiceCatalog::Portfolio',
  ResourceType.awsSqsQueue: 'AWS::SQS::Queue',
  ResourceType.awsKmsKey: 'AWS::KMS::Key',
  ResourceType.awsQldbLedger: 'AWS::QLDB::Ledger',
  ResourceType.awsSecretsManagerSecret: 'AWS::SecretsManager::Secret',
  ResourceType.awsSnsTopic: 'AWS::SNS::Topic',
  ResourceType.awsSsmFileData: 'AWS::SSM::FileData',
};

AggregatedSourceStatus _$AggregatedSourceStatusFromJson(
    Map<String, dynamic> json) {
  return AggregatedSourceStatus(
    awsRegion: json['AwsRegion'] as String,
    lastErrorCode: json['LastErrorCode'] as String,
    lastErrorMessage: json['LastErrorMessage'] as String,
    lastUpdateStatus: _$enumDecodeNullable(
        _$AggregatedSourceStatusTypeEnumMap, json['LastUpdateStatus']),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    sourceId: json['SourceId'] as String,
    sourceType:
        _$enumDecodeNullable(_$AggregatedSourceTypeEnumMap, json['SourceType']),
  );
}

const _$AggregatedSourceStatusTypeEnumMap = {
  AggregatedSourceStatusType.failed: 'FAILED',
  AggregatedSourceStatusType.succeeded: 'SUCCEEDED',
  AggregatedSourceStatusType.outdated: 'OUTDATED',
};

const _$AggregatedSourceTypeEnumMap = {
  AggregatedSourceType.account: 'ACCOUNT',
  AggregatedSourceType.organization: 'ORGANIZATION',
};

AggregationAuthorization _$AggregationAuthorizationFromJson(
    Map<String, dynamic> json) {
  return AggregationAuthorization(
    aggregationAuthorizationArn: json['AggregationAuthorizationArn'] as String,
    authorizedAccountId: json['AuthorizedAccountId'] as String,
    authorizedAwsRegion: json['AuthorizedAwsRegion'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
  );
}

BaseConfigurationItem _$BaseConfigurationItemFromJson(
    Map<String, dynamic> json) {
  return BaseConfigurationItem(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    availabilityZone: json['availabilityZone'] as String,
    awsRegion: json['awsRegion'] as String,
    configuration: json['configuration'] as String,
    configurationItemCaptureTime: const UnixDateTimeConverter()
        .fromJson(json['configurationItemCaptureTime']),
    configurationItemStatus: _$enumDecodeNullable(
        _$ConfigurationItemStatusEnumMap, json['configurationItemStatus']),
    configurationStateId: json['configurationStateId'] as String,
    resourceCreationTime:
        const UnixDateTimeConverter().fromJson(json['resourceCreationTime']),
    resourceId: json['resourceId'] as String,
    resourceName: json['resourceName'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    supplementaryConfiguration:
        (json['supplementaryConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

const _$ConfigurationItemStatusEnumMap = {
  ConfigurationItemStatus.ok: 'OK',
  ConfigurationItemStatus.resourceDiscovered: 'ResourceDiscovered',
  ConfigurationItemStatus.resourceNotRecorded: 'ResourceNotRecorded',
  ConfigurationItemStatus.resourceDeleted: 'ResourceDeleted',
  ConfigurationItemStatus.resourceDeletedNotRecorded:
      'ResourceDeletedNotRecorded',
};

BatchGetAggregateResourceConfigResponse
    _$BatchGetAggregateResourceConfigResponseFromJson(
        Map<String, dynamic> json) {
  return BatchGetAggregateResourceConfigResponse(
    baseConfigurationItems: (json['BaseConfigurationItems'] as List)
        ?.map((e) => e == null
            ? null
            : BaseConfigurationItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedResourceIdentifiers: (json['UnprocessedResourceIdentifiers']
            as List)
        ?.map((e) => e == null
            ? null
            : AggregateResourceIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetResourceConfigResponse _$BatchGetResourceConfigResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetResourceConfigResponse(
    baseConfigurationItems: (json['baseConfigurationItems'] as List)
        ?.map((e) => e == null
            ? null
            : BaseConfigurationItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedResourceKeys: (json['unprocessedResourceKeys'] as List)
        ?.map((e) =>
            e == null ? null : ResourceKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Compliance _$ComplianceFromJson(Map<String, dynamic> json) {
  return Compliance(
    complianceContributorCount: json['ComplianceContributorCount'] == null
        ? null
        : ComplianceContributorCount.fromJson(
            json['ComplianceContributorCount'] as Map<String, dynamic>),
    complianceType:
        _$enumDecodeNullable(_$ComplianceTypeEnumMap, json['ComplianceType']),
  );
}

ComplianceByConfigRule _$ComplianceByConfigRuleFromJson(
    Map<String, dynamic> json) {
  return ComplianceByConfigRule(
    compliance: json['Compliance'] == null
        ? null
        : Compliance.fromJson(json['Compliance'] as Map<String, dynamic>),
    configRuleName: json['ConfigRuleName'] as String,
  );
}

ComplianceByResource _$ComplianceByResourceFromJson(Map<String, dynamic> json) {
  return ComplianceByResource(
    compliance: json['Compliance'] == null
        ? null
        : Compliance.fromJson(json['Compliance'] as Map<String, dynamic>),
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
  );
}

ComplianceContributorCount _$ComplianceContributorCountFromJson(
    Map<String, dynamic> json) {
  return ComplianceContributorCount(
    capExceeded: json['CapExceeded'] as bool,
    cappedCount: json['CappedCount'] as int,
  );
}

ComplianceSummary _$ComplianceSummaryFromJson(Map<String, dynamic> json) {
  return ComplianceSummary(
    complianceSummaryTimestamp: const UnixDateTimeConverter()
        .fromJson(json['ComplianceSummaryTimestamp']),
    compliantResourceCount: json['CompliantResourceCount'] == null
        ? null
        : ComplianceContributorCount.fromJson(
            json['CompliantResourceCount'] as Map<String, dynamic>),
    nonCompliantResourceCount: json['NonCompliantResourceCount'] == null
        ? null
        : ComplianceContributorCount.fromJson(
            json['NonCompliantResourceCount'] as Map<String, dynamic>),
  );
}

ComplianceSummaryByResourceType _$ComplianceSummaryByResourceTypeFromJson(
    Map<String, dynamic> json) {
  return ComplianceSummaryByResourceType(
    complianceSummary: json['ComplianceSummary'] == null
        ? null
        : ComplianceSummary.fromJson(
            json['ComplianceSummary'] as Map<String, dynamic>),
    resourceType: json['ResourceType'] as String,
  );
}

ConfigExportDeliveryInfo _$ConfigExportDeliveryInfoFromJson(
    Map<String, dynamic> json) {
  return ConfigExportDeliveryInfo(
    lastAttemptTime:
        const UnixDateTimeConverter().fromJson(json['lastAttemptTime']),
    lastErrorCode: json['lastErrorCode'] as String,
    lastErrorMessage: json['lastErrorMessage'] as String,
    lastStatus:
        _$enumDecodeNullable(_$DeliveryStatusEnumMap, json['lastStatus']),
    lastSuccessfulTime:
        const UnixDateTimeConverter().fromJson(json['lastSuccessfulTime']),
    nextDeliveryTime:
        const UnixDateTimeConverter().fromJson(json['nextDeliveryTime']),
  );
}

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.success: 'Success',
  DeliveryStatus.failure: 'Failure',
  DeliveryStatus.notApplicable: 'Not_Applicable',
};

ConfigRule _$ConfigRuleFromJson(Map<String, dynamic> json) {
  return ConfigRule(
    source: json['Source'] == null
        ? null
        : Source.fromJson(json['Source'] as Map<String, dynamic>),
    configRuleArn: json['ConfigRuleArn'] as String,
    configRuleId: json['ConfigRuleId'] as String,
    configRuleName: json['ConfigRuleName'] as String,
    configRuleState:
        _$enumDecodeNullable(_$ConfigRuleStateEnumMap, json['ConfigRuleState']),
    createdBy: json['CreatedBy'] as String,
    description: json['Description'] as String,
    inputParameters: json['InputParameters'] as String,
    maximumExecutionFrequency: _$enumDecodeNullable(
        _$MaximumExecutionFrequencyEnumMap, json['MaximumExecutionFrequency']),
    scope: json['Scope'] == null
        ? null
        : Scope.fromJson(json['Scope'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConfigRuleToJson(ConfigRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Source', instance.source?.toJson());
  writeNotNull('ConfigRuleArn', instance.configRuleArn);
  writeNotNull('ConfigRuleId', instance.configRuleId);
  writeNotNull('ConfigRuleName', instance.configRuleName);
  writeNotNull(
      'ConfigRuleState', _$ConfigRuleStateEnumMap[instance.configRuleState]);
  writeNotNull('CreatedBy', instance.createdBy);
  writeNotNull('Description', instance.description);
  writeNotNull('InputParameters', instance.inputParameters);
  writeNotNull('MaximumExecutionFrequency',
      _$MaximumExecutionFrequencyEnumMap[instance.maximumExecutionFrequency]);
  writeNotNull('Scope', instance.scope?.toJson());
  return val;
}

const _$ConfigRuleStateEnumMap = {
  ConfigRuleState.active: 'ACTIVE',
  ConfigRuleState.deleting: 'DELETING',
  ConfigRuleState.deletingResults: 'DELETING_RESULTS',
  ConfigRuleState.evaluating: 'EVALUATING',
};

const _$MaximumExecutionFrequencyEnumMap = {
  MaximumExecutionFrequency.oneHour: 'One_Hour',
  MaximumExecutionFrequency.threeHours: 'Three_Hours',
  MaximumExecutionFrequency.sixHours: 'Six_Hours',
  MaximumExecutionFrequency.twelveHours: 'Twelve_Hours',
  MaximumExecutionFrequency.twentyFourHours: 'TwentyFour_Hours',
};

Map<String, dynamic> _$ConfigRuleComplianceFiltersToJson(
    ConfigRuleComplianceFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('AwsRegion', instance.awsRegion);
  writeNotNull(
      'ComplianceType', _$ComplianceTypeEnumMap[instance.complianceType]);
  writeNotNull('ConfigRuleName', instance.configRuleName);
  return val;
}

Map<String, dynamic> _$ConfigRuleComplianceSummaryFiltersToJson(
    ConfigRuleComplianceSummaryFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('AwsRegion', instance.awsRegion);
  return val;
}

ConfigRuleEvaluationStatus _$ConfigRuleEvaluationStatusFromJson(
    Map<String, dynamic> json) {
  return ConfigRuleEvaluationStatus(
    configRuleArn: json['ConfigRuleArn'] as String,
    configRuleId: json['ConfigRuleId'] as String,
    configRuleName: json['ConfigRuleName'] as String,
    firstActivatedTime:
        const UnixDateTimeConverter().fromJson(json['FirstActivatedTime']),
    firstEvaluationStarted: json['FirstEvaluationStarted'] as bool,
    lastDeactivatedTime:
        const UnixDateTimeConverter().fromJson(json['LastDeactivatedTime']),
    lastErrorCode: json['LastErrorCode'] as String,
    lastErrorMessage: json['LastErrorMessage'] as String,
    lastFailedEvaluationTime: const UnixDateTimeConverter()
        .fromJson(json['LastFailedEvaluationTime']),
    lastFailedInvocationTime: const UnixDateTimeConverter()
        .fromJson(json['LastFailedInvocationTime']),
    lastSuccessfulEvaluationTime: const UnixDateTimeConverter()
        .fromJson(json['LastSuccessfulEvaluationTime']),
    lastSuccessfulInvocationTime: const UnixDateTimeConverter()
        .fromJson(json['LastSuccessfulInvocationTime']),
  );
}

ConfigSnapshotDeliveryProperties _$ConfigSnapshotDeliveryPropertiesFromJson(
    Map<String, dynamic> json) {
  return ConfigSnapshotDeliveryProperties(
    deliveryFrequency: _$enumDecodeNullable(
        _$MaximumExecutionFrequencyEnumMap, json['deliveryFrequency']),
  );
}

Map<String, dynamic> _$ConfigSnapshotDeliveryPropertiesToJson(
    ConfigSnapshotDeliveryProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deliveryFrequency',
      _$MaximumExecutionFrequencyEnumMap[instance.deliveryFrequency]);
  return val;
}

ConfigStreamDeliveryInfo _$ConfigStreamDeliveryInfoFromJson(
    Map<String, dynamic> json) {
  return ConfigStreamDeliveryInfo(
    lastErrorCode: json['lastErrorCode'] as String,
    lastErrorMessage: json['lastErrorMessage'] as String,
    lastStatus:
        _$enumDecodeNullable(_$DeliveryStatusEnumMap, json['lastStatus']),
    lastStatusChangeTime:
        const UnixDateTimeConverter().fromJson(json['lastStatusChangeTime']),
  );
}

ConfigurationAggregator _$ConfigurationAggregatorFromJson(
    Map<String, dynamic> json) {
  return ConfigurationAggregator(
    accountAggregationSources: (json['AccountAggregationSources'] as List)
        ?.map((e) => e == null
            ? null
            : AccountAggregationSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    configurationAggregatorArn: json['ConfigurationAggregatorArn'] as String,
    configurationAggregatorName: json['ConfigurationAggregatorName'] as String,
    createdBy: json['CreatedBy'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    organizationAggregationSource: json['OrganizationAggregationSource'] == null
        ? null
        : OrganizationAggregationSource.fromJson(
            json['OrganizationAggregationSource'] as Map<String, dynamic>),
  );
}

ConfigurationItem _$ConfigurationItemFromJson(Map<String, dynamic> json) {
  return ConfigurationItem(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    availabilityZone: json['availabilityZone'] as String,
    awsRegion: json['awsRegion'] as String,
    configuration: json['configuration'] as String,
    configurationItemCaptureTime: const UnixDateTimeConverter()
        .fromJson(json['configurationItemCaptureTime']),
    configurationItemMD5Hash: json['configurationItemMD5Hash'] as String,
    configurationItemStatus: _$enumDecodeNullable(
        _$ConfigurationItemStatusEnumMap, json['configurationItemStatus']),
    configurationStateId: json['configurationStateId'] as String,
    relatedEvents:
        (json['relatedEvents'] as List)?.map((e) => e as String)?.toList(),
    relationships: (json['relationships'] as List)
        ?.map((e) =>
            e == null ? null : Relationship.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceCreationTime:
        const UnixDateTimeConverter().fromJson(json['resourceCreationTime']),
    resourceId: json['resourceId'] as String,
    resourceName: json['resourceName'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    supplementaryConfiguration:
        (json['supplementaryConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
  );
}

ConfigurationRecorder _$ConfigurationRecorderFromJson(
    Map<String, dynamic> json) {
  return ConfigurationRecorder(
    name: json['name'] as String,
    recordingGroup: json['recordingGroup'] == null
        ? null
        : RecordingGroup.fromJson(
            json['recordingGroup'] as Map<String, dynamic>),
    roleARN: json['roleARN'] as String,
  );
}

Map<String, dynamic> _$ConfigurationRecorderToJson(
    ConfigurationRecorder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('recordingGroup', instance.recordingGroup?.toJson());
  writeNotNull('roleARN', instance.roleARN);
  return val;
}

ConfigurationRecorderStatus _$ConfigurationRecorderStatusFromJson(
    Map<String, dynamic> json) {
  return ConfigurationRecorderStatus(
    lastErrorCode: json['lastErrorCode'] as String,
    lastErrorMessage: json['lastErrorMessage'] as String,
    lastStartTime:
        const UnixDateTimeConverter().fromJson(json['lastStartTime']),
    lastStatus:
        _$enumDecodeNullable(_$RecorderStatusEnumMap, json['lastStatus']),
    lastStatusChangeTime:
        const UnixDateTimeConverter().fromJson(json['lastStatusChangeTime']),
    lastStopTime: const UnixDateTimeConverter().fromJson(json['lastStopTime']),
    name: json['name'] as String,
    recording: json['recording'] as bool,
  );
}

const _$RecorderStatusEnumMap = {
  RecorderStatus.pending: 'Pending',
  RecorderStatus.success: 'Success',
  RecorderStatus.failure: 'Failure',
};

Map<String, dynamic> _$ConformancePackComplianceFiltersToJson(
    ConformancePackComplianceFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComplianceType',
      _$ConformancePackComplianceTypeEnumMap[instance.complianceType]);
  writeNotNull('ConfigRuleNames', instance.configRuleNames);
  return val;
}

const _$ConformancePackComplianceTypeEnumMap = {
  ConformancePackComplianceType.compliant: 'COMPLIANT',
  ConformancePackComplianceType.nonCompliant: 'NON_COMPLIANT',
};

ConformancePackComplianceSummary _$ConformancePackComplianceSummaryFromJson(
    Map<String, dynamic> json) {
  return ConformancePackComplianceSummary(
    conformancePackComplianceStatus: _$enumDecodeNullable(
        _$ConformancePackComplianceTypeEnumMap,
        json['ConformancePackComplianceStatus']),
    conformancePackName: json['ConformancePackName'] as String,
  );
}

ConformancePackDetail _$ConformancePackDetailFromJson(
    Map<String, dynamic> json) {
  return ConformancePackDetail(
    conformancePackArn: json['ConformancePackArn'] as String,
    conformancePackId: json['ConformancePackId'] as String,
    conformancePackName: json['ConformancePackName'] as String,
    conformancePackInputParameters: (json['ConformancePackInputParameters']
            as List)
        ?.map((e) => e == null
            ? null
            : ConformancePackInputParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdBy: json['CreatedBy'] as String,
    deliveryS3Bucket: json['DeliveryS3Bucket'] as String,
    deliveryS3KeyPrefix: json['DeliveryS3KeyPrefix'] as String,
    lastUpdateRequestedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateRequestedTime']),
  );
}

Map<String, dynamic> _$ConformancePackEvaluationFiltersToJson(
    ConformancePackEvaluationFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComplianceType',
      _$ConformancePackComplianceTypeEnumMap[instance.complianceType]);
  writeNotNull('ConfigRuleNames', instance.configRuleNames);
  writeNotNull('ResourceIds', instance.resourceIds);
  writeNotNull('ResourceType', instance.resourceType);
  return val;
}

ConformancePackEvaluationResult _$ConformancePackEvaluationResultFromJson(
    Map<String, dynamic> json) {
  return ConformancePackEvaluationResult(
    complianceType: _$enumDecodeNullable(
        _$ConformancePackComplianceTypeEnumMap, json['ComplianceType']),
    configRuleInvokedTime:
        const UnixDateTimeConverter().fromJson(json['ConfigRuleInvokedTime']),
    evaluationResultIdentifier: json['EvaluationResultIdentifier'] == null
        ? null
        : EvaluationResultIdentifier.fromJson(
            json['EvaluationResultIdentifier'] as Map<String, dynamic>),
    resultRecordedTime:
        const UnixDateTimeConverter().fromJson(json['ResultRecordedTime']),
    annotation: json['Annotation'] as String,
  );
}

ConformancePackInputParameter _$ConformancePackInputParameterFromJson(
    Map<String, dynamic> json) {
  return ConformancePackInputParameter(
    parameterName: json['ParameterName'] as String,
    parameterValue: json['ParameterValue'] as String,
  );
}

Map<String, dynamic> _$ConformancePackInputParameterToJson(
    ConformancePackInputParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterName', instance.parameterName);
  writeNotNull('ParameterValue', instance.parameterValue);
  return val;
}

ConformancePackRuleCompliance _$ConformancePackRuleComplianceFromJson(
    Map<String, dynamic> json) {
  return ConformancePackRuleCompliance(
    complianceType: _$enumDecodeNullable(
        _$ConformancePackComplianceTypeEnumMap, json['ComplianceType']),
    configRuleName: json['ConfigRuleName'] as String,
  );
}

ConformancePackStatusDetail _$ConformancePackStatusDetailFromJson(
    Map<String, dynamic> json) {
  return ConformancePackStatusDetail(
    conformancePackArn: json['ConformancePackArn'] as String,
    conformancePackId: json['ConformancePackId'] as String,
    conformancePackName: json['ConformancePackName'] as String,
    conformancePackState: _$enumDecodeNullable(
        _$ConformancePackStateEnumMap, json['ConformancePackState']),
    lastUpdateRequestedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateRequestedTime']),
    stackArn: json['StackArn'] as String,
    conformancePackStatusReason: json['ConformancePackStatusReason'] as String,
    lastUpdateCompletedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateCompletedTime']),
  );
}

const _$ConformancePackStateEnumMap = {
  ConformancePackState.createInProgress: 'CREATE_IN_PROGRESS',
  ConformancePackState.createComplete: 'CREATE_COMPLETE',
  ConformancePackState.createFailed: 'CREATE_FAILED',
  ConformancePackState.deleteInProgress: 'DELETE_IN_PROGRESS',
  ConformancePackState.deleteFailed: 'DELETE_FAILED',
};

DeleteEvaluationResultsResponse _$DeleteEvaluationResultsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEvaluationResultsResponse();
}

DeleteRemediationConfigurationResponse
    _$DeleteRemediationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteRemediationConfigurationResponse();
}

DeleteRemediationExceptionsResponse
    _$DeleteRemediationExceptionsResponseFromJson(Map<String, dynamic> json) {
  return DeleteRemediationExceptionsResponse(
    failedBatches: (json['FailedBatches'] as List)
        ?.map((e) => e == null
            ? null
            : FailedDeleteRemediationExceptionsBatch.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteStoredQueryResponse _$DeleteStoredQueryResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteStoredQueryResponse();
}

DeliverConfigSnapshotResponse _$DeliverConfigSnapshotResponseFromJson(
    Map<String, dynamic> json) {
  return DeliverConfigSnapshotResponse(
    configSnapshotId: json['configSnapshotId'] as String,
  );
}

DeliveryChannel _$DeliveryChannelFromJson(Map<String, dynamic> json) {
  return DeliveryChannel(
    configSnapshotDeliveryProperties:
        json['configSnapshotDeliveryProperties'] == null
            ? null
            : ConfigSnapshotDeliveryProperties.fromJson(
                json['configSnapshotDeliveryProperties']
                    as Map<String, dynamic>),
    name: json['name'] as String,
    s3BucketName: json['s3BucketName'] as String,
    s3KeyPrefix: json['s3KeyPrefix'] as String,
    snsTopicARN: json['snsTopicARN'] as String,
  );
}

Map<String, dynamic> _$DeliveryChannelToJson(DeliveryChannel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configSnapshotDeliveryProperties',
      instance.configSnapshotDeliveryProperties?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('s3BucketName', instance.s3BucketName);
  writeNotNull('s3KeyPrefix', instance.s3KeyPrefix);
  writeNotNull('snsTopicARN', instance.snsTopicARN);
  return val;
}

DeliveryChannelStatus _$DeliveryChannelStatusFromJson(
    Map<String, dynamic> json) {
  return DeliveryChannelStatus(
    configHistoryDeliveryInfo: json['configHistoryDeliveryInfo'] == null
        ? null
        : ConfigExportDeliveryInfo.fromJson(
            json['configHistoryDeliveryInfo'] as Map<String, dynamic>),
    configSnapshotDeliveryInfo: json['configSnapshotDeliveryInfo'] == null
        ? null
        : ConfigExportDeliveryInfo.fromJson(
            json['configSnapshotDeliveryInfo'] as Map<String, dynamic>),
    configStreamDeliveryInfo: json['configStreamDeliveryInfo'] == null
        ? null
        : ConfigStreamDeliveryInfo.fromJson(
            json['configStreamDeliveryInfo'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

DescribeAggregateComplianceByConfigRulesResponse
    _$DescribeAggregateComplianceByConfigRulesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAggregateComplianceByConfigRulesResponse(
    aggregateComplianceByConfigRules:
        (json['AggregateComplianceByConfigRules'] as List)
            ?.map((e) => e == null
                ? null
                : AggregateComplianceByConfigRule.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeAggregationAuthorizationsResponse
    _$DescribeAggregationAuthorizationsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeAggregationAuthorizationsResponse(
    aggregationAuthorizations: (json['AggregationAuthorizations'] as List)
        ?.map((e) => e == null
            ? null
            : AggregationAuthorization.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeComplianceByConfigRuleResponse
    _$DescribeComplianceByConfigRuleResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeComplianceByConfigRuleResponse(
    complianceByConfigRules: (json['ComplianceByConfigRules'] as List)
        ?.map((e) => e == null
            ? null
            : ComplianceByConfigRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeComplianceByResourceResponse
    _$DescribeComplianceByResourceResponseFromJson(Map<String, dynamic> json) {
  return DescribeComplianceByResourceResponse(
    complianceByResources: (json['ComplianceByResources'] as List)
        ?.map((e) => e == null
            ? null
            : ComplianceByResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConfigRuleEvaluationStatusResponse
    _$DescribeConfigRuleEvaluationStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeConfigRuleEvaluationStatusResponse(
    configRulesEvaluationStatus: (json['ConfigRulesEvaluationStatus'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConfigRulesResponse _$DescribeConfigRulesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConfigRulesResponse(
    configRules: (json['ConfigRules'] as List)
        ?.map((e) =>
            e == null ? null : ConfigRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConfigurationAggregatorSourcesStatusResponse
    _$DescribeConfigurationAggregatorSourcesStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeConfigurationAggregatorSourcesStatusResponse(
    aggregatedSourceStatusList: (json['AggregatedSourceStatusList'] as List)
        ?.map((e) => e == null
            ? null
            : AggregatedSourceStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConfigurationAggregatorsResponse
    _$DescribeConfigurationAggregatorsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeConfigurationAggregatorsResponse(
    configurationAggregators: (json['ConfigurationAggregators'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationAggregator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConfigurationRecorderStatusResponse
    _$DescribeConfigurationRecorderStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeConfigurationRecorderStatusResponse(
    configurationRecordersStatus: (json['ConfigurationRecordersStatus'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationRecorderStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeConfigurationRecordersResponse
    _$DescribeConfigurationRecordersResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeConfigurationRecordersResponse(
    configurationRecorders: (json['ConfigurationRecorders'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationRecorder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeConformancePackComplianceResponse
    _$DescribeConformancePackComplianceResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeConformancePackComplianceResponse(
    conformancePackName: json['ConformancePackName'] as String,
    conformancePackRuleComplianceList:
        (json['ConformancePackRuleComplianceList'] as List)
            ?.map((e) => e == null
                ? null
                : ConformancePackRuleCompliance.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConformancePackStatusResponse
    _$DescribeConformancePackStatusResponseFromJson(Map<String, dynamic> json) {
  return DescribeConformancePackStatusResponse(
    conformancePackStatusDetails: (json['ConformancePackStatusDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ConformancePackStatusDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeConformancePacksResponse _$DescribeConformancePacksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConformancePacksResponse(
    conformancePackDetails: (json['ConformancePackDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ConformancePackDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeDeliveryChannelStatusResponse
    _$DescribeDeliveryChannelStatusResponseFromJson(Map<String, dynamic> json) {
  return DescribeDeliveryChannelStatusResponse(
    deliveryChannelsStatus: (json['DeliveryChannelsStatus'] as List)
        ?.map((e) => e == null
            ? null
            : DeliveryChannelStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeDeliveryChannelsResponse _$DescribeDeliveryChannelsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeliveryChannelsResponse(
    deliveryChannels: (json['DeliveryChannels'] as List)
        ?.map((e) => e == null
            ? null
            : DeliveryChannel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeOrganizationConfigRuleStatusesResponse
    _$DescribeOrganizationConfigRuleStatusesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConfigRuleStatusesResponse(
    nextToken: json['NextToken'] as String,
    organizationConfigRuleStatuses: (json['OrganizationConfigRuleStatuses']
            as List)
        ?.map((e) => e == null
            ? null
            : OrganizationConfigRuleStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeOrganizationConfigRulesResponse
    _$DescribeOrganizationConfigRulesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConfigRulesResponse(
    nextToken: json['NextToken'] as String,
    organizationConfigRules: (json['OrganizationConfigRules'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationConfigRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeOrganizationConformancePackStatusesResponse
    _$DescribeOrganizationConformancePackStatusesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConformancePackStatusesResponse(
    nextToken: json['NextToken'] as String,
    organizationConformancePackStatuses:
        (json['OrganizationConformancePackStatuses'] as List)
            ?.map((e) => e == null
                ? null
                : OrganizationConformancePackStatus.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeOrganizationConformancePacksResponse
    _$DescribeOrganizationConformancePacksResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConformancePacksResponse(
    nextToken: json['NextToken'] as String,
    organizationConformancePacks: (json['OrganizationConformancePacks'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationConformancePack.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribePendingAggregationRequestsResponse
    _$DescribePendingAggregationRequestsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribePendingAggregationRequestsResponse(
    nextToken: json['NextToken'] as String,
    pendingAggregationRequests: (json['PendingAggregationRequests'] as List)
        ?.map((e) => e == null
            ? null
            : PendingAggregationRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRemediationConfigurationsResponse
    _$DescribeRemediationConfigurationsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeRemediationConfigurationsResponse(
    remediationConfigurations: (json['RemediationConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRemediationExceptionsResponse
    _$DescribeRemediationExceptionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeRemediationExceptionsResponse(
    nextToken: json['NextToken'] as String,
    remediationExceptions: (json['RemediationExceptions'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationException.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRemediationExecutionStatusResponse
    _$DescribeRemediationExecutionStatusResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeRemediationExecutionStatusResponse(
    nextToken: json['NextToken'] as String,
    remediationExecutionStatuses: (json['RemediationExecutionStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationExecutionStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRetentionConfigurationsResponse
    _$DescribeRetentionConfigurationsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeRetentionConfigurationsResponse(
    nextToken: json['NextToken'] as String,
    retentionConfigurations: (json['RetentionConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : RetentionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) {
  return Evaluation(
    complianceResourceId: json['ComplianceResourceId'] as String,
    complianceResourceType: json['ComplianceResourceType'] as String,
    complianceType:
        _$enumDecodeNullable(_$ComplianceTypeEnumMap, json['ComplianceType']),
    orderingTimestamp:
        const UnixDateTimeConverter().fromJson(json['OrderingTimestamp']),
    annotation: json['Annotation'] as String,
  );
}

Map<String, dynamic> _$EvaluationToJson(Evaluation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComplianceResourceId', instance.complianceResourceId);
  writeNotNull('ComplianceResourceType', instance.complianceResourceType);
  writeNotNull(
      'ComplianceType', _$ComplianceTypeEnumMap[instance.complianceType]);
  writeNotNull('OrderingTimestamp',
      const UnixDateTimeConverter().toJson(instance.orderingTimestamp));
  writeNotNull('Annotation', instance.annotation);
  return val;
}

EvaluationResult _$EvaluationResultFromJson(Map<String, dynamic> json) {
  return EvaluationResult(
    annotation: json['Annotation'] as String,
    complianceType:
        _$enumDecodeNullable(_$ComplianceTypeEnumMap, json['ComplianceType']),
    configRuleInvokedTime:
        const UnixDateTimeConverter().fromJson(json['ConfigRuleInvokedTime']),
    evaluationResultIdentifier: json['EvaluationResultIdentifier'] == null
        ? null
        : EvaluationResultIdentifier.fromJson(
            json['EvaluationResultIdentifier'] as Map<String, dynamic>),
    resultRecordedTime:
        const UnixDateTimeConverter().fromJson(json['ResultRecordedTime']),
    resultToken: json['ResultToken'] as String,
  );
}

EvaluationResultIdentifier _$EvaluationResultIdentifierFromJson(
    Map<String, dynamic> json) {
  return EvaluationResultIdentifier(
    evaluationResultQualifier: json['EvaluationResultQualifier'] == null
        ? null
        : EvaluationResultQualifier.fromJson(
            json['EvaluationResultQualifier'] as Map<String, dynamic>),
    orderingTimestamp:
        const UnixDateTimeConverter().fromJson(json['OrderingTimestamp']),
  );
}

EvaluationResultQualifier _$EvaluationResultQualifierFromJson(
    Map<String, dynamic> json) {
  return EvaluationResultQualifier(
    configRuleName: json['ConfigRuleName'] as String,
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
  );
}

ExecutionControls _$ExecutionControlsFromJson(Map<String, dynamic> json) {
  return ExecutionControls(
    ssmControls: json['SsmControls'] == null
        ? null
        : SsmControls.fromJson(json['SsmControls'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExecutionControlsToJson(ExecutionControls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SsmControls', instance.ssmControls?.toJson());
  return val;
}

Map<String, dynamic> _$ExternalEvaluationToJson(ExternalEvaluation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComplianceResourceId', instance.complianceResourceId);
  writeNotNull('ComplianceResourceType', instance.complianceResourceType);
  writeNotNull(
      'ComplianceType', _$ComplianceTypeEnumMap[instance.complianceType]);
  writeNotNull('OrderingTimestamp',
      const UnixDateTimeConverter().toJson(instance.orderingTimestamp));
  writeNotNull('Annotation', instance.annotation);
  return val;
}

FailedDeleteRemediationExceptionsBatch
    _$FailedDeleteRemediationExceptionsBatchFromJson(
        Map<String, dynamic> json) {
  return FailedDeleteRemediationExceptionsBatch(
    failedItems: (json['FailedItems'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationExceptionResourceKey.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    failureMessage: json['FailureMessage'] as String,
  );
}

FailedRemediationBatch _$FailedRemediationBatchFromJson(
    Map<String, dynamic> json) {
  return FailedRemediationBatch(
    failedItems: (json['FailedItems'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureMessage: json['FailureMessage'] as String,
  );
}

FailedRemediationExceptionBatch _$FailedRemediationExceptionBatchFromJson(
    Map<String, dynamic> json) {
  return FailedRemediationExceptionBatch(
    failedItems: (json['FailedItems'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationException.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureMessage: json['FailureMessage'] as String,
  );
}

FieldInfo _$FieldInfoFromJson(Map<String, dynamic> json) {
  return FieldInfo(
    name: json['Name'] as String,
  );
}

GetAggregateComplianceDetailsByConfigRuleResponse
    _$GetAggregateComplianceDetailsByConfigRuleResponseFromJson(
        Map<String, dynamic> json) {
  return GetAggregateComplianceDetailsByConfigRuleResponse(
    aggregateEvaluationResults: (json['AggregateEvaluationResults'] as List)
        ?.map((e) => e == null
            ? null
            : AggregateEvaluationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetAggregateConfigRuleComplianceSummaryResponse
    _$GetAggregateConfigRuleComplianceSummaryResponseFromJson(
        Map<String, dynamic> json) {
  return GetAggregateConfigRuleComplianceSummaryResponse(
    aggregateComplianceCounts: (json['AggregateComplianceCounts'] as List)
        ?.map((e) => e == null
            ? null
            : AggregateComplianceCount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    groupByKey: json['GroupByKey'] as String,
    nextToken: json['NextToken'] as String,
  );
}

GetAggregateDiscoveredResourceCountsResponse
    _$GetAggregateDiscoveredResourceCountsResponseFromJson(
        Map<String, dynamic> json) {
  return GetAggregateDiscoveredResourceCountsResponse(
    totalDiscoveredResources: json['TotalDiscoveredResources'] as int,
    groupByKey: json['GroupByKey'] as String,
    groupedResourceCounts: (json['GroupedResourceCounts'] as List)
        ?.map((e) => e == null
            ? null
            : GroupedResourceCount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetAggregateResourceConfigResponse _$GetAggregateResourceConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetAggregateResourceConfigResponse(
    configurationItem: json['ConfigurationItem'] == null
        ? null
        : ConfigurationItem.fromJson(
            json['ConfigurationItem'] as Map<String, dynamic>),
  );
}

GetComplianceDetailsByConfigRuleResponse
    _$GetComplianceDetailsByConfigRuleResponseFromJson(
        Map<String, dynamic> json) {
  return GetComplianceDetailsByConfigRuleResponse(
    evaluationResults: (json['EvaluationResults'] as List)
        ?.map((e) => e == null
            ? null
            : EvaluationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetComplianceDetailsByResourceResponse
    _$GetComplianceDetailsByResourceResponseFromJson(
        Map<String, dynamic> json) {
  return GetComplianceDetailsByResourceResponse(
    evaluationResults: (json['EvaluationResults'] as List)
        ?.map((e) => e == null
            ? null
            : EvaluationResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetComplianceSummaryByConfigRuleResponse
    _$GetComplianceSummaryByConfigRuleResponseFromJson(
        Map<String, dynamic> json) {
  return GetComplianceSummaryByConfigRuleResponse(
    complianceSummary: json['ComplianceSummary'] == null
        ? null
        : ComplianceSummary.fromJson(
            json['ComplianceSummary'] as Map<String, dynamic>),
  );
}

GetComplianceSummaryByResourceTypeResponse
    _$GetComplianceSummaryByResourceTypeResponseFromJson(
        Map<String, dynamic> json) {
  return GetComplianceSummaryByResourceTypeResponse(
    complianceSummariesByResourceType:
        (json['ComplianceSummariesByResourceType'] as List)
            ?.map((e) => e == null
                ? null
                : ComplianceSummaryByResourceType.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

GetConformancePackComplianceDetailsResponse
    _$GetConformancePackComplianceDetailsResponseFromJson(
        Map<String, dynamic> json) {
  return GetConformancePackComplianceDetailsResponse(
    conformancePackName: json['ConformancePackName'] as String,
    conformancePackRuleEvaluationResults:
        (json['ConformancePackRuleEvaluationResults'] as List)
            ?.map((e) => e == null
                ? null
                : ConformancePackEvaluationResult.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetConformancePackComplianceSummaryResponse
    _$GetConformancePackComplianceSummaryResponseFromJson(
        Map<String, dynamic> json) {
  return GetConformancePackComplianceSummaryResponse(
    conformancePackComplianceSummaryList:
        (json['ConformancePackComplianceSummaryList'] as List)
            ?.map((e) => e == null
                ? null
                : ConformancePackComplianceSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetDiscoveredResourceCountsResponse
    _$GetDiscoveredResourceCountsResponseFromJson(Map<String, dynamic> json) {
  return GetDiscoveredResourceCountsResponse(
    nextToken: json['nextToken'] as String,
    resourceCounts: (json['resourceCounts'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceCount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalDiscoveredResources: json['totalDiscoveredResources'] as int,
  );
}

GetOrganizationConfigRuleDetailedStatusResponse
    _$GetOrganizationConfigRuleDetailedStatusResponseFromJson(
        Map<String, dynamic> json) {
  return GetOrganizationConfigRuleDetailedStatusResponse(
    nextToken: json['NextToken'] as String,
    organizationConfigRuleDetailedStatus:
        (json['OrganizationConfigRuleDetailedStatus'] as List)
            ?.map((e) => e == null
                ? null
                : MemberAccountStatus.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

GetOrganizationConformancePackDetailedStatusResponse
    _$GetOrganizationConformancePackDetailedStatusResponseFromJson(
        Map<String, dynamic> json) {
  return GetOrganizationConformancePackDetailedStatusResponse(
    nextToken: json['NextToken'] as String,
    organizationConformancePackDetailedStatuses:
        (json['OrganizationConformancePackDetailedStatuses'] as List)
            ?.map((e) => e == null
                ? null
                : OrganizationConformancePackDetailedStatus.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

GetResourceConfigHistoryResponse _$GetResourceConfigHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourceConfigHistoryResponse(
    configurationItems: (json['configurationItems'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetStoredQueryResponse _$GetStoredQueryResponseFromJson(
    Map<String, dynamic> json) {
  return GetStoredQueryResponse(
    storedQuery: json['StoredQuery'] == null
        ? null
        : StoredQuery.fromJson(json['StoredQuery'] as Map<String, dynamic>),
  );
}

GroupedResourceCount _$GroupedResourceCountFromJson(Map<String, dynamic> json) {
  return GroupedResourceCount(
    groupName: json['GroupName'] as String,
    resourceCount: json['ResourceCount'] as int,
  );
}

ListAggregateDiscoveredResourcesResponse
    _$ListAggregateDiscoveredResourcesResponseFromJson(
        Map<String, dynamic> json) {
  return ListAggregateDiscoveredResourcesResponse(
    nextToken: json['NextToken'] as String,
    resourceIdentifiers: (json['ResourceIdentifiers'] as List)
        ?.map((e) => e == null
            ? null
            : AggregateResourceIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListDiscoveredResourcesResponse _$ListDiscoveredResourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDiscoveredResourcesResponse(
    nextToken: json['nextToken'] as String,
    resourceIdentifiers: (json['resourceIdentifiers'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListStoredQueriesResponse _$ListStoredQueriesResponseFromJson(
    Map<String, dynamic> json) {
  return ListStoredQueriesResponse(
    nextToken: json['NextToken'] as String,
    storedQueryMetadata: (json['StoredQueryMetadata'] as List)
        ?.map((e) => e == null
            ? null
            : StoredQueryMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MemberAccountStatus _$MemberAccountStatusFromJson(Map<String, dynamic> json) {
  return MemberAccountStatus(
    accountId: json['AccountId'] as String,
    configRuleName: json['ConfigRuleName'] as String,
    memberAccountRuleStatus: _$enumDecodeNullable(
        _$MemberAccountRuleStatusEnumMap, json['MemberAccountRuleStatus']),
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
  );
}

const _$MemberAccountRuleStatusEnumMap = {
  MemberAccountRuleStatus.createSuccessful: 'CREATE_SUCCESSFUL',
  MemberAccountRuleStatus.createInProgress: 'CREATE_IN_PROGRESS',
  MemberAccountRuleStatus.createFailed: 'CREATE_FAILED',
  MemberAccountRuleStatus.deleteSuccessful: 'DELETE_SUCCESSFUL',
  MemberAccountRuleStatus.deleteFailed: 'DELETE_FAILED',
  MemberAccountRuleStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  MemberAccountRuleStatus.updateSuccessful: 'UPDATE_SUCCESSFUL',
  MemberAccountRuleStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  MemberAccountRuleStatus.updateFailed: 'UPDATE_FAILED',
};

OrganizationAggregationSource _$OrganizationAggregationSourceFromJson(
    Map<String, dynamic> json) {
  return OrganizationAggregationSource(
    roleArn: json['RoleArn'] as String,
    allAwsRegions: json['AllAwsRegions'] as bool,
    awsRegions: (json['AwsRegions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OrganizationAggregationSourceToJson(
    OrganizationAggregationSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('AllAwsRegions', instance.allAwsRegions);
  writeNotNull('AwsRegions', instance.awsRegions);
  return val;
}

OrganizationConfigRule _$OrganizationConfigRuleFromJson(
    Map<String, dynamic> json) {
  return OrganizationConfigRule(
    organizationConfigRuleArn: json['OrganizationConfigRuleArn'] as String,
    organizationConfigRuleName: json['OrganizationConfigRuleName'] as String,
    excludedAccounts:
        (json['ExcludedAccounts'] as List)?.map((e) => e as String)?.toList(),
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    organizationCustomRuleMetadata:
        json['OrganizationCustomRuleMetadata'] == null
            ? null
            : OrganizationCustomRuleMetadata.fromJson(
                json['OrganizationCustomRuleMetadata'] as Map<String, dynamic>),
    organizationManagedRuleMetadata: json['OrganizationManagedRuleMetadata'] ==
            null
        ? null
        : OrganizationManagedRuleMetadata.fromJson(
            json['OrganizationManagedRuleMetadata'] as Map<String, dynamic>),
  );
}

OrganizationConfigRuleStatus _$OrganizationConfigRuleStatusFromJson(
    Map<String, dynamic> json) {
  return OrganizationConfigRuleStatus(
    organizationConfigRuleName: json['OrganizationConfigRuleName'] as String,
    organizationRuleStatus: _$enumDecodeNullable(
        _$OrganizationRuleStatusEnumMap, json['OrganizationRuleStatus']),
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
  );
}

const _$OrganizationRuleStatusEnumMap = {
  OrganizationRuleStatus.createSuccessful: 'CREATE_SUCCESSFUL',
  OrganizationRuleStatus.createInProgress: 'CREATE_IN_PROGRESS',
  OrganizationRuleStatus.createFailed: 'CREATE_FAILED',
  OrganizationRuleStatus.deleteSuccessful: 'DELETE_SUCCESSFUL',
  OrganizationRuleStatus.deleteFailed: 'DELETE_FAILED',
  OrganizationRuleStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  OrganizationRuleStatus.updateSuccessful: 'UPDATE_SUCCESSFUL',
  OrganizationRuleStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  OrganizationRuleStatus.updateFailed: 'UPDATE_FAILED',
};

OrganizationConformancePack _$OrganizationConformancePackFromJson(
    Map<String, dynamic> json) {
  return OrganizationConformancePack(
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
    organizationConformancePackArn:
        json['OrganizationConformancePackArn'] as String,
    organizationConformancePackName:
        json['OrganizationConformancePackName'] as String,
    conformancePackInputParameters: (json['ConformancePackInputParameters']
            as List)
        ?.map((e) => e == null
            ? null
            : ConformancePackInputParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deliveryS3Bucket: json['DeliveryS3Bucket'] as String,
    deliveryS3KeyPrefix: json['DeliveryS3KeyPrefix'] as String,
    excludedAccounts:
        (json['ExcludedAccounts'] as List)?.map((e) => e as String)?.toList(),
  );
}

OrganizationConformancePackDetailedStatus
    _$OrganizationConformancePackDetailedStatusFromJson(
        Map<String, dynamic> json) {
  return OrganizationConformancePackDetailedStatus(
    accountId: json['AccountId'] as String,
    conformancePackName: json['ConformancePackName'] as String,
    status: _$enumDecodeNullable(
        _$OrganizationResourceDetailedStatusEnumMap, json['Status']),
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
  );
}

const _$OrganizationResourceDetailedStatusEnumMap = {
  OrganizationResourceDetailedStatus.createSuccessful: 'CREATE_SUCCESSFUL',
  OrganizationResourceDetailedStatus.createInProgress: 'CREATE_IN_PROGRESS',
  OrganizationResourceDetailedStatus.createFailed: 'CREATE_FAILED',
  OrganizationResourceDetailedStatus.deleteSuccessful: 'DELETE_SUCCESSFUL',
  OrganizationResourceDetailedStatus.deleteFailed: 'DELETE_FAILED',
  OrganizationResourceDetailedStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  OrganizationResourceDetailedStatus.updateSuccessful: 'UPDATE_SUCCESSFUL',
  OrganizationResourceDetailedStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  OrganizationResourceDetailedStatus.updateFailed: 'UPDATE_FAILED',
};

OrganizationConformancePackStatus _$OrganizationConformancePackStatusFromJson(
    Map<String, dynamic> json) {
  return OrganizationConformancePackStatus(
    organizationConformancePackName:
        json['OrganizationConformancePackName'] as String,
    status: _$enumDecodeNullable(
        _$OrganizationResourceStatusEnumMap, json['Status']),
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    lastUpdateTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTime']),
  );
}

const _$OrganizationResourceStatusEnumMap = {
  OrganizationResourceStatus.createSuccessful: 'CREATE_SUCCESSFUL',
  OrganizationResourceStatus.createInProgress: 'CREATE_IN_PROGRESS',
  OrganizationResourceStatus.createFailed: 'CREATE_FAILED',
  OrganizationResourceStatus.deleteSuccessful: 'DELETE_SUCCESSFUL',
  OrganizationResourceStatus.deleteFailed: 'DELETE_FAILED',
  OrganizationResourceStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  OrganizationResourceStatus.updateSuccessful: 'UPDATE_SUCCESSFUL',
  OrganizationResourceStatus.updateInProgress: 'UPDATE_IN_PROGRESS',
  OrganizationResourceStatus.updateFailed: 'UPDATE_FAILED',
};

OrganizationCustomRuleMetadata _$OrganizationCustomRuleMetadataFromJson(
    Map<String, dynamic> json) {
  return OrganizationCustomRuleMetadata(
    lambdaFunctionArn: json['LambdaFunctionArn'] as String,
    organizationConfigRuleTriggerTypes:
        (json['OrganizationConfigRuleTriggerTypes'] as List)
            ?.map((e) => _$enumDecodeNullable(
                _$OrganizationConfigRuleTriggerTypeEnumMap, e))
            ?.toList(),
    description: json['Description'] as String,
    inputParameters: json['InputParameters'] as String,
    maximumExecutionFrequency: _$enumDecodeNullable(
        _$MaximumExecutionFrequencyEnumMap, json['MaximumExecutionFrequency']),
    resourceIdScope: json['ResourceIdScope'] as String,
    resourceTypesScope:
        (json['ResourceTypesScope'] as List)?.map((e) => e as String)?.toList(),
    tagKeyScope: json['TagKeyScope'] as String,
    tagValueScope: json['TagValueScope'] as String,
  );
}

Map<String, dynamic> _$OrganizationCustomRuleMetadataToJson(
    OrganizationCustomRuleMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LambdaFunctionArn', instance.lambdaFunctionArn);
  writeNotNull(
      'OrganizationConfigRuleTriggerTypes',
      instance.organizationConfigRuleTriggerTypes
          ?.map((e) => _$OrganizationConfigRuleTriggerTypeEnumMap[e])
          ?.toList());
  writeNotNull('Description', instance.description);
  writeNotNull('InputParameters', instance.inputParameters);
  writeNotNull('MaximumExecutionFrequency',
      _$MaximumExecutionFrequencyEnumMap[instance.maximumExecutionFrequency]);
  writeNotNull('ResourceIdScope', instance.resourceIdScope);
  writeNotNull('ResourceTypesScope', instance.resourceTypesScope);
  writeNotNull('TagKeyScope', instance.tagKeyScope);
  writeNotNull('TagValueScope', instance.tagValueScope);
  return val;
}

const _$OrganizationConfigRuleTriggerTypeEnumMap = {
  OrganizationConfigRuleTriggerType.configurationItemChangeNotification:
      'ConfigurationItemChangeNotification',
  OrganizationConfigRuleTriggerType
          .oversizedConfigurationItemChangeNotification:
      'OversizedConfigurationItemChangeNotification',
  OrganizationConfigRuleTriggerType.scheduledNotification:
      'ScheduledNotification',
};

OrganizationManagedRuleMetadata _$OrganizationManagedRuleMetadataFromJson(
    Map<String, dynamic> json) {
  return OrganizationManagedRuleMetadata(
    ruleIdentifier: json['RuleIdentifier'] as String,
    description: json['Description'] as String,
    inputParameters: json['InputParameters'] as String,
    maximumExecutionFrequency: _$enumDecodeNullable(
        _$MaximumExecutionFrequencyEnumMap, json['MaximumExecutionFrequency']),
    resourceIdScope: json['ResourceIdScope'] as String,
    resourceTypesScope:
        (json['ResourceTypesScope'] as List)?.map((e) => e as String)?.toList(),
    tagKeyScope: json['TagKeyScope'] as String,
    tagValueScope: json['TagValueScope'] as String,
  );
}

Map<String, dynamic> _$OrganizationManagedRuleMetadataToJson(
    OrganizationManagedRuleMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleIdentifier', instance.ruleIdentifier);
  writeNotNull('Description', instance.description);
  writeNotNull('InputParameters', instance.inputParameters);
  writeNotNull('MaximumExecutionFrequency',
      _$MaximumExecutionFrequencyEnumMap[instance.maximumExecutionFrequency]);
  writeNotNull('ResourceIdScope', instance.resourceIdScope);
  writeNotNull('ResourceTypesScope', instance.resourceTypesScope);
  writeNotNull('TagKeyScope', instance.tagKeyScope);
  writeNotNull('TagValueScope', instance.tagValueScope);
  return val;
}

Map<String, dynamic> _$OrganizationResourceDetailedStatusFiltersToJson(
    OrganizationResourceDetailedStatusFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull(
      'Status', _$OrganizationResourceDetailedStatusEnumMap[instance.status]);
  return val;
}

PendingAggregationRequest _$PendingAggregationRequestFromJson(
    Map<String, dynamic> json) {
  return PendingAggregationRequest(
    requesterAccountId: json['RequesterAccountId'] as String,
    requesterAwsRegion: json['RequesterAwsRegion'] as String,
  );
}

PutAggregationAuthorizationResponse
    _$PutAggregationAuthorizationResponseFromJson(Map<String, dynamic> json) {
  return PutAggregationAuthorizationResponse(
    aggregationAuthorization: json['AggregationAuthorization'] == null
        ? null
        : AggregationAuthorization.fromJson(
            json['AggregationAuthorization'] as Map<String, dynamic>),
  );
}

PutConfigurationAggregatorResponse _$PutConfigurationAggregatorResponseFromJson(
    Map<String, dynamic> json) {
  return PutConfigurationAggregatorResponse(
    configurationAggregator: json['ConfigurationAggregator'] == null
        ? null
        : ConfigurationAggregator.fromJson(
            json['ConfigurationAggregator'] as Map<String, dynamic>),
  );
}

PutConformancePackResponse _$PutConformancePackResponseFromJson(
    Map<String, dynamic> json) {
  return PutConformancePackResponse(
    conformancePackArn: json['ConformancePackArn'] as String,
  );
}

PutEvaluationsResponse _$PutEvaluationsResponseFromJson(
    Map<String, dynamic> json) {
  return PutEvaluationsResponse(
    failedEvaluations: (json['FailedEvaluations'] as List)
        ?.map((e) =>
            e == null ? null : Evaluation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutExternalEvaluationResponse _$PutExternalEvaluationResponseFromJson(
    Map<String, dynamic> json) {
  return PutExternalEvaluationResponse();
}

PutOrganizationConfigRuleResponse _$PutOrganizationConfigRuleResponseFromJson(
    Map<String, dynamic> json) {
  return PutOrganizationConfigRuleResponse(
    organizationConfigRuleArn: json['OrganizationConfigRuleArn'] as String,
  );
}

PutOrganizationConformancePackResponse
    _$PutOrganizationConformancePackResponseFromJson(
        Map<String, dynamic> json) {
  return PutOrganizationConformancePackResponse(
    organizationConformancePackArn:
        json['OrganizationConformancePackArn'] as String,
  );
}

PutRemediationConfigurationsResponse
    _$PutRemediationConfigurationsResponseFromJson(Map<String, dynamic> json) {
  return PutRemediationConfigurationsResponse(
    failedBatches: (json['FailedBatches'] as List)
        ?.map((e) => e == null
            ? null
            : FailedRemediationBatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutRemediationExceptionsResponse _$PutRemediationExceptionsResponseFromJson(
    Map<String, dynamic> json) {
  return PutRemediationExceptionsResponse(
    failedBatches: (json['FailedBatches'] as List)
        ?.map((e) => e == null
            ? null
            : FailedRemediationExceptionBatch.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutRetentionConfigurationResponse _$PutRetentionConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return PutRetentionConfigurationResponse(
    retentionConfiguration: json['RetentionConfiguration'] == null
        ? null
        : RetentionConfiguration.fromJson(
            json['RetentionConfiguration'] as Map<String, dynamic>),
  );
}

PutStoredQueryResponse _$PutStoredQueryResponseFromJson(
    Map<String, dynamic> json) {
  return PutStoredQueryResponse(
    queryArn: json['QueryArn'] as String,
  );
}

QueryInfo _$QueryInfoFromJson(Map<String, dynamic> json) {
  return QueryInfo(
    selectFields: (json['SelectFields'] as List)
        ?.map((e) =>
            e == null ? null : FieldInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RecordingGroup _$RecordingGroupFromJson(Map<String, dynamic> json) {
  return RecordingGroup(
    allSupported: json['allSupported'] as bool,
    includeGlobalResourceTypes: json['includeGlobalResourceTypes'] as bool,
    resourceTypes: (json['resourceTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ResourceTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecordingGroupToJson(RecordingGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allSupported', instance.allSupported);
  writeNotNull(
      'includeGlobalResourceTypes', instance.includeGlobalResourceTypes);
  writeNotNull('resourceTypes',
      instance.resourceTypes?.map((e) => _$ResourceTypeEnumMap[e])?.toList());
  return val;
}

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    relationshipName: json['relationshipName'] as String,
    resourceId: json['resourceId'] as String,
    resourceName: json['resourceName'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

RemediationConfiguration _$RemediationConfigurationFromJson(
    Map<String, dynamic> json) {
  return RemediationConfiguration(
    configRuleName: json['ConfigRuleName'] as String,
    targetId: json['TargetId'] as String,
    targetType: _$enumDecodeNullable(
        _$RemediationTargetTypeEnumMap, json['TargetType']),
    arn: json['Arn'] as String,
    automatic: json['Automatic'] as bool,
    createdByService: json['CreatedByService'] as String,
    executionControls: json['ExecutionControls'] == null
        ? null
        : ExecutionControls.fromJson(
            json['ExecutionControls'] as Map<String, dynamic>),
    maximumAutomaticAttempts: json['MaximumAutomaticAttempts'] as int,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : RemediationParameterValue.fromJson(e as Map<String, dynamic>)),
    ),
    resourceType: json['ResourceType'] as String,
    retryAttemptSeconds: json['RetryAttemptSeconds'] as int,
    targetVersion: json['TargetVersion'] as String,
  );
}

Map<String, dynamic> _$RemediationConfigurationToJson(
    RemediationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigRuleName', instance.configRuleName);
  writeNotNull('TargetId', instance.targetId);
  writeNotNull(
      'TargetType', _$RemediationTargetTypeEnumMap[instance.targetType]);
  writeNotNull('Arn', instance.arn);
  writeNotNull('Automatic', instance.automatic);
  writeNotNull('CreatedByService', instance.createdByService);
  writeNotNull('ExecutionControls', instance.executionControls?.toJson());
  writeNotNull('MaximumAutomaticAttempts', instance.maximumAutomaticAttempts);
  writeNotNull('Parameters',
      instance.parameters?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('ResourceType', instance.resourceType);
  writeNotNull('RetryAttemptSeconds', instance.retryAttemptSeconds);
  writeNotNull('TargetVersion', instance.targetVersion);
  return val;
}

const _$RemediationTargetTypeEnumMap = {
  RemediationTargetType.ssmDocument: 'SSM_DOCUMENT',
};

RemediationException _$RemediationExceptionFromJson(Map<String, dynamic> json) {
  return RemediationException(
    configRuleName: json['ConfigRuleName'] as String,
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
    expirationTime:
        const UnixDateTimeConverter().fromJson(json['ExpirationTime']),
    message: json['Message'] as String,
  );
}

RemediationExceptionResourceKey _$RemediationExceptionResourceKeyFromJson(
    Map<String, dynamic> json) {
  return RemediationExceptionResourceKey(
    resourceId: json['ResourceId'] as String,
    resourceType: json['ResourceType'] as String,
  );
}

Map<String, dynamic> _$RemediationExceptionResourceKeyToJson(
    RemediationExceptionResourceKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('ResourceType', instance.resourceType);
  return val;
}

RemediationExecutionStatus _$RemediationExecutionStatusFromJson(
    Map<String, dynamic> json) {
  return RemediationExecutionStatus(
    invocationTime:
        const UnixDateTimeConverter().fromJson(json['InvocationTime']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
    resourceKey: json['ResourceKey'] == null
        ? null
        : ResourceKey.fromJson(json['ResourceKey'] as Map<String, dynamic>),
    state:
        _$enumDecodeNullable(_$RemediationExecutionStateEnumMap, json['State']),
    stepDetails: (json['StepDetails'] as List)
        ?.map((e) => e == null
            ? null
            : RemediationExecutionStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$RemediationExecutionStateEnumMap = {
  RemediationExecutionState.queued: 'QUEUED',
  RemediationExecutionState.inProgress: 'IN_PROGRESS',
  RemediationExecutionState.succeeded: 'SUCCEEDED',
  RemediationExecutionState.failed: 'FAILED',
};

RemediationExecutionStep _$RemediationExecutionStepFromJson(
    Map<String, dynamic> json) {
  return RemediationExecutionStep(
    errorMessage: json['ErrorMessage'] as String,
    name: json['Name'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    state: _$enumDecodeNullable(
        _$RemediationExecutionStepStateEnumMap, json['State']),
    stopTime: const UnixDateTimeConverter().fromJson(json['StopTime']),
  );
}

const _$RemediationExecutionStepStateEnumMap = {
  RemediationExecutionStepState.succeeded: 'SUCCEEDED',
  RemediationExecutionStepState.pending: 'PENDING',
  RemediationExecutionStepState.failed: 'FAILED',
};

RemediationParameterValue _$RemediationParameterValueFromJson(
    Map<String, dynamic> json) {
  return RemediationParameterValue(
    resourceValue: json['ResourceValue'] == null
        ? null
        : ResourceValue.fromJson(json['ResourceValue'] as Map<String, dynamic>),
    staticValue: json['StaticValue'] == null
        ? null
        : StaticValue.fromJson(json['StaticValue'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RemediationParameterValueToJson(
    RemediationParameterValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceValue', instance.resourceValue?.toJson());
  writeNotNull('StaticValue', instance.staticValue?.toJson());
  return val;
}

ResourceCount _$ResourceCountFromJson(Map<String, dynamic> json) {
  return ResourceCount(
    count: json['count'] as int,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

Map<String, dynamic> _$ResourceCountFiltersToJson(
    ResourceCountFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('Region', instance.region);
  writeNotNull('ResourceType', _$ResourceTypeEnumMap[instance.resourceType]);
  return val;
}

Map<String, dynamic> _$ResourceFiltersToJson(ResourceFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('Region', instance.region);
  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('ResourceName', instance.resourceName);
  return val;
}

ResourceIdentifier _$ResourceIdentifierFromJson(Map<String, dynamic> json) {
  return ResourceIdentifier(
    resourceDeletionTime:
        const UnixDateTimeConverter().fromJson(json['resourceDeletionTime']),
    resourceId: json['resourceId'] as String,
    resourceName: json['resourceName'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

ResourceKey _$ResourceKeyFromJson(Map<String, dynamic> json) {
  return ResourceKey(
    resourceId: json['resourceId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

Map<String, dynamic> _$ResourceKeyToJson(ResourceKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceId', instance.resourceId);
  writeNotNull('resourceType', _$ResourceTypeEnumMap[instance.resourceType]);
  return val;
}

ResourceValue _$ResourceValueFromJson(Map<String, dynamic> json) {
  return ResourceValue(
    value: _$enumDecodeNullable(_$ResourceValueTypeEnumMap, json['Value']),
  );
}

Map<String, dynamic> _$ResourceValueToJson(ResourceValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', _$ResourceValueTypeEnumMap[instance.value]);
  return val;
}

const _$ResourceValueTypeEnumMap = {
  ResourceValueType.resourceId: 'RESOURCE_ID',
};

RetentionConfiguration _$RetentionConfigurationFromJson(
    Map<String, dynamic> json) {
  return RetentionConfiguration(
    name: json['Name'] as String,
    retentionPeriodInDays: json['RetentionPeriodInDays'] as int,
  );
}

Scope _$ScopeFromJson(Map<String, dynamic> json) {
  return Scope(
    complianceResourceId: json['ComplianceResourceId'] as String,
    complianceResourceTypes: (json['ComplianceResourceTypes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    tagKey: json['TagKey'] as String,
    tagValue: json['TagValue'] as String,
  );
}

Map<String, dynamic> _$ScopeToJson(Scope instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComplianceResourceId', instance.complianceResourceId);
  writeNotNull('ComplianceResourceTypes', instance.complianceResourceTypes);
  writeNotNull('TagKey', instance.tagKey);
  writeNotNull('TagValue', instance.tagValue);
  return val;
}

SelectAggregateResourceConfigResponse
    _$SelectAggregateResourceConfigResponseFromJson(Map<String, dynamic> json) {
  return SelectAggregateResourceConfigResponse(
    nextToken: json['NextToken'] as String,
    queryInfo: json['QueryInfo'] == null
        ? null
        : QueryInfo.fromJson(json['QueryInfo'] as Map<String, dynamic>),
    results: (json['Results'] as List)?.map((e) => e as String)?.toList(),
  );
}

SelectResourceConfigResponse _$SelectResourceConfigResponseFromJson(
    Map<String, dynamic> json) {
  return SelectResourceConfigResponse(
    nextToken: json['NextToken'] as String,
    queryInfo: json['QueryInfo'] == null
        ? null
        : QueryInfo.fromJson(json['QueryInfo'] as Map<String, dynamic>),
    results: (json['Results'] as List)?.map((e) => e as String)?.toList(),
  );
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    owner: _$enumDecodeNullable(_$OwnerEnumMap, json['Owner']),
    sourceIdentifier: json['SourceIdentifier'] as String,
    sourceDetails: (json['SourceDetails'] as List)
        ?.map((e) =>
            e == null ? null : SourceDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Owner', _$OwnerEnumMap[instance.owner]);
  writeNotNull('SourceIdentifier', instance.sourceIdentifier);
  writeNotNull('SourceDetails',
      instance.sourceDetails?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$OwnerEnumMap = {
  Owner.customLambda: 'CUSTOM_LAMBDA',
  Owner.aws: 'AWS',
};

SourceDetail _$SourceDetailFromJson(Map<String, dynamic> json) {
  return SourceDetail(
    eventSource:
        _$enumDecodeNullable(_$EventSourceEnumMap, json['EventSource']),
    maximumExecutionFrequency: _$enumDecodeNullable(
        _$MaximumExecutionFrequencyEnumMap, json['MaximumExecutionFrequency']),
    messageType:
        _$enumDecodeNullable(_$MessageTypeEnumMap, json['MessageType']),
  );
}

Map<String, dynamic> _$SourceDetailToJson(SourceDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventSource', _$EventSourceEnumMap[instance.eventSource]);
  writeNotNull('MaximumExecutionFrequency',
      _$MaximumExecutionFrequencyEnumMap[instance.maximumExecutionFrequency]);
  writeNotNull('MessageType', _$MessageTypeEnumMap[instance.messageType]);
  return val;
}

const _$EventSourceEnumMap = {
  EventSource.awsConfig: 'aws.config',
};

const _$MessageTypeEnumMap = {
  MessageType.configurationItemChangeNotification:
      'ConfigurationItemChangeNotification',
  MessageType.configurationSnapshotDeliveryCompleted:
      'ConfigurationSnapshotDeliveryCompleted',
  MessageType.scheduledNotification: 'ScheduledNotification',
  MessageType.oversizedConfigurationItemChangeNotification:
      'OversizedConfigurationItemChangeNotification',
};

SsmControls _$SsmControlsFromJson(Map<String, dynamic> json) {
  return SsmControls(
    concurrentExecutionRatePercentage:
        json['ConcurrentExecutionRatePercentage'] as int,
    errorPercentage: json['ErrorPercentage'] as int,
  );
}

Map<String, dynamic> _$SsmControlsToJson(SsmControls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConcurrentExecutionRatePercentage',
      instance.concurrentExecutionRatePercentage);
  writeNotNull('ErrorPercentage', instance.errorPercentage);
  return val;
}

StartConfigRulesEvaluationResponse _$StartConfigRulesEvaluationResponseFromJson(
    Map<String, dynamic> json) {
  return StartConfigRulesEvaluationResponse();
}

StartRemediationExecutionResponse _$StartRemediationExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return StartRemediationExecutionResponse(
    failedItems: (json['FailedItems'] as List)
        ?.map((e) =>
            e == null ? null : ResourceKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureMessage: json['FailureMessage'] as String,
  );
}

StaticValue _$StaticValueFromJson(Map<String, dynamic> json) {
  return StaticValue(
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StaticValueToJson(StaticValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Map<String, dynamic> _$StatusDetailFiltersToJson(StatusDetailFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('MemberAccountRuleStatus',
      _$MemberAccountRuleStatusEnumMap[instance.memberAccountRuleStatus]);
  return val;
}

StoredQuery _$StoredQueryFromJson(Map<String, dynamic> json) {
  return StoredQuery(
    queryName: json['QueryName'] as String,
    description: json['Description'] as String,
    expression: json['Expression'] as String,
    queryArn: json['QueryArn'] as String,
    queryId: json['QueryId'] as String,
  );
}

Map<String, dynamic> _$StoredQueryToJson(StoredQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('QueryName', instance.queryName);
  writeNotNull('Description', instance.description);
  writeNotNull('Expression', instance.expression);
  writeNotNull('QueryArn', instance.queryArn);
  writeNotNull('QueryId', instance.queryId);
  return val;
}

StoredQueryMetadata _$StoredQueryMetadataFromJson(Map<String, dynamic> json) {
  return StoredQueryMetadata(
    queryArn: json['QueryArn'] as String,
    queryId: json['QueryId'] as String,
    queryName: json['QueryName'] as String,
    description: json['Description'] as String,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}
