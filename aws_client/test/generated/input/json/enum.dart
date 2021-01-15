// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

/// Enum
class Enum {
  final _s.JsonProtocol _protocol;
  Enum({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'Enum',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    EnumType fooEnum,
    List<EnumType> listEnums,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Enum.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
        if (listEnums != null)
          'ListEnums': listEnums.map((e) => e?.toValue() ?? '').toList(),
      },
    );
  }

  Future<void> operationName1({
    EnumType fooEnum,
    List<EnumType> listEnums,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Enum.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fooEnum != null) 'FooEnum': fooEnum.toValue(),
        if (listEnums != null)
          'ListEnums': listEnums.map((e) => e?.toValue() ?? '').toList(),
      },
    );
  }
}

enum EnumType {
  @_s.JsonValue('foo')
  foo,
  @_s.JsonValue('bar')
  bar,
}

extension on EnumType {
  String toValue() {
    switch (this) {
      case EnumType.foo:
        return 'foo';
      case EnumType.bar:
        return 'bar';
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
