// ignore_for_file: deprecated_member_use_from_same_package
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

/// Enum
class Enum {
  final _s.QueryProtocol _protocol;

  Enum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> operationName0({
    EnumType? fooEnum,
    List<EnumType>? listEnums,
  }) async {
    final $request = <String, String>{
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (listEnums != null)
        if (listEnums.isEmpty)
          'ListEnums': ''
        else
          for (var i1 = 0; i1 < listEnums.length; i1++)
            'ListEnums.member.${i1 + 1}': listEnums[i1].value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    EnumType? fooEnum,
    List<EnumType>? listEnums,
  }) async {
    final $request = <String, String>{
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (listEnums != null)
        if (listEnums.isEmpty)
          'ListEnums': ''
        else
          for (var i1 = 0; i1 < listEnums.length; i1++)
            'ListEnums.member.${i1 + 1}': listEnums[i1].value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    EnumType? fooEnum,
    List<EnumType>? listEnums,
  }) async {
    final $request = <String, String>{
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (listEnums != null)
        if (listEnums.isEmpty)
          'ListEnums': ''
        else
          for (var i1 = 0; i1 < listEnums.length; i1++)
            'ListEnums.member.${i1 + 1}': listEnums[i1].value,
    };
    await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2014-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum EnumType {
  foo('foo'),
  bar('bar'),
  ;

  final String value;

  const EnumType(this.value);

  static EnumType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EnumType'));
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
