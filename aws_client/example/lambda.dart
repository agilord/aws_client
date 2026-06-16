import 'dart:io';

import 'package:aws_client/lambda.dart';

void main(List<String> args) async {
  final api = Lambda(region: 'us-west-1');

  // List functions
  final functions = await api.listFunctions();
  print(functions.functions);

  // Update code
  await api.updateFunctionCode(
    functionName: 'my_function',
    zipFile: File('code.zip').readAsBytesSync(),
  );

  api.close();
}
