import 'package:aws_client/redshift.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Redshift redshift;

  setUp(() => redshift = localClient(Redshift.new));
  tearDown(() => redshift.close());

  test('Redshift (query): describe clusters returns an empty list', () async {
    final clusters = await redshift.describeClusters();
    expect(clusters.clusters ?? [], isEmpty);
  });

  test('Redshift (query): create then describe a cluster parameter group',
      () async {
    final groupName = uniqueName('pg');

    final created = await redshift.createClusterParameterGroup(
      parameterGroupName: groupName,
      parameterGroupFamily: 'redshift-1.0',
      description: 'smoke-test parameter group',
    );
    expect(
      created.clusterParameterGroup!.parameterGroupName,
      equals(groupName),
    );

    final described = await redshift.describeClusterParameterGroups(
      parameterGroupName: groupName,
    );
    expect(
      described.parameterGroups!.map((g) => g.parameterGroupName),
      contains(groupName),
    );

    await redshift.deleteClusterParameterGroup(parameterGroupName: groupName);
  });

  test('Redshift (query): describe cluster subnet groups', () async {
    final groups = await redshift.describeClusterSubnetGroups();
    expect(groups.clusterSubnetGroups ?? [], isEmpty);
  });
}
