import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import 'builders/smithy_protocol_test_generator.dart';
import 'builders/smithy_protocol_test_support.dart';

class SmithyProtocolTestsCommand extends Command<void> {
  @override
  String get name => 'smithy-tests';

  @override
  String get description =>
      'Generates the Smithy protocol-conformance test suite into '
      'aws_client/test/generated_smithy_protocol from the vendored '
      'smithy_protocol_tests/ast models.';

  @override
  Future<void> run() async {
    String read(String path) {
      final file = File(path);
      return file.existsSync() ? file.readAsStringSync() : '{}';
    }

    await generateSmithyProtocolTests(
      skipList: parseSkipList(read('smithy_protocol_tests/skip_list.json')),
      excludeList:
          parseSkipList(read('smithy_protocol_tests/exclude_list.json')),
    );
  }
}
