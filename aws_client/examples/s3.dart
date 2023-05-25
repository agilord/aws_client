import 'dart:io';

import 'package:aws_client/s3_2006_03_01.dart';

void main() async {
  final api = S3(region: 'eu-west-1');
  await api.createBucket(bucket: 'my_bucket');
  await api.putObject(
      bucket: 'my_bucket',
      key: 'my_file.png',
      body: File('my_file.png').readAsBytesSync());
  api.close();
}
