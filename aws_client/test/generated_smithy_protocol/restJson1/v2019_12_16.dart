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

class RestJsonProtocol {
  final _s.RestJsonProtocol _protocol;
  RestJsonProtocol({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'restjson',
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

  /// This example uses all query string types.
  Future<void> allQueryStringTypes({
    bool? queryBoolean,
    List<bool>? queryBooleanList,
    int? queryByte,
    double? queryDouble,
    List<double>? queryDoubleList,
    FooEnum? queryEnum,
    List<FooEnum>? queryEnumList,
    double? queryFloat,
    int? queryInteger,
    int? queryIntegerEnum,
    List<int>? queryIntegerEnumList,
    List<int>? queryIntegerList,
    List<int>? queryIntegerSet,
    int? queryLong,
    Map<String, List<String>>? queryParamsMapOfStringList,
    int? queryShort,
    String? queryString,
    List<String>? queryStringList,
    List<String>? queryStringSet,
    DateTime? queryTimestamp,
    List<DateTime>? queryTimestampList,
  }) async {
    final $query = <String, List<String>>{
      if (queryBoolean != null) 'Boolean': [queryBoolean.toString()],
      if (queryBooleanList != null)
        'BooleanList': queryBooleanList.map((e) => e.toString()).toList(),
      if (queryByte != null) 'Byte': [queryByte.toString()],
      if (queryDouble != null) 'Double': [queryDouble.toString()],
      if (queryDoubleList != null)
        'DoubleList': queryDoubleList.map((e) => e.toString()).toList(),
      if (queryEnum != null) 'Enum': [queryEnum.value],
      if (queryEnumList != null)
        'EnumList': queryEnumList.map((e) => e.value).toList(),
      if (queryFloat != null) 'Float': [queryFloat.toString()],
      if (queryInteger != null) 'Integer': [queryInteger.toString()],
      if (queryIntegerEnum != null)
        'IntegerEnum': [queryIntegerEnum.toString()],
      if (queryIntegerEnumList != null)
        'IntegerEnumList':
            queryIntegerEnumList.map((e) => e.toString()).toList(),
      if (queryIntegerList != null)
        'IntegerList': queryIntegerList.map((e) => e.toString()).toList(),
      if (queryIntegerSet != null)
        'IntegerSet': queryIntegerSet.map((e) => e.toString()).toList(),
      if (queryLong != null) 'Long': [queryLong.toString()],
      if (queryShort != null) 'Short': [queryShort.toString()],
      if (queryString != null) 'String': [queryString],
      if (queryStringList != null) 'StringList': queryStringList,
      if (queryStringSet != null) 'StringSet': queryStringSet,
      if (queryTimestamp != null)
        'Timestamp': [_s.iso8601ToJson(queryTimestamp).toString()],
      if (queryTimestampList != null)
        'TimestampList': queryTimestampList.map(_s.iso8601ToJson).toList(),
    };
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/AllQueryStringTypesInput',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This example uses fixed query string params and variable query string
  /// params. The fixed query string parameters and variable parameters must
  /// both be serialized (implementations may need to merge them together).
  Future<void> constantAndVariableQueryString({
    String? baz,
    String? maybeSet,
  }) async {
    final $query = <String, List<String>>{
      if (baz != null) 'baz': [baz],
      if (maybeSet != null) 'maybeSet': [maybeSet],
    };
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ConstantAndVariableQueryString?foo=bar',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This example uses a constant query string parameters and a label. This
  /// simply tests that labels and query string parameters are compatible. The
  /// fixed query string parameter named "hello" should in no way conflict with
  /// the label, `{hello}`.
  Future<void> constantQueryString({
    required String hello,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/ConstantQueryString/${Uri.encodeComponent(hello)}?foo=bar&hello',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The example tests how servers must support requests containing a
  /// `Content-Type` header with parameters.
  Future<void> contentTypeParameters({
    int? value,
  }) async {
    final $payload = <String, dynamic>{
      if (value != null) 'value': value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ContentTypeParameters',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<DatetimeOffsetsOutput> datetimeOffsets() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/DatetimeOffsets',
      exceptionFnMap: _exceptionFns,
    );
    return DatetimeOffsetsOutput.fromJson(response);
  }

  /// This example serializes a document as part of the payload.
  Future<DocumentTypeInputOutput> documentType({
    Object? documentValue,
    String? stringValue,
  }) async {
    final $payload = <String, dynamic>{
      if (documentValue != null) 'documentValue': documentValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/DocumentType',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentTypeInputOutput.fromJson(response);
  }

  /// This example serializes documents as the value of maps.
  Future<DocumentTypeAsMapValueInputOutput> documentTypeAsMapValue({
    Map<String, Object>? docValuedMap,
  }) async {
    final $payload = <String, dynamic>{
      if (docValuedMap != null) 'docValuedMap': docValuedMap,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/DocumentTypeAsMapValue',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentTypeAsMapValueInputOutput.fromJson(response);
  }

  /// This example serializes a document as the entire HTTP payload.
  Future<DocumentTypeAsPayloadInputOutput> documentTypeAsPayload({
    Object? documentValue,
  }) async {
    final response = await _protocol.sendRaw(
      payload: documentValue,
      method: 'PUT',
      requestUri: '/DocumentTypeAsPayload',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DocumentTypeAsPayloadInputOutput(
      documentValue: $json,
    );
  }

  Future<DuplexStreamOutput> duplexStream({
    EventStream? stream,
  }) async {
    final response = await _protocol.sendRaw(
      payload: stream,
      method: 'POST',
      requestUri: '/DuplexStream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DuplexStreamOutput(
      stream: EventStream.fromJson($json),
    );
  }

  Future<DuplexStreamWithDistinctStreamsOutput>
      duplexStreamWithDistinctStreams({
    EventStream? stream,
  }) async {
    final response = await _protocol.sendRaw(
      payload: stream,
      method: 'POST',
      requestUri: '/DuplexStreamWithDistinctStreams',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DuplexStreamWithDistinctStreamsOutput(
      stream: SingletonEventStream.fromJson($json),
    );
  }

  ///
  /// May throw [ServiceUnavailableError].
  Future<DuplexStreamWithInitialMessagesOutput>
      duplexStreamWithInitialMessages({
    required String initialRequestMember,
    EventStream? stream,
  }) async {
    final headers = <String, String>{
      'initial-request-member': initialRequestMember.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: stream,
      method: 'POST',
      requestUri: '/DuplexStreamWithInitialMessages',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DuplexStreamWithInitialMessagesOutput(
      stream: EventStream.fromJson($json),
      initialResponseMember: _s.extractHeaderStringValue(
          response.headers, 'initial-response-member')!,
    );
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has an empty input
  /// and empty output structure that reuses the same shape. While this should
  /// be rare, code generators must support this.
  Future<void> emptyInputAndEmptyOutput() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/EmptyInputAndEmptyOutput',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> endpointOperation() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/EndpointOperation',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> endpointWithHostLabelOperation({
    required String label,
  }) async {
    final $payload = <String, dynamic>{
      'label': label,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/EndpointWithHostLabelOperation',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<FractionalSecondsOutput> fractionalSeconds() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/FractionalSeconds',
      exceptionFnMap: _exceptionFns,
    );
    return FractionalSecondsOutput.fromJson(response);
  }

  /// This operation has four possible return values: 1. A successful response
  /// in the form of GreetingWithErrorsOutput 2. An InvalidGreeting error. 3. A
  /// BadRequest error. 4. A FooError. Implementations must be able to
  /// successfully take a response and properly (de)serialize successful and
  /// error responses based on the the presence of the
  ///
  /// May throw [ComplexError].
  /// May throw [FooError].
  /// May throw [InvalidGreeting].
  Future<GreetingWithErrorsOutput> greetingWithErrors() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'PUT',
      requestUri: '/GreetingWithErrors',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GreetingWithErrorsOutput(
      greeting: _s.extractHeaderStringValue(response.headers, 'X-Greeting'),
    );
  }

  Future<void> hostWithPathOperation() async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/HostWithPathOperation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This example tests httpChecksumRequired trait
  Future<HttpChecksumRequiredInputOutput> httpChecksumRequired({
    String? foo,
  }) async {
    final $payload = <String, dynamic>{
      if (foo != null) 'foo': foo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/HttpChecksumRequired',
      exceptionFnMap: _exceptionFns,
    );
    return HttpChecksumRequiredInputOutput.fromJson(response);
  }

  /// Clients that perform this test extract all headers from the response.
  Future<HttpEmptyPrefixHeadersOutput> httpEmptyPrefixHeaders({
    Map<String, String>? prefixHeaders,
    String? specificHeader,
  }) async {
    final headers = <String, String>{
      if (prefixHeaders != null) ...prefixHeaders,
      if (specificHeader != null) 'hello': specificHeader.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/HttpEmptyPrefixHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return HttpEmptyPrefixHeadersOutput(
      prefixHeaders: _s.extractHeaderMapValues(response.headers, ''),
      specificHeader: _s.extractHeaderStringValue(response.headers, 'hello'),
    );
  }

  Future<EnumPayloadInput> httpEnumPayload({
    StringEnum? payload,
  }) async {
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri: '/EnumPayload',
      exceptionFnMap: _exceptionFns,
    );
    return EnumPayloadInput(
      payload: StringEnum.fromString(await response.stream.bytesToString()),
    );
  }

  /// This example serializes a blob shape in the payload. In this example, no
  /// JSON document is synthesized because the payload is not a structure or a
  /// union type.
  Future<HttpPayloadTraitsInputOutput> httpPayloadTraits({
    Uint8List? blob,
    String? foo,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: blob,
      method: 'POST',
      requestUri: '/HttpPayloadTraits',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return HttpPayloadTraitsInputOutput(
      blob: await response.stream.toBytes(),
      foo: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
    );
  }

  /// This example uses a `@mediaType` trait on the payload to force a custom
  /// content-type to be serialized.
  Future<HttpPayloadTraitsWithMediaTypeInputOutput>
      httpPayloadTraitsWithMediaType({
    Uint8List? blob,
    String? foo,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: blob,
      method: 'POST',
      requestUri: '/HttpPayloadTraitsWithMediaType',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return HttpPayloadTraitsWithMediaTypeInputOutput(
      blob: await response.stream.toBytes(),
      foo: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
    );
  }

  /// This example serializes a structure in the payload. Note that serializing
  /// a structure changes the wrapper element name to match the targeted
  /// structure.
  Future<HttpPayloadWithStructureInputOutput> httpPayloadWithStructure({
    NestedPayload? nested,
  }) async {
    final response = await _protocol.sendRaw(
      payload: nested,
      method: 'PUT',
      requestUri: '/HttpPayloadWithStructure',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return HttpPayloadWithStructureInputOutput(
      nested: NestedPayload.fromJson($json),
    );
  }

  /// This example serializes a union in the payload.
  Future<HttpPayloadWithUnionInputOutput> httpPayloadWithUnion({
    UnionPayload? nested,
  }) async {
    final response = await _protocol.sendRaw(
      payload: nested,
      method: 'PUT',
      requestUri: '/HttpPayloadWithUnion',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return HttpPayloadWithUnionInputOutput(
      nested: UnionPayload.fromJson($json),
    );
  }

  /// This examples adds headers to the input of a request and response by
  /// prefix.
  Future<HttpPrefixHeadersOutput> httpPrefixHeaders({
    String? foo,
    Map<String, String>? fooMap,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'x-foo': foo.toString(),
      if (fooMap != null)
        ...fooMap.map((key, value) => MapEntry('x-foo-$key', value)),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/HttpPrefixHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return HttpPrefixHeadersOutput(
      foo: _s.extractHeaderStringValue(response.headers, 'x-foo'),
      fooMap: _s.extractHeaderMapValues(response.headers, 'x-foo-'),
    );
  }

  /// Clients that perform this test extract all headers from the response.
  Future<HttpPrefixHeadersInResponseOutput>
      httpPrefixHeadersInResponse() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/HttpPrefixHeadersResponse',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return HttpPrefixHeadersInResponseOutput(
      prefixHeaders: _s.extractHeaderMapValues(response.headers, ''),
    );
  }

  /// This example tests httpQueryParams when no other query parameters exist.
  Future<void> httpQueryParamsOnlyOperation({
    Map<String, String>? queryMap,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/http-query-params-only',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> httpRequestWithFloatLabels({
    required double doubleValue,
    required double float,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/FloatHttpLabels/${Uri.encodeComponent(float.toString())}/${Uri.encodeComponent(doubleValue.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> httpRequestWithGreedyLabelInPath({
    required String baz,
    required String foo,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/HttpRequestWithGreedyLabelInPath/foo/${Uri.encodeComponent(foo)}/baz/${baz.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The example tests how requests are serialized when there's no input
  /// payload but there are HTTP labels.
  ///
  /// Parameter [boolean] :
  /// Serialized in the path as true or false.
  ///
  /// Parameter [timestamp] :
  /// Note that this member has no format, so it's serialized as an RFC 3399
  /// date-time.
  Future<void> httpRequestWithLabels({
    required bool boolean,
    required double doubleValue,
    required double float,
    required int integer,
    required int long,
    required int short,
    required String string,
    required DateTime timestamp,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/HttpRequestWithLabels/${Uri.encodeComponent(string)}/${Uri.encodeComponent(short.toString())}/${Uri.encodeComponent(integer.toString())}/${Uri.encodeComponent(long.toString())}/${Uri.encodeComponent(float.toString())}/${Uri.encodeComponent(doubleValue.toString())}/${Uri.encodeComponent(boolean.toString())}/${Uri.encodeComponent(_s.iso8601ToJson(timestamp))}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The example tests how requests serialize different timestamp formats in
  /// the URI path.
  Future<void> httpRequestWithLabelsAndTimestampFormat({
    required DateTime defaultFormat,
    required DateTime memberDateTime,
    required DateTime memberEpochSeconds,
    required DateTime memberHttpDate,
    required DateTime targetDateTime,
    required DateTime targetEpochSeconds,
    required DateTime targetHttpDate,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/HttpRequestWithLabelsAndTimestampFormat/${Uri.encodeComponent(_s.unixTimestampToJson(memberEpochSeconds).toString())}/${Uri.encodeComponent(_s.rfc822ToJson(memberHttpDate))}/${Uri.encodeComponent(_s.iso8601ToJson(memberDateTime))}/${Uri.encodeComponent(_s.iso8601ToJson(defaultFormat))}/${Uri.encodeComponent(_s.unixTimestampToJson(targetEpochSeconds).toString())}/${Uri.encodeComponent(_s.rfc822ToJson(targetHttpDate))}/${Uri.encodeComponent(_s.iso8601ToJson(targetDateTime))}',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> httpRequestWithRegexLiteral({
    required String str,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ReDosLiteral/${Uri.encodeComponent(str)}/(a%2B)%2B',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<HttpResponseCodeOutput> httpResponseCode() async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/HttpResponseCode',
      exceptionFnMap: _exceptionFns,
    );
    return HttpResponseCodeOutput.fromJson(response);
  }

  Future<StringPayloadInput> httpStringPayload({
    String? payload,
  }) async {
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri: '/StringPayload',
      exceptionFnMap: _exceptionFns,
    );
    return StringPayloadInput(
      payload: await response.stream.bytesToString(),
    );
  }

  /// This example ensures that query string bound request parameters are
  /// serialized in the body of responses if the structure is used in both the
  /// request and response.
  Future<IgnoreQueryParamsInResponseOutput>
      ignoreQueryParamsInResponse() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/IgnoreQueryParamsInResponse',
      exceptionFnMap: _exceptionFns,
    );
    return IgnoreQueryParamsInResponseOutput.fromJson(response);
  }

  /// The example tests how requests and responses are serialized when there is
  /// no input or output payload but there are HTTP header bindings.
  Future<InputAndOutputWithHeadersIO> inputAndOutputWithHeaders({
    List<bool>? headerBooleanList,
    int? headerByte,
    double? headerDouble,
    FooEnum? headerEnum,
    List<FooEnum>? headerEnumList,
    bool? headerFalseBool,
    double? headerFloat,
    int? headerInteger,
    int? headerIntegerEnum,
    List<int>? headerIntegerEnumList,
    List<int>? headerIntegerList,
    int? headerLong,
    int? headerShort,
    String? headerString,
    List<String>? headerStringList,
    List<String>? headerStringSet,
    List<DateTime>? headerTimestampList,
    bool? headerTrueBool,
  }) async {
    final headers = <String, String>{
      if (headerBooleanList != null)
        'X-BooleanList': headerBooleanList.toString(),
      if (headerByte != null) 'X-Byte': headerByte.toString(),
      if (headerDouble != null) 'X-Double': headerDouble.toString(),
      if (headerEnum != null) 'X-Enum': headerEnum.value,
      if (headerEnumList != null) 'X-EnumList': headerEnumList.toString(),
      if (headerFalseBool != null) 'X-Boolean2': headerFalseBool.toString(),
      if (headerFloat != null) 'X-Float': headerFloat.toString(),
      if (headerInteger != null) 'X-Integer': headerInteger.toString(),
      if (headerIntegerEnum != null)
        'X-IntegerEnum': headerIntegerEnum.toString(),
      if (headerIntegerEnumList != null)
        'X-IntegerEnumList': headerIntegerEnumList.toString(),
      if (headerIntegerList != null)
        'X-IntegerList': headerIntegerList.toString(),
      if (headerLong != null) 'X-Long': headerLong.toString(),
      if (headerShort != null) 'X-Short': headerShort.toString(),
      if (headerString != null) 'X-String': headerString.toString(),
      if (headerStringList != null) 'X-StringList': headerStringList.toString(),
      if (headerStringSet != null) 'X-StringSet': headerStringSet.toString(),
      if (headerTimestampList != null)
        'X-TimestampList': headerTimestampList.toString(),
      if (headerTrueBool != null) 'X-Boolean1': headerTrueBool.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/InputAndOutputWithHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InputAndOutputWithHeadersIO(
      headerBooleanList: _s
          .extractHeaderListValues(response.headers, 'X-BooleanList')
          ?.map((e) => e.toLowerCase() == 'true')
          .toList(),
      headerByte: _s.extractHeaderIntValue(response.headers, 'X-Byte'),
      headerDouble: _s.extractHeaderDoubleValue(response.headers, 'X-Double'),
      headerEnum: _s
          .extractHeaderStringValue(response.headers, 'X-Enum')
          ?.let(FooEnum.fromString),
      headerEnumList: _s
          .extractHeaderListValues(response.headers, 'X-EnumList')
          ?.map(FooEnum.fromString)
          .toList(),
      headerFalseBool:
          _s.extractHeaderBoolValue(response.headers, 'X-Boolean2'),
      headerFloat: _s.extractHeaderDoubleValue(response.headers, 'X-Float'),
      headerInteger: _s.extractHeaderIntValue(response.headers, 'X-Integer'),
      headerIntegerEnum:
          _s.extractHeaderIntValue(response.headers, 'X-IntegerEnum'),
      headerIntegerEnumList: _s
          .extractHeaderListValues(response.headers, 'X-IntegerEnumList')
          ?.map(int.parse)
          .toList(),
      headerIntegerList: _s
          .extractHeaderListValues(response.headers, 'X-IntegerList')
          ?.map(int.parse)
          .toList(),
      headerLong: _s.extractHeaderIntValue(response.headers, 'X-Long'),
      headerShort: _s.extractHeaderIntValue(response.headers, 'X-Short'),
      headerString: _s.extractHeaderStringValue(response.headers, 'X-String'),
      headerStringList:
          _s.extractHeaderListValues(response.headers, 'X-StringList'),
      headerStringSet:
          _s.extractHeaderListValues(response.headers, 'X-StringSet'),
      headerTimestampList: _s
          .extractHeaderListValues(response.headers, 'X-TimestampList',
              isHttpDateList: true)
          ?.map(_s.nonNullableTimeStampFromJson)
          .toList(),
      headerTrueBool: _s.extractHeaderBoolValue(response.headers, 'X-Boolean1'),
    );
  }

  Future<void> inputStream({
    EventStream? stream,
  }) async {
    await _protocol.send(
      payload: stream,
      method: 'POST',
      requestUri: '/InputStream',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> inputStreamWithInitialRequest({
    required String initialRequestMember,
    EventStream? stream,
  }) async {
    final headers = <String, String>{
      'initial-request-member': initialRequestMember.toString(),
    };
    await _protocol.send(
      payload: stream,
      method: 'POST',
      requestUri: '/InputStreamWithInitialRequest',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Blobs are base64 encoded
  Future<JsonBlobsInputOutput> jsonBlobs({
    Uint8List? data,
  }) async {
    final $payload = <String, dynamic>{
      if (data != null) 'data': base64Encode(data),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/JsonBlobs',
      exceptionFnMap: _exceptionFns,
    );
    return JsonBlobsInputOutput.fromJson(response);
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
    final $payload = <String, dynamic>{
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
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/JsonEnums',
      exceptionFnMap: _exceptionFns,
    );
    return JsonEnumsInputOutput.fromJson(response);
  }

  /// This example serializes intEnums as top level properties, in lists, sets,
  /// and maps.
  Future<JsonIntEnumsInputOutput> jsonIntEnums({
    int? integerEnum1,
    int? integerEnum2,
    int? integerEnum3,
    List<int>? integerEnumList,
    Map<String, int>? integerEnumMap,
    List<int>? integerEnumSet,
  }) async {
    final $payload = <String, dynamic>{
      if (integerEnum1 != null) 'integerEnum1': integerEnum1,
      if (integerEnum2 != null) 'integerEnum2': integerEnum2,
      if (integerEnum3 != null) 'integerEnum3': integerEnum3,
      if (integerEnumList != null) 'integerEnumList': integerEnumList,
      if (integerEnumMap != null) 'integerEnumMap': integerEnumMap,
      if (integerEnumSet != null) 'integerEnumSet': integerEnumSet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/JsonIntEnums',
      exceptionFnMap: _exceptionFns,
    );
    return JsonIntEnumsInputOutput.fromJson(response);
  }

  /// This test case serializes JSON lists for the following cases for both
  /// input and output: 1. Normal JSON lists. 2. Normal JSON sets. 3. JSON lists
  /// of lists. 4. Lists of structures.
  Future<JsonListsInputOutput> jsonLists({
    List<bool>? booleanList,
    List<FooEnum>? enumList,
    List<int>? intEnumList,
    List<int>? integerList,
    List<List<String>>? nestedStringList,
    List<String>? stringList,
    List<String>? stringSet,
    List<StructureListMember>? structureList,
    List<DateTime>? timestampList,
  }) async {
    final $payload = <String, dynamic>{
      if (booleanList != null) 'booleanList': booleanList,
      if (enumList != null) 'enumList': enumList.map((e) => e.value).toList(),
      if (intEnumList != null) 'intEnumList': intEnumList,
      if (integerList != null) 'integerList': integerList,
      if (nestedStringList != null) 'nestedStringList': nestedStringList,
      if (stringList != null) 'stringList': stringList,
      if (stringSet != null) 'stringSet': stringSet,
      if (structureList != null) 'myStructureList': structureList,
      if (timestampList != null)
        'timestampList': timestampList.map(unixTimestampToJson).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/JsonLists',
      exceptionFnMap: _exceptionFns,
    );
    return JsonListsInputOutput.fromJson(response);
  }

  /// The example tests basic map serialization.
  Future<JsonMapsInputOutput> jsonMaps({
    Map<String, bool>? denseBooleanMap,
    Map<String, int>? denseNumberMap,
    Map<String, List<String>>? denseSetMap,
    Map<String, String>? denseStringMap,
    Map<String, SharedGreetingStruct>? denseStructMap,
  }) async {
    final $payload = <String, dynamic>{
      if (denseBooleanMap != null) 'denseBooleanMap': denseBooleanMap,
      if (denseNumberMap != null) 'denseNumberMap': denseNumberMap,
      if (denseSetMap != null) 'denseSetMap': denseSetMap,
      if (denseStringMap != null) 'denseStringMap': denseStringMap,
      if (denseStructMap != null) 'denseStructMap': denseStructMap,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/JsonMaps',
      exceptionFnMap: _exceptionFns,
    );
    return JsonMapsInputOutput.fromJson(response);
  }

  /// This tests how timestamps are serialized, including using the default
  /// format of date-time and various @timestampFormat trait values.
  Future<JsonTimestampsInputOutput> jsonTimestamps({
    DateTime? dateTime,
    DateTime? dateTimeOnTarget,
    DateTime? epochSeconds,
    DateTime? epochSecondsOnTarget,
    DateTime? httpDate,
    DateTime? httpDateOnTarget,
    DateTime? normal,
  }) async {
    final $payload = <String, dynamic>{
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
      if (normal != null) 'normal': unixTimestampToJson(normal),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/JsonTimestamps',
      exceptionFnMap: _exceptionFns,
    );
    return JsonTimestampsInputOutput.fromJson(response);
  }

  /// This operation uses unions for inputs and outputs.
  Future<UnionInputOutput> jsonUnions({
    MyUnion? contents,
  }) async {
    final $payload = <String, dynamic>{
      if (contents != null) 'contents': contents,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/JsonUnions',
      exceptionFnMap: _exceptionFns,
    );
    return UnionInputOutput.fromJson(response);
  }

  Future<SharedGreetingStruct> malformedAcceptWithBody() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedAcceptWithBody',
      exceptionFnMap: _exceptionFns,
    );
    return SharedGreetingStruct.fromJson(response);
  }

  Future<MalformedAcceptWithGenericStringOutput>
      malformedAcceptWithGenericString() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedAcceptWithGenericString',
      exceptionFnMap: _exceptionFns,
    );
    return MalformedAcceptWithGenericStringOutput(
      payload: await response.stream.bytesToString(),
    );
  }

  Future<MalformedAcceptWithPayloadOutput> malformedAcceptWithPayload() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedAcceptWithPayload',
      exceptionFnMap: _exceptionFns,
    );
    return MalformedAcceptWithPayloadOutput(
      payload: await response.stream.toBytes(),
    );
  }

  Future<void> malformedBlob({
    Uint8List? blob,
  }) async {
    final $payload = <String, dynamic>{
      if (blob != null) 'blob': base64Encode(blob),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedBlob',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedBoolean({
    required bool booleanInPath,
    bool? booleanInBody,
    bool? booleanInHeader,
    bool? booleanInQuery,
  }) async {
    final headers = <String, String>{
      if (booleanInHeader != null)
        'booleanInHeader': booleanInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (booleanInQuery != null) 'booleanInQuery': [booleanInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (booleanInBody != null) 'booleanInBody': booleanInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedBoolean/${Uri.encodeComponent(booleanInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedByte({
    required int byteInPath,
    int? byteInBody,
    int? byteInHeader,
    int? byteInQuery,
  }) async {
    final headers = <String, String>{
      if (byteInHeader != null) 'byteInHeader': byteInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (byteInQuery != null) 'byteInQuery': [byteInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (byteInBody != null) 'byteInBody': byteInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedByte/${Uri.encodeComponent(byteInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedContentTypeWithBody({
    String? hi,
  }) async {
    final $payload = <String, dynamic>{
      if (hi != null) 'hi': hi,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedContentTypeWithBody',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedContentTypeWithGenericString({
    String? payload,
  }) async {
    await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/MalformedContentTypeWithGenericString',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedContentTypeWithoutBody() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedContentTypeWithoutBody',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedContentTypeWithoutBodyEmptyInput({
    String? header,
  }) async {
    final headers = <String, String>{
      if (header != null) 'header': header.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedContentTypeWithoutBodyEmptyInput',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedContentTypeWithPayload({
    Uint8List? payload,
  }) async {
    await _protocol.send(
      payload: payload,
      method: 'POST',
      requestUri: '/MalformedContentTypeWithPayload',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedDouble({
    required double doubleInPath,
    double? doubleInBody,
    double? doubleInHeader,
    double? doubleInQuery,
  }) async {
    final headers = <String, String>{
      if (doubleInHeader != null) 'doubleInHeader': doubleInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (doubleInQuery != null) 'doubleInQuery': [doubleInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (doubleInBody != null) 'doubleInBody': doubleInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedDouble/${Uri.encodeComponent(doubleInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedFloat({
    required double floatInPath,
    double? floatInBody,
    double? floatInHeader,
    double? floatInQuery,
  }) async {
    final headers = <String, String>{
      if (floatInHeader != null) 'floatInHeader': floatInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (floatInQuery != null) 'floatInQuery': [floatInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (floatInBody != null) 'floatInBody': floatInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedFloat/${Uri.encodeComponent(floatInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedInteger({
    required int integerInPath,
    int? integerInBody,
    int? integerInHeader,
    int? integerInQuery,
  }) async {
    final headers = <String, String>{
      if (integerInHeader != null)
        'integerInHeader': integerInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (integerInQuery != null) 'integerInQuery': [integerInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (integerInBody != null) 'integerInBody': integerInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedInteger/${Uri.encodeComponent(integerInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedList({
    List<String>? bodyList,
  }) async {
    final $payload = <String, dynamic>{
      if (bodyList != null) 'bodyList': bodyList,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedList',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedLong({
    required int longInPath,
    int? longInBody,
    int? longInHeader,
    int? longInQuery,
  }) async {
    final headers = <String, String>{
      if (longInHeader != null) 'longInHeader': longInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (longInQuery != null) 'longInQuery': [longInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (longInBody != null) 'longInBody': longInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedLong/${Uri.encodeComponent(longInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedMap({
    Map<String, String>? bodyMap,
  }) async {
    final $payload = <String, dynamic>{
      if (bodyMap != null) 'bodyMap': bodyMap,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedMap',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedRequestBody({
    double? float,
    int? intValue,
  }) async {
    final $payload = <String, dynamic>{
      if (float != null) 'float': float,
      if (intValue != null) 'int': intValue,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedRequestBody',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedShort({
    required int shortInPath,
    int? shortInBody,
    int? shortInHeader,
    int? shortInQuery,
  }) async {
    final headers = <String, String>{
      if (shortInHeader != null) 'shortInHeader': shortInHeader.toString(),
    };
    final $query = <String, List<String>>{
      if (shortInQuery != null) 'shortInQuery': [shortInQuery.toString()],
    };
    final $payload = <String, dynamic>{
      if (shortInBody != null) 'shortInBody': shortInBody,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/MalformedShort/${Uri.encodeComponent(shortInPath.toString())}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedString({
    Object? blob,
  }) async {
    final headers = <String, String>{
      if (blob != null)
        'amz-media-typed-header': base64Encode(utf8.encode(jsonEncode(blob))),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedString',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampBodyDateTime({
    required DateTime timestamp,
  }) async {
    final $payload = <String, dynamic>{
      'timestamp': iso8601ToJson(timestamp),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedTimestampBodyDateTime',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampBodyDefault({
    required DateTime timestamp,
  }) async {
    final $payload = <String, dynamic>{
      'timestamp': unixTimestampToJson(timestamp),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedTimestampBodyDefault',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampBodyHttpDate({
    required DateTime timestamp,
  }) async {
    final $payload = <String, dynamic>{
      'timestamp': rfc822ToJson(timestamp),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedTimestampBodyHttpDate',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampHeaderDateTime({
    required DateTime timestamp,
  }) async {
    final headers = <String, String>{
      'timestamp': _s.iso8601ToJson(timestamp),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedTimestampHeaderDateTime',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampHeaderDefault({
    required DateTime timestamp,
  }) async {
    final headers = <String, String>{
      'timestamp': _s.rfc822ToJson(timestamp),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedTimestampHeaderDefault',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampHeaderEpoch({
    required DateTime timestamp,
  }) async {
    final headers = <String, String>{
      'timestamp': _s.unixTimestampToJson(timestamp).toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedTimestampHeaderEpoch',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampPathDefault({
    required DateTime timestamp,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/MalformedTimestampPathDefault/${Uri.encodeComponent(_s.iso8601ToJson(timestamp))}',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampPathEpoch({
    required DateTime timestamp,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/MalformedTimestampPathEpoch/${Uri.encodeComponent(_s.unixTimestampToJson(timestamp).toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampPathHttpDate({
    required DateTime timestamp,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/MalformedTimestampPathHttpDate/${Uri.encodeComponent(_s.rfc822ToJson(timestamp))}',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampQueryDefault({
    required DateTime timestamp,
  }) async {
    final $query = <String, List<String>>{
      'timestamp': [_s.iso8601ToJson(timestamp).toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedTimestampQueryDefault',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampQueryEpoch({
    required DateTime timestamp,
  }) async {
    final $query = <String, List<String>>{
      'timestamp': [_s.unixTimestampToJson(timestamp).toString().toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedTimestampQueryEpoch',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedTimestampQueryHttpDate({
    required DateTime timestamp,
  }) async {
    final $query = <String, List<String>>{
      'timestamp': [_s.rfc822ToJson(timestamp).toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/MalformedTimestampQueryHttpDate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> malformedUnion({
    SimpleUnion? union,
  }) async {
    final $payload = <String, dynamic>{
      if (union != null) 'union': union,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MalformedUnion',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This example ensures that mediaType strings are base64 encoded in headers.
  Future<MediaTypeHeaderOutput> mediaTypeHeader({
    Object? json,
  }) async {
    final headers = <String, String>{
      if (json != null) 'X-Json': base64Encode(utf8.encode(jsonEncode(json))),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/MediaTypeHeader',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return MediaTypeHeaderOutput(
      json: _s.extractHeaderJsonValue(response.headers, 'X-Json'),
    );
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has no input or
  /// output. While this should be rare, code generators must support this.
  Future<void> noInputAndNoOutput() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/NoInputAndNoOutput',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has no input and the
  /// output is empty. While this should be rare, code generators must support
  /// this.
  Future<void> noInputAndOutput() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/NoInputAndOutputOutput',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Null headers are not sent over the wire, empty headers are serialized to
  /// ""
  Future<NullAndEmptyHeadersIO> nullAndEmptyHeadersClient({
    String? a,
    String? b,
    List<String>? c,
  }) async {
    final headers = <String, String>{
      if (a != null) 'X-A': a.toString(),
      if (b != null) 'X-B': b.toString(),
      if (c != null) 'X-C': c.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/NullAndEmptyHeadersClient',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return NullAndEmptyHeadersIO(
      a: _s.extractHeaderStringValue(response.headers, 'X-A'),
      b: _s.extractHeaderStringValue(response.headers, 'X-B'),
      c: _s.extractHeaderListValues(response.headers, 'X-C'),
    );
  }

  /// Null headers are not sent over the wire, empty headers are serialized to
  /// ""
  Future<NullAndEmptyHeadersIO> nullAndEmptyHeadersServer({
    String? a,
    String? b,
    List<String>? c,
  }) async {
    final headers = <String, String>{
      if (a != null) 'X-A': a.toString(),
      if (b != null) 'X-B': b.toString(),
      if (c != null) 'X-C': c.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/NullAndEmptyHeadersServer',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return NullAndEmptyHeadersIO(
      a: _s.extractHeaderStringValue(response.headers, 'X-A'),
      b: _s.extractHeaderStringValue(response.headers, 'X-B'),
      c: _s.extractHeaderListValues(response.headers, 'X-C'),
    );
  }

  /// Omits null, but serializes empty string value.
  Future<void> omitsNullSerializesEmptyString({
    String? emptyString,
    String? nullValue,
  }) async {
    final $query = <String, List<String>>{
      if (emptyString != null) 'Empty': [emptyString],
      if (nullValue != null) 'Null': [nullValue],
    };
    await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/OmitsNullSerializesEmptyString',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Omits serializing empty lists. Because empty strings are serilized as
  /// `Foo=`, empty lists cannot also be serialized as `Foo=` and instead must
  /// be omitted.
  Future<void> omitsSerializingEmptyLists({
    List<bool>? queryBooleanList,
    List<double>? queryDoubleList,
    List<FooEnum>? queryEnumList,
    List<int>? queryIntegerEnumList,
    List<int>? queryIntegerList,
    List<String>? queryStringList,
    List<DateTime>? queryTimestampList,
  }) async {
    final $query = <String, List<String>>{
      if (queryBooleanList != null)
        'BooleanList': queryBooleanList.map((e) => e.toString()).toList(),
      if (queryDoubleList != null)
        'DoubleList': queryDoubleList.map((e) => e.toString()).toList(),
      if (queryEnumList != null)
        'EnumList': queryEnumList.map((e) => e.value).toList(),
      if (queryIntegerEnumList != null)
        'IntegerEnumList':
            queryIntegerEnumList.map((e) => e.toString()).toList(),
      if (queryIntegerList != null)
        'IntegerList': queryIntegerList.map((e) => e.toString()).toList(),
      if (queryStringList != null) 'StringList': queryStringList,
      if (queryTimestampList != null)
        'TimestampList': queryTimestampList.map(_s.iso8601ToJson).toList(),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/OmitsSerializingEmptyLists',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<OperationWithDefaultsOutput> operationWithDefaults({
    ClientOptionalDefaults? clientOptionalDefaults,
    Defaults? defaults,
    int? otherTopLevelDefault,
    String? topLevelDefault,
  }) async {
    final $payload = <String, dynamic>{
      if (clientOptionalDefaults != null)
        'clientOptionalDefaults': clientOptionalDefaults,
      if (defaults != null) 'defaults': defaults,
      if (otherTopLevelDefault != null)
        'otherTopLevelDefault': otherTopLevelDefault,
      if (topLevelDefault != null) 'topLevelDefault': topLevelDefault,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/OperationWithDefaults',
      exceptionFnMap: _exceptionFns,
    );
    return OperationWithDefaultsOutput.fromJson(response);
  }

  Future<OperationWithNestedStructureOutput> operationWithNestedStructure({
    required TopLevel topLevel,
  }) async {
    final $payload = <String, dynamic>{
      'topLevel': topLevel,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/OperationWithNestedStructure',
      exceptionFnMap: _exceptionFns,
    );
    return OperationWithNestedStructureOutput.fromJson(response);
  }

  ///
  /// May throw [ServiceUnavailableError].
  Future<OutputStreamOutput> outputStream() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/OutputStream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputStreamOutput(
      stream: EventStream.fromJson($json),
    );
  }

  Future<OutputStreamWithInitialResponseOutput>
      outputStreamWithInitialResponse() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/OutputStreamWithInitialResponse',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return OutputStreamWithInitialResponseOutput(
      stream: EventStream.fromJson($json),
      initialResponseMember: _s.extractHeaderStringValue(
          response.headers, 'initial-response-member')!,
    );
  }

  /// This operation defines a union with a Unit member.
  Future<PostPlayerActionOutput> postPlayerAction({
    PlayerAction? action,
  }) async {
    final $payload = <String, dynamic>{
      if (action != null) 'action': action,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PostPlayerAction',
      exceptionFnMap: _exceptionFns,
    );
    return PostPlayerActionOutput.fromJson(response);
  }

  /// This operation defines a union that uses jsonName on some members.
  Future<PostUnionWithJsonNameOutput> postUnionWithJsonName({
    UnionWithJsonName? value,
  }) async {
    final $payload = <String, dynamic>{
      if (value != null) 'value': value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PostUnionWithJsonName',
      exceptionFnMap: _exceptionFns,
    );
    return PostUnionWithJsonNameOutput.fromJson(response);
  }

  Future<void> putWithContentEncoding({
    String? data,
    String? encoding,
  }) async {
    final headers = <String, String>{
      if (encoding != null) 'Content-Encoding': encoding.toString(),
    };
    final $payload = <String, dynamic>{
      if (data != null) 'data': data,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/requestcompression/putcontentwithencoding',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Automatically adds idempotency tokens.
  Future<void> queryIdempotencyTokenAutoFill({
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (token != null) 'token': [token],
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/QueryIdempotencyTokenAutoFill',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> queryParamsAsStringListMap({
    Map<String, List<String>>? foo,
    String? qux,
  }) async {
    final $query = <String, List<String>>{
      if (qux != null) 'corge': [qux],
    };
    final $payload = <String, dynamic>{
      if (foo != null) 'foo': foo,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StringListMap',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> queryPrecedence({
    Map<String, String>? baz,
    String? foo,
  }) async {
    final $query = <String, List<String>>{
      if (foo != null) 'bar': [foo],
    };
    final $payload = <String, dynamic>{
      if (baz != null) 'baz': baz,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Precedence',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Recursive shapes
  Future<RecursiveShapesInputOutput> recursiveShapes({
    RecursiveShapesInputOutputNested1? nested,
  }) async {
    final $payload = <String, dynamic>{
      if (nested != null) 'nested': nested,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/RecursiveShapes',
      exceptionFnMap: _exceptionFns,
    );
    return RecursiveShapesInputOutput.fromJson(response);
  }

  Future<void> responseCodeHttpFallback() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/responseCodeHttpFallback',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<ResponseCodeRequiredOutput> responseCodeRequired() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/responseCodeRequired',
      exceptionFnMap: _exceptionFns,
    );
    return ResponseCodeRequiredOutput.fromJson(response);
  }

  Future<SimpleScalarPropertiesInputOutput> simpleScalarProperties({
    int? byteValue,
    double? doubleValue,
    bool? falseBooleanValue,
    double? floatValue,
    String? foo,
    int? integerValue,
    int? longValue,
    int? shortValue,
    String? stringValue,
    bool? trueBooleanValue,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    final $payload = <String, dynamic>{
      if (byteValue != null) 'byteValue': byteValue,
      if (doubleValue != null) 'DoubleDribble': doubleValue,
      if (falseBooleanValue != null) 'falseBooleanValue': falseBooleanValue,
      if (floatValue != null) 'floatValue': floatValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (longValue != null) 'longValue': longValue,
      if (shortValue != null) 'shortValue': shortValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (trueBooleanValue != null) 'trueBooleanValue': trueBooleanValue,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/SimpleScalarProperties',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SimpleScalarPropertiesInputOutput(
      byteValue: $json['byteValue'] as int?,
      doubleValue: $json['DoubleDribble'] as double?,
      falseBooleanValue: $json['falseBooleanValue'] as bool?,
      floatValue: $json['floatValue'] as double?,
      integerValue: $json['integerValue'] as int?,
      longValue: $json['longValue'] as int?,
      shortValue: $json['shortValue'] as int?,
      stringValue: $json['stringValue'] as String?,
      trueBooleanValue: $json['trueBooleanValue'] as bool?,
      foo: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
    );
  }

  Future<SparseJsonListsInputOutput> sparseJsonLists({
    List<int>? sparseShortList,
    List<String>? sparseStringList,
  }) async {
    final $payload = <String, dynamic>{
      if (sparseShortList != null) 'sparseShortList': sparseShortList,
      if (sparseStringList != null) 'sparseStringList': sparseStringList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/SparseJsonLists',
      exceptionFnMap: _exceptionFns,
    );
    return SparseJsonListsInputOutput.fromJson(response);
  }

  /// This example tests sparse map serialization.
  Future<SparseJsonMapsInputOutput> sparseJsonMaps({
    Map<String, bool>? sparseBooleanMap,
    Map<String, int>? sparseNumberMap,
    Map<String, List<String>>? sparseSetMap,
    Map<String, String>? sparseStringMap,
    Map<String, SharedGreetingStruct>? sparseStructMap,
  }) async {
    final $payload = <String, dynamic>{
      if (sparseBooleanMap != null) 'sparseBooleanMap': sparseBooleanMap,
      if (sparseNumberMap != null) 'sparseNumberMap': sparseNumberMap,
      if (sparseSetMap != null) 'sparseSetMap': sparseSetMap,
      if (sparseStringMap != null) 'sparseStringMap': sparseStringMap,
      if (sparseStructMap != null) 'sparseStructMap': sparseStructMap,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SparseJsonMaps',
      exceptionFnMap: _exceptionFns,
    );
    return SparseJsonMapsInputOutput.fromJson(response);
  }

  /// This examples serializes a streaming blob shape in the request body. In
  /// this example, no JSON document is synthesized because the payload is not a
  /// structure or a union type.
  Future<StreamingTraitsInputOutput> streamingTraits({
    Uint8List? blob,
    String? foo,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: blob,
      method: 'POST',
      requestUri: '/StreamingTraits',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StreamingTraitsInputOutput(
      blob: await response.stream.toBytes(),
      foo: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
    );
  }

  /// This examples serializes a streaming blob shape with a required content
  /// length in the request body. In this example, no JSON document is
  /// synthesized because the payload is not a structure or a union type.
  Future<void> streamingTraitsRequireLength({
    Uint8List? blob,
    String? foo,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    await _protocol.send(
      payload: blob,
      method: 'POST',
      requestUri: '/StreamingTraitsRequireLength',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This examples serializes a streaming media-typed blob shape in the request
  /// body. This examples uses a `@mediaType` trait on the payload to force a
  /// custom content-type to be serialized.
  Future<StreamingTraitsWithMediaTypeInputOutput> streamingTraitsWithMediaType({
    Uint8List? blob,
    String? foo,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: blob,
      method: 'POST',
      requestUri: '/StreamingTraitsWithMediaType',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StreamingTraitsWithMediaTypeInputOutput(
      blob: await response.stream.toBytes(),
      foo: _s.extractHeaderStringValue(response.headers, 'X-Foo'),
    );
  }

  /// This example operation serializes a structure in the HTTP body. It should
  /// ensure Content-Type: application/json is used in all requests and that an
  /// "empty" body is an empty JSON document ({}).
  Future<TestBodyStructureInputOutput> testBodyStructure({
    TestConfig? testConfig,
    String? testId,
  }) async {
    final headers = <String, String>{
      if (testId != null) 'x-amz-test-id': testId.toString(),
    };
    final $payload = <String, dynamic>{
      if (testConfig != null) 'testConfig': testConfig,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/body',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TestBodyStructureInputOutput(
      testConfig: $json['testConfig'] != null
          ? TestConfig.fromJson($json['testConfig'] as Map<String, dynamic>)
          : null,
      testId: _s.extractHeaderStringValue(response.headers, 'x-amz-test-id'),
    );
  }

  /// This example GET operation has no input and serializes a request without a
  /// HTTP body. These tests are to ensure we do not attach a body or related
  /// headers (Content-Length, Content-Type) to operations that semantically
  /// cannot produce an HTTP body.
  Future<TestNoPayloadInputOutput> testGetNoInputNoPayload() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/no_input_no_payload',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TestNoPayloadInputOutput(
      testId: _s.extractHeaderStringValue(response.headers, 'X-Amz-Test-Id'),
    );
  }

  /// This example GET operation serializes a request without a modeled HTTP
  /// body. These tests are to ensure we do not attach a body or related headers
  /// (Content-Length, Content-Type) to operations that semantically cannot
  /// produce an HTTP body.
  Future<TestNoPayloadInputOutput> testGetNoPayload({
    String? testId,
  }) async {
    final headers = <String, String>{
      if (testId != null) 'X-Amz-Test-Id': testId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/no_payload',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TestNoPayloadInputOutput(
      testId: _s.extractHeaderStringValue(response.headers, 'X-Amz-Test-Id'),
    );
  }

  /// This example operation serializes a payload targeting a blob. The Blob
  /// shape is not structured content and we cannot make assumptions about what
  /// data will be sent. This test ensures only a generic "Content-Type:
  /// application/octet-stream" header is used, and that we are not treating an
  /// empty body as an empty JSON document.
  Future<TestPayloadBlobInputOutput> testPayloadBlob({
    String? contentType,
    Uint8List? data,
  }) async {
    final headers = <String, String>{
      if (contentType != null) 'Content-Type': contentType.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: data,
      method: 'POST',
      requestUri: '/blob_payload',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return TestPayloadBlobInputOutput(
      data: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// This example operation serializes a payload targeting a structure. This
  /// enforces the same requirements as TestBodyStructure but with the body
  /// specified by the @httpPayload trait.
  Future<TestPayloadStructureInputOutput> testPayloadStructure({
    PayloadConfig? payloadConfig,
    String? testId,
  }) async {
    final headers = <String, String>{
      if (testId != null) 'x-amz-test-id': testId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: payloadConfig,
      method: 'POST',
      requestUri: '/payload',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TestPayloadStructureInputOutput(
      payloadConfig: PayloadConfig.fromJson($json),
      testId: _s.extractHeaderStringValue(response.headers, 'x-amz-test-id'),
    );
  }

  /// This example POST operation has no input and serializes a request without
  /// a HTTP body. These tests are to ensure we do not attach a body or related
  /// headers (Content-Type) to a POST operation with no modeled input.
  Future<TestNoPayloadInputOutput> testPostNoInputNoPayload() async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/no_input_no_payload',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TestNoPayloadInputOutput(
      testId: _s.extractHeaderStringValue(response.headers, 'X-Amz-Test-Id'),
    );
  }

  /// This example POST operation serializes a request without a modeled HTTP
  /// body. These tests are to ensure we do not attach a body or related headers
  /// (Content-Type) to a POST operation with no modeled payload.
  Future<TestNoPayloadInputOutput> testPostNoPayload({
    String? testId,
  }) async {
    final headers = <String, String>{
      if (testId != null) 'X-Amz-Test-Id': testId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/no_payload',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TestNoPayloadInputOutput(
      testId: _s.extractHeaderStringValue(response.headers, 'X-Amz-Test-Id'),
    );
  }

  /// This example tests how timestamp request and response headers are
  /// serialized.
  Future<TimestampFormatHeadersIO> timestampFormatHeaders({
    DateTime? defaultFormat,
    DateTime? memberDateTime,
    DateTime? memberEpochSeconds,
    DateTime? memberHttpDate,
    DateTime? targetDateTime,
    DateTime? targetEpochSeconds,
    DateTime? targetHttpDate,
  }) async {
    final headers = <String, String>{
      if (defaultFormat != null)
        'X-defaultFormat': _s.rfc822ToJson(defaultFormat),
      if (memberDateTime != null)
        'X-memberDateTime': _s.iso8601ToJson(memberDateTime),
      if (memberEpochSeconds != null)
        'X-memberEpochSeconds':
            _s.unixTimestampToJson(memberEpochSeconds).toString(),
      if (memberHttpDate != null)
        'X-memberHttpDate': _s.rfc822ToJson(memberHttpDate),
      if (targetDateTime != null)
        'X-targetDateTime': _s.iso8601ToJson(targetDateTime),
      if (targetEpochSeconds != null)
        'X-targetEpochSeconds':
            _s.unixTimestampToJson(targetEpochSeconds).toString(),
      if (targetHttpDate != null)
        'X-targetHttpDate': _s.rfc822ToJson(targetHttpDate),
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/TimestampFormatHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return TimestampFormatHeadersIO(
      defaultFormat:
          _s.extractHeaderDateTimeValue(response.headers, 'X-defaultFormat'),
      memberDateTime: _s.extractHeaderDateTimeValue(
          response.headers, 'X-memberDateTime',
          parser: _s.timeStampFromJson),
      memberEpochSeconds: _s.extractHeaderDateTimeValue(
          response.headers, 'X-memberEpochSeconds',
          parser: _s.timeStampFromJson),
      memberHttpDate: _s.extractHeaderDateTimeValue(
          response.headers, 'X-memberHttpDate',
          parser: _s.timeStampFromJson),
      targetDateTime: _s.extractHeaderDateTimeValue(
          response.headers, 'X-targetDateTime',
          parser: _s.timeStampFromJson),
      targetEpochSeconds: _s.extractHeaderDateTimeValue(
          response.headers, 'X-targetEpochSeconds',
          parser: _s.timeStampFromJson),
      targetHttpDate: _s.extractHeaderDateTimeValue(
          response.headers, 'X-targetHttpDate',
          parser: _s.timeStampFromJson),
    );
  }

  /// This test is similar to NoInputAndNoOutput, but uses explicit Unit types.
  Future<void> unitInputAndOutput() async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/UnitInputAndOutput',
      exceptionFnMap: _exceptionFns,
    );
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

class DocumentTypeInputOutput {
  final Object? documentValue;
  final String? stringValue;

  DocumentTypeInputOutput({
    this.documentValue,
    this.stringValue,
  });

  factory DocumentTypeInputOutput.fromJson(Map<String, dynamic> json) {
    return DocumentTypeInputOutput(
      documentValue: json['documentValue'],
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentValue = this.documentValue;
    final stringValue = this.stringValue;
    return {
      if (documentValue != null) 'documentValue': documentValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class DocumentTypeAsMapValueInputOutput {
  final Map<String, Object>? docValuedMap;

  DocumentTypeAsMapValueInputOutput({
    this.docValuedMap,
  });

  factory DocumentTypeAsMapValueInputOutput.fromJson(
      Map<String, dynamic> json) {
    return DocumentTypeAsMapValueInputOutput(
      docValuedMap: (json['docValuedMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as Object)),
    );
  }

  Map<String, dynamic> toJson() {
    final docValuedMap = this.docValuedMap;
    return {
      if (docValuedMap != null) 'docValuedMap': docValuedMap,
    };
  }
}

class DocumentTypeAsPayloadInputOutput {
  final Object? documentValue;

  DocumentTypeAsPayloadInputOutput({
    this.documentValue,
  });

  Map<String, dynamic> toJson() {
    final documentValue = this.documentValue;
    return {
      if (documentValue != null) 'documentValue': documentValue,
    };
  }
}

class DuplexStreamOutput {
  final EventStream? stream;

  DuplexStreamOutput({
    this.stream,
  });

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

class DuplexStreamWithDistinctStreamsOutput {
  final SingletonEventStream? stream;

  DuplexStreamWithDistinctStreamsOutput({
    this.stream,
  });

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

class DuplexStreamWithInitialMessagesOutput {
  final String initialResponseMember;
  final EventStream? stream;

  DuplexStreamWithInitialMessagesOutput({
    required this.initialResponseMember,
    this.stream,
  });

  Map<String, dynamic> toJson() {
    final initialResponseMember = this.initialResponseMember;
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
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

class GreetingWithErrorsOutput {
  final String? greeting;

  GreetingWithErrorsOutput({
    this.greeting,
  });

  Map<String, dynamic> toJson() {
    final greeting = this.greeting;
    return {};
  }
}

class HttpChecksumRequiredInputOutput {
  final String? foo;

  HttpChecksumRequiredInputOutput({
    this.foo,
  });

  factory HttpChecksumRequiredInputOutput.fromJson(Map<String, dynamic> json) {
    return HttpChecksumRequiredInputOutput(
      foo: json['foo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'foo': foo,
    };
  }
}

class HttpEmptyPrefixHeadersOutput {
  final Map<String, String>? prefixHeaders;
  final String? specificHeader;

  HttpEmptyPrefixHeadersOutput({
    this.prefixHeaders,
    this.specificHeader,
  });

  Map<String, dynamic> toJson() {
    final prefixHeaders = this.prefixHeaders;
    final specificHeader = this.specificHeader;
    return {};
  }
}

class EnumPayloadInput {
  final StringEnum? payload;

  EnumPayloadInput({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload.value,
    };
  }
}

class HttpPayloadTraitsInputOutput {
  final Uint8List? blob;
  final String? foo;

  HttpPayloadTraitsInputOutput({
    this.blob,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final foo = this.foo;
    return {
      if (blob != null) 'blob': base64Encode(blob),
    };
  }
}

class HttpPayloadTraitsWithMediaTypeInputOutput {
  final Uint8List? blob;
  final String? foo;

  HttpPayloadTraitsWithMediaTypeInputOutput({
    this.blob,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final foo = this.foo;
    return {
      if (blob != null) 'blob': base64Encode(blob),
    };
  }
}

class HttpPayloadWithStructureInputOutput {
  final NestedPayload? nested;

  HttpPayloadWithStructureInputOutput({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class HttpPayloadWithUnionInputOutput {
  final UnionPayload? nested;

  HttpPayloadWithUnionInputOutput({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class HttpPrefixHeadersOutput {
  final String? foo;
  final Map<String, String>? fooMap;

  HttpPrefixHeadersOutput({
    this.foo,
    this.fooMap,
  });

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    final fooMap = this.fooMap;
    return {};
  }
}

class HttpPrefixHeadersInResponseOutput {
  final Map<String, String>? prefixHeaders;

  HttpPrefixHeadersInResponseOutput({
    this.prefixHeaders,
  });

  Map<String, dynamic> toJson() {
    final prefixHeaders = this.prefixHeaders;
    return {};
  }
}

class HttpResponseCodeOutput {
  final int? status;

  HttpResponseCodeOutput({
    this.status,
  });

  factory HttpResponseCodeOutput.fromJson(Map<String, dynamic> json) {
    return HttpResponseCodeOutput(
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {};
  }
}

class StringPayloadInput {
  final String? payload;

  StringPayloadInput({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class IgnoreQueryParamsInResponseOutput {
  final String? baz;

  IgnoreQueryParamsInResponseOutput({
    this.baz,
  });

  factory IgnoreQueryParamsInResponseOutput.fromJson(
      Map<String, dynamic> json) {
    return IgnoreQueryParamsInResponseOutput(
      baz: json['baz'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baz = this.baz;
    return {};
  }
}

class InputAndOutputWithHeadersIO {
  final List<bool>? headerBooleanList;
  final int? headerByte;
  final double? headerDouble;
  final FooEnum? headerEnum;
  final List<FooEnum>? headerEnumList;
  final bool? headerFalseBool;
  final double? headerFloat;
  final int? headerInteger;
  final int? headerIntegerEnum;
  final List<int>? headerIntegerEnumList;
  final List<int>? headerIntegerList;
  final int? headerLong;
  final int? headerShort;
  final String? headerString;
  final List<String>? headerStringList;
  final List<String>? headerStringSet;
  final List<DateTime>? headerTimestampList;
  final bool? headerTrueBool;

  InputAndOutputWithHeadersIO({
    this.headerBooleanList,
    this.headerByte,
    this.headerDouble,
    this.headerEnum,
    this.headerEnumList,
    this.headerFalseBool,
    this.headerFloat,
    this.headerInteger,
    this.headerIntegerEnum,
    this.headerIntegerEnumList,
    this.headerIntegerList,
    this.headerLong,
    this.headerShort,
    this.headerString,
    this.headerStringList,
    this.headerStringSet,
    this.headerTimestampList,
    this.headerTrueBool,
  });

  Map<String, dynamic> toJson() {
    final headerBooleanList = this.headerBooleanList;
    final headerByte = this.headerByte;
    final headerDouble = this.headerDouble;
    final headerEnum = this.headerEnum;
    final headerEnumList = this.headerEnumList;
    final headerFalseBool = this.headerFalseBool;
    final headerFloat = this.headerFloat;
    final headerInteger = this.headerInteger;
    final headerIntegerEnum = this.headerIntegerEnum;
    final headerIntegerEnumList = this.headerIntegerEnumList;
    final headerIntegerList = this.headerIntegerList;
    final headerLong = this.headerLong;
    final headerShort = this.headerShort;
    final headerString = this.headerString;
    final headerStringList = this.headerStringList;
    final headerStringSet = this.headerStringSet;
    final headerTimestampList = this.headerTimestampList;
    final headerTrueBool = this.headerTrueBool;
    return {};
  }
}

class JsonBlobsInputOutput {
  final Uint8List? data;

  JsonBlobsInputOutput({
    this.data,
  });

  factory JsonBlobsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonBlobsInputOutput(
      data: _s.decodeNullableUint8List(json['data'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': base64Encode(data),
    };
  }
}

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

class JsonIntEnumsInputOutput {
  final int? integerEnum1;
  final int? integerEnum2;
  final int? integerEnum3;
  final List<int>? integerEnumList;
  final Map<String, int>? integerEnumMap;
  final List<int>? integerEnumSet;

  JsonIntEnumsInputOutput({
    this.integerEnum1,
    this.integerEnum2,
    this.integerEnum3,
    this.integerEnumList,
    this.integerEnumMap,
    this.integerEnumSet,
  });

  factory JsonIntEnumsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonIntEnumsInputOutput(
      integerEnum1: json['integerEnum1'] as int?,
      integerEnum2: json['integerEnum2'] as int?,
      integerEnum3: json['integerEnum3'] as int?,
      integerEnumList: (json['integerEnumList'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      integerEnumMap: (json['integerEnumMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      integerEnumSet: (json['integerEnumSet'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final integerEnum1 = this.integerEnum1;
    final integerEnum2 = this.integerEnum2;
    final integerEnum3 = this.integerEnum3;
    final integerEnumList = this.integerEnumList;
    final integerEnumMap = this.integerEnumMap;
    final integerEnumSet = this.integerEnumSet;
    return {
      if (integerEnum1 != null) 'integerEnum1': integerEnum1,
      if (integerEnum2 != null) 'integerEnum2': integerEnum2,
      if (integerEnum3 != null) 'integerEnum3': integerEnum3,
      if (integerEnumList != null) 'integerEnumList': integerEnumList,
      if (integerEnumMap != null) 'integerEnumMap': integerEnumMap,
      if (integerEnumSet != null) 'integerEnumSet': integerEnumSet,
    };
  }
}

class JsonListsInputOutput {
  final List<bool>? booleanList;
  final List<FooEnum>? enumList;
  final List<int>? intEnumList;
  final List<int>? integerList;
  final List<List<String>>? nestedStringList;
  final List<String>? stringList;
  final List<String>? stringSet;
  final List<StructureListMember>? structureList;
  final List<DateTime>? timestampList;

  JsonListsInputOutput({
    this.booleanList,
    this.enumList,
    this.intEnumList,
    this.integerList,
    this.nestedStringList,
    this.stringList,
    this.stringSet,
    this.structureList,
    this.timestampList,
  });

  factory JsonListsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonListsInputOutput(
      booleanList: (json['booleanList'] as List?)
          ?.nonNulls
          .map((e) => e as bool)
          .toList(),
      enumList: (json['enumList'] as List?)
          ?.nonNulls
          .map((e) => FooEnum.fromString((e as String)))
          .toList(),
      intEnumList: (json['intEnumList'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      integerList: (json['integerList'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      nestedStringList: (json['nestedStringList'] as List?)
          ?.nonNulls
          .map((e) => (e as List).nonNulls.map((e) => e as String).toList())
          .toList(),
      stringList: (json['stringList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stringSet: (json['stringSet'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      structureList: (json['myStructureList'] as List?)
          ?.nonNulls
          .map((e) => StructureListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestampList: (json['timestampList'] as List?)
          ?.nonNulls
          .map(nonNullableTimeStampFromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final booleanList = this.booleanList;
    final enumList = this.enumList;
    final intEnumList = this.intEnumList;
    final integerList = this.integerList;
    final nestedStringList = this.nestedStringList;
    final stringList = this.stringList;
    final stringSet = this.stringSet;
    final structureList = this.structureList;
    final timestampList = this.timestampList;
    return {
      if (booleanList != null) 'booleanList': booleanList,
      if (enumList != null) 'enumList': enumList.map((e) => e.value).toList(),
      if (intEnumList != null) 'intEnumList': intEnumList,
      if (integerList != null) 'integerList': integerList,
      if (nestedStringList != null) 'nestedStringList': nestedStringList,
      if (stringList != null) 'stringList': stringList,
      if (stringSet != null) 'stringSet': stringSet,
      if (structureList != null) 'myStructureList': structureList,
      if (timestampList != null)
        'timestampList': timestampList.map(unixTimestampToJson).toList(),
    };
  }
}

class JsonMapsInputOutput {
  final Map<String, bool>? denseBooleanMap;
  final Map<String, int>? denseNumberMap;
  final Map<String, List<String>>? denseSetMap;
  final Map<String, String>? denseStringMap;
  final Map<String, SharedGreetingStruct>? denseStructMap;

  JsonMapsInputOutput({
    this.denseBooleanMap,
    this.denseNumberMap,
    this.denseSetMap,
    this.denseStringMap,
    this.denseStructMap,
  });

  factory JsonMapsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonMapsInputOutput(
      denseBooleanMap: (json['denseBooleanMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as bool)),
      denseNumberMap: (json['denseNumberMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      denseSetMap: (json['denseSetMap'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, (e as List).nonNulls.map((e) => e as String).toList())),
      denseStringMap: (json['denseStringMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      denseStructMap: (json['denseStructMap'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, SharedGreetingStruct.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final denseBooleanMap = this.denseBooleanMap;
    final denseNumberMap = this.denseNumberMap;
    final denseSetMap = this.denseSetMap;
    final denseStringMap = this.denseStringMap;
    final denseStructMap = this.denseStructMap;
    return {
      if (denseBooleanMap != null) 'denseBooleanMap': denseBooleanMap,
      if (denseNumberMap != null) 'denseNumberMap': denseNumberMap,
      if (denseSetMap != null) 'denseSetMap': denseSetMap,
      if (denseStringMap != null) 'denseStringMap': denseStringMap,
      if (denseStructMap != null) 'denseStructMap': denseStructMap,
    };
  }
}

class JsonTimestampsInputOutput {
  final DateTime? dateTime;
  final DateTime? dateTimeOnTarget;
  final DateTime? epochSeconds;
  final DateTime? epochSecondsOnTarget;
  final DateTime? httpDate;
  final DateTime? httpDateOnTarget;
  final DateTime? normal;

  JsonTimestampsInputOutput({
    this.dateTime,
    this.dateTimeOnTarget,
    this.epochSeconds,
    this.epochSecondsOnTarget,
    this.httpDate,
    this.httpDateOnTarget,
    this.normal,
  });

  factory JsonTimestampsInputOutput.fromJson(Map<String, dynamic> json) {
    return JsonTimestampsInputOutput(
      dateTime: timeStampFromJson(json['dateTime']),
      dateTimeOnTarget: timeStampFromJson(json['dateTimeOnTarget']),
      epochSeconds: timeStampFromJson(json['epochSeconds']),
      epochSecondsOnTarget: timeStampFromJson(json['epochSecondsOnTarget']),
      httpDate: timeStampFromJson(json['httpDate']),
      httpDateOnTarget: timeStampFromJson(json['httpDateOnTarget']),
      normal: timeStampFromJson(json['normal']),
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
      if (normal != null) 'normal': unixTimestampToJson(normal),
    };
  }
}

/// A shared structure that contains a single union member.
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

class SharedGreetingStruct {
  final String? hi;

  SharedGreetingStruct({
    this.hi,
  });

  factory SharedGreetingStruct.fromJson(Map<String, dynamic> json) {
    return SharedGreetingStruct(
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

class MalformedAcceptWithGenericStringOutput {
  final String? payload;

  MalformedAcceptWithGenericStringOutput({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class MalformedAcceptWithPayloadOutput {
  final Uint8List? payload;

  MalformedAcceptWithPayloadOutput({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class MediaTypeHeaderOutput {
  final Object? json;

  MediaTypeHeaderOutput({
    this.json,
  });

  Map<String, dynamic> toJson() {
    final json = this.json;
    return {};
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

class NullAndEmptyHeadersIO {
  final String? a;
  final String? b;
  final List<String>? c;

  NullAndEmptyHeadersIO({
    this.a,
    this.b,
    this.c,
  });

  Map<String, dynamic> toJson() {
    final a = this.a;
    final b = this.b;
    final c = this.c;
    return {};
  }
}

class OperationWithDefaultsOutput {
  final Uint8List? defaultBlob;
  final bool? defaultBoolean;
  final int? defaultByte;
  final Object? defaultDocumentBoolean;
  final Object? defaultDocumentList;
  final Object? defaultDocumentMap;
  final Object? defaultDocumentString;
  final double? defaultDouble;
  final TestEnum? defaultEnum;
  final double? defaultFloat;
  final int? defaultIntEnum;
  final int? defaultInteger;
  final List<String>? defaultList;
  final int? defaultLong;
  final Map<String, String>? defaultMap;
  final Object? defaultNullDocument;
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
      defaultDocumentBoolean: json['defaultDocumentBoolean'],
      defaultDocumentList: json['defaultDocumentList'],
      defaultDocumentMap: json['defaultDocumentMap'],
      defaultDocumentString: json['defaultDocumentString'],
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
      defaultNullDocument: json['defaultNullDocument'],
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

class OutputStreamOutput {
  final EventStream? stream;

  OutputStreamOutput({
    this.stream,
  });

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

class OutputStreamWithInitialResponseOutput {
  final String initialResponseMember;
  final EventStream? stream;

  OutputStreamWithInitialResponseOutput({
    required this.initialResponseMember,
    this.stream,
  });

  Map<String, dynamic> toJson() {
    final initialResponseMember = this.initialResponseMember;
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

class PostPlayerActionOutput {
  final PlayerAction action;

  PostPlayerActionOutput({
    required this.action,
  });

  factory PostPlayerActionOutput.fromJson(Map<String, dynamic> json) {
    return PostPlayerActionOutput(
      action: PlayerAction.fromJson(json['action'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    return {
      'action': action,
    };
  }
}

class PostUnionWithJsonNameOutput {
  final UnionWithJsonName value;

  PostUnionWithJsonNameOutput({
    required this.value,
  });

  factory PostUnionWithJsonNameOutput.fromJson(Map<String, dynamic> json) {
    return PostUnionWithJsonNameOutput(
      value: UnionWithJsonName.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

class RecursiveShapesInputOutput {
  final RecursiveShapesInputOutputNested1? nested;

  RecursiveShapesInputOutput({
    this.nested,
  });

  factory RecursiveShapesInputOutput.fromJson(Map<String, dynamic> json) {
    return RecursiveShapesInputOutput(
      nested: json['nested'] != null
          ? RecursiveShapesInputOutputNested1.fromJson(
              json['nested'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class ResponseCodeHttpFallbackInputOutput {
  ResponseCodeHttpFallbackInputOutput();

  factory ResponseCodeHttpFallbackInputOutput.fromJson(Map<String, dynamic> _) {
    return ResponseCodeHttpFallbackInputOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ResponseCodeRequiredOutput {
  final int responseCode;

  ResponseCodeRequiredOutput({
    required this.responseCode,
  });

  factory ResponseCodeRequiredOutput.fromJson(Map<String, dynamic> json) {
    return ResponseCodeRequiredOutput(
      responseCode: json['responseCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final responseCode = this.responseCode;
    return {};
  }
}

class SimpleScalarPropertiesInputOutput {
  final int? byteValue;
  final double? doubleValue;
  final bool? falseBooleanValue;
  final double? floatValue;
  final String? foo;
  final int? integerValue;
  final int? longValue;
  final int? shortValue;
  final String? stringValue;
  final bool? trueBooleanValue;

  SimpleScalarPropertiesInputOutput({
    this.byteValue,
    this.doubleValue,
    this.falseBooleanValue,
    this.floatValue,
    this.foo,
    this.integerValue,
    this.longValue,
    this.shortValue,
    this.stringValue,
    this.trueBooleanValue,
  });

  Map<String, dynamic> toJson() {
    final byteValue = this.byteValue;
    final doubleValue = this.doubleValue;
    final falseBooleanValue = this.falseBooleanValue;
    final floatValue = this.floatValue;
    final foo = this.foo;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final shortValue = this.shortValue;
    final stringValue = this.stringValue;
    final trueBooleanValue = this.trueBooleanValue;
    return {
      if (byteValue != null) 'byteValue': byteValue,
      if (doubleValue != null) 'DoubleDribble': doubleValue,
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

class SparseJsonListsInputOutput {
  final List<int>? sparseShortList;
  final List<String>? sparseStringList;

  SparseJsonListsInputOutput({
    this.sparseShortList,
    this.sparseStringList,
  });

  factory SparseJsonListsInputOutput.fromJson(Map<String, dynamic> json) {
    return SparseJsonListsInputOutput(
      sparseShortList: (json['sparseShortList'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      sparseStringList: (json['sparseStringList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final sparseShortList = this.sparseShortList;
    final sparseStringList = this.sparseStringList;
    return {
      if (sparseShortList != null) 'sparseShortList': sparseShortList,
      if (sparseStringList != null) 'sparseStringList': sparseStringList,
    };
  }
}

class SparseJsonMapsInputOutput {
  final Map<String, bool>? sparseBooleanMap;
  final Map<String, int>? sparseNumberMap;
  final Map<String, List<String>>? sparseSetMap;
  final Map<String, String>? sparseStringMap;
  final Map<String, SharedGreetingStruct>? sparseStructMap;

  SparseJsonMapsInputOutput({
    this.sparseBooleanMap,
    this.sparseNumberMap,
    this.sparseSetMap,
    this.sparseStringMap,
    this.sparseStructMap,
  });

  factory SparseJsonMapsInputOutput.fromJson(Map<String, dynamic> json) {
    return SparseJsonMapsInputOutput(
      sparseBooleanMap: (json['sparseBooleanMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as bool)),
      sparseNumberMap: (json['sparseNumberMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
      sparseSetMap: (json['sparseSetMap'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, (e as List).nonNulls.map((e) => e as String).toList())),
      sparseStringMap: (json['sparseStringMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sparseStructMap: (json['sparseStructMap'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, SharedGreetingStruct.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final sparseBooleanMap = this.sparseBooleanMap;
    final sparseNumberMap = this.sparseNumberMap;
    final sparseSetMap = this.sparseSetMap;
    final sparseStringMap = this.sparseStringMap;
    final sparseStructMap = this.sparseStructMap;
    return {
      if (sparseBooleanMap != null) 'sparseBooleanMap': sparseBooleanMap,
      if (sparseNumberMap != null) 'sparseNumberMap': sparseNumberMap,
      if (sparseSetMap != null) 'sparseSetMap': sparseSetMap,
      if (sparseStringMap != null) 'sparseStringMap': sparseStringMap,
      if (sparseStructMap != null) 'sparseStructMap': sparseStructMap,
    };
  }
}

class StreamingTraitsInputOutput {
  final Uint8List? blob;
  final String? foo;

  StreamingTraitsInputOutput({
    this.blob,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final foo = this.foo;
    return {
      if (blob != null) 'blob': base64Encode(blob),
    };
  }
}

class StreamingTraitsWithMediaTypeInputOutput {
  final Uint8List? blob;
  final String? foo;

  StreamingTraitsWithMediaTypeInputOutput({
    this.blob,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final blob = this.blob;
    final foo = this.foo;
    return {
      if (blob != null) 'blob': base64Encode(blob),
    };
  }
}

class TestBodyStructureInputOutput {
  final TestConfig? testConfig;
  final String? testId;

  TestBodyStructureInputOutput({
    this.testConfig,
    this.testId,
  });

  Map<String, dynamic> toJson() {
    final testConfig = this.testConfig;
    final testId = this.testId;
    return {
      if (testConfig != null) 'testConfig': testConfig,
    };
  }
}

class TestNoPayloadInputOutput {
  final String? testId;

  TestNoPayloadInputOutput({
    this.testId,
  });

  Map<String, dynamic> toJson() {
    final testId = this.testId;
    return {};
  }
}

class TestPayloadBlobInputOutput {
  final String? contentType;
  final Uint8List? data;

  TestPayloadBlobInputOutput({
    this.contentType,
    this.data,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final data = this.data;
    return {
      if (data != null) 'data': base64Encode(data),
    };
  }
}

class TestPayloadStructureInputOutput {
  final PayloadConfig? payloadConfig;
  final String? testId;

  TestPayloadStructureInputOutput({
    this.payloadConfig,
    this.testId,
  });

  Map<String, dynamic> toJson() {
    final payloadConfig = this.payloadConfig;
    final testId = this.testId;
    return {
      if (payloadConfig != null) 'payloadConfig': payloadConfig,
    };
  }
}

class TimestampFormatHeadersIO {
  final DateTime? defaultFormat;
  final DateTime? memberDateTime;
  final DateTime? memberEpochSeconds;
  final DateTime? memberHttpDate;
  final DateTime? targetDateTime;
  final DateTime? targetEpochSeconds;
  final DateTime? targetHttpDate;

  TimestampFormatHeadersIO({
    this.defaultFormat,
    this.memberDateTime,
    this.memberEpochSeconds,
    this.memberHttpDate,
    this.targetDateTime,
    this.targetEpochSeconds,
    this.targetHttpDate,
  });

  Map<String, dynamic> toJson() {
    final defaultFormat = this.defaultFormat;
    final memberDateTime = this.memberDateTime;
    final memberEpochSeconds = this.memberEpochSeconds;
    final memberHttpDate = this.memberHttpDate;
    final targetDateTime = this.targetDateTime;
    final targetEpochSeconds = this.targetEpochSeconds;
    final targetHttpDate = this.targetHttpDate;
    return {};
  }
}

class PayloadConfig {
  final int? data;

  PayloadConfig({
    this.data,
  });

  factory PayloadConfig.fromJson(Map<String, dynamic> json) {
    return PayloadConfig(
      data: json['data'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': data,
    };
  }
}

class TestConfig {
  final int? timeout;

  TestConfig({
    this.timeout,
  });

  factory TestConfig.fromJson(Map<String, dynamic> json) {
    return TestConfig(
      timeout: json['timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeout = this.timeout;
    return {
      if (timeout != null) 'timeout': timeout,
    };
  }
}

class RecursiveShapesInputOutputNested1 {
  final String? foo;
  final RecursiveShapesInputOutputNested2? nested;

  RecursiveShapesInputOutputNested1({
    this.foo,
    this.nested,
  });

  factory RecursiveShapesInputOutputNested1.fromJson(
      Map<String, dynamic> json) {
    return RecursiveShapesInputOutputNested1(
      foo: json['foo'] as String?,
      nested: json['nested'] != null
          ? RecursiveShapesInputOutputNested2.fromJson(
              json['nested'] as Map<String, dynamic>)
          : null,
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

class RecursiveShapesInputOutputNested2 {
  final String? bar;
  final RecursiveShapesInputOutputNested1? recursiveMember;

  RecursiveShapesInputOutputNested2({
    this.bar,
    this.recursiveMember,
  });

  factory RecursiveShapesInputOutputNested2.fromJson(
      Map<String, dynamic> json) {
    return RecursiveShapesInputOutputNested2(
      bar: json['bar'] as String?,
      recursiveMember: json['recursiveMember'] != null
          ? RecursiveShapesInputOutputNested1.fromJson(
              json['recursiveMember'] as Map<String, dynamic>)
          : null,
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

class UnionWithJsonName {
  final String? bar;
  final String? baz;
  final String? foo;

  UnionWithJsonName({
    this.bar,
    this.baz,
    this.foo,
  });

  factory UnionWithJsonName.fromJson(Map<String, dynamic> json) {
    return UnionWithJsonName(
      bar: json['bar'] as String?,
      baz: json['_baz'] as String?,
      foo: json['FOO'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bar = this.bar;
    final baz = this.baz;
    final foo = this.foo;
    return {
      if (bar != null) 'bar': bar,
      if (baz != null) '_baz': baz,
      if (foo != null) 'FOO': foo,
    };
  }
}

class PlayerAction {
  /// Quit the game.
  final Unit? quit;

  PlayerAction({
    this.quit,
  });

  factory PlayerAction.fromJson(Map<String, dynamic> json) {
    return PlayerAction(
      quit: json['quit'] != null
          ? Unit.fromJson(json['quit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quit = this.quit;
    return {
      if (quit != null) 'quit': quit,
    };
  }
}

class EventStream {
  final BlobPayloadEvent? blobPayload;
  final ErrorEvent? error;
  final HeadersEvent? headers;
  final HeadersAndExplicitPayloadEvent? headersAndExplicitPayload;
  final HeadersAndImplicitPayloadEvent? headersAndImplicitPayload;
  final StringPayloadEvent? stringPayload;
  final StructurePayloadEvent? structurePayload;
  final UnionPayloadEvent? unionPayload;

  EventStream({
    this.blobPayload,
    this.error,
    this.headers,
    this.headersAndExplicitPayload,
    this.headersAndImplicitPayload,
    this.stringPayload,
    this.structurePayload,
    this.unionPayload,
  });

  factory EventStream.fromJson(Map<String, dynamic> json) {
    return EventStream(
      blobPayload: json['blobPayload'] != null
          ? BlobPayloadEvent.fromJson(
              json['blobPayload'] as Map<String, dynamic>)
          : null,
      error: json['error'] != null
          ? ErrorEvent.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      headers: json['headers'] != null
          ? HeadersEvent.fromJson(json['headers'] as Map<String, dynamic>)
          : null,
      headersAndExplicitPayload: json['headersAndExplicitPayload'] != null
          ? HeadersAndExplicitPayloadEvent.fromJson(
              json['headersAndExplicitPayload'] as Map<String, dynamic>)
          : null,
      headersAndImplicitPayload: json['headersAndImplicitPayload'] != null
          ? HeadersAndImplicitPayloadEvent.fromJson(
              json['headersAndImplicitPayload'] as Map<String, dynamic>)
          : null,
      stringPayload: json['stringPayload'] != null
          ? StringPayloadEvent.fromJson(
              json['stringPayload'] as Map<String, dynamic>)
          : null,
      structurePayload: json['structurePayload'] != null
          ? StructurePayloadEvent.fromJson(
              json['structurePayload'] as Map<String, dynamic>)
          : null,
      unionPayload: json['unionPayload'] != null
          ? UnionPayloadEvent.fromJson(
              json['unionPayload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blobPayload = this.blobPayload;
    final error = this.error;
    final headers = this.headers;
    final headersAndExplicitPayload = this.headersAndExplicitPayload;
    final headersAndImplicitPayload = this.headersAndImplicitPayload;
    final stringPayload = this.stringPayload;
    final structurePayload = this.structurePayload;
    final unionPayload = this.unionPayload;
    return {
      if (blobPayload != null) 'blobPayload': blobPayload,
      if (error != null) 'error': error,
      if (headers != null) 'headers': headers,
      if (headersAndExplicitPayload != null)
        'headersAndExplicitPayload': headersAndExplicitPayload,
      if (headersAndImplicitPayload != null)
        'headersAndImplicitPayload': headersAndImplicitPayload,
      if (stringPayload != null) 'stringPayload': stringPayload,
      if (structurePayload != null) 'structurePayload': structurePayload,
      if (unionPayload != null) 'unionPayload': unionPayload,
    };
  }
}

class HeadersEvent {
  final Uint8List? blobHeader;
  final bool? booleanHeader;
  final int? byteHeader;
  final int? intHeader;
  final int? longHeader;
  final int? shortHeader;
  final String? stringHeader;
  final DateTime? timestampHeader;

  HeadersEvent({
    this.blobHeader,
    this.booleanHeader,
    this.byteHeader,
    this.intHeader,
    this.longHeader,
    this.shortHeader,
    this.stringHeader,
    this.timestampHeader,
  });

  factory HeadersEvent.fromJson(Map<String, dynamic> json) {
    return HeadersEvent(
      blobHeader: _s.decodeNullableUint8List(json['blobHeader'] as String?),
      booleanHeader: json['booleanHeader'] as bool?,
      byteHeader: json['byteHeader'] as int?,
      intHeader: json['intHeader'] as int?,
      longHeader: json['longHeader'] as int?,
      shortHeader: json['shortHeader'] as int?,
      stringHeader: json['stringHeader'] as String?,
      timestampHeader: timeStampFromJson(json['timestampHeader']),
    );
  }

  Map<String, dynamic> toJson() {
    final blobHeader = this.blobHeader;
    final booleanHeader = this.booleanHeader;
    final byteHeader = this.byteHeader;
    final intHeader = this.intHeader;
    final longHeader = this.longHeader;
    final shortHeader = this.shortHeader;
    final stringHeader = this.stringHeader;
    final timestampHeader = this.timestampHeader;
    return {
      if (blobHeader != null) 'blobHeader': base64Encode(blobHeader),
      if (booleanHeader != null) 'booleanHeader': booleanHeader,
      if (byteHeader != null) 'byteHeader': byteHeader,
      if (intHeader != null) 'intHeader': intHeader,
      if (longHeader != null) 'longHeader': longHeader,
      if (shortHeader != null) 'shortHeader': shortHeader,
      if (stringHeader != null) 'stringHeader': stringHeader,
      if (timestampHeader != null)
        'timestampHeader': iso8601ToJson(timestampHeader),
    };
  }
}

class BlobPayloadEvent {
  final Uint8List? payload;

  BlobPayloadEvent({
    this.payload,
  });

  factory BlobPayloadEvent.fromJson(Map<String, dynamic> json) {
    return BlobPayloadEvent(
      payload: _s.decodeNullableUint8List(json['payload'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': base64Encode(payload),
    };
  }
}

class StringPayloadEvent {
  final String? payload;

  StringPayloadEvent({
    this.payload,
  });

  factory StringPayloadEvent.fromJson(Map<String, dynamic> json) {
    return StringPayloadEvent(
      payload: json['payload'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class StructurePayloadEvent {
  final PayloadStructure? payload;

  StructurePayloadEvent({
    this.payload,
  });

  factory StructurePayloadEvent.fromJson(Map<String, dynamic> json) {
    return StructurePayloadEvent(
      payload: json['payload'] != null
          ? PayloadStructure.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class UnionPayloadEvent {
  final PayloadUnion? payload;

  UnionPayloadEvent({
    this.payload,
  });

  factory UnionPayloadEvent.fromJson(Map<String, dynamic> json) {
    return UnionPayloadEvent(
      payload: json['payload'] != null
          ? PayloadUnion.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class HeadersAndExplicitPayloadEvent {
  final String? header;
  final PayloadStructure? payload;

  HeadersAndExplicitPayloadEvent({
    this.header,
    this.payload,
  });

  factory HeadersAndExplicitPayloadEvent.fromJson(Map<String, dynamic> json) {
    return HeadersAndExplicitPayloadEvent(
      header: json['header'] as String?,
      payload: json['payload'] != null
          ? PayloadStructure.fromJson(json['payload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final header = this.header;
    final payload = this.payload;
    return {
      if (header != null) 'header': header,
      if (payload != null) 'payload': payload,
    };
  }
}

class HeadersAndImplicitPayloadEvent {
  final String? header;
  final String? payload;

  HeadersAndImplicitPayloadEvent({
    this.header,
    this.payload,
  });

  factory HeadersAndImplicitPayloadEvent.fromJson(Map<String, dynamic> json) {
    return HeadersAndImplicitPayloadEvent(
      header: json['header'] as String?,
      payload: json['payload'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final header = this.header;
    final payload = this.payload;
    return {
      if (header != null) 'header': header,
      if (payload != null) 'payload': payload,
    };
  }
}

class ErrorEvent implements _s.AwsException {
  final String? message;

  ErrorEvent({
    this.message,
  });

  factory ErrorEvent.fromJson(Map<String, dynamic> json) {
    return ErrorEvent(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class PayloadStructure {
  final String? structureMember;

  PayloadStructure({
    this.structureMember,
  });

  factory PayloadStructure.fromJson(Map<String, dynamic> json) {
    return PayloadStructure(
      structureMember: json['structureMember'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final structureMember = this.structureMember;
    return {
      if (structureMember != null) 'structureMember': structureMember,
    };
  }
}

class PayloadUnion {
  final String? unionMember;

  PayloadUnion({
    this.unionMember,
  });

  factory PayloadUnion.fromJson(Map<String, dynamic> json) {
    return PayloadUnion(
      unionMember: json['unionMember'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final unionMember = this.unionMember;
    return {
      if (unionMember != null) 'unionMember': unionMember,
    };
  }
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
  final Object? defaultDocumentBoolean;
  final Object? defaultDocumentList;
  final Object? defaultDocumentMap;
  final Object? defaultDocumentString;
  final double? defaultDouble;
  final TestEnum? defaultEnum;
  final double? defaultFloat;
  final int? defaultIntEnum;
  final int? defaultInteger;
  final List<String>? defaultList;
  final int? defaultLong;
  final Map<String, String>? defaultMap;
  final Object? defaultNullDocument;
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

class SimpleUnion {
  final int? intValue;
  final String? string;

  SimpleUnion({
    this.intValue,
    this.string,
  });

  Map<String, dynamic> toJson() {
    final intValue = this.intValue;
    final string = this.string;
    return {
      if (intValue != null) 'int': intValue,
      if (string != null) 'string': string,
    };
  }
}

/// A union with a representative set of types for members.
class MyUnion {
  final Uint8List? blobValue;
  final bool? booleanValue;
  final FooEnum? enumValue;
  final List<String>? listValue;
  final Map<String, String>? mapValue;
  final int? numberValue;
  final NestedGreetingStruct? renamedStructureValue;
  final String? stringValue;
  final SharedGreetingStruct? structureValue;
  final DateTime? timestampValue;

  MyUnion({
    this.blobValue,
    this.booleanValue,
    this.enumValue,
    this.listValue,
    this.mapValue,
    this.numberValue,
    this.renamedStructureValue,
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
      renamedStructureValue: json['renamedStructureValue'] != null
          ? NestedGreetingStruct.fromJson(
              json['renamedStructureValue'] as Map<String, dynamic>)
          : null,
      stringValue: json['stringValue'] as String?,
      structureValue: json['structureValue'] != null
          ? SharedGreetingStruct.fromJson(
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
    final renamedStructureValue = this.renamedStructureValue;
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
      if (renamedStructureValue != null)
        'renamedStructureValue': renamedStructureValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (structureValue != null) 'structureValue': structureValue,
      if (timestampValue != null)
        'timestampValue': unixTimestampToJson(timestampValue),
    };
  }
}

class NestedGreetingStruct {
  final String? salutation;

  NestedGreetingStruct({
    this.salutation,
  });

  factory NestedGreetingStruct.fromJson(Map<String, dynamic> json) {
    return NestedGreetingStruct(
      salutation: json['salutation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final salutation = this.salutation;
    return {
      if (salutation != null) 'salutation': salutation,
    };
  }
}

class StructureListMember {
  final String? a;
  final String? b;

  StructureListMember({
    this.a,
    this.b,
  });

  factory StructureListMember.fromJson(Map<String, dynamic> json) {
    return StructureListMember(
      a: json['value'] as String?,
      b: json['other'] as String?,
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

class UnionPayload {
  final String? greeting;

  UnionPayload({
    this.greeting,
  });

  factory UnionPayload.fromJson(Map<String, dynamic> json) {
    return UnionPayload(
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

class NestedPayload {
  final String? greeting;
  final String? name;

  NestedPayload({
    this.greeting,
    this.name,
  });

  factory NestedPayload.fromJson(Map<String, dynamic> json) {
    return NestedPayload(
      greeting: json['greeting'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final greeting = this.greeting;
    final name = this.name;
    return {
      if (greeting != null) 'greeting': greeting,
      if (name != null) 'name': name,
    };
  }
}

enum StringEnum {
  enumvalue('enumvalue'),
  ;

  final String value;

  const StringEnum(this.value);

  static StringEnum fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StringEnum'));
}

class SingletonEventStream {
  final SingletonEvent? singleton;

  SingletonEventStream({
    this.singleton,
  });

  factory SingletonEventStream.fromJson(Map<String, dynamic> json) {
    return SingletonEventStream(
      singleton: json['singleton'] != null
          ? SingletonEvent.fromJson(json['singleton'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final singleton = this.singleton;
    return {
      if (singleton != null) 'singleton': singleton,
    };
  }
}

class SingletonEvent {
  final String? value;

  SingletonEvent({
    this.value,
  });

  factory SingletonEvent.fromJson(Map<String, dynamic> json) {
    return SingletonEvent(
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'value': value,
    };
  }
}

class Unit {
  Unit();

  factory Unit.fromJson(Map<String, dynamic> _) {
    return Unit();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ComplexError extends _s.GenericAwsException {
  ComplexError({String? type, String? message})
      : super(type: type, code: 'ComplexError', message: message);
}

class FooError extends _s.GenericAwsException {
  FooError({String? type, String? message})
      : super(type: type, code: 'FooError', message: message);
}

class InvalidGreeting extends _s.GenericAwsException {
  InvalidGreeting({String? type, String? message})
      : super(type: type, code: 'InvalidGreeting', message: message);
}

class ServiceUnavailableError extends _s.GenericAwsException {
  ServiceUnavailableError({String? type, String? message})
      : super(type: type, code: 'ServiceUnavailableError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ComplexError': (type, message) => ComplexError(type: type, message: message),
  'ErrorEvent': (type, message) => ErrorEvent(message: message),
  'FooError': (type, message) => FooError(type: type, message: message),
  'InvalidGreeting': (type, message) =>
      InvalidGreeting(type: type, message: message),
  'ServiceUnavailableError': (type, message) =>
      ServiceUnavailableError(type: type, message: message),
};
