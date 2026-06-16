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
  test('QueryXmlLists', () async {
    final client = MockClient((request) async {
      return Response(
          r'''<XmlListsResponse xmlns="https://example.com/">
    <XmlListsResult>
        <stringList>
            <member>foo</member>
            <member>bar</member>
        </stringList>
        <stringSet>
            <member>foo</member>
            <member>bar</member>
        </stringSet>
        <integerList>
            <member>1</member>
            <member>2</member>
        </integerList>
        <booleanList>
            <member>true</member>
            <member>false</member>
        </booleanList>
        <timestampList>
            <member>2014-04-29T18:30:38Z</member>
            <member>2014-04-29T18:30:38Z</member>
        </timestampList>
        <enumList>
            <member>Foo</member>
            <member>0</member>
        </enumList>
        <intEnumList>
            <member>1</member>
            <member>2</member>
        </intEnumList>
        <nestedStringList>
            <member>
                <member>foo</member>
                <member>bar</member>
            </member>
            <member>
                <member>baz</member>
                <member>qux</member>
            </member>
        </nestedStringList>
        <renamed>
            <item>foo</item>
            <item>bar</item>
        </renamed>
        <flattenedList>hi</flattenedList>
        <flattenedList>bye</flattenedList>
        <customName>yep</customName>
        <customName>nope</customName>
        <flattenedListWithMemberNamespace xmlns="https://xml-member.example.com">a</flattenedListWithMemberNamespace>
        <flattenedListWithMemberNamespace xmlns="https://xml-member.example.com">b</flattenedListWithMemberNamespace>
        <flattenedListWithNamespace>a</flattenedListWithNamespace>
        <flattenedListWithNamespace>b</flattenedListWithNamespace>
        <myStructureList>
            <item>
                <value>1</value>
                <other>2</other>
            </item>
            <item>
                <value>3</value>
                <other>4</other>
            </item>
        </myStructureList>
    </XmlListsResult>
</XmlListsResponse>
''',
          200,
          headers: {"Content-Type": "text/xml"});
    });

    final service = QueryProtocol(
      client: client,
      region: 'us-east-1',
      credentials: AwsClientCredentials(accessKey: '', secretKey: ''),
    );

    final output = await service.xmlLists();
    expect(output.booleanList?[0], true);
    expect(output.booleanList?[1], false);
    expect(output.enumList?[0], FooEnum.foo);
    expect(output.enumList?[1], FooEnum.$0);
    expect(output.flattenedList?[0], "hi");
    expect(output.flattenedList?[1], "bye");
    expect(output.flattenedList2?[0], "yep");
    expect(output.flattenedList2?[1], "nope");
    expect(output.flattenedListWithMemberNamespace?[0], "a");
    expect(output.flattenedListWithMemberNamespace?[1], "b");
    expect(output.flattenedListWithNamespace?[0], "a");
    expect(output.flattenedListWithNamespace?[1], "b");
    expect(output.intEnumList?[0], 1);
    expect(output.intEnumList?[1], 2);
    expect(output.integerList?[0], 1);
    expect(output.integerList?[1], 2);
    expect(output.nestedStringList?[0][0], "foo");
    expect(output.nestedStringList?[0][1], "bar");
    expect(output.nestedStringList?[1][0], "baz");
    expect(output.nestedStringList?[1][1], "qux");
    expect(output.renamedListMembers?[0], "foo");
    expect(output.renamedListMembers?[1], "bar");
    expect(output.stringList?[0], "foo");
    expect(output.stringList?[1], "bar");
    expect(output.stringSet?[0], "foo");
    expect(output.stringSet?[1], "bar");
    expect(output.structureList?[0].a, "1");
    expect(output.structureList?[0].b, "2");
    expect(output.structureList?[1].a, "3");
    expect(output.structureList?[1].b, "4");
    expect(output.timestampList![0].millisecondsSinceEpoch / 1000, 1398796238);
    expect(output.timestampList![1].millisecondsSinceEpoch / 1000, 1398796238);
  }, skip: r'''Auto-recorded: Suite 2 vector fails today''');
}
