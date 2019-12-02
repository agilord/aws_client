import 'package:aws_client.generator/model/operation.dart';

abstract class ServiceBuilder {
  String imports();

  String constructor();

  String operationContent(Operation operation);
}
