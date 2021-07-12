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

/// Timestamp members
class TimestampMembers {
  final _s.RestJsonProtocol _protocol;
  TimestampMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampMembers',
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
      structMember: $json['StructMember'] != null
          ? TimeContainer.fromJson(
              $json['StructMember'] as Map<String, dynamic>)
          : null,
      timeArg: timeStampFromJson($json['TimeArg']),
      timeCustom: timeStampFromJson($json['TimeCustom']),
      timeFormat: timeStampFromJson($json['TimeFormat']),
      timeArgInHeader:
          _s.extractHeaderDateTimeValue(response.headers, 'x-amz-timearg'),
      timeCustomInHeader: _s.extractHeaderDateTimeValue(
          response.headers, 'x-amz-timecustom',
          parser: _s.timeStampFromJson),
      timeFormatInHeader: _s.extractHeaderDateTimeValue(
          response.headers, 'x-amz-timeformat',
          parser: _s.timeStampFromJson),
    );
  }
}

class OutputShape {
  final TimeContainer? structMember;
  final DateTime? timeArg;
  final DateTime? timeArgInHeader;
  final DateTime? timeCustom;
  final DateTime? timeCustomInHeader;
  final DateTime? timeFormat;
  final DateTime? timeFormatInHeader;

  OutputShape({
    this.structMember,
    this.timeArg,
    this.timeArgInHeader,
    this.timeCustom,
    this.timeCustomInHeader,
    this.timeFormat,
    this.timeFormatInHeader,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      structMember: json['StructMember'] != null
          ? TimeContainer.fromJson(json['StructMember'] as Map<String, dynamic>)
          : null,
      timeArg: timeStampFromJson(json['TimeArg']),
      timeArgInHeader: timeStampFromJson(json['x-amz-timearg']),
      timeCustom: timeStampFromJson(json['TimeCustom']),
      timeCustomInHeader: timeStampFromJson(json['x-amz-timecustom']),
      timeFormat: timeStampFromJson(json['TimeFormat']),
      timeFormatInHeader: timeStampFromJson(json['x-amz-timeformat']),
    );
  }

  Map<String, dynamic> toJson() {
    final structMember = this.structMember;
    final timeArg = this.timeArg;
    final timeArgInHeader = this.timeArgInHeader;
    final timeCustom = this.timeCustom;
    final timeCustomInHeader = this.timeCustomInHeader;
    final timeFormat = this.timeFormat;
    final timeFormatInHeader = this.timeFormatInHeader;
    return {
      if (structMember != null) 'StructMember': structMember,
      if (timeArg != null) 'TimeArg': unixTimestampToJson(timeArg),
      if (timeCustom != null) 'TimeCustom': rfc822ToJson(timeCustom),
      if (timeFormat != null) 'TimeFormat': iso8601ToJson(timeFormat),
    };
  }
}

class TimeContainer {
  final DateTime? bar;
  final DateTime? foo;

  TimeContainer({
    this.bar,
    this.foo,
  });

  factory TimeContainer.fromJson(Map<String, dynamic> json) {
    return TimeContainer(
      bar: timeStampFromJson(json['bar']),
      foo: timeStampFromJson(json['foo']),
    );
  }

  Map<String, dynamic> toJson() {
    final bar = this.bar;
    final foo = this.foo;
    return {
      if (bar != null) 'bar': iso8601ToJson(bar),
      if (foo != null) 'foo': unixTimestampToJson(foo),
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
