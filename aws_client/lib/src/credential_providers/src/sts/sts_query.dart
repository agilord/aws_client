import '../../../generated/sts/v2011_06_15.endpoints.dart' as sts_endpoints;
import '../../../shared/shared.dart';

const _version = '2011-06-15';

Future<AwsClientCredentials?> _noCredentials({Client? client}) =>
    Future.value();

/// The two STS calls the credential providers need, spoken over the query
/// protocol directly.
///
/// The runtime every generated client is built on must not itself depend on
/// a generated client, so this deliberately does not import `Sts`. It still
/// goes through the shared endpoint ruleset, signer and retry logic.
class StsQuery {
  final QueryProtocol _protocol;

  StsQuery._(this._protocol);

  /// Without [credentials] only the unsigned [assumeRoleWithWebIdentity] can
  /// be called: a signed call then fails instead of recursing into the
  /// default provider chain this class is itself part of.
  factory StsQuery({
    required String region,
    Client? client,
    AwsClientCredentials? credentials,
  }) {
    const service = ServiceMetadata(endpointPrefix: 'sts');
    return StsQuery._(
      QueryProtocol(
        client: client,
        endpointBuilder: () => Endpoint.fromResolved(
          sts_endpoints.resolveEndpoint(region: region),
          service: service,
          region: region,
        ),
        credentials: credentials,
        credentialsProvider: credentials == null ? _noCredentials : null,
      ),
    );
  }

  Future<AwsClientCredentials> assumeRole({
    required String roleArn,
    required String roleSessionName,
    String? externalId,
  }) async {
    final result = await _protocol.send(
      {
        'RoleArn': roleArn,
        'RoleSessionName': roleSessionName,
        if (externalId != null) 'ExternalId': externalId,
      },
      action: 'AssumeRole',
      version: _version,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: const {},
      resultWrapper: 'AssumeRoleResult',
    );
    return _credentialsFromXml(result);
  }

  Future<AwsClientCredentials> assumeRoleWithWebIdentity({
    required String roleArn,
    required String roleSessionName,
    required String webIdentityToken,
  }) async {
    final result = await _protocol.send(
      {
        'RoleArn': roleArn,
        'RoleSessionName': roleSessionName,
        'WebIdentityToken': webIdentityToken,
      },
      action: 'AssumeRoleWithWebIdentity',
      version: _version,
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: const {},
      signed: false,
      resultWrapper: 'AssumeRoleWithWebIdentityResult',
    );
    return _credentialsFromXml(result);
  }

  /// Closes the HTTP client if this instance created it.
  void close() => _protocol.close();

  static AwsClientCredentials _credentialsFromXml(XmlElement result) {
    final elem = extractXmlChild(result, 'Credentials');
    if (elem == null) {
      throw StateError('STS response has no Credentials element');
    }
    return AwsClientCredentials(
      accessKey: extractXmlStringValue(elem, 'AccessKeyId')!,
      secretKey: extractXmlStringValue(elem, 'SecretAccessKey')!,
      sessionToken: extractXmlStringValue(elem, 'SessionToken'),
      expiration: extractXmlDateTimeValue(elem, 'Expiration'),
    );
  }
}
