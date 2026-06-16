import 'package:aws_client/api_gateway.dart';
import 'package:test/test.dart';

import 'harness.dart';

void main() {
  late ApiGateway apiGateway;

  setUp(() => apiGateway = localClient(ApiGateway.new));
  tearDown(() => apiGateway.close());

  test('API Gateway (rest-json): create REST API, then list it', () async {
    final created = await apiGateway.createRestApi(name: uniqueName());
    final restApiId = created.id!;

    // rest-json encodes timestamps as epoch seconds.
    expectRecent(created.createdDate);

    final apis = await apiGateway.getRestApis();
    final ids = (apis.items ?? []).map((a) => a.id);
    expect(ids, contains(restApiId));

    await apiGateway.deleteRestApi(restApiId: restApiId);
  });
}
