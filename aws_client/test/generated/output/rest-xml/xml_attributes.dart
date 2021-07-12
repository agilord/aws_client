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

/// XML Attributes
class XmlAttributes {
  final _s.RestXmlProtocol _protocol;
  XmlAttributes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  final List<ItemShape>? listItems;

  OutputShape({
    this.listItems,
  });

  factory OutputShape.fromJson(Map<String, dynamic> json) {
    return OutputShape(
      listItems: (json['ItemsList'] as List?)
          ?.whereNotNull()
          .map((e) => ItemShape.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      listItems: _s.extractXmlChild(elem, 'ItemsList')?.let((elem) =>
          elem.findElements('Item').map((c) => ItemShape.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final listItems = this.listItems;
    return {
      if (listItems != null) 'ItemsList': listItems,
    };
  }
}

class ItemShape {
  final ItemDetailShape? itemDetail;

  ItemShape({
    this.itemDetail,
  });

  factory ItemShape.fromJson(Map<String, dynamic> json) {
    return ItemShape(
      itemDetail: json['ItemDetail'] != null
          ? ItemDetailShape.fromJson(json['ItemDetail'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ItemShape.fromXml(_s.XmlElement elem) {
    return ItemShape(
      itemDetail: _s
          .extractXmlChild(elem, 'ItemDetail')
          ?.let((e) => ItemDetailShape.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final itemDetail = this.itemDetail;
    return {
      if (itemDetail != null) 'ItemDetail': itemDetail,
    };
  }
}

class ItemDetailShape {
  final ItemType type;
  final String? id;

  ItemDetailShape({
    required this.type,
    this.id,
  });

  factory ItemDetailShape.fromJson(Map<String, dynamic> json) {
    return ItemDetailShape(
      type: (json['xsi:type'] as String).toItemType(),
      id: json['ID'] as String?,
    );
  }

  factory ItemDetailShape.fromXml(_s.XmlElement elem) {
    return ItemDetailShape(
      type: _s.extractXmlStringAttribute(elem, 'xsi:type')!.toItemType(),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final id = this.id;
    return {
      'xsi:type': type.toValue(),
      if (id != null) 'ID': id,
    };
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
    throw Exception('$this is not known in enum ItemType');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
