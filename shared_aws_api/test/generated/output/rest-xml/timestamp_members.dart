// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Timestamp members
class TimestampMembers {
  final _s.RestXmlProtocol _protocol;
  TimestampMembers({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'TimestampMembers',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result.body, headers: $result.headers);
  }
}

class OutputShape {
  final TimeContainer structMember;
  final DateTime timeArg;
  final DateTime timeArgInHeader;
  final DateTime timeCustom;
  final DateTime timeCustomInHeader;
  final DateTime timeFormat;
  final DateTime timeFormatInHeader;

  OutputShape({
    this.structMember,
    this.timeArg,
    this.timeArgInHeader,
    this.timeCustom,
    this.timeCustomInHeader,
    this.timeFormat,
    this.timeFormatInHeader,
  });
  factory OutputShape.fromXml(
    _s.XmlElement elem, {
    Map<String, String> headers,
  }) {
    return OutputShape(
      structMember: _s
          .extractXmlChild(elem, 'StructMember')
          ?.let((e) => TimeContainer.fromXml(e)),
      timeArg: _s.extractXmlDateTimeValue(elem, 'TimeArg'),
      timeArgInHeader: _s.extractHeaderDateTimeValue(headers, 'x-amz-timearg'),
      timeCustom: _s.extractXmlDateTimeValue(elem, 'TimeCustom'),
      timeCustomInHeader:
          _s.extractHeaderDateTimeValue(headers, 'x-amz-timecustom'),
      timeFormat: _s.extractXmlDateTimeValue(elem, 'TimeFormat'),
      timeFormatInHeader:
          _s.extractHeaderDateTimeValue(headers, 'x-amz-timeformat'),
    );
  }
}

class TimeContainer {
  final DateTime bar;
  final DateTime foo;

  TimeContainer({
    this.bar,
    this.foo,
  });
  factory TimeContainer.fromXml(_s.XmlElement elem) {
    return TimeContainer(
      bar: _s.extractXmlDateTimeValue(elem, 'bar'),
      foo: _s.extractXmlDateTimeValue(elem, 'foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
