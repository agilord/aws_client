import 'package:aws_client/api_gateway.dart'
    show ApiGateway, NotFoundException;
// Several services expose like-named exceptions (NotFoundException,
// ResourceNotFoundException); import the newer services under a prefix so each
// typed exception can be referenced unambiguously.
import 'package:aws_client/cloud_watch_logs.dart' as logs;
import 'package:aws_client/dynamo_db.dart'
    show DynamoDB, AttributeValue, ResourceNotFoundException;
import 'package:aws_client/iam.dart' show Iam, NoSuchEntityException;
import 'package:aws_client/kinesis.dart' as kinesis;
import 'package:aws_client/kms.dart' as kms;
import 'package:aws_client/redshift.dart' as redshift;
import 'package:aws_client/s3.dart' show S3, NoSuchBucket;
import 'package:aws_client/secrets_manager.dart' as secrets;
import 'package:aws_client/sfn.dart' as sfn;
import 'package:aws_client/sns.dart' as sns;
import 'package:aws_client/sqs.dart' as sqs;
import 'package:aws_client/ssm.dart' as ssm;
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

  test('json error: SQS getQueueUrl on missing queue throws typed exception',
      () async {
    final client = localClient(sqs.Sqs.new);
    await expectLater(
      client.getQueueUrl(queueName: missing),
      throwsA(isA<sqs.QueueDoesNotExist>()),
    );
    client.close();
  });

  test(
      'query error: SNS getTopicAttributes on missing topic throws typed '
      'exception', () async {
    final client = localClient(sns.Sns.new);
    await expectLater(
      client.getTopicAttributes(
        topicArn: 'arn:aws:sns:$testRegion:000000000000:$missing',
      ),
      throwsA(isA<sns.NotFoundException>()),
    );
    client.close();
  });

  test('json error: KMS describeKey on missing key throws typed exception',
      () async {
    final client = localClient(kms.Kms.new);
    await expectLater(
      client.describeKey(keyId: '00000000-0000-0000-0000-000000000000'),
      throwsA(isA<kms.NotFoundException>()),
    );
    client.close();
  });

  test(
      'json error: SecretsManager getSecretValue on missing secret throws '
      'typed exception', () async {
    final client = localClient(secrets.SecretsManager.new);
    await expectLater(
      client.getSecretValue(secretId: missing),
      throwsA(isA<secrets.ResourceNotFoundException>()),
    );
    client.close();
  });

  test(
      'json error: SSM getParameter on missing parameter throws typed '
      'exception', () async {
    final client = localClient(ssm.Ssm.new);
    await expectLater(
      client.getParameter(name: '/missing/$missing'),
      throwsA(isA<ssm.ParameterNotFound>()),
    );
    client.close();
  });

  test(
      'json error: CloudWatchLogs getLogEvents on missing group throws typed '
      'exception', () async {
    final client = localClient(logs.CloudWatchLogs.new);
    await expectLater(
      client.getLogEvents(logGroupName: missing, logStreamName: missing),
      throwsA(isA<logs.ResourceNotFoundException>()),
    );
    client.close();
  });

  test(
      'json error: Kinesis describeStream on missing stream throws typed '
      'exception', () async {
    final client = localClient(kinesis.Kinesis.new);
    await expectLater(
      client.describeStream(streamName: missing),
      throwsA(isA<kinesis.ResourceNotFoundException>()),
    );
    client.close();
  });

  test(
      'json error: StepFunctions describeExecution on missing execution '
      'throws typed exception', () async {
    final client = localClient(sfn.Sfn.new);
    await expectLater(
      client.describeExecution(
        executionArn:
            'arn:aws:states:$testRegion:000000000000:execution:$missing:$missing',
      ),
      throwsA(isA<sfn.ExecutionDoesNotExist>()),
    );
    client.close();
  });

  test(
      'query error: a <Type>-less ErrorResponse surfaces as an exception, not '
      'a parse crash', () async {
    final client = localClient(redshift.Redshift.new);
    await expectLater(
      client.describeEventCategories(),
      throwsA(
        isA<Exception>().having(
            (e) => e.toString(), 'message', isNot(contains('No element'))),
      ),
    );
    client.close();
  });
}
