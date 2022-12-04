import 'package:shared_aws_api/src/protocol/query.dart';
import 'package:test/test.dart';

void main() {
  group('QueryProtocol.flatQueryParams', () {
    test('handles a value of type double', () {
      expect(() => flatQueryParams(0.0, null, {}, 'version', 'action'),
          returnsNormally);
    });

    test('correct output for a value of type double', () {
      final result = flatQueryParams(123.4, null, {}, 'version', 'action');
      expect(result[''], '123.4');
    });
  });
}
