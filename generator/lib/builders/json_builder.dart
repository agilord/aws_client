import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class JsonServiceBuilder extends ServiceBuilder {
  final Api api;

  JsonServiceBuilder(this.api);

  @override
  String constructor() => '''
  final JsonProtocol _protocol;
  ${api.metadata.className}({Client client})
  : _protocol = JsonProtocol(client: client);
  ''';

  @override
  String imports() => "import 'package:aws_client/src/protocol/json.dart';";

  @override
  String operationContent(Operation operation) => '''// TODO: implement json
      final headers = {
        'Content-Type': 'application/x-amz-json-${api.metadata.jsonVersion ?? '1.0'}',
        'X-Amz-Target': '${api.metadata.targetPrefix}.${operation.name}'
      };
      throw UnimplementedError();''';
}
