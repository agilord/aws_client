import 'package:aws_client/cloud_watch_2010_08_01.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late CloudWatch cloudWatch;

  setUp(() => cloudWatch = localClient(CloudWatch.new));

  tearDown(() => cloudWatch.close());

  test('CloudWatch (query): put metric data, then list metrics', () async {
    final namespace = 'Smoke/${DateTime.now().millisecondsSinceEpoch}';

    await cloudWatch.putMetricData(
      namespace: namespace,
      metricData: [
        MetricDatum(
          metricName: 'RequestCount',
          value: 42.5,
          unit: StandardUnit.count,
          timestamp: DateTime.now().toUtc(),
        ),
      ],
    );

    final listed = await cloudWatch.listMetrics(namespace: namespace);
    final names = (listed.metrics ?? []).map((m) => m.metricName);
    expect(names, contains('RequestCount'));
  });

  test('CloudWatch (query): put an alarm then describe it back', () async {
    final namespace = 'Smoke/${DateTime.now().millisecondsSinceEpoch}';
    final alarmName = uniqueName('alarm');

    await cloudWatch.putMetricAlarm(
      alarmName: alarmName,
      namespace: namespace,
      metricName: 'RequestCount',
      comparisonOperator: ComparisonOperator.greaterThanThreshold,
      statistic: Statistic.average,
      threshold: 100,
      period: 60,
      evaluationPeriods: 1,
      alarmDescription: 'smoke-test alarm',
    );

    final described = await cloudWatch.describeAlarms(alarmNames: [alarmName]);
    final alarm = described.metricAlarms!.single;
    expect(alarm.alarmName, equals(alarmName));
    expect(alarm.threshold, equals(100));
    expect(
      alarm.comparisonOperator,
      equals(ComparisonOperator.greaterThanThreshold),
    );

    await cloudWatch.deleteAlarms(alarmNames: [alarmName]);
  });

  test('CloudWatch (query): getMetricStatistics aggregates datapoints',
      () async {
    final namespace = 'Smoke/${DateTime.now().millisecondsSinceEpoch}';
    final start = DateTime.now().toUtc().subtract(const Duration(minutes: 5));

    await cloudWatch.putMetricData(
      namespace: namespace,
      metricData: [
        MetricDatum(
          metricName: 'Latency',
          value: 10,
          unit: StandardUnit.milliseconds,
          timestamp: DateTime.now().toUtc(),
        ),
        MetricDatum(
          metricName: 'Latency',
          value: 20,
          unit: StandardUnit.milliseconds,
          timestamp: DateTime.now().toUtc(),
        ),
      ],
    );

    final stats = await cloudWatch.getMetricStatistics(
      namespace: namespace,
      metricName: 'Latency',
      startTime: start,
      endTime: DateTime.now().toUtc().add(const Duration(minutes: 1)),
      period: 60,
      statistics: [Statistic.sum, Statistic.average],
    );
    expect(stats.label, equals('Latency'));
    expect(stats.datapoints, isNotEmpty);
  });
}
