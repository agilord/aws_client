/// This function returns immediately without doing any checks.
/// The regexes in the API definitions are PCRE regexes which are either
/// invalid or produce incorrect results in an ECMA compliant regex engine.
void validateStringPattern(
  String name,
  String? value,
  String pattern, {
  bool isRequired = false,
}) {
  return;
  /*if (value == null) {
    if (isRequired) {
      throw ArgumentError.notNull(name);
    } else {
      return;
    }
  }

  if (!RegExp(pattern).hasMatch(value)) {
    throw ArgumentError.value(
      value,
      name,
      'Argument does not conform to $pattern',
    );
  }*/
}

void validateStringLength(
  String? name,
  String? value,
  int? min,
  int? max, {
  bool isRequired = false,
}) {
  if (value == null && !isRequired) return;

  ArgumentError.checkNotNull(value, name);
  ArgumentError.checkNotNull(min, 'min');
  ArgumentError.checkNotNull(max, 'max');
  if ((min! > value!.length || value.length > max!)) {
    throw ArgumentError.value(
      value,
      name,
      '"$name" is either longer than $max or shorter than $min',
    );
  }
}

void validateNumRange(
  String? name,
  num? value,
  num? min,
  num? max, {
  bool isRequired = false,
}) {
  if (value == null && !isRequired) return;

  ArgumentError.checkNotNull(value, name);
  ArgumentError.checkNotNull(min, 'min');
  ArgumentError.checkNotNull(max, 'max');
  if (value!.isNaN) {
    throw ArgumentError.value(value, name, '$name is not a number');
  }

  if (min! > value || value > max!) {
    throw ArgumentError.value(
        value, name, '$value is not within range [$min - $max]');
  }
}
