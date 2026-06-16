import 'package:aws_client/lambda.dart';

void main(List<String> args) async {
  final lambdaApi = Lambda(region: 'us-west-1');

  final response = await lambdaApi.invoke(
    functionName: 'my-function',
    invocationType: InvocationType.requestResponse,
  );
  print('StatusCode: ${response.statusCode}');

  lambdaApi.close();
}
