import 'package:shared_aws_api/src/protocol/query.dart';
import 'package:test/test.dart';

void main() {
  group('QueryProtocol.flatQueryParams', () {
    test('handles a value of type double', () {
      expect(() => flatQueryParams(0.0, null, {}, 'version', 'action'), returnsNormally);
    });
  });
}
