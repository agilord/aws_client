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
  test('RestJsonSerializeStringUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "stringValue": "foo"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeBooleanUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "booleanValue": true
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeNumberUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "numberValue": 1
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeBlobUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "blobValue": "Zm9v"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeTimestampUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "timestampValue": 1398796238
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeEnumUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "enumValue": "Foo"
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeListUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "listValue": ["foo", "bar"]
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeMapUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "mapValue": {
            "foo": "bar",
            "spam": "eggs"
        }
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
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

  test('RestJsonSerializeStructureUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "structureValue": {
            "hi": "hello"
        }
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        structureValue: SharedGreetingStruct(
          hi: "hello",
        ),
      ),
    );
  });

  test('RestJsonSerializeRenamedStructureUnionValue', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "contents": {
        "renamedStructureValue": {
            "salutation": "hello!"
        }
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonUnions'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonUnions(
      contents: MyUnion(
        renamedStructureValue: NestedGreetingStruct(
          salutation: "hello!",
        ),
      ),
    );
  });

  test('RestJsonDeserializeStringUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "stringValue": "foo"
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, "foo");
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeBooleanUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "booleanValue": true
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeNumberUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "numberValue": 1
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeBlobUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "blobValue": "Zm9v"
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeTimestampUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "timestampValue": 1398796238
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents!.timestampValue!.millisecondsSinceEpoch ~/ 1000,
        1398796238);
  });

  test('RestJsonDeserializeEnumUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "enumValue": "Foo"
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeListUnionValue', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "contents": {
        "listValue": ["foo", "bar"]
    }
}''',
          200,
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeMapUnionValue', () async {
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
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue, isNull);
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeStructureUnionValue', () async {
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
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });

  test('RestJsonDeserializeIgnoreType', () async {
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
          headers: {"Content-Type": "application/json"});
    });

    final service = RestJsonProtocol(
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
    expect(output.contents?.renamedStructureValue, isNull);
    expect(output.contents?.stringValue, isNull);
    expect(output.contents?.structureValue?.hi, "hello");
    expect(output.contents?.timestampValue, isNull);
  });
}
