import 'package:aws_client/iam_2010_05_08.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Iam iam;

  setUp(() => iam = localClient(Iam.new));
  tearDown(() => iam.close());

  test('IAM (query): create user, then list it', () async {
    final userName = uniqueName();

    final created = await iam.createUser(userName: userName);
    expect(created.user, isNotNull);
    expect(created.user!.userName, equals(userName));

    expectRecent(created.user!.createDate);

    final users = await iam.listUsers();
    final names = users.users.map((u) => u.userName);
    expect(names, contains(userName));

    await iam.deleteUser(userName: userName);
  });
}
