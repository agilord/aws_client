import 'package:aws_client/rds_data.dart';

void main() async {
  final api = RdsData(region: 'us-east-2');
  final response = await api.executeStatement(
    resourceArn: 'resourceArn',
    secretArn: 'secret',
    database: 'database',
    schema: 'public',
    includeResultMetadata: true,
    sql: 'select 1 where a = :param1',
    parameters: [SqlParameter(name: 'param1', value: Field(longValue: 1))],
  );
  print(response.records);
  api.close();
}
