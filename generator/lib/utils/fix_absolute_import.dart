import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:path/path.dart' as p;

String replaceAbsoluteImports(String content,
    {required String filePath, required String packageName}) {
  filePath = filePath.replaceAll(r'\', '/');
  assert(filePath.startsWith('lib/'));
  filePath = filePath.substring('lib/'.length);
  var newContent = content;

  final unit = parseString(content: content).unit;

  for (var directive
      in unit.directives.reversed.whereType<NamespaceDirective>()) {
    final uriValue = directive.uri.stringValue!;
    final absolutePrefix = 'package:$packageName/';
    if (uriValue.startsWith(absolutePrefix)) {
      final absoluteImportFromLib = uriValue.replaceAll(absolutePrefix, '');
      final relativePath = p
          .relative(absoluteImportFromLib, from: p.dirname(filePath))
          .replaceAll(r'\', '/');

      final directiveContent =
          directive.uri.toString().replaceAll(uriValue, relativePath);

      newContent = newContent.replaceRange(directive.uri.offset,
          directive.uri.offset + directive.uri.length, directiveContent);
    }
  }

  return newContent;
}
