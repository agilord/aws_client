import 'dart:convert';

import 'package:aws_client/sfn.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Sfn sfn;

  setUp(() => sfn = localClient(Sfn.new));
  tearDown(() => sfn.close());

  test('StepFunctions (json): create machine, run an execution, read result',
      () async {
    final definition = jsonEncode({
      'Comment': 'smoke-test pass state',
      'StartAt': 'Echo',
      'States': {
        'Echo': {
          'Type': 'Pass',
          'Result': {'ok': true},
          'End': true
        },
      },
    });

    final machine = await sfn.createStateMachine(
      name: uniqueName('machine'),
      definition: definition,
      roleArn: 'arn:aws:iam::000000000000:role/smoke-role',
    );
    final machineArn = machine.stateMachineArn;

    final execution = await sfn.startExecution(
      stateMachineArn: machineArn,
      input: jsonEncode({'hello': 'world'}),
    );

    final described = await sfn.describeExecution(
      executionArn: execution.executionArn,
    );
    expect(described.stateMachineArn, equals(machineArn));
    expect(
      described.status,
      anyOf(ExecutionStatus.running, ExecutionStatus.succeeded),
    );

    await sfn.deleteStateMachine(stateMachineArn: machineArn);
  });

  test('StepFunctions (json): describeStateMachine reports type and status',
      () async {
    final definition = jsonEncode({
      'StartAt': 'Echo',
      'States': {
        'Echo': {'Type': 'Pass', 'End': true},
      },
    });

    final machine = await sfn.createStateMachine(
      name: uniqueName('machine'),
      definition: definition,
      roleArn: 'arn:aws:iam::000000000000:role/smoke-role',
      type: StateMachineType.standard,
    );

    final described = await sfn.describeStateMachine(
      stateMachineArn: machine.stateMachineArn,
    );
    expect(described.type, equals(StateMachineType.standard));
    expect(described.status, anyOf(StateMachineStatus.active, isNull));

    await sfn.deleteStateMachine(stateMachineArn: machine.stateMachineArn);
  });
}
