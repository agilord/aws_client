String canonicalQueryParameters(Map<String, String> query) {
  return canonicalQueryParametersAll(
      query.map((key, value) => MapEntry(key, [value])));
}

String canonicalQueryParametersAll(Map<String, List<String>> query) {
  final items = <String>[];
  for (var key in query.keys) {
    for (var value in query[key]!) {
      items.add(
          '${Uri.encodeQueryComponent(key).replaceAll('+', '%20')}=${Uri.encodeQueryComponent(value).replaceAll('+', '%20')}');
    }
  }
  items.sort();
  return items.join('&');
}
