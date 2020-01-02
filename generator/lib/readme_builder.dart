import 'model/api.dart';
import 'utils/documentation_utils.dart';

// TODO: add option to update existing readme.
String buildReadmeMd(Api api) {
  return '''
# AWS API client for ${api.metadata.serviceFullName}

${markdownText(api.documentation)}

## Warning

**This is a generated library, some operations may not work.**
Please report bugs at [our issue tracker](https://github.com/agilord/aws_client/issues).

''';
}
