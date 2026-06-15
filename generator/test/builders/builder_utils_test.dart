import 'dart:convert';
import 'package:aws_client_generator/builders/builder_utils.dart';
import 'package:aws_client_generator/model/api.dart';
import 'package:test/test.dart';

void main() {
  group('encodeJsonCode', () {
    test('generates correct default timestamp format for query protocol', () {
      final api = Api.fromJson(jsonDecode('''
{
  "version": "2.0",
  "metadata": {
    "apiVersion": "2010-08-01",
    "endpointPrefix": "monitoring",
    "protocol": "query",
    "serviceFullName": "Amazon CloudWatch"
  },
  "operations": {},
  "shapes": {
    "MetricDatum": {
      "type": "structure",
      "members": {
        "Timestamp": {
          "shape": "Timestamp"
        }
      }
    },
    "Timestamp": {
      "type": "timestamp"
    }
  }
}
''') as Map<String, dynamic>);
      final member = api.shapes['MetricDatum']!.membersMap!['Timestamp']!;
      member.api = api;
      final shape = api.shapes['Timestamp']!;
      final result = encodeJsonCode(shape, 'time',
          member: member, nullability: Nullability.inputOutput);
      expect(result, 'iso8601ToJson(time)');
    });
  });

  group('extractJsonCode error-corrects missing required output members', () {
    // A `@required` output member maps to Nullability.input (the JSON value may
    // be absent, but the Dart field is non-nullable). Per the Smithy spec,
    // clients MAY fill a type-appropriate default rather than throw on a
    // non-null cast of a missing value.
    final api = Api.fromJson(jsonDecode('''
{
  "version": "2.0",
  "metadata": {
    "apiVersion": "2020-01-01",
    "endpointPrefix": "demo",
    "protocol": "json",
    "jsonVersion": "1.1",
    "targetPrefix": "Demo",
    "serviceFullName": "Demo"
  },
  "operations": {},
  "shapes": {
    "StringList": {"type": "list", "member": {"shape": "Str"}},
    "StringMap": {
      "type": "map",
      "key": {"shape": "Str"},
      "value": {"shape": "Str"}
    },
    "Inner": {"type": "structure", "members": {"Name": {"shape": "Str"}}},
    "Str": {"type": "string"},
    "Bool": {"type": "boolean"},
    "Int": {"type": "integer"},
    "Dbl": {"type": "double"},
    "Ts": {"type": "timestamp"},
    "Blb": {"type": "blob"}
  }
}
''') as Map<String, dynamic>)..initReferences();

    String required(String shapeName) =>
        extractJsonCode(api.shapes[shapeName]!, "json['X']",
            nullability: Nullability.input);

    test('list defaults to an empty list', () {
      expect(required('StringList'),
          "((json['X'] as List?) ?? const []).nonNulls.map((e) => e as String).toList()");
    });

    test('map defaults to an empty map', () {
      expect(
          required('StringMap'),
          "((json['X'] as Map<String, dynamic>?) ?? const <String, dynamic>{})"
          '.map((k, e) => MapEntry(k, e as String))');
    });

    test('structure defaults to an empty structure (all-null members)', () {
      expect(required('Inner'),
          "Inner.fromJson((json['X'] as Map<String, dynamic>?) ?? const <String, dynamic>{})");
    });

    test('string defaults to empty string', () {
      expect(required('Str'), "(json['X'] as String?) ?? ''");
    });

    test('boolean defaults to false', () {
      expect(required('Bool'), "(json['X'] as bool?) ?? false");
    });

    test('integer defaults to zero', () {
      expect(required('Int'), "(json['X'] as int?) ?? 0");
    });

    test('double defaults to zero', () {
      expect(required('Dbl'), "(json['X'] as double?) ?? 0");
    });

    test('timestamp defaults to the unix epoch', () {
      expect(required('Ts'), "nonNullableTimeStampFromJson(json['X'] ?? 0)");
    });

    test('blob defaults to empty bytes', () {
      expect(
          required('Blb'), "_s.decodeUint8List((json['X'] as String?) ?? '')");
    });

    test('optional output members stay null-aware, not defaulted', () {
      final optional = extractJsonCode(api.shapes['StringList']!, "json['X']",
          nullability: Nullability.inputOutput);
      expect(optional, contains('as List?)?'));
      expect(optional, isNot(contains('?? const')));
    });

    test('nested (guaranteed-present) values keep a strict cast', () {
      // Nullability.none models a value extracted from inside a list/map, which
      // is never null — it must NOT be error-corrected (keeps output stable).
      final nested = extractJsonCode(api.shapes['Str']!, 'e',
          nullability: Nullability.none);
      expect(nested, 'e as String');
    });

    group('open enums', () {
      final enumApi = Api.fromJson(jsonDecode('''
{
  "version": "2.0",
  "metadata": {
    "apiVersion": "2020-01-01",
    "endpointPrefix": "demo",
    "protocol": "json",
    "jsonVersion": "1.1",
    "targetPrefix": "Demo",
    "serviceFullName": "Demo"
  },
  "operations": {},
  "shapes": {
    "Color": {"type": "string", "enum": ["RED", "GREEN"]}
  }
}
''') as Map<String, dynamic>)..initReferences();

      test('required-but-absent value falls back to an unknown member', () {
        // Open enums never throw, so a missing required value is corrected to
        // '' and wrapped by fromString rather than crashing on a null cast.
        final result = extractJsonCode(enumApi.shapes['Color']!, "json['X']",
            nullability: Nullability.input);
        expect(result, "Color.fromString((json['X'] as String?) ?? '')");
      });

      test('optional value stays null-aware', () {
        final result = extractJsonCode(enumApi.shapes['Color']!, "json['X']",
            nullability: Nullability.inputOutput);
        expect(result, "(json['X'] as String?)?.let(Color.fromString)");
      });
    });
  });
}
