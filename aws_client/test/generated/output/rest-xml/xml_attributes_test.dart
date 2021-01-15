// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:test/test.dart';
import '../../../utils.dart';
import 'xml_attributes.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('XML Attributes 0', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<SomeOutputDoc xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><ItemsList><Item><ItemDetail xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Type1"><ID>id1</ID></ItemDetail></Item><Item><ItemDetail xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Type2"><ID>id2</ID></ItemDetail></Item><Item><ItemDetail xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Type3"><ID>id3</ID></ItemDetail></Item></ItemsList></SomeOutputDoc>''',
          200,
          headers: {});
    });

    final service = XmlAttributes(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(
        accessKey: '',
        secretKey: '',
      ),
    );

    final output = await service.operationName0();
    expect(output.listItems[0].itemDetail.type, ItemType.type1);
    expect(output.listItems[0].itemDetail.id, "id1");
    expect(output.listItems[1].itemDetail.type, ItemType.type2);
    expect(output.listItems[1].itemDetail.id, "id2");
    expect(output.listItems[2].itemDetail.type, ItemType.type3);
    expect(output.listItems[2].itemDetail.id, "id3");
/*
{
  "ListItems": [
    {
      "ItemDetail": {
        "ID": "id1",
        "Type": "Type1"
      }
    },
    {
      "ItemDetail": {
        "ID": "id2",
        "Type": "Type2"
      }
    },
    {
      "ItemDetail": {
        "ID": "id3",
        "Type": "Type3"
      }
    }
  ]
}
*/
  });
}
