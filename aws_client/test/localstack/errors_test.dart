import 'package:aws_client/api_gateway_2015_07_09.dart'
    show ApiGateway, NotFoundException;
import 'package:aws_client/dynamo_db_2012_08_10.dart'
    show DynamoDB, AttributeValue, ResourceNotFoundException;
import 'package:aws_client/iam_2010_05_08.dart' show Iam, NoSuchEntityException;
import 'package:aws_client/s3_2006_03_01.dart' show S3, NoSuchBucket;
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  final missing = uniqueName('missing');

  test('json error: DynamoDB getItem on missing table throws typed exception',
      () async {
    final dynamo = localClient(DynamoDB.new);
    await expectLater(
      dynamo.getItem(tableName: missing, key: {'id': AttributeValue(s: 'x')}),
      throwsA(isA<ResourceNotFoundException>()),
    );
    dynamo.close();
  });

  test('rest-xml error: S3 getObject on missing bucket throws typed exception',
      () async {
    final s3 = localClient(S3.new);
    await expectLater(
      s3.getObject(bucket: missing, key: 'k'),
      throwsA(isA<NoSuchBucket>()),
    );
    s3.close();
  });

  test('query error: IAM getUser on missing user throws typed exception',
      () async {
    final iam = localClient(Iam.new);
    await expectLater(
      iam.getUser(userName: missing),
      throwsA(isA<NoSuchEntityException>()),
    );
    iam.close();
  });

  test(
      'rest-json error: API Gateway getRestApi on missing id throws '
      'typed exception', () async {
    final apiGateway = localClient(ApiGateway.new);
    await expectLater(
      apiGateway.getRestApi(restApiId: missing),
      throwsA(isA<NotFoundException>()),
    );
    apiGateway.close();
  });
}
