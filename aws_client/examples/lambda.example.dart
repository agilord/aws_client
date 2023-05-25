// Copyright (c) 2019, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'package:aws_client/lambda_2015_03_31.dart';

Future main(List<String> args) async {
  final lambda = Lambda(region: 'us-west-1');

  try {
    final response = await lambda.invoke(
      functionName: 'my-function',
      invocationType: InvocationType.requestResponse,
    );

    print('StatusCode: ${response.statusCode}');
  } finally {
    lambda.close();
  }
}
