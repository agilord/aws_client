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

class JsonRpc10 {
  final _s.JsonProtocol _protocol;
  JsonRpc10({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'jsonrpc10',
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

  /// The example tests how servers must support requests containing a
  /// `Content-Type` header with parameters.
  Future<void> contentTypeParameters({
    int? value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.ContentTypeParameters'
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

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has an empty input
  /// and empty output structure that reuses the same shape. While this should
  /// be rare, code generators must support this.
  Future<void> emptyInputAndEmptyOutput() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.EmptyInputAndEmptyOutput'
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.EndpointOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  Future<void> endpointWithHostLabelOperation({
    required String label,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.EndpointWithHostLabelOperation'
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
    );
  }

  /// This operation has three possible return values: 1. A successful response
  /// in the form of GreetingWithErrorsOutput 2. An InvalidGreeting error. 3. A
  /// ComplexError error. Implementations must be able to successfully take a
  /// response and properly deserialize successful and error responses.
  ///
  /// May throw [ComplexError].
  /// May throw [FooError].
  /// May throw [InvalidGreeting].
  Future<GreetingWithErrorsOutput> greetingWithErrors({
    String? greeting,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.GreetingWithErrors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (greeting != null) 'greeting': greeting,
      },
    );

    return GreetingWithErrorsOutput.fromJson(jsonResponse.body);
  }

  Future<void> hostWithPathOperation() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.HostWithPathOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// This operation uses unions for inputs and outputs.
  Future<JsonUnionsOutput> jsonUnions({
    MyUnion? contents,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.JsonUnions'
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

    return JsonUnionsOutput.fromJson(jsonResponse.body);
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has no input or
  /// output. While this should be rare, code generators must support this.
  Future<void> noInputAndNoOutput() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.NoInputAndNoOutput'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has no input and the
  /// output is empty. While this should be rare, code generators must support
  /// this.
  Future<void> noInputAndOutput() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.NoInputAndOutput'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  Future<OperationWithDefaultsOutput> operationWithDefaults({
    ClientOptionalDefaults? clientOptionalDefaults,
    Defaults? defaults,
    int? otherTopLevelDefault,
    String? topLevelDefault,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.OperationWithDefaults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clientOptionalDefaults != null)
          'clientOptionalDefaults': clientOptionalDefaults,
        if (defaults != null) 'defaults': defaults,
        if (otherTopLevelDefault != null)
          'otherTopLevelDefault': otherTopLevelDefault,
        if (topLevelDefault != null) 'topLevelDefault': topLevelDefault,
      },
    );

    return OperationWithDefaultsOutput.fromJson(jsonResponse.body);
  }

  Future<OperationWithNestedStructureOutput> operationWithNestedStructure({
    required TopLevel topLevel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.OperationWithNestedStructure'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'topLevel': topLevel,
      },
    );

    return OperationWithNestedStructureOutput.fromJson(jsonResponse.body);
  }

  Future<OperationWithRequiredMembersOutput>
      operationWithRequiredMembers() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.OperationWithRequiredMembers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OperationWithRequiredMembersOutput.fromJson(jsonResponse.body);
  }

  Future<OperationWithRequiredMembersWithDefaultsOutput>
      operationWithRequiredMembersWithDefaults() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.OperationWithRequiredMembersWithDefaults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return OperationWithRequiredMembersWithDefaultsOutput.fromJson(
        jsonResponse.body);
  }

  Future<void> putWithContentEncoding({
    String? data,
    String? encoding,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.PutWithContentEncoding'
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

  Future<void> queryIncompatibleOperation() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.QueryIncompatibleOperation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  Future<SimpleScalarPropertiesOutput> simpleScalarProperties({
    double? doubleValue,
    double? floatValue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'JsonRpc10.SimpleScalarProperties'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (doubleValue != null) 'doubleValue': doubleValue,
        if (floatValue != null) 'floatValue': floatValue,
      },
    );

    return SimpleScalarPropertiesOutput.fromJson(jsonResponse.body);
  }
}

class ContentTypeParametersOutput {
  ContentTypeParametersOutput();

  factory ContentTypeParametersOutput.fromJson(Map<String, dynamic> _) {
    return ContentTypeParametersOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EmptyInputAndEmptyOutputOutput {
  EmptyInputAndEmptyOutputOutput();

  factory EmptyInputAndEmptyOutputOutput.fromJson(Map<String, dynamic> _) {
    return EmptyInputAndEmptyOutputOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

/// This error is thrown when a request is invalid.
class ComplexError implements _s.AwsException {
  final ComplexNestedErrorData? nested;
  final String? topLevel;

  ComplexError({
    this.nested,
    this.topLevel,
  });

  factory ComplexError.fromJson(Map<String, dynamic> json) {
    return ComplexError(
      nested: json['Nested'] != null
          ? ComplexNestedErrorData.fromJson(
              json['Nested'] as Map<String, dynamic>)
          : null,
      topLevel: json['TopLevel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    final topLevel = this.topLevel;
    return {
      if (nested != null) 'Nested': nested,
      if (topLevel != null) 'TopLevel': topLevel,
    };
  }
}

/// This error has test cases that test some of the dark corners of Amazon
/// service framework history. It should only be implemented by clients.
class FooError implements _s.AwsException {
  FooError();

  factory FooError.fromJson(Map<String, dynamic> _) {
    return FooError();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This error is thrown when an invalid greeting value is provided.
class InvalidGreeting implements _s.AwsException {
  final String? message;

  InvalidGreeting({
    this.message,
  });

  factory InvalidGreeting.fromJson(Map<String, dynamic> json) {
    return InvalidGreeting(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class JsonUnionsOutput {
  final MyUnion? contents;

  JsonUnionsOutput({
    this.contents,
  });

  factory JsonUnionsOutput.fromJson(Map<String, dynamic> json) {
    return JsonUnionsOutput(
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

class NoInputAndOutputOutput {
  NoInputAndOutputOutput();

  factory NoInputAndOutputOutput.fromJson(Map<String, dynamic> _) {
    return NoInputAndOutputOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class OperationWithDefaultsOutput {
  final Uint8List? defaultBlob;
  final bool? defaultBoolean;
  final int? defaultByte;
  final Document? defaultDocumentBoolean;
  final Document? defaultDocumentList;
  final Document? defaultDocumentMap;
  final Document? defaultDocumentString;
  final double? defaultDouble;
  final TestEnum? defaultEnum;
  final double? defaultFloat;
  final int? defaultIntEnum;
  final int? defaultInteger;
  final List<String>? defaultList;
  final int? defaultLong;
  final Map<String, String>? defaultMap;
  final Document? defaultNullDocument;
  final int? defaultShort;
  final String? defaultString;
  final DateTime? defaultTimestamp;
  final Uint8List? emptyBlob;
  final String? emptyString;
  final bool? falseBoolean;
  final int? zeroByte;
  final double? zeroDouble;
  final double? zeroFloat;
  final int? zeroInteger;
  final int? zeroLong;
  final int? zeroShort;

  OperationWithDefaultsOutput({
    this.defaultBlob,
    this.defaultBoolean,
    this.defaultByte,
    this.defaultDocumentBoolean,
    this.defaultDocumentList,
    this.defaultDocumentMap,
    this.defaultDocumentString,
    this.defaultDouble,
    this.defaultEnum,
    this.defaultFloat,
    this.defaultIntEnum,
    this.defaultInteger,
    this.defaultList,
    this.defaultLong,
    this.defaultMap,
    this.defaultNullDocument,
    this.defaultShort,
    this.defaultString,
    this.defaultTimestamp,
    this.emptyBlob,
    this.emptyString,
    this.falseBoolean,
    this.zeroByte,
    this.zeroDouble,
    this.zeroFloat,
    this.zeroInteger,
    this.zeroLong,
    this.zeroShort,
  });

  factory OperationWithDefaultsOutput.fromJson(Map<String, dynamic> json) {
    return OperationWithDefaultsOutput(
      defaultBlob: _s.decodeNullableUint8List(json['defaultBlob'] as String?),
      defaultBoolean: json['defaultBoolean'] as bool?,
      defaultByte: json['defaultByte'] as int?,
      defaultDocumentBoolean: json['defaultDocumentBoolean'] != null
          ? Document.fromJson(
              json['defaultDocumentBoolean'] as Map<String, dynamic>)
          : null,
      defaultDocumentList: json['defaultDocumentList'] != null
          ? Document.fromJson(
              json['defaultDocumentList'] as Map<String, dynamic>)
          : null,
      defaultDocumentMap: json['defaultDocumentMap'] != null
          ? Document.fromJson(
              json['defaultDocumentMap'] as Map<String, dynamic>)
          : null,
      defaultDocumentString: json['defaultDocumentString'] != null
          ? Document.fromJson(
              json['defaultDocumentString'] as Map<String, dynamic>)
          : null,
      defaultDouble: json['defaultDouble'] as double?,
      defaultEnum: (json['defaultEnum'] as String?)?.let(TestEnum.fromString),
      defaultFloat: json['defaultFloat'] as double?,
      defaultIntEnum: json['defaultIntEnum'] as int?,
      defaultInteger: json['defaultInteger'] as int?,
      defaultList: (json['defaultList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      defaultLong: json['defaultLong'] as int?,
      defaultMap: (json['defaultMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      defaultNullDocument: json['defaultNullDocument'] != null
          ? Document.fromJson(
              json['defaultNullDocument'] as Map<String, dynamic>)
          : null,
      defaultShort: json['defaultShort'] as int?,
      defaultString: json['defaultString'] as String?,
      defaultTimestamp: timeStampFromJson(json['defaultTimestamp']),
      emptyBlob: _s.decodeNullableUint8List(json['emptyBlob'] as String?),
      emptyString: json['emptyString'] as String?,
      falseBoolean: json['falseBoolean'] as bool?,
      zeroByte: json['zeroByte'] as int?,
      zeroDouble: json['zeroDouble'] as double?,
      zeroFloat: json['zeroFloat'] as double?,
      zeroInteger: json['zeroInteger'] as int?,
      zeroLong: json['zeroLong'] as int?,
      zeroShort: json['zeroShort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultBlob = this.defaultBlob;
    final defaultBoolean = this.defaultBoolean;
    final defaultByte = this.defaultByte;
    final defaultDocumentBoolean = this.defaultDocumentBoolean;
    final defaultDocumentList = this.defaultDocumentList;
    final defaultDocumentMap = this.defaultDocumentMap;
    final defaultDocumentString = this.defaultDocumentString;
    final defaultDouble = this.defaultDouble;
    final defaultEnum = this.defaultEnum;
    final defaultFloat = this.defaultFloat;
    final defaultIntEnum = this.defaultIntEnum;
    final defaultInteger = this.defaultInteger;
    final defaultList = this.defaultList;
    final defaultLong = this.defaultLong;
    final defaultMap = this.defaultMap;
    final defaultNullDocument = this.defaultNullDocument;
    final defaultShort = this.defaultShort;
    final defaultString = this.defaultString;
    final defaultTimestamp = this.defaultTimestamp;
    final emptyBlob = this.emptyBlob;
    final emptyString = this.emptyString;
    final falseBoolean = this.falseBoolean;
    final zeroByte = this.zeroByte;
    final zeroDouble = this.zeroDouble;
    final zeroFloat = this.zeroFloat;
    final zeroInteger = this.zeroInteger;
    final zeroLong = this.zeroLong;
    final zeroShort = this.zeroShort;
    return {
      if (defaultBlob != null) 'defaultBlob': base64Encode(defaultBlob),
      if (defaultBoolean != null) 'defaultBoolean': defaultBoolean,
      if (defaultByte != null) 'defaultByte': defaultByte,
      if (defaultDocumentBoolean != null)
        'defaultDocumentBoolean': defaultDocumentBoolean,
      if (defaultDocumentList != null)
        'defaultDocumentList': defaultDocumentList,
      if (defaultDocumentMap != null) 'defaultDocumentMap': defaultDocumentMap,
      if (defaultDocumentString != null)
        'defaultDocumentString': defaultDocumentString,
      if (defaultDouble != null) 'defaultDouble': defaultDouble,
      if (defaultEnum != null) 'defaultEnum': defaultEnum.value,
      if (defaultFloat != null) 'defaultFloat': defaultFloat,
      if (defaultIntEnum != null) 'defaultIntEnum': defaultIntEnum,
      if (defaultInteger != null) 'defaultInteger': defaultInteger,
      if (defaultList != null) 'defaultList': defaultList,
      if (defaultLong != null) 'defaultLong': defaultLong,
      if (defaultMap != null) 'defaultMap': defaultMap,
      if (defaultNullDocument != null)
        'defaultNullDocument': defaultNullDocument,
      if (defaultShort != null) 'defaultShort': defaultShort,
      if (defaultString != null) 'defaultString': defaultString,
      if (defaultTimestamp != null)
        'defaultTimestamp': unixTimestampToJson(defaultTimestamp),
      if (emptyBlob != null) 'emptyBlob': base64Encode(emptyBlob),
      if (emptyString != null) 'emptyString': emptyString,
      if (falseBoolean != null) 'falseBoolean': falseBoolean,
      if (zeroByte != null) 'zeroByte': zeroByte,
      if (zeroDouble != null) 'zeroDouble': zeroDouble,
      if (zeroFloat != null) 'zeroFloat': zeroFloat,
      if (zeroInteger != null) 'zeroInteger': zeroInteger,
      if (zeroLong != null) 'zeroLong': zeroLong,
      if (zeroShort != null) 'zeroShort': zeroShort,
    };
  }
}

class OperationWithNestedStructureOutput {
  final Dialog dialog;
  final List<Dialog>? dialogList;
  final Map<String, Dialog>? dialogMap;

  OperationWithNestedStructureOutput({
    required this.dialog,
    this.dialogList,
    this.dialogMap,
  });

  factory OperationWithNestedStructureOutput.fromJson(
      Map<String, dynamic> json) {
    return OperationWithNestedStructureOutput(
      dialog: Dialog.fromJson(json['dialog'] as Map<String, dynamic>),
      dialogList: (json['dialogList'] as List?)
          ?.nonNulls
          .map((e) => Dialog.fromJson(e as Map<String, dynamic>))
          .toList(),
      dialogMap: (json['dialogMap'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Dialog.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final dialog = this.dialog;
    final dialogList = this.dialogList;
    final dialogMap = this.dialogMap;
    return {
      'dialog': dialog,
      if (dialogList != null) 'dialogList': dialogList,
      if (dialogMap != null) 'dialogMap': dialogMap,
    };
  }
}

class OperationWithRequiredMembersOutput {
  final Uint8List requiredBlob;
  final bool requiredBoolean;
  final int requiredByte;
  final double requiredDouble;
  final double requiredFloat;
  final int requiredInteger;
  final List<String> requiredList;
  final int requiredLong;
  final Map<String, String> requiredMap;
  final int requiredShort;
  final String requiredString;
  final DateTime requiredTimestamp;

  OperationWithRequiredMembersOutput({
    required this.requiredBlob,
    required this.requiredBoolean,
    required this.requiredByte,
    required this.requiredDouble,
    required this.requiredFloat,
    required this.requiredInteger,
    required this.requiredList,
    required this.requiredLong,
    required this.requiredMap,
    required this.requiredShort,
    required this.requiredString,
    required this.requiredTimestamp,
  });

  factory OperationWithRequiredMembersOutput.fromJson(
      Map<String, dynamic> json) {
    return OperationWithRequiredMembersOutput(
      requiredBlob: _s.decodeUint8List(json['requiredBlob']! as String),
      requiredBoolean: json['requiredBoolean'] as bool,
      requiredByte: json['requiredByte'] as int,
      requiredDouble: json['requiredDouble'] as double,
      requiredFloat: json['requiredFloat'] as double,
      requiredInteger: json['requiredInteger'] as int,
      requiredList: (json['requiredList'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      requiredLong: json['requiredLong'] as int,
      requiredMap: (json['requiredMap'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      requiredShort: json['requiredShort'] as int,
      requiredString: json['requiredString'] as String,
      requiredTimestamp:
          nonNullableTimeStampFromJson(json['requiredTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final requiredBlob = this.requiredBlob;
    final requiredBoolean = this.requiredBoolean;
    final requiredByte = this.requiredByte;
    final requiredDouble = this.requiredDouble;
    final requiredFloat = this.requiredFloat;
    final requiredInteger = this.requiredInteger;
    final requiredList = this.requiredList;
    final requiredLong = this.requiredLong;
    final requiredMap = this.requiredMap;
    final requiredShort = this.requiredShort;
    final requiredString = this.requiredString;
    final requiredTimestamp = this.requiredTimestamp;
    return {
      'requiredBlob': base64Encode(requiredBlob),
      'requiredBoolean': requiredBoolean,
      'requiredByte': requiredByte,
      'requiredDouble': requiredDouble,
      'requiredFloat': requiredFloat,
      'requiredInteger': requiredInteger,
      'requiredList': requiredList,
      'requiredLong': requiredLong,
      'requiredMap': requiredMap,
      'requiredShort': requiredShort,
      'requiredString': requiredString,
      'requiredTimestamp': unixTimestampToJson(requiredTimestamp),
    };
  }
}

class OperationWithRequiredMembersWithDefaultsOutput {
  final Uint8List requiredBlob;
  final bool requiredBoolean;
  final int requiredByte;
  final double requiredDouble;
  final RequiredEnum requiredEnum;
  final double requiredFloat;
  final int requiredIntEnum;
  final int requiredInteger;
  final List<String> requiredList;
  final int requiredLong;
  final Map<String, String> requiredMap;
  final int requiredShort;
  final String requiredString;
  final DateTime requiredTimestamp;

  OperationWithRequiredMembersWithDefaultsOutput({
    required this.requiredBlob,
    required this.requiredBoolean,
    required this.requiredByte,
    required this.requiredDouble,
    required this.requiredEnum,
    required this.requiredFloat,
    required this.requiredIntEnum,
    required this.requiredInteger,
    required this.requiredList,
    required this.requiredLong,
    required this.requiredMap,
    required this.requiredShort,
    required this.requiredString,
    required this.requiredTimestamp,
  });

  factory OperationWithRequiredMembersWithDefaultsOutput.fromJson(
      Map<String, dynamic> json) {
    return OperationWithRequiredMembersWithDefaultsOutput(
      requiredBlob: _s.decodeUint8List(json['requiredBlob']! as String),
      requiredBoolean: json['requiredBoolean'] as bool,
      requiredByte: json['requiredByte'] as int,
      requiredDouble: json['requiredDouble'] as double,
      requiredEnum: RequiredEnum.fromString((json['requiredEnum'] as String)),
      requiredFloat: json['requiredFloat'] as double,
      requiredIntEnum: json['requiredIntEnum'] as int,
      requiredInteger: json['requiredInteger'] as int,
      requiredList: (json['requiredList'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      requiredLong: json['requiredLong'] as int,
      requiredMap: (json['requiredMap'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      requiredShort: json['requiredShort'] as int,
      requiredString: json['requiredString'] as String,
      requiredTimestamp:
          nonNullableTimeStampFromJson(json['requiredTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final requiredBlob = this.requiredBlob;
    final requiredBoolean = this.requiredBoolean;
    final requiredByte = this.requiredByte;
    final requiredDouble = this.requiredDouble;
    final requiredEnum = this.requiredEnum;
    final requiredFloat = this.requiredFloat;
    final requiredIntEnum = this.requiredIntEnum;
    final requiredInteger = this.requiredInteger;
    final requiredList = this.requiredList;
    final requiredLong = this.requiredLong;
    final requiredMap = this.requiredMap;
    final requiredShort = this.requiredShort;
    final requiredString = this.requiredString;
    final requiredTimestamp = this.requiredTimestamp;
    return {
      'requiredBlob': base64Encode(requiredBlob),
      'requiredBoolean': requiredBoolean,
      'requiredByte': requiredByte,
      'requiredDouble': requiredDouble,
      'requiredEnum': requiredEnum.value,
      'requiredFloat': requiredFloat,
      'requiredIntEnum': requiredIntEnum,
      'requiredInteger': requiredInteger,
      'requiredList': requiredList,
      'requiredLong': requiredLong,
      'requiredMap': requiredMap,
      'requiredShort': requiredShort,
      'requiredString': requiredString,
      'requiredTimestamp': unixTimestampToJson(requiredTimestamp),
    };
  }
}

class SimpleScalarPropertiesOutput {
  final double? doubleValue;
  final double? floatValue;

  SimpleScalarPropertiesOutput({
    this.doubleValue,
    this.floatValue,
  });

  factory SimpleScalarPropertiesOutput.fromJson(Map<String, dynamic> json) {
    return SimpleScalarPropertiesOutput(
      doubleValue: json['doubleValue'] as double?,
      floatValue: json['floatValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final doubleValue = this.doubleValue;
    final floatValue = this.floatValue;
    return {
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (floatValue != null) 'floatValue': floatValue,
    };
  }
}

enum RequiredEnum {
  foo('FOO'),
  bar('BAR'),
  baz('BAZ'),
  ;

  final String value;

  const RequiredEnum(this.value);

  static RequiredEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RequiredEnum'));
}

class Dialog {
  final Farewell? farewell;
  final String? greeting;
  final String? language;

  Dialog({
    this.farewell,
    this.greeting,
    this.language,
  });

  factory Dialog.fromJson(Map<String, dynamic> json) {
    return Dialog(
      farewell: json['farewell'] != null
          ? Farewell.fromJson(json['farewell'] as Map<String, dynamic>)
          : null,
      greeting: json['greeting'] as String?,
      language: json['language'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final farewell = this.farewell;
    final greeting = this.greeting;
    final language = this.language;
    return {
      if (farewell != null) 'farewell': farewell,
      if (greeting != null) 'greeting': greeting,
      if (language != null) 'language': language,
    };
  }
}

class Farewell {
  final String? phrase;

  Farewell({
    this.phrase,
  });

  factory Farewell.fromJson(Map<String, dynamic> json) {
    return Farewell(
      phrase: json['phrase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phrase = this.phrase;
    return {
      if (phrase != null) 'phrase': phrase,
    };
  }
}

class TopLevel {
  final Dialog dialog;
  final List<Dialog>? dialogList;
  final Map<String, Dialog>? dialogMap;

  TopLevel({
    required this.dialog,
    this.dialogList,
    this.dialogMap,
  });

  Map<String, dynamic> toJson() {
    final dialog = this.dialog;
    final dialogList = this.dialogList;
    final dialogMap = this.dialogMap;
    return {
      'dialog': dialog,
      if (dialogList != null) 'dialogList': dialogList,
      if (dialogMap != null) 'dialogMap': dialogMap,
    };
  }
}

enum TestEnum {
  foo('FOO'),
  bar('BAR'),
  baz('BAZ'),
  ;

  final String value;

  const TestEnum(this.value);

  static TestEnum fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TestEnum'));
}

class Defaults {
  final Uint8List? defaultBlob;
  final bool? defaultBoolean;
  final int? defaultByte;
  final Document? defaultDocumentBoolean;
  final Document? defaultDocumentList;
  final Document? defaultDocumentMap;
  final Document? defaultDocumentString;
  final double? defaultDouble;
  final TestEnum? defaultEnum;
  final double? defaultFloat;
  final int? defaultIntEnum;
  final int? defaultInteger;
  final List<String>? defaultList;
  final int? defaultLong;
  final Map<String, String>? defaultMap;
  final Document? defaultNullDocument;
  final int? defaultShort;
  final String? defaultString;
  final DateTime? defaultTimestamp;
  final Uint8List? emptyBlob;
  final String? emptyString;
  final bool? falseBoolean;
  final int? zeroByte;
  final double? zeroDouble;
  final double? zeroFloat;
  final int? zeroInteger;
  final int? zeroLong;
  final int? zeroShort;

  Defaults({
    this.defaultBlob,
    this.defaultBoolean,
    this.defaultByte,
    this.defaultDocumentBoolean,
    this.defaultDocumentList,
    this.defaultDocumentMap,
    this.defaultDocumentString,
    this.defaultDouble,
    this.defaultEnum,
    this.defaultFloat,
    this.defaultIntEnum,
    this.defaultInteger,
    this.defaultList,
    this.defaultLong,
    this.defaultMap,
    this.defaultNullDocument,
    this.defaultShort,
    this.defaultString,
    this.defaultTimestamp,
    this.emptyBlob,
    this.emptyString,
    this.falseBoolean,
    this.zeroByte,
    this.zeroDouble,
    this.zeroFloat,
    this.zeroInteger,
    this.zeroLong,
    this.zeroShort,
  });

  Map<String, dynamic> toJson() {
    final defaultBlob = this.defaultBlob;
    final defaultBoolean = this.defaultBoolean;
    final defaultByte = this.defaultByte;
    final defaultDocumentBoolean = this.defaultDocumentBoolean;
    final defaultDocumentList = this.defaultDocumentList;
    final defaultDocumentMap = this.defaultDocumentMap;
    final defaultDocumentString = this.defaultDocumentString;
    final defaultDouble = this.defaultDouble;
    final defaultEnum = this.defaultEnum;
    final defaultFloat = this.defaultFloat;
    final defaultIntEnum = this.defaultIntEnum;
    final defaultInteger = this.defaultInteger;
    final defaultList = this.defaultList;
    final defaultLong = this.defaultLong;
    final defaultMap = this.defaultMap;
    final defaultNullDocument = this.defaultNullDocument;
    final defaultShort = this.defaultShort;
    final defaultString = this.defaultString;
    final defaultTimestamp = this.defaultTimestamp;
    final emptyBlob = this.emptyBlob;
    final emptyString = this.emptyString;
    final falseBoolean = this.falseBoolean;
    final zeroByte = this.zeroByte;
    final zeroDouble = this.zeroDouble;
    final zeroFloat = this.zeroFloat;
    final zeroInteger = this.zeroInteger;
    final zeroLong = this.zeroLong;
    final zeroShort = this.zeroShort;
    return {
      if (defaultBlob != null) 'defaultBlob': base64Encode(defaultBlob),
      if (defaultBoolean != null) 'defaultBoolean': defaultBoolean,
      if (defaultByte != null) 'defaultByte': defaultByte,
      if (defaultDocumentBoolean != null)
        'defaultDocumentBoolean': defaultDocumentBoolean,
      if (defaultDocumentList != null)
        'defaultDocumentList': defaultDocumentList,
      if (defaultDocumentMap != null) 'defaultDocumentMap': defaultDocumentMap,
      if (defaultDocumentString != null)
        'defaultDocumentString': defaultDocumentString,
      if (defaultDouble != null) 'defaultDouble': defaultDouble,
      if (defaultEnum != null) 'defaultEnum': defaultEnum.value,
      if (defaultFloat != null) 'defaultFloat': defaultFloat,
      if (defaultIntEnum != null) 'defaultIntEnum': defaultIntEnum,
      if (defaultInteger != null) 'defaultInteger': defaultInteger,
      if (defaultList != null) 'defaultList': defaultList,
      if (defaultLong != null) 'defaultLong': defaultLong,
      if (defaultMap != null) 'defaultMap': defaultMap,
      if (defaultNullDocument != null)
        'defaultNullDocument': defaultNullDocument,
      if (defaultShort != null) 'defaultShort': defaultShort,
      if (defaultString != null) 'defaultString': defaultString,
      if (defaultTimestamp != null)
        'defaultTimestamp': unixTimestampToJson(defaultTimestamp),
      if (emptyBlob != null) 'emptyBlob': base64Encode(emptyBlob),
      if (emptyString != null) 'emptyString': emptyString,
      if (falseBoolean != null) 'falseBoolean': falseBoolean,
      if (zeroByte != null) 'zeroByte': zeroByte,
      if (zeroDouble != null) 'zeroDouble': zeroDouble,
      if (zeroFloat != null) 'zeroFloat': zeroFloat,
      if (zeroInteger != null) 'zeroInteger': zeroInteger,
      if (zeroLong != null) 'zeroLong': zeroLong,
      if (zeroShort != null) 'zeroShort': zeroShort,
    };
  }
}

class ClientOptionalDefaults {
  final int? member;

  ClientOptionalDefaults({
    this.member,
  });

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'member': member,
    };
  }
}

/// A union with a representative set of types for members.
class MyUnion {
  final Uint8List? blobValue;
  final bool? booleanValue;
  final FooEnum? enumValue;
  final int? intEnumValue;
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
    this.intEnumValue,
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
      intEnumValue: json['intEnumValue'] as int?,
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
    final intEnumValue = this.intEnumValue;
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
      if (intEnumValue != null) 'intEnumValue': intEnumValue,
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

class ComplexNestedErrorData {
  final String? foo;

  ComplexNestedErrorData({
    this.foo,
  });

  factory ComplexNestedErrorData.fromJson(Map<String, dynamic> json) {
    return ComplexNestedErrorData(
      foo: json['Fooooo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'Fooooo': foo,
    };
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ComplexError': (type, message) => ComplexError(),
  'FooError': (type, message) => FooError(),
  'InvalidGreeting': (type, message) => InvalidGreeting(message: message),
};
