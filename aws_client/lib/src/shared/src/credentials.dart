// Copyright (c) 2020, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:http/http.dart';
import 'credentials/credentials_io.dart'
    if (dart.library.html) 'credentials/credentials_html.dart';
import 'protocol/endpoint.dart';

typedef AwsClientCredentialsProvider = Future<AwsClientCredentials?> Function(
    {Client? client});

typedef RequestSigner = void Function({
  required Request rq,
  required ServiceMetadata service,
  required String region,
  required AwsClientCredentials credentials,
});

/// AWS credentials.
class AwsClientCredentials {
  /// AWS access key
  final String accessKey;

  /// AWS secret key
  final String secretKey;

  /// AWS temporary credentials session token
  final String? sessionToken;

  // If applicable, e.g. when credentials are fetched from STS or Cognito
  final DateTime? expiration;

  /// AWS credentials.
  AwsClientCredentials({
    required this.accessKey,
    required this.secretKey,
    this.sessionToken,
    this.expiration,
  });

  static AwsClientCredentials? resolve() => CredentialsUtil.resolve();

  static AwsClientCredentials? fromProfileFile({String? profile}) =>
      CredentialsUtil.fromProfileFile(profile: profile);
}
