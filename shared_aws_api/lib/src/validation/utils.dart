void validateStringPattern(String name, String str, String pattern) {
  if (!RegExp(pattern).hasMatch(str)) {
    throw ArgumentError.value(
      str,
      name,
      'Argument does not conform to $pattern',
    );
  }
}

void validateStringLength(String name, String str, int min, int max) {
  if (min > str.length || str.length > max) {
    throw ArgumentError.value(
        str, name, '"$name" is either longer than $max or shorter than $min');
  }
}

void validateNumRange(String name, num value, int min, int max) {
  if (min > value || value > max) {
    throw RangeError.range(value, min, max, name);
  }
}
