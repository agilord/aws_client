import 'dart:convert';

import 'package:aws_client/cloud_formation_2010_05_15.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late CloudFormation cfn;

  setUp(() => cfn = localClient(CloudFormation.new));
  tearDown(() => cfn.close());

  test('CloudFormation (query): create, describe and delete a stack', () async {
    final stackName = uniqueName('stack');
    final template = jsonEncode({
      'Resources': {
        'SmokeTopic': {'Type': 'AWS::SNS::Topic', 'Properties': {}},
      },
    });

    final created = await cfn.createStack(
      stackName: stackName,
      templateBody: template,
    );
    expect(created.stackId, isNotNull);

    final described = await cfn.describeStacks(stackName: stackName);
    expect(described.stacks!.single.stackName, equals(stackName));
    expect(described.stacks!.single.stackStatus, isNotNull);

    final listed = await cfn.listStacks();
    expect(
      listed.stackSummaries!.map((s) => s.stackName),
      contains(stackName),
    );

    await cfn.deleteStack(stackName: stackName);
  });
}
