// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicecatalog-2015-12-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AcceptPortfolioShareInputToJson(
    AcceptPortfolioShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PortfolioShareType',
      _$PortfolioShareTypeEnumMap[instance.portfolioShareType]);
  return val;
}

const _$PortfolioShareTypeEnumMap = {
  PortfolioShareType.imported: 'IMPORTED',
  PortfolioShareType.awsServicecatalog: 'AWS_SERVICECATALOG',
  PortfolioShareType.awsOrganizations: 'AWS_ORGANIZATIONS',
};

AcceptPortfolioShareOutput _$AcceptPortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return AcceptPortfolioShareOutput();
}

Map<String, dynamic> _$AccessLevelFilterToJson(AccessLevelFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$AccessLevelFilterKeyEnumMap[instance.key]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$AccessLevelFilterKeyEnumMap = {
  AccessLevelFilterKey.account: 'Account',
  AccessLevelFilterKey.role: 'Role',
  AccessLevelFilterKey.user: 'User',
};

Map<String, dynamic> _$AssociateBudgetWithResourceInputToJson(
    AssociateBudgetWithResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BudgetName', instance.budgetName);
  writeNotNull('ResourceId', instance.resourceId);
  return val;
}

AssociateBudgetWithResourceOutput _$AssociateBudgetWithResourceOutputFromJson(
    Map<String, dynamic> json) {
  return AssociateBudgetWithResourceOutput();
}

Map<String, dynamic> _$AssociatePrincipalWithPortfolioInputToJson(
    AssociatePrincipalWithPortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('PrincipalARN', instance.principalARN);
  writeNotNull('PrincipalType', _$PrincipalTypeEnumMap[instance.principalType]);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

const _$PrincipalTypeEnumMap = {
  PrincipalType.iam: 'IAM',
};

AssociatePrincipalWithPortfolioOutput
    _$AssociatePrincipalWithPortfolioOutputFromJson(Map<String, dynamic> json) {
  return AssociatePrincipalWithPortfolioOutput();
}

Map<String, dynamic> _$AssociateProductWithPortfolioInputToJson(
    AssociateProductWithPortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('ProductId', instance.productId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('SourcePortfolioId', instance.sourcePortfolioId);
  return val;
}

AssociateProductWithPortfolioOutput
    _$AssociateProductWithPortfolioOutputFromJson(Map<String, dynamic> json) {
  return AssociateProductWithPortfolioOutput();
}

Map<String, dynamic>
    _$AssociateServiceActionWithProvisioningArtifactInputToJson(
        AssociateServiceActionWithProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('ServiceActionId', instance.serviceActionId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

AssociateServiceActionWithProvisioningArtifactOutput
    _$AssociateServiceActionWithProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return AssociateServiceActionWithProvisioningArtifactOutput();
}

Map<String, dynamic> _$AssociateTagOptionWithResourceInputToJson(
    AssociateTagOptionWithResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('TagOptionId', instance.tagOptionId);
  return val;
}

AssociateTagOptionWithResourceOutput
    _$AssociateTagOptionWithResourceOutputFromJson(Map<String, dynamic> json) {
  return AssociateTagOptionWithResourceOutput();
}

Map<String, dynamic>
    _$BatchAssociateServiceActionWithProvisioningArtifactInputToJson(
        BatchAssociateServiceActionWithProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceActionAssociations',
      instance.serviceActionAssociations?.map((e) => e?.toJson())?.toList());
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

BatchAssociateServiceActionWithProvisioningArtifactOutput
    _$BatchAssociateServiceActionWithProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return BatchAssociateServiceActionWithProvisioningArtifactOutput(
    failedServiceActionAssociations:
        (json['FailedServiceActionAssociations'] as List)
            ?.map((e) => e == null
                ? null
                : FailedServiceActionAssociation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic>
    _$BatchDisassociateServiceActionFromProvisioningArtifactInputToJson(
        BatchDisassociateServiceActionFromProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceActionAssociations',
      instance.serviceActionAssociations?.map((e) => e?.toJson())?.toList());
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

BatchDisassociateServiceActionFromProvisioningArtifactOutput
    _$BatchDisassociateServiceActionFromProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return BatchDisassociateServiceActionFromProvisioningArtifactOutput(
    failedServiceActionAssociations:
        (json['FailedServiceActionAssociations'] as List)
            ?.map((e) => e == null
                ? null
                : FailedServiceActionAssociation.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

BudgetDetail _$BudgetDetailFromJson(Map<String, dynamic> json) {
  return BudgetDetail(
    budgetName: json['BudgetName'] as String,
  );
}

CloudWatchDashboard _$CloudWatchDashboardFromJson(Map<String, dynamic> json) {
  return CloudWatchDashboard(
    name: json['Name'] as String,
  );
}

ConstraintDetail _$ConstraintDetailFromJson(Map<String, dynamic> json) {
  return ConstraintDetail(
    constraintId: json['ConstraintId'] as String,
    description: json['Description'] as String,
    owner: json['Owner'] as String,
    portfolioId: json['PortfolioId'] as String,
    productId: json['ProductId'] as String,
    type: json['Type'] as String,
  );
}

ConstraintSummary _$ConstraintSummaryFromJson(Map<String, dynamic> json) {
  return ConstraintSummary(
    description: json['Description'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$CopyProductInputToJson(CopyProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('SourceProductArn', instance.sourceProductArn);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('CopyOptions', instance.copyOptions);
  writeNotNull('SourceProvisioningArtifactIdentifiers',
      instance.sourceProvisioningArtifactIdentifiers);
  writeNotNull('TargetProductId', instance.targetProductId);
  writeNotNull('TargetProductName', instance.targetProductName);
  return val;
}

CopyProductOutput _$CopyProductOutputFromJson(Map<String, dynamic> json) {
  return CopyProductOutput(
    copyProductToken: json['CopyProductToken'] as String,
  );
}

Map<String, dynamic> _$CreateConstraintInputToJson(
    CreateConstraintInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Parameters', instance.parameters);
  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('ProductId', instance.productId);
  writeNotNull('Type', instance.type);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Description', instance.description);
  return val;
}

CreateConstraintOutput _$CreateConstraintOutputFromJson(
    Map<String, dynamic> json) {
  return CreateConstraintOutput(
    constraintDetail: json['ConstraintDetail'] == null
        ? null
        : ConstraintDetail.fromJson(
            json['ConstraintDetail'] as Map<String, dynamic>),
    constraintParameters: json['ConstraintParameters'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
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

const _$StatusEnumMap = {
  Status.available: 'AVAILABLE',
  Status.creating: 'CREATING',
  Status.failed: 'FAILED',
};

Map<String, dynamic> _$CreatePortfolioInputToJson(
    CreatePortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('ProviderName', instance.providerName);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Description', instance.description);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreatePortfolioOutput _$CreatePortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return CreatePortfolioOutput(
    portfolioDetail: json['PortfolioDetail'] == null
        ? null
        : PortfolioDetail.fromJson(
            json['PortfolioDetail'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreatePortfolioShareInputToJson(
    CreatePortfolioShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AccountId', instance.accountId);
  writeNotNull('OrganizationNode', instance.organizationNode?.toJson());
  return val;
}

CreatePortfolioShareOutput _$CreatePortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreatePortfolioShareOutput(
    portfolioShareToken: json['PortfolioShareToken'] as String,
  );
}

Map<String, dynamic> _$CreateProductInputToJson(CreateProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Name', instance.name);
  writeNotNull('Owner', instance.owner);
  writeNotNull('ProductType', _$ProductTypeEnumMap[instance.productType]);
  writeNotNull('ProvisioningArtifactParameters',
      instance.provisioningArtifactParameters?.toJson());
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Description', instance.description);
  writeNotNull('Distributor', instance.distributor);
  writeNotNull('SupportDescription', instance.supportDescription);
  writeNotNull('SupportEmail', instance.supportEmail);
  writeNotNull('SupportUrl', instance.supportUrl);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ProductTypeEnumMap = {
  ProductType.cloudFormationTemplate: 'CLOUD_FORMATION_TEMPLATE',
  ProductType.marketplace: 'MARKETPLACE',
};

CreateProductOutput _$CreateProductOutputFromJson(Map<String, dynamic> json) {
  return CreateProductOutput(
    productViewDetail: json['ProductViewDetail'] == null
        ? null
        : ProductViewDetail.fromJson(
            json['ProductViewDetail'] as Map<String, dynamic>),
    provisioningArtifactDetail: json['ProvisioningArtifactDetail'] == null
        ? null
        : ProvisioningArtifactDetail.fromJson(
            json['ProvisioningArtifactDetail'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateProvisionedProductPlanInputToJson(
    CreateProvisionedProductPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('PlanName', instance.planName);
  writeNotNull(
      'PlanType', _$ProvisionedProductPlanTypeEnumMap[instance.planType]);
  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisionedProductName', instance.provisionedProductName);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('NotificationArns', instance.notificationArns);
  writeNotNull('PathId', instance.pathId);
  writeNotNull('ProvisioningParameters',
      instance.provisioningParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ProvisionedProductPlanTypeEnumMap = {
  ProvisionedProductPlanType.cloudformation: 'CLOUDFORMATION',
};

CreateProvisionedProductPlanOutput _$CreateProvisionedProductPlanOutputFromJson(
    Map<String, dynamic> json) {
  return CreateProvisionedProductPlanOutput(
    planId: json['PlanId'] as String,
    planName: json['PlanName'] as String,
    provisionProductId: json['ProvisionProductId'] as String,
    provisionedProductName: json['ProvisionedProductName'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
  );
}

Map<String, dynamic> _$CreateProvisioningArtifactInputToJson(
    CreateProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Parameters', instance.parameters?.toJson());
  writeNotNull('ProductId', instance.productId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

CreateProvisioningArtifactOutput _$CreateProvisioningArtifactOutputFromJson(
    Map<String, dynamic> json) {
  return CreateProvisioningArtifactOutput(
    info: (json['Info'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    provisioningArtifactDetail: json['ProvisioningArtifactDetail'] == null
        ? null
        : ProvisioningArtifactDetail.fromJson(
            json['ProvisioningArtifactDetail'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$CreateServiceActionInputToJson(
    CreateServiceActionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Definition', instance.definition);
  writeNotNull('DefinitionType',
      _$ServiceActionDefinitionTypeEnumMap[instance.definitionType]);
  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('Name', instance.name);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Description', instance.description);
  return val;
}

const _$ServiceActionDefinitionTypeEnumMap = {
  ServiceActionDefinitionType.ssmAutomation: 'SSM_AUTOMATION',
};

CreateServiceActionOutput _$CreateServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateServiceActionOutput(
    serviceActionDetail: json['ServiceActionDetail'] == null
        ? null
        : ServiceActionDetail.fromJson(
            json['ServiceActionDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTagOptionInputToJson(
    CreateTagOptionInput instance) {
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

CreateTagOptionOutput _$CreateTagOptionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateTagOptionOutput(
    tagOptionDetail: json['TagOptionDetail'] == null
        ? null
        : TagOptionDetail.fromJson(
            json['TagOptionDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteConstraintInputToJson(
    DeleteConstraintInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DeleteConstraintOutput _$DeleteConstraintOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteConstraintOutput();
}

Map<String, dynamic> _$DeletePortfolioInputToJson(
    DeletePortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DeletePortfolioOutput _$DeletePortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return DeletePortfolioOutput();
}

Map<String, dynamic> _$DeletePortfolioShareInputToJson(
    DeletePortfolioShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AccountId', instance.accountId);
  writeNotNull('OrganizationNode', instance.organizationNode?.toJson());
  return val;
}

DeletePortfolioShareOutput _$DeletePortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return DeletePortfolioShareOutput(
    portfolioShareToken: json['PortfolioShareToken'] as String,
  );
}

Map<String, dynamic> _$DeleteProductInputToJson(DeleteProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DeleteProductOutput _$DeleteProductOutputFromJson(Map<String, dynamic> json) {
  return DeleteProductOutput();
}

Map<String, dynamic> _$DeleteProvisionedProductPlanInputToJson(
    DeleteProvisionedProductPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlanId', instance.planId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('IgnoreErrors', instance.ignoreErrors);
  return val;
}

DeleteProvisionedProductPlanOutput _$DeleteProvisionedProductPlanOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteProvisionedProductPlanOutput();
}

Map<String, dynamic> _$DeleteProvisioningArtifactInputToJson(
    DeleteProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DeleteProvisioningArtifactOutput _$DeleteProvisioningArtifactOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteProvisioningArtifactOutput();
}

Map<String, dynamic> _$DeleteServiceActionInputToJson(
    DeleteServiceActionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DeleteServiceActionOutput _$DeleteServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteServiceActionOutput();
}

Map<String, dynamic> _$DeleteTagOptionInputToJson(
    DeleteTagOptionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

DeleteTagOptionOutput _$DeleteTagOptionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteTagOptionOutput();
}

Map<String, dynamic> _$DescribeConstraintInputToJson(
    DescribeConstraintInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeConstraintOutput _$DescribeConstraintOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeConstraintOutput(
    constraintDetail: json['ConstraintDetail'] == null
        ? null
        : ConstraintDetail.fromJson(
            json['ConstraintDetail'] as Map<String, dynamic>),
    constraintParameters: json['ConstraintParameters'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$DescribeCopyProductStatusInputToJson(
    DescribeCopyProductStatusInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CopyProductToken', instance.copyProductToken);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeCopyProductStatusOutput _$DescribeCopyProductStatusOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeCopyProductStatusOutput(
    copyProductStatus: _$enumDecodeNullable(
        _$CopyProductStatusEnumMap, json['CopyProductStatus']),
    statusDetail: json['StatusDetail'] as String,
    targetProductId: json['TargetProductId'] as String,
  );
}

const _$CopyProductStatusEnumMap = {
  CopyProductStatus.succeeded: 'SUCCEEDED',
  CopyProductStatus.inProgress: 'IN_PROGRESS',
  CopyProductStatus.failed: 'FAILED',
};

Map<String, dynamic> _$DescribePortfolioInputToJson(
    DescribePortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribePortfolioOutput _$DescribePortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePortfolioOutput(
    budgets: (json['Budgets'] as List)
        ?.map((e) =>
            e == null ? null : BudgetDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    portfolioDetail: json['PortfolioDetail'] == null
        ? null
        : PortfolioDetail.fromJson(
            json['PortfolioDetail'] as Map<String, dynamic>),
    tagOptions: (json['TagOptions'] as List)
        ?.map((e) => e == null
            ? null
            : TagOptionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribePortfolioShareStatusInputToJson(
    DescribePortfolioShareStatusInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioShareToken', instance.portfolioShareToken);
  return val;
}

DescribePortfolioShareStatusOutput _$DescribePortfolioShareStatusOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePortfolioShareStatusOutput(
    organizationNodeValue: json['OrganizationNodeValue'] as String,
    portfolioId: json['PortfolioId'] as String,
    portfolioShareToken: json['PortfolioShareToken'] as String,
    shareDetails: json['ShareDetails'] == null
        ? null
        : ShareDetails.fromJson(json['ShareDetails'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ShareStatusEnumMap, json['Status']),
  );
}

const _$ShareStatusEnumMap = {
  ShareStatus.notStarted: 'NOT_STARTED',
  ShareStatus.inProgress: 'IN_PROGRESS',
  ShareStatus.completed: 'COMPLETED',
  ShareStatus.completedWithErrors: 'COMPLETED_WITH_ERRORS',
  ShareStatus.error: 'ERROR',
};

Map<String, dynamic> _$DescribeProductAsAdminInputToJson(
    DescribeProductAsAdminInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeProductAsAdminOutput _$DescribeProductAsAdminOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProductAsAdminOutput(
    budgets: (json['Budgets'] as List)
        ?.map((e) =>
            e == null ? null : BudgetDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productViewDetail: json['ProductViewDetail'] == null
        ? null
        : ProductViewDetail.fromJson(
            json['ProductViewDetail'] as Map<String, dynamic>),
    provisioningArtifactSummaries: (json['ProvisioningArtifactSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifactSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tagOptions: (json['TagOptions'] as List)
        ?.map((e) => e == null
            ? null
            : TagOptionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeProductInputToJson(
    DescribeProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeProductOutput _$DescribeProductOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProductOutput(
    budgets: (json['Budgets'] as List)
        ?.map((e) =>
            e == null ? null : BudgetDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productViewSummary: json['ProductViewSummary'] == null
        ? null
        : ProductViewSummary.fromJson(
            json['ProductViewSummary'] as Map<String, dynamic>),
    provisioningArtifacts: (json['ProvisioningArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeProductViewInputToJson(
    DescribeProductViewInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeProductViewOutput _$DescribeProductViewOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProductViewOutput(
    productViewSummary: json['ProductViewSummary'] == null
        ? null
        : ProductViewSummary.fromJson(
            json['ProductViewSummary'] as Map<String, dynamic>),
    provisioningArtifacts: (json['ProvisioningArtifacts'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeProvisionedProductInputToJson(
    DescribeProvisionedProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeProvisionedProductOutput _$DescribeProvisionedProductOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProvisionedProductOutput(
    cloudWatchDashboards: (json['CloudWatchDashboards'] as List)
        ?.map((e) => e == null
            ? null
            : CloudWatchDashboard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    provisionedProductDetail: json['ProvisionedProductDetail'] == null
        ? null
        : ProvisionedProductDetail.fromJson(
            json['ProvisionedProductDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeProvisionedProductPlanInputToJson(
    DescribeProvisionedProductPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PlanId', instance.planId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

DescribeProvisionedProductPlanOutput
    _$DescribeProvisionedProductPlanOutputFromJson(Map<String, dynamic> json) {
  return DescribeProvisionedProductPlanOutput(
    nextPageToken: json['NextPageToken'] as String,
    provisionedProductPlanDetails: json['ProvisionedProductPlanDetails'] == null
        ? null
        : ProvisionedProductPlanDetails.fromJson(
            json['ProvisionedProductPlanDetails'] as Map<String, dynamic>),
    resourceChanges: (json['ResourceChanges'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceChange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeProvisioningArtifactInputToJson(
    DescribeProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Verbose', instance.verbose);
  return val;
}

DescribeProvisioningArtifactOutput _$DescribeProvisioningArtifactOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProvisioningArtifactOutput(
    info: (json['Info'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    provisioningArtifactDetail: json['ProvisioningArtifactDetail'] == null
        ? null
        : ProvisioningArtifactDetail.fromJson(
            json['ProvisioningArtifactDetail'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$DescribeProvisioningParametersInputToJson(
    DescribeProvisioningParametersInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PathId', instance.pathId);
  return val;
}

DescribeProvisioningParametersOutput
    _$DescribeProvisioningParametersOutputFromJson(Map<String, dynamic> json) {
  return DescribeProvisioningParametersOutput(
    constraintSummaries: (json['ConstraintSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ConstraintSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    provisioningArtifactParameters: (json['ProvisioningArtifactParameters']
            as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifactParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    provisioningArtifactPreferences: json['ProvisioningArtifactPreferences'] ==
            null
        ? null
        : ProvisioningArtifactPreferences.fromJson(
            json['ProvisioningArtifactPreferences'] as Map<String, dynamic>),
    tagOptions: (json['TagOptions'] as List)
        ?.map((e) => e == null
            ? null
            : TagOptionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usageInstructions: (json['UsageInstructions'] as List)
        ?.map((e) => e == null
            ? null
            : UsageInstruction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeRecordInputToJson(DescribeRecordInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

DescribeRecordOutput _$DescribeRecordOutputFromJson(Map<String, dynamic> json) {
  return DescribeRecordOutput(
    nextPageToken: json['NextPageToken'] as String,
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
    recordOutputs: (json['RecordOutputs'] as List)
        ?.map((e) =>
            e == null ? null : RecordOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeServiceActionExecutionParametersInputToJson(
    DescribeServiceActionExecutionParametersInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProvisionedProductId', instance.provisionedProductId);
  writeNotNull('ServiceActionId', instance.serviceActionId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeServiceActionExecutionParametersOutput
    _$DescribeServiceActionExecutionParametersOutputFromJson(
        Map<String, dynamic> json) {
  return DescribeServiceActionExecutionParametersOutput(
    serviceActionParameters: (json['ServiceActionParameters'] as List)
        ?.map((e) => e == null
            ? null
            : ExecutionParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeServiceActionInputToJson(
    DescribeServiceActionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DescribeServiceActionOutput _$DescribeServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeServiceActionOutput(
    serviceActionDetail: json['ServiceActionDetail'] == null
        ? null
        : ServiceActionDetail.fromJson(
            json['ServiceActionDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeTagOptionInputToJson(
    DescribeTagOptionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

DescribeTagOptionOutput _$DescribeTagOptionOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeTagOptionOutput(
    tagOptionDetail: json['TagOptionDetail'] == null
        ? null
        : TagOptionDetail.fromJson(
            json['TagOptionDetail'] as Map<String, dynamic>),
  );
}

DisableAWSOrganizationsAccessOutput
    _$DisableAWSOrganizationsAccessOutputFromJson(Map<String, dynamic> json) {
  return DisableAWSOrganizationsAccessOutput();
}

Map<String, dynamic> _$DisassociateBudgetFromResourceInputToJson(
    DisassociateBudgetFromResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BudgetName', instance.budgetName);
  writeNotNull('ResourceId', instance.resourceId);
  return val;
}

DisassociateBudgetFromResourceOutput
    _$DisassociateBudgetFromResourceOutputFromJson(Map<String, dynamic> json) {
  return DisassociateBudgetFromResourceOutput();
}

Map<String, dynamic> _$DisassociatePrincipalFromPortfolioInputToJson(
    DisassociatePrincipalFromPortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('PrincipalARN', instance.principalARN);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DisassociatePrincipalFromPortfolioOutput
    _$DisassociatePrincipalFromPortfolioOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociatePrincipalFromPortfolioOutput();
}

Map<String, dynamic> _$DisassociateProductFromPortfolioInputToJson(
    DisassociateProductFromPortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('ProductId', instance.productId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DisassociateProductFromPortfolioOutput
    _$DisassociateProductFromPortfolioOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociateProductFromPortfolioOutput();
}

Map<String, dynamic>
    _$DisassociateServiceActionFromProvisioningArtifactInputToJson(
        DisassociateServiceActionFromProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('ServiceActionId', instance.serviceActionId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

DisassociateServiceActionFromProvisioningArtifactOutput
    _$DisassociateServiceActionFromProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociateServiceActionFromProvisioningArtifactOutput();
}

Map<String, dynamic> _$DisassociateTagOptionFromResourceInputToJson(
    DisassociateTagOptionFromResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('TagOptionId', instance.tagOptionId);
  return val;
}

DisassociateTagOptionFromResourceOutput
    _$DisassociateTagOptionFromResourceOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociateTagOptionFromResourceOutput();
}

EnableAWSOrganizationsAccessOutput _$EnableAWSOrganizationsAccessOutputFromJson(
    Map<String, dynamic> json) {
  return EnableAWSOrganizationsAccessOutput();
}

Map<String, dynamic> _$ExecuteProvisionedProductPlanInputToJson(
    ExecuteProvisionedProductPlanInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('PlanId', instance.planId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

ExecuteProvisionedProductPlanOutput
    _$ExecuteProvisionedProductPlanOutputFromJson(Map<String, dynamic> json) {
  return ExecuteProvisionedProductPlanOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExecuteProvisionedProductServiceActionInputToJson(
    ExecuteProvisionedProductServiceActionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExecuteToken', instance.executeToken);
  writeNotNull('ProvisionedProductId', instance.provisionedProductId);
  writeNotNull('ServiceActionId', instance.serviceActionId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

ExecuteProvisionedProductServiceActionOutput
    _$ExecuteProvisionedProductServiceActionOutputFromJson(
        Map<String, dynamic> json) {
  return ExecuteProvisionedProductServiceActionOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

ExecutionParameter _$ExecutionParameterFromJson(Map<String, dynamic> json) {
  return ExecutionParameter(
    defaultValues:
        (json['DefaultValues'] as List)?.map((e) => e as String)?.toList(),
    name: json['Name'] as String,
    type: json['Type'] as String,
  );
}

FailedServiceActionAssociation _$FailedServiceActionAssociationFromJson(
    Map<String, dynamic> json) {
  return FailedServiceActionAssociation(
    errorCode: _$enumDecodeNullable(
        _$ServiceActionAssociationErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    productId: json['ProductId'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    serviceActionId: json['ServiceActionId'] as String,
  );
}

const _$ServiceActionAssociationErrorCodeEnumMap = {
  ServiceActionAssociationErrorCode.duplicateResource: 'DUPLICATE_RESOURCE',
  ServiceActionAssociationErrorCode.internalFailure: 'INTERNAL_FAILURE',
  ServiceActionAssociationErrorCode.limitExceeded: 'LIMIT_EXCEEDED',
  ServiceActionAssociationErrorCode.resourceNotFound: 'RESOURCE_NOT_FOUND',
  ServiceActionAssociationErrorCode.throttling: 'THROTTLING',
};

GetAWSOrganizationsAccessStatusOutput
    _$GetAWSOrganizationsAccessStatusOutputFromJson(Map<String, dynamic> json) {
  return GetAWSOrganizationsAccessStatusOutput(
    accessStatus:
        _$enumDecodeNullable(_$AccessStatusEnumMap, json['AccessStatus']),
  );
}

const _$AccessStatusEnumMap = {
  AccessStatus.enabled: 'ENABLED',
  AccessStatus.underChange: 'UNDER_CHANGE',
  AccessStatus.disabled: 'DISABLED',
};

LaunchPathSummary _$LaunchPathSummaryFromJson(Map<String, dynamic> json) {
  return LaunchPathSummary(
    constraintSummaries: (json['ConstraintSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ConstraintSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['Id'] as String,
    name: json['Name'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListAcceptedPortfolioSharesInputToJson(
    ListAcceptedPortfolioSharesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('PortfolioShareType',
      _$PortfolioShareTypeEnumMap[instance.portfolioShareType]);
  return val;
}

ListAcceptedPortfolioSharesOutput _$ListAcceptedPortfolioSharesOutputFromJson(
    Map<String, dynamic> json) {
  return ListAcceptedPortfolioSharesOutput(
    nextPageToken: json['NextPageToken'] as String,
    portfolioDetails: (json['PortfolioDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PortfolioDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListBudgetsForResourceInputToJson(
    ListBudgetsForResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceId', instance.resourceId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListBudgetsForResourceOutput _$ListBudgetsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListBudgetsForResourceOutput(
    budgets: (json['Budgets'] as List)
        ?.map((e) =>
            e == null ? null : BudgetDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

Map<String, dynamic> _$ListConstraintsForPortfolioInputToJson(
    ListConstraintsForPortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('ProductId', instance.productId);
  return val;
}

ListConstraintsForPortfolioOutput _$ListConstraintsForPortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return ListConstraintsForPortfolioOutput(
    constraintDetails: (json['ConstraintDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ConstraintDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

Map<String, dynamic> _$ListLaunchPathsInputToJson(
    ListLaunchPathsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListLaunchPathsOutput _$ListLaunchPathsOutputFromJson(
    Map<String, dynamic> json) {
  return ListLaunchPathsOutput(
    launchPathSummaries: (json['LaunchPathSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : LaunchPathSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

Map<String, dynamic> _$ListOrganizationPortfolioAccessInputToJson(
    ListOrganizationPortfolioAccessInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrganizationNodeType',
      _$OrganizationNodeTypeEnumMap[instance.organizationNodeType]);
  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

const _$OrganizationNodeTypeEnumMap = {
  OrganizationNodeType.organization: 'ORGANIZATION',
  OrganizationNodeType.organizationalUnit: 'ORGANIZATIONAL_UNIT',
  OrganizationNodeType.account: 'ACCOUNT',
};

ListOrganizationPortfolioAccessOutput
    _$ListOrganizationPortfolioAccessOutputFromJson(Map<String, dynamic> json) {
  return ListOrganizationPortfolioAccessOutput(
    nextPageToken: json['NextPageToken'] as String,
    organizationNodes: (json['OrganizationNodes'] as List)
        ?.map((e) => e == null
            ? null
            : OrganizationNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListPortfolioAccessInputToJson(
    ListPortfolioAccessInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('OrganizationParentId', instance.organizationParentId);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListPortfolioAccessOutput _$ListPortfolioAccessOutputFromJson(
    Map<String, dynamic> json) {
  return ListPortfolioAccessOutput(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
}

Map<String, dynamic> _$ListPortfoliosForProductInputToJson(
    ListPortfoliosForProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListPortfoliosForProductOutput _$ListPortfoliosForProductOutputFromJson(
    Map<String, dynamic> json) {
  return ListPortfoliosForProductOutput(
    nextPageToken: json['NextPageToken'] as String,
    portfolioDetails: (json['PortfolioDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PortfolioDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListPortfoliosInputToJson(ListPortfoliosInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListPortfoliosOutput _$ListPortfoliosOutputFromJson(Map<String, dynamic> json) {
  return ListPortfoliosOutput(
    nextPageToken: json['NextPageToken'] as String,
    portfolioDetails: (json['PortfolioDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PortfolioDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListPrincipalsForPortfolioInputToJson(
    ListPrincipalsForPortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListPrincipalsForPortfolioOutput _$ListPrincipalsForPortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return ListPrincipalsForPortfolioOutput(
    nextPageToken: json['NextPageToken'] as String,
    principals: (json['Principals'] as List)
        ?.map((e) =>
            e == null ? null : Principal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListProvisionedProductPlansInputToJson(
    ListProvisionedProductPlansInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AccessLevelFilter', instance.accessLevelFilter?.toJson());
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('ProvisionProductId', instance.provisionProductId);
  return val;
}

ListProvisionedProductPlansOutput _$ListProvisionedProductPlansOutputFromJson(
    Map<String, dynamic> json) {
  return ListProvisionedProductPlansOutput(
    nextPageToken: json['NextPageToken'] as String,
    provisionedProductPlans: (json['ProvisionedProductPlans'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisionedProductPlanSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListProvisioningArtifactsForServiceActionInputToJson(
    ListProvisioningArtifactsForServiceActionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceActionId', instance.serviceActionId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListProvisioningArtifactsForServiceActionOutput
    _$ListProvisioningArtifactsForServiceActionOutputFromJson(
        Map<String, dynamic> json) {
  return ListProvisioningArtifactsForServiceActionOutput(
    nextPageToken: json['NextPageToken'] as String,
    provisioningArtifactViews: (json['ProvisioningArtifactViews'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifactView.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListProvisioningArtifactsInputToJson(
    ListProvisioningArtifactsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

ListProvisioningArtifactsOutput _$ListProvisioningArtifactsOutputFromJson(
    Map<String, dynamic> json) {
  return ListProvisioningArtifactsOutput(
    nextPageToken: json['NextPageToken'] as String,
    provisioningArtifactDetails: (json['ProvisioningArtifactDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifactDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListRecordHistoryInputToJson(
    ListRecordHistoryInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AccessLevelFilter', instance.accessLevelFilter?.toJson());
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('SearchFilter', instance.searchFilter?.toJson());
  return val;
}

ListRecordHistoryOutput _$ListRecordHistoryOutputFromJson(
    Map<String, dynamic> json) {
  return ListRecordHistoryOutput(
    nextPageToken: json['NextPageToken'] as String,
    recordDetails: (json['RecordDetails'] as List)
        ?.map((e) =>
            e == null ? null : RecordDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListRecordHistorySearchFilterToJson(
    ListRecordHistorySearchFilter instance) {
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

Map<String, dynamic> _$ListResourcesForTagOptionInputToJson(
    ListResourcesForTagOptionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TagOptionId', instance.tagOptionId);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('ResourceType', instance.resourceType);
  return val;
}

ListResourcesForTagOptionOutput _$ListResourcesForTagOptionOutputFromJson(
    Map<String, dynamic> json) {
  return ListResourcesForTagOptionOutput(
    pageToken: json['PageToken'] as String,
    resourceDetails: (json['ResourceDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListServiceActionsForProvisioningArtifactInputToJson(
    ListServiceActionsForProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListServiceActionsForProvisioningArtifactOutput
    _$ListServiceActionsForProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return ListServiceActionsForProvisioningArtifactOutput(
    nextPageToken: json['NextPageToken'] as String,
    serviceActionSummaries: (json['ServiceActionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceActionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListServiceActionsInputToJson(
    ListServiceActionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListServiceActionsOutput _$ListServiceActionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListServiceActionsOutput(
    nextPageToken: json['NextPageToken'] as String,
    serviceActionSummaries: (json['ServiceActionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ServiceActionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListStackInstancesForProvisionedProductInputToJson(
    ListStackInstancesForProvisionedProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProvisionedProductId', instance.provisionedProductId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListStackInstancesForProvisionedProductOutput
    _$ListStackInstancesForProvisionedProductOutputFromJson(
        Map<String, dynamic> json) {
  return ListStackInstancesForProvisionedProductOutput(
    nextPageToken: json['NextPageToken'] as String,
    stackInstances: (json['StackInstances'] as List)
        ?.map((e) => e == null
            ? null
            : StackInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListTagOptionsFiltersToJson(
    ListTagOptionsFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Active', instance.active);
  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$ListTagOptionsInputToJson(ListTagOptionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.toJson());
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ListTagOptionsOutput _$ListTagOptionsOutputFromJson(Map<String, dynamic> json) {
  return ListTagOptionsOutput(
    pageToken: json['PageToken'] as String,
    tagOptionDetails: (json['TagOptionDetails'] as List)
        ?.map((e) => e == null
            ? null
            : TagOptionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OrganizationNode _$OrganizationNodeFromJson(Map<String, dynamic> json) {
  return OrganizationNode(
    type: _$enumDecodeNullable(_$OrganizationNodeTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$OrganizationNodeToJson(OrganizationNode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$OrganizationNodeTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

ParameterConstraints _$ParameterConstraintsFromJson(Map<String, dynamic> json) {
  return ParameterConstraints(
    allowedValues:
        (json['AllowedValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

PortfolioDetail _$PortfolioDetailFromJson(Map<String, dynamic> json) {
  return PortfolioDetail(
    arn: json['ARN'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    id: json['Id'] as String,
    providerName: json['ProviderName'] as String,
  );
}

Principal _$PrincipalFromJson(Map<String, dynamic> json) {
  return Principal(
    principalARN: json['PrincipalARN'] as String,
    principalType:
        _$enumDecodeNullable(_$PrincipalTypeEnumMap, json['PrincipalType']),
  );
}

ProductViewAggregationValue _$ProductViewAggregationValueFromJson(
    Map<String, dynamic> json) {
  return ProductViewAggregationValue(
    approximateCount: json['ApproximateCount'] as int,
    value: json['Value'] as String,
  );
}

ProductViewDetail _$ProductViewDetailFromJson(Map<String, dynamic> json) {
  return ProductViewDetail(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    productARN: json['ProductARN'] as String,
    productViewSummary: json['ProductViewSummary'] == null
        ? null
        : ProductViewSummary.fromJson(
            json['ProductViewSummary'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

ProductViewSummary _$ProductViewSummaryFromJson(Map<String, dynamic> json) {
  return ProductViewSummary(
    distributor: json['Distributor'] as String,
    hasDefaultPath: json['HasDefaultPath'] as bool,
    id: json['Id'] as String,
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    productId: json['ProductId'] as String,
    shortDescription: json['ShortDescription'] as String,
    supportDescription: json['SupportDescription'] as String,
    supportEmail: json['SupportEmail'] as String,
    supportUrl: json['SupportUrl'] as String,
    type: _$enumDecodeNullable(_$ProductTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$ProvisionProductInputToJson(
    ProvisionProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisionToken', instance.provisionToken);
  writeNotNull('ProvisionedProductName', instance.provisionedProductName);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('NotificationArns', instance.notificationArns);
  writeNotNull('PathId', instance.pathId);
  writeNotNull('ProvisioningParameters',
      instance.provisioningParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProvisioningPreferences', instance.provisioningPreferences?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

ProvisionProductOutput _$ProvisionProductOutputFromJson(
    Map<String, dynamic> json) {
  return ProvisionProductOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

ProvisionedProductAttribute _$ProvisionedProductAttributeFromJson(
    Map<String, dynamic> json) {
  return ProvisionedProductAttribute(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    id: json['Id'] as String,
    idempotencyToken: json['IdempotencyToken'] as String,
    lastRecordId: json['LastRecordId'] as String,
    name: json['Name'] as String,
    physicalId: json['PhysicalId'] as String,
    productId: json['ProductId'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    status:
        _$enumDecodeNullable(_$ProvisionedProductStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['Type'] as String,
    userArn: json['UserArn'] as String,
    userArnSession: json['UserArnSession'] as String,
  );
}

const _$ProvisionedProductStatusEnumMap = {
  ProvisionedProductStatus.available: 'AVAILABLE',
  ProvisionedProductStatus.underChange: 'UNDER_CHANGE',
  ProvisionedProductStatus.tainted: 'TAINTED',
  ProvisionedProductStatus.error: 'ERROR',
  ProvisionedProductStatus.planInProgress: 'PLAN_IN_PROGRESS',
};

ProvisionedProductDetail _$ProvisionedProductDetailFromJson(
    Map<String, dynamic> json) {
  return ProvisionedProductDetail(
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    id: json['Id'] as String,
    idempotencyToken: json['IdempotencyToken'] as String,
    lastRecordId: json['LastRecordId'] as String,
    name: json['Name'] as String,
    productId: json['ProductId'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    status:
        _$enumDecodeNullable(_$ProvisionedProductStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    type: json['Type'] as String,
  );
}

ProvisionedProductPlanDetails _$ProvisionedProductPlanDetailsFromJson(
    Map<String, dynamic> json) {
  return ProvisionedProductPlanDetails(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    notificationArns:
        (json['NotificationArns'] as List)?.map((e) => e as String)?.toList(),
    pathId: json['PathId'] as String,
    planId: json['PlanId'] as String,
    planName: json['PlanName'] as String,
    planType: _$enumDecodeNullable(
        _$ProvisionedProductPlanTypeEnumMap, json['PlanType']),
    productId: json['ProductId'] as String,
    provisionProductId: json['ProvisionProductId'] as String,
    provisionProductName: json['ProvisionProductName'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    provisioningParameters: (json['ProvisioningParameters'] as List)
        ?.map((e) => e == null
            ? null
            : UpdateProvisioningParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(
        _$ProvisionedProductPlanStatusEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updatedTime: unixTimestampFromJson(json['UpdatedTime']),
  );
}

const _$ProvisionedProductPlanStatusEnumMap = {
  ProvisionedProductPlanStatus.createInProgress: 'CREATE_IN_PROGRESS',
  ProvisionedProductPlanStatus.createSuccess: 'CREATE_SUCCESS',
  ProvisionedProductPlanStatus.createFailed: 'CREATE_FAILED',
  ProvisionedProductPlanStatus.executeInProgress: 'EXECUTE_IN_PROGRESS',
  ProvisionedProductPlanStatus.executeSuccess: 'EXECUTE_SUCCESS',
  ProvisionedProductPlanStatus.executeFailed: 'EXECUTE_FAILED',
};

ProvisionedProductPlanSummary _$ProvisionedProductPlanSummaryFromJson(
    Map<String, dynamic> json) {
  return ProvisionedProductPlanSummary(
    planId: json['PlanId'] as String,
    planName: json['PlanName'] as String,
    planType: _$enumDecodeNullable(
        _$ProvisionedProductPlanTypeEnumMap, json['PlanType']),
    provisionProductId: json['ProvisionProductId'] as String,
    provisionProductName: json['ProvisionProductName'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
  );
}

ProvisioningArtifact _$ProvisioningArtifactFromJson(Map<String, dynamic> json) {
  return ProvisioningArtifact(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    guidance: _$enumDecodeNullable(
        _$ProvisioningArtifactGuidanceEnumMap, json['Guidance']),
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

const _$ProvisioningArtifactGuidanceEnumMap = {
  ProvisioningArtifactGuidance.$default: 'DEFAULT',
  ProvisioningArtifactGuidance.deprecated: 'DEPRECATED',
};

ProvisioningArtifactDetail _$ProvisioningArtifactDetailFromJson(
    Map<String, dynamic> json) {
  return ProvisioningArtifactDetail(
    active: json['Active'] as bool,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    guidance: _$enumDecodeNullable(
        _$ProvisioningArtifactGuidanceEnumMap, json['Guidance']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$ProvisioningArtifactTypeEnumMap, json['Type']),
  );
}

const _$ProvisioningArtifactTypeEnumMap = {
  ProvisioningArtifactType.cloudFormationTemplate: 'CLOUD_FORMATION_TEMPLATE',
  ProvisioningArtifactType.marketplaceAmi: 'MARKETPLACE_AMI',
  ProvisioningArtifactType.marketplaceCar: 'MARKETPLACE_CAR',
};

ProvisioningArtifactParameter _$ProvisioningArtifactParameterFromJson(
    Map<String, dynamic> json) {
  return ProvisioningArtifactParameter(
    defaultValue: json['DefaultValue'] as String,
    description: json['Description'] as String,
    isNoEcho: json['IsNoEcho'] as bool,
    parameterConstraints: json['ParameterConstraints'] == null
        ? null
        : ParameterConstraints.fromJson(
            json['ParameterConstraints'] as Map<String, dynamic>),
    parameterKey: json['ParameterKey'] as String,
    parameterType: json['ParameterType'] as String,
  );
}

ProvisioningArtifactPreferences _$ProvisioningArtifactPreferencesFromJson(
    Map<String, dynamic> json) {
  return ProvisioningArtifactPreferences(
    stackSetAccounts:
        (json['StackSetAccounts'] as List)?.map((e) => e as String)?.toList(),
    stackSetRegions:
        (json['StackSetRegions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ProvisioningArtifactPropertiesToJson(
    ProvisioningArtifactProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Info', instance.info);
  writeNotNull('Description', instance.description);
  writeNotNull('DisableTemplateValidation', instance.disableTemplateValidation);
  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$ProvisioningArtifactTypeEnumMap[instance.type]);
  return val;
}

ProvisioningArtifactSummary _$ProvisioningArtifactSummaryFromJson(
    Map<String, dynamic> json) {
  return ProvisioningArtifactSummary(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    provisioningArtifactMetadata:
        (json['ProvisioningArtifactMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ProvisioningArtifactView _$ProvisioningArtifactViewFromJson(
    Map<String, dynamic> json) {
  return ProvisioningArtifactView(
    productViewSummary: json['ProductViewSummary'] == null
        ? null
        : ProductViewSummary.fromJson(
            json['ProductViewSummary'] as Map<String, dynamic>),
    provisioningArtifact: json['ProvisioningArtifact'] == null
        ? null
        : ProvisioningArtifact.fromJson(
            json['ProvisioningArtifact'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProvisioningParameterToJson(
    ProvisioningParameter instance) {
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

Map<String, dynamic> _$ProvisioningPreferencesToJson(
    ProvisioningPreferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StackSetAccounts', instance.stackSetAccounts);
  writeNotNull(
      'StackSetFailureToleranceCount', instance.stackSetFailureToleranceCount);
  writeNotNull('StackSetFailureTolerancePercentage',
      instance.stackSetFailureTolerancePercentage);
  writeNotNull(
      'StackSetMaxConcurrencyCount', instance.stackSetMaxConcurrencyCount);
  writeNotNull('StackSetMaxConcurrencyPercentage',
      instance.stackSetMaxConcurrencyPercentage);
  writeNotNull('StackSetRegions', instance.stackSetRegions);
  return val;
}

RecordDetail _$RecordDetailFromJson(Map<String, dynamic> json) {
  return RecordDetail(
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    pathId: json['PathId'] as String,
    productId: json['ProductId'] as String,
    provisionedProductId: json['ProvisionedProductId'] as String,
    provisionedProductName: json['ProvisionedProductName'] as String,
    provisionedProductType: json['ProvisionedProductType'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    recordErrors: (json['RecordErrors'] as List)
        ?.map((e) =>
            e == null ? null : RecordError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recordId: json['RecordId'] as String,
    recordTags: (json['RecordTags'] as List)
        ?.map((e) =>
            e == null ? null : RecordTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recordType: json['RecordType'] as String,
    status: _$enumDecodeNullable(_$RecordStatusEnumMap, json['Status']),
    updatedTime: unixTimestampFromJson(json['UpdatedTime']),
  );
}

const _$RecordStatusEnumMap = {
  RecordStatus.created: 'CREATED',
  RecordStatus.inProgress: 'IN_PROGRESS',
  RecordStatus.inProgressInError: 'IN_PROGRESS_IN_ERROR',
  RecordStatus.succeeded: 'SUCCEEDED',
  RecordStatus.failed: 'FAILED',
};

RecordError _$RecordErrorFromJson(Map<String, dynamic> json) {
  return RecordError(
    code: json['Code'] as String,
    description: json['Description'] as String,
  );
}

RecordOutput _$RecordOutputFromJson(Map<String, dynamic> json) {
  return RecordOutput(
    description: json['Description'] as String,
    outputKey: json['OutputKey'] as String,
    outputValue: json['OutputValue'] as String,
  );
}

RecordTag _$RecordTagFromJson(Map<String, dynamic> json) {
  return RecordTag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$RejectPortfolioShareInputToJson(
    RejectPortfolioShareInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PortfolioShareType',
      _$PortfolioShareTypeEnumMap[instance.portfolioShareType]);
  return val;
}

RejectPortfolioShareOutput _$RejectPortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return RejectPortfolioShareOutput();
}

ResourceChange _$ResourceChangeFromJson(Map<String, dynamic> json) {
  return ResourceChange(
    action: _$enumDecodeNullable(_$ChangeActionEnumMap, json['Action']),
    details: (json['Details'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceChangeDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    logicalResourceId: json['LogicalResourceId'] as String,
    physicalResourceId: json['PhysicalResourceId'] as String,
    replacement:
        _$enumDecodeNullable(_$ReplacementEnumMap, json['Replacement']),
    resourceType: json['ResourceType'] as String,
    scope: (json['Scope'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$ChangeActionEnumMap = {
  ChangeAction.add: 'ADD',
  ChangeAction.modify: 'MODIFY',
  ChangeAction.remove: 'REMOVE',
};

const _$ReplacementEnumMap = {
  Replacement.$true: 'TRUE',
  Replacement.$false: 'FALSE',
  Replacement.conditional: 'CONDITIONAL',
};

ResourceChangeDetail _$ResourceChangeDetailFromJson(Map<String, dynamic> json) {
  return ResourceChangeDetail(
    causingEntity: json['CausingEntity'] as String,
    evaluation:
        _$enumDecodeNullable(_$EvaluationTypeEnumMap, json['Evaluation']),
    target: json['Target'] == null
        ? null
        : ResourceTargetDefinition.fromJson(
            json['Target'] as Map<String, dynamic>),
  );
}

const _$EvaluationTypeEnumMap = {
  EvaluationType.static: 'STATIC',
  EvaluationType.dynamic: 'DYNAMIC',
};

ResourceDetail _$ResourceDetailFromJson(Map<String, dynamic> json) {
  return ResourceDetail(
    arn: json['ARN'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

ResourceTargetDefinition _$ResourceTargetDefinitionFromJson(
    Map<String, dynamic> json) {
  return ResourceTargetDefinition(
    attribute:
        _$enumDecodeNullable(_$ResourceAttributeEnumMap, json['Attribute']),
    name: json['Name'] as String,
    requiresRecreation: _$enumDecodeNullable(
        _$RequiresRecreationEnumMap, json['RequiresRecreation']),
  );
}

const _$ResourceAttributeEnumMap = {
  ResourceAttribute.properties: 'PROPERTIES',
  ResourceAttribute.metadata: 'METADATA',
  ResourceAttribute.creationpolicy: 'CREATIONPOLICY',
  ResourceAttribute.updatepolicy: 'UPDATEPOLICY',
  ResourceAttribute.deletionpolicy: 'DELETIONPOLICY',
  ResourceAttribute.tags: 'TAGS',
};

const _$RequiresRecreationEnumMap = {
  RequiresRecreation.never: 'NEVER',
  RequiresRecreation.conditionally: 'CONDITIONALLY',
  RequiresRecreation.always: 'ALWAYS',
};

Map<String, dynamic> _$ScanProvisionedProductsInputToJson(
    ScanProvisionedProductsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AccessLevelFilter', instance.accessLevelFilter?.toJson());
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  return val;
}

ScanProvisionedProductsOutput _$ScanProvisionedProductsOutputFromJson(
    Map<String, dynamic> json) {
  return ScanProvisionedProductsOutput(
    nextPageToken: json['NextPageToken'] as String,
    provisionedProducts: (json['ProvisionedProducts'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisionedProductDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchProductsAsAdminInputToJson(
    SearchProductsAsAdminInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Filters', instance.filters);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('PortfolioId', instance.portfolioId);
  writeNotNull('ProductSource', _$ProductSourceEnumMap[instance.productSource]);
  writeNotNull('SortBy', _$ProductViewSortByEnumMap[instance.sortBy]);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$ProductSourceEnumMap = {
  ProductSource.account: 'ACCOUNT',
};

const _$ProductViewSortByEnumMap = {
  ProductViewSortBy.title: 'Title',
  ProductViewSortBy.versionCount: 'VersionCount',
  ProductViewSortBy.creationDate: 'CreationDate',
};

const _$SortOrderEnumMap = {
  SortOrder.ascending: 'ASCENDING',
  SortOrder.descending: 'DESCENDING',
};

SearchProductsAsAdminOutput _$SearchProductsAsAdminOutputFromJson(
    Map<String, dynamic> json) {
  return SearchProductsAsAdminOutput(
    nextPageToken: json['NextPageToken'] as String,
    productViewDetails: (json['ProductViewDetails'] as List)
        ?.map((e) => e == null
            ? null
            : ProductViewDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchProductsInputToJson(SearchProductsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Filters', instance.filters);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('SortBy', _$ProductViewSortByEnumMap[instance.sortBy]);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

SearchProductsOutput _$SearchProductsOutputFromJson(Map<String, dynamic> json) {
  return SearchProductsOutput(
    nextPageToken: json['NextPageToken'] as String,
    productViewAggregations:
        (json['ProductViewAggregations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ProductViewAggregationValue.fromJson(
                      e as Map<String, dynamic>))
              ?.toList()),
    ),
    productViewSummaries: (json['ProductViewSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductViewSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchProvisionedProductsInputToJson(
    SearchProvisionedProductsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AccessLevelFilter', instance.accessLevelFilter?.toJson());
  writeNotNull('Filters', instance.filters);
  writeNotNull('PageSize', instance.pageSize);
  writeNotNull('PageToken', instance.pageToken);
  writeNotNull('SortBy', instance.sortBy);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

SearchProvisionedProductsOutput _$SearchProvisionedProductsOutputFromJson(
    Map<String, dynamic> json) {
  return SearchProvisionedProductsOutput(
    nextPageToken: json['NextPageToken'] as String,
    provisionedProducts: (json['ProvisionedProducts'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisionedProductAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalResultsCount: json['TotalResultsCount'] as int,
  );
}

Map<String, dynamic> _$ServiceActionAssociationToJson(
    ServiceActionAssociation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('ServiceActionId', instance.serviceActionId);
  return val;
}

ServiceActionDetail _$ServiceActionDetailFromJson(Map<String, dynamic> json) {
  return ServiceActionDetail(
    definition: (json['Definition'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    serviceActionSummary: json['ServiceActionSummary'] == null
        ? null
        : ServiceActionSummary.fromJson(
            json['ServiceActionSummary'] as Map<String, dynamic>),
  );
}

ServiceActionSummary _$ServiceActionSummaryFromJson(Map<String, dynamic> json) {
  return ServiceActionSummary(
    definitionType: _$enumDecodeNullable(
        _$ServiceActionDefinitionTypeEnumMap, json['DefinitionType']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

ShareDetails _$ShareDetailsFromJson(Map<String, dynamic> json) {
  return ShareDetails(
    shareErrors: (json['ShareErrors'] as List)
        ?.map((e) =>
            e == null ? null : ShareError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    successfulShares:
        (json['SuccessfulShares'] as List)?.map((e) => e as String)?.toList(),
  );
}

ShareError _$ShareErrorFromJson(Map<String, dynamic> json) {
  return ShareError(
    accounts: (json['Accounts'] as List)?.map((e) => e as String)?.toList(),
    error: json['Error'] as String,
    message: json['Message'] as String,
  );
}

StackInstance _$StackInstanceFromJson(Map<String, dynamic> json) {
  return StackInstance(
    account: json['Account'] as String,
    region: json['Region'] as String,
    stackInstanceStatus: _$enumDecodeNullable(
        _$StackInstanceStatusEnumMap, json['StackInstanceStatus']),
  );
}

const _$StackInstanceStatusEnumMap = {
  StackInstanceStatus.current: 'CURRENT',
  StackInstanceStatus.outdated: 'OUTDATED',
  StackInstanceStatus.inoperable: 'INOPERABLE',
};

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

TagOptionDetail _$TagOptionDetailFromJson(Map<String, dynamic> json) {
  return TagOptionDetail(
    active: json['Active'] as bool,
    id: json['Id'] as String,
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

TagOptionSummary _$TagOptionSummaryFromJson(Map<String, dynamic> json) {
  return TagOptionSummary(
    key: json['Key'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TerminateProvisionedProductInputToJson(
    TerminateProvisionedProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TerminateToken', instance.terminateToken);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('IgnoreErrors', instance.ignoreErrors);
  writeNotNull('ProvisionedProductId', instance.provisionedProductId);
  writeNotNull('ProvisionedProductName', instance.provisionedProductName);
  return val;
}

TerminateProvisionedProductOutput _$TerminateProvisionedProductOutputFromJson(
    Map<String, dynamic> json) {
  return TerminateProvisionedProductOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateConstraintInputToJson(
    UpdateConstraintInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Description', instance.description);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

UpdateConstraintOutput _$UpdateConstraintOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateConstraintOutput(
    constraintDetail: json['ConstraintDetail'] == null
        ? null
        : ConstraintDetail.fromJson(
            json['ConstraintDetail'] as Map<String, dynamic>),
    constraintParameters: json['ConstraintParameters'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$UpdatePortfolioInputToJson(
    UpdatePortfolioInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AddTags', instance.addTags?.map((e) => e?.toJson())?.toList());
  writeNotNull('Description', instance.description);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('ProviderName', instance.providerName);
  writeNotNull('RemoveTags', instance.removeTags);
  return val;
}

UpdatePortfolioOutput _$UpdatePortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return UpdatePortfolioOutput(
    portfolioDetail: json['PortfolioDetail'] == null
        ? null
        : PortfolioDetail.fromJson(
            json['PortfolioDetail'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateProductInputToJson(UpdateProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('AddTags', instance.addTags?.map((e) => e?.toJson())?.toList());
  writeNotNull('Description', instance.description);
  writeNotNull('Distributor', instance.distributor);
  writeNotNull('Name', instance.name);
  writeNotNull('Owner', instance.owner);
  writeNotNull('RemoveTags', instance.removeTags);
  writeNotNull('SupportDescription', instance.supportDescription);
  writeNotNull('SupportEmail', instance.supportEmail);
  writeNotNull('SupportUrl', instance.supportUrl);
  return val;
}

UpdateProductOutput _$UpdateProductOutputFromJson(Map<String, dynamic> json) {
  return UpdateProductOutput(
    productViewDetail: json['ProductViewDetail'] == null
        ? null
        : ProductViewDetail.fromJson(
            json['ProductViewDetail'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateProvisionedProductInputToJson(
    UpdateProvisionedProductInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UpdateToken', instance.updateToken);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('PathId', instance.pathId);
  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisionedProductId', instance.provisionedProductId);
  writeNotNull('ProvisionedProductName', instance.provisionedProductName);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('ProvisioningParameters',
      instance.provisioningParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProvisioningPreferences', instance.provisioningPreferences?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateProvisionedProductOutput _$UpdateProvisionedProductOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateProvisionedProductOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateProvisionedProductPropertiesInputToJson(
    UpdateProvisionedProductPropertiesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdempotencyToken', instance.idempotencyToken);
  writeNotNull('ProvisionedProductId', instance.provisionedProductId);
  writeNotNull(
      'ProvisionedProductProperties', instance.provisionedProductProperties);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  return val;
}

UpdateProvisionedProductPropertiesOutput
    _$UpdateProvisionedProductPropertiesOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateProvisionedProductPropertiesOutput(
    provisionedProductId: json['ProvisionedProductId'] as String,
    provisionedProductProperties:
        (json['ProvisionedProductProperties'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    recordId: json['RecordId'] as String,
    status: _$enumDecodeNullable(_$RecordStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$UpdateProvisioningArtifactInputToJson(
    UpdateProvisioningArtifactInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductId', instance.productId);
  writeNotNull('ProvisioningArtifactId', instance.provisioningArtifactId);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Active', instance.active);
  writeNotNull('Description', instance.description);
  writeNotNull(
      'Guidance', _$ProvisioningArtifactGuidanceEnumMap[instance.guidance]);
  writeNotNull('Name', instance.name);
  return val;
}

UpdateProvisioningArtifactOutput _$UpdateProvisioningArtifactOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateProvisioningArtifactOutput(
    info: (json['Info'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    provisioningArtifactDetail: json['ProvisioningArtifactDetail'] == null
        ? null
        : ProvisioningArtifactDetail.fromJson(
            json['ProvisioningArtifactDetail'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
  );
}

UpdateProvisioningParameter _$UpdateProvisioningParameterFromJson(
    Map<String, dynamic> json) {
  return UpdateProvisioningParameter(
    key: json['Key'] as String,
    usePreviousValue: json['UsePreviousValue'] as bool,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$UpdateProvisioningParameterToJson(
    UpdateProvisioningParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('UsePreviousValue', instance.usePreviousValue);
  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$UpdateProvisioningPreferencesToJson(
    UpdateProvisioningPreferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StackSetAccounts', instance.stackSetAccounts);
  writeNotNull(
      'StackSetFailureToleranceCount', instance.stackSetFailureToleranceCount);
  writeNotNull('StackSetFailureTolerancePercentage',
      instance.stackSetFailureTolerancePercentage);
  writeNotNull(
      'StackSetMaxConcurrencyCount', instance.stackSetMaxConcurrencyCount);
  writeNotNull('StackSetMaxConcurrencyPercentage',
      instance.stackSetMaxConcurrencyPercentage);
  writeNotNull('StackSetOperationType',
      _$StackSetOperationTypeEnumMap[instance.stackSetOperationType]);
  writeNotNull('StackSetRegions', instance.stackSetRegions);
  return val;
}

const _$StackSetOperationTypeEnumMap = {
  StackSetOperationType.create: 'CREATE',
  StackSetOperationType.update: 'UPDATE',
  StackSetOperationType.delete: 'DELETE',
};

Map<String, dynamic> _$UpdateServiceActionInputToJson(
    UpdateServiceActionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('AcceptLanguage', instance.acceptLanguage);
  writeNotNull('Definition', instance.definition);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  return val;
}

UpdateServiceActionOutput _$UpdateServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceActionOutput(
    serviceActionDetail: json['ServiceActionDetail'] == null
        ? null
        : ServiceActionDetail.fromJson(
            json['ServiceActionDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTagOptionInputToJson(
    UpdateTagOptionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Active', instance.active);
  writeNotNull('Value', instance.value);
  return val;
}

UpdateTagOptionOutput _$UpdateTagOptionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateTagOptionOutput(
    tagOptionDetail: json['TagOptionDetail'] == null
        ? null
        : TagOptionDetail.fromJson(
            json['TagOptionDetail'] as Map<String, dynamic>),
  );
}

UsageInstruction _$UsageInstructionFromJson(Map<String, dynamic> json) {
  return UsageInstruction(
    type: json['Type'] as String,
    value: json['Value'] as String,
  );
}
