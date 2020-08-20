import 'package:shared_aws_api/src/protocol/shared.dart';
import 'package:test/test.dart';

void main() {
  group('query parameterization', () {
    test('Querystring list of strings', () {
      expect(toQueryParam('item', ['value1', 'value2']),
          equals('item=value1&item=value2'));
    });

    test('String to string maps in querystring', () {
      expect(toQueryParam(null, {'bar': 'baz', 'fizz': 'buzz'}),
          equals('bar=baz&fizz=buzz'));
    });

    test('String to string list maps in querystring', () {
      expect(
          toQueryParam(null, {
            'foo': ['bar', 'baz'],
            'fizz': ['buzz', 'pop']
          }),
          equals('foo=bar&foo=baz&fizz=buzz&fizz=pop'));
    });

    test('Boolean in querystring', () {
      expect(
          toQueryParam('bool-query', Input(true)), equals('bool-query=true'));
    });
  });
}

class Input {
  final bool boolQuery;

  Input(this.boolQuery);

  dynamic toJson() => {'bool-query': boolQuery};
}
