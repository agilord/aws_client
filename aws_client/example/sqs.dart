import 'package:aws_client/sqs_2012_11_05.dart';

void main() async {
  final sqs = Sqs(
      region: 'us-east-1',
      credentials: AwsClientCredentials.fromProfileFile(profile: 'prod'));
  final queue = await sqs.createQueue(
      queueName: 'bucket2', attributes: {QueueAttributeName.delaySeconds: '5'});

  print(queue.queueUrl);
  await sqs.deleteQueue(queueUrl: queue.queueUrl!);
  sqs.close();
}
