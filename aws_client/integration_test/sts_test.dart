import 'package:aws_client/sts.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Sts sts;

  setUp(() => sts = localClient(Sts.new));

  tearDown(() => sts.close());

  test('STS (query): get caller identity', () async {
    final identity = await sts.getCallerIdentity();
    expect(identity.account, isNotNull);
    expect(identity.arn, isNotNull);
  });

  test('STS (query): assume a role returns temporary credentials', () async {
    final assumed = await sts.assumeRole(
      roleArn: 'arn:aws:iam::000000000000:role/smoke-assumed',
      roleSessionName: uniqueName('session'),
    );
    final credentials = assumed.credentials!;
    expect(credentials.accessKeyId, isNotEmpty);
    expect(credentials.secretAccessKey, isNotEmpty);
    expect(credentials.sessionToken, isNotEmpty);
    expect(assumed.assumedRoleUser!.arn, contains('smoke-assumed'));
  });

  test('STS (query): get a session token', () async {
    final session = await sts.getSessionToken();
    final credentials = session.credentials!;
    expect(credentials.accessKeyId, isNotEmpty);
    expect(credentials.sessionToken, isNotEmpty);
  });
}
