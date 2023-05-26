import 'dart:convert';

import 'package:aws_client/api_gateway_2015_07_09.dart';

void main() async {
  final apiGateway = ApiGateway(region: 'us-east-2');
  final results = await apiGateway.getExport(
      exportType: 'swagger', restApiId: 'API_ID', stageName: 'prod');
  final schema = jsonDecode(utf8.decode(results.body!));
  print(schema);
  apiGateway.close();
}
