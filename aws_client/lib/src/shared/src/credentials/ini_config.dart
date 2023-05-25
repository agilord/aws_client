import 'dart:convert';

class Config {
  final Map<String, Map<String, String>> _sections =
      <String, Map<String, String>>{};
  late List<String> _strings;

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
    final config = Config()
      .._strings =
          _joinLongHeaderFields(_removeComments(_removeBlankLines(strings)));
    var section = 'default';

    for (final current in config._strings) {
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

  Iterable<String> sections() => _sections.keys;

  void addSection(String name) {
    if (_sections.containsKey(name)) {
      throw Exception('DuplicateSectionError');
    }
    _sections[name] = <String, String>{};
  }

  bool hasSection(String name) => _sections.containsKey(name);

  Iterable<String>? options(String name) => _getSection(name)?.keys;

  bool hasOption(String name, String option) =>
      (_getSection(name))?.containsKey(option) ?? false;

  String? get(String name, String option) => (_getSection(name) ?? {})[option];

  List<List<String?>>? items(String name) {
    final s = _getSection(name);
    if (s != null) {
      return s.keys.map((String key) => [key, s[key]]).toList();
    } else {
      return null;
    }
  }

  void set(String name, String option, String value) {
    final s = _getSection(name);
    if (s == null) {
      throw Exception('NoSectionError');
    }
    s[option] = value;
  }

  bool removeOption(String section, String option) {
    final s = _getSection(section);
    if (s != null) {
      if (s.containsKey(option)) {
        s.remove(option);
        return true;
      }
      return false;
    }
    throw Exception('NoSectionError');
  }

  bool removeSection(String section) {
    if (_sections.containsKey(section)) {
      _sections.remove(section);
      return true;
    }
    return false;
  }

  Map<String, String>? _getSection(String section) {
    if (_sections.containsKey(section)) {
      return _sections[section];
    }
    return null;
  }
}
