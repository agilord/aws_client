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

part 'supports_header_maps.g.dart';

/// Supports header maps
class SupportsHeaderMaps {
  final _s.RestJsonProtocol _protocol;
  SupportsHeaderMaps({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'SupportsHeaderMaps',
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
      allHeaders: _s.extractHeaderMapValues(response.headers, 'AllHeaders'),
      prefixedHeaders: _s.extractHeaderMapValues(response.headers, 'X-'),
    );
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputShape {
  @_s.JsonKey(name: 'AllHeaders')
  final Map<String, String> allHeaders;
  @_s.JsonKey(name: 'X-')
  final Map<String, String> prefixedHeaders;

  OutputShape({
    this.allHeaders,
    this.prefixedHeaders,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) =>
      _$OutputShapeFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
