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

/// Timestamp shapes
class TimestampShapes {
  final _s.RestXmlProtocol _protocol;
  TimestampShapes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'TimestampShapes',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    DateTime timeArg,
    DateTime timeArgInHeader,
    DateTime timeArgInQuery,
    DateTime timeCustom,
    DateTime timeCustomInHeader,
    DateTime timeCustomInQuery,
    DateTime timeFormat,
    DateTime timeFormatInHeader,
    DateTime timeFormatInQuery,
  }) async {
    final headers = <String, String>{};
    timeArgInHeader?.let((v) => headers['x-amz-timearg'] = _s.rfc822ToJson(v));
    timeCustomInHeader?.let((v) => headers['x-amz-timecustom-header'] =
        _s.unixTimestampToJson(v).toString());
    timeFormatInHeader?.let((v) => headers['x-amz-timeformat-header'] =
        _s.unixTimestampToJson(v).toString());
    final $query = <String, List<String>>{
      if (timeArgInQuery != null)
        'TimeQuery': [_s.iso8601ToJson(timeArgInQuery).toString()],
      if (timeCustomInQuery != null)
        'TimeCustomQuery': [
          _s.unixTimestampToJson(timeCustomInQuery).toString().toString()
        ],
      if (timeFormatInQuery != null)
        'TimeFormatQuery': [
          _s.unixTimestampToJson(timeFormatInQuery).toString().toString()
        ],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      queryParams: $query,
      headers: headers,
      payload: InputShape(
              timeArg: timeArg,
              timeArgInHeader: timeArgInHeader,
              timeArgInQuery: timeArgInQuery,
              timeCustom: timeCustom,
              timeCustomInHeader: timeCustomInHeader,
              timeCustomInQuery: timeCustomInQuery,
              timeFormat: timeFormat,
              timeFormatInHeader: timeFormatInHeader,
              timeFormatInQuery: timeFormatInQuery)
          .toXml(
        'TimestampStructure',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final DateTime timeArg;
  final DateTime timeArgInHeader;
  final DateTime timeArgInQuery;
  final DateTime timeCustom;
  final DateTime timeCustomInHeader;
  final DateTime timeCustomInQuery;
  final DateTime timeFormat;
  final DateTime timeFormatInHeader;
  final DateTime timeFormatInQuery;

  InputShape({
    this.timeArg,
    this.timeArgInHeader,
    this.timeArgInQuery,
    this.timeCustom,
    this.timeCustomInHeader,
    this.timeCustomInQuery,
    this.timeFormat,
    this.timeFormatInHeader,
    this.timeFormatInQuery,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (timeArg != null) _s.encodeXmlDateTimeValue('TimeArg', timeArg),
      if (timeCustom != null)
        _s.encodeXmlDateTimeValue('TimeCustom', timeCustom,
            formatter: _s.rfc822ToJson),
      if (timeFormat != null)
        _s.encodeXmlDateTimeValue('TimeFormat', timeFormat,
            formatter: _s.rfc822ToJson),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
