// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2018_01_01.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('AwsJson11SerializeStringUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "stringValue": "foo"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeBooleanUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "booleanValue": true
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeNumberUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "numberValue": 1
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeBlobUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "blobValue": "Zm9v"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeTimestampUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "timestampValue": 1398796238
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeEnumUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "enumValue": "Foo"
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeListUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "listValue": ["foo", "bar"]
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeMapUnionValue', () async {
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
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11SerializeStructureUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "structureValue": {
            "hi": "hello"
        }
    }
}'''));
      expect(request.headers['Content-Type'],
          startsWith('application/x-amz-json-1.1'));
      expect(request.headers['X-Amz-Target'], 'JsonProtocol.JsonUnions');
      expect(request.url, equalsPathAndQuery('/'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = JsonProtocol(
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

  test('AwsJson11DeserializeStringUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "stringValue": "foo"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, "foo");
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeBooleanUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "booleanValue": true
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, true);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeNumberUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "numberValue": 1
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, 1);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeBlobUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "blobValue": "Zm9v"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, utf8.encode('foo'));
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeTimestampUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "timestampValue": 1398796238
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents!.timestampValue!.millisecondsSinceEpoch / 1000,
        1398796238);
  });

  test('AwsJson11DeserializeEnumUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "enumValue": "Foo"
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, FooEnum.foo);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeListUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "listValue": ["foo", "bar"]
    }
}''',
          200,
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue?[0], "foo");
    expect(output.contents?.listValue?[1], "bar");
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeMapUnionValue', () async {
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
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue?['foo'], "bar");
    expect(output.contents?.mapValue?['spam'], "eggs");
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeStructureUnionValue', () async {
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
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });

  test('AwsJson11DeserializeIgnoreType', () async {
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
          headers: {"Content-Type": "application/x-amz-json-1.1"});
    });

    final service = JsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.jsonUnions();
    expect(output.contents?.blobValue, isNull);
    expect(output.contents?.booleanValue, isNull);
    expect(output.contents?.enumValue, isNull);
    expect(output.contents?.listValue, isNull);
    expect(output.contents?.mapValue, isNull);
    expect(output.contents?.numberValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });
}
