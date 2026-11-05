import 'package:http/http.dart';

import '../credentials.dart';

/// None of the default chain's sources exist in a browser, so a client built
/// without credentials can only sign once it is given some explicitly.
Future<AwsClientCredentials?> defaultCredentialsProvider({Client? client}) =>
    Future.value(AwsClientCredentials.resolve());
