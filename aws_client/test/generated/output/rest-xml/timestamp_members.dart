// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:aws_client/src/shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export 'package:aws_client/src/shared/shared.dart' show AwsClientCredentials;

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
      bar:
          _s.extractXmlDateTimeValue(elem, 'bar', parser: _s.timeStampFromJson),
      foo: _s.extractXmlDateTimeValue(elem, 'foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
