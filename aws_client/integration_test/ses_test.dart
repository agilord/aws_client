import 'package:aws_client/ses_2010_12_01.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Ses ses;

  setUp(() => ses = localClient(Ses.new));
  tearDown(() => ses.close());

  test('SES (query): verify, list and read identity attributes', () async {
    final email = '${uniqueName('sender')}@example.com';

    await ses.verifyEmailIdentity(emailAddress: email);

    final listed = await ses.listIdentities(identityType: IdentityType.emailAddress);
    expect(listed.identities, contains(email));

    final attributes =
        await ses.getIdentityVerificationAttributes(identities: [email]);
    expect(attributes.verificationAttributes.keys, contains(email));

    await ses.deleteIdentity(identity: email);

    final afterDelete =
        await ses.listIdentities(identityType: IdentityType.emailAddress);
    expect(afterDelete.identities, isNot(contains(email)));
  });
}
