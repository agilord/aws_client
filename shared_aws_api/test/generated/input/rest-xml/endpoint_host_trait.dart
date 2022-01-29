// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Endpoint host trait
class EndpointHostTrait {
  final _s.RestXmlProtocol _protocol;
  EndpointHostTrait({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'EndpointHostTrait',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<void> staticOp0({
    String? name,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: StaticInputShape(name: name).toXml('StaticOpRequest'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> memberRefOp1({
    String? name,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      payload: MemberRefInputShape(name: name).toXml('MemberRefOpRequest'),
      exceptionFnMap: _exceptionFns,
    );
  }
}

class StaticInputShape {
  final String? name;

  StaticInputShape({
    this.name,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name),
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

class MemberRefInputShape {
  final String? name;

  MemberRefInputShape({
    this.name,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name),
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
