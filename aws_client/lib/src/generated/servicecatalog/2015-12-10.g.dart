// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-12-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

AssociateBudgetWithResourceOutput _$AssociateBudgetWithResourceOutputFromJson(
    Map<String, dynamic> json) {
  return AssociateBudgetWithResourceOutput();
}

AssociatePrincipalWithPortfolioOutput
    _$AssociatePrincipalWithPortfolioOutputFromJson(Map<String, dynamic> json) {
  return AssociatePrincipalWithPortfolioOutput();
}

AssociateProductWithPortfolioOutput
    _$AssociateProductWithPortfolioOutputFromJson(Map<String, dynamic> json) {
  return AssociateProductWithPortfolioOutput();
}

AssociateServiceActionWithProvisioningArtifactOutput
    _$AssociateServiceActionWithProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return AssociateServiceActionWithProvisioningArtifactOutput();
}

AssociateTagOptionWithResourceOutput
    _$AssociateTagOptionWithResourceOutputFromJson(Map<String, dynamic> json) {
  return AssociateTagOptionWithResourceOutput();
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

CopyProductOutput _$CopyProductOutputFromJson(Map<String, dynamic> json) {
  return CopyProductOutput(
    copyProductToken: json['CopyProductToken'] as String,
  );
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

CreatePortfolioShareOutput _$CreatePortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return CreatePortfolioShareOutput(
    portfolioShareToken: json['PortfolioShareToken'] as String,
  );
}

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

CreateServiceActionOutput _$CreateServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateServiceActionOutput(
    serviceActionDetail: json['ServiceActionDetail'] == null
        ? null
        : ServiceActionDetail.fromJson(
            json['ServiceActionDetail'] as Map<String, dynamic>),
  );
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

DeleteConstraintOutput _$DeleteConstraintOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteConstraintOutput();
}

DeletePortfolioOutput _$DeletePortfolioOutputFromJson(
    Map<String, dynamic> json) {
  return DeletePortfolioOutput();
}

DeletePortfolioShareOutput _$DeletePortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return DeletePortfolioShareOutput(
    portfolioShareToken: json['PortfolioShareToken'] as String,
  );
}

DeleteProductOutput _$DeleteProductOutputFromJson(Map<String, dynamic> json) {
  return DeleteProductOutput();
}

DeleteProvisionedProductPlanOutput _$DeleteProvisionedProductPlanOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteProvisionedProductPlanOutput();
}

DeleteProvisioningArtifactOutput _$DeleteProvisioningArtifactOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteProvisioningArtifactOutput();
}

DeleteServiceActionOutput _$DeleteServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteServiceActionOutput();
}

DeleteTagOptionOutput _$DeleteTagOptionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteTagOptionOutput();
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

DescribePortfolioSharesOutput _$DescribePortfolioSharesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePortfolioSharesOutput(
    nextPageToken: json['NextPageToken'] as String,
    portfolioShareDetails: (json['PortfolioShareDetails'] as List)
        ?.map((e) => e == null
            ? null
            : PortfolioShareDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

DescribeProductOutput _$DescribeProductOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProductOutput(
    budgets: (json['Budgets'] as List)
        ?.map((e) =>
            e == null ? null : BudgetDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    launchPaths: (json['LaunchPaths'] as List)
        ?.map((e) =>
            e == null ? null : LaunchPath.fromJson(e as Map<String, dynamic>))
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

DescribeProvisioningParametersOutput
    _$DescribeProvisioningParametersOutputFromJson(Map<String, dynamic> json) {
  return DescribeProvisioningParametersOutput(
    constraintSummaries: (json['ConstraintSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ConstraintSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    provisioningArtifactOutputs: (json['ProvisioningArtifactOutputs'] as List)
        ?.map((e) => e == null
            ? null
            : ProvisioningArtifactOutput.fromJson(e as Map<String, dynamic>))
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

DescribeServiceActionOutput _$DescribeServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeServiceActionOutput(
    serviceActionDetail: json['ServiceActionDetail'] == null
        ? null
        : ServiceActionDetail.fromJson(
            json['ServiceActionDetail'] as Map<String, dynamic>),
  );
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

DisassociateBudgetFromResourceOutput
    _$DisassociateBudgetFromResourceOutputFromJson(Map<String, dynamic> json) {
  return DisassociateBudgetFromResourceOutput();
}

DisassociatePrincipalFromPortfolioOutput
    _$DisassociatePrincipalFromPortfolioOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociatePrincipalFromPortfolioOutput();
}

DisassociateProductFromPortfolioOutput
    _$DisassociateProductFromPortfolioOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociateProductFromPortfolioOutput();
}

DisassociateServiceActionFromProvisioningArtifactOutput
    _$DisassociateServiceActionFromProvisioningArtifactOutputFromJson(
        Map<String, dynamic> json) {
  return DisassociateServiceActionFromProvisioningArtifactOutput();
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

ExecuteProvisionedProductPlanOutput
    _$ExecuteProvisionedProductPlanOutputFromJson(Map<String, dynamic> json) {
  return ExecuteProvisionedProductPlanOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
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

GetProvisionedProductOutputsOutput _$GetProvisionedProductOutputsOutputFromJson(
    Map<String, dynamic> json) {
  return GetProvisionedProductOutputsOutput(
    nextPageToken: json['NextPageToken'] as String,
    outputs: (json['Outputs'] as List)
        ?.map((e) =>
            e == null ? null : RecordOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ImportAsProvisionedProductOutput _$ImportAsProvisionedProductOutputFromJson(
    Map<String, dynamic> json) {
  return ImportAsProvisionedProductOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

LaunchPath _$LaunchPathFromJson(Map<String, dynamic> json) {
  return LaunchPath(
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

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

ListPortfolioAccessOutput _$ListPortfolioAccessOutputFromJson(
    Map<String, dynamic> json) {
  return ListPortfolioAccessOutput(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    nextPageToken: json['NextPageToken'] as String,
  );
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

const _$OrganizationNodeTypeEnumMap = {
  OrganizationNodeType.organization: 'ORGANIZATION',
  OrganizationNodeType.organizationalUnit: 'ORGANIZATIONAL_UNIT',
  OrganizationNodeType.account: 'ACCOUNT',
};

ParameterConstraints _$ParameterConstraintsFromJson(Map<String, dynamic> json) {
  return ParameterConstraints(
    allowedPattern: json['AllowedPattern'] as String,
    allowedValues:
        (json['AllowedValues'] as List)?.map((e) => e as String)?.toList(),
    constraintDescription: json['ConstraintDescription'] as String,
    maxLength: json['MaxLength'] as String,
    maxValue: json['MaxValue'] as String,
    minLength: json['MinLength'] as String,
    minValue: json['MinValue'] as String,
  );
}

PortfolioDetail _$PortfolioDetailFromJson(Map<String, dynamic> json) {
  return PortfolioDetail(
    arn: json['ARN'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    id: json['Id'] as String,
    providerName: json['ProviderName'] as String,
  );
}

PortfolioShareDetail _$PortfolioShareDetailFromJson(Map<String, dynamic> json) {
  return PortfolioShareDetail(
    accepted: json['Accepted'] as bool,
    principalId: json['PrincipalId'] as String,
    shareTagOptions: json['ShareTagOptions'] as bool,
    type:
        _$enumDecodeNullable(_$DescribePortfolioShareTypeEnumMap, json['Type']),
  );
}

const _$DescribePortfolioShareTypeEnumMap = {
  DescribePortfolioShareType.account: 'ACCOUNT',
  DescribePortfolioShareType.organization: 'ORGANIZATION',
  DescribePortfolioShareType.organizationalUnit: 'ORGANIZATIONAL_UNIT',
  DescribePortfolioShareType.organizationMemberAccount:
      'ORGANIZATION_MEMBER_ACCOUNT',
};

Principal _$PrincipalFromJson(Map<String, dynamic> json) {
  return Principal(
    principalARN: json['PrincipalARN'] as String,
    principalType:
        _$enumDecodeNullable(_$PrincipalTypeEnumMap, json['PrincipalType']),
  );
}

const _$PrincipalTypeEnumMap = {
  PrincipalType.iam: 'IAM',
};

ProductViewAggregationValue _$ProductViewAggregationValueFromJson(
    Map<String, dynamic> json) {
  return ProductViewAggregationValue(
    approximateCount: json['ApproximateCount'] as int,
    value: json['Value'] as String,
  );
}

ProductViewDetail _$ProductViewDetailFromJson(Map<String, dynamic> json) {
  return ProductViewDetail(
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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

const _$ProductTypeEnumMap = {
  ProductType.cloudFormationTemplate: 'CLOUD_FORMATION_TEMPLATE',
  ProductType.marketplace: 'MARKETPLACE',
};

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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    id: json['Id'] as String,
    idempotencyToken: json['IdempotencyToken'] as String,
    lastProvisioningRecordId: json['LastProvisioningRecordId'] as String,
    lastRecordId: json['LastRecordId'] as String,
    lastSuccessfulProvisioningRecordId:
        json['LastSuccessfulProvisioningRecordId'] as String,
    name: json['Name'] as String,
    physicalId: json['PhysicalId'] as String,
    productId: json['ProductId'] as String,
    productName: json['ProductName'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    provisioningArtifactName: json['ProvisioningArtifactName'] as String,
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    id: json['Id'] as String,
    idempotencyToken: json['IdempotencyToken'] as String,
    lastProvisioningRecordId: json['LastProvisioningRecordId'] as String,
    lastRecordId: json['LastRecordId'] as String,
    lastSuccessfulProvisioningRecordId:
        json['LastSuccessfulProvisioningRecordId'] as String,
    launchRoleArn: json['LaunchRoleArn'] as String,
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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
    updatedTime: const UnixDateTimeConverter().fromJson(json['UpdatedTime']),
  );
}

const _$ProvisionedProductPlanTypeEnumMap = {
  ProvisionedProductPlanType.cloudformation: 'CLOUDFORMATION',
};

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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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

ProvisioningArtifactOutput _$ProvisioningArtifactOutputFromJson(
    Map<String, dynamic> json) {
  return ProvisioningArtifactOutput(
    description: json['Description'] as String,
    key: json['Key'] as String,
  );
}

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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    launchRoleArn: json['LaunchRoleArn'] as String,
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
    updatedTime: const UnixDateTimeConverter().fromJson(json['UpdatedTime']),
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
    scope: (json['Scope'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ResourceAttributeEnumMap, e))
        ?.toList(),
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

const _$ResourceAttributeEnumMap = {
  ResourceAttribute.properties: 'PROPERTIES',
  ResourceAttribute.metadata: 'METADATA',
  ResourceAttribute.creationpolicy: 'CREATIONPOLICY',
  ResourceAttribute.updatepolicy: 'UPDATEPOLICY',
  ResourceAttribute.deletionpolicy: 'DELETIONPOLICY',
  ResourceAttribute.tags: 'TAGS',
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
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
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

const _$RequiresRecreationEnumMap = {
  RequiresRecreation.never: 'NEVER',
  RequiresRecreation.conditionally: 'CONDITIONALLY',
  RequiresRecreation.always: 'ALWAYS',
};

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
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$ServiceActionDefinitionKeyEnumMap, k),
          e as String),
    ),
    serviceActionSummary: json['ServiceActionSummary'] == null
        ? null
        : ServiceActionSummary.fromJson(
            json['ServiceActionSummary'] as Map<String, dynamic>),
  );
}

const _$ServiceActionDefinitionKeyEnumMap = {
  ServiceActionDefinitionKey.name: 'Name',
  ServiceActionDefinitionKey.version: 'Version',
  ServiceActionDefinitionKey.assumeRole: 'AssumeRole',
  ServiceActionDefinitionKey.parameters: 'Parameters',
};

ServiceActionSummary _$ServiceActionSummaryFromJson(Map<String, dynamic> json) {
  return ServiceActionSummary(
    definitionType: _$enumDecodeNullable(
        _$ServiceActionDefinitionTypeEnumMap, json['DefinitionType']),
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

const _$ServiceActionDefinitionTypeEnumMap = {
  ServiceActionDefinitionType.ssmAutomation: 'SSM_AUTOMATION',
};

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
    owner: json['Owner'] as String,
    value: json['Value'] as String,
  );
}

TagOptionSummary _$TagOptionSummaryFromJson(Map<String, dynamic> json) {
  return TagOptionSummary(
    key: json['Key'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

TerminateProvisionedProductOutput _$TerminateProvisionedProductOutputFromJson(
    Map<String, dynamic> json) {
  return TerminateProvisionedProductOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
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

UpdatePortfolioShareOutput _$UpdatePortfolioShareOutputFromJson(
    Map<String, dynamic> json) {
  return UpdatePortfolioShareOutput(
    portfolioShareToken: json['PortfolioShareToken'] as String,
    status: _$enumDecodeNullable(_$ShareStatusEnumMap, json['Status']),
  );
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

UpdateProvisionedProductOutput _$UpdateProvisionedProductOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateProvisionedProductOutput(
    recordDetail: json['RecordDetail'] == null
        ? null
        : RecordDetail.fromJson(json['RecordDetail'] as Map<String, dynamic>),
  );
}

UpdateProvisionedProductPropertiesOutput
    _$UpdateProvisionedProductPropertiesOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateProvisionedProductPropertiesOutput(
    provisionedProductId: json['ProvisionedProductId'] as String,
    provisionedProductProperties:
        (json['ProvisionedProductProperties'] as Map<String, dynamic>)?.map(
      (k, e) =>
          MapEntry(_$enumDecodeNullable(_$PropertyKeyEnumMap, k), e as String),
    ),
    recordId: json['RecordId'] as String,
    status: _$enumDecodeNullable(_$RecordStatusEnumMap, json['Status']),
  );
}

const _$PropertyKeyEnumMap = {
  PropertyKey.owner: 'OWNER',
  PropertyKey.launchRole: 'LAUNCH_ROLE',
};

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

UpdateServiceActionOutput _$UpdateServiceActionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateServiceActionOutput(
    serviceActionDetail: json['ServiceActionDetail'] == null
        ? null
        : ServiceActionDetail.fromJson(
            json['ServiceActionDetail'] as Map<String, dynamic>),
  );
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
