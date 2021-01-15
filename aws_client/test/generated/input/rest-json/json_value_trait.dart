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

part 'json_value_trait.g.dart';

/// JSON value trait
class JsonValueTrait {
  final _s.RestJsonProtocol _protocol;
  JsonValueTrait({
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

  Future<void> operationName0({
    BodyStructure body,
    String headerField,
    String queryField,
  }) async {
    final headers = <String, String>{};
    headerField
        ?.let((v) => headers['X-Amz-Foo'] = base64Encode(utf8.encode(v)));
    final $query = <String, List<String>>{
      if (queryField != null) 'Bar': [queryField],
    };
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    BodyStructure body,
    String headerField,
    String queryField,
  }) async {
    final headers = <String, String>{};
    headerField
        ?.let((v) => headers['X-Amz-Foo'] = base64Encode(utf8.encode(v)));
    final $query = <String, List<String>>{
      if (queryField != null) 'Bar': [queryField],
    };
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    BodyStructure body,
    String headerField,
    String queryField,
  }) async {
    final headers = <String, String>{};
    headerField
        ?.let((v) => headers['X-Amz-Foo'] = base64Encode(utf8.encode(v)));
    final $query = <String, List<String>>{
      if (queryField != null) 'Bar': [queryField],
    };
    await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BodyStructure {
  @_s.JsonKey(name: 'BodyField')
  final Object bodyField;
  @_s.JsonKey(name: 'BodyListField')
  final List<Object> bodyListField;

  BodyStructure({
    this.bodyField,
    this.bodyListField,
  });
  Map<String, dynamic> toJson() => _$BodyStructureToJson(this);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
