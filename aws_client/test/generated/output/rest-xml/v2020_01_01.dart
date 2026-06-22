// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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
  factory XmlAttributes({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'XMLAttributes',
    );
    return XmlAttributes._(
      protocol: _s.RestXmlProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.forProtocol(
            service: service, region: region, endpointUrl: endpointUrl),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  XmlAttributes._({
    required _s.RestXmlProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<OutputShape> operationName0() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/path',
      exceptionFnMap: _exceptionFns,
    );
    return OutputShape.fromXml($result.body);
  }
}

/// @nodoc
class OutputShape {
  final List<ItemShape>? listItems;

  OutputShape({
    this.listItems,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      listItems: _s.extractXmlChild(elem, 'ItemsList')?.let(
          (elem) => elem.findElements('Item').map(ItemShape.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final listItems = this.listItems;
    return {
      if (listItems != null) 'ItemsList': listItems,
    };
  }
}

/// @nodoc
class ItemShape {
  final ItemDetailShape? itemDetail;

  ItemShape({
    this.itemDetail,
  });
  factory ItemShape.fromXml(_s.XmlElement elem) {
    return ItemShape(
      itemDetail:
          _s.extractXmlChild(elem, 'ItemDetail')?.let(ItemDetailShape.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final itemDetail = this.itemDetail;
    return {
      if (itemDetail != null) 'ItemDetail': itemDetail,
    };
  }
}

/// @nodoc
class ItemDetailShape {
  final ItemType type;
  final String? id;

  ItemDetailShape({
    required this.type,
    this.id,
  });
  factory ItemDetailShape.fromXml(_s.XmlElement elem) {
    return ItemDetailShape(
      type: _s
          .extractXmlStringAttribute(elem, 'xsi:type')!
          .let(ItemType.fromString),
      id: _s.extractXmlStringValue(elem, 'ID'),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final id = this.id;
    return {
      'xsi:type': type.value,
      if (id != null) 'ID': id,
    };
  }
}

/// @nodoc
class ItemType {
  static const type1 = ItemType._('Type1');
  static const type2 = ItemType._('Type2');
  static const type3 = ItemType._('Type3');

  final String value;

  const ItemType._(this.value);

  static const values = [type1, type2, type3];

  static ItemType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ItemType._(value));

  @override
  bool operator ==(other) => other is ItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
