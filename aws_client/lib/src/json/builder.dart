import 'dart:convert';

class JsonBuilder {
  String build(Map<String, dynamic> value, Map<String, dynamic> shape) =>
      jsonEncode(_translate(value, shape));

  dynamic _translate(Map<String, dynamic> value, Map<String, dynamic> shape) {
    if (shape == null || value == null) return null;

    switch (shape['type'] as String) {
      case 'structure':
        return _translateStructure();
      case 'map':
        return _translateMap();
      case 'list':
        return _translateList();
      default:
        return _translateScalar();
    }
  }

  Map<String, dynamic> _translateStructure() => null;

  Map<dynamic, dynamic> _translateMap() => null;

  List<dynamic> _translateList() => null;

  _translateScalar() => null;
}
