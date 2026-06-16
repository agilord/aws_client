import 'package:aws_client/swf.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late Swf swf;

  setUp(() => swf = localClient(Swf.new));
  tearDown(() => swf.close());

  test('SWF (json): register, list, describe and deprecate a domain', () async {
    final name = uniqueName('domain');

    await swf.registerDomain(
      name: name,
      workflowExecutionRetentionPeriodInDays: '1',
      description: 'smoke-test domain',
    );

    final listed = await swf.listDomains(
        registrationStatus: RegistrationStatus.registered);
    expect(listed.domainInfos.map((d) => d.name), contains(name));

    final described = await swf.describeDomain(name: name);
    expect(described.domainInfo.name, equals(name));
    expect(described.domainInfo.status, equals(RegistrationStatus.registered));

    await swf.deprecateDomain(name: name);

    final deprecated = await swf.describeDomain(name: name);
    expect(deprecated.domainInfo.status, equals(RegistrationStatus.deprecated));
  });
}
