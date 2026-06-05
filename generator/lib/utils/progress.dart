import 'dart:io';

void printPercentageInPlace(int percentage, String message) {
  final progress =
      '${loadingBar(percentage)} ${percentage.toString().padLeft(3)}% $message';
  if (stdout.hasTerminal) {
    stdout.write('\r${' ' * stdout.terminalColumns}');
    stdout.write('\r$progress'.truncateTo(stdout.terminalColumns));
  } else {
    print(progress);
  }
}

String loadingBar(int percentage) {
  final chars = '#' * ((percentage ~/ 10) + 1);
  return '[${chars.padRight(10)}]';
}

extension StringExtension on String {
  String truncateTo(int maxLength) =>
      (length <= maxLength) ? this : '${substring(0, maxLength - 3)}...';
}
