import 'package:aws_client_generator/smithy/ast.dart';
import 'package:aws_client_generator/smithy/from_smithy.dart';
import 'package:test/test.dart';

SmithyModel _model(Map<String, Object?> shapes) =>
    SmithyModel.fromJson({'smithy': '2.0', 'shapes': shapes});

void main() {
  group('apiFromSmithy timestampFormat mapping', () {
    // Smithy names differ from AWS API names used in codegen (e.g. http-date →
    // rfc822); passing through unmapped yields invalid Dart like `http - dateToJson`.
    final model = _model({
      'example#MyService': {
        'type': 'service',
        'version': '2018-01-01',
        'operations': [
          {'target': 'example#MyOp'}
        ],
        'traits': {
          'aws.protocols#awsJson1_1': <String, Object?>{},
          'aws.api#service': {'sdkId': 'Example', 'endpointPrefix': 'example'},
          'aws.auth#sigv4': {'name': 'example'},
        },
      },
      'example#MyOp': {
        'type': 'operation',
        'input': {'target': 'example#MyInput'},
        'traits': <String, Object?>{},
      },
      'example#MyInput': {
        'type': 'structure',
        'members': {
          'httpdateTimestamp': {
            'target': 'smithy.api#Timestamp',
            'traits': {'smithy.api#timestampFormat': 'http-date'},
          },
          'datetimeTimestamp': {
            'target': 'smithy.api#Timestamp',
            'traits': {'smithy.api#timestampFormat': 'date-time'},
          },
          'epochTimestamp': {
            'target': 'smithy.api#Timestamp',
            'traits': {'smithy.api#timestampFormat': 'epoch-seconds'},
          },
          'plainTimestamp': {
            'target': 'example#HttpDateTs',
          },
        },
        'traits': <String, Object?>{},
      },
      'example#HttpDateTs': {
        'type': 'timestamp',
        'traits': {'smithy.api#timestampFormat': 'http-date'},
      },
    });

    final api = apiFromSmithy(model, uid: 'example-2018-01-01');
    final members = api.shapes['MyInput']!.membersMap!;

    test('http-date member maps to rfc822', () {
      expect(members['httpdateTimestamp']!.timestampFormat, 'rfc822');
    });

    test('date-time member maps to iso8601', () {
      expect(members['datetimeTimestamp']!.timestampFormat, 'iso8601');
    });

    test('epoch-seconds member maps to unixTimestamp', () {
      expect(members['epochTimestamp']!.timestampFormat, 'unixTimestamp');
    });

    test('shape-level http-date maps to rfc822', () {
      expect(api.shapes['HttpDateTs']!.timestampFormat, 'rfc822');
    });
  });

  group('apiFromSmithy shape-name collision disambiguation', () {
    SmithyModel collisionModel() => _model({
          'example#MyService': {
            'type': 'service',
            'version': '2018-01-01',
            'operations': [
              {'target': 'example#MyOp'}
            ],
            'traits': {
              'aws.protocols#awsJson1_1': <String, Object?>{},
              'aws.api#service': {
                'sdkId': 'Example',
                'endpointPrefix': 'example'
              },
              'aws.auth#sigv4': {'name': 'example'},
            },
          },
          'example#MyOp': {
            'type': 'operation',
            'input': {'target': 'example#MyInput'},
            'traits': <String, Object?>{},
          },
          'example#MyInput': {
            'type': 'structure',
            'members': {
              'shared': {'target': 'aws.protocoltests.shared#GreetingStruct'},
              'nested': {
                'target': 'aws.protocoltests.restjson.nested#GreetingStruct'
              },
            },
            'traits': <String, Object?>{},
          },
          'aws.protocoltests.shared#GreetingStruct': {
            'type': 'structure',
            'members': {
              'hi': {'target': 'smithy.api#String'},
            },
          },
          'aws.protocoltests.restjson.nested#GreetingStruct': {
            'type': 'structure',
            'members': {
              'salutation': {'target': 'smithy.api#String'},
            },
          },
        });

    test('does not throw on cross-namespace local-name collision', () {
      expect(
        () => apiFromSmithy(collisionModel(), uid: 'example-2018-01-01'),
        returnsNormally,
      );
    });

    test('both colliding structs are emitted under distinct names', () {
      final api = apiFromSmithy(collisionModel(), uid: 'example-2018-01-01');
      expect(api.shapes.containsKey('SharedGreetingStruct'), isTrue);
      expect(api.shapes.containsKey('NestedGreetingStruct'), isTrue);
      expect(api.shapes.containsKey('GreetingStruct'), isFalse);
    });

    test('disambiguated structs keep their own distinct members', () {
      final api = apiFromSmithy(collisionModel(), uid: 'example-2018-01-01');
      expect(api.shapes['SharedGreetingStruct']!.membersMap!.keys, ['hi']);
      expect(
          api.shapes['NestedGreetingStruct']!.membersMap!.keys, ['salutation']);
    });

    test('member references resolve to the correct disambiguated name', () {
      final api = apiFromSmithy(collisionModel(), uid: 'example-2018-01-01');
      final members = api.shapes['MyInput']!.membersMap!;
      expect(members['shared']!.shape, 'SharedGreetingStruct');
      expect(members['nested']!.shape, 'NestedGreetingStruct');
    });

    test('non-colliding shapes keep their bare local name', () {
      final api = apiFromSmithy(collisionModel(), uid: 'example-2018-01-01');
      expect(api.shapes.containsKey('MyInput'), isTrue);
    });
  });

  group('apiFromSmithy union member targeting smithy.api#Unit', () {
    // smithy.api#Unit has no shape definition; boundary must inject one so the
    // markUsed pass doesn't dangle and crash the build.
    final model = _model({
      'example#MyService': {
        'type': 'service',
        'version': '2018-01-01',
        'operations': [
          {'target': 'example#MyOp'}
        ],
        'traits': {
          'aws.protocols#restJson1': <String, Object?>{},
          'aws.api#service': {'sdkId': 'Example', 'endpointPrefix': 'example'},
          'aws.auth#sigv4': {'name': 'example'},
        },
      },
      'example#MyOp': {
        'type': 'operation',
        'input': {'target': 'example#MyInput'},
        'traits': {
          'smithy.api#http': {'method': 'POST', 'uri': '/op', 'code': 200},
        },
      },
      'example#MyInput': {
        'type': 'structure',
        'members': {
          'action': {'target': 'example#PlayerAction'},
        },
        'traits': <String, Object?>{},
      },
      'example#PlayerAction': {
        'type': 'union',
        'members': {
          'quit': {'target': 'smithy.api#Unit'},
          'move': {'target': 'smithy.api#String'},
        },
      },
    });

    final api = apiFromSmithy(model, uid: 'example-2018-01-01');

    test('the union member resolves to a Unit shape present in the map', () {
      final quit = api.shapes['PlayerAction']!.membersMap!['quit']!;
      expect(quit.shape, 'Unit');
      expect(api.shapes.containsKey('Unit'), isTrue);
    });

    test('the injected Unit shape is an empty structure', () {
      expect(api.shapes['Unit']!.type, 'structure');
      expect(api.shapes['Unit']!.membersMap, isEmpty);
    });
  });

  group('apiFromSmithy @mixin resolution', () {
    // `smithy ast` does not pre-flatten mixins: a structure `with [Mixin]`
    // arrives with empty `members` and a `mixins` ref. The adapter must merge
    // the mixin's members in, else they are silently dropped.
    final model = _model({
      'example#MyService': {
        'type': 'service',
        'version': '2018-01-01',
        'operations': [
          {'target': 'example#MyOp'}
        ],
        'traits': {
          'aws.protocols#awsJson1_1': <String, Object?>{},
          'aws.api#service': {'sdkId': 'Example', 'endpointPrefix': 'example'},
          'aws.auth#sigv4': {'name': 'example'},
        },
      },
      'example#MyOp': {
        'type': 'operation',
        'input': {'target': 'example#MyInput'},
        'traits': <String, Object?>{},
      },
      'example#MyInput': {
        'type': 'structure',
        'members': {
          'own': {'target': 'smithy.api#String'}
        },
        'mixins': [
          {'target': 'example#MyMixin'}
        ],
        'traits': <String, Object?>{},
      },
      'example#MyMixin': {
        'type': 'structure',
        'members': {
          'inherited': {'target': 'example#Nested'}
        },
        'traits': {'smithy.api#mixin': <String, Object?>{}},
      },
      'example#Nested': {
        'type': 'structure',
        'members': {
          'leaf': {'target': 'smithy.api#String'}
        },
        'traits': <String, Object?>{},
      },
    });

    final api = apiFromSmithy(model, uid: 'example-2018-01-01');

    test('mixin members are merged into the target structure', () {
      final members = api.shapes['MyInput']!.membersMap!;
      expect(members.keys, containsAll(<String>['own', 'inherited']));
    });

    test('the mixin shape itself is not emitted', () {
      expect(api.shapes.containsKey('MyMixin'), isFalse);
    });

    test('a shape reachable only via a mixin member is still emitted', () {
      expect(api.shapes.containsKey('Nested'), isTrue);
      expect(api.shapes['Nested']!.membersMap!.keys, contains('leaf'));
    });
  });
}
