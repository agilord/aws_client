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
  final _s.RestXmlProtocol _protocol;
  TimestampMembers({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampMembers',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return OutputShape(
      structMember: _s
          .extractXmlChild($elem, 'StructMember')
          ?.let((e) => TimeContainer.fromXml(e)),
      timeArg: _s.extractXmlDateTimeValue($elem, 'TimeArg'),
      timeCustom: _s.extractXmlDateTimeValue($elem, 'TimeCustom',
          parser: _s.timeStampFromJson),
      timeFormat: _s.extractXmlDateTimeValue($elem, 'TimeFormat',
          parser: _s.timeStampFromJson),
      timeArgInHeader:
          _s.extractHeaderDateTimeValue($result.headers, 'x-amz-timearg'),
      timeCustomInHeader: _s.extractHeaderDateTimeValue(
          $result.headers, 'x-amz-timecustom',
          parser: _s.timeStampFromJson),
      timeFormatInHeader: _s.extractHeaderDateTimeValue(
          $result.headers, 'x-amz-timeformat',
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
      if (timeFormat != null) 'TimeFormat': unixTimestampToJson(timeFormat),
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

  factory TimeContainer.fromXml(_s.XmlElement elem) {
    return TimeContainer(
      bar:
          _s.extractXmlDateTimeValue(elem, 'bar', parser: _s.timeStampFromJson),
      foo: _s.extractXmlDateTimeValue(elem, 'foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final bar = this.bar;
    final foo = this.foo;
    return {
      if (bar != null) 'bar': unixTimestampToJson(bar),
      if (foo != null) 'foo': unixTimestampToJson(foo),
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
