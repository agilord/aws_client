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
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'endpoint_host_trait.g.dart';

/// Endpoint host trait
class EndpointHostTrait {
  final _s.RestJsonProtocol _protocol;
  EndpointHostTrait({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'EndpointHostTrait',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> staticOp0({
    String name,
  }) async {
    final $payload = StaticInputShape(
      name: name,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> memberRefOp1({
    String name,
  }) async {
    final $payload = MemberRefInputShape(
      name: name,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StaticInputShape {
  @_s.JsonKey(name: 'Name')
  final String name;

  StaticInputShape({
    this.name,
  });
  Map<String, dynamic> toJson() => _$StaticInputShapeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MemberRefInputShape {
  @_s.JsonKey(name: 'Name')
  final String name;

  MemberRefInputShape({
    this.name,
  });
  Map<String, dynamic> toJson() => _$MemberRefInputShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
