# AWS Client for Dart

[![pub package](https://img.shields.io/pub/v/aws_client.svg)](https://pub.dev/packages/aws_client)
[![package publisher](https://img.shields.io/pub/publisher/aws_client.svg)](https://pub.dev/packages/aws_client/publisher)
[![likes](https://img.shields.io/pub/likes/aws_client)](https://pub.dev/packages/aws_client/score)
[![pub points](https://img.shields.io/pub/points/aws_client)](https://pub.dev/packages/aws_client/score)

High-level, strongly-typed Dart client libraries for 400+ Amazon Web Services
(AWS) APIs, including S3, DynamoDB, Lambda, SQS, SES, Cognito and IAM. The
libraries are generated from the official AWS service definitions and run on the
Dart VM, Flutter and the web.

## Features

- Coverage of 400+ AWS services, each exposed as a separate library.
- Typed request and response models, removing the need to hand-craft XML or JSON
  payloads.
- Built-in SigV4 request signing with credential resolution from environment
  variables, the shared profile, EC2/ECS instance metadata, STS or a custom
  provider.
- One API surface that runs on the Dart VM, Flutter and the web.

## Credentials

By default the client resolves credentials from the standard AWS sources
(environment variables, the shared `~/.aws/credentials` profile, EC2/ECS
instance metadata, and so on). They can also be passed explicitly:

```dart
final s3 = S3(
  region: 'us-west-1',
  credentials: AwsClientCredentials(
    accessKey: '...',
    secretKey: '...',
  ),
);
```

Credentials can also be loaded from a named profile in the shared
`~/.aws/credentials` file:

```dart
final s3 = S3(
  region: 'us-west-1',
  credentials: AwsClientCredentials.fromProfileFile(profile: 'my-profile'),
);
```

## Usage examples

##### S3
```dart
import 'dart:io';
import 'package:aws_client/s3_2006_03_01.dart';

void main() async {
  final api = S3(region: 'us-west-1');
  await api.createBucket(bucket: 'my_bucket');
  await api.putObject(
      bucket: 'my_bucket',
      key: 'my_file.png',
      body: File('my_file.png').readAsBytesSync());
  api.close();
}
```

##### DynamoDB
```dart
import 'dart:convert';
import 'package:aws_client/dynamo_document.dart';

void main() async {
  final db = DocumentClient(region: 'us-west-1');

  final getResponse = await db.get(
    tableName: 'MyTable',
    key: {'Car': 'DudeWheresMyCar'},
  );

  print(jsonEncode(getResponse.item));
}
```

##### SQS
```dart
import 'package:aws_client/sqs_2012_11_05.dart';

void main() async {
  final sqs = Sqs(region: 'us-west-1');
  final queue = await sqs.createQueue(queueName: 'queue');
  await sqs.sendMessage(
          messageBody: 'Hello from Dart client!', queueUrl: queue.queueUrl!);
  sqs.close();
}
```

##### Lambda
```dart
import 'package:aws_client/lambda_2015_03_31.dart';

void main(List<String> args) async {
  final lambda = Lambda(region: 'us-west-1');
  final response = await lambda.invoke(
    functionName: 'my-function',
    invocationType: InvocationType.requestResponse,
  );

  print('StatusCode: ${response.statusCode}');
  lambda.close();
}
```

##### Cognito Identity provider

```dart
import 'package:aws_client/cognito_identity_provider_2016_04_18.dart';

void main() async {
  final api = CognitoIdentityProvider(region: 'us-west-1');

  final cognitoPool = 'us-west-1_abc';
  final user = 'email@email.com';
  
  await api.adminCreateUser(
    userPoolId: cognitoPool,
    username: user,
    temporaryPassword: r'Pass123$$',
    userAttributes: [AttributeType(name: 'email', value: user)],
    clientMetadata: {
      'language': 'fr',
    },
  );

  await api.adminSetUserPassword(
      password: 'newpassword', userPoolId: cognitoPool, username: user);

  await api.adminDeleteUser(userPoolId: cognitoPool, username: user);

  api.close();
}
```

##### IAM
```dart
import 'package:aws_client/iam_2010_05_08.dart';

void main() async {
  final iam = Iam();

  final users = await iam.listUsers();
  print(users.users.length);

  iam.close();
}
```

##### SES
```dart
import 'package:aws_client/ses_v2_2019_09_27.dart';

void main() async {
  final api = SesV2(region: 'us-west-1');

  final response = await api.sendEmail(
    content: EmailContent(
      simple: Message(
        body: Body(text: Content(data: 'Hello, here is a message')),
        subject: Content(data: 'An email from SES'),
      ),
    ),
    destination: Destination(toAddresses: ['user@email.com']),
    fromEmailAddress: 'from@email.com',
  );
  print(response.messageId);

  api.close();
}
```

## Contributing

This is not an official library from Amazon or Google. It is developed on a
best-effort basis; issues and pull requests are welcome.

## Links

- [source code][source]
- contributors: [Agilord][agilord]

[source]: https://github.com/agilord/aws_client
[agilord]: https://www.agilord.com/

## Available AWS APIs

The following is a list of APIs that are currently available inside this package.

<!-- INSERT API LIST -->