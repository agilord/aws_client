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

/// Serialize other scalar types
class SerializeOtherScalarTypes {
  final _s.RestXmlProtocol _protocol;
  SerializeOtherScalarTypes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'SerializeOtherScalarTypes',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    bool? first,
    int? fourth,
    bool? second,
    double? third,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      payload:
          InputShape(first: first, fourth: fourth, second: second, third: third)
              .toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final bool? first;
  final int? fourth;
  final bool? second;
  final double? third;

  InputShape({
    this.first,
    this.fourth,
    this.second,
    this.third,
  });

  factory InputShape.fromJson(Map<String, dynamic> json) {
    return InputShape(
      first: json['First'] as bool?,
      fourth: json['Fourth'] as int?,
      second: json['Second'] as bool?,
      third: json['Third'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final first = this.first;
    final fourth = this.fourth;
    final second = this.second;
    final third = this.third;
    return {
      if (first != null) 'First': first,
      if (fourth != null) 'Fourth': fourth,
      if (second != null) 'Second': second,
      if (third != null) 'Third': third,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final first = this.first;
    final fourth = this.fourth;
    final second = this.second;
    final third = this.third;
    final $children = <_s.XmlNode>[
      if (first != null) _s.encodeXmlBoolValue('First', first),
      if (second != null) _s.encodeXmlBoolValue('Second', second),
      if (third != null) _s.encodeXmlDoubleValue('Third', third),
      if (fourth != null) _s.encodeXmlIntValue('Fourth', fourth),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
