import '../model/api.dart';
import '../utils/documentation_utils.dart';

// TODO: add option to update existing readme.
String buildReadmeMd(Api api) {
  return '''
# AWS API client for ${api.metadata.serviceFullName}

**Warning: This is a generated library, some operations may not work.**

*About the service:*
${markdownText(api.documentation.replaceFirst('http', 'https'))}

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

''';
}
