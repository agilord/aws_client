import 'package:http/http.dart';

import '../../../credential_providers/src/default_providers/default_providers_io.dart';
import '../credentials.dart';

/// The full default chain (environment, web identity, shared config files,
/// container endpoint, instance metadata), cached process-wide and refreshed
/// before temporary credentials expire.
Future<AwsClientCredentials?> defaultCredentialsProvider({Client? client}) =>
    defaultProvider(client: client);
