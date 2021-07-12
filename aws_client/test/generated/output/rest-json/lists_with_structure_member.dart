// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Lists with structure member
class ListsWithStructureMember {
  final _s.RestJsonProtocol _protocol;
  ListsWithStructureMember({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ListsWithStructureMember',
          ),
          region: region,
          credentials: credentials,
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

  Map<String, dynamic> toJson() {
    final listMember = this.listMember;
    return {
      if (listMember != null) 'ListMember': listMember,
    };
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

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'Foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
