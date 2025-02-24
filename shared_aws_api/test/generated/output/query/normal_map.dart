// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Normal map
class NormalMap {
  final _s.QueryProtocol _protocol;

  NormalMap({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'NormalMap',
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

  Future<OutputShape> operationName0() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'OperationNameResult',
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final Map<String, StructType>? map;

  OutputShape({
    this.map,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      map: Map.fromEntries(
        elem.getElement('Map')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    StructType.fromXml(_s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }
}

class StructType {
  final String? foo;

  StructType({
    this.foo,
  });
  factory StructType.fromXml(_s.XmlElement elem) {
    return StructType(
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
