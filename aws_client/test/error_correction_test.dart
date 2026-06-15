@TestOn('vm')
library;

import 'package:aws_client/firehose_2015_08_04.dart';
import 'package:aws_client/sqs_2012_11_05.dart';
import 'package:test/test.dart';

void main() {
  group('error correction for missing required output members', () {
    test('SQS SendMessageBatchResult defaults Failed/Successful to empty lists',
        () {
      // Real SQS omits "Failed" when nothing failed (aws/aws-sdk#657).
      final onlySuccess = SendMessageBatchResult.fromJson({
        'Successful': [
          {'Id': 'm0', 'MessageId': 'abc', 'MD5OfMessageBody': 'd41d'},
        ],
      });
      expect(onlySuccess.successful, hasLength(1));
      expect(onlySuccess.failed, isEmpty);

      // Even an entirely empty object must not throw.
      final empty = SendMessageBatchResult.fromJson(const {});
      expect(empty.successful, isEmpty);
      expect(empty.failed, isEmpty);
    });

    test(
        'Firehose ExtendedS3DestinationDescription defaults missing required '
        'scalars and structures', () {
      final desc = ExtendedS3DestinationDescription.fromJson({
        'CompressionFormat': 'UNCOMPRESSED',
      });

      expect(desc.bucketARN, equals('')); // required String -> ''
      expect(desc.roleARN, equals('')); // required String -> ''
      expect(desc.compressionFormat, equals(CompressionFormat.uncompressed));
      // required structures -> empty structure with all-null members
      expect(desc.bufferingHints, isNotNull);
      expect(desc.bufferingHints.intervalInSeconds, isNull);
      expect(desc.encryptionConfiguration, isNotNull);
    });
  });
}
