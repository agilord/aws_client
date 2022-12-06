import 'dart:convert';
import 'package:aws_client.generator/builders/builder_utils.dart';
import 'package:aws_client.generator/model/api.dart';
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
}
