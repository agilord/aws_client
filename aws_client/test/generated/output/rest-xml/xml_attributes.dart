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

/// XML Attributes
class XmlAttributes {
  final _s.RestXmlProtocol _protocol;
  XmlAttributes({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'XMLAttributes',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result.body);
  }
}

class OutputShape {
  final List<ItemShape> listItems;

  OutputShape({
    this.listItems,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      listItems: _s.extractXmlChild(elem, 'ItemsList')?.let((elem) =>
          elem.findElements('Item').map((c) => ItemShape.fromXml(c)).toList()),
    );
  }
}

class ItemShape {
  final ItemDetailShape itemDetail;

  ItemShape({
    this.itemDetail,
  });
  factory ItemShape.fromXml(_s.XmlElement elem) {
    return ItemShape(
      itemDetail: _s
          .extractXmlChild(elem, 'ItemDetail')
          ?.let((e) => ItemDetailShape.fromXml(e)),
    );
  }
}

class ItemDetailShape {
  final ItemType type;
  final String id;

  ItemDetailShape({
    @_s.required this.type,
    this.id,
  });
  factory ItemDetailShape.fromXml(_s.XmlElement elem) {
    return ItemDetailShape(
      type: _s.extractXmlStringAttribute(elem, 'xsi:type')?.toItemType(),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }
}

enum ItemType {
  type1,
  type2,
  type3,
}

extension on ItemType {
  String toValue() {
    switch (this) {
      case ItemType.type1:
        return 'Type1';
      case ItemType.type2:
        return 'Type2';
      case ItemType.type3:
        return 'Type3';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ItemType toItemType() {
    switch (this) {
      case 'Type1':
        return ItemType.type1;
      case 'Type2':
        return ItemType.type2;
      case 'Type3':
        return ItemType.type3;
    }
    throw Exception('Unknown enum value: $this');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
