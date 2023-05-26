import 'package:aws_client/secrets_manager_2017_10_17.dart';

void main() async {
  final secretManager = SecretsManager(region: 'us-east-2');
  final result = await secretManager.getSecretValue(secretId: '<abc>');
  print(result.secretString);

  try {
    await secretManager.createSecret(name: 'some_secret', secretString: 'shht');
    print('Create secret');
  } on ResourceExistsException catch (_) {
    await secretManager.updateSecret(
        secretId: 'some_secret', secretString: 'shht v2');
    print('Updated secret');
  }

  secretManager.close();
}
