import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class Ec2ServiceBuilder extends ServiceBuilder {
  final Api api;

  Ec2ServiceBuilder(this.api);

  @override
  String constructor() => '';

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) =>
      '''// TODO: implement rest-json
      throw UnimplementedError();''';
}
