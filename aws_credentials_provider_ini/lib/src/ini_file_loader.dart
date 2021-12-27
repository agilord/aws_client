import 'dart:convert';

class Config {
  final Map<String, Map<String, String>> sections =
      <String, Map<String, String>>{};

  static final RegExp _blankLinePattern = RegExp(r'^\s*$');
  static final RegExp _commentPattern = RegExp(r'^\s*[;#]');
  static final RegExp _lineContinuationPattern = RegExp(r'^\s+');
  static final RegExp _sectionPattern = RegExp(r'^\s*\[(.*\S.*)]\s*$');
  static final RegExp _entryPattern = RegExp(r'^([^=]+)=(.*?)$');

  static Iterable<String> _removeBlankLines(Iterable<String> source) =>
      source.where((String line) => !_blankLinePattern.hasMatch(line));

  static Iterable<String> _removeComments(Iterable<String> source) =>
      source.where((String line) => !_commentPattern.hasMatch(line));

  static List<String> _joinLongHeaderFields(Iterable<String> source) {
    final result = <String>[];
    var line = '';

    for (final current in source) {
      if (_lineContinuationPattern.hasMatch(current)) {
        line += current.replaceFirst(_lineContinuationPattern, '');
      } else {
        if (line != '') {
          result.add(line);
        }
        line = current;
      }
    }
    if (line != '') {
      result.add(line);
    }

    return result;
  }

  static Config fromString(String string) =>
      fromStrings(LineSplitter().convert(string));

  static Config fromStrings(List<String> strings) {
    final config = Config();
    var section = 'default';

    for (final current
        in _joinLongHeaderFields(_removeComments(_removeBlankLines(strings)))) {
      final isSection = _sectionPattern.firstMatch(current);
      if (isSection != null) {
        section = isSection[1]!.trim();
        config.addSection(section);
      } else {
        final isEntry = _entryPattern.firstMatch(current);
        if (isEntry != null) {
          config.set(section, isEntry[1]!.trim(), isEntry[2]!.trim());
        } else {
          throw Exception('Unrecognized line: "$current"');
        }
      }
    }
    return config;
  }

  void addSection(String name) {
    if (sections.containsKey(name)) {
      throw Exception('DuplicateSectionError');
    }
    sections[name] = <String, String>{};
  }

  void set(String name, String option, String value) {
    final s = sections[name];
    if (s == null) {
      throw Exception('NoSectionError');
    }
    s[option] = value;
  }
}
