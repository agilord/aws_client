import 'dart:convert';
import 'package:aws_client/dynamo_document.dart';

void main() async {
  final db = DocumentClient(region: 'us-east-2');

  final getResponse = await db.get(
    tableName: 'MyTable',
    key: {'Car': 'DudeWheresMyCar'},
  );

  print(jsonEncode(getResponse.item));
}
