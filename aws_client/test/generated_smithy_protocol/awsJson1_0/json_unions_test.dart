// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_07_14.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('AwsJson10SerializeStringUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "stringValue": "foo"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        stringValue: "foo",
      ),
    );
  });

  test('AwsJson10SerializeBooleanUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "booleanValue": true
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        booleanValue: true,
      ),
    );
  });

  test('AwsJson10SerializeNumberUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "numberValue": 1
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        numberValue: 1,
      ),
    );
  });

  test('AwsJson10SerializeBlobUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "blobValue": "Zm9v"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        blobValue: Uint8List.fromList('foo'.codeUnits),
      ),
    );
  });

  test('AwsJson10SerializeTimestampUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "timestampValue": 1398796238
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        timestampValue: DateTime.fromMillisecondsSinceEpoch(1398796238 * 1000),
      ),
    );
  });

  test('AwsJson10SerializeEnumUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "enumValue": "Foo"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        enumValue: FooEnum.foo,
      ),
    );
  });

  test('AwsJson10SerializeIntEnumUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "intEnumValue": 1
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        intEnumValue: 1,
      ),
    );
  });

  test('AwsJson10SerializeListUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "listValue": ["foo", "bar"]
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        listValue: ["foo", "bar"],
      ),
    );
  });

  test('AwsJson10SerializeMapUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "mapValue": {
            "foo": "bar",
            "spam": "eggs"
        }
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        mapValue: {
          "foo": "bar",
          "spam": "eggs",
        },
      ),
    );
  });

  test('AwsJson10SerializeStructureUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "structureValue": {
            "hi": "hello"
        }
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.0'));
      expect(request.headers['X-Amz-Target'], 'JsonRpc10.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        structureValue: GreetingStruct(
          hi: "hello",
        ),
      ),
    );
  });

  test('AwsJson10DeserializeStringUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "stringValue": "foo"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, "foo");
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeBooleanUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "booleanValue": true
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, true);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeNumberUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "numberValue": 1
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, 1);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeBlobUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "blobValue": "Zm9v"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, utf8.encode('foo'));
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeTimestampUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "timestampValue": 1398796238
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents!.timestampValue!.millisecondsSinceEpoch / 1000,
        1398796238);
  });

  test('AwsJson10DeserializeEnumUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "enumValue": "Foo"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, FooEnum.foo);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeIntEnumUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "intEnumValue": 1
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, 1);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeListUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "listValue": ["foo", "bar"]
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue?[0], "foo");
    expect(output.contents?.listValue?[1], "bar");
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeMapUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "mapValue": {
            "foo": "bar",
            "spam": "eggs"
        }
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue?['foo'], "bar");
    expect(output.contents?.mapValue?['spam'], "eggs");
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeStructureUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "structureValue": {
            "hi": "hello"
        }
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeIgnoreType', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "__type": "aws.protocoltests.json10#MyUnion",
        "structureValue": {
            "hi": "hello"
        }
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson10DeserializeAllowNulls', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
      "stringValue": null,
      "booleanValue": null,
      "numberValue": null,
      "blobValue": null,
      "timestampValue": null,
      "enumValue": null,
      "intEnumValue": null,
      "listValue": null,
      "mapValue": null,
      "structureValue": {
          "hi": "hello"
      }
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.0"});
    });

    final service = JsonRpc10(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.intEnumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });
}
