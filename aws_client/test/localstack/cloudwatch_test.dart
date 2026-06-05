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
}
