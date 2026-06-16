// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2019_12_16.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('SimpleScalarProperties', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <stringValue>string</stringValue>
    <trueBooleanValue>true</trueBooleanValue>
    <falseBooleanValue>false</falseBooleanValue>
    <byteValue>1</byteValue>
    <shortValue>2</shortValue>
    <integerValue>3</integerValue>
    <longValue>4</longValue>
    <floatValue>5.5</floatValue>
    <DoubleDribble>6.5</DoubleDribble>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      byteValue: 1,
      doubleValue: 6.5,
      falseBooleanValue: false,
      floatValue: 5.5,
      foo: "Foo",
      integerValue: 3,
      longValue: 4,
      shortValue: 2,
      stringValue: "string",
      trueBooleanValue: true,
    );
  });

  test('SimpleScalarPropertiesWithEscapedCharacter', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <stringValue>&lt;string&gt;</stringValue>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      foo: "Foo",
      stringValue: "<string>",
    );
  });

  test('SimpleScalarPropertiesWithWhiteSpace', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <stringValue>  string with white    space  </stringValue>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      foo: "Foo",
      stringValue: "  string with white    space  ",
    );
  });

  test('SimpleScalarPropertiesPureWhiteSpace', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <stringValue>   </stringValue>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.headers['X-Foo'], 'Foo');
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      foo: "Foo",
      stringValue: "   ",
    );
  });

  test('RestXmlSupportsNaNFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <floatValue>NaN</floatValue>
    <DoubleDribble>NaN</DoubleDribble>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.nan,
      floatValue: double.nan,
    );
  });

  test('RestXmlSupportsInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <floatValue>Infinity</floatValue>
    <DoubleDribble>Infinity</DoubleDribble>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.infinity,
      floatValue: double.infinity,
    );
  });

  test('RestXmlSupportsNegativeInfinityFloatInputs', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<SimpleScalarPropertiesRequest>
    <floatValue>-Infinity</floatValue>
    <DoubleDribble>-Infinity</DoubleDribble>
</SimpleScalarPropertiesRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/SimpleScalarProperties'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.simpleScalarProperties(
      doubleValue: double.negativeInfinity,
      floatValue: double.negativeInfinity,
    );
  });

  test('SimpleScalarProperties', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarPropertiesResponse>
    <stringValue>string</stringValue>
    <trueBooleanValue>true</trueBooleanValue>
    <falseBooleanValue>false</falseBooleanValue>
    <byteValue>1</byteValue>
    <shortValue>2</shortValue>
    <integerValue>3</integerValue>
    <longValue>4</longValue>
    <floatValue>5.5</floatValue>
    <DoubleDribble>6.5</DoubleDribble>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml", "X-Foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, 1);
    expect(output.doubleValue, 6.5);
    expect(output.falseBooleanValue, false);
    expect(output.floatValue, 5.5);
    expect(output.foo, "Foo");
    expect(output.integerValue, 3);
    expect(output.longValue, 4);
    expect(output.shortValue, 2);
    expect(output.stringValue, "string");
    expect(output.trueBooleanValue, true);
  });

  test('SimpleScalarPropertiesComplexEscapes', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarPropertiesResponse>
    <stringValue>escaped data: &amp;lt;&#xD;&#10;</stringValue>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml", "X-Foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, "Foo");
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, "escaped data: &lt;\r\n");
    expect(output.trueBooleanValue, isNull);
  });

  test('SimpleScalarPropertiesWithEscapedCharacter', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarPropertiesResponse>
    <stringValue>&lt;string&gt;</stringValue>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml", "X-Foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, "Foo");
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, "<string>");
    expect(output.trueBooleanValue, isNull);
  });

  test('SimpleScalarPropertiesWithXMLPreamble', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<?xml version = "1.0" encoding = "UTF-8"?>
<SimpleScalarPropertiesResponse>
    <![CDATA[characters representing CDATA]]>
    <stringValue>string</stringValue>
    <!--xml comment-->
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml", "X-Foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, "Foo");
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, "string");
    expect(output.trueBooleanValue, isNull);
  });

  test('SimpleScalarPropertiesWithWhiteSpace', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<?xml version = "1.0" encoding = "UTF-8"?>
<SimpleScalarPropertiesResponse>
    <stringValue> string with white    space </stringValue>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml", "X-Foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, "Foo");
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, " string with white    space ");
    expect(output.trueBooleanValue, isNull);
  });

  test('SimpleScalarPropertiesPureWhiteSpace', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<?xml version = "1.0" encoding = "UTF-8"?>
<SimpleScalarPropertiesResponse>
    <stringValue>  </stringValue>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml", "X-Foo": "Foo"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNull);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNull);
    expect(output.foo, "Foo");
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, "  ");
    expect(output.trueBooleanValue, isNull);
  });

  test('RestXmlSupportsNaNFloatOutputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarPropertiesResponse>
    <floatValue>NaN</floatValue>
    <DoubleDribble>NaN</DoubleDribble>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, isNaN);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, isNaN);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });

  test('RestXmlSupportsInfinityFloatOutputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarPropertiesResponse>
    <floatValue>Infinity</floatValue>
    <DoubleDribble>Infinity</DoubleDribble>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, double.infinity);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, double.infinity);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });

  test('RestXmlSupportsNegativeInfinityFloatOutputs', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SimpleScalarPropertiesResponse>
    <floatValue>-Infinity</floatValue>
    <DoubleDribble>-Infinity</DoubleDribble>
</SimpleScalarPropertiesResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.simpleScalarProperties();
    expect(output.byteValue, isNull);
    expect(output.doubleValue, double.negativeInfinity);
    expect(output.falseBooleanValue, isNull);
    expect(output.floatValue, double.negativeInfinity);
    expect(output.foo, isNull);
    expect(output.integerValue, isNull);
    expect(output.longValue, isNull);
    expect(output.shortValue, isNull);
    expect(output.stringValue, isNull);
    expect(output.trueBooleanValue, isNull);
  });
}
