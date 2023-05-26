import 'package:aws_client/iam_2010_05_08.dart';

void main() async {
  final iam = Iam();

  final users = await iam.listUsers();
  print(users.users.length);

  try {
    final existing = await iam.getRole(roleName: 'my_role');
    final existingPolicies =
        await iam.listRolePolicies(roleName: existing.role.roleName);
    print(existingPolicies);
  } on NoSuchEntityException {
    await iam.createRole(assumeRolePolicyDocument: '''
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}''', roleName: 'my_role');
  }
}
