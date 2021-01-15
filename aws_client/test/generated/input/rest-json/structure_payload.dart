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

part 'structure_payload.g.dart';

/// Structure payload
class StructurePayload {
  final _s.RestJsonProtocol _protocol;
  StructurePayload({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'StructurePayload',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    FooShape foo,
  }) async {
    await _protocol.send(
      payload: foo,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    FooShape foo,
  }) async {
    await _protocol.send(
      payload: foo,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FooShape {
  @_s.JsonKey(name: 'baz')
  final String baz;

  FooShape({
    this.baz,
  });
  Map<String, dynamic> toJson() => _$FooShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
