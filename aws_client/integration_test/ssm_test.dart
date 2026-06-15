import 'package:aws_client/ssm_2014_11_06.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Ssm ssm;

  setUp(() => ssm = localClient(Ssm.new));
  tearDown(() => ssm.close());

  test('SSM (json): put, get and delete a parameter', () async {
    final name = '/smoke/${uniqueName('param')}';

    await ssm.putParameter(
      name: name,
      value: 'first-value',
      type: ParameterType.string,
      description: 'smoke-test parameter',
    );

    final got = await ssm.getParameter(name: name);
    expect(got.parameter!.value, equals('first-value'));
    expect(got.parameter!.type, equals(ParameterType.string));

    await ssm.putParameter(
      name: name,
      value: 'second-value',
      type: ParameterType.string,
      overwrite: true,
    );
    final updated = await ssm.getParameter(name: name);
    expect(updated.parameter!.value, equals('second-value'));
    expect(updated.parameter!.version, equals(2));

    await ssm.deleteParameter(name: name);
  });

  test('SSM (json): list parameters by path', () async {
    final base = '/smoke/${uniqueName('tree')}';
    await ssm.putParameter(
        name: '$base/a', value: '1', type: ParameterType.string);
    await ssm.putParameter(
        name: '$base/b', value: '2', type: ParameterType.string);

    final byPath = await ssm.getParametersByPath(path: base, recursive: true);
    final names = byPath.parameters!.map((p) => p.name).toSet();
    expect(names, containsAll(['$base/a', '$base/b']));

    await ssm.deleteParameter(name: '$base/a');
    await ssm.deleteParameter(name: '$base/b');
  });
}
