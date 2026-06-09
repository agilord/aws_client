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

/// A REST XML service that sends XML requests and responses.
class RestXmlProtocol {
  final _s.RestXmlProtocol _protocol;
  RestXmlProtocol({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'restxml',
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
    Map<String, String>? queryParamsMapOfStrings,
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
        'TimestampList':
            queryTimestampList.map((e) => _s.iso8601ToJson(e)).toList(),
    };
    await _protocol.send(
      method: 'GET',
      requestUri: '/AllQueryStringTypesInput',
      queryParams: $query,
      payload: AllQueryStringTypesInput(
              queryBoolean: queryBoolean,
              queryBooleanList: queryBooleanList,
              queryByte: queryByte,
              queryDouble: queryDouble,
              queryDoubleList: queryDoubleList,
              queryEnum: queryEnum,
              queryEnumList: queryEnumList,
              queryFloat: queryFloat,
              queryInteger: queryInteger,
              queryIntegerEnum: queryIntegerEnum,
              queryIntegerEnumList: queryIntegerEnumList,
              queryIntegerList: queryIntegerList,
              queryIntegerSet: queryIntegerSet,
              queryLong: queryLong,
              queryParamsMapOfStrings: queryParamsMapOfStrings,
              queryShort: queryShort,
              queryString: queryString,
              queryStringList: queryStringList,
              queryStringSet: queryStringSet,
              queryTimestamp: queryTimestamp,
              queryTimestampList: queryTimestampList)
          .toXml('AllQueryStringTypesInput'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The following example serializes a body that uses an XML name, changing
  /// the wrapper name.
  Future<BodyWithXmlNameInputOutput> bodyWithXmlName({
    PayloadWithXmlName? nested,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/BodyWithXmlName',
      payload: BodyWithXmlNameInputOutput(nested: nested)
          .toXml('BodyWithXmlNameInputOutput'),
      exceptionFnMap: _exceptionFns,
    );
    return BodyWithXmlNameInputOutput.fromXml($result.body);
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
    await _protocol.send(
      method: 'PUT',
      requestUri: '/ContentTypeParameters',
      payload: ContentTypeParametersInput(value: value)
          .toXml('ContentTypeParametersInput'),
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<DatetimeOffsetsOutput> datetimeOffsets() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/DatetimeOffsets',
      exceptionFnMap: _exceptionFns,
    );
    return DatetimeOffsetsOutput.fromXml($result.body);
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has an empty input
  /// and empty output structure that reuses the same shape. While this should
  /// be rare, code generators must support this.
  Future<void> emptyInputAndEmptyOutput() async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/EmptyInputAndEmptyOutput',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> endpointOperation() async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/EndpointOperation',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> endpointWithHostLabelHeaderOperation({
    required String accountId,
  }) async {
    final headers = <String, String>{
      'X-Amz-Account-Id': accountId.toString(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/EndpointWithHostLabelHeaderOperation',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> endpointWithHostLabelOperation({
    required String label,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/EndpointWithHostLabelOperation',
      payload: EndpointWithHostLabelOperationRequest(label: label)
          .toXml('EndpointWithHostLabelOperationRequest'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Flattened maps
  Future<FlattenedXmlMapResponse> flattenedXmlMap({
    Map<String, FooEnum>? myMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/FlattenedXmlMap',
      payload:
          FlattenedXmlMapRequest(myMap: myMap).toXml('FlattenedXmlMapRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return FlattenedXmlMapResponse.fromXml($result.body);
  }

  /// Flattened maps with @xmlName
  Future<FlattenedXmlMapWithXmlNameResponse> flattenedXmlMapWithXmlName({
    Map<String, String>? myMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/FlattenedXmlMapWithXmlName',
      payload: FlattenedXmlMapWithXmlNameRequest(myMap: myMap)
          .toXml('FlattenedXmlMapWithXmlNameRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return FlattenedXmlMapWithXmlNameResponse.fromXml($result.body);
  }

  /// Flattened maps with @xmlNamespace and @xmlName
  Future<FlattenedXmlMapWithXmlNamespaceOutput>
      flattenedXmlMapWithXmlNamespace() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/FlattenedXmlMapWithXmlNamespace',
      exceptionFnMap: _exceptionFns,
    );
    return FlattenedXmlMapWithXmlNamespaceOutput.fromXml($result.body);
  }

  Future<FractionalSecondsOutput> fractionalSeconds() async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/FractionalSeconds',
      exceptionFnMap: _exceptionFns,
    );
    return FractionalSecondsOutput.fromXml($result.body);
  }

  /// This operation has three possible return values: 1. A successful response
  /// in the form of GreetingWithErrorsOutput 2. An InvalidGreeting error. 3. A
  /// BadRequest error. Implementations must be able to successfully take a
  /// response and properly (de)serialize successful and error responses based
  /// on the the presence of the
  ///
  /// May throw [ComplexError].
  /// May throw [InvalidGreeting].
  Future<GreetingWithErrorsOutput> greetingWithErrors() async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/GreetingWithErrors',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GreetingWithErrorsOutput(
      greeting: _s.extractHeaderStringValue($result.headers, 'X-Greeting'),
    );
  }

  /// Clients that perform this test extract all headers from the response.
  Future<HttpEmptyPrefixHeadersOutput> httpEmptyPrefixHeaders({
    Map<String, String>? prefixHeaders,
    String? specificHeader,
  }) async {
    final headers = <String, String>{
      if (prefixHeaders != null)
        ...prefixHeaders.map((key, value) => MapEntry('$key', value)),
      if (specificHeader != null) 'hello': specificHeader.toString(),
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/HttpEmptyPrefixHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpEmptyPrefixHeadersOutput(
      prefixHeaders: _s.extractHeaderMapValues($result.headers, ''),
      specificHeader: _s.extractHeaderStringValue($result.headers, 'hello'),
    );
  }

  Future<EnumPayloadInput> httpEnumPayload({
    StringEnum? payload,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/EnumPayload',
      payload: payload?.value,
      exceptionFnMap: _exceptionFns,
    );
    return EnumPayloadInput(
      payload: StringEnum.fromString(await $result.stream.bytesToString()),
    );
  }

  /// This example serializes a blob shape in the payload. In this example, no
  /// XML document is synthesized because the payload is not a structure or a
  /// union type.
  Future<HttpPayloadTraitsInputOutput> httpPayloadTraits({
    Uint8List? blob,
    String? foo,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'X-Foo': foo.toString(),
    };
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/HttpPayloadTraits',
      headers: headers,
      payload: blob,
      exceptionFnMap: _exceptionFns,
    );
    return HttpPayloadTraitsInputOutput(
      blob: await $result.stream.toBytes(),
      foo: _s.extractHeaderStringValue($result.headers, 'X-Foo'),
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
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/HttpPayloadTraitsWithMediaType',
      headers: headers,
      payload: blob,
      exceptionFnMap: _exceptionFns,
    );
    return HttpPayloadTraitsWithMediaTypeInputOutput(
      blob: await $result.stream.toBytes(),
      foo: _s.extractHeaderStringValue($result.headers, 'X-Foo'),
    );
  }

  /// The following example serializes a payload that uses an XML name on the
  /// member, changing the wrapper name.
  Future<HttpPayloadWithMemberXmlNameInputOutput> httpPayloadWithMemberXmlName({
    PayloadWithXmlName? nested,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/HttpPayloadWithMemberXmlName',
      payload: nested?.toXml('Hola'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPayloadWithMemberXmlNameInputOutput(
      nested: PayloadWithXmlName.fromXml($elem),
    );
  }

  /// This example serializes a structure in the payload. Note that serializing
  /// a structure changes the wrapper element name to match the targeted
  /// structure.
  Future<HttpPayloadWithStructureInputOutput> httpPayloadWithStructure({
    NestedPayload? nested,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/HttpPayloadWithStructure',
      payload: nested?.toXml('nested'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPayloadWithStructureInputOutput(
      nested: NestedPayload.fromXml($elem),
    );
  }

  /// This example serializes a union in the payload.
  Future<HttpPayloadWithUnionInputOutput> httpPayloadWithUnion({
    UnionPayload? nested,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/HttpPayloadWithUnion',
      payload: nested?.toXml('nested'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPayloadWithUnionInputOutput(
      nested: UnionPayload.fromXml($elem),
    );
  }

  /// The following example serializes a payload that uses an XML name, changing
  /// the wrapper name.
  Future<HttpPayloadWithXmlNameInputOutput> httpPayloadWithXmlName({
    PayloadWithXmlName? nested,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/HttpPayloadWithXmlName',
      payload: nested?.toXml('nested'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPayloadWithXmlNameInputOutput(
      nested: PayloadWithXmlName.fromXml($elem),
    );
  }

  /// The following example serializes a payload that uses an XML namespace.
  Future<HttpPayloadWithXmlNamespaceInputOutput> httpPayloadWithXmlNamespace({
    PayloadWithXmlNamespace? nested,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/HttpPayloadWithXmlNamespace',
      payload: nested?.toXml('nested'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPayloadWithXmlNamespaceInputOutput(
      nested: PayloadWithXmlNamespace.fromXml($elem),
    );
  }

  /// The following example serializes a payload that uses an XML namespace.
  Future<HttpPayloadWithXmlNamespaceAndPrefixInputOutput>
      httpPayloadWithXmlNamespaceAndPrefix({
    PayloadWithXmlNamespaceAndPrefix? nested,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/HttpPayloadWithXmlNamespaceAndPrefix',
      payload: nested?.toXml('nested'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPayloadWithXmlNamespaceAndPrefixInputOutput(
      nested: PayloadWithXmlNamespaceAndPrefix.fromXml($elem),
    );
  }

  /// This examples adds headers to the input of a request and response by
  /// prefix.
  Future<HttpPrefixHeadersInputOutput> httpPrefixHeaders({
    String? foo,
    Map<String, String>? fooMap,
  }) async {
    final headers = <String, String>{
      if (foo != null) 'x-foo': foo.toString(),
      if (fooMap != null)
        ...fooMap.map((key, value) => MapEntry('x-foo-$key', value)),
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/HttpPrefixHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return HttpPrefixHeadersInputOutput(
      foo: _s.extractHeaderStringValue($result.headers, 'x-foo'),
      fooMap: _s.extractHeaderMapValues($result.headers, 'x-foo-'),
    );
  }

  Future<void> httpRequestWithFloatLabels({
    required double doubleValue,
    required double float,
  }) async {
    await _protocol.send(
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
      method: 'GET',
      requestUri:
          '/HttpRequestWithLabelsAndTimestampFormat/${Uri.encodeComponent(_s.unixTimestampToJson(memberEpochSeconds).toString())}/${Uri.encodeComponent(_s.rfc822ToJson(memberHttpDate))}/${Uri.encodeComponent(_s.iso8601ToJson(memberDateTime))}/${Uri.encodeComponent(_s.iso8601ToJson(defaultFormat))}/${Uri.encodeComponent(_s.unixTimestampToJson(targetEpochSeconds).toString())}/${Uri.encodeComponent(_s.rfc822ToJson(targetHttpDate))}/${Uri.encodeComponent(_s.iso8601ToJson(targetDateTime))}',
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<HttpResponseCodeOutput> httpResponseCode() async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/HttpResponseCode',
      exceptionFnMap: _exceptionFns,
    );
    return HttpResponseCodeOutput.fromXml($result.body);
  }

  Future<StringPayloadInput> httpStringPayload({
    String? payload,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/StringPayload',
      payload: payload,
      exceptionFnMap: _exceptionFns,
    );
    return StringPayloadInput(
      payload: await $result.stream.bytesToString(),
    );
  }

  /// This example ensures that query string bound request parameters are
  /// serialized in the body of responses if the structure is used in both the
  /// request and response.
  Future<IgnoreQueryParamsInResponseOutput>
      ignoreQueryParamsInResponse() async {
    final $result = await _protocol.send(
      method: 'GET',
      requestUri: '/IgnoreQueryParamsInResponse',
      exceptionFnMap: _exceptionFns,
    );
    return IgnoreQueryParamsInResponseOutput.fromXml($result.body);
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
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/InputAndOutputWithHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return InputAndOutputWithHeadersIO(
      headerBooleanList: _s
          .extractHeaderListValues($result.headers, 'X-BooleanList')
          ?.map((e) => e.toLowerCase() == 'true')
          .toList(),
      headerByte: _s.extractHeaderIntValue($result.headers, 'X-Byte'),
      headerDouble: _s.extractHeaderDoubleValue($result.headers, 'X-Double'),
      headerEnum: _s
          .extractHeaderStringValue($result.headers, 'X-Enum')
          ?.let(FooEnum.fromString),
      headerEnumList: _s
          .extractHeaderListValues($result.headers, 'X-EnumList')
          ?.map(FooEnum.fromString)
          .toList(),
      headerFalseBool: _s.extractHeaderBoolValue($result.headers, 'X-Boolean2'),
      headerFloat: _s.extractHeaderDoubleValue($result.headers, 'X-Float'),
      headerInteger: _s.extractHeaderIntValue($result.headers, 'X-Integer'),
      headerIntegerList: _s
          .extractHeaderListValues($result.headers, 'X-IntegerList')
          ?.map(int.parse)
          .toList(),
      headerLong: _s.extractHeaderIntValue($result.headers, 'X-Long'),
      headerShort: _s.extractHeaderIntValue($result.headers, 'X-Short'),
      headerString: _s.extractHeaderStringValue($result.headers, 'X-String'),
      headerStringList:
          _s.extractHeaderListValues($result.headers, 'X-StringList'),
      headerStringSet:
          _s.extractHeaderListValues($result.headers, 'X-StringSet'),
      headerTimestampList: _s
          .extractHeaderListValues($result.headers, 'X-TimestampList',
              isHttpDateList: true)
          ?.map(_s.nonNullableTimeStampFromJson)
          .toList(),
      headerTrueBool: _s.extractHeaderBoolValue($result.headers, 'X-Boolean1'),
    );
  }

  Future<NestedXmlMapsResponse> nestedXmlMaps({
    Map<String, Map<String, FooEnum>>? flatNestedMap,
    Map<String, Map<String, FooEnum>>? nestedMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/NestedXmlMaps',
      payload: NestedXmlMapsRequest(
              flatNestedMap: flatNestedMap, nestedMap: nestedMap)
          .toXml('NestedXmlMapsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return NestedXmlMapsResponse.fromXml($result.body);
  }

  /// Nested Xml Maps with key/values with @xmlName
  Future<NestedXmlMapWithXmlNameResponse> nestedXmlMapWithXmlName({
    Map<String, Map<String, String>>? nestedXmlMapWithXmlNameMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/NestedXmlMapWithXmlName',
      payload: NestedXmlMapWithXmlNameRequest(
              nestedXmlMapWithXmlNameMap: nestedXmlMapWithXmlNameMap)
          .toXml('NestedXmlMapWithXmlNameRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return NestedXmlMapWithXmlNameResponse.fromXml($result.body);
  }

  /// The example tests how requests and responses are serialized when there's
  /// no request or response payload because the operation has no input or
  /// output. While this should be rare, code generators must support this.
  Future<void> noInputAndNoOutput() async {
    await _protocol.send(
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
    await _protocol.send(
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
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/NullAndEmptyHeadersClient',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return NullAndEmptyHeadersIO(
      a: _s.extractHeaderStringValue($result.headers, 'X-A'),
      b: _s.extractHeaderStringValue($result.headers, 'X-B'),
      c: _s.extractHeaderListValues($result.headers, 'X-C'),
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
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/NullAndEmptyHeadersServer',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return NullAndEmptyHeadersIO(
      a: _s.extractHeaderStringValue($result.headers, 'X-A'),
      b: _s.extractHeaderStringValue($result.headers, 'X-B'),
      c: _s.extractHeaderListValues($result.headers, 'X-C'),
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
      method: 'GET',
      requestUri: '/OmitsNullSerializesEmptyString',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  Future<void> putWithContentEncoding({
    String? data,
    String? encoding,
  }) async {
    final headers = <String, String>{
      if (encoding != null) 'Content-Encoding': encoding.toString(),
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/requestcompression/putcontentwithencoding',
      headers: headers,
      payload: PutWithContentEncodingInput(data: data, encoding: encoding)
          .toXml('PutWithContentEncodingInput'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Automatically adds idempotency tokens.
  Future<void> queryIdempotencyTokenAutoFill({
    String? token,
  }) async {
    token ??= _s.generateIdempotencyToken();
    final $query = <String, List<String>>{
      if (token != null) 'token': [token],
    };
    await _protocol.send(
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/StringListMap',
      queryParams: $query,
      payload: QueryParamsAsStringListMapInput(foo: foo, qux: qux)
          .toXml('QueryParamsAsStringListMapInput'),
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
    await _protocol.send(
      method: 'POST',
      requestUri: '/Precedence',
      queryParams: $query,
      payload: QueryPrecedenceInput(baz: baz, foo: foo)
          .toXml('QueryPrecedenceInput'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Recursive shapes
  Future<RecursiveShapesResponse> recursiveShapes({
    RecursiveShapesInputOutputNested1? nested,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/RecursiveShapes',
      payload: RecursiveShapesRequest(nested: nested)
          .toXml('RecursiveShapesRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return RecursiveShapesResponse.fromXml($result.body);
  }

  Future<SimpleScalarPropertiesResponse> simpleScalarProperties({
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
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/SimpleScalarProperties',
      headers: headers,
      payload: SimpleScalarPropertiesRequest(
              byteValue: byteValue,
              doubleValue: doubleValue,
              falseBooleanValue: falseBooleanValue,
              floatValue: floatValue,
              foo: foo,
              integerValue: integerValue,
              longValue: longValue,
              shortValue: shortValue,
              stringValue: stringValue,
              trueBooleanValue: trueBooleanValue)
          .toXml('SimpleScalarPropertiesRequest'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return SimpleScalarPropertiesResponse(
      byteValue: _s.extractXmlIntValue($elem, 'byteValue'),
      doubleValue: _s.extractXmlDoubleValue($elem, 'DoubleDribble'),
      falseBooleanValue: _s.extractXmlBoolValue($elem, 'falseBooleanValue'),
      floatValue: _s.extractXmlDoubleValue($elem, 'floatValue'),
      integerValue: _s.extractXmlIntValue($elem, 'integerValue'),
      longValue: _s.extractXmlIntValue($elem, 'longValue'),
      shortValue: _s.extractXmlIntValue($elem, 'shortValue'),
      stringValue: _s.extractXmlStringValue($elem, 'stringValue'),
      trueBooleanValue: _s.extractXmlBoolValue($elem, 'trueBooleanValue'),
      foo: _s.extractHeaderStringValue($result.headers, 'X-Foo'),
    );
  }

  /// The example tests how timestamp request and response headers are
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
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/TimestampFormatHeaders',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return TimestampFormatHeadersIO(
      defaultFormat:
          _s.extractHeaderDateTimeValue($result.headers, 'X-defaultFormat'),
      memberDateTime: _s.extractHeaderDateTimeValue(
          $result.headers, 'X-memberDateTime',
          parser: _s.timeStampFromJson),
      memberEpochSeconds: _s.extractHeaderDateTimeValue(
          $result.headers, 'X-memberEpochSeconds',
          parser: _s.timeStampFromJson),
      memberHttpDate: _s.extractHeaderDateTimeValue(
          $result.headers, 'X-memberHttpDate',
          parser: _s.timeStampFromJson),
      targetDateTime: _s.extractHeaderDateTimeValue(
          $result.headers, 'X-targetDateTime',
          parser: _s.timeStampFromJson),
      targetEpochSeconds: _s.extractHeaderDateTimeValue(
          $result.headers, 'X-targetEpochSeconds',
          parser: _s.timeStampFromJson),
      targetHttpDate: _s.extractHeaderDateTimeValue(
          $result.headers, 'X-targetHttpDate',
          parser: _s.timeStampFromJson),
    );
  }

  /// This example serializes an XML attributes on synthesized document.
  Future<XmlAttributesResponse> xmlAttributes({
    String? attr,
    String? foo,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlAttributes',
      payload: XmlAttributesRequest(attr: attr, foo: foo)
          .toXml('XmlAttributesRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlAttributesResponse.fromXml($result.body);
  }

  /// This example serializes an XML attribute on a payload when it's defined in
  /// the middle of the member list. This tests that implementations correctly
  /// write attributes immediately after the element start tag, which is
  /// critical for languages like C# where attribute writing must happen before
  /// child elements.
  Future<XmlAttributesInMiddleResponse> xmlAttributesInMiddle({
    XmlAttributesInMiddlePayloadRequest? payload,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/XmlAttributesInMiddle',
      payload: payload?.toXml('payload'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return XmlAttributesInMiddleResponse(
      payload: XmlAttributesInMiddlePayloadResponse.fromXml($elem),
    );
  }

  /// This example serializes an XML attributes on a document targeted by
  /// httpPayload.
  Future<XmlAttributesOnPayloadResponse> xmlAttributesOnPayload({
    XmlAttributesPayloadRequest? payload,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/XmlAttributesOnPayload',
      payload: payload?.toXml('payload'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return XmlAttributesOnPayloadResponse(
      payload: XmlAttributesPayloadResponse.fromXml($elem),
    );
  }

  /// Blobs are base64 encoded
  Future<XmlBlobsResponse> xmlBlobs({
    Uint8List? data,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlBlobs',
      payload: XmlBlobsRequest(data: data).toXml('XmlBlobsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlBlobsResponse.fromXml($result.body);
  }

  /// Blobs are base64 encoded
  Future<XmlEmptyBlobsResponse> xmlEmptyBlobs({
    Uint8List? data,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlEmptyBlobs',
      payload: XmlEmptyBlobsRequest(data: data).toXml('XmlEmptyBlobsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlEmptyBlobsResponse.fromXml($result.body);
  }

  Future<XmlEmptyListsResponse> xmlEmptyLists({
    List<bool>? booleanList,
    List<FooEnum>? enumList,
    List<String>? flattenedList,
    List<String>? flattenedList2,
    List<String>? flattenedListWithMemberNamespace,
    List<String>? flattenedListWithNamespace,
    List<StructureListMember>? flattenedStructureList,
    List<int>? intEnumList,
    List<int>? integerList,
    List<List<String>>? nestedStringList,
    List<String>? renamedListMembers,
    List<String>? stringList,
    List<String>? stringSet,
    List<StructureListMember>? structureList,
    List<DateTime>? timestampList,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlEmptyLists',
      payload: XmlEmptyListsRequest(
              booleanList: booleanList,
              enumList: enumList,
              flattenedList: flattenedList,
              flattenedList2: flattenedList2,
              flattenedListWithMemberNamespace:
                  flattenedListWithMemberNamespace,
              flattenedListWithNamespace: flattenedListWithNamespace,
              flattenedStructureList: flattenedStructureList,
              intEnumList: intEnumList,
              integerList: integerList,
              nestedStringList: nestedStringList,
              renamedListMembers: renamedListMembers,
              stringList: stringList,
              stringSet: stringSet,
              structureList: structureList,
              timestampList: timestampList)
          .toXml('XmlEmptyListsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlEmptyListsResponse.fromXml($result.body);
  }

  Future<XmlEmptyMapsResponse> xmlEmptyMaps({
    Map<String, GreetingStruct>? myMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlEmptyMaps',
      payload: XmlEmptyMapsRequest(myMap: myMap).toXml('XmlEmptyMapsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlEmptyMapsResponse.fromXml($result.body);
  }

  Future<XmlEmptyStringsResponse> xmlEmptyStrings({
    String? emptyString,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlEmptyStrings',
      payload: XmlEmptyStringsRequest(emptyString: emptyString)
          .toXml('XmlEmptyStringsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlEmptyStringsResponse.fromXml($result.body);
  }

  /// This example serializes enums as top level properties, in lists, sets, and
  /// maps.
  Future<XmlEnumsResponse> xmlEnums({
    FooEnum? fooEnum1,
    FooEnum? fooEnum2,
    FooEnum? fooEnum3,
    List<FooEnum>? fooEnumList,
    Map<String, FooEnum>? fooEnumMap,
    List<FooEnum>? fooEnumSet,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlEnums',
      payload: XmlEnumsRequest(
              fooEnum1: fooEnum1,
              fooEnum2: fooEnum2,
              fooEnum3: fooEnum3,
              fooEnumList: fooEnumList,
              fooEnumMap: fooEnumMap,
              fooEnumSet: fooEnumSet)
          .toXml('XmlEnumsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlEnumsResponse.fromXml($result.body);
  }

  /// This example serializes enums as top level properties, in lists, sets, and
  /// maps.
  Future<XmlIntEnumsResponse> xmlIntEnums({
    int? intEnum1,
    int? intEnum2,
    int? intEnum3,
    List<int>? intEnumList,
    Map<String, int>? intEnumMap,
    List<int>? intEnumSet,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlIntEnums',
      payload: XmlIntEnumsRequest(
              intEnum1: intEnum1,
              intEnum2: intEnum2,
              intEnum3: intEnum3,
              intEnumList: intEnumList,
              intEnumMap: intEnumMap,
              intEnumSet: intEnumSet)
          .toXml('XmlIntEnumsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlIntEnumsResponse.fromXml($result.body);
  }

  /// This test case serializes XML lists for the following cases for both input
  /// and output: 1. Normal XML lists. 2. Normal XML sets. 3. XML lists of
  /// lists. 4. XML lists with @xmlName on its members 5. Flattened XML lists.
  /// 6. Flattened XML lists with @xmlName. 7. Flattened XML lists with
  /// @xmlNamespace. 8. Lists of structures. 9. Flattened XML list of structures
  Future<XmlListsResponse> xmlLists({
    List<bool>? booleanList,
    List<FooEnum>? enumList,
    List<String>? flattenedList,
    List<String>? flattenedList2,
    List<String>? flattenedListWithMemberNamespace,
    List<String>? flattenedListWithNamespace,
    List<StructureListMember>? flattenedStructureList,
    List<int>? intEnumList,
    List<int>? integerList,
    List<List<String>>? nestedStringList,
    List<String>? renamedListMembers,
    List<String>? stringList,
    List<String>? stringSet,
    List<StructureListMember>? structureList,
    List<DateTime>? timestampList,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlLists',
      payload: XmlListsRequest(
              booleanList: booleanList,
              enumList: enumList,
              flattenedList: flattenedList,
              flattenedList2: flattenedList2,
              flattenedListWithMemberNamespace:
                  flattenedListWithMemberNamespace,
              flattenedListWithNamespace: flattenedListWithNamespace,
              flattenedStructureList: flattenedStructureList,
              intEnumList: intEnumList,
              integerList: integerList,
              nestedStringList: nestedStringList,
              renamedListMembers: renamedListMembers,
              stringList: stringList,
              stringSet: stringSet,
              structureList: structureList,
              timestampList: timestampList)
          .toXml('XmlListsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlListsResponse.fromXml($result.body);
  }

  /// The example tests basic map serialization.
  Future<XmlMapsResponse> xmlMaps({
    Map<String, GreetingStruct>? myMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlMaps',
      payload: XmlMapsRequest(myMap: myMap).toXml('XmlMapsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlMapsResponse.fromXml($result.body);
  }

  Future<XmlMapsXmlNameResponse> xmlMapsXmlName({
    Map<String, GreetingStruct>? myMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlMapsXmlName',
      payload:
          XmlMapsXmlNameRequest(myMap: myMap).toXml('XmlMapsXmlNameRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlMapsXmlNameResponse.fromXml($result.body);
  }

  /// Maps with @xmlNamespace and @xmlName
  Future<XmlMapWithXmlNamespaceResponse> xmlMapWithXmlNamespace({
    Map<String, String>? myMap,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlMapWithXmlNamespace',
      payload: XmlMapWithXmlNamespaceRequest(myMap: myMap)
          .toXml('XmlMapWithXmlNamespaceRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlMapWithXmlNamespaceResponse.fromXml($result.body);
  }

  Future<XmlNamespacesResponse> xmlNamespaces({
    XmlNamespaceNested? nested,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlNamespaces',
      payload:
          XmlNamespacesRequest(nested: nested).toXml('XmlNamespacesRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlNamespacesResponse.fromXml($result.body);
  }

  /// This tests how timestamps are serialized, including using the default
  /// format of date-time and various @timestampFormat trait values.
  Future<XmlTimestampsResponse> xmlTimestamps({
    DateTime? dateTime,
    DateTime? dateTimeOnTarget,
    DateTime? epochSeconds,
    DateTime? epochSecondsOnTarget,
    DateTime? httpDate,
    DateTime? httpDateOnTarget,
    DateTime? normal,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/XmlTimestamps',
      payload: XmlTimestampsRequest(
              dateTime: dateTime,
              dateTimeOnTarget: dateTimeOnTarget,
              epochSeconds: epochSeconds,
              epochSecondsOnTarget: epochSecondsOnTarget,
              httpDate: httpDate,
              httpDateOnTarget: httpDateOnTarget,
              normal: normal)
          .toXml('XmlTimestampsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlTimestampsResponse.fromXml($result.body);
  }

  Future<XmlUnionsResponse> xmlUnions({
    XmlUnionShape? unionValue,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/XmlUnions',
      payload:
          XmlUnionsRequest(unionValue: unionValue).toXml('XmlUnionsRequest'),
      exceptionFnMap: _exceptionFns,
    );
    return XmlUnionsResponse.fromXml($result.body);
  }
}

class AllQueryStringTypesInput {
  final bool? queryBoolean;
  final List<bool>? queryBooleanList;
  final int? queryByte;
  final double? queryDouble;
  final List<double>? queryDoubleList;
  final FooEnum? queryEnum;
  final List<FooEnum>? queryEnumList;
  final double? queryFloat;
  final int? queryInteger;
  final int? queryIntegerEnum;
  final List<int>? queryIntegerEnumList;
  final List<int>? queryIntegerList;
  final List<int>? queryIntegerSet;
  final int? queryLong;
  final Map<String, String>? queryParamsMapOfStrings;
  final int? queryShort;
  final String? queryString;
  final List<String>? queryStringList;
  final List<String>? queryStringSet;
  final DateTime? queryTimestamp;
  final List<DateTime>? queryTimestampList;

  AllQueryStringTypesInput({
    this.queryBoolean,
    this.queryBooleanList,
    this.queryByte,
    this.queryDouble,
    this.queryDoubleList,
    this.queryEnum,
    this.queryEnumList,
    this.queryFloat,
    this.queryInteger,
    this.queryIntegerEnum,
    this.queryIntegerEnumList,
    this.queryIntegerList,
    this.queryIntegerSet,
    this.queryLong,
    this.queryParamsMapOfStrings,
    this.queryShort,
    this.queryString,
    this.queryStringList,
    this.queryStringSet,
    this.queryTimestamp,
    this.queryTimestampList,
  });

  Map<String, dynamic> toJson() {
    final queryBoolean = this.queryBoolean;
    final queryBooleanList = this.queryBooleanList;
    final queryByte = this.queryByte;
    final queryDouble = this.queryDouble;
    final queryDoubleList = this.queryDoubleList;
    final queryEnum = this.queryEnum;
    final queryEnumList = this.queryEnumList;
    final queryFloat = this.queryFloat;
    final queryInteger = this.queryInteger;
    final queryIntegerEnum = this.queryIntegerEnum;
    final queryIntegerEnumList = this.queryIntegerEnumList;
    final queryIntegerList = this.queryIntegerList;
    final queryIntegerSet = this.queryIntegerSet;
    final queryLong = this.queryLong;
    final queryParamsMapOfStrings = this.queryParamsMapOfStrings;
    final queryShort = this.queryShort;
    final queryString = this.queryString;
    final queryStringList = this.queryStringList;
    final queryStringSet = this.queryStringSet;
    final queryTimestamp = this.queryTimestamp;
    final queryTimestampList = this.queryTimestampList;
    return {
      if (queryParamsMapOfStrings != null)
        'queryParamsMapOfStrings': queryParamsMapOfStrings,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final queryBoolean = this.queryBoolean;
    final queryBooleanList = this.queryBooleanList;
    final queryByte = this.queryByte;
    final queryDouble = this.queryDouble;
    final queryDoubleList = this.queryDoubleList;
    final queryEnum = this.queryEnum;
    final queryEnumList = this.queryEnumList;
    final queryFloat = this.queryFloat;
    final queryInteger = this.queryInteger;
    final queryIntegerEnum = this.queryIntegerEnum;
    final queryIntegerEnumList = this.queryIntegerEnumList;
    final queryIntegerList = this.queryIntegerList;
    final queryIntegerSet = this.queryIntegerSet;
    final queryLong = this.queryLong;
    final queryParamsMapOfStrings = this.queryParamsMapOfStrings;
    final queryShort = this.queryShort;
    final queryString = this.queryString;
    final queryStringList = this.queryStringList;
    final queryStringSet = this.queryStringSet;
    final queryTimestamp = this.queryTimestamp;
    final queryTimestampList = this.queryTimestampList;
    final $children = <_s.XmlNode>[
      if (queryParamsMapOfStrings != null)
        _s.XmlElement(
            _s.XmlName.parts('queryParamsMapOfStrings'),
            [],
            queryParamsMapOfStrings.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlStringValue('value', e.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class BodyWithXmlNameInputOutput {
  final PayloadWithXmlName? nested;

  BodyWithXmlNameInputOutput({
    this.nested,
  });
  factory BodyWithXmlNameInputOutput.fromXml(_s.XmlElement elem) {
    return BodyWithXmlNameInputOutput(
      nested:
          _s.extractXmlChild(elem, 'nested')?.let(PayloadWithXmlName.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final nested = this.nested;
    final $children = <_s.XmlNode>[
      if (nested != null) nested.toXml('nested'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class ContentTypeParametersInput {
  final int? value;

  ContentTypeParametersInput({
    this.value,
  });

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'value': value,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final value = this.value;
    final $children = <_s.XmlNode>[
      if (value != null) _s.encodeXmlIntValue('value', value),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class ContentTypeParametersOutput {
  ContentTypeParametersOutput();
  factory ContentTypeParametersOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
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

class EndpointWithHostLabelOperationRequest {
  final String label;

  EndpointWithHostLabelOperationRequest({
    required this.label,
  });

  Map<String, dynamic> toJson() {
    final label = this.label;
    return {
      'label': label,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final label = this.label;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('label', label),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class FlattenedXmlMapRequest {
  final Map<String, FooEnum>? myMap;

  FlattenedXmlMapRequest({
    this.myMap,
  });

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap.map((k, e) => MapEntry(k, e.value)),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final myMap = this.myMap;
    final $children = <_s.XmlNode>[
      if (myMap != null)
        _s.XmlElement(
            _s.XmlName.parts('myMap'),
            [],
            myMap.entries.map((e) =>
                _s.XmlElement(_s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlStringValue('value', e.value.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class FlattenedXmlMapResponse {
  final Map<String, FooEnum>? myMap;

  FlattenedXmlMapResponse({
    this.myMap,
  });
  factory FlattenedXmlMapResponse.fromXml(_s.XmlElement elem) {
    return FlattenedXmlMapResponse(
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

class FlattenedXmlMapWithXmlNameRequest {
  final Map<String, String>? myMap;

  FlattenedXmlMapWithXmlNameRequest({
    this.myMap,
  });

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'KVP': myMap,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final myMap = this.myMap;
    final $children = <_s.XmlNode>[
      if (myMap != null)
        _s.XmlElement(
            _s.XmlName.parts('KVP'),
            [],
            myMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('K', e.key),
                  _s.encodeXmlStringValue('V', e.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class FlattenedXmlMapWithXmlNameResponse {
  final Map<String, String>? myMap;

  FlattenedXmlMapWithXmlNameResponse({
    this.myMap,
  });
  factory FlattenedXmlMapWithXmlNameResponse.fromXml(_s.XmlElement elem) {
    return FlattenedXmlMapWithXmlNameResponse(
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

  Map<String, dynamic> toJson() {
    final greeting = this.greeting;
    return {};
  }
}

/// This error is thrown when a request is invalid.
class ComplexError implements _s.AwsException {
  final String? header;
  final ComplexNestedErrorData? nested;
  final String? topLevel;

  ComplexError({
    this.header,
    this.nested,
    this.topLevel,
  });

  Map<String, dynamic> toJson() {
    final header = this.header;
    final nested = this.nested;
    final topLevel = this.topLevel;
    return {
      if (nested != null) 'Nested': nested,
      if (topLevel != null) 'TopLevel': topLevel,
    };
  }
}

/// This error is thrown when an invalid greeting value is provided.
class InvalidGreeting implements _s.AwsException {
  final String? message;

  InvalidGreeting({
    this.message,
  });
  factory InvalidGreeting.fromXml(_s.XmlElement elem) {
    return InvalidGreeting(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
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

class HttpPayloadWithMemberXmlNameInputOutput {
  final PayloadWithXmlName? nested;

  HttpPayloadWithMemberXmlNameInputOutput({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'Hola': nested,
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

class HttpPayloadWithXmlNameInputOutput {
  final PayloadWithXmlName? nested;

  HttpPayloadWithXmlNameInputOutput({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class HttpPayloadWithXmlNamespaceInputOutput {
  final PayloadWithXmlNamespace? nested;

  HttpPayloadWithXmlNamespaceInputOutput({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class HttpPayloadWithXmlNamespaceAndPrefixInputOutput {
  final PayloadWithXmlNamespaceAndPrefix? nested;

  HttpPayloadWithXmlNamespaceAndPrefixInputOutput({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class HttpPrefixHeadersInputOutput {
  final String? foo;
  final Map<String, String>? fooMap;

  HttpPrefixHeadersInputOutput({
    this.foo,
    this.fooMap,
  });

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    final fooMap = this.fooMap;
    return {};
  }
}

class HttpResponseCodeOutput {
  final int? status;

  HttpResponseCodeOutput({
    this.status,
  });
  factory HttpResponseCodeOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return HttpResponseCodeOutput();
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
  factory IgnoreQueryParamsInResponseOutput.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return IgnoreQueryParamsInResponseOutput();
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

class NestedXmlMapsRequest {
  final Map<String, Map<String, FooEnum>>? flatNestedMap;
  final Map<String, Map<String, FooEnum>>? nestedMap;

  NestedXmlMapsRequest({
    this.flatNestedMap,
    this.nestedMap,
  });

  Map<String, dynamic> toJson() {
    final flatNestedMap = this.flatNestedMap;
    final nestedMap = this.nestedMap;
    return {
      if (flatNestedMap != null)
        'flatNestedMap': flatNestedMap
            .map((k, e) => MapEntry(k, e.map((k, e) => MapEntry(k, e.value)))),
      if (nestedMap != null)
        'nestedMap': nestedMap
            .map((k, e) => MapEntry(k, e.map((k, e) => MapEntry(k, e.value)))),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final flatNestedMap = this.flatNestedMap;
    final nestedMap = this.nestedMap;
    final $children = <_s.XmlNode>[
      if (nestedMap != null)
        _s.XmlElement(
            _s.XmlName.parts('nestedMap'),
            [],
            nestedMap.entries.map((e) =>
                _s.XmlElement(_s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.XmlElement(
                      _s.XmlName.parts('value'),
                      [],
                      e.value.entries.map((e) => _s.XmlElement(
                              _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                            _s.encodeXmlStringValue('key', e.key),
                            _s.encodeXmlStringValue('value', e.value.value)
                          ])))
                ]))),
      if (flatNestedMap != null)
        _s.XmlElement(
            _s.XmlName.parts('flatNestedMap'),
            [],
            flatNestedMap.entries.map((e) =>
                _s.XmlElement(_s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.XmlElement(
                      _s.XmlName.parts('value'),
                      [],
                      e.value.entries.map((e) => _s.XmlElement(
                              _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                            _s.encodeXmlStringValue('key', e.key),
                            _s.encodeXmlStringValue('value', e.value.value)
                          ])))
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class NestedXmlMapsResponse {
  final Map<String, Map<String, FooEnum>>? flatNestedMap;
  final Map<String, Map<String, FooEnum>>? nestedMap;

  NestedXmlMapsResponse({
    this.flatNestedMap,
    this.nestedMap,
  });
  factory NestedXmlMapsResponse.fromXml(_s.XmlElement elem) {
    return NestedXmlMapsResponse(
      flatNestedMap: Map.fromEntries(
        elem.findElements('flatNestedMap').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key')!,
                Map.fromEntries(
                  c.getElement('value')?.findElements('entry').map(
                            (c) => MapEntry(
                              _s.extractXmlStringValue(c, 'key')!,
                              _s
                                  .extractXmlStringValue(c, 'value')!
                                  .let(FooEnum.fromString),
                            ),
                          ) ??
                      {},
                ),
              ),
            ),
      ),
      nestedMap: Map.fromEntries(
        elem.getElement('nestedMap')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    Map.fromEntries(
                      c.getElement('value')?.findElements('entry').map(
                                (c) => MapEntry(
                                  _s.extractXmlStringValue(c, 'key')!,
                                  _s
                                      .extractXmlStringValue(c, 'value')!
                                      .let(FooEnum.fromString),
                                ),
                              ) ??
                          {},
                    ),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final flatNestedMap = this.flatNestedMap;
    final nestedMap = this.nestedMap;
    return {
      if (flatNestedMap != null)
        'flatNestedMap': flatNestedMap
            .map((k, e) => MapEntry(k, e.map((k, e) => MapEntry(k, e.value)))),
      if (nestedMap != null)
        'nestedMap': nestedMap
            .map((k, e) => MapEntry(k, e.map((k, e) => MapEntry(k, e.value)))),
    };
  }
}

class NestedXmlMapWithXmlNameRequest {
  final Map<String, Map<String, String>>? nestedXmlMapWithXmlNameMap;

  NestedXmlMapWithXmlNameRequest({
    this.nestedXmlMapWithXmlNameMap,
  });

  Map<String, dynamic> toJson() {
    final nestedXmlMapWithXmlNameMap = this.nestedXmlMapWithXmlNameMap;
    return {
      if (nestedXmlMapWithXmlNameMap != null)
        'nestedXmlMapWithXmlNameMap': nestedXmlMapWithXmlNameMap,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final nestedXmlMapWithXmlNameMap = this.nestedXmlMapWithXmlNameMap;
    final $children = <_s.XmlNode>[
      if (nestedXmlMapWithXmlNameMap != null)
        _s.XmlElement(
            _s.XmlName.parts('nestedXmlMapWithXmlNameMap'),
            [],
            nestedXmlMapWithXmlNameMap.entries.map((e) =>
                _s.XmlElement(_s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('OuterKey', e.key),
                  _s.XmlElement(
                      _s.XmlName.parts('value'),
                      [],
                      e.value.entries.map((e) => _s.XmlElement(
                              _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                            _s.encodeXmlStringValue('InnerKey', e.key),
                            _s.encodeXmlStringValue('InnerValue', e.value)
                          ])))
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class NestedXmlMapWithXmlNameResponse {
  final Map<String, Map<String, String>>? nestedXmlMapWithXmlNameMap;

  NestedXmlMapWithXmlNameResponse({
    this.nestedXmlMapWithXmlNameMap,
  });
  factory NestedXmlMapWithXmlNameResponse.fromXml(_s.XmlElement elem) {
    return NestedXmlMapWithXmlNameResponse(
      nestedXmlMapWithXmlNameMap: Map.fromEntries(
        elem
                .getElement('nestedXmlMapWithXmlNameMap')
                ?.findElements('entry')
                .map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'OuterKey')!,
                    Map.fromEntries(
                      c.getElement('value')?.findElements('entry').map(
                                (c) => MapEntry(
                                  _s.extractXmlStringValue(c, 'InnerKey')!,
                                  _s.extractXmlStringValue(c, 'InnerValue')!,
                                ),
                              ) ??
                          {},
                    ),
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final nestedXmlMapWithXmlNameMap = this.nestedXmlMapWithXmlNameMap;
    return {
      if (nestedXmlMapWithXmlNameMap != null)
        'nestedXmlMapWithXmlNameMap': nestedXmlMapWithXmlNameMap,
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

class PutWithContentEncodingInput {
  final String? data;
  final String? encoding;

  PutWithContentEncodingInput({
    this.data,
    this.encoding,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final encoding = this.encoding;
    return {
      if (data != null) 'data': data,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final data = this.data;
    final encoding = this.encoding;
    final $children = <_s.XmlNode>[
      if (data != null) _s.encodeXmlStringValue('data', data),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class QueryParamsAsStringListMapInput {
  final Map<String, List<String>>? foo;
  final String? qux;

  QueryParamsAsStringListMapInput({
    this.foo,
    this.qux,
  });

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    final qux = this.qux;
    return {
      if (foo != null) 'foo': foo,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final foo = this.foo;
    final qux = this.qux;
    final $children = <_s.XmlNode>[
      if (foo != null)
        _s.XmlElement(
            _s.XmlName.parts('foo'),
            [],
            foo.entries.map((e) =>
                _s.XmlElement(_s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.XmlElement(_s.XmlName.parts('value'), [],
                      e.value.map((e) => _s.encodeXmlStringValue('member', e)))
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class QueryPrecedenceInput {
  final Map<String, String>? baz;
  final String? foo;

  QueryPrecedenceInput({
    this.baz,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final baz = this.baz;
    final foo = this.foo;
    return {
      if (baz != null) 'baz': baz,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final baz = this.baz;
    final foo = this.foo;
    final $children = <_s.XmlNode>[
      if (baz != null)
        _s.XmlElement(
            _s.XmlName.parts('baz'),
            [],
            baz.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlStringValue('value', e.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class RecursiveShapesRequest {
  final RecursiveShapesInputOutputNested1? nested;

  RecursiveShapesRequest({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final nested = this.nested;
    final $children = <_s.XmlNode>[
      if (nested != null) nested.toXml('nested'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class RecursiveShapesResponse {
  final RecursiveShapesInputOutputNested1? nested;

  RecursiveShapesResponse({
    this.nested,
  });
  factory RecursiveShapesResponse.fromXml(_s.XmlElement elem) {
    return RecursiveShapesResponse(
      nested: _s
          .extractXmlChild(elem, 'nested')
          ?.let(RecursiveShapesInputOutputNested1.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }
}

class SimpleScalarPropertiesRequest {
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

  SimpleScalarPropertiesRequest({
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
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
    final $children = <_s.XmlNode>[
      if (stringValue != null)
        _s.encodeXmlStringValue('stringValue', stringValue),
      if (trueBooleanValue != null)
        _s.encodeXmlBoolValue('trueBooleanValue', trueBooleanValue),
      if (falseBooleanValue != null)
        _s.encodeXmlBoolValue('falseBooleanValue', falseBooleanValue),
      if (byteValue != null) _s.encodeXmlIntValue('byteValue', byteValue),
      if (shortValue != null) _s.encodeXmlIntValue('shortValue', shortValue),
      if (integerValue != null)
        _s.encodeXmlIntValue('integerValue', integerValue),
      if (longValue != null) _s.encodeXmlIntValue('longValue', longValue),
      if (floatValue != null) _s.encodeXmlDoubleValue('floatValue', floatValue),
      if (doubleValue != null)
        _s.encodeXmlDoubleValue('DoubleDribble', doubleValue),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class SimpleScalarPropertiesResponse {
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

  SimpleScalarPropertiesResponse({
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

class XmlAttributesRequest {
  final String? attr;
  final String? foo;

  XmlAttributesRequest({
    this.attr,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final attr = this.attr;
    final foo = this.foo;
    return {
      if (attr != null) 'test': attr,
      if (foo != null) 'foo': foo,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final attr = this.attr;
    final foo = this.foo;
    final $children = <_s.XmlNode>[
      if (foo != null) _s.encodeXmlStringValue('foo', foo),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      if (attr != null) _s.XmlAttribute(_s.XmlName.parts('test'), attr),
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlAttributesResponse {
  final String? attr;
  final String? foo;

  XmlAttributesResponse({
    this.attr,
    this.foo,
  });
  factory XmlAttributesResponse.fromXml(_s.XmlElement elem) {
    return XmlAttributesResponse(
      attr: _s.extractXmlStringAttribute(elem, 'test'),
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final attr = this.attr;
    final foo = this.foo;
    return {
      if (attr != null) 'test': attr,
      if (foo != null) 'foo': foo,
    };
  }
}

class XmlAttributesInMiddleResponse {
  final XmlAttributesInMiddlePayloadResponse? payload;

  XmlAttributesInMiddleResponse({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class XmlAttributesOnPayloadResponse {
  final XmlAttributesPayloadResponse? payload;

  XmlAttributesOnPayloadResponse({
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final payload = this.payload;
    return {
      if (payload != null) 'payload': payload,
    };
  }
}

class XmlBlobsRequest {
  final Uint8List? data;

  XmlBlobsRequest({
    this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': base64Encode(data),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final data = this.data;
    final $children = <_s.XmlNode>[
      if (data != null) _s.encodeXmlUint8ListValue('data', data),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlBlobsResponse {
  final Uint8List? data;

  XmlBlobsResponse({
    this.data,
  });
  factory XmlBlobsResponse.fromXml(_s.XmlElement elem) {
    return XmlBlobsResponse(
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

class XmlEmptyBlobsRequest {
  final Uint8List? data;

  XmlEmptyBlobsRequest({
    this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': base64Encode(data),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final data = this.data;
    final $children = <_s.XmlNode>[
      if (data != null) _s.encodeXmlUint8ListValue('data', data),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlEmptyBlobsResponse {
  final Uint8List? data;

  XmlEmptyBlobsResponse({
    this.data,
  });
  factory XmlEmptyBlobsResponse.fromXml(_s.XmlElement elem) {
    return XmlEmptyBlobsResponse(
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

class XmlEmptyListsRequest {
  final List<bool>? booleanList;
  final List<FooEnum>? enumList;
  final List<String>? flattenedList;
  final List<String>? flattenedList2;
  final List<String>? flattenedListWithMemberNamespace;
  final List<String>? flattenedListWithNamespace;
  final List<StructureListMember>? flattenedStructureList;
  final List<int>? intEnumList;
  final List<int>? integerList;
  final List<List<String>>? nestedStringList;
  final List<String>? renamedListMembers;
  final List<String>? stringList;
  final List<String>? stringSet;
  final List<StructureListMember>? structureList;
  final List<DateTime>? timestampList;

  XmlEmptyListsRequest({
    this.booleanList,
    this.enumList,
    this.flattenedList,
    this.flattenedList2,
    this.flattenedListWithMemberNamespace,
    this.flattenedListWithNamespace,
    this.flattenedStructureList,
    this.intEnumList,
    this.integerList,
    this.nestedStringList,
    this.renamedListMembers,
    this.stringList,
    this.stringSet,
    this.structureList,
    this.timestampList,
  });

  Map<String, dynamic> toJson() {
    final booleanList = this.booleanList;
    final enumList = this.enumList;
    final flattenedList = this.flattenedList;
    final flattenedList2 = this.flattenedList2;
    final flattenedListWithMemberNamespace =
        this.flattenedListWithMemberNamespace;
    final flattenedListWithNamespace = this.flattenedListWithNamespace;
    final flattenedStructureList = this.flattenedStructureList;
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
      if (flattenedStructureList != null)
        'flattenedStructureList': flattenedStructureList,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final booleanList = this.booleanList;
    final enumList = this.enumList;
    final flattenedList = this.flattenedList;
    final flattenedList2 = this.flattenedList2;
    final flattenedListWithMemberNamespace =
        this.flattenedListWithMemberNamespace;
    final flattenedListWithNamespace = this.flattenedListWithNamespace;
    final flattenedStructureList = this.flattenedStructureList;
    final intEnumList = this.intEnumList;
    final integerList = this.integerList;
    final nestedStringList = this.nestedStringList;
    final renamedListMembers = this.renamedListMembers;
    final stringList = this.stringList;
    final stringSet = this.stringSet;
    final structureList = this.structureList;
    final timestampList = this.timestampList;
    final $children = <_s.XmlNode>[
      if (stringList != null)
        _s.XmlElement(_s.XmlName.parts('stringList'), [],
            stringList.map((e) => _s.encodeXmlStringValue('member', e))),
      if (stringSet != null)
        _s.XmlElement(_s.XmlName.parts('stringSet'), [],
            stringSet.map((e) => _s.encodeXmlStringValue('member', e))),
      if (integerList != null)
        _s.XmlElement(_s.XmlName.parts('integerList'), [],
            integerList.map((e) => _s.encodeXmlIntValue('member', e))),
      if (booleanList != null)
        _s.XmlElement(_s.XmlName.parts('booleanList'), [],
            booleanList.map((e) => _s.encodeXmlBoolValue('member', e))),
      if (timestampList != null)
        _s.XmlElement(_s.XmlName.parts('timestampList'), [],
            timestampList.map((e) => _s.encodeXmlDateTimeValue('member', e))),
      if (enumList != null)
        _s.XmlElement(_s.XmlName.parts('enumList'), [],
            enumList.map((e) => _s.encodeXmlStringValue('member', e.value))),
      if (intEnumList != null)
        _s.XmlElement(_s.XmlName.parts('intEnumList'), [],
            intEnumList.map((e) => _s.encodeXmlIntValue('member', e))),
      if (nestedStringList != null)
        _s.XmlElement(
            _s.XmlName.parts('nestedStringList'),
            [],
            nestedStringList.map((e) => _s.XmlElement(
                _s.XmlName.parts('member'),
                [],
                e.map((e) => _s.encodeXmlStringValue('member', e))))),
      if (renamedListMembers != null)
        _s.XmlElement(_s.XmlName.parts('renamed'), [],
            renamedListMembers.map((e) => _s.encodeXmlStringValue('item', e))),
      if (flattenedList != null)
        ...flattenedList
            .map((e) => _s.encodeXmlStringValue('flattenedList', e)),
      if (flattenedList2 != null)
        ...flattenedList2.map((e) => _s.encodeXmlStringValue('customName', e)),
      if (flattenedListWithMemberNamespace != null)
        ...flattenedListWithMemberNamespace.map((e) =>
            _s.encodeXmlStringValue('flattenedListWithMemberNamespace', e)),
      if (flattenedListWithNamespace != null)
        ...flattenedListWithNamespace.map(
            (e) => _s.encodeXmlStringValue('flattenedListWithNamespace', e)),
      if (structureList != null)
        _s.XmlElement(_s.XmlName.parts('myStructureList'), [],
            structureList.map((e) => e.toXml('item'))),
      if (flattenedStructureList != null)
        ...flattenedStructureList.map((e) => e.toXml('flattenedStructureList')),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlEmptyListsResponse {
  final List<bool>? booleanList;
  final List<FooEnum>? enumList;
  final List<String>? flattenedList;
  final List<String>? flattenedList2;
  final List<String>? flattenedListWithMemberNamespace;
  final List<String>? flattenedListWithNamespace;
  final List<StructureListMember>? flattenedStructureList;
  final List<int>? intEnumList;
  final List<int>? integerList;
  final List<List<String>>? nestedStringList;
  final List<String>? renamedListMembers;
  final List<String>? stringList;
  final List<String>? stringSet;
  final List<StructureListMember>? structureList;
  final List<DateTime>? timestampList;

  XmlEmptyListsResponse({
    this.booleanList,
    this.enumList,
    this.flattenedList,
    this.flattenedList2,
    this.flattenedListWithMemberNamespace,
    this.flattenedListWithNamespace,
    this.flattenedStructureList,
    this.intEnumList,
    this.integerList,
    this.nestedStringList,
    this.renamedListMembers,
    this.stringList,
    this.stringSet,
    this.structureList,
    this.timestampList,
  });
  factory XmlEmptyListsResponse.fromXml(_s.XmlElement elem) {
    return XmlEmptyListsResponse(
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
      flattenedStructureList:
          elem.findElements('item').map(StructureListMember.fromXml).toList(),
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
    final flattenedStructureList = this.flattenedStructureList;
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
      if (flattenedStructureList != null)
        'flattenedStructureList': flattenedStructureList,
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

class XmlEmptyMapsRequest {
  final Map<String, GreetingStruct>? myMap;

  XmlEmptyMapsRequest({
    this.myMap,
  });

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final myMap = this.myMap;
    final $children = <_s.XmlNode>[
      if (myMap != null)
        _s.XmlElement(
            _s.XmlName.parts('myMap'),
            [],
            myMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  e.value.toXml('value')
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlEmptyMapsResponse {
  final Map<String, GreetingStruct>? myMap;

  XmlEmptyMapsResponse({
    this.myMap,
  });
  factory XmlEmptyMapsResponse.fromXml(_s.XmlElement elem) {
    return XmlEmptyMapsResponse(
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

class XmlEmptyStringsRequest {
  final String? emptyString;

  XmlEmptyStringsRequest({
    this.emptyString,
  });

  Map<String, dynamic> toJson() {
    final emptyString = this.emptyString;
    return {
      if (emptyString != null) 'emptyString': emptyString,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final emptyString = this.emptyString;
    final $children = <_s.XmlNode>[
      if (emptyString != null)
        _s.encodeXmlStringValue('emptyString', emptyString),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlEmptyStringsResponse {
  final String? emptyString;

  XmlEmptyStringsResponse({
    this.emptyString,
  });
  factory XmlEmptyStringsResponse.fromXml(_s.XmlElement elem) {
    return XmlEmptyStringsResponse(
      emptyString: _s.extractXmlStringValue(elem, 'emptyString'),
    );
  }

  Map<String, dynamic> toJson() {
    final emptyString = this.emptyString;
    return {
      if (emptyString != null) 'emptyString': emptyString,
    };
  }
}

class XmlEnumsRequest {
  final FooEnum? fooEnum1;
  final FooEnum? fooEnum2;
  final FooEnum? fooEnum3;
  final List<FooEnum>? fooEnumList;
  final Map<String, FooEnum>? fooEnumMap;
  final List<FooEnum>? fooEnumSet;

  XmlEnumsRequest({
    this.fooEnum1,
    this.fooEnum2,
    this.fooEnum3,
    this.fooEnumList,
    this.fooEnumMap,
    this.fooEnumSet,
  });

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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final fooEnum1 = this.fooEnum1;
    final fooEnum2 = this.fooEnum2;
    final fooEnum3 = this.fooEnum3;
    final fooEnumList = this.fooEnumList;
    final fooEnumMap = this.fooEnumMap;
    final fooEnumSet = this.fooEnumSet;
    final $children = <_s.XmlNode>[
      if (fooEnum1 != null) _s.encodeXmlStringValue('fooEnum1', fooEnum1.value),
      if (fooEnum2 != null) _s.encodeXmlStringValue('fooEnum2', fooEnum2.value),
      if (fooEnum3 != null) _s.encodeXmlStringValue('fooEnum3', fooEnum3.value),
      if (fooEnumList != null)
        _s.XmlElement(_s.XmlName.parts('fooEnumList'), [],
            fooEnumList.map((e) => _s.encodeXmlStringValue('member', e.value))),
      if (fooEnumSet != null)
        _s.XmlElement(_s.XmlName.parts('fooEnumSet'), [],
            fooEnumSet.map((e) => _s.encodeXmlStringValue('member', e.value))),
      if (fooEnumMap != null)
        _s.XmlElement(
            _s.XmlName.parts('fooEnumMap'),
            [],
            fooEnumMap.entries.map((e) =>
                _s.XmlElement(_s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlStringValue('value', e.value.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlEnumsResponse {
  final FooEnum? fooEnum1;
  final FooEnum? fooEnum2;
  final FooEnum? fooEnum3;
  final List<FooEnum>? fooEnumList;
  final Map<String, FooEnum>? fooEnumMap;
  final List<FooEnum>? fooEnumSet;

  XmlEnumsResponse({
    this.fooEnum1,
    this.fooEnum2,
    this.fooEnum3,
    this.fooEnumList,
    this.fooEnumMap,
    this.fooEnumSet,
  });
  factory XmlEnumsResponse.fromXml(_s.XmlElement elem) {
    return XmlEnumsResponse(
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

class XmlIntEnumsRequest {
  final int? intEnum1;
  final int? intEnum2;
  final int? intEnum3;
  final List<int>? intEnumList;
  final Map<String, int>? intEnumMap;
  final List<int>? intEnumSet;

  XmlIntEnumsRequest({
    this.intEnum1,
    this.intEnum2,
    this.intEnum3,
    this.intEnumList,
    this.intEnumMap,
    this.intEnumSet,
  });

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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final intEnum1 = this.intEnum1;
    final intEnum2 = this.intEnum2;
    final intEnum3 = this.intEnum3;
    final intEnumList = this.intEnumList;
    final intEnumMap = this.intEnumMap;
    final intEnumSet = this.intEnumSet;
    final $children = <_s.XmlNode>[
      if (intEnum1 != null) _s.encodeXmlIntValue('intEnum1', intEnum1),
      if (intEnum2 != null) _s.encodeXmlIntValue('intEnum2', intEnum2),
      if (intEnum3 != null) _s.encodeXmlIntValue('intEnum3', intEnum3),
      if (intEnumList != null)
        _s.XmlElement(_s.XmlName.parts('intEnumList'), [],
            intEnumList.map((e) => _s.encodeXmlIntValue('member', e))),
      if (intEnumSet != null)
        _s.XmlElement(_s.XmlName.parts('intEnumSet'), [],
            intEnumSet.map((e) => _s.encodeXmlIntValue('member', e))),
      if (intEnumMap != null)
        _s.XmlElement(
            _s.XmlName.parts('intEnumMap'),
            [],
            intEnumMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  _s.encodeXmlIntValue('value', e.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlIntEnumsResponse {
  final int? intEnum1;
  final int? intEnum2;
  final int? intEnum3;
  final List<int>? intEnumList;
  final Map<String, int>? intEnumMap;
  final List<int>? intEnumSet;

  XmlIntEnumsResponse({
    this.intEnum1,
    this.intEnum2,
    this.intEnum3,
    this.intEnumList,
    this.intEnumMap,
    this.intEnumSet,
  });
  factory XmlIntEnumsResponse.fromXml(_s.XmlElement elem) {
    return XmlIntEnumsResponse(
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

class XmlListsRequest {
  final List<bool>? booleanList;
  final List<FooEnum>? enumList;
  final List<String>? flattenedList;
  final List<String>? flattenedList2;
  final List<String>? flattenedListWithMemberNamespace;
  final List<String>? flattenedListWithNamespace;
  final List<StructureListMember>? flattenedStructureList;
  final List<int>? intEnumList;
  final List<int>? integerList;
  final List<List<String>>? nestedStringList;
  final List<String>? renamedListMembers;
  final List<String>? stringList;
  final List<String>? stringSet;
  final List<StructureListMember>? structureList;
  final List<DateTime>? timestampList;

  XmlListsRequest({
    this.booleanList,
    this.enumList,
    this.flattenedList,
    this.flattenedList2,
    this.flattenedListWithMemberNamespace,
    this.flattenedListWithNamespace,
    this.flattenedStructureList,
    this.intEnumList,
    this.integerList,
    this.nestedStringList,
    this.renamedListMembers,
    this.stringList,
    this.stringSet,
    this.structureList,
    this.timestampList,
  });

  Map<String, dynamic> toJson() {
    final booleanList = this.booleanList;
    final enumList = this.enumList;
    final flattenedList = this.flattenedList;
    final flattenedList2 = this.flattenedList2;
    final flattenedListWithMemberNamespace =
        this.flattenedListWithMemberNamespace;
    final flattenedListWithNamespace = this.flattenedListWithNamespace;
    final flattenedStructureList = this.flattenedStructureList;
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
      if (flattenedStructureList != null)
        'flattenedStructureList': flattenedStructureList,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final booleanList = this.booleanList;
    final enumList = this.enumList;
    final flattenedList = this.flattenedList;
    final flattenedList2 = this.flattenedList2;
    final flattenedListWithMemberNamespace =
        this.flattenedListWithMemberNamespace;
    final flattenedListWithNamespace = this.flattenedListWithNamespace;
    final flattenedStructureList = this.flattenedStructureList;
    final intEnumList = this.intEnumList;
    final integerList = this.integerList;
    final nestedStringList = this.nestedStringList;
    final renamedListMembers = this.renamedListMembers;
    final stringList = this.stringList;
    final stringSet = this.stringSet;
    final structureList = this.structureList;
    final timestampList = this.timestampList;
    final $children = <_s.XmlNode>[
      if (stringList != null)
        _s.XmlElement(_s.XmlName.parts('stringList'), [],
            stringList.map((e) => _s.encodeXmlStringValue('member', e))),
      if (stringSet != null)
        _s.XmlElement(_s.XmlName.parts('stringSet'), [],
            stringSet.map((e) => _s.encodeXmlStringValue('member', e))),
      if (integerList != null)
        _s.XmlElement(_s.XmlName.parts('integerList'), [],
            integerList.map((e) => _s.encodeXmlIntValue('member', e))),
      if (booleanList != null)
        _s.XmlElement(_s.XmlName.parts('booleanList'), [],
            booleanList.map((e) => _s.encodeXmlBoolValue('member', e))),
      if (timestampList != null)
        _s.XmlElement(_s.XmlName.parts('timestampList'), [],
            timestampList.map((e) => _s.encodeXmlDateTimeValue('member', e))),
      if (enumList != null)
        _s.XmlElement(_s.XmlName.parts('enumList'), [],
            enumList.map((e) => _s.encodeXmlStringValue('member', e.value))),
      if (intEnumList != null)
        _s.XmlElement(_s.XmlName.parts('intEnumList'), [],
            intEnumList.map((e) => _s.encodeXmlIntValue('member', e))),
      if (nestedStringList != null)
        _s.XmlElement(
            _s.XmlName.parts('nestedStringList'),
            [],
            nestedStringList.map((e) => _s.XmlElement(
                _s.XmlName.parts('member'),
                [],
                e.map((e) => _s.encodeXmlStringValue('member', e))))),
      if (renamedListMembers != null)
        _s.XmlElement(_s.XmlName.parts('renamed'), [],
            renamedListMembers.map((e) => _s.encodeXmlStringValue('item', e))),
      if (flattenedList != null)
        ...flattenedList
            .map((e) => _s.encodeXmlStringValue('flattenedList', e)),
      if (flattenedList2 != null)
        ...flattenedList2.map((e) => _s.encodeXmlStringValue('customName', e)),
      if (flattenedListWithMemberNamespace != null)
        ...flattenedListWithMemberNamespace.map((e) =>
            _s.encodeXmlStringValue('flattenedListWithMemberNamespace', e)),
      if (flattenedListWithNamespace != null)
        ...flattenedListWithNamespace.map(
            (e) => _s.encodeXmlStringValue('flattenedListWithNamespace', e)),
      if (structureList != null)
        _s.XmlElement(_s.XmlName.parts('myStructureList'), [],
            structureList.map((e) => e.toXml('item'))),
      if (flattenedStructureList != null)
        ...flattenedStructureList.map((e) => e.toXml('flattenedStructureList')),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlListsResponse {
  final List<bool>? booleanList;
  final List<FooEnum>? enumList;
  final List<String>? flattenedList;
  final List<String>? flattenedList2;
  final List<String>? flattenedListWithMemberNamespace;
  final List<String>? flattenedListWithNamespace;
  final List<StructureListMember>? flattenedStructureList;
  final List<int>? intEnumList;
  final List<int>? integerList;
  final List<List<String>>? nestedStringList;
  final List<String>? renamedListMembers;
  final List<String>? stringList;
  final List<String>? stringSet;
  final List<StructureListMember>? structureList;
  final List<DateTime>? timestampList;

  XmlListsResponse({
    this.booleanList,
    this.enumList,
    this.flattenedList,
    this.flattenedList2,
    this.flattenedListWithMemberNamespace,
    this.flattenedListWithNamespace,
    this.flattenedStructureList,
    this.intEnumList,
    this.integerList,
    this.nestedStringList,
    this.renamedListMembers,
    this.stringList,
    this.stringSet,
    this.structureList,
    this.timestampList,
  });
  factory XmlListsResponse.fromXml(_s.XmlElement elem) {
    return XmlListsResponse(
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
      flattenedStructureList:
          elem.findElements('item').map(StructureListMember.fromXml).toList(),
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
    final flattenedStructureList = this.flattenedStructureList;
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
      if (flattenedStructureList != null)
        'flattenedStructureList': flattenedStructureList,
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

class XmlMapsRequest {
  final Map<String, GreetingStruct>? myMap;

  XmlMapsRequest({
    this.myMap,
  });

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final myMap = this.myMap;
    final $children = <_s.XmlNode>[
      if (myMap != null)
        _s.XmlElement(
            _s.XmlName.parts('myMap'),
            [],
            myMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('key', e.key),
                  e.value.toXml('value')
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlMapsResponse {
  final Map<String, GreetingStruct>? myMap;

  XmlMapsResponse({
    this.myMap,
  });
  factory XmlMapsResponse.fromXml(_s.XmlElement elem) {
    return XmlMapsResponse(
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

class XmlMapsXmlNameRequest {
  final Map<String, GreetingStruct>? myMap;

  XmlMapsXmlNameRequest({
    this.myMap,
  });

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'myMap': myMap,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final myMap = this.myMap;
    final $children = <_s.XmlNode>[
      if (myMap != null)
        _s.XmlElement(
            _s.XmlName.parts('myMap'),
            [],
            myMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('Attribute', e.key),
                  e.value.toXml('Setting')
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlMapsXmlNameResponse {
  final Map<String, GreetingStruct>? myMap;

  XmlMapsXmlNameResponse({
    this.myMap,
  });
  factory XmlMapsXmlNameResponse.fromXml(_s.XmlElement elem) {
    return XmlMapsXmlNameResponse(
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

class XmlMapWithXmlNamespaceRequest {
  final Map<String, String>? myMap;

  XmlMapWithXmlNamespaceRequest({
    this.myMap,
  });

  Map<String, dynamic> toJson() {
    final myMap = this.myMap;
    return {
      if (myMap != null) 'KVP': myMap,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final myMap = this.myMap;
    final $children = <_s.XmlNode>[
      if (myMap != null)
        _s.XmlElement(
            _s.XmlName.parts('KVP'),
            [],
            myMap.entries.map((e) => _s.XmlElement(
                    _s.XmlName.parts('entry'), [], <_s.XmlNode>[
                  _s.encodeXmlStringValue('K', e.key),
                  _s.encodeXmlStringValue('V', e.value)
                ]))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlMapWithXmlNamespaceResponse {
  final Map<String, String>? myMap;

  XmlMapWithXmlNamespaceResponse({
    this.myMap,
  });
  factory XmlMapWithXmlNamespaceResponse.fromXml(_s.XmlElement elem) {
    return XmlMapWithXmlNamespaceResponse(
      myMap: Map.fromEntries(
        elem.getElement('KVP')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'K')!,
                    _s.extractXmlStringValue(c, 'V')!,
                  ),
                ) ??
            {},
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

class XmlNamespacesRequest {
  final XmlNamespaceNested? nested;

  XmlNamespacesRequest({
    this.nested,
  });

  Map<String, dynamic> toJson() {
    final nested = this.nested;
    return {
      if (nested != null) 'nested': nested,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final nested = this.nested;
    final $children = <_s.XmlNode>[
      if (nested != null) nested.toXml('nested'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlNamespacesResponse {
  final XmlNamespaceNested? nested;

  XmlNamespacesResponse({
    this.nested,
  });
  factory XmlNamespacesResponse.fromXml(_s.XmlElement elem) {
    return XmlNamespacesResponse(
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

class XmlTimestampsRequest {
  final DateTime? dateTime;
  final DateTime? dateTimeOnTarget;
  final DateTime? epochSeconds;
  final DateTime? epochSecondsOnTarget;
  final DateTime? httpDate;
  final DateTime? httpDateOnTarget;
  final DateTime? normal;

  XmlTimestampsRequest({
    this.dateTime,
    this.dateTimeOnTarget,
    this.epochSeconds,
    this.epochSecondsOnTarget,
    this.httpDate,
    this.httpDateOnTarget,
    this.normal,
  });

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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final dateTime = this.dateTime;
    final dateTimeOnTarget = this.dateTimeOnTarget;
    final epochSeconds = this.epochSeconds;
    final epochSecondsOnTarget = this.epochSecondsOnTarget;
    final httpDate = this.httpDate;
    final httpDateOnTarget = this.httpDateOnTarget;
    final normal = this.normal;
    final $children = <_s.XmlNode>[
      if (normal != null) _s.encodeXmlDateTimeValue('normal', normal),
      if (dateTime != null)
        _s.encodeXmlDateTimeValue('dateTime', dateTime,
            formatter: _s.iso8601ToJson),
      if (dateTimeOnTarget != null)
        _s.encodeXmlDateTimeValue('dateTimeOnTarget', dateTimeOnTarget,
            formatter: _s.iso8601ToJson),
      if (epochSeconds != null)
        _s.encodeXmlDateTimeValue('epochSeconds', epochSeconds,
            formatter: _s.unixTimestampToJson),
      if (epochSecondsOnTarget != null)
        _s.encodeXmlDateTimeValue('epochSecondsOnTarget', epochSecondsOnTarget,
            formatter: _s.unixTimestampToJson),
      if (httpDate != null)
        _s.encodeXmlDateTimeValue('httpDate', httpDate,
            formatter: _s.rfc822ToJson),
      if (httpDateOnTarget != null)
        _s.encodeXmlDateTimeValue('httpDateOnTarget', httpDateOnTarget,
            formatter: _s.rfc822ToJson),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlTimestampsResponse {
  final DateTime? dateTime;
  final DateTime? dateTimeOnTarget;
  final DateTime? epochSeconds;
  final DateTime? epochSecondsOnTarget;
  final DateTime? httpDate;
  final DateTime? httpDateOnTarget;
  final DateTime? normal;

  XmlTimestampsResponse({
    this.dateTime,
    this.dateTimeOnTarget,
    this.epochSeconds,
    this.epochSecondsOnTarget,
    this.httpDate,
    this.httpDateOnTarget,
    this.normal,
  });
  factory XmlTimestampsResponse.fromXml(_s.XmlElement elem) {
    return XmlTimestampsResponse(
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

class XmlUnionsRequest {
  final XmlUnionShape? unionValue;

  XmlUnionsRequest({
    this.unionValue,
  });

  Map<String, dynamic> toJson() {
    final unionValue = this.unionValue;
    return {
      if (unionValue != null) 'unionValue': unionValue,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final unionValue = this.unionValue;
    final $children = <_s.XmlNode>[
      if (unionValue != null) unionValue.toXml('unionValue'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlUnionsResponse {
  final XmlUnionShape? unionValue;

  XmlUnionsResponse({
    this.unionValue,
  });
  factory XmlUnionsResponse.fromXml(_s.XmlElement elem) {
    return XmlUnionsResponse(
      unionValue:
          _s.extractXmlChild(elem, 'unionValue')?.let(XmlUnionShape.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final unionValue = this.unionValue;
    return {
      if (unionValue != null) 'unionValue': unionValue,
    };
  }
}

class XmlUnionShape {
  final bool? booleanValue;
  final int? byteValue;
  final double? doubleValue;
  final double? floatValue;
  final int? integerValue;
  final int? longValue;
  final int? shortValue;
  final String? stringValue;
  final XmlNestedUnionStruct? structValue;
  final XmlUnionShape? unionValue;

  XmlUnionShape({
    this.booleanValue,
    this.byteValue,
    this.doubleValue,
    this.floatValue,
    this.integerValue,
    this.longValue,
    this.shortValue,
    this.stringValue,
    this.structValue,
    this.unionValue,
  });
  factory XmlUnionShape.fromXml(_s.XmlElement elem) {
    return XmlUnionShape(
      booleanValue: _s.extractXmlBoolValue(elem, 'booleanValue'),
      byteValue: _s.extractXmlIntValue(elem, 'byteValue'),
      doubleValue: _s.extractXmlDoubleValue(elem, 'doubleValue'),
      floatValue: _s.extractXmlDoubleValue(elem, 'floatValue'),
      integerValue: _s.extractXmlIntValue(elem, 'integerValue'),
      longValue: _s.extractXmlIntValue(elem, 'longValue'),
      shortValue: _s.extractXmlIntValue(elem, 'shortValue'),
      stringValue: _s.extractXmlStringValue(elem, 'stringValue'),
      structValue: _s
          .extractXmlChild(elem, 'structValue')
          ?.let(XmlNestedUnionStruct.fromXml),
      unionValue:
          _s.extractXmlChild(elem, 'unionValue')?.let(XmlUnionShape.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final byteValue = this.byteValue;
    final doubleValue = this.doubleValue;
    final floatValue = this.floatValue;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final shortValue = this.shortValue;
    final stringValue = this.stringValue;
    final structValue = this.structValue;
    final unionValue = this.unionValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (byteValue != null) 'byteValue': byteValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (floatValue != null) 'floatValue': floatValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (longValue != null) 'longValue': longValue,
      if (shortValue != null) 'shortValue': shortValue,
      if (stringValue != null) 'stringValue': stringValue,
      if (structValue != null) 'structValue': structValue,
      if (unionValue != null) 'unionValue': unionValue,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final booleanValue = this.booleanValue;
    final byteValue = this.byteValue;
    final doubleValue = this.doubleValue;
    final floatValue = this.floatValue;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final shortValue = this.shortValue;
    final stringValue = this.stringValue;
    final structValue = this.structValue;
    final unionValue = this.unionValue;
    final $children = <_s.XmlNode>[
      if (stringValue != null)
        _s.encodeXmlStringValue('stringValue', stringValue),
      if (booleanValue != null)
        _s.encodeXmlBoolValue('booleanValue', booleanValue),
      if (byteValue != null) _s.encodeXmlIntValue('byteValue', byteValue),
      if (shortValue != null) _s.encodeXmlIntValue('shortValue', shortValue),
      if (integerValue != null)
        _s.encodeXmlIntValue('integerValue', integerValue),
      if (longValue != null) _s.encodeXmlIntValue('longValue', longValue),
      if (floatValue != null) _s.encodeXmlDoubleValue('floatValue', floatValue),
      if (doubleValue != null)
        _s.encodeXmlDoubleValue('doubleValue', doubleValue),
      if (unionValue != null) unionValue.toXml('unionValue'),
      if (structValue != null) structValue.toXml('structValue'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlNestedUnionStruct {
  final bool? booleanValue;
  final int? byteValue;
  final double? doubleValue;
  final double? floatValue;
  final int? integerValue;
  final int? longValue;
  final int? shortValue;
  final String? stringValue;

  XmlNestedUnionStruct({
    this.booleanValue,
    this.byteValue,
    this.doubleValue,
    this.floatValue,
    this.integerValue,
    this.longValue,
    this.shortValue,
    this.stringValue,
  });
  factory XmlNestedUnionStruct.fromXml(_s.XmlElement elem) {
    return XmlNestedUnionStruct(
      booleanValue: _s.extractXmlBoolValue(elem, 'booleanValue'),
      byteValue: _s.extractXmlIntValue(elem, 'byteValue'),
      doubleValue: _s.extractXmlDoubleValue(elem, 'doubleValue'),
      floatValue: _s.extractXmlDoubleValue(elem, 'floatValue'),
      integerValue: _s.extractXmlIntValue(elem, 'integerValue'),
      longValue: _s.extractXmlIntValue(elem, 'longValue'),
      shortValue: _s.extractXmlIntValue(elem, 'shortValue'),
      stringValue: _s.extractXmlStringValue(elem, 'stringValue'),
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final byteValue = this.byteValue;
    final doubleValue = this.doubleValue;
    final floatValue = this.floatValue;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final shortValue = this.shortValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (byteValue != null) 'byteValue': byteValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (floatValue != null) 'floatValue': floatValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (longValue != null) 'longValue': longValue,
      if (shortValue != null) 'shortValue': shortValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final booleanValue = this.booleanValue;
    final byteValue = this.byteValue;
    final doubleValue = this.doubleValue;
    final floatValue = this.floatValue;
    final integerValue = this.integerValue;
    final longValue = this.longValue;
    final shortValue = this.shortValue;
    final stringValue = this.stringValue;
    final $children = <_s.XmlNode>[
      if (stringValue != null)
        _s.encodeXmlStringValue('stringValue', stringValue),
      if (booleanValue != null)
        _s.encodeXmlBoolValue('booleanValue', booleanValue),
      if (byteValue != null) _s.encodeXmlIntValue('byteValue', byteValue),
      if (shortValue != null) _s.encodeXmlIntValue('shortValue', shortValue),
      if (integerValue != null)
        _s.encodeXmlIntValue('integerValue', integerValue),
      if (longValue != null) _s.encodeXmlIntValue('longValue', longValue),
      if (floatValue != null) _s.encodeXmlDoubleValue('floatValue', floatValue),
      if (doubleValue != null)
        _s.encodeXmlDoubleValue('doubleValue', doubleValue),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final foo = this.foo;
    final values = this.values;
    final $children = <_s.XmlNode>[
      if (foo != null) _s.encodeXmlStringValue('foo', foo),
      if (values != null)
        _s.XmlElement(_s.XmlName.parts('values'), [],
            values.map((e) => _s.encodeXmlStringValue('member', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      _s.XmlAttribute(_s.XmlName.parts('xmlns'), 'http://foo.com'),
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hi = this.hi;
    final $children = <_s.XmlNode>[
      if (hi != null) _s.encodeXmlStringValue('hi', hi),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final a = this.a;
    final b = this.b;
    final $children = <_s.XmlNode>[
      if (a != null) _s.encodeXmlStringValue('value', a),
      if (b != null) _s.encodeXmlStringValue('other', b),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
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

class XmlAttributesPayloadResponse {
  final String? attr;
  final String? foo;

  XmlAttributesPayloadResponse({
    this.attr,
    this.foo,
  });
  factory XmlAttributesPayloadResponse.fromXml(_s.XmlElement elem) {
    return XmlAttributesPayloadResponse(
      attr: _s.extractXmlStringAttribute(elem, 'test'),
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final attr = this.attr;
    final foo = this.foo;
    return {
      if (attr != null) 'test': attr,
      if (foo != null) 'foo': foo,
    };
  }
}

class XmlAttributesPayloadRequest {
  final String? attr;
  final String? foo;

  XmlAttributesPayloadRequest({
    this.attr,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final attr = this.attr;
    final foo = this.foo;
    return {
      if (attr != null) 'test': attr,
      if (foo != null) 'foo': foo,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final attr = this.attr;
    final foo = this.foo;
    final $children = <_s.XmlNode>[
      if (foo != null) _s.encodeXmlStringValue('foo', foo),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      if (attr != null) _s.XmlAttribute(_s.XmlName.parts('test'), attr),
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class XmlAttributesInMiddlePayloadResponse {
  final String? attr;
  final String? baz;
  final String? foo;

  XmlAttributesInMiddlePayloadResponse({
    this.attr,
    this.baz,
    this.foo,
  });
  factory XmlAttributesInMiddlePayloadResponse.fromXml(_s.XmlElement elem) {
    return XmlAttributesInMiddlePayloadResponse(
      attr: _s.extractXmlStringAttribute(elem, 'test'),
      baz: _s.extractXmlStringValue(elem, 'baz'),
      foo: _s.extractXmlStringValue(elem, 'foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final attr = this.attr;
    final baz = this.baz;
    final foo = this.foo;
    return {
      if (attr != null) 'test': attr,
      if (baz != null) 'baz': baz,
      if (foo != null) 'foo': foo,
    };
  }
}

class XmlAttributesInMiddlePayloadRequest {
  final String? attr;
  final String? baz;
  final String? foo;

  XmlAttributesInMiddlePayloadRequest({
    this.attr,
    this.baz,
    this.foo,
  });

  Map<String, dynamic> toJson() {
    final attr = this.attr;
    final baz = this.baz;
    final foo = this.foo;
    return {
      if (attr != null) 'test': attr,
      if (baz != null) 'baz': baz,
      if (foo != null) 'foo': foo,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final attr = this.attr;
    final baz = this.baz;
    final foo = this.foo;
    final $children = <_s.XmlNode>[
      if (foo != null) _s.encodeXmlStringValue('foo', foo),
      if (baz != null) _s.encodeXmlStringValue('baz', baz),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      if (attr != null) _s.XmlAttribute(_s.XmlName.parts('test'), attr),
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class RecursiveShapesInputOutputNested1 {
  final String? foo;
  final RecursiveShapesInputOutputNested2? nested;

  RecursiveShapesInputOutputNested1({
    this.foo,
    this.nested,
  });
  factory RecursiveShapesInputOutputNested1.fromXml(_s.XmlElement elem) {
    return RecursiveShapesInputOutputNested1(
      foo: _s.extractXmlStringValue(elem, 'foo'),
      nested: _s
          .extractXmlChild(elem, 'nested')
          ?.let(RecursiveShapesInputOutputNested2.fromXml),
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final foo = this.foo;
    final nested = this.nested;
    final $children = <_s.XmlNode>[
      if (foo != null) _s.encodeXmlStringValue('foo', foo),
      if (nested != null) nested.toXml('nested'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class RecursiveShapesInputOutputNested2 {
  final String? bar;
  final RecursiveShapesInputOutputNested1? recursiveMember;

  RecursiveShapesInputOutputNested2({
    this.bar,
    this.recursiveMember,
  });
  factory RecursiveShapesInputOutputNested2.fromXml(_s.XmlElement elem) {
    return RecursiveShapesInputOutputNested2(
      bar: _s.extractXmlStringValue(elem, 'bar'),
      recursiveMember: _s
          .extractXmlChild(elem, 'recursiveMember')
          ?.let(RecursiveShapesInputOutputNested1.fromXml),
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bar = this.bar;
    final recursiveMember = this.recursiveMember;
    final $children = <_s.XmlNode>[
      if (bar != null) _s.encodeXmlStringValue('bar', bar),
      if (recursiveMember != null) recursiveMember.toXml('recursiveMember'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class PayloadWithXmlNamespaceAndPrefix {
  final String? name;

  PayloadWithXmlNamespaceAndPrefix({
    this.name,
  });
  factory PayloadWithXmlNamespaceAndPrefix.fromXml(_s.XmlElement elem) {
    return PayloadWithXmlNamespaceAndPrefix(
      name: _s.extractXmlStringValue(elem, 'name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('name', name),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      _s.XmlAttribute(
          _s.XmlName.parts('baz', prefix: 'xmlns'), 'http://foo.com'),
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class PayloadWithXmlNamespace {
  final String? name;

  PayloadWithXmlNamespace({
    this.name,
  });
  factory PayloadWithXmlNamespace.fromXml(_s.XmlElement elem) {
    return PayloadWithXmlNamespace(
      name: _s.extractXmlStringValue(elem, 'name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('name', name),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
      _s.XmlAttribute(_s.XmlName.parts('xmlns'), 'http://foo.com'),
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class PayloadWithXmlName {
  final String? name;

  PayloadWithXmlName({
    this.name,
  });
  factory PayloadWithXmlName.fromXml(_s.XmlElement elem) {
    return PayloadWithXmlName(
      name: _s.extractXmlStringValue(elem, 'name'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('name', name),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class UnionPayload {
  final String? greeting;

  UnionPayload({
    this.greeting,
  });
  factory UnionPayload.fromXml(_s.XmlElement elem) {
    return UnionPayload(
      greeting: _s.extractXmlStringValue(elem, 'greeting'),
    );
  }

  Map<String, dynamic> toJson() {
    final greeting = this.greeting;
    return {
      if (greeting != null) 'greeting': greeting,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final greeting = this.greeting;
    final $children = <_s.XmlNode>[
      if (greeting != null) _s.encodeXmlStringValue('greeting', greeting),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
  }
}

class NestedPayload {
  final String? greeting;
  final String? name;

  NestedPayload({
    this.greeting,
    this.name,
  });
  factory NestedPayload.fromXml(_s.XmlElement elem) {
    return NestedPayload(
      greeting: _s.extractXmlStringValue(elem, 'greeting'),
      name: _s.extractXmlStringValue(elem, 'name'),
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final greeting = this.greeting;
    final name = this.name;
    final $children = <_s.XmlNode>[
      if (greeting != null) _s.encodeXmlStringValue('greeting', greeting),
      if (name != null) _s.encodeXmlStringValue('name', name),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName.parts(elemName),
      $attributes,
      $children,
    );
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

class ComplexNestedErrorData {
  final String? foo;

  ComplexNestedErrorData({
    this.foo,
  });
  factory ComplexNestedErrorData.fromXml(_s.XmlElement elem) {
    return ComplexNestedErrorData(
      foo: _s.extractXmlStringValue(elem, 'Foo'),
    );
  }

  Map<String, dynamic> toJson() {
    final foo = this.foo;
    return {
      if (foo != null) 'Foo': foo,
    };
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ComplexError': (type, message) => ComplexError(),
  'InvalidGreeting': (type, message) => InvalidGreeting(message: message),
};
