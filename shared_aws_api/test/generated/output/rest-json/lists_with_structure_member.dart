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

/// Lists with structure member
class ListsWithStructureMember {
  final _s.RestJsonProtocol _protocol;
  ListsWithStructureMember({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ListsWithStructureMember',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromJson(response);
  }
}

class OutputShape {
  final List<SingleStruct>? listMember;

  OutputShape({
    this.listMember,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      listMember: (json['ListMember'] as List?)
          ?.whereNotNull()
          .map((e) => SingleStruct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SingleStruct {
  final String? foo;

  SingleStruct({
    this.foo,
  });
  factory SingleStruct.fromJson(Map<String, dynamic> json) {
    return SingleStruct(
      foo: json['Foo'] as String?,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
