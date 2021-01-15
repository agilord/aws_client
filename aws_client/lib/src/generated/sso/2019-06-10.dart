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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2019-06-10.g.dart';

/// AWS Single Sign-On Portal is a web service that makes it easy for you to
/// assign user access to AWS SSO resources such as the user portal. Users can
/// get AWS account applications and roles assigned to them and get federated
/// into the application.
///
/// For general information about AWS SSO, see <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">What
/// is AWS Single Sign-On?</a> in the <i>AWS SSO User Guide</i>.
///
/// This API reference guide describes the AWS SSO Portal operations that you
/// can call programatically and includes detailed information on data types and
/// errors.
/// <note>
/// AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms, such as Java, Ruby, .Net, iOS, or
/// Android. The SDKs provide a convenient way to create programmatic access to
/// AWS SSO and other AWS services. For more information about the AWS SDKs,
/// including how to download and install them, see <a
/// href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.
/// </note>
class Sso {
  final _s.RestJsonProtocol _protocol;
  Sso({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'portal.sso',
            signingName: 'awsssoportal',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns the STS short-term credentials for a given role name that is
  /// assigned to the user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accessToken] :
  /// The token issued by the <code>CreateToken</code> API call. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html">CreateToken</a>
  /// in the <i>AWS SSO OIDC API Reference Guide</i>.
  ///
  /// Parameter [accountId] :
  /// The identifier for the AWS account that is assigned to the user.
  ///
  /// Parameter [roleName] :
  /// The friendly name of the role that is assigned to the user.
  Future<GetRoleCredentialsResponse> getRoleCredentials({
    @_s.required String accessToken,
    @_s.required String accountId,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(roleName, 'roleName');
    final headers = <String, String>{};
    accessToken?.let((v) => headers['x-amz-sso_bearer_token'] = v.toString());
    final $query = <String, List<String>>{
      if (accountId != null) 'account_id': [accountId],
      if (roleName != null) 'role_name': [roleName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/federation/credentials',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetRoleCredentialsResponse.fromJson(response);
  }

  /// Lists all roles that are assigned to the user for a given AWS account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accessToken] :
  /// The token issued by the <code>CreateToken</code> API call. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html">CreateToken</a>
  /// in the <i>AWS SSO OIDC API Reference Guide</i>.
  ///
  /// Parameter [accountId] :
  /// The identifier for the AWS account that is assigned to the user.
  ///
  /// Parameter [maxResults] :
  /// The number of items that clients can request per page.
  ///
  /// Parameter [nextToken] :
  /// The page token from the previous response output when you request
  /// subsequent pages.
  Future<ListAccountRolesResponse> listAccountRoles({
    @_s.required String accessToken,
    @_s.required String accountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{};
    accessToken?.let((v) => headers['x-amz-sso_bearer_token'] = v.toString());
    final $query = <String, List<String>>{
      if (accountId != null) 'account_id': [accountId],
      if (maxResults != null) 'max_result': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assignment/roles',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountRolesResponse.fromJson(response);
  }

  /// Lists all AWS accounts assigned to the user. These AWS accounts are
  /// assigned by the administrator of the account. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/useraccess.html#assignusers">Assign
  /// User Access</a> in the <i>AWS SSO User Guide</i>. This operation returns a
  /// paginated response.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [accessToken] :
  /// The token issued by the <code>CreateToken</code> API call. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html">CreateToken</a>
  /// in the <i>AWS SSO OIDC API Reference Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// This is the number of items clients can request per page.
  ///
  /// Parameter [nextToken] :
  /// (Optional) When requesting subsequent pages, this is the page token from
  /// the previous response output.
  Future<ListAccountsResponse> listAccounts({
    @_s.required String accessToken,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{};
    accessToken?.let((v) => headers['x-amz-sso_bearer_token'] = v.toString());
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_result': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assignment/accounts',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountsResponse.fromJson(response);
  }

  /// Removes the client- and server-side session that is associated with the
  /// user.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [accessToken] :
  /// The token issued by the <code>CreateToken</code> API call. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html">CreateToken</a>
  /// in the <i>AWS SSO OIDC API Reference Guide</i>.
  Future<void> logout({
    @_s.required String accessToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    final headers = <String, String>{};
    accessToken?.let((v) => headers['x-amz-sso_bearer_token'] = v.toString());
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/logout',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Provides information about your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountInfo {
  /// The identifier of the AWS account that is assigned to the user.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The display name of the AWS account that is assigned to the user.
  @_s.JsonKey(name: 'accountName')
  final String accountName;

  /// The email address of the AWS account that is assigned to the user.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  AccountInfo({
    this.accountId,
    this.accountName,
    this.emailAddress,
  });
  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRoleCredentialsResponse {
  /// The credentials for the role that is assigned to the user.
  @_s.JsonKey(name: 'roleCredentials')
  final RoleCredentials roleCredentials;

  GetRoleCredentialsResponse({
    this.roleCredentials,
  });
  factory GetRoleCredentialsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoleCredentialsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountRolesResponse {
  /// The page token client that is used to retrieve the list of accounts.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A paginated response with the list of roles and the next token if more
  /// results are available.
  @_s.JsonKey(name: 'roleList')
  final List<RoleInfo> roleList;

  ListAccountRolesResponse({
    this.nextToken,
    this.roleList,
  });
  factory ListAccountRolesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountRolesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountsResponse {
  /// A paginated response with the list of account information and the next token
  /// if more results are available.
  @_s.JsonKey(name: 'accountList')
  final List<AccountInfo> accountList;

  /// The page token client that is used to retrieve the list of accounts.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAccountsResponse({
    this.accountList,
    this.nextToken,
  });
  factory ListAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountsResponseFromJson(json);
}

/// Provides information about the role credentials that are assigned to the
/// user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoleCredentials {
  /// The identifier used for the temporary security credentials. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html">Using
  /// Temporary Security Credentials to Request Access to AWS Resources</a> in the
  /// <i>AWS IAM User Guide</i>.
  @_s.JsonKey(name: 'accessKeyId')
  final String accessKeyId;

  /// The date on which temporary security credentials expire.
  @_s.JsonKey(name: 'expiration')
  final int expiration;

  /// The key that is used to sign the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html">Using
  /// Temporary Security Credentials to Request Access to AWS Resources</a> in the
  /// <i>AWS IAM User Guide</i>.
  @_s.JsonKey(name: 'secretAccessKey')
  final String secretAccessKey;

  /// The token used for temporary credentials. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html">Using
  /// Temporary Security Credentials to Request Access to AWS Resources</a> in the
  /// <i>AWS IAM User Guide</i>.
  @_s.JsonKey(name: 'sessionToken')
  final String sessionToken;

  RoleCredentials({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
  });
  factory RoleCredentials.fromJson(Map<String, dynamic> json) =>
      _$RoleCredentialsFromJson(json);
}

/// Provides information about the role that is assigned to the user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoleInfo {
  /// The identifier of the AWS account assigned to the user.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The friendly name of the role that is assigned to the user.
  @_s.JsonKey(name: 'roleName')
  final String roleName;

  RoleInfo({
    this.accountId,
    this.roleName,
  });
  factory RoleInfo.fromJson(Map<String, dynamic> json) =>
      _$RoleInfoFromJson(json);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
