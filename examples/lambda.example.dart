// Copyright (c) 2019, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:aws_client/aws_client.dart';
import 'package:aws_client/lambda.dart';
import 'package:aws_client/src/credentials.dart';
import 'package:http_client/console.dart';

main(List<String> args) async {
  final Map<String, String> environment = Platform.environment;
  final Client httpClient = ConsoleClient();
  final credentials = Credentials(
    accessKey: environment['AWS_ACCESS_KEY_ID'],
    secretKey: environment['AWS_SECRET_ACCESS_KEY'],
    sessionToken: environment['AWS_SESSION_TOKEN'],
  );
  try {
    final aws = Aws(credentials: credentials, httpClient: httpClient);
    final response = await aws.lambda(environment['AWS_DEFAULT_REGION']).invoke(
      'my-function',
      json.encode({'number': 4}),
      invocationType: LambdaInvocationType.RequestResponse,
      headers: {'X-Amz-Log-Type': 'Tail'},
    );

    print('StatusCode: ${response.statusCode}');
    print('Headers: ${response.headers}');
    final respPayloadString = await response.readAsString();
    print('Payload: $respPayloadString');
  } catch (e) {
    print('ERROR!!! $e');
  } finally {
    await httpClient.close();
  }
}
