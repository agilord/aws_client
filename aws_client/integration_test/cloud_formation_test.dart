import 'dart:convert';

import 'package:aws_client/cloud_formation.dart';
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

  test('CloudFormation (query): stack status deserializes as an enum',
      () async {
    final stackName = uniqueName('stack');
    final template = jsonEncode({
      'Resources': {
        'SmokeTopic': {'Type': 'AWS::SNS::Topic', 'Properties': {}},
      },
    });

    await cfn.createStack(stackName: stackName, templateBody: template);

    final described = await cfn.describeStacks(stackName: stackName);
    final stack = described.stacks!.single;
    expect(
      stack.stackStatus,
      anyOf(StackStatus.createComplete, StackStatus.createInProgress),
    );

    final filtered = await cfn.listStacks(
      stackStatusFilter: [
        StackStatus.createComplete,
        StackStatus.createInProgress,
      ],
    );
    expect(
      filtered.stackSummaries!.map((s) => s.stackName),
      contains(stackName),
    );
    expect(
      filtered.stackSummaries!.map((s) => s.stackStatus),
      everyElement(isNotNull),
    );

    await cfn.deleteStack(stackName: stackName);
  });

  test('CloudFormation (query): list stack resources reports status enum',
      () async {
    final stackName = uniqueName('stack');
    final template = jsonEncode({
      'Resources': {
        'SmokeTopic': {'Type': 'AWS::SNS::Topic', 'Properties': {}},
      },
    });
    await cfn.createStack(stackName: stackName, templateBody: template);

    final resources = await cfn.listStackResources(stackName: stackName);
    final topic = resources.stackResourceSummaries!.single;
    expect(topic.logicalResourceId, equals('SmokeTopic'));
    expect(ResourceStatus.values, contains(topic.resourceStatus));

    await cfn.deleteStack(stackName: stackName);
  });

  test('CloudFormation (query): validateTemplate echoes parameters', () async {
    final template = jsonEncode({
      'Parameters': {
        'TopicName': {'Type': 'String', 'Default': 'smoke'},
      },
      'Resources': {
        'SmokeTopic': {
          'Type': 'AWS::SNS::Topic',
          'Properties': {
            'TopicName': {'Ref': 'TopicName'}
          },
        },
      },
    });

    final validated = await cfn.validateTemplate(templateBody: template);
    expect(
      validated.parameters!.map((p) => p.parameterKey),
      contains('TopicName'),
    );
  });
}
