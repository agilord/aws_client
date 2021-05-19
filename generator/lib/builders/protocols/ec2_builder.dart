import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class Ec2ServiceBuilder extends ServiceBuilder {
  final Api api;

  Ec2ServiceBuilder(this.api);

  @override
  String constructor() => '''
  ${api.metadata.className}({required String region, _s.AwsClientCredentials? credentials, _s.Client? client, String? endpointUrl,}) {
  print('\$client\$region\$credentials\$endpointUrl');
  }
  ''';

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) => '''// TODO: implement ec2
      throw UnimplementedError();''';
}
