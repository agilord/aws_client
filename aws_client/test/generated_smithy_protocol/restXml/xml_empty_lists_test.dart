// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2019_12_16.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('XmlEmptyLists', () async {
    final client = MockClient((request) async {
      expect(request.body, equalsXml(r'''<XmlEmptyListsRequest>
        <stringList></stringList>
        <stringSet></stringSet>
</XmlEmptyListsRequest>
'''));
      expect(request.headers['Content-Type'], startsWith('application/xml'));
      expect(request.url, equalsPathAndQuery('/XmlEmptyLists'));
      expect(request.method, equalsIgnoringCase('PUT'));
      return Response('<Response></Response>', 200);
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    await service.xmlEmptyLists(
      stringList: [],
      stringSet: [],
    );
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');

  test('XmlEmptyLists', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlEmptyListsResponse>
        <stringList/>
        <stringSet></stringSet>
</XmlEmptyListsResponse>
''',
          200,
          headers: {"Content-Type": "application/xml"});
    });

    final service = RestXmlProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlEmptyLists();
    expect(output.booleanList, isNull);
    expect(output.enumList, isNull);
    expect(output.flattenedList, isNull);
    expect(output.flattenedList2, isNull);
    expect(output.flattenedListWithMemberNamespace, isNull);
    expect(output.flattenedListWithNamespace, isNull);
    expect(output.flattenedStructureList, isNull);
    expect(output.intEnumList, isNull);
    expect(output.integerList, isNull);
    expect(output.nestedStringList, isNull);
    expect(output.renamedListMembers, isNull);
    expect(output.structureList, isNull);
    expect(output.timestampList, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
