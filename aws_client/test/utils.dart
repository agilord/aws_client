import 'dart:convert';

import 'package:aws_client/src/shared/utils/query_string.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

String pathAndQuery(Uri uri) {
  if (uri.hasQuery && uri.query.isNotEmpty) {
    return '${uri.path}?${canonicalQueryParametersAll(uri.queryParametersAll)}';
  }
  return uri.path;
}

Matcher equalsPathAndQuery(String value) => _PathAndQueryEqual(value);

Matcher equalsJson(String value) => _JsonEqual(value);

Matcher equalsQuery(String value) => _QueryEqual(value);

Matcher equalsXml(String value) => _XmlEqual(value);

class _PathAndQueryEqual extends _FeatureMatcher<Uri> {
  final String _expected;

  _PathAndQueryEqual(String expected)
      : _expected = _canonical(Uri.parse(expected));

  static String _canonical(Uri uri) {
    return Uri(
      path: uri.path,
      query: canonicalQueryParametersAll(uri.queryParametersAll),
    ).toString();
  }

  @override
  bool typedMatches(Uri item, Map matchState) {
    return equals(_expected).matches(_canonical(item), matchState);
  }

  @override
  Description describe(Description description) {
    return description.add("path and query '$_expected'");
  }
}

class _JsonEqual extends _FeatureMatcher<String> {
  final String _expected;

  _JsonEqual(this._expected);

  @override
  bool typedMatches(String item, Map matchState) {
    if (item == null || item.isEmpty || _expected == null) {
      return equals(_expected).matches(item, matchState);
    }
    final expectedJson = _tryParseJson(_expected);
    if (expectedJson == null) {
      var rawExpected = _expected as dynamic;
      if (item is List<int>) {
        rawExpected = _expected.codeUnits;
      }

      return equals(rawExpected).matches(item, matchState);
    }

    final itemJson = _tryParseJson(item);
    if (itemJson == null) {
      matchState['error'] = 'Actual is not valid JSON';
      return false;
    }

    return equals(expectedJson).matches(itemJson, matchState);
  }

  Object _tryParseJson(String input) {
    try {
      return jsonDecode(input);
    } catch (_) {
      return null;
    }
  }

  @override
  Description describe(Description description) {
    return description.add("json '$_expected'");
  }

  @override
  Description describeTypedMismatch(String item,
      Description mismatchDescription, Map matchState, bool verbose) {
    if (matchState.containsKey('error')) {
      mismatchDescription =
          mismatchDescription.add(matchState['expected'] as String);
    }
    return super
        .describeTypedMismatch(item, mismatchDescription, matchState, verbose);
  }
}

class _XmlEqual extends _FeatureMatcher<String> {
  final String _expected;

  _XmlEqual(this._expected);

  @override
  bool typedMatches(String item, Map matchState) {
    if (item == null || item.isEmpty) {
      return equals(_expected).matches(item, matchState);
    }
    final expectedXml = _tryParseXml(_expected);
    if (expectedXml == null) {
      return equals(_expected).matches(item, matchState);
    }

    final itemXml = _tryParseXml(item);
    if (itemXml == null) {
      matchState['error'] = 'Actual is not valid XML document';
      return false;
    }

    return equals(expectedXml.toXmlString(pretty: true))
        .matches(itemXml.toXmlString(pretty: true), matchState);
  }

  XmlDocument _tryParseXml(String input) {
    try {
      return XmlDocument.parse(input);
    } catch (_) {
      return null;
    }
  }

  @override
  Description describe(Description description) {
    return description.add("xml '$_expected'");
  }

  @override
  Description describeTypedMismatch(String item,
      Description mismatchDescription, Map matchState, bool verbose) {
    if (matchState.containsKey('error')) {
      mismatchDescription =
          mismatchDescription.add(matchState['error'] as String);
    }
    return super
        .describeTypedMismatch(item, mismatchDescription, matchState, verbose);
  }
}

class _QueryEqual extends _FeatureMatcher<String> {
  final String _expected;

  _QueryEqual(this._expected);

  static String _canonical(String query) {
    return canonicalQueryParametersAll(Uri(query: query).queryParametersAll);
  }

  @override
  bool typedMatches(String item, Map matchState) {
    return equals(_canonical(_expected)).matches(_canonical(item), matchState);
  }

  @override
  Description describe(Description description) {
    return description.add("query '$_expected'");
  }
}

abstract class _FeatureMatcher<T> extends TypeMatcher<T> {
  const _FeatureMatcher();

  @override
  bool matches(item, Map matchState) =>
      super.matches(item, matchState) && typedMatches(item as T, matchState);

  bool typedMatches(T item, Map matchState);

  @override
  Description describeMismatch(
      item, Description mismatchDescription, Map matchState, bool verbose) {
    if (item is T) {
      return describeTypedMismatch(
          item, mismatchDescription, matchState, verbose);
    }

    return super.describe(mismatchDescription.add('not an '));
  }

  Description describeTypedMismatch(T item, Description mismatchDescription,
          Map matchState, bool verbose) =>
      mismatchDescription;
}
