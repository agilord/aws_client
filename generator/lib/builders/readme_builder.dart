import '../model/api.dart';
import '../utils/documentation_utils.dart';

// TODO: add option to update existing readme.
String buildReadmeMd(Api api) {
  return '''
# AWS API client for ${api.metadata.serviceFullName}

**Generated Dart library from API specification**

${_prepareDocumentation(api)}

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
''';
}

String _prepareDocumentation(Api api) {
  var doc = markdownText(api.documentation);
  doc = doc.replaceAll('http://', 'https://');

  return [
    if (doc.isNotEmpty) '*About the service:*',
    doc,
  ].join('\n');
}
