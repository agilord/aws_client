import 'package:aws_client/route_53_2013_04_01.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Route53 route53;

  setUp(() => route53 = localClient(Route53.new));
  tearDown(() => route53.close());

  test('Route53 (rest-xml): create hosted zone, then read it back', () async {
    final zoneName = '${uniqueName()}.example.com.';

    final created = await route53.createHostedZone(
      callerReference: zoneName,
      name: zoneName,
    );

    final zoneId = created.hostedZone.id.replaceFirst('/hostedzone/', '');
    expect(created.hostedZone.name, equals(zoneName));

    final got = await route53.getHostedZone(id: zoneId);
    expect(got.hostedZone.name, equals(zoneName));

    await route53.deleteHostedZone(id: zoneId);
  });
}
