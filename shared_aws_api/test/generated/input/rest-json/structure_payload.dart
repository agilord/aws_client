// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Structure payload
class StructurePayload {
  final _s.RestJsonProtocol _protocol;
  StructurePayload({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'StructurePayload',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    FooShape? foo,
  }) async {
    await _protocol.send(
      payload: foo,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    FooShape? foo,
  }) async {
    await _protocol.send(
      payload: foo,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class FooShape {
  final String? baz;

  FooShape({
    this.baz,
  });
  Map<String, dynamic> toJson() {
    final baz = this.baz;
    return {
      if (baz != null) 'baz': baz,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
