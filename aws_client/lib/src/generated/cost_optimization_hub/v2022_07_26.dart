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

/// You can use the Cost Optimization Hub API to programmatically identify,
/// filter, aggregate, and quantify savings for your cost optimization
/// recommendations across multiple Amazon Web Services Regions and Amazon Web
/// Services accounts in your organization.
///
/// The Cost Optimization Hub API provides the following endpoint:
///
/// <ul>
/// <li>
/// https://cost-optimization-hub.us-east-1.amazonaws.com
/// </li>
/// </ul>
class CostOptimizationHub {
  final _s.JsonProtocol _protocol;
  CostOptimizationHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cost-optimization-hub',
            signingName: 'cost-optimization-hub',
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

  /// Returns a set of preferences for an account in order to add
  /// account-specific preferences into the service. These preferences impact
  /// how the savings associated with recommendations are presented—estimated
  /// savings after discounts or estimated savings before discounts, for
  /// example.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetPreferencesResponse> getPreferences() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.GetPreferences'
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

  /// Returns both the current and recommended resource configuration and the
  /// estimated cost impact for a recommendation.
  ///
  /// The <code>recommendationId</code> is only valid for up to a maximum of 24
  /// hours as recommendations are refreshed daily. To retrieve the
  /// <code>recommendationId</code>, use the <code>ListRecommendations</code>
  /// API.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendationId] :
  /// The ID for the recommendation.
  Future<GetRecommendationResponse> getRecommendation({
    required String recommendationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.GetRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommendationId': recommendationId,
      },
    );

    return GetRecommendationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the enrollment status for an account. It can also return the
  /// list of accounts that are enrolled under the organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accountId] :
  /// The account ID of a member account in the organization.
  ///
  /// Parameter [includeOrganizationInfo] :
  /// Indicates whether to return the enrollment status for the organization.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListEnrollmentStatusesResponse> listEnrollmentStatuses({
    String? accountId,
    bool? includeOrganizationInfo,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListEnrollmentStatuses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accountId != null) 'accountId': accountId,
        if (includeOrganizationInfo != null)
          'includeOrganizationInfo': includeOrganizationInfo,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnrollmentStatusesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a concise representation of savings estimates for resources. Also
  /// returns de-duped savings across different types of recommendations.
  /// <note>
  /// The following filters are not supported for this API:
  /// <code>recommendationIds</code>, <code>resourceArns</code>, and
  /// <code>resourceIds</code>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [groupBy] :
  /// The grouping of recommendations by a dimension.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendations that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  Future<ListRecommendationSummariesResponse> listRecommendationSummaries({
    required String groupBy,
    Filter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListRecommendationSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'groupBy': groupBy,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRecommendationSummariesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of recommendations.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filter] :
  /// The constraints that you want all returned recommendations to match.
  ///
  /// Parameter [includeAllRecommendations] :
  /// List of all recommendations for a resource, or a single recommendation if
  /// de-duped by <code>resourceId</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendations that are returned for the request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [orderBy] :
  /// The ordering of recommendations by a dimension.
  Future<ListRecommendationsResponse> listRecommendations({
    Filter? filter,
    bool? includeAllRecommendations,
    int? maxResults,
    String? nextToken,
    OrderBy? orderBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.ListRecommendations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (includeAllRecommendations != null)
          'includeAllRecommendations': includeAllRecommendations,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (orderBy != null) 'orderBy': orderBy,
      },
    );

    return ListRecommendationsResponse.fromJson(jsonResponse.body);
  }

  /// Updates the enrollment (opt in and opt out) status of an account to the
  /// Cost Optimization Hub service.
  ///
  /// If the account is a management account of an organization, this action can
  /// also be used to enroll member accounts of the organization.
  ///
  /// You must have the appropriate permissions to opt in to Cost Optimization
  /// Hub and to view its recommendations. When you opt in, Cost Optimization
  /// Hub automatically creates a service-linked role in your account to access
  /// its data.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [status] :
  /// Sets the account status.
  ///
  /// Parameter [includeMemberAccounts] :
  /// Indicates whether to enroll member accounts of the organization if the
  /// account is the management account.
  Future<UpdateEnrollmentStatusResponse> updateEnrollmentStatus({
    required EnrollmentStatus status,
    bool? includeMemberAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.UpdateEnrollmentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'status': status.toValue(),
        if (includeMemberAccounts != null)
          'includeMemberAccounts': includeMemberAccounts,
      },
    );

    return UpdateEnrollmentStatusResponse.fromJson(jsonResponse.body);
  }

  /// Updates a set of preferences for an account in order to add
  /// account-specific preferences into the service. These preferences impact
  /// how the savings associated with recommendations are presented.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [memberAccountDiscountVisibility] :
  /// Sets the "member account discount visibility" preference.
  ///
  /// Parameter [savingsEstimationMode] :
  /// Sets the "savings estimation mode" preference.
  Future<UpdatePreferencesResponse> updatePreferences({
    MemberAccountDiscountVisibility? memberAccountDiscountVisibility,
    SavingsEstimationMode? savingsEstimationMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'CostOptimizationHubService.UpdatePreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (memberAccountDiscountVisibility != null)
          'memberAccountDiscountVisibility':
              memberAccountDiscountVisibility.toValue(),
        if (savingsEstimationMode != null)
          'savingsEstimationMode': savingsEstimationMode.toValue(),
      },
    );

    return UpdatePreferencesResponse.fromJson(jsonResponse.body);
  }
}

/// Describes the enrollment status of an organization's member accounts in Cost
/// Optimization Hub.
class AccountEnrollmentStatus {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The time when the account enrollment status was created.
  final DateTime? createdTimestamp;

  /// The time when the account enrollment status was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The account enrollment status.
  final EnrollmentStatus? status;

  AccountEnrollmentStatus({
    this.accountId,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.status,
  });

  factory AccountEnrollmentStatus.fromJson(Map<String, dynamic> json) {
    return AccountEnrollmentStatus(
      accountId: json['accountId'] as String?,
      createdTimestamp: timeStampFromJson(json['createdTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['lastUpdatedTimestamp']),
      status: (json['status'] as String?)?.toEnrollmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final status = this.status;
    return {
      if (accountId != null) 'accountId': accountId,
      if (createdTimestamp != null)
        'createdTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastUpdatedTimestamp != null)
        'lastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ActionType {
  rightsize,
  stop,
  upgrade,
  purchaseSavingsPlans,
  purchaseReservedInstances,
  migrateToGraviton,
}

extension ActionTypeValueExtension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.rightsize:
        return 'Rightsize';
      case ActionType.stop:
        return 'Stop';
      case ActionType.upgrade:
        return 'Upgrade';
      case ActionType.purchaseSavingsPlans:
        return 'PurchaseSavingsPlans';
      case ActionType.purchaseReservedInstances:
        return 'PurchaseReservedInstances';
      case ActionType.migrateToGraviton:
        return 'MigrateToGraviton';
    }
  }
}

extension ActionTypeFromString on String {
  ActionType toActionType() {
    switch (this) {
      case 'Rightsize':
        return ActionType.rightsize;
      case 'Stop':
        return ActionType.stop;
      case 'Upgrade':
        return ActionType.upgrade;
      case 'PurchaseSavingsPlans':
        return ActionType.purchaseSavingsPlans;
      case 'PurchaseReservedInstances':
        return ActionType.purchaseReservedInstances;
      case 'MigrateToGraviton':
        return ActionType.migrateToGraviton;
    }
    throw Exception('$this is not known in enum ActionType');
  }
}

/// Describes the Amazon Elastic Block Store performance configuration of the
/// current and recommended resource configuration for a recommendation.
class BlockStoragePerformanceConfiguration {
  /// The number of I/O operations per second.
  final double? iops;

  /// The throughput that the volume supports.
  final double? throughput;

  BlockStoragePerformanceConfiguration({
    this.iops,
    this.throughput,
  });

  factory BlockStoragePerformanceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return BlockStoragePerformanceConfiguration(
      iops: json['iops'] as double?,
      throughput: json['throughput'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final throughput = this.throughput;
    return {
      if (iops != null) 'iops': iops,
      if (throughput != null) 'throughput': throughput,
    };
  }
}

/// Describes the performance configuration for compute services such as Amazon
/// EC2, Lambda, and ECS.
class ComputeConfiguration {
  /// The architecture of the resource.
  final String? architecture;

  /// The memory size of the resource.
  final int? memorySizeInMB;

  /// The platform of the resource. The platform is the specific combination of
  /// operating system, license model, and software on an instance.
  final String? platform;

  /// The number of vCPU cores in the resource.
  final double? vCpu;

  ComputeConfiguration({
    this.architecture,
    this.memorySizeInMB,
    this.platform,
    this.vCpu,
  });

  factory ComputeConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeConfiguration(
      architecture: json['architecture'] as String?,
      memorySizeInMB: json['memorySizeInMB'] as int?,
      platform: json['platform'] as String?,
      vCpu: json['vCpu'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final memorySizeInMB = this.memorySizeInMB;
    final platform = this.platform;
    final vCpu = this.vCpu;
    return {
      if (architecture != null) 'architecture': architecture,
      if (memorySizeInMB != null) 'memorySizeInMB': memorySizeInMB,
      if (platform != null) 'platform': platform,
      if (vCpu != null) 'vCpu': vCpu,
    };
  }
}

/// The Compute Savings Plans recommendation details.
class ComputeSavingsPlans {
  /// Configuration details of the Compute Savings Plans to purchase.
  final ComputeSavingsPlansConfiguration? configuration;

  /// Cost impact of the Savings Plans purchase recommendation.
  final SavingsPlansCostCalculation? costCalculation;

  ComputeSavingsPlans({
    this.configuration,
    this.costCalculation,
  });

  factory ComputeSavingsPlans.fromJson(Map<String, dynamic> json) {
    return ComputeSavingsPlans(
      configuration: json['configuration'] != null
          ? ComputeSavingsPlansConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? SavingsPlansCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The Compute Savings Plans configuration used for recommendations.
class ComputeSavingsPlansConfiguration {
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the management account and
  /// member accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual member
  /// accounts only.
  final String? accountScope;

  /// The hourly commitment for the Savings Plans type.
  final String? hourlyCommitment;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Savings Plans recommendation term in years.
  final String? term;

  ComputeSavingsPlansConfiguration({
    this.accountScope,
    this.hourlyCommitment,
    this.paymentOption,
    this.term,
  });

  factory ComputeSavingsPlansConfiguration.fromJson(Map<String, dynamic> json) {
    return ComputeSavingsPlansConfiguration(
      accountScope: json['accountScope'] as String?,
      hourlyCommitment: json['hourlyCommitment'] as String?,
      paymentOption: json['paymentOption'] as String?,
      term: json['term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final hourlyCommitment = this.hourlyCommitment;
    final paymentOption = this.paymentOption;
    final term = this.term;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (hourlyCommitment != null) 'hourlyCommitment': hourlyCommitment,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (term != null) 'term': term,
    };
  }
}

/// Describes the Amazon Elastic Block Store volume configuration of the current
/// and recommended resource configuration for a recommendation.
class EbsVolume {
  /// The Amazon Elastic Block Store volume configuration used for
  /// recommendations.
  final EbsVolumeConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  EbsVolume({
    this.configuration,
    this.costCalculation,
  });

  factory EbsVolume.fromJson(Map<String, dynamic> json) {
    return EbsVolume(
      configuration: json['configuration'] != null
          ? EbsVolumeConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The Amazon Elastic Block Store volume configuration used for
/// recommendations.
class EbsVolumeConfiguration {
  /// The Amazon Elastic Block Store attachment state.
  final String? attachmentState;

  /// The Amazon Elastic Block Store performance configuration.
  final BlockStoragePerformanceConfiguration? performance;

  /// The disk storage of the Amazon Elastic Block Store volume.
  final StorageConfiguration? storage;

  EbsVolumeConfiguration({
    this.attachmentState,
    this.performance,
    this.storage,
  });

  factory EbsVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return EbsVolumeConfiguration(
      attachmentState: json['attachmentState'] as String?,
      performance: json['performance'] != null
          ? BlockStoragePerformanceConfiguration.fromJson(
              json['performance'] as Map<String, dynamic>)
          : null,
      storage: json['storage'] != null
          ? StorageConfiguration.fromJson(
              json['storage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentState = this.attachmentState;
    final performance = this.performance;
    final storage = this.storage;
    return {
      if (attachmentState != null) 'attachmentState': attachmentState,
      if (performance != null) 'performance': performance,
      if (storage != null) 'storage': storage,
    };
  }
}

/// The EC2 Auto Scaling group recommendation details.
class Ec2AutoScalingGroup {
  /// The EC2 Auto Scaling group configuration used for recommendations.
  final Ec2AutoScalingGroupConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  Ec2AutoScalingGroup({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2AutoScalingGroup.fromJson(Map<String, dynamic> json) {
    return Ec2AutoScalingGroup(
      configuration: json['configuration'] != null
          ? Ec2AutoScalingGroupConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 auto scaling group configuration used for recommendations.
class Ec2AutoScalingGroupConfiguration {
  /// Details about the instance.
  final InstanceConfiguration? instance;

  Ec2AutoScalingGroupConfiguration({
    this.instance,
  });

  factory Ec2AutoScalingGroupConfiguration.fromJson(Map<String, dynamic> json) {
    return Ec2AutoScalingGroupConfiguration(
      instance: json['instance'] != null
          ? InstanceConfiguration.fromJson(
              json['instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'instance': instance,
    };
  }
}

/// Describes the EC2 instance configuration of the current and recommended
/// resource configuration for a recommendation.
class Ec2Instance {
  /// The EC2 instance configuration used for recommendations.
  final Ec2InstanceConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  Ec2Instance({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2Instance.fromJson(Map<String, dynamic> json) {
    return Ec2Instance(
      configuration: json['configuration'] != null
          ? Ec2InstanceConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 instance configuration used for recommendations.
class Ec2InstanceConfiguration {
  /// Details about the instance.
  final InstanceConfiguration? instance;

  Ec2InstanceConfiguration({
    this.instance,
  });

  factory Ec2InstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceConfiguration(
      instance: json['instance'] != null
          ? InstanceConfiguration.fromJson(
              json['instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'instance': instance,
    };
  }
}

/// The EC2 instance Savings Plans recommendation details.
class Ec2InstanceSavingsPlans {
  /// The EC2 instance Savings Plans configuration used for recommendations.
  final Ec2InstanceSavingsPlansConfiguration? configuration;

  /// Cost impact of the Savings Plans purchase recommendation.
  final SavingsPlansCostCalculation? costCalculation;

  Ec2InstanceSavingsPlans({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2InstanceSavingsPlans.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceSavingsPlans(
      configuration: json['configuration'] != null
          ? Ec2InstanceSavingsPlansConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? SavingsPlansCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 instance Savings Plans configuration used for recommendations.
class Ec2InstanceSavingsPlansConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// The hourly commitment for the Savings Plans type.
  final String? hourlyCommitment;

  /// The instance family of the recommended Savings Plan.
  final String? instanceFamily;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? savingsPlansRegion;

  /// The Savings Plans recommendation term in years.
  final String? term;

  Ec2InstanceSavingsPlansConfiguration({
    this.accountScope,
    this.hourlyCommitment,
    this.instanceFamily,
    this.paymentOption,
    this.savingsPlansRegion,
    this.term,
  });

  factory Ec2InstanceSavingsPlansConfiguration.fromJson(
      Map<String, dynamic> json) {
    return Ec2InstanceSavingsPlansConfiguration(
      accountScope: json['accountScope'] as String?,
      hourlyCommitment: json['hourlyCommitment'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      paymentOption: json['paymentOption'] as String?,
      savingsPlansRegion: json['savingsPlansRegion'] as String?,
      term: json['term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final hourlyCommitment = this.hourlyCommitment;
    final instanceFamily = this.instanceFamily;
    final paymentOption = this.paymentOption;
    final savingsPlansRegion = this.savingsPlansRegion;
    final term = this.term;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (hourlyCommitment != null) 'hourlyCommitment': hourlyCommitment,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (savingsPlansRegion != null) 'savingsPlansRegion': savingsPlansRegion,
      if (term != null) 'term': term,
    };
  }
}

/// The EC2 reserved instances recommendation details.
class Ec2ReservedInstances {
  /// The EC2 reserved instances configuration used for recommendations.
  final Ec2ReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  Ec2ReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory Ec2ReservedInstances.fromJson(Map<String, dynamic> json) {
    return Ec2ReservedInstances(
      configuration: json['configuration'] != null
          ? Ec2ReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The EC2 reserved instances configuration used for recommendations.
class Ec2ReservedInstancesConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// Indicates whether the recommendation is for standard or convertible
  /// reservations.
  final String? offeringClass;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The platform of the recommended reservation. The platform is the specific
  /// combination of operating system, license model, and software on an instance.
  final String? platform;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service that you want your recommendations for.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// Determines whether the recommended reservation is dedicated or shared.
  final String? tenancy;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  Ec2ReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.offeringClass,
    this.paymentOption,
    this.platform,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.tenancy,
    this.term,
    this.upfrontCost,
  });

  factory Ec2ReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return Ec2ReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      offeringClass: json['offeringClass'] as String?,
      paymentOption: json['paymentOption'] as String?,
      platform: json['platform'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      tenancy: json['tenancy'] as String?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final offeringClass = this.offeringClass;
    final paymentOption = this.paymentOption;
    final platform = this.platform;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final tenancy = this.tenancy;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (offeringClass != null) 'offeringClass': offeringClass,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (platform != null) 'platform': platform,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (tenancy != null) 'tenancy': tenancy,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// The ECS service recommendation details.
class EcsService {
  /// The ECS service configuration used for recommendations.
  final EcsServiceConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  EcsService({
    this.configuration,
    this.costCalculation,
  });

  factory EcsService.fromJson(Map<String, dynamic> json) {
    return EcsService(
      configuration: json['configuration'] != null
          ? EcsServiceConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The ECS service configuration used for recommendations.
class EcsServiceConfiguration {
  /// Details about the compute configuration.
  final ComputeConfiguration? compute;

  EcsServiceConfiguration({
    this.compute,
  });

  factory EcsServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return EcsServiceConfiguration(
      compute: json['compute'] != null
          ? ComputeConfiguration.fromJson(
              json['compute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final compute = this.compute;
    return {
      if (compute != null) 'compute': compute,
    };
  }
}

/// The ElastiCache reserved instances recommendation details.
class ElastiCacheReservedInstances {
  /// The ElastiCache reserved instances configuration used for recommendations.
  final ElastiCacheReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  ElastiCacheReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory ElastiCacheReservedInstances.fromJson(Map<String, dynamic> json) {
    return ElastiCacheReservedInstances(
      configuration: json['configuration'] != null
          ? ElastiCacheReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The ElastiCache reserved instances configuration used for recommendations.
class ElastiCacheReservedInstancesConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service that you want your recommendations for.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  ElastiCacheReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory ElastiCacheReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ElastiCacheReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

enum EnrollmentStatus {
  active,
  inactive,
}

extension EnrollmentStatusValueExtension on EnrollmentStatus {
  String toValue() {
    switch (this) {
      case EnrollmentStatus.active:
        return 'Active';
      case EnrollmentStatus.inactive:
        return 'Inactive';
    }
  }
}

extension EnrollmentStatusFromString on String {
  EnrollmentStatus toEnrollmentStatus() {
    switch (this) {
      case 'Active':
        return EnrollmentStatus.active;
      case 'Inactive':
        return EnrollmentStatus.inactive;
    }
    throw Exception('$this is not known in enum EnrollmentStatus');
  }
}

/// Estimated discount details of the current and recommended resource
/// configuration for a recommendation.
class EstimatedDiscounts {
  /// Estimated other discounts include all discounts that are not itemized.
  /// Itemized discounts include <code>reservedInstanceDiscount</code> and
  /// <code>savingsPlansDiscount</code>.
  final double? otherDiscount;

  /// Estimated reserved instance discounts.
  final double? reservedInstancesDiscount;

  /// Estimated Savings Plans discounts.
  final double? savingsPlansDiscount;

  EstimatedDiscounts({
    this.otherDiscount,
    this.reservedInstancesDiscount,
    this.savingsPlansDiscount,
  });

  factory EstimatedDiscounts.fromJson(Map<String, dynamic> json) {
    return EstimatedDiscounts(
      otherDiscount: json['otherDiscount'] as double?,
      reservedInstancesDiscount: json['reservedInstancesDiscount'] as double?,
      savingsPlansDiscount: json['savingsPlansDiscount'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final otherDiscount = this.otherDiscount;
    final reservedInstancesDiscount = this.reservedInstancesDiscount;
    final savingsPlansDiscount = this.savingsPlansDiscount;
    return {
      if (otherDiscount != null) 'otherDiscount': otherDiscount,
      if (reservedInstancesDiscount != null)
        'reservedInstancesDiscount': reservedInstancesDiscount,
      if (savingsPlansDiscount != null)
        'savingsPlansDiscount': savingsPlansDiscount,
    };
  }
}

/// Describes a filter that returns a more specific list of recommendations.
/// Filters recommendations by different dimensions.
class Filter {
  /// The account that the recommendation is for.
  final List<String>? accountIds;

  /// The type of action you can take by adopting the recommendation.
  final List<ActionType>? actionTypes;

  /// The effort required to implement the recommendation.
  final List<ImplementationEffort>? implementationEfforts;

  /// The IDs for the recommendations.
  final List<String>? recommendationIds;

  /// The Amazon Web Services Region of the resource.
  final List<String>? regions;

  /// The Amazon Resource Name (ARN) of the recommendation.
  final List<String>? resourceArns;

  /// The resource ID of the recommendation.
  final List<String>? resourceIds;

  /// The resource type of the recommendation.
  final List<ResourceType>? resourceTypes;

  /// Whether or not implementing the recommendation requires a restart.
  final bool? restartNeeded;

  /// Whether or not implementing the recommendation can be rolled back.
  final bool? rollbackPossible;

  /// A list of tags assigned to the recommendation.
  final List<Tag>? tags;

  Filter({
    this.accountIds,
    this.actionTypes,
    this.implementationEfforts,
    this.recommendationIds,
    this.regions,
    this.resourceArns,
    this.resourceIds,
    this.resourceTypes,
    this.restartNeeded,
    this.rollbackPossible,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final actionTypes = this.actionTypes;
    final implementationEfforts = this.implementationEfforts;
    final recommendationIds = this.recommendationIds;
    final regions = this.regions;
    final resourceArns = this.resourceArns;
    final resourceIds = this.resourceIds;
    final resourceTypes = this.resourceTypes;
    final restartNeeded = this.restartNeeded;
    final rollbackPossible = this.rollbackPossible;
    final tags = this.tags;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (actionTypes != null)
        'actionTypes': actionTypes.map((e) => e.toValue()).toList(),
      if (implementationEfforts != null)
        'implementationEfforts':
            implementationEfforts.map((e) => e.toValue()).toList(),
      if (recommendationIds != null) 'recommendationIds': recommendationIds,
      if (regions != null) 'regions': regions,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
      if (rollbackPossible != null) 'rollbackPossible': rollbackPossible,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetPreferencesResponse {
  /// Retrieves the status of the "member account discount visibility" preference.
  final MemberAccountDiscountVisibility? memberAccountDiscountVisibility;

  /// Retrieves the status of the "savings estimation mode" preference.
  final SavingsEstimationMode? savingsEstimationMode;

  GetPreferencesResponse({
    this.memberAccountDiscountVisibility,
    this.savingsEstimationMode,
  });

  factory GetPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetPreferencesResponse(
      memberAccountDiscountVisibility:
          (json['memberAccountDiscountVisibility'] as String?)
              ?.toMemberAccountDiscountVisibility(),
      savingsEstimationMode:
          (json['savingsEstimationMode'] as String?)?.toSavingsEstimationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccountDiscountVisibility =
        this.memberAccountDiscountVisibility;
    final savingsEstimationMode = this.savingsEstimationMode;
    return {
      if (memberAccountDiscountVisibility != null)
        'memberAccountDiscountVisibility':
            memberAccountDiscountVisibility.toValue(),
      if (savingsEstimationMode != null)
        'savingsEstimationMode': savingsEstimationMode.toValue(),
    };
  }
}

class GetRecommendationResponse {
  /// The account that the recommendation is for.
  final String? accountId;

  /// The type of action you can take by adopting the recommendation.
  final ActionType? actionType;

  /// The lookback period used to calculate cost impact for a recommendation.
  final int? costCalculationLookbackPeriodInDays;

  /// The currency code used for the recommendation.
  final String? currencyCode;

  /// The details for the resource.
  final ResourceDetails? currentResourceDetails;

  /// The type of resource.
  final ResourceType? currentResourceType;

  /// The estimated monthly cost of the recommendation.
  final double? estimatedMonthlyCost;

  /// The estimated monthly savings amount for the recommendation.
  final double? estimatedMonthlySavings;

  /// The estimated savings amount over the lookback period used to calculate cost
  /// impact for a recommendation.
  final double? estimatedSavingsOverCostCalculationLookbackPeriod;

  /// The estimated savings percentage relative to the total cost over the cost
  /// calculation lookback period.
  final double? estimatedSavingsPercentage;

  /// The effort required to implement the recommendation.
  final ImplementationEffort? implementationEffort;

  /// The time when the recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The ID for the recommendation.
  final String? recommendationId;

  /// The lookback period that's used to generate the recommendation.
  final int? recommendationLookbackPeriodInDays;

  /// The details about the recommended resource.
  final ResourceDetails? recommendedResourceDetails;

  /// The resource type of the recommendation.
  final ResourceType? recommendedResourceType;

  /// The Amazon Web Services Region of the resource.
  final String? region;

  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// The unique identifier for the resource. This is the same as the Amazon
  /// Resource Name (ARN), if available.
  final String? resourceId;

  /// Whether or not implementing the recommendation requires a restart.
  final bool? restartNeeded;

  /// Whether or not implementing the recommendation can be rolled back.
  final bool? rollbackPossible;

  /// The source of the recommendation.
  final Source? source;

  /// A list of tags associated with the resource for which the recommendation
  /// exists.
  final List<Tag>? tags;

  GetRecommendationResponse({
    this.accountId,
    this.actionType,
    this.costCalculationLookbackPeriodInDays,
    this.currencyCode,
    this.currentResourceDetails,
    this.currentResourceType,
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.estimatedSavingsOverCostCalculationLookbackPeriod,
    this.estimatedSavingsPercentage,
    this.implementationEffort,
    this.lastRefreshTimestamp,
    this.recommendationId,
    this.recommendationLookbackPeriodInDays,
    this.recommendedResourceDetails,
    this.recommendedResourceType,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.restartNeeded,
    this.rollbackPossible,
    this.source,
    this.tags,
  });

  factory GetRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationResponse(
      accountId: json['accountId'] as String?,
      actionType: (json['actionType'] as String?)?.toActionType(),
      costCalculationLookbackPeriodInDays:
          json['costCalculationLookbackPeriodInDays'] as int?,
      currencyCode: json['currencyCode'] as String?,
      currentResourceDetails: json['currentResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['currentResourceDetails'] as Map<String, dynamic>)
          : null,
      currentResourceType:
          (json['currentResourceType'] as String?)?.toResourceType(),
      estimatedMonthlyCost: json['estimatedMonthlyCost'] as double?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double?,
      estimatedSavingsOverCostCalculationLookbackPeriod:
          json['estimatedSavingsOverCostCalculationLookbackPeriod'] as double?,
      estimatedSavingsPercentage: json['estimatedSavingsPercentage'] as double?,
      implementationEffort:
          (json['implementationEffort'] as String?)?.toImplementationEffort(),
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      recommendationId: json['recommendationId'] as String?,
      recommendationLookbackPeriodInDays:
          json['recommendationLookbackPeriodInDays'] as int?,
      recommendedResourceDetails: json['recommendedResourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['recommendedResourceDetails'] as Map<String, dynamic>)
          : null,
      recommendedResourceType:
          (json['recommendedResourceType'] as String?)?.toResourceType(),
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      restartNeeded: json['restartNeeded'] as bool?,
      rollbackPossible: json['rollbackPossible'] as bool?,
      source: (json['source'] as String?)?.toSource(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final actionType = this.actionType;
    final costCalculationLookbackPeriodInDays =
        this.costCalculationLookbackPeriodInDays;
    final currencyCode = this.currencyCode;
    final currentResourceDetails = this.currentResourceDetails;
    final currentResourceType = this.currentResourceType;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final estimatedSavingsOverCostCalculationLookbackPeriod =
        this.estimatedSavingsOverCostCalculationLookbackPeriod;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final implementationEffort = this.implementationEffort;
    final lastRefreshTimestamp = this.lastRefreshTimestamp;
    final recommendationId = this.recommendationId;
    final recommendationLookbackPeriodInDays =
        this.recommendationLookbackPeriodInDays;
    final recommendedResourceDetails = this.recommendedResourceDetails;
    final recommendedResourceType = this.recommendedResourceType;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final restartNeeded = this.restartNeeded;
    final rollbackPossible = this.rollbackPossible;
    final source = this.source;
    final tags = this.tags;
    return {
      if (accountId != null) 'accountId': accountId,
      if (actionType != null) 'actionType': actionType.toValue(),
      if (costCalculationLookbackPeriodInDays != null)
        'costCalculationLookbackPeriodInDays':
            costCalculationLookbackPeriodInDays,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (currentResourceDetails != null)
        'currentResourceDetails': currentResourceDetails,
      if (currentResourceType != null)
        'currentResourceType': currentResourceType.toValue(),
      if (estimatedMonthlyCost != null)
        'estimatedMonthlyCost': estimatedMonthlyCost,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (estimatedSavingsOverCostCalculationLookbackPeriod != null)
        'estimatedSavingsOverCostCalculationLookbackPeriod':
            estimatedSavingsOverCostCalculationLookbackPeriod,
      if (estimatedSavingsPercentage != null)
        'estimatedSavingsPercentage': estimatedSavingsPercentage,
      if (implementationEffort != null)
        'implementationEffort': implementationEffort.toValue(),
      if (lastRefreshTimestamp != null)
        'lastRefreshTimestamp': unixTimestampToJson(lastRefreshTimestamp),
      if (recommendationId != null) 'recommendationId': recommendationId,
      if (recommendationLookbackPeriodInDays != null)
        'recommendationLookbackPeriodInDays':
            recommendationLookbackPeriodInDays,
      if (recommendedResourceDetails != null)
        'recommendedResourceDetails': recommendedResourceDetails,
      if (recommendedResourceType != null)
        'recommendedResourceType': recommendedResourceType.toValue(),
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
      if (rollbackPossible != null) 'rollbackPossible': rollbackPossible,
      if (source != null) 'source': source.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum ImplementationEffort {
  veryLow,
  low,
  medium,
  high,
  veryHigh,
}

extension ImplementationEffortValueExtension on ImplementationEffort {
  String toValue() {
    switch (this) {
      case ImplementationEffort.veryLow:
        return 'VeryLow';
      case ImplementationEffort.low:
        return 'Low';
      case ImplementationEffort.medium:
        return 'Medium';
      case ImplementationEffort.high:
        return 'High';
      case ImplementationEffort.veryHigh:
        return 'VeryHigh';
    }
  }
}

extension ImplementationEffortFromString on String {
  ImplementationEffort toImplementationEffort() {
    switch (this) {
      case 'VeryLow':
        return ImplementationEffort.veryLow;
      case 'Low':
        return ImplementationEffort.low;
      case 'Medium':
        return ImplementationEffort.medium;
      case 'High':
        return ImplementationEffort.high;
      case 'VeryHigh':
        return ImplementationEffort.veryHigh;
    }
    throw Exception('$this is not known in enum ImplementationEffort');
  }
}

/// The Instance configuration used for recommendations.
class InstanceConfiguration {
  /// Details about the type.
  final String? type;

  InstanceConfiguration({
    this.type,
  });

  factory InstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return InstanceConfiguration(
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// The Lambda function recommendation details.
class LambdaFunction {
  /// The Lambda function configuration used for recommendations.
  final LambdaFunctionConfiguration? configuration;

  /// Cost impact of the recommendation.
  final ResourceCostCalculation? costCalculation;

  LambdaFunction({
    this.configuration,
    this.costCalculation,
  });

  factory LambdaFunction.fromJson(Map<String, dynamic> json) {
    return LambdaFunction(
      configuration: json['configuration'] != null
          ? LambdaFunctionConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ResourceCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The Lambda function configuration used for recommendations.
class LambdaFunctionConfiguration {
  /// Details about the compute configuration.
  final ComputeConfiguration? compute;

  LambdaFunctionConfiguration({
    this.compute,
  });

  factory LambdaFunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionConfiguration(
      compute: json['compute'] != null
          ? ComputeConfiguration.fromJson(
              json['compute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final compute = this.compute;
    return {
      if (compute != null) 'compute': compute,
    };
  }
}

class ListEnrollmentStatusesResponse {
  /// The enrollment status of all member accounts in the organization if the
  /// account is the management account.
  final bool? includeMemberAccounts;

  /// The enrollment status of a specific account ID, including creation and last
  /// updated timestamps.
  final List<AccountEnrollmentStatus>? items;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListEnrollmentStatusesResponse({
    this.includeMemberAccounts,
    this.items,
    this.nextToken,
  });

  factory ListEnrollmentStatusesResponse.fromJson(Map<String, dynamic> json) {
    return ListEnrollmentStatusesResponse(
      includeMemberAccounts: json['includeMemberAccounts'] as bool?,
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AccountEnrollmentStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final includeMemberAccounts = this.includeMemberAccounts;
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (includeMemberAccounts != null)
        'includeMemberAccounts': includeMemberAccounts,
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecommendationSummariesResponse {
  /// The currency code used for the recommendation.
  final String? currencyCode;

  /// The total overall savings for the aggregated view.
  final double? estimatedTotalDedupedSavings;

  /// The dimension used to group the recommendations by.
  final String? groupBy;

  /// List of all savings recommendations.
  final List<RecommendationSummary>? items;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListRecommendationSummariesResponse({
    this.currencyCode,
    this.estimatedTotalDedupedSavings,
    this.groupBy,
    this.items,
    this.nextToken,
  });

  factory ListRecommendationSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommendationSummariesResponse(
      currencyCode: json['currencyCode'] as String?,
      estimatedTotalDedupedSavings:
          json['estimatedTotalDedupedSavings'] as double?,
      groupBy: json['groupBy'] as String?,
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final estimatedTotalDedupedSavings = this.estimatedTotalDedupedSavings;
    final groupBy = this.groupBy;
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (estimatedTotalDedupedSavings != null)
        'estimatedTotalDedupedSavings': estimatedTotalDedupedSavings,
      if (groupBy != null) 'groupBy': groupBy,
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecommendationsResponse {
  /// List of all savings recommendations.
  final List<Recommendation>? items;

  /// The token to retrieve the next set of results.
  final String? nextToken;

  ListRecommendationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
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

enum MemberAccountDiscountVisibility {
  all,
  none,
}

extension MemberAccountDiscountVisibilityValueExtension
    on MemberAccountDiscountVisibility {
  String toValue() {
    switch (this) {
      case MemberAccountDiscountVisibility.all:
        return 'All';
      case MemberAccountDiscountVisibility.none:
        return 'None';
    }
  }
}

extension MemberAccountDiscountVisibilityFromString on String {
  MemberAccountDiscountVisibility toMemberAccountDiscountVisibility() {
    switch (this) {
      case 'All':
        return MemberAccountDiscountVisibility.all;
      case 'None':
        return MemberAccountDiscountVisibility.none;
    }
    throw Exception(
        '$this is not known in enum MemberAccountDiscountVisibility');
  }
}

/// The OpenSearch reserved instances recommendation details.
class OpenSearchReservedInstances {
  /// The OpenSearch reserved instances configuration used for recommendations.
  final OpenSearchReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  OpenSearchReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory OpenSearchReservedInstances.fromJson(Map<String, dynamic> json) {
    return OpenSearchReservedInstances(
      configuration: json['configuration'] != null
          ? OpenSearchReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The OpenSearch reserved instances configuration used for recommendations.
class OpenSearchReservedInstancesConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service that you want your recommendations for.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  OpenSearchReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory OpenSearchReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OpenSearchReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

enum Order {
  asc,
  desc,
}

extension OrderValueExtension on Order {
  String toValue() {
    switch (this) {
      case Order.asc:
        return 'Asc';
      case Order.desc:
        return 'Desc';
    }
  }
}

extension OrderFromString on String {
  Order toOrder() {
    switch (this) {
      case 'Asc':
        return Order.asc;
      case 'Desc':
        return Order.desc;
    }
    throw Exception('$this is not known in enum Order');
  }
}

/// Defines how rows will be sorted in the response.
class OrderBy {
  /// Sorts by dimension values.
  final String? dimension;

  /// The order that's used to sort the data.
  final Order? order;

  OrderBy({
    this.dimension,
    this.order,
  });

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    final order = this.order;
    return {
      if (dimension != null) 'dimension': dimension,
      if (order != null) 'order': order.toValue(),
    };
  }
}

/// The RDS reserved instances recommendation details.
class RdsReservedInstances {
  /// The RDS reserved instances configuration used for recommendations.
  final RdsReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  RdsReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory RdsReservedInstances.fromJson(Map<String, dynamic> json) {
    return RdsReservedInstances(
      configuration: json['configuration'] != null
          ? RdsReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The RDS reserved instances configuration used for recommendations.
class RdsReservedInstancesConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The database edition that the recommended reservation supports.
  final String? databaseEdition;

  /// The database engine that the recommended reservation supports.
  final String? databaseEngine;

  /// Determines whether the recommendation is for a reservation in a single
  /// Availability Zone or a reservation with a backup in a second Availability
  /// Zone.
  final String? deploymentOption;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// The license model that the recommended reservation supports.
  final String? licenseModel;

  /// How much purchasing this instance costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service that you want your recommendations for.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  RdsReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.databaseEdition,
    this.databaseEngine,
    this.deploymentOption,
    this.instanceFamily,
    this.instanceType,
    this.licenseModel,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory RdsReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RdsReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      databaseEdition: json['databaseEdition'] as String?,
      databaseEngine: json['databaseEngine'] as String?,
      deploymentOption: json['deploymentOption'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      licenseModel: json['licenseModel'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final databaseEdition = this.databaseEdition;
    final databaseEngine = this.databaseEngine;
    final deploymentOption = this.deploymentOption;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final licenseModel = this.licenseModel;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (databaseEdition != null) 'databaseEdition': databaseEdition,
      if (databaseEngine != null) 'databaseEngine': databaseEngine,
      if (deploymentOption != null) 'deploymentOption': deploymentOption,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (licenseModel != null) 'licenseModel': licenseModel,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// Describes a recommendation.
class Recommendation {
  /// The account that the recommendation is for.
  final String? accountId;

  /// The type of tasks that can be carried out by this action.
  final String? actionType;

  /// The currency code used for the recommendation.
  final String? currencyCode;

  /// Describes the current resource.
  final String? currentResourceSummary;

  /// The current resource type.
  final String? currentResourceType;

  /// The estimated monthly cost for the recommendation.
  final double? estimatedMonthlyCost;

  /// The estimated monthly savings amount for the recommendation.
  final double? estimatedMonthlySavings;

  /// The estimated savings percentage relative to the total cost over the cost
  /// calculation lookback period.
  final double? estimatedSavingsPercentage;

  /// The effort required to implement the recommendation.
  final String? implementationEffort;

  /// The time when the recommendation was last generated.
  final DateTime? lastRefreshTimestamp;

  /// The ID for the recommendation.
  final String? recommendationId;

  /// The lookback period that's used to generate the recommendation.
  final int? recommendationLookbackPeriodInDays;

  /// Describes the recommended resource.
  final String? recommendedResourceSummary;

  /// The recommended resource type.
  final String? recommendedResourceType;

  /// The Amazon Web Services Region of the resource.
  final String? region;

  /// The Amazon Resource Name (ARN) for the recommendation.
  final String? resourceArn;

  /// The resource ID for the recommendation.
  final String? resourceId;

  /// Whether or not implementing the recommendation requires a restart.
  final bool? restartNeeded;

  /// Whether or not implementing the recommendation can be rolled back.
  final bool? rollbackPossible;

  /// The source of the recommendation.
  final Source? source;

  /// A list of tags assigned to the recommendation.
  final List<Tag>? tags;

  Recommendation({
    this.accountId,
    this.actionType,
    this.currencyCode,
    this.currentResourceSummary,
    this.currentResourceType,
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.estimatedSavingsPercentage,
    this.implementationEffort,
    this.lastRefreshTimestamp,
    this.recommendationId,
    this.recommendationLookbackPeriodInDays,
    this.recommendedResourceSummary,
    this.recommendedResourceType,
    this.region,
    this.resourceArn,
    this.resourceId,
    this.restartNeeded,
    this.rollbackPossible,
    this.source,
    this.tags,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      accountId: json['accountId'] as String?,
      actionType: json['actionType'] as String?,
      currencyCode: json['currencyCode'] as String?,
      currentResourceSummary: json['currentResourceSummary'] as String?,
      currentResourceType: json['currentResourceType'] as String?,
      estimatedMonthlyCost: json['estimatedMonthlyCost'] as double?,
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double?,
      estimatedSavingsPercentage: json['estimatedSavingsPercentage'] as double?,
      implementationEffort: json['implementationEffort'] as String?,
      lastRefreshTimestamp: timeStampFromJson(json['lastRefreshTimestamp']),
      recommendationId: json['recommendationId'] as String?,
      recommendationLookbackPeriodInDays:
          json['recommendationLookbackPeriodInDays'] as int?,
      recommendedResourceSummary: json['recommendedResourceSummary'] as String?,
      recommendedResourceType: json['recommendedResourceType'] as String?,
      region: json['region'] as String?,
      resourceArn: json['resourceArn'] as String?,
      resourceId: json['resourceId'] as String?,
      restartNeeded: json['restartNeeded'] as bool?,
      rollbackPossible: json['rollbackPossible'] as bool?,
      source: (json['source'] as String?)?.toSource(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final actionType = this.actionType;
    final currencyCode = this.currencyCode;
    final currentResourceSummary = this.currentResourceSummary;
    final currentResourceType = this.currentResourceType;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final estimatedSavingsPercentage = this.estimatedSavingsPercentage;
    final implementationEffort = this.implementationEffort;
    final lastRefreshTimestamp = this.lastRefreshTimestamp;
    final recommendationId = this.recommendationId;
    final recommendationLookbackPeriodInDays =
        this.recommendationLookbackPeriodInDays;
    final recommendedResourceSummary = this.recommendedResourceSummary;
    final recommendedResourceType = this.recommendedResourceType;
    final region = this.region;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final restartNeeded = this.restartNeeded;
    final rollbackPossible = this.rollbackPossible;
    final source = this.source;
    final tags = this.tags;
    return {
      if (accountId != null) 'accountId': accountId,
      if (actionType != null) 'actionType': actionType,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (currentResourceSummary != null)
        'currentResourceSummary': currentResourceSummary,
      if (currentResourceType != null)
        'currentResourceType': currentResourceType,
      if (estimatedMonthlyCost != null)
        'estimatedMonthlyCost': estimatedMonthlyCost,
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (estimatedSavingsPercentage != null)
        'estimatedSavingsPercentage': estimatedSavingsPercentage,
      if (implementationEffort != null)
        'implementationEffort': implementationEffort,
      if (lastRefreshTimestamp != null)
        'lastRefreshTimestamp': unixTimestampToJson(lastRefreshTimestamp),
      if (recommendationId != null) 'recommendationId': recommendationId,
      if (recommendationLookbackPeriodInDays != null)
        'recommendationLookbackPeriodInDays':
            recommendationLookbackPeriodInDays,
      if (recommendedResourceSummary != null)
        'recommendedResourceSummary': recommendedResourceSummary,
      if (recommendedResourceType != null)
        'recommendedResourceType': recommendedResourceType,
      if (region != null) 'region': region,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceId != null) 'resourceId': resourceId,
      if (restartNeeded != null) 'restartNeeded': restartNeeded,
      if (rollbackPossible != null) 'rollbackPossible': rollbackPossible,
      if (source != null) 'source': source.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The summary of rightsizing recommendations, including de-duped savings from
/// all types of recommendations.
class RecommendationSummary {
  /// The estimated total savings resulting from modifications, on a monthly
  /// basis.
  final double? estimatedMonthlySavings;

  /// The grouping of recommendations.
  final String? group;

  /// The total number of instance recommendations.
  final int? recommendationCount;

  RecommendationSummary({
    this.estimatedMonthlySavings,
    this.group,
    this.recommendationCount,
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double?,
      group: json['group'] as String?,
      recommendationCount: json['recommendationCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final group = this.group;
    final recommendationCount = this.recommendationCount;
    return {
      if (estimatedMonthlySavings != null)
        'estimatedMonthlySavings': estimatedMonthlySavings,
      if (group != null) 'group': group,
      if (recommendationCount != null)
        'recommendationCount': recommendationCount,
    };
  }
}

/// The Redshift reserved instances recommendation details.
class RedshiftReservedInstances {
  /// The Redshift reserved instances configuration used for recommendations.
  final RedshiftReservedInstancesConfiguration? configuration;

  /// Cost impact of the purchase recommendation.
  final ReservedInstancesCostCalculation? costCalculation;

  RedshiftReservedInstances({
    this.configuration,
    this.costCalculation,
  });

  factory RedshiftReservedInstances.fromJson(Map<String, dynamic> json) {
    return RedshiftReservedInstances(
      configuration: json['configuration'] != null
          ? RedshiftReservedInstancesConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? ReservedInstancesCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The Redshift reserved instances configuration used for recommendations.
class RedshiftReservedInstancesConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// Determines whether the recommendation is for a current generation instance.
  final String? currentGeneration;

  /// The instance family of the recommended reservation.
  final String? instanceFamily;

  /// The type of instance that Amazon Web Services recommends.
  final String? instanceType;

  /// How much purchasing reserved instances costs you on a monthly basis.
  final String? monthlyRecurringCost;

  /// The number of normalized units that Amazon Web Services recommends that you
  /// purchase.
  final String? normalizedUnitsToPurchase;

  /// The number of instances that Amazon Web Services recommends that you
  /// purchase.
  final String? numberOfInstancesToPurchase;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Amazon Web Services Region of the commitment.
  final String? reservedInstancesRegion;

  /// The service that you want your recommendations for.
  final String? service;

  /// Determines whether the recommendation is size flexible.
  final bool? sizeFlexEligible;

  /// The reserved instances recommendation term in years.
  final String? term;

  /// How much purchasing this instance costs you upfront.
  final String? upfrontCost;

  RedshiftReservedInstancesConfiguration({
    this.accountScope,
    this.currentGeneration,
    this.instanceFamily,
    this.instanceType,
    this.monthlyRecurringCost,
    this.normalizedUnitsToPurchase,
    this.numberOfInstancesToPurchase,
    this.paymentOption,
    this.reservedInstancesRegion,
    this.service,
    this.sizeFlexEligible,
    this.term,
    this.upfrontCost,
  });

  factory RedshiftReservedInstancesConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RedshiftReservedInstancesConfiguration(
      accountScope: json['accountScope'] as String?,
      currentGeneration: json['currentGeneration'] as String?,
      instanceFamily: json['instanceFamily'] as String?,
      instanceType: json['instanceType'] as String?,
      monthlyRecurringCost: json['monthlyRecurringCost'] as String?,
      normalizedUnitsToPurchase: json['normalizedUnitsToPurchase'] as String?,
      numberOfInstancesToPurchase:
          json['numberOfInstancesToPurchase'] as String?,
      paymentOption: json['paymentOption'] as String?,
      reservedInstancesRegion: json['reservedInstancesRegion'] as String?,
      service: json['service'] as String?,
      sizeFlexEligible: json['sizeFlexEligible'] as bool?,
      term: json['term'] as String?,
      upfrontCost: json['upfrontCost'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final currentGeneration = this.currentGeneration;
    final instanceFamily = this.instanceFamily;
    final instanceType = this.instanceType;
    final monthlyRecurringCost = this.monthlyRecurringCost;
    final normalizedUnitsToPurchase = this.normalizedUnitsToPurchase;
    final numberOfInstancesToPurchase = this.numberOfInstancesToPurchase;
    final paymentOption = this.paymentOption;
    final reservedInstancesRegion = this.reservedInstancesRegion;
    final service = this.service;
    final sizeFlexEligible = this.sizeFlexEligible;
    final term = this.term;
    final upfrontCost = this.upfrontCost;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (currentGeneration != null) 'currentGeneration': currentGeneration,
      if (instanceFamily != null) 'instanceFamily': instanceFamily,
      if (instanceType != null) 'instanceType': instanceType,
      if (monthlyRecurringCost != null)
        'monthlyRecurringCost': monthlyRecurringCost,
      if (normalizedUnitsToPurchase != null)
        'normalizedUnitsToPurchase': normalizedUnitsToPurchase,
      if (numberOfInstancesToPurchase != null)
        'numberOfInstancesToPurchase': numberOfInstancesToPurchase,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (reservedInstancesRegion != null)
        'reservedInstancesRegion': reservedInstancesRegion,
      if (service != null) 'service': service,
      if (sizeFlexEligible != null) 'sizeFlexEligible': sizeFlexEligible,
      if (term != null) 'term': term,
      if (upfrontCost != null) 'upfrontCost': upfrontCost,
    };
  }
}

/// Cost impact of the purchase recommendation.
class ReservedInstancesCostCalculation {
  /// Pricing details of the purchase recommendation.
  final ReservedInstancesPricing? pricing;

  ReservedInstancesCostCalculation({
    this.pricing,
  });

  factory ReservedInstancesCostCalculation.fromJson(Map<String, dynamic> json) {
    return ReservedInstancesCostCalculation(
      pricing: json['pricing'] != null
          ? ReservedInstancesPricing.fromJson(
              json['pricing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pricing = this.pricing;
    return {
      if (pricing != null) 'pricing': pricing,
    };
  }
}

/// Pricing details for your recommended reserved instance.
class ReservedInstancesPricing {
  /// The estimated cost of your recurring monthly fees for the recommended
  /// reserved instance across the month.
  final double? estimatedMonthlyAmortizedReservationCost;

  /// The remaining On-Demand cost estimated to not be covered by the recommended
  /// reserved instance, over the length of the lookback period.
  final double? estimatedOnDemandCost;

  /// The cost of paying for the recommended reserved instance monthly.
  final double? monthlyReservationEligibleCost;

  /// The savings percentage relative to the total On-Demand costs that are
  /// associated with this instance.
  final double? savingsPercentage;

  ReservedInstancesPricing({
    this.estimatedMonthlyAmortizedReservationCost,
    this.estimatedOnDemandCost,
    this.monthlyReservationEligibleCost,
    this.savingsPercentage,
  });

  factory ReservedInstancesPricing.fromJson(Map<String, dynamic> json) {
    return ReservedInstancesPricing(
      estimatedMonthlyAmortizedReservationCost:
          json['estimatedMonthlyAmortizedReservationCost'] as double?,
      estimatedOnDemandCost: json['estimatedOnDemandCost'] as double?,
      monthlyReservationEligibleCost:
          json['monthlyReservationEligibleCost'] as double?,
      savingsPercentage: json['savingsPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlyAmortizedReservationCost =
        this.estimatedMonthlyAmortizedReservationCost;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final monthlyReservationEligibleCost = this.monthlyReservationEligibleCost;
    final savingsPercentage = this.savingsPercentage;
    return {
      if (estimatedMonthlyAmortizedReservationCost != null)
        'estimatedMonthlyAmortizedReservationCost':
            estimatedMonthlyAmortizedReservationCost,
      if (estimatedOnDemandCost != null)
        'estimatedOnDemandCost': estimatedOnDemandCost,
      if (monthlyReservationEligibleCost != null)
        'monthlyReservationEligibleCost': monthlyReservationEligibleCost,
      if (savingsPercentage != null) 'savingsPercentage': savingsPercentage,
    };
  }
}

/// Cost impact of the resource recommendation.
class ResourceCostCalculation {
  /// Pricing details of the resource recommendation.
  final ResourcePricing? pricing;

  /// Usage details of the resource recommendation.
  final List<Usage>? usages;

  ResourceCostCalculation({
    this.pricing,
    this.usages,
  });

  factory ResourceCostCalculation.fromJson(Map<String, dynamic> json) {
    return ResourceCostCalculation(
      pricing: json['pricing'] != null
          ? ResourcePricing.fromJson(json['pricing'] as Map<String, dynamic>)
          : null,
      usages: (json['usages'] as List?)
          ?.whereNotNull()
          .map((e) => Usage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pricing = this.pricing;
    final usages = this.usages;
    return {
      if (pricing != null) 'pricing': pricing,
      if (usages != null) 'usages': usages,
    };
  }
}

/// Contains detailed information about the specified resource.
class ResourceDetails {
  /// The Compute Savings Plans recommendation details.
  final ComputeSavingsPlans? computeSavingsPlans;

  /// The Amazon Elastic Block Store volume recommendation details.
  final EbsVolume? ebsVolume;

  /// The EC2 Auto Scaling group recommendation details.
  final Ec2AutoScalingGroup? ec2AutoScalingGroup;

  /// The EC2 instance recommendation details.
  final Ec2Instance? ec2Instance;

  /// The EC2 instance Savings Plans recommendation details.
  final Ec2InstanceSavingsPlans? ec2InstanceSavingsPlans;

  /// The EC2 reserved instances recommendation details.
  final Ec2ReservedInstances? ec2ReservedInstances;

  /// The ECS service recommendation details.
  final EcsService? ecsService;

  /// The ElastiCache reserved instances recommendation details.
  final ElastiCacheReservedInstances? elastiCacheReservedInstances;

  /// The Lambda function recommendation details.
  final LambdaFunction? lambdaFunction;

  /// The OpenSearch reserved instances recommendation details.
  final OpenSearchReservedInstances? openSearchReservedInstances;

  /// The RDS reserved instances recommendation details.
  final RdsReservedInstances? rdsReservedInstances;

  /// The Redshift reserved instances recommendation details.
  final RedshiftReservedInstances? redshiftReservedInstances;

  /// The SageMaker Savings Plans recommendation details.
  final SageMakerSavingsPlans? sageMakerSavingsPlans;

  ResourceDetails({
    this.computeSavingsPlans,
    this.ebsVolume,
    this.ec2AutoScalingGroup,
    this.ec2Instance,
    this.ec2InstanceSavingsPlans,
    this.ec2ReservedInstances,
    this.ecsService,
    this.elastiCacheReservedInstances,
    this.lambdaFunction,
    this.openSearchReservedInstances,
    this.rdsReservedInstances,
    this.redshiftReservedInstances,
    this.sageMakerSavingsPlans,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      computeSavingsPlans: json['computeSavingsPlans'] != null
          ? ComputeSavingsPlans.fromJson(
              json['computeSavingsPlans'] as Map<String, dynamic>)
          : null,
      ebsVolume: json['ebsVolume'] != null
          ? EbsVolume.fromJson(json['ebsVolume'] as Map<String, dynamic>)
          : null,
      ec2AutoScalingGroup: json['ec2AutoScalingGroup'] != null
          ? Ec2AutoScalingGroup.fromJson(
              json['ec2AutoScalingGroup'] as Map<String, dynamic>)
          : null,
      ec2Instance: json['ec2Instance'] != null
          ? Ec2Instance.fromJson(json['ec2Instance'] as Map<String, dynamic>)
          : null,
      ec2InstanceSavingsPlans: json['ec2InstanceSavingsPlans'] != null
          ? Ec2InstanceSavingsPlans.fromJson(
              json['ec2InstanceSavingsPlans'] as Map<String, dynamic>)
          : null,
      ec2ReservedInstances: json['ec2ReservedInstances'] != null
          ? Ec2ReservedInstances.fromJson(
              json['ec2ReservedInstances'] as Map<String, dynamic>)
          : null,
      ecsService: json['ecsService'] != null
          ? EcsService.fromJson(json['ecsService'] as Map<String, dynamic>)
          : null,
      elastiCacheReservedInstances: json['elastiCacheReservedInstances'] != null
          ? ElastiCacheReservedInstances.fromJson(
              json['elastiCacheReservedInstances'] as Map<String, dynamic>)
          : null,
      lambdaFunction: json['lambdaFunction'] != null
          ? LambdaFunction.fromJson(
              json['lambdaFunction'] as Map<String, dynamic>)
          : null,
      openSearchReservedInstances: json['openSearchReservedInstances'] != null
          ? OpenSearchReservedInstances.fromJson(
              json['openSearchReservedInstances'] as Map<String, dynamic>)
          : null,
      rdsReservedInstances: json['rdsReservedInstances'] != null
          ? RdsReservedInstances.fromJson(
              json['rdsReservedInstances'] as Map<String, dynamic>)
          : null,
      redshiftReservedInstances: json['redshiftReservedInstances'] != null
          ? RedshiftReservedInstances.fromJson(
              json['redshiftReservedInstances'] as Map<String, dynamic>)
          : null,
      sageMakerSavingsPlans: json['sageMakerSavingsPlans'] != null
          ? SageMakerSavingsPlans.fromJson(
              json['sageMakerSavingsPlans'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final computeSavingsPlans = this.computeSavingsPlans;
    final ebsVolume = this.ebsVolume;
    final ec2AutoScalingGroup = this.ec2AutoScalingGroup;
    final ec2Instance = this.ec2Instance;
    final ec2InstanceSavingsPlans = this.ec2InstanceSavingsPlans;
    final ec2ReservedInstances = this.ec2ReservedInstances;
    final ecsService = this.ecsService;
    final elastiCacheReservedInstances = this.elastiCacheReservedInstances;
    final lambdaFunction = this.lambdaFunction;
    final openSearchReservedInstances = this.openSearchReservedInstances;
    final rdsReservedInstances = this.rdsReservedInstances;
    final redshiftReservedInstances = this.redshiftReservedInstances;
    final sageMakerSavingsPlans = this.sageMakerSavingsPlans;
    return {
      if (computeSavingsPlans != null)
        'computeSavingsPlans': computeSavingsPlans,
      if (ebsVolume != null) 'ebsVolume': ebsVolume,
      if (ec2AutoScalingGroup != null)
        'ec2AutoScalingGroup': ec2AutoScalingGroup,
      if (ec2Instance != null) 'ec2Instance': ec2Instance,
      if (ec2InstanceSavingsPlans != null)
        'ec2InstanceSavingsPlans': ec2InstanceSavingsPlans,
      if (ec2ReservedInstances != null)
        'ec2ReservedInstances': ec2ReservedInstances,
      if (ecsService != null) 'ecsService': ecsService,
      if (elastiCacheReservedInstances != null)
        'elastiCacheReservedInstances': elastiCacheReservedInstances,
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
      if (openSearchReservedInstances != null)
        'openSearchReservedInstances': openSearchReservedInstances,
      if (rdsReservedInstances != null)
        'rdsReservedInstances': rdsReservedInstances,
      if (redshiftReservedInstances != null)
        'redshiftReservedInstances': redshiftReservedInstances,
      if (sageMakerSavingsPlans != null)
        'sageMakerSavingsPlans': sageMakerSavingsPlans,
    };
  }
}

/// Contains pricing information about the specified resource.
class ResourcePricing {
  /// The savings estimate incorporating all discounts with Amazon Web Services,
  /// such as Reserved Instances and Savings Plans.
  final double? estimatedCostAfterDiscounts;

  /// The savings estimate using Amazon Web Services public pricing without
  /// incorporating any discounts.
  final double? estimatedCostBeforeDiscounts;

  /// The estimated discounts for a recommendation.
  final EstimatedDiscounts? estimatedDiscounts;

  /// The estimated net unused amortized commitment for the recommendation.
  final double? estimatedNetUnusedAmortizedCommitments;

  ResourcePricing({
    this.estimatedCostAfterDiscounts,
    this.estimatedCostBeforeDiscounts,
    this.estimatedDiscounts,
    this.estimatedNetUnusedAmortizedCommitments,
  });

  factory ResourcePricing.fromJson(Map<String, dynamic> json) {
    return ResourcePricing(
      estimatedCostAfterDiscounts:
          json['estimatedCostAfterDiscounts'] as double?,
      estimatedCostBeforeDiscounts:
          json['estimatedCostBeforeDiscounts'] as double?,
      estimatedDiscounts: json['estimatedDiscounts'] != null
          ? EstimatedDiscounts.fromJson(
              json['estimatedDiscounts'] as Map<String, dynamic>)
          : null,
      estimatedNetUnusedAmortizedCommitments:
          json['estimatedNetUnusedAmortizedCommitments'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedCostAfterDiscounts = this.estimatedCostAfterDiscounts;
    final estimatedCostBeforeDiscounts = this.estimatedCostBeforeDiscounts;
    final estimatedDiscounts = this.estimatedDiscounts;
    final estimatedNetUnusedAmortizedCommitments =
        this.estimatedNetUnusedAmortizedCommitments;
    return {
      if (estimatedCostAfterDiscounts != null)
        'estimatedCostAfterDiscounts': estimatedCostAfterDiscounts,
      if (estimatedCostBeforeDiscounts != null)
        'estimatedCostBeforeDiscounts': estimatedCostBeforeDiscounts,
      if (estimatedDiscounts != null) 'estimatedDiscounts': estimatedDiscounts,
      if (estimatedNetUnusedAmortizedCommitments != null)
        'estimatedNetUnusedAmortizedCommitments':
            estimatedNetUnusedAmortizedCommitments,
    };
  }
}

enum ResourceType {
  ec2Instance,
  lambdaFunction,
  ebsVolume,
  ecsService,
  ec2AutoScalingGroup,
  ec2InstanceSavingsPlans,
  computeSavingsPlans,
  sageMakerSavingsPlans,
  ec2ReservedInstances,
  rdsReservedInstances,
  openSearchReservedInstances,
  redshiftReservedInstances,
  elastiCacheReservedInstances,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.ec2Instance:
        return 'Ec2Instance';
      case ResourceType.lambdaFunction:
        return 'LambdaFunction';
      case ResourceType.ebsVolume:
        return 'EbsVolume';
      case ResourceType.ecsService:
        return 'EcsService';
      case ResourceType.ec2AutoScalingGroup:
        return 'Ec2AutoScalingGroup';
      case ResourceType.ec2InstanceSavingsPlans:
        return 'Ec2InstanceSavingsPlans';
      case ResourceType.computeSavingsPlans:
        return 'ComputeSavingsPlans';
      case ResourceType.sageMakerSavingsPlans:
        return 'SageMakerSavingsPlans';
      case ResourceType.ec2ReservedInstances:
        return 'Ec2ReservedInstances';
      case ResourceType.rdsReservedInstances:
        return 'RdsReservedInstances';
      case ResourceType.openSearchReservedInstances:
        return 'OpenSearchReservedInstances';
      case ResourceType.redshiftReservedInstances:
        return 'RedshiftReservedInstances';
      case ResourceType.elastiCacheReservedInstances:
        return 'ElastiCacheReservedInstances';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'Ec2Instance':
        return ResourceType.ec2Instance;
      case 'LambdaFunction':
        return ResourceType.lambdaFunction;
      case 'EbsVolume':
        return ResourceType.ebsVolume;
      case 'EcsService':
        return ResourceType.ecsService;
      case 'Ec2AutoScalingGroup':
        return ResourceType.ec2AutoScalingGroup;
      case 'Ec2InstanceSavingsPlans':
        return ResourceType.ec2InstanceSavingsPlans;
      case 'ComputeSavingsPlans':
        return ResourceType.computeSavingsPlans;
      case 'SageMakerSavingsPlans':
        return ResourceType.sageMakerSavingsPlans;
      case 'Ec2ReservedInstances':
        return ResourceType.ec2ReservedInstances;
      case 'RdsReservedInstances':
        return ResourceType.rdsReservedInstances;
      case 'OpenSearchReservedInstances':
        return ResourceType.openSearchReservedInstances;
      case 'RedshiftReservedInstances':
        return ResourceType.redshiftReservedInstances;
      case 'ElastiCacheReservedInstances':
        return ResourceType.elastiCacheReservedInstances;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// The SageMaker Savings Plans recommendation details.
class SageMakerSavingsPlans {
  /// The SageMaker Savings Plans configuration used for recommendations.
  final SageMakerSavingsPlansConfiguration? configuration;

  /// Cost impact of the Savings Plans purchase recommendation.
  final SavingsPlansCostCalculation? costCalculation;

  SageMakerSavingsPlans({
    this.configuration,
    this.costCalculation,
  });

  factory SageMakerSavingsPlans.fromJson(Map<String, dynamic> json) {
    return SageMakerSavingsPlans(
      configuration: json['configuration'] != null
          ? SageMakerSavingsPlansConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      costCalculation: json['costCalculation'] != null
          ? SavingsPlansCostCalculation.fromJson(
              json['costCalculation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final costCalculation = this.costCalculation;
    return {
      if (configuration != null) 'configuration': configuration,
      if (costCalculation != null) 'costCalculation': costCalculation,
    };
  }
}

/// The SageMaker Savings Plans configuration used for recommendations.
class SageMakerSavingsPlansConfiguration {
  /// The account scope that you want your recommendations for.
  final String? accountScope;

  /// The hourly commitment for the Savings Plans type.
  final String? hourlyCommitment;

  /// The payment option for the commitment.
  final String? paymentOption;

  /// The Savings Plans recommendation term in years.
  final String? term;

  SageMakerSavingsPlansConfiguration({
    this.accountScope,
    this.hourlyCommitment,
    this.paymentOption,
    this.term,
  });

  factory SageMakerSavingsPlansConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SageMakerSavingsPlansConfiguration(
      accountScope: json['accountScope'] as String?,
      hourlyCommitment: json['hourlyCommitment'] as String?,
      paymentOption: json['paymentOption'] as String?,
      term: json['term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountScope = this.accountScope;
    final hourlyCommitment = this.hourlyCommitment;
    final paymentOption = this.paymentOption;
    final term = this.term;
    return {
      if (accountScope != null) 'accountScope': accountScope,
      if (hourlyCommitment != null) 'hourlyCommitment': hourlyCommitment,
      if (paymentOption != null) 'paymentOption': paymentOption,
      if (term != null) 'term': term,
    };
  }
}

enum SavingsEstimationMode {
  beforeDiscounts,
  afterDiscounts,
}

extension SavingsEstimationModeValueExtension on SavingsEstimationMode {
  String toValue() {
    switch (this) {
      case SavingsEstimationMode.beforeDiscounts:
        return 'BeforeDiscounts';
      case SavingsEstimationMode.afterDiscounts:
        return 'AfterDiscounts';
    }
  }
}

extension SavingsEstimationModeFromString on String {
  SavingsEstimationMode toSavingsEstimationMode() {
    switch (this) {
      case 'BeforeDiscounts':
        return SavingsEstimationMode.beforeDiscounts;
      case 'AfterDiscounts':
        return SavingsEstimationMode.afterDiscounts;
    }
    throw Exception('$this is not known in enum SavingsEstimationMode');
  }
}

/// Cost impact of the purchase recommendation.
class SavingsPlansCostCalculation {
  /// Pricing details of the purchase recommendation.
  final SavingsPlansPricing? pricing;

  SavingsPlansCostCalculation({
    this.pricing,
  });

  factory SavingsPlansCostCalculation.fromJson(Map<String, dynamic> json) {
    return SavingsPlansCostCalculation(
      pricing: json['pricing'] != null
          ? SavingsPlansPricing.fromJson(
              json['pricing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pricing = this.pricing;
    return {
      if (pricing != null) 'pricing': pricing,
    };
  }
}

/// Pricing information about a Savings Plan.
class SavingsPlansPricing {
  /// Estimated monthly commitment for the Savings Plan.
  final double? estimatedMonthlyCommitment;

  /// Estimated On-Demand cost you will pay after buying the Savings Plan.
  final double? estimatedOnDemandCost;

  /// The cost of paying for the recommended Savings Plan monthly.
  final double? monthlySavingsPlansEligibleCost;

  /// Estimated savings as a percentage of your overall costs after buying the
  /// Savings Plan.
  final double? savingsPercentage;

  SavingsPlansPricing({
    this.estimatedMonthlyCommitment,
    this.estimatedOnDemandCost,
    this.monthlySavingsPlansEligibleCost,
    this.savingsPercentage,
  });

  factory SavingsPlansPricing.fromJson(Map<String, dynamic> json) {
    return SavingsPlansPricing(
      estimatedMonthlyCommitment: json['estimatedMonthlyCommitment'] as double?,
      estimatedOnDemandCost: json['estimatedOnDemandCost'] as double?,
      monthlySavingsPlansEligibleCost:
          json['monthlySavingsPlansEligibleCost'] as double?,
      savingsPercentage: json['savingsPercentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlyCommitment = this.estimatedMonthlyCommitment;
    final estimatedOnDemandCost = this.estimatedOnDemandCost;
    final monthlySavingsPlansEligibleCost =
        this.monthlySavingsPlansEligibleCost;
    final savingsPercentage = this.savingsPercentage;
    return {
      if (estimatedMonthlyCommitment != null)
        'estimatedMonthlyCommitment': estimatedMonthlyCommitment,
      if (estimatedOnDemandCost != null)
        'estimatedOnDemandCost': estimatedOnDemandCost,
      if (monthlySavingsPlansEligibleCost != null)
        'monthlySavingsPlansEligibleCost': monthlySavingsPlansEligibleCost,
      if (savingsPercentage != null) 'savingsPercentage': savingsPercentage,
    };
  }
}

enum Source {
  computeOptimizer,
  costExplorer,
}

extension SourceValueExtension on Source {
  String toValue() {
    switch (this) {
      case Source.computeOptimizer:
        return 'ComputeOptimizer';
      case Source.costExplorer:
        return 'CostExplorer';
    }
  }
}

extension SourceFromString on String {
  Source toSource() {
    switch (this) {
      case 'ComputeOptimizer':
        return Source.computeOptimizer;
      case 'CostExplorer':
        return Source.costExplorer;
    }
    throw Exception('$this is not known in enum Source');
  }
}

/// The storage configuration used for recommendations.
class StorageConfiguration {
  /// The storage volume.
  final double? sizeInGb;

  /// The storage type.
  final String? type;

  StorageConfiguration({
    this.sizeInGb,
    this.type,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      sizeInGb: json['sizeInGb'] as double?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGb = this.sizeInGb;
    final type = this.type;
    return {
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (type != null) 'type': type,
    };
  }
}

/// The tag structure that contains a tag key and value.
class Tag {
  /// The key that's associated with the tag.
  final String? key;

  /// The value that's associated with the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

class UpdateEnrollmentStatusResponse {
  /// The enrollment status of the account.
  final String? status;

  UpdateEnrollmentStatusResponse({
    this.status,
  });

  factory UpdateEnrollmentStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnrollmentStatusResponse(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

class UpdatePreferencesResponse {
  /// Shows the status of the "member account discount visibility" preference.
  final MemberAccountDiscountVisibility? memberAccountDiscountVisibility;

  /// Shows the status of the "savings estimation mode" preference.
  final SavingsEstimationMode? savingsEstimationMode;

  UpdatePreferencesResponse({
    this.memberAccountDiscountVisibility,
    this.savingsEstimationMode,
  });

  factory UpdatePreferencesResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePreferencesResponse(
      memberAccountDiscountVisibility:
          (json['memberAccountDiscountVisibility'] as String?)
              ?.toMemberAccountDiscountVisibility(),
      savingsEstimationMode:
          (json['savingsEstimationMode'] as String?)?.toSavingsEstimationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final memberAccountDiscountVisibility =
        this.memberAccountDiscountVisibility;
    final savingsEstimationMode = this.savingsEstimationMode;
    return {
      if (memberAccountDiscountVisibility != null)
        'memberAccountDiscountVisibility':
            memberAccountDiscountVisibility.toValue(),
      if (savingsEstimationMode != null)
        'savingsEstimationMode': savingsEstimationMode.toValue(),
    };
  }
}

/// Details about the usage.
class Usage {
  /// The operation value.
  final String? operation;

  /// The product code.
  final String? productCode;

  /// The usage unit.
  final String? unit;

  /// The usage amount.
  final double? usageAmount;

  /// The usage type.
  final String? usageType;

  Usage({
    this.operation,
    this.productCode,
    this.unit,
    this.usageAmount,
    this.usageType,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      operation: json['operation'] as String?,
      productCode: json['productCode'] as String?,
      unit: json['unit'] as String?,
      usageAmount: json['usageAmount'] as double?,
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final productCode = this.productCode;
    final unit = this.unit;
    final usageAmount = this.usageAmount;
    final usageType = this.usageType;
    return {
      if (operation != null) 'operation': operation,
      if (productCode != null) 'productCode': productCode,
      if (unit != null) 'unit': unit,
      if (usageAmount != null) 'usageAmount': usageAmount,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
