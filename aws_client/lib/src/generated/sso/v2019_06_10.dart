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

/// AWS IAM Identity Center (successor to AWS Single Sign-On) Portal is a web
/// service that makes it easy for you to assign user access to IAM Identity
/// Center resources such as the AWS access portal. Users can get AWS account
/// applications and roles assigned to them and get federated into the
/// application.
/// <note>
/// Although AWS Single Sign-On was renamed, the <code>sso</code> and
/// <code>identitystore</code> API namespaces will continue to retain their
/// original name for backward compatibility purposes. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html#renamed">IAM
/// Identity Center rename</a>.
/// </note>
/// This reference guide describes the IAM Identity Center Portal operations
/// that you can call programatically and includes detailed information on data
/// types and errors.
/// <note>
/// AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms, such as Java, Ruby, .Net, iOS, or
/// Android. The SDKs provide a convenient way to create programmatic access to
/// IAM Identity Center and other AWS services. For more information about the
/// AWS SDKs, including how to download and install them, see <a
/// href="http://aws.amazon.com/tools/">Tools for Amazon Web Services</a>.
/// </note>
class Sso {
  final _s.RestJsonProtocol _protocol;
  Sso({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'portal.sso',
            signingName: 'awsssoportal',
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
  /// in the <i>IAM Identity Center OIDC API Reference Guide</i>.
  ///
  /// Parameter [accountId] :
  /// The identifier for the AWS account that is assigned to the user.
  ///
  /// Parameter [roleName] :
  /// The friendly name of the role that is assigned to the user.
  Future<GetRoleCredentialsResponse> getRoleCredentials({
    required String accessToken,
    required String accountId,
    required String roleName,
  }) async {
    final headers = <String, String>{
      'x-amz-sso_bearer_token': accessToken.toString(),
    };
    final $query = <String, List<String>>{
      'account_id': [accountId],
      'role_name': [roleName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/federation/credentials',
      signed: false,
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
  /// in the <i>IAM Identity Center OIDC API Reference Guide</i>.
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
    required String accessToken,
    required String accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'x-amz-sso_bearer_token': accessToken.toString(),
    };
    final $query = <String, List<String>>{
      'account_id': [accountId],
      if (maxResults != null) 'max_result': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assignment/roles',
      signed: false,
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountRolesResponse.fromJson(response);
  }

  /// Lists all AWS accounts assigned to the user. These AWS accounts are
  /// assigned by the administrator of the account. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/useraccess.html#assignusers">Assign
  /// User Access</a> in the <i>IAM Identity Center User Guide</i>. This
  /// operation returns a paginated response.
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
  /// in the <i>IAM Identity Center OIDC API Reference Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// This is the number of items clients can request per page.
  ///
  /// Parameter [nextToken] :
  /// (Optional) When requesting subsequent pages, this is the page token from
  /// the previous response output.
  Future<ListAccountsResponse> listAccounts({
    required String accessToken,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'x-amz-sso_bearer_token': accessToken.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max_result': [maxResults.toString()],
      if (nextToken != null) 'next_token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assignment/accounts',
      signed: false,
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountsResponse.fromJson(response);
  }

  /// Removes the locally stored SSO tokens from the client-side cache and sends
  /// an API call to the IAM Identity Center service to invalidate the
  /// corresponding server-side IAM Identity Center sign in session.
  /// <note>
  /// If a user uses IAM Identity Center to access the AWS CLI, the user’s IAM
  /// Identity Center sign in session is used to obtain an IAM session, as
  /// specified in the corresponding IAM Identity Center permission set. More
  /// specifically, IAM Identity Center assumes an IAM role in the target
  /// account on behalf of the user, and the corresponding temporary AWS
  /// credentials are returned to the client.
  ///
  /// After user logout, any existing IAM role sessions that were created by
  /// using IAM Identity Center permission sets continue based on the duration
  /// configured in the permission set. For more information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/userguide/authconcept.html">User
  /// authentications</a> in the <i>IAM Identity Center User Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [accessToken] :
  /// The token issued by the <code>CreateToken</code> API call. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/singlesignon/latest/OIDCAPIReference/API_CreateToken.html">CreateToken</a>
  /// in the <i>IAM Identity Center OIDC API Reference Guide</i>.
  Future<void> logout({
    required String accessToken,
  }) async {
    final headers = <String, String>{
      'x-amz-sso_bearer_token': accessToken.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/logout',
      signed: false,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Provides information about your AWS account.
class AccountInfo {
  /// The identifier of the AWS account that is assigned to the user.
  final String? accountId;

  /// The display name of the AWS account that is assigned to the user.
  final String? accountName;

  /// The email address of the AWS account that is assigned to the user.
  final String? emailAddress;

  AccountInfo({
    this.accountId,
    this.accountName,
    this.emailAddress,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      accountId: json['accountId'] as String?,
      accountName: json['accountName'] as String?,
      emailAddress: json['emailAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountName = this.accountName;
    final emailAddress = this.emailAddress;
    return {
      if (accountId != null) 'accountId': accountId,
      if (accountName != null) 'accountName': accountName,
      if (emailAddress != null) 'emailAddress': emailAddress,
    };
  }
}

class GetRoleCredentialsResponse {
  /// The credentials for the role that is assigned to the user.
  final RoleCredentials? roleCredentials;

  GetRoleCredentialsResponse({
    this.roleCredentials,
  });

  factory GetRoleCredentialsResponse.fromJson(Map<String, dynamic> json) {
    return GetRoleCredentialsResponse(
      roleCredentials: json['roleCredentials'] != null
          ? RoleCredentials.fromJson(
              json['roleCredentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roleCredentials = this.roleCredentials;
    return {
      if (roleCredentials != null) 'roleCredentials': roleCredentials,
    };
  }
}

class ListAccountRolesResponse {
  /// The page token client that is used to retrieve the list of accounts.
  final String? nextToken;

  /// A paginated response with the list of roles and the next token if more
  /// results are available.
  final List<RoleInfo>? roleList;

  ListAccountRolesResponse({
    this.nextToken,
    this.roleList,
  });

  factory ListAccountRolesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountRolesResponse(
      nextToken: json['nextToken'] as String?,
      roleList: (json['roleList'] as List?)
          ?.whereNotNull()
          .map((e) => RoleInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final roleList = this.roleList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (roleList != null) 'roleList': roleList,
    };
  }
}

class ListAccountsResponse {
  /// A paginated response with the list of account information and the next token
  /// if more results are available.
  final List<AccountInfo>? accountList;

  /// The page token client that is used to retrieve the list of accounts.
  final String? nextToken;

  ListAccountsResponse({
    this.accountList,
    this.nextToken,
  });

  factory ListAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountsResponse(
      accountList: (json['accountList'] as List?)
          ?.whereNotNull()
          .map((e) => AccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountList = this.accountList;
    final nextToken = this.nextToken;
    return {
      if (accountList != null) 'accountList': accountList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Provides information about the role credentials that are assigned to the
/// user.
class RoleCredentials {
  /// The identifier used for the temporary security credentials. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html">Using
  /// Temporary Security Credentials to Request Access to AWS Resources</a> in the
  /// <i>AWS IAM User Guide</i>.
  final String? accessKeyId;

  /// The date on which temporary security credentials expire.
  final int? expiration;

  /// The key that is used to sign the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html">Using
  /// Temporary Security Credentials to Request Access to AWS Resources</a> in the
  /// <i>AWS IAM User Guide</i>.
  final String? secretAccessKey;

  /// The token used for temporary credentials. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_use-resources.html">Using
  /// Temporary Security Credentials to Request Access to AWS Resources</a> in the
  /// <i>AWS IAM User Guide</i>.
  final String? sessionToken;

  RoleCredentials({
    this.accessKeyId,
    this.expiration,
    this.secretAccessKey,
    this.sessionToken,
  });

  factory RoleCredentials.fromJson(Map<String, dynamic> json) {
    return RoleCredentials(
      accessKeyId: json['accessKeyId'] as String?,
      expiration: json['expiration'] as int?,
      secretAccessKey: json['secretAccessKey'] as String?,
      sessionToken: json['sessionToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (expiration != null) 'expiration': expiration,
      if (secretAccessKey != null) 'secretAccessKey': secretAccessKey,
      if (sessionToken != null) 'sessionToken': sessionToken,
    };
  }
}

/// Provides information about the role that is assigned to the user.
class RoleInfo {
  /// The identifier of the AWS account assigned to the user.
  final String? accountId;

  /// The friendly name of the role that is assigned to the user.
  final String? roleName;

  RoleInfo({
    this.accountId,
    this.roleName,
  });

  factory RoleInfo.fromJson(Map<String, dynamic> json) {
    return RoleInfo(
      accountId: json['accountId'] as String?,
      roleName: json['roleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final roleName = this.roleName;
    return {
      if (accountId != null) 'accountId': accountId,
      if (roleName != null) 'roleName': roleName,
    };
  }
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
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
