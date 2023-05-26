import 'dart:convert';

import 'package:aws_client/sns_2010_03_31.dart';

void main() async {
  final service = Sns(region: 'us-east-2');
  final message = {
    'GCM': jsonEncode({
      'data': {
        'action': 'refresh',
      },
    }),
    'APNS': jsonEncode({
      'aps': {
        'content-available': 1,
      },
      'action': 'refresh',
    }),
  };

  final endPoint = await service.createPlatformEndpoint(
      platformApplicationArn: 'arn:aws:sns:us-east-2:123456:app/GCM/MyApp',
      token: 'abc');

  print('End point ${endPoint.endpointArn}');

  await service.publish(
    message: jsonEncode(message),
    messageStructure: 'json',
    targetArn: endPoint.endpointArn,
  );

  print('Success');

  service.close();
}
