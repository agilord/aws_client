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

/// Recursive shapes
class RecursiveShapes {
  final _s.RestXmlProtocol _protocol;
  RecursiveShapes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: 'RecursiveShapes',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<void> operationName0({
    RecursiveStructType recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName1({
    RecursiveStructType recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName2({
    RecursiveStructType recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName3({
    RecursiveStructType recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName4({
    RecursiveStructType recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> operationName5({
    RecursiveStructType recursiveStruct,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class RecursiveStructType {
  final String noRecurse;
  final List<RecursiveStructType> recursiveList;
  final Map<String, RecursiveStructType> recursiveMap;
  final RecursiveStructType recursiveStruct;

  RecursiveStructType({
    this.noRecurse,
    this.recursiveList,
    this.recursiveMap,
    this.recursiveStruct,
  });
  _s.XmlElement toXml(String elemName) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('NoRecurse', noRecurse),
      if (recursiveList != null)
        _s.XmlElement(_s.XmlName('RecursiveList'), [], <_s.XmlNode>[
          ...recursiveList.map((v) => v.toXml('RecursiveList'))
        ]),
      if (recursiveMap != null)
        throw UnimplementedError('XML map: RecursiveMapType'),
      recursiveStruct.toXml('RecursiveStruct'),
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      [],
      $children.where((e) => e != null),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
