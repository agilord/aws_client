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

part 'timestamp_members.g.dart';

/// Timestamp members
class TimestampMembers {
  final _s.JsonProtocol _protocol;
  TimestampMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampMembers',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'TimestampMembers.OperationName'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OutputShape.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputShape {
  @_s.JsonKey(name: 'StructMember')
  final TimeContainer structMember;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'TimeArg')
  final DateTime timeArg;
  @RfcDateTimeConverter()
  @_s.JsonKey(name: 'TimeCustom')
  final DateTime timeCustom;
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'TimeFormat')
  final DateTime timeFormat;

  OutputShape({
    this.structMember,
    this.timeArg,
    this.timeCustom,
    this.timeFormat,
  });
  factory OutputShape.fromJson(Map<String, dynamic> json) =>
      _$OutputShapeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimeContainer {
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'bar')
  final DateTime bar;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'foo')
  final DateTime foo;

  TimeContainer({
    this.bar,
    this.foo,
  });
  factory TimeContainer.fromJson(Map<String, dynamic> json) =>
      _$TimeContainerFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
