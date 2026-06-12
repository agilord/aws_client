// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

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

/// A query service that sends query requests and XML responses.
class QueryProtocol {
  final _s.QueryProtocol _protocol;

  QueryProtocol({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'awsquery',
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

  Future<DatetimeOffsetsOutput> datetimeOffsets() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'DatetimeOffsets',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DatetimeOffsetsResult',
    );
    return DatetimeOffsetsOutput.fromXml($result);
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response members. While this should be rare, code generators
  /// must support this.
  Future<void> emptyInputAndEmptyOutput() async {
    final $request = <String, String>{};
    await _protocol.send(
      $request,
      action: 'EmptyInputAndEmptyOutput',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'EmptyInputAndEmptyOutputResult',
    );
  }

  Future<void> endpointOperation() async {
    final $request = <String, String>{};
    await _protocol.send(
      $request,
      action: 'EndpointOperation',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> endpointWithHostLabelOperation({
    required String label,
  }) async {
    final $request = <String, String>{
      'label': label,
    };
    await _protocol.send(
      $request,
      action: 'EndpointWithHostLabelOperation',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Flattened maps
  Future<FlattenedXmlMapOutput> flattenedXmlMap() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'FlattenedXmlMap',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'FlattenedXmlMapResult',
    );
    return FlattenedXmlMapOutput.fromXml($result);
  }

  /// Flattened maps with @xmlName
  Future<FlattenedXmlMapWithXmlNameOutput> flattenedXmlMapWithXmlName() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'FlattenedXmlMapWithXmlName',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'FlattenedXmlMapWithXmlNameResult',
    );
    return FlattenedXmlMapWithXmlNameOutput.fromXml($result);
  }

  /// Flattened maps with @xmlNamespace and @xmlName
  Future<FlattenedXmlMapWithXmlNamespaceOutput>
      flattenedXmlMapWithXmlNamespace() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'FlattenedXmlMapWithXmlNamespace',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'FlattenedXmlMapWithXmlNamespaceResult',
    );
    return FlattenedXmlMapWithXmlNamespaceOutput.fromXml($result);
  }

  Future<FractionalSecondsOutput> fractionalSeconds() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'FractionalSeconds',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'FractionalSecondsResult',
    );
    return FractionalSecondsOutput.fromXml($result);
  }

  /// This operation has three possible return values: 1. A successful response
  /// in the form of GreetingWithErrorsOutput 2. An InvalidGreeting error. 3. A
  /// BadRequest error.
  ///
  /// May throw [ComplexError].
  /// May throw [CustomCodeError].
  /// May throw [InvalidGreeting].
  Future<GreetingWithErrorsOutput> greetingWithErrors() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'GreetingWithErrors',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'GreetingWithErrorsResult',
    );
    return GreetingWithErrorsOutput.fromXml($result);
  }

  Future<void> hostWithPathOperation() async {
    final $request = <String, String>{};
    await _protocol.send(
      $request,
      action: 'HostWithPathOperation',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The xmlName trait on the output structure is ignored in AWS Query. The
  /// wrapping element is always operation name + "Response", and inside of that
  /// wrapper is another wrapper named operation name + "Result".
  Future<IgnoresWrappingXmlNameOutput> ignoresWrappingXmlName() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'IgnoresWrappingXmlName',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'IgnoresWrappingXmlNameResult',
    );
    return IgnoresWrappingXmlNameOutput.fromXml($result);
  }

  /// This test serializes nested and recursive structure members.
  Future<void> nestedStructures({
    StructArg? nested,
  }) async {
    final $request = <String, String>{
      if (nested != null)
        for (var e1 in nested.toQueryMap().entries)
          'Nested.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'NestedStructures',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has no input or
  /// output. While this should be rare, code generators must support this.
  Future<void> noInputAndNoOutput() async {
    final $request = <String, String>{};
    await _protocol.send(
      $request,
      action: 'NoInputAndNoOutput',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request payload or response members. While this should be rare, code
  /// generators must support this.
  Future<void> noInputAndOutput() async {
    final $request = <String, String>{};
    await _protocol.send(
      $request,
      action: 'NoInputAndOutput',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'NoInputAndOutputResult',
    );
  }

  Future<void> putWithContentEncoding({
    String? data,
    String? encoding,
  }) async {
    final $request = <String, String>{
      if (data != null) 'data': data,
      if (encoding != null) 'encoding': encoding,
    };
    await _protocol.send(
      $request,
      action: 'PutWithContentEncoding',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Automatically adds idempotency tokens.
  Future<void> queryIdempotencyTokenAutoFill({
    String? token,
  }) async {
    final $request = <String, String>{
      'token': token ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      $request,
      action: 'QueryIdempotencyTokenAutoFill',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This test serializes simple and complex lists.
  Future<void> queryLists({
    List<GreetingStruct>? complexListArg,
    List<String>? flattenedListArg,
    List<String>? flattenedListArgWithXmlName,
    List<String>? listArg,
    List<String>? listArgWithXmlNameMember,
    NestedStructWithList? nestedWithList,
  }) async {
    final $request = <String, String>{
      if (complexListArg != null)
        if (complexListArg.isEmpty)
          'ComplexListArg': ''
        else
          for (var i1 = 0; i1 < complexListArg.length; i1++)
            for (var e3 in complexListArg[i1].toQueryMap().entries)
              'ComplexListArg.member.${i1 + 1}.${e3.key}': e3.value,
      if (flattenedListArg != null)
        if (flattenedListArg.isEmpty)
          'FlattenedListArg': ''
        else
          for (var i1 = 0; i1 < flattenedListArg.length; i1++)
            'FlattenedListArg.member.${i1 + 1}': flattenedListArg[i1],
      if (flattenedListArgWithXmlName != null)
        if (flattenedListArgWithXmlName.isEmpty)
          'FlattenedListArgWithXmlName': ''
        else
          for (var i1 = 0; i1 < flattenedListArgWithXmlName.length; i1++)
            'FlattenedListArgWithXmlName.item.${i1 + 1}':
                flattenedListArgWithXmlName[i1],
      if (listArg != null)
        if (listArg.isEmpty)
          'ListArg': ''
        else
          for (var i1 = 0; i1 < listArg.length; i1++)
            'ListArg.member.${i1 + 1}': listArg[i1],
      if (listArgWithXmlNameMember != null)
        if (listArgWithXmlNameMember.isEmpty)
          'ListArgWithXmlNameMember': ''
        else
          for (var i1 = 0; i1 < listArgWithXmlNameMember.length; i1++)
            'ListArgWithXmlNameMember.item.${i1 + 1}':
                listArgWithXmlNameMember[i1],
      if (nestedWithList != null)
        for (var e1 in nestedWithList.toQueryMap().entries)
          'NestedWithList.${e1.key}': e1.value,
    };
    await _protocol.send(
      $request,
      action: 'QueryLists',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This test serializes simple and complex maps.
  Future<void> queryMaps({
    Map<String, GreetingStruct>? complexMapArg,
    Map<String, String>? flattenedMap,
    Map<String, String>? flattenedMapWithXmlName,
    Map<String, String>? mapArg,
    Map<String, List<String>>? mapOfLists,
    Map<String, String>? mapWithXmlMemberName,
    NestedStructWithMap? nestedStructWithMap,
    Map<String, String>? renamedMapArg,
  }) async {
    final $request = <String, String>{
      if (complexMapArg != null)
        for (var e1 in complexMapArg.entries.toList().asMap().entries) ...{
          'ComplexMapArg.entry.${e1.key + 1}.key': e1.value.key,
          for (var e4 in e1.value.value.toQueryMap().entries)
            'ComplexMapArg.entry.${e1.key + 1}.value.${e4.key}': e4.value,
        },
      if (flattenedMap != null)
        for (var e1 in flattenedMap.entries.toList().asMap().entries) ...{
          'FlattenedMap.entry.${e1.key + 1}.key': e1.value.key,
          'FlattenedMap.entry.${e1.key + 1}.value': e1.value.value,
        },
      if (flattenedMapWithXmlName != null)
        for (var e1
            in flattenedMapWithXmlName.entries.toList().asMap().entries) ...{
          'FlattenedMapWithXmlName.entry.${e1.key + 1}.K': e1.value.key,
          'FlattenedMapWithXmlName.entry.${e1.key + 1}.V': e1.value.value,
        },
      if (mapArg != null)
        for (var e1 in mapArg.entries.toList().asMap().entries) ...{
          'MapArg.entry.${e1.key + 1}.key': e1.value.key,
          'MapArg.entry.${e1.key + 1}.value': e1.value.value,
        },
      if (mapOfLists != null)
        for (var e1 in mapOfLists.entries.toList().asMap().entries) ...{
          'MapOfLists.entry.${e1.key + 1}.key': e1.value.key,
          if (e1.value.value.isEmpty)
            'MapOfLists.entry.${e1.key + 1}.value': ''
          else
            for (var i4 = 0; i4 < e1.value.value.length; i4++)
              'MapOfLists.entry.${e1.key + 1}.value.member.${i4 + 1}':
                  e1.value.value[i4],
        },
      if (mapWithXmlMemberName != null)
        for (var e1
            in mapWithXmlMemberName.entries.toList().asMap().entries) ...{
          'MapWithXmlMemberName.entry.${e1.key + 1}.K': e1.value.key,
          'MapWithXmlMemberName.entry.${e1.key + 1}.V': e1.value.value,
        },
      if (nestedStructWithMap != null)
        for (var e1 in nestedStructWithMap.toQueryMap().entries)
          'NestedStructWithMap.${e1.key}': e1.value,
      if (renamedMapArg != null)
        for (var e1 in renamedMapArg.entries.toList().asMap().entries) ...{
          'RenamedMapArg.entry.${e1.key + 1}.key': e1.value.key,
          'RenamedMapArg.entry.${e1.key + 1}.value': e1.value.value,
        },
    };
    await _protocol.send(
      $request,
      action: 'QueryMaps',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This test serializes timestamps. 1. Timestamps are serialized as RFC 3339
  /// date-time values by default. 2. A timestampFormat trait on a member
  /// changes the format. 3. A timestampFormat trait on the shape targeted by
  /// the member changes the format.
  Future<void> queryTimestamps({
    DateTime? epochMember,
    DateTime? epochTarget,
    DateTime? normalFormat,
  }) async {
    final $request = <String, String>{
      if (epochMember != null)
        'epochMember': _s.unixTimestampToJson(epochMember).toString(),
      if (epochTarget != null)
        'epochTarget': _s.unixTimestampToJson(epochTarget).toString(),
      if (normalFormat != null) 'normalFormat': _s.iso8601ToJson(normalFormat),
    };
    await _protocol.send(
      $request,
      action: 'QueryTimestamps',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Recursive shapes
  Future<RecursiveXmlShapesOutput> recursiveXmlShapes() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'RecursiveXmlShapes',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'RecursiveXmlShapesResult',
    );
    return RecursiveXmlShapesOutput.fromXml($result);
  }

  /// This test serializes strings, numbers, and boolean values.
  Future<void> simpleInputParams({
    int? bam,
    String? bar,
    bool? baz,
    double? boo,
    double? floatValue,
    String? foo,
    FooEnum? fooEnum,
    int? integerEnum,
    Uint8List? qux,
  }) async {
    final $request = <String, String>{
      if (bam != null) 'Bam': bam.toString(),
      if (bar != null) 'Bar': bar,
      if (baz != null) 'Baz': baz.toString(),
      if (boo != null) 'Boo': boo.toString(),
      if (floatValue != null) 'FloatValue': floatValue.toString(),
      if (foo != null) 'Foo': foo,
      if (fooEnum != null) 'FooEnum': fooEnum.value,
      if (integerEnum != null) 'IntegerEnum': integerEnum.toString(),
      if (qux != null) 'Qux': base64Encode(qux),
    };
    await _protocol.send(
      $request,
      action: 'SimpleInputParams',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<SimpleScalarXmlPropertiesOutput> simpleScalarXmlProperties() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'SimpleScalarXmlProperties',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'SimpleScalarXmlPropertiesResult',
    );
    return SimpleScalarXmlPropertiesOutput.fromXml($result);
  }

  /// Blobs are base64 encoded
  Future<XmlBlobsOutput> xmlBlobs() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlBlobs',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlBlobsResult',
    );
    return XmlBlobsOutput.fromXml($result);
  }

  Future<XmlBlobsOutput> xmlEmptyBlobs() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlEmptyBlobs',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlEmptyBlobsResult',
    );
    return XmlBlobsOutput.fromXml($result);
  }

  Future<XmlListsOutput> xmlEmptyLists() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlEmptyLists',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlEmptyListsResult',
    );
    return XmlListsOutput.fromXml($result);
  }

  Future<XmlMapsOutput> xmlEmptyMaps() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlEmptyMaps',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlEmptyMapsResult',
    );
    return XmlMapsOutput.fromXml($result);
  }

  /// This example serializes enums as top level properties, in lists, sets, and
  /// maps.
  Future<XmlEnumsOutput> xmlEnums() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlEnums',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlEnumsResult',
    );
    return XmlEnumsOutput.fromXml($result);
  }

  /// This example serializes enums as top level properties, in lists, sets, and
  /// maps.
  Future<XmlIntEnumsOutput> xmlIntEnums() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlIntEnums',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlIntEnumsResult',
    );
    return XmlIntEnumsOutput.fromXml($result);
  }

  /// This test case serializes XML lists for the following cases for both input
  /// and output: 1. Normal XML lists. 2. Normal XML sets. 3. XML lists of
  /// lists. 4. XML lists with @xmlName on its members 5. Flattened XML lists.
  /// 6. Flattened XML lists with @xmlName. 7. Lists of structures.
  Future<XmlListsOutput> xmlLists() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlLists',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlListsResult',
    );
    return XmlListsOutput.fromXml($result);
  }

  /// The example tests basic map serialization.
  Future<XmlMapsOutput> xmlMaps() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlMaps',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlMapsResult',
    );
    return XmlMapsOutput.fromXml($result);
  }

  Future<XmlMapsXmlNameOutput> xmlMapsXmlName() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlMapsXmlName',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlMapsXmlNameResult',
    );
    return XmlMapsXmlNameOutput.fromXml($result);
  }

  Future<XmlNamespacesOutput> xmlNamespaces() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlNamespaces',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlNamespacesResult',
    );
    return XmlNamespacesOutput.fromXml($result);
  }

  /// This tests how timestamps are serialized, including using the default
  /// format of date-time and various @timestampFormat trait values.
  Future<XmlTimestampsOutput> xmlTimestamps() async {
    final $request = <String, String>{};
    final $result = await _protocol.send(
      $request,
      action: 'XmlTimestamps',
      version: '2020-01-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'XmlTimestampsResult',
    );
    return XmlTimestampsOutput.fromXml($result);
  }
}

class DatetimeOffsetsOutput {
  final DateTime? datetime;

  DatetimeOffsetsOutput({
    this.datetime,
  });
  factory DatetimeOffsetsOutput.fromXml(_s.XmlElement elem) {
    return DatetimeOffsetsOutput(
      datetime: _s.extractXmlDateTimeValue(elem, 'datetime',
          parser: _s.timeStampFromJson),
    );
  }

  Map<String, dynamic> toJson() {
    final datetime = this.datetime;
    return {
      if (datetime != null) 'datetime': iso8601ToJson(datetime),
    };
  }
}

class EmptyInputAndEmptyOutputOutput {
  EmptyInputAndEmptyOutputOutput();
  factory EmptyInputAndEmptyOutputOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return EmptyInputAndEmptyOutputOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class FlattenedXmlMapOutput {
  final Map<String, FooEnum>? myMap;

  FlattenedXmlMapOutput({
    this.myMap,
  });
  factory FlattenedXmlMapOutput.fromXml(_s.XmlElement elem) {
    return FlattenedXmlMapOutput(
      myMap: Map.fromEntries(
        elem.findElements('myMap').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key')!,
                _s.extractXmlStringValue(c, 'value')!.let(FooEnum.fromString),
              ),
            ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap.map((k, e) => MapEntry(k, e.value)),
    };
  }
}

class FlattenedXmlMapWithXmlNameOutput {
  final Map<String, String>? myMap;

  FlattenedXmlMapWithXmlNameOutput({
    this.myMap,
  });
  factory FlattenedXmlMapWithXmlNameOutput.fromXml(_s.XmlElement elem) {
    return FlattenedXmlMapWithXmlNameOutput(
      myMap: Map.fromEntries(
        elem.findElements('KVP').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'K')!,
                _s.extractXmlStringValue(c, 'V')!,
              ),
            ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'KVP': myMap,
    };
  }
}

class FlattenedXmlMapWithXmlNamespaceOutput {
  final Map<String, String>? myMap;

  FlattenedXmlMapWithXmlNamespaceOutput({
    this.myMap,
  });
  factory FlattenedXmlMapWithXmlNamespaceOutput.fromXml(_s.XmlElement elem) {
    return FlattenedXmlMapWithXmlNamespaceOutput(
      myMap: Map.fromEntries(
        elem.findElements('KVP').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'K')!,
                _s.extractXmlStringValue(c, 'V')!,
              ),
            ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'KVP': myMap,
    };
  }
}

class FractionalSecondsOutput {
  final DateTime? datetime;

  FractionalSecondsOutput({
    this.datetime,
  });
  factory FractionalSecondsOutput.fromXml(_s.XmlElement elem) {
    return FractionalSecondsOutput(
      datetime: _s.extractXmlDateTimeValue(elem, 'datetime',
          parser: _s.timeStampFromJson),
    );
  }

  Map<String, dynamic> toJson() {
    final datetime = this.datetime;
    return {
      if (datetime != null) 'datetime': iso8601ToJson(datetime),
    };
  }
}

class GreetingWithErrorsOutput {
  final String? greeting;

  GreetingWithErrorsOutput({
    this.greeting,
  });
  factory GreetingWithErrorsOutput.fromXml(_s.XmlElement elem) {
    return GreetingWithErrorsOutput(
      greeting: _s.extractXmlStringValue(elem, 'greeting'),
    );
  }

  Map<String, dynamic> toJson() {
    final greeting = this.greeting;
    return {
      if (greeting != null) 'greeting': greeting,
    };
  }
}

class IgnoresWrappingXmlNameOutput {
  final String? foo;

  IgnoresWrappingXmlNameOutput({
    this.foo,
  });
  factory IgnoresWrappingXmlNameOutput.fromXml(_s.XmlElement elem) {
    return IgnoresWrappingXmlNameOutput(
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

class NoInputAndOutputOutput {
  NoInputAndOutputOutput();
  factory NoInputAndOutputOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return NoInputAndOutputOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RecursiveXmlShapesOutput {
  final RecursiveXmlShapesOutputNested1? nested;

  RecursiveXmlShapesOutput({
    this.nested,
  });
  factory RecursiveXmlShapesOutput.fromXml(_s.XmlElement elem) {
    return RecursiveXmlShapesOutput(
      nested: _s
          .extractXmlChild(elem, 'nested')
          ?.let(RecursiveXmlShapesOutputNested1.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class SimpleScalarXmlPropertiesOutput {
  final int? byteValue;
  final double? doubleValue;
  final String? emptyStringValue;
  final bool? falseBooleanValue;
  final double? floatValue;
  final int? integerValue;
  final int? longValue;
  final int? shortValue;
  final String? stringValue;
  final bool? trueBooleanValue;

  SimpleScalarXmlPropertiesOutput({
    this.byteValue,
    this.doubleValue,
    this.emptyStringValue,
    this.falseBooleanValue,
    this.floatValue,
    this.integerValue,
    this.longValue,
    this.shortValue,
    this.stringValue,
    this.trueBooleanValue,
  });
  factory SimpleScalarXmlPropertiesOutput.fromXml(_s.XmlElement elem) {
    return SimpleScalarXmlPropertiesOutput(
      byteValue: _s.extractXmlIntValue(elem, 'byteValue'),
      doubleValue: _s.extractXmlDoubleValue(elem, 'DoubleDribble'),
      emptyStringValue: _s.extractXmlStringValue(elem, 'emptyStringValue'),
      falseBooleanValue: _s.extractXmlBoolValue(elem, 'falseBooleanValue'),
      floatValue: _s.extractXmlDoubleValue(elem, 'floatValue'),
      integerValue: _s.extractXmlIntValue(elem, 'integerValue'),
      longValue: _s.extractXmlIntValue(elem, 'longValue'),
      shortValue: _s.extractXmlIntValue(elem, 'shortValue'),
      stringValue: _s.extractXmlStringValue(elem, 'stringValue'),
      trueBooleanValue: _s.extractXmlBoolValue(elem, 'trueBooleanValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final byteValue = this.byteValue;
    final doubleValue = this.doubleValue;
    final emptyStringValue = this.emptyStringValue;
    final falseBooleanValue = this.falseBooleanValue;
    final floatValue = this.floatValue;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final shortValue = this.shortValue;
    final stringValue = this.stringValue;
    final trueBooleanValue = this.trueBooleanValue;
    return {
      if (byteValue != null) 'byteValue': byteValue,
      if (doubleValue != null) 'DoubleDribble': doubleValue,
      if (emptyStringValue != null) 'emptyStringValue': emptyStringValue,
      if (falseBooleanValue != null) 'falseBooleanValue': falseBooleanValue,
      if (floatValue != null) 'floatValue': floatValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (longValue != null) 'longValue': longValue,
      if (shortValue != null) 'shortValue': shortValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (trueBooleanValue != null) 'trueBooleanValue': trueBooleanValue,
    };
  }
}

class XmlBlobsOutput {
  final Uint8List? data;

  XmlBlobsOutput({
    this.data,
  });
  factory XmlBlobsOutput.fromXml(_s.XmlElement elem) {
    return XmlBlobsOutput(
      data: _s.extractXmlUint8ListValue(elem, 'data'),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': base64Encode(data),
    };
  }
}

class XmlListsOutput {
  final List<bool>? booleanList;
  final List<FooEnum>? enumList;
  final List<String>? flattenedList;
  final List<String>? flattenedList2;
  final List<String>? flattenedListWithMemberNamespace;
  final List<String>? flattenedListWithNamespace;
  final List<int>? intEnumList;
  final List<int>? integerList;
  final List<List<String>>? nestedStringList;
  final List<String>? renamedListMembers;
  final List<String>? stringList;
  final List<String>? stringSet;
  final List<StructureListMember>? structureList;
  final List<DateTime>? timestampList;

  XmlListsOutput({
    this.booleanList,
    this.enumList,
    this.flattenedList,
    this.flattenedList2,
    this.flattenedListWithMemberNamespace,
    this.flattenedListWithNamespace,
    this.intEnumList,
    this.integerList,
    this.nestedStringList,
    this.renamedListMembers,
    this.stringList,
    this.stringSet,
    this.structureList,
    this.timestampList,
  });
  factory XmlListsOutput.fromXml(_s.XmlElement elem) {
    return XmlListsOutput(
      booleanList: _s
          .extractXmlChild(elem, 'booleanList')
          ?.let((elem) => _s.extractXmlBoolListValues(elem, 'member')),
      enumList: _s.extractXmlChild(elem, 'enumList')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map(FooEnum.fromString)
          .toList()),
      flattenedList: _s.extractXmlStringListValues(elem, 'item'),
      flattenedList2: _s.extractXmlStringListValues(elem, 'item'),
      flattenedListWithMemberNamespace: _s.extractXmlStringListValues(
          elem, 'flattenedListWithMemberNamespace'),
      flattenedListWithNamespace:
          _s.extractXmlStringListValues(elem, 'flattenedListWithNamespace'),
      intEnumList: _s
          .extractXmlChild(elem, 'intEnumList')
          ?.let((elem) => _s.extractXmlIntListValues(elem, 'member')),
      integerList: _s
          .extractXmlChild(elem, 'integerList')
          ?.let((elem) => _s.extractXmlIntListValues(elem, 'member')),
      nestedStringList: _s.extractXmlChild(elem, 'nestedStringList')?.let(
          (elem) => elem
              .findElements('member')
              .map((e) => _s.extractXmlStringListValues(e, 'member'))
              .toList()),
      renamedListMembers: _s
          .extractXmlChild(elem, 'renamed')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'item')),
      stringList: _s
          .extractXmlChild(elem, 'stringList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      stringSet: _s
          .extractXmlChild(elem, 'stringSet')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      structureList: _s.extractXmlChild(elem, 'myStructureList')?.let((elem) =>
          elem.findElements('item').map(StructureListMember.fromXml).toList()),
      timestampList: _s
          .extractXmlChild(elem, 'timestampList')
          ?.let((elem) => _s.extractXmlDateTimeListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final booleanList = this.booleanList;
    final enumList = this.enumList;
    final flattenedList = this.flattenedList;
    final flattenedList2 = this.flattenedList2;
    final flattenedListWithMemberNamespace =
        this.flattenedListWithMemberNamespace;
    final flattenedListWithNamespace = this.flattenedListWithNamespace;
    final intEnumList = this.intEnumList;
    final integerList = this.integerList;
    final nestedStringList = this.nestedStringList;
    final renamedListMembers = this.renamedListMembers;
    final stringList = this.stringList;
    final stringSet = this.stringSet;
    final structureList = this.structureList;
    final timestampList = this.timestampList;
    return {
      if (booleanList != null) 'booleanList': booleanList,
      if (enumList != null) 'enumList': enumList.map((e) => e.value).toList(),
      if (flattenedList != null) 'flattenedList': flattenedList,
      if (flattenedList2 != null) 'customName': flattenedList2,
      if (flattenedListWithMemberNamespace != null)
        'flattenedListWithMemberNamespace': flattenedListWithMemberNamespace,
      if (flattenedListWithNamespace != null)
        'flattenedListWithNamespace': flattenedListWithNamespace,
      if (intEnumList != null) 'intEnumList': intEnumList,
      if (integerList != null) 'integerList': integerList,
      if (nestedStringList != null) 'nestedStringList': nestedStringList,
      if (renamedListMembers != null) 'renamed': renamedListMembers,
      if (stringList != null) 'stringList': stringList,
      if (stringSet != null) 'stringSet': stringSet,
      if (structureList != null) 'myStructureList': structureList,
      if (timestampList != null)
        'timestampList': timestampList.map(unixTimestampToJson).toList(),
    };
  }
}

class XmlMapsOutput {
  final Map<String, GreetingStruct>? myMap;

  XmlMapsOutput({
    this.myMap,
  });
  factory XmlMapsOutput.fromXml(_s.XmlElement elem) {
    return XmlMapsOutput(
      myMap: Map.fromEntries(
        elem.getElement('myMap')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    GreetingStruct.fromXml(_s.extractXmlChild(c, 'value')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap,
    };
  }
}

class XmlEnumsOutput {
  final FooEnum? fooEnum1;
  final FooEnum? fooEnum2;
  final FooEnum? fooEnum3;
  final List<FooEnum>? fooEnumList;
  final Map<String, FooEnum>? fooEnumMap;
  final List<FooEnum>? fooEnumSet;

  XmlEnumsOutput({
    this.fooEnum1,
    this.fooEnum2,
    this.fooEnum3,
    this.fooEnumList,
    this.fooEnumMap,
    this.fooEnumSet,
  });
  factory XmlEnumsOutput.fromXml(_s.XmlElement elem) {
    return XmlEnumsOutput(
      fooEnum1:
          _s.extractXmlStringValue(elem, 'fooEnum1')?.let(FooEnum.fromString),
      fooEnum2:
          _s.extractXmlStringValue(elem, 'fooEnum2')?.let(FooEnum.fromString),
      fooEnum3:
          _s.extractXmlStringValue(elem, 'fooEnum3')?.let(FooEnum.fromString),
      fooEnumList: _s.extractXmlChild(elem, 'fooEnumList')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map(FooEnum.fromString)
          .toList()),
      fooEnumMap: Map.fromEntries(
        elem.getElement('fooEnumMap')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s
                        .extractXmlStringValue(c, 'value')!
                        .let(FooEnum.fromString),
                  ),
                ) ??
            {},
      ),
      fooEnumSet: _s.extractXmlChild(elem, 'fooEnumSet')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map(FooEnum.fromString)
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final fooEnum1 = this.fooEnum1;
    final fooEnum2 = this.fooEnum2;
    final fooEnum3 = this.fooEnum3;
    final fooEnumList = this.fooEnumList;
    final fooEnumMap = this.fooEnumMap;
    final fooEnumSet = this.fooEnumSet;
    return {
      if (fooEnum1 != null) 'fooEnum1': fooEnum1.value,
      if (fooEnum2 != null) 'fooEnum2': fooEnum2.value,
      if (fooEnum3 != null) 'fooEnum3': fooEnum3.value,
      if (fooEnumList != null)
        'fooEnumList': fooEnumList.map((e) => e.value).toList(),
      if (fooEnumMap != null)
        'fooEnumMap': fooEnumMap.map((k, e) => MapEntry(k, e.value)),
      if (fooEnumSet != null)
        'fooEnumSet': fooEnumSet.map((e) => e.value).toList(),
    };
  }
}

class XmlIntEnumsOutput {
  final int? intEnum1;
  final int? intEnum2;
  final int? intEnum3;
  final List<int>? intEnumList;
  final Map<String, int>? intEnumMap;
  final List<int>? intEnumSet;

  XmlIntEnumsOutput({
    this.intEnum1,
    this.intEnum2,
    this.intEnum3,
    this.intEnumList,
    this.intEnumMap,
    this.intEnumSet,
  });
  factory XmlIntEnumsOutput.fromXml(_s.XmlElement elem) {
    return XmlIntEnumsOutput(
      intEnum1: _s.extractXmlIntValue(elem, 'intEnum1'),
      intEnum2: _s.extractXmlIntValue(elem, 'intEnum2'),
      intEnum3: _s.extractXmlIntValue(elem, 'intEnum3'),
      intEnumList: _s
          .extractXmlChild(elem, 'intEnumList')
          ?.let((elem) => _s.extractXmlIntListValues(elem, 'member')),
      intEnumMap: Map.fromEntries(
        elem.getElement('intEnumMap')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlIntValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      intEnumSet: _s
          .extractXmlChild(elem, 'intEnumSet')
          ?.let((elem) => _s.extractXmlIntListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final intEnum1 = this.intEnum1;
    final intEnum2 = this.intEnum2;
    final intEnum3 = this.intEnum3;
    final intEnumList = this.intEnumList;
    final intEnumMap = this.intEnumMap;
    final intEnumSet = this.intEnumSet;
    return {
      if (intEnum1 != null) 'intEnum1': intEnum1,
      if (intEnum2 != null) 'intEnum2': intEnum2,
      if (intEnum3 != null) 'intEnum3': intEnum3,
      if (intEnumList != null) 'intEnumList': intEnumList,
      if (intEnumMap != null) 'intEnumMap': intEnumMap,
      if (intEnumSet != null) 'intEnumSet': intEnumSet,
    };
  }
}

class XmlMapsXmlNameOutput {
  final Map<String, GreetingStruct>? myMap;

  XmlMapsXmlNameOutput({
    this.myMap,
  });
  factory XmlMapsXmlNameOutput.fromXml(_s.XmlElement elem) {
    return XmlMapsXmlNameOutput(
      myMap: Map.fromEntries(
        elem.getElement('myMap')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'Attribute')!,
                    GreetingStruct.fromXml(_s.extractXmlChild(c, 'Setting')!),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap,
    };
  }
}

class XmlNamespacesOutput {
  final XmlNamespaceNested? nested;

  XmlNamespacesOutput({
    this.nested,
  });
  factory XmlNamespacesOutput.fromXml(_s.XmlElement elem) {
    return XmlNamespacesOutput(
      nested:
          _s.extractXmlChild(elem, 'nested')?.let(XmlNamespaceNested.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class XmlTimestampsOutput {
  final DateTime? dateTime;
  final DateTime? dateTimeOnTarget;
  final DateTime? epochSeconds;
  final DateTime? epochSecondsOnTarget;
  final DateTime? httpDate;
  final DateTime? httpDateOnTarget;
  final DateTime? normal;

  XmlTimestampsOutput({
    this.dateTime,
    this.dateTimeOnTarget,
    this.epochSeconds,
    this.epochSecondsOnTarget,
    this.httpDate,
    this.httpDateOnTarget,
    this.normal,
  });
  factory XmlTimestampsOutput.fromXml(_s.XmlElement elem) {
    return XmlTimestampsOutput(
      dateTime: _s.extractXmlDateTimeValue(elem, 'dateTime',
          parser: _s.timeStampFromJson),
      dateTimeOnTarget: _s.extractXmlDateTimeValue(elem, 'dateTimeOnTarget',
          parser: _s.timeStampFromJson),
      epochSeconds: _s.extractXmlDateTimeValue(elem, 'epochSeconds',
          parser: _s.timeStampFromJson),
      epochSecondsOnTarget: _s.extractXmlDateTimeValue(
          elem, 'epochSecondsOnTarget',
          parser: _s.timeStampFromJson),
      httpDate: _s.extractXmlDateTimeValue(elem, 'httpDate',
          parser: _s.timeStampFromJson),
      httpDateOnTarget: _s.extractXmlDateTimeValue(elem, 'httpDateOnTarget',
          parser: _s.timeStampFromJson),
      normal: _s.extractXmlDateTimeValue(elem, 'normal'),
    );
  }

  Map<String, dynamic> toJson() {
    final dateTime = this.dateTime;
    final dateTimeOnTarget = this.dateTimeOnTarget;
    final epochSeconds = this.epochSeconds;
    final epochSecondsOnTarget = this.epochSecondsOnTarget;
    final httpDate = this.httpDate;
    final httpDateOnTarget = this.httpDateOnTarget;
    final normal = this.normal;
    return {
      if (dateTime != null) 'dateTime': iso8601ToJson(dateTime),
      if (dateTimeOnTarget != null)
        'dateTimeOnTarget': iso8601ToJson(dateTimeOnTarget),
      if (epochSeconds != null)
        'epochSeconds': unixTimestampToJson(epochSeconds),
      if (epochSecondsOnTarget != null)
        'epochSecondsOnTarget': unixTimestampToJson(epochSecondsOnTarget),
      if (httpDate != null) 'httpDate': rfc822ToJson(httpDate),
      if (httpDateOnTarget != null)
        'httpDateOnTarget': rfc822ToJson(httpDateOnTarget),
      if (normal != null) 'normal': iso8601ToJson(normal),
    };
  }
}

class XmlNamespaceNested {
  final String? foo;
  final List<String>? values;

  XmlNamespaceNested({
    this.foo,
    this.values,
  });
  factory XmlNamespaceNested.fromXml(_s.XmlElement elem) {
    return XmlNamespaceNested(
      foo: _s.extractXmlStringValue(elem, 'foo'),
      values: _s
          .extractXmlChild(elem, 'values')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    final values = this.values;
    return {
      if (foo != null) 'foo': foo,
      if (values != null) 'values': values,
    };
  }
}

class GreetingStruct {
  final String? hi;

  GreetingStruct({
    this.hi,
  });
  factory GreetingStruct.fromXml(_s.XmlElement elem) {
    return GreetingStruct(
      hi: _s.extractXmlStringValue(elem, 'hi'),
    );
  }

  Map<String, dynamic> toJson() {
    final hi = this.hi;
    return {
      if (hi != null) 'hi': hi,
    };
  }

  Map<String, String> toQueryMap() {
    final hi = this.hi;
    return {
      if (hi != null) 'hi': hi,
    };
  }
}

enum FooEnum {
  foo('Foo'),
  baz('Baz'),
  bar('Bar'),
  $1('1'),
  $0('0'),
  ;

  final String value;

  const FooEnum(this.value);

  static FooEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum FooEnum'));
}

class StructureListMember {
  final String? a;
  final String? b;

  StructureListMember({
    this.a,
    this.b,
  });
  factory StructureListMember.fromXml(_s.XmlElement elem) {
    return StructureListMember(
      a: _s.extractXmlStringValue(elem, 'value'),
      b: _s.extractXmlStringValue(elem, 'other'),
    );
  }

  Map<String, dynamic> toJson() {
    final a = this.a;
    final b = this.b;
    return {
      if (a != null) 'value': a,
      if (b != null) 'other': b,
    };
  }
}

class RecursiveXmlShapesOutputNested1 {
  final String? foo;
  final RecursiveXmlShapesOutputNested2? nested;

  RecursiveXmlShapesOutputNested1({
    this.foo,
    this.nested,
  });
  factory RecursiveXmlShapesOutputNested1.fromXml(_s.XmlElement elem) {
    return RecursiveXmlShapesOutputNested1(
      foo: _s.extractXmlStringValue(elem, 'foo'),
      nested: _s
          .extractXmlChild(elem, 'nested')
          ?.let(RecursiveXmlShapesOutputNested2.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    final nested = this.nested;
    return {
      if (foo != null) 'foo': foo,
      if (nested != null) 'nested': nested,
    };
  }
}

class RecursiveXmlShapesOutputNested2 {
  final String? bar;
  final RecursiveXmlShapesOutputNested1? recursiveMember;

  RecursiveXmlShapesOutputNested2({
    this.bar,
    this.recursiveMember,
  });
  factory RecursiveXmlShapesOutputNested2.fromXml(_s.XmlElement elem) {
    return RecursiveXmlShapesOutputNested2(
      bar: _s.extractXmlStringValue(elem, 'bar'),
      recursiveMember: _s
          .extractXmlChild(elem, 'recursiveMember')
          ?.let(RecursiveXmlShapesOutputNested1.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final bar = this.bar;
    final recursiveMember = this.recursiveMember;
    return {
      if (bar != null) 'bar': bar,
      if (recursiveMember != null) 'recursiveMember': recursiveMember,
    };
  }
}

class NestedStructWithMap {
  final Map<String, String>? mapArg;

  NestedStructWithMap({
    this.mapArg,
  });

  Map<String, dynamic> toJson() {
    final mapArg = this.mapArg;
    return {
      if (mapArg != null) 'MapArg': mapArg,
    };
  }

  Map<String, String> toQueryMap() {
    final mapArg = this.mapArg;
    return {
      if (mapArg != null)
        for (var e1 in mapArg.entries.toList().asMap().entries) ...{
          'MapArg.entry.${e1.key + 1}.key': e1.value.key,
          'MapArg.entry.${e1.key + 1}.value': e1.value.value,
        },
    };
  }
}

class NestedStructWithList {
  final List<String>? listArg;

  NestedStructWithList({
    this.listArg,
  });

  Map<String, dynamic> toJson() {
    final listArg = this.listArg;
    return {
      if (listArg != null) 'ListArg': listArg,
    };
  }

  Map<String, String> toQueryMap() {
    final listArg = this.listArg;
    return {
      if (listArg != null)
        if (listArg.isEmpty)
          'ListArg': ''
        else
          for (var i1 = 0; i1 < listArg.length; i1++)
            'ListArg.member.${i1 + 1}': listArg[i1],
    };
  }
}

class StructArg {
  final bool? otherArg;
  final StructArg? recursiveArg;
  final String? stringArg;

  StructArg({
    this.otherArg,
    this.recursiveArg,
    this.stringArg,
  });

  Map<String, dynamic> toJson() {
    final otherArg = this.otherArg;
    final recursiveArg = this.recursiveArg;
    final stringArg = this.stringArg;
    return {
      if (otherArg != null) 'OtherArg': otherArg,
      if (recursiveArg != null) 'RecursiveArg': recursiveArg,
      if (stringArg != null) 'StringArg': stringArg,
    };
  }

  Map<String, String> toQueryMap() {
    final otherArg = this.otherArg;
    final recursiveArg = this.recursiveArg;
    final stringArg = this.stringArg;
    return {
      if (otherArg != null) 'OtherArg': otherArg.toString(),
      if (recursiveArg != null)
        for (var e1 in recursiveArg.toQueryMap().entries)
          'RecursiveArg.${e1.key}': e1.value,
      if (stringArg != null) 'StringArg': stringArg,
    };
  }
}

class ComplexError extends _s.GenericAwsException {
  ComplexError({String? type, String? message})
      : super(type: type, code: 'ComplexError', message: message);
}

class CustomCodeError extends _s.GenericAwsException {
  CustomCodeError({String? type, String? message})
      : super(type: type, code: 'CustomCodeError', message: message);
}

class InvalidGreeting extends _s.GenericAwsException {
  InvalidGreeting({String? type, String? message})
      : super(type: type, code: 'InvalidGreeting', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ComplexError': (type, message) => ComplexError(type: type, message: message),
  'CustomCodeError': (type, message) =>
      CustomCodeError(type: type, message: message),
  'InvalidGreeting': (type, message) =>
      InvalidGreeting(type: type, message: message),
};
