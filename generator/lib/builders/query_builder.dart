import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

import 'builder.dart';

class QueryServiceBuilder extends ServiceBuilder {
  final Api api;

  QueryServiceBuilder(this.api);

  @override
  String constructor() => '''
  final QueryProtocol _protocol;
  ${api.metadata.className}({Client client})
  : _protocol = QueryProtocol(client: client);
  ''';

  @override
  String imports() => 'import \'package:aws_client/src/protocol/query.dart\';';

  @override
  String operationContent(Operation operation) {
    final hasReturnType = operation.returnType != 'void';
    final parameterShape = api.shapes[operation.parameterType];
    final useParameter = parameterShape != null && parameterShape.hasMembers;

    final StringBuffer buf = StringBuffer();
    buf.writeln('    final \$request = <String, dynamic>{\n'
        '      \'Action\': \'${operation.name}\',\n'
        '      \'Version\': \'${api.metadata.apiVersion}\',');
    if (useParameter) {
      buf.writeln('      ...input.toJson(),');
    }
    buf.writeln('    };');
    final params = StringBuffer('\$request, '
        'method: \'${operation.http.method}\', '
        'requestUri: \'${operation.http.requestUri}\'');
    if (operation.output?.resultWrapper != null) {
      params.write(', resultWrapper: \'${operation.output.resultWrapper}\',');
    }
    if (hasReturnType) {
      buf.writeln('    final \$result = await _protocol.send($params);');
      buf.writeln('    return ${operation.returnType}.fromJson(\$result);');
    } else {
      buf.writeln('    await _protocol.send($params);');
    }
    return buf.toString();
  }
}
