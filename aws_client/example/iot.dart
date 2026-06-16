import 'package:aws_client/iot_data_plane.dart';

void main() async {
  final api = IoTDataPlane(region: 'us-east-2');
  final shadow = await api.getThingShadow(thingName: 'my_thing');
  print(shadow.payload);
  api.close();
}
