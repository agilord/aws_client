String canonicalQueryParameters(Map<String, String> query) {
  return canonicalQueryParametersAll(
      query.map((key, value) => MapEntry(key, [value])));
}

String canonicalQueryParametersAll(Map<String, List<String>> query) {
  final items = <String>[];
  for (var key in query.keys) {
    for (var value in query[key]) {
      items.add(
          '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value)}');
    }
  }
  items.sort();
  return items.join('&');
}
