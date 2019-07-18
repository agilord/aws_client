// Copyright (c) 2016, project contributors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:http_client/http_client.dart' as http;

import 'src/credentials.dart';
import 'src/request.dart';

/// AWS Lambda
class Lambda {
  final Credentials _credentials;
  final http.Client _httpClient;
  final String _region;

  Lambda({Credentials credentials, http.Client httpClient, String region})
      : _credentials = credentials,
        _httpClient = httpClient,
        _region = region {
    assert(_credentials != null);
    assert(_httpClient != null);
  }

  /// execute real request
  Future<AwsResponse> _sendRequest(String functionName, String body,
      Map<String, String> headers, LambdaInvocationType invocationType) async {
    final response = await AwsRequestBuilder(
            method: 'POST',
            headers: <String, String>{
              'X-Amz-Invocation-Type': invocationType.toString().split('.')[1],
            }..addAll(headers),
            baseUrl:
                'https://lambda.$_region.amazonaws.com/2015-03-31/functions/$functionName/invocations',
            body: utf8.encode(body),
            credentials: _credentials,
            httpClient: _httpClient,
            region: _region)
        .sendRequest();
    response.validateStatus();
    return response;
  }

  /// https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html
  /// **Optional additional headers**
  /// 'X-Amz-Log-Type': 'Tail',
  /// 'X-Amz-Client-Context': base64.encode(utf8.encode('{"dart":true}'))
  ///
  /// functionName: arn:aws:lambda:us-west-2:123456789012:function:my-function <--format not working
  /// functionName: my-function:$LATEST, my-function:v1 <--format not working
  /// functionName: my-function <--Works!
  Future<AwsResponse> invoke(
    String functionName,
    String payload, {
    Map<String, String> headers = const {},
    LambdaInvocationType invocationType = LambdaInvocationType.RequestResponse,
  }) async {
    return _sendRequest(functionName, payload, headers, invocationType);
  }
}

/// https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html#API_Invoke_RequestSyntax
enum LambdaInvocationType { Event, RequestResponse, DryRun }
