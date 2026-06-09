// ignore_for_file: prefer_single_quotes, unused_import

import 'dart:convert';
import 'dart:typed_data';
import 'package:aws_client/src/shared/shared.dart' as _s;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import '../../utils.dart';
import 'v2020_01_08.dart';

void main() {
  _s.idempotencyGeneratorOverride =
      () => '00000000-0000-4000-8000-000000000000';
  test('QueryXmlEmptyLists', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlEmptyListsResponse xmlns="https://example.com/">
    <XmlEmptyListsResult>
        <stringList/>
        <stringSet></stringSet>
    </XmlEmptyListsResult>
</XmlEmptyListsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
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
    expect(output.intEnumList, isNull);
    expect(output.integerList, isNull);
    expect(output.nestedStringList, isNull);
    expect(output.renamedListMembers, isNull);
    expect(output.structureList, isNull);
    expect(output.timestampList, isNull);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
