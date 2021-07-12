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

/// Normal map
class NormalMap {
  final _s.RestXmlProtocol _protocol;
  NormalMap({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NormalMap',
          ),
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
    return OutputShape.fromXml($result.body);
  }
}

class OutputShape {
  final Map<String, SingleStructure>? map;

  OutputShape({
    this.map,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      map: (json['Map'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, SingleStructure.fromJson(e as Map<String, dynamic>))),
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      map: Map.fromEntries(
        elem.getElement('Map')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    SingleStructure.fromXml(_s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final map = this.map;
    return {
      if (map != null) 'Map': map,
    };
  }
}

class SingleStructure {
  final String? foo;

  SingleStructure({
    this.foo,
  });

  factory SingleStructure.fromJson(Map<String, dynamic> json) {
    return SingleStructure(
      foo: json['foo'] as String?,
    );
  }

  factory SingleStructure.fromXml(_s.XmlElement elem) {
    return SingleStructure(
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
