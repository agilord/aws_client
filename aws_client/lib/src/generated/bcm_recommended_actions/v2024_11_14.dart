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

/// You can use the Billing and Cost Management Recommended Actions API to
/// programmatically query your best practices and recommendations to optimize
/// your costs.
///
/// The Billing and Cost Management Recommended Actions API provides the
/// following endpoint:
///
/// <ul>
/// <li>
/// https://bcm-recommended-actions.us-east-1.api.aws
/// </li>
/// </ul>
class BcmRecommendedActions {
  final _s.JsonProtocol _protocol;
  BcmRecommendedActions({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bcm-recommended-actions',
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

  /// Returns a list of recommended actions that match the filter criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// The criteria that you want all returned recommended actions to match.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  Future<ListRecommendedActionsResponse> listRecommendedActions({
    RequestFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSBillingAndCostManagementRecommendedActions.ListRecommendedActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListRecommendedActionsResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class ListRecommendedActionsResponse {
  /// The list of recommended actions that satisfy the filter criteria.
  final List<RecommendedAction> recommendedActions;

  /// The pagination token that indicates the next set of results that you want to
  /// retrieve.
  final String? nextToken;

  ListRecommendedActionsResponse({
    required this.recommendedActions,
    this.nextToken,
  });

  factory ListRecommendedActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendedActionsResponse(
      recommendedActions: ((json['recommendedActions'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendedAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendedActions = this.recommendedActions;
    final nextToken = this.nextToken;
    return {
      'recommendedActions': recommendedActions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Describes a specific recommended action.
///
/// @nodoc
class RecommendedAction {
  /// The account that the recommended action is for.
  final String? accountId;

  /// Context that applies to the recommended action.
  final Map<String, String>? context;

  /// The feature associated with the recommended action.
  final Feature? feature;

  /// The ID for the recommended action.
  final String? id;

  /// The time when the recommended action status was last updated.
  final String? lastUpdatedTimeStamp;

  /// The possible next steps to execute the recommended action.
  final List<String>? nextSteps;

  /// The severity associated with the recommended action.
  final Severity? severity;

  /// The type of action you can take by adopting the recommended action.
  final ActionType? type;

  RecommendedAction({
    this.accountId,
    this.context,
    this.feature,
    this.id,
    this.lastUpdatedTimeStamp,
    this.nextSteps,
    this.severity,
    this.type,
  });

  factory RecommendedAction.fromJson(Map<String, dynamic> json) {
    return RecommendedAction(
      accountId: json['accountId'] as String?,
      context: (json['context'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      feature: (json['feature'] as String?)?.let(Feature.fromString),
      id: json['id'] as String?,
      lastUpdatedTimeStamp: json['lastUpdatedTimeStamp'] as String?,
      nextSteps: (json['nextSteps'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      severity: (json['severity'] as String?)?.let(Severity.fromString),
      type: (json['type'] as String?)?.let(ActionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final context = this.context;
    final feature = this.feature;
    final id = this.id;
    final lastUpdatedTimeStamp = this.lastUpdatedTimeStamp;
    final nextSteps = this.nextSteps;
    final severity = this.severity;
    final type = this.type;
    return {
      if (accountId != null) 'accountId': accountId,
      if (context != null) 'context': context,
      if (feature != null) 'feature': feature.value,
      if (id != null) 'id': id,
      if (lastUpdatedTimeStamp != null)
        'lastUpdatedTimeStamp': lastUpdatedTimeStamp,
      if (nextSteps != null) 'nextSteps': nextSteps,
      if (severity != null) 'severity': severity.value,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class ActionType {
  static const addAlternateBillingContact =
      ActionType._('ADD_ALTERNATE_BILLING_CONTACT');
  static const createAnomalyMonitor = ActionType._('CREATE_ANOMALY_MONITOR');
  static const createBudget = ActionType._('CREATE_BUDGET');
  static const enableCostOptimizationHub =
      ActionType._('ENABLE_COST_OPTIMIZATION_HUB');
  static const migrateToGranularPermissions =
      ActionType._('MIGRATE_TO_GRANULAR_PERMISSIONS');
  static const paymentsDue = ActionType._('PAYMENTS_DUE');
  static const paymentsPastDue = ActionType._('PAYMENTS_PAST_DUE');
  static const reviewAnomalies = ActionType._('REVIEW_ANOMALIES');
  static const reviewBudgetAlerts = ActionType._('REVIEW_BUDGET_ALERTS');
  static const reviewBudgetsExceeded = ActionType._('REVIEW_BUDGETS_EXCEEDED');
  static const reviewExpiringRi = ActionType._('REVIEW_EXPIRING_RI');
  static const reviewExpiringSp = ActionType._('REVIEW_EXPIRING_SP');
  static const reviewFreetierUsageAlerts =
      ActionType._('REVIEW_FREETIER_USAGE_ALERTS');
  static const reviewFreetierCreditsRemaining =
      ActionType._('REVIEW_FREETIER_CREDITS_REMAINING');
  static const reviewFreetierDaysRemaining =
      ActionType._('REVIEW_FREETIER_DAYS_REMAINING');
  static const reviewSavingsOpportunityRecommendations =
      ActionType._('REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS');
  static const updateExpiredPaymentMethod =
      ActionType._('UPDATE_EXPIRED_PAYMENT_METHOD');
  static const updateInvalidPaymentMethod =
      ActionType._('UPDATE_INVALID_PAYMENT_METHOD');
  static const updateTaxExemptionCertificate =
      ActionType._('UPDATE_TAX_EXEMPTION_CERTIFICATE');
  static const updateTaxRegistrationNumber =
      ActionType._('UPDATE_TAX_REGISTRATION_NUMBER');

  final String value;

  const ActionType._(this.value);

  static const values = [
    addAlternateBillingContact,
    createAnomalyMonitor,
    createBudget,
    enableCostOptimizationHub,
    migrateToGranularPermissions,
    paymentsDue,
    paymentsPastDue,
    reviewAnomalies,
    reviewBudgetAlerts,
    reviewBudgetsExceeded,
    reviewExpiringRi,
    reviewExpiringSp,
    reviewFreetierUsageAlerts,
    reviewFreetierCreditsRemaining,
    reviewFreetierDaysRemaining,
    reviewSavingsOpportunityRecommendations,
    updateExpiredPaymentMethod,
    updateInvalidPaymentMethod,
    updateTaxExemptionCertificate,
    updateTaxRegistrationNumber
  ];

  static ActionType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActionType._(value));

  @override
  bool operator ==(other) => other is ActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Severity {
  static const info = Severity._('INFO');
  static const warning = Severity._('WARNING');
  static const critical = Severity._('CRITICAL');

  final String value;

  const Severity._(this.value);

  static const values = [info, warning, critical];

  static Severity fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Severity._(value));

  @override
  bool operator ==(other) => other is Severity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Feature {
  static const account = Feature._('ACCOUNT');
  static const budgets = Feature._('BUDGETS');
  static const costAnomalyDetection = Feature._('COST_ANOMALY_DETECTION');
  static const costOptimizationHub = Feature._('COST_OPTIMIZATION_HUB');
  static const freeTier = Feature._('FREE_TIER');
  static const iam = Feature._('IAM');
  static const payments = Feature._('PAYMENTS');
  static const reservations = Feature._('RESERVATIONS');
  static const savingsPlans = Feature._('SAVINGS_PLANS');
  static const taxSettings = Feature._('TAX_SETTINGS');

  final String value;

  const Feature._(this.value);

  static const values = [
    account,
    budgets,
    costAnomalyDetection,
    costOptimizationHub,
    freeTier,
    iam,
    payments,
    reservations,
    savingsPlans,
    taxSettings
  ];

  static Feature fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Feature._(value));

  @override
  bool operator ==(other) => other is Feature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Enables filtering of results based on specified action criteria. You can
/// define multiple action filters to refine results using combinations of
/// feature type, severity level, and recommendation type.
///
/// @nodoc
class RequestFilter {
  /// A list of action filters that define criteria for filtering results. Each
  /// filter specifies a key, match option, and corresponding values to filter on.
  final List<ActionFilter>? actions;

  RequestFilter({
    this.actions,
  });

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    return {
      if (actions != null) 'actions': actions,
    };
  }
}

/// Describes a filter that returns a more specific list of recommended actions.
///
/// @nodoc
class ActionFilter {
  /// The category to filter on. Valid values are <code>FEATURE</code> for feature
  /// type, <code>SEVERITY</code> for severity level, and <code>TYPE</code> for
  /// recommendation type.
  final FilterName key;

  /// Specifies how to apply the filter. Use <code>EQUALS</code> to include
  /// matching results or <code>NOT_EQUALS</code> to exclude matching results.
  final MatchOption matchOption;

  /// One or more values to match against the specified key.
  final List<String> values;

  ActionFilter({
    required this.key,
    required this.matchOption,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOption = this.matchOption;
    final values = this.values;
    return {
      'key': key.value,
      'matchOption': matchOption.value,
      'values': values,
    };
  }
}

/// @nodoc
class FilterName {
  static const feature = FilterName._('FEATURE');
  static const severity = FilterName._('SEVERITY');
  static const type = FilterName._('TYPE');

  final String value;

  const FilterName._(this.value);

  static const values = [feature, severity, type];

  static FilterName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterName._(value));

  @override
  bool operator ==(other) => other is FilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MatchOption {
  static const equals = MatchOption._('EQUALS');
  static const notEquals = MatchOption._('NOT_EQUALS');

  final String value;

  const MatchOption._(this.value);

  static const values = [equals, notEquals];

  static MatchOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MatchOption._(value));

  @override
  bool operator ==(other) => other is MatchOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
