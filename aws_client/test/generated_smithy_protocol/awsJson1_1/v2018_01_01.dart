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

class JsonProtocol {
  final _s.JsonProtocol _protocol;
  factory JsonProtocol({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'jsonprotocol',
    );
    return JsonProtocol._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.forProtocol(
            service: service, region: region, endpointUrl: endpointUrl),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  JsonProtocol._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// The example tests how servers must support requests containing a
  /// `Content-Type` header with parameters.
  Future<void> contentTypeParameters({
    int? value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.ContentTypeParameters'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (value != null) 'value': value,
      },
    );
  }

  Future<DatetimeOffsetsOutput> datetimeOffsets() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.DatetimeOffsets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DatetimeOffsetsOutput.fromJson(jsonResponse.body);
  }

  Future<void> emptyOperation() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.EmptyOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  Future<void> endpointOperation() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.EndpointOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,

      hostPrefix: 'foo.',
    );
  }

  Future<void> endpointWithHostLabelOperation({
    required String label,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.EndpointWithHostLabelOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'label': label,
      },

      hostPrefix: 'foo.${label}.',
    );
  }

  Future<FractionalSecondsOutput> fractionalSeconds() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.FractionalSeconds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return FractionalSecondsOutput.fromJson(jsonResponse.body);
  }

  /// This operation has three possible return values: 1. A successful response
  /// in the form of GreetingWithErrorsOutput 2. An InvalidGreeting error. 3. A
  /// ComplexError error. Implementations must be able to successfully take a
  /// response and properly deserialize successful and error responses.
  ///
  /// May throw [ComplexError].
  /// May throw [FooError].
  /// May throw [InvalidGreeting].
  Future<GreetingWithErrorsOutput> greetingWithErrors() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.GreetingWithErrors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GreetingWithErrorsOutput.fromJson(jsonResponse.body);
  }

  Future<void> hostWithPathOperation() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.HostWithPathOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// This example serializes enums as top level properties, in lists, sets, and
  /// maps.
  Future<JsonEnumsInputOutput> jsonEnums({
    FooEnum? fooEnum1,
    FooEnum? fooEnum2,
    FooEnum? fooEnum3,
    List<FooEnum>? fooEnumList,
    Map<String, FooEnum>? fooEnumMap,
    List<FooEnum>? fooEnumSet,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.JsonEnums'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fooEnum1 != null) 'fooEnum1': fooEnum1.value,
        if (fooEnum2 != null) 'fooEnum2': fooEnum2.value,
        if (fooEnum3 != null) 'fooEnum3': fooEnum3.value,
        if (fooEnumList != null)
          'fooEnumList': fooEnumList.map((e) => e.value).toList(),
        if (fooEnumMap != null)
          'fooEnumMap': fooEnumMap.map((k, e) => MapEntry(k, e.value)),
        if (fooEnumSet != null)
          'fooEnumSet': fooEnumSet.map((e) => e.value).toList(),
      },
    );

    return JsonEnumsInputOutput.fromJson(jsonResponse.body);
  }

  /// This example serializes intEnums as top level properties, in lists, sets,
  /// and maps.
  Future<JsonIntEnumsInputOutput> jsonIntEnums({
    int? intEnum1,
    int? intEnum2,
    int? intEnum3,
    List<int>? intEnumList,
    Map<String, int>? intEnumMap,
    List<int>? intEnumSet,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.JsonIntEnums'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (intEnum1 != null) 'intEnum1': intEnum1,
        if (intEnum2 != null) 'intEnum2': intEnum2,
        if (intEnum3 != null) 'intEnum3': intEnum3,
        if (intEnumList != null) 'intEnumList': intEnumList,
        if (intEnumMap != null) 'intEnumMap': intEnumMap,
        if (intEnumSet != null) 'intEnumSet': intEnumSet,
      },
    );

    return JsonIntEnumsInputOutput.fromJson(jsonResponse.body);
  }

  /// This operation uses unions for inputs and outputs.
  Future<UnionInputOutput> jsonUnions({
    MyUnion? contents,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.JsonUnions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (contents != null) 'contents': contents,
      },
    );

    return UnionInputOutput.fromJson(jsonResponse.body);
  }

  ///
  /// May throw [ErrorWithMembers].
  /// May throw [ErrorWithoutMembers].
  Future<KitchenSink> kitchenSinkOperation({
    Uint8List? blob,
    bool? boolean,
    double? doubleValue,
    EmptyStruct? emptyStruct,
    double? float,
    DateTime? httpdateTimestamp,
    int? integer,
    DateTime? iso8601Timestamp,
    Object? jsonValue,
    List<List<String>>? listOfLists,
    List<Map<String, String>>? listOfMapsOfStrings,
    List<String>? listOfStrings,
    List<SimpleStruct>? listOfStructs,
    int? long,
    Map<String, List<String>>? mapOfListsOfStrings,
    Map<String, Map<String, String>>? mapOfMaps,
    Map<String, String>? mapOfStrings,
    Map<String, SimpleStruct>? mapOfStructs,
    List<KitchenSink>? recursiveList,
    Map<String, KitchenSink>? recursiveMap,
    KitchenSink? recursiveStruct,
    SimpleStruct? simpleStruct,
    String? string,
    StructWithJsonName? structWithJsonName,
    DateTime? timestamp,
    DateTime? unixTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.KitchenSinkOperation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (blob != null) 'Blob': base64Encode(blob),
        if (boolean != null) 'Boolean': boolean,
        if (doubleValue != null) 'Double': _s.encodeJsonDouble(doubleValue),
        if (emptyStruct != null) 'EmptyStruct': emptyStruct,
        if (float != null) 'Float': _s.encodeJsonDouble(float),
        if (httpdateTimestamp != null)
          'HttpdateTimestamp': rfc822ToJson(httpdateTimestamp),
        if (integer != null) 'Integer': integer,
        if (iso8601Timestamp != null)
          'Iso8601Timestamp': iso8601ToJson(iso8601Timestamp),
        if (jsonValue != null) 'JsonValue': jsonEncode(jsonValue),
        if (listOfLists != null) 'ListOfLists': listOfLists,
        if (listOfMapsOfStrings != null)
          'ListOfMapsOfStrings': listOfMapsOfStrings,
        if (listOfStrings != null) 'ListOfStrings': listOfStrings,
        if (listOfStructs != null) 'ListOfStructs': listOfStructs,
        if (long != null) 'Long': long,
        if (mapOfListsOfStrings != null)
          'MapOfListsOfStrings': mapOfListsOfStrings,
        if (mapOfMaps != null) 'MapOfMaps': mapOfMaps,
        if (mapOfStrings != null) 'MapOfStrings': mapOfStrings,
        if (mapOfStructs != null) 'MapOfStructs': mapOfStructs,
        if (recursiveList != null) 'RecursiveList': recursiveList,
        if (recursiveMap != null) 'RecursiveMap': recursiveMap,
        if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
        if (simpleStruct != null) 'SimpleStruct': simpleStruct,
        if (string != null) 'String': string,
        if (structWithJsonName != null)
          'StructWithJsonName': structWithJsonName,
        if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
        if (unixTimestamp != null)
          'UnixTimestamp': unixTimestampToJson(unixTimestamp),
      },
    );

    return KitchenSink.fromJson(jsonResponse.body);
  }

  Future<NullOperationInputOutput> nullOperation({
    String? string,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.NullOperation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (string != null) 'string': string,
      },
    );

    return NullOperationInputOutput.fromJson(jsonResponse.body);
  }

  Future<OperationWithOptionalInputOutputOutput>
      operationWithOptionalInputOutput({
    String? value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.OperationWithOptionalInputOutput'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (value != null) 'Value': value,
      },
    );

    return OperationWithOptionalInputOutputOutput.fromJson(jsonResponse.body);
  }

  /// This example serializes an inline document as part of the payload.
  Future<PutAndGetInlineDocumentsInputOutput> putAndGetInlineDocuments({
    Object? inlineDocument,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.PutAndGetInlineDocuments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (inlineDocument != null) 'inlineDocument': inlineDocument,
      },
    );

    return PutAndGetInlineDocumentsInputOutput.fromJson(jsonResponse.body);
  }

  Future<void> putWithContentEncoding({
    String? data,
    String? encoding,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.PutWithContentEncoding'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (data != null) 'data': data,
        if (encoding != null) 'encoding': encoding,
      },
    );
  }

  Future<SimpleScalarPropertiesInputOutput> simpleScalarProperties({
    double? doubleValue,
    double? floatValue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.SimpleScalarProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (doubleValue != null)
          'doubleValue': _s.encodeJsonDouble(doubleValue),
        if (floatValue != null) 'floatValue': _s.encodeJsonDouble(floatValue),
      },
    );

    return SimpleScalarPropertiesInputOutput.fromJson(jsonResponse.body);
  }

  Future<SparseNullsOperationInputOutput> sparseNullsOperation({
    List<String>? sparseStringList,
    Map<String, String>? sparseStringMap,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'JsonProtocol.SparseNullsOperation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (sparseStringList != null) 'sparseStringList': sparseStringList,
        if (sparseStringMap != null) 'sparseStringMap': sparseStringMap,
      },
    );

    return SparseNullsOperationInputOutput.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class ContentTypeParametersOutput {
  ContentTypeParametersOutput();

  factory ContentTypeParametersOutput.fromJson(Map<String, dynamic> _) {
    return ContentTypeParametersOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DatetimeOffsetsOutput {
  final DateTime? datetime;

  DatetimeOffsetsOutput({
    this.datetime,
  });

  factory DatetimeOffsetsOutput.fromJson(Map<String, dynamic> json) {
    return DatetimeOffsetsOutput(
      datetime: timeStampFromJson(json['datetime']),
    );
  }

  Map<String, dynamic> toJson() {
    final datetime = this.datetime;
    return {
      if (datetime != null) 'datetime': iso8601ToJson(datetime),
    };
  }
}

/// @nodoc
class FractionalSecondsOutput {
  final DateTime? datetime;

  FractionalSecondsOutput({
    this.datetime,
  });

  factory FractionalSecondsOutput.fromJson(Map<String, dynamic> json) {
    return FractionalSecondsOutput(
      datetime: timeStampFromJson(json['datetime']),
    );
  }

  Map<String, dynamic> toJson() {
    final datetime = this.datetime;
    return {
      if (datetime != null) 'datetime': iso8601ToJson(datetime),
    };
  }
}

/// @nodoc
class GreetingWithErrorsOutput {
  final String? greeting;

  GreetingWithErrorsOutput({
    this.greeting,
  });

  factory GreetingWithErrorsOutput.fromJson(Map<String, dynamic> json) {
    return GreetingWithErrorsOutput(
      greeting: json['greeting'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final greeting = this.greeting;
    return {
      if (greeting != null) 'greeting': greeting,
    };
  }
}

/// @nodoc
class JsonEnumsInputOutput {
  final FooEnum? fooEnum1;
  final FooEnum? fooEnum2;
  final FooEnum? fooEnum3;
  final List<FooEnum>? fooEnumList;
  final Map<String, FooEnum>? fooEnumMap;
  final List<FooEnum>? fooEnumSet;

  JsonEnumsInputOutput({
    this.fooEnum1,
    this.fooEnum2,
    this.fooEnum3,
    this.fooEnumList,
    this.fooEnumMap,
    this.fooEnumSet,
  });

  factory JsonEnumsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonEnumsInputOutput(
      fooEnum1: (json['fooEnum1'] as String?)?.let(FooEnum.fromString),
      fooEnum2: (json['fooEnum2'] as String?)?.let(FooEnum.fromString),
      fooEnum3: (json['fooEnum3'] as String?)?.let(FooEnum.fromString),
      fooEnumList: (json['fooEnumList'] as List?)
          ?.nonNulls
          .map((e) => FooEnum.fromString((e as String)))
          .toList(),
      fooEnumMap: (json['fooEnumMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, FooEnum.fromString((e as String)))),
      fooEnumSet: (json['fooEnumSet'] as List?)
          ?.nonNulls
          .map((e) => FooEnum.fromString((e as String)))
          .toList(),
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

/// @nodoc
class JsonIntEnumsInputOutput {
  final int? intEnum1;
  final int? intEnum2;
  final int? intEnum3;
  final List<int>? intEnumList;
  final Map<String, int>? intEnumMap;
  final List<int>? intEnumSet;

  JsonIntEnumsInputOutput({
    this.intEnum1,
    this.intEnum2,
    this.intEnum3,
    this.intEnumList,
    this.intEnumMap,
    this.intEnumSet,
  });

  factory JsonIntEnumsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonIntEnumsInputOutput(
      intEnum1: json['intEnum1'] as int?,
      intEnum2: json['intEnum2'] as int?,
      intEnum3: json['intEnum3'] as int?,
      intEnumList: (json['intEnumList'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      intEnumMap: (json['intEnumMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      intEnumSet:
          (json['intEnumSet'] as List?)?.nonNulls.map((e) => e as int).toList(),
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

/// A shared structure that contains a single union member.
///
/// @nodoc
class UnionInputOutput {
  final MyUnion? contents;

  UnionInputOutput({
    this.contents,
  });

  factory UnionInputOutput.fromJson(Map<String, dynamic> json) {
    return UnionInputOutput(
      contents: json['contents'] != null
          ? MyUnion.fromJson(json['contents'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contents = this.contents;
    return {
      if (contents != null) 'contents': contents,
    };
  }
}

/// @nodoc
class KitchenSink {
  final Uint8List? blob;
  final bool? boolean;
  final double? doubleValue;
  final EmptyStruct? emptyStruct;
  final double? float;
  final DateTime? httpdateTimestamp;
  final int? integer;
  final DateTime? iso8601Timestamp;
  final Object? jsonValue;
  final List<List<String>>? listOfLists;
  final List<Map<String, String>>? listOfMapsOfStrings;
  final List<String>? listOfStrings;
  final List<SimpleStruct>? listOfStructs;
  final int? long;
  final Map<String, List<String>>? mapOfListsOfStrings;
  final Map<String, Map<String, String>>? mapOfMaps;
  final Map<String, String>? mapOfStrings;
  final Map<String, SimpleStruct>? mapOfStructs;
  final List<KitchenSink>? recursiveList;
  final Map<String, KitchenSink>? recursiveMap;
  final KitchenSink? recursiveStruct;
  final SimpleStruct? simpleStruct;
  final String? string;
  final StructWithJsonName? structWithJsonName;
  final DateTime? timestamp;
  final DateTime? unixTimestamp;

  KitchenSink({
    this.blob,
    this.boolean,
    this.doubleValue,
    this.emptyStruct,
    this.float,
    this.httpdateTimestamp,
    this.integer,
    this.iso8601Timestamp,
    this.jsonValue,
    this.listOfLists,
    this.listOfMapsOfStrings,
    this.listOfStrings,
    this.listOfStructs,
    this.long,
    this.mapOfListsOfStrings,
    this.mapOfMaps,
    this.mapOfStrings,
    this.mapOfStructs,
    this.recursiveList,
    this.recursiveMap,
    this.recursiveStruct,
    this.simpleStruct,
    this.string,
    this.structWithJsonName,
    this.timestamp,
    this.unixTimestamp,
  });

  factory KitchenSink.fromJson(Map<String, dynamic> json) {
    return KitchenSink(
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
      boolean: json['Boolean'] as bool?,
      doubleValue: _s.parseJsonDouble(json['Double']),
      emptyStruct: json['EmptyStruct'] != null
          ? EmptyStruct.fromJson(json['EmptyStruct'] as Map<String, dynamic>)
          : null,
      float: _s.parseJsonDouble(json['Float']),
      httpdateTimestamp: timeStampFromJson(json['HttpdateTimestamp']),
      integer: json['Integer'] as int?,
      iso8601Timestamp: timeStampFromJson(json['Iso8601Timestamp']),
      jsonValue: json['JsonValue'] == null
          ? null
          : jsonDecode(json['JsonValue'] as String),
      listOfLists: (json['ListOfLists'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as String).toList())
          .toList(),
      listOfMapsOfStrings: (json['ListOfMapsOfStrings'] as List?)
          ?.nonNulls
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
      listOfStrings: (json['ListOfStrings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      listOfStructs: (json['ListOfStructs'] as List?)
          ?.nonNulls
          .map((e) => SimpleStruct.fromJson(e as Map<String, dynamic>))
          .toList(),
      long: json['Long'] as int?,
      mapOfListsOfStrings:
          (json['MapOfListsOfStrings'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, (e as List).nonNulls.map((e) => e as String).toList())),
      mapOfMaps: (json['MapOfMaps'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      mapOfStrings: (json['MapOfStrings'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      mapOfStructs: (json['MapOfStructs'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, SimpleStruct.fromJson(e as Map<String, dynamic>))),
      recursiveList: (json['RecursiveList'] as List?)
          ?.nonNulls
          .map((e) => KitchenSink.fromJson(e as Map<String, dynamic>))
          .toList(),
      recursiveMap: (json['RecursiveMap'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, KitchenSink.fromJson(e as Map<String, dynamic>))),
      recursiveStruct: json['RecursiveStruct'] != null
          ? KitchenSink.fromJson(
              json['RecursiveStruct'] as Map<String, dynamic>)
          : null,
      simpleStruct: json['SimpleStruct'] != null
          ? SimpleStruct.fromJson(json['SimpleStruct'] as Map<String, dynamic>)
          : null,
      string: json['String'] as String?,
      structWithJsonName: json['StructWithJsonName'] != null
          ? StructWithJsonName.fromJson(
              json['StructWithJsonName'] as Map<String, dynamic>)
          : null,
      timestamp: timeStampFromJson(json['Timestamp']),
      unixTimestamp: timeStampFromJson(json['UnixTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final boolean = this.boolean;
    final doubleValue = this.doubleValue;
    final emptyStruct = this.emptyStruct;
    final float = this.float;
    final httpdateTimestamp = this.httpdateTimestamp;
    final integer = this.integer;
    final iso8601Timestamp = this.iso8601Timestamp;
    final jsonValue = this.jsonValue;
    final listOfLists = this.listOfLists;
    final listOfMapsOfStrings = this.listOfMapsOfStrings;
    final listOfStrings = this.listOfStrings;
    final listOfStructs = this.listOfStructs;
    final long = this.long;
    final mapOfListsOfStrings = this.mapOfListsOfStrings;
    final mapOfMaps = this.mapOfMaps;
    final mapOfStrings = this.mapOfStrings;
    final mapOfStructs = this.mapOfStructs;
    final recursiveList = this.recursiveList;
    final recursiveMap = this.recursiveMap;
    final recursiveStruct = this.recursiveStruct;
    final simpleStruct = this.simpleStruct;
    final string = this.string;
    final structWithJsonName = this.structWithJsonName;
    final timestamp = this.timestamp;
    final unixTimestamp = this.unixTimestamp;
    return {
      if (blob != null) 'Blob': base64Encode(blob),
      if (boolean != null) 'Boolean': boolean,
      if (doubleValue != null) 'Double': _s.encodeJsonDouble(doubleValue),
      if (emptyStruct != null) 'EmptyStruct': emptyStruct,
      if (float != null) 'Float': _s.encodeJsonDouble(float),
      if (httpdateTimestamp != null)
        'HttpdateTimestamp': rfc822ToJson(httpdateTimestamp),
      if (integer != null) 'Integer': integer,
      if (iso8601Timestamp != null)
        'Iso8601Timestamp': iso8601ToJson(iso8601Timestamp),
      if (jsonValue != null) 'JsonValue': jsonEncode(jsonValue),
      if (listOfLists != null) 'ListOfLists': listOfLists,
      if (listOfMapsOfStrings != null)
        'ListOfMapsOfStrings': listOfMapsOfStrings,
      if (listOfStrings != null) 'ListOfStrings': listOfStrings,
      if (listOfStructs != null) 'ListOfStructs': listOfStructs,
      if (long != null) 'Long': long,
      if (mapOfListsOfStrings != null)
        'MapOfListsOfStrings': mapOfListsOfStrings,
      if (mapOfMaps != null) 'MapOfMaps': mapOfMaps,
      if (mapOfStrings != null) 'MapOfStrings': mapOfStrings,
      if (mapOfStructs != null) 'MapOfStructs': mapOfStructs,
      if (recursiveList != null) 'RecursiveList': recursiveList,
      if (recursiveMap != null) 'RecursiveMap': recursiveMap,
      if (recursiveStruct != null) 'RecursiveStruct': recursiveStruct,
      if (simpleStruct != null) 'SimpleStruct': simpleStruct,
      if (string != null) 'String': string,
      if (structWithJsonName != null) 'StructWithJsonName': structWithJsonName,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (unixTimestamp != null)
        'UnixTimestamp': unixTimestampToJson(unixTimestamp),
    };
  }
}

/// @nodoc
class NullOperationInputOutput {
  final String? string;

  NullOperationInputOutput({
    this.string,
  });

  factory NullOperationInputOutput.fromJson(Map<String, dynamic> json) {
    return NullOperationInputOutput(
      string: json['string'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final string = this.string;
    return {
      if (string != null) 'string': string,
    };
  }
}

/// @nodoc
class OperationWithOptionalInputOutputOutput {
  final String? value;

  OperationWithOptionalInputOutputOutput({
    this.value,
  });

  factory OperationWithOptionalInputOutputOutput.fromJson(
      Map<String, dynamic> json) {
    return OperationWithOptionalInputOutputOutput(
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'Value': value,
    };
  }
}

/// @nodoc
class PutAndGetInlineDocumentsInputOutput {
  final Object? inlineDocument;

  PutAndGetInlineDocumentsInputOutput({
    this.inlineDocument,
  });

  factory PutAndGetInlineDocumentsInputOutput.fromJson(
      Map<String, dynamic> json) {
    return PutAndGetInlineDocumentsInputOutput(
      inlineDocument: json['inlineDocument'],
    );
  }

  Map<String, dynamic> toJson() {
    final inlineDocument = this.inlineDocument;
    return {
      if (inlineDocument != null) 'inlineDocument': inlineDocument,
    };
  }
}

/// @nodoc
class SimpleScalarPropertiesInputOutput {
  final double? doubleValue;
  final double? floatValue;

  SimpleScalarPropertiesInputOutput({
    this.doubleValue,
    this.floatValue,
  });

  factory SimpleScalarPropertiesInputOutput.fromJson(
      Map<String, dynamic> json) {
    return SimpleScalarPropertiesInputOutput(
      doubleValue: _s.parseJsonDouble(json['doubleValue']),
      floatValue: _s.parseJsonDouble(json['floatValue']),
    );
  }

  Map<String, dynamic> toJson() {
    final doubleValue = this.doubleValue;
    final floatValue = this.floatValue;
    return {
      if (doubleValue != null) 'doubleValue': _s.encodeJsonDouble(doubleValue),
      if (floatValue != null) 'floatValue': _s.encodeJsonDouble(floatValue),
    };
  }
}

/// @nodoc
class SparseNullsOperationInputOutput {
  final List<String>? sparseStringList;
  final Map<String, String>? sparseStringMap;

  SparseNullsOperationInputOutput({
    this.sparseStringList,
    this.sparseStringMap,
  });

  factory SparseNullsOperationInputOutput.fromJson(Map<String, dynamic> json) {
    return SparseNullsOperationInputOutput(
      sparseStringList: (json['sparseStringList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sparseStringMap: (json['sparseStringMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final sparseStringList = this.sparseStringList;
    final sparseStringMap = this.sparseStringMap;
    return {
      if (sparseStringList != null) 'sparseStringList': sparseStringList,
      if (sparseStringMap != null) 'sparseStringMap': sparseStringMap,
    };
  }
}

/// @nodoc
class EmptyStruct {
  EmptyStruct();

  factory EmptyStruct.fromJson(Map<String, dynamic> _) {
    return EmptyStruct();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SimpleStruct {
  final String? value;

  SimpleStruct({
    this.value,
  });

  factory SimpleStruct.fromJson(Map<String, dynamic> json) {
    return SimpleStruct(
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'Value': value,
    };
  }
}

/// @nodoc
class StructWithJsonName {
  final String? value;

  StructWithJsonName({
    this.value,
  });

  factory StructWithJsonName.fromJson(Map<String, dynamic> json) {
    return StructWithJsonName(
      value: json['RenamedMember'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'RenamedMember': value,
    };
  }
}

/// A union with a representative set of types for members.
///
/// @nodoc
class MyUnion {
  final Uint8List? blobValue;
  final bool? booleanValue;
  final FooEnum? enumValue;
  final List<String>? listValue;
  final Map<String, String>? mapValue;
  final int? numberValue;
  final String? stringValue;
  final GreetingStruct? structureValue;
  final DateTime? timestampValue;

  MyUnion({
    this.blobValue,
    this.booleanValue,
    this.enumValue,
    this.listValue,
    this.mapValue,
    this.numberValue,
    this.stringValue,
    this.structureValue,
    this.timestampValue,
  });

  factory MyUnion.fromJson(Map<String, dynamic> json) {
    return MyUnion(
      blobValue: _s.decodeNullableUint8List(json['blobValue'] as String?),
      booleanValue: json['booleanValue'] as bool?,
      enumValue: (json['enumValue'] as String?)?.let(FooEnum.fromString),
      listValue: (json['listValue'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      mapValue: (json['mapValue'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      numberValue: json['numberValue'] as int?,
      stringValue: json['stringValue'] as String?,
      structureValue: json['structureValue'] != null
          ? GreetingStruct.fromJson(
              json['structureValue'] as Map<String, dynamic>)
          : null,
      timestampValue: timeStampFromJson(json['timestampValue']),
    );
  }

  Map<String, dynamic> toJson() {
    final blobValue = this.blobValue;
    final booleanValue = this.booleanValue;
    final enumValue = this.enumValue;
    final listValue = this.listValue;
    final mapValue = this.mapValue;
    final numberValue = this.numberValue;
    final stringValue = this.stringValue;
    final structureValue = this.structureValue;
    final timestampValue = this.timestampValue;
    return {
      if (blobValue != null) 'blobValue': base64Encode(blobValue),
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (enumValue != null) 'enumValue': enumValue.value,
      if (listValue != null) 'listValue': listValue,
      if (mapValue != null) 'mapValue': mapValue,
      if (numberValue != null) 'numberValue': numberValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (structureValue != null) 'structureValue': structureValue,
      if (timestampValue != null)
        'timestampValue': unixTimestampToJson(timestampValue),
    };
  }
}

/// @nodoc
class FooEnum {
  static const foo = FooEnum._('Foo');
  static const baz = FooEnum._('Baz');
  static const bar = FooEnum._('Bar');
  static const $1 = FooEnum._('1');
  static const $0 = FooEnum._('0');

  final String value;

  const FooEnum._(this.value);

  static const values = [foo, baz, bar, $1, $0];

  static FooEnum fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FooEnum._(value));

  @override
  bool operator ==(other) => other is FooEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GreetingStruct {
  final String? hi;

  GreetingStruct({
    this.hi,
  });

  factory GreetingStruct.fromJson(Map<String, dynamic> json) {
    return GreetingStruct(
      hi: json['hi'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hi = this.hi;
    return {
      if (hi != null) 'hi': hi,
    };
  }
}

/// @nodoc
class ComplexError extends _s.GenericAwsException {
  ComplexError({String? type, String? message})
      : super(type: type, code: 'ComplexError', message: message);
}

/// @nodoc
class ErrorWithMembers extends _s.GenericAwsException {
  ErrorWithMembers({String? type, String? message})
      : super(type: type, code: 'ErrorWithMembers', message: message);
}

/// @nodoc
class ErrorWithoutMembers extends _s.GenericAwsException {
  ErrorWithoutMembers({String? type, String? message})
      : super(type: type, code: 'ErrorWithoutMembers', message: message);
}

/// @nodoc
class FooError extends _s.GenericAwsException {
  FooError({String? type, String? message})
      : super(type: type, code: 'FooError', message: message);
}

/// @nodoc
class InvalidGreeting extends _s.GenericAwsException {
  InvalidGreeting({String? type, String? message})
      : super(type: type, code: 'InvalidGreeting', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ComplexError': (type, message) => ComplexError(type: type, message: message),
  'ErrorWithMembers': (type, message) =>
      ErrorWithMembers(type: type, message: message),
  'ErrorWithoutMembers': (type, message) =>
      ErrorWithoutMembers(type: type, message: message),
  'FooError': (type, message) => FooError(type: type, message: message),
  'InvalidGreeting': (type, message) =>
      InvalidGreeting(type: type, message: message),
};
