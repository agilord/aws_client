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

/// Basic XML serialization
class BasicXMLSerialization {
  final _s.RestXmlProtocol _protocol;
  BasicXMLSerialization({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'BasicXMLSerialization',
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

  Future<void> operationName0({
    String? description,
    String? name,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2014-01-01/hostedzone',
      payload: InputShape(description: description, name: name).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    String? description,
    String? name,
  }) async {
    await _protocol.send(
      method: 'PUT',
      requestUri: '/2014-01-01/hostedzone',
      payload: InputShape(description: description, name: name).toXml(
        'OperationRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'), 'https://foo/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2() async {
    await _protocol.send(
      method: 'GET',
      requestUri: '/2014-01-01/hostedzone',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class InputShape {
  final String? description;
  final String? name;

  InputShape({
    this.description,
    this.name,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final description = this.description;
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name),
      if (description != null)
        _s.encodeXmlStringValue('Description', description),
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
