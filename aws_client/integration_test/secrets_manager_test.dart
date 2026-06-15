import 'package:aws_client/secrets_manager_2017_10_17.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late SecretsManager secrets;

  setUp(() => secrets = localClient(SecretsManager.new));
  tearDown(() => secrets.close());

  test('SecretsManager (json): create, read, update and list a secret',
      () async {
    final name = uniqueName('secret');

    final created = await secrets.createSecret(
      name: name,
      description: 'smoke-test secret',
      secretString: 'initial-value',
    );
    expect(created.name, equals(name));
    expect(created.arn, isNotNull);

    final initial = await secrets.getSecretValue(secretId: name);
    expect(initial.secretString, equals('initial-value'));

    await secrets.putSecretValue(
      secretId: name,
      secretString: 'rotated-value',
    );
    final rotated = await secrets.getSecretValue(secretId: name);
    expect(rotated.secretString, equals('rotated-value'));
    expect(rotated.versionId, isNotNull);

    final listed = await secrets.listSecrets();
    expect(listed.secretList!.map((s) => s.name), contains(name));

    await secrets.deleteSecret(
      secretId: name,
      forceDeleteWithoutRecovery: true,
    );
  });
}
