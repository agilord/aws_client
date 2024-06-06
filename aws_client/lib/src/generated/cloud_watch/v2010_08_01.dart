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

import 'v2010_08_01.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon CloudWatch monitors your Amazon Web Services (Amazon Web Services)
/// resources and the applications you run on Amazon Web Services in real time.
/// You can use CloudWatch to collect and track metrics, which are the variables
/// you want to measure for your resources and applications.
///
/// CloudWatch alarms send notifications or automatically change the resources
/// you are monitoring based on rules that you define. For example, you can
/// monitor the CPU usage and disk reads and writes of your Amazon EC2
/// instances. Then, use this data to determine whether you should launch
/// additional instances to handle increased load. You can also use this data to
/// stop under-used instances to save money.
///
/// In addition to monitoring the built-in metrics that come with Amazon Web
/// Services, you can monitor your own custom metrics. With CloudWatch, you gain
/// system-wide visibility into resource utilization, application performance,
/// and operational health.
class CloudWatch {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  CloudWatch({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'monitoring',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Deletes the specified alarms. You can delete up to 100 alarms in one
  /// operation. However, this total can include no more than one composite
  /// alarm. For example, you could delete 99 metric alarms and one composite
  /// alarms with one operation, but you can't delete two composite alarms with
  /// one operation.
  ///
  /// If you specify an incorrect alarm name or make any other error in the
  /// operation, no alarms are deleted. To confirm that alarms were deleted
  /// successfully, you can use the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarms.html">DescribeAlarms</a>
  /// operation after using <code>DeleteAlarms</code>.
  /// <note>
  /// It is possible to create a loop or cycle of composite alarms, where
  /// composite alarm A depends on composite alarm B, and composite alarm B also
  /// depends on composite alarm A. In this scenario, you can't delete any
  /// composite alarm that is part of the cycle because there is always still a
  /// composite alarm that depends on that alarm that you want to delete.
  ///
  /// To get out of such a situation, you must break the cycle by changing the
  /// rule of one of the composite alarms in the cycle to remove a dependency
  /// that creates the cycle. The simplest change to make to break a cycle is to
  /// change the <code>AlarmRule</code> of one of the alarms to
  /// <code>false</code>.
  ///
  /// Additionally, the evaluation of composite alarms stops if CloudWatch
  /// detects a cycle in the evaluation path.
  /// </note>
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [alarmNames] :
  /// The alarms to be deleted. Do not enclose the alarm names in quote marks.
  Future<void> deleteAlarms({
    required List<String> alarmNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['AlarmNames'] = alarmNames;
    await _protocol.send(
      $request,
      action: 'DeleteAlarms',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAlarmsInput'],
      shapes: shapes,
    );
  }

  /// Deletes the specified anomaly detection model from your account. For more
  /// information about how to delete an anomaly detection model, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Anomaly_Detection_Alarm.html#Delete_Anomaly_Detection_Model">Deleting
  /// an anomaly detection model</a> in the <i>CloudWatch User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [dimensions] :
  /// The metric dimensions associated with the anomaly detection model to
  /// delete.
  ///
  /// Parameter [metricMathAnomalyDetector] :
  /// The metric math anomaly detector to be deleted.
  ///
  /// When using <code>MetricMathAnomalyDetector</code>, you cannot include
  /// following parameters in the same operation:
  ///
  /// <ul>
  /// <li>
  /// <code>Dimensions</code>,
  /// </li>
  /// <li>
  /// <code>MetricName</code>
  /// </li>
  /// <li>
  /// <code>Namespace</code>
  /// </li>
  /// <li>
  /// <code>Stat</code>
  /// </li>
  /// <li>
  /// the <code>SingleMetricAnomalyDetector</code> parameters of
  /// <code>DeleteAnomalyDetectorInput</code>
  /// </li>
  /// </ul>
  /// Instead, specify the metric math anomaly detector attributes as part of
  /// the <code>MetricMathAnomalyDetector</code> property.
  ///
  /// Parameter [metricName] :
  /// The metric name associated with the anomaly detection model to delete.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the anomaly detection model to delete.
  ///
  /// Parameter [singleMetricAnomalyDetector] :
  /// A single metric anomaly detector to be deleted.
  ///
  /// When using <code>SingleMetricAnomalyDetector</code>, you cannot include
  /// the following parameters in the same operation:
  ///
  /// <ul>
  /// <li>
  /// <code>Dimensions</code>,
  /// </li>
  /// <li>
  /// <code>MetricName</code>
  /// </li>
  /// <li>
  /// <code>Namespace</code>
  /// </li>
  /// <li>
  /// <code>Stat</code>
  /// </li>
  /// <li>
  /// the <code>MetricMathAnomalyDetector</code> parameters of
  /// <code>DeleteAnomalyDetectorInput</code>
  /// </li>
  /// </ul>
  /// Instead, specify the single metric anomaly detector attributes as part of
  /// the <code>SingleMetricAnomalyDetector</code> property.
  ///
  /// Parameter [stat] :
  /// The statistic associated with the anomaly detection model to delete.
  Future<void> deleteAnomalyDetector({
    List<Dimension>? dimensions,
    MetricMathAnomalyDetector? metricMathAnomalyDetector,
    String? metricName,
    String? namespace,
    SingleMetricAnomalyDetector? singleMetricAnomalyDetector,
    String? stat,
  }) async {
    final $request = <String, dynamic>{};
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    metricMathAnomalyDetector
        ?.also((arg) => $request['MetricMathAnomalyDetector'] = arg);
    metricName?.also((arg) => $request['MetricName'] = arg);
    namespace?.also((arg) => $request['Namespace'] = arg);
    singleMetricAnomalyDetector
        ?.also((arg) => $request['SingleMetricAnomalyDetector'] = arg);
    stat?.also((arg) => $request['Stat'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteAnomalyDetector',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAnomalyDetectorInput'],
      shapes: shapes,
      resultWrapper: 'DeleteAnomalyDetectorResult',
    );
  }

  /// Deletes all dashboards that you specify. You can specify up to 100
  /// dashboards to delete. If there is an error during this call, no dashboards
  /// are deleted.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [DashboardNotFoundError].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [dashboardNames] :
  /// The dashboards to be deleted. This parameter is required.
  Future<void> deleteDashboards({
    required List<String> dashboardNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['DashboardNames'] = dashboardNames;
    await _protocol.send(
      $request,
      action: 'DeleteDashboards',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDashboardsInput'],
      shapes: shapes,
      resultWrapper: 'DeleteDashboardsResult',
    );
  }

  /// Permanently deletes the specified Contributor Insights rules.
  ///
  /// If you create a rule, delete it, and then re-create it with the same name,
  /// historical data from the first time the rule was created might not be
  /// available.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [ruleNames] :
  /// An array of the rule names to delete. If you need to find out the names of
  /// your rules, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html">DescribeInsightRules</a>.
  Future<DeleteInsightRulesOutput> deleteInsightRules({
    required List<String> ruleNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['RuleNames'] = ruleNames;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteInsightRules',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteInsightRulesInput'],
      shapes: shapes,
      resultWrapper: 'DeleteInsightRulesResult',
    );
    return DeleteInsightRulesOutput.fromXml($result);
  }

  /// Permanently deletes the metric stream that you specify.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [name] :
  /// The name of the metric stream to delete.
  Future<void> deleteMetricStream({
    required String name,
  }) async {
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    await _protocol.send(
      $request,
      action: 'DeleteMetricStream',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteMetricStreamInput'],
      shapes: shapes,
      resultWrapper: 'DeleteMetricStreamResult',
    );
  }

  /// Retrieves the history for the specified alarm. You can filter the results
  /// by date range or item type. If an alarm name is not specified, the
  /// histories for either all metric alarms or all composite alarms are
  /// returned.
  ///
  /// CloudWatch retains the history of an alarm even if you delete the alarm.
  ///
  /// To use this operation and return information about a composite alarm, you
  /// must be signed on with the <code>cloudwatch:DescribeAlarmHistory</code>
  /// permission that is scoped to <code>*</code>. You can't return information
  /// about composite alarms if your
  /// <code>cloudwatch:DescribeAlarmHistory</code> permission has a narrower
  /// scope.
  ///
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [alarmName] :
  /// The name of the alarm.
  ///
  /// Parameter [alarmTypes] :
  /// Use this parameter to specify whether you want the operation to return
  /// metric alarms or composite alarms. If you omit this parameter, only metric
  /// alarms are returned.
  ///
  /// Parameter [endDate] :
  /// The ending date to retrieve alarm history.
  ///
  /// Parameter [historyItemType] :
  /// The type of alarm histories to retrieve.
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of alarm history records to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to indicate that there is more data
  /// available.
  ///
  /// Parameter [scanBy] :
  /// Specified whether to return the newest or oldest alarm history first.
  /// Specify <code>TimestampDescending</code> to have the newest event history
  /// returned first, and specify <code>TimestampAscending</code> to have the
  /// oldest history returned first.
  ///
  /// Parameter [startDate] :
  /// The starting date to retrieve alarm history.
  Future<DescribeAlarmHistoryOutput> describeAlarmHistory({
    String? alarmName,
    List<AlarmType>? alarmTypes,
    DateTime? endDate,
    HistoryItemType? historyItemType,
    int? maxRecords,
    String? nextToken,
    ScanBy? scanBy,
    DateTime? startDate,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    alarmName?.also((arg) => $request['AlarmName'] = arg);
    alarmTypes?.also(
        (arg) => $request['AlarmTypes'] = arg.map((e) => e.toValue()).toList());
    endDate?.also((arg) => $request['EndDate'] = _s.iso8601ToJson(arg));
    historyItemType?.also((arg) => $request['HistoryItemType'] = arg.toValue());
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    scanBy?.also((arg) => $request['ScanBy'] = arg.toValue());
    startDate?.also((arg) => $request['StartDate'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAlarmHistory',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAlarmHistoryInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAlarmHistoryResult',
    );
    return DescribeAlarmHistoryOutput.fromXml($result);
  }

  /// Retrieves the specified alarms. You can filter the results by specifying a
  /// prefix for the alarm name, the alarm state, or a prefix for any action.
  ///
  /// To use this operation and return information about composite alarms, you
  /// must be signed on with the <code>cloudwatch:DescribeAlarms</code>
  /// permission that is scoped to <code>*</code>. You can't return information
  /// about composite alarms if your <code>cloudwatch:DescribeAlarms</code>
  /// permission has a narrower scope.
  ///
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [actionPrefix] :
  /// Use this parameter to filter the results of the operation to only those
  /// alarms that use a certain alarm action. For example, you could specify the
  /// ARN of an SNS topic to find all alarms that send notifications to that
  /// topic.
  ///
  /// Parameter [alarmNamePrefix] :
  /// An alarm name prefix. If you specify this parameter, you receive
  /// information about all alarms that have names that start with this prefix.
  ///
  /// If this parameter is specified, you cannot specify
  /// <code>AlarmNames</code>.
  ///
  /// Parameter [alarmNames] :
  /// The names of the alarms to retrieve information about.
  ///
  /// Parameter [alarmTypes] :
  /// Use this parameter to specify whether you want the operation to return
  /// metric alarms or composite alarms. If you omit this parameter, only metric
  /// alarms are returned, even if composite alarms exist in the account.
  ///
  /// For example, if you omit this parameter or specify
  /// <code>MetricAlarms</code>, the operation returns only a list of metric
  /// alarms. It does not return any composite alarms, even if composite alarms
  /// exist in the account.
  ///
  /// If you specify <code>CompositeAlarms</code>, the operation returns only a
  /// list of composite alarms, and does not return any metric alarms.
  ///
  /// Parameter [childrenOfAlarmName] :
  /// If you use this parameter and specify the name of a composite alarm, the
  /// operation returns information about the "children" alarms of the alarm you
  /// specify. These are the metric alarms and composite alarms referenced in
  /// the <code>AlarmRule</code> field of the composite alarm that you specify
  /// in <code>ChildrenOfAlarmName</code>. Information about the composite alarm
  /// that you name in <code>ChildrenOfAlarmName</code> is not returned.
  ///
  /// If you specify <code>ChildrenOfAlarmName</code>, you cannot specify any
  /// other parameters in the request except for <code>MaxRecords</code> and
  /// <code>NextToken</code>. If you do so, you receive a validation error.
  /// <note>
  /// Only the <code>Alarm Name</code>, <code>ARN</code>,
  /// <code>StateValue</code> (OK/ALARM/INSUFFICIENT_DATA), and
  /// <code>StateUpdatedTimestamp</code> information are returned by this
  /// operation when you use this parameter. To get complete information about
  /// these alarms, perform another <code>DescribeAlarms</code> operation and
  /// specify the parent alarm names in the <code>AlarmNames</code> parameter.
  /// </note>
  ///
  /// Parameter [maxRecords] :
  /// The maximum number of alarm descriptions to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to indicate that there is more data
  /// available.
  ///
  /// Parameter [parentsOfAlarmName] :
  /// If you use this parameter and specify the name of a metric or composite
  /// alarm, the operation returns information about the "parent" alarms of the
  /// alarm you specify. These are the composite alarms that have
  /// <code>AlarmRule</code> parameters that reference the alarm named in
  /// <code>ParentsOfAlarmName</code>. Information about the alarm that you
  /// specify in <code>ParentsOfAlarmName</code> is not returned.
  ///
  /// If you specify <code>ParentsOfAlarmName</code>, you cannot specify any
  /// other parameters in the request except for <code>MaxRecords</code> and
  /// <code>NextToken</code>. If you do so, you receive a validation error.
  /// <note>
  /// Only the Alarm Name and ARN are returned by this operation when you use
  /// this parameter. To get complete information about these alarms, perform
  /// another <code>DescribeAlarms</code> operation and specify the parent alarm
  /// names in the <code>AlarmNames</code> parameter.
  /// </note>
  ///
  /// Parameter [stateValue] :
  /// Specify this parameter to receive information only about alarms that are
  /// currently in the state that you specify.
  Future<DescribeAlarmsOutput> describeAlarms({
    String? actionPrefix,
    String? alarmNamePrefix,
    List<String>? alarmNames,
    List<AlarmType>? alarmTypes,
    String? childrenOfAlarmName,
    int? maxRecords,
    String? nextToken,
    String? parentsOfAlarmName,
    StateValue? stateValue,
  }) async {
    _s.validateNumRange(
      'maxRecords',
      maxRecords,
      1,
      100,
    );
    final $request = <String, dynamic>{};
    actionPrefix?.also((arg) => $request['ActionPrefix'] = arg);
    alarmNamePrefix?.also((arg) => $request['AlarmNamePrefix'] = arg);
    alarmNames?.also((arg) => $request['AlarmNames'] = arg);
    alarmTypes?.also(
        (arg) => $request['AlarmTypes'] = arg.map((e) => e.toValue()).toList());
    childrenOfAlarmName?.also((arg) => $request['ChildrenOfAlarmName'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    parentsOfAlarmName?.also((arg) => $request['ParentsOfAlarmName'] = arg);
    stateValue?.also((arg) => $request['StateValue'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAlarms',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAlarmsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAlarmsResult',
    );
    return DescribeAlarmsOutput.fromXml($result);
  }

  /// Retrieves the alarms for the specified metric. To filter the results,
  /// specify a statistic, period, or unit.
  ///
  /// This operation retrieves only standard alarms that are based on the
  /// specified metric. It does not return alarms based on math expressions that
  /// use the specified metric, or composite alarms that use the specified
  /// metric.
  ///
  /// Parameter [metricName] :
  /// The name of the metric.
  ///
  /// Parameter [namespace] :
  /// The namespace of the metric.
  ///
  /// Parameter [dimensions] :
  /// The dimensions associated with the metric. If the metric has any
  /// associated dimensions, you must specify them in order for the call to
  /// succeed.
  ///
  /// Parameter [extendedStatistic] :
  /// The percentile statistic for the metric. Specify a value between p0.0 and
  /// p100.
  ///
  /// Parameter [period] :
  /// The period, in seconds, over which the statistic is applied.
  ///
  /// Parameter [statistic] :
  /// The statistic for the metric, other than percentiles. For percentile
  /// statistics, use <code>ExtendedStatistics</code>.
  ///
  /// Parameter [unit] :
  /// The unit for the metric.
  Future<DescribeAlarmsForMetricOutput> describeAlarmsForMetric({
    required String metricName,
    required String namespace,
    List<Dimension>? dimensions,
    String? extendedStatistic,
    int? period,
    Statistic? statistic,
    StandardUnit? unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    $request['MetricName'] = metricName;
    $request['Namespace'] = namespace;
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    extendedStatistic?.also((arg) => $request['ExtendedStatistic'] = arg);
    period?.also((arg) => $request['Period'] = arg);
    statistic?.also((arg) => $request['Statistic'] = arg.toValue());
    unit?.also((arg) => $request['Unit'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAlarmsForMetric',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAlarmsForMetricInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAlarmsForMetricResult',
    );
    return DescribeAlarmsForMetricOutput.fromXml($result);
  }

  /// Lists the anomaly detection models that you have created in your account.
  /// For single metric anomaly detectors, you can list all of the models in
  /// your account or filter the results to only the models that are related to
  /// a certain namespace, metric name, or metric dimension. For metric math
  /// anomaly detectors, you can list them by adding <code>METRIC_MATH</code> to
  /// the <code>AnomalyDetectorTypes</code> array. This will return all metric
  /// math anomaly detectors in your account.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [anomalyDetectorTypes] :
  /// The anomaly detector types to request when using
  /// <code>DescribeAnomalyDetectorsInput</code>. If empty, defaults to
  /// <code>SINGLE_METRIC</code>.
  ///
  /// Parameter [dimensions] :
  /// Limits the results to only the anomaly detection models that are
  /// associated with the specified metric dimensions. If there are multiple
  /// metrics that have these dimensions and have anomaly detection models
  /// associated, they're all returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. The maximum
  /// value that you can specify is 100.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [metricName] :
  /// Limits the results to only the anomaly detection models that are
  /// associated with the specified metric name. If there are multiple metrics
  /// with this name in different namespaces that have anomaly detection models,
  /// they're all returned.
  ///
  /// Parameter [namespace] :
  /// Limits the results to only the anomaly detection models that are
  /// associated with the specified namespace.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<DescribeAnomalyDetectorsOutput> describeAnomalyDetectors({
    List<AnomalyDetectorType>? anomalyDetectorTypes,
    List<Dimension>? dimensions,
    int? maxResults,
    String? metricName,
    String? namespace,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    anomalyDetectorTypes?.also((arg) => $request['AnomalyDetectorTypes'] =
        arg.map((e) => e.toValue()).toList());
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    metricName?.also((arg) => $request['MetricName'] = arg);
    namespace?.also((arg) => $request['Namespace'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeAnomalyDetectors',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeAnomalyDetectorsInput'],
      shapes: shapes,
      resultWrapper: 'DescribeAnomalyDetectorsResult',
    );
    return DescribeAnomalyDetectorsOutput.fromXml($result);
  }

  /// Returns a list of all the Contributor Insights rules in your account.
  ///
  /// For more information about Contributor Insights, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html">Using
  /// Contributor Insights to Analyze High-Cardinality Data</a>.
  ///
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default of 500 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous operation, to get
  /// the next set of rules.
  Future<DescribeInsightRulesOutput> describeInsightRules({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeInsightRules',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeInsightRulesInput'],
      shapes: shapes,
      resultWrapper: 'DescribeInsightRulesResult',
    );
    return DescribeInsightRulesOutput.fromXml($result);
  }

  /// Disables the actions for the specified alarms. When an alarm's actions are
  /// disabled, the alarm actions do not execute when the alarm state changes.
  ///
  /// Parameter [alarmNames] :
  /// The names of the alarms.
  Future<void> disableAlarmActions({
    required List<String> alarmNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['AlarmNames'] = alarmNames;
    await _protocol.send(
      $request,
      action: 'DisableAlarmActions',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisableAlarmActionsInput'],
      shapes: shapes,
    );
  }

  /// Disables the specified Contributor Insights rules. When rules are
  /// disabled, they do not analyze log groups and do not incur costs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [ruleNames] :
  /// An array of the rule names to disable. If you need to find out the names
  /// of your rules, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html">DescribeInsightRules</a>.
  Future<DisableInsightRulesOutput> disableInsightRules({
    required List<String> ruleNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['RuleNames'] = ruleNames;
    final $result = await _protocol.send(
      $request,
      action: 'DisableInsightRules',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DisableInsightRulesInput'],
      shapes: shapes,
      resultWrapper: 'DisableInsightRulesResult',
    );
    return DisableInsightRulesOutput.fromXml($result);
  }

  /// Enables the actions for the specified alarms.
  ///
  /// Parameter [alarmNames] :
  /// The names of the alarms.
  Future<void> enableAlarmActions({
    required List<String> alarmNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['AlarmNames'] = alarmNames;
    await _protocol.send(
      $request,
      action: 'EnableAlarmActions',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnableAlarmActionsInput'],
      shapes: shapes,
    );
  }

  /// Enables the specified Contributor Insights rules. When rules are enabled,
  /// they immediately begin analyzing log data.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [ruleNames] :
  /// An array of the rule names to enable. If you need to find out the names of
  /// your rules, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html">DescribeInsightRules</a>.
  Future<EnableInsightRulesOutput> enableInsightRules({
    required List<String> ruleNames,
  }) async {
    final $request = <String, dynamic>{};
    $request['RuleNames'] = ruleNames;
    final $result = await _protocol.send(
      $request,
      action: 'EnableInsightRules',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnableInsightRulesInput'],
      shapes: shapes,
      resultWrapper: 'EnableInsightRulesResult',
    );
    return EnableInsightRulesOutput.fromXml($result);
  }

  /// Displays the details of the dashboard that you specify.
  ///
  /// To copy an existing dashboard, use <code>GetDashboard</code>, and then use
  /// the data returned within <code>DashboardBody</code> as the template for
  /// the new dashboard when you call <code>PutDashboard</code> to create the
  /// copy.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [DashboardNotFoundError].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [dashboardName] :
  /// The name of the dashboard to be described.
  Future<GetDashboardOutput> getDashboard({
    required String dashboardName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DashboardName'] = dashboardName;
    final $result = await _protocol.send(
      $request,
      action: 'GetDashboard',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetDashboardInput'],
      shapes: shapes,
      resultWrapper: 'GetDashboardResult',
    );
    return GetDashboardOutput.fromXml($result);
  }

  /// This operation returns the time series data collected by a Contributor
  /// Insights rule. The data includes the identity and number of contributors
  /// to the log group.
  ///
  /// You can also optionally return one or more statistics about each data
  /// point in the time series. These statistics can include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>UniqueContributors</code> -- the number of unique contributors for
  /// each data point.
  /// </li>
  /// <li>
  /// <code>MaxContributorValue</code> -- the value of the top contributor for
  /// each data point. The identity of the contributor might change for each
  /// data point in the graph.
  ///
  /// If this rule aggregates by COUNT, the top contributor for each data point
  /// is the contributor with the most occurrences in that period. If the rule
  /// aggregates by SUM, the top contributor is the contributor with the highest
  /// sum in the log field specified by the rule's <code>Value</code>, during
  /// that period.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> -- the number of data points matched by the rule.
  /// </li>
  /// <li>
  /// <code>Sum</code> -- the sum of the values from all contributors during the
  /// time period represented by that data point.
  /// </li>
  /// <li>
  /// <code>Minimum</code> -- the minimum value from a single observation during
  /// the time period represented by that data point.
  /// </li>
  /// <li>
  /// <code>Maximum</code> -- the maximum value from a single observation during
  /// the time period represented by that data point.
  /// </li>
  /// <li>
  /// <code>Average</code> -- the average value from all contributors during the
  /// time period represented by that data point.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The end time of the data to use in the report. When used in a raw HTTP
  /// Query API, it is formatted as <code>yyyy-MM-dd'T'HH:mm:ss</code>. For
  /// example, <code>2019-07-01T23:59:59</code>.
  ///
  /// Parameter [period] :
  /// The period, in seconds, to use for the statistics in the
  /// <code>InsightRuleMetricDatapoint</code> results.
  ///
  /// Parameter [ruleName] :
  /// The name of the rule that you want to see data from.
  ///
  /// Parameter [startTime] :
  /// The start time of the data to use in the report. When used in a raw HTTP
  /// Query API, it is formatted as <code>yyyy-MM-dd'T'HH:mm:ss</code>. For
  /// example, <code>2019-07-01T23:59:59</code>.
  ///
  /// Parameter [maxContributorCount] :
  /// The maximum number of contributors to include in the report. The range is
  /// 1 to 100. If you omit this, the default of 10 is used.
  ///
  /// Parameter [metrics] :
  /// Specifies which metrics to use for aggregation of contributor values for
  /// the report. You can specify one or more of the following metrics:
  ///
  /// <ul>
  /// <li>
  /// <code>UniqueContributors</code> -- the number of unique contributors for
  /// each data point.
  /// </li>
  /// <li>
  /// <code>MaxContributorValue</code> -- the value of the top contributor for
  /// each data point. The identity of the contributor might change for each
  /// data point in the graph.
  ///
  /// If this rule aggregates by COUNT, the top contributor for each data point
  /// is the contributor with the most occurrences in that period. If the rule
  /// aggregates by SUM, the top contributor is the contributor with the highest
  /// sum in the log field specified by the rule's <code>Value</code>, during
  /// that period.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> -- the number of data points matched by the rule.
  /// </li>
  /// <li>
  /// <code>Sum</code> -- the sum of the values from all contributors during the
  /// time period represented by that data point.
  /// </li>
  /// <li>
  /// <code>Minimum</code> -- the minimum value from a single observation during
  /// the time period represented by that data point.
  /// </li>
  /// <li>
  /// <code>Maximum</code> -- the maximum value from a single observation during
  /// the time period represented by that data point.
  /// </li>
  /// <li>
  /// <code>Average</code> -- the average value from all contributors during the
  /// time period represented by that data point.
  /// </li>
  /// </ul>
  ///
  /// Parameter [orderBy] :
  /// Determines what statistic to use to rank the contributors. Valid values
  /// are <code>Sum</code> and <code>Maximum</code>.
  Future<GetInsightRuleReportOutput> getInsightRuleReport({
    required DateTime endTime,
    required int period,
    required String ruleName,
    required DateTime startTime,
    int? maxContributorCount,
    List<String>? metrics,
    String? orderBy,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['EndTime'] = _s.iso8601ToJson(endTime);
    $request['Period'] = period;
    $request['RuleName'] = ruleName;
    $request['StartTime'] = _s.iso8601ToJson(startTime);
    maxContributorCount?.also((arg) => $request['MaxContributorCount'] = arg);
    metrics?.also((arg) => $request['Metrics'] = arg);
    orderBy?.also((arg) => $request['OrderBy'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetInsightRuleReport',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetInsightRuleReportInput'],
      shapes: shapes,
      resultWrapper: 'GetInsightRuleReportResult',
    );
    return GetInsightRuleReportOutput.fromXml($result);
  }

  /// You can use the <code>GetMetricData</code> API to retrieve CloudWatch
  /// metric values. The operation can also include a CloudWatch Metrics
  /// Insights query, and one or more metric math functions.
  ///
  /// A <code>GetMetricData</code> operation that does not include a query can
  /// retrieve as many as 500 different metrics in a single request, with a
  /// total of as many as 100,800 data points. You can also optionally perform
  /// metric math expressions on the values of the returned statistics, to
  /// create new time series that represent new insights into your data. For
  /// example, using Lambda metrics, you could divide the Errors metric by the
  /// Invocations metric to get an error rate time series. For more information
  /// about metric math expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric
  /// Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// If you include a Metrics Insights query, each <code>GetMetricData</code>
  /// operation can include only one query. But the same
  /// <code>GetMetricData</code> operation can also retrieve other metrics.
  /// Metrics Insights queries can query only the most recent three hours of
  /// metric data. For more information about Metrics Insights, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/query_with_cloudwatch-metrics-insights.html">Query
  /// your metrics with CloudWatch Metrics Insights</a>.
  ///
  /// Calls to the <code>GetMetricData</code> API have a different pricing
  /// structure than calls to <code>GetMetricStatistics</code>. For more
  /// information about pricing, see <a
  /// href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  ///
  /// Amazon CloudWatch retains metric data as follows:
  ///
  /// <ul>
  /// <li>
  /// Data points with a period of less than 60 seconds are available for 3
  /// hours. These data points are high-resolution metrics and are available
  /// only for custom metrics that have been defined with a
  /// <code>StorageResolution</code> of 1.
  /// </li>
  /// <li>
  /// Data points with a period of 60 seconds (1-minute) are available for 15
  /// days.
  /// </li>
  /// <li>
  /// Data points with a period of 300 seconds (5-minute) are available for 63
  /// days.
  /// </li>
  /// <li>
  /// Data points with a period of 3600 seconds (1 hour) are available for 455
  /// days (15 months).
  /// </li>
  /// </ul>
  /// Data points that are initially published with a shorter period are
  /// aggregated together for long-term storage. For example, if you collect
  /// data using a period of 1 minute, the data remains available for 15 days
  /// with 1-minute resolution. After 15 days, this data is still available, but
  /// is aggregated and retrievable only with a resolution of 5 minutes. After
  /// 63 days, the data is further aggregated and is available with a resolution
  /// of 1 hour.
  ///
  /// If you omit <code>Unit</code> in your request, all data that was collected
  /// with any unit is returned, along with the corresponding units that were
  /// specified when the data was reported to CloudWatch. If you specify a unit,
  /// the operation returns only data that was collected with that unit
  /// specified. If you specify a unit that does not match the data collected,
  /// the results of the operation are null. CloudWatch does not perform unit
  /// conversions.
  ///
  /// <b>Using Metrics Insights queries with metric math</b>
  ///
  /// You can't mix a Metric Insights query and metric math syntax in the same
  /// expression, but you can reference results from a Metrics Insights query
  /// within other Metric math expressions. A Metrics Insights query without a
  /// <b>GROUP BY</b> clause returns a single time-series (TS), and can be used
  /// as input for a metric math expression that expects a single time series. A
  /// Metrics Insights query with a <b>GROUP BY</b> clause returns an array of
  /// time-series (TS[]), and can be used as input for a metric math expression
  /// that expects an array of time series.
  ///
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [endTime] :
  /// The time stamp indicating the latest data to be returned.
  ///
  /// The value specified is exclusive; results include data points up to the
  /// specified time stamp.
  ///
  /// For better performance, specify <code>StartTime</code> and
  /// <code>EndTime</code> values that align with the value of the metric's
  /// <code>Period</code> and sync up with the beginning and end of an hour. For
  /// example, if the <code>Period</code> of a metric is 5 minutes, specifying
  /// 12:05 or 12:30 as <code>EndTime</code> can get a faster response from
  /// CloudWatch than setting 12:07 or 12:29 as the <code>EndTime</code>.
  ///
  /// Parameter [metricDataQueries] :
  /// The metric queries to be returned. A single <code>GetMetricData</code>
  /// call can include as many as 500 <code>MetricDataQuery</code> structures.
  /// Each of these structures can specify either a metric to retrieve, a
  /// Metrics Insights query, or a math expression to perform on retrieved data.
  ///
  /// Parameter [startTime] :
  /// The time stamp indicating the earliest data to be returned.
  ///
  /// The value specified is inclusive; results include data points with the
  /// specified time stamp.
  ///
  /// CloudWatch rounds the specified time stamp as follows:
  ///
  /// <ul>
  /// <li>
  /// Start time less than 15 days ago - Round down to the nearest whole minute.
  /// For example, 12:32:34 is rounded down to 12:32:00.
  /// </li>
  /// <li>
  /// Start time between 15 and 63 days ago - Round down to the nearest 5-minute
  /// clock interval. For example, 12:32:34 is rounded down to 12:30:00.
  /// </li>
  /// <li>
  /// Start time greater than 63 days ago - Round down to the nearest 1-hour
  /// clock interval. For example, 12:32:34 is rounded down to 12:00:00.
  /// </li>
  /// </ul>
  /// If you set <code>Period</code> to 5, 10, or 30, the start time of your
  /// request is rounded down to the nearest time that corresponds to even 5-,
  /// 10-, or 30-second divisions of a minute. For example, if you make a query
  /// at (HH:mm:ss) 01:05:23 for the previous 10-second period, the start time
  /// of your request is rounded down and you receive data from 01:05:10 to
  /// 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of
  /// data, using a period of 5 seconds, you receive data timestamped between
  /// 15:02:15 and 15:07:15.
  ///
  /// For better performance, specify <code>StartTime</code> and
  /// <code>EndTime</code> values that align with the value of the metric's
  /// <code>Period</code> and sync up with the beginning and end of an hour. For
  /// example, if the <code>Period</code> of a metric is 5 minutes, specifying
  /// 12:05 or 12:30 as <code>StartTime</code> can get a faster response from
  /// CloudWatch than setting 12:07 or 12:29 as the <code>StartTime</code>.
  ///
  /// Parameter [labelOptions] :
  /// This structure includes the <code>Timezone</code> parameter, which you can
  /// use to specify your time zone so that the labels of returned data display
  /// the correct time for your time zone.
  ///
  /// Parameter [maxDatapoints] :
  /// The maximum number of data points the request should return before
  /// paginating. If you omit this, the default of 100,800 is used.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous
  /// <code>GetMetricData</code> operation, to get the next set of data points.
  ///
  /// Parameter [scanBy] :
  /// The order in which data points should be returned.
  /// <code>TimestampDescending</code> returns the newest data first and
  /// paginates when the <code>MaxDatapoints</code> limit is reached.
  /// <code>TimestampAscending</code> returns the oldest data first and
  /// paginates when the <code>MaxDatapoints</code> limit is reached.
  ///
  /// If you omit this parameter, the default of
  /// <code>TimestampDescending</code> is used.
  Future<GetMetricDataOutput> getMetricData({
    required DateTime endTime,
    required List<MetricDataQuery> metricDataQueries,
    required DateTime startTime,
    LabelOptions? labelOptions,
    int? maxDatapoints,
    String? nextToken,
    ScanBy? scanBy,
  }) async {
    final $request = <String, dynamic>{};
    $request['EndTime'] = _s.iso8601ToJson(endTime);
    $request['MetricDataQueries'] = metricDataQueries;
    $request['StartTime'] = _s.iso8601ToJson(startTime);
    labelOptions?.also((arg) => $request['LabelOptions'] = arg);
    maxDatapoints?.also((arg) => $request['MaxDatapoints'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    scanBy?.also((arg) => $request['ScanBy'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'GetMetricData',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetMetricDataInput'],
      shapes: shapes,
      resultWrapper: 'GetMetricDataResult',
    );
    return GetMetricDataOutput.fromXml($result);
  }

  /// Gets statistics for the specified metric.
  ///
  /// The maximum number of data points returned from a single call is 1,440. If
  /// you request more than 1,440 data points, CloudWatch returns an error. To
  /// reduce the number of data points, you can narrow the specified time range
  /// and make multiple requests across adjacent time ranges, or you can
  /// increase the specified period. Data points are not returned in
  /// chronological order.
  ///
  /// CloudWatch aggregates data points based on the length of the period that
  /// you specify. For example, if you request statistics with a one-hour
  /// period, CloudWatch aggregates all data points with time stamps that fall
  /// within each one-hour period. Therefore, the number of values aggregated by
  /// CloudWatch is larger than the number of data points returned.
  ///
  /// CloudWatch needs raw data points to calculate percentile statistics. If
  /// you publish data using a statistic set instead, you can only retrieve
  /// percentile statistics for this data if one of the following conditions is
  /// true:
  ///
  /// <ul>
  /// <li>
  /// The SampleCount value of the statistic set is 1.
  /// </li>
  /// <li>
  /// The Min and the Max values of the statistic set are equal.
  /// </li>
  /// </ul>
  /// Percentile statistics are not available for metrics when any of the metric
  /// values are negative numbers.
  ///
  /// Amazon CloudWatch retains metric data as follows:
  ///
  /// <ul>
  /// <li>
  /// Data points with a period of less than 60 seconds are available for 3
  /// hours. These data points are high-resolution metrics and are available
  /// only for custom metrics that have been defined with a
  /// <code>StorageResolution</code> of 1.
  /// </li>
  /// <li>
  /// Data points with a period of 60 seconds (1-minute) are available for 15
  /// days.
  /// </li>
  /// <li>
  /// Data points with a period of 300 seconds (5-minute) are available for 63
  /// days.
  /// </li>
  /// <li>
  /// Data points with a period of 3600 seconds (1 hour) are available for 455
  /// days (15 months).
  /// </li>
  /// </ul>
  /// Data points that are initially published with a shorter period are
  /// aggregated together for long-term storage. For example, if you collect
  /// data using a period of 1 minute, the data remains available for 15 days
  /// with 1-minute resolution. After 15 days, this data is still available, but
  /// is aggregated and retrievable only with a resolution of 5 minutes. After
  /// 63 days, the data is further aggregated and is available with a resolution
  /// of 1 hour.
  ///
  /// CloudWatch started retaining 5-minute and 1-hour metric data as of July 9,
  /// 2016.
  ///
  /// For information about metrics and dimensions supported by Amazon Web
  /// Services services, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html">Amazon
  /// CloudWatch Metrics and Dimensions Reference</a> in the <i>Amazon
  /// CloudWatch User Guide</i>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [endTime] :
  /// The time stamp that determines the last data point to return.
  ///
  /// The value specified is exclusive; results include data points up to the
  /// specified time stamp. In a raw HTTP query, the time stamp must be in ISO
  /// 8601 UTC format (for example, 2016-10-10T23:00:00Z).
  ///
  /// Parameter [metricName] :
  /// The name of the metric, with or without spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the metric, with or without spaces.
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the returned data points. For metrics with
  /// regular resolution, a period can be as short as one minute (60 seconds)
  /// and must be a multiple of 60. For high-resolution metrics that are
  /// collected at intervals of less than one minute, the period can be 1, 5,
  /// 10, 30, 60, or any multiple of 60. High-resolution metrics are those
  /// metrics stored by a <code>PutMetricData</code> call that includes a
  /// <code>StorageResolution</code> of 1 second.
  ///
  /// If the <code>StartTime</code> parameter specifies a time stamp that is
  /// greater than 3 hours ago, you must specify the period as follows or no
  /// data points in that time range is returned:
  ///
  /// <ul>
  /// <li>
  /// Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds
  /// (1 minute).
  /// </li>
  /// <li>
  /// Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5
  /// minutes).
  /// </li>
  /// <li>
  /// Start time greater than 63 days ago - Use a multiple of 3600 seconds (1
  /// hour).
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The time stamp that determines the first data point to return. Start times
  /// are evaluated relative to the time that CloudWatch receives the request.
  ///
  /// The value specified is inclusive; results include data points with the
  /// specified time stamp. In a raw HTTP query, the time stamp must be in ISO
  /// 8601 UTC format (for example, 2016-10-03T23:00:00Z).
  ///
  /// CloudWatch rounds the specified time stamp as follows:
  ///
  /// <ul>
  /// <li>
  /// Start time less than 15 days ago - Round down to the nearest whole minute.
  /// For example, 12:32:34 is rounded down to 12:32:00.
  /// </li>
  /// <li>
  /// Start time between 15 and 63 days ago - Round down to the nearest 5-minute
  /// clock interval. For example, 12:32:34 is rounded down to 12:30:00.
  /// </li>
  /// <li>
  /// Start time greater than 63 days ago - Round down to the nearest 1-hour
  /// clock interval. For example, 12:32:34 is rounded down to 12:00:00.
  /// </li>
  /// </ul>
  /// If you set <code>Period</code> to 5, 10, or 30, the start time of your
  /// request is rounded down to the nearest time that corresponds to even 5-,
  /// 10-, or 30-second divisions of a minute. For example, if you make a query
  /// at (HH:mm:ss) 01:05:23 for the previous 10-second period, the start time
  /// of your request is rounded down and you receive data from 01:05:10 to
  /// 01:05:20. If you make a query at 15:07:17 for the previous 5 minutes of
  /// data, using a period of 5 seconds, you receive data timestamped between
  /// 15:02:15 and 15:07:15.
  ///
  /// Parameter [dimensions] :
  /// The dimensions. If the metric contains multiple dimensions, you must
  /// include a value for each dimension. CloudWatch treats each unique
  /// combination of dimensions as a separate metric. If a specific combination
  /// of dimensions was not published, you can't retrieve statistics for it. You
  /// must specify the same dimensions that were used when the metrics were
  /// created. For an example, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#dimension-combinations">Dimension
  /// Combinations</a> in the <i>Amazon CloudWatch User Guide</i>. For more
  /// information about specifying dimensions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publishing
  /// Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// Parameter [extendedStatistics] :
  /// The percentile statistics. Specify values between p0.0 and p100. When
  /// calling <code>GetMetricStatistics</code>, you must specify either
  /// <code>Statistics</code> or <code>ExtendedStatistics</code>, but not both.
  /// Percentile statistics are not available for metrics when any of the metric
  /// values are negative numbers.
  ///
  /// Parameter [statistics] :
  /// The metric statistics, other than percentile. For percentile statistics,
  /// use <code>ExtendedStatistics</code>. When calling
  /// <code>GetMetricStatistics</code>, you must specify either
  /// <code>Statistics</code> or <code>ExtendedStatistics</code>, but not both.
  ///
  /// Parameter [unit] :
  /// The unit for a given metric. If you omit <code>Unit</code>, all data that
  /// was collected with any unit is returned, along with the corresponding
  /// units that were specified when the data was reported to CloudWatch. If you
  /// specify a unit, the operation returns only data that was collected with
  /// that unit specified. If you specify a unit that does not match the data
  /// collected, the results of the operation are null. CloudWatch does not
  /// perform unit conversions.
  Future<GetMetricStatisticsOutput> getMetricStatistics({
    required DateTime endTime,
    required String metricName,
    required String namespace,
    required int period,
    required DateTime startTime,
    List<Dimension>? dimensions,
    List<String>? extendedStatistics,
    List<Statistic>? statistics,
    StandardUnit? unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['EndTime'] = _s.iso8601ToJson(endTime);
    $request['MetricName'] = metricName;
    $request['Namespace'] = namespace;
    $request['Period'] = period;
    $request['StartTime'] = _s.iso8601ToJson(startTime);
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    extendedStatistics?.also((arg) => $request['ExtendedStatistics'] = arg);
    statistics?.also(
        (arg) => $request['Statistics'] = arg.map((e) => e.toValue()).toList());
    unit?.also((arg) => $request['Unit'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'GetMetricStatistics',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetMetricStatisticsInput'],
      shapes: shapes,
      resultWrapper: 'GetMetricStatisticsResult',
    );
    return GetMetricStatisticsOutput.fromXml($result);
  }

  /// Returns information about the metric stream that you specify.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [name] :
  /// The name of the metric stream to retrieve information about.
  Future<GetMetricStreamOutput> getMetricStream({
    required String name,
  }) async {
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    final $result = await _protocol.send(
      $request,
      action: 'GetMetricStream',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetMetricStreamInput'],
      shapes: shapes,
      resultWrapper: 'GetMetricStreamResult',
    );
    return GetMetricStreamOutput.fromXml($result);
  }

  /// You can use the <code>GetMetricWidgetImage</code> API to retrieve a
  /// snapshot graph of one or more Amazon CloudWatch metrics as a bitmap image.
  /// You can then embed this image into your services and products, such as
  /// wiki pages, reports, and documents. You could also retrieve images
  /// regularly, such as every minute, and create your own custom live
  /// dashboard.
  ///
  /// The graph you retrieve can include all CloudWatch metric graph features,
  /// including metric math and horizontal and vertical annotations.
  ///
  /// There is a limit of 20 transactions per second for this API. Each
  /// <code>GetMetricWidgetImage</code> action has the following limits:
  ///
  /// <ul>
  /// <li>
  /// As many as 100 metrics in the graph.
  /// </li>
  /// <li>
  /// Up to 100 KB uncompressed payload.
  /// </li>
  /// </ul>
  ///
  /// Parameter [metricWidget] :
  /// A JSON string that defines the bitmap graph to be retrieved. The string
  /// includes the metrics to include in the graph, statistics, annotations,
  /// title, axis limits, and so on. You can include only one
  /// <code>MetricWidget</code> parameter in each
  /// <code>GetMetricWidgetImage</code> call.
  ///
  /// For more information about the syntax of <code>MetricWidget</code> see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CloudWatch-Metric-Widget-Structure.html">GetMetricWidgetImage:
  /// Metric Widget Structure and Syntax</a>.
  ///
  /// If any metric on the graph could not load all the requested data points,
  /// an orange triangle with an exclamation point appears next to the graph
  /// legend.
  ///
  /// Parameter [outputFormat] :
  /// The format of the resulting image. Only PNG images are supported.
  ///
  /// The default is <code>png</code>. If you specify <code>png</code>, the API
  /// returns an HTTP response with the content-type set to
  /// <code>text/xml</code>. The image data is in a
  /// <code>MetricWidgetImage</code> field. For example:
  ///
  /// <code> &lt;GetMetricWidgetImageResponse xmlns=&lt;URLstring&gt;&gt;</code>
  ///
  /// <code> &lt;GetMetricWidgetImageResult&gt;</code>
  ///
  /// <code> &lt;MetricWidgetImage&gt;</code>
  ///
  /// <code> iVBORw0KGgoAAAANSUhEUgAAAlgAAAGQEAYAAAAip...</code>
  ///
  /// <code> &lt;/MetricWidgetImage&gt;</code>
  ///
  /// <code> &lt;/GetMetricWidgetImageResult&gt;</code>
  ///
  /// <code> &lt;ResponseMetadata&gt;</code>
  ///
  /// <code>
  /// &lt;RequestId&gt;6f0d4192-4d42-11e8-82c1-f539a07e0e3b&lt;/RequestId&gt;</code>
  ///
  /// <code> &lt;/ResponseMetadata&gt;</code>
  ///
  /// <code>&lt;/GetMetricWidgetImageResponse&gt;</code>
  ///
  /// The <code>image/png</code> setting is intended only for custom HTTP
  /// requests. For most use cases, and all actions using an Amazon Web Services
  /// SDK, you should use <code>png</code>. If you specify
  /// <code>image/png</code>, the HTTP response has a content-type set to
  /// <code>image/png</code>, and the body of the response is a PNG image.
  Future<GetMetricWidgetImageOutput> getMetricWidgetImage({
    required String metricWidget,
    String? outputFormat,
  }) async {
    final $request = <String, dynamic>{};
    $request['MetricWidget'] = metricWidget;
    outputFormat?.also((arg) => $request['OutputFormat'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetMetricWidgetImage',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetMetricWidgetImageInput'],
      shapes: shapes,
      resultWrapper: 'GetMetricWidgetImageResult',
    );
    return GetMetricWidgetImageOutput.fromXml($result);
  }

  /// Returns a list of the dashboards for your account. If you include
  /// <code>DashboardNamePrefix</code>, only those dashboards with names
  /// starting with the prefix are listed. Otherwise, all dashboards in your
  /// account are listed.
  ///
  /// <code>ListDashboards</code> returns up to 1000 results on one page. If
  /// there are more than 1000 dashboards, you can call
  /// <code>ListDashboards</code> again and include the value you received for
  /// <code>NextToken</code> in the first call, to receive the next 1000
  /// results.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [dashboardNamePrefix] :
  /// If you specify this parameter, only the dashboards with names starting
  /// with the specified string are listed. The maximum length is 255, and valid
  /// characters are A-Z, a-z, 0-9, ".", "-", and "_".
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to indicate that there is more data
  /// available.
  Future<ListDashboardsOutput> listDashboards({
    String? dashboardNamePrefix,
    String? nextToken,
  }) async {
    final $request = <String, dynamic>{};
    dashboardNamePrefix?.also((arg) => $request['DashboardNamePrefix'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListDashboards',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListDashboardsInput'],
      shapes: shapes,
      resultWrapper: 'ListDashboardsResult',
    );
    return ListDashboardsOutput.fromXml($result);
  }

  /// Returns a list that contains the number of managed Contributor Insights
  /// rules in your account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidNextToken].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of an Amazon Web Services resource that has managed Contributor
  /// Insights rules.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. If you omit this
  /// parameter, the default number is used. The default number is
  /// <code>100</code>.
  ///
  /// Parameter [nextToken] :
  /// Include this value to get the next set of rules if the value was returned
  /// by the previous operation.
  Future<ListManagedInsightRulesOutput> listManagedInsightRules({
    required String resourceARN,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $request = <String, dynamic>{};
    $request['ResourceARN'] = resourceARN;
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListManagedInsightRules',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListManagedInsightRulesInput'],
      shapes: shapes,
      resultWrapper: 'ListManagedInsightRulesResult',
    );
    return ListManagedInsightRulesOutput.fromXml($result);
  }

  /// Returns a list of metric streams in this account.
  ///
  /// May throw [InvalidNextToken].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation.
  ///
  /// Parameter [nextToken] :
  /// Include this value, if it was returned by the previous call, to get the
  /// next set of metric streams.
  Future<ListMetricStreamsOutput> listMetricStreams({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $request = <String, dynamic>{};
    maxResults?.also((arg) => $request['MaxResults'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListMetricStreams',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListMetricStreamsInput'],
      shapes: shapes,
      resultWrapper: 'ListMetricStreamsResult',
    );
    return ListMetricStreamsOutput.fromXml($result);
  }

  /// List the specified metrics. You can use the returned metrics with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html">GetMetricData</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html">GetMetricStatistics</a>
  /// to get statistical data.
  ///
  /// Up to 500 results are returned for any one call. To retrieve additional
  /// results, use the returned token with subsequent calls.
  ///
  /// After you create a metric, allow up to 15 minutes for the metric to
  /// appear. To see metric statistics sooner, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html">GetMetricData</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html">GetMetricStatistics</a>.
  ///
  /// If you are using CloudWatch cross-account observability, you can use this
  /// operation in a monitoring account and view metrics from the linked source
  /// accounts. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// <code>ListMetrics</code> doesn't return information about metrics if those
  /// metrics haven't reported data in the past two weeks. To retrieve those
  /// metrics, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html">GetMetricData</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html">GetMetricStatistics</a>.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [dimensions] :
  /// The dimensions to filter against. Only the dimensions that match exactly
  /// will be returned.
  ///
  /// Parameter [includeLinkedAccounts] :
  /// If you are using this operation in a monitoring account, specify
  /// <code>true</code> to include metrics from source accounts in the returned
  /// data.
  ///
  /// The default is <code>false</code>.
  ///
  /// Parameter [metricName] :
  /// The name of the metric to filter against. Only the metrics with names that
  /// match exactly will be returned.
  ///
  /// Parameter [namespace] :
  /// The metric namespace to filter against. Only the namespace that matches
  /// exactly will be returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned by a previous call to indicate that there is more data
  /// available.
  ///
  /// Parameter [owningAccount] :
  /// When you use this operation in a monitoring account, use this field to
  /// return metrics only from one source account. To do so, specify that source
  /// account ID in this field, and also specify <code>true</code> for
  /// <code>IncludeLinkedAccounts</code>.
  ///
  /// Parameter [recentlyActive] :
  /// To filter the results to show only metrics that have had data points
  /// published in the past three hours, specify this parameter with a value of
  /// <code>PT3H</code>. This is the only valid value for this parameter.
  ///
  /// The results that are returned are an approximation of the value you
  /// specify. There is a low probability that the returned results include
  /// metrics with last published data as much as 40 minutes more than the
  /// specified time interval.
  Future<ListMetricsOutput> listMetrics({
    List<DimensionFilter>? dimensions,
    bool? includeLinkedAccounts,
    String? metricName,
    String? namespace,
    String? nextToken,
    String? owningAccount,
    RecentlyActive? recentlyActive,
  }) async {
    final $request = <String, dynamic>{};
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    includeLinkedAccounts
        ?.also((arg) => $request['IncludeLinkedAccounts'] = arg);
    metricName?.also((arg) => $request['MetricName'] = arg);
    namespace?.also((arg) => $request['Namespace'] = arg);
    nextToken?.also((arg) => $request['NextToken'] = arg);
    owningAccount?.also((arg) => $request['OwningAccount'] = arg);
    recentlyActive?.also((arg) => $request['RecentlyActive'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ListMetrics',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListMetricsInput'],
      shapes: shapes,
      resultWrapper: 'ListMetricsResult',
    );
    return ListMetricsOutput.fromXml($result);
  }

  /// Displays the tags associated with a CloudWatch resource. Currently, alarms
  /// and Contributor Insights rules support tagging.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the CloudWatch resource that you want to view tags for.
  ///
  /// The ARN format of an alarm is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:alarm:<i>alarm-name</i>
  /// </code>
  ///
  /// The ARN format of a Contributor Insights rule is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:insight-rule/<i>insight-rule-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies">
  /// Resource Types Defined by Amazon CloudWatch</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceARN,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceARN'] = resourceARN;
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceInput'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return ListTagsForResourceOutput.fromXml($result);
  }

  /// Creates an anomaly detection model for a CloudWatch metric. You can use
  /// the model to display a band of expected normal values when the metric is
  /// graphed.
  ///
  /// If you have enabled unified cross-account observability, and this account
  /// is a monitoring account, the metric can be in the same account or a source
  /// account. You can specify the account ID in the object you specify in the
  /// <code>SingleMetricAnomalyDetector</code> parameter.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detection.html">CloudWatch
  /// Anomaly Detection</a>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [configuration] :
  /// The configuration specifies details about how the anomaly detection model
  /// is to be trained, including time ranges to exclude when training and
  /// updating the model. You can specify as many as 10 time ranges.
  ///
  /// The configuration can also include the time zone to use for the metric.
  ///
  /// Parameter [dimensions] :
  /// The metric dimensions to create the anomaly detection model for.
  ///
  /// Parameter [metricCharacteristics] :
  /// Use this object to include parameters to provide information about your
  /// metric to CloudWatch to help it build more accurate anomaly detection
  /// models. Currently, it includes the <code>PeriodicSpikes</code> parameter.
  ///
  /// Parameter [metricMathAnomalyDetector] :
  /// The metric math anomaly detector to be created.
  ///
  /// When using <code>MetricMathAnomalyDetector</code>, you cannot include the
  /// following parameters in the same operation:
  ///
  /// <ul>
  /// <li>
  /// <code>Dimensions</code>
  /// </li>
  /// <li>
  /// <code>MetricName</code>
  /// </li>
  /// <li>
  /// <code>Namespace</code>
  /// </li>
  /// <li>
  /// <code>Stat</code>
  /// </li>
  /// <li>
  /// the <code>SingleMetricAnomalyDetector</code> parameters of
  /// <code>PutAnomalyDetectorInput</code>
  /// </li>
  /// </ul>
  /// Instead, specify the metric math anomaly detector attributes as part of
  /// the property <code>MetricMathAnomalyDetector</code>.
  ///
  /// Parameter [metricName] :
  /// The name of the metric to create the anomaly detection model for.
  ///
  /// Parameter [namespace] :
  /// The namespace of the metric to create the anomaly detection model for.
  ///
  /// Parameter [singleMetricAnomalyDetector] :
  /// A single metric anomaly detector to be created.
  ///
  /// When using <code>SingleMetricAnomalyDetector</code>, you cannot include
  /// the following parameters in the same operation:
  ///
  /// <ul>
  /// <li>
  /// <code>Dimensions</code>
  /// </li>
  /// <li>
  /// <code>MetricName</code>
  /// </li>
  /// <li>
  /// <code>Namespace</code>
  /// </li>
  /// <li>
  /// <code>Stat</code>
  /// </li>
  /// <li>
  /// the <code>MetricMathAnomalyDetector</code> parameters of
  /// <code>PutAnomalyDetectorInput</code>
  /// </li>
  /// </ul>
  /// Instead, specify the single metric anomaly detector attributes as part of
  /// the property <code>SingleMetricAnomalyDetector</code>.
  ///
  /// Parameter [stat] :
  /// The statistic to use for the metric and the anomaly detection model.
  Future<void> putAnomalyDetector({
    AnomalyDetectorConfiguration? configuration,
    List<Dimension>? dimensions,
    MetricCharacteristics? metricCharacteristics,
    MetricMathAnomalyDetector? metricMathAnomalyDetector,
    String? metricName,
    String? namespace,
    SingleMetricAnomalyDetector? singleMetricAnomalyDetector,
    String? stat,
  }) async {
    final $request = <String, dynamic>{};
    configuration?.also((arg) => $request['Configuration'] = arg);
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    metricCharacteristics
        ?.also((arg) => $request['MetricCharacteristics'] = arg);
    metricMathAnomalyDetector
        ?.also((arg) => $request['MetricMathAnomalyDetector'] = arg);
    metricName?.also((arg) => $request['MetricName'] = arg);
    namespace?.also((arg) => $request['Namespace'] = arg);
    singleMetricAnomalyDetector
        ?.also((arg) => $request['SingleMetricAnomalyDetector'] = arg);
    stat?.also((arg) => $request['Stat'] = arg);
    await _protocol.send(
      $request,
      action: 'PutAnomalyDetector',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutAnomalyDetectorInput'],
      shapes: shapes,
      resultWrapper: 'PutAnomalyDetectorResult',
    );
  }

  /// Creates or updates a <i>composite alarm</i>. When you create a composite
  /// alarm, you specify a rule expression for the alarm that takes into account
  /// the alarm states of other alarms that you have created. The composite
  /// alarm goes into ALARM state only if all conditions of the rule are met.
  ///
  /// The alarms specified in a composite alarm's rule expression can include
  /// metric alarms and other composite alarms. The rule expression of a
  /// composite alarm can include as many as 100 underlying alarms. Any single
  /// alarm can be included in the rule expressions of as many as 150 composite
  /// alarms.
  ///
  /// Using composite alarms can reduce alarm noise. You can create multiple
  /// metric alarms, and also create a composite alarm and set up alerts only
  /// for the composite alarm. For example, you could create a composite alarm
  /// that goes into ALARM state only when more than one of the underlying
  /// metric alarms are in ALARM state.
  ///
  /// Composite alarms can take the following actions:
  ///
  /// <ul>
  /// <li>
  /// Notify Amazon SNS topics.
  /// </li>
  /// <li>
  /// Invoke Lambda functions.
  /// </li>
  /// <li>
  /// Create OpsItems in Systems Manager Ops Center.
  /// </li>
  /// <li>
  /// Create incidents in Systems Manager Incident Manager.
  /// </li>
  /// </ul> <note>
  /// It is possible to create a loop or cycle of composite alarms, where
  /// composite alarm A depends on composite alarm B, and composite alarm B also
  /// depends on composite alarm A. In this scenario, you can't delete any
  /// composite alarm that is part of the cycle because there is always still a
  /// composite alarm that depends on that alarm that you want to delete.
  ///
  /// To get out of such a situation, you must break the cycle by changing the
  /// rule of one of the composite alarms in the cycle to remove a dependency
  /// that creates the cycle. The simplest change to make to break a cycle is to
  /// change the <code>AlarmRule</code> of one of the alarms to
  /// <code>false</code>.
  ///
  /// Additionally, the evaluation of composite alarms stops if CloudWatch
  /// detects a cycle in the evaluation path.
  /// </note>
  /// When this operation creates an alarm, the alarm state is immediately set
  /// to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its
  /// state is set appropriately. Any actions associated with the new state are
  /// then executed. For a composite alarm, this initial time after creation is
  /// the only time that the alarm can be in <code>INSUFFICIENT_DATA</code>
  /// state.
  ///
  /// When you update an existing alarm, its state is left unchanged, but the
  /// update completely overwrites the previous configuration of the alarm.
  ///
  /// To use this operation, you must be signed on with the
  /// <code>cloudwatch:PutCompositeAlarm</code> permission that is scoped to
  /// <code>*</code>. You can't create a composite alarms if your
  /// <code>cloudwatch:PutCompositeAlarm</code> permission has a narrower scope.
  ///
  /// If you are an IAM user, you must have
  /// <code>iam:CreateServiceLinkedRole</code> to create a composite alarm that
  /// has Systems Manager OpsItem actions.
  ///
  /// May throw [LimitExceededFault].
  ///
  /// Parameter [alarmName] :
  /// The name for the composite alarm. This name must be unique within the
  /// Region.
  ///
  /// Parameter [alarmRule] :
  /// An expression that specifies which other alarms are to be evaluated to
  /// determine this composite alarm's state. For each alarm that you reference,
  /// you designate a function that specifies whether that alarm needs to be in
  /// ALARM state, OK state, or INSUFFICIENT_DATA state. You can use operators
  /// (AND, OR and NOT) to combine multiple functions in a single expression.
  /// You can use parenthesis to logically group the functions in your
  /// expression.
  ///
  /// You can use either alarm names or ARNs to reference the other alarms that
  /// are to be evaluated.
  ///
  /// Functions can include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ALARM("<i>alarm-name</i> or <i>alarm-ARN</i>")</code> is TRUE if the
  /// named alarm is in ALARM state.
  /// </li>
  /// <li>
  /// <code>OK("<i>alarm-name</i> or <i>alarm-ARN</i>")</code> is TRUE if the
  /// named alarm is in OK state.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_DATA("<i>alarm-name</i> or <i>alarm-ARN</i>")</code> is
  /// TRUE if the named alarm is in INSUFFICIENT_DATA state.
  /// </li>
  /// <li>
  /// <code>TRUE</code> always evaluates to TRUE.
  /// </li>
  /// <li>
  /// <code>FALSE</code> always evaluates to FALSE.
  /// </li>
  /// </ul>
  /// TRUE and FALSE are useful for testing a complex <code>AlarmRule</code>
  /// structure, and for testing your alarm actions.
  ///
  /// Alarm names specified in <code>AlarmRule</code> can be surrounded with
  /// double-quotes ("), but do not have to be.
  ///
  /// The following are some examples of <code>AlarmRule</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>ALARM(CPUUtilizationTooHigh) AND ALARM(DiskReadOpsTooHigh)</code>
  /// specifies that the composite alarm goes into ALARM state only if both
  /// CPUUtilizationTooHigh and DiskReadOpsTooHigh alarms are in ALARM state.
  /// </li>
  /// <li>
  /// <code>ALARM(CPUUtilizationTooHigh) AND NOT
  /// ALARM(DeploymentInProgress)</code> specifies that the alarm goes to ALARM
  /// state if CPUUtilizationTooHigh is in ALARM state and DeploymentInProgress
  /// is not in ALARM state. This example reduces alarm noise during a known
  /// deployment window.
  /// </li>
  /// <li>
  /// <code>(ALARM(CPUUtilizationTooHigh) OR ALARM(DiskReadOpsTooHigh)) AND
  /// OK(NetworkOutTooHigh)</code> goes into ALARM state if
  /// CPUUtilizationTooHigh OR DiskReadOpsTooHigh is in ALARM state, and if
  /// NetworkOutTooHigh is in OK state. This provides another example of using a
  /// composite alarm to prevent noise. This rule ensures that you are not
  /// notified with an alarm action on high CPU or disk usage if a known network
  /// problem is also occurring.
  /// </li>
  /// </ul>
  /// The <code>AlarmRule</code> can specify as many as 100 "children" alarms.
  /// The <code>AlarmRule</code> expression can have as many as 500 elements.
  /// Elements are child alarms, TRUE or FALSE statements, and parentheses.
  ///
  /// Parameter [actionsEnabled] :
  /// Indicates whether actions should be executed during any changes to the
  /// alarm state of the composite alarm. The default is <code>TRUE</code>.
  ///
  /// Parameter [actionsSuppressor] :
  /// Actions will be suppressed if the suppressor alarm is in the
  /// <code>ALARM</code> state. <code>ActionsSuppressor</code> can be an
  /// AlarmName or an Amazon Resource Name (ARN) from an existing alarm.
  ///
  /// Parameter [actionsSuppressorExtensionPeriod] :
  /// The maximum time in seconds that the composite alarm waits after
  /// suppressor alarm goes out of the <code>ALARM</code> state. After this
  /// time, the composite alarm performs its actions.
  /// <important>
  /// <code>ExtensionPeriod</code> is required only when
  /// <code>ActionsSuppressor</code> is specified.
  /// </important>
  ///
  /// Parameter [actionsSuppressorWaitPeriod] :
  /// The maximum time in seconds that the composite alarm waits for the
  /// suppressor alarm to go into the <code>ALARM</code> state. After this time,
  /// the composite alarm performs its actions.
  /// <important>
  /// <code>WaitPeriod</code> is required only when
  /// <code>ActionsSuppressor</code> is specified.
  /// </important>
  ///
  /// Parameter [alarmActions] :
  /// The actions to execute when this alarm transitions to the
  /// <code>ALARM</code> state from any other state. Each action is specified as
  /// an Amazon Resource Name (ARN).
  ///
  /// Valid Values: ]
  ///
  /// <b>Amazon SNS actions:</b>
  ///
  /// <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i>
  /// </code>
  ///
  /// <b>Lambda actions:</b>
  ///
  /// <ul>
  /// <li>
  /// Invoke the latest version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a specific version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>version-number</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a function by using an alias Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>alias-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>Systems Manager actions:</b>
  ///
  /// <code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:opsitem:<i>severity</i>
  /// </code>
  ///
  /// Parameter [alarmDescription] :
  /// The description for the composite alarm.
  ///
  /// Parameter [insufficientDataActions] :
  /// The actions to execute when this alarm transitions to the
  /// <code>INSUFFICIENT_DATA</code> state from any other state. Each action is
  /// specified as an Amazon Resource Name (ARN).
  ///
  /// Valid Values: ]
  ///
  /// <b>Amazon SNS actions:</b>
  ///
  /// <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i>
  /// </code>
  ///
  /// <b>Lambda actions:</b>
  ///
  /// <ul>
  /// <li>
  /// Invoke the latest version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a specific version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>version-number</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a function by using an alias Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>alias-name</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [oKActions] :
  /// The actions to execute when this alarm transitions to an <code>OK</code>
  /// state from any other state. Each action is specified as an Amazon Resource
  /// Name (ARN).
  ///
  /// Valid Values: ]
  ///
  /// <b>Amazon SNS actions:</b>
  ///
  /// <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i>
  /// </code>
  ///
  /// <b>Lambda actions:</b>
  ///
  /// <ul>
  /// <li>
  /// Invoke the latest version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a specific version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>version-number</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a function by using an alias Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>alias-name</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the alarm. You can associate
  /// as many as 50 tags with an alarm. To be able to associate tags with the
  /// alarm when you create the alarm, you must have the
  /// <code>cloudwatch:TagResource</code> permission.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// If you are using this operation to update an existing alarm, any tags you
  /// specify in this parameter are ignored. To change the tags of an existing
  /// alarm, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html">TagResource</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  Future<void> putCompositeAlarm({
    required String alarmName,
    required String alarmRule,
    bool? actionsEnabled,
    String? actionsSuppressor,
    int? actionsSuppressorExtensionPeriod,
    int? actionsSuppressorWaitPeriod,
    List<String>? alarmActions,
    String? alarmDescription,
    List<String>? insufficientDataActions,
    List<String>? oKActions,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['AlarmName'] = alarmName;
    $request['AlarmRule'] = alarmRule;
    actionsEnabled?.also((arg) => $request['ActionsEnabled'] = arg);
    actionsSuppressor?.also((arg) => $request['ActionsSuppressor'] = arg);
    actionsSuppressorExtensionPeriod
        ?.also((arg) => $request['ActionsSuppressorExtensionPeriod'] = arg);
    actionsSuppressorWaitPeriod
        ?.also((arg) => $request['ActionsSuppressorWaitPeriod'] = arg);
    alarmActions?.also((arg) => $request['AlarmActions'] = arg);
    alarmDescription?.also((arg) => $request['AlarmDescription'] = arg);
    insufficientDataActions
        ?.also((arg) => $request['InsufficientDataActions'] = arg);
    oKActions?.also((arg) => $request['OKActions'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    await _protocol.send(
      $request,
      action: 'PutCompositeAlarm',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutCompositeAlarmInput'],
      shapes: shapes,
    );
  }

  /// Creates a dashboard if it does not already exist, or updates an existing
  /// dashboard. If you update a dashboard, the entire contents are replaced
  /// with what you specify here.
  ///
  /// All dashboards in your account are global, not region-specific.
  ///
  /// A simple way to create a dashboard using <code>PutDashboard</code> is to
  /// copy an existing dashboard. To copy an existing dashboard using the
  /// console, you can load the dashboard and then use the View/edit source
  /// command in the Actions menu to display the JSON block for that dashboard.
  /// Another way to copy a dashboard is to use <code>GetDashboard</code>, and
  /// then use the data returned within <code>DashboardBody</code> as the
  /// template for the new dashboard when you call <code>PutDashboard</code>.
  ///
  /// When you create a dashboard with <code>PutDashboard</code>, a good
  /// practice is to add a text widget at the top of the dashboard with a
  /// message that the dashboard was created by script and should not be changed
  /// in the console. This message could also point console users to the
  /// location of the <code>DashboardBody</code> script or the CloudFormation
  /// template used to create the dashboard.
  ///
  /// May throw [DashboardInvalidInputError].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [dashboardBody] :
  /// The detailed information about the dashboard in JSON format, including the
  /// widgets to include and their location on the dashboard. This parameter is
  /// required.
  ///
  /// For more information about the syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CloudWatch-Dashboard-Body-Structure.html">Dashboard
  /// Body Structure and Syntax</a>.
  ///
  /// Parameter [dashboardName] :
  /// The name of the dashboard. If a dashboard with this name already exists,
  /// this call modifies that dashboard, replacing its current contents.
  /// Otherwise, a new dashboard is created. The maximum length is 255, and
  /// valid characters are A-Z, a-z, 0-9, "-", and "_". This parameter is
  /// required.
  Future<PutDashboardOutput> putDashboard({
    required String dashboardBody,
    required String dashboardName,
  }) async {
    final $request = <String, dynamic>{};
    $request['DashboardBody'] = dashboardBody;
    $request['DashboardName'] = dashboardName;
    final $result = await _protocol.send(
      $request,
      action: 'PutDashboard',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutDashboardInput'],
      shapes: shapes,
      resultWrapper: 'PutDashboardResult',
    );
    return PutDashboardOutput.fromXml($result);
  }

  /// Creates a Contributor Insights rule. Rules evaluate log events in a
  /// CloudWatch Logs log group, enabling you to find contributor data for the
  /// log events in that log group. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html">Using
  /// Contributor Insights to Analyze High-Cardinality Data</a>.
  ///
  /// If you create a rule, delete it, and then re-create it with the same name,
  /// historical data from the first time the rule was created might not be
  /// available.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [ruleDefinition] :
  /// The definition of the rule, as a JSON object. For details on the valid
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-RuleSyntax.html">Contributor
  /// Insights Rule Syntax</a>.
  ///
  /// Parameter [ruleName] :
  /// A unique name for the rule.
  ///
  /// Parameter [ruleState] :
  /// The state of the rule. Valid values are ENABLED and DISABLED.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the Contributor Insights rule.
  /// You can associate as many as 50 tags with a rule.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only the resources that have certain tag values.
  ///
  /// To be able to associate tags with a rule, you must have the
  /// <code>cloudwatch:TagResource</code> permission in addition to the
  /// <code>cloudwatch:PutInsightRule</code> permission.
  ///
  /// If you are using this operation to update an existing Contributor Insights
  /// rule, any tags you specify in this parameter are ignored. To change the
  /// tags of an existing rule, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html">TagResource</a>.
  Future<void> putInsightRule({
    required String ruleDefinition,
    required String ruleName,
    String? ruleState,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['RuleDefinition'] = ruleDefinition;
    $request['RuleName'] = ruleName;
    ruleState?.also((arg) => $request['RuleState'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    await _protocol.send(
      $request,
      action: 'PutInsightRule',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutInsightRuleInput'],
      shapes: shapes,
      resultWrapper: 'PutInsightRuleResult',
    );
  }

  /// Creates a managed Contributor Insights rule for a specified Amazon Web
  /// Services resource. When you enable a managed rule, you create a
  /// Contributor Insights rule that collects data from Amazon Web Services
  /// services. You cannot edit these rules with <code>PutInsightRule</code>.
  /// The rules can be enabled, disabled, and deleted using
  /// <code>EnableInsightRules</code>, <code>DisableInsightRules</code>, and
  /// <code>DeleteInsightRules</code>. If a previously created managed rule is
  /// currently disabled, a subsequent call to this API will re-enable it. Use
  /// <code>ListManagedInsightRules</code> to describe all available rules.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [managedRules] :
  /// A list of <code>ManagedRules</code> to enable.
  Future<PutManagedInsightRulesOutput> putManagedInsightRules({
    required List<ManagedRule> managedRules,
  }) async {
    final $request = <String, dynamic>{};
    $request['ManagedRules'] = managedRules;
    final $result = await _protocol.send(
      $request,
      action: 'PutManagedInsightRules',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutManagedInsightRulesInput'],
      shapes: shapes,
      resultWrapper: 'PutManagedInsightRulesResult',
    );
    return PutManagedInsightRulesOutput.fromXml($result);
  }

  /// Creates or updates an alarm and associates it with the specified metric,
  /// metric math expression, anomaly detection model, or Metrics Insights
  /// query. For more information about using a Metrics Insights query for an
  /// alarm, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Metrics_Insights_Alarm.html">Create
  /// alarms on Metrics Insights queries</a>.
  ///
  /// Alarms based on anomaly detection models cannot have Auto Scaling actions.
  ///
  /// When this operation creates an alarm, the alarm state is immediately set
  /// to <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its
  /// state is set appropriately. Any actions associated with the new state are
  /// then executed.
  ///
  /// When you update an existing alarm, its state is left unchanged, but the
  /// update completely overwrites the previous configuration of the alarm.
  ///
  /// If you are an IAM user, you must have Amazon EC2 permissions for some
  /// alarm operations:
  ///
  /// <ul>
  /// <li>
  /// The <code>iam:CreateServiceLinkedRole</code> permission for all alarms
  /// with EC2 actions
  /// </li>
  /// <li>
  /// The <code>iam:CreateServiceLinkedRole</code> permissions to create an
  /// alarm with Systems Manager OpsItem or response plan actions.
  /// </li>
  /// </ul>
  /// The first time you create an alarm in the Amazon Web Services Management
  /// Console, the CLI, or by using the PutMetricAlarm API, CloudWatch creates
  /// the necessary service-linked role for you. The service-linked roles are
  /// called <code>AWSServiceRoleForCloudWatchEvents</code> and
  /// <code>AWSServiceRoleForCloudWatchAlarms_ActionSSM</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role">Amazon
  /// Web Services service-linked role</a>.
  ///
  /// Each <code>PutMetricAlarm</code> action has a maximum uncompressed payload
  /// of 120 KB.
  ///
  /// <b>Cross-account alarms</b>
  ///
  /// You can set an alarm on metrics in the current account, or in another
  /// account. To create a cross-account alarm that watches a metric in a
  /// different account, you must have completed the following pre-requisites:
  ///
  /// <ul>
  /// <li>
  /// The account where the metrics are located (the <i>sharing account</i>)
  /// must already have a sharing role named
  /// <b>CloudWatch-CrossAccountSharingRole</b>. If it does not already have
  /// this role, you must create it using the instructions in <b>Set up a
  /// sharing account</b> in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html#enable-cross-account-cross-Region">
  /// Cross-account cross-Region CloudWatch console</a>. The policy for that
  /// role must grant access to the ID of the account where you are creating the
  /// alarm.
  /// </li>
  /// <li>
  /// The account where you are creating the alarm (the <i>monitoring
  /// account</i>) must already have a service-linked role named
  /// <b>AWSServiceRoleForCloudWatchCrossAccount</b> to allow CloudWatch to
  /// assume the sharing role in the sharing account. If it does not, you must
  /// create it following the directions in <b>Set up a monitoring account</b>
  /// in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Cross-Account-Cross-Region.html#enable-cross-account-cross-Region">
  /// Cross-account cross-Region CloudWatch console</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [LimitExceededFault].
  ///
  /// Parameter [alarmName] :
  /// The name for the alarm. This name must be unique within the Region.
  ///
  /// The name must contain only UTF-8 characters, and can't contain ASCII
  /// control characters
  ///
  /// Parameter [comparisonOperator] :
  /// The arithmetic operation to use when comparing the specified statistic and
  /// threshold. The specified statistic value is used as the first operand.
  ///
  /// The values <code>LessThanLowerOrGreaterThanUpperThreshold</code>,
  /// <code>LessThanLowerThreshold</code>, and
  /// <code>GreaterThanUpperThreshold</code> are used only for alarms based on
  /// anomaly detection models.
  ///
  /// Parameter [evaluationPeriods] :
  /// The number of periods over which data is compared to the specified
  /// threshold. If you are setting an alarm that requires that a number of
  /// consecutive data points be breaching to trigger the alarm, this value
  /// specifies that number. If you are setting an "M out of N" alarm, this
  /// value is the N.
  ///
  /// An alarm's total current evaluation period can be no longer than one day,
  /// so this number multiplied by <code>Period</code> cannot be more than
  /// 86,400 seconds.
  ///
  /// Parameter [actionsEnabled] :
  /// Indicates whether actions should be executed during any changes to the
  /// alarm state. The default is <code>TRUE</code>.
  ///
  /// Parameter [alarmActions] :
  /// The actions to execute when this alarm transitions to the
  /// <code>ALARM</code> state from any other state. Each action is specified as
  /// an Amazon Resource Name (ARN). Valid values:
  ///
  /// <b>EC2 actions:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:stop</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:terminate</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:reboot</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:recover</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Stop/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Terminate/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Reboot/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Recover/1.0</code>
  /// </li>
  /// </ul>
  /// <b>Autoscaling action:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i>:autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>Lambda actions:</b>
  ///
  /// <ul>
  /// <li>
  /// Invoke the latest version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a specific version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>version-number</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a function by using an alias Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>alias-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>SNS notification action:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>SSM integration actions:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:opsitem:<i>severity</i>#CATEGORY=<i>category-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// <code>arn:aws:ssm-incidents::<i>account-id</i>:responseplan/<i>response-plan-name</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [alarmDescription] :
  /// The description for the alarm.
  ///
  /// Parameter [datapointsToAlarm] :
  /// The number of data points that must be breaching to trigger the alarm.
  /// This is used only if you are setting an "M out of N" alarm. In that case,
  /// this value is the M. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarm-evaluation">Evaluating
  /// an Alarm</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// Parameter [dimensions] :
  /// The dimensions for the metric specified in <code>MetricName</code>.
  ///
  /// Parameter [evaluateLowSampleCountPercentile] :
  /// Used only for alarms based on percentiles. If you specify
  /// <code>ignore</code>, the alarm state does not change during periods with
  /// too few data points to be statistically significant. If you specify
  /// <code>evaluate</code> or omit this parameter, the alarm is always
  /// evaluated and possibly changes state no matter how many data points are
  /// available. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#percentiles-with-low-samples">Percentile-Based
  /// CloudWatch Alarms and Low Data Samples</a>.
  ///
  /// Valid Values: <code>evaluate | ignore</code>
  ///
  /// Parameter [extendedStatistic] :
  /// The extended statistic for the metric specified in
  /// <code>MetricName</code>. When you call <code>PutMetricAlarm</code> and
  /// specify a <code>MetricName</code>, you must specify either
  /// <code>Statistic</code> or <code>ExtendedStatistic</code> but not both.
  ///
  /// If you specify <code>ExtendedStatistic</code>, the following are valid
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>p90</code>
  /// </li>
  /// <li>
  /// <code>tm90</code>
  /// </li>
  /// <li>
  /// <code>tc90</code>
  /// </li>
  /// <li>
  /// <code>ts90</code>
  /// </li>
  /// <li>
  /// <code>wm90</code>
  /// </li>
  /// <li>
  /// <code>IQM</code>
  /// </li>
  /// <li>
  /// <code>PR(<i>n</i>:<i>m</i>)</code> where n and m are values of the metric
  /// </li>
  /// <li>
  /// <code>TC(<i>X</i>%:<i>X</i>%)</code> where X is between 10 and 90
  /// inclusive.
  /// </li>
  /// <li>
  /// <code>TM(<i>X</i>%:<i>X</i>%)</code> where X is between 10 and 90
  /// inclusive.
  /// </li>
  /// <li>
  /// <code>TS(<i>X</i>%:<i>X</i>%)</code> where X is between 10 and 90
  /// inclusive.
  /// </li>
  /// <li>
  /// <code>WM(<i>X</i>%:<i>X</i>%)</code> where X is between 10 and 90
  /// inclusive.
  /// </li>
  /// </ul>
  /// For more information about these extended statistics, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html">CloudWatch
  /// statistics definitions</a>.
  ///
  /// Parameter [insufficientDataActions] :
  /// The actions to execute when this alarm transitions to the
  /// <code>INSUFFICIENT_DATA</code> state from any other state. Each action is
  /// specified as an Amazon Resource Name (ARN). Valid values:
  ///
  /// <b>EC2 actions:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:stop</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:terminate</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:reboot</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:recover</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Stop/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Terminate/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Reboot/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Recover/1.0</code>
  /// </li>
  /// </ul>
  /// <b>Autoscaling action:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i>:autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>Lambda actions:</b>
  ///
  /// <ul>
  /// <li>
  /// Invoke the latest version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a specific version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>version-number</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a function by using an alias Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>alias-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>SNS notification action:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>SSM integration actions:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:opsitem:<i>severity</i>#CATEGORY=<i>category-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// <code>arn:aws:ssm-incidents::<i>account-id</i>:responseplan/<i>response-plan-name</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [metricName] :
  /// The name for the metric associated with the alarm. For each
  /// <code>PutMetricAlarm</code> operation, you must specify either
  /// <code>MetricName</code> or a <code>Metrics</code> array.
  ///
  /// If you are creating an alarm based on a math expression, you cannot
  /// specify this parameter, or any of the <code>Namespace</code>,
  /// <code>Dimensions</code>, <code>Period</code>, <code>Unit</code>,
  /// <code>Statistic</code>, or <code>ExtendedStatistic</code> parameters.
  /// Instead, you specify all this information in the <code>Metrics</code>
  /// array.
  ///
  /// Parameter [metrics] :
  /// An array of <code>MetricDataQuery</code> structures that enable you to
  /// create an alarm based on the result of a metric math expression. For each
  /// <code>PutMetricAlarm</code> operation, you must specify either
  /// <code>MetricName</code> or a <code>Metrics</code> array.
  ///
  /// Each item in the <code>Metrics</code> array either retrieves a metric or
  /// performs a math expression.
  ///
  /// One item in the <code>Metrics</code> array is the expression that the
  /// alarm watches. You designate this expression by setting
  /// <code>ReturnData</code> to true for this object in the array. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDataQuery.html">MetricDataQuery</a>.
  ///
  /// If you use the <code>Metrics</code> parameter, you cannot include the
  /// <code>Namespace</code>, <code>MetricName</code>, <code>Dimensions</code>,
  /// <code>Period</code>, <code>Unit</code>, <code>Statistic</code>, or
  /// <code>ExtendedStatistic</code> parameters of <code>PutMetricAlarm</code>
  /// in the same operation. Instead, you retrieve the metrics you are using in
  /// your math expression as part of the <code>Metrics</code> array.
  ///
  /// Parameter [namespace] :
  /// The namespace for the metric associated specified in
  /// <code>MetricName</code>.
  ///
  /// Parameter [oKActions] :
  /// The actions to execute when this alarm transitions to an <code>OK</code>
  /// state from any other state. Each action is specified as an Amazon Resource
  /// Name (ARN). Valid values:
  ///
  /// <b>EC2 actions:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:stop</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:terminate</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:reboot</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:automate:<i>region</i>:ec2:recover</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Stop/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Terminate/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Reboot/1.0</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:swf:<i>region</i>:<i>account-id</i>:action/actions/AWS_EC2.InstanceId.Recover/1.0</code>
  /// </li>
  /// </ul>
  /// <b>Autoscaling action:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:autoscaling:<i>region</i>:<i>account-id</i>:scalingPolicy:<i>policy-id</i>:autoScalingGroupName/<i>group-friendly-name</i>:policyName/<i>policy-friendly-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>Lambda actions:</b>
  ///
  /// <ul>
  /// <li>
  /// Invoke the latest version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a specific version of a Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>version-number</i>
  /// </code>
  /// </li>
  /// <li>
  /// Invoke a function by using an alias Lambda function:
  /// <code>arn:aws:lambda:<i>region</i>:<i>account-id</i>:function:<i>function-name</i>:<i>alias-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>SNS notification action:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:sns:<i>region</i>:<i>account-id</i>:<i>sns-topic-name</i>
  /// </code>
  /// </li>
  /// </ul>
  /// <b>SSM integration actions:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:ssm:<i>region</i>:<i>account-id</i>:opsitem:<i>severity</i>#CATEGORY=<i>category-name</i>
  /// </code>
  /// </li>
  /// <li>
  /// <code>arn:aws:ssm-incidents::<i>account-id</i>:responseplan/<i>response-plan-name</i>
  /// </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The length, in seconds, used each time the metric specified in
  /// <code>MetricName</code> is evaluated. Valid values are 10, 30, and any
  /// multiple of 60.
  ///
  /// <code>Period</code> is required for alarms based on static thresholds. If
  /// you are creating an alarm based on a metric math expression, you specify
  /// the period for each metric within the objects in the <code>Metrics</code>
  /// array.
  ///
  /// Be sure to specify 10 or 30 only for metrics that are stored by a
  /// <code>PutMetricData</code> call with a <code>StorageResolution</code> of
  /// 1. If you specify a period of 10 or 30 for a metric that does not have
  /// sub-minute resolution, the alarm still attempts to gather data at the
  /// period rate that you specify. In this case, it does not receive data for
  /// the attempts that do not correspond to a one-minute data resolution, and
  /// the alarm might often lapse into INSUFFICENT_DATA status. Specifying 10 or
  /// 30 also sets this alarm as a high-resolution alarm, which has a higher
  /// charge than other alarms. For more information about pricing, see <a
  /// href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  ///
  /// An alarm's total current evaluation period can be no longer than one day,
  /// so <code>Period</code> multiplied by <code>EvaluationPeriods</code> cannot
  /// be more than 86,400 seconds.
  ///
  /// Parameter [statistic] :
  /// The statistic for the metric specified in <code>MetricName</code>, other
  /// than percentile. For percentile statistics, use
  /// <code>ExtendedStatistic</code>. When you call <code>PutMetricAlarm</code>
  /// and specify a <code>MetricName</code>, you must specify either
  /// <code>Statistic</code> or <code>ExtendedStatistic,</code> but not both.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the alarm. You can associate
  /// as many as 50 tags with an alarm. To be able to associate tags with the
  /// alarm when you create the alarm, you must have the
  /// <code>cloudwatch:TagResource</code> permission.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// If you are using this operation to update an existing alarm, any tags you
  /// specify in this parameter are ignored. To change the tags of an existing
  /// alarm, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html">TagResource</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  ///
  /// Parameter [threshold] :
  /// The value against which the specified statistic is compared.
  ///
  /// This parameter is required for alarms based on static thresholds, but
  /// should not be used for alarms based on anomaly detection models.
  ///
  /// Parameter [thresholdMetricId] :
  /// If this is an alarm based on an anomaly detection model, make this value
  /// match the ID of the <code>ANOMALY_DETECTION_BAND</code> function.
  ///
  /// For an example of how to use this parameter, see the <b>Anomaly Detection
  /// Model Alarm</b> example on this page.
  ///
  /// If your alarm uses this parameter, it cannot have Auto Scaling actions.
  ///
  /// Parameter [treatMissingData] :
  /// Sets how this alarm is to handle missing data points. If
  /// <code>TreatMissingData</code> is omitted, the default behavior of
  /// <code>missing</code> is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data">Configuring
  /// How CloudWatch Alarms Treats Missing Data</a>.
  ///
  /// Valid Values: <code>breaching | notBreaching | ignore | missing</code>
  /// <note>
  /// Alarms that evaluate metrics in the <code>AWS/DynamoDB</code> namespace
  /// always <code>ignore</code> missing data even if you choose a different
  /// option for <code>TreatMissingData</code>. When an
  /// <code>AWS/DynamoDB</code> metric has missing data, alarms that evaluate
  /// that metric remain in their current state.
  /// </note>
  ///
  /// Parameter [unit] :
  /// The unit of measure for the statistic. For example, the units for the
  /// Amazon EC2 NetworkIn metric are Bytes because NetworkIn tracks the number
  /// of bytes that an instance receives on all network interfaces. You can also
  /// specify a unit when you create a custom metric. Units help provide
  /// conceptual meaning to your data. Metric data points that specify a unit of
  /// measure, such as Percent, are aggregated separately. If you are creating
  /// an alarm based on a metric math expression, you can specify the unit for
  /// each metric (if needed) within the objects in the <code>Metrics</code>
  /// array.
  ///
  /// If you don't specify <code>Unit</code>, CloudWatch retrieves all unit
  /// types that have been published for the metric and attempts to evaluate the
  /// alarm. Usually, metrics are published with only one unit, so the alarm
  /// works as intended.
  ///
  /// However, if the metric is published with multiple types of units and you
  /// don't specify a unit, the alarm's behavior is not defined and it behaves
  /// unpredictably.
  ///
  /// We recommend omitting <code>Unit</code> so that you don't inadvertently
  /// specify an incorrect unit that is not published for this metric. Doing so
  /// causes the alarm to be stuck in the <code>INSUFFICIENT DATA</code> state.
  Future<void> putMetricAlarm({
    required String alarmName,
    required ComparisonOperator comparisonOperator,
    required int evaluationPeriods,
    bool? actionsEnabled,
    List<String>? alarmActions,
    String? alarmDescription,
    int? datapointsToAlarm,
    List<Dimension>? dimensions,
    String? evaluateLowSampleCountPercentile,
    String? extendedStatistic,
    List<String>? insufficientDataActions,
    String? metricName,
    List<MetricDataQuery>? metrics,
    String? namespace,
    List<String>? oKActions,
    int? period,
    Statistic? statistic,
    List<Tag>? tags,
    double? threshold,
    String? thresholdMetricId,
    String? treatMissingData,
    StandardUnit? unit,
  }) async {
    _s.validateNumRange(
      'evaluationPeriods',
      evaluationPeriods,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'datapointsToAlarm',
      datapointsToAlarm,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'period',
      period,
      1,
      1152921504606846976,
    );
    final $request = <String, dynamic>{};
    $request['AlarmName'] = alarmName;
    $request['ComparisonOperator'] = comparisonOperator.toValue();
    $request['EvaluationPeriods'] = evaluationPeriods;
    actionsEnabled?.also((arg) => $request['ActionsEnabled'] = arg);
    alarmActions?.also((arg) => $request['AlarmActions'] = arg);
    alarmDescription?.also((arg) => $request['AlarmDescription'] = arg);
    datapointsToAlarm?.also((arg) => $request['DatapointsToAlarm'] = arg);
    dimensions?.also((arg) => $request['Dimensions'] = arg);
    evaluateLowSampleCountPercentile
        ?.also((arg) => $request['EvaluateLowSampleCountPercentile'] = arg);
    extendedStatistic?.also((arg) => $request['ExtendedStatistic'] = arg);
    insufficientDataActions
        ?.also((arg) => $request['InsufficientDataActions'] = arg);
    metricName?.also((arg) => $request['MetricName'] = arg);
    metrics?.also((arg) => $request['Metrics'] = arg);
    namespace?.also((arg) => $request['Namespace'] = arg);
    oKActions?.also((arg) => $request['OKActions'] = arg);
    period?.also((arg) => $request['Period'] = arg);
    statistic?.also((arg) => $request['Statistic'] = arg.toValue());
    tags?.also((arg) => $request['Tags'] = arg);
    threshold?.also((arg) => $request['Threshold'] = arg);
    thresholdMetricId?.also((arg) => $request['ThresholdMetricId'] = arg);
    treatMissingData?.also((arg) => $request['TreatMissingData'] = arg);
    unit?.also((arg) => $request['Unit'] = arg.toValue());
    await _protocol.send(
      $request,
      action: 'PutMetricAlarm',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutMetricAlarmInput'],
      shapes: shapes,
    );
  }

  /// Publishes metric data points to Amazon CloudWatch. CloudWatch associates
  /// the data points with the specified metric. If the specified metric does
  /// not exist, CloudWatch creates the metric. When CloudWatch creates a
  /// metric, it can take up to fifteen minutes for the metric to appear in
  /// calls to <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html">ListMetrics</a>.
  ///
  /// You can publish either individual data points in the <code>Value</code>
  /// field, or arrays of values and the number of times each value occurred
  /// during the period by using the <code>Values</code> and <code>Counts</code>
  /// fields in the <code>MetricData</code> structure. Using the
  /// <code>Values</code> and <code>Counts</code> method enables you to publish
  /// up to 150 values per metric with one <code>PutMetricData</code> request,
  /// and supports retrieving percentile statistics on this data.
  ///
  /// Each <code>PutMetricData</code> request is limited to 1 MB in size for
  /// HTTP POST requests. You can send a payload compressed by gzip. Each
  /// request is also limited to no more than 1000 different metrics.
  ///
  /// Although the <code>Value</code> parameter accepts numbers of type
  /// <code>Double</code>, CloudWatch rejects values that are either too small
  /// or too large. Values must be in the range of -2^360 to 2^360. In addition,
  /// special values (for example, NaN, +Infinity, -Infinity) are not supported.
  ///
  /// You can use up to 30 dimensions per metric to further clarify what data
  /// the metric collects. Each dimension consists of a Name and Value pair. For
  /// more information about specifying dimensions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publishing
  /// Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// You specify the time stamp to be associated with each data point. You can
  /// specify time stamps that are as much as two weeks before the current date,
  /// and as much as 2 hours after the current day and time.
  ///
  /// Data points with time stamps from 24 hours ago or longer can take at least
  /// 48 hours to become available for <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html">GetMetricData</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html">GetMetricStatistics</a>
  /// from the time they are submitted. Data points with time stamps between 3
  /// and 24 hours ago can take as much as 2 hours to become available for for
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricData.html">GetMetricData</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetMetricStatistics.html">GetMetricStatistics</a>.
  ///
  /// CloudWatch needs raw data points to calculate percentile statistics. If
  /// you publish data using a statistic set instead, you can only retrieve
  /// percentile statistics for this data if one of the following conditions is
  /// true:
  ///
  /// <ul>
  /// <li>
  /// The <code>SampleCount</code> value of the statistic set is 1 and
  /// <code>Min</code>, <code>Max</code>, and <code>Sum</code> are all equal.
  /// </li>
  /// <li>
  /// The <code>Min</code> and <code>Max</code> are equal, and <code>Sum</code>
  /// is equal to <code>Min</code> multiplied by <code>SampleCount</code>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [metricData] :
  /// The data for the metric. The array can include no more than 1000 metrics
  /// per call.
  ///
  /// Parameter [namespace] :
  /// The namespace for the metric data. You can use ASCII characters for the
  /// namespace, except for control characters which are not supported.
  ///
  /// To avoid conflicts with Amazon Web Services service namespaces, you should
  /// not specify a namespace that begins with <code>AWS/</code>
  Future<void> putMetricData({
    required List<MetricDatum> metricData,
    required String namespace,
  }) async {
    final $request = <String, dynamic>{};
    $request['MetricData'] = metricData;
    $request['Namespace'] = namespace;
    await _protocol.send(
      $request,
      action: 'PutMetricData',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutMetricDataInput'],
      shapes: shapes,
    );
  }

  /// Creates or updates a metric stream. Metric streams can automatically
  /// stream CloudWatch metrics to Amazon Web Services destinations, including
  /// Amazon S3, and to many third-party solutions.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Metric-Streams.html">
  /// Using Metric Streams</a>.
  ///
  /// To create a metric stream, you must be signed in to an account that has
  /// the <code>iam:PassRole</code> permission and either the
  /// <code>CloudWatchFullAccess</code> policy or the
  /// <code>cloudwatch:PutMetricStream</code> permission.
  ///
  /// When you create or update a metric stream, you choose one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Stream metrics from all metric namespaces in the account.
  /// </li>
  /// <li>
  /// Stream metrics from all metric namespaces in the account, except for the
  /// namespaces that you list in <code>ExcludeFilters</code>.
  /// </li>
  /// <li>
  /// Stream metrics from only the metric namespaces that you list in
  /// <code>IncludeFilters</code>.
  /// </li>
  /// </ul>
  /// By default, a metric stream always sends the <code>MAX</code>,
  /// <code>MIN</code>, <code>SUM</code>, and <code>SAMPLECOUNT</code>
  /// statistics for each metric that is streamed. You can use the
  /// <code>StatisticsConfigurations</code> parameter to have the metric stream
  /// send additional statistics in the stream. Streaming additional statistics
  /// incurs additional costs. For more information, see <a
  /// href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  ///
  /// When you use <code>PutMetricStream</code> to create a new metric stream,
  /// the stream is created in the <code>running</code> state. If you use it to
  /// update an existing stream, the state of the stream is not changed.
  ///
  /// If you are using CloudWatch cross-account observability and you create a
  /// metric stream in a monitoring account, you can choose whether to include
  /// metrics from source accounts in the stream. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html">CloudWatch
  /// cross-account observability</a>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [firehoseArn] :
  /// The ARN of the Amazon Kinesis Data Firehose delivery stream to use for
  /// this metric stream. This Amazon Kinesis Data Firehose delivery stream must
  /// already exist and must be in the same account as the metric stream.
  ///
  /// Parameter [name] :
  /// If you are creating a new metric stream, this is the name for the new
  /// stream. The name must be different than the names of other metric streams
  /// in this account and Region.
  ///
  /// If you are updating a metric stream, specify the name of that stream here.
  ///
  /// Valid characters are A-Z, a-z, 0-9, "-" and "_".
  ///
  /// Parameter [outputFormat] :
  /// The output format for the stream. Valid values are <code>json</code>,
  /// <code>opentelemetry1.0</code>, and <code>opentelemetry0.7</code>. For more
  /// information about metric stream output formats, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-metric-streams-formats.html">
  /// Metric streams output formats</a>.
  ///
  /// Parameter [roleArn] :
  /// The ARN of an IAM role that this metric stream will use to access Amazon
  /// Kinesis Data Firehose resources. This IAM role must already exist and must
  /// be in the same account as the metric stream. This IAM role must include
  /// the following permissions:
  ///
  /// <ul>
  /// <li>
  /// firehose:PutRecord
  /// </li>
  /// <li>
  /// firehose:PutRecordBatch
  /// </li>
  /// </ul>
  ///
  /// Parameter [excludeFilters] :
  /// If you specify this parameter, the stream sends metrics from all metric
  /// namespaces except for the namespaces that you specify here.
  ///
  /// You cannot include <code>ExcludeFilters</code> and
  /// <code>IncludeFilters</code> in the same operation.
  ///
  /// Parameter [includeFilters] :
  /// If you specify this parameter, the stream sends only the metrics from the
  /// metric namespaces that you specify here.
  ///
  /// You cannot include <code>IncludeFilters</code> and
  /// <code>ExcludeFilters</code> in the same operation.
  ///
  /// Parameter [includeLinkedAccountsMetrics] :
  /// If you are creating a metric stream in a monitoring account, specify
  /// <code>true</code> to include metrics from source accounts in the metric
  /// stream.
  ///
  /// Parameter [statisticsConfigurations] :
  /// By default, a metric stream always sends the <code>MAX</code>,
  /// <code>MIN</code>, <code>SUM</code>, and <code>SAMPLECOUNT</code>
  /// statistics for each metric that is streamed. You can use this parameter to
  /// have the metric stream also send additional statistics in the stream. This
  /// array can have up to 100 members.
  ///
  /// For each entry in this array, you specify one or more metrics and the list
  /// of additional statistics to stream for those metrics. The additional
  /// statistics that you can stream depend on the stream's
  /// <code>OutputFormat</code>. If the <code>OutputFormat</code> is
  /// <code>json</code>, you can stream any additional statistic that is
  /// supported by CloudWatch, listed in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html">
  /// CloudWatch statistics definitions</a>. If the <code>OutputFormat</code> is
  /// <code>opentelemetry1.0</code> or <code>opentelemetry0.7</code>, you can
  /// stream percentile statistics such as p95, p99.9, and so on.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to associate with the metric stream. You can
  /// associate as many as 50 tags with a metric stream.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// You can use this parameter only when you are creating a new metric stream.
  /// If you are using this operation to update an existing metric stream, any
  /// tags you specify in this parameter are ignored. To change the tags of an
  /// existing metric stream, use <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html">TagResource</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  Future<PutMetricStreamOutput> putMetricStream({
    required String firehoseArn,
    required String name,
    required MetricStreamOutputFormat outputFormat,
    required String roleArn,
    List<MetricStreamFilter>? excludeFilters,
    List<MetricStreamFilter>? includeFilters,
    bool? includeLinkedAccountsMetrics,
    List<MetricStreamStatisticsConfiguration>? statisticsConfigurations,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['FirehoseArn'] = firehoseArn;
    $request['Name'] = name;
    $request['OutputFormat'] = outputFormat.toValue();
    $request['RoleArn'] = roleArn;
    excludeFilters?.also((arg) => $request['ExcludeFilters'] = arg);
    includeFilters?.also((arg) => $request['IncludeFilters'] = arg);
    includeLinkedAccountsMetrics
        ?.also((arg) => $request['IncludeLinkedAccountsMetrics'] = arg);
    statisticsConfigurations
        ?.also((arg) => $request['StatisticsConfigurations'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PutMetricStream',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutMetricStreamInput'],
      shapes: shapes,
      resultWrapper: 'PutMetricStreamResult',
    );
    return PutMetricStreamOutput.fromXml($result);
  }

  /// Temporarily sets the state of an alarm for testing purposes. When the
  /// updated state differs from the previous value, the action configured for
  /// the appropriate state is invoked. For example, if your alarm is configured
  /// to send an Amazon SNS message when an alarm is triggered, temporarily
  /// changing the alarm state to <code>ALARM</code> sends an SNS message.
  ///
  /// Metric alarms returns to their actual state quickly, often within seconds.
  /// Because the metric alarm state change happens quickly, it is typically
  /// only visible in the alarm's <b>History</b> tab in the Amazon CloudWatch
  /// console or through <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarmHistory.html">DescribeAlarmHistory</a>.
  ///
  /// If you use <code>SetAlarmState</code> on a composite alarm, the composite
  /// alarm is not guaranteed to return to its actual state. It returns to its
  /// actual state only once any of its children alarms change state. It is also
  /// reevaluated if you update its configuration.
  ///
  /// If an alarm triggers EC2 Auto Scaling policies or application Auto Scaling
  /// policies, you must include information in the <code>StateReasonData</code>
  /// parameter to enable the policy to take the correct action.
  ///
  /// May throw [ResourceNotFound].
  /// May throw [InvalidFormatFault].
  ///
  /// Parameter [alarmName] :
  /// The name of the alarm.
  ///
  /// Parameter [stateReason] :
  /// The reason that this alarm is set to this specific state, in text format.
  ///
  /// Parameter [stateValue] :
  /// The value of the state.
  ///
  /// Parameter [stateReasonData] :
  /// The reason that this alarm is set to this specific state, in JSON format.
  ///
  /// For SNS or EC2 alarm actions, this is just informational. But for EC2 Auto
  /// Scaling or application Auto Scaling alarm actions, the Auto Scaling policy
  /// uses the information in this field to take the correct action.
  Future<void> setAlarmState({
    required String alarmName,
    required String stateReason,
    required StateValue stateValue,
    String? stateReasonData,
  }) async {
    final $request = <String, dynamic>{};
    $request['AlarmName'] = alarmName;
    $request['StateReason'] = stateReason;
    $request['StateValue'] = stateValue.toValue();
    stateReasonData?.also((arg) => $request['StateReasonData'] = arg);
    await _protocol.send(
      $request,
      action: 'SetAlarmState',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetAlarmStateInput'],
      shapes: shapes,
    );
  }

  /// Starts the streaming of metrics for one or more of your metric streams.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [names] :
  /// The array of the names of metric streams to start streaming.
  ///
  /// This is an "all or nothing" operation. If you do not have permission to
  /// access all of the metric streams that you list here, then none of the
  /// streams that you list in the operation will start streaming.
  Future<void> startMetricStreams({
    required List<String> names,
  }) async {
    final $request = <String, dynamic>{};
    $request['Names'] = names;
    await _protocol.send(
      $request,
      action: 'StartMetricStreams',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StartMetricStreamsInput'],
      shapes: shapes,
      resultWrapper: 'StartMetricStreamsResult',
    );
  }

  /// Stops the streaming of metrics for one or more of your metric streams.
  ///
  /// May throw [InternalServiceFault].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingRequiredParameterException].
  ///
  /// Parameter [names] :
  /// The array of the names of metric streams to stop streaming.
  ///
  /// This is an "all or nothing" operation. If you do not have permission to
  /// access all of the metric streams that you list here, then none of the
  /// streams that you list in the operation will stop streaming.
  Future<void> stopMetricStreams({
    required List<String> names,
  }) async {
    final $request = <String, dynamic>{};
    $request['Names'] = names;
    await _protocol.send(
      $request,
      action: 'StopMetricStreams',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['StopMetricStreamsInput'],
      shapes: shapes,
      resultWrapper: 'StopMetricStreamsResult',
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch
  /// resource. Currently, the only CloudWatch resources that can be tagged are
  /// alarms and Contributor Insights rules.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with an alarm that already
  /// has tags. If you specify a new tag key for the alarm, this tag is appended
  /// to the list of tags associated with the alarm. If you specify a tag key
  /// that is already associated with the alarm, the new tag value that you
  /// specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a CloudWatch resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the CloudWatch resource that you're adding tags to.
  ///
  /// The ARN format of an alarm is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:alarm:<i>alarm-name</i>
  /// </code>
  ///
  /// The ARN format of a Contributor Insights rule is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:insight-rule/<i>insight-rule-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies">
  /// Resource Types Defined by Amazon CloudWatch</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the alarm.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceARN'] = resourceARN;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagResource',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagResourceInput'],
      shapes: shapes,
      resultWrapper: 'TagResourceResult',
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServiceFault].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the CloudWatch resource that you're removing tags from.
  ///
  /// The ARN format of an alarm is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:alarm:<i>alarm-name</i>
  /// </code>
  ///
  /// The ARN format of a Contributor Insights rule is
  /// <code>arn:aws:cloudwatch:<i>Region</i>:<i>account-id</i>:insight-rule/<i>insight-rule-name</i>
  /// </code>
  ///
  /// For more information about ARN format, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies">
  /// Resource Types Defined by Amazon CloudWatch</a> in the <i>Amazon Web
  /// Services General Reference</i>.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['ResourceARN'] = resourceARN;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagResource',
      version: '2010-08-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagResourceInput'],
      shapes: shapes,
      resultWrapper: 'UntagResourceResult',
    );
  }
}

enum ActionsSuppressedBy {
  waitPeriod,
  extensionPeriod,
  alarm,
}

extension ActionsSuppressedByValueExtension on ActionsSuppressedBy {
  String toValue() {
    switch (this) {
      case ActionsSuppressedBy.waitPeriod:
        return 'WaitPeriod';
      case ActionsSuppressedBy.extensionPeriod:
        return 'ExtensionPeriod';
      case ActionsSuppressedBy.alarm:
        return 'Alarm';
    }
  }
}

extension ActionsSuppressedByFromString on String {
  ActionsSuppressedBy toActionsSuppressedBy() {
    switch (this) {
      case 'WaitPeriod':
        return ActionsSuppressedBy.waitPeriod;
      case 'ExtensionPeriod':
        return ActionsSuppressedBy.extensionPeriod;
      case 'Alarm':
        return ActionsSuppressedBy.alarm;
    }
    throw Exception('$this is not known in enum ActionsSuppressedBy');
  }
}

/// Represents the history of a specific alarm.
class AlarmHistoryItem {
  /// The descriptive name for the alarm.
  final String? alarmName;

  /// The type of alarm, either metric alarm or composite alarm.
  final AlarmType? alarmType;

  /// Data about the alarm, in JSON format.
  final String? historyData;

  /// The type of alarm history item.
  final HistoryItemType? historyItemType;

  /// A summary of the alarm history, in text format.
  final String? historySummary;

  /// The time stamp for the alarm history item.
  final DateTime? timestamp;

  AlarmHistoryItem({
    this.alarmName,
    this.alarmType,
    this.historyData,
    this.historyItemType,
    this.historySummary,
    this.timestamp,
  });
  factory AlarmHistoryItem.fromXml(_s.XmlElement elem) {
    return AlarmHistoryItem(
      alarmName: _s.extractXmlStringValue(elem, 'AlarmName'),
      alarmType: _s.extractXmlStringValue(elem, 'AlarmType')?.toAlarmType(),
      historyData: _s.extractXmlStringValue(elem, 'HistoryData'),
      historyItemType: _s
          .extractXmlStringValue(elem, 'HistoryItemType')
          ?.toHistoryItemType(),
      historySummary: _s.extractXmlStringValue(elem, 'HistorySummary'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmName = this.alarmName;
    final alarmType = this.alarmType;
    final historyData = this.historyData;
    final historyItemType = this.historyItemType;
    final historySummary = this.historySummary;
    final timestamp = this.timestamp;
    return {
      if (alarmName != null) 'AlarmName': alarmName,
      if (alarmType != null) 'AlarmType': alarmType.toValue(),
      if (historyData != null) 'HistoryData': historyData,
      if (historyItemType != null) 'HistoryItemType': historyItemType.toValue(),
      if (historySummary != null) 'HistorySummary': historySummary,
      if (timestamp != null) 'Timestamp': iso8601ToJson(timestamp),
    };
  }
}

enum AlarmType {
  compositeAlarm,
  metricAlarm,
}

extension AlarmTypeValueExtension on AlarmType {
  String toValue() {
    switch (this) {
      case AlarmType.compositeAlarm:
        return 'CompositeAlarm';
      case AlarmType.metricAlarm:
        return 'MetricAlarm';
    }
  }
}

extension AlarmTypeFromString on String {
  AlarmType toAlarmType() {
    switch (this) {
      case 'CompositeAlarm':
        return AlarmType.compositeAlarm;
      case 'MetricAlarm':
        return AlarmType.metricAlarm;
    }
    throw Exception('$this is not known in enum AlarmType');
  }
}

/// An anomaly detection model associated with a particular CloudWatch metric,
/// statistic, or metric math expression. You can use the model to display a
/// band of expected, normal values when the metric is graphed.
///
/// If you have enabled unified cross-account observability, and this account is
/// a monitoring account, the metric can be in the same account or a source
/// account.
class AnomalyDetector {
  /// The configuration specifies details about how the anomaly detection model is
  /// to be trained, including time ranges to exclude from use for training the
  /// model, and the time zone to use for the metric.
  final AnomalyDetectorConfiguration? configuration;

  /// The metric dimensions associated with the anomaly detection model.
  final List<Dimension>? dimensions;

  /// This object includes parameters that you can use to provide information
  /// about your metric to CloudWatch to help it build more accurate anomaly
  /// detection models. Currently, it includes the <code>PeriodicSpikes</code>
  /// parameter.
  final MetricCharacteristics? metricCharacteristics;

  /// The CloudWatch metric math expression for this anomaly detector.
  final MetricMathAnomalyDetector? metricMathAnomalyDetector;

  /// The name of the metric associated with the anomaly detection model.
  final String? metricName;

  /// The namespace of the metric associated with the anomaly detection model.
  final String? namespace;

  /// The CloudWatch metric and statistic for this anomaly detector.
  final SingleMetricAnomalyDetector? singleMetricAnomalyDetector;

  /// The statistic associated with the anomaly detection model.
  final String? stat;

  /// The current status of the anomaly detector's training.
  final AnomalyDetectorStateValue? stateValue;

  AnomalyDetector({
    this.configuration,
    this.dimensions,
    this.metricCharacteristics,
    this.metricMathAnomalyDetector,
    this.metricName,
    this.namespace,
    this.singleMetricAnomalyDetector,
    this.stat,
    this.stateValue,
  });
  factory AnomalyDetector.fromXml(_s.XmlElement elem) {
    return AnomalyDetector(
      configuration: _s
          .extractXmlChild(elem, 'Configuration')
          ?.let(AnomalyDetectorConfiguration.fromXml),
      dimensions: _s.extractXmlChild(elem, 'Dimensions')?.let((elem) =>
          elem.findElements('member').map(Dimension.fromXml).toList()),
      metricCharacteristics: _s
          .extractXmlChild(elem, 'MetricCharacteristics')
          ?.let(MetricCharacteristics.fromXml),
      metricMathAnomalyDetector: _s
          .extractXmlChild(elem, 'MetricMathAnomalyDetector')
          ?.let(MetricMathAnomalyDetector.fromXml),
      metricName: _s.extractXmlStringValue(elem, 'MetricName'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      singleMetricAnomalyDetector: _s
          .extractXmlChild(elem, 'SingleMetricAnomalyDetector')
          ?.let(SingleMetricAnomalyDetector.fromXml),
      stat: _s.extractXmlStringValue(elem, 'Stat'),
      stateValue: _s
          .extractXmlStringValue(elem, 'StateValue')
          ?.toAnomalyDetectorStateValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final dimensions = this.dimensions;
    final metricCharacteristics = this.metricCharacteristics;
    final metricMathAnomalyDetector = this.metricMathAnomalyDetector;
    final metricName = this.metricName;
    final namespace = this.namespace;
    final singleMetricAnomalyDetector = this.singleMetricAnomalyDetector;
    final stat = this.stat;
    final stateValue = this.stateValue;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricCharacteristics != null)
        'MetricCharacteristics': metricCharacteristics,
      if (metricMathAnomalyDetector != null)
        'MetricMathAnomalyDetector': metricMathAnomalyDetector,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
      if (singleMetricAnomalyDetector != null)
        'SingleMetricAnomalyDetector': singleMetricAnomalyDetector,
      if (stat != null) 'Stat': stat,
      if (stateValue != null) 'StateValue': stateValue.toValue(),
    };
  }
}

/// The configuration specifies details about how the anomaly detection model is
/// to be trained, including time ranges to exclude from use for training the
/// model and the time zone to use for the metric.
class AnomalyDetectorConfiguration {
  /// An array of time ranges to exclude from use when the anomaly detection model
  /// is trained. Use this to make sure that events that could cause unusual
  /// values for the metric, such as deployments, aren't used when CloudWatch
  /// creates the model.
  final List<Range>? excludedTimeRanges;

  /// The time zone to use for the metric. This is useful to enable the model to
  /// automatically account for daylight savings time changes if the metric is
  /// sensitive to such time changes.
  ///
  /// To specify a time zone, use the name of the time zone as specified in the
  /// standard tz database. For more information, see <a
  /// href="https://en.wikipedia.org/wiki/Tz_database">tz database</a>.
  final String? metricTimezone;

  AnomalyDetectorConfiguration({
    this.excludedTimeRanges,
    this.metricTimezone,
  });
  factory AnomalyDetectorConfiguration.fromXml(_s.XmlElement elem) {
    return AnomalyDetectorConfiguration(
      excludedTimeRanges: _s.extractXmlChild(elem, 'ExcludedTimeRanges')?.let(
          (elem) => elem.findElements('member').map(Range.fromXml).toList()),
      metricTimezone: _s.extractXmlStringValue(elem, 'MetricTimezone'),
    );
  }

  Map<String, dynamic> toJson() {
    final excludedTimeRanges = this.excludedTimeRanges;
    final metricTimezone = this.metricTimezone;
    return {
      if (excludedTimeRanges != null) 'ExcludedTimeRanges': excludedTimeRanges,
      if (metricTimezone != null) 'MetricTimezone': metricTimezone,
    };
  }
}

enum AnomalyDetectorStateValue {
  pendingTraining,
  trainedInsufficientData,
  trained,
}

extension AnomalyDetectorStateValueValueExtension on AnomalyDetectorStateValue {
  String toValue() {
    switch (this) {
      case AnomalyDetectorStateValue.pendingTraining:
        return 'PENDING_TRAINING';
      case AnomalyDetectorStateValue.trainedInsufficientData:
        return 'TRAINED_INSUFFICIENT_DATA';
      case AnomalyDetectorStateValue.trained:
        return 'TRAINED';
    }
  }
}

extension AnomalyDetectorStateValueFromString on String {
  AnomalyDetectorStateValue toAnomalyDetectorStateValue() {
    switch (this) {
      case 'PENDING_TRAINING':
        return AnomalyDetectorStateValue.pendingTraining;
      case 'TRAINED_INSUFFICIENT_DATA':
        return AnomalyDetectorStateValue.trainedInsufficientData;
      case 'TRAINED':
        return AnomalyDetectorStateValue.trained;
    }
    throw Exception('$this is not known in enum AnomalyDetectorStateValue');
  }
}

enum AnomalyDetectorType {
  singleMetric,
  metricMath,
}

extension AnomalyDetectorTypeValueExtension on AnomalyDetectorType {
  String toValue() {
    switch (this) {
      case AnomalyDetectorType.singleMetric:
        return 'SINGLE_METRIC';
      case AnomalyDetectorType.metricMath:
        return 'METRIC_MATH';
    }
  }
}

extension AnomalyDetectorTypeFromString on String {
  AnomalyDetectorType toAnomalyDetectorType() {
    switch (this) {
      case 'SINGLE_METRIC':
        return AnomalyDetectorType.singleMetric;
      case 'METRIC_MATH':
        return AnomalyDetectorType.metricMath;
    }
    throw Exception('$this is not known in enum AnomalyDetectorType');
  }
}

enum ComparisonOperator {
  greaterThanOrEqualToThreshold,
  greaterThanThreshold,
  lessThanThreshold,
  lessThanOrEqualToThreshold,
  lessThanLowerOrGreaterThanUpperThreshold,
  lessThanLowerThreshold,
  greaterThanUpperThreshold,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greaterThanOrEqualToThreshold:
        return 'GreaterThanOrEqualToThreshold';
      case ComparisonOperator.greaterThanThreshold:
        return 'GreaterThanThreshold';
      case ComparisonOperator.lessThanThreshold:
        return 'LessThanThreshold';
      case ComparisonOperator.lessThanOrEqualToThreshold:
        return 'LessThanOrEqualToThreshold';
      case ComparisonOperator.lessThanLowerOrGreaterThanUpperThreshold:
        return 'LessThanLowerOrGreaterThanUpperThreshold';
      case ComparisonOperator.lessThanLowerThreshold:
        return 'LessThanLowerThreshold';
      case ComparisonOperator.greaterThanUpperThreshold:
        return 'GreaterThanUpperThreshold';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GreaterThanOrEqualToThreshold':
        return ComparisonOperator.greaterThanOrEqualToThreshold;
      case 'GreaterThanThreshold':
        return ComparisonOperator.greaterThanThreshold;
      case 'LessThanThreshold':
        return ComparisonOperator.lessThanThreshold;
      case 'LessThanOrEqualToThreshold':
        return ComparisonOperator.lessThanOrEqualToThreshold;
      case 'LessThanLowerOrGreaterThanUpperThreshold':
        return ComparisonOperator.lessThanLowerOrGreaterThanUpperThreshold;
      case 'LessThanLowerThreshold':
        return ComparisonOperator.lessThanLowerThreshold;
      case 'GreaterThanUpperThreshold':
        return ComparisonOperator.greaterThanUpperThreshold;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// The details about a composite alarm.
class CompositeAlarm {
  /// Indicates whether actions should be executed during any changes to the alarm
  /// state.
  final bool? actionsEnabled;

  /// When the value is <code>ALARM</code>, it means that the actions are
  /// suppressed because the suppressor alarm is in <code>ALARM</code> When the
  /// value is <code>WaitPeriod</code>, it means that the actions are suppressed
  /// because the composite alarm is waiting for the suppressor alarm to go into
  /// into the <code>ALARM</code> state. The maximum waiting time is as specified
  /// in <code>ActionsSuppressorWaitPeriod</code>. After this time, the composite
  /// alarm performs its actions. When the value is <code>ExtensionPeriod</code>,
  /// it means that the actions are suppressed because the composite alarm is
  /// waiting after the suppressor alarm went out of the <code>ALARM</code> state.
  /// The maximum waiting time is as specified in
  /// <code>ActionsSuppressorExtensionPeriod</code>. After this time, the
  /// composite alarm performs its actions.
  final ActionsSuppressedBy? actionsSuppressedBy;

  /// Captures the reason for action suppression.
  final String? actionsSuppressedReason;

  /// Actions will be suppressed if the suppressor alarm is in the
  /// <code>ALARM</code> state. <code>ActionsSuppressor</code> can be an AlarmName
  /// or an Amazon Resource Name (ARN) from an existing alarm.
  final String? actionsSuppressor;

  /// The maximum time in seconds that the composite alarm waits after suppressor
  /// alarm goes out of the <code>ALARM</code> state. After this time, the
  /// composite alarm performs its actions.
  /// <important>
  /// <code>ExtensionPeriod</code> is required only when
  /// <code>ActionsSuppressor</code> is specified.
  /// </important>
  final int? actionsSuppressorExtensionPeriod;

  /// The maximum time in seconds that the composite alarm waits for the
  /// suppressor alarm to go into the <code>ALARM</code> state. After this time,
  /// the composite alarm performs its actions.
  /// <important>
  /// <code>WaitPeriod</code> is required only when <code>ActionsSuppressor</code>
  /// is specified.
  /// </important>
  final int? actionsSuppressorWaitPeriod;

  /// The actions to execute when this alarm transitions to the ALARM state from
  /// any other state. Each action is specified as an Amazon Resource Name (ARN).
  final List<String>? alarmActions;

  /// The Amazon Resource Name (ARN) of the alarm.
  final String? alarmArn;

  /// The time stamp of the last update to the alarm configuration.
  final DateTime? alarmConfigurationUpdatedTimestamp;

  /// The description of the alarm.
  final String? alarmDescription;

  /// The name of the alarm.
  final String? alarmName;

  /// The rule that this alarm uses to evaluate its alarm state.
  final String? alarmRule;

  /// The actions to execute when this alarm transitions to the INSUFFICIENT_DATA
  /// state from any other state. Each action is specified as an Amazon Resource
  /// Name (ARN).
  final List<String>? insufficientDataActions;

  /// The actions to execute when this alarm transitions to the OK state from any
  /// other state. Each action is specified as an Amazon Resource Name (ARN).
  final List<String>? oKActions;

  /// An explanation for the alarm state, in text format.
  final String? stateReason;

  /// An explanation for the alarm state, in JSON format.
  final String? stateReasonData;

  /// The timestamp of the last change to the alarm's <code>StateValue</code>.
  final DateTime? stateTransitionedTimestamp;

  /// Tracks the timestamp of any state update, even if <code>StateValue</code>
  /// doesn't change.
  final DateTime? stateUpdatedTimestamp;

  /// The state value for the alarm.
  final StateValue? stateValue;

  CompositeAlarm({
    this.actionsEnabled,
    this.actionsSuppressedBy,
    this.actionsSuppressedReason,
    this.actionsSuppressor,
    this.actionsSuppressorExtensionPeriod,
    this.actionsSuppressorWaitPeriod,
    this.alarmActions,
    this.alarmArn,
    this.alarmConfigurationUpdatedTimestamp,
    this.alarmDescription,
    this.alarmName,
    this.alarmRule,
    this.insufficientDataActions,
    this.oKActions,
    this.stateReason,
    this.stateReasonData,
    this.stateTransitionedTimestamp,
    this.stateUpdatedTimestamp,
    this.stateValue,
  });
  factory CompositeAlarm.fromXml(_s.XmlElement elem) {
    return CompositeAlarm(
      actionsEnabled: _s.extractXmlBoolValue(elem, 'ActionsEnabled'),
      actionsSuppressedBy: _s
          .extractXmlStringValue(elem, 'ActionsSuppressedBy')
          ?.toActionsSuppressedBy(),
      actionsSuppressedReason:
          _s.extractXmlStringValue(elem, 'ActionsSuppressedReason'),
      actionsSuppressor: _s.extractXmlStringValue(elem, 'ActionsSuppressor'),
      actionsSuppressorExtensionPeriod:
          _s.extractXmlIntValue(elem, 'ActionsSuppressorExtensionPeriod'),
      actionsSuppressorWaitPeriod:
          _s.extractXmlIntValue(elem, 'ActionsSuppressorWaitPeriod'),
      alarmActions: _s
          .extractXmlChild(elem, 'AlarmActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      alarmArn: _s.extractXmlStringValue(elem, 'AlarmArn'),
      alarmConfigurationUpdatedTimestamp: _s.extractXmlDateTimeValue(
          elem, 'AlarmConfigurationUpdatedTimestamp'),
      alarmDescription: _s.extractXmlStringValue(elem, 'AlarmDescription'),
      alarmName: _s.extractXmlStringValue(elem, 'AlarmName'),
      alarmRule: _s.extractXmlStringValue(elem, 'AlarmRule'),
      insufficientDataActions: _s
          .extractXmlChild(elem, 'InsufficientDataActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      oKActions: _s
          .extractXmlChild(elem, 'OKActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      stateReason: _s.extractXmlStringValue(elem, 'StateReason'),
      stateReasonData: _s.extractXmlStringValue(elem, 'StateReasonData'),
      stateTransitionedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'StateTransitionedTimestamp'),
      stateUpdatedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'StateUpdatedTimestamp'),
      stateValue: _s.extractXmlStringValue(elem, 'StateValue')?.toStateValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionsEnabled = this.actionsEnabled;
    final actionsSuppressedBy = this.actionsSuppressedBy;
    final actionsSuppressedReason = this.actionsSuppressedReason;
    final actionsSuppressor = this.actionsSuppressor;
    final actionsSuppressorExtensionPeriod =
        this.actionsSuppressorExtensionPeriod;
    final actionsSuppressorWaitPeriod = this.actionsSuppressorWaitPeriod;
    final alarmActions = this.alarmActions;
    final alarmArn = this.alarmArn;
    final alarmConfigurationUpdatedTimestamp =
        this.alarmConfigurationUpdatedTimestamp;
    final alarmDescription = this.alarmDescription;
    final alarmName = this.alarmName;
    final alarmRule = this.alarmRule;
    final insufficientDataActions = this.insufficientDataActions;
    final oKActions = this.oKActions;
    final stateReason = this.stateReason;
    final stateReasonData = this.stateReasonData;
    final stateTransitionedTimestamp = this.stateTransitionedTimestamp;
    final stateUpdatedTimestamp = this.stateUpdatedTimestamp;
    final stateValue = this.stateValue;
    return {
      if (actionsEnabled != null) 'ActionsEnabled': actionsEnabled,
      if (actionsSuppressedBy != null)
        'ActionsSuppressedBy': actionsSuppressedBy.toValue(),
      if (actionsSuppressedReason != null)
        'ActionsSuppressedReason': actionsSuppressedReason,
      if (actionsSuppressor != null) 'ActionsSuppressor': actionsSuppressor,
      if (actionsSuppressorExtensionPeriod != null)
        'ActionsSuppressorExtensionPeriod': actionsSuppressorExtensionPeriod,
      if (actionsSuppressorWaitPeriod != null)
        'ActionsSuppressorWaitPeriod': actionsSuppressorWaitPeriod,
      if (alarmActions != null) 'AlarmActions': alarmActions,
      if (alarmArn != null) 'AlarmArn': alarmArn,
      if (alarmConfigurationUpdatedTimestamp != null)
        'AlarmConfigurationUpdatedTimestamp':
            iso8601ToJson(alarmConfigurationUpdatedTimestamp),
      if (alarmDescription != null) 'AlarmDescription': alarmDescription,
      if (alarmName != null) 'AlarmName': alarmName,
      if (alarmRule != null) 'AlarmRule': alarmRule,
      if (insufficientDataActions != null)
        'InsufficientDataActions': insufficientDataActions,
      if (oKActions != null) 'OKActions': oKActions,
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonData != null) 'StateReasonData': stateReasonData,
      if (stateTransitionedTimestamp != null)
        'StateTransitionedTimestamp': iso8601ToJson(stateTransitionedTimestamp),
      if (stateUpdatedTimestamp != null)
        'StateUpdatedTimestamp': iso8601ToJson(stateUpdatedTimestamp),
      if (stateValue != null) 'StateValue': stateValue.toValue(),
    };
  }
}

/// Represents a specific dashboard.
class DashboardEntry {
  /// The Amazon Resource Name (ARN) of the dashboard.
  final String? dashboardArn;

  /// The name of the dashboard.
  final String? dashboardName;

  /// The time stamp of when the dashboard was last modified, either by an API
  /// call or through the console. This number is expressed as the number of
  /// milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime? lastModified;

  /// The size of the dashboard, in bytes.
  final int? size;

  DashboardEntry({
    this.dashboardArn,
    this.dashboardName,
    this.lastModified,
    this.size,
  });
  factory DashboardEntry.fromXml(_s.XmlElement elem) {
    return DashboardEntry(
      dashboardArn: _s.extractXmlStringValue(elem, 'DashboardArn'),
      dashboardName: _s.extractXmlStringValue(elem, 'DashboardName'),
      lastModified: _s.extractXmlDateTimeValue(elem, 'LastModified'),
      size: _s.extractXmlIntValue(elem, 'Size'),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardName = this.dashboardName;
    final lastModified = this.lastModified;
    final size = this.size;
    return {
      if (dashboardArn != null) 'DashboardArn': dashboardArn,
      if (dashboardName != null) 'DashboardName': dashboardName,
      if (lastModified != null) 'LastModified': iso8601ToJson(lastModified),
      if (size != null) 'Size': size,
    };
  }
}

/// An error or warning for the operation.
class DashboardValidationMessage {
  /// The data path related to the message.
  final String? dataPath;

  /// A message describing the error or warning.
  final String? message;

  DashboardValidationMessage({
    this.dataPath,
    this.message,
  });
  factory DashboardValidationMessage.fromXml(_s.XmlElement elem) {
    return DashboardValidationMessage(
      dataPath: _s.extractXmlStringValue(elem, 'DataPath'),
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final dataPath = this.dataPath;
    final message = this.message;
    return {
      if (dataPath != null) 'DataPath': dataPath,
      if (message != null) 'Message': message,
    };
  }
}

/// Encapsulates the statistical data that CloudWatch computes from metric data.
class Datapoint {
  /// The average of the metric values that correspond to the data point.
  final double? average;

  /// The percentile statistic for the data point.
  final Map<String, double>? extendedStatistics;

  /// The maximum metric value for the data point.
  final double? maximum;

  /// The minimum metric value for the data point.
  final double? minimum;

  /// The number of metric values that contributed to the aggregate value of this
  /// data point.
  final double? sampleCount;

  /// The sum of the metric values for the data point.
  final double? sum;

  /// The time stamp used for the data point.
  final DateTime? timestamp;

  /// The standard unit for the data point.
  final StandardUnit? unit;

  Datapoint({
    this.average,
    this.extendedStatistics,
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
    this.timestamp,
    this.unit,
  });
  factory Datapoint.fromXml(_s.XmlElement elem) {
    return Datapoint(
      average: _s.extractXmlDoubleValue(elem, 'Average'),
      extendedStatistics: Map.fromEntries(
        elem.getElement('ExtendedStatistics')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlDoubleValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      maximum: _s.extractXmlDoubleValue(elem, 'Maximum'),
      minimum: _s.extractXmlDoubleValue(elem, 'Minimum'),
      sampleCount: _s.extractXmlDoubleValue(elem, 'SampleCount'),
      sum: _s.extractXmlDoubleValue(elem, 'Sum'),
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp'),
      unit: _s.extractXmlStringValue(elem, 'Unit')?.toStandardUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final average = this.average;
    final extendedStatistics = this.extendedStatistics;
    final maximum = this.maximum;
    final minimum = this.minimum;
    final sampleCount = this.sampleCount;
    final sum = this.sum;
    final timestamp = this.timestamp;
    final unit = this.unit;
    return {
      if (average != null) 'Average': average,
      if (extendedStatistics != null) 'ExtendedStatistics': extendedStatistics,
      if (maximum != null) 'Maximum': maximum,
      if (minimum != null) 'Minimum': minimum,
      if (sampleCount != null) 'SampleCount': sampleCount,
      if (sum != null) 'Sum': sum,
      if (timestamp != null) 'Timestamp': iso8601ToJson(timestamp),
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

class DeleteAnomalyDetectorOutput {
  DeleteAnomalyDetectorOutput();
  factory DeleteAnomalyDetectorOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteAnomalyDetectorOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDashboardsOutput {
  DeleteDashboardsOutput();
  factory DeleteDashboardsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteDashboardsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInsightRulesOutput {
  /// An array listing the rules that could not be deleted. You cannot delete
  /// built-in rules.
  final List<PartialFailure>? failures;

  DeleteInsightRulesOutput({
    this.failures,
  });
  factory DeleteInsightRulesOutput.fromXml(_s.XmlElement elem) {
    return DeleteInsightRulesOutput(
      failures: _s.extractXmlChild(elem, 'Failures')?.let((elem) =>
          elem.findElements('member').map(PartialFailure.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

class DeleteMetricStreamOutput {
  DeleteMetricStreamOutput();
  factory DeleteMetricStreamOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteMetricStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAlarmHistoryOutput {
  /// The alarm histories, in JSON format.
  final List<AlarmHistoryItem>? alarmHistoryItems;

  /// The token that marks the start of the next batch of returned results.
  final String? nextToken;

  DescribeAlarmHistoryOutput({
    this.alarmHistoryItems,
    this.nextToken,
  });
  factory DescribeAlarmHistoryOutput.fromXml(_s.XmlElement elem) {
    return DescribeAlarmHistoryOutput(
      alarmHistoryItems: _s.extractXmlChild(elem, 'AlarmHistoryItems')?.let(
          (elem) => elem
              .findElements('member')
              .map(AlarmHistoryItem.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final alarmHistoryItems = this.alarmHistoryItems;
    final nextToken = this.nextToken;
    return {
      if (alarmHistoryItems != null) 'AlarmHistoryItems': alarmHistoryItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAlarmsForMetricOutput {
  /// The information for each alarm with the specified metric.
  final List<MetricAlarm>? metricAlarms;

  DescribeAlarmsForMetricOutput({
    this.metricAlarms,
  });
  factory DescribeAlarmsForMetricOutput.fromXml(_s.XmlElement elem) {
    return DescribeAlarmsForMetricOutput(
      metricAlarms: _s.extractXmlChild(elem, 'MetricAlarms')?.let((elem) =>
          elem.findElements('member').map(MetricAlarm.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final metricAlarms = this.metricAlarms;
    return {
      if (metricAlarms != null) 'MetricAlarms': metricAlarms,
    };
  }
}

class DescribeAlarmsOutput {
  /// The information about any composite alarms returned by the operation.
  final List<CompositeAlarm>? compositeAlarms;

  /// The information about any metric alarms returned by the operation.
  final List<MetricAlarm>? metricAlarms;

  /// The token that marks the start of the next batch of returned results.
  final String? nextToken;

  DescribeAlarmsOutput({
    this.compositeAlarms,
    this.metricAlarms,
    this.nextToken,
  });
  factory DescribeAlarmsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAlarmsOutput(
      compositeAlarms: _s.extractXmlChild(elem, 'CompositeAlarms')?.let(
          (elem) =>
              elem.findElements('member').map(CompositeAlarm.fromXml).toList()),
      metricAlarms: _s.extractXmlChild(elem, 'MetricAlarms')?.let((elem) =>
          elem.findElements('member').map(MetricAlarm.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final compositeAlarms = this.compositeAlarms;
    final metricAlarms = this.metricAlarms;
    final nextToken = this.nextToken;
    return {
      if (compositeAlarms != null) 'CompositeAlarms': compositeAlarms,
      if (metricAlarms != null) 'MetricAlarms': metricAlarms,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAnomalyDetectorsOutput {
  /// The list of anomaly detection models returned by the operation.
  final List<AnomalyDetector>? anomalyDetectors;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  DescribeAnomalyDetectorsOutput({
    this.anomalyDetectors,
    this.nextToken,
  });
  factory DescribeAnomalyDetectorsOutput.fromXml(_s.XmlElement elem) {
    return DescribeAnomalyDetectorsOutput(
      anomalyDetectors: _s.extractXmlChild(elem, 'AnomalyDetectors')?.let(
          (elem) => elem
              .findElements('member')
              .map(AnomalyDetector.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectors = this.anomalyDetectors;
    final nextToken = this.nextToken;
    return {
      if (anomalyDetectors != null) 'AnomalyDetectors': anomalyDetectors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeInsightRulesOutput {
  /// The rules returned by the operation.
  final List<InsightRule>? insightRules;

  /// If this parameter is present, it is a token that marks the start of the next
  /// batch of returned results.
  final String? nextToken;

  DescribeInsightRulesOutput({
    this.insightRules,
    this.nextToken,
  });
  factory DescribeInsightRulesOutput.fromXml(_s.XmlElement elem) {
    return DescribeInsightRulesOutput(
      insightRules: _s.extractXmlChild(elem, 'InsightRules')?.let((elem) =>
          elem.findElements('member').map(InsightRule.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final insightRules = this.insightRules;
    final nextToken = this.nextToken;
    return {
      if (insightRules != null) 'InsightRules': insightRules,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A dimension is a name/value pair that is part of the identity of a metric.
/// Because dimensions are part of the unique identifier for a metric, whenever
/// you add a unique name/value pair to one of your metrics, you are creating a
/// new variation of that metric. For example, many Amazon EC2 metrics publish
/// <code>InstanceId</code> as a dimension name, and the actual instance ID as
/// the value for that dimension.
///
/// You can assign up to 30 dimensions to a metric.
class Dimension {
  /// The name of the dimension. Dimension names must contain only ASCII
  /// characters, must include at least one non-whitespace character, and cannot
  /// start with a colon (<code>:</code>). ASCII control characters are not
  /// supported as part of dimension names.
  final String name;

  /// The value of the dimension. Dimension values must contain only ASCII
  /// characters and must include at least one non-whitespace character. ASCII
  /// control characters are not supported as part of dimension values.
  final String value;

  Dimension({
    required this.name,
    required this.value,
  });
  factory Dimension.fromXml(_s.XmlElement elem) {
    return Dimension(
      name: _s.extractXmlStringValue(elem, 'Name')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// Represents filters for a dimension.
class DimensionFilter {
  /// The dimension name to be matched.
  final String name;

  /// The value of the dimension to be matched.
  final String? value;

  DimensionFilter({
    required this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

class DisableInsightRulesOutput {
  /// An array listing the rules that could not be disabled. You cannot disable
  /// built-in rules.
  final List<PartialFailure>? failures;

  DisableInsightRulesOutput({
    this.failures,
  });
  factory DisableInsightRulesOutput.fromXml(_s.XmlElement elem) {
    return DisableInsightRulesOutput(
      failures: _s.extractXmlChild(elem, 'Failures')?.let((elem) =>
          elem.findElements('member').map(PartialFailure.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

class EnableInsightRulesOutput {
  /// An array listing the rules that could not be enabled. You cannot disable or
  /// enable built-in rules.
  final List<PartialFailure>? failures;

  EnableInsightRulesOutput({
    this.failures,
  });
  factory EnableInsightRulesOutput.fromXml(_s.XmlElement elem) {
    return EnableInsightRulesOutput(
      failures: _s.extractXmlChild(elem, 'Failures')?.let((elem) =>
          elem.findElements('member').map(PartialFailure.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

enum EvaluationState {
  partialData,
}

extension EvaluationStateValueExtension on EvaluationState {
  String toValue() {
    switch (this) {
      case EvaluationState.partialData:
        return 'PARTIAL_DATA';
    }
  }
}

extension EvaluationStateFromString on String {
  EvaluationState toEvaluationState() {
    switch (this) {
      case 'PARTIAL_DATA':
        return EvaluationState.partialData;
    }
    throw Exception('$this is not known in enum EvaluationState');
  }
}

class GetDashboardOutput {
  /// The Amazon Resource Name (ARN) of the dashboard.
  final String? dashboardArn;

  /// The detailed information about the dashboard, including what widgets are
  /// included and their location on the dashboard. For more information about the
  /// <code>DashboardBody</code> syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CloudWatch-Dashboard-Body-Structure.html">Dashboard
  /// Body Structure and Syntax</a>.
  final String? dashboardBody;

  /// The name of the dashboard.
  final String? dashboardName;

  GetDashboardOutput({
    this.dashboardArn,
    this.dashboardBody,
    this.dashboardName,
  });
  factory GetDashboardOutput.fromXml(_s.XmlElement elem) {
    return GetDashboardOutput(
      dashboardArn: _s.extractXmlStringValue(elem, 'DashboardArn'),
      dashboardBody: _s.extractXmlStringValue(elem, 'DashboardBody'),
      dashboardName: _s.extractXmlStringValue(elem, 'DashboardName'),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardArn = this.dashboardArn;
    final dashboardBody = this.dashboardBody;
    final dashboardName = this.dashboardName;
    return {
      if (dashboardArn != null) 'DashboardArn': dashboardArn,
      if (dashboardBody != null) 'DashboardBody': dashboardBody,
      if (dashboardName != null) 'DashboardName': dashboardName,
    };
  }
}

class GetInsightRuleReportOutput {
  /// The sum of the values from all individual contributors that match the rule.
  final double? aggregateValue;

  /// Specifies whether this rule aggregates contributor data by COUNT or SUM.
  final String? aggregationStatistic;

  /// An approximate count of the unique contributors found by this rule in this
  /// time period.
  final int? approximateUniqueCount;

  /// An array of the unique contributors found by this rule in this time period.
  /// If the rule contains multiple keys, each combination of values for the keys
  /// counts as a unique contributor.
  final List<InsightRuleContributor>? contributors;

  /// An array of the strings used as the keys for this rule. The keys are the
  /// dimensions used to classify contributors. If the rule contains more than one
  /// key, then each unique combination of values for the keys is counted as a
  /// unique contributor.
  final List<String>? keyLabels;

  /// A time series of metric data points that matches the time period in the rule
  /// request.
  final List<InsightRuleMetricDatapoint>? metricDatapoints;

  GetInsightRuleReportOutput({
    this.aggregateValue,
    this.aggregationStatistic,
    this.approximateUniqueCount,
    this.contributors,
    this.keyLabels,
    this.metricDatapoints,
  });
  factory GetInsightRuleReportOutput.fromXml(_s.XmlElement elem) {
    return GetInsightRuleReportOutput(
      aggregateValue: _s.extractXmlDoubleValue(elem, 'AggregateValue'),
      aggregationStatistic:
          _s.extractXmlStringValue(elem, 'AggregationStatistic'),
      approximateUniqueCount:
          _s.extractXmlIntValue(elem, 'ApproximateUniqueCount'),
      contributors: _s.extractXmlChild(elem, 'Contributors')?.let((elem) => elem
          .findElements('member')
          .map(InsightRuleContributor.fromXml)
          .toList()),
      keyLabels: _s
          .extractXmlChild(elem, 'KeyLabels')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      metricDatapoints: _s.extractXmlChild(elem, 'MetricDatapoints')?.let(
          (elem) => elem
              .findElements('member')
              .map(InsightRuleMetricDatapoint.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateValue = this.aggregateValue;
    final aggregationStatistic = this.aggregationStatistic;
    final approximateUniqueCount = this.approximateUniqueCount;
    final contributors = this.contributors;
    final keyLabels = this.keyLabels;
    final metricDatapoints = this.metricDatapoints;
    return {
      if (aggregateValue != null) 'AggregateValue': aggregateValue,
      if (aggregationStatistic != null)
        'AggregationStatistic': aggregationStatistic,
      if (approximateUniqueCount != null)
        'ApproximateUniqueCount': approximateUniqueCount,
      if (contributors != null) 'Contributors': contributors,
      if (keyLabels != null) 'KeyLabels': keyLabels,
      if (metricDatapoints != null) 'MetricDatapoints': metricDatapoints,
    };
  }
}

class GetMetricDataOutput {
  /// Contains a message about this <code>GetMetricData</code> operation, if the
  /// operation results in such a message. An example of a message that might be
  /// returned is <code>Maximum number of allowed metrics exceeded</code>. If
  /// there is a message, as much of the operation as possible is still executed.
  ///
  /// A message appears here only if it is related to the global
  /// <code>GetMetricData</code> operation. Any message about a specific metric
  /// returned by the operation appears in the <code>MetricDataResult</code>
  /// object returned for that metric.
  final List<MessageData>? messages;

  /// The metrics that are returned, including the metric name, namespace, and
  /// dimensions.
  final List<MetricDataResult>? metricDataResults;

  /// A token that marks the next batch of returned results.
  final String? nextToken;

  GetMetricDataOutput({
    this.messages,
    this.metricDataResults,
    this.nextToken,
  });
  factory GetMetricDataOutput.fromXml(_s.XmlElement elem) {
    return GetMetricDataOutput(
      messages: _s.extractXmlChild(elem, 'Messages')?.let((elem) =>
          elem.findElements('member').map(MessageData.fromXml).toList()),
      metricDataResults: _s.extractXmlChild(elem, 'MetricDataResults')?.let(
          (elem) => elem
              .findElements('member')
              .map(MetricDataResult.fromXml)
              .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final metricDataResults = this.metricDataResults;
    final nextToken = this.nextToken;
    return {
      if (messages != null) 'Messages': messages,
      if (metricDataResults != null) 'MetricDataResults': metricDataResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetMetricStatisticsOutput {
  /// The data points for the specified metric.
  final List<Datapoint>? datapoints;

  /// A label for the specified metric.
  final String? label;

  GetMetricStatisticsOutput({
    this.datapoints,
    this.label,
  });
  factory GetMetricStatisticsOutput.fromXml(_s.XmlElement elem) {
    return GetMetricStatisticsOutput(
      datapoints: _s.extractXmlChild(elem, 'Datapoints')?.let((elem) =>
          elem.findElements('member').map(Datapoint.fromXml).toList()),
      label: _s.extractXmlStringValue(elem, 'Label'),
    );
  }

  Map<String, dynamic> toJson() {
    final datapoints = this.datapoints;
    final label = this.label;
    return {
      if (datapoints != null) 'Datapoints': datapoints,
      if (label != null) 'Label': label,
    };
  }
}

class GetMetricStreamOutput {
  /// The ARN of the metric stream.
  final String? arn;

  /// The date that the metric stream was created.
  final DateTime? creationDate;

  /// If this array of metric namespaces is present, then these namespaces are the
  /// only metric namespaces that are not streamed by this metric stream. In this
  /// case, all other metric namespaces in the account are streamed by this metric
  /// stream.
  final List<MetricStreamFilter>? excludeFilters;

  /// The ARN of the Amazon Kinesis Data Firehose delivery stream that is used by
  /// this metric stream.
  final String? firehoseArn;

  /// If this array of metric namespaces is present, then these namespaces are the
  /// only metric namespaces that are streamed by this metric stream.
  final List<MetricStreamFilter>? includeFilters;

  /// If this is <code>true</code> and this metric stream is in a monitoring
  /// account, then the stream includes metrics from source accounts that the
  /// monitoring account is linked to.
  final bool? includeLinkedAccountsMetrics;

  /// The date of the most recent update to the metric stream's configuration.
  final DateTime? lastUpdateDate;

  /// The name of the metric stream.
  final String? name;

  /// The output format for the stream. Valid values are <code>json</code>,
  /// <code>opentelemetry1.0</code>, and <code>opentelemetry0.7</code>. For more
  /// information about metric stream output formats, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-metric-streams-formats.html">Metric
  /// streams output formats</a>.
  final MetricStreamOutputFormat? outputFormat;

  /// The ARN of the IAM role that is used by this metric stream.
  final String? roleArn;

  /// The state of the metric stream. The possible values are <code>running</code>
  /// and <code>stopped</code>.
  final String? state;

  /// Each entry in this array displays information about one or more metrics that
  /// include additional statistics in the metric stream. For more information
  /// about the additional statistics, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html">
  /// CloudWatch statistics definitions</a>.
  final List<MetricStreamStatisticsConfiguration>? statisticsConfigurations;

  GetMetricStreamOutput({
    this.arn,
    this.creationDate,
    this.excludeFilters,
    this.firehoseArn,
    this.includeFilters,
    this.includeLinkedAccountsMetrics,
    this.lastUpdateDate,
    this.name,
    this.outputFormat,
    this.roleArn,
    this.state,
    this.statisticsConfigurations,
  });
  factory GetMetricStreamOutput.fromXml(_s.XmlElement elem) {
    return GetMetricStreamOutput(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      excludeFilters: _s.extractXmlChild(elem, 'ExcludeFilters')?.let((elem) =>
          elem.findElements('member').map(MetricStreamFilter.fromXml).toList()),
      firehoseArn: _s.extractXmlStringValue(elem, 'FirehoseArn'),
      includeFilters: _s.extractXmlChild(elem, 'IncludeFilters')?.let((elem) =>
          elem.findElements('member').map(MetricStreamFilter.fromXml).toList()),
      includeLinkedAccountsMetrics:
          _s.extractXmlBoolValue(elem, 'IncludeLinkedAccountsMetrics'),
      lastUpdateDate: _s.extractXmlDateTimeValue(elem, 'LastUpdateDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      outputFormat: _s
          .extractXmlStringValue(elem, 'OutputFormat')
          ?.toMetricStreamOutputFormat(),
      roleArn: _s.extractXmlStringValue(elem, 'RoleArn'),
      state: _s.extractXmlStringValue(elem, 'State'),
      statisticsConfigurations: _s
          .extractXmlChild(elem, 'StatisticsConfigurations')
          ?.let((elem) => elem
              .findElements('member')
              .map(MetricStreamStatisticsConfiguration.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final excludeFilters = this.excludeFilters;
    final firehoseArn = this.firehoseArn;
    final includeFilters = this.includeFilters;
    final includeLinkedAccountsMetrics = this.includeLinkedAccountsMetrics;
    final lastUpdateDate = this.lastUpdateDate;
    final name = this.name;
    final outputFormat = this.outputFormat;
    final roleArn = this.roleArn;
    final state = this.state;
    final statisticsConfigurations = this.statisticsConfigurations;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (excludeFilters != null) 'ExcludeFilters': excludeFilters,
      if (firehoseArn != null) 'FirehoseArn': firehoseArn,
      if (includeFilters != null) 'IncludeFilters': includeFilters,
      if (includeLinkedAccountsMetrics != null)
        'IncludeLinkedAccountsMetrics': includeLinkedAccountsMetrics,
      if (lastUpdateDate != null)
        'LastUpdateDate': iso8601ToJson(lastUpdateDate),
      if (name != null) 'Name': name,
      if (outputFormat != null) 'OutputFormat': outputFormat.toValue(),
      if (roleArn != null) 'RoleArn': roleArn,
      if (state != null) 'State': state,
      if (statisticsConfigurations != null)
        'StatisticsConfigurations': statisticsConfigurations,
    };
  }
}

class GetMetricWidgetImageOutput {
  /// The image of the graph, in the output format specified. The output is
  /// base64-encoded.
  final Uint8List? metricWidgetImage;

  GetMetricWidgetImageOutput({
    this.metricWidgetImage,
  });
  factory GetMetricWidgetImageOutput.fromXml(_s.XmlElement elem) {
    return GetMetricWidgetImageOutput(
      metricWidgetImage: _s.extractXmlUint8ListValue(elem, 'MetricWidgetImage'),
    );
  }

  Map<String, dynamic> toJson() {
    final metricWidgetImage = this.metricWidgetImage;
    return {
      if (metricWidgetImage != null)
        'MetricWidgetImage': base64Encode(metricWidgetImage),
    };
  }
}

enum HistoryItemType {
  configurationUpdate,
  stateUpdate,
  action,
}

extension HistoryItemTypeValueExtension on HistoryItemType {
  String toValue() {
    switch (this) {
      case HistoryItemType.configurationUpdate:
        return 'ConfigurationUpdate';
      case HistoryItemType.stateUpdate:
        return 'StateUpdate';
      case HistoryItemType.action:
        return 'Action';
    }
  }
}

extension HistoryItemTypeFromString on String {
  HistoryItemType toHistoryItemType() {
    switch (this) {
      case 'ConfigurationUpdate':
        return HistoryItemType.configurationUpdate;
      case 'StateUpdate':
        return HistoryItemType.stateUpdate;
      case 'Action':
        return HistoryItemType.action;
    }
    throw Exception('$this is not known in enum HistoryItemType');
  }
}

/// This structure contains the definition for a Contributor Insights rule. For
/// more information about this rule, see<a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights.html">
/// Using Constributor Insights to analyze high-cardinality data</a> in the
/// <i>Amazon CloudWatch User Guide</i>.
class InsightRule {
  /// The definition of the rule, as a JSON object. The definition contains the
  /// keywords used to define contributors, the value to aggregate on if this rule
  /// returns a sum instead of a count, and the filters. For details on the valid
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-RuleSyntax.html">Contributor
  /// Insights Rule Syntax</a>.
  final String definition;

  /// The name of the rule.
  final String name;

  /// For rules that you create, this is always <code>{"Name":
  /// "CloudWatchLogRule", "Version": 1}</code>. For managed rules, this is
  /// <code>{"Name": "ServiceLogRule", "Version": 1}</code>
  final String schema;

  /// Indicates whether the rule is enabled or disabled.
  final String state;

  /// An optional built-in rule that Amazon Web Services manages.
  final bool? managedRule;

  InsightRule({
    required this.definition,
    required this.name,
    required this.schema,
    required this.state,
    this.managedRule,
  });
  factory InsightRule.fromXml(_s.XmlElement elem) {
    return InsightRule(
      definition: _s.extractXmlStringValue(elem, 'Definition')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      schema: _s.extractXmlStringValue(elem, 'Schema')!,
      state: _s.extractXmlStringValue(elem, 'State')!,
      managedRule: _s.extractXmlBoolValue(elem, 'ManagedRule'),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final name = this.name;
    final schema = this.schema;
    final state = this.state;
    final managedRule = this.managedRule;
    return {
      'Definition': definition,
      'Name': name,
      'Schema': schema,
      'State': state,
      if (managedRule != null) 'ManagedRule': managedRule,
    };
  }
}

/// One of the unique contributors found by a Contributor Insights rule. If the
/// rule contains multiple keys, then a unique contributor is a unique
/// combination of values from all the keys in the rule.
///
/// If the rule contains a single key, then each unique contributor is each
/// unique value for this key.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html">GetInsightRuleReport</a>.
class InsightRuleContributor {
  /// An approximation of the aggregate value that comes from this contributor.
  final double approximateAggregateValue;

  /// An array of the data points where this contributor is present. Only the data
  /// points when this contributor appeared are included in the array.
  final List<InsightRuleContributorDatapoint> datapoints;

  /// One of the log entry field keywords that is used to define contributors for
  /// this rule.
  final List<String> keys;

  InsightRuleContributor({
    required this.approximateAggregateValue,
    required this.datapoints,
    required this.keys,
  });
  factory InsightRuleContributor.fromXml(_s.XmlElement elem) {
    return InsightRuleContributor(
      approximateAggregateValue:
          _s.extractXmlDoubleValue(elem, 'ApproximateAggregateValue')!,
      datapoints: _s
          .extractXmlChild(elem, 'Datapoints')!
          .findElements('member')
          .map(InsightRuleContributorDatapoint.fromXml)
          .toList(),
      keys: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'Keys')!, 'member'),
    );
  }

  Map<String, dynamic> toJson() {
    final approximateAggregateValue = this.approximateAggregateValue;
    final datapoints = this.datapoints;
    final keys = this.keys;
    return {
      'ApproximateAggregateValue': approximateAggregateValue,
      'Datapoints': datapoints,
      'Keys': keys,
    };
  }
}

/// One data point related to one contributor.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html">GetInsightRuleReport</a>
/// and <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_InsightRuleContributor.html">InsightRuleContributor</a>.
class InsightRuleContributorDatapoint {
  /// The approximate value that this contributor added during this timestamp.
  final double approximateValue;

  /// The timestamp of the data point.
  final DateTime timestamp;

  InsightRuleContributorDatapoint({
    required this.approximateValue,
    required this.timestamp,
  });
  factory InsightRuleContributorDatapoint.fromXml(_s.XmlElement elem) {
    return InsightRuleContributorDatapoint(
      approximateValue: _s.extractXmlDoubleValue(elem, 'ApproximateValue')!,
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateValue = this.approximateValue;
    final timestamp = this.timestamp;
    return {
      'ApproximateValue': approximateValue,
      'Timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// One data point from the metric time series returned in a Contributor
/// Insights rule report.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html">GetInsightRuleReport</a>.
class InsightRuleMetricDatapoint {
  /// The timestamp of the data point.
  final DateTime timestamp;

  /// The average value from all contributors during the time period represented
  /// by that data point.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? average;

  /// The maximum value provided by one contributor during this timestamp. Each
  /// timestamp is evaluated separately, so the identity of the max contributor
  /// could be different for each timestamp.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? maxContributorValue;

  /// The maximum value from a single occurence from a single contributor during
  /// the time period represented by that data point.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? maximum;

  /// The minimum value from a single contributor during the time period
  /// represented by that data point.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? minimum;

  /// The number of occurrences that matched the rule during this data point.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? sampleCount;

  /// The sum of the values from all contributors during the time period
  /// represented by that data point.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? sum;

  /// The number of unique contributors who published data during this timestamp.
  ///
  /// This statistic is returned only if you included it in the
  /// <code>Metrics</code> array in your request.
  final double? uniqueContributors;

  InsightRuleMetricDatapoint({
    required this.timestamp,
    this.average,
    this.maxContributorValue,
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
    this.uniqueContributors,
  });
  factory InsightRuleMetricDatapoint.fromXml(_s.XmlElement elem) {
    return InsightRuleMetricDatapoint(
      timestamp: _s.extractXmlDateTimeValue(elem, 'Timestamp')!,
      average: _s.extractXmlDoubleValue(elem, 'Average'),
      maxContributorValue:
          _s.extractXmlDoubleValue(elem, 'MaxContributorValue'),
      maximum: _s.extractXmlDoubleValue(elem, 'Maximum'),
      minimum: _s.extractXmlDoubleValue(elem, 'Minimum'),
      sampleCount: _s.extractXmlDoubleValue(elem, 'SampleCount'),
      sum: _s.extractXmlDoubleValue(elem, 'Sum'),
      uniqueContributors: _s.extractXmlDoubleValue(elem, 'UniqueContributors'),
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final average = this.average;
    final maxContributorValue = this.maxContributorValue;
    final maximum = this.maximum;
    final minimum = this.minimum;
    final sampleCount = this.sampleCount;
    final sum = this.sum;
    final uniqueContributors = this.uniqueContributors;
    return {
      'Timestamp': iso8601ToJson(timestamp),
      if (average != null) 'Average': average,
      if (maxContributorValue != null)
        'MaxContributorValue': maxContributorValue,
      if (maximum != null) 'Maximum': maximum,
      if (minimum != null) 'Minimum': minimum,
      if (sampleCount != null) 'SampleCount': sampleCount,
      if (sum != null) 'Sum': sum,
      if (uniqueContributors != null) 'UniqueContributors': uniqueContributors,
    };
  }
}

/// This structure includes the <code>Timezone</code> parameter, which you can
/// use to specify your time zone so that the labels that are associated with
/// returned metrics display the correct time for your time zone.
///
/// The <code>Timezone</code> value affects a label only if you have a
/// time-based dynamic expression in the label. For more information about
/// dynamic expressions in labels, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/graph-dynamic-labels.html">Using
/// Dynamic Labels</a>.
class LabelOptions {
  /// The time zone to use for metric data return in this operation. The format is
  /// <code>+</code> or <code>-</code> followed by four digits. The first two
  /// digits indicate the number of hours ahead or behind of UTC, and the final
  /// two digits are the number of minutes. For example, +0130 indicates a time
  /// zone that is 1 hour and 30 minutes ahead of UTC. The default is +0000.
  final String? timezone;

  LabelOptions({
    this.timezone,
  });

  Map<String, dynamic> toJson() {
    final timezone = this.timezone;
    return {
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

class ListDashboardsOutput {
  /// The list of matching dashboards.
  final List<DashboardEntry>? dashboardEntries;

  /// The token that marks the start of the next batch of returned results.
  final String? nextToken;

  ListDashboardsOutput({
    this.dashboardEntries,
    this.nextToken,
  });
  factory ListDashboardsOutput.fromXml(_s.XmlElement elem) {
    return ListDashboardsOutput(
      dashboardEntries: _s.extractXmlChild(elem, 'DashboardEntries')?.let(
          (elem) =>
              elem.findElements('member').map(DashboardEntry.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardEntries = this.dashboardEntries;
    final nextToken = this.nextToken;
    return {
      if (dashboardEntries != null) 'DashboardEntries': dashboardEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListManagedInsightRulesOutput {
  /// The managed rules that are available for the specified Amazon Web Services
  /// resource.
  final List<ManagedRuleDescription>? managedRules;

  /// Include this value to get the next set of rules if the value was returned by
  /// the previous operation.
  final String? nextToken;

  ListManagedInsightRulesOutput({
    this.managedRules,
    this.nextToken,
  });
  factory ListManagedInsightRulesOutput.fromXml(_s.XmlElement elem) {
    return ListManagedInsightRulesOutput(
      managedRules: _s.extractXmlChild(elem, 'ManagedRules')?.let((elem) => elem
          .findElements('member')
          .map(ManagedRuleDescription.fromXml)
          .toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final managedRules = this.managedRules;
    final nextToken = this.nextToken;
    return {
      if (managedRules != null) 'ManagedRules': managedRules,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMetricStreamsOutput {
  /// The array of metric stream information.
  final List<MetricStreamEntry>? entries;

  /// The token that marks the start of the next batch of returned results. You
  /// can use this token in a subsequent operation to get the next batch of
  /// results.
  final String? nextToken;

  ListMetricStreamsOutput({
    this.entries,
    this.nextToken,
  });
  factory ListMetricStreamsOutput.fromXml(_s.XmlElement elem) {
    return ListMetricStreamsOutput(
      entries: _s.extractXmlChild(elem, 'Entries')?.let((elem) =>
          elem.findElements('member').map(MetricStreamEntry.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    final nextToken = this.nextToken;
    return {
      if (entries != null) 'Entries': entries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMetricsOutput {
  /// The metrics that match your request.
  final List<Metric>? metrics;

  /// The token that marks the start of the next batch of returned results.
  final String? nextToken;

  /// If you are using this operation in a monitoring account, this array contains
  /// the account IDs of the source accounts where the metrics in the returned
  /// data are from.
  ///
  /// This field is a 1:1 mapping between each metric that is returned and the ID
  /// of the owning account.
  final List<String>? owningAccounts;

  ListMetricsOutput({
    this.metrics,
    this.nextToken,
    this.owningAccounts,
  });
  factory ListMetricsOutput.fromXml(_s.XmlElement elem) {
    return ListMetricsOutput(
      metrics: _s.extractXmlChild(elem, 'Metrics')?.let(
          (elem) => elem.findElements('member').map(Metric.fromXml).toList()),
      nextToken: _s.extractXmlStringValue(elem, 'NextToken'),
      owningAccounts: _s
          .extractXmlChild(elem, 'OwningAccounts')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final nextToken = this.nextToken;
    final owningAccounts = this.owningAccounts;
    return {
      if (metrics != null) 'Metrics': metrics,
      if (nextToken != null) 'NextToken': nextToken,
      if (owningAccounts != null) 'OwningAccounts': owningAccounts,
    };
  }
}

class ListTagsForResourceOutput {
  /// The list of tag keys and values associated with the resource you specified.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });
  factory ListTagsForResourceOutput.fromXml(_s.XmlElement elem) {
    return ListTagsForResourceOutput(
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the information that's required to enable a managed Contributor
/// Insights rule for an Amazon Web Services resource.
class ManagedRule {
  /// The ARN of an Amazon Web Services resource that has managed Contributor
  /// Insights rules.
  final String resourceARN;

  /// The template name for the managed Contributor Insights rule, as returned by
  /// <code>ListManagedInsightRules</code>.
  final String templateName;

  /// A list of key-value pairs that you can associate with a managed Contributor
  /// Insights rule. You can associate as many as 50 tags with a rule. Tags can
  /// help you organize and categorize your resources. You also can use them to
  /// scope user permissions by granting a user permission to access or change
  /// only the resources that have certain tag values. To associate tags with a
  /// rule, you must have the <code>cloudwatch:TagResource</code> permission in
  /// addition to the <code>cloudwatch:PutInsightRule</code> permission. If you
  /// are using this operation to update an existing Contributor Insights rule,
  /// any tags that you specify in this parameter are ignored. To change the tags
  /// of an existing rule, use <code>TagResource</code>.
  final List<Tag>? tags;

  ManagedRule({
    required this.resourceARN,
    required this.templateName,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final templateName = this.templateName;
    final tags = this.tags;
    return {
      'ResourceARN': resourceARN,
      'TemplateName': templateName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about managed Contributor Insights rules, as returned
/// by <code>ListManagedInsightRules</code>.
class ManagedRuleDescription {
  /// If a managed rule is enabled, this is the ARN for the related Amazon Web
  /// Services resource.
  final String? resourceARN;

  /// Describes the state of a managed rule. If present, it contains information
  /// about the Contributor Insights rule that contains information about the
  /// related Amazon Web Services resource.
  final ManagedRuleState? ruleState;

  /// The template name for the managed rule. Used to enable managed rules using
  /// <code>PutManagedInsightRules</code>.
  final String? templateName;

  ManagedRuleDescription({
    this.resourceARN,
    this.ruleState,
    this.templateName,
  });
  factory ManagedRuleDescription.fromXml(_s.XmlElement elem) {
    return ManagedRuleDescription(
      resourceARN: _s.extractXmlStringValue(elem, 'ResourceARN'),
      ruleState:
          _s.extractXmlChild(elem, 'RuleState')?.let(ManagedRuleState.fromXml),
      templateName: _s.extractXmlStringValue(elem, 'TemplateName'),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceARN = this.resourceARN;
    final ruleState = this.ruleState;
    final templateName = this.templateName;
    return {
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (ruleState != null) 'RuleState': ruleState,
      if (templateName != null) 'TemplateName': templateName,
    };
  }
}

/// The status of a managed Contributor Insights rule.
class ManagedRuleState {
  /// The name of the Contributor Insights rule that contains data for the
  /// specified Amazon Web Services resource.
  final String ruleName;

  /// Indicates whether the rule is enabled or disabled.
  final String state;

  ManagedRuleState({
    required this.ruleName,
    required this.state,
  });
  factory ManagedRuleState.fromXml(_s.XmlElement elem) {
    return ManagedRuleState(
      ruleName: _s.extractXmlStringValue(elem, 'RuleName')!,
      state: _s.extractXmlStringValue(elem, 'State')!,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    final state = this.state;
    return {
      'RuleName': ruleName,
      'State': state,
    };
  }
}

/// A message returned by the <code>GetMetricData</code>API, including a code
/// and a description.
///
/// If a cross-Region <code>GetMetricData</code> operation fails with a code of
/// <code>Forbidden</code> and a value of <code>Authentication too complex to
/// retrieve cross region data</code>, you can correct the problem by running
/// the <code>GetMetricData</code> operation in the same Region where the metric
/// data is.
class MessageData {
  /// The error code or status code associated with the message.
  final String? code;

  /// The message text.
  final String? value;

  MessageData({
    this.code,
    this.value,
  });
  factory MessageData.fromXml(_s.XmlElement elem) {
    return MessageData(
      code: _s.extractXmlStringValue(elem, 'Code'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final value = this.value;
    return {
      if (code != null) 'Code': code,
      if (value != null) 'Value': value,
    };
  }
}

/// Represents a specific metric.
class Metric {
  /// The dimensions for the metric.
  final List<Dimension>? dimensions;

  /// The name of the metric. This is a required field.
  final String? metricName;

  /// The namespace of the metric.
  final String? namespace;

  Metric({
    this.dimensions,
    this.metricName,
    this.namespace,
  });
  factory Metric.fromXml(_s.XmlElement elem) {
    return Metric(
      dimensions: _s.extractXmlChild(elem, 'Dimensions')?.let((elem) =>
          elem.findElements('member').map(Dimension.fromXml).toList()),
      metricName: _s.extractXmlStringValue(elem, 'MetricName'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final metricName = this.metricName;
    final namespace = this.namespace;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

/// The details about a metric alarm.
class MetricAlarm {
  /// Indicates whether actions should be executed during any changes to the alarm
  /// state.
  final bool? actionsEnabled;

  /// The actions to execute when this alarm transitions to the <code>ALARM</code>
  /// state from any other state. Each action is specified as an Amazon Resource
  /// Name (ARN).
  final List<String>? alarmActions;

  /// The Amazon Resource Name (ARN) of the alarm.
  final String? alarmArn;

  /// The time stamp of the last update to the alarm configuration.
  final DateTime? alarmConfigurationUpdatedTimestamp;

  /// The description of the alarm.
  final String? alarmDescription;

  /// The name of the alarm.
  final String? alarmName;

  /// The arithmetic operation to use when comparing the specified statistic and
  /// threshold. The specified statistic value is used as the first operand.
  final ComparisonOperator? comparisonOperator;

  /// The number of data points that must be breaching to trigger the alarm.
  final int? datapointsToAlarm;

  /// The dimensions for the metric associated with the alarm.
  final List<Dimension>? dimensions;

  /// Used only for alarms based on percentiles. If <code>ignore</code>, the alarm
  /// state does not change during periods with too few data points to be
  /// statistically significant. If <code>evaluate</code> or this parameter is not
  /// used, the alarm is always evaluated and possibly changes state no matter how
  /// many data points are available.
  final String? evaluateLowSampleCountPercentile;

  /// The number of periods over which data is compared to the specified
  /// threshold.
  final int? evaluationPeriods;

  /// If the value of this field is <code>PARTIAL_DATA</code>, the alarm is being
  /// evaluated based on only partial data. This happens if the query used for the
  /// alarm returns more than 10,000 metrics. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Metrics_Insights_Alarm.html">Create
  /// alarms on Metrics Insights queries</a>.
  final EvaluationState? evaluationState;

  /// The percentile statistic for the metric associated with the alarm. Specify a
  /// value between p0.0 and p100.
  final String? extendedStatistic;

  /// The actions to execute when this alarm transitions to the
  /// <code>INSUFFICIENT_DATA</code> state from any other state. Each action is
  /// specified as an Amazon Resource Name (ARN).
  final List<String>? insufficientDataActions;

  /// The name of the metric associated with the alarm, if this is an alarm based
  /// on a single metric.
  final String? metricName;

  /// An array of MetricDataQuery structures, used in an alarm based on a metric
  /// math expression. Each structure either retrieves a metric or performs a math
  /// expression. One item in the Metrics array is the math expression that the
  /// alarm watches. This expression by designated by having
  /// <code>ReturnData</code> set to true.
  final List<MetricDataQuery>? metrics;

  /// The namespace of the metric associated with the alarm.
  final String? namespace;

  /// The actions to execute when this alarm transitions to the <code>OK</code>
  /// state from any other state. Each action is specified as an Amazon Resource
  /// Name (ARN).
  final List<String>? oKActions;

  /// The period, in seconds, over which the statistic is applied.
  final int? period;

  /// An explanation for the alarm state, in text format.
  final String? stateReason;

  /// An explanation for the alarm state, in JSON format.
  final String? stateReasonData;

  /// The date and time that the alarm's <code>StateValue</code> most recently
  /// changed.
  final DateTime? stateTransitionedTimestamp;

  /// The time stamp of the last update to the value of either the
  /// <code>StateValue</code> or <code>EvaluationState</code> parameters.
  final DateTime? stateUpdatedTimestamp;

  /// The state value for the alarm.
  final StateValue? stateValue;

  /// The statistic for the metric associated with the alarm, other than
  /// percentile. For percentile statistics, use <code>ExtendedStatistic</code>.
  final Statistic? statistic;

  /// The value to compare with the specified statistic.
  final double? threshold;

  /// In an alarm based on an anomaly detection model, this is the ID of the
  /// <code>ANOMALY_DETECTION_BAND</code> function used as the threshold for the
  /// alarm.
  final String? thresholdMetricId;

  /// Sets how this alarm is to handle missing data points. The valid values are
  /// <code>breaching</code>, <code>notBreaching</code>, <code>ignore</code>, and
  /// <code>missing</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data">Configuring
  /// how CloudWatch alarms treat missing data</a>.
  ///
  /// If this parameter is omitted, the default behavior of <code>missing</code>
  /// is used.
  final String? treatMissingData;

  /// The unit of the metric associated with the alarm.
  final StandardUnit? unit;

  MetricAlarm({
    this.actionsEnabled,
    this.alarmActions,
    this.alarmArn,
    this.alarmConfigurationUpdatedTimestamp,
    this.alarmDescription,
    this.alarmName,
    this.comparisonOperator,
    this.datapointsToAlarm,
    this.dimensions,
    this.evaluateLowSampleCountPercentile,
    this.evaluationPeriods,
    this.evaluationState,
    this.extendedStatistic,
    this.insufficientDataActions,
    this.metricName,
    this.metrics,
    this.namespace,
    this.oKActions,
    this.period,
    this.stateReason,
    this.stateReasonData,
    this.stateTransitionedTimestamp,
    this.stateUpdatedTimestamp,
    this.stateValue,
    this.statistic,
    this.threshold,
    this.thresholdMetricId,
    this.treatMissingData,
    this.unit,
  });
  factory MetricAlarm.fromXml(_s.XmlElement elem) {
    return MetricAlarm(
      actionsEnabled: _s.extractXmlBoolValue(elem, 'ActionsEnabled'),
      alarmActions: _s
          .extractXmlChild(elem, 'AlarmActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      alarmArn: _s.extractXmlStringValue(elem, 'AlarmArn'),
      alarmConfigurationUpdatedTimestamp: _s.extractXmlDateTimeValue(
          elem, 'AlarmConfigurationUpdatedTimestamp'),
      alarmDescription: _s.extractXmlStringValue(elem, 'AlarmDescription'),
      alarmName: _s.extractXmlStringValue(elem, 'AlarmName'),
      comparisonOperator: _s
          .extractXmlStringValue(elem, 'ComparisonOperator')
          ?.toComparisonOperator(),
      datapointsToAlarm: _s.extractXmlIntValue(elem, 'DatapointsToAlarm'),
      dimensions: _s.extractXmlChild(elem, 'Dimensions')?.let((elem) =>
          elem.findElements('member').map(Dimension.fromXml).toList()),
      evaluateLowSampleCountPercentile:
          _s.extractXmlStringValue(elem, 'EvaluateLowSampleCountPercentile'),
      evaluationPeriods: _s.extractXmlIntValue(elem, 'EvaluationPeriods'),
      evaluationState: _s
          .extractXmlStringValue(elem, 'EvaluationState')
          ?.toEvaluationState(),
      extendedStatistic: _s.extractXmlStringValue(elem, 'ExtendedStatistic'),
      insufficientDataActions: _s
          .extractXmlChild(elem, 'InsufficientDataActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      metricName: _s.extractXmlStringValue(elem, 'MetricName'),
      metrics: _s.extractXmlChild(elem, 'Metrics')?.let((elem) =>
          elem.findElements('member').map(MetricDataQuery.fromXml).toList()),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      oKActions: _s
          .extractXmlChild(elem, 'OKActions')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      period: _s.extractXmlIntValue(elem, 'Period'),
      stateReason: _s.extractXmlStringValue(elem, 'StateReason'),
      stateReasonData: _s.extractXmlStringValue(elem, 'StateReasonData'),
      stateTransitionedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'StateTransitionedTimestamp'),
      stateUpdatedTimestamp:
          _s.extractXmlDateTimeValue(elem, 'StateUpdatedTimestamp'),
      stateValue: _s.extractXmlStringValue(elem, 'StateValue')?.toStateValue(),
      statistic: _s.extractXmlStringValue(elem, 'Statistic')?.toStatistic(),
      threshold: _s.extractXmlDoubleValue(elem, 'Threshold'),
      thresholdMetricId: _s.extractXmlStringValue(elem, 'ThresholdMetricId'),
      treatMissingData: _s.extractXmlStringValue(elem, 'TreatMissingData'),
      unit: _s.extractXmlStringValue(elem, 'Unit')?.toStandardUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionsEnabled = this.actionsEnabled;
    final alarmActions = this.alarmActions;
    final alarmArn = this.alarmArn;
    final alarmConfigurationUpdatedTimestamp =
        this.alarmConfigurationUpdatedTimestamp;
    final alarmDescription = this.alarmDescription;
    final alarmName = this.alarmName;
    final comparisonOperator = this.comparisonOperator;
    final datapointsToAlarm = this.datapointsToAlarm;
    final dimensions = this.dimensions;
    final evaluateLowSampleCountPercentile =
        this.evaluateLowSampleCountPercentile;
    final evaluationPeriods = this.evaluationPeriods;
    final evaluationState = this.evaluationState;
    final extendedStatistic = this.extendedStatistic;
    final insufficientDataActions = this.insufficientDataActions;
    final metricName = this.metricName;
    final metrics = this.metrics;
    final namespace = this.namespace;
    final oKActions = this.oKActions;
    final period = this.period;
    final stateReason = this.stateReason;
    final stateReasonData = this.stateReasonData;
    final stateTransitionedTimestamp = this.stateTransitionedTimestamp;
    final stateUpdatedTimestamp = this.stateUpdatedTimestamp;
    final stateValue = this.stateValue;
    final statistic = this.statistic;
    final threshold = this.threshold;
    final thresholdMetricId = this.thresholdMetricId;
    final treatMissingData = this.treatMissingData;
    final unit = this.unit;
    return {
      if (actionsEnabled != null) 'ActionsEnabled': actionsEnabled,
      if (alarmActions != null) 'AlarmActions': alarmActions,
      if (alarmArn != null) 'AlarmArn': alarmArn,
      if (alarmConfigurationUpdatedTimestamp != null)
        'AlarmConfigurationUpdatedTimestamp':
            iso8601ToJson(alarmConfigurationUpdatedTimestamp),
      if (alarmDescription != null) 'AlarmDescription': alarmDescription,
      if (alarmName != null) 'AlarmName': alarmName,
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.toValue(),
      if (datapointsToAlarm != null) 'DatapointsToAlarm': datapointsToAlarm,
      if (dimensions != null) 'Dimensions': dimensions,
      if (evaluateLowSampleCountPercentile != null)
        'EvaluateLowSampleCountPercentile': evaluateLowSampleCountPercentile,
      if (evaluationPeriods != null) 'EvaluationPeriods': evaluationPeriods,
      if (evaluationState != null) 'EvaluationState': evaluationState.toValue(),
      if (extendedStatistic != null) 'ExtendedStatistic': extendedStatistic,
      if (insufficientDataActions != null)
        'InsufficientDataActions': insufficientDataActions,
      if (metricName != null) 'MetricName': metricName,
      if (metrics != null) 'Metrics': metrics,
      if (namespace != null) 'Namespace': namespace,
      if (oKActions != null) 'OKActions': oKActions,
      if (period != null) 'Period': period,
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonData != null) 'StateReasonData': stateReasonData,
      if (stateTransitionedTimestamp != null)
        'StateTransitionedTimestamp': iso8601ToJson(stateTransitionedTimestamp),
      if (stateUpdatedTimestamp != null)
        'StateUpdatedTimestamp': iso8601ToJson(stateUpdatedTimestamp),
      if (stateValue != null) 'StateValue': stateValue.toValue(),
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (threshold != null) 'Threshold': threshold,
      if (thresholdMetricId != null) 'ThresholdMetricId': thresholdMetricId,
      if (treatMissingData != null) 'TreatMissingData': treatMissingData,
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

/// This object includes parameters that you can use to provide information to
/// CloudWatch to help it build more accurate anomaly detection models.
class MetricCharacteristics {
  /// Set this parameter to <code>true</code> if values for this metric
  /// consistently include spikes that should not be considered to be anomalies.
  /// With this set to <code>true</code>, CloudWatch will expect to see spikes
  /// that occurred consistently during the model training period, and won't flag
  /// future similar spikes as anomalies.
  final bool? periodicSpikes;

  MetricCharacteristics({
    this.periodicSpikes,
  });
  factory MetricCharacteristics.fromXml(_s.XmlElement elem) {
    return MetricCharacteristics(
      periodicSpikes: _s.extractXmlBoolValue(elem, 'PeriodicSpikes'),
    );
  }

  Map<String, dynamic> toJson() {
    final periodicSpikes = this.periodicSpikes;
    return {
      if (periodicSpikes != null) 'PeriodicSpikes': periodicSpikes,
    };
  }
}

/// This structure is used in both <code>GetMetricData</code> and
/// <code>PutMetricAlarm</code>. The supported use of this structure is
/// different for those two operations.
///
/// When used in <code>GetMetricData</code>, it indicates the metric data to
/// return, and whether this call is just retrieving a batch set of data for one
/// metric, or is performing a Metrics Insights query or a math expression. A
/// single <code>GetMetricData</code> call can include up to 500
/// <code>MetricDataQuery</code> structures.
///
/// When used in <code>PutMetricAlarm</code>, it enables you to create an alarm
/// based on a metric math expression. Each <code>MetricDataQuery</code> in the
/// array specifies either a metric to retrieve, or a math expression to be
/// performed on retrieved metrics. A single <code>PutMetricAlarm</code> call
/// can include up to 20 <code>MetricDataQuery</code> structures in the array.
/// The 20 structures can include as many as 10 structures that contain a
/// <code>MetricStat</code> parameter to retrieve a metric, and as many as 10
/// structures that contain the <code>Expression</code> parameter to perform a
/// math expression. Of those <code>Expression</code> structures, one must have
/// <code>true</code> as the value for <code>ReturnData</code>. The result of
/// this expression is the value the alarm watches.
///
/// Any expression used in a <code>PutMetricAlarm</code> operation must return a
/// single time series. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric
/// Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.
///
/// Some of the parameters of this structure also have different uses whether
/// you are using this structure in a <code>GetMetricData</code> operation or a
/// <code>PutMetricAlarm</code> operation. These differences are explained in
/// the following parameter list.
class MetricDataQuery {
  /// A short name used to tie this object to the results in the response. This
  /// name must be unique within a single call to <code>GetMetricData</code>. If
  /// you are performing math expressions on this set of data, this name
  /// represents that data and can serve as a variable in the mathematical
  /// expression. The valid characters are letters, numbers, and underscore. The
  /// first character must be a lowercase letter.
  final String id;

  /// The ID of the account where the metrics are located.
  ///
  /// If you are performing a <code>GetMetricData</code> operation in a monitoring
  /// account, use this to specify which account to retrieve this metric from.
  ///
  /// If you are performing a <code>PutMetricAlarm</code> operation, use this to
  /// specify which account contains the metric that the alarm is watching.
  final String? accountId;

  /// This field can contain either a Metrics Insights query, or a metric math
  /// expression to be performed on the returned data. For more information about
  /// Metrics Insights queries, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-metrics-insights-querylanguage">Metrics
  /// Insights query components and syntax</a> in the <i>Amazon CloudWatch User
  /// Guide</i>.
  ///
  /// A math expression can use the <code>Id</code> of the other metrics or
  /// queries to refer to those metrics, and can also use the <code>Id</code> of
  /// other expressions to use the result of those expressions. For more
  /// information about metric math expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/using-metric-math.html#metric-math-syntax">Metric
  /// Math Syntax and Functions</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// Within each MetricDataQuery object, you must specify either
  /// <code>Expression</code> or <code>MetricStat</code> but not both.
  final String? expression;

  /// A human-readable label for this metric or expression. This is especially
  /// useful if this is an expression, so that you know what the value represents.
  /// If the metric or expression is shown in a CloudWatch dashboard widget, the
  /// label is shown. If Label is omitted, CloudWatch generates a default.
  ///
  /// You can put dynamic expressions into a label, so that it is more
  /// descriptive. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/graph-dynamic-labels.html">Using
  /// Dynamic Labels</a>.
  final String? label;

  /// The metric to be returned, along with statistics, period, and units. Use
  /// this parameter only if this object is retrieving a metric and not performing
  /// a math expression on returned data.
  ///
  /// Within one MetricDataQuery object, you must specify either
  /// <code>Expression</code> or <code>MetricStat</code> but not both.
  final MetricStat? metricStat;

  /// The granularity, in seconds, of the returned data points. For metrics with
  /// regular resolution, a period can be as short as one minute (60 seconds) and
  /// must be a multiple of 60. For high-resolution metrics that are collected at
  /// intervals of less than one minute, the period can be 1, 5, 10, 30, 60, or
  /// any multiple of 60. High-resolution metrics are those metrics stored by a
  /// <code>PutMetricData</code> operation that includes a <code>StorageResolution
  /// of 1 second</code>.
  final int? period;

  /// When used in <code>GetMetricData</code>, this option indicates whether to
  /// return the timestamps and raw data values of this metric. If you are
  /// performing this call just to do math expressions and do not also need the
  /// raw data returned, you can specify <code>false</code>. If you omit this, the
  /// default of <code>true</code> is used.
  ///
  /// When used in <code>PutMetricAlarm</code>, specify <code>true</code> for the
  /// one expression result to use as the alarm. For all other metrics and
  /// expressions in the same <code>PutMetricAlarm</code> operation, specify
  /// <code>ReturnData</code> as False.
  final bool? returnData;

  MetricDataQuery({
    required this.id,
    this.accountId,
    this.expression,
    this.label,
    this.metricStat,
    this.period,
    this.returnData,
  });
  factory MetricDataQuery.fromXml(_s.XmlElement elem) {
    return MetricDataQuery(
      id: _s.extractXmlStringValue(elem, 'Id')!,
      accountId: _s.extractXmlStringValue(elem, 'AccountId'),
      expression: _s.extractXmlStringValue(elem, 'Expression'),
      label: _s.extractXmlStringValue(elem, 'Label'),
      metricStat:
          _s.extractXmlChild(elem, 'MetricStat')?.let(MetricStat.fromXml),
      period: _s.extractXmlIntValue(elem, 'Period'),
      returnData: _s.extractXmlBoolValue(elem, 'ReturnData'),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final accountId = this.accountId;
    final expression = this.expression;
    final label = this.label;
    final metricStat = this.metricStat;
    final period = this.period;
    final returnData = this.returnData;
    return {
      'Id': id,
      if (accountId != null) 'AccountId': accountId,
      if (expression != null) 'Expression': expression,
      if (label != null) 'Label': label,
      if (metricStat != null) 'MetricStat': metricStat,
      if (period != null) 'Period': period,
      if (returnData != null) 'ReturnData': returnData,
    };
  }
}

/// A <code>GetMetricData</code> call returns an array of
/// <code>MetricDataResult</code> structures. Each of these structures includes
/// the data points for that metric, along with the timestamps of those data
/// points and other identifying information.
class MetricDataResult {
  /// The short name you specified to represent this metric.
  final String? id;

  /// The human-readable label associated with the data.
  final String? label;

  /// A list of messages with additional information about the data returned.
  final List<MessageData>? messages;

  /// The status of the returned data. <code>Complete</code> indicates that all
  /// data points in the requested time range were returned.
  /// <code>PartialData</code> means that an incomplete set of data points were
  /// returned. You can use the <code>NextToken</code> value that was returned and
  /// repeat your request to get more data points. <code>NextToken</code> is not
  /// returned if you are performing a math expression. <code>InternalError</code>
  /// indicates that an error occurred. Retry your request using
  /// <code>NextToken</code>, if present.
  final StatusCode? statusCode;

  /// The timestamps for the data points, formatted in Unix timestamp format. The
  /// number of timestamps always matches the number of values and the value for
  /// Timestamps[x] is Values[x].
  final List<DateTime>? timestamps;

  /// The data points for the metric corresponding to <code>Timestamps</code>. The
  /// number of values always matches the number of timestamps and the timestamp
  /// for Values[x] is Timestamps[x].
  final List<double>? values;

  MetricDataResult({
    this.id,
    this.label,
    this.messages,
    this.statusCode,
    this.timestamps,
    this.values,
  });
  factory MetricDataResult.fromXml(_s.XmlElement elem) {
    return MetricDataResult(
      id: _s.extractXmlStringValue(elem, 'Id'),
      label: _s.extractXmlStringValue(elem, 'Label'),
      messages: _s.extractXmlChild(elem, 'Messages')?.let((elem) =>
          elem.findElements('member').map(MessageData.fromXml).toList()),
      statusCode: _s.extractXmlStringValue(elem, 'StatusCode')?.toStatusCode(),
      timestamps: _s
          .extractXmlChild(elem, 'Timestamps')
          ?.let((elem) => _s.extractXmlDateTimeListValues(elem, 'member')),
      values: _s
          .extractXmlChild(elem, 'Values')
          ?.let((elem) => _s.extractXmlDoubleListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final label = this.label;
    final messages = this.messages;
    final statusCode = this.statusCode;
    final timestamps = this.timestamps;
    final values = this.values;
    return {
      if (id != null) 'Id': id,
      if (label != null) 'Label': label,
      if (messages != null) 'Messages': messages,
      if (statusCode != null) 'StatusCode': statusCode.toValue(),
      if (timestamps != null)
        'Timestamps': timestamps.map(unixTimestampToJson).toList(),
      if (values != null) 'Values': values,
    };
  }
}

/// Encapsulates the information sent to either create a metric or add new
/// values to be aggregated into an existing metric.
class MetricDatum {
  /// The name of the metric.
  final String metricName;

  /// Array of numbers that is used along with the <code>Values</code> array. Each
  /// number in the <code>Count</code> array is the number of times the
  /// corresponding value in the <code>Values</code> array occurred during the
  /// period.
  ///
  /// If you omit the <code>Counts</code> array, the default of 1 is used as the
  /// value for each count. If you include a <code>Counts</code> array, it must
  /// include the same amount of values as the <code>Values</code> array.
  final List<double>? counts;

  /// The dimensions associated with the metric.
  final List<Dimension>? dimensions;

  /// The statistical values for the metric.
  final StatisticSet? statisticValues;

  /// Valid values are 1 and 60. Setting this to 1 specifies this metric as a
  /// high-resolution metric, so that CloudWatch stores the metric with sub-minute
  /// resolution down to one second. Setting this to 60 specifies this metric as a
  /// regular-resolution metric, which CloudWatch stores at 1-minute resolution.
  /// Currently, high resolution is available only for custom metrics. For more
  /// information about high-resolution metrics, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#high-resolution-metrics">High-Resolution
  /// Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// This field is optional, if you do not specify it the default of 60 is used.
  final int? storageResolution;

  /// The time the metric data was received, expressed as the number of
  /// milliseconds since Jan 1, 1970 00:00:00 UTC.
  final DateTime? timestamp;

  /// When you are using a <code>Put</code> operation, this defines what unit you
  /// want to use when storing the metric.
  ///
  /// In a <code>Get</code> operation, this displays the unit that is used for the
  /// metric.
  final StandardUnit? unit;

  /// The value for the metric.
  ///
  /// Although the parameter accepts numbers of type Double, CloudWatch rejects
  /// values that are either too small or too large. Values must be in the range
  /// of -2^360 to 2^360. In addition, special values (for example, NaN,
  /// +Infinity, -Infinity) are not supported.
  final double? value;

  /// Array of numbers representing the values for the metric during the period.
  /// Each unique value is listed just once in this array, and the corresponding
  /// number in the <code>Counts</code> array specifies the number of times that
  /// value occurred during the period. You can include up to 150 unique values in
  /// each <code>PutMetricData</code> action that specifies a <code>Values</code>
  /// array.
  ///
  /// Although the <code>Values</code> array accepts numbers of type
  /// <code>Double</code>, CloudWatch rejects values that are either too small or
  /// too large. Values must be in the range of -2^360 to 2^360. In addition,
  /// special values (for example, NaN, +Infinity, -Infinity) are not supported.
  final List<double>? values;

  MetricDatum({
    required this.metricName,
    this.counts,
    this.dimensions,
    this.statisticValues,
    this.storageResolution,
    this.timestamp,
    this.unit,
    this.value,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final counts = this.counts;
    final dimensions = this.dimensions;
    final statisticValues = this.statisticValues;
    final storageResolution = this.storageResolution;
    final timestamp = this.timestamp;
    final unit = this.unit;
    final value = this.value;
    final values = this.values;
    return {
      'MetricName': metricName,
      if (counts != null) 'Counts': counts,
      if (dimensions != null) 'Dimensions': dimensions,
      if (statisticValues != null) 'StatisticValues': statisticValues,
      if (storageResolution != null) 'StorageResolution': storageResolution,
      if (timestamp != null) 'Timestamp': iso8601ToJson(timestamp),
      if (unit != null) 'Unit': unit.toValue(),
      if (value != null) 'Value': value,
      if (values != null) 'Values': values,
    };
  }
}

/// Indicates the CloudWatch math expression that provides the time series the
/// anomaly detector uses as input. The designated math expression must return a
/// single time series.
class MetricMathAnomalyDetector {
  /// An array of metric data query structures that enables you to create an
  /// anomaly detector based on the result of a metric math expression. Each item
  /// in <code>MetricDataQueries</code> gets a metric or performs a math
  /// expression. One item in <code>MetricDataQueries</code> is the expression
  /// that provides the time series that the anomaly detector uses as input.
  /// Designate the expression by setting <code>ReturnData</code> to
  /// <code>true</code> for this object in the array. For all other expressions
  /// and metrics, set <code>ReturnData</code> to <code>false</code>. The
  /// designated expression must return a single time series.
  final List<MetricDataQuery>? metricDataQueries;

  MetricMathAnomalyDetector({
    this.metricDataQueries,
  });
  factory MetricMathAnomalyDetector.fromXml(_s.XmlElement elem) {
    return MetricMathAnomalyDetector(
      metricDataQueries: _s.extractXmlChild(elem, 'MetricDataQueries')?.let(
          (elem) => elem
              .findElements('member')
              .map(MetricDataQuery.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final metricDataQueries = this.metricDataQueries;
    return {
      if (metricDataQueries != null) 'MetricDataQueries': metricDataQueries,
    };
  }
}

/// This structure defines the metric to be returned, along with the statistics,
/// period, and units.
class MetricStat {
  /// The metric to return, including the metric name, namespace, and dimensions.
  final Metric metric;

  /// The granularity, in seconds, of the returned data points. For metrics with
  /// regular resolution, a period can be as short as one minute (60 seconds) and
  /// must be a multiple of 60. For high-resolution metrics that are collected at
  /// intervals of less than one minute, the period can be 1, 5, 10, 30, 60, or
  /// any multiple of 60. High-resolution metrics are those metrics stored by a
  /// <code>PutMetricData</code> call that includes a
  /// <code>StorageResolution</code> of 1 second.
  ///
  /// If the <code>StartTime</code> parameter specifies a time stamp that is
  /// greater than 3 hours ago, you must specify the period as follows or no data
  /// points in that time range is returned:
  ///
  /// <ul>
  /// <li>
  /// Start time between 3 hours and 15 days ago - Use a multiple of 60 seconds (1
  /// minute).
  /// </li>
  /// <li>
  /// Start time between 15 and 63 days ago - Use a multiple of 300 seconds (5
  /// minutes).
  /// </li>
  /// <li>
  /// Start time greater than 63 days ago - Use a multiple of 3600 seconds (1
  /// hour).
  /// </li>
  /// </ul>
  final int period;

  /// The statistic to return. It can include any CloudWatch statistic or extended
  /// statistic.
  final String stat;

  /// When you are using a <code>Put</code> operation, this defines what unit you
  /// want to use when storing the metric.
  ///
  /// In a <code>Get</code> operation, if you omit <code>Unit</code> then all data
  /// that was collected with any unit is returned, along with the corresponding
  /// units that were specified when the data was reported to CloudWatch. If you
  /// specify a unit, the operation returns only data that was collected with that
  /// unit specified. If you specify a unit that does not match the data
  /// collected, the results of the operation are null. CloudWatch does not
  /// perform unit conversions.
  final StandardUnit? unit;

  MetricStat({
    required this.metric,
    required this.period,
    required this.stat,
    this.unit,
  });
  factory MetricStat.fromXml(_s.XmlElement elem) {
    return MetricStat(
      metric: Metric.fromXml(_s.extractXmlChild(elem, 'Metric')!),
      period: _s.extractXmlIntValue(elem, 'Period')!,
      stat: _s.extractXmlStringValue(elem, 'Stat')!,
      unit: _s.extractXmlStringValue(elem, 'Unit')?.toStandardUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final period = this.period;
    final stat = this.stat;
    final unit = this.unit;
    return {
      'Metric': metric,
      'Period': period,
      'Stat': stat,
      if (unit != null) 'Unit': unit.toValue(),
    };
  }
}

/// This structure contains the configuration information about one metric
/// stream.
class MetricStreamEntry {
  /// The ARN of the metric stream.
  final String? arn;

  /// The date that the metric stream was originally created.
  final DateTime? creationDate;

  /// The ARN of the Kinesis Firehose devlivery stream that is used for this
  /// metric stream.
  final String? firehoseArn;

  /// The date that the configuration of this metric stream was most recently
  /// updated.
  final DateTime? lastUpdateDate;

  /// The name of the metric stream.
  final String? name;

  /// The output format of this metric stream. Valid values are <code>json</code>,
  /// <code>opentelemetry1.0</code>, and <code>opentelemetry0.7</code>.
  final MetricStreamOutputFormat? outputFormat;

  /// The current state of this stream. Valid values are <code>running</code> and
  /// <code>stopped</code>.
  final String? state;

  MetricStreamEntry({
    this.arn,
    this.creationDate,
    this.firehoseArn,
    this.lastUpdateDate,
    this.name,
    this.outputFormat,
    this.state,
  });
  factory MetricStreamEntry.fromXml(_s.XmlElement elem) {
    return MetricStreamEntry(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      creationDate: _s.extractXmlDateTimeValue(elem, 'CreationDate'),
      firehoseArn: _s.extractXmlStringValue(elem, 'FirehoseArn'),
      lastUpdateDate: _s.extractXmlDateTimeValue(elem, 'LastUpdateDate'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      outputFormat: _s
          .extractXmlStringValue(elem, 'OutputFormat')
          ?.toMetricStreamOutputFormat(),
      state: _s.extractXmlStringValue(elem, 'State'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final firehoseArn = this.firehoseArn;
    final lastUpdateDate = this.lastUpdateDate;
    final name = this.name;
    final outputFormat = this.outputFormat;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (firehoseArn != null) 'FirehoseArn': firehoseArn,
      if (lastUpdateDate != null)
        'LastUpdateDate': iso8601ToJson(lastUpdateDate),
      if (name != null) 'Name': name,
      if (outputFormat != null) 'OutputFormat': outputFormat.toValue(),
      if (state != null) 'State': state,
    };
  }
}

/// This structure contains a metric namespace and optionally, a list of metric
/// names, to either include in a metric stream or exclude from a metric stream.
///
/// A metric stream's filters can include up to 1000 total names. This limit
/// applies to the sum of namespace names and metric names in the filters. For
/// example, this could include 10 metric namespace filters with 99 metrics
/// each, or 20 namespace filters with 49 metrics specified in each filter.
class MetricStreamFilter {
  /// The names of the metrics to either include or exclude from the metric
  /// stream.
  ///
  /// If you omit this parameter, all metrics in the namespace are included or
  /// excluded, depending on whether this filter is specified as an exclude filter
  /// or an include filter.
  ///
  /// Each metric name can contain only ASCII printable characters (ASCII range 32
  /// through 126). Each metric name must contain at least one non-whitespace
  /// character.
  final List<String>? metricNames;

  /// The name of the metric namespace for this filter.
  ///
  /// The namespace can contain only ASCII printable characters (ASCII range 32
  /// through 126). It must contain at least one non-whitespace character.
  final String? namespace;

  MetricStreamFilter({
    this.metricNames,
    this.namespace,
  });
  factory MetricStreamFilter.fromXml(_s.XmlElement elem) {
    return MetricStreamFilter(
      metricNames: _s
          .extractXmlChild(elem, 'MetricNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
    );
  }

  Map<String, dynamic> toJson() {
    final metricNames = this.metricNames;
    final namespace = this.namespace;
    return {
      if (metricNames != null) 'MetricNames': metricNames,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

enum MetricStreamOutputFormat {
  json,
  opentelemetry0_7,
  opentelemetry1_0,
}

extension MetricStreamOutputFormatValueExtension on MetricStreamOutputFormat {
  String toValue() {
    switch (this) {
      case MetricStreamOutputFormat.json:
        return 'json';
      case MetricStreamOutputFormat.opentelemetry0_7:
        return 'opentelemetry0.7';
      case MetricStreamOutputFormat.opentelemetry1_0:
        return 'opentelemetry1.0';
    }
  }
}

extension MetricStreamOutputFormatFromString on String {
  MetricStreamOutputFormat toMetricStreamOutputFormat() {
    switch (this) {
      case 'json':
        return MetricStreamOutputFormat.json;
      case 'opentelemetry0.7':
        return MetricStreamOutputFormat.opentelemetry0_7;
      case 'opentelemetry1.0':
        return MetricStreamOutputFormat.opentelemetry1_0;
    }
    throw Exception('$this is not known in enum MetricStreamOutputFormat');
  }
}

/// By default, a metric stream always sends the <code>MAX</code>,
/// <code>MIN</code>, <code>SUM</code>, and <code>SAMPLECOUNT</code> statistics
/// for each metric that is streamed. This structure contains information for
/// one metric that includes additional statistics in the stream. For more
/// information about statistics, see CloudWatch, listed in <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html">
/// CloudWatch statistics definitions</a>.
class MetricStreamStatisticsConfiguration {
  /// The list of additional statistics that are to be streamed for the metrics
  /// listed in the <code>IncludeMetrics</code> array in this structure. This list
  /// can include as many as 20 statistics.
  ///
  /// If the <code>OutputFormat</code> for the stream is
  /// <code>opentelemetry1.0</code> or <code>opentelemetry0.7</code>, the only
  /// valid values are <code>p<i>??</i> </code> percentile statistics such as
  /// <code>p90</code>, <code>p99</code> and so on.
  ///
  /// If the <code>OutputFormat</code> for the stream is <code>json</code>, the
  /// valid values include the abbreviations for all of the statistics listed in
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html.html">
  /// CloudWatch statistics definitions</a>. For example, this includes
  /// <code>tm98, </code> <code>wm90</code>, <code>PR(:300)</code>, and so on.
  final List<String> additionalStatistics;

  /// An array of metric name and namespace pairs that stream the additional
  /// statistics listed in the value of the <code>AdditionalStatistics</code>
  /// parameter. There can be as many as 100 pairs in the array.
  ///
  /// All metrics that match the combination of metric name and namespace will be
  /// streamed with the additional statistics, no matter their dimensions.
  final List<MetricStreamStatisticsMetric> includeMetrics;

  MetricStreamStatisticsConfiguration({
    required this.additionalStatistics,
    required this.includeMetrics,
  });
  factory MetricStreamStatisticsConfiguration.fromXml(_s.XmlElement elem) {
    return MetricStreamStatisticsConfiguration(
      additionalStatistics: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'AdditionalStatistics')!, 'member'),
      includeMetrics: _s
          .extractXmlChild(elem, 'IncludeMetrics')!
          .findElements('member')
          .map(MetricStreamStatisticsMetric.fromXml)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalStatistics = this.additionalStatistics;
    final includeMetrics = this.includeMetrics;
    return {
      'AdditionalStatistics': additionalStatistics,
      'IncludeMetrics': includeMetrics,
    };
  }
}

/// This object contains the information for one metric that is to be streamed
/// with additional statistics.
class MetricStreamStatisticsMetric {
  /// The name of the metric.
  final String metricName;

  /// The namespace of the metric.
  final String namespace;

  MetricStreamStatisticsMetric({
    required this.metricName,
    required this.namespace,
  });
  factory MetricStreamStatisticsMetric.fromXml(_s.XmlElement elem) {
    return MetricStreamStatisticsMetric(
      metricName: _s.extractXmlStringValue(elem, 'MetricName')!,
      namespace: _s.extractXmlStringValue(elem, 'Namespace')!,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final namespace = this.namespace;
    return {
      'MetricName': metricName,
      'Namespace': namespace,
    };
  }
}

/// This array is empty if the API operation was successful for all the rules
/// specified in the request. If the operation could not process one of the
/// rules, the following data is returned for each of those rules.
class PartialFailure {
  /// The type of error.
  final String? exceptionType;

  /// The code of the error.
  final String? failureCode;

  /// A description of the error.
  final String? failureDescription;

  /// The specified rule that could not be deleted.
  final String? failureResource;

  PartialFailure({
    this.exceptionType,
    this.failureCode,
    this.failureDescription,
    this.failureResource,
  });
  factory PartialFailure.fromXml(_s.XmlElement elem) {
    return PartialFailure(
      exceptionType: _s.extractXmlStringValue(elem, 'ExceptionType'),
      failureCode: _s.extractXmlStringValue(elem, 'FailureCode'),
      failureDescription: _s.extractXmlStringValue(elem, 'FailureDescription'),
      failureResource: _s.extractXmlStringValue(elem, 'FailureResource'),
    );
  }

  Map<String, dynamic> toJson() {
    final exceptionType = this.exceptionType;
    final failureCode = this.failureCode;
    final failureDescription = this.failureDescription;
    final failureResource = this.failureResource;
    return {
      if (exceptionType != null) 'ExceptionType': exceptionType,
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureDescription != null) 'FailureDescription': failureDescription,
      if (failureResource != null) 'FailureResource': failureResource,
    };
  }
}

class PutAnomalyDetectorOutput {
  PutAnomalyDetectorOutput();
  factory PutAnomalyDetectorOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutAnomalyDetectorOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutDashboardOutput {
  /// If the input for <code>PutDashboard</code> was correct and the dashboard was
  /// successfully created or modified, this result is empty.
  ///
  /// If this result includes only warning messages, then the input was valid
  /// enough for the dashboard to be created or modified, but some elements of the
  /// dashboard might not render.
  ///
  /// If this result includes error messages, the input was not valid and the
  /// operation failed.
  final List<DashboardValidationMessage>? dashboardValidationMessages;

  PutDashboardOutput({
    this.dashboardValidationMessages,
  });
  factory PutDashboardOutput.fromXml(_s.XmlElement elem) {
    return PutDashboardOutput(
      dashboardValidationMessages: _s
          .extractXmlChild(elem, 'DashboardValidationMessages')
          ?.let((elem) => elem
              .findElements('member')
              .map(DashboardValidationMessage.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final dashboardValidationMessages = this.dashboardValidationMessages;
    return {
      if (dashboardValidationMessages != null)
        'DashboardValidationMessages': dashboardValidationMessages,
    };
  }
}

class PutInsightRuleOutput {
  PutInsightRuleOutput();
  factory PutInsightRuleOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return PutInsightRuleOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutManagedInsightRulesOutput {
  /// An array that lists the rules that could not be enabled.
  final List<PartialFailure>? failures;

  PutManagedInsightRulesOutput({
    this.failures,
  });
  factory PutManagedInsightRulesOutput.fromXml(_s.XmlElement elem) {
    return PutManagedInsightRulesOutput(
      failures: _s.extractXmlChild(elem, 'Failures')?.let((elem) =>
          elem.findElements('member').map(PartialFailure.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    return {
      if (failures != null) 'Failures': failures,
    };
  }
}

class PutMetricStreamOutput {
  /// The ARN of the metric stream.
  final String? arn;

  PutMetricStreamOutput({
    this.arn,
  });
  factory PutMetricStreamOutput.fromXml(_s.XmlElement elem) {
    return PutMetricStreamOutput(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// Specifies one range of days or times to exclude from use for training an
/// anomaly detection model.
class Range {
  /// The end time of the range to exclude. The format is
  /// <code>yyyy-MM-dd'T'HH:mm:ss</code>. For example,
  /// <code>2019-07-01T23:59:59</code>.
  final DateTime endTime;

  /// The start time of the range to exclude. The format is
  /// <code>yyyy-MM-dd'T'HH:mm:ss</code>. For example,
  /// <code>2019-07-01T23:59:59</code>.
  final DateTime startTime;

  Range({
    required this.endTime,
    required this.startTime,
  });
  factory Range.fromXml(_s.XmlElement elem) {
    return Range(
      endTime: _s.extractXmlDateTimeValue(elem, 'EndTime')!,
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime')!,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': iso8601ToJson(endTime),
      'StartTime': iso8601ToJson(startTime),
    };
  }
}

enum RecentlyActive {
  pt3h,
}

extension RecentlyActiveValueExtension on RecentlyActive {
  String toValue() {
    switch (this) {
      case RecentlyActive.pt3h:
        return 'PT3H';
    }
  }
}

extension RecentlyActiveFromString on String {
  RecentlyActive toRecentlyActive() {
    switch (this) {
      case 'PT3H':
        return RecentlyActive.pt3h;
    }
    throw Exception('$this is not known in enum RecentlyActive');
  }
}

enum ScanBy {
  timestampDescending,
  timestampAscending,
}

extension ScanByValueExtension on ScanBy {
  String toValue() {
    switch (this) {
      case ScanBy.timestampDescending:
        return 'TimestampDescending';
      case ScanBy.timestampAscending:
        return 'TimestampAscending';
    }
  }
}

extension ScanByFromString on String {
  ScanBy toScanBy() {
    switch (this) {
      case 'TimestampDescending':
        return ScanBy.timestampDescending;
      case 'TimestampAscending':
        return ScanBy.timestampAscending;
    }
    throw Exception('$this is not known in enum ScanBy');
  }
}

/// Designates the CloudWatch metric and statistic that provides the time series
/// the anomaly detector uses as input. If you have enabled unified
/// cross-account observability, and this account is a monitoring account, the
/// metric can be in the same account or a source account.
class SingleMetricAnomalyDetector {
  /// If the CloudWatch metric that provides the time series that the anomaly
  /// detector uses as input is in another account, specify that account ID here.
  /// If you omit this parameter, the current account is used.
  final String? accountId;

  /// The metric dimensions to create the anomaly detection model for.
  final List<Dimension>? dimensions;

  /// The name of the metric to create the anomaly detection model for.
  final String? metricName;

  /// The namespace of the metric to create the anomaly detection model for.
  final String? namespace;

  /// The statistic to use for the metric and anomaly detection model.
  final String? stat;

  SingleMetricAnomalyDetector({
    this.accountId,
    this.dimensions,
    this.metricName,
    this.namespace,
    this.stat,
  });
  factory SingleMetricAnomalyDetector.fromXml(_s.XmlElement elem) {
    return SingleMetricAnomalyDetector(
      accountId: _s.extractXmlStringValue(elem, 'AccountId'),
      dimensions: _s.extractXmlChild(elem, 'Dimensions')?.let((elem) =>
          elem.findElements('member').map(Dimension.fromXml).toList()),
      metricName: _s.extractXmlStringValue(elem, 'MetricName'),
      namespace: _s.extractXmlStringValue(elem, 'Namespace'),
      stat: _s.extractXmlStringValue(elem, 'Stat'),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final dimensions = this.dimensions;
    final metricName = this.metricName;
    final namespace = this.namespace;
    final stat = this.stat;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
      if (stat != null) 'Stat': stat,
    };
  }
}

enum StandardUnit {
  seconds,
  microseconds,
  milliseconds,
  bytes,
  kilobytes,
  megabytes,
  gigabytes,
  terabytes,
  bits,
  kilobits,
  megabits,
  gigabits,
  terabits,
  percent,
  count,
  bytesSecond,
  kilobytesSecond,
  megabytesSecond,
  gigabytesSecond,
  terabytesSecond,
  bitsSecond,
  kilobitsSecond,
  megabitsSecond,
  gigabitsSecond,
  terabitsSecond,
  countSecond,
  none,
}

extension StandardUnitValueExtension on StandardUnit {
  String toValue() {
    switch (this) {
      case StandardUnit.seconds:
        return 'Seconds';
      case StandardUnit.microseconds:
        return 'Microseconds';
      case StandardUnit.milliseconds:
        return 'Milliseconds';
      case StandardUnit.bytes:
        return 'Bytes';
      case StandardUnit.kilobytes:
        return 'Kilobytes';
      case StandardUnit.megabytes:
        return 'Megabytes';
      case StandardUnit.gigabytes:
        return 'Gigabytes';
      case StandardUnit.terabytes:
        return 'Terabytes';
      case StandardUnit.bits:
        return 'Bits';
      case StandardUnit.kilobits:
        return 'Kilobits';
      case StandardUnit.megabits:
        return 'Megabits';
      case StandardUnit.gigabits:
        return 'Gigabits';
      case StandardUnit.terabits:
        return 'Terabits';
      case StandardUnit.percent:
        return 'Percent';
      case StandardUnit.count:
        return 'Count';
      case StandardUnit.bytesSecond:
        return 'Bytes/Second';
      case StandardUnit.kilobytesSecond:
        return 'Kilobytes/Second';
      case StandardUnit.megabytesSecond:
        return 'Megabytes/Second';
      case StandardUnit.gigabytesSecond:
        return 'Gigabytes/Second';
      case StandardUnit.terabytesSecond:
        return 'Terabytes/Second';
      case StandardUnit.bitsSecond:
        return 'Bits/Second';
      case StandardUnit.kilobitsSecond:
        return 'Kilobits/Second';
      case StandardUnit.megabitsSecond:
        return 'Megabits/Second';
      case StandardUnit.gigabitsSecond:
        return 'Gigabits/Second';
      case StandardUnit.terabitsSecond:
        return 'Terabits/Second';
      case StandardUnit.countSecond:
        return 'Count/Second';
      case StandardUnit.none:
        return 'None';
    }
  }
}

extension StandardUnitFromString on String {
  StandardUnit toStandardUnit() {
    switch (this) {
      case 'Seconds':
        return StandardUnit.seconds;
      case 'Microseconds':
        return StandardUnit.microseconds;
      case 'Milliseconds':
        return StandardUnit.milliseconds;
      case 'Bytes':
        return StandardUnit.bytes;
      case 'Kilobytes':
        return StandardUnit.kilobytes;
      case 'Megabytes':
        return StandardUnit.megabytes;
      case 'Gigabytes':
        return StandardUnit.gigabytes;
      case 'Terabytes':
        return StandardUnit.terabytes;
      case 'Bits':
        return StandardUnit.bits;
      case 'Kilobits':
        return StandardUnit.kilobits;
      case 'Megabits':
        return StandardUnit.megabits;
      case 'Gigabits':
        return StandardUnit.gigabits;
      case 'Terabits':
        return StandardUnit.terabits;
      case 'Percent':
        return StandardUnit.percent;
      case 'Count':
        return StandardUnit.count;
      case 'Bytes/Second':
        return StandardUnit.bytesSecond;
      case 'Kilobytes/Second':
        return StandardUnit.kilobytesSecond;
      case 'Megabytes/Second':
        return StandardUnit.megabytesSecond;
      case 'Gigabytes/Second':
        return StandardUnit.gigabytesSecond;
      case 'Terabytes/Second':
        return StandardUnit.terabytesSecond;
      case 'Bits/Second':
        return StandardUnit.bitsSecond;
      case 'Kilobits/Second':
        return StandardUnit.kilobitsSecond;
      case 'Megabits/Second':
        return StandardUnit.megabitsSecond;
      case 'Gigabits/Second':
        return StandardUnit.gigabitsSecond;
      case 'Terabits/Second':
        return StandardUnit.terabitsSecond;
      case 'Count/Second':
        return StandardUnit.countSecond;
      case 'None':
        return StandardUnit.none;
    }
    throw Exception('$this is not known in enum StandardUnit');
  }
}

class StartMetricStreamsOutput {
  StartMetricStreamsOutput();
  factory StartMetricStreamsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return StartMetricStreamsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum StateValue {
  ok,
  alarm,
  insufficientData,
}

extension StateValueValueExtension on StateValue {
  String toValue() {
    switch (this) {
      case StateValue.ok:
        return 'OK';
      case StateValue.alarm:
        return 'ALARM';
      case StateValue.insufficientData:
        return 'INSUFFICIENT_DATA';
    }
  }
}

extension StateValueFromString on String {
  StateValue toStateValue() {
    switch (this) {
      case 'OK':
        return StateValue.ok;
      case 'ALARM':
        return StateValue.alarm;
      case 'INSUFFICIENT_DATA':
        return StateValue.insufficientData;
    }
    throw Exception('$this is not known in enum StateValue');
  }
}

enum Statistic {
  sampleCount,
  average,
  sum,
  minimum,
  maximum,
}

extension StatisticValueExtension on Statistic {
  String toValue() {
    switch (this) {
      case Statistic.sampleCount:
        return 'SampleCount';
      case Statistic.average:
        return 'Average';
      case Statistic.sum:
        return 'Sum';
      case Statistic.minimum:
        return 'Minimum';
      case Statistic.maximum:
        return 'Maximum';
    }
  }
}

extension StatisticFromString on String {
  Statistic toStatistic() {
    switch (this) {
      case 'SampleCount':
        return Statistic.sampleCount;
      case 'Average':
        return Statistic.average;
      case 'Sum':
        return Statistic.sum;
      case 'Minimum':
        return Statistic.minimum;
      case 'Maximum':
        return Statistic.maximum;
    }
    throw Exception('$this is not known in enum Statistic');
  }
}

/// Represents a set of statistics that describes a specific metric.
class StatisticSet {
  /// The maximum value of the sample set.
  final double maximum;

  /// The minimum value of the sample set.
  final double minimum;

  /// The number of samples used for the statistic set.
  final double sampleCount;

  /// The sum of values for the sample set.
  final double sum;

  StatisticSet({
    required this.maximum,
    required this.minimum,
    required this.sampleCount,
    required this.sum,
  });

  Map<String, dynamic> toJson() {
    final maximum = this.maximum;
    final minimum = this.minimum;
    final sampleCount = this.sampleCount;
    final sum = this.sum;
    return {
      'Maximum': maximum,
      'Minimum': minimum,
      'SampleCount': sampleCount,
      'Sum': sum,
    };
  }
}

enum StatusCode {
  complete,
  internalError,
  partialData,
  forbidden,
}

extension StatusCodeValueExtension on StatusCode {
  String toValue() {
    switch (this) {
      case StatusCode.complete:
        return 'Complete';
      case StatusCode.internalError:
        return 'InternalError';
      case StatusCode.partialData:
        return 'PartialData';
      case StatusCode.forbidden:
        return 'Forbidden';
    }
  }
}

extension StatusCodeFromString on String {
  StatusCode toStatusCode() {
    switch (this) {
      case 'Complete':
        return StatusCode.complete;
      case 'InternalError':
        return StatusCode.internalError;
      case 'PartialData':
        return StatusCode.partialData;
      case 'Forbidden':
        return StatusCode.forbidden;
    }
    throw Exception('$this is not known in enum StatusCode');
  }
}

class StopMetricStreamsOutput {
  StopMetricStreamsOutput();
  factory StopMetricStreamsOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return StopMetricStreamsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A key-value pair associated with a CloudWatch resource.
class Tag {
  /// A string that you can use to assign a value. The combination of tag keys and
  /// values can help you organize and categorize your resources.
  final String key;

  /// The value for the specified tag key.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();
  factory TagResourceOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();
  factory UntagResourceOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DashboardInvalidInputError extends _s.GenericAwsException {
  DashboardInvalidInputError({String? type, String? message})
      : super(type: type, code: 'DashboardInvalidInputError', message: message);
}

class DashboardNotFoundError extends _s.GenericAwsException {
  DashboardNotFoundError({String? type, String? message})
      : super(type: type, code: 'DashboardNotFoundError', message: message);
}

class InternalServiceFault extends _s.GenericAwsException {
  InternalServiceFault({String? type, String? message})
      : super(type: type, code: 'InternalServiceFault', message: message);
}

class InvalidFormatFault extends _s.GenericAwsException {
  InvalidFormatFault({String? type, String? message})
      : super(type: type, code: 'InvalidFormatFault', message: message);
}

class InvalidNextToken extends _s.GenericAwsException {
  InvalidNextToken({String? type, String? message})
      : super(type: type, code: 'InvalidNextToken', message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class LimitExceededFault extends _s.GenericAwsException {
  LimitExceededFault({String? type, String? message})
      : super(type: type, code: 'LimitExceededFault', message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

class ResourceNotFound extends _s.GenericAwsException {
  ResourceNotFound({String? type, String? message})
      : super(type: type, code: 'ResourceNotFound', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'DashboardInvalidInputError': (type, message) =>
      DashboardInvalidInputError(type: type, message: message),
  'DashboardNotFoundError': (type, message) =>
      DashboardNotFoundError(type: type, message: message),
  'InternalServiceFault': (type, message) =>
      InternalServiceFault(type: type, message: message),
  'InvalidFormatFault': (type, message) =>
      InvalidFormatFault(type: type, message: message),
  'InvalidNextToken': (type, message) =>
      InvalidNextToken(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'LimitExceededFault': (type, message) =>
      LimitExceededFault(type: type, message: message),
  'MissingRequiredParameterException': (type, message) =>
      MissingRequiredParameterException(type: type, message: message),
  'ResourceNotFound': (type, message) =>
      ResourceNotFound(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
