String capitalize(String word) {
  if (word.isEmpty) return word;

  return replaceAt(word, 0, transformer: (s) => s.toUpperCase());
}

String replaceAt(String input, int startIndex,
    {int endIndex, String Function(String) transformer}) {
  endIndex ??= startIndex + 1;

  if (startIndex < 0) throw RangeError.value(startIndex);
  if (startIndex > endIndex) throw RangeError.value(startIndex);
  if (endIndex > input.length) throw RangeError.value(endIndex);

  final before = input.substring(0, startIndex);
  final toReplace = input.substring(startIndex, endIndex);
  final after = input.substring(endIndex);

  final replace = transformer(toReplace);
  return '$before$replace$after';
}

String lowerCamel(Iterable<String> input) {
  return _mapWithIndex<String, String>(
          input, (s, index) => index != 0 ? capitalize(s) : s.toLowerCase())
      .join('');
}

String upperCamel(Iterable<String> input) {
  return input.map(capitalize).join('');
}

String lowerHyphen(Iterable<String> input) {
  return input.map((s) => s.toLowerCase()).join('-');
}

String snakeCase(Iterable<String> input) {
  return input.map((s) => s.toLowerCase()).join('_');
}

Iterable<T> _mapWithIndex<E, T>(
    Iterable<E> collection, T Function(E, int) f) sync* {
  var index = 0;
  for (var element in collection) {
    yield f(element, index);
    ++index;
  }
}

final _nonAlphaSplitter = RegExp(r'[^\p{L}0-9]', unicode: true);
List<String> splitWords(String input) {
  if (input.isEmpty) return [];

  final outputs = <String>[];

  for (var word in input.split(_nonAlphaSplitter)) {
    final words = <String>[];

    var currentWord = '';
    var lastChar = '';

    for (var rune in word.runes) {
      final char = String.fromCharCode(rune);

      if (!_isLower(char) && !_isUpper(char) && !_isNum(char)) {
        currentWord += lastChar;
        lastChar = '';
        if (currentWord.isNotEmpty) {
          words.add(currentWord);
          currentWord = '';
        }
      } else if (_isUpper(char) && _isLower(lastChar)) {
        currentWord += lastChar;
        words.add(currentWord);
        currentWord = '';
        lastChar = char;
      } else if (_isLower(char) && _isUpper(lastChar)) {
        words.add(currentWord);
        currentWord = lastChar;
        lastChar = char;
      } else if ((_isLower(char) || _isUpper(char)) && _isNum(lastChar)) {
        currentWord += lastChar;
        if (currentWord.length > 1) {
          words.add(currentWord);
          currentWord = '';
        }
        lastChar = char;
      } else if ((_isLower(lastChar) || _isUpper(lastChar)) &&
          _isNum(char) &&
          currentWord.isNotEmpty) {
        currentWord += lastChar;
        words.add(currentWord);
        currentWord = '';
        lastChar = char;
      } else {
        currentWord += lastChar;
        lastChar = char;
      }
    }

    currentWord += lastChar;

    words
      ..add(currentWord)
      ..removeWhere((w) => w.isEmpty);

    for (var i = 0; i < words.length; i++) {
      final word = words[i];

      if (word.length == 1) {
        if (i > 0) {
          final previousWord = words[i - 1];
          words[i - 1] = previousWord + word;
          words.removeAt(i);
          --i;
        }
      }
    }

    outputs.addAll(words);
  }

  return outputs;
}

final RegExp _num = RegExp(r'[0-9]');
bool _isNum(String char) => _num.hasMatch(char);

final RegExp _upper = RegExp(r'[A-ZÀ-Ú]');
bool _isUpper(String char) => _upper.hasMatch(char);

final RegExp _lower = RegExp(r'[a-zà-ú]');
bool _isLower(String char) => _lower.hasMatch(char);
