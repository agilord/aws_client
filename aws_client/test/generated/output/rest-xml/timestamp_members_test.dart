// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'timestamp_members.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('Timestamp members 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<OperationNameResponse><StructMember><foo>2014-04-29T18:30:38Z</foo><bar>1398796238</bar></StructMember><TimeArg>2014-04-29T18:30:38Z</TimeArg><TimeCustom>Tue, 29 Apr 2014 18:30:38 GMT</TimeCustom><TimeFormat>1398796238</TimeFormat><RequestId>requestid</RequestId></OperationNameResponse>''',
          200,
          headers: {
            "x-amz-timearg": "Tue, 29 Apr 2014 18:30:38 GMT",
            "x-amz-timecustom": "1398796238",
            "x-amz-timeformat": "1398796238"
          });
    });

    final service = TimestampMembers(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(
        output.structMember!.bar!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(
        output.structMember!.foo!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(output.timeArg!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(output.timeArgInHeader!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(output.timeCustom!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(
        output.timeCustomInHeader!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(output.timeFormat!.millisecondsSinceEpoch ~/ 1000, 1398796238);
    expect(
        output.timeFormatInHeader!.millisecondsSinceEpoch ~/ 1000, 1398796238);
/*
{
  "TimeArg": 1398796238,
  "TimeArgInHeader": 1398796238,
  "TimeCustom": 1398796238,
  "TimeCustomInHeader": 1398796238,
  "TimeFormat": 1398796238,
  "TimeFormatInHeader": 1398796238,
  "StructMember": {
    "foo": 1398796238,
    "bar": 1398796238
  }
}
*/
  });
}
