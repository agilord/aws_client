import 'package:shared_aws_api/shared.dart';

Future<AwsClientCredentials?> fromIni({
  bool preferStaticCredentials = false,
  Client? client,
  String? preferredProfile,
}) async {
  throw Exception('"fromIni" is not supported on web');
}
