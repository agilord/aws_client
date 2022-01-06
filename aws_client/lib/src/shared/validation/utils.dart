void validateNumRange(
  String? name,
  num? value,
  int? min,
  int? max, {
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
    throw RangeError.range(value, min, max, name);
  }
}
