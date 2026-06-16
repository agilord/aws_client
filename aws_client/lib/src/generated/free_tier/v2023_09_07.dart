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

/// You can use the Amazon Web Services Free Tier API to query programmatically
/// your Free Tier usage data.
///
/// Free Tier tracks your monthly usage data for all free tier offers that are
/// associated with your Amazon Web Services account. You can use the Free Tier
/// API to filter and show only the data that you want.
///
/// Service endpoint
///
/// The Free Tier API provides the following endpoint:
/// <ul/>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-free-tier.html">Using
/// the Amazon Web Services Free Tier</a> in the <i>Billing User Guide</i>.
class FreeTier {
  final _s.JsonProtocol _protocol;
  FreeTier({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'freetier',
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

  /// Returns a specific activity record that is available to the customer.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [activityId] :
  /// A unique identifier that identifies the activity.
  ///
  /// Parameter [languageCode] :
  /// The language code used to return translated title and description fields.
  Future<GetAccountActivityResponse> getAccountActivity({
    required String activityId,
    LanguageCode? languageCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSFreeTierService.GetAccountActivity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'activityId': activityId,
        if (languageCode != null) 'languageCode': languageCode.value,
      },
    );

    return GetAccountActivityResponse.fromJson(jsonResponse.body);
  }

  /// This returns all of the information related to the state of the account
  /// plan related to Free Tier.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetAccountPlanStateResponse> getAccountPlanState() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSFreeTierService.GetAccountPlanState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAccountPlanStateResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all Free Tier usage objects that match your filters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// An expression that specifies the conditions that you want each
  /// <code>FreeTierUsage</code> object to meet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  /// <code>MaxResults</code> means that there can be up to the specified number
  /// of values, but there might be fewer results based on your filters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<GetFreeTierUsageResponse> getFreeTierUsage({
    Expression? filter,
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
      'X-Amz-Target': 'AWSFreeTierService.GetFreeTierUsage'
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

    return GetFreeTierUsageResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of activities that are available. This operation supports
  /// pagination and filtering by status.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterActivityStatuses] :
  /// The activity status filter. This field can be used to filter the response
  /// by activities status.
  ///
  /// Parameter [languageCode] :
  /// The language code used to return translated titles.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this request. To get the next
  /// page of items, make another request with the token returned in the output.
  ///
  /// Parameter [nextToken] :
  /// A token from a previous paginated response. If this is specified, the
  /// response includes records beginning from this token (inclusive), up to the
  /// number specified by <code>maxResults</code>.
  Future<ListAccountActivitiesResponse> listAccountActivities({
    List<ActivityStatus>? filterActivityStatuses,
    LanguageCode? languageCode,
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
      'X-Amz-Target': 'AWSFreeTierService.ListAccountActivities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filterActivityStatuses != null)
          'filterActivityStatuses':
              filterActivityStatuses.map((e) => e.value).toList(),
        if (languageCode != null) 'languageCode': languageCode.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAccountActivitiesResponse.fromJson(jsonResponse.body);
  }

  /// The account plan type for the Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountPlanType] :
  /// The target account plan type. This makes it explicit about the change and
  /// latest value of the <code>accountPlanType</code>.
  Future<UpgradeAccountPlanResponse> upgradeAccountPlan({
    required AccountPlanType accountPlanType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSFreeTierService.UpgradeAccountPlan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accountPlanType': accountPlanType.value,
      },
    );

    return UpgradeAccountPlanResponse.fromJson(jsonResponse.body);
  }
}

class GetAccountActivityResponse {
  /// A unique identifier that identifies the activity.
  final String activityId;

  /// Provides detailed information about the activity and its expected outcomes.
  final String description;

  /// The URL resource that provides guidance on activity requirements and
  /// completion.
  final String instructionsUrl;

  /// A reward granted upon activity completion.
  final ActivityReward reward;

  /// The current activity status.
  final ActivityStatus status;

  /// A short activity title.
  final String title;

  /// The timestamp when the activity is completed. This field appears only for
  /// activities in the <code>COMPLETED</code> state.
  final DateTime? completedAt;

  /// The estimated time to complete the activity. This is the duration in
  /// minutes.
  final int? estimatedTimeToCompleteInMinutes;

  /// The time by which the activity must be completed to receive a reward.
  final DateTime? expiresAt;

  /// The timestamp when the activity started. This field appears only for
  /// activities in the <code>IN_PROGRESS</code> or <code>COMPLETED</code> states.
  final DateTime? startedAt;

  GetAccountActivityResponse({
    required this.activityId,
    required this.description,
    required this.instructionsUrl,
    required this.reward,
    required this.status,
    required this.title,
    this.completedAt,
    this.estimatedTimeToCompleteInMinutes,
    this.expiresAt,
    this.startedAt,
  });

  factory GetAccountActivityResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountActivityResponse(
      activityId: (json['activityId'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      instructionsUrl: (json['instructionsUrl'] as String?) ?? '',
      reward: ActivityReward.fromJson(
          (json['reward'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: ActivityStatus.fromString((json['status'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
      completedAt: timeStampFromJson(json['completedAt']),
      estimatedTimeToCompleteInMinutes:
          json['estimatedTimeToCompleteInMinutes'] as int?,
      expiresAt: timeStampFromJson(json['expiresAt']),
      startedAt: timeStampFromJson(json['startedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final description = this.description;
    final instructionsUrl = this.instructionsUrl;
    final reward = this.reward;
    final status = this.status;
    final title = this.title;
    final completedAt = this.completedAt;
    final estimatedTimeToCompleteInMinutes =
        this.estimatedTimeToCompleteInMinutes;
    final expiresAt = this.expiresAt;
    final startedAt = this.startedAt;
    return {
      'activityId': activityId,
      'description': description,
      'instructionsUrl': instructionsUrl,
      'reward': reward,
      'status': status.value,
      'title': title,
      if (completedAt != null) 'completedAt': iso8601ToJson(completedAt),
      if (estimatedTimeToCompleteInMinutes != null)
        'estimatedTimeToCompleteInMinutes': estimatedTimeToCompleteInMinutes,
      if (expiresAt != null) 'expiresAt': iso8601ToJson(expiresAt),
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
    };
  }
}

class GetAccountPlanStateResponse {
  /// A unique identifier that identifies the account.
  final String accountId;

  /// The current status for the account plan.
  final AccountPlanStatus accountPlanStatus;

  /// The plan type for the account.
  final AccountPlanType accountPlanType;

  /// The timestamp for when the current account plan expires.
  final DateTime? accountPlanExpirationDate;

  /// The amount of credits remaining for the account.
  final MonetaryAmount? accountPlanRemainingCredits;

  GetAccountPlanStateResponse({
    required this.accountId,
    required this.accountPlanStatus,
    required this.accountPlanType,
    this.accountPlanExpirationDate,
    this.accountPlanRemainingCredits,
  });

  factory GetAccountPlanStateResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountPlanStateResponse(
      accountId: (json['accountId'] as String?) ?? '',
      accountPlanStatus: AccountPlanStatus.fromString(
          (json['accountPlanStatus'] as String?) ?? ''),
      accountPlanType: AccountPlanType.fromString(
          (json['accountPlanType'] as String?) ?? ''),
      accountPlanExpirationDate:
          timeStampFromJson(json['accountPlanExpirationDate']),
      accountPlanRemainingCredits: json['accountPlanRemainingCredits'] != null
          ? MonetaryAmount.fromJson(
              json['accountPlanRemainingCredits'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountPlanStatus = this.accountPlanStatus;
    final accountPlanType = this.accountPlanType;
    final accountPlanExpirationDate = this.accountPlanExpirationDate;
    final accountPlanRemainingCredits = this.accountPlanRemainingCredits;
    return {
      'accountId': accountId,
      'accountPlanStatus': accountPlanStatus.value,
      'accountPlanType': accountPlanType.value,
      if (accountPlanExpirationDate != null)
        'accountPlanExpirationDate': iso8601ToJson(accountPlanExpirationDate),
      if (accountPlanRemainingCredits != null)
        'accountPlanRemainingCredits': accountPlanRemainingCredits,
    };
  }
}

class GetFreeTierUsageResponse {
  /// The list of Free Tier usage objects that meet your filter expression.
  final List<FreeTierUsage> freeTierUsages;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  GetFreeTierUsageResponse({
    required this.freeTierUsages,
    this.nextToken,
  });

  factory GetFreeTierUsageResponse.fromJson(Map<String, dynamic> json) {
    return GetFreeTierUsageResponse(
      freeTierUsages: ((json['freeTierUsages'] as List?) ?? const [])
          .nonNulls
          .map((e) => FreeTierUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final freeTierUsages = this.freeTierUsages;
    final nextToken = this.nextToken;
    return {
      'freeTierUsages': freeTierUsages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAccountActivitiesResponse {
  /// A brief information about the activities.
  final List<ActivitySummary> activities;

  /// The token to include in another request to get the next page of items. This
  /// value is <code>null</code> when there are no more items to return.
  final String? nextToken;

  ListAccountActivitiesResponse({
    required this.activities,
    this.nextToken,
  });

  factory ListAccountActivitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountActivitiesResponse(
      activities: ((json['activities'] as List?) ?? const [])
          .nonNulls
          .map((e) => ActivitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activities = this.activities;
    final nextToken = this.nextToken;
    return {
      'activities': activities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class UpgradeAccountPlanResponse {
  /// A unique identifier that identifies the account.
  final String accountId;

  /// This indicates the latest state of the account plan within its lifecycle.
  final AccountPlanStatus accountPlanStatus;

  /// The type of plan for the account.
  final AccountPlanType accountPlanType;

  UpgradeAccountPlanResponse({
    required this.accountId,
    required this.accountPlanStatus,
    required this.accountPlanType,
  });

  factory UpgradeAccountPlanResponse.fromJson(Map<String, dynamic> json) {
    return UpgradeAccountPlanResponse(
      accountId: (json['accountId'] as String?) ?? '',
      accountPlanStatus: AccountPlanStatus.fromString(
          (json['accountPlanStatus'] as String?) ?? ''),
      accountPlanType: AccountPlanType.fromString(
          (json['accountPlanType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountPlanStatus = this.accountPlanStatus;
    final accountPlanType = this.accountPlanType;
    return {
      'accountId': accountId,
      'accountPlanStatus': accountPlanStatus.value,
      'accountPlanType': accountPlanType.value,
    };
  }
}

class AccountPlanType {
  static const free = AccountPlanType._('FREE');
  static const paid = AccountPlanType._('PAID');

  final String value;

  const AccountPlanType._(this.value);

  static const values = [free, paid];

  static AccountPlanType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountPlanType._(value));

  @override
  bool operator ==(other) => other is AccountPlanType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AccountPlanStatus {
  static const notStarted = AccountPlanStatus._('NOT_STARTED');
  static const active = AccountPlanStatus._('ACTIVE');
  static const expired = AccountPlanStatus._('EXPIRED');

  final String value;

  const AccountPlanStatus._(this.value);

  static const values = [notStarted, active, expired];

  static AccountPlanStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountPlanStatus._(value));

  @override
  bool operator ==(other) => other is AccountPlanStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of activities.
class ActivitySummary {
  /// A unique identifier that identifies the activity.
  final String activityId;

  /// The reward for the activity.
  final ActivityReward reward;

  /// The current status of the activity.
  final ActivityStatus status;

  /// The title of the activity.
  final String title;

  ActivitySummary({
    required this.activityId,
    required this.reward,
    required this.status,
    required this.title,
  });

  factory ActivitySummary.fromJson(Map<String, dynamic> json) {
    return ActivitySummary(
      activityId: (json['activityId'] as String?) ?? '',
      reward: ActivityReward.fromJson(
          (json['reward'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: ActivityStatus.fromString((json['status'] as String?) ?? ''),
      title: (json['title'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final reward = this.reward;
    final status = this.status;
    final title = this.title;
    return {
      'activityId': activityId,
      'reward': reward,
      'status': status.value,
      'title': title,
    };
  }
}

/// The summary of the rewards granted as a result of activities completed.
class ActivityReward {
  /// The credits gained by activity rewards.
  final MonetaryAmount? credit;

  ActivityReward({
    this.credit,
  });

  factory ActivityReward.fromJson(Map<String, dynamic> json) {
    return ActivityReward(
      credit: json['credit'] != null
          ? MonetaryAmount.fromJson(json['credit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final credit = this.credit;
    return {
      if (credit != null) 'credit': credit,
    };
  }
}

class ActivityStatus {
  static const notStarted = ActivityStatus._('NOT_STARTED');
  static const inProgress = ActivityStatus._('IN_PROGRESS');
  static const completed = ActivityStatus._('COMPLETED');
  static const expiring = ActivityStatus._('EXPIRING');

  final String value;

  const ActivityStatus._(this.value);

  static const values = [notStarted, inProgress, completed, expiring];

  static ActivityStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActivityStatus._(value));

  @override
  bool operator ==(other) => other is ActivityStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The monetary amount of the credit.
class MonetaryAmount {
  /// The aggregated monetary amount of credits earned.
  final double amount;

  /// The unit that the monetary amount is given in.
  final CurrencyCode unit;

  MonetaryAmount({
    required this.amount,
    required this.unit,
  });

  factory MonetaryAmount.fromJson(Map<String, dynamic> json) {
    return MonetaryAmount(
      amount: (json['amount'] as double?) ?? 0,
      unit: CurrencyCode.fromString((json['unit'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final unit = this.unit;
    return {
      'amount': amount,
      'unit': unit.value,
    };
  }
}

class CurrencyCode {
  static const usd = CurrencyCode._('USD');

  final String value;

  const CurrencyCode._(this.value);

  static const values = [usd];

  static CurrencyCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CurrencyCode._(value));

  @override
  bool operator ==(other) => other is CurrencyCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LanguageCode {
  static const enUs = LanguageCode._('en-US');
  static const enGb = LanguageCode._('en-GB');
  static const idId = LanguageCode._('id-ID');
  static const deDe = LanguageCode._('de-DE');
  static const esEs = LanguageCode._('es-ES');
  static const frFr = LanguageCode._('fr-FR');
  static const jaJp = LanguageCode._('ja-JP');
  static const itIt = LanguageCode._('it-IT');
  static const ptPt = LanguageCode._('pt-PT');
  static const koKr = LanguageCode._('ko-KR');
  static const zhCn = LanguageCode._('zh-CN');
  static const zhTw = LanguageCode._('zh-TW');
  static const trTr = LanguageCode._('tr-TR');

  final String value;

  const LanguageCode._(this.value);

  static const values = [
    enUs,
    enGb,
    idId,
    deDe,
    esEs,
    frFr,
    jaJp,
    itIt,
    ptPt,
    koKr,
    zhCn,
    zhTw,
    trTr
  ];

  static LanguageCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LanguageCode._(value));

  @override
  bool operator ==(other) => other is LanguageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Consists of a Amazon Web Services Free Tier offer’s metadata and your data
/// usage for the offer.
class FreeTierUsage {
  /// Describes the actual usage accrued month-to-day (MTD) that you've used so
  /// far.
  final double? actualUsageAmount;

  /// The description of the Free Tier offer.
  final String? description;

  /// Describes the forecasted usage by the month that you're expected to use.
  final double? forecastedUsageAmount;

  /// Describes the type of the Free Tier offer. For example, the offer can be
  /// <code>"12 Months Free"</code>, <code>"Always Free"</code>, and <code>"Free
  /// Trial"</code>.
  final String? freeTierType;

  /// Describes the maximum usage allowed in Free Tier.
  final double? limit;

  /// Describes <code>usageType</code> more granularly with the specific Amazon
  /// Web Services service API operation. For example, this can be the
  /// <code>RunInstances</code> API operation for Amazon Elastic Compute Cloud.
  final String? operation;

  /// Describes the Amazon Web Services Region for which this offer is applicable
  final String? region;

  /// The name of the Amazon Web Services service providing the Free Tier offer.
  /// For example, this can be Amazon Elastic Compute Cloud.
  final String? service;

  /// Describes the unit of the <code>usageType</code>, such as <code>Hrs</code>.
  final String? unit;

  /// Describes the usage details of the offer. For example, this might be
  /// <code>Global-BoxUsage:freetrial</code>.
  final String? usageType;

  FreeTierUsage({
    this.actualUsageAmount,
    this.description,
    this.forecastedUsageAmount,
    this.freeTierType,
    this.limit,
    this.operation,
    this.region,
    this.service,
    this.unit,
    this.usageType,
  });

  factory FreeTierUsage.fromJson(Map<String, dynamic> json) {
    return FreeTierUsage(
      actualUsageAmount: json['actualUsageAmount'] as double?,
      description: json['description'] as String?,
      forecastedUsageAmount: json['forecastedUsageAmount'] as double?,
      freeTierType: json['freeTierType'] as String?,
      limit: json['limit'] as double?,
      operation: json['operation'] as String?,
      region: json['region'] as String?,
      service: json['service'] as String?,
      unit: json['unit'] as String?,
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actualUsageAmount = this.actualUsageAmount;
    final description = this.description;
    final forecastedUsageAmount = this.forecastedUsageAmount;
    final freeTierType = this.freeTierType;
    final limit = this.limit;
    final operation = this.operation;
    final region = this.region;
    final service = this.service;
    final unit = this.unit;
    final usageType = this.usageType;
    return {
      if (actualUsageAmount != null) 'actualUsageAmount': actualUsageAmount,
      if (description != null) 'description': description,
      if (forecastedUsageAmount != null)
        'forecastedUsageAmount': forecastedUsageAmount,
      if (freeTierType != null) 'freeTierType': freeTierType,
      if (limit != null) 'limit': limit,
      if (operation != null) 'operation': operation,
      if (region != null) 'region': region,
      if (service != null) 'service': service,
      if (unit != null) 'unit': unit,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

/// Use <code>Expression</code> to filter in the <code>GetFreeTierUsage</code>
/// API operation.
///
/// You can use the following patterns:
///
/// <ul>
/// <li>
/// Simple dimension values (<code>Dimensions</code> root operator)
/// </li>
/// <li>
/// Complex expressions with logical operators (<code>AND</code>,
/// <code>NOT</code>, and <code>OR</code> root operators).
/// </li>
/// </ul>
/// For <i>simple dimension values</i>, you can set the dimension name, values,
/// and match type for the filters that you plan to use.
///
/// <b>Example for simple dimension values</b>
///
/// You can filter to match exactly for <code>REGION==us-east-1 OR
/// REGION==us-west-1</code>.
///
/// The corresponding <code>Expression</code> appears like the following:
/// <code>{ "Dimensions": { "Key": "REGION", "Values": [ "us-east-1",
/// "us-west-1" ], "MatchOptions": ["EQUALS"] } }</code>
///
/// As shown in the previous example, lists of dimension values are combined
/// with <code>OR</code> when you apply the filter.
///
/// For <i>complex expressions with logical operators</i>, you can have nested
/// expressions to use the logical operators and specify advanced filtering.
///
/// <b>Example for complex expressions with logical operators</b>
///
/// You can filter by <code>((REGION == us-east-1 OR REGION == us-west-1) OR
/// (SERVICE CONTAINS AWSLambda)) AND (USAGE_TYPE !CONTAINS
/// DataTransfer)</code>.
///
/// The corresponding <code>Expression</code> appears like the following:
/// <code>{ "And": [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [
/// "us-east-1", "us-west-1" ], "MatchOptions": ["EQUALS"] }}, {"Dimensions": {
/// "Key": "SERVICE", "Values": ["AWSLambda"], "MatchOptions": ["CONTAINS"] } }
/// ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values":
/// ["DataTransfer"], "MatchOptions": ["CONTAINS"] }}} ] }</code>
///
/// In the following <b>Contents</b>, you must specify exactly one of the
/// following root operators.
class Expression {
  /// Return results that match all <code>Expressions</code> that you specified in
  /// the array.
  final List<Expression>? and;

  /// The specific dimension, values, and match type to filter objects with.
  final DimensionValues? dimensions;

  /// Return results that don’t match the <code>Expression</code> that you
  /// specified.
  final Expression? not;

  /// Return results that match any of the <code>Expressions</code> that you
  /// specified. in the array.
  final List<Expression>? or;

  Expression({
    this.and,
    this.dimensions,
    this.not,
    this.or,
  });

  Map<String, dynamic> toJson() {
    final and = this.and;
    final dimensions = this.dimensions;
    final not = this.not;
    final or = this.or;
    return {
      if (and != null) 'And': and,
      if (dimensions != null) 'Dimensions': dimensions,
      if (not != null) 'Not': not,
      if (or != null) 'Or': or,
    };
  }
}

/// Contains the specifications for the filters to use for your request.
class DimensionValues {
  /// The name of the dimension that you want to filter on.
  final Dimension key;

  /// The match options that you can use to filter your results. You can specify
  /// only one of these values in the array.
  final List<MatchOption> matchOptions;

  /// The metadata values you can specify to filter upon, so that the results all
  /// match at least one of the specified values.
  final List<String> values;

  DimensionValues({
    required this.key,
    required this.matchOptions,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      'Key': key.value,
      'MatchOptions': matchOptions.map((e) => e.value).toList(),
      'Values': values,
    };
  }
}

class Dimension {
  static const service = Dimension._('SERVICE');
  static const operation = Dimension._('OPERATION');
  static const usageType = Dimension._('USAGE_TYPE');
  static const region = Dimension._('REGION');
  static const freeTierType = Dimension._('FREE_TIER_TYPE');
  static const description = Dimension._('DESCRIPTION');
  static const usagePercentage = Dimension._('USAGE_PERCENTAGE');

  final String value;

  const Dimension._(this.value);

  static const values = [
    service,
    operation,
    usageType,
    region,
    freeTierType,
    description,
    usagePercentage
  ];

  static Dimension fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Dimension._(value));

  @override
  bool operator ==(other) => other is Dimension && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MatchOption {
  static const equals = MatchOption._('EQUALS');
  static const startsWith = MatchOption._('STARTS_WITH');
  static const endsWith = MatchOption._('ENDS_WITH');
  static const contains = MatchOption._('CONTAINS');
  static const greaterThanOrEqual = MatchOption._('GREATER_THAN_OR_EQUAL');

  final String value;

  const MatchOption._(this.value);

  static const values = [
    equals,
    startsWith,
    endsWith,
    contains,
    greaterThanOrEqual
  ];

  static MatchOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MatchOption._(value));

  @override
  bool operator ==(other) => other is MatchOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
