import 'package:aws_client/apis/s3/2006-03-01.dart';

void main() async {
  final s3 = S3(region: 'us-east-1');
  final object = await s3.getObject(bucket: 'bucket', key: 'path/to/file');
  print(object.body.length);
}
