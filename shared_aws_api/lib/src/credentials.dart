// Copyright (c) 2020, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'credentials/credentials_io.dart'
    if (dart.library.html) 'credentials/credentials_html.dart';

/// AWS credentials.
class AwsClientCredentials {
  /// AWS access key
  final String accessKey;

  /// AWS secret key
  final String secretKey;

  /// AWS temporary credentials session token
  final String? sessionToken;

  /// AWS credentials.
  AwsClientCredentials({
    required this.accessKey,
    required this.secretKey,
    this.sessionToken,
  });

  static AwsClientCredentials? resolve() => CredentialsUtil.resolve();
}
