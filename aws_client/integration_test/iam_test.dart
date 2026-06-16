import 'dart:convert';

import 'package:aws_client/iam.dart';
import 'package:test/test.dart';

import 'harness.dart';

const _trustPolicy = '{"Version":"2012-10-17","Statement":[{"Effect":"Allow",'
    '"Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}';

const _permissionPolicy = '{"Version":"2012-10-17","Statement":[{"Effect":'
    '"Allow","Action":"s3:GetObject","Resource":"*"}]}';

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

  test('IAM (query): create a role, read it back and delete it', () async {
    final roleName = uniqueName('role');

    final created = await iam.createRole(
      roleName: roleName,
      assumeRolePolicyDocument: _trustPolicy,
      description: 'smoke-test role',
    );
    expect(created.role.roleName, equals(roleName));
    expect(created.role.arn, isNotNull);
    expectRecent(created.role.createDate);

    final got = await iam.getRole(roleName: roleName);
    expect(got.role.roleName, equals(roleName));
    // The trust policy round-trips URL-encoded; decode before comparing JSON.
    final trust =
        jsonDecode(Uri.decodeComponent(got.role.assumeRolePolicyDocument!))
            as Map<String, dynamic>;
    expect(trust['Statement'], isList);

    await iam.deleteRole(roleName: roleName);
  });

  test('IAM (query): attach a managed policy to a role', () async {
    final roleName = uniqueName('role');
    final policyName = uniqueName('policy');

    await iam.createRole(
      roleName: roleName,
      assumeRolePolicyDocument: _trustPolicy,
    );
    final policy = await iam.createPolicy(
      policyName: policyName,
      policyDocument: _permissionPolicy,
    );
    final policyArn = policy.policy!.arn!;

    await iam.attachRolePolicy(roleName: roleName, policyArn: policyArn);

    final attached = await iam.listAttachedRolePolicies(roleName: roleName);
    expect(
      attached.attachedPolicies!.map((p) => p.policyArn),
      contains(policyArn),
    );

    await iam.detachRolePolicy(roleName: roleName, policyArn: policyArn);
    await iam.deletePolicy(policyArn: policyArn);
    await iam.deleteRole(roleName: roleName);
  });

  test('IAM (query): access key status round-trips through the enum', () async {
    final userName = uniqueName('user');
    await iam.createUser(userName: userName);

    final created = await iam.createAccessKey(userName: userName);
    expect(created.accessKey.status, equals(StatusType.active));
    final keyId = created.accessKey.accessKeyId;

    await iam.updateAccessKey(
      userName: userName,
      accessKeyId: keyId,
      status: StatusType.inactive,
    );

    final listed = await iam.listAccessKeys(userName: userName);
    final entry =
        listed.accessKeyMetadata.singleWhere((k) => k.accessKeyId == keyId);
    expect(entry.status, equals(StatusType.inactive));

    await iam.deleteAccessKey(userName: userName, accessKeyId: keyId);
    await iam.deleteUser(userName: userName);
  });

  test('IAM (query): instance profile holds a role', () async {
    final roleName = uniqueName('role');
    final profileName = uniqueName('profile');
    await iam.createRole(
      roleName: roleName,
      assumeRolePolicyDocument: _trustPolicy,
    );

    final created =
        await iam.createInstanceProfile(instanceProfileName: profileName);
    expect(created.instanceProfile.instanceProfileName, equals(profileName));

    await iam.addRoleToInstanceProfile(
      instanceProfileName: profileName,
      roleName: roleName,
    );

    final got = await iam.getInstanceProfile(instanceProfileName: profileName);
    expect(
      got.instanceProfile.roles.map((r) => r.roleName),
      contains(roleName),
    );

    await iam.removeRoleFromInstanceProfile(
      instanceProfileName: profileName,
      roleName: roleName,
    );
    await iam.deleteInstanceProfile(instanceProfileName: profileName);
    await iam.deleteRole(roleName: roleName);
  });
}
