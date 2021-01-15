import 'package:aws_client/apis/apigateway/2015-07-09.dart';

void main() async {
  final api = ApiGateway(region: 'us-east-1');
  await api.getExport(exportType: 'swagger', restApiId: 'xx', stageName: 'dev');
}
