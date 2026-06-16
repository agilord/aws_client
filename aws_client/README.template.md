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
<!-- INCLUDE: example/s3.dart -->

##### DynamoDB
<!-- INCLUDE: example/document_client.dart -->

##### SQS
<!-- INCLUDE: example/sqs.dart -->

##### Lambda
<!-- INCLUDE: example/lambda.dart -->

##### Cognito Identity provider
<!-- INCLUDE: example/cognito_idp_admin.dart -->

##### IAM
<!-- INCLUDE: example/iam.dart -->

##### SES
<!-- INCLUDE: example/ses_v2.dart -->


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