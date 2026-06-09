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
  test('RestJsonJsonMaps', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "denseStructMap": {
        "foo": {
            "hi": "there"
        },
        "baz": {
            "hi": "bye"
        }
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonMaps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonMaps(
      denseStructMap: {
        "foo": SharedGreetingStruct(
          hi: "there",
        ),
        "baz": SharedGreetingStruct(
          hi: "bye",
        ),
      },
    );
  });

  test('RestJsonSerializesZeroValuesInMaps', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "denseNumberMap": {
        "x": 0
    },
    "denseBooleanMap": {
        "x": false
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonMaps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonMaps(
      denseBooleanMap: {
        "x": false,
      },
      denseNumberMap: {
        "x": 0,
      },
    );
  });

  test('RestJsonSerializesDenseSetMap', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsJson(r'''{
    "denseSetMap": {
        "x": [],
        "y": ["a", "b"]
    }
}'''));
      expect(request.headers['Content-Type'], startsWith('application/json'));
      expect(request.url, equalsPathAndQuery('/JsonMaps'));
      expect(request.method, equalsIgnoringCase('POST'));
      return Response('{}', 200);
    });

    final service = RestJsonProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.jsonMaps(
      denseSetMap: {
        "x": [],
        "y": ["a", "b"],
      },
    );
  });

  test('RestJsonJsonMaps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "denseStructMap": {
        "foo": {
            "hi": "there"
        },
        "baz": {
            "hi": "bye"
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

    final output = await service.jsonMaps();
    expect(output.denseBooleanMap, isNull);
    expect(output.denseNumberMap, isNull);
    expect(output.denseSetMap, isNull);
    expect(output.denseStringMap, isNull);
    expect(output.denseStructMap?['foo']?.hi, "there");
    expect(output.denseStructMap?['baz']?.hi, "bye");
  });

  test('RestJsonDeserializesZeroValuesInMaps', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "denseNumberMap": {
        "x": 0
    },
    "denseBooleanMap": {
        "x": false
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

    final output = await service.jsonMaps();
    expect(output.denseBooleanMap?['x'], false);
    expect(output.denseNumberMap?['x'], 0);
    expect(output.denseSetMap, isNull);
    expect(output.denseStringMap, isNull);
    expect(output.denseStructMap, isNull);
  });

  test('RestJsonDeserializesDenseSetMap', () async {
    final client = MockClient((request) async {
      return Response(
          r'''{
    "denseSetMap": {
        "x": [],
        "y": ["a", "b"]
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

    final output = await service.jsonMaps();
    expect(output.denseBooleanMap, isNull);
    expect(output.denseNumberMap, isNull);
    expect(output.denseSetMap?['y']?[0], "a");
    expect(output.denseSetMap?['y']?[1], "b");
    expect(output.denseStringMap, isNull);
    expect(output.denseStructMap, isNull);
  });
}
