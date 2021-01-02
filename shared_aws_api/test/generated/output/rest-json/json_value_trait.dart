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

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'json_value_trait.g.dart';

/// JSON value trait
class JSONValueTrait {
  final _s.RestJsonProtocol _protocol;
  JSONValueTrait({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'JSONValueTrait',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      bodyField: $json['BodyField'] == null
          ? null
          : jsonDecode($json['BodyField'] as String),
      bodyListField:
          ($json['BodyListField'] as List)?.map((e) => e as String)?.toList(),
      headerField: _s.extractHeaderJsonValue(response.headers, 'X-Amz-Foo'),
    );
  }

  Future<OutputShape> operationName1() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputShape(
      bodyField: $json['BodyField'] == null
          ? null
          : jsonDecode($json['BodyField'] as String),
      bodyListField:
          ($json['BodyListField'] as List)?.map((e) => e as String)?.toList(),
      headerField: _s.extractHeaderJsonValue(response.headers, 'X-Amz-Foo'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputShape {
  @StringJsonConverter()
  @_s.JsonKey(name: 'BodyField')
  final Object bodyField;
  @_s.JsonKey(name: 'BodyListField')
  final List<String> bodyListField;
  @Base64JsonConverter()
  @_s.JsonKey(name: 'X-Amz-Foo')
  final Object headerField;

  OutputShape({
    this.bodyField,
    this.bodyListField,
    this.headerField,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) =>
      _$OutputShapeFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
