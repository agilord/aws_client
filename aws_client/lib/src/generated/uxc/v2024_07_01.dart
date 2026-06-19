// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// This is the Amazon Web Services User Experience Customization (UXC) API
/// Reference. Amazon Web Services User Experience Customization (UXC) is a
/// utility that provides programmatic access to enable account administrators
/// to customize the visual appearance of the Amazon Web Services Management
/// Console and manage these settings at the account level.
/// <note>
/// The <code>visibleServices</code> and <code>visibleRegions</code> settings
/// control only the appearance of services and Regions in the Amazon Web
/// Services Management Console. They do not restrict access through the CLI,
/// SDKs, or other APIs.
/// </note>
/// For more information about UXC features and console procedures, see <a
/// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/getting-started-uxc.html">Getting
/// started with Amazon Web Services User Experience Customization</a>. For
/// information about required permissions, see <a
/// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/security_iam.html">Identity
/// and access management for Amazon Web Services Management Console</a>.
class Uxc {
  final _s.RestJsonProtocol _protocol;
  Uxc({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'uxc',
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

  /// Returns the current account customization settings, including account
  /// color, visible services, and visible Regions. Settings that you have not
  /// configured return their default values: visible Regions and visible
  /// services return `null`, and account color returns `none`.
  /// <note>
  /// The <code>visibleServices</code> and <code>visibleRegions</code> settings
  /// control only the appearance of services and Regions in the Amazon Web
  /// Services Management Console. They do not restrict access through the CLI,
  /// SDKs, or other APIs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetAccountCustomizationsOutput> getAccountCustomizations() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/account-customizations',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountCustomizationsOutput.fromJson(response);
  }

  /// Returns a paginated list of Amazon Web Services service identifiers that
  /// you can use as values for the <code>visibleServices</code> setting in <a
  /// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/APIReference/API_UpdateAccountCustomizations.html">UpdateAccountCustomizations</a>.
  /// The available services vary by Amazon Web Services partition. Use
  /// pagination to retrieve all results.
  /// <note>
  /// The <code>visibleServices</code> setting controls only the appearance of
  /// services in the Amazon Web Services Management Console. It does not
  /// restrict access through the CLI, SDKs, or other APIs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. Use the
  /// <code>nextToken</code> value from a previous response.
  Future<ListServicesOutput> listServices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/services',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesOutput.fromJson(response);
  }

  /// Updates one or more account customization settings. You can update account
  /// color, visible services, and visible Regions in a single request. Only the
  /// settings that you include in the request body are modified. Omitted
  /// settings remain unchanged. To reset a setting to its default behavior, set
  /// the value to <code>null</code> for visible Regions and visible services,
  /// or <code>none</code> for account color. This operation is idempotent.
  /// <note>
  /// The <code>visibleServices</code> and <code>visibleRegions</code> settings
  /// control only the appearance of services and Regions in the Amazon Web
  /// Services Management Console. They do not restrict access through the CLI,
  /// SDKs, or other APIs.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountColor] :
  /// The account color preference to set. Set to <code>none</code> to reset to
  /// the default (no color).
  ///
  /// Parameter [visibleRegions] :
  /// The list of Amazon Web Services Region codes to make visible in the Amazon
  /// Web Services Management Console. Set to <code>null</code> to reset to the
  /// default, which makes all Regions visible. For a list of valid Region
  /// codes, see <a
  /// href="https://docs.aws.amazon.com/global-infrastructure/latest/regions/aws-regions.html">Amazon
  /// Web Services Regions</a>.
  ///
  /// Parameter [visibleServices] :
  /// The list of Amazon Web Services service identifiers to make visible in the
  /// Amazon Web Services Management Console. Set to <code>null</code> to reset
  /// to the default, which makes all services visible. For valid service
  /// identifiers, call <a
  /// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/APIReference/API_ListServices.html">ListServices</a>.
  Future<UpdateAccountCustomizationsOutput> updateAccountCustomizations({
    AccountColor? accountColor,
    List<String>? visibleRegions,
    List<String>? visibleServices,
  }) async {
    final $payload = <String, dynamic>{
      if (accountColor != null) 'accountColor': accountColor.value,
      if (visibleRegions != null) 'visibleRegions': visibleRegions,
      if (visibleServices != null) 'visibleServices': visibleServices,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v1/account-customizations',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountCustomizationsOutput.fromJson(response);
  }
}

/// @nodoc
class GetAccountCustomizationsOutput {
  /// The account color preference. A value of <code>none</code> indicates that
  /// you have not set a color.
  final AccountColor? accountColor;

  /// The list of Amazon Web Services Region codes that are visible to the account
  /// in the Amazon Web Services Management Console. A value of <code>null</code>
  /// indicates that you have not configured this feature and all Regions are
  /// visible. For a list of valid Region codes, see <a
  /// href="https://docs.aws.amazon.com/global-infrastructure/latest/regions/aws-regions.html">Amazon
  /// Web Services Regions</a>.
  final List<String>? visibleRegions;

  /// The list of Amazon Web Services service identifiers that are visible to the
  /// account in the Amazon Web Services Management Console. A value of
  /// <code>null</code> indicates that you have not configured this feature and
  /// all services are visible. For valid service identifiers, call <a
  /// href="https://docs.aws.amazon.com/awsconsolehelpdocs/latest/APIReference/API_ListServices.html">ListServices</a>.
  final List<String>? visibleServices;

  GetAccountCustomizationsOutput({
    this.accountColor,
    this.visibleRegions,
    this.visibleServices,
  });

  factory GetAccountCustomizationsOutput.fromJson(Map<String, dynamic> json) {
    return GetAccountCustomizationsOutput(
      accountColor:
          (json['accountColor'] as String?)?.let(AccountColor.fromString),
      visibleRegions: (json['visibleRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      visibleServices: (json['visibleServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountColor = this.accountColor;
    final visibleRegions = this.visibleRegions;
    final visibleServices = this.visibleServices;
    return {
      if (accountColor != null) 'accountColor': accountColor.value,
      if (visibleRegions != null) 'visibleRegions': visibleRegions,
      if (visibleServices != null) 'visibleServices': visibleServices,
    };
  }
}

/// @nodoc
class ListServicesOutput {
  /// The token for retrieving the next page of results. This value is
  /// <code>null</code> when no more results are available.
  final String? nextToken;

  /// The list of available Amazon Web Services service identifiers.
  final List<String>? services;

  ListServicesOutput({
    this.nextToken,
    this.services,
  });

  factory ListServicesOutput.fromJson(Map<String, dynamic> json) {
    return ListServicesOutput(
      nextToken: json['nextToken'] as String?,
      services: (json['services'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final services = this.services;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (services != null) 'services': services,
    };
  }
}

/// @nodoc
class UpdateAccountCustomizationsOutput {
  /// The current account color preference after the update.
  final AccountColor? accountColor;

  /// The current list of visible Region codes after the update.
  final List<String>? visibleRegions;

  /// The current list of visible service identifiers after the update.
  final List<String>? visibleServices;

  UpdateAccountCustomizationsOutput({
    this.accountColor,
    this.visibleRegions,
    this.visibleServices,
  });

  factory UpdateAccountCustomizationsOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateAccountCustomizationsOutput(
      accountColor:
          (json['accountColor'] as String?)?.let(AccountColor.fromString),
      visibleRegions: (json['visibleRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      visibleServices: (json['visibleServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountColor = this.accountColor;
    final visibleRegions = this.visibleRegions;
    final visibleServices = this.visibleServices;
    return {
      if (accountColor != null) 'accountColor': accountColor.value,
      if (visibleRegions != null) 'visibleRegions': visibleRegions,
      if (visibleServices != null) 'visibleServices': visibleServices,
    };
  }
}

/// @nodoc
class AccountColor {
  static const none = AccountColor._('none');
  static const pink = AccountColor._('pink');
  static const purple = AccountColor._('purple');
  static const darkBlue = AccountColor._('darkBlue');
  static const lightBlue = AccountColor._('lightBlue');
  static const teal = AccountColor._('teal');
  static const green = AccountColor._('green');
  static const yellow = AccountColor._('yellow');
  static const orange = AccountColor._('orange');
  static const red = AccountColor._('red');

  final String value;

  const AccountColor._(this.value);

  static const values = [
    none,
    pink,
    purple,
    darkBlue,
    lightBlue,
    teal,
    green,
    yellow,
    orange,
    red
  ];

  static AccountColor fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccountColor._(value));

  @override
  bool operator ==(other) => other is AccountColor && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
