import 'package:aws_client.generator/model/descriptor.dart';
import 'package:meta/meta.dart';
import '../model/dart_type.dart';
import '../model/shape.dart';
import '../utils/string_utils.dart';

class Nullability {
  static final inputOutput = Nullability._(true, true);
  static final input = Nullability._(true, false);
  static final none = Nullability._(false, false);

  final bool inputNullable, outputNullable;

  Nullability._(this.inputNullable, this.outputNullable);

  String get inputNullAware => inputNullable ? '?' : '';

  String get outputBang => inputNullable && !outputNullable ? '!' : '';

  bool get isNullable => inputNullable || outputNullable;
}

String extractJsonCode(Shape shape, String variable,
    {Member member, @required Nullability nullability, String variableType}) {
  if (member?.jsonvalue == true || shape.member?.jsonvalue == true) {
    if (shape.type == 'list') {
      return '$variable == null ? null : ($variable as List).map((v) => jsonDecode(v as String)).toList().cast<Object>()';
    }
    final encoder = 'jsonDecode($variable as String)';
    if (nullability.outputNullable) {
      return '$variable == null ? null : $encoder';
    } else {
      return '$encoder as Object';
    }
  } else if (shape.type == 'map') {
    final nullAware = nullability.outputNullable ? '?' : '';
    final keyCode = extractJsonCode(shape.key.shapeClass, 'k',
        nullability: Nullability.none, variableType: 'String');
    final valueCode = extractJsonCode(shape.value.shapeClass, 'e',
        nullability: Nullability.none);
    return '($variable as Map<String, dynamic>$nullAware)$nullAware.map((k, e) => MapEntry($keyCode, $valueCode))';
  } else if (shape.type == 'list') {
    final nullAware = nullability.outputNullable ? '?' : '';
    var closureCode = extractJsonCode(shape.member.shapeClass, 'e',
        nullability: Nullability.none);
    closureCode = _createClosure('e', closureCode);
    return '($variable as List$nullAware)$nullAware.whereNotNull().map($closureCode).toList()';
  } else if (shape.type == 'structure') {
    final code =
        '${shape.className}.fromJson($variable as Map<String, dynamic>)';
    if (nullability.outputNullable) {
      return '$variable != null ? $code : null';
    } else {
      return code;
    }
  } else if (shape.enumeration?.isNotEmpty ?? false) {
    shape.isTopLevelOutputEnum = true;
    final nullAware = nullability.outputNullable ? '?' : '';
    var variableAccessor = variable;
    if (variableType != 'String') {
      variableAccessor = '($variableAccessor as String$nullAware)';
    }
    return '$variableAccessor$nullAware.to${shape.className}()';
  } else if (shape.type == 'timestamp') {
    final method = nullability.outputNullable
        ? 'timeStampFromJson'
        : 'nonNullableTimeStampFromJson';
    final cast = nullability.inputNullable && !nullability.outputNullable
        ? ' as Object'
        : '';
    return '$method($variable$cast)';
  } else if (shape.type == 'blob') {
    if (nullability.outputNullable) {
      return '_s.decodeNullableUint8List($variable as String?)';
    } else {
      return '_s.decodeUint8List($variable${nullability.inputNullable ? '!' : ''} as String)';
    }
  } else {
    final nullAware = nullability.outputNullable ? '?' : '';
    final castType = '${shape.type.getDartType(shape.api)}$nullAware';
    if (castType != variableType) {
      return '$variable as $castType';
    } else {
      return variable;
    }
  }
}

String encodeJsonCode(Shape shape, String variable,
    {Member member, @required Nullability nullability}) {
  if (member?.jsonvalue == true || shape.member?.jsonvalue == true) {
    if (shape.type == 'list') {
      final nullAware = nullability.isNullable ? '?' : '';
      return '$variable$nullAware.map(jsonEncode).toList()';
    }
    final encoder = 'jsonEncode($variable)';
    if (nullability.inputNullable) {
      return '$variable == null ? null : $encoder';
    } else {
      return encoder;
    }
  } else if (shape.type == 'map') {
    final keyCode = encodeJsonCode(shape.key.shapeClass, 'k',
        nullability: Nullability.none);
    final valueCode = encodeJsonCode(shape.value.shapeClass, 'e',
        nullability: Nullability.none);
    if (keyCode != 'k' || valueCode != 'e') {
      return '$variable${nullability.inputNullAware}.map((k, e) => MapEntry($keyCode, $valueCode))';
    }
  } else if (shape.type == 'list') {
    final valueCode = encodeJsonCode(shape.member.shapeClass, 'e',
        nullability: Nullability.none);
    final nullAware = nullability.isNullable ? '?' : '';
    if (valueCode != 'e') {
      final closureCode = _createClosure('e', valueCode);
      return '$variable$nullAware.map($closureCode)$nullAware.toList()';
    }
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable${nullability.inputNullAware}.toValue()${nullability == Nullability.input ? "?? ''" : ''}';
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'unixTimestamp';
    return '${timestampFormat}ToJson($variable)';
  } else if (shape.type == 'blob') {
    if (nullability.inputNullable) {
      return '$variable?.let(base64Encode)';
    } else {
      return 'base64Encode($variable)';
    }
  }
  return '$variable';
}

// Try to prevent "unnecessary_lambdas" lint
String _createClosure(String variableName, String closureCode) {
  final methodName = closureCode.split('(').first;
  if (closureCode == '$methodName($variableName)') {
    return methodName;
  }
  return '($variableName) => $closureCode';
}

String encodeXmlCode(Shape shape, String variable,
    {Member structureMember,
    Descriptor listMember,
    Descriptor value,
    Descriptor key,
    @required Nullability nullability}) {
  final elemName = structureMember?.locationName ??
      value?.locationName ??
      key?.locationName ??
      listMember?.locationName ??
      shape.locationName ??
      (value != null ? 'value' : null) ??
      (key != null ? 'key' : null) ??
      (listMember != null ? 'member' : null) ??
      structureMember.name;

  if (shape.type == 'map') {
    final keyCode = encodeXmlCode(shape.key.shapeClass, 'e.key',
        key: shape.key, nullability: Nullability.none);
    final valueCode = encodeXmlCode(shape.value.shapeClass, 'e.value',
        value: shape.value, nullability: Nullability.none);
    final fn =
        "$variable${nullability.inputNullAware}.entries.map((e) => _s.XmlElement(_s.XmlName('entry'), [], <_s.XmlNode>[$keyCode, $valueCode]))";
    return '_s.XmlElement(_s.XmlName(\'$elemName\'), [], $fn)';
  } else if (shape.type == 'list') {
    final flattened = shape.flattened || (structureMember?.flattened ?? false);
    final valueCode = encodeXmlCode(shape.member.shapeClass, 'e',
        structureMember: flattened ? structureMember : null,
        listMember: flattened ? null : shape.member,
        nullability: Nullability.none);
    final nullAware = nullability.inputNullAware;
    var fn = '$variable$nullAware.map((e) => $valueCode)';

    if (flattened) {
      fn = '...$fn';
    } else {
      fn = '_s.XmlElement(_s.XmlName(\'$elemName\'), [], $fn)';
    }
    return fn;
  } else if (shape.type == 'structure') {
    return '$variable${nullability.inputNullAware}.toXml(\'$elemName\')';
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        structureMember?.timestampFormat ?? shape.timestampFormat;
    var formatterArg = '';
    if (timestampFormat != null) {
      formatterArg = ', formatter: _s.${timestampFormat}ToJson';
    }
    return '_s.encodeXmlDateTimeValue(\'$elemName\', $variable$formatterArg)';
  }

  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    variable =
        "$variable${nullability.inputNullAware}.toValue()${nullability == Nullability.input ? " ?? ''" : ''}";
  }

  final dartType = shape.type.getDartType(shape.api);
  return '_s.encodeXml${uppercaseName(dartType)}Value(\'$elemName\', $variable)';
}
