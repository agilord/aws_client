void validateStringPattern(
  String name,
  String value,
  String pattern, {
  bool isRequired = false,
}) {
  if (value == null && !isRequired) return;

  if (!RegExp(pattern).hasMatch(value)) {
    throw ArgumentError.value(
      value,
      name,
      'Argument does not conform to $pattern',
    );
  }
}

void validateStringLength(
  String name,
  String value,
  int min,
  int max, {
  bool isRequired = false,
}) {
  if (value == null && !isRequired) return;

  ArgumentError.checkNotNull(value, name);
  ArgumentError.checkNotNull(min, 'min');
  ArgumentError.checkNotNull(max, 'max');
  if ((min > value.length || value.length > max)) {
    throw ArgumentError.value(
      value,
      name,
      '"$name" is either longer than $max or shorter than $min',
    );
  }
}

void validateNumRange(
  String name,
  num value,
  int min,
  int max, {
  bool isRequired = false,
}) {
  if (value == null && !isRequired) return;

  ArgumentError.checkNotNull(value, name);
  ArgumentError.checkNotNull(min, 'min');
  ArgumentError.checkNotNull(max, 'max');
  if (value.isNaN) {
    throw ArgumentError.value(value, name, '$name is not a number');
  }

  if (min > value || value > max) {
    throw RangeError.range(value, min, max, name);
  }
}
