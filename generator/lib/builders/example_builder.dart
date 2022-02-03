import 'package:aws_client.generator/model/api.dart';

String buildExampleReadme(Api api) => '''
```dart
import 'package:${api.packageName}/${api.fileBasename}.dart';

void main() {
  final service = ${api.metadata.className}(region: 'eu-west-1');
}
```

See [API reference](https://pub.dev/documentation/${api.packageName}/latest/${api.fileBasename}/${api.metadata.className}-class.html) on how to use ${api.metadata.className}
''';
