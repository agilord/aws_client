import 'package:shared_aws_api/shared.dart';

Future<AwsClientCredentials?> fromEnvironment({Client? client}) async {
  throw Exception('"fromEnvironment" is not supported on web');
}
