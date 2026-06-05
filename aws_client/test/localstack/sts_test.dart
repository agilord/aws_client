import 'package:aws_client/sts_2011_06_15.dart';
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
}
