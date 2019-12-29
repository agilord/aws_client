import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class Ec2ServiceBuilder extends ServiceBuilder {
  final Api api;

  Ec2ServiceBuilder(this.api);

  @override
  String constructor() => '';

  @override
  String imports() => "import 'package:aws_client/src/protocol/ec2.dart';";

  @override
  String operationContent(Operation operation) => '''// TODO: implement ec2
      throw UnimplementedError();''';
}
