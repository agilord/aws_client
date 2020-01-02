String markdownText(String text) {
  return _parseAndBuild(text);
}

String dartdocComment(String text, {int indent = 0}) {
  return _parseAndBuild(text, indent: indent, prefix: '/// ');
}

// TODO: parse <ul> / <li> structures
String _parseAndBuild(String text, {int indent = 0, String prefix = ''}) {
  if (text == null || text.isEmpty) return '';
  final lines = text
      .replaceAll('</p>', '\n')
      .replaceAll('<ul>', '\n<ul>')
      .replaceAll('</ul>', '\n</ul>')
      .replaceAll('<li>', '\n<li>')
      .split('\n')
      .expand((s) => s.split('<p>'))
      .map((s) => s.trim())
      .expand((s) => _wrapLines(s, 75 - indent))
      .toList();
  if (lines.isNotEmpty && lines.first.isEmpty) {
    lines.removeAt(0);
  }
  if (lines.isNotEmpty && lines.last.isEmpty) {
    lines.removeLast();
  }
  if (lines.isNotEmpty && lines.first.startsWith('<fullname>')) {
    lines.removeAt(0);
    final firstEmpty = lines.indexOf('');
    if (firstEmpty != null) {
      lines.removeRange(firstEmpty, lines.length);
    }
  }
  return lines.map((s) => (' ' * indent) + prefix + s).join('\n');
}

Iterable<String> _wrapLines(String line, int length) sync* {
  if (line.isEmpty) {
    yield '';
    return;
  }
  final parts = line.split(' ');
  final sb = StringBuffer();
  for (var i = 0; i < parts.length; i++) {
    if (sb.isNotEmpty && sb.length + parts[i].length > length) {
      yield sb.toString();
      sb.clear();
    }
    if (sb.isNotEmpty) {
      sb.write(' ');
    }
    sb.write(parts[i]);
  }
  if (sb.isNotEmpty) {
    yield sb.toString();
  }
}
