// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// AppConfig Data provides the data plane APIs your application uses to
/// retrieve configuration data. Here's how it works:
///
/// Your application retrieves configuration data by first establishing a
/// configuration session using the AppConfig Data
/// <a>StartConfigurationSession</a> API action. Your session's client then
/// makes periodic calls to <a>GetLatestConfiguration</a> to check for and
/// retrieve the latest data available.
///
/// When calling <code>StartConfigurationSession</code>, your code sends the
/// following information:
///
/// <ul>
/// <li>
/// Identifiers (ID or name) of an AppConfig application, environment, and
/// configuration profile that the session tracks.
/// </li>
/// <li>
/// (Optional) The minimum amount of time the session's client must wait between
/// calls to <code>GetLatestConfiguration</code>.
/// </li>
/// </ul>
/// In response, AppConfig provides an <code>InitialConfigurationToken</code> to
/// be given to the session's client and used the first time it calls
/// <code>GetLatestConfiguration</code> for that session.
/// <important>
/// This token should only be used once in your first call to
/// <code>GetLatestConfiguration</code>. You <i>must</i> use the new token in
/// the <code>GetLatestConfiguration</code> response
/// (<code>NextPollConfigurationToken</code>) in each subsequent call to
/// <code>GetLatestConfiguration</code>.
/// </important>
/// When calling <code>GetLatestConfiguration</code>, your client code sends the
/// most recent <code>ConfigurationToken</code> value it has and receives in
/// response:
///
/// <ul>
/// <li>
/// <code>NextPollConfigurationToken</code>: the <code>ConfigurationToken</code>
/// value to use on the next call to <code>GetLatestConfiguration</code>.
/// </li>
/// <li>
/// <code>NextPollIntervalInSeconds</code>: the duration the client should wait
/// before making its next call to <code>GetLatestConfiguration</code>. This
/// duration may vary over the course of the session, so it should be used
/// instead of the value sent on the <code>StartConfigurationSession</code>
/// call.
/// </li>
/// <li>
/// The configuration: the latest data intended for the session. This may be
/// empty if the client already has the latest version of the configuration.
/// </li>
/// </ul> <important>
/// The <code>InitialConfigurationToken</code> and
/// <code>NextPollConfigurationToken</code> should only be used once. To support
/// long poll use cases, the tokens are valid for up to 24 hours. If a
/// <code>GetLatestConfiguration</code> call uses an expired token, the system
/// returns <code>BadRequestException</code>.
/// </important>
/// For more information and to view example CLI commands that show how to
/// retrieve a configuration using the AppConfig Data
/// <code>StartConfigurationSession</code> and
/// <code>GetLatestConfiguration</code> API actions, see <a
/// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-the-configuration">Retrieving
/// the configuration</a> in the <i>AppConfig User Guide</i>.
class AppConfigData {
  final _s.RestJsonProtocol _protocol;
  AppConfigData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appconfigdata',
            signingName: 'appconfig',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Retrieves the latest deployed configuration. This API may return empty
  /// configuration data if the client already has the latest version. For more
  /// information about this API action and to view example CLI commands that
  /// show how to use it with the <a>StartConfigurationSession</a> API action,
  /// see <a
  /// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-the-configuration">Retrieving
  /// the configuration</a> in the <i>AppConfig User Guide</i>.
  /// <important>
  /// Note the following important information.
  ///
  /// <ul>
  /// <li>
  /// Each configuration token is only valid for one call to
  /// <code>GetLatestConfiguration</code>. The
  /// <code>GetLatestConfiguration</code> response includes a
  /// <code>NextPollConfigurationToken</code> that should always replace the
  /// token used for the just-completed call in preparation for the next one.
  /// </li>
  /// <li>
  /// <code>GetLatestConfiguration</code> is a priced call. For more
  /// information, see <a
  /// href="https://aws.amazon.com/systems-manager/pricing/">Pricing</a>.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationToken] :
  /// Token describing the current state of the configuration session. To obtain
  /// a token, first call the <a>StartConfigurationSession</a> API. Note that
  /// every call to <code>GetLatestConfiguration</code> will return a new
  /// <code>ConfigurationToken</code> (<code>NextPollConfigurationToken</code>
  /// in the response) and <i>must</i> be provided to subsequent
  /// <code>GetLatestConfiguration</code> API calls.
  /// <important>
  /// This token should only be used once. To support long poll use cases, the
  /// token is valid for up to 24 hours. If a
  /// <code>GetLatestConfiguration</code> call uses an expired token, the system
  /// returns <code>BadRequestException</code>.
  /// </important>
  Future<GetLatestConfigurationResponse> getLatestConfiguration({
    required String configurationToken,
  }) async {
    final $query = <String, List<String>>{
      'configuration_token': [configurationToken],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLatestConfigurationResponse(
      configuration: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      nextPollConfigurationToken: _s.extractHeaderStringValue(
          response.headers, 'Next-Poll-Configuration-Token'),
      nextPollIntervalInSeconds: _s.extractHeaderIntValue(
          response.headers, 'Next-Poll-Interval-In-Seconds'),
      versionLabel:
          _s.extractHeaderStringValue(response.headers, 'Version-Label'),
    );
  }

  /// Starts a configuration session used to retrieve a deployed configuration.
  /// For more information about this API action and to view example CLI
  /// commands that show how to use it with the <a>GetLatestConfiguration</a>
  /// API action, see <a
  /// href="http://docs.aws.amazon.com/appconfig/latest/userguide/appconfig-retrieving-the-configuration">Retrieving
  /// the configuration</a> in the <i>AppConfig User Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The application ID or the application name.
  ///
  /// Parameter [configurationProfileIdentifier] :
  /// The configuration profile ID or the configuration profile name.
  ///
  /// Parameter [environmentIdentifier] :
  /// The environment ID or the environment name.
  ///
  /// Parameter [requiredMinimumPollIntervalInSeconds] :
  /// Sets a constraint on a session. If you specify a value of, for example, 60
  /// seconds, then the client that established the session can't call
  /// <a>GetLatestConfiguration</a> more frequently than every 60 seconds.
  Future<StartConfigurationSessionResponse> startConfigurationSession({
    required String applicationIdentifier,
    required String configurationProfileIdentifier,
    required String environmentIdentifier,
    int? requiredMinimumPollIntervalInSeconds,
  }) async {
    _s.validateNumRange(
      'requiredMinimumPollIntervalInSeconds',
      requiredMinimumPollIntervalInSeconds,
      15,
      86400,
    );
    final $payload = <String, dynamic>{
      'ApplicationIdentifier': applicationIdentifier,
      'ConfigurationProfileIdentifier': configurationProfileIdentifier,
      'EnvironmentIdentifier': environmentIdentifier,
      if (requiredMinimumPollIntervalInSeconds != null)
        'RequiredMinimumPollIntervalInSeconds':
            requiredMinimumPollIntervalInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configurationsessions',
      exceptionFnMap: _exceptionFns,
    );
    return StartConfigurationSessionResponse.fromJson(response);
  }
}

class GetLatestConfigurationResponse {
  /// The data of the configuration. This may be empty if the client already has
  /// the latest version of configuration.
  final Uint8List? configuration;

  /// A standard MIME type describing the format of the configuration content.
  final String? contentType;

  /// The latest token describing the current state of the configuration session.
  /// This <i>must</i> be provided to the next call to
  /// <code>GetLatestConfiguration.</code>
  /// <important>
  /// This token should only be used once. To support long poll use cases, the
  /// token is valid for up to 24 hours. If a <code>GetLatestConfiguration</code>
  /// call uses an expired token, the system returns
  /// <code>BadRequestException</code>.
  /// </important>
  final String? nextPollConfigurationToken;

  /// The amount of time the client should wait before polling for configuration
  /// updates again. Use <code>RequiredMinimumPollIntervalInSeconds</code> to set
  /// the desired poll interval.
  final int? nextPollIntervalInSeconds;

  /// The user-defined label for the AppConfig hosted configuration version. This
  /// attribute doesn't apply if the configuration is not from an AppConfig hosted
  /// configuration version. If the client already has the latest version of the
  /// configuration data, this value is empty.
  final String? versionLabel;

  GetLatestConfigurationResponse({
    this.configuration,
    this.contentType,
    this.nextPollConfigurationToken,
    this.nextPollIntervalInSeconds,
    this.versionLabel,
  });

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final contentType = this.contentType;
    final nextPollConfigurationToken = this.nextPollConfigurationToken;
    final nextPollIntervalInSeconds = this.nextPollIntervalInSeconds;
    final versionLabel = this.versionLabel;
    return {
      if (configuration != null) 'Configuration': base64Encode(configuration),
    };
  }
}

class StartConfigurationSessionResponse {
  /// Token encapsulating state about the configuration session. Provide this
  /// token to the <code>GetLatestConfiguration</code> API to retrieve
  /// configuration data.
  /// <important>
  /// This token should only be used once in your first call to
  /// <code>GetLatestConfiguration</code>. You <i>must</i> use the new token in
  /// the <code>GetLatestConfiguration</code> response
  /// (<code>NextPollConfigurationToken</code>) in each subsequent call to
  /// <code>GetLatestConfiguration</code>.
  ///
  /// The <code>InitialConfigurationToken</code> and
  /// <code>NextPollConfigurationToken</code> should only be used once. To support
  /// long poll use cases, the tokens are valid for up to 24 hours. If a
  /// <code>GetLatestConfiguration</code> call uses an expired token, the system
  /// returns <code>BadRequestException</code>.
  /// </important>
  final String? initialConfigurationToken;

  StartConfigurationSessionResponse({
    this.initialConfigurationToken,
  });

  factory StartConfigurationSessionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartConfigurationSessionResponse(
      initialConfigurationToken: json['InitialConfigurationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initialConfigurationToken = this.initialConfigurationToken;
    return {
      if (initialConfigurationToken != null)
        'InitialConfigurationToken': initialConfigurationToken,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
