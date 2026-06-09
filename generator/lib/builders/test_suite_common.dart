import 'dart:convert';
import '../model/descriptor.dart';
import '../model/shape.dart';
import 'library_builder.dart';

void visitExpect(StringBuffer code, String memberTrail, Shape shape,
    Member? member, Object? results) {
  if (results == null) {
    code.writeln('expect(${_removeTrailingMark(memberTrail)}, isNull);');
    return;
  }

  if (shape.type == 'list') {
    final resultList = results as List;
    for (var i = 0; i < resultList.length; i++) {
      final listResult = resultList[i];
      if (listResult != null) {
        visitExpect(code, '$memberTrail[$i]', shape.member!.shapeClass!, null,
            listResult);
      }
    }
  } else if (shape.type == 'map') {
    final resultMap = results as Map;
    for (var key in resultMap.keys) {
      visitExpect(code, "$memberTrail['$key']?", shape.value!.shapeClass!, null,
          resultMap[key]);
    }
  } else if (shape.type == 'structure') {
    for (var member in shape.members) {
      final result = (results as Map<String, dynamic>)[member.name];
      visitExpect(
          code,
          '$memberTrail.${member.fieldName}${member.isRequired ? '' : '?'}',
          member.shapeClass!,
          member,
          result);
    }
  } else {
    String match;
    if (shape.enumeration != null) {
      match = '${shape.className}.${toEnumerationFieldName('$results')}';
    } else if (shape.type == 'blob' && results is String) {
      match = "utf8.encode('$results')";
    } else if (_specialFloatMatcher(shape, results) case final m?) {
      match = m;
    } else {
      match = jsonEncode(results);
    }

    if (shape.type == 'timestamp') {
      memberTrail = memberTrail.replaceAll('?', '!');
      memberTrail += '.millisecondsSinceEpoch ~/ 1000';
    }
    code.writeln('expect(${_removeTrailingMark(memberTrail)}, $match);');
  }
}

String buildParameters(Shape? shape, Member? member, Object? params,
    {bool? isRoot, Descriptor? descriptor}) {
  isRoot ??= false;

  if (shape == null) return '';
  if (params == null) return isRoot ? '' : 'null';

  if (params is String &&
      ((member?.jsonvalue ?? false) || (descriptor?.jsonvalue ?? false))) {
    return 'jsonDecode(${jsonEncode(params)})';
  }

  if (shape.type == 'list') {
    final resultList = params as List;
    return '[${resultList.map((e) => buildParameters(shape.member!.shapeClass, null, e, descriptor: shape.member)).where((e) => e != 'null').join(', ')}]';
  } else if (shape.type == 'map') {
    final resultMap = params as Map;
    final buffer = StringBuffer('{');
    for (var key in resultMap.keys) {
      final value = resultMap[key];
      buffer.writeln('${buildParameters(shape.key!.shapeClass, null, key)}: '
          '${buildParameters(shape.value!.shapeClass, null, value)},');
    }
    buffer.writeln('}');
    return '$buffer';
  } else if (shape.type == 'structure') {
    final buffer = StringBuffer();
    if (!isRoot) {
      buffer.writeln('${shape.className}(');
    }
    for (var member in shape.members) {
      final paramsMap = params as Map;
      if (paramsMap.containsKey(member.name)) {
        buffer.writeln(
            '${member.fieldName}: ${buildParameters(member.shapeClass, member, paramsMap[member.name])},');
      }
    }
    if (!isRoot) {
      buffer.writeln(')');
    }
    return '$buffer';
  } else {
    if (shape.enumeration != null) {
      if (params is String && params.isEmpty) return 'null';
      return '${shape.className}.${toEnumerationFieldName('$params')}';
    } else if (shape.type == 'blob' && params is String) {
      return "Uint8List.fromList('$params'.codeUnits)";
    } else if (shape.type == 'timestamp') {
      return 'DateTime.fromMillisecondsSinceEpoch($params * 1000)';
    } else if (_specialFloatLiteral(shape, params) case final literal?) {
      return literal;
    } else {
      final value = jsonEncode(params);
      return value;
    }
  }
}

// Smithy encodes special floats as JSON strings; emit as Dart literals.
const _specialFloatLiterals = <String, String>{
  'Infinity': 'double.infinity',
  '-Infinity': 'double.negativeInfinity',
  'NaN': 'double.nan',
};

bool _isFloatingShape(Shape shape) =>
    shape.type == 'double' || shape.type == 'float';

String? _specialFloatLiteral(Shape shape, Object? value) =>
    _isFloatingShape(shape) && value is String
        ? _specialFloatLiterals[value]
        : null;

String? _specialFloatMatcher(Shape shape, Object? value) {
  if (!_isFloatingShape(shape) || value is! String) return null;
  if (value == 'NaN') return 'isNaN';
  return _specialFloatLiterals[value];
}

String _removeTrailingMark(String input) {
  if (input.endsWith('?') || input.endsWith('!')) {
    return input.substring(0, input.length - 1);
  }
  return input;
}
