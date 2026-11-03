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

A client built without credentials resolves them the way the official AWS SDKs
do, trying each source in turn and using the first that yields credentials:

1. the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` (and optional
   `AWS_SESSION_TOKEN`) environment variables;
2. a web identity token (`AWS_WEB_IDENTITY_TOKEN_FILE` and `AWS_ROLE_ARN`),
   exchanged through STS `AssumeRoleWithWebIdentity`, as used by EKS IAM Roles
   for Service Accounts or GitHub Actions OIDC;
3. the shared `~/.aws/credentials` and `~/.aws/config` files (`AWS_PROFILE`
   selects the profile): an IAM Identity Center profile (`sso_session` or
   `sso_start_url`, using the token cached by `aws sso login`), static keys, a
   profile with `role_arn` and `source_profile` assumed through STS, or a
   `credential_process` command;
4. the ECS / EKS container credentials endpoint
   (`AWS_CONTAINER_CREDENTIALS_RELATIVE_URI` or
   `AWS_CONTAINER_CREDENTIALS_FULL_URI`);
5. the EC2 instance metadata service (IMDSv2, falling back to IMDSv1).

The result is cached for the whole process and refreshed five minutes before
temporary credentials expire. Requests to the container endpoint and the
instance metadata service time out after one second, so a machine with no
credentials fails fast with an exception rather than hanging. In a browser none
of these sources exist, so credentials must be passed explicitly there.

Credentials can be passed explicitly:

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

Any single source of the chain, or a chain of your own, can be used instead via
`credentialsProvider`:

```dart
import 'package:aws_client/credential_providers.dart';

final s3 = S3(
  region: 'us-west-1',
  credentialsProvider: ChainedCredentialProvider([
    fromContainer,
    fromInstanceMetaDataService,
  ]).chainedFallback,
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