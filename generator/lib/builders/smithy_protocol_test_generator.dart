import 'dart:convert';
import 'dart:io';

import 'package:dart_style/dart_style.dart';

import '../model/api.dart';
import '../smithy/ast.dart';
import '../smithy/from_smithy.dart';
import '../smithy/traits.dart';
import 'library_builder.dart';
import 'smithy_protocol_test_builder.dart';
import 'smithy_protocol_test_support.dart';
import 'test_all_builder.dart';

const smithyPackageDir = '../aws_client';
const smithyProtocolTestsDir =
    '$smithyPackageDir/test/generated_smithy_protocol';
const _sharedLibraryPath = 'package:aws_client/src/shared';

// Generated coverage report — written to the gitignored .notes/ (repo root),
// not the committed test tree.
const _readinessFile = '../.notes/smithy-readiness.md';

Future<void> generateSmithyProtocolTests({
  required Map<String, String> skipList,
  required Map<String, String> excludeList,
}) async {
  final formatter = DartFormatter(fixes: StyleFix.all);
  final astDir = Directory('smithy_protocol_tests/ast');
  if (!astDir.existsSync()) {
    print('No smithy_protocol_tests/ast; nothing to generate.');
    return;
  }

  final generatedDir = Directory(smithyProtocolTestsDir);
  if (generatedDir.existsSync()) generatedDir.deleteSync(recursive: true);

  const protocols = [
    'awsJson1_0',
    'awsJson1_1',
    'restJson1',
    'restXml',
    'awsQuery',
  ];

  final emittedIds = <String>{};
  final candidateOpKeys = <String>{};
  final readiness = <ProtocolReadiness>[];

  for (final protocol in protocols) {
    final astFile = File('${astDir.path}/$protocol.json');
    if (!astFile.existsSync()) continue;
    final model = SmithyModel.fromJson(
        jsonDecode(astFile.readAsStringSync()) as Map<String, dynamic>);

    final serviceEntry = model.shapes.entries
        .where((e) => e.value.type == 'service')
        .reduce((a, b) => (b.value.operations?.length ?? 0) >
                (a.value.operations?.length ?? 0)
            ? b
            : a);
    final protocolId = serviceEntry.value.protocolTraitId;

    var corpusVectors = 0;
    for (final s in model.shapes.values.where((s) => s.type == 'operation')) {
      for (final key in const [
        'smithy.test#httpRequestTests',
        'smithy.test#httpResponseTests',
      ]) {
        corpusVectors += (s.traits[key] as List? ?? const [])
            .cast<Map>()
            .where((m) => m['protocol'] == protocolId || m['protocol'] == null)
            .length;
      }
    }

    final Api api;
    final String serviceCode;
    try {
      api = apiFromSmithy(model,
          uid: protocol.toLowerCase(), serviceId: serviceEntry.key);
      serviceCode = formatter
          .format(buildService(api, sharedLibraryPath: _sharedLibraryPath));
    } catch (e) {
      print('Excluding Suite 2 protocol $protocol (build threw): $e');
      final opCount =
          model.shapes.values.where((s) => s.type == 'operation').length;
      readiness.add(ProtocolReadiness(
          protocol: protocol,
          corpusVectors: corpusVectors,
          vectors: 0,
          skipped: 0,
          excludedOps: opCount,
          buildFailed: true));
      continue;
    }

    final baseDir = '${generatedDir.path}/$protocol';

    var vectors = 0, skipped = 0, excludedOps = 0, auxUncovered = 0;
    final processed = <String>{};
    final testFiles = <String, String>{};

    for (final entry
        in model.shapes.entries.where((e) => e.value.type == 'operation')) {
      final localName = entry.key.split('#').last;

      List<Map<String, dynamic>> only(Object? raw) => (raw as List? ?? const [])
          .cast<Map>()
          .map((m) => m.cast<String, dynamic>())
          .where((m) => m['protocol'] == protocolId || m['protocol'] == null)
          .toList();
      final requestTests =
          only(entry.value.traits['smithy.test#httpRequestTests']);
      final responseTests =
          only(entry.value.traits['smithy.test#httpResponseTests']);
      if (requestTests.isEmpty && responseTests.isEmpty) continue;

      final operation = api.operations[localName];
      if (operation == null) {
        auxUncovered += requestTests.length + responseTests.length;
        continue;
      }
      if (!processed.add(localName)) continue;

      final opKey = '$protocol/$localName';
      candidateOpKeys.add(opKey);
      if (excludeList.containsKey(opKey)) {
        excludedOps++;
        continue;
      }

      final String testCode;
      try {
        testCode = formatter.format(buildSmithyProtocolTestSuite(
            api, operation, requestTests, responseTests,
            utilsImport: '../../utils.dart', skipReasons: skipList));
      } catch (e) {
        print('Excluding Suite 2 op $opKey (builder threw): $e');
        excludedOps++;
        continue;
      }

      for (final t in [...requestTests, ...responseTests]) {
        final id = t['id'] as String;
        emittedIds.add(id);
        vectors++;
        if (skipList.containsKey(id)) skipped++;
      }
      testFiles['$baseDir/${localName}_test.dart'] = testCode;
    }

    // Omit the client when all ops are excluded; dead code breaks dart analyze.
    if (vectors > 0) {
      File('$baseDir/${api.fileBasename}.dart')
        ..createSync(recursive: true)
        ..writeAsStringSync(serviceCode);
      testFiles.forEach((path, content) {
        File(path)
          ..createSync(recursive: true)
          ..writeAsStringSync(content);
      });
    }

    if (auxUncovered > 0) {
      print('Suite 2 $protocol: $auxUncovered vector(s) on auxiliary '
          'services not covered (out of scope).');
    }
    readiness.add(ProtocolReadiness(
        protocol: protocol,
        corpusVectors: corpusVectors,
        vectors: vectors,
        skipped: skipped,
        excludedOps: excludedOps));
  }

  final staleSkips = staleSkipKeys(skipList, emittedIds);
  final staleExcludes = staleSkipKeys(excludeList, candidateOpKeys);
  if (staleSkips.isNotEmpty || staleExcludes.isNotEmpty) {
    throw StateError('Stale Suite 2 lists. skip_list orphans: $staleSkips ; '
        'exclude_list orphans: $staleExcludes. '
        'Update smithy_protocol_tests/{skip,exclude}_list.json.');
  }

  if (!generatedDir.existsSync()) generatedDir.createSync(recursive: true);
  generateTestAllFile(generatedDir);
  (File(_readinessFile)..parent.createSync(recursive: true))
      .writeAsStringSync(renderReadiness(readiness));
  print('Generated Smithy Suite 2 (official protocol conformance).');
}
