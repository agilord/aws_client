class AwsException implements Exception {
  final String type;
  final String code;
  final String message;

  AwsException({this.type, this.code, this.message});

  @override
  String toString() => '$code: $message';
}

typedef AwsExceptionFn = AwsException Function(String type, String message);
