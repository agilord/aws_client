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

/// List with custom member name
class ListWithCustomMemberName {
  final _s.RestXmlProtocol _protocol;
  ListWithCustomMemberName({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ListWithCustomMemberName',
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
  final List<String> listMember;

  OutputShape({
    this.listMember,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      listMember: _s
          .extractXmlChild(elem, 'ListMember')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'item')),
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
