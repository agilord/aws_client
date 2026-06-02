import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/kms_2014_11_01.dart';
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
}
