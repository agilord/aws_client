import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);
  @override
  String constructor() => '''
  final RestJsonProtocol _protocol;
  ${api.metadata.className}({Client client})
  : _protocol = RestJsonProtocol(client: client);
  ''';

  @override
  String imports() =>
      "import 'package:aws_client/src/protocol/rest-json.dart';";

  @override
  String operationContent(Operation operation) =>
      '''// TODO: implement rest-json
      throw UnimplementedError();''';
}
