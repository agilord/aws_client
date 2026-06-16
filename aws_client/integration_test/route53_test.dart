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

  test('Route53 (rest-xml): upsert an A record then list it back', () async {
    final zoneName = '${uniqueName()}.example.com.';
    final created = await route53.createHostedZone(
      callerReference: zoneName,
      name: zoneName,
    );
    final zoneId = created.hostedZone.id.replaceFirst('/hostedzone/', '');
    final recordName = 'www.$zoneName';

    await route53.changeResourceRecordSets(
      hostedZoneId: zoneId,
      changeBatch: ChangeBatch(changes: [
        Change(
          action: ChangeAction.upsert,
          resourceRecordSet: ResourceRecordSet(
            name: recordName,
            type: RRType.a,
            ttl: 300,
            resourceRecords: [ResourceRecord(value: '192.0.2.1')],
          ),
        ),
      ]),
    );

    final records = await route53.listResourceRecordSets(hostedZoneId: zoneId);
    final aRecord = records.resourceRecordSets.firstWhere(
      (r) => r.type == RRType.a && r.name == recordName,
    );
    expect(
      aRecord.resourceRecords!.map((r) => r.value),
      contains('192.0.2.1'),
    );
    expect(
      records.resourceRecordSets.map((r) => r.type),
      containsAll([RRType.soa, RRType.ns]),
    );

    await route53.changeResourceRecordSets(
      hostedZoneId: zoneId,
      changeBatch: ChangeBatch(changes: [
        Change(
          action: ChangeAction.delete,
          resourceRecordSet: ResourceRecordSet(
            name: recordName,
            type: RRType.a,
            ttl: 300,
            resourceRecords: [ResourceRecord(value: '192.0.2.1')],
          ),
        ),
      ]),
    );
    await route53.deleteHostedZone(id: zoneId);
  });
}
