import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/kms.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Kms kms;

  setUp(() => kms = localClient(Kms.new));

  tearDown(() => kms.close());

  test('KMS (json): create key, encrypt then decrypt round-trips plaintext',
      () async {
    final created = await kms.createKey(description: 'smoke test key');
    final keyId = created.keyMetadata!.keyId;

    expectRecent(created.keyMetadata!.creationDate);

    final plaintext = Uint8List.fromList(utf8.encode('secret-payload'));

    final encrypted = await kms.encrypt(keyId: keyId, plaintext: plaintext);
    expect(encrypted.ciphertextBlob, isNotNull);

    final decrypted =
        await kms.decrypt(ciphertextBlob: encrypted.ciphertextBlob!);
    expect(decrypted.plaintext, isNotNull);
    expect(utf8.decode(decrypted.plaintext!), equals('secret-payload'));
  });

  test('KMS (json): generateDataKey returns plaintext and ciphertext',
      () async {
    final created = await kms.createKey(description: 'data-key source');
    final keyId = created.keyMetadata!.keyId;

    final dataKey = await kms.generateDataKey(
      keyId: keyId,
      keySpec: DataKeySpec.aes_256,
    );
    expect(dataKey.plaintext, hasLength(32));
    expect(dataKey.ciphertextBlob, isNotNull);
    expect(dataKey.keyId, contains(keyId));
  });

  test('KMS (json): describeKey and alias creation', () async {
    final created = await kms.createKey(description: 'aliased key');
    final keyId = created.keyMetadata!.keyId;

    final described = await kms.describeKey(keyId: keyId);
    expect(described.keyMetadata!.keyId, equals(keyId));

    final aliasName = 'alias/${uniqueName('key')}';
    await kms.createAlias(aliasName: aliasName, targetKeyId: keyId);

    final aliases = await kms.listAliases(keyId: keyId);
    expect(
      aliases.aliases!.map((a) => a.aliasName),
      contains(aliasName),
    );
  });

  test('KMS (json): key metadata exposes state and manager enums', () async {
    final created = await kms.createKey(description: 'enum metadata key');
    final metadata = created.keyMetadata!;

    expect(metadata.keyState, equals(KeyState.enabled));
    expect(metadata.keyManager, equals(KeyManagerType.customer));
    expect(metadata.keyUsage, equals(KeyUsageType.encryptDecrypt));
  });

  test('KMS (json): explicit encryption algorithm round-trips', () async {
    final created = await kms.createKey(description: 'algo key');
    final keyId = created.keyMetadata!.keyId;
    final plaintext = Uint8List.fromList(utf8.encode('algo-payload'));

    final encrypted = await kms.encrypt(
      keyId: keyId,
      plaintext: plaintext,
      encryptionAlgorithm: EncryptionAlgorithmSpec.symmetricDefault,
    );
    expect(
      encrypted.encryptionAlgorithm,
      equals(EncryptionAlgorithmSpec.symmetricDefault),
    );

    final decrypted = await kms.decrypt(
      ciphertextBlob: encrypted.ciphertextBlob!,
      encryptionAlgorithm: EncryptionAlgorithmSpec.symmetricDefault,
    );
    expect(utf8.decode(decrypted.plaintext!), equals('algo-payload'));
  });

  test('KMS (json): enable then read key rotation status', () async {
    final created = await kms.createKey(description: 'rotating key');
    final keyId = created.keyMetadata!.keyId;

    await kms.enableKeyRotation(keyId: keyId);

    final status = await kms.getKeyRotationStatus(keyId: keyId);
    expect(status.keyRotationEnabled, isTrue);
  });
}
