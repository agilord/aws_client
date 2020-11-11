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

part 'named_locations_in_json_body.g.dart';

/// Named locations in JSON body
class NamedLocationsInJSONBody {
  final _s.RestJsonProtocol _protocol;
  NamedLocationsInJSONBody({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'NamedLocationsInJSONBody',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    DateTime timeArg,
  }) async {
    final $payload = InputShape(
      timeArg: timeArg,
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
class InputShape {
  @_s.JsonKey(
      name: 'timestamp_location',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime timeArg;

  InputShape({
    this.timeArg,
  });
  Map<String, dynamic> toJson() => _$InputShapeToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
