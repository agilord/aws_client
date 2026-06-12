import 'package:aws_client_generator/builders/smithy_protocol_test_builder.dart';
import 'package:aws_client_generator/smithy/ast.dart';
import 'package:aws_client_generator/smithy/from_smithy.dart';
import 'package:test/test.dart';

const _model = {
  'smithy': '2.0',
  'shapes': {
    'example#Demo': {
      'type': 'service',
      'version': '2020-01-01',
      'operations': [
        {'target': 'example#Echo'}
      ],
      'traits': {
        'aws.protocols#awsJson1_0': {},
        'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
      },
    },
    'example#Echo': {
      'type': 'operation',
      'input': {'target': 'example#EchoInput'},
      'output': {'target': 'example#EchoOutput'},
      'traits': {
        'smithy.test#httpRequestTests': [
          {
            'id': 'EchoRequest',
            'protocol': 'aws.protocols#awsJson1_0',
            'method': 'POST',
            'uri': '/',
            'body': '{"message":"hi"}',
            'bodyMediaType': 'application/json',
            'headers': {'X-Amz-Target': 'Demo.Echo'},
            'params': {'message': 'hi'},
          }
        ],
        'smithy.test#httpResponseTests': [
          {
            'id': 'EchoResponse',
            'protocol': 'aws.protocols#awsJson1_0',
            'code': 200,
            'body': '{"message":"yo"}',
            'bodyMediaType': 'application/json',
            'params': {'message': 'yo'},
          }
        ],
      },
    },
    'example#EchoInput': {
      'type': 'structure',
      'members': {
        'message': {'target': 'smithy.api#String'},
      },
    },
    'example#EchoOutput': {
      'type': 'structure',
      'members': {
        'message': {'target': 'smithy.api#String'},
      },
    },
  },
};

void main() {
  test('emits request and response tests for an operation', () {
    final model = SmithyModel.fromJson(Map<String, dynamic>.from(_model));
    final api = apiFromSmithy(model, uid: 'demo');
    api.initReferences();
    final op = api.operations['Echo']!;

    final requestTests = [
      Map<String, dynamic>.from((((_model['shapes'] as Map)['example#Echo']
          as Map)['traits'] as Map)['smithy.test#httpRequestTests'][0] as Map)
    ];
    final responseTests = [
      Map<String, dynamic>.from((((_model['shapes'] as Map)['example#Echo']
          as Map)['traits'] as Map)['smithy.test#httpResponseTests'][0] as Map)
    ];

    final code = buildSmithyProtocolTestSuite(
        api, op, requestTests, responseTests,
        skipReasons: const {});

    expect(code, contains("test('EchoRequest'"));
    expect(code, contains('equalsJson'));
    expect(code, contains("equalsIgnoringCase('POST')"));
    expect(code, contains('await service.echo('));
    expect(code, contains("test('EchoResponse'"));
    expect(code, contains('final output ='));
    final skipped = buildSmithyProtocolTestSuite(api, op, requestTests, [],
        skipReasons: const {'EchoRequest': 'known gap'});
    expect(skipped, contains('skip:'));
    expect(skipped, contains('known gap'));
  });

  test('does not capture void result for an empty-output operation', () {
    final model =
        SmithyModel.fromJson(Map<String, dynamic>.from(_emptyOutModel));
    final api = apiFromSmithy(model, uid: 'demo');
    api.initReferences();
    final op = api.operations['Empty']!;

    final responseTests = [
      Map<String, dynamic>.from(
          (((_emptyOutModel['shapes'] as Map)['example#Empty'] as Map)['traits']
              as Map)['smithy.test#httpResponseTests'][0] as Map)
    ];

    final code = buildSmithyProtocolTestSuite(api, op, const [], responseTests,
        skipReasons: const {});

    // Capturing a Future<void> result would be a `use_of_void_result` compile error.
    expect(code, contains('await service.empty();'));
    expect(code, isNot(contains('final output =')));
  });
}

const _emptyOutModel = {
  'smithy': '2.0',
  'shapes': {
    'example#Demo': {
      'type': 'service',
      'version': '2020-01-01',
      'operations': [
        {'target': 'example#Empty'}
      ],
      'traits': {
        'aws.protocols#awsJson1_0': {},
        'aws.api#service': {'sdkId': 'Demo', 'endpointPrefix': 'demo'},
      },
    },
    'example#Empty': {
      'type': 'operation',
      'output': {'target': 'example#EmptyOutput'},
      'traits': {
        'smithy.test#httpResponseTests': [
          {
            'id': 'EmptyResponse',
            'protocol': 'aws.protocols#awsJson1_0',
            'code': 200,
            'body': '{}',
            'bodyMediaType': 'application/json',
            'params': <String, dynamic>{},
          }
        ],
      },
    },
    'example#EmptyOutput': {
      'type': 'structure',
      'members': <String, dynamic>{},
    },
  },
};
